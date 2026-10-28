-file("src/data/shipping_data.erl", 1).

-module(shipping_data).

-export([get_types/0,
         get_classify/0,
         get_classify_cells/1,
         get_cell/1,
         get_item/1,
         quest_cells/0,
         get_quest_reward/1,
         get_quest/1,
         get_combat_unit/1,
         get_unit_score/1,
         get_box/1]).

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

-file("src/data/shipping_data.erl", 28).

-file("inc/shipping.hrl", 1).

-record(m_shipping, {ver = 1, total_num = 0}).

-record(shipping,
        {rid = {1, "", 0},
         world_lev = 0,
         role_lev = 0,
         type = 1,
         status = 0,
         reset_time = 0,
         start_time = 0,
         help = 0,
         show_list = [],
         cells = []}).

-record(shipping_cell,
        {ver = 1,
         id = 0,
         type = 1,
         status = 1,
         help_type = 0,
         pack_type = 0,
         normal_rewards = [],
         rewards = [],
         item_base_id = 0,
         need_num = 0,
         help_friends = [],
         help_guild = {"", 0, ""},
         quest_id = 0}).

-record(shipping_cell_data,
        {id = 0,
         classify = 0,
         classes = 0,
         lev = 0,
         item_base_id = 0,
         need_num = 0,
         weight = 0,
         exp = 0,
         ratio = 0,
         quest_id = 0}).

-record(shipping_classify_data,
        {classify = 0,
         min_num = 0,
         max_num = 0,
         is_show = 0,
         weight = 0}).

-record(shipping_cell_quset_data,
        {id = 0,
         classify = 0,
         quest_id = 0,
         item_base_id = 0,
         ratio = 0,
         week_min = 0,
         week_max = 0}).

-record(quest_shipping_data,
        {id = 0,
         type = 0,
         ring = 0,
         max_ring = 0,
         next_id = 0,
         rewards = [],
         leader_exp_mode = 0,
         leader_ratio = 0,
         exp_mode = 0,
         ratio = 0}).

-record(quest_shipping_reward_data,
        {id = 0,
         min = 0,
         max = 0,
         ratio = 0,
         rewards = [],
         need_num = 0,
         exp_mode = 0,
         mate_rewards = [],
         mate_exp_mode = 0}).

-file("src/data/shipping_data.erl", 29).

get_types() -> [{1, 900}, {2, 50}, {3, 50}].

get_classify() ->
    [#shipping_classify_data{classify = 1, min_num = 1,
                             max_num = 3, is_show = 1, weight = 180},
     #shipping_classify_data{classify = 2, min_num = 1,
                             max_num = 2, is_show = 1, weight = 130},
     #shipping_classify_data{classify = 3, min_num = 0,
                             max_num = 0, is_show = 0, weight = 0},
     #shipping_classify_data{classify = 4, min_num = 1,
                             max_num = 2, is_show = 0, weight = 210},
     #shipping_classify_data{classify = 5, min_num = 1,
                             max_num = 4, is_show = 1, weight = 280},
     #shipping_classify_data{classify = 6, min_num = 0,
                             max_num = 0, is_show = 0, weight = 0}].

get_classify_cells({2, 0}) ->
    [#shipping_cell_data{id = 1, classify = 2, classes = 0,
                         lev = 1, item_base_id = 21525, need_num = 1,
                         weight = 235, exp = 1000, ratio = 1800},
     #shipping_cell_data{id = 2, classify = 2, classes = 0,
                         lev = 1, item_base_id = 21521, need_num = 1,
                         weight = 235, exp = 1000, ratio = 1800},
     #shipping_cell_data{id = 3, classify = 2, classes = 0,
                         lev = 1, item_base_id = 21522, need_num = 1,
                         weight = 235, exp = 1000, ratio = 1800},
     #shipping_cell_data{id = 4, classify = 2, classes = 0,
                         lev = 1, item_base_id = 21524, need_num = 1,
                         weight = 235, exp = 1000, ratio = 1800},
     #shipping_cell_data{id = 5, classify = 2, classes = 0,
                         lev = 50, item_base_id = 20042, need_num = 1,
                         weight = 60, exp = 2500, ratio = 2100}];
get_classify_cells({1, 0}) ->
    [#shipping_cell_data{id = 11, classify = 1, classes = 0,
                         lev = 1, item_base_id = 21401, need_num = 1,
                         weight = 100, exp = 300, ratio = 1800},
     #shipping_cell_data{id = 12, classify = 1, classes = 0,
                         lev = 1, item_base_id = 21402, need_num = 1,
                         weight = 100, exp = 200, ratio = 1800},
     #shipping_cell_data{id = 13, classify = 1, classes = 0,
                         lev = 1, item_base_id = 21403, need_num = 1,
                         weight = 100, exp = 200, ratio = 1800},
     #shipping_cell_data{id = 14, classify = 1, classes = 0,
                         lev = 1, item_base_id = 21404, need_num = 1,
                         weight = 120, exp = 200, ratio = 1800},
     #shipping_cell_data{id = 15, classify = 1, classes = 0,
                         lev = 1, item_base_id = 21405, need_num = 1,
                         weight = 120, exp = 200, ratio = 1800},
     #shipping_cell_data{id = 17, classify = 1, classes = 0,
                         lev = 35, item_base_id = 21407, need_num = 1,
                         weight = 100, exp = 500, ratio = 1800},
     #shipping_cell_data{id = 18, classify = 1, classes = 0,
                         lev = 45, item_base_id = 21408, need_num = 1,
                         weight = 100, exp = 400, ratio = 1800}];
get_classify_cells({5, 0}) ->
    [#shipping_cell_data{id = 19, classify = 5, classes = 0,
                         lev = 1, item_base_id = 21300, need_num = 2,
                         weight = 100, exp = 50, ratio = 1800},
     #shipping_cell_data{id = 20, classify = 5, classes = 0,
                         lev = 1, item_base_id = 21301, need_num = 2,
                         weight = 150, exp = 100, ratio = 1800},
     #shipping_cell_data{id = 21, classify = 5, classes = 0,
                         lev = 1, item_base_id = 21303, need_num = 2,
                         weight = 45, exp = 150, ratio = 1800},
     #shipping_cell_data{id = 22, classify = 5, classes = 0,
                         lev = 1, item_base_id = 21302, need_num = 2,
                         weight = 50, exp = 150, ratio = 1800},
     #shipping_cell_data{id = 23, classify = 5, classes = 0,
                         lev = 40, item_base_id = 21313, need_num = 2,
                         weight = 45, exp = 250, ratio = 1800},
     #shipping_cell_data{id = 24, classify = 5, classes = 0,
                         lev = 50, item_base_id = 21305, need_num = 1,
                         weight = 40, exp = 300, ratio = 1800},
     #shipping_cell_data{id = 25, classify = 5, classes = 0,
                         lev = 55, item_base_id = 21304, need_num = 1,
                         weight = 50, exp = 200, ratio = 1800},
     #shipping_cell_data{id = 26, classify = 5, classes = 0,
                         lev = 60, item_base_id = 21307, need_num = 1,
                         weight = 30, exp = 375, ratio = 1800},
     #shipping_cell_data{id = 27, classify = 5, classes = 0,
                         lev = 65, item_base_id = 21409, need_num = 1,
                         weight = 40, exp = 300, ratio = 1800},
     #shipping_cell_data{id = 28, classify = 5, classes = 0,
                         lev = 70, item_base_id = 21309, need_num = 1,
                         weight = 15, exp = 450, ratio = 1800},
     #shipping_cell_data{id = 29, classify = 5, classes = 0,
                         lev = 75, item_base_id = 21308, need_num = 1,
                         weight = 35, exp = 500, ratio = 1800},
     #shipping_cell_data{id = 127, classify = 5, classes = 0,
                         lev = 80, item_base_id = 21311, need_num = 1,
                         weight = 5, exp = 750, ratio = 1800},
     #shipping_cell_data{id = 30, classify = 5, classes = 0,
                         lev = 85, item_base_id = 21314, need_num = 1,
                         weight = 2, exp = 1000, ratio = 1800}];
get_classify_cells({4, 0}) ->
    [#shipping_cell_data{id = 31, classify = 4, classes = 0,
                         lev = 1, item_base_id = 21410, need_num = 2,
                         weight = 100, exp = 5, ratio = 12000},
     #shipping_cell_data{id = 32, classify = 4, classes = 0,
                         lev = 1, item_base_id = 21411, need_num = 2,
                         weight = 100, exp = 5, ratio = 12000},
     #shipping_cell_data{id = 33, classify = 4, classes = 0,
                         lev = 1, item_base_id = 21412, need_num = 2,
                         weight = 100, exp = 9, ratio = 8000},
     #shipping_cell_data{id = 34, classify = 4, classes = 0,
                         lev = 1, item_base_id = 21413, need_num = 2,
                         weight = 100, exp = 9, ratio = 8000},
     #shipping_cell_data{id = 35, classify = 4, classes = 0,
                         lev = 1, item_base_id = 21414, need_num = 2,
                         weight = 100, exp = 6, ratio = 15000},
     #shipping_cell_data{id = 36, classify = 4, classes = 0,
                         lev = 1, item_base_id = 21400, need_num = 2,
                         weight = 200, exp = 18, ratio = 10000},
     #shipping_cell_data{id = 16, classify = 4, classes = 0,
                         lev = 1, item_base_id = 21406, need_num = 2,
                         weight = 100, exp = 400, ratio = 1400},
     #shipping_cell_data{id = 37, classify = 4, classes = 0,
                         lev = 1, item_base_id = 10511, need_num = 2,
                         weight = 100, exp = 14, ratio = 5000},
     #shipping_cell_data{id = 38, classify = 4, classes = 0,
                         lev = 1, item_base_id = 10512, need_num = 2,
                         weight = 100, exp = 14, ratio = 5000},
     #shipping_cell_data{id = 40, classify = 4, classes = 0,
                         lev = 1, item_base_id = 10514, need_num = 2,
                         weight = 100, exp = 14, ratio = 5000},
     #shipping_cell_data{id = 71, classify = 4, classes = 0,
                         lev = 1, item_base_id = 10521, need_num = 1,
                         weight = 100, exp = 130, ratio = 2000},
     #shipping_cell_data{id = 72, classify = 4, classes = 0,
                         lev = 1, item_base_id = 10522, need_num = 1,
                         weight = 100, exp = 130, ratio = 2000},
     #shipping_cell_data{id = 73, classify = 4, classes = 0,
                         lev = 1, item_base_id = 10524, need_num = 1,
                         weight = 100, exp = 130, ratio = 2000},
     #shipping_cell_data{id = 99, classify = 4, classes = 0,
                         lev = 1, item_base_id = 10531, need_num = 1,
                         weight = 100, exp = 290, ratio = 1500},
     #shipping_cell_data{id = 100, classify = 4, classes = 0,
                         lev = 1, item_base_id = 10532, need_num = 1,
                         weight = 100, exp = 290, ratio = 1500},
     #shipping_cell_data{id = 101, classify = 4, classes = 0,
                         lev = 1, item_base_id = 10534, need_num = 1,
                         weight = 100, exp = 290, ratio = 1500}];
get_classify_cells({4, 1}) ->
    [#shipping_cell_data{id = 41, classify = 4, classes = 1,
                         lev = 1, item_base_id = 10011, need_num = 2,
                         weight = 100, exp = 25, ratio = 5000},
     #shipping_cell_data{id = 42, classify = 4, classes = 1,
                         lev = 1, item_base_id = 10012, need_num = 2,
                         weight = 100, exp = 14, ratio = 5000},
     #shipping_cell_data{id = 43, classify = 4, classes = 1,
                         lev = 1, item_base_id = 10013, need_num = 2,
                         weight = 100, exp = 14, ratio = 5000},
     #shipping_cell_data{id = 44, classify = 4, classes = 1,
                         lev = 1, item_base_id = 10014, need_num = 2,
                         weight = 100, exp = 14, ratio = 5000},
     #shipping_cell_data{id = 46, classify = 4, classes = 1,
                         lev = 1, item_base_id = 10016, need_num = 2,
                         weight = 100, exp = 14, ratio = 5000},
     #shipping_cell_data{id = 74, classify = 4, classes = 1,
                         lev = 1, item_base_id = 10021, need_num = 1,
                         weight = 100, exp = 190, ratio = 2000},
     #shipping_cell_data{id = 75, classify = 4, classes = 1,
                         lev = 1, item_base_id = 10022, need_num = 1,
                         weight = 100, exp = 130, ratio = 2000},
     #shipping_cell_data{id = 76, classify = 4, classes = 1,
                         lev = 1, item_base_id = 10023, need_num = 1,
                         weight = 100, exp = 130, ratio = 2000},
     #shipping_cell_data{id = 77, classify = 4, classes = 1,
                         lev = 1, item_base_id = 10024, need_num = 1,
                         weight = 100, exp = 130, ratio = 2000},
     #shipping_cell_data{id = 78, classify = 4, classes = 1,
                         lev = 1, item_base_id = 10026, need_num = 1,
                         weight = 100, exp = 130, ratio = 2000},
     #shipping_cell_data{id = 102, classify = 4, classes = 1,
                         lev = 1, item_base_id = 10031, need_num = 1,
                         weight = 100, exp = 400, ratio = 1500},
     #shipping_cell_data{id = 103, classify = 4, classes = 1,
                         lev = 1, item_base_id = 10032, need_num = 1,
                         weight = 100, exp = 290, ratio = 1500},
     #shipping_cell_data{id = 104, classify = 4, classes = 1,
                         lev = 1, item_base_id = 10033, need_num = 1,
                         weight = 100, exp = 290, ratio = 1500},
     #shipping_cell_data{id = 105, classify = 4, classes = 1,
                         lev = 1, item_base_id = 10034, need_num = 1,
                         weight = 100, exp = 290, ratio = 1500},
     #shipping_cell_data{id = 106, classify = 4, classes = 1,
                         lev = 1, item_base_id = 10036, need_num = 1,
                         weight = 100, exp = 290, ratio = 1500}];
get_classify_cells({4, 2}) ->
    [#shipping_cell_data{id = 47, classify = 4, classes = 2,
                         lev = 1, item_base_id = 10111, need_num = 2,
                         weight = 100, exp = 25, ratio = 5000},
     #shipping_cell_data{id = 48, classify = 4, classes = 2,
                         lev = 1, item_base_id = 10112, need_num = 2,
                         weight = 100, exp = 14, ratio = 5000},
     #shipping_cell_data{id = 49, classify = 4, classes = 2,
                         lev = 1, item_base_id = 10113, need_num = 2,
                         weight = 100, exp = 14, ratio = 5000},
     #shipping_cell_data{id = 50, classify = 4, classes = 2,
                         lev = 1, item_base_id = 10114, need_num = 2,
                         weight = 100, exp = 14, ratio = 5000},
     #shipping_cell_data{id = 52, classify = 4, classes = 2,
                         lev = 1, item_base_id = 10116, need_num = 2,
                         weight = 100, exp = 14, ratio = 5000},
     #shipping_cell_data{id = 79, classify = 4, classes = 2,
                         lev = 1, item_base_id = 10121, need_num = 1,
                         weight = 100, exp = 190, ratio = 2000},
     #shipping_cell_data{id = 80, classify = 4, classes = 2,
                         lev = 1, item_base_id = 10122, need_num = 1,
                         weight = 100, exp = 120, ratio = 2000},
     #shipping_cell_data{id = 81, classify = 4, classes = 2,
                         lev = 1, item_base_id = 10123, need_num = 1,
                         weight = 100, exp = 120, ratio = 2000},
     #shipping_cell_data{id = 82, classify = 4, classes = 2,
                         lev = 1, item_base_id = 10124, need_num = 1,
                         weight = 100, exp = 120, ratio = 2000},
     #shipping_cell_data{id = 83, classify = 4, classes = 2,
                         lev = 1, item_base_id = 10126, need_num = 1,
                         weight = 100, exp = 120, ratio = 2000},
     #shipping_cell_data{id = 107, classify = 4, classes = 2,
                         lev = 1, item_base_id = 10131, need_num = 1,
                         weight = 100, exp = 400, ratio = 1500},
     #shipping_cell_data{id = 108, classify = 4, classes = 2,
                         lev = 1, item_base_id = 10132, need_num = 1,
                         weight = 100, exp = 290, ratio = 1500},
     #shipping_cell_data{id = 109, classify = 4, classes = 2,
                         lev = 1, item_base_id = 10133, need_num = 1,
                         weight = 100, exp = 290, ratio = 1500},
     #shipping_cell_data{id = 110, classify = 4, classes = 2,
                         lev = 1, item_base_id = 10134, need_num = 1,
                         weight = 100, exp = 290, ratio = 1500},
     #shipping_cell_data{id = 111, classify = 4, classes = 2,
                         lev = 1, item_base_id = 10136, need_num = 1,
                         weight = 100, exp = 290, ratio = 1500}];
get_classify_cells({4, 3}) ->
    [#shipping_cell_data{id = 53, classify = 4, classes = 3,
                         lev = 1, item_base_id = 10211, need_num = 2,
                         weight = 100, exp = 25, ratio = 5000},
     #shipping_cell_data{id = 54, classify = 4, classes = 3,
                         lev = 1, item_base_id = 10212, need_num = 2,
                         weight = 100, exp = 14, ratio = 5000},
     #shipping_cell_data{id = 55, classify = 4, classes = 3,
                         lev = 1, item_base_id = 10213, need_num = 2,
                         weight = 100, exp = 14, ratio = 5000},
     #shipping_cell_data{id = 56, classify = 4, classes = 3,
                         lev = 1, item_base_id = 10214, need_num = 2,
                         weight = 100, exp = 14, ratio = 5000},
     #shipping_cell_data{id = 58, classify = 4, classes = 3,
                         lev = 1, item_base_id = 10216, need_num = 2,
                         weight = 100, exp = 14, ratio = 5000},
     #shipping_cell_data{id = 84, classify = 4, classes = 3,
                         lev = 1, item_base_id = 10221, need_num = 1,
                         weight = 100, exp = 190, ratio = 2000},
     #shipping_cell_data{id = 85, classify = 4, classes = 3,
                         lev = 1, item_base_id = 10222, need_num = 1,
                         weight = 100, exp = 120, ratio = 2000},
     #shipping_cell_data{id = 86, classify = 4, classes = 3,
                         lev = 1, item_base_id = 10223, need_num = 1,
                         weight = 100, exp = 120, ratio = 2000},
     #shipping_cell_data{id = 87, classify = 4, classes = 3,
                         lev = 1, item_base_id = 10224, need_num = 1,
                         weight = 100, exp = 120, ratio = 2000},
     #shipping_cell_data{id = 88, classify = 4, classes = 3,
                         lev = 1, item_base_id = 10226, need_num = 1,
                         weight = 100, exp = 120, ratio = 2000},
     #shipping_cell_data{id = 112, classify = 4, classes = 3,
                         lev = 1, item_base_id = 10231, need_num = 1,
                         weight = 100, exp = 400, ratio = 1500},
     #shipping_cell_data{id = 113, classify = 4, classes = 3,
                         lev = 1, item_base_id = 10232, need_num = 1,
                         weight = 100, exp = 290, ratio = 1500},
     #shipping_cell_data{id = 114, classify = 4, classes = 3,
                         lev = 1, item_base_id = 10233, need_num = 1,
                         weight = 100, exp = 290, ratio = 1500},
     #shipping_cell_data{id = 115, classify = 4, classes = 3,
                         lev = 1, item_base_id = 10234, need_num = 1,
                         weight = 100, exp = 290, ratio = 1500},
     #shipping_cell_data{id = 116, classify = 4, classes = 3,
                         lev = 1, item_base_id = 10236, need_num = 1,
                         weight = 100, exp = 290, ratio = 1500}];
get_classify_cells({4, 4}) ->
    [#shipping_cell_data{id = 59, classify = 4, classes = 4,
                         lev = 1, item_base_id = 10311, need_num = 2,
                         weight = 100, exp = 25, ratio = 5000},
     #shipping_cell_data{id = 60, classify = 4, classes = 4,
                         lev = 1, item_base_id = 10312, need_num = 2,
                         weight = 100, exp = 14, ratio = 5000},
     #shipping_cell_data{id = 61, classify = 4, classes = 4,
                         lev = 1, item_base_id = 10313, need_num = 2,
                         weight = 100, exp = 14, ratio = 5000},
     #shipping_cell_data{id = 62, classify = 4, classes = 4,
                         lev = 1, item_base_id = 10314, need_num = 2,
                         weight = 100, exp = 14, ratio = 5000},
     #shipping_cell_data{id = 64, classify = 4, classes = 4,
                         lev = 1, item_base_id = 10316, need_num = 2,
                         weight = 100, exp = 14, ratio = 5000},
     #shipping_cell_data{id = 89, classify = 4, classes = 4,
                         lev = 1, item_base_id = 10321, need_num = 1,
                         weight = 100, exp = 190, ratio = 2000},
     #shipping_cell_data{id = 90, classify = 4, classes = 4,
                         lev = 1, item_base_id = 10322, need_num = 1,
                         weight = 100, exp = 120, ratio = 2000},
     #shipping_cell_data{id = 91, classify = 4, classes = 4,
                         lev = 1, item_base_id = 10323, need_num = 1,
                         weight = 100, exp = 120, ratio = 2000},
     #shipping_cell_data{id = 92, classify = 4, classes = 4,
                         lev = 1, item_base_id = 10324, need_num = 1,
                         weight = 100, exp = 120, ratio = 2000},
     #shipping_cell_data{id = 93, classify = 4, classes = 4,
                         lev = 1, item_base_id = 10326, need_num = 1,
                         weight = 100, exp = 120, ratio = 2000},
     #shipping_cell_data{id = 117, classify = 4, classes = 4,
                         lev = 1, item_base_id = 10331, need_num = 1,
                         weight = 100, exp = 400, ratio = 1500},
     #shipping_cell_data{id = 118, classify = 4, classes = 4,
                         lev = 1, item_base_id = 10332, need_num = 1,
                         weight = 100, exp = 290, ratio = 1500},
     #shipping_cell_data{id = 119, classify = 4, classes = 4,
                         lev = 1, item_base_id = 10333, need_num = 1,
                         weight = 100, exp = 290, ratio = 1500},
     #shipping_cell_data{id = 120, classify = 4, classes = 4,
                         lev = 1, item_base_id = 10334, need_num = 1,
                         weight = 100, exp = 290, ratio = 1500},
     #shipping_cell_data{id = 121, classify = 4, classes = 4,
                         lev = 1, item_base_id = 10336, need_num = 1,
                         weight = 100, exp = 290, ratio = 1500}];
get_classify_cells({4, 5}) ->
    [#shipping_cell_data{id = 65, classify = 4, classes = 5,
                         lev = 1, item_base_id = 10411, need_num = 2,
                         weight = 100, exp = 25, ratio = 5000},
     #shipping_cell_data{id = 66, classify = 4, classes = 5,
                         lev = 1, item_base_id = 10412, need_num = 2,
                         weight = 100, exp = 14, ratio = 5000},
     #shipping_cell_data{id = 67, classify = 4, classes = 5,
                         lev = 1, item_base_id = 10413, need_num = 2,
                         weight = 100, exp = 14, ratio = 5000},
     #shipping_cell_data{id = 68, classify = 4, classes = 5,
                         lev = 1, item_base_id = 10414, need_num = 2,
                         weight = 100, exp = 14, ratio = 5000},
     #shipping_cell_data{id = 70, classify = 4, classes = 5,
                         lev = 1, item_base_id = 10416, need_num = 2,
                         weight = 100, exp = 14, ratio = 5000},
     #shipping_cell_data{id = 94, classify = 4, classes = 5,
                         lev = 1, item_base_id = 10421, need_num = 1,
                         weight = 100, exp = 190, ratio = 2000},
     #shipping_cell_data{id = 95, classify = 4, classes = 5,
                         lev = 1, item_base_id = 10422, need_num = 1,
                         weight = 100, exp = 120, ratio = 2000},
     #shipping_cell_data{id = 96, classify = 4, classes = 5,
                         lev = 1, item_base_id = 10423, need_num = 1,
                         weight = 100, exp = 120, ratio = 2000},
     #shipping_cell_data{id = 97, classify = 4, classes = 5,
                         lev = 1, item_base_id = 10424, need_num = 1,
                         weight = 100, exp = 120, ratio = 2000},
     #shipping_cell_data{id = 98, classify = 4, classes = 5,
                         lev = 1, item_base_id = 10426, need_num = 1,
                         weight = 100, exp = 120, ratio = 2000},
     #shipping_cell_data{id = 122, classify = 4, classes = 5,
                         lev = 1, item_base_id = 10431, need_num = 1,
                         weight = 100, exp = 400, ratio = 1500},
     #shipping_cell_data{id = 123, classify = 4, classes = 5,
                         lev = 1, item_base_id = 10432, need_num = 1,
                         weight = 100, exp = 290, ratio = 1500},
     #shipping_cell_data{id = 124, classify = 4, classes = 5,
                         lev = 1, item_base_id = 10433, need_num = 1,
                         weight = 100, exp = 290, ratio = 1500},
     #shipping_cell_data{id = 125, classify = 4, classes = 5,
                         lev = 1, item_base_id = 10434, need_num = 1,
                         weight = 100, exp = 290, ratio = 1500},
     #shipping_cell_data{id = 126, classify = 4, classes = 5,
                         lev = 1, item_base_id = 10436, need_num = 1,
                         weight = 100, exp = 290, ratio = 1500}];
get_classify_cells({4, 6}) ->
    [#shipping_cell_data{id = 128, classify = 4,
                         classes = 6, lev = 1, item_base_id = 10611,
                         need_num = 2, weight = 100, exp = 25, ratio = 5000},
     #shipping_cell_data{id = 129, classify = 4, classes = 6,
                         lev = 1, item_base_id = 10612, need_num = 2,
                         weight = 100, exp = 14, ratio = 5000},
     #shipping_cell_data{id = 130, classify = 4, classes = 6,
                         lev = 1, item_base_id = 10613, need_num = 2,
                         weight = 100, exp = 14, ratio = 5000},
     #shipping_cell_data{id = 131, classify = 4, classes = 6,
                         lev = 1, item_base_id = 10614, need_num = 2,
                         weight = 100, exp = 14, ratio = 5000},
     #shipping_cell_data{id = 132, classify = 4, classes = 6,
                         lev = 1, item_base_id = 10616, need_num = 2,
                         weight = 100, exp = 14, ratio = 5000},
     #shipping_cell_data{id = 133, classify = 4, classes = 6,
                         lev = 1, item_base_id = 10621, need_num = 1,
                         weight = 100, exp = 190, ratio = 2000},
     #shipping_cell_data{id = 134, classify = 4, classes = 6,
                         lev = 1, item_base_id = 10622, need_num = 1,
                         weight = 100, exp = 120, ratio = 2000},
     #shipping_cell_data{id = 135, classify = 4, classes = 6,
                         lev = 1, item_base_id = 10623, need_num = 1,
                         weight = 100, exp = 120, ratio = 2000},
     #shipping_cell_data{id = 136, classify = 4, classes = 6,
                         lev = 1, item_base_id = 10624, need_num = 1,
                         weight = 100, exp = 120, ratio = 2000},
     #shipping_cell_data{id = 137, classify = 4, classes = 6,
                         lev = 1, item_base_id = 10626, need_num = 1,
                         weight = 100, exp = 120, ratio = 2000},
     #shipping_cell_data{id = 138, classify = 4, classes = 6,
                         lev = 1, item_base_id = 10631, need_num = 1,
                         weight = 100, exp = 400, ratio = 1500},
     #shipping_cell_data{id = 139, classify = 4, classes = 6,
                         lev = 1, item_base_id = 10632, need_num = 1,
                         weight = 100, exp = 290, ratio = 1500},
     #shipping_cell_data{id = 140, classify = 4, classes = 6,
                         lev = 1, item_base_id = 10633, need_num = 1,
                         weight = 100, exp = 290, ratio = 1500},
     #shipping_cell_data{id = 141, classify = 4, classes = 6,
                         lev = 1, item_base_id = 10634, need_num = 1,
                         weight = 100, exp = 290, ratio = 1500},
     #shipping_cell_data{id = 142, classify = 4, classes = 6,
                         lev = 1, item_base_id = 10636, need_num = 1,
                         weight = 100, exp = 290, ratio = 1500}];
get_classify_cells({4, 7}) ->
    [#shipping_cell_data{id = 143, classify = 4,
                         classes = 7, lev = 1, item_base_id = 10711,
                         need_num = 2, weight = 100, exp = 25, ratio = 5000},
     #shipping_cell_data{id = 144, classify = 4, classes = 7,
                         lev = 1, item_base_id = 10712, need_num = 2,
                         weight = 100, exp = 14, ratio = 5000},
     #shipping_cell_data{id = 145, classify = 4, classes = 7,
                         lev = 1, item_base_id = 10713, need_num = 2,
                         weight = 100, exp = 14, ratio = 5000},
     #shipping_cell_data{id = 146, classify = 4, classes = 7,
                         lev = 1, item_base_id = 10714, need_num = 2,
                         weight = 100, exp = 14, ratio = 5000},
     #shipping_cell_data{id = 147, classify = 4, classes = 7,
                         lev = 1, item_base_id = 10716, need_num = 2,
                         weight = 100, exp = 14, ratio = 5000},
     #shipping_cell_data{id = 148, classify = 4, classes = 7,
                         lev = 1, item_base_id = 10721, need_num = 1,
                         weight = 100, exp = 190, ratio = 2000},
     #shipping_cell_data{id = 149, classify = 4, classes = 7,
                         lev = 1, item_base_id = 10722, need_num = 1,
                         weight = 100, exp = 120, ratio = 2000},
     #shipping_cell_data{id = 150, classify = 4, classes = 7,
                         lev = 1, item_base_id = 10723, need_num = 1,
                         weight = 100, exp = 120, ratio = 2000},
     #shipping_cell_data{id = 151, classify = 4, classes = 7,
                         lev = 1, item_base_id = 10724, need_num = 1,
                         weight = 100, exp = 120, ratio = 2000},
     #shipping_cell_data{id = 152, classify = 4, classes = 7,
                         lev = 1, item_base_id = 10726, need_num = 1,
                         weight = 100, exp = 120, ratio = 2000},
     #shipping_cell_data{id = 153, classify = 4, classes = 7,
                         lev = 1, item_base_id = 10731, need_num = 1,
                         weight = 100, exp = 400, ratio = 1500},
     #shipping_cell_data{id = 154, classify = 4, classes = 7,
                         lev = 1, item_base_id = 10732, need_num = 1,
                         weight = 100, exp = 290, ratio = 1500},
     #shipping_cell_data{id = 155, classify = 4, classes = 7,
                         lev = 1, item_base_id = 10733, need_num = 1,
                         weight = 100, exp = 290, ratio = 1500},
     #shipping_cell_data{id = 156, classify = 4, classes = 7,
                         lev = 1, item_base_id = 10734, need_num = 1,
                         weight = 100, exp = 290, ratio = 1500},
     #shipping_cell_data{id = 157, classify = 4, classes = 7,
                         lev = 1, item_base_id = 10736, need_num = 1,
                         weight = 100, exp = 290, ratio = 1500}];
get_classify_cells(_Args) -> [].

get_cell(1) ->
    #shipping_cell_data{id = 1, classify = 2, classes = 0,
                        lev = 1, item_base_id = 21525, need_num = 1,
                        weight = 235, exp = 1000, ratio = 1800};
get_cell(2) ->
    #shipping_cell_data{id = 2, classify = 2, classes = 0,
                        lev = 1, item_base_id = 21521, need_num = 1,
                        weight = 235, exp = 1000, ratio = 1800};
get_cell(3) ->
    #shipping_cell_data{id = 3, classify = 2, classes = 0,
                        lev = 1, item_base_id = 21522, need_num = 1,
                        weight = 235, exp = 1000, ratio = 1800};
get_cell(4) ->
    #shipping_cell_data{id = 4, classify = 2, classes = 0,
                        lev = 1, item_base_id = 21524, need_num = 1,
                        weight = 235, exp = 1000, ratio = 1800};
get_cell(5) ->
    #shipping_cell_data{id = 5, classify = 2, classes = 0,
                        lev = 50, item_base_id = 20042, need_num = 1,
                        weight = 60, exp = 2500, ratio = 2100};
get_cell(11) ->
    #shipping_cell_data{id = 11, classify = 1, classes = 0,
                        lev = 1, item_base_id = 21401, need_num = 1,
                        weight = 100, exp = 300, ratio = 1800};
get_cell(12) ->
    #shipping_cell_data{id = 12, classify = 1, classes = 0,
                        lev = 1, item_base_id = 21402, need_num = 1,
                        weight = 100, exp = 200, ratio = 1800};
get_cell(13) ->
    #shipping_cell_data{id = 13, classify = 1, classes = 0,
                        lev = 1, item_base_id = 21403, need_num = 1,
                        weight = 100, exp = 200, ratio = 1800};
get_cell(14) ->
    #shipping_cell_data{id = 14, classify = 1, classes = 0,
                        lev = 1, item_base_id = 21404, need_num = 1,
                        weight = 120, exp = 200, ratio = 1800};
get_cell(15) ->
    #shipping_cell_data{id = 15, classify = 1, classes = 0,
                        lev = 1, item_base_id = 21405, need_num = 1,
                        weight = 120, exp = 200, ratio = 1800};
get_cell(17) ->
    #shipping_cell_data{id = 17, classify = 1, classes = 0,
                        lev = 35, item_base_id = 21407, need_num = 1,
                        weight = 100, exp = 500, ratio = 1800};
get_cell(18) ->
    #shipping_cell_data{id = 18, classify = 1, classes = 0,
                        lev = 45, item_base_id = 21408, need_num = 1,
                        weight = 100, exp = 400, ratio = 1800};
get_cell(19) ->
    #shipping_cell_data{id = 19, classify = 5, classes = 0,
                        lev = 1, item_base_id = 21300, need_num = 2,
                        weight = 100, exp = 50, ratio = 1800};
get_cell(20) ->
    #shipping_cell_data{id = 20, classify = 5, classes = 0,
                        lev = 1, item_base_id = 21301, need_num = 2,
                        weight = 150, exp = 100, ratio = 1800};
get_cell(21) ->
    #shipping_cell_data{id = 21, classify = 5, classes = 0,
                        lev = 1, item_base_id = 21303, need_num = 2,
                        weight = 45, exp = 150, ratio = 1800};
get_cell(22) ->
    #shipping_cell_data{id = 22, classify = 5, classes = 0,
                        lev = 1, item_base_id = 21302, need_num = 2,
                        weight = 50, exp = 150, ratio = 1800};
get_cell(23) ->
    #shipping_cell_data{id = 23, classify = 5, classes = 0,
                        lev = 40, item_base_id = 21313, need_num = 2,
                        weight = 45, exp = 250, ratio = 1800};
get_cell(24) ->
    #shipping_cell_data{id = 24, classify = 5, classes = 0,
                        lev = 50, item_base_id = 21305, need_num = 1,
                        weight = 40, exp = 300, ratio = 1800};
get_cell(25) ->
    #shipping_cell_data{id = 25, classify = 5, classes = 0,
                        lev = 55, item_base_id = 21304, need_num = 1,
                        weight = 50, exp = 200, ratio = 1800};
get_cell(26) ->
    #shipping_cell_data{id = 26, classify = 5, classes = 0,
                        lev = 60, item_base_id = 21307, need_num = 1,
                        weight = 30, exp = 375, ratio = 1800};
get_cell(27) ->
    #shipping_cell_data{id = 27, classify = 5, classes = 0,
                        lev = 65, item_base_id = 21409, need_num = 1,
                        weight = 40, exp = 300, ratio = 1800};
get_cell(28) ->
    #shipping_cell_data{id = 28, classify = 5, classes = 0,
                        lev = 70, item_base_id = 21309, need_num = 1,
                        weight = 15, exp = 450, ratio = 1800};
get_cell(29) ->
    #shipping_cell_data{id = 29, classify = 5, classes = 0,
                        lev = 75, item_base_id = 21308, need_num = 1,
                        weight = 35, exp = 500, ratio = 1800};
get_cell(127) ->
    #shipping_cell_data{id = 127, classify = 5, classes = 0,
                        lev = 80, item_base_id = 21311, need_num = 1,
                        weight = 5, exp = 750, ratio = 1800};
get_cell(30) ->
    #shipping_cell_data{id = 30, classify = 5, classes = 0,
                        lev = 85, item_base_id = 21314, need_num = 1,
                        weight = 2, exp = 1000, ratio = 1800};
get_cell(31) ->
    #shipping_cell_data{id = 31, classify = 4, classes = 0,
                        lev = 1, item_base_id = 21410, need_num = 2,
                        weight = 100, exp = 5, ratio = 12000};
get_cell(32) ->
    #shipping_cell_data{id = 32, classify = 4, classes = 0,
                        lev = 1, item_base_id = 21411, need_num = 2,
                        weight = 100, exp = 5, ratio = 12000};
get_cell(33) ->
    #shipping_cell_data{id = 33, classify = 4, classes = 0,
                        lev = 1, item_base_id = 21412, need_num = 2,
                        weight = 100, exp = 9, ratio = 8000};
get_cell(34) ->
    #shipping_cell_data{id = 34, classify = 4, classes = 0,
                        lev = 1, item_base_id = 21413, need_num = 2,
                        weight = 100, exp = 9, ratio = 8000};
get_cell(35) ->
    #shipping_cell_data{id = 35, classify = 4, classes = 0,
                        lev = 1, item_base_id = 21414, need_num = 2,
                        weight = 100, exp = 6, ratio = 15000};
get_cell(36) ->
    #shipping_cell_data{id = 36, classify = 4, classes = 0,
                        lev = 1, item_base_id = 21400, need_num = 2,
                        weight = 200, exp = 18, ratio = 10000};
get_cell(16) ->
    #shipping_cell_data{id = 16, classify = 4, classes = 0,
                        lev = 1, item_base_id = 21406, need_num = 2,
                        weight = 100, exp = 400, ratio = 1400};
get_cell(37) ->
    #shipping_cell_data{id = 37, classify = 4, classes = 0,
                        lev = 1, item_base_id = 10511, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_cell(38) ->
    #shipping_cell_data{id = 38, classify = 4, classes = 0,
                        lev = 1, item_base_id = 10512, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_cell(40) ->
    #shipping_cell_data{id = 40, classify = 4, classes = 0,
                        lev = 1, item_base_id = 10514, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_cell(41) ->
    #shipping_cell_data{id = 41, classify = 4, classes = 1,
                        lev = 1, item_base_id = 10011, need_num = 2,
                        weight = 100, exp = 25, ratio = 5000};
get_cell(42) ->
    #shipping_cell_data{id = 42, classify = 4, classes = 1,
                        lev = 1, item_base_id = 10012, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_cell(43) ->
    #shipping_cell_data{id = 43, classify = 4, classes = 1,
                        lev = 1, item_base_id = 10013, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_cell(44) ->
    #shipping_cell_data{id = 44, classify = 4, classes = 1,
                        lev = 1, item_base_id = 10014, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_cell(46) ->
    #shipping_cell_data{id = 46, classify = 4, classes = 1,
                        lev = 1, item_base_id = 10016, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_cell(47) ->
    #shipping_cell_data{id = 47, classify = 4, classes = 2,
                        lev = 1, item_base_id = 10111, need_num = 2,
                        weight = 100, exp = 25, ratio = 5000};
get_cell(48) ->
    #shipping_cell_data{id = 48, classify = 4, classes = 2,
                        lev = 1, item_base_id = 10112, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_cell(49) ->
    #shipping_cell_data{id = 49, classify = 4, classes = 2,
                        lev = 1, item_base_id = 10113, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_cell(50) ->
    #shipping_cell_data{id = 50, classify = 4, classes = 2,
                        lev = 1, item_base_id = 10114, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_cell(52) ->
    #shipping_cell_data{id = 52, classify = 4, classes = 2,
                        lev = 1, item_base_id = 10116, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_cell(53) ->
    #shipping_cell_data{id = 53, classify = 4, classes = 3,
                        lev = 1, item_base_id = 10211, need_num = 2,
                        weight = 100, exp = 25, ratio = 5000};
get_cell(54) ->
    #shipping_cell_data{id = 54, classify = 4, classes = 3,
                        lev = 1, item_base_id = 10212, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_cell(55) ->
    #shipping_cell_data{id = 55, classify = 4, classes = 3,
                        lev = 1, item_base_id = 10213, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_cell(56) ->
    #shipping_cell_data{id = 56, classify = 4, classes = 3,
                        lev = 1, item_base_id = 10214, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_cell(58) ->
    #shipping_cell_data{id = 58, classify = 4, classes = 3,
                        lev = 1, item_base_id = 10216, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_cell(59) ->
    #shipping_cell_data{id = 59, classify = 4, classes = 4,
                        lev = 1, item_base_id = 10311, need_num = 2,
                        weight = 100, exp = 25, ratio = 5000};
get_cell(60) ->
    #shipping_cell_data{id = 60, classify = 4, classes = 4,
                        lev = 1, item_base_id = 10312, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_cell(61) ->
    #shipping_cell_data{id = 61, classify = 4, classes = 4,
                        lev = 1, item_base_id = 10313, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_cell(62) ->
    #shipping_cell_data{id = 62, classify = 4, classes = 4,
                        lev = 1, item_base_id = 10314, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_cell(64) ->
    #shipping_cell_data{id = 64, classify = 4, classes = 4,
                        lev = 1, item_base_id = 10316, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_cell(65) ->
    #shipping_cell_data{id = 65, classify = 4, classes = 5,
                        lev = 1, item_base_id = 10411, need_num = 2,
                        weight = 100, exp = 25, ratio = 5000};
get_cell(66) ->
    #shipping_cell_data{id = 66, classify = 4, classes = 5,
                        lev = 1, item_base_id = 10412, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_cell(67) ->
    #shipping_cell_data{id = 67, classify = 4, classes = 5,
                        lev = 1, item_base_id = 10413, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_cell(68) ->
    #shipping_cell_data{id = 68, classify = 4, classes = 5,
                        lev = 1, item_base_id = 10414, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_cell(70) ->
    #shipping_cell_data{id = 70, classify = 4, classes = 5,
                        lev = 1, item_base_id = 10416, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_cell(71) ->
    #shipping_cell_data{id = 71, classify = 4, classes = 0,
                        lev = 1, item_base_id = 10521, need_num = 1,
                        weight = 100, exp = 130, ratio = 2000};
get_cell(72) ->
    #shipping_cell_data{id = 72, classify = 4, classes = 0,
                        lev = 1, item_base_id = 10522, need_num = 1,
                        weight = 100, exp = 130, ratio = 2000};
get_cell(73) ->
    #shipping_cell_data{id = 73, classify = 4, classes = 0,
                        lev = 1, item_base_id = 10524, need_num = 1,
                        weight = 100, exp = 130, ratio = 2000};
get_cell(74) ->
    #shipping_cell_data{id = 74, classify = 4, classes = 1,
                        lev = 1, item_base_id = 10021, need_num = 1,
                        weight = 100, exp = 190, ratio = 2000};
get_cell(75) ->
    #shipping_cell_data{id = 75, classify = 4, classes = 1,
                        lev = 1, item_base_id = 10022, need_num = 1,
                        weight = 100, exp = 130, ratio = 2000};
get_cell(76) ->
    #shipping_cell_data{id = 76, classify = 4, classes = 1,
                        lev = 1, item_base_id = 10023, need_num = 1,
                        weight = 100, exp = 130, ratio = 2000};
get_cell(77) ->
    #shipping_cell_data{id = 77, classify = 4, classes = 1,
                        lev = 1, item_base_id = 10024, need_num = 1,
                        weight = 100, exp = 130, ratio = 2000};
get_cell(78) ->
    #shipping_cell_data{id = 78, classify = 4, classes = 1,
                        lev = 1, item_base_id = 10026, need_num = 1,
                        weight = 100, exp = 130, ratio = 2000};
get_cell(79) ->
    #shipping_cell_data{id = 79, classify = 4, classes = 2,
                        lev = 1, item_base_id = 10121, need_num = 1,
                        weight = 100, exp = 190, ratio = 2000};
get_cell(80) ->
    #shipping_cell_data{id = 80, classify = 4, classes = 2,
                        lev = 1, item_base_id = 10122, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_cell(81) ->
    #shipping_cell_data{id = 81, classify = 4, classes = 2,
                        lev = 1, item_base_id = 10123, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_cell(82) ->
    #shipping_cell_data{id = 82, classify = 4, classes = 2,
                        lev = 1, item_base_id = 10124, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_cell(83) ->
    #shipping_cell_data{id = 83, classify = 4, classes = 2,
                        lev = 1, item_base_id = 10126, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_cell(84) ->
    #shipping_cell_data{id = 84, classify = 4, classes = 3,
                        lev = 1, item_base_id = 10221, need_num = 1,
                        weight = 100, exp = 190, ratio = 2000};
get_cell(85) ->
    #shipping_cell_data{id = 85, classify = 4, classes = 3,
                        lev = 1, item_base_id = 10222, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_cell(86) ->
    #shipping_cell_data{id = 86, classify = 4, classes = 3,
                        lev = 1, item_base_id = 10223, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_cell(87) ->
    #shipping_cell_data{id = 87, classify = 4, classes = 3,
                        lev = 1, item_base_id = 10224, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_cell(88) ->
    #shipping_cell_data{id = 88, classify = 4, classes = 3,
                        lev = 1, item_base_id = 10226, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_cell(89) ->
    #shipping_cell_data{id = 89, classify = 4, classes = 4,
                        lev = 1, item_base_id = 10321, need_num = 1,
                        weight = 100, exp = 190, ratio = 2000};
get_cell(90) ->
    #shipping_cell_data{id = 90, classify = 4, classes = 4,
                        lev = 1, item_base_id = 10322, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_cell(91) ->
    #shipping_cell_data{id = 91, classify = 4, classes = 4,
                        lev = 1, item_base_id = 10323, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_cell(92) ->
    #shipping_cell_data{id = 92, classify = 4, classes = 4,
                        lev = 1, item_base_id = 10324, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_cell(93) ->
    #shipping_cell_data{id = 93, classify = 4, classes = 4,
                        lev = 1, item_base_id = 10326, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_cell(94) ->
    #shipping_cell_data{id = 94, classify = 4, classes = 5,
                        lev = 1, item_base_id = 10421, need_num = 1,
                        weight = 100, exp = 190, ratio = 2000};
get_cell(95) ->
    #shipping_cell_data{id = 95, classify = 4, classes = 5,
                        lev = 1, item_base_id = 10422, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_cell(96) ->
    #shipping_cell_data{id = 96, classify = 4, classes = 5,
                        lev = 1, item_base_id = 10423, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_cell(97) ->
    #shipping_cell_data{id = 97, classify = 4, classes = 5,
                        lev = 1, item_base_id = 10424, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_cell(98) ->
    #shipping_cell_data{id = 98, classify = 4, classes = 5,
                        lev = 1, item_base_id = 10426, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_cell(99) ->
    #shipping_cell_data{id = 99, classify = 4, classes = 0,
                        lev = 1, item_base_id = 10531, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_cell(100) ->
    #shipping_cell_data{id = 100, classify = 4, classes = 0,
                        lev = 1, item_base_id = 10532, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_cell(101) ->
    #shipping_cell_data{id = 101, classify = 4, classes = 0,
                        lev = 1, item_base_id = 10534, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_cell(102) ->
    #shipping_cell_data{id = 102, classify = 4, classes = 1,
                        lev = 1, item_base_id = 10031, need_num = 1,
                        weight = 100, exp = 400, ratio = 1500};
get_cell(103) ->
    #shipping_cell_data{id = 103, classify = 4, classes = 1,
                        lev = 1, item_base_id = 10032, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_cell(104) ->
    #shipping_cell_data{id = 104, classify = 4, classes = 1,
                        lev = 1, item_base_id = 10033, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_cell(105) ->
    #shipping_cell_data{id = 105, classify = 4, classes = 1,
                        lev = 1, item_base_id = 10034, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_cell(106) ->
    #shipping_cell_data{id = 106, classify = 4, classes = 1,
                        lev = 1, item_base_id = 10036, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_cell(107) ->
    #shipping_cell_data{id = 107, classify = 4, classes = 2,
                        lev = 1, item_base_id = 10131, need_num = 1,
                        weight = 100, exp = 400, ratio = 1500};
get_cell(108) ->
    #shipping_cell_data{id = 108, classify = 4, classes = 2,
                        lev = 1, item_base_id = 10132, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_cell(109) ->
    #shipping_cell_data{id = 109, classify = 4, classes = 2,
                        lev = 1, item_base_id = 10133, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_cell(110) ->
    #shipping_cell_data{id = 110, classify = 4, classes = 2,
                        lev = 1, item_base_id = 10134, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_cell(111) ->
    #shipping_cell_data{id = 111, classify = 4, classes = 2,
                        lev = 1, item_base_id = 10136, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_cell(112) ->
    #shipping_cell_data{id = 112, classify = 4, classes = 3,
                        lev = 1, item_base_id = 10231, need_num = 1,
                        weight = 100, exp = 400, ratio = 1500};
get_cell(113) ->
    #shipping_cell_data{id = 113, classify = 4, classes = 3,
                        lev = 1, item_base_id = 10232, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_cell(114) ->
    #shipping_cell_data{id = 114, classify = 4, classes = 3,
                        lev = 1, item_base_id = 10233, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_cell(115) ->
    #shipping_cell_data{id = 115, classify = 4, classes = 3,
                        lev = 1, item_base_id = 10234, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_cell(116) ->
    #shipping_cell_data{id = 116, classify = 4, classes = 3,
                        lev = 1, item_base_id = 10236, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_cell(117) ->
    #shipping_cell_data{id = 117, classify = 4, classes = 4,
                        lev = 1, item_base_id = 10331, need_num = 1,
                        weight = 100, exp = 400, ratio = 1500};
get_cell(118) ->
    #shipping_cell_data{id = 118, classify = 4, classes = 4,
                        lev = 1, item_base_id = 10332, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_cell(119) ->
    #shipping_cell_data{id = 119, classify = 4, classes = 4,
                        lev = 1, item_base_id = 10333, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_cell(120) ->
    #shipping_cell_data{id = 120, classify = 4, classes = 4,
                        lev = 1, item_base_id = 10334, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_cell(121) ->
    #shipping_cell_data{id = 121, classify = 4, classes = 4,
                        lev = 1, item_base_id = 10336, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_cell(122) ->
    #shipping_cell_data{id = 122, classify = 4, classes = 5,
                        lev = 1, item_base_id = 10431, need_num = 1,
                        weight = 100, exp = 400, ratio = 1500};
get_cell(123) ->
    #shipping_cell_data{id = 123, classify = 4, classes = 5,
                        lev = 1, item_base_id = 10432, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_cell(124) ->
    #shipping_cell_data{id = 124, classify = 4, classes = 5,
                        lev = 1, item_base_id = 10433, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_cell(125) ->
    #shipping_cell_data{id = 125, classify = 4, classes = 5,
                        lev = 1, item_base_id = 10434, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_cell(126) ->
    #shipping_cell_data{id = 126, classify = 4, classes = 5,
                        lev = 1, item_base_id = 10436, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_cell(128) ->
    #shipping_cell_data{id = 128, classify = 4, classes = 6,
                        lev = 1, item_base_id = 10611, need_num = 2,
                        weight = 100, exp = 25, ratio = 5000};
get_cell(129) ->
    #shipping_cell_data{id = 129, classify = 4, classes = 6,
                        lev = 1, item_base_id = 10612, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_cell(130) ->
    #shipping_cell_data{id = 130, classify = 4, classes = 6,
                        lev = 1, item_base_id = 10613, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_cell(131) ->
    #shipping_cell_data{id = 131, classify = 4, classes = 6,
                        lev = 1, item_base_id = 10614, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_cell(132) ->
    #shipping_cell_data{id = 132, classify = 4, classes = 6,
                        lev = 1, item_base_id = 10616, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_cell(133) ->
    #shipping_cell_data{id = 133, classify = 4, classes = 6,
                        lev = 1, item_base_id = 10621, need_num = 1,
                        weight = 100, exp = 190, ratio = 2000};
get_cell(134) ->
    #shipping_cell_data{id = 134, classify = 4, classes = 6,
                        lev = 1, item_base_id = 10622, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_cell(135) ->
    #shipping_cell_data{id = 135, classify = 4, classes = 6,
                        lev = 1, item_base_id = 10623, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_cell(136) ->
    #shipping_cell_data{id = 136, classify = 4, classes = 6,
                        lev = 1, item_base_id = 10624, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_cell(137) ->
    #shipping_cell_data{id = 137, classify = 4, classes = 6,
                        lev = 1, item_base_id = 10626, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_cell(138) ->
    #shipping_cell_data{id = 138, classify = 4, classes = 6,
                        lev = 1, item_base_id = 10631, need_num = 1,
                        weight = 100, exp = 400, ratio = 1500};
get_cell(139) ->
    #shipping_cell_data{id = 139, classify = 4, classes = 6,
                        lev = 1, item_base_id = 10632, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_cell(140) ->
    #shipping_cell_data{id = 140, classify = 4, classes = 6,
                        lev = 1, item_base_id = 10633, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_cell(141) ->
    #shipping_cell_data{id = 141, classify = 4, classes = 6,
                        lev = 1, item_base_id = 10634, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_cell(142) ->
    #shipping_cell_data{id = 142, classify = 4, classes = 6,
                        lev = 1, item_base_id = 10636, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_cell(143) ->
    #shipping_cell_data{id = 143, classify = 4, classes = 7,
                        lev = 1, item_base_id = 10711, need_num = 2,
                        weight = 100, exp = 25, ratio = 5000};
get_cell(144) ->
    #shipping_cell_data{id = 144, classify = 4, classes = 7,
                        lev = 1, item_base_id = 10712, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_cell(145) ->
    #shipping_cell_data{id = 145, classify = 4, classes = 7,
                        lev = 1, item_base_id = 10713, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_cell(146) ->
    #shipping_cell_data{id = 146, classify = 4, classes = 7,
                        lev = 1, item_base_id = 10714, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_cell(147) ->
    #shipping_cell_data{id = 147, classify = 4, classes = 7,
                        lev = 1, item_base_id = 10716, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_cell(148) ->
    #shipping_cell_data{id = 148, classify = 4, classes = 7,
                        lev = 1, item_base_id = 10721, need_num = 1,
                        weight = 100, exp = 190, ratio = 2000};
get_cell(149) ->
    #shipping_cell_data{id = 149, classify = 4, classes = 7,
                        lev = 1, item_base_id = 10722, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_cell(150) ->
    #shipping_cell_data{id = 150, classify = 4, classes = 7,
                        lev = 1, item_base_id = 10723, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_cell(151) ->
    #shipping_cell_data{id = 151, classify = 4, classes = 7,
                        lev = 1, item_base_id = 10724, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_cell(152) ->
    #shipping_cell_data{id = 152, classify = 4, classes = 7,
                        lev = 1, item_base_id = 10726, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_cell(153) ->
    #shipping_cell_data{id = 153, classify = 4, classes = 7,
                        lev = 1, item_base_id = 10731, need_num = 1,
                        weight = 100, exp = 400, ratio = 1500};
get_cell(154) ->
    #shipping_cell_data{id = 154, classify = 4, classes = 7,
                        lev = 1, item_base_id = 10732, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_cell(155) ->
    #shipping_cell_data{id = 155, classify = 4, classes = 7,
                        lev = 1, item_base_id = 10733, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_cell(156) ->
    #shipping_cell_data{id = 156, classify = 4, classes = 7,
                        lev = 1, item_base_id = 10734, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_cell(157) ->
    #shipping_cell_data{id = 157, classify = 4, classes = 7,
                        lev = 1, item_base_id = 10736, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_cell(_Id) -> none.

get_item(21525) ->
    #shipping_cell_data{id = 1, classify = 2, classes = 0,
                        lev = 1, item_base_id = 21525, need_num = 1,
                        weight = 235, exp = 1000, ratio = 1800};
get_item(21521) ->
    #shipping_cell_data{id = 2, classify = 2, classes = 0,
                        lev = 1, item_base_id = 21521, need_num = 1,
                        weight = 235, exp = 1000, ratio = 1800};
get_item(21522) ->
    #shipping_cell_data{id = 3, classify = 2, classes = 0,
                        lev = 1, item_base_id = 21522, need_num = 1,
                        weight = 235, exp = 1000, ratio = 1800};
get_item(21524) ->
    #shipping_cell_data{id = 4, classify = 2, classes = 0,
                        lev = 1, item_base_id = 21524, need_num = 1,
                        weight = 235, exp = 1000, ratio = 1800};
get_item(20042) ->
    #shipping_cell_data{id = 5, classify = 2, classes = 0,
                        lev = 50, item_base_id = 20042, need_num = 1,
                        weight = 60, exp = 2500, ratio = 2100};
get_item(21401) ->
    #shipping_cell_data{id = 11, classify = 1, classes = 0,
                        lev = 1, item_base_id = 21401, need_num = 1,
                        weight = 100, exp = 300, ratio = 1800};
get_item(21402) ->
    #shipping_cell_data{id = 12, classify = 1, classes = 0,
                        lev = 1, item_base_id = 21402, need_num = 1,
                        weight = 100, exp = 200, ratio = 1800};
get_item(21403) ->
    #shipping_cell_data{id = 13, classify = 1, classes = 0,
                        lev = 1, item_base_id = 21403, need_num = 1,
                        weight = 100, exp = 200, ratio = 1800};
get_item(21404) ->
    #shipping_cell_data{id = 14, classify = 1, classes = 0,
                        lev = 1, item_base_id = 21404, need_num = 1,
                        weight = 120, exp = 200, ratio = 1800};
get_item(21405) ->
    #shipping_cell_data{id = 15, classify = 1, classes = 0,
                        lev = 1, item_base_id = 21405, need_num = 1,
                        weight = 120, exp = 200, ratio = 1800};
get_item(21407) ->
    #shipping_cell_data{id = 17, classify = 1, classes = 0,
                        lev = 35, item_base_id = 21407, need_num = 1,
                        weight = 100, exp = 500, ratio = 1800};
get_item(21408) ->
    #shipping_cell_data{id = 18, classify = 1, classes = 0,
                        lev = 45, item_base_id = 21408, need_num = 1,
                        weight = 100, exp = 400, ratio = 1800};
get_item(21300) ->
    #shipping_cell_data{id = 19, classify = 5, classes = 0,
                        lev = 1, item_base_id = 21300, need_num = 2,
                        weight = 100, exp = 50, ratio = 1800};
get_item(21301) ->
    #shipping_cell_data{id = 20, classify = 5, classes = 0,
                        lev = 1, item_base_id = 21301, need_num = 2,
                        weight = 150, exp = 100, ratio = 1800};
get_item(21303) ->
    #shipping_cell_data{id = 21, classify = 5, classes = 0,
                        lev = 1, item_base_id = 21303, need_num = 2,
                        weight = 45, exp = 150, ratio = 1800};
get_item(21302) ->
    #shipping_cell_data{id = 22, classify = 5, classes = 0,
                        lev = 1, item_base_id = 21302, need_num = 2,
                        weight = 50, exp = 150, ratio = 1800};
get_item(21313) ->
    #shipping_cell_data{id = 23, classify = 5, classes = 0,
                        lev = 40, item_base_id = 21313, need_num = 2,
                        weight = 45, exp = 250, ratio = 1800};
get_item(21305) ->
    #shipping_cell_data{id = 24, classify = 5, classes = 0,
                        lev = 50, item_base_id = 21305, need_num = 1,
                        weight = 40, exp = 300, ratio = 1800};
get_item(21304) ->
    #shipping_cell_data{id = 25, classify = 5, classes = 0,
                        lev = 55, item_base_id = 21304, need_num = 1,
                        weight = 50, exp = 200, ratio = 1800};
get_item(21307) ->
    #shipping_cell_data{id = 26, classify = 5, classes = 0,
                        lev = 60, item_base_id = 21307, need_num = 1,
                        weight = 30, exp = 375, ratio = 1800};
get_item(21409) ->
    #shipping_cell_data{id = 27, classify = 5, classes = 0,
                        lev = 65, item_base_id = 21409, need_num = 1,
                        weight = 40, exp = 300, ratio = 1800};
get_item(21309) ->
    #shipping_cell_data{id = 28, classify = 5, classes = 0,
                        lev = 70, item_base_id = 21309, need_num = 1,
                        weight = 15, exp = 450, ratio = 1800};
get_item(21308) ->
    #shipping_cell_data{id = 29, classify = 5, classes = 0,
                        lev = 75, item_base_id = 21308, need_num = 1,
                        weight = 35, exp = 500, ratio = 1800};
get_item(21311) ->
    #shipping_cell_data{id = 127, classify = 5, classes = 0,
                        lev = 80, item_base_id = 21311, need_num = 1,
                        weight = 5, exp = 750, ratio = 1800};
get_item(21314) ->
    #shipping_cell_data{id = 30, classify = 5, classes = 0,
                        lev = 85, item_base_id = 21314, need_num = 1,
                        weight = 2, exp = 1000, ratio = 1800};
get_item(21410) ->
    #shipping_cell_data{id = 31, classify = 4, classes = 0,
                        lev = 1, item_base_id = 21410, need_num = 2,
                        weight = 100, exp = 5, ratio = 12000};
get_item(21411) ->
    #shipping_cell_data{id = 32, classify = 4, classes = 0,
                        lev = 1, item_base_id = 21411, need_num = 2,
                        weight = 100, exp = 5, ratio = 12000};
get_item(21412) ->
    #shipping_cell_data{id = 33, classify = 4, classes = 0,
                        lev = 1, item_base_id = 21412, need_num = 2,
                        weight = 100, exp = 9, ratio = 8000};
get_item(21413) ->
    #shipping_cell_data{id = 34, classify = 4, classes = 0,
                        lev = 1, item_base_id = 21413, need_num = 2,
                        weight = 100, exp = 9, ratio = 8000};
get_item(21414) ->
    #shipping_cell_data{id = 35, classify = 4, classes = 0,
                        lev = 1, item_base_id = 21414, need_num = 2,
                        weight = 100, exp = 6, ratio = 15000};
get_item(21400) ->
    #shipping_cell_data{id = 36, classify = 4, classes = 0,
                        lev = 1, item_base_id = 21400, need_num = 2,
                        weight = 200, exp = 18, ratio = 10000};
get_item(21406) ->
    #shipping_cell_data{id = 16, classify = 4, classes = 0,
                        lev = 1, item_base_id = 21406, need_num = 2,
                        weight = 100, exp = 400, ratio = 1400};
get_item(10511) ->
    #shipping_cell_data{id = 37, classify = 4, classes = 0,
                        lev = 1, item_base_id = 10511, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_item(10512) ->
    #shipping_cell_data{id = 38, classify = 4, classes = 0,
                        lev = 1, item_base_id = 10512, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_item(10514) ->
    #shipping_cell_data{id = 40, classify = 4, classes = 0,
                        lev = 1, item_base_id = 10514, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_item(10011) ->
    #shipping_cell_data{id = 41, classify = 4, classes = 1,
                        lev = 1, item_base_id = 10011, need_num = 2,
                        weight = 100, exp = 25, ratio = 5000};
get_item(10012) ->
    #shipping_cell_data{id = 42, classify = 4, classes = 1,
                        lev = 1, item_base_id = 10012, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_item(10013) ->
    #shipping_cell_data{id = 43, classify = 4, classes = 1,
                        lev = 1, item_base_id = 10013, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_item(10014) ->
    #shipping_cell_data{id = 44, classify = 4, classes = 1,
                        lev = 1, item_base_id = 10014, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_item(10016) ->
    #shipping_cell_data{id = 46, classify = 4, classes = 1,
                        lev = 1, item_base_id = 10016, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_item(10111) ->
    #shipping_cell_data{id = 47, classify = 4, classes = 2,
                        lev = 1, item_base_id = 10111, need_num = 2,
                        weight = 100, exp = 25, ratio = 5000};
get_item(10112) ->
    #shipping_cell_data{id = 48, classify = 4, classes = 2,
                        lev = 1, item_base_id = 10112, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_item(10113) ->
    #shipping_cell_data{id = 49, classify = 4, classes = 2,
                        lev = 1, item_base_id = 10113, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_item(10114) ->
    #shipping_cell_data{id = 50, classify = 4, classes = 2,
                        lev = 1, item_base_id = 10114, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_item(10116) ->
    #shipping_cell_data{id = 52, classify = 4, classes = 2,
                        lev = 1, item_base_id = 10116, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_item(10211) ->
    #shipping_cell_data{id = 53, classify = 4, classes = 3,
                        lev = 1, item_base_id = 10211, need_num = 2,
                        weight = 100, exp = 25, ratio = 5000};
get_item(10212) ->
    #shipping_cell_data{id = 54, classify = 4, classes = 3,
                        lev = 1, item_base_id = 10212, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_item(10213) ->
    #shipping_cell_data{id = 55, classify = 4, classes = 3,
                        lev = 1, item_base_id = 10213, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_item(10214) ->
    #shipping_cell_data{id = 56, classify = 4, classes = 3,
                        lev = 1, item_base_id = 10214, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_item(10216) ->
    #shipping_cell_data{id = 58, classify = 4, classes = 3,
                        lev = 1, item_base_id = 10216, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_item(10311) ->
    #shipping_cell_data{id = 59, classify = 4, classes = 4,
                        lev = 1, item_base_id = 10311, need_num = 2,
                        weight = 100, exp = 25, ratio = 5000};
get_item(10312) ->
    #shipping_cell_data{id = 60, classify = 4, classes = 4,
                        lev = 1, item_base_id = 10312, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_item(10313) ->
    #shipping_cell_data{id = 61, classify = 4, classes = 4,
                        lev = 1, item_base_id = 10313, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_item(10314) ->
    #shipping_cell_data{id = 62, classify = 4, classes = 4,
                        lev = 1, item_base_id = 10314, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_item(10316) ->
    #shipping_cell_data{id = 64, classify = 4, classes = 4,
                        lev = 1, item_base_id = 10316, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_item(10411) ->
    #shipping_cell_data{id = 65, classify = 4, classes = 5,
                        lev = 1, item_base_id = 10411, need_num = 2,
                        weight = 100, exp = 25, ratio = 5000};
get_item(10412) ->
    #shipping_cell_data{id = 66, classify = 4, classes = 5,
                        lev = 1, item_base_id = 10412, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_item(10413) ->
    #shipping_cell_data{id = 67, classify = 4, classes = 5,
                        lev = 1, item_base_id = 10413, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_item(10414) ->
    #shipping_cell_data{id = 68, classify = 4, classes = 5,
                        lev = 1, item_base_id = 10414, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_item(10416) ->
    #shipping_cell_data{id = 70, classify = 4, classes = 5,
                        lev = 1, item_base_id = 10416, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_item(10521) ->
    #shipping_cell_data{id = 71, classify = 4, classes = 0,
                        lev = 1, item_base_id = 10521, need_num = 1,
                        weight = 100, exp = 130, ratio = 2000};
get_item(10522) ->
    #shipping_cell_data{id = 72, classify = 4, classes = 0,
                        lev = 1, item_base_id = 10522, need_num = 1,
                        weight = 100, exp = 130, ratio = 2000};
get_item(10524) ->
    #shipping_cell_data{id = 73, classify = 4, classes = 0,
                        lev = 1, item_base_id = 10524, need_num = 1,
                        weight = 100, exp = 130, ratio = 2000};
get_item(10021) ->
    #shipping_cell_data{id = 74, classify = 4, classes = 1,
                        lev = 1, item_base_id = 10021, need_num = 1,
                        weight = 100, exp = 190, ratio = 2000};
get_item(10022) ->
    #shipping_cell_data{id = 75, classify = 4, classes = 1,
                        lev = 1, item_base_id = 10022, need_num = 1,
                        weight = 100, exp = 130, ratio = 2000};
get_item(10023) ->
    #shipping_cell_data{id = 76, classify = 4, classes = 1,
                        lev = 1, item_base_id = 10023, need_num = 1,
                        weight = 100, exp = 130, ratio = 2000};
get_item(10024) ->
    #shipping_cell_data{id = 77, classify = 4, classes = 1,
                        lev = 1, item_base_id = 10024, need_num = 1,
                        weight = 100, exp = 130, ratio = 2000};
get_item(10026) ->
    #shipping_cell_data{id = 78, classify = 4, classes = 1,
                        lev = 1, item_base_id = 10026, need_num = 1,
                        weight = 100, exp = 130, ratio = 2000};
get_item(10121) ->
    #shipping_cell_data{id = 79, classify = 4, classes = 2,
                        lev = 1, item_base_id = 10121, need_num = 1,
                        weight = 100, exp = 190, ratio = 2000};
get_item(10122) ->
    #shipping_cell_data{id = 80, classify = 4, classes = 2,
                        lev = 1, item_base_id = 10122, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_item(10123) ->
    #shipping_cell_data{id = 81, classify = 4, classes = 2,
                        lev = 1, item_base_id = 10123, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_item(10124) ->
    #shipping_cell_data{id = 82, classify = 4, classes = 2,
                        lev = 1, item_base_id = 10124, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_item(10126) ->
    #shipping_cell_data{id = 83, classify = 4, classes = 2,
                        lev = 1, item_base_id = 10126, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_item(10221) ->
    #shipping_cell_data{id = 84, classify = 4, classes = 3,
                        lev = 1, item_base_id = 10221, need_num = 1,
                        weight = 100, exp = 190, ratio = 2000};
get_item(10222) ->
    #shipping_cell_data{id = 85, classify = 4, classes = 3,
                        lev = 1, item_base_id = 10222, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_item(10223) ->
    #shipping_cell_data{id = 86, classify = 4, classes = 3,
                        lev = 1, item_base_id = 10223, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_item(10224) ->
    #shipping_cell_data{id = 87, classify = 4, classes = 3,
                        lev = 1, item_base_id = 10224, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_item(10226) ->
    #shipping_cell_data{id = 88, classify = 4, classes = 3,
                        lev = 1, item_base_id = 10226, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_item(10321) ->
    #shipping_cell_data{id = 89, classify = 4, classes = 4,
                        lev = 1, item_base_id = 10321, need_num = 1,
                        weight = 100, exp = 190, ratio = 2000};
get_item(10322) ->
    #shipping_cell_data{id = 90, classify = 4, classes = 4,
                        lev = 1, item_base_id = 10322, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_item(10323) ->
    #shipping_cell_data{id = 91, classify = 4, classes = 4,
                        lev = 1, item_base_id = 10323, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_item(10324) ->
    #shipping_cell_data{id = 92, classify = 4, classes = 4,
                        lev = 1, item_base_id = 10324, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_item(10326) ->
    #shipping_cell_data{id = 93, classify = 4, classes = 4,
                        lev = 1, item_base_id = 10326, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_item(10421) ->
    #shipping_cell_data{id = 94, classify = 4, classes = 5,
                        lev = 1, item_base_id = 10421, need_num = 1,
                        weight = 100, exp = 190, ratio = 2000};
get_item(10422) ->
    #shipping_cell_data{id = 95, classify = 4, classes = 5,
                        lev = 1, item_base_id = 10422, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_item(10423) ->
    #shipping_cell_data{id = 96, classify = 4, classes = 5,
                        lev = 1, item_base_id = 10423, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_item(10424) ->
    #shipping_cell_data{id = 97, classify = 4, classes = 5,
                        lev = 1, item_base_id = 10424, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_item(10426) ->
    #shipping_cell_data{id = 98, classify = 4, classes = 5,
                        lev = 1, item_base_id = 10426, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_item(10531) ->
    #shipping_cell_data{id = 99, classify = 4, classes = 0,
                        lev = 1, item_base_id = 10531, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_item(10532) ->
    #shipping_cell_data{id = 100, classify = 4, classes = 0,
                        lev = 1, item_base_id = 10532, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_item(10534) ->
    #shipping_cell_data{id = 101, classify = 4, classes = 0,
                        lev = 1, item_base_id = 10534, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_item(10031) ->
    #shipping_cell_data{id = 102, classify = 4, classes = 1,
                        lev = 1, item_base_id = 10031, need_num = 1,
                        weight = 100, exp = 400, ratio = 1500};
get_item(10032) ->
    #shipping_cell_data{id = 103, classify = 4, classes = 1,
                        lev = 1, item_base_id = 10032, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_item(10033) ->
    #shipping_cell_data{id = 104, classify = 4, classes = 1,
                        lev = 1, item_base_id = 10033, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_item(10034) ->
    #shipping_cell_data{id = 105, classify = 4, classes = 1,
                        lev = 1, item_base_id = 10034, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_item(10036) ->
    #shipping_cell_data{id = 106, classify = 4, classes = 1,
                        lev = 1, item_base_id = 10036, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_item(10131) ->
    #shipping_cell_data{id = 107, classify = 4, classes = 2,
                        lev = 1, item_base_id = 10131, need_num = 1,
                        weight = 100, exp = 400, ratio = 1500};
get_item(10132) ->
    #shipping_cell_data{id = 108, classify = 4, classes = 2,
                        lev = 1, item_base_id = 10132, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_item(10133) ->
    #shipping_cell_data{id = 109, classify = 4, classes = 2,
                        lev = 1, item_base_id = 10133, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_item(10134) ->
    #shipping_cell_data{id = 110, classify = 4, classes = 2,
                        lev = 1, item_base_id = 10134, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_item(10136) ->
    #shipping_cell_data{id = 111, classify = 4, classes = 2,
                        lev = 1, item_base_id = 10136, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_item(10231) ->
    #shipping_cell_data{id = 112, classify = 4, classes = 3,
                        lev = 1, item_base_id = 10231, need_num = 1,
                        weight = 100, exp = 400, ratio = 1500};
get_item(10232) ->
    #shipping_cell_data{id = 113, classify = 4, classes = 3,
                        lev = 1, item_base_id = 10232, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_item(10233) ->
    #shipping_cell_data{id = 114, classify = 4, classes = 3,
                        lev = 1, item_base_id = 10233, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_item(10234) ->
    #shipping_cell_data{id = 115, classify = 4, classes = 3,
                        lev = 1, item_base_id = 10234, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_item(10236) ->
    #shipping_cell_data{id = 116, classify = 4, classes = 3,
                        lev = 1, item_base_id = 10236, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_item(10331) ->
    #shipping_cell_data{id = 117, classify = 4, classes = 4,
                        lev = 1, item_base_id = 10331, need_num = 1,
                        weight = 100, exp = 400, ratio = 1500};
get_item(10332) ->
    #shipping_cell_data{id = 118, classify = 4, classes = 4,
                        lev = 1, item_base_id = 10332, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_item(10333) ->
    #shipping_cell_data{id = 119, classify = 4, classes = 4,
                        lev = 1, item_base_id = 10333, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_item(10334) ->
    #shipping_cell_data{id = 120, classify = 4, classes = 4,
                        lev = 1, item_base_id = 10334, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_item(10336) ->
    #shipping_cell_data{id = 121, classify = 4, classes = 4,
                        lev = 1, item_base_id = 10336, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_item(10431) ->
    #shipping_cell_data{id = 122, classify = 4, classes = 5,
                        lev = 1, item_base_id = 10431, need_num = 1,
                        weight = 100, exp = 400, ratio = 1500};
get_item(10432) ->
    #shipping_cell_data{id = 123, classify = 4, classes = 5,
                        lev = 1, item_base_id = 10432, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_item(10433) ->
    #shipping_cell_data{id = 124, classify = 4, classes = 5,
                        lev = 1, item_base_id = 10433, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_item(10434) ->
    #shipping_cell_data{id = 125, classify = 4, classes = 5,
                        lev = 1, item_base_id = 10434, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_item(10436) ->
    #shipping_cell_data{id = 126, classify = 4, classes = 5,
                        lev = 1, item_base_id = 10436, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_item(10611) ->
    #shipping_cell_data{id = 128, classify = 4, classes = 6,
                        lev = 1, item_base_id = 10611, need_num = 2,
                        weight = 100, exp = 25, ratio = 5000};
get_item(10612) ->
    #shipping_cell_data{id = 129, classify = 4, classes = 6,
                        lev = 1, item_base_id = 10612, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_item(10613) ->
    #shipping_cell_data{id = 130, classify = 4, classes = 6,
                        lev = 1, item_base_id = 10613, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_item(10614) ->
    #shipping_cell_data{id = 131, classify = 4, classes = 6,
                        lev = 1, item_base_id = 10614, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_item(10616) ->
    #shipping_cell_data{id = 132, classify = 4, classes = 6,
                        lev = 1, item_base_id = 10616, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_item(10621) ->
    #shipping_cell_data{id = 133, classify = 4, classes = 6,
                        lev = 1, item_base_id = 10621, need_num = 1,
                        weight = 100, exp = 190, ratio = 2000};
get_item(10622) ->
    #shipping_cell_data{id = 134, classify = 4, classes = 6,
                        lev = 1, item_base_id = 10622, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_item(10623) ->
    #shipping_cell_data{id = 135, classify = 4, classes = 6,
                        lev = 1, item_base_id = 10623, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_item(10624) ->
    #shipping_cell_data{id = 136, classify = 4, classes = 6,
                        lev = 1, item_base_id = 10624, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_item(10626) ->
    #shipping_cell_data{id = 137, classify = 4, classes = 6,
                        lev = 1, item_base_id = 10626, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_item(10631) ->
    #shipping_cell_data{id = 138, classify = 4, classes = 6,
                        lev = 1, item_base_id = 10631, need_num = 1,
                        weight = 100, exp = 400, ratio = 1500};
get_item(10632) ->
    #shipping_cell_data{id = 139, classify = 4, classes = 6,
                        lev = 1, item_base_id = 10632, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_item(10633) ->
    #shipping_cell_data{id = 140, classify = 4, classes = 6,
                        lev = 1, item_base_id = 10633, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_item(10634) ->
    #shipping_cell_data{id = 141, classify = 4, classes = 6,
                        lev = 1, item_base_id = 10634, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_item(10636) ->
    #shipping_cell_data{id = 142, classify = 4, classes = 6,
                        lev = 1, item_base_id = 10636, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_item(10711) ->
    #shipping_cell_data{id = 143, classify = 4, classes = 7,
                        lev = 1, item_base_id = 10711, need_num = 2,
                        weight = 100, exp = 25, ratio = 5000};
get_item(10712) ->
    #shipping_cell_data{id = 144, classify = 4, classes = 7,
                        lev = 1, item_base_id = 10712, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_item(10713) ->
    #shipping_cell_data{id = 145, classify = 4, classes = 7,
                        lev = 1, item_base_id = 10713, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_item(10714) ->
    #shipping_cell_data{id = 146, classify = 4, classes = 7,
                        lev = 1, item_base_id = 10714, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_item(10716) ->
    #shipping_cell_data{id = 147, classify = 4, classes = 7,
                        lev = 1, item_base_id = 10716, need_num = 2,
                        weight = 100, exp = 14, ratio = 5000};
get_item(10721) ->
    #shipping_cell_data{id = 148, classify = 4, classes = 7,
                        lev = 1, item_base_id = 10721, need_num = 1,
                        weight = 100, exp = 190, ratio = 2000};
get_item(10722) ->
    #shipping_cell_data{id = 149, classify = 4, classes = 7,
                        lev = 1, item_base_id = 10722, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_item(10723) ->
    #shipping_cell_data{id = 150, classify = 4, classes = 7,
                        lev = 1, item_base_id = 10723, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_item(10724) ->
    #shipping_cell_data{id = 151, classify = 4, classes = 7,
                        lev = 1, item_base_id = 10724, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_item(10726) ->
    #shipping_cell_data{id = 152, classify = 4, classes = 7,
                        lev = 1, item_base_id = 10726, need_num = 1,
                        weight = 100, exp = 120, ratio = 2000};
get_item(10731) ->
    #shipping_cell_data{id = 153, classify = 4, classes = 7,
                        lev = 1, item_base_id = 10731, need_num = 1,
                        weight = 100, exp = 400, ratio = 1500};
get_item(10732) ->
    #shipping_cell_data{id = 154, classify = 4, classes = 7,
                        lev = 1, item_base_id = 10732, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_item(10733) ->
    #shipping_cell_data{id = 155, classify = 4, classes = 7,
                        lev = 1, item_base_id = 10733, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_item(10734) ->
    #shipping_cell_data{id = 156, classify = 4, classes = 7,
                        lev = 1, item_base_id = 10734, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_item(10736) ->
    #shipping_cell_data{id = 157, classify = 4, classes = 7,
                        lev = 1, item_base_id = 10736, need_num = 1,
                        weight = 100, exp = 290, ratio = 1500};
get_item(_BaseId) -> false.

quest_cells() ->
    [#shipping_cell_quset_data{id = 1001, classify = 7,
                               item_base_id = 29180, ratio = 150,
                               quest_id = 81110, week_min = 0, week_max = 1},
     #shipping_cell_quset_data{id = 1002, classify = 8,
                               item_base_id = 29182, ratio = 150,
                               quest_id = 30001, week_min = 0, week_max = 1},
     #shipping_cell_quset_data{id = 1003, classify = 9,
                               item_base_id = 29181, ratio = 0,
                               quest_id = 76501, week_min = 0, week_max = 0}].

get_quest(81110) ->
    #quest_shipping_data{id = 81110, type = 1, ring = 1,
                         max_ring = 4, next_id = 81120, exp_mode = 3313,
                         ratio = 1100, leader_exp_mode = 3313,
                         leader_ratio = 1100};
get_quest(81120) ->
    #quest_shipping_data{id = 81120, type = 1, ring = 2,
                         max_ring = 4, next_id = 81130, exp_mode = 3313,
                         ratio = 1200, leader_exp_mode = 3313,
                         leader_ratio = 1200};
get_quest(81130) ->
    #quest_shipping_data{id = 81130, type = 1, ring = 3,
                         max_ring = 4, next_id = 81140, exp_mode = 3313,
                         ratio = 1400, leader_exp_mode = 3313,
                         leader_ratio = 1400};
get_quest(81140) ->
    #quest_shipping_data{id = 81140, type = 1, ring = 4,
                         max_ring = 4, next_id = 0, exp_mode = 3313,
                         ratio = 2200, leader_exp_mode = 3313,
                         leader_ratio = 2200};
get_quest(_) -> false.

get_quest_reward({81140, Val})
    when Val >= 1 andalso Val =< 1 ->
    #quest_shipping_reward_data{id = 81140, min = 1,
                                max = 1, ratio = 2200, need_num = 3,
                                rewards = [{90013, 270}], exp_mode = 3313,
                                mate_exp_mode = 0};
get_quest_reward({81140, Val})
    when Val >= 2 andalso Val =< 2 ->
    #quest_shipping_reward_data{id = 81140, min = 2,
                                max = 2, ratio = 2200, need_num = 4,
                                rewards = [{90013, 360}], exp_mode = 3313,
                                mate_exp_mode = 0};
get_quest_reward({81140, Val})
    when Val >= 3 andalso Val =< 3 ->
    #quest_shipping_reward_data{id = 81140, min = 3,
                                max = 3, ratio = 2200, need_num = 5,
                                rewards = [{90013, 450}], exp_mode = 3313,
                                mate_exp_mode = 0};
get_quest_reward({81140, Val})
    when Val >= 4 andalso Val =< 4 ->
    #quest_shipping_reward_data{id = 81140, min = 4,
                                max = 4, ratio = 2200, need_num = 6,
                                rewards = [{90013, 540}], exp_mode = 3313,
                                mate_exp_mode = 0};
get_quest_reward({81140, Val})
    when Val >= 5 andalso Val =< 5 ->
    #quest_shipping_reward_data{id = 81140, min = 5,
                                max = 5, ratio = 2200, need_num = 7,
                                rewards = [{90013, 630}], exp_mode = 3313,
                                mate_exp_mode = 0};
get_quest_reward({30001, Val})
    when Val >= 0 andalso Val =< 5 ->
    #quest_shipping_reward_data{id = 30001, min = 0,
                                max = 5, ratio = 2200, need_num = 0,
                                rewards = [{90013, 360}], exp_mode = 3313,
                                mate_exp_mode = 3313};
get_quest_reward({30001, Val})
    when Val >= 6 andalso Val =< 10 ->
    #quest_shipping_reward_data{id = 30001, min = 6,
                                max = 10, ratio = 2200, need_num = 0,
                                rewards = [{90013, 430}], exp_mode = 3313,
                                mate_exp_mode = 3313};
get_quest_reward({30001, Val})
    when Val >= 11 andalso Val =< 15 ->
    #quest_shipping_reward_data{id = 30001, min = 11,
                                max = 15, ratio = 2200, need_num = 0,
                                rewards = [{90013, 460}], exp_mode = 3313,
                                mate_exp_mode = 3313};
get_quest_reward({30001, Val})
    when Val >= 16 andalso Val =< 999 ->
    #quest_shipping_reward_data{id = 30001, min = 16,
                                max = 999, ratio = 2200, need_num = 0,
                                rewards = [{90013, 500}], exp_mode = 3313,
                                mate_exp_mode = 3313};
get_quest_reward({76501, Val})
    when Val >= 0 andalso Val =< 5 ->
    #quest_shipping_reward_data{id = 76501, min = 0,
                                max = 5, ratio = 0, need_num = 0,
                                rewards = [{90013, 200}], exp_mode = 0,
                                mate_exp_mode = 0};
get_quest_reward({76501, Val})
    when Val >= 6 andalso Val =< 10 ->
    #quest_shipping_reward_data{id = 76501, min = 6,
                                max = 10, ratio = 0, need_num = 0,
                                rewards = [{90013, 240}], exp_mode = 0,
                                mate_exp_mode = 0};
get_quest_reward({76501, Val})
    when Val >= 11 andalso Val =< 15 ->
    #quest_shipping_reward_data{id = 76501, min = 11,
                                max = 15, ratio = 0, need_num = 0,
                                rewards = [{90013, 260}], exp_mode = 0,
                                mate_exp_mode = 0};
get_quest_reward({76501, Val})
    when Val >= 16 andalso Val =< 20 ->
    #quest_shipping_reward_data{id = 76501, min = 16,
                                max = 20, ratio = 0, need_num = 0,
                                rewards = [{90013, 280}], exp_mode = 0,
                                mate_exp_mode = 0};
get_quest_reward({76501, Val})
    when Val >= 21 andalso Val =< 999 ->
    #quest_shipping_reward_data{id = 76501, min = 21,
                                max = 999, ratio = 0, need_num = 0,
                                rewards = [{90013, 300}], exp_mode = 0,
                                mate_exp_mode = 0};
get_quest_reward(_) -> false.

get_combat_unit(1) -> 76501;
get_combat_unit(2) -> 76502;
get_combat_unit(3) -> 76503;
get_combat_unit(4) -> 76504;
get_combat_unit(5) -> 76505;
get_combat_unit(_) -> 0.

get_unit_score(76501) -> 1;
get_unit_score(76502) -> 2;
get_unit_score(76503) -> 3;
get_unit_score(76504) -> 4;
get_unit_score(76505) -> 5;
get_unit_score(91210) -> 1;
get_unit_score(91209) -> 1;
get_unit_score(91211) -> 1;
get_unit_score(91109) -> 1;
get_unit_score(91111) -> 1;
get_unit_score(_) -> 0.

get_box(73252) ->
    [#{id => 1, item_id => 90013, bind => 0, num => 20,
       weight => 80, is_cast => 0},
     #{id => 2, item_id => 90013, bind => 0, num => 30,
       weight => 65, is_cast => 0},
     #{id => 3, item_id => 90013, bind => 0, num => 40,
       weight => 90, is_cast => 0},
     #{id => 4, item_id => 90013, bind => 0, num => 50,
       weight => 80, is_cast => 0},
     #{id => 5, item_id => 90013, bind => 0, num => 60,
       weight => 80, is_cast => 0},
     #{id => 6, item_id => 90013, bind => 0, num => 70,
       weight => 110, is_cast => 0},
     #{id => 7, item_id => 90013, bind => 0, num => 80,
       weight => 80, is_cast => 0},
     #{id => 8, item_id => 90013, bind => 0, num => 120,
       weight => 35, is_cast => 0},
     #{id => 9, item_id => 90013, bind => 0, num => 150,
       weight => 25, is_cast => 0},
     #{id => 10, item_id => 90013, bind => 0, num => 180,
       weight => 20, is_cast => 0},
     #{id => 11, item_id => 90013, bind => 0, num => 300,
       weight => 20, is_cast => 0},
     #{id => 12, item_id => 90013, bind => 0, num => 30,
       weight => 65, is_cast => 0},
     #{id => 13, item_id => 90013, bind => 0, num => 40,
       weight => 90, is_cast => 0},
     #{id => 14, item_id => 90013, bind => 0, num => 50,
       weight => 80, is_cast => 0},
     #{id => 15, item_id => 90013, bind => 0, num => 60,
       weight => 80, is_cast => 0}];
get_box(_) -> [].

