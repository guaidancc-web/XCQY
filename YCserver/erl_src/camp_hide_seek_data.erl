-file("src/data/camp_hide_seek_data.erl", 1).

-module(camp_hide_seek_data).

-export([ids/0,
         get_group/1,
         get_unit/1,
         get_quest/1,
         get_map/1,
         get_reward/1,
         get_quest_info/1]).

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

-file("src/data/camp_hide_seek_data.erl", 21).

-file("inc/camp_hide_seek.hrl", 1).

-record(camp_hide_seek,
        {refresh_time = 0,
         group = 0,
         list = [],
         is_reward = 0,
         active_list = []}).

-record(camp_hide_seek_unit,
        {id = {0, 0}, base_id = 0, pos}).

-record(camp_hide_seek_unit_data,
        {base_id = 0,
         id = 0,
         reward = [],
         rand_reward = [],
         cast_msg = "",
         exp_mode = 0,
         quest_id = 0,
         first_id = 0}).

-record(camp_hide_seek_group_data,
        {id = 0,
         unit_list = [],
         cast_msg = "",
         end_cast_msg = ""}).

-record(camp_hide_seek_reward_data,
        {min = 0,
         max = 0,
         reward = [],
         rand_reward = [],
         cast_msg = "",
         exp_mode = 0}).

-record(camp_hide_seek_quest_data,
        {quest_id = 0, unit_id = 0, next_id = 0}).

-file("src/data/camp_hide_seek_data.erl", 22).

ids() -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11].

get_group(1) ->
    #camp_hide_seek_group_data{id = 1,
                               unit_list =
                                   [{76520, 1},
                                    {76522, 7},
                                    {76525, 15},
                                    {76524, 31},
                                    {76533, 41}],
                               cast_msg =
                                   lang:get("<color='#00ff00'>捉迷藏</color>活动了开始了，<color='#f"
                                            "fff00'>机灵的小孩们</color>都藏好了，快去寻找他们吧{face_1,7}"),
                               end_cast_msg =
                                   lang:get("天色渐晚，<color='#00ff00'>捉迷藏</color>活动正式结束，小朋友们都"
                                            "玩得很开心{face_1,33}")};
get_group(2) ->
    #camp_hide_seek_group_data{id = 2,
                               unit_list =
                                   [{76521, 18},
                                    {76526, 23},
                                    {76532, 35},
                                    {76528, 27},
                                    {76529, 47}],
                               cast_msg =
                                   lang:get("<color='#00ff00'>捉迷藏</color>活动了开始了，<color='#f"
                                            "fff00'>机灵的小孩们</color>都藏好了，快去寻找他们吧{face_1,7}"),
                               end_cast_msg =
                                   lang:get("天色渐晚，<color='#00ff00'>捉迷藏</color>活动正式结束，小朋友们都"
                                            "玩得很开心{face_1,33}")};
get_group(3) ->
    #camp_hide_seek_group_data{id = 3,
                               unit_list =
                                   [{76523, 2},
                                    {76533, 16},
                                    {76524, 24},
                                    {76526, 32},
                                    {76525, 42}],
                               cast_msg =
                                   lang:get("<color='#00ff00'>捉迷藏</color>活动了开始了，<color='#f"
                                            "fff00'>机灵的小孩们</color>都藏好了，快去寻找他们吧{face_1,7}"),
                               end_cast_msg =
                                   lang:get("天色渐晚，<color='#00ff00'>捉迷藏</color>活动正式结束，小朋友们都"
                                            "玩得很开心{face_1,33}")};
get_group(4) ->
    #camp_hide_seek_group_data{id = 4,
                               unit_list =
                                   [{76528, 8},
                                    {76531, 19},
                                    {76522, 28},
                                    {76529, 36},
                                    {76526, 48}],
                               cast_msg =
                                   lang:get("<color='#00ff00'>捉迷藏</color>活动了开始了，<color='#f"
                                            "fff00'>机灵的小孩们</color>都藏好了，快去寻找他们吧{face_1,7}"),
                               end_cast_msg =
                                   lang:get("天色渐晚，<color='#00ff00'>捉迷藏</color>活动正式结束，小朋友们都"
                                            "玩得很开心{face_1,33}")};
get_group(5) ->
    #camp_hide_seek_group_data{id = 5,
                               unit_list =
                                   [{76531, 49},
                                    {76521, 29},
                                    {76529, 9},
                                    {76525, 17},
                                    {76532, 33}],
                               cast_msg =
                                   lang:get("<color='#00ff00'>捉迷藏</color>活动了开始了，<color='#f"
                                            "fff00'>机灵的小孩们</color>都藏好了，快去寻找他们吧{face_1,7}"),
                               end_cast_msg =
                                   lang:get("天色渐晚，<color='#00ff00'>捉迷藏</color>活动正式结束，小朋友们都"
                                            "玩得很开心{face_1,33}")};
get_group(6) ->
    #camp_hide_seek_group_data{id = 6,
                               unit_list =
                                   [{76520, 6},
                                    {76522, 14},
                                    {76525, 20},
                                    {76532, 38},
                                    {76524, 50}],
                               cast_msg =
                                   lang:get("<color='#00ff00'>捉迷藏</color>活动了开始了，<color='#f"
                                            "fff00'>机灵的小孩们</color>都藏好了，快去寻找他们吧{face_1,7}"),
                               end_cast_msg =
                                   lang:get("天色渐晚，<color='#00ff00'>捉迷藏</color>活动正式结束，小朋友们都"
                                            "玩得很开心{face_1,33}")};
get_group(7) ->
    #camp_hide_seek_group_data{id = 7,
                               unit_list =
                                   [{76531, 43},
                                    {76533, 25},
                                    {76524, 3},
                                    {76526, 37},
                                    {76532, 20}],
                               cast_msg =
                                   lang:get("<color='#00ff00'>捉迷藏</color>活动了开始了，<color='#f"
                                            "fff00'>机灵的小孩们</color>都藏好了，快去寻找他们吧{face_1,7}"),
                               end_cast_msg =
                                   lang:get("天色渐晚，<color='#00ff00'>捉迷藏</color>活动正式结束，小朋友们都"
                                            "玩得很开心{face_1,33}")};
get_group(8) ->
    #camp_hide_seek_group_data{id = 8,
                               unit_list =
                                   [{76520, 10},
                                    {76526, 21},
                                    {76524, 44},
                                    {76528, 50},
                                    {76529, 38}],
                               cast_msg =
                                   lang:get("<color='#00ff00'>捉迷藏</color>活动了开始了，<color='#f"
                                            "fff00'>机灵的小孩们</color>都藏好了，快去寻找他们吧{face_1,7}"),
                               end_cast_msg =
                                   lang:get("天色渐晚，<color='#00ff00'>捉迷藏</color>活动正式结束，小朋友们都"
                                            "玩得很开心{face_1,33}")};
get_group(9) ->
    #camp_hide_seek_group_data{id = 9,
                               unit_list =
                                   [{76522, 34},
                                    {76528, 30},
                                    {76526, 26},
                                    {76525, 4},
                                    {76520, 11}],
                               cast_msg =
                                   lang:get("<color='#00ff00'>捉迷藏</color>活动了开始了，<color='#f"
                                            "fff00'>机灵的小孩们</color>都藏好了，快去寻找他们吧{face_1,7}"),
                               end_cast_msg =
                                   lang:get("天色渐晚，<color='#00ff00'>捉迷藏</color>活动正式结束，小朋友们都"
                                            "玩得很开心{face_1,33}")};
get_group(10) ->
    #camp_hide_seek_group_data{id = 10,
                               unit_list =
                                   [{76524, 12},
                                    {76529, 39},
                                    {76525, 51},
                                    {76523, 45},
                                    {76520, 5}],
                               cast_msg =
                                   lang:get("<color='#00ff00'>捉迷藏</color>活动了开始了，<color='#f"
                                            "fff00'>机灵的小孩们</color>都藏好了，快去寻找他们吧{face_1,7}"),
                               end_cast_msg =
                                   lang:get("天色渐晚，<color='#00ff00'>捉迷藏</color>活动正式结束，小朋友们都"
                                            "玩得很开心{face_1,33}")};
get_group(11) ->
    #camp_hide_seek_group_data{id = 11,
                               unit_list =
                                   [{76525, 13},
                                    {76522, 22},
                                    {76531, 40},
                                    {76526, 46},
                                    {76523, 52}],
                               cast_msg =
                                   lang:get("<color='#00ff00'>捉迷藏</color>活动了开始了，<color='#f"
                                            "fff00'>机灵的小孩们</color>都藏好了，快去寻找他们吧{face_1,7}"),
                               end_cast_msg =
                                   lang:get("天色渐晚，<color='#00ff00'>捉迷藏</color>活动正式结束，小朋友们都"
                                            "玩得很开心{face_1,33}")};
get_group(_) -> false.

get_unit(76520) ->
    #camp_hide_seek_unit_data{base_id = 76520, id = 1,
                              rand_reward =
                                  [{20038, 0, 1, 1, 1},
                                   {20087, 0, 1, 10, 1},
                                   {20000, 0, 1, 15, 0},
                                   {20034, 0, 1, 271, 0},
                                   {20075, 0, 1, 3, 1},
                                   {20021, 0, 1, 300, 0},
                                   {20006, 0, 5, 300, 0},
                                   {71341, 0, 1, 100, 1}],
                              cast_msg =
                                  lang:get("#role#在和<color='#ffff00'>魔药学徒维娜</color><color"
                                           "='#00ff00'>捉迷藏</color>时躲到了大榕树下，竟意外发现了#item#{f"
                                           "ace_1,29}"),
                              exp_mode = 3324, quest_id = 81251,
                              first_id = 81250};
get_unit(76521) ->
    #camp_hide_seek_unit_data{base_id = 76521, id = 2,
                              rand_reward =
                                  [{20038, 0, 1, 1, 1},
                                   {20087, 0, 1, 10, 1},
                                   {20000, 0, 1, 15, 0},
                                   {20034, 0, 1, 271, 0},
                                   {20075, 0, 1, 3, 1},
                                   {20021, 0, 1, 300, 0},
                                   {20006, 0, 5, 300, 0},
                                   {71341, 0, 1, 100, 1}],
                              cast_msg =
                                  lang:get("#role#在和<color='#ffff00'>爱宠达人安妮</color><color"
                                           "='#00ff00'>捉迷藏</color>时躲到了大榕树下，竟意外发现了#item#{f"
                                           "ace_1,29}"),
                              exp_mode = 3324, quest_id = 81261,
                              first_id = 81260};
get_unit(76522) ->
    #camp_hide_seek_unit_data{base_id = 76522, id = 3,
                              rand_reward =
                                  [{20038, 0, 1, 1, 1},
                                   {20087, 0, 1, 10, 1},
                                   {20000, 0, 1, 15, 0},
                                   {20034, 0, 1, 271, 0},
                                   {20075, 0, 1, 3, 1},
                                   {20021, 0, 1, 300, 0},
                                   {20006, 0, 5, 300, 0},
                                   {71341, 0, 1, 100, 1}],
                              cast_msg =
                                  lang:get("#role#在和<color='#ffff00'>善良的萌萌</color><color="
                                           "'#00ff00'>捉迷藏</color>时躲到了大榕树下，竟意外发现了#item#{fa"
                                           "ce_1,29}"),
                              exp_mode = 3324, quest_id = 81201,
                              first_id = 81200};
get_unit(76523) ->
    #camp_hide_seek_unit_data{base_id = 76523, id = 4,
                              rand_reward =
                                  [{20038, 0, 1, 1, 1},
                                   {20087, 0, 1, 10, 1},
                                   {20000, 0, 1, 15, 0},
                                   {20034, 0, 1, 271, 0},
                                   {20075, 0, 1, 3, 1},
                                   {20021, 0, 1, 300, 0},
                                   {20006, 0, 5, 300, 0},
                                   {71341, 0, 1, 100, 1}],
                              cast_msg =
                                  lang:get("#role#在和<color='#ffff00'>美食家温妮</color><color="
                                           "'#00ff00'>捉迷藏</color>时躲到了大榕树下，竟意外发现了#item#{fa"
                                           "ce_1,29}"),
                              exp_mode = 3324, quest_id = 81232,
                              first_id = 81230};
get_unit(76524) ->
    #camp_hide_seek_unit_data{base_id = 76524, id = 5,
                              rand_reward =
                                  [{20038, 0, 1, 1, 1},
                                   {20087, 0, 1, 10, 1},
                                   {20000, 0, 1, 15, 0},
                                   {20034, 0, 1, 271, 0},
                                   {20075, 0, 1, 3, 1},
                                   {20021, 0, 1, 300, 0},
                                   {20006, 0, 5, 300, 0},
                                   {71341, 0, 1, 100, 1}],
                              cast_msg =
                                  lang:get("#role#在和<color='#ffff00'>活泼的莉莉</color><color="
                                           "'#00ff00'>捉迷藏</color>时躲到了大榕树下，竟意外发现了#item#{fa"
                                           "ce_1,29}"),
                              exp_mode = 3324, quest_id = 81242,
                              first_id = 81240};
get_unit(76525) ->
    #camp_hide_seek_unit_data{base_id = 76525, id = 6,
                              rand_reward =
                                  [{20038, 0, 1, 1, 1},
                                   {20087, 0, 1, 10, 1},
                                   {20000, 0, 1, 15, 0},
                                   {20034, 0, 1, 271, 0},
                                   {20075, 0, 1, 3, 1},
                                   {20021, 0, 1, 300, 0},
                                   {20006, 0, 5, 300, 0},
                                   {71341, 0, 1, 100, 1}],
                              cast_msg =
                                  lang:get("#role#在和<color='#ffff00'>冒险家杰克</color><color="
                                           "'#00ff00'>捉迷藏</color>时躲到了大榕树下，竟意外发现了#item#{fa"
                                           "ce_1,29}"),
                              exp_mode = 3324, quest_id = 81212,
                              first_id = 81210};
get_unit(76526) ->
    #camp_hide_seek_unit_data{base_id = 76526, id = 7,
                              rand_reward =
                                  [{20038, 0, 1, 1, 1},
                                   {20087, 0, 1, 10, 1},
                                   {20000, 0, 1, 15, 0},
                                   {20034, 0, 1, 271, 0},
                                   {20075, 0, 1, 3, 1},
                                   {20021, 0, 1, 300, 0},
                                   {20006, 0, 5, 300, 0},
                                   {71341, 0, 1, 100, 1}],
                              cast_msg =
                                  lang:get("#role#在和<color='#ffff00'>见习骑士亚瑟</color><color"
                                           "='#00ff00'>捉迷藏</color>时躲到了大榕树下，竟意外发现了#item#{f"
                                           "ace_1,29}"),
                              exp_mode = 3324, quest_id = 81222,
                              first_id = 81220};
get_unit(76528) ->
    #camp_hide_seek_unit_data{base_id = 76528, id = 9,
                              rand_reward =
                                  [{20038, 0, 1, 1, 1},
                                   {20087, 0, 1, 10, 1},
                                   {20000, 0, 1, 15, 0},
                                   {20034, 0, 1, 271, 0},
                                   {20075, 0, 1, 3, 1},
                                   {20021, 0, 1, 300, 0},
                                   {20006, 0, 5, 300, 0},
                                   {71341, 0, 1, 100, 1}],
                              cast_msg =
                                  lang:get("#role#在和<color='#ffff00'>龙猫少女苏珊</color><color"
                                           "='#00ff00'>捉迷藏</color>时躲到了大榕树下，竟意外发现了#item#{f"
                                           "ace_1,29}"),
                              exp_mode = 3324, quest_id = 81282,
                              first_id = 81280};
get_unit(76529) ->
    #camp_hide_seek_unit_data{base_id = 76529, id = 10,
                              rand_reward =
                                  [{20038, 0, 1, 1, 1},
                                   {20087, 0, 1, 10, 1},
                                   {20000, 0, 1, 15, 0},
                                   {20034, 0, 1, 271, 0},
                                   {20075, 0, 1, 3, 1},
                                   {20021, 0, 1, 300, 0},
                                   {20006, 0, 5, 300, 0},
                                   {71341, 0, 1, 100, 1}],
                              cast_msg =
                                  lang:get("#role#在和<color='#ffff00'>鲜花少女诺玛</color><color"
                                           "='#00ff00'>捉迷藏</color>时躲到了大榕树下，竟意外发现了#item#{f"
                                           "ace_1,29}"),
                              exp_mode = 3324, quest_id = 81292,
                              first_id = 81290};
get_unit(76531) ->
    #camp_hide_seek_unit_data{base_id = 76531, id = 12,
                              rand_reward =
                                  [{20038, 0, 1, 1, 1},
                                   {20087, 0, 1, 10, 1},
                                   {20000, 0, 1, 15, 0},
                                   {20034, 0, 1, 271, 0},
                                   {20075, 0, 1, 3, 1},
                                   {20021, 0, 1, 300, 0},
                                   {20006, 0, 5, 300, 0},
                                   {71341, 0, 1, 100, 1}],
                              cast_msg =
                                  lang:get("#role#在和<color='#ffff00'>小厨师莎拉</color><color="
                                           "'#00ff00'>捉迷藏</color>时躲到了大榕树下，竟意外发现了#item#{fa"
                                           "ce_1,29}"),
                              exp_mode = 3324, quest_id = 81313,
                              first_id = 81310};
get_unit(76532) ->
    #camp_hide_seek_unit_data{base_id = 76532, id = 13,
                              rand_reward =
                                  [{20038, 0, 1, 1, 1},
                                   {20087, 0, 1, 10, 1},
                                   {20000, 0, 1, 15, 0},
                                   {20034, 0, 1, 271, 0},
                                   {20075, 0, 1, 3, 1},
                                   {20021, 0, 1, 300, 0},
                                   {20006, 0, 5, 300, 0},
                                   {71341, 0, 1, 100, 1}],
                              cast_msg =
                                  lang:get("#role#在和<color='#ffff00'>糊涂侦探托尼</color><color"
                                           "='#00ff00'>捉迷藏</color>时躲到了大榕树下，竟意外发现了#item#{f"
                                           "ace_1,29}"),
                              exp_mode = 3324, quest_id = 81322,
                              first_id = 81320};
get_unit(76533) ->
    #camp_hide_seek_unit_data{base_id = 76533, id = 14,
                              rand_reward =
                                  [{20038, 0, 1, 1, 1},
                                   {20087, 0, 1, 10, 1},
                                   {20000, 0, 1, 15, 0},
                                   {20034, 0, 1, 271, 0},
                                   {20075, 0, 1, 3, 1},
                                   {20021, 0, 1, 300, 0},
                                   {20006, 0, 5, 300, 0},
                                   {71341, 0, 1, 100, 1}],
                              cast_msg =
                                  lang:get("#role#在和<color='#ffff00'>迷路小孩杰夫</color><color"
                                           "='#00ff00'>捉迷藏</color>时躲到了大榕树下，竟意外发现了#item#{f"
                                           "ace_1,29}"),
                              exp_mode = 3324, quest_id = 81332,
                              first_id = 81330};
get_unit(_) -> false.

get_quest(81251) -> 76520;
get_quest(81261) -> 76521;
get_quest(81201) -> 76522;
get_quest(81232) -> 76523;
get_quest(81242) -> 76524;
get_quest(81212) -> 76525;
get_quest(81222) -> 76526;
get_quest(81282) -> 76528;
get_quest(81292) -> 76529;
get_quest(81313) -> 76531;
get_quest(81322) -> 76532;
get_quest(81332) -> 76533;
get_quest(_) -> 0.

get_map(1) -> {10001, [{3246, 549}]};
get_map(2) -> {10001, [{263, 1248}]};
get_map(3) -> {10001, [{4930, 1566}]};
get_map(4) -> {10001, [{306, 2553}]};
get_map(5) -> {10001, [{2577, 3867}]};
get_map(6) -> {10001, [{4661, 3829}]};
get_map(7) -> {10002, [{1605, 404}]};
get_map(8) -> {10002, [{2587, 464}]};
get_map(9) -> {10003, [{2066, 2828}]};
get_map(10) -> {10003, [{398, 929}]};
get_map(11) -> {10003, [{1079, 250}]};
get_map(12) -> {10003, [{2337, 357}]};
get_map(13) -> {10003, [{2862, 463}]};
get_map(14) -> {10003, [{3118, 655}]};
get_map(15) -> {10004, [{1958, 423}]};
get_map(16) -> {10004, [{440, 1788}]};
get_map(17) -> {10004, [{850, 2206}]};
get_map(18) -> {10007, [{1428, 2736}]};
get_map(19) -> {10007, [{252, 1052}]};
get_map(20) -> {10007, [{579, 496}]};
get_map(21) -> {10007, [{1093, 248}]};
get_map(22) -> {10007, [{1680, 348}]};
get_map(23) -> {50001, [{1369, 395}]};
get_map(24) -> {50001, [{1865, 562}]};
get_map(25) -> {50001, [{230, 1142}]};
get_map(26) -> {50001, [{1347, 1635}]};
get_map(27) -> {50002, [{1369, 395}]};
get_map(28) -> {50002, [{1865, 562}]};
get_map(29) -> {50002, [{230, 1142}]};
get_map(30) -> {50002, [{1319, 1502}]};
get_map(31) -> {50003, [{1369, 395}]};
get_map(32) -> {50003, [{1865, 562}]};
get_map(33) -> {50003, [{230, 1142}]};
get_map(34) -> {50003, [{1319, 1502}]};
get_map(35) -> {50011, [{1806, 485}]};
get_map(36) -> {50011, [{1292, 478}]};
get_map(37) -> {50011, [{1795, 1034}]};
get_map(38) -> {50011, [{286, 629}]};
get_map(39) -> {50011, [{435, 1082}]};
get_map(40) -> {50011, [{489, 1550}]};
get_map(41) -> {50012, [{1806, 485}]};
get_map(42) -> {50012, [{1292, 478}]};
get_map(43) -> {50012, [{1795, 1034}]};
get_map(44) -> {50012, [{286, 629}]};
get_map(45) -> {50012, [{435, 1082}]};
get_map(46) -> {50012, [{489, 1550}]};
get_map(47) -> {50013, [{1806, 485}]};
get_map(48) -> {50013, [{1292, 478}]};
get_map(49) -> {50013, [{1795, 1034}]};
get_map(50) -> {50013, [{286, 629}]};
get_map(51) -> {50013, [{435, 1082}]};
get_map(52) -> {50013, [{489, 1550}]};
get_map(_) -> [].

get_reward(Lev) when Lev >= 30 andalso Lev =< 200 ->
    #camp_hide_seek_reward_data{min = 30, max = 200,
                                rand_reward =
                                    [{20000, 0, 1, 80, 0},
                                     {20002, 0, 1, 80, 0},
                                     {20046, 0, 1, 30, 1},
                                     {20025, 0, 1, 100, 0},
                                     {20087, 0, 1, 80, 1},
                                     {20075, 0, 1, 10, 1},
                                     {20076, 0, 1, 2, 1},
                                     {20616, 0, 1, 5, 1},
                                     {21100, 0, 1, 43, 1},
                                     {20095, 0, 1, 3, 1},
                                     {21130, 0, 1, 20, 1},
                                     {20038, 0, 1, 2, 1},
                                     {20034, 0, 2, 100, 0},
                                     {20039, 0, 1, 95, 1},
                                     {20005, 0, 2, 100, 0},
                                     {21220, 0, 2, 85, 0},
                                     {22212, 0, 1, 65, 1},
                                     {20020, 0, 2, 50, 0},
                                     {20021, 0, 2, 50, 0}],
                                cast_msg =
                                    lang:get("#role#在<color='#00ff00'>捉迷藏</color>过程中进行了地毯式搜"
                                             "索，找到所有小朋友的同时还发现了#item#！{face_1,29}"),
                                exp_mode = 3324};
get_reward(_) -> false.

get_quest_info(81200) ->
    #camp_hide_seek_quest_data{quest_id = 81200,
                               unit_id = 76522, next_id = 81201};
get_quest_info(81201) ->
    #camp_hide_seek_quest_data{quest_id = 81201,
                               unit_id = 76522, next_id = 0};
get_quest_info(81210) ->
    #camp_hide_seek_quest_data{quest_id = 81210,
                               unit_id = 76525, next_id = 81211};
get_quest_info(81211) ->
    #camp_hide_seek_quest_data{quest_id = 81211,
                               unit_id = 76525, next_id = 81212};
get_quest_info(81212) ->
    #camp_hide_seek_quest_data{quest_id = 81212,
                               unit_id = 76525, next_id = 0};
get_quest_info(81220) ->
    #camp_hide_seek_quest_data{quest_id = 81220,
                               unit_id = 76526, next_id = 81221};
get_quest_info(81221) ->
    #camp_hide_seek_quest_data{quest_id = 81221,
                               unit_id = 76526, next_id = 81222};
get_quest_info(81222) ->
    #camp_hide_seek_quest_data{quest_id = 81222,
                               unit_id = 76526, next_id = 0};
get_quest_info(81230) ->
    #camp_hide_seek_quest_data{quest_id = 81230,
                               unit_id = 76523, next_id = 81231};
get_quest_info(81231) ->
    #camp_hide_seek_quest_data{quest_id = 81231,
                               unit_id = 76523, next_id = 81232};
get_quest_info(81232) ->
    #camp_hide_seek_quest_data{quest_id = 81232,
                               unit_id = 76523, next_id = 0};
get_quest_info(81240) ->
    #camp_hide_seek_quest_data{quest_id = 81240,
                               unit_id = 76524, next_id = 81241};
get_quest_info(81241) ->
    #camp_hide_seek_quest_data{quest_id = 81241,
                               unit_id = 76524, next_id = 81242};
get_quest_info(81242) ->
    #camp_hide_seek_quest_data{quest_id = 81242,
                               unit_id = 76524, next_id = 0};
get_quest_info(81250) ->
    #camp_hide_seek_quest_data{quest_id = 81250,
                               unit_id = 76520, next_id = 81251};
get_quest_info(81251) ->
    #camp_hide_seek_quest_data{quest_id = 81251,
                               unit_id = 76520, next_id = 81252};
get_quest_info(81252) ->
    #camp_hide_seek_quest_data{quest_id = 81252,
                               unit_id = 76520, next_id = 0};
get_quest_info(81260) ->
    #camp_hide_seek_quest_data{quest_id = 81260,
                               unit_id = 76521, next_id = 81261};
get_quest_info(81261) ->
    #camp_hide_seek_quest_data{quest_id = 81261,
                               unit_id = 76521, next_id = 0};
get_quest_info(81280) ->
    #camp_hide_seek_quest_data{quest_id = 81280,
                               unit_id = 76528, next_id = 81281};
get_quest_info(81281) ->
    #camp_hide_seek_quest_data{quest_id = 81281,
                               unit_id = 76528, next_id = 81282};
get_quest_info(81282) ->
    #camp_hide_seek_quest_data{quest_id = 81282,
                               unit_id = 76528, next_id = 0};
get_quest_info(81290) ->
    #camp_hide_seek_quest_data{quest_id = 81290,
                               unit_id = 76529, next_id = 81291};
get_quest_info(81291) ->
    #camp_hide_seek_quest_data{quest_id = 81291,
                               unit_id = 76529, next_id = 81292};
get_quest_info(81292) ->
    #camp_hide_seek_quest_data{quest_id = 81292,
                               unit_id = 76529, next_id = 0};
get_quest_info(81310) ->
    #camp_hide_seek_quest_data{quest_id = 81310,
                               unit_id = 76531, next_id = 81311};
get_quest_info(81311) ->
    #camp_hide_seek_quest_data{quest_id = 81311,
                               unit_id = 76531, next_id = 81312};
get_quest_info(81312) ->
    #camp_hide_seek_quest_data{quest_id = 81312,
                               unit_id = 76531, next_id = 81313};
get_quest_info(81313) ->
    #camp_hide_seek_quest_data{quest_id = 81313,
                               unit_id = 76531, next_id = 0};
get_quest_info(81320) ->
    #camp_hide_seek_quest_data{quest_id = 81320,
                               unit_id = 76532, next_id = 81321};
get_quest_info(81321) ->
    #camp_hide_seek_quest_data{quest_id = 81321,
                               unit_id = 76532, next_id = 81322};
get_quest_info(81322) ->
    #camp_hide_seek_quest_data{quest_id = 81322,
                               unit_id = 76532, next_id = 0};
get_quest_info(81330) ->
    #camp_hide_seek_quest_data{quest_id = 81330,
                               unit_id = 76533, next_id = 81331};
get_quest_info(81331) ->
    #camp_hide_seek_quest_data{quest_id = 81331,
                               unit_id = 76533, next_id = 81332};
get_quest_info(81332) ->
    #camp_hide_seek_quest_data{quest_id = 81332,
                               unit_id = 76533, next_id = 0};
get_quest_info(_) -> false.

