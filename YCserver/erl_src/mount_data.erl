-file("src/data/mount_data.erl", 1).

-module(mount_data).

-export([get_init_appearance/1,
         get/1,
         get_lev/1,
         get_base_attr/1,
         get_speed_attr/1,
         get_incubate/1,
         get_skill_info/1,
         get_aptitude/1,
         get_aptitude_cost/1,
         get_decorate/1,
         list_goal/1,
         get_mount_goal/1,
         get_combat_egg_val/1,
         get_rand_skill_cost/1,
         get_rand_skill/1,
         get_growth_add/1,
         get_upgrade_attr/1,
         get_appearance_attr/1,
         get_item_decorate/1,
         get_combat_cost_spirit/1,
         get_growth_val/1,
         get_decorate_need_item/1,
         get_synthetise_cost/1,
         get_appearance_score/1,
         get_appearance_index/1,
         get_mount_skill/1,
         get_mount_manger/1,
         get_attr_add_type/1,
         get_appearance_collect_val/1,
         get_mount_dye/1,
         get_sprog_mount/1,
         get_sprog_mount_name/1,
         get_mount_evolution/1,
         get_select_skill_cost/1,
         get_double_riders/0]).

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

-file("src/data/mount_data.erl", 48).

-file("inc/quest.hrl", 1).

-file("inc/quest_king.hrl", 1).

-record(quest_king,
        {ver = 1,
         stage = 1,
         finish = [],
         doing = [],
         rf_times = 0}).

-file("inc/quest.hrl", 36).

-record(quest_data,
        {id = 1 :: pos_integer(),
         phase = 1 :: pos_integer(),
         quest_line = 1,
         type = 1 :: pos_integer(),
         sec_type = 1 :: pos_integer(),
         name = "" :: list(),
         mode = 1 :: pos_integer(),
         leader_cond = [] :: [tuple()],
         is_leader_quest = 0 :: 0 | 1,
         can_giveup = 0 :: 0..1,
         lev = 1 :: pos_integer(),
         lev_break_min_times = 0 :: non_neg_integer(),
         lev_break_max_times = 0 :: non_neg_integer(),
         max_lev = 0 :: non_neg_integer(),
         auto_finished_lev = 0 :: non_neg_integer(),
         classes = 0 :: 0..4,
         pre_quest ::
             undefined | non_neg_integer() | [non_neg_integer()],
         check_distance = 0 :: 0..1,
         npc_accept_battle = 0 :: non_neg_integer(),
         npc_accept_id = 0 :: non_neg_integer(),
         npc_accept = 0 :: non_neg_integer(),
         npc_commit_battle = 0 :: non_neg_integer(),
         npc_commit_id = 0 :: non_neg_integer(),
         npc_commit = 0 :: non_neg_integer(),
         start_time = 0 ::
             tuple() | non_neg_integer() | undefined,
         end_time = 0 :: tuple() | non_neg_integer() | undefined,
         condition = [] :: [tuple()],
         progress = [] :: [tuple()],
         rewards_accept = [] :: [tuple()],
         rewards_commit = [] :: [tuple()],
         commit_loss = [] :: [tuple()],
         rewards_vip = [] :: [tuple()],
         action_accept = [] :: [tuple()],
         action_commit = [] :: [tuple()],
         times = 1 :: non_neg_integer(),
         desc = "" :: list(),
         auto_accept = 0 :: 0..1,
         is_auto_finished_gain = 0 :: 0..1,
         weekdays = [] :: [pos_integer()],
         white_list = [] :: list(),
         black_list = [] :: list(),
         notice_msg = "" :: list(),
         val_from_prev = 0 :: 0..1,
         honor = 0 :: non_neg_integer(),
         ach_num = 0 :: non_neg_integer(),
         rewards_badge = 0 :: non_neg_integer(),
         day = 0 :: non_neg_integer(),
         extra = []}).

-record(quest_extra_data,
        {name = 0, classes = 0, val1 = 0, val2 = 0, list = []}).

-record(quest_classes,
        {quest_id = 0,
         first_time = 0,
         ring = 1,
         round = 0,
         total_count = 0,
         done_list = []}).

-record(quest_offer,
        {quest_id = 0,
         day_count = 0,
         leader_count = 0,
         leader_quest_count = 0,
         round = 0,
         total_count = 0,
         team_args = []}).

-record(quest_treasure,
        {quest_id = 0, round = 0, total_count = 0}).

-record(quest_guild,
        {quest_id = 0,
         last_accepted = 0,
         ring = 1,
         round = 0,
         total_count = 0,
         done_list = []}).

-record(quest_chain,
        {quest_id = 0,
         accept_time = 0,
         type = 0,
         ext_data = [],
         round = 0,
         total_count = 0,
         commit_npc}).

-record(quest_marriage,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         round = 0,
         total_count = 0,
         ext_data = quest_marriage:quest_ext_data()}).

-record(quest_couple,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         round = 0,
         total_count = 0,
         partner_id,
         ext_data = quest_couple:quest_ext_data()}).

-record(quest_prac,
        {part = 1, chapter = 2, section = 0}).

-record(quest_plant,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         unit_id = 0,
         phase = 0,
         pos = {0, 0, 0},
         done_list = []}).

-record(quest_teacher,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         partner_id,
         round = 0,
         total_count = 0,
         stats = [],
         ext_data = quest_teacher:quest_ext_data()}).

-record(quest_shipping, {list = []}).

-record(quest_pursue,
        {quest_id = 0,
         last_accepted = 0,
         round_started = 0,
         ring = 1,
         round = 0,
         total_count = 0,
         done_list = []}).

-record(quest_child,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         mode = 1,
         unit_id = 0,
         done_list = []}).

-record(quest_pregnancy,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         mode = 1,
         done_list = []}).

-record(quest_acquaintance,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         partner_id = 0,
         partner_name = "",
         done_list = [],
         ring = 0,
         rpc_accepted = 0}).

-record(quest_summer,
        {ver = 1,
         finish = [],
         doing = [],
         score = 0,
         rewarded = []}).

-record(quest_single_dog,
        {ver = 1, finish = [], round = 1, extra = #{}}).

-record(quest_sign_draw, {finish = [], doing = []}).

-record(quest_score_exchange,
        {finish = [], doing = []}).

-record(quest_long_active, {finish = [], doing = []}).

-record(m_quest,
        {ver = 19,
         quest = [] :: list(),
         acceptable = [] :: list(),
         finished = [] :: list(),
         day_finished = [],
         quest_classes = #quest_classes{} :: #quest_classes{},
         quest_offer = #quest_offer{} :: #quest_offer{},
         quest_prac = #quest_prac{} :: #quest_prac{},
         quest_treasure = #quest_treasure{},
         quest_guild = #quest_guild{},
         quest_chain = #quest_chain{},
         quest_marriage = #quest_marriage{},
         quest_couple = #quest_couple{},
         quest_plant = #quest_plant{},
         quest_teacher = #quest_teacher{},
         quest_shipping = #quest_shipping{},
         quest_pursue = #quest_pursue{},
         quest_line = 2,
         quest_child = #quest_child{},
         quest_pregnancy = #quest_pregnancy{},
         quest_acquaintance = #quest_acquaintance{},
         quest_king = #quest_king{},
         quest_summer = #quest_summer{},
         quest_single_dog = #quest_single_dog{},
         quest_sign_draw = #quest_sign_draw{},
         quest_score_exchange = #quest_score_exchange{},
         quest_long_active = #quest_long_active{}}).

-record(quest,
        {id = 1 :: pos_integer(),
         name = "" :: binary(),
         type = 1 :: pos_integer(),
         sec_type = 1 :: pos_integer(),
         finish = 0 :: 0..2,
         quality = 0 :: 0..4,
         progress = [] :: [tuple()],
         accept_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         finish_time = 0 :: non_neg_integer(),
         round = 0 :: non_neg_integer()}).

-record(quest_progress,
        {id = 0 :: non_neg_integer(),
         label :: undefined | atom(),
         target = 0 :: non_neg_integer(),
         param = [] :: list(),
         finish = 0 :: 0..1,
         trigger :: undefined | tuple(),
         target_val = 1 :: pos_integer(),
         value = 0 :: non_neg_integer(),
         msg = "" :: bitstring() | string(),
         ext_data = [] :: [tuple()],
         dyn_ext_data = [] :: [tuple()]}).

-record(quest_rewards,
        {prob = 1000 :: pos_integer(),
         classes = 0 :: 0..4,
         gain :: undefined | tuple(),
         action :: undefined | function()}).

-record(quest_stats,
        {sec_type = 1, stats = [], desc = []}).

-file("src/data/mount_data.erl", 49).

get_init_appearance({1, 1}) -> [{1011, 100}, {1012, 0}];
get_init_appearance({1, 2}) -> [{1021, 100}, {1022, 0}];
get_init_appearance({1, 3}) -> [{1031, 100}, {1032, 0}];
get_init_appearance({1, 4}) -> [{1041, 100}, {1042, 0}];
get_init_appearance({1, 5}) -> [{1051, 100}, {1052, 0}];
get_init_appearance({1, 6}) -> [{1061, 100}, {1062, 0}];
get_init_appearance({1, 7}) -> [{1071, 100}, {1072, 0}];
get_init_appearance({2, 1}) ->
    [{1101, 500}, {1111, 500}];
get_init_appearance({2, 2}) ->
    [{1102, 500}, {1112, 500}];
get_init_appearance({2, 3}) ->
    [{1103, 500}, {1113, 500}];
get_init_appearance({2, 4}) ->
    [{1104, 500}, {1114, 500}];
get_init_appearance({2, 5}) ->
    [{1105, 500}, {1115, 500}];
get_init_appearance({2, 0}) -> [{1106, 0}, {1116, 0}];
get_init_appearance({2, 6}) ->
    [{1107, 500}, {1117, 500}];
get_init_appearance({2, 7}) ->
    [{1108, 500}, {1118, 500}];
get_init_appearance({3, 1}) -> [{1201, 100}];
get_init_appearance({3, 2}) -> [{1202, 100}];
get_init_appearance({3, 3}) -> [{1203, 100}];
get_init_appearance({3, 4}) -> [{1204, 100}];
get_init_appearance({3, 5}) -> [{1205, 100}];
get_init_appearance({3, 0}) -> [{1206, 0}];
get_init_appearance({3, 6}) -> [{1207, 100}];
get_init_appearance({3, 7}) -> [{1208, 100}];
get_init_appearance({100, 1}) -> [{1300, 1}, {1310, 2}];
get_init_appearance({100, 2}) -> [{1301, 1}, {1311, 2}];
get_init_appearance({100, 3}) -> [{1302, 1}, {1312, 2}];
get_init_appearance({100, 4}) -> [{1303, 1}, {1313, 2}];
get_init_appearance({100, 5}) -> [{1304, 1}, {1314, 2}];
get_init_appearance({100, 6}) -> [{1305, 1}, {1315, 2}];
get_init_appearance({100, 7}) -> [{1306, 1}, {1316, 2}];
get_init_appearance({1, 0}) ->
    [{2000, 0},
     {2001, 0},
     {2002, 0},
     {2003, 0},
     {2004, 0},
     {2005, 0},
     {2006, 0},
     {2007, 0},
     {2008, 0},
     {2009, 0},
     {2010, 0},
     {2011, 0},
     {2012, 0},
     {2013, 0},
     {2014, 0},
     {2015, 0},
     {2016, 0},
     {2017, 0},
     {2018, 0},
     {2019, 0},
     {2021, 0},
     {2020, 0},
     {2023, 0},
     {2024, 0},
     {2025, 0},
     {2026, 0},
     {2027, 0},
     {2028, 0},
     {2029, 0},
     {2030, 0},
     {2031, 0},
     {2032, 0},
     {2033, 0},
     {2034, 0},
     {2035, 0},
     {2036, 0},
     {1998, 0},
     {1999, 0},
     {2038, 0},
     {2039, 0},
     {2040, 0},
     {2041, 0},
     {2042, 0},
     {2043, 0},
     {2044, 0},
     {2045, 0},
     {2046, 0},
     {2047, 0},
     {2048, 0},
     {2049, 0},
     {2050, 0},
     {2052, 0},
     {2051, 0},
     {2053, 0},
     {2054, 0},
     {2055, 0},
     {2056, 0},
     {2057, 0},
     {2058, 0},
     {2059, 0},
     {2060, 0},
     {2061, 0},
     {2062, 0},
     {2063, 0},
     {2064, 0},
     {2065, 0},
     {2066, 0},
     {2067, 0},
     {2068, 0},
     {2069, 0},
     {2070, 0},
     {2071, 0},
     {2072, 0},
     {2073, 0},
     {2074, 0},
     {2075, 0},
     {2076, 0},
     {2077, 0},
     {2078, 0},
     {2079, 0},
     {2080, 0},
     {2081, 0},
     {2082, 0},
     {2083, 0},
     {2084, 0},
     {2085, 0},
     {2086, 0},
     {2087, 0},
     {2088, 0},
     {2089, 0},
     {2090, 0},
     {2091, 0},
     {2092, 0},
     {2093, 0},
     {2094, 0},
     {2095, 0},
     {2096, 0},
     {2097, 0},
     {2098, 0},
     {2099, 0},
     {2100, 0},
     {2101, 0},
     {2102, 0},
     {2103, 0},
     {2104, 0},
     {2105, 0}];
get_init_appearance(_) -> false.

get(1011) ->
    #{base_id => 1011, name => lang:get("疾风狮"),
      classes => 1, index => 1, ratio => 100,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1012) ->
    #{base_id => 1012, name => lang:get("疾风狮·铠甲"),
      classes => 1, index => 1, ratio => 0,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1021) ->
    #{base_id => 1021, name => lang:get("独角兽"),
      classes => 2, index => 1, ratio => 100,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1022) ->
    #{base_id => 1022, name => lang:get("独角兽·铠甲"),
      classes => 2, index => 1, ratio => 0,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1031) ->
    #{base_id => 1031, name => lang:get("啸月狼"),
      classes => 3, index => 1, ratio => 100,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1032) ->
    #{base_id => 1032, name => lang:get("啸月狼·铠甲"),
      classes => 3, index => 1, ratio => 0,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1041) ->
    #{base_id => 1041, name => lang:get("通灵熊"),
      classes => 4, index => 1, ratio => 100,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1042) ->
    #{base_id => 1042, name => lang:get("通灵熊·铠甲"),
      classes => 4, index => 1, ratio => 0,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1051) ->
    #{base_id => 1051, name => lang:get("彩虹猫"),
      classes => 5, index => 1, ratio => 100,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1052) ->
    #{base_id => 1052, name => lang:get("彩虹猫·铠甲"),
      classes => 5, index => 1, ratio => 0,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1061) ->
    #{base_id => 1061, name => lang:get("独角兽"),
      classes => 6, index => 1, ratio => 100,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1062) ->
    #{base_id => 1062, name => lang:get("独角兽·铠甲"),
      classes => 6, index => 1, ratio => 0,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1071) ->
    #{base_id => 1071, name => lang:get("疾风狮"),
      classes => 7, index => 1, ratio => 100,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1072) ->
    #{base_id => 1072, name => lang:get("疾风狮·铠甲"),
      classes => 7, index => 1, ratio => 0,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1101) ->
    #{base_id => 1101, name => lang:get("暮雪羊"),
      classes => 1, index => 2, ratio => 500,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1102) ->
    #{base_id => 1102, name => lang:get("暮雪羊"),
      classes => 2, index => 2, ratio => 500,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1103) ->
    #{base_id => 1103, name => lang:get("暮雪羊"),
      classes => 3, index => 2, ratio => 500,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1104) ->
    #{base_id => 1104, name => lang:get("暮雪羊"),
      classes => 4, index => 2, ratio => 500,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1105) ->
    #{base_id => 1105, name => lang:get("暮雪羊"),
      classes => 5, index => 2, ratio => 500,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1106) ->
    #{base_id => 1106, name => lang:get("暮雪羊·铠甲"),
      classes => 0, index => 2, ratio => 0,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1107) ->
    #{base_id => 1107, name => lang:get("暮雪羊"),
      classes => 6, index => 2, ratio => 500,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1108) ->
    #{base_id => 1108, name => lang:get("暮雪羊"),
      classes => 7, index => 2, ratio => 500,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1111) ->
    #{base_id => 1111, name => lang:get("落日狐"),
      classes => 1, index => 2, ratio => 500,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1112) ->
    #{base_id => 1112, name => lang:get("落日狐"),
      classes => 2, index => 2, ratio => 500,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1113) ->
    #{base_id => 1113, name => lang:get("落日狐"),
      classes => 3, index => 2, ratio => 500,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1114) ->
    #{base_id => 1114, name => lang:get("落日狐"),
      classes => 4, index => 2, ratio => 500,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1115) ->
    #{base_id => 1115, name => lang:get("落日狐"),
      classes => 5, index => 2, ratio => 500,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1116) ->
    #{base_id => 1116, name => lang:get("落日狐·铠甲"),
      classes => 0, index => 2, ratio => 0,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1117) ->
    #{base_id => 1117, name => lang:get("落日狐"),
      classes => 6, index => 2, ratio => 500,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1118) ->
    #{base_id => 1118, name => lang:get("落日狐"),
      classes => 7, index => 2, ratio => 500,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1201) ->
    #{base_id => 1201, name => lang:get("霜刃豹"),
      classes => 1, index => 3, ratio => 100,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1202) ->
    #{base_id => 1202, name => lang:get("霜刃豹"),
      classes => 2, index => 3, ratio => 100,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1203) ->
    #{base_id => 1203, name => lang:get("霜刃豹"),
      classes => 3, index => 3, ratio => 100,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1204) ->
    #{base_id => 1204, name => lang:get("霜刃豹"),
      classes => 4, index => 3, ratio => 100,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1205) ->
    #{base_id => 1205, name => lang:get("霜刃豹"),
      classes => 5, index => 3, ratio => 100,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1206) ->
    #{base_id => 1206, name => lang:get("霜刃豹·铠甲"),
      classes => 0, index => 3, ratio => 0,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1207) ->
    #{base_id => 1207, name => lang:get("霜刃豹"),
      classes => 6, index => 3, ratio => 100,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1208) ->
    #{base_id => 1208, name => lang:get("霜刃豹"),
      classes => 7, index => 3, ratio => 100,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1300) ->
    #{base_id => 1300, name => lang:get("寒月兔"),
      classes => 1, index => 100, ratio => 1,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1301) ->
    #{base_id => 1301, name => lang:get("寒月兔"),
      classes => 2, index => 100, ratio => 1,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1302) ->
    #{base_id => 1302, name => lang:get("寒月兔"),
      classes => 3, index => 100, ratio => 1,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1303) ->
    #{base_id => 1303, name => lang:get("寒月兔"),
      classes => 4, index => 100, ratio => 1,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1304) ->
    #{base_id => 1304, name => lang:get("寒月兔"),
      classes => 5, index => 100, ratio => 1,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1305) ->
    #{base_id => 1305, name => lang:get("寒月兔"),
      classes => 6, index => 100, ratio => 1,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1306) ->
    #{base_id => 1306, name => lang:get("寒月兔"),
      classes => 7, index => 100, ratio => 1,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1310) ->
    #{base_id => 1310, name => lang:get("络月兔"),
      classes => 1, index => 100, ratio => 2,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1311) ->
    #{base_id => 1311, name => lang:get("络月兔"),
      classes => 2, index => 100, ratio => 2,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1312) ->
    #{base_id => 1312, name => lang:get("络月兔"),
      classes => 3, index => 100, ratio => 2,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1313) ->
    #{base_id => 1313, name => lang:get("络月兔"),
      classes => 4, index => 100, ratio => 2,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1314) ->
    #{base_id => 1314, name => lang:get("络月兔"),
      classes => 5, index => 100, ratio => 2,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1315) ->
    #{base_id => 1315, name => lang:get("络月兔"),
      classes => 6, index => 100, ratio => 2,
      speed_attr => [{12, 30}], multiplayer => 0};
get(1316) ->
    #{base_id => 1316, name => lang:get("络月兔"),
      classes => 7, index => 100, ratio => 2,
      speed_attr => [{12, 30}], multiplayer => 0};
get(2000) ->
    #{base_id => 2000, name => lang:get("烈日狂狮"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 40}], multiplayer => 0};
get(2001) ->
    #{base_id => 2001, name => lang:get("霜寒战狮"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2002) ->
    #{base_id => 2002, name => lang:get("战争之角"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 40}], multiplayer => 0};
get(2003) ->
    #{base_id => 2003, name => lang:get("神圣之角"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2004) ->
    #{base_id => 2004, name => lang:get("炽热战狼"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 40}], multiplayer => 0};
get(2005) ->
    #{base_id => 2005, name => lang:get("凛风霜狼"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2006) ->
    #{base_id => 2006, name => lang:get("铁脊战熊"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 40}], multiplayer => 0};
get(2007) ->
    #{base_id => 2007, name => lang:get("冰原之歌"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2008) ->
    #{base_id => 2008, name => lang:get("逐风灵猫"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 40}], multiplayer => 0};
get(2009) ->
    #{base_id => 2009, name => lang:get("影踪灵猫"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2010) ->
    #{base_id => 2010, name => lang:get("花语灵羊"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2011) ->
    #{base_id => 2011, name => lang:get("逸仙灵羊"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2012) ->
    #{base_id => 2012, name => lang:get("落日灵狐"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2013) ->
    #{base_id => 2013, name => lang:get("紫勋战狐"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2014) ->
    #{base_id => 2014, name => lang:get("黄金狮鹫"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2015) ->
    #{base_id => 2015, name => lang:get("云踪狮鹫"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2016) ->
    #{base_id => 2016, name => lang:get("游园灵象"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2017) ->
    #{base_id => 2017, name => lang:get("赤莲巨象"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2018) ->
    #{base_id => 2018, name => lang:get("金勾贝贝"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 40}], multiplayer => 0};
get(2019) ->
    #{base_id => 2019, name => lang:get("清幽花语"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2021) ->
    #{base_id => 2021, name => lang:get("蒸汽幻想"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2020) ->
    #{base_id => 2020, name => lang:get("冰清月牙"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2023) ->
    #{base_id => 2023, name => lang:get("七彩云"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2024) ->
    #{base_id => 2024, name => lang:get("七彩云"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2025) ->
    #{base_id => 2025, name => lang:get("七彩云"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2026) ->
    #{base_id => 2026, name => lang:get("七彩云"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2027) ->
    #{base_id => 2027, name => lang:get("七彩云"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2028) ->
    #{base_id => 2028, name => lang:get("七彩云"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2029) ->
    #{base_id => 2029, name => lang:get("七彩云"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2030) ->
    #{base_id => 2030, name => lang:get("七彩云"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2031) ->
    #{base_id => 2031, name => lang:get("萌犬小柯"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2032) ->
    #{base_id => 2032, name => lang:get("萌犬小柯"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2033) ->
    #{base_id => 2033, name => lang:get("萌犬小柯"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2034) ->
    #{base_id => 2034, name => lang:get("萌犬小柯"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2035) ->
    #{base_id => 2035, name => lang:get("萌犬小柯"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2036) ->
    #{base_id => 2036, name => lang:get("萌犬小柯"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(1998) ->
    #{base_id => 1998, name => lang:get("龙猫圣灵"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(1999) ->
    #{base_id => 1999, name => lang:get("龙猫雪橇"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2038) ->
    #{base_id => 2038, name => lang:get("梦幻物语"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2039) ->
    #{base_id => 2039, name => lang:get("梦幻物语"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2040) ->
    #{base_id => 2040, name => lang:get("梦幻物语"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2041) ->
    #{base_id => 2041, name => lang:get("梦幻物语"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2042) ->
    #{base_id => 2042, name => lang:get("梦幻物语"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2043) ->
    #{base_id => 2043, name => lang:get("梦幻物语"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2044) ->
    #{base_id => 2044, name => lang:get("琉璃梦境"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2045) ->
    #{base_id => 2045, name => lang:get("海豚天使"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2046) ->
    #{base_id => 2046, name => lang:get("海豚天使"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2047) ->
    #{base_id => 2047, name => lang:get("海豚天使"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2048) ->
    #{base_id => 2048, name => lang:get("海豚天使"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2049) ->
    #{base_id => 2049, name => lang:get("海豚天使"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2050) ->
    #{base_id => 2050, name => lang:get("海豚天使"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2052) ->
    #{base_id => 2052, name => lang:get("彩虹小马"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2051) ->
    #{base_id => 2051, name => lang:get("霓紫小马"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2053) ->
    #{base_id => 2053, name => lang:get("热情包租婆"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2054) ->
    #{base_id => 2054, name => lang:get("孤傲黑天鹅"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2055) ->
    #{base_id => 2055, name => lang:get("悠闲小宝"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2056) ->
    #{base_id => 2056, name => lang:get("海军小宝"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2057) ->
    #{base_id => 2057, name => lang:get("冲阵羊"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 1};
get(2058) ->
    #{base_id => 2058, name => lang:get("窜天羊"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 1};
get(2059) ->
    #{base_id => 2059, name => lang:get("绿域学士"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 1};
get(2060) ->
    #{base_id => 2060, name => lang:get("紫域学士"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 1};
get(2061) ->
    #{base_id => 2061, name => lang:get("粉红绅士"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 1};
get(2062) ->
    #{base_id => 2062, name => lang:get("冰蓝绅士"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 1};
get(2063) ->
    #{base_id => 2063, name => lang:get("红粉猪猪"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 1};
get(2064) ->
    #{base_id => 2064, name => lang:get("优雅猪猪"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 1};
get(2065) ->
    #{base_id => 2065, name => lang:get("熊猫小宝"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 1};
get(2066) ->
    #{base_id => 2066, name => lang:get("大熊小宝"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 1};
get(2067) ->
    #{base_id => 2067, name => lang:get("柯基小宝"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 1};
get(2068) ->
    #{base_id => 2068, name => lang:get("白猫小宝"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 1};
get(2069) ->
    #{base_id => 2069, name => lang:get("花之恋歌"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 1};
get(2070) ->
    #{base_id => 2070, name => lang:get("机械小鱼"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 1};
get(2071) ->
    #{base_id => 2071, name => lang:get("动力小鱼"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 1};
get(2072) ->
    #{base_id => 2072, name => lang:get("机械天鹅"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 1};
get(2073) ->
    #{base_id => 2073, name => lang:get("动力天鹅"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 1};
get(2074) ->
    #{base_id => 2074, name => lang:get("机械小猫"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 1};
get(2075) ->
    #{base_id => 2075, name => lang:get("动力小猫"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 1};
get(2076) ->
    #{base_id => 2076, name => lang:get("草莓滋味"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 1};
get(2077) ->
    #{base_id => 2077, name => lang:get("抹茶滋味"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 1};
get(2078) ->
    #{base_id => 2078, name => lang:get("香草滋味"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 1};
get(2079) ->
    #{base_id => 2079, name => lang:get("香芋滋味"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 1};
get(2080) ->
    #{base_id => 2080, name => lang:get("牛奶滋味"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 1};
get(2081) ->
    #{base_id => 2081, name => lang:get("柠檬滋味"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 1};
get(2082) ->
    #{base_id => 2082, name => lang:get("夜影绅士"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2083) ->
    #{base_id => 2083, name => lang:get("白鸦绅士"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2084) ->
    #{base_id => 2084, name => lang:get("魅蓝梦魇"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2085) ->
    #{base_id => 2085, name => lang:get("红蔷梦魇"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2086) ->
    #{base_id => 2086, name => lang:get("南瓜船长"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2087) ->
    #{base_id => 2087, name => lang:get("神秘法老"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2088) ->
    #{base_id => 2088, name => lang:get("圣诞雪人"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2089) ->
    #{base_id => 2089, name => lang:get("金粉雪人"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2090) ->
    #{base_id => 2090, name => lang:get("冰蓝雪人"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2091) ->
    #{base_id => 2091, name => lang:get("通红雪人"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2092) ->
    #{base_id => 2092, name => lang:get("稚绿雪人"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2093) ->
    #{base_id => 2093, name => lang:get("霓紫雪人"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2094) ->
    #{base_id => 2094, name => lang:get("乐园木马"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 1};
get(2095) ->
    #{base_id => 2095, name => lang:get("粉霞木马"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 1};
get(2096) ->
    #{base_id => 2096, name => lang:get("鎏金木马"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 1};
get(2097) ->
    #{base_id => 2097, name => lang:get("芒焰木马"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 1};
get(2098) ->
    #{base_id => 2098, name => lang:get("霓虹独角兽"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 1};
get(2099) ->
    #{base_id => 2099, name => lang:get("星海独角兽"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 1};
get(2100) ->
    #{base_id => 2100, name => lang:get("仙阙青云雀"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2101) ->
    #{base_id => 2101, name => lang:get("羡凡青云雀"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2102) ->
    #{base_id => 2102, name => lang:get("踏昊青云雀"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2103) ->
    #{base_id => 2103, name => lang:get("宸极青云雀"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2104) ->
    #{base_id => 2104, name => lang:get("叱焰青云雀"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2105) ->
    #{base_id => 2105, name => lang:get("傲霜青云雀"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 50}], multiplayer => 0};
get(2106) ->
    #{base_id => 2106, name => lang:get("激浪龙舟"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 1};
get(2107) ->
    #{base_id => 2107, name => lang:get("怒海龙舟"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 1};
get(2108) ->
    #{base_id => 2108, name => lang:get("青林龙舟"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 1};
get(2109) ->
    #{base_id => 2109, name => lang:get("紫气龙舟"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 1};
get(2110) ->
    #{base_id => 2110, name => lang:get("铸金龙舟"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 1};
get(2111) ->
    #{base_id => 2111, name => lang:get("天宫龙舟"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 1};
get(2112) ->
    #{base_id => 2112, name => lang:get("星辰旅行者"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2113) ->
    #{base_id => 2113, name => lang:get("浪漫徘徊者"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2114) ->
    #{base_id => 2114, name => lang:get("寒流抵御者"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2115) ->
    #{base_id => 2115, name => lang:get("天穹遨游者"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2116) ->
    #{base_id => 2116, name => lang:get("西漠拓荒者"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2117) ->
    #{base_id => 2117, name => lang:get("草原驰骋者"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2118) ->
    #{base_id => 2118, name => lang:get("绚烂花球"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2119) ->
    #{base_id => 2119, name => lang:get("朝曦花球"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2120) ->
    #{base_id => 2120, name => lang:get("紫英花球"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2121) ->
    #{base_id => 2121, name => lang:get("薰兰绣球"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2122) ->
    #{base_id => 2122, name => lang:get("冰莹绣球"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2123) ->
    #{base_id => 2123, name => lang:get("稚樱绣球"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2124) ->
    #{base_id => 2124, name => lang:get("勇气雪橇犬"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2125) ->
    #{base_id => 2125, name => lang:get("阳光雪橇犬"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2126) ->
    #{base_id => 2126, name => lang:get("圣诞雪橇犬"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2127) ->
    #{base_id => 2127, name => lang:get("甜蜜雪橇犬"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2128) ->
    #{base_id => 2128, name => lang:get("绅士雪橇犬"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2129) ->
    #{base_id => 2129, name => lang:get("梦幻雪橇犬"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2130) ->
    #{base_id => 2130, name => lang:get("福运喵喵"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2131) ->
    #{base_id => 2131, name => lang:get("鸿运喵神"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2132) ->
    #{base_id => 2132, name => lang:get("安康喵喵"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2133) ->
    #{base_id => 2133, name => lang:get("长康喵神"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2134) ->
    #{base_id => 2134, name => lang:get("福禄喵喵"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2135) ->
    #{base_id => 2135, name => lang:get("泽禄喵神"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2136) ->
    #{base_id => 2136, name => lang:get("韶华小狸"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2137) ->
    #{base_id => 2137, name => lang:get("静谧小狸"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2138) ->
    #{base_id => 2138, name => lang:get("沧澜小狸"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2139) ->
    #{base_id => 2139, name => lang:get("夜渺灵狸"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2140) ->
    #{base_id => 2140, name => lang:get("瑞雪灵狸"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2141) ->
    #{base_id => 2141, name => lang:get("羽裳灵狸"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2142) ->
    #{base_id => 2142, name => lang:get("灵动羊驼"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2143) ->
    #{base_id => 2143, name => lang:get("依蕴羊驼"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2144) ->
    #{base_id => 2144, name => lang:get("金主羊驼"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2145) ->
    #{base_id => 2145, name => lang:get("暴富羊驼"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2146) ->
    #{base_id => 2146, name => lang:get("海盗羊驼"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2147) ->
    #{base_id => 2147, name => lang:get("怪盗羊驼"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2148) ->
    #{base_id => 2148, name => lang:get("绿茵之梦"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2149) ->
    #{base_id => 2149, name => lang:get("秋风之梦"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2150) ->
    #{base_id => 2150, name => lang:get("蔚蓝星梦"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2151) ->
    #{base_id => 2151, name => lang:get("海棠甜梦"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2152) ->
    #{base_id => 2152, name => lang:get("木槿甜梦"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2153) ->
    #{base_id => 2153, name => lang:get("绯色之梦"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2154) ->
    #{base_id => 2154, name => lang:get("暗夜光轮"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2155) ->
    #{base_id => 2155, name => lang:get("黎明光轮"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2156) ->
    #{base_id => 2156, name => lang:get("薄暮光轮"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2157) ->
    #{base_id => 2157, name => lang:get("灼目光轮"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2158) ->
    #{base_id => 2158, name => lang:get("幽曳光轮"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2159) ->
    #{base_id => 2159, name => lang:get("密林光轮"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2164) ->
    #{base_id => 2164, name => lang:get("彩虹天堂"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 1};
get(2165) ->
    #{base_id => 2165, name => lang:get("宝石龙骑"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2166) ->
    #{base_id => 2166, name => lang:get("绯红龙骑"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2167) ->
    #{base_id => 2167, name => lang:get("浮花龙骑"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2168) ->
    #{base_id => 2168, name => lang:get("苍松龙骑"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2169) ->
    #{base_id => 2169, name => lang:get("繁星机甲"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2170) ->
    #{base_id => 2170, name => lang:get("圣光机甲"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2171) ->
    #{base_id => 2171, name => lang:get("烟波锦鲤"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2172) ->
    #{base_id => 2172, name => lang:get("海棠锦鲤"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2173) ->
    #{base_id => 2173, name => lang:get("落樱锦鲤"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2174) ->
    #{base_id => 2174, name => lang:get("青黛龙鲤"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2175) ->
    #{base_id => 2175, name => lang:get("祥和龙鲤"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2176) ->
    #{base_id => 2176, name => lang:get("辉煌龙鲤"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2177) ->
    #{base_id => 2177, name => lang:get("奶糖兔"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2178) ->
    #{base_id => 2178, name => lang:get("班尼兔"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2179) ->
    #{base_id => 2179, name => lang:get("布丁兔"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2180) ->
    #{base_id => 2180, name => lang:get("咖啡兔"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2181) ->
    #{base_id => 2181, name => lang:get("名媛兔小姐"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2182) ->
    #{base_id => 2182, name => lang:get("王牌领航员"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2183) ->
    #{base_id => 2183, name => lang:get("悠闲假日"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2184) ->
    #{base_id => 2184, name => lang:get("烟波团子"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2185) ->
    #{base_id => 2185, name => lang:get("暖阳团子"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2186) ->
    #{base_id => 2186, name => lang:get("花韵团子"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2187) ->
    #{base_id => 2187, name => lang:get("闪电小团团"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2188) ->
    #{base_id => 2188, name => lang:get("碧波小团团"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2189) ->
    #{base_id => 2189, name => lang:get("恶魔小团团"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2191) ->
    #{base_id => 2191, name => lang:get("疾风"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2192) ->
    #{base_id => 2192, name => lang:get("疾风·炫酷"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2193) ->
    #{base_id => 2193, name => lang:get("疾风·超我"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2197) ->
    #{base_id => 2197, name => lang:get("花语灵鹿·绿"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2198) ->
    #{base_id => 2198, name => lang:get("花语灵鹿·红"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2199) ->
    #{base_id => 2199, name => lang:get("花语灵鹿·黄"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2200) ->
    #{base_id => 2200, name => lang:get("花语灵鹿·彩"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2201) ->
    #{base_id => 2201, name => lang:get("花语灵鹿·夜"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2206) ->
    #{base_id => 2206, name => lang:get("天籁之旅·音"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2207) ->
    #{base_id => 2207, name => lang:get("天籁之旅·音"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2208) ->
    #{base_id => 2208, name => lang:get("天籁之旅·旅"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(2209) ->
    #{base_id => 2209, name => lang:get("一叶孤行"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 300}], multiplayer => 0};
get(2210) ->
    #{base_id => 2210, name => lang:get("万象梦之旅"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 300}], multiplayer => 0};
get(2211) ->
    #{base_id => 2211, name => lang:get("幽骨战龙"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 300}], multiplayer => 0};
get(2212) ->
    #{base_id => 2212, name => lang:get("鬼谷八荒葫芦"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 300}], multiplayer => 0};
get(2213) ->
    #{base_id => 2213, name => lang:get("深海蛞蝓"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 300}], multiplayer => 0};
get(2214) ->
    #{base_id => 2214, name => lang:get("法相青莲"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 300}], multiplayer => 0};
get(2215) ->
    #{base_id => 2215, name => lang:get("千里灵剑"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 300}], multiplayer => 0};
get(2216) ->
    #{base_id => 2216, name => lang:get("幻翼龙兽"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 300}], multiplayer => 0};
get(3094) ->
    #{base_id => 3094, name => lang:get("深渊魔龙"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(3095) ->
    #{base_id => 3095, name => lang:get("九韶灵狐"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(3096) ->
    #{base_id => 3096, name => lang:get("冰晶霜狼"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(3097) ->
    #{base_id => 3097, name => lang:get("四翼冰龙"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(3098) ->
    #{base_id => 3098, name => lang:get("天工画扇"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(3099) ->
    #{base_id => 3099, name => lang:get("白泽"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(3100) ->
    #{base_id => 3100, name => lang:get("碧蓝圣座"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(3101) ->
    #{base_id => 3101, name => lang:get("绮灵羽翼"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(3102) ->
    #{base_id => 3102, name => lang:get("黄金圣龙"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 250}], multiplayer => 0};
get(3229) ->
    #{base_id => 3229, name => lang:get("龙子老六·椒图"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 300}], multiplayer => 0};
get(3230) ->
    #{base_id => 3230, name => lang:get("龙子老五·饕餮"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 300}], multiplayer => 0};
get(3231) ->
    #{base_id => 3231, name => lang:get("龙子老四·狻猊"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 300}], multiplayer => 0};
get(3232) ->
    #{base_id => 3232, name => lang:get("龙子老三·狴犴"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 300}], multiplayer => 0};
get(3233) ->
    #{base_id => 3233, name => lang:get("老子老二·睚眦"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 300}], multiplayer => 0};
get(3234) ->
    #{base_id => 3234, name => lang:get("龙子老大·囚牛"),
      classes => 0, index => 1, ratio => 0,
      speed_attr => [{12, 300}], multiplayer => 0};
get(_) -> false.

get_lev({0, 1}) ->
    #{lev => 0, index => 1, role_lev => 78,
      break_times => 0, ratio => 1000, is_up_lev => 0,
      lev_cost => [{23559, 1}], skill_cnt => 1,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 0,
      sure_success_cost => [{23556, 1}]};
get_lev({1, 1}) ->
    #{lev => 1, index => 1, role_lev => 78,
      break_times => 0, ratio => 1000, is_up_lev => 0,
      lev_cost => [{23556, 2}], skill_cnt => 1,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 0,
      sure_success_cost => [{23556, 2}]};
get_lev({2, 1}) ->
    #{lev => 2, index => 1, role_lev => 78,
      break_times => 0, ratio => 900, is_up_lev => 0,
      lev_cost => [{23556, 2}], skill_cnt => 1,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 3}]};
get_lev({3, 1}) ->
    #{lev => 3, index => 1, role_lev => 78,
      break_times => 0, ratio => 850, is_up_lev => 0,
      lev_cost => [{23556, 2}], skill_cnt => 1,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 3}]};
get_lev({4, 1}) ->
    #{lev => 4, index => 1, role_lev => 78,
      break_times => 0, ratio => 800, is_up_lev => 0,
      lev_cost => [{23556, 2}], skill_cnt => 1,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 3}]};
get_lev({5, 1}) ->
    #{lev => 5, index => 1, role_lev => 78,
      break_times => 0, ratio => 740, is_up_lev => 0,
      lev_cost => [{23556, 2}], skill_cnt => 1,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 3}]};
get_lev({6, 1}) ->
    #{lev => 6, index => 1, role_lev => 78,
      break_times => 0, ratio => 680, is_up_lev => 0,
      lev_cost => [{23556, 3}], skill_cnt => 1,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 5}]};
get_lev({7, 1}) ->
    #{lev => 7, index => 1, role_lev => 78,
      break_times => 0, ratio => 620, is_up_lev => 0,
      lev_cost => [{23556, 3}], skill_cnt => 1,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 5}]};
get_lev({8, 1}) ->
    #{lev => 8, index => 1, role_lev => 78,
      break_times => 0, ratio => 560, is_up_lev => 0,
      lev_cost => [{23556, 3}], skill_cnt => 1,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 6}]};
get_lev({9, 1}) ->
    #{lev => 9, index => 1, role_lev => 78,
      break_times => 0, ratio => 500, is_up_lev => 0,
      lev_cost => [{23556, 3}], skill_cnt => 1,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 6}]};
get_lev({10, 1}) ->
    #{lev => 10, index => 1, role_lev => 78,
      break_times => 0, ratio => 650, is_up_lev => 1,
      lev_cost => [{23556, 3}], upgrade_cost => [{23557, 1}],
      skill_cnt => 2, fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 5}]};
get_lev({11, 1}) ->
    #{lev => 11, index => 1, role_lev => 78,
      break_times => 0, ratio => 600, is_up_lev => 0,
      lev_cost => [{23556, 5}], skill_cnt => 2,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 8}]};
get_lev({12, 1}) ->
    #{lev => 12, index => 1, role_lev => 78,
      break_times => 0, ratio => 550, is_up_lev => 0,
      lev_cost => [{23556, 5}], skill_cnt => 2,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 9}]};
get_lev({13, 1}) ->
    #{lev => 13, index => 1, role_lev => 78,
      break_times => 0, ratio => 500, is_up_lev => 0,
      lev_cost => [{23556, 5}], skill_cnt => 2,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 10}]};
get_lev({14, 1}) ->
    #{lev => 14, index => 1, role_lev => 78,
      break_times => 0, ratio => 450, is_up_lev => 0,
      lev_cost => [{23556, 6}], skill_cnt => 2,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 11}]};
get_lev({15, 1}) ->
    #{lev => 15, index => 1, role_lev => 78,
      break_times => 0, ratio => 400, is_up_lev => 0,
      lev_cost => [{23556, 6}], skill_cnt => 2,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 12}]};
get_lev({16, 1}) ->
    #{lev => 16, index => 1, role_lev => 78,
      break_times => 0, ratio => 350, is_up_lev => 0,
      lev_cost => [{23556, 8}], skill_cnt => 2,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 20}]};
get_lev({17, 1}) ->
    #{lev => 17, index => 1, role_lev => 78,
      break_times => 0, ratio => 300, is_up_lev => 0,
      lev_cost => [{23556, 8}], skill_cnt => 2,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 22}]};
get_lev({18, 1}) ->
    #{lev => 18, index => 1, role_lev => 78,
      break_times => 0, ratio => 250, is_up_lev => 0,
      lev_cost => [{23556, 8}], skill_cnt => 2,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 25}]};
get_lev({19, 1}) ->
    #{lev => 19, index => 1, role_lev => 78,
      break_times => 0, ratio => 200, is_up_lev => 0,
      lev_cost => [{23556, 8}], skill_cnt => 2,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 28}]};
get_lev({20, 1}) ->
    #{lev => 20, index => 1, role_lev => 78,
      break_times => 0, ratio => 400, is_up_lev => 1,
      lev_cost => [{23556, 8}], upgrade_cost => [{23557, 3}],
      skill_cnt => 3, fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 18}]};
get_lev({21, 1}) ->
    #{lev => 21, index => 1, role_lev => 78,
      break_times => 0, ratio => 360, is_up_lev => 0,
      lev_cost => [{23556, 10}], skill_cnt => 3,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 24}]};
get_lev({22, 1}) ->
    #{lev => 22, index => 1, role_lev => 78,
      break_times => 0, ratio => 350, is_up_lev => 0,
      lev_cost => [{23556, 10}], skill_cnt => 3,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 25}]};
get_lev({23, 1}) ->
    #{lev => 23, index => 1, role_lev => 78,
      break_times => 0, ratio => 340, is_up_lev => 0,
      lev_cost => [{23556, 10}], skill_cnt => 3,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 25}]};
get_lev({24, 1}) ->
    #{lev => 24, index => 1, role_lev => 78,
      break_times => 0, ratio => 330, is_up_lev => 0,
      lev_cost => [{23556, 10}], skill_cnt => 3,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 26}]};
get_lev({25, 1}) ->
    #{lev => 25, index => 1, role_lev => 78,
      break_times => 0, ratio => 320, is_up_lev => 0,
      lev_cost => [{23556, 10}], skill_cnt => 3,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 26}]};
get_lev({26, 1}) ->
    #{lev => 26, index => 1, role_lev => 78,
      break_times => 0, ratio => 310, is_up_lev => 0,
      lev_cost => [{23556, 12}], skill_cnt => 3,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 27}]};
get_lev({27, 1}) ->
    #{lev => 27, index => 1, role_lev => 78,
      break_times => 0, ratio => 300, is_up_lev => 0,
      lev_cost => [{23556, 12}], skill_cnt => 3,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 28}]};
get_lev({28, 1}) ->
    #{lev => 28, index => 1, role_lev => 78,
      break_times => 0, ratio => 300, is_up_lev => 0,
      lev_cost => [{23556, 12}], skill_cnt => 3,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 28}]};
get_lev({29, 1}) ->
    #{lev => 29, index => 1, role_lev => 78,
      break_times => 0, ratio => 300, is_up_lev => 0,
      lev_cost => [{23556, 12}], skill_cnt => 3,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 28}]};
get_lev({30, 1}) ->
    #{lev => 30, index => 1, role_lev => 95,
      break_times => 0, ratio => 380, is_up_lev => 1,
      lev_cost => [{23556, 14}], upgrade_cost => [{23557, 5}],
      skill_cnt => 4, fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 28}]};
get_lev({31, 1}) ->
    #{lev => 31, index => 1, role_lev => 95,
      break_times => 0, ratio => 360, is_up_lev => 0,
      lev_cost => [{23556, 14}], skill_cnt => 4,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 29}]};
get_lev({32, 1}) ->
    #{lev => 32, index => 1, role_lev => 95,
      break_times => 0, ratio => 330, is_up_lev => 0,
      lev_cost => [{23556, 14}], skill_cnt => 4,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 31}]};
get_lev({33, 1}) ->
    #{lev => 33, index => 1, role_lev => 95,
      break_times => 0, ratio => 300, is_up_lev => 0,
      lev_cost => [{23556, 14}], skill_cnt => 4,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 33}]};
get_lev({34, 1}) ->
    #{lev => 34, index => 1, role_lev => 95,
      break_times => 0, ratio => 280, is_up_lev => 0,
      lev_cost => [{23556, 14}], skill_cnt => 4,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 34}]};
get_lev({35, 1}) ->
    #{lev => 35, index => 1, role_lev => 97,
      break_times => 0, ratio => 260, is_up_lev => 0,
      lev_cost => [{23556, 14}], skill_cnt => 4,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 36}]};
get_lev({36, 1}) ->
    #{lev => 36, index => 1, role_lev => 97,
      break_times => 0, ratio => 240, is_up_lev => 0,
      lev_cost => [{23556, 14}], skill_cnt => 4,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 38}]};
get_lev({37, 1}) ->
    #{lev => 37, index => 1, role_lev => 97,
      break_times => 0, ratio => 200, is_up_lev => 0,
      lev_cost => [{23556, 15}], skill_cnt => 4,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 42}]};
get_lev({38, 1}) ->
    #{lev => 38, index => 1, role_lev => 97,
      break_times => 0, ratio => 180, is_up_lev => 0,
      lev_cost => [{23556, 15}], skill_cnt => 4,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 44}]};
get_lev({39, 1}) ->
    #{lev => 39, index => 1, role_lev => 97,
      break_times => 0, ratio => 150, is_up_lev => 0,
      lev_cost => [{23556, 15}], skill_cnt => 4,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 47}]};
get_lev({40, 1}) ->
    #{lev => 40, index => 1, role_lev => 97,
      break_times => 0, ratio => 150, is_up_lev => 1,
      lev_cost => [{23556, 15}], upgrade_cost => [{23557, 8}],
      skill_cnt => 5, fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 47}]};
get_lev({0, 2}) ->
    #{lev => 0, index => 2, role_lev => 92,
      break_times => 0, ratio => 1000, is_up_lev => 0,
      lev_cost => [{23559, 1}], skill_cnt => 1,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 0,
      sure_success_cost => [{23556, 1}]};
get_lev({1, 2}) ->
    #{lev => 1, index => 2, role_lev => 92,
      break_times => 0, ratio => 1000, is_up_lev => 0,
      lev_cost => [{23556, 2}], skill_cnt => 1,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 0,
      sure_success_cost => [{23556, 2}]};
get_lev({2, 2}) ->
    #{lev => 2, index => 2, role_lev => 92,
      break_times => 0, ratio => 950, is_up_lev => 0,
      lev_cost => [{23556, 2}], skill_cnt => 1,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 0,
      sure_success_cost => [{23556, 2}]};
get_lev({3, 2}) ->
    #{lev => 3, index => 2, role_lev => 92,
      break_times => 0, ratio => 900, is_up_lev => 0,
      lev_cost => [{23556, 2}], skill_cnt => 1,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 3}]};
get_lev({4, 2}) ->
    #{lev => 4, index => 2, role_lev => 92,
      break_times => 0, ratio => 850, is_up_lev => 0,
      lev_cost => [{23556, 2}], skill_cnt => 1,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 3}]};
get_lev({5, 2}) ->
    #{lev => 5, index => 2, role_lev => 92,
      break_times => 0, ratio => 800, is_up_lev => 0,
      lev_cost => [{23556, 2}], skill_cnt => 1,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 3}]};
get_lev({6, 2}) ->
    #{lev => 6, index => 2, role_lev => 92,
      break_times => 0, ratio => 750, is_up_lev => 0,
      lev_cost => [{23556, 3}], skill_cnt => 1,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 4}]};
get_lev({7, 2}) ->
    #{lev => 7, index => 2, role_lev => 92,
      break_times => 0, ratio => 700, is_up_lev => 0,
      lev_cost => [{23556, 3}], skill_cnt => 1,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 5}]};
get_lev({8, 2}) ->
    #{lev => 8, index => 2, role_lev => 92,
      break_times => 0, ratio => 650, is_up_lev => 0,
      lev_cost => [{23556, 3}], skill_cnt => 1,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 5}]};
get_lev({9, 2}) ->
    #{lev => 9, index => 2, role_lev => 92,
      break_times => 0, ratio => 600, is_up_lev => 0,
      lev_cost => [{23556, 3}], skill_cnt => 1,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 5}]};
get_lev({10, 2}) ->
    #{lev => 10, index => 2, role_lev => 92,
      break_times => 0, ratio => 550, is_up_lev => 1,
      lev_cost => [{23556, 3}], upgrade_cost => [{23557, 1}],
      skill_cnt => 2, fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 6}]};
get_lev({11, 2}) ->
    #{lev => 11, index => 2, role_lev => 92,
      break_times => 0, ratio => 700, is_up_lev => 0,
      lev_cost => [{23556, 5}], skill_cnt => 2,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 7}]};
get_lev({12, 2}) ->
    #{lev => 12, index => 2, role_lev => 92,
      break_times => 0, ratio => 650, is_up_lev => 0,
      lev_cost => [{23556, 5}], skill_cnt => 2,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 8}]};
get_lev({13, 2}) ->
    #{lev => 13, index => 2, role_lev => 92,
      break_times => 0, ratio => 600, is_up_lev => 0,
      lev_cost => [{23556, 5}], skill_cnt => 2,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 8}]};
get_lev({14, 2}) ->
    #{lev => 14, index => 2, role_lev => 92,
      break_times => 0, ratio => 550, is_up_lev => 0,
      lev_cost => [{23556, 5}], skill_cnt => 2,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 9}]};
get_lev({15, 2}) ->
    #{lev => 15, index => 2, role_lev => 92,
      break_times => 0, ratio => 500, is_up_lev => 0,
      lev_cost => [{23556, 5}], skill_cnt => 2,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 10}]};
get_lev({16, 2}) ->
    #{lev => 16, index => 2, role_lev => 92,
      break_times => 0, ratio => 450, is_up_lev => 0,
      lev_cost => [{23556, 8}], skill_cnt => 2,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 17}]};
get_lev({17, 2}) ->
    #{lev => 17, index => 2, role_lev => 92,
      break_times => 0, ratio => 400, is_up_lev => 0,
      lev_cost => [{23556, 8}], skill_cnt => 2,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 18}]};
get_lev({18, 2}) ->
    #{lev => 18, index => 2, role_lev => 92,
      break_times => 0, ratio => 350, is_up_lev => 0,
      lev_cost => [{23556, 8}], skill_cnt => 2,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 20}]};
get_lev({19, 2}) ->
    #{lev => 19, index => 2, role_lev => 92,
      break_times => 0, ratio => 300, is_up_lev => 0,
      lev_cost => [{23556, 8}], skill_cnt => 2,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 22}]};
get_lev({20, 2}) ->
    #{lev => 20, index => 2, role_lev => 99,
      break_times => 0, ratio => 250, is_up_lev => 1,
      lev_cost => [{23556, 8}], upgrade_cost => [{23557, 3}],
      skill_cnt => 3, fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 25}]};
get_lev({21, 2}) ->
    #{lev => 21, index => 2, role_lev => 99,
      break_times => 0, ratio => 500, is_up_lev => 0,
      lev_cost => [{23556, 10}], skill_cnt => 3,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 19}]};
get_lev({22, 2}) ->
    #{lev => 22, index => 2, role_lev => 99,
      break_times => 0, ratio => 460, is_up_lev => 0,
      lev_cost => [{23556, 10}], skill_cnt => 3,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 20}]};
get_lev({23, 2}) ->
    #{lev => 23, index => 2, role_lev => 99,
      break_times => 0, ratio => 420, is_up_lev => 0,
      lev_cost => [{23556, 10}], skill_cnt => 3,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 22}]};
get_lev({24, 2}) ->
    #{lev => 24, index => 2, role_lev => 99,
      break_times => 0, ratio => 380, is_up_lev => 0,
      lev_cost => [{23556, 10}], skill_cnt => 3,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 23}]};
get_lev({25, 2}) ->
    #{lev => 25, index => 2, role_lev => 99,
      break_times => 0, ratio => 340, is_up_lev => 0,
      lev_cost => [{23556, 10}], skill_cnt => 3,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 25}]};
get_lev({26, 2}) ->
    #{lev => 26, index => 2, role_lev => 99,
      break_times => 0, ratio => 300, is_up_lev => 0,
      lev_cost => [{23556, 10}], skill_cnt => 3,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 28}]};
get_lev({27, 2}) ->
    #{lev => 27, index => 2, role_lev => 99,
      break_times => 0, ratio => 280, is_up_lev => 0,
      lev_cost => [{23556, 10}], skill_cnt => 3,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 29}]};
get_lev({28, 2}) ->
    #{lev => 28, index => 2, role_lev => 99,
      break_times => 0, ratio => 260, is_up_lev => 0,
      lev_cost => [{23556, 10}], skill_cnt => 3,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 30}]};
get_lev({29, 2}) ->
    #{lev => 29, index => 2, role_lev => 99,
      break_times => 0, ratio => 260, is_up_lev => 0,
      lev_cost => [{23556, 10}], skill_cnt => 3,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 30}]};
get_lev({30, 2}) ->
    #{lev => 30, index => 2, role_lev => 95,
      break_times => 1, ratio => 260, is_up_lev => 1,
      lev_cost => [{23556, 12}], upgrade_cost => [{23557, 5}],
      skill_cnt => 4, fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 36}]};
get_lev({31, 2}) ->
    #{lev => 31, index => 2, role_lev => 95,
      break_times => 1, ratio => 400, is_up_lev => 0,
      lev_cost => [{23556, 12}], skill_cnt => 4,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 27}]};
get_lev({32, 2}) ->
    #{lev => 32, index => 2, role_lev => 95,
      break_times => 1, ratio => 370, is_up_lev => 0,
      lev_cost => [{23556, 12}], skill_cnt => 4,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 29}]};
get_lev({33, 2}) ->
    #{lev => 33, index => 2, role_lev => 95,
      break_times => 1, ratio => 340, is_up_lev => 0,
      lev_cost => [{23556, 12}], skill_cnt => 4,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 30}]};
get_lev({34, 2}) ->
    #{lev => 34, index => 2, role_lev => 95,
      break_times => 1, ratio => 310, is_up_lev => 0,
      lev_cost => [{23556, 12}], skill_cnt => 4,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 32}]};
get_lev({35, 2}) ->
    #{lev => 35, index => 2, role_lev => 95,
      break_times => 1, ratio => 280, is_up_lev => 0,
      lev_cost => [{23556, 12}], skill_cnt => 4,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 34}]};
get_lev({36, 2}) ->
    #{lev => 36, index => 2, role_lev => 95,
      break_times => 1, ratio => 250, is_up_lev => 0,
      lev_cost => [{23556, 12}], skill_cnt => 4,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 37}]};
get_lev({37, 2}) ->
    #{lev => 37, index => 2, role_lev => 95,
      break_times => 1, ratio => 240, is_up_lev => 0,
      lev_cost => [{23556, 12}], skill_cnt => 4,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 38}]};
get_lev({38, 2}) ->
    #{lev => 38, index => 2, role_lev => 95,
      break_times => 1, ratio => 230, is_up_lev => 0,
      lev_cost => [{23556, 12}], skill_cnt => 4,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 39}]};
get_lev({39, 2}) ->
    #{lev => 39, index => 2, role_lev => 95,
      break_times => 1, ratio => 220, is_up_lev => 0,
      lev_cost => [{23556, 12}], skill_cnt => 4,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 40}]};
get_lev({40, 2}) ->
    #{lev => 40, index => 2, role_lev => 95,
      break_times => 1, ratio => 200, is_up_lev => 1,
      lev_cost => [{23556, 12}], upgrade_cost => [{23557, 5}],
      skill_cnt => 5, fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 42}]};
get_lev({41, 2}) ->
    #{lev => 41, index => 2, role_lev => 95,
      break_times => 1, ratio => 300, is_up_lev => 0,
      lev_cost => [{23556, 12}], skill_cnt => 5,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 33}]};
get_lev({42, 2}) ->
    #{lev => 42, index => 2, role_lev => 95,
      break_times => 1, ratio => 250, is_up_lev => 0,
      lev_cost => [{23556, 12}], skill_cnt => 5,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 37}]};
get_lev({43, 2}) ->
    #{lev => 43, index => 2, role_lev => 95,
      break_times => 1, ratio => 200, is_up_lev => 0,
      lev_cost => [{23556, 12}], skill_cnt => 5,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 42}]};
get_lev({44, 2}) ->
    #{lev => 44, index => 2, role_lev => 95,
      break_times => 1, ratio => 200, is_up_lev => 0,
      lev_cost => [{23556, 12}], skill_cnt => 5,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 42}]};
get_lev({45, 2}) ->
    #{lev => 45, index => 2, role_lev => 95,
      break_times => 1, ratio => 200, is_up_lev => 0,
      lev_cost => [{23556, 12}], skill_cnt => 5,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 42}]};
get_lev({0, 3}) ->
    #{lev => 0, index => 3, role_lev => 100,
      break_times => 0, ratio => 1000, is_up_lev => 0,
      lev_cost => [{23559, 1}], skill_cnt => 1,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 0,
      sure_success_cost => [{23556, 1}]};
get_lev({1, 3}) ->
    #{lev => 1, index => 3, role_lev => 100,
      break_times => 0, ratio => 1000, is_up_lev => 0,
      lev_cost => [{23556, 2}], skill_cnt => 1,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 0,
      sure_success_cost => [{23556, 2}]};
get_lev({2, 3}) ->
    #{lev => 2, index => 3, role_lev => 100,
      break_times => 0, ratio => 950, is_up_lev => 0,
      lev_cost => [{23556, 2}], skill_cnt => 1,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 0,
      sure_success_cost => [{23556, 2}]};
get_lev({3, 3}) ->
    #{lev => 3, index => 3, role_lev => 100,
      break_times => 0, ratio => 900, is_up_lev => 0,
      lev_cost => [{23556, 2}], skill_cnt => 1,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 3}]};
get_lev({4, 3}) ->
    #{lev => 4, index => 3, role_lev => 100,
      break_times => 0, ratio => 850, is_up_lev => 0,
      lev_cost => [{23556, 2}], skill_cnt => 1,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 3}]};
get_lev({5, 3}) ->
    #{lev => 5, index => 3, role_lev => 100,
      break_times => 0, ratio => 800, is_up_lev => 0,
      lev_cost => [{23556, 2}], skill_cnt => 1,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 3}]};
get_lev({6, 3}) ->
    #{lev => 6, index => 3, role_lev => 100,
      break_times => 0, ratio => 750, is_up_lev => 0,
      lev_cost => [{23556, 3}], skill_cnt => 1,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 4}]};
get_lev({7, 3}) ->
    #{lev => 7, index => 3, role_lev => 100,
      break_times => 0, ratio => 700, is_up_lev => 0,
      lev_cost => [{23556, 3}], skill_cnt => 1,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 5}]};
get_lev({8, 3}) ->
    #{lev => 8, index => 3, role_lev => 100,
      break_times => 0, ratio => 650, is_up_lev => 0,
      lev_cost => [{23556, 3}], skill_cnt => 1,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 5}]};
get_lev({9, 3}) ->
    #{lev => 9, index => 3, role_lev => 100,
      break_times => 0, ratio => 600, is_up_lev => 0,
      lev_cost => [{23556, 3}], skill_cnt => 1,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 5}]};
get_lev({10, 3}) ->
    #{lev => 10, index => 3, role_lev => 100,
      break_times => 0, ratio => 550, is_up_lev => 1,
      lev_cost => [{23556, 3}], upgrade_cost => [{23557, 1}],
      skill_cnt => 2, fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 6}]};
get_lev({11, 3}) ->
    #{lev => 11, index => 3, role_lev => 100,
      break_times => 0, ratio => 700, is_up_lev => 0,
      lev_cost => [{23556, 5}], skill_cnt => 2,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 7}]};
get_lev({12, 3}) ->
    #{lev => 12, index => 3, role_lev => 100,
      break_times => 0, ratio => 650, is_up_lev => 0,
      lev_cost => [{23556, 5}], skill_cnt => 2,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 8}]};
get_lev({13, 3}) ->
    #{lev => 13, index => 3, role_lev => 100,
      break_times => 0, ratio => 600, is_up_lev => 0,
      lev_cost => [{23556, 5}], skill_cnt => 2,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 8}]};
get_lev({14, 3}) ->
    #{lev => 14, index => 3, role_lev => 100,
      break_times => 0, ratio => 550, is_up_lev => 0,
      lev_cost => [{23556, 5}], skill_cnt => 2,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 9}]};
get_lev({15, 3}) ->
    #{lev => 15, index => 3, role_lev => 100,
      break_times => 0, ratio => 500, is_up_lev => 0,
      lev_cost => [{23556, 5}], skill_cnt => 2,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 10}]};
get_lev({16, 3}) ->
    #{lev => 16, index => 3, role_lev => 100,
      break_times => 0, ratio => 450, is_up_lev => 0,
      lev_cost => [{23556, 8}], skill_cnt => 2,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 17}]};
get_lev({17, 3}) ->
    #{lev => 17, index => 3, role_lev => 100,
      break_times => 0, ratio => 400, is_up_lev => 0,
      lev_cost => [{23556, 8}], skill_cnt => 2,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 18}]};
get_lev({18, 3}) ->
    #{lev => 18, index => 3, role_lev => 100,
      break_times => 0, ratio => 350, is_up_lev => 0,
      lev_cost => [{23556, 8}], skill_cnt => 2,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 20}]};
get_lev({19, 3}) ->
    #{lev => 19, index => 3, role_lev => 100,
      break_times => 0, ratio => 300, is_up_lev => 0,
      lev_cost => [{23556, 8}], skill_cnt => 2,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 22}]};
get_lev({20, 3}) ->
    #{lev => 20, index => 3, role_lev => 95,
      break_times => 1, ratio => 250, is_up_lev => 1,
      lev_cost => [{23556, 8}], upgrade_cost => [{23557, 3}],
      skill_cnt => 3, fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 25}]};
get_lev({21, 3}) ->
    #{lev => 21, index => 3, role_lev => 95,
      break_times => 1, ratio => 500, is_up_lev => 0,
      lev_cost => [{23556, 12}], skill_cnt => 3,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 23}]};
get_lev({22, 3}) ->
    #{lev => 22, index => 3, role_lev => 95,
      break_times => 1, ratio => 460, is_up_lev => 0,
      lev_cost => [{23556, 12}], skill_cnt => 3,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 24}]};
get_lev({23, 3}) ->
    #{lev => 23, index => 3, role_lev => 95,
      break_times => 1, ratio => 420, is_up_lev => 0,
      lev_cost => [{23556, 12}], skill_cnt => 3,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 26}]};
get_lev({24, 3}) ->
    #{lev => 24, index => 3, role_lev => 95,
      break_times => 1, ratio => 380, is_up_lev => 0,
      lev_cost => [{23556, 12}], skill_cnt => 3,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 28}]};
get_lev({25, 3}) ->
    #{lev => 25, index => 3, role_lev => 95,
      break_times => 1, ratio => 340, is_up_lev => 0,
      lev_cost => [{23556, 12}], skill_cnt => 3,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 30}]};
get_lev({26, 3}) ->
    #{lev => 26, index => 3, role_lev => 95,
      break_times => 1, ratio => 300, is_up_lev => 0,
      lev_cost => [{23556, 12}], skill_cnt => 3,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 33}]};
get_lev({27, 3}) ->
    #{lev => 27, index => 3, role_lev => 95,
      break_times => 1, ratio => 280, is_up_lev => 0,
      lev_cost => [{23556, 12}], skill_cnt => 3,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 34}]};
get_lev({28, 3}) ->
    #{lev => 28, index => 3, role_lev => 95,
      break_times => 1, ratio => 260, is_up_lev => 0,
      lev_cost => [{23556, 12}], skill_cnt => 3,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 36}]};
get_lev({29, 3}) ->
    #{lev => 29, index => 3, role_lev => 95,
      break_times => 1, ratio => 260, is_up_lev => 0,
      lev_cost => [{23556, 12}], skill_cnt => 3,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 36}]};
get_lev({30, 3}) ->
    #{lev => 30, index => 3, role_lev => 100,
      break_times => 1, ratio => 260, is_up_lev => 1,
      lev_cost => [{23556, 15}], upgrade_cost => [{23557, 3}],
      skill_cnt => 4, fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 45}]};
get_lev({31, 3}) ->
    #{lev => 31, index => 3, role_lev => 100,
      break_times => 1, ratio => 400, is_up_lev => 0,
      lev_cost => [{23556, 15}], skill_cnt => 4,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 34}]};
get_lev({32, 3}) ->
    #{lev => 32, index => 3, role_lev => 100,
      break_times => 1, ratio => 370, is_up_lev => 0,
      lev_cost => [{23556, 15}], skill_cnt => 4,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 36}]};
get_lev({33, 3}) ->
    #{lev => 33, index => 3, role_lev => 100,
      break_times => 1, ratio => 340, is_up_lev => 0,
      lev_cost => [{23556, 15}], skill_cnt => 4,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 38}]};
get_lev({34, 3}) ->
    #{lev => 34, index => 3, role_lev => 100,
      break_times => 1, ratio => 310, is_up_lev => 0,
      lev_cost => [{23556, 15}], skill_cnt => 4,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 40}]};
get_lev({35, 3}) ->
    #{lev => 35, index => 3, role_lev => 100,
      break_times => 1, ratio => 280, is_up_lev => 0,
      lev_cost => [{23556, 18}], skill_cnt => 4,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 51}]};
get_lev({36, 3}) ->
    #{lev => 36, index => 3, role_lev => 100,
      break_times => 1, ratio => 250, is_up_lev => 0,
      lev_cost => [{23556, 18}], skill_cnt => 4,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 55}]};
get_lev({37, 3}) ->
    #{lev => 37, index => 3, role_lev => 100,
      break_times => 1, ratio => 240, is_up_lev => 0,
      lev_cost => [{23556, 18}], skill_cnt => 4,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 56}]};
get_lev({38, 3}) ->
    #{lev => 38, index => 3, role_lev => 100,
      break_times => 1, ratio => 230, is_up_lev => 0,
      lev_cost => [{23556, 18}], skill_cnt => 4,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 58}]};
get_lev({39, 3}) ->
    #{lev => 39, index => 3, role_lev => 100,
      break_times => 1, ratio => 220, is_up_lev => 0,
      lev_cost => [{23556, 18}], skill_cnt => 4,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 59}]};
get_lev({40, 3}) ->
    #{lev => 40, index => 3, role_lev => 100,
      break_times => 1, ratio => 200, is_up_lev => 1,
      lev_cost => [{23556, 25}], upgrade_cost => [{23557, 3}],
      skill_cnt => 5, fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 86}]};
get_lev({41, 3}) ->
    #{lev => 41, index => 3, role_lev => 100,
      break_times => 1, ratio => 300, is_up_lev => 0,
      lev_cost => [{23556, 25}], skill_cnt => 5,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 68}]};
get_lev({42, 3}) ->
    #{lev => 42, index => 3, role_lev => 100,
      break_times => 1, ratio => 250, is_up_lev => 0,
      lev_cost => [{23556, 25}], skill_cnt => 5,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 76}]};
get_lev({43, 3}) ->
    #{lev => 43, index => 3, role_lev => 100,
      break_times => 1, ratio => 200, is_up_lev => 0,
      lev_cost => [{23556, 25}], skill_cnt => 5,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 86}]};
get_lev({44, 3}) ->
    #{lev => 44, index => 3, role_lev => 100,
      break_times => 1, ratio => 200, is_up_lev => 0,
      lev_cost => [{23556, 25}], skill_cnt => 5,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 86}]};
get_lev({45, 3}) ->
    #{lev => 45, index => 3, role_lev => 100,
      break_times => 1, ratio => 200, is_up_lev => 0,
      lev_cost => [{23556, 25}], skill_cnt => 5,
      fail_add => 50, skill_point => 1,
      is_can_sure_success_levup => 1,
      sure_success_cost => [{23556, 86}]};
get_lev({0, 100}) ->
    #{lev => 0, index => 100, role_lev => 7,
      break_times => 0, ratio => 1000, is_up_lev => 0,
      lev_cost => [{23676, 1}], skill_cnt => 1,
      fail_add => 50, skill_point => 0};
get_lev(_) -> false.

get_base_attr({1, 1, 1}) -> [{1, 20}, {4, 5}, {5, 4}];
get_base_attr({1, 1, 2}) -> [{1, 40}, {4, 10}, {5, 8}];
get_base_attr({1, 1, 3}) -> [{1, 60}, {4, 15}, {5, 12}];
get_base_attr({1, 1, 4}) -> [{1, 80}, {4, 20}, {5, 16}];
get_base_attr({1, 1, 5}) ->
    [{1, 100}, {4, 25}, {5, 20}];
get_base_attr({1, 1, 6}) ->
    [{1, 121}, {4, 30}, {5, 24}];
get_base_attr({1, 1, 7}) ->
    [{1, 142}, {4, 35}, {5, 28}];
get_base_attr({1, 1, 8}) ->
    [{1, 163}, {4, 40}, {5, 32}];
get_base_attr({1, 1, 9}) ->
    [{1, 184}, {4, 45}, {5, 36}];
get_base_attr({1, 1, 10}) ->
    [{1, 205}, {4, 50}, {5, 40}];
get_base_attr({1, 1, 11}) ->
    [{1, 228}, {4, 56}, {5, 45}];
get_base_attr({1, 1, 12}) ->
    [{1, 251}, {4, 62}, {5, 50}];
get_base_attr({1, 1, 13}) ->
    [{1, 274}, {4, 68}, {5, 55}];
get_base_attr({1, 1, 14}) ->
    [{1, 297}, {4, 74}, {5, 60}];
get_base_attr({1, 1, 15}) ->
    [{1, 320}, {4, 80}, {5, 65}];
get_base_attr({1, 1, 16}) ->
    [{1, 344}, {4, 86}, {5, 70}];
get_base_attr({1, 1, 17}) ->
    [{1, 368}, {4, 92}, {5, 75}];
get_base_attr({1, 1, 18}) ->
    [{1, 392}, {4, 98}, {5, 80}];
get_base_attr({1, 1, 19}) ->
    [{1, 416}, {4, 104}, {5, 85}];
get_base_attr({1, 1, 20}) ->
    [{1, 440}, {4, 110}, {5, 90}];
get_base_attr({1, 1, 21}) ->
    [{1, 465}, {4, 116}, {5, 95}];
get_base_attr({1, 1, 22}) ->
    [{1, 490}, {4, 122}, {5, 100}];
get_base_attr({1, 1, 23}) ->
    [{1, 515}, {4, 128}, {5, 105}];
get_base_attr({1, 1, 24}) ->
    [{1, 540}, {4, 134}, {5, 110}];
get_base_attr({1, 1, 25}) ->
    [{1, 565}, {4, 140}, {5, 115}];
get_base_attr({1, 1, 26}) ->
    [{1, 591}, {4, 147}, {5, 120}];
get_base_attr({1, 1, 27}) ->
    [{1, 617}, {4, 154}, {5, 125}];
get_base_attr({1, 1, 28}) ->
    [{1, 643}, {4, 161}, {5, 130}];
get_base_attr({1, 1, 29}) ->
    [{1, 669}, {4, 168}, {5, 135}];
get_base_attr({1, 1, 30}) ->
    [{1, 695}, {4, 175}, {5, 140}];
get_base_attr({1, 1, 31}) ->
    [{1, 715}, {4, 180}, {5, 144}];
get_base_attr({1, 1, 32}) ->
    [{1, 735}, {4, 185}, {5, 148}];
get_base_attr({1, 1, 33}) ->
    [{1, 755}, {4, 190}, {5, 152}];
get_base_attr({1, 1, 34}) ->
    [{1, 775}, {4, 195}, {5, 156}];
get_base_attr({1, 1, 35}) ->
    [{1, 795}, {4, 200}, {5, 160}];
get_base_attr({1, 1, 36}) ->
    [{1, 815}, {4, 205}, {5, 164}];
get_base_attr({1, 1, 37}) ->
    [{1, 835}, {4, 210}, {5, 168}];
get_base_attr({1, 1, 38}) ->
    [{1, 855}, {4, 215}, {5, 172}];
get_base_attr({1, 1, 39}) ->
    [{1, 875}, {4, 220}, {5, 176}];
get_base_attr({1, 1, 40}) ->
    [{1, 895}, {4, 225}, {5, 180}];
get_base_attr({1, 2, 1}) -> [{1, 20}, {4, 5}, {5, 4}];
get_base_attr({1, 2, 2}) -> [{1, 40}, {4, 10}, {5, 8}];
get_base_attr({1, 2, 3}) -> [{1, 60}, {4, 15}, {5, 12}];
get_base_attr({1, 2, 4}) -> [{1, 80}, {4, 20}, {5, 16}];
get_base_attr({1, 2, 5}) ->
    [{1, 100}, {4, 25}, {5, 20}];
get_base_attr({1, 2, 6}) ->
    [{1, 121}, {4, 30}, {5, 24}];
get_base_attr({1, 2, 7}) ->
    [{1, 142}, {4, 35}, {5, 28}];
get_base_attr({1, 2, 8}) ->
    [{1, 163}, {4, 40}, {5, 32}];
get_base_attr({1, 2, 9}) ->
    [{1, 184}, {4, 45}, {5, 36}];
get_base_attr({1, 2, 10}) ->
    [{1, 205}, {4, 50}, {5, 40}];
get_base_attr({1, 2, 11}) ->
    [{1, 228}, {4, 56}, {5, 45}];
get_base_attr({1, 2, 12}) ->
    [{1, 251}, {4, 62}, {5, 50}];
get_base_attr({1, 2, 13}) ->
    [{1, 274}, {4, 68}, {5, 55}];
get_base_attr({1, 2, 14}) ->
    [{1, 297}, {4, 74}, {5, 60}];
get_base_attr({1, 2, 15}) ->
    [{1, 320}, {4, 80}, {5, 65}];
get_base_attr({1, 2, 16}) ->
    [{1, 344}, {4, 86}, {5, 70}];
get_base_attr({1, 2, 17}) ->
    [{1, 368}, {4, 92}, {5, 75}];
get_base_attr({1, 2, 18}) ->
    [{1, 392}, {4, 98}, {5, 80}];
get_base_attr({1, 2, 19}) ->
    [{1, 416}, {4, 104}, {5, 85}];
get_base_attr({1, 2, 20}) ->
    [{1, 440}, {4, 110}, {5, 90}];
get_base_attr({1, 2, 21}) ->
    [{1, 465}, {4, 116}, {5, 95}];
get_base_attr({1, 2, 22}) ->
    [{1, 490}, {4, 122}, {5, 100}];
get_base_attr({1, 2, 23}) ->
    [{1, 515}, {4, 128}, {5, 105}];
get_base_attr({1, 2, 24}) ->
    [{1, 540}, {4, 134}, {5, 110}];
get_base_attr({1, 2, 25}) ->
    [{1, 565}, {4, 140}, {5, 115}];
get_base_attr({1, 2, 26}) ->
    [{1, 591}, {4, 147}, {5, 120}];
get_base_attr({1, 2, 27}) ->
    [{1, 617}, {4, 154}, {5, 125}];
get_base_attr({1, 2, 28}) ->
    [{1, 643}, {4, 161}, {5, 130}];
get_base_attr({1, 2, 29}) ->
    [{1, 669}, {4, 168}, {5, 135}];
get_base_attr({1, 2, 30}) ->
    [{1, 695}, {4, 175}, {5, 140}];
get_base_attr({1, 2, 31}) ->
    [{1, 715}, {4, 180}, {5, 144}];
get_base_attr({1, 2, 32}) ->
    [{1, 735}, {4, 185}, {5, 148}];
get_base_attr({1, 2, 33}) ->
    [{1, 755}, {4, 190}, {5, 152}];
get_base_attr({1, 2, 34}) ->
    [{1, 775}, {4, 195}, {5, 156}];
get_base_attr({1, 2, 35}) ->
    [{1, 795}, {4, 200}, {5, 160}];
get_base_attr({1, 2, 36}) ->
    [{1, 815}, {4, 205}, {5, 164}];
get_base_attr({1, 2, 37}) ->
    [{1, 835}, {4, 210}, {5, 168}];
get_base_attr({1, 2, 38}) ->
    [{1, 855}, {4, 215}, {5, 172}];
get_base_attr({1, 2, 39}) ->
    [{1, 875}, {4, 220}, {5, 176}];
get_base_attr({1, 2, 40}) ->
    [{1, 895}, {4, 225}, {5, 180}];
get_base_attr({1, 3, 1}) -> [{1, 20}, {4, 5}, {5, 4}];
get_base_attr({1, 3, 2}) -> [{1, 40}, {4, 10}, {5, 8}];
get_base_attr({1, 3, 3}) -> [{1, 60}, {4, 15}, {5, 12}];
get_base_attr({1, 3, 4}) -> [{1, 80}, {4, 20}, {5, 16}];
get_base_attr({1, 3, 5}) ->
    [{1, 100}, {4, 25}, {5, 20}];
get_base_attr({1, 3, 6}) ->
    [{1, 121}, {4, 30}, {5, 24}];
get_base_attr({1, 3, 7}) ->
    [{1, 142}, {4, 35}, {5, 28}];
get_base_attr({1, 3, 8}) ->
    [{1, 163}, {4, 40}, {5, 32}];
get_base_attr({1, 3, 9}) ->
    [{1, 184}, {4, 45}, {5, 36}];
get_base_attr({1, 3, 10}) ->
    [{1, 205}, {4, 50}, {5, 40}];
get_base_attr({1, 3, 11}) ->
    [{1, 228}, {4, 56}, {5, 45}];
get_base_attr({1, 3, 12}) ->
    [{1, 251}, {4, 62}, {5, 50}];
get_base_attr({1, 3, 13}) ->
    [{1, 274}, {4, 68}, {5, 55}];
get_base_attr({1, 3, 14}) ->
    [{1, 297}, {4, 74}, {5, 60}];
get_base_attr({1, 3, 15}) ->
    [{1, 320}, {4, 80}, {5, 65}];
get_base_attr({1, 3, 16}) ->
    [{1, 344}, {4, 86}, {5, 70}];
get_base_attr({1, 3, 17}) ->
    [{1, 368}, {4, 92}, {5, 75}];
get_base_attr({1, 3, 18}) ->
    [{1, 392}, {4, 98}, {5, 80}];
get_base_attr({1, 3, 19}) ->
    [{1, 416}, {4, 104}, {5, 85}];
get_base_attr({1, 3, 20}) ->
    [{1, 440}, {4, 110}, {5, 90}];
get_base_attr({1, 3, 21}) ->
    [{1, 465}, {4, 116}, {5, 95}];
get_base_attr({1, 3, 22}) ->
    [{1, 490}, {4, 122}, {5, 100}];
get_base_attr({1, 3, 23}) ->
    [{1, 515}, {4, 128}, {5, 105}];
get_base_attr({1, 3, 24}) ->
    [{1, 540}, {4, 134}, {5, 110}];
get_base_attr({1, 3, 25}) ->
    [{1, 565}, {4, 140}, {5, 115}];
get_base_attr({1, 3, 26}) ->
    [{1, 591}, {4, 147}, {5, 120}];
get_base_attr({1, 3, 27}) ->
    [{1, 617}, {4, 154}, {5, 125}];
get_base_attr({1, 3, 28}) ->
    [{1, 643}, {4, 161}, {5, 130}];
get_base_attr({1, 3, 29}) ->
    [{1, 669}, {4, 168}, {5, 135}];
get_base_attr({1, 3, 30}) ->
    [{1, 695}, {4, 175}, {5, 140}];
get_base_attr({1, 3, 31}) ->
    [{1, 715}, {4, 180}, {5, 144}];
get_base_attr({1, 3, 32}) ->
    [{1, 735}, {4, 185}, {5, 148}];
get_base_attr({1, 3, 33}) ->
    [{1, 755}, {4, 190}, {5, 152}];
get_base_attr({1, 3, 34}) ->
    [{1, 775}, {4, 195}, {5, 156}];
get_base_attr({1, 3, 35}) ->
    [{1, 795}, {4, 200}, {5, 160}];
get_base_attr({1, 3, 36}) ->
    [{1, 815}, {4, 205}, {5, 164}];
get_base_attr({1, 3, 37}) ->
    [{1, 835}, {4, 210}, {5, 168}];
get_base_attr({1, 3, 38}) ->
    [{1, 855}, {4, 215}, {5, 172}];
get_base_attr({1, 3, 39}) ->
    [{1, 875}, {4, 220}, {5, 176}];
get_base_attr({1, 3, 40}) ->
    [{1, 895}, {4, 225}, {5, 180}];
get_base_attr({1, 4, 1}) -> [{1, 20}, {4, 5}, {3, 1}];
get_base_attr({1, 4, 2}) -> [{1, 40}, {4, 10}, {3, 2}];
get_base_attr({1, 4, 3}) -> [{1, 60}, {4, 15}, {3, 3}];
get_base_attr({1, 4, 4}) -> [{1, 80}, {4, 20}, {3, 4}];
get_base_attr({1, 4, 5}) -> [{1, 100}, {4, 25}, {3, 5}];
get_base_attr({1, 4, 6}) -> [{1, 121}, {4, 30}, {3, 6}];
get_base_attr({1, 4, 7}) -> [{1, 142}, {4, 35}, {3, 7}];
get_base_attr({1, 4, 8}) -> [{1, 163}, {4, 40}, {3, 8}];
get_base_attr({1, 4, 9}) -> [{1, 184}, {4, 45}, {3, 9}];
get_base_attr({1, 4, 10}) ->
    [{1, 205}, {4, 50}, {3, 10}];
get_base_attr({1, 4, 11}) ->
    [{1, 228}, {4, 56}, {3, 11}];
get_base_attr({1, 4, 12}) ->
    [{1, 251}, {4, 62}, {3, 12}];
get_base_attr({1, 4, 13}) ->
    [{1, 274}, {4, 68}, {3, 13}];
get_base_attr({1, 4, 14}) ->
    [{1, 297}, {4, 74}, {3, 14}];
get_base_attr({1, 4, 15}) ->
    [{1, 320}, {4, 80}, {3, 15}];
get_base_attr({1, 4, 16}) ->
    [{1, 344}, {4, 86}, {3, 16}];
get_base_attr({1, 4, 17}) ->
    [{1, 368}, {4, 92}, {3, 17}];
get_base_attr({1, 4, 18}) ->
    [{1, 392}, {4, 98}, {3, 18}];
get_base_attr({1, 4, 19}) ->
    [{1, 416}, {4, 104}, {3, 19}];
get_base_attr({1, 4, 20}) ->
    [{1, 440}, {4, 110}, {3, 20}];
get_base_attr({1, 4, 21}) ->
    [{1, 465}, {4, 116}, {3, 21}];
get_base_attr({1, 4, 22}) ->
    [{1, 490}, {4, 122}, {3, 22}];
get_base_attr({1, 4, 23}) ->
    [{1, 515}, {4, 128}, {3, 23}];
get_base_attr({1, 4, 24}) ->
    [{1, 540}, {4, 134}, {3, 24}];
get_base_attr({1, 4, 25}) ->
    [{1, 565}, {4, 140}, {3, 25}];
get_base_attr({1, 4, 26}) ->
    [{1, 591}, {4, 147}, {3, 26}];
get_base_attr({1, 4, 27}) ->
    [{1, 617}, {4, 154}, {3, 27}];
get_base_attr({1, 4, 28}) ->
    [{1, 643}, {4, 161}, {3, 28}];
get_base_attr({1, 4, 29}) ->
    [{1, 669}, {4, 168}, {3, 29}];
get_base_attr({1, 4, 30}) ->
    [{1, 695}, {4, 175}, {3, 30}];
get_base_attr({1, 4, 31}) ->
    [{1, 715}, {4, 180}, {3, 31}];
get_base_attr({1, 4, 32}) ->
    [{1, 735}, {4, 185}, {3, 32}];
get_base_attr({1, 4, 33}) ->
    [{1, 755}, {4, 190}, {3, 33}];
get_base_attr({1, 4, 34}) ->
    [{1, 775}, {4, 195}, {3, 34}];
get_base_attr({1, 4, 35}) ->
    [{1, 795}, {4, 200}, {3, 35}];
get_base_attr({1, 4, 36}) ->
    [{1, 815}, {4, 205}, {3, 36}];
get_base_attr({1, 4, 37}) ->
    [{1, 835}, {4, 210}, {3, 37}];
get_base_attr({1, 4, 38}) ->
    [{1, 855}, {4, 215}, {3, 38}];
get_base_attr({1, 4, 39}) ->
    [{1, 875}, {4, 220}, {3, 39}];
get_base_attr({1, 4, 40}) ->
    [{1, 895}, {4, 225}, {3, 40}];
get_base_attr({1, 5, 1}) -> [{1, 20}, {5, 4}, {43, 2}];
get_base_attr({1, 5, 2}) -> [{1, 40}, {5, 8}, {43, 4}];
get_base_attr({1, 5, 3}) -> [{1, 60}, {5, 12}, {43, 6}];
get_base_attr({1, 5, 4}) -> [{1, 80}, {5, 16}, {43, 8}];
get_base_attr({1, 5, 5}) ->
    [{1, 100}, {5, 20}, {43, 10}];
get_base_attr({1, 5, 6}) ->
    [{1, 121}, {5, 24}, {43, 13}];
get_base_attr({1, 5, 7}) ->
    [{1, 142}, {5, 28}, {43, 16}];
get_base_attr({1, 5, 8}) ->
    [{1, 163}, {5, 32}, {43, 19}];
get_base_attr({1, 5, 9}) ->
    [{1, 184}, {5, 36}, {43, 22}];
get_base_attr({1, 5, 10}) ->
    [{1, 205}, {5, 40}, {43, 25}];
get_base_attr({1, 5, 11}) ->
    [{1, 228}, {5, 45}, {43, 28}];
get_base_attr({1, 5, 12}) ->
    [{1, 251}, {5, 50}, {43, 31}];
get_base_attr({1, 5, 13}) ->
    [{1, 274}, {5, 55}, {43, 34}];
get_base_attr({1, 5, 14}) ->
    [{1, 297}, {5, 60}, {43, 37}];
get_base_attr({1, 5, 15}) ->
    [{1, 320}, {5, 65}, {43, 40}];
get_base_attr({1, 5, 16}) ->
    [{1, 344}, {5, 70}, {43, 43}];
get_base_attr({1, 5, 17}) ->
    [{1, 368}, {5, 75}, {43, 46}];
get_base_attr({1, 5, 18}) ->
    [{1, 392}, {5, 80}, {43, 49}];
get_base_attr({1, 5, 19}) ->
    [{1, 416}, {5, 85}, {43, 52}];
get_base_attr({1, 5, 20}) ->
    [{1, 440}, {5, 90}, {43, 55}];
get_base_attr({1, 5, 21}) ->
    [{1, 465}, {5, 95}, {43, 58}];
get_base_attr({1, 5, 22}) ->
    [{1, 490}, {5, 100}, {43, 61}];
get_base_attr({1, 5, 23}) ->
    [{1, 515}, {5, 105}, {43, 64}];
get_base_attr({1, 5, 24}) ->
    [{1, 540}, {5, 110}, {43, 67}];
get_base_attr({1, 5, 25}) ->
    [{1, 565}, {5, 115}, {43, 70}];
get_base_attr({1, 5, 26}) ->
    [{1, 591}, {5, 120}, {43, 73}];
get_base_attr({1, 5, 27}) ->
    [{1, 617}, {5, 125}, {43, 76}];
get_base_attr({1, 5, 28}) ->
    [{1, 643}, {5, 130}, {43, 79}];
get_base_attr({1, 5, 29}) ->
    [{1, 669}, {5, 135}, {43, 82}];
get_base_attr({1, 5, 30}) ->
    [{1, 695}, {5, 140}, {43, 85}];
get_base_attr({1, 5, 31}) ->
    [{1, 715}, {5, 144}, {43, 87}];
get_base_attr({1, 5, 32}) ->
    [{1, 735}, {5, 148}, {43, 89}];
get_base_attr({1, 5, 33}) ->
    [{1, 755}, {5, 152}, {43, 91}];
get_base_attr({1, 5, 34}) ->
    [{1, 775}, {5, 156}, {43, 93}];
get_base_attr({1, 5, 35}) ->
    [{1, 795}, {5, 160}, {43, 95}];
get_base_attr({1, 5, 36}) ->
    [{1, 815}, {5, 164}, {43, 97}];
get_base_attr({1, 5, 37}) ->
    [{1, 835}, {5, 168}, {43, 99}];
get_base_attr({1, 5, 38}) ->
    [{1, 855}, {5, 172}, {43, 101}];
get_base_attr({1, 5, 39}) ->
    [{1, 875}, {5, 176}, {43, 103}];
get_base_attr({1, 5, 40}) ->
    [{1, 895}, {5, 180}, {43, 105}];
get_base_attr({1, 6, 1}) -> [{1, 20}, {4, 5}, {5, 4}];
get_base_attr({1, 6, 2}) -> [{1, 40}, {4, 10}, {5, 8}];
get_base_attr({1, 6, 3}) -> [{1, 60}, {4, 15}, {5, 12}];
get_base_attr({1, 6, 4}) -> [{1, 80}, {4, 20}, {5, 16}];
get_base_attr({1, 6, 5}) ->
    [{1, 100}, {4, 25}, {5, 20}];
get_base_attr({1, 6, 6}) ->
    [{1, 121}, {4, 30}, {5, 24}];
get_base_attr({1, 6, 7}) ->
    [{1, 142}, {4, 35}, {5, 28}];
get_base_attr({1, 6, 8}) ->
    [{1, 163}, {4, 40}, {5, 32}];
get_base_attr({1, 6, 9}) ->
    [{1, 184}, {4, 45}, {5, 36}];
get_base_attr({1, 6, 10}) ->
    [{1, 205}, {4, 50}, {5, 40}];
get_base_attr({1, 6, 11}) ->
    [{1, 228}, {4, 56}, {5, 45}];
get_base_attr({1, 6, 12}) ->
    [{1, 251}, {4, 62}, {5, 50}];
get_base_attr({1, 6, 13}) ->
    [{1, 274}, {4, 68}, {5, 55}];
get_base_attr({1, 6, 14}) ->
    [{1, 297}, {4, 74}, {5, 60}];
get_base_attr({1, 6, 15}) ->
    [{1, 320}, {4, 80}, {5, 65}];
get_base_attr({1, 6, 16}) ->
    [{1, 344}, {4, 86}, {5, 70}];
get_base_attr({1, 6, 17}) ->
    [{1, 368}, {4, 92}, {5, 75}];
get_base_attr({1, 6, 18}) ->
    [{1, 392}, {4, 98}, {5, 80}];
get_base_attr({1, 6, 19}) ->
    [{1, 416}, {4, 104}, {5, 85}];
get_base_attr({1, 6, 20}) ->
    [{1, 440}, {4, 110}, {5, 90}];
get_base_attr({1, 6, 21}) ->
    [{1, 465}, {4, 116}, {5, 95}];
get_base_attr({1, 6, 22}) ->
    [{1, 490}, {4, 122}, {5, 100}];
get_base_attr({1, 6, 23}) ->
    [{1, 515}, {4, 128}, {5, 105}];
get_base_attr({1, 6, 24}) ->
    [{1, 540}, {4, 134}, {5, 110}];
get_base_attr({1, 6, 25}) ->
    [{1, 565}, {4, 140}, {5, 115}];
get_base_attr({1, 6, 26}) ->
    [{1, 591}, {4, 147}, {5, 120}];
get_base_attr({1, 6, 27}) ->
    [{1, 617}, {4, 154}, {5, 125}];
get_base_attr({1, 6, 28}) ->
    [{1, 643}, {4, 161}, {5, 130}];
get_base_attr({1, 6, 29}) ->
    [{1, 669}, {4, 168}, {5, 135}];
get_base_attr({1, 6, 30}) ->
    [{1, 695}, {4, 175}, {5, 140}];
get_base_attr({1, 6, 31}) ->
    [{1, 715}, {4, 180}, {5, 144}];
get_base_attr({1, 6, 32}) ->
    [{1, 735}, {4, 185}, {5, 148}];
get_base_attr({1, 6, 33}) ->
    [{1, 755}, {4, 190}, {5, 152}];
get_base_attr({1, 6, 34}) ->
    [{1, 775}, {4, 195}, {5, 156}];
get_base_attr({1, 6, 35}) ->
    [{1, 795}, {4, 200}, {5, 160}];
get_base_attr({1, 6, 36}) ->
    [{1, 815}, {4, 205}, {5, 164}];
get_base_attr({1, 6, 37}) ->
    [{1, 835}, {4, 210}, {5, 168}];
get_base_attr({1, 6, 38}) ->
    [{1, 855}, {4, 215}, {5, 172}];
get_base_attr({1, 6, 39}) ->
    [{1, 875}, {4, 220}, {5, 176}];
get_base_attr({1, 6, 40}) ->
    [{1, 895}, {4, 225}, {5, 180}];
get_base_attr({1, 7, 1}) -> [{1, 20}, {4, 5}, {5, 4}];
get_base_attr({1, 7, 2}) -> [{1, 40}, {4, 10}, {5, 8}];
get_base_attr({1, 7, 3}) -> [{1, 60}, {4, 15}, {5, 12}];
get_base_attr({1, 7, 4}) -> [{1, 80}, {4, 20}, {5, 16}];
get_base_attr({1, 7, 5}) ->
    [{1, 100}, {4, 25}, {5, 20}];
get_base_attr({1, 7, 6}) ->
    [{1, 121}, {4, 30}, {5, 24}];
get_base_attr({1, 7, 7}) ->
    [{1, 142}, {4, 35}, {5, 28}];
get_base_attr({1, 7, 8}) ->
    [{1, 163}, {4, 40}, {5, 32}];
get_base_attr({1, 7, 9}) ->
    [{1, 184}, {4, 45}, {5, 36}];
get_base_attr({1, 7, 10}) ->
    [{1, 205}, {4, 50}, {5, 40}];
get_base_attr({1, 7, 11}) ->
    [{1, 228}, {4, 56}, {5, 45}];
get_base_attr({1, 7, 12}) ->
    [{1, 251}, {4, 62}, {5, 50}];
get_base_attr({1, 7, 13}) ->
    [{1, 274}, {4, 68}, {5, 55}];
get_base_attr({1, 7, 14}) ->
    [{1, 297}, {4, 74}, {5, 60}];
get_base_attr({1, 7, 15}) ->
    [{1, 320}, {4, 80}, {5, 65}];
get_base_attr({1, 7, 16}) ->
    [{1, 344}, {4, 86}, {5, 70}];
get_base_attr({1, 7, 17}) ->
    [{1, 368}, {4, 92}, {5, 75}];
get_base_attr({1, 7, 18}) ->
    [{1, 392}, {4, 98}, {5, 80}];
get_base_attr({1, 7, 19}) ->
    [{1, 416}, {4, 104}, {5, 85}];
get_base_attr({1, 7, 20}) ->
    [{1, 440}, {4, 110}, {5, 90}];
get_base_attr({1, 7, 21}) ->
    [{1, 465}, {4, 116}, {5, 95}];
get_base_attr({1, 7, 22}) ->
    [{1, 490}, {4, 122}, {5, 100}];
get_base_attr({1, 7, 23}) ->
    [{1, 515}, {4, 128}, {5, 105}];
get_base_attr({1, 7, 24}) ->
    [{1, 540}, {4, 134}, {5, 110}];
get_base_attr({1, 7, 25}) ->
    [{1, 565}, {4, 140}, {5, 115}];
get_base_attr({1, 7, 26}) ->
    [{1, 591}, {4, 147}, {5, 120}];
get_base_attr({1, 7, 27}) ->
    [{1, 617}, {4, 154}, {5, 125}];
get_base_attr({1, 7, 28}) ->
    [{1, 643}, {4, 161}, {5, 130}];
get_base_attr({1, 7, 29}) ->
    [{1, 669}, {4, 168}, {5, 135}];
get_base_attr({1, 7, 30}) ->
    [{1, 695}, {4, 175}, {5, 140}];
get_base_attr({1, 7, 31}) ->
    [{1, 715}, {4, 180}, {5, 144}];
get_base_attr({1, 7, 32}) ->
    [{1, 735}, {4, 185}, {5, 148}];
get_base_attr({1, 7, 33}) ->
    [{1, 755}, {4, 190}, {5, 152}];
get_base_attr({1, 7, 34}) ->
    [{1, 775}, {4, 195}, {5, 156}];
get_base_attr({1, 7, 35}) ->
    [{1, 795}, {4, 200}, {5, 160}];
get_base_attr({1, 7, 36}) ->
    [{1, 815}, {4, 205}, {5, 164}];
get_base_attr({1, 7, 37}) ->
    [{1, 835}, {4, 210}, {5, 168}];
get_base_attr({1, 7, 38}) ->
    [{1, 855}, {4, 215}, {5, 172}];
get_base_attr({1, 7, 39}) ->
    [{1, 875}, {4, 220}, {5, 176}];
get_base_attr({1, 7, 40}) ->
    [{1, 895}, {4, 225}, {5, 180}];
get_base_attr({2, 1, 1}) -> [{1, 20}, {4, 5}, {5, 4}];
get_base_attr({2, 1, 2}) -> [{1, 40}, {4, 10}, {5, 8}];
get_base_attr({2, 1, 3}) -> [{1, 60}, {4, 15}, {5, 12}];
get_base_attr({2, 1, 4}) -> [{1, 80}, {4, 20}, {5, 16}];
get_base_attr({2, 1, 5}) ->
    [{1, 100}, {4, 25}, {5, 20}];
get_base_attr({2, 1, 6}) ->
    [{1, 121}, {4, 30}, {5, 24}];
get_base_attr({2, 1, 7}) ->
    [{1, 142}, {4, 35}, {5, 28}];
get_base_attr({2, 1, 8}) ->
    [{1, 163}, {4, 40}, {5, 32}];
get_base_attr({2, 1, 9}) ->
    [{1, 184}, {4, 45}, {5, 36}];
get_base_attr({2, 1, 10}) ->
    [{1, 205}, {4, 50}, {5, 40}];
get_base_attr({2, 1, 11}) ->
    [{1, 228}, {4, 56}, {5, 44}];
get_base_attr({2, 1, 12}) ->
    [{1, 251}, {4, 62}, {5, 48}];
get_base_attr({2, 1, 13}) ->
    [{1, 274}, {4, 68}, {5, 52}];
get_base_attr({2, 1, 14}) ->
    [{1, 297}, {4, 74}, {5, 56}];
get_base_attr({2, 1, 15}) ->
    [{1, 320}, {4, 80}, {5, 60}];
get_base_attr({2, 1, 16}) ->
    [{1, 344}, {4, 86}, {5, 65}];
get_base_attr({2, 1, 17}) ->
    [{1, 368}, {4, 92}, {5, 70}];
get_base_attr({2, 1, 18}) ->
    [{1, 392}, {4, 98}, {5, 75}];
get_base_attr({2, 1, 19}) ->
    [{1, 416}, {4, 104}, {5, 80}];
get_base_attr({2, 1, 20}) ->
    [{1, 440}, {4, 110}, {5, 85}];
get_base_attr({2, 1, 21}) ->
    [{1, 465}, {4, 116}, {5, 90}];
get_base_attr({2, 1, 22}) ->
    [{1, 490}, {4, 122}, {5, 95}];
get_base_attr({2, 1, 23}) ->
    [{1, 515}, {4, 128}, {5, 100}];
get_base_attr({2, 1, 24}) ->
    [{1, 540}, {4, 134}, {5, 105}];
get_base_attr({2, 1, 25}) ->
    [{1, 565}, {4, 140}, {5, 110}];
get_base_attr({2, 1, 26}) ->
    [{1, 591}, {4, 147}, {5, 115}];
get_base_attr({2, 1, 27}) ->
    [{1, 617}, {4, 154}, {5, 120}];
get_base_attr({2, 1, 28}) ->
    [{1, 643}, {4, 161}, {5, 125}];
get_base_attr({2, 1, 29}) ->
    [{1, 669}, {4, 168}, {5, 130}];
get_base_attr({2, 1, 30}) ->
    [{1, 695}, {4, 175}, {5, 135}];
get_base_attr({2, 1, 31}) ->
    [{1, 721}, {4, 182}, {5, 140}];
get_base_attr({2, 1, 32}) ->
    [{1, 747}, {4, 189}, {5, 145}];
get_base_attr({2, 1, 33}) ->
    [{1, 773}, {4, 196}, {5, 150}];
get_base_attr({2, 1, 34}) ->
    [{1, 799}, {4, 203}, {5, 155}];
get_base_attr({2, 1, 35}) ->
    [{1, 825}, {4, 210}, {5, 160}];
get_base_attr({2, 1, 36}) ->
    [{1, 851}, {4, 217}, {5, 165}];
get_base_attr({2, 1, 37}) ->
    [{1, 877}, {4, 224}, {5, 170}];
get_base_attr({2, 1, 38}) ->
    [{1, 903}, {4, 231}, {5, 175}];
get_base_attr({2, 1, 39}) ->
    [{1, 929}, {4, 238}, {5, 180}];
get_base_attr({2, 1, 40}) ->
    [{1, 955}, {4, 245}, {5, 185}];
get_base_attr({2, 1, 41}) ->
    [{1, 981}, {4, 252}, {5, 190}];
get_base_attr({2, 1, 42}) ->
    [{1, 1007}, {4, 259}, {5, 195}];
get_base_attr({2, 1, 43}) ->
    [{1, 1033}, {4, 266}, {5, 200}];
get_base_attr({2, 1, 44}) ->
    [{1, 1059}, {4, 273}, {5, 205}];
get_base_attr({2, 1, 45}) ->
    [{1, 1085}, {4, 280}, {5, 210}];
get_base_attr({2, 2, 1}) -> [{1, 20}, {4, 5}, {5, 4}];
get_base_attr({2, 2, 2}) -> [{1, 40}, {4, 10}, {5, 8}];
get_base_attr({2, 2, 3}) -> [{1, 60}, {4, 15}, {5, 12}];
get_base_attr({2, 2, 4}) -> [{1, 80}, {4, 20}, {5, 16}];
get_base_attr({2, 2, 5}) ->
    [{1, 100}, {4, 25}, {5, 20}];
get_base_attr({2, 2, 6}) ->
    [{1, 121}, {4, 30}, {5, 24}];
get_base_attr({2, 2, 7}) ->
    [{1, 142}, {4, 35}, {5, 28}];
get_base_attr({2, 2, 8}) ->
    [{1, 163}, {4, 40}, {5, 32}];
get_base_attr({2, 2, 9}) ->
    [{1, 184}, {4, 45}, {5, 36}];
get_base_attr({2, 2, 10}) ->
    [{1, 205}, {4, 50}, {5, 40}];
get_base_attr({2, 2, 11}) ->
    [{1, 228}, {4, 56}, {5, 44}];
get_base_attr({2, 2, 12}) ->
    [{1, 251}, {4, 62}, {5, 48}];
get_base_attr({2, 2, 13}) ->
    [{1, 274}, {4, 68}, {5, 52}];
get_base_attr({2, 2, 14}) ->
    [{1, 297}, {4, 74}, {5, 56}];
get_base_attr({2, 2, 15}) ->
    [{1, 320}, {4, 80}, {5, 60}];
get_base_attr({2, 2, 16}) ->
    [{1, 344}, {4, 86}, {5, 65}];
get_base_attr({2, 2, 17}) ->
    [{1, 368}, {4, 92}, {5, 70}];
get_base_attr({2, 2, 18}) ->
    [{1, 392}, {4, 98}, {5, 75}];
get_base_attr({2, 2, 19}) ->
    [{1, 416}, {4, 104}, {5, 80}];
get_base_attr({2, 2, 20}) ->
    [{1, 440}, {4, 110}, {5, 85}];
get_base_attr({2, 2, 21}) ->
    [{1, 465}, {4, 116}, {5, 90}];
get_base_attr({2, 2, 22}) ->
    [{1, 490}, {4, 122}, {5, 95}];
get_base_attr({2, 2, 23}) ->
    [{1, 515}, {4, 128}, {5, 100}];
get_base_attr({2, 2, 24}) ->
    [{1, 540}, {4, 134}, {5, 105}];
get_base_attr({2, 2, 25}) ->
    [{1, 565}, {4, 140}, {5, 110}];
get_base_attr({2, 2, 26}) ->
    [{1, 591}, {4, 147}, {5, 115}];
get_base_attr({2, 2, 27}) ->
    [{1, 617}, {4, 154}, {5, 120}];
get_base_attr({2, 2, 28}) ->
    [{1, 643}, {4, 161}, {5, 125}];
get_base_attr({2, 2, 29}) ->
    [{1, 669}, {4, 168}, {5, 130}];
get_base_attr({2, 2, 30}) ->
    [{1, 695}, {4, 175}, {5, 135}];
get_base_attr({2, 2, 31}) ->
    [{1, 721}, {4, 182}, {5, 140}];
get_base_attr({2, 2, 32}) ->
    [{1, 747}, {4, 189}, {5, 145}];
get_base_attr({2, 2, 33}) ->
    [{1, 773}, {4, 196}, {5, 150}];
get_base_attr({2, 2, 34}) ->
    [{1, 799}, {4, 203}, {5, 155}];
get_base_attr({2, 2, 35}) ->
    [{1, 825}, {4, 210}, {5, 160}];
get_base_attr({2, 2, 36}) ->
    [{1, 851}, {4, 217}, {5, 165}];
get_base_attr({2, 2, 37}) ->
    [{1, 877}, {4, 224}, {5, 170}];
get_base_attr({2, 2, 38}) ->
    [{1, 903}, {4, 231}, {5, 175}];
get_base_attr({2, 2, 39}) ->
    [{1, 929}, {4, 238}, {5, 180}];
get_base_attr({2, 2, 40}) ->
    [{1, 955}, {4, 245}, {5, 185}];
get_base_attr({2, 2, 41}) ->
    [{1, 981}, {4, 252}, {5, 190}];
get_base_attr({2, 2, 42}) ->
    [{1, 1007}, {4, 259}, {5, 195}];
get_base_attr({2, 2, 43}) ->
    [{1, 1033}, {4, 266}, {5, 200}];
get_base_attr({2, 2, 44}) ->
    [{1, 1059}, {4, 273}, {5, 205}];
get_base_attr({2, 2, 45}) ->
    [{1, 1085}, {4, 280}, {5, 210}];
get_base_attr({2, 3, 1}) -> [{1, 20}, {4, 5}, {5, 4}];
get_base_attr({2, 3, 2}) -> [{1, 40}, {4, 10}, {5, 8}];
get_base_attr({2, 3, 3}) -> [{1, 60}, {4, 15}, {5, 12}];
get_base_attr({2, 3, 4}) -> [{1, 80}, {4, 20}, {5, 16}];
get_base_attr({2, 3, 5}) ->
    [{1, 100}, {4, 25}, {5, 20}];
get_base_attr({2, 3, 6}) ->
    [{1, 121}, {4, 30}, {5, 24}];
get_base_attr({2, 3, 7}) ->
    [{1, 142}, {4, 35}, {5, 28}];
get_base_attr({2, 3, 8}) ->
    [{1, 163}, {4, 40}, {5, 32}];
get_base_attr({2, 3, 9}) ->
    [{1, 184}, {4, 45}, {5, 36}];
get_base_attr({2, 3, 10}) ->
    [{1, 205}, {4, 50}, {5, 40}];
get_base_attr({2, 3, 11}) ->
    [{1, 228}, {4, 56}, {5, 44}];
get_base_attr({2, 3, 12}) ->
    [{1, 251}, {4, 62}, {5, 48}];
get_base_attr({2, 3, 13}) ->
    [{1, 274}, {4, 68}, {5, 52}];
get_base_attr({2, 3, 14}) ->
    [{1, 297}, {4, 74}, {5, 56}];
get_base_attr({2, 3, 15}) ->
    [{1, 320}, {4, 80}, {5, 60}];
get_base_attr({2, 3, 16}) ->
    [{1, 344}, {4, 86}, {5, 65}];
get_base_attr({2, 3, 17}) ->
    [{1, 368}, {4, 92}, {5, 70}];
get_base_attr({2, 3, 18}) ->
    [{1, 392}, {4, 98}, {5, 75}];
get_base_attr({2, 3, 19}) ->
    [{1, 416}, {4, 104}, {5, 80}];
get_base_attr({2, 3, 20}) ->
    [{1, 440}, {4, 110}, {5, 85}];
get_base_attr({2, 3, 21}) ->
    [{1, 465}, {4, 116}, {5, 90}];
get_base_attr({2, 3, 22}) ->
    [{1, 490}, {4, 122}, {5, 95}];
get_base_attr({2, 3, 23}) ->
    [{1, 515}, {4, 128}, {5, 100}];
get_base_attr({2, 3, 24}) ->
    [{1, 540}, {4, 134}, {5, 105}];
get_base_attr({2, 3, 25}) ->
    [{1, 565}, {4, 140}, {5, 110}];
get_base_attr({2, 3, 26}) ->
    [{1, 591}, {4, 147}, {5, 115}];
get_base_attr({2, 3, 27}) ->
    [{1, 617}, {4, 154}, {5, 120}];
get_base_attr({2, 3, 28}) ->
    [{1, 643}, {4, 161}, {5, 125}];
get_base_attr({2, 3, 29}) ->
    [{1, 669}, {4, 168}, {5, 130}];
get_base_attr({2, 3, 30}) ->
    [{1, 695}, {4, 175}, {5, 135}];
get_base_attr({2, 3, 31}) ->
    [{1, 721}, {4, 182}, {5, 140}];
get_base_attr({2, 3, 32}) ->
    [{1, 747}, {4, 189}, {5, 145}];
get_base_attr({2, 3, 33}) ->
    [{1, 773}, {4, 196}, {5, 150}];
get_base_attr({2, 3, 34}) ->
    [{1, 799}, {4, 203}, {5, 155}];
get_base_attr({2, 3, 35}) ->
    [{1, 825}, {4, 210}, {5, 160}];
get_base_attr({2, 3, 36}) ->
    [{1, 851}, {4, 217}, {5, 165}];
get_base_attr({2, 3, 37}) ->
    [{1, 877}, {4, 224}, {5, 170}];
get_base_attr({2, 3, 38}) ->
    [{1, 903}, {4, 231}, {5, 175}];
get_base_attr({2, 3, 39}) ->
    [{1, 929}, {4, 238}, {5, 180}];
get_base_attr({2, 3, 40}) ->
    [{1, 955}, {4, 245}, {5, 185}];
get_base_attr({2, 3, 41}) ->
    [{1, 981}, {4, 252}, {5, 190}];
get_base_attr({2, 3, 42}) ->
    [{1, 1007}, {4, 259}, {5, 195}];
get_base_attr({2, 3, 43}) ->
    [{1, 1033}, {4, 266}, {5, 200}];
get_base_attr({2, 3, 44}) ->
    [{1, 1059}, {4, 273}, {5, 205}];
get_base_attr({2, 3, 45}) ->
    [{1, 1085}, {4, 280}, {5, 210}];
get_base_attr({2, 4, 1}) -> [{1, 20}, {4, 5}, {3, 1}];
get_base_attr({2, 4, 2}) -> [{1, 40}, {4, 10}, {3, 2}];
get_base_attr({2, 4, 3}) -> [{1, 60}, {4, 15}, {3, 3}];
get_base_attr({2, 4, 4}) -> [{1, 80}, {4, 20}, {3, 4}];
get_base_attr({2, 4, 5}) -> [{1, 100}, {4, 25}, {3, 5}];
get_base_attr({2, 4, 6}) -> [{1, 121}, {4, 30}, {3, 6}];
get_base_attr({2, 4, 7}) -> [{1, 142}, {4, 35}, {3, 7}];
get_base_attr({2, 4, 8}) -> [{1, 163}, {4, 40}, {3, 8}];
get_base_attr({2, 4, 9}) -> [{1, 184}, {4, 45}, {3, 9}];
get_base_attr({2, 4, 10}) ->
    [{1, 205}, {4, 50}, {3, 10}];
get_base_attr({2, 4, 11}) ->
    [{1, 228}, {4, 56}, {3, 11}];
get_base_attr({2, 4, 12}) ->
    [{1, 251}, {4, 62}, {3, 12}];
get_base_attr({2, 4, 13}) ->
    [{1, 274}, {4, 68}, {3, 13}];
get_base_attr({2, 4, 14}) ->
    [{1, 297}, {4, 74}, {3, 14}];
get_base_attr({2, 4, 15}) ->
    [{1, 320}, {4, 80}, {3, 15}];
get_base_attr({2, 4, 16}) ->
    [{1, 344}, {4, 86}, {3, 16}];
get_base_attr({2, 4, 17}) ->
    [{1, 368}, {4, 92}, {3, 17}];
get_base_attr({2, 4, 18}) ->
    [{1, 392}, {4, 98}, {3, 18}];
get_base_attr({2, 4, 19}) ->
    [{1, 416}, {4, 104}, {3, 19}];
get_base_attr({2, 4, 20}) ->
    [{1, 440}, {4, 110}, {3, 20}];
get_base_attr({2, 4, 21}) ->
    [{1, 465}, {4, 116}, {3, 21}];
get_base_attr({2, 4, 22}) ->
    [{1, 490}, {4, 122}, {3, 22}];
get_base_attr({2, 4, 23}) ->
    [{1, 515}, {4, 128}, {3, 23}];
get_base_attr({2, 4, 24}) ->
    [{1, 540}, {4, 134}, {3, 24}];
get_base_attr({2, 4, 25}) ->
    [{1, 565}, {4, 140}, {3, 25}];
get_base_attr({2, 4, 26}) ->
    [{1, 591}, {4, 147}, {3, 26}];
get_base_attr({2, 4, 27}) ->
    [{1, 617}, {4, 154}, {3, 27}];
get_base_attr({2, 4, 28}) ->
    [{1, 643}, {4, 161}, {3, 28}];
get_base_attr({2, 4, 29}) ->
    [{1, 669}, {4, 168}, {3, 29}];
get_base_attr({2, 4, 30}) ->
    [{1, 695}, {4, 175}, {3, 30}];
get_base_attr({2, 4, 31}) ->
    [{1, 721}, {4, 182}, {3, 31}];
get_base_attr({2, 4, 32}) ->
    [{1, 747}, {4, 189}, {3, 32}];
get_base_attr({2, 4, 33}) ->
    [{1, 773}, {4, 196}, {3, 33}];
get_base_attr({2, 4, 34}) ->
    [{1, 799}, {4, 203}, {3, 34}];
get_base_attr({2, 4, 35}) ->
    [{1, 825}, {4, 210}, {3, 35}];
get_base_attr({2, 4, 36}) ->
    [{1, 851}, {4, 217}, {3, 36}];
get_base_attr({2, 4, 37}) ->
    [{1, 877}, {4, 224}, {3, 37}];
get_base_attr({2, 4, 38}) ->
    [{1, 903}, {4, 231}, {3, 38}];
get_base_attr({2, 4, 39}) ->
    [{1, 929}, {4, 238}, {3, 39}];
get_base_attr({2, 4, 40}) ->
    [{1, 955}, {4, 245}, {3, 40}];
get_base_attr({2, 4, 41}) ->
    [{1, 981}, {4, 252}, {3, 41}];
get_base_attr({2, 4, 42}) ->
    [{1, 1007}, {4, 259}, {3, 42}];
get_base_attr({2, 4, 43}) ->
    [{1, 1033}, {4, 266}, {3, 43}];
get_base_attr({2, 4, 44}) ->
    [{1, 1059}, {4, 273}, {3, 44}];
get_base_attr({2, 4, 45}) ->
    [{1, 1085}, {4, 280}, {3, 45}];
get_base_attr({2, 5, 1}) -> [{1, 20}, {5, 4}, {43, 2}];
get_base_attr({2, 5, 2}) -> [{1, 40}, {5, 8}, {43, 4}];
get_base_attr({2, 5, 3}) -> [{1, 60}, {5, 12}, {43, 6}];
get_base_attr({2, 5, 4}) -> [{1, 80}, {5, 16}, {43, 8}];
get_base_attr({2, 5, 5}) ->
    [{1, 100}, {5, 20}, {43, 10}];
get_base_attr({2, 5, 6}) ->
    [{1, 121}, {5, 24}, {43, 13}];
get_base_attr({2, 5, 7}) ->
    [{1, 142}, {5, 28}, {43, 16}];
get_base_attr({2, 5, 8}) ->
    [{1, 163}, {5, 32}, {43, 19}];
get_base_attr({2, 5, 9}) ->
    [{1, 184}, {5, 36}, {43, 22}];
get_base_attr({2, 5, 10}) ->
    [{1, 205}, {5, 40}, {43, 25}];
get_base_attr({2, 5, 11}) ->
    [{1, 228}, {5, 44}, {43, 28}];
get_base_attr({2, 5, 12}) ->
    [{1, 251}, {5, 48}, {43, 31}];
get_base_attr({2, 5, 13}) ->
    [{1, 274}, {5, 52}, {43, 34}];
get_base_attr({2, 5, 14}) ->
    [{1, 297}, {5, 56}, {43, 37}];
get_base_attr({2, 5, 15}) ->
    [{1, 320}, {5, 60}, {43, 40}];
get_base_attr({2, 5, 16}) ->
    [{1, 344}, {5, 65}, {43, 43}];
get_base_attr({2, 5, 17}) ->
    [{1, 368}, {5, 70}, {43, 46}];
get_base_attr({2, 5, 18}) ->
    [{1, 392}, {5, 75}, {43, 49}];
get_base_attr({2, 5, 19}) ->
    [{1, 416}, {5, 80}, {43, 52}];
get_base_attr({2, 5, 20}) ->
    [{1, 440}, {5, 85}, {43, 55}];
get_base_attr({2, 5, 21}) ->
    [{1, 465}, {5, 90}, {43, 58}];
get_base_attr({2, 5, 22}) ->
    [{1, 490}, {5, 95}, {43, 61}];
get_base_attr({2, 5, 23}) ->
    [{1, 515}, {5, 100}, {43, 64}];
get_base_attr({2, 5, 24}) ->
    [{1, 540}, {5, 105}, {43, 67}];
get_base_attr({2, 5, 25}) ->
    [{1, 565}, {5, 110}, {43, 70}];
get_base_attr({2, 5, 26}) ->
    [{1, 591}, {5, 115}, {43, 73}];
get_base_attr({2, 5, 27}) ->
    [{1, 617}, {5, 120}, {43, 76}];
get_base_attr({2, 5, 28}) ->
    [{1, 643}, {5, 125}, {43, 79}];
get_base_attr({2, 5, 29}) ->
    [{1, 669}, {5, 130}, {43, 82}];
get_base_attr({2, 5, 30}) ->
    [{1, 695}, {5, 135}, {43, 85}];
get_base_attr({2, 5, 31}) ->
    [{1, 721}, {5, 140}, {43, 88}];
get_base_attr({2, 5, 32}) ->
    [{1, 747}, {5, 145}, {43, 91}];
get_base_attr({2, 5, 33}) ->
    [{1, 773}, {5, 150}, {43, 94}];
get_base_attr({2, 5, 34}) ->
    [{1, 799}, {5, 155}, {43, 97}];
get_base_attr({2, 5, 35}) ->
    [{1, 825}, {5, 160}, {43, 100}];
get_base_attr({2, 5, 36}) ->
    [{1, 851}, {5, 165}, {43, 103}];
get_base_attr({2, 5, 37}) ->
    [{1, 877}, {5, 170}, {43, 106}];
get_base_attr({2, 5, 38}) ->
    [{1, 903}, {5, 175}, {43, 109}];
get_base_attr({2, 5, 39}) ->
    [{1, 929}, {5, 180}, {43, 112}];
get_base_attr({2, 5, 40}) ->
    [{1, 955}, {5, 185}, {43, 115}];
get_base_attr({2, 5, 41}) ->
    [{1, 981}, {5, 190}, {43, 118}];
get_base_attr({2, 5, 42}) ->
    [{1, 1007}, {5, 195}, {43, 121}];
get_base_attr({2, 5, 43}) ->
    [{1, 1033}, {5, 200}, {43, 124}];
get_base_attr({2, 5, 44}) ->
    [{1, 1059}, {5, 205}, {43, 127}];
get_base_attr({2, 5, 45}) ->
    [{1, 1085}, {5, 210}, {43, 130}];
get_base_attr({2, 6, 1}) -> [{1, 20}, {4, 5}, {5, 4}];
get_base_attr({2, 6, 2}) -> [{1, 40}, {4, 10}, {5, 8}];
get_base_attr({2, 6, 3}) -> [{1, 60}, {4, 15}, {5, 12}];
get_base_attr({2, 6, 4}) -> [{1, 80}, {4, 20}, {5, 16}];
get_base_attr({2, 6, 5}) ->
    [{1, 100}, {4, 25}, {5, 20}];
get_base_attr({2, 6, 6}) ->
    [{1, 121}, {4, 30}, {5, 24}];
get_base_attr({2, 6, 7}) ->
    [{1, 142}, {4, 35}, {5, 28}];
get_base_attr({2, 6, 8}) ->
    [{1, 163}, {4, 40}, {5, 32}];
get_base_attr({2, 6, 9}) ->
    [{1, 184}, {4, 45}, {5, 36}];
get_base_attr({2, 6, 10}) ->
    [{1, 205}, {4, 50}, {5, 40}];
get_base_attr({2, 6, 11}) ->
    [{1, 228}, {4, 56}, {5, 44}];
get_base_attr({2, 6, 12}) ->
    [{1, 251}, {4, 62}, {5, 48}];
get_base_attr({2, 6, 13}) ->
    [{1, 274}, {4, 68}, {5, 52}];
get_base_attr({2, 6, 14}) ->
    [{1, 297}, {4, 74}, {5, 56}];
get_base_attr({2, 6, 15}) ->
    [{1, 320}, {4, 80}, {5, 60}];
get_base_attr({2, 6, 16}) ->
    [{1, 344}, {4, 86}, {5, 65}];
get_base_attr({2, 6, 17}) ->
    [{1, 368}, {4, 92}, {5, 70}];
get_base_attr({2, 6, 18}) ->
    [{1, 392}, {4, 98}, {5, 75}];
get_base_attr({2, 6, 19}) ->
    [{1, 416}, {4, 104}, {5, 80}];
get_base_attr({2, 6, 20}) ->
    [{1, 440}, {4, 110}, {5, 85}];
get_base_attr({2, 6, 21}) ->
    [{1, 465}, {4, 116}, {5, 90}];
get_base_attr({2, 6, 22}) ->
    [{1, 490}, {4, 122}, {5, 95}];
get_base_attr({2, 6, 23}) ->
    [{1, 515}, {4, 128}, {5, 100}];
get_base_attr({2, 6, 24}) ->
    [{1, 540}, {4, 134}, {5, 105}];
get_base_attr({2, 6, 25}) ->
    [{1, 565}, {4, 140}, {5, 110}];
get_base_attr({2, 6, 26}) ->
    [{1, 591}, {4, 147}, {5, 115}];
get_base_attr({2, 6, 27}) ->
    [{1, 617}, {4, 154}, {5, 120}];
get_base_attr({2, 6, 28}) ->
    [{1, 643}, {4, 161}, {5, 125}];
get_base_attr({2, 6, 29}) ->
    [{1, 669}, {4, 168}, {5, 130}];
get_base_attr({2, 6, 30}) ->
    [{1, 695}, {4, 175}, {5, 135}];
get_base_attr({2, 6, 31}) ->
    [{1, 721}, {4, 182}, {5, 140}];
get_base_attr({2, 6, 32}) ->
    [{1, 747}, {4, 189}, {5, 145}];
get_base_attr({2, 6, 33}) ->
    [{1, 773}, {4, 196}, {5, 150}];
get_base_attr({2, 6, 34}) ->
    [{1, 799}, {4, 203}, {5, 155}];
get_base_attr({2, 6, 35}) ->
    [{1, 825}, {4, 210}, {5, 160}];
get_base_attr({2, 6, 36}) ->
    [{1, 851}, {4, 217}, {5, 165}];
get_base_attr({2, 6, 37}) ->
    [{1, 877}, {4, 224}, {5, 170}];
get_base_attr({2, 6, 38}) ->
    [{1, 903}, {4, 231}, {5, 175}];
get_base_attr({2, 6, 39}) ->
    [{1, 929}, {4, 238}, {5, 180}];
get_base_attr({2, 6, 40}) ->
    [{1, 955}, {4, 245}, {5, 185}];
get_base_attr({2, 6, 41}) ->
    [{1, 981}, {4, 252}, {5, 190}];
get_base_attr({2, 6, 42}) ->
    [{1, 1007}, {4, 259}, {5, 195}];
get_base_attr({2, 6, 43}) ->
    [{1, 1033}, {4, 266}, {5, 200}];
get_base_attr({2, 6, 44}) ->
    [{1, 1059}, {4, 273}, {5, 205}];
get_base_attr({2, 6, 45}) ->
    [{1, 1085}, {4, 280}, {5, 210}];
get_base_attr({2, 7, 1}) -> [{1, 20}, {4, 5}, {5, 4}];
get_base_attr({2, 7, 2}) -> [{1, 40}, {4, 10}, {5, 8}];
get_base_attr({2, 7, 3}) -> [{1, 60}, {4, 15}, {5, 12}];
get_base_attr({2, 7, 4}) -> [{1, 80}, {4, 20}, {5, 16}];
get_base_attr({2, 7, 5}) ->
    [{1, 100}, {4, 25}, {5, 20}];
get_base_attr({2, 7, 6}) ->
    [{1, 121}, {4, 30}, {5, 24}];
get_base_attr({2, 7, 7}) ->
    [{1, 142}, {4, 35}, {5, 28}];
get_base_attr({2, 7, 8}) ->
    [{1, 163}, {4, 40}, {5, 32}];
get_base_attr({2, 7, 9}) ->
    [{1, 184}, {4, 45}, {5, 36}];
get_base_attr({2, 7, 10}) ->
    [{1, 205}, {4, 50}, {5, 40}];
get_base_attr({2, 7, 11}) ->
    [{1, 228}, {4, 56}, {5, 44}];
get_base_attr({2, 7, 12}) ->
    [{1, 251}, {4, 62}, {5, 48}];
get_base_attr({2, 7, 13}) ->
    [{1, 274}, {4, 68}, {5, 52}];
get_base_attr({2, 7, 14}) ->
    [{1, 297}, {4, 74}, {5, 56}];
get_base_attr({2, 7, 15}) ->
    [{1, 320}, {4, 80}, {5, 60}];
get_base_attr({2, 7, 16}) ->
    [{1, 344}, {4, 86}, {5, 65}];
get_base_attr({2, 7, 17}) ->
    [{1, 368}, {4, 92}, {5, 70}];
get_base_attr({2, 7, 18}) ->
    [{1, 392}, {4, 98}, {5, 75}];
get_base_attr({2, 7, 19}) ->
    [{1, 416}, {4, 104}, {5, 80}];
get_base_attr({2, 7, 20}) ->
    [{1, 440}, {4, 110}, {5, 85}];
get_base_attr({2, 7, 21}) ->
    [{1, 465}, {4, 116}, {5, 90}];
get_base_attr({2, 7, 22}) ->
    [{1, 490}, {4, 122}, {5, 95}];
get_base_attr({2, 7, 23}) ->
    [{1, 515}, {4, 128}, {5, 100}];
get_base_attr({2, 7, 24}) ->
    [{1, 540}, {4, 134}, {5, 105}];
get_base_attr({2, 7, 25}) ->
    [{1, 565}, {4, 140}, {5, 110}];
get_base_attr({2, 7, 26}) ->
    [{1, 591}, {4, 147}, {5, 115}];
get_base_attr({2, 7, 27}) ->
    [{1, 617}, {4, 154}, {5, 120}];
get_base_attr({2, 7, 28}) ->
    [{1, 643}, {4, 161}, {5, 125}];
get_base_attr({2, 7, 29}) ->
    [{1, 669}, {4, 168}, {5, 130}];
get_base_attr({2, 7, 30}) ->
    [{1, 695}, {4, 175}, {5, 135}];
get_base_attr({2, 7, 31}) ->
    [{1, 721}, {4, 182}, {5, 140}];
get_base_attr({2, 7, 32}) ->
    [{1, 747}, {4, 189}, {5, 145}];
get_base_attr({2, 7, 33}) ->
    [{1, 773}, {4, 196}, {5, 150}];
get_base_attr({2, 7, 34}) ->
    [{1, 799}, {4, 203}, {5, 155}];
get_base_attr({2, 7, 35}) ->
    [{1, 825}, {4, 210}, {5, 160}];
get_base_attr({2, 7, 36}) ->
    [{1, 851}, {4, 217}, {5, 165}];
get_base_attr({2, 7, 37}) ->
    [{1, 877}, {4, 224}, {5, 170}];
get_base_attr({2, 7, 38}) ->
    [{1, 903}, {4, 231}, {5, 175}];
get_base_attr({2, 7, 39}) ->
    [{1, 929}, {4, 238}, {5, 180}];
get_base_attr({2, 7, 40}) ->
    [{1, 955}, {4, 245}, {5, 185}];
get_base_attr({2, 7, 41}) ->
    [{1, 981}, {4, 252}, {5, 190}];
get_base_attr({2, 7, 42}) ->
    [{1, 1007}, {4, 259}, {5, 195}];
get_base_attr({2, 7, 43}) ->
    [{1, 1033}, {4, 266}, {5, 200}];
get_base_attr({2, 7, 44}) ->
    [{1, 1059}, {4, 273}, {5, 205}];
get_base_attr({2, 7, 45}) ->
    [{1, 1085}, {4, 280}, {5, 210}];
get_base_attr({3, 0, 1}) ->
    [{1, 14}, {4, 6}, {5, 5}, {6, 3}, {7, 3}];
get_base_attr({3, 0, 2}) ->
    [{1, 28}, {4, 12}, {5, 10}, {6, 6}, {7, 6}];
get_base_attr({3, 0, 3}) ->
    [{1, 42}, {4, 18}, {5, 15}, {6, 9}, {7, 9}];
get_base_attr({3, 0, 4}) ->
    [{1, 56}, {4, 24}, {5, 20}, {6, 12}, {7, 12}];
get_base_attr({3, 0, 5}) ->
    [{1, 70}, {4, 30}, {5, 25}, {6, 15}, {7, 15}];
get_base_attr({3, 0, 6}) ->
    [{1, 85}, {4, 36}, {5, 31}, {6, 18}, {7, 18}];
get_base_attr({3, 0, 7}) ->
    [{1, 100}, {4, 42}, {5, 37}, {6, 21}, {7, 21}];
get_base_attr({3, 0, 8}) ->
    [{1, 115}, {4, 48}, {5, 43}, {6, 24}, {7, 24}];
get_base_attr({3, 0, 9}) ->
    [{1, 130}, {4, 54}, {5, 49}, {6, 27}, {7, 27}];
get_base_attr({3, 0, 10}) ->
    [{1, 145}, {4, 60}, {5, 55}, {6, 30}, {7, 30}];
get_base_attr({3, 0, 11}) ->
    [{1, 161}, {4, 67}, {5, 61}, {6, 33}, {7, 33}];
get_base_attr({3, 0, 12}) ->
    [{1, 177}, {4, 74}, {5, 67}, {6, 36}, {7, 36}];
get_base_attr({3, 0, 13}) ->
    [{1, 193}, {4, 81}, {5, 73}, {6, 39}, {7, 39}];
get_base_attr({3, 0, 14}) ->
    [{1, 209}, {4, 88}, {5, 79}, {6, 42}, {7, 42}];
get_base_attr({3, 0, 15}) ->
    [{1, 225}, {4, 95}, {5, 85}, {6, 45}, {7, 45}];
get_base_attr({3, 0, 16}) ->
    [{1, 242}, {4, 102}, {5, 91}, {6, 49}, {7, 48}];
get_base_attr({3, 0, 17}) ->
    [{1, 259}, {4, 109}, {5, 97}, {6, 53}, {7, 51}];
get_base_attr({3, 0, 18}) ->
    [{1, 276}, {4, 116}, {5, 103}, {6, 57}, {7, 54}];
get_base_attr({3, 0, 19}) ->
    [{1, 293}, {4, 123}, {5, 109}, {6, 61}, {7, 57}];
get_base_attr({3, 0, 20}) ->
    [{1, 310}, {4, 130}, {5, 115}, {6, 65}, {7, 60}];
get_base_attr({3, 0, 21}) ->
    [{1, 328}, {4, 137}, {5, 121}, {6, 69}, {7, 63}];
get_base_attr({3, 0, 22}) ->
    [{1, 346}, {4, 144}, {5, 127}, {6, 73}, {7, 66}];
get_base_attr({3, 0, 23}) ->
    [{1, 364}, {4, 151}, {5, 133}, {6, 77}, {7, 69}];
get_base_attr({3, 0, 24}) ->
    [{1, 382}, {4, 158}, {5, 139}, {6, 81}, {7, 72}];
get_base_attr({3, 0, 25}) ->
    [{1, 400}, {4, 165}, {5, 145}, {6, 85}, {7, 75}];
get_base_attr({3, 0, 26}) ->
    [{1, 419}, {4, 173}, {5, 152}, {6, 89}, {7, 78}];
get_base_attr({3, 0, 27}) ->
    [{1, 438}, {4, 181}, {5, 159}, {6, 93}, {7, 81}];
get_base_attr({3, 0, 28}) ->
    [{1, 457}, {4, 189}, {5, 166}, {6, 97}, {7, 84}];
get_base_attr({3, 0, 29}) ->
    [{1, 476}, {4, 197}, {5, 173}, {6, 101}, {7, 87}];
get_base_attr({3, 0, 30}) ->
    [{1, 495}, {4, 205}, {5, 180}, {6, 105}, {7, 90}];
get_base_attr({3, 0, 31}) ->
    [{1, 514}, {4, 213}, {5, 187}, {6, 109}, {7, 93}];
get_base_attr({3, 0, 32}) ->
    [{1, 533}, {4, 221}, {5, 194}, {6, 113}, {7, 96}];
get_base_attr({3, 0, 33}) ->
    [{1, 552}, {4, 229}, {5, 201}, {6, 117}, {7, 99}];
get_base_attr({3, 0, 34}) ->
    [{1, 571}, {4, 237}, {5, 208}, {6, 121}, {7, 102}];
get_base_attr({3, 0, 35}) ->
    [{1, 590}, {4, 245}, {5, 215}, {6, 125}, {7, 105}];
get_base_attr({3, 0, 36}) ->
    [{1, 609}, {4, 253}, {5, 222}, {6, 129}, {7, 108}];
get_base_attr({3, 0, 37}) ->
    [{1, 628}, {4, 261}, {5, 229}, {6, 133}, {7, 111}];
get_base_attr({3, 0, 38}) ->
    [{1, 647}, {4, 269}, {5, 236}, {6, 137}, {7, 114}];
get_base_attr({3, 0, 39}) ->
    [{1, 666}, {4, 277}, {5, 243}, {6, 141}, {7, 117}];
get_base_attr({3, 0, 40}) ->
    [{1, 685}, {4, 285}, {5, 250}, {6, 145}, {7, 120}];
get_base_attr({3, 0, 41}) ->
    [{1, 704}, {4, 293}, {5, 257}, {6, 149}, {7, 123}];
get_base_attr({3, 0, 42}) ->
    [{1, 723}, {4, 301}, {5, 264}, {6, 153}, {7, 126}];
get_base_attr({3, 0, 43}) ->
    [{1, 742}, {4, 309}, {5, 271}, {6, 157}, {7, 129}];
get_base_attr({3, 0, 44}) ->
    [{1, 761}, {4, 317}, {5, 278}, {6, 161}, {7, 132}];
get_base_attr({3, 0, 45}) ->
    [{1, 780}, {4, 325}, {5, 285}, {6, 165}, {7, 135}];
get_base_attr({3, 1, 1}) ->
    [{1, 14}, {4, 6}, {5, 5}, {6, 3}, {7, 3}];
get_base_attr({3, 1, 2}) ->
    [{1, 28}, {4, 12}, {5, 10}, {6, 6}, {7, 6}];
get_base_attr({3, 1, 3}) ->
    [{1, 42}, {4, 18}, {5, 15}, {6, 9}, {7, 9}];
get_base_attr({3, 1, 4}) ->
    [{1, 56}, {4, 24}, {5, 20}, {6, 12}, {7, 12}];
get_base_attr({3, 1, 5}) ->
    [{1, 70}, {4, 30}, {5, 25}, {6, 15}, {7, 15}];
get_base_attr({3, 1, 6}) ->
    [{1, 85}, {4, 36}, {5, 31}, {6, 18}, {7, 18}];
get_base_attr({3, 1, 7}) ->
    [{1, 100}, {4, 42}, {5, 37}, {6, 21}, {7, 21}];
get_base_attr({3, 1, 8}) ->
    [{1, 115}, {4, 48}, {5, 43}, {6, 24}, {7, 24}];
get_base_attr({3, 1, 9}) ->
    [{1, 130}, {4, 54}, {5, 49}, {6, 27}, {7, 27}];
get_base_attr({3, 1, 10}) ->
    [{1, 145}, {4, 60}, {5, 55}, {6, 30}, {7, 30}];
get_base_attr({3, 1, 11}) ->
    [{1, 161}, {4, 67}, {5, 61}, {6, 33}, {7, 33}];
get_base_attr({3, 1, 12}) ->
    [{1, 177}, {4, 74}, {5, 67}, {6, 36}, {7, 36}];
get_base_attr({3, 1, 13}) ->
    [{1, 193}, {4, 81}, {5, 73}, {6, 39}, {7, 39}];
get_base_attr({3, 1, 14}) ->
    [{1, 209}, {4, 88}, {5, 79}, {6, 42}, {7, 42}];
get_base_attr({3, 1, 15}) ->
    [{1, 225}, {4, 95}, {5, 85}, {6, 45}, {7, 45}];
get_base_attr({3, 1, 16}) ->
    [{1, 242}, {4, 102}, {5, 91}, {6, 49}, {7, 48}];
get_base_attr({3, 1, 17}) ->
    [{1, 259}, {4, 109}, {5, 97}, {6, 53}, {7, 51}];
get_base_attr({3, 1, 18}) ->
    [{1, 276}, {4, 116}, {5, 103}, {6, 57}, {7, 54}];
get_base_attr({3, 1, 19}) ->
    [{1, 293}, {4, 123}, {5, 109}, {6, 61}, {7, 57}];
get_base_attr({3, 1, 20}) ->
    [{1, 310}, {4, 130}, {5, 115}, {6, 65}, {7, 60}];
get_base_attr({3, 1, 21}) ->
    [{1, 328}, {4, 137}, {5, 121}, {6, 69}, {7, 63}];
get_base_attr({3, 1, 22}) ->
    [{1, 346}, {4, 144}, {5, 127}, {6, 73}, {7, 66}];
get_base_attr({3, 1, 23}) ->
    [{1, 364}, {4, 151}, {5, 133}, {6, 77}, {7, 69}];
get_base_attr({3, 1, 24}) ->
    [{1, 382}, {4, 158}, {5, 139}, {6, 81}, {7, 72}];
get_base_attr({3, 1, 25}) ->
    [{1, 400}, {4, 165}, {5, 145}, {6, 85}, {7, 75}];
get_base_attr({3, 1, 26}) ->
    [{1, 419}, {4, 173}, {5, 152}, {6, 89}, {7, 78}];
get_base_attr({3, 1, 27}) ->
    [{1, 438}, {4, 181}, {5, 159}, {6, 93}, {7, 81}];
get_base_attr({3, 1, 28}) ->
    [{1, 457}, {4, 189}, {5, 166}, {6, 97}, {7, 84}];
get_base_attr({3, 1, 29}) ->
    [{1, 476}, {4, 197}, {5, 173}, {6, 101}, {7, 87}];
get_base_attr({3, 1, 30}) ->
    [{1, 495}, {4, 205}, {5, 180}, {6, 105}, {7, 90}];
get_base_attr({3, 1, 31}) ->
    [{1, 514}, {4, 213}, {5, 187}, {6, 109}, {7, 93}];
get_base_attr({3, 1, 32}) ->
    [{1, 533}, {4, 221}, {5, 194}, {6, 113}, {7, 96}];
get_base_attr({3, 1, 33}) ->
    [{1, 552}, {4, 229}, {5, 201}, {6, 117}, {7, 99}];
get_base_attr({3, 1, 34}) ->
    [{1, 571}, {4, 237}, {5, 208}, {6, 121}, {7, 102}];
get_base_attr({3, 1, 35}) ->
    [{1, 590}, {4, 245}, {5, 215}, {6, 125}, {7, 105}];
get_base_attr({3, 1, 36}) ->
    [{1, 609}, {4, 253}, {5, 222}, {6, 129}, {7, 108}];
get_base_attr({3, 1, 37}) ->
    [{1, 628}, {4, 261}, {5, 229}, {6, 133}, {7, 111}];
get_base_attr({3, 1, 38}) ->
    [{1, 647}, {4, 269}, {5, 236}, {6, 137}, {7, 114}];
get_base_attr({3, 1, 39}) ->
    [{1, 666}, {4, 277}, {5, 243}, {6, 141}, {7, 117}];
get_base_attr({3, 1, 40}) ->
    [{1, 685}, {4, 285}, {5, 250}, {6, 145}, {7, 120}];
get_base_attr({3, 1, 41}) ->
    [{1, 704}, {4, 293}, {5, 257}, {6, 149}, {7, 123}];
get_base_attr({3, 1, 42}) ->
    [{1, 723}, {4, 301}, {5, 264}, {6, 153}, {7, 126}];
get_base_attr({3, 1, 43}) ->
    [{1, 742}, {4, 309}, {5, 271}, {6, 157}, {7, 129}];
get_base_attr({3, 1, 44}) ->
    [{1, 761}, {4, 317}, {5, 278}, {6, 161}, {7, 132}];
get_base_attr({3, 1, 45}) ->
    [{1, 780}, {4, 325}, {5, 285}, {6, 165}, {7, 135}];
get_base_attr({3, 2, 1}) ->
    [{1, 14}, {4, 6}, {5, 5}, {6, 3}, {7, 3}];
get_base_attr({3, 2, 2}) ->
    [{1, 28}, {4, 12}, {5, 10}, {6, 6}, {7, 6}];
get_base_attr({3, 2, 3}) ->
    [{1, 42}, {4, 18}, {5, 15}, {6, 9}, {7, 9}];
get_base_attr({3, 2, 4}) ->
    [{1, 56}, {4, 24}, {5, 20}, {6, 12}, {7, 12}];
get_base_attr({3, 2, 5}) ->
    [{1, 70}, {4, 30}, {5, 25}, {6, 15}, {7, 15}];
get_base_attr({3, 2, 6}) ->
    [{1, 85}, {4, 36}, {5, 31}, {6, 18}, {7, 18}];
get_base_attr({3, 2, 7}) ->
    [{1, 100}, {4, 42}, {5, 37}, {6, 21}, {7, 21}];
get_base_attr({3, 2, 8}) ->
    [{1, 115}, {4, 48}, {5, 43}, {6, 24}, {7, 24}];
get_base_attr({3, 2, 9}) ->
    [{1, 130}, {4, 54}, {5, 49}, {6, 27}, {7, 27}];
get_base_attr({3, 2, 10}) ->
    [{1, 145}, {4, 60}, {5, 55}, {6, 30}, {7, 30}];
get_base_attr({3, 2, 11}) ->
    [{1, 161}, {4, 67}, {5, 61}, {6, 33}, {7, 33}];
get_base_attr({3, 2, 12}) ->
    [{1, 177}, {4, 74}, {5, 67}, {6, 36}, {7, 36}];
get_base_attr({3, 2, 13}) ->
    [{1, 193}, {4, 81}, {5, 73}, {6, 39}, {7, 39}];
get_base_attr({3, 2, 14}) ->
    [{1, 209}, {4, 88}, {5, 79}, {6, 42}, {7, 42}];
get_base_attr({3, 2, 15}) ->
    [{1, 225}, {4, 95}, {5, 85}, {6, 45}, {7, 45}];
get_base_attr({3, 2, 16}) ->
    [{1, 242}, {4, 102}, {5, 91}, {6, 49}, {7, 48}];
get_base_attr({3, 2, 17}) ->
    [{1, 259}, {4, 109}, {5, 97}, {6, 53}, {7, 51}];
get_base_attr({3, 2, 18}) ->
    [{1, 276}, {4, 116}, {5, 103}, {6, 57}, {7, 54}];
get_base_attr({3, 2, 19}) ->
    [{1, 293}, {4, 123}, {5, 109}, {6, 61}, {7, 57}];
get_base_attr({3, 2, 20}) ->
    [{1, 310}, {4, 130}, {5, 115}, {6, 65}, {7, 60}];
get_base_attr({3, 2, 21}) ->
    [{1, 328}, {4, 137}, {5, 121}, {6, 69}, {7, 63}];
get_base_attr({3, 2, 22}) ->
    [{1, 346}, {4, 144}, {5, 127}, {6, 73}, {7, 66}];
get_base_attr({3, 2, 23}) ->
    [{1, 364}, {4, 151}, {5, 133}, {6, 77}, {7, 69}];
get_base_attr({3, 2, 24}) ->
    [{1, 382}, {4, 158}, {5, 139}, {6, 81}, {7, 72}];
get_base_attr({3, 2, 25}) ->
    [{1, 400}, {4, 165}, {5, 145}, {6, 85}, {7, 75}];
get_base_attr({3, 2, 26}) ->
    [{1, 419}, {4, 173}, {5, 152}, {6, 89}, {7, 78}];
get_base_attr({3, 2, 27}) ->
    [{1, 438}, {4, 181}, {5, 159}, {6, 93}, {7, 81}];
get_base_attr({3, 2, 28}) ->
    [{1, 457}, {4, 189}, {5, 166}, {6, 97}, {7, 84}];
get_base_attr({3, 2, 29}) ->
    [{1, 476}, {4, 197}, {5, 173}, {6, 101}, {7, 87}];
get_base_attr({3, 2, 30}) ->
    [{1, 495}, {4, 205}, {5, 180}, {6, 105}, {7, 90}];
get_base_attr({3, 2, 31}) ->
    [{1, 514}, {4, 213}, {5, 187}, {6, 109}, {7, 93}];
get_base_attr({3, 2, 32}) ->
    [{1, 533}, {4, 221}, {5, 194}, {6, 113}, {7, 96}];
get_base_attr({3, 2, 33}) ->
    [{1, 552}, {4, 229}, {5, 201}, {6, 117}, {7, 99}];
get_base_attr({3, 2, 34}) ->
    [{1, 571}, {4, 237}, {5, 208}, {6, 121}, {7, 102}];
get_base_attr({3, 2, 35}) ->
    [{1, 590}, {4, 245}, {5, 215}, {6, 125}, {7, 105}];
get_base_attr({3, 2, 36}) ->
    [{1, 609}, {4, 253}, {5, 222}, {6, 129}, {7, 108}];
get_base_attr({3, 2, 37}) ->
    [{1, 628}, {4, 261}, {5, 229}, {6, 133}, {7, 111}];
get_base_attr({3, 2, 38}) ->
    [{1, 647}, {4, 269}, {5, 236}, {6, 137}, {7, 114}];
get_base_attr({3, 2, 39}) ->
    [{1, 666}, {4, 277}, {5, 243}, {6, 141}, {7, 117}];
get_base_attr({3, 2, 40}) ->
    [{1, 685}, {4, 285}, {5, 250}, {6, 145}, {7, 120}];
get_base_attr({3, 2, 41}) ->
    [{1, 704}, {4, 293}, {5, 257}, {6, 149}, {7, 123}];
get_base_attr({3, 2, 42}) ->
    [{1, 723}, {4, 301}, {5, 264}, {6, 153}, {7, 126}];
get_base_attr({3, 2, 43}) ->
    [{1, 742}, {4, 309}, {5, 271}, {6, 157}, {7, 129}];
get_base_attr({3, 2, 44}) ->
    [{1, 761}, {4, 317}, {5, 278}, {6, 161}, {7, 132}];
get_base_attr({3, 2, 45}) ->
    [{1, 780}, {4, 325}, {5, 285}, {6, 165}, {7, 135}];
get_base_attr({3, 3, 1}) ->
    [{1, 14}, {4, 6}, {5, 5}, {6, 3}, {7, 3}];
get_base_attr({3, 3, 2}) ->
    [{1, 28}, {4, 12}, {5, 10}, {6, 6}, {7, 6}];
get_base_attr({3, 3, 3}) ->
    [{1, 42}, {4, 18}, {5, 15}, {6, 9}, {7, 9}];
get_base_attr({3, 3, 4}) ->
    [{1, 56}, {4, 24}, {5, 20}, {6, 12}, {7, 12}];
get_base_attr({3, 3, 5}) ->
    [{1, 70}, {4, 30}, {5, 25}, {6, 15}, {7, 15}];
get_base_attr({3, 3, 6}) ->
    [{1, 85}, {4, 36}, {5, 31}, {6, 18}, {7, 18}];
get_base_attr({3, 3, 7}) ->
    [{1, 100}, {4, 42}, {5, 37}, {6, 21}, {7, 21}];
get_base_attr({3, 3, 8}) ->
    [{1, 115}, {4, 48}, {5, 43}, {6, 24}, {7, 24}];
get_base_attr({3, 3, 9}) ->
    [{1, 130}, {4, 54}, {5, 49}, {6, 27}, {7, 27}];
get_base_attr({3, 3, 10}) ->
    [{1, 145}, {4, 60}, {5, 55}, {6, 30}, {7, 30}];
get_base_attr({3, 3, 11}) ->
    [{1, 161}, {4, 67}, {5, 61}, {6, 33}, {7, 33}];
get_base_attr({3, 3, 12}) ->
    [{1, 177}, {4, 74}, {5, 67}, {6, 36}, {7, 36}];
get_base_attr({3, 3, 13}) ->
    [{1, 193}, {4, 81}, {5, 73}, {6, 39}, {7, 39}];
get_base_attr({3, 3, 14}) ->
    [{1, 209}, {4, 88}, {5, 79}, {6, 42}, {7, 42}];
get_base_attr({3, 3, 15}) ->
    [{1, 225}, {4, 95}, {5, 85}, {6, 45}, {7, 45}];
get_base_attr({3, 3, 16}) ->
    [{1, 242}, {4, 102}, {5, 91}, {6, 49}, {7, 48}];
get_base_attr({3, 3, 17}) ->
    [{1, 259}, {4, 109}, {5, 97}, {6, 53}, {7, 51}];
get_base_attr({3, 3, 18}) ->
    [{1, 276}, {4, 116}, {5, 103}, {6, 57}, {7, 54}];
get_base_attr({3, 3, 19}) ->
    [{1, 293}, {4, 123}, {5, 109}, {6, 61}, {7, 57}];
get_base_attr({3, 3, 20}) ->
    [{1, 310}, {4, 130}, {5, 115}, {6, 65}, {7, 60}];
get_base_attr({3, 3, 21}) ->
    [{1, 328}, {4, 137}, {5, 121}, {6, 69}, {7, 63}];
get_base_attr({3, 3, 22}) ->
    [{1, 346}, {4, 144}, {5, 127}, {6, 73}, {7, 66}];
get_base_attr({3, 3, 23}) ->
    [{1, 364}, {4, 151}, {5, 133}, {6, 77}, {7, 69}];
get_base_attr({3, 3, 24}) ->
    [{1, 382}, {4, 158}, {5, 139}, {6, 81}, {7, 72}];
get_base_attr({3, 3, 25}) ->
    [{1, 400}, {4, 165}, {5, 145}, {6, 85}, {7, 75}];
get_base_attr({3, 3, 26}) ->
    [{1, 419}, {4, 173}, {5, 152}, {6, 89}, {7, 78}];
get_base_attr({3, 3, 27}) ->
    [{1, 438}, {4, 181}, {5, 159}, {6, 93}, {7, 81}];
get_base_attr({3, 3, 28}) ->
    [{1, 457}, {4, 189}, {5, 166}, {6, 97}, {7, 84}];
get_base_attr({3, 3, 29}) ->
    [{1, 476}, {4, 197}, {5, 173}, {6, 101}, {7, 87}];
get_base_attr({3, 3, 30}) ->
    [{1, 495}, {4, 205}, {5, 180}, {6, 105}, {7, 90}];
get_base_attr({3, 3, 31}) ->
    [{1, 514}, {4, 213}, {5, 187}, {6, 109}, {7, 93}];
get_base_attr({3, 3, 32}) ->
    [{1, 533}, {4, 221}, {5, 194}, {6, 113}, {7, 96}];
get_base_attr({3, 3, 33}) ->
    [{1, 552}, {4, 229}, {5, 201}, {6, 117}, {7, 99}];
get_base_attr({3, 3, 34}) ->
    [{1, 571}, {4, 237}, {5, 208}, {6, 121}, {7, 102}];
get_base_attr({3, 3, 35}) ->
    [{1, 590}, {4, 245}, {5, 215}, {6, 125}, {7, 105}];
get_base_attr({3, 3, 36}) ->
    [{1, 609}, {4, 253}, {5, 222}, {6, 129}, {7, 108}];
get_base_attr({3, 3, 37}) ->
    [{1, 628}, {4, 261}, {5, 229}, {6, 133}, {7, 111}];
get_base_attr({3, 3, 38}) ->
    [{1, 647}, {4, 269}, {5, 236}, {6, 137}, {7, 114}];
get_base_attr({3, 3, 39}) ->
    [{1, 666}, {4, 277}, {5, 243}, {6, 141}, {7, 117}];
get_base_attr({3, 3, 40}) ->
    [{1, 685}, {4, 285}, {5, 250}, {6, 145}, {7, 120}];
get_base_attr({3, 3, 41}) ->
    [{1, 704}, {4, 293}, {5, 257}, {6, 149}, {7, 123}];
get_base_attr({3, 3, 42}) ->
    [{1, 723}, {4, 301}, {5, 264}, {6, 153}, {7, 126}];
get_base_attr({3, 3, 43}) ->
    [{1, 742}, {4, 309}, {5, 271}, {6, 157}, {7, 129}];
get_base_attr({3, 3, 44}) ->
    [{1, 761}, {4, 317}, {5, 278}, {6, 161}, {7, 132}];
get_base_attr({3, 3, 45}) ->
    [{1, 780}, {4, 325}, {5, 285}, {6, 165}, {7, 135}];
get_base_attr({3, 4, 1}) ->
    [{1, 14}, {4, 6}, {5, 5}, {6, 3}, {7, 3}];
get_base_attr({3, 4, 2}) ->
    [{1, 28}, {4, 12}, {5, 10}, {6, 6}, {7, 6}];
get_base_attr({3, 4, 3}) ->
    [{1, 42}, {4, 18}, {5, 15}, {6, 9}, {7, 9}];
get_base_attr({3, 4, 4}) ->
    [{1, 56}, {4, 24}, {5, 20}, {6, 12}, {7, 12}];
get_base_attr({3, 4, 5}) ->
    [{1, 70}, {4, 30}, {5, 25}, {6, 15}, {7, 15}];
get_base_attr({3, 4, 6}) ->
    [{1, 85}, {4, 36}, {5, 31}, {6, 18}, {7, 18}];
get_base_attr({3, 4, 7}) ->
    [{1, 100}, {4, 42}, {5, 37}, {6, 21}, {7, 21}];
get_base_attr({3, 4, 8}) ->
    [{1, 115}, {4, 48}, {5, 43}, {6, 24}, {7, 24}];
get_base_attr({3, 4, 9}) ->
    [{1, 130}, {4, 54}, {5, 49}, {6, 27}, {7, 27}];
get_base_attr({3, 4, 10}) ->
    [{1, 145}, {4, 60}, {5, 55}, {6, 30}, {7, 30}];
get_base_attr({3, 4, 11}) ->
    [{1, 161}, {4, 67}, {5, 61}, {6, 33}, {7, 33}];
get_base_attr({3, 4, 12}) ->
    [{1, 177}, {4, 74}, {5, 67}, {6, 36}, {7, 36}];
get_base_attr({3, 4, 13}) ->
    [{1, 193}, {4, 81}, {5, 73}, {6, 39}, {7, 39}];
get_base_attr({3, 4, 14}) ->
    [{1, 209}, {4, 88}, {5, 79}, {6, 42}, {7, 42}];
get_base_attr({3, 4, 15}) ->
    [{1, 225}, {4, 95}, {5, 85}, {6, 45}, {7, 45}];
get_base_attr({3, 4, 16}) ->
    [{1, 242}, {4, 102}, {5, 91}, {6, 49}, {7, 48}];
get_base_attr({3, 4, 17}) ->
    [{1, 259}, {4, 109}, {5, 97}, {6, 53}, {7, 51}];
get_base_attr({3, 4, 18}) ->
    [{1, 276}, {4, 116}, {5, 103}, {6, 57}, {7, 54}];
get_base_attr({3, 4, 19}) ->
    [{1, 293}, {4, 123}, {5, 109}, {6, 61}, {7, 57}];
get_base_attr({3, 4, 20}) ->
    [{1, 310}, {4, 130}, {5, 115}, {6, 65}, {7, 60}];
get_base_attr({3, 4, 21}) ->
    [{1, 328}, {4, 137}, {5, 121}, {6, 69}, {7, 63}];
get_base_attr({3, 4, 22}) ->
    [{1, 346}, {4, 144}, {5, 127}, {6, 73}, {7, 66}];
get_base_attr({3, 4, 23}) ->
    [{1, 364}, {4, 151}, {5, 133}, {6, 77}, {7, 69}];
get_base_attr({3, 4, 24}) ->
    [{1, 382}, {4, 158}, {5, 139}, {6, 81}, {7, 72}];
get_base_attr({3, 4, 25}) ->
    [{1, 400}, {4, 165}, {5, 145}, {6, 85}, {7, 75}];
get_base_attr({3, 4, 26}) ->
    [{1, 419}, {4, 173}, {5, 152}, {6, 89}, {7, 78}];
get_base_attr({3, 4, 27}) ->
    [{1, 438}, {4, 181}, {5, 159}, {6, 93}, {7, 81}];
get_base_attr({3, 4, 28}) ->
    [{1, 457}, {4, 189}, {5, 166}, {6, 97}, {7, 84}];
get_base_attr({3, 4, 29}) ->
    [{1, 476}, {4, 197}, {5, 173}, {6, 101}, {7, 87}];
get_base_attr({3, 4, 30}) ->
    [{1, 495}, {4, 205}, {5, 180}, {6, 105}, {7, 90}];
get_base_attr({3, 4, 31}) ->
    [{1, 514}, {4, 213}, {5, 187}, {6, 109}, {7, 93}];
get_base_attr({3, 4, 32}) ->
    [{1, 533}, {4, 221}, {5, 194}, {6, 113}, {7, 96}];
get_base_attr({3, 4, 33}) ->
    [{1, 552}, {4, 229}, {5, 201}, {6, 117}, {7, 99}];
get_base_attr({3, 4, 34}) ->
    [{1, 571}, {4, 237}, {5, 208}, {6, 121}, {7, 102}];
get_base_attr({3, 4, 35}) ->
    [{1, 590}, {4, 245}, {5, 215}, {6, 125}, {7, 105}];
get_base_attr({3, 4, 36}) ->
    [{1, 609}, {4, 253}, {5, 222}, {6, 129}, {7, 108}];
get_base_attr({3, 4, 37}) ->
    [{1, 628}, {4, 261}, {5, 229}, {6, 133}, {7, 111}];
get_base_attr({3, 4, 38}) ->
    [{1, 647}, {4, 269}, {5, 236}, {6, 137}, {7, 114}];
get_base_attr({3, 4, 39}) ->
    [{1, 666}, {4, 277}, {5, 243}, {6, 141}, {7, 117}];
get_base_attr({3, 4, 40}) ->
    [{1, 685}, {4, 285}, {5, 250}, {6, 145}, {7, 120}];
get_base_attr({3, 4, 41}) ->
    [{1, 704}, {4, 293}, {5, 257}, {6, 149}, {7, 123}];
get_base_attr({3, 4, 42}) ->
    [{1, 723}, {4, 301}, {5, 264}, {6, 153}, {7, 126}];
get_base_attr({3, 4, 43}) ->
    [{1, 742}, {4, 309}, {5, 271}, {6, 157}, {7, 129}];
get_base_attr({3, 4, 44}) ->
    [{1, 761}, {4, 317}, {5, 278}, {6, 161}, {7, 132}];
get_base_attr({3, 4, 45}) ->
    [{1, 780}, {4, 325}, {5, 285}, {6, 165}, {7, 135}];
get_base_attr({3, 5, 1}) ->
    [{1, 14}, {4, 6}, {5, 5}, {6, 3}, {7, 3}];
get_base_attr({3, 5, 2}) ->
    [{1, 28}, {4, 12}, {5, 10}, {6, 6}, {7, 6}];
get_base_attr({3, 5, 3}) ->
    [{1, 42}, {4, 18}, {5, 15}, {6, 9}, {7, 9}];
get_base_attr({3, 5, 4}) ->
    [{1, 56}, {4, 24}, {5, 20}, {6, 12}, {7, 12}];
get_base_attr({3, 5, 5}) ->
    [{1, 70}, {4, 30}, {5, 25}, {6, 15}, {7, 15}];
get_base_attr({3, 5, 6}) ->
    [{1, 85}, {4, 36}, {5, 31}, {6, 18}, {7, 18}];
get_base_attr({3, 5, 7}) ->
    [{1, 100}, {4, 42}, {5, 37}, {6, 21}, {7, 21}];
get_base_attr({3, 5, 8}) ->
    [{1, 115}, {4, 48}, {5, 43}, {6, 24}, {7, 24}];
get_base_attr({3, 5, 9}) ->
    [{1, 130}, {4, 54}, {5, 49}, {6, 27}, {7, 27}];
get_base_attr({3, 5, 10}) ->
    [{1, 145}, {4, 60}, {5, 55}, {6, 30}, {7, 30}];
get_base_attr({3, 5, 11}) ->
    [{1, 161}, {4, 67}, {5, 61}, {6, 33}, {7, 33}];
get_base_attr({3, 5, 12}) ->
    [{1, 177}, {4, 74}, {5, 67}, {6, 36}, {7, 36}];
get_base_attr({3, 5, 13}) ->
    [{1, 193}, {4, 81}, {5, 73}, {6, 39}, {7, 39}];
get_base_attr({3, 5, 14}) ->
    [{1, 209}, {4, 88}, {5, 79}, {6, 42}, {7, 42}];
get_base_attr({3, 5, 15}) ->
    [{1, 225}, {4, 95}, {5, 85}, {6, 45}, {7, 45}];
get_base_attr({3, 5, 16}) ->
    [{1, 242}, {4, 102}, {5, 91}, {6, 49}, {7, 48}];
get_base_attr({3, 5, 17}) ->
    [{1, 259}, {4, 109}, {5, 97}, {6, 53}, {7, 51}];
get_base_attr({3, 5, 18}) ->
    [{1, 276}, {4, 116}, {5, 103}, {6, 57}, {7, 54}];
get_base_attr({3, 5, 19}) ->
    [{1, 293}, {4, 123}, {5, 109}, {6, 61}, {7, 57}];
get_base_attr({3, 5, 20}) ->
    [{1, 310}, {4, 130}, {5, 115}, {6, 65}, {7, 60}];
get_base_attr({3, 5, 21}) ->
    [{1, 328}, {4, 137}, {5, 121}, {6, 69}, {7, 63}];
get_base_attr({3, 5, 22}) ->
    [{1, 346}, {4, 144}, {5, 127}, {6, 73}, {7, 66}];
get_base_attr({3, 5, 23}) ->
    [{1, 364}, {4, 151}, {5, 133}, {6, 77}, {7, 69}];
get_base_attr({3, 5, 24}) ->
    [{1, 382}, {4, 158}, {5, 139}, {6, 81}, {7, 72}];
get_base_attr({3, 5, 25}) ->
    [{1, 400}, {4, 165}, {5, 145}, {6, 85}, {7, 75}];
get_base_attr({3, 5, 26}) ->
    [{1, 419}, {4, 173}, {5, 152}, {6, 89}, {7, 78}];
get_base_attr({3, 5, 27}) ->
    [{1, 438}, {4, 181}, {5, 159}, {6, 93}, {7, 81}];
get_base_attr({3, 5, 28}) ->
    [{1, 457}, {4, 189}, {5, 166}, {6, 97}, {7, 84}];
get_base_attr({3, 5, 29}) ->
    [{1, 476}, {4, 197}, {5, 173}, {6, 101}, {7, 87}];
get_base_attr({3, 5, 30}) ->
    [{1, 495}, {4, 205}, {5, 180}, {6, 105}, {7, 90}];
get_base_attr({3, 5, 31}) ->
    [{1, 514}, {4, 213}, {5, 187}, {6, 109}, {7, 93}];
get_base_attr({3, 5, 32}) ->
    [{1, 533}, {4, 221}, {5, 194}, {6, 113}, {7, 96}];
get_base_attr({3, 5, 33}) ->
    [{1, 552}, {4, 229}, {5, 201}, {6, 117}, {7, 99}];
get_base_attr({3, 5, 34}) ->
    [{1, 571}, {4, 237}, {5, 208}, {6, 121}, {7, 102}];
get_base_attr({3, 5, 35}) ->
    [{1, 590}, {4, 245}, {5, 215}, {6, 125}, {7, 105}];
get_base_attr({3, 5, 36}) ->
    [{1, 609}, {4, 253}, {5, 222}, {6, 129}, {7, 108}];
get_base_attr({3, 5, 37}) ->
    [{1, 628}, {4, 261}, {5, 229}, {6, 133}, {7, 111}];
get_base_attr({3, 5, 38}) ->
    [{1, 647}, {4, 269}, {5, 236}, {6, 137}, {7, 114}];
get_base_attr({3, 5, 39}) ->
    [{1, 666}, {4, 277}, {5, 243}, {6, 141}, {7, 117}];
get_base_attr({3, 5, 40}) ->
    [{1, 685}, {4, 285}, {5, 250}, {6, 145}, {7, 120}];
get_base_attr({3, 5, 41}) ->
    [{1, 704}, {4, 293}, {5, 257}, {6, 149}, {7, 123}];
get_base_attr({3, 5, 42}) ->
    [{1, 723}, {4, 301}, {5, 264}, {6, 153}, {7, 126}];
get_base_attr({3, 5, 43}) ->
    [{1, 742}, {4, 309}, {5, 271}, {6, 157}, {7, 129}];
get_base_attr({3, 5, 44}) ->
    [{1, 761}, {4, 317}, {5, 278}, {6, 161}, {7, 132}];
get_base_attr({3, 5, 45}) ->
    [{1, 780}, {4, 325}, {5, 285}, {6, 165}, {7, 135}];
get_base_attr({3, 6, 1}) ->
    [{1, 14}, {4, 6}, {5, 5}, {6, 3}, {7, 3}];
get_base_attr({3, 6, 2}) ->
    [{1, 28}, {4, 12}, {5, 10}, {6, 6}, {7, 6}];
get_base_attr({3, 6, 3}) ->
    [{1, 42}, {4, 18}, {5, 15}, {6, 9}, {7, 9}];
get_base_attr({3, 6, 4}) ->
    [{1, 56}, {4, 24}, {5, 20}, {6, 12}, {7, 12}];
get_base_attr({3, 6, 5}) ->
    [{1, 70}, {4, 30}, {5, 25}, {6, 15}, {7, 15}];
get_base_attr({3, 6, 6}) ->
    [{1, 85}, {4, 36}, {5, 31}, {6, 18}, {7, 18}];
get_base_attr({3, 6, 7}) ->
    [{1, 100}, {4, 42}, {5, 37}, {6, 21}, {7, 21}];
get_base_attr({3, 6, 8}) ->
    [{1, 115}, {4, 48}, {5, 43}, {6, 24}, {7, 24}];
get_base_attr({3, 6, 9}) ->
    [{1, 130}, {4, 54}, {5, 49}, {6, 27}, {7, 27}];
get_base_attr({3, 6, 10}) ->
    [{1, 145}, {4, 60}, {5, 55}, {6, 30}, {7, 30}];
get_base_attr({3, 6, 11}) ->
    [{1, 161}, {4, 67}, {5, 61}, {6, 33}, {7, 33}];
get_base_attr({3, 6, 12}) ->
    [{1, 177}, {4, 74}, {5, 67}, {6, 36}, {7, 36}];
get_base_attr({3, 6, 13}) ->
    [{1, 193}, {4, 81}, {5, 73}, {6, 39}, {7, 39}];
get_base_attr({3, 6, 14}) ->
    [{1, 209}, {4, 88}, {5, 79}, {6, 42}, {7, 42}];
get_base_attr({3, 6, 15}) ->
    [{1, 225}, {4, 95}, {5, 85}, {6, 45}, {7, 45}];
get_base_attr({3, 6, 16}) ->
    [{1, 242}, {4, 102}, {5, 91}, {6, 49}, {7, 48}];
get_base_attr({3, 6, 17}) ->
    [{1, 259}, {4, 109}, {5, 97}, {6, 53}, {7, 51}];
get_base_attr({3, 6, 18}) ->
    [{1, 276}, {4, 116}, {5, 103}, {6, 57}, {7, 54}];
get_base_attr({3, 6, 19}) ->
    [{1, 293}, {4, 123}, {5, 109}, {6, 61}, {7, 57}];
get_base_attr({3, 6, 20}) ->
    [{1, 310}, {4, 130}, {5, 115}, {6, 65}, {7, 60}];
get_base_attr({3, 6, 21}) ->
    [{1, 328}, {4, 137}, {5, 121}, {6, 69}, {7, 63}];
get_base_attr({3, 6, 22}) ->
    [{1, 346}, {4, 144}, {5, 127}, {6, 73}, {7, 66}];
get_base_attr({3, 6, 23}) ->
    [{1, 364}, {4, 151}, {5, 133}, {6, 77}, {7, 69}];
get_base_attr({3, 6, 24}) ->
    [{1, 382}, {4, 158}, {5, 139}, {6, 81}, {7, 72}];
get_base_attr({3, 6, 25}) ->
    [{1, 400}, {4, 165}, {5, 145}, {6, 85}, {7, 75}];
get_base_attr({3, 6, 26}) ->
    [{1, 419}, {4, 173}, {5, 152}, {6, 89}, {7, 78}];
get_base_attr({3, 6, 27}) ->
    [{1, 438}, {4, 181}, {5, 159}, {6, 93}, {7, 81}];
get_base_attr({3, 6, 28}) ->
    [{1, 457}, {4, 189}, {5, 166}, {6, 97}, {7, 84}];
get_base_attr({3, 6, 29}) ->
    [{1, 476}, {4, 197}, {5, 173}, {6, 101}, {7, 87}];
get_base_attr({3, 6, 30}) ->
    [{1, 495}, {4, 205}, {5, 180}, {6, 105}, {7, 90}];
get_base_attr({3, 6, 31}) ->
    [{1, 514}, {4, 213}, {5, 187}, {6, 109}, {7, 93}];
get_base_attr({3, 6, 32}) ->
    [{1, 533}, {4, 221}, {5, 194}, {6, 113}, {7, 96}];
get_base_attr({3, 6, 33}) ->
    [{1, 552}, {4, 229}, {5, 201}, {6, 117}, {7, 99}];
get_base_attr({3, 6, 34}) ->
    [{1, 571}, {4, 237}, {5, 208}, {6, 121}, {7, 102}];
get_base_attr({3, 6, 35}) ->
    [{1, 590}, {4, 245}, {5, 215}, {6, 125}, {7, 105}];
get_base_attr({3, 6, 36}) ->
    [{1, 609}, {4, 253}, {5, 222}, {6, 129}, {7, 108}];
get_base_attr({3, 6, 37}) ->
    [{1, 628}, {4, 261}, {5, 229}, {6, 133}, {7, 111}];
get_base_attr({3, 6, 38}) ->
    [{1, 647}, {4, 269}, {5, 236}, {6, 137}, {7, 114}];
get_base_attr({3, 6, 39}) ->
    [{1, 666}, {4, 277}, {5, 243}, {6, 141}, {7, 117}];
get_base_attr({3, 6, 40}) ->
    [{1, 685}, {4, 285}, {5, 250}, {6, 145}, {7, 120}];
get_base_attr({3, 6, 41}) ->
    [{1, 704}, {4, 293}, {5, 257}, {6, 149}, {7, 123}];
get_base_attr({3, 6, 42}) ->
    [{1, 723}, {4, 301}, {5, 264}, {6, 153}, {7, 126}];
get_base_attr({3, 6, 43}) ->
    [{1, 742}, {4, 309}, {5, 271}, {6, 157}, {7, 129}];
get_base_attr({3, 6, 44}) ->
    [{1, 761}, {4, 317}, {5, 278}, {6, 161}, {7, 132}];
get_base_attr({3, 6, 45}) ->
    [{1, 780}, {4, 325}, {5, 285}, {6, 165}, {7, 135}];
get_base_attr({3, 7, 1}) ->
    [{1, 14}, {4, 6}, {5, 5}, {6, 3}, {7, 3}];
get_base_attr({3, 7, 2}) ->
    [{1, 28}, {4, 12}, {5, 10}, {6, 6}, {7, 6}];
get_base_attr({3, 7, 3}) ->
    [{1, 42}, {4, 18}, {5, 15}, {6, 9}, {7, 9}];
get_base_attr({3, 7, 4}) ->
    [{1, 56}, {4, 24}, {5, 20}, {6, 12}, {7, 12}];
get_base_attr({3, 7, 5}) ->
    [{1, 70}, {4, 30}, {5, 25}, {6, 15}, {7, 15}];
get_base_attr({3, 7, 6}) ->
    [{1, 85}, {4, 36}, {5, 31}, {6, 18}, {7, 18}];
get_base_attr({3, 7, 7}) ->
    [{1, 100}, {4, 42}, {5, 37}, {6, 21}, {7, 21}];
get_base_attr({3, 7, 8}) ->
    [{1, 115}, {4, 48}, {5, 43}, {6, 24}, {7, 24}];
get_base_attr({3, 7, 9}) ->
    [{1, 130}, {4, 54}, {5, 49}, {6, 27}, {7, 27}];
get_base_attr({3, 7, 10}) ->
    [{1, 145}, {4, 60}, {5, 55}, {6, 30}, {7, 30}];
get_base_attr({3, 7, 11}) ->
    [{1, 161}, {4, 67}, {5, 61}, {6, 33}, {7, 33}];
get_base_attr({3, 7, 12}) ->
    [{1, 177}, {4, 74}, {5, 67}, {6, 36}, {7, 36}];
get_base_attr({3, 7, 13}) ->
    [{1, 193}, {4, 81}, {5, 73}, {6, 39}, {7, 39}];
get_base_attr({3, 7, 14}) ->
    [{1, 209}, {4, 88}, {5, 79}, {6, 42}, {7, 42}];
get_base_attr({3, 7, 15}) ->
    [{1, 225}, {4, 95}, {5, 85}, {6, 45}, {7, 45}];
get_base_attr({3, 7, 16}) ->
    [{1, 242}, {4, 102}, {5, 91}, {6, 49}, {7, 48}];
get_base_attr({3, 7, 17}) ->
    [{1, 259}, {4, 109}, {5, 97}, {6, 53}, {7, 51}];
get_base_attr({3, 7, 18}) ->
    [{1, 276}, {4, 116}, {5, 103}, {6, 57}, {7, 54}];
get_base_attr({3, 7, 19}) ->
    [{1, 293}, {4, 123}, {5, 109}, {6, 61}, {7, 57}];
get_base_attr({3, 7, 20}) ->
    [{1, 310}, {4, 130}, {5, 115}, {6, 65}, {7, 60}];
get_base_attr({3, 7, 21}) ->
    [{1, 328}, {4, 137}, {5, 121}, {6, 69}, {7, 63}];
get_base_attr({3, 7, 22}) ->
    [{1, 346}, {4, 144}, {5, 127}, {6, 73}, {7, 66}];
get_base_attr({3, 7, 23}) ->
    [{1, 364}, {4, 151}, {5, 133}, {6, 77}, {7, 69}];
get_base_attr({3, 7, 24}) ->
    [{1, 382}, {4, 158}, {5, 139}, {6, 81}, {7, 72}];
get_base_attr({3, 7, 25}) ->
    [{1, 400}, {4, 165}, {5, 145}, {6, 85}, {7, 75}];
get_base_attr({3, 7, 26}) ->
    [{1, 419}, {4, 173}, {5, 152}, {6, 89}, {7, 78}];
get_base_attr({3, 7, 27}) ->
    [{1, 438}, {4, 181}, {5, 159}, {6, 93}, {7, 81}];
get_base_attr({3, 7, 28}) ->
    [{1, 457}, {4, 189}, {5, 166}, {6, 97}, {7, 84}];
get_base_attr({3, 7, 29}) ->
    [{1, 476}, {4, 197}, {5, 173}, {6, 101}, {7, 87}];
get_base_attr({3, 7, 30}) ->
    [{1, 495}, {4, 205}, {5, 180}, {6, 105}, {7, 90}];
get_base_attr({3, 7, 31}) ->
    [{1, 514}, {4, 213}, {5, 187}, {6, 109}, {7, 93}];
get_base_attr({3, 7, 32}) ->
    [{1, 533}, {4, 221}, {5, 194}, {6, 113}, {7, 96}];
get_base_attr({3, 7, 33}) ->
    [{1, 552}, {4, 229}, {5, 201}, {6, 117}, {7, 99}];
get_base_attr({3, 7, 34}) ->
    [{1, 571}, {4, 237}, {5, 208}, {6, 121}, {7, 102}];
get_base_attr({3, 7, 35}) ->
    [{1, 590}, {4, 245}, {5, 215}, {6, 125}, {7, 105}];
get_base_attr({3, 7, 36}) ->
    [{1, 609}, {4, 253}, {5, 222}, {6, 129}, {7, 108}];
get_base_attr({3, 7, 37}) ->
    [{1, 628}, {4, 261}, {5, 229}, {6, 133}, {7, 111}];
get_base_attr({3, 7, 38}) ->
    [{1, 647}, {4, 269}, {5, 236}, {6, 137}, {7, 114}];
get_base_attr({3, 7, 39}) ->
    [{1, 666}, {4, 277}, {5, 243}, {6, 141}, {7, 117}];
get_base_attr({3, 7, 40}) ->
    [{1, 685}, {4, 285}, {5, 250}, {6, 145}, {7, 120}];
get_base_attr({3, 7, 41}) ->
    [{1, 704}, {4, 293}, {5, 257}, {6, 149}, {7, 123}];
get_base_attr({3, 7, 42}) ->
    [{1, 723}, {4, 301}, {5, 264}, {6, 153}, {7, 126}];
get_base_attr({3, 7, 43}) ->
    [{1, 742}, {4, 309}, {5, 271}, {6, 157}, {7, 129}];
get_base_attr({3, 7, 44}) ->
    [{1, 761}, {4, 317}, {5, 278}, {6, 161}, {7, 132}];
get_base_attr({3, 7, 45}) ->
    [{1, 780}, {4, 325}, {5, 285}, {6, 165}, {7, 135}];
get_base_attr({100, 1, 1}) ->
    [{1, 62}, {4, 25}, {5, 20}, {43, 12}];
get_base_attr({100, 2, 1}) ->
    [{1, 62}, {4, 25}, {5, 20}, {43, 12}];
get_base_attr({100, 3, 1}) ->
    [{1, 62}, {4, 25}, {5, 20}, {43, 12}];
get_base_attr({100, 4, 1}) ->
    [{1, 62}, {4, 25}, {5, 20}, {43, 12}];
get_base_attr({100, 5, 1}) ->
    [{1, 62}, {4, 25}, {5, 20}, {43, 12}];
get_base_attr({100, 6, 1}) ->
    [{1, 62}, {4, 25}, {5, 20}, {43, 12}];
get_base_attr({100, 7, 1}) ->
    [{1, 62}, {4, 25}, {5, 20}, {43, 12}];
get_base_attr(_) -> [].

get_speed_attr(1011) -> [{12, 30}];
get_speed_attr(1012) -> [{12, 30}];
get_speed_attr(1021) -> [{12, 30}];
get_speed_attr(1022) -> [{12, 30}];
get_speed_attr(1031) -> [{12, 30}];
get_speed_attr(1032) -> [{12, 30}];
get_speed_attr(1041) -> [{12, 30}];
get_speed_attr(1042) -> [{12, 30}];
get_speed_attr(1051) -> [{12, 30}];
get_speed_attr(1052) -> [{12, 30}];
get_speed_attr(1061) -> [{12, 30}];
get_speed_attr(1062) -> [{12, 30}];
get_speed_attr(1071) -> [{12, 30}];
get_speed_attr(1072) -> [{12, 30}];
get_speed_attr(1101) -> [{12, 30}];
get_speed_attr(1102) -> [{12, 30}];
get_speed_attr(1103) -> [{12, 30}];
get_speed_attr(1104) -> [{12, 30}];
get_speed_attr(1105) -> [{12, 30}];
get_speed_attr(1106) -> [{12, 30}];
get_speed_attr(1107) -> [{12, 30}];
get_speed_attr(1108) -> [{12, 30}];
get_speed_attr(1111) -> [{12, 30}];
get_speed_attr(1112) -> [{12, 30}];
get_speed_attr(1113) -> [{12, 30}];
get_speed_attr(1114) -> [{12, 30}];
get_speed_attr(1115) -> [{12, 30}];
get_speed_attr(1116) -> [{12, 30}];
get_speed_attr(1117) -> [{12, 30}];
get_speed_attr(1118) -> [{12, 30}];
get_speed_attr(1201) -> [{12, 30}];
get_speed_attr(1202) -> [{12, 30}];
get_speed_attr(1203) -> [{12, 30}];
get_speed_attr(1204) -> [{12, 30}];
get_speed_attr(1205) -> [{12, 30}];
get_speed_attr(1206) -> [{12, 30}];
get_speed_attr(1207) -> [{12, 30}];
get_speed_attr(1208) -> [{12, 30}];
get_speed_attr(1300) -> [{12, 30}];
get_speed_attr(1301) -> [{12, 30}];
get_speed_attr(1302) -> [{12, 30}];
get_speed_attr(1303) -> [{12, 30}];
get_speed_attr(1304) -> [{12, 30}];
get_speed_attr(1305) -> [{12, 30}];
get_speed_attr(1306) -> [{12, 30}];
get_speed_attr(1310) -> [{12, 30}];
get_speed_attr(1311) -> [{12, 30}];
get_speed_attr(1312) -> [{12, 30}];
get_speed_attr(1313) -> [{12, 30}];
get_speed_attr(1314) -> [{12, 30}];
get_speed_attr(1315) -> [{12, 30}];
get_speed_attr(1316) -> [{12, 30}];
get_speed_attr(2000) -> [{12, 40}];
get_speed_attr(2001) -> [{12, 50}];
get_speed_attr(2002) -> [{12, 40}];
get_speed_attr(2003) -> [{12, 50}];
get_speed_attr(2004) -> [{12, 40}];
get_speed_attr(2005) -> [{12, 50}];
get_speed_attr(2006) -> [{12, 40}];
get_speed_attr(2007) -> [{12, 50}];
get_speed_attr(2008) -> [{12, 40}];
get_speed_attr(2009) -> [{12, 50}];
get_speed_attr(2010) -> [{12, 50}];
get_speed_attr(2011) -> [{12, 50}];
get_speed_attr(2012) -> [{12, 50}];
get_speed_attr(2013) -> [{12, 50}];
get_speed_attr(2014) -> [{12, 50}];
get_speed_attr(2015) -> [{12, 50}];
get_speed_attr(2016) -> [{12, 50}];
get_speed_attr(2017) -> [{12, 50}];
get_speed_attr(2018) -> [{12, 40}];
get_speed_attr(2019) -> [{12, 50}];
get_speed_attr(2021) -> [{12, 50}];
get_speed_attr(2020) -> [{12, 50}];
get_speed_attr(2023) -> [{12, 50}];
get_speed_attr(2024) -> [{12, 50}];
get_speed_attr(2025) -> [{12, 50}];
get_speed_attr(2026) -> [{12, 50}];
get_speed_attr(2027) -> [{12, 50}];
get_speed_attr(2028) -> [{12, 50}];
get_speed_attr(2029) -> [{12, 50}];
get_speed_attr(2030) -> [{12, 50}];
get_speed_attr(2031) -> [{12, 50}];
get_speed_attr(2032) -> [{12, 50}];
get_speed_attr(2033) -> [{12, 50}];
get_speed_attr(2034) -> [{12, 50}];
get_speed_attr(2035) -> [{12, 50}];
get_speed_attr(2036) -> [{12, 50}];
get_speed_attr(1998) -> [{12, 50}];
get_speed_attr(1999) -> [{12, 50}];
get_speed_attr(2038) -> [{12, 50}];
get_speed_attr(2039) -> [{12, 50}];
get_speed_attr(2040) -> [{12, 50}];
get_speed_attr(2041) -> [{12, 50}];
get_speed_attr(2042) -> [{12, 50}];
get_speed_attr(2043) -> [{12, 50}];
get_speed_attr(2044) -> [{12, 50}];
get_speed_attr(2045) -> [{12, 50}];
get_speed_attr(2046) -> [{12, 50}];
get_speed_attr(2047) -> [{12, 50}];
get_speed_attr(2048) -> [{12, 50}];
get_speed_attr(2049) -> [{12, 50}];
get_speed_attr(2050) -> [{12, 50}];
get_speed_attr(2052) -> [{12, 50}];
get_speed_attr(2051) -> [{12, 50}];
get_speed_attr(2053) -> [{12, 50}];
get_speed_attr(2054) -> [{12, 50}];
get_speed_attr(2055) -> [{12, 50}];
get_speed_attr(2056) -> [{12, 50}];
get_speed_attr(2057) -> [{12, 50}];
get_speed_attr(2058) -> [{12, 50}];
get_speed_attr(2059) -> [{12, 50}];
get_speed_attr(2060) -> [{12, 50}];
get_speed_attr(2061) -> [{12, 50}];
get_speed_attr(2062) -> [{12, 50}];
get_speed_attr(2063) -> [{12, 50}];
get_speed_attr(2064) -> [{12, 50}];
get_speed_attr(2065) -> [{12, 50}];
get_speed_attr(2066) -> [{12, 50}];
get_speed_attr(2067) -> [{12, 50}];
get_speed_attr(2068) -> [{12, 50}];
get_speed_attr(2069) -> [{12, 50}];
get_speed_attr(2070) -> [{12, 50}];
get_speed_attr(2071) -> [{12, 50}];
get_speed_attr(2072) -> [{12, 50}];
get_speed_attr(2073) -> [{12, 50}];
get_speed_attr(2074) -> [{12, 50}];
get_speed_attr(2075) -> [{12, 50}];
get_speed_attr(2076) -> [{12, 50}];
get_speed_attr(2077) -> [{12, 50}];
get_speed_attr(2078) -> [{12, 50}];
get_speed_attr(2079) -> [{12, 50}];
get_speed_attr(2080) -> [{12, 50}];
get_speed_attr(2081) -> [{12, 50}];
get_speed_attr(2082) -> [{12, 50}];
get_speed_attr(2083) -> [{12, 50}];
get_speed_attr(2084) -> [{12, 50}];
get_speed_attr(2085) -> [{12, 50}];
get_speed_attr(2086) -> [{12, 50}];
get_speed_attr(2087) -> [{12, 50}];
get_speed_attr(2088) -> [{12, 50}];
get_speed_attr(2089) -> [{12, 50}];
get_speed_attr(2090) -> [{12, 50}];
get_speed_attr(2091) -> [{12, 50}];
get_speed_attr(2092) -> [{12, 50}];
get_speed_attr(2093) -> [{12, 50}];
get_speed_attr(2094) -> [{12, 50}];
get_speed_attr(2095) -> [{12, 50}];
get_speed_attr(2096) -> [{12, 50}];
get_speed_attr(2097) -> [{12, 50}];
get_speed_attr(2098) -> [{12, 50}];
get_speed_attr(2099) -> [{12, 50}];
get_speed_attr(2100) -> [{12, 50}];
get_speed_attr(2101) -> [{12, 50}];
get_speed_attr(2102) -> [{12, 50}];
get_speed_attr(2103) -> [{12, 50}];
get_speed_attr(2104) -> [{12, 50}];
get_speed_attr(2105) -> [{12, 50}];
get_speed_attr(2106) -> [{12, 250}];
get_speed_attr(2107) -> [{12, 250}];
get_speed_attr(2108) -> [{12, 250}];
get_speed_attr(2109) -> [{12, 250}];
get_speed_attr(2110) -> [{12, 250}];
get_speed_attr(2111) -> [{12, 250}];
get_speed_attr(2112) -> [{12, 250}];
get_speed_attr(2113) -> [{12, 250}];
get_speed_attr(2114) -> [{12, 250}];
get_speed_attr(2115) -> [{12, 250}];
get_speed_attr(2116) -> [{12, 250}];
get_speed_attr(2117) -> [{12, 250}];
get_speed_attr(2118) -> [{12, 250}];
get_speed_attr(2119) -> [{12, 250}];
get_speed_attr(2120) -> [{12, 250}];
get_speed_attr(2121) -> [{12, 250}];
get_speed_attr(2122) -> [{12, 250}];
get_speed_attr(2123) -> [{12, 250}];
get_speed_attr(2124) -> [{12, 250}];
get_speed_attr(2125) -> [{12, 250}];
get_speed_attr(2126) -> [{12, 250}];
get_speed_attr(2127) -> [{12, 250}];
get_speed_attr(2128) -> [{12, 250}];
get_speed_attr(2129) -> [{12, 250}];
get_speed_attr(2130) -> [{12, 250}];
get_speed_attr(2131) -> [{12, 250}];
get_speed_attr(2132) -> [{12, 250}];
get_speed_attr(2133) -> [{12, 250}];
get_speed_attr(2134) -> [{12, 250}];
get_speed_attr(2135) -> [{12, 250}];
get_speed_attr(2136) -> [{12, 250}];
get_speed_attr(2137) -> [{12, 250}];
get_speed_attr(2138) -> [{12, 250}];
get_speed_attr(2139) -> [{12, 250}];
get_speed_attr(2140) -> [{12, 250}];
get_speed_attr(2141) -> [{12, 250}];
get_speed_attr(2142) -> [{12, 250}];
get_speed_attr(2143) -> [{12, 250}];
get_speed_attr(2144) -> [{12, 250}];
get_speed_attr(2145) -> [{12, 250}];
get_speed_attr(2146) -> [{12, 250}];
get_speed_attr(2147) -> [{12, 250}];
get_speed_attr(2148) -> [{12, 250}];
get_speed_attr(2149) -> [{12, 250}];
get_speed_attr(2150) -> [{12, 250}];
get_speed_attr(2151) -> [{12, 250}];
get_speed_attr(2152) -> [{12, 250}];
get_speed_attr(2153) -> [{12, 250}];
get_speed_attr(2154) -> [{12, 250}];
get_speed_attr(2155) -> [{12, 250}];
get_speed_attr(2156) -> [{12, 250}];
get_speed_attr(2157) -> [{12, 250}];
get_speed_attr(2158) -> [{12, 250}];
get_speed_attr(2159) -> [{12, 250}];
get_speed_attr(2164) -> [{12, 250}];
get_speed_attr(2165) -> [{12, 250}];
get_speed_attr(2166) -> [{12, 250}];
get_speed_attr(2167) -> [{12, 250}];
get_speed_attr(2168) -> [{12, 250}];
get_speed_attr(2169) -> [{12, 250}];
get_speed_attr(2170) -> [{12, 250}];
get_speed_attr(2171) -> [{12, 250}];
get_speed_attr(2172) -> [{12, 250}];
get_speed_attr(2173) -> [{12, 250}];
get_speed_attr(2174) -> [{12, 250}];
get_speed_attr(2175) -> [{12, 250}];
get_speed_attr(2176) -> [{12, 250}];
get_speed_attr(2177) -> [{12, 250}];
get_speed_attr(2178) -> [{12, 250}];
get_speed_attr(2179) -> [{12, 250}];
get_speed_attr(2180) -> [{12, 250}];
get_speed_attr(2181) -> [{12, 250}];
get_speed_attr(2182) -> [{12, 250}];
get_speed_attr(2183) -> [{12, 250}];
get_speed_attr(2184) -> [{12, 250}];
get_speed_attr(2185) -> [{12, 250}];
get_speed_attr(2186) -> [{12, 250}];
get_speed_attr(2187) -> [{12, 250}];
get_speed_attr(2188) -> [{12, 250}];
get_speed_attr(2189) -> [{12, 250}];
get_speed_attr(2191) -> [{12, 250}];
get_speed_attr(2192) -> [{12, 250}];
get_speed_attr(2193) -> [{12, 250}];
get_speed_attr(2197) -> [{12, 250}];
get_speed_attr(2198) -> [{12, 250}];
get_speed_attr(2199) -> [{12, 250}];
get_speed_attr(2200) -> [{12, 250}];
get_speed_attr(2201) -> [{12, 250}];
get_speed_attr(2206) -> [{12, 250}];
get_speed_attr(2207) -> [{12, 250}];
get_speed_attr(2208) -> [{12, 250}];
get_speed_attr(2209) -> [{12, 300}];
get_speed_attr(2210) -> [{12, 300}];
get_speed_attr(2211) -> [{12, 300}];
get_speed_attr(2212) -> [{12, 300}];
get_speed_attr(2213) -> [{12, 300}];
get_speed_attr(2214) -> [{12, 300}];
get_speed_attr(2215) -> [{12, 300}];
get_speed_attr(2216) -> [{12, 300}];
get_speed_attr(3094) -> [{12, 250}];
get_speed_attr(3095) -> [{12, 250}];
get_speed_attr(3096) -> [{12, 250}];
get_speed_attr(3097) -> [{12, 250}];
get_speed_attr(3098) -> [{12, 250}];
get_speed_attr(3099) -> [{12, 250}];
get_speed_attr(3100) -> [{12, 250}];
get_speed_attr(3101) -> [{12, 250}];
get_speed_attr(3102) -> [{12, 250}];
get_speed_attr(3229) -> [{12, 300}];
get_speed_attr(3230) -> [{12, 300}];
get_speed_attr(3231) -> [{12, 300}];
get_speed_attr(3232) -> [{12, 300}];
get_speed_attr(3233) -> [{12, 300}];
get_speed_attr(3234) -> [{12, 300}];
get_speed_attr(_) -> [].

get_incubate(FightTimes)
    when FightTimes >= 1 andalso FightTimes =< 499 ->
    0;
get_incubate(FightTimes)
    when FightTimes >= 500 andalso FightTimes =< 599 ->
    3;
get_incubate(FightTimes)
    when FightTimes >= 600 andalso FightTimes =< 699 ->
    6;
get_incubate(FightTimes)
    when FightTimes >= 700 andalso FightTimes =< 799 ->
    10;
get_incubate(FightTimes)
    when FightTimes >= 800 andalso FightTimes =< 849 ->
    50;
get_incubate(FightTimes)
    when FightTimes >= 850 andalso FightTimes =< 899 ->
    200;
get_incubate(FightTimes)
    when FightTimes >= 900 andalso FightTimes =< 970 ->
    1000;
get_incubate(FightTimes)
    when FightTimes >= 971 andalso FightTimes =< 999999 ->
    1000;
get_incubate(_) -> 10.

get_rand_skill({1, 0, 1}) ->
    [{85010, 200},
     {85020, 200},
     {85030, 300},
     {85040, 300}];
get_rand_skill({1, 0, 2}) ->
    [{85050, 280}, {85060, 280}, {85070, 290}];
get_rand_skill({1, 1, 2}) -> [{85110, 150}];
get_rand_skill({1, 2, 2}) -> [{85100, 150}];
get_rand_skill({1, 3, 2}) -> [{85111, 150}];
get_rand_skill({1, 4, 2}) -> [{85080, 150}];
get_rand_skill({1, 5, 2}) -> [{85090, 150}];
get_rand_skill({1, 6, 2}) -> [{85440, 150}];
get_rand_skill({1, 7, 2}) -> [{85800, 150}];
get_rand_skill({1, 0, 3}) ->
    [{85120, 280},
     {85130, 280},
     {85140, 280},
     {85150, 160}];
get_rand_skill({1, 0, 4}) ->
    [{85160, 350},
     {85170, 350},
     {85180, 150},
     {85190, 150}];
get_rand_skill({1, 0, 5}) ->
    [{85500, 280}, {85510, 280}, {85520, 290}];
get_rand_skill({1, 1, 5}) -> [{85530, 150}];
get_rand_skill({1, 2, 5}) -> [{85530, 150}];
get_rand_skill({1, 3, 5}) -> [{85530, 150}];
get_rand_skill({1, 6, 5}) -> [{85530, 150}];
get_rand_skill({1, 4, 5}) -> [{85540, 150}];
get_rand_skill({1, 5, 5}) -> [{85550, 150}];
get_rand_skill({1, 7, 5}) -> [{85810, 150}];
get_rand_skill({2, 0, 1}) ->
    [{85200, 200},
     {85210, 200},
     {85220, 300},
     {85230, 300}];
get_rand_skill({2, 0, 2}) ->
    [{85290, 300}, {85300, 300}, {85310, 300}];
get_rand_skill({2, 1, 2}) -> [{85240, 100}];
get_rand_skill({2, 2, 2}) -> [{85250, 100}];
get_rand_skill({2, 3, 2}) -> [{85260, 100}];
get_rand_skill({2, 4, 2}) -> [{85270, 100}];
get_rand_skill({2, 5, 2}) -> [{85280, 100}];
get_rand_skill({2, 6, 2}) -> [{85450, 100}];
get_rand_skill({2, 7, 2}) -> [{85240, 100}];
get_rand_skill({2, 0, 3}) ->
    [{85320, 280},
     {85330, 280},
     {85340, 280},
     {85350, 160}];
get_rand_skill({2, 0, 4}) ->
    [{85360, 350},
     {85370, 350},
     {85380, 150},
     {85390, 150}];
get_rand_skill({2, 0, 5}) ->
    [{85400, 150},
     {85410, 150},
     {85420, 150},
     {85430, 350}];
get_rand_skill({3, 0, 1}) ->
    [{85650, 200}, {85660, 200}, {85670, 200}];
get_rand_skill({3, 0, 2}) ->
    [{85680, 300}, {85690, 300}, {85700, 300}];
get_rand_skill({3, 0, 3}) ->
    [{85710, 300}, {85720, 300}, {85730, 300}];
get_rand_skill({3, 0, 4}) ->
    [{85740, 300}, {85750, 300}, {85760, 300}];
get_rand_skill({3, 0, 5}) ->
    [{85770, 300}, {85780, 300}, {85790, 300}];
get_rand_skill(_) -> [].

get_skill_info(1) ->
    #{point => 2, mount_lev => 3, cost => [{23550, 1}]};
get_skill_info(2) ->
    #{point => 2, mount_lev => 5, cost => [{23550, 2}]};
get_skill_info(3) ->
    #{point => 2, mount_lev => 10, cost => [{23550, 3}]};
get_skill_info(4) ->
    #{point => 3, mount_lev => 15, cost => [{23550, 5}]};
get_skill_info(5) ->
    #{point => 3, mount_lev => 20, cost => [{23550, 8}]};
get_skill_info(_) -> false.

get_aptitude({1, 1}) -> [{1, 0}, {2, 950}, {3, 50}];
get_aptitude({1, 2}) ->
    [{1, 550}, {2, 0}, {3, 400}, {4, 50}];
get_aptitude({1, 3}) ->
    [{2, 610}, {3, 0}, {4, 350}, {5, 40}];
get_aptitude({1, 4}) ->
    [{3, 670}, {4, 0}, {5, 300}, {6, 30}];
get_aptitude({1, 5}) -> [{4, 750}, {5, 0}, {6, 250}];
get_aptitude({2, 1}) -> [{1, 0}, {2, 950}, {3, 50}];
get_aptitude({2, 2}) ->
    [{1, 550}, {2, 0}, {3, 400}, {4, 50}];
get_aptitude({2, 3}) ->
    [{2, 610}, {3, 0}, {4, 350}, {5, 40}];
get_aptitude({2, 4}) ->
    [{3, 670}, {4, 0}, {5, 300}, {6, 30}];
get_aptitude({2, 5}) -> [{4, 750}, {5, 0}, {6, 250}];
get_aptitude({3, 1}) -> [{1, 0}, {2, 950}, {3, 50}];
get_aptitude({3, 2}) ->
    [{1, 550}, {2, 0}, {3, 400}, {4, 50}];
get_aptitude({3, 3}) ->
    [{2, 610}, {3, 0}, {4, 350}, {5, 40}];
get_aptitude({3, 4}) ->
    [{3, 670}, {4, 0}, {5, 300}, {6, 30}];
get_aptitude({3, 5}) -> [{4, 750}, {5, 0}, {6, 250}];
get_aptitude(_) -> [].

get_aptitude_cost({1, 1}) -> [{23554, 2}];
get_aptitude_cost({1, 2}) -> [{23554, 3}];
get_aptitude_cost({1, 3}) -> [{23554, 3}];
get_aptitude_cost({1, 4}) -> [{23554, 5}];
get_aptitude_cost({1, 5}) -> [{23554, 5}];
get_aptitude_cost({2, 1}) -> [{23554, 3}];
get_aptitude_cost({2, 2}) -> [{23554, 5}];
get_aptitude_cost({2, 3}) -> [{23554, 5}];
get_aptitude_cost({2, 4}) -> [{23554, 6}];
get_aptitude_cost({2, 5}) -> [{23554, 8}];
get_aptitude_cost({3, 1}) -> [{23554, 3}];
get_aptitude_cost({3, 2}) -> [{23554, 5}];
get_aptitude_cost({3, 3}) -> [{23554, 5}];
get_aptitude_cost({3, 4}) -> [{23554, 6}];
get_aptitude_cost({3, 5}) -> [{23554, 8}];
get_aptitude_cost(_) -> false.

get_decorate(1) ->
    #{base_id => 1, mount_base_id => 1011, type => 1,
      item_id => 23551, day_spirit => 30, appearance => 1012};
get_decorate(2) ->
    #{base_id => 2, mount_base_id => 1021, type => 1,
      item_id => 23551, day_spirit => 30, appearance => 1022};
get_decorate(3) ->
    #{base_id => 3, mount_base_id => 1031, type => 1,
      item_id => 23551, day_spirit => 30, appearance => 1032};
get_decorate(4) ->
    #{base_id => 4, mount_base_id => 1041, type => 1,
      item_id => 23551, day_spirit => 30, appearance => 1042};
get_decorate(5) ->
    #{base_id => 5, mount_base_id => 1051, type => 1,
      item_id => 23551, day_spirit => 30, appearance => 1052};
get_decorate(6) ->
    #{base_id => 6, mount_base_id => 1011, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(7) ->
    #{base_id => 7, mount_base_id => 1021, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(8) ->
    #{base_id => 8, mount_base_id => 1031, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(9) ->
    #{base_id => 9, mount_base_id => 1041, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(10) ->
    #{base_id => 10, mount_base_id => 1051, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(11) ->
    #{base_id => 11, mount_base_id => 1101, type => 1,
      item_id => 23551, day_spirit => 30, appearance => 1106};
get_decorate(12) ->
    #{base_id => 12, mount_base_id => 1102, type => 1,
      item_id => 23551, day_spirit => 30, appearance => 1106};
get_decorate(13) ->
    #{base_id => 13, mount_base_id => 1103, type => 1,
      item_id => 23551, day_spirit => 30, appearance => 1106};
get_decorate(14) ->
    #{base_id => 14, mount_base_id => 1104, type => 1,
      item_id => 23551, day_spirit => 30, appearance => 1106};
get_decorate(15) ->
    #{base_id => 15, mount_base_id => 1105, type => 1,
      item_id => 23551, day_spirit => 30, appearance => 1106};
get_decorate(16) ->
    #{base_id => 16, mount_base_id => 1111, type => 1,
      item_id => 23551, day_spirit => 30, appearance => 1116};
get_decorate(17) ->
    #{base_id => 17, mount_base_id => 1112, type => 1,
      item_id => 23551, day_spirit => 30, appearance => 1116};
get_decorate(18) ->
    #{base_id => 18, mount_base_id => 1113, type => 1,
      item_id => 23551, day_spirit => 30, appearance => 1116};
get_decorate(19) ->
    #{base_id => 19, mount_base_id => 1114, type => 1,
      item_id => 23551, day_spirit => 30, appearance => 1116};
get_decorate(20) ->
    #{base_id => 20, mount_base_id => 1115, type => 1,
      item_id => 23551, day_spirit => 30, appearance => 1116};
get_decorate(21) ->
    #{base_id => 21, mount_base_id => 1101, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(22) ->
    #{base_id => 22, mount_base_id => 1102, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(23) ->
    #{base_id => 23, mount_base_id => 1103, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(24) ->
    #{base_id => 24, mount_base_id => 1104, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(25) ->
    #{base_id => 25, mount_base_id => 1105, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(26) ->
    #{base_id => 26, mount_base_id => 1111, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(27) ->
    #{base_id => 27, mount_base_id => 1112, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(28) ->
    #{base_id => 28, mount_base_id => 1113, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(29) ->
    #{base_id => 29, mount_base_id => 1114, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(30) ->
    #{base_id => 30, mount_base_id => 1115, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(31) ->
    #{base_id => 31, mount_base_id => 1107, type => 1,
      item_id => 23551, day_spirit => 30, appearance => 1106};
get_decorate(32) ->
    #{base_id => 32, mount_base_id => 1117, type => 1,
      item_id => 23551, day_spirit => 30, appearance => 1116};
get_decorate(33) ->
    #{base_id => 33, mount_base_id => 1107, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(34) ->
    #{base_id => 34, mount_base_id => 1117, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(35) ->
    #{base_id => 35, mount_base_id => 1061, type => 1,
      item_id => 23551, day_spirit => 30, appearance => 1062};
get_decorate(36) ->
    #{base_id => 36, mount_base_id => 1061, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(37) ->
    #{base_id => 37, mount_base_id => 1201, type => 1,
      item_id => 23551, day_spirit => 30, appearance => 1206};
get_decorate(38) ->
    #{base_id => 38, mount_base_id => 1202, type => 1,
      item_id => 23551, day_spirit => 30, appearance => 1206};
get_decorate(39) ->
    #{base_id => 39, mount_base_id => 1203, type => 1,
      item_id => 23551, day_spirit => 30, appearance => 1206};
get_decorate(40) ->
    #{base_id => 40, mount_base_id => 1204, type => 1,
      item_id => 23551, day_spirit => 30, appearance => 1206};
get_decorate(41) ->
    #{base_id => 41, mount_base_id => 1205, type => 1,
      item_id => 23551, day_spirit => 30, appearance => 1206};
get_decorate(42) ->
    #{base_id => 42, mount_base_id => 1207, type => 1,
      item_id => 23551, day_spirit => 30, appearance => 1206};
get_decorate(43) ->
    #{base_id => 43, mount_base_id => 1201, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(44) ->
    #{base_id => 44, mount_base_id => 1202, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(45) ->
    #{base_id => 45, mount_base_id => 1203, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(46) ->
    #{base_id => 46, mount_base_id => 1204, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(47) ->
    #{base_id => 47, mount_base_id => 1205, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(48) ->
    #{base_id => 48, mount_base_id => 1207, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(49) ->
    #{base_id => 49, mount_base_id => 1071, type => 1,
      item_id => 23551, day_spirit => 30, appearance => 1072};
get_decorate(50) ->
    #{base_id => 50, mount_base_id => 1071, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(51) ->
    #{base_id => 51, mount_base_id => 1108, type => 1,
      item_id => 23551, day_spirit => 30, appearance => 1106};
get_decorate(52) ->
    #{base_id => 52, mount_base_id => 1108, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(53) ->
    #{base_id => 53, mount_base_id => 1118, type => 1,
      item_id => 23551, day_spirit => 30, appearance => 1116};
get_decorate(54) ->
    #{base_id => 54, mount_base_id => 1118, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(55) ->
    #{base_id => 55, mount_base_id => 1208, type => 1,
      item_id => 23551, day_spirit => 30, appearance => 1206};
get_decorate(56) ->
    #{base_id => 56, mount_base_id => 1208, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(57) ->
    #{base_id => 57, mount_base_id => 1300, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(58) ->
    #{base_id => 58, mount_base_id => 1301, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(59) ->
    #{base_id => 59, mount_base_id => 1302, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(60) ->
    #{base_id => 60, mount_base_id => 1303, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(61) ->
    #{base_id => 61, mount_base_id => 1304, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(62) ->
    #{base_id => 62, mount_base_id => 1305, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(63) ->
    #{base_id => 63, mount_base_id => 1306, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(64) ->
    #{base_id => 64, mount_base_id => 1310, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(65) ->
    #{base_id => 65, mount_base_id => 1311, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(66) ->
    #{base_id => 66, mount_base_id => 1312, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(67) ->
    #{base_id => 67, mount_base_id => 1313, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(68) ->
    #{base_id => 68, mount_base_id => 1314, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(69) ->
    #{base_id => 69, mount_base_id => 1315, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(70) ->
    #{base_id => 70, mount_base_id => 1316, type => 2,
      item_id => 23552, day_spirit => 10, attr => [{12, 15}]};
get_decorate(_) -> false.

list_goal(100) -> [500];
list_goal(1) -> [1000];
list_goal(2) -> [2000, 2001];
list_goal(3) -> [3000, 3001];
list_goal(_) -> [].

get_mount_goal(500) ->
    #quest_data{id = 500, name = lang:get("等级目标"), lev = 7,
                pre_quest = 0, day = 100,
                progress =
                    [#quest_progress{label = evt_levup, target = 0,
                                     param = [], target_val = 10}],
                desc = lang:get("角色等级达到<color='#00ff00'>10级</color>")};
get_mount_goal(1000) ->
    #quest_data{id = 1000, name = lang:get("等级目标"),
                lev = 75, pre_quest = 0, day = 1,
                progress =
                    [#quest_progress{label = evt_levup, target = 0,
                                     param = [], target_val = 78}],
                desc = lang:get("角色等级达到<color='#00ff00'>78级</color>")};
get_mount_goal(2000) ->
    #quest_data{id = 2000, name = lang:get("等级目标"),
                lev = 82, pre_quest = 0, day = 2,
                progress =
                    [#quest_progress{label = evt_levup, target = 0,
                                     param = [], target_val = 92}],
                desc = lang:get("角色等级达到<color='#00ff00'>92级</color>")};
get_mount_goal(2001) ->
    #quest_data{id = 2001, name = lang:get("坐骑目标"),
                lev = 82, pre_quest = 0, day = 2,
                progress =
                    [#quest_progress{label = evt_mount_lev, target = 0,
                                     param = [], target_val = 15}],
                desc = lang:get("拥有一只<color='#00ff00'>15级</color>坐骑")};
get_mount_goal(3000) ->
    #quest_data{id = 3000, name = lang:get("等级目标"),
                lev = 92, pre_quest = 0, day = 3,
                progress =
                    [#quest_progress{label = evt_levup, target = 2,
                                     param = [0], target_val = 100}],
                desc = lang:get("角色等级达到<color='#00ff00'>100级</color>")};
get_mount_goal(3001) ->
    #quest_data{id = 3001, name = lang:get("坐骑目标"),
                lev = 92, pre_quest = 0, day = 3,
                progress =
                    [#quest_progress{label = evt_mount_lev, target = 0,
                                     param = [], target_val = 30}],
                desc = lang:get("拥有一只<color='#00ff00'>30级</color>坐骑")};
get_mount_goal(_) -> false.

get_combat_egg_val(100) -> {12, 1000, 5};
get_combat_egg_val(10000) -> {3, 1000, 10};
get_combat_egg_val(10001) -> {3, 1000, 5};
get_combat_egg_val(5) -> {6, 1000, 2};
get_combat_egg_val(8) -> {1, 1000, 80};
get_combat_egg_val(9) -> {3, 1000, 5};
get_combat_egg_val(16) -> {5, 1000, 10};
get_combat_egg_val(11) -> {5, 1000, 12};
get_combat_egg_val(13) -> {3, 1000, 10};
get_combat_egg_val(3) -> {1, 1000, 160};
get_combat_egg_val(22) -> {1, 800, 50};
get_combat_egg_val(60) -> {2, 1000, 10};
get_combat_egg_val(_) -> false.

get_rand_skill_cost({1, 1}) -> [{23550, 1}];
get_rand_skill_cost({1, 2}) -> [{23550, 2}];
get_rand_skill_cost({1, 3}) -> [{23550, 1}];
get_rand_skill_cost({1, 4}) -> [{23550, 1}];
get_rand_skill_cost({1, 5}) -> [{23550, 2}];
get_rand_skill_cost({2, 1}) -> [{23550, 1}];
get_rand_skill_cost({2, 2}) -> [{23550, 2}];
get_rand_skill_cost({2, 3}) -> [{23550, 1}];
get_rand_skill_cost({2, 4}) -> [{23550, 2}];
get_rand_skill_cost({2, 5}) -> [{23550, 1}];
get_rand_skill_cost({3, 1}) -> [{23550, 1}];
get_rand_skill_cost({3, 2}) -> [{23550, 2}];
get_rand_skill_cost({3, 3}) -> [{23550, 1}];
get_rand_skill_cost({3, 4}) -> [{23550, 2}];
get_rand_skill_cost({3, 5}) -> [{23550, 1}];
get_rand_skill_cost(_) -> false.

get_upgrade_attr(_) -> [].

get_growth_add(1) ->
    [{1, 800},
     {4, 800},
     {5, 800},
     {6, 800},
     {7, 800},
     {3, 800},
     {43, 800}];
get_growth_add(2) ->
    [{1, 840},
     {4, 840},
     {5, 840},
     {6, 840},
     {7, 840},
     {3, 840},
     {43, 840}];
get_growth_add(3) ->
    [{1, 880},
     {4, 880},
     {5, 880},
     {6, 880},
     {7, 880},
     {3, 880},
     {43, 880}];
get_growth_add(4) ->
    [{1, 920},
     {4, 920},
     {5, 920},
     {6, 920},
     {7, 920},
     {3, 920},
     {43, 920}];
get_growth_add(5) ->
    [{1, 960},
     {4, 960},
     {5, 960},
     {6, 960},
     {7, 960},
     {3, 960},
     {43, 960}];
get_growth_add(6) ->
    [{1, 1000},
     {4, 1000},
     {5, 1000},
     {6, 1000},
     {7, 1000},
     {3, 1000},
     {43, 1000}];
get_growth_add(_) -> [].

get_appearance_attr({1012, 1}) ->
    [{1, 50}, {6, 16}, {7, 12}];
get_appearance_attr({1022, 2}) ->
    [{1, 50}, {6, 16}, {7, 12}];
get_appearance_attr({1032, 3}) ->
    [{1, 50}, {6, 16}, {7, 12}];
get_appearance_attr({1042, 4}) ->
    [{1, 50}, {6, 16}, {7, 12}];
get_appearance_attr({1052, 5}) ->
    [{1, 50}, {6, 16}, {7, 12}];
get_appearance_attr({1062, 6}) ->
    [{1, 50}, {6, 16}, {7, 12}];
get_appearance_attr({1072, 7}) ->
    [{1, 50}, {6, 16}, {7, 12}];
get_appearance_attr({1106, 0}) ->
    [{1, 50}, {6, 16}, {7, 12}];
get_appearance_attr({1116, 0}) ->
    [{1, 50}, {6, 16}, {7, 12}];
get_appearance_attr({1206, 0}) ->
    [{1, 50}, {6, 16}, {7, 12}];
get_appearance_attr({2000, 0}) ->
    [{1, 50}, {6, 16}, {7, 12}];
get_appearance_attr({2001, 0}) ->
    [{1, 100}, {6, 32}, {7, 24}];
get_appearance_attr({2002, 0}) ->
    [{1, 50}, {6, 16}, {7, 12}];
get_appearance_attr({2003, 0}) ->
    [{1, 100}, {6, 32}, {7, 24}];
get_appearance_attr({2004, 0}) ->
    [{1, 50}, {6, 16}, {7, 12}];
get_appearance_attr({2005, 0}) ->
    [{1, 100}, {6, 32}, {7, 24}];
get_appearance_attr({2006, 0}) ->
    [{1, 50}, {6, 16}, {3, 8}];
get_appearance_attr({2007, 0}) ->
    [{1, 100}, {6, 32}, {3, 16}];
get_appearance_attr({2008, 0}) ->
    [{1, 50}, {7, 12}, {2, 40}];
get_appearance_attr({2009, 0}) ->
    [{1, 100}, {7, 24}, {2, 80}];
get_appearance_attr({2010, 0}) ->
    [{1, 60}, {6, 20}, {7, 15}];
get_appearance_attr({2011, 0}) ->
    [{1, 120}, {6, 40}, {7, 30}];
get_appearance_attr({2012, 0}) ->
    [{1, 60}, {6, 20}, {7, 15}];
get_appearance_attr({2013, 0}) ->
    [{1, 120}, {6, 40}, {7, 30}];
get_appearance_attr({2014, 0}) ->
    [{1, 60}, {6, 20}, {7, 15}];
get_appearance_attr({2015, 0}) ->
    [{1, 120}, {6, 40}, {7, 30}];
get_appearance_attr({2016, 0}) ->
    [{1, 60}, {6, 20}, {3, 10}];
get_appearance_attr({2017, 0}) ->
    [{1, 120}, {6, 40}, {3, 20}];
get_appearance_attr({2018, 0}) ->
    [{1, 50}, {6, 16}, {7, 12}];
get_appearance_attr({2019, 0}) -> [{1, 60}];
get_appearance_attr({2020, 0}) -> [{6, 20}, {7, 15}];
get_appearance_attr({2021, 0}) -> [{1, 200}];
get_appearance_attr({2023, 0}) ->
    [{1, 60}, {6, 20}, {7, 15}];
get_appearance_attr({2031, 0}) ->
    [{1, 60}, {6, 20}, {7, 15}];
get_appearance_attr({1999, 0}) ->
    [{1, 60}, {6, 20}, {7, 15}];
get_appearance_attr({2038, 0}) ->
    [{1, 60}, {6, 20}, {7, 15}];
get_appearance_attr({2044, 0}) -> [{6, 20}, {7, 15}];
get_appearance_attr({2045, 0}) ->
    [{1, 60}, {6, 20}, {7, 15}];
get_appearance_attr({2051, 0}) ->
    [{1, 60}, {6, 20}, {7, 15}];
get_appearance_attr({2057, 0}) ->
    [{1, 60}, {6, 20}, {7, 15}];
get_appearance_attr({2063, 0}) ->
    [{1, 60}, {6, 20}, {7, 15}];
get_appearance_attr({2069, 0}) -> [{6, 20}, {7, 15}];
get_appearance_attr({2070, 0}) ->
    [{1, 60}, {6, 20}, {7, 15}];
get_appearance_attr({2076, 0}) ->
    [{1, 60}, {6, 20}, {7, 15}];
get_appearance_attr({2082, 0}) ->
    [{1, 60}, {6, 20}, {7, 15}];
get_appearance_attr({2088, 0}) ->
    [{1, 60}, {6, 20}, {7, 15}];
get_appearance_attr({2094, 0}) ->
    [{1, 60}, {6, 20}, {7, 15}];
get_appearance_attr({2100, 0}) ->
    [{1, 60}, {6, 20}, {7, 15}];
get_appearance_attr(_) -> [].

get_item_decorate({23551, 1011}) -> 1;
get_item_decorate({23551, 1021}) -> 2;
get_item_decorate({23551, 1031}) -> 3;
get_item_decorate({23551, 1041}) -> 4;
get_item_decorate({23551, 1051}) -> 5;
get_item_decorate({23552, 1011}) -> 6;
get_item_decorate({23552, 1021}) -> 7;
get_item_decorate({23552, 1031}) -> 8;
get_item_decorate({23552, 1041}) -> 9;
get_item_decorate({23552, 1051}) -> 10;
get_item_decorate({23551, 1101}) -> 11;
get_item_decorate({23551, 1102}) -> 12;
get_item_decorate({23551, 1103}) -> 13;
get_item_decorate({23551, 1104}) -> 14;
get_item_decorate({23551, 1105}) -> 15;
get_item_decorate({23551, 1111}) -> 16;
get_item_decorate({23551, 1112}) -> 17;
get_item_decorate({23551, 1113}) -> 18;
get_item_decorate({23551, 1114}) -> 19;
get_item_decorate({23551, 1115}) -> 20;
get_item_decorate({23552, 1101}) -> 21;
get_item_decorate({23552, 1102}) -> 22;
get_item_decorate({23552, 1103}) -> 23;
get_item_decorate({23552, 1104}) -> 24;
get_item_decorate({23552, 1105}) -> 25;
get_item_decorate({23552, 1111}) -> 26;
get_item_decorate({23552, 1112}) -> 27;
get_item_decorate({23552, 1113}) -> 28;
get_item_decorate({23552, 1114}) -> 29;
get_item_decorate({23552, 1115}) -> 30;
get_item_decorate({23551, 1107}) -> 31;
get_item_decorate({23551, 1117}) -> 32;
get_item_decorate({23552, 1107}) -> 33;
get_item_decorate({23552, 1117}) -> 34;
get_item_decorate({23551, 1061}) -> 35;
get_item_decorate({23552, 1061}) -> 36;
get_item_decorate({23551, 1201}) -> 37;
get_item_decorate({23551, 1202}) -> 38;
get_item_decorate({23551, 1203}) -> 39;
get_item_decorate({23551, 1204}) -> 40;
get_item_decorate({23551, 1205}) -> 41;
get_item_decorate({23551, 1207}) -> 42;
get_item_decorate({23552, 1201}) -> 43;
get_item_decorate({23552, 1202}) -> 44;
get_item_decorate({23552, 1203}) -> 45;
get_item_decorate({23552, 1204}) -> 46;
get_item_decorate({23552, 1205}) -> 47;
get_item_decorate({23552, 1207}) -> 48;
get_item_decorate({23551, 1071}) -> 49;
get_item_decorate({23552, 1071}) -> 50;
get_item_decorate({23551, 1108}) -> 51;
get_item_decorate({23552, 1108}) -> 52;
get_item_decorate({23551, 1118}) -> 53;
get_item_decorate({23552, 1118}) -> 54;
get_item_decorate({23551, 1208}) -> 55;
get_item_decorate({23552, 1208}) -> 56;
get_item_decorate({23552, 1300}) -> 57;
get_item_decorate({23552, 1301}) -> 58;
get_item_decorate({23552, 1302}) -> 59;
get_item_decorate({23552, 1303}) -> 60;
get_item_decorate({23552, 1304}) -> 61;
get_item_decorate({23552, 1305}) -> 62;
get_item_decorate({23552, 1306}) -> 63;
get_item_decorate({23552, 1310}) -> 64;
get_item_decorate({23552, 1311}) -> 65;
get_item_decorate({23552, 1312}) -> 66;
get_item_decorate({23552, 1313}) -> 67;
get_item_decorate({23552, 1314}) -> 68;
get_item_decorate({23552, 1315}) -> 69;
get_item_decorate({23552, 1316}) -> 70;
get_item_decorate(_) -> false.

get_combat_cost_spirit(1) -> {100, 1};
get_combat_cost_spirit(2) -> {100, 1};
get_combat_cost_spirit(4) -> {700, 1};
get_combat_cost_spirit(5) -> {1000, 1};
get_combat_cost_spirit(8) -> {100, 1};
get_combat_cost_spirit(9) -> {1000, 1};
get_combat_cost_spirit(10) -> {500, 1};
get_combat_cost_spirit(11) -> {500, 1};
get_combat_cost_spirit(13) -> {100, 1};
get_combat_cost_spirit(14) -> {1000, 1};
get_combat_cost_spirit(15) -> {1000, 1};
get_combat_cost_spirit(16) -> {1000, 1};
get_combat_cost_spirit(17) -> {800, 1};
get_combat_cost_spirit(20) -> {1000, 1};
get_combat_cost_spirit(19) -> {1000, 1};
get_combat_cost_spirit(21) -> {1000, 1};
get_combat_cost_spirit(22) -> {1000, 1};
get_combat_cost_spirit(40) -> {1000, 2};
get_combat_cost_spirit(100) -> {800, 1};
get_combat_cost_spirit(102) -> {800, 1};
get_combat_cost_spirit(103) -> {800, 1};
get_combat_cost_spirit(104) -> {800, 1};
get_combat_cost_spirit(105) -> {800, 1};
get_combat_cost_spirit(_) -> false.

get_decorate_need_item({1, 1011}) -> {23551, 1};
get_decorate_need_item({1, 1021}) -> {23551, 2};
get_decorate_need_item({1, 1031}) -> {23551, 3};
get_decorate_need_item({1, 1041}) -> {23551, 4};
get_decorate_need_item({1, 1051}) -> {23551, 5};
get_decorate_need_item({2, 1011}) -> {23552, 6};
get_decorate_need_item({2, 1021}) -> {23552, 7};
get_decorate_need_item({2, 1031}) -> {23552, 8};
get_decorate_need_item({2, 1041}) -> {23552, 9};
get_decorate_need_item({2, 1051}) -> {23552, 10};
get_decorate_need_item({1, 1101}) -> {23551, 11};
get_decorate_need_item({1, 1102}) -> {23551, 12};
get_decorate_need_item({1, 1103}) -> {23551, 13};
get_decorate_need_item({1, 1104}) -> {23551, 14};
get_decorate_need_item({1, 1105}) -> {23551, 15};
get_decorate_need_item({1, 1111}) -> {23551, 16};
get_decorate_need_item({1, 1112}) -> {23551, 17};
get_decorate_need_item({1, 1113}) -> {23551, 18};
get_decorate_need_item({1, 1114}) -> {23551, 19};
get_decorate_need_item({1, 1115}) -> {23551, 20};
get_decorate_need_item({2, 1101}) -> {23552, 21};
get_decorate_need_item({2, 1102}) -> {23552, 22};
get_decorate_need_item({2, 1103}) -> {23552, 23};
get_decorate_need_item({2, 1104}) -> {23552, 24};
get_decorate_need_item({2, 1105}) -> {23552, 25};
get_decorate_need_item({2, 1111}) -> {23552, 26};
get_decorate_need_item({2, 1112}) -> {23552, 27};
get_decorate_need_item({2, 1113}) -> {23552, 28};
get_decorate_need_item({2, 1114}) -> {23552, 29};
get_decorate_need_item({2, 1115}) -> {23552, 30};
get_decorate_need_item({1, 1107}) -> {23551, 31};
get_decorate_need_item({1, 1117}) -> {23551, 32};
get_decorate_need_item({2, 1107}) -> {23552, 33};
get_decorate_need_item({2, 1117}) -> {23552, 34};
get_decorate_need_item({1, 1061}) -> {23551, 35};
get_decorate_need_item({2, 1061}) -> {23552, 36};
get_decorate_need_item({1, 1201}) -> {23551, 37};
get_decorate_need_item({1, 1202}) -> {23551, 38};
get_decorate_need_item({1, 1203}) -> {23551, 39};
get_decorate_need_item({1, 1204}) -> {23551, 40};
get_decorate_need_item({1, 1205}) -> {23551, 41};
get_decorate_need_item({1, 1207}) -> {23551, 42};
get_decorate_need_item({2, 1201}) -> {23552, 43};
get_decorate_need_item({2, 1202}) -> {23552, 44};
get_decorate_need_item({2, 1203}) -> {23552, 45};
get_decorate_need_item({2, 1204}) -> {23552, 46};
get_decorate_need_item({2, 1205}) -> {23552, 47};
get_decorate_need_item({2, 1207}) -> {23552, 48};
get_decorate_need_item({1, 1071}) -> {23551, 49};
get_decorate_need_item({2, 1071}) -> {23552, 50};
get_decorate_need_item({1, 1108}) -> {23551, 51};
get_decorate_need_item({2, 1108}) -> {23552, 52};
get_decorate_need_item({1, 1118}) -> {23551, 53};
get_decorate_need_item({2, 1118}) -> {23552, 54};
get_decorate_need_item({1, 1208}) -> {23551, 55};
get_decorate_need_item({2, 1208}) -> {23552, 56};
get_decorate_need_item({2, 1300}) -> {23552, 57};
get_decorate_need_item({2, 1301}) -> {23552, 58};
get_decorate_need_item({2, 1302}) -> {23552, 59};
get_decorate_need_item({2, 1303}) -> {23552, 60};
get_decorate_need_item({2, 1304}) -> {23552, 61};
get_decorate_need_item({2, 1305}) -> {23552, 62};
get_decorate_need_item({2, 1306}) -> {23552, 63};
get_decorate_need_item({2, 1310}) -> {23552, 64};
get_decorate_need_item({2, 1311}) -> {23552, 65};
get_decorate_need_item({2, 1312}) -> {23552, 66};
get_decorate_need_item({2, 1313}) -> {23552, 67};
get_decorate_need_item({2, 1314}) -> {23552, 68};
get_decorate_need_item({2, 1315}) -> {23552, 69};
get_decorate_need_item({2, 1316}) -> {23552, 70};
get_decorate_need_item(_) -> false.

get_growth_val({1, 1}) -> 1000;
get_growth_val({1, 2}) -> 1050;
get_growth_val({1, 3}) -> 1100;
get_growth_val({1, 4}) -> 1150;
get_growth_val({1, 5}) -> 1200;
get_growth_val({1, 6}) -> 1250;
get_growth_val({2, 1}) -> 1000;
get_growth_val({2, 2}) -> 1050;
get_growth_val({2, 3}) -> 1100;
get_growth_val({2, 4}) -> 1150;
get_growth_val({2, 5}) -> 1200;
get_growth_val({2, 6}) -> 1250;
get_growth_val({3, 1}) -> 1000;
get_growth_val({3, 2}) -> 1050;
get_growth_val({3, 3}) -> 1100;
get_growth_val({3, 4}) -> 1150;
get_growth_val({3, 5}) -> 1200;
get_growth_val({3, 6}) -> 1250;
get_growth_val({100, 1}) -> 1000;
get_growth_val(_) -> 0.

get_synthetise_cost(1012) -> {val_not_exist, []};
get_synthetise_cost(1022) -> {val_not_exist, []};
get_synthetise_cost(1032) -> {val_not_exist, []};
get_synthetise_cost(1042) -> {val_not_exist, []};
get_synthetise_cost(1052) -> {val_not_exist, []};
get_synthetise_cost(1062) -> {val_not_exist, []};
get_synthetise_cost(1072) -> {val_not_exist, []};
get_synthetise_cost(1106) -> {val_not_exist, []};
get_synthetise_cost(1116) -> {val_not_exist, []};
get_synthetise_cost(1206) -> {val_not_exist, []};
get_synthetise_cost(2000) -> {[{23650, 10}], [23660]};
get_synthetise_cost(2001) -> {[{23651, 10}], [23660]};
get_synthetise_cost(2002) -> {[{23652, 10}], [23660]};
get_synthetise_cost(2003) -> {[{23653, 10}], [23660]};
get_synthetise_cost(2004) -> {[{23654, 10}], [23660]};
get_synthetise_cost(2005) -> {[{23655, 10}], [23660]};
get_synthetise_cost(2006) -> {[{23656, 10}], [23660]};
get_synthetise_cost(2007) -> {[{23657, 10}], [23660]};
get_synthetise_cost(2008) -> {[{23658, 10}], [23660]};
get_synthetise_cost(2009) -> {[{23659, 10}], [23660]};
get_synthetise_cost(2010) -> {[{23661, 10}], [23669]};
get_synthetise_cost(2011) -> {[{23662, 10}], [23669]};
get_synthetise_cost(2012) -> {[{23663, 10}], [23669]};
get_synthetise_cost(2013) -> {[{23664, 10}], [23669]};
get_synthetise_cost(2014) -> {[{23665, 10}], [23669]};
get_synthetise_cost(2015) -> {[{23666, 10}], [23669]};
get_synthetise_cost(2016) -> {[{23667, 10}], [23669]};
get_synthetise_cost(2017) -> {[{23668, 10}], [23669]};
get_synthetise_cost(2018) -> {[{23670, 5}], [23669]};
get_synthetise_cost(2019) -> {[{23671, 10}], [23669]};
get_synthetise_cost(2020) -> {[{23674, 10}], [23669]};
get_synthetise_cost(2021) -> {[{23672, 10}], []};
get_synthetise_cost(2023) -> {[{23675, 7}], []};
get_synthetise_cost(2031) -> {[{29818, 7}], []};
get_synthetise_cost(1999) -> {[{29915, 8}], []};
get_synthetise_cost(2038) -> {[{29971, 8}], []};
get_synthetise_cost(2044) -> {[{70057, 10}], []};
get_synthetise_cost(2045) -> {[{70139, 8}], []};
get_synthetise_cost(2051) -> {[{70238, 8}], []};
get_synthetise_cost(2057) -> {[{70408, 8}], []};
get_synthetise_cost(2063) -> {[{70605, 8}], []};
get_synthetise_cost(2069) -> {[{70739, 10}], []};
get_synthetise_cost(2070) -> {[{70889, 8}], []};
get_synthetise_cost(2076) -> {[{71027, 8}], []};
get_synthetise_cost(2082) -> {[{71167, 8}], []};
get_synthetise_cost(2088) -> {[{71285, 8}], []};
get_synthetise_cost(2094) -> {[{71439, 8}], []};
get_synthetise_cost(2100) -> {[{71566, 8}], []};
get_synthetise_cost(_) -> [].

get_appearance_score({1012, 1}) -> 30;
get_appearance_score({1022, 2}) -> 30;
get_appearance_score({1032, 3}) -> 30;
get_appearance_score({1042, 4}) -> 30;
get_appearance_score({1052, 5}) -> 30;
get_appearance_score({1062, 6}) -> 30;
get_appearance_score({1072, 7}) -> 30;
get_appearance_score({1106, 0}) -> 30;
get_appearance_score({1116, 0}) -> 30;
get_appearance_score({1206, 0}) -> 30;
get_appearance_score({2000, 0}) -> 30;
get_appearance_score({2001, 0}) -> 50;
get_appearance_score({2002, 0}) -> 30;
get_appearance_score({2003, 0}) -> 50;
get_appearance_score({2004, 0}) -> 30;
get_appearance_score({2005, 0}) -> 50;
get_appearance_score({2006, 0}) -> 30;
get_appearance_score({2007, 0}) -> 50;
get_appearance_score({2008, 0}) -> 30;
get_appearance_score({2009, 0}) -> 50;
get_appearance_score({2010, 0}) -> 30;
get_appearance_score({2011, 0}) -> 50;
get_appearance_score({2012, 0}) -> 30;
get_appearance_score({2013, 0}) -> 50;
get_appearance_score({2014, 0}) -> 30;
get_appearance_score({2015, 0}) -> 50;
get_appearance_score({2016, 0}) -> 30;
get_appearance_score({2017, 0}) -> 50;
get_appearance_score({2018, 0}) -> 30;
get_appearance_score({2019, 0}) -> 50;
get_appearance_score({2020, 0}) -> 50;
get_appearance_score({2021, 0}) -> 50;
get_appearance_score({2023, 0}) -> 50;
get_appearance_score({2031, 0}) -> 50;
get_appearance_score({1999, 0}) -> 50;
get_appearance_score({2038, 0}) -> 50;
get_appearance_score({2044, 0}) -> 50;
get_appearance_score({2045, 0}) -> 50;
get_appearance_score({2051, 0}) -> 50;
get_appearance_score({2057, 0}) -> 50;
get_appearance_score({2063, 0}) -> 50;
get_appearance_score({2069, 0}) -> 50;
get_appearance_score({2070, 0}) -> 50;
get_appearance_score({2076, 0}) -> 50;
get_appearance_score({2082, 0}) -> 50;
get_appearance_score({2088, 0}) -> 50;
get_appearance_score({2094, 0}) -> 50;
get_appearance_score({2100, 0}) -> 50;
get_appearance_score(_) -> 0.

get_appearance_index(1012) -> 1;
get_appearance_index(1022) -> 1;
get_appearance_index(1032) -> 1;
get_appearance_index(1042) -> 1;
get_appearance_index(1052) -> 1;
get_appearance_index(1062) -> 1;
get_appearance_index(1072) -> 1;
get_appearance_index(1106) -> 1;
get_appearance_index(1116) -> 1;
get_appearance_index(1206) -> 1;
get_appearance_index(2000) -> 1;
get_appearance_index(2001) -> 1;
get_appearance_index(2002) -> 1;
get_appearance_index(2003) -> 1;
get_appearance_index(2004) -> 1;
get_appearance_index(2005) -> 1;
get_appearance_index(2006) -> 1;
get_appearance_index(2007) -> 1;
get_appearance_index(2008) -> 1;
get_appearance_index(2009) -> 1;
get_appearance_index(2010) -> 2;
get_appearance_index(2011) -> 2;
get_appearance_index(2012) -> 2;
get_appearance_index(2013) -> 2;
get_appearance_index(2014) -> 2;
get_appearance_index(2015) -> 2;
get_appearance_index(2016) -> 2;
get_appearance_index(2017) -> 2;
get_appearance_index(2018) -> 2;
get_appearance_index(2019) -> 2;
get_appearance_index(2020) -> 2;
get_appearance_index(2021) -> 2;
get_appearance_index(2023) -> 2;
get_appearance_index(2031) -> 2;
get_appearance_index(1999) -> 2;
get_appearance_index(2038) -> 2;
get_appearance_index(2044) -> 2;
get_appearance_index(2045) -> 2;
get_appearance_index(2051) -> 2;
get_appearance_index(2057) -> 2;
get_appearance_index(2063) -> 2;
get_appearance_index(2069) -> 2;
get_appearance_index(2070) -> 2;
get_appearance_index(2076) -> 2;
get_appearance_index(2082) -> 2;
get_appearance_index(2088) -> 2;
get_appearance_index(2094) -> 2;
get_appearance_index(2100) -> 2;
get_appearance_index(_) -> 1.

get_mount_skill({0, 85010}) ->
    #{index => 1, skill_index => 1, classes => 0,
      id => 85010, ratio => 200};
get_mount_skill({0, 85020}) ->
    #{index => 1, skill_index => 1, classes => 0,
      id => 85020, ratio => 200};
get_mount_skill({0, 85030}) ->
    #{index => 1, skill_index => 1, classes => 0,
      id => 85030, ratio => 300};
get_mount_skill({0, 85040}) ->
    #{index => 1, skill_index => 1, classes => 0,
      id => 85040, ratio => 300};
get_mount_skill({0, 85050}) ->
    #{index => 1, skill_index => 2, classes => 0,
      id => 85050, ratio => 280};
get_mount_skill({0, 85060}) ->
    #{index => 1, skill_index => 2, classes => 0,
      id => 85060, ratio => 280};
get_mount_skill({0, 85070}) ->
    #{index => 1, skill_index => 2, classes => 0,
      id => 85070, ratio => 290};
get_mount_skill({1, 85110}) ->
    #{index => 1, skill_index => 2, classes => 1,
      id => 85110, ratio => 150};
get_mount_skill({2, 85100}) ->
    #{index => 1, skill_index => 2, classes => 2,
      id => 85100, ratio => 150};
get_mount_skill({3, 85111}) ->
    #{index => 1, skill_index => 2, classes => 3,
      id => 85111, ratio => 150};
get_mount_skill({4, 85080}) ->
    #{index => 1, skill_index => 2, classes => 4,
      id => 85080, ratio => 150};
get_mount_skill({5, 85090}) ->
    #{index => 1, skill_index => 2, classes => 5,
      id => 85090, ratio => 150};
get_mount_skill({6, 85440}) ->
    #{index => 1, skill_index => 2, classes => 6,
      id => 85440, ratio => 150};
get_mount_skill({7, 85800}) ->
    #{index => 1, skill_index => 2, classes => 7,
      id => 85800, ratio => 150};
get_mount_skill({0, 85120}) ->
    #{index => 1, skill_index => 3, classes => 0,
      id => 85120, ratio => 280};
get_mount_skill({0, 85130}) ->
    #{index => 1, skill_index => 3, classes => 0,
      id => 85130, ratio => 280};
get_mount_skill({0, 85140}) ->
    #{index => 1, skill_index => 3, classes => 0,
      id => 85140, ratio => 280};
get_mount_skill({0, 85150}) ->
    #{index => 1, skill_index => 3, classes => 0,
      id => 85150, ratio => 160};
get_mount_skill({0, 85160}) ->
    #{index => 1, skill_index => 4, classes => 0,
      id => 85160, ratio => 350};
get_mount_skill({0, 85170}) ->
    #{index => 1, skill_index => 4, classes => 0,
      id => 85170, ratio => 350};
get_mount_skill({0, 85180}) ->
    #{index => 1, skill_index => 4, classes => 0,
      id => 85180, ratio => 150};
get_mount_skill({0, 85190}) ->
    #{index => 1, skill_index => 4, classes => 0,
      id => 85190, ratio => 150};
get_mount_skill({0, 85500}) ->
    #{index => 1, skill_index => 5, classes => 0,
      id => 85500, ratio => 280};
get_mount_skill({0, 85510}) ->
    #{index => 1, skill_index => 5, classes => 0,
      id => 85510, ratio => 280};
get_mount_skill({0, 85520}) ->
    #{index => 1, skill_index => 5, classes => 0,
      id => 85520, ratio => 290};
get_mount_skill({1, 85530}) ->
    #{index => 1, skill_index => 5, classes => 1,
      id => 85530, ratio => 150};
get_mount_skill({2, 85530}) ->
    #{index => 1, skill_index => 5, classes => 2,
      id => 85530, ratio => 150};
get_mount_skill({3, 85530}) ->
    #{index => 1, skill_index => 5, classes => 3,
      id => 85530, ratio => 150};
get_mount_skill({6, 85530}) ->
    #{index => 1, skill_index => 5, classes => 6,
      id => 85530, ratio => 150};
get_mount_skill({4, 85540}) ->
    #{index => 1, skill_index => 5, classes => 4,
      id => 85540, ratio => 150};
get_mount_skill({5, 85550}) ->
    #{index => 1, skill_index => 5, classes => 5,
      id => 85550, ratio => 150};
get_mount_skill({7, 85810}) ->
    #{index => 1, skill_index => 5, classes => 7,
      id => 85810, ratio => 150};
get_mount_skill({0, 85200}) ->
    #{index => 2, skill_index => 1, classes => 0,
      id => 85200, ratio => 200};
get_mount_skill({0, 85210}) ->
    #{index => 2, skill_index => 1, classes => 0,
      id => 85210, ratio => 200};
get_mount_skill({0, 85220}) ->
    #{index => 2, skill_index => 1, classes => 0,
      id => 85220, ratio => 300};
get_mount_skill({0, 85230}) ->
    #{index => 2, skill_index => 1, classes => 0,
      id => 85230, ratio => 300};
get_mount_skill({0, 85290}) ->
    #{index => 2, skill_index => 2, classes => 0,
      id => 85290, ratio => 300};
get_mount_skill({0, 85300}) ->
    #{index => 2, skill_index => 2, classes => 0,
      id => 85300, ratio => 300};
get_mount_skill({0, 85310}) ->
    #{index => 2, skill_index => 2, classes => 0,
      id => 85310, ratio => 300};
get_mount_skill({1, 85240}) ->
    #{index => 2, skill_index => 2, classes => 1,
      id => 85240, ratio => 100};
get_mount_skill({2, 85250}) ->
    #{index => 2, skill_index => 2, classes => 2,
      id => 85250, ratio => 100};
get_mount_skill({3, 85260}) ->
    #{index => 2, skill_index => 2, classes => 3,
      id => 85260, ratio => 100};
get_mount_skill({4, 85270}) ->
    #{index => 2, skill_index => 2, classes => 4,
      id => 85270, ratio => 100};
get_mount_skill({5, 85280}) ->
    #{index => 2, skill_index => 2, classes => 5,
      id => 85280, ratio => 100};
get_mount_skill({6, 85450}) ->
    #{index => 2, skill_index => 2, classes => 6,
      id => 85450, ratio => 100};
get_mount_skill({7, 85240}) ->
    #{index => 2, skill_index => 2, classes => 7,
      id => 85240, ratio => 100};
get_mount_skill({0, 85320}) ->
    #{index => 2, skill_index => 3, classes => 0,
      id => 85320, ratio => 280};
get_mount_skill({0, 85330}) ->
    #{index => 2, skill_index => 3, classes => 0,
      id => 85330, ratio => 280};
get_mount_skill({0, 85340}) ->
    #{index => 2, skill_index => 3, classes => 0,
      id => 85340, ratio => 280};
get_mount_skill({0, 85350}) ->
    #{index => 2, skill_index => 3, classes => 0,
      id => 85350, ratio => 160};
get_mount_skill({0, 85360}) ->
    #{index => 2, skill_index => 4, classes => 0,
      id => 85360, ratio => 350};
get_mount_skill({0, 85370}) ->
    #{index => 2, skill_index => 4, classes => 0,
      id => 85370, ratio => 350};
get_mount_skill({0, 85380}) ->
    #{index => 2, skill_index => 4, classes => 0,
      id => 85380, ratio => 150};
get_mount_skill({0, 85390}) ->
    #{index => 2, skill_index => 4, classes => 0,
      id => 85390, ratio => 150};
get_mount_skill({0, 85400}) ->
    #{index => 2, skill_index => 5, classes => 0,
      id => 85400, ratio => 150};
get_mount_skill({0, 85410}) ->
    #{index => 2, skill_index => 5, classes => 0,
      id => 85410, ratio => 150};
get_mount_skill({0, 85420}) ->
    #{index => 2, skill_index => 5, classes => 0,
      id => 85420, ratio => 150};
get_mount_skill({0, 85430}) ->
    #{index => 2, skill_index => 5, classes => 0,
      id => 85430, ratio => 350};
get_mount_skill({0, 85650}) ->
    #{index => 3, skill_index => 1, classes => 0,
      id => 85650, ratio => 200};
get_mount_skill({0, 85660}) ->
    #{index => 3, skill_index => 1, classes => 0,
      id => 85660, ratio => 200};
get_mount_skill({0, 85670}) ->
    #{index => 3, skill_index => 1, classes => 0,
      id => 85670, ratio => 200};
get_mount_skill({0, 85680}) ->
    #{index => 3, skill_index => 2, classes => 0,
      id => 85680, ratio => 300};
get_mount_skill({0, 85690}) ->
    #{index => 3, skill_index => 2, classes => 0,
      id => 85690, ratio => 300};
get_mount_skill({0, 85700}) ->
    #{index => 3, skill_index => 2, classes => 0,
      id => 85700, ratio => 300};
get_mount_skill({0, 85710}) ->
    #{index => 3, skill_index => 3, classes => 0,
      id => 85710, ratio => 300};
get_mount_skill({0, 85720}) ->
    #{index => 3, skill_index => 3, classes => 0,
      id => 85720, ratio => 300};
get_mount_skill({0, 85730}) ->
    #{index => 3, skill_index => 3, classes => 0,
      id => 85730, ratio => 300};
get_mount_skill({0, 85740}) ->
    #{index => 3, skill_index => 4, classes => 0,
      id => 85740, ratio => 300};
get_mount_skill({0, 85750}) ->
    #{index => 3, skill_index => 4, classes => 0,
      id => 85750, ratio => 300};
get_mount_skill({0, 85760}) ->
    #{index => 3, skill_index => 4, classes => 0,
      id => 85760, ratio => 300};
get_mount_skill({0, 85770}) ->
    #{index => 3, skill_index => 5, classes => 0,
      id => 85770, ratio => 300};
get_mount_skill({0, 85780}) ->
    #{index => 3, skill_index => 5, classes => 0,
      id => 85780, ratio => 300};
get_mount_skill({0, 85790}) ->
    #{index => 3, skill_index => 5, classes => 0,
      id => 85790, ratio => 300};
get_mount_skill(_) -> false.

get_mount_manger({1, 1}) -> #{num => 2, class => 1};
get_mount_manger({2, 1}) -> #{num => 2, class => 1};
get_mount_manger({3, 1}) -> #{num => 1, class => 2};
get_mount_manger({3, 3}) -> #{num => 2, class => 2};
get_mount_manger({3, 6}) -> #{num => 3, class => 2};
get_mount_manger({100, 1}) -> #{num => 0, class => 1};
get_mount_manger(_) -> false.

get_attr_add_type({1, 1, 1}) -> #{add_type => 1};
get_attr_add_type({1, 1, 2}) -> #{add_type => 1};
get_attr_add_type({1, 1, 3}) -> #{add_type => 1};
get_attr_add_type({1, 1, 4}) -> #{add_type => 1};
get_attr_add_type({1, 1, 5}) -> #{add_type => 1};
get_attr_add_type({1, 1, 6}) -> #{add_type => 1};
get_attr_add_type({1, 1, 7}) -> #{add_type => 1};
get_attr_add_type({1, 1, 8}) -> #{add_type => 1};
get_attr_add_type({1, 1, 9}) -> #{add_type => 1};
get_attr_add_type({1, 1, 10}) -> #{add_type => 1};
get_attr_add_type({1, 1, 11}) -> #{add_type => 1};
get_attr_add_type({1, 1, 12}) -> #{add_type => 1};
get_attr_add_type({1, 1, 13}) -> #{add_type => 1};
get_attr_add_type({1, 1, 14}) -> #{add_type => 1};
get_attr_add_type({1, 1, 15}) -> #{add_type => 1};
get_attr_add_type({1, 1, 16}) -> #{add_type => 1};
get_attr_add_type({1, 1, 17}) -> #{add_type => 1};
get_attr_add_type({1, 1, 18}) -> #{add_type => 1};
get_attr_add_type({1, 1, 19}) -> #{add_type => 1};
get_attr_add_type({1, 1, 20}) -> #{add_type => 1};
get_attr_add_type({1, 1, 21}) -> #{add_type => 1};
get_attr_add_type({1, 1, 22}) -> #{add_type => 1};
get_attr_add_type({1, 1, 23}) -> #{add_type => 1};
get_attr_add_type({1, 1, 24}) -> #{add_type => 1};
get_attr_add_type({1, 1, 25}) -> #{add_type => 1};
get_attr_add_type({1, 1, 26}) -> #{add_type => 1};
get_attr_add_type({1, 1, 27}) -> #{add_type => 1};
get_attr_add_type({1, 1, 28}) -> #{add_type => 1};
get_attr_add_type({1, 1, 29}) -> #{add_type => 1};
get_attr_add_type({1, 1, 30}) -> #{add_type => 1};
get_attr_add_type({1, 1, 31}) -> #{add_type => 1};
get_attr_add_type({1, 1, 32}) -> #{add_type => 1};
get_attr_add_type({1, 1, 33}) -> #{add_type => 1};
get_attr_add_type({1, 1, 34}) -> #{add_type => 1};
get_attr_add_type({1, 1, 35}) -> #{add_type => 1};
get_attr_add_type({1, 1, 36}) -> #{add_type => 1};
get_attr_add_type({1, 1, 37}) -> #{add_type => 1};
get_attr_add_type({1, 1, 38}) -> #{add_type => 1};
get_attr_add_type({1, 1, 39}) -> #{add_type => 1};
get_attr_add_type({1, 1, 40}) -> #{add_type => 1};
get_attr_add_type({1, 2, 1}) -> #{add_type => 1};
get_attr_add_type({1, 2, 2}) -> #{add_type => 1};
get_attr_add_type({1, 2, 3}) -> #{add_type => 1};
get_attr_add_type({1, 2, 4}) -> #{add_type => 1};
get_attr_add_type({1, 2, 5}) -> #{add_type => 1};
get_attr_add_type({1, 2, 6}) -> #{add_type => 1};
get_attr_add_type({1, 2, 7}) -> #{add_type => 1};
get_attr_add_type({1, 2, 8}) -> #{add_type => 1};
get_attr_add_type({1, 2, 9}) -> #{add_type => 1};
get_attr_add_type({1, 2, 10}) -> #{add_type => 1};
get_attr_add_type({1, 2, 11}) -> #{add_type => 1};
get_attr_add_type({1, 2, 12}) -> #{add_type => 1};
get_attr_add_type({1, 2, 13}) -> #{add_type => 1};
get_attr_add_type({1, 2, 14}) -> #{add_type => 1};
get_attr_add_type({1, 2, 15}) -> #{add_type => 1};
get_attr_add_type({1, 2, 16}) -> #{add_type => 1};
get_attr_add_type({1, 2, 17}) -> #{add_type => 1};
get_attr_add_type({1, 2, 18}) -> #{add_type => 1};
get_attr_add_type({1, 2, 19}) -> #{add_type => 1};
get_attr_add_type({1, 2, 20}) -> #{add_type => 1};
get_attr_add_type({1, 2, 21}) -> #{add_type => 1};
get_attr_add_type({1, 2, 22}) -> #{add_type => 1};
get_attr_add_type({1, 2, 23}) -> #{add_type => 1};
get_attr_add_type({1, 2, 24}) -> #{add_type => 1};
get_attr_add_type({1, 2, 25}) -> #{add_type => 1};
get_attr_add_type({1, 2, 26}) -> #{add_type => 1};
get_attr_add_type({1, 2, 27}) -> #{add_type => 1};
get_attr_add_type({1, 2, 28}) -> #{add_type => 1};
get_attr_add_type({1, 2, 29}) -> #{add_type => 1};
get_attr_add_type({1, 2, 30}) -> #{add_type => 1};
get_attr_add_type({1, 2, 31}) -> #{add_type => 1};
get_attr_add_type({1, 2, 32}) -> #{add_type => 1};
get_attr_add_type({1, 2, 33}) -> #{add_type => 1};
get_attr_add_type({1, 2, 34}) -> #{add_type => 1};
get_attr_add_type({1, 2, 35}) -> #{add_type => 1};
get_attr_add_type({1, 2, 36}) -> #{add_type => 1};
get_attr_add_type({1, 2, 37}) -> #{add_type => 1};
get_attr_add_type({1, 2, 38}) -> #{add_type => 1};
get_attr_add_type({1, 2, 39}) -> #{add_type => 1};
get_attr_add_type({1, 2, 40}) -> #{add_type => 1};
get_attr_add_type({1, 3, 1}) -> #{add_type => 1};
get_attr_add_type({1, 3, 2}) -> #{add_type => 1};
get_attr_add_type({1, 3, 3}) -> #{add_type => 1};
get_attr_add_type({1, 3, 4}) -> #{add_type => 1};
get_attr_add_type({1, 3, 5}) -> #{add_type => 1};
get_attr_add_type({1, 3, 6}) -> #{add_type => 1};
get_attr_add_type({1, 3, 7}) -> #{add_type => 1};
get_attr_add_type({1, 3, 8}) -> #{add_type => 1};
get_attr_add_type({1, 3, 9}) -> #{add_type => 1};
get_attr_add_type({1, 3, 10}) -> #{add_type => 1};
get_attr_add_type({1, 3, 11}) -> #{add_type => 1};
get_attr_add_type({1, 3, 12}) -> #{add_type => 1};
get_attr_add_type({1, 3, 13}) -> #{add_type => 1};
get_attr_add_type({1, 3, 14}) -> #{add_type => 1};
get_attr_add_type({1, 3, 15}) -> #{add_type => 1};
get_attr_add_type({1, 3, 16}) -> #{add_type => 1};
get_attr_add_type({1, 3, 17}) -> #{add_type => 1};
get_attr_add_type({1, 3, 18}) -> #{add_type => 1};
get_attr_add_type({1, 3, 19}) -> #{add_type => 1};
get_attr_add_type({1, 3, 20}) -> #{add_type => 1};
get_attr_add_type({1, 3, 21}) -> #{add_type => 1};
get_attr_add_type({1, 3, 22}) -> #{add_type => 1};
get_attr_add_type({1, 3, 23}) -> #{add_type => 1};
get_attr_add_type({1, 3, 24}) -> #{add_type => 1};
get_attr_add_type({1, 3, 25}) -> #{add_type => 1};
get_attr_add_type({1, 3, 26}) -> #{add_type => 1};
get_attr_add_type({1, 3, 27}) -> #{add_type => 1};
get_attr_add_type({1, 3, 28}) -> #{add_type => 1};
get_attr_add_type({1, 3, 29}) -> #{add_type => 1};
get_attr_add_type({1, 3, 30}) -> #{add_type => 1};
get_attr_add_type({1, 3, 31}) -> #{add_type => 1};
get_attr_add_type({1, 3, 32}) -> #{add_type => 1};
get_attr_add_type({1, 3, 33}) -> #{add_type => 1};
get_attr_add_type({1, 3, 34}) -> #{add_type => 1};
get_attr_add_type({1, 3, 35}) -> #{add_type => 1};
get_attr_add_type({1, 3, 36}) -> #{add_type => 1};
get_attr_add_type({1, 3, 37}) -> #{add_type => 1};
get_attr_add_type({1, 3, 38}) -> #{add_type => 1};
get_attr_add_type({1, 3, 39}) -> #{add_type => 1};
get_attr_add_type({1, 3, 40}) -> #{add_type => 1};
get_attr_add_type({1, 4, 1}) -> #{add_type => 1};
get_attr_add_type({1, 4, 2}) -> #{add_type => 1};
get_attr_add_type({1, 4, 3}) -> #{add_type => 1};
get_attr_add_type({1, 4, 4}) -> #{add_type => 1};
get_attr_add_type({1, 4, 5}) -> #{add_type => 1};
get_attr_add_type({1, 4, 6}) -> #{add_type => 1};
get_attr_add_type({1, 4, 7}) -> #{add_type => 1};
get_attr_add_type({1, 4, 8}) -> #{add_type => 1};
get_attr_add_type({1, 4, 9}) -> #{add_type => 1};
get_attr_add_type({1, 4, 10}) -> #{add_type => 1};
get_attr_add_type({1, 4, 11}) -> #{add_type => 1};
get_attr_add_type({1, 4, 12}) -> #{add_type => 1};
get_attr_add_type({1, 4, 13}) -> #{add_type => 1};
get_attr_add_type({1, 4, 14}) -> #{add_type => 1};
get_attr_add_type({1, 4, 15}) -> #{add_type => 1};
get_attr_add_type({1, 4, 16}) -> #{add_type => 1};
get_attr_add_type({1, 4, 17}) -> #{add_type => 1};
get_attr_add_type({1, 4, 18}) -> #{add_type => 1};
get_attr_add_type({1, 4, 19}) -> #{add_type => 1};
get_attr_add_type({1, 4, 20}) -> #{add_type => 1};
get_attr_add_type({1, 4, 21}) -> #{add_type => 1};
get_attr_add_type({1, 4, 22}) -> #{add_type => 1};
get_attr_add_type({1, 4, 23}) -> #{add_type => 1};
get_attr_add_type({1, 4, 24}) -> #{add_type => 1};
get_attr_add_type({1, 4, 25}) -> #{add_type => 1};
get_attr_add_type({1, 4, 26}) -> #{add_type => 1};
get_attr_add_type({1, 4, 27}) -> #{add_type => 1};
get_attr_add_type({1, 4, 28}) -> #{add_type => 1};
get_attr_add_type({1, 4, 29}) -> #{add_type => 1};
get_attr_add_type({1, 4, 30}) -> #{add_type => 1};
get_attr_add_type({1, 4, 31}) -> #{add_type => 1};
get_attr_add_type({1, 4, 32}) -> #{add_type => 1};
get_attr_add_type({1, 4, 33}) -> #{add_type => 1};
get_attr_add_type({1, 4, 34}) -> #{add_type => 1};
get_attr_add_type({1, 4, 35}) -> #{add_type => 1};
get_attr_add_type({1, 4, 36}) -> #{add_type => 1};
get_attr_add_type({1, 4, 37}) -> #{add_type => 1};
get_attr_add_type({1, 4, 38}) -> #{add_type => 1};
get_attr_add_type({1, 4, 39}) -> #{add_type => 1};
get_attr_add_type({1, 4, 40}) -> #{add_type => 1};
get_attr_add_type({1, 5, 1}) -> #{add_type => 1};
get_attr_add_type({1, 5, 2}) -> #{add_type => 1};
get_attr_add_type({1, 5, 3}) -> #{add_type => 1};
get_attr_add_type({1, 5, 4}) -> #{add_type => 1};
get_attr_add_type({1, 5, 5}) -> #{add_type => 1};
get_attr_add_type({1, 5, 6}) -> #{add_type => 1};
get_attr_add_type({1, 5, 7}) -> #{add_type => 1};
get_attr_add_type({1, 5, 8}) -> #{add_type => 1};
get_attr_add_type({1, 5, 9}) -> #{add_type => 1};
get_attr_add_type({1, 5, 10}) -> #{add_type => 1};
get_attr_add_type({1, 5, 11}) -> #{add_type => 1};
get_attr_add_type({1, 5, 12}) -> #{add_type => 1};
get_attr_add_type({1, 5, 13}) -> #{add_type => 1};
get_attr_add_type({1, 5, 14}) -> #{add_type => 1};
get_attr_add_type({1, 5, 15}) -> #{add_type => 1};
get_attr_add_type({1, 5, 16}) -> #{add_type => 1};
get_attr_add_type({1, 5, 17}) -> #{add_type => 1};
get_attr_add_type({1, 5, 18}) -> #{add_type => 1};
get_attr_add_type({1, 5, 19}) -> #{add_type => 1};
get_attr_add_type({1, 5, 20}) -> #{add_type => 1};
get_attr_add_type({1, 5, 21}) -> #{add_type => 1};
get_attr_add_type({1, 5, 22}) -> #{add_type => 1};
get_attr_add_type({1, 5, 23}) -> #{add_type => 1};
get_attr_add_type({1, 5, 24}) -> #{add_type => 1};
get_attr_add_type({1, 5, 25}) -> #{add_type => 1};
get_attr_add_type({1, 5, 26}) -> #{add_type => 1};
get_attr_add_type({1, 5, 27}) -> #{add_type => 1};
get_attr_add_type({1, 5, 28}) -> #{add_type => 1};
get_attr_add_type({1, 5, 29}) -> #{add_type => 1};
get_attr_add_type({1, 5, 30}) -> #{add_type => 1};
get_attr_add_type({1, 5, 31}) -> #{add_type => 1};
get_attr_add_type({1, 5, 32}) -> #{add_type => 1};
get_attr_add_type({1, 5, 33}) -> #{add_type => 1};
get_attr_add_type({1, 5, 34}) -> #{add_type => 1};
get_attr_add_type({1, 5, 35}) -> #{add_type => 1};
get_attr_add_type({1, 5, 36}) -> #{add_type => 1};
get_attr_add_type({1, 5, 37}) -> #{add_type => 1};
get_attr_add_type({1, 5, 38}) -> #{add_type => 1};
get_attr_add_type({1, 5, 39}) -> #{add_type => 1};
get_attr_add_type({1, 5, 40}) -> #{add_type => 1};
get_attr_add_type({1, 6, 1}) -> #{add_type => 1};
get_attr_add_type({1, 6, 2}) -> #{add_type => 1};
get_attr_add_type({1, 6, 3}) -> #{add_type => 1};
get_attr_add_type({1, 6, 4}) -> #{add_type => 1};
get_attr_add_type({1, 6, 5}) -> #{add_type => 1};
get_attr_add_type({1, 6, 6}) -> #{add_type => 1};
get_attr_add_type({1, 6, 7}) -> #{add_type => 1};
get_attr_add_type({1, 6, 8}) -> #{add_type => 1};
get_attr_add_type({1, 6, 9}) -> #{add_type => 1};
get_attr_add_type({1, 6, 10}) -> #{add_type => 1};
get_attr_add_type({1, 6, 11}) -> #{add_type => 1};
get_attr_add_type({1, 6, 12}) -> #{add_type => 1};
get_attr_add_type({1, 6, 13}) -> #{add_type => 1};
get_attr_add_type({1, 6, 14}) -> #{add_type => 1};
get_attr_add_type({1, 6, 15}) -> #{add_type => 1};
get_attr_add_type({1, 6, 16}) -> #{add_type => 1};
get_attr_add_type({1, 6, 17}) -> #{add_type => 1};
get_attr_add_type({1, 6, 18}) -> #{add_type => 1};
get_attr_add_type({1, 6, 19}) -> #{add_type => 1};
get_attr_add_type({1, 6, 20}) -> #{add_type => 1};
get_attr_add_type({1, 6, 21}) -> #{add_type => 1};
get_attr_add_type({1, 6, 22}) -> #{add_type => 1};
get_attr_add_type({1, 6, 23}) -> #{add_type => 1};
get_attr_add_type({1, 6, 24}) -> #{add_type => 1};
get_attr_add_type({1, 6, 25}) -> #{add_type => 1};
get_attr_add_type({1, 6, 26}) -> #{add_type => 1};
get_attr_add_type({1, 6, 27}) -> #{add_type => 1};
get_attr_add_type({1, 6, 28}) -> #{add_type => 1};
get_attr_add_type({1, 6, 29}) -> #{add_type => 1};
get_attr_add_type({1, 6, 30}) -> #{add_type => 1};
get_attr_add_type({1, 6, 31}) -> #{add_type => 1};
get_attr_add_type({1, 6, 32}) -> #{add_type => 1};
get_attr_add_type({1, 6, 33}) -> #{add_type => 1};
get_attr_add_type({1, 6, 34}) -> #{add_type => 1};
get_attr_add_type({1, 6, 35}) -> #{add_type => 1};
get_attr_add_type({1, 6, 36}) -> #{add_type => 1};
get_attr_add_type({1, 6, 37}) -> #{add_type => 1};
get_attr_add_type({1, 6, 38}) -> #{add_type => 1};
get_attr_add_type({1, 6, 39}) -> #{add_type => 1};
get_attr_add_type({1, 6, 40}) -> #{add_type => 1};
get_attr_add_type({1, 7, 1}) -> #{add_type => 1};
get_attr_add_type({1, 7, 2}) -> #{add_type => 1};
get_attr_add_type({1, 7, 3}) -> #{add_type => 1};
get_attr_add_type({1, 7, 4}) -> #{add_type => 1};
get_attr_add_type({1, 7, 5}) -> #{add_type => 1};
get_attr_add_type({1, 7, 6}) -> #{add_type => 1};
get_attr_add_type({1, 7, 7}) -> #{add_type => 1};
get_attr_add_type({1, 7, 8}) -> #{add_type => 1};
get_attr_add_type({1, 7, 9}) -> #{add_type => 1};
get_attr_add_type({1, 7, 10}) -> #{add_type => 1};
get_attr_add_type({1, 7, 11}) -> #{add_type => 1};
get_attr_add_type({1, 7, 12}) -> #{add_type => 1};
get_attr_add_type({1, 7, 13}) -> #{add_type => 1};
get_attr_add_type({1, 7, 14}) -> #{add_type => 1};
get_attr_add_type({1, 7, 15}) -> #{add_type => 1};
get_attr_add_type({1, 7, 16}) -> #{add_type => 1};
get_attr_add_type({1, 7, 17}) -> #{add_type => 1};
get_attr_add_type({1, 7, 18}) -> #{add_type => 1};
get_attr_add_type({1, 7, 19}) -> #{add_type => 1};
get_attr_add_type({1, 7, 20}) -> #{add_type => 1};
get_attr_add_type({1, 7, 21}) -> #{add_type => 1};
get_attr_add_type({1, 7, 22}) -> #{add_type => 1};
get_attr_add_type({1, 7, 23}) -> #{add_type => 1};
get_attr_add_type({1, 7, 24}) -> #{add_type => 1};
get_attr_add_type({1, 7, 25}) -> #{add_type => 1};
get_attr_add_type({1, 7, 26}) -> #{add_type => 1};
get_attr_add_type({1, 7, 27}) -> #{add_type => 1};
get_attr_add_type({1, 7, 28}) -> #{add_type => 1};
get_attr_add_type({1, 7, 29}) -> #{add_type => 1};
get_attr_add_type({1, 7, 30}) -> #{add_type => 1};
get_attr_add_type({1, 7, 31}) -> #{add_type => 1};
get_attr_add_type({1, 7, 32}) -> #{add_type => 1};
get_attr_add_type({1, 7, 33}) -> #{add_type => 1};
get_attr_add_type({1, 7, 34}) -> #{add_type => 1};
get_attr_add_type({1, 7, 35}) -> #{add_type => 1};
get_attr_add_type({1, 7, 36}) -> #{add_type => 1};
get_attr_add_type({1, 7, 37}) -> #{add_type => 1};
get_attr_add_type({1, 7, 38}) -> #{add_type => 1};
get_attr_add_type({1, 7, 39}) -> #{add_type => 1};
get_attr_add_type({1, 7, 40}) -> #{add_type => 1};
get_attr_add_type({2, 1, 1}) -> #{add_type => 1};
get_attr_add_type({2, 1, 2}) -> #{add_type => 1};
get_attr_add_type({2, 1, 3}) -> #{add_type => 1};
get_attr_add_type({2, 1, 4}) -> #{add_type => 1};
get_attr_add_type({2, 1, 5}) -> #{add_type => 1};
get_attr_add_type({2, 1, 6}) -> #{add_type => 1};
get_attr_add_type({2, 1, 7}) -> #{add_type => 1};
get_attr_add_type({2, 1, 8}) -> #{add_type => 1};
get_attr_add_type({2, 1, 9}) -> #{add_type => 1};
get_attr_add_type({2, 1, 10}) -> #{add_type => 1};
get_attr_add_type({2, 1, 11}) -> #{add_type => 1};
get_attr_add_type({2, 1, 12}) -> #{add_type => 1};
get_attr_add_type({2, 1, 13}) -> #{add_type => 1};
get_attr_add_type({2, 1, 14}) -> #{add_type => 1};
get_attr_add_type({2, 1, 15}) -> #{add_type => 1};
get_attr_add_type({2, 1, 16}) -> #{add_type => 1};
get_attr_add_type({2, 1, 17}) -> #{add_type => 1};
get_attr_add_type({2, 1, 18}) -> #{add_type => 1};
get_attr_add_type({2, 1, 19}) -> #{add_type => 1};
get_attr_add_type({2, 1, 20}) -> #{add_type => 1};
get_attr_add_type({2, 1, 21}) -> #{add_type => 1};
get_attr_add_type({2, 1, 22}) -> #{add_type => 1};
get_attr_add_type({2, 1, 23}) -> #{add_type => 1};
get_attr_add_type({2, 1, 24}) -> #{add_type => 1};
get_attr_add_type({2, 1, 25}) -> #{add_type => 1};
get_attr_add_type({2, 1, 26}) -> #{add_type => 1};
get_attr_add_type({2, 1, 27}) -> #{add_type => 1};
get_attr_add_type({2, 1, 28}) -> #{add_type => 1};
get_attr_add_type({2, 1, 29}) -> #{add_type => 1};
get_attr_add_type({2, 1, 30}) -> #{add_type => 1};
get_attr_add_type({2, 1, 31}) -> #{add_type => 1};
get_attr_add_type({2, 1, 32}) -> #{add_type => 1};
get_attr_add_type({2, 1, 33}) -> #{add_type => 1};
get_attr_add_type({2, 1, 34}) -> #{add_type => 1};
get_attr_add_type({2, 1, 35}) -> #{add_type => 1};
get_attr_add_type({2, 1, 36}) -> #{add_type => 1};
get_attr_add_type({2, 1, 37}) -> #{add_type => 1};
get_attr_add_type({2, 1, 38}) -> #{add_type => 1};
get_attr_add_type({2, 1, 39}) -> #{add_type => 1};
get_attr_add_type({2, 1, 40}) -> #{add_type => 1};
get_attr_add_type({2, 1, 41}) -> #{add_type => 1};
get_attr_add_type({2, 1, 42}) -> #{add_type => 1};
get_attr_add_type({2, 1, 43}) -> #{add_type => 1};
get_attr_add_type({2, 1, 44}) -> #{add_type => 1};
get_attr_add_type({2, 1, 45}) -> #{add_type => 1};
get_attr_add_type({2, 2, 1}) -> #{add_type => 1};
get_attr_add_type({2, 2, 2}) -> #{add_type => 1};
get_attr_add_type({2, 2, 3}) -> #{add_type => 1};
get_attr_add_type({2, 2, 4}) -> #{add_type => 1};
get_attr_add_type({2, 2, 5}) -> #{add_type => 1};
get_attr_add_type({2, 2, 6}) -> #{add_type => 1};
get_attr_add_type({2, 2, 7}) -> #{add_type => 1};
get_attr_add_type({2, 2, 8}) -> #{add_type => 1};
get_attr_add_type({2, 2, 9}) -> #{add_type => 1};
get_attr_add_type({2, 2, 10}) -> #{add_type => 1};
get_attr_add_type({2, 2, 11}) -> #{add_type => 1};
get_attr_add_type({2, 2, 12}) -> #{add_type => 1};
get_attr_add_type({2, 2, 13}) -> #{add_type => 1};
get_attr_add_type({2, 2, 14}) -> #{add_type => 1};
get_attr_add_type({2, 2, 15}) -> #{add_type => 1};
get_attr_add_type({2, 2, 16}) -> #{add_type => 1};
get_attr_add_type({2, 2, 17}) -> #{add_type => 1};
get_attr_add_type({2, 2, 18}) -> #{add_type => 1};
get_attr_add_type({2, 2, 19}) -> #{add_type => 1};
get_attr_add_type({2, 2, 20}) -> #{add_type => 1};
get_attr_add_type({2, 2, 21}) -> #{add_type => 1};
get_attr_add_type({2, 2, 22}) -> #{add_type => 1};
get_attr_add_type({2, 2, 23}) -> #{add_type => 1};
get_attr_add_type({2, 2, 24}) -> #{add_type => 1};
get_attr_add_type({2, 2, 25}) -> #{add_type => 1};
get_attr_add_type({2, 2, 26}) -> #{add_type => 1};
get_attr_add_type({2, 2, 27}) -> #{add_type => 1};
get_attr_add_type({2, 2, 28}) -> #{add_type => 1};
get_attr_add_type({2, 2, 29}) -> #{add_type => 1};
get_attr_add_type({2, 2, 30}) -> #{add_type => 1};
get_attr_add_type({2, 2, 31}) -> #{add_type => 1};
get_attr_add_type({2, 2, 32}) -> #{add_type => 1};
get_attr_add_type({2, 2, 33}) -> #{add_type => 1};
get_attr_add_type({2, 2, 34}) -> #{add_type => 1};
get_attr_add_type({2, 2, 35}) -> #{add_type => 1};
get_attr_add_type({2, 2, 36}) -> #{add_type => 1};
get_attr_add_type({2, 2, 37}) -> #{add_type => 1};
get_attr_add_type({2, 2, 38}) -> #{add_type => 1};
get_attr_add_type({2, 2, 39}) -> #{add_type => 1};
get_attr_add_type({2, 2, 40}) -> #{add_type => 1};
get_attr_add_type({2, 2, 41}) -> #{add_type => 1};
get_attr_add_type({2, 2, 42}) -> #{add_type => 1};
get_attr_add_type({2, 2, 43}) -> #{add_type => 1};
get_attr_add_type({2, 2, 44}) -> #{add_type => 1};
get_attr_add_type({2, 2, 45}) -> #{add_type => 1};
get_attr_add_type({2, 3, 1}) -> #{add_type => 1};
get_attr_add_type({2, 3, 2}) -> #{add_type => 1};
get_attr_add_type({2, 3, 3}) -> #{add_type => 1};
get_attr_add_type({2, 3, 4}) -> #{add_type => 1};
get_attr_add_type({2, 3, 5}) -> #{add_type => 1};
get_attr_add_type({2, 3, 6}) -> #{add_type => 1};
get_attr_add_type({2, 3, 7}) -> #{add_type => 1};
get_attr_add_type({2, 3, 8}) -> #{add_type => 1};
get_attr_add_type({2, 3, 9}) -> #{add_type => 1};
get_attr_add_type({2, 3, 10}) -> #{add_type => 1};
get_attr_add_type({2, 3, 11}) -> #{add_type => 1};
get_attr_add_type({2, 3, 12}) -> #{add_type => 1};
get_attr_add_type({2, 3, 13}) -> #{add_type => 1};
get_attr_add_type({2, 3, 14}) -> #{add_type => 1};
get_attr_add_type({2, 3, 15}) -> #{add_type => 1};
get_attr_add_type({2, 3, 16}) -> #{add_type => 1};
get_attr_add_type({2, 3, 17}) -> #{add_type => 1};
get_attr_add_type({2, 3, 18}) -> #{add_type => 1};
get_attr_add_type({2, 3, 19}) -> #{add_type => 1};
get_attr_add_type({2, 3, 20}) -> #{add_type => 1};
get_attr_add_type({2, 3, 21}) -> #{add_type => 1};
get_attr_add_type({2, 3, 22}) -> #{add_type => 1};
get_attr_add_type({2, 3, 23}) -> #{add_type => 1};
get_attr_add_type({2, 3, 24}) -> #{add_type => 1};
get_attr_add_type({2, 3, 25}) -> #{add_type => 1};
get_attr_add_type({2, 3, 26}) -> #{add_type => 1};
get_attr_add_type({2, 3, 27}) -> #{add_type => 1};
get_attr_add_type({2, 3, 28}) -> #{add_type => 1};
get_attr_add_type({2, 3, 29}) -> #{add_type => 1};
get_attr_add_type({2, 3, 30}) -> #{add_type => 1};
get_attr_add_type({2, 3, 31}) -> #{add_type => 1};
get_attr_add_type({2, 3, 32}) -> #{add_type => 1};
get_attr_add_type({2, 3, 33}) -> #{add_type => 1};
get_attr_add_type({2, 3, 34}) -> #{add_type => 1};
get_attr_add_type({2, 3, 35}) -> #{add_type => 1};
get_attr_add_type({2, 3, 36}) -> #{add_type => 1};
get_attr_add_type({2, 3, 37}) -> #{add_type => 1};
get_attr_add_type({2, 3, 38}) -> #{add_type => 1};
get_attr_add_type({2, 3, 39}) -> #{add_type => 1};
get_attr_add_type({2, 3, 40}) -> #{add_type => 1};
get_attr_add_type({2, 3, 41}) -> #{add_type => 1};
get_attr_add_type({2, 3, 42}) -> #{add_type => 1};
get_attr_add_type({2, 3, 43}) -> #{add_type => 1};
get_attr_add_type({2, 3, 44}) -> #{add_type => 1};
get_attr_add_type({2, 3, 45}) -> #{add_type => 1};
get_attr_add_type({2, 4, 1}) -> #{add_type => 1};
get_attr_add_type({2, 4, 2}) -> #{add_type => 1};
get_attr_add_type({2, 4, 3}) -> #{add_type => 1};
get_attr_add_type({2, 4, 4}) -> #{add_type => 1};
get_attr_add_type({2, 4, 5}) -> #{add_type => 1};
get_attr_add_type({2, 4, 6}) -> #{add_type => 1};
get_attr_add_type({2, 4, 7}) -> #{add_type => 1};
get_attr_add_type({2, 4, 8}) -> #{add_type => 1};
get_attr_add_type({2, 4, 9}) -> #{add_type => 1};
get_attr_add_type({2, 4, 10}) -> #{add_type => 1};
get_attr_add_type({2, 4, 11}) -> #{add_type => 1};
get_attr_add_type({2, 4, 12}) -> #{add_type => 1};
get_attr_add_type({2, 4, 13}) -> #{add_type => 1};
get_attr_add_type({2, 4, 14}) -> #{add_type => 1};
get_attr_add_type({2, 4, 15}) -> #{add_type => 1};
get_attr_add_type({2, 4, 16}) -> #{add_type => 1};
get_attr_add_type({2, 4, 17}) -> #{add_type => 1};
get_attr_add_type({2, 4, 18}) -> #{add_type => 1};
get_attr_add_type({2, 4, 19}) -> #{add_type => 1};
get_attr_add_type({2, 4, 20}) -> #{add_type => 1};
get_attr_add_type({2, 4, 21}) -> #{add_type => 1};
get_attr_add_type({2, 4, 22}) -> #{add_type => 1};
get_attr_add_type({2, 4, 23}) -> #{add_type => 1};
get_attr_add_type({2, 4, 24}) -> #{add_type => 1};
get_attr_add_type({2, 4, 25}) -> #{add_type => 1};
get_attr_add_type({2, 4, 26}) -> #{add_type => 1};
get_attr_add_type({2, 4, 27}) -> #{add_type => 1};
get_attr_add_type({2, 4, 28}) -> #{add_type => 1};
get_attr_add_type({2, 4, 29}) -> #{add_type => 1};
get_attr_add_type({2, 4, 30}) -> #{add_type => 1};
get_attr_add_type({2, 4, 31}) -> #{add_type => 1};
get_attr_add_type({2, 4, 32}) -> #{add_type => 1};
get_attr_add_type({2, 4, 33}) -> #{add_type => 1};
get_attr_add_type({2, 4, 34}) -> #{add_type => 1};
get_attr_add_type({2, 4, 35}) -> #{add_type => 1};
get_attr_add_type({2, 4, 36}) -> #{add_type => 1};
get_attr_add_type({2, 4, 37}) -> #{add_type => 1};
get_attr_add_type({2, 4, 38}) -> #{add_type => 1};
get_attr_add_type({2, 4, 39}) -> #{add_type => 1};
get_attr_add_type({2, 4, 40}) -> #{add_type => 1};
get_attr_add_type({2, 4, 41}) -> #{add_type => 1};
get_attr_add_type({2, 4, 42}) -> #{add_type => 1};
get_attr_add_type({2, 4, 43}) -> #{add_type => 1};
get_attr_add_type({2, 4, 44}) -> #{add_type => 1};
get_attr_add_type({2, 4, 45}) -> #{add_type => 1};
get_attr_add_type({2, 5, 1}) -> #{add_type => 1};
get_attr_add_type({2, 5, 2}) -> #{add_type => 1};
get_attr_add_type({2, 5, 3}) -> #{add_type => 1};
get_attr_add_type({2, 5, 4}) -> #{add_type => 1};
get_attr_add_type({2, 5, 5}) -> #{add_type => 1};
get_attr_add_type({2, 5, 6}) -> #{add_type => 1};
get_attr_add_type({2, 5, 7}) -> #{add_type => 1};
get_attr_add_type({2, 5, 8}) -> #{add_type => 1};
get_attr_add_type({2, 5, 9}) -> #{add_type => 1};
get_attr_add_type({2, 5, 10}) -> #{add_type => 1};
get_attr_add_type({2, 5, 11}) -> #{add_type => 1};
get_attr_add_type({2, 5, 12}) -> #{add_type => 1};
get_attr_add_type({2, 5, 13}) -> #{add_type => 1};
get_attr_add_type({2, 5, 14}) -> #{add_type => 1};
get_attr_add_type({2, 5, 15}) -> #{add_type => 1};
get_attr_add_type({2, 5, 16}) -> #{add_type => 1};
get_attr_add_type({2, 5, 17}) -> #{add_type => 1};
get_attr_add_type({2, 5, 18}) -> #{add_type => 1};
get_attr_add_type({2, 5, 19}) -> #{add_type => 1};
get_attr_add_type({2, 5, 20}) -> #{add_type => 1};
get_attr_add_type({2, 5, 21}) -> #{add_type => 1};
get_attr_add_type({2, 5, 22}) -> #{add_type => 1};
get_attr_add_type({2, 5, 23}) -> #{add_type => 1};
get_attr_add_type({2, 5, 24}) -> #{add_type => 1};
get_attr_add_type({2, 5, 25}) -> #{add_type => 1};
get_attr_add_type({2, 5, 26}) -> #{add_type => 1};
get_attr_add_type({2, 5, 27}) -> #{add_type => 1};
get_attr_add_type({2, 5, 28}) -> #{add_type => 1};
get_attr_add_type({2, 5, 29}) -> #{add_type => 1};
get_attr_add_type({2, 5, 30}) -> #{add_type => 1};
get_attr_add_type({2, 5, 31}) -> #{add_type => 1};
get_attr_add_type({2, 5, 32}) -> #{add_type => 1};
get_attr_add_type({2, 5, 33}) -> #{add_type => 1};
get_attr_add_type({2, 5, 34}) -> #{add_type => 1};
get_attr_add_type({2, 5, 35}) -> #{add_type => 1};
get_attr_add_type({2, 5, 36}) -> #{add_type => 1};
get_attr_add_type({2, 5, 37}) -> #{add_type => 1};
get_attr_add_type({2, 5, 38}) -> #{add_type => 1};
get_attr_add_type({2, 5, 39}) -> #{add_type => 1};
get_attr_add_type({2, 5, 40}) -> #{add_type => 1};
get_attr_add_type({2, 5, 41}) -> #{add_type => 1};
get_attr_add_type({2, 5, 42}) -> #{add_type => 1};
get_attr_add_type({2, 5, 43}) -> #{add_type => 1};
get_attr_add_type({2, 5, 44}) -> #{add_type => 1};
get_attr_add_type({2, 5, 45}) -> #{add_type => 1};
get_attr_add_type({2, 6, 1}) -> #{add_type => 1};
get_attr_add_type({2, 6, 2}) -> #{add_type => 1};
get_attr_add_type({2, 6, 3}) -> #{add_type => 1};
get_attr_add_type({2, 6, 4}) -> #{add_type => 1};
get_attr_add_type({2, 6, 5}) -> #{add_type => 1};
get_attr_add_type({2, 6, 6}) -> #{add_type => 1};
get_attr_add_type({2, 6, 7}) -> #{add_type => 1};
get_attr_add_type({2, 6, 8}) -> #{add_type => 1};
get_attr_add_type({2, 6, 9}) -> #{add_type => 1};
get_attr_add_type({2, 6, 10}) -> #{add_type => 1};
get_attr_add_type({2, 6, 11}) -> #{add_type => 1};
get_attr_add_type({2, 6, 12}) -> #{add_type => 1};
get_attr_add_type({2, 6, 13}) -> #{add_type => 1};
get_attr_add_type({2, 6, 14}) -> #{add_type => 1};
get_attr_add_type({2, 6, 15}) -> #{add_type => 1};
get_attr_add_type({2, 6, 16}) -> #{add_type => 1};
get_attr_add_type({2, 6, 17}) -> #{add_type => 1};
get_attr_add_type({2, 6, 18}) -> #{add_type => 1};
get_attr_add_type({2, 6, 19}) -> #{add_type => 1};
get_attr_add_type({2, 6, 20}) -> #{add_type => 1};
get_attr_add_type({2, 6, 21}) -> #{add_type => 1};
get_attr_add_type({2, 6, 22}) -> #{add_type => 1};
get_attr_add_type({2, 6, 23}) -> #{add_type => 1};
get_attr_add_type({2, 6, 24}) -> #{add_type => 1};
get_attr_add_type({2, 6, 25}) -> #{add_type => 1};
get_attr_add_type({2, 6, 26}) -> #{add_type => 1};
get_attr_add_type({2, 6, 27}) -> #{add_type => 1};
get_attr_add_type({2, 6, 28}) -> #{add_type => 1};
get_attr_add_type({2, 6, 29}) -> #{add_type => 1};
get_attr_add_type({2, 6, 30}) -> #{add_type => 1};
get_attr_add_type({2, 6, 31}) -> #{add_type => 1};
get_attr_add_type({2, 6, 32}) -> #{add_type => 1};
get_attr_add_type({2, 6, 33}) -> #{add_type => 1};
get_attr_add_type({2, 6, 34}) -> #{add_type => 1};
get_attr_add_type({2, 6, 35}) -> #{add_type => 1};
get_attr_add_type({2, 6, 36}) -> #{add_type => 1};
get_attr_add_type({2, 6, 37}) -> #{add_type => 1};
get_attr_add_type({2, 6, 38}) -> #{add_type => 1};
get_attr_add_type({2, 6, 39}) -> #{add_type => 1};
get_attr_add_type({2, 6, 40}) -> #{add_type => 1};
get_attr_add_type({2, 6, 41}) -> #{add_type => 1};
get_attr_add_type({2, 6, 42}) -> #{add_type => 1};
get_attr_add_type({2, 6, 43}) -> #{add_type => 1};
get_attr_add_type({2, 6, 44}) -> #{add_type => 1};
get_attr_add_type({2, 6, 45}) -> #{add_type => 1};
get_attr_add_type({2, 7, 1}) -> #{add_type => 1};
get_attr_add_type({2, 7, 2}) -> #{add_type => 1};
get_attr_add_type({2, 7, 3}) -> #{add_type => 1};
get_attr_add_type({2, 7, 4}) -> #{add_type => 1};
get_attr_add_type({2, 7, 5}) -> #{add_type => 1};
get_attr_add_type({2, 7, 6}) -> #{add_type => 1};
get_attr_add_type({2, 7, 7}) -> #{add_type => 1};
get_attr_add_type({2, 7, 8}) -> #{add_type => 1};
get_attr_add_type({2, 7, 9}) -> #{add_type => 1};
get_attr_add_type({2, 7, 10}) -> #{add_type => 1};
get_attr_add_type({2, 7, 11}) -> #{add_type => 1};
get_attr_add_type({2, 7, 12}) -> #{add_type => 1};
get_attr_add_type({2, 7, 13}) -> #{add_type => 1};
get_attr_add_type({2, 7, 14}) -> #{add_type => 1};
get_attr_add_type({2, 7, 15}) -> #{add_type => 1};
get_attr_add_type({2, 7, 16}) -> #{add_type => 1};
get_attr_add_type({2, 7, 17}) -> #{add_type => 1};
get_attr_add_type({2, 7, 18}) -> #{add_type => 1};
get_attr_add_type({2, 7, 19}) -> #{add_type => 1};
get_attr_add_type({2, 7, 20}) -> #{add_type => 1};
get_attr_add_type({2, 7, 21}) -> #{add_type => 1};
get_attr_add_type({2, 7, 22}) -> #{add_type => 1};
get_attr_add_type({2, 7, 23}) -> #{add_type => 1};
get_attr_add_type({2, 7, 24}) -> #{add_type => 1};
get_attr_add_type({2, 7, 25}) -> #{add_type => 1};
get_attr_add_type({2, 7, 26}) -> #{add_type => 1};
get_attr_add_type({2, 7, 27}) -> #{add_type => 1};
get_attr_add_type({2, 7, 28}) -> #{add_type => 1};
get_attr_add_type({2, 7, 29}) -> #{add_type => 1};
get_attr_add_type({2, 7, 30}) -> #{add_type => 1};
get_attr_add_type({2, 7, 31}) -> #{add_type => 1};
get_attr_add_type({2, 7, 32}) -> #{add_type => 1};
get_attr_add_type({2, 7, 33}) -> #{add_type => 1};
get_attr_add_type({2, 7, 34}) -> #{add_type => 1};
get_attr_add_type({2, 7, 35}) -> #{add_type => 1};
get_attr_add_type({2, 7, 36}) -> #{add_type => 1};
get_attr_add_type({2, 7, 37}) -> #{add_type => 1};
get_attr_add_type({2, 7, 38}) -> #{add_type => 1};
get_attr_add_type({2, 7, 39}) -> #{add_type => 1};
get_attr_add_type({2, 7, 40}) -> #{add_type => 1};
get_attr_add_type({2, 7, 41}) -> #{add_type => 1};
get_attr_add_type({2, 7, 42}) -> #{add_type => 1};
get_attr_add_type({2, 7, 43}) -> #{add_type => 1};
get_attr_add_type({2, 7, 44}) -> #{add_type => 1};
get_attr_add_type({2, 7, 45}) -> #{add_type => 1};
get_attr_add_type({3, 0, 1}) -> #{add_type => 2};
get_attr_add_type({3, 0, 2}) -> #{add_type => 2};
get_attr_add_type({3, 0, 3}) -> #{add_type => 2};
get_attr_add_type({3, 0, 4}) -> #{add_type => 2};
get_attr_add_type({3, 0, 5}) -> #{add_type => 2};
get_attr_add_type({3, 0, 6}) -> #{add_type => 2};
get_attr_add_type({3, 0, 7}) -> #{add_type => 2};
get_attr_add_type({3, 0, 8}) -> #{add_type => 2};
get_attr_add_type({3, 0, 9}) -> #{add_type => 2};
get_attr_add_type({3, 0, 10}) -> #{add_type => 2};
get_attr_add_type({3, 0, 11}) -> #{add_type => 2};
get_attr_add_type({3, 0, 12}) -> #{add_type => 2};
get_attr_add_type({3, 0, 13}) -> #{add_type => 2};
get_attr_add_type({3, 0, 14}) -> #{add_type => 2};
get_attr_add_type({3, 0, 15}) -> #{add_type => 2};
get_attr_add_type({3, 0, 16}) -> #{add_type => 2};
get_attr_add_type({3, 0, 17}) -> #{add_type => 2};
get_attr_add_type({3, 0, 18}) -> #{add_type => 2};
get_attr_add_type({3, 0, 19}) -> #{add_type => 2};
get_attr_add_type({3, 0, 20}) -> #{add_type => 2};
get_attr_add_type({3, 0, 21}) -> #{add_type => 2};
get_attr_add_type({3, 0, 22}) -> #{add_type => 2};
get_attr_add_type({3, 0, 23}) -> #{add_type => 2};
get_attr_add_type({3, 0, 24}) -> #{add_type => 2};
get_attr_add_type({3, 0, 25}) -> #{add_type => 2};
get_attr_add_type({3, 0, 26}) -> #{add_type => 2};
get_attr_add_type({3, 0, 27}) -> #{add_type => 2};
get_attr_add_type({3, 0, 28}) -> #{add_type => 2};
get_attr_add_type({3, 0, 29}) -> #{add_type => 2};
get_attr_add_type({3, 0, 30}) -> #{add_type => 2};
get_attr_add_type({3, 0, 31}) -> #{add_type => 2};
get_attr_add_type({3, 0, 32}) -> #{add_type => 2};
get_attr_add_type({3, 0, 33}) -> #{add_type => 2};
get_attr_add_type({3, 0, 34}) -> #{add_type => 2};
get_attr_add_type({3, 0, 35}) -> #{add_type => 2};
get_attr_add_type({3, 0, 36}) -> #{add_type => 2};
get_attr_add_type({3, 0, 37}) -> #{add_type => 2};
get_attr_add_type({3, 0, 38}) -> #{add_type => 2};
get_attr_add_type({3, 0, 39}) -> #{add_type => 2};
get_attr_add_type({3, 0, 40}) -> #{add_type => 2};
get_attr_add_type({3, 0, 41}) -> #{add_type => 2};
get_attr_add_type({3, 0, 42}) -> #{add_type => 2};
get_attr_add_type({3, 0, 43}) -> #{add_type => 2};
get_attr_add_type({3, 0, 44}) -> #{add_type => 2};
get_attr_add_type({3, 0, 45}) -> #{add_type => 2};
get_attr_add_type({3, 1, 1}) -> #{add_type => 2};
get_attr_add_type({3, 1, 2}) -> #{add_type => 2};
get_attr_add_type({3, 1, 3}) -> #{add_type => 2};
get_attr_add_type({3, 1, 4}) -> #{add_type => 2};
get_attr_add_type({3, 1, 5}) -> #{add_type => 2};
get_attr_add_type({3, 1, 6}) -> #{add_type => 2};
get_attr_add_type({3, 1, 7}) -> #{add_type => 2};
get_attr_add_type({3, 1, 8}) -> #{add_type => 2};
get_attr_add_type({3, 1, 9}) -> #{add_type => 2};
get_attr_add_type({3, 1, 10}) -> #{add_type => 2};
get_attr_add_type({3, 1, 11}) -> #{add_type => 2};
get_attr_add_type({3, 1, 12}) -> #{add_type => 2};
get_attr_add_type({3, 1, 13}) -> #{add_type => 2};
get_attr_add_type({3, 1, 14}) -> #{add_type => 2};
get_attr_add_type({3, 1, 15}) -> #{add_type => 2};
get_attr_add_type({3, 1, 16}) -> #{add_type => 2};
get_attr_add_type({3, 1, 17}) -> #{add_type => 2};
get_attr_add_type({3, 1, 18}) -> #{add_type => 2};
get_attr_add_type({3, 1, 19}) -> #{add_type => 2};
get_attr_add_type({3, 1, 20}) -> #{add_type => 2};
get_attr_add_type({3, 1, 21}) -> #{add_type => 2};
get_attr_add_type({3, 1, 22}) -> #{add_type => 2};
get_attr_add_type({3, 1, 23}) -> #{add_type => 2};
get_attr_add_type({3, 1, 24}) -> #{add_type => 2};
get_attr_add_type({3, 1, 25}) -> #{add_type => 2};
get_attr_add_type({3, 1, 26}) -> #{add_type => 2};
get_attr_add_type({3, 1, 27}) -> #{add_type => 2};
get_attr_add_type({3, 1, 28}) -> #{add_type => 2};
get_attr_add_type({3, 1, 29}) -> #{add_type => 2};
get_attr_add_type({3, 1, 30}) -> #{add_type => 2};
get_attr_add_type({3, 1, 31}) -> #{add_type => 2};
get_attr_add_type({3, 1, 32}) -> #{add_type => 2};
get_attr_add_type({3, 1, 33}) -> #{add_type => 2};
get_attr_add_type({3, 1, 34}) -> #{add_type => 2};
get_attr_add_type({3, 1, 35}) -> #{add_type => 2};
get_attr_add_type({3, 1, 36}) -> #{add_type => 2};
get_attr_add_type({3, 1, 37}) -> #{add_type => 2};
get_attr_add_type({3, 1, 38}) -> #{add_type => 2};
get_attr_add_type({3, 1, 39}) -> #{add_type => 2};
get_attr_add_type({3, 1, 40}) -> #{add_type => 2};
get_attr_add_type({3, 1, 41}) -> #{add_type => 2};
get_attr_add_type({3, 1, 42}) -> #{add_type => 2};
get_attr_add_type({3, 1, 43}) -> #{add_type => 2};
get_attr_add_type({3, 1, 44}) -> #{add_type => 2};
get_attr_add_type({3, 1, 45}) -> #{add_type => 2};
get_attr_add_type({3, 2, 1}) -> #{add_type => 2};
get_attr_add_type({3, 2, 2}) -> #{add_type => 2};
get_attr_add_type({3, 2, 3}) -> #{add_type => 2};
get_attr_add_type({3, 2, 4}) -> #{add_type => 2};
get_attr_add_type({3, 2, 5}) -> #{add_type => 2};
get_attr_add_type({3, 2, 6}) -> #{add_type => 2};
get_attr_add_type({3, 2, 7}) -> #{add_type => 2};
get_attr_add_type({3, 2, 8}) -> #{add_type => 2};
get_attr_add_type({3, 2, 9}) -> #{add_type => 2};
get_attr_add_type({3, 2, 10}) -> #{add_type => 2};
get_attr_add_type({3, 2, 11}) -> #{add_type => 2};
get_attr_add_type({3, 2, 12}) -> #{add_type => 2};
get_attr_add_type({3, 2, 13}) -> #{add_type => 2};
get_attr_add_type({3, 2, 14}) -> #{add_type => 2};
get_attr_add_type({3, 2, 15}) -> #{add_type => 2};
get_attr_add_type({3, 2, 16}) -> #{add_type => 2};
get_attr_add_type({3, 2, 17}) -> #{add_type => 2};
get_attr_add_type({3, 2, 18}) -> #{add_type => 2};
get_attr_add_type({3, 2, 19}) -> #{add_type => 2};
get_attr_add_type({3, 2, 20}) -> #{add_type => 2};
get_attr_add_type({3, 2, 21}) -> #{add_type => 2};
get_attr_add_type({3, 2, 22}) -> #{add_type => 2};
get_attr_add_type({3, 2, 23}) -> #{add_type => 2};
get_attr_add_type({3, 2, 24}) -> #{add_type => 2};
get_attr_add_type({3, 2, 25}) -> #{add_type => 2};
get_attr_add_type({3, 2, 26}) -> #{add_type => 2};
get_attr_add_type({3, 2, 27}) -> #{add_type => 2};
get_attr_add_type({3, 2, 28}) -> #{add_type => 2};
get_attr_add_type({3, 2, 29}) -> #{add_type => 2};
get_attr_add_type({3, 2, 30}) -> #{add_type => 2};
get_attr_add_type({3, 2, 31}) -> #{add_type => 2};
get_attr_add_type({3, 2, 32}) -> #{add_type => 2};
get_attr_add_type({3, 2, 33}) -> #{add_type => 2};
get_attr_add_type({3, 2, 34}) -> #{add_type => 2};
get_attr_add_type({3, 2, 35}) -> #{add_type => 2};
get_attr_add_type({3, 2, 36}) -> #{add_type => 2};
get_attr_add_type({3, 2, 37}) -> #{add_type => 2};
get_attr_add_type({3, 2, 38}) -> #{add_type => 2};
get_attr_add_type({3, 2, 39}) -> #{add_type => 2};
get_attr_add_type({3, 2, 40}) -> #{add_type => 2};
get_attr_add_type({3, 2, 41}) -> #{add_type => 2};
get_attr_add_type({3, 2, 42}) -> #{add_type => 2};
get_attr_add_type({3, 2, 43}) -> #{add_type => 2};
get_attr_add_type({3, 2, 44}) -> #{add_type => 2};
get_attr_add_type({3, 2, 45}) -> #{add_type => 2};
get_attr_add_type({3, 3, 1}) -> #{add_type => 2};
get_attr_add_type({3, 3, 2}) -> #{add_type => 2};
get_attr_add_type({3, 3, 3}) -> #{add_type => 2};
get_attr_add_type({3, 3, 4}) -> #{add_type => 2};
get_attr_add_type({3, 3, 5}) -> #{add_type => 2};
get_attr_add_type({3, 3, 6}) -> #{add_type => 2};
get_attr_add_type({3, 3, 7}) -> #{add_type => 2};
get_attr_add_type({3, 3, 8}) -> #{add_type => 2};
get_attr_add_type({3, 3, 9}) -> #{add_type => 2};
get_attr_add_type({3, 3, 10}) -> #{add_type => 2};
get_attr_add_type({3, 3, 11}) -> #{add_type => 2};
get_attr_add_type({3, 3, 12}) -> #{add_type => 2};
get_attr_add_type({3, 3, 13}) -> #{add_type => 2};
get_attr_add_type({3, 3, 14}) -> #{add_type => 2};
get_attr_add_type({3, 3, 15}) -> #{add_type => 2};
get_attr_add_type({3, 3, 16}) -> #{add_type => 2};
get_attr_add_type({3, 3, 17}) -> #{add_type => 2};
get_attr_add_type({3, 3, 18}) -> #{add_type => 2};
get_attr_add_type({3, 3, 19}) -> #{add_type => 2};
get_attr_add_type({3, 3, 20}) -> #{add_type => 2};
get_attr_add_type({3, 3, 21}) -> #{add_type => 2};
get_attr_add_type({3, 3, 22}) -> #{add_type => 2};
get_attr_add_type({3, 3, 23}) -> #{add_type => 2};
get_attr_add_type({3, 3, 24}) -> #{add_type => 2};
get_attr_add_type({3, 3, 25}) -> #{add_type => 2};
get_attr_add_type({3, 3, 26}) -> #{add_type => 2};
get_attr_add_type({3, 3, 27}) -> #{add_type => 2};
get_attr_add_type({3, 3, 28}) -> #{add_type => 2};
get_attr_add_type({3, 3, 29}) -> #{add_type => 2};
get_attr_add_type({3, 3, 30}) -> #{add_type => 2};
get_attr_add_type({3, 3, 31}) -> #{add_type => 2};
get_attr_add_type({3, 3, 32}) -> #{add_type => 2};
get_attr_add_type({3, 3, 33}) -> #{add_type => 2};
get_attr_add_type({3, 3, 34}) -> #{add_type => 2};
get_attr_add_type({3, 3, 35}) -> #{add_type => 2};
get_attr_add_type({3, 3, 36}) -> #{add_type => 2};
get_attr_add_type({3, 3, 37}) -> #{add_type => 2};
get_attr_add_type({3, 3, 38}) -> #{add_type => 2};
get_attr_add_type({3, 3, 39}) -> #{add_type => 2};
get_attr_add_type({3, 3, 40}) -> #{add_type => 2};
get_attr_add_type({3, 3, 41}) -> #{add_type => 2};
get_attr_add_type({3, 3, 42}) -> #{add_type => 2};
get_attr_add_type({3, 3, 43}) -> #{add_type => 2};
get_attr_add_type({3, 3, 44}) -> #{add_type => 2};
get_attr_add_type({3, 3, 45}) -> #{add_type => 2};
get_attr_add_type({3, 4, 1}) -> #{add_type => 2};
get_attr_add_type({3, 4, 2}) -> #{add_type => 2};
get_attr_add_type({3, 4, 3}) -> #{add_type => 2};
get_attr_add_type({3, 4, 4}) -> #{add_type => 2};
get_attr_add_type({3, 4, 5}) -> #{add_type => 2};
get_attr_add_type({3, 4, 6}) -> #{add_type => 2};
get_attr_add_type({3, 4, 7}) -> #{add_type => 2};
get_attr_add_type({3, 4, 8}) -> #{add_type => 2};
get_attr_add_type({3, 4, 9}) -> #{add_type => 2};
get_attr_add_type({3, 4, 10}) -> #{add_type => 2};
get_attr_add_type({3, 4, 11}) -> #{add_type => 2};
get_attr_add_type({3, 4, 12}) -> #{add_type => 2};
get_attr_add_type({3, 4, 13}) -> #{add_type => 2};
get_attr_add_type({3, 4, 14}) -> #{add_type => 2};
get_attr_add_type({3, 4, 15}) -> #{add_type => 2};
get_attr_add_type({3, 4, 16}) -> #{add_type => 2};
get_attr_add_type({3, 4, 17}) -> #{add_type => 2};
get_attr_add_type({3, 4, 18}) -> #{add_type => 2};
get_attr_add_type({3, 4, 19}) -> #{add_type => 2};
get_attr_add_type({3, 4, 20}) -> #{add_type => 2};
get_attr_add_type({3, 4, 21}) -> #{add_type => 2};
get_attr_add_type({3, 4, 22}) -> #{add_type => 2};
get_attr_add_type({3, 4, 23}) -> #{add_type => 2};
get_attr_add_type({3, 4, 24}) -> #{add_type => 2};
get_attr_add_type({3, 4, 25}) -> #{add_type => 2};
get_attr_add_type({3, 4, 26}) -> #{add_type => 2};
get_attr_add_type({3, 4, 27}) -> #{add_type => 2};
get_attr_add_type({3, 4, 28}) -> #{add_type => 2};
get_attr_add_type({3, 4, 29}) -> #{add_type => 2};
get_attr_add_type({3, 4, 30}) -> #{add_type => 2};
get_attr_add_type({3, 4, 31}) -> #{add_type => 2};
get_attr_add_type({3, 4, 32}) -> #{add_type => 2};
get_attr_add_type({3, 4, 33}) -> #{add_type => 2};
get_attr_add_type({3, 4, 34}) -> #{add_type => 2};
get_attr_add_type({3, 4, 35}) -> #{add_type => 2};
get_attr_add_type({3, 4, 36}) -> #{add_type => 2};
get_attr_add_type({3, 4, 37}) -> #{add_type => 2};
get_attr_add_type({3, 4, 38}) -> #{add_type => 2};
get_attr_add_type({3, 4, 39}) -> #{add_type => 2};
get_attr_add_type({3, 4, 40}) -> #{add_type => 2};
get_attr_add_type({3, 4, 41}) -> #{add_type => 2};
get_attr_add_type({3, 4, 42}) -> #{add_type => 2};
get_attr_add_type({3, 4, 43}) -> #{add_type => 2};
get_attr_add_type({3, 4, 44}) -> #{add_type => 2};
get_attr_add_type({3, 4, 45}) -> #{add_type => 2};
get_attr_add_type({3, 5, 1}) -> #{add_type => 2};
get_attr_add_type({3, 5, 2}) -> #{add_type => 2};
get_attr_add_type({3, 5, 3}) -> #{add_type => 2};
get_attr_add_type({3, 5, 4}) -> #{add_type => 2};
get_attr_add_type({3, 5, 5}) -> #{add_type => 2};
get_attr_add_type({3, 5, 6}) -> #{add_type => 2};
get_attr_add_type({3, 5, 7}) -> #{add_type => 2};
get_attr_add_type({3, 5, 8}) -> #{add_type => 2};
get_attr_add_type({3, 5, 9}) -> #{add_type => 2};
get_attr_add_type({3, 5, 10}) -> #{add_type => 2};
get_attr_add_type({3, 5, 11}) -> #{add_type => 2};
get_attr_add_type({3, 5, 12}) -> #{add_type => 2};
get_attr_add_type({3, 5, 13}) -> #{add_type => 2};
get_attr_add_type({3, 5, 14}) -> #{add_type => 2};
get_attr_add_type({3, 5, 15}) -> #{add_type => 2};
get_attr_add_type({3, 5, 16}) -> #{add_type => 2};
get_attr_add_type({3, 5, 17}) -> #{add_type => 2};
get_attr_add_type({3, 5, 18}) -> #{add_type => 2};
get_attr_add_type({3, 5, 19}) -> #{add_type => 2};
get_attr_add_type({3, 5, 20}) -> #{add_type => 2};
get_attr_add_type({3, 5, 21}) -> #{add_type => 2};
get_attr_add_type({3, 5, 22}) -> #{add_type => 2};
get_attr_add_type({3, 5, 23}) -> #{add_type => 2};
get_attr_add_type({3, 5, 24}) -> #{add_type => 2};
get_attr_add_type({3, 5, 25}) -> #{add_type => 2};
get_attr_add_type({3, 5, 26}) -> #{add_type => 2};
get_attr_add_type({3, 5, 27}) -> #{add_type => 2};
get_attr_add_type({3, 5, 28}) -> #{add_type => 2};
get_attr_add_type({3, 5, 29}) -> #{add_type => 2};
get_attr_add_type({3, 5, 30}) -> #{add_type => 2};
get_attr_add_type({3, 5, 31}) -> #{add_type => 2};
get_attr_add_type({3, 5, 32}) -> #{add_type => 2};
get_attr_add_type({3, 5, 33}) -> #{add_type => 2};
get_attr_add_type({3, 5, 34}) -> #{add_type => 2};
get_attr_add_type({3, 5, 35}) -> #{add_type => 2};
get_attr_add_type({3, 5, 36}) -> #{add_type => 2};
get_attr_add_type({3, 5, 37}) -> #{add_type => 2};
get_attr_add_type({3, 5, 38}) -> #{add_type => 2};
get_attr_add_type({3, 5, 39}) -> #{add_type => 2};
get_attr_add_type({3, 5, 40}) -> #{add_type => 2};
get_attr_add_type({3, 5, 41}) -> #{add_type => 2};
get_attr_add_type({3, 5, 42}) -> #{add_type => 2};
get_attr_add_type({3, 5, 43}) -> #{add_type => 2};
get_attr_add_type({3, 5, 44}) -> #{add_type => 2};
get_attr_add_type({3, 5, 45}) -> #{add_type => 2};
get_attr_add_type({3, 6, 1}) -> #{add_type => 2};
get_attr_add_type({3, 6, 2}) -> #{add_type => 2};
get_attr_add_type({3, 6, 3}) -> #{add_type => 2};
get_attr_add_type({3, 6, 4}) -> #{add_type => 2};
get_attr_add_type({3, 6, 5}) -> #{add_type => 2};
get_attr_add_type({3, 6, 6}) -> #{add_type => 2};
get_attr_add_type({3, 6, 7}) -> #{add_type => 2};
get_attr_add_type({3, 6, 8}) -> #{add_type => 2};
get_attr_add_type({3, 6, 9}) -> #{add_type => 2};
get_attr_add_type({3, 6, 10}) -> #{add_type => 2};
get_attr_add_type({3, 6, 11}) -> #{add_type => 2};
get_attr_add_type({3, 6, 12}) -> #{add_type => 2};
get_attr_add_type({3, 6, 13}) -> #{add_type => 2};
get_attr_add_type({3, 6, 14}) -> #{add_type => 2};
get_attr_add_type({3, 6, 15}) -> #{add_type => 2};
get_attr_add_type({3, 6, 16}) -> #{add_type => 2};
get_attr_add_type({3, 6, 17}) -> #{add_type => 2};
get_attr_add_type({3, 6, 18}) -> #{add_type => 2};
get_attr_add_type({3, 6, 19}) -> #{add_type => 2};
get_attr_add_type({3, 6, 20}) -> #{add_type => 2};
get_attr_add_type({3, 6, 21}) -> #{add_type => 2};
get_attr_add_type({3, 6, 22}) -> #{add_type => 2};
get_attr_add_type({3, 6, 23}) -> #{add_type => 2};
get_attr_add_type({3, 6, 24}) -> #{add_type => 2};
get_attr_add_type({3, 6, 25}) -> #{add_type => 2};
get_attr_add_type({3, 6, 26}) -> #{add_type => 2};
get_attr_add_type({3, 6, 27}) -> #{add_type => 2};
get_attr_add_type({3, 6, 28}) -> #{add_type => 2};
get_attr_add_type({3, 6, 29}) -> #{add_type => 2};
get_attr_add_type({3, 6, 30}) -> #{add_type => 2};
get_attr_add_type({3, 6, 31}) -> #{add_type => 2};
get_attr_add_type({3, 6, 32}) -> #{add_type => 2};
get_attr_add_type({3, 6, 33}) -> #{add_type => 2};
get_attr_add_type({3, 6, 34}) -> #{add_type => 2};
get_attr_add_type({3, 6, 35}) -> #{add_type => 2};
get_attr_add_type({3, 6, 36}) -> #{add_type => 2};
get_attr_add_type({3, 6, 37}) -> #{add_type => 2};
get_attr_add_type({3, 6, 38}) -> #{add_type => 2};
get_attr_add_type({3, 6, 39}) -> #{add_type => 2};
get_attr_add_type({3, 6, 40}) -> #{add_type => 2};
get_attr_add_type({3, 6, 41}) -> #{add_type => 2};
get_attr_add_type({3, 6, 42}) -> #{add_type => 2};
get_attr_add_type({3, 6, 43}) -> #{add_type => 2};
get_attr_add_type({3, 6, 44}) -> #{add_type => 2};
get_attr_add_type({3, 6, 45}) -> #{add_type => 2};
get_attr_add_type({3, 7, 1}) -> #{add_type => 2};
get_attr_add_type({3, 7, 2}) -> #{add_type => 2};
get_attr_add_type({3, 7, 3}) -> #{add_type => 2};
get_attr_add_type({3, 7, 4}) -> #{add_type => 2};
get_attr_add_type({3, 7, 5}) -> #{add_type => 2};
get_attr_add_type({3, 7, 6}) -> #{add_type => 2};
get_attr_add_type({3, 7, 7}) -> #{add_type => 2};
get_attr_add_type({3, 7, 8}) -> #{add_type => 2};
get_attr_add_type({3, 7, 9}) -> #{add_type => 2};
get_attr_add_type({3, 7, 10}) -> #{add_type => 2};
get_attr_add_type({3, 7, 11}) -> #{add_type => 2};
get_attr_add_type({3, 7, 12}) -> #{add_type => 2};
get_attr_add_type({3, 7, 13}) -> #{add_type => 2};
get_attr_add_type({3, 7, 14}) -> #{add_type => 2};
get_attr_add_type({3, 7, 15}) -> #{add_type => 2};
get_attr_add_type({3, 7, 16}) -> #{add_type => 2};
get_attr_add_type({3, 7, 17}) -> #{add_type => 2};
get_attr_add_type({3, 7, 18}) -> #{add_type => 2};
get_attr_add_type({3, 7, 19}) -> #{add_type => 2};
get_attr_add_type({3, 7, 20}) -> #{add_type => 2};
get_attr_add_type({3, 7, 21}) -> #{add_type => 2};
get_attr_add_type({3, 7, 22}) -> #{add_type => 2};
get_attr_add_type({3, 7, 23}) -> #{add_type => 2};
get_attr_add_type({3, 7, 24}) -> #{add_type => 2};
get_attr_add_type({3, 7, 25}) -> #{add_type => 2};
get_attr_add_type({3, 7, 26}) -> #{add_type => 2};
get_attr_add_type({3, 7, 27}) -> #{add_type => 2};
get_attr_add_type({3, 7, 28}) -> #{add_type => 2};
get_attr_add_type({3, 7, 29}) -> #{add_type => 2};
get_attr_add_type({3, 7, 30}) -> #{add_type => 2};
get_attr_add_type({3, 7, 31}) -> #{add_type => 2};
get_attr_add_type({3, 7, 32}) -> #{add_type => 2};
get_attr_add_type({3, 7, 33}) -> #{add_type => 2};
get_attr_add_type({3, 7, 34}) -> #{add_type => 2};
get_attr_add_type({3, 7, 35}) -> #{add_type => 2};
get_attr_add_type({3, 7, 36}) -> #{add_type => 2};
get_attr_add_type({3, 7, 37}) -> #{add_type => 2};
get_attr_add_type({3, 7, 38}) -> #{add_type => 2};
get_attr_add_type({3, 7, 39}) -> #{add_type => 2};
get_attr_add_type({3, 7, 40}) -> #{add_type => 2};
get_attr_add_type({3, 7, 41}) -> #{add_type => 2};
get_attr_add_type({3, 7, 42}) -> #{add_type => 2};
get_attr_add_type({3, 7, 43}) -> #{add_type => 2};
get_attr_add_type({3, 7, 44}) -> #{add_type => 2};
get_attr_add_type({3, 7, 45}) -> #{add_type => 2};
get_attr_add_type({100, 1, 1}) -> #{add_type => 1};
get_attr_add_type({100, 2, 1}) -> #{add_type => 1};
get_attr_add_type({100, 3, 1}) -> #{add_type => 1};
get_attr_add_type({100, 4, 1}) -> #{add_type => 1};
get_attr_add_type({100, 5, 1}) -> #{add_type => 1};
get_attr_add_type({100, 6, 1}) -> #{add_type => 1};
get_attr_add_type({100, 7, 1}) -> #{add_type => 1};
get_attr_add_type(_) -> false.

get_appearance_collect_val(2019) -> 50;
get_appearance_collect_val(2020) -> 50;
get_appearance_collect_val(2023) -> 100;
get_appearance_collect_val(2031) -> 100;
get_appearance_collect_val(1999) -> 100;
get_appearance_collect_val(2038) -> 100;
get_appearance_collect_val(2044) -> 50;
get_appearance_collect_val(2045) -> 100;
get_appearance_collect_val(2051) -> 100;
get_appearance_collect_val(2057) -> 100;
get_appearance_collect_val(2063) -> 100;
get_appearance_collect_val(2069) -> 50;
get_appearance_collect_val(2070) -> 100;
get_appearance_collect_val(2076) -> 100;
get_appearance_collect_val(2082) -> 100;
get_appearance_collect_val(2088) -> 100;
get_appearance_collect_val(2094) -> 100;
get_appearance_collect_val(2100) -> 100;
get_appearance_collect_val(_) -> 0.

get_mount_dye(2023) ->
    {2023,
     [2023, 2024, 2025, 2026, 2027, 2028, 2029, 2030],
     [{23675, 3}]};
get_mount_dye(2031) ->
    {2031,
     [2031, 2032, 2033, 2034, 2035, 2036],
     [{29818, 3}]};
get_mount_dye(2038) ->
    {2038,
     [2038, 2039, 2040, 2041, 2042, 2043],
     [{29971, 3}]};
get_mount_dye(2045) ->
    {2045,
     [2045, 2046, 2047, 2048, 2049, 2050],
     [{70139, 3}]};
get_mount_dye(2051) ->
    {2051,
     [2051, 2052, 2053, 2054, 2055, 2056],
     [{70238, 3}]};
get_mount_dye(2057) ->
    {2057,
     [2057, 2058, 2059, 2060, 2061, 2062],
     [{70408, 3}]};
get_mount_dye(2063) ->
    {2063,
     [2063, 2064, 2065, 2066, 2067, 2068],
     [{70605, 3}]};
get_mount_dye(2070) ->
    {2070,
     [2070, 2071, 2072, 2073, 2074, 2075],
     [{70889, 3}]};
get_mount_dye(2076) ->
    {2076,
     [2076, 2077, 2078, 2079, 2080, 2081],
     [{71027, 3}]};
get_mount_dye(2082) ->
    {2082,
     [2082, 2083, 2084, 2085, 2086, 2087],
     [{71167, 3}]};
get_mount_dye(2088) ->
    {2088,
     [2088, 2089, 2090, 2091, 2092, 2093],
     [{71285, 3}]};
get_mount_dye(2094) ->
    {2094,
     [2094, 2095, 2096, 2097, 2098, 2099],
     [{71439, 3}]};
get_mount_dye(2100) ->
    {2100,
     [2100, 2101, 2102, 2103, 2104, 2105],
     [{71566, 3}]};
get_mount_dye(_) -> false.

get_sprog_mount({100, 1, 1}) -> {1300, 10800};
get_sprog_mount({100, 2, 1}) -> {1301, 10800};
get_sprog_mount({100, 3, 1}) -> {1302, 10800};
get_sprog_mount({100, 4, 1}) -> {1303, 10800};
get_sprog_mount({100, 5, 1}) -> {1304, 10800};
get_sprog_mount({100, 6, 1}) -> {1305, 10800};
get_sprog_mount({100, 7, 1}) -> {1306, 10800};
get_sprog_mount({100, 1, 2}) -> {1310, 10800};
get_sprog_mount({100, 2, 2}) -> {1311, 10800};
get_sprog_mount({100, 3, 2}) -> {1312, 10800};
get_sprog_mount({100, 4, 2}) -> {1313, 10800};
get_sprog_mount({100, 5, 2}) -> {1314, 10800};
get_sprog_mount({100, 6, 2}) -> {1315, 10800};
get_sprog_mount({100, 7, 2}) -> {1316, 10800};
get_sprog_mount(_) -> false.

get_sprog_mount_name(1300) -> lang:get("寒月兔");
get_sprog_mount_name(1301) -> lang:get("寒月兔");
get_sprog_mount_name(1302) -> lang:get("寒月兔");
get_sprog_mount_name(1303) -> lang:get("寒月兔");
get_sprog_mount_name(1304) -> lang:get("寒月兔");
get_sprog_mount_name(1305) -> lang:get("寒月兔");
get_sprog_mount_name(1306) -> lang:get("寒月兔");
get_sprog_mount_name(1310) -> lang:get("络月兔");
get_sprog_mount_name(1311) -> lang:get("络月兔");
get_sprog_mount_name(1312) -> lang:get("络月兔");
get_sprog_mount_name(1313) -> lang:get("络月兔");
get_sprog_mount_name(1314) -> lang:get("络月兔");
get_sprog_mount_name(1315) -> lang:get("络月兔");
get_sprog_mount_name(1316) -> lang:get("络月兔");
get_sprog_mount_name(_) -> false.

get_mount_evolution(1999) ->
    {1999, 1998, [{29915, 12}], lang:get("龙猫圣灵")};
get_mount_evolution(_) -> false.

get_select_skill_cost({1, 1}) -> [{23550, 3}];
get_select_skill_cost({1, 2}) -> [{23550, 6}];
get_select_skill_cost({1, 3}) -> [{23550, 3}];
get_select_skill_cost({1, 4}) -> [{23550, 3}];
get_select_skill_cost({1, 5}) -> [{23550, 6}];
get_select_skill_cost({2, 1}) -> [{23550, 3}];
get_select_skill_cost({2, 2}) -> [{23550, 6}];
get_select_skill_cost({2, 3}) -> [{23550, 3}];
get_select_skill_cost({2, 4}) -> [{23550, 6}];
get_select_skill_cost({2, 5}) -> [{23550, 3}];
get_select_skill_cost({3, 1}) -> [{23550, 2}];
get_select_skill_cost({3, 2}) -> [{23550, 4}];
get_select_skill_cost({3, 3}) -> [{23550, 2}];
get_select_skill_cost({3, 4}) -> [{23550, 4}];
get_select_skill_cost({3, 5}) -> [{23550, 2}];
get_select_skill_cost(_) -> false.

get_double_riders() ->
    [{1011, 0},
     {1012, 0},
     {1021, 0},
     {1022, 0},
     {1031, 0},
     {1032, 0},
     {1041, 0},
     {1042, 0},
     {1051, 0},
     {1052, 0},
     {1061, 0},
     {1062, 0},
     {1071, 0},
     {1072, 0},
     {1101, 0},
     {1102, 0},
     {1103, 0},
     {1104, 0},
     {1105, 0},
     {1106, 0},
     {1107, 0},
     {1108, 0},
     {1111, 0},
     {1112, 0},
     {1113, 0},
     {1114, 0},
     {1115, 0},
     {1116, 0},
     {1117, 0},
     {1118, 0},
     {1201, 0},
     {1202, 0},
     {1203, 0},
     {1204, 0},
     {1205, 0},
     {1206, 0},
     {1207, 0},
     {1208, 0},
     {1300, 0},
     {1301, 0},
     {1302, 0},
     {1303, 0},
     {1304, 0},
     {1305, 0},
     {1306, 0},
     {1310, 0},
     {1311, 0},
     {1312, 0},
     {1313, 0},
     {1314, 0},
     {1315, 0},
     {1316, 0},
     {2000, 0},
     {2001, 0},
     {2002, 0},
     {2003, 0},
     {2004, 0},
     {2005, 0},
     {2006, 0},
     {2007, 0},
     {2008, 0},
     {2009, 0},
     {2010, 0},
     {2011, 0},
     {2012, 0},
     {2013, 0},
     {2014, 0},
     {2015, 0},
     {2016, 0},
     {2017, 0},
     {2018, 0},
     {2019, 0},
     {2021, 0},
     {2020, 0},
     {2023, 0},
     {2024, 0},
     {2025, 0},
     {2026, 0},
     {2027, 0},
     {2028, 0},
     {2029, 0},
     {2030, 0},
     {2031, 0},
     {2032, 0},
     {2033, 0},
     {2034, 0},
     {2035, 0},
     {2036, 0},
     {1998, 0},
     {1999, 0},
     {2038, 0},
     {2039, 0},
     {2040, 0},
     {2041, 0},
     {2042, 0},
     {2043, 0},
     {2044, 0},
     {2045, 0},
     {2046, 0},
     {2047, 0},
     {2048, 0},
     {2049, 0},
     {2050, 0},
     {2052, 0},
     {2051, 0},
     {2053, 0},
     {2054, 0},
     {2055, 0},
     {2056, 0},
     {2057, 1},
     {2058, 1},
     {2059, 1},
     {2060, 1},
     {2061, 1},
     {2062, 1},
     {2063, 1},
     {2064, 1},
     {2065, 1},
     {2066, 1},
     {2067, 1},
     {2068, 1},
     {2069, 1},
     {2070, 1},
     {2071, 1},
     {2072, 1},
     {2073, 1},
     {2074, 1},
     {2075, 1},
     {2076, 1},
     {2077, 1},
     {2078, 1},
     {2079, 1},
     {2080, 1},
     {2081, 1},
     {2082, 0},
     {2083, 0},
     {2084, 0},
     {2085, 0},
     {2086, 0},
     {2087, 0},
     {2088, 0},
     {2089, 0},
     {2090, 0},
     {2091, 0},
     {2092, 0},
     {2093, 0},
     {2094, 1},
     {2095, 1},
     {2096, 1},
     {2097, 1},
     {2098, 1},
     {2099, 1},
     {2100, 0},
     {2101, 0},
     {2102, 0},
     {2103, 0},
     {2104, 0},
     {2105, 0}].

