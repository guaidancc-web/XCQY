-file("src/data/camp_pet_egg_data.erl", 1).

-module(camp_pet_egg_data).

-author("Lith").

-export([get_all_group/0,
         get_reward_by_id/1,
         get_limit_num/0,
         get_extra_cfg/0]).

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

-file("src/data/camp_pet_egg_data.erl", 24).

-file("inc/condition.hrl", 1).

-record(condition,
        {label :: undefined | atom(),
         op = eq ::
             ue | eq | lt | gt | le | ge | range | include,
         val :: undefined | term(),
         msg = "" :: list()}).

-file("src/data/camp_pet_egg_data.erl", 25).

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

-file("src/data/camp_pet_egg_data.erl", 26).

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

-file("src/data/camp_pet_egg_data.erl", 27).

get_all_group() ->
    [{1,
      1,
      4999,
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
       26,
       27,
       28,
       29,
       30,
       31,
       32]},
     {2,
      5000,
      999999999,
      [101,
       102,
       103,
       104,
       105,
       106,
       107,
       108,
       109,
       110,
       111,
       112,
       113,
       114,
       115,
       116,
       117,
       118,
       119,
       120,
       121,
       122,
       123,
       124,
       125,
       126,
       127,
       128,
       129,
       130,
       131,
       132]}].

get_reward_by_id(1) ->
    #{reward_id => 1, limit_group => 1, item_id => 20364,
      num => 1, bind => 0, weight => 0, broad_cast => 2,
      rank => 0, min_lv => 1, max_lv => 200, min_break => 0,
      max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(2) ->
    #{reward_id => 2, limit_group => 2, item_id => 29010,
      num => 1, bind => 0, weight => 0, broad_cast => 2,
      rank => 1, min_lv => 1, max_lv => 200, min_break => 0,
      max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(3) ->
    #{reward_id => 3, limit_group => 999991,
      item_id => 22205, num => 1, bind => 0, weight => 5,
      broad_cast => 2, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(4) ->
    #{reward_id => 4, limit_group => 999991,
      item_id => 71033, num => 1, bind => 0, weight => 20,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 0, classes => 0,
      reward_type => 1};
get_reward_by_id(5) ->
    #{reward_id => 5, limit_group => 999991,
      item_id => 71037, num => 1, bind => 0, weight => 20,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 1, classes => 0,
      reward_type => 1};
get_reward_by_id(6) ->
    #{reward_id => 6, limit_group => 999991,
      item_id => 71105, num => 1, bind => 0, weight => 20,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 0, classes => 0,
      reward_type => 1};
get_reward_by_id(7) ->
    #{reward_id => 7, limit_group => 999991,
      item_id => 71109, num => 1, bind => 0, weight => 20,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 1, classes => 0,
      reward_type => 1};
get_reward_by_id(8) ->
    #{reward_id => 8, limit_group => 999991,
      item_id => 70459, num => 1, bind => 0, weight => 20,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 0, classes => 0,
      reward_type => 1};
get_reward_by_id(9) ->
    #{reward_id => 9, limit_group => 999991,
      item_id => 70463, num => 1, bind => 0, weight => 20,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 1, classes => 0,
      reward_type => 1};
get_reward_by_id(10) ->
    #{reward_id => 10, limit_group => 999991,
      item_id => 29902, num => 1, bind => 0, weight => 20,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 0, classes => 0,
      reward_type => 1};
get_reward_by_id(11) ->
    #{reward_id => 11, limit_group => 999991,
      item_id => 29905, num => 1, bind => 0, weight => 20,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 1, classes => 0,
      reward_type => 1};
get_reward_by_id(12) ->
    #{reward_id => 12, limit_group => 999991,
      item_id => 90026, num => 500, bind => 0, weight => 675,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(13) ->
    #{reward_id => 13, limit_group => 999991,
      item_id => 90002, num => 100, bind => 0, weight => 1000,
      broad_cast => 0, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(14) ->
    #{reward_id => 14, limit_group => 999991,
      item_id => 29100, num => 1, bind => 0, weight => 100,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(15) ->
    #{reward_id => 15, limit_group => 999991,
      item_id => 29101, num => 1, bind => 0, weight => 100,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(16) ->
    #{reward_id => 16, limit_group => 999991,
      item_id => 23740, num => 1, bind => 0, weight => 100,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(17) ->
    #{reward_id => 17, limit_group => 999991,
      item_id => 29314, num => 1, bind => 0, weight => 200,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(18) ->
    #{reward_id => 18, limit_group => 999991,
      item_id => 20053, num => 1, bind => 0, weight => 600,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(19) ->
    #{reward_id => 19, limit_group => 999991,
      item_id => 20617, num => 1, bind => 0, weight => 20,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(20) ->
    #{reward_id => 20, limit_group => 999991,
      item_id => 20076, num => 1, bind => 0, weight => 100,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(21) ->
    #{reward_id => 21, limit_group => 999991,
      item_id => 20616, num => 1, bind => 0, weight => 300,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(22) ->
    #{reward_id => 22, limit_group => 999991,
      item_id => 20075, num => 1, bind => 0, weight => 500,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(23) ->
    #{reward_id => 23, limit_group => 999991,
      item_id => 23119, num => 1, bind => 0, weight => 20,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(24) ->
    #{reward_id => 24, limit_group => 999991,
      item_id => 20014, num => 1, bind => 0, weight => 100,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(25) ->
    #{reward_id => 25, limit_group => 999991,
      item_id => 20038, num => 1, bind => 0, weight => 100,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(26) ->
    #{reward_id => 26, limit_group => 999991,
      item_id => 20095, num => 1, bind => 0, weight => 500,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(27) ->
    #{reward_id => 27, limit_group => 999991,
      item_id => 22585, num => 1, bind => 0, weight => 1000,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(28) ->
    #{reward_id => 28, limit_group => 999991,
      item_id => 20046, num => 1, bind => 0, weight => 1000,
      broad_cast => 0, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(29) ->
    #{reward_id => 29, limit_group => 999991,
      item_id => 21130, num => 1, bind => 0, weight => 1000,
      broad_cast => 0, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(30) ->
    #{reward_id => 30, limit_group => 999991,
      item_id => 21101, num => 1, bind => 0, weight => 500,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(31) ->
    #{reward_id => 31, limit_group => 999991,
      item_id => 21100, num => 1, bind => 0, weight => 1000,
      broad_cast => 0, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(32) ->
    #{reward_id => 32, limit_group => 999991,
      item_id => 20087, num => 1, bind => 0, weight => 1000,
      broad_cast => 0, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(101) ->
    #{reward_id => 101, limit_group => 1, item_id => 20364,
      num => 1, bind => 0, weight => 0, broad_cast => 2,
      rank => 0, min_lv => 1, max_lv => 200, min_break => 0,
      max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(102) ->
    #{reward_id => 102, limit_group => 2, item_id => 29010,
      num => 1, bind => 0, weight => 0, broad_cast => 2,
      rank => 1, min_lv => 1, max_lv => 200, min_break => 0,
      max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(103) ->
    #{reward_id => 103, limit_group => 999991,
      item_id => 22205, num => 1, bind => 0, weight => 5,
      broad_cast => 2, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(104) ->
    #{reward_id => 104, limit_group => 999991,
      item_id => 71033, num => 1, bind => 0, weight => 20,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 0, classes => 0,
      reward_type => 1};
get_reward_by_id(105) ->
    #{reward_id => 105, limit_group => 999991,
      item_id => 71037, num => 1, bind => 0, weight => 20,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 1, classes => 0,
      reward_type => 1};
get_reward_by_id(106) ->
    #{reward_id => 106, limit_group => 999991,
      item_id => 71105, num => 1, bind => 0, weight => 20,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 0, classes => 0,
      reward_type => 1};
get_reward_by_id(107) ->
    #{reward_id => 107, limit_group => 999991,
      item_id => 71109, num => 1, bind => 0, weight => 20,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 1, classes => 0,
      reward_type => 1};
get_reward_by_id(108) ->
    #{reward_id => 108, limit_group => 999991,
      item_id => 70459, num => 1, bind => 0, weight => 20,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 0, classes => 0,
      reward_type => 1};
get_reward_by_id(109) ->
    #{reward_id => 109, limit_group => 999991,
      item_id => 70463, num => 1, bind => 0, weight => 20,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 1, classes => 0,
      reward_type => 1};
get_reward_by_id(110) ->
    #{reward_id => 110, limit_group => 999991,
      item_id => 29902, num => 1, bind => 0, weight => 20,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 0, classes => 0,
      reward_type => 1};
get_reward_by_id(111) ->
    #{reward_id => 111, limit_group => 999991,
      item_id => 29905, num => 1, bind => 0, weight => 20,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 1, classes => 0,
      reward_type => 1};
get_reward_by_id(112) ->
    #{reward_id => 112, limit_group => 999991,
      item_id => 90026, num => 500, bind => 0, weight => 675,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(113) ->
    #{reward_id => 113, limit_group => 999991,
      item_id => 90002, num => 100, bind => 0, weight => 1000,
      broad_cast => 0, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(114) ->
    #{reward_id => 114, limit_group => 999991,
      item_id => 29100, num => 1, bind => 0, weight => 100,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(115) ->
    #{reward_id => 115, limit_group => 999991,
      item_id => 29101, num => 1, bind => 0, weight => 100,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(116) ->
    #{reward_id => 116, limit_group => 999991,
      item_id => 23740, num => 1, bind => 0, weight => 100,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(117) ->
    #{reward_id => 117, limit_group => 999991,
      item_id => 29314, num => 1, bind => 0, weight => 200,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(118) ->
    #{reward_id => 118, limit_group => 999991,
      item_id => 20053, num => 1, bind => 0, weight => 600,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(119) ->
    #{reward_id => 119, limit_group => 999991,
      item_id => 20617, num => 1, bind => 0, weight => 20,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(120) ->
    #{reward_id => 120, limit_group => 999991,
      item_id => 20076, num => 1, bind => 0, weight => 100,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(121) ->
    #{reward_id => 121, limit_group => 999991,
      item_id => 20616, num => 1, bind => 0, weight => 300,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(122) ->
    #{reward_id => 122, limit_group => 999991,
      item_id => 20075, num => 1, bind => 0, weight => 500,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(123) ->
    #{reward_id => 123, limit_group => 999991,
      item_id => 23119, num => 1, bind => 0, weight => 20,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(124) ->
    #{reward_id => 124, limit_group => 999991,
      item_id => 20014, num => 1, bind => 0, weight => 100,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(125) ->
    #{reward_id => 125, limit_group => 999991,
      item_id => 20038, num => 1, bind => 0, weight => 100,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(126) ->
    #{reward_id => 126, limit_group => 999991,
      item_id => 20095, num => 1, bind => 0, weight => 500,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(127) ->
    #{reward_id => 127, limit_group => 999991,
      item_id => 22585, num => 1, bind => 0, weight => 1000,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(128) ->
    #{reward_id => 128, limit_group => 999991,
      item_id => 20046, num => 1, bind => 0, weight => 1000,
      broad_cast => 0, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(129) ->
    #{reward_id => 129, limit_group => 999991,
      item_id => 21130, num => 1, bind => 0, weight => 1000,
      broad_cast => 0, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(130) ->
    #{reward_id => 130, limit_group => 999991,
      item_id => 21101, num => 1, bind => 0, weight => 500,
      broad_cast => 1, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(131) ->
    #{reward_id => 131, limit_group => 999991,
      item_id => 21100, num => 1, bind => 0, weight => 1000,
      broad_cast => 0, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(132) ->
    #{reward_id => 132, limit_group => 999991,
      item_id => 20087, num => 1, bind => 0, weight => 1000,
      broad_cast => 0, rank => 2, min_lv => 1, max_lv => 200,
      min_break => 0, max_break => 1, sex => 2, classes => 0,
      reward_type => 1};
get_reward_by_id(_) -> #{}.

get_limit_num() -> [{1, 2}, {2, 4}].

get_extra_cfg() ->
    [#{incubate_lv => 30, time => [{21, 0, 0, 23, 0, 0}],
       mail_title => lang:get("鸿福兔纸进化提醒"),
       mail_content =>
           lang:get("您的鸿福兔纸已达到30级，可以进化成瑞兔送福了，快去看看吧！{face_1,9}"),
       mail_title2 => lang:get("瑞兔送福开启提醒"),
       mail_content2 =>
           lang:get("在今日<color='#ffff00'>21：00-23：00</color>可开启瑞兔送"
                    "福哟，将有几率获得全服终极大奖！"),
       mail_title3 => lang:get("火爆来袭活动提醒"),
       mail_content3 =>
           lang:get("火爆来袭活动将于<color='#ffff00'>今日23：00</color>结束，请各"
                    "位主人抓紧时间领取和培养鸿福兔纸吧！祝您游戏愉快，好运降临{face_1,18}"),
       mail_title4 => lang:get("来自鸿福兔纸的感谢信"),
       mail_content4 =>
           lang:get("我和我的同伴已经回到了故乡了呢，感谢您一路的悉心照料与陪伴，这是一份小小的礼物，希望您喜欢"
                    "，我会一直挂念您哒{face_1,3}"),
       cycle_reward => [{20002, 1, 2}],
       floored =>
           [{1111, 2},
            {3333, 1},
            {5555, 2},
            {6666, 1},
            {8888, 2},
            {11111, 2}],
       lucky_item => [20364, 20302, 20303, 29004]}].

