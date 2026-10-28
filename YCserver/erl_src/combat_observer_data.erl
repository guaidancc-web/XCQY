-file("src/data/combat_observer_data.erl", 1).

-module(combat_observer_data).

-export([get_reward_info/1,
         get_skill_reward/1,
         get_unit_reward/1,
         get_state_reward/1,
         get_reward/1,
         get_help_reward/1,
         get_question_reward/1,
         get_box_reward/1]).

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

-file("src/data/combat_observer_data.erl", 20).

get_reward_info({71, 1}) ->
    #{combat_type => 71, reward_type => 1,
      reward_list =>
          [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]};
get_reward_info({71, 2}) ->
    #{combat_type => 71, reward_type => 2,
      reward_list =>
          [1,
           2,
           3,
           4,
           5,
           6,
           7,
           8,
           9,
           10,
           11,
           12,
           13,
           14,
           15,
           16,
           17,
           18,
           19,
           20,
           21,
           22,
           23,
           24,
           25,
           26]};
get_reward_info({71, 3}) ->
    #{combat_type => 71, reward_type => 3,
      reward_list => [1, 2]};
get_reward_info({71, 4}) ->
    #{combat_type => 71, reward_type => 4,
      reward_list => [1]};
get_reward_info(_) -> false.

get_skill_reward(_) -> false.

get_unit_reward(_) -> false.

get_state_reward(1) ->
    #{id => 1, combat_type => 71, state => 1,
      exp_mod => 1002, gift_id => 2, send_probability => 1000,
      get_probability => 1000};
get_state_reward(2) ->
    #{id => 2, combat_type => 71, state => 2,
      exp_mod => 1002, gift_id => 3, send_probability => 1000,
      get_probability => 1000};
get_state_reward(_) -> false.

get_reward(1) ->
    [#{base_id => 20006, name => lang:get("星辰精华"), num => 5,
       bind => 0, weight => 100, is_cast => 0},
     #{base_id => 21220, name => lang:get("秘宝锤"), num => 2,
       bind => 0, weight => 90, is_cast => 0},
     #{base_id => 20005, name => lang:get("人物经验心得"),
       num => 2, bind => 0, weight => 80, is_cast => 0},
     #{base_id => 20000, name => lang:get("银币袋子"), num => 1,
       bind => 0, weight => 50, is_cast => 0},
     #{base_id => 20002, name => lang:get("金币袋子"), num => 1,
       bind => 0, weight => 50, is_cast => 0},
     #{base_id => 20013, name => lang:get("魔兽要诀"), num => 1,
       bind => 0, weight => 50, is_cast => 0},
     #{base_id => 20025, name => lang:get("冒险笔记"), num => 1,
       bind => 0, weight => 50, is_cast => 0},
     #{base_id => 20020, name => lang:get("强化石"), num => 2,
       bind => 0, weight => 50, is_cast => 0},
     #{base_id => 20021, name => lang:get("幸运石"), num => 1,
       bind => 0, weight => 60, is_cast => 0},
     #{base_id => 20615, name => lang:get("星辰护符"), num => 1,
       bind => 0, weight => 30, is_cast => 0},
     #{base_id => 20074, name => lang:get("星辰重置丹"), num => 1,
       bind => 0, weight => 50, is_cast => 0},
     #{base_id => 20045, name => lang:get("月光绒"), num => 1,
       bind => 0, weight => 30, is_cast => 0},
     #{base_id => 20046, name => lang:get("彩虹果"), num => 1,
       bind => 0, weight => 30, is_cast => 1},
     #{base_id => 20087, name => lang:get("四宝"), num => 1,
       bind => 0, weight => 50, is_cast => 1},
     #{base_id => 20039, name => lang:get("灵犀"), num => 1,
       bind => 0, weight => 50, is_cast => 0},
     #{base_id => 20008, name => lang:get("+7强化保护卷"),
       num => 1, bind => 0, weight => 50, is_cast => 0},
     #{base_id => 20034, name => lang:get("宝石包"), num => 1,
       bind => 0, weight => 60, is_cast => 0},
     #{base_id => 20088, name => lang:get("初级符石"), num => 1,
       bind => 0, weight => 55, is_cast => 0},
     #{base_id => 20075, name => lang:get("月亮重置丹"), num => 1,
       bind => 0, weight => 10, is_cast => 0},
     #{base_id => 20616, name => lang:get("月亮护符"), num => 1,
       bind => 0, weight => 5, is_cast => 0}];
get_reward(2) ->
    [#{base_id => 20006, name => lang:get("星辰精华"),
       num => 10, bind => 0, weight => 120, is_cast => 0},
     #{base_id => 21220, name => lang:get("秘宝锤"), num => 2,
       bind => 0, weight => 120, is_cast => 0},
     #{base_id => 20000, name => lang:get("银币袋子"), num => 1,
       bind => 0, weight => 120, is_cast => 0},
     #{base_id => 20002, name => lang:get("金币袋子"), num => 1,
       bind => 0, weight => 120, is_cast => 0},
     #{base_id => 20025, name => lang:get("冒险笔记"), num => 2,
       bind => 0, weight => 120, is_cast => 0},
     #{base_id => 20046, name => lang:get("彩虹果"), num => 1,
       bind => 0, weight => 80, is_cast => 0},
     #{base_id => 20087, name => lang:get("四宝"), num => 1,
       bind => 0, weight => 80, is_cast => 0},
     #{base_id => 20039, name => lang:get("灵犀"), num => 1,
       bind => 0, weight => 80, is_cast => 0},
     #{base_id => 20008, name => lang:get("+7强化保护卷"),
       num => 1, bind => 0, weight => 80, is_cast => 0},
     #{base_id => 20075, name => lang:get("月亮重置丹"), num => 1,
       bind => 0, weight => 26, is_cast => 0},
     #{base_id => 20616, name => lang:get("月亮护符"), num => 1,
       bind => 0, weight => 10, is_cast => 1},
     #{base_id => 20076, name => lang:get("太阳重置丹"), num => 1,
       bind => 0, weight => 5, is_cast => 1},
     #{base_id => 20095, name => lang:get("珍兽之魂"), num => 1,
       bind => 0, weight => 26, is_cast => 1},
     #{base_id => 20038, name => lang:get("神兽之魂"), num => 1,
       bind => 0, weight => 10, is_cast => 1},
     #{base_id => 20617, name => lang:get("太阳护符"), num => 1,
       bind => 0, weight => 1, is_cast => 1},
     #{base_id => 29101, name => lang:get("仙灵卷轴"), num => 1,
       bind => 0, weight => 2, is_cast => 1}];
get_reward(3) ->
    [#{base_id => 20006, name => lang:get("星辰精华"),
       num => 10, bind => 0, weight => 120, is_cast => 0},
     #{base_id => 21220, name => lang:get("秘宝锤"), num => 2,
       bind => 0, weight => 120, is_cast => 0},
     #{base_id => 20000, name => lang:get("银币袋子"), num => 1,
       bind => 0, weight => 120, is_cast => 0},
     #{base_id => 20002, name => lang:get("金币袋子"), num => 1,
       bind => 0, weight => 120, is_cast => 0},
     #{base_id => 20025, name => lang:get("冒险笔记"), num => 2,
       bind => 0, weight => 120, is_cast => 0},
     #{base_id => 20046, name => lang:get("彩虹果"), num => 1,
       bind => 0, weight => 80, is_cast => 1},
     #{base_id => 20087, name => lang:get("四宝"), num => 1,
       bind => 0, weight => 80, is_cast => 0},
     #{base_id => 20039, name => lang:get("灵犀"), num => 1,
       bind => 0, weight => 80, is_cast => 0},
     #{base_id => 20008, name => lang:get("+7强化保护卷"),
       num => 1, bind => 0, weight => 80, is_cast => 0},
     #{base_id => 20075, name => lang:get("月亮重置丹"), num => 1,
       bind => 0, weight => 26, is_cast => 0},
     #{base_id => 20616, name => lang:get("月亮护符"), num => 1,
       bind => 0, weight => 10, is_cast => 0},
     #{base_id => 20076, name => lang:get("太阳重置丹"), num => 1,
       bind => 0, weight => 5, is_cast => 1},
     #{base_id => 20095, name => lang:get("珍兽之魂"), num => 1,
       bind => 0, weight => 26, is_cast => 1},
     #{base_id => 20038, name => lang:get("神兽之魂"), num => 1,
       bind => 0, weight => 10, is_cast => 1},
     #{base_id => 20617, name => lang:get("太阳护符"), num => 1,
       bind => 0, weight => 1, is_cast => 1},
     #{base_id => 29101, name => lang:get("仙灵卷轴"), num => 1,
       bind => 0, weight => 2, is_cast => 1}];
get_reward(4) ->
    [#{base_id => 90020, name => lang:get("王者积分"), num => 2,
       bind => 0, weight => 500, is_cast => 0},
     #{base_id => 90020, name => lang:get("王者积分"), num => 3,
       bind => 0, weight => 300, is_cast => 0},
     #{base_id => 90020, name => lang:get("王者积分"), num => 5,
       bind => 0, weight => 200, is_cast => 0}];
get_reward(_) -> false.

get_help_reward({71, 120407}) ->
    #{combat_type => 71, skill_id => 120407,
      exp_mod => 1002};
get_help_reward(_) -> false.

get_question_reward(71) ->
    #{combat_type => 71, exp_mod => 1002};
get_question_reward(_) -> false.

get_box_reward(1) ->
    #{id => 1, combat_type => 71, exp_mod => 1002,
      gift_id => 1, cd_seconds => 300,
      send_probability => 1000, get_probability => 1000};
get_box_reward(_) -> false.

