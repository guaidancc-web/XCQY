-file("src/data/dungeon_data.erl", 1).

-module(dungeon_data).

-export([get/1,
         list/0,
         get_gain/1,
         get_count_attr/1,
         floors/1,
         get_lord/1,
         get_dun_lord/1,
         get_reward/1,
         get_combat_buff/1,
         get_unit_info/1,
         get_card/1,
         get_card_main/1,
         get_day_limit/1,
         get_kickout_energy/1]).

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

-file("src/data/dungeon_data.erl", 26).

-file("inc/dungeon.hrl", 1).

-record(m_dungeon,
        {ver = 4,
         dun_id = 0,
         battle_id = 0,
         cards = [],
         unit_rewards = [],
         unit_rewarded = 0}).

-record(dungeon_base,
        {id = 0,
         name = "",
         type = 2,
         need_num = 1,
         cond_enter = [],
         cond_loss = [],
         cross_cond_enter = [],
         cross_cond_loss = [],
         exit_pos = last ::
             last |
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         battle_name_list = [],
         lev_interval = 0,
         unit_list = [],
         lev_max = 0,
         team_dungeon = 0}).

-record(dungeon_role_info,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         score_list = [] :: [tuple()]}).

-record(dungeon_unit_count, {id = 0, num = 0}).

-record(dungeon_score,
        {id = 0,
         score = 0 :: non_neg_integer(),
         grade = 1 :: pos_integer()}).

-record(dungeon_lord_data,
        {unit_id = 0,
         id = 0,
         floor = 0,
         map_id = 0,
         is_lord = 0,
         msg = ""}).

-record(dungeon_lord,
        {key = {0, 0},
         dun_id = 0,
         floor = 0,
         lords = [],
         ranks = []}).

-record(dungeon_lord_role,
        {id,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer(),
         looks = []}).

-record(dungeon_rank_role,
        {id,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer(),
         fc = 0,
         looks = [],
         up = 1,
         rank = 0,
         val1 = 0,
         val2 = 0,
         val3 = 0,
         val4 = 0,
         msg1 = "",
         msg2 = "",
         msg3 = ""}).

-record(dungeon_first,
        {key = {0, 0}, dun_id = 0, floor = 0, roles = []}).

-record(dungeon_first_role,
        {id,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer()}).

-record(dungeon_reward_data,
        {id = 0,
         floor = 0,
         type = 0,
         item_list = [],
         title = "",
         msg = "",
         cast_msg = ""}).

-record(dungeon_team,
        {id = {0, "", 0} :: tuple(),
         leader :: undefined | tuple(),
         members = [] :: list(),
         member_num = 1 :: non_neg_integer(),
         dun_id = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         kicked = [] :: list()}).

-record(dungeon_enlistment,
        {id = {0, "", 0} :: tuple(),
         member_num = 1 :: non_neg_integer(),
         dun_id = 0 :: non_neg_integer(),
         leader :: undefined | tuple()}).

-record(dungeon_mate,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         pid :: undefined | pid(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         status = 3 :: non_neg_integer(),
         looks = [] :: list(),
         fc = 0 :: non_neg_integer(),
         dun_id = 0 :: non_neg_integer(),
         team_id = {0, "", 0} :: tuple(),
         matched = 0 :: non_neg_integer(),
         join_time = 0 :: non_neg_integer(),
         origin_ids = [] :: list()}).

-record(dungeon_invitation,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         type = 1,
         team_id = {0, "", 0},
         dun_id = 0,
         dun_name = "",
         time = 0}).

-record(dungeon_card,
        {item_id = 0,
         item_num = 0,
         announce = 0,
         selected = 0}).

-file("src/data/dungeon_data.erl", 27).

-file("inc/condition.hrl", 1).

-record(condition,
        {label :: undefined | atom(),
         op = eq ::
             ue | eq | lt | gt | le | ge | range | include,
         val :: undefined | term(),
         msg = "" :: list()}).

-file("src/data/dungeon_data.erl", 28).

list() ->
    [10035,
     10036,
     10055,
     10056,
     10071,
     10075,
     10076,
     10085,
     10135,
     10150,
     10165,
     10180,
     30001].

get(10035) ->
    #dungeon_base{id = 10035, name = lang:get("精灵公主"),
                  type = 2, team_dungeon = 0,
                  cond_enter =
                      [#condition{label = lev, op = ge, val = 35,
                                  msg = lang:get("等级不足35级,无法进入")}],
                  need_num = 3,
                  cross_cond_enter =
                      [#condition{label = lev, op = ge, val = 35,
                                  msg = lang:get("等级不足35级,无法进入")}],
                  exit_pos = last, battle_name_list = [battle_dungeon_35],
                  unit_list =
                      [{[50021]}, {[50022]}, {[50023]}, {[50039]}]};
get(10055) ->
    #dungeon_base{id = 10055, name = lang:get("熔岩之心"),
                  type = 2, team_dungeon = 0,
                  cond_enter =
                      [#condition{label = lev, op = ge, val = 55,
                                  msg = lang:get("等级不足55级,无法进入")}],
                  need_num = 3,
                  cross_cond_enter =
                      [#condition{label = lev, op = ge, val = 55,
                                  msg = lang:get("等级不足55级,无法进入")}],
                  exit_pos = last, battle_name_list = [battle_dungeon_55],
                  unit_list =
                      [{[50041]}, {[50042]}, {[50043]}, {[50059]}]};
get(10075) ->
    #dungeon_base{id = 10075, name = lang:get("水帘洞天"),
                  type = 2, team_dungeon = 0,
                  cond_enter =
                      [#condition{label = lev, op = ge, val = 75,
                                  msg = lang:get("等级不足75级,无法进入")}],
                  need_num = 3,
                  cross_cond_enter =
                      [#condition{label = lev, op = ge, val = 75,
                                  msg = lang:get("等级不足75级,无法进入")}],
                  exit_pos = last, battle_name_list = [battle_dungeon_75],
                  unit_list =
                      [{[51000]}, {[51005]}, {[51009]}, {[51013]}]};
get(10036) ->
    #dungeon_base{id = 10036, name = lang:get("精灵公主"),
                  type = 3, team_dungeon = 0,
                  cond_enter =
                      [#condition{label = lev, op = ge, val = 40,
                                  msg = lang:get("等级不足40级,无法进入")}],
                  need_num = 3,
                  cross_cond_enter =
                      [#condition{label = lev, op = ge, val = 40,
                                  msg = lang:get("等级不足40级,无法进入")}],
                  exit_pos = last, battle_name_list = [battle_dungeon_36],
                  unit_list =
                      [{[50521]}, {[50522]}, {[50523]}, {[50539]}]};
get(10056) ->
    #dungeon_base{id = 10056, name = lang:get("熔岩之心"),
                  type = 3, team_dungeon = 0,
                  cond_enter =
                      [#condition{label = lev, op = ge, val = 55,
                                  msg = lang:get("等级不足55级,无法进入")}],
                  need_num = 3,
                  cross_cond_enter =
                      [#condition{label = lev, op = ge, val = 55,
                                  msg = lang:get("等级不足55级,无法进入")}],
                  exit_pos = last, battle_name_list = [battle_dungeon_56],
                  unit_list =
                      [{[50541]}, {[50542]}, {[50543]}, {[50559]}]};
get(10076) ->
    #dungeon_base{id = 10076, name = lang:get("水帘洞天"),
                  type = 3, team_dungeon = 0,
                  cond_enter =
                      [#condition{label = lev, op = ge, val = 78,
                                  msg = lang:get("等级不足78级,无法进入")}],
                  need_num = 3,
                  cross_cond_enter =
                      [#condition{label = lev, op = ge, val = 78,
                                  msg = lang:get("等级不足78级,无法进入")}],
                  exit_pos = last, battle_name_list = [battle_dungeon_76],
                  unit_list =
                      [{[51100]}, {[51105]}, {[51109]}, {[51113]}]};
get(30001) ->
    #dungeon_base{id = 30001, name = lang:get("冒险秘境"),
                  type = 4, team_dungeon = 0,
                  cond_enter =
                      [#condition{label = lev, op = ge, val = 30,
                                  msg = lang:get("等级不足30级,无法进入")}],
                  need_num = 1,
                  cross_cond_enter =
                      [#condition{label = lev, op = ge, val = 30,
                                  msg = lang:get("等级不足30级,无法进入")}],
                  exit_pos = last,
                  battle_name_list = [battle_shipping_1]};
get(10085) ->
    #dungeon_base{id = 10085, name = lang:get("夺宝奇兵"),
                  type = 5, team_dungeon = 0,
                  cond_enter =
                      [#condition{label = lev, op = ge, val = 80,
                                  msg = lang:get("等级不足80级,无法进入")},
                       #condition{label = week_day_five, op = include,
                                  val = [2, 4, 6],
                                  msg = lang:get("副本今日未开放,无法进入")}],
                  need_num = 3,
                  cross_cond_enter =
                      [#condition{label = lev, op = ge, val = 80,
                                  msg = lang:get("等级不足80级,无法进入")},
                       #condition{label = week_day_five, op = include,
                                  val = [2, 4, 6],
                                  msg = lang:get("副本今日未开放,无法进入")}],
                  exit_pos = last,
                  battle_name_list =
                      [battle_dungeon_85,
                       battle_dungeon_86,
                       battle_dungeon_87,
                       battle_dungeon_88,
                       battle_dungeon_89,
                       battle_dungeon_90,
                       battle_dungeon_91,
                       battle_dungeon_92,
                       battle_dungeon_93],
                  unit_list =
                      [{[51100]}, {[51105]}, {[51109]}, {[51113]}],
                  lev_interval = 5};
get(10071) ->
    #dungeon_base{id = 10071, name = lang:get("无尽挑战"),
                  type = 2, team_dungeon = 0,
                  cond_enter =
                      [#condition{label = lev, op = ge, val = 70,
                                  msg = lang:get("等级不足70级,无法进入")},
                       #condition{label = week_day_five, op = include,
                                  val = [3, 7],
                                  msg = lang:get("副本今日未开放,无法进入")}],
                  need_num = 3,
                  cross_cond_enter =
                      [#condition{label = lev, op = ge, val = 70,
                                  msg = lang:get("等级不足70级,无法进入")},
                       #condition{label = week_day_five, op = include,
                                  val = [3, 7],
                                  msg = lang:get("副本今日未开放,无法进入")}],
                  exit_pos = last,
                  unit_list =
                      [{[51100]}, {[51105]}, {[51109]}, {[51113]}],
                  lev_interval = 5};
get(10135) ->
    #dungeon_base{id = 10135, name = lang:get("精灵公主"),
                  type = 2, team_dungeon = 1, lev_max = 65,
                  cond_enter =
                      [#condition{label = lev, op = ge, val = 35,
                                  msg = lang:get("等级不足35级,无法进入")}],
                  need_num = 3,
                  cross_cond_enter =
                      [#condition{label = lev, op = ge, val = 35,
                                  msg = lang:get("等级不足35级,无法进入")}],
                  exit_pos = last,
                  battle_name_list = [battle_dungeon_n35],
                  unit_list =
                      [{[50021]}, {[50022]}, {[50023]}, {[50039]}]};
get(10150) ->
    #dungeon_base{id = 10150, name = lang:get("熔岩之心"),
                  type = 2, team_dungeon = 1, lev_max = 80,
                  cond_enter =
                      [#condition{label = lev, op = ge, val = 50,
                                  msg = lang:get("等级不足50级,无法进入")}],
                  need_num = 3,
                  cross_cond_enter =
                      [#condition{label = lev, op = ge, val = 50,
                                  msg = lang:get("等级不足50级,无法进入")}],
                  exit_pos = last,
                  battle_name_list = [battle_dungeon_n50],
                  unit_list =
                      [{[50041]}, {[50042]}, {[50043]}, {[50059]}]};
get(10165) ->
    #dungeon_base{id = 10165, name = lang:get("水帘洞天"),
                  type = 2, team_dungeon = 1, lev_max = 200,
                  cond_enter =
                      [#condition{label = lev, op = ge, val = 65,
                                  msg = lang:get("等级不足65级,无法进入")}],
                  need_num = 3,
                  cross_cond_enter =
                      [#condition{label = lev, op = ge, val = 65,
                                  msg = lang:get("等级不足65级,无法进入")}],
                  exit_pos = last,
                  battle_name_list = [battle_dungeon_n65],
                  unit_list =
                      [{[51000]}, {[51005]}, {[51009]}, {[51013]}]};
get(10180) ->
    #dungeon_base{id = 10180, name = lang:get("遗忘洞穴"),
                  type = 2, team_dungeon = 1, lev_max = 200,
                  cond_enter =
                      [#condition{label = lev, op = ge, val = 80,
                                  msg = lang:get("等级不足80级,无法进入")}],
                  need_num = 3,
                  cross_cond_enter =
                      [#condition{label = lev, op = ge, val = 80,
                                  msg = lang:get("等级不足80级,无法进入")}],
                  exit_pos = last,
                  battle_name_list = [battle_dungeon_n80],
                  unit_list =
                      [{[51201]}, {[51205]}, {[51208]}, {[51213]}]};
get(_Dun) -> false.

get_gain(10035) ->
    {{2},
     [#{item_id => 90010, num => [2020], sex => 2,
        classes => 0, lev_low => 20, lev_high => 200,
        ratio => 0},
      #{item_id => 90005, num => [2020], sex => 2,
        classes => 0, lev_low => 20, lev_high => 200,
        ratio => 0}]};
get_gain(10055) ->
    {{2},
     [#{item_id => 90010, num => [2050], sex => 2,
        classes => 0, lev_low => 50, lev_high => 200,
        ratio => 0},
      #{item_id => 90005, num => [2050], sex => 2,
        classes => 0, lev_low => 50, lev_high => 200,
        ratio => 0}]};
get_gain(10075) ->
    {{2},
     [#{item_id => 90010, num => [2050], sex => 2,
        classes => 0, lev_low => 70, lev_high => 200,
        ratio => 0},
      #{item_id => 90005, num => [2050], sex => 2,
        classes => 0, lev_low => 70, lev_high => 200,
        ratio => 0}]};
get_gain(10036) ->
    {{2},
     [#{item_id => 90010, num => [2030], sex => 2,
        classes => 0, lev_low => 40, lev_high => 54,
        ratio => 0},
      #{item_id => 90005, num => [2030], sex => 2,
        classes => 0, lev_low => 40, lev_high => 54,
        ratio => 0}]};
get_gain(10056) ->
    {{2},
     [#{item_id => 90010, num => [2040], sex => 2,
        classes => 0, lev_low => 55, lev_high => 77,
        ratio => 0},
      #{item_id => 90005, num => [2040], sex => 2,
        classes => 0, lev_low => 55, lev_high => 77,
        ratio => 0}]};
get_gain(10076) ->
    {{2},
     [#{item_id => 90010, num => [2040], sex => 2,
        classes => 0, lev_low => 78, lev_high => 200,
        ratio => 0},
      #{item_id => 90005, num => [2040], sex => 2,
        classes => 0, lev_low => 78, lev_high => 200,
        ratio => 0}]};
get_gain(10135) ->
    {{2},
     [#{item_id => 90010, num => [2061], sex => 2,
        classes => 0, lev_low => 0, lev_high => 200,
        ratio => 0},
      #{item_id => 90005, num => [2061], sex => 2,
        classes => 0, lev_low => 0, lev_high => 200,
        ratio => 0}]};
get_gain(10150) ->
    {{2},
     [#{item_id => 90010, num => [2061], sex => 2,
        classes => 0, lev_low => 0, lev_high => 200,
        ratio => 0},
      #{item_id => 90005, num => [2061], sex => 2,
        classes => 0, lev_low => 0, lev_high => 200,
        ratio => 0}]};
get_gain(10165) ->
    {{2},
     [#{item_id => 90010, num => [2061], sex => 2,
        classes => 0, lev_low => 0, lev_high => 200,
        ratio => 0},
      #{item_id => 90005, num => [2061], sex => 2,
        classes => 0, lev_low => 0, lev_high => 200,
        ratio => 0}]};
get_gain(10180) ->
    {{2},
     [#{item_id => 90010, num => [2061], sex => 2,
        classes => 0, lev_low => 0, lev_high => 200,
        ratio => 0},
      #{item_id => 90005, num => [2061], sex => 2,
        classes => 0, lev_low => 0, lev_high => 200,
        ratio => 0}]};
get_gain(_) -> false.

get_count_attr({52091, Count})
    when Count >= 0 andalso Count =< 4 ->
    [{51, 1010}, {54, 1020}, {55, 1020}];
get_count_attr({52091, Count})
    when Count >= 5 andalso Count =< 10 ->
    [{51, 1020}, {54, 1040}, {55, 1040}];
get_count_attr({52091, Count})
    when Count >= 11 andalso Count =< 20 ->
    [{51, 1030}, {54, 1060}, {55, 1060}];
get_count_attr({52091, Count})
    when Count >= 21 andalso Count =< 35 ->
    [{51, 1040}, {54, 1080}, {55, 1080}];
get_count_attr({52091, Count})
    when Count >= 36 andalso Count =< 50 ->
    [{51, 1050}, {54, 1100}, {55, 1100}];
get_count_attr({52091, Count})
    when Count >= 51 andalso Count =< 65 ->
    [{51, 1060}, {54, 1120}, {55, 1120}];
get_count_attr({52091, Count})
    when Count >= 66 andalso Count =< 80 ->
    [{51, 1070}, {54, 1140}, {55, 1140}];
get_count_attr({52091, Count})
    when Count >= 81 andalso Count =< 100 ->
    [{51, 1080}, {54, 1160}, {55, 1160}];
get_count_attr({52091, Count})
    when Count >= 101 andalso Count =< 130 ->
    [{51, 1090}, {54, 1180}, {55, 1180}];
get_count_attr({52091, Count})
    when Count >= 131 andalso Count =< 170 ->
    [{51, 1100}, {54, 1200}, {55, 1200}];
get_count_attr({52091, Count})
    when Count >= 171 andalso Count =< 220 ->
    [{51, 1110}, {54, 1220}, {55, 1220}];
get_count_attr({52091, Count})
    when Count >= 221 andalso Count =< 270 ->
    [{51, 1120}, {54, 1240}, {55, 1240}];
get_count_attr({52091, Count})
    when Count >= 271 andalso Count =< 350 ->
    [{51, 1130}, {54, 1260}, {55, 1260}];
get_count_attr({52091, Count})
    when Count >= 351 andalso Count =< 500 ->
    [{51, 1140}, {54, 1280}, {55, 1280}];
get_count_attr({52091, Count})
    when Count >= 501 andalso Count =< 100000 ->
    [{51, 1150}, {54, 1300}, {55, 1300}];
get_count_attr(_) -> [].

floors(10035) -> [val_not_exist];
floors(10055) -> [val_not_exist];
floors(10075) -> [val_not_exist];
floors(10036) -> [val_not_exist];
floors(10056) -> [val_not_exist];
floors(10076) -> [val_not_exist];
floors(30001) -> [val_not_exist];
floors(10085) -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
floors(_) -> [].

get_lord(52011) ->
    #dungeon_lord_data{id = 10085, map_id = 42001,
                       floor = 1, unit_id = 52011, is_lord = 1,
                       msg =
                           lang:get("人外有人！#role#带领队伍火速通关，刷新了<color='#00ff00'>夺宝奇兵<"
                                    "/color>一层的通关记录，成为了新的霸主！")};
get_lord(52021) ->
    #dungeon_lord_data{id = 10085, map_id = 42002,
                       floor = 2, unit_id = 52021, is_lord = 1,
                       msg =
                           lang:get("人外有人！#role#带领队伍火速通关，刷新了<color='#00ff00'>夺宝奇兵<"
                                    "/color>二层的通关记录，成为了新的霸主！")};
get_lord(52031) ->
    #dungeon_lord_data{id = 10085, map_id = 42003,
                       floor = 3, unit_id = 52031, is_lord = 1,
                       msg =
                           lang:get("人外有人！#role#带领队伍火速通关，刷新了<color='#00ff00'>夺宝奇兵<"
                                    "/color>三层的通关记录，成为了新的霸主！")};
get_lord(52041) ->
    #dungeon_lord_data{id = 10085, map_id = 42004,
                       floor = 4, unit_id = 52041, is_lord = 1,
                       msg =
                           lang:get("人外有人！#role#带领队伍火速通关，刷新了<color='#00ff00'>夺宝奇兵<"
                                    "/color>四层的通关记录，成为了新的霸主！")};
get_lord(52051) ->
    #dungeon_lord_data{id = 10085, map_id = 42005,
                       floor = 5, unit_id = 52051, is_lord = 1,
                       msg =
                           lang:get("人外有人！#role#带领队伍火速通关，刷新了<color='#00ff00'>夺宝奇兵<"
                                    "/color>五层的通关记录，成为了新的霸主！")};
get_lord(52061) ->
    #dungeon_lord_data{id = 10085, map_id = 42006,
                       floor = 6, unit_id = 52061, is_lord = 1,
                       msg =
                           lang:get("人外有人！#role#带领队伍火速通关，刷新了<color='#00ff00'>夺宝奇兵<"
                                    "/color>六层的通关记录，成为了新的霸主！")};
get_lord(52071) ->
    #dungeon_lord_data{id = 10085, map_id = 42007,
                       floor = 7, unit_id = 52071, is_lord = 1,
                       msg =
                           lang:get("人外有人！#role#带领队伍火速通关，刷新了<color='#00ff00'>夺宝奇兵<"
                                    "/color>七层的通关记录，成为了新的霸主！")};
get_lord(52081) ->
    #dungeon_lord_data{id = 10085, map_id = 42008,
                       floor = 8, unit_id = 52081, is_lord = 1,
                       msg =
                           lang:get("人外有人！#role#带领队伍火速通关，刷新了<color='#00ff00'>夺宝奇兵<"
                                    "/color>八层的通关记录，成为了新的霸主！")};
get_lord(52091) ->
    #dungeon_lord_data{id = 10085, map_id = 42009,
                       floor = 9, unit_id = 52091, is_lord = 1,
                       msg =
                           lang:get("人外有人！#role#带领队伍火速通关，刷新了<color='#00ff00'>夺宝奇兵<"
                                    "/color>九层的通关记录，成为了新的霸主！")};
get_lord(52101) ->
    #dungeon_lord_data{id = 10085, map_id = 42010,
                       floor = 10, unit_id = 52101, is_lord = 1,
                       msg =
                           lang:get("人外有人！#role#带领队伍火速通关，刷新了<color='#00ff00'>夺宝奇兵<"
                                    "/color>十层的通关记录，成为了新的霸主！")};
get_lord(_) -> false.

get_dun_lord({10035, val_not_exist}) ->
    #dungeon_lord_data{id = 10035, map_id = 20005};
get_dun_lord({10055, val_not_exist}) ->
    #dungeon_lord_data{id = 10055, map_id = 20004};
get_dun_lord({10075, val_not_exist}) ->
    #dungeon_lord_data{id = 10075, map_id = 20007};
get_dun_lord({10036, val_not_exist}) ->
    #dungeon_lord_data{id = 10036, map_id = 20005};
get_dun_lord({10056, val_not_exist}) ->
    #dungeon_lord_data{id = 10056, map_id = 20004};
get_dun_lord({10076, val_not_exist}) ->
    #dungeon_lord_data{id = 10076, map_id = 20007};
get_dun_lord({30001, val_not_exist}) ->
    #dungeon_lord_data{id = 30001, map_id = 51010};
get_dun_lord({10085, 1}) ->
    #dungeon_lord_data{id = 10085, map_id = 42001,
                       floor = 1, unit_id = 52011, is_lord = 1,
                       msg =
                           lang:get("人外有人！#role#带领队伍火速通关，刷新了<color='#00ff00'>夺宝奇兵<"
                                    "/color>一层的通关记录，成为了新的霸主！")};
get_dun_lord({10085, 2}) ->
    #dungeon_lord_data{id = 10085, map_id = 42002,
                       floor = 2, unit_id = 52021, is_lord = 1,
                       msg =
                           lang:get("人外有人！#role#带领队伍火速通关，刷新了<color='#00ff00'>夺宝奇兵<"
                                    "/color>二层的通关记录，成为了新的霸主！")};
get_dun_lord({10085, 3}) ->
    #dungeon_lord_data{id = 10085, map_id = 42003,
                       floor = 3, unit_id = 52031, is_lord = 1,
                       msg =
                           lang:get("人外有人！#role#带领队伍火速通关，刷新了<color='#00ff00'>夺宝奇兵<"
                                    "/color>三层的通关记录，成为了新的霸主！")};
get_dun_lord({10085, 4}) ->
    #dungeon_lord_data{id = 10085, map_id = 42004,
                       floor = 4, unit_id = 52041, is_lord = 1,
                       msg =
                           lang:get("人外有人！#role#带领队伍火速通关，刷新了<color='#00ff00'>夺宝奇兵<"
                                    "/color>四层的通关记录，成为了新的霸主！")};
get_dun_lord({10085, 5}) ->
    #dungeon_lord_data{id = 10085, map_id = 42005,
                       floor = 5, unit_id = 52051, is_lord = 1,
                       msg =
                           lang:get("人外有人！#role#带领队伍火速通关，刷新了<color='#00ff00'>夺宝奇兵<"
                                    "/color>五层的通关记录，成为了新的霸主！")};
get_dun_lord({10085, 6}) ->
    #dungeon_lord_data{id = 10085, map_id = 42006,
                       floor = 6, unit_id = 52061, is_lord = 1,
                       msg =
                           lang:get("人外有人！#role#带领队伍火速通关，刷新了<color='#00ff00'>夺宝奇兵<"
                                    "/color>六层的通关记录，成为了新的霸主！")};
get_dun_lord({10085, 7}) ->
    #dungeon_lord_data{id = 10085, map_id = 42007,
                       floor = 7, unit_id = 52071, is_lord = 1,
                       msg =
                           lang:get("人外有人！#role#带领队伍火速通关，刷新了<color='#00ff00'>夺宝奇兵<"
                                    "/color>七层的通关记录，成为了新的霸主！")};
get_dun_lord({10085, 8}) ->
    #dungeon_lord_data{id = 10085, map_id = 42008,
                       floor = 8, unit_id = 52081, is_lord = 1,
                       msg =
                           lang:get("人外有人！#role#带领队伍火速通关，刷新了<color='#00ff00'>夺宝奇兵<"
                                    "/color>八层的通关记录，成为了新的霸主！")};
get_dun_lord({10085, 9}) ->
    #dungeon_lord_data{id = 10085, map_id = 42009,
                       floor = 9, unit_id = 52091, is_lord = 1,
                       msg =
                           lang:get("人外有人！#role#带领队伍火速通关，刷新了<color='#00ff00'>夺宝奇兵<"
                                    "/color>九层的通关记录，成为了新的霸主！")};
get_dun_lord({10085, 10}) ->
    #dungeon_lord_data{id = 10085, map_id = 42010,
                       floor = 10, unit_id = 52101, is_lord = 1,
                       msg =
                           lang:get("人外有人！#role#带领队伍火速通关，刷新了<color='#00ff00'>夺宝奇兵<"
                                    "/color>十层的通关记录，成为了新的霸主！")};
get_dun_lord(_) -> false.

get_reward({10085, 1, 1}) ->
    #dungeon_reward_data{id = 10085, floor = 1, type = 1,
                         item_list = [{22681, 0, 1, 400, 0}],
                         title = lang:get("夺宝奇兵第1层霸主奖励！"),
                         msg = lang:get("恭喜您在今天成为夺宝奇兵1层霸主，获得以下奖励：")};
get_reward({10085, 2, 1}) ->
    #dungeon_reward_data{id = 10085, floor = 2, type = 1,
                         item_list = [{22681, 0, 1, 400, 0}],
                         title = lang:get("夺宝奇兵第2层霸主奖励！"),
                         msg = lang:get("恭喜您在今天成为夺宝奇兵2层霸主，获得以下奖励：")};
get_reward({10085, 3, 1}) ->
    #dungeon_reward_data{id = 10085, floor = 3, type = 1,
                         item_list = [{22681, 0, 1, 400, 0}],
                         title = lang:get("夺宝奇兵第3层霸主奖励！"),
                         msg = lang:get("恭喜您在今天成为夺宝奇兵3层霸主，获得以下奖励：")};
get_reward({10085, 4, 1}) ->
    #dungeon_reward_data{id = 10085, floor = 4, type = 1,
                         item_list = [{22681, 0, 1, 400, 0}],
                         title = lang:get("夺宝奇兵第4层霸主奖励！"),
                         msg = lang:get("恭喜您在今天成为夺宝奇兵4层霸主，获得以下奖励：")};
get_reward({10085, 5, 1}) ->
    #dungeon_reward_data{id = 10085, floor = 5, type = 1,
                         item_list = [{22681, 0, 1, 400, 0}],
                         title = lang:get("夺宝奇兵第5层霸主奖励！"),
                         msg = lang:get("恭喜您在今天成为夺宝奇兵5层霸主，获得以下奖励：")};
get_reward({10085, 6, 1}) ->
    #dungeon_reward_data{id = 10085, floor = 6, type = 1,
                         item_list = [{22681, 0, 1, 400, 0}],
                         title = lang:get("夺宝奇兵第6层霸主奖励！"),
                         msg = lang:get("恭喜您在今天成为夺宝奇兵6层霸主，获得以下奖励：")};
get_reward({10085, 7, 1}) ->
    #dungeon_reward_data{id = 10085, floor = 7, type = 1,
                         item_list = [{22681, 0, 2, 400, 0}],
                         title = lang:get("夺宝奇兵第7层霸主奖励！"),
                         msg = lang:get("恭喜您在今天成为夺宝奇兵7层霸主，获得以下奖励：")};
get_reward({10085, 8, 1}) ->
    #dungeon_reward_data{id = 10085, floor = 8, type = 1,
                         item_list = [{22681, 0, 2, 400, 0}],
                         title = lang:get("夺宝奇兵第8层霸主奖励！"),
                         msg = lang:get("恭喜您在今天成为夺宝奇兵8层霸主，获得以下奖励：")};
get_reward({10085, 9, 1}) ->
    #dungeon_reward_data{id = 10085, floor = 9, type = 1,
                         item_list = [{22681, 0, 2, 400, 0}],
                         title = lang:get("夺宝奇兵第9层霸主奖励！"),
                         msg = lang:get("恭喜您在今天成为夺宝奇兵9层霸主，获得以下奖励：")};
get_reward({10085, 6, 2}) ->
    #dungeon_reward_data{id = 10085, floor = 6, type = 2,
                         item_list = [{22306, 0, 1, 220, 0}],
                         title = lang:get("夺宝奇兵第6层个人首通奖励！"),
                         msg = lang:get("首次通过了夺宝奇兵第6关的挑战，获得一份个人首杀奖励：")};
get_reward({10085, 7, 2}) ->
    #dungeon_reward_data{id = 10085, floor = 7, type = 2,
                         item_list = [{22306, 0, 1, 220, 0}],
                         title = lang:get("夺宝奇兵第7层个人首通奖励！"),
                         msg = lang:get("首次通过了夺宝奇兵第7关的挑战，获得一份个人首杀奖励：")};
get_reward({10085, 8, 2}) ->
    #dungeon_reward_data{id = 10085, floor = 8, type = 2,
                         item_list = [{22306, 0, 1, 220, 0}],
                         title = lang:get("夺宝奇兵第8层个人首通奖励！"),
                         msg = lang:get("首次通过了夺宝奇兵第8关的挑战，获得一份个人首杀奖励：")};
get_reward({10085, 9, 2}) ->
    #dungeon_reward_data{id = 10085, floor = 9, type = 2,
                         item_list = [{22306, 0, 2, 220, 0}],
                         title = lang:get("夺宝奇兵第9层个人首通奖励！"),
                         msg = lang:get("首次通过了夺宝奇兵第9关的挑战，获得一份个人首杀奖励：")};
get_reward({10085, 3, 3}) ->
    #dungeon_reward_data{id = 10085, floor = 3, type = 3,
                         item_list = [{22305, 0, 1, 220, 0}],
                         title = lang:get("夺宝奇兵第3层全服首杀奖励！"),
                         msg =
                             lang:get("厉害！你所在的队伍在本服务器中第一个通过了夺宝奇兵第3关，获得星辰学院额外授予的奖励{fa"
                                      "ce_1,18}{face_1,18}")};
get_reward({10085, 4, 3}) ->
    #dungeon_reward_data{id = 10085, floor = 4, type = 3,
                         item_list = [{22305, 0, 1, 220, 0}],
                         title = lang:get("夺宝奇兵第4层全服首杀奖励！"),
                         msg =
                             lang:get("厉害！你所在的队伍在本服务器中第一个通过了夺宝奇兵第4关，获得星辰学院额外授予的奖励{fa"
                                      "ce_1,18}{face_1,18}")};
get_reward({10085, 5, 3}) ->
    #dungeon_reward_data{id = 10085, floor = 5, type = 3,
                         item_list = [{22305, 0, 1, 220, 0}],
                         title = lang:get("夺宝奇兵第5层全服首杀奖励！"),
                         msg =
                             lang:get("厉害！你所在的队伍在本服务器中第一个通过了夺宝奇兵第5关，获得星辰学院额外授予的奖励{fa"
                                      "ce_1,18}{face_1,18}")};
get_reward({10085, 6, 3}) ->
    #dungeon_reward_data{id = 10085, floor = 6, type = 3,
                         item_list = [{22305, 0, 1, 220, 0}],
                         title = lang:get("夺宝奇兵第6层全服首杀奖励！"),
                         msg =
                             lang:get("厉害！你所在的队伍在本服务器中第一个通过了夺宝奇兵第6关，获得星辰学院额外授予的奖励{fa"
                                      "ce_1,18}{face_1,18}")};
get_reward({10085, 7, 3}) ->
    #dungeon_reward_data{id = 10085, floor = 7, type = 3,
                         item_list = [{22306, 0, 1, 220, 0}],
                         title = lang:get("夺宝奇兵第7层全服首杀奖励！"),
                         msg =
                             lang:get("厉害！你所在的队伍在本服务器中第一个通过了夺宝奇兵第7关，获得星辰学院额外授予的奖励{fa"
                                      "ce_1,18}{face_1,18}")};
get_reward({10085, 8, 3}) ->
    #dungeon_reward_data{id = 10085, floor = 8, type = 3,
                         item_list = [{22306, 0, 1, 220, 0}],
                         title = lang:get("夺宝奇兵第8层全服首杀奖励！"),
                         msg =
                             lang:get("厉害！你所在的队伍在本服务器中第一个通过了夺宝奇兵第8关，获得星辰学院额外授予的奖励{fa"
                                      "ce_1,18}{face_1,18}")};
get_reward({10085, 9, 3}) ->
    #dungeon_reward_data{id = 10085, floor = 9, type = 3,
                         item_list = [{22307, 0, 1, 220, 0}],
                         title = lang:get("夺宝奇兵第9层全服首杀奖励！"),
                         msg =
                             lang:get("厉害！你所在的队伍在本服务器中第一个通过了夺宝奇兵第9关，获得星辰学院额外授予的奖励{fa"
                                      "ce_1,18}{face_1,18}")};
get_reward(_) -> false.

get_combat_buff({10085, 9}) ->
    #{need_floor => 6,
      buff => [{90231, 1000, 0, 0, [300]}]};
get_combat_buff({10085, 8}) ->
    #{need_floor => 5,
      buff => [{90231, 1000, 0, 0, [300]}]};
get_combat_buff({10085, 7}) ->
    #{need_floor => 4,
      buff => [{90231, 1000, 0, 0, [300]}]};
get_combat_buff({10085, 6}) ->
    #{need_floor => 3,
      buff => [{90231, 1000, 0, 0, [300]}]};
get_combat_buff({10085, 5}) ->
    #{need_floor => 2,
      buff => [{90231, 1000, 0, 0, [300]}]};
get_combat_buff({10085, 4}) ->
    #{need_floor => 1,
      buff => [{90231, 1000, 0, 0, [300]}]};
get_combat_buff(_) -> false.

get_unit_info(52011) -> {10085, 1};
get_unit_info(52021) -> {10085, 2};
get_unit_info(52031) -> {10085, 3};
get_unit_info(52041) -> {10085, 4};
get_unit_info(52051) -> {10085, 5};
get_unit_info(52061) -> {10085, 6};
get_unit_info(52071) -> {10085, 7};
get_unit_info(52081) -> {10085, 8};
get_unit_info(52091) -> {10085, 9};
get_unit_info(52014) -> {10085, 1};
get_unit_info(52025) -> {10085, 2};
get_unit_info(52035) -> {10085, 3};
get_unit_info(52044) -> {10085, 4};
get_unit_info(52054) -> {10085, 5};
get_unit_info(52062) -> {10085, 6};
get_unit_info(52075) -> {10085, 7};
get_unit_info(52085) -> {10085, 8};
get_unit_info(_) -> false.

get_card(1000) ->
    {{200, [{90002, 100}]},
     [#{item_id => 20046, item_num => 1, item_weight => 50,
        item_price => 150, announce => 1},
      #{item_id => 20021, item_num => 2, item_weight => 80,
        item_price => 50, announce => 0},
      #{item_id => 20022, item_num => 1, item_weight => 10,
        item_price => 100, announce => 0},
      #{item_id => 22585, item_num => 1, item_weight => 80,
        item_price => 150, announce => 0},
      #{item_id => 22212, item_num => 1, item_weight => 30,
        item_price => 150, announce => 0},
      #{item_id => 20088, item_num => 2, item_weight => 60,
        item_price => 100, announce => 0},
      #{item_id => 20074, item_num => 1, item_weight => 60,
        item_price => 50, announce => 0},
      #{item_id => 20075, item_num => 1, item_weight => 10,
        item_price => 150, announce => 1},
      #{item_id => 20076, item_num => 1, item_weight => 2,
        item_price => 150, announce => 1},
      #{item_id => 20025, item_num => 2, item_weight => 90,
        item_price => 50, announce => 0},
      #{item_id => 20087, item_num => 1, item_weight => 29,
        item_price => 100, announce => 1},
      #{item_id => 20061, item_num => 1, item_weight => 30,
        item_price => 150, announce => 0},
      #{item_id => 20095, item_num => 1, item_weight => 10,
        item_price => 150, announce => 1},
      #{item_id => 20038, item_num => 1, item_weight => 2,
        item_price => 150, announce => 1},
      #{item_id => 20014, item_num => 1, item_weight => 2,
        item_price => 150, announce => 1},
      #{item_id => 20040, item_num => 1, item_weight => 10,
        item_price => 150, announce => 1},
      #{item_id => 20039, item_num => 1, item_weight => 50,
        item_price => 100, announce => 0},
      #{item_id => 21220, item_num => 5, item_weight => 120,
        item_price => 100, announce => 0},
      #{item_id => 21101, item_num => 1, item_weight => 25,
        item_price => 150, announce => 0},
      #{item_id => 21221, item_num => 5, item_weight => 75,
        item_price => 50, announce => 0},
      #{item_id => 21222, item_num => 5, item_weight => 75,
        item_price => 100, announce => 0},
      #{item_id => 20005, item_num => 5, item_weight => 50,
        item_price => 50, announce => 0},
      #{item_id => 20004, item_num => 5, item_weight => 50,
        item_price => 50, announce => 0}]};
get_card(1001) ->
    {{200, [{90002, 100}]},
     [#{item_id => 20046, item_num => 1, item_weight => 50,
        item_price => 150, announce => 1},
      #{item_id => 20021, item_num => 2, item_weight => 80,
        item_price => 50, announce => 0},
      #{item_id => 20022, item_num => 1, item_weight => 10,
        item_price => 100, announce => 0},
      #{item_id => 22585, item_num => 1, item_weight => 80,
        item_price => 150, announce => 0},
      #{item_id => 22212, item_num => 1, item_weight => 30,
        item_price => 150, announce => 0},
      #{item_id => 20088, item_num => 2, item_weight => 60,
        item_price => 100, announce => 0},
      #{item_id => 20074, item_num => 1, item_weight => 60,
        item_price => 50, announce => 0},
      #{item_id => 20075, item_num => 1, item_weight => 10,
        item_price => 150, announce => 1},
      #{item_id => 20076, item_num => 1, item_weight => 2,
        item_price => 150, announce => 1},
      #{item_id => 20025, item_num => 2, item_weight => 90,
        item_price => 50, announce => 0},
      #{item_id => 20087, item_num => 1, item_weight => 29,
        item_price => 100, announce => 1},
      #{item_id => 20061, item_num => 1, item_weight => 30,
        item_price => 150, announce => 0},
      #{item_id => 20095, item_num => 1, item_weight => 10,
        item_price => 150, announce => 1},
      #{item_id => 20038, item_num => 1, item_weight => 2,
        item_price => 150, announce => 1},
      #{item_id => 20014, item_num => 1, item_weight => 2,
        item_price => 150, announce => 1},
      #{item_id => 20040, item_num => 1, item_weight => 10,
        item_price => 150, announce => 1},
      #{item_id => 20039, item_num => 1, item_weight => 50,
        item_price => 100, announce => 0},
      #{item_id => 21220, item_num => 5, item_weight => 120,
        item_price => 100, announce => 0},
      #{item_id => 21101, item_num => 1, item_weight => 25,
        item_price => 150, announce => 0},
      #{item_id => 21221, item_num => 5, item_weight => 75,
        item_price => 50, announce => 0},
      #{item_id => 21222, item_num => 5, item_weight => 75,
        item_price => 100, announce => 0},
      #{item_id => 20005, item_num => 5, item_weight => 50,
        item_price => 50, announce => 0},
      #{item_id => 20004, item_num => 5, item_weight => 50,
        item_price => 50, announce => 0}]};
get_card(1002) ->
    {{200, [{90002, 100}]},
     [#{item_id => 20046, item_num => 1, item_weight => 50,
        item_price => 150, announce => 1},
      #{item_id => 20021, item_num => 2, item_weight => 80,
        item_price => 50, announce => 0},
      #{item_id => 20022, item_num => 1, item_weight => 10,
        item_price => 100, announce => 0},
      #{item_id => 22585, item_num => 1, item_weight => 80,
        item_price => 150, announce => 0},
      #{item_id => 22212, item_num => 1, item_weight => 30,
        item_price => 150, announce => 0},
      #{item_id => 20088, item_num => 2, item_weight => 60,
        item_price => 100, announce => 0},
      #{item_id => 20074, item_num => 1, item_weight => 60,
        item_price => 50, announce => 0},
      #{item_id => 20075, item_num => 1, item_weight => 10,
        item_price => 150, announce => 1},
      #{item_id => 20076, item_num => 1, item_weight => 2,
        item_price => 150, announce => 1},
      #{item_id => 20025, item_num => 2, item_weight => 90,
        item_price => 50, announce => 0},
      #{item_id => 20087, item_num => 1, item_weight => 29,
        item_price => 100, announce => 1},
      #{item_id => 20061, item_num => 1, item_weight => 30,
        item_price => 150, announce => 0},
      #{item_id => 20095, item_num => 1, item_weight => 10,
        item_price => 150, announce => 1},
      #{item_id => 20038, item_num => 1, item_weight => 2,
        item_price => 150, announce => 1},
      #{item_id => 20014, item_num => 1, item_weight => 2,
        item_price => 150, announce => 1},
      #{item_id => 20040, item_num => 1, item_weight => 10,
        item_price => 150, announce => 1},
      #{item_id => 20039, item_num => 1, item_weight => 50,
        item_price => 100, announce => 0},
      #{item_id => 23819, item_num => 1, item_weight => 10,
        item_price => 100, announce => 1},
      #{item_id => 23820, item_num => 1, item_weight => 10,
        item_price => 150, announce => 1},
      #{item_id => 23821, item_num => 1, item_weight => 10,
        item_price => 100, announce => 1},
      #{item_id => 23822, item_num => 1, item_weight => 10,
        item_price => 100, announce => 1},
      #{item_id => 23823, item_num => 1, item_weight => 10,
        item_price => 150, announce => 1},
      #{item_id => 21220, item_num => 5, item_weight => 120,
        item_price => 100, announce => 0},
      #{item_id => 21101, item_num => 1, item_weight => 25,
        item_price => 150, announce => 0},
      #{item_id => 21221, item_num => 5, item_weight => 50,
        item_price => 50, announce => 0},
      #{item_id => 21222, item_num => 5, item_weight => 50,
        item_price => 100, announce => 0},
      #{item_id => 21243, item_num => 1, item_weight => 300,
        item_price => 150, announce => 0},
      #{item_id => 20005, item_num => 5, item_weight => 50,
        item_price => 50, announce => 0},
      #{item_id => 20004, item_num => 5, item_weight => 50,
        item_price => 50, announce => 0}]};
get_card(1003) ->
    {{200, [{90002, 100}]},
     [#{item_id => 20046, item_num => 1, item_weight => 50,
        item_price => 150, announce => 0},
      #{item_id => 20021, item_num => 2, item_weight => 80,
        item_price => 50, announce => 0},
      #{item_id => 20022, item_num => 1, item_weight => 58,
        item_price => 100, announce => 0},
      #{item_id => 21098, item_num => 3, item_weight => 80,
        item_price => 100, announce => 0},
      #{item_id => 22212, item_num => 1, item_weight => 30,
        item_price => 150, announce => 0},
      #{item_id => 20088, item_num => 2, item_weight => 60,
        item_price => 100, announce => 0},
      #{item_id => 20074, item_num => 1, item_weight => 60,
        item_price => 50, announce => 0},
      #{item_id => 20075, item_num => 1, item_weight => 10,
        item_price => 150, announce => 0},
      #{item_id => 20076, item_num => 1, item_weight => 2,
        item_price => 150, announce => 0},
      #{item_id => 20025, item_num => 2, item_weight => 40,
        item_price => 50, announce => 0},
      #{item_id => 20087, item_num => 1, item_weight => 29,
        item_price => 100, announce => 0},
      #{item_id => 22306, item_num => 1, item_weight => 50,
        item_price => 100, announce => 0},
      #{item_id => 23550, item_num => 1, item_weight => 30,
        item_price => 150, announce => 0},
      #{item_id => 20095, item_num => 1, item_weight => 10,
        item_price => 150, announce => 0},
      #{item_id => 20038, item_num => 1, item_weight => 2,
        item_price => 150, announce => 0},
      #{item_id => 20014, item_num => 1, item_weight => 2,
        item_price => 150, announce => 0},
      #{item_id => 20040, item_num => 1, item_weight => 10,
        item_price => 150, announce => 0},
      #{item_id => 23660, item_num => 1, item_weight => 2,
        item_price => 150, announce => 0},
      #{item_id => 23819, item_num => 1, item_weight => 10,
        item_price => 100, announce => 0},
      #{item_id => 23820, item_num => 1, item_weight => 10,
        item_price => 150, announce => 0},
      #{item_id => 23821, item_num => 1, item_weight => 10,
        item_price => 100, announce => 0},
      #{item_id => 23822, item_num => 1, item_weight => 10,
        item_price => 100, announce => 0},
      #{item_id => 23823, item_num => 1, item_weight => 10,
        item_price => 150, announce => 0},
      #{item_id => 21220, item_num => 5, item_weight => 120,
        item_price => 100, announce => 0},
      #{item_id => 21101, item_num => 1, item_weight => 25,
        item_price => 150, announce => 0},
      #{item_id => 21221, item_num => 5, item_weight => 50,
        item_price => 50, announce => 0},
      #{item_id => 21222, item_num => 5, item_weight => 50,
        item_price => 100, announce => 0},
      #{item_id => 21243, item_num => 1, item_weight => 600,
        item_price => 150, announce => 0},
      #{item_id => 20005, item_num => 5, item_weight => 50,
        item_price => 50, announce => 0},
      #{item_id => 20004, item_num => 5, item_weight => 50,
        item_price => 50, announce => 0}]};
get_card(_) -> false.

get_card_main(1000) ->
    [#{item_id => 20021, item_num => 1, item_weight => 39,
       announce => 0},
     #{item_id => 20022, item_num => 1, item_weight => 15,
       announce => 1},
     #{item_id => 20008, item_num => 1, item_weight => 40,
       announce => 1},
     #{item_id => 21100, item_num => 1, item_weight => 15,
       announce => 1},
     #{item_id => 20034, item_num => 1, item_weight => 90,
       announce => 0},
     #{item_id => 20000, item_num => 1, item_weight => 60,
       announce => 0},
     #{item_id => 20351, item_num => 1, item_weight => 130,
       announce => 0},
     #{item_id => 20074, item_num => 1, item_weight => 20,
       announce => 0},
     #{item_id => 20087, item_num => 1, item_weight => 125,
       announce => 1},
     #{item_id => 20025, item_num => 1, item_weight => 54,
       announce => 0},
     #{item_id => 20039, item_num => 1, item_weight => 20,
       announce => 0},
     #{item_id => 20013, item_num => 1, item_weight => 50,
       announce => 0},
     #{item_id => 20005, item_num => 1, item_weight => 80,
       announce => 0},
     #{item_id => 21220, item_num => 1, item_weight => 100,
       announce => 0},
     #{item_id => 21221, item_num => 1, item_weight => 82,
       announce => 0},
     #{item_id => 21222, item_num => 1, item_weight => 80,
       announce => 0}];
get_card_main(1001) ->
    [#{item_id => 20021, item_num => 1, item_weight => 39,
       announce => 0},
     #{item_id => 20022, item_num => 1, item_weight => 15,
       announce => 1},
     #{item_id => 20008, item_num => 1, item_weight => 40,
       announce => 1},
     #{item_id => 21100, item_num => 1, item_weight => 15,
       announce => 1},
     #{item_id => 20034, item_num => 1, item_weight => 90,
       announce => 0},
     #{item_id => 20000, item_num => 1, item_weight => 60,
       announce => 0},
     #{item_id => 20352, item_num => 1, item_weight => 140,
       announce => 0},
     #{item_id => 20074, item_num => 1, item_weight => 20,
       announce => 0},
     #{item_id => 20087, item_num => 1, item_weight => 95,
       announce => 1},
     #{item_id => 20025, item_num => 1, item_weight => 60,
       announce => 0},
     #{item_id => 20039, item_num => 1, item_weight => 16,
       announce => 0},
     #{item_id => 20013, item_num => 1, item_weight => 50,
       announce => 0},
     #{item_id => 20005, item_num => 1, item_weight => 80,
       announce => 0},
     #{item_id => 21220, item_num => 1, item_weight => 100,
       announce => 0},
     #{item_id => 21221, item_num => 1, item_weight => 100,
       announce => 0},
     #{item_id => 21222, item_num => 1, item_weight => 80,
       announce => 0}];
get_card_main(1002) ->
    [#{item_id => 20021, item_num => 1, item_weight => 54,
       announce => 0},
     #{item_id => 20022, item_num => 1, item_weight => 15,
       announce => 1},
     #{item_id => 20008, item_num => 1, item_weight => 40,
       announce => 1},
     #{item_id => 21100, item_num => 1, item_weight => 15,
       announce => 1},
     #{item_id => 20034, item_num => 1, item_weight => 90,
       announce => 0},
     #{item_id => 20000, item_num => 1, item_weight => 60,
       announce => 0},
     #{item_id => 20353, item_num => 1, item_weight => 70,
       announce => 1},
     #{item_id => 22211, item_num => 1, item_weight => 15,
       announce => 0},
     #{item_id => 20074, item_num => 1, item_weight => 20,
       announce => 0},
     #{item_id => 20087, item_num => 1, item_weight => 125,
       announce => 1},
     #{item_id => 20025, item_num => 1, item_weight => 70,
       announce => 0},
     #{item_id => 20039, item_num => 1, item_weight => 6,
       announce => 0},
     #{item_id => 20013, item_num => 1, item_weight => 60,
       announce => 0},
     #{item_id => 20005, item_num => 1, item_weight => 80,
       announce => 0},
     #{item_id => 21220, item_num => 1, item_weight => 100,
       announce => 0},
     #{item_id => 21221, item_num => 1, item_weight => 100,
       announce => 0},
     #{item_id => 21222, item_num => 1, item_weight => 80,
       announce => 0}];
get_card_main(1003) ->
    [#{item_id => 20021, item_num => 1, item_weight => 54,
       announce => 0},
     #{item_id => 20022, item_num => 1, item_weight => 15,
       announce => 1},
     #{item_id => 20008, item_num => 1, item_weight => 40,
       announce => 1},
     #{item_id => 21100, item_num => 1, item_weight => 25,
       announce => 1},
     #{item_id => 20034, item_num => 1, item_weight => 90,
       announce => 0},
     #{item_id => 20000, item_num => 1, item_weight => 60,
       announce => 0},
     #{item_id => 20354, item_num => 1, item_weight => 40,
       announce => 1},
     #{item_id => 21137, item_num => 1, item_weight => 5,
       announce => 1},
     #{item_id => 22211, item_num => 1, item_weight => 10,
       announce => 0},
     #{item_id => 20074, item_num => 1, item_weight => 20,
       announce => 0},
     #{item_id => 20087, item_num => 1, item_weight => 125,
       announce => 1},
     #{item_id => 20025, item_num => 1, item_weight => 70,
       announce => 0},
     #{item_id => 20039, item_num => 1, item_weight => 26,
       announce => 0},
     #{item_id => 20013, item_num => 1, item_weight => 60,
       announce => 0},
     #{item_id => 20005, item_num => 1, item_weight => 80,
       announce => 0},
     #{item_id => 21220, item_num => 1, item_weight => 100,
       announce => 0},
     #{item_id => 21221, item_num => 1, item_weight => 100,
       announce => 0},
     #{item_id => 21222, item_num => 1, item_weight => 80,
       announce => 0}];
get_card_main(_) -> false.

get_day_limit(1) -> 0;
get_day_limit(2) -> 0;
get_day_limit(3) -> 0;
get_day_limit(4) -> 0;
get_day_limit(5) -> 0;
get_day_limit(6) -> 0;
get_day_limit(7) -> 0;
get_day_limit(8) -> 0;
get_day_limit(9) -> 0;
get_day_limit(10) -> 0;
get_day_limit(11) -> 0;
get_day_limit(12) -> 0;
get_day_limit(13) -> 0;
get_day_limit(14) -> 0;
get_day_limit(15) -> 0;
get_day_limit(16) -> 0;
get_day_limit(17) -> 0;
get_day_limit(18) -> 0;
get_day_limit(19) -> 0;
get_day_limit(20) -> 0;
get_day_limit(21) -> 0;
get_day_limit(22) -> 0;
get_day_limit(23) -> 0;
get_day_limit(24) -> 0;
get_day_limit(25) -> 0;
get_day_limit(26) -> 0;
get_day_limit(27) -> 0;
get_day_limit(28) -> 0;
get_day_limit(29) -> 0;
get_day_limit(30) -> 0;
get_day_limit(31) -> 0;
get_day_limit(32) -> 0;
get_day_limit(33) -> 0;
get_day_limit(34) -> 0;
get_day_limit(35) -> 3;
get_day_limit(36) -> 3;
get_day_limit(37) -> 3;
get_day_limit(38) -> 3;
get_day_limit(39) -> 3;
get_day_limit(40) -> 3;
get_day_limit(41) -> 3;
get_day_limit(42) -> 3;
get_day_limit(43) -> 3;
get_day_limit(44) -> 3;
get_day_limit(45) -> 3;
get_day_limit(46) -> 3;
get_day_limit(47) -> 3;
get_day_limit(48) -> 3;
get_day_limit(49) -> 3;
get_day_limit(50) -> 5;
get_day_limit(51) -> 5;
get_day_limit(52) -> 5;
get_day_limit(53) -> 5;
get_day_limit(54) -> 5;
get_day_limit(55) -> 5;
get_day_limit(56) -> 5;
get_day_limit(57) -> 5;
get_day_limit(58) -> 5;
get_day_limit(59) -> 5;
get_day_limit(60) -> 5;
get_day_limit(61) -> 5;
get_day_limit(62) -> 5;
get_day_limit(63) -> 5;
get_day_limit(64) -> 5;
get_day_limit(65) -> 5;
get_day_limit(66) -> 5;
get_day_limit(67) -> 5;
get_day_limit(68) -> 5;
get_day_limit(69) -> 5;
get_day_limit(70) -> 5;
get_day_limit(71) -> 5;
get_day_limit(72) -> 5;
get_day_limit(73) -> 5;
get_day_limit(74) -> 5;
get_day_limit(75) -> 5;
get_day_limit(76) -> 5;
get_day_limit(77) -> 5;
get_day_limit(78) -> 5;
get_day_limit(79) -> 5;
get_day_limit(80) -> 5;
get_day_limit(81) -> 5;
get_day_limit(82) -> 5;
get_day_limit(83) -> 5;
get_day_limit(84) -> 5;
get_day_limit(85) -> 5;
get_day_limit(86) -> 5;
get_day_limit(87) -> 5;
get_day_limit(88) -> 5;
get_day_limit(89) -> 5;
get_day_limit(90) -> 5;
get_day_limit(91) -> 5;
get_day_limit(92) -> 5;
get_day_limit(93) -> 5;
get_day_limit(94) -> 5;
get_day_limit(95) -> 5;
get_day_limit(96) -> 5;
get_day_limit(97) -> 5;
get_day_limit(98) -> 5;
get_day_limit(99) -> 5;
get_day_limit(100) -> 5;
get_day_limit(101) -> 5;
get_day_limit(102) -> 5;
get_day_limit(103) -> 5;
get_day_limit(104) -> 5;
get_day_limit(105) -> 5;
get_day_limit(106) -> 5;
get_day_limit(107) -> 5;
get_day_limit(108) -> 5;
get_day_limit(109) -> 5;
get_day_limit(110) -> 5;
get_day_limit(111) -> 5;
get_day_limit(112) -> 5;
get_day_limit(113) -> 5;
get_day_limit(114) -> 5;
get_day_limit(115) -> 5;
get_day_limit(116) -> 5;
get_day_limit(117) -> 5;
get_day_limit(118) -> 5;
get_day_limit(119) -> 5;
get_day_limit(120) -> 5;
get_day_limit(121) -> 5;
get_day_limit(122) -> 5;
get_day_limit(123) -> 5;
get_day_limit(124) -> 5;
get_day_limit(125) -> 5;
get_day_limit(126) -> 5;
get_day_limit(127) -> 5;
get_day_limit(128) -> 5;
get_day_limit(129) -> 5;
get_day_limit(130) -> 5;
get_day_limit(131) -> 5;
get_day_limit(132) -> 5;
get_day_limit(133) -> 5;
get_day_limit(134) -> 5;
get_day_limit(135) -> 5;
get_day_limit(136) -> 5;
get_day_limit(137) -> 5;
get_day_limit(138) -> 5;
get_day_limit(139) -> 5;
get_day_limit(140) -> 5;
get_day_limit(141) -> 5;
get_day_limit(142) -> 5;
get_day_limit(143) -> 5;
get_day_limit(144) -> 5;
get_day_limit(145) -> 5;
get_day_limit(146) -> 5;
get_day_limit(147) -> 5;
get_day_limit(148) -> 5;
get_day_limit(149) -> 5;
get_day_limit(150) -> 5;
get_day_limit(_) -> 0.

get_kickout_energy(20005) -> 100;
get_kickout_energy(20004) -> 100;
get_kickout_energy(20007) -> 100;
get_kickout_energy(20008) -> 100;
get_kickout_energy(_) -> 0.

