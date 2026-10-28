-file("src/data/dragon_boat_data.erl", 1).

-module(dragon_boat_data).

-export([list/0,
         get/1,
         get_checkin_reward/0,
         get_final_reward1/0,
         get_final_reward2/0,
         get_rank_reward/1,
         list_time/0,
         get_time_index/1,
         get_content/1]).

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

-file("src/data/dragon_boat_data.erl", 21).

list() -> [1, 2, 3, 4, 5, 6, 7, 8].

get(1) ->
    #{id => 1, base_id => 76701, map_id => 10001, x => 3256,
      y => 2423, reward => [{90000, 1000}],
      enemy => [{76156, 100}, {76157, 100}], min_fight => 0,
      max_fight => 0, exp_rate => 500};
get(2) ->
    #{id => 2, base_id => 76702, map_id => 10002, x => 1983,
      y => 1667, reward => [{90000, 9800}],
      enemy => [{76156, 100}, {76157, 100}], min_fight => 1,
      max_fight => 1, exp_rate => 850};
get(3) ->
    #{id => 3, base_id => 76703, map_id => 10002, x => 1915,
      y => 480, reward => [{90000, 11600}],
      enemy => [{76156, 100}, {76157, 100}], min_fight => 0,
      max_fight => 1, exp_rate => 1000};
get(4) ->
    #{id => 4, base_id => 76704, map_id => 10003, x => 1061,
      y => 272, reward => [{90000, 13400}],
      enemy => [{76156, 100}, {76157, 100}], min_fight => 1,
      max_fight => 1, exp_rate => 1050};
get(5) ->
    #{id => 5, base_id => 76705, map_id => 50001, x => 500,
      y => 1010, reward => [{90000, 15200}],
      enemy => [{76156, 100}, {76157, 100}], min_fight => 0,
      max_fight => 1, exp_rate => 1100};
get(6) ->
    #{id => 6, base_id => 76706, map_id => 50002, x => 1560,
      y => 1000, reward => [{90000, 17000}],
      enemy => [{76156, 100}, {76157, 100}], min_fight => 1,
      max_fight => 1, exp_rate => 1200};
get(7) ->
    #{id => 7, base_id => 76707, map_id => 50003, x => 1120,
      y => 1720, reward => [{90000, 18800}],
      enemy => [{76156, 100}, {76157, 100}], min_fight => 0,
      max_fight => 1, exp_rate => 1250};
get(8) ->
    #{id => 8, base_id => 76708, map_id => 50003, x => 414,
      y => 460, reward => [{90000, 20600}],
      enemy => [{76168, 100}], min_fight => 1, max_fight => 1,
      exp_rate => 3000};
get(_BaseId) -> false.

get_checkin_reward() ->
    [#{item_id => 20000, item_num => 1,
       item_name => lang:get("银币袋子"), item_weight => 40,
       announce => 0},
     #{item_id => 20002, item_num => 1,
       item_name => lang:get("金币袋子"), item_weight => 40,
       announce => 0},
     #{item_id => 20013, item_num => 1,
       item_name => lang:get("魔兽要诀"), item_weight => 60,
       announce => 0},
     #{item_id => 20025, item_num => 1,
       item_name => lang:get("冒险笔记"), item_weight => 60,
       announce => 0},
     #{item_id => 20052, item_num => 1,
       item_name => lang:get("藏宝图"), item_weight => 80,
       announce => 0},
     #{item_id => 20087, item_num => 1,
       item_name => lang:get("四宝"), item_weight => 80,
       announce => 1},
     #{item_id => 20060, item_num => 1,
       item_name => lang:get("阵法残卷"), item_weight => 60,
       announce => 0},
     #{item_id => 20020, item_num => 2,
       item_name => lang:get("强化石"), item_weight => 30,
       announce => 0},
     #{item_id => 20021, item_num => 1,
       item_name => lang:get("幸运石"), item_weight => 30,
       announce => 0}].

get_final_reward1() ->
    [#{item_id => 20618, item_num => 1,
       item_name => lang:get("月亮石"), item_weight => 60,
       announce => 0},
     #{item_id => 20006, item_num => 6,
       item_name => lang:get("星辰精华"), item_weight => 120,
       announce => 0},
     #{item_id => 20013, item_num => 1,
       item_name => lang:get("魔兽要诀"), item_weight => 60,
       announce => 0},
     #{item_id => 20025, item_num => 1,
       item_name => lang:get("冒险笔记"), item_weight => 60,
       announce => 0},
     #{item_id => 20060, item_num => 1,
       item_name => lang:get("阵法残卷"), item_weight => 84,
       announce => 0},
     #{item_id => 20045, item_num => 1,
       item_name => lang:get("月光绒"), item_weight => 60,
       announce => 0},
     #{item_id => 20046, item_num => 1,
       item_name => lang:get("彩虹果"), item_weight => 10,
       announce => 1},
     #{item_id => 21100, item_num => 1,
       item_name => lang:get("翅膀灵羽"), item_weight => 25,
       announce => 1},
     #{item_id => 20087, item_num => 1,
       item_name => lang:get("四宝"), item_weight => 60,
       announce => 1},
     #{item_id => 20021, item_num => 2,
       item_name => lang:get("幸运石"), item_weight => 80,
       announce => 0},
     #{item_id => 20022, item_num => 1,
       item_name => lang:get("优秀幸运石"), item_weight => 50,
       announce => 1},
     #{item_id => 21220, item_num => 1,
       item_name => lang:get("秘宝锤"), item_weight => 107,
       announce => 0},
     #{item_id => 20020, item_num => 2,
       item_name => lang:get("强化石"), item_weight => 107,
       announce => 0},
     #{item_id => 20007, item_num => 1,
       item_name => lang:get("资质丸"), item_weight => 91,
       announce => 0}].

get_final_reward2() -> [].

get_rank_reward(1) ->
    #{order => 1, reward => [{70565, 1, 100}], min => 1,
      max => 1};
get_rank_reward(2) ->
    #{order => 2, reward => [{70566, 1, 100}], min => 1,
      max => 1};
get_rank_reward(3) ->
    #{order => 3, reward => [{70567, 1, 100}], min => 1,
      max => 1};
get_rank_reward(_Rank) -> false.

list_time_cfg() ->
    [#{sign_time => {13, 50, 0}, start_time => {14, 0, 0},
       end_time => {14, 20, 0}, order => 1,
       order_desc => lang:get("首轮"), index => 1},
     #{sign_time => {14, 20, 30}, start_time => {14, 30, 0},
       end_time => {14, 50, 0}, order => 1,
       order_desc => lang:get("首轮"), index => 2},
     #{sign_time => {15, 50, 0}, start_time => {16, 0, 0},
       end_time => {16, 20, 0}, order => 2,
       order_desc => lang:get("次轮"), index => 1},
     #{sign_time => {16, 20, 30}, start_time => {16, 30, 0},
       end_time => {16, 50, 0}, order => 2,
       order_desc => lang:get("次轮"), index => 2},
     #{sign_time => {17, 50, 0}, start_time => {18, 0, 0},
       end_time => {18, 20, 0}, order => 3,
       order_desc => lang:get("末轮"), index => 1},
     #{sign_time => {18, 20, 30}, start_time => {18, 30, 0},
       end_time => {18, 50, 0}, order => 3,
       order_desc => lang:get("末轮"), index => 2}].

list_time() ->
    L = list_time_cfg(),
    Fun = fun ({H, M, S}) -> H * 3600 + M * 60 + S end,
    [{Fun(SignTime), Fun(StartTime), Fun(EndTime)}
     || #{sign_time := SignTime, start_time := StartTime,
          end_time := EndTime}
            <- L].

get_time_index(Now) ->
    L = list_time_cfg(),
    Fun = fun (#{order_desc := OrderDesc, index := Index,
                 sign_time := SignTime, end_time := EndTime},
               _Rtn) ->
                  SignSecs = date:seconds_of_the_day(SignTime),
                  EndSecs = date:seconds_of_the_day(EndTime),
                  case Now >= SignSecs andalso Now =< EndSecs of
                      true -> {OrderDesc, Index};
                      _ -> _Rtn
                  end;
              (_, Rtn) -> Rtn
          end,
    lists:foldl(Fun, {lang:get("首轮"), 1}, L).

get_content(0) ->
    lang:get("报名成功，<color='#ffff00'>请耐心等待活动开始</color>！极速滑雪过"
             "程中，会遭遇大量<color='#ffff00'>障碍雪堆</color>，只要全体队员齐"
             "心<color='#ffff00'>向左滑、向右滑</color>，就能躲避障碍、加速前进"
             "！{face_1,26}");
get_content(1) ->
    lang:get("<color='#ffff00'>一号点</color>签到成功，一二！一二！向左滑！向右"
             "滑！步调一致才能加速前进喔！{face_1,25}");
get_content(2) ->
    lang:get("<color='#ffff00'>二号点</color>签到成功，<color='#fff"
             "f00'>向左滑</color>可以避开右方障碍雪堆，<color='#ffff00'>向"
             "右滑</color>可以避开左方障碍雪堆{face_1,38}");
get_content(3) ->
    lang:get("<color='#ffff00'>三号点</color>签到成功，赛程过半，看来你们已经掌"
             "握了极速滑雪的技巧咯{face_1,36}");
get_content(4) ->
    lang:get("<color='#ffff00'>四号点</color>签到成功，表现跟我当年有的一拼，祝"
             "你们取得好名次{face_1,9}");
get_content(5) ->
    lang:get("<color='#ffff00'>五号点</color>签到成功，齐心协力才能避开<col"
             "or='#ffff00'>障碍雪堆</color>，节省相当多的时间呢{face_1,38"
             "}");
get_content(6) ->
    lang:get("<color='#ffff00'>六号点</color>签到成功，齐心协力才能避开<col"
             "or='#ffff00'>障碍雪堆</color>，节省相当多的时间呢{face_1,38"
             "}");
get_content(7) ->
    lang:get("<color='#ffff00'>七号点</color>签到成功，终点就在眼前，全力冲刺吧"
             "！{face_1,18}{face_1,18}{face_1,18}");
get_content(_) -> false.

