-file("src/data/lev_break_data.erl", 1).

-module(lev_break_data).

-export([list_goal/1,
         get_goal/1,
         get_times/1,
         get_hours/0,
         get_refreshing/1,
         get_boss/1,
         get_exchange/1,
         get_clears/0,
         get_difficulty/1]).

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

-file("src/data/lev_break_data.erl", 21).

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

-file("src/data/lev_break_data.erl", 22).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/data/lev_break_data.erl", 23).

list_goal(1) ->
    [1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008];
list_goal(_Times) -> [].

get_goal(1001) ->
    #{id => 1001, times => 1, name => lang:get("重筑星途"),
      progress =>
          [#quest_progress{label = evt_lev_break_contribution,
                           target = 0, param = [], target_val = 5000}],
      desc => lang:get("全服收集<color='#249015'>星光碎片</color>")};
get_goal(1002) ->
    #{id => 1002, times => 1, name => lang:get("消灭边界"),
      progress =>
          [#quest_progress{label = evt_lev_break_boss, target = 0,
                           param = [], target_val = 1}],
      desc => lang:get("<color='#249015'>边界恶魔</color>被击杀")};
get_goal(1003) ->
    #{id => 1003, times => 1, name => lang:get("百级强者"),
      progress =>
          [#quest_progress{label = evt_levup, target = 0,
                           param = [], target_val = 100}],
      desc =>
          lang:get("人物等级达到<color='#249015'>100</color>级")};
get_goal(1004) ->
    #{id => 1004, times => 1, name => lang:get("冒险精神"),
      progress =>
          [#quest_progress{label = evt_skill_prac_levup,
                           target = 0, param = [{lev, 16}], target_val = 6}],
      desc =>
          lang:get("冒险等级全部达到<color='#249015'>16</color>级")};
get_goal(1005) ->
    #{id => 1005, times => 1, name => lang:get("盔甲铮亮"),
      progress =>
          [#quest_progress{label = evt_enchant, target = 9,
                           param = [], target_val = 8}],
      desc => lang:get("全身强化<color='#249015'>+9</color>")};
get_goal(1006) ->
    #{id => 1006, times => 1, name => lang:get("人高马大"),
      progress =>
          [#quest_progress{label = evt_mount_lev, target = 0,
                           param = [], target_val = 10}],
      desc =>
          lang:get("拥有1匹<color='#249015'>10级</color>的坐骑")};
get_goal(1007) ->
    #{id => 1007, times => 1, name => lang:get("位高权重"),
      progress =>
          [#quest_progress{label = evt_glory, target = 0,
                           param = [], target_val = 45}],
      desc =>
          lang:get("通关爵位挑战第<color='#249015'>45</color>关")};
get_goal(1008) ->
    #{id => 1008, times => 1, name => lang:get("挑战心魔"),
      progress =>
          [#quest_progress{label = evt_lev_break_trial,
                           target = 0, param = [], target_val = 1}],
      desc => lang:get("击杀<color='#249015'>心魔</color>")};
get_goal(_) -> false.

get_times(1) ->
    #{times => 1, lev_back => 95, lev_break_max => 130,
      loss =>
          [{1, 23711, 5},
           {2, 23712, 5},
           {3, 23713, 5},
           {4, 23714, 5},
           {5, 23715, 5},
           {6, 23731, 5},
           {7, 23735, 5}],
      attr_point => 25, max_exchange => 50};
get_times(_) -> false.

get_hours() -> [41400, 55800, 81000].

get_refreshing(Time)
    when Time >= 41400 andalso Time =< 45000 ->
    #{start_time => 41400, end_time => 45000,
      frequence => 15, maps => [10008],
      units => [73003, 73004, 73005, 73006]};
get_refreshing(Time)
    when Time >= 55800 andalso Time =< 59400 ->
    #{start_time => 55800, end_time => 59400,
      frequence => 15, maps => [10008],
      units => [73003, 73004, 73005, 73006]};
get_refreshing(Time)
    when Time >= 81000 andalso Time =< 84600 ->
    #{start_time => 81000, end_time => 84600,
      frequence => 15, maps => [10008],
      units => [73003, 73004, 73005, 73006]};
get_refreshing(_) -> false.

get_boss(73020) ->
    #{base_id => 73020, map => 10001, x => 3698, y => 3358,
      rewards =>
          [{20006, 10, 102},
           {20020, 5, 40},
           {20025, 2, 40},
           {20060, 3, 20},
           {20087, 1, 40},
           {20022, 1, 40},
           {20616, 1, 18},
           {20034, 2, 50},
           {20042, 1, 10},
           {20002, 1, 30},
           {20045, 1, 50},
           {20046, 1, 25},
           {21100, 1, 32},
           {21101, 1, 14},
           {20617, 1, 2},
           {20074, 1, 30},
           {20075, 1, 8},
           {20076, 1, 3},
           {20095, 1, 7},
           {20038, 1, 3},
           {29103, 1, 46},
           {29104, 2, 150},
           {22700, 1, 40},
           {29287, 1, 30},
           {21312, 1, 70},
           {23716, 1, 100}]};
get_boss(73030) ->
    #{base_id => 73030, map => 10008, x => 1506, y => 559,
      rewards => [{90010, 30000, 1000}]};
get_boss(_) -> false.

get_exchange(1) -> [{90010, 3000000}];
get_exchange(2) -> [{90010, 3500000}];
get_exchange(3) -> [{90010, 4000000}];
get_exchange(4) -> [{90010, 4500000}];
get_exchange(5) -> [{90010, 5000000}];
get_exchange(6) -> [{90010, 6000000}];
get_exchange(7) -> [{90010, 7000000}];
get_exchange(8) -> [{90010, 8000000}];
get_exchange(9) -> [{90010, 9000000}];
get_exchange(10) -> [{90010, 10000000}];
get_exchange(11) -> [{90010, 5000000}];
get_exchange(12) -> [{90010, 5800000}];
get_exchange(13) -> [{90010, 6600000}];
get_exchange(14) -> [{90010, 7400000}];
get_exchange(15) -> [{90010, 8200000}];
get_exchange(16) -> [{90010, 9000000}];
get_exchange(17) -> [{90010, 9800000}];
get_exchange(18) -> [{90010, 10600000}];
get_exchange(19) -> [{90010, 11400000}];
get_exchange(20) -> [{90010, 12200000}];
get_exchange(21) -> [{90010, 8000000}];
get_exchange(22) -> [{90010, 9000000}];
get_exchange(23) -> [{90010, 10000000}];
get_exchange(24) -> [{90010, 11000000}];
get_exchange(25) -> [{90010, 12000000}];
get_exchange(26) -> [{90010, 13000000}];
get_exchange(27) -> [{90010, 14000000}];
get_exchange(28) -> [{90010, 15000000}];
get_exchange(29) -> [{90010, 16000000}];
get_exchange(30) -> [{90010, 17000000}];
get_exchange(31) -> [{90000, 5000000}];
get_exchange(32) -> [{90000, 6000000}];
get_exchange(33) -> [{90000, 7000000}];
get_exchange(34) -> [{90000, 8000000}];
get_exchange(35) -> [{90000, 9000000}];
get_exchange(36) -> [{90000, 10000000}];
get_exchange(37) -> [{90000, 11000000}];
get_exchange(38) -> [{90000, 12000000}];
get_exchange(39) -> [{90000, 13000000}];
get_exchange(40) -> [{90000, 15000000}];
get_exchange(41) -> [{90000, 8000000}];
get_exchange(42) -> [{90000, 10000000}];
get_exchange(43) -> [{90000, 12000000}];
get_exchange(44) -> [{90000, 14000000}];
get_exchange(45) -> [{90000, 16000000}];
get_exchange(46) -> [{90000, 18000000}];
get_exchange(47) -> [{90000, 20000000}];
get_exchange(48) -> [{90000, 22000000}];
get_exchange(49) -> [{90000, 24000000}];
get_exchange(50) -> [{90000, 26000000}];
get_exchange(_) -> false.

get_clears() ->
    [#{maps => [10008],
       units => [73003, 73004, 73005, 73006]},
     #{maps => [10008],
       units => [73003, 73004, 73005, 73006]},
     #{maps => [10008],
       units => [73003, 73004, 73005, 73006]}].

get_difficulty(Day) when Day >= 11 ->
    #{day => 11,
      attr =>
          [{51, 80},
           {54, 90},
           {55, 90},
           {56, 100},
           {57, 100},
           {53, 100},
           {25, 100}]};
get_difficulty(Day) when Day >= 10 ->
    #{day => 10,
      attr =>
          [{51, 82},
           {54, 91},
           {55, 91},
           {56, 100},
           {57, 100},
           {53, 100},
           {25, 100}]};
get_difficulty(Day) when Day >= 9 ->
    #{day => 9,
      attr =>
          [{51, 84},
           {54, 92},
           {55, 92},
           {56, 100},
           {57, 100},
           {53, 100},
           {25, 100}]};
get_difficulty(Day) when Day >= 8 ->
    #{day => 8,
      attr =>
          [{51, 86},
           {54, 93},
           {55, 93},
           {56, 100},
           {57, 100},
           {53, 100},
           {25, 100}]};
get_difficulty(Day) when Day >= 7 ->
    #{day => 7,
      attr =>
          [{51, 88},
           {54, 94},
           {55, 94},
           {56, 100},
           {57, 100},
           {53, 100},
           {25, 100}]};
get_difficulty(Day) when Day >= 6 ->
    #{day => 6,
      attr =>
          [{51, 90},
           {54, 95},
           {55, 95},
           {56, 100},
           {57, 100},
           {53, 100},
           {25, 100}]};
get_difficulty(Day) when Day >= 5 ->
    #{day => 5,
      attr =>
          [{51, 92},
           {54, 96},
           {55, 96},
           {56, 100},
           {57, 100},
           {53, 100},
           {25, 100}]};
get_difficulty(Day) when Day >= 4 ->
    #{day => 4,
      attr =>
          [{51, 94},
           {54, 97},
           {55, 97},
           {56, 100},
           {57, 100},
           {53, 100},
           {25, 100}]};
get_difficulty(Day) when Day >= 3 ->
    #{day => 3,
      attr =>
          [{51, 96},
           {54, 98},
           {55, 98},
           {56, 100},
           {57, 100},
           {53, 100},
           {25, 100}]};
get_difficulty(Day) when Day >= 2 ->
    #{day => 2,
      attr =>
          [{51, 98},
           {54, 99},
           {55, 99},
           {56, 100},
           {57, 100},
           {53, 100},
           {25, 100}]};
get_difficulty(Day) when Day >= 1 ->
    #{day => 1,
      attr =>
          [{51, 100},
           {54, 100},
           {55, 100},
           {56, 100},
           {57, 100},
           {53, 100},
           {25, 100}]};
get_difficulty(_) -> false.

