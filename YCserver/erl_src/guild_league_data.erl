-file("src/data/guild_league_data.erl", 1).

-module(guild_league_data).

-export([get_box_reward/1,
         get_result_reward/1,
         get_rank_reward/2,
         get_combat_reward/1,
         get_unit_reward/0,
         get_unit_duration/1,
         get_guess_reward/1,
         get_worship_reward/0]).

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

-file("src/data/guild_league_data.erl", 21).

get_box_reward(79583) ->
    [#{box_id => 79583, item_id => 20006, item_num => 5,
       item_name => lang:get("星辰精华"), item_weight => 160,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79583, item_id => 20052, item_num => 2,
       item_name => lang:get("藏宝图"), item_weight => 130,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79583, item_id => 20046, item_num => 1,
       item_name => lang:get("彩虹果"), item_weight => 6,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79583, item_id => 23555, item_num => 1,
       item_name => lang:get("坐骑口粮"), item_weight => 150,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79583, item_id => 21421, item_num => 1,
       item_name => lang:get("2级图鉴"), item_weight => 6,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79583, item_id => 20025, item_num => 1,
       item_name => lang:get("冒险笔记"), item_weight => 163,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79583, item_id => 20000, item_num => 1,
       item_name => lang:get("一袋银币"), item_weight => 170,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79583, item_id => 20054, item_num => 1,
       item_name => lang:get("四宝"), item_weight => 124,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79583, item_id => 20074, item_num => 1,
       item_name => lang:get("星辰重置丹"), item_weight => 33,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79583, item_id => 21422, item_num => 1,
       item_name => lang:get("3级图鉴"), item_weight => 26,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79583, item_id => 20095, item_num => 1,
       item_name => lang:get("珍兽之魂"), item_weight => 2,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79583, item_id => 20075, item_num => 1,
       item_name => lang:get("月亮重置丹"), item_weight => 4,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79583, item_id => 21420, item_num => 1,
       item_name => lang:get("1级图鉴"), item_weight => 15,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79583, item_id => 20038, item_num => 1,
       item_name => lang:get("神兽之魂"), item_weight => 1,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79583, item_id => 20616, item_num => 1,
       item_name => lang:get("月亮护符"), item_weight => 10,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1}];
get_box_reward(_) -> false.

get_result_reward(1) ->
    [#{result => 1, item_id => 21420, item_num => 1,
       item_name => lang:get("魔兽要诀"), item_weight => 570,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 1, item_id => 20014, item_num => 1,
       item_name => lang:get("高级魔兽要诀"), item_weight => 100,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 20020, item_num => 2,
       item_name => lang:get("强化石"), item_weight => 1200,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 1, item_id => 21098, item_num => 2,
       item_name => lang:get("冒险笔记"), item_weight => 772,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 1, item_id => 20052, item_num => 1,
       item_name => lang:get("藏宝图"), item_weight => 700,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 1, item_id => 20087, item_num => 1,
       item_name => lang:get("四宝"), item_weight => 800,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 20075, item_num => 1,
       item_name => lang:get("月亮重置丹"), item_weight => 120,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 20076, item_num => 1,
       item_name => lang:get("太阳重置丹"), item_weight => 30,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 20021, item_num => 1,
       item_name => lang:get("幸运石"), item_weight => 600,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 1, item_id => 21421, item_num => 1,
       item_name => lang:get("优秀幸运石"), item_weight => 200,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 21422, item_num => 1,
       item_name => lang:get("翅膀灵羽"), item_weight => 600,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 1, item_id => 21101, item_num => 1,
       item_name => lang:get("精灵之羽"), item_weight => 300,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 21102, item_num => 1,
       item_name => lang:get("火凤之羽"), item_weight => 150,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 20034, item_num => 1,
       item_name => lang:get("宝石包"), item_weight => 900,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 1, item_id => 20038, item_num => 1,
       item_name => lang:get("神兽之魂"), item_weight => 20,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 20095, item_num => 1,
       item_name => lang:get("珍兽之魂"), item_weight => 50,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 20039, item_num => 1,
       item_name => lang:get("灵犀"), item_weight => 200,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 1, item_id => 20040, item_num => 1,
       item_name => lang:get("二品灵犀"), item_weight => 80,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 23555, item_num => 1,
       item_name => lang:get("天香果"), item_weight => 1500,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 1, item_id => 29010, item_num => 1,
       item_name => lang:get("随机神兽"), item_weight => 1,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 29011, item_num => 1,
       item_name => lang:get("随机珍兽"), item_weight => 1,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 20006, item_num => 6,
       item_name => lang:get("星辰精华"), item_weight => 1100,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 1, item_id => 23586, item_num => 1,
       item_name => lang:get("云踪狮鹫"), item_weight => 3,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 23587, item_num => 1,
       item_name => lang:get("游园灵象"), item_weight => 3,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1}];
get_result_reward(2) ->
    [#{result => 2, item_id => 21420, item_num => 1,
       item_name => lang:get("1级图鉴"), item_weight => 55,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 2, item_id => 20014, item_num => 1,
       item_name => lang:get("高级魔兽要诀"), item_weight => 10,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 2, item_id => 20020, item_num => 2,
       item_name => lang:get("强化石"), item_weight => 120,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 2, item_id => 21098, item_num => 1,
       item_name => lang:get("英雄宝石"), item_weight => 65,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 2, item_id => 20052, item_num => 1,
       item_name => lang:get("藏宝图"), item_weight => 68,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 2, item_id => 20087, item_num => 1,
       item_name => lang:get("四宝"), item_weight => 100,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 2, item_id => 20075, item_num => 1,
       item_name => lang:get("月亮重置丹"), item_weight => 5,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 2, item_id => 20076, item_num => 1,
       item_name => lang:get("太阳重置丹"), item_weight => 1,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 2, item_id => 20021, item_num => 1,
       item_name => lang:get("幸运石"), item_weight => 60,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 2, item_id => 21421, item_num => 1,
       item_name => lang:get("2级图鉴"), item_weight => 30,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 2, item_id => 21422, item_num => 1,
       item_name => lang:get("3级图鉴"), item_weight => 100,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 2, item_id => 21101, item_num => 1,
       item_name => lang:get("精灵之羽"), item_weight => 30,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 2, item_id => 21102, item_num => 1,
       item_name => lang:get("火凤之羽"), item_weight => 15,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 2, item_id => 20034, item_num => 1,
       item_name => lang:get("宝石包"), item_weight => 104,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 2, item_id => 20038, item_num => 1,
       item_name => lang:get("神兽之魂"), item_weight => 1,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 2, item_id => 20095, item_num => 1,
       item_name => lang:get("珍兽之魂"), item_weight => 3,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 2, item_id => 20039, item_num => 1,
       item_name => lang:get("灵犀"), item_weight => 20,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 2, item_id => 20040, item_num => 1,
       item_name => lang:get("二品灵犀"), item_weight => 8,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 2, item_id => 23555, item_num => 1,
       item_name => lang:get("坐骑口粮"), item_weight => 120,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 2, item_id => 20006, item_num => 5,
       item_name => lang:get("星辰精华"), item_weight => 85,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0}];
get_result_reward(3) ->
    [#{result => 3, item_id => 20013, item_num => 1,
       item_name => lang:get("1级图鉴"), item_weight => 55,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 3, item_id => 20014, item_num => 1,
       item_name => lang:get("高级魔兽要诀"), item_weight => 10,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 3, item_id => 20020, item_num => 2,
       item_name => lang:get("强化石"), item_weight => 120,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 3, item_id => 20025, item_num => 1,
       item_name => lang:get("英雄宝石"), item_weight => 65,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 3, item_id => 20052, item_num => 1,
       item_name => lang:get("藏宝图"), item_weight => 68,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 3, item_id => 20087, item_num => 1,
       item_name => lang:get("四宝"), item_weight => 100,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 3, item_id => 20075, item_num => 1,
       item_name => lang:get("月亮重置丹"), item_weight => 5,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 3, item_id => 20076, item_num => 1,
       item_name => lang:get("太阳重置丹"), item_weight => 1,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 3, item_id => 20021, item_num => 1,
       item_name => lang:get("幸运石"), item_weight => 60,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 3, item_id => 20022, item_num => 1,
       item_name => lang:get("2级图鉴"), item_weight => 30,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 3, item_id => 21100, item_num => 1,
       item_name => lang:get("3级图鉴"), item_weight => 100,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 3, item_id => 21101, item_num => 1,
       item_name => lang:get("精灵之羽"), item_weight => 30,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 3, item_id => 21102, item_num => 1,
       item_name => lang:get("火凤之羽"), item_weight => 15,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 3, item_id => 20034, item_num => 1,
       item_name => lang:get("宝石包"), item_weight => 104,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 3, item_id => 20038, item_num => 1,
       item_name => lang:get("神兽之魂"), item_weight => 1,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 3, item_id => 20095, item_num => 1,
       item_name => lang:get("珍兽之魂"), item_weight => 3,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 3, item_id => 20039, item_num => 1,
       item_name => lang:get("灵犀"), item_weight => 20,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 3, item_id => 20040, item_num => 1,
       item_name => lang:get("二品灵犀"), item_weight => 8,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 3, item_id => 21312, item_num => 1,
       item_name => lang:get("坐骑口粮"), item_weight => 120,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 3, item_id => 20006, item_num => 5,
       item_name => lang:get("星辰精华"), item_weight => 85,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0}];
get_result_reward(_) -> false.

get_rank_reward(1, Rank)
    when Rank >= 1 andalso Rank =< 1 ->
    #{grade => 1, rank_min => 1, rank_max => 1,
      items => [{23014, 20}, {23020, 12}],
      guild_assets => 8000000};
get_rank_reward(1, Rank)
    when Rank >= 2 andalso Rank =< 2 ->
    #{grade => 1, rank_min => 2, rank_max => 2,
      items => [{23014, 15}, {23020, 10}],
      guild_assets => 6000000};
get_rank_reward(1, Rank)
    when Rank >= 3 andalso Rank =< 3 ->
    #{grade => 1, rank_min => 3, rank_max => 3,
      items => [{23014, 12}, {23020, 9}],
      guild_assets => 5500000};
get_rank_reward(1, Rank)
    when Rank >= 4 andalso Rank =< 8 ->
    #{grade => 1, rank_min => 4, rank_max => 8,
      items => [{23014, 10}, {23020, 8}],
      guild_assets => 5000000};
get_rank_reward(1, Rank)
    when Rank >= 9 andalso Rank =< 16 ->
    #{grade => 1, rank_min => 9, rank_max => 16,
      items => [{23014, 10}, {23020, 7}],
      guild_assets => 5000000};
get_rank_reward(2, Rank)
    when Rank >= 1 andalso Rank =< 1 ->
    #{grade => 2, rank_min => 1, rank_max => 1,
      items => [{23014, 11}, {23020, 6}],
      guild_assets => 5000000};
get_rank_reward(2, Rank)
    when Rank >= 2 andalso Rank =< 2 ->
    #{grade => 2, rank_min => 2, rank_max => 2,
      items => [{23014, 10}, {23020, 5}],
      guild_assets => 4500000};
get_rank_reward(2, Rank)
    when Rank >= 3 andalso Rank =< 3 ->
    #{grade => 2, rank_min => 3, rank_max => 3,
      items => [{23014, 8}, {23020, 5}],
      guild_assets => 4000000};
get_rank_reward(2, Rank)
    when Rank >= 4 andalso Rank =< 8 ->
    #{grade => 2, rank_min => 4, rank_max => 8,
      items => [{23014, 8}, {23020, 4}],
      guild_assets => 3500000};
get_rank_reward(2, Rank)
    when Rank >= 9 andalso Rank =< 16 ->
    #{grade => 2, rank_min => 9, rank_max => 16,
      items => [{23014, 8}, {23020, 4}],
      guild_assets => 3500000};
get_rank_reward(2, Rank)
    when Rank >= 17 andalso Rank =< 32 ->
    #{grade => 2, rank_min => 17, rank_max => 32,
      items => [{23014, 8}, {23020, 4}],
      guild_assets => 3000000};
get_rank_reward(3, Rank)
    when Rank >= 1 andalso Rank =< 1 ->
    #{grade => 3, rank_min => 1, rank_max => 1,
      items => [{23014, 8}, {23020, 3}],
      guild_assets => 5000000};
get_rank_reward(3, Rank)
    when Rank >= 2 andalso Rank =< 2 ->
    #{grade => 3, rank_min => 2, rank_max => 2,
      items => [{23014, 7}, {23020, 2}],
      guild_assets => 4500000};
get_rank_reward(3, Rank)
    when Rank >= 3 andalso Rank =< 3 ->
    #{grade => 3, rank_min => 3, rank_max => 3,
      items => [{23014, 6}, {23020, 2}],
      guild_assets => 4000000};
get_rank_reward(3, Rank)
    when Rank >= 4 andalso Rank =< 8 ->
    #{grade => 3, rank_min => 4, rank_max => 8,
      items => [{23014, 6}], guild_assets => 3000000};
get_rank_reward(3, Rank)
    when Rank >= 9 andalso Rank =< 16 ->
    #{grade => 3, rank_min => 9, rank_max => 16,
      items => [{23014, 6}], guild_assets => 3000000};
get_rank_reward(3, Rank)
    when Rank >= 17 andalso Rank =< 32 ->
    #{grade => 3, rank_min => 17, rank_max => 32,
      items => [{23014, 6}], guild_assets => 2500000};
get_rank_reward(4, Rank)
    when Rank >= 1 andalso Rank =< 1 ->
    #{grade => 4, rank_min => 1, rank_max => 1,
      items => [{23014, 8}], guild_assets => 5000000};
get_rank_reward(4, Rank)
    when Rank >= 2 andalso Rank =< 2 ->
    #{grade => 4, rank_min => 2, rank_max => 2,
      items => [{23014, 7}], guild_assets => 4500000};
get_rank_reward(4, Rank)
    when Rank >= 3 andalso Rank =< 3 ->
    #{grade => 4, rank_min => 3, rank_max => 3,
      items => [{23014, 6}], guild_assets => 4000000};
get_rank_reward(4, Rank)
    when Rank >= 4 andalso Rank =< 8 ->
    #{grade => 4, rank_min => 4, rank_max => 8,
      items => [{23014, 5}], guild_assets => 3000000};
get_rank_reward(4, Rank)
    when Rank >= 9 andalso Rank =< 16 ->
    #{grade => 4, rank_min => 9, rank_max => 16,
      items => [{23014, 5}], guild_assets => 3000000};
get_rank_reward(4, Rank)
    when Rank >= 17 andalso Rank =< 32 ->
    #{grade => 4, rank_min => 17, rank_max => 32,
      items => [{23014, 5}], guild_assets => 2500000};
get_rank_reward(4, Rank)
    when Rank >= 33 andalso Rank =< 64 ->
    #{grade => 4, rank_min => 33, rank_max => 64,
      items => [{23014, 3}], guild_assets => 2000000};
get_rank_reward(_, _) -> false.

get_combat_reward(1) ->
    [#{result => 1, item_id => 20006, item_num => 5,
       item_name => lang:get("星辰精华"), item_weight => 230,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0},
     #{result => 1, item_id => 20052, item_num => 1,
       item_name => lang:get("藏宝图"), item_weight => 180,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0},
     #{result => 1, item_id => 20046, item_num => 1,
       item_name => lang:get("彩虹果"), item_weight => 15,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 20020, item_num => 1,
       item_name => lang:get("强化石"), item_weight => 80,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0},
     #{result => 1, item_id => 21420, item_num => 1,
       item_name => lang:get("1级图鉴"), item_weight => 130,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0},
     #{result => 1, item_id => 20087, item_num => 1,
       item_name => lang:get("四宝"), item_weight => 60,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 21421, item_num => 1,
       item_name => lang:get("2级图鉴"), item_weight => 20,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 20095, item_num => 1,
       item_name => lang:get("珍兽之魂"), item_weight => 2,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 20075, item_num => 1,
       item_name => lang:get("月亮重置丹"), item_weight => 2,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 20616, item_num => 1,
       item_name => lang:get("月亮护符"), item_weight => 4,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 20617, item_num => 1,
       item_name => lang:get("太阳护符"), item_weight => 1,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 21098, item_num => 1,
       item_name => lang:get("英雄宝石"), item_weight => 60,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0},
     #{result => 1, item_id => 20088, item_num => 1,
       item_name => lang:get("初级符石"), item_weight => 40,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0},
     #{result => 1, item_id => 20034, item_num => 1,
       item_name => lang:get("宝石包"), item_weight => 80,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0},
     #{result => 1, item_id => 20045, item_num => 1,
       item_name => lang:get("月光绒"), item_weight => 96,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0}];
get_combat_reward(2) ->
    [#{result => 2, item_id => 20006, item_num => 5,
       item_name => lang:get("星辰精华"), item_weight => 230,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0},
     #{result => 2, item_id => 20052, item_num => 1,
       item_name => lang:get("藏宝图"), item_weight => 180,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0},
     #{result => 2, item_id => 20046, item_num => 1,
       item_name => lang:get("彩虹果"), item_weight => 15,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 1},
     #{result => 2, item_id => 20020, item_num => 1,
       item_name => lang:get("强化石"), item_weight => 80,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0},
     #{result => 2, item_id => 21420, item_num => 1,
       item_name => lang:get("1级图鉴"), item_weight => 130,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0},
     #{result => 2, item_id => 20087, item_num => 1,
       item_name => lang:get("四宝"), item_weight => 60,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 1},
     #{result => 2, item_id => 21421, item_num => 1,
       item_name => lang:get("2级图鉴"), item_weight => 20,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 1},
     #{result => 2, item_id => 20095, item_num => 1,
       item_name => lang:get("珍兽之魂"), item_weight => 2,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 1},
     #{result => 2, item_id => 20075, item_num => 1,
       item_name => lang:get("月亮重置丹"), item_weight => 2,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 1},
     #{result => 2, item_id => 20616, item_num => 1,
       item_name => lang:get("月亮护符"), item_weight => 4,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 1},
     #{result => 2, item_id => 20617, item_num => 1,
       item_name => lang:get("太阳护符"), item_weight => 1,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 1},
     #{result => 2, item_id => 21098, item_num => 1,
       item_name => lang:get("英雄宝石"), item_weight => 60,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0},
     #{result => 2, item_id => 20088, item_num => 1,
       item_name => lang:get("初级符石"), item_weight => 40,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0},
     #{result => 2, item_id => 20034, item_num => 1,
       item_name => lang:get("宝石包"), item_weight => 80,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0},
     #{result => 2, item_id => 20045, item_num => 1,
       item_name => lang:get("月光绒"), item_weight => 96,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0}];
get_combat_reward(_) -> false.

get_unit_reward() -> [].

get_unit_duration(1) -> 800;
get_unit_duration(2) -> 1000;
get_unit_duration(3) -> 1500;
get_unit_duration(4) -> 800;
get_unit_duration(5) -> 1000;
get_unit_duration(6) -> 1500;
get_unit_duration(_) -> 0.

get_guess_reward({1, 5}) -> [{20006, 1}];
get_guess_reward({2, 5}) -> [{20000, 1}];
get_guess_reward({3, 5}) -> [{20002, 1}];
get_guess_reward({4, 5}) -> [{20001, 1}];
get_guess_reward({1, 6}) -> [{20008, 1}];
get_guess_reward({2, 6}) -> [{20009, 1}];
get_guess_reward({1, 7}) -> [{20010, 1}];
get_guess_reward({2, 7}) -> [{20011, 1}];
get_guess_reward({1, final}) -> [{21420, 1}];
get_guess_reward({2, final}) -> [{21421, 1}];
get_guess_reward({3, final}) -> [{21422, 1}];
get_guess_reward({4, final}) -> [{21423, 1}];
get_guess_reward({5, final}) -> [{21424, 1}];
get_guess_reward({6, final}) -> [{21425, 1}];
get_guess_reward({7, final}) -> [{21426, 1}];
get_guess_reward({8, final}) -> [{20018, 1}];
get_guess_reward(_) -> false.

get_worship_reward() ->
    [#{item_id => 20006, item_num => 5,
       item_name => lang:get("星辰精华"), item_weight => 22,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0},
     #{item_id => 20052, item_num => 1,
       item_name => lang:get("藏宝图"), item_weight => 22,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0},
     #{item_id => 20046, item_num => 1,
       item_name => lang:get("彩虹果"), item_weight => 4,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 1},
     #{item_id => 21421, item_num => 1,
       item_name => lang:get("2级图鉴"), item_weight => 3,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 1},
     #{item_id => 20025, item_num => 1,
       item_name => lang:get("冒险笔记"), item_weight => 40,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0},
     #{item_id => 20000, item_num => 1,
       item_name => lang:get("一袋银币"), item_weight => 35,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0},
     #{item_id => 20054, item_num => 1,
       item_name => lang:get("四宝"), item_weight => 25,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 1},
     #{item_id => 20074, item_num => 1,
       item_name => lang:get("星辰重置丹"), item_weight => 5,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0},
     #{item_id => 20095, item_num => 1,
       item_name => lang:get("珍兽之魂"), item_weight => 2,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 1},
     #{item_id => 20075, item_num => 1,
       item_name => lang:get("月亮重置丹"), item_weight => 3,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 1},
     #{item_id => 21420, item_num => 1,
       item_name => lang:get("1级图鉴"), item_weight => 4,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0},
     #{item_id => 0, item_num => 1,
       item_name => lang:get("空"), item_weight => 835,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0}].

