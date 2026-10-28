-file("src/data/guard_data.erl", 1).

-module(guard_data).

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

-file("src/data/guard_data.erl", 14).

-file("inc/guard.hrl", 1).

-record(m_guard,
        {ver = 1 :: pos_integer(),
         free_war_ids = [] :: [pos_integer()],
         tactics_fields = [] :: list(),
         tactics_attr = [] :: list(),
         guards = [] :: list()}).

-record(guard_eqm,
        {ver = 5,
         base_id :: undefined | non_neg_integer(),
         type :: undefined | non_neg_integer(),
         lev,
         eqm_attrs = [] :: list(),
         reset_base_id = 0,
         reset_attrs = [] :: list(),
         gem = [] :: list(),
         is_init = 1,
         timeout = 0,
         back_effect_timeout = 0,
         back_effect_attr = []}).

-record(guard_astroid,
        {ver = 2 :: non_neg_integer(),
         aroused = [] :: non_neg_integer(),
         skills = [] :: list(),
         attrs = [] :: list(),
         growth = 0 :: non_neg_integer(),
         active = 0 :: non_neg_integer()}).

-record(guard_astroid_star,
        {ver = 0,
         id = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         attrs = [] :: list()}).

-record(guard,
        {ver = 2,
         base_id = 0 :: non_neg_integer(),
         war_id = 0 :: non_neg_integer(),
         name = "" :: string(),
         alias = "" :: string(),
         classes = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         tac_pos = 0 :: non_neg_integer(),
         skills = [] :: list(),
         eqm = [] :: list(),
         attr :: undefined | tuple(),
         score = 0 :: non_neg_integer(),
         astroid = #guard_astroid{} :: #guard_astroid{}}).

-record(guard_data,
        {base_id = 0 :: non_neg_integer(),
         name = "" :: binary(),
         alias = "" :: binary(),
         classes = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         loss = [] :: tuple(),
         recruit_lev = 1 :: non_neg_integer(),
         desc = "" :: list(),
         normal_atk_id = 0 :: integer(),
         ai_id = 0 :: integer(),
         base_score = 0,
         growth = 0 :: non_neg_integer()}).

-record(guard_eqm_data,
        {base_id = 0 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         loss_coin = 0 :: [tuple()],
         reset_coin = 0 :: [tuple()],
         gem_list = [] :: list()}).

-record(guard_lev_data,
        {base_id :: undefined | non_neg_integer(),
         lev :: undefined | non_neg_integer(),
         lev_up_exp :: undefined | non_neg_integer(),
         attrs = [] :: non_neg_integer()}).

-record(guard_eqm_gem,
        {id = 0, base_id = 0, type = 0, lev = 0}).

-record(guard_eqm_gem_data,
        {base_id = 0,
         next_base_id = 0,
         name = "",
         lev = 0,
         type = 0,
         need_lev = 0,
         loss_coin = [],
         attrs = []}).

-file("src/data/guard_data.erl", 15).

-file("inc/gain.hrl", 1).

-record(gain,
        {label :: undefined | atom(),
         val :: undefined | term(),
         msg = "" :: list(),
         source = 0 :: non_neg_integer(),
         notice_msg = "" :: list(),
         reason :: undefined | atom(),
         ext = 0 :: term(),
         notice = 0 :: 0..1,
         ext_val = 0}).

-record(loss,
        {label :: undefined | atom(),
         val :: undefined | term(),
         msg = "" :: list(),
         notice_msg = "" :: list(),
         source = 0 :: non_neg_integer(),
         reason :: undefined | atom(),
         ext = 0 :: term(),
         ext_val = 0,
         auto_scene = "" :: list()}).

-record(gain_text_opts,
        {order = loss :: gain | loss,
         gain_tag = "" :: string(),
         loss_tag = "" :: string(),
         split_str = "，" :: string(),
         split_op_str = "，" :: string(),
         merge_type = [] :: list(),
         fly_to_bag = 0 :: non_neg_integer()}).

-file("src/data/guard_data.erl", 16).

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

-file("src/data/guard_data.erl", 17).

-file("inc/condition.hrl", 1).

-record(condition,
        {label :: undefined | atom(),
         op = eq ::
             ue | eq | lt | gt | le | ge | range | include,
         val :: undefined | term(),
         msg = "" :: list()}).

-file("src/data/guard_data.erl", 18).

-export([get_guard_cfg/1,
         get_guard_list/0,
         get_lev_cfg/1,
         get_skills/1,
         get_tactics/0,
         get_tactic_pos_attr/1,
         get_eqm_by_id/1,
         get_eqm_by_lev/1,
         get_base_attr/2,
         get_base_ratio/0,
         get_first_base/1,
         get_first_step/0,
         get_first_type/0,
         get_score/1,
         get_eqm_gem/1,
         get_eqm_gem2/1,
         get_embed_type/1,
         get_point_attr/1,
         get_effect_attr/1,
         model/1,
         get_astroid_active/1,
         get_astroid/1,
         get_astroid_upgrade/1,
         get_astroid_arouse_rate/1,
         get_base_args/1,
         get_marking/1]).

get_guard_cfg(1002) ->
    #guard_data{base_id = 1002, name = lang:get("菲雅"),
                alias = lang:get("菲雅"), classes = 1, quality = 1,
                loss = [#loss{label = coin, val = 50000}],
                recruit_lev = 8, normal_atk_id = 1125, ai_id = 90001,
                base_score = 180, growth = 320};
get_guard_cfg(1012) ->
    #guard_data{base_id = 1012, name = lang:get("蓝雯"),
                alias = lang:get("蓝雯"), classes = 2, quality = 1,
                loss = [#loss{label = coin, val = 80000}],
                recruit_lev = 16, normal_atk_id = 1110, ai_id = 90005,
                base_score = 207, growth = 380};
get_guard_cfg(1008) ->
    #guard_data{base_id = 1008, name = lang:get("琴雅"),
                alias = lang:get("琴雅"), classes = 5, quality = 1,
                loss = [#loss{label = coin, val = 100000}],
                recruit_lev = 23, normal_atk_id = 1115, ai_id = 90009,
                base_score = 234, growth = 440};
get_guard_cfg(1018) ->
    #guard_data{base_id = 1018, name = lang:get("凯恩"),
                alias = lang:get("凯恩"), classes = 4, quality = 1,
                loss = [#loss{label = coin, val = 120000}],
                recruit_lev = 32, normal_atk_id = 1111, ai_id = 90006,
                base_score = 261, growth = 500};
get_guard_cfg(1020) ->
    #guard_data{base_id = 1020, name = lang:get("阿瑞斯"),
                alias = lang:get("阿瑞斯"), classes = 3, quality = 2,
                loss = [#loss{label = coin, val = 200000}],
                recruit_lev = 39, normal_atk_id = 1116, ai_id = 90010,
                base_score = 288, growth = 680};
get_guard_cfg(1014) ->
    #guard_data{base_id = 1014, name = lang:get("福波斯"),
                alias = lang:get("福波斯"), classes = 2, quality = 2,
                loss = [#loss{label = coin, val = 400000}],
                recruit_lev = 46, normal_atk_id = 1117, ai_id = 90011,
                base_score = 315, growth = 680};
get_guard_cfg(1010) ->
    #guard_data{base_id = 1010, name = lang:get("露露"),
                alias = lang:get("露露"), classes = 5, quality = 2,
                loss = [#loss{label = coin, val = 800000}],
                recruit_lev = 52, normal_atk_id = 1109, ai_id = 90004,
                base_score = 342, growth = 780};
get_guard_cfg(1019) ->
    #guard_data{base_id = 1019, name = lang:get("佛格瑞特"),
                alias = lang:get("佛格瑞特"), classes = 4, quality = 2,
                loss = [#loss{label = coin, val = 2000000}],
                recruit_lev = 58, normal_atk_id = 1118, ai_id = 90018,
                base_score = 369, growth = 780};
get_guard_cfg(1023) ->
    #guard_data{base_id = 1023, name = lang:get("姬"),
                alias = lang:get("姬"), classes = 5, quality = 3,
                loss =
                    [#loss{label = item_base_id_auto_buy,
                           val = [{20017, 6}]}],
                recruit_lev = 64, normal_atk_id = 1120, ai_id = 90014,
                base_score = 396, growth = 880};
get_guard_cfg(1013) ->
    #guard_data{base_id = 1013, name = lang:get("莉娜"),
                alias = lang:get("莉娜"), classes = 2, quality = 3,
                loss =
                    [#loss{label = item_base_id_auto_buy,
                           val = [{20017, 8}]}],
                recruit_lev = 70, normal_atk_id = 1113, ai_id = 90019,
                base_score = 423, growth = 880};
get_guard_cfg(1006) ->
    #guard_data{base_id = 1006, name = lang:get("无名"),
                alias = lang:get("无名"), classes = 1, quality = 3,
                loss =
                    [#loss{label = item_base_id_auto_buy,
                           val = [{20017, 10}]}],
                recruit_lev = 76, normal_atk_id = 1123, ai_id = 90016,
                base_score = 460, growth = 1000};
get_guard_cfg(1021) ->
    #guard_data{base_id = 1021, name = lang:get("利贝尔二世"),
                alias = lang:get("利贝尔二世"), classes = 4, quality = 3,
                loss =
                    [#loss{label = item_base_id_auto_buy,
                           val = [{20018, 8}]}],
                recruit_lev = 82, normal_atk_id = 1121, ai_id = 90015,
                base_score = 460, growth = 1000};
get_guard_cfg(1022) ->
    #guard_data{base_id = 1022, name = lang:get("凯瑟琳"),
                alias = lang:get("凯瑟琳"), classes = 3, quality = 3,
                loss =
                    [#loss{label = item_base_id_auto_buy,
                           val = [{20018, 8}]}],
                recruit_lev = 86, normal_atk_id = 1103, ai_id = 90020,
                base_score = 460, growth = 1000};
get_guard_cfg(_) -> false.

get_guard_list() ->
    [#guard_data{base_id = 1002, name = lang:get("菲雅"),
                 alias = lang:get("菲雅"), classes = 1, quality = 1,
                 loss = [#loss{label = coin, val = 50000}],
                 recruit_lev = 8, normal_atk_id = 1125, ai_id = 90001,
                 base_score = 180, growth = 320},
     #guard_data{base_id = 1012, name = lang:get("蓝雯"),
                 alias = lang:get("蓝雯"), classes = 2, quality = 1,
                 loss = [#loss{label = coin, val = 80000}],
                 recruit_lev = 16, normal_atk_id = 1110, ai_id = 90005,
                 base_score = 207, growth = 380},
     #guard_data{base_id = 1008, name = lang:get("琴雅"),
                 alias = lang:get("琴雅"), classes = 5, quality = 1,
                 loss = [#loss{label = coin, val = 100000}],
                 recruit_lev = 23, normal_atk_id = 1115, ai_id = 90009,
                 base_score = 234, growth = 440},
     #guard_data{base_id = 1018, name = lang:get("凯恩"),
                 alias = lang:get("凯恩"), classes = 4, quality = 1,
                 loss = [#loss{label = coin, val = 120000}],
                 recruit_lev = 32, normal_atk_id = 1111, ai_id = 90006,
                 base_score = 261, growth = 500},
     #guard_data{base_id = 1020, name = lang:get("阿瑞斯"),
                 alias = lang:get("阿瑞斯"), classes = 3, quality = 2,
                 loss = [#loss{label = coin, val = 200000}],
                 recruit_lev = 39, normal_atk_id = 1116, ai_id = 90010,
                 base_score = 288, growth = 680},
     #guard_data{base_id = 1014, name = lang:get("福波斯"),
                 alias = lang:get("福波斯"), classes = 2, quality = 2,
                 loss = [#loss{label = coin, val = 400000}],
                 recruit_lev = 46, normal_atk_id = 1117, ai_id = 90011,
                 base_score = 315, growth = 680},
     #guard_data{base_id = 1010, name = lang:get("露露"),
                 alias = lang:get("露露"), classes = 5, quality = 2,
                 loss = [#loss{label = coin, val = 800000}],
                 recruit_lev = 52, normal_atk_id = 1109, ai_id = 90004,
                 base_score = 342, growth = 780},
     #guard_data{base_id = 1019, name = lang:get("佛格瑞特"),
                 alias = lang:get("佛格瑞特"), classes = 4, quality = 2,
                 loss = [#loss{label = coin, val = 2000000}],
                 recruit_lev = 58, normal_atk_id = 1118, ai_id = 90018,
                 base_score = 369, growth = 780},
     #guard_data{base_id = 1023, name = lang:get("姬"),
                 alias = lang:get("姬"), classes = 5, quality = 3,
                 loss =
                     [#loss{label = item_base_id_auto_buy,
                            val = [{20017, 6}]}],
                 recruit_lev = 64, normal_atk_id = 1120, ai_id = 90014,
                 base_score = 396, growth = 880},
     #guard_data{base_id = 1013, name = lang:get("莉娜"),
                 alias = lang:get("莉娜"), classes = 2, quality = 3,
                 loss =
                     [#loss{label = item_base_id_auto_buy,
                            val = [{20017, 8}]}],
                 recruit_lev = 70, normal_atk_id = 1113, ai_id = 90019,
                 base_score = 423, growth = 880},
     #guard_data{base_id = 1006, name = lang:get("无名"),
                 alias = lang:get("无名"), classes = 1, quality = 3,
                 loss =
                     [#loss{label = item_base_id_auto_buy,
                            val = [{20017, 10}]}],
                 recruit_lev = 76, normal_atk_id = 1123, ai_id = 90016,
                 base_score = 460, growth = 1000},
     #guard_data{base_id = 1021, name = lang:get("利贝尔二世"),
                 alias = lang:get("利贝尔二世"), classes = 4, quality = 3,
                 loss =
                     [#loss{label = item_base_id_auto_buy,
                            val = [{20018, 8}]}],
                 recruit_lev = 82, normal_atk_id = 1121, ai_id = 90015,
                 base_score = 460, growth = 1000},
     #guard_data{base_id = 1022, name = lang:get("凯瑟琳"),
                 alias = lang:get("凯瑟琳"), classes = 3, quality = 3,
                 loss =
                     [#loss{label = item_base_id_auto_buy,
                            val = [{20018, 8}]}],
                 recruit_lev = 86, normal_atk_id = 1103, ai_id = 90020,
                 base_score = 460, growth = 1000}].

get_lev_cfg({1002, 1}) ->
    #{base_attrs =>
          [{1, 105},
           {4, 49},
           {5, 24},
           {6, 16},
           {7, 14},
           {3, 4},
           {2, 200},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 158}, {4, 74}, {5, 37}, {6, 24}, {7, 21}, {3, 6}]};
get_lev_cfg({1002, 2}) ->
    #{base_attrs =>
          [{1, 126},
           {4, 59},
           {5, 29},
           {6, 19},
           {7, 17},
           {3, 5},
           {2, 576},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 190}, {4, 89}, {5, 44}, {6, 29}, {7, 25}, {3, 8}]};
get_lev_cfg({1002, 3}) ->
    #{base_attrs =>
          [{1, 147},
           {4, 69},
           {5, 34},
           {6, 22},
           {7, 20},
           {3, 6},
           {2, 672},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 221},
           {4, 104},
           {5, 52},
           {6, 34},
           {7, 30},
           {3, 9}]};
get_lev_cfg({1002, 4}) ->
    #{base_attrs =>
          [{1, 168},
           {4, 79},
           {5, 39},
           {6, 25},
           {7, 23},
           {3, 7},
           {2, 767},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 253},
           {4, 119},
           {5, 59},
           {6, 38},
           {7, 34},
           {3, 11}]};
get_lev_cfg({1002, 5}) ->
    #{base_attrs =>
          [{1, 190},
           {4, 89},
           {5, 44},
           {6, 29},
           {7, 25},
           {3, 8},
           {2, 864},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 285},
           {4, 134},
           {5, 66},
           {6, 43},
           {7, 38},
           {3, 12}]};
get_lev_cfg({1002, 6}) ->
    #{base_attrs =>
          [{1, 211},
           {4, 99},
           {5, 49},
           {6, 32},
           {7, 28},
           {3, 9},
           {2, 960},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 316},
           {4, 149},
           {5, 74},
           {6, 48},
           {7, 43},
           {3, 13}]};
get_lev_cfg({1002, 7}) ->
    #{base_attrs =>
          [{1, 232},
           {4, 109},
           {5, 54},
           {6, 35},
           {7, 31},
           {3, 10},
           {2, 1055},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 348},
           {4, 164},
           {5, 81},
           {6, 53},
           {7, 47},
           {3, 15}]};
get_lev_cfg({1002, 8}) ->
    #{base_attrs =>
          [{1, 253},
           {4, 119},
           {5, 59},
           {6, 38},
           {7, 34},
           {3, 11},
           {2, 1152},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 380},
           {4, 179},
           {5, 89},
           {6, 58},
           {7, 51},
           {3, 16}]};
get_lev_cfg({1002, 9}) ->
    #{base_attrs =>
          [{1, 274},
           {4, 129},
           {5, 64},
           {6, 42},
           {7, 37},
           {3, 11},
           {2, 1248},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 411},
           {4, 194},
           {5, 96},
           {6, 63},
           {7, 56},
           {3, 17}]};
get_lev_cfg({1002, 10}) ->
    #{base_attrs =>
          [{1, 316},
           {4, 149},
           {5, 74},
           {6, 48},
           {7, 43},
           {3, 13},
           {2, 1440},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 475},
           {4, 224},
           {5, 111},
           {6, 72},
           {7, 64},
           {3, 20}]};
get_lev_cfg({1002, 11}) ->
    #{base_attrs =>
          [{1, 358},
           {4, 169},
           {5, 84},
           {6, 55},
           {7, 48},
           {3, 15},
           {2, 1631},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 538},
           {4, 254},
           {5, 126},
           {6, 82},
           {7, 73},
           {3, 23}]};
get_lev_cfg({1002, 12}) ->
    #{base_attrs =>
          [{1, 401},
           {4, 189},
           {5, 94},
           {6, 61},
           {7, 54},
           {3, 17},
           {2, 1824},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 601},
           {4, 284},
           {5, 141},
           {6, 92},
           {7, 82},
           {3, 26}]};
get_lev_cfg({1002, 13}) ->
    #{base_attrs =>
          [{1, 443},
           {4, 209},
           {5, 104},
           {6, 68},
           {7, 60},
           {3, 19},
           {2, 2016},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 665},
           {4, 314},
           {5, 156},
           {6, 102},
           {7, 90},
           {3, 29}]};
get_lev_cfg({1002, 14}) ->
    #{base_attrs =>
          [{1, 485},
           {4, 229},
           {5, 114},
           {6, 74},
           {7, 66},
           {3, 21},
           {2, 2207},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 728},
           {4, 344},
           {5, 171},
           {6, 111},
           {7, 99},
           {3, 31}]};
get_lev_cfg({1002, 15}) ->
    #{base_attrs =>
          [{1, 527},
           {4, 249},
           {5, 123},
           {6, 81},
           {7, 72},
           {3, 23},
           {2, 2400},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 791},
           {4, 374},
           {5, 185},
           {6, 121},
           {7, 108},
           {3, 34}]};
get_lev_cfg({1002, 16}) ->
    #{base_attrs =>
          [{1, 570},
           {4, 269},
           {5, 133},
           {6, 87},
           {7, 77},
           {3, 24},
           {2, 2408},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 855},
           {4, 403},
           {5, 200},
           {6, 131},
           {7, 116},
           {3, 37}]};
get_lev_cfg({1002, 17}) ->
    #{base_attrs =>
          [{1, 612},
           {4, 289},
           {5, 143},
           {6, 94},
           {7, 83},
           {3, 26},
           {2, 2417},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 918},
           {4, 433},
           {5, 215},
           {6, 141},
           {7, 125},
           {3, 40}]};
get_lev_cfg({1002, 18}) ->
    #{base_attrs =>
          [{1, 654},
           {4, 309},
           {5, 153},
           {6, 100},
           {7, 89},
           {3, 28},
           {2, 2426},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 981},
           {4, 463},
           {5, 230},
           {6, 150},
           {7, 133},
           {3, 42}]};
get_lev_cfg({1002, 19}) ->
    #{base_attrs =>
          [{1, 696},
           {4, 329},
           {5, 163},
           {6, 107},
           {7, 95},
           {3, 30},
           {2, 2436},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1045},
           {4, 493},
           {5, 245},
           {6, 160},
           {7, 142},
           {3, 45}]};
get_lev_cfg({1002, 20}) ->
    #{base_attrs =>
          [{1, 739},
           {4, 349},
           {5, 173},
           {6, 113},
           {7, 100},
           {3, 32},
           {2, 2446},
           {26, 2},
           {25, 2}],
      extra_attrs =>
          [{1, 1108},
           {4, 523},
           {5, 260},
           {6, 170},
           {7, 151},
           {3, 48}]};
get_lev_cfg({1002, 21}) ->
    #{base_attrs =>
          [{1, 781},
           {4, 369},
           {5, 183},
           {6, 119},
           {7, 106},
           {3, 34},
           {2, 2457},
           {26, 4},
           {25, 4}],
      extra_attrs =>
          [{1, 1171},
           {4, 553},
           {5, 275},
           {6, 179},
           {7, 159},
           {3, 51}]};
get_lev_cfg({1002, 22}) ->
    #{base_attrs =>
          [{1, 823},
           {4, 389},
           {5, 193},
           {6, 126},
           {7, 112},
           {3, 35},
           {2, 2468},
           {26, 6},
           {25, 6}],
      extra_attrs =>
          [{1, 1235},
           {4, 583},
           {5, 290},
           {6, 189},
           {7, 168},
           {3, 53}]};
get_lev_cfg({1002, 23}) ->
    #{base_attrs =>
          [{1, 865},
           {4, 408},
           {5, 203},
           {6, 132},
           {7, 118},
           {3, 37},
           {2, 2480},
           {26, 9},
           {25, 9}],
      extra_attrs =>
          [{1, 1298},
           {4, 613},
           {5, 305},
           {6, 199},
           {7, 177},
           {3, 56}]};
get_lev_cfg({1002, 24}) ->
    #{base_attrs =>
          [{1, 908},
           {4, 428},
           {5, 213},
           {6, 139},
           {7, 123},
           {3, 39},
           {2, 2492},
           {26, 11},
           {25, 11}],
      extra_attrs =>
          [{1, 1362},
           {4, 643},
           {5, 319},
           {6, 209},
           {7, 185},
           {3, 59}]};
get_lev_cfg({1002, 25}) ->
    #{base_attrs =>
          [{1, 950},
           {4, 448},
           {5, 223},
           {6, 145},
           {7, 129},
           {3, 41},
           {2, 2505},
           {26, 14},
           {25, 14}],
      extra_attrs =>
          [{1, 1425},
           {4, 673},
           {5, 334},
           {6, 218},
           {7, 194},
           {3, 62}]};
get_lev_cfg({1002, 26}) ->
    #{base_attrs =>
          [{1, 992},
           {4, 468},
           {5, 233},
           {6, 152},
           {7, 135},
           {3, 43},
           {2, 2518},
           {26, 16},
           {25, 16}],
      extra_attrs =>
          [{1, 1488},
           {4, 703},
           {5, 349},
           {6, 228},
           {7, 203},
           {3, 65}]};
get_lev_cfg({1002, 27}) ->
    #{base_attrs =>
          [{1, 1034},
           {4, 488},
           {5, 243},
           {6, 158},
           {7, 141},
           {3, 45},
           {2, 2532},
           {26, 18},
           {25, 18}],
      extra_attrs =>
          [{1, 1552},
           {4, 733},
           {5, 364},
           {6, 238},
           {7, 211},
           {3, 67}]};
get_lev_cfg({1002, 28}) ->
    #{base_attrs =>
          [{1, 1076},
           {4, 508},
           {5, 252},
           {6, 165},
           {7, 146},
           {3, 47},
           {2, 2546},
           {26, 21},
           {25, 21}],
      extra_attrs =>
          [{1, 1615},
           {4, 763},
           {5, 379},
           {6, 248},
           {7, 220},
           {3, 70}]};
get_lev_cfg({1002, 29}) ->
    #{base_attrs =>
          [{1, 1119},
           {4, 528},
           {5, 262},
           {6, 171},
           {7, 152},
           {3, 48},
           {2, 2561},
           {26, 23},
           {25, 23}],
      extra_attrs =>
          [{1, 1678},
           {4, 792},
           {5, 394},
           {6, 257},
           {7, 229},
           {3, 73}]};
get_lev_cfg({1002, 30}) ->
    #{base_attrs =>
          [{1, 1161},
           {4, 548},
           {5, 272},
           {6, 178},
           {7, 158},
           {3, 50},
           {2, 2576},
           {26, 26},
           {25, 26}],
      extra_attrs =>
          [{1, 1742},
           {4, 822},
           {5, 409},
           {6, 267},
           {7, 237},
           {3, 76}]};
get_lev_cfg({1002, 31}) ->
    #{base_attrs =>
          [{1, 1203},
           {4, 568},
           {5, 282},
           {6, 184},
           {7, 164},
           {3, 52},
           {2, 2592},
           {26, 28},
           {25, 28}],
      extra_attrs =>
          [{1, 1805},
           {4, 852},
           {5, 424},
           {6, 277},
           {7, 246},
           {3, 78}]};
get_lev_cfg({1002, 32}) ->
    #{base_attrs =>
          [{1, 1245},
           {4, 588},
           {5, 292},
           {6, 191},
           {7, 169},
           {3, 54},
           {2, 2608},
           {26, 30},
           {25, 30}],
      extra_attrs =>
          [{1, 1868},
           {4, 882},
           {5, 438},
           {6, 287},
           {7, 254},
           {3, 81}]};
get_lev_cfg({1002, 33}) ->
    #{base_attrs =>
          [{1, 1288},
           {4, 608},
           {5, 302},
           {6, 197},
           {7, 175},
           {3, 56},
           {2, 2625},
           {26, 33},
           {25, 33}],
      extra_attrs =>
          [{1, 1932},
           {4, 912},
           {5, 453},
           {6, 296},
           {7, 263},
           {3, 84}]};
get_lev_cfg({1002, 34}) ->
    #{base_attrs =>
          [{1, 1330},
           {4, 628},
           {5, 312},
           {6, 204},
           {7, 181},
           {3, 58},
           {2, 2642},
           {26, 35},
           {25, 35}],
      extra_attrs =>
          [{1, 1995},
           {4, 942},
           {5, 468},
           {6, 306},
           {7, 272},
           {3, 87}]};
get_lev_cfg({1002, 35}) ->
    #{base_attrs =>
          [{1, 1372},
           {4, 648},
           {5, 322},
           {6, 210},
           {7, 187},
           {3, 59},
           {2, 2660},
           {26, 38},
           {25, 38}],
      extra_attrs =>
          [{1, 2058},
           {4, 972},
           {5, 483},
           {6, 316},
           {7, 280},
           {3, 89}]};
get_lev_cfg({1002, 36}) ->
    #{base_attrs =>
          [{1, 1414},
           {4, 668},
           {5, 332},
           {6, 217},
           {7, 193},
           {3, 61},
           {2, 2678},
           {26, 40},
           {25, 40}],
      extra_attrs =>
          [{1, 2122},
           {4, 1002},
           {5, 498},
           {6, 325},
           {7, 289},
           {3, 92}]};
get_lev_cfg({1002, 37}) ->
    #{base_attrs =>
          [{1, 1457},
           {4, 688},
           {5, 342},
           {6, 223},
           {7, 198},
           {3, 63},
           {2, 2697},
           {26, 42},
           {25, 42}],
      extra_attrs =>
          [{1, 2185},
           {4, 1032},
           {5, 513},
           {6, 335},
           {7, 298},
           {3, 95}]};
get_lev_cfg({1002, 38}) ->
    #{base_attrs =>
          [{1, 1499},
           {4, 708},
           {5, 352},
           {6, 230},
           {7, 204},
           {3, 65},
           {2, 2716},
           {26, 45},
           {25, 45}],
      extra_attrs =>
          [{1, 2248},
           {4, 1062},
           {5, 528},
           {6, 345},
           {7, 306},
           {3, 98}]};
get_lev_cfg({1002, 39}) ->
    #{base_attrs =>
          [{1, 1541},
           {4, 728},
           {5, 362},
           {6, 236},
           {7, 210},
           {3, 67},
           {2, 2736},
           {26, 47},
           {25, 47}],
      extra_attrs =>
          [{1, 2312},
           {4, 1092},
           {5, 543},
           {6, 355},
           {7, 315},
           {3, 101}]};
get_lev_cfg({1002, 40}) ->
    #{base_attrs =>
          [{1, 1583},
           {4, 748},
           {5, 371},
           {6, 243},
           {7, 216},
           {3, 69},
           {2, 2756},
           {26, 50},
           {25, 50}],
      extra_attrs =>
          [{1, 2375},
           {4, 1122},
           {5, 557},
           {6, 364},
           {7, 324},
           {3, 103}]};
get_lev_cfg({1002, 41}) ->
    #{base_attrs =>
          [{1, 1625},
           {4, 768},
           {5, 381},
           {6, 249},
           {7, 221},
           {3, 71},
           {2, 2777},
           {26, 52},
           {25, 52}],
      extra_attrs =>
          [{1, 2438},
           {4, 1152},
           {5, 572},
           {6, 374},
           {7, 332},
           {3, 106}]};
get_lev_cfg({1002, 42}) ->
    #{base_attrs =>
          [{1, 1668},
           {4, 788},
           {5, 391},
           {6, 256},
           {7, 227},
           {3, 72},
           {2, 2798},
           {26, 54},
           {25, 54}],
      extra_attrs =>
          [{1, 2502},
           {4, 1182},
           {5, 587},
           {6, 384},
           {7, 341},
           {3, 109}]};
get_lev_cfg({1002, 43}) ->
    #{base_attrs =>
          [{1, 1710},
           {4, 807},
           {5, 401},
           {6, 262},
           {7, 233},
           {3, 74},
           {2, 2820},
           {26, 57},
           {25, 57}],
      extra_attrs =>
          [{1, 2565},
           {4, 1211},
           {5, 602},
           {6, 394},
           {7, 350},
           {3, 112}]};
get_lev_cfg({1002, 44}) ->
    #{base_attrs =>
          [{1, 1752},
           {4, 827},
           {5, 411},
           {6, 269},
           {7, 239},
           {3, 76},
           {2, 2842},
           {26, 59},
           {25, 59}],
      extra_attrs =>
          [{1, 2629},
           {4, 1241},
           {5, 617},
           {6, 403},
           {7, 358},
           {3, 114}]};
get_lev_cfg({1002, 45}) ->
    #{base_attrs =>
          [{1, 1794},
           {4, 847},
           {5, 421},
           {6, 275},
           {7, 244},
           {3, 78},
           {2, 2865},
           {26, 62},
           {25, 62}],
      extra_attrs =>
          [{1, 2692},
           {4, 1271},
           {5, 632},
           {6, 413},
           {7, 367},
           {3, 117}]};
get_lev_cfg({1002, 46}) ->
    #{base_attrs =>
          [{1, 1837},
           {4, 867},
           {5, 431},
           {6, 282},
           {7, 250},
           {3, 80},
           {2, 2888},
           {26, 64},
           {25, 64}],
      extra_attrs =>
          [{1, 2755},
           {4, 1301},
           {5, 647},
           {6, 423},
           {7, 375},
           {3, 120}]};
get_lev_cfg({1002, 47}) ->
    #{base_attrs =>
          [{1, 1879},
           {4, 887},
           {5, 441},
           {6, 288},
           {7, 256},
           {3, 82},
           {2, 2912},
           {26, 66},
           {25, 66}],
      extra_attrs =>
          [{1, 2819},
           {4, 1331},
           {5, 662},
           {6, 432},
           {7, 384},
           {3, 123}]};
get_lev_cfg({1002, 48}) ->
    #{base_attrs =>
          [{1, 1921},
           {4, 907},
           {5, 451},
           {6, 295},
           {7, 262},
           {3, 83},
           {2, 2936},
           {26, 69},
           {25, 69}],
      extra_attrs =>
          [{1, 2882},
           {4, 1361},
           {5, 676},
           {6, 442},
           {7, 393},
           {3, 125}]};
get_lev_cfg({1002, 49}) ->
    #{base_attrs =>
          [{1, 1963},
           {4, 927},
           {5, 461},
           {6, 301},
           {7, 267},
           {3, 85},
           {2, 2961},
           {26, 71},
           {25, 71}],
      extra_attrs =>
          [{1, 2945},
           {4, 1391},
           {5, 691},
           {6, 452},
           {7, 401},
           {3, 128}]};
get_lev_cfg({1002, 50}) ->
    #{base_attrs =>
          [{1, 2006},
           {4, 947},
           {5, 471},
           {6, 308},
           {7, 273},
           {3, 87},
           {2, 2986},
           {26, 74},
           {25, 74}],
      extra_attrs =>
          [{1, 3009},
           {4, 1421},
           {5, 706},
           {6, 462},
           {7, 410},
           {3, 131}]};
get_lev_cfg({1002, 51}) ->
    #{base_attrs =>
          [{1, 2048},
           {4, 967},
           {5, 481},
           {6, 314},
           {7, 279},
           {3, 89},
           {2, 3012},
           {26, 76},
           {25, 76}],
      extra_attrs =>
          [{1, 3072},
           {4, 1451},
           {5, 721},
           {6, 471},
           {7, 419},
           {3, 134}]};
get_lev_cfg({1002, 52}) ->
    #{base_attrs =>
          [{1, 2090},
           {4, 987},
           {5, 491},
           {6, 321},
           {7, 285},
           {3, 91},
           {2, 3015},
           {26, 78},
           {25, 78}],
      extra_attrs =>
          [{1, 3135},
           {4, 1481},
           {5, 736},
           {6, 481},
           {7, 427},
           {3, 137}]};
get_lev_cfg({1002, 53}) ->
    #{base_attrs =>
          [{1, 2132},
           {4, 1007},
           {5, 500},
           {6, 327},
           {7, 290},
           {3, 93},
           {2, 3018},
           {26, 81},
           {25, 81}],
      extra_attrs =>
          [{1, 3199},
           {4, 1511},
           {5, 751},
           {6, 491},
           {7, 436},
           {3, 139}]};
get_lev_cfg({1002, 54}) ->
    #{base_attrs =>
          [{1, 2175},
           {4, 1027},
           {5, 510},
           {6, 334},
           {7, 296},
           {3, 95},
           {2, 3021},
           {26, 83},
           {25, 83}],
      extra_attrs =>
          [{1, 3262},
           {4, 1541},
           {5, 766},
           {6, 501},
           {7, 445},
           {3, 142}]};
get_lev_cfg({1002, 55}) ->
    #{base_attrs =>
          [{1, 2217},
           {4, 1047},
           {5, 520},
           {6, 340},
           {7, 302},
           {3, 96},
           {2, 3024},
           {26, 86},
           {25, 86}],
      extra_attrs =>
          [{1, 3325},
           {4, 1571},
           {5, 781},
           {6, 510},
           {7, 453},
           {3, 145}]};
get_lev_cfg({1002, 56}) ->
    #{base_attrs =>
          [{1, 2259},
           {4, 1067},
           {5, 530},
           {6, 347},
           {7, 308},
           {3, 98},
           {2, 3027},
           {26, 88},
           {25, 88}],
      extra_attrs =>
          [{1, 3389},
           {4, 1600},
           {5, 796},
           {6, 520},
           {7, 462},
           {3, 148}]};
get_lev_cfg({1002, 57}) ->
    #{base_attrs =>
          [{1, 2301},
           {4, 1087},
           {5, 540},
           {6, 353},
           {7, 313},
           {3, 100},
           {2, 3030},
           {26, 90},
           {25, 90}],
      extra_attrs =>
          [{1, 3452},
           {4, 1630},
           {5, 810},
           {6, 530},
           {7, 470},
           {3, 150}]};
get_lev_cfg({1002, 58}) ->
    #{base_attrs =>
          [{1, 2343},
           {4, 1107},
           {5, 550},
           {6, 359},
           {7, 319},
           {3, 102},
           {2, 3033},
           {26, 93},
           {25, 93}],
      extra_attrs =>
          [{1, 3515},
           {4, 1660},
           {5, 825},
           {6, 539},
           {7, 479},
           {3, 153}]};
get_lev_cfg({1002, 59}) ->
    #{base_attrs =>
          [{1, 2386},
           {4, 1127},
           {5, 560},
           {6, 366},
           {7, 325},
           {3, 104},
           {2, 3036},
           {26, 95},
           {25, 95}],
      extra_attrs =>
          [{1, 3579},
           {4, 1690},
           {5, 840},
           {6, 549},
           {7, 488},
           {3, 156}]};
get_lev_cfg({1002, 60}) ->
    #{base_attrs =>
          [{1, 2476},
           {4, 1169},
           {5, 581},
           {6, 380},
           {7, 337},
           {3, 108},
           {2, 3039},
           {26, 98},
           {25, 98}],
      extra_attrs =>
          [{1, 3714},
           {4, 1754},
           {5, 872},
           {6, 570},
           {7, 506},
           {3, 162}]};
get_lev_cfg({1002, 61}) ->
    #{base_attrs =>
          [{1, 2544},
           {4, 1201},
           {5, 597},
           {6, 390},
           {7, 347},
           {3, 111},
           {2, 3042},
           {26, 100},
           {25, 100}],
      extra_attrs =>
          [{1, 3816},
           {4, 1802},
           {5, 896},
           {6, 586},
           {7, 520},
           {3, 166}]};
get_lev_cfg({1002, 62}) ->
    #{base_attrs =>
          [{1, 2611},
           {4, 1233},
           {5, 613},
           {6, 401},
           {7, 356},
           {3, 114},
           {2, 3045},
           {26, 102},
           {25, 102}],
      extra_attrs =>
          [{1, 3916},
           {4, 1850},
           {5, 919},
           {6, 601},
           {7, 534},
           {3, 171}]};
get_lev_cfg({1002, 63}) ->
    #{base_attrs =>
          [{1, 2677},
           {4, 1264},
           {5, 628},
           {6, 411},
           {7, 365},
           {3, 117},
           {2, 3048},
           {26, 105},
           {25, 105}],
      extra_attrs =>
          [{1, 4016},
           {4, 1897},
           {5, 943},
           {6, 616},
           {7, 547},
           {3, 175}]};
get_lev_cfg({1002, 64}) ->
    #{base_attrs =>
          [{1, 2743},
           {4, 1296},
           {5, 644},
           {6, 421},
           {7, 374},
           {3, 119},
           {2, 3051},
           {26, 107},
           {25, 107}],
      extra_attrs =>
          [{1, 4115},
           {4, 1944},
           {5, 966},
           {6, 632},
           {7, 561},
           {3, 179}]};
get_lev_cfg({1002, 65}) ->
    #{base_attrs =>
          [{1, 2809},
           {4, 1326},
           {5, 659},
           {6, 431},
           {7, 383},
           {3, 122},
           {2, 3054},
           {26, 110},
           {25, 110}],
      extra_attrs =>
          [{1, 4213},
           {4, 1990},
           {5, 989},
           {6, 647},
           {7, 574},
           {3, 184}]};
get_lev_cfg({1002, 66}) ->
    #{base_attrs =>
          [{1, 2874},
           {4, 1357},
           {5, 675},
           {6, 441},
           {7, 392},
           {3, 125},
           {2, 3057},
           {26, 112},
           {25, 112}],
      extra_attrs =>
          [{1, 4311},
           {4, 2036},
           {5, 1012},
           {6, 662},
           {7, 588},
           {3, 188}]};
get_lev_cfg({1002, 67}) ->
    #{base_attrs =>
          [{1, 2938},
           {4, 1388},
           {5, 690},
           {6, 451},
           {7, 400},
           {3, 128},
           {2, 3060},
           {26, 114},
           {25, 114}],
      extra_attrs =>
          [{1, 4407},
           {4, 2082},
           {5, 1035},
           {6, 676},
           {7, 601},
           {3, 192}]};
get_lev_cfg({1002, 68}) ->
    #{base_attrs =>
          [{1, 3002},
           {4, 1418},
           {5, 705},
           {6, 461},
           {7, 409},
           {3, 131},
           {2, 3063},
           {26, 117},
           {25, 117}],
      extra_attrs =>
          [{1, 4503},
           {4, 2127},
           {5, 1057},
           {6, 691},
           {7, 614},
           {3, 196}]};
get_lev_cfg({1002, 69}) ->
    #{base_attrs =>
          [{1, 3065},
           {4, 1448},
           {5, 720},
           {6, 470},
           {7, 418},
           {3, 133},
           {2, 3066},
           {26, 119},
           {25, 119}],
      extra_attrs =>
          [{1, 4598},
           {4, 2172},
           {5, 1080},
           {6, 706},
           {7, 627},
           {3, 200}]};
get_lev_cfg({1002, 70}) ->
    #{base_attrs =>
          [{1, 3128},
           {4, 1477},
           {5, 734},
           {6, 480},
           {7, 426},
           {3, 136},
           {2, 3070},
           {26, 122},
           {25, 122}],
      extra_attrs =>
          [{1, 4692},
           {4, 2216},
           {5, 1102},
           {6, 720},
           {7, 640},
           {3, 205}]};
get_lev_cfg({1002, 71}) ->
    #{base_attrs =>
          [{1, 3190},
           {4, 1507},
           {5, 749},
           {6, 490},
           {7, 435},
           {3, 139},
           {2, 3074},
           {26, 124},
           {25, 124}],
      extra_attrs =>
          [{1, 4785},
           {4, 2260},
           {5, 1124},
           {6, 735},
           {7, 652},
           {3, 209}]};
get_lev_cfg({1002, 72}) ->
    #{base_attrs =>
          [{1, 3252},
           {4, 1536},
           {5, 763},
           {6, 499},
           {7, 443},
           {3, 142},
           {2, 3078},
           {26, 126},
           {25, 126}],
      extra_attrs =>
          [{1, 4878},
           {4, 2304},
           {5, 1145},
           {6, 749},
           {7, 665},
           {3, 213}]};
get_lev_cfg({1002, 73}) ->
    #{base_attrs =>
          [{1, 3313},
           {4, 1565},
           {5, 778},
           {6, 508},
           {7, 452},
           {3, 144},
           {2, 3082},
           {26, 129},
           {25, 129}],
      extra_attrs =>
          [{1, 4970},
           {4, 2347},
           {5, 1167},
           {6, 763},
           {7, 678},
           {3, 217}]};
get_lev_cfg({1002, 74}) ->
    #{base_attrs =>
          [{1, 3374},
           {4, 1593},
           {5, 792},
           {6, 518},
           {7, 460},
           {3, 147},
           {2, 3086},
           {26, 131},
           {25, 131}],
      extra_attrs =>
          [{1, 5061},
           {4, 2390},
           {5, 1188},
           {6, 777},
           {7, 690},
           {3, 221}]};
get_lev_cfg({1002, 75}) ->
    #{base_attrs =>
          [{1, 3433},
           {4, 1622},
           {5, 806},
           {6, 527},
           {7, 468},
           {3, 150},
           {2, 3090},
           {26, 134},
           {25, 134}],
      extra_attrs =>
          [{1, 5150},
           {4, 2433},
           {5, 1209},
           {6, 791},
           {7, 702},
           {3, 225}]};
get_lev_cfg({1002, 76}) ->
    #{base_attrs =>
          [{1, 3493},
           {4, 1650},
           {5, 820},
           {6, 536},
           {7, 476},
           {3, 152},
           {2, 3094},
           {26, 136},
           {25, 136}],
      extra_attrs =>
          [{1, 5240},
           {4, 2475},
           {5, 1230},
           {6, 804},
           {7, 714},
           {3, 229}]};
get_lev_cfg({1002, 77}) ->
    #{base_attrs =>
          [{1, 3552},
           {4, 1678},
           {5, 834},
           {6, 545},
           {7, 484},
           {3, 155},
           {2, 3098},
           {26, 138},
           {25, 138}],
      extra_attrs =>
          [{1, 5328},
           {4, 2517},
           {5, 1251},
           {6, 818},
           {7, 726},
           {3, 232}]};
get_lev_cfg({1002, 78}) ->
    #{base_attrs =>
          [{1, 3610},
           {4, 1705},
           {5, 848},
           {6, 554},
           {7, 492},
           {3, 157},
           {2, 3102},
           {26, 141},
           {25, 141}],
      extra_attrs =>
          [{1, 5416},
           {4, 2558},
           {5, 1272},
           {6, 831},
           {7, 738},
           {3, 236}]};
get_lev_cfg({1002, 79}) ->
    #{base_attrs =>
          [{1, 3668},
           {4, 1733},
           {5, 861},
           {6, 563},
           {7, 500},
           {3, 160},
           {2, 3106},
           {26, 143},
           {25, 143}],
      extra_attrs =>
          [{1, 5503},
           {4, 2599},
           {5, 1292},
           {6, 845},
           {7, 750},
           {3, 240}]};
get_lev_cfg({1002, 80}) ->
    #{base_attrs =>
          [{1, 3726},
           {4, 1760},
           {5, 875},
           {6, 572},
           {7, 508},
           {3, 162},
           {2, 3110},
           {26, 146},
           {25, 146}],
      extra_attrs =>
          [{1, 5589},
           {4, 2640},
           {5, 1312},
           {6, 858},
           {7, 762},
           {3, 244}]};
get_lev_cfg({1002, 81}) ->
    #{base_attrs =>
          [{1, 3783},
           {4, 1786},
           {5, 888},
           {6, 581},
           {7, 516},
           {3, 165},
           {2, 3114},
           {26, 148},
           {25, 148}],
      extra_attrs =>
          [{1, 5674},
           {4, 2680},
           {5, 1332},
           {6, 871},
           {7, 774},
           {3, 247}]};
get_lev_cfg({1002, 82}) ->
    #{base_attrs =>
          [{1, 3839},
           {4, 1813},
           {5, 901},
           {6, 589},
           {7, 523},
           {3, 167},
           {2, 3118},
           {26, 150},
           {25, 150}],
      extra_attrs =>
          [{1, 5758},
           {4, 2720},
           {5, 1352},
           {6, 884},
           {7, 785},
           {3, 251}]};
get_lev_cfg({1002, 83}) ->
    #{base_attrs =>
          [{1, 3894},
           {4, 1839},
           {5, 914},
           {6, 598},
           {7, 531},
           {3, 170},
           {2, 3122},
           {26, 153},
           {25, 153}],
      extra_attrs =>
          [{1, 5842},
           {4, 2759},
           {5, 1372},
           {6, 897},
           {7, 797},
           {3, 255}]};
get_lev_cfg({1002, 84}) ->
    #{base_attrs =>
          [{1, 3950},
           {4, 1865},
           {5, 927},
           {6, 606},
           {7, 538},
           {3, 172},
           {2, 3126},
           {26, 155},
           {25, 155}],
      extra_attrs =>
          [{1, 5925},
           {4, 2798},
           {5, 1391},
           {6, 910},
           {7, 808},
           {3, 258}]};
get_lev_cfg({1002, 85}) ->
    #{base_attrs =>
          [{1, 4004},
           {4, 1891},
           {5, 940},
           {6, 615},
           {7, 546},
           {3, 175},
           {2, 3130},
           {26, 158},
           {25, 158}],
      extra_attrs =>
          [{1, 6007},
           {4, 2837},
           {5, 1410},
           {6, 922},
           {7, 819},
           {3, 262}]};
get_lev_cfg({1002, 86}) ->
    #{base_attrs =>
          [{1, 4059},
           {4, 1917},
           {5, 953},
           {6, 623},
           {7, 553},
           {3, 177},
           {2, 3134},
           {26, 160},
           {25, 160}],
      extra_attrs =>
          [{1, 6088},
           {4, 2876},
           {5, 1430},
           {6, 935},
           {7, 830},
           {3, 266}]};
get_lev_cfg({1002, 87}) ->
    #{base_attrs =>
          [{1, 4112},
           {4, 1942},
           {5, 965},
           {6, 631},
           {7, 561},
           {3, 179},
           {2, 3138},
           {26, 162},
           {25, 162}],
      extra_attrs =>
          [{1, 6168},
           {4, 2913},
           {5, 1448},
           {6, 947},
           {7, 841},
           {3, 269}]};
get_lev_cfg({1002, 88}) ->
    #{base_attrs =>
          [{1, 4165},
           {4, 1967},
           {5, 978},
           {6, 639},
           {7, 568},
           {3, 182},
           {2, 3142},
           {26, 165},
           {25, 165}],
      extra_attrs =>
          [{1, 6248},
           {4, 2951},
           {5, 1467},
           {6, 959},
           {7, 852},
           {3, 273}]};
get_lev_cfg({1002, 89}) ->
    #{base_attrs =>
          [{1, 4218},
           {4, 1992},
           {5, 990},
           {6, 647},
           {7, 575},
           {3, 184},
           {2, 3146},
           {26, 167},
           {25, 167}],
      extra_attrs =>
          [{1, 6327},
           {4, 2988},
           {5, 1486},
           {6, 971},
           {7, 863},
           {3, 276}]};
get_lev_cfg({1002, 90}) ->
    #{base_attrs =>
          [{1, 4270},
           {4, 2016},
           {5, 1002},
           {6, 655},
           {7, 582},
           {3, 186},
           {2, 3151},
           {26, 170},
           {25, 170}],
      extra_attrs =>
          [{1, 6405},
           {4, 3025},
           {5, 1504},
           {6, 983},
           {7, 873},
           {3, 279}]};
get_lev_cfg({1002, 91}) ->
    #{base_attrs =>
          [{1, 4321},
           {4, 2041},
           {5, 1014},
           {6, 663},
           {7, 589},
           {3, 188},
           {2, 3156},
           {26, 172},
           {25, 172}],
      extra_attrs =>
          [{1, 6482},
           {4, 3061},
           {5, 1522},
           {6, 995},
           {7, 884},
           {3, 283}]};
get_lev_cfg({1002, 92}) ->
    #{base_attrs =>
          [{1, 4372},
           {4, 2065},
           {5, 1026},
           {6, 671},
           {7, 596},
           {3, 191},
           {2, 3161},
           {26, 174},
           {25, 174}],
      extra_attrs =>
          [{1, 6558},
           {4, 3098},
           {5, 1540},
           {6, 1007},
           {7, 894},
           {3, 286}]};
get_lev_cfg({1002, 93}) ->
    #{base_attrs =>
          [{1, 4422},
           {4, 2089},
           {5, 1038},
           {6, 679},
           {7, 603},
           {3, 193},
           {2, 3166},
           {26, 177},
           {25, 177}],
      extra_attrs =>
          [{1, 6634},
           {4, 3133},
           {5, 1558},
           {6, 1018},
           {7, 905},
           {3, 289}]};
get_lev_cfg({1002, 94}) ->
    #{base_attrs =>
          [{1, 4472},
           {4, 2112},
           {5, 1050},
           {6, 686},
           {7, 610},
           {3, 195},
           {2, 3171},
           {26, 179},
           {25, 179}],
      extra_attrs =>
          [{1, 6708},
           {4, 3168},
           {5, 1575},
           {6, 1030},
           {7, 915},
           {3, 293}]};
get_lev_cfg({1002, 95}) ->
    #{base_attrs =>
          [{1, 4521},
           {4, 2135},
           {5, 1062},
           {6, 694},
           {7, 616},
           {3, 197},
           {2, 3176},
           {26, 182},
           {25, 182}],
      extra_attrs =>
          [{1, 6782},
           {4, 3203},
           {5, 1593},
           {6, 1041},
           {7, 925},
           {3, 296}]};
get_lev_cfg({1002, 96}) ->
    #{base_attrs =>
          [{1, 4570},
           {4, 2158},
           {5, 1073},
           {6, 701},
           {7, 623},
           {3, 199},
           {2, 3181},
           {26, 184},
           {25, 184}],
      extra_attrs =>
          [{1, 6855},
           {4, 3238},
           {5, 1610},
           {6, 1052},
           {7, 935},
           {3, 299}]};
get_lev_cfg({1002, 97}) ->
    #{base_attrs =>
          [{1, 4618},
           {4, 2181},
           {5, 1084},
           {6, 709},
           {7, 630},
           {3, 201},
           {2, 3186},
           {26, 186},
           {25, 186}],
      extra_attrs =>
          [{1, 6927},
           {4, 3272},
           {5, 1627},
           {6, 1064},
           {7, 945},
           {3, 302}]};
get_lev_cfg({1002, 98}) ->
    #{base_attrs =>
          [{1, 4666},
           {4, 2204},
           {5, 1095},
           {6, 716},
           {7, 636},
           {3, 203},
           {2, 3191},
           {26, 189},
           {25, 189}],
      extra_attrs =>
          [{1, 6999},
           {4, 3306},
           {5, 1643},
           {6, 1074},
           {7, 954},
           {3, 305}]};
get_lev_cfg({1002, 99}) ->
    #{base_attrs =>
          [{1, 4713},
           {4, 2226},
           {5, 1107},
           {6, 723},
           {7, 643},
           {3, 205},
           {2, 3196},
           {26, 191},
           {25, 191}],
      extra_attrs =>
          [{1, 7070},
           {4, 3339},
           {5, 1660},
           {6, 1085},
           {7, 964},
           {3, 308}]};
get_lev_cfg({1002, 100}) ->
    #{base_attrs =>
          [{1, 4759},
           {4, 2248},
           {5, 1117},
           {6, 731},
           {7, 649},
           {3, 208},
           {2, 3201},
           {26, 194},
           {25, 194}],
      extra_attrs =>
          [{1, 7139},
           {4, 3372},
           {5, 1676},
           {6, 1096},
           {7, 974},
           {3, 312}]};
get_lev_cfg({1002, 101}) ->
    #{base_attrs =>
          [{1, 4805},
           {4, 2270},
           {5, 1128},
           {6, 738},
           {7, 655},
           {3, 210},
           {2, 3201},
           {26, 197},
           {25, 197}],
      extra_attrs =>
          [{1, 7208},
           {4, 3405},
           {5, 1693},
           {6, 1107},
           {7, 983},
           {3, 315}]};
get_lev_cfg({1002, 102}) ->
    #{base_attrs =>
          [{1, 4851},
           {4, 2291},
           {5, 1139},
           {6, 745},
           {7, 661},
           {3, 212},
           {2, 3201},
           {26, 200},
           {25, 200}],
      extra_attrs =>
          [{1, 7277},
           {4, 3437},
           {5, 1709},
           {6, 1117},
           {7, 992},
           {3, 318}]};
get_lev_cfg({1002, 103}) ->
    #{base_attrs =>
          [{1, 4896},
           {4, 2312},
           {5, 1149},
           {6, 751},
           {7, 667},
           {3, 213},
           {2, 3201},
           {26, 203},
           {25, 203}],
      extra_attrs =>
          [{1, 7344},
           {4, 3469},
           {5, 1724},
           {6, 1127},
           {7, 1001},
           {3, 320}]};
get_lev_cfg({1002, 104}) ->
    #{base_attrs =>
          [{1, 4940},
           {4, 2333},
           {5, 1160},
           {6, 758},
           {7, 674},
           {3, 215},
           {2, 3201},
           {26, 206},
           {25, 206}],
      extra_attrs =>
          [{1, 7411},
           {4, 3500},
           {5, 1740},
           {6, 1138},
           {7, 1011},
           {3, 323}]};
get_lev_cfg({1002, 105}) ->
    #{base_attrs =>
          [{1, 4984},
           {4, 2354},
           {5, 1170},
           {6, 765},
           {7, 679},
           {3, 217},
           {2, 3201},
           {26, 206},
           {25, 206}],
      extra_attrs =>
          [{1, 7476},
           {4, 3531},
           {5, 1756},
           {6, 1148},
           {7, 1019},
           {3, 326}]};
get_lev_cfg({1002, 106}) ->
    #{base_attrs =>
          [{1, 5027},
           {4, 2374},
           {5, 1180},
           {6, 772},
           {7, 685},
           {3, 219},
           {2, 3201},
           {26, 212},
           {25, 212}],
      extra_attrs =>
          [{1, 7541},
           {4, 3562},
           {5, 1771},
           {6, 1158},
           {7, 1028},
           {3, 329}]};
get_lev_cfg({1002, 107}) ->
    #{base_attrs =>
          [{1, 5070},
           {4, 2395},
           {5, 1190},
           {6, 778},
           {7, 691},
           {3, 221},
           {2, 3201},
           {26, 215},
           {25, 215}],
      extra_attrs =>
          [{1, 7606},
           {4, 3592},
           {5, 1786},
           {6, 1168},
           {7, 1037},
           {3, 332}]};
get_lev_cfg({1002, 108}) ->
    #{base_attrs =>
          [{1, 5112},
           {4, 2415},
           {5, 1200},
           {6, 785},
           {7, 697},
           {3, 223},
           {2, 3201},
           {26, 218},
           {25, 218}],
      extra_attrs =>
          [{1, 7669},
           {4, 3622},
           {5, 1801},
           {6, 1177},
           {7, 1046},
           {3, 335}]};
get_lev_cfg({1002, 109}) ->
    #{base_attrs =>
          [{1, 5154},
           {4, 2434},
           {5, 1210},
           {6, 791},
           {7, 703},
           {3, 225},
           {2, 3201},
           {26, 221},
           {25, 221}],
      extra_attrs =>
          [{1, 7731},
           {4, 3652},
           {5, 1815},
           {6, 1187},
           {7, 1054},
           {3, 337}]};
get_lev_cfg({1002, 110}) ->
    #{base_attrs =>
          [{1, 5195},
           {4, 2454},
           {5, 1220},
           {6, 797},
           {7, 708},
           {3, 227},
           {2, 3201},
           {26, 224},
           {25, 224}],
      extra_attrs =>
          [{1, 7793},
           {4, 3681},
           {5, 1830},
           {6, 1196},
           {7, 1063},
           {3, 340}]};
get_lev_cfg({1002, 111}) ->
    #{base_attrs =>
          [{1, 5236},
           {4, 2473},
           {5, 1229},
           {6, 804},
           {7, 714},
           {3, 228},
           {2, 3201},
           {26, 227},
           {25, 227}],
      extra_attrs =>
          [{1, 7854},
           {4, 3710},
           {5, 1844},
           {6, 1206},
           {7, 1071},
           {3, 343}]};
get_lev_cfg({1002, 112}) ->
    #{base_attrs =>
          [{1, 5276},
           {4, 2492},
           {5, 1239},
           {6, 810},
           {7, 719},
           {3, 230},
           {2, 3201},
           {26, 230},
           {25, 230}],
      extra_attrs =>
          [{1, 7914},
           {4, 3738},
           {5, 1858},
           {6, 1215},
           {7, 1079},
           {3, 345}]};
get_lev_cfg({1002, 113}) ->
    #{base_attrs =>
          [{1, 5316},
           {4, 2511},
           {5, 1248},
           {6, 816},
           {7, 725},
           {3, 232},
           {2, 3201},
           {26, 233},
           {25, 233}],
      extra_attrs =>
          [{1, 7974},
           {4, 3766},
           {5, 1872},
           {6, 1224},
           {7, 1087},
           {3, 348}]};
get_lev_cfg({1002, 114}) ->
    #{base_attrs =>
          [{1, 5354},
           {4, 2529},
           {5, 1257},
           {6, 822},
           {7, 730},
           {3, 234},
           {2, 3201},
           {26, 236},
           {25, 236}],
      extra_attrs =>
          [{1, 8032},
           {4, 3794},
           {5, 1886},
           {6, 1233},
           {7, 1095},
           {3, 351}]};
get_lev_cfg({1002, 115}) ->
    #{base_attrs =>
          [{1, 5393},
           {4, 2547},
           {5, 1266},
           {6, 828},
           {7, 735},
           {3, 235},
           {2, 3201},
           {26, 239},
           {25, 239}],
      extra_attrs =>
          [{1, 8090},
           {4, 3821},
           {5, 1900},
           {6, 1242},
           {7, 1103},
           {3, 353}]};
get_lev_cfg({1002, 116}) ->
    #{base_attrs =>
          [{1, 5431},
           {4, 2565},
           {5, 1275},
           {6, 834},
           {7, 740},
           {3, 237},
           {2, 3201},
           {26, 242},
           {25, 242}],
      extra_attrs =>
          [{1, 8147},
           {4, 3848},
           {5, 1913},
           {6, 1251},
           {7, 1111},
           {3, 356}]};
get_lev_cfg({1002, 117}) ->
    #{base_attrs =>
          [{1, 5468},
           {4, 2583},
           {5, 1284},
           {6, 839},
           {7, 746},
           {3, 238},
           {2, 3201},
           {26, 245},
           {25, 245}],
      extra_attrs =>
          [{1, 8203},
           {4, 3874},
           {5, 1926},
           {6, 1259},
           {7, 1119},
           {3, 358}]};
get_lev_cfg({1002, 118}) ->
    #{base_attrs =>
          [{1, 5505},
           {4, 2600},
           {5, 1293},
           {6, 845},
           {7, 751},
           {3, 240},
           {2, 3201},
           {26, 248},
           {25, 248}],
      extra_attrs =>
          [{1, 8258},
           {4, 3901},
           {5, 1939},
           {6, 1268},
           {7, 1126},
           {3, 360}]};
get_lev_cfg({1002, 119}) ->
    #{base_attrs =>
          [{1, 5541},
           {4, 2617},
           {5, 1301},
           {6, 851},
           {7, 756},
           {3, 242},
           {2, 3201},
           {26, 251},
           {25, 251}],
      extra_attrs =>
          [{1, 8312},
           {4, 3926},
           {5, 1952},
           {6, 1276},
           {7, 1134},
           {3, 363}]};
get_lev_cfg({1002, 120}) ->
    #{base_attrs =>
          [{1, 5577},
           {4, 2634},
           {5, 1310},
           {6, 856},
           {7, 760},
           {3, 243},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8366},
           {4, 3952},
           {5, 1965},
           {6, 1284},
           {7, 1141},
           {3, 365}]};
get_lev_cfg({1002, 121}) ->
    #{base_attrs =>
          [{1, 5613},
           {4, 2651},
           {5, 1318},
           {6, 862},
           {7, 765},
           {3, 245},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8419},
           {4, 3977},
           {5, 1977},
           {6, 1293},
           {7, 1148},
           {3, 367}]};
get_lev_cfg({1002, 122}) ->
    #{base_attrs =>
          [{1, 5647},
           {4, 2667},
           {5, 1326},
           {6, 867},
           {7, 770},
           {3, 246},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8471},
           {4, 4001},
           {5, 1989},
           {6, 1301},
           {7, 1155},
           {3, 370}]};
get_lev_cfg({1002, 123}) ->
    #{base_attrs =>
          [{1, 5681},
           {4, 2683},
           {5, 1334},
           {6, 872},
           {7, 775},
           {3, 248},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8522},
           {4, 4025},
           {5, 2001},
           {6, 1308},
           {7, 1162},
           {3, 372}]};
get_lev_cfg({1002, 124}) ->
    #{base_attrs =>
          [{1, 5715},
           {4, 2699},
           {5, 1342},
           {6, 877},
           {7, 779},
           {3, 249},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8573},
           {4, 4049},
           {5, 2013},
           {6, 1316},
           {7, 1169},
           {3, 374}]};
get_lev_cfg({1002, 125}) ->
    #{base_attrs =>
          [{1, 5748},
           {4, 2715},
           {5, 1350},
           {6, 882},
           {7, 784},
           {3, 251},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8622},
           {4, 4072},
           {5, 2025},
           {6, 1324},
           {7, 1176},
           {3, 376}]};
get_lev_cfg({1002, 126}) ->
    #{base_attrs =>
          [{1, 5780},
           {4, 2730},
           {5, 1357},
           {6, 887},
           {7, 788},
           {3, 252},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8671},
           {4, 4096},
           {5, 2036},
           {6, 1331},
           {7, 1182},
           {3, 378}]};
get_lev_cfg({1002, 127}) ->
    #{base_attrs =>
          [{1, 5813},
           {4, 2745},
           {5, 1365},
           {6, 892},
           {7, 793},
           {3, 254},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8719},
           {4, 4118},
           {5, 2047},
           {6, 1339},
           {7, 1189},
           {3, 381}]};
get_lev_cfg({1002, 128}) ->
    #{base_attrs =>
          [{1, 5844},
           {4, 2760},
           {5, 1372},
           {6, 897},
           {7, 797},
           {3, 255},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8766},
           {4, 4141},
           {5, 2059},
           {6, 1346},
           {7, 1195},
           {3, 383}]};
get_lev_cfg({1002, 129}) ->
    #{base_attrs =>
          [{1, 5875},
           {4, 2775},
           {5, 1379},
           {6, 902},
           {7, 801},
           {3, 256},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8812},
           {4, 4162},
           {5, 2069},
           {6, 1353},
           {7, 1202},
           {3, 385}]};
get_lev_cfg({1002, 130}) ->
    #{base_attrs =>
          [{1, 5905},
           {4, 2789},
           {5, 1387},
           {6, 907},
           {7, 805},
           {3, 258},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8858},
           {4, 4184},
           {5, 2080},
           {6, 1360},
           {7, 1208},
           {3, 387}]};
get_lev_cfg({1006, 1}) ->
    #{base_attrs =>
          [{1, 105},
           {4, 49},
           {5, 24},
           {6, 16},
           {7, 14},
           {3, 4},
           {2, 200},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 158}, {4, 74}, {5, 37}, {6, 24}, {7, 21}, {3, 6}]};
get_lev_cfg({1006, 2}) ->
    #{base_attrs =>
          [{1, 126},
           {4, 59},
           {5, 29},
           {6, 19},
           {7, 17},
           {3, 5},
           {2, 576},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 190}, {4, 89}, {5, 44}, {6, 29}, {7, 25}, {3, 8}]};
get_lev_cfg({1006, 3}) ->
    #{base_attrs =>
          [{1, 147},
           {4, 69},
           {5, 34},
           {6, 22},
           {7, 20},
           {3, 6},
           {2, 672},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 221},
           {4, 104},
           {5, 52},
           {6, 34},
           {7, 30},
           {3, 9}]};
get_lev_cfg({1006, 4}) ->
    #{base_attrs =>
          [{1, 168},
           {4, 79},
           {5, 39},
           {6, 25},
           {7, 23},
           {3, 7},
           {2, 767},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 253},
           {4, 119},
           {5, 59},
           {6, 38},
           {7, 34},
           {3, 11}]};
get_lev_cfg({1006, 5}) ->
    #{base_attrs =>
          [{1, 190},
           {4, 89},
           {5, 44},
           {6, 29},
           {7, 25},
           {3, 8},
           {2, 864},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 285},
           {4, 134},
           {5, 66},
           {6, 43},
           {7, 38},
           {3, 12}]};
get_lev_cfg({1006, 6}) ->
    #{base_attrs =>
          [{1, 211},
           {4, 99},
           {5, 49},
           {6, 32},
           {7, 28},
           {3, 9},
           {2, 960},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 316},
           {4, 149},
           {5, 74},
           {6, 48},
           {7, 43},
           {3, 13}]};
get_lev_cfg({1006, 7}) ->
    #{base_attrs =>
          [{1, 232},
           {4, 109},
           {5, 54},
           {6, 35},
           {7, 31},
           {3, 10},
           {2, 1055},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 348},
           {4, 164},
           {5, 81},
           {6, 53},
           {7, 47},
           {3, 15}]};
get_lev_cfg({1006, 8}) ->
    #{base_attrs =>
          [{1, 253},
           {4, 119},
           {5, 59},
           {6, 38},
           {7, 34},
           {3, 11},
           {2, 1152},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 380},
           {4, 179},
           {5, 89},
           {6, 58},
           {7, 51},
           {3, 16}]};
get_lev_cfg({1006, 9}) ->
    #{base_attrs =>
          [{1, 274},
           {4, 129},
           {5, 64},
           {6, 42},
           {7, 37},
           {3, 11},
           {2, 1248},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 411},
           {4, 194},
           {5, 96},
           {6, 63},
           {7, 56},
           {3, 17}]};
get_lev_cfg({1006, 10}) ->
    #{base_attrs =>
          [{1, 316},
           {4, 149},
           {5, 74},
           {6, 48},
           {7, 43},
           {3, 13},
           {2, 1440},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 475},
           {4, 224},
           {5, 111},
           {6, 72},
           {7, 64},
           {3, 20}]};
get_lev_cfg({1006, 11}) ->
    #{base_attrs =>
          [{1, 358},
           {4, 169},
           {5, 84},
           {6, 55},
           {7, 48},
           {3, 15},
           {2, 1631},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 538},
           {4, 254},
           {5, 126},
           {6, 82},
           {7, 73},
           {3, 23}]};
get_lev_cfg({1006, 12}) ->
    #{base_attrs =>
          [{1, 401},
           {4, 189},
           {5, 94},
           {6, 61},
           {7, 54},
           {3, 17},
           {2, 1824},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 601},
           {4, 284},
           {5, 141},
           {6, 92},
           {7, 82},
           {3, 26}]};
get_lev_cfg({1006, 13}) ->
    #{base_attrs =>
          [{1, 443},
           {4, 209},
           {5, 104},
           {6, 68},
           {7, 60},
           {3, 19},
           {2, 2016},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 665},
           {4, 314},
           {5, 156},
           {6, 102},
           {7, 90},
           {3, 29}]};
get_lev_cfg({1006, 14}) ->
    #{base_attrs =>
          [{1, 485},
           {4, 229},
           {5, 114},
           {6, 74},
           {7, 66},
           {3, 21},
           {2, 2207},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 728},
           {4, 344},
           {5, 171},
           {6, 111},
           {7, 99},
           {3, 31}]};
get_lev_cfg({1006, 15}) ->
    #{base_attrs =>
          [{1, 527},
           {4, 249},
           {5, 123},
           {6, 81},
           {7, 72},
           {3, 23},
           {2, 2400},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 791},
           {4, 374},
           {5, 185},
           {6, 121},
           {7, 108},
           {3, 34}]};
get_lev_cfg({1006, 16}) ->
    #{base_attrs =>
          [{1, 570},
           {4, 269},
           {5, 133},
           {6, 87},
           {7, 77},
           {3, 24},
           {2, 2408},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 855},
           {4, 403},
           {5, 200},
           {6, 131},
           {7, 116},
           {3, 37}]};
get_lev_cfg({1006, 17}) ->
    #{base_attrs =>
          [{1, 612},
           {4, 289},
           {5, 143},
           {6, 94},
           {7, 83},
           {3, 26},
           {2, 2417},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 918},
           {4, 433},
           {5, 215},
           {6, 141},
           {7, 125},
           {3, 40}]};
get_lev_cfg({1006, 18}) ->
    #{base_attrs =>
          [{1, 654},
           {4, 309},
           {5, 153},
           {6, 100},
           {7, 89},
           {3, 28},
           {2, 2426},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 981},
           {4, 463},
           {5, 230},
           {6, 150},
           {7, 133},
           {3, 42}]};
get_lev_cfg({1006, 19}) ->
    #{base_attrs =>
          [{1, 696},
           {4, 329},
           {5, 163},
           {6, 107},
           {7, 95},
           {3, 30},
           {2, 2436},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1045},
           {4, 493},
           {5, 245},
           {6, 160},
           {7, 142},
           {3, 45}]};
get_lev_cfg({1006, 20}) ->
    #{base_attrs =>
          [{1, 739},
           {4, 349},
           {5, 173},
           {6, 113},
           {7, 100},
           {3, 32},
           {2, 2446},
           {26, 2},
           {25, 2}],
      extra_attrs =>
          [{1, 1108},
           {4, 523},
           {5, 260},
           {6, 170},
           {7, 151},
           {3, 48}]};
get_lev_cfg({1006, 21}) ->
    #{base_attrs =>
          [{1, 781},
           {4, 369},
           {5, 183},
           {6, 119},
           {7, 106},
           {3, 34},
           {2, 2457},
           {26, 4},
           {25, 4}],
      extra_attrs =>
          [{1, 1171},
           {4, 553},
           {5, 275},
           {6, 179},
           {7, 159},
           {3, 51}]};
get_lev_cfg({1006, 22}) ->
    #{base_attrs =>
          [{1, 823},
           {4, 389},
           {5, 193},
           {6, 126},
           {7, 112},
           {3, 35},
           {2, 2468},
           {26, 6},
           {25, 6}],
      extra_attrs =>
          [{1, 1235},
           {4, 583},
           {5, 290},
           {6, 189},
           {7, 168},
           {3, 53}]};
get_lev_cfg({1006, 23}) ->
    #{base_attrs =>
          [{1, 865},
           {4, 408},
           {5, 203},
           {6, 132},
           {7, 118},
           {3, 37},
           {2, 2480},
           {26, 9},
           {25, 9}],
      extra_attrs =>
          [{1, 1298},
           {4, 613},
           {5, 305},
           {6, 199},
           {7, 177},
           {3, 56}]};
get_lev_cfg({1006, 24}) ->
    #{base_attrs =>
          [{1, 908},
           {4, 428},
           {5, 213},
           {6, 139},
           {7, 123},
           {3, 39},
           {2, 2492},
           {26, 11},
           {25, 11}],
      extra_attrs =>
          [{1, 1362},
           {4, 643},
           {5, 319},
           {6, 209},
           {7, 185},
           {3, 59}]};
get_lev_cfg({1006, 25}) ->
    #{base_attrs =>
          [{1, 950},
           {4, 448},
           {5, 223},
           {6, 145},
           {7, 129},
           {3, 41},
           {2, 2505},
           {26, 14},
           {25, 14}],
      extra_attrs =>
          [{1, 1425},
           {4, 673},
           {5, 334},
           {6, 218},
           {7, 194},
           {3, 62}]};
get_lev_cfg({1006, 26}) ->
    #{base_attrs =>
          [{1, 992},
           {4, 468},
           {5, 233},
           {6, 152},
           {7, 135},
           {3, 43},
           {2, 2518},
           {26, 16},
           {25, 16}],
      extra_attrs =>
          [{1, 1488},
           {4, 703},
           {5, 349},
           {6, 228},
           {7, 203},
           {3, 65}]};
get_lev_cfg({1006, 27}) ->
    #{base_attrs =>
          [{1, 1034},
           {4, 488},
           {5, 243},
           {6, 158},
           {7, 141},
           {3, 45},
           {2, 2532},
           {26, 18},
           {25, 18}],
      extra_attrs =>
          [{1, 1552},
           {4, 733},
           {5, 364},
           {6, 238},
           {7, 211},
           {3, 67}]};
get_lev_cfg({1006, 28}) ->
    #{base_attrs =>
          [{1, 1076},
           {4, 508},
           {5, 252},
           {6, 165},
           {7, 146},
           {3, 47},
           {2, 2546},
           {26, 21},
           {25, 21}],
      extra_attrs =>
          [{1, 1615},
           {4, 763},
           {5, 379},
           {6, 248},
           {7, 220},
           {3, 70}]};
get_lev_cfg({1006, 29}) ->
    #{base_attrs =>
          [{1, 1119},
           {4, 528},
           {5, 262},
           {6, 171},
           {7, 152},
           {3, 48},
           {2, 2561},
           {26, 23},
           {25, 23}],
      extra_attrs =>
          [{1, 1678},
           {4, 792},
           {5, 394},
           {6, 257},
           {7, 229},
           {3, 73}]};
get_lev_cfg({1006, 30}) ->
    #{base_attrs =>
          [{1, 1161},
           {4, 548},
           {5, 272},
           {6, 178},
           {7, 158},
           {3, 50},
           {2, 2576},
           {26, 26},
           {25, 26}],
      extra_attrs =>
          [{1, 1742},
           {4, 822},
           {5, 409},
           {6, 267},
           {7, 237},
           {3, 76}]};
get_lev_cfg({1006, 31}) ->
    #{base_attrs =>
          [{1, 1203},
           {4, 568},
           {5, 282},
           {6, 184},
           {7, 164},
           {3, 52},
           {2, 2592},
           {26, 28},
           {25, 28}],
      extra_attrs =>
          [{1, 1805},
           {4, 852},
           {5, 424},
           {6, 277},
           {7, 246},
           {3, 78}]};
get_lev_cfg({1006, 32}) ->
    #{base_attrs =>
          [{1, 1245},
           {4, 588},
           {5, 292},
           {6, 191},
           {7, 169},
           {3, 54},
           {2, 2608},
           {26, 30},
           {25, 30}],
      extra_attrs =>
          [{1, 1868},
           {4, 882},
           {5, 438},
           {6, 287},
           {7, 254},
           {3, 81}]};
get_lev_cfg({1006, 33}) ->
    #{base_attrs =>
          [{1, 1288},
           {4, 608},
           {5, 302},
           {6, 197},
           {7, 175},
           {3, 56},
           {2, 2625},
           {26, 33},
           {25, 33}],
      extra_attrs =>
          [{1, 1932},
           {4, 912},
           {5, 453},
           {6, 296},
           {7, 263},
           {3, 84}]};
get_lev_cfg({1006, 34}) ->
    #{base_attrs =>
          [{1, 1330},
           {4, 628},
           {5, 312},
           {6, 204},
           {7, 181},
           {3, 58},
           {2, 2642},
           {26, 35},
           {25, 35}],
      extra_attrs =>
          [{1, 1995},
           {4, 942},
           {5, 468},
           {6, 306},
           {7, 272},
           {3, 87}]};
get_lev_cfg({1006, 35}) ->
    #{base_attrs =>
          [{1, 1372},
           {4, 648},
           {5, 322},
           {6, 210},
           {7, 187},
           {3, 59},
           {2, 2660},
           {26, 38},
           {25, 38}],
      extra_attrs =>
          [{1, 2058},
           {4, 972},
           {5, 483},
           {6, 316},
           {7, 280},
           {3, 89}]};
get_lev_cfg({1006, 36}) ->
    #{base_attrs =>
          [{1, 1414},
           {4, 668},
           {5, 332},
           {6, 217},
           {7, 193},
           {3, 61},
           {2, 2678},
           {26, 40},
           {25, 40}],
      extra_attrs =>
          [{1, 2122},
           {4, 1002},
           {5, 498},
           {6, 325},
           {7, 289},
           {3, 92}]};
get_lev_cfg({1006, 37}) ->
    #{base_attrs =>
          [{1, 1457},
           {4, 688},
           {5, 342},
           {6, 223},
           {7, 198},
           {3, 63},
           {2, 2697},
           {26, 42},
           {25, 42}],
      extra_attrs =>
          [{1, 2185},
           {4, 1032},
           {5, 513},
           {6, 335},
           {7, 298},
           {3, 95}]};
get_lev_cfg({1006, 38}) ->
    #{base_attrs =>
          [{1, 1499},
           {4, 708},
           {5, 352},
           {6, 230},
           {7, 204},
           {3, 65},
           {2, 2716},
           {26, 45},
           {25, 45}],
      extra_attrs =>
          [{1, 2248},
           {4, 1062},
           {5, 528},
           {6, 345},
           {7, 306},
           {3, 98}]};
get_lev_cfg({1006, 39}) ->
    #{base_attrs =>
          [{1, 1541},
           {4, 728},
           {5, 362},
           {6, 236},
           {7, 210},
           {3, 67},
           {2, 2736},
           {26, 47},
           {25, 47}],
      extra_attrs =>
          [{1, 2312},
           {4, 1092},
           {5, 543},
           {6, 355},
           {7, 315},
           {3, 101}]};
get_lev_cfg({1006, 40}) ->
    #{base_attrs =>
          [{1, 1583},
           {4, 748},
           {5, 371},
           {6, 243},
           {7, 216},
           {3, 69},
           {2, 2756},
           {26, 50},
           {25, 50}],
      extra_attrs =>
          [{1, 2375},
           {4, 1122},
           {5, 557},
           {6, 364},
           {7, 324},
           {3, 103}]};
get_lev_cfg({1006, 41}) ->
    #{base_attrs =>
          [{1, 1625},
           {4, 768},
           {5, 381},
           {6, 249},
           {7, 221},
           {3, 71},
           {2, 2777},
           {26, 52},
           {25, 52}],
      extra_attrs =>
          [{1, 2438},
           {4, 1152},
           {5, 572},
           {6, 374},
           {7, 332},
           {3, 106}]};
get_lev_cfg({1006, 42}) ->
    #{base_attrs =>
          [{1, 1668},
           {4, 788},
           {5, 391},
           {6, 256},
           {7, 227},
           {3, 72},
           {2, 2798},
           {26, 54},
           {25, 54}],
      extra_attrs =>
          [{1, 2502},
           {4, 1182},
           {5, 587},
           {6, 384},
           {7, 341},
           {3, 109}]};
get_lev_cfg({1006, 43}) ->
    #{base_attrs =>
          [{1, 1710},
           {4, 807},
           {5, 401},
           {6, 262},
           {7, 233},
           {3, 74},
           {2, 2820},
           {26, 57},
           {25, 57}],
      extra_attrs =>
          [{1, 2565},
           {4, 1211},
           {5, 602},
           {6, 394},
           {7, 350},
           {3, 112}]};
get_lev_cfg({1006, 44}) ->
    #{base_attrs =>
          [{1, 1752},
           {4, 827},
           {5, 411},
           {6, 269},
           {7, 239},
           {3, 76},
           {2, 2842},
           {26, 59},
           {25, 59}],
      extra_attrs =>
          [{1, 2629},
           {4, 1241},
           {5, 617},
           {6, 403},
           {7, 358},
           {3, 114}]};
get_lev_cfg({1006, 45}) ->
    #{base_attrs =>
          [{1, 1794},
           {4, 847},
           {5, 421},
           {6, 275},
           {7, 244},
           {3, 78},
           {2, 2865},
           {26, 62},
           {25, 62}],
      extra_attrs =>
          [{1, 2692},
           {4, 1271},
           {5, 632},
           {6, 413},
           {7, 367},
           {3, 117}]};
get_lev_cfg({1006, 46}) ->
    #{base_attrs =>
          [{1, 1837},
           {4, 867},
           {5, 431},
           {6, 282},
           {7, 250},
           {3, 80},
           {2, 2888},
           {26, 64},
           {25, 64}],
      extra_attrs =>
          [{1, 2755},
           {4, 1301},
           {5, 647},
           {6, 423},
           {7, 375},
           {3, 120}]};
get_lev_cfg({1006, 47}) ->
    #{base_attrs =>
          [{1, 1879},
           {4, 887},
           {5, 441},
           {6, 288},
           {7, 256},
           {3, 82},
           {2, 2912},
           {26, 66},
           {25, 66}],
      extra_attrs =>
          [{1, 2819},
           {4, 1331},
           {5, 662},
           {6, 432},
           {7, 384},
           {3, 123}]};
get_lev_cfg({1006, 48}) ->
    #{base_attrs =>
          [{1, 1921},
           {4, 907},
           {5, 451},
           {6, 295},
           {7, 262},
           {3, 83},
           {2, 2936},
           {26, 69},
           {25, 69}],
      extra_attrs =>
          [{1, 2882},
           {4, 1361},
           {5, 676},
           {6, 442},
           {7, 393},
           {3, 125}]};
get_lev_cfg({1006, 49}) ->
    #{base_attrs =>
          [{1, 1963},
           {4, 927},
           {5, 461},
           {6, 301},
           {7, 267},
           {3, 85},
           {2, 2961},
           {26, 71},
           {25, 71}],
      extra_attrs =>
          [{1, 2945},
           {4, 1391},
           {5, 691},
           {6, 452},
           {7, 401},
           {3, 128}]};
get_lev_cfg({1006, 50}) ->
    #{base_attrs =>
          [{1, 2006},
           {4, 947},
           {5, 471},
           {6, 308},
           {7, 273},
           {3, 87},
           {2, 2986},
           {26, 74},
           {25, 74}],
      extra_attrs =>
          [{1, 3009},
           {4, 1421},
           {5, 706},
           {6, 462},
           {7, 410},
           {3, 131}]};
get_lev_cfg({1006, 51}) ->
    #{base_attrs =>
          [{1, 2048},
           {4, 967},
           {5, 481},
           {6, 314},
           {7, 279},
           {3, 89},
           {2, 3012},
           {26, 76},
           {25, 76}],
      extra_attrs =>
          [{1, 3072},
           {4, 1451},
           {5, 721},
           {6, 471},
           {7, 419},
           {3, 134}]};
get_lev_cfg({1006, 52}) ->
    #{base_attrs =>
          [{1, 2090},
           {4, 987},
           {5, 491},
           {6, 321},
           {7, 285},
           {3, 91},
           {2, 3015},
           {26, 78},
           {25, 78}],
      extra_attrs =>
          [{1, 3135},
           {4, 1481},
           {5, 736},
           {6, 481},
           {7, 427},
           {3, 137}]};
get_lev_cfg({1006, 53}) ->
    #{base_attrs =>
          [{1, 2132},
           {4, 1007},
           {5, 500},
           {6, 327},
           {7, 290},
           {3, 93},
           {2, 3018},
           {26, 81},
           {25, 81}],
      extra_attrs =>
          [{1, 3199},
           {4, 1511},
           {5, 751},
           {6, 491},
           {7, 436},
           {3, 139}]};
get_lev_cfg({1006, 54}) ->
    #{base_attrs =>
          [{1, 2175},
           {4, 1027},
           {5, 510},
           {6, 334},
           {7, 296},
           {3, 95},
           {2, 3021},
           {26, 83},
           {25, 83}],
      extra_attrs =>
          [{1, 3262},
           {4, 1541},
           {5, 766},
           {6, 501},
           {7, 445},
           {3, 142}]};
get_lev_cfg({1006, 55}) ->
    #{base_attrs =>
          [{1, 2217},
           {4, 1047},
           {5, 520},
           {6, 340},
           {7, 302},
           {3, 96},
           {2, 3024},
           {26, 86},
           {25, 86}],
      extra_attrs =>
          [{1, 3325},
           {4, 1571},
           {5, 781},
           {6, 510},
           {7, 453},
           {3, 145}]};
get_lev_cfg({1006, 56}) ->
    #{base_attrs =>
          [{1, 2259},
           {4, 1067},
           {5, 530},
           {6, 347},
           {7, 308},
           {3, 98},
           {2, 3027},
           {26, 88},
           {25, 88}],
      extra_attrs =>
          [{1, 3389},
           {4, 1600},
           {5, 796},
           {6, 520},
           {7, 462},
           {3, 148}]};
get_lev_cfg({1006, 57}) ->
    #{base_attrs =>
          [{1, 2301},
           {4, 1087},
           {5, 540},
           {6, 353},
           {7, 313},
           {3, 100},
           {2, 3030},
           {26, 90},
           {25, 90}],
      extra_attrs =>
          [{1, 3452},
           {4, 1630},
           {5, 810},
           {6, 530},
           {7, 470},
           {3, 150}]};
get_lev_cfg({1006, 58}) ->
    #{base_attrs =>
          [{1, 2343},
           {4, 1107},
           {5, 550},
           {6, 359},
           {7, 319},
           {3, 102},
           {2, 3033},
           {26, 93},
           {25, 93}],
      extra_attrs =>
          [{1, 3515},
           {4, 1660},
           {5, 825},
           {6, 539},
           {7, 479},
           {3, 153}]};
get_lev_cfg({1006, 59}) ->
    #{base_attrs =>
          [{1, 2386},
           {4, 1127},
           {5, 560},
           {6, 366},
           {7, 325},
           {3, 104},
           {2, 3036},
           {26, 95},
           {25, 95}],
      extra_attrs =>
          [{1, 3579},
           {4, 1690},
           {5, 840},
           {6, 549},
           {7, 488},
           {3, 156}]};
get_lev_cfg({1006, 60}) ->
    #{base_attrs =>
          [{1, 2476},
           {4, 1169},
           {5, 581},
           {6, 380},
           {7, 337},
           {3, 108},
           {2, 3039},
           {26, 98},
           {25, 98}],
      extra_attrs =>
          [{1, 3714},
           {4, 1754},
           {5, 872},
           {6, 570},
           {7, 506},
           {3, 162}]};
get_lev_cfg({1006, 61}) ->
    #{base_attrs =>
          [{1, 2544},
           {4, 1201},
           {5, 597},
           {6, 390},
           {7, 347},
           {3, 111},
           {2, 3042},
           {26, 100},
           {25, 100}],
      extra_attrs =>
          [{1, 3816},
           {4, 1802},
           {5, 896},
           {6, 586},
           {7, 520},
           {3, 166}]};
get_lev_cfg({1006, 62}) ->
    #{base_attrs =>
          [{1, 2611},
           {4, 1233},
           {5, 613},
           {6, 401},
           {7, 356},
           {3, 114},
           {2, 3045},
           {26, 102},
           {25, 102}],
      extra_attrs =>
          [{1, 3916},
           {4, 1850},
           {5, 919},
           {6, 601},
           {7, 534},
           {3, 171}]};
get_lev_cfg({1006, 63}) ->
    #{base_attrs =>
          [{1, 2677},
           {4, 1264},
           {5, 628},
           {6, 411},
           {7, 365},
           {3, 117},
           {2, 3048},
           {26, 105},
           {25, 105}],
      extra_attrs =>
          [{1, 4016},
           {4, 1897},
           {5, 943},
           {6, 616},
           {7, 547},
           {3, 175}]};
get_lev_cfg({1006, 64}) ->
    #{base_attrs =>
          [{1, 2743},
           {4, 1296},
           {5, 644},
           {6, 421},
           {7, 374},
           {3, 119},
           {2, 3051},
           {26, 107},
           {25, 107}],
      extra_attrs =>
          [{1, 4115},
           {4, 1944},
           {5, 966},
           {6, 632},
           {7, 561},
           {3, 179}]};
get_lev_cfg({1006, 65}) ->
    #{base_attrs =>
          [{1, 2809},
           {4, 1326},
           {5, 659},
           {6, 431},
           {7, 383},
           {3, 122},
           {2, 3054},
           {26, 110},
           {25, 110}],
      extra_attrs =>
          [{1, 4213},
           {4, 1990},
           {5, 989},
           {6, 647},
           {7, 574},
           {3, 184}]};
get_lev_cfg({1006, 66}) ->
    #{base_attrs =>
          [{1, 2874},
           {4, 1357},
           {5, 675},
           {6, 441},
           {7, 392},
           {3, 125},
           {2, 3057},
           {26, 112},
           {25, 112}],
      extra_attrs =>
          [{1, 4311},
           {4, 2036},
           {5, 1012},
           {6, 662},
           {7, 588},
           {3, 188}]};
get_lev_cfg({1006, 67}) ->
    #{base_attrs =>
          [{1, 2938},
           {4, 1388},
           {5, 690},
           {6, 451},
           {7, 400},
           {3, 128},
           {2, 3060},
           {26, 114},
           {25, 114}],
      extra_attrs =>
          [{1, 4407},
           {4, 2082},
           {5, 1035},
           {6, 676},
           {7, 601},
           {3, 192}]};
get_lev_cfg({1006, 68}) ->
    #{base_attrs =>
          [{1, 3002},
           {4, 1418},
           {5, 705},
           {6, 461},
           {7, 409},
           {3, 131},
           {2, 3063},
           {26, 117},
           {25, 117}],
      extra_attrs =>
          [{1, 4503},
           {4, 2127},
           {5, 1057},
           {6, 691},
           {7, 614},
           {3, 196}]};
get_lev_cfg({1006, 69}) ->
    #{base_attrs =>
          [{1, 3065},
           {4, 1448},
           {5, 720},
           {6, 470},
           {7, 418},
           {3, 133},
           {2, 3066},
           {26, 119},
           {25, 119}],
      extra_attrs =>
          [{1, 4598},
           {4, 2172},
           {5, 1080},
           {6, 706},
           {7, 627},
           {3, 200}]};
get_lev_cfg({1006, 70}) ->
    #{base_attrs =>
          [{1, 3128},
           {4, 1477},
           {5, 734},
           {6, 480},
           {7, 426},
           {3, 136},
           {2, 3070},
           {26, 122},
           {25, 122}],
      extra_attrs =>
          [{1, 4692},
           {4, 2216},
           {5, 1102},
           {6, 720},
           {7, 640},
           {3, 205}]};
get_lev_cfg({1006, 71}) ->
    #{base_attrs =>
          [{1, 3190},
           {4, 1507},
           {5, 749},
           {6, 490},
           {7, 435},
           {3, 139},
           {2, 3074},
           {26, 124},
           {25, 124}],
      extra_attrs =>
          [{1, 4785},
           {4, 2260},
           {5, 1124},
           {6, 735},
           {7, 652},
           {3, 209}]};
get_lev_cfg({1006, 72}) ->
    #{base_attrs =>
          [{1, 3252},
           {4, 1536},
           {5, 763},
           {6, 499},
           {7, 443},
           {3, 142},
           {2, 3078},
           {26, 126},
           {25, 126}],
      extra_attrs =>
          [{1, 4878},
           {4, 2304},
           {5, 1145},
           {6, 749},
           {7, 665},
           {3, 213}]};
get_lev_cfg({1006, 73}) ->
    #{base_attrs =>
          [{1, 3313},
           {4, 1565},
           {5, 778},
           {6, 508},
           {7, 452},
           {3, 144},
           {2, 3082},
           {26, 129},
           {25, 129}],
      extra_attrs =>
          [{1, 4970},
           {4, 2347},
           {5, 1167},
           {6, 763},
           {7, 678},
           {3, 217}]};
get_lev_cfg({1006, 74}) ->
    #{base_attrs =>
          [{1, 3374},
           {4, 1593},
           {5, 792},
           {6, 518},
           {7, 460},
           {3, 147},
           {2, 3086},
           {26, 131},
           {25, 131}],
      extra_attrs =>
          [{1, 5061},
           {4, 2390},
           {5, 1188},
           {6, 777},
           {7, 690},
           {3, 221}]};
get_lev_cfg({1006, 75}) ->
    #{base_attrs =>
          [{1, 3433},
           {4, 1622},
           {5, 806},
           {6, 527},
           {7, 468},
           {3, 150},
           {2, 3090},
           {26, 134},
           {25, 134}],
      extra_attrs =>
          [{1, 5150},
           {4, 2433},
           {5, 1209},
           {6, 791},
           {7, 702},
           {3, 225}]};
get_lev_cfg({1006, 76}) ->
    #{base_attrs =>
          [{1, 3493},
           {4, 1650},
           {5, 820},
           {6, 536},
           {7, 476},
           {3, 152},
           {2, 3094},
           {26, 136},
           {25, 136}],
      extra_attrs =>
          [{1, 5240},
           {4, 2475},
           {5, 1230},
           {6, 804},
           {7, 714},
           {3, 229}]};
get_lev_cfg({1006, 77}) ->
    #{base_attrs =>
          [{1, 3552},
           {4, 1678},
           {5, 834},
           {6, 545},
           {7, 484},
           {3, 155},
           {2, 3098},
           {26, 138},
           {25, 138}],
      extra_attrs =>
          [{1, 5328},
           {4, 2517},
           {5, 1251},
           {6, 818},
           {7, 726},
           {3, 232}]};
get_lev_cfg({1006, 78}) ->
    #{base_attrs =>
          [{1, 3610},
           {4, 1705},
           {5, 848},
           {6, 554},
           {7, 492},
           {3, 157},
           {2, 3102},
           {26, 141},
           {25, 141}],
      extra_attrs =>
          [{1, 5416},
           {4, 2558},
           {5, 1272},
           {6, 831},
           {7, 738},
           {3, 236}]};
get_lev_cfg({1006, 79}) ->
    #{base_attrs =>
          [{1, 3668},
           {4, 1733},
           {5, 861},
           {6, 563},
           {7, 500},
           {3, 160},
           {2, 3106},
           {26, 143},
           {25, 143}],
      extra_attrs =>
          [{1, 5503},
           {4, 2599},
           {5, 1292},
           {6, 845},
           {7, 750},
           {3, 240}]};
get_lev_cfg({1006, 80}) ->
    #{base_attrs =>
          [{1, 3726},
           {4, 1760},
           {5, 875},
           {6, 572},
           {7, 508},
           {3, 162},
           {2, 3110},
           {26, 146},
           {25, 146}],
      extra_attrs =>
          [{1, 5589},
           {4, 2640},
           {5, 1312},
           {6, 858},
           {7, 762},
           {3, 244}]};
get_lev_cfg({1006, 81}) ->
    #{base_attrs =>
          [{1, 3783},
           {4, 1786},
           {5, 888},
           {6, 581},
           {7, 516},
           {3, 165},
           {2, 3114},
           {26, 148},
           {25, 148}],
      extra_attrs =>
          [{1, 5674},
           {4, 2680},
           {5, 1332},
           {6, 871},
           {7, 774},
           {3, 247}]};
get_lev_cfg({1006, 82}) ->
    #{base_attrs =>
          [{1, 3839},
           {4, 1813},
           {5, 901},
           {6, 589},
           {7, 523},
           {3, 167},
           {2, 3118},
           {26, 150},
           {25, 150}],
      extra_attrs =>
          [{1, 5758},
           {4, 2720},
           {5, 1352},
           {6, 884},
           {7, 785},
           {3, 251}]};
get_lev_cfg({1006, 83}) ->
    #{base_attrs =>
          [{1, 3894},
           {4, 1839},
           {5, 914},
           {6, 598},
           {7, 531},
           {3, 170},
           {2, 3122},
           {26, 153},
           {25, 153}],
      extra_attrs =>
          [{1, 5842},
           {4, 2759},
           {5, 1372},
           {6, 897},
           {7, 797},
           {3, 255}]};
get_lev_cfg({1006, 84}) ->
    #{base_attrs =>
          [{1, 3950},
           {4, 1865},
           {5, 927},
           {6, 606},
           {7, 538},
           {3, 172},
           {2, 3126},
           {26, 155},
           {25, 155}],
      extra_attrs =>
          [{1, 5925},
           {4, 2798},
           {5, 1391},
           {6, 910},
           {7, 808},
           {3, 258}]};
get_lev_cfg({1006, 85}) ->
    #{base_attrs =>
          [{1, 4004},
           {4, 1891},
           {5, 940},
           {6, 615},
           {7, 546},
           {3, 175},
           {2, 3130},
           {26, 158},
           {25, 158}],
      extra_attrs =>
          [{1, 6007},
           {4, 2837},
           {5, 1410},
           {6, 922},
           {7, 819},
           {3, 262}]};
get_lev_cfg({1006, 86}) ->
    #{base_attrs =>
          [{1, 4059},
           {4, 1917},
           {5, 953},
           {6, 623},
           {7, 553},
           {3, 177},
           {2, 3134},
           {26, 160},
           {25, 160}],
      extra_attrs =>
          [{1, 6088},
           {4, 2876},
           {5, 1430},
           {6, 935},
           {7, 830},
           {3, 266}]};
get_lev_cfg({1006, 87}) ->
    #{base_attrs =>
          [{1, 4112},
           {4, 1942},
           {5, 965},
           {6, 631},
           {7, 561},
           {3, 179},
           {2, 3138},
           {26, 162},
           {25, 162}],
      extra_attrs =>
          [{1, 6168},
           {4, 2913},
           {5, 1448},
           {6, 947},
           {7, 841},
           {3, 269}]};
get_lev_cfg({1006, 88}) ->
    #{base_attrs =>
          [{1, 4165},
           {4, 1967},
           {5, 978},
           {6, 639},
           {7, 568},
           {3, 182},
           {2, 3142},
           {26, 165},
           {25, 165}],
      extra_attrs =>
          [{1, 6248},
           {4, 2951},
           {5, 1467},
           {6, 959},
           {7, 852},
           {3, 273}]};
get_lev_cfg({1006, 89}) ->
    #{base_attrs =>
          [{1, 4218},
           {4, 1992},
           {5, 990},
           {6, 647},
           {7, 575},
           {3, 184},
           {2, 3146},
           {26, 167},
           {25, 167}],
      extra_attrs =>
          [{1, 6327},
           {4, 2988},
           {5, 1486},
           {6, 971},
           {7, 863},
           {3, 276}]};
get_lev_cfg({1006, 90}) ->
    #{base_attrs =>
          [{1, 4270},
           {4, 2016},
           {5, 1002},
           {6, 655},
           {7, 582},
           {3, 186},
           {2, 3151},
           {26, 170},
           {25, 170}],
      extra_attrs =>
          [{1, 6405},
           {4, 3025},
           {5, 1504},
           {6, 983},
           {7, 873},
           {3, 279}]};
get_lev_cfg({1006, 91}) ->
    #{base_attrs =>
          [{1, 4321},
           {4, 2041},
           {5, 1014},
           {6, 663},
           {7, 589},
           {3, 188},
           {2, 3156},
           {26, 172},
           {25, 172}],
      extra_attrs =>
          [{1, 6482},
           {4, 3061},
           {5, 1522},
           {6, 995},
           {7, 884},
           {3, 283}]};
get_lev_cfg({1006, 92}) ->
    #{base_attrs =>
          [{1, 4372},
           {4, 2065},
           {5, 1026},
           {6, 671},
           {7, 596},
           {3, 191},
           {2, 3161},
           {26, 174},
           {25, 174}],
      extra_attrs =>
          [{1, 6558},
           {4, 3098},
           {5, 1540},
           {6, 1007},
           {7, 894},
           {3, 286}]};
get_lev_cfg({1006, 93}) ->
    #{base_attrs =>
          [{1, 4422},
           {4, 2089},
           {5, 1038},
           {6, 679},
           {7, 603},
           {3, 193},
           {2, 3166},
           {26, 177},
           {25, 177}],
      extra_attrs =>
          [{1, 6634},
           {4, 3133},
           {5, 1558},
           {6, 1018},
           {7, 905},
           {3, 289}]};
get_lev_cfg({1006, 94}) ->
    #{base_attrs =>
          [{1, 4472},
           {4, 2112},
           {5, 1050},
           {6, 686},
           {7, 610},
           {3, 195},
           {2, 3171},
           {26, 179},
           {25, 179}],
      extra_attrs =>
          [{1, 6708},
           {4, 3168},
           {5, 1575},
           {6, 1030},
           {7, 915},
           {3, 293}]};
get_lev_cfg({1006, 95}) ->
    #{base_attrs =>
          [{1, 4521},
           {4, 2135},
           {5, 1062},
           {6, 694},
           {7, 616},
           {3, 197},
           {2, 3176},
           {26, 182},
           {25, 182}],
      extra_attrs =>
          [{1, 6782},
           {4, 3203},
           {5, 1593},
           {6, 1041},
           {7, 925},
           {3, 296}]};
get_lev_cfg({1006, 96}) ->
    #{base_attrs =>
          [{1, 4570},
           {4, 2158},
           {5, 1073},
           {6, 701},
           {7, 623},
           {3, 199},
           {2, 3181},
           {26, 184},
           {25, 184}],
      extra_attrs =>
          [{1, 6855},
           {4, 3238},
           {5, 1610},
           {6, 1052},
           {7, 935},
           {3, 299}]};
get_lev_cfg({1006, 97}) ->
    #{base_attrs =>
          [{1, 4618},
           {4, 2181},
           {5, 1084},
           {6, 709},
           {7, 630},
           {3, 201},
           {2, 3186},
           {26, 186},
           {25, 186}],
      extra_attrs =>
          [{1, 6927},
           {4, 3272},
           {5, 1627},
           {6, 1064},
           {7, 945},
           {3, 302}]};
get_lev_cfg({1006, 98}) ->
    #{base_attrs =>
          [{1, 4666},
           {4, 2204},
           {5, 1095},
           {6, 716},
           {7, 636},
           {3, 203},
           {2, 3191},
           {26, 189},
           {25, 189}],
      extra_attrs =>
          [{1, 6999},
           {4, 3306},
           {5, 1643},
           {6, 1074},
           {7, 954},
           {3, 305}]};
get_lev_cfg({1006, 99}) ->
    #{base_attrs =>
          [{1, 4713},
           {4, 2226},
           {5, 1107},
           {6, 723},
           {7, 643},
           {3, 205},
           {2, 3196},
           {26, 191},
           {25, 191}],
      extra_attrs =>
          [{1, 7070},
           {4, 3339},
           {5, 1660},
           {6, 1085},
           {7, 964},
           {3, 308}]};
get_lev_cfg({1006, 100}) ->
    #{base_attrs =>
          [{1, 4759},
           {4, 2248},
           {5, 1117},
           {6, 731},
           {7, 649},
           {3, 208},
           {2, 3201},
           {26, 194},
           {25, 194}],
      extra_attrs =>
          [{1, 7139},
           {4, 3372},
           {5, 1676},
           {6, 1096},
           {7, 974},
           {3, 312}]};
get_lev_cfg({1006, 101}) ->
    #{base_attrs =>
          [{1, 4805},
           {4, 2270},
           {5, 1128},
           {6, 738},
           {7, 655},
           {3, 210},
           {2, 3201},
           {26, 197},
           {25, 197}],
      extra_attrs =>
          [{1, 7208},
           {4, 3405},
           {5, 1693},
           {6, 1107},
           {7, 983},
           {3, 315}]};
get_lev_cfg({1006, 102}) ->
    #{base_attrs =>
          [{1, 4851},
           {4, 2291},
           {5, 1139},
           {6, 745},
           {7, 661},
           {3, 212},
           {2, 3201},
           {26, 200},
           {25, 200}],
      extra_attrs =>
          [{1, 7277},
           {4, 3437},
           {5, 1709},
           {6, 1117},
           {7, 992},
           {3, 318}]};
get_lev_cfg({1006, 103}) ->
    #{base_attrs =>
          [{1, 4896},
           {4, 2312},
           {5, 1149},
           {6, 751},
           {7, 667},
           {3, 213},
           {2, 3201},
           {26, 203},
           {25, 203}],
      extra_attrs =>
          [{1, 7344},
           {4, 3469},
           {5, 1724},
           {6, 1127},
           {7, 1001},
           {3, 320}]};
get_lev_cfg({1006, 104}) ->
    #{base_attrs =>
          [{1, 4940},
           {4, 2333},
           {5, 1160},
           {6, 758},
           {7, 674},
           {3, 215},
           {2, 3201},
           {26, 206},
           {25, 206}],
      extra_attrs =>
          [{1, 7411},
           {4, 3500},
           {5, 1740},
           {6, 1138},
           {7, 1011},
           {3, 323}]};
get_lev_cfg({1006, 105}) ->
    #{base_attrs =>
          [{1, 4984},
           {4, 2354},
           {5, 1170},
           {6, 765},
           {7, 679},
           {3, 217},
           {2, 3201},
           {26, 206},
           {25, 206}],
      extra_attrs =>
          [{1, 7476},
           {4, 3531},
           {5, 1756},
           {6, 1148},
           {7, 1019},
           {3, 326}]};
get_lev_cfg({1006, 106}) ->
    #{base_attrs =>
          [{1, 5027},
           {4, 2374},
           {5, 1180},
           {6, 772},
           {7, 685},
           {3, 219},
           {2, 3201},
           {26, 212},
           {25, 212}],
      extra_attrs =>
          [{1, 7541},
           {4, 3562},
           {5, 1771},
           {6, 1158},
           {7, 1028},
           {3, 329}]};
get_lev_cfg({1006, 107}) ->
    #{base_attrs =>
          [{1, 5070},
           {4, 2395},
           {5, 1190},
           {6, 778},
           {7, 691},
           {3, 221},
           {2, 3201},
           {26, 215},
           {25, 215}],
      extra_attrs =>
          [{1, 7606},
           {4, 3592},
           {5, 1786},
           {6, 1168},
           {7, 1037},
           {3, 332}]};
get_lev_cfg({1006, 108}) ->
    #{base_attrs =>
          [{1, 5112},
           {4, 2415},
           {5, 1200},
           {6, 785},
           {7, 697},
           {3, 223},
           {2, 3201},
           {26, 218},
           {25, 218}],
      extra_attrs =>
          [{1, 7669},
           {4, 3622},
           {5, 1801},
           {6, 1177},
           {7, 1046},
           {3, 335}]};
get_lev_cfg({1006, 109}) ->
    #{base_attrs =>
          [{1, 5154},
           {4, 2434},
           {5, 1210},
           {6, 791},
           {7, 703},
           {3, 225},
           {2, 3201},
           {26, 221},
           {25, 221}],
      extra_attrs =>
          [{1, 7731},
           {4, 3652},
           {5, 1815},
           {6, 1187},
           {7, 1054},
           {3, 337}]};
get_lev_cfg({1006, 110}) ->
    #{base_attrs =>
          [{1, 5195},
           {4, 2454},
           {5, 1220},
           {6, 797},
           {7, 708},
           {3, 227},
           {2, 3201},
           {26, 224},
           {25, 224}],
      extra_attrs =>
          [{1, 7793},
           {4, 3681},
           {5, 1830},
           {6, 1196},
           {7, 1063},
           {3, 340}]};
get_lev_cfg({1006, 111}) ->
    #{base_attrs =>
          [{1, 5236},
           {4, 2473},
           {5, 1229},
           {6, 804},
           {7, 714},
           {3, 228},
           {2, 3201},
           {26, 227},
           {25, 227}],
      extra_attrs =>
          [{1, 7854},
           {4, 3710},
           {5, 1844},
           {6, 1206},
           {7, 1071},
           {3, 343}]};
get_lev_cfg({1006, 112}) ->
    #{base_attrs =>
          [{1, 5276},
           {4, 2492},
           {5, 1239},
           {6, 810},
           {7, 719},
           {3, 230},
           {2, 3201},
           {26, 230},
           {25, 230}],
      extra_attrs =>
          [{1, 7914},
           {4, 3738},
           {5, 1858},
           {6, 1215},
           {7, 1079},
           {3, 345}]};
get_lev_cfg({1006, 113}) ->
    #{base_attrs =>
          [{1, 5316},
           {4, 2511},
           {5, 1248},
           {6, 816},
           {7, 725},
           {3, 232},
           {2, 3201},
           {26, 233},
           {25, 233}],
      extra_attrs =>
          [{1, 7974},
           {4, 3766},
           {5, 1872},
           {6, 1224},
           {7, 1087},
           {3, 348}]};
get_lev_cfg({1006, 114}) ->
    #{base_attrs =>
          [{1, 5354},
           {4, 2529},
           {5, 1257},
           {6, 822},
           {7, 730},
           {3, 234},
           {2, 3201},
           {26, 236},
           {25, 236}],
      extra_attrs =>
          [{1, 8032},
           {4, 3794},
           {5, 1886},
           {6, 1233},
           {7, 1095},
           {3, 351}]};
get_lev_cfg({1006, 115}) ->
    #{base_attrs =>
          [{1, 5393},
           {4, 2547},
           {5, 1266},
           {6, 828},
           {7, 735},
           {3, 235},
           {2, 3201},
           {26, 239},
           {25, 239}],
      extra_attrs =>
          [{1, 8090},
           {4, 3821},
           {5, 1900},
           {6, 1242},
           {7, 1103},
           {3, 353}]};
get_lev_cfg({1006, 116}) ->
    #{base_attrs =>
          [{1, 5431},
           {4, 2565},
           {5, 1275},
           {6, 834},
           {7, 740},
           {3, 237},
           {2, 3201},
           {26, 242},
           {25, 242}],
      extra_attrs =>
          [{1, 8147},
           {4, 3848},
           {5, 1913},
           {6, 1251},
           {7, 1111},
           {3, 356}]};
get_lev_cfg({1006, 117}) ->
    #{base_attrs =>
          [{1, 5468},
           {4, 2583},
           {5, 1284},
           {6, 839},
           {7, 746},
           {3, 238},
           {2, 3201},
           {26, 245},
           {25, 245}],
      extra_attrs =>
          [{1, 8203},
           {4, 3874},
           {5, 1926},
           {6, 1259},
           {7, 1119},
           {3, 358}]};
get_lev_cfg({1006, 118}) ->
    #{base_attrs =>
          [{1, 5505},
           {4, 2600},
           {5, 1293},
           {6, 845},
           {7, 751},
           {3, 240},
           {2, 3201},
           {26, 248},
           {25, 248}],
      extra_attrs =>
          [{1, 8258},
           {4, 3901},
           {5, 1939},
           {6, 1268},
           {7, 1126},
           {3, 360}]};
get_lev_cfg({1006, 119}) ->
    #{base_attrs =>
          [{1, 5541},
           {4, 2617},
           {5, 1301},
           {6, 851},
           {7, 756},
           {3, 242},
           {2, 3201},
           {26, 251},
           {25, 251}],
      extra_attrs =>
          [{1, 8312},
           {4, 3926},
           {5, 1952},
           {6, 1276},
           {7, 1134},
           {3, 363}]};
get_lev_cfg({1006, 120}) ->
    #{base_attrs =>
          [{1, 5577},
           {4, 2634},
           {5, 1310},
           {6, 856},
           {7, 760},
           {3, 243},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8366},
           {4, 3952},
           {5, 1965},
           {6, 1284},
           {7, 1141},
           {3, 365}]};
get_lev_cfg({1006, 121}) ->
    #{base_attrs =>
          [{1, 5613},
           {4, 2651},
           {5, 1318},
           {6, 862},
           {7, 765},
           {3, 245},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8419},
           {4, 3977},
           {5, 1977},
           {6, 1293},
           {7, 1148},
           {3, 367}]};
get_lev_cfg({1006, 122}) ->
    #{base_attrs =>
          [{1, 5647},
           {4, 2667},
           {5, 1326},
           {6, 867},
           {7, 770},
           {3, 246},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8471},
           {4, 4001},
           {5, 1989},
           {6, 1301},
           {7, 1155},
           {3, 370}]};
get_lev_cfg({1006, 123}) ->
    #{base_attrs =>
          [{1, 5681},
           {4, 2683},
           {5, 1334},
           {6, 872},
           {7, 775},
           {3, 248},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8522},
           {4, 4025},
           {5, 2001},
           {6, 1308},
           {7, 1162},
           {3, 372}]};
get_lev_cfg({1006, 124}) ->
    #{base_attrs =>
          [{1, 5715},
           {4, 2699},
           {5, 1342},
           {6, 877},
           {7, 779},
           {3, 249},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8573},
           {4, 4049},
           {5, 2013},
           {6, 1316},
           {7, 1169},
           {3, 374}]};
get_lev_cfg({1006, 125}) ->
    #{base_attrs =>
          [{1, 5748},
           {4, 2715},
           {5, 1350},
           {6, 882},
           {7, 784},
           {3, 251},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8622},
           {4, 4072},
           {5, 2025},
           {6, 1324},
           {7, 1176},
           {3, 376}]};
get_lev_cfg({1006, 126}) ->
    #{base_attrs =>
          [{1, 5780},
           {4, 2730},
           {5, 1357},
           {6, 887},
           {7, 788},
           {3, 252},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8671},
           {4, 4096},
           {5, 2036},
           {6, 1331},
           {7, 1182},
           {3, 378}]};
get_lev_cfg({1006, 127}) ->
    #{base_attrs =>
          [{1, 5813},
           {4, 2745},
           {5, 1365},
           {6, 892},
           {7, 793},
           {3, 254},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8719},
           {4, 4118},
           {5, 2047},
           {6, 1339},
           {7, 1189},
           {3, 381}]};
get_lev_cfg({1006, 128}) ->
    #{base_attrs =>
          [{1, 5844},
           {4, 2760},
           {5, 1372},
           {6, 897},
           {7, 797},
           {3, 255},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8766},
           {4, 4141},
           {5, 2059},
           {6, 1346},
           {7, 1195},
           {3, 383}]};
get_lev_cfg({1006, 129}) ->
    #{base_attrs =>
          [{1, 5875},
           {4, 2775},
           {5, 1379},
           {6, 902},
           {7, 801},
           {3, 256},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8812},
           {4, 4162},
           {5, 2069},
           {6, 1353},
           {7, 1202},
           {3, 385}]};
get_lev_cfg({1006, 130}) ->
    #{base_attrs =>
          [{1, 5905},
           {4, 2789},
           {5, 1387},
           {6, 907},
           {7, 805},
           {3, 258},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8858},
           {4, 4184},
           {5, 2080},
           {6, 1360},
           {7, 1208},
           {3, 387}]};
get_lev_cfg({1008, 1}) ->
    #{base_attrs =>
          [{1, 172},
           {4, 31},
           {5, 24},
           {6, 32},
           {7, 14},
           {3, 5},
           {2, 200},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 258}, {4, 47}, {5, 37}, {6, 48}, {7, 21}, {3, 8}]};
get_lev_cfg({1008, 2}) ->
    #{base_attrs =>
          [{1, 206},
           {4, 38},
           {5, 29},
           {6, 38},
           {7, 17},
           {3, 6},
           {2, 576},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 309},
           {4, 57},
           {5, 44},
           {6, 58},
           {7, 25},
           {3, 10}]};
get_lev_cfg({1008, 3}) ->
    #{base_attrs =>
          [{1, 241},
           {4, 44},
           {5, 34},
           {6, 45},
           {7, 20},
           {3, 8},
           {2, 672},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 361},
           {4, 66},
           {5, 52},
           {6, 67},
           {7, 30},
           {3, 12}]};
get_lev_cfg({1008, 4}) ->
    #{base_attrs =>
          [{1, 275},
           {4, 50},
           {5, 39},
           {6, 51},
           {7, 23},
           {3, 9},
           {2, 767},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 413},
           {4, 76},
           {5, 59},
           {6, 77},
           {7, 34},
           {3, 13}]};
get_lev_cfg({1008, 5}) ->
    #{base_attrs =>
          [{1, 309},
           {4, 57},
           {5, 44},
           {6, 58},
           {7, 25},
           {3, 10},
           {2, 864},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 464},
           {4, 85},
           {5, 66},
           {6, 87},
           {7, 38},
           {3, 15}]};
get_lev_cfg({1008, 6}) ->
    #{base_attrs =>
          [{1, 344},
           {4, 63},
           {5, 49},
           {6, 64},
           {7, 28},
           {3, 11},
           {2, 960},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 516},
           {4, 95},
           {5, 74},
           {6, 96},
           {7, 43},
           {3, 17}]};
get_lev_cfg({1008, 7}) ->
    #{base_attrs =>
          [{1, 378},
           {4, 69},
           {5, 54},
           {6, 70},
           {7, 31},
           {3, 12},
           {2, 1055},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 568},
           {4, 104},
           {5, 81},
           {6, 106},
           {7, 47},
           {3, 19}]};
get_lev_cfg({1008, 8}) ->
    #{base_attrs =>
          [{1, 413},
           {4, 76},
           {5, 59},
           {6, 77},
           {7, 34},
           {3, 13},
           {2, 1152},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 619},
           {4, 114},
           {5, 89},
           {6, 116},
           {7, 51},
           {3, 20}]};
get_lev_cfg({1008, 9}) ->
    #{base_attrs =>
          [{1, 447},
           {4, 82},
           {5, 64},
           {6, 83},
           {7, 37},
           {3, 14},
           {2, 1248},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 671},
           {4, 124},
           {5, 96},
           {6, 125},
           {7, 56},
           {3, 22}]};
get_lev_cfg({1008, 10}) ->
    #{base_attrs =>
          [{1, 516},
           {4, 95},
           {5, 74},
           {6, 96},
           {7, 43},
           {3, 17},
           {2, 1440},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 774},
           {4, 143},
           {5, 111},
           {6, 145},
           {7, 64},
           {3, 25}]};
get_lev_cfg({1008, 11}) ->
    #{base_attrs =>
          [{1, 585},
           {4, 108},
           {5, 84},
           {6, 109},
           {7, 48},
           {3, 19},
           {2, 1631},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 877},
           {4, 162},
           {5, 126},
           {6, 164},
           {7, 73},
           {3, 29}]};
get_lev_cfg({1008, 12}) ->
    #{base_attrs =>
          [{1, 654},
           {4, 120},
           {5, 94},
           {6, 122},
           {7, 54},
           {3, 21},
           {2, 1824},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 981},
           {4, 181},
           {5, 141},
           {6, 183},
           {7, 82},
           {3, 32}]};
get_lev_cfg({1008, 13}) ->
    #{base_attrs =>
          [{1, 723},
           {4, 133},
           {5, 104},
           {6, 135},
           {7, 60},
           {3, 24},
           {2, 2016},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1084},
           {4, 200},
           {5, 156},
           {6, 203},
           {7, 90},
           {3, 36}]};
get_lev_cfg({1008, 14}) ->
    #{base_attrs =>
          [{1, 791},
           {4, 146},
           {5, 114},
           {6, 148},
           {7, 66},
           {3, 26},
           {2, 2207},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1187},
           {4, 219},
           {5, 171},
           {6, 222},
           {7, 99},
           {3, 39}]};
get_lev_cfg({1008, 15}) ->
    #{base_attrs =>
          [{1, 860},
           {4, 159},
           {5, 123},
           {6, 161},
           {7, 72},
           {3, 28},
           {2, 2400},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1291},
           {4, 238},
           {5, 185},
           {6, 241},
           {7, 108},
           {3, 43}]};
get_lev_cfg({1008, 16}) ->
    #{base_attrs =>
          [{1, 929},
           {4, 171},
           {5, 133},
           {6, 174},
           {7, 77},
           {3, 31},
           {2, 2408},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1394},
           {4, 257},
           {5, 200},
           {6, 261},
           {7, 116},
           {3, 46}]};
get_lev_cfg({1008, 17}) ->
    #{base_attrs =>
          [{1, 998},
           {4, 184},
           {5, 143},
           {6, 187},
           {7, 83},
           {3, 33},
           {2, 2417},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1497},
           {4, 276},
           {5, 215},
           {6, 280},
           {7, 125},
           {3, 50}]};
get_lev_cfg({1008, 18}) ->
    #{base_attrs =>
          [{1, 1067},
           {4, 197},
           {5, 153},
           {6, 200},
           {7, 89},
           {3, 35},
           {2, 2426},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1600},
           {4, 295},
           {5, 230},
           {6, 300},
           {7, 133},
           {3, 53}]};
get_lev_cfg({1008, 19}) ->
    #{base_attrs =>
          [{1, 1136},
           {4, 209},
           {5, 163},
           {6, 212},
           {7, 95},
           {3, 38},
           {2, 2436},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1704},
           {4, 314},
           {5, 245},
           {6, 319},
           {7, 142},
           {3, 57}]};
get_lev_cfg({1008, 20}) ->
    #{base_attrs =>
          [{1, 1205},
           {4, 222},
           {5, 173},
           {6, 225},
           {7, 100},
           {3, 40},
           {2, 2446},
           {26, 2},
           {25, 2}],
      extra_attrs =>
          [{1, 1807},
           {4, 333},
           {5, 260},
           {6, 338},
           {7, 151},
           {3, 60}]};
get_lev_cfg({1008, 21}) ->
    #{base_attrs =>
          [{1, 1273},
           {4, 235},
           {5, 183},
           {6, 238},
           {7, 106},
           {3, 42},
           {2, 2457},
           {26, 4},
           {25, 4}],
      extra_attrs =>
          [{1, 1910},
           {4, 353},
           {5, 275},
           {6, 358},
           {7, 159},
           {3, 64}]};
get_lev_cfg({1008, 22}) ->
    #{base_attrs =>
          [{1, 1342},
           {4, 248},
           {5, 193},
           {6, 251},
           {7, 112},
           {3, 44},
           {2, 2468},
           {26, 6},
           {25, 6}],
      extra_attrs =>
          [{1, 2014},
           {4, 372},
           {5, 290},
           {6, 377},
           {7, 168},
           {3, 67}]};
get_lev_cfg({1008, 23}) ->
    #{base_attrs =>
          [{1, 1411},
           {4, 260},
           {5, 203},
           {6, 264},
           {7, 118},
           {3, 47},
           {2, 2480},
           {26, 9},
           {25, 9}],
      extra_attrs =>
          [{1, 2117},
           {4, 391},
           {5, 305},
           {6, 396},
           {7, 177},
           {3, 70}]};
get_lev_cfg({1008, 24}) ->
    #{base_attrs =>
          [{1, 1480},
           {4, 273},
           {5, 213},
           {6, 277},
           {7, 123},
           {3, 49},
           {2, 2492},
           {26, 11},
           {25, 11}],
      extra_attrs =>
          [{1, 2220},
           {4, 410},
           {5, 319},
           {6, 416},
           {7, 185},
           {3, 74}]};
get_lev_cfg({1008, 25}) ->
    #{base_attrs =>
          [{1, 1549},
           {4, 286},
           {5, 223},
           {6, 290},
           {7, 129},
           {3, 51},
           {2, 2505},
           {26, 14},
           {25, 14}],
      extra_attrs =>
          [{1, 2323},
           {4, 429},
           {5, 334},
           {6, 435},
           {7, 194},
           {3, 77}]};
get_lev_cfg({1008, 26}) ->
    #{base_attrs =>
          [{1, 1618},
           {4, 298},
           {5, 233},
           {6, 303},
           {7, 135},
           {3, 54},
           {2, 2518},
           {26, 16},
           {25, 16}],
      extra_attrs =>
          [{1, 2427},
           {4, 448},
           {5, 349},
           {6, 454},
           {7, 203},
           {3, 81}]};
get_lev_cfg({1008, 27}) ->
    #{base_attrs =>
          [{1, 1687},
           {4, 311},
           {5, 243},
           {6, 316},
           {7, 141},
           {3, 56},
           {2, 2532},
           {26, 18},
           {25, 18}],
      extra_attrs =>
          [{1, 2530},
           {4, 467},
           {5, 364},
           {6, 474},
           {7, 211},
           {3, 84}]};
get_lev_cfg({1008, 28}) ->
    #{base_attrs =>
          [{1, 1755},
           {4, 324},
           {5, 252},
           {6, 329},
           {7, 146},
           {3, 58},
           {2, 2546},
           {26, 21},
           {25, 21}],
      extra_attrs =>
          [{1, 2633},
           {4, 486},
           {5, 379},
           {6, 493},
           {7, 220},
           {3, 88}]};
get_lev_cfg({1008, 29}) ->
    #{base_attrs =>
          [{1, 1824},
           {4, 337},
           {5, 262},
           {6, 342},
           {7, 152},
           {3, 61},
           {2, 2561},
           {26, 23},
           {25, 23}],
      extra_attrs =>
          [{1, 2737},
           {4, 505},
           {5, 394},
           {6, 513},
           {7, 229},
           {3, 91}]};
get_lev_cfg({1008, 30}) ->
    #{base_attrs =>
          [{1, 1893},
           {4, 349},
           {5, 272},
           {6, 354},
           {7, 158},
           {3, 63},
           {2, 2576},
           {26, 26},
           {25, 26}],
      extra_attrs =>
          [{1, 2840},
           {4, 524},
           {5, 409},
           {6, 532},
           {7, 237},
           {3, 95}]};
get_lev_cfg({1008, 31}) ->
    #{base_attrs =>
          [{1, 1962},
           {4, 362},
           {5, 282},
           {6, 367},
           {7, 164},
           {3, 65},
           {2, 2592},
           {26, 28},
           {25, 28}],
      extra_attrs =>
          [{1, 2943},
           {4, 543},
           {5, 424},
           {6, 551},
           {7, 246},
           {3, 98}]};
get_lev_cfg({1008, 32}) ->
    #{base_attrs =>
          [{1, 2031},
           {4, 375},
           {5, 292},
           {6, 380},
           {7, 169},
           {3, 68},
           {2, 2608},
           {26, 30},
           {25, 30}],
      extra_attrs =>
          [{1, 3047},
           {4, 562},
           {5, 438},
           {6, 571},
           {7, 254},
           {3, 102}]};
get_lev_cfg({1008, 33}) ->
    #{base_attrs =>
          [{1, 2100},
           {4, 388},
           {5, 302},
           {6, 393},
           {7, 175},
           {3, 70},
           {2, 2625},
           {26, 33},
           {25, 33}],
      extra_attrs =>
          [{1, 3150},
           {4, 582},
           {5, 453},
           {6, 590},
           {7, 263},
           {3, 105}]};
get_lev_cfg({1008, 34}) ->
    #{base_attrs =>
          [{1, 2169},
           {4, 400},
           {5, 312},
           {6, 406},
           {7, 181},
           {3, 72},
           {2, 2642},
           {26, 35},
           {25, 35}],
      extra_attrs =>
          [{1, 3253},
           {4, 601},
           {5, 468},
           {6, 609},
           {7, 272},
           {3, 109}]};
get_lev_cfg({1008, 35}) ->
    #{base_attrs =>
          [{1, 2237},
           {4, 413},
           {5, 322},
           {6, 419},
           {7, 187},
           {3, 74},
           {2, 2660},
           {26, 38},
           {25, 38}],
      extra_attrs =>
          [{1, 3356},
           {4, 620},
           {5, 483},
           {6, 629},
           {7, 280},
           {3, 112}]};
get_lev_cfg({1008, 36}) ->
    #{base_attrs =>
          [{1, 2306},
           {4, 426},
           {5, 332},
           {6, 432},
           {7, 193},
           {3, 77},
           {2, 2678},
           {26, 40},
           {25, 40}],
      extra_attrs =>
          [{1, 3460},
           {4, 639},
           {5, 498},
           {6, 648},
           {7, 289},
           {3, 115}]};
get_lev_cfg({1008, 37}) ->
    #{base_attrs =>
          [{1, 2375},
           {4, 438},
           {5, 342},
           {6, 445},
           {7, 198},
           {3, 79},
           {2, 2697},
           {26, 42},
           {25, 42}],
      extra_attrs =>
          [{1, 3563},
           {4, 658},
           {5, 513},
           {6, 667},
           {7, 298},
           {3, 119}]};
get_lev_cfg({1008, 38}) ->
    #{base_attrs =>
          [{1, 2444},
           {4, 451},
           {5, 352},
           {6, 458},
           {7, 204},
           {3, 81},
           {2, 2716},
           {26, 45},
           {25, 45}],
      extra_attrs =>
          [{1, 3666},
           {4, 677},
           {5, 528},
           {6, 687},
           {7, 306},
           {3, 122}]};
get_lev_cfg({1008, 39}) ->
    #{base_attrs =>
          [{1, 2513},
           {4, 464},
           {5, 362},
           {6, 471},
           {7, 210},
           {3, 84},
           {2, 2736},
           {26, 47},
           {25, 47}],
      extra_attrs =>
          [{1, 3770},
           {4, 696},
           {5, 543},
           {6, 706},
           {7, 315},
           {3, 126}]};
get_lev_cfg({1008, 40}) ->
    #{base_attrs =>
          [{1, 2582},
           {4, 477},
           {5, 371},
           {6, 483},
           {7, 216},
           {3, 86},
           {2, 2756},
           {26, 50},
           {25, 50}],
      extra_attrs =>
          [{1, 3873},
           {4, 715},
           {5, 557},
           {6, 725},
           {7, 324},
           {3, 129}]};
get_lev_cfg({1008, 41}) ->
    #{base_attrs =>
          [{1, 2651},
           {4, 489},
           {5, 381},
           {6, 496},
           {7, 221},
           {3, 88},
           {2, 2777},
           {26, 52},
           {25, 52}],
      extra_attrs =>
          [{1, 3976},
           {4, 734},
           {5, 572},
           {6, 745},
           {7, 332},
           {3, 133}]};
get_lev_cfg({1008, 42}) ->
    #{base_attrs =>
          [{1, 2719},
           {4, 502},
           {5, 391},
           {6, 509},
           {7, 227},
           {3, 91},
           {2, 2798},
           {26, 54},
           {25, 54}],
      extra_attrs =>
          [{1, 4079},
           {4, 753},
           {5, 587},
           {6, 764},
           {7, 341},
           {3, 136}]};
get_lev_cfg({1008, 43}) ->
    #{base_attrs =>
          [{1, 2788},
           {4, 515},
           {5, 401},
           {6, 522},
           {7, 233},
           {3, 93},
           {2, 2820},
           {26, 57},
           {25, 57}],
      extra_attrs =>
          [{1, 4183},
           {4, 772},
           {5, 602},
           {6, 784},
           {7, 350},
           {3, 140}]};
get_lev_cfg({1008, 44}) ->
    #{base_attrs =>
          [{1, 2857},
           {4, 527},
           {5, 411},
           {6, 535},
           {7, 239},
           {3, 95},
           {2, 2842},
           {26, 59},
           {25, 59}],
      extra_attrs =>
          [{1, 4286},
           {4, 791},
           {5, 617},
           {6, 803},
           {7, 358},
           {3, 143}]};
get_lev_cfg({1008, 45}) ->
    #{base_attrs =>
          [{1, 2926},
           {4, 540},
           {5, 421},
           {6, 548},
           {7, 244},
           {3, 98},
           {2, 2865},
           {26, 62},
           {25, 62}],
      extra_attrs =>
          [{1, 4389},
           {4, 810},
           {5, 632},
           {6, 822},
           {7, 367},
           {3, 147}]};
get_lev_cfg({1008, 46}) ->
    #{base_attrs =>
          [{1, 2995},
           {4, 553},
           {5, 431},
           {6, 561},
           {7, 250},
           {3, 100},
           {2, 2888},
           {26, 64},
           {25, 64}],
      extra_attrs =>
          [{1, 4493},
           {4, 830},
           {5, 647},
           {6, 842},
           {7, 375},
           {3, 150}]};
get_lev_cfg({1008, 47}) ->
    #{base_attrs =>
          [{1, 3064},
           {4, 566},
           {5, 441},
           {6, 574},
           {7, 256},
           {3, 102},
           {2, 2912},
           {26, 66},
           {25, 66}],
      extra_attrs =>
          [{1, 4596},
           {4, 849},
           {5, 662},
           {6, 861},
           {7, 384},
           {3, 153}]};
get_lev_cfg({1008, 48}) ->
    #{base_attrs =>
          [{1, 3133},
           {4, 578},
           {5, 451},
           {6, 587},
           {7, 262},
           {3, 104},
           {2, 2936},
           {26, 69},
           {25, 69}],
      extra_attrs =>
          [{1, 4699},
           {4, 868},
           {5, 676},
           {6, 880},
           {7, 393},
           {3, 157}]};
get_lev_cfg({1008, 49}) ->
    #{base_attrs =>
          [{1, 3201},
           {4, 591},
           {5, 461},
           {6, 600},
           {7, 267},
           {3, 107},
           {2, 2961},
           {26, 71},
           {25, 71}],
      extra_attrs =>
          [{1, 4802},
           {4, 887},
           {5, 691},
           {6, 900},
           {7, 401},
           {3, 160}]};
get_lev_cfg({1008, 50}) ->
    #{base_attrs =>
          [{1, 3270},
           {4, 604},
           {5, 471},
           {6, 613},
           {7, 273},
           {3, 109},
           {2, 2986},
           {26, 74},
           {25, 74}],
      extra_attrs =>
          [{1, 4906},
           {4, 906},
           {5, 706},
           {6, 919},
           {7, 410},
           {3, 164}]};
get_lev_cfg({1008, 51}) ->
    #{base_attrs =>
          [{1, 3339},
           {4, 616},
           {5, 481},
           {6, 625},
           {7, 279},
           {3, 111},
           {2, 3012},
           {26, 76},
           {25, 76}],
      extra_attrs =>
          [{1, 5009},
           {4, 925},
           {5, 721},
           {6, 938},
           {7, 419},
           {3, 167}]};
get_lev_cfg({1008, 52}) ->
    #{base_attrs =>
          [{1, 3408},
           {4, 629},
           {5, 491},
           {6, 638},
           {7, 285},
           {3, 114},
           {2, 3015},
           {26, 78},
           {25, 78}],
      extra_attrs =>
          [{1, 5112},
           {4, 944},
           {5, 736},
           {6, 958},
           {7, 427},
           {3, 171}]};
get_lev_cfg({1008, 53}) ->
    #{base_attrs =>
          [{1, 3477},
           {4, 642},
           {5, 500},
           {6, 651},
           {7, 290},
           {3, 116},
           {2, 3018},
           {26, 81},
           {25, 81}],
      extra_attrs =>
          [{1, 5216},
           {4, 963},
           {5, 751},
           {6, 977},
           {7, 436},
           {3, 174}]};
get_lev_cfg({1008, 54}) ->
    #{base_attrs =>
          [{1, 3546},
           {4, 655},
           {5, 510},
           {6, 664},
           {7, 296},
           {3, 118},
           {2, 3021},
           {26, 83},
           {25, 83}],
      extra_attrs =>
          [{1, 5319},
           {4, 982},
           {5, 766},
           {6, 997},
           {7, 445},
           {3, 178}]};
get_lev_cfg({1008, 55}) ->
    #{base_attrs =>
          [{1, 3615},
           {4, 667},
           {5, 520},
           {6, 677},
           {7, 302},
           {3, 121},
           {2, 3024},
           {26, 86},
           {25, 86}],
      extra_attrs =>
          [{1, 5422},
           {4, 1001},
           {5, 781},
           {6, 1016},
           {7, 453},
           {3, 181}]};
get_lev_cfg({1008, 56}) ->
    #{base_attrs =>
          [{1, 3683},
           {4, 680},
           {5, 530},
           {6, 690},
           {7, 308},
           {3, 123},
           {2, 3027},
           {26, 88},
           {25, 88}],
      extra_attrs =>
          [{1, 5525},
           {4, 1020},
           {5, 796},
           {6, 1035},
           {7, 462},
           {3, 185}]};
get_lev_cfg({1008, 57}) ->
    #{base_attrs =>
          [{1, 3752},
           {4, 693},
           {5, 540},
           {6, 703},
           {7, 313},
           {3, 125},
           {2, 3030},
           {26, 90},
           {25, 90}],
      extra_attrs =>
          [{1, 5629},
           {4, 1039},
           {5, 810},
           {6, 1055},
           {7, 470},
           {3, 188}]};
get_lev_cfg({1008, 58}) ->
    #{base_attrs =>
          [{1, 3821},
           {4, 706},
           {5, 550},
           {6, 716},
           {7, 319},
           {3, 128},
           {2, 3033},
           {26, 93},
           {25, 93}],
      extra_attrs =>
          [{1, 5732},
           {4, 1059},
           {5, 825},
           {6, 1074},
           {7, 479},
           {3, 192}]};
get_lev_cfg({1008, 59}) ->
    #{base_attrs =>
          [{1, 3890},
           {4, 718},
           {5, 560},
           {6, 729},
           {7, 325},
           {3, 130},
           {2, 3036},
           {26, 95},
           {25, 95}],
      extra_attrs =>
          [{1, 5835},
           {4, 1078},
           {5, 840},
           {6, 1093},
           {7, 488},
           {3, 195}]};
get_lev_cfg({1008, 60}) ->
    #{base_attrs =>
          [{1, 4037},
           {4, 745},
           {5, 581},
           {6, 756},
           {7, 337},
           {3, 135},
           {2, 3039},
           {26, 98},
           {25, 98}],
      extra_attrs =>
          [{1, 6056},
           {4, 1118},
           {5, 872},
           {6, 1135},
           {7, 506},
           {3, 202}]};
get_lev_cfg({1008, 61}) ->
    #{base_attrs =>
          [{1, 4148},
           {4, 766},
           {5, 597},
           {6, 777},
           {7, 347},
           {3, 138},
           {2, 3042},
           {26, 100},
           {25, 100}],
      extra_attrs =>
          [{1, 6222},
           {4, 1149},
           {5, 896},
           {6, 1166},
           {7, 520},
           {3, 208}]};
get_lev_cfg({1008, 62}) ->
    #{base_attrs =>
          [{1, 4257},
           {4, 786},
           {5, 613},
           {6, 797},
           {7, 356},
           {3, 142},
           {2, 3045},
           {26, 102},
           {25, 102}],
      extra_attrs =>
          [{1, 6386},
           {4, 1179},
           {5, 919},
           {6, 1196},
           {7, 534},
           {3, 213}]};
get_lev_cfg({1008, 63}) ->
    #{base_attrs =>
          [{1, 4365},
           {4, 806},
           {5, 628},
           {6, 818},
           {7, 365},
           {3, 146},
           {2, 3048},
           {26, 105},
           {25, 105}],
      extra_attrs =>
          [{1, 6548},
           {4, 1209},
           {5, 943},
           {6, 1227},
           {7, 547},
           {3, 219}]};
get_lev_cfg({1008, 64}) ->
    #{base_attrs =>
          [{1, 4473},
           {4, 826},
           {5, 644},
           {6, 838},
           {7, 374},
           {3, 149},
           {2, 3051},
           {26, 107},
           {25, 107}],
      extra_attrs =>
          [{1, 6710},
           {4, 1239},
           {5, 966},
           {6, 1257},
           {7, 561},
           {3, 224}]};
get_lev_cfg({1008, 65}) ->
    #{base_attrs =>
          [{1, 4580},
           {4, 846},
           {5, 659},
           {6, 858},
           {7, 383},
           {3, 153},
           {2, 3054},
           {26, 110},
           {25, 110}],
      extra_attrs =>
          [{1, 6870},
           {4, 1269},
           {5, 989},
           {6, 1287},
           {7, 574},
           {3, 230}]};
get_lev_cfg({1008, 66}) ->
    #{base_attrs =>
          [{1, 4686},
           {4, 865},
           {5, 675},
           {6, 878},
           {7, 392},
           {3, 157},
           {2, 3057},
           {26, 112},
           {25, 112}],
      extra_attrs =>
          [{1, 7029},
           {4, 1298},
           {5, 1012},
           {6, 1317},
           {7, 588},
           {3, 235}]};
get_lev_cfg({1008, 67}) ->
    #{base_attrs =>
          [{1, 4791},
           {4, 885},
           {5, 690},
           {6, 898},
           {7, 400},
           {3, 160},
           {2, 3060},
           {26, 114},
           {25, 114}],
      extra_attrs =>
          [{1, 7186},
           {4, 1327},
           {5, 1035},
           {6, 1347},
           {7, 601},
           {3, 240}]};
get_lev_cfg({1008, 68}) ->
    #{base_attrs =>
          [{1, 4895},
           {4, 904},
           {5, 705},
           {6, 917},
           {7, 409},
           {3, 164},
           {2, 3063},
           {26, 117},
           {25, 117}],
      extra_attrs =>
          [{1, 7342},
           {4, 1356},
           {5, 1057},
           {6, 1376},
           {7, 614},
           {3, 246}]};
get_lev_cfg({1008, 69}) ->
    #{base_attrs =>
          [{1, 4998},
           {4, 923},
           {5, 720},
           {6, 936},
           {7, 418},
           {3, 167},
           {2, 3066},
           {26, 119},
           {25, 119}],
      extra_attrs =>
          [{1, 7497},
           {4, 1385},
           {5, 1080},
           {6, 1405},
           {7, 627},
           {3, 251}]};
get_lev_cfg({1008, 70}) ->
    #{base_attrs =>
          [{1, 5100},
           {4, 942},
           {5, 734},
           {6, 956},
           {7, 426},
           {3, 170},
           {2, 3070},
           {26, 122},
           {25, 122}],
      extra_attrs =>
          [{1, 7651},
           {4, 1413},
           {5, 1102},
           {6, 1434},
           {7, 640},
           {3, 256}]};
get_lev_cfg({1008, 71}) ->
    #{base_attrs =>
          [{1, 5201},
           {4, 961},
           {5, 749},
           {6, 975},
           {7, 435},
           {3, 174},
           {2, 3074},
           {26, 124},
           {25, 124}],
      extra_attrs =>
          [{1, 7802},
           {4, 1441},
           {5, 1124},
           {6, 1462},
           {7, 652},
           {3, 261}]};
get_lev_cfg({1008, 72}) ->
    #{base_attrs =>
          [{1, 5302},
           {4, 979},
           {5, 763},
           {6, 993},
           {7, 443},
           {3, 177},
           {2, 3078},
           {26, 126},
           {25, 126}],
      extra_attrs =>
          [{1, 7953},
           {4, 1469},
           {5, 1145},
           {6, 1490},
           {7, 665},
           {3, 266}]};
get_lev_cfg({1008, 73}) ->
    #{base_attrs =>
          [{1, 5402},
           {4, 998},
           {5, 778},
           {6, 1012},
           {7, 452},
           {3, 181},
           {2, 3082},
           {26, 129},
           {25, 129}],
      extra_attrs =>
          [{1, 8103},
           {4, 1497},
           {5, 1167},
           {6, 1518},
           {7, 678},
           {3, 271}]};
get_lev_cfg({1008, 74}) ->
    #{base_attrs =>
          [{1, 5501},
           {4, 1016},
           {5, 792},
           {6, 1031},
           {7, 460},
           {3, 184},
           {2, 3086},
           {26, 131},
           {25, 131}],
      extra_attrs =>
          [{1, 8251},
           {4, 1524},
           {5, 1188},
           {6, 1546},
           {7, 690},
           {3, 276}]};
get_lev_cfg({1008, 75}) ->
    #{base_attrs =>
          [{1, 5598},
           {4, 1034},
           {5, 806},
           {6, 1049},
           {7, 468},
           {3, 187},
           {2, 3090},
           {26, 134},
           {25, 134}],
      extra_attrs =>
          [{1, 8398},
           {4, 1551},
           {5, 1209},
           {6, 1574},
           {7, 702},
           {3, 281}]};
get_lev_cfg({1008, 76}) ->
    #{base_attrs =>
          [{1, 5695},
           {4, 1052},
           {5, 820},
           {6, 1067},
           {7, 476},
           {3, 190},
           {2, 3094},
           {26, 136},
           {25, 136}],
      extra_attrs =>
          [{1, 8543},
           {4, 1578},
           {5, 1230},
           {6, 1601},
           {7, 714},
           {3, 286}]};
get_lev_cfg({1008, 77}) ->
    #{base_attrs =>
          [{1, 5792},
           {4, 1070},
           {5, 834},
           {6, 1085},
           {7, 484},
           {3, 194},
           {2, 3098},
           {26, 138},
           {25, 138}],
      extra_attrs =>
          [{1, 8688},
           {4, 1605},
           {5, 1251},
           {6, 1628},
           {7, 726},
           {3, 291}]};
get_lev_cfg({1008, 78}) ->
    #{base_attrs =>
          [{1, 5887},
           {4, 1087},
           {5, 848},
           {6, 1103},
           {7, 492},
           {3, 197},
           {2, 3102},
           {26, 141},
           {25, 141}],
      extra_attrs =>
          [{1, 8831},
           {4, 1631},
           {5, 1272},
           {6, 1655},
           {7, 738},
           {3, 295}]};
get_lev_cfg({1008, 79}) ->
    #{base_attrs =>
          [{1, 5981},
           {4, 1105},
           {5, 861},
           {6, 1121},
           {7, 500},
           {3, 200},
           {2, 3106},
           {26, 143},
           {25, 143}],
      extra_attrs =>
          [{1, 8972},
           {4, 1657},
           {5, 1292},
           {6, 1681},
           {7, 750},
           {3, 300}]};
get_lev_cfg({1008, 80}) ->
    #{base_attrs =>
          [{1, 6075},
           {4, 1122},
           {5, 875},
           {6, 1138},
           {7, 508},
           {3, 203},
           {2, 3110},
           {26, 146},
           {25, 146}],
      extra_attrs =>
          [{1, 9113},
           {4, 1683},
           {5, 1312},
           {6, 1708},
           {7, 762},
           {3, 305}]};
get_lev_cfg({1008, 81}) ->
    #{base_attrs =>
          [{1, 6168},
           {4, 1139},
           {5, 888},
           {6, 1156},
           {7, 516},
           {3, 206},
           {2, 3114},
           {26, 148},
           {25, 148}],
      extra_attrs =>
          [{1, 9252},
           {4, 1709},
           {5, 1332},
           {6, 1734},
           {7, 774},
           {3, 309}]};
get_lev_cfg({1008, 82}) ->
    #{base_attrs =>
          [{1, 6259},
           {4, 1156},
           {5, 901},
           {6, 1173},
           {7, 523},
           {3, 209},
           {2, 3118},
           {26, 150},
           {25, 150}],
      extra_attrs =>
          [{1, 9389},
           {4, 1734},
           {5, 1352},
           {6, 1759},
           {7, 785},
           {3, 314}]};
get_lev_cfg({1008, 83}) ->
    #{base_attrs =>
          [{1, 6350},
           {4, 1173},
           {5, 914},
           {6, 1190},
           {7, 531},
           {3, 212},
           {2, 3122},
           {26, 153},
           {25, 153}],
      extra_attrs =>
          [{1, 9525},
           {4, 1759},
           {5, 1372},
           {6, 1785},
           {7, 797},
           {3, 319}]};
get_lev_cfg({1008, 84}) ->
    #{base_attrs =>
          [{1, 6440},
           {4, 1189},
           {5, 927},
           {6, 1207},
           {7, 538},
           {3, 215},
           {2, 3126},
           {26, 155},
           {25, 155}],
      extra_attrs =>
          [{1, 9661},
           {4, 1784},
           {5, 1391},
           {6, 1810},
           {7, 808},
           {3, 323}]};
get_lev_cfg({1008, 85}) ->
    #{base_attrs =>
          [{1, 6529},
           {4, 1206},
           {5, 940},
           {6, 1223},
           {7, 546},
           {3, 218},
           {2, 3130},
           {26, 158},
           {25, 158}],
      extra_attrs =>
          [{1, 9794},
           {4, 1809},
           {5, 1410},
           {6, 1835},
           {7, 819},
           {3, 328}]};
get_lev_cfg({1008, 86}) ->
    #{base_attrs =>
          [{1, 6618},
           {4, 1222},
           {5, 953},
           {6, 1240},
           {7, 553},
           {3, 221},
           {2, 3134},
           {26, 160},
           {25, 160}],
      extra_attrs =>
          [{1, 9927},
           {4, 1833},
           {5, 1430},
           {6, 1860},
           {7, 830},
           {3, 332}]};
get_lev_cfg({1008, 87}) ->
    #{base_attrs =>
          [{1, 6705},
           {4, 1238},
           {5, 965},
           {6, 1256},
           {7, 561},
           {3, 224},
           {2, 3138},
           {26, 162},
           {25, 162}],
      extra_attrs =>
          [{1, 10057},
           {4, 1858},
           {5, 1448},
           {6, 1885},
           {7, 841},
           {3, 336}]};
get_lev_cfg({1008, 88}) ->
    #{base_attrs =>
          [{1, 6791},
           {4, 1254},
           {5, 978},
           {6, 1273},
           {7, 568},
           {3, 227},
           {2, 3142},
           {26, 165},
           {25, 165}],
      extra_attrs =>
          [{1, 10187},
           {4, 1882},
           {5, 1467},
           {6, 1909},
           {7, 852},
           {3, 341}]};
get_lev_cfg({1008, 89}) ->
    #{base_attrs =>
          [{1, 6877},
           {4, 1270},
           {5, 990},
           {6, 1289},
           {7, 575},
           {3, 230},
           {2, 3146},
           {26, 167},
           {25, 167}],
      extra_attrs =>
          [{1, 10315},
           {4, 1905},
           {5, 1486},
           {6, 1933},
           {7, 863},
           {3, 345}]};
get_lev_cfg({1008, 90}) ->
    #{base_attrs =>
          [{1, 6961},
           {4, 1286},
           {5, 1002},
           {6, 1304},
           {7, 582},
           {3, 233},
           {2, 3151},
           {26, 170},
           {25, 170}],
      extra_attrs =>
          [{1, 10442},
           {4, 1929},
           {5, 1504},
           {6, 1957},
           {7, 873},
           {3, 349}]};
get_lev_cfg({1008, 91}) ->
    #{base_attrs =>
          [{1, 7045},
           {4, 1301},
           {5, 1014},
           {6, 1320},
           {7, 589},
           {3, 236},
           {2, 3156},
           {26, 172},
           {25, 172}],
      extra_attrs =>
          [{1, 10568},
           {4, 1952},
           {5, 1522},
           {6, 1980},
           {7, 884},
           {3, 354}]};
get_lev_cfg({1008, 92}) ->
    #{base_attrs =>
          [{1, 7128},
           {4, 1317},
           {5, 1026},
           {6, 1336},
           {7, 596},
           {3, 238},
           {2, 3161},
           {26, 174},
           {25, 174}],
      extra_attrs =>
          [{1, 10693},
           {4, 1975},
           {5, 1540},
           {6, 2004},
           {7, 894},
           {3, 358}]};
get_lev_cfg({1008, 93}) ->
    #{base_attrs =>
          [{1, 7210},
           {4, 1332},
           {5, 1038},
           {6, 1351},
           {7, 603},
           {3, 241},
           {2, 3166},
           {26, 177},
           {25, 177}],
      extra_attrs =>
          [{1, 10816},
           {4, 1998},
           {5, 1558},
           {6, 2027},
           {7, 905},
           {3, 362}]};
get_lev_cfg({1008, 94}) ->
    #{base_attrs =>
          [{1, 7292},
           {4, 1347},
           {5, 1050},
           {6, 1366},
           {7, 610},
           {3, 244},
           {2, 3171},
           {26, 179},
           {25, 179}],
      extra_attrs =>
          [{1, 10938},
           {4, 2020},
           {5, 1575},
           {6, 2050},
           {7, 915},
           {3, 366}]};
get_lev_cfg({1008, 95}) ->
    #{base_attrs =>
          [{1, 7372},
           {4, 1362},
           {5, 1062},
           {6, 1381},
           {7, 616},
           {3, 247},
           {2, 3176},
           {26, 182},
           {25, 182}],
      extra_attrs =>
          [{1, 11058},
           {4, 2043},
           {5, 1593},
           {6, 2072},
           {7, 925},
           {3, 370}]};
get_lev_cfg({1008, 96}) ->
    #{base_attrs =>
          [{1, 7451},
           {4, 1376},
           {5, 1073},
           {6, 1396},
           {7, 623},
           {3, 249},
           {2, 3181},
           {26, 184},
           {25, 184}],
      extra_attrs =>
          [{1, 11177},
           {4, 2065},
           {5, 1610},
           {6, 2095},
           {7, 935},
           {3, 374}]};
get_lev_cfg({1008, 97}) ->
    #{base_attrs =>
          [{1, 7530},
           {4, 1391},
           {5, 1084},
           {6, 1411},
           {7, 630},
           {3, 252},
           {2, 3186},
           {26, 186},
           {25, 186}],
      extra_attrs =>
          [{1, 11295},
           {4, 2086},
           {5, 1627},
           {6, 2117},
           {7, 945},
           {3, 378}]};
get_lev_cfg({1008, 98}) ->
    #{base_attrs =>
          [{1, 7607},
           {4, 1405},
           {5, 1095},
           {6, 1425},
           {7, 636},
           {3, 254},
           {2, 3191},
           {26, 189},
           {25, 189}],
      extra_attrs =>
          [{1, 11411},
           {4, 2108},
           {5, 1643},
           {6, 2138},
           {7, 954},
           {3, 382}]};
get_lev_cfg({1008, 99}) ->
    #{base_attrs =>
          [{1, 7684},
           {4, 1419},
           {5, 1107},
           {6, 1440},
           {7, 643},
           {3, 257},
           {2, 3196},
           {26, 191},
           {25, 191}],
      extra_attrs =>
          [{1, 11527},
           {4, 2129},
           {5, 1660},
           {6, 2160},
           {7, 964},
           {3, 386}]};
get_lev_cfg({1008, 100}) ->
    #{base_attrs =>
          [{1, 7760},
           {4, 1433},
           {5, 1117},
           {6, 1454},
           {7, 649},
           {3, 260},
           {2, 3201},
           {26, 194},
           {25, 194}],
      extra_attrs =>
          [{1, 11641},
           {4, 2150},
           {5, 1676},
           {6, 2181},
           {7, 974},
           {3, 390}]};
get_lev_cfg({1008, 101}) ->
    #{base_attrs =>
          [{1, 7835},
           {4, 1447},
           {5, 1128},
           {6, 1468},
           {7, 655},
           {3, 262},
           {2, 3201},
           {26, 197},
           {25, 197}],
      extra_attrs =>
          [{1, 11753},
           {4, 2171},
           {5, 1693},
           {6, 2203},
           {7, 983},
           {3, 393}]};
get_lev_cfg({1008, 102}) ->
    #{base_attrs =>
          [{1, 7909},
           {4, 1461},
           {5, 1139},
           {6, 1482},
           {7, 661},
           {3, 265},
           {2, 3201},
           {26, 200},
           {25, 200}],
      extra_attrs =>
          [{1, 11864},
           {4, 2191},
           {5, 1709},
           {6, 2223},
           {7, 992},
           {3, 397}]};
get_lev_cfg({1008, 103}) ->
    #{base_attrs =>
          [{1, 7983},
           {4, 1474},
           {5, 1149},
           {6, 1496},
           {7, 667},
           {3, 267},
           {2, 3201},
           {26, 203},
           {25, 203}],
      extra_attrs =>
          [{1, 11974},
           {4, 2212},
           {5, 1724},
           {6, 2244},
           {7, 1001},
           {3, 401}]};
get_lev_cfg({1008, 104}) ->
    #{base_attrs =>
          [{1, 8055},
           {4, 1488},
           {5, 1160},
           {6, 1509},
           {7, 674},
           {3, 269},
           {2, 3201},
           {26, 206},
           {25, 206}],
      extra_attrs =>
          [{1, 12083},
           {4, 2232},
           {5, 1740},
           {6, 2264},
           {7, 1011},
           {3, 404}]};
get_lev_cfg({1008, 105}) ->
    #{base_attrs =>
          [{1, 8127},
           {4, 1501},
           {5, 1170},
           {6, 1523},
           {7, 679},
           {3, 272},
           {2, 3201},
           {26, 206},
           {25, 206}],
      extra_attrs =>
          [{1, 12190},
           {4, 2252},
           {5, 1756},
           {6, 2284},
           {7, 1019},
           {3, 408}]};
get_lev_cfg({1008, 106}) ->
    #{base_attrs =>
          [{1, 8197},
           {4, 1514},
           {5, 1180},
           {6, 1536},
           {7, 685},
           {3, 274},
           {2, 3201},
           {26, 212},
           {25, 212}],
      extra_attrs =>
          [{1, 12296},
           {4, 2271},
           {5, 1771},
           {6, 2304},
           {7, 1028},
           {3, 411}]};
get_lev_cfg({1008, 107}) ->
    #{base_attrs =>
          [{1, 8267},
           {4, 1527},
           {5, 1190},
           {6, 1549},
           {7, 691},
           {3, 276},
           {2, 3201},
           {26, 215},
           {25, 215}],
      extra_attrs =>
          [{1, 12401},
           {4, 2291},
           {5, 1786},
           {6, 2324},
           {7, 1037},
           {3, 415}]};
get_lev_cfg({1008, 108}) ->
    #{base_attrs =>
          [{1, 8336},
           {4, 1540},
           {5, 1200},
           {6, 1562},
           {7, 697},
           {3, 279},
           {2, 3201},
           {26, 218},
           {25, 218}],
      extra_attrs =>
          [{1, 12504},
           {4, 2310},
           {5, 1801},
           {6, 2343},
           {7, 1046},
           {3, 418}]};
get_lev_cfg({1008, 109}) ->
    #{base_attrs =>
          [{1, 8404},
           {4, 1552},
           {5, 1210},
           {6, 1575},
           {7, 703},
           {3, 281},
           {2, 3201},
           {26, 221},
           {25, 221}],
      extra_attrs =>
          [{1, 12606},
           {4, 2328},
           {5, 1815},
           {6, 2362},
           {7, 1054},
           {3, 422}]};
get_lev_cfg({1008, 110}) ->
    #{base_attrs =>
          [{1, 8471},
           {4, 1565},
           {5, 1220},
           {6, 1587},
           {7, 708},
           {3, 283},
           {2, 3201},
           {26, 224},
           {25, 224}],
      extra_attrs =>
          [{1, 12707},
           {4, 2347},
           {5, 1830},
           {6, 2381},
           {7, 1063},
           {3, 425}]};
get_lev_cfg({1008, 111}) ->
    #{base_attrs =>
          [{1, 8537},
           {4, 1577},
           {5, 1229},
           {6, 1600},
           {7, 714},
           {3, 286},
           {2, 3201},
           {26, 227},
           {25, 227}],
      extra_attrs =>
          [{1, 12806},
           {4, 2365},
           {5, 1844},
           {6, 2400},
           {7, 1071},
           {3, 429}]};
get_lev_cfg({1008, 112}) ->
    #{base_attrs =>
          [{1, 8602},
           {4, 1589},
           {5, 1239},
           {6, 1612},
           {7, 719},
           {3, 288},
           {2, 3201},
           {26, 230},
           {25, 230}],
      extra_attrs =>
          [{1, 12904},
           {4, 2384},
           {5, 1858},
           {6, 2418},
           {7, 1079},
           {3, 432}]};
get_lev_cfg({1008, 113}) ->
    #{base_attrs =>
          [{1, 8667},
           {4, 1601},
           {5, 1248},
           {6, 1624},
           {7, 725},
           {3, 290},
           {2, 3201},
           {26, 233},
           {25, 233}],
      extra_attrs =>
          [{1, 13001},
           {4, 2401},
           {5, 1872},
           {6, 2436},
           {7, 1087},
           {3, 435}]};
get_lev_cfg({1008, 114}) ->
    #{base_attrs =>
          [{1, 8730},
           {4, 1613},
           {5, 1257},
           {6, 1636},
           {7, 730},
           {3, 292},
           {2, 3201},
           {26, 236},
           {25, 236}],
      extra_attrs =>
          [{1, 13096},
           {4, 2419},
           {5, 1886},
           {6, 2454},
           {7, 1095},
           {3, 438}]};
get_lev_cfg({1008, 115}) ->
    #{base_attrs =>
          [{1, 8793},
           {4, 1624},
           {5, 1266},
           {6, 1648},
           {7, 735},
           {3, 294},
           {2, 3201},
           {26, 239},
           {25, 239}],
      extra_attrs =>
          [{1, 13190},
           {4, 2436},
           {5, 1900},
           {6, 2472},
           {7, 1103},
           {3, 441}]};
get_lev_cfg({1008, 116}) ->
    #{base_attrs =>
          [{1, 8855},
           {4, 1636},
           {5, 1275},
           {6, 1659},
           {7, 740},
           {3, 296},
           {2, 3201},
           {26, 242},
           {25, 242}],
      extra_attrs =>
          [{1, 13283},
           {4, 2454},
           {5, 1913},
           {6, 2489},
           {7, 1111},
           {3, 445}]};
get_lev_cfg({1008, 117}) ->
    #{base_attrs =>
          [{1, 8916},
           {4, 1647},
           {5, 1284},
           {6, 1671},
           {7, 746},
           {3, 298},
           {2, 3201},
           {26, 245},
           {25, 245}],
      extra_attrs =>
          [{1, 13374},
           {4, 2470},
           {5, 1926},
           {6, 2506},
           {7, 1119},
           {3, 448}]};
get_lev_cfg({1008, 118}) ->
    #{base_attrs =>
          [{1, 8976},
           {4, 1658},
           {5, 1293},
           {6, 1682},
           {7, 751},
           {3, 300},
           {2, 3201},
           {26, 248},
           {25, 248}],
      extra_attrs =>
          [{1, 13465},
           {4, 2487},
           {5, 1939},
           {6, 2523},
           {7, 1126},
           {3, 451}]};
get_lev_cfg({1008, 119}) ->
    #{base_attrs =>
          [{1, 9035},
           {4, 1669},
           {5, 1301},
           {6, 1693},
           {7, 756},
           {3, 302},
           {2, 3201},
           {26, 251},
           {25, 251}],
      extra_attrs =>
          [{1, 13553},
           {4, 2503},
           {5, 1952},
           {6, 2540},
           {7, 1134},
           {3, 454}]};
get_lev_cfg({1008, 120}) ->
    #{base_attrs =>
          [{1, 9094},
           {4, 1680},
           {5, 1310},
           {6, 1704},
           {7, 760},
           {3, 304},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13641},
           {4, 2520},
           {5, 1965},
           {6, 2556},
           {7, 1141},
           {3, 457}]};
get_lev_cfg({1008, 121}) ->
    #{base_attrs =>
          [{1, 9151},
           {4, 1690},
           {5, 1318},
           {6, 1715},
           {7, 765},
           {3, 306},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13727},
           {4, 2536},
           {5, 1977},
           {6, 2572},
           {7, 1148},
           {3, 459}]};
get_lev_cfg({1008, 122}) ->
    #{base_attrs =>
          [{1, 9208},
           {4, 1701},
           {5, 1326},
           {6, 1725},
           {7, 770},
           {3, 308},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13812},
           {4, 2551},
           {5, 1989},
           {6, 2588},
           {7, 1155},
           {3, 462}]};
get_lev_cfg({1008, 123}) ->
    #{base_attrs =>
          [{1, 9263},
           {4, 1711},
           {5, 1334},
           {6, 1736},
           {7, 775},
           {3, 310},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13895},
           {4, 2567},
           {5, 2001},
           {6, 2604},
           {7, 1162},
           {3, 465}]};
get_lev_cfg({1008, 124}) ->
    #{base_attrs =>
          [{1, 9318},
           {4, 1721},
           {5, 1342},
           {6, 1746},
           {7, 779},
           {3, 312},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13977},
           {4, 2582},
           {5, 2013},
           {6, 2619},
           {7, 1169},
           {3, 468}]};
get_lev_cfg({1008, 125}) ->
    #{base_attrs =>
          [{1, 9372},
           {4, 1731},
           {5, 1350},
           {6, 1756},
           {7, 784},
           {3, 314},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 14058},
           {4, 2597},
           {5, 2025},
           {6, 2635},
           {7, 1176},
           {3, 471}]};
get_lev_cfg({1008, 126}) ->
    #{base_attrs =>
          [{1, 9425},
           {4, 1741},
           {5, 1357},
           {6, 1766},
           {7, 788},
           {3, 315},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 14138},
           {4, 2611},
           {5, 2036},
           {6, 2649},
           {7, 1182},
           {3, 473}]};
get_lev_cfg({1008, 127}) ->
    #{base_attrs =>
          [{1, 9477},
           {4, 1750},
           {5, 1365},
           {6, 1776},
           {7, 793},
           {3, 317},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 14216},
           {4, 2626},
           {5, 2047},
           {6, 2664},
           {7, 1189},
           {3, 476}]};
get_lev_cfg({1008, 128}) ->
    #{base_attrs =>
          [{1, 9529},
           {4, 1760},
           {5, 1372},
           {6, 1786},
           {7, 797},
           {3, 319},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 14293},
           {4, 2640},
           {5, 2059},
           {6, 2679},
           {7, 1195},
           {3, 478}]};
get_lev_cfg({1008, 129}) ->
    #{base_attrs =>
          [{1, 9579},
           {4, 1769},
           {5, 1379},
           {6, 1795},
           {7, 801},
           {3, 320},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 14368},
           {4, 2654},
           {5, 2069},
           {6, 2693},
           {7, 1202},
           {3, 481}]};
get_lev_cfg({1008, 130}) ->
    #{base_attrs =>
          [{1, 9628},
           {4, 1778},
           {5, 1387},
           {6, 1804},
           {7, 805},
           {3, 322},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 14443},
           {4, 2668},
           {5, 2080},
           {6, 2707},
           {7, 1208},
           {3, 483}]};
get_lev_cfg({1010, 1}) ->
    #{base_attrs =>
          [{1, 172},
           {4, 31},
           {5, 24},
           {6, 32},
           {7, 14},
           {3, 5},
           {2, 200},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 258}, {4, 47}, {5, 37}, {6, 48}, {7, 21}, {3, 8}]};
get_lev_cfg({1010, 2}) ->
    #{base_attrs =>
          [{1, 206},
           {4, 38},
           {5, 29},
           {6, 38},
           {7, 17},
           {3, 6},
           {2, 576},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 309},
           {4, 57},
           {5, 44},
           {6, 58},
           {7, 25},
           {3, 10}]};
get_lev_cfg({1010, 3}) ->
    #{base_attrs =>
          [{1, 241},
           {4, 44},
           {5, 34},
           {6, 45},
           {7, 20},
           {3, 8},
           {2, 672},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 361},
           {4, 66},
           {5, 52},
           {6, 67},
           {7, 30},
           {3, 12}]};
get_lev_cfg({1010, 4}) ->
    #{base_attrs =>
          [{1, 275},
           {4, 50},
           {5, 39},
           {6, 51},
           {7, 23},
           {3, 9},
           {2, 767},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 413},
           {4, 76},
           {5, 59},
           {6, 77},
           {7, 34},
           {3, 13}]};
get_lev_cfg({1010, 5}) ->
    #{base_attrs =>
          [{1, 309},
           {4, 57},
           {5, 44},
           {6, 58},
           {7, 25},
           {3, 10},
           {2, 864},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 464},
           {4, 85},
           {5, 66},
           {6, 87},
           {7, 38},
           {3, 15}]};
get_lev_cfg({1010, 6}) ->
    #{base_attrs =>
          [{1, 344},
           {4, 63},
           {5, 49},
           {6, 64},
           {7, 28},
           {3, 11},
           {2, 960},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 516},
           {4, 95},
           {5, 74},
           {6, 96},
           {7, 43},
           {3, 17}]};
get_lev_cfg({1010, 7}) ->
    #{base_attrs =>
          [{1, 378},
           {4, 69},
           {5, 54},
           {6, 70},
           {7, 31},
           {3, 12},
           {2, 1055},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 568},
           {4, 104},
           {5, 81},
           {6, 106},
           {7, 47},
           {3, 19}]};
get_lev_cfg({1010, 8}) ->
    #{base_attrs =>
          [{1, 413},
           {4, 76},
           {5, 59},
           {6, 77},
           {7, 34},
           {3, 13},
           {2, 1152},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 619},
           {4, 114},
           {5, 89},
           {6, 116},
           {7, 51},
           {3, 20}]};
get_lev_cfg({1010, 9}) ->
    #{base_attrs =>
          [{1, 447},
           {4, 82},
           {5, 64},
           {6, 83},
           {7, 37},
           {3, 14},
           {2, 1248},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 671},
           {4, 124},
           {5, 96},
           {6, 125},
           {7, 56},
           {3, 22}]};
get_lev_cfg({1010, 10}) ->
    #{base_attrs =>
          [{1, 516},
           {4, 95},
           {5, 74},
           {6, 96},
           {7, 43},
           {3, 17},
           {2, 1440},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 774},
           {4, 143},
           {5, 111},
           {6, 145},
           {7, 64},
           {3, 25}]};
get_lev_cfg({1010, 11}) ->
    #{base_attrs =>
          [{1, 585},
           {4, 108},
           {5, 84},
           {6, 109},
           {7, 48},
           {3, 19},
           {2, 1631},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 877},
           {4, 162},
           {5, 126},
           {6, 164},
           {7, 73},
           {3, 29}]};
get_lev_cfg({1010, 12}) ->
    #{base_attrs =>
          [{1, 654},
           {4, 120},
           {5, 94},
           {6, 122},
           {7, 54},
           {3, 21},
           {2, 1824},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 981},
           {4, 181},
           {5, 141},
           {6, 183},
           {7, 82},
           {3, 32}]};
get_lev_cfg({1010, 13}) ->
    #{base_attrs =>
          [{1, 723},
           {4, 133},
           {5, 104},
           {6, 135},
           {7, 60},
           {3, 24},
           {2, 2016},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1084},
           {4, 200},
           {5, 156},
           {6, 203},
           {7, 90},
           {3, 36}]};
get_lev_cfg({1010, 14}) ->
    #{base_attrs =>
          [{1, 791},
           {4, 146},
           {5, 114},
           {6, 148},
           {7, 66},
           {3, 26},
           {2, 2207},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1187},
           {4, 219},
           {5, 171},
           {6, 222},
           {7, 99},
           {3, 39}]};
get_lev_cfg({1010, 15}) ->
    #{base_attrs =>
          [{1, 860},
           {4, 159},
           {5, 123},
           {6, 161},
           {7, 72},
           {3, 28},
           {2, 2400},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1291},
           {4, 238},
           {5, 185},
           {6, 241},
           {7, 108},
           {3, 43}]};
get_lev_cfg({1010, 16}) ->
    #{base_attrs =>
          [{1, 929},
           {4, 171},
           {5, 133},
           {6, 174},
           {7, 77},
           {3, 31},
           {2, 2408},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1394},
           {4, 257},
           {5, 200},
           {6, 261},
           {7, 116},
           {3, 46}]};
get_lev_cfg({1010, 17}) ->
    #{base_attrs =>
          [{1, 998},
           {4, 184},
           {5, 143},
           {6, 187},
           {7, 83},
           {3, 33},
           {2, 2417},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1497},
           {4, 276},
           {5, 215},
           {6, 280},
           {7, 125},
           {3, 50}]};
get_lev_cfg({1010, 18}) ->
    #{base_attrs =>
          [{1, 1067},
           {4, 197},
           {5, 153},
           {6, 200},
           {7, 89},
           {3, 35},
           {2, 2426},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1600},
           {4, 295},
           {5, 230},
           {6, 300},
           {7, 133},
           {3, 53}]};
get_lev_cfg({1010, 19}) ->
    #{base_attrs =>
          [{1, 1136},
           {4, 209},
           {5, 163},
           {6, 212},
           {7, 95},
           {3, 38},
           {2, 2436},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1704},
           {4, 314},
           {5, 245},
           {6, 319},
           {7, 142},
           {3, 57}]};
get_lev_cfg({1010, 20}) ->
    #{base_attrs =>
          [{1, 1205},
           {4, 222},
           {5, 173},
           {6, 225},
           {7, 100},
           {3, 40},
           {2, 2446},
           {26, 2},
           {25, 2}],
      extra_attrs =>
          [{1, 1807},
           {4, 333},
           {5, 260},
           {6, 338},
           {7, 151},
           {3, 60}]};
get_lev_cfg({1010, 21}) ->
    #{base_attrs =>
          [{1, 1273},
           {4, 235},
           {5, 183},
           {6, 238},
           {7, 106},
           {3, 42},
           {2, 2457},
           {26, 4},
           {25, 4}],
      extra_attrs =>
          [{1, 1910},
           {4, 353},
           {5, 275},
           {6, 358},
           {7, 159},
           {3, 64}]};
get_lev_cfg({1010, 22}) ->
    #{base_attrs =>
          [{1, 1342},
           {4, 248},
           {5, 193},
           {6, 251},
           {7, 112},
           {3, 44},
           {2, 2468},
           {26, 6},
           {25, 6}],
      extra_attrs =>
          [{1, 2014},
           {4, 372},
           {5, 290},
           {6, 377},
           {7, 168},
           {3, 67}]};
get_lev_cfg({1010, 23}) ->
    #{base_attrs =>
          [{1, 1411},
           {4, 260},
           {5, 203},
           {6, 264},
           {7, 118},
           {3, 47},
           {2, 2480},
           {26, 9},
           {25, 9}],
      extra_attrs =>
          [{1, 2117},
           {4, 391},
           {5, 305},
           {6, 396},
           {7, 177},
           {3, 70}]};
get_lev_cfg({1010, 24}) ->
    #{base_attrs =>
          [{1, 1480},
           {4, 273},
           {5, 213},
           {6, 277},
           {7, 123},
           {3, 49},
           {2, 2492},
           {26, 11},
           {25, 11}],
      extra_attrs =>
          [{1, 2220},
           {4, 410},
           {5, 319},
           {6, 416},
           {7, 185},
           {3, 74}]};
get_lev_cfg({1010, 25}) ->
    #{base_attrs =>
          [{1, 1549},
           {4, 286},
           {5, 223},
           {6, 290},
           {7, 129},
           {3, 51},
           {2, 2505},
           {26, 14},
           {25, 14}],
      extra_attrs =>
          [{1, 2323},
           {4, 429},
           {5, 334},
           {6, 435},
           {7, 194},
           {3, 77}]};
get_lev_cfg({1010, 26}) ->
    #{base_attrs =>
          [{1, 1618},
           {4, 298},
           {5, 233},
           {6, 303},
           {7, 135},
           {3, 54},
           {2, 2518},
           {26, 16},
           {25, 16}],
      extra_attrs =>
          [{1, 2427},
           {4, 448},
           {5, 349},
           {6, 454},
           {7, 203},
           {3, 81}]};
get_lev_cfg({1010, 27}) ->
    #{base_attrs =>
          [{1, 1687},
           {4, 311},
           {5, 243},
           {6, 316},
           {7, 141},
           {3, 56},
           {2, 2532},
           {26, 18},
           {25, 18}],
      extra_attrs =>
          [{1, 2530},
           {4, 467},
           {5, 364},
           {6, 474},
           {7, 211},
           {3, 84}]};
get_lev_cfg({1010, 28}) ->
    #{base_attrs =>
          [{1, 1755},
           {4, 324},
           {5, 252},
           {6, 329},
           {7, 146},
           {3, 58},
           {2, 2546},
           {26, 21},
           {25, 21}],
      extra_attrs =>
          [{1, 2633},
           {4, 486},
           {5, 379},
           {6, 493},
           {7, 220},
           {3, 88}]};
get_lev_cfg({1010, 29}) ->
    #{base_attrs =>
          [{1, 1824},
           {4, 337},
           {5, 262},
           {6, 342},
           {7, 152},
           {3, 61},
           {2, 2561},
           {26, 23},
           {25, 23}],
      extra_attrs =>
          [{1, 2737},
           {4, 505},
           {5, 394},
           {6, 513},
           {7, 229},
           {3, 91}]};
get_lev_cfg({1010, 30}) ->
    #{base_attrs =>
          [{1, 1893},
           {4, 349},
           {5, 272},
           {6, 354},
           {7, 158},
           {3, 63},
           {2, 2576},
           {26, 26},
           {25, 26}],
      extra_attrs =>
          [{1, 2840},
           {4, 524},
           {5, 409},
           {6, 532},
           {7, 237},
           {3, 95}]};
get_lev_cfg({1010, 31}) ->
    #{base_attrs =>
          [{1, 1962},
           {4, 362},
           {5, 282},
           {6, 367},
           {7, 164},
           {3, 65},
           {2, 2592},
           {26, 28},
           {25, 28}],
      extra_attrs =>
          [{1, 2943},
           {4, 543},
           {5, 424},
           {6, 551},
           {7, 246},
           {3, 98}]};
get_lev_cfg({1010, 32}) ->
    #{base_attrs =>
          [{1, 2031},
           {4, 375},
           {5, 292},
           {6, 380},
           {7, 169},
           {3, 68},
           {2, 2608},
           {26, 30},
           {25, 30}],
      extra_attrs =>
          [{1, 3047},
           {4, 562},
           {5, 438},
           {6, 571},
           {7, 254},
           {3, 102}]};
get_lev_cfg({1010, 33}) ->
    #{base_attrs =>
          [{1, 2100},
           {4, 388},
           {5, 302},
           {6, 393},
           {7, 175},
           {3, 70},
           {2, 2625},
           {26, 33},
           {25, 33}],
      extra_attrs =>
          [{1, 3150},
           {4, 582},
           {5, 453},
           {6, 590},
           {7, 263},
           {3, 105}]};
get_lev_cfg({1010, 34}) ->
    #{base_attrs =>
          [{1, 2169},
           {4, 400},
           {5, 312},
           {6, 406},
           {7, 181},
           {3, 72},
           {2, 2642},
           {26, 35},
           {25, 35}],
      extra_attrs =>
          [{1, 3253},
           {4, 601},
           {5, 468},
           {6, 609},
           {7, 272},
           {3, 109}]};
get_lev_cfg({1010, 35}) ->
    #{base_attrs =>
          [{1, 2237},
           {4, 413},
           {5, 322},
           {6, 419},
           {7, 187},
           {3, 74},
           {2, 2660},
           {26, 38},
           {25, 38}],
      extra_attrs =>
          [{1, 3356},
           {4, 620},
           {5, 483},
           {6, 629},
           {7, 280},
           {3, 112}]};
get_lev_cfg({1010, 36}) ->
    #{base_attrs =>
          [{1, 2306},
           {4, 426},
           {5, 332},
           {6, 432},
           {7, 193},
           {3, 77},
           {2, 2678},
           {26, 40},
           {25, 40}],
      extra_attrs =>
          [{1, 3460},
           {4, 639},
           {5, 498},
           {6, 648},
           {7, 289},
           {3, 115}]};
get_lev_cfg({1010, 37}) ->
    #{base_attrs =>
          [{1, 2375},
           {4, 438},
           {5, 342},
           {6, 445},
           {7, 198},
           {3, 79},
           {2, 2697},
           {26, 42},
           {25, 42}],
      extra_attrs =>
          [{1, 3563},
           {4, 658},
           {5, 513},
           {6, 667},
           {7, 298},
           {3, 119}]};
get_lev_cfg({1010, 38}) ->
    #{base_attrs =>
          [{1, 2444},
           {4, 451},
           {5, 352},
           {6, 458},
           {7, 204},
           {3, 81},
           {2, 2716},
           {26, 45},
           {25, 45}],
      extra_attrs =>
          [{1, 3666},
           {4, 677},
           {5, 528},
           {6, 687},
           {7, 306},
           {3, 122}]};
get_lev_cfg({1010, 39}) ->
    #{base_attrs =>
          [{1, 2513},
           {4, 464},
           {5, 362},
           {6, 471},
           {7, 210},
           {3, 84},
           {2, 2736},
           {26, 47},
           {25, 47}],
      extra_attrs =>
          [{1, 3770},
           {4, 696},
           {5, 543},
           {6, 706},
           {7, 315},
           {3, 126}]};
get_lev_cfg({1010, 40}) ->
    #{base_attrs =>
          [{1, 2582},
           {4, 477},
           {5, 371},
           {6, 483},
           {7, 216},
           {3, 86},
           {2, 2756},
           {26, 50},
           {25, 50}],
      extra_attrs =>
          [{1, 3873},
           {4, 715},
           {5, 557},
           {6, 725},
           {7, 324},
           {3, 129}]};
get_lev_cfg({1010, 41}) ->
    #{base_attrs =>
          [{1, 2651},
           {4, 489},
           {5, 381},
           {6, 496},
           {7, 221},
           {3, 88},
           {2, 2777},
           {26, 52},
           {25, 52}],
      extra_attrs =>
          [{1, 3976},
           {4, 734},
           {5, 572},
           {6, 745},
           {7, 332},
           {3, 133}]};
get_lev_cfg({1010, 42}) ->
    #{base_attrs =>
          [{1, 2719},
           {4, 502},
           {5, 391},
           {6, 509},
           {7, 227},
           {3, 91},
           {2, 2798},
           {26, 54},
           {25, 54}],
      extra_attrs =>
          [{1, 4079},
           {4, 753},
           {5, 587},
           {6, 764},
           {7, 341},
           {3, 136}]};
get_lev_cfg({1010, 43}) ->
    #{base_attrs =>
          [{1, 2788},
           {4, 515},
           {5, 401},
           {6, 522},
           {7, 233},
           {3, 93},
           {2, 2820},
           {26, 57},
           {25, 57}],
      extra_attrs =>
          [{1, 4183},
           {4, 772},
           {5, 602},
           {6, 784},
           {7, 350},
           {3, 140}]};
get_lev_cfg({1010, 44}) ->
    #{base_attrs =>
          [{1, 2857},
           {4, 527},
           {5, 411},
           {6, 535},
           {7, 239},
           {3, 95},
           {2, 2842},
           {26, 59},
           {25, 59}],
      extra_attrs =>
          [{1, 4286},
           {4, 791},
           {5, 617},
           {6, 803},
           {7, 358},
           {3, 143}]};
get_lev_cfg({1010, 45}) ->
    #{base_attrs =>
          [{1, 2926},
           {4, 540},
           {5, 421},
           {6, 548},
           {7, 244},
           {3, 98},
           {2, 2865},
           {26, 62},
           {25, 62}],
      extra_attrs =>
          [{1, 4389},
           {4, 810},
           {5, 632},
           {6, 822},
           {7, 367},
           {3, 147}]};
get_lev_cfg({1010, 46}) ->
    #{base_attrs =>
          [{1, 2995},
           {4, 553},
           {5, 431},
           {6, 561},
           {7, 250},
           {3, 100},
           {2, 2888},
           {26, 64},
           {25, 64}],
      extra_attrs =>
          [{1, 4493},
           {4, 830},
           {5, 647},
           {6, 842},
           {7, 375},
           {3, 150}]};
get_lev_cfg({1010, 47}) ->
    #{base_attrs =>
          [{1, 3064},
           {4, 566},
           {5, 441},
           {6, 574},
           {7, 256},
           {3, 102},
           {2, 2912},
           {26, 66},
           {25, 66}],
      extra_attrs =>
          [{1, 4596},
           {4, 849},
           {5, 662},
           {6, 861},
           {7, 384},
           {3, 153}]};
get_lev_cfg({1010, 48}) ->
    #{base_attrs =>
          [{1, 3133},
           {4, 578},
           {5, 451},
           {6, 587},
           {7, 262},
           {3, 104},
           {2, 2936},
           {26, 69},
           {25, 69}],
      extra_attrs =>
          [{1, 4699},
           {4, 868},
           {5, 676},
           {6, 880},
           {7, 393},
           {3, 157}]};
get_lev_cfg({1010, 49}) ->
    #{base_attrs =>
          [{1, 3201},
           {4, 591},
           {5, 461},
           {6, 600},
           {7, 267},
           {3, 107},
           {2, 2961},
           {26, 71},
           {25, 71}],
      extra_attrs =>
          [{1, 4802},
           {4, 887},
           {5, 691},
           {6, 900},
           {7, 401},
           {3, 160}]};
get_lev_cfg({1010, 50}) ->
    #{base_attrs =>
          [{1, 3270},
           {4, 604},
           {5, 471},
           {6, 613},
           {7, 273},
           {3, 109},
           {2, 2986},
           {26, 74},
           {25, 74}],
      extra_attrs =>
          [{1, 4906},
           {4, 906},
           {5, 706},
           {6, 919},
           {7, 410},
           {3, 164}]};
get_lev_cfg({1010, 51}) ->
    #{base_attrs =>
          [{1, 3339},
           {4, 616},
           {5, 481},
           {6, 625},
           {7, 279},
           {3, 111},
           {2, 3012},
           {26, 76},
           {25, 76}],
      extra_attrs =>
          [{1, 5009},
           {4, 925},
           {5, 721},
           {6, 938},
           {7, 419},
           {3, 167}]};
get_lev_cfg({1010, 52}) ->
    #{base_attrs =>
          [{1, 3408},
           {4, 629},
           {5, 491},
           {6, 638},
           {7, 285},
           {3, 114},
           {2, 3015},
           {26, 78},
           {25, 78}],
      extra_attrs =>
          [{1, 5112},
           {4, 944},
           {5, 736},
           {6, 958},
           {7, 427},
           {3, 171}]};
get_lev_cfg({1010, 53}) ->
    #{base_attrs =>
          [{1, 3477},
           {4, 642},
           {5, 500},
           {6, 651},
           {7, 290},
           {3, 116},
           {2, 3018},
           {26, 81},
           {25, 81}],
      extra_attrs =>
          [{1, 5216},
           {4, 963},
           {5, 751},
           {6, 977},
           {7, 436},
           {3, 174}]};
get_lev_cfg({1010, 54}) ->
    #{base_attrs =>
          [{1, 3546},
           {4, 655},
           {5, 510},
           {6, 664},
           {7, 296},
           {3, 118},
           {2, 3021},
           {26, 83},
           {25, 83}],
      extra_attrs =>
          [{1, 5319},
           {4, 982},
           {5, 766},
           {6, 997},
           {7, 445},
           {3, 178}]};
get_lev_cfg({1010, 55}) ->
    #{base_attrs =>
          [{1, 3615},
           {4, 667},
           {5, 520},
           {6, 677},
           {7, 302},
           {3, 121},
           {2, 3024},
           {26, 86},
           {25, 86}],
      extra_attrs =>
          [{1, 5422},
           {4, 1001},
           {5, 781},
           {6, 1016},
           {7, 453},
           {3, 181}]};
get_lev_cfg({1010, 56}) ->
    #{base_attrs =>
          [{1, 3683},
           {4, 680},
           {5, 530},
           {6, 690},
           {7, 308},
           {3, 123},
           {2, 3027},
           {26, 88},
           {25, 88}],
      extra_attrs =>
          [{1, 5525},
           {4, 1020},
           {5, 796},
           {6, 1035},
           {7, 462},
           {3, 185}]};
get_lev_cfg({1010, 57}) ->
    #{base_attrs =>
          [{1, 3752},
           {4, 693},
           {5, 540},
           {6, 703},
           {7, 313},
           {3, 125},
           {2, 3030},
           {26, 90},
           {25, 90}],
      extra_attrs =>
          [{1, 5629},
           {4, 1039},
           {5, 810},
           {6, 1055},
           {7, 470},
           {3, 188}]};
get_lev_cfg({1010, 58}) ->
    #{base_attrs =>
          [{1, 3821},
           {4, 706},
           {5, 550},
           {6, 716},
           {7, 319},
           {3, 128},
           {2, 3033},
           {26, 93},
           {25, 93}],
      extra_attrs =>
          [{1, 5732},
           {4, 1059},
           {5, 825},
           {6, 1074},
           {7, 479},
           {3, 192}]};
get_lev_cfg({1010, 59}) ->
    #{base_attrs =>
          [{1, 3890},
           {4, 718},
           {5, 560},
           {6, 729},
           {7, 325},
           {3, 130},
           {2, 3036},
           {26, 95},
           {25, 95}],
      extra_attrs =>
          [{1, 5835},
           {4, 1078},
           {5, 840},
           {6, 1093},
           {7, 488},
           {3, 195}]};
get_lev_cfg({1010, 60}) ->
    #{base_attrs =>
          [{1, 4037},
           {4, 745},
           {5, 581},
           {6, 756},
           {7, 337},
           {3, 135},
           {2, 3039},
           {26, 98},
           {25, 98}],
      extra_attrs =>
          [{1, 6056},
           {4, 1118},
           {5, 872},
           {6, 1135},
           {7, 506},
           {3, 202}]};
get_lev_cfg({1010, 61}) ->
    #{base_attrs =>
          [{1, 4148},
           {4, 766},
           {5, 597},
           {6, 777},
           {7, 347},
           {3, 138},
           {2, 3042},
           {26, 100},
           {25, 100}],
      extra_attrs =>
          [{1, 6222},
           {4, 1149},
           {5, 896},
           {6, 1166},
           {7, 520},
           {3, 208}]};
get_lev_cfg({1010, 62}) ->
    #{base_attrs =>
          [{1, 4257},
           {4, 786},
           {5, 613},
           {6, 797},
           {7, 356},
           {3, 142},
           {2, 3045},
           {26, 102},
           {25, 102}],
      extra_attrs =>
          [{1, 6386},
           {4, 1179},
           {5, 919},
           {6, 1196},
           {7, 534},
           {3, 213}]};
get_lev_cfg({1010, 63}) ->
    #{base_attrs =>
          [{1, 4365},
           {4, 806},
           {5, 628},
           {6, 818},
           {7, 365},
           {3, 146},
           {2, 3048},
           {26, 105},
           {25, 105}],
      extra_attrs =>
          [{1, 6548},
           {4, 1209},
           {5, 943},
           {6, 1227},
           {7, 547},
           {3, 219}]};
get_lev_cfg({1010, 64}) ->
    #{base_attrs =>
          [{1, 4473},
           {4, 826},
           {5, 644},
           {6, 838},
           {7, 374},
           {3, 149},
           {2, 3051},
           {26, 107},
           {25, 107}],
      extra_attrs =>
          [{1, 6710},
           {4, 1239},
           {5, 966},
           {6, 1257},
           {7, 561},
           {3, 224}]};
get_lev_cfg({1010, 65}) ->
    #{base_attrs =>
          [{1, 4580},
           {4, 846},
           {5, 659},
           {6, 858},
           {7, 383},
           {3, 153},
           {2, 3054},
           {26, 110},
           {25, 110}],
      extra_attrs =>
          [{1, 6870},
           {4, 1269},
           {5, 989},
           {6, 1287},
           {7, 574},
           {3, 230}]};
get_lev_cfg({1010, 66}) ->
    #{base_attrs =>
          [{1, 4686},
           {4, 865},
           {5, 675},
           {6, 878},
           {7, 392},
           {3, 157},
           {2, 3057},
           {26, 112},
           {25, 112}],
      extra_attrs =>
          [{1, 7029},
           {4, 1298},
           {5, 1012},
           {6, 1317},
           {7, 588},
           {3, 235}]};
get_lev_cfg({1010, 67}) ->
    #{base_attrs =>
          [{1, 4791},
           {4, 885},
           {5, 690},
           {6, 898},
           {7, 400},
           {3, 160},
           {2, 3060},
           {26, 114},
           {25, 114}],
      extra_attrs =>
          [{1, 7186},
           {4, 1327},
           {5, 1035},
           {6, 1347},
           {7, 601},
           {3, 240}]};
get_lev_cfg({1010, 68}) ->
    #{base_attrs =>
          [{1, 4895},
           {4, 904},
           {5, 705},
           {6, 917},
           {7, 409},
           {3, 164},
           {2, 3063},
           {26, 117},
           {25, 117}],
      extra_attrs =>
          [{1, 7342},
           {4, 1356},
           {5, 1057},
           {6, 1376},
           {7, 614},
           {3, 246}]};
get_lev_cfg({1010, 69}) ->
    #{base_attrs =>
          [{1, 4998},
           {4, 923},
           {5, 720},
           {6, 936},
           {7, 418},
           {3, 167},
           {2, 3066},
           {26, 119},
           {25, 119}],
      extra_attrs =>
          [{1, 7497},
           {4, 1385},
           {5, 1080},
           {6, 1405},
           {7, 627},
           {3, 251}]};
get_lev_cfg({1010, 70}) ->
    #{base_attrs =>
          [{1, 5100},
           {4, 942},
           {5, 734},
           {6, 956},
           {7, 426},
           {3, 170},
           {2, 3070},
           {26, 122},
           {25, 122}],
      extra_attrs =>
          [{1, 7651},
           {4, 1413},
           {5, 1102},
           {6, 1434},
           {7, 640},
           {3, 256}]};
get_lev_cfg({1010, 71}) ->
    #{base_attrs =>
          [{1, 5201},
           {4, 961},
           {5, 749},
           {6, 975},
           {7, 435},
           {3, 174},
           {2, 3074},
           {26, 124},
           {25, 124}],
      extra_attrs =>
          [{1, 7802},
           {4, 1441},
           {5, 1124},
           {6, 1462},
           {7, 652},
           {3, 261}]};
get_lev_cfg({1010, 72}) ->
    #{base_attrs =>
          [{1, 5302},
           {4, 979},
           {5, 763},
           {6, 993},
           {7, 443},
           {3, 177},
           {2, 3078},
           {26, 126},
           {25, 126}],
      extra_attrs =>
          [{1, 7953},
           {4, 1469},
           {5, 1145},
           {6, 1490},
           {7, 665},
           {3, 266}]};
get_lev_cfg({1010, 73}) ->
    #{base_attrs =>
          [{1, 5402},
           {4, 998},
           {5, 778},
           {6, 1012},
           {7, 452},
           {3, 181},
           {2, 3082},
           {26, 129},
           {25, 129}],
      extra_attrs =>
          [{1, 8103},
           {4, 1497},
           {5, 1167},
           {6, 1518},
           {7, 678},
           {3, 271}]};
get_lev_cfg({1010, 74}) ->
    #{base_attrs =>
          [{1, 5501},
           {4, 1016},
           {5, 792},
           {6, 1031},
           {7, 460},
           {3, 184},
           {2, 3086},
           {26, 131},
           {25, 131}],
      extra_attrs =>
          [{1, 8251},
           {4, 1524},
           {5, 1188},
           {6, 1546},
           {7, 690},
           {3, 276}]};
get_lev_cfg({1010, 75}) ->
    #{base_attrs =>
          [{1, 5598},
           {4, 1034},
           {5, 806},
           {6, 1049},
           {7, 468},
           {3, 187},
           {2, 3090},
           {26, 134},
           {25, 134}],
      extra_attrs =>
          [{1, 8398},
           {4, 1551},
           {5, 1209},
           {6, 1574},
           {7, 702},
           {3, 281}]};
get_lev_cfg({1010, 76}) ->
    #{base_attrs =>
          [{1, 5695},
           {4, 1052},
           {5, 820},
           {6, 1067},
           {7, 476},
           {3, 190},
           {2, 3094},
           {26, 136},
           {25, 136}],
      extra_attrs =>
          [{1, 8543},
           {4, 1578},
           {5, 1230},
           {6, 1601},
           {7, 714},
           {3, 286}]};
get_lev_cfg({1010, 77}) ->
    #{base_attrs =>
          [{1, 5792},
           {4, 1070},
           {5, 834},
           {6, 1085},
           {7, 484},
           {3, 194},
           {2, 3098},
           {26, 138},
           {25, 138}],
      extra_attrs =>
          [{1, 8688},
           {4, 1605},
           {5, 1251},
           {6, 1628},
           {7, 726},
           {3, 291}]};
get_lev_cfg({1010, 78}) ->
    #{base_attrs =>
          [{1, 5887},
           {4, 1087},
           {5, 848},
           {6, 1103},
           {7, 492},
           {3, 197},
           {2, 3102},
           {26, 141},
           {25, 141}],
      extra_attrs =>
          [{1, 8831},
           {4, 1631},
           {5, 1272},
           {6, 1655},
           {7, 738},
           {3, 295}]};
get_lev_cfg({1010, 79}) ->
    #{base_attrs =>
          [{1, 5981},
           {4, 1105},
           {5, 861},
           {6, 1121},
           {7, 500},
           {3, 200},
           {2, 3106},
           {26, 143},
           {25, 143}],
      extra_attrs =>
          [{1, 8972},
           {4, 1657},
           {5, 1292},
           {6, 1681},
           {7, 750},
           {3, 300}]};
get_lev_cfg({1010, 80}) ->
    #{base_attrs =>
          [{1, 6075},
           {4, 1122},
           {5, 875},
           {6, 1138},
           {7, 508},
           {3, 203},
           {2, 3110},
           {26, 146},
           {25, 146}],
      extra_attrs =>
          [{1, 9113},
           {4, 1683},
           {5, 1312},
           {6, 1708},
           {7, 762},
           {3, 305}]};
get_lev_cfg({1010, 81}) ->
    #{base_attrs =>
          [{1, 6168},
           {4, 1139},
           {5, 888},
           {6, 1156},
           {7, 516},
           {3, 206},
           {2, 3114},
           {26, 148},
           {25, 148}],
      extra_attrs =>
          [{1, 9252},
           {4, 1709},
           {5, 1332},
           {6, 1734},
           {7, 774},
           {3, 309}]};
get_lev_cfg({1010, 82}) ->
    #{base_attrs =>
          [{1, 6259},
           {4, 1156},
           {5, 901},
           {6, 1173},
           {7, 523},
           {3, 209},
           {2, 3118},
           {26, 150},
           {25, 150}],
      extra_attrs =>
          [{1, 9389},
           {4, 1734},
           {5, 1352},
           {6, 1759},
           {7, 785},
           {3, 314}]};
get_lev_cfg({1010, 83}) ->
    #{base_attrs =>
          [{1, 6350},
           {4, 1173},
           {5, 914},
           {6, 1190},
           {7, 531},
           {3, 212},
           {2, 3122},
           {26, 153},
           {25, 153}],
      extra_attrs =>
          [{1, 9525},
           {4, 1759},
           {5, 1372},
           {6, 1785},
           {7, 797},
           {3, 319}]};
get_lev_cfg({1010, 84}) ->
    #{base_attrs =>
          [{1, 6440},
           {4, 1189},
           {5, 927},
           {6, 1207},
           {7, 538},
           {3, 215},
           {2, 3126},
           {26, 155},
           {25, 155}],
      extra_attrs =>
          [{1, 9661},
           {4, 1784},
           {5, 1391},
           {6, 1810},
           {7, 808},
           {3, 323}]};
get_lev_cfg({1010, 85}) ->
    #{base_attrs =>
          [{1, 6529},
           {4, 1206},
           {5, 940},
           {6, 1223},
           {7, 546},
           {3, 218},
           {2, 3130},
           {26, 158},
           {25, 158}],
      extra_attrs =>
          [{1, 9794},
           {4, 1809},
           {5, 1410},
           {6, 1835},
           {7, 819},
           {3, 328}]};
get_lev_cfg({1010, 86}) ->
    #{base_attrs =>
          [{1, 6618},
           {4, 1222},
           {5, 953},
           {6, 1240},
           {7, 553},
           {3, 221},
           {2, 3134},
           {26, 160},
           {25, 160}],
      extra_attrs =>
          [{1, 9927},
           {4, 1833},
           {5, 1430},
           {6, 1860},
           {7, 830},
           {3, 332}]};
get_lev_cfg({1010, 87}) ->
    #{base_attrs =>
          [{1, 6705},
           {4, 1238},
           {5, 965},
           {6, 1256},
           {7, 561},
           {3, 224},
           {2, 3138},
           {26, 162},
           {25, 162}],
      extra_attrs =>
          [{1, 10057},
           {4, 1858},
           {5, 1448},
           {6, 1885},
           {7, 841},
           {3, 336}]};
get_lev_cfg({1010, 88}) ->
    #{base_attrs =>
          [{1, 6791},
           {4, 1254},
           {5, 978},
           {6, 1273},
           {7, 568},
           {3, 227},
           {2, 3142},
           {26, 165},
           {25, 165}],
      extra_attrs =>
          [{1, 10187},
           {4, 1882},
           {5, 1467},
           {6, 1909},
           {7, 852},
           {3, 341}]};
get_lev_cfg({1010, 89}) ->
    #{base_attrs =>
          [{1, 6877},
           {4, 1270},
           {5, 990},
           {6, 1289},
           {7, 575},
           {3, 230},
           {2, 3146},
           {26, 167},
           {25, 167}],
      extra_attrs =>
          [{1, 10315},
           {4, 1905},
           {5, 1486},
           {6, 1933},
           {7, 863},
           {3, 345}]};
get_lev_cfg({1010, 90}) ->
    #{base_attrs =>
          [{1, 6961},
           {4, 1286},
           {5, 1002},
           {6, 1304},
           {7, 582},
           {3, 233},
           {2, 3151},
           {26, 170},
           {25, 170}],
      extra_attrs =>
          [{1, 10442},
           {4, 1929},
           {5, 1504},
           {6, 1957},
           {7, 873},
           {3, 349}]};
get_lev_cfg({1010, 91}) ->
    #{base_attrs =>
          [{1, 7045},
           {4, 1301},
           {5, 1014},
           {6, 1320},
           {7, 589},
           {3, 236},
           {2, 3156},
           {26, 172},
           {25, 172}],
      extra_attrs =>
          [{1, 10568},
           {4, 1952},
           {5, 1522},
           {6, 1980},
           {7, 884},
           {3, 354}]};
get_lev_cfg({1010, 92}) ->
    #{base_attrs =>
          [{1, 7128},
           {4, 1317},
           {5, 1026},
           {6, 1336},
           {7, 596},
           {3, 238},
           {2, 3161},
           {26, 174},
           {25, 174}],
      extra_attrs =>
          [{1, 10693},
           {4, 1975},
           {5, 1540},
           {6, 2004},
           {7, 894},
           {3, 358}]};
get_lev_cfg({1010, 93}) ->
    #{base_attrs =>
          [{1, 7210},
           {4, 1332},
           {5, 1038},
           {6, 1351},
           {7, 603},
           {3, 241},
           {2, 3166},
           {26, 177},
           {25, 177}],
      extra_attrs =>
          [{1, 10816},
           {4, 1998},
           {5, 1558},
           {6, 2027},
           {7, 905},
           {3, 362}]};
get_lev_cfg({1010, 94}) ->
    #{base_attrs =>
          [{1, 7292},
           {4, 1347},
           {5, 1050},
           {6, 1366},
           {7, 610},
           {3, 244},
           {2, 3171},
           {26, 179},
           {25, 179}],
      extra_attrs =>
          [{1, 10938},
           {4, 2020},
           {5, 1575},
           {6, 2050},
           {7, 915},
           {3, 366}]};
get_lev_cfg({1010, 95}) ->
    #{base_attrs =>
          [{1, 7372},
           {4, 1362},
           {5, 1062},
           {6, 1381},
           {7, 616},
           {3, 247},
           {2, 3176},
           {26, 182},
           {25, 182}],
      extra_attrs =>
          [{1, 11058},
           {4, 2043},
           {5, 1593},
           {6, 2072},
           {7, 925},
           {3, 370}]};
get_lev_cfg({1010, 96}) ->
    #{base_attrs =>
          [{1, 7451},
           {4, 1376},
           {5, 1073},
           {6, 1396},
           {7, 623},
           {3, 249},
           {2, 3181},
           {26, 184},
           {25, 184}],
      extra_attrs =>
          [{1, 11177},
           {4, 2065},
           {5, 1610},
           {6, 2095},
           {7, 935},
           {3, 374}]};
get_lev_cfg({1010, 97}) ->
    #{base_attrs =>
          [{1, 7530},
           {4, 1391},
           {5, 1084},
           {6, 1411},
           {7, 630},
           {3, 252},
           {2, 3186},
           {26, 186},
           {25, 186}],
      extra_attrs =>
          [{1, 11295},
           {4, 2086},
           {5, 1627},
           {6, 2117},
           {7, 945},
           {3, 378}]};
get_lev_cfg({1010, 98}) ->
    #{base_attrs =>
          [{1, 7607},
           {4, 1405},
           {5, 1095},
           {6, 1425},
           {7, 636},
           {3, 254},
           {2, 3191},
           {26, 189},
           {25, 189}],
      extra_attrs =>
          [{1, 11411},
           {4, 2108},
           {5, 1643},
           {6, 2138},
           {7, 954},
           {3, 382}]};
get_lev_cfg({1010, 99}) ->
    #{base_attrs =>
          [{1, 7684},
           {4, 1419},
           {5, 1107},
           {6, 1440},
           {7, 643},
           {3, 257},
           {2, 3196},
           {26, 191},
           {25, 191}],
      extra_attrs =>
          [{1, 11527},
           {4, 2129},
           {5, 1660},
           {6, 2160},
           {7, 964},
           {3, 386}]};
get_lev_cfg({1010, 100}) ->
    #{base_attrs =>
          [{1, 7760},
           {4, 1433},
           {5, 1117},
           {6, 1454},
           {7, 649},
           {3, 260},
           {2, 3201},
           {26, 194},
           {25, 194}],
      extra_attrs =>
          [{1, 11641},
           {4, 2150},
           {5, 1676},
           {6, 2181},
           {7, 974},
           {3, 390}]};
get_lev_cfg({1010, 101}) ->
    #{base_attrs =>
          [{1, 7835},
           {4, 1447},
           {5, 1128},
           {6, 1468},
           {7, 655},
           {3, 262},
           {2, 3201},
           {26, 197},
           {25, 197}],
      extra_attrs =>
          [{1, 11753},
           {4, 2171},
           {5, 1693},
           {6, 2203},
           {7, 983},
           {3, 393}]};
get_lev_cfg({1010, 102}) ->
    #{base_attrs =>
          [{1, 7909},
           {4, 1461},
           {5, 1139},
           {6, 1482},
           {7, 661},
           {3, 265},
           {2, 3201},
           {26, 200},
           {25, 200}],
      extra_attrs =>
          [{1, 11864},
           {4, 2191},
           {5, 1709},
           {6, 2223},
           {7, 992},
           {3, 397}]};
get_lev_cfg({1010, 103}) ->
    #{base_attrs =>
          [{1, 7983},
           {4, 1474},
           {5, 1149},
           {6, 1496},
           {7, 667},
           {3, 267},
           {2, 3201},
           {26, 203},
           {25, 203}],
      extra_attrs =>
          [{1, 11974},
           {4, 2212},
           {5, 1724},
           {6, 2244},
           {7, 1001},
           {3, 401}]};
get_lev_cfg({1010, 104}) ->
    #{base_attrs =>
          [{1, 8055},
           {4, 1488},
           {5, 1160},
           {6, 1509},
           {7, 674},
           {3, 269},
           {2, 3201},
           {26, 206},
           {25, 206}],
      extra_attrs =>
          [{1, 12083},
           {4, 2232},
           {5, 1740},
           {6, 2264},
           {7, 1011},
           {3, 404}]};
get_lev_cfg({1010, 105}) ->
    #{base_attrs =>
          [{1, 8127},
           {4, 1501},
           {5, 1170},
           {6, 1523},
           {7, 679},
           {3, 272},
           {2, 3201},
           {26, 206},
           {25, 206}],
      extra_attrs =>
          [{1, 12190},
           {4, 2252},
           {5, 1756},
           {6, 2284},
           {7, 1019},
           {3, 408}]};
get_lev_cfg({1010, 106}) ->
    #{base_attrs =>
          [{1, 8197},
           {4, 1514},
           {5, 1180},
           {6, 1536},
           {7, 685},
           {3, 274},
           {2, 3201},
           {26, 212},
           {25, 212}],
      extra_attrs =>
          [{1, 12296},
           {4, 2271},
           {5, 1771},
           {6, 2304},
           {7, 1028},
           {3, 411}]};
get_lev_cfg({1010, 107}) ->
    #{base_attrs =>
          [{1, 8267},
           {4, 1527},
           {5, 1190},
           {6, 1549},
           {7, 691},
           {3, 276},
           {2, 3201},
           {26, 215},
           {25, 215}],
      extra_attrs =>
          [{1, 12401},
           {4, 2291},
           {5, 1786},
           {6, 2324},
           {7, 1037},
           {3, 415}]};
get_lev_cfg({1010, 108}) ->
    #{base_attrs =>
          [{1, 8336},
           {4, 1540},
           {5, 1200},
           {6, 1562},
           {7, 697},
           {3, 279},
           {2, 3201},
           {26, 218},
           {25, 218}],
      extra_attrs =>
          [{1, 12504},
           {4, 2310},
           {5, 1801},
           {6, 2343},
           {7, 1046},
           {3, 418}]};
get_lev_cfg({1010, 109}) ->
    #{base_attrs =>
          [{1, 8404},
           {4, 1552},
           {5, 1210},
           {6, 1575},
           {7, 703},
           {3, 281},
           {2, 3201},
           {26, 221},
           {25, 221}],
      extra_attrs =>
          [{1, 12606},
           {4, 2328},
           {5, 1815},
           {6, 2362},
           {7, 1054},
           {3, 422}]};
get_lev_cfg({1010, 110}) ->
    #{base_attrs =>
          [{1, 8471},
           {4, 1565},
           {5, 1220},
           {6, 1587},
           {7, 708},
           {3, 283},
           {2, 3201},
           {26, 224},
           {25, 224}],
      extra_attrs =>
          [{1, 12707},
           {4, 2347},
           {5, 1830},
           {6, 2381},
           {7, 1063},
           {3, 425}]};
get_lev_cfg({1010, 111}) ->
    #{base_attrs =>
          [{1, 8537},
           {4, 1577},
           {5, 1229},
           {6, 1600},
           {7, 714},
           {3, 286},
           {2, 3201},
           {26, 227},
           {25, 227}],
      extra_attrs =>
          [{1, 12806},
           {4, 2365},
           {5, 1844},
           {6, 2400},
           {7, 1071},
           {3, 429}]};
get_lev_cfg({1010, 112}) ->
    #{base_attrs =>
          [{1, 8602},
           {4, 1589},
           {5, 1239},
           {6, 1612},
           {7, 719},
           {3, 288},
           {2, 3201},
           {26, 230},
           {25, 230}],
      extra_attrs =>
          [{1, 12904},
           {4, 2384},
           {5, 1858},
           {6, 2418},
           {7, 1079},
           {3, 432}]};
get_lev_cfg({1010, 113}) ->
    #{base_attrs =>
          [{1, 8667},
           {4, 1601},
           {5, 1248},
           {6, 1624},
           {7, 725},
           {3, 290},
           {2, 3201},
           {26, 233},
           {25, 233}],
      extra_attrs =>
          [{1, 13001},
           {4, 2401},
           {5, 1872},
           {6, 2436},
           {7, 1087},
           {3, 435}]};
get_lev_cfg({1010, 114}) ->
    #{base_attrs =>
          [{1, 8730},
           {4, 1613},
           {5, 1257},
           {6, 1636},
           {7, 730},
           {3, 292},
           {2, 3201},
           {26, 236},
           {25, 236}],
      extra_attrs =>
          [{1, 13096},
           {4, 2419},
           {5, 1886},
           {6, 2454},
           {7, 1095},
           {3, 438}]};
get_lev_cfg({1010, 115}) ->
    #{base_attrs =>
          [{1, 8793},
           {4, 1624},
           {5, 1266},
           {6, 1648},
           {7, 735},
           {3, 294},
           {2, 3201},
           {26, 239},
           {25, 239}],
      extra_attrs =>
          [{1, 13190},
           {4, 2436},
           {5, 1900},
           {6, 2472},
           {7, 1103},
           {3, 441}]};
get_lev_cfg({1010, 116}) ->
    #{base_attrs =>
          [{1, 8855},
           {4, 1636},
           {5, 1275},
           {6, 1659},
           {7, 740},
           {3, 296},
           {2, 3201},
           {26, 242},
           {25, 242}],
      extra_attrs =>
          [{1, 13283},
           {4, 2454},
           {5, 1913},
           {6, 2489},
           {7, 1111},
           {3, 445}]};
get_lev_cfg({1010, 117}) ->
    #{base_attrs =>
          [{1, 8916},
           {4, 1647},
           {5, 1284},
           {6, 1671},
           {7, 746},
           {3, 298},
           {2, 3201},
           {26, 245},
           {25, 245}],
      extra_attrs =>
          [{1, 13374},
           {4, 2470},
           {5, 1926},
           {6, 2506},
           {7, 1119},
           {3, 448}]};
get_lev_cfg({1010, 118}) ->
    #{base_attrs =>
          [{1, 8976},
           {4, 1658},
           {5, 1293},
           {6, 1682},
           {7, 751},
           {3, 300},
           {2, 3201},
           {26, 248},
           {25, 248}],
      extra_attrs =>
          [{1, 13465},
           {4, 2487},
           {5, 1939},
           {6, 2523},
           {7, 1126},
           {3, 451}]};
get_lev_cfg({1010, 119}) ->
    #{base_attrs =>
          [{1, 9035},
           {4, 1669},
           {5, 1301},
           {6, 1693},
           {7, 756},
           {3, 302},
           {2, 3201},
           {26, 251},
           {25, 251}],
      extra_attrs =>
          [{1, 13553},
           {4, 2503},
           {5, 1952},
           {6, 2540},
           {7, 1134},
           {3, 454}]};
get_lev_cfg({1010, 120}) ->
    #{base_attrs =>
          [{1, 9094},
           {4, 1680},
           {5, 1310},
           {6, 1704},
           {7, 760},
           {3, 304},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13641},
           {4, 2520},
           {5, 1965},
           {6, 2556},
           {7, 1141},
           {3, 457}]};
get_lev_cfg({1010, 121}) ->
    #{base_attrs =>
          [{1, 9151},
           {4, 1690},
           {5, 1318},
           {6, 1715},
           {7, 765},
           {3, 306},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13727},
           {4, 2536},
           {5, 1977},
           {6, 2572},
           {7, 1148},
           {3, 459}]};
get_lev_cfg({1010, 122}) ->
    #{base_attrs =>
          [{1, 9208},
           {4, 1701},
           {5, 1326},
           {6, 1725},
           {7, 770},
           {3, 308},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13812},
           {4, 2551},
           {5, 1989},
           {6, 2588},
           {7, 1155},
           {3, 462}]};
get_lev_cfg({1010, 123}) ->
    #{base_attrs =>
          [{1, 9263},
           {4, 1711},
           {5, 1334},
           {6, 1736},
           {7, 775},
           {3, 310},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13895},
           {4, 2567},
           {5, 2001},
           {6, 2604},
           {7, 1162},
           {3, 465}]};
get_lev_cfg({1010, 124}) ->
    #{base_attrs =>
          [{1, 9318},
           {4, 1721},
           {5, 1342},
           {6, 1746},
           {7, 779},
           {3, 312},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13977},
           {4, 2582},
           {5, 2013},
           {6, 2619},
           {7, 1169},
           {3, 468}]};
get_lev_cfg({1010, 125}) ->
    #{base_attrs =>
          [{1, 9372},
           {4, 1731},
           {5, 1350},
           {6, 1756},
           {7, 784},
           {3, 314},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 14058},
           {4, 2597},
           {5, 2025},
           {6, 2635},
           {7, 1176},
           {3, 471}]};
get_lev_cfg({1010, 126}) ->
    #{base_attrs =>
          [{1, 9425},
           {4, 1741},
           {5, 1357},
           {6, 1766},
           {7, 788},
           {3, 315},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 14138},
           {4, 2611},
           {5, 2036},
           {6, 2649},
           {7, 1182},
           {3, 473}]};
get_lev_cfg({1010, 127}) ->
    #{base_attrs =>
          [{1, 9477},
           {4, 1750},
           {5, 1365},
           {6, 1776},
           {7, 793},
           {3, 317},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 14216},
           {4, 2626},
           {5, 2047},
           {6, 2664},
           {7, 1189},
           {3, 476}]};
get_lev_cfg({1010, 128}) ->
    #{base_attrs =>
          [{1, 9529},
           {4, 1760},
           {5, 1372},
           {6, 1786},
           {7, 797},
           {3, 319},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 14293},
           {4, 2640},
           {5, 2059},
           {6, 2679},
           {7, 1195},
           {3, 478}]};
get_lev_cfg({1010, 129}) ->
    #{base_attrs =>
          [{1, 9579},
           {4, 1769},
           {5, 1379},
           {6, 1795},
           {7, 801},
           {3, 320},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 14368},
           {4, 2654},
           {5, 2069},
           {6, 2693},
           {7, 1202},
           {3, 481}]};
get_lev_cfg({1010, 130}) ->
    #{base_attrs =>
          [{1, 9628},
           {4, 1778},
           {5, 1387},
           {6, 1804},
           {7, 805},
           {3, 322},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 14443},
           {4, 2668},
           {5, 2080},
           {6, 2707},
           {7, 1208},
           {3, 483}]};
get_lev_cfg({1012, 1}) ->
    #{base_attrs =>
          [{1, 105},
           {4, 31},
           {5, 44},
           {6, 16},
           {7, 28},
           {3, 2},
           {2, 200},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 158}, {4, 47}, {5, 66}, {6, 24}, {7, 43}, {3, 3}]};
get_lev_cfg({1012, 2}) ->
    #{base_attrs =>
          [{1, 126},
           {4, 38},
           {5, 53},
           {6, 19},
           {7, 34},
           {3, 2},
           {2, 576},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 190}, {4, 57}, {5, 80}, {6, 29}, {7, 51}, {3, 4}]};
get_lev_cfg({1012, 3}) ->
    #{base_attrs =>
          [{1, 147},
           {4, 44},
           {5, 62},
           {6, 22},
           {7, 40},
           {3, 3},
           {2, 672},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 221}, {4, 66}, {5, 93}, {6, 34}, {7, 60}, {3, 5}]};
get_lev_cfg({1012, 4}) ->
    #{base_attrs =>
          [{1, 168},
           {4, 50},
           {5, 71},
           {6, 25},
           {7, 46},
           {3, 3},
           {2, 767},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 253},
           {4, 76},
           {5, 107},
           {6, 38},
           {7, 69},
           {3, 5}]};
get_lev_cfg({1012, 5}) ->
    #{base_attrs =>
          [{1, 190},
           {4, 57},
           {5, 80},
           {6, 29},
           {7, 51},
           {3, 4},
           {2, 864},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 285},
           {4, 85},
           {5, 120},
           {6, 43},
           {7, 77},
           {3, 6}]};
get_lev_cfg({1012, 6}) ->
    #{base_attrs =>
          [{1, 211},
           {4, 63},
           {5, 89},
           {6, 32},
           {7, 57},
           {3, 4},
           {2, 960},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 316},
           {4, 95},
           {5, 133},
           {6, 48},
           {7, 86},
           {3, 7}]};
get_lev_cfg({1012, 7}) ->
    #{base_attrs =>
          [{1, 232},
           {4, 69},
           {5, 98},
           {6, 35},
           {7, 63},
           {3, 5},
           {2, 1055},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 348},
           {4, 104},
           {5, 147},
           {6, 53},
           {7, 95},
           {3, 8}]};
get_lev_cfg({1012, 8}) ->
    #{base_attrs =>
          [{1, 253},
           {4, 76},
           {5, 107},
           {6, 38},
           {7, 69},
           {3, 5},
           {2, 1152},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 380},
           {4, 114},
           {5, 160},
           {6, 58},
           {7, 103},
           {3, 8}]};
get_lev_cfg({1012, 9}) ->
    #{base_attrs =>
          [{1, 274},
           {4, 82},
           {5, 116},
           {6, 42},
           {7, 74},
           {3, 6},
           {2, 1248},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 411},
           {4, 124},
           {5, 174},
           {6, 63},
           {7, 112},
           {3, 9}]};
get_lev_cfg({1012, 10}) ->
    #{base_attrs =>
          [{1, 316},
           {4, 95},
           {5, 133},
           {6, 48},
           {7, 86},
           {3, 7},
           {2, 1440},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 475},
           {4, 143},
           {5, 200},
           {6, 72},
           {7, 129},
           {3, 11}]};
get_lev_cfg({1012, 11}) ->
    #{base_attrs =>
          [{1, 358},
           {4, 108},
           {5, 151},
           {6, 55},
           {7, 97},
           {3, 8},
           {2, 1631},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 538},
           {4, 162},
           {5, 227},
           {6, 82},
           {7, 146},
           {3, 12}]};
get_lev_cfg({1012, 12}) ->
    #{base_attrs =>
          [{1, 401},
           {4, 120},
           {5, 169},
           {6, 61},
           {7, 109},
           {3, 9},
           {2, 1824},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 601},
           {4, 181},
           {5, 254},
           {6, 92},
           {7, 164},
           {3, 13}]};
get_lev_cfg({1012, 13}) ->
    #{base_attrs =>
          [{1, 443},
           {4, 133},
           {5, 187},
           {6, 68},
           {7, 120},
           {3, 10},
           {2, 2016},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 665},
           {4, 200},
           {5, 281},
           {6, 102},
           {7, 181},
           {3, 15}]};
get_lev_cfg({1012, 14}) ->
    #{base_attrs =>
          [{1, 485},
           {4, 146},
           {5, 205},
           {6, 74},
           {7, 132},
           {3, 11},
           {2, 2207},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 728},
           {4, 219},
           {5, 307},
           {6, 111},
           {7, 198},
           {3, 16}]};
get_lev_cfg({1012, 15}) ->
    #{base_attrs =>
          [{1, 527},
           {4, 159},
           {5, 223},
           {6, 81},
           {7, 144},
           {3, 12},
           {2, 2400},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 791},
           {4, 238},
           {5, 334},
           {6, 121},
           {7, 216},
           {3, 18}]};
get_lev_cfg({1012, 16}) ->
    #{base_attrs =>
          [{1, 570},
           {4, 171},
           {5, 241},
           {6, 87},
           {7, 155},
           {3, 13},
           {2, 2408},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 855},
           {4, 257},
           {5, 361},
           {6, 131},
           {7, 233},
           {3, 19}]};
get_lev_cfg({1012, 17}) ->
    #{base_attrs =>
          [{1, 612},
           {4, 184},
           {5, 258},
           {6, 94},
           {7, 167},
           {3, 14},
           {2, 2417},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 918},
           {4, 276},
           {5, 388},
           {6, 141},
           {7, 250},
           {3, 21}]};
get_lev_cfg({1012, 18}) ->
    #{base_attrs =>
          [{1, 654},
           {4, 197},
           {5, 276},
           {6, 100},
           {7, 178},
           {3, 15},
           {2, 2426},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 981},
           {4, 295},
           {5, 415},
           {6, 150},
           {7, 267},
           {3, 22}]};
get_lev_cfg({1012, 19}) ->
    #{base_attrs =>
          [{1, 696},
           {4, 209},
           {5, 294},
           {6, 107},
           {7, 190},
           {3, 16},
           {2, 2436},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1045},
           {4, 314},
           {5, 441},
           {6, 160},
           {7, 285},
           {3, 24}]};
get_lev_cfg({1012, 20}) ->
    #{base_attrs =>
          [{1, 739},
           {4, 222},
           {5, 312},
           {6, 113},
           {7, 201},
           {3, 17},
           {2, 2446},
           {26, 2},
           {25, 2}],
      extra_attrs =>
          [{1, 1108},
           {4, 333},
           {5, 468},
           {6, 170},
           {7, 302},
           {3, 25}]};
get_lev_cfg({1012, 21}) ->
    #{base_attrs =>
          [{1, 781},
           {4, 235},
           {5, 330},
           {6, 119},
           {7, 213},
           {3, 18},
           {2, 2457},
           {26, 4},
           {25, 4}],
      extra_attrs =>
          [{1, 1171},
           {4, 353},
           {5, 495},
           {6, 179},
           {7, 319},
           {3, 27}]};
get_lev_cfg({1012, 22}) ->
    #{base_attrs =>
          [{1, 823},
           {4, 248},
           {5, 348},
           {6, 126},
           {7, 224},
           {3, 19},
           {2, 2468},
           {26, 6},
           {25, 6}],
      extra_attrs =>
          [{1, 1235},
           {4, 372},
           {5, 522},
           {6, 189},
           {7, 337},
           {3, 28}]};
get_lev_cfg({1012, 23}) ->
    #{base_attrs =>
          [{1, 865},
           {4, 260},
           {5, 366},
           {6, 132},
           {7, 236},
           {3, 20},
           {2, 2480},
           {26, 9},
           {25, 9}],
      extra_attrs =>
          [{1, 1298},
           {4, 391},
           {5, 549},
           {6, 199},
           {7, 354},
           {3, 30}]};
get_lev_cfg({1012, 24}) ->
    #{base_attrs =>
          [{1, 908},
           {4, 273},
           {5, 383},
           {6, 139},
           {7, 247},
           {3, 21},
           {2, 2492},
           {26, 11},
           {25, 11}],
      extra_attrs =>
          [{1, 1362},
           {4, 410},
           {5, 575},
           {6, 209},
           {7, 371},
           {3, 31}]};
get_lev_cfg({1012, 25}) ->
    #{base_attrs =>
          [{1, 950},
           {4, 286},
           {5, 401},
           {6, 145},
           {7, 259},
           {3, 22},
           {2, 2505},
           {26, 14},
           {25, 14}],
      extra_attrs =>
          [{1, 1425},
           {4, 429},
           {5, 602},
           {6, 218},
           {7, 388},
           {3, 33}]};
get_lev_cfg({1012, 26}) ->
    #{base_attrs =>
          [{1, 992},
           {4, 298},
           {5, 419},
           {6, 152},
           {7, 270},
           {3, 23},
           {2, 2518},
           {26, 16},
           {25, 16}],
      extra_attrs =>
          [{1, 1488},
           {4, 448},
           {5, 629},
           {6, 228},
           {7, 406},
           {3, 34}]};
get_lev_cfg({1012, 27}) ->
    #{base_attrs =>
          [{1, 1034},
           {4, 311},
           {5, 437},
           {6, 158},
           {7, 282},
           {3, 23},
           {2, 2532},
           {26, 18},
           {25, 18}],
      extra_attrs =>
          [{1, 1552},
           {4, 467},
           {5, 656},
           {6, 238},
           {7, 423},
           {3, 35}]};
get_lev_cfg({1012, 28}) ->
    #{base_attrs =>
          [{1, 1076},
           {4, 324},
           {5, 455},
           {6, 165},
           {7, 293},
           {3, 24},
           {2, 2546},
           {26, 21},
           {25, 21}],
      extra_attrs =>
          [{1, 1615},
           {4, 486},
           {5, 682},
           {6, 248},
           {7, 440},
           {3, 37}]};
get_lev_cfg({1012, 29}) ->
    #{base_attrs =>
          [{1, 1119},
           {4, 337},
           {5, 473},
           {6, 171},
           {7, 305},
           {3, 25},
           {2, 2561},
           {26, 23},
           {25, 23}],
      extra_attrs =>
          [{1, 1678},
           {4, 505},
           {5, 709},
           {6, 257},
           {7, 458},
           {3, 38}]};
get_lev_cfg({1012, 30}) ->
    #{base_attrs =>
          [{1, 1161},
           {4, 349},
           {5, 491},
           {6, 178},
           {7, 316},
           {3, 26},
           {2, 2576},
           {26, 26},
           {25, 26}],
      extra_attrs =>
          [{1, 1742},
           {4, 524},
           {5, 736},
           {6, 267},
           {7, 475},
           {3, 40}]};
get_lev_cfg({1012, 31}) ->
    #{base_attrs =>
          [{1, 1203},
           {4, 362},
           {5, 508},
           {6, 184},
           {7, 328},
           {3, 27},
           {2, 2592},
           {26, 28},
           {25, 28}],
      extra_attrs =>
          [{1, 1805},
           {4, 543},
           {5, 763},
           {6, 277},
           {7, 492},
           {3, 41}]};
get_lev_cfg({1012, 32}) ->
    #{base_attrs =>
          [{1, 1245},
           {4, 375},
           {5, 526},
           {6, 191},
           {7, 339},
           {3, 28},
           {2, 2608},
           {26, 30},
           {25, 30}],
      extra_attrs =>
          [{1, 1868},
           {4, 562},
           {5, 790},
           {6, 287},
           {7, 509},
           {3, 43}]};
get_lev_cfg({1012, 33}) ->
    #{base_attrs =>
          [{1, 1288},
           {4, 388},
           {5, 544},
           {6, 197},
           {7, 351},
           {3, 29},
           {2, 2625},
           {26, 33},
           {25, 33}],
      extra_attrs =>
          [{1, 1932},
           {4, 582},
           {5, 816},
           {6, 296},
           {7, 527},
           {3, 44}]};
get_lev_cfg({1012, 34}) ->
    #{base_attrs =>
          [{1, 1330},
           {4, 400},
           {5, 562},
           {6, 204},
           {7, 362},
           {3, 30},
           {2, 2642},
           {26, 35},
           {25, 35}],
      extra_attrs =>
          [{1, 1995},
           {4, 601},
           {5, 843},
           {6, 306},
           {7, 544},
           {3, 46}]};
get_lev_cfg({1012, 35}) ->
    #{base_attrs =>
          [{1, 1372},
           {4, 413},
           {5, 580},
           {6, 210},
           {7, 374},
           {3, 31},
           {2, 2660},
           {26, 38},
           {25, 38}],
      extra_attrs =>
          [{1, 2058},
           {4, 620},
           {5, 870},
           {6, 316},
           {7, 561},
           {3, 47}]};
get_lev_cfg({1012, 36}) ->
    #{base_attrs =>
          [{1, 1414},
           {4, 426},
           {5, 598},
           {6, 217},
           {7, 386},
           {3, 32},
           {2, 2678},
           {26, 40},
           {25, 40}],
      extra_attrs =>
          [{1, 2122},
           {4, 639},
           {5, 897},
           {6, 325},
           {7, 579},
           {3, 49}]};
get_lev_cfg({1012, 37}) ->
    #{base_attrs =>
          [{1, 1457},
           {4, 438},
           {5, 615},
           {6, 223},
           {7, 397},
           {3, 33},
           {2, 2697},
           {26, 42},
           {25, 42}],
      extra_attrs =>
          [{1, 2185},
           {4, 658},
           {5, 923},
           {6, 335},
           {7, 596},
           {3, 50}]};
get_lev_cfg({1012, 38}) ->
    #{base_attrs =>
          [{1, 1499},
           {4, 451},
           {5, 633},
           {6, 230},
           {7, 409},
           {3, 34},
           {2, 2716},
           {26, 45},
           {25, 45}],
      extra_attrs =>
          [{1, 2248},
           {4, 677},
           {5, 950},
           {6, 345},
           {7, 613},
           {3, 52}]};
get_lev_cfg({1012, 39}) ->
    #{base_attrs =>
          [{1, 1541},
           {4, 464},
           {5, 651},
           {6, 236},
           {7, 420},
           {3, 35},
           {2, 2736},
           {26, 47},
           {25, 47}],
      extra_attrs =>
          [{1, 2312},
           {4, 696},
           {5, 977},
           {6, 355},
           {7, 630},
           {3, 53}]};
get_lev_cfg({1012, 40}) ->
    #{base_attrs =>
          [{1, 1583},
           {4, 477},
           {5, 669},
           {6, 243},
           {7, 432},
           {3, 36},
           {2, 2756},
           {26, 50},
           {25, 50}],
      extra_attrs =>
          [{1, 2375},
           {4, 715},
           {5, 1004},
           {6, 364},
           {7, 648},
           {3, 55}]};
get_lev_cfg({1012, 41}) ->
    #{base_attrs =>
          [{1, 1625},
           {4, 489},
           {5, 687},
           {6, 249},
           {7, 443},
           {3, 37},
           {2, 2777},
           {26, 52},
           {25, 52}],
      extra_attrs =>
          [{1, 2438},
           {4, 734},
           {5, 1031},
           {6, 374},
           {7, 665},
           {3, 56}]};
get_lev_cfg({1012, 42}) ->
    #{base_attrs =>
          [{1, 1668},
           {4, 502},
           {5, 705},
           {6, 256},
           {7, 455},
           {3, 38},
           {2, 2798},
           {26, 54},
           {25, 54}],
      extra_attrs =>
          [{1, 2502},
           {4, 753},
           {5, 1057},
           {6, 384},
           {7, 682},
           {3, 57}]};
get_lev_cfg({1012, 43}) ->
    #{base_attrs =>
          [{1, 1710},
           {4, 515},
           {5, 723},
           {6, 262},
           {7, 466},
           {3, 39},
           {2, 2820},
           {26, 57},
           {25, 57}],
      extra_attrs =>
          [{1, 2565},
           {4, 772},
           {5, 1084},
           {6, 394},
           {7, 700},
           {3, 59}]};
get_lev_cfg({1012, 44}) ->
    #{base_attrs =>
          [{1, 1752},
           {4, 527},
           {5, 740},
           {6, 269},
           {7, 478},
           {3, 40},
           {2, 2842},
           {26, 59},
           {25, 59}],
      extra_attrs =>
          [{1, 2629},
           {4, 791},
           {5, 1111},
           {6, 403},
           {7, 717},
           {3, 60}]};
get_lev_cfg({1012, 45}) ->
    #{base_attrs =>
          [{1, 1794},
           {4, 540},
           {5, 758},
           {6, 275},
           {7, 489},
           {3, 41},
           {2, 2865},
           {26, 62},
           {25, 62}],
      extra_attrs =>
          [{1, 2692},
           {4, 810},
           {5, 1138},
           {6, 413},
           {7, 734},
           {3, 62}]};
get_lev_cfg({1012, 46}) ->
    #{base_attrs =>
          [{1, 1837},
           {4, 553},
           {5, 776},
           {6, 282},
           {7, 501},
           {3, 42},
           {2, 2888},
           {26, 64},
           {25, 64}],
      extra_attrs =>
          [{1, 2755},
           {4, 830},
           {5, 1165},
           {6, 423},
           {7, 751},
           {3, 63}]};
get_lev_cfg({1012, 47}) ->
    #{base_attrs =>
          [{1, 1879},
           {4, 566},
           {5, 794},
           {6, 288},
           {7, 512},
           {3, 43},
           {2, 2912},
           {26, 66},
           {25, 66}],
      extra_attrs =>
          [{1, 2819},
           {4, 849},
           {5, 1191},
           {6, 432},
           {7, 769},
           {3, 65}]};
get_lev_cfg({1012, 48}) ->
    #{base_attrs =>
          [{1, 1921},
           {4, 578},
           {5, 812},
           {6, 295},
           {7, 524},
           {3, 44},
           {2, 2936},
           {26, 69},
           {25, 69}],
      extra_attrs =>
          [{1, 2882},
           {4, 868},
           {5, 1218},
           {6, 442},
           {7, 786},
           {3, 66}]};
get_lev_cfg({1012, 49}) ->
    #{base_attrs =>
          [{1, 1963},
           {4, 591},
           {5, 830},
           {6, 301},
           {7, 535},
           {3, 45},
           {2, 2961},
           {26, 71},
           {25, 71}],
      extra_attrs =>
          [{1, 2945},
           {4, 887},
           {5, 1245},
           {6, 452},
           {7, 803},
           {3, 68}]};
get_lev_cfg({1012, 50}) ->
    #{base_attrs =>
          [{1, 2006},
           {4, 604},
           {5, 848},
           {6, 308},
           {7, 547},
           {3, 46},
           {2, 2986},
           {26, 74},
           {25, 74}],
      extra_attrs =>
          [{1, 3009},
           {4, 906},
           {5, 1272},
           {6, 462},
           {7, 821},
           {3, 69}]};
get_lev_cfg({1012, 51}) ->
    #{base_attrs =>
          [{1, 2048},
           {4, 616},
           {5, 865},
           {6, 314},
           {7, 558},
           {3, 47},
           {2, 3012},
           {26, 76},
           {25, 76}],
      extra_attrs =>
          [{1, 3072},
           {4, 925},
           {5, 1298},
           {6, 471},
           {7, 838},
           {3, 71}]};
get_lev_cfg({1012, 52}) ->
    #{base_attrs =>
          [{1, 2090},
           {4, 629},
           {5, 883},
           {6, 321},
           {7, 570},
           {3, 48},
           {2, 3015},
           {26, 78},
           {25, 78}],
      extra_attrs =>
          [{1, 3135},
           {4, 944},
           {5, 1325},
           {6, 481},
           {7, 855},
           {3, 72}]};
get_lev_cfg({1012, 53}) ->
    #{base_attrs =>
          [{1, 2132},
           {4, 642},
           {5, 901},
           {6, 327},
           {7, 581},
           {3, 49},
           {2, 3018},
           {26, 81},
           {25, 81}],
      extra_attrs =>
          [{1, 3199},
           {4, 963},
           {5, 1352},
           {6, 491},
           {7, 872},
           {3, 74}]};
get_lev_cfg({1012, 54}) ->
    #{base_attrs =>
          [{1, 2175},
           {4, 655},
           {5, 919},
           {6, 334},
           {7, 593},
           {3, 50},
           {2, 3021},
           {26, 83},
           {25, 83}],
      extra_attrs =>
          [{1, 3262},
           {4, 982},
           {5, 1379},
           {6, 501},
           {7, 890},
           {3, 75}]};
get_lev_cfg({1012, 55}) ->
    #{base_attrs =>
          [{1, 2217},
           {4, 667},
           {5, 937},
           {6, 340},
           {7, 604},
           {3, 51},
           {2, 3024},
           {26, 86},
           {25, 86}],
      extra_attrs =>
          [{1, 3325},
           {4, 1001},
           {5, 1406},
           {6, 510},
           {7, 907},
           {3, 77}]};
get_lev_cfg({1012, 56}) ->
    #{base_attrs =>
          [{1, 2259},
           {4, 680},
           {5, 955},
           {6, 347},
           {7, 616},
           {3, 52},
           {2, 3027},
           {26, 88},
           {25, 88}],
      extra_attrs =>
          [{1, 3389},
           {4, 1020},
           {5, 1432},
           {6, 520},
           {7, 924},
           {3, 78}]};
get_lev_cfg({1012, 57}) ->
    #{base_attrs =>
          [{1, 2301},
           {4, 693},
           {5, 973},
           {6, 353},
           {7, 627},
           {3, 53},
           {2, 3030},
           {26, 90},
           {25, 90}],
      extra_attrs =>
          [{1, 3452},
           {4, 1039},
           {5, 1459},
           {6, 530},
           {7, 941},
           {3, 80}]};
get_lev_cfg({1012, 58}) ->
    #{base_attrs =>
          [{1, 2343},
           {4, 706},
           {5, 990},
           {6, 359},
           {7, 639},
           {3, 54},
           {2, 3033},
           {26, 93},
           {25, 93}],
      extra_attrs =>
          [{1, 3515},
           {4, 1059},
           {5, 1486},
           {6, 539},
           {7, 959},
           {3, 81}]};
get_lev_cfg({1012, 59}) ->
    #{base_attrs =>
          [{1, 2386},
           {4, 718},
           {5, 1008},
           {6, 366},
           {7, 651},
           {3, 55},
           {2, 3036},
           {26, 95},
           {25, 95}],
      extra_attrs =>
          [{1, 3579},
           {4, 1078},
           {5, 1513},
           {6, 549},
           {7, 976},
           {3, 82}]};
get_lev_cfg({1012, 60}) ->
    #{base_attrs =>
          [{1, 2476},
           {4, 745},
           {5, 1047},
           {6, 380},
           {7, 675},
           {3, 57},
           {2, 3039},
           {26, 98},
           {25, 98}],
      extra_attrs =>
          [{1, 3714},
           {4, 1118},
           {5, 1570},
           {6, 570},
           {7, 1013},
           {3, 86}]};
get_lev_cfg({1012, 61}) ->
    #{base_attrs =>
          [{1, 2544},
           {4, 766},
           {5, 1075},
           {6, 390},
           {7, 694},
           {3, 58},
           {2, 3042},
           {26, 100},
           {25, 100}],
      extra_attrs =>
          [{1, 3816},
           {4, 1149},
           {5, 1613},
           {6, 586},
           {7, 1041},
           {3, 88}]};
get_lev_cfg({1012, 62}) ->
    #{base_attrs =>
          [{1, 2611},
           {4, 786},
           {5, 1103},
           {6, 401},
           {7, 712},
           {3, 60},
           {2, 3045},
           {26, 102},
           {25, 102}],
      extra_attrs =>
          [{1, 3916},
           {4, 1179},
           {5, 1655},
           {6, 601},
           {7, 1068},
           {3, 90}]};
get_lev_cfg({1012, 63}) ->
    #{base_attrs =>
          [{1, 2677},
           {4, 806},
           {5, 1132},
           {6, 411},
           {7, 730},
           {3, 62},
           {2, 3048},
           {26, 105},
           {25, 105}],
      extra_attrs =>
          [{1, 4016},
           {4, 1209},
           {5, 1698},
           {6, 616},
           {7, 1095},
           {3, 93}]};
get_lev_cfg({1012, 64}) ->
    #{base_attrs =>
          [{1, 2743},
           {4, 826},
           {5, 1160},
           {6, 421},
           {7, 748},
           {3, 63},
           {2, 3051},
           {26, 107},
           {25, 107}],
      extra_attrs =>
          [{1, 4115},
           {4, 1239},
           {5, 1740},
           {6, 632},
           {7, 1122},
           {3, 95}]};
get_lev_cfg({1012, 65}) ->
    #{base_attrs =>
          [{1, 2809},
           {4, 846},
           {5, 1187},
           {6, 431},
           {7, 766},
           {3, 65},
           {2, 3054},
           {26, 110},
           {25, 110}],
      extra_attrs =>
          [{1, 4213},
           {4, 1269},
           {5, 1781},
           {6, 647},
           {7, 1149},
           {3, 97}]};
get_lev_cfg({1012, 66}) ->
    #{base_attrs =>
          [{1, 2874},
           {4, 865},
           {5, 1215},
           {6, 441},
           {7, 784},
           {3, 66},
           {2, 3057},
           {26, 112},
           {25, 112}],
      extra_attrs =>
          [{1, 4311},
           {4, 1298},
           {5, 1822},
           {6, 662},
           {7, 1176},
           {3, 99}]};
get_lev_cfg({1012, 67}) ->
    #{base_attrs =>
          [{1, 2938},
           {4, 885},
           {5, 1242},
           {6, 451},
           {7, 801},
           {3, 68},
           {2, 3060},
           {26, 114},
           {25, 114}],
      extra_attrs =>
          [{1, 4407},
           {4, 1327},
           {5, 1863},
           {6, 676},
           {7, 1202},
           {3, 102}]};
get_lev_cfg({1012, 68}) ->
    #{base_attrs =>
          [{1, 3002},
           {4, 904},
           {5, 1269},
           {6, 461},
           {7, 819},
           {3, 69},
           {2, 3063},
           {26, 117},
           {25, 117}],
      extra_attrs =>
          [{1, 4503},
           {4, 1356},
           {5, 1903},
           {6, 691},
           {7, 1228},
           {3, 104}]};
get_lev_cfg({1012, 69}) ->
    #{base_attrs =>
          [{1, 3065},
           {4, 923},
           {5, 1296},
           {6, 470},
           {7, 836},
           {3, 71},
           {2, 3066},
           {26, 119},
           {25, 119}],
      extra_attrs =>
          [{1, 4598},
           {4, 1385},
           {5, 1944},
           {6, 706},
           {7, 1254},
           {3, 106}]};
get_lev_cfg({1012, 70}) ->
    #{base_attrs =>
          [{1, 3128},
           {4, 942},
           {5, 1322},
           {6, 480},
           {7, 853},
           {3, 72},
           {2, 3070},
           {26, 122},
           {25, 122}],
      extra_attrs =>
          [{1, 4692},
           {4, 1413},
           {5, 1983},
           {6, 720},
           {7, 1280},
           {3, 108}]};
get_lev_cfg({1012, 71}) ->
    #{base_attrs =>
          [{1, 3190},
           {4, 961},
           {5, 1348},
           {6, 490},
           {7, 870},
           {3, 73},
           {2, 3074},
           {26, 124},
           {25, 124}],
      extra_attrs =>
          [{1, 4785},
           {4, 1441},
           {5, 2023},
           {6, 735},
           {7, 1305},
           {3, 110}]};
get_lev_cfg({1012, 72}) ->
    #{base_attrs =>
          [{1, 3252},
           {4, 979},
           {5, 1374},
           {6, 499},
           {7, 887},
           {3, 75},
           {2, 3078},
           {26, 126},
           {25, 126}],
      extra_attrs =>
          [{1, 4878},
           {4, 1469},
           {5, 2062},
           {6, 749},
           {7, 1330},
           {3, 113}]};
get_lev_cfg({1012, 73}) ->
    #{base_attrs =>
          [{1, 3313},
           {4, 998},
           {5, 1400},
           {6, 508},
           {7, 904},
           {3, 76},
           {2, 3082},
           {26, 129},
           {25, 129}],
      extra_attrs =>
          [{1, 4970},
           {4, 1497},
           {5, 2101},
           {6, 763},
           {7, 1356},
           {3, 115}]};
get_lev_cfg({1012, 74}) ->
    #{base_attrs =>
          [{1, 3374},
           {4, 1016},
           {5, 1426},
           {6, 518},
           {7, 920},
           {3, 78},
           {2, 3086},
           {26, 131},
           {25, 131}],
      extra_attrs =>
          [{1, 5061},
           {4, 1524},
           {5, 2139},
           {6, 777},
           {7, 1380},
           {3, 117}]};
get_lev_cfg({1012, 75}) ->
    #{base_attrs =>
          [{1, 3433},
           {4, 1034},
           {5, 1451},
           {6, 527},
           {7, 936},
           {3, 79},
           {2, 3090},
           {26, 134},
           {25, 134}],
      extra_attrs =>
          [{1, 5150},
           {4, 1551},
           {5, 2177},
           {6, 791},
           {7, 1405},
           {3, 119}]};
get_lev_cfg({1012, 76}) ->
    #{base_attrs =>
          [{1, 3493},
           {4, 1052},
           {5, 1476},
           {6, 536},
           {7, 953},
           {3, 80},
           {2, 3094},
           {26, 136},
           {25, 136}],
      extra_attrs =>
          [{1, 5240},
           {4, 1578},
           {5, 2215},
           {6, 804},
           {7, 1429},
           {3, 121}]};
get_lev_cfg({1012, 77}) ->
    #{base_attrs =>
          [{1, 3552},
           {4, 1070},
           {5, 1501},
           {6, 545},
           {7, 969},
           {3, 82},
           {2, 3098},
           {26, 138},
           {25, 138}],
      extra_attrs =>
          [{1, 5328},
           {4, 1605},
           {5, 2252},
           {6, 818},
           {7, 1453},
           {3, 123}]};
get_lev_cfg({1012, 78}) ->
    #{base_attrs =>
          [{1, 3610},
           {4, 1087},
           {5, 1526},
           {6, 554},
           {7, 985},
           {3, 83},
           {2, 3102},
           {26, 141},
           {25, 141}],
      extra_attrs =>
          [{1, 5416},
           {4, 1631},
           {5, 2289},
           {6, 831},
           {7, 1477},
           {3, 125}]};
get_lev_cfg({1012, 79}) ->
    #{base_attrs =>
          [{1, 3668},
           {4, 1105},
           {5, 1551},
           {6, 563},
           {7, 1000},
           {3, 85},
           {2, 3106},
           {26, 143},
           {25, 143}],
      extra_attrs =>
          [{1, 5503},
           {4, 1657},
           {5, 2326},
           {6, 845},
           {7, 1501},
           {3, 127}]};
get_lev_cfg({1012, 80}) ->
    #{base_attrs =>
          [{1, 3726},
           {4, 1122},
           {5, 1575},
           {6, 572},
           {7, 1016},
           {3, 86},
           {2, 3110},
           {26, 146},
           {25, 146}],
      extra_attrs =>
          [{1, 5589},
           {4, 1683},
           {5, 2362},
           {6, 858},
           {7, 1524},
           {3, 129}]};
get_lev_cfg({1012, 81}) ->
    #{base_attrs =>
          [{1, 3783},
           {4, 1139},
           {5, 1599},
           {6, 581},
           {7, 1032},
           {3, 87},
           {2, 3114},
           {26, 148},
           {25, 148}],
      extra_attrs =>
          [{1, 5674},
           {4, 1709},
           {5, 2399},
           {6, 871},
           {7, 1548},
           {3, 131}]};
get_lev_cfg({1012, 82}) ->
    #{base_attrs =>
          [{1, 3839},
           {4, 1156},
           {5, 1623},
           {6, 589},
           {7, 1047},
           {3, 88},
           {2, 3118},
           {26, 150},
           {25, 150}],
      extra_attrs =>
          [{1, 5758},
           {4, 1734},
           {5, 2434},
           {6, 884},
           {7, 1571},
           {3, 133}]};
get_lev_cfg({1012, 83}) ->
    #{base_attrs =>
          [{1, 3894},
           {4, 1173},
           {5, 1646},
           {6, 598},
           {7, 1062},
           {3, 90},
           {2, 3122},
           {26, 153},
           {25, 153}],
      extra_attrs =>
          [{1, 5842},
           {4, 1759},
           {5, 2469},
           {6, 897},
           {7, 1594},
           {3, 135}]};
get_lev_cfg({1012, 84}) ->
    #{base_attrs =>
          [{1, 3950},
           {4, 1189},
           {5, 1670},
           {6, 606},
           {7, 1077},
           {3, 91},
           {2, 3126},
           {26, 155},
           {25, 155}],
      extra_attrs =>
          [{1, 5925},
           {4, 1784},
           {5, 2505},
           {6, 910},
           {7, 1616},
           {3, 137}]};
get_lev_cfg({1012, 85}) ->
    #{base_attrs =>
          [{1, 4004},
           {4, 1206},
           {5, 1693},
           {6, 615},
           {7, 1092},
           {3, 92},
           {2, 3130},
           {26, 158},
           {25, 158}],
      extra_attrs =>
          [{1, 6007},
           {4, 1809},
           {5, 2539},
           {6, 922},
           {7, 1638},
           {3, 139}]};
get_lev_cfg({1012, 86}) ->
    #{base_attrs =>
          [{1, 4059},
           {4, 1222},
           {5, 1716},
           {6, 623},
           {7, 1107},
           {3, 94},
           {2, 3134},
           {26, 160},
           {25, 160}],
      extra_attrs =>
          [{1, 6088},
           {4, 1833},
           {5, 2574},
           {6, 935},
           {7, 1661},
           {3, 141}]};
get_lev_cfg({1012, 87}) ->
    #{base_attrs =>
          [{1, 4112},
           {4, 1238},
           {5, 1738},
           {6, 631},
           {7, 1122},
           {3, 95},
           {2, 3138},
           {26, 162},
           {25, 162}],
      extra_attrs =>
          [{1, 6168},
           {4, 1858},
           {5, 2607},
           {6, 947},
           {7, 1683},
           {3, 142}]};
get_lev_cfg({1012, 88}) ->
    #{base_attrs =>
          [{1, 4165},
           {4, 1254},
           {5, 1761},
           {6, 639},
           {7, 1136},
           {3, 96},
           {2, 3142},
           {26, 165},
           {25, 165}],
      extra_attrs =>
          [{1, 6248},
           {4, 1882},
           {5, 2641},
           {6, 959},
           {7, 1704},
           {3, 144}]};
get_lev_cfg({1012, 89}) ->
    #{base_attrs =>
          [{1, 4218},
           {4, 1270},
           {5, 1783},
           {6, 647},
           {7, 1150},
           {3, 97},
           {2, 3146},
           {26, 167},
           {25, 167}],
      extra_attrs =>
          [{1, 6327},
           {4, 1905},
           {5, 2674},
           {6, 971},
           {7, 1726},
           {3, 146}]};
get_lev_cfg({1012, 90}) ->
    #{base_attrs =>
          [{1, 4270},
           {4, 1286},
           {5, 1805},
           {6, 655},
           {7, 1165},
           {3, 98},
           {2, 3151},
           {26, 170},
           {25, 170}],
      extra_attrs =>
          [{1, 6405},
           {4, 1929},
           {5, 2707},
           {6, 983},
           {7, 1747},
           {3, 148}]};
get_lev_cfg({1012, 91}) ->
    #{base_attrs =>
          [{1, 4321},
           {4, 1301},
           {5, 1826},
           {6, 663},
           {7, 1179},
           {3, 100},
           {2, 3156},
           {26, 172},
           {25, 172}],
      extra_attrs =>
          [{1, 6482},
           {4, 1952},
           {5, 2740},
           {6, 995},
           {7, 1768},
           {3, 150}]};
get_lev_cfg({1012, 92}) ->
    #{base_attrs =>
          [{1, 4372},
           {4, 1317},
           {5, 1848},
           {6, 671},
           {7, 1192},
           {3, 101},
           {2, 3161},
           {26, 174},
           {25, 174}],
      extra_attrs =>
          [{1, 6558},
           {4, 1975},
           {5, 2772},
           {6, 1007},
           {7, 1789},
           {3, 151}]};
get_lev_cfg({1012, 93}) ->
    #{base_attrs =>
          [{1, 4422},
           {4, 1332},
           {5, 1869},
           {6, 679},
           {7, 1206},
           {3, 102},
           {2, 3166},
           {26, 177},
           {25, 177}],
      extra_attrs =>
          [{1, 6634},
           {4, 1998},
           {5, 2804},
           {6, 1018},
           {7, 1810},
           {3, 153}]};
get_lev_cfg({1012, 94}) ->
    #{base_attrs =>
          [{1, 4472},
           {4, 1347},
           {5, 1890},
           {6, 686},
           {7, 1220},
           {3, 103},
           {2, 3171},
           {26, 179},
           {25, 179}],
      extra_attrs =>
          [{1, 6708},
           {4, 2020},
           {5, 2836},
           {6, 1030},
           {7, 1830},
           {3, 155}]};
get_lev_cfg({1012, 95}) ->
    #{base_attrs =>
          [{1, 4521},
           {4, 1362},
           {5, 1911},
           {6, 694},
           {7, 1233},
           {3, 104},
           {2, 3176},
           {26, 182},
           {25, 182}],
      extra_attrs =>
          [{1, 6782},
           {4, 2043},
           {5, 2867},
           {6, 1041},
           {7, 1850},
           {3, 157}]};
get_lev_cfg({1012, 96}) ->
    #{base_attrs =>
          [{1, 4570},
           {4, 1376},
           {5, 1932},
           {6, 701},
           {7, 1247},
           {3, 105},
           {2, 3181},
           {26, 184},
           {25, 184}],
      extra_attrs =>
          [{1, 6855},
           {4, 2065},
           {5, 2898},
           {6, 1052},
           {7, 1870},
           {3, 158}]};
get_lev_cfg({1012, 97}) ->
    #{base_attrs =>
          [{1, 4618},
           {4, 1391},
           {5, 1952},
           {6, 709},
           {7, 1260},
           {3, 107},
           {2, 3186},
           {26, 186},
           {25, 186}],
      extra_attrs =>
          [{1, 6927},
           {4, 2086},
           {5, 2928},
           {6, 1064},
           {7, 1890},
           {3, 160}]};
get_lev_cfg({1012, 98}) ->
    #{base_attrs =>
          [{1, 4666},
           {4, 1405},
           {5, 1972},
           {6, 716},
           {7, 1273},
           {3, 108},
           {2, 3191},
           {26, 189},
           {25, 189}],
      extra_attrs =>
          [{1, 6999},
           {4, 2108},
           {5, 2959},
           {6, 1074},
           {7, 1909},
           {3, 162}]};
get_lev_cfg({1012, 99}) ->
    #{base_attrs =>
          [{1, 4713},
           {4, 1419},
           {5, 1992},
           {6, 723},
           {7, 1286},
           {3, 109},
           {2, 3196},
           {26, 191},
           {25, 191}],
      extra_attrs =>
          [{1, 7070},
           {4, 2129},
           {5, 2989},
           {6, 1085},
           {7, 1929},
           {3, 163}]};
get_lev_cfg({1012, 100}) ->
    #{base_attrs =>
          [{1, 4759},
           {4, 1433},
           {5, 2012},
           {6, 731},
           {7, 1298},
           {3, 110},
           {2, 3201},
           {26, 194},
           {25, 194}],
      extra_attrs =>
          [{1, 7139},
           {4, 2150},
           {5, 3018},
           {6, 1096},
           {7, 1948},
           {3, 165}]};
get_lev_cfg({1012, 101}) ->
    #{base_attrs =>
          [{1, 4805},
           {4, 1447},
           {5, 2031},
           {6, 738},
           {7, 1311},
           {3, 111},
           {2, 3201},
           {26, 197},
           {25, 197}],
      extra_attrs =>
          [{1, 7208},
           {4, 2171},
           {5, 3047},
           {6, 1107},
           {7, 1966},
           {3, 167}]};
get_lev_cfg({1012, 102}) ->
    #{base_attrs =>
          [{1, 4851},
           {4, 1461},
           {5, 2050},
           {6, 745},
           {7, 1323},
           {3, 112},
           {2, 3201},
           {26, 200},
           {25, 200}],
      extra_attrs =>
          [{1, 7277},
           {4, 2191},
           {5, 3076},
           {6, 1117},
           {7, 1985},
           {3, 168}]};
get_lev_cfg({1012, 103}) ->
    #{base_attrs =>
          [{1, 4896},
           {4, 1474},
           {5, 2069},
           {6, 751},
           {7, 1335},
           {3, 113},
           {2, 3201},
           {26, 203},
           {25, 203}],
      extra_attrs =>
          [{1, 7344},
           {4, 2212},
           {5, 3104},
           {6, 1127},
           {7, 2003},
           {3, 170}]};
get_lev_cfg({1012, 104}) ->
    #{base_attrs =>
          [{1, 4940},
           {4, 1488},
           {5, 2088},
           {6, 758},
           {7, 1348},
           {3, 114},
           {2, 3201},
           {26, 206},
           {25, 206}],
      extra_attrs =>
          [{1, 7411},
           {4, 2232},
           {5, 3133},
           {6, 1138},
           {7, 2022},
           {3, 171}]};
get_lev_cfg({1012, 105}) ->
    #{base_attrs =>
          [{1, 4984},
           {4, 1501},
           {5, 2107},
           {6, 765},
           {7, 1359},
           {3, 115},
           {2, 3201},
           {26, 206},
           {25, 206}],
      extra_attrs =>
          [{1, 7476},
           {4, 2252},
           {5, 3160},
           {6, 1148},
           {7, 2039},
           {3, 173}]};
get_lev_cfg({1012, 106}) ->
    #{base_attrs =>
          [{1, 5027},
           {4, 1514},
           {5, 2125},
           {6, 772},
           {7, 1371},
           {3, 116},
           {2, 3201},
           {26, 212},
           {25, 212}],
      extra_attrs =>
          [{1, 7541},
           {4, 2271},
           {5, 3188},
           {6, 1158},
           {7, 2057},
           {3, 174}]};
get_lev_cfg({1012, 107}) ->
    #{base_attrs =>
          [{1, 5070},
           {4, 1527},
           {5, 2143},
           {6, 778},
           {7, 1383},
           {3, 117},
           {2, 3201},
           {26, 215},
           {25, 215}],
      extra_attrs =>
          [{1, 7606},
           {4, 2291},
           {5, 3215},
           {6, 1168},
           {7, 2075},
           {3, 176}]};
get_lev_cfg({1012, 108}) ->
    #{base_attrs =>
          [{1, 5112},
           {4, 1540},
           {5, 2161},
           {6, 785},
           {7, 1395},
           {3, 118},
           {2, 3201},
           {26, 218},
           {25, 218}],
      extra_attrs =>
          [{1, 7669},
           {4, 2310},
           {5, 3242},
           {6, 1177},
           {7, 2092},
           {3, 177}]};
get_lev_cfg({1012, 109}) ->
    #{base_attrs =>
          [{1, 5154},
           {4, 1552},
           {5, 2179},
           {6, 791},
           {7, 1406},
           {3, 119},
           {2, 3201},
           {26, 221},
           {25, 221}],
      extra_attrs =>
          [{1, 7731},
           {4, 2328},
           {5, 3268},
           {6, 1187},
           {7, 2109},
           {3, 179}]};
get_lev_cfg({1012, 110}) ->
    #{base_attrs =>
          [{1, 5195},
           {4, 1565},
           {5, 2196},
           {6, 797},
           {7, 1417},
           {3, 120},
           {2, 3201},
           {26, 224},
           {25, 224}],
      extra_attrs =>
          [{1, 7793},
           {4, 2347},
           {5, 3294},
           {6, 1196},
           {7, 2126},
           {3, 180}]};
get_lev_cfg({1012, 111}) ->
    #{base_attrs =>
          [{1, 5236},
           {4, 1577},
           {5, 2213},
           {6, 804},
           {7, 1428},
           {3, 121},
           {2, 3201},
           {26, 227},
           {25, 227}],
      extra_attrs =>
          [{1, 7854},
           {4, 2365},
           {5, 3320},
           {6, 1206},
           {7, 2143},
           {3, 182}]};
get_lev_cfg({1012, 112}) ->
    #{base_attrs =>
          [{1, 5276},
           {4, 1589},
           {5, 2230},
           {6, 810},
           {7, 1439},
           {3, 122},
           {2, 3201},
           {26, 230},
           {25, 230}],
      extra_attrs =>
          [{1, 7914},
           {4, 2384},
           {5, 3346},
           {6, 1215},
           {7, 2159},
           {3, 183}]};
get_lev_cfg({1012, 113}) ->
    #{base_attrs =>
          [{1, 5316},
           {4, 1601},
           {5, 2247},
           {6, 816},
           {7, 1450},
           {3, 123},
           {2, 3201},
           {26, 233},
           {25, 233}],
      extra_attrs =>
          [{1, 7974},
           {4, 2401},
           {5, 3371},
           {6, 1224},
           {7, 2175},
           {3, 184}]};
get_lev_cfg({1012, 114}) ->
    #{base_attrs =>
          [{1, 5354},
           {4, 1613},
           {5, 2263},
           {6, 822},
           {7, 1461},
           {3, 124},
           {2, 3201},
           {26, 236},
           {25, 236}],
      extra_attrs =>
          [{1, 8032},
           {4, 2419},
           {5, 3395},
           {6, 1233},
           {7, 2191},
           {3, 186}]};
get_lev_cfg({1012, 115}) ->
    #{base_attrs =>
          [{1, 5393},
           {4, 1624},
           {5, 2280},
           {6, 828},
           {7, 1471},
           {3, 124},
           {2, 3201},
           {26, 239},
           {25, 239}],
      extra_attrs =>
          [{1, 8090},
           {4, 2436},
           {5, 3420},
           {6, 1242},
           {7, 2207},
           {3, 187}]};
get_lev_cfg({1012, 116}) ->
    #{base_attrs =>
          [{1, 5431},
           {4, 1636},
           {5, 2296},
           {6, 834},
           {7, 1481},
           {3, 125},
           {2, 3201},
           {26, 242},
           {25, 242}],
      extra_attrs =>
          [{1, 8147},
           {4, 2454},
           {5, 3444},
           {6, 1251},
           {7, 2222},
           {3, 188}]};
get_lev_cfg({1012, 117}) ->
    #{base_attrs =>
          [{1, 5468},
           {4, 1647},
           {5, 2312},
           {6, 839},
           {7, 1492},
           {3, 126},
           {2, 3201},
           {26, 245},
           {25, 245}],
      extra_attrs =>
          [{1, 8203},
           {4, 2470},
           {5, 3468},
           {6, 1259},
           {7, 2238},
           {3, 190}]};
get_lev_cfg({1012, 118}) ->
    #{base_attrs =>
          [{1, 5505},
           {4, 1658},
           {5, 2327},
           {6, 845},
           {7, 1502},
           {3, 127},
           {2, 3201},
           {26, 248},
           {25, 248}],
      extra_attrs =>
          [{1, 8258},
           {4, 2487},
           {5, 3491},
           {6, 1268},
           {7, 2253},
           {3, 191}]};
get_lev_cfg({1012, 119}) ->
    #{base_attrs =>
          [{1, 5541},
           {4, 1669},
           {5, 2342},
           {6, 851},
           {7, 1512},
           {3, 128},
           {2, 3201},
           {26, 251},
           {25, 251}],
      extra_attrs =>
          [{1, 8312},
           {4, 2503},
           {5, 3514},
           {6, 1276},
           {7, 2268},
           {3, 192}]};
get_lev_cfg({1012, 120}) ->
    #{base_attrs =>
          [{1, 5577},
           {4, 1680},
           {5, 2358},
           {6, 856},
           {7, 1521},
           {3, 129},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8366},
           {4, 2520},
           {5, 3537},
           {6, 1284},
           {7, 2282},
           {3, 193}]};
get_lev_cfg({1012, 121}) ->
    #{base_attrs =>
          [{1, 5613},
           {4, 1690},
           {5, 2372},
           {6, 862},
           {7, 1531},
           {3, 130},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8419},
           {4, 2536},
           {5, 3559},
           {6, 1293},
           {7, 2297},
           {3, 195}]};
get_lev_cfg({1012, 122}) ->
    #{base_attrs =>
          [{1, 5647},
           {4, 1701},
           {5, 2387},
           {6, 867},
           {7, 1540},
           {3, 130},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8471},
           {4, 2551},
           {5, 3581},
           {6, 1301},
           {7, 2311},
           {3, 196}]};
get_lev_cfg({1012, 123}) ->
    #{base_attrs =>
          [{1, 5681},
           {4, 1711},
           {5, 2402},
           {6, 872},
           {7, 1550},
           {3, 131},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8522},
           {4, 2567},
           {5, 3603},
           {6, 1308},
           {7, 2325},
           {3, 197}]};
get_lev_cfg({1012, 124}) ->
    #{base_attrs =>
          [{1, 5715},
           {4, 1721},
           {5, 2416},
           {6, 877},
           {7, 1559},
           {3, 132},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8573},
           {4, 2582},
           {5, 3624},
           {6, 1316},
           {7, 2339},
           {3, 198}]};
get_lev_cfg({1012, 125}) ->
    #{base_attrs =>
          [{1, 5748},
           {4, 1731},
           {5, 2430},
           {6, 882},
           {7, 1568},
           {3, 133},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8622},
           {4, 2597},
           {5, 3645},
           {6, 1324},
           {7, 2352},
           {3, 199}]};
get_lev_cfg({1012, 126}) ->
    #{base_attrs =>
          [{1, 5780},
           {4, 1741},
           {5, 2443},
           {6, 887},
           {7, 1577},
           {3, 133},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8671},
           {4, 2611},
           {5, 3665},
           {6, 1331},
           {7, 2365},
           {3, 200}]};
get_lev_cfg({1012, 127}) ->
    #{base_attrs =>
          [{1, 5813},
           {4, 1750},
           {5, 2457},
           {6, 892},
           {7, 1586},
           {3, 134},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8719},
           {4, 2626},
           {5, 3686},
           {6, 1339},
           {7, 2379},
           {3, 202}]};
get_lev_cfg({1012, 128}) ->
    #{base_attrs =>
          [{1, 5844},
           {4, 1760},
           {5, 2470},
           {6, 897},
           {7, 1594},
           {3, 135},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8766},
           {4, 2640},
           {5, 3706},
           {6, 1346},
           {7, 2391},
           {3, 203}]};
get_lev_cfg({1012, 129}) ->
    #{base_attrs =>
          [{1, 5875},
           {4, 1769},
           {5, 2483},
           {6, 902},
           {7, 1603},
           {3, 136},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8812},
           {4, 2654},
           {5, 3725},
           {6, 1353},
           {7, 2404},
           {3, 204}]};
get_lev_cfg({1012, 130}) ->
    #{base_attrs =>
          [{1, 5905},
           {4, 1778},
           {5, 2496},
           {6, 907},
           {7, 1611},
           {3, 136},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8858},
           {4, 2668},
           {5, 3745},
           {6, 1360},
           {7, 2416},
           {3, 205}]};
get_lev_cfg({1013, 1}) ->
    #{base_attrs =>
          [{1, 105},
           {4, 31},
           {5, 44},
           {6, 16},
           {7, 28},
           {3, 2},
           {2, 200},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 158}, {4, 47}, {5, 66}, {6, 24}, {7, 43}, {3, 3}]};
get_lev_cfg({1013, 2}) ->
    #{base_attrs =>
          [{1, 126},
           {4, 38},
           {5, 53},
           {6, 19},
           {7, 34},
           {3, 2},
           {2, 576},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 190}, {4, 57}, {5, 80}, {6, 29}, {7, 51}, {3, 4}]};
get_lev_cfg({1013, 3}) ->
    #{base_attrs =>
          [{1, 147},
           {4, 44},
           {5, 62},
           {6, 22},
           {7, 40},
           {3, 3},
           {2, 672},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 221}, {4, 66}, {5, 93}, {6, 34}, {7, 60}, {3, 5}]};
get_lev_cfg({1013, 4}) ->
    #{base_attrs =>
          [{1, 168},
           {4, 50},
           {5, 71},
           {6, 25},
           {7, 46},
           {3, 3},
           {2, 767},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 253},
           {4, 76},
           {5, 107},
           {6, 38},
           {7, 69},
           {3, 5}]};
get_lev_cfg({1013, 5}) ->
    #{base_attrs =>
          [{1, 190},
           {4, 57},
           {5, 80},
           {6, 29},
           {7, 51},
           {3, 4},
           {2, 864},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 285},
           {4, 85},
           {5, 120},
           {6, 43},
           {7, 77},
           {3, 6}]};
get_lev_cfg({1013, 6}) ->
    #{base_attrs =>
          [{1, 211},
           {4, 63},
           {5, 89},
           {6, 32},
           {7, 57},
           {3, 4},
           {2, 960},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 316},
           {4, 95},
           {5, 133},
           {6, 48},
           {7, 86},
           {3, 7}]};
get_lev_cfg({1013, 7}) ->
    #{base_attrs =>
          [{1, 232},
           {4, 69},
           {5, 98},
           {6, 35},
           {7, 63},
           {3, 5},
           {2, 1055},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 348},
           {4, 104},
           {5, 147},
           {6, 53},
           {7, 95},
           {3, 8}]};
get_lev_cfg({1013, 8}) ->
    #{base_attrs =>
          [{1, 253},
           {4, 76},
           {5, 107},
           {6, 38},
           {7, 69},
           {3, 5},
           {2, 1152},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 380},
           {4, 114},
           {5, 160},
           {6, 58},
           {7, 103},
           {3, 8}]};
get_lev_cfg({1013, 9}) ->
    #{base_attrs =>
          [{1, 274},
           {4, 82},
           {5, 116},
           {6, 42},
           {7, 74},
           {3, 6},
           {2, 1248},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 411},
           {4, 124},
           {5, 174},
           {6, 63},
           {7, 112},
           {3, 9}]};
get_lev_cfg({1013, 10}) ->
    #{base_attrs =>
          [{1, 316},
           {4, 95},
           {5, 133},
           {6, 48},
           {7, 86},
           {3, 7},
           {2, 1440},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 475},
           {4, 143},
           {5, 200},
           {6, 72},
           {7, 129},
           {3, 11}]};
get_lev_cfg({1013, 11}) ->
    #{base_attrs =>
          [{1, 358},
           {4, 108},
           {5, 151},
           {6, 55},
           {7, 97},
           {3, 8},
           {2, 1631},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 538},
           {4, 162},
           {5, 227},
           {6, 82},
           {7, 146},
           {3, 12}]};
get_lev_cfg({1013, 12}) ->
    #{base_attrs =>
          [{1, 401},
           {4, 120},
           {5, 169},
           {6, 61},
           {7, 109},
           {3, 9},
           {2, 1824},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 601},
           {4, 181},
           {5, 254},
           {6, 92},
           {7, 164},
           {3, 13}]};
get_lev_cfg({1013, 13}) ->
    #{base_attrs =>
          [{1, 443},
           {4, 133},
           {5, 187},
           {6, 68},
           {7, 120},
           {3, 10},
           {2, 2016},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 665},
           {4, 200},
           {5, 281},
           {6, 102},
           {7, 181},
           {3, 15}]};
get_lev_cfg({1013, 14}) ->
    #{base_attrs =>
          [{1, 485},
           {4, 146},
           {5, 205},
           {6, 74},
           {7, 132},
           {3, 11},
           {2, 2207},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 728},
           {4, 219},
           {5, 307},
           {6, 111},
           {7, 198},
           {3, 16}]};
get_lev_cfg({1013, 15}) ->
    #{base_attrs =>
          [{1, 527},
           {4, 159},
           {5, 223},
           {6, 81},
           {7, 144},
           {3, 12},
           {2, 2400},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 791},
           {4, 238},
           {5, 334},
           {6, 121},
           {7, 216},
           {3, 18}]};
get_lev_cfg({1013, 16}) ->
    #{base_attrs =>
          [{1, 570},
           {4, 171},
           {5, 241},
           {6, 87},
           {7, 155},
           {3, 13},
           {2, 2408},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 855},
           {4, 257},
           {5, 361},
           {6, 131},
           {7, 233},
           {3, 19}]};
get_lev_cfg({1013, 17}) ->
    #{base_attrs =>
          [{1, 612},
           {4, 184},
           {5, 258},
           {6, 94},
           {7, 167},
           {3, 14},
           {2, 2417},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 918},
           {4, 276},
           {5, 388},
           {6, 141},
           {7, 250},
           {3, 21}]};
get_lev_cfg({1013, 18}) ->
    #{base_attrs =>
          [{1, 654},
           {4, 197},
           {5, 276},
           {6, 100},
           {7, 178},
           {3, 15},
           {2, 2426},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 981},
           {4, 295},
           {5, 415},
           {6, 150},
           {7, 267},
           {3, 22}]};
get_lev_cfg({1013, 19}) ->
    #{base_attrs =>
          [{1, 696},
           {4, 209},
           {5, 294},
           {6, 107},
           {7, 190},
           {3, 16},
           {2, 2436},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1045},
           {4, 314},
           {5, 441},
           {6, 160},
           {7, 285},
           {3, 24}]};
get_lev_cfg({1013, 20}) ->
    #{base_attrs =>
          [{1, 739},
           {4, 222},
           {5, 312},
           {6, 113},
           {7, 201},
           {3, 17},
           {2, 2446},
           {26, 2},
           {25, 2}],
      extra_attrs =>
          [{1, 1108},
           {4, 333},
           {5, 468},
           {6, 170},
           {7, 302},
           {3, 25}]};
get_lev_cfg({1013, 21}) ->
    #{base_attrs =>
          [{1, 781},
           {4, 235},
           {5, 330},
           {6, 119},
           {7, 213},
           {3, 18},
           {2, 2457},
           {26, 4},
           {25, 4}],
      extra_attrs =>
          [{1, 1171},
           {4, 353},
           {5, 495},
           {6, 179},
           {7, 319},
           {3, 27}]};
get_lev_cfg({1013, 22}) ->
    #{base_attrs =>
          [{1, 823},
           {4, 248},
           {5, 348},
           {6, 126},
           {7, 224},
           {3, 19},
           {2, 2468},
           {26, 6},
           {25, 6}],
      extra_attrs =>
          [{1, 1235},
           {4, 372},
           {5, 522},
           {6, 189},
           {7, 337},
           {3, 28}]};
get_lev_cfg({1013, 23}) ->
    #{base_attrs =>
          [{1, 865},
           {4, 260},
           {5, 366},
           {6, 132},
           {7, 236},
           {3, 20},
           {2, 2480},
           {26, 9},
           {25, 9}],
      extra_attrs =>
          [{1, 1298},
           {4, 391},
           {5, 549},
           {6, 199},
           {7, 354},
           {3, 30}]};
get_lev_cfg({1013, 24}) ->
    #{base_attrs =>
          [{1, 908},
           {4, 273},
           {5, 383},
           {6, 139},
           {7, 247},
           {3, 21},
           {2, 2492},
           {26, 11},
           {25, 11}],
      extra_attrs =>
          [{1, 1362},
           {4, 410},
           {5, 575},
           {6, 209},
           {7, 371},
           {3, 31}]};
get_lev_cfg({1013, 25}) ->
    #{base_attrs =>
          [{1, 950},
           {4, 286},
           {5, 401},
           {6, 145},
           {7, 259},
           {3, 22},
           {2, 2505},
           {26, 14},
           {25, 14}],
      extra_attrs =>
          [{1, 1425},
           {4, 429},
           {5, 602},
           {6, 218},
           {7, 388},
           {3, 33}]};
get_lev_cfg({1013, 26}) ->
    #{base_attrs =>
          [{1, 992},
           {4, 298},
           {5, 419},
           {6, 152},
           {7, 270},
           {3, 23},
           {2, 2518},
           {26, 16},
           {25, 16}],
      extra_attrs =>
          [{1, 1488},
           {4, 448},
           {5, 629},
           {6, 228},
           {7, 406},
           {3, 34}]};
get_lev_cfg({1013, 27}) ->
    #{base_attrs =>
          [{1, 1034},
           {4, 311},
           {5, 437},
           {6, 158},
           {7, 282},
           {3, 23},
           {2, 2532},
           {26, 18},
           {25, 18}],
      extra_attrs =>
          [{1, 1552},
           {4, 467},
           {5, 656},
           {6, 238},
           {7, 423},
           {3, 35}]};
get_lev_cfg({1013, 28}) ->
    #{base_attrs =>
          [{1, 1076},
           {4, 324},
           {5, 455},
           {6, 165},
           {7, 293},
           {3, 24},
           {2, 2546},
           {26, 21},
           {25, 21}],
      extra_attrs =>
          [{1, 1615},
           {4, 486},
           {5, 682},
           {6, 248},
           {7, 440},
           {3, 37}]};
get_lev_cfg({1013, 29}) ->
    #{base_attrs =>
          [{1, 1119},
           {4, 337},
           {5, 473},
           {6, 171},
           {7, 305},
           {3, 25},
           {2, 2561},
           {26, 23},
           {25, 23}],
      extra_attrs =>
          [{1, 1678},
           {4, 505},
           {5, 709},
           {6, 257},
           {7, 458},
           {3, 38}]};
get_lev_cfg({1013, 30}) ->
    #{base_attrs =>
          [{1, 1161},
           {4, 349},
           {5, 491},
           {6, 178},
           {7, 316},
           {3, 26},
           {2, 2576},
           {26, 26},
           {25, 26}],
      extra_attrs =>
          [{1, 1742},
           {4, 524},
           {5, 736},
           {6, 267},
           {7, 475},
           {3, 40}]};
get_lev_cfg({1013, 31}) ->
    #{base_attrs =>
          [{1, 1203},
           {4, 362},
           {5, 508},
           {6, 184},
           {7, 328},
           {3, 27},
           {2, 2592},
           {26, 28},
           {25, 28}],
      extra_attrs =>
          [{1, 1805},
           {4, 543},
           {5, 763},
           {6, 277},
           {7, 492},
           {3, 41}]};
get_lev_cfg({1013, 32}) ->
    #{base_attrs =>
          [{1, 1245},
           {4, 375},
           {5, 526},
           {6, 191},
           {7, 339},
           {3, 28},
           {2, 2608},
           {26, 30},
           {25, 30}],
      extra_attrs =>
          [{1, 1868},
           {4, 562},
           {5, 790},
           {6, 287},
           {7, 509},
           {3, 43}]};
get_lev_cfg({1013, 33}) ->
    #{base_attrs =>
          [{1, 1288},
           {4, 388},
           {5, 544},
           {6, 197},
           {7, 351},
           {3, 29},
           {2, 2625},
           {26, 33},
           {25, 33}],
      extra_attrs =>
          [{1, 1932},
           {4, 582},
           {5, 816},
           {6, 296},
           {7, 527},
           {3, 44}]};
get_lev_cfg({1013, 34}) ->
    #{base_attrs =>
          [{1, 1330},
           {4, 400},
           {5, 562},
           {6, 204},
           {7, 362},
           {3, 30},
           {2, 2642},
           {26, 35},
           {25, 35}],
      extra_attrs =>
          [{1, 1995},
           {4, 601},
           {5, 843},
           {6, 306},
           {7, 544},
           {3, 46}]};
get_lev_cfg({1013, 35}) ->
    #{base_attrs =>
          [{1, 1372},
           {4, 413},
           {5, 580},
           {6, 210},
           {7, 374},
           {3, 31},
           {2, 2660},
           {26, 38},
           {25, 38}],
      extra_attrs =>
          [{1, 2058},
           {4, 620},
           {5, 870},
           {6, 316},
           {7, 561},
           {3, 47}]};
get_lev_cfg({1013, 36}) ->
    #{base_attrs =>
          [{1, 1414},
           {4, 426},
           {5, 598},
           {6, 217},
           {7, 386},
           {3, 32},
           {2, 2678},
           {26, 40},
           {25, 40}],
      extra_attrs =>
          [{1, 2122},
           {4, 639},
           {5, 897},
           {6, 325},
           {7, 579},
           {3, 49}]};
get_lev_cfg({1013, 37}) ->
    #{base_attrs =>
          [{1, 1457},
           {4, 438},
           {5, 615},
           {6, 223},
           {7, 397},
           {3, 33},
           {2, 2697},
           {26, 42},
           {25, 42}],
      extra_attrs =>
          [{1, 2185},
           {4, 658},
           {5, 923},
           {6, 335},
           {7, 596},
           {3, 50}]};
get_lev_cfg({1013, 38}) ->
    #{base_attrs =>
          [{1, 1499},
           {4, 451},
           {5, 633},
           {6, 230},
           {7, 409},
           {3, 34},
           {2, 2716},
           {26, 45},
           {25, 45}],
      extra_attrs =>
          [{1, 2248},
           {4, 677},
           {5, 950},
           {6, 345},
           {7, 613},
           {3, 52}]};
get_lev_cfg({1013, 39}) ->
    #{base_attrs =>
          [{1, 1541},
           {4, 464},
           {5, 651},
           {6, 236},
           {7, 420},
           {3, 35},
           {2, 2736},
           {26, 47},
           {25, 47}],
      extra_attrs =>
          [{1, 2312},
           {4, 696},
           {5, 977},
           {6, 355},
           {7, 630},
           {3, 53}]};
get_lev_cfg({1013, 40}) ->
    #{base_attrs =>
          [{1, 1583},
           {4, 477},
           {5, 669},
           {6, 243},
           {7, 432},
           {3, 36},
           {2, 2756},
           {26, 50},
           {25, 50}],
      extra_attrs =>
          [{1, 2375},
           {4, 715},
           {5, 1004},
           {6, 364},
           {7, 648},
           {3, 55}]};
get_lev_cfg({1013, 41}) ->
    #{base_attrs =>
          [{1, 1625},
           {4, 489},
           {5, 687},
           {6, 249},
           {7, 443},
           {3, 37},
           {2, 2777},
           {26, 52},
           {25, 52}],
      extra_attrs =>
          [{1, 2438},
           {4, 734},
           {5, 1031},
           {6, 374},
           {7, 665},
           {3, 56}]};
get_lev_cfg({1013, 42}) ->
    #{base_attrs =>
          [{1, 1668},
           {4, 502},
           {5, 705},
           {6, 256},
           {7, 455},
           {3, 38},
           {2, 2798},
           {26, 54},
           {25, 54}],
      extra_attrs =>
          [{1, 2502},
           {4, 753},
           {5, 1057},
           {6, 384},
           {7, 682},
           {3, 57}]};
get_lev_cfg({1013, 43}) ->
    #{base_attrs =>
          [{1, 1710},
           {4, 515},
           {5, 723},
           {6, 262},
           {7, 466},
           {3, 39},
           {2, 2820},
           {26, 57},
           {25, 57}],
      extra_attrs =>
          [{1, 2565},
           {4, 772},
           {5, 1084},
           {6, 394},
           {7, 700},
           {3, 59}]};
get_lev_cfg({1013, 44}) ->
    #{base_attrs =>
          [{1, 1752},
           {4, 527},
           {5, 740},
           {6, 269},
           {7, 478},
           {3, 40},
           {2, 2842},
           {26, 59},
           {25, 59}],
      extra_attrs =>
          [{1, 2629},
           {4, 791},
           {5, 1111},
           {6, 403},
           {7, 717},
           {3, 60}]};
get_lev_cfg({1013, 45}) ->
    #{base_attrs =>
          [{1, 1794},
           {4, 540},
           {5, 758},
           {6, 275},
           {7, 489},
           {3, 41},
           {2, 2865},
           {26, 62},
           {25, 62}],
      extra_attrs =>
          [{1, 2692},
           {4, 810},
           {5, 1138},
           {6, 413},
           {7, 734},
           {3, 62}]};
get_lev_cfg({1013, 46}) ->
    #{base_attrs =>
          [{1, 1837},
           {4, 553},
           {5, 776},
           {6, 282},
           {7, 501},
           {3, 42},
           {2, 2888},
           {26, 64},
           {25, 64}],
      extra_attrs =>
          [{1, 2755},
           {4, 830},
           {5, 1165},
           {6, 423},
           {7, 751},
           {3, 63}]};
get_lev_cfg({1013, 47}) ->
    #{base_attrs =>
          [{1, 1879},
           {4, 566},
           {5, 794},
           {6, 288},
           {7, 512},
           {3, 43},
           {2, 2912},
           {26, 66},
           {25, 66}],
      extra_attrs =>
          [{1, 2819},
           {4, 849},
           {5, 1191},
           {6, 432},
           {7, 769},
           {3, 65}]};
get_lev_cfg({1013, 48}) ->
    #{base_attrs =>
          [{1, 1921},
           {4, 578},
           {5, 812},
           {6, 295},
           {7, 524},
           {3, 44},
           {2, 2936},
           {26, 69},
           {25, 69}],
      extra_attrs =>
          [{1, 2882},
           {4, 868},
           {5, 1218},
           {6, 442},
           {7, 786},
           {3, 66}]};
get_lev_cfg({1013, 49}) ->
    #{base_attrs =>
          [{1, 1963},
           {4, 591},
           {5, 830},
           {6, 301},
           {7, 535},
           {3, 45},
           {2, 2961},
           {26, 71},
           {25, 71}],
      extra_attrs =>
          [{1, 2945},
           {4, 887},
           {5, 1245},
           {6, 452},
           {7, 803},
           {3, 68}]};
get_lev_cfg({1013, 50}) ->
    #{base_attrs =>
          [{1, 2006},
           {4, 604},
           {5, 848},
           {6, 308},
           {7, 547},
           {3, 46},
           {2, 2986},
           {26, 74},
           {25, 74}],
      extra_attrs =>
          [{1, 3009},
           {4, 906},
           {5, 1272},
           {6, 462},
           {7, 821},
           {3, 69}]};
get_lev_cfg({1013, 51}) ->
    #{base_attrs =>
          [{1, 2048},
           {4, 616},
           {5, 865},
           {6, 314},
           {7, 558},
           {3, 47},
           {2, 3012},
           {26, 76},
           {25, 76}],
      extra_attrs =>
          [{1, 3072},
           {4, 925},
           {5, 1298},
           {6, 471},
           {7, 838},
           {3, 71}]};
get_lev_cfg({1013, 52}) ->
    #{base_attrs =>
          [{1, 2090},
           {4, 629},
           {5, 883},
           {6, 321},
           {7, 570},
           {3, 48},
           {2, 3015},
           {26, 78},
           {25, 78}],
      extra_attrs =>
          [{1, 3135},
           {4, 944},
           {5, 1325},
           {6, 481},
           {7, 855},
           {3, 72}]};
get_lev_cfg({1013, 53}) ->
    #{base_attrs =>
          [{1, 2132},
           {4, 642},
           {5, 901},
           {6, 327},
           {7, 581},
           {3, 49},
           {2, 3018},
           {26, 81},
           {25, 81}],
      extra_attrs =>
          [{1, 3199},
           {4, 963},
           {5, 1352},
           {6, 491},
           {7, 872},
           {3, 74}]};
get_lev_cfg({1013, 54}) ->
    #{base_attrs =>
          [{1, 2175},
           {4, 655},
           {5, 919},
           {6, 334},
           {7, 593},
           {3, 50},
           {2, 3021},
           {26, 83},
           {25, 83}],
      extra_attrs =>
          [{1, 3262},
           {4, 982},
           {5, 1379},
           {6, 501},
           {7, 890},
           {3, 75}]};
get_lev_cfg({1013, 55}) ->
    #{base_attrs =>
          [{1, 2217},
           {4, 667},
           {5, 937},
           {6, 340},
           {7, 604},
           {3, 51},
           {2, 3024},
           {26, 86},
           {25, 86}],
      extra_attrs =>
          [{1, 3325},
           {4, 1001},
           {5, 1406},
           {6, 510},
           {7, 907},
           {3, 77}]};
get_lev_cfg({1013, 56}) ->
    #{base_attrs =>
          [{1, 2259},
           {4, 680},
           {5, 955},
           {6, 347},
           {7, 616},
           {3, 52},
           {2, 3027},
           {26, 88},
           {25, 88}],
      extra_attrs =>
          [{1, 3389},
           {4, 1020},
           {5, 1432},
           {6, 520},
           {7, 924},
           {3, 78}]};
get_lev_cfg({1013, 57}) ->
    #{base_attrs =>
          [{1, 2301},
           {4, 693},
           {5, 973},
           {6, 353},
           {7, 627},
           {3, 53},
           {2, 3030},
           {26, 90},
           {25, 90}],
      extra_attrs =>
          [{1, 3452},
           {4, 1039},
           {5, 1459},
           {6, 530},
           {7, 941},
           {3, 80}]};
get_lev_cfg({1013, 58}) ->
    #{base_attrs =>
          [{1, 2343},
           {4, 706},
           {5, 990},
           {6, 359},
           {7, 639},
           {3, 54},
           {2, 3033},
           {26, 93},
           {25, 93}],
      extra_attrs =>
          [{1, 3515},
           {4, 1059},
           {5, 1486},
           {6, 539},
           {7, 959},
           {3, 81}]};
get_lev_cfg({1013, 59}) ->
    #{base_attrs =>
          [{1, 2386},
           {4, 718},
           {5, 1008},
           {6, 366},
           {7, 651},
           {3, 55},
           {2, 3036},
           {26, 95},
           {25, 95}],
      extra_attrs =>
          [{1, 3579},
           {4, 1078},
           {5, 1513},
           {6, 549},
           {7, 976},
           {3, 82}]};
get_lev_cfg({1013, 60}) ->
    #{base_attrs =>
          [{1, 2476},
           {4, 745},
           {5, 1047},
           {6, 380},
           {7, 675},
           {3, 57},
           {2, 3039},
           {26, 98},
           {25, 98}],
      extra_attrs =>
          [{1, 3714},
           {4, 1118},
           {5, 1570},
           {6, 570},
           {7, 1013},
           {3, 86}]};
get_lev_cfg({1013, 61}) ->
    #{base_attrs =>
          [{1, 2544},
           {4, 766},
           {5, 1075},
           {6, 390},
           {7, 694},
           {3, 58},
           {2, 3042},
           {26, 100},
           {25, 100}],
      extra_attrs =>
          [{1, 3816},
           {4, 1149},
           {5, 1613},
           {6, 586},
           {7, 1041},
           {3, 88}]};
get_lev_cfg({1013, 62}) ->
    #{base_attrs =>
          [{1, 2611},
           {4, 786},
           {5, 1103},
           {6, 401},
           {7, 712},
           {3, 60},
           {2, 3045},
           {26, 102},
           {25, 102}],
      extra_attrs =>
          [{1, 3916},
           {4, 1179},
           {5, 1655},
           {6, 601},
           {7, 1068},
           {3, 90}]};
get_lev_cfg({1013, 63}) ->
    #{base_attrs =>
          [{1, 2677},
           {4, 806},
           {5, 1132},
           {6, 411},
           {7, 730},
           {3, 62},
           {2, 3048},
           {26, 105},
           {25, 105}],
      extra_attrs =>
          [{1, 4016},
           {4, 1209},
           {5, 1698},
           {6, 616},
           {7, 1095},
           {3, 93}]};
get_lev_cfg({1013, 64}) ->
    #{base_attrs =>
          [{1, 2743},
           {4, 826},
           {5, 1160},
           {6, 421},
           {7, 748},
           {3, 63},
           {2, 3051},
           {26, 107},
           {25, 107}],
      extra_attrs =>
          [{1, 4115},
           {4, 1239},
           {5, 1740},
           {6, 632},
           {7, 1122},
           {3, 95}]};
get_lev_cfg({1013, 65}) ->
    #{base_attrs =>
          [{1, 2809},
           {4, 846},
           {5, 1187},
           {6, 431},
           {7, 766},
           {3, 65},
           {2, 3054},
           {26, 110},
           {25, 110}],
      extra_attrs =>
          [{1, 4213},
           {4, 1269},
           {5, 1781},
           {6, 647},
           {7, 1149},
           {3, 97}]};
get_lev_cfg({1013, 66}) ->
    #{base_attrs =>
          [{1, 2874},
           {4, 865},
           {5, 1215},
           {6, 441},
           {7, 784},
           {3, 66},
           {2, 3057},
           {26, 112},
           {25, 112}],
      extra_attrs =>
          [{1, 4311},
           {4, 1298},
           {5, 1822},
           {6, 662},
           {7, 1176},
           {3, 99}]};
get_lev_cfg({1013, 67}) ->
    #{base_attrs =>
          [{1, 2938},
           {4, 885},
           {5, 1242},
           {6, 451},
           {7, 801},
           {3, 68},
           {2, 3060},
           {26, 114},
           {25, 114}],
      extra_attrs =>
          [{1, 4407},
           {4, 1327},
           {5, 1863},
           {6, 676},
           {7, 1202},
           {3, 102}]};
get_lev_cfg({1013, 68}) ->
    #{base_attrs =>
          [{1, 3002},
           {4, 904},
           {5, 1269},
           {6, 461},
           {7, 819},
           {3, 69},
           {2, 3063},
           {26, 117},
           {25, 117}],
      extra_attrs =>
          [{1, 4503},
           {4, 1356},
           {5, 1903},
           {6, 691},
           {7, 1228},
           {3, 104}]};
get_lev_cfg({1013, 69}) ->
    #{base_attrs =>
          [{1, 3065},
           {4, 923},
           {5, 1296},
           {6, 470},
           {7, 836},
           {3, 71},
           {2, 3066},
           {26, 119},
           {25, 119}],
      extra_attrs =>
          [{1, 4598},
           {4, 1385},
           {5, 1944},
           {6, 706},
           {7, 1254},
           {3, 106}]};
get_lev_cfg({1013, 70}) ->
    #{base_attrs =>
          [{1, 3128},
           {4, 942},
           {5, 1322},
           {6, 480},
           {7, 853},
           {3, 72},
           {2, 3070},
           {26, 122},
           {25, 122}],
      extra_attrs =>
          [{1, 4692},
           {4, 1413},
           {5, 1983},
           {6, 720},
           {7, 1280},
           {3, 108}]};
get_lev_cfg({1013, 71}) ->
    #{base_attrs =>
          [{1, 3190},
           {4, 961},
           {5, 1348},
           {6, 490},
           {7, 870},
           {3, 73},
           {2, 3074},
           {26, 124},
           {25, 124}],
      extra_attrs =>
          [{1, 4785},
           {4, 1441},
           {5, 2023},
           {6, 735},
           {7, 1305},
           {3, 110}]};
get_lev_cfg({1013, 72}) ->
    #{base_attrs =>
          [{1, 3252},
           {4, 979},
           {5, 1374},
           {6, 499},
           {7, 887},
           {3, 75},
           {2, 3078},
           {26, 126},
           {25, 126}],
      extra_attrs =>
          [{1, 4878},
           {4, 1469},
           {5, 2062},
           {6, 749},
           {7, 1330},
           {3, 113}]};
get_lev_cfg({1013, 73}) ->
    #{base_attrs =>
          [{1, 3313},
           {4, 998},
           {5, 1400},
           {6, 508},
           {7, 904},
           {3, 76},
           {2, 3082},
           {26, 129},
           {25, 129}],
      extra_attrs =>
          [{1, 4970},
           {4, 1497},
           {5, 2101},
           {6, 763},
           {7, 1356},
           {3, 115}]};
get_lev_cfg({1013, 74}) ->
    #{base_attrs =>
          [{1, 3374},
           {4, 1016},
           {5, 1426},
           {6, 518},
           {7, 920},
           {3, 78},
           {2, 3086},
           {26, 131},
           {25, 131}],
      extra_attrs =>
          [{1, 5061},
           {4, 1524},
           {5, 2139},
           {6, 777},
           {7, 1380},
           {3, 117}]};
get_lev_cfg({1013, 75}) ->
    #{base_attrs =>
          [{1, 3433},
           {4, 1034},
           {5, 1451},
           {6, 527},
           {7, 936},
           {3, 79},
           {2, 3090},
           {26, 134},
           {25, 134}],
      extra_attrs =>
          [{1, 5150},
           {4, 1551},
           {5, 2177},
           {6, 791},
           {7, 1405},
           {3, 119}]};
get_lev_cfg({1013, 76}) ->
    #{base_attrs =>
          [{1, 3493},
           {4, 1052},
           {5, 1476},
           {6, 536},
           {7, 953},
           {3, 80},
           {2, 3094},
           {26, 136},
           {25, 136}],
      extra_attrs =>
          [{1, 5240},
           {4, 1578},
           {5, 2215},
           {6, 804},
           {7, 1429},
           {3, 121}]};
get_lev_cfg({1013, 77}) ->
    #{base_attrs =>
          [{1, 3552},
           {4, 1070},
           {5, 1501},
           {6, 545},
           {7, 969},
           {3, 82},
           {2, 3098},
           {26, 138},
           {25, 138}],
      extra_attrs =>
          [{1, 5328},
           {4, 1605},
           {5, 2252},
           {6, 818},
           {7, 1453},
           {3, 123}]};
get_lev_cfg({1013, 78}) ->
    #{base_attrs =>
          [{1, 3610},
           {4, 1087},
           {5, 1526},
           {6, 554},
           {7, 985},
           {3, 83},
           {2, 3102},
           {26, 141},
           {25, 141}],
      extra_attrs =>
          [{1, 5416},
           {4, 1631},
           {5, 2289},
           {6, 831},
           {7, 1477},
           {3, 125}]};
get_lev_cfg({1013, 79}) ->
    #{base_attrs =>
          [{1, 3668},
           {4, 1105},
           {5, 1551},
           {6, 563},
           {7, 1000},
           {3, 85},
           {2, 3106},
           {26, 143},
           {25, 143}],
      extra_attrs =>
          [{1, 5503},
           {4, 1657},
           {5, 2326},
           {6, 845},
           {7, 1501},
           {3, 127}]};
get_lev_cfg({1013, 80}) ->
    #{base_attrs =>
          [{1, 3726},
           {4, 1122},
           {5, 1575},
           {6, 572},
           {7, 1016},
           {3, 86},
           {2, 3110},
           {26, 146},
           {25, 146}],
      extra_attrs =>
          [{1, 5589},
           {4, 1683},
           {5, 2362},
           {6, 858},
           {7, 1524},
           {3, 129}]};
get_lev_cfg({1013, 81}) ->
    #{base_attrs =>
          [{1, 3783},
           {4, 1139},
           {5, 1599},
           {6, 581},
           {7, 1032},
           {3, 87},
           {2, 3114},
           {26, 148},
           {25, 148}],
      extra_attrs =>
          [{1, 5674},
           {4, 1709},
           {5, 2399},
           {6, 871},
           {7, 1548},
           {3, 131}]};
get_lev_cfg({1013, 82}) ->
    #{base_attrs =>
          [{1, 3839},
           {4, 1156},
           {5, 1623},
           {6, 589},
           {7, 1047},
           {3, 88},
           {2, 3118},
           {26, 150},
           {25, 150}],
      extra_attrs =>
          [{1, 5758},
           {4, 1734},
           {5, 2434},
           {6, 884},
           {7, 1571},
           {3, 133}]};
get_lev_cfg({1013, 83}) ->
    #{base_attrs =>
          [{1, 3894},
           {4, 1173},
           {5, 1646},
           {6, 598},
           {7, 1062},
           {3, 90},
           {2, 3122},
           {26, 153},
           {25, 153}],
      extra_attrs =>
          [{1, 5842},
           {4, 1759},
           {5, 2469},
           {6, 897},
           {7, 1594},
           {3, 135}]};
get_lev_cfg({1013, 84}) ->
    #{base_attrs =>
          [{1, 3950},
           {4, 1189},
           {5, 1670},
           {6, 606},
           {7, 1077},
           {3, 91},
           {2, 3126},
           {26, 155},
           {25, 155}],
      extra_attrs =>
          [{1, 5925},
           {4, 1784},
           {5, 2505},
           {6, 910},
           {7, 1616},
           {3, 137}]};
get_lev_cfg({1013, 85}) ->
    #{base_attrs =>
          [{1, 4004},
           {4, 1206},
           {5, 1693},
           {6, 615},
           {7, 1092},
           {3, 92},
           {2, 3130},
           {26, 158},
           {25, 158}],
      extra_attrs =>
          [{1, 6007},
           {4, 1809},
           {5, 2539},
           {6, 922},
           {7, 1638},
           {3, 139}]};
get_lev_cfg({1013, 86}) ->
    #{base_attrs =>
          [{1, 4059},
           {4, 1222},
           {5, 1716},
           {6, 623},
           {7, 1107},
           {3, 94},
           {2, 3134},
           {26, 160},
           {25, 160}],
      extra_attrs =>
          [{1, 6088},
           {4, 1833},
           {5, 2574},
           {6, 935},
           {7, 1661},
           {3, 141}]};
get_lev_cfg({1013, 87}) ->
    #{base_attrs =>
          [{1, 4112},
           {4, 1238},
           {5, 1738},
           {6, 631},
           {7, 1122},
           {3, 95},
           {2, 3138},
           {26, 162},
           {25, 162}],
      extra_attrs =>
          [{1, 6168},
           {4, 1858},
           {5, 2607},
           {6, 947},
           {7, 1683},
           {3, 142}]};
get_lev_cfg({1013, 88}) ->
    #{base_attrs =>
          [{1, 4165},
           {4, 1254},
           {5, 1761},
           {6, 639},
           {7, 1136},
           {3, 96},
           {2, 3142},
           {26, 165},
           {25, 165}],
      extra_attrs =>
          [{1, 6248},
           {4, 1882},
           {5, 2641},
           {6, 959},
           {7, 1704},
           {3, 144}]};
get_lev_cfg({1013, 89}) ->
    #{base_attrs =>
          [{1, 4218},
           {4, 1270},
           {5, 1783},
           {6, 647},
           {7, 1150},
           {3, 97},
           {2, 3146},
           {26, 167},
           {25, 167}],
      extra_attrs =>
          [{1, 6327},
           {4, 1905},
           {5, 2674},
           {6, 971},
           {7, 1726},
           {3, 146}]};
get_lev_cfg({1013, 90}) ->
    #{base_attrs =>
          [{1, 4270},
           {4, 1286},
           {5, 1805},
           {6, 655},
           {7, 1165},
           {3, 98},
           {2, 3151},
           {26, 170},
           {25, 170}],
      extra_attrs =>
          [{1, 6405},
           {4, 1929},
           {5, 2707},
           {6, 983},
           {7, 1747},
           {3, 148}]};
get_lev_cfg({1013, 91}) ->
    #{base_attrs =>
          [{1, 4321},
           {4, 1301},
           {5, 1826},
           {6, 663},
           {7, 1179},
           {3, 100},
           {2, 3156},
           {26, 172},
           {25, 172}],
      extra_attrs =>
          [{1, 6482},
           {4, 1952},
           {5, 2740},
           {6, 995},
           {7, 1768},
           {3, 150}]};
get_lev_cfg({1013, 92}) ->
    #{base_attrs =>
          [{1, 4372},
           {4, 1317},
           {5, 1848},
           {6, 671},
           {7, 1192},
           {3, 101},
           {2, 3161},
           {26, 174},
           {25, 174}],
      extra_attrs =>
          [{1, 6558},
           {4, 1975},
           {5, 2772},
           {6, 1007},
           {7, 1789},
           {3, 151}]};
get_lev_cfg({1013, 93}) ->
    #{base_attrs =>
          [{1, 4422},
           {4, 1332},
           {5, 1869},
           {6, 679},
           {7, 1206},
           {3, 102},
           {2, 3166},
           {26, 177},
           {25, 177}],
      extra_attrs =>
          [{1, 6634},
           {4, 1998},
           {5, 2804},
           {6, 1018},
           {7, 1810},
           {3, 153}]};
get_lev_cfg({1013, 94}) ->
    #{base_attrs =>
          [{1, 4472},
           {4, 1347},
           {5, 1890},
           {6, 686},
           {7, 1220},
           {3, 103},
           {2, 3171},
           {26, 179},
           {25, 179}],
      extra_attrs =>
          [{1, 6708},
           {4, 2020},
           {5, 2836},
           {6, 1030},
           {7, 1830},
           {3, 155}]};
get_lev_cfg({1013, 95}) ->
    #{base_attrs =>
          [{1, 4521},
           {4, 1362},
           {5, 1911},
           {6, 694},
           {7, 1233},
           {3, 104},
           {2, 3176},
           {26, 182},
           {25, 182}],
      extra_attrs =>
          [{1, 6782},
           {4, 2043},
           {5, 2867},
           {6, 1041},
           {7, 1850},
           {3, 157}]};
get_lev_cfg({1013, 96}) ->
    #{base_attrs =>
          [{1, 4570},
           {4, 1376},
           {5, 1932},
           {6, 701},
           {7, 1247},
           {3, 105},
           {2, 3181},
           {26, 184},
           {25, 184}],
      extra_attrs =>
          [{1, 6855},
           {4, 2065},
           {5, 2898},
           {6, 1052},
           {7, 1870},
           {3, 158}]};
get_lev_cfg({1013, 97}) ->
    #{base_attrs =>
          [{1, 4618},
           {4, 1391},
           {5, 1952},
           {6, 709},
           {7, 1260},
           {3, 107},
           {2, 3186},
           {26, 186},
           {25, 186}],
      extra_attrs =>
          [{1, 6927},
           {4, 2086},
           {5, 2928},
           {6, 1064},
           {7, 1890},
           {3, 160}]};
get_lev_cfg({1013, 98}) ->
    #{base_attrs =>
          [{1, 4666},
           {4, 1405},
           {5, 1972},
           {6, 716},
           {7, 1273},
           {3, 108},
           {2, 3191},
           {26, 189},
           {25, 189}],
      extra_attrs =>
          [{1, 6999},
           {4, 2108},
           {5, 2959},
           {6, 1074},
           {7, 1909},
           {3, 162}]};
get_lev_cfg({1013, 99}) ->
    #{base_attrs =>
          [{1, 4713},
           {4, 1419},
           {5, 1992},
           {6, 723},
           {7, 1286},
           {3, 109},
           {2, 3196},
           {26, 191},
           {25, 191}],
      extra_attrs =>
          [{1, 7070},
           {4, 2129},
           {5, 2989},
           {6, 1085},
           {7, 1929},
           {3, 163}]};
get_lev_cfg({1013, 100}) ->
    #{base_attrs =>
          [{1, 4759},
           {4, 1433},
           {5, 2012},
           {6, 731},
           {7, 1298},
           {3, 110},
           {2, 3201},
           {26, 194},
           {25, 194}],
      extra_attrs =>
          [{1, 7139},
           {4, 2150},
           {5, 3018},
           {6, 1096},
           {7, 1948},
           {3, 165}]};
get_lev_cfg({1013, 101}) ->
    #{base_attrs =>
          [{1, 4805},
           {4, 1447},
           {5, 2031},
           {6, 738},
           {7, 1311},
           {3, 111},
           {2, 3201},
           {26, 197},
           {25, 197}],
      extra_attrs =>
          [{1, 7208},
           {4, 2171},
           {5, 3047},
           {6, 1107},
           {7, 1966},
           {3, 167}]};
get_lev_cfg({1013, 102}) ->
    #{base_attrs =>
          [{1, 4851},
           {4, 1461},
           {5, 2050},
           {6, 745},
           {7, 1323},
           {3, 112},
           {2, 3201},
           {26, 200},
           {25, 200}],
      extra_attrs =>
          [{1, 7277},
           {4, 2191},
           {5, 3076},
           {6, 1117},
           {7, 1985},
           {3, 168}]};
get_lev_cfg({1013, 103}) ->
    #{base_attrs =>
          [{1, 4896},
           {4, 1474},
           {5, 2069},
           {6, 751},
           {7, 1335},
           {3, 113},
           {2, 3201},
           {26, 203},
           {25, 203}],
      extra_attrs =>
          [{1, 7344},
           {4, 2212},
           {5, 3104},
           {6, 1127},
           {7, 2003},
           {3, 170}]};
get_lev_cfg({1013, 104}) ->
    #{base_attrs =>
          [{1, 4940},
           {4, 1488},
           {5, 2088},
           {6, 758},
           {7, 1348},
           {3, 114},
           {2, 3201},
           {26, 206},
           {25, 206}],
      extra_attrs =>
          [{1, 7411},
           {4, 2232},
           {5, 3133},
           {6, 1138},
           {7, 2022},
           {3, 171}]};
get_lev_cfg({1013, 105}) ->
    #{base_attrs =>
          [{1, 4984},
           {4, 1501},
           {5, 2107},
           {6, 765},
           {7, 1359},
           {3, 115},
           {2, 3201},
           {26, 206},
           {25, 206}],
      extra_attrs =>
          [{1, 7476},
           {4, 2252},
           {5, 3160},
           {6, 1148},
           {7, 2039},
           {3, 173}]};
get_lev_cfg({1013, 106}) ->
    #{base_attrs =>
          [{1, 5027},
           {4, 1514},
           {5, 2125},
           {6, 772},
           {7, 1371},
           {3, 116},
           {2, 3201},
           {26, 212},
           {25, 212}],
      extra_attrs =>
          [{1, 7541},
           {4, 2271},
           {5, 3188},
           {6, 1158},
           {7, 2057},
           {3, 174}]};
get_lev_cfg({1013, 107}) ->
    #{base_attrs =>
          [{1, 5070},
           {4, 1527},
           {5, 2143},
           {6, 778},
           {7, 1383},
           {3, 117},
           {2, 3201},
           {26, 215},
           {25, 215}],
      extra_attrs =>
          [{1, 7606},
           {4, 2291},
           {5, 3215},
           {6, 1168},
           {7, 2075},
           {3, 176}]};
get_lev_cfg({1013, 108}) ->
    #{base_attrs =>
          [{1, 5112},
           {4, 1540},
           {5, 2161},
           {6, 785},
           {7, 1395},
           {3, 118},
           {2, 3201},
           {26, 218},
           {25, 218}],
      extra_attrs =>
          [{1, 7669},
           {4, 2310},
           {5, 3242},
           {6, 1177},
           {7, 2092},
           {3, 177}]};
get_lev_cfg({1013, 109}) ->
    #{base_attrs =>
          [{1, 5154},
           {4, 1552},
           {5, 2179},
           {6, 791},
           {7, 1406},
           {3, 119},
           {2, 3201},
           {26, 221},
           {25, 221}],
      extra_attrs =>
          [{1, 7731},
           {4, 2328},
           {5, 3268},
           {6, 1187},
           {7, 2109},
           {3, 179}]};
get_lev_cfg({1013, 110}) ->
    #{base_attrs =>
          [{1, 5195},
           {4, 1565},
           {5, 2196},
           {6, 797},
           {7, 1417},
           {3, 120},
           {2, 3201},
           {26, 224},
           {25, 224}],
      extra_attrs =>
          [{1, 7793},
           {4, 2347},
           {5, 3294},
           {6, 1196},
           {7, 2126},
           {3, 180}]};
get_lev_cfg({1013, 111}) ->
    #{base_attrs =>
          [{1, 5236},
           {4, 1577},
           {5, 2213},
           {6, 804},
           {7, 1428},
           {3, 121},
           {2, 3201},
           {26, 227},
           {25, 227}],
      extra_attrs =>
          [{1, 7854},
           {4, 2365},
           {5, 3320},
           {6, 1206},
           {7, 2143},
           {3, 182}]};
get_lev_cfg({1013, 112}) ->
    #{base_attrs =>
          [{1, 5276},
           {4, 1589},
           {5, 2230},
           {6, 810},
           {7, 1439},
           {3, 122},
           {2, 3201},
           {26, 230},
           {25, 230}],
      extra_attrs =>
          [{1, 7914},
           {4, 2384},
           {5, 3346},
           {6, 1215},
           {7, 2159},
           {3, 183}]};
get_lev_cfg({1013, 113}) ->
    #{base_attrs =>
          [{1, 5316},
           {4, 1601},
           {5, 2247},
           {6, 816},
           {7, 1450},
           {3, 123},
           {2, 3201},
           {26, 233},
           {25, 233}],
      extra_attrs =>
          [{1, 7974},
           {4, 2401},
           {5, 3371},
           {6, 1224},
           {7, 2175},
           {3, 184}]};
get_lev_cfg({1013, 114}) ->
    #{base_attrs =>
          [{1, 5354},
           {4, 1613},
           {5, 2263},
           {6, 822},
           {7, 1461},
           {3, 124},
           {2, 3201},
           {26, 236},
           {25, 236}],
      extra_attrs =>
          [{1, 8032},
           {4, 2419},
           {5, 3395},
           {6, 1233},
           {7, 2191},
           {3, 186}]};
get_lev_cfg({1013, 115}) ->
    #{base_attrs =>
          [{1, 5393},
           {4, 1624},
           {5, 2280},
           {6, 828},
           {7, 1471},
           {3, 124},
           {2, 3201},
           {26, 239},
           {25, 239}],
      extra_attrs =>
          [{1, 8090},
           {4, 2436},
           {5, 3420},
           {6, 1242},
           {7, 2207},
           {3, 187}]};
get_lev_cfg({1013, 116}) ->
    #{base_attrs =>
          [{1, 5431},
           {4, 1636},
           {5, 2296},
           {6, 834},
           {7, 1481},
           {3, 125},
           {2, 3201},
           {26, 242},
           {25, 242}],
      extra_attrs =>
          [{1, 8147},
           {4, 2454},
           {5, 3444},
           {6, 1251},
           {7, 2222},
           {3, 188}]};
get_lev_cfg({1013, 117}) ->
    #{base_attrs =>
          [{1, 5468},
           {4, 1647},
           {5, 2312},
           {6, 839},
           {7, 1492},
           {3, 126},
           {2, 3201},
           {26, 245},
           {25, 245}],
      extra_attrs =>
          [{1, 8203},
           {4, 2470},
           {5, 3468},
           {6, 1259},
           {7, 2238},
           {3, 190}]};
get_lev_cfg({1013, 118}) ->
    #{base_attrs =>
          [{1, 5505},
           {4, 1658},
           {5, 2327},
           {6, 845},
           {7, 1502},
           {3, 127},
           {2, 3201},
           {26, 248},
           {25, 248}],
      extra_attrs =>
          [{1, 8258},
           {4, 2487},
           {5, 3491},
           {6, 1268},
           {7, 2253},
           {3, 191}]};
get_lev_cfg({1013, 119}) ->
    #{base_attrs =>
          [{1, 5541},
           {4, 1669},
           {5, 2342},
           {6, 851},
           {7, 1512},
           {3, 128},
           {2, 3201},
           {26, 251},
           {25, 251}],
      extra_attrs =>
          [{1, 8312},
           {4, 2503},
           {5, 3514},
           {6, 1276},
           {7, 2268},
           {3, 192}]};
get_lev_cfg({1013, 120}) ->
    #{base_attrs =>
          [{1, 5577},
           {4, 1680},
           {5, 2358},
           {6, 856},
           {7, 1521},
           {3, 129},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8366},
           {4, 2520},
           {5, 3537},
           {6, 1284},
           {7, 2282},
           {3, 193}]};
get_lev_cfg({1013, 121}) ->
    #{base_attrs =>
          [{1, 5613},
           {4, 1690},
           {5, 2372},
           {6, 862},
           {7, 1531},
           {3, 130},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8419},
           {4, 2536},
           {5, 3559},
           {6, 1293},
           {7, 2297},
           {3, 195}]};
get_lev_cfg({1013, 122}) ->
    #{base_attrs =>
          [{1, 5647},
           {4, 1701},
           {5, 2387},
           {6, 867},
           {7, 1540},
           {3, 130},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8471},
           {4, 2551},
           {5, 3581},
           {6, 1301},
           {7, 2311},
           {3, 196}]};
get_lev_cfg({1013, 123}) ->
    #{base_attrs =>
          [{1, 5681},
           {4, 1711},
           {5, 2402},
           {6, 872},
           {7, 1550},
           {3, 131},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8522},
           {4, 2567},
           {5, 3603},
           {6, 1308},
           {7, 2325},
           {3, 197}]};
get_lev_cfg({1013, 124}) ->
    #{base_attrs =>
          [{1, 5715},
           {4, 1721},
           {5, 2416},
           {6, 877},
           {7, 1559},
           {3, 132},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8573},
           {4, 2582},
           {5, 3624},
           {6, 1316},
           {7, 2339},
           {3, 198}]};
get_lev_cfg({1013, 125}) ->
    #{base_attrs =>
          [{1, 5748},
           {4, 1731},
           {5, 2430},
           {6, 882},
           {7, 1568},
           {3, 133},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8622},
           {4, 2597},
           {5, 3645},
           {6, 1324},
           {7, 2352},
           {3, 199}]};
get_lev_cfg({1013, 126}) ->
    #{base_attrs =>
          [{1, 5780},
           {4, 1741},
           {5, 2443},
           {6, 887},
           {7, 1577},
           {3, 133},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8671},
           {4, 2611},
           {5, 3665},
           {6, 1331},
           {7, 2365},
           {3, 200}]};
get_lev_cfg({1013, 127}) ->
    #{base_attrs =>
          [{1, 5813},
           {4, 1750},
           {5, 2457},
           {6, 892},
           {7, 1586},
           {3, 134},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8719},
           {4, 2626},
           {5, 3686},
           {6, 1339},
           {7, 2379},
           {3, 202}]};
get_lev_cfg({1013, 128}) ->
    #{base_attrs =>
          [{1, 5844},
           {4, 1760},
           {5, 2470},
           {6, 897},
           {7, 1594},
           {3, 135},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8766},
           {4, 2640},
           {5, 3706},
           {6, 1346},
           {7, 2391},
           {3, 203}]};
get_lev_cfg({1013, 129}) ->
    #{base_attrs =>
          [{1, 5875},
           {4, 1769},
           {5, 2483},
           {6, 902},
           {7, 1603},
           {3, 136},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8812},
           {4, 2654},
           {5, 3725},
           {6, 1353},
           {7, 2404},
           {3, 204}]};
get_lev_cfg({1013, 130}) ->
    #{base_attrs =>
          [{1, 5905},
           {4, 1778},
           {5, 2496},
           {6, 907},
           {7, 1611},
           {3, 136},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8858},
           {4, 2668},
           {5, 3745},
           {6, 1360},
           {7, 2416},
           {3, 205}]};
get_lev_cfg({1014, 1}) ->
    #{base_attrs =>
          [{1, 105},
           {4, 31},
           {5, 44},
           {6, 16},
           {7, 28},
           {3, 2},
           {2, 200},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 158}, {4, 47}, {5, 66}, {6, 24}, {7, 43}, {3, 3}]};
get_lev_cfg({1014, 2}) ->
    #{base_attrs =>
          [{1, 126},
           {4, 38},
           {5, 53},
           {6, 19},
           {7, 34},
           {3, 2},
           {2, 576},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 190}, {4, 57}, {5, 80}, {6, 29}, {7, 51}, {3, 4}]};
get_lev_cfg({1014, 3}) ->
    #{base_attrs =>
          [{1, 147},
           {4, 44},
           {5, 62},
           {6, 22},
           {7, 40},
           {3, 3},
           {2, 672},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 221}, {4, 66}, {5, 93}, {6, 34}, {7, 60}, {3, 5}]};
get_lev_cfg({1014, 4}) ->
    #{base_attrs =>
          [{1, 168},
           {4, 50},
           {5, 71},
           {6, 25},
           {7, 46},
           {3, 3},
           {2, 767},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 253},
           {4, 76},
           {5, 107},
           {6, 38},
           {7, 69},
           {3, 5}]};
get_lev_cfg({1014, 5}) ->
    #{base_attrs =>
          [{1, 190},
           {4, 57},
           {5, 80},
           {6, 29},
           {7, 51},
           {3, 4},
           {2, 864},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 285},
           {4, 85},
           {5, 120},
           {6, 43},
           {7, 77},
           {3, 6}]};
get_lev_cfg({1014, 6}) ->
    #{base_attrs =>
          [{1, 211},
           {4, 63},
           {5, 89},
           {6, 32},
           {7, 57},
           {3, 4},
           {2, 960},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 316},
           {4, 95},
           {5, 133},
           {6, 48},
           {7, 86},
           {3, 7}]};
get_lev_cfg({1014, 7}) ->
    #{base_attrs =>
          [{1, 232},
           {4, 69},
           {5, 98},
           {6, 35},
           {7, 63},
           {3, 5},
           {2, 1055},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 348},
           {4, 104},
           {5, 147},
           {6, 53},
           {7, 95},
           {3, 8}]};
get_lev_cfg({1014, 8}) ->
    #{base_attrs =>
          [{1, 253},
           {4, 76},
           {5, 107},
           {6, 38},
           {7, 69},
           {3, 5},
           {2, 1152},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 380},
           {4, 114},
           {5, 160},
           {6, 58},
           {7, 103},
           {3, 8}]};
get_lev_cfg({1014, 9}) ->
    #{base_attrs =>
          [{1, 274},
           {4, 82},
           {5, 116},
           {6, 42},
           {7, 74},
           {3, 6},
           {2, 1248},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 411},
           {4, 124},
           {5, 174},
           {6, 63},
           {7, 112},
           {3, 9}]};
get_lev_cfg({1014, 10}) ->
    #{base_attrs =>
          [{1, 316},
           {4, 95},
           {5, 133},
           {6, 48},
           {7, 86},
           {3, 7},
           {2, 1440},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 475},
           {4, 143},
           {5, 200},
           {6, 72},
           {7, 129},
           {3, 11}]};
get_lev_cfg({1014, 11}) ->
    #{base_attrs =>
          [{1, 358},
           {4, 108},
           {5, 151},
           {6, 55},
           {7, 97},
           {3, 8},
           {2, 1631},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 538},
           {4, 162},
           {5, 227},
           {6, 82},
           {7, 146},
           {3, 12}]};
get_lev_cfg({1014, 12}) ->
    #{base_attrs =>
          [{1, 401},
           {4, 120},
           {5, 169},
           {6, 61},
           {7, 109},
           {3, 9},
           {2, 1824},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 601},
           {4, 181},
           {5, 254},
           {6, 92},
           {7, 164},
           {3, 13}]};
get_lev_cfg({1014, 13}) ->
    #{base_attrs =>
          [{1, 443},
           {4, 133},
           {5, 187},
           {6, 68},
           {7, 120},
           {3, 10},
           {2, 2016},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 665},
           {4, 200},
           {5, 281},
           {6, 102},
           {7, 181},
           {3, 15}]};
get_lev_cfg({1014, 14}) ->
    #{base_attrs =>
          [{1, 485},
           {4, 146},
           {5, 205},
           {6, 74},
           {7, 132},
           {3, 11},
           {2, 2207},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 728},
           {4, 219},
           {5, 307},
           {6, 111},
           {7, 198},
           {3, 16}]};
get_lev_cfg({1014, 15}) ->
    #{base_attrs =>
          [{1, 527},
           {4, 159},
           {5, 223},
           {6, 81},
           {7, 144},
           {3, 12},
           {2, 2400},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 791},
           {4, 238},
           {5, 334},
           {6, 121},
           {7, 216},
           {3, 18}]};
get_lev_cfg({1014, 16}) ->
    #{base_attrs =>
          [{1, 570},
           {4, 171},
           {5, 241},
           {6, 87},
           {7, 155},
           {3, 13},
           {2, 2408},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 855},
           {4, 257},
           {5, 361},
           {6, 131},
           {7, 233},
           {3, 19}]};
get_lev_cfg({1014, 17}) ->
    #{base_attrs =>
          [{1, 612},
           {4, 184},
           {5, 258},
           {6, 94},
           {7, 167},
           {3, 14},
           {2, 2417},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 918},
           {4, 276},
           {5, 388},
           {6, 141},
           {7, 250},
           {3, 21}]};
get_lev_cfg({1014, 18}) ->
    #{base_attrs =>
          [{1, 654},
           {4, 197},
           {5, 276},
           {6, 100},
           {7, 178},
           {3, 15},
           {2, 2426},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 981},
           {4, 295},
           {5, 415},
           {6, 150},
           {7, 267},
           {3, 22}]};
get_lev_cfg({1014, 19}) ->
    #{base_attrs =>
          [{1, 696},
           {4, 209},
           {5, 294},
           {6, 107},
           {7, 190},
           {3, 16},
           {2, 2436},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1045},
           {4, 314},
           {5, 441},
           {6, 160},
           {7, 285},
           {3, 24}]};
get_lev_cfg({1014, 20}) ->
    #{base_attrs =>
          [{1, 739},
           {4, 222},
           {5, 312},
           {6, 113},
           {7, 201},
           {3, 17},
           {2, 2446},
           {26, 2},
           {25, 2}],
      extra_attrs =>
          [{1, 1108},
           {4, 333},
           {5, 468},
           {6, 170},
           {7, 302},
           {3, 25}]};
get_lev_cfg({1014, 21}) ->
    #{base_attrs =>
          [{1, 781},
           {4, 235},
           {5, 330},
           {6, 119},
           {7, 213},
           {3, 18},
           {2, 2457},
           {26, 4},
           {25, 4}],
      extra_attrs =>
          [{1, 1171},
           {4, 353},
           {5, 495},
           {6, 179},
           {7, 319},
           {3, 27}]};
get_lev_cfg({1014, 22}) ->
    #{base_attrs =>
          [{1, 823},
           {4, 248},
           {5, 348},
           {6, 126},
           {7, 224},
           {3, 19},
           {2, 2468},
           {26, 6},
           {25, 6}],
      extra_attrs =>
          [{1, 1235},
           {4, 372},
           {5, 522},
           {6, 189},
           {7, 337},
           {3, 28}]};
get_lev_cfg({1014, 23}) ->
    #{base_attrs =>
          [{1, 865},
           {4, 260},
           {5, 366},
           {6, 132},
           {7, 236},
           {3, 20},
           {2, 2480},
           {26, 9},
           {25, 9}],
      extra_attrs =>
          [{1, 1298},
           {4, 391},
           {5, 549},
           {6, 199},
           {7, 354},
           {3, 30}]};
get_lev_cfg({1014, 24}) ->
    #{base_attrs =>
          [{1, 908},
           {4, 273},
           {5, 383},
           {6, 139},
           {7, 247},
           {3, 21},
           {2, 2492},
           {26, 11},
           {25, 11}],
      extra_attrs =>
          [{1, 1362},
           {4, 410},
           {5, 575},
           {6, 209},
           {7, 371},
           {3, 31}]};
get_lev_cfg({1014, 25}) ->
    #{base_attrs =>
          [{1, 950},
           {4, 286},
           {5, 401},
           {6, 145},
           {7, 259},
           {3, 22},
           {2, 2505},
           {26, 14},
           {25, 14}],
      extra_attrs =>
          [{1, 1425},
           {4, 429},
           {5, 602},
           {6, 218},
           {7, 388},
           {3, 33}]};
get_lev_cfg({1014, 26}) ->
    #{base_attrs =>
          [{1, 992},
           {4, 298},
           {5, 419},
           {6, 152},
           {7, 270},
           {3, 23},
           {2, 2518},
           {26, 16},
           {25, 16}],
      extra_attrs =>
          [{1, 1488},
           {4, 448},
           {5, 629},
           {6, 228},
           {7, 406},
           {3, 34}]};
get_lev_cfg({1014, 27}) ->
    #{base_attrs =>
          [{1, 1034},
           {4, 311},
           {5, 437},
           {6, 158},
           {7, 282},
           {3, 23},
           {2, 2532},
           {26, 18},
           {25, 18}],
      extra_attrs =>
          [{1, 1552},
           {4, 467},
           {5, 656},
           {6, 238},
           {7, 423},
           {3, 35}]};
get_lev_cfg({1014, 28}) ->
    #{base_attrs =>
          [{1, 1076},
           {4, 324},
           {5, 455},
           {6, 165},
           {7, 293},
           {3, 24},
           {2, 2546},
           {26, 21},
           {25, 21}],
      extra_attrs =>
          [{1, 1615},
           {4, 486},
           {5, 682},
           {6, 248},
           {7, 440},
           {3, 37}]};
get_lev_cfg({1014, 29}) ->
    #{base_attrs =>
          [{1, 1119},
           {4, 337},
           {5, 473},
           {6, 171},
           {7, 305},
           {3, 25},
           {2, 2561},
           {26, 23},
           {25, 23}],
      extra_attrs =>
          [{1, 1678},
           {4, 505},
           {5, 709},
           {6, 257},
           {7, 458},
           {3, 38}]};
get_lev_cfg({1014, 30}) ->
    #{base_attrs =>
          [{1, 1161},
           {4, 349},
           {5, 491},
           {6, 178},
           {7, 316},
           {3, 26},
           {2, 2576},
           {26, 26},
           {25, 26}],
      extra_attrs =>
          [{1, 1742},
           {4, 524},
           {5, 736},
           {6, 267},
           {7, 475},
           {3, 40}]};
get_lev_cfg({1014, 31}) ->
    #{base_attrs =>
          [{1, 1203},
           {4, 362},
           {5, 508},
           {6, 184},
           {7, 328},
           {3, 27},
           {2, 2592},
           {26, 28},
           {25, 28}],
      extra_attrs =>
          [{1, 1805},
           {4, 543},
           {5, 763},
           {6, 277},
           {7, 492},
           {3, 41}]};
get_lev_cfg({1014, 32}) ->
    #{base_attrs =>
          [{1, 1245},
           {4, 375},
           {5, 526},
           {6, 191},
           {7, 339},
           {3, 28},
           {2, 2608},
           {26, 30},
           {25, 30}],
      extra_attrs =>
          [{1, 1868},
           {4, 562},
           {5, 790},
           {6, 287},
           {7, 509},
           {3, 43}]};
get_lev_cfg({1014, 33}) ->
    #{base_attrs =>
          [{1, 1288},
           {4, 388},
           {5, 544},
           {6, 197},
           {7, 351},
           {3, 29},
           {2, 2625},
           {26, 33},
           {25, 33}],
      extra_attrs =>
          [{1, 1932},
           {4, 582},
           {5, 816},
           {6, 296},
           {7, 527},
           {3, 44}]};
get_lev_cfg({1014, 34}) ->
    #{base_attrs =>
          [{1, 1330},
           {4, 400},
           {5, 562},
           {6, 204},
           {7, 362},
           {3, 30},
           {2, 2642},
           {26, 35},
           {25, 35}],
      extra_attrs =>
          [{1, 1995},
           {4, 601},
           {5, 843},
           {6, 306},
           {7, 544},
           {3, 46}]};
get_lev_cfg({1014, 35}) ->
    #{base_attrs =>
          [{1, 1372},
           {4, 413},
           {5, 580},
           {6, 210},
           {7, 374},
           {3, 31},
           {2, 2660},
           {26, 38},
           {25, 38}],
      extra_attrs =>
          [{1, 2058},
           {4, 620},
           {5, 870},
           {6, 316},
           {7, 561},
           {3, 47}]};
get_lev_cfg({1014, 36}) ->
    #{base_attrs =>
          [{1, 1414},
           {4, 426},
           {5, 598},
           {6, 217},
           {7, 386},
           {3, 32},
           {2, 2678},
           {26, 40},
           {25, 40}],
      extra_attrs =>
          [{1, 2122},
           {4, 639},
           {5, 897},
           {6, 325},
           {7, 579},
           {3, 49}]};
get_lev_cfg({1014, 37}) ->
    #{base_attrs =>
          [{1, 1457},
           {4, 438},
           {5, 615},
           {6, 223},
           {7, 397},
           {3, 33},
           {2, 2697},
           {26, 42},
           {25, 42}],
      extra_attrs =>
          [{1, 2185},
           {4, 658},
           {5, 923},
           {6, 335},
           {7, 596},
           {3, 50}]};
get_lev_cfg({1014, 38}) ->
    #{base_attrs =>
          [{1, 1499},
           {4, 451},
           {5, 633},
           {6, 230},
           {7, 409},
           {3, 34},
           {2, 2716},
           {26, 45},
           {25, 45}],
      extra_attrs =>
          [{1, 2248},
           {4, 677},
           {5, 950},
           {6, 345},
           {7, 613},
           {3, 52}]};
get_lev_cfg({1014, 39}) ->
    #{base_attrs =>
          [{1, 1541},
           {4, 464},
           {5, 651},
           {6, 236},
           {7, 420},
           {3, 35},
           {2, 2736},
           {26, 47},
           {25, 47}],
      extra_attrs =>
          [{1, 2312},
           {4, 696},
           {5, 977},
           {6, 355},
           {7, 630},
           {3, 53}]};
get_lev_cfg({1014, 40}) ->
    #{base_attrs =>
          [{1, 1583},
           {4, 477},
           {5, 669},
           {6, 243},
           {7, 432},
           {3, 36},
           {2, 2756},
           {26, 50},
           {25, 50}],
      extra_attrs =>
          [{1, 2375},
           {4, 715},
           {5, 1004},
           {6, 364},
           {7, 648},
           {3, 55}]};
get_lev_cfg({1014, 41}) ->
    #{base_attrs =>
          [{1, 1625},
           {4, 489},
           {5, 687},
           {6, 249},
           {7, 443},
           {3, 37},
           {2, 2777},
           {26, 52},
           {25, 52}],
      extra_attrs =>
          [{1, 2438},
           {4, 734},
           {5, 1031},
           {6, 374},
           {7, 665},
           {3, 56}]};
get_lev_cfg({1014, 42}) ->
    #{base_attrs =>
          [{1, 1668},
           {4, 502},
           {5, 705},
           {6, 256},
           {7, 455},
           {3, 38},
           {2, 2798},
           {26, 54},
           {25, 54}],
      extra_attrs =>
          [{1, 2502},
           {4, 753},
           {5, 1057},
           {6, 384},
           {7, 682},
           {3, 57}]};
get_lev_cfg({1014, 43}) ->
    #{base_attrs =>
          [{1, 1710},
           {4, 515},
           {5, 723},
           {6, 262},
           {7, 466},
           {3, 39},
           {2, 2820},
           {26, 57},
           {25, 57}],
      extra_attrs =>
          [{1, 2565},
           {4, 772},
           {5, 1084},
           {6, 394},
           {7, 700},
           {3, 59}]};
get_lev_cfg({1014, 44}) ->
    #{base_attrs =>
          [{1, 1752},
           {4, 527},
           {5, 740},
           {6, 269},
           {7, 478},
           {3, 40},
           {2, 2842},
           {26, 59},
           {25, 59}],
      extra_attrs =>
          [{1, 2629},
           {4, 791},
           {5, 1111},
           {6, 403},
           {7, 717},
           {3, 60}]};
get_lev_cfg({1014, 45}) ->
    #{base_attrs =>
          [{1, 1794},
           {4, 540},
           {5, 758},
           {6, 275},
           {7, 489},
           {3, 41},
           {2, 2865},
           {26, 62},
           {25, 62}],
      extra_attrs =>
          [{1, 2692},
           {4, 810},
           {5, 1138},
           {6, 413},
           {7, 734},
           {3, 62}]};
get_lev_cfg({1014, 46}) ->
    #{base_attrs =>
          [{1, 1837},
           {4, 553},
           {5, 776},
           {6, 282},
           {7, 501},
           {3, 42},
           {2, 2888},
           {26, 64},
           {25, 64}],
      extra_attrs =>
          [{1, 2755},
           {4, 830},
           {5, 1165},
           {6, 423},
           {7, 751},
           {3, 63}]};
get_lev_cfg({1014, 47}) ->
    #{base_attrs =>
          [{1, 1879},
           {4, 566},
           {5, 794},
           {6, 288},
           {7, 512},
           {3, 43},
           {2, 2912},
           {26, 66},
           {25, 66}],
      extra_attrs =>
          [{1, 2819},
           {4, 849},
           {5, 1191},
           {6, 432},
           {7, 769},
           {3, 65}]};
get_lev_cfg({1014, 48}) ->
    #{base_attrs =>
          [{1, 1921},
           {4, 578},
           {5, 812},
           {6, 295},
           {7, 524},
           {3, 44},
           {2, 2936},
           {26, 69},
           {25, 69}],
      extra_attrs =>
          [{1, 2882},
           {4, 868},
           {5, 1218},
           {6, 442},
           {7, 786},
           {3, 66}]};
get_lev_cfg({1014, 49}) ->
    #{base_attrs =>
          [{1, 1963},
           {4, 591},
           {5, 830},
           {6, 301},
           {7, 535},
           {3, 45},
           {2, 2961},
           {26, 71},
           {25, 71}],
      extra_attrs =>
          [{1, 2945},
           {4, 887},
           {5, 1245},
           {6, 452},
           {7, 803},
           {3, 68}]};
get_lev_cfg({1014, 50}) ->
    #{base_attrs =>
          [{1, 2006},
           {4, 604},
           {5, 848},
           {6, 308},
           {7, 547},
           {3, 46},
           {2, 2986},
           {26, 74},
           {25, 74}],
      extra_attrs =>
          [{1, 3009},
           {4, 906},
           {5, 1272},
           {6, 462},
           {7, 821},
           {3, 69}]};
get_lev_cfg({1014, 51}) ->
    #{base_attrs =>
          [{1, 2048},
           {4, 616},
           {5, 865},
           {6, 314},
           {7, 558},
           {3, 47},
           {2, 3012},
           {26, 76},
           {25, 76}],
      extra_attrs =>
          [{1, 3072},
           {4, 925},
           {5, 1298},
           {6, 471},
           {7, 838},
           {3, 71}]};
get_lev_cfg({1014, 52}) ->
    #{base_attrs =>
          [{1, 2090},
           {4, 629},
           {5, 883},
           {6, 321},
           {7, 570},
           {3, 48},
           {2, 3015},
           {26, 78},
           {25, 78}],
      extra_attrs =>
          [{1, 3135},
           {4, 944},
           {5, 1325},
           {6, 481},
           {7, 855},
           {3, 72}]};
get_lev_cfg({1014, 53}) ->
    #{base_attrs =>
          [{1, 2132},
           {4, 642},
           {5, 901},
           {6, 327},
           {7, 581},
           {3, 49},
           {2, 3018},
           {26, 81},
           {25, 81}],
      extra_attrs =>
          [{1, 3199},
           {4, 963},
           {5, 1352},
           {6, 491},
           {7, 872},
           {3, 74}]};
get_lev_cfg({1014, 54}) ->
    #{base_attrs =>
          [{1, 2175},
           {4, 655},
           {5, 919},
           {6, 334},
           {7, 593},
           {3, 50},
           {2, 3021},
           {26, 83},
           {25, 83}],
      extra_attrs =>
          [{1, 3262},
           {4, 982},
           {5, 1379},
           {6, 501},
           {7, 890},
           {3, 75}]};
get_lev_cfg({1014, 55}) ->
    #{base_attrs =>
          [{1, 2217},
           {4, 667},
           {5, 937},
           {6, 340},
           {7, 604},
           {3, 51},
           {2, 3024},
           {26, 86},
           {25, 86}],
      extra_attrs =>
          [{1, 3325},
           {4, 1001},
           {5, 1406},
           {6, 510},
           {7, 907},
           {3, 77}]};
get_lev_cfg({1014, 56}) ->
    #{base_attrs =>
          [{1, 2259},
           {4, 680},
           {5, 955},
           {6, 347},
           {7, 616},
           {3, 52},
           {2, 3027},
           {26, 88},
           {25, 88}],
      extra_attrs =>
          [{1, 3389},
           {4, 1020},
           {5, 1432},
           {6, 520},
           {7, 924},
           {3, 78}]};
get_lev_cfg({1014, 57}) ->
    #{base_attrs =>
          [{1, 2301},
           {4, 693},
           {5, 973},
           {6, 353},
           {7, 627},
           {3, 53},
           {2, 3030},
           {26, 90},
           {25, 90}],
      extra_attrs =>
          [{1, 3452},
           {4, 1039},
           {5, 1459},
           {6, 530},
           {7, 941},
           {3, 80}]};
get_lev_cfg({1014, 58}) ->
    #{base_attrs =>
          [{1, 2343},
           {4, 706},
           {5, 990},
           {6, 359},
           {7, 639},
           {3, 54},
           {2, 3033},
           {26, 93},
           {25, 93}],
      extra_attrs =>
          [{1, 3515},
           {4, 1059},
           {5, 1486},
           {6, 539},
           {7, 959},
           {3, 81}]};
get_lev_cfg({1014, 59}) ->
    #{base_attrs =>
          [{1, 2386},
           {4, 718},
           {5, 1008},
           {6, 366},
           {7, 651},
           {3, 55},
           {2, 3036},
           {26, 95},
           {25, 95}],
      extra_attrs =>
          [{1, 3579},
           {4, 1078},
           {5, 1513},
           {6, 549},
           {7, 976},
           {3, 82}]};
get_lev_cfg({1014, 60}) ->
    #{base_attrs =>
          [{1, 2476},
           {4, 745},
           {5, 1047},
           {6, 380},
           {7, 675},
           {3, 57},
           {2, 3039},
           {26, 98},
           {25, 98}],
      extra_attrs =>
          [{1, 3714},
           {4, 1118},
           {5, 1570},
           {6, 570},
           {7, 1013},
           {3, 86}]};
get_lev_cfg({1014, 61}) ->
    #{base_attrs =>
          [{1, 2544},
           {4, 766},
           {5, 1075},
           {6, 390},
           {7, 694},
           {3, 58},
           {2, 3042},
           {26, 100},
           {25, 100}],
      extra_attrs =>
          [{1, 3816},
           {4, 1149},
           {5, 1613},
           {6, 586},
           {7, 1041},
           {3, 88}]};
get_lev_cfg({1014, 62}) ->
    #{base_attrs =>
          [{1, 2611},
           {4, 786},
           {5, 1103},
           {6, 401},
           {7, 712},
           {3, 60},
           {2, 3045},
           {26, 102},
           {25, 102}],
      extra_attrs =>
          [{1, 3916},
           {4, 1179},
           {5, 1655},
           {6, 601},
           {7, 1068},
           {3, 90}]};
get_lev_cfg({1014, 63}) ->
    #{base_attrs =>
          [{1, 2677},
           {4, 806},
           {5, 1132},
           {6, 411},
           {7, 730},
           {3, 62},
           {2, 3048},
           {26, 105},
           {25, 105}],
      extra_attrs =>
          [{1, 4016},
           {4, 1209},
           {5, 1698},
           {6, 616},
           {7, 1095},
           {3, 93}]};
get_lev_cfg({1014, 64}) ->
    #{base_attrs =>
          [{1, 2743},
           {4, 826},
           {5, 1160},
           {6, 421},
           {7, 748},
           {3, 63},
           {2, 3051},
           {26, 107},
           {25, 107}],
      extra_attrs =>
          [{1, 4115},
           {4, 1239},
           {5, 1740},
           {6, 632},
           {7, 1122},
           {3, 95}]};
get_lev_cfg({1014, 65}) ->
    #{base_attrs =>
          [{1, 2809},
           {4, 846},
           {5, 1187},
           {6, 431},
           {7, 766},
           {3, 65},
           {2, 3054},
           {26, 110},
           {25, 110}],
      extra_attrs =>
          [{1, 4213},
           {4, 1269},
           {5, 1781},
           {6, 647},
           {7, 1149},
           {3, 97}]};
get_lev_cfg({1014, 66}) ->
    #{base_attrs =>
          [{1, 2874},
           {4, 865},
           {5, 1215},
           {6, 441},
           {7, 784},
           {3, 66},
           {2, 3057},
           {26, 112},
           {25, 112}],
      extra_attrs =>
          [{1, 4311},
           {4, 1298},
           {5, 1822},
           {6, 662},
           {7, 1176},
           {3, 99}]};
get_lev_cfg({1014, 67}) ->
    #{base_attrs =>
          [{1, 2938},
           {4, 885},
           {5, 1242},
           {6, 451},
           {7, 801},
           {3, 68},
           {2, 3060},
           {26, 114},
           {25, 114}],
      extra_attrs =>
          [{1, 4407},
           {4, 1327},
           {5, 1863},
           {6, 676},
           {7, 1202},
           {3, 102}]};
get_lev_cfg({1014, 68}) ->
    #{base_attrs =>
          [{1, 3002},
           {4, 904},
           {5, 1269},
           {6, 461},
           {7, 819},
           {3, 69},
           {2, 3063},
           {26, 117},
           {25, 117}],
      extra_attrs =>
          [{1, 4503},
           {4, 1356},
           {5, 1903},
           {6, 691},
           {7, 1228},
           {3, 104}]};
get_lev_cfg({1014, 69}) ->
    #{base_attrs =>
          [{1, 3065},
           {4, 923},
           {5, 1296},
           {6, 470},
           {7, 836},
           {3, 71},
           {2, 3066},
           {26, 119},
           {25, 119}],
      extra_attrs =>
          [{1, 4598},
           {4, 1385},
           {5, 1944},
           {6, 706},
           {7, 1254},
           {3, 106}]};
get_lev_cfg({1014, 70}) ->
    #{base_attrs =>
          [{1, 3128},
           {4, 942},
           {5, 1322},
           {6, 480},
           {7, 853},
           {3, 72},
           {2, 3070},
           {26, 122},
           {25, 122}],
      extra_attrs =>
          [{1, 4692},
           {4, 1413},
           {5, 1983},
           {6, 720},
           {7, 1280},
           {3, 108}]};
get_lev_cfg({1014, 71}) ->
    #{base_attrs =>
          [{1, 3190},
           {4, 961},
           {5, 1348},
           {6, 490},
           {7, 870},
           {3, 73},
           {2, 3074},
           {26, 124},
           {25, 124}],
      extra_attrs =>
          [{1, 4785},
           {4, 1441},
           {5, 2023},
           {6, 735},
           {7, 1305},
           {3, 110}]};
get_lev_cfg({1014, 72}) ->
    #{base_attrs =>
          [{1, 3252},
           {4, 979},
           {5, 1374},
           {6, 499},
           {7, 887},
           {3, 75},
           {2, 3078},
           {26, 126},
           {25, 126}],
      extra_attrs =>
          [{1, 4878},
           {4, 1469},
           {5, 2062},
           {6, 749},
           {7, 1330},
           {3, 113}]};
get_lev_cfg({1014, 73}) ->
    #{base_attrs =>
          [{1, 3313},
           {4, 998},
           {5, 1400},
           {6, 508},
           {7, 904},
           {3, 76},
           {2, 3082},
           {26, 129},
           {25, 129}],
      extra_attrs =>
          [{1, 4970},
           {4, 1497},
           {5, 2101},
           {6, 763},
           {7, 1356},
           {3, 115}]};
get_lev_cfg({1014, 74}) ->
    #{base_attrs =>
          [{1, 3374},
           {4, 1016},
           {5, 1426},
           {6, 518},
           {7, 920},
           {3, 78},
           {2, 3086},
           {26, 131},
           {25, 131}],
      extra_attrs =>
          [{1, 5061},
           {4, 1524},
           {5, 2139},
           {6, 777},
           {7, 1380},
           {3, 117}]};
get_lev_cfg({1014, 75}) ->
    #{base_attrs =>
          [{1, 3433},
           {4, 1034},
           {5, 1451},
           {6, 527},
           {7, 936},
           {3, 79},
           {2, 3090},
           {26, 134},
           {25, 134}],
      extra_attrs =>
          [{1, 5150},
           {4, 1551},
           {5, 2177},
           {6, 791},
           {7, 1405},
           {3, 119}]};
get_lev_cfg({1014, 76}) ->
    #{base_attrs =>
          [{1, 3493},
           {4, 1052},
           {5, 1476},
           {6, 536},
           {7, 953},
           {3, 80},
           {2, 3094},
           {26, 136},
           {25, 136}],
      extra_attrs =>
          [{1, 5240},
           {4, 1578},
           {5, 2215},
           {6, 804},
           {7, 1429},
           {3, 121}]};
get_lev_cfg({1014, 77}) ->
    #{base_attrs =>
          [{1, 3552},
           {4, 1070},
           {5, 1501},
           {6, 545},
           {7, 969},
           {3, 82},
           {2, 3098},
           {26, 138},
           {25, 138}],
      extra_attrs =>
          [{1, 5328},
           {4, 1605},
           {5, 2252},
           {6, 818},
           {7, 1453},
           {3, 123}]};
get_lev_cfg({1014, 78}) ->
    #{base_attrs =>
          [{1, 3610},
           {4, 1087},
           {5, 1526},
           {6, 554},
           {7, 985},
           {3, 83},
           {2, 3102},
           {26, 141},
           {25, 141}],
      extra_attrs =>
          [{1, 5416},
           {4, 1631},
           {5, 2289},
           {6, 831},
           {7, 1477},
           {3, 125}]};
get_lev_cfg({1014, 79}) ->
    #{base_attrs =>
          [{1, 3668},
           {4, 1105},
           {5, 1551},
           {6, 563},
           {7, 1000},
           {3, 85},
           {2, 3106},
           {26, 143},
           {25, 143}],
      extra_attrs =>
          [{1, 5503},
           {4, 1657},
           {5, 2326},
           {6, 845},
           {7, 1501},
           {3, 127}]};
get_lev_cfg({1014, 80}) ->
    #{base_attrs =>
          [{1, 3726},
           {4, 1122},
           {5, 1575},
           {6, 572},
           {7, 1016},
           {3, 86},
           {2, 3110},
           {26, 146},
           {25, 146}],
      extra_attrs =>
          [{1, 5589},
           {4, 1683},
           {5, 2362},
           {6, 858},
           {7, 1524},
           {3, 129}]};
get_lev_cfg({1014, 81}) ->
    #{base_attrs =>
          [{1, 3783},
           {4, 1139},
           {5, 1599},
           {6, 581},
           {7, 1032},
           {3, 87},
           {2, 3114},
           {26, 148},
           {25, 148}],
      extra_attrs =>
          [{1, 5674},
           {4, 1709},
           {5, 2399},
           {6, 871},
           {7, 1548},
           {3, 131}]};
get_lev_cfg({1014, 82}) ->
    #{base_attrs =>
          [{1, 3839},
           {4, 1156},
           {5, 1623},
           {6, 589},
           {7, 1047},
           {3, 88},
           {2, 3118},
           {26, 150},
           {25, 150}],
      extra_attrs =>
          [{1, 5758},
           {4, 1734},
           {5, 2434},
           {6, 884},
           {7, 1571},
           {3, 133}]};
get_lev_cfg({1014, 83}) ->
    #{base_attrs =>
          [{1, 3894},
           {4, 1173},
           {5, 1646},
           {6, 598},
           {7, 1062},
           {3, 90},
           {2, 3122},
           {26, 153},
           {25, 153}],
      extra_attrs =>
          [{1, 5842},
           {4, 1759},
           {5, 2469},
           {6, 897},
           {7, 1594},
           {3, 135}]};
get_lev_cfg({1014, 84}) ->
    #{base_attrs =>
          [{1, 3950},
           {4, 1189},
           {5, 1670},
           {6, 606},
           {7, 1077},
           {3, 91},
           {2, 3126},
           {26, 155},
           {25, 155}],
      extra_attrs =>
          [{1, 5925},
           {4, 1784},
           {5, 2505},
           {6, 910},
           {7, 1616},
           {3, 137}]};
get_lev_cfg({1014, 85}) ->
    #{base_attrs =>
          [{1, 4004},
           {4, 1206},
           {5, 1693},
           {6, 615},
           {7, 1092},
           {3, 92},
           {2, 3130},
           {26, 158},
           {25, 158}],
      extra_attrs =>
          [{1, 6007},
           {4, 1809},
           {5, 2539},
           {6, 922},
           {7, 1638},
           {3, 139}]};
get_lev_cfg({1014, 86}) ->
    #{base_attrs =>
          [{1, 4059},
           {4, 1222},
           {5, 1716},
           {6, 623},
           {7, 1107},
           {3, 94},
           {2, 3134},
           {26, 160},
           {25, 160}],
      extra_attrs =>
          [{1, 6088},
           {4, 1833},
           {5, 2574},
           {6, 935},
           {7, 1661},
           {3, 141}]};
get_lev_cfg({1014, 87}) ->
    #{base_attrs =>
          [{1, 4112},
           {4, 1238},
           {5, 1738},
           {6, 631},
           {7, 1122},
           {3, 95},
           {2, 3138},
           {26, 162},
           {25, 162}],
      extra_attrs =>
          [{1, 6168},
           {4, 1858},
           {5, 2607},
           {6, 947},
           {7, 1683},
           {3, 142}]};
get_lev_cfg({1014, 88}) ->
    #{base_attrs =>
          [{1, 4165},
           {4, 1254},
           {5, 1761},
           {6, 639},
           {7, 1136},
           {3, 96},
           {2, 3142},
           {26, 165},
           {25, 165}],
      extra_attrs =>
          [{1, 6248},
           {4, 1882},
           {5, 2641},
           {6, 959},
           {7, 1704},
           {3, 144}]};
get_lev_cfg({1014, 89}) ->
    #{base_attrs =>
          [{1, 4218},
           {4, 1270},
           {5, 1783},
           {6, 647},
           {7, 1150},
           {3, 97},
           {2, 3146},
           {26, 167},
           {25, 167}],
      extra_attrs =>
          [{1, 6327},
           {4, 1905},
           {5, 2674},
           {6, 971},
           {7, 1726},
           {3, 146}]};
get_lev_cfg({1014, 90}) ->
    #{base_attrs =>
          [{1, 4270},
           {4, 1286},
           {5, 1805},
           {6, 655},
           {7, 1165},
           {3, 98},
           {2, 3151},
           {26, 170},
           {25, 170}],
      extra_attrs =>
          [{1, 6405},
           {4, 1929},
           {5, 2707},
           {6, 983},
           {7, 1747},
           {3, 148}]};
get_lev_cfg({1014, 91}) ->
    #{base_attrs =>
          [{1, 4321},
           {4, 1301},
           {5, 1826},
           {6, 663},
           {7, 1179},
           {3, 100},
           {2, 3156},
           {26, 172},
           {25, 172}],
      extra_attrs =>
          [{1, 6482},
           {4, 1952},
           {5, 2740},
           {6, 995},
           {7, 1768},
           {3, 150}]};
get_lev_cfg({1014, 92}) ->
    #{base_attrs =>
          [{1, 4372},
           {4, 1317},
           {5, 1848},
           {6, 671},
           {7, 1192},
           {3, 101},
           {2, 3161},
           {26, 174},
           {25, 174}],
      extra_attrs =>
          [{1, 6558},
           {4, 1975},
           {5, 2772},
           {6, 1007},
           {7, 1789},
           {3, 151}]};
get_lev_cfg({1014, 93}) ->
    #{base_attrs =>
          [{1, 4422},
           {4, 1332},
           {5, 1869},
           {6, 679},
           {7, 1206},
           {3, 102},
           {2, 3166},
           {26, 177},
           {25, 177}],
      extra_attrs =>
          [{1, 6634},
           {4, 1998},
           {5, 2804},
           {6, 1018},
           {7, 1810},
           {3, 153}]};
get_lev_cfg({1014, 94}) ->
    #{base_attrs =>
          [{1, 4472},
           {4, 1347},
           {5, 1890},
           {6, 686},
           {7, 1220},
           {3, 103},
           {2, 3171},
           {26, 179},
           {25, 179}],
      extra_attrs =>
          [{1, 6708},
           {4, 2020},
           {5, 2836},
           {6, 1030},
           {7, 1830},
           {3, 155}]};
get_lev_cfg({1014, 95}) ->
    #{base_attrs =>
          [{1, 4521},
           {4, 1362},
           {5, 1911},
           {6, 694},
           {7, 1233},
           {3, 104},
           {2, 3176},
           {26, 182},
           {25, 182}],
      extra_attrs =>
          [{1, 6782},
           {4, 2043},
           {5, 2867},
           {6, 1041},
           {7, 1850},
           {3, 157}]};
get_lev_cfg({1014, 96}) ->
    #{base_attrs =>
          [{1, 4570},
           {4, 1376},
           {5, 1932},
           {6, 701},
           {7, 1247},
           {3, 105},
           {2, 3181},
           {26, 184},
           {25, 184}],
      extra_attrs =>
          [{1, 6855},
           {4, 2065},
           {5, 2898},
           {6, 1052},
           {7, 1870},
           {3, 158}]};
get_lev_cfg({1014, 97}) ->
    #{base_attrs =>
          [{1, 4618},
           {4, 1391},
           {5, 1952},
           {6, 709},
           {7, 1260},
           {3, 107},
           {2, 3186},
           {26, 186},
           {25, 186}],
      extra_attrs =>
          [{1, 6927},
           {4, 2086},
           {5, 2928},
           {6, 1064},
           {7, 1890},
           {3, 160}]};
get_lev_cfg({1014, 98}) ->
    #{base_attrs =>
          [{1, 4666},
           {4, 1405},
           {5, 1972},
           {6, 716},
           {7, 1273},
           {3, 108},
           {2, 3191},
           {26, 189},
           {25, 189}],
      extra_attrs =>
          [{1, 6999},
           {4, 2108},
           {5, 2959},
           {6, 1074},
           {7, 1909},
           {3, 162}]};
get_lev_cfg({1014, 99}) ->
    #{base_attrs =>
          [{1, 4713},
           {4, 1419},
           {5, 1992},
           {6, 723},
           {7, 1286},
           {3, 109},
           {2, 3196},
           {26, 191},
           {25, 191}],
      extra_attrs =>
          [{1, 7070},
           {4, 2129},
           {5, 2989},
           {6, 1085},
           {7, 1929},
           {3, 163}]};
get_lev_cfg({1014, 100}) ->
    #{base_attrs =>
          [{1, 4759},
           {4, 1433},
           {5, 2012},
           {6, 731},
           {7, 1298},
           {3, 110},
           {2, 3201},
           {26, 194},
           {25, 194}],
      extra_attrs =>
          [{1, 7139},
           {4, 2150},
           {5, 3018},
           {6, 1096},
           {7, 1948},
           {3, 165}]};
get_lev_cfg({1014, 101}) ->
    #{base_attrs =>
          [{1, 4805},
           {4, 1447},
           {5, 2031},
           {6, 738},
           {7, 1311},
           {3, 111},
           {2, 3201},
           {26, 197},
           {25, 197}],
      extra_attrs =>
          [{1, 7208},
           {4, 2171},
           {5, 3047},
           {6, 1107},
           {7, 1966},
           {3, 167}]};
get_lev_cfg({1014, 102}) ->
    #{base_attrs =>
          [{1, 4851},
           {4, 1461},
           {5, 2050},
           {6, 745},
           {7, 1323},
           {3, 112},
           {2, 3201},
           {26, 200},
           {25, 200}],
      extra_attrs =>
          [{1, 7277},
           {4, 2191},
           {5, 3076},
           {6, 1117},
           {7, 1985},
           {3, 168}]};
get_lev_cfg({1014, 103}) ->
    #{base_attrs =>
          [{1, 4896},
           {4, 1474},
           {5, 2069},
           {6, 751},
           {7, 1335},
           {3, 113},
           {2, 3201},
           {26, 203},
           {25, 203}],
      extra_attrs =>
          [{1, 7344},
           {4, 2212},
           {5, 3104},
           {6, 1127},
           {7, 2003},
           {3, 170}]};
get_lev_cfg({1014, 104}) ->
    #{base_attrs =>
          [{1, 4940},
           {4, 1488},
           {5, 2088},
           {6, 758},
           {7, 1348},
           {3, 114},
           {2, 3201},
           {26, 206},
           {25, 206}],
      extra_attrs =>
          [{1, 7411},
           {4, 2232},
           {5, 3133},
           {6, 1138},
           {7, 2022},
           {3, 171}]};
get_lev_cfg({1014, 105}) ->
    #{base_attrs =>
          [{1, 4984},
           {4, 1501},
           {5, 2107},
           {6, 765},
           {7, 1359},
           {3, 115},
           {2, 3201},
           {26, 206},
           {25, 206}],
      extra_attrs =>
          [{1, 7476},
           {4, 2252},
           {5, 3160},
           {6, 1148},
           {7, 2039},
           {3, 173}]};
get_lev_cfg({1014, 106}) ->
    #{base_attrs =>
          [{1, 5027},
           {4, 1514},
           {5, 2125},
           {6, 772},
           {7, 1371},
           {3, 116},
           {2, 3201},
           {26, 212},
           {25, 212}],
      extra_attrs =>
          [{1, 7541},
           {4, 2271},
           {5, 3188},
           {6, 1158},
           {7, 2057},
           {3, 174}]};
get_lev_cfg({1014, 107}) ->
    #{base_attrs =>
          [{1, 5070},
           {4, 1527},
           {5, 2143},
           {6, 778},
           {7, 1383},
           {3, 117},
           {2, 3201},
           {26, 215},
           {25, 215}],
      extra_attrs =>
          [{1, 7606},
           {4, 2291},
           {5, 3215},
           {6, 1168},
           {7, 2075},
           {3, 176}]};
get_lev_cfg({1014, 108}) ->
    #{base_attrs =>
          [{1, 5112},
           {4, 1540},
           {5, 2161},
           {6, 785},
           {7, 1395},
           {3, 118},
           {2, 3201},
           {26, 218},
           {25, 218}],
      extra_attrs =>
          [{1, 7669},
           {4, 2310},
           {5, 3242},
           {6, 1177},
           {7, 2092},
           {3, 177}]};
get_lev_cfg({1014, 109}) ->
    #{base_attrs =>
          [{1, 5154},
           {4, 1552},
           {5, 2179},
           {6, 791},
           {7, 1406},
           {3, 119},
           {2, 3201},
           {26, 221},
           {25, 221}],
      extra_attrs =>
          [{1, 7731},
           {4, 2328},
           {5, 3268},
           {6, 1187},
           {7, 2109},
           {3, 179}]};
get_lev_cfg({1014, 110}) ->
    #{base_attrs =>
          [{1, 5195},
           {4, 1565},
           {5, 2196},
           {6, 797},
           {7, 1417},
           {3, 120},
           {2, 3201},
           {26, 224},
           {25, 224}],
      extra_attrs =>
          [{1, 7793},
           {4, 2347},
           {5, 3294},
           {6, 1196},
           {7, 2126},
           {3, 180}]};
get_lev_cfg({1014, 111}) ->
    #{base_attrs =>
          [{1, 5236},
           {4, 1577},
           {5, 2213},
           {6, 804},
           {7, 1428},
           {3, 121},
           {2, 3201},
           {26, 227},
           {25, 227}],
      extra_attrs =>
          [{1, 7854},
           {4, 2365},
           {5, 3320},
           {6, 1206},
           {7, 2143},
           {3, 182}]};
get_lev_cfg({1014, 112}) ->
    #{base_attrs =>
          [{1, 5276},
           {4, 1589},
           {5, 2230},
           {6, 810},
           {7, 1439},
           {3, 122},
           {2, 3201},
           {26, 230},
           {25, 230}],
      extra_attrs =>
          [{1, 7914},
           {4, 2384},
           {5, 3346},
           {6, 1215},
           {7, 2159},
           {3, 183}]};
get_lev_cfg({1014, 113}) ->
    #{base_attrs =>
          [{1, 5316},
           {4, 1601},
           {5, 2247},
           {6, 816},
           {7, 1450},
           {3, 123},
           {2, 3201},
           {26, 233},
           {25, 233}],
      extra_attrs =>
          [{1, 7974},
           {4, 2401},
           {5, 3371},
           {6, 1224},
           {7, 2175},
           {3, 184}]};
get_lev_cfg({1014, 114}) ->
    #{base_attrs =>
          [{1, 5354},
           {4, 1613},
           {5, 2263},
           {6, 822},
           {7, 1461},
           {3, 124},
           {2, 3201},
           {26, 236},
           {25, 236}],
      extra_attrs =>
          [{1, 8032},
           {4, 2419},
           {5, 3395},
           {6, 1233},
           {7, 2191},
           {3, 186}]};
get_lev_cfg({1014, 115}) ->
    #{base_attrs =>
          [{1, 5393},
           {4, 1624},
           {5, 2280},
           {6, 828},
           {7, 1471},
           {3, 124},
           {2, 3201},
           {26, 239},
           {25, 239}],
      extra_attrs =>
          [{1, 8090},
           {4, 2436},
           {5, 3420},
           {6, 1242},
           {7, 2207},
           {3, 187}]};
get_lev_cfg({1014, 116}) ->
    #{base_attrs =>
          [{1, 5431},
           {4, 1636},
           {5, 2296},
           {6, 834},
           {7, 1481},
           {3, 125},
           {2, 3201},
           {26, 242},
           {25, 242}],
      extra_attrs =>
          [{1, 8147},
           {4, 2454},
           {5, 3444},
           {6, 1251},
           {7, 2222},
           {3, 188}]};
get_lev_cfg({1014, 117}) ->
    #{base_attrs =>
          [{1, 5468},
           {4, 1647},
           {5, 2312},
           {6, 839},
           {7, 1492},
           {3, 126},
           {2, 3201},
           {26, 245},
           {25, 245}],
      extra_attrs =>
          [{1, 8203},
           {4, 2470},
           {5, 3468},
           {6, 1259},
           {7, 2238},
           {3, 190}]};
get_lev_cfg({1014, 118}) ->
    #{base_attrs =>
          [{1, 5505},
           {4, 1658},
           {5, 2327},
           {6, 845},
           {7, 1502},
           {3, 127},
           {2, 3201},
           {26, 248},
           {25, 248}],
      extra_attrs =>
          [{1, 8258},
           {4, 2487},
           {5, 3491},
           {6, 1268},
           {7, 2253},
           {3, 191}]};
get_lev_cfg({1014, 119}) ->
    #{base_attrs =>
          [{1, 5541},
           {4, 1669},
           {5, 2342},
           {6, 851},
           {7, 1512},
           {3, 128},
           {2, 3201},
           {26, 251},
           {25, 251}],
      extra_attrs =>
          [{1, 8312},
           {4, 2503},
           {5, 3514},
           {6, 1276},
           {7, 2268},
           {3, 192}]};
get_lev_cfg({1014, 120}) ->
    #{base_attrs =>
          [{1, 5577},
           {4, 1680},
           {5, 2358},
           {6, 856},
           {7, 1521},
           {3, 129},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8366},
           {4, 2520},
           {5, 3537},
           {6, 1284},
           {7, 2282},
           {3, 193}]};
get_lev_cfg({1014, 121}) ->
    #{base_attrs =>
          [{1, 5613},
           {4, 1690},
           {5, 2372},
           {6, 862},
           {7, 1531},
           {3, 130},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8419},
           {4, 2536},
           {5, 3559},
           {6, 1293},
           {7, 2297},
           {3, 195}]};
get_lev_cfg({1014, 122}) ->
    #{base_attrs =>
          [{1, 5647},
           {4, 1701},
           {5, 2387},
           {6, 867},
           {7, 1540},
           {3, 130},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8471},
           {4, 2551},
           {5, 3581},
           {6, 1301},
           {7, 2311},
           {3, 196}]};
get_lev_cfg({1014, 123}) ->
    #{base_attrs =>
          [{1, 5681},
           {4, 1711},
           {5, 2402},
           {6, 872},
           {7, 1550},
           {3, 131},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8522},
           {4, 2567},
           {5, 3603},
           {6, 1308},
           {7, 2325},
           {3, 197}]};
get_lev_cfg({1014, 124}) ->
    #{base_attrs =>
          [{1, 5715},
           {4, 1721},
           {5, 2416},
           {6, 877},
           {7, 1559},
           {3, 132},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8573},
           {4, 2582},
           {5, 3624},
           {6, 1316},
           {7, 2339},
           {3, 198}]};
get_lev_cfg({1014, 125}) ->
    #{base_attrs =>
          [{1, 5748},
           {4, 1731},
           {5, 2430},
           {6, 882},
           {7, 1568},
           {3, 133},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8622},
           {4, 2597},
           {5, 3645},
           {6, 1324},
           {7, 2352},
           {3, 199}]};
get_lev_cfg({1014, 126}) ->
    #{base_attrs =>
          [{1, 5780},
           {4, 1741},
           {5, 2443},
           {6, 887},
           {7, 1577},
           {3, 133},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8671},
           {4, 2611},
           {5, 3665},
           {6, 1331},
           {7, 2365},
           {3, 200}]};
get_lev_cfg({1014, 127}) ->
    #{base_attrs =>
          [{1, 5813},
           {4, 1750},
           {5, 2457},
           {6, 892},
           {7, 1586},
           {3, 134},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8719},
           {4, 2626},
           {5, 3686},
           {6, 1339},
           {7, 2379},
           {3, 202}]};
get_lev_cfg({1014, 128}) ->
    #{base_attrs =>
          [{1, 5844},
           {4, 1760},
           {5, 2470},
           {6, 897},
           {7, 1594},
           {3, 135},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8766},
           {4, 2640},
           {5, 3706},
           {6, 1346},
           {7, 2391},
           {3, 203}]};
get_lev_cfg({1014, 129}) ->
    #{base_attrs =>
          [{1, 5875},
           {4, 1769},
           {5, 2483},
           {6, 902},
           {7, 1603},
           {3, 136},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8812},
           {4, 2654},
           {5, 3725},
           {6, 1353},
           {7, 2404},
           {3, 204}]};
get_lev_cfg({1014, 130}) ->
    #{base_attrs =>
          [{1, 5905},
           {4, 1778},
           {5, 2496},
           {6, 907},
           {7, 1611},
           {3, 136},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8858},
           {4, 2668},
           {5, 3745},
           {6, 1360},
           {7, 2416},
           {3, 205}]};
get_lev_cfg({1018, 1}) ->
    #{base_attrs =>
          [{1, 168},
           {4, 31},
           {5, 24},
           {6, 24},
           {7, 14},
           {3, 7},
           {2, 200},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 253},
           {4, 47},
           {5, 37},
           {6, 36},
           {7, 21},
           {3, 11}]};
get_lev_cfg({1018, 2}) ->
    #{base_attrs =>
          [{1, 202},
           {4, 38},
           {5, 29},
           {6, 29},
           {7, 17},
           {3, 9},
           {2, 576},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 304},
           {4, 57},
           {5, 44},
           {6, 43},
           {7, 25},
           {3, 13}]};
get_lev_cfg({1018, 3}) ->
    #{base_attrs =>
          [{1, 236},
           {4, 44},
           {5, 34},
           {6, 34},
           {7, 20},
           {3, 10},
           {2, 672},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 354},
           {4, 66},
           {5, 52},
           {6, 51},
           {7, 30},
           {3, 16}]};
get_lev_cfg({1018, 4}) ->
    #{base_attrs =>
          [{1, 270},
           {4, 50},
           {5, 39},
           {6, 38},
           {7, 23},
           {3, 12},
           {2, 767},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 405},
           {4, 76},
           {5, 59},
           {6, 58},
           {7, 34},
           {3, 18}]};
get_lev_cfg({1018, 5}) ->
    #{base_attrs =>
          [{1, 304},
           {4, 57},
           {5, 44},
           {6, 43},
           {7, 25},
           {3, 13},
           {2, 864},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 456},
           {4, 85},
           {5, 66},
           {6, 65},
           {7, 38},
           {3, 20}]};
get_lev_cfg({1018, 6}) ->
    #{base_attrs =>
          [{1, 337},
           {4, 63},
           {5, 49},
           {6, 48},
           {7, 28},
           {3, 15},
           {2, 960},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 506},
           {4, 95},
           {5, 74},
           {6, 72},
           {7, 43},
           {3, 23}]};
get_lev_cfg({1018, 7}) ->
    #{base_attrs =>
          [{1, 371},
           {4, 69},
           {5, 54},
           {6, 53},
           {7, 31},
           {3, 16},
           {2, 1055},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 557},
           {4, 104},
           {5, 81},
           {6, 80},
           {7, 47},
           {3, 25}]};
get_lev_cfg({1018, 8}) ->
    #{base_attrs =>
          [{1, 405},
           {4, 76},
           {5, 59},
           {6, 58},
           {7, 34},
           {3, 18},
           {2, 1152},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 608},
           {4, 114},
           {5, 89},
           {6, 87},
           {7, 51},
           {3, 27}]};
get_lev_cfg({1018, 9}) ->
    #{base_attrs =>
          [{1, 439},
           {4, 82},
           {5, 64},
           {6, 63},
           {7, 37},
           {3, 19},
           {2, 1248},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 658},
           {4, 124},
           {5, 96},
           {6, 94},
           {7, 56},
           {3, 29}]};
get_lev_cfg({1018, 10}) ->
    #{base_attrs =>
          [{1, 506},
           {4, 95},
           {5, 74},
           {6, 72},
           {7, 43},
           {3, 23},
           {2, 1440},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 760},
           {4, 143},
           {5, 111},
           {6, 109},
           {7, 64},
           {3, 34}]};
get_lev_cfg({1018, 11}) ->
    #{base_attrs =>
          [{1, 574},
           {4, 108},
           {5, 84},
           {6, 82},
           {7, 48},
           {3, 26},
           {2, 1631},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 861},
           {4, 162},
           {5, 126},
           {6, 124},
           {7, 73},
           {3, 39}]};
get_lev_cfg({1018, 12}) ->
    #{base_attrs =>
          [{1, 641},
           {4, 120},
           {5, 94},
           {6, 92},
           {7, 54},
           {3, 29},
           {2, 1824},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 962},
           {4, 181},
           {5, 141},
           {6, 138},
           {7, 82},
           {3, 43}]};
get_lev_cfg({1018, 13}) ->
    #{base_attrs =>
          [{1, 709},
           {4, 133},
           {5, 104},
           {6, 102},
           {7, 60},
           {3, 32},
           {2, 2016},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1064},
           {4, 200},
           {5, 156},
           {6, 153},
           {7, 90},
           {3, 48}]};
get_lev_cfg({1018, 14}) ->
    #{base_attrs =>
          [{1, 777},
           {4, 146},
           {5, 114},
           {6, 111},
           {7, 66},
           {3, 35},
           {2, 2207},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1165},
           {4, 219},
           {5, 171},
           {6, 167},
           {7, 99},
           {3, 53}]};
get_lev_cfg({1018, 15}) ->
    #{base_attrs =>
          [{1, 844},
           {4, 159},
           {5, 123},
           {6, 121},
           {7, 72},
           {3, 38},
           {2, 2400},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1267},
           {4, 238},
           {5, 185},
           {6, 182},
           {7, 108},
           {3, 57}]};
get_lev_cfg({1018, 16}) ->
    #{base_attrs =>
          [{1, 912},
           {4, 171},
           {5, 133},
           {6, 131},
           {7, 77},
           {3, 41},
           {2, 2408},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1368},
           {4, 257},
           {5, 200},
           {6, 197},
           {7, 116},
           {3, 62}]};
get_lev_cfg({1018, 17}) ->
    #{base_attrs =>
          [{1, 979},
           {4, 184},
           {5, 143},
           {6, 141},
           {7, 83},
           {3, 44},
           {2, 2417},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1469},
           {4, 276},
           {5, 215},
           {6, 211},
           {7, 125},
           {3, 66}]};
get_lev_cfg({1018, 18}) ->
    #{base_attrs =>
          [{1, 1047},
           {4, 197},
           {5, 153},
           {6, 150},
           {7, 89},
           {3, 47},
           {2, 2426},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1571},
           {4, 295},
           {5, 230},
           {6, 226},
           {7, 133},
           {3, 71}]};
get_lev_cfg({1018, 19}) ->
    #{base_attrs =>
          [{1, 1114},
           {4, 209},
           {5, 163},
           {6, 160},
           {7, 95},
           {3, 50},
           {2, 2436},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1672},
           {4, 314},
           {5, 245},
           {6, 240},
           {7, 142},
           {3, 76}]};
get_lev_cfg({1018, 20}) ->
    #{base_attrs =>
          [{1, 1182},
           {4, 222},
           {5, 173},
           {6, 170},
           {7, 100},
           {3, 53},
           {2, 2446},
           {26, 2},
           {25, 2}],
      extra_attrs =>
          [{1, 1773},
           {4, 333},
           {5, 260},
           {6, 255},
           {7, 151},
           {3, 80}]};
get_lev_cfg({1018, 21}) ->
    #{base_attrs =>
          [{1, 1250},
           {4, 235},
           {5, 183},
           {6, 179},
           {7, 106},
           {3, 56},
           {2, 2457},
           {26, 4},
           {25, 4}],
      extra_attrs =>
          [{1, 1875},
           {4, 353},
           {5, 275},
           {6, 269},
           {7, 159},
           {3, 85}]};
get_lev_cfg({1018, 22}) ->
    #{base_attrs =>
          [{1, 1317},
           {4, 248},
           {5, 193},
           {6, 189},
           {7, 112},
           {3, 59},
           {2, 2468},
           {26, 6},
           {25, 6}],
      extra_attrs =>
          [{1, 1976},
           {4, 372},
           {5, 290},
           {6, 284},
           {7, 168},
           {3, 89}]};
get_lev_cfg({1018, 23}) ->
    #{base_attrs =>
          [{1, 1385},
           {4, 260},
           {5, 203},
           {6, 199},
           {7, 118},
           {3, 63},
           {2, 2480},
           {26, 9},
           {25, 9}],
      extra_attrs =>
          [{1, 2077},
           {4, 391},
           {5, 305},
           {6, 299},
           {7, 177},
           {3, 94}]};
get_lev_cfg({1018, 24}) ->
    #{base_attrs =>
          [{1, 1452},
           {4, 273},
           {5, 213},
           {6, 209},
           {7, 123},
           {3, 66},
           {2, 2492},
           {26, 11},
           {25, 11}],
      extra_attrs =>
          [{1, 2179},
           {4, 410},
           {5, 319},
           {6, 313},
           {7, 185},
           {3, 99}]};
get_lev_cfg({1018, 25}) ->
    #{base_attrs =>
          [{1, 1520},
           {4, 286},
           {5, 223},
           {6, 218},
           {7, 129},
           {3, 69},
           {2, 2505},
           {26, 14},
           {25, 14}],
      extra_attrs =>
          [{1, 2280},
           {4, 429},
           {5, 334},
           {6, 328},
           {7, 194},
           {3, 103}]};
get_lev_cfg({1018, 26}) ->
    #{base_attrs =>
          [{1, 1587},
           {4, 298},
           {5, 233},
           {6, 228},
           {7, 135},
           {3, 72},
           {2, 2518},
           {26, 16},
           {25, 16}],
      extra_attrs =>
          [{1, 2381},
           {4, 448},
           {5, 349},
           {6, 342},
           {7, 203},
           {3, 108}]};
get_lev_cfg({1018, 27}) ->
    #{base_attrs =>
          [{1, 1655},
           {4, 311},
           {5, 243},
           {6, 238},
           {7, 141},
           {3, 75},
           {2, 2532},
           {26, 18},
           {25, 18}],
      extra_attrs =>
          [{1, 2483},
           {4, 467},
           {5, 364},
           {6, 357},
           {7, 211},
           {3, 113}]};
get_lev_cfg({1018, 28}) ->
    #{base_attrs =>
          [{1, 1723},
           {4, 324},
           {5, 252},
           {6, 248},
           {7, 146},
           {3, 78},
           {2, 2546},
           {26, 21},
           {25, 21}],
      extra_attrs =>
          [{1, 2584},
           {4, 486},
           {5, 379},
           {6, 372},
           {7, 220},
           {3, 117}]};
get_lev_cfg({1018, 29}) ->
    #{base_attrs =>
          [{1, 1790},
           {4, 337},
           {5, 262},
           {6, 257},
           {7, 152},
           {3, 81},
           {2, 2561},
           {26, 23},
           {25, 23}],
      extra_attrs =>
          [{1, 2686},
           {4, 505},
           {5, 394},
           {6, 386},
           {7, 229},
           {3, 122}]};
get_lev_cfg({1018, 30}) ->
    #{base_attrs =>
          [{1, 1858},
           {4, 349},
           {5, 272},
           {6, 267},
           {7, 158},
           {3, 84},
           {2, 2576},
           {26, 26},
           {25, 26}],
      extra_attrs =>
          [{1, 2787},
           {4, 524},
           {5, 409},
           {6, 401},
           {7, 237},
           {3, 126}]};
get_lev_cfg({1018, 31}) ->
    #{base_attrs =>
          [{1, 1925},
           {4, 362},
           {5, 282},
           {6, 277},
           {7, 164},
           {3, 87},
           {2, 2592},
           {26, 28},
           {25, 28}],
      extra_attrs =>
          [{1, 2888},
           {4, 543},
           {5, 424},
           {6, 415},
           {7, 246},
           {3, 131}]};
get_lev_cfg({1018, 32}) ->
    #{base_attrs =>
          [{1, 1993},
           {4, 375},
           {5, 292},
           {6, 287},
           {7, 169},
           {3, 90},
           {2, 2608},
           {26, 30},
           {25, 30}],
      extra_attrs =>
          [{1, 2990},
           {4, 562},
           {5, 438},
           {6, 430},
           {7, 254},
           {3, 136}]};
get_lev_cfg({1018, 33}) ->
    #{base_attrs =>
          [{1, 2060},
           {4, 388},
           {5, 302},
           {6, 296},
           {7, 175},
           {3, 93},
           {2, 2625},
           {26, 33},
           {25, 33}],
      extra_attrs =>
          [{1, 3091},
           {4, 582},
           {5, 453},
           {6, 445},
           {7, 263},
           {3, 140}]};
get_lev_cfg({1018, 34}) ->
    #{base_attrs =>
          [{1, 2128},
           {4, 400},
           {5, 312},
           {6, 306},
           {7, 181},
           {3, 96},
           {2, 2642},
           {26, 35},
           {25, 35}],
      extra_attrs =>
          [{1, 3192},
           {4, 601},
           {5, 468},
           {6, 459},
           {7, 272},
           {3, 145}]};
get_lev_cfg({1018, 35}) ->
    #{base_attrs =>
          [{1, 2196},
           {4, 413},
           {5, 322},
           {6, 316},
           {7, 187},
           {3, 99},
           {2, 2660},
           {26, 38},
           {25, 38}],
      extra_attrs =>
          [{1, 3294},
           {4, 620},
           {5, 483},
           {6, 474},
           {7, 280},
           {3, 149}]};
get_lev_cfg({1018, 36}) ->
    #{base_attrs =>
          [{1, 2263},
           {4, 426},
           {5, 332},
           {6, 325},
           {7, 193},
           {3, 103},
           {2, 2678},
           {26, 40},
           {25, 40}],
      extra_attrs =>
          [{1, 3395},
           {4, 639},
           {5, 498},
           {6, 488},
           {7, 289},
           {3, 154}]};
get_lev_cfg({1018, 37}) ->
    #{base_attrs =>
          [{1, 2331},
           {4, 438},
           {5, 342},
           {6, 335},
           {7, 198},
           {3, 106},
           {2, 2697},
           {26, 42},
           {25, 42}],
      extra_attrs =>
          [{1, 3496},
           {4, 658},
           {5, 513},
           {6, 503},
           {7, 298},
           {3, 159}]};
get_lev_cfg({1018, 38}) ->
    #{base_attrs =>
          [{1, 2398},
           {4, 451},
           {5, 352},
           {6, 345},
           {7, 204},
           {3, 109},
           {2, 2716},
           {26, 45},
           {25, 45}],
      extra_attrs =>
          [{1, 3598},
           {4, 677},
           {5, 528},
           {6, 518},
           {7, 306},
           {3, 163}]};
get_lev_cfg({1018, 39}) ->
    #{base_attrs =>
          [{1, 2466},
           {4, 464},
           {5, 362},
           {6, 355},
           {7, 210},
           {3, 112},
           {2, 2736},
           {26, 47},
           {25, 47}],
      extra_attrs =>
          [{1, 3699},
           {4, 696},
           {5, 543},
           {6, 532},
           {7, 315},
           {3, 168}]};
get_lev_cfg({1018, 40}) ->
    #{base_attrs =>
          [{1, 2534},
           {4, 477},
           {5, 371},
           {6, 364},
           {7, 216},
           {3, 115},
           {2, 2756},
           {26, 50},
           {25, 50}],
      extra_attrs =>
          [{1, 3801},
           {4, 715},
           {5, 557},
           {6, 547},
           {7, 324},
           {3, 173}]};
get_lev_cfg({1018, 41}) ->
    #{base_attrs =>
          [{1, 2601},
           {4, 489},
           {5, 381},
           {6, 374},
           {7, 221},
           {3, 118},
           {2, 2777},
           {26, 52},
           {25, 52}],
      extra_attrs =>
          [{1, 3902},
           {4, 734},
           {5, 572},
           {6, 561},
           {7, 332},
           {3, 177}]};
get_lev_cfg({1018, 42}) ->
    #{base_attrs =>
          [{1, 2669},
           {4, 502},
           {5, 391},
           {6, 384},
           {7, 227},
           {3, 121},
           {2, 2798},
           {26, 54},
           {25, 54}],
      extra_attrs =>
          [{1, 4003},
           {4, 753},
           {5, 587},
           {6, 576},
           {7, 341},
           {3, 182}]};
get_lev_cfg({1018, 43}) ->
    #{base_attrs =>
          [{1, 2736},
           {4, 515},
           {5, 401},
           {6, 394},
           {7, 233},
           {3, 124},
           {2, 2820},
           {26, 57},
           {25, 57}],
      extra_attrs =>
          [{1, 4105},
           {4, 772},
           {5, 602},
           {6, 591},
           {7, 350},
           {3, 186}]};
get_lev_cfg({1018, 44}) ->
    #{base_attrs =>
          [{1, 2804},
           {4, 527},
           {5, 411},
           {6, 403},
           {7, 239},
           {3, 127},
           {2, 2842},
           {26, 59},
           {25, 59}],
      extra_attrs =>
          [{1, 4206},
           {4, 791},
           {5, 617},
           {6, 605},
           {7, 358},
           {3, 191}]};
get_lev_cfg({1018, 45}) ->
    #{base_attrs =>
          [{1, 2871},
           {4, 540},
           {5, 421},
           {6, 413},
           {7, 244},
           {3, 130},
           {2, 2865},
           {26, 62},
           {25, 62}],
      extra_attrs =>
          [{1, 4307},
           {4, 810},
           {5, 632},
           {6, 620},
           {7, 367},
           {3, 196}]};
get_lev_cfg({1018, 46}) ->
    #{base_attrs =>
          [{1, 2939},
           {4, 553},
           {5, 431},
           {6, 423},
           {7, 250},
           {3, 133},
           {2, 2888},
           {26, 64},
           {25, 64}],
      extra_attrs =>
          [{1, 4409},
           {4, 830},
           {5, 647},
           {6, 634},
           {7, 375},
           {3, 200}]};
get_lev_cfg({1018, 47}) ->
    #{base_attrs =>
          [{1, 3007},
           {4, 566},
           {5, 441},
           {6, 432},
           {7, 256},
           {3, 136},
           {2, 2912},
           {26, 66},
           {25, 66}],
      extra_attrs =>
          [{1, 4510},
           {4, 849},
           {5, 662},
           {6, 649},
           {7, 384},
           {3, 205}]};
get_lev_cfg({1018, 48}) ->
    #{base_attrs =>
          [{1, 3074},
           {4, 578},
           {5, 451},
           {6, 442},
           {7, 262},
           {3, 139},
           {2, 2936},
           {26, 69},
           {25, 69}],
      extra_attrs =>
          [{1, 4611},
           {4, 868},
           {5, 676},
           {6, 664},
           {7, 393},
           {3, 209}]};
get_lev_cfg({1018, 49}) ->
    #{base_attrs =>
          [{1, 3142},
           {4, 591},
           {5, 461},
           {6, 452},
           {7, 267},
           {3, 143},
           {2, 2961},
           {26, 71},
           {25, 71}],
      extra_attrs =>
          [{1, 4713},
           {4, 887},
           {5, 691},
           {6, 678},
           {7, 401},
           {3, 214}]};
get_lev_cfg({1018, 50}) ->
    #{base_attrs =>
          [{1, 3209},
           {4, 604},
           {5, 471},
           {6, 462},
           {7, 273},
           {3, 146},
           {2, 2986},
           {26, 74},
           {25, 74}],
      extra_attrs =>
          [{1, 4814},
           {4, 906},
           {5, 706},
           {6, 693},
           {7, 410},
           {3, 219}]};
get_lev_cfg({1018, 51}) ->
    #{base_attrs =>
          [{1, 3277},
           {4, 616},
           {5, 481},
           {6, 471},
           {7, 279},
           {3, 149},
           {2, 3012},
           {26, 76},
           {25, 76}],
      extra_attrs =>
          [{1, 4915},
           {4, 925},
           {5, 721},
           {6, 707},
           {7, 419},
           {3, 223}]};
get_lev_cfg({1018, 52}) ->
    #{base_attrs =>
          [{1, 3344},
           {4, 629},
           {5, 491},
           {6, 481},
           {7, 285},
           {3, 152},
           {2, 3015},
           {26, 78},
           {25, 78}],
      extra_attrs =>
          [{1, 5017},
           {4, 944},
           {5, 736},
           {6, 722},
           {7, 427},
           {3, 228}]};
get_lev_cfg({1018, 53}) ->
    #{base_attrs =>
          [{1, 3412},
           {4, 642},
           {5, 500},
           {6, 491},
           {7, 290},
           {3, 155},
           {2, 3018},
           {26, 81},
           {25, 81}],
      extra_attrs =>
          [{1, 5118},
           {4, 963},
           {5, 751},
           {6, 737},
           {7, 436},
           {3, 233}]};
get_lev_cfg({1018, 54}) ->
    #{base_attrs =>
          [{1, 3480},
           {4, 655},
           {5, 510},
           {6, 501},
           {7, 296},
           {3, 158},
           {2, 3021},
           {26, 83},
           {25, 83}],
      extra_attrs =>
          [{1, 5220},
           {4, 982},
           {5, 766},
           {6, 751},
           {7, 445},
           {3, 237}]};
get_lev_cfg({1018, 55}) ->
    #{base_attrs =>
          [{1, 3547},
           {4, 667},
           {5, 520},
           {6, 510},
           {7, 302},
           {3, 161},
           {2, 3024},
           {26, 86},
           {25, 86}],
      extra_attrs =>
          [{1, 5321},
           {4, 1001},
           {5, 781},
           {6, 766},
           {7, 453},
           {3, 242}]};
get_lev_cfg({1018, 56}) ->
    #{base_attrs =>
          [{1, 3615},
           {4, 680},
           {5, 530},
           {6, 520},
           {7, 308},
           {3, 164},
           {2, 3027},
           {26, 88},
           {25, 88}],
      extra_attrs =>
          [{1, 5422},
           {4, 1020},
           {5, 796},
           {6, 780},
           {7, 462},
           {3, 246}]};
get_lev_cfg({1018, 57}) ->
    #{base_attrs =>
          [{1, 3682},
           {4, 693},
           {5, 540},
           {6, 530},
           {7, 313},
           {3, 167},
           {2, 3030},
           {26, 90},
           {25, 90}],
      extra_attrs =>
          [{1, 5524},
           {4, 1039},
           {5, 810},
           {6, 795},
           {7, 470},
           {3, 251}]};
get_lev_cfg({1018, 58}) ->
    #{base_attrs =>
          [{1, 3750},
           {4, 706},
           {5, 550},
           {6, 539},
           {7, 319},
           {3, 170},
           {2, 3033},
           {26, 93},
           {25, 93}],
      extra_attrs =>
          [{1, 5625},
           {4, 1059},
           {5, 825},
           {6, 809},
           {7, 479},
           {3, 256}]};
get_lev_cfg({1018, 59}) ->
    #{base_attrs =>
          [{1, 3817},
           {4, 718},
           {5, 560},
           {6, 549},
           {7, 325},
           {3, 173},
           {2, 3036},
           {26, 95},
           {25, 95}],
      extra_attrs =>
          [{1, 5726},
           {4, 1078},
           {5, 840},
           {6, 824},
           {7, 488},
           {3, 260}]};
get_lev_cfg({1018, 60}) ->
    #{base_attrs =>
          [{1, 3962},
           {4, 745},
           {5, 581},
           {6, 570},
           {7, 337},
           {3, 180},
           {2, 3039},
           {26, 98},
           {25, 98}],
      extra_attrs =>
          [{1, 5943},
           {4, 1118},
           {5, 872},
           {6, 855},
           {7, 506},
           {3, 270}]};
get_lev_cfg({1018, 61}) ->
    #{base_attrs =>
          [{1, 4070},
           {4, 766},
           {5, 597},
           {6, 586},
           {7, 347},
           {3, 185},
           {2, 3042},
           {26, 100},
           {25, 100}],
      extra_attrs =>
          [{1, 6105},
           {4, 1149},
           {5, 896},
           {6, 879},
           {7, 520},
           {3, 277}]};
get_lev_cfg({1018, 62}) ->
    #{base_attrs =>
          [{1, 4178},
           {4, 786},
           {5, 613},
           {6, 601},
           {7, 356},
           {3, 190},
           {2, 3045},
           {26, 102},
           {25, 102}],
      extra_attrs =>
          [{1, 6267},
           {4, 1179},
           {5, 919},
           {6, 902},
           {7, 534},
           {3, 285}]};
get_lev_cfg({1018, 63}) ->
    #{base_attrs =>
          [{1, 4284},
           {4, 806},
           {5, 628},
           {6, 616},
           {7, 365},
           {3, 195},
           {2, 3048},
           {26, 105},
           {25, 105}],
      extra_attrs =>
          [{1, 6426},
           {4, 1209},
           {5, 943},
           {6, 925},
           {7, 547},
           {3, 292}]};
get_lev_cfg({1018, 64}) ->
    #{base_attrs =>
          [{1, 4390},
           {4, 826},
           {5, 644},
           {6, 632},
           {7, 374},
           {3, 199},
           {2, 3051},
           {26, 107},
           {25, 107}],
      extra_attrs =>
          [{1, 6585},
           {4, 1239},
           {5, 966},
           {6, 948},
           {7, 561},
           {3, 299}]};
get_lev_cfg({1018, 65}) ->
    #{base_attrs =>
          [{1, 4494},
           {4, 846},
           {5, 659},
           {6, 647},
           {7, 383},
           {3, 204},
           {2, 3054},
           {26, 110},
           {25, 110}],
      extra_attrs =>
          [{1, 6741},
           {4, 1269},
           {5, 989},
           {6, 970},
           {7, 574},
           {3, 306}]};
get_lev_cfg({1018, 66}) ->
    #{base_attrs =>
          [{1, 4598},
           {4, 865},
           {5, 675},
           {6, 662},
           {7, 392},
           {3, 209},
           {2, 3057},
           {26, 112},
           {25, 112}],
      extra_attrs =>
          [{1, 6898},
           {4, 1298},
           {5, 1012},
           {6, 993},
           {7, 588},
           {3, 314}]};
get_lev_cfg({1018, 67}) ->
    #{base_attrs =>
          [{1, 4701},
           {4, 885},
           {5, 690},
           {6, 676},
           {7, 400},
           {3, 214},
           {2, 3060},
           {26, 114},
           {25, 114}],
      extra_attrs =>
          [{1, 7052},
           {4, 1327},
           {5, 1035},
           {6, 1015},
           {7, 601},
           {3, 321}]};
get_lev_cfg({1018, 68}) ->
    #{base_attrs =>
          [{1, 4803},
           {4, 904},
           {5, 705},
           {6, 691},
           {7, 409},
           {3, 218},
           {2, 3063},
           {26, 117},
           {25, 117}],
      extra_attrs =>
          [{1, 7205},
           {4, 1356},
           {5, 1057},
           {6, 1037},
           {7, 614},
           {3, 328}]};
get_lev_cfg({1018, 69}) ->
    #{base_attrs =>
          [{1, 4905},
           {4, 923},
           {5, 720},
           {6, 706},
           {7, 418},
           {3, 223},
           {2, 3066},
           {26, 119},
           {25, 119}],
      extra_attrs =>
          [{1, 7357},
           {4, 1385},
           {5, 1080},
           {6, 1059},
           {7, 627},
           {3, 334}]};
get_lev_cfg({1018, 70}) ->
    #{base_attrs =>
          [{1, 5005},
           {4, 942},
           {5, 734},
           {6, 720},
           {7, 426},
           {3, 227},
           {2, 3070},
           {26, 122},
           {25, 122}],
      extra_attrs =>
          [{1, 7508},
           {4, 1413},
           {5, 1102},
           {6, 1081},
           {7, 640},
           {3, 341}]};
get_lev_cfg({1018, 71}) ->
    #{base_attrs =>
          [{1, 5104},
           {4, 961},
           {5, 749},
           {6, 735},
           {7, 435},
           {3, 232},
           {2, 3074},
           {26, 124},
           {25, 124}],
      extra_attrs =>
          [{1, 7657},
           {4, 1441},
           {5, 1124},
           {6, 1102},
           {7, 652},
           {3, 348}]};
get_lev_cfg({1018, 72}) ->
    #{base_attrs =>
          [{1, 5203},
           {4, 979},
           {5, 763},
           {6, 749},
           {7, 443},
           {3, 236},
           {2, 3078},
           {26, 126},
           {25, 126}],
      extra_attrs =>
          [{1, 7805},
           {4, 1469},
           {5, 1145},
           {6, 1123},
           {7, 665},
           {3, 355}]};
get_lev_cfg({1018, 73}) ->
    #{base_attrs =>
          [{1, 5301},
           {4, 998},
           {5, 778},
           {6, 763},
           {7, 452},
           {3, 241},
           {2, 3082},
           {26, 129},
           {25, 129}],
      extra_attrs =>
          [{1, 7952},
           {4, 1497},
           {5, 1167},
           {6, 1144},
           {7, 678},
           {3, 362}]};
get_lev_cfg({1018, 74}) ->
    #{base_attrs =>
          [{1, 5398},
           {4, 1016},
           {5, 792},
           {6, 777},
           {7, 460},
           {3, 245},
           {2, 3086},
           {26, 131},
           {25, 131}],
      extra_attrs =>
          [{1, 8097},
           {4, 1524},
           {5, 1188},
           {6, 1165},
           {7, 690},
           {3, 368}]};
get_lev_cfg({1018, 75}) ->
    #{base_attrs =>
          [{1, 5494},
           {4, 1034},
           {5, 806},
           {6, 791},
           {7, 468},
           {3, 250},
           {2, 3090},
           {26, 134},
           {25, 134}],
      extra_attrs =>
          [{1, 8241},
           {4, 1551},
           {5, 1209},
           {6, 1186},
           {7, 702},
           {3, 375}]};
get_lev_cfg({1018, 76}) ->
    #{base_attrs =>
          [{1, 5589},
           {4, 1052},
           {5, 820},
           {6, 804},
           {7, 476},
           {3, 254},
           {2, 3094},
           {26, 136},
           {25, 136}],
      extra_attrs =>
          [{1, 8384},
           {4, 1578},
           {5, 1230},
           {6, 1207},
           {7, 714},
           {3, 381}]};
get_lev_cfg({1018, 77}) ->
    #{base_attrs =>
          [{1, 5683},
           {4, 1070},
           {5, 834},
           {6, 818},
           {7, 484},
           {3, 258},
           {2, 3098},
           {26, 138},
           {25, 138}],
      extra_attrs =>
          [{1, 8525},
           {4, 1605},
           {5, 1251},
           {6, 1227},
           {7, 726},
           {3, 388}]};
get_lev_cfg({1018, 78}) ->
    #{base_attrs =>
          [{1, 5777},
           {4, 1087},
           {5, 848},
           {6, 831},
           {7, 492},
           {3, 263},
           {2, 3102},
           {26, 141},
           {25, 141}],
      extra_attrs =>
          [{1, 8666},
           {4, 1631},
           {5, 1272},
           {6, 1247},
           {7, 738},
           {3, 394}]};
get_lev_cfg({1018, 79}) ->
    #{base_attrs =>
          [{1, 5870},
           {4, 1105},
           {5, 861},
           {6, 845},
           {7, 500},
           {3, 267},
           {2, 3106},
           {26, 143},
           {25, 143}],
      extra_attrs =>
          [{1, 8805},
           {4, 1657},
           {5, 1292},
           {6, 1267},
           {7, 750},
           {3, 400}]};
get_lev_cfg({1018, 80}) ->
    #{base_attrs =>
          [{1, 5962},
           {4, 1122},
           {5, 875},
           {6, 858},
           {7, 508},
           {3, 271},
           {2, 3110},
           {26, 146},
           {25, 146}],
      extra_attrs =>
          [{1, 8943},
           {4, 1683},
           {5, 1312},
           {6, 1287},
           {7, 762},
           {3, 407}]};
get_lev_cfg({1018, 81}) ->
    #{base_attrs =>
          [{1, 6052},
           {4, 1139},
           {5, 888},
           {6, 871},
           {7, 516},
           {3, 275},
           {2, 3114},
           {26, 148},
           {25, 148}],
      extra_attrs =>
          [{1, 9079},
           {4, 1709},
           {5, 1332},
           {6, 1307},
           {7, 774},
           {3, 413}]};
get_lev_cfg({1018, 82}) ->
    #{base_attrs =>
          [{1, 6142},
           {4, 1156},
           {5, 901},
           {6, 884},
           {7, 523},
           {3, 279},
           {2, 3118},
           {26, 150},
           {25, 150}],
      extra_attrs =>
          [{1, 9214},
           {4, 1734},
           {5, 1352},
           {6, 1326},
           {7, 785},
           {3, 419}]};
get_lev_cfg({1018, 83}) ->
    #{base_attrs =>
          [{1, 6231},
           {4, 1173},
           {5, 914},
           {6, 897},
           {7, 531},
           {3, 283},
           {2, 3122},
           {26, 153},
           {25, 153}],
      extra_attrs =>
          [{1, 9347},
           {4, 1759},
           {5, 1372},
           {6, 1345},
           {7, 797},
           {3, 425}]};
get_lev_cfg({1018, 84}) ->
    #{base_attrs =>
          [{1, 6320},
           {4, 1189},
           {5, 927},
           {6, 910},
           {7, 538},
           {3, 287},
           {2, 3126},
           {26, 155},
           {25, 155}],
      extra_attrs =>
          [{1, 9480},
           {4, 1784},
           {5, 1391},
           {6, 1365},
           {7, 808},
           {3, 431}]};
get_lev_cfg({1018, 85}) ->
    #{base_attrs =>
          [{1, 6407},
           {4, 1206},
           {5, 940},
           {6, 922},
           {7, 546},
           {3, 291},
           {2, 3130},
           {26, 158},
           {25, 158}],
      extra_attrs =>
          [{1, 9611},
           {4, 1809},
           {5, 1410},
           {6, 1383},
           {7, 819},
           {3, 437}]};
get_lev_cfg({1018, 86}) ->
    #{base_attrs =>
          [{1, 6494},
           {4, 1222},
           {5, 953},
           {6, 935},
           {7, 553},
           {3, 295},
           {2, 3134},
           {26, 160},
           {25, 160}],
      extra_attrs =>
          [{1, 9741},
           {4, 1833},
           {5, 1430},
           {6, 1402},
           {7, 830},
           {3, 443}]};
get_lev_cfg({1018, 87}) ->
    #{base_attrs =>
          [{1, 6579},
           {4, 1238},
           {5, 965},
           {6, 947},
           {7, 561},
           {3, 299},
           {2, 3138},
           {26, 162},
           {25, 162}],
      extra_attrs =>
          [{1, 9869},
           {4, 1858},
           {5, 1448},
           {6, 1421},
           {7, 841},
           {3, 449}]};
get_lev_cfg({1018, 88}) ->
    #{base_attrs =>
          [{1, 6665},
           {4, 1254},
           {5, 978},
           {6, 959},
           {7, 568},
           {3, 303},
           {2, 3142},
           {26, 165},
           {25, 165}],
      extra_attrs =>
          [{1, 9997},
           {4, 1882},
           {5, 1467},
           {6, 1439},
           {7, 852},
           {3, 455}]};
get_lev_cfg({1018, 89}) ->
    #{base_attrs =>
          [{1, 6748},
           {4, 1270},
           {5, 990},
           {6, 971},
           {7, 575},
           {3, 307},
           {2, 3146},
           {26, 167},
           {25, 167}],
      extra_attrs =>
          [{1, 10123},
           {4, 1905},
           {5, 1486},
           {6, 1457},
           {7, 863},
           {3, 460}]};
get_lev_cfg({1018, 90}) ->
    #{base_attrs =>
          [{1, 6832},
           {4, 1286},
           {5, 1002},
           {6, 983},
           {7, 582},
           {3, 311},
           {2, 3151},
           {26, 170},
           {25, 170}],
      extra_attrs =>
          [{1, 10248},
           {4, 1929},
           {5, 1504},
           {6, 1475},
           {7, 873},
           {3, 466}]};
get_lev_cfg({1018, 91}) ->
    #{base_attrs =>
          [{1, 6914},
           {4, 1301},
           {5, 1014},
           {6, 995},
           {7, 589},
           {3, 314},
           {2, 3156},
           {26, 172},
           {25, 172}],
      extra_attrs =>
          [{1, 10371},
           {4, 1952},
           {5, 1522},
           {6, 1493},
           {7, 884},
           {3, 472}]};
get_lev_cfg({1018, 92}) ->
    #{base_attrs =>
          [{1, 6995},
           {4, 1317},
           {5, 1026},
           {6, 1007},
           {7, 596},
           {3, 318},
           {2, 3161},
           {26, 174},
           {25, 174}],
      extra_attrs =>
          [{1, 10493},
           {4, 1975},
           {5, 1540},
           {6, 1510},
           {7, 894},
           {3, 477}]};
get_lev_cfg({1018, 93}) ->
    #{base_attrs =>
          [{1, 7076},
           {4, 1332},
           {5, 1038},
           {6, 1018},
           {7, 603},
           {3, 322},
           {2, 3166},
           {26, 177},
           {25, 177}],
      extra_attrs =>
          [{1, 10614},
           {4, 1998},
           {5, 1558},
           {6, 1528},
           {7, 905},
           {3, 483}]};
get_lev_cfg({1018, 94}) ->
    #{base_attrs =>
          [{1, 7156},
           {4, 1347},
           {5, 1050},
           {6, 1030},
           {7, 610},
           {3, 325},
           {2, 3171},
           {26, 179},
           {25, 179}],
      extra_attrs =>
          [{1, 10734},
           {4, 2020},
           {5, 1575},
           {6, 1545},
           {7, 915},
           {3, 488}]};
get_lev_cfg({1018, 95}) ->
    #{base_attrs =>
          [{1, 7234},
           {4, 1362},
           {5, 1062},
           {6, 1041},
           {7, 616},
           {3, 329},
           {2, 3176},
           {26, 182},
           {25, 182}],
      extra_attrs =>
          [{1, 10852},
           {4, 2043},
           {5, 1593},
           {6, 1562},
           {7, 925},
           {3, 494}]};
get_lev_cfg({1018, 96}) ->
    #{base_attrs =>
          [{1, 7312},
           {4, 1376},
           {5, 1073},
           {6, 1052},
           {7, 623},
           {3, 332},
           {2, 3181},
           {26, 184},
           {25, 184}],
      extra_attrs =>
          [{1, 10969},
           {4, 2065},
           {5, 1610},
           {6, 1579},
           {7, 935},
           {3, 499}]};
get_lev_cfg({1018, 97}) ->
    #{base_attrs =>
          [{1, 7389},
           {4, 1391},
           {5, 1084},
           {6, 1064},
           {7, 630},
           {3, 336},
           {2, 3186},
           {26, 186},
           {25, 186}],
      extra_attrs =>
          [{1, 11084},
           {4, 2086},
           {5, 1627},
           {6, 1596},
           {7, 945},
           {3, 504}]};
get_lev_cfg({1018, 98}) ->
    #{base_attrs =>
          [{1, 7465},
           {4, 1405},
           {5, 1095},
           {6, 1074},
           {7, 636},
           {3, 339},
           {2, 3191},
           {26, 189},
           {25, 189}],
      extra_attrs =>
          [{1, 11198},
           {4, 2108},
           {5, 1643},
           {6, 1612},
           {7, 954},
           {3, 509}]};
get_lev_cfg({1018, 99}) ->
    #{base_attrs =>
          [{1, 7541},
           {4, 1419},
           {5, 1107},
           {6, 1085},
           {7, 643},
           {3, 343},
           {2, 3196},
           {26, 191},
           {25, 191}],
      extra_attrs =>
          [{1, 11312},
           {4, 2129},
           {5, 1660},
           {6, 1628},
           {7, 964},
           {3, 514}]};
get_lev_cfg({1018, 100}) ->
    #{base_attrs =>
          [{1, 7615},
           {4, 1433},
           {5, 1117},
           {6, 1096},
           {7, 649},
           {3, 346},
           {2, 3201},
           {26, 194},
           {25, 194}],
      extra_attrs =>
          [{1, 11423},
           {4, 2150},
           {5, 1676},
           {6, 1644},
           {7, 974},
           {3, 520}]};
get_lev_cfg({1018, 101}) ->
    #{base_attrs =>
          [{1, 7689},
           {4, 1447},
           {5, 1128},
           {6, 1107},
           {7, 655},
           {3, 350},
           {2, 3201},
           {26, 197},
           {25, 197}],
      extra_attrs =>
          [{1, 11534},
           {4, 2171},
           {5, 1693},
           {6, 1660},
           {7, 983},
           {3, 525}]};
get_lev_cfg({1018, 102}) ->
    #{base_attrs =>
          [{1, 7762},
           {4, 1461},
           {5, 1139},
           {6, 1117},
           {7, 661},
           {3, 353},
           {2, 3201},
           {26, 200},
           {25, 200}],
      extra_attrs =>
          [{1, 11643},
           {4, 2191},
           {5, 1709},
           {6, 1676},
           {7, 992},
           {3, 530}]};
get_lev_cfg({1018, 103}) ->
    #{base_attrs =>
          [{1, 7834},
           {4, 1474},
           {5, 1149},
           {6, 1127},
           {7, 667},
           {3, 356},
           {2, 3201},
           {26, 203},
           {25, 203}],
      extra_attrs =>
          [{1, 11751},
           {4, 2212},
           {5, 1724},
           {6, 1691},
           {7, 1001},
           {3, 534}]};
get_lev_cfg({1018, 104}) ->
    #{base_attrs =>
          [{1, 7905},
           {4, 1488},
           {5, 1160},
           {6, 1138},
           {7, 674},
           {3, 359},
           {2, 3201},
           {26, 206},
           {25, 206}],
      extra_attrs =>
          [{1, 11857},
           {4, 2232},
           {5, 1740},
           {6, 1707},
           {7, 1011},
           {3, 539}]};
get_lev_cfg({1018, 105}) ->
    #{base_attrs =>
          [{1, 7975},
           {4, 1501},
           {5, 1170},
           {6, 1148},
           {7, 679},
           {3, 363},
           {2, 3201},
           {26, 206},
           {25, 206}],
      extra_attrs =>
          [{1, 11963},
           {4, 2252},
           {5, 1756},
           {6, 1722},
           {7, 1019},
           {3, 544}]};
get_lev_cfg({1018, 106}) ->
    #{base_attrs =>
          [{1, 8044},
           {4, 1514},
           {5, 1180},
           {6, 1158},
           {7, 685},
           {3, 366},
           {2, 3201},
           {26, 212},
           {25, 212}],
      extra_attrs =>
          [{1, 12066},
           {4, 2271},
           {5, 1771},
           {6, 1737},
           {7, 1028},
           {3, 549}]};
get_lev_cfg({1018, 107}) ->
    #{base_attrs =>
          [{1, 8113},
           {4, 1527},
           {5, 1190},
           {6, 1168},
           {7, 691},
           {3, 369},
           {2, 3201},
           {26, 215},
           {25, 215}],
      extra_attrs =>
          [{1, 12169},
           {4, 2291},
           {5, 1786},
           {6, 1752},
           {7, 1037},
           {3, 553}]};
get_lev_cfg({1018, 108}) ->
    #{base_attrs =>
          [{1, 8180},
           {4, 1540},
           {5, 1200},
           {6, 1177},
           {7, 697},
           {3, 372},
           {2, 3201},
           {26, 218},
           {25, 218}],
      extra_attrs =>
          [{1, 12271},
           {4, 2310},
           {5, 1801},
           {6, 1766},
           {7, 1046},
           {3, 558}]};
get_lev_cfg({1018, 109}) ->
    #{base_attrs =>
          [{1, 8247},
           {4, 1552},
           {5, 1210},
           {6, 1187},
           {7, 703},
           {3, 375},
           {2, 3201},
           {26, 221},
           {25, 221}],
      extra_attrs =>
          [{1, 12370},
           {4, 2328},
           {5, 1815},
           {6, 1781},
           {7, 1054},
           {3, 563}]};
get_lev_cfg({1018, 110}) ->
    #{base_attrs =>
          [{1, 8313},
           {4, 1565},
           {5, 1220},
           {6, 1196},
           {7, 708},
           {3, 378},
           {2, 3201},
           {26, 224},
           {25, 224}],
      extra_attrs =>
          [{1, 12469},
           {4, 2347},
           {5, 1830},
           {6, 1795},
           {7, 1063},
           {3, 567}]};
get_lev_cfg({1018, 111}) ->
    #{base_attrs =>
          [{1, 8378},
           {4, 1577},
           {5, 1229},
           {6, 1206},
           {7, 714},
           {3, 381},
           {2, 3201},
           {26, 227},
           {25, 227}],
      extra_attrs =>
          [{1, 12567},
           {4, 2365},
           {5, 1844},
           {6, 1809},
           {7, 1071},
           {3, 572}]};
get_lev_cfg({1018, 112}) ->
    #{base_attrs =>
          [{1, 8442},
           {4, 1589},
           {5, 1239},
           {6, 1215},
           {7, 719},
           {3, 384},
           {2, 3201},
           {26, 230},
           {25, 230}],
      extra_attrs =>
          [{1, 12663},
           {4, 2384},
           {5, 1858},
           {6, 1823},
           {7, 1079},
           {3, 576}]};
get_lev_cfg({1018, 113}) ->
    #{base_attrs =>
          [{1, 8505},
           {4, 1601},
           {5, 1248},
           {6, 1224},
           {7, 725},
           {3, 387},
           {2, 3201},
           {26, 233},
           {25, 233}],
      extra_attrs =>
          [{1, 12758},
           {4, 2401},
           {5, 1872},
           {6, 1837},
           {7, 1087},
           {3, 580}]};
get_lev_cfg({1018, 114}) ->
    #{base_attrs =>
          [{1, 8567},
           {4, 1613},
           {5, 1257},
           {6, 1233},
           {7, 730},
           {3, 390},
           {2, 3201},
           {26, 236},
           {25, 236}],
      extra_attrs =>
          [{1, 12851},
           {4, 2419},
           {5, 1886},
           {6, 1850},
           {7, 1095},
           {3, 585}]};
get_lev_cfg({1018, 115}) ->
    #{base_attrs =>
          [{1, 8629},
           {4, 1624},
           {5, 1266},
           {6, 1242},
           {7, 735},
           {3, 392},
           {2, 3201},
           {26, 239},
           {25, 239}],
      extra_attrs =>
          [{1, 12944},
           {4, 2436},
           {5, 1900},
           {6, 1863},
           {7, 1103},
           {3, 589}]};
get_lev_cfg({1018, 116}) ->
    #{base_attrs =>
          [{1, 8690},
           {4, 1636},
           {5, 1275},
           {6, 1251},
           {7, 740},
           {3, 395},
           {2, 3201},
           {26, 242},
           {25, 242}],
      extra_attrs =>
          [{1, 13035},
           {4, 2454},
           {5, 1913},
           {6, 1876},
           {7, 1111},
           {3, 593}]};
get_lev_cfg({1018, 117}) ->
    #{base_attrs =>
          [{1, 8750},
           {4, 1647},
           {5, 1284},
           {6, 1259},
           {7, 746},
           {3, 398},
           {2, 3201},
           {26, 245},
           {25, 245}],
      extra_attrs =>
          [{1, 13125},
           {4, 2470},
           {5, 1926},
           {6, 1889},
           {7, 1119},
           {3, 597}]};
get_lev_cfg({1018, 118}) ->
    #{base_attrs =>
          [{1, 8809},
           {4, 1658},
           {5, 1293},
           {6, 1268},
           {7, 751},
           {3, 401},
           {2, 3201},
           {26, 248},
           {25, 248}],
      extra_attrs =>
          [{1, 13213},
           {4, 2487},
           {5, 1939},
           {6, 1902},
           {7, 1126},
           {3, 601}]};
get_lev_cfg({1018, 119}) ->
    #{base_attrs =>
          [{1, 8866},
           {4, 1669},
           {5, 1301},
           {6, 1276},
           {7, 756},
           {3, 403},
           {2, 3201},
           {26, 251},
           {25, 251}],
      extra_attrs =>
          [{1, 13300},
           {4, 2503},
           {5, 1952},
           {6, 1915},
           {7, 1134},
           {3, 605}]};
get_lev_cfg({1018, 120}) ->
    #{base_attrs =>
          [{1, 8924},
           {4, 1680},
           {5, 1310},
           {6, 1284},
           {7, 760},
           {3, 406},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13386},
           {4, 2520},
           {5, 1965},
           {6, 1927},
           {7, 1141},
           {3, 609}]};
get_lev_cfg({1018, 121}) ->
    #{base_attrs =>
          [{1, 8980},
           {4, 1690},
           {5, 1318},
           {6, 1293},
           {7, 765},
           {3, 408},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13471},
           {4, 2536},
           {5, 1977},
           {6, 1939},
           {7, 1148},
           {3, 613}]};
get_lev_cfg({1018, 122}) ->
    #{base_attrs =>
          [{1, 9036},
           {4, 1701},
           {5, 1326},
           {6, 1301},
           {7, 770},
           {3, 411},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13554},
           {4, 2551},
           {5, 1989},
           {6, 1951},
           {7, 1155},
           {3, 617}]};
get_lev_cfg({1018, 123}) ->
    #{base_attrs =>
          [{1, 9090},
           {4, 1711},
           {5, 1334},
           {6, 1308},
           {7, 775},
           {3, 413},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13636},
           {4, 2567},
           {5, 2001},
           {6, 1963},
           {7, 1162},
           {3, 620}]};
get_lev_cfg({1018, 124}) ->
    #{base_attrs =>
          [{1, 9144},
           {4, 1721},
           {5, 1342},
           {6, 1316},
           {7, 779},
           {3, 416},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13717},
           {4, 2582},
           {5, 2013},
           {6, 1975},
           {7, 1169},
           {3, 624}]};
get_lev_cfg({1018, 125}) ->
    #{base_attrs =>
          [{1, 9197},
           {4, 1731},
           {5, 1350},
           {6, 1324},
           {7, 784},
           {3, 418},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13796},
           {4, 2597},
           {5, 2025},
           {6, 1986},
           {7, 1176},
           {3, 628}]};
get_lev_cfg({1018, 126}) ->
    #{base_attrs =>
          [{1, 9249},
           {4, 1741},
           {5, 1357},
           {6, 1331},
           {7, 788},
           {3, 421},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13874},
           {4, 2611},
           {5, 2036},
           {6, 1997},
           {7, 1182},
           {3, 631}]};
get_lev_cfg({1018, 127}) ->
    #{base_attrs =>
          [{1, 9300},
           {4, 1750},
           {5, 1365},
           {6, 1339},
           {7, 793},
           {3, 423},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13951},
           {4, 2626},
           {5, 2047},
           {6, 2008},
           {7, 1189},
           {3, 635}]};
get_lev_cfg({1018, 128}) ->
    #{base_attrs =>
          [{1, 9351},
           {4, 1760},
           {5, 1372},
           {6, 1346},
           {7, 797},
           {3, 425},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 14026},
           {4, 2640},
           {5, 2059},
           {6, 2019},
           {7, 1195},
           {3, 638}]};
get_lev_cfg({1018, 129}) ->
    #{base_attrs =>
          [{1, 9400},
           {4, 1769},
           {5, 1379},
           {6, 1353},
           {7, 801},
           {3, 427},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 14100},
           {4, 2654},
           {5, 2069},
           {6, 2030},
           {7, 1202},
           {3, 641}]};
get_lev_cfg({1018, 130}) ->
    #{base_attrs =>
          [{1, 9449},
           {4, 1778},
           {5, 1387},
           {6, 1360},
           {7, 805},
           {3, 430},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 14173},
           {4, 2668},
           {5, 2080},
           {6, 2040},
           {7, 1208},
           {3, 645}]};
get_lev_cfg({1019, 1}) ->
    #{base_attrs =>
          [{1, 168},
           {4, 31},
           {5, 24},
           {6, 24},
           {7, 14},
           {3, 7},
           {2, 200},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 253},
           {4, 47},
           {5, 37},
           {6, 36},
           {7, 21},
           {3, 11}]};
get_lev_cfg({1019, 2}) ->
    #{base_attrs =>
          [{1, 202},
           {4, 38},
           {5, 29},
           {6, 29},
           {7, 17},
           {3, 9},
           {2, 576},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 304},
           {4, 57},
           {5, 44},
           {6, 43},
           {7, 25},
           {3, 13}]};
get_lev_cfg({1019, 3}) ->
    #{base_attrs =>
          [{1, 236},
           {4, 44},
           {5, 34},
           {6, 34},
           {7, 20},
           {3, 10},
           {2, 672},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 354},
           {4, 66},
           {5, 52},
           {6, 51},
           {7, 30},
           {3, 16}]};
get_lev_cfg({1019, 4}) ->
    #{base_attrs =>
          [{1, 270},
           {4, 50},
           {5, 39},
           {6, 38},
           {7, 23},
           {3, 12},
           {2, 767},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 405},
           {4, 76},
           {5, 59},
           {6, 58},
           {7, 34},
           {3, 18}]};
get_lev_cfg({1019, 5}) ->
    #{base_attrs =>
          [{1, 304},
           {4, 57},
           {5, 44},
           {6, 43},
           {7, 25},
           {3, 13},
           {2, 864},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 456},
           {4, 85},
           {5, 66},
           {6, 65},
           {7, 38},
           {3, 20}]};
get_lev_cfg({1019, 6}) ->
    #{base_attrs =>
          [{1, 337},
           {4, 63},
           {5, 49},
           {6, 48},
           {7, 28},
           {3, 15},
           {2, 960},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 506},
           {4, 95},
           {5, 74},
           {6, 72},
           {7, 43},
           {3, 23}]};
get_lev_cfg({1019, 7}) ->
    #{base_attrs =>
          [{1, 371},
           {4, 69},
           {5, 54},
           {6, 53},
           {7, 31},
           {3, 16},
           {2, 1055},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 557},
           {4, 104},
           {5, 81},
           {6, 80},
           {7, 47},
           {3, 25}]};
get_lev_cfg({1019, 8}) ->
    #{base_attrs =>
          [{1, 405},
           {4, 76},
           {5, 59},
           {6, 58},
           {7, 34},
           {3, 18},
           {2, 1152},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 608},
           {4, 114},
           {5, 89},
           {6, 87},
           {7, 51},
           {3, 27}]};
get_lev_cfg({1019, 9}) ->
    #{base_attrs =>
          [{1, 439},
           {4, 82},
           {5, 64},
           {6, 63},
           {7, 37},
           {3, 19},
           {2, 1248},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 658},
           {4, 124},
           {5, 96},
           {6, 94},
           {7, 56},
           {3, 29}]};
get_lev_cfg({1019, 10}) ->
    #{base_attrs =>
          [{1, 506},
           {4, 95},
           {5, 74},
           {6, 72},
           {7, 43},
           {3, 23},
           {2, 1440},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 760},
           {4, 143},
           {5, 111},
           {6, 109},
           {7, 64},
           {3, 34}]};
get_lev_cfg({1019, 11}) ->
    #{base_attrs =>
          [{1, 574},
           {4, 108},
           {5, 84},
           {6, 82},
           {7, 48},
           {3, 26},
           {2, 1631},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 861},
           {4, 162},
           {5, 126},
           {6, 124},
           {7, 73},
           {3, 39}]};
get_lev_cfg({1019, 12}) ->
    #{base_attrs =>
          [{1, 641},
           {4, 120},
           {5, 94},
           {6, 92},
           {7, 54},
           {3, 29},
           {2, 1824},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 962},
           {4, 181},
           {5, 141},
           {6, 138},
           {7, 82},
           {3, 43}]};
get_lev_cfg({1019, 13}) ->
    #{base_attrs =>
          [{1, 709},
           {4, 133},
           {5, 104},
           {6, 102},
           {7, 60},
           {3, 32},
           {2, 2016},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1064},
           {4, 200},
           {5, 156},
           {6, 153},
           {7, 90},
           {3, 48}]};
get_lev_cfg({1019, 14}) ->
    #{base_attrs =>
          [{1, 777},
           {4, 146},
           {5, 114},
           {6, 111},
           {7, 66},
           {3, 35},
           {2, 2207},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1165},
           {4, 219},
           {5, 171},
           {6, 167},
           {7, 99},
           {3, 53}]};
get_lev_cfg({1019, 15}) ->
    #{base_attrs =>
          [{1, 844},
           {4, 159},
           {5, 123},
           {6, 121},
           {7, 72},
           {3, 38},
           {2, 2400},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1267},
           {4, 238},
           {5, 185},
           {6, 182},
           {7, 108},
           {3, 57}]};
get_lev_cfg({1019, 16}) ->
    #{base_attrs =>
          [{1, 912},
           {4, 171},
           {5, 133},
           {6, 131},
           {7, 77},
           {3, 41},
           {2, 2408},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1368},
           {4, 257},
           {5, 200},
           {6, 197},
           {7, 116},
           {3, 62}]};
get_lev_cfg({1019, 17}) ->
    #{base_attrs =>
          [{1, 979},
           {4, 184},
           {5, 143},
           {6, 141},
           {7, 83},
           {3, 44},
           {2, 2417},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1469},
           {4, 276},
           {5, 215},
           {6, 211},
           {7, 125},
           {3, 66}]};
get_lev_cfg({1019, 18}) ->
    #{base_attrs =>
          [{1, 1047},
           {4, 197},
           {5, 153},
           {6, 150},
           {7, 89},
           {3, 47},
           {2, 2426},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1571},
           {4, 295},
           {5, 230},
           {6, 226},
           {7, 133},
           {3, 71}]};
get_lev_cfg({1019, 19}) ->
    #{base_attrs =>
          [{1, 1114},
           {4, 209},
           {5, 163},
           {6, 160},
           {7, 95},
           {3, 50},
           {2, 2436},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1672},
           {4, 314},
           {5, 245},
           {6, 240},
           {7, 142},
           {3, 76}]};
get_lev_cfg({1019, 20}) ->
    #{base_attrs =>
          [{1, 1182},
           {4, 222},
           {5, 173},
           {6, 170},
           {7, 100},
           {3, 53},
           {2, 2446},
           {26, 2},
           {25, 2}],
      extra_attrs =>
          [{1, 1773},
           {4, 333},
           {5, 260},
           {6, 255},
           {7, 151},
           {3, 80}]};
get_lev_cfg({1019, 21}) ->
    #{base_attrs =>
          [{1, 1250},
           {4, 235},
           {5, 183},
           {6, 179},
           {7, 106},
           {3, 56},
           {2, 2457},
           {26, 4},
           {25, 4}],
      extra_attrs =>
          [{1, 1875},
           {4, 353},
           {5, 275},
           {6, 269},
           {7, 159},
           {3, 85}]};
get_lev_cfg({1019, 22}) ->
    #{base_attrs =>
          [{1, 1317},
           {4, 248},
           {5, 193},
           {6, 189},
           {7, 112},
           {3, 59},
           {2, 2468},
           {26, 6},
           {25, 6}],
      extra_attrs =>
          [{1, 1976},
           {4, 372},
           {5, 290},
           {6, 284},
           {7, 168},
           {3, 89}]};
get_lev_cfg({1019, 23}) ->
    #{base_attrs =>
          [{1, 1385},
           {4, 260},
           {5, 203},
           {6, 199},
           {7, 118},
           {3, 63},
           {2, 2480},
           {26, 9},
           {25, 9}],
      extra_attrs =>
          [{1, 2077},
           {4, 391},
           {5, 305},
           {6, 299},
           {7, 177},
           {3, 94}]};
get_lev_cfg({1019, 24}) ->
    #{base_attrs =>
          [{1, 1452},
           {4, 273},
           {5, 213},
           {6, 209},
           {7, 123},
           {3, 66},
           {2, 2492},
           {26, 11},
           {25, 11}],
      extra_attrs =>
          [{1, 2179},
           {4, 410},
           {5, 319},
           {6, 313},
           {7, 185},
           {3, 99}]};
get_lev_cfg({1019, 25}) ->
    #{base_attrs =>
          [{1, 1520},
           {4, 286},
           {5, 223},
           {6, 218},
           {7, 129},
           {3, 69},
           {2, 2505},
           {26, 14},
           {25, 14}],
      extra_attrs =>
          [{1, 2280},
           {4, 429},
           {5, 334},
           {6, 328},
           {7, 194},
           {3, 103}]};
get_lev_cfg({1019, 26}) ->
    #{base_attrs =>
          [{1, 1587},
           {4, 298},
           {5, 233},
           {6, 228},
           {7, 135},
           {3, 72},
           {2, 2518},
           {26, 16},
           {25, 16}],
      extra_attrs =>
          [{1, 2381},
           {4, 448},
           {5, 349},
           {6, 342},
           {7, 203},
           {3, 108}]};
get_lev_cfg({1019, 27}) ->
    #{base_attrs =>
          [{1, 1655},
           {4, 311},
           {5, 243},
           {6, 238},
           {7, 141},
           {3, 75},
           {2, 2532},
           {26, 18},
           {25, 18}],
      extra_attrs =>
          [{1, 2483},
           {4, 467},
           {5, 364},
           {6, 357},
           {7, 211},
           {3, 113}]};
get_lev_cfg({1019, 28}) ->
    #{base_attrs =>
          [{1, 1723},
           {4, 324},
           {5, 252},
           {6, 248},
           {7, 146},
           {3, 78},
           {2, 2546},
           {26, 21},
           {25, 21}],
      extra_attrs =>
          [{1, 2584},
           {4, 486},
           {5, 379},
           {6, 372},
           {7, 220},
           {3, 117}]};
get_lev_cfg({1019, 29}) ->
    #{base_attrs =>
          [{1, 1790},
           {4, 337},
           {5, 262},
           {6, 257},
           {7, 152},
           {3, 81},
           {2, 2561},
           {26, 23},
           {25, 23}],
      extra_attrs =>
          [{1, 2686},
           {4, 505},
           {5, 394},
           {6, 386},
           {7, 229},
           {3, 122}]};
get_lev_cfg({1019, 30}) ->
    #{base_attrs =>
          [{1, 1858},
           {4, 349},
           {5, 272},
           {6, 267},
           {7, 158},
           {3, 84},
           {2, 2576},
           {26, 26},
           {25, 26}],
      extra_attrs =>
          [{1, 2787},
           {4, 524},
           {5, 409},
           {6, 401},
           {7, 237},
           {3, 126}]};
get_lev_cfg({1019, 31}) ->
    #{base_attrs =>
          [{1, 1925},
           {4, 362},
           {5, 282},
           {6, 277},
           {7, 164},
           {3, 87},
           {2, 2592},
           {26, 28},
           {25, 28}],
      extra_attrs =>
          [{1, 2888},
           {4, 543},
           {5, 424},
           {6, 415},
           {7, 246},
           {3, 131}]};
get_lev_cfg({1019, 32}) ->
    #{base_attrs =>
          [{1, 1993},
           {4, 375},
           {5, 292},
           {6, 287},
           {7, 169},
           {3, 90},
           {2, 2608},
           {26, 30},
           {25, 30}],
      extra_attrs =>
          [{1, 2990},
           {4, 562},
           {5, 438},
           {6, 430},
           {7, 254},
           {3, 136}]};
get_lev_cfg({1019, 33}) ->
    #{base_attrs =>
          [{1, 2060},
           {4, 388},
           {5, 302},
           {6, 296},
           {7, 175},
           {3, 93},
           {2, 2625},
           {26, 33},
           {25, 33}],
      extra_attrs =>
          [{1, 3091},
           {4, 582},
           {5, 453},
           {6, 445},
           {7, 263},
           {3, 140}]};
get_lev_cfg({1019, 34}) ->
    #{base_attrs =>
          [{1, 2128},
           {4, 400},
           {5, 312},
           {6, 306},
           {7, 181},
           {3, 96},
           {2, 2642},
           {26, 35},
           {25, 35}],
      extra_attrs =>
          [{1, 3192},
           {4, 601},
           {5, 468},
           {6, 459},
           {7, 272},
           {3, 145}]};
get_lev_cfg({1019, 35}) ->
    #{base_attrs =>
          [{1, 2196},
           {4, 413},
           {5, 322},
           {6, 316},
           {7, 187},
           {3, 99},
           {2, 2660},
           {26, 38},
           {25, 38}],
      extra_attrs =>
          [{1, 3294},
           {4, 620},
           {5, 483},
           {6, 474},
           {7, 280},
           {3, 149}]};
get_lev_cfg({1019, 36}) ->
    #{base_attrs =>
          [{1, 2263},
           {4, 426},
           {5, 332},
           {6, 325},
           {7, 193},
           {3, 103},
           {2, 2678},
           {26, 40},
           {25, 40}],
      extra_attrs =>
          [{1, 3395},
           {4, 639},
           {5, 498},
           {6, 488},
           {7, 289},
           {3, 154}]};
get_lev_cfg({1019, 37}) ->
    #{base_attrs =>
          [{1, 2331},
           {4, 438},
           {5, 342},
           {6, 335},
           {7, 198},
           {3, 106},
           {2, 2697},
           {26, 42},
           {25, 42}],
      extra_attrs =>
          [{1, 3496},
           {4, 658},
           {5, 513},
           {6, 503},
           {7, 298},
           {3, 159}]};
get_lev_cfg({1019, 38}) ->
    #{base_attrs =>
          [{1, 2398},
           {4, 451},
           {5, 352},
           {6, 345},
           {7, 204},
           {3, 109},
           {2, 2716},
           {26, 45},
           {25, 45}],
      extra_attrs =>
          [{1, 3598},
           {4, 677},
           {5, 528},
           {6, 518},
           {7, 306},
           {3, 163}]};
get_lev_cfg({1019, 39}) ->
    #{base_attrs =>
          [{1, 2466},
           {4, 464},
           {5, 362},
           {6, 355},
           {7, 210},
           {3, 112},
           {2, 2736},
           {26, 47},
           {25, 47}],
      extra_attrs =>
          [{1, 3699},
           {4, 696},
           {5, 543},
           {6, 532},
           {7, 315},
           {3, 168}]};
get_lev_cfg({1019, 40}) ->
    #{base_attrs =>
          [{1, 2534},
           {4, 477},
           {5, 371},
           {6, 364},
           {7, 216},
           {3, 115},
           {2, 2756},
           {26, 50},
           {25, 50}],
      extra_attrs =>
          [{1, 3801},
           {4, 715},
           {5, 557},
           {6, 547},
           {7, 324},
           {3, 173}]};
get_lev_cfg({1019, 41}) ->
    #{base_attrs =>
          [{1, 2601},
           {4, 489},
           {5, 381},
           {6, 374},
           {7, 221},
           {3, 118},
           {2, 2777},
           {26, 52},
           {25, 52}],
      extra_attrs =>
          [{1, 3902},
           {4, 734},
           {5, 572},
           {6, 561},
           {7, 332},
           {3, 177}]};
get_lev_cfg({1019, 42}) ->
    #{base_attrs =>
          [{1, 2669},
           {4, 502},
           {5, 391},
           {6, 384},
           {7, 227},
           {3, 121},
           {2, 2798},
           {26, 54},
           {25, 54}],
      extra_attrs =>
          [{1, 4003},
           {4, 753},
           {5, 587},
           {6, 576},
           {7, 341},
           {3, 182}]};
get_lev_cfg({1019, 43}) ->
    #{base_attrs =>
          [{1, 2736},
           {4, 515},
           {5, 401},
           {6, 394},
           {7, 233},
           {3, 124},
           {2, 2820},
           {26, 57},
           {25, 57}],
      extra_attrs =>
          [{1, 4105},
           {4, 772},
           {5, 602},
           {6, 591},
           {7, 350},
           {3, 186}]};
get_lev_cfg({1019, 44}) ->
    #{base_attrs =>
          [{1, 2804},
           {4, 527},
           {5, 411},
           {6, 403},
           {7, 239},
           {3, 127},
           {2, 2842},
           {26, 59},
           {25, 59}],
      extra_attrs =>
          [{1, 4206},
           {4, 791},
           {5, 617},
           {6, 605},
           {7, 358},
           {3, 191}]};
get_lev_cfg({1019, 45}) ->
    #{base_attrs =>
          [{1, 2871},
           {4, 540},
           {5, 421},
           {6, 413},
           {7, 244},
           {3, 130},
           {2, 2865},
           {26, 62},
           {25, 62}],
      extra_attrs =>
          [{1, 4307},
           {4, 810},
           {5, 632},
           {6, 620},
           {7, 367},
           {3, 196}]};
get_lev_cfg({1019, 46}) ->
    #{base_attrs =>
          [{1, 2939},
           {4, 553},
           {5, 431},
           {6, 423},
           {7, 250},
           {3, 133},
           {2, 2888},
           {26, 64},
           {25, 64}],
      extra_attrs =>
          [{1, 4409},
           {4, 830},
           {5, 647},
           {6, 634},
           {7, 375},
           {3, 200}]};
get_lev_cfg({1019, 47}) ->
    #{base_attrs =>
          [{1, 3007},
           {4, 566},
           {5, 441},
           {6, 432},
           {7, 256},
           {3, 136},
           {2, 2912},
           {26, 66},
           {25, 66}],
      extra_attrs =>
          [{1, 4510},
           {4, 849},
           {5, 662},
           {6, 649},
           {7, 384},
           {3, 205}]};
get_lev_cfg({1019, 48}) ->
    #{base_attrs =>
          [{1, 3074},
           {4, 578},
           {5, 451},
           {6, 442},
           {7, 262},
           {3, 139},
           {2, 2936},
           {26, 69},
           {25, 69}],
      extra_attrs =>
          [{1, 4611},
           {4, 868},
           {5, 676},
           {6, 664},
           {7, 393},
           {3, 209}]};
get_lev_cfg({1019, 49}) ->
    #{base_attrs =>
          [{1, 3142},
           {4, 591},
           {5, 461},
           {6, 452},
           {7, 267},
           {3, 143},
           {2, 2961},
           {26, 71},
           {25, 71}],
      extra_attrs =>
          [{1, 4713},
           {4, 887},
           {5, 691},
           {6, 678},
           {7, 401},
           {3, 214}]};
get_lev_cfg({1019, 50}) ->
    #{base_attrs =>
          [{1, 3209},
           {4, 604},
           {5, 471},
           {6, 462},
           {7, 273},
           {3, 146},
           {2, 2986},
           {26, 74},
           {25, 74}],
      extra_attrs =>
          [{1, 4814},
           {4, 906},
           {5, 706},
           {6, 693},
           {7, 410},
           {3, 219}]};
get_lev_cfg({1019, 51}) ->
    #{base_attrs =>
          [{1, 3277},
           {4, 616},
           {5, 481},
           {6, 471},
           {7, 279},
           {3, 149},
           {2, 3012},
           {26, 76},
           {25, 76}],
      extra_attrs =>
          [{1, 4915},
           {4, 925},
           {5, 721},
           {6, 707},
           {7, 419},
           {3, 223}]};
get_lev_cfg({1019, 52}) ->
    #{base_attrs =>
          [{1, 3344},
           {4, 629},
           {5, 491},
           {6, 481},
           {7, 285},
           {3, 152},
           {2, 3015},
           {26, 78},
           {25, 78}],
      extra_attrs =>
          [{1, 5017},
           {4, 944},
           {5, 736},
           {6, 722},
           {7, 427},
           {3, 228}]};
get_lev_cfg({1019, 53}) ->
    #{base_attrs =>
          [{1, 3412},
           {4, 642},
           {5, 500},
           {6, 491},
           {7, 290},
           {3, 155},
           {2, 3018},
           {26, 81},
           {25, 81}],
      extra_attrs =>
          [{1, 5118},
           {4, 963},
           {5, 751},
           {6, 737},
           {7, 436},
           {3, 233}]};
get_lev_cfg({1019, 54}) ->
    #{base_attrs =>
          [{1, 3480},
           {4, 655},
           {5, 510},
           {6, 501},
           {7, 296},
           {3, 158},
           {2, 3021},
           {26, 83},
           {25, 83}],
      extra_attrs =>
          [{1, 5220},
           {4, 982},
           {5, 766},
           {6, 751},
           {7, 445},
           {3, 237}]};
get_lev_cfg({1019, 55}) ->
    #{base_attrs =>
          [{1, 3547},
           {4, 667},
           {5, 520},
           {6, 510},
           {7, 302},
           {3, 161},
           {2, 3024},
           {26, 86},
           {25, 86}],
      extra_attrs =>
          [{1, 5321},
           {4, 1001},
           {5, 781},
           {6, 766},
           {7, 453},
           {3, 242}]};
get_lev_cfg({1019, 56}) ->
    #{base_attrs =>
          [{1, 3615},
           {4, 680},
           {5, 530},
           {6, 520},
           {7, 308},
           {3, 164},
           {2, 3027},
           {26, 88},
           {25, 88}],
      extra_attrs =>
          [{1, 5422},
           {4, 1020},
           {5, 796},
           {6, 780},
           {7, 462},
           {3, 246}]};
get_lev_cfg({1019, 57}) ->
    #{base_attrs =>
          [{1, 3682},
           {4, 693},
           {5, 540},
           {6, 530},
           {7, 313},
           {3, 167},
           {2, 3030},
           {26, 90},
           {25, 90}],
      extra_attrs =>
          [{1, 5524},
           {4, 1039},
           {5, 810},
           {6, 795},
           {7, 470},
           {3, 251}]};
get_lev_cfg({1019, 58}) ->
    #{base_attrs =>
          [{1, 3750},
           {4, 706},
           {5, 550},
           {6, 539},
           {7, 319},
           {3, 170},
           {2, 3033},
           {26, 93},
           {25, 93}],
      extra_attrs =>
          [{1, 5625},
           {4, 1059},
           {5, 825},
           {6, 809},
           {7, 479},
           {3, 256}]};
get_lev_cfg({1019, 59}) ->
    #{base_attrs =>
          [{1, 3817},
           {4, 718},
           {5, 560},
           {6, 549},
           {7, 325},
           {3, 173},
           {2, 3036},
           {26, 95},
           {25, 95}],
      extra_attrs =>
          [{1, 5726},
           {4, 1078},
           {5, 840},
           {6, 824},
           {7, 488},
           {3, 260}]};
get_lev_cfg({1019, 60}) ->
    #{base_attrs =>
          [{1, 3962},
           {4, 745},
           {5, 581},
           {6, 570},
           {7, 337},
           {3, 180},
           {2, 3039},
           {26, 98},
           {25, 98}],
      extra_attrs =>
          [{1, 5943},
           {4, 1118},
           {5, 872},
           {6, 855},
           {7, 506},
           {3, 270}]};
get_lev_cfg({1019, 61}) ->
    #{base_attrs =>
          [{1, 4070},
           {4, 766},
           {5, 597},
           {6, 586},
           {7, 347},
           {3, 185},
           {2, 3042},
           {26, 100},
           {25, 100}],
      extra_attrs =>
          [{1, 6105},
           {4, 1149},
           {5, 896},
           {6, 879},
           {7, 520},
           {3, 277}]};
get_lev_cfg({1019, 62}) ->
    #{base_attrs =>
          [{1, 4178},
           {4, 786},
           {5, 613},
           {6, 601},
           {7, 356},
           {3, 190},
           {2, 3045},
           {26, 102},
           {25, 102}],
      extra_attrs =>
          [{1, 6267},
           {4, 1179},
           {5, 919},
           {6, 902},
           {7, 534},
           {3, 285}]};
get_lev_cfg({1019, 63}) ->
    #{base_attrs =>
          [{1, 4284},
           {4, 806},
           {5, 628},
           {6, 616},
           {7, 365},
           {3, 195},
           {2, 3048},
           {26, 105},
           {25, 105}],
      extra_attrs =>
          [{1, 6426},
           {4, 1209},
           {5, 943},
           {6, 925},
           {7, 547},
           {3, 292}]};
get_lev_cfg({1019, 64}) ->
    #{base_attrs =>
          [{1, 4390},
           {4, 826},
           {5, 644},
           {6, 632},
           {7, 374},
           {3, 199},
           {2, 3051},
           {26, 107},
           {25, 107}],
      extra_attrs =>
          [{1, 6585},
           {4, 1239},
           {5, 966},
           {6, 948},
           {7, 561},
           {3, 299}]};
get_lev_cfg({1019, 65}) ->
    #{base_attrs =>
          [{1, 4494},
           {4, 846},
           {5, 659},
           {6, 647},
           {7, 383},
           {3, 204},
           {2, 3054},
           {26, 110},
           {25, 110}],
      extra_attrs =>
          [{1, 6741},
           {4, 1269},
           {5, 989},
           {6, 970},
           {7, 574},
           {3, 306}]};
get_lev_cfg({1019, 66}) ->
    #{base_attrs =>
          [{1, 4598},
           {4, 865},
           {5, 675},
           {6, 662},
           {7, 392},
           {3, 209},
           {2, 3057},
           {26, 112},
           {25, 112}],
      extra_attrs =>
          [{1, 6898},
           {4, 1298},
           {5, 1012},
           {6, 993},
           {7, 588},
           {3, 314}]};
get_lev_cfg({1019, 67}) ->
    #{base_attrs =>
          [{1, 4701},
           {4, 885},
           {5, 690},
           {6, 676},
           {7, 400},
           {3, 214},
           {2, 3060},
           {26, 114},
           {25, 114}],
      extra_attrs =>
          [{1, 7052},
           {4, 1327},
           {5, 1035},
           {6, 1015},
           {7, 601},
           {3, 321}]};
get_lev_cfg({1019, 68}) ->
    #{base_attrs =>
          [{1, 4803},
           {4, 904},
           {5, 705},
           {6, 691},
           {7, 409},
           {3, 218},
           {2, 3063},
           {26, 117},
           {25, 117}],
      extra_attrs =>
          [{1, 7205},
           {4, 1356},
           {5, 1057},
           {6, 1037},
           {7, 614},
           {3, 328}]};
get_lev_cfg({1019, 69}) ->
    #{base_attrs =>
          [{1, 4905},
           {4, 923},
           {5, 720},
           {6, 706},
           {7, 418},
           {3, 223},
           {2, 3066},
           {26, 119},
           {25, 119}],
      extra_attrs =>
          [{1, 7357},
           {4, 1385},
           {5, 1080},
           {6, 1059},
           {7, 627},
           {3, 334}]};
get_lev_cfg({1019, 70}) ->
    #{base_attrs =>
          [{1, 5005},
           {4, 942},
           {5, 734},
           {6, 720},
           {7, 426},
           {3, 227},
           {2, 3070},
           {26, 122},
           {25, 122}],
      extra_attrs =>
          [{1, 7508},
           {4, 1413},
           {5, 1102},
           {6, 1081},
           {7, 640},
           {3, 341}]};
get_lev_cfg({1019, 71}) ->
    #{base_attrs =>
          [{1, 5104},
           {4, 961},
           {5, 749},
           {6, 735},
           {7, 435},
           {3, 232},
           {2, 3074},
           {26, 124},
           {25, 124}],
      extra_attrs =>
          [{1, 7657},
           {4, 1441},
           {5, 1124},
           {6, 1102},
           {7, 652},
           {3, 348}]};
get_lev_cfg({1019, 72}) ->
    #{base_attrs =>
          [{1, 5203},
           {4, 979},
           {5, 763},
           {6, 749},
           {7, 443},
           {3, 236},
           {2, 3078},
           {26, 126},
           {25, 126}],
      extra_attrs =>
          [{1, 7805},
           {4, 1469},
           {5, 1145},
           {6, 1123},
           {7, 665},
           {3, 355}]};
get_lev_cfg({1019, 73}) ->
    #{base_attrs =>
          [{1, 5301},
           {4, 998},
           {5, 778},
           {6, 763},
           {7, 452},
           {3, 241},
           {2, 3082},
           {26, 129},
           {25, 129}],
      extra_attrs =>
          [{1, 7952},
           {4, 1497},
           {5, 1167},
           {6, 1144},
           {7, 678},
           {3, 362}]};
get_lev_cfg({1019, 74}) ->
    #{base_attrs =>
          [{1, 5398},
           {4, 1016},
           {5, 792},
           {6, 777},
           {7, 460},
           {3, 245},
           {2, 3086},
           {26, 131},
           {25, 131}],
      extra_attrs =>
          [{1, 8097},
           {4, 1524},
           {5, 1188},
           {6, 1165},
           {7, 690},
           {3, 368}]};
get_lev_cfg({1019, 75}) ->
    #{base_attrs =>
          [{1, 5494},
           {4, 1034},
           {5, 806},
           {6, 791},
           {7, 468},
           {3, 250},
           {2, 3090},
           {26, 134},
           {25, 134}],
      extra_attrs =>
          [{1, 8241},
           {4, 1551},
           {5, 1209},
           {6, 1186},
           {7, 702},
           {3, 375}]};
get_lev_cfg({1019, 76}) ->
    #{base_attrs =>
          [{1, 5589},
           {4, 1052},
           {5, 820},
           {6, 804},
           {7, 476},
           {3, 254},
           {2, 3094},
           {26, 136},
           {25, 136}],
      extra_attrs =>
          [{1, 8384},
           {4, 1578},
           {5, 1230},
           {6, 1207},
           {7, 714},
           {3, 381}]};
get_lev_cfg({1019, 77}) ->
    #{base_attrs =>
          [{1, 5683},
           {4, 1070},
           {5, 834},
           {6, 818},
           {7, 484},
           {3, 258},
           {2, 3098},
           {26, 138},
           {25, 138}],
      extra_attrs =>
          [{1, 8525},
           {4, 1605},
           {5, 1251},
           {6, 1227},
           {7, 726},
           {3, 388}]};
get_lev_cfg({1019, 78}) ->
    #{base_attrs =>
          [{1, 5777},
           {4, 1087},
           {5, 848},
           {6, 831},
           {7, 492},
           {3, 263},
           {2, 3102},
           {26, 141},
           {25, 141}],
      extra_attrs =>
          [{1, 8666},
           {4, 1631},
           {5, 1272},
           {6, 1247},
           {7, 738},
           {3, 394}]};
get_lev_cfg({1019, 79}) ->
    #{base_attrs =>
          [{1, 5870},
           {4, 1105},
           {5, 861},
           {6, 845},
           {7, 500},
           {3, 267},
           {2, 3106},
           {26, 143},
           {25, 143}],
      extra_attrs =>
          [{1, 8805},
           {4, 1657},
           {5, 1292},
           {6, 1267},
           {7, 750},
           {3, 400}]};
get_lev_cfg({1019, 80}) ->
    #{base_attrs =>
          [{1, 5962},
           {4, 1122},
           {5, 875},
           {6, 858},
           {7, 508},
           {3, 271},
           {2, 3110},
           {26, 146},
           {25, 146}],
      extra_attrs =>
          [{1, 8943},
           {4, 1683},
           {5, 1312},
           {6, 1287},
           {7, 762},
           {3, 407}]};
get_lev_cfg({1019, 81}) ->
    #{base_attrs =>
          [{1, 6052},
           {4, 1139},
           {5, 888},
           {6, 871},
           {7, 516},
           {3, 275},
           {2, 3114},
           {26, 148},
           {25, 148}],
      extra_attrs =>
          [{1, 9079},
           {4, 1709},
           {5, 1332},
           {6, 1307},
           {7, 774},
           {3, 413}]};
get_lev_cfg({1019, 82}) ->
    #{base_attrs =>
          [{1, 6142},
           {4, 1156},
           {5, 901},
           {6, 884},
           {7, 523},
           {3, 279},
           {2, 3118},
           {26, 150},
           {25, 150}],
      extra_attrs =>
          [{1, 9214},
           {4, 1734},
           {5, 1352},
           {6, 1326},
           {7, 785},
           {3, 419}]};
get_lev_cfg({1019, 83}) ->
    #{base_attrs =>
          [{1, 6231},
           {4, 1173},
           {5, 914},
           {6, 897},
           {7, 531},
           {3, 283},
           {2, 3122},
           {26, 153},
           {25, 153}],
      extra_attrs =>
          [{1, 9347},
           {4, 1759},
           {5, 1372},
           {6, 1345},
           {7, 797},
           {3, 425}]};
get_lev_cfg({1019, 84}) ->
    #{base_attrs =>
          [{1, 6320},
           {4, 1189},
           {5, 927},
           {6, 910},
           {7, 538},
           {3, 287},
           {2, 3126},
           {26, 155},
           {25, 155}],
      extra_attrs =>
          [{1, 9480},
           {4, 1784},
           {5, 1391},
           {6, 1365},
           {7, 808},
           {3, 431}]};
get_lev_cfg({1019, 85}) ->
    #{base_attrs =>
          [{1, 6407},
           {4, 1206},
           {5, 940},
           {6, 922},
           {7, 546},
           {3, 291},
           {2, 3130},
           {26, 158},
           {25, 158}],
      extra_attrs =>
          [{1, 9611},
           {4, 1809},
           {5, 1410},
           {6, 1383},
           {7, 819},
           {3, 437}]};
get_lev_cfg({1019, 86}) ->
    #{base_attrs =>
          [{1, 6494},
           {4, 1222},
           {5, 953},
           {6, 935},
           {7, 553},
           {3, 295},
           {2, 3134},
           {26, 160},
           {25, 160}],
      extra_attrs =>
          [{1, 9741},
           {4, 1833},
           {5, 1430},
           {6, 1402},
           {7, 830},
           {3, 443}]};
get_lev_cfg({1019, 87}) ->
    #{base_attrs =>
          [{1, 6579},
           {4, 1238},
           {5, 965},
           {6, 947},
           {7, 561},
           {3, 299},
           {2, 3138},
           {26, 162},
           {25, 162}],
      extra_attrs =>
          [{1, 9869},
           {4, 1858},
           {5, 1448},
           {6, 1421},
           {7, 841},
           {3, 449}]};
get_lev_cfg({1019, 88}) ->
    #{base_attrs =>
          [{1, 6665},
           {4, 1254},
           {5, 978},
           {6, 959},
           {7, 568},
           {3, 303},
           {2, 3142},
           {26, 165},
           {25, 165}],
      extra_attrs =>
          [{1, 9997},
           {4, 1882},
           {5, 1467},
           {6, 1439},
           {7, 852},
           {3, 455}]};
get_lev_cfg({1019, 89}) ->
    #{base_attrs =>
          [{1, 6748},
           {4, 1270},
           {5, 990},
           {6, 971},
           {7, 575},
           {3, 307},
           {2, 3146},
           {26, 167},
           {25, 167}],
      extra_attrs =>
          [{1, 10123},
           {4, 1905},
           {5, 1486},
           {6, 1457},
           {7, 863},
           {3, 460}]};
get_lev_cfg({1019, 90}) ->
    #{base_attrs =>
          [{1, 6832},
           {4, 1286},
           {5, 1002},
           {6, 983},
           {7, 582},
           {3, 311},
           {2, 3151},
           {26, 170},
           {25, 170}],
      extra_attrs =>
          [{1, 10248},
           {4, 1929},
           {5, 1504},
           {6, 1475},
           {7, 873},
           {3, 466}]};
get_lev_cfg({1019, 91}) ->
    #{base_attrs =>
          [{1, 6914},
           {4, 1301},
           {5, 1014},
           {6, 995},
           {7, 589},
           {3, 314},
           {2, 3156},
           {26, 172},
           {25, 172}],
      extra_attrs =>
          [{1, 10371},
           {4, 1952},
           {5, 1522},
           {6, 1493},
           {7, 884},
           {3, 472}]};
get_lev_cfg({1019, 92}) ->
    #{base_attrs =>
          [{1, 6995},
           {4, 1317},
           {5, 1026},
           {6, 1007},
           {7, 596},
           {3, 318},
           {2, 3161},
           {26, 174},
           {25, 174}],
      extra_attrs =>
          [{1, 10493},
           {4, 1975},
           {5, 1540},
           {6, 1510},
           {7, 894},
           {3, 477}]};
get_lev_cfg({1019, 93}) ->
    #{base_attrs =>
          [{1, 7076},
           {4, 1332},
           {5, 1038},
           {6, 1018},
           {7, 603},
           {3, 322},
           {2, 3166},
           {26, 177},
           {25, 177}],
      extra_attrs =>
          [{1, 10614},
           {4, 1998},
           {5, 1558},
           {6, 1528},
           {7, 905},
           {3, 483}]};
get_lev_cfg({1019, 94}) ->
    #{base_attrs =>
          [{1, 7156},
           {4, 1347},
           {5, 1050},
           {6, 1030},
           {7, 610},
           {3, 325},
           {2, 3171},
           {26, 179},
           {25, 179}],
      extra_attrs =>
          [{1, 10734},
           {4, 2020},
           {5, 1575},
           {6, 1545},
           {7, 915},
           {3, 488}]};
get_lev_cfg({1019, 95}) ->
    #{base_attrs =>
          [{1, 7234},
           {4, 1362},
           {5, 1062},
           {6, 1041},
           {7, 616},
           {3, 329},
           {2, 3176},
           {26, 182},
           {25, 182}],
      extra_attrs =>
          [{1, 10852},
           {4, 2043},
           {5, 1593},
           {6, 1562},
           {7, 925},
           {3, 494}]};
get_lev_cfg({1019, 96}) ->
    #{base_attrs =>
          [{1, 7312},
           {4, 1376},
           {5, 1073},
           {6, 1052},
           {7, 623},
           {3, 332},
           {2, 3181},
           {26, 184},
           {25, 184}],
      extra_attrs =>
          [{1, 10969},
           {4, 2065},
           {5, 1610},
           {6, 1579},
           {7, 935},
           {3, 499}]};
get_lev_cfg({1019, 97}) ->
    #{base_attrs =>
          [{1, 7389},
           {4, 1391},
           {5, 1084},
           {6, 1064},
           {7, 630},
           {3, 336},
           {2, 3186},
           {26, 186},
           {25, 186}],
      extra_attrs =>
          [{1, 11084},
           {4, 2086},
           {5, 1627},
           {6, 1596},
           {7, 945},
           {3, 504}]};
get_lev_cfg({1019, 98}) ->
    #{base_attrs =>
          [{1, 7465},
           {4, 1405},
           {5, 1095},
           {6, 1074},
           {7, 636},
           {3, 339},
           {2, 3191},
           {26, 189},
           {25, 189}],
      extra_attrs =>
          [{1, 11198},
           {4, 2108},
           {5, 1643},
           {6, 1612},
           {7, 954},
           {3, 509}]};
get_lev_cfg({1019, 99}) ->
    #{base_attrs =>
          [{1, 7541},
           {4, 1419},
           {5, 1107},
           {6, 1085},
           {7, 643},
           {3, 343},
           {2, 3196},
           {26, 191},
           {25, 191}],
      extra_attrs =>
          [{1, 11312},
           {4, 2129},
           {5, 1660},
           {6, 1628},
           {7, 964},
           {3, 514}]};
get_lev_cfg({1019, 100}) ->
    #{base_attrs =>
          [{1, 7615},
           {4, 1433},
           {5, 1117},
           {6, 1096},
           {7, 649},
           {3, 346},
           {2, 3201},
           {26, 194},
           {25, 194}],
      extra_attrs =>
          [{1, 11423},
           {4, 2150},
           {5, 1676},
           {6, 1644},
           {7, 974},
           {3, 520}]};
get_lev_cfg({1019, 101}) ->
    #{base_attrs =>
          [{1, 7689},
           {4, 1447},
           {5, 1128},
           {6, 1107},
           {7, 655},
           {3, 350},
           {2, 3201},
           {26, 197},
           {25, 197}],
      extra_attrs =>
          [{1, 11534},
           {4, 2171},
           {5, 1693},
           {6, 1660},
           {7, 983},
           {3, 525}]};
get_lev_cfg({1019, 102}) ->
    #{base_attrs =>
          [{1, 7762},
           {4, 1461},
           {5, 1139},
           {6, 1117},
           {7, 661},
           {3, 353},
           {2, 3201},
           {26, 200},
           {25, 200}],
      extra_attrs =>
          [{1, 11643},
           {4, 2191},
           {5, 1709},
           {6, 1676},
           {7, 992},
           {3, 530}]};
get_lev_cfg({1019, 103}) ->
    #{base_attrs =>
          [{1, 7834},
           {4, 1474},
           {5, 1149},
           {6, 1127},
           {7, 667},
           {3, 356},
           {2, 3201},
           {26, 203},
           {25, 203}],
      extra_attrs =>
          [{1, 11751},
           {4, 2212},
           {5, 1724},
           {6, 1691},
           {7, 1001},
           {3, 534}]};
get_lev_cfg({1019, 104}) ->
    #{base_attrs =>
          [{1, 7905},
           {4, 1488},
           {5, 1160},
           {6, 1138},
           {7, 674},
           {3, 359},
           {2, 3201},
           {26, 206},
           {25, 206}],
      extra_attrs =>
          [{1, 11857},
           {4, 2232},
           {5, 1740},
           {6, 1707},
           {7, 1011},
           {3, 539}]};
get_lev_cfg({1019, 105}) ->
    #{base_attrs =>
          [{1, 7975},
           {4, 1501},
           {5, 1170},
           {6, 1148},
           {7, 679},
           {3, 363},
           {2, 3201},
           {26, 206},
           {25, 206}],
      extra_attrs =>
          [{1, 11963},
           {4, 2252},
           {5, 1756},
           {6, 1722},
           {7, 1019},
           {3, 544}]};
get_lev_cfg({1019, 106}) ->
    #{base_attrs =>
          [{1, 8044},
           {4, 1514},
           {5, 1180},
           {6, 1158},
           {7, 685},
           {3, 366},
           {2, 3201},
           {26, 212},
           {25, 212}],
      extra_attrs =>
          [{1, 12066},
           {4, 2271},
           {5, 1771},
           {6, 1737},
           {7, 1028},
           {3, 549}]};
get_lev_cfg({1019, 107}) ->
    #{base_attrs =>
          [{1, 8113},
           {4, 1527},
           {5, 1190},
           {6, 1168},
           {7, 691},
           {3, 369},
           {2, 3201},
           {26, 215},
           {25, 215}],
      extra_attrs =>
          [{1, 12169},
           {4, 2291},
           {5, 1786},
           {6, 1752},
           {7, 1037},
           {3, 553}]};
get_lev_cfg({1019, 108}) ->
    #{base_attrs =>
          [{1, 8180},
           {4, 1540},
           {5, 1200},
           {6, 1177},
           {7, 697},
           {3, 372},
           {2, 3201},
           {26, 218},
           {25, 218}],
      extra_attrs =>
          [{1, 12271},
           {4, 2310},
           {5, 1801},
           {6, 1766},
           {7, 1046},
           {3, 558}]};
get_lev_cfg({1019, 109}) ->
    #{base_attrs =>
          [{1, 8247},
           {4, 1552},
           {5, 1210},
           {6, 1187},
           {7, 703},
           {3, 375},
           {2, 3201},
           {26, 221},
           {25, 221}],
      extra_attrs =>
          [{1, 12370},
           {4, 2328},
           {5, 1815},
           {6, 1781},
           {7, 1054},
           {3, 563}]};
get_lev_cfg({1019, 110}) ->
    #{base_attrs =>
          [{1, 8313},
           {4, 1565},
           {5, 1220},
           {6, 1196},
           {7, 708},
           {3, 378},
           {2, 3201},
           {26, 224},
           {25, 224}],
      extra_attrs =>
          [{1, 12469},
           {4, 2347},
           {5, 1830},
           {6, 1795},
           {7, 1063},
           {3, 567}]};
get_lev_cfg({1019, 111}) ->
    #{base_attrs =>
          [{1, 8378},
           {4, 1577},
           {5, 1229},
           {6, 1206},
           {7, 714},
           {3, 381},
           {2, 3201},
           {26, 227},
           {25, 227}],
      extra_attrs =>
          [{1, 12567},
           {4, 2365},
           {5, 1844},
           {6, 1809},
           {7, 1071},
           {3, 572}]};
get_lev_cfg({1019, 112}) ->
    #{base_attrs =>
          [{1, 8442},
           {4, 1589},
           {5, 1239},
           {6, 1215},
           {7, 719},
           {3, 384},
           {2, 3201},
           {26, 230},
           {25, 230}],
      extra_attrs =>
          [{1, 12663},
           {4, 2384},
           {5, 1858},
           {6, 1823},
           {7, 1079},
           {3, 576}]};
get_lev_cfg({1019, 113}) ->
    #{base_attrs =>
          [{1, 8505},
           {4, 1601},
           {5, 1248},
           {6, 1224},
           {7, 725},
           {3, 387},
           {2, 3201},
           {26, 233},
           {25, 233}],
      extra_attrs =>
          [{1, 12758},
           {4, 2401},
           {5, 1872},
           {6, 1837},
           {7, 1087},
           {3, 580}]};
get_lev_cfg({1019, 114}) ->
    #{base_attrs =>
          [{1, 8567},
           {4, 1613},
           {5, 1257},
           {6, 1233},
           {7, 730},
           {3, 390},
           {2, 3201},
           {26, 236},
           {25, 236}],
      extra_attrs =>
          [{1, 12851},
           {4, 2419},
           {5, 1886},
           {6, 1850},
           {7, 1095},
           {3, 585}]};
get_lev_cfg({1019, 115}) ->
    #{base_attrs =>
          [{1, 8629},
           {4, 1624},
           {5, 1266},
           {6, 1242},
           {7, 735},
           {3, 392},
           {2, 3201},
           {26, 239},
           {25, 239}],
      extra_attrs =>
          [{1, 12944},
           {4, 2436},
           {5, 1900},
           {6, 1863},
           {7, 1103},
           {3, 589}]};
get_lev_cfg({1019, 116}) ->
    #{base_attrs =>
          [{1, 8690},
           {4, 1636},
           {5, 1275},
           {6, 1251},
           {7, 740},
           {3, 395},
           {2, 3201},
           {26, 242},
           {25, 242}],
      extra_attrs =>
          [{1, 13035},
           {4, 2454},
           {5, 1913},
           {6, 1876},
           {7, 1111},
           {3, 593}]};
get_lev_cfg({1019, 117}) ->
    #{base_attrs =>
          [{1, 8750},
           {4, 1647},
           {5, 1284},
           {6, 1259},
           {7, 746},
           {3, 398},
           {2, 3201},
           {26, 245},
           {25, 245}],
      extra_attrs =>
          [{1, 13125},
           {4, 2470},
           {5, 1926},
           {6, 1889},
           {7, 1119},
           {3, 597}]};
get_lev_cfg({1019, 118}) ->
    #{base_attrs =>
          [{1, 8809},
           {4, 1658},
           {5, 1293},
           {6, 1268},
           {7, 751},
           {3, 401},
           {2, 3201},
           {26, 248},
           {25, 248}],
      extra_attrs =>
          [{1, 13213},
           {4, 2487},
           {5, 1939},
           {6, 1902},
           {7, 1126},
           {3, 601}]};
get_lev_cfg({1019, 119}) ->
    #{base_attrs =>
          [{1, 8866},
           {4, 1669},
           {5, 1301},
           {6, 1276},
           {7, 756},
           {3, 403},
           {2, 3201},
           {26, 251},
           {25, 251}],
      extra_attrs =>
          [{1, 13300},
           {4, 2503},
           {5, 1952},
           {6, 1915},
           {7, 1134},
           {3, 605}]};
get_lev_cfg({1019, 120}) ->
    #{base_attrs =>
          [{1, 8924},
           {4, 1680},
           {5, 1310},
           {6, 1284},
           {7, 760},
           {3, 406},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13386},
           {4, 2520},
           {5, 1965},
           {6, 1927},
           {7, 1141},
           {3, 609}]};
get_lev_cfg({1019, 121}) ->
    #{base_attrs =>
          [{1, 8980},
           {4, 1690},
           {5, 1318},
           {6, 1293},
           {7, 765},
           {3, 408},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13471},
           {4, 2536},
           {5, 1977},
           {6, 1939},
           {7, 1148},
           {3, 613}]};
get_lev_cfg({1019, 122}) ->
    #{base_attrs =>
          [{1, 9036},
           {4, 1701},
           {5, 1326},
           {6, 1301},
           {7, 770},
           {3, 411},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13554},
           {4, 2551},
           {5, 1989},
           {6, 1951},
           {7, 1155},
           {3, 617}]};
get_lev_cfg({1019, 123}) ->
    #{base_attrs =>
          [{1, 9090},
           {4, 1711},
           {5, 1334},
           {6, 1308},
           {7, 775},
           {3, 413},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13636},
           {4, 2567},
           {5, 2001},
           {6, 1963},
           {7, 1162},
           {3, 620}]};
get_lev_cfg({1019, 124}) ->
    #{base_attrs =>
          [{1, 9144},
           {4, 1721},
           {5, 1342},
           {6, 1316},
           {7, 779},
           {3, 416},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13717},
           {4, 2582},
           {5, 2013},
           {6, 1975},
           {7, 1169},
           {3, 624}]};
get_lev_cfg({1019, 125}) ->
    #{base_attrs =>
          [{1, 9197},
           {4, 1731},
           {5, 1350},
           {6, 1324},
           {7, 784},
           {3, 418},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13796},
           {4, 2597},
           {5, 2025},
           {6, 1986},
           {7, 1176},
           {3, 628}]};
get_lev_cfg({1019, 126}) ->
    #{base_attrs =>
          [{1, 9249},
           {4, 1741},
           {5, 1357},
           {6, 1331},
           {7, 788},
           {3, 421},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13874},
           {4, 2611},
           {5, 2036},
           {6, 1997},
           {7, 1182},
           {3, 631}]};
get_lev_cfg({1019, 127}) ->
    #{base_attrs =>
          [{1, 9300},
           {4, 1750},
           {5, 1365},
           {6, 1339},
           {7, 793},
           {3, 423},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13951},
           {4, 2626},
           {5, 2047},
           {6, 2008},
           {7, 1189},
           {3, 635}]};
get_lev_cfg({1019, 128}) ->
    #{base_attrs =>
          [{1, 9351},
           {4, 1760},
           {5, 1372},
           {6, 1346},
           {7, 797},
           {3, 425},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 14026},
           {4, 2640},
           {5, 2059},
           {6, 2019},
           {7, 1195},
           {3, 638}]};
get_lev_cfg({1019, 129}) ->
    #{base_attrs =>
          [{1, 9400},
           {4, 1769},
           {5, 1379},
           {6, 1353},
           {7, 801},
           {3, 427},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 14100},
           {4, 2654},
           {5, 2069},
           {6, 2030},
           {7, 1202},
           {3, 641}]};
get_lev_cfg({1019, 130}) ->
    #{base_attrs =>
          [{1, 9449},
           {4, 1778},
           {5, 1387},
           {6, 1360},
           {7, 805},
           {3, 430},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 14173},
           {4, 2668},
           {5, 2080},
           {6, 2040},
           {7, 1208},
           {3, 645}]};
get_lev_cfg({1020, 1}) ->
    #{base_attrs =>
          [{1, 105},
           {4, 46},
           {5, 24},
           {6, 16},
           {7, 14},
           {3, 5},
           {2, 200},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 158}, {4, 69}, {5, 37}, {6, 24}, {7, 21}, {3, 8}]};
get_lev_cfg({1020, 2}) ->
    #{base_attrs =>
          [{1, 126},
           {4, 55},
           {5, 29},
           {6, 19},
           {7, 17},
           {3, 6},
           {2, 576},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 190}, {4, 83}, {5, 44}, {6, 29}, {7, 25}, {3, 9}]};
get_lev_cfg({1020, 3}) ->
    #{base_attrs =>
          [{1, 147},
           {4, 65},
           {5, 34},
           {6, 22},
           {7, 20},
           {3, 7},
           {2, 672},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 221},
           {4, 97},
           {5, 52},
           {6, 34},
           {7, 30},
           {3, 11}]};
get_lev_cfg({1020, 4}) ->
    #{base_attrs =>
          [{1, 168},
           {4, 74},
           {5, 39},
           {6, 25},
           {7, 23},
           {3, 8},
           {2, 767},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 253},
           {4, 111},
           {5, 59},
           {6, 38},
           {7, 34},
           {3, 13}]};
get_lev_cfg({1020, 5}) ->
    #{base_attrs =>
          [{1, 190},
           {4, 83},
           {5, 44},
           {6, 29},
           {7, 25},
           {3, 9},
           {2, 864},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 285},
           {4, 125},
           {5, 66},
           {6, 43},
           {7, 38},
           {3, 14}]};
get_lev_cfg({1020, 6}) ->
    #{base_attrs =>
          [{1, 211},
           {4, 93},
           {5, 49},
           {6, 32},
           {7, 28},
           {3, 10},
           {2, 960},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 316},
           {4, 139},
           {5, 74},
           {6, 48},
           {7, 43},
           {3, 16}]};
get_lev_cfg({1020, 7}) ->
    #{base_attrs =>
          [{1, 232},
           {4, 102},
           {5, 54},
           {6, 35},
           {7, 31},
           {3, 11},
           {2, 1055},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 348},
           {4, 153},
           {5, 81},
           {6, 53},
           {7, 47},
           {3, 17}]};
get_lev_cfg({1020, 8}) ->
    #{base_attrs =>
          [{1, 253},
           {4, 111},
           {5, 59},
           {6, 38},
           {7, 34},
           {3, 13},
           {2, 1152},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 380},
           {4, 167},
           {5, 89},
           {6, 58},
           {7, 51},
           {3, 19}]};
get_lev_cfg({1020, 9}) ->
    #{base_attrs =>
          [{1, 274},
           {4, 121},
           {5, 64},
           {6, 42},
           {7, 37},
           {3, 14},
           {2, 1248},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 411},
           {4, 181},
           {5, 96},
           {6, 63},
           {7, 56},
           {3, 21}]};
get_lev_cfg({1020, 10}) ->
    #{base_attrs =>
          [{1, 316},
           {4, 139},
           {5, 74},
           {6, 48},
           {7, 43},
           {3, 16},
           {2, 1440},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 475},
           {4, 209},
           {5, 111},
           {6, 72},
           {7, 64},
           {3, 24}]};
get_lev_cfg({1020, 11}) ->
    #{base_attrs =>
          [{1, 358},
           {4, 158},
           {5, 84},
           {6, 55},
           {7, 48},
           {3, 18},
           {2, 1631},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 538},
           {4, 237},
           {5, 126},
           {6, 82},
           {7, 73},
           {3, 27}]};
get_lev_cfg({1020, 12}) ->
    #{base_attrs =>
          [{1, 401},
           {4, 177},
           {5, 94},
           {6, 61},
           {7, 54},
           {3, 20},
           {2, 1824},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 601},
           {4, 265},
           {5, 141},
           {6, 92},
           {7, 82},
           {3, 30}]};
get_lev_cfg({1020, 13}) ->
    #{base_attrs =>
          [{1, 443},
           {4, 195},
           {5, 104},
           {6, 68},
           {7, 60},
           {3, 22},
           {2, 2016},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 665},
           {4, 293},
           {5, 156},
           {6, 102},
           {7, 90},
           {3, 34}]};
get_lev_cfg({1020, 14}) ->
    #{base_attrs =>
          [{1, 485},
           {4, 214},
           {5, 114},
           {6, 74},
           {7, 66},
           {3, 24},
           {2, 2207},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 728},
           {4, 321},
           {5, 171},
           {6, 111},
           {7, 99},
           {3, 37}]};
get_lev_cfg({1020, 15}) ->
    #{base_attrs =>
          [{1, 527},
           {4, 233},
           {5, 123},
           {6, 81},
           {7, 72},
           {3, 27},
           {2, 2400},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 791},
           {4, 349},
           {5, 185},
           {6, 121},
           {7, 108},
           {3, 40}]};
get_lev_cfg({1020, 16}) ->
    #{base_attrs =>
          [{1, 570},
           {4, 251},
           {5, 133},
           {6, 87},
           {7, 77},
           {3, 29},
           {2, 2408},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 855},
           {4, 377},
           {5, 200},
           {6, 131},
           {7, 116},
           {3, 43}]};
get_lev_cfg({1020, 17}) ->
    #{base_attrs =>
          [{1, 612},
           {4, 270},
           {5, 143},
           {6, 94},
           {7, 83},
           {3, 31},
           {2, 2417},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 918},
           {4, 405},
           {5, 215},
           {6, 141},
           {7, 125},
           {3, 47}]};
get_lev_cfg({1020, 18}) ->
    #{base_attrs =>
          [{1, 654},
           {4, 289},
           {5, 153},
           {6, 100},
           {7, 89},
           {3, 33},
           {2, 2426},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 981},
           {4, 433},
           {5, 230},
           {6, 150},
           {7, 133},
           {3, 50}]};
get_lev_cfg({1020, 19}) ->
    #{base_attrs =>
          [{1, 696},
           {4, 307},
           {5, 163},
           {6, 107},
           {7, 95},
           {3, 35},
           {2, 2436},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1045},
           {4, 461},
           {5, 245},
           {6, 160},
           {7, 142},
           {3, 53}]};
get_lev_cfg({1020, 20}) ->
    #{base_attrs =>
          [{1, 739},
           {4, 326},
           {5, 173},
           {6, 113},
           {7, 100},
           {3, 37},
           {2, 2446},
           {26, 2},
           {25, 2}],
      extra_attrs =>
          [{1, 1108},
           {4, 489},
           {5, 260},
           {6, 170},
           {7, 151},
           {3, 56}]};
get_lev_cfg({1020, 21}) ->
    #{base_attrs =>
          [{1, 781},
           {4, 344},
           {5, 183},
           {6, 119},
           {7, 106},
           {3, 40},
           {2, 2457},
           {26, 4},
           {25, 4}],
      extra_attrs =>
          [{1, 1171},
           {4, 517},
           {5, 275},
           {6, 179},
           {7, 159},
           {3, 60}]};
get_lev_cfg({1020, 22}) ->
    #{base_attrs =>
          [{1, 823},
           {4, 363},
           {5, 193},
           {6, 126},
           {7, 112},
           {3, 42},
           {2, 2468},
           {26, 6},
           {25, 6}],
      extra_attrs =>
          [{1, 1235},
           {4, 545},
           {5, 290},
           {6, 189},
           {7, 168},
           {3, 63}]};
get_lev_cfg({1020, 23}) ->
    #{base_attrs =>
          [{1, 865},
           {4, 382},
           {5, 203},
           {6, 132},
           {7, 118},
           {3, 44},
           {2, 2480},
           {26, 9},
           {25, 9}],
      extra_attrs =>
          [{1, 1298},
           {4, 573},
           {5, 305},
           {6, 199},
           {7, 177},
           {3, 66}]};
get_lev_cfg({1020, 24}) ->
    #{base_attrs =>
          [{1, 908},
           {4, 400},
           {5, 213},
           {6, 139},
           {7, 123},
           {3, 46},
           {2, 2492},
           {26, 11},
           {25, 11}],
      extra_attrs =>
          [{1, 1362},
           {4, 601},
           {5, 319},
           {6, 209},
           {7, 185},
           {3, 69}]};
get_lev_cfg({1020, 25}) ->
    #{base_attrs =>
          [{1, 950},
           {4, 419},
           {5, 223},
           {6, 145},
           {7, 129},
           {3, 48},
           {2, 2505},
           {26, 14},
           {25, 14}],
      extra_attrs =>
          [{1, 1425},
           {4, 629},
           {5, 334},
           {6, 218},
           {7, 194},
           {3, 73}]};
get_lev_cfg({1020, 26}) ->
    #{base_attrs =>
          [{1, 992},
           {4, 438},
           {5, 233},
           {6, 152},
           {7, 135},
           {3, 50},
           {2, 2518},
           {26, 16},
           {25, 16}],
      extra_attrs =>
          [{1, 1488},
           {4, 657},
           {5, 349},
           {6, 228},
           {7, 203},
           {3, 76}]};
get_lev_cfg({1020, 27}) ->
    #{base_attrs =>
          [{1, 1034},
           {4, 456},
           {5, 243},
           {6, 158},
           {7, 141},
           {3, 53},
           {2, 2532},
           {26, 18},
           {25, 18}],
      extra_attrs =>
          [{1, 1552},
           {4, 685},
           {5, 364},
           {6, 238},
           {7, 211},
           {3, 79}]};
get_lev_cfg({1020, 28}) ->
    #{base_attrs =>
          [{1, 1076},
           {4, 475},
           {5, 252},
           {6, 165},
           {7, 146},
           {3, 55},
           {2, 2546},
           {26, 21},
           {25, 21}],
      extra_attrs =>
          [{1, 1615},
           {4, 713},
           {5, 379},
           {6, 248},
           {7, 220},
           {3, 82}]};
get_lev_cfg({1020, 29}) ->
    #{base_attrs =>
          [{1, 1119},
           {4, 494},
           {5, 262},
           {6, 171},
           {7, 152},
           {3, 57},
           {2, 2561},
           {26, 23},
           {25, 23}],
      extra_attrs =>
          [{1, 1678},
           {4, 741},
           {5, 394},
           {6, 257},
           {7, 229},
           {3, 86}]};
get_lev_cfg({1020, 30}) ->
    #{base_attrs =>
          [{1, 1161},
           {4, 512},
           {5, 272},
           {6, 178},
           {7, 158},
           {3, 59},
           {2, 2576},
           {26, 26},
           {25, 26}],
      extra_attrs =>
          [{1, 1742},
           {4, 769},
           {5, 409},
           {6, 267},
           {7, 237},
           {3, 89}]};
get_lev_cfg({1020, 31}) ->
    #{base_attrs =>
          [{1, 1203},
           {4, 531},
           {5, 282},
           {6, 184},
           {7, 164},
           {3, 61},
           {2, 2592},
           {26, 28},
           {25, 28}],
      extra_attrs =>
          [{1, 1805},
           {4, 797},
           {5, 424},
           {6, 277},
           {7, 246},
           {3, 92}]};
get_lev_cfg({1020, 32}) ->
    #{base_attrs =>
          [{1, 1245},
           {4, 550},
           {5, 292},
           {6, 191},
           {7, 169},
           {3, 63},
           {2, 2608},
           {26, 30},
           {25, 30}],
      extra_attrs =>
          [{1, 1868},
           {4, 825},
           {5, 438},
           {6, 287},
           {7, 254},
           {3, 95}]};
get_lev_cfg({1020, 33}) ->
    #{base_attrs =>
          [{1, 1288},
           {4, 568},
           {5, 302},
           {6, 197},
           {7, 175},
           {3, 66},
           {2, 2625},
           {26, 33},
           {25, 33}],
      extra_attrs =>
          [{1, 1932},
           {4, 853},
           {5, 453},
           {6, 296},
           {7, 263},
           {3, 99}]};
get_lev_cfg({1020, 34}) ->
    #{base_attrs =>
          [{1, 1330},
           {4, 587},
           {5, 312},
           {6, 204},
           {7, 181},
           {3, 68},
           {2, 2642},
           {26, 35},
           {25, 35}],
      extra_attrs =>
          [{1, 1995},
           {4, 881},
           {5, 468},
           {6, 306},
           {7, 272},
           {3, 102}]};
get_lev_cfg({1020, 35}) ->
    #{base_attrs =>
          [{1, 1372},
           {4, 606},
           {5, 322},
           {6, 210},
           {7, 187},
           {3, 70},
           {2, 2660},
           {26, 38},
           {25, 38}],
      extra_attrs =>
          [{1, 2058},
           {4, 909},
           {5, 483},
           {6, 316},
           {7, 280},
           {3, 105}]};
get_lev_cfg({1020, 36}) ->
    #{base_attrs =>
          [{1, 1414},
           {4, 624},
           {5, 332},
           {6, 217},
           {7, 193},
           {3, 72},
           {2, 2678},
           {26, 40},
           {25, 40}],
      extra_attrs =>
          [{1, 2122},
           {4, 937},
           {5, 498},
           {6, 325},
           {7, 289},
           {3, 108}]};
get_lev_cfg({1020, 37}) ->
    #{base_attrs =>
          [{1, 1457},
           {4, 643},
           {5, 342},
           {6, 223},
           {7, 198},
           {3, 74},
           {2, 2697},
           {26, 42},
           {25, 42}],
      extra_attrs =>
          [{1, 2185},
           {4, 965},
           {5, 513},
           {6, 335},
           {7, 298},
           {3, 112}]};
get_lev_cfg({1020, 38}) ->
    #{base_attrs =>
          [{1, 1499},
           {4, 662},
           {5, 352},
           {6, 230},
           {7, 204},
           {3, 76},
           {2, 2716},
           {26, 45},
           {25, 45}],
      extra_attrs =>
          [{1, 2248},
           {4, 993},
           {5, 528},
           {6, 345},
           {7, 306},
           {3, 115}]};
get_lev_cfg({1020, 39}) ->
    #{base_attrs =>
          [{1, 1541},
           {4, 680},
           {5, 362},
           {6, 236},
           {7, 210},
           {3, 79},
           {2, 2736},
           {26, 47},
           {25, 47}],
      extra_attrs =>
          [{1, 2312},
           {4, 1020},
           {5, 543},
           {6, 355},
           {7, 315},
           {3, 118}]};
get_lev_cfg({1020, 40}) ->
    #{base_attrs =>
          [{1, 1583},
           {4, 699},
           {5, 371},
           {6, 243},
           {7, 216},
           {3, 81},
           {2, 2756},
           {26, 50},
           {25, 50}],
      extra_attrs =>
          [{1, 2375},
           {4, 1048},
           {5, 557},
           {6, 364},
           {7, 324},
           {3, 121}]};
get_lev_cfg({1020, 41}) ->
    #{base_attrs =>
          [{1, 1625},
           {4, 717},
           {5, 381},
           {6, 249},
           {7, 221},
           {3, 83},
           {2, 2777},
           {26, 52},
           {25, 52}],
      extra_attrs =>
          [{1, 2438},
           {4, 1076},
           {5, 572},
           {6, 374},
           {7, 332},
           {3, 125}]};
get_lev_cfg({1020, 42}) ->
    #{base_attrs =>
          [{1, 1668},
           {4, 736},
           {5, 391},
           {6, 256},
           {7, 227},
           {3, 85},
           {2, 2798},
           {26, 54},
           {25, 54}],
      extra_attrs =>
          [{1, 2502},
           {4, 1104},
           {5, 587},
           {6, 384},
           {7, 341},
           {3, 128}]};
get_lev_cfg({1020, 43}) ->
    #{base_attrs =>
          [{1, 1710},
           {4, 755},
           {5, 401},
           {6, 262},
           {7, 233},
           {3, 87},
           {2, 2820},
           {26, 57},
           {25, 57}],
      extra_attrs =>
          [{1, 2565},
           {4, 1132},
           {5, 602},
           {6, 394},
           {7, 350},
           {3, 131}]};
get_lev_cfg({1020, 44}) ->
    #{base_attrs =>
          [{1, 1752},
           {4, 773},
           {5, 411},
           {6, 269},
           {7, 239},
           {3, 89},
           {2, 2842},
           {26, 59},
           {25, 59}],
      extra_attrs =>
          [{1, 2629},
           {4, 1160},
           {5, 617},
           {6, 403},
           {7, 358},
           {3, 134}]};
get_lev_cfg({1020, 45}) ->
    #{base_attrs =>
          [{1, 1794},
           {4, 792},
           {5, 421},
           {6, 275},
           {7, 244},
           {3, 92},
           {2, 2865},
           {26, 62},
           {25, 62}],
      extra_attrs =>
          [{1, 2692},
           {4, 1188},
           {5, 632},
           {6, 413},
           {7, 367},
           {3, 138}]};
get_lev_cfg({1020, 46}) ->
    #{base_attrs =>
          [{1, 1837},
           {4, 811},
           {5, 431},
           {6, 282},
           {7, 250},
           {3, 94},
           {2, 2888},
           {26, 64},
           {25, 64}],
      extra_attrs =>
          [{1, 2755},
           {4, 1216},
           {5, 647},
           {6, 423},
           {7, 375},
           {3, 141}]};
get_lev_cfg({1020, 47}) ->
    #{base_attrs =>
          [{1, 1879},
           {4, 829},
           {5, 441},
           {6, 288},
           {7, 256},
           {3, 96},
           {2, 2912},
           {26, 66},
           {25, 66}],
      extra_attrs =>
          [{1, 2819},
           {4, 1244},
           {5, 662},
           {6, 432},
           {7, 384},
           {3, 144}]};
get_lev_cfg({1020, 48}) ->
    #{base_attrs =>
          [{1, 1921},
           {4, 848},
           {5, 451},
           {6, 295},
           {7, 262},
           {3, 98},
           {2, 2936},
           {26, 69},
           {25, 69}],
      extra_attrs =>
          [{1, 2882},
           {4, 1272},
           {5, 676},
           {6, 442},
           {7, 393},
           {3, 147}]};
get_lev_cfg({1020, 49}) ->
    #{base_attrs =>
          [{1, 1963},
           {4, 867},
           {5, 461},
           {6, 301},
           {7, 267},
           {3, 100},
           {2, 2961},
           {26, 71},
           {25, 71}],
      extra_attrs =>
          [{1, 2945},
           {4, 1300},
           {5, 691},
           {6, 452},
           {7, 401},
           {3, 151}]};
get_lev_cfg({1020, 50}) ->
    #{base_attrs =>
          [{1, 2006},
           {4, 885},
           {5, 471},
           {6, 308},
           {7, 273},
           {3, 102},
           {2, 2986},
           {26, 74},
           {25, 74}],
      extra_attrs =>
          [{1, 3009},
           {4, 1328},
           {5, 706},
           {6, 462},
           {7, 410},
           {3, 154}]};
get_lev_cfg({1020, 51}) ->
    #{base_attrs =>
          [{1, 2048},
           {4, 904},
           {5, 481},
           {6, 314},
           {7, 279},
           {3, 105},
           {2, 3012},
           {26, 76},
           {25, 76}],
      extra_attrs =>
          [{1, 3072},
           {4, 1356},
           {5, 721},
           {6, 471},
           {7, 419},
           {3, 157}]};
get_lev_cfg({1020, 52}) ->
    #{base_attrs =>
          [{1, 2090},
           {4, 923},
           {5, 491},
           {6, 321},
           {7, 285},
           {3, 107},
           {2, 3015},
           {26, 78},
           {25, 78}],
      extra_attrs =>
          [{1, 3135},
           {4, 1384},
           {5, 736},
           {6, 481},
           {7, 427},
           {3, 160}]};
get_lev_cfg({1020, 53}) ->
    #{base_attrs =>
          [{1, 2132},
           {4, 941},
           {5, 500},
           {6, 327},
           {7, 290},
           {3, 109},
           {2, 3018},
           {26, 81},
           {25, 81}],
      extra_attrs =>
          [{1, 3199},
           {4, 1412},
           {5, 751},
           {6, 491},
           {7, 436},
           {3, 164}]};
get_lev_cfg({1020, 54}) ->
    #{base_attrs =>
          [{1, 2175},
           {4, 960},
           {5, 510},
           {6, 334},
           {7, 296},
           {3, 111},
           {2, 3021},
           {26, 83},
           {25, 83}],
      extra_attrs =>
          [{1, 3262},
           {4, 1440},
           {5, 766},
           {6, 501},
           {7, 445},
           {3, 167}]};
get_lev_cfg({1020, 55}) ->
    #{base_attrs =>
          [{1, 2217},
           {4, 979},
           {5, 520},
           {6, 340},
           {7, 302},
           {3, 113},
           {2, 3024},
           {26, 86},
           {25, 86}],
      extra_attrs =>
          [{1, 3325},
           {4, 1468},
           {5, 781},
           {6, 510},
           {7, 453},
           {3, 170}]};
get_lev_cfg({1020, 56}) ->
    #{base_attrs =>
          [{1, 2259},
           {4, 997},
           {5, 530},
           {6, 347},
           {7, 308},
           {3, 115},
           {2, 3027},
           {26, 88},
           {25, 88}],
      extra_attrs =>
          [{1, 3389},
           {4, 1496},
           {5, 796},
           {6, 520},
           {7, 462},
           {3, 173}]};
get_lev_cfg({1020, 57}) ->
    #{base_attrs =>
          [{1, 2301},
           {4, 1016},
           {5, 540},
           {6, 353},
           {7, 313},
           {3, 118},
           {2, 3030},
           {26, 90},
           {25, 90}],
      extra_attrs =>
          [{1, 3452},
           {4, 1524},
           {5, 810},
           {6, 530},
           {7, 470},
           {3, 177}]};
get_lev_cfg({1020, 58}) ->
    #{base_attrs =>
          [{1, 2343},
           {4, 1034},
           {5, 550},
           {6, 359},
           {7, 319},
           {3, 120},
           {2, 3033},
           {26, 93},
           {25, 93}],
      extra_attrs =>
          [{1, 3515},
           {4, 1552},
           {5, 825},
           {6, 539},
           {7, 479},
           {3, 180}]};
get_lev_cfg({1020, 59}) ->
    #{base_attrs =>
          [{1, 2386},
           {4, 1053},
           {5, 560},
           {6, 366},
           {7, 325},
           {3, 122},
           {2, 3036},
           {26, 95},
           {25, 95}],
      extra_attrs =>
          [{1, 3579},
           {4, 1580},
           {5, 840},
           {6, 549},
           {7, 488},
           {3, 183}]};
get_lev_cfg({1020, 60}) ->
    #{base_attrs =>
          [{1, 2476},
           {4, 1093},
           {5, 581},
           {6, 380},
           {7, 337},
           {3, 127},
           {2, 3039},
           {26, 98},
           {25, 98}],
      extra_attrs =>
          [{1, 3714},
           {4, 1640},
           {5, 872},
           {6, 570},
           {7, 506},
           {3, 190}]};
get_lev_cfg({1020, 61}) ->
    #{base_attrs =>
          [{1, 2544},
           {4, 1123},
           {5, 597},
           {6, 390},
           {7, 347},
           {3, 130},
           {2, 3042},
           {26, 100},
           {25, 100}],
      extra_attrs =>
          [{1, 3816},
           {4, 1685},
           {5, 896},
           {6, 586},
           {7, 520},
           {3, 195}]};
get_lev_cfg({1020, 62}) ->
    #{base_attrs =>
          [{1, 2611},
           {4, 1153},
           {5, 613},
           {6, 401},
           {7, 356},
           {3, 134},
           {2, 3045},
           {26, 102},
           {25, 102}],
      extra_attrs =>
          [{1, 3916},
           {4, 1729},
           {5, 919},
           {6, 601},
           {7, 534},
           {3, 201}]};
get_lev_cfg({1020, 63}) ->
    #{base_attrs =>
          [{1, 2677},
           {4, 1182},
           {5, 628},
           {6, 411},
           {7, 365},
           {3, 137},
           {2, 3048},
           {26, 105},
           {25, 105}],
      extra_attrs =>
          [{1, 4016},
           {4, 1773},
           {5, 943},
           {6, 616},
           {7, 547},
           {3, 206}]};
get_lev_cfg({1020, 64}) ->
    #{base_attrs =>
          [{1, 2743},
           {4, 1211},
           {5, 644},
           {6, 421},
           {7, 374},
           {3, 140},
           {2, 3051},
           {26, 107},
           {25, 107}],
      extra_attrs =>
          [{1, 4115},
           {4, 1817},
           {5, 966},
           {6, 632},
           {7, 561},
           {3, 211}]};
get_lev_cfg({1020, 65}) ->
    #{base_attrs =>
          [{1, 2809},
           {4, 1240},
           {5, 659},
           {6, 431},
           {7, 383},
           {3, 144},
           {2, 3054},
           {26, 110},
           {25, 110}],
      extra_attrs =>
          [{1, 4213},
           {4, 1860},
           {5, 989},
           {6, 647},
           {7, 574},
           {3, 216}]};
get_lev_cfg({1020, 66}) ->
    #{base_attrs =>
          [{1, 2874},
           {4, 1269},
           {5, 675},
           {6, 441},
           {7, 392},
           {3, 147},
           {2, 3057},
           {26, 112},
           {25, 112}],
      extra_attrs =>
          [{1, 4311},
           {4, 1903},
           {5, 1012},
           {6, 662},
           {7, 588},
           {3, 221}]};
get_lev_cfg({1020, 67}) ->
    #{base_attrs =>
          [{1, 2938},
           {4, 1297},
           {5, 690},
           {6, 451},
           {7, 400},
           {3, 150},
           {2, 3060},
           {26, 114},
           {25, 114}],
      extra_attrs =>
          [{1, 4407},
           {4, 1946},
           {5, 1035},
           {6, 676},
           {7, 601},
           {3, 226}]};
get_lev_cfg({1020, 68}) ->
    #{base_attrs =>
          [{1, 3002},
           {4, 1325},
           {5, 705},
           {6, 461},
           {7, 409},
           {3, 154},
           {2, 3063},
           {26, 117},
           {25, 117}],
      extra_attrs =>
          [{1, 4503},
           {4, 1988},
           {5, 1057},
           {6, 691},
           {7, 614},
           {3, 231}]};
get_lev_cfg({1020, 69}) ->
    #{base_attrs =>
          [{1, 3065},
           {4, 1353},
           {5, 720},
           {6, 470},
           {7, 418},
           {3, 157},
           {2, 3066},
           {26, 119},
           {25, 119}],
      extra_attrs =>
          [{1, 4598},
           {4, 2030},
           {5, 1080},
           {6, 706},
           {7, 627},
           {3, 235}]};
get_lev_cfg({1020, 70}) ->
    #{base_attrs =>
          [{1, 3128},
           {4, 1381},
           {5, 734},
           {6, 480},
           {7, 426},
           {3, 160},
           {2, 3070},
           {26, 122},
           {25, 122}],
      extra_attrs =>
          [{1, 4692},
           {4, 2072},
           {5, 1102},
           {6, 720},
           {7, 640},
           {3, 240}]};
get_lev_cfg({1020, 71}) ->
    #{base_attrs =>
          [{1, 3190},
           {4, 1408},
           {5, 749},
           {6, 490},
           {7, 435},
           {3, 163},
           {2, 3074},
           {26, 124},
           {25, 124}],
      extra_attrs =>
          [{1, 4785},
           {4, 2113},
           {5, 1124},
           {6, 735},
           {7, 652},
           {3, 245}]};
get_lev_cfg({1020, 72}) ->
    #{base_attrs =>
          [{1, 3252},
           {4, 1436},
           {5, 763},
           {6, 499},
           {7, 443},
           {3, 166},
           {2, 3078},
           {26, 126},
           {25, 126}],
      extra_attrs =>
          [{1, 4878},
           {4, 2154},
           {5, 1145},
           {6, 749},
           {7, 665},
           {3, 250}]};
get_lev_cfg({1020, 73}) ->
    #{base_attrs =>
          [{1, 3313},
           {4, 1463},
           {5, 778},
           {6, 508},
           {7, 452},
           {3, 170},
           {2, 3082},
           {26, 129},
           {25, 129}],
      extra_attrs =>
          [{1, 4970},
           {4, 2194},
           {5, 1167},
           {6, 763},
           {7, 678},
           {3, 255}]};
get_lev_cfg({1020, 74}) ->
    #{base_attrs =>
          [{1, 3374},
           {4, 1489},
           {5, 792},
           {6, 518},
           {7, 460},
           {3, 173},
           {2, 3086},
           {26, 131},
           {25, 131}],
      extra_attrs =>
          [{1, 5061},
           {4, 2234},
           {5, 1188},
           {6, 777},
           {7, 690},
           {3, 259}]};
get_lev_cfg({1020, 75}) ->
    #{base_attrs =>
          [{1, 3433},
           {4, 1516},
           {5, 806},
           {6, 527},
           {7, 468},
           {3, 176},
           {2, 3090},
           {26, 134},
           {25, 134}],
      extra_attrs =>
          [{1, 5150},
           {4, 2274},
           {5, 1209},
           {6, 791},
           {7, 702},
           {3, 264}]};
get_lev_cfg({1020, 76}) ->
    #{base_attrs =>
          [{1, 3493},
           {4, 1542},
           {5, 820},
           {6, 536},
           {7, 476},
           {3, 179},
           {2, 3094},
           {26, 136},
           {25, 136}],
      extra_attrs =>
          [{1, 5240},
           {4, 2313},
           {5, 1230},
           {6, 804},
           {7, 714},
           {3, 268}]};
get_lev_cfg({1020, 77}) ->
    #{base_attrs =>
          [{1, 3552},
           {4, 1568},
           {5, 834},
           {6, 545},
           {7, 484},
           {3, 182},
           {2, 3098},
           {26, 138},
           {25, 138}],
      extra_attrs =>
          [{1, 5328},
           {4, 2352},
           {5, 1251},
           {6, 818},
           {7, 726},
           {3, 273}]};
get_lev_cfg({1020, 78}) ->
    #{base_attrs =>
          [{1, 3610},
           {4, 1594},
           {5, 848},
           {6, 554},
           {7, 492},
           {3, 185},
           {2, 3102},
           {26, 141},
           {25, 141}],
      extra_attrs =>
          [{1, 5416},
           {4, 2391},
           {5, 1272},
           {6, 831},
           {7, 738},
           {3, 277}]};
get_lev_cfg({1020, 79}) ->
    #{base_attrs =>
          [{1, 3668},
           {4, 1619},
           {5, 861},
           {6, 563},
           {7, 500},
           {3, 188},
           {2, 3106},
           {26, 143},
           {25, 143}],
      extra_attrs =>
          [{1, 5503},
           {4, 2429},
           {5, 1292},
           {6, 845},
           {7, 750},
           {3, 282}]};
get_lev_cfg({1020, 80}) ->
    #{base_attrs =>
          [{1, 3726},
           {4, 1645},
           {5, 875},
           {6, 572},
           {7, 508},
           {3, 191},
           {2, 3110},
           {26, 146},
           {25, 146}],
      extra_attrs =>
          [{1, 5589},
           {4, 2468},
           {5, 1312},
           {6, 858},
           {7, 762},
           {3, 286}]};
get_lev_cfg({1020, 81}) ->
    #{base_attrs =>
          [{1, 3783},
           {4, 1670},
           {5, 888},
           {6, 581},
           {7, 516},
           {3, 194},
           {2, 3114},
           {26, 148},
           {25, 148}],
      extra_attrs =>
          [{1, 5674},
           {4, 2505},
           {5, 1332},
           {6, 871},
           {7, 774},
           {3, 291}]};
get_lev_cfg({1020, 82}) ->
    #{base_attrs =>
          [{1, 3839},
           {4, 1695},
           {5, 901},
           {6, 589},
           {7, 523},
           {3, 197},
           {2, 3118},
           {26, 150},
           {25, 150}],
      extra_attrs =>
          [{1, 5758},
           {4, 2542},
           {5, 1352},
           {6, 884},
           {7, 785},
           {3, 295}]};
get_lev_cfg({1020, 83}) ->
    #{base_attrs =>
          [{1, 3894},
           {4, 1719},
           {5, 914},
           {6, 598},
           {7, 531},
           {3, 199},
           {2, 3122},
           {26, 153},
           {25, 153}],
      extra_attrs =>
          [{1, 5842},
           {4, 2579},
           {5, 1372},
           {6, 897},
           {7, 797},
           {3, 299}]};
get_lev_cfg({1020, 84}) ->
    #{base_attrs =>
          [{1, 3950},
           {4, 1744},
           {5, 927},
           {6, 606},
           {7, 538},
           {3, 202},
           {2, 3126},
           {26, 155},
           {25, 155}],
      extra_attrs =>
          [{1, 5925},
           {4, 2616},
           {5, 1391},
           {6, 910},
           {7, 808},
           {3, 304}]};
get_lev_cfg({1020, 85}) ->
    #{base_attrs =>
          [{1, 4004},
           {4, 1768},
           {5, 940},
           {6, 615},
           {7, 546},
           {3, 205},
           {2, 3130},
           {26, 158},
           {25, 158}],
      extra_attrs =>
          [{1, 6007},
           {4, 2652},
           {5, 1410},
           {6, 922},
           {7, 819},
           {3, 308}]};
get_lev_cfg({1020, 86}) ->
    #{base_attrs =>
          [{1, 4059},
           {4, 1792},
           {5, 953},
           {6, 623},
           {7, 553},
           {3, 208},
           {2, 3134},
           {26, 160},
           {25, 160}],
      extra_attrs =>
          [{1, 6088},
           {4, 2688},
           {5, 1430},
           {6, 935},
           {7, 830},
           {3, 312}]};
get_lev_cfg({1020, 87}) ->
    #{base_attrs =>
          [{1, 4112},
           {4, 1815},
           {5, 965},
           {6, 631},
           {7, 561},
           {3, 211},
           {2, 3138},
           {26, 162},
           {25, 162}],
      extra_attrs =>
          [{1, 6168},
           {4, 2723},
           {5, 1448},
           {6, 947},
           {7, 841},
           {3, 316}]};
get_lev_cfg({1020, 88}) ->
    #{base_attrs =>
          [{1, 4165},
           {4, 1839},
           {5, 978},
           {6, 639},
           {7, 568},
           {3, 213},
           {2, 3142},
           {26, 165},
           {25, 165}],
      extra_attrs =>
          [{1, 6248},
           {4, 2759},
           {5, 1467},
           {6, 959},
           {7, 852},
           {3, 320}]};
get_lev_cfg({1020, 89}) ->
    #{base_attrs =>
          [{1, 4218},
           {4, 1862},
           {5, 990},
           {6, 647},
           {7, 575},
           {3, 216},
           {2, 3146},
           {26, 167},
           {25, 167}],
      extra_attrs =>
          [{1, 6327},
           {4, 2793},
           {5, 1486},
           {6, 971},
           {7, 863},
           {3, 324}]};
get_lev_cfg({1020, 90}) ->
    #{base_attrs =>
          [{1, 4270},
           {4, 1885},
           {5, 1002},
           {6, 655},
           {7, 582},
           {3, 219},
           {2, 3151},
           {26, 170},
           {25, 170}],
      extra_attrs =>
          [{1, 6405},
           {4, 2828},
           {5, 1504},
           {6, 983},
           {7, 873},
           {3, 328}]};
get_lev_cfg({1020, 91}) ->
    #{base_attrs =>
          [{1, 4321},
           {4, 1908},
           {5, 1014},
           {6, 663},
           {7, 589},
           {3, 221},
           {2, 3156},
           {26, 172},
           {25, 172}],
      extra_attrs =>
          [{1, 6482},
           {4, 2862},
           {5, 1522},
           {6, 995},
           {7, 884},
           {3, 332}]};
get_lev_cfg({1020, 92}) ->
    #{base_attrs =>
          [{1, 4372},
           {4, 1930},
           {5, 1026},
           {6, 671},
           {7, 596},
           {3, 224},
           {2, 3161},
           {26, 174},
           {25, 174}],
      extra_attrs =>
          [{1, 6558},
           {4, 2895},
           {5, 1540},
           {6, 1007},
           {7, 894},
           {3, 336}]};
get_lev_cfg({1020, 93}) ->
    #{base_attrs =>
          [{1, 4422},
           {4, 1952},
           {5, 1038},
           {6, 679},
           {7, 603},
           {3, 226},
           {2, 3166},
           {26, 177},
           {25, 177}],
      extra_attrs =>
          [{1, 6634},
           {4, 2929},
           {5, 1558},
           {6, 1018},
           {7, 905},
           {3, 340}]};
get_lev_cfg({1020, 94}) ->
    #{base_attrs =>
          [{1, 4472},
           {4, 1974},
           {5, 1050},
           {6, 686},
           {7, 610},
           {3, 229},
           {2, 3171},
           {26, 179},
           {25, 179}],
      extra_attrs =>
          [{1, 6708},
           {4, 2962},
           {5, 1575},
           {6, 1030},
           {7, 915},
           {3, 344}]};
get_lev_cfg({1020, 95}) ->
    #{base_attrs =>
          [{1, 4521},
           {4, 1996},
           {5, 1062},
           {6, 694},
           {7, 616},
           {3, 232},
           {2, 3176},
           {26, 182},
           {25, 182}],
      extra_attrs =>
          [{1, 6782},
           {4, 2994},
           {5, 1593},
           {6, 1041},
           {7, 925},
           {3, 348}]};
get_lev_cfg({1020, 96}) ->
    #{base_attrs =>
          [{1, 4570},
           {4, 2018},
           {5, 1073},
           {6, 701},
           {7, 623},
           {3, 234},
           {2, 3181},
           {26, 184},
           {25, 184}],
      extra_attrs =>
          [{1, 6855},
           {4, 3027},
           {5, 1610},
           {6, 1052},
           {7, 935},
           {3, 351}]};
get_lev_cfg({1020, 97}) ->
    #{base_attrs =>
          [{1, 4618},
           {4, 2039},
           {5, 1084},
           {6, 709},
           {7, 630},
           {3, 237},
           {2, 3186},
           {26, 186},
           {25, 186}],
      extra_attrs =>
          [{1, 6927},
           {4, 3059},
           {5, 1627},
           {6, 1064},
           {7, 945},
           {3, 355}]};
get_lev_cfg({1020, 98}) ->
    #{base_attrs =>
          [{1, 4666},
           {4, 2060},
           {5, 1095},
           {6, 716},
           {7, 636},
           {3, 239},
           {2, 3191},
           {26, 189},
           {25, 189}],
      extra_attrs =>
          [{1, 6999},
           {4, 3090},
           {5, 1643},
           {6, 1074},
           {7, 954},
           {3, 359}]};
get_lev_cfg({1020, 99}) ->
    #{base_attrs =>
          [{1, 4713},
           {4, 2081},
           {5, 1107},
           {6, 723},
           {7, 643},
           {3, 241},
           {2, 3196},
           {26, 191},
           {25, 191}],
      extra_attrs =>
          [{1, 7070},
           {4, 3121},
           {5, 1660},
           {6, 1085},
           {7, 964},
           {3, 362}]};
get_lev_cfg({1020, 100}) ->
    #{base_attrs =>
          [{1, 4759},
           {4, 2101},
           {5, 1117},
           {6, 731},
           {7, 649},
           {3, 244},
           {2, 3201},
           {26, 194},
           {25, 194}],
      extra_attrs =>
          [{1, 7139},
           {4, 3152},
           {5, 1676},
           {6, 1096},
           {7, 974},
           {3, 366}]};
get_lev_cfg({1020, 101}) ->
    #{base_attrs =>
          [{1, 4805},
           {4, 2122},
           {5, 1128},
           {6, 738},
           {7, 655},
           {3, 246},
           {2, 3201},
           {26, 197},
           {25, 197}],
      extra_attrs =>
          [{1, 7208},
           {4, 3183},
           {5, 1693},
           {6, 1107},
           {7, 983},
           {3, 369}]};
get_lev_cfg({1020, 102}) ->
    #{base_attrs =>
          [{1, 4851},
           {4, 2142},
           {5, 1139},
           {6, 745},
           {7, 661},
           {3, 248},
           {2, 3201},
           {26, 200},
           {25, 200}],
      extra_attrs =>
          [{1, 7277},
           {4, 3213},
           {5, 1709},
           {6, 1117},
           {7, 992},
           {3, 373}]};
get_lev_cfg({1020, 103}) ->
    #{base_attrs =>
          [{1, 4896},
           {4, 2161},
           {5, 1149},
           {6, 751},
           {7, 667},
           {3, 251},
           {2, 3201},
           {26, 203},
           {25, 203}],
      extra_attrs =>
          [{1, 7344},
           {4, 3242},
           {5, 1724},
           {6, 1127},
           {7, 1001},
           {3, 376}]};
get_lev_cfg({1020, 104}) ->
    #{base_attrs =>
          [{1, 4940},
           {4, 2181},
           {5, 1160},
           {6, 758},
           {7, 674},
           {3, 253},
           {2, 3201},
           {26, 206},
           {25, 206}],
      extra_attrs =>
          [{1, 7411},
           {4, 3272},
           {5, 1740},
           {6, 1138},
           {7, 1011},
           {3, 380}]};
get_lev_cfg({1020, 105}) ->
    #{base_attrs =>
          [{1, 4984},
           {4, 2200},
           {5, 1170},
           {6, 765},
           {7, 679},
           {3, 255},
           {2, 3201},
           {26, 206},
           {25, 206}],
      extra_attrs =>
          [{1, 7476},
           {4, 3301},
           {5, 1756},
           {6, 1148},
           {7, 1019},
           {3, 383}]};
get_lev_cfg({1020, 106}) ->
    #{base_attrs =>
          [{1, 5027},
           {4, 2220},
           {5, 1180},
           {6, 772},
           {7, 685},
           {3, 258},
           {2, 3201},
           {26, 212},
           {25, 212}],
      extra_attrs =>
          [{1, 7541},
           {4, 3330},
           {5, 1771},
           {6, 1158},
           {7, 1028},
           {3, 387}]};
get_lev_cfg({1020, 107}) ->
    #{base_attrs =>
          [{1, 5070},
           {4, 2239},
           {5, 1190},
           {6, 778},
           {7, 691},
           {3, 260},
           {2, 3201},
           {26, 215},
           {25, 215}],
      extra_attrs =>
          [{1, 7606},
           {4, 3358},
           {5, 1786},
           {6, 1168},
           {7, 1037},
           {3, 390}]};
get_lev_cfg({1020, 108}) ->
    #{base_attrs =>
          [{1, 5112},
           {4, 2257},
           {5, 1200},
           {6, 785},
           {7, 697},
           {3, 262},
           {2, 3201},
           {26, 218},
           {25, 218}],
      extra_attrs =>
          [{1, 7669},
           {4, 3386},
           {5, 1801},
           {6, 1177},
           {7, 1046},
           {3, 393}]};
get_lev_cfg({1020, 109}) ->
    #{base_attrs =>
          [{1, 5154},
           {4, 2276},
           {5, 1210},
           {6, 791},
           {7, 703},
           {3, 264},
           {2, 3201},
           {26, 221},
           {25, 221}],
      extra_attrs =>
          [{1, 7731},
           {4, 3414},
           {5, 1815},
           {6, 1187},
           {7, 1054},
           {3, 396}]};
get_lev_cfg({1020, 110}) ->
    #{base_attrs =>
          [{1, 5195},
           {4, 2294},
           {5, 1220},
           {6, 797},
           {7, 708},
           {3, 266},
           {2, 3201},
           {26, 224},
           {25, 224}],
      extra_attrs =>
          [{1, 7793},
           {4, 3441},
           {5, 1830},
           {6, 1196},
           {7, 1063},
           {3, 399}]};
get_lev_cfg({1020, 111}) ->
    #{base_attrs =>
          [{1, 5236},
           {4, 2312},
           {5, 1229},
           {6, 804},
           {7, 714},
           {3, 268},
           {2, 3201},
           {26, 227},
           {25, 227}],
      extra_attrs =>
          [{1, 7854},
           {4, 3468},
           {5, 1844},
           {6, 1206},
           {7, 1071},
           {3, 403}]};
get_lev_cfg({1020, 112}) ->
    #{base_attrs =>
          [{1, 5276},
           {4, 2329},
           {5, 1239},
           {6, 810},
           {7, 719},
           {3, 270},
           {2, 3201},
           {26, 230},
           {25, 230}],
      extra_attrs =>
          [{1, 7914},
           {4, 3494},
           {5, 1858},
           {6, 1215},
           {7, 1079},
           {3, 406}]};
get_lev_cfg({1020, 113}) ->
    #{base_attrs =>
          [{1, 5316},
           {4, 2347},
           {5, 1248},
           {6, 816},
           {7, 725},
           {3, 272},
           {2, 3201},
           {26, 233},
           {25, 233}],
      extra_attrs =>
          [{1, 7974},
           {4, 3521},
           {5, 1872},
           {6, 1224},
           {7, 1087},
           {3, 409}]};
get_lev_cfg({1020, 114}) ->
    #{base_attrs =>
          [{1, 5354},
           {4, 2364},
           {5, 1257},
           {6, 822},
           {7, 730},
           {3, 274},
           {2, 3201},
           {26, 236},
           {25, 236}],
      extra_attrs =>
          [{1, 8032},
           {4, 3546},
           {5, 1886},
           {6, 1233},
           {7, 1095},
           {3, 412}]};
get_lev_cfg({1020, 115}) ->
    #{base_attrs =>
          [{1, 5393},
           {4, 2381},
           {5, 1266},
           {6, 828},
           {7, 735},
           {3, 276},
           {2, 3201},
           {26, 239},
           {25, 239}],
      extra_attrs =>
          [{1, 8090},
           {4, 3572},
           {5, 1900},
           {6, 1242},
           {7, 1103},
           {3, 415}]};
get_lev_cfg({1020, 116}) ->
    #{base_attrs =>
          [{1, 5431},
           {4, 2398},
           {5, 1275},
           {6, 834},
           {7, 740},
           {3, 278},
           {2, 3201},
           {26, 242},
           {25, 242}],
      extra_attrs =>
          [{1, 8147},
           {4, 3597},
           {5, 1913},
           {6, 1251},
           {7, 1111},
           {3, 418}]};
get_lev_cfg({1020, 117}) ->
    #{base_attrs =>
          [{1, 5468},
           {4, 2414},
           {5, 1284},
           {6, 839},
           {7, 746},
           {3, 280},
           {2, 3201},
           {26, 245},
           {25, 245}],
      extra_attrs =>
          [{1, 8203},
           {4, 3622},
           {5, 1926},
           {6, 1259},
           {7, 1119},
           {3, 420}]};
get_lev_cfg({1020, 118}) ->
    #{base_attrs =>
          [{1, 5505},
           {4, 2431},
           {5, 1293},
           {6, 845},
           {7, 751},
           {3, 282},
           {2, 3201},
           {26, 248},
           {25, 248}],
      extra_attrs =>
          [{1, 8258},
           {4, 3646},
           {5, 1939},
           {6, 1268},
           {7, 1126},
           {3, 423}]};
get_lev_cfg({1020, 119}) ->
    #{base_attrs =>
          [{1, 5541},
           {4, 2447},
           {5, 1301},
           {6, 851},
           {7, 756},
           {3, 284},
           {2, 3201},
           {26, 251},
           {25, 251}],
      extra_attrs =>
          [{1, 8312},
           {4, 3670},
           {5, 1952},
           {6, 1276},
           {7, 1134},
           {3, 426}]};
get_lev_cfg({1020, 120}) ->
    #{base_attrs =>
          [{1, 5577},
           {4, 2462},
           {5, 1310},
           {6, 856},
           {7, 760},
           {3, 286},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8366},
           {4, 3694},
           {5, 1965},
           {6, 1284},
           {7, 1141},
           {3, 429}]};
get_lev_cfg({1020, 121}) ->
    #{base_attrs =>
          [{1, 5613},
           {4, 2478},
           {5, 1318},
           {6, 862},
           {7, 765},
           {3, 288},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8419},
           {4, 3717},
           {5, 1977},
           {6, 1293},
           {7, 1148},
           {3, 432}]};
get_lev_cfg({1020, 122}) ->
    #{base_attrs =>
          [{1, 5647},
           {4, 2493},
           {5, 1326},
           {6, 867},
           {7, 770},
           {3, 289},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8471},
           {4, 3740},
           {5, 1989},
           {6, 1301},
           {7, 1155},
           {3, 434}]};
get_lev_cfg({1020, 123}) ->
    #{base_attrs =>
          [{1, 5681},
           {4, 2508},
           {5, 1334},
           {6, 872},
           {7, 775},
           {3, 291},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8522},
           {4, 3763},
           {5, 2001},
           {6, 1308},
           {7, 1162},
           {3, 437}]};
get_lev_cfg({1020, 124}) ->
    #{base_attrs =>
          [{1, 5715},
           {4, 2523},
           {5, 1342},
           {6, 877},
           {7, 779},
           {3, 293},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8573},
           {4, 3785},
           {5, 2013},
           {6, 1316},
           {7, 1169},
           {3, 439}]};
get_lev_cfg({1020, 125}) ->
    #{base_attrs =>
          [{1, 5748},
           {4, 2538},
           {5, 1350},
           {6, 882},
           {7, 784},
           {3, 294},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8622},
           {4, 3807},
           {5, 2025},
           {6, 1324},
           {7, 1176},
           {3, 442}]};
get_lev_cfg({1020, 126}) ->
    #{base_attrs =>
          [{1, 5780},
           {4, 2552},
           {5, 1357},
           {6, 887},
           {7, 788},
           {3, 296},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8671},
           {4, 3828},
           {5, 2036},
           {6, 1331},
           {7, 1182},
           {3, 444}]};
get_lev_cfg({1020, 127}) ->
    #{base_attrs =>
          [{1, 5813},
           {4, 2566},
           {5, 1365},
           {6, 892},
           {7, 793},
           {3, 298},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8719},
           {4, 3850},
           {5, 2047},
           {6, 1339},
           {7, 1189},
           {3, 447}]};
get_lev_cfg({1020, 128}) ->
    #{base_attrs =>
          [{1, 5844},
           {4, 2580},
           {5, 1372},
           {6, 897},
           {7, 797},
           {3, 299},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8766},
           {4, 3870},
           {5, 2059},
           {6, 1346},
           {7, 1195},
           {3, 449}]};
get_lev_cfg({1020, 129}) ->
    #{base_attrs =>
          [{1, 5875},
           {4, 2594},
           {5, 1379},
           {6, 902},
           {7, 801},
           {3, 301},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8812},
           {4, 3891},
           {5, 2069},
           {6, 1353},
           {7, 1202},
           {3, 452}]};
get_lev_cfg({1020, 130}) ->
    #{base_attrs =>
          [{1, 5905},
           {4, 2607},
           {5, 1387},
           {6, 907},
           {7, 805},
           {3, 303},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8858},
           {4, 3911},
           {5, 2080},
           {6, 1360},
           {7, 1208},
           {3, 454}]};
get_lev_cfg({1021, 1}) ->
    #{base_attrs =>
          [{1, 168},
           {4, 31},
           {5, 24},
           {6, 24},
           {7, 14},
           {3, 7},
           {2, 200},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 253},
           {4, 47},
           {5, 37},
           {6, 36},
           {7, 21},
           {3, 11}]};
get_lev_cfg({1021, 2}) ->
    #{base_attrs =>
          [{1, 202},
           {4, 38},
           {5, 29},
           {6, 29},
           {7, 17},
           {3, 9},
           {2, 576},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 304},
           {4, 57},
           {5, 44},
           {6, 43},
           {7, 25},
           {3, 13}]};
get_lev_cfg({1021, 3}) ->
    #{base_attrs =>
          [{1, 236},
           {4, 44},
           {5, 34},
           {6, 34},
           {7, 20},
           {3, 10},
           {2, 672},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 354},
           {4, 66},
           {5, 52},
           {6, 51},
           {7, 30},
           {3, 16}]};
get_lev_cfg({1021, 4}) ->
    #{base_attrs =>
          [{1, 270},
           {4, 50},
           {5, 39},
           {6, 38},
           {7, 23},
           {3, 12},
           {2, 767},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 405},
           {4, 76},
           {5, 59},
           {6, 58},
           {7, 34},
           {3, 18}]};
get_lev_cfg({1021, 5}) ->
    #{base_attrs =>
          [{1, 304},
           {4, 57},
           {5, 44},
           {6, 43},
           {7, 25},
           {3, 13},
           {2, 864},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 456},
           {4, 85},
           {5, 66},
           {6, 65},
           {7, 38},
           {3, 20}]};
get_lev_cfg({1021, 6}) ->
    #{base_attrs =>
          [{1, 337},
           {4, 63},
           {5, 49},
           {6, 48},
           {7, 28},
           {3, 15},
           {2, 960},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 506},
           {4, 95},
           {5, 74},
           {6, 72},
           {7, 43},
           {3, 23}]};
get_lev_cfg({1021, 7}) ->
    #{base_attrs =>
          [{1, 371},
           {4, 69},
           {5, 54},
           {6, 53},
           {7, 31},
           {3, 16},
           {2, 1055},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 557},
           {4, 104},
           {5, 81},
           {6, 80},
           {7, 47},
           {3, 25}]};
get_lev_cfg({1021, 8}) ->
    #{base_attrs =>
          [{1, 405},
           {4, 76},
           {5, 59},
           {6, 58},
           {7, 34},
           {3, 18},
           {2, 1152},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 608},
           {4, 114},
           {5, 89},
           {6, 87},
           {7, 51},
           {3, 27}]};
get_lev_cfg({1021, 9}) ->
    #{base_attrs =>
          [{1, 439},
           {4, 82},
           {5, 64},
           {6, 63},
           {7, 37},
           {3, 19},
           {2, 1248},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 658},
           {4, 124},
           {5, 96},
           {6, 94},
           {7, 56},
           {3, 29}]};
get_lev_cfg({1021, 10}) ->
    #{base_attrs =>
          [{1, 506},
           {4, 95},
           {5, 74},
           {6, 72},
           {7, 43},
           {3, 23},
           {2, 1440},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 760},
           {4, 143},
           {5, 111},
           {6, 109},
           {7, 64},
           {3, 34}]};
get_lev_cfg({1021, 11}) ->
    #{base_attrs =>
          [{1, 574},
           {4, 108},
           {5, 84},
           {6, 82},
           {7, 48},
           {3, 26},
           {2, 1631},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 861},
           {4, 162},
           {5, 126},
           {6, 124},
           {7, 73},
           {3, 39}]};
get_lev_cfg({1021, 12}) ->
    #{base_attrs =>
          [{1, 641},
           {4, 120},
           {5, 94},
           {6, 92},
           {7, 54},
           {3, 29},
           {2, 1824},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 962},
           {4, 181},
           {5, 141},
           {6, 138},
           {7, 82},
           {3, 43}]};
get_lev_cfg({1021, 13}) ->
    #{base_attrs =>
          [{1, 709},
           {4, 133},
           {5, 104},
           {6, 102},
           {7, 60},
           {3, 32},
           {2, 2016},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1064},
           {4, 200},
           {5, 156},
           {6, 153},
           {7, 90},
           {3, 48}]};
get_lev_cfg({1021, 14}) ->
    #{base_attrs =>
          [{1, 777},
           {4, 146},
           {5, 114},
           {6, 111},
           {7, 66},
           {3, 35},
           {2, 2207},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1165},
           {4, 219},
           {5, 171},
           {6, 167},
           {7, 99},
           {3, 53}]};
get_lev_cfg({1021, 15}) ->
    #{base_attrs =>
          [{1, 844},
           {4, 159},
           {5, 123},
           {6, 121},
           {7, 72},
           {3, 38},
           {2, 2400},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1267},
           {4, 238},
           {5, 185},
           {6, 182},
           {7, 108},
           {3, 57}]};
get_lev_cfg({1021, 16}) ->
    #{base_attrs =>
          [{1, 912},
           {4, 171},
           {5, 133},
           {6, 131},
           {7, 77},
           {3, 41},
           {2, 2408},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1368},
           {4, 257},
           {5, 200},
           {6, 197},
           {7, 116},
           {3, 62}]};
get_lev_cfg({1021, 17}) ->
    #{base_attrs =>
          [{1, 979},
           {4, 184},
           {5, 143},
           {6, 141},
           {7, 83},
           {3, 44},
           {2, 2417},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1469},
           {4, 276},
           {5, 215},
           {6, 211},
           {7, 125},
           {3, 66}]};
get_lev_cfg({1021, 18}) ->
    #{base_attrs =>
          [{1, 1047},
           {4, 197},
           {5, 153},
           {6, 150},
           {7, 89},
           {3, 47},
           {2, 2426},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1571},
           {4, 295},
           {5, 230},
           {6, 226},
           {7, 133},
           {3, 71}]};
get_lev_cfg({1021, 19}) ->
    #{base_attrs =>
          [{1, 1114},
           {4, 209},
           {5, 163},
           {6, 160},
           {7, 95},
           {3, 50},
           {2, 2436},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1672},
           {4, 314},
           {5, 245},
           {6, 240},
           {7, 142},
           {3, 76}]};
get_lev_cfg({1021, 20}) ->
    #{base_attrs =>
          [{1, 1182},
           {4, 222},
           {5, 173},
           {6, 170},
           {7, 100},
           {3, 53},
           {2, 2446},
           {26, 2},
           {25, 2}],
      extra_attrs =>
          [{1, 1773},
           {4, 333},
           {5, 260},
           {6, 255},
           {7, 151},
           {3, 80}]};
get_lev_cfg({1021, 21}) ->
    #{base_attrs =>
          [{1, 1250},
           {4, 235},
           {5, 183},
           {6, 179},
           {7, 106},
           {3, 56},
           {2, 2457},
           {26, 4},
           {25, 4}],
      extra_attrs =>
          [{1, 1875},
           {4, 353},
           {5, 275},
           {6, 269},
           {7, 159},
           {3, 85}]};
get_lev_cfg({1021, 22}) ->
    #{base_attrs =>
          [{1, 1317},
           {4, 248},
           {5, 193},
           {6, 189},
           {7, 112},
           {3, 59},
           {2, 2468},
           {26, 6},
           {25, 6}],
      extra_attrs =>
          [{1, 1976},
           {4, 372},
           {5, 290},
           {6, 284},
           {7, 168},
           {3, 89}]};
get_lev_cfg({1021, 23}) ->
    #{base_attrs =>
          [{1, 1385},
           {4, 260},
           {5, 203},
           {6, 199},
           {7, 118},
           {3, 63},
           {2, 2480},
           {26, 9},
           {25, 9}],
      extra_attrs =>
          [{1, 2077},
           {4, 391},
           {5, 305},
           {6, 299},
           {7, 177},
           {3, 94}]};
get_lev_cfg({1021, 24}) ->
    #{base_attrs =>
          [{1, 1452},
           {4, 273},
           {5, 213},
           {6, 209},
           {7, 123},
           {3, 66},
           {2, 2492},
           {26, 11},
           {25, 11}],
      extra_attrs =>
          [{1, 2179},
           {4, 410},
           {5, 319},
           {6, 313},
           {7, 185},
           {3, 99}]};
get_lev_cfg({1021, 25}) ->
    #{base_attrs =>
          [{1, 1520},
           {4, 286},
           {5, 223},
           {6, 218},
           {7, 129},
           {3, 69},
           {2, 2505},
           {26, 14},
           {25, 14}],
      extra_attrs =>
          [{1, 2280},
           {4, 429},
           {5, 334},
           {6, 328},
           {7, 194},
           {3, 103}]};
get_lev_cfg({1021, 26}) ->
    #{base_attrs =>
          [{1, 1587},
           {4, 298},
           {5, 233},
           {6, 228},
           {7, 135},
           {3, 72},
           {2, 2518},
           {26, 16},
           {25, 16}],
      extra_attrs =>
          [{1, 2381},
           {4, 448},
           {5, 349},
           {6, 342},
           {7, 203},
           {3, 108}]};
get_lev_cfg({1021, 27}) ->
    #{base_attrs =>
          [{1, 1655},
           {4, 311},
           {5, 243},
           {6, 238},
           {7, 141},
           {3, 75},
           {2, 2532},
           {26, 18},
           {25, 18}],
      extra_attrs =>
          [{1, 2483},
           {4, 467},
           {5, 364},
           {6, 357},
           {7, 211},
           {3, 113}]};
get_lev_cfg({1021, 28}) ->
    #{base_attrs =>
          [{1, 1723},
           {4, 324},
           {5, 252},
           {6, 248},
           {7, 146},
           {3, 78},
           {2, 2546},
           {26, 21},
           {25, 21}],
      extra_attrs =>
          [{1, 2584},
           {4, 486},
           {5, 379},
           {6, 372},
           {7, 220},
           {3, 117}]};
get_lev_cfg({1021, 29}) ->
    #{base_attrs =>
          [{1, 1790},
           {4, 337},
           {5, 262},
           {6, 257},
           {7, 152},
           {3, 81},
           {2, 2561},
           {26, 23},
           {25, 23}],
      extra_attrs =>
          [{1, 2686},
           {4, 505},
           {5, 394},
           {6, 386},
           {7, 229},
           {3, 122}]};
get_lev_cfg({1021, 30}) ->
    #{base_attrs =>
          [{1, 1858},
           {4, 349},
           {5, 272},
           {6, 267},
           {7, 158},
           {3, 84},
           {2, 2576},
           {26, 26},
           {25, 26}],
      extra_attrs =>
          [{1, 2787},
           {4, 524},
           {5, 409},
           {6, 401},
           {7, 237},
           {3, 126}]};
get_lev_cfg({1021, 31}) ->
    #{base_attrs =>
          [{1, 1925},
           {4, 362},
           {5, 282},
           {6, 277},
           {7, 164},
           {3, 87},
           {2, 2592},
           {26, 28},
           {25, 28}],
      extra_attrs =>
          [{1, 2888},
           {4, 543},
           {5, 424},
           {6, 415},
           {7, 246},
           {3, 131}]};
get_lev_cfg({1021, 32}) ->
    #{base_attrs =>
          [{1, 1993},
           {4, 375},
           {5, 292},
           {6, 287},
           {7, 169},
           {3, 90},
           {2, 2608},
           {26, 30},
           {25, 30}],
      extra_attrs =>
          [{1, 2990},
           {4, 562},
           {5, 438},
           {6, 430},
           {7, 254},
           {3, 136}]};
get_lev_cfg({1021, 33}) ->
    #{base_attrs =>
          [{1, 2060},
           {4, 388},
           {5, 302},
           {6, 296},
           {7, 175},
           {3, 93},
           {2, 2625},
           {26, 33},
           {25, 33}],
      extra_attrs =>
          [{1, 3091},
           {4, 582},
           {5, 453},
           {6, 445},
           {7, 263},
           {3, 140}]};
get_lev_cfg({1021, 34}) ->
    #{base_attrs =>
          [{1, 2128},
           {4, 400},
           {5, 312},
           {6, 306},
           {7, 181},
           {3, 96},
           {2, 2642},
           {26, 35},
           {25, 35}],
      extra_attrs =>
          [{1, 3192},
           {4, 601},
           {5, 468},
           {6, 459},
           {7, 272},
           {3, 145}]};
get_lev_cfg({1021, 35}) ->
    #{base_attrs =>
          [{1, 2196},
           {4, 413},
           {5, 322},
           {6, 316},
           {7, 187},
           {3, 99},
           {2, 2660},
           {26, 38},
           {25, 38}],
      extra_attrs =>
          [{1, 3294},
           {4, 620},
           {5, 483},
           {6, 474},
           {7, 280},
           {3, 149}]};
get_lev_cfg({1021, 36}) ->
    #{base_attrs =>
          [{1, 2263},
           {4, 426},
           {5, 332},
           {6, 325},
           {7, 193},
           {3, 103},
           {2, 2678},
           {26, 40},
           {25, 40}],
      extra_attrs =>
          [{1, 3395},
           {4, 639},
           {5, 498},
           {6, 488},
           {7, 289},
           {3, 154}]};
get_lev_cfg({1021, 37}) ->
    #{base_attrs =>
          [{1, 2331},
           {4, 438},
           {5, 342},
           {6, 335},
           {7, 198},
           {3, 106},
           {2, 2697},
           {26, 42},
           {25, 42}],
      extra_attrs =>
          [{1, 3496},
           {4, 658},
           {5, 513},
           {6, 503},
           {7, 298},
           {3, 159}]};
get_lev_cfg({1021, 38}) ->
    #{base_attrs =>
          [{1, 2398},
           {4, 451},
           {5, 352},
           {6, 345},
           {7, 204},
           {3, 109},
           {2, 2716},
           {26, 45},
           {25, 45}],
      extra_attrs =>
          [{1, 3598},
           {4, 677},
           {5, 528},
           {6, 518},
           {7, 306},
           {3, 163}]};
get_lev_cfg({1021, 39}) ->
    #{base_attrs =>
          [{1, 2466},
           {4, 464},
           {5, 362},
           {6, 355},
           {7, 210},
           {3, 112},
           {2, 2736},
           {26, 47},
           {25, 47}],
      extra_attrs =>
          [{1, 3699},
           {4, 696},
           {5, 543},
           {6, 532},
           {7, 315},
           {3, 168}]};
get_lev_cfg({1021, 40}) ->
    #{base_attrs =>
          [{1, 2534},
           {4, 477},
           {5, 371},
           {6, 364},
           {7, 216},
           {3, 115},
           {2, 2756},
           {26, 50},
           {25, 50}],
      extra_attrs =>
          [{1, 3801},
           {4, 715},
           {5, 557},
           {6, 547},
           {7, 324},
           {3, 173}]};
get_lev_cfg({1021, 41}) ->
    #{base_attrs =>
          [{1, 2601},
           {4, 489},
           {5, 381},
           {6, 374},
           {7, 221},
           {3, 118},
           {2, 2777},
           {26, 52},
           {25, 52}],
      extra_attrs =>
          [{1, 3902},
           {4, 734},
           {5, 572},
           {6, 561},
           {7, 332},
           {3, 177}]};
get_lev_cfg({1021, 42}) ->
    #{base_attrs =>
          [{1, 2669},
           {4, 502},
           {5, 391},
           {6, 384},
           {7, 227},
           {3, 121},
           {2, 2798},
           {26, 54},
           {25, 54}],
      extra_attrs =>
          [{1, 4003},
           {4, 753},
           {5, 587},
           {6, 576},
           {7, 341},
           {3, 182}]};
get_lev_cfg({1021, 43}) ->
    #{base_attrs =>
          [{1, 2736},
           {4, 515},
           {5, 401},
           {6, 394},
           {7, 233},
           {3, 124},
           {2, 2820},
           {26, 57},
           {25, 57}],
      extra_attrs =>
          [{1, 4105},
           {4, 772},
           {5, 602},
           {6, 591},
           {7, 350},
           {3, 186}]};
get_lev_cfg({1021, 44}) ->
    #{base_attrs =>
          [{1, 2804},
           {4, 527},
           {5, 411},
           {6, 403},
           {7, 239},
           {3, 127},
           {2, 2842},
           {26, 59},
           {25, 59}],
      extra_attrs =>
          [{1, 4206},
           {4, 791},
           {5, 617},
           {6, 605},
           {7, 358},
           {3, 191}]};
get_lev_cfg({1021, 45}) ->
    #{base_attrs =>
          [{1, 2871},
           {4, 540},
           {5, 421},
           {6, 413},
           {7, 244},
           {3, 130},
           {2, 2865},
           {26, 62},
           {25, 62}],
      extra_attrs =>
          [{1, 4307},
           {4, 810},
           {5, 632},
           {6, 620},
           {7, 367},
           {3, 196}]};
get_lev_cfg({1021, 46}) ->
    #{base_attrs =>
          [{1, 2939},
           {4, 553},
           {5, 431},
           {6, 423},
           {7, 250},
           {3, 133},
           {2, 2888},
           {26, 64},
           {25, 64}],
      extra_attrs =>
          [{1, 4409},
           {4, 830},
           {5, 647},
           {6, 634},
           {7, 375},
           {3, 200}]};
get_lev_cfg({1021, 47}) ->
    #{base_attrs =>
          [{1, 3007},
           {4, 566},
           {5, 441},
           {6, 432},
           {7, 256},
           {3, 136},
           {2, 2912},
           {26, 66},
           {25, 66}],
      extra_attrs =>
          [{1, 4510},
           {4, 849},
           {5, 662},
           {6, 649},
           {7, 384},
           {3, 205}]};
get_lev_cfg({1021, 48}) ->
    #{base_attrs =>
          [{1, 3074},
           {4, 578},
           {5, 451},
           {6, 442},
           {7, 262},
           {3, 139},
           {2, 2936},
           {26, 69},
           {25, 69}],
      extra_attrs =>
          [{1, 4611},
           {4, 868},
           {5, 676},
           {6, 664},
           {7, 393},
           {3, 209}]};
get_lev_cfg({1021, 49}) ->
    #{base_attrs =>
          [{1, 3142},
           {4, 591},
           {5, 461},
           {6, 452},
           {7, 267},
           {3, 143},
           {2, 2961},
           {26, 71},
           {25, 71}],
      extra_attrs =>
          [{1, 4713},
           {4, 887},
           {5, 691},
           {6, 678},
           {7, 401},
           {3, 214}]};
get_lev_cfg({1021, 50}) ->
    #{base_attrs =>
          [{1, 3209},
           {4, 604},
           {5, 471},
           {6, 462},
           {7, 273},
           {3, 146},
           {2, 2986},
           {26, 74},
           {25, 74}],
      extra_attrs =>
          [{1, 4814},
           {4, 906},
           {5, 706},
           {6, 693},
           {7, 410},
           {3, 219}]};
get_lev_cfg({1021, 51}) ->
    #{base_attrs =>
          [{1, 3277},
           {4, 616},
           {5, 481},
           {6, 471},
           {7, 279},
           {3, 149},
           {2, 3012},
           {26, 76},
           {25, 76}],
      extra_attrs =>
          [{1, 4915},
           {4, 925},
           {5, 721},
           {6, 707},
           {7, 419},
           {3, 223}]};
get_lev_cfg({1021, 52}) ->
    #{base_attrs =>
          [{1, 3344},
           {4, 629},
           {5, 491},
           {6, 481},
           {7, 285},
           {3, 152},
           {2, 3015},
           {26, 78},
           {25, 78}],
      extra_attrs =>
          [{1, 5017},
           {4, 944},
           {5, 736},
           {6, 722},
           {7, 427},
           {3, 228}]};
get_lev_cfg({1021, 53}) ->
    #{base_attrs =>
          [{1, 3412},
           {4, 642},
           {5, 500},
           {6, 491},
           {7, 290},
           {3, 155},
           {2, 3018},
           {26, 81},
           {25, 81}],
      extra_attrs =>
          [{1, 5118},
           {4, 963},
           {5, 751},
           {6, 737},
           {7, 436},
           {3, 233}]};
get_lev_cfg({1021, 54}) ->
    #{base_attrs =>
          [{1, 3480},
           {4, 655},
           {5, 510},
           {6, 501},
           {7, 296},
           {3, 158},
           {2, 3021},
           {26, 83},
           {25, 83}],
      extra_attrs =>
          [{1, 5220},
           {4, 982},
           {5, 766},
           {6, 751},
           {7, 445},
           {3, 237}]};
get_lev_cfg({1021, 55}) ->
    #{base_attrs =>
          [{1, 3547},
           {4, 667},
           {5, 520},
           {6, 510},
           {7, 302},
           {3, 161},
           {2, 3024},
           {26, 86},
           {25, 86}],
      extra_attrs =>
          [{1, 5321},
           {4, 1001},
           {5, 781},
           {6, 766},
           {7, 453},
           {3, 242}]};
get_lev_cfg({1021, 56}) ->
    #{base_attrs =>
          [{1, 3615},
           {4, 680},
           {5, 530},
           {6, 520},
           {7, 308},
           {3, 164},
           {2, 3027},
           {26, 88},
           {25, 88}],
      extra_attrs =>
          [{1, 5422},
           {4, 1020},
           {5, 796},
           {6, 780},
           {7, 462},
           {3, 246}]};
get_lev_cfg({1021, 57}) ->
    #{base_attrs =>
          [{1, 3682},
           {4, 693},
           {5, 540},
           {6, 530},
           {7, 313},
           {3, 167},
           {2, 3030},
           {26, 90},
           {25, 90}],
      extra_attrs =>
          [{1, 5524},
           {4, 1039},
           {5, 810},
           {6, 795},
           {7, 470},
           {3, 251}]};
get_lev_cfg({1021, 58}) ->
    #{base_attrs =>
          [{1, 3750},
           {4, 706},
           {5, 550},
           {6, 539},
           {7, 319},
           {3, 170},
           {2, 3033},
           {26, 93},
           {25, 93}],
      extra_attrs =>
          [{1, 5625},
           {4, 1059},
           {5, 825},
           {6, 809},
           {7, 479},
           {3, 256}]};
get_lev_cfg({1021, 59}) ->
    #{base_attrs =>
          [{1, 3817},
           {4, 718},
           {5, 560},
           {6, 549},
           {7, 325},
           {3, 173},
           {2, 3036},
           {26, 95},
           {25, 95}],
      extra_attrs =>
          [{1, 5726},
           {4, 1078},
           {5, 840},
           {6, 824},
           {7, 488},
           {3, 260}]};
get_lev_cfg({1021, 60}) ->
    #{base_attrs =>
          [{1, 3962},
           {4, 745},
           {5, 581},
           {6, 570},
           {7, 337},
           {3, 180},
           {2, 3039},
           {26, 98},
           {25, 98}],
      extra_attrs =>
          [{1, 5943},
           {4, 1118},
           {5, 872},
           {6, 855},
           {7, 506},
           {3, 270}]};
get_lev_cfg({1021, 61}) ->
    #{base_attrs =>
          [{1, 4070},
           {4, 766},
           {5, 597},
           {6, 586},
           {7, 347},
           {3, 185},
           {2, 3042},
           {26, 100},
           {25, 100}],
      extra_attrs =>
          [{1, 6105},
           {4, 1149},
           {5, 896},
           {6, 879},
           {7, 520},
           {3, 277}]};
get_lev_cfg({1021, 62}) ->
    #{base_attrs =>
          [{1, 4178},
           {4, 786},
           {5, 613},
           {6, 601},
           {7, 356},
           {3, 190},
           {2, 3045},
           {26, 102},
           {25, 102}],
      extra_attrs =>
          [{1, 6267},
           {4, 1179},
           {5, 919},
           {6, 902},
           {7, 534},
           {3, 285}]};
get_lev_cfg({1021, 63}) ->
    #{base_attrs =>
          [{1, 4284},
           {4, 806},
           {5, 628},
           {6, 616},
           {7, 365},
           {3, 195},
           {2, 3048},
           {26, 105},
           {25, 105}],
      extra_attrs =>
          [{1, 6426},
           {4, 1209},
           {5, 943},
           {6, 925},
           {7, 547},
           {3, 292}]};
get_lev_cfg({1021, 64}) ->
    #{base_attrs =>
          [{1, 4390},
           {4, 826},
           {5, 644},
           {6, 632},
           {7, 374},
           {3, 199},
           {2, 3051},
           {26, 107},
           {25, 107}],
      extra_attrs =>
          [{1, 6585},
           {4, 1239},
           {5, 966},
           {6, 948},
           {7, 561},
           {3, 299}]};
get_lev_cfg({1021, 65}) ->
    #{base_attrs =>
          [{1, 4494},
           {4, 846},
           {5, 659},
           {6, 647},
           {7, 383},
           {3, 204},
           {2, 3054},
           {26, 110},
           {25, 110}],
      extra_attrs =>
          [{1, 6741},
           {4, 1269},
           {5, 989},
           {6, 970},
           {7, 574},
           {3, 306}]};
get_lev_cfg({1021, 66}) ->
    #{base_attrs =>
          [{1, 4598},
           {4, 865},
           {5, 675},
           {6, 662},
           {7, 392},
           {3, 209},
           {2, 3057},
           {26, 112},
           {25, 112}],
      extra_attrs =>
          [{1, 6898},
           {4, 1298},
           {5, 1012},
           {6, 993},
           {7, 588},
           {3, 314}]};
get_lev_cfg({1021, 67}) ->
    #{base_attrs =>
          [{1, 4701},
           {4, 885},
           {5, 690},
           {6, 676},
           {7, 400},
           {3, 214},
           {2, 3060},
           {26, 114},
           {25, 114}],
      extra_attrs =>
          [{1, 7052},
           {4, 1327},
           {5, 1035},
           {6, 1015},
           {7, 601},
           {3, 321}]};
get_lev_cfg({1021, 68}) ->
    #{base_attrs =>
          [{1, 4803},
           {4, 904},
           {5, 705},
           {6, 691},
           {7, 409},
           {3, 218},
           {2, 3063},
           {26, 117},
           {25, 117}],
      extra_attrs =>
          [{1, 7205},
           {4, 1356},
           {5, 1057},
           {6, 1037},
           {7, 614},
           {3, 328}]};
get_lev_cfg({1021, 69}) ->
    #{base_attrs =>
          [{1, 4905},
           {4, 923},
           {5, 720},
           {6, 706},
           {7, 418},
           {3, 223},
           {2, 3066},
           {26, 119},
           {25, 119}],
      extra_attrs =>
          [{1, 7357},
           {4, 1385},
           {5, 1080},
           {6, 1059},
           {7, 627},
           {3, 334}]};
get_lev_cfg({1021, 70}) ->
    #{base_attrs =>
          [{1, 5005},
           {4, 942},
           {5, 734},
           {6, 720},
           {7, 426},
           {3, 227},
           {2, 3070},
           {26, 122},
           {25, 122}],
      extra_attrs =>
          [{1, 7508},
           {4, 1413},
           {5, 1102},
           {6, 1081},
           {7, 640},
           {3, 341}]};
get_lev_cfg({1021, 71}) ->
    #{base_attrs =>
          [{1, 5104},
           {4, 961},
           {5, 749},
           {6, 735},
           {7, 435},
           {3, 232},
           {2, 3074},
           {26, 124},
           {25, 124}],
      extra_attrs =>
          [{1, 7657},
           {4, 1441},
           {5, 1124},
           {6, 1102},
           {7, 652},
           {3, 348}]};
get_lev_cfg({1021, 72}) ->
    #{base_attrs =>
          [{1, 5203},
           {4, 979},
           {5, 763},
           {6, 749},
           {7, 443},
           {3, 236},
           {2, 3078},
           {26, 126},
           {25, 126}],
      extra_attrs =>
          [{1, 7805},
           {4, 1469},
           {5, 1145},
           {6, 1123},
           {7, 665},
           {3, 355}]};
get_lev_cfg({1021, 73}) ->
    #{base_attrs =>
          [{1, 5301},
           {4, 998},
           {5, 778},
           {6, 763},
           {7, 452},
           {3, 241},
           {2, 3082},
           {26, 129},
           {25, 129}],
      extra_attrs =>
          [{1, 7952},
           {4, 1497},
           {5, 1167},
           {6, 1144},
           {7, 678},
           {3, 362}]};
get_lev_cfg({1021, 74}) ->
    #{base_attrs =>
          [{1, 5398},
           {4, 1016},
           {5, 792},
           {6, 777},
           {7, 460},
           {3, 245},
           {2, 3086},
           {26, 131},
           {25, 131}],
      extra_attrs =>
          [{1, 8097},
           {4, 1524},
           {5, 1188},
           {6, 1165},
           {7, 690},
           {3, 368}]};
get_lev_cfg({1021, 75}) ->
    #{base_attrs =>
          [{1, 5494},
           {4, 1034},
           {5, 806},
           {6, 791},
           {7, 468},
           {3, 250},
           {2, 3090},
           {26, 134},
           {25, 134}],
      extra_attrs =>
          [{1, 8241},
           {4, 1551},
           {5, 1209},
           {6, 1186},
           {7, 702},
           {3, 375}]};
get_lev_cfg({1021, 76}) ->
    #{base_attrs =>
          [{1, 5589},
           {4, 1052},
           {5, 820},
           {6, 804},
           {7, 476},
           {3, 254},
           {2, 3094},
           {26, 136},
           {25, 136}],
      extra_attrs =>
          [{1, 8384},
           {4, 1578},
           {5, 1230},
           {6, 1207},
           {7, 714},
           {3, 381}]};
get_lev_cfg({1021, 77}) ->
    #{base_attrs =>
          [{1, 5683},
           {4, 1070},
           {5, 834},
           {6, 818},
           {7, 484},
           {3, 258},
           {2, 3098},
           {26, 138},
           {25, 138}],
      extra_attrs =>
          [{1, 8525},
           {4, 1605},
           {5, 1251},
           {6, 1227},
           {7, 726},
           {3, 388}]};
get_lev_cfg({1021, 78}) ->
    #{base_attrs =>
          [{1, 5777},
           {4, 1087},
           {5, 848},
           {6, 831},
           {7, 492},
           {3, 263},
           {2, 3102},
           {26, 141},
           {25, 141}],
      extra_attrs =>
          [{1, 8666},
           {4, 1631},
           {5, 1272},
           {6, 1247},
           {7, 738},
           {3, 394}]};
get_lev_cfg({1021, 79}) ->
    #{base_attrs =>
          [{1, 5870},
           {4, 1105},
           {5, 861},
           {6, 845},
           {7, 500},
           {3, 267},
           {2, 3106},
           {26, 143},
           {25, 143}],
      extra_attrs =>
          [{1, 8805},
           {4, 1657},
           {5, 1292},
           {6, 1267},
           {7, 750},
           {3, 400}]};
get_lev_cfg({1021, 80}) ->
    #{base_attrs =>
          [{1, 5962},
           {4, 1122},
           {5, 875},
           {6, 858},
           {7, 508},
           {3, 271},
           {2, 3110},
           {26, 146},
           {25, 146}],
      extra_attrs =>
          [{1, 8943},
           {4, 1683},
           {5, 1312},
           {6, 1287},
           {7, 762},
           {3, 407}]};
get_lev_cfg({1021, 81}) ->
    #{base_attrs =>
          [{1, 6052},
           {4, 1139},
           {5, 888},
           {6, 871},
           {7, 516},
           {3, 275},
           {2, 3114},
           {26, 148},
           {25, 148}],
      extra_attrs =>
          [{1, 9079},
           {4, 1709},
           {5, 1332},
           {6, 1307},
           {7, 774},
           {3, 413}]};
get_lev_cfg({1021, 82}) ->
    #{base_attrs =>
          [{1, 6142},
           {4, 1156},
           {5, 901},
           {6, 884},
           {7, 523},
           {3, 279},
           {2, 3118},
           {26, 150},
           {25, 150}],
      extra_attrs =>
          [{1, 9214},
           {4, 1734},
           {5, 1352},
           {6, 1326},
           {7, 785},
           {3, 419}]};
get_lev_cfg({1021, 83}) ->
    #{base_attrs =>
          [{1, 6231},
           {4, 1173},
           {5, 914},
           {6, 897},
           {7, 531},
           {3, 283},
           {2, 3122},
           {26, 153},
           {25, 153}],
      extra_attrs =>
          [{1, 9347},
           {4, 1759},
           {5, 1372},
           {6, 1345},
           {7, 797},
           {3, 425}]};
get_lev_cfg({1021, 84}) ->
    #{base_attrs =>
          [{1, 6320},
           {4, 1189},
           {5, 927},
           {6, 910},
           {7, 538},
           {3, 287},
           {2, 3126},
           {26, 155},
           {25, 155}],
      extra_attrs =>
          [{1, 9480},
           {4, 1784},
           {5, 1391},
           {6, 1365},
           {7, 808},
           {3, 431}]};
get_lev_cfg({1021, 85}) ->
    #{base_attrs =>
          [{1, 6407},
           {4, 1206},
           {5, 940},
           {6, 922},
           {7, 546},
           {3, 291},
           {2, 3130},
           {26, 158},
           {25, 158}],
      extra_attrs =>
          [{1, 9611},
           {4, 1809},
           {5, 1410},
           {6, 1383},
           {7, 819},
           {3, 437}]};
get_lev_cfg({1021, 86}) ->
    #{base_attrs =>
          [{1, 6494},
           {4, 1222},
           {5, 953},
           {6, 935},
           {7, 553},
           {3, 295},
           {2, 3134},
           {26, 160},
           {25, 160}],
      extra_attrs =>
          [{1, 9741},
           {4, 1833},
           {5, 1430},
           {6, 1402},
           {7, 830},
           {3, 443}]};
get_lev_cfg({1021, 87}) ->
    #{base_attrs =>
          [{1, 6579},
           {4, 1238},
           {5, 965},
           {6, 947},
           {7, 561},
           {3, 299},
           {2, 3138},
           {26, 162},
           {25, 162}],
      extra_attrs =>
          [{1, 9869},
           {4, 1858},
           {5, 1448},
           {6, 1421},
           {7, 841},
           {3, 449}]};
get_lev_cfg({1021, 88}) ->
    #{base_attrs =>
          [{1, 6665},
           {4, 1254},
           {5, 978},
           {6, 959},
           {7, 568},
           {3, 303},
           {2, 3142},
           {26, 165},
           {25, 165}],
      extra_attrs =>
          [{1, 9997},
           {4, 1882},
           {5, 1467},
           {6, 1439},
           {7, 852},
           {3, 455}]};
get_lev_cfg({1021, 89}) ->
    #{base_attrs =>
          [{1, 6748},
           {4, 1270},
           {5, 990},
           {6, 971},
           {7, 575},
           {3, 307},
           {2, 3146},
           {26, 167},
           {25, 167}],
      extra_attrs =>
          [{1, 10123},
           {4, 1905},
           {5, 1486},
           {6, 1457},
           {7, 863},
           {3, 460}]};
get_lev_cfg({1021, 90}) ->
    #{base_attrs =>
          [{1, 6832},
           {4, 1286},
           {5, 1002},
           {6, 983},
           {7, 582},
           {3, 311},
           {2, 3151},
           {26, 170},
           {25, 170}],
      extra_attrs =>
          [{1, 10248},
           {4, 1929},
           {5, 1504},
           {6, 1475},
           {7, 873},
           {3, 466}]};
get_lev_cfg({1021, 91}) ->
    #{base_attrs =>
          [{1, 6914},
           {4, 1301},
           {5, 1014},
           {6, 995},
           {7, 589},
           {3, 314},
           {2, 3156},
           {26, 172},
           {25, 172}],
      extra_attrs =>
          [{1, 10371},
           {4, 1952},
           {5, 1522},
           {6, 1493},
           {7, 884},
           {3, 472}]};
get_lev_cfg({1021, 92}) ->
    #{base_attrs =>
          [{1, 6995},
           {4, 1317},
           {5, 1026},
           {6, 1007},
           {7, 596},
           {3, 318},
           {2, 3161},
           {26, 174},
           {25, 174}],
      extra_attrs =>
          [{1, 10493},
           {4, 1975},
           {5, 1540},
           {6, 1510},
           {7, 894},
           {3, 477}]};
get_lev_cfg({1021, 93}) ->
    #{base_attrs =>
          [{1, 7076},
           {4, 1332},
           {5, 1038},
           {6, 1018},
           {7, 603},
           {3, 322},
           {2, 3166},
           {26, 177},
           {25, 177}],
      extra_attrs =>
          [{1, 10614},
           {4, 1998},
           {5, 1558},
           {6, 1528},
           {7, 905},
           {3, 483}]};
get_lev_cfg({1021, 94}) ->
    #{base_attrs =>
          [{1, 7156},
           {4, 1347},
           {5, 1050},
           {6, 1030},
           {7, 610},
           {3, 325},
           {2, 3171},
           {26, 179},
           {25, 179}],
      extra_attrs =>
          [{1, 10734},
           {4, 2020},
           {5, 1575},
           {6, 1545},
           {7, 915},
           {3, 488}]};
get_lev_cfg({1021, 95}) ->
    #{base_attrs =>
          [{1, 7234},
           {4, 1362},
           {5, 1062},
           {6, 1041},
           {7, 616},
           {3, 329},
           {2, 3176},
           {26, 182},
           {25, 182}],
      extra_attrs =>
          [{1, 10852},
           {4, 2043},
           {5, 1593},
           {6, 1562},
           {7, 925},
           {3, 494}]};
get_lev_cfg({1021, 96}) ->
    #{base_attrs =>
          [{1, 7312},
           {4, 1376},
           {5, 1073},
           {6, 1052},
           {7, 623},
           {3, 332},
           {2, 3181},
           {26, 184},
           {25, 184}],
      extra_attrs =>
          [{1, 10969},
           {4, 2065},
           {5, 1610},
           {6, 1579},
           {7, 935},
           {3, 499}]};
get_lev_cfg({1021, 97}) ->
    #{base_attrs =>
          [{1, 7389},
           {4, 1391},
           {5, 1084},
           {6, 1064},
           {7, 630},
           {3, 336},
           {2, 3186},
           {26, 186},
           {25, 186}],
      extra_attrs =>
          [{1, 11084},
           {4, 2086},
           {5, 1627},
           {6, 1596},
           {7, 945},
           {3, 504}]};
get_lev_cfg({1021, 98}) ->
    #{base_attrs =>
          [{1, 7465},
           {4, 1405},
           {5, 1095},
           {6, 1074},
           {7, 636},
           {3, 339},
           {2, 3191},
           {26, 189},
           {25, 189}],
      extra_attrs =>
          [{1, 11198},
           {4, 2108},
           {5, 1643},
           {6, 1612},
           {7, 954},
           {3, 509}]};
get_lev_cfg({1021, 99}) ->
    #{base_attrs =>
          [{1, 7541},
           {4, 1419},
           {5, 1107},
           {6, 1085},
           {7, 643},
           {3, 343},
           {2, 3196},
           {26, 191},
           {25, 191}],
      extra_attrs =>
          [{1, 11312},
           {4, 2129},
           {5, 1660},
           {6, 1628},
           {7, 964},
           {3, 514}]};
get_lev_cfg({1021, 100}) ->
    #{base_attrs =>
          [{1, 7615},
           {4, 1433},
           {5, 1117},
           {6, 1096},
           {7, 649},
           {3, 346},
           {2, 3201},
           {26, 194},
           {25, 194}],
      extra_attrs =>
          [{1, 11423},
           {4, 2150},
           {5, 1676},
           {6, 1644},
           {7, 974},
           {3, 520}]};
get_lev_cfg({1021, 101}) ->
    #{base_attrs =>
          [{1, 7689},
           {4, 1447},
           {5, 1128},
           {6, 1107},
           {7, 655},
           {3, 350},
           {2, 3201},
           {26, 197},
           {25, 197}],
      extra_attrs =>
          [{1, 11534},
           {4, 2171},
           {5, 1693},
           {6, 1660},
           {7, 983},
           {3, 525}]};
get_lev_cfg({1021, 102}) ->
    #{base_attrs =>
          [{1, 7762},
           {4, 1461},
           {5, 1139},
           {6, 1117},
           {7, 661},
           {3, 353},
           {2, 3201},
           {26, 200},
           {25, 200}],
      extra_attrs =>
          [{1, 11643},
           {4, 2191},
           {5, 1709},
           {6, 1676},
           {7, 992},
           {3, 530}]};
get_lev_cfg({1021, 103}) ->
    #{base_attrs =>
          [{1, 7834},
           {4, 1474},
           {5, 1149},
           {6, 1127},
           {7, 667},
           {3, 356},
           {2, 3201},
           {26, 203},
           {25, 203}],
      extra_attrs =>
          [{1, 11751},
           {4, 2212},
           {5, 1724},
           {6, 1691},
           {7, 1001},
           {3, 534}]};
get_lev_cfg({1021, 104}) ->
    #{base_attrs =>
          [{1, 7905},
           {4, 1488},
           {5, 1160},
           {6, 1138},
           {7, 674},
           {3, 359},
           {2, 3201},
           {26, 206},
           {25, 206}],
      extra_attrs =>
          [{1, 11857},
           {4, 2232},
           {5, 1740},
           {6, 1707},
           {7, 1011},
           {3, 539}]};
get_lev_cfg({1021, 105}) ->
    #{base_attrs =>
          [{1, 7975},
           {4, 1501},
           {5, 1170},
           {6, 1148},
           {7, 679},
           {3, 363},
           {2, 3201},
           {26, 206},
           {25, 206}],
      extra_attrs =>
          [{1, 11963},
           {4, 2252},
           {5, 1756},
           {6, 1722},
           {7, 1019},
           {3, 544}]};
get_lev_cfg({1021, 106}) ->
    #{base_attrs =>
          [{1, 8044},
           {4, 1514},
           {5, 1180},
           {6, 1158},
           {7, 685},
           {3, 366},
           {2, 3201},
           {26, 212},
           {25, 212}],
      extra_attrs =>
          [{1, 12066},
           {4, 2271},
           {5, 1771},
           {6, 1737},
           {7, 1028},
           {3, 549}]};
get_lev_cfg({1021, 107}) ->
    #{base_attrs =>
          [{1, 8113},
           {4, 1527},
           {5, 1190},
           {6, 1168},
           {7, 691},
           {3, 369},
           {2, 3201},
           {26, 215},
           {25, 215}],
      extra_attrs =>
          [{1, 12169},
           {4, 2291},
           {5, 1786},
           {6, 1752},
           {7, 1037},
           {3, 553}]};
get_lev_cfg({1021, 108}) ->
    #{base_attrs =>
          [{1, 8180},
           {4, 1540},
           {5, 1200},
           {6, 1177},
           {7, 697},
           {3, 372},
           {2, 3201},
           {26, 218},
           {25, 218}],
      extra_attrs =>
          [{1, 12271},
           {4, 2310},
           {5, 1801},
           {6, 1766},
           {7, 1046},
           {3, 558}]};
get_lev_cfg({1021, 109}) ->
    #{base_attrs =>
          [{1, 8247},
           {4, 1552},
           {5, 1210},
           {6, 1187},
           {7, 703},
           {3, 375},
           {2, 3201},
           {26, 221},
           {25, 221}],
      extra_attrs =>
          [{1, 12370},
           {4, 2328},
           {5, 1815},
           {6, 1781},
           {7, 1054},
           {3, 563}]};
get_lev_cfg({1021, 110}) ->
    #{base_attrs =>
          [{1, 8313},
           {4, 1565},
           {5, 1220},
           {6, 1196},
           {7, 708},
           {3, 378},
           {2, 3201},
           {26, 224},
           {25, 224}],
      extra_attrs =>
          [{1, 12469},
           {4, 2347},
           {5, 1830},
           {6, 1795},
           {7, 1063},
           {3, 567}]};
get_lev_cfg({1021, 111}) ->
    #{base_attrs =>
          [{1, 8378},
           {4, 1577},
           {5, 1229},
           {6, 1206},
           {7, 714},
           {3, 381},
           {2, 3201},
           {26, 227},
           {25, 227}],
      extra_attrs =>
          [{1, 12567},
           {4, 2365},
           {5, 1844},
           {6, 1809},
           {7, 1071},
           {3, 572}]};
get_lev_cfg({1021, 112}) ->
    #{base_attrs =>
          [{1, 8442},
           {4, 1589},
           {5, 1239},
           {6, 1215},
           {7, 719},
           {3, 384},
           {2, 3201},
           {26, 230},
           {25, 230}],
      extra_attrs =>
          [{1, 12663},
           {4, 2384},
           {5, 1858},
           {6, 1823},
           {7, 1079},
           {3, 576}]};
get_lev_cfg({1021, 113}) ->
    #{base_attrs =>
          [{1, 8505},
           {4, 1601},
           {5, 1248},
           {6, 1224},
           {7, 725},
           {3, 387},
           {2, 3201},
           {26, 233},
           {25, 233}],
      extra_attrs =>
          [{1, 12758},
           {4, 2401},
           {5, 1872},
           {6, 1837},
           {7, 1087},
           {3, 580}]};
get_lev_cfg({1021, 114}) ->
    #{base_attrs =>
          [{1, 8567},
           {4, 1613},
           {5, 1257},
           {6, 1233},
           {7, 730},
           {3, 390},
           {2, 3201},
           {26, 236},
           {25, 236}],
      extra_attrs =>
          [{1, 12851},
           {4, 2419},
           {5, 1886},
           {6, 1850},
           {7, 1095},
           {3, 585}]};
get_lev_cfg({1021, 115}) ->
    #{base_attrs =>
          [{1, 8629},
           {4, 1624},
           {5, 1266},
           {6, 1242},
           {7, 735},
           {3, 392},
           {2, 3201},
           {26, 239},
           {25, 239}],
      extra_attrs =>
          [{1, 12944},
           {4, 2436},
           {5, 1900},
           {6, 1863},
           {7, 1103},
           {3, 589}]};
get_lev_cfg({1021, 116}) ->
    #{base_attrs =>
          [{1, 8690},
           {4, 1636},
           {5, 1275},
           {6, 1251},
           {7, 740},
           {3, 395},
           {2, 3201},
           {26, 242},
           {25, 242}],
      extra_attrs =>
          [{1, 13035},
           {4, 2454},
           {5, 1913},
           {6, 1876},
           {7, 1111},
           {3, 593}]};
get_lev_cfg({1021, 117}) ->
    #{base_attrs =>
          [{1, 8750},
           {4, 1647},
           {5, 1284},
           {6, 1259},
           {7, 746},
           {3, 398},
           {2, 3201},
           {26, 245},
           {25, 245}],
      extra_attrs =>
          [{1, 13125},
           {4, 2470},
           {5, 1926},
           {6, 1889},
           {7, 1119},
           {3, 597}]};
get_lev_cfg({1021, 118}) ->
    #{base_attrs =>
          [{1, 8809},
           {4, 1658},
           {5, 1293},
           {6, 1268},
           {7, 751},
           {3, 401},
           {2, 3201},
           {26, 248},
           {25, 248}],
      extra_attrs =>
          [{1, 13213},
           {4, 2487},
           {5, 1939},
           {6, 1902},
           {7, 1126},
           {3, 601}]};
get_lev_cfg({1021, 119}) ->
    #{base_attrs =>
          [{1, 8866},
           {4, 1669},
           {5, 1301},
           {6, 1276},
           {7, 756},
           {3, 403},
           {2, 3201},
           {26, 251},
           {25, 251}],
      extra_attrs =>
          [{1, 13300},
           {4, 2503},
           {5, 1952},
           {6, 1915},
           {7, 1134},
           {3, 605}]};
get_lev_cfg({1021, 120}) ->
    #{base_attrs =>
          [{1, 8924},
           {4, 1680},
           {5, 1310},
           {6, 1284},
           {7, 760},
           {3, 406},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13386},
           {4, 2520},
           {5, 1965},
           {6, 1927},
           {7, 1141},
           {3, 609}]};
get_lev_cfg({1021, 121}) ->
    #{base_attrs =>
          [{1, 8980},
           {4, 1690},
           {5, 1318},
           {6, 1293},
           {7, 765},
           {3, 408},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13471},
           {4, 2536},
           {5, 1977},
           {6, 1939},
           {7, 1148},
           {3, 613}]};
get_lev_cfg({1021, 122}) ->
    #{base_attrs =>
          [{1, 9036},
           {4, 1701},
           {5, 1326},
           {6, 1301},
           {7, 770},
           {3, 411},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13554},
           {4, 2551},
           {5, 1989},
           {6, 1951},
           {7, 1155},
           {3, 617}]};
get_lev_cfg({1021, 123}) ->
    #{base_attrs =>
          [{1, 9090},
           {4, 1711},
           {5, 1334},
           {6, 1308},
           {7, 775},
           {3, 413},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13636},
           {4, 2567},
           {5, 2001},
           {6, 1963},
           {7, 1162},
           {3, 620}]};
get_lev_cfg({1021, 124}) ->
    #{base_attrs =>
          [{1, 9144},
           {4, 1721},
           {5, 1342},
           {6, 1316},
           {7, 779},
           {3, 416},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13717},
           {4, 2582},
           {5, 2013},
           {6, 1975},
           {7, 1169},
           {3, 624}]};
get_lev_cfg({1021, 125}) ->
    #{base_attrs =>
          [{1, 9197},
           {4, 1731},
           {5, 1350},
           {6, 1324},
           {7, 784},
           {3, 418},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13796},
           {4, 2597},
           {5, 2025},
           {6, 1986},
           {7, 1176},
           {3, 628}]};
get_lev_cfg({1021, 126}) ->
    #{base_attrs =>
          [{1, 9249},
           {4, 1741},
           {5, 1357},
           {6, 1331},
           {7, 788},
           {3, 421},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13874},
           {4, 2611},
           {5, 2036},
           {6, 1997},
           {7, 1182},
           {3, 631}]};
get_lev_cfg({1021, 127}) ->
    #{base_attrs =>
          [{1, 9300},
           {4, 1750},
           {5, 1365},
           {6, 1339},
           {7, 793},
           {3, 423},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13951},
           {4, 2626},
           {5, 2047},
           {6, 2008},
           {7, 1189},
           {3, 635}]};
get_lev_cfg({1021, 128}) ->
    #{base_attrs =>
          [{1, 9351},
           {4, 1760},
           {5, 1372},
           {6, 1346},
           {7, 797},
           {3, 425},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 14026},
           {4, 2640},
           {5, 2059},
           {6, 2019},
           {7, 1195},
           {3, 638}]};
get_lev_cfg({1021, 129}) ->
    #{base_attrs =>
          [{1, 9400},
           {4, 1769},
           {5, 1379},
           {6, 1353},
           {7, 801},
           {3, 427},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 14100},
           {4, 2654},
           {5, 2069},
           {6, 2030},
           {7, 1202},
           {3, 641}]};
get_lev_cfg({1021, 130}) ->
    #{base_attrs =>
          [{1, 9449},
           {4, 1778},
           {5, 1387},
           {6, 1360},
           {7, 805},
           {3, 430},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 14173},
           {4, 2668},
           {5, 2080},
           {6, 2040},
           {7, 1208},
           {3, 645}]};
get_lev_cfg({1023, 1}) ->
    #{base_attrs =>
          [{1, 172},
           {4, 31},
           {5, 24},
           {6, 32},
           {7, 14},
           {3, 5},
           {2, 200},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 258}, {4, 47}, {5, 37}, {6, 48}, {7, 21}, {3, 8}]};
get_lev_cfg({1023, 2}) ->
    #{base_attrs =>
          [{1, 206},
           {4, 38},
           {5, 29},
           {6, 38},
           {7, 17},
           {3, 6},
           {2, 576},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 309},
           {4, 57},
           {5, 44},
           {6, 58},
           {7, 25},
           {3, 10}]};
get_lev_cfg({1023, 3}) ->
    #{base_attrs =>
          [{1, 241},
           {4, 44},
           {5, 34},
           {6, 45},
           {7, 20},
           {3, 8},
           {2, 672},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 361},
           {4, 66},
           {5, 52},
           {6, 67},
           {7, 30},
           {3, 12}]};
get_lev_cfg({1023, 4}) ->
    #{base_attrs =>
          [{1, 275},
           {4, 50},
           {5, 39},
           {6, 51},
           {7, 23},
           {3, 9},
           {2, 767},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 413},
           {4, 76},
           {5, 59},
           {6, 77},
           {7, 34},
           {3, 13}]};
get_lev_cfg({1023, 5}) ->
    #{base_attrs =>
          [{1, 309},
           {4, 57},
           {5, 44},
           {6, 58},
           {7, 25},
           {3, 10},
           {2, 864},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 464},
           {4, 85},
           {5, 66},
           {6, 87},
           {7, 38},
           {3, 15}]};
get_lev_cfg({1023, 6}) ->
    #{base_attrs =>
          [{1, 344},
           {4, 63},
           {5, 49},
           {6, 64},
           {7, 28},
           {3, 11},
           {2, 960},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 516},
           {4, 95},
           {5, 74},
           {6, 96},
           {7, 43},
           {3, 17}]};
get_lev_cfg({1023, 7}) ->
    #{base_attrs =>
          [{1, 378},
           {4, 69},
           {5, 54},
           {6, 70},
           {7, 31},
           {3, 12},
           {2, 1055},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 568},
           {4, 104},
           {5, 81},
           {6, 106},
           {7, 47},
           {3, 19}]};
get_lev_cfg({1023, 8}) ->
    #{base_attrs =>
          [{1, 413},
           {4, 76},
           {5, 59},
           {6, 77},
           {7, 34},
           {3, 13},
           {2, 1152},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 619},
           {4, 114},
           {5, 89},
           {6, 116},
           {7, 51},
           {3, 20}]};
get_lev_cfg({1023, 9}) ->
    #{base_attrs =>
          [{1, 447},
           {4, 82},
           {5, 64},
           {6, 83},
           {7, 37},
           {3, 14},
           {2, 1248},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 671},
           {4, 124},
           {5, 96},
           {6, 125},
           {7, 56},
           {3, 22}]};
get_lev_cfg({1023, 10}) ->
    #{base_attrs =>
          [{1, 516},
           {4, 95},
           {5, 74},
           {6, 96},
           {7, 43},
           {3, 17},
           {2, 1440},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 774},
           {4, 143},
           {5, 111},
           {6, 145},
           {7, 64},
           {3, 25}]};
get_lev_cfg({1023, 11}) ->
    #{base_attrs =>
          [{1, 585},
           {4, 108},
           {5, 84},
           {6, 109},
           {7, 48},
           {3, 19},
           {2, 1631},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 877},
           {4, 162},
           {5, 126},
           {6, 164},
           {7, 73},
           {3, 29}]};
get_lev_cfg({1023, 12}) ->
    #{base_attrs =>
          [{1, 654},
           {4, 120},
           {5, 94},
           {6, 122},
           {7, 54},
           {3, 21},
           {2, 1824},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 981},
           {4, 181},
           {5, 141},
           {6, 183},
           {7, 82},
           {3, 32}]};
get_lev_cfg({1023, 13}) ->
    #{base_attrs =>
          [{1, 723},
           {4, 133},
           {5, 104},
           {6, 135},
           {7, 60},
           {3, 24},
           {2, 2016},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1084},
           {4, 200},
           {5, 156},
           {6, 203},
           {7, 90},
           {3, 36}]};
get_lev_cfg({1023, 14}) ->
    #{base_attrs =>
          [{1, 791},
           {4, 146},
           {5, 114},
           {6, 148},
           {7, 66},
           {3, 26},
           {2, 2207},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1187},
           {4, 219},
           {5, 171},
           {6, 222},
           {7, 99},
           {3, 39}]};
get_lev_cfg({1023, 15}) ->
    #{base_attrs =>
          [{1, 860},
           {4, 159},
           {5, 123},
           {6, 161},
           {7, 72},
           {3, 28},
           {2, 2400},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1291},
           {4, 238},
           {5, 185},
           {6, 241},
           {7, 108},
           {3, 43}]};
get_lev_cfg({1023, 16}) ->
    #{base_attrs =>
          [{1, 929},
           {4, 171},
           {5, 133},
           {6, 174},
           {7, 77},
           {3, 31},
           {2, 2408},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1394},
           {4, 257},
           {5, 200},
           {6, 261},
           {7, 116},
           {3, 46}]};
get_lev_cfg({1023, 17}) ->
    #{base_attrs =>
          [{1, 998},
           {4, 184},
           {5, 143},
           {6, 187},
           {7, 83},
           {3, 33},
           {2, 2417},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1497},
           {4, 276},
           {5, 215},
           {6, 280},
           {7, 125},
           {3, 50}]};
get_lev_cfg({1023, 18}) ->
    #{base_attrs =>
          [{1, 1067},
           {4, 197},
           {5, 153},
           {6, 200},
           {7, 89},
           {3, 35},
           {2, 2426},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1600},
           {4, 295},
           {5, 230},
           {6, 300},
           {7, 133},
           {3, 53}]};
get_lev_cfg({1023, 19}) ->
    #{base_attrs =>
          [{1, 1136},
           {4, 209},
           {5, 163},
           {6, 212},
           {7, 95},
           {3, 38},
           {2, 2436},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1704},
           {4, 314},
           {5, 245},
           {6, 319},
           {7, 142},
           {3, 57}]};
get_lev_cfg({1023, 20}) ->
    #{base_attrs =>
          [{1, 1205},
           {4, 222},
           {5, 173},
           {6, 225},
           {7, 100},
           {3, 40},
           {2, 2446},
           {26, 2},
           {25, 2}],
      extra_attrs =>
          [{1, 1807},
           {4, 333},
           {5, 260},
           {6, 338},
           {7, 151},
           {3, 60}]};
get_lev_cfg({1023, 21}) ->
    #{base_attrs =>
          [{1, 1273},
           {4, 235},
           {5, 183},
           {6, 238},
           {7, 106},
           {3, 42},
           {2, 2457},
           {26, 4},
           {25, 4}],
      extra_attrs =>
          [{1, 1910},
           {4, 353},
           {5, 275},
           {6, 358},
           {7, 159},
           {3, 64}]};
get_lev_cfg({1023, 22}) ->
    #{base_attrs =>
          [{1, 1342},
           {4, 248},
           {5, 193},
           {6, 251},
           {7, 112},
           {3, 44},
           {2, 2468},
           {26, 6},
           {25, 6}],
      extra_attrs =>
          [{1, 2014},
           {4, 372},
           {5, 290},
           {6, 377},
           {7, 168},
           {3, 67}]};
get_lev_cfg({1023, 23}) ->
    #{base_attrs =>
          [{1, 1411},
           {4, 260},
           {5, 203},
           {6, 264},
           {7, 118},
           {3, 47},
           {2, 2480},
           {26, 9},
           {25, 9}],
      extra_attrs =>
          [{1, 2117},
           {4, 391},
           {5, 305},
           {6, 396},
           {7, 177},
           {3, 70}]};
get_lev_cfg({1023, 24}) ->
    #{base_attrs =>
          [{1, 1480},
           {4, 273},
           {5, 213},
           {6, 277},
           {7, 123},
           {3, 49},
           {2, 2492},
           {26, 11},
           {25, 11}],
      extra_attrs =>
          [{1, 2220},
           {4, 410},
           {5, 319},
           {6, 416},
           {7, 185},
           {3, 74}]};
get_lev_cfg({1023, 25}) ->
    #{base_attrs =>
          [{1, 1549},
           {4, 286},
           {5, 223},
           {6, 290},
           {7, 129},
           {3, 51},
           {2, 2505},
           {26, 14},
           {25, 14}],
      extra_attrs =>
          [{1, 2323},
           {4, 429},
           {5, 334},
           {6, 435},
           {7, 194},
           {3, 77}]};
get_lev_cfg({1023, 26}) ->
    #{base_attrs =>
          [{1, 1618},
           {4, 298},
           {5, 233},
           {6, 303},
           {7, 135},
           {3, 54},
           {2, 2518},
           {26, 16},
           {25, 16}],
      extra_attrs =>
          [{1, 2427},
           {4, 448},
           {5, 349},
           {6, 454},
           {7, 203},
           {3, 81}]};
get_lev_cfg({1023, 27}) ->
    #{base_attrs =>
          [{1, 1687},
           {4, 311},
           {5, 243},
           {6, 316},
           {7, 141},
           {3, 56},
           {2, 2532},
           {26, 18},
           {25, 18}],
      extra_attrs =>
          [{1, 2530},
           {4, 467},
           {5, 364},
           {6, 474},
           {7, 211},
           {3, 84}]};
get_lev_cfg({1023, 28}) ->
    #{base_attrs =>
          [{1, 1755},
           {4, 324},
           {5, 252},
           {6, 329},
           {7, 146},
           {3, 58},
           {2, 2546},
           {26, 21},
           {25, 21}],
      extra_attrs =>
          [{1, 2633},
           {4, 486},
           {5, 379},
           {6, 493},
           {7, 220},
           {3, 88}]};
get_lev_cfg({1023, 29}) ->
    #{base_attrs =>
          [{1, 1824},
           {4, 337},
           {5, 262},
           {6, 342},
           {7, 152},
           {3, 61},
           {2, 2561},
           {26, 23},
           {25, 23}],
      extra_attrs =>
          [{1, 2737},
           {4, 505},
           {5, 394},
           {6, 513},
           {7, 229},
           {3, 91}]};
get_lev_cfg({1023, 30}) ->
    #{base_attrs =>
          [{1, 1893},
           {4, 349},
           {5, 272},
           {6, 354},
           {7, 158},
           {3, 63},
           {2, 2576},
           {26, 26},
           {25, 26}],
      extra_attrs =>
          [{1, 2840},
           {4, 524},
           {5, 409},
           {6, 532},
           {7, 237},
           {3, 95}]};
get_lev_cfg({1023, 31}) ->
    #{base_attrs =>
          [{1, 1962},
           {4, 362},
           {5, 282},
           {6, 367},
           {7, 164},
           {3, 65},
           {2, 2592},
           {26, 28},
           {25, 28}],
      extra_attrs =>
          [{1, 2943},
           {4, 543},
           {5, 424},
           {6, 551},
           {7, 246},
           {3, 98}]};
get_lev_cfg({1023, 32}) ->
    #{base_attrs =>
          [{1, 2031},
           {4, 375},
           {5, 292},
           {6, 380},
           {7, 169},
           {3, 68},
           {2, 2608},
           {26, 30},
           {25, 30}],
      extra_attrs =>
          [{1, 3047},
           {4, 562},
           {5, 438},
           {6, 571},
           {7, 254},
           {3, 102}]};
get_lev_cfg({1023, 33}) ->
    #{base_attrs =>
          [{1, 2100},
           {4, 388},
           {5, 302},
           {6, 393},
           {7, 175},
           {3, 70},
           {2, 2625},
           {26, 33},
           {25, 33}],
      extra_attrs =>
          [{1, 3150},
           {4, 582},
           {5, 453},
           {6, 590},
           {7, 263},
           {3, 105}]};
get_lev_cfg({1023, 34}) ->
    #{base_attrs =>
          [{1, 2169},
           {4, 400},
           {5, 312},
           {6, 406},
           {7, 181},
           {3, 72},
           {2, 2642},
           {26, 35},
           {25, 35}],
      extra_attrs =>
          [{1, 3253},
           {4, 601},
           {5, 468},
           {6, 609},
           {7, 272},
           {3, 109}]};
get_lev_cfg({1023, 35}) ->
    #{base_attrs =>
          [{1, 2237},
           {4, 413},
           {5, 322},
           {6, 419},
           {7, 187},
           {3, 74},
           {2, 2660},
           {26, 38},
           {25, 38}],
      extra_attrs =>
          [{1, 3356},
           {4, 620},
           {5, 483},
           {6, 629},
           {7, 280},
           {3, 112}]};
get_lev_cfg({1023, 36}) ->
    #{base_attrs =>
          [{1, 2306},
           {4, 426},
           {5, 332},
           {6, 432},
           {7, 193},
           {3, 77},
           {2, 2678},
           {26, 40},
           {25, 40}],
      extra_attrs =>
          [{1, 3460},
           {4, 639},
           {5, 498},
           {6, 648},
           {7, 289},
           {3, 115}]};
get_lev_cfg({1023, 37}) ->
    #{base_attrs =>
          [{1, 2375},
           {4, 438},
           {5, 342},
           {6, 445},
           {7, 198},
           {3, 79},
           {2, 2697},
           {26, 42},
           {25, 42}],
      extra_attrs =>
          [{1, 3563},
           {4, 658},
           {5, 513},
           {6, 667},
           {7, 298},
           {3, 119}]};
get_lev_cfg({1023, 38}) ->
    #{base_attrs =>
          [{1, 2444},
           {4, 451},
           {5, 352},
           {6, 458},
           {7, 204},
           {3, 81},
           {2, 2716},
           {26, 45},
           {25, 45}],
      extra_attrs =>
          [{1, 3666},
           {4, 677},
           {5, 528},
           {6, 687},
           {7, 306},
           {3, 122}]};
get_lev_cfg({1023, 39}) ->
    #{base_attrs =>
          [{1, 2513},
           {4, 464},
           {5, 362},
           {6, 471},
           {7, 210},
           {3, 84},
           {2, 2736},
           {26, 47},
           {25, 47}],
      extra_attrs =>
          [{1, 3770},
           {4, 696},
           {5, 543},
           {6, 706},
           {7, 315},
           {3, 126}]};
get_lev_cfg({1023, 40}) ->
    #{base_attrs =>
          [{1, 2582},
           {4, 477},
           {5, 371},
           {6, 483},
           {7, 216},
           {3, 86},
           {2, 2756},
           {26, 50},
           {25, 50}],
      extra_attrs =>
          [{1, 3873},
           {4, 715},
           {5, 557},
           {6, 725},
           {7, 324},
           {3, 129}]};
get_lev_cfg({1023, 41}) ->
    #{base_attrs =>
          [{1, 2651},
           {4, 489},
           {5, 381},
           {6, 496},
           {7, 221},
           {3, 88},
           {2, 2777},
           {26, 52},
           {25, 52}],
      extra_attrs =>
          [{1, 3976},
           {4, 734},
           {5, 572},
           {6, 745},
           {7, 332},
           {3, 133}]};
get_lev_cfg({1023, 42}) ->
    #{base_attrs =>
          [{1, 2719},
           {4, 502},
           {5, 391},
           {6, 509},
           {7, 227},
           {3, 91},
           {2, 2798},
           {26, 54},
           {25, 54}],
      extra_attrs =>
          [{1, 4079},
           {4, 753},
           {5, 587},
           {6, 764},
           {7, 341},
           {3, 136}]};
get_lev_cfg({1023, 43}) ->
    #{base_attrs =>
          [{1, 2788},
           {4, 515},
           {5, 401},
           {6, 522},
           {7, 233},
           {3, 93},
           {2, 2820},
           {26, 57},
           {25, 57}],
      extra_attrs =>
          [{1, 4183},
           {4, 772},
           {5, 602},
           {6, 784},
           {7, 350},
           {3, 140}]};
get_lev_cfg({1023, 44}) ->
    #{base_attrs =>
          [{1, 2857},
           {4, 527},
           {5, 411},
           {6, 535},
           {7, 239},
           {3, 95},
           {2, 2842},
           {26, 59},
           {25, 59}],
      extra_attrs =>
          [{1, 4286},
           {4, 791},
           {5, 617},
           {6, 803},
           {7, 358},
           {3, 143}]};
get_lev_cfg({1023, 45}) ->
    #{base_attrs =>
          [{1, 2926},
           {4, 540},
           {5, 421},
           {6, 548},
           {7, 244},
           {3, 98},
           {2, 2865},
           {26, 62},
           {25, 62}],
      extra_attrs =>
          [{1, 4389},
           {4, 810},
           {5, 632},
           {6, 822},
           {7, 367},
           {3, 147}]};
get_lev_cfg({1023, 46}) ->
    #{base_attrs =>
          [{1, 2995},
           {4, 553},
           {5, 431},
           {6, 561},
           {7, 250},
           {3, 100},
           {2, 2888},
           {26, 64},
           {25, 64}],
      extra_attrs =>
          [{1, 4493},
           {4, 830},
           {5, 647},
           {6, 842},
           {7, 375},
           {3, 150}]};
get_lev_cfg({1023, 47}) ->
    #{base_attrs =>
          [{1, 3064},
           {4, 566},
           {5, 441},
           {6, 574},
           {7, 256},
           {3, 102},
           {2, 2912},
           {26, 66},
           {25, 66}],
      extra_attrs =>
          [{1, 4596},
           {4, 849},
           {5, 662},
           {6, 861},
           {7, 384},
           {3, 153}]};
get_lev_cfg({1023, 48}) ->
    #{base_attrs =>
          [{1, 3133},
           {4, 578},
           {5, 451},
           {6, 587},
           {7, 262},
           {3, 104},
           {2, 2936},
           {26, 69},
           {25, 69}],
      extra_attrs =>
          [{1, 4699},
           {4, 868},
           {5, 676},
           {6, 880},
           {7, 393},
           {3, 157}]};
get_lev_cfg({1023, 49}) ->
    #{base_attrs =>
          [{1, 3201},
           {4, 591},
           {5, 461},
           {6, 600},
           {7, 267},
           {3, 107},
           {2, 2961},
           {26, 71},
           {25, 71}],
      extra_attrs =>
          [{1, 4802},
           {4, 887},
           {5, 691},
           {6, 900},
           {7, 401},
           {3, 160}]};
get_lev_cfg({1023, 50}) ->
    #{base_attrs =>
          [{1, 3270},
           {4, 604},
           {5, 471},
           {6, 613},
           {7, 273},
           {3, 109},
           {2, 2986},
           {26, 74},
           {25, 74}],
      extra_attrs =>
          [{1, 4906},
           {4, 906},
           {5, 706},
           {6, 919},
           {7, 410},
           {3, 164}]};
get_lev_cfg({1023, 51}) ->
    #{base_attrs =>
          [{1, 3339},
           {4, 616},
           {5, 481},
           {6, 625},
           {7, 279},
           {3, 111},
           {2, 3012},
           {26, 76},
           {25, 76}],
      extra_attrs =>
          [{1, 5009},
           {4, 925},
           {5, 721},
           {6, 938},
           {7, 419},
           {3, 167}]};
get_lev_cfg({1023, 52}) ->
    #{base_attrs =>
          [{1, 3408},
           {4, 629},
           {5, 491},
           {6, 638},
           {7, 285},
           {3, 114},
           {2, 3015},
           {26, 78},
           {25, 78}],
      extra_attrs =>
          [{1, 5112},
           {4, 944},
           {5, 736},
           {6, 958},
           {7, 427},
           {3, 171}]};
get_lev_cfg({1023, 53}) ->
    #{base_attrs =>
          [{1, 3477},
           {4, 642},
           {5, 500},
           {6, 651},
           {7, 290},
           {3, 116},
           {2, 3018},
           {26, 81},
           {25, 81}],
      extra_attrs =>
          [{1, 5216},
           {4, 963},
           {5, 751},
           {6, 977},
           {7, 436},
           {3, 174}]};
get_lev_cfg({1023, 54}) ->
    #{base_attrs =>
          [{1, 3546},
           {4, 655},
           {5, 510},
           {6, 664},
           {7, 296},
           {3, 118},
           {2, 3021},
           {26, 83},
           {25, 83}],
      extra_attrs =>
          [{1, 5319},
           {4, 982},
           {5, 766},
           {6, 997},
           {7, 445},
           {3, 178}]};
get_lev_cfg({1023, 55}) ->
    #{base_attrs =>
          [{1, 3615},
           {4, 667},
           {5, 520},
           {6, 677},
           {7, 302},
           {3, 121},
           {2, 3024},
           {26, 86},
           {25, 86}],
      extra_attrs =>
          [{1, 5422},
           {4, 1001},
           {5, 781},
           {6, 1016},
           {7, 453},
           {3, 181}]};
get_lev_cfg({1023, 56}) ->
    #{base_attrs =>
          [{1, 3683},
           {4, 680},
           {5, 530},
           {6, 690},
           {7, 308},
           {3, 123},
           {2, 3027},
           {26, 88},
           {25, 88}],
      extra_attrs =>
          [{1, 5525},
           {4, 1020},
           {5, 796},
           {6, 1035},
           {7, 462},
           {3, 185}]};
get_lev_cfg({1023, 57}) ->
    #{base_attrs =>
          [{1, 3752},
           {4, 693},
           {5, 540},
           {6, 703},
           {7, 313},
           {3, 125},
           {2, 3030},
           {26, 90},
           {25, 90}],
      extra_attrs =>
          [{1, 5629},
           {4, 1039},
           {5, 810},
           {6, 1055},
           {7, 470},
           {3, 188}]};
get_lev_cfg({1023, 58}) ->
    #{base_attrs =>
          [{1, 3821},
           {4, 706},
           {5, 550},
           {6, 716},
           {7, 319},
           {3, 128},
           {2, 3033},
           {26, 93},
           {25, 93}],
      extra_attrs =>
          [{1, 5732},
           {4, 1059},
           {5, 825},
           {6, 1074},
           {7, 479},
           {3, 192}]};
get_lev_cfg({1023, 59}) ->
    #{base_attrs =>
          [{1, 3890},
           {4, 718},
           {5, 560},
           {6, 729},
           {7, 325},
           {3, 130},
           {2, 3036},
           {26, 95},
           {25, 95}],
      extra_attrs =>
          [{1, 5835},
           {4, 1078},
           {5, 840},
           {6, 1093},
           {7, 488},
           {3, 195}]};
get_lev_cfg({1023, 60}) ->
    #{base_attrs =>
          [{1, 4037},
           {4, 745},
           {5, 581},
           {6, 756},
           {7, 337},
           {3, 135},
           {2, 3039},
           {26, 98},
           {25, 98}],
      extra_attrs =>
          [{1, 6056},
           {4, 1118},
           {5, 872},
           {6, 1135},
           {7, 506},
           {3, 202}]};
get_lev_cfg({1023, 61}) ->
    #{base_attrs =>
          [{1, 4148},
           {4, 766},
           {5, 597},
           {6, 777},
           {7, 347},
           {3, 138},
           {2, 3042},
           {26, 100},
           {25, 100}],
      extra_attrs =>
          [{1, 6222},
           {4, 1149},
           {5, 896},
           {6, 1166},
           {7, 520},
           {3, 208}]};
get_lev_cfg({1023, 62}) ->
    #{base_attrs =>
          [{1, 4257},
           {4, 786},
           {5, 613},
           {6, 797},
           {7, 356},
           {3, 142},
           {2, 3045},
           {26, 102},
           {25, 102}],
      extra_attrs =>
          [{1, 6386},
           {4, 1179},
           {5, 919},
           {6, 1196},
           {7, 534},
           {3, 213}]};
get_lev_cfg({1023, 63}) ->
    #{base_attrs =>
          [{1, 4365},
           {4, 806},
           {5, 628},
           {6, 818},
           {7, 365},
           {3, 146},
           {2, 3048},
           {26, 105},
           {25, 105}],
      extra_attrs =>
          [{1, 6548},
           {4, 1209},
           {5, 943},
           {6, 1227},
           {7, 547},
           {3, 219}]};
get_lev_cfg({1023, 64}) ->
    #{base_attrs =>
          [{1, 4473},
           {4, 826},
           {5, 644},
           {6, 838},
           {7, 374},
           {3, 149},
           {2, 3051},
           {26, 107},
           {25, 107}],
      extra_attrs =>
          [{1, 6710},
           {4, 1239},
           {5, 966},
           {6, 1257},
           {7, 561},
           {3, 224}]};
get_lev_cfg({1023, 65}) ->
    #{base_attrs =>
          [{1, 4580},
           {4, 846},
           {5, 659},
           {6, 858},
           {7, 383},
           {3, 153},
           {2, 3054},
           {26, 110},
           {25, 110}],
      extra_attrs =>
          [{1, 6870},
           {4, 1269},
           {5, 989},
           {6, 1287},
           {7, 574},
           {3, 230}]};
get_lev_cfg({1023, 66}) ->
    #{base_attrs =>
          [{1, 4686},
           {4, 865},
           {5, 675},
           {6, 878},
           {7, 392},
           {3, 157},
           {2, 3057},
           {26, 112},
           {25, 112}],
      extra_attrs =>
          [{1, 7029},
           {4, 1298},
           {5, 1012},
           {6, 1317},
           {7, 588},
           {3, 235}]};
get_lev_cfg({1023, 67}) ->
    #{base_attrs =>
          [{1, 4791},
           {4, 885},
           {5, 690},
           {6, 898},
           {7, 400},
           {3, 160},
           {2, 3060},
           {26, 114},
           {25, 114}],
      extra_attrs =>
          [{1, 7186},
           {4, 1327},
           {5, 1035},
           {6, 1347},
           {7, 601},
           {3, 240}]};
get_lev_cfg({1023, 68}) ->
    #{base_attrs =>
          [{1, 4895},
           {4, 904},
           {5, 705},
           {6, 917},
           {7, 409},
           {3, 164},
           {2, 3063},
           {26, 117},
           {25, 117}],
      extra_attrs =>
          [{1, 7342},
           {4, 1356},
           {5, 1057},
           {6, 1376},
           {7, 614},
           {3, 246}]};
get_lev_cfg({1023, 69}) ->
    #{base_attrs =>
          [{1, 4998},
           {4, 923},
           {5, 720},
           {6, 936},
           {7, 418},
           {3, 167},
           {2, 3066},
           {26, 119},
           {25, 119}],
      extra_attrs =>
          [{1, 7497},
           {4, 1385},
           {5, 1080},
           {6, 1405},
           {7, 627},
           {3, 251}]};
get_lev_cfg({1023, 70}) ->
    #{base_attrs =>
          [{1, 5100},
           {4, 942},
           {5, 734},
           {6, 956},
           {7, 426},
           {3, 170},
           {2, 3070},
           {26, 122},
           {25, 122}],
      extra_attrs =>
          [{1, 7651},
           {4, 1413},
           {5, 1102},
           {6, 1434},
           {7, 640},
           {3, 256}]};
get_lev_cfg({1023, 71}) ->
    #{base_attrs =>
          [{1, 5201},
           {4, 961},
           {5, 749},
           {6, 975},
           {7, 435},
           {3, 174},
           {2, 3074},
           {26, 124},
           {25, 124}],
      extra_attrs =>
          [{1, 7802},
           {4, 1441},
           {5, 1124},
           {6, 1462},
           {7, 652},
           {3, 261}]};
get_lev_cfg({1023, 72}) ->
    #{base_attrs =>
          [{1, 5302},
           {4, 979},
           {5, 763},
           {6, 993},
           {7, 443},
           {3, 177},
           {2, 3078},
           {26, 126},
           {25, 126}],
      extra_attrs =>
          [{1, 7953},
           {4, 1469},
           {5, 1145},
           {6, 1490},
           {7, 665},
           {3, 266}]};
get_lev_cfg({1023, 73}) ->
    #{base_attrs =>
          [{1, 5402},
           {4, 998},
           {5, 778},
           {6, 1012},
           {7, 452},
           {3, 181},
           {2, 3082},
           {26, 129},
           {25, 129}],
      extra_attrs =>
          [{1, 8103},
           {4, 1497},
           {5, 1167},
           {6, 1518},
           {7, 678},
           {3, 271}]};
get_lev_cfg({1023, 74}) ->
    #{base_attrs =>
          [{1, 5501},
           {4, 1016},
           {5, 792},
           {6, 1031},
           {7, 460},
           {3, 184},
           {2, 3086},
           {26, 131},
           {25, 131}],
      extra_attrs =>
          [{1, 8251},
           {4, 1524},
           {5, 1188},
           {6, 1546},
           {7, 690},
           {3, 276}]};
get_lev_cfg({1023, 75}) ->
    #{base_attrs =>
          [{1, 5598},
           {4, 1034},
           {5, 806},
           {6, 1049},
           {7, 468},
           {3, 187},
           {2, 3090},
           {26, 134},
           {25, 134}],
      extra_attrs =>
          [{1, 8398},
           {4, 1551},
           {5, 1209},
           {6, 1574},
           {7, 702},
           {3, 281}]};
get_lev_cfg({1023, 76}) ->
    #{base_attrs =>
          [{1, 5695},
           {4, 1052},
           {5, 820},
           {6, 1067},
           {7, 476},
           {3, 190},
           {2, 3094},
           {26, 136},
           {25, 136}],
      extra_attrs =>
          [{1, 8543},
           {4, 1578},
           {5, 1230},
           {6, 1601},
           {7, 714},
           {3, 286}]};
get_lev_cfg({1023, 77}) ->
    #{base_attrs =>
          [{1, 5792},
           {4, 1070},
           {5, 834},
           {6, 1085},
           {7, 484},
           {3, 194},
           {2, 3098},
           {26, 138},
           {25, 138}],
      extra_attrs =>
          [{1, 8688},
           {4, 1605},
           {5, 1251},
           {6, 1628},
           {7, 726},
           {3, 291}]};
get_lev_cfg({1023, 78}) ->
    #{base_attrs =>
          [{1, 5887},
           {4, 1087},
           {5, 848},
           {6, 1103},
           {7, 492},
           {3, 197},
           {2, 3102},
           {26, 141},
           {25, 141}],
      extra_attrs =>
          [{1, 8831},
           {4, 1631},
           {5, 1272},
           {6, 1655},
           {7, 738},
           {3, 295}]};
get_lev_cfg({1023, 79}) ->
    #{base_attrs =>
          [{1, 5981},
           {4, 1105},
           {5, 861},
           {6, 1121},
           {7, 500},
           {3, 200},
           {2, 3106},
           {26, 143},
           {25, 143}],
      extra_attrs =>
          [{1, 8972},
           {4, 1657},
           {5, 1292},
           {6, 1681},
           {7, 750},
           {3, 300}]};
get_lev_cfg({1023, 80}) ->
    #{base_attrs =>
          [{1, 6075},
           {4, 1122},
           {5, 875},
           {6, 1138},
           {7, 508},
           {3, 203},
           {2, 3110},
           {26, 146},
           {25, 146}],
      extra_attrs =>
          [{1, 9113},
           {4, 1683},
           {5, 1312},
           {6, 1708},
           {7, 762},
           {3, 305}]};
get_lev_cfg({1023, 81}) ->
    #{base_attrs =>
          [{1, 6168},
           {4, 1139},
           {5, 888},
           {6, 1156},
           {7, 516},
           {3, 206},
           {2, 3114},
           {26, 148},
           {25, 148}],
      extra_attrs =>
          [{1, 9252},
           {4, 1709},
           {5, 1332},
           {6, 1734},
           {7, 774},
           {3, 309}]};
get_lev_cfg({1023, 82}) ->
    #{base_attrs =>
          [{1, 6259},
           {4, 1156},
           {5, 901},
           {6, 1173},
           {7, 523},
           {3, 209},
           {2, 3118},
           {26, 150},
           {25, 150}],
      extra_attrs =>
          [{1, 9389},
           {4, 1734},
           {5, 1352},
           {6, 1759},
           {7, 785},
           {3, 314}]};
get_lev_cfg({1023, 83}) ->
    #{base_attrs =>
          [{1, 6350},
           {4, 1173},
           {5, 914},
           {6, 1190},
           {7, 531},
           {3, 212},
           {2, 3122},
           {26, 153},
           {25, 153}],
      extra_attrs =>
          [{1, 9525},
           {4, 1759},
           {5, 1372},
           {6, 1785},
           {7, 797},
           {3, 319}]};
get_lev_cfg({1023, 84}) ->
    #{base_attrs =>
          [{1, 6440},
           {4, 1189},
           {5, 927},
           {6, 1207},
           {7, 538},
           {3, 215},
           {2, 3126},
           {26, 155},
           {25, 155}],
      extra_attrs =>
          [{1, 9661},
           {4, 1784},
           {5, 1391},
           {6, 1810},
           {7, 808},
           {3, 323}]};
get_lev_cfg({1023, 85}) ->
    #{base_attrs =>
          [{1, 6529},
           {4, 1206},
           {5, 940},
           {6, 1223},
           {7, 546},
           {3, 218},
           {2, 3130},
           {26, 158},
           {25, 158}],
      extra_attrs =>
          [{1, 9794},
           {4, 1809},
           {5, 1410},
           {6, 1835},
           {7, 819},
           {3, 328}]};
get_lev_cfg({1023, 86}) ->
    #{base_attrs =>
          [{1, 6618},
           {4, 1222},
           {5, 953},
           {6, 1240},
           {7, 553},
           {3, 221},
           {2, 3134},
           {26, 160},
           {25, 160}],
      extra_attrs =>
          [{1, 9927},
           {4, 1833},
           {5, 1430},
           {6, 1860},
           {7, 830},
           {3, 332}]};
get_lev_cfg({1023, 87}) ->
    #{base_attrs =>
          [{1, 6705},
           {4, 1238},
           {5, 965},
           {6, 1256},
           {7, 561},
           {3, 224},
           {2, 3138},
           {26, 162},
           {25, 162}],
      extra_attrs =>
          [{1, 10057},
           {4, 1858},
           {5, 1448},
           {6, 1885},
           {7, 841},
           {3, 336}]};
get_lev_cfg({1023, 88}) ->
    #{base_attrs =>
          [{1, 6791},
           {4, 1254},
           {5, 978},
           {6, 1273},
           {7, 568},
           {3, 227},
           {2, 3142},
           {26, 165},
           {25, 165}],
      extra_attrs =>
          [{1, 10187},
           {4, 1882},
           {5, 1467},
           {6, 1909},
           {7, 852},
           {3, 341}]};
get_lev_cfg({1023, 89}) ->
    #{base_attrs =>
          [{1, 6877},
           {4, 1270},
           {5, 990},
           {6, 1289},
           {7, 575},
           {3, 230},
           {2, 3146},
           {26, 167},
           {25, 167}],
      extra_attrs =>
          [{1, 10315},
           {4, 1905},
           {5, 1486},
           {6, 1933},
           {7, 863},
           {3, 345}]};
get_lev_cfg({1023, 90}) ->
    #{base_attrs =>
          [{1, 6961},
           {4, 1286},
           {5, 1002},
           {6, 1304},
           {7, 582},
           {3, 233},
           {2, 3151},
           {26, 170},
           {25, 170}],
      extra_attrs =>
          [{1, 10442},
           {4, 1929},
           {5, 1504},
           {6, 1957},
           {7, 873},
           {3, 349}]};
get_lev_cfg({1023, 91}) ->
    #{base_attrs =>
          [{1, 7045},
           {4, 1301},
           {5, 1014},
           {6, 1320},
           {7, 589},
           {3, 236},
           {2, 3156},
           {26, 172},
           {25, 172}],
      extra_attrs =>
          [{1, 10568},
           {4, 1952},
           {5, 1522},
           {6, 1980},
           {7, 884},
           {3, 354}]};
get_lev_cfg({1023, 92}) ->
    #{base_attrs =>
          [{1, 7128},
           {4, 1317},
           {5, 1026},
           {6, 1336},
           {7, 596},
           {3, 238},
           {2, 3161},
           {26, 174},
           {25, 174}],
      extra_attrs =>
          [{1, 10693},
           {4, 1975},
           {5, 1540},
           {6, 2004},
           {7, 894},
           {3, 358}]};
get_lev_cfg({1023, 93}) ->
    #{base_attrs =>
          [{1, 7210},
           {4, 1332},
           {5, 1038},
           {6, 1351},
           {7, 603},
           {3, 241},
           {2, 3166},
           {26, 177},
           {25, 177}],
      extra_attrs =>
          [{1, 10816},
           {4, 1998},
           {5, 1558},
           {6, 2027},
           {7, 905},
           {3, 362}]};
get_lev_cfg({1023, 94}) ->
    #{base_attrs =>
          [{1, 7292},
           {4, 1347},
           {5, 1050},
           {6, 1366},
           {7, 610},
           {3, 244},
           {2, 3171},
           {26, 179},
           {25, 179}],
      extra_attrs =>
          [{1, 10938},
           {4, 2020},
           {5, 1575},
           {6, 2050},
           {7, 915},
           {3, 366}]};
get_lev_cfg({1023, 95}) ->
    #{base_attrs =>
          [{1, 7372},
           {4, 1362},
           {5, 1062},
           {6, 1381},
           {7, 616},
           {3, 247},
           {2, 3176},
           {26, 182},
           {25, 182}],
      extra_attrs =>
          [{1, 11058},
           {4, 2043},
           {5, 1593},
           {6, 2072},
           {7, 925},
           {3, 370}]};
get_lev_cfg({1023, 96}) ->
    #{base_attrs =>
          [{1, 7451},
           {4, 1376},
           {5, 1073},
           {6, 1396},
           {7, 623},
           {3, 249},
           {2, 3181},
           {26, 184},
           {25, 184}],
      extra_attrs =>
          [{1, 11177},
           {4, 2065},
           {5, 1610},
           {6, 2095},
           {7, 935},
           {3, 374}]};
get_lev_cfg({1023, 97}) ->
    #{base_attrs =>
          [{1, 7530},
           {4, 1391},
           {5, 1084},
           {6, 1411},
           {7, 630},
           {3, 252},
           {2, 3186},
           {26, 186},
           {25, 186}],
      extra_attrs =>
          [{1, 11295},
           {4, 2086},
           {5, 1627},
           {6, 2117},
           {7, 945},
           {3, 378}]};
get_lev_cfg({1023, 98}) ->
    #{base_attrs =>
          [{1, 7607},
           {4, 1405},
           {5, 1095},
           {6, 1425},
           {7, 636},
           {3, 254},
           {2, 3191},
           {26, 189},
           {25, 189}],
      extra_attrs =>
          [{1, 11411},
           {4, 2108},
           {5, 1643},
           {6, 2138},
           {7, 954},
           {3, 382}]};
get_lev_cfg({1023, 99}) ->
    #{base_attrs =>
          [{1, 7684},
           {4, 1419},
           {5, 1107},
           {6, 1440},
           {7, 643},
           {3, 257},
           {2, 3196},
           {26, 191},
           {25, 191}],
      extra_attrs =>
          [{1, 11527},
           {4, 2129},
           {5, 1660},
           {6, 2160},
           {7, 964},
           {3, 386}]};
get_lev_cfg({1023, 100}) ->
    #{base_attrs =>
          [{1, 7760},
           {4, 1433},
           {5, 1117},
           {6, 1454},
           {7, 649},
           {3, 260},
           {2, 3201},
           {26, 194},
           {25, 194}],
      extra_attrs =>
          [{1, 11641},
           {4, 2150},
           {5, 1676},
           {6, 2181},
           {7, 974},
           {3, 390}]};
get_lev_cfg({1023, 101}) ->
    #{base_attrs =>
          [{1, 7835},
           {4, 1447},
           {5, 1128},
           {6, 1468},
           {7, 655},
           {3, 262},
           {2, 3201},
           {26, 197},
           {25, 197}],
      extra_attrs =>
          [{1, 11753},
           {4, 2171},
           {5, 1693},
           {6, 2203},
           {7, 983},
           {3, 393}]};
get_lev_cfg({1023, 102}) ->
    #{base_attrs =>
          [{1, 7909},
           {4, 1461},
           {5, 1139},
           {6, 1482},
           {7, 661},
           {3, 265},
           {2, 3201},
           {26, 200},
           {25, 200}],
      extra_attrs =>
          [{1, 11864},
           {4, 2191},
           {5, 1709},
           {6, 2223},
           {7, 992},
           {3, 397}]};
get_lev_cfg({1023, 103}) ->
    #{base_attrs =>
          [{1, 7983},
           {4, 1474},
           {5, 1149},
           {6, 1496},
           {7, 667},
           {3, 267},
           {2, 3201},
           {26, 203},
           {25, 203}],
      extra_attrs =>
          [{1, 11974},
           {4, 2212},
           {5, 1724},
           {6, 2244},
           {7, 1001},
           {3, 401}]};
get_lev_cfg({1023, 104}) ->
    #{base_attrs =>
          [{1, 8055},
           {4, 1488},
           {5, 1160},
           {6, 1509},
           {7, 674},
           {3, 269},
           {2, 3201},
           {26, 206},
           {25, 206}],
      extra_attrs =>
          [{1, 12083},
           {4, 2232},
           {5, 1740},
           {6, 2264},
           {7, 1011},
           {3, 404}]};
get_lev_cfg({1023, 105}) ->
    #{base_attrs =>
          [{1, 8127},
           {4, 1501},
           {5, 1170},
           {6, 1523},
           {7, 679},
           {3, 272},
           {2, 3201},
           {26, 206},
           {25, 206}],
      extra_attrs =>
          [{1, 12190},
           {4, 2252},
           {5, 1756},
           {6, 2284},
           {7, 1019},
           {3, 408}]};
get_lev_cfg({1023, 106}) ->
    #{base_attrs =>
          [{1, 8197},
           {4, 1514},
           {5, 1180},
           {6, 1536},
           {7, 685},
           {3, 274},
           {2, 3201},
           {26, 212},
           {25, 212}],
      extra_attrs =>
          [{1, 12296},
           {4, 2271},
           {5, 1771},
           {6, 2304},
           {7, 1028},
           {3, 411}]};
get_lev_cfg({1023, 107}) ->
    #{base_attrs =>
          [{1, 8267},
           {4, 1527},
           {5, 1190},
           {6, 1549},
           {7, 691},
           {3, 276},
           {2, 3201},
           {26, 215},
           {25, 215}],
      extra_attrs =>
          [{1, 12401},
           {4, 2291},
           {5, 1786},
           {6, 2324},
           {7, 1037},
           {3, 415}]};
get_lev_cfg({1023, 108}) ->
    #{base_attrs =>
          [{1, 8336},
           {4, 1540},
           {5, 1200},
           {6, 1562},
           {7, 697},
           {3, 279},
           {2, 3201},
           {26, 218},
           {25, 218}],
      extra_attrs =>
          [{1, 12504},
           {4, 2310},
           {5, 1801},
           {6, 2343},
           {7, 1046},
           {3, 418}]};
get_lev_cfg({1023, 109}) ->
    #{base_attrs =>
          [{1, 8404},
           {4, 1552},
           {5, 1210},
           {6, 1575},
           {7, 703},
           {3, 281},
           {2, 3201},
           {26, 221},
           {25, 221}],
      extra_attrs =>
          [{1, 12606},
           {4, 2328},
           {5, 1815},
           {6, 2362},
           {7, 1054},
           {3, 422}]};
get_lev_cfg({1023, 110}) ->
    #{base_attrs =>
          [{1, 8471},
           {4, 1565},
           {5, 1220},
           {6, 1587},
           {7, 708},
           {3, 283},
           {2, 3201},
           {26, 224},
           {25, 224}],
      extra_attrs =>
          [{1, 12707},
           {4, 2347},
           {5, 1830},
           {6, 2381},
           {7, 1063},
           {3, 425}]};
get_lev_cfg({1023, 111}) ->
    #{base_attrs =>
          [{1, 8537},
           {4, 1577},
           {5, 1229},
           {6, 1600},
           {7, 714},
           {3, 286},
           {2, 3201},
           {26, 227},
           {25, 227}],
      extra_attrs =>
          [{1, 12806},
           {4, 2365},
           {5, 1844},
           {6, 2400},
           {7, 1071},
           {3, 429}]};
get_lev_cfg({1023, 112}) ->
    #{base_attrs =>
          [{1, 8602},
           {4, 1589},
           {5, 1239},
           {6, 1612},
           {7, 719},
           {3, 288},
           {2, 3201},
           {26, 230},
           {25, 230}],
      extra_attrs =>
          [{1, 12904},
           {4, 2384},
           {5, 1858},
           {6, 2418},
           {7, 1079},
           {3, 432}]};
get_lev_cfg({1023, 113}) ->
    #{base_attrs =>
          [{1, 8667},
           {4, 1601},
           {5, 1248},
           {6, 1624},
           {7, 725},
           {3, 290},
           {2, 3201},
           {26, 233},
           {25, 233}],
      extra_attrs =>
          [{1, 13001},
           {4, 2401},
           {5, 1872},
           {6, 2436},
           {7, 1087},
           {3, 435}]};
get_lev_cfg({1023, 114}) ->
    #{base_attrs =>
          [{1, 8730},
           {4, 1613},
           {5, 1257},
           {6, 1636},
           {7, 730},
           {3, 292},
           {2, 3201},
           {26, 236},
           {25, 236}],
      extra_attrs =>
          [{1, 13096},
           {4, 2419},
           {5, 1886},
           {6, 2454},
           {7, 1095},
           {3, 438}]};
get_lev_cfg({1023, 115}) ->
    #{base_attrs =>
          [{1, 8793},
           {4, 1624},
           {5, 1266},
           {6, 1648},
           {7, 735},
           {3, 294},
           {2, 3201},
           {26, 239},
           {25, 239}],
      extra_attrs =>
          [{1, 13190},
           {4, 2436},
           {5, 1900},
           {6, 2472},
           {7, 1103},
           {3, 441}]};
get_lev_cfg({1023, 116}) ->
    #{base_attrs =>
          [{1, 8855},
           {4, 1636},
           {5, 1275},
           {6, 1659},
           {7, 740},
           {3, 296},
           {2, 3201},
           {26, 242},
           {25, 242}],
      extra_attrs =>
          [{1, 13283},
           {4, 2454},
           {5, 1913},
           {6, 2489},
           {7, 1111},
           {3, 445}]};
get_lev_cfg({1023, 117}) ->
    #{base_attrs =>
          [{1, 8916},
           {4, 1647},
           {5, 1284},
           {6, 1671},
           {7, 746},
           {3, 298},
           {2, 3201},
           {26, 245},
           {25, 245}],
      extra_attrs =>
          [{1, 13374},
           {4, 2470},
           {5, 1926},
           {6, 2506},
           {7, 1119},
           {3, 448}]};
get_lev_cfg({1023, 118}) ->
    #{base_attrs =>
          [{1, 8976},
           {4, 1658},
           {5, 1293},
           {6, 1682},
           {7, 751},
           {3, 300},
           {2, 3201},
           {26, 248},
           {25, 248}],
      extra_attrs =>
          [{1, 13465},
           {4, 2487},
           {5, 1939},
           {6, 2523},
           {7, 1126},
           {3, 451}]};
get_lev_cfg({1023, 119}) ->
    #{base_attrs =>
          [{1, 9035},
           {4, 1669},
           {5, 1301},
           {6, 1693},
           {7, 756},
           {3, 302},
           {2, 3201},
           {26, 251},
           {25, 251}],
      extra_attrs =>
          [{1, 13553},
           {4, 2503},
           {5, 1952},
           {6, 2540},
           {7, 1134},
           {3, 454}]};
get_lev_cfg({1023, 120}) ->
    #{base_attrs =>
          [{1, 9094},
           {4, 1680},
           {5, 1310},
           {6, 1704},
           {7, 760},
           {3, 304},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13641},
           {4, 2520},
           {5, 1965},
           {6, 2556},
           {7, 1141},
           {3, 457}]};
get_lev_cfg({1023, 121}) ->
    #{base_attrs =>
          [{1, 9151},
           {4, 1690},
           {5, 1318},
           {6, 1715},
           {7, 765},
           {3, 306},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13727},
           {4, 2536},
           {5, 1977},
           {6, 2572},
           {7, 1148},
           {3, 459}]};
get_lev_cfg({1023, 122}) ->
    #{base_attrs =>
          [{1, 9208},
           {4, 1701},
           {5, 1326},
           {6, 1725},
           {7, 770},
           {3, 308},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13812},
           {4, 2551},
           {5, 1989},
           {6, 2588},
           {7, 1155},
           {3, 462}]};
get_lev_cfg({1023, 123}) ->
    #{base_attrs =>
          [{1, 9263},
           {4, 1711},
           {5, 1334},
           {6, 1736},
           {7, 775},
           {3, 310},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13895},
           {4, 2567},
           {5, 2001},
           {6, 2604},
           {7, 1162},
           {3, 465}]};
get_lev_cfg({1023, 124}) ->
    #{base_attrs =>
          [{1, 9318},
           {4, 1721},
           {5, 1342},
           {6, 1746},
           {7, 779},
           {3, 312},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 13977},
           {4, 2582},
           {5, 2013},
           {6, 2619},
           {7, 1169},
           {3, 468}]};
get_lev_cfg({1023, 125}) ->
    #{base_attrs =>
          [{1, 9372},
           {4, 1731},
           {5, 1350},
           {6, 1756},
           {7, 784},
           {3, 314},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 14058},
           {4, 2597},
           {5, 2025},
           {6, 2635},
           {7, 1176},
           {3, 471}]};
get_lev_cfg({1023, 126}) ->
    #{base_attrs =>
          [{1, 9425},
           {4, 1741},
           {5, 1357},
           {6, 1766},
           {7, 788},
           {3, 315},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 14138},
           {4, 2611},
           {5, 2036},
           {6, 2649},
           {7, 1182},
           {3, 473}]};
get_lev_cfg({1023, 127}) ->
    #{base_attrs =>
          [{1, 9477},
           {4, 1750},
           {5, 1365},
           {6, 1776},
           {7, 793},
           {3, 317},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 14216},
           {4, 2626},
           {5, 2047},
           {6, 2664},
           {7, 1189},
           {3, 476}]};
get_lev_cfg({1023, 128}) ->
    #{base_attrs =>
          [{1, 9529},
           {4, 1760},
           {5, 1372},
           {6, 1786},
           {7, 797},
           {3, 319},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 14293},
           {4, 2640},
           {5, 2059},
           {6, 2679},
           {7, 1195},
           {3, 478}]};
get_lev_cfg({1023, 129}) ->
    #{base_attrs =>
          [{1, 9579},
           {4, 1769},
           {5, 1379},
           {6, 1795},
           {7, 801},
           {3, 320},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 14368},
           {4, 2654},
           {5, 2069},
           {6, 2693},
           {7, 1202},
           {3, 481}]};
get_lev_cfg({1023, 130}) ->
    #{base_attrs =>
          [{1, 9628},
           {4, 1778},
           {5, 1387},
           {6, 1804},
           {7, 805},
           {3, 322},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 14443},
           {4, 2668},
           {5, 2080},
           {6, 2707},
           {7, 1208},
           {3, 483}]};
get_lev_cfg({1022, 1}) ->
    #{base_attrs =>
          [{1, 105},
           {4, 46},
           {5, 24},
           {6, 16},
           {7, 14},
           {3, 5},
           {2, 200},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 158}, {4, 69}, {5, 37}, {6, 24}, {7, 21}, {3, 8}]};
get_lev_cfg({1022, 2}) ->
    #{base_attrs =>
          [{1, 126},
           {4, 55},
           {5, 29},
           {6, 19},
           {7, 17},
           {3, 6},
           {2, 576},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 190}, {4, 83}, {5, 44}, {6, 29}, {7, 25}, {3, 9}]};
get_lev_cfg({1022, 3}) ->
    #{base_attrs =>
          [{1, 147},
           {4, 65},
           {5, 34},
           {6, 22},
           {7, 20},
           {3, 7},
           {2, 672},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 221},
           {4, 97},
           {5, 52},
           {6, 34},
           {7, 30},
           {3, 11}]};
get_lev_cfg({1022, 4}) ->
    #{base_attrs =>
          [{1, 168},
           {4, 74},
           {5, 39},
           {6, 25},
           {7, 23},
           {3, 8},
           {2, 767},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 253},
           {4, 111},
           {5, 59},
           {6, 38},
           {7, 34},
           {3, 13}]};
get_lev_cfg({1022, 5}) ->
    #{base_attrs =>
          [{1, 190},
           {4, 83},
           {5, 44},
           {6, 29},
           {7, 25},
           {3, 9},
           {2, 864},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 285},
           {4, 125},
           {5, 66},
           {6, 43},
           {7, 38},
           {3, 14}]};
get_lev_cfg({1022, 6}) ->
    #{base_attrs =>
          [{1, 211},
           {4, 93},
           {5, 49},
           {6, 32},
           {7, 28},
           {3, 10},
           {2, 960},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 316},
           {4, 139},
           {5, 74},
           {6, 48},
           {7, 43},
           {3, 16}]};
get_lev_cfg({1022, 7}) ->
    #{base_attrs =>
          [{1, 232},
           {4, 102},
           {5, 54},
           {6, 35},
           {7, 31},
           {3, 11},
           {2, 1055},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 348},
           {4, 153},
           {5, 81},
           {6, 53},
           {7, 47},
           {3, 17}]};
get_lev_cfg({1022, 8}) ->
    #{base_attrs =>
          [{1, 253},
           {4, 111},
           {5, 59},
           {6, 38},
           {7, 34},
           {3, 13},
           {2, 1152},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 380},
           {4, 167},
           {5, 89},
           {6, 58},
           {7, 51},
           {3, 19}]};
get_lev_cfg({1022, 9}) ->
    #{base_attrs =>
          [{1, 274},
           {4, 121},
           {5, 64},
           {6, 42},
           {7, 37},
           {3, 14},
           {2, 1248},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 411},
           {4, 181},
           {5, 96},
           {6, 63},
           {7, 56},
           {3, 21}]};
get_lev_cfg({1022, 10}) ->
    #{base_attrs =>
          [{1, 316},
           {4, 139},
           {5, 74},
           {6, 48},
           {7, 43},
           {3, 16},
           {2, 1440},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 475},
           {4, 209},
           {5, 111},
           {6, 72},
           {7, 64},
           {3, 24}]};
get_lev_cfg({1022, 11}) ->
    #{base_attrs =>
          [{1, 358},
           {4, 158},
           {5, 84},
           {6, 55},
           {7, 48},
           {3, 18},
           {2, 1631},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 538},
           {4, 237},
           {5, 126},
           {6, 82},
           {7, 73},
           {3, 27}]};
get_lev_cfg({1022, 12}) ->
    #{base_attrs =>
          [{1, 401},
           {4, 177},
           {5, 94},
           {6, 61},
           {7, 54},
           {3, 20},
           {2, 1824},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 601},
           {4, 265},
           {5, 141},
           {6, 92},
           {7, 82},
           {3, 30}]};
get_lev_cfg({1022, 13}) ->
    #{base_attrs =>
          [{1, 443},
           {4, 195},
           {5, 104},
           {6, 68},
           {7, 60},
           {3, 22},
           {2, 2016},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 665},
           {4, 293},
           {5, 156},
           {6, 102},
           {7, 90},
           {3, 34}]};
get_lev_cfg({1022, 14}) ->
    #{base_attrs =>
          [{1, 485},
           {4, 214},
           {5, 114},
           {6, 74},
           {7, 66},
           {3, 24},
           {2, 2207},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 728},
           {4, 321},
           {5, 171},
           {6, 111},
           {7, 99},
           {3, 37}]};
get_lev_cfg({1022, 15}) ->
    #{base_attrs =>
          [{1, 527},
           {4, 233},
           {5, 123},
           {6, 81},
           {7, 72},
           {3, 27},
           {2, 2400},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 791},
           {4, 349},
           {5, 185},
           {6, 121},
           {7, 108},
           {3, 40}]};
get_lev_cfg({1022, 16}) ->
    #{base_attrs =>
          [{1, 570},
           {4, 251},
           {5, 133},
           {6, 87},
           {7, 77},
           {3, 29},
           {2, 2408},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 855},
           {4, 377},
           {5, 200},
           {6, 131},
           {7, 116},
           {3, 43}]};
get_lev_cfg({1022, 17}) ->
    #{base_attrs =>
          [{1, 612},
           {4, 270},
           {5, 143},
           {6, 94},
           {7, 83},
           {3, 31},
           {2, 2417},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 918},
           {4, 405},
           {5, 215},
           {6, 141},
           {7, 125},
           {3, 47}]};
get_lev_cfg({1022, 18}) ->
    #{base_attrs =>
          [{1, 654},
           {4, 289},
           {5, 153},
           {6, 100},
           {7, 89},
           {3, 33},
           {2, 2426},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 981},
           {4, 433},
           {5, 230},
           {6, 150},
           {7, 133},
           {3, 50}]};
get_lev_cfg({1022, 19}) ->
    #{base_attrs =>
          [{1, 696},
           {4, 307},
           {5, 163},
           {6, 107},
           {7, 95},
           {3, 35},
           {2, 2436},
           {26, 0},
           {25, 0}],
      extra_attrs =>
          [{1, 1045},
           {4, 461},
           {5, 245},
           {6, 160},
           {7, 142},
           {3, 53}]};
get_lev_cfg({1022, 20}) ->
    #{base_attrs =>
          [{1, 739},
           {4, 326},
           {5, 173},
           {6, 113},
           {7, 100},
           {3, 37},
           {2, 2446},
           {26, 2},
           {25, 2}],
      extra_attrs =>
          [{1, 1108},
           {4, 489},
           {5, 260},
           {6, 170},
           {7, 151},
           {3, 56}]};
get_lev_cfg({1022, 21}) ->
    #{base_attrs =>
          [{1, 781},
           {4, 344},
           {5, 183},
           {6, 119},
           {7, 106},
           {3, 40},
           {2, 2457},
           {26, 4},
           {25, 4}],
      extra_attrs =>
          [{1, 1171},
           {4, 517},
           {5, 275},
           {6, 179},
           {7, 159},
           {3, 60}]};
get_lev_cfg({1022, 22}) ->
    #{base_attrs =>
          [{1, 823},
           {4, 363},
           {5, 193},
           {6, 126},
           {7, 112},
           {3, 42},
           {2, 2468},
           {26, 6},
           {25, 6}],
      extra_attrs =>
          [{1, 1235},
           {4, 545},
           {5, 290},
           {6, 189},
           {7, 168},
           {3, 63}]};
get_lev_cfg({1022, 23}) ->
    #{base_attrs =>
          [{1, 865},
           {4, 382},
           {5, 203},
           {6, 132},
           {7, 118},
           {3, 44},
           {2, 2480},
           {26, 9},
           {25, 9}],
      extra_attrs =>
          [{1, 1298},
           {4, 573},
           {5, 305},
           {6, 199},
           {7, 177},
           {3, 66}]};
get_lev_cfg({1022, 24}) ->
    #{base_attrs =>
          [{1, 908},
           {4, 400},
           {5, 213},
           {6, 139},
           {7, 123},
           {3, 46},
           {2, 2492},
           {26, 11},
           {25, 11}],
      extra_attrs =>
          [{1, 1362},
           {4, 601},
           {5, 319},
           {6, 209},
           {7, 185},
           {3, 69}]};
get_lev_cfg({1022, 25}) ->
    #{base_attrs =>
          [{1, 950},
           {4, 419},
           {5, 223},
           {6, 145},
           {7, 129},
           {3, 48},
           {2, 2505},
           {26, 14},
           {25, 14}],
      extra_attrs =>
          [{1, 1425},
           {4, 629},
           {5, 334},
           {6, 218},
           {7, 194},
           {3, 73}]};
get_lev_cfg({1022, 26}) ->
    #{base_attrs =>
          [{1, 992},
           {4, 438},
           {5, 233},
           {6, 152},
           {7, 135},
           {3, 50},
           {2, 2518},
           {26, 16},
           {25, 16}],
      extra_attrs =>
          [{1, 1488},
           {4, 657},
           {5, 349},
           {6, 228},
           {7, 203},
           {3, 76}]};
get_lev_cfg({1022, 27}) ->
    #{base_attrs =>
          [{1, 1034},
           {4, 456},
           {5, 243},
           {6, 158},
           {7, 141},
           {3, 53},
           {2, 2532},
           {26, 18},
           {25, 18}],
      extra_attrs =>
          [{1, 1552},
           {4, 685},
           {5, 364},
           {6, 238},
           {7, 211},
           {3, 79}]};
get_lev_cfg({1022, 28}) ->
    #{base_attrs =>
          [{1, 1076},
           {4, 475},
           {5, 252},
           {6, 165},
           {7, 146},
           {3, 55},
           {2, 2546},
           {26, 21},
           {25, 21}],
      extra_attrs =>
          [{1, 1615},
           {4, 713},
           {5, 379},
           {6, 248},
           {7, 220},
           {3, 82}]};
get_lev_cfg({1022, 29}) ->
    #{base_attrs =>
          [{1, 1119},
           {4, 494},
           {5, 262},
           {6, 171},
           {7, 152},
           {3, 57},
           {2, 2561},
           {26, 23},
           {25, 23}],
      extra_attrs =>
          [{1, 1678},
           {4, 741},
           {5, 394},
           {6, 257},
           {7, 229},
           {3, 86}]};
get_lev_cfg({1022, 30}) ->
    #{base_attrs =>
          [{1, 1161},
           {4, 512},
           {5, 272},
           {6, 178},
           {7, 158},
           {3, 59},
           {2, 2576},
           {26, 26},
           {25, 26}],
      extra_attrs =>
          [{1, 1742},
           {4, 769},
           {5, 409},
           {6, 267},
           {7, 237},
           {3, 89}]};
get_lev_cfg({1022, 31}) ->
    #{base_attrs =>
          [{1, 1203},
           {4, 531},
           {5, 282},
           {6, 184},
           {7, 164},
           {3, 61},
           {2, 2592},
           {26, 28},
           {25, 28}],
      extra_attrs =>
          [{1, 1805},
           {4, 797},
           {5, 424},
           {6, 277},
           {7, 246},
           {3, 92}]};
get_lev_cfg({1022, 32}) ->
    #{base_attrs =>
          [{1, 1245},
           {4, 550},
           {5, 292},
           {6, 191},
           {7, 169},
           {3, 63},
           {2, 2608},
           {26, 30},
           {25, 30}],
      extra_attrs =>
          [{1, 1868},
           {4, 825},
           {5, 438},
           {6, 287},
           {7, 254},
           {3, 95}]};
get_lev_cfg({1022, 33}) ->
    #{base_attrs =>
          [{1, 1288},
           {4, 568},
           {5, 302},
           {6, 197},
           {7, 175},
           {3, 66},
           {2, 2625},
           {26, 33},
           {25, 33}],
      extra_attrs =>
          [{1, 1932},
           {4, 853},
           {5, 453},
           {6, 296},
           {7, 263},
           {3, 99}]};
get_lev_cfg({1022, 34}) ->
    #{base_attrs =>
          [{1, 1330},
           {4, 587},
           {5, 312},
           {6, 204},
           {7, 181},
           {3, 68},
           {2, 2642},
           {26, 35},
           {25, 35}],
      extra_attrs =>
          [{1, 1995},
           {4, 881},
           {5, 468},
           {6, 306},
           {7, 272},
           {3, 102}]};
get_lev_cfg({1022, 35}) ->
    #{base_attrs =>
          [{1, 1372},
           {4, 606},
           {5, 322},
           {6, 210},
           {7, 187},
           {3, 70},
           {2, 2660},
           {26, 38},
           {25, 38}],
      extra_attrs =>
          [{1, 2058},
           {4, 909},
           {5, 483},
           {6, 316},
           {7, 280},
           {3, 105}]};
get_lev_cfg({1022, 36}) ->
    #{base_attrs =>
          [{1, 1414},
           {4, 624},
           {5, 332},
           {6, 217},
           {7, 193},
           {3, 72},
           {2, 2678},
           {26, 40},
           {25, 40}],
      extra_attrs =>
          [{1, 2122},
           {4, 937},
           {5, 498},
           {6, 325},
           {7, 289},
           {3, 108}]};
get_lev_cfg({1022, 37}) ->
    #{base_attrs =>
          [{1, 1457},
           {4, 643},
           {5, 342},
           {6, 223},
           {7, 198},
           {3, 74},
           {2, 2697},
           {26, 42},
           {25, 42}],
      extra_attrs =>
          [{1, 2185},
           {4, 965},
           {5, 513},
           {6, 335},
           {7, 298},
           {3, 112}]};
get_lev_cfg({1022, 38}) ->
    #{base_attrs =>
          [{1, 1499},
           {4, 662},
           {5, 352},
           {6, 230},
           {7, 204},
           {3, 76},
           {2, 2716},
           {26, 45},
           {25, 45}],
      extra_attrs =>
          [{1, 2248},
           {4, 993},
           {5, 528},
           {6, 345},
           {7, 306},
           {3, 115}]};
get_lev_cfg({1022, 39}) ->
    #{base_attrs =>
          [{1, 1541},
           {4, 680},
           {5, 362},
           {6, 236},
           {7, 210},
           {3, 79},
           {2, 2736},
           {26, 47},
           {25, 47}],
      extra_attrs =>
          [{1, 2312},
           {4, 1020},
           {5, 543},
           {6, 355},
           {7, 315},
           {3, 118}]};
get_lev_cfg({1022, 40}) ->
    #{base_attrs =>
          [{1, 1583},
           {4, 699},
           {5, 371},
           {6, 243},
           {7, 216},
           {3, 81},
           {2, 2756},
           {26, 50},
           {25, 50}],
      extra_attrs =>
          [{1, 2375},
           {4, 1048},
           {5, 557},
           {6, 364},
           {7, 324},
           {3, 121}]};
get_lev_cfg({1022, 41}) ->
    #{base_attrs =>
          [{1, 1625},
           {4, 717},
           {5, 381},
           {6, 249},
           {7, 221},
           {3, 83},
           {2, 2777},
           {26, 52},
           {25, 52}],
      extra_attrs =>
          [{1, 2438},
           {4, 1076},
           {5, 572},
           {6, 374},
           {7, 332},
           {3, 125}]};
get_lev_cfg({1022, 42}) ->
    #{base_attrs =>
          [{1, 1668},
           {4, 736},
           {5, 391},
           {6, 256},
           {7, 227},
           {3, 85},
           {2, 2798},
           {26, 54},
           {25, 54}],
      extra_attrs =>
          [{1, 2502},
           {4, 1104},
           {5, 587},
           {6, 384},
           {7, 341},
           {3, 128}]};
get_lev_cfg({1022, 43}) ->
    #{base_attrs =>
          [{1, 1710},
           {4, 755},
           {5, 401},
           {6, 262},
           {7, 233},
           {3, 87},
           {2, 2820},
           {26, 57},
           {25, 57}],
      extra_attrs =>
          [{1, 2565},
           {4, 1132},
           {5, 602},
           {6, 394},
           {7, 350},
           {3, 131}]};
get_lev_cfg({1022, 44}) ->
    #{base_attrs =>
          [{1, 1752},
           {4, 773},
           {5, 411},
           {6, 269},
           {7, 239},
           {3, 89},
           {2, 2842},
           {26, 59},
           {25, 59}],
      extra_attrs =>
          [{1, 2629},
           {4, 1160},
           {5, 617},
           {6, 403},
           {7, 358},
           {3, 134}]};
get_lev_cfg({1022, 45}) ->
    #{base_attrs =>
          [{1, 1794},
           {4, 792},
           {5, 421},
           {6, 275},
           {7, 244},
           {3, 92},
           {2, 2865},
           {26, 62},
           {25, 62}],
      extra_attrs =>
          [{1, 2692},
           {4, 1188},
           {5, 632},
           {6, 413},
           {7, 367},
           {3, 138}]};
get_lev_cfg({1022, 46}) ->
    #{base_attrs =>
          [{1, 1837},
           {4, 811},
           {5, 431},
           {6, 282},
           {7, 250},
           {3, 94},
           {2, 2888},
           {26, 64},
           {25, 64}],
      extra_attrs =>
          [{1, 2755},
           {4, 1216},
           {5, 647},
           {6, 423},
           {7, 375},
           {3, 141}]};
get_lev_cfg({1022, 47}) ->
    #{base_attrs =>
          [{1, 1879},
           {4, 829},
           {5, 441},
           {6, 288},
           {7, 256},
           {3, 96},
           {2, 2912},
           {26, 66},
           {25, 66}],
      extra_attrs =>
          [{1, 2819},
           {4, 1244},
           {5, 662},
           {6, 432},
           {7, 384},
           {3, 144}]};
get_lev_cfg({1022, 48}) ->
    #{base_attrs =>
          [{1, 1921},
           {4, 848},
           {5, 451},
           {6, 295},
           {7, 262},
           {3, 98},
           {2, 2936},
           {26, 69},
           {25, 69}],
      extra_attrs =>
          [{1, 2882},
           {4, 1272},
           {5, 676},
           {6, 442},
           {7, 393},
           {3, 147}]};
get_lev_cfg({1022, 49}) ->
    #{base_attrs =>
          [{1, 1963},
           {4, 867},
           {5, 461},
           {6, 301},
           {7, 267},
           {3, 100},
           {2, 2961},
           {26, 71},
           {25, 71}],
      extra_attrs =>
          [{1, 2945},
           {4, 1300},
           {5, 691},
           {6, 452},
           {7, 401},
           {3, 151}]};
get_lev_cfg({1022, 50}) ->
    #{base_attrs =>
          [{1, 2006},
           {4, 885},
           {5, 471},
           {6, 308},
           {7, 273},
           {3, 102},
           {2, 2986},
           {26, 74},
           {25, 74}],
      extra_attrs =>
          [{1, 3009},
           {4, 1328},
           {5, 706},
           {6, 462},
           {7, 410},
           {3, 154}]};
get_lev_cfg({1022, 51}) ->
    #{base_attrs =>
          [{1, 2048},
           {4, 904},
           {5, 481},
           {6, 314},
           {7, 279},
           {3, 105},
           {2, 3012},
           {26, 76},
           {25, 76}],
      extra_attrs =>
          [{1, 3072},
           {4, 1356},
           {5, 721},
           {6, 471},
           {7, 419},
           {3, 157}]};
get_lev_cfg({1022, 52}) ->
    #{base_attrs =>
          [{1, 2090},
           {4, 923},
           {5, 491},
           {6, 321},
           {7, 285},
           {3, 107},
           {2, 3015},
           {26, 78},
           {25, 78}],
      extra_attrs =>
          [{1, 3135},
           {4, 1384},
           {5, 736},
           {6, 481},
           {7, 427},
           {3, 160}]};
get_lev_cfg({1022, 53}) ->
    #{base_attrs =>
          [{1, 2132},
           {4, 941},
           {5, 500},
           {6, 327},
           {7, 290},
           {3, 109},
           {2, 3018},
           {26, 81},
           {25, 81}],
      extra_attrs =>
          [{1, 3199},
           {4, 1412},
           {5, 751},
           {6, 491},
           {7, 436},
           {3, 164}]};
get_lev_cfg({1022, 54}) ->
    #{base_attrs =>
          [{1, 2175},
           {4, 960},
           {5, 510},
           {6, 334},
           {7, 296},
           {3, 111},
           {2, 3021},
           {26, 83},
           {25, 83}],
      extra_attrs =>
          [{1, 3262},
           {4, 1440},
           {5, 766},
           {6, 501},
           {7, 445},
           {3, 167}]};
get_lev_cfg({1022, 55}) ->
    #{base_attrs =>
          [{1, 2217},
           {4, 979},
           {5, 520},
           {6, 340},
           {7, 302},
           {3, 113},
           {2, 3024},
           {26, 86},
           {25, 86}],
      extra_attrs =>
          [{1, 3325},
           {4, 1468},
           {5, 781},
           {6, 510},
           {7, 453},
           {3, 170}]};
get_lev_cfg({1022, 56}) ->
    #{base_attrs =>
          [{1, 2259},
           {4, 997},
           {5, 530},
           {6, 347},
           {7, 308},
           {3, 115},
           {2, 3027},
           {26, 88},
           {25, 88}],
      extra_attrs =>
          [{1, 3389},
           {4, 1496},
           {5, 796},
           {6, 520},
           {7, 462},
           {3, 173}]};
get_lev_cfg({1022, 57}) ->
    #{base_attrs =>
          [{1, 2301},
           {4, 1016},
           {5, 540},
           {6, 353},
           {7, 313},
           {3, 118},
           {2, 3030},
           {26, 90},
           {25, 90}],
      extra_attrs =>
          [{1, 3452},
           {4, 1524},
           {5, 810},
           {6, 530},
           {7, 470},
           {3, 177}]};
get_lev_cfg({1022, 58}) ->
    #{base_attrs =>
          [{1, 2343},
           {4, 1034},
           {5, 550},
           {6, 359},
           {7, 319},
           {3, 120},
           {2, 3033},
           {26, 93},
           {25, 93}],
      extra_attrs =>
          [{1, 3515},
           {4, 1552},
           {5, 825},
           {6, 539},
           {7, 479},
           {3, 180}]};
get_lev_cfg({1022, 59}) ->
    #{base_attrs =>
          [{1, 2386},
           {4, 1053},
           {5, 560},
           {6, 366},
           {7, 325},
           {3, 122},
           {2, 3036},
           {26, 95},
           {25, 95}],
      extra_attrs =>
          [{1, 3579},
           {4, 1580},
           {5, 840},
           {6, 549},
           {7, 488},
           {3, 183}]};
get_lev_cfg({1022, 60}) ->
    #{base_attrs =>
          [{1, 2476},
           {4, 1093},
           {5, 581},
           {6, 380},
           {7, 337},
           {3, 127},
           {2, 3039},
           {26, 98},
           {25, 98}],
      extra_attrs =>
          [{1, 3714},
           {4, 1640},
           {5, 872},
           {6, 570},
           {7, 506},
           {3, 190}]};
get_lev_cfg({1022, 61}) ->
    #{base_attrs =>
          [{1, 2544},
           {4, 1123},
           {5, 597},
           {6, 390},
           {7, 347},
           {3, 130},
           {2, 3042},
           {26, 100},
           {25, 100}],
      extra_attrs =>
          [{1, 3816},
           {4, 1685},
           {5, 896},
           {6, 586},
           {7, 520},
           {3, 195}]};
get_lev_cfg({1022, 62}) ->
    #{base_attrs =>
          [{1, 2611},
           {4, 1153},
           {5, 613},
           {6, 401},
           {7, 356},
           {3, 134},
           {2, 3045},
           {26, 102},
           {25, 102}],
      extra_attrs =>
          [{1, 3916},
           {4, 1729},
           {5, 919},
           {6, 601},
           {7, 534},
           {3, 201}]};
get_lev_cfg({1022, 63}) ->
    #{base_attrs =>
          [{1, 2677},
           {4, 1182},
           {5, 628},
           {6, 411},
           {7, 365},
           {3, 137},
           {2, 3048},
           {26, 105},
           {25, 105}],
      extra_attrs =>
          [{1, 4016},
           {4, 1773},
           {5, 943},
           {6, 616},
           {7, 547},
           {3, 206}]};
get_lev_cfg({1022, 64}) ->
    #{base_attrs =>
          [{1, 2743},
           {4, 1211},
           {5, 644},
           {6, 421},
           {7, 374},
           {3, 140},
           {2, 3051},
           {26, 107},
           {25, 107}],
      extra_attrs =>
          [{1, 4115},
           {4, 1817},
           {5, 966},
           {6, 632},
           {7, 561},
           {3, 211}]};
get_lev_cfg({1022, 65}) ->
    #{base_attrs =>
          [{1, 2809},
           {4, 1240},
           {5, 659},
           {6, 431},
           {7, 383},
           {3, 144},
           {2, 3054},
           {26, 110},
           {25, 110}],
      extra_attrs =>
          [{1, 4213},
           {4, 1860},
           {5, 989},
           {6, 647},
           {7, 574},
           {3, 216}]};
get_lev_cfg({1022, 66}) ->
    #{base_attrs =>
          [{1, 2874},
           {4, 1269},
           {5, 675},
           {6, 441},
           {7, 392},
           {3, 147},
           {2, 3057},
           {26, 112},
           {25, 112}],
      extra_attrs =>
          [{1, 4311},
           {4, 1903},
           {5, 1012},
           {6, 662},
           {7, 588},
           {3, 221}]};
get_lev_cfg({1022, 67}) ->
    #{base_attrs =>
          [{1, 2938},
           {4, 1297},
           {5, 690},
           {6, 451},
           {7, 400},
           {3, 150},
           {2, 3060},
           {26, 114},
           {25, 114}],
      extra_attrs =>
          [{1, 4407},
           {4, 1946},
           {5, 1035},
           {6, 676},
           {7, 601},
           {3, 226}]};
get_lev_cfg({1022, 68}) ->
    #{base_attrs =>
          [{1, 3002},
           {4, 1325},
           {5, 705},
           {6, 461},
           {7, 409},
           {3, 154},
           {2, 3063},
           {26, 117},
           {25, 117}],
      extra_attrs =>
          [{1, 4503},
           {4, 1988},
           {5, 1057},
           {6, 691},
           {7, 614},
           {3, 231}]};
get_lev_cfg({1022, 69}) ->
    #{base_attrs =>
          [{1, 3065},
           {4, 1353},
           {5, 720},
           {6, 470},
           {7, 418},
           {3, 157},
           {2, 3066},
           {26, 119},
           {25, 119}],
      extra_attrs =>
          [{1, 4598},
           {4, 2030},
           {5, 1080},
           {6, 706},
           {7, 627},
           {3, 235}]};
get_lev_cfg({1022, 70}) ->
    #{base_attrs =>
          [{1, 3128},
           {4, 1381},
           {5, 734},
           {6, 480},
           {7, 426},
           {3, 160},
           {2, 3070},
           {26, 122},
           {25, 122}],
      extra_attrs =>
          [{1, 4692},
           {4, 2072},
           {5, 1102},
           {6, 720},
           {7, 640},
           {3, 240}]};
get_lev_cfg({1022, 71}) ->
    #{base_attrs =>
          [{1, 3190},
           {4, 1408},
           {5, 749},
           {6, 490},
           {7, 435},
           {3, 163},
           {2, 3074},
           {26, 124},
           {25, 124}],
      extra_attrs =>
          [{1, 4785},
           {4, 2113},
           {5, 1124},
           {6, 735},
           {7, 652},
           {3, 245}]};
get_lev_cfg({1022, 72}) ->
    #{base_attrs =>
          [{1, 3252},
           {4, 1436},
           {5, 763},
           {6, 499},
           {7, 443},
           {3, 166},
           {2, 3078},
           {26, 126},
           {25, 126}],
      extra_attrs =>
          [{1, 4878},
           {4, 2154},
           {5, 1145},
           {6, 749},
           {7, 665},
           {3, 250}]};
get_lev_cfg({1022, 73}) ->
    #{base_attrs =>
          [{1, 3313},
           {4, 1463},
           {5, 778},
           {6, 508},
           {7, 452},
           {3, 170},
           {2, 3082},
           {26, 129},
           {25, 129}],
      extra_attrs =>
          [{1, 4970},
           {4, 2194},
           {5, 1167},
           {6, 763},
           {7, 678},
           {3, 255}]};
get_lev_cfg({1022, 74}) ->
    #{base_attrs =>
          [{1, 3374},
           {4, 1489},
           {5, 792},
           {6, 518},
           {7, 460},
           {3, 173},
           {2, 3086},
           {26, 131},
           {25, 131}],
      extra_attrs =>
          [{1, 5061},
           {4, 2234},
           {5, 1188},
           {6, 777},
           {7, 690},
           {3, 259}]};
get_lev_cfg({1022, 75}) ->
    #{base_attrs =>
          [{1, 3433},
           {4, 1516},
           {5, 806},
           {6, 527},
           {7, 468},
           {3, 176},
           {2, 3090},
           {26, 134},
           {25, 134}],
      extra_attrs =>
          [{1, 5150},
           {4, 2274},
           {5, 1209},
           {6, 791},
           {7, 702},
           {3, 264}]};
get_lev_cfg({1022, 76}) ->
    #{base_attrs =>
          [{1, 3493},
           {4, 1542},
           {5, 820},
           {6, 536},
           {7, 476},
           {3, 179},
           {2, 3094},
           {26, 136},
           {25, 136}],
      extra_attrs =>
          [{1, 5240},
           {4, 2313},
           {5, 1230},
           {6, 804},
           {7, 714},
           {3, 268}]};
get_lev_cfg({1022, 77}) ->
    #{base_attrs =>
          [{1, 3552},
           {4, 1568},
           {5, 834},
           {6, 545},
           {7, 484},
           {3, 182},
           {2, 3098},
           {26, 138},
           {25, 138}],
      extra_attrs =>
          [{1, 5328},
           {4, 2352},
           {5, 1251},
           {6, 818},
           {7, 726},
           {3, 273}]};
get_lev_cfg({1022, 78}) ->
    #{base_attrs =>
          [{1, 3610},
           {4, 1594},
           {5, 848},
           {6, 554},
           {7, 492},
           {3, 185},
           {2, 3102},
           {26, 141},
           {25, 141}],
      extra_attrs =>
          [{1, 5416},
           {4, 2391},
           {5, 1272},
           {6, 831},
           {7, 738},
           {3, 277}]};
get_lev_cfg({1022, 79}) ->
    #{base_attrs =>
          [{1, 3668},
           {4, 1619},
           {5, 861},
           {6, 563},
           {7, 500},
           {3, 188},
           {2, 3106},
           {26, 143},
           {25, 143}],
      extra_attrs =>
          [{1, 5503},
           {4, 2429},
           {5, 1292},
           {6, 845},
           {7, 750},
           {3, 282}]};
get_lev_cfg({1022, 80}) ->
    #{base_attrs =>
          [{1, 3726},
           {4, 1645},
           {5, 875},
           {6, 572},
           {7, 508},
           {3, 191},
           {2, 3110},
           {26, 146},
           {25, 146}],
      extra_attrs =>
          [{1, 5589},
           {4, 2468},
           {5, 1312},
           {6, 858},
           {7, 762},
           {3, 286}]};
get_lev_cfg({1022, 81}) ->
    #{base_attrs =>
          [{1, 3783},
           {4, 1670},
           {5, 888},
           {6, 581},
           {7, 516},
           {3, 194},
           {2, 3114},
           {26, 148},
           {25, 148}],
      extra_attrs =>
          [{1, 5674},
           {4, 2505},
           {5, 1332},
           {6, 871},
           {7, 774},
           {3, 291}]};
get_lev_cfg({1022, 82}) ->
    #{base_attrs =>
          [{1, 3839},
           {4, 1695},
           {5, 901},
           {6, 589},
           {7, 523},
           {3, 197},
           {2, 3118},
           {26, 150},
           {25, 150}],
      extra_attrs =>
          [{1, 5758},
           {4, 2542},
           {5, 1352},
           {6, 884},
           {7, 785},
           {3, 295}]};
get_lev_cfg({1022, 83}) ->
    #{base_attrs =>
          [{1, 3894},
           {4, 1719},
           {5, 914},
           {6, 598},
           {7, 531},
           {3, 199},
           {2, 3122},
           {26, 153},
           {25, 153}],
      extra_attrs =>
          [{1, 5842},
           {4, 2579},
           {5, 1372},
           {6, 897},
           {7, 797},
           {3, 299}]};
get_lev_cfg({1022, 84}) ->
    #{base_attrs =>
          [{1, 3950},
           {4, 1744},
           {5, 927},
           {6, 606},
           {7, 538},
           {3, 202},
           {2, 3126},
           {26, 155},
           {25, 155}],
      extra_attrs =>
          [{1, 5925},
           {4, 2616},
           {5, 1391},
           {6, 910},
           {7, 808},
           {3, 304}]};
get_lev_cfg({1022, 85}) ->
    #{base_attrs =>
          [{1, 4004},
           {4, 1768},
           {5, 940},
           {6, 615},
           {7, 546},
           {3, 205},
           {2, 3130},
           {26, 158},
           {25, 158}],
      extra_attrs =>
          [{1, 6007},
           {4, 2652},
           {5, 1410},
           {6, 922},
           {7, 819},
           {3, 308}]};
get_lev_cfg({1022, 86}) ->
    #{base_attrs =>
          [{1, 4059},
           {4, 1792},
           {5, 953},
           {6, 623},
           {7, 553},
           {3, 208},
           {2, 3134},
           {26, 160},
           {25, 160}],
      extra_attrs =>
          [{1, 6088},
           {4, 2688},
           {5, 1430},
           {6, 935},
           {7, 830},
           {3, 312}]};
get_lev_cfg({1022, 87}) ->
    #{base_attrs =>
          [{1, 4112},
           {4, 1815},
           {5, 965},
           {6, 631},
           {7, 561},
           {3, 211},
           {2, 3138},
           {26, 162},
           {25, 162}],
      extra_attrs =>
          [{1, 6168},
           {4, 2723},
           {5, 1448},
           {6, 947},
           {7, 841},
           {3, 316}]};
get_lev_cfg({1022, 88}) ->
    #{base_attrs =>
          [{1, 4165},
           {4, 1839},
           {5, 978},
           {6, 639},
           {7, 568},
           {3, 213},
           {2, 3142},
           {26, 165},
           {25, 165}],
      extra_attrs =>
          [{1, 6248},
           {4, 2759},
           {5, 1467},
           {6, 959},
           {7, 852},
           {3, 320}]};
get_lev_cfg({1022, 89}) ->
    #{base_attrs =>
          [{1, 4218},
           {4, 1862},
           {5, 990},
           {6, 647},
           {7, 575},
           {3, 216},
           {2, 3146},
           {26, 167},
           {25, 167}],
      extra_attrs =>
          [{1, 6327},
           {4, 2793},
           {5, 1486},
           {6, 971},
           {7, 863},
           {3, 324}]};
get_lev_cfg({1022, 90}) ->
    #{base_attrs =>
          [{1, 4270},
           {4, 1885},
           {5, 1002},
           {6, 655},
           {7, 582},
           {3, 219},
           {2, 3151},
           {26, 170},
           {25, 170}],
      extra_attrs =>
          [{1, 6405},
           {4, 2828},
           {5, 1504},
           {6, 983},
           {7, 873},
           {3, 328}]};
get_lev_cfg({1022, 91}) ->
    #{base_attrs =>
          [{1, 4321},
           {4, 1908},
           {5, 1014},
           {6, 663},
           {7, 589},
           {3, 221},
           {2, 3156},
           {26, 172},
           {25, 172}],
      extra_attrs =>
          [{1, 6482},
           {4, 2862},
           {5, 1522},
           {6, 995},
           {7, 884},
           {3, 332}]};
get_lev_cfg({1022, 92}) ->
    #{base_attrs =>
          [{1, 4372},
           {4, 1930},
           {5, 1026},
           {6, 671},
           {7, 596},
           {3, 224},
           {2, 3161},
           {26, 174},
           {25, 174}],
      extra_attrs =>
          [{1, 6558},
           {4, 2895},
           {5, 1540},
           {6, 1007},
           {7, 894},
           {3, 336}]};
get_lev_cfg({1022, 93}) ->
    #{base_attrs =>
          [{1, 4422},
           {4, 1952},
           {5, 1038},
           {6, 679},
           {7, 603},
           {3, 226},
           {2, 3166},
           {26, 177},
           {25, 177}],
      extra_attrs =>
          [{1, 6634},
           {4, 2929},
           {5, 1558},
           {6, 1018},
           {7, 905},
           {3, 340}]};
get_lev_cfg({1022, 94}) ->
    #{base_attrs =>
          [{1, 4472},
           {4, 1974},
           {5, 1050},
           {6, 686},
           {7, 610},
           {3, 229},
           {2, 3171},
           {26, 179},
           {25, 179}],
      extra_attrs =>
          [{1, 6708},
           {4, 2962},
           {5, 1575},
           {6, 1030},
           {7, 915},
           {3, 344}]};
get_lev_cfg({1022, 95}) ->
    #{base_attrs =>
          [{1, 4521},
           {4, 1996},
           {5, 1062},
           {6, 694},
           {7, 616},
           {3, 232},
           {2, 3176},
           {26, 182},
           {25, 182}],
      extra_attrs =>
          [{1, 6782},
           {4, 2994},
           {5, 1593},
           {6, 1041},
           {7, 925},
           {3, 348}]};
get_lev_cfg({1022, 96}) ->
    #{base_attrs =>
          [{1, 4570},
           {4, 2018},
           {5, 1073},
           {6, 701},
           {7, 623},
           {3, 234},
           {2, 3181},
           {26, 184},
           {25, 184}],
      extra_attrs =>
          [{1, 6855},
           {4, 3027},
           {5, 1610},
           {6, 1052},
           {7, 935},
           {3, 351}]};
get_lev_cfg({1022, 97}) ->
    #{base_attrs =>
          [{1, 4618},
           {4, 2039},
           {5, 1084},
           {6, 709},
           {7, 630},
           {3, 237},
           {2, 3186},
           {26, 186},
           {25, 186}],
      extra_attrs =>
          [{1, 6927},
           {4, 3059},
           {5, 1627},
           {6, 1064},
           {7, 945},
           {3, 355}]};
get_lev_cfg({1022, 98}) ->
    #{base_attrs =>
          [{1, 4666},
           {4, 2060},
           {5, 1095},
           {6, 716},
           {7, 636},
           {3, 239},
           {2, 3191},
           {26, 189},
           {25, 189}],
      extra_attrs =>
          [{1, 6999},
           {4, 3090},
           {5, 1643},
           {6, 1074},
           {7, 954},
           {3, 359}]};
get_lev_cfg({1022, 99}) ->
    #{base_attrs =>
          [{1, 4713},
           {4, 2081},
           {5, 1107},
           {6, 723},
           {7, 643},
           {3, 241},
           {2, 3196},
           {26, 191},
           {25, 191}],
      extra_attrs =>
          [{1, 7070},
           {4, 3121},
           {5, 1660},
           {6, 1085},
           {7, 964},
           {3, 362}]};
get_lev_cfg({1022, 100}) ->
    #{base_attrs =>
          [{1, 4759},
           {4, 2101},
           {5, 1117},
           {6, 731},
           {7, 649},
           {3, 244},
           {2, 3201},
           {26, 194},
           {25, 194}],
      extra_attrs =>
          [{1, 7139},
           {4, 3152},
           {5, 1676},
           {6, 1096},
           {7, 974},
           {3, 366}]};
get_lev_cfg({1022, 101}) ->
    #{base_attrs =>
          [{1, 4805},
           {4, 2122},
           {5, 1128},
           {6, 738},
           {7, 655},
           {3, 246},
           {2, 3201},
           {26, 197},
           {25, 197}],
      extra_attrs =>
          [{1, 7208},
           {4, 3183},
           {5, 1693},
           {6, 1107},
           {7, 983},
           {3, 369}]};
get_lev_cfg({1022, 102}) ->
    #{base_attrs =>
          [{1, 4851},
           {4, 2142},
           {5, 1139},
           {6, 745},
           {7, 661},
           {3, 248},
           {2, 3201},
           {26, 200},
           {25, 200}],
      extra_attrs =>
          [{1, 7277},
           {4, 3213},
           {5, 1709},
           {6, 1117},
           {7, 992},
           {3, 373}]};
get_lev_cfg({1022, 103}) ->
    #{base_attrs =>
          [{1, 4896},
           {4, 2161},
           {5, 1149},
           {6, 751},
           {7, 667},
           {3, 251},
           {2, 3201},
           {26, 203},
           {25, 203}],
      extra_attrs =>
          [{1, 7344},
           {4, 3242},
           {5, 1724},
           {6, 1127},
           {7, 1001},
           {3, 376}]};
get_lev_cfg({1022, 104}) ->
    #{base_attrs =>
          [{1, 4940},
           {4, 2181},
           {5, 1160},
           {6, 758},
           {7, 674},
           {3, 253},
           {2, 3201},
           {26, 206},
           {25, 206}],
      extra_attrs =>
          [{1, 7411},
           {4, 3272},
           {5, 1740},
           {6, 1138},
           {7, 1011},
           {3, 380}]};
get_lev_cfg({1022, 105}) ->
    #{base_attrs =>
          [{1, 4984},
           {4, 2200},
           {5, 1170},
           {6, 765},
           {7, 679},
           {3, 255},
           {2, 3201},
           {26, 206},
           {25, 206}],
      extra_attrs =>
          [{1, 7476},
           {4, 3301},
           {5, 1756},
           {6, 1148},
           {7, 1019},
           {3, 383}]};
get_lev_cfg({1022, 106}) ->
    #{base_attrs =>
          [{1, 5027},
           {4, 2220},
           {5, 1180},
           {6, 772},
           {7, 685},
           {3, 258},
           {2, 3201},
           {26, 212},
           {25, 212}],
      extra_attrs =>
          [{1, 7541},
           {4, 3330},
           {5, 1771},
           {6, 1158},
           {7, 1028},
           {3, 387}]};
get_lev_cfg({1022, 107}) ->
    #{base_attrs =>
          [{1, 5070},
           {4, 2239},
           {5, 1190},
           {6, 778},
           {7, 691},
           {3, 260},
           {2, 3201},
           {26, 215},
           {25, 215}],
      extra_attrs =>
          [{1, 7606},
           {4, 3358},
           {5, 1786},
           {6, 1168},
           {7, 1037},
           {3, 390}]};
get_lev_cfg({1022, 108}) ->
    #{base_attrs =>
          [{1, 5112},
           {4, 2257},
           {5, 1200},
           {6, 785},
           {7, 697},
           {3, 262},
           {2, 3201},
           {26, 218},
           {25, 218}],
      extra_attrs =>
          [{1, 7669},
           {4, 3386},
           {5, 1801},
           {6, 1177},
           {7, 1046},
           {3, 393}]};
get_lev_cfg({1022, 109}) ->
    #{base_attrs =>
          [{1, 5154},
           {4, 2276},
           {5, 1210},
           {6, 791},
           {7, 703},
           {3, 264},
           {2, 3201},
           {26, 221},
           {25, 221}],
      extra_attrs =>
          [{1, 7731},
           {4, 3414},
           {5, 1815},
           {6, 1187},
           {7, 1054},
           {3, 396}]};
get_lev_cfg({1022, 110}) ->
    #{base_attrs =>
          [{1, 5195},
           {4, 2294},
           {5, 1220},
           {6, 797},
           {7, 708},
           {3, 266},
           {2, 3201},
           {26, 224},
           {25, 224}],
      extra_attrs =>
          [{1, 7793},
           {4, 3441},
           {5, 1830},
           {6, 1196},
           {7, 1063},
           {3, 399}]};
get_lev_cfg({1022, 111}) ->
    #{base_attrs =>
          [{1, 5236},
           {4, 2312},
           {5, 1229},
           {6, 804},
           {7, 714},
           {3, 268},
           {2, 3201},
           {26, 227},
           {25, 227}],
      extra_attrs =>
          [{1, 7854},
           {4, 3468},
           {5, 1844},
           {6, 1206},
           {7, 1071},
           {3, 403}]};
get_lev_cfg({1022, 112}) ->
    #{base_attrs =>
          [{1, 5276},
           {4, 2329},
           {5, 1239},
           {6, 810},
           {7, 719},
           {3, 270},
           {2, 3201},
           {26, 230},
           {25, 230}],
      extra_attrs =>
          [{1, 7914},
           {4, 3494},
           {5, 1858},
           {6, 1215},
           {7, 1079},
           {3, 406}]};
get_lev_cfg({1022, 113}) ->
    #{base_attrs =>
          [{1, 5316},
           {4, 2347},
           {5, 1248},
           {6, 816},
           {7, 725},
           {3, 272},
           {2, 3201},
           {26, 233},
           {25, 233}],
      extra_attrs =>
          [{1, 7974},
           {4, 3521},
           {5, 1872},
           {6, 1224},
           {7, 1087},
           {3, 409}]};
get_lev_cfg({1022, 114}) ->
    #{base_attrs =>
          [{1, 5354},
           {4, 2364},
           {5, 1257},
           {6, 822},
           {7, 730},
           {3, 274},
           {2, 3201},
           {26, 236},
           {25, 236}],
      extra_attrs =>
          [{1, 8032},
           {4, 3546},
           {5, 1886},
           {6, 1233},
           {7, 1095},
           {3, 412}]};
get_lev_cfg({1022, 115}) ->
    #{base_attrs =>
          [{1, 5393},
           {4, 2381},
           {5, 1266},
           {6, 828},
           {7, 735},
           {3, 276},
           {2, 3201},
           {26, 239},
           {25, 239}],
      extra_attrs =>
          [{1, 8090},
           {4, 3572},
           {5, 1900},
           {6, 1242},
           {7, 1103},
           {3, 415}]};
get_lev_cfg({1022, 116}) ->
    #{base_attrs =>
          [{1, 5431},
           {4, 2398},
           {5, 1275},
           {6, 834},
           {7, 740},
           {3, 278},
           {2, 3201},
           {26, 242},
           {25, 242}],
      extra_attrs =>
          [{1, 8147},
           {4, 3597},
           {5, 1913},
           {6, 1251},
           {7, 1111},
           {3, 418}]};
get_lev_cfg({1022, 117}) ->
    #{base_attrs =>
          [{1, 5468},
           {4, 2414},
           {5, 1284},
           {6, 839},
           {7, 746},
           {3, 280},
           {2, 3201},
           {26, 245},
           {25, 245}],
      extra_attrs =>
          [{1, 8203},
           {4, 3622},
           {5, 1926},
           {6, 1259},
           {7, 1119},
           {3, 420}]};
get_lev_cfg({1022, 118}) ->
    #{base_attrs =>
          [{1, 5505},
           {4, 2431},
           {5, 1293},
           {6, 845},
           {7, 751},
           {3, 282},
           {2, 3201},
           {26, 248},
           {25, 248}],
      extra_attrs =>
          [{1, 8258},
           {4, 3646},
           {5, 1939},
           {6, 1268},
           {7, 1126},
           {3, 423}]};
get_lev_cfg({1022, 119}) ->
    #{base_attrs =>
          [{1, 5541},
           {4, 2447},
           {5, 1301},
           {6, 851},
           {7, 756},
           {3, 284},
           {2, 3201},
           {26, 251},
           {25, 251}],
      extra_attrs =>
          [{1, 8312},
           {4, 3670},
           {5, 1952},
           {6, 1276},
           {7, 1134},
           {3, 426}]};
get_lev_cfg({1022, 120}) ->
    #{base_attrs =>
          [{1, 5577},
           {4, 2462},
           {5, 1310},
           {6, 856},
           {7, 760},
           {3, 286},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8366},
           {4, 3694},
           {5, 1965},
           {6, 1284},
           {7, 1141},
           {3, 429}]};
get_lev_cfg({1022, 121}) ->
    #{base_attrs =>
          [{1, 5613},
           {4, 2478},
           {5, 1318},
           {6, 862},
           {7, 765},
           {3, 288},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8419},
           {4, 3717},
           {5, 1977},
           {6, 1293},
           {7, 1148},
           {3, 432}]};
get_lev_cfg({1022, 122}) ->
    #{base_attrs =>
          [{1, 5647},
           {4, 2493},
           {5, 1326},
           {6, 867},
           {7, 770},
           {3, 289},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8471},
           {4, 3740},
           {5, 1989},
           {6, 1301},
           {7, 1155},
           {3, 434}]};
get_lev_cfg({1022, 123}) ->
    #{base_attrs =>
          [{1, 5681},
           {4, 2508},
           {5, 1334},
           {6, 872},
           {7, 775},
           {3, 291},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8522},
           {4, 3763},
           {5, 2001},
           {6, 1308},
           {7, 1162},
           {3, 437}]};
get_lev_cfg({1022, 124}) ->
    #{base_attrs =>
          [{1, 5715},
           {4, 2523},
           {5, 1342},
           {6, 877},
           {7, 779},
           {3, 293},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8573},
           {4, 3785},
           {5, 2013},
           {6, 1316},
           {7, 1169},
           {3, 439}]};
get_lev_cfg({1022, 125}) ->
    #{base_attrs =>
          [{1, 5748},
           {4, 2538},
           {5, 1350},
           {6, 882},
           {7, 784},
           {3, 294},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8622},
           {4, 3807},
           {5, 2025},
           {6, 1324},
           {7, 1176},
           {3, 442}]};
get_lev_cfg({1022, 126}) ->
    #{base_attrs =>
          [{1, 5780},
           {4, 2552},
           {5, 1357},
           {6, 887},
           {7, 788},
           {3, 296},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8671},
           {4, 3828},
           {5, 2036},
           {6, 1331},
           {7, 1182},
           {3, 444}]};
get_lev_cfg({1022, 127}) ->
    #{base_attrs =>
          [{1, 5813},
           {4, 2566},
           {5, 1365},
           {6, 892},
           {7, 793},
           {3, 298},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8719},
           {4, 3850},
           {5, 2047},
           {6, 1339},
           {7, 1189},
           {3, 447}]};
get_lev_cfg({1022, 128}) ->
    #{base_attrs =>
          [{1, 5844},
           {4, 2580},
           {5, 1372},
           {6, 897},
           {7, 797},
           {3, 299},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8766},
           {4, 3870},
           {5, 2059},
           {6, 1346},
           {7, 1195},
           {3, 449}]};
get_lev_cfg({1022, 129}) ->
    #{base_attrs =>
          [{1, 5875},
           {4, 2594},
           {5, 1379},
           {6, 902},
           {7, 801},
           {3, 301},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8812},
           {4, 3891},
           {5, 2069},
           {6, 1353},
           {7, 1202},
           {3, 452}]};
get_lev_cfg({1022, 130}) ->
    #{base_attrs =>
          [{1, 5905},
           {4, 2607},
           {5, 1387},
           {6, 907},
           {7, 805},
           {3, 303},
           {2, 3201},
           {26, 254},
           {25, 254}],
      extra_attrs =>
          [{1, 8858},
           {4, 3911},
           {5, 2080},
           {6, 1360},
           {7, 1208},
           {3, 454}]};
get_lev_cfg(_) -> [].

get_skills(1002) ->
    [{61006, 8}, {61005, 15}, {61007, 30}, {61008, 45}];
get_skills(1012) ->
    [{61065, 8}, {61066, 15}, {61067, 30}, {61068, 45}];
get_skills(1018) ->
    [{61102, 8}, {61103, 15}, {61104, 30}, {61105, 45}];
get_skills(1008) ->
    [{61041, 8}, {61042, 15}, {61044, 30}, {61043, 45}];
get_skills(1020) ->
    [{61112, 8},
     {61113, 15},
     {61114, 30},
     {61115, 45},
     {61116, 55}];
get_skills(1014) ->
    [{61075, 8},
     {61076, 15},
     {61077, 30},
     {61078, 45},
     {61079, 55}];
get_skills(1010) ->
    [{61052, 8},
     {61053, 15},
     {61054, 30},
     {61055, 45},
     {61056, 55}];
get_skills(1019) ->
    [{61107, 8},
     {61108, 15},
     {61109, 30},
     {63109, 45},
     {61110, 55}];
get_skills(1023) ->
    [{61131, 8},
     {61132, 15},
     {61133, 30},
     {61134, 45},
     {61135, 55},
     {61136, 65},
     {61137, 80}];
get_skills(1013) ->
    [{61070, 8},
     {61071, 15},
     {63071, 30},
     {61073, 45},
     {63073, 55},
     {61072, 65}];
get_skills(1006) ->
    [{61030, 8},
     {61031, 15},
     {61032, 30},
     {61033, 45},
     {61029, 55},
     {61035, 65}];
get_skills(1021) ->
    [{63119, 8},
     {61119, 15},
     {61118, 30},
     {61121, 45},
     {63121, 55},
     {61122, 65},
     {61123, 80}];
get_skills(1022) ->
    [{61150, 8},
     {61151, 15},
     {61152, 30},
     {61153, 45},
     {61154, 55},
     {61155, 65},
     {61156, 80}];
get_skills(_) -> [].

get_tactics() ->
    [{1, 45}, {2, 52}, {3, 60}, {4, 67}, {5, 75}, {6, 83}].

get_tactic_pos_attr({1, 40}) -> [{1, 843}];
get_tactic_pos_attr({1, 41}) -> [{1, 865}];
get_tactic_pos_attr({1, 42}) -> [{1, 888}];
get_tactic_pos_attr({1, 43}) -> [{1, 910}];
get_tactic_pos_attr({1, 44}) -> [{1, 933}];
get_tactic_pos_attr({1, 45}) -> [{1, 955}];
get_tactic_pos_attr({1, 46}) -> [{1, 978}];
get_tactic_pos_attr({1, 47}) -> [{1, 1000}];
get_tactic_pos_attr({1, 48}) -> [{1, 1023}];
get_tactic_pos_attr({1, 49}) -> [{1, 1045}];
get_tactic_pos_attr({1, 50}) -> [{1, 1068}];
get_tactic_pos_attr({1, 51}) -> [{1, 1090}];
get_tactic_pos_attr({1, 52}) -> [{1, 1113}];
get_tactic_pos_attr({1, 53}) -> [{1, 1135}];
get_tactic_pos_attr({1, 54}) -> [{1, 1158}];
get_tactic_pos_attr({1, 55}) -> [{1, 1180}];
get_tactic_pos_attr({1, 56}) -> [{1, 1203}];
get_tactic_pos_attr({1, 57}) -> [{1, 1225}];
get_tactic_pos_attr({1, 58}) -> [{1, 1248}];
get_tactic_pos_attr({1, 59}) -> [{1, 1270}];
get_tactic_pos_attr({1, 60}) -> [{1, 1293}];
get_tactic_pos_attr({1, 61}) -> [{1, 1315}];
get_tactic_pos_attr({1, 62}) -> [{1, 1338}];
get_tactic_pos_attr({1, 63}) -> [{1, 1360}];
get_tactic_pos_attr({1, 64}) -> [{1, 1383}];
get_tactic_pos_attr({1, 65}) -> [{1, 1405}];
get_tactic_pos_attr({1, 66}) -> [{1, 1428}];
get_tactic_pos_attr({1, 67}) -> [{1, 1450}];
get_tactic_pos_attr({1, 68}) -> [{1, 1473}];
get_tactic_pos_attr({1, 69}) -> [{1, 1495}];
get_tactic_pos_attr({1, 70}) -> [{1, 1518}];
get_tactic_pos_attr({1, 71}) -> [{1, 1540}];
get_tactic_pos_attr({1, 72}) -> [{1, 1562}];
get_tactic_pos_attr({1, 73}) -> [{1, 1585}];
get_tactic_pos_attr({1, 74}) -> [{1, 1607}];
get_tactic_pos_attr({1, 75}) -> [{1, 1630}];
get_tactic_pos_attr({1, 76}) -> [{1, 1652}];
get_tactic_pos_attr({1, 77}) -> [{1, 1675}];
get_tactic_pos_attr({1, 78}) -> [{1, 1697}];
get_tactic_pos_attr({1, 79}) -> [{1, 1720}];
get_tactic_pos_attr({1, 80}) -> [{1, 1742}];
get_tactic_pos_attr({1, 81}) -> [{1, 1765}];
get_tactic_pos_attr({1, 82}) -> [{1, 1787}];
get_tactic_pos_attr({1, 83}) -> [{1, 1810}];
get_tactic_pos_attr({1, 84}) -> [{1, 1832}];
get_tactic_pos_attr({1, 85}) -> [{1, 1855}];
get_tactic_pos_attr({1, 86}) -> [{1, 1877}];
get_tactic_pos_attr({1, 87}) -> [{1, 1900}];
get_tactic_pos_attr({1, 88}) -> [{1, 1922}];
get_tactic_pos_attr({1, 89}) -> [{1, 1945}];
get_tactic_pos_attr({1, 90}) -> [{1, 1967}];
get_tactic_pos_attr({1, 91}) -> [{1, 1984}];
get_tactic_pos_attr({1, 92}) -> [{1, 2001}];
get_tactic_pos_attr({1, 93}) -> [{1, 2018}];
get_tactic_pos_attr({1, 94}) -> [{1, 2035}];
get_tactic_pos_attr({1, 95}) -> [{1, 2052}];
get_tactic_pos_attr({1, 96}) -> [{1, 2068}];
get_tactic_pos_attr({1, 97}) -> [{1, 2085}];
get_tactic_pos_attr({1, 98}) -> [{1, 2102}];
get_tactic_pos_attr({1, 99}) -> [{1, 2119}];
get_tactic_pos_attr({1, 100}) -> [{1, 2136}];
get_tactic_pos_attr({1, 101}) -> [{1, 2153}];
get_tactic_pos_attr({1, 102}) -> [{1, 2170}];
get_tactic_pos_attr({1, 103}) -> [{1, 2187}];
get_tactic_pos_attr({1, 104}) -> [{1, 2203}];
get_tactic_pos_attr({1, 105}) -> [{1, 2220}];
get_tactic_pos_attr({1, 106}) -> [{1, 2237}];
get_tactic_pos_attr({1, 107}) -> [{1, 2254}];
get_tactic_pos_attr({1, 108}) -> [{1, 2271}];
get_tactic_pos_attr({1, 109}) -> [{1, 2288}];
get_tactic_pos_attr({1, 110}) -> [{1, 2305}];
get_tactic_pos_attr({1, 111}) -> [{1, 2321}];
get_tactic_pos_attr({1, 112}) -> [{1, 2338}];
get_tactic_pos_attr({1, 113}) -> [{1, 2355}];
get_tactic_pos_attr({1, 114}) -> [{1, 2372}];
get_tactic_pos_attr({1, 115}) -> [{1, 2389}];
get_tactic_pos_attr({1, 116}) -> [{1, 2406}];
get_tactic_pos_attr({1, 117}) -> [{1, 2423}];
get_tactic_pos_attr({1, 118}) -> [{1, 2440}];
get_tactic_pos_attr({1, 119}) -> [{1, 2456}];
get_tactic_pos_attr({1, 120}) -> [{1, 2473}];
get_tactic_pos_attr({1, 121}) -> [{1, 2490}];
get_tactic_pos_attr({1, 122}) -> [{1, 2507}];
get_tactic_pos_attr({1, 123}) -> [{1, 2524}];
get_tactic_pos_attr({1, 124}) -> [{1, 2541}];
get_tactic_pos_attr({1, 125}) -> [{1, 2558}];
get_tactic_pos_attr({1, 126}) -> [{1, 2574}];
get_tactic_pos_attr({1, 127}) -> [{1, 2591}];
get_tactic_pos_attr({1, 128}) -> [{1, 2608}];
get_tactic_pos_attr({1, 129}) -> [{1, 2625}];
get_tactic_pos_attr({1, 130}) -> [{1, 2642}];
get_tactic_pos_attr({2, 40}) -> [{4, 101}];
get_tactic_pos_attr({2, 41}) -> [{4, 104}];
get_tactic_pos_attr({2, 42}) -> [{4, 107}];
get_tactic_pos_attr({2, 43}) -> [{4, 109}];
get_tactic_pos_attr({2, 44}) -> [{4, 112}];
get_tactic_pos_attr({2, 45}) -> [{4, 115}];
get_tactic_pos_attr({2, 46}) -> [{4, 117}];
get_tactic_pos_attr({2, 47}) -> [{4, 120}];
get_tactic_pos_attr({2, 48}) -> [{4, 123}];
get_tactic_pos_attr({2, 49}) -> [{4, 126}];
get_tactic_pos_attr({2, 50}) -> [{4, 128}];
get_tactic_pos_attr({2, 51}) -> [{4, 131}];
get_tactic_pos_attr({2, 52}) -> [{4, 134}];
get_tactic_pos_attr({2, 53}) -> [{4, 136}];
get_tactic_pos_attr({2, 54}) -> [{4, 139}];
get_tactic_pos_attr({2, 55}) -> [{4, 142}];
get_tactic_pos_attr({2, 56}) -> [{4, 145}];
get_tactic_pos_attr({2, 57}) -> [{4, 147}];
get_tactic_pos_attr({2, 58}) -> [{4, 150}];
get_tactic_pos_attr({2, 59}) -> [{4, 153}];
get_tactic_pos_attr({2, 60}) -> [{4, 155}];
get_tactic_pos_attr({2, 61}) -> [{4, 158}];
get_tactic_pos_attr({2, 62}) -> [{4, 161}];
get_tactic_pos_attr({2, 63}) -> [{4, 164}];
get_tactic_pos_attr({2, 64}) -> [{4, 166}];
get_tactic_pos_attr({2, 65}) -> [{4, 169}];
get_tactic_pos_attr({2, 66}) -> [{4, 172}];
get_tactic_pos_attr({2, 67}) -> [{4, 174}];
get_tactic_pos_attr({2, 68}) -> [{4, 177}];
get_tactic_pos_attr({2, 69}) -> [{4, 180}];
get_tactic_pos_attr({2, 70}) -> [{4, 183}];
get_tactic_pos_attr({2, 71}) -> [{4, 185}];
get_tactic_pos_attr({2, 72}) -> [{4, 188}];
get_tactic_pos_attr({2, 73}) -> [{4, 191}];
get_tactic_pos_attr({2, 74}) -> [{4, 193}];
get_tactic_pos_attr({2, 75}) -> [{4, 196}];
get_tactic_pos_attr({2, 76}) -> [{4, 199}];
get_tactic_pos_attr({2, 77}) -> [{4, 201}];
get_tactic_pos_attr({2, 78}) -> [{4, 204}];
get_tactic_pos_attr({2, 79}) -> [{4, 207}];
get_tactic_pos_attr({2, 80}) -> [{4, 210}];
get_tactic_pos_attr({2, 81}) -> [{4, 212}];
get_tactic_pos_attr({2, 82}) -> [{4, 215}];
get_tactic_pos_attr({2, 83}) -> [{4, 218}];
get_tactic_pos_attr({2, 84}) -> [{4, 220}];
get_tactic_pos_attr({2, 85}) -> [{4, 223}];
get_tactic_pos_attr({2, 86}) -> [{4, 226}];
get_tactic_pos_attr({2, 87}) -> [{4, 229}];
get_tactic_pos_attr({2, 88}) -> [{4, 231}];
get_tactic_pos_attr({2, 89}) -> [{4, 234}];
get_tactic_pos_attr({2, 90}) -> [{4, 237}];
get_tactic_pos_attr({2, 91}) -> [{4, 239}];
get_tactic_pos_attr({2, 92}) -> [{4, 241}];
get_tactic_pos_attr({2, 93}) -> [{4, 243}];
get_tactic_pos_attr({2, 94}) -> [{4, 245}];
get_tactic_pos_attr({2, 95}) -> [{4, 247}];
get_tactic_pos_attr({2, 96}) -> [{4, 249}];
get_tactic_pos_attr({2, 97}) -> [{4, 251}];
get_tactic_pos_attr({2, 98}) -> [{4, 253}];
get_tactic_pos_attr({2, 99}) -> [{4, 255}];
get_tactic_pos_attr({2, 100}) -> [{4, 257}];
get_tactic_pos_attr({2, 101}) -> [{4, 259}];
get_tactic_pos_attr({2, 102}) -> [{4, 261}];
get_tactic_pos_attr({2, 103}) -> [{4, 263}];
get_tactic_pos_attr({2, 104}) -> [{4, 265}];
get_tactic_pos_attr({2, 105}) -> [{4, 267}];
get_tactic_pos_attr({2, 106}) -> [{4, 269}];
get_tactic_pos_attr({2, 107}) -> [{4, 271}];
get_tactic_pos_attr({2, 108}) -> [{4, 273}];
get_tactic_pos_attr({2, 109}) -> [{4, 275}];
get_tactic_pos_attr({2, 110}) -> [{4, 277}];
get_tactic_pos_attr({2, 111}) -> [{4, 279}];
get_tactic_pos_attr({2, 112}) -> [{4, 281}];
get_tactic_pos_attr({2, 113}) -> [{4, 283}];
get_tactic_pos_attr({2, 114}) -> [{4, 286}];
get_tactic_pos_attr({2, 115}) -> [{4, 288}];
get_tactic_pos_attr({2, 116}) -> [{4, 290}];
get_tactic_pos_attr({2, 117}) -> [{4, 292}];
get_tactic_pos_attr({2, 118}) -> [{4, 294}];
get_tactic_pos_attr({2, 119}) -> [{4, 296}];
get_tactic_pos_attr({2, 120}) -> [{4, 298}];
get_tactic_pos_attr({2, 121}) -> [{4, 300}];
get_tactic_pos_attr({2, 122}) -> [{4, 302}];
get_tactic_pos_attr({2, 123}) -> [{4, 304}];
get_tactic_pos_attr({2, 124}) -> [{4, 306}];
get_tactic_pos_attr({2, 125}) -> [{4, 308}];
get_tactic_pos_attr({2, 126}) -> [{4, 310}];
get_tactic_pos_attr({2, 127}) -> [{4, 312}];
get_tactic_pos_attr({2, 128}) -> [{4, 314}];
get_tactic_pos_attr({2, 129}) -> [{4, 316}];
get_tactic_pos_attr({2, 130}) -> [{4, 318}];
get_tactic_pos_attr({3, 40}) -> [{5, 81}];
get_tactic_pos_attr({3, 41}) -> [{5, 83}];
get_tactic_pos_attr({3, 42}) -> [{5, 85}];
get_tactic_pos_attr({3, 43}) -> [{5, 87}];
get_tactic_pos_attr({3, 44}) -> [{5, 89}];
get_tactic_pos_attr({3, 45}) -> [{5, 91}];
get_tactic_pos_attr({3, 46}) -> [{5, 94}];
get_tactic_pos_attr({3, 47}) -> [{5, 96}];
get_tactic_pos_attr({3, 48}) -> [{5, 98}];
get_tactic_pos_attr({3, 49}) -> [{5, 100}];
get_tactic_pos_attr({3, 50}) -> [{5, 102}];
get_tactic_pos_attr({3, 51}) -> [{5, 104}];
get_tactic_pos_attr({3, 52}) -> [{5, 107}];
get_tactic_pos_attr({3, 53}) -> [{5, 109}];
get_tactic_pos_attr({3, 54}) -> [{5, 111}];
get_tactic_pos_attr({3, 55}) -> [{5, 113}];
get_tactic_pos_attr({3, 56}) -> [{5, 115}];
get_tactic_pos_attr({3, 57}) -> [{5, 117}];
get_tactic_pos_attr({3, 58}) -> [{5, 120}];
get_tactic_pos_attr({3, 59}) -> [{5, 122}];
get_tactic_pos_attr({3, 60}) -> [{5, 124}];
get_tactic_pos_attr({3, 61}) -> [{5, 126}];
get_tactic_pos_attr({3, 62}) -> [{5, 128}];
get_tactic_pos_attr({3, 63}) -> [{5, 130}];
get_tactic_pos_attr({3, 64}) -> [{5, 133}];
get_tactic_pos_attr({3, 65}) -> [{5, 135}];
get_tactic_pos_attr({3, 66}) -> [{5, 137}];
get_tactic_pos_attr({3, 67}) -> [{5, 139}];
get_tactic_pos_attr({3, 68}) -> [{5, 141}];
get_tactic_pos_attr({3, 69}) -> [{5, 143}];
get_tactic_pos_attr({3, 70}) -> [{5, 146}];
get_tactic_pos_attr({3, 71}) -> [{5, 148}];
get_tactic_pos_attr({3, 72}) -> [{5, 150}];
get_tactic_pos_attr({3, 73}) -> [{5, 152}];
get_tactic_pos_attr({3, 74}) -> [{5, 154}];
get_tactic_pos_attr({3, 75}) -> [{5, 156}];
get_tactic_pos_attr({3, 76}) -> [{5, 158}];
get_tactic_pos_attr({3, 77}) -> [{5, 161}];
get_tactic_pos_attr({3, 78}) -> [{5, 163}];
get_tactic_pos_attr({3, 79}) -> [{5, 165}];
get_tactic_pos_attr({3, 80}) -> [{5, 167}];
get_tactic_pos_attr({3, 81}) -> [{5, 169}];
get_tactic_pos_attr({3, 82}) -> [{5, 171}];
get_tactic_pos_attr({3, 83}) -> [{5, 174}];
get_tactic_pos_attr({3, 84}) -> [{5, 176}];
get_tactic_pos_attr({3, 85}) -> [{5, 178}];
get_tactic_pos_attr({3, 86}) -> [{5, 180}];
get_tactic_pos_attr({3, 87}) -> [{5, 182}];
get_tactic_pos_attr({3, 88}) -> [{5, 184}];
get_tactic_pos_attr({3, 89}) -> [{5, 187}];
get_tactic_pos_attr({3, 90}) -> [{5, 189}];
get_tactic_pos_attr({3, 91}) -> [{5, 190}];
get_tactic_pos_attr({3, 92}) -> [{5, 192}];
get_tactic_pos_attr({3, 93}) -> [{5, 194}];
get_tactic_pos_attr({3, 94}) -> [{5, 195}];
get_tactic_pos_attr({3, 95}) -> [{5, 197}];
get_tactic_pos_attr({3, 96}) -> [{5, 198}];
get_tactic_pos_attr({3, 97}) -> [{5, 200}];
get_tactic_pos_attr({3, 98}) -> [{5, 202}];
get_tactic_pos_attr({3, 99}) -> [{5, 203}];
get_tactic_pos_attr({3, 100}) -> [{5, 205}];
get_tactic_pos_attr({3, 101}) -> [{5, 207}];
get_tactic_pos_attr({3, 102}) -> [{5, 208}];
get_tactic_pos_attr({3, 103}) -> [{5, 210}];
get_tactic_pos_attr({3, 104}) -> [{5, 211}];
get_tactic_pos_attr({3, 105}) -> [{5, 213}];
get_tactic_pos_attr({3, 106}) -> [{5, 215}];
get_tactic_pos_attr({3, 107}) -> [{5, 216}];
get_tactic_pos_attr({3, 108}) -> [{5, 218}];
get_tactic_pos_attr({3, 109}) -> [{5, 220}];
get_tactic_pos_attr({3, 110}) -> [{5, 221}];
get_tactic_pos_attr({3, 111}) -> [{5, 223}];
get_tactic_pos_attr({3, 112}) -> [{5, 224}];
get_tactic_pos_attr({3, 113}) -> [{5, 226}];
get_tactic_pos_attr({3, 114}) -> [{5, 228}];
get_tactic_pos_attr({3, 115}) -> [{5, 229}];
get_tactic_pos_attr({3, 116}) -> [{5, 231}];
get_tactic_pos_attr({3, 117}) -> [{5, 233}];
get_tactic_pos_attr({3, 118}) -> [{5, 234}];
get_tactic_pos_attr({3, 119}) -> [{5, 236}];
get_tactic_pos_attr({3, 120}) -> [{5, 237}];
get_tactic_pos_attr({3, 121}) -> [{5, 239}];
get_tactic_pos_attr({3, 122}) -> [{5, 241}];
get_tactic_pos_attr({3, 123}) -> [{5, 242}];
get_tactic_pos_attr({3, 124}) -> [{5, 244}];
get_tactic_pos_attr({3, 125}) -> [{5, 246}];
get_tactic_pos_attr({3, 126}) -> [{5, 247}];
get_tactic_pos_attr({3, 127}) -> [{5, 249}];
get_tactic_pos_attr({3, 128}) -> [{5, 250}];
get_tactic_pos_attr({3, 129}) -> [{5, 252}];
get_tactic_pos_attr({3, 130}) -> [{5, 254}];
get_tactic_pos_attr({4, 40}) -> [{6, 151}];
get_tactic_pos_attr({4, 41}) -> [{6, 155}];
get_tactic_pos_attr({4, 42}) -> [{6, 159}];
get_tactic_pos_attr({4, 43}) -> [{6, 163}];
get_tactic_pos_attr({4, 44}) -> [{6, 167}];
get_tactic_pos_attr({4, 45}) -> [{6, 171}];
get_tactic_pos_attr({4, 46}) -> [{6, 175}];
get_tactic_pos_attr({4, 47}) -> [{6, 179}];
get_tactic_pos_attr({4, 48}) -> [{6, 183}];
get_tactic_pos_attr({4, 49}) -> [{6, 187}];
get_tactic_pos_attr({4, 50}) -> [{6, 191}];
get_tactic_pos_attr({4, 51}) -> [{6, 195}];
get_tactic_pos_attr({4, 52}) -> [{6, 199}];
get_tactic_pos_attr({4, 53}) -> [{6, 203}];
get_tactic_pos_attr({4, 54}) -> [{6, 207}];
get_tactic_pos_attr({4, 55}) -> [{6, 211}];
get_tactic_pos_attr({4, 56}) -> [{6, 215}];
get_tactic_pos_attr({4, 57}) -> [{6, 219}];
get_tactic_pos_attr({4, 58}) -> [{6, 223}];
get_tactic_pos_attr({4, 59}) -> [{6, 227}];
get_tactic_pos_attr({4, 60}) -> [{6, 231}];
get_tactic_pos_attr({4, 61}) -> [{6, 235}];
get_tactic_pos_attr({4, 62}) -> [{6, 239}];
get_tactic_pos_attr({4, 63}) -> [{6, 243}];
get_tactic_pos_attr({4, 64}) -> [{6, 247}];
get_tactic_pos_attr({4, 65}) -> [{6, 251}];
get_tactic_pos_attr({4, 66}) -> [{6, 255}];
get_tactic_pos_attr({4, 67}) -> [{6, 259}];
get_tactic_pos_attr({4, 68}) -> [{6, 263}];
get_tactic_pos_attr({4, 69}) -> [{6, 267}];
get_tactic_pos_attr({4, 70}) -> [{6, 272}];
get_tactic_pos_attr({4, 71}) -> [{6, 276}];
get_tactic_pos_attr({4, 72}) -> [{6, 280}];
get_tactic_pos_attr({4, 73}) -> [{6, 284}];
get_tactic_pos_attr({4, 74}) -> [{6, 288}];
get_tactic_pos_attr({4, 75}) -> [{6, 292}];
get_tactic_pos_attr({4, 76}) -> [{6, 296}];
get_tactic_pos_attr({4, 77}) -> [{6, 300}];
get_tactic_pos_attr({4, 78}) -> [{6, 304}];
get_tactic_pos_attr({4, 79}) -> [{6, 308}];
get_tactic_pos_attr({4, 80}) -> [{6, 312}];
get_tactic_pos_attr({4, 81}) -> [{6, 316}];
get_tactic_pos_attr({4, 82}) -> [{6, 320}];
get_tactic_pos_attr({4, 83}) -> [{6, 324}];
get_tactic_pos_attr({4, 84}) -> [{6, 328}];
get_tactic_pos_attr({4, 85}) -> [{6, 332}];
get_tactic_pos_attr({4, 86}) -> [{6, 336}];
get_tactic_pos_attr({4, 87}) -> [{6, 340}];
get_tactic_pos_attr({4, 88}) -> [{6, 344}];
get_tactic_pos_attr({4, 89}) -> [{6, 348}];
get_tactic_pos_attr({4, 90}) -> [{6, 352}];
get_tactic_pos_attr({4, 91}) -> [{6, 355}];
get_tactic_pos_attr({4, 92}) -> [{6, 358}];
get_tactic_pos_attr({4, 93}) -> [{6, 361}];
get_tactic_pos_attr({4, 94}) -> [{6, 364}];
get_tactic_pos_attr({4, 95}) -> [{6, 367}];
get_tactic_pos_attr({4, 96}) -> [{6, 370}];
get_tactic_pos_attr({4, 97}) -> [{6, 373}];
get_tactic_pos_attr({4, 98}) -> [{6, 376}];
get_tactic_pos_attr({4, 99}) -> [{6, 379}];
get_tactic_pos_attr({4, 100}) -> [{6, 382}];
get_tactic_pos_attr({4, 101}) -> [{6, 385}];
get_tactic_pos_attr({4, 102}) -> [{6, 388}];
get_tactic_pos_attr({4, 103}) -> [{6, 391}];
get_tactic_pos_attr({4, 104}) -> [{6, 394}];
get_tactic_pos_attr({4, 105}) -> [{6, 397}];
get_tactic_pos_attr({4, 106}) -> [{6, 400}];
get_tactic_pos_attr({4, 107}) -> [{6, 403}];
get_tactic_pos_attr({4, 108}) -> [{6, 406}];
get_tactic_pos_attr({4, 109}) -> [{6, 410}];
get_tactic_pos_attr({4, 110}) -> [{6, 413}];
get_tactic_pos_attr({4, 111}) -> [{6, 416}];
get_tactic_pos_attr({4, 112}) -> [{6, 419}];
get_tactic_pos_attr({4, 113}) -> [{6, 422}];
get_tactic_pos_attr({4, 114}) -> [{6, 425}];
get_tactic_pos_attr({4, 115}) -> [{6, 428}];
get_tactic_pos_attr({4, 116}) -> [{6, 431}];
get_tactic_pos_attr({4, 117}) -> [{6, 434}];
get_tactic_pos_attr({4, 118}) -> [{6, 437}];
get_tactic_pos_attr({4, 119}) -> [{6, 440}];
get_tactic_pos_attr({4, 120}) -> [{6, 443}];
get_tactic_pos_attr({4, 121}) -> [{6, 446}];
get_tactic_pos_attr({4, 122}) -> [{6, 449}];
get_tactic_pos_attr({4, 123}) -> [{6, 452}];
get_tactic_pos_attr({4, 124}) -> [{6, 455}];
get_tactic_pos_attr({4, 125}) -> [{6, 458}];
get_tactic_pos_attr({4, 126}) -> [{6, 461}];
get_tactic_pos_attr({4, 127}) -> [{6, 464}];
get_tactic_pos_attr({4, 128}) -> [{6, 467}];
get_tactic_pos_attr({4, 129}) -> [{6, 470}];
get_tactic_pos_attr({4, 130}) -> [{6, 473}];
get_tactic_pos_attr({5, 40}) -> [{7, 120}];
get_tactic_pos_attr({5, 41}) -> [{7, 123}];
get_tactic_pos_attr({5, 42}) -> [{7, 126}];
get_tactic_pos_attr({5, 43}) -> [{7, 130}];
get_tactic_pos_attr({5, 44}) -> [{7, 133}];
get_tactic_pos_attr({5, 45}) -> [{7, 136}];
get_tactic_pos_attr({5, 46}) -> [{7, 139}];
get_tactic_pos_attr({5, 47}) -> [{7, 143}];
get_tactic_pos_attr({5, 48}) -> [{7, 146}];
get_tactic_pos_attr({5, 49}) -> [{7, 149}];
get_tactic_pos_attr({5, 50}) -> [{7, 152}];
get_tactic_pos_attr({5, 51}) -> [{7, 155}];
get_tactic_pos_attr({5, 52}) -> [{7, 159}];
get_tactic_pos_attr({5, 53}) -> [{7, 162}];
get_tactic_pos_attr({5, 54}) -> [{7, 165}];
get_tactic_pos_attr({5, 55}) -> [{7, 168}];
get_tactic_pos_attr({5, 56}) -> [{7, 171}];
get_tactic_pos_attr({5, 57}) -> [{7, 175}];
get_tactic_pos_attr({5, 58}) -> [{7, 178}];
get_tactic_pos_attr({5, 59}) -> [{7, 181}];
get_tactic_pos_attr({5, 60}) -> [{7, 184}];
get_tactic_pos_attr({5, 61}) -> [{7, 188}];
get_tactic_pos_attr({5, 62}) -> [{7, 191}];
get_tactic_pos_attr({5, 63}) -> [{7, 194}];
get_tactic_pos_attr({5, 64}) -> [{7, 197}];
get_tactic_pos_attr({5, 65}) -> [{7, 200}];
get_tactic_pos_attr({5, 66}) -> [{7, 204}];
get_tactic_pos_attr({5, 67}) -> [{7, 207}];
get_tactic_pos_attr({5, 68}) -> [{7, 210}];
get_tactic_pos_attr({5, 69}) -> [{7, 213}];
get_tactic_pos_attr({5, 70}) -> [{7, 217}];
get_tactic_pos_attr({5, 71}) -> [{7, 220}];
get_tactic_pos_attr({5, 72}) -> [{7, 223}];
get_tactic_pos_attr({5, 73}) -> [{7, 226}];
get_tactic_pos_attr({5, 74}) -> [{7, 229}];
get_tactic_pos_attr({5, 75}) -> [{7, 233}];
get_tactic_pos_attr({5, 76}) -> [{7, 236}];
get_tactic_pos_attr({5, 77}) -> [{7, 239}];
get_tactic_pos_attr({5, 78}) -> [{7, 242}];
get_tactic_pos_attr({5, 79}) -> [{7, 245}];
get_tactic_pos_attr({5, 80}) -> [{7, 249}];
get_tactic_pos_attr({5, 81}) -> [{7, 252}];
get_tactic_pos_attr({5, 82}) -> [{7, 255}];
get_tactic_pos_attr({5, 83}) -> [{7, 258}];
get_tactic_pos_attr({5, 84}) -> [{7, 262}];
get_tactic_pos_attr({5, 85}) -> [{7, 265}];
get_tactic_pos_attr({5, 86}) -> [{7, 268}];
get_tactic_pos_attr({5, 87}) -> [{7, 271}];
get_tactic_pos_attr({5, 88}) -> [{7, 274}];
get_tactic_pos_attr({5, 89}) -> [{7, 278}];
get_tactic_pos_attr({5, 90}) -> [{7, 281}];
get_tactic_pos_attr({5, 91}) -> [{7, 283}];
get_tactic_pos_attr({5, 92}) -> [{7, 286}];
get_tactic_pos_attr({5, 93}) -> [{7, 288}];
get_tactic_pos_attr({5, 94}) -> [{7, 290}];
get_tactic_pos_attr({5, 95}) -> [{7, 293}];
get_tactic_pos_attr({5, 96}) -> [{7, 295}];
get_tactic_pos_attr({5, 97}) -> [{7, 298}];
get_tactic_pos_attr({5, 98}) -> [{7, 300}];
get_tactic_pos_attr({5, 99}) -> [{7, 302}];
get_tactic_pos_attr({5, 100}) -> [{7, 305}];
get_tactic_pos_attr({5, 101}) -> [{7, 307}];
get_tactic_pos_attr({5, 102}) -> [{7, 310}];
get_tactic_pos_attr({5, 103}) -> [{7, 312}];
get_tactic_pos_attr({5, 104}) -> [{7, 315}];
get_tactic_pos_attr({5, 105}) -> [{7, 317}];
get_tactic_pos_attr({5, 106}) -> [{7, 319}];
get_tactic_pos_attr({5, 107}) -> [{7, 322}];
get_tactic_pos_attr({5, 108}) -> [{7, 324}];
get_tactic_pos_attr({5, 109}) -> [{7, 327}];
get_tactic_pos_attr({5, 110}) -> [{7, 329}];
get_tactic_pos_attr({5, 111}) -> [{7, 331}];
get_tactic_pos_attr({5, 112}) -> [{7, 334}];
get_tactic_pos_attr({5, 113}) -> [{7, 336}];
get_tactic_pos_attr({5, 114}) -> [{7, 339}];
get_tactic_pos_attr({5, 115}) -> [{7, 341}];
get_tactic_pos_attr({5, 116}) -> [{7, 343}];
get_tactic_pos_attr({5, 117}) -> [{7, 346}];
get_tactic_pos_attr({5, 118}) -> [{7, 348}];
get_tactic_pos_attr({5, 119}) -> [{7, 351}];
get_tactic_pos_attr({5, 120}) -> [{7, 353}];
get_tactic_pos_attr({5, 121}) -> [{7, 356}];
get_tactic_pos_attr({5, 122}) -> [{7, 358}];
get_tactic_pos_attr({5, 123}) -> [{7, 360}];
get_tactic_pos_attr({5, 124}) -> [{7, 363}];
get_tactic_pos_attr({5, 125}) -> [{7, 365}];
get_tactic_pos_attr({5, 126}) -> [{7, 368}];
get_tactic_pos_attr({5, 127}) -> [{7, 370}];
get_tactic_pos_attr({5, 128}) -> [{7, 372}];
get_tactic_pos_attr({5, 129}) -> [{7, 375}];
get_tactic_pos_attr({5, 130}) -> [{7, 377}];
get_tactic_pos_attr({6, 40}) -> [{3, 25}];
get_tactic_pos_attr({6, 41}) -> [{3, 25}];
get_tactic_pos_attr({6, 42}) -> [{3, 26}];
get_tactic_pos_attr({6, 43}) -> [{3, 27}];
get_tactic_pos_attr({6, 44}) -> [{3, 27}];
get_tactic_pos_attr({6, 45}) -> [{3, 28}];
get_tactic_pos_attr({6, 46}) -> [{3, 29}];
get_tactic_pos_attr({6, 47}) -> [{3, 29}];
get_tactic_pos_attr({6, 48}) -> [{3, 30}];
get_tactic_pos_attr({6, 49}) -> [{3, 31}];
get_tactic_pos_attr({6, 50}) -> [{3, 31}];
get_tactic_pos_attr({6, 51}) -> [{3, 32}];
get_tactic_pos_attr({6, 52}) -> [{3, 33}];
get_tactic_pos_attr({6, 53}) -> [{3, 33}];
get_tactic_pos_attr({6, 54}) -> [{3, 34}];
get_tactic_pos_attr({6, 55}) -> [{3, 35}];
get_tactic_pos_attr({6, 56}) -> [{3, 35}];
get_tactic_pos_attr({6, 57}) -> [{3, 36}];
get_tactic_pos_attr({6, 58}) -> [{3, 37}];
get_tactic_pos_attr({6, 59}) -> [{3, 37}];
get_tactic_pos_attr({6, 60}) -> [{3, 38}];
get_tactic_pos_attr({6, 61}) -> [{3, 39}];
get_tactic_pos_attr({6, 62}) -> [{3, 39}];
get_tactic_pos_attr({6, 63}) -> [{3, 40}];
get_tactic_pos_attr({6, 64}) -> [{3, 41}];
get_tactic_pos_attr({6, 65}) -> [{3, 41}];
get_tactic_pos_attr({6, 66}) -> [{3, 42}];
get_tactic_pos_attr({6, 67}) -> [{3, 43}];
get_tactic_pos_attr({6, 68}) -> [{3, 43}];
get_tactic_pos_attr({6, 69}) -> [{3, 44}];
get_tactic_pos_attr({6, 70}) -> [{3, 45}];
get_tactic_pos_attr({6, 71}) -> [{3, 45}];
get_tactic_pos_attr({6, 72}) -> [{3, 46}];
get_tactic_pos_attr({6, 73}) -> [{3, 47}];
get_tactic_pos_attr({6, 74}) -> [{3, 47}];
get_tactic_pos_attr({6, 75}) -> [{3, 48}];
get_tactic_pos_attr({6, 76}) -> [{3, 49}];
get_tactic_pos_attr({6, 77}) -> [{3, 49}];
get_tactic_pos_attr({6, 78}) -> [{3, 50}];
get_tactic_pos_attr({6, 79}) -> [{3, 51}];
get_tactic_pos_attr({6, 80}) -> [{3, 51}];
get_tactic_pos_attr({6, 81}) -> [{3, 52}];
get_tactic_pos_attr({6, 82}) -> [{3, 53}];
get_tactic_pos_attr({6, 83}) -> [{3, 53}];
get_tactic_pos_attr({6, 84}) -> [{3, 54}];
get_tactic_pos_attr({6, 85}) -> [{3, 55}];
get_tactic_pos_attr({6, 86}) -> [{3, 55}];
get_tactic_pos_attr({6, 87}) -> [{3, 56}];
get_tactic_pos_attr({6, 88}) -> [{3, 57}];
get_tactic_pos_attr({6, 89}) -> [{3, 57}];
get_tactic_pos_attr({6, 90}) -> [{3, 58}];
get_tactic_pos_attr({6, 91}) -> [{3, 58}];
get_tactic_pos_attr({6, 92}) -> [{3, 59}];
get_tactic_pos_attr({6, 93}) -> [{3, 59}];
get_tactic_pos_attr({6, 94}) -> [{3, 60}];
get_tactic_pos_attr({6, 95}) -> [{3, 60}];
get_tactic_pos_attr({6, 96}) -> [{3, 61}];
get_tactic_pos_attr({6, 97}) -> [{3, 61}];
get_tactic_pos_attr({6, 98}) -> [{3, 62}];
get_tactic_pos_attr({6, 99}) -> [{3, 62}];
get_tactic_pos_attr({6, 100}) -> [{3, 63}];
get_tactic_pos_attr({6, 101}) -> [{3, 63}];
get_tactic_pos_attr({6, 102}) -> [{3, 64}];
get_tactic_pos_attr({6, 103}) -> [{3, 64}];
get_tactic_pos_attr({6, 104}) -> [{3, 65}];
get_tactic_pos_attr({6, 105}) -> [{3, 65}];
get_tactic_pos_attr({6, 106}) -> [{3, 66}];
get_tactic_pos_attr({6, 107}) -> [{3, 66}];
get_tactic_pos_attr({6, 108}) -> [{3, 67}];
get_tactic_pos_attr({6, 109}) -> [{3, 67}];
get_tactic_pos_attr({6, 110}) -> [{3, 68}];
get_tactic_pos_attr({6, 111}) -> [{3, 68}];
get_tactic_pos_attr({6, 112}) -> [{3, 69}];
get_tactic_pos_attr({6, 113}) -> [{3, 69}];
get_tactic_pos_attr({6, 114}) -> [{3, 70}];
get_tactic_pos_attr({6, 115}) -> [{3, 70}];
get_tactic_pos_attr({6, 116}) -> [{3, 71}];
get_tactic_pos_attr({6, 117}) -> [{3, 71}];
get_tactic_pos_attr({6, 118}) -> [{3, 72}];
get_tactic_pos_attr({6, 119}) -> [{3, 72}];
get_tactic_pos_attr({6, 120}) -> [{3, 73}];
get_tactic_pos_attr({6, 121}) -> [{3, 73}];
get_tactic_pos_attr({6, 122}) -> [{3, 74}];
get_tactic_pos_attr({6, 123}) -> [{3, 74}];
get_tactic_pos_attr({6, 124}) -> [{3, 75}];
get_tactic_pos_attr({6, 125}) -> [{3, 75}];
get_tactic_pos_attr({6, 126}) -> [{3, 76}];
get_tactic_pos_attr({6, 127}) -> [{3, 76}];
get_tactic_pos_attr({6, 128}) -> [{3, 77}];
get_tactic_pos_attr({6, 129}) -> [{3, 77}];
get_tactic_pos_attr({6, 130}) -> [{3, 78}];
get_tactic_pos_attr(_) -> [].

get_eqm_by_id(40001) ->
    #guard_eqm_data{base_id = 40001, lev = 1, classes = 1,
                    type = 15, quality = 0};
get_eqm_by_id(40002) ->
    #guard_eqm_data{base_id = 40002, lev = 1, classes = 1,
                    type = 19, quality = 0};
get_eqm_by_id(40003) ->
    #guard_eqm_data{base_id = 40003, lev = 1, classes = 1,
                    type = 16, quality = 0};
get_eqm_by_id(40004) ->
    #guard_eqm_data{base_id = 40004, lev = 1, classes = 1,
                    type = 20, quality = 0};
get_eqm_by_id(40005) ->
    #guard_eqm_data{base_id = 40005, lev = 1, classes = 1,
                    type = 17, quality = 0};
get_eqm_by_id(40006) ->
    #guard_eqm_data{base_id = 40006, lev = 1, classes = 1,
                    type = 18, quality = 0};
get_eqm_by_id(40011) ->
    #guard_eqm_data{base_id = 40011, lev = 10, classes = 1,
                    type = 15, quality = 0};
get_eqm_by_id(40012) ->
    #guard_eqm_data{base_id = 40012, lev = 10, classes = 1,
                    type = 19, quality = 0};
get_eqm_by_id(40013) ->
    #guard_eqm_data{base_id = 40013, lev = 10, classes = 1,
                    type = 16, quality = 0};
get_eqm_by_id(40014) ->
    #guard_eqm_data{base_id = 40014, lev = 10, classes = 1,
                    type = 20, quality = 0};
get_eqm_by_id(40015) ->
    #guard_eqm_data{base_id = 40015, lev = 10, classes = 1,
                    type = 17, quality = 0};
get_eqm_by_id(40016) ->
    #guard_eqm_data{base_id = 40016, lev = 10, classes = 1,
                    type = 18, quality = 0};
get_eqm_by_id(40021) ->
    #guard_eqm_data{base_id = 40021, lev = 20, classes = 1,
                    type = 15, quality = 1};
get_eqm_by_id(40022) ->
    #guard_eqm_data{base_id = 40022, lev = 20, classes = 1,
                    type = 19, quality = 1};
get_eqm_by_id(40023) ->
    #guard_eqm_data{base_id = 40023, lev = 20, classes = 1,
                    type = 16, quality = 1};
get_eqm_by_id(40024) ->
    #guard_eqm_data{base_id = 40024, lev = 20, classes = 1,
                    type = 20, quality = 1};
get_eqm_by_id(40025) ->
    #guard_eqm_data{base_id = 40025, lev = 20, classes = 1,
                    type = 17, quality = 1};
get_eqm_by_id(40026) ->
    #guard_eqm_data{base_id = 40026, lev = 20, classes = 1,
                    type = 18, quality = 1};
get_eqm_by_id(40031) ->
    #guard_eqm_data{base_id = 40031, lev = 30, classes = 1,
                    type = 15, quality = 1, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(40032) ->
    #guard_eqm_data{base_id = 40032, lev = 30, classes = 1,
                    type = 19, quality = 1, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(40033) ->
    #guard_eqm_data{base_id = 40033, lev = 30, classes = 1,
                    type = 16, quality = 1, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(40034) ->
    #guard_eqm_data{base_id = 40034, lev = 30, classes = 1,
                    type = 20, quality = 1, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(40035) ->
    #guard_eqm_data{base_id = 40035, lev = 30, classes = 1,
                    type = 17, quality = 1, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(40036) ->
    #guard_eqm_data{base_id = 40036, lev = 30, classes = 1,
                    type = 18, quality = 1, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(40041) ->
    #guard_eqm_data{base_id = 40041, lev = 40, classes = 1,
                    type = 15, quality = 2, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(40042) ->
    #guard_eqm_data{base_id = 40042, lev = 40, classes = 1,
                    type = 19, quality = 2, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(40043) ->
    #guard_eqm_data{base_id = 40043, lev = 40, classes = 1,
                    type = 16, quality = 2, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(40044) ->
    #guard_eqm_data{base_id = 40044, lev = 40, classes = 1,
                    type = 20, quality = 2, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(40045) ->
    #guard_eqm_data{base_id = 40045, lev = 40, classes = 1,
                    type = 17, quality = 2, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(40046) ->
    #guard_eqm_data{base_id = 40046, lev = 40, classes = 1,
                    type = 18, quality = 2, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(40051) ->
    #guard_eqm_data{base_id = 40051, lev = 50, classes = 1,
                    type = 15, quality = 2, loss_coin = 42000,
                    reset_coin = 33600};
get_eqm_by_id(40052) ->
    #guard_eqm_data{base_id = 40052, lev = 50, classes = 1,
                    type = 19, quality = 2, loss_coin = 42000,
                    reset_coin = 33600};
get_eqm_by_id(40053) ->
    #guard_eqm_data{base_id = 40053, lev = 50, classes = 1,
                    type = 16, quality = 2, loss_coin = 42000,
                    reset_coin = 33600};
get_eqm_by_id(40054) ->
    #guard_eqm_data{base_id = 40054, lev = 50, classes = 1,
                    type = 20, quality = 2, loss_coin = 42000,
                    reset_coin = 33600};
get_eqm_by_id(40055) ->
    #guard_eqm_data{base_id = 40055, lev = 50, classes = 1,
                    type = 17, quality = 2, loss_coin = 42000,
                    reset_coin = 33600};
get_eqm_by_id(40056) ->
    #guard_eqm_data{base_id = 40056, lev = 50, classes = 1,
                    type = 18, quality = 2, loss_coin = 42000,
                    reset_coin = 33600};
get_eqm_by_id(40061) ->
    #guard_eqm_data{base_id = 40061, lev = 60, classes = 1,
                    type = 15, quality = 3, loss_coin = 108000,
                    reset_coin = 54000};
get_eqm_by_id(40062) ->
    #guard_eqm_data{base_id = 40062, lev = 60, classes = 1,
                    type = 19, quality = 3, loss_coin = 108000,
                    reset_coin = 54000};
get_eqm_by_id(40063) ->
    #guard_eqm_data{base_id = 40063, lev = 60, classes = 1,
                    type = 16, quality = 3, loss_coin = 108000,
                    reset_coin = 54000};
get_eqm_by_id(40064) ->
    #guard_eqm_data{base_id = 40064, lev = 60, classes = 1,
                    type = 20, quality = 3, loss_coin = 108000,
                    reset_coin = 54000};
get_eqm_by_id(40065) ->
    #guard_eqm_data{base_id = 40065, lev = 60, classes = 1,
                    type = 17, quality = 3, loss_coin = 108000,
                    reset_coin = 54000};
get_eqm_by_id(40066) ->
    #guard_eqm_data{base_id = 40066, lev = 60, classes = 1,
                    type = 18, quality = 3, loss_coin = 108000,
                    reset_coin = 54000};
get_eqm_by_id(40071) ->
    #guard_eqm_data{base_id = 40071, lev = 70, classes = 1,
                    type = 15, quality = 3, loss_coin = 210000,
                    reset_coin = 84000};
get_eqm_by_id(40072) ->
    #guard_eqm_data{base_id = 40072, lev = 70, classes = 1,
                    type = 19, quality = 3, loss_coin = 210000,
                    reset_coin = 84000};
get_eqm_by_id(40073) ->
    #guard_eqm_data{base_id = 40073, lev = 70, classes = 1,
                    type = 16, quality = 3, loss_coin = 210000,
                    reset_coin = 84000};
get_eqm_by_id(40074) ->
    #guard_eqm_data{base_id = 40074, lev = 70, classes = 1,
                    type = 20, quality = 3, loss_coin = 210000,
                    reset_coin = 84000};
get_eqm_by_id(40075) ->
    #guard_eqm_data{base_id = 40075, lev = 70, classes = 1,
                    type = 17, quality = 3, loss_coin = 210000,
                    reset_coin = 84000};
get_eqm_by_id(40076) ->
    #guard_eqm_data{base_id = 40076, lev = 70, classes = 1,
                    type = 18, quality = 3, loss_coin = 210000,
                    reset_coin = 84000};
get_eqm_by_id(40081) ->
    #guard_eqm_data{base_id = 40081, lev = 80, classes = 1,
                    type = 15, quality = 4, loss_coin = 240000,
                    reset_coin = 96000};
get_eqm_by_id(40082) ->
    #guard_eqm_data{base_id = 40082, lev = 80, classes = 1,
                    type = 19, quality = 4, loss_coin = 240000,
                    reset_coin = 96000};
get_eqm_by_id(40083) ->
    #guard_eqm_data{base_id = 40083, lev = 80, classes = 1,
                    type = 16, quality = 4, loss_coin = 240000,
                    reset_coin = 96000};
get_eqm_by_id(40084) ->
    #guard_eqm_data{base_id = 40084, lev = 80, classes = 1,
                    type = 20, quality = 4, loss_coin = 240000,
                    reset_coin = 96000};
get_eqm_by_id(40085) ->
    #guard_eqm_data{base_id = 40085, lev = 80, classes = 1,
                    type = 17, quality = 4, loss_coin = 240000,
                    reset_coin = 96000};
get_eqm_by_id(40086) ->
    #guard_eqm_data{base_id = 40086, lev = 80, classes = 1,
                    type = 18, quality = 4, loss_coin = 240000,
                    reset_coin = 96000};
get_eqm_by_id(40091) ->
    #guard_eqm_data{base_id = 40091, lev = 90, classes = 1,
                    type = 15, quality = 4, loss_coin = 300000,
                    reset_coin = 120000};
get_eqm_by_id(40092) ->
    #guard_eqm_data{base_id = 40092, lev = 90, classes = 1,
                    type = 19, quality = 4, loss_coin = 300000,
                    reset_coin = 120000};
get_eqm_by_id(40093) ->
    #guard_eqm_data{base_id = 40093, lev = 90, classes = 1,
                    type = 16, quality = 4, loss_coin = 300000,
                    reset_coin = 120000};
get_eqm_by_id(40094) ->
    #guard_eqm_data{base_id = 40094, lev = 90, classes = 1,
                    type = 20, quality = 4, loss_coin = 300000,
                    reset_coin = 120000};
get_eqm_by_id(40095) ->
    #guard_eqm_data{base_id = 40095, lev = 90, classes = 1,
                    type = 17, quality = 4, loss_coin = 300000,
                    reset_coin = 120000};
get_eqm_by_id(40096) ->
    #guard_eqm_data{base_id = 40096, lev = 90, classes = 1,
                    type = 18, quality = 4, loss_coin = 300000,
                    reset_coin = 120000};
get_eqm_by_id(40101) ->
    #guard_eqm_data{base_id = 40101, lev = 100, classes = 1,
                    type = 15, quality = 4, loss_coin = 400000,
                    reset_coin = 150000};
get_eqm_by_id(40102) ->
    #guard_eqm_data{base_id = 40102, lev = 100, classes = 1,
                    type = 19, quality = 4, loss_coin = 400000,
                    reset_coin = 150000};
get_eqm_by_id(40103) ->
    #guard_eqm_data{base_id = 40103, lev = 100, classes = 1,
                    type = 16, quality = 4, loss_coin = 400000,
                    reset_coin = 150000};
get_eqm_by_id(40104) ->
    #guard_eqm_data{base_id = 40104, lev = 100, classes = 1,
                    type = 20, quality = 4, loss_coin = 400000,
                    reset_coin = 150000};
get_eqm_by_id(40105) ->
    #guard_eqm_data{base_id = 40105, lev = 100, classes = 1,
                    type = 17, quality = 4, loss_coin = 400000,
                    reset_coin = 150000};
get_eqm_by_id(40106) ->
    #guard_eqm_data{base_id = 40106, lev = 100, classes = 1,
                    type = 18, quality = 4, loss_coin = 400000,
                    reset_coin = 150000};
get_eqm_by_id(40107) ->
    #guard_eqm_data{base_id = 40107, lev = 110, classes = 1,
                    type = 15, quality = 4, loss_coin = 500000,
                    reset_coin = 180000};
get_eqm_by_id(40108) ->
    #guard_eqm_data{base_id = 40108, lev = 110, classes = 1,
                    type = 19, quality = 4, loss_coin = 500000,
                    reset_coin = 180000};
get_eqm_by_id(40109) ->
    #guard_eqm_data{base_id = 40109, lev = 110, classes = 1,
                    type = 16, quality = 4, loss_coin = 500000,
                    reset_coin = 180000};
get_eqm_by_id(40110) ->
    #guard_eqm_data{base_id = 40110, lev = 110, classes = 1,
                    type = 20, quality = 4, loss_coin = 500000,
                    reset_coin = 180000};
get_eqm_by_id(40111) ->
    #guard_eqm_data{base_id = 40111, lev = 110, classes = 1,
                    type = 17, quality = 4, loss_coin = 500000,
                    reset_coin = 180000};
get_eqm_by_id(40112) ->
    #guard_eqm_data{base_id = 40112, lev = 110, classes = 1,
                    type = 18, quality = 4, loss_coin = 500000,
                    reset_coin = 180000};
get_eqm_by_id(41001) ->
    #guard_eqm_data{base_id = 41001, lev = 1, classes = 2,
                    type = 15, quality = 0};
get_eqm_by_id(41002) ->
    #guard_eqm_data{base_id = 41002, lev = 1, classes = 2,
                    type = 19, quality = 0};
get_eqm_by_id(41003) ->
    #guard_eqm_data{base_id = 41003, lev = 1, classes = 2,
                    type = 16, quality = 0};
get_eqm_by_id(41004) ->
    #guard_eqm_data{base_id = 41004, lev = 1, classes = 2,
                    type = 20, quality = 0};
get_eqm_by_id(41005) ->
    #guard_eqm_data{base_id = 41005, lev = 1, classes = 2,
                    type = 17, quality = 0};
get_eqm_by_id(41006) ->
    #guard_eqm_data{base_id = 41006, lev = 1, classes = 2,
                    type = 18, quality = 0};
get_eqm_by_id(41011) ->
    #guard_eqm_data{base_id = 41011, lev = 10, classes = 2,
                    type = 15, quality = 0};
get_eqm_by_id(41012) ->
    #guard_eqm_data{base_id = 41012, lev = 10, classes = 2,
                    type = 19, quality = 0};
get_eqm_by_id(41013) ->
    #guard_eqm_data{base_id = 41013, lev = 10, classes = 2,
                    type = 16, quality = 0};
get_eqm_by_id(41014) ->
    #guard_eqm_data{base_id = 41014, lev = 10, classes = 2,
                    type = 20, quality = 0};
get_eqm_by_id(41015) ->
    #guard_eqm_data{base_id = 41015, lev = 10, classes = 2,
                    type = 17, quality = 0};
get_eqm_by_id(41016) ->
    #guard_eqm_data{base_id = 41016, lev = 10, classes = 2,
                    type = 18, quality = 0};
get_eqm_by_id(41021) ->
    #guard_eqm_data{base_id = 41021, lev = 20, classes = 2,
                    type = 15, quality = 1};
get_eqm_by_id(41022) ->
    #guard_eqm_data{base_id = 41022, lev = 20, classes = 2,
                    type = 19, quality = 1};
get_eqm_by_id(41023) ->
    #guard_eqm_data{base_id = 41023, lev = 20, classes = 2,
                    type = 16, quality = 1};
get_eqm_by_id(41024) ->
    #guard_eqm_data{base_id = 41024, lev = 20, classes = 2,
                    type = 20, quality = 1};
get_eqm_by_id(41025) ->
    #guard_eqm_data{base_id = 41025, lev = 20, classes = 2,
                    type = 17, quality = 1};
get_eqm_by_id(41026) ->
    #guard_eqm_data{base_id = 41026, lev = 20, classes = 2,
                    type = 18, quality = 1};
get_eqm_by_id(41031) ->
    #guard_eqm_data{base_id = 41031, lev = 30, classes = 2,
                    type = 15, quality = 1, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(41032) ->
    #guard_eqm_data{base_id = 41032, lev = 30, classes = 2,
                    type = 19, quality = 1, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(41033) ->
    #guard_eqm_data{base_id = 41033, lev = 30, classes = 2,
                    type = 16, quality = 1, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(41034) ->
    #guard_eqm_data{base_id = 41034, lev = 30, classes = 2,
                    type = 20, quality = 1, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(41035) ->
    #guard_eqm_data{base_id = 41035, lev = 30, classes = 2,
                    type = 17, quality = 1, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(41036) ->
    #guard_eqm_data{base_id = 41036, lev = 30, classes = 2,
                    type = 18, quality = 1, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(41041) ->
    #guard_eqm_data{base_id = 41041, lev = 40, classes = 2,
                    type = 15, quality = 2, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(41042) ->
    #guard_eqm_data{base_id = 41042, lev = 40, classes = 2,
                    type = 19, quality = 2, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(41043) ->
    #guard_eqm_data{base_id = 41043, lev = 40, classes = 2,
                    type = 16, quality = 2, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(41044) ->
    #guard_eqm_data{base_id = 41044, lev = 40, classes = 2,
                    type = 20, quality = 2, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(41045) ->
    #guard_eqm_data{base_id = 41045, lev = 40, classes = 2,
                    type = 17, quality = 2, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(41046) ->
    #guard_eqm_data{base_id = 41046, lev = 40, classes = 2,
                    type = 18, quality = 2, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(41051) ->
    #guard_eqm_data{base_id = 41051, lev = 50, classes = 2,
                    type = 15, quality = 2, loss_coin = 42000,
                    reset_coin = 33600};
get_eqm_by_id(41052) ->
    #guard_eqm_data{base_id = 41052, lev = 50, classes = 2,
                    type = 19, quality = 2, loss_coin = 42000,
                    reset_coin = 33600};
get_eqm_by_id(41053) ->
    #guard_eqm_data{base_id = 41053, lev = 50, classes = 2,
                    type = 16, quality = 2, loss_coin = 42000,
                    reset_coin = 33600};
get_eqm_by_id(41054) ->
    #guard_eqm_data{base_id = 41054, lev = 50, classes = 2,
                    type = 20, quality = 2, loss_coin = 42000,
                    reset_coin = 33600};
get_eqm_by_id(41055) ->
    #guard_eqm_data{base_id = 41055, lev = 50, classes = 2,
                    type = 17, quality = 2, loss_coin = 42000,
                    reset_coin = 33600};
get_eqm_by_id(41056) ->
    #guard_eqm_data{base_id = 41056, lev = 50, classes = 2,
                    type = 18, quality = 2, loss_coin = 42000,
                    reset_coin = 33600};
get_eqm_by_id(41061) ->
    #guard_eqm_data{base_id = 41061, lev = 60, classes = 2,
                    type = 15, quality = 3, loss_coin = 108000,
                    reset_coin = 54000};
get_eqm_by_id(41062) ->
    #guard_eqm_data{base_id = 41062, lev = 60, classes = 2,
                    type = 19, quality = 3, loss_coin = 108000,
                    reset_coin = 54000};
get_eqm_by_id(41063) ->
    #guard_eqm_data{base_id = 41063, lev = 60, classes = 2,
                    type = 16, quality = 3, loss_coin = 108000,
                    reset_coin = 54000};
get_eqm_by_id(41064) ->
    #guard_eqm_data{base_id = 41064, lev = 60, classes = 2,
                    type = 20, quality = 3, loss_coin = 108000,
                    reset_coin = 54000};
get_eqm_by_id(41065) ->
    #guard_eqm_data{base_id = 41065, lev = 60, classes = 2,
                    type = 17, quality = 3, loss_coin = 108000,
                    reset_coin = 54000};
get_eqm_by_id(41066) ->
    #guard_eqm_data{base_id = 41066, lev = 60, classes = 2,
                    type = 18, quality = 3, loss_coin = 108000,
                    reset_coin = 54000};
get_eqm_by_id(41071) ->
    #guard_eqm_data{base_id = 41071, lev = 70, classes = 2,
                    type = 15, quality = 3, loss_coin = 210000,
                    reset_coin = 84000};
get_eqm_by_id(41072) ->
    #guard_eqm_data{base_id = 41072, lev = 70, classes = 2,
                    type = 19, quality = 3, loss_coin = 210000,
                    reset_coin = 84000};
get_eqm_by_id(41073) ->
    #guard_eqm_data{base_id = 41073, lev = 70, classes = 2,
                    type = 16, quality = 3, loss_coin = 210000,
                    reset_coin = 84000};
get_eqm_by_id(41074) ->
    #guard_eqm_data{base_id = 41074, lev = 70, classes = 2,
                    type = 20, quality = 3, loss_coin = 210000,
                    reset_coin = 84000};
get_eqm_by_id(41075) ->
    #guard_eqm_data{base_id = 41075, lev = 70, classes = 2,
                    type = 17, quality = 3, loss_coin = 210000,
                    reset_coin = 84000};
get_eqm_by_id(41076) ->
    #guard_eqm_data{base_id = 41076, lev = 70, classes = 2,
                    type = 18, quality = 3, loss_coin = 210000,
                    reset_coin = 84000};
get_eqm_by_id(41081) ->
    #guard_eqm_data{base_id = 41081, lev = 80, classes = 2,
                    type = 15, quality = 4, loss_coin = 240000,
                    reset_coin = 96000};
get_eqm_by_id(41082) ->
    #guard_eqm_data{base_id = 41082, lev = 80, classes = 2,
                    type = 19, quality = 4, loss_coin = 240000,
                    reset_coin = 96000};
get_eqm_by_id(41083) ->
    #guard_eqm_data{base_id = 41083, lev = 80, classes = 2,
                    type = 16, quality = 4, loss_coin = 240000,
                    reset_coin = 96000};
get_eqm_by_id(41084) ->
    #guard_eqm_data{base_id = 41084, lev = 80, classes = 2,
                    type = 20, quality = 4, loss_coin = 240000,
                    reset_coin = 96000};
get_eqm_by_id(41085) ->
    #guard_eqm_data{base_id = 41085, lev = 80, classes = 2,
                    type = 17, quality = 4, loss_coin = 240000,
                    reset_coin = 96000};
get_eqm_by_id(41086) ->
    #guard_eqm_data{base_id = 41086, lev = 80, classes = 2,
                    type = 18, quality = 4, loss_coin = 240000,
                    reset_coin = 96000};
get_eqm_by_id(41091) ->
    #guard_eqm_data{base_id = 41091, lev = 90, classes = 2,
                    type = 15, quality = 4, loss_coin = 300000,
                    reset_coin = 120000};
get_eqm_by_id(41092) ->
    #guard_eqm_data{base_id = 41092, lev = 90, classes = 2,
                    type = 19, quality = 4, loss_coin = 300000,
                    reset_coin = 120000};
get_eqm_by_id(41093) ->
    #guard_eqm_data{base_id = 41093, lev = 90, classes = 2,
                    type = 16, quality = 4, loss_coin = 300000,
                    reset_coin = 120000};
get_eqm_by_id(41094) ->
    #guard_eqm_data{base_id = 41094, lev = 90, classes = 2,
                    type = 20, quality = 4, loss_coin = 300000,
                    reset_coin = 120000};
get_eqm_by_id(41095) ->
    #guard_eqm_data{base_id = 41095, lev = 90, classes = 2,
                    type = 17, quality = 4, loss_coin = 300000,
                    reset_coin = 120000};
get_eqm_by_id(41096) ->
    #guard_eqm_data{base_id = 41096, lev = 90, classes = 2,
                    type = 18, quality = 4, loss_coin = 300000,
                    reset_coin = 120000};
get_eqm_by_id(41101) ->
    #guard_eqm_data{base_id = 41101, lev = 100, classes = 2,
                    type = 15, quality = 4, loss_coin = 400000,
                    reset_coin = 150000};
get_eqm_by_id(41102) ->
    #guard_eqm_data{base_id = 41102, lev = 100, classes = 2,
                    type = 19, quality = 4, loss_coin = 400000,
                    reset_coin = 150000};
get_eqm_by_id(41103) ->
    #guard_eqm_data{base_id = 41103, lev = 100, classes = 2,
                    type = 16, quality = 4, loss_coin = 400000,
                    reset_coin = 150000};
get_eqm_by_id(41104) ->
    #guard_eqm_data{base_id = 41104, lev = 100, classes = 2,
                    type = 20, quality = 4, loss_coin = 400000,
                    reset_coin = 150000};
get_eqm_by_id(41105) ->
    #guard_eqm_data{base_id = 41105, lev = 100, classes = 2,
                    type = 17, quality = 4, loss_coin = 400000,
                    reset_coin = 150000};
get_eqm_by_id(41106) ->
    #guard_eqm_data{base_id = 41106, lev = 100, classes = 2,
                    type = 18, quality = 4, loss_coin = 400000,
                    reset_coin = 150000};
get_eqm_by_id(41107) ->
    #guard_eqm_data{base_id = 41107, lev = 110, classes = 2,
                    type = 15, quality = 4, loss_coin = 500000,
                    reset_coin = 180000};
get_eqm_by_id(41108) ->
    #guard_eqm_data{base_id = 41108, lev = 110, classes = 2,
                    type = 19, quality = 4, loss_coin = 500000,
                    reset_coin = 180000};
get_eqm_by_id(41109) ->
    #guard_eqm_data{base_id = 41109, lev = 110, classes = 2,
                    type = 16, quality = 4, loss_coin = 500000,
                    reset_coin = 180000};
get_eqm_by_id(41110) ->
    #guard_eqm_data{base_id = 41110, lev = 110, classes = 2,
                    type = 20, quality = 4, loss_coin = 500000,
                    reset_coin = 180000};
get_eqm_by_id(41111) ->
    #guard_eqm_data{base_id = 41111, lev = 110, classes = 2,
                    type = 17, quality = 4, loss_coin = 500000,
                    reset_coin = 180000};
get_eqm_by_id(41112) ->
    #guard_eqm_data{base_id = 41112, lev = 110, classes = 2,
                    type = 18, quality = 4, loss_coin = 500000,
                    reset_coin = 180000};
get_eqm_by_id(42001) ->
    #guard_eqm_data{base_id = 42001, lev = 1, classes = 3,
                    type = 15, quality = 0};
get_eqm_by_id(42002) ->
    #guard_eqm_data{base_id = 42002, lev = 1, classes = 3,
                    type = 19, quality = 0};
get_eqm_by_id(42003) ->
    #guard_eqm_data{base_id = 42003, lev = 1, classes = 3,
                    type = 16, quality = 0};
get_eqm_by_id(42004) ->
    #guard_eqm_data{base_id = 42004, lev = 1, classes = 3,
                    type = 20, quality = 0};
get_eqm_by_id(42005) ->
    #guard_eqm_data{base_id = 42005, lev = 1, classes = 3,
                    type = 17, quality = 0};
get_eqm_by_id(42006) ->
    #guard_eqm_data{base_id = 42006, lev = 1, classes = 3,
                    type = 18, quality = 0};
get_eqm_by_id(42011) ->
    #guard_eqm_data{base_id = 42011, lev = 10, classes = 3,
                    type = 15, quality = 0};
get_eqm_by_id(42012) ->
    #guard_eqm_data{base_id = 42012, lev = 10, classes = 3,
                    type = 19, quality = 0};
get_eqm_by_id(42013) ->
    #guard_eqm_data{base_id = 42013, lev = 10, classes = 3,
                    type = 16, quality = 0};
get_eqm_by_id(42014) ->
    #guard_eqm_data{base_id = 42014, lev = 10, classes = 3,
                    type = 20, quality = 0};
get_eqm_by_id(42015) ->
    #guard_eqm_data{base_id = 42015, lev = 10, classes = 3,
                    type = 17, quality = 0};
get_eqm_by_id(42016) ->
    #guard_eqm_data{base_id = 42016, lev = 10, classes = 3,
                    type = 18, quality = 0};
get_eqm_by_id(42021) ->
    #guard_eqm_data{base_id = 42021, lev = 20, classes = 3,
                    type = 15, quality = 1};
get_eqm_by_id(42022) ->
    #guard_eqm_data{base_id = 42022, lev = 20, classes = 3,
                    type = 19, quality = 1};
get_eqm_by_id(42023) ->
    #guard_eqm_data{base_id = 42023, lev = 20, classes = 3,
                    type = 16, quality = 1};
get_eqm_by_id(42024) ->
    #guard_eqm_data{base_id = 42024, lev = 20, classes = 3,
                    type = 20, quality = 1};
get_eqm_by_id(42025) ->
    #guard_eqm_data{base_id = 42025, lev = 20, classes = 3,
                    type = 17, quality = 1};
get_eqm_by_id(42026) ->
    #guard_eqm_data{base_id = 42026, lev = 20, classes = 3,
                    type = 18, quality = 1};
get_eqm_by_id(42031) ->
    #guard_eqm_data{base_id = 42031, lev = 30, classes = 3,
                    type = 15, quality = 1, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(42032) ->
    #guard_eqm_data{base_id = 42032, lev = 30, classes = 3,
                    type = 19, quality = 1, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(42033) ->
    #guard_eqm_data{base_id = 42033, lev = 30, classes = 3,
                    type = 16, quality = 1, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(42034) ->
    #guard_eqm_data{base_id = 42034, lev = 30, classes = 3,
                    type = 20, quality = 1, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(42035) ->
    #guard_eqm_data{base_id = 42035, lev = 30, classes = 3,
                    type = 17, quality = 1, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(42036) ->
    #guard_eqm_data{base_id = 42036, lev = 30, classes = 3,
                    type = 18, quality = 1, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(42041) ->
    #guard_eqm_data{base_id = 42041, lev = 40, classes = 3,
                    type = 15, quality = 2, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(42042) ->
    #guard_eqm_data{base_id = 42042, lev = 40, classes = 3,
                    type = 19, quality = 2, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(42043) ->
    #guard_eqm_data{base_id = 42043, lev = 40, classes = 3,
                    type = 16, quality = 2, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(42044) ->
    #guard_eqm_data{base_id = 42044, lev = 40, classes = 3,
                    type = 20, quality = 2, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(42045) ->
    #guard_eqm_data{base_id = 42045, lev = 40, classes = 3,
                    type = 17, quality = 2, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(42046) ->
    #guard_eqm_data{base_id = 42046, lev = 40, classes = 3,
                    type = 18, quality = 2, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(42051) ->
    #guard_eqm_data{base_id = 42051, lev = 50, classes = 3,
                    type = 15, quality = 2, loss_coin = 42000,
                    reset_coin = 33600};
get_eqm_by_id(42052) ->
    #guard_eqm_data{base_id = 42052, lev = 50, classes = 3,
                    type = 19, quality = 2, loss_coin = 42000,
                    reset_coin = 33600};
get_eqm_by_id(42053) ->
    #guard_eqm_data{base_id = 42053, lev = 50, classes = 3,
                    type = 16, quality = 2, loss_coin = 42000,
                    reset_coin = 33600};
get_eqm_by_id(42054) ->
    #guard_eqm_data{base_id = 42054, lev = 50, classes = 3,
                    type = 20, quality = 2, loss_coin = 42000,
                    reset_coin = 33600};
get_eqm_by_id(42055) ->
    #guard_eqm_data{base_id = 42055, lev = 50, classes = 3,
                    type = 17, quality = 2, loss_coin = 42000,
                    reset_coin = 33600};
get_eqm_by_id(42056) ->
    #guard_eqm_data{base_id = 42056, lev = 50, classes = 3,
                    type = 18, quality = 2, loss_coin = 42000,
                    reset_coin = 33600};
get_eqm_by_id(42061) ->
    #guard_eqm_data{base_id = 42061, lev = 60, classes = 3,
                    type = 15, quality = 3, loss_coin = 108000,
                    reset_coin = 54000};
get_eqm_by_id(42062) ->
    #guard_eqm_data{base_id = 42062, lev = 60, classes = 3,
                    type = 19, quality = 3, loss_coin = 108000,
                    reset_coin = 54000};
get_eqm_by_id(42063) ->
    #guard_eqm_data{base_id = 42063, lev = 60, classes = 3,
                    type = 16, quality = 3, loss_coin = 108000,
                    reset_coin = 54000};
get_eqm_by_id(42064) ->
    #guard_eqm_data{base_id = 42064, lev = 60, classes = 3,
                    type = 20, quality = 3, loss_coin = 108000,
                    reset_coin = 54000};
get_eqm_by_id(42065) ->
    #guard_eqm_data{base_id = 42065, lev = 60, classes = 3,
                    type = 17, quality = 3, loss_coin = 108000,
                    reset_coin = 54000};
get_eqm_by_id(42066) ->
    #guard_eqm_data{base_id = 42066, lev = 60, classes = 3,
                    type = 18, quality = 3, loss_coin = 108000,
                    reset_coin = 54000};
get_eqm_by_id(42071) ->
    #guard_eqm_data{base_id = 42071, lev = 70, classes = 3,
                    type = 15, quality = 3, loss_coin = 210000,
                    reset_coin = 84000};
get_eqm_by_id(42072) ->
    #guard_eqm_data{base_id = 42072, lev = 70, classes = 3,
                    type = 19, quality = 3, loss_coin = 210000,
                    reset_coin = 84000};
get_eqm_by_id(42073) ->
    #guard_eqm_data{base_id = 42073, lev = 70, classes = 3,
                    type = 16, quality = 3, loss_coin = 210000,
                    reset_coin = 84000};
get_eqm_by_id(42074) ->
    #guard_eqm_data{base_id = 42074, lev = 70, classes = 3,
                    type = 20, quality = 3, loss_coin = 210000,
                    reset_coin = 84000};
get_eqm_by_id(42075) ->
    #guard_eqm_data{base_id = 42075, lev = 70, classes = 3,
                    type = 17, quality = 3, loss_coin = 210000,
                    reset_coin = 84000};
get_eqm_by_id(42076) ->
    #guard_eqm_data{base_id = 42076, lev = 70, classes = 3,
                    type = 18, quality = 3, loss_coin = 210000,
                    reset_coin = 84000};
get_eqm_by_id(42081) ->
    #guard_eqm_data{base_id = 42081, lev = 80, classes = 3,
                    type = 15, quality = 4, loss_coin = 240000,
                    reset_coin = 96000};
get_eqm_by_id(42082) ->
    #guard_eqm_data{base_id = 42082, lev = 80, classes = 3,
                    type = 19, quality = 4, loss_coin = 240000,
                    reset_coin = 96000};
get_eqm_by_id(42083) ->
    #guard_eqm_data{base_id = 42083, lev = 80, classes = 3,
                    type = 16, quality = 4, loss_coin = 240000,
                    reset_coin = 96000};
get_eqm_by_id(42084) ->
    #guard_eqm_data{base_id = 42084, lev = 80, classes = 3,
                    type = 20, quality = 4, loss_coin = 240000,
                    reset_coin = 96000};
get_eqm_by_id(42085) ->
    #guard_eqm_data{base_id = 42085, lev = 80, classes = 3,
                    type = 17, quality = 4, loss_coin = 240000,
                    reset_coin = 96000};
get_eqm_by_id(42086) ->
    #guard_eqm_data{base_id = 42086, lev = 80, classes = 3,
                    type = 18, quality = 4, loss_coin = 240000,
                    reset_coin = 96000};
get_eqm_by_id(42091) ->
    #guard_eqm_data{base_id = 42091, lev = 90, classes = 3,
                    type = 15, quality = 4, loss_coin = 300000,
                    reset_coin = 120000};
get_eqm_by_id(42092) ->
    #guard_eqm_data{base_id = 42092, lev = 90, classes = 3,
                    type = 19, quality = 4, loss_coin = 300000,
                    reset_coin = 120000};
get_eqm_by_id(42093) ->
    #guard_eqm_data{base_id = 42093, lev = 90, classes = 3,
                    type = 16, quality = 4, loss_coin = 300000,
                    reset_coin = 120000};
get_eqm_by_id(42094) ->
    #guard_eqm_data{base_id = 42094, lev = 90, classes = 3,
                    type = 20, quality = 4, loss_coin = 300000,
                    reset_coin = 120000};
get_eqm_by_id(42095) ->
    #guard_eqm_data{base_id = 42095, lev = 90, classes = 3,
                    type = 17, quality = 4, loss_coin = 300000,
                    reset_coin = 120000};
get_eqm_by_id(42096) ->
    #guard_eqm_data{base_id = 42096, lev = 90, classes = 3,
                    type = 18, quality = 4, loss_coin = 300000,
                    reset_coin = 120000};
get_eqm_by_id(42101) ->
    #guard_eqm_data{base_id = 42101, lev = 100, classes = 3,
                    type = 15, quality = 4, loss_coin = 400000,
                    reset_coin = 150000};
get_eqm_by_id(42102) ->
    #guard_eqm_data{base_id = 42102, lev = 100, classes = 3,
                    type = 19, quality = 4, loss_coin = 400000,
                    reset_coin = 150000};
get_eqm_by_id(42103) ->
    #guard_eqm_data{base_id = 42103, lev = 100, classes = 3,
                    type = 16, quality = 4, loss_coin = 400000,
                    reset_coin = 150000};
get_eqm_by_id(42104) ->
    #guard_eqm_data{base_id = 42104, lev = 100, classes = 3,
                    type = 20, quality = 4, loss_coin = 400000,
                    reset_coin = 150000};
get_eqm_by_id(42105) ->
    #guard_eqm_data{base_id = 42105, lev = 100, classes = 3,
                    type = 17, quality = 4, loss_coin = 400000,
                    reset_coin = 150000};
get_eqm_by_id(42106) ->
    #guard_eqm_data{base_id = 42106, lev = 100, classes = 3,
                    type = 18, quality = 4, loss_coin = 400000,
                    reset_coin = 150000};
get_eqm_by_id(42107) ->
    #guard_eqm_data{base_id = 42107, lev = 110, classes = 3,
                    type = 15, quality = 4, loss_coin = 500000,
                    reset_coin = 180000};
get_eqm_by_id(42108) ->
    #guard_eqm_data{base_id = 42108, lev = 110, classes = 3,
                    type = 19, quality = 4, loss_coin = 500000,
                    reset_coin = 180000};
get_eqm_by_id(42109) ->
    #guard_eqm_data{base_id = 42109, lev = 110, classes = 3,
                    type = 16, quality = 4, loss_coin = 500000,
                    reset_coin = 180000};
get_eqm_by_id(42110) ->
    #guard_eqm_data{base_id = 42110, lev = 110, classes = 3,
                    type = 20, quality = 4, loss_coin = 500000,
                    reset_coin = 180000};
get_eqm_by_id(42111) ->
    #guard_eqm_data{base_id = 42111, lev = 110, classes = 3,
                    type = 17, quality = 4, loss_coin = 500000,
                    reset_coin = 180000};
get_eqm_by_id(42112) ->
    #guard_eqm_data{base_id = 42112, lev = 110, classes = 3,
                    type = 18, quality = 4, loss_coin = 500000,
                    reset_coin = 180000};
get_eqm_by_id(43001) ->
    #guard_eqm_data{base_id = 43001, lev = 1, classes = 4,
                    type = 15, quality = 0};
get_eqm_by_id(43002) ->
    #guard_eqm_data{base_id = 43002, lev = 1, classes = 4,
                    type = 19, quality = 0};
get_eqm_by_id(43003) ->
    #guard_eqm_data{base_id = 43003, lev = 1, classes = 4,
                    type = 16, quality = 0};
get_eqm_by_id(43004) ->
    #guard_eqm_data{base_id = 43004, lev = 1, classes = 4,
                    type = 20, quality = 0};
get_eqm_by_id(43005) ->
    #guard_eqm_data{base_id = 43005, lev = 1, classes = 4,
                    type = 17, quality = 0};
get_eqm_by_id(43006) ->
    #guard_eqm_data{base_id = 43006, lev = 1, classes = 4,
                    type = 18, quality = 0};
get_eqm_by_id(43011) ->
    #guard_eqm_data{base_id = 43011, lev = 10, classes = 4,
                    type = 15, quality = 0};
get_eqm_by_id(43012) ->
    #guard_eqm_data{base_id = 43012, lev = 10, classes = 4,
                    type = 19, quality = 0};
get_eqm_by_id(43013) ->
    #guard_eqm_data{base_id = 43013, lev = 10, classes = 4,
                    type = 16, quality = 0};
get_eqm_by_id(43014) ->
    #guard_eqm_data{base_id = 43014, lev = 10, classes = 4,
                    type = 20, quality = 0};
get_eqm_by_id(43015) ->
    #guard_eqm_data{base_id = 43015, lev = 10, classes = 4,
                    type = 17, quality = 0};
get_eqm_by_id(43016) ->
    #guard_eqm_data{base_id = 43016, lev = 10, classes = 4,
                    type = 18, quality = 0};
get_eqm_by_id(43021) ->
    #guard_eqm_data{base_id = 43021, lev = 20, classes = 4,
                    type = 15, quality = 1};
get_eqm_by_id(43022) ->
    #guard_eqm_data{base_id = 43022, lev = 20, classes = 4,
                    type = 19, quality = 1};
get_eqm_by_id(43023) ->
    #guard_eqm_data{base_id = 43023, lev = 20, classes = 4,
                    type = 16, quality = 1};
get_eqm_by_id(43024) ->
    #guard_eqm_data{base_id = 43024, lev = 20, classes = 4,
                    type = 20, quality = 1};
get_eqm_by_id(43025) ->
    #guard_eqm_data{base_id = 43025, lev = 20, classes = 4,
                    type = 17, quality = 1};
get_eqm_by_id(43026) ->
    #guard_eqm_data{base_id = 43026, lev = 20, classes = 4,
                    type = 18, quality = 1};
get_eqm_by_id(43031) ->
    #guard_eqm_data{base_id = 43031, lev = 30, classes = 4,
                    type = 15, quality = 1, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(43032) ->
    #guard_eqm_data{base_id = 43032, lev = 30, classes = 4,
                    type = 19, quality = 1, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(43033) ->
    #guard_eqm_data{base_id = 43033, lev = 30, classes = 4,
                    type = 16, quality = 1, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(43034) ->
    #guard_eqm_data{base_id = 43034, lev = 30, classes = 4,
                    type = 20, quality = 1, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(43035) ->
    #guard_eqm_data{base_id = 43035, lev = 30, classes = 4,
                    type = 17, quality = 1, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(43036) ->
    #guard_eqm_data{base_id = 43036, lev = 30, classes = 4,
                    type = 18, quality = 1, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(43041) ->
    #guard_eqm_data{base_id = 43041, lev = 40, classes = 4,
                    type = 15, quality = 2, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(43042) ->
    #guard_eqm_data{base_id = 43042, lev = 40, classes = 4,
                    type = 19, quality = 2, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(43043) ->
    #guard_eqm_data{base_id = 43043, lev = 40, classes = 4,
                    type = 16, quality = 2, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(43044) ->
    #guard_eqm_data{base_id = 43044, lev = 40, classes = 4,
                    type = 20, quality = 2, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(43045) ->
    #guard_eqm_data{base_id = 43045, lev = 40, classes = 4,
                    type = 17, quality = 2, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(43046) ->
    #guard_eqm_data{base_id = 43046, lev = 40, classes = 4,
                    type = 18, quality = 2, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(43051) ->
    #guard_eqm_data{base_id = 43051, lev = 50, classes = 4,
                    type = 15, quality = 2, loss_coin = 42000,
                    reset_coin = 33600};
get_eqm_by_id(43052) ->
    #guard_eqm_data{base_id = 43052, lev = 50, classes = 4,
                    type = 19, quality = 2, loss_coin = 42000,
                    reset_coin = 33600};
get_eqm_by_id(43053) ->
    #guard_eqm_data{base_id = 43053, lev = 50, classes = 4,
                    type = 16, quality = 2, loss_coin = 42000,
                    reset_coin = 33600};
get_eqm_by_id(43054) ->
    #guard_eqm_data{base_id = 43054, lev = 50, classes = 4,
                    type = 20, quality = 2, loss_coin = 42000,
                    reset_coin = 33600};
get_eqm_by_id(43055) ->
    #guard_eqm_data{base_id = 43055, lev = 50, classes = 4,
                    type = 17, quality = 2, loss_coin = 42000,
                    reset_coin = 33600};
get_eqm_by_id(43056) ->
    #guard_eqm_data{base_id = 43056, lev = 50, classes = 4,
                    type = 18, quality = 2, loss_coin = 42000,
                    reset_coin = 33600};
get_eqm_by_id(43061) ->
    #guard_eqm_data{base_id = 43061, lev = 60, classes = 4,
                    type = 15, quality = 3, loss_coin = 108000,
                    reset_coin = 54000};
get_eqm_by_id(43062) ->
    #guard_eqm_data{base_id = 43062, lev = 60, classes = 4,
                    type = 19, quality = 3, loss_coin = 108000,
                    reset_coin = 54000};
get_eqm_by_id(43063) ->
    #guard_eqm_data{base_id = 43063, lev = 60, classes = 4,
                    type = 16, quality = 3, loss_coin = 108000,
                    reset_coin = 54000};
get_eqm_by_id(43064) ->
    #guard_eqm_data{base_id = 43064, lev = 60, classes = 4,
                    type = 20, quality = 3, loss_coin = 108000,
                    reset_coin = 54000};
get_eqm_by_id(43065) ->
    #guard_eqm_data{base_id = 43065, lev = 60, classes = 4,
                    type = 17, quality = 3, loss_coin = 108000,
                    reset_coin = 54000};
get_eqm_by_id(43066) ->
    #guard_eqm_data{base_id = 43066, lev = 60, classes = 4,
                    type = 18, quality = 3, loss_coin = 108000,
                    reset_coin = 54000};
get_eqm_by_id(43071) ->
    #guard_eqm_data{base_id = 43071, lev = 70, classes = 4,
                    type = 15, quality = 3, loss_coin = 210000,
                    reset_coin = 84000};
get_eqm_by_id(43072) ->
    #guard_eqm_data{base_id = 43072, lev = 70, classes = 4,
                    type = 19, quality = 3, loss_coin = 210000,
                    reset_coin = 84000};
get_eqm_by_id(43073) ->
    #guard_eqm_data{base_id = 43073, lev = 70, classes = 4,
                    type = 16, quality = 3, loss_coin = 210000,
                    reset_coin = 84000};
get_eqm_by_id(43074) ->
    #guard_eqm_data{base_id = 43074, lev = 70, classes = 4,
                    type = 20, quality = 3, loss_coin = 210000,
                    reset_coin = 84000};
get_eqm_by_id(43075) ->
    #guard_eqm_data{base_id = 43075, lev = 70, classes = 4,
                    type = 17, quality = 3, loss_coin = 210000,
                    reset_coin = 84000};
get_eqm_by_id(43076) ->
    #guard_eqm_data{base_id = 43076, lev = 70, classes = 4,
                    type = 18, quality = 3, loss_coin = 210000,
                    reset_coin = 84000};
get_eqm_by_id(43081) ->
    #guard_eqm_data{base_id = 43081, lev = 80, classes = 4,
                    type = 15, quality = 4, loss_coin = 240000,
                    reset_coin = 96000};
get_eqm_by_id(43082) ->
    #guard_eqm_data{base_id = 43082, lev = 80, classes = 4,
                    type = 19, quality = 4, loss_coin = 240000,
                    reset_coin = 96000};
get_eqm_by_id(43083) ->
    #guard_eqm_data{base_id = 43083, lev = 80, classes = 4,
                    type = 16, quality = 4, loss_coin = 240000,
                    reset_coin = 96000};
get_eqm_by_id(43084) ->
    #guard_eqm_data{base_id = 43084, lev = 80, classes = 4,
                    type = 20, quality = 4, loss_coin = 240000,
                    reset_coin = 96000};
get_eqm_by_id(43085) ->
    #guard_eqm_data{base_id = 43085, lev = 80, classes = 4,
                    type = 17, quality = 4, loss_coin = 240000,
                    reset_coin = 96000};
get_eqm_by_id(43086) ->
    #guard_eqm_data{base_id = 43086, lev = 80, classes = 4,
                    type = 18, quality = 4, loss_coin = 240000,
                    reset_coin = 96000};
get_eqm_by_id(43091) ->
    #guard_eqm_data{base_id = 43091, lev = 90, classes = 4,
                    type = 15, quality = 4, loss_coin = 300000,
                    reset_coin = 120000};
get_eqm_by_id(43092) ->
    #guard_eqm_data{base_id = 43092, lev = 90, classes = 4,
                    type = 19, quality = 4, loss_coin = 300000,
                    reset_coin = 120000};
get_eqm_by_id(43093) ->
    #guard_eqm_data{base_id = 43093, lev = 90, classes = 4,
                    type = 16, quality = 4, loss_coin = 300000,
                    reset_coin = 120000};
get_eqm_by_id(43094) ->
    #guard_eqm_data{base_id = 43094, lev = 90, classes = 4,
                    type = 20, quality = 4, loss_coin = 300000,
                    reset_coin = 120000};
get_eqm_by_id(43095) ->
    #guard_eqm_data{base_id = 43095, lev = 90, classes = 4,
                    type = 17, quality = 4, loss_coin = 300000,
                    reset_coin = 120000};
get_eqm_by_id(43096) ->
    #guard_eqm_data{base_id = 43096, lev = 90, classes = 4,
                    type = 18, quality = 4, loss_coin = 300000,
                    reset_coin = 120000};
get_eqm_by_id(43101) ->
    #guard_eqm_data{base_id = 43101, lev = 100, classes = 4,
                    type = 15, quality = 4, loss_coin = 400000,
                    reset_coin = 150000};
get_eqm_by_id(43102) ->
    #guard_eqm_data{base_id = 43102, lev = 100, classes = 4,
                    type = 19, quality = 4, loss_coin = 400000,
                    reset_coin = 150000};
get_eqm_by_id(43103) ->
    #guard_eqm_data{base_id = 43103, lev = 100, classes = 4,
                    type = 16, quality = 4, loss_coin = 400000,
                    reset_coin = 150000};
get_eqm_by_id(43104) ->
    #guard_eqm_data{base_id = 43104, lev = 100, classes = 4,
                    type = 20, quality = 4, loss_coin = 400000,
                    reset_coin = 150000};
get_eqm_by_id(43105) ->
    #guard_eqm_data{base_id = 43105, lev = 100, classes = 4,
                    type = 17, quality = 4, loss_coin = 400000,
                    reset_coin = 150000};
get_eqm_by_id(43106) ->
    #guard_eqm_data{base_id = 43106, lev = 100, classes = 4,
                    type = 18, quality = 4, loss_coin = 400000,
                    reset_coin = 150000};
get_eqm_by_id(43107) ->
    #guard_eqm_data{base_id = 43107, lev = 110, classes = 4,
                    type = 15, quality = 4, loss_coin = 500000,
                    reset_coin = 180000};
get_eqm_by_id(43108) ->
    #guard_eqm_data{base_id = 43108, lev = 110, classes = 4,
                    type = 19, quality = 4, loss_coin = 500000,
                    reset_coin = 180000};
get_eqm_by_id(43109) ->
    #guard_eqm_data{base_id = 43109, lev = 110, classes = 4,
                    type = 16, quality = 4, loss_coin = 500000,
                    reset_coin = 180000};
get_eqm_by_id(43110) ->
    #guard_eqm_data{base_id = 43110, lev = 110, classes = 4,
                    type = 20, quality = 4, loss_coin = 500000,
                    reset_coin = 180000};
get_eqm_by_id(43111) ->
    #guard_eqm_data{base_id = 43111, lev = 110, classes = 4,
                    type = 17, quality = 4, loss_coin = 500000,
                    reset_coin = 180000};
get_eqm_by_id(43112) ->
    #guard_eqm_data{base_id = 43112, lev = 110, classes = 4,
                    type = 18, quality = 4, loss_coin = 500000,
                    reset_coin = 180000};
get_eqm_by_id(44001) ->
    #guard_eqm_data{base_id = 44001, lev = 1, classes = 5,
                    type = 15, quality = 0};
get_eqm_by_id(44002) ->
    #guard_eqm_data{base_id = 44002, lev = 1, classes = 5,
                    type = 19, quality = 0};
get_eqm_by_id(44003) ->
    #guard_eqm_data{base_id = 44003, lev = 1, classes = 5,
                    type = 16, quality = 0};
get_eqm_by_id(44004) ->
    #guard_eqm_data{base_id = 44004, lev = 1, classes = 5,
                    type = 20, quality = 0};
get_eqm_by_id(44005) ->
    #guard_eqm_data{base_id = 44005, lev = 1, classes = 5,
                    type = 17, quality = 0};
get_eqm_by_id(44006) ->
    #guard_eqm_data{base_id = 44006, lev = 1, classes = 5,
                    type = 18, quality = 0};
get_eqm_by_id(44011) ->
    #guard_eqm_data{base_id = 44011, lev = 10, classes = 5,
                    type = 15, quality = 0};
get_eqm_by_id(44012) ->
    #guard_eqm_data{base_id = 44012, lev = 10, classes = 5,
                    type = 19, quality = 0};
get_eqm_by_id(44013) ->
    #guard_eqm_data{base_id = 44013, lev = 10, classes = 5,
                    type = 16, quality = 0};
get_eqm_by_id(44014) ->
    #guard_eqm_data{base_id = 44014, lev = 10, classes = 5,
                    type = 20, quality = 0};
get_eqm_by_id(44015) ->
    #guard_eqm_data{base_id = 44015, lev = 10, classes = 5,
                    type = 17, quality = 0};
get_eqm_by_id(44016) ->
    #guard_eqm_data{base_id = 44016, lev = 10, classes = 5,
                    type = 18, quality = 0};
get_eqm_by_id(44021) ->
    #guard_eqm_data{base_id = 44021, lev = 20, classes = 5,
                    type = 15, quality = 1};
get_eqm_by_id(44022) ->
    #guard_eqm_data{base_id = 44022, lev = 20, classes = 5,
                    type = 19, quality = 1};
get_eqm_by_id(44023) ->
    #guard_eqm_data{base_id = 44023, lev = 20, classes = 5,
                    type = 16, quality = 1};
get_eqm_by_id(44024) ->
    #guard_eqm_data{base_id = 44024, lev = 20, classes = 5,
                    type = 20, quality = 1};
get_eqm_by_id(44025) ->
    #guard_eqm_data{base_id = 44025, lev = 20, classes = 5,
                    type = 17, quality = 1};
get_eqm_by_id(44026) ->
    #guard_eqm_data{base_id = 44026, lev = 20, classes = 5,
                    type = 18, quality = 1};
get_eqm_by_id(44031) ->
    #guard_eqm_data{base_id = 44031, lev = 30, classes = 5,
                    type = 15, quality = 1, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(44032) ->
    #guard_eqm_data{base_id = 44032, lev = 30, classes = 5,
                    type = 19, quality = 1, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(44033) ->
    #guard_eqm_data{base_id = 44033, lev = 30, classes = 5,
                    type = 16, quality = 1, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(44034) ->
    #guard_eqm_data{base_id = 44034, lev = 30, classes = 5,
                    type = 20, quality = 1, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(44035) ->
    #guard_eqm_data{base_id = 44035, lev = 30, classes = 5,
                    type = 17, quality = 1, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(44036) ->
    #guard_eqm_data{base_id = 44036, lev = 30, classes = 5,
                    type = 18, quality = 1, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(44041) ->
    #guard_eqm_data{base_id = 44041, lev = 40, classes = 5,
                    type = 15, quality = 2, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(44042) ->
    #guard_eqm_data{base_id = 44042, lev = 40, classes = 5,
                    type = 19, quality = 2, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(44043) ->
    #guard_eqm_data{base_id = 44043, lev = 40, classes = 5,
                    type = 16, quality = 2, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(44044) ->
    #guard_eqm_data{base_id = 44044, lev = 40, classes = 5,
                    type = 20, quality = 2, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(44045) ->
    #guard_eqm_data{base_id = 44045, lev = 40, classes = 5,
                    type = 17, quality = 2, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(44046) ->
    #guard_eqm_data{base_id = 44046, lev = 40, classes = 5,
                    type = 18, quality = 2, loss_coin = 18000,
                    reset_coin = 14400};
get_eqm_by_id(44051) ->
    #guard_eqm_data{base_id = 44051, lev = 50, classes = 5,
                    type = 15, quality = 2, loss_coin = 42000,
                    reset_coin = 33600};
get_eqm_by_id(44052) ->
    #guard_eqm_data{base_id = 44052, lev = 50, classes = 5,
                    type = 19, quality = 2, loss_coin = 42000,
                    reset_coin = 33600};
get_eqm_by_id(44053) ->
    #guard_eqm_data{base_id = 44053, lev = 50, classes = 5,
                    type = 16, quality = 2, loss_coin = 42000,
                    reset_coin = 33600};
get_eqm_by_id(44054) ->
    #guard_eqm_data{base_id = 44054, lev = 50, classes = 5,
                    type = 20, quality = 2, loss_coin = 42000,
                    reset_coin = 33600};
get_eqm_by_id(44055) ->
    #guard_eqm_data{base_id = 44055, lev = 50, classes = 5,
                    type = 17, quality = 2, loss_coin = 42000,
                    reset_coin = 33600};
get_eqm_by_id(44056) ->
    #guard_eqm_data{base_id = 44056, lev = 50, classes = 5,
                    type = 18, quality = 2, loss_coin = 42000,
                    reset_coin = 33600};
get_eqm_by_id(44061) ->
    #guard_eqm_data{base_id = 44061, lev = 60, classes = 5,
                    type = 15, quality = 3, loss_coin = 108000,
                    reset_coin = 54000};
get_eqm_by_id(44062) ->
    #guard_eqm_data{base_id = 44062, lev = 60, classes = 5,
                    type = 19, quality = 3, loss_coin = 108000,
                    reset_coin = 54000};
get_eqm_by_id(44063) ->
    #guard_eqm_data{base_id = 44063, lev = 60, classes = 5,
                    type = 16, quality = 3, loss_coin = 108000,
                    reset_coin = 54000};
get_eqm_by_id(44064) ->
    #guard_eqm_data{base_id = 44064, lev = 60, classes = 5,
                    type = 20, quality = 3, loss_coin = 108000,
                    reset_coin = 54000};
get_eqm_by_id(44065) ->
    #guard_eqm_data{base_id = 44065, lev = 60, classes = 5,
                    type = 17, quality = 3, loss_coin = 108000,
                    reset_coin = 54000};
get_eqm_by_id(44066) ->
    #guard_eqm_data{base_id = 44066, lev = 60, classes = 5,
                    type = 18, quality = 3, loss_coin = 108000,
                    reset_coin = 54000};
get_eqm_by_id(44071) ->
    #guard_eqm_data{base_id = 44071, lev = 70, classes = 5,
                    type = 15, quality = 3, loss_coin = 210000,
                    reset_coin = 84000};
get_eqm_by_id(44072) ->
    #guard_eqm_data{base_id = 44072, lev = 70, classes = 5,
                    type = 19, quality = 3, loss_coin = 210000,
                    reset_coin = 84000};
get_eqm_by_id(44073) ->
    #guard_eqm_data{base_id = 44073, lev = 70, classes = 5,
                    type = 16, quality = 3, loss_coin = 210000,
                    reset_coin = 84000};
get_eqm_by_id(44074) ->
    #guard_eqm_data{base_id = 44074, lev = 70, classes = 5,
                    type = 20, quality = 3, loss_coin = 210000,
                    reset_coin = 84000};
get_eqm_by_id(44075) ->
    #guard_eqm_data{base_id = 44075, lev = 70, classes = 5,
                    type = 17, quality = 3, loss_coin = 210000,
                    reset_coin = 84000};
get_eqm_by_id(44076) ->
    #guard_eqm_data{base_id = 44076, lev = 70, classes = 5,
                    type = 18, quality = 3, loss_coin = 210000,
                    reset_coin = 84000};
get_eqm_by_id(44081) ->
    #guard_eqm_data{base_id = 44081, lev = 80, classes = 5,
                    type = 15, quality = 4, loss_coin = 240000,
                    reset_coin = 96000};
get_eqm_by_id(44082) ->
    #guard_eqm_data{base_id = 44082, lev = 80, classes = 5,
                    type = 19, quality = 4, loss_coin = 240000,
                    reset_coin = 96000};
get_eqm_by_id(44083) ->
    #guard_eqm_data{base_id = 44083, lev = 80, classes = 5,
                    type = 16, quality = 4, loss_coin = 240000,
                    reset_coin = 96000};
get_eqm_by_id(44084) ->
    #guard_eqm_data{base_id = 44084, lev = 80, classes = 5,
                    type = 20, quality = 4, loss_coin = 240000,
                    reset_coin = 96000};
get_eqm_by_id(44085) ->
    #guard_eqm_data{base_id = 44085, lev = 80, classes = 5,
                    type = 17, quality = 4, loss_coin = 240000,
                    reset_coin = 96000};
get_eqm_by_id(44086) ->
    #guard_eqm_data{base_id = 44086, lev = 80, classes = 5,
                    type = 18, quality = 4, loss_coin = 240000,
                    reset_coin = 96000};
get_eqm_by_id(44091) ->
    #guard_eqm_data{base_id = 44091, lev = 90, classes = 5,
                    type = 15, quality = 4, loss_coin = 300000,
                    reset_coin = 120000};
get_eqm_by_id(44092) ->
    #guard_eqm_data{base_id = 44092, lev = 90, classes = 5,
                    type = 19, quality = 4, loss_coin = 300000,
                    reset_coin = 120000};
get_eqm_by_id(44093) ->
    #guard_eqm_data{base_id = 44093, lev = 90, classes = 5,
                    type = 16, quality = 4, loss_coin = 300000,
                    reset_coin = 120000};
get_eqm_by_id(44094) ->
    #guard_eqm_data{base_id = 44094, lev = 90, classes = 5,
                    type = 20, quality = 4, loss_coin = 300000,
                    reset_coin = 120000};
get_eqm_by_id(44095) ->
    #guard_eqm_data{base_id = 44095, lev = 90, classes = 5,
                    type = 17, quality = 4, loss_coin = 300000,
                    reset_coin = 120000};
get_eqm_by_id(44096) ->
    #guard_eqm_data{base_id = 44096, lev = 90, classes = 5,
                    type = 18, quality = 4, loss_coin = 300000,
                    reset_coin = 120000};
get_eqm_by_id(44101) ->
    #guard_eqm_data{base_id = 44101, lev = 100, classes = 5,
                    type = 15, quality = 4, loss_coin = 400000,
                    reset_coin = 150000};
get_eqm_by_id(44102) ->
    #guard_eqm_data{base_id = 44102, lev = 100, classes = 5,
                    type = 19, quality = 4, loss_coin = 400000,
                    reset_coin = 150000};
get_eqm_by_id(44103) ->
    #guard_eqm_data{base_id = 44103, lev = 100, classes = 5,
                    type = 16, quality = 4, loss_coin = 400000,
                    reset_coin = 150000};
get_eqm_by_id(44104) ->
    #guard_eqm_data{base_id = 44104, lev = 100, classes = 5,
                    type = 20, quality = 4, loss_coin = 400000,
                    reset_coin = 150000};
get_eqm_by_id(44105) ->
    #guard_eqm_data{base_id = 44105, lev = 100, classes = 5,
                    type = 17, quality = 4, loss_coin = 400000,
                    reset_coin = 150000};
get_eqm_by_id(44106) ->
    #guard_eqm_data{base_id = 44106, lev = 100, classes = 5,
                    type = 18, quality = 4, loss_coin = 400000,
                    reset_coin = 150000};
get_eqm_by_id(44107) ->
    #guard_eqm_data{base_id = 44107, lev = 110, classes = 5,
                    type = 15, quality = 4, loss_coin = 500000,
                    reset_coin = 180000};
get_eqm_by_id(44108) ->
    #guard_eqm_data{base_id = 44108, lev = 110, classes = 5,
                    type = 19, quality = 4, loss_coin = 500000,
                    reset_coin = 180000};
get_eqm_by_id(44109) ->
    #guard_eqm_data{base_id = 44109, lev = 110, classes = 5,
                    type = 16, quality = 4, loss_coin = 500000,
                    reset_coin = 180000};
get_eqm_by_id(44110) ->
    #guard_eqm_data{base_id = 44110, lev = 110, classes = 5,
                    type = 20, quality = 4, loss_coin = 500000,
                    reset_coin = 180000};
get_eqm_by_id(44111) ->
    #guard_eqm_data{base_id = 44111, lev = 110, classes = 5,
                    type = 17, quality = 4, loss_coin = 500000,
                    reset_coin = 180000};
get_eqm_by_id(44112) ->
    #guard_eqm_data{base_id = 44112, lev = 110, classes = 5,
                    type = 18, quality = 4, loss_coin = 500000,
                    reset_coin = 180000};
get_eqm_by_id(_) -> false.

get_eqm_by_lev({1, 15, 1}) -> 40001;
get_eqm_by_lev({1, 19, 1}) -> 40002;
get_eqm_by_lev({1, 16, 1}) -> 40003;
get_eqm_by_lev({1, 20, 1}) -> 40004;
get_eqm_by_lev({1, 17, 1}) -> 40005;
get_eqm_by_lev({1, 18, 1}) -> 40006;
get_eqm_by_lev({1, 15, 10}) -> 40011;
get_eqm_by_lev({1, 19, 10}) -> 40012;
get_eqm_by_lev({1, 16, 10}) -> 40013;
get_eqm_by_lev({1, 20, 10}) -> 40014;
get_eqm_by_lev({1, 17, 10}) -> 40015;
get_eqm_by_lev({1, 18, 10}) -> 40016;
get_eqm_by_lev({1, 15, 20}) -> 40021;
get_eqm_by_lev({1, 19, 20}) -> 40022;
get_eqm_by_lev({1, 16, 20}) -> 40023;
get_eqm_by_lev({1, 20, 20}) -> 40024;
get_eqm_by_lev({1, 17, 20}) -> 40025;
get_eqm_by_lev({1, 18, 20}) -> 40026;
get_eqm_by_lev({1, 15, 30}) -> 40031;
get_eqm_by_lev({1, 19, 30}) -> 40032;
get_eqm_by_lev({1, 16, 30}) -> 40033;
get_eqm_by_lev({1, 20, 30}) -> 40034;
get_eqm_by_lev({1, 17, 30}) -> 40035;
get_eqm_by_lev({1, 18, 30}) -> 40036;
get_eqm_by_lev({1, 15, 40}) -> 40041;
get_eqm_by_lev({1, 19, 40}) -> 40042;
get_eqm_by_lev({1, 16, 40}) -> 40043;
get_eqm_by_lev({1, 20, 40}) -> 40044;
get_eqm_by_lev({1, 17, 40}) -> 40045;
get_eqm_by_lev({1, 18, 40}) -> 40046;
get_eqm_by_lev({1, 15, 50}) -> 40051;
get_eqm_by_lev({1, 19, 50}) -> 40052;
get_eqm_by_lev({1, 16, 50}) -> 40053;
get_eqm_by_lev({1, 20, 50}) -> 40054;
get_eqm_by_lev({1, 17, 50}) -> 40055;
get_eqm_by_lev({1, 18, 50}) -> 40056;
get_eqm_by_lev({1, 15, 60}) -> 40061;
get_eqm_by_lev({1, 19, 60}) -> 40062;
get_eqm_by_lev({1, 16, 60}) -> 40063;
get_eqm_by_lev({1, 20, 60}) -> 40064;
get_eqm_by_lev({1, 17, 60}) -> 40065;
get_eqm_by_lev({1, 18, 60}) -> 40066;
get_eqm_by_lev({1, 15, 70}) -> 40071;
get_eqm_by_lev({1, 19, 70}) -> 40072;
get_eqm_by_lev({1, 16, 70}) -> 40073;
get_eqm_by_lev({1, 20, 70}) -> 40074;
get_eqm_by_lev({1, 17, 70}) -> 40075;
get_eqm_by_lev({1, 18, 70}) -> 40076;
get_eqm_by_lev({1, 15, 80}) -> 40081;
get_eqm_by_lev({1, 19, 80}) -> 40082;
get_eqm_by_lev({1, 16, 80}) -> 40083;
get_eqm_by_lev({1, 20, 80}) -> 40084;
get_eqm_by_lev({1, 17, 80}) -> 40085;
get_eqm_by_lev({1, 18, 80}) -> 40086;
get_eqm_by_lev({1, 15, 90}) -> 40091;
get_eqm_by_lev({1, 19, 90}) -> 40092;
get_eqm_by_lev({1, 16, 90}) -> 40093;
get_eqm_by_lev({1, 20, 90}) -> 40094;
get_eqm_by_lev({1, 17, 90}) -> 40095;
get_eqm_by_lev({1, 18, 90}) -> 40096;
get_eqm_by_lev({1, 15, 100}) -> 40101;
get_eqm_by_lev({1, 19, 100}) -> 40102;
get_eqm_by_lev({1, 16, 100}) -> 40103;
get_eqm_by_lev({1, 20, 100}) -> 40104;
get_eqm_by_lev({1, 17, 100}) -> 40105;
get_eqm_by_lev({1, 18, 100}) -> 40106;
get_eqm_by_lev({1, 15, 110}) -> 40107;
get_eqm_by_lev({1, 19, 110}) -> 40108;
get_eqm_by_lev({1, 16, 110}) -> 40109;
get_eqm_by_lev({1, 20, 110}) -> 40110;
get_eqm_by_lev({1, 17, 110}) -> 40111;
get_eqm_by_lev({1, 18, 110}) -> 40112;
get_eqm_by_lev({2, 15, 1}) -> 41001;
get_eqm_by_lev({2, 19, 1}) -> 41002;
get_eqm_by_lev({2, 16, 1}) -> 41003;
get_eqm_by_lev({2, 20, 1}) -> 41004;
get_eqm_by_lev({2, 17, 1}) -> 41005;
get_eqm_by_lev({2, 18, 1}) -> 41006;
get_eqm_by_lev({2, 15, 10}) -> 41011;
get_eqm_by_lev({2, 19, 10}) -> 41012;
get_eqm_by_lev({2, 16, 10}) -> 41013;
get_eqm_by_lev({2, 20, 10}) -> 41014;
get_eqm_by_lev({2, 17, 10}) -> 41015;
get_eqm_by_lev({2, 18, 10}) -> 41016;
get_eqm_by_lev({2, 15, 20}) -> 41021;
get_eqm_by_lev({2, 19, 20}) -> 41022;
get_eqm_by_lev({2, 16, 20}) -> 41023;
get_eqm_by_lev({2, 20, 20}) -> 41024;
get_eqm_by_lev({2, 17, 20}) -> 41025;
get_eqm_by_lev({2, 18, 20}) -> 41026;
get_eqm_by_lev({2, 15, 30}) -> 41031;
get_eqm_by_lev({2, 19, 30}) -> 41032;
get_eqm_by_lev({2, 16, 30}) -> 41033;
get_eqm_by_lev({2, 20, 30}) -> 41034;
get_eqm_by_lev({2, 17, 30}) -> 41035;
get_eqm_by_lev({2, 18, 30}) -> 41036;
get_eqm_by_lev({2, 15, 40}) -> 41041;
get_eqm_by_lev({2, 19, 40}) -> 41042;
get_eqm_by_lev({2, 16, 40}) -> 41043;
get_eqm_by_lev({2, 20, 40}) -> 41044;
get_eqm_by_lev({2, 17, 40}) -> 41045;
get_eqm_by_lev({2, 18, 40}) -> 41046;
get_eqm_by_lev({2, 15, 50}) -> 41051;
get_eqm_by_lev({2, 19, 50}) -> 41052;
get_eqm_by_lev({2, 16, 50}) -> 41053;
get_eqm_by_lev({2, 20, 50}) -> 41054;
get_eqm_by_lev({2, 17, 50}) -> 41055;
get_eqm_by_lev({2, 18, 50}) -> 41056;
get_eqm_by_lev({2, 15, 60}) -> 41061;
get_eqm_by_lev({2, 19, 60}) -> 41062;
get_eqm_by_lev({2, 16, 60}) -> 41063;
get_eqm_by_lev({2, 20, 60}) -> 41064;
get_eqm_by_lev({2, 17, 60}) -> 41065;
get_eqm_by_lev({2, 18, 60}) -> 41066;
get_eqm_by_lev({2, 15, 70}) -> 41071;
get_eqm_by_lev({2, 19, 70}) -> 41072;
get_eqm_by_lev({2, 16, 70}) -> 41073;
get_eqm_by_lev({2, 20, 70}) -> 41074;
get_eqm_by_lev({2, 17, 70}) -> 41075;
get_eqm_by_lev({2, 18, 70}) -> 41076;
get_eqm_by_lev({2, 15, 80}) -> 41081;
get_eqm_by_lev({2, 19, 80}) -> 41082;
get_eqm_by_lev({2, 16, 80}) -> 41083;
get_eqm_by_lev({2, 20, 80}) -> 41084;
get_eqm_by_lev({2, 17, 80}) -> 41085;
get_eqm_by_lev({2, 18, 80}) -> 41086;
get_eqm_by_lev({2, 15, 90}) -> 41091;
get_eqm_by_lev({2, 19, 90}) -> 41092;
get_eqm_by_lev({2, 16, 90}) -> 41093;
get_eqm_by_lev({2, 20, 90}) -> 41094;
get_eqm_by_lev({2, 17, 90}) -> 41095;
get_eqm_by_lev({2, 18, 90}) -> 41096;
get_eqm_by_lev({2, 15, 100}) -> 41101;
get_eqm_by_lev({2, 19, 100}) -> 41102;
get_eqm_by_lev({2, 16, 100}) -> 41103;
get_eqm_by_lev({2, 20, 100}) -> 41104;
get_eqm_by_lev({2, 17, 100}) -> 41105;
get_eqm_by_lev({2, 18, 100}) -> 41106;
get_eqm_by_lev({2, 15, 110}) -> 41107;
get_eqm_by_lev({2, 19, 110}) -> 41108;
get_eqm_by_lev({2, 16, 110}) -> 41109;
get_eqm_by_lev({2, 20, 110}) -> 41110;
get_eqm_by_lev({2, 17, 110}) -> 41111;
get_eqm_by_lev({2, 18, 110}) -> 41112;
get_eqm_by_lev({3, 15, 1}) -> 42001;
get_eqm_by_lev({3, 19, 1}) -> 42002;
get_eqm_by_lev({3, 16, 1}) -> 42003;
get_eqm_by_lev({3, 20, 1}) -> 42004;
get_eqm_by_lev({3, 17, 1}) -> 42005;
get_eqm_by_lev({3, 18, 1}) -> 42006;
get_eqm_by_lev({3, 15, 10}) -> 42011;
get_eqm_by_lev({3, 19, 10}) -> 42012;
get_eqm_by_lev({3, 16, 10}) -> 42013;
get_eqm_by_lev({3, 20, 10}) -> 42014;
get_eqm_by_lev({3, 17, 10}) -> 42015;
get_eqm_by_lev({3, 18, 10}) -> 42016;
get_eqm_by_lev({3, 15, 20}) -> 42021;
get_eqm_by_lev({3, 19, 20}) -> 42022;
get_eqm_by_lev({3, 16, 20}) -> 42023;
get_eqm_by_lev({3, 20, 20}) -> 42024;
get_eqm_by_lev({3, 17, 20}) -> 42025;
get_eqm_by_lev({3, 18, 20}) -> 42026;
get_eqm_by_lev({3, 15, 30}) -> 42031;
get_eqm_by_lev({3, 19, 30}) -> 42032;
get_eqm_by_lev({3, 16, 30}) -> 42033;
get_eqm_by_lev({3, 20, 30}) -> 42034;
get_eqm_by_lev({3, 17, 30}) -> 42035;
get_eqm_by_lev({3, 18, 30}) -> 42036;
get_eqm_by_lev({3, 15, 40}) -> 42041;
get_eqm_by_lev({3, 19, 40}) -> 42042;
get_eqm_by_lev({3, 16, 40}) -> 42043;
get_eqm_by_lev({3, 20, 40}) -> 42044;
get_eqm_by_lev({3, 17, 40}) -> 42045;
get_eqm_by_lev({3, 18, 40}) -> 42046;
get_eqm_by_lev({3, 15, 50}) -> 42051;
get_eqm_by_lev({3, 19, 50}) -> 42052;
get_eqm_by_lev({3, 16, 50}) -> 42053;
get_eqm_by_lev({3, 20, 50}) -> 42054;
get_eqm_by_lev({3, 17, 50}) -> 42055;
get_eqm_by_lev({3, 18, 50}) -> 42056;
get_eqm_by_lev({3, 15, 60}) -> 42061;
get_eqm_by_lev({3, 19, 60}) -> 42062;
get_eqm_by_lev({3, 16, 60}) -> 42063;
get_eqm_by_lev({3, 20, 60}) -> 42064;
get_eqm_by_lev({3, 17, 60}) -> 42065;
get_eqm_by_lev({3, 18, 60}) -> 42066;
get_eqm_by_lev({3, 15, 70}) -> 42071;
get_eqm_by_lev({3, 19, 70}) -> 42072;
get_eqm_by_lev({3, 16, 70}) -> 42073;
get_eqm_by_lev({3, 20, 70}) -> 42074;
get_eqm_by_lev({3, 17, 70}) -> 42075;
get_eqm_by_lev({3, 18, 70}) -> 42076;
get_eqm_by_lev({3, 15, 80}) -> 42081;
get_eqm_by_lev({3, 19, 80}) -> 42082;
get_eqm_by_lev({3, 16, 80}) -> 42083;
get_eqm_by_lev({3, 20, 80}) -> 42084;
get_eqm_by_lev({3, 17, 80}) -> 42085;
get_eqm_by_lev({3, 18, 80}) -> 42086;
get_eqm_by_lev({3, 15, 90}) -> 42091;
get_eqm_by_lev({3, 19, 90}) -> 42092;
get_eqm_by_lev({3, 16, 90}) -> 42093;
get_eqm_by_lev({3, 20, 90}) -> 42094;
get_eqm_by_lev({3, 17, 90}) -> 42095;
get_eqm_by_lev({3, 18, 90}) -> 42096;
get_eqm_by_lev({3, 15, 100}) -> 42101;
get_eqm_by_lev({3, 19, 100}) -> 42102;
get_eqm_by_lev({3, 16, 100}) -> 42103;
get_eqm_by_lev({3, 20, 100}) -> 42104;
get_eqm_by_lev({3, 17, 100}) -> 42105;
get_eqm_by_lev({3, 18, 100}) -> 42106;
get_eqm_by_lev({3, 15, 110}) -> 42107;
get_eqm_by_lev({3, 19, 110}) -> 42108;
get_eqm_by_lev({3, 16, 110}) -> 42109;
get_eqm_by_lev({3, 20, 110}) -> 42110;
get_eqm_by_lev({3, 17, 110}) -> 42111;
get_eqm_by_lev({3, 18, 110}) -> 42112;
get_eqm_by_lev({4, 15, 1}) -> 43001;
get_eqm_by_lev({4, 19, 1}) -> 43002;
get_eqm_by_lev({4, 16, 1}) -> 43003;
get_eqm_by_lev({4, 20, 1}) -> 43004;
get_eqm_by_lev({4, 17, 1}) -> 43005;
get_eqm_by_lev({4, 18, 1}) -> 43006;
get_eqm_by_lev({4, 15, 10}) -> 43011;
get_eqm_by_lev({4, 19, 10}) -> 43012;
get_eqm_by_lev({4, 16, 10}) -> 43013;
get_eqm_by_lev({4, 20, 10}) -> 43014;
get_eqm_by_lev({4, 17, 10}) -> 43015;
get_eqm_by_lev({4, 18, 10}) -> 43016;
get_eqm_by_lev({4, 15, 20}) -> 43021;
get_eqm_by_lev({4, 19, 20}) -> 43022;
get_eqm_by_lev({4, 16, 20}) -> 43023;
get_eqm_by_lev({4, 20, 20}) -> 43024;
get_eqm_by_lev({4, 17, 20}) -> 43025;
get_eqm_by_lev({4, 18, 20}) -> 43026;
get_eqm_by_lev({4, 15, 30}) -> 43031;
get_eqm_by_lev({4, 19, 30}) -> 43032;
get_eqm_by_lev({4, 16, 30}) -> 43033;
get_eqm_by_lev({4, 20, 30}) -> 43034;
get_eqm_by_lev({4, 17, 30}) -> 43035;
get_eqm_by_lev({4, 18, 30}) -> 43036;
get_eqm_by_lev({4, 15, 40}) -> 43041;
get_eqm_by_lev({4, 19, 40}) -> 43042;
get_eqm_by_lev({4, 16, 40}) -> 43043;
get_eqm_by_lev({4, 20, 40}) -> 43044;
get_eqm_by_lev({4, 17, 40}) -> 43045;
get_eqm_by_lev({4, 18, 40}) -> 43046;
get_eqm_by_lev({4, 15, 50}) -> 43051;
get_eqm_by_lev({4, 19, 50}) -> 43052;
get_eqm_by_lev({4, 16, 50}) -> 43053;
get_eqm_by_lev({4, 20, 50}) -> 43054;
get_eqm_by_lev({4, 17, 50}) -> 43055;
get_eqm_by_lev({4, 18, 50}) -> 43056;
get_eqm_by_lev({4, 15, 60}) -> 43061;
get_eqm_by_lev({4, 19, 60}) -> 43062;
get_eqm_by_lev({4, 16, 60}) -> 43063;
get_eqm_by_lev({4, 20, 60}) -> 43064;
get_eqm_by_lev({4, 17, 60}) -> 43065;
get_eqm_by_lev({4, 18, 60}) -> 43066;
get_eqm_by_lev({4, 15, 70}) -> 43071;
get_eqm_by_lev({4, 19, 70}) -> 43072;
get_eqm_by_lev({4, 16, 70}) -> 43073;
get_eqm_by_lev({4, 20, 70}) -> 43074;
get_eqm_by_lev({4, 17, 70}) -> 43075;
get_eqm_by_lev({4, 18, 70}) -> 43076;
get_eqm_by_lev({4, 15, 80}) -> 43081;
get_eqm_by_lev({4, 19, 80}) -> 43082;
get_eqm_by_lev({4, 16, 80}) -> 43083;
get_eqm_by_lev({4, 20, 80}) -> 43084;
get_eqm_by_lev({4, 17, 80}) -> 43085;
get_eqm_by_lev({4, 18, 80}) -> 43086;
get_eqm_by_lev({4, 15, 90}) -> 43091;
get_eqm_by_lev({4, 19, 90}) -> 43092;
get_eqm_by_lev({4, 16, 90}) -> 43093;
get_eqm_by_lev({4, 20, 90}) -> 43094;
get_eqm_by_lev({4, 17, 90}) -> 43095;
get_eqm_by_lev({4, 18, 90}) -> 43096;
get_eqm_by_lev({4, 15, 100}) -> 43101;
get_eqm_by_lev({4, 19, 100}) -> 43102;
get_eqm_by_lev({4, 16, 100}) -> 43103;
get_eqm_by_lev({4, 20, 100}) -> 43104;
get_eqm_by_lev({4, 17, 100}) -> 43105;
get_eqm_by_lev({4, 18, 100}) -> 43106;
get_eqm_by_lev({4, 15, 110}) -> 43107;
get_eqm_by_lev({4, 19, 110}) -> 43108;
get_eqm_by_lev({4, 16, 110}) -> 43109;
get_eqm_by_lev({4, 20, 110}) -> 43110;
get_eqm_by_lev({4, 17, 110}) -> 43111;
get_eqm_by_lev({4, 18, 110}) -> 43112;
get_eqm_by_lev({5, 15, 1}) -> 44001;
get_eqm_by_lev({5, 19, 1}) -> 44002;
get_eqm_by_lev({5, 16, 1}) -> 44003;
get_eqm_by_lev({5, 20, 1}) -> 44004;
get_eqm_by_lev({5, 17, 1}) -> 44005;
get_eqm_by_lev({5, 18, 1}) -> 44006;
get_eqm_by_lev({5, 15, 10}) -> 44011;
get_eqm_by_lev({5, 19, 10}) -> 44012;
get_eqm_by_lev({5, 16, 10}) -> 44013;
get_eqm_by_lev({5, 20, 10}) -> 44014;
get_eqm_by_lev({5, 17, 10}) -> 44015;
get_eqm_by_lev({5, 18, 10}) -> 44016;
get_eqm_by_lev({5, 15, 20}) -> 44021;
get_eqm_by_lev({5, 19, 20}) -> 44022;
get_eqm_by_lev({5, 16, 20}) -> 44023;
get_eqm_by_lev({5, 20, 20}) -> 44024;
get_eqm_by_lev({5, 17, 20}) -> 44025;
get_eqm_by_lev({5, 18, 20}) -> 44026;
get_eqm_by_lev({5, 15, 30}) -> 44031;
get_eqm_by_lev({5, 19, 30}) -> 44032;
get_eqm_by_lev({5, 16, 30}) -> 44033;
get_eqm_by_lev({5, 20, 30}) -> 44034;
get_eqm_by_lev({5, 17, 30}) -> 44035;
get_eqm_by_lev({5, 18, 30}) -> 44036;
get_eqm_by_lev({5, 15, 40}) -> 44041;
get_eqm_by_lev({5, 19, 40}) -> 44042;
get_eqm_by_lev({5, 16, 40}) -> 44043;
get_eqm_by_lev({5, 20, 40}) -> 44044;
get_eqm_by_lev({5, 17, 40}) -> 44045;
get_eqm_by_lev({5, 18, 40}) -> 44046;
get_eqm_by_lev({5, 15, 50}) -> 44051;
get_eqm_by_lev({5, 19, 50}) -> 44052;
get_eqm_by_lev({5, 16, 50}) -> 44053;
get_eqm_by_lev({5, 20, 50}) -> 44054;
get_eqm_by_lev({5, 17, 50}) -> 44055;
get_eqm_by_lev({5, 18, 50}) -> 44056;
get_eqm_by_lev({5, 15, 60}) -> 44061;
get_eqm_by_lev({5, 19, 60}) -> 44062;
get_eqm_by_lev({5, 16, 60}) -> 44063;
get_eqm_by_lev({5, 20, 60}) -> 44064;
get_eqm_by_lev({5, 17, 60}) -> 44065;
get_eqm_by_lev({5, 18, 60}) -> 44066;
get_eqm_by_lev({5, 15, 70}) -> 44071;
get_eqm_by_lev({5, 19, 70}) -> 44072;
get_eqm_by_lev({5, 16, 70}) -> 44073;
get_eqm_by_lev({5, 20, 70}) -> 44074;
get_eqm_by_lev({5, 17, 70}) -> 44075;
get_eqm_by_lev({5, 18, 70}) -> 44076;
get_eqm_by_lev({5, 15, 80}) -> 44081;
get_eqm_by_lev({5, 19, 80}) -> 44082;
get_eqm_by_lev({5, 16, 80}) -> 44083;
get_eqm_by_lev({5, 20, 80}) -> 44084;
get_eqm_by_lev({5, 17, 80}) -> 44085;
get_eqm_by_lev({5, 18, 80}) -> 44086;
get_eqm_by_lev({5, 15, 90}) -> 44091;
get_eqm_by_lev({5, 19, 90}) -> 44092;
get_eqm_by_lev({5, 16, 90}) -> 44093;
get_eqm_by_lev({5, 20, 90}) -> 44094;
get_eqm_by_lev({5, 17, 90}) -> 44095;
get_eqm_by_lev({5, 18, 90}) -> 44096;
get_eqm_by_lev({5, 15, 100}) -> 44101;
get_eqm_by_lev({5, 19, 100}) -> 44102;
get_eqm_by_lev({5, 16, 100}) -> 44103;
get_eqm_by_lev({5, 20, 100}) -> 44104;
get_eqm_by_lev({5, 17, 100}) -> 44105;
get_eqm_by_lev({5, 18, 100}) -> 44106;
get_eqm_by_lev({5, 15, 110}) -> 44107;
get_eqm_by_lev({5, 19, 110}) -> 44108;
get_eqm_by_lev({5, 16, 110}) -> 44109;
get_eqm_by_lev({5, 20, 110}) -> 44110;
get_eqm_by_lev({5, 17, 110}) -> 44111;
get_eqm_by_lev({5, 18, 110}) -> 44112;
get_eqm_by_lev(_) -> false.

get_base_attr(15, 1) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 42},
     #attr_base{type = 0, calc_type = 1, name = 5, val = 15},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 40}];
get_base_attr(15, 10) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 125},
     #attr_base{type = 0, calc_type = 1, name = 5, val = 45},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 119}];
get_base_attr(15, 20) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 292},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 105},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 276}];
get_base_attr(15, 30) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 459},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 165},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 433}];
get_base_attr(15, 40) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 625},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 225},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 591}];
get_base_attr(15, 50) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 792},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 285},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 748}];
get_base_attr(15, 60) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 959},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 345},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 906}];
get_base_attr(15, 70) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1125},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 405},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1063}];
get_base_attr(15, 80) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1292},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 465},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1221}];
get_base_attr(15, 90) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1459},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 525},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1378}];
get_base_attr(15, 100) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1584},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 570},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1496}];
get_base_attr(15, 110) ->
    [#attr_base{type = 0, calc_type = 1, name = 4,
                val = 1708},
     #attr_base{type = 0, calc_type = 1, name = 5,
                val = 616},
     #attr_base{type = 0, calc_type = 1, name = 43,
                val = 1613}];
get_base_attr(19, 1) ->
    [#attr_base{type = 0, calc_type = 1, name = 5,
                val = 28},
     #attr_base{type = 0, calc_type = 1, name = 7, val = 5}];
get_base_attr(19, 10) ->
    [#attr_base{type = 0, calc_type = 1, name = 5,
                val = 84},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 15}];
get_base_attr(19, 20) ->
    [#attr_base{type = 0, calc_type = 1, name = 5,
                val = 195},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 35}];
get_base_attr(19, 30) ->
    [#attr_base{type = 0, calc_type = 1, name = 5,
                val = 307},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 55}];
get_base_attr(19, 40) ->
    [#attr_base{type = 0, calc_type = 1, name = 5,
                val = 418},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 75}];
get_base_attr(19, 50) ->
    [#attr_base{type = 0, calc_type = 1, name = 5,
                val = 530},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 95}];
get_base_attr(19, 60) ->
    [#attr_base{type = 0, calc_type = 1, name = 5,
                val = 641},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 114}];
get_base_attr(19, 70) ->
    [#attr_base{type = 0, calc_type = 1, name = 5,
                val = 753},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 134}];
get_base_attr(19, 80) ->
    [#attr_base{type = 0, calc_type = 1, name = 5,
                val = 864},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 154}];
get_base_attr(19, 90) ->
    [#attr_base{type = 0, calc_type = 1, name = 5,
                val = 975},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 174}];
get_base_attr(19, 100) ->
    [#attr_base{type = 0, calc_type = 1, name = 5,
                val = 1059},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 189}];
get_base_attr(19, 110) ->
    [#attr_base{type = 0, calc_type = 1, name = 5,
                val = 1130},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 204}];
get_base_attr(16, 1) ->
    [#attr_base{type = 0, calc_type = 1, name = 6,
                val = 14}];
get_base_attr(16, 10) ->
    [#attr_base{type = 0, calc_type = 1, name = 6,
                val = 41}];
get_base_attr(16, 20) ->
    [#attr_base{type = 0, calc_type = 1, name = 6,
                val = 95}];
get_base_attr(16, 30) ->
    [#attr_base{type = 0, calc_type = 1, name = 6,
                val = 149}];
get_base_attr(16, 40) ->
    [#attr_base{type = 0, calc_type = 1, name = 6,
                val = 204}];
get_base_attr(16, 50) ->
    [#attr_base{type = 0, calc_type = 1, name = 6,
                val = 258}];
get_base_attr(16, 60) ->
    [#attr_base{type = 0, calc_type = 1, name = 6,
                val = 312}];
get_base_attr(16, 70) ->
    [#attr_base{type = 0, calc_type = 1, name = 6,
                val = 366}];
get_base_attr(16, 80) ->
    [#attr_base{type = 0, calc_type = 1, name = 6,
                val = 420}];
get_base_attr(16, 90) ->
    [#attr_base{type = 0, calc_type = 1, name = 6,
                val = 474}];
get_base_attr(16, 100) ->
    [#attr_base{type = 0, calc_type = 1, name = 6,
                val = 515}];
get_base_attr(16, 110) ->
    [#attr_base{type = 0, calc_type = 1, name = 6,
                val = 555}];
get_base_attr(20, 1) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 59},
     #attr_base{type = 0, calc_type = 1, name = 6, val = 2}];
get_base_attr(20, 10) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 177},
     #attr_base{type = 0, calc_type = 1, name = 6, val = 6}];
get_base_attr(20, 20) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 412},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 14}];
get_base_attr(20, 30) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 647},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 22}];
get_base_attr(20, 40) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 882},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 30}];
get_base_attr(20, 50) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 1118},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 37}];
get_base_attr(20, 60) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 1353},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 45}];
get_base_attr(20, 70) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 1588},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 53}];
get_base_attr(20, 80) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 1823},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 60}];
get_base_attr(20, 90) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 2058},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 68}];
get_base_attr(20, 100) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 2235},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 74}];
get_base_attr(20, 110) ->
    [#attr_base{type = 0, calc_type = 1, name = 1,
                val = 2351},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 79}];
get_base_attr(17, 1) ->
    [#attr_base{type = 0, calc_type = 1, name = 2,
                val = 234},
     #attr_base{type = 0, calc_type = 1, name = 7, val = 8}];
get_base_attr(17, 10) ->
    [#attr_base{type = 0, calc_type = 1, name = 2,
                val = 312},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 23}];
get_base_attr(17, 20) ->
    [#attr_base{type = 0, calc_type = 1, name = 2,
                val = 390},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 52}];
get_base_attr(17, 30) ->
    [#attr_base{type = 0, calc_type = 1, name = 2,
                val = 468},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 82}];
get_base_attr(17, 40) ->
    [#attr_base{type = 0, calc_type = 1, name = 2,
                val = 546},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 112}];
get_base_attr(17, 50) ->
    [#attr_base{type = 0, calc_type = 1, name = 2,
                val = 624},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 142}];
get_base_attr(17, 60) ->
    [#attr_base{type = 0, calc_type = 1, name = 2,
                val = 702},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 171}];
get_base_attr(17, 70) ->
    [#attr_base{type = 0, calc_type = 1, name = 2,
                val = 780},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 201}];
get_base_attr(17, 80) ->
    [#attr_base{type = 0, calc_type = 1, name = 2,
                val = 858},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 231}];
get_base_attr(17, 90) ->
    [#attr_base{type = 0, calc_type = 1, name = 2,
                val = 936},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 260}];
get_base_attr(17, 100) ->
    [#attr_base{type = 0, calc_type = 1, name = 2,
                val = 1014},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 283}];
get_base_attr(17, 110) ->
    [#attr_base{type = 0, calc_type = 1, name = 2,
                val = 1092},
     #attr_base{type = 0, calc_type = 1, name = 7,
                val = 305}];
get_base_attr(18, 1) ->
    [#attr_base{type = 0, calc_type = 1, name = 3,
                val = 12},
     #attr_base{type = 0, calc_type = 1, name = 6, val = 4}];
get_base_attr(18, 10) ->
    [#attr_base{type = 0, calc_type = 1, name = 3,
                val = 29},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 12}];
get_base_attr(18, 20) ->
    [#attr_base{type = 0, calc_type = 1, name = 3,
                val = 45},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 28}];
get_base_attr(18, 30) ->
    [#attr_base{type = 0, calc_type = 1, name = 3,
                val = 62},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 43}];
get_base_attr(18, 40) ->
    [#attr_base{type = 0, calc_type = 1, name = 3,
                val = 78},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 59}];
get_base_attr(18, 50) ->
    [#attr_base{type = 0, calc_type = 1, name = 3,
                val = 95},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 74}];
get_base_attr(18, 60) ->
    [#attr_base{type = 0, calc_type = 1, name = 3,
                val = 111},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 89}];
get_base_attr(18, 70) ->
    [#attr_base{type = 0, calc_type = 1, name = 3,
                val = 128},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 105}];
get_base_attr(18, 80) ->
    [#attr_base{type = 0, calc_type = 1, name = 3,
                val = 144},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 120}];
get_base_attr(18, 90) ->
    [#attr_base{type = 0, calc_type = 1, name = 3,
                val = 157},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 136}];
get_base_attr(18, 100) ->
    [#attr_base{type = 0, calc_type = 1, name = 3,
                val = 177},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 148}];
get_base_attr(18, 110) ->
    [#attr_base{type = 0, calc_type = 1, name = 3,
                val = 191},
     #attr_base{type = 0, calc_type = 1, name = 6,
                val = 159}];
get_base_attr(_, _) -> [].

get_base_ratio() ->
    [{1, 1, 800, 10},
     {1, 2, 830, 50},
     {1, 3, 860, 100},
     {1, 4, 890, 150},
     {1, 5, 920, 150},
     {1, 6, 940, 150},
     {1, 7, 950, 80},
     {1, 8, 960, 70},
     {1, 9, 980, 70},
     {1, 10, 1000, 70},
     {1, 11, 1010, 20},
     {1, 12, 1020, 20},
     {1, 13, 1030, 20},
     {1, 14, 1040, 20},
     {1, 15, 1050, 20},
     {2, 1, 650, 100},
     {2, 2, 700, 100},
     {2, 3, 740, 200},
     {2, 4, 780, 100},
     {2, 5, 820, 100},
     {2, 6, 860, 100},
     {2, 7, 890, 50},
     {2, 8, 920, 50},
     {2, 9, 960, 50},
     {2, 10, 1000, 50},
     {2, 11, 1010, 20},
     {2, 12, 1020, 20},
     {2, 13, 1030, 20},
     {2, 14, 1040, 20},
     {2, 15, 1050, 20},
     {3, 1, 800, 100},
     {3, 2, 830, 100},
     {3, 3, 860, 200},
     {3, 4, 890, 100},
     {3, 5, 920, 100},
     {3, 6, 940, 100},
     {3, 7, 950, 50},
     {3, 8, 960, 50},
     {3, 9, 980, 50},
     {3, 10, 1000, 50},
     {3, 11, 1010, 20},
     {3, 12, 1020, 20},
     {3, 13, 1030, 20},
     {3, 14, 1040, 20},
     {3, 15, 1050, 20},
     {4, 1, 800, 10},
     {4, 2, 830, 50},
     {4, 3, 860, 100},
     {4, 4, 890, 150},
     {4, 5, 920, 150},
     {4, 6, 940, 150},
     {4, 7, 950, 80},
     {4, 8, 960, 70},
     {4, 9, 980, 70},
     {4, 10, 1000, 70},
     {4, 11, 1010, 20},
     {4, 12, 1020, 20},
     {4, 13, 1030, 20},
     {4, 14, 1040, 20},
     {4, 15, 1050, 20},
     {5, 1, 800, 10},
     {5, 2, 830, 50},
     {5, 3, 860, 100},
     {5, 4, 890, 150},
     {5, 5, 920, 150},
     {5, 6, 940, 150},
     {5, 7, 950, 80},
     {5, 8, 960, 70},
     {5, 9, 980, 70},
     {5, 10, 1000, 70},
     {5, 11, 1010, 20},
     {5, 12, 1020, 20},
     {5, 13, 1030, 20},
     {5, 14, 1040, 20},
     {5, 15, 1050, 20},
     {6, 1, 800, 10},
     {6, 2, 830, 50},
     {6, 3, 860, 100},
     {6, 4, 890, 150},
     {6, 5, 920, 150},
     {6, 6, 940, 150},
     {6, 7, 950, 80},
     {6, 8, 960, 70},
     {6, 9, 980, 70},
     {6, 10, 1000, 70},
     {6, 11, 1010, 20},
     {6, 12, 1020, 20},
     {6, 13, 1030, 20},
     {6, 14, 1040, 20},
     {6, 15, 1050, 20},
     {7, 1, 800, 10},
     {7, 2, 830, 50},
     {7, 3, 860, 100},
     {7, 4, 890, 150},
     {7, 5, 920, 150},
     {7, 6, 940, 150},
     {7, 7, 950, 80},
     {7, 8, 960, 70},
     {7, 9, 980, 70},
     {7, 10, 1000, 70},
     {7, 11, 1010, 20},
     {7, 12, 1020, 20},
     {7, 13, 1030, 20},
     {7, 14, 1040, 20},
     {7, 15, 1050, 20},
     {25, 1, 650, 100},
     {25, 2, 700, 100},
     {25, 3, 740, 200},
     {25, 4, 780, 100},
     {25, 5, 820, 100},
     {25, 6, 860, 100},
     {25, 7, 890, 50},
     {25, 8, 920, 50},
     {25, 9, 960, 50},
     {25, 10, 1000, 50},
     {25, 11, 1010, 20},
     {25, 12, 1020, 20},
     {25, 13, 1030, 20},
     {25, 14, 1040, 20},
     {25, 15, 1050, 20},
     {26, 1, 650, 100},
     {26, 2, 700, 100},
     {26, 3, 740, 200},
     {26, 4, 780, 100},
     {26, 5, 820, 100},
     {26, 6, 860, 100},
     {26, 7, 890, 50},
     {26, 8, 920, 50},
     {26, 9, 960, 50},
     {26, 10, 1000, 50},
     {26, 11, 1010, 20},
     {26, 12, 1020, 20},
     {26, 13, 1030, 20},
     {26, 14, 1040, 20},
     {26, 15, 1050, 20},
     {43, 1, 800, 10},
     {43, 2, 830, 50},
     {43, 3, 860, 100},
     {43, 4, 890, 150},
     {43, 5, 920, 150},
     {43, 6, 940, 150},
     {43, 7, 950, 80},
     {43, 8, 960, 70},
     {43, 9, 980, 70},
     {43, 10, 1000, 70},
     {43, 11, 1010, 20},
     {43, 12, 1020, 20},
     {43, 13, 1030, 20},
     {43, 14, 1040, 20},
     {43, 15, 1050, 20}].

get_first_base(30) -> 9;
get_first_base(40) -> 13;
get_first_base(50) -> 16;
get_first_base(60) -> 19;
get_first_base(70) -> 22;
get_first_base(80) -> 25;
get_first_base(90) -> 28;
get_first_base(100) -> 31;
get_first_base(110) -> 34;
get_first_base(_) -> 0.

get_first_type() ->
    [{1, 350, 750, 0},
     {2, 100, 1000, 0},
     {3, 200, 1300, -300},
     {4, 200, 580, 580},
     {5, 100, 650, 650},
     {0, 50, 0, 0}].

get_first_step() ->
    [{1, 700, 50},
     {2, 730, 70},
     {3, 760, 100},
     {4, 790, 130},
     {5, 820, 150},
     {6, 850, 150},
     {7, 880, 130},
     {8, 910, 100},
     {9, 940, 100},
     {10, 970, 70},
     {11, 1000, 50}].

get_effect_attr({15, 40}) ->
    [{[{100, 81002}, {150, 50}, {151, 200}], 1000},
     {[], 0}];
get_effect_attr({19, 40}) ->
    [{[{100, 81005}, {100, 81006}, {150, 50}, {151, 200}],
      1000},
     {[], 0}];
get_effect_attr({16, 40}) ->
    [{[{100, 81010}, {100, 81011}, {150, 50}, {151, 200}],
      1000},
     {[], 0}];
get_effect_attr({20, 40}) ->
    [{[{100, 81013}, {150, 50}, {151, 200}], 1000},
     {[], 0}];
get_effect_attr({17, 40}) ->
    [{[{100, 81014}, {100, 81015}, {150, 50}, {151, 200}],
      1000},
     {[], 0}];
get_effect_attr({18, 40}) ->
    [{[{100, 81016}, {100, 81017}, {150, 50}, {151, 200}],
      1000},
     {[], 0}];
get_effect_attr({15, 50}) ->
    [{[{100, 81002}, {150, 50}, {151, 200}], 1000},
     {[], 0}];
get_effect_attr({19, 50}) ->
    [{[{100, 81005}, {100, 81006}, {150, 50}, {151, 200}],
      1000},
     {[], 0}];
get_effect_attr({16, 50}) ->
    [{[{100, 81010}, {100, 81011}, {150, 50}, {151, 200}],
      1000},
     {[], 0}];
get_effect_attr({20, 50}) ->
    [{[{100, 81013}, {150, 50}, {151, 200}], 1000},
     {[], 0}];
get_effect_attr({17, 50}) ->
    [{[{100, 81014}, {100, 81015}, {150, 50}, {151, 200}],
      1000},
     {[], 0}];
get_effect_attr({18, 50}) ->
    [{[{100, 81016}, {100, 81017}, {150, 50}, {151, 200}],
      1000},
     {[], 0}];
get_effect_attr({15, 60}) ->
    [{[{100, 81002}, {150, 50}, {151, 200}], 1000},
     {[], 0}];
get_effect_attr({19, 60}) ->
    [{[{100, 81005}, {100, 81006}, {150, 50}, {151, 200}],
      1000},
     {[], 0}];
get_effect_attr({16, 60}) ->
    [{[{100, 81010}, {100, 81011}, {150, 50}, {151, 200}],
      1000},
     {[], 0}];
get_effect_attr({20, 60}) ->
    [{[{100, 81013}, {150, 50}, {151, 200}], 1000},
     {[], 0}];
get_effect_attr({17, 60}) ->
    [{[{100, 81014}, {100, 81015}, {150, 50}, {151, 200}],
      1000},
     {[], 0}];
get_effect_attr({18, 60}) ->
    [{[{100, 81016}, {100, 81017}, {150, 50}, {151, 200}],
      1000},
     {[], 0}];
get_effect_attr({15, 70}) ->
    [{[{100, 81002}, {150, 50}, {151, 200}], 1000},
     {[], 0}];
get_effect_attr({19, 70}) ->
    [{[{100, 81005}, {100, 81006}, {150, 50}, {151, 200}],
      1000},
     {[], 0}];
get_effect_attr({16, 70}) ->
    [{[{100, 81010}, {100, 81011}, {150, 50}, {151, 200}],
      1000},
     {[], 0}];
get_effect_attr({20, 70}) ->
    [{[{100, 81013}, {150, 50}, {151, 200}], 1000},
     {[], 0}];
get_effect_attr({17, 70}) ->
    [{[{100, 81014}, {100, 81015}, {150, 50}, {151, 200}],
      1000},
     {[], 0}];
get_effect_attr({18, 70}) ->
    [{[{100, 81016}, {100, 81017}, {150, 50}, {151, 200}],
      1000},
     {[], 0}];
get_effect_attr({15, 80}) ->
    [{[{100, 81002}, {150, 50}, {151, 200}], 1000},
     {[], 0}];
get_effect_attr({19, 80}) ->
    [{[{100, 81005}, {100, 81006}, {150, 50}, {151, 200}],
      1000},
     {[], 0}];
get_effect_attr({16, 80}) ->
    [{[{100, 81010}, {100, 81011}, {150, 50}, {151, 200}],
      1000},
     {[], 0}];
get_effect_attr({20, 80}) ->
    [{[{100, 81013}, {150, 50}, {151, 200}], 1000},
     {[], 0}];
get_effect_attr({17, 80}) ->
    [{[{100, 81014}, {100, 81015}, {150, 50}, {151, 200}],
      1000},
     {[], 0}];
get_effect_attr({18, 80}) ->
    [{[{100, 81016}, {100, 81017}, {150, 50}, {151, 200}],
      1000},
     {[], 0}];
get_effect_attr({15, 90}) ->
    [{[{100, 81002}, {150, 50}, {151, 200}], 1000},
     {[], 0}];
get_effect_attr({19, 90}) ->
    [{[{100, 81005}, {100, 81006}, {150, 50}, {151, 200}],
      1000},
     {[], 0}];
get_effect_attr({16, 90}) ->
    [{[{100, 81010}, {100, 81011}, {150, 50}, {151, 200}],
      1000},
     {[], 0}];
get_effect_attr({20, 90}) ->
    [{[{100, 81013}, {150, 50}, {151, 200}], 1000},
     {[], 0}];
get_effect_attr({17, 90}) ->
    [{[{100, 81014}, {100, 81015}, {150, 50}, {151, 200}],
      1000},
     {[], 0}];
get_effect_attr({18, 90}) ->
    [{[{100, 81016}, {100, 81017}, {150, 50}, {151, 200}],
      1000},
     {[], 0}];
get_effect_attr({15, 100}) ->
    [{[{100, 81002}, {150, 50}, {151, 200}], 1000},
     {[], 0}];
get_effect_attr({19, 100}) ->
    [{[{100, 81005}, {100, 81006}, {150, 50}, {151, 200}],
      1000},
     {[], 0}];
get_effect_attr({16, 100}) ->
    [{[{100, 81010}, {100, 81011}, {150, 50}, {151, 200}],
      1000},
     {[], 0}];
get_effect_attr({20, 100}) ->
    [{[{100, 81013}, {150, 50}, {151, 200}], 1000},
     {[], 0}];
get_effect_attr({17, 100}) ->
    [{[{100, 81014}, {100, 81015}, {150, 50}, {151, 200}],
      1000},
     {[], 0}];
get_effect_attr({18, 100}) ->
    [{[{100, 81016}, {100, 81017}, {150, 50}, {151, 200}],
      1000},
     {[], 0}];
get_effect_attr({15, 110}) ->
    [{[{100, 81002}, {150, 50}, {151, 200}], 1000},
     {[], 0}];
get_effect_attr({19, 110}) ->
    [{[{100, 81005}, {100, 81006}, {150, 50}, {151, 200}],
      1000},
     {[], 0}];
get_effect_attr({16, 110}) ->
    [{[{100, 81010}, {100, 81011}, {150, 50}, {151, 200}],
      1000},
     {[], 0}];
get_effect_attr({20, 110}) ->
    [{[{100, 81013}, {150, 50}, {151, 200}], 1000},
     {[], 0}];
get_effect_attr({17, 110}) ->
    [{[{100, 81014}, {100, 81015}, {150, 50}, {151, 200}],
      1000},
     {[], 0}];
get_effect_attr({18, 110}) ->
    [{[{100, 81016}, {100, 81017}, {150, 50}, {151, 200}],
      1000},
     {[], 0}];
get_effect_attr(_) -> [].

get_score({1, 1}) -> 182;
get_score({1, 4}) -> 1260;
get_score({1, 5}) -> 0;
get_score({1, 6}) -> 1260;
get_score({1, 7}) -> 1260;
get_score({1, 3}) -> 7295;
get_score({1, 2}) -> 0;
get_score({1, 25}) -> 0;
get_score({1, 26}) -> 0;
get_score({2, 1}) -> 182;
get_score({2, 4}) -> 0;
get_score({2, 5}) -> 1260;
get_score({2, 6}) -> 1260;
get_score({2, 7}) -> 1260;
get_score({2, 3}) -> 7295;
get_score({2, 2}) -> 0;
get_score({2, 25}) -> 0;
get_score({2, 26}) -> 0;
get_score({3, 1}) -> 182;
get_score({3, 4}) -> 1260;
get_score({3, 5}) -> 0;
get_score({3, 6}) -> 1260;
get_score({3, 7}) -> 1260;
get_score({3, 3}) -> 7295;
get_score({3, 2}) -> 0;
get_score({3, 25}) -> 0;
get_score({3, 26}) -> 0;
get_score({4, 1}) -> 182;
get_score({4, 4}) -> 1260;
get_score({4, 5}) -> 0;
get_score({4, 6}) -> 1260;
get_score({4, 7}) -> 1260;
get_score({4, 3}) -> 7295;
get_score({4, 2}) -> 0;
get_score({4, 25}) -> 0;
get_score({4, 26}) -> 0;
get_score({5, 1}) -> 182;
get_score({5, 4}) -> 0;
get_score({5, 5}) -> 1260;
get_score({5, 6}) -> 1260;
get_score({5, 7}) -> 1260;
get_score({5, 3}) -> 7295;
get_score({5, 2}) -> 0;
get_score({5, 25}) -> 0;
get_score({5, 26}) -> 0;
get_score({6, 1}) -> 182;
get_score({6, 4}) -> 0;
get_score({6, 5}) -> 1260;
get_score({6, 6}) -> 1260;
get_score({6, 7}) -> 1260;
get_score({6, 3}) -> 7295;
get_score({6, 2}) -> 0;
get_score({6, 25}) -> 0;
get_score({6, 26}) -> 0;
get_score({7, 1}) -> 182;
get_score({7, 4}) -> 1260;
get_score({7, 5}) -> 0;
get_score({7, 6}) -> 1260;
get_score({7, 7}) -> 1260;
get_score({7, 3}) -> 7295;
get_score({7, 2}) -> 0;
get_score({7, 25}) -> 0;
get_score({7, 26}) -> 0;
get_score(_) -> 0.

get_eqm_gem(20800) ->
    #guard_eqm_gem_data{base_id = 20800,
                        next_base_id = 20820, name = lang:get("红宝石"), lev = 1,
                        type = 1, need_lev = 40,
                        loss_coin = [#loss{label = coin, val = 12960}],
                        attrs = [{1, 160}]};
get_eqm_gem(20801) ->
    #guard_eqm_gem_data{base_id = 20801,
                        next_base_id = 20821, name = lang:get("物攻石"), lev = 1,
                        type = 2, need_lev = 40,
                        loss_coin = [#loss{label = coin, val = 25920}],
                        attrs = [{4, 20}]};
get_eqm_gem(20802) ->
    #guard_eqm_gem_data{base_id = 20802,
                        next_base_id = 20822, name = lang:get("魔攻石"), lev = 1,
                        type = 3, need_lev = 40,
                        loss_coin = [#loss{label = coin, val = 17280}],
                        attrs = [{5, 16}]};
get_eqm_gem(20803) ->
    #guard_eqm_gem_data{base_id = 20803,
                        next_base_id = 20823, name = lang:get("物防石"), lev = 1,
                        type = 4, need_lev = 40,
                        loss_coin = [#loss{label = coin, val = 10800}],
                        attrs = [{6, 30}]};
get_eqm_gem(20804) ->
    #guard_eqm_gem_data{base_id = 20804,
                        next_base_id = 20824, name = lang:get("魔防石"), lev = 1,
                        type = 5, need_lev = 40,
                        loss_coin = [#loss{label = coin, val = 10800}],
                        attrs = [{7, 24}]};
get_eqm_gem(20805) ->
    #guard_eqm_gem_data{base_id = 20805,
                        next_base_id = 20825, name = lang:get("风灵石"), lev = 1,
                        type = 6, need_lev = 40,
                        loss_coin = [#loss{label = coin, val = 17280}],
                        attrs = [{3, 6}]};
get_eqm_gem(20806) ->
    #guard_eqm_gem_data{base_id = 20806,
                        next_base_id = 20826, name = lang:get("蓝宝石"), lev = 1,
                        type = 7, need_lev = 40,
                        loss_coin = [#loss{label = coin, val = 8640}],
                        attrs = [{2, 50}]};
get_eqm_gem(20807) ->
    #guard_eqm_gem_data{base_id = 20807,
                        next_base_id = 20827, name = lang:get("治疗石"), lev = 1,
                        type = 8, need_lev = 40,
                        loss_coin = [#loss{label = coin, val = 16200}],
                        attrs = [{43, 20}]};
get_eqm_gem(20820) ->
    #guard_eqm_gem_data{base_id = 20820,
                        next_base_id = 20840, name = lang:get("红宝石"), lev = 2,
                        type = 1, need_lev = 40,
                        loss_coin = [#loss{label = coin, val = 25920}],
                        attrs = [{1, 320}]};
get_eqm_gem(20821) ->
    #guard_eqm_gem_data{base_id = 20821,
                        next_base_id = 20841, name = lang:get("物攻石"), lev = 2,
                        type = 2, need_lev = 40,
                        loss_coin = [#loss{label = coin, val = 51840}],
                        attrs = [{4, 40}]};
get_eqm_gem(20822) ->
    #guard_eqm_gem_data{base_id = 20822,
                        next_base_id = 20842, name = lang:get("魔攻石"), lev = 2,
                        type = 3, need_lev = 40,
                        loss_coin = [#loss{label = coin, val = 34560}],
                        attrs = [{5, 32}]};
get_eqm_gem(20823) ->
    #guard_eqm_gem_data{base_id = 20823,
                        next_base_id = 20843, name = lang:get("物防石"), lev = 2,
                        type = 4, need_lev = 40,
                        loss_coin = [#loss{label = coin, val = 21600}],
                        attrs = [{6, 60}]};
get_eqm_gem(20824) ->
    #guard_eqm_gem_data{base_id = 20824,
                        next_base_id = 20844, name = lang:get("魔防石"), lev = 2,
                        type = 5, need_lev = 40,
                        loss_coin = [#loss{label = coin, val = 21600}],
                        attrs = [{7, 48}]};
get_eqm_gem(20825) ->
    #guard_eqm_gem_data{base_id = 20825,
                        next_base_id = 20845, name = lang:get("风灵石"), lev = 2,
                        type = 6, need_lev = 40,
                        loss_coin = [#loss{label = coin, val = 34560}],
                        attrs = [{3, 12}]};
get_eqm_gem(20826) ->
    #guard_eqm_gem_data{base_id = 20826,
                        next_base_id = 20846, name = lang:get("蓝宝石"), lev = 2,
                        type = 7, need_lev = 40,
                        loss_coin = [#loss{label = coin, val = 17280}],
                        attrs = [{2, 100}]};
get_eqm_gem(20827) ->
    #guard_eqm_gem_data{base_id = 20827,
                        next_base_id = 20847, name = lang:get("治疗石"), lev = 2,
                        type = 8, need_lev = 40,
                        loss_coin = [#loss{label = coin, val = 32400}],
                        attrs = [{43, 40}]};
get_eqm_gem(20840) ->
    #guard_eqm_gem_data{base_id = 20840,
                        next_base_id = 20860, name = lang:get("红宝石"), lev = 3,
                        type = 1, need_lev = 50,
                        loss_coin = [#loss{label = coin, val = 51840}],
                        attrs = [{1, 480}]};
get_eqm_gem(20841) ->
    #guard_eqm_gem_data{base_id = 20841,
                        next_base_id = 20861, name = lang:get("物攻石"), lev = 3,
                        type = 2, need_lev = 50,
                        loss_coin = [#loss{label = coin, val = 103680}],
                        attrs = [{4, 60}]};
get_eqm_gem(20842) ->
    #guard_eqm_gem_data{base_id = 20842,
                        next_base_id = 20862, name = lang:get("魔攻石"), lev = 3,
                        type = 3, need_lev = 50,
                        loss_coin = [#loss{label = coin, val = 69120}],
                        attrs = [{5, 48}]};
get_eqm_gem(20843) ->
    #guard_eqm_gem_data{base_id = 20843,
                        next_base_id = 20863, name = lang:get("物防石"), lev = 3,
                        type = 4, need_lev = 50,
                        loss_coin = [#loss{label = coin, val = 43200}],
                        attrs = [{6, 90}]};
get_eqm_gem(20844) ->
    #guard_eqm_gem_data{base_id = 20844,
                        next_base_id = 20864, name = lang:get("魔防石"), lev = 3,
                        type = 5, need_lev = 50,
                        loss_coin = [#loss{label = coin, val = 43200}],
                        attrs = [{7, 72}]};
get_eqm_gem(20845) ->
    #guard_eqm_gem_data{base_id = 20845,
                        next_base_id = 20865, name = lang:get("风灵石"), lev = 3,
                        type = 6, need_lev = 50,
                        loss_coin = [#loss{label = coin, val = 69120}],
                        attrs = [{3, 18}]};
get_eqm_gem(20846) ->
    #guard_eqm_gem_data{base_id = 20846,
                        next_base_id = 20866, name = lang:get("蓝宝石"), lev = 3,
                        type = 7, need_lev = 50,
                        loss_coin = [#loss{label = coin, val = 34560}],
                        attrs = [{2, 150}]};
get_eqm_gem(20847) ->
    #guard_eqm_gem_data{base_id = 20847,
                        next_base_id = 20867, name = lang:get("治疗石"), lev = 3,
                        type = 8, need_lev = 50,
                        loss_coin = [#loss{label = coin, val = 64800}],
                        attrs = [{43, 60}]};
get_eqm_gem(20860) ->
    #guard_eqm_gem_data{base_id = 20860,
                        next_base_id = 20880, name = lang:get("红宝石"), lev = 4,
                        type = 1, need_lev = 50,
                        loss_coin = [#loss{label = coin, val = 103680}],
                        attrs = [{1, 640}]};
get_eqm_gem(20861) ->
    #guard_eqm_gem_data{base_id = 20861,
                        next_base_id = 20881, name = lang:get("物攻石"), lev = 4,
                        type = 2, need_lev = 50,
                        loss_coin = [#loss{label = coin, val = 207360}],
                        attrs = [{4, 80}]};
get_eqm_gem(20862) ->
    #guard_eqm_gem_data{base_id = 20862,
                        next_base_id = 20882, name = lang:get("魔攻石"), lev = 4,
                        type = 3, need_lev = 50,
                        loss_coin = [#loss{label = coin, val = 138240}],
                        attrs = [{5, 64}]};
get_eqm_gem(20863) ->
    #guard_eqm_gem_data{base_id = 20863,
                        next_base_id = 20883, name = lang:get("物防石"), lev = 4,
                        type = 4, need_lev = 50,
                        loss_coin = [#loss{label = coin, val = 86400}],
                        attrs = [{6, 120}]};
get_eqm_gem(20864) ->
    #guard_eqm_gem_data{base_id = 20864,
                        next_base_id = 20884, name = lang:get("魔防石"), lev = 4,
                        type = 5, need_lev = 50,
                        loss_coin = [#loss{label = coin, val = 86400}],
                        attrs = [{7, 96}]};
get_eqm_gem(20865) ->
    #guard_eqm_gem_data{base_id = 20865,
                        next_base_id = 20885, name = lang:get("风灵石"), lev = 4,
                        type = 6, need_lev = 50,
                        loss_coin = [#loss{label = coin, val = 138240}],
                        attrs = [{3, 24}]};
get_eqm_gem(20866) ->
    #guard_eqm_gem_data{base_id = 20866,
                        next_base_id = 20886, name = lang:get("蓝宝石"), lev = 4,
                        type = 7, need_lev = 50,
                        loss_coin = [#loss{label = coin, val = 69120}],
                        attrs = [{2, 200}]};
get_eqm_gem(20867) ->
    #guard_eqm_gem_data{base_id = 20867,
                        next_base_id = 20887, name = lang:get("治疗石"), lev = 4,
                        type = 8, need_lev = 50,
                        loss_coin = [#loss{label = coin, val = 129600}],
                        attrs = [{43, 80}]};
get_eqm_gem(20880) ->
    #guard_eqm_gem_data{base_id = 20880,
                        next_base_id = 20900, name = lang:get("红宝石"), lev = 5,
                        type = 1, need_lev = 60,
                        loss_coin = [#loss{label = coin, val = 207360}],
                        attrs = [{1, 800}]};
get_eqm_gem(20881) ->
    #guard_eqm_gem_data{base_id = 20881,
                        next_base_id = 20901, name = lang:get("物攻石"), lev = 5,
                        type = 2, need_lev = 60,
                        loss_coin = [#loss{label = coin, val = 414720}],
                        attrs = [{4, 100}]};
get_eqm_gem(20882) ->
    #guard_eqm_gem_data{base_id = 20882,
                        next_base_id = 20902, name = lang:get("魔攻石"), lev = 5,
                        type = 3, need_lev = 60,
                        loss_coin = [#loss{label = coin, val = 276480}],
                        attrs = [{5, 80}]};
get_eqm_gem(20883) ->
    #guard_eqm_gem_data{base_id = 20883,
                        next_base_id = 20903, name = lang:get("物防石"), lev = 5,
                        type = 4, need_lev = 60,
                        loss_coin = [#loss{label = coin, val = 172800}],
                        attrs = [{6, 150}]};
get_eqm_gem(20884) ->
    #guard_eqm_gem_data{base_id = 20884,
                        next_base_id = 20904, name = lang:get("魔防石"), lev = 5,
                        type = 5, need_lev = 60,
                        loss_coin = [#loss{label = coin, val = 172800}],
                        attrs = [{7, 120}]};
get_eqm_gem(20885) ->
    #guard_eqm_gem_data{base_id = 20885,
                        next_base_id = 20905, name = lang:get("风灵石"), lev = 5,
                        type = 6, need_lev = 60,
                        loss_coin = [#loss{label = coin, val = 276480}],
                        attrs = [{3, 30}]};
get_eqm_gem(20886) ->
    #guard_eqm_gem_data{base_id = 20886,
                        next_base_id = 20906, name = lang:get("蓝宝石"), lev = 5,
                        type = 7, need_lev = 60,
                        loss_coin = [#loss{label = coin, val = 138240}],
                        attrs = [{2, 250}]};
get_eqm_gem(20887) ->
    #guard_eqm_gem_data{base_id = 20887,
                        next_base_id = 20907, name = lang:get("治疗石"), lev = 5,
                        type = 8, need_lev = 60,
                        loss_coin = [#loss{label = coin, val = 259200}],
                        attrs = [{43, 100}]};
get_eqm_gem(20900) ->
    #guard_eqm_gem_data{base_id = 20900,
                        next_base_id = 20920, name = lang:get("红宝石"), lev = 6,
                        type = 1, need_lev = 60,
                        loss_coin = [#loss{label = coin, val = 414720}],
                        attrs = [{1, 960}]};
get_eqm_gem(20901) ->
    #guard_eqm_gem_data{base_id = 20901,
                        next_base_id = 20921, name = lang:get("物攻石"), lev = 6,
                        type = 2, need_lev = 60,
                        loss_coin = [#loss{label = coin, val = 829440}],
                        attrs = [{4, 120}]};
get_eqm_gem(20902) ->
    #guard_eqm_gem_data{base_id = 20902,
                        next_base_id = 20922, name = lang:get("魔攻石"), lev = 6,
                        type = 3, need_lev = 60,
                        loss_coin = [#loss{label = coin, val = 552960}],
                        attrs = [{5, 96}]};
get_eqm_gem(20903) ->
    #guard_eqm_gem_data{base_id = 20903,
                        next_base_id = 20923, name = lang:get("物防石"), lev = 6,
                        type = 4, need_lev = 60,
                        loss_coin = [#loss{label = coin, val = 345600}],
                        attrs = [{6, 180}]};
get_eqm_gem(20904) ->
    #guard_eqm_gem_data{base_id = 20904,
                        next_base_id = 20924, name = lang:get("魔防石"), lev = 6,
                        type = 5, need_lev = 60,
                        loss_coin = [#loss{label = coin, val = 345600}],
                        attrs = [{7, 144}]};
get_eqm_gem(20905) ->
    #guard_eqm_gem_data{base_id = 20905,
                        next_base_id = 20925, name = lang:get("风灵石"), lev = 6,
                        type = 6, need_lev = 60,
                        loss_coin = [#loss{label = coin, val = 552960}],
                        attrs = [{3, 36}]};
get_eqm_gem(20906) ->
    #guard_eqm_gem_data{base_id = 20906,
                        next_base_id = 20926, name = lang:get("蓝宝石"), lev = 6,
                        type = 7, need_lev = 60,
                        loss_coin = [#loss{label = coin, val = 276480}],
                        attrs = [{2, 300}]};
get_eqm_gem(20907) ->
    #guard_eqm_gem_data{base_id = 20907,
                        next_base_id = 20927, name = lang:get("治疗石"), lev = 6,
                        type = 8, need_lev = 60,
                        loss_coin = [#loss{label = coin, val = 518400}],
                        attrs = [{43, 120}]};
get_eqm_gem(20920) ->
    #guard_eqm_gem_data{base_id = 20920,
                        next_base_id = 20940, name = lang:get("红宝石"), lev = 7,
                        type = 1, need_lev = 70,
                        loss_coin = [#loss{label = coin, val = 829440}],
                        attrs = [{1, 1120}]};
get_eqm_gem(20921) ->
    #guard_eqm_gem_data{base_id = 20921,
                        next_base_id = 20941, name = lang:get("物攻石"), lev = 7,
                        type = 2, need_lev = 70,
                        loss_coin = [#loss{label = coin, val = 1658880}],
                        attrs = [{4, 140}]};
get_eqm_gem(20922) ->
    #guard_eqm_gem_data{base_id = 20922,
                        next_base_id = 20942, name = lang:get("魔攻石"), lev = 7,
                        type = 3, need_lev = 70,
                        loss_coin = [#loss{label = coin, val = 1105920}],
                        attrs = [{5, 112}]};
get_eqm_gem(20923) ->
    #guard_eqm_gem_data{base_id = 20923,
                        next_base_id = 20943, name = lang:get("物防石"), lev = 7,
                        type = 4, need_lev = 70,
                        loss_coin = [#loss{label = coin, val = 691200}],
                        attrs = [{6, 210}]};
get_eqm_gem(20924) ->
    #guard_eqm_gem_data{base_id = 20924,
                        next_base_id = 20944, name = lang:get("魔防石"), lev = 7,
                        type = 5, need_lev = 70,
                        loss_coin = [#loss{label = coin, val = 691200}],
                        attrs = [{7, 168}]};
get_eqm_gem(20925) ->
    #guard_eqm_gem_data{base_id = 20925,
                        next_base_id = 20945, name = lang:get("风灵石"), lev = 7,
                        type = 6, need_lev = 70,
                        loss_coin = [#loss{label = coin, val = 1105920}],
                        attrs = [{3, 42}]};
get_eqm_gem(20926) ->
    #guard_eqm_gem_data{base_id = 20926,
                        next_base_id = 20946, name = lang:get("蓝宝石"), lev = 7,
                        type = 7, need_lev = 70,
                        loss_coin = [#loss{label = coin, val = 552960}],
                        attrs = [{2, 350}]};
get_eqm_gem(20927) ->
    #guard_eqm_gem_data{base_id = 20927,
                        next_base_id = 20947, name = lang:get("治疗石"), lev = 7,
                        type = 8, need_lev = 70,
                        loss_coin = [#loss{label = coin, val = 1036800}],
                        attrs = [{43, 140}]};
get_eqm_gem(20940) ->
    #guard_eqm_gem_data{base_id = 20940,
                        next_base_id = 20960, name = lang:get("红宝石"), lev = 8,
                        type = 1, need_lev = 80,
                        loss_coin = [#loss{label = coin, val = 1658880}],
                        attrs = [{1, 1280}]};
get_eqm_gem(20941) ->
    #guard_eqm_gem_data{base_id = 20941,
                        next_base_id = 20961, name = lang:get("物攻石"), lev = 8,
                        type = 2, need_lev = 80,
                        loss_coin = [#loss{label = coin, val = 3317760}],
                        attrs = [{4, 160}]};
get_eqm_gem(20942) ->
    #guard_eqm_gem_data{base_id = 20942,
                        next_base_id = 20962, name = lang:get("魔攻石"), lev = 8,
                        type = 3, need_lev = 80,
                        loss_coin = [#loss{label = coin, val = 2211840}],
                        attrs = [{5, 128}]};
get_eqm_gem(20943) ->
    #guard_eqm_gem_data{base_id = 20943,
                        next_base_id = 20963, name = lang:get("物防石"), lev = 8,
                        type = 4, need_lev = 80,
                        loss_coin = [#loss{label = coin, val = 1382400}],
                        attrs = [{6, 240}]};
get_eqm_gem(20944) ->
    #guard_eqm_gem_data{base_id = 20944,
                        next_base_id = 20964, name = lang:get("魔防石"), lev = 8,
                        type = 5, need_lev = 80,
                        loss_coin = [#loss{label = coin, val = 1382400}],
                        attrs = [{7, 192}]};
get_eqm_gem(20945) ->
    #guard_eqm_gem_data{base_id = 20945,
                        next_base_id = 20965, name = lang:get("风灵石"), lev = 8,
                        type = 6, need_lev = 80,
                        loss_coin = [#loss{label = coin, val = 2211840}],
                        attrs = [{3, 48}]};
get_eqm_gem(20946) ->
    #guard_eqm_gem_data{base_id = 20946,
                        next_base_id = 20966, name = lang:get("蓝宝石"), lev = 8,
                        type = 7, need_lev = 80,
                        loss_coin = [#loss{label = coin, val = 1105920}],
                        attrs = [{2, 400}]};
get_eqm_gem(20947) ->
    #guard_eqm_gem_data{base_id = 20947,
                        next_base_id = 20967, name = lang:get("治疗石"), lev = 8,
                        type = 8, need_lev = 80,
                        loss_coin = [#loss{label = coin, val = 2073600}],
                        attrs = [{43, 160}]};
get_eqm_gem(20960) ->
    #guard_eqm_gem_data{base_id = 20960,
                        next_base_id = 20980, name = lang:get("红宝石"), lev = 9,
                        type = 1, need_lev = 80,
                        loss_coin = [#loss{label = coin, val = 3317760}],
                        attrs = [{1, 1440}]};
get_eqm_gem(20961) ->
    #guard_eqm_gem_data{base_id = 20961,
                        next_base_id = 20981, name = lang:get("物攻石"), lev = 9,
                        type = 2, need_lev = 80,
                        loss_coin = [#loss{label = coin, val = 6635520}],
                        attrs = [{4, 180}]};
get_eqm_gem(20962) ->
    #guard_eqm_gem_data{base_id = 20962,
                        next_base_id = 20982, name = lang:get("魔攻石"), lev = 9,
                        type = 3, need_lev = 80,
                        loss_coin = [#loss{label = coin, val = 4423680}],
                        attrs = [{5, 144}]};
get_eqm_gem(20963) ->
    #guard_eqm_gem_data{base_id = 20963,
                        next_base_id = 20983, name = lang:get("物防石"), lev = 9,
                        type = 4, need_lev = 80,
                        loss_coin = [#loss{label = coin, val = 2764800}],
                        attrs = [{6, 270}]};
get_eqm_gem(20964) ->
    #guard_eqm_gem_data{base_id = 20964,
                        next_base_id = 20984, name = lang:get("魔防石"), lev = 9,
                        type = 5, need_lev = 80,
                        loss_coin = [#loss{label = coin, val = 2764800}],
                        attrs = [{7, 216}]};
get_eqm_gem(20965) ->
    #guard_eqm_gem_data{base_id = 20965,
                        next_base_id = 20985, name = lang:get("风灵石"), lev = 9,
                        type = 6, need_lev = 80,
                        loss_coin = [#loss{label = coin, val = 4423680}],
                        attrs = [{3, 54}]};
get_eqm_gem(20966) ->
    #guard_eqm_gem_data{base_id = 20966,
                        next_base_id = 20986, name = lang:get("蓝宝石"), lev = 9,
                        type = 7, need_lev = 80,
                        loss_coin = [#loss{label = coin, val = 2211840}],
                        attrs = [{2, 450}]};
get_eqm_gem(20967) ->
    #guard_eqm_gem_data{base_id = 20967,
                        next_base_id = 20987, name = lang:get("治疗石"), lev = 9,
                        type = 8, need_lev = 80,
                        loss_coin = [#loss{label = coin, val = 4147200}],
                        attrs = [{43, 180}]};
get_eqm_gem(20980) ->
    #guard_eqm_gem_data{base_id = 20980,
                        name = lang:get("红宝石"), lev = 10, type = 1,
                        need_lev = 100,
                        loss_coin = [#loss{label = coin, val = 6635520}],
                        attrs = [{1, 1600}]};
get_eqm_gem(20981) ->
    #guard_eqm_gem_data{base_id = 20981,
                        name = lang:get("物攻石"), lev = 10, type = 2,
                        need_lev = 100,
                        loss_coin = [#loss{label = coin, val = 13271040}],
                        attrs = [{4, 200}]};
get_eqm_gem(20982) ->
    #guard_eqm_gem_data{base_id = 20982,
                        name = lang:get("魔攻石"), lev = 10, type = 3,
                        need_lev = 100,
                        loss_coin = [#loss{label = coin, val = 8847360}],
                        attrs = [{5, 160}]};
get_eqm_gem(20983) ->
    #guard_eqm_gem_data{base_id = 20983,
                        name = lang:get("物防石"), lev = 10, type = 4,
                        need_lev = 100,
                        loss_coin = [#loss{label = coin, val = 5529600}],
                        attrs = [{6, 300}]};
get_eqm_gem(20984) ->
    #guard_eqm_gem_data{base_id = 20984,
                        name = lang:get("魔防石"), lev = 10, type = 5,
                        need_lev = 100,
                        loss_coin = [#loss{label = coin, val = 5529600}],
                        attrs = [{7, 240}]};
get_eqm_gem(20985) ->
    #guard_eqm_gem_data{base_id = 20985,
                        name = lang:get("风灵石"), lev = 10, type = 6,
                        need_lev = 100,
                        loss_coin = [#loss{label = coin, val = 8847360}],
                        attrs = [{3, 60}]};
get_eqm_gem(20986) ->
    #guard_eqm_gem_data{base_id = 20986,
                        name = lang:get("蓝宝石"), lev = 10, type = 7,
                        need_lev = 100,
                        loss_coin = [#loss{label = coin, val = 4423680}],
                        attrs = [{2, 500}]};
get_eqm_gem(20987) ->
    #guard_eqm_gem_data{base_id = 20987,
                        name = lang:get("治疗石"), lev = 10, type = 8,
                        need_lev = 100,
                        loss_coin = [#loss{label = coin, val = 8294400}],
                        attrs = [{43, 200}]};
get_eqm_gem(_BaseId) -> false.

get_eqm_gem2({1, 1}) ->
    {20800, [#loss{label = coin, val = 12960}]};
get_eqm_gem2({1, 2}) ->
    {20801, [#loss{label = coin, val = 25920}]};
get_eqm_gem2({1, 3}) ->
    {20802, [#loss{label = coin, val = 17280}]};
get_eqm_gem2({1, 4}) ->
    {20803, [#loss{label = coin, val = 10800}]};
get_eqm_gem2({1, 5}) ->
    {20804, [#loss{label = coin, val = 10800}]};
get_eqm_gem2({1, 6}) ->
    {20805, [#loss{label = coin, val = 17280}]};
get_eqm_gem2({1, 7}) ->
    {20806, [#loss{label = coin, val = 8640}]};
get_eqm_gem2({1, 8}) ->
    {20807, [#loss{label = coin, val = 16200}]};
get_eqm_gem2({2, 1}) ->
    {20820, [#loss{label = coin, val = 25920}]};
get_eqm_gem2({2, 2}) ->
    {20821, [#loss{label = coin, val = 51840}]};
get_eqm_gem2({2, 3}) ->
    {20822, [#loss{label = coin, val = 34560}]};
get_eqm_gem2({2, 4}) ->
    {20823, [#loss{label = coin, val = 21600}]};
get_eqm_gem2({2, 5}) ->
    {20824, [#loss{label = coin, val = 21600}]};
get_eqm_gem2({2, 6}) ->
    {20825, [#loss{label = coin, val = 34560}]};
get_eqm_gem2({2, 7}) ->
    {20826, [#loss{label = coin, val = 17280}]};
get_eqm_gem2({2, 8}) ->
    {20827, [#loss{label = coin, val = 32400}]};
get_eqm_gem2({3, 1}) ->
    {20840, [#loss{label = coin, val = 51840}]};
get_eqm_gem2({3, 2}) ->
    {20841, [#loss{label = coin, val = 103680}]};
get_eqm_gem2({3, 3}) ->
    {20842, [#loss{label = coin, val = 69120}]};
get_eqm_gem2({3, 4}) ->
    {20843, [#loss{label = coin, val = 43200}]};
get_eqm_gem2({3, 5}) ->
    {20844, [#loss{label = coin, val = 43200}]};
get_eqm_gem2({3, 6}) ->
    {20845, [#loss{label = coin, val = 69120}]};
get_eqm_gem2({3, 7}) ->
    {20846, [#loss{label = coin, val = 34560}]};
get_eqm_gem2({3, 8}) ->
    {20847, [#loss{label = coin, val = 64800}]};
get_eqm_gem2({4, 1}) ->
    {20860, [#loss{label = coin, val = 103680}]};
get_eqm_gem2({4, 2}) ->
    {20861, [#loss{label = coin, val = 207360}]};
get_eqm_gem2({4, 3}) ->
    {20862, [#loss{label = coin, val = 138240}]};
get_eqm_gem2({4, 4}) ->
    {20863, [#loss{label = coin, val = 86400}]};
get_eqm_gem2({4, 5}) ->
    {20864, [#loss{label = coin, val = 86400}]};
get_eqm_gem2({4, 6}) ->
    {20865, [#loss{label = coin, val = 138240}]};
get_eqm_gem2({4, 7}) ->
    {20866, [#loss{label = coin, val = 69120}]};
get_eqm_gem2({4, 8}) ->
    {20867, [#loss{label = coin, val = 129600}]};
get_eqm_gem2({5, 1}) ->
    {20880, [#loss{label = coin, val = 207360}]};
get_eqm_gem2({5, 2}) ->
    {20881, [#loss{label = coin, val = 414720}]};
get_eqm_gem2({5, 3}) ->
    {20882, [#loss{label = coin, val = 276480}]};
get_eqm_gem2({5, 4}) ->
    {20883, [#loss{label = coin, val = 172800}]};
get_eqm_gem2({5, 5}) ->
    {20884, [#loss{label = coin, val = 172800}]};
get_eqm_gem2({5, 6}) ->
    {20885, [#loss{label = coin, val = 276480}]};
get_eqm_gem2({5, 7}) ->
    {20886, [#loss{label = coin, val = 138240}]};
get_eqm_gem2({5, 8}) ->
    {20887, [#loss{label = coin, val = 259200}]};
get_eqm_gem2({6, 1}) ->
    {20900, [#loss{label = coin, val = 414720}]};
get_eqm_gem2({6, 2}) ->
    {20901, [#loss{label = coin, val = 829440}]};
get_eqm_gem2({6, 3}) ->
    {20902, [#loss{label = coin, val = 552960}]};
get_eqm_gem2({6, 4}) ->
    {20903, [#loss{label = coin, val = 345600}]};
get_eqm_gem2({6, 5}) ->
    {20904, [#loss{label = coin, val = 345600}]};
get_eqm_gem2({6, 6}) ->
    {20905, [#loss{label = coin, val = 552960}]};
get_eqm_gem2({6, 7}) ->
    {20906, [#loss{label = coin, val = 276480}]};
get_eqm_gem2({6, 8}) ->
    {20907, [#loss{label = coin, val = 518400}]};
get_eqm_gem2({7, 1}) ->
    {20920, [#loss{label = coin, val = 829440}]};
get_eqm_gem2({7, 2}) ->
    {20921, [#loss{label = coin, val = 1658880}]};
get_eqm_gem2({7, 3}) ->
    {20922, [#loss{label = coin, val = 1105920}]};
get_eqm_gem2({7, 4}) ->
    {20923, [#loss{label = coin, val = 691200}]};
get_eqm_gem2({7, 5}) ->
    {20924, [#loss{label = coin, val = 691200}]};
get_eqm_gem2({7, 6}) ->
    {20925, [#loss{label = coin, val = 1105920}]};
get_eqm_gem2({7, 7}) ->
    {20926, [#loss{label = coin, val = 552960}]};
get_eqm_gem2({7, 8}) ->
    {20927, [#loss{label = coin, val = 1036800}]};
get_eqm_gem2({8, 1}) ->
    {20940, [#loss{label = coin, val = 1658880}]};
get_eqm_gem2({8, 2}) ->
    {20941, [#loss{label = coin, val = 3317760}]};
get_eqm_gem2({8, 3}) ->
    {20942, [#loss{label = coin, val = 2211840}]};
get_eqm_gem2({8, 4}) ->
    {20943, [#loss{label = coin, val = 1382400}]};
get_eqm_gem2({8, 5}) ->
    {20944, [#loss{label = coin, val = 1382400}]};
get_eqm_gem2({8, 6}) ->
    {20945, [#loss{label = coin, val = 2211840}]};
get_eqm_gem2({8, 7}) ->
    {20946, [#loss{label = coin, val = 1105920}]};
get_eqm_gem2({8, 8}) ->
    {20947, [#loss{label = coin, val = 2073600}]};
get_eqm_gem2({9, 1}) ->
    {20960, [#loss{label = coin, val = 3317760}]};
get_eqm_gem2({9, 2}) ->
    {20961, [#loss{label = coin, val = 6635520}]};
get_eqm_gem2({9, 3}) ->
    {20962, [#loss{label = coin, val = 4423680}]};
get_eqm_gem2({9, 4}) ->
    {20963, [#loss{label = coin, val = 2764800}]};
get_eqm_gem2({9, 5}) ->
    {20964, [#loss{label = coin, val = 2764800}]};
get_eqm_gem2({9, 6}) ->
    {20965, [#loss{label = coin, val = 4423680}]};
get_eqm_gem2({9, 7}) ->
    {20966, [#loss{label = coin, val = 2211840}]};
get_eqm_gem2({9, 8}) ->
    {20967, [#loss{label = coin, val = 4147200}]};
get_eqm_gem2({10, 1}) ->
    {20980, [#loss{label = coin, val = 6635520}]};
get_eqm_gem2({10, 2}) ->
    {20981, [#loss{label = coin, val = 13271040}]};
get_eqm_gem2({10, 3}) ->
    {20982, [#loss{label = coin, val = 8847360}]};
get_eqm_gem2({10, 4}) ->
    {20983, [#loss{label = coin, val = 5529600}]};
get_eqm_gem2({10, 5}) ->
    {20984, [#loss{label = coin, val = 5529600}]};
get_eqm_gem2({10, 6}) ->
    {20985, [#loss{label = coin, val = 8847360}]};
get_eqm_gem2({10, 7}) ->
    {20986, [#loss{label = coin, val = 4423680}]};
get_eqm_gem2({10, 8}) ->
    {20987, [#loss{label = coin, val = 8294400}]};
get_eqm_gem2(_) -> false.

get_embed_type(15) -> [{2, 2}, {3, 2}, {8, 2}];
get_embed_type(19) -> [{3, 2}, {5, 2}];
get_embed_type(16) -> [{3, 2}, {4, 2}, {8, 2}];
get_embed_type(20) -> [{1, 2}, {7, 2}, {2, 2}];
get_embed_type(17) -> [{4, 2}, {5, 2}, {2, 2}];
get_embed_type(18) -> [{6, 2}, {7, 2}];
get_embed_type(_) -> [].

get_point_attr(102) -> [{1, 4000}, {7, 50}, {3, 10}];
get_point_attr(101) -> [{4, 320}, {5, 120}, {3, 10}];
get_point_attr(103) -> [{5, 350}, {7, 300}, {2, 600}];
get_point_attr(104) -> [{3, 100}];
get_point_attr(105) -> [{6, 700}, {7, 120}, {3, 10}];
get_point_attr(_) -> [].

model(1002) -> 11002;
model(1012) -> 11012;
model(1008) -> 11008;
model(1018) -> 11018;
model(1020) -> 11020;
model(1014) -> 11014;
model(1010) -> 11010;
model(1019) -> 11019;
model(1023) -> 11023;
model(1013) -> 11015;
model(1006) -> 11006;
model(1021) -> 11021;
model(1022) -> 11025;
model(_) -> false.

get_astroid_active({1002, 1}) ->
    #{base_id => 1002, quality => 1,
      condition =>
          [#condition{label = lev, op = ge, val = 55},
           #condition{label = guard_id, op = eq, val = 1008},
           #condition{label = guard_id, op = eq, val = 1018},
           #condition{label = guard_id, op = eq, val = 1020}],
      cost => [{22410, 1}]};
get_astroid_active({1002, 2}) ->
    #{base_id => 1002, quality => 2,
      condition =>
          [#condition{label = lev, op = ge, val = 70},
           #condition{label = guard_id, op = eq, val = 1006},
           #condition{label = guard_quality, op = ge, val = 2}],
      cost => [{22410, 2}]};
get_astroid_active({1002, 3}) ->
    #{base_id => 1002, quality => 3,
      condition =>
          [#condition{label = lev, op = ge, val = 80},
           #condition{label = guard_id, op = eq, val = 1022},
           #condition{label = guard_quality, op = ge, val = 3}],
      cost => [{22410, 6}]};
get_astroid_active({1002, 4}) ->
    #{base_id => 1002, quality => 4,
      condition =>
          [#condition{label = lev, op = ge, val = 95},
           #condition{label = guard_quality, op = ge, val = 4}],
      cost => [{22410, 12}]};
get_astroid_active({1012, 1}) ->
    #{base_id => 1012, quality => 1,
      condition =>
          [#condition{label = lev, op = ge, val = 55},
           #condition{label = guard_id, op = eq, val = 1014}],
      cost => [{22411, 1}]};
get_astroid_active({1012, 2}) ->
    #{base_id => 1012, quality => 2,
      condition =>
          [#condition{label = lev, op = ge, val = 70},
           #condition{label = guard_id, op = eq, val = 1013},
           #condition{label = guard_quality, op = ge, val = 2}],
      cost => [{22411, 2}]};
get_astroid_active({1012, 3}) ->
    #{base_id => 1012, quality => 3,
      condition =>
          [#condition{label = lev, op = ge, val = 80},
           #condition{label = guard_quality, op = ge, val = 3}],
      cost => [{22411, 6}]};
get_astroid_active({1012, 4}) ->
    #{base_id => 1012, quality => 4,
      condition =>
          [#condition{label = lev, op = ge, val = 95},
           #condition{label = guard_quality, op = ge, val = 4}],
      cost => [{22411, 12}]};
get_astroid_active({1008, 1}) ->
    #{base_id => 1008, quality => 1,
      condition =>
          [#condition{label = lev, op = ge, val = 55},
           #condition{label = guard_id, op = eq, val = 1010}],
      cost => [{22412, 1}]};
get_astroid_active({1008, 2}) ->
    #{base_id => 1008, quality => 2,
      condition =>
          [#condition{label = lev, op = ge, val = 70},
           #condition{label = guard_id, op = eq, val = 1023},
           #condition{label = guard_quality, op = ge, val = 2}],
      cost => [{22412, 2}]};
get_astroid_active({1008, 3}) ->
    #{base_id => 1008, quality => 3,
      condition =>
          [#condition{label = lev, op = ge, val = 80},
           #condition{label = guard_quality, op = ge, val = 3}],
      cost => [{22412, 6}]};
get_astroid_active({1008, 4}) ->
    #{base_id => 1008, quality => 4,
      condition =>
          [#condition{label = lev, op = ge, val = 95},
           #condition{label = guard_quality, op = ge, val = 4}],
      cost => [{22412, 12}]};
get_astroid_active({1018, 1}) ->
    #{base_id => 1018, quality => 1,
      condition =>
          [#condition{label = lev, op = ge, val = 55},
           #condition{label = guard_id, op = eq, val = 1019}],
      cost => [{22413, 1}]};
get_astroid_active({1018, 2}) ->
    #{base_id => 1018, quality => 2,
      condition =>
          [#condition{label = lev, op = ge, val = 70},
           #condition{label = guard_id, op = eq, val = 1021},
           #condition{label = guard_quality, op = ge, val = 2}],
      cost => [{22413, 2}]};
get_astroid_active({1018, 3}) ->
    #{base_id => 1018, quality => 3,
      condition =>
          [#condition{label = lev, op = ge, val = 80},
           #condition{label = guard_quality, op = ge, val = 3}],
      cost => [{22413, 6}]};
get_astroid_active({1018, 4}) ->
    #{base_id => 1018, quality => 4,
      condition =>
          [#condition{label = lev, op = ge, val = 95},
           #condition{label = guard_quality, op = ge, val = 4}],
      cost => [{22413, 12}]};
get_astroid_active({1020, 2}) ->
    #{base_id => 1020, quality => 2,
      condition =>
          [#condition{label = lev, op = ge, val = 70},
           #condition{label = guard_id, op = eq, val = 1006},
           #condition{label = guard_quality, op = ge, val = 2}],
      cost => [{22414, 1}]};
get_astroid_active({1020, 3}) ->
    #{base_id => 1020, quality => 3,
      condition =>
          [#condition{label = lev, op = ge, val = 80},
           #condition{label = guard_id, op = eq, val = 1022},
           #condition{label = guard_quality, op = ge, val = 3}],
      cost => [{22414, 3}]};
get_astroid_active({1020, 4}) ->
    #{base_id => 1020, quality => 4,
      condition =>
          [#condition{label = lev, op = ge, val = 95},
           #condition{label = guard_quality, op = ge, val = 4}],
      cost => [{22414, 6}]};
get_astroid_active({1014, 2}) ->
    #{base_id => 1014, quality => 2,
      condition =>
          [#condition{label = lev, op = ge, val = 70},
           #condition{label = guard_id, op = eq, val = 1013},
           #condition{label = guard_quality, op = ge, val = 2}],
      cost => [{22415, 1}]};
get_astroid_active({1014, 3}) ->
    #{base_id => 1014, quality => 3,
      condition =>
          [#condition{label = lev, op = ge, val = 80},
           #condition{label = guard_quality, op = ge, val = 3}],
      cost => [{22415, 3}]};
get_astroid_active({1014, 4}) ->
    #{base_id => 1014, quality => 4,
      condition =>
          [#condition{label = lev, op = ge, val = 95},
           #condition{label = guard_quality, op = ge, val = 4}],
      cost => [{22415, 6}]};
get_astroid_active({1010, 2}) ->
    #{base_id => 1010, quality => 2,
      condition =>
          [#condition{label = lev, op = ge, val = 70},
           #condition{label = guard_id, op = eq, val = 1023},
           #condition{label = guard_quality, op = ge, val = 2}],
      cost => [{22416, 1}]};
get_astroid_active({1010, 3}) ->
    #{base_id => 1010, quality => 3,
      condition =>
          [#condition{label = lev, op = ge, val = 80},
           #condition{label = guard_quality, op = ge, val = 3}],
      cost => [{22416, 3}]};
get_astroid_active({1010, 4}) ->
    #{base_id => 1010, quality => 4,
      condition =>
          [#condition{label = lev, op = ge, val = 95},
           #condition{label = guard_quality, op = ge, val = 4}],
      cost => [{22416, 6}]};
get_astroid_active({1019, 2}) ->
    #{base_id => 1019, quality => 2,
      condition =>
          [#condition{label = lev, op = ge, val = 70},
           #condition{label = guard_id, op = eq, val = 1021},
           #condition{label = guard_quality, op = ge, val = 2}],
      cost => [{22417, 1}]};
get_astroid_active({1019, 3}) ->
    #{base_id => 1019, quality => 3,
      condition =>
          [#condition{label = lev, op = ge, val = 80},
           #condition{label = guard_quality, op = ge, val = 3}],
      cost => [{22417, 3}]};
get_astroid_active({1019, 4}) ->
    #{base_id => 1019, quality => 4,
      condition =>
          [#condition{label = lev, op = ge, val = 95},
           #condition{label = guard_quality, op = ge, val = 4}],
      cost => [{22417, 6}]};
get_astroid_active({1023, 3}) ->
    #{base_id => 1023, quality => 3,
      condition =>
          [#condition{label = lev, op = ge, val = 80},
           #condition{label = guard_quality, op = ge, val = 3}],
      cost => [{22418, 1}]};
get_astroid_active({1023, 4}) ->
    #{base_id => 1023, quality => 4,
      condition =>
          [#condition{label = lev, op = ge, val = 95},
           #condition{label = guard_quality, op = ge, val = 4}],
      cost => [{22418, 2}]};
get_astroid_active({1013, 3}) ->
    #{base_id => 1013, quality => 3,
      condition =>
          [#condition{label = lev, op = ge, val = 80},
           #condition{label = guard_quality, op = ge, val = 3}],
      cost => [{22419, 1}]};
get_astroid_active({1013, 4}) ->
    #{base_id => 1013, quality => 4,
      condition =>
          [#condition{label = lev, op = ge, val = 95},
           #condition{label = guard_quality, op = ge, val = 4}],
      cost => [{22419, 2}]};
get_astroid_active({1006, 3}) ->
    #{base_id => 1006, quality => 3,
      condition =>
          [#condition{label = lev, op = ge, val = 80},
           #condition{label = guard_id, op = eq, val = 1022},
           #condition{label = guard_quality, op = ge, val = 3}],
      cost => [{22420, 1}]};
get_astroid_active({1006, 4}) ->
    #{base_id => 1006, quality => 4,
      condition =>
          [#condition{label = lev, op = ge, val = 95},
           #condition{label = guard_quality, op = ge, val = 4}],
      cost => [{22420, 2}]};
get_astroid_active({1021, 3}) ->
    #{base_id => 1021, quality => 3,
      condition =>
          [#condition{label = lev, op = ge, val = 80},
           #condition{label = guard_quality, op = ge, val = 3}],
      cost => [{22421, 1}]};
get_astroid_active({1021, 4}) ->
    #{base_id => 1021, quality => 4,
      condition =>
          [#condition{label = lev, op = ge, val = 95},
           #condition{label = guard_quality, op = ge, val = 4}],
      cost => [{22421, 2}]};
get_astroid_active({1022, 3}) ->
    #{base_id => 1022, quality => 3,
      condition =>
          [#condition{label = lev, op = ge, val = 80},
           #condition{label = guard_quality, op = ge, val = 3}],
      cost => [{22422, 1}]};
get_astroid_active({1022, 4}) ->
    #{base_id => 1022, quality => 4,
      condition =>
          [#condition{label = lev, op = ge, val = 95},
           #condition{label = guard_quality, op = ge, val = 4}],
      cost => [{22422, 2}]};
get_astroid_active(_) -> false.

get_astroid({1002, 1, 1}) ->
    #{base_id => 1002, id => 1, quality => 1,
      need_exp => 60, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 92, showGrowth => 412, score => 28,
      condition => [], cost => [{22400, 1}], attrs => []};
get_astroid({1002, 2, 1}) ->
    #{base_id => 1002, id => 2, quality => 1,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 92, showGrowth => 504, score => 28,
      condition => [], cost => [{22400, 1}], attrs => []};
get_astroid({1002, 3, 1}) ->
    #{base_id => 1002, id => 3, quality => 1,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 92, showGrowth => 596, score => 28,
      condition => [], cost => [{22400, 1}], attrs => []};
get_astroid({1002, 4, 1}) ->
    #{base_id => 1002, id => 4, quality => 1,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 92, showGrowth => 688, score => 28,
      condition => [], cost => [{22400, 2}], attrs => []};
get_astroid({1002, 5, 1}) ->
    #{base_id => 1002, id => 5, quality => 1,
      need_exp => 120, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 92, showGrowth => 780, score => 28,
      condition => [], cost => [{22400, 2}], attrs => []};
get_astroid({1002, 1, 2}) ->
    #{base_id => 1002, id => 1, quality => 2,
      need_exp => 120, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 128, showGrowth => 816, score => 38,
      condition => [], cost => [{22401, 1}], attrs => []};
get_astroid({1002, 2, 2}) ->
    #{base_id => 1002, id => 2, quality => 2,
      need_exp => 180, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 129, showGrowth => 853, score => 38,
      condition => [], cost => [{22401, 1}], attrs => []};
get_astroid({1002, 3, 2}) ->
    #{base_id => 1002, id => 3, quality => 2,
      need_exp => 180, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 129, showGrowth => 890, score => 38,
      condition => [], cost => [{22401, 1}], attrs => []};
get_astroid({1002, 4, 2}) ->
    #{base_id => 1002, id => 4, quality => 2,
      need_exp => 180, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 129, showGrowth => 927, score => 38,
      condition => [], cost => [{22401, 2}], attrs => []};
get_astroid({1002, 5, 2}) ->
    #{base_id => 1002, id => 5, quality => 2,
      need_exp => 210, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 129, showGrowth => 964, score => 38,
      condition => [], cost => [{22401, 2}], attrs => []};
get_astroid({1002, 6, 2}) ->
    #{base_id => 1002, id => 6, quality => 2,
      need_exp => 120, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 36, showGrowth => 1000, score => 38,
      condition => [], cost => [{22401, 2}], attrs => []};
get_astroid({1002, 1, 3}) ->
    #{base_id => 1002, id => 1, quality => 3,
      need_exp => 210, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 157, showGrowth => 1029, score => 52,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1002, 2, 3}) ->
    #{base_id => 1002, id => 2, quality => 3,
      need_exp => 270, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 157, showGrowth => 1057, score => 52,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1002, 3, 3}) ->
    #{base_id => 1002, id => 3, quality => 3,
      need_exp => 330, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 158, showGrowth => 1086, score => 52,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1002, 4, 3}) ->
    #{base_id => 1002, id => 4, quality => 3,
      need_exp => 330, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 157, showGrowth => 1114, score => 52,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1002, 5, 3}) ->
    #{base_id => 1002, id => 5, quality => 3,
      need_exp => 390, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 158, showGrowth => 1143, score => 52,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1002, 6, 3}) ->
    #{base_id => 1002, id => 6, quality => 3,
      need_exp => 360, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 64, showGrowth => 1171, score => 52,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1002, 7, 3}) ->
    #{base_id => 1002, id => 7, quality => 3,
      need_exp => 240, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 29, showGrowth => 1200, score => 52,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1002, 1, 4}) ->
    #{base_id => 1002, id => 1, quality => 4,
      need_exp => 300, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 194, showGrowth => 1237, score => 66,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1002, 2, 4}) ->
    #{base_id => 1002, id => 2, quality => 4,
      need_exp => 390, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 194, showGrowth => 1274, score => 66,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1002, 3, 4}) ->
    #{base_id => 1002, id => 3, quality => 4,
      need_exp => 510, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 195, showGrowth => 1311, score => 66,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1002, 4, 4}) ->
    #{base_id => 1002, id => 4, quality => 4,
      need_exp => 540, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 194, showGrowth => 1348, score => 66,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1002, 5, 4}) ->
    #{base_id => 1002, id => 5, quality => 4,
      need_exp => 630, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 196, showGrowth => 1386, score => 66,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1002, 6, 4}) ->
    #{base_id => 1002, id => 6, quality => 4,
      need_exp => 660, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 102, showGrowth => 1424, score => 66,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1002, 7, 4}) ->
    #{base_id => 1002, id => 7, quality => 4,
      need_exp => 540, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 67, showGrowth => 1462, score => 66,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1002, 8, 4}) ->
    #{base_id => 1002, id => 8, quality => 4,
      need_exp => 360, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 38, showGrowth => 1500, score => 66,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1012, 1, 1}) ->
    #{base_id => 1012, id => 1, quality => 1,
      need_exp => 60, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 80, showGrowth => 460, score => 23,
      condition => [], cost => [{22400, 1}], attrs => []};
get_astroid({1012, 2, 1}) ->
    #{base_id => 1012, id => 2, quality => 1,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 80, showGrowth => 540, score => 23,
      condition => [], cost => [{22400, 1}], attrs => []};
get_astroid({1012, 3, 1}) ->
    #{base_id => 1012, id => 3, quality => 1,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 80, showGrowth => 620, score => 23,
      condition => [], cost => [{22400, 1}], attrs => []};
get_astroid({1012, 4, 1}) ->
    #{base_id => 1012, id => 4, quality => 1,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 80, showGrowth => 700, score => 23,
      condition => [], cost => [{22400, 2}], attrs => []};
get_astroid({1012, 5, 1}) ->
    #{base_id => 1012, id => 5, quality => 1,
      need_exp => 120, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 80, showGrowth => 780, score => 23,
      condition => [], cost => [{22400, 2}], attrs => []};
get_astroid({1012, 1, 2}) ->
    #{base_id => 1012, id => 1, quality => 2,
      need_exp => 120, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 116, showGrowth => 816, score => 34,
      condition => [], cost => [{22401, 1}], attrs => []};
get_astroid({1012, 2, 2}) ->
    #{base_id => 1012, id => 2, quality => 2,
      need_exp => 180, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 117, showGrowth => 853, score => 34,
      condition => [], cost => [{22401, 1}], attrs => []};
get_astroid({1012, 3, 2}) ->
    #{base_id => 1012, id => 3, quality => 2,
      need_exp => 180, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 117, showGrowth => 890, score => 34,
      condition => [], cost => [{22401, 1}], attrs => []};
get_astroid({1012, 4, 2}) ->
    #{base_id => 1012, id => 4, quality => 2,
      need_exp => 180, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 117, showGrowth => 927, score => 34,
      condition => [], cost => [{22401, 2}], attrs => []};
get_astroid({1012, 5, 2}) ->
    #{base_id => 1012, id => 5, quality => 2,
      need_exp => 210, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 117, showGrowth => 964, score => 34,
      condition => [], cost => [{22401, 2}], attrs => []};
get_astroid({1012, 6, 2}) ->
    #{base_id => 1012, id => 6, quality => 2,
      need_exp => 120, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 36, showGrowth => 1000, score => 34,
      condition => [], cost => [{22401, 2}], attrs => []};
get_astroid({1012, 1, 3}) ->
    #{base_id => 1012, id => 1, quality => 3,
      need_exp => 210, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 145, showGrowth => 1029, score => 49,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1012, 2, 3}) ->
    #{base_id => 1012, id => 2, quality => 3,
      need_exp => 270, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 145, showGrowth => 1057, score => 49,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1012, 3, 3}) ->
    #{base_id => 1012, id => 3, quality => 3,
      need_exp => 330, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 146, showGrowth => 1086, score => 49,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1012, 4, 3}) ->
    #{base_id => 1012, id => 4, quality => 3,
      need_exp => 330, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 145, showGrowth => 1114, score => 49,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1012, 5, 3}) ->
    #{base_id => 1012, id => 5, quality => 3,
      need_exp => 390, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 146, showGrowth => 1143, score => 49,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1012, 6, 3}) ->
    #{base_id => 1012, id => 6, quality => 3,
      need_exp => 360, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 64, showGrowth => 1171, score => 49,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1012, 7, 3}) ->
    #{base_id => 1012, id => 7, quality => 3,
      need_exp => 240, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 29, showGrowth => 1200, score => 49,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1012, 1, 4}) ->
    #{base_id => 1012, id => 1, quality => 4,
      need_exp => 300, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 182, showGrowth => 1237, score => 64,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1012, 2, 4}) ->
    #{base_id => 1012, id => 2, quality => 4,
      need_exp => 390, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 182, showGrowth => 1274, score => 64,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1012, 3, 4}) ->
    #{base_id => 1012, id => 3, quality => 4,
      need_exp => 510, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 183, showGrowth => 1311, score => 64,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1012, 4, 4}) ->
    #{base_id => 1012, id => 4, quality => 4,
      need_exp => 540, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 182, showGrowth => 1348, score => 64,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1012, 5, 4}) ->
    #{base_id => 1012, id => 5, quality => 4,
      need_exp => 630, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 184, showGrowth => 1386, score => 64,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1012, 6, 4}) ->
    #{base_id => 1012, id => 6, quality => 4,
      need_exp => 660, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 102, showGrowth => 1424, score => 64,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1012, 7, 4}) ->
    #{base_id => 1012, id => 7, quality => 4,
      need_exp => 540, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 67, showGrowth => 1462, score => 64,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1012, 8, 4}) ->
    #{base_id => 1012, id => 8, quality => 4,
      need_exp => 360, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 38, showGrowth => 1500, score => 64,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1008, 1, 1}) ->
    #{base_id => 1008, id => 1, quality => 1,
      need_exp => 60, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 68, showGrowth => 508, score => 19,
      condition => [], cost => [{22400, 1}], attrs => []};
get_astroid({1008, 2, 1}) ->
    #{base_id => 1008, id => 2, quality => 1,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 68, showGrowth => 576, score => 19,
      condition => [], cost => [{22400, 1}], attrs => []};
get_astroid({1008, 3, 1}) ->
    #{base_id => 1008, id => 3, quality => 1,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 68, showGrowth => 644, score => 19,
      condition => [], cost => [{22400, 1}], attrs => []};
get_astroid({1008, 4, 1}) ->
    #{base_id => 1008, id => 4, quality => 1,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 68, showGrowth => 712, score => 19,
      condition => [], cost => [{22400, 2}], attrs => []};
get_astroid({1008, 5, 1}) ->
    #{base_id => 1008, id => 5, quality => 1,
      need_exp => 120, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 68, showGrowth => 780, score => 19,
      condition => [], cost => [{22400, 2}], attrs => []};
get_astroid({1008, 1, 2}) ->
    #{base_id => 1008, id => 1, quality => 2,
      need_exp => 120, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 104, showGrowth => 816, score => 30,
      condition => [], cost => [{22401, 1}], attrs => []};
get_astroid({1008, 2, 2}) ->
    #{base_id => 1008, id => 2, quality => 2,
      need_exp => 180, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 105, showGrowth => 853, score => 30,
      condition => [], cost => [{22401, 1}], attrs => []};
get_astroid({1008, 3, 2}) ->
    #{base_id => 1008, id => 3, quality => 2,
      need_exp => 180, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 105, showGrowth => 890, score => 30,
      condition => [], cost => [{22401, 1}], attrs => []};
get_astroid({1008, 4, 2}) ->
    #{base_id => 1008, id => 4, quality => 2,
      need_exp => 180, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 105, showGrowth => 927, score => 30,
      condition => [], cost => [{22401, 2}], attrs => []};
get_astroid({1008, 5, 2}) ->
    #{base_id => 1008, id => 5, quality => 2,
      need_exp => 210, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 105, showGrowth => 964, score => 30,
      condition => [], cost => [{22401, 2}], attrs => []};
get_astroid({1008, 6, 2}) ->
    #{base_id => 1008, id => 6, quality => 2,
      need_exp => 120, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 36, showGrowth => 1000, score => 30,
      condition => [], cost => [{22401, 2}], attrs => []};
get_astroid({1008, 1, 3}) ->
    #{base_id => 1008, id => 1, quality => 3,
      need_exp => 210, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 133, showGrowth => 1029, score => 45,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1008, 2, 3}) ->
    #{base_id => 1008, id => 2, quality => 3,
      need_exp => 270, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 133, showGrowth => 1057, score => 45,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1008, 3, 3}) ->
    #{base_id => 1008, id => 3, quality => 3,
      need_exp => 330, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 134, showGrowth => 1086, score => 45,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1008, 4, 3}) ->
    #{base_id => 1008, id => 4, quality => 3,
      need_exp => 330, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 133, showGrowth => 1114, score => 45,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1008, 5, 3}) ->
    #{base_id => 1008, id => 5, quality => 3,
      need_exp => 390, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 134, showGrowth => 1143, score => 45,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1008, 6, 3}) ->
    #{base_id => 1008, id => 6, quality => 3,
      need_exp => 360, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 64, showGrowth => 1171, score => 45,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1008, 7, 3}) ->
    #{base_id => 1008, id => 7, quality => 3,
      need_exp => 240, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 29, showGrowth => 1200, score => 45,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1008, 1, 4}) ->
    #{base_id => 1008, id => 1, quality => 4,
      need_exp => 300, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 170, showGrowth => 1237, score => 60,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1008, 2, 4}) ->
    #{base_id => 1008, id => 2, quality => 4,
      need_exp => 390, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 170, showGrowth => 1274, score => 60,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1008, 3, 4}) ->
    #{base_id => 1008, id => 3, quality => 4,
      need_exp => 510, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 171, showGrowth => 1311, score => 60,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1008, 4, 4}) ->
    #{base_id => 1008, id => 4, quality => 4,
      need_exp => 540, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 170, showGrowth => 1348, score => 60,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1008, 5, 4}) ->
    #{base_id => 1008, id => 5, quality => 4,
      need_exp => 630, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 172, showGrowth => 1386, score => 60,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1008, 6, 4}) ->
    #{base_id => 1008, id => 6, quality => 4,
      need_exp => 660, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 102, showGrowth => 1424, score => 60,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1008, 7, 4}) ->
    #{base_id => 1008, id => 7, quality => 4,
      need_exp => 540, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 67, showGrowth => 1462, score => 60,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1008, 8, 4}) ->
    #{base_id => 1008, id => 8, quality => 4,
      need_exp => 360, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 38, showGrowth => 1500, score => 60,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1018, 1, 1}) ->
    #{base_id => 1018, id => 1, quality => 1,
      need_exp => 60, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 56, showGrowth => 556, score => 14,
      condition => [], cost => [{22400, 1}], attrs => []};
get_astroid({1018, 2, 1}) ->
    #{base_id => 1018, id => 2, quality => 1,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 56, showGrowth => 612, score => 14,
      condition => [], cost => [{22400, 1}], attrs => []};
get_astroid({1018, 3, 1}) ->
    #{base_id => 1018, id => 3, quality => 1,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 56, showGrowth => 668, score => 14,
      condition => [], cost => [{22400, 1}], attrs => []};
get_astroid({1018, 4, 1}) ->
    #{base_id => 1018, id => 4, quality => 1,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 56, showGrowth => 724, score => 14,
      condition => [], cost => [{22400, 2}], attrs => []};
get_astroid({1018, 5, 1}) ->
    #{base_id => 1018, id => 5, quality => 1,
      need_exp => 120, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 56, showGrowth => 780, score => 14,
      condition => [], cost => [{22400, 2}], attrs => []};
get_astroid({1018, 1, 2}) ->
    #{base_id => 1018, id => 1, quality => 2,
      need_exp => 120, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 92, showGrowth => 816, score => 27,
      condition => [], cost => [{22401, 1}], attrs => []};
get_astroid({1018, 2, 2}) ->
    #{base_id => 1018, id => 2, quality => 2,
      need_exp => 180, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 93, showGrowth => 853, score => 27,
      condition => [], cost => [{22401, 1}], attrs => []};
get_astroid({1018, 3, 2}) ->
    #{base_id => 1018, id => 3, quality => 2,
      need_exp => 180, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 93, showGrowth => 890, score => 27,
      condition => [], cost => [{22401, 1}], attrs => []};
get_astroid({1018, 4, 2}) ->
    #{base_id => 1018, id => 4, quality => 2,
      need_exp => 180, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 93, showGrowth => 927, score => 27,
      condition => [], cost => [{22401, 2}], attrs => []};
get_astroid({1018, 5, 2}) ->
    #{base_id => 1018, id => 5, quality => 2,
      need_exp => 210, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 93, showGrowth => 964, score => 27,
      condition => [], cost => [{22401, 2}], attrs => []};
get_astroid({1018, 6, 2}) ->
    #{base_id => 1018, id => 6, quality => 2,
      need_exp => 120, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 36, showGrowth => 1000, score => 27,
      condition => [], cost => [{22401, 2}], attrs => []};
get_astroid({1018, 1, 3}) ->
    #{base_id => 1018, id => 1, quality => 3,
      need_exp => 210, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 121, showGrowth => 1029, score => 42,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1018, 2, 3}) ->
    #{base_id => 1018, id => 2, quality => 3,
      need_exp => 270, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 121, showGrowth => 1057, score => 42,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1018, 3, 3}) ->
    #{base_id => 1018, id => 3, quality => 3,
      need_exp => 330, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 122, showGrowth => 1086, score => 42,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1018, 4, 3}) ->
    #{base_id => 1018, id => 4, quality => 3,
      need_exp => 330, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 121, showGrowth => 1114, score => 42,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1018, 5, 3}) ->
    #{base_id => 1018, id => 5, quality => 3,
      need_exp => 390, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 122, showGrowth => 1143, score => 42,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1018, 6, 3}) ->
    #{base_id => 1018, id => 6, quality => 3,
      need_exp => 360, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 64, showGrowth => 1171, score => 42,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1018, 7, 3}) ->
    #{base_id => 1018, id => 7, quality => 3,
      need_exp => 240, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 29, showGrowth => 1200, score => 42,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1018, 1, 4}) ->
    #{base_id => 1018, id => 1, quality => 4,
      need_exp => 300, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 158, showGrowth => 1237, score => 57,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1018, 2, 4}) ->
    #{base_id => 1018, id => 2, quality => 4,
      need_exp => 390, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 158, showGrowth => 1274, score => 57,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1018, 3, 4}) ->
    #{base_id => 1018, id => 3, quality => 4,
      need_exp => 510, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 159, showGrowth => 1311, score => 57,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1018, 4, 4}) ->
    #{base_id => 1018, id => 4, quality => 4,
      need_exp => 540, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 158, showGrowth => 1348, score => 57,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1018, 5, 4}) ->
    #{base_id => 1018, id => 5, quality => 4,
      need_exp => 630, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 160, showGrowth => 1386, score => 57,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1018, 6, 4}) ->
    #{base_id => 1018, id => 6, quality => 4,
      need_exp => 660, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 102, showGrowth => 1424, score => 57,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1018, 7, 4}) ->
    #{base_id => 1018, id => 7, quality => 4,
      need_exp => 540, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 67, showGrowth => 1462, score => 57,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1018, 8, 4}) ->
    #{base_id => 1018, id => 8, quality => 4,
      need_exp => 360, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 38, showGrowth => 1500, score => 57,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1020, 1, 2}) ->
    #{base_id => 1020, id => 1, quality => 2,
      need_exp => 60, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 53, showGrowth => 733, score => 23,
      condition => [], cost => [{22401, 1}], attrs => []};
get_astroid({1020, 2, 2}) ->
    #{base_id => 1020, id => 2, quality => 2,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 53, showGrowth => 786, score => 23,
      condition => [], cost => [{22401, 1}], attrs => []};
get_astroid({1020, 3, 2}) ->
    #{base_id => 1020, id => 3, quality => 2,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 54, showGrowth => 840, score => 23,
      condition => [], cost => [{22401, 1}], attrs => []};
get_astroid({1020, 4, 2}) ->
    #{base_id => 1020, id => 4, quality => 2,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 54, showGrowth => 894, score => 23,
      condition => [], cost => [{22401, 2}], attrs => []};
get_astroid({1020, 5, 2}) ->
    #{base_id => 1020, id => 5, quality => 2,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 53, showGrowth => 947, score => 23,
      condition => [], cost => [{22401, 2}], attrs => []};
get_astroid({1020, 6, 2}) ->
    #{base_id => 1020, id => 6, quality => 2,
      need_exp => 120, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 53, showGrowth => 1000, score => 23,
      condition => [], cost => [{22401, 2}], attrs => []};
get_astroid({1020, 1, 3}) ->
    #{base_id => 1020, id => 1, quality => 3,
      need_exp => 150, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 82, showGrowth => 1029, score => 39,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1020, 2, 3}) ->
    #{base_id => 1020, id => 2, quality => 3,
      need_exp => 180, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 81, showGrowth => 1057, score => 39,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1020, 3, 3}) ->
    #{base_id => 1020, id => 3, quality => 3,
      need_exp => 240, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 83, showGrowth => 1086, score => 39,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1020, 4, 3}) ->
    #{base_id => 1020, id => 4, quality => 3,
      need_exp => 240, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 82, showGrowth => 1114, score => 39,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1020, 5, 3}) ->
    #{base_id => 1020, id => 5, quality => 3,
      need_exp => 270, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 82, showGrowth => 1143, score => 39,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1020, 6, 3}) ->
    #{base_id => 1020, id => 6, quality => 3,
      need_exp => 360, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 81, showGrowth => 1171, score => 39,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1020, 7, 3}) ->
    #{base_id => 1020, id => 7, quality => 3,
      need_exp => 240, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 29, showGrowth => 1200, score => 39,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1020, 1, 4}) ->
    #{base_id => 1020, id => 1, quality => 4,
      need_exp => 240, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 119, showGrowth => 1237, score => 55,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1020, 2, 4}) ->
    #{base_id => 1020, id => 2, quality => 4,
      need_exp => 300, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 118, showGrowth => 1274, score => 55,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1020, 3, 4}) ->
    #{base_id => 1020, id => 3, quality => 4,
      need_exp => 420, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 120, showGrowth => 1311, score => 55,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1020, 4, 4}) ->
    #{base_id => 1020, id => 4, quality => 4,
      need_exp => 450, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 119, showGrowth => 1348, score => 55,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1020, 5, 4}) ->
    #{base_id => 1020, id => 5, quality => 4,
      need_exp => 510, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 120, showGrowth => 1386, score => 55,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1020, 6, 4}) ->
    #{base_id => 1020, id => 6, quality => 4,
      need_exp => 660, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 119, showGrowth => 1424, score => 55,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1020, 7, 4}) ->
    #{base_id => 1020, id => 7, quality => 4,
      need_exp => 540, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 67, showGrowth => 1462, score => 55,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1020, 8, 4}) ->
    #{base_id => 1020, id => 8, quality => 4,
      need_exp => 360, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 38, showGrowth => 1500, score => 55,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1014, 1, 2}) ->
    #{base_id => 1014, id => 1, quality => 2,
      need_exp => 60, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 53, showGrowth => 733, score => 19,
      condition => [], cost => [{22401, 1}], attrs => []};
get_astroid({1014, 2, 2}) ->
    #{base_id => 1014, id => 2, quality => 2,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 53, showGrowth => 786, score => 19,
      condition => [], cost => [{22401, 1}], attrs => []};
get_astroid({1014, 3, 2}) ->
    #{base_id => 1014, id => 3, quality => 2,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 54, showGrowth => 840, score => 19,
      condition => [], cost => [{22401, 1}], attrs => []};
get_astroid({1014, 4, 2}) ->
    #{base_id => 1014, id => 4, quality => 2,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 54, showGrowth => 894, score => 19,
      condition => [], cost => [{22401, 2}], attrs => []};
get_astroid({1014, 5, 2}) ->
    #{base_id => 1014, id => 5, quality => 2,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 53, showGrowth => 947, score => 19,
      condition => [], cost => [{22401, 2}], attrs => []};
get_astroid({1014, 6, 2}) ->
    #{base_id => 1014, id => 6, quality => 2,
      need_exp => 120, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 53, showGrowth => 1000, score => 19,
      condition => [], cost => [{22401, 2}], attrs => []};
get_astroid({1014, 1, 3}) ->
    #{base_id => 1014, id => 1, quality => 3,
      need_exp => 150, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 82, showGrowth => 1029, score => 35,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1014, 2, 3}) ->
    #{base_id => 1014, id => 2, quality => 3,
      need_exp => 180, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 81, showGrowth => 1057, score => 35,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1014, 3, 3}) ->
    #{base_id => 1014, id => 3, quality => 3,
      need_exp => 240, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 83, showGrowth => 1086, score => 35,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1014, 4, 3}) ->
    #{base_id => 1014, id => 4, quality => 3,
      need_exp => 240, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 82, showGrowth => 1114, score => 35,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1014, 5, 3}) ->
    #{base_id => 1014, id => 5, quality => 3,
      need_exp => 270, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 82, showGrowth => 1143, score => 35,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1014, 6, 3}) ->
    #{base_id => 1014, id => 6, quality => 3,
      need_exp => 360, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 81, showGrowth => 1171, score => 35,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1014, 7, 3}) ->
    #{base_id => 1014, id => 7, quality => 3,
      need_exp => 240, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 29, showGrowth => 1200, score => 35,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1014, 1, 4}) ->
    #{base_id => 1014, id => 1, quality => 4,
      need_exp => 240, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 119, showGrowth => 1237, score => 51,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1014, 2, 4}) ->
    #{base_id => 1014, id => 2, quality => 4,
      need_exp => 300, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 118, showGrowth => 1274, score => 51,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1014, 3, 4}) ->
    #{base_id => 1014, id => 3, quality => 4,
      need_exp => 420, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 120, showGrowth => 1311, score => 51,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1014, 4, 4}) ->
    #{base_id => 1014, id => 4, quality => 4,
      need_exp => 450, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 119, showGrowth => 1348, score => 51,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1014, 5, 4}) ->
    #{base_id => 1014, id => 5, quality => 4,
      need_exp => 510, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 120, showGrowth => 1386, score => 51,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1014, 6, 4}) ->
    #{base_id => 1014, id => 6, quality => 4,
      need_exp => 660, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 119, showGrowth => 1424, score => 51,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1014, 7, 4}) ->
    #{base_id => 1014, id => 7, quality => 4,
      need_exp => 540, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 67, showGrowth => 1462, score => 51,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1014, 8, 4}) ->
    #{base_id => 1014, id => 8, quality => 4,
      need_exp => 360, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 38, showGrowth => 1500, score => 51,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1010, 1, 2}) ->
    #{base_id => 1010, id => 1, quality => 2,
      need_exp => 60, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 36, showGrowth => 816, score => 15,
      condition => [], cost => [{22401, 1}], attrs => []};
get_astroid({1010, 2, 2}) ->
    #{base_id => 1010, id => 2, quality => 2,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 37, showGrowth => 853, score => 15,
      condition => [], cost => [{22401, 1}], attrs => []};
get_astroid({1010, 3, 2}) ->
    #{base_id => 1010, id => 3, quality => 2,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 37, showGrowth => 890, score => 15,
      condition => [], cost => [{22401, 1}], attrs => []};
get_astroid({1010, 4, 2}) ->
    #{base_id => 1010, id => 4, quality => 2,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 37, showGrowth => 927, score => 15,
      condition => [], cost => [{22401, 2}], attrs => []};
get_astroid({1010, 5, 2}) ->
    #{base_id => 1010, id => 5, quality => 2,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 37, showGrowth => 964, score => 15,
      condition => [], cost => [{22401, 2}], attrs => []};
get_astroid({1010, 6, 2}) ->
    #{base_id => 1010, id => 6, quality => 2,
      need_exp => 120, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 36, showGrowth => 1000, score => 15,
      condition => [], cost => [{22401, 2}], attrs => []};
get_astroid({1010, 1, 3}) ->
    #{base_id => 1010, id => 1, quality => 3,
      need_exp => 150, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 65, showGrowth => 1029, score => 32,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1010, 2, 3}) ->
    #{base_id => 1010, id => 2, quality => 3,
      need_exp => 180, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 65, showGrowth => 1057, score => 32,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1010, 3, 3}) ->
    #{base_id => 1010, id => 3, quality => 3,
      need_exp => 240, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 66, showGrowth => 1086, score => 32,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1010, 4, 3}) ->
    #{base_id => 1010, id => 4, quality => 3,
      need_exp => 240, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 65, showGrowth => 1114, score => 32,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1010, 5, 3}) ->
    #{base_id => 1010, id => 5, quality => 3,
      need_exp => 270, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 66, showGrowth => 1143, score => 32,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1010, 6, 3}) ->
    #{base_id => 1010, id => 6, quality => 3,
      need_exp => 360, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 64, showGrowth => 1171, score => 32,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1010, 7, 3}) ->
    #{base_id => 1010, id => 7, quality => 3,
      need_exp => 240, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 29, showGrowth => 1200, score => 32,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1010, 1, 4}) ->
    #{base_id => 1010, id => 1, quality => 4,
      need_exp => 240, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 102, showGrowth => 1237, score => 49,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1010, 2, 4}) ->
    #{base_id => 1010, id => 2, quality => 4,
      need_exp => 300, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 102, showGrowth => 1274, score => 49,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1010, 3, 4}) ->
    #{base_id => 1010, id => 3, quality => 4,
      need_exp => 420, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 103, showGrowth => 1311, score => 49,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1010, 4, 4}) ->
    #{base_id => 1010, id => 4, quality => 4,
      need_exp => 450, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 102, showGrowth => 1348, score => 49,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1010, 5, 4}) ->
    #{base_id => 1010, id => 5, quality => 4,
      need_exp => 510, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 104, showGrowth => 1386, score => 49,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1010, 6, 4}) ->
    #{base_id => 1010, id => 6, quality => 4,
      need_exp => 660, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 102, showGrowth => 1424, score => 49,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1010, 7, 4}) ->
    #{base_id => 1010, id => 7, quality => 4,
      need_exp => 540, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 67, showGrowth => 1462, score => 49,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1010, 8, 4}) ->
    #{base_id => 1010, id => 8, quality => 4,
      need_exp => 360, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 38, showGrowth => 1500, score => 49,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1019, 1, 2}) ->
    #{base_id => 1019, id => 1, quality => 2,
      need_exp => 60, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 36, showGrowth => 816, score => 11,
      condition => [], cost => [{22401, 1}], attrs => []};
get_astroid({1019, 2, 2}) ->
    #{base_id => 1019, id => 2, quality => 2,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 37, showGrowth => 853, score => 11,
      condition => [], cost => [{22401, 1}], attrs => []};
get_astroid({1019, 3, 2}) ->
    #{base_id => 1019, id => 3, quality => 2,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 37, showGrowth => 890, score => 11,
      condition => [], cost => [{22401, 1}], attrs => []};
get_astroid({1019, 4, 2}) ->
    #{base_id => 1019, id => 4, quality => 2,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 37, showGrowth => 927, score => 11,
      condition => [], cost => [{22401, 2}], attrs => []};
get_astroid({1019, 5, 2}) ->
    #{base_id => 1019, id => 5, quality => 2,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 37, showGrowth => 964, score => 11,
      condition => [], cost => [{22401, 2}], attrs => []};
get_astroid({1019, 6, 2}) ->
    #{base_id => 1019, id => 6, quality => 2,
      need_exp => 120, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 36, showGrowth => 1000, score => 11,
      condition => [], cost => [{22401, 2}], attrs => []};
get_astroid({1019, 1, 3}) ->
    #{base_id => 1019, id => 1, quality => 3,
      need_exp => 150, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 65, showGrowth => 1029, score => 28,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1019, 2, 3}) ->
    #{base_id => 1019, id => 2, quality => 3,
      need_exp => 180, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 65, showGrowth => 1057, score => 28,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1019, 3, 3}) ->
    #{base_id => 1019, id => 3, quality => 3,
      need_exp => 240, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 66, showGrowth => 1086, score => 28,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1019, 4, 3}) ->
    #{base_id => 1019, id => 4, quality => 3,
      need_exp => 240, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 65, showGrowth => 1114, score => 28,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1019, 5, 3}) ->
    #{base_id => 1019, id => 5, quality => 3,
      need_exp => 270, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 66, showGrowth => 1143, score => 28,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1019, 6, 3}) ->
    #{base_id => 1019, id => 6, quality => 3,
      need_exp => 360, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 64, showGrowth => 1171, score => 28,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1019, 7, 3}) ->
    #{base_id => 1019, id => 7, quality => 3,
      need_exp => 240, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 29, showGrowth => 1200, score => 28,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1019, 1, 4}) ->
    #{base_id => 1019, id => 1, quality => 4,
      need_exp => 240, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 102, showGrowth => 1237, score => 45,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1019, 2, 4}) ->
    #{base_id => 1019, id => 2, quality => 4,
      need_exp => 300, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 102, showGrowth => 1274, score => 45,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1019, 3, 4}) ->
    #{base_id => 1019, id => 3, quality => 4,
      need_exp => 420, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 103, showGrowth => 1311, score => 45,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1019, 4, 4}) ->
    #{base_id => 1019, id => 4, quality => 4,
      need_exp => 450, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 102, showGrowth => 1348, score => 45,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1019, 5, 4}) ->
    #{base_id => 1019, id => 5, quality => 4,
      need_exp => 510, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 104, showGrowth => 1386, score => 45,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1019, 6, 4}) ->
    #{base_id => 1019, id => 6, quality => 4,
      need_exp => 660, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 102, showGrowth => 1424, score => 45,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1019, 7, 4}) ->
    #{base_id => 1019, id => 7, quality => 4,
      need_exp => 540, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 67, showGrowth => 1462, score => 45,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1019, 8, 4}) ->
    #{base_id => 1019, id => 8, quality => 4,
      need_exp => 360, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 38, showGrowth => 1500, score => 45,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1023, 1, 3}) ->
    #{base_id => 1023, id => 1, quality => 3,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 45, showGrowth => 925, score => 25,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1023, 2, 3}) ->
    #{base_id => 1023, id => 2, quality => 3,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 46, showGrowth => 971, score => 25,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1023, 3, 3}) ->
    #{base_id => 1023, id => 3, quality => 3,
      need_exp => 150, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 46, showGrowth => 1017, score => 25,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1023, 4, 3}) ->
    #{base_id => 1023, id => 4, quality => 3,
      need_exp => 150, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 46, showGrowth => 1063, score => 25,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1023, 5, 3}) ->
    #{base_id => 1023, id => 5, quality => 3,
      need_exp => 180, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 46, showGrowth => 1109, score => 25,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1023, 6, 3}) ->
    #{base_id => 1023, id => 6, quality => 3,
      need_exp => 240, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 46, showGrowth => 1155, score => 25,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1023, 7, 3}) ->
    #{base_id => 1023, id => 7, quality => 3,
      need_exp => 240, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 45, showGrowth => 1200, score => 25,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1023, 1, 4}) ->
    #{base_id => 1023, id => 1, quality => 4,
      need_exp => 180, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 82, showGrowth => 1237, score => 50,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1023, 2, 4}) ->
    #{base_id => 1023, id => 2, quality => 4,
      need_exp => 210, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 83, showGrowth => 1274, score => 50,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1023, 3, 4}) ->
    #{base_id => 1023, id => 3, quality => 4,
      need_exp => 330, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 83, showGrowth => 1311, score => 50,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1023, 4, 4}) ->
    #{base_id => 1023, id => 4, quality => 4,
      need_exp => 360, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 83, showGrowth => 1348, score => 50,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1023, 5, 4}) ->
    #{base_id => 1023, id => 5, quality => 4,
      need_exp => 420, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 84, showGrowth => 1386, score => 50,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1023, 6, 4}) ->
    #{base_id => 1023, id => 6, quality => 4,
      need_exp => 540, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 84, showGrowth => 1424, score => 50,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1023, 7, 4}) ->
    #{base_id => 1023, id => 7, quality => 4,
      need_exp => 540, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 83, showGrowth => 1462, score => 50,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1023, 8, 4}) ->
    #{base_id => 1023, id => 8, quality => 4,
      need_exp => 360, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 38, showGrowth => 1500, score => 50,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1013, 1, 3}) ->
    #{base_id => 1013, id => 1, quality => 3,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 45, showGrowth => 925, score => 22,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1013, 2, 3}) ->
    #{base_id => 1013, id => 2, quality => 3,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 46, showGrowth => 971, score => 22,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1013, 3, 3}) ->
    #{base_id => 1013, id => 3, quality => 3,
      need_exp => 150, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 46, showGrowth => 1017, score => 22,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1013, 4, 3}) ->
    #{base_id => 1013, id => 4, quality => 3,
      need_exp => 150, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 46, showGrowth => 1063, score => 22,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1013, 5, 3}) ->
    #{base_id => 1013, id => 5, quality => 3,
      need_exp => 180, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 46, showGrowth => 1109, score => 22,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1013, 6, 3}) ->
    #{base_id => 1013, id => 6, quality => 3,
      need_exp => 240, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 46, showGrowth => 1155, score => 22,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1013, 7, 3}) ->
    #{base_id => 1013, id => 7, quality => 3,
      need_exp => 240, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 45, showGrowth => 1200, score => 22,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1013, 1, 4}) ->
    #{base_id => 1013, id => 1, quality => 4,
      need_exp => 180, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 82, showGrowth => 1237, score => 44,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1013, 2, 4}) ->
    #{base_id => 1013, id => 2, quality => 4,
      need_exp => 210, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 83, showGrowth => 1274, score => 44,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1013, 3, 4}) ->
    #{base_id => 1013, id => 3, quality => 4,
      need_exp => 330, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 83, showGrowth => 1311, score => 44,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1013, 4, 4}) ->
    #{base_id => 1013, id => 4, quality => 4,
      need_exp => 360, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 83, showGrowth => 1348, score => 44,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1013, 5, 4}) ->
    #{base_id => 1013, id => 5, quality => 4,
      need_exp => 420, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 84, showGrowth => 1386, score => 44,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1013, 6, 4}) ->
    #{base_id => 1013, id => 6, quality => 4,
      need_exp => 540, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 84, showGrowth => 1424, score => 44,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1013, 7, 4}) ->
    #{base_id => 1013, id => 7, quality => 4,
      need_exp => 540, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 83, showGrowth => 1462, score => 44,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1013, 8, 4}) ->
    #{base_id => 1013, id => 8, quality => 4,
      need_exp => 360, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 38, showGrowth => 1500, score => 44,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1006, 1, 3}) ->
    #{base_id => 1006, id => 1, quality => 3,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 29, showGrowth => 1029, score => 17,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1006, 2, 3}) ->
    #{base_id => 1006, id => 2, quality => 3,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 28, showGrowth => 1057, score => 17,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1006, 3, 3}) ->
    #{base_id => 1006, id => 3, quality => 3,
      need_exp => 150, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 29, showGrowth => 1086, score => 17,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1006, 4, 3}) ->
    #{base_id => 1006, id => 4, quality => 3,
      need_exp => 150, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 28, showGrowth => 1114, score => 17,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1006, 5, 3}) ->
    #{base_id => 1006, id => 5, quality => 3,
      need_exp => 180, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 29, showGrowth => 1143, score => 17,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1006, 6, 3}) ->
    #{base_id => 1006, id => 6, quality => 3,
      need_exp => 240, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 28, showGrowth => 1171, score => 17,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1006, 7, 3}) ->
    #{base_id => 1006, id => 7, quality => 3,
      need_exp => 240, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 29, showGrowth => 1200, score => 17,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1006, 1, 4}) ->
    #{base_id => 1006, id => 1, quality => 4,
      need_exp => 180, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 66, showGrowth => 1237, score => 34,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1006, 2, 4}) ->
    #{base_id => 1006, id => 2, quality => 4,
      need_exp => 210, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 65, showGrowth => 1274, score => 34,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1006, 3, 4}) ->
    #{base_id => 1006, id => 3, quality => 4,
      need_exp => 330, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 66, showGrowth => 1311, score => 34,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1006, 4, 4}) ->
    #{base_id => 1006, id => 4, quality => 4,
      need_exp => 360, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 65, showGrowth => 1348, score => 34,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1006, 5, 4}) ->
    #{base_id => 1006, id => 5, quality => 4,
      need_exp => 420, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 67, showGrowth => 1386, score => 34,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1006, 6, 4}) ->
    #{base_id => 1006, id => 6, quality => 4,
      need_exp => 540, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 66, showGrowth => 1424, score => 34,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1006, 7, 4}) ->
    #{base_id => 1006, id => 7, quality => 4,
      need_exp => 540, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 67, showGrowth => 1462, score => 34,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1006, 8, 4}) ->
    #{base_id => 1006, id => 8, quality => 4,
      need_exp => 360, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 38, showGrowth => 1500, score => 34,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1021, 1, 3}) ->
    #{base_id => 1021, id => 1, quality => 3,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 29, showGrowth => 1029, score => 17,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1021, 2, 3}) ->
    #{base_id => 1021, id => 2, quality => 3,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 28, showGrowth => 1057, score => 17,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1021, 3, 3}) ->
    #{base_id => 1021, id => 3, quality => 3,
      need_exp => 150, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 29, showGrowth => 1086, score => 17,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1021, 4, 3}) ->
    #{base_id => 1021, id => 4, quality => 3,
      need_exp => 150, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 28, showGrowth => 1114, score => 17,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1021, 5, 3}) ->
    #{base_id => 1021, id => 5, quality => 3,
      need_exp => 180, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 29, showGrowth => 1143, score => 17,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1021, 6, 3}) ->
    #{base_id => 1021, id => 6, quality => 3,
      need_exp => 240, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 28, showGrowth => 1171, score => 17,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1021, 7, 3}) ->
    #{base_id => 1021, id => 7, quality => 3,
      need_exp => 240, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 29, showGrowth => 1200, score => 17,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1021, 1, 4}) ->
    #{base_id => 1021, id => 1, quality => 4,
      need_exp => 180, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 66, showGrowth => 1237, score => 34,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1021, 2, 4}) ->
    #{base_id => 1021, id => 2, quality => 4,
      need_exp => 210, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 65, showGrowth => 1274, score => 34,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1021, 3, 4}) ->
    #{base_id => 1021, id => 3, quality => 4,
      need_exp => 330, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 66, showGrowth => 1311, score => 34,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1021, 4, 4}) ->
    #{base_id => 1021, id => 4, quality => 4,
      need_exp => 360, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 65, showGrowth => 1348, score => 34,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1021, 5, 4}) ->
    #{base_id => 1021, id => 5, quality => 4,
      need_exp => 420, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 67, showGrowth => 1386, score => 34,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1021, 6, 4}) ->
    #{base_id => 1021, id => 6, quality => 4,
      need_exp => 540, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 66, showGrowth => 1424, score => 34,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1021, 7, 4}) ->
    #{base_id => 1021, id => 7, quality => 4,
      need_exp => 540, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 67, showGrowth => 1462, score => 34,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1021, 8, 4}) ->
    #{base_id => 1021, id => 8, quality => 4,
      need_exp => 360, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 38, showGrowth => 1500, score => 34,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1022, 1, 3}) ->
    #{base_id => 1022, id => 1, quality => 3,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 29, showGrowth => 1029, score => 17,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1022, 2, 3}) ->
    #{base_id => 1022, id => 2, quality => 3,
      need_exp => 90, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 28, showGrowth => 1057, score => 17,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1022, 3, 3}) ->
    #{base_id => 1022, id => 3, quality => 3,
      need_exp => 150, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 29, showGrowth => 1086, score => 17,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1022, 4, 3}) ->
    #{base_id => 1022, id => 4, quality => 3,
      need_exp => 150, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 28, showGrowth => 1114, score => 17,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1022, 5, 3}) ->
    #{base_id => 1022, id => 5, quality => 3,
      need_exp => 180, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 29, showGrowth => 1143, score => 17,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1022, 6, 3}) ->
    #{base_id => 1022, id => 6, quality => 3,
      need_exp => 240, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 28, showGrowth => 1171, score => 17,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1022, 7, 3}) ->
    #{base_id => 1022, id => 7, quality => 3,
      need_exp => 240, add_exp => 15,
      multi_odds =>
          [{1, 340}, {2, 490}, {3, 110}, {5, 50}, {99, 10}],
      growth => 29, showGrowth => 1200, score => 17,
      condition => [], cost => [{22402, 1}], attrs => []};
get_astroid({1022, 1, 4}) ->
    #{base_id => 1022, id => 1, quality => 4,
      need_exp => 180, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 66, showGrowth => 1237, score => 34,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1022, 2, 4}) ->
    #{base_id => 1022, id => 2, quality => 4,
      need_exp => 210, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 65, showGrowth => 1274, score => 34,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1022, 3, 4}) ->
    #{base_id => 1022, id => 3, quality => 4,
      need_exp => 330, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 66, showGrowth => 1311, score => 34,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1022, 4, 4}) ->
    #{base_id => 1022, id => 4, quality => 4,
      need_exp => 360, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 65, showGrowth => 1348, score => 34,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1022, 5, 4}) ->
    #{base_id => 1022, id => 5, quality => 4,
      need_exp => 420, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 67, showGrowth => 1386, score => 34,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1022, 6, 4}) ->
    #{base_id => 1022, id => 6, quality => 4,
      need_exp => 540, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 66, showGrowth => 1424, score => 34,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1022, 7, 4}) ->
    #{base_id => 1022, id => 7, quality => 4,
      need_exp => 540, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 67, showGrowth => 1462, score => 34,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid({1022, 8, 4}) ->
    #{base_id => 1022, id => 8, quality => 4,
      need_exp => 360, add_exp => 15,
      multi_odds =>
          [{1, 520}, {2, 340}, {3, 80}, {5, 50}, {99, 10}],
      growth => 38, showGrowth => 1500, score => 34,
      condition => [], cost => [{22402, 2}], attrs => []};
get_astroid(_) -> false.

get_astroid_upgrade({1002, 2}) ->
    #{base_id => 1002, quality => 2, need_num => 5,
      model => 0, condition => [], cost => [{22400, 10}],
      attrs => [], role_attrs => [{6, 0, 22}],
      skills => [{61009, 0}, {62000, 0}], fc => 15,
      score => 30};
get_astroid_upgrade({1002, 3}) ->
    #{base_id => 1002, quality => 3, need_num => 6,
      model => 11102, skin => 11102, animation => 1100201,
      condition => [], cost => [{22401, 10}], attrs => [],
      role_attrs => [{6, 0, 22}, {1, 0, 144}],
      skills => [{61009, 0}, {61010, 0}, {62000, 0}],
      fc => 35, score => 42};
get_astroid_upgrade({1002, 4}) ->
    #{base_id => 1002, quality => 4, need_num => 7,
      model => 11102, skin => 11102, animation => 1100201,
      condition => [], cost => [{22402, 10}], attrs => [],
      role_attrs =>
          [{6, 0, 22},
           {1, 0, 144},
           {4, 1, 47},
           {5, 2, 37},
           {4, 3, 47},
           {3, 4, 11},
           {43, 5, 31},
           {5, 6, 37},
           {4, 7, 47}],
      skills =>
          [{61009, 0}, {61010, 0}, {61011, 0}, {62000, 0}],
      fc => 60, score => 56};
get_astroid_upgrade({1002, 5}) ->
    #{base_id => 1002, quality => 5, need_num => 8,
      model => 11102, skin => 11102, animation => 1100201,
      condition => [], cost => [{22402, 20}], attrs => [],
      role_attrs =>
          [{6, 0, 22},
           {1, 0, 144},
           {4, 1, 94},
           {5, 2, 74},
           {4, 3, 94},
           {3, 4, 22},
           {43, 5, 62},
           {5, 6, 74},
           {4, 7, 94}],
      skills =>
          [{61009, 0}, {61010, 0}, {61011, 0}, {62000, 0}],
      fc => 85, score => 80};
get_astroid_upgrade({1012, 2}) ->
    #{base_id => 1012, quality => 2, need_num => 5,
      model => 0, condition => [], cost => [{22400, 10}],
      attrs => [], role_attrs => [{7, 0, 17}],
      skills => [{61062, 0}], fc => 15, score => 28};
get_astroid_upgrade({1012, 3}) ->
    #{base_id => 1012, quality => 3, need_num => 6,
      model => 11112, skin => 11112, animation => 2000007,
      condition => [], cost => [{22401, 10}], attrs => [],
      role_attrs =>
          [{7, 0, 17},
           {4, 1, 42},
           {5, 2, 34},
           {4, 3, 42},
           {3, 4, 10},
           {43, 5, 28},
           {5, 6, 34},
           {4, 7, 42}],
      skills => [{61062, 0}, {61063, 61068}, {61069, 0}],
      fc => 35, score => 39};
get_astroid_upgrade({1012, 4}) ->
    #{base_id => 1012, quality => 4, need_num => 7,
      model => 11112, skin => 11112, animation => 2000007,
      condition => [], cost => [{22402, 10}], attrs => [],
      role_attrs =>
          [{7, 0, 17},
           {4, 1, 42},
           {5, 2, 34},
           {4, 3, 42},
           {3, 4, 10},
           {43, 5, 28},
           {5, 6, 34},
           {4, 7, 42},
           {1, 0, 158}],
      skills =>
          [{61062, 0}, {61063, 61068}, {61061, 0}, {61069, 0}],
      fc => 60, score => 50};
get_astroid_upgrade({1012, 5}) ->
    #{base_id => 1012, quality => 5, need_num => 8,
      model => 11112, skin => 11112, animation => 2000007,
      condition => [], cost => [{22402, 20}], attrs => [],
      role_attrs =>
          [{7, 0, 17},
           {4, 1, 42},
           {5, 2, 34},
           {4, 3, 42},
           {3, 4, 10},
           {43, 5, 28},
           {5, 6, 34},
           {4, 7, 42},
           {1, 0, 316}],
      skills =>
          [{61062, 0}, {61063, 61068}, {61061, 0}, {61069, 0}],
      fc => 85, score => 80};
get_astroid_upgrade({1008, 2}) ->
    #{base_id => 1008, quality => 2, need_num => 5,
      model => 0, condition => [], cost => [{22400, 10}],
      attrs => [],
      role_attrs =>
          [{4, 1, 42},
           {5, 2, 34},
           {4, 3, 42},
           {3, 4, 10},
           {43, 5, 28},
           {5, 6, 34},
           {4, 7, 42}],
      skills => [{61046, 61041}], fc => 15, score => 21};
get_astroid_upgrade({1008, 3}) ->
    #{base_id => 1008, quality => 3, need_num => 6,
      model => 11108, skin => 11108, animation => 1100103,
      condition => [], cost => [{22401, 10}], attrs => [],
      role_attrs =>
          [{4, 1, 42},
           {5, 2, 34},
           {4, 3, 42},
           {3, 4, 10},
           {43, 5, 28},
           {5, 6, 34},
           {4, 7, 42},
           {7, 0, 17}],
      skills => [{61046, 61041}, {61047, 0}], fc => 35,
      score => 36};
get_astroid_upgrade({1008, 4}) ->
    #{base_id => 1008, quality => 4, need_num => 7,
      model => 11108, skin => 11108, animation => 1100103,
      condition => [], cost => [{22402, 10}], attrs => [],
      role_attrs =>
          [{4, 1, 42},
           {5, 2, 34},
           {4, 3, 42},
           {3, 4, 10},
           {43, 5, 28},
           {5, 6, 34},
           {4, 7, 42},
           {7, 0, 17},
           {6, 0, 24}],
      skills => [{61046, 61041}, {61047, 0}, {61045, 0}],
      fc => 60, score => 51};
get_astroid_upgrade({1008, 5}) ->
    #{base_id => 1008, quality => 5, need_num => 8,
      model => 11108, skin => 11108, animation => 1100103,
      condition => [], cost => [{22402, 20}], attrs => [],
      role_attrs =>
          [{4, 1, 42},
           {5, 2, 34},
           {4, 3, 42},
           {3, 4, 10},
           {43, 5, 28},
           {5, 6, 34},
           {4, 7, 42},
           {7, 0, 17},
           {6, 0, 48}],
      skills => [{61046, 61041}, {61047, 0}, {61045, 0}],
      fc => 85, score => 66};
get_astroid_upgrade({1018, 2}) ->
    #{base_id => 1018, quality => 2, need_num => 5,
      model => 0, condition => [], cost => [{22400, 10}],
      attrs => [], role_attrs => [{1, 0, 144}],
      skills => [{63107, 0}], fc => 15, score => 19};
get_astroid_upgrade({1018, 3}) ->
    #{base_id => 1018, quality => 3, need_num => 6,
      model => 11118, skin => 11118, animation => 1101801,
      condition => [], cost => [{22401, 10}], attrs => [],
      role_attrs => [{1, 0, 144}, {6, 0, 22}],
      skills => [{63107, 0}, {61106, 61102}], fc => 35,
      score => 27};
get_astroid_upgrade({1018, 4}) ->
    #{base_id => 1018, quality => 4, need_num => 7,
      model => 11118, skin => 11118, animation => 1101801,
      condition => [], cost => [{22402, 10}], attrs => [],
      role_attrs => [{1, 0, 144}, {6, 0, 22}, {7, 0, 19}],
      skills => [{63107, 0}, {61106, 61102}, {63108, 0}],
      fc => 60, score => 45};
get_astroid_upgrade({1018, 5}) ->
    #{base_id => 1018, quality => 5, need_num => 8,
      model => 11118, skin => 11118, animation => 1101801,
      condition => [], cost => [{22402, 20}], attrs => [],
      role_attrs => [{1, 0, 144}, {6, 0, 22}, {7, 0, 38}],
      skills => [{63107, 0}, {61106, 61102}, {63108, 0}],
      fc => 85, score => 63};
get_astroid_upgrade({1020, 3}) ->
    #{base_id => 1020, quality => 3, need_num => 6,
      model => 11120, skin => 11120, animation => 1102001,
      condition => [], cost => [{22401, 10}], attrs => [],
      role_attrs => [{1, 0, 144}],
      skills => [{63118, 61116}, {62012, 0}], fc => 20,
      score => 24};
get_astroid_upgrade({1020, 4}) ->
    #{base_id => 1020, quality => 4, need_num => 7,
      model => 11120, skin => 11120, animation => 1102001,
      condition => [], cost => [{22402, 10}], attrs => [],
      role_attrs => [{1, 0, 144}, {6, 0, 24}],
      skills => [{63118, 61116}, {63117, 0}, {62012, 0}],
      fc => 45, score => 39};
get_astroid_upgrade({1020, 5}) ->
    #{base_id => 1020, quality => 5, need_num => 8,
      model => 11120, skin => 11120, animation => 1102001,
      condition => [], cost => [{22402, 20}], attrs => [],
      role_attrs => [{1, 0, 144}, {6, 0, 48}],
      skills => [{63118, 61116}, {63117, 0}, {62012, 0}],
      fc => 70, score => 54};
get_astroid_upgrade({1014, 3}) ->
    #{base_id => 1014, quality => 3, need_num => 6,
      model => 11114, skin => 11114, animation => 2001402,
      condition => [], cost => [{22401, 10}], attrs => [],
      role_attrs => [{6, 0, 22}], skills => [{61080, 0}],
      fc => 20, score => 21};
get_astroid_upgrade({1014, 4}) ->
    #{base_id => 1014, quality => 4, need_num => 7,
      model => 11114, skin => 11114, animation => 2001402,
      condition => [], cost => [{22402, 10}], attrs => [],
      role_attrs => [{6, 0, 22}, {7, 0, 19}],
      skills => [{61080, 0}, {63081, 61077}], fc => 45,
      score => 40};
get_astroid_upgrade({1014, 5}) ->
    #{base_id => 1014, quality => 5, need_num => 8,
      model => 11114, skin => 11114, animation => 2001402,
      condition => [], cost => [{22402, 20}], attrs => [],
      role_attrs => [{6, 0, 22}, {7, 0, 38}],
      skills => [{61080, 0}, {63081, 61077}], fc => 70,
      score => 59};
get_astroid_upgrade({1010, 3}) ->
    #{base_id => 1010, quality => 3, need_num => 6,
      model => 11110, skin => 11110, animation => 1100104,
      condition => [], cost => [{22401, 10}], attrs => [],
      role_attrs => [{7, 0, 17}],
      skills => [{61057, 0}, {62016, 0}], fc => 20,
      score => 18};
get_astroid_upgrade({1010, 4}) ->
    #{base_id => 1010, quality => 4, need_num => 7,
      model => 11110, skin => 11110, animation => 1100104,
      condition => [], cost => [{22402, 10}], attrs => [],
      role_attrs =>
          [{7, 0, 17},
           {4, 1, 47},
           {5, 2, 37},
           {4, 3, 47},
           {3, 4, 11},
           {43, 5, 31},
           {5, 6, 37},
           {4, 7, 47}],
      skills => [{61057, 0}, {61058, 0}, {62016, 0}],
      fc => 45, score => 34};
get_astroid_upgrade({1010, 5}) ->
    #{base_id => 1010, quality => 5, need_num => 8,
      model => 11110, skin => 11110, animation => 1100104,
      condition => [], cost => [{22402, 20}], attrs => [],
      role_attrs =>
          [{7, 0, 17},
           {4, 1, 94},
           {5, 2, 74},
           {4, 3, 74},
           {3, 4, 22},
           {43, 5, 62},
           {5, 6, 74},
           {4, 7, 94}],
      skills => [{61057, 0}, {61058, 0}, {62016, 0}],
      fc => 70, score => 50};
get_astroid_upgrade({1019, 3}) ->
    #{base_id => 1019, quality => 3, need_num => 6,
      model => 11119, skin => 11119, animation => 3001907,
      condition => [], cost => [{22401, 10}], attrs => [],
      role_attrs =>
          [{4, 1, 42},
           {5, 2, 34},
           {4, 3, 42},
           {3, 4, 10},
           {43, 5, 28},
           {5, 6, 34},
           {4, 7, 42}],
      skills => [{61111, 63109}, {62018, 0}], fc => 20,
      score => 15};
get_astroid_upgrade({1019, 4}) ->
    #{base_id => 1019, quality => 4, need_num => 7,
      model => 11119, skin => 11119, animation => 3001907,
      condition => [], cost => [{22402, 10}], attrs => [],
      role_attrs =>
          [{4, 1, 42},
           {5, 2, 34},
           {4, 3, 42},
           {3, 4, 10},
           {43, 5, 28},
           {5, 6, 34},
           {4, 7, 42},
           {1, 0, 158}],
      skills => [{61111, 63109}, {63112, 0}, {62018, 0}],
      fc => 45, score => 35};
get_astroid_upgrade({1019, 5}) ->
    #{base_id => 1019, quality => 5, need_num => 8,
      model => 11119, skin => 11119, animation => 3001907,
      condition => [], cost => [{22402, 20}], attrs => [],
      role_attrs =>
          [{4, 1, 42},
           {5, 2, 34},
           {4, 3, 42},
           {3, 4, 10},
           {43, 5, 28},
           {5, 6, 34},
           {4, 7, 42},
           {1, 0, 316}],
      skills => [{61111, 63109}, {63112, 0}, {62018, 0}],
      fc => 70, score => 55};
get_astroid_upgrade({1023, 4}) ->
    #{base_id => 1023, quality => 4, need_num => 7,
      model => 11123, skin => 11123, animation => 1102301,
      condition => [], cost => [{22402, 10}], attrs => [],
      role_attrs => [{2, 0, 338}],
      skills => [{61130, 0}, {62020, 0}], fc => 25,
      score => 29};
get_astroid_upgrade({1023, 5}) ->
    #{base_id => 1023, quality => 5, need_num => 8,
      model => 11123, skin => 11123, animation => 1102301,
      condition => [], cost => [{22402, 20}], attrs => [],
      role_attrs => [{2, 0, 676}],
      skills => [{61130, 0}, {62020, 0}], fc => 50,
      score => 58};
get_astroid_upgrade({1013, 4}) ->
    #{base_id => 1013, quality => 4, need_num => 7,
      model => 11115, skin => 11115, animation => 1100106,
      condition => [], cost => [{22402, 10}], attrs => [],
      role_attrs => [{7, 0, 19}], skills => [{61074, 61071}],
      fc => 25, score => 23};
get_astroid_upgrade({1013, 5}) ->
    #{base_id => 1013, quality => 5, need_num => 8,
      model => 11115, skin => 11115, animation => 1100106,
      condition => [], cost => [{22402, 20}], attrs => [],
      role_attrs => [{7, 0, 38}], skills => [{61074, 61071}],
      fc => 50, score => 46};
get_astroid_upgrade({1006, 4}) ->
    #{base_id => 1006, quality => 4, need_num => 7,
      model => 11106, skin => 11106, animation => 1100604,
      condition => [], cost => [{22402, 10}], attrs => [],
      role_attrs =>
          [{4, 1, 47},
           {5, 2, 37},
           {4, 3, 47},
           {3, 4, 11},
           {43, 5, 31},
           {5, 6, 37},
           {4, 7, 47}],
      skills => [{61036, 61033}], fc => 25, score => 21};
get_astroid_upgrade({1006, 5}) ->
    #{base_id => 1006, quality => 5, need_num => 8,
      model => 11106, skin => 11106, animation => 1100604,
      condition => [], cost => [{22402, 20}], attrs => [],
      role_attrs =>
          [{4, 1, 94},
           {5, 2, 74},
           {4, 3, 94},
           {3, 4, 22},
           {43, 5, 62},
           {5, 6, 74},
           {4, 7, 94}],
      skills => [{61036, 61033}], fc => 50, score => 42};
get_astroid_upgrade({1021, 4}) ->
    #{base_id => 1021, quality => 4, need_num => 7,
      model => 11121, skin => 11121, animation => 1102101,
      condition => [], cost => [{22402, 10}], attrs => [],
      role_attrs => [{1, 0, 158}],
      skills => [{61124, 61121}, {62023, 0}], fc => 25,
      score => 21};
get_astroid_upgrade({1021, 5}) ->
    #{base_id => 1021, quality => 5, need_num => 8,
      model => 11121, skin => 11121, animation => 1102101,
      condition => [], cost => [{22402, 20}], attrs => [],
      role_attrs => [{1, 0, 316}],
      skills => [{61124, 61121}, {62023, 0}], fc => 50,
      score => 42};
get_astroid_upgrade({1022, 4}) ->
    #{base_id => 1022, quality => 4, need_num => 7,
      model => 11125, skin => 11125, animation => 1102501,
      condition => [], cost => [{22402, 10}], attrs => [],
      role_attrs => [{6, 0, 24}],
      skills => [{61157, 61154}, {61158, 0}], fc => 25,
      score => 21};
get_astroid_upgrade({1022, 5}) ->
    #{base_id => 1022, quality => 5, need_num => 8,
      model => 11125, skin => 11125, animation => 1102501,
      condition => [], cost => [{22402, 20}], attrs => [],
      role_attrs => [{6, 0, 48}],
      skills => [{61157, 61154}, {61158, 0}], fc => 50,
      score => 42};
get_astroid_upgrade(_) -> false.

get_astroid_arouse_rate({75, 1}) -> 1300;
get_astroid_arouse_rate({80, 1}) -> 1300;
get_astroid_arouse_rate({85, 1}) -> 1300;
get_astroid_arouse_rate({85, 2}) -> 1300;
get_astroid_arouse_rate({90, 1}) -> 1500;
get_astroid_arouse_rate({90, 2}) -> 1300;
get_astroid_arouse_rate({95, 1}) -> 1500;
get_astroid_arouse_rate({95, 2}) -> 1500;
get_astroid_arouse_rate({100, 1}) -> 1500;
get_astroid_arouse_rate({100, 2}) -> 1500;
get_astroid_arouse_rate({105, 1}) -> 1500;
get_astroid_arouse_rate({105, 2}) -> 1500;
get_astroid_arouse_rate({110, 1}) -> 1500;
get_astroid_arouse_rate({110, 2}) -> 1500;
get_astroid_arouse_rate({115, 1}) -> 1500;
get_astroid_arouse_rate({115, 2}) -> 1500;
get_astroid_arouse_rate({120, 1}) -> 1500;
get_astroid_arouse_rate({120, 2}) -> 1500;
get_astroid_arouse_rate({125, 1}) -> 1500;
get_astroid_arouse_rate({125, 2}) -> 1500;
get_astroid_arouse_rate({130, 1}) -> 1500;
get_astroid_arouse_rate({130, 2}) -> 1500;
get_astroid_arouse_rate(_) -> 1000.

get_base_args({15, 1}) -> {14, 9, 3, 101, 103};
get_base_args({16, 1}) -> {14, 9, 4, 101, 102};
get_base_args({17, 1}) -> {14, 9, 4, 102, 104};
get_base_args({18, 1}) -> {14, 9, 4, 104, 105};
get_base_args({19, 1}) -> {14, 9, 2, 104, 103};
get_base_args({20, 1}) -> {14, 9, 4, 101, 102};
get_base_args({15, 2}) -> {14, 9, 3, 103, 101};
get_base_args({16, 2}) -> {14, 9, 4, 102, 103};
get_base_args({17, 2}) -> {14, 9, 4, 102, 105};
get_base_args({18, 2}) -> {14, 9, 4, 104, 105};
get_base_args({19, 2}) -> {14, 9, 2, 105, 101};
get_base_args({20, 2}) -> {14, 9, 4, 102, 103};
get_base_args({15, 3}) -> {14, 9, 3, 101, 103};
get_base_args({16, 3}) -> {14, 9, 4, 101, 102};
get_base_args({17, 3}) -> {14, 9, 4, 102, 104};
get_base_args({18, 3}) -> {14, 9, 4, 104, 105};
get_base_args({19, 3}) -> {14, 9, 2, 104, 103};
get_base_args({20, 3}) -> {14, 9, 4, 101, 102};
get_base_args({15, 4}) -> {14, 9, 3, 102, 101};
get_base_args({16, 4}) -> {14, 9, 4, 102, 103};
get_base_args({17, 4}) -> {14, 9, 4, 104, 105};
get_base_args({18, 4}) -> {14, 9, 4, 104, 105};
get_base_args({19, 4}) -> {14, 9, 2, 104, 101};
get_base_args({20, 4}) -> {14, 9, 4, 102, 105};
get_base_args({15, 5}) -> {14, 9, 3, 102, 101};
get_base_args({16, 5}) -> {14, 9, 4, 102, 103};
get_base_args({17, 5}) -> {14, 9, 4, 104, 105};
get_base_args({18, 5}) -> {14, 9, 4, 104, 105};
get_base_args({19, 5}) -> {14, 9, 2, 104, 101};
get_base_args({20, 5}) -> {14, 9, 4, 102, 105};
get_base_args({15, 6}) -> {14, 9, 3, 103, 101};
get_base_args({16, 6}) -> {14, 9, 4, 102, 103};
get_base_args({17, 6}) -> {14, 9, 4, 102, 105};
get_base_args({18, 6}) -> {14, 9, 4, 104, 105};
get_base_args({19, 6}) -> {14, 9, 2, 105, 101};
get_base_args({20, 6}) -> {14, 9, 4, 102, 103};
get_base_args({15, 7}) -> {14, 9, 3, 101, 103};
get_base_args({16, 7}) -> {14, 9, 4, 101, 102};
get_base_args({17, 7}) -> {14, 9, 4, 102, 104};
get_base_args({18, 7}) -> {14, 9, 4, 104, 105};
get_base_args({19, 7}) -> {14, 9, 2, 104, 103};
get_base_args({20, 7}) -> {14, 9, 4, 101, 102};
get_base_args(_) -> false.

get_marking({15, 70}) ->
    #{time => 604800, loss => [{22253, 1}]};
get_marking({16, 70}) ->
    #{time => 604800, loss => [{22253, 1}]};
get_marking({17, 70}) ->
    #{time => 604800, loss => [{22253, 1}]};
get_marking({18, 70}) ->
    #{time => 604800, loss => [{22253, 1}]};
get_marking({19, 70}) ->
    #{time => 604800, loss => [{22253, 1}]};
get_marking({20, 70}) ->
    #{time => 604800, loss => [{22253, 1}]};
get_marking({15, 80}) ->
    #{time => 777600, loss => [{22253, 2}]};
get_marking({16, 80}) ->
    #{time => 777600, loss => [{22253, 2}]};
get_marking({17, 80}) ->
    #{time => 777600, loss => [{22253, 2}]};
get_marking({18, 80}) ->
    #{time => 777600, loss => [{22253, 2}]};
get_marking({19, 80}) ->
    #{time => 777600, loss => [{22253, 2}]};
get_marking({20, 80}) ->
    #{time => 777600, loss => [{22253, 2}]};
get_marking({15, 90}) ->
    #{time => 1036800, loss => [{22254, 1}]};
get_marking({16, 90}) ->
    #{time => 1036800, loss => [{22254, 1}]};
get_marking({17, 90}) ->
    #{time => 1036800, loss => [{22254, 1}]};
get_marking({18, 90}) ->
    #{time => 1036800, loss => [{22254, 1}]};
get_marking({19, 90}) ->
    #{time => 1036800, loss => [{22254, 1}]};
get_marking({20, 90}) ->
    #{time => 1036800, loss => [{22254, 1}]};
get_marking({15, 100}) ->
    #{time => 1296000, loss => [{22254, 2}]};
get_marking({16, 100}) ->
    #{time => 1296000, loss => [{22254, 2}]};
get_marking({17, 100}) ->
    #{time => 1296000, loss => [{22254, 2}]};
get_marking({18, 100}) ->
    #{time => 1296000, loss => [{22254, 2}]};
get_marking({19, 100}) ->
    #{time => 1296000, loss => [{22254, 2}]};
get_marking({20, 100}) ->
    #{time => 1296000, loss => [{22254, 2}]};
get_marking({15, 110}) ->
    #{time => 1296000, loss => [{22254, 3}]};
get_marking({16, 110}) ->
    #{time => 1296000, loss => [{22254, 3}]};
get_marking({17, 110}) ->
    #{time => 1296000, loss => [{22254, 3}]};
get_marking({18, 110}) ->
    #{time => 1296000, loss => [{22254, 3}]};
get_marking({19, 110}) ->
    #{time => 1296000, loss => [{22254, 3}]};
get_marking({20, 110}) ->
    #{time => 1296000, loss => [{22254, 3}]};
get_marking(_) -> false.

