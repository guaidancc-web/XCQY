-file("src/data/quest_king_data.erl", 1).

-module(quest_king_data).

-export([get_envelop_stage/1,
         get_quest_list/1,
         get_refresh_cost/2,
         get_stage_info/1,
         get_patrol/1]).

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

-file("src/data/quest_king_data.erl", 18).

-file("inc/condition.hrl", 1).

-record(condition,
        {label :: undefined | atom(),
         op = eq ::
             ue | eq | lt | gt | le | ge | range | include,
         val :: undefined | term(),
         msg = "" :: list()}).

-file("src/data/quest_king_data.erl", 19).

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

-file("src/data/quest_king_data.erl", 20).

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

-file("src/data/quest_king_data.erl", 21).

get_envelop_stage(1) -> 1;
get_envelop_stage(2) -> 1;
get_envelop_stage(3) -> 1;
get_envelop_stage(4) -> 1;
get_envelop_stage(5) -> 1;
get_envelop_stage(6) -> 2;
get_envelop_stage(7) -> 2;
get_envelop_stage(8) -> 2;
get_envelop_stage(9) -> 2;
get_envelop_stage(10) -> 3;
get_envelop_stage(11) -> 3;
get_envelop_stage(12) -> 3;
get_envelop_stage(13) -> 4;
get_envelop_stage(14) -> 4;
get_envelop_stage(_) -> false.

get_quest_list(1) ->
    [{83600, 100, 1, 20, 150},
     {83601, 100, 0, 20, 150},
     {83602, 100, 0, 20, 150}];
get_quest_list(2) ->
    [{83603, 100, 0, 20, 150}, {83604, 100, 0, 20, 150}];
get_quest_list(3) ->
    [{83605, 100, 0, 20, 150}, {83606, 100, 0, 20, 150}];
get_quest_list(4) ->
    [{83607, 100, 0, 20, 150}, {83608, 100, 0, 20, 150}];
get_quest_list(5) ->
    [{83609, 100, 0, 20, 150},
     {83610, 100, 0, 20, 150},
     {83611, 100, 0, 20, 150}];
get_quest_list(6) -> [{83612, 100, 0, 20, 150}];
get_quest_list(7) ->
    [{83613, 100, 0, 20, 150},
     {83614, 100, 0, 20, 150},
     {83615, 100, 0, 20, 150}];
get_quest_list(8) ->
    [{83616, 100, 1, 20, 150}, {83617, 100, 0, 70, 150}];
get_quest_list(9) ->
    [{83618, 100, 0, 20, 150},
     {83619, 100, 0, 20, 150},
     {83620, 100, 0, 20, 150}];
get_quest_list(10) ->
    [{83621, 100, 0, 20, 150},
     {83622, 100, 0, 20, 150},
     {83628, 100, 0, 20, 150}];
get_quest_list(11) ->
    [{83623, 100, 0, 20, 150},
     {83624, 100, 1, 20, 150},
     {83625, 100, 0, 20, 150}];
get_quest_list(12) ->
    [{83626, 100, 0, 70, 150}, {83627, 100, 0, 20, 150}];
get_quest_list(13) ->
    [{83629, 100, 0, 20, 150}, {83630, 100, 0, 20, 150}];
get_quest_list(14) ->
    [{83631, 100, 0, 20, 150}, {83632, 100, 0, 20, 150}];
get_quest_list(_) -> false.

get_refresh_cost(1, Times)
    when Times >= 0 andalso Times =< 0 ->
    [];
get_refresh_cost(1, Times)
    when Times >= 1 andalso Times =< 1 ->
    [{90003, 1000}];
get_refresh_cost(1, Times)
    when Times >= 2 andalso Times =< 2 ->
    [{90003, 2000}];
get_refresh_cost(1, Times)
    when Times >= 3 andalso Times =< 999 ->
    [{90003, 3000}];
get_refresh_cost(2, Times)
    when Times >= 0 andalso Times =< 0 ->
    [];
get_refresh_cost(2, Times)
    when Times >= 1 andalso Times =< 1 ->
    [{90003, 2000}];
get_refresh_cost(2, Times)
    when Times >= 2 andalso Times =< 2 ->
    [{90003, 4000}];
get_refresh_cost(2, Times)
    when Times >= 3 andalso Times =< 999 ->
    [{90003, 6000}];
get_refresh_cost(3, Times)
    when Times >= 0 andalso Times =< 0 ->
    [];
get_refresh_cost(3, Times)
    when Times >= 1 andalso Times =< 1 ->
    [{90002, 10}];
get_refresh_cost(3, Times)
    when Times >= 2 andalso Times =< 2 ->
    [{90002, 20}];
get_refresh_cost(3, Times)
    when Times >= 3 andalso Times =< 999 ->
    [{90002, 30}];
get_refresh_cost(4, Times)
    when Times >= 0 andalso Times =< 0 ->
    [];
get_refresh_cost(4, Times)
    when Times >= 1 andalso Times =< 1 ->
    [{90002, 20}];
get_refresh_cost(4, Times)
    when Times >= 2 andalso Times =< 2 ->
    [{90002, 40}];
get_refresh_cost(4, Times)
    when Times >= 3 andalso Times =< 999 ->
    [{90002, 60}];
get_refresh_cost(_, _) -> false.

get_stage_info(1) ->
    #{stage => 1, count => 5, lock_count => 4,
      item_reward =>
          [{90041, 0, 50, 0},
           {20087, 0, 1, 0},
           {20006, 0, 10, 0}],
      word => lang:get("山")};
get_stage_info(2) ->
    #{stage => 2, count => 4, lock_count => 3,
      item_reward =>
          [{90041, 0, 100, 0},
           {20046, 0, 1, 0},
           {20006, 0, 20, 0}],
      word => lang:get("如")};
get_stage_info(3) ->
    #{stage => 3, count => 3, lock_count => 2,
      item_reward =>
          [{90041, 0, 200, 0},
           {90026, 0, 300, 0},
           {22300, 0, 1, 0},
           {20006, 0, 30, 0}],
      word => lang:get("爱")};
get_stage_info(4) ->
    #{stage => 4, count => 2, lock_count => 2,
      item_reward =>
          [{90041, 0, 500, 0},
           {29732, 0, 1, 1},
           {29733, 0, 1, 2},
           {29734, 0, 1, 3},
           {29735, 0, 1, 4},
           {29736, 0, 1, 5},
           {29737, 0, 1, 6},
           {22617, 0, 1, 0},
           {20006, 0, 50, 0}],
      word => lang:get("父")};
get_stage_info(_) -> false.

get_patrol(83419) ->
    [#{id => 83419, map_base_id => 10001,
       unit_list => [{62000, 500}], weight => 1000,
       pcnt => 900, min_move_step => 6, max_move_step => 20}];
get_patrol(83420) ->
    [#{id => 83420, map_base_id => 10003,
       unit_list => [{62002, 500}, {62003, 500}],
       weight => 1000, pcnt => 900, min_move_step => 6,
       max_move_step => 20}];
get_patrol(_) -> false.

