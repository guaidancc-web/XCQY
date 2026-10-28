-file("src/data/tournament_data.erl", 1).

-module(tournament_data).

-export([get/1,
         get_name/1,
         get_rank_lev/1,
         get_combat_reward/1,
         get_decrease/2,
         get_cost/1,
         get_rewards/1,
         get_bglist/0,
         get_badges_info/1,
         get_bg_set/1,
         get_bg_attr/1,
         get_promotion_combat/1,
         get_honor_point/1,
         get_all_honor/0]).

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

-file("src/data/tournament_data.erl", 26).

get(1) ->
    #{rank_lev => 1, name => lang:get("星辰学徒"),
      rank_point => 0, advance_reward => [],
      final_reward =>
          [{22305, 2}, {20006, 10}, {20052, 1}, {90020, 15}],
      week_reward => [], calc_rate => 2008,
      notice_name => lang:get("星辰学徒"), season_new_lev => 1,
      icon_frame_id => 0, icon_frame_item_id => 0};
get(2) ->
    #{rank_lev => 2, name => lang:get("略有小成"),
      rank_point => 100,
      advance_reward => [{20002, 1}, {90020, 8}],
      final_reward =>
          [{20022, 1}, {20000, 1}, {20052, 2}, {90020, 21}],
      week_reward => [{22305, 1}, {90020, 4}],
      calc_rate => 1004, notice_name => lang:get("略有小成"),
      season_new_lev => 1, icon_frame_id => 0,
      icon_frame_item_id => 0};
get(3) ->
    #{rank_lev => 3, name => lang:get("渐入佳境"),
      rank_point => 200,
      advance_reward => [{22306, 2}, {90020, 12}],
      final_reward =>
          [{20089, 1}, {20002, 1}, {20006, 10}, {90020, 26}],
      week_reward => [{22305, 1}, {90020, 6}],
      calc_rate => 669, notice_name => lang:get("渐入佳境"),
      season_new_lev => 1, icon_frame_id => 0,
      icon_frame_item_id => 0};
get(4) ->
    #{rank_lev => 4,
      name => lang:get("<color='#248813'>登堂入室</color>"),
      rank_point => 300,
      advance_reward => [{21130, 2}, {90020, 16}],
      final_reward =>
          [{20075, 1}, {22306, 1}, {20034, 2}, {90020, 32}],
      week_reward => [{22305, 2}, {90020, 8}],
      calc_rate => 401, notice_name => lang:get("登堂入室"),
      season_new_lev => 2, icon_frame_id => 0,
      icon_frame_item_id => 0};
get(5) ->
    #{rank_lev => 5,
      name => lang:get("<color='#248813'>炉火纯青</color>"),
      rank_point => 400,
      advance_reward => [{22306, 2}, {90020, 20}],
      final_reward =>
          [{20053, 1}, {22306, 2}, {20025, 2}, {90020, 38}],
      week_reward => [{22305, 2}, {90020, 10}],
      calc_rate => 334, notice_name => lang:get("炉火纯青"),
      season_new_lev => 2, icon_frame_id => 0,
      icon_frame_item_id => 0};
get(6) ->
    #{rank_lev => 6,
      name => lang:get("<color='#225ee7'>心领神会</color>"),
      rank_point => 500,
      advance_reward => [{22212, 2}, {90020, 20}],
      final_reward =>
          [{29101, 1}, {22307, 2}, {20072, 1}, {90020, 45}],
      week_reward => [{22305, 3}, {90020, 12}],
      calc_rate => 251, notice_name => lang:get("心领神会"),
      season_new_lev => 3, icon_frame_id => 0,
      icon_frame_item_id => 0};
get(7) ->
    #{rank_lev => 7,
      name => lang:get("<color='#225ee7'>出类拔萃</color>"),
      rank_point => 600,
      advance_reward => [{29101, 1}, {90020, 22}],
      final_reward =>
          [{29101, 1}, {22212, 1}, {29103, 2}, {90020, 52}],
      week_reward => [{22305, 3}, {90020, 14}],
      calc_rate => 237, notice_name => lang:get("出类拔萃"),
      season_new_lev => 4, icon_frame_id => 0,
      icon_frame_item_id => 0};
get(8) ->
    #{rank_lev => 8,
      name => lang:get("<color='#b031d5'>已臻大成</color>"),
      rank_point => 700,
      advance_reward => [{22300, 1}, {90020, 25}],
      final_reward =>
          [{29101, 2}, {20053, 1}, {22216, 1}, {90020, 59}],
      week_reward => [{22306, 2}, {90020, 16}],
      calc_rate => 223, notice_name => lang:get("已臻大成"),
      season_new_lev => 4, icon_frame_id => 0,
      icon_frame_item_id => 0};
get(9) ->
    #{rank_lev => 9,
      name => lang:get("<color='#b031d5'>神乎其技</color>"),
      rank_point => 800,
      advance_reward => [{22307, 2}, {90020, 25}],
      final_reward =>
          [{29101, 2}, {22212, 2}, {20061, 1}, {90020, 66}],
      week_reward => [{22306, 2}, {90020, 17}],
      calc_rate => 212, notice_name => lang:get("神乎其技"),
      season_new_lev => 5, icon_frame_id => 0,
      icon_frame_item_id => 0};
get(10) ->
    #{rank_lev => 10,
      name => lang:get("<color='#c3692c'>登峰造极</color>"),
      rank_point => 900,
      advance_reward => [{29100, 1}, {90020, 28}],
      final_reward =>
          [{29101, 3},
           {20038, 1},
           {22216, 1},
           {90020, 73},
           {22790, 1}],
      week_reward => [{22306, 3}, {90020, 18}],
      calc_rate => 200, notice_name => lang:get("登峰造极"),
      season_new_lev => 6, icon_frame_id => 0,
      icon_frame_item_id => 0};
get(11) ->
    #{rank_lev => 11,
      name => lang:get("<color='#c3692c'>星辰王者</color>"),
      rank_point => 1000,
      advance_reward => [{20014, 1}, {90020, 30}],
      final_reward =>
          [{29101, 3},
           {20617, 1},
           {22216, 1},
           {90020, 80},
           {22785, 1}],
      week_reward => [{22306, 3}, {90020, 20}],
      calc_rate => 200, notice_name => lang:get("星辰王者"),
      season_new_lev => 6, icon_frame_id => 0,
      icon_frame_item_id => 0};
get(_RankLev) -> false.

get_name(1) -> lang:get("星辰学徒");
get_name(2) -> lang:get("略有小成");
get_name(3) -> lang:get("渐入佳境");
get_name(4) -> lang:get("登堂入室");
get_name(5) -> lang:get("炉火纯青");
get_name(6) -> lang:get("心领神会");
get_name(7) -> lang:get("出类拔萃");
get_name(8) -> lang:get("已臻大成");
get_name(9) -> lang:get("神乎其技");
get_name(10) -> lang:get("登峰造极");
get_name(11) -> lang:get("星辰王者");
get_name(_RankLev) -> "".

get_rank_lev(Point) when Point > 1000 -> 11;
get_rank_lev(Point) when Point > 900 -> 10;
get_rank_lev(Point) when Point > 800 -> 9;
get_rank_lev(Point) when Point > 700 -> 8;
get_rank_lev(Point) when Point > 600 -> 7;
get_rank_lev(Point) when Point > 500 -> 6;
get_rank_lev(Point) when Point > 400 -> 5;
get_rank_lev(Point) when Point > 300 -> 4;
get_rank_lev(Point) when Point > 200 -> 3;
get_rank_lev(Point) when Point > 100 -> 2;
get_rank_lev(Point) when Point > 0 -> 1;
get_rank_lev(_Point) -> 1.

get_combat_reward(1) ->
    [#{result => 1, item_id => 20006, bind => 0,
       item_num => 5, item_name => lang:get("星辰精华"),
       item_weight => 205, announce => 0},
     #{result => 1, item_id => 20052, bind => 0,
       item_num => 1, item_name => lang:get("藏宝图"),
       item_weight => 150, announce => 0},
     #{result => 1, item_id => 20046, bind => 0,
       item_num => 1, item_name => lang:get("彩虹果"),
       item_weight => 20, announce => 1},
     #{result => 1, item_id => 20020, bind => 0,
       item_num => 1, item_name => lang:get("强化石"),
       item_weight => 80, announce => 0},
     #{result => 1, item_id => 20025, bind => 0,
       item_num => 1, item_name => lang:get("冒险笔记"),
       item_weight => 103, announce => 0},
     #{result => 1, item_id => 20087, bind => 0,
       item_num => 1, item_name => lang:get("四宝"),
       item_weight => 55, announce => 1},
     #{result => 1, item_id => 21100, bind => 0,
       item_num => 1, item_name => lang:get("翅膀灵羽"),
       item_weight => 20, announce => 1},
     #{result => 1, item_id => 20095, bind => 0,
       item_num => 1, item_name => lang:get("珍兽之魂"),
       item_weight => 2, announce => 1},
     #{result => 1, item_id => 20075, bind => 0,
       item_num => 1, item_name => lang:get("月亮重置丹"),
       item_weight => 2, announce => 1},
     #{result => 1, item_id => 20616, bind => 0,
       item_num => 1, item_name => lang:get("月亮护符"),
       item_weight => 3, announce => 1},
     #{result => 1, item_id => 20617, bind => 0,
       item_num => 1, item_name => lang:get("太阳护符"),
       item_weight => 1, announce => 1},
     #{result => 1, item_id => 21137, bind => 0,
       item_num => 1, item_name => lang:get("神羽卷轴"),
       item_weight => 1, announce => 1},
     #{result => 1, item_id => 20021, bind => 0,
       item_num => 1, item_name => lang:get("幸运石"),
       item_weight => 60, announce => 0},
     #{result => 1, item_id => 20088, bind => 0,
       item_num => 1, item_name => lang:get("初级符石"),
       item_weight => 40, announce => 0},
     #{result => 1, item_id => 20034, bind => 0,
       item_num => 1, item_name => lang:get("宝石包"),
       item_weight => 80, announce => 0},
     #{result => 1, item_id => 20045, bind => 0,
       item_num => 1, item_name => lang:get("月光绒"),
       item_weight => 84, announce => 0},
     #{result => 1, item_id => 70490, bind => 0,
       item_num => 1, item_name => lang:get("随心坐骑礼盒"),
       item_weight => 20, announce => 1},
     #{result => 1, item_id => 22398, bind => 0,
       item_num => 1, item_name => lang:get("极品坐骑礼盒"),
       item_weight => 5, announce => 1},
     #{result => 1, item_id => 22450, bind => 0,
       item_num => 1, item_name => lang:get("表情包子"),
       item_weight => 70, announce => 1}];
get_combat_reward(2) ->
    [#{result => 2, item_id => 20006, bind => 0,
       item_num => 5, item_name => lang:get("星辰精华"),
       item_weight => 200, announce => 0},
     #{result => 2, item_id => 20052, bind => 0,
       item_num => 1, item_name => lang:get("藏宝图"),
       item_weight => 150, announce => 0},
     #{result => 2, item_id => 20046, bind => 0,
       item_num => 1, item_name => lang:get("彩虹果"),
       item_weight => 25, announce => 1},
     #{result => 2, item_id => 20020, bind => 0,
       item_num => 1, item_name => lang:get("强化石"),
       item_weight => 80, announce => 0},
     #{result => 2, item_id => 20025, bind => 0,
       item_num => 1, item_name => lang:get("冒险笔记"),
       item_weight => 95, announce => 0},
     #{result => 2, item_id => 20087, bind => 0,
       item_num => 1, item_name => lang:get("四宝"),
       item_weight => 60, announce => 1},
     #{result => 2, item_id => 21100, bind => 0,
       item_num => 1, item_name => lang:get("翅膀灵羽"),
       item_weight => 20, announce => 1},
     #{result => 2, item_id => 20095, bind => 0,
       item_num => 1, item_name => lang:get("珍兽之魂"),
       item_weight => 2, announce => 1},
     #{result => 2, item_id => 20075, bind => 0,
       item_num => 1, item_name => lang:get("月亮重置丹"),
       item_weight => 2, announce => 1},
     #{result => 2, item_id => 20616, bind => 0,
       item_num => 1, item_name => lang:get("月亮护符"),
       item_weight => 3, announce => 1},
     #{result => 2, item_id => 20617, bind => 0,
       item_num => 1, item_name => lang:get("太阳护符"),
       item_weight => 1, announce => 1},
     #{result => 2, item_id => 21137, bind => 0,
       item_num => 1, item_name => lang:get("神羽卷轴"),
       item_weight => 1, announce => 1},
     #{result => 2, item_id => 20021, bind => 0,
       item_num => 1, item_name => lang:get("幸运石"),
       item_weight => 60, announce => 0},
     #{result => 2, item_id => 20088, bind => 0,
       item_num => 1, item_name => lang:get("初级符石"),
       item_weight => 40, announce => 0},
     #{result => 2, item_id => 20034, bind => 0,
       item_num => 1, item_name => lang:get("宝石包"),
       item_weight => 95, announce => 0},
     #{result => 2, item_id => 20045, bind => 0,
       item_num => 1, item_name => lang:get("月光绒"),
       item_weight => 96, announce => 0},
     #{result => 2, item_id => 22450, bind => 0,
       item_num => 1, item_name => lang:get("表情包子"),
       item_weight => 70, announce => 1}];
get_combat_reward(3) ->
    [#{result => 3, item_id => 20006, bind => 0,
       item_num => 5, item_name => lang:get("星辰精华"),
       item_weight => 200, announce => 0},
     #{result => 3, item_id => 20052, bind => 0,
       item_num => 1, item_name => lang:get("藏宝图"),
       item_weight => 150, announce => 0},
     #{result => 3, item_id => 20046, bind => 0,
       item_num => 1, item_name => lang:get("彩虹果"),
       item_weight => 25, announce => 1},
     #{result => 3, item_id => 20020, bind => 0,
       item_num => 1, item_name => lang:get("强化石"),
       item_weight => 80, announce => 0},
     #{result => 3, item_id => 20025, bind => 0,
       item_num => 1, item_name => lang:get("冒险笔记"),
       item_weight => 95, announce => 0},
     #{result => 3, item_id => 20087, bind => 0,
       item_num => 1, item_name => lang:get("四宝"),
       item_weight => 60, announce => 1},
     #{result => 3, item_id => 21100, bind => 0,
       item_num => 1, item_name => lang:get("翅膀灵羽"),
       item_weight => 20, announce => 1},
     #{result => 3, item_id => 20095, bind => 0,
       item_num => 1, item_name => lang:get("珍兽之魂"),
       item_weight => 2, announce => 1},
     #{result => 3, item_id => 20075, bind => 0,
       item_num => 1, item_name => lang:get("月亮重置丹"),
       item_weight => 2, announce => 1},
     #{result => 3, item_id => 20616, bind => 0,
       item_num => 1, item_name => lang:get("月亮护符"),
       item_weight => 4, announce => 1},
     #{result => 3, item_id => 20617, bind => 0,
       item_num => 1, item_name => lang:get("太阳护符"),
       item_weight => 1, announce => 1},
     #{result => 3, item_id => 20021, bind => 0,
       item_num => 1, item_name => lang:get("幸运石"),
       item_weight => 75, announce => 0},
     #{result => 3, item_id => 20088, bind => 0,
       item_num => 1, item_name => lang:get("初级符石"),
       item_weight => 40, announce => 0},
     #{result => 3, item_id => 20034, bind => 0,
       item_num => 1, item_name => lang:get("宝石包"),
       item_weight => 80, announce => 0},
     #{result => 3, item_id => 20045, bind => 0,
       item_num => 1, item_name => lang:get("月光绒"),
       item_weight => 96, announce => 0},
     #{result => 3, item_id => 22450, bind => 0,
       item_num => 1, item_name => lang:get("表情包子"),
       item_weight => 70, announce => 1}];
get_combat_reward(_) -> false.

get_decrease(_, _) -> 0.

get_cost(Num) when Num >= 9 -> val_not_exist;
get_cost(Num) when Num >= 8 -> 5;
get_cost(Num) when Num >= 7 -> 5;
get_cost(Num) when Num >= 6 -> 5;
get_cost(Num) when Num >= 5 -> 3;
get_cost(Num) when Num >= 4 -> 3;
get_cost(Num) when Num >= 3 -> 2;
get_cost(Num) when Num >= 2 -> 2;
get_cost(Num) when Num >= 1 -> 1;
get_cost(Num) when Num >= 0 -> 1;
get_cost(_) -> 0.

get_rewards({0, 0}) -> {21168, 1, 1};
get_rewards({1, 0}) -> {21168, 1, 1};
get_rewards({2, 0}) -> {22399, 1, 1};
get_rewards({2, 1}) -> {21169, 1, 1};
get_rewards({3, 0}) -> {22399, 1, 1};
get_rewards({3, 1}) -> {21169, 1, 1};
get_rewards({4, 0}) -> {22399, 1, 1};
get_rewards({4, 1}) -> {22399, 1, 1};
get_rewards({4, 2}) -> {21171, 1, 1};
get_rewards({5, 0}) -> {22399, 1, 1};
get_rewards({5, 1}) -> {22399, 1, 1};
get_rewards({5, 2}) -> {21171, 1, 1};
get_rewards({6, 0}) -> {22399, 1, 1};
get_rewards({6, 1}) -> {22399, 1, 1};
get_rewards({6, 2}) -> {22399, 1, 1};
get_rewards({6, 3}) -> {22399, 1, 1};
get_rewards({6, 4}) -> {21172, 1, 1};
get_rewards({7, 0}) -> {22399, 1, 1};
get_rewards({7, 1}) -> {22399, 1, 1};
get_rewards({7, 2}) -> {22399, 1, 1};
get_rewards({7, 3}) -> {22399, 1, 1};
get_rewards({7, 4}) -> {21172, 1, 1};
get_rewards({8, 0}) -> {22399, 1, 1};
get_rewards({8, 1}) -> {22399, 1, 1};
get_rewards({8, 2}) -> {22399, 1, 1};
get_rewards({8, 3}) -> {22399, 1, 1};
get_rewards({8, 4}) -> {21172, 1, 1};
get_rewards(_) -> false.

get_bglist() ->
    [{233, 100},
     {234, 100},
     {235, 100},
     {236, 100},
     {237, 100},
     {238, 100},
     {239, 100},
     {240, 100},
     {241, 100}].

get_badges_info(233) ->
    #{name => lang:get("一往无前"), active_effect_type => 3,
      set_id => [1], fc => 0};
get_badges_info(234) ->
    #{name => lang:get("刚正不阿"), active_effect_type => 3,
      set_id => [2], fc => 0};
get_badges_info(235) ->
    #{name => lang:get("谋定后动"), active_effect_type => 3,
      set_id => [3], fc => 0};
get_badges_info(236) ->
    #{name => lang:get("英勇无畏"), active_effect_type => 3,
      set_id => [1, 3], fc => 0};
get_badges_info(237) ->
    #{name => lang:get("忠贞不渝"), active_effect_type => 3,
      set_id => [2], fc => 0};
get_badges_info(238) ->
    #{name => lang:get("纯洁善良"), active_effect_type => 3,
      set_id => [4], fc => 0};
get_badges_info(239) ->
    #{name => lang:get("牺牲奉献"), active_effect_type => 3,
      set_id => [4], fc => 0};
get_badges_info(240) ->
    #{name => lang:get("机巧灵动"), active_effect_type => 3,
      set_id => [5], fc => 0};
get_badges_info(241) ->
    #{name => lang:get("自由不羁"), active_effect_type => 3,
      set_id => [5], fc => 0};
get_badges_info(_) -> false.

get_bg_set(1) ->
    #{name => lang:get("冒险之魂"), level_limit => 70,
      max_num => 2, group_list => [233, 236], fc => 11};
get_bg_set(2) ->
    #{name => lang:get("忠义之心"), level_limit => 70,
      max_num => 2, group_list => [234, 237], fc => 12};
get_bg_set(3) ->
    #{name => lang:get("智勇精魄"), level_limit => 70,
      max_num => 2, group_list => [235, 236], fc => 13};
get_bg_set(4) ->
    #{name => lang:get("骑士精神"), level_limit => 70,
      max_num => 2, group_list => [238, 239], fc => 14};
get_bg_set(5) ->
    #{name => lang:get("自由羽翼"), level_limit => 70,
      max_num => 2, group_list => [240, 241], fc => 15};
get_bg_set(_) -> false.

get_bg_attr({233, 1}) -> [{1, 20}, {4, 5}];
get_bg_attr({233, 2}) -> [{1, 20}, {5, 4}];
get_bg_attr({233, 3}) -> [{1, 20}, {4, 5}];
get_bg_attr({233, 4}) -> [{1, 20}, {7, 4}];
get_bg_attr({233, 5}) -> [{1, 20}, {7, 4}];
get_bg_attr({233, 6}) -> [{1, 20}, {5, 4}];
get_bg_attr({233, 7}) -> [{1, 20}, {4, 5}];
get_bg_attr({234, 1}) -> [{6, 5}, {7, 4}];
get_bg_attr({234, 2}) -> [{2, 20}, {6, 5}];
get_bg_attr({234, 3}) -> [{6, 5}, {7, 4}];
get_bg_attr({234, 4}) -> [{6, 5}, {7, 4}];
get_bg_attr({234, 5}) -> [{6, 5}, {7, 4}];
get_bg_attr({234, 6}) -> [{2, 20}, {6, 5}];
get_bg_attr({234, 7}) -> [{6, 5}, {7, 4}];
get_bg_attr({235, 1}) -> [{1, 20}, {6, 5}];
get_bg_attr({235, 2}) -> [{1, 20}, {6, 5}];
get_bg_attr({235, 3}) -> [{1, 20}, {6, 5}];
get_bg_attr({235, 4}) -> [{1, 20}, {6, 5}];
get_bg_attr({235, 5}) -> [{1, 20}, {6, 5}];
get_bg_attr({235, 6}) -> [{1, 20}, {6, 5}];
get_bg_attr({235, 7}) -> [{1, 20}, {6, 5}];
get_bg_attr({236, 1}) -> [{1, 20}, {7, 4}];
get_bg_attr({236, 2}) -> [{1, 20}, {7, 4}];
get_bg_attr({236, 3}) -> [{1, 20}, {7, 4}];
get_bg_attr({236, 4}) -> [{1, 20}, {7, 4}];
get_bg_attr({236, 5}) -> [{1, 20}, {7, 4}];
get_bg_attr({236, 6}) -> [{1, 20}, {7, 4}];
get_bg_attr({236, 7}) -> [{1, 20}, {7, 4}];
get_bg_attr({237, 1}) -> [{6, 5}, {7, 4}];
get_bg_attr({237, 2}) -> [{6, 5}, {7, 4}];
get_bg_attr({237, 3}) -> [{6, 5}, {7, 4}];
get_bg_attr({237, 4}) -> [{6, 5}, {7, 4}];
get_bg_attr({237, 5}) -> [{6, 5}, {7, 4}];
get_bg_attr({237, 6}) -> [{6, 5}, {7, 4}];
get_bg_attr({237, 7}) -> [{6, 5}, {7, 4}];
get_bg_attr({238, 1}) -> [{4, 5}, {7, 4}];
get_bg_attr({238, 2}) -> [{5, 4}, {6, 5}];
get_bg_attr({238, 3}) -> [{4, 5}, {7, 4}];
get_bg_attr({238, 4}) -> [{6, 5}, {7, 4}];
get_bg_attr({238, 5}) -> [{6, 5}, {7, 4}];
get_bg_attr({238, 6}) -> [{5, 4}, {6, 5}];
get_bg_attr({238, 7}) -> [{4, 5}, {7, 4}];
get_bg_attr({239, 1}) -> [{4, 5}, {5, 4}];
get_bg_attr({239, 2}) -> [{5, 5}, {4, 5}];
get_bg_attr({239, 3}) -> [{4, 5}, {5, 4}];
get_bg_attr({239, 4}) -> [{4, 5}, {5, 4}];
get_bg_attr({239, 5}) -> [{5, 5}, {4, 4}];
get_bg_attr({239, 6}) -> [{5, 5}, {4, 4}];
get_bg_attr({239, 7}) -> [{4, 5}, {5, 4}];
get_bg_attr({240, 1}) -> [{4, 5}, {2, 20}];
get_bg_attr({240, 2}) -> [{5, 4}, {2, 20}];
get_bg_attr({240, 3}) -> [{4, 5}, {2, 20}];
get_bg_attr({240, 4}) -> [{1, 20}, {2, 20}];
get_bg_attr({240, 5}) -> [{1, 20}, {2, 20}];
get_bg_attr({240, 6}) -> [{5, 4}, {2, 20}];
get_bg_attr({240, 7}) -> [{4, 5}, {2, 20}];
get_bg_attr({241, 1}) -> [{4, 5}, {6, 5}];
get_bg_attr({241, 2}) -> [{5, 4}, {7, 4}];
get_bg_attr({241, 3}) -> [{4, 5}, {6, 5}];
get_bg_attr({241, 4}) -> [{1, 20}, {2, 20}];
get_bg_attr({241, 5}) -> [{1, 20}, {2, 20}];
get_bg_attr({241, 6}) -> [{5, 4}, {7, 4}];
get_bg_attr({241, 7}) -> [{4, 5}, {6, 5}];
get_bg_attr({1, 1}) -> [{4, 10}, {1, 40}];
get_bg_attr({1, 2}) -> [{5, 8}, {1, 40}];
get_bg_attr({1, 3}) -> [{4, 10}, {1, 40}];
get_bg_attr({1, 4}) -> [{6, 10}, {1, 40}];
get_bg_attr({1, 5}) -> [{6, 10}, {1, 40}];
get_bg_attr({1, 6}) -> [{5, 8}, {1, 40}];
get_bg_attr({1, 7}) -> [{4, 10}, {1, 40}];
get_bg_attr({2, 1}) -> [{4, 10}, {7, 8}];
get_bg_attr({2, 2}) -> [{5, 8}, {6, 10}];
get_bg_attr({2, 3}) -> [{4, 10}, {7, 8}];
get_bg_attr({2, 4}) -> [{6, 10}, {7, 8}];
get_bg_attr({2, 5}) -> [{6, 10}, {7, 8}];
get_bg_attr({2, 6}) -> [{5, 8}, {6, 10}];
get_bg_attr({2, 7}) -> [{4, 10}, {7, 8}];
get_bg_attr({3, 1}) -> [{4, 10}, {6, 10}];
get_bg_attr({3, 2}) -> [{5, 8}, {7, 8}];
get_bg_attr({3, 3}) -> [{4, 10}, {6, 10}];
get_bg_attr({3, 4}) -> [{6, 10}, {7, 8}];
get_bg_attr({3, 5}) -> [{6, 10}, {7, 8}];
get_bg_attr({3, 6}) -> [{5, 8}, {7, 8}];
get_bg_attr({3, 7}) -> [{4, 10}, {6, 10}];
get_bg_attr({4, 1}) -> [{1, 40}, {6, 10}];
get_bg_attr({4, 2}) -> [{1, 40}, {7, 8}];
get_bg_attr({4, 3}) -> [{1, 40}, {6, 10}];
get_bg_attr({4, 4}) -> [{6, 10}, {2, 40}];
get_bg_attr({4, 5}) -> [{6, 10}, {2, 40}];
get_bg_attr({4, 6}) -> [{1, 40}, {7, 8}];
get_bg_attr({4, 7}) -> [{1, 40}, {6, 10}];
get_bg_attr({5, 1}) -> [{1, 40}, {7, 8}];
get_bg_attr({5, 2}) -> [{1, 40}, {6, 10}];
get_bg_attr({5, 3}) -> [{1, 40}, {7, 8}];
get_bg_attr({5, 4}) -> [{1, 40}, {7, 40}];
get_bg_attr({5, 5}) -> [{1, 40}, {7, 40}];
get_bg_attr({5, 6}) -> [{1, 40}, {6, 10}];
get_bg_attr({5, 7}) -> [{1, 40}, {7, 8}];
get_bg_attr(_) -> false.

get_promotion_combat(1) ->
    #{rank_lev => 1, name => lang:get("星辰学徒"),
      need_win => 2, point_win => 25, point_lose => 0};
get_promotion_combat(2) ->
    #{rank_lev => 2, name => lang:get("略有小成"),
      need_win => 2, point_win => 20, point_lose => 0};
get_promotion_combat(3) ->
    #{rank_lev => 3, name => lang:get("渐入佳境"),
      need_win => 2, point_win => 15, point_lose => 0};
get_promotion_combat(4) ->
    #{rank_lev => 4, name => lang:get("登堂入室"),
      need_win => 3, point_win => 12, point_lose => 6};
get_promotion_combat(5) ->
    #{rank_lev => 5, name => lang:get("炉火纯青"),
      need_win => 3, point_win => 10, point_lose => 5};
get_promotion_combat(6) ->
    #{rank_lev => 6, name => lang:get("心领神会"),
      need_win => 3, point_win => 8, point_lose => 4};
get_promotion_combat(7) ->
    #{rank_lev => 7, name => lang:get("出类拔萃"),
      need_win => 3, point_win => 6, point_lose => 4};
get_promotion_combat(8) ->
    #{rank_lev => 8, name => lang:get("已臻大成"),
      need_win => 4, point_win => 6, point_lose => 3};
get_promotion_combat(9) ->
    #{rank_lev => 9, name => lang:get("神乎其技"),
      need_win => 4, point_win => 6, point_lose => 3};
get_promotion_combat(_) -> false.

get_honor_point(1) -> {1, 3, 1};
get_honor_point(2) -> {2, 1, 6};
get_honor_point(3) -> {3, 1, 7};
get_honor_point(4) -> {4, 3, 2};
get_honor_point(5) -> {5, 3, 3};
get_honor_point(6) -> {6, 3, 4};
get_honor_point(7) -> {7, 2, 5};
get_honor_point(_) -> false.

get_all_honor() -> [1, 2, 3, 4, 5, 6, 7].

