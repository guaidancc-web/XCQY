-file("src/data/teacher_data.erl", 1).

-module(teacher_data).

-export([targets/0,
         get_target/1,
         dailys/1,
         get_daily/1,
         get_daily_reward/1,
         get_encourage/1,
         get_quit/1,
         teacher_honors/0,
         get_teacher_honor/1,
         levs/0,
         get_quit_desc/1,
         get_condition/1,
         get_daily_goals/2,
         get_drop_reward/1]).

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

-file("src/data/teacher_data.erl", 30).

-file("inc/teacher.hrl", 1).

-record(m_teacher,
        {id = {0, "", 0},
         ver = 2,
         name = "",
         status = 0,
         daily = [],
         daily_reward = 0,
         daily_time = 0,
         target = [],
         target_reward = [],
         target_rewarded = [],
         target_over = [],
         evaluation = [],
         study_lev = 0,
         mtime = 0,
         daily_goals = [],
         goals_times = 0}).

-record(teacher,
        {id = {0, "", 0},
         ver = 1,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         guild_id = {0, "", 0},
         guild_name = "",
         msg = "",
         teacher_score = 0,
         teacher_score_offline = 0,
         login_time = 0,
         fc = 0,
         students = []}).

-record(student,
        {id = {0, "", 0},
         ver = 2,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         status = 0,
         in_time = 0,
         out_time = 0,
         login_time = 0,
         guild_id = {0, "", 0},
         guild_name = "",
         daily = [],
         daily_time = 0,
         daily_reward = 0,
         quest_student_reward = 0,
         quest_teacher_reward = 0,
         encourage_time = 0,
         target = [],
         teacher_score = 0,
         fc = 0,
         target_reward = [],
         target_rewarded = []}).

-record(teacher_daily,
        {id = 1 :: pos_integer(),
         finish = 0 :: 0..2,
         progress = [] :: [tuple()]}).

-record(teacher_daily_data,
        {id = 1 :: pos_integer(),
         name = "" :: binary(),
         progress = [] :: [tuple()],
         reward = [],
         exp = 0}).

-record(teacher_target,
        {id = 1 :: pos_integer(),
         finish = 0 :: 0..2,
         progress = [] :: [tuple()]}).

-record(teacher_target_data,
        {id = 1 :: pos_integer(),
         name = "" :: binary(),
         progress = [] :: [tuple()],
         student_reward = [],
         teacher_reward = [],
         student_exp = 0,
         teacher_exp = 0}).

-record(teacher_sign,
        {id = {0, "", 0},
         ver = 1,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         online = 0,
         login_time = 0,
         logout_time = 0,
         online_time = 0,
         is_sign = 0,
         msg = ""}).

-record(teacher_quit_desc_data,
        {min = 0, max = 0, radio = 0, title = "", msg = ""}).

-record(teacher_student_sign_info,
        {id = {0, "", 0},
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         msg = ""}).

-file("src/data/teacher_data.erl", 31).

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

-file("src/data/teacher_data.erl", 32).

targets() ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15].

get_target(1) ->
    #teacher_target_data{id = 1,
                         progress =
                             [#quest_progress{label = evt_levup, target = 0,
                                              param = [], target_val = 25}],
                         student_reward = [{90000, 0, 12000}],
                         student_exp = 1000, teacher_reward = [{90019, 0, 6}],
                         teacher_exp = 800};
get_target(2) ->
    #teacher_target_data{id = 2,
                         progress =
                             [#quest_progress{label = evt_levup, target = 0,
                                              param = [], target_val = 30}],
                         student_reward = [{90000, 0, 15000}, {20025, 0, 1}],
                         student_exp = 1000, teacher_reward = [{90019, 0, 6}],
                         teacher_exp = 850};
get_target(3) ->
    #teacher_target_data{id = 3,
                         progress =
                             [#quest_progress{label = evt_levup, target = 0,
                                              param = [], target_val = 35}],
                         student_reward = [{90000, 0, 18000}],
                         student_exp = 1000, teacher_reward = [{90019, 0, 6}],
                         teacher_exp = 900};
get_target(4) ->
    #teacher_target_data{id = 4,
                         progress =
                             [#quest_progress{label = evt_wing_lev, target = 1,
                                              param = [{star_lev, 1}],
                                              target_val = 1}],
                         student_reward = [{90000, 0, 20000}, {29143, 0, 1}],
                         student_exp = 1000, teacher_reward = [{90019, 0, 16}],
                         teacher_exp = 950};
get_target(5) ->
    #teacher_target_data{id = 5,
                         progress =
                             [#quest_progress{label = evt_levup, target = 0,
                                              param = [], target_val = 40}],
                         student_reward = [{90000, 0, 20000}, {20034, 0, 1}],
                         student_exp = 1000, teacher_reward = [{90019, 0, 9}],
                         teacher_exp = 1000};
get_target(6) ->
    #teacher_target_data{id = 6,
                         progress =
                             [#quest_progress{label = evt_levup, target = 0,
                                              param = [], target_val = 45}],
                         student_reward = [{90000, 0, 20000}],
                         student_exp = 1000,
                         teacher_reward = [{90019, 0, 9}, {20052, 0, 1}],
                         teacher_exp = 1050};
get_target(7) ->
    #teacher_target_data{id = 7,
                         progress =
                             [#quest_progress{label = evt_levup, target = 0,
                                              param = [], target_val = 50}],
                         student_reward = [{90000, 0, 20000}, {20034, 0, 1}],
                         student_exp = 1000,
                         teacher_reward = [{90019, 0, 9}, {20052, 0, 1}],
                         teacher_exp = 1100};
get_target(8) ->
    #teacher_target_data{id = 8,
                         progress =
                             [#quest_progress{label = evt_levup, target = 0,
                                              param = [], target_val = 55}],
                         student_reward = [{90000, 0, 20000}],
                         student_exp = 1000,
                         teacher_reward = [{90019, 0, 9}, {20052, 0, 1}],
                         teacher_exp = 1150};
get_target(9) ->
    #teacher_target_data{id = 9,
                         progress =
                             [#quest_progress{label = evt_enchant, target = 3,
                                              param = [], target_val = 8}],
                         student_reward = [{90000, 0, 23000}, {29143, 0, 1}],
                         student_exp = 1000,
                         teacher_reward = [{90019, 0, 16}, {20052, 0, 1}],
                         teacher_exp = 1200};
get_target(10) ->
    #teacher_target_data{id = 10,
                         progress =
                             [#quest_progress{label = evt_levup, target = 0,
                                              param = [], target_val = 60}],
                         student_reward = [{90000, 0, 25000}],
                         student_exp = 1000,
                         teacher_reward = [{90019, 0, 9}, {20052, 0, 1}],
                         teacher_exp = 1500};
get_target(11) ->
    #teacher_target_data{id = 11,
                         progress =
                             [#quest_progress{label = evt_wing_lev, target = 2,
                                              param = [{star_lev, 1}],
                                              target_val = 1}],
                         student_reward = [{90000, 0, 25000}],
                         student_exp = 1000,
                         teacher_reward = [{90019, 0, 16}, {20052, 0, 1}],
                         teacher_exp = 2000};
get_target(12) ->
    #teacher_target_data{id = 12,
                         progress =
                             [#quest_progress{label = evt_levup, target = 0,
                                              param = [], target_val = 70}],
                         student_reward = [{90012, 0, 30}], student_exp = 3000,
                         teacher_reward = [{90012, 0, 30}], teacher_exp = 5000};
get_target(13) ->
    #teacher_target_data{id = 13,
                         progress =
                             [#quest_progress{label = evt_levup, target = 0,
                                              param = [], target_val = 75}],
                         student_reward = [{90012, 0, 30}], student_exp = 3000,
                         teacher_reward = [{90012, 0, 30}], teacher_exp = 5000};
get_target(14) ->
    #teacher_target_data{id = 14,
                         progress =
                             [#quest_progress{label = evt_wing_lev, target = 5,
                                              param = [{star_lev, 1}],
                                              target_val = 1}],
                         student_reward = [{90012, 0, 30}], student_exp = 3000,
                         teacher_reward = [{90012, 0, 30}], teacher_exp = 5000};
get_target(15) ->
    #teacher_target_data{id = 15,
                         progress =
                             [#quest_progress{label = evt_levup, target = 0,
                                              param = [], target_val = 80}],
                         student_reward = [{90012, 0, 30}], student_exp = 3000,
                         teacher_reward = [{90012, 0, 30}, {20053, 0, 1}],
                         teacher_exp = 5000};
get_target(_) -> false.

dailys(Lev) when Lev >= 20 andalso Lev =< 27 ->
    [{1, 100}, {2, 100}, {3, 0}];
dailys(Lev) when Lev >= 28 andalso Lev =< 29 ->
    [{1, 100}, {2, 100}, {3, 0}, {4, 100}, {5, 100}];
dailys(Lev) when Lev >= 30 andalso Lev =< 34 ->
    [{1, 100},
     {2, 100},
     {3, 0},
     {4, 100},
     {5, 100},
     {7, 100}];
dailys(Lev) when Lev >= 35 andalso Lev =< 39 ->
    [{1, 100},
     {2, 100},
     {3, 0},
     {4, 100},
     {5, 100},
     {7, 100},
     {8, 100}];
dailys(Lev) when Lev >= 40 andalso Lev =< 100 ->
    [{1, 100},
     {2, 100},
     {3, 0},
     {4, 100},
     {5, 100},
     {7, 100},
     {8, 100}];
dailys(_) -> [].

get_daily(1) ->
    #teacher_daily_data{id = 1,
                        name =
                            lang:get("完成<color='#ffff00'>10次</color>每日的职业任务"),
                        progress =
                            [#quest_progress{label = evt_commit_quest,
                                             target = 0,
                                             param = [{sec_type, 4}],
                                             target_val = 10}],
                        exp = 1};
get_daily(2) ->
    #teacher_daily_data{id = 2,
                        name = lang:get("组队完成<color='#ffff00'>10次</color>悬赏任务"),
                        progress =
                            [#quest_progress{label = evt_commit_quest,
                                             target = 0,
                                             param = [{sec_type, 3}],
                                             target_val = 10}],
                        exp = 1};
get_daily(3) ->
    #teacher_daily_data{id = 3,
                        name =
                            lang:get("与师傅一起完成<color='#ffff00'>5次</color>师徒任务"),
                        progress =
                            [#quest_progress{label = evt_commit_quest,
                                             target = 0,
                                             param = [{sec_type, 18}],
                                             target_val = 5}],
                        exp = 1};
get_daily(4) ->
    #teacher_daily_data{id = 4,
                        name =
                            lang:get("完成<color='#ffff00'>远航任务</color>，获得大量冒险经验"),
                        progress =
                            [#quest_progress{label = evt_shipping_sail,
                                             target = 0, param = [],
                                             target_val = 1}],
                        exp = 1};
get_daily(5) ->
    #teacher_daily_data{id = 5,
                        name =
                            lang:get("进行<color='#ffff00'>3场</color>竞技场，展现自己的实力"),
                        progress =
                            [#quest_progress{label = evt_arena_fight,
                                             target = 0, param = [],
                                             target_val = 3}],
                        exp = 1};
get_daily(6) ->
    #teacher_daily_data{id = 6,
                        name =
                            lang:get("通过宝图任务，缴获<color='#ffff00'>3张</color>藏宝图"),
                        progress =
                            [#quest_progress{label = evt_quest_treasure,
                                             target = 0, param = [],
                                             target_val = 3}],
                        exp = 1};
get_daily(7) ->
    #teacher_daily_data{id = 7,
                        name =
                            lang:get("清剿<color='#ffff00'>5只</color>上古妖魔，获得经验奖励"),
                        progress =
                            [#quest_progress{label = evt_kill_treasure_ghost,
                                             target = 0, param = [],
                                             target_val = 5}],
                        exp = 1};
get_daily(8) ->
    #teacher_daily_data{id = 8,
                        name = lang:get("通关任意<color='#ffff00'>1个</color>副本"),
                        progress =
                            [#quest_progress{label = evt_dungeon_pass,
                                             target = 0, param = [],
                                             target_val = 1}],
                        exp = 1};
get_daily(9) ->
    #teacher_daily_data{id = 9,
                        name = lang:get("挑战<color='#ffff00'>1次</color>世界BOSS"),
                        progress =
                            [#quest_progress{label = evt_kill_npc, target = 0,
                                             param = [{type, 6}],
                                             target_val = 1}],
                        exp = 1};
get_daily(10) ->
    #teacher_daily_data{id = 10,
                        name = lang:get("挑战<color='#ffff00'>2次</color>天空之塔"),
                        progress =
                            [#quest_progress{label = evt_tower, target = 0,
                                             param = [], target_val = 2}],
                        exp = 1};
get_daily(_) -> false.

get_daily_reward({2, 50, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 50, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 50, 3}) -> {[], 0};
get_daily_reward({2, 51, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 51, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 51, 3}) -> {[], 0};
get_daily_reward({2, 52, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 52, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 52, 3}) -> {[], 0};
get_daily_reward({2, 53, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 53, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 53, 3}) -> {[], 0};
get_daily_reward({2, 54, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 54, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 54, 3}) -> {[], 0};
get_daily_reward({2, 55, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 55, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 55, 3}) -> {[], 0};
get_daily_reward({2, 56, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 56, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 56, 3}) -> {[], 0};
get_daily_reward({2, 57, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 57, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 57, 3}) -> {[], 0};
get_daily_reward({2, 58, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 58, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 58, 3}) -> {[], 0};
get_daily_reward({2, 59, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 59, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 59, 3}) -> {[], 0};
get_daily_reward({2, 60, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 60, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 60, 3}) -> {[], 0};
get_daily_reward({2, 61, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 61, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 61, 3}) -> {[], 0};
get_daily_reward({2, 62, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 62, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 62, 3}) -> {[], 0};
get_daily_reward({2, 63, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 63, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 63, 3}) -> {[], 0};
get_daily_reward({2, 64, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 64, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 64, 3}) -> {[], 0};
get_daily_reward({2, 65, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 65, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 65, 3}) -> {[], 0};
get_daily_reward({2, 66, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 66, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 66, 3}) -> {[], 0};
get_daily_reward({2, 67, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 67, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 67, 3}) -> {[], 0};
get_daily_reward({2, 68, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 68, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 68, 3}) -> {[], 0};
get_daily_reward({2, 69, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 69, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 69, 3}) -> {[], 0};
get_daily_reward({2, 70, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 70, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 70, 3}) -> {[], 0};
get_daily_reward({2, 71, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 71, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 71, 3}) -> {[], 0};
get_daily_reward({2, 72, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 72, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 72, 3}) -> {[], 0};
get_daily_reward({2, 73, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 73, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 73, 3}) -> {[], 0};
get_daily_reward({2, 74, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 74, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 74, 3}) -> {[], 0};
get_daily_reward({2, 75, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 75, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 75, 3}) -> {[], 0};
get_daily_reward({2, 76, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 76, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 76, 3}) -> {[], 0};
get_daily_reward({2, 77, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 77, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 77, 3}) -> {[], 0};
get_daily_reward({2, 78, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 78, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 78, 3}) -> {[], 0};
get_daily_reward({2, 79, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 79, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 79, 3}) -> {[], 0};
get_daily_reward({2, 80, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 80, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 80, 3}) -> {[], 0};
get_daily_reward({2, 81, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 81, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 81, 3}) -> {[], 0};
get_daily_reward({2, 82, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 82, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 82, 3}) -> {[], 0};
get_daily_reward({2, 83, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 83, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 83, 3}) -> {[], 0};
get_daily_reward({2, 84, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 84, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 84, 3}) -> {[], 0};
get_daily_reward({2, 85, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 85, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 85, 3}) -> {[], 0};
get_daily_reward({2, 86, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 86, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 86, 3}) -> {[], 0};
get_daily_reward({2, 87, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 87, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 87, 3}) -> {[], 0};
get_daily_reward({2, 88, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 88, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 88, 3}) -> {[], 0};
get_daily_reward({2, 89, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 89, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 89, 3}) -> {[], 0};
get_daily_reward({2, 90, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 90, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 90, 3}) -> {[], 0};
get_daily_reward({2, 91, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 91, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 91, 3}) -> {[], 0};
get_daily_reward({2, 92, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 92, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 92, 3}) -> {[], 0};
get_daily_reward({2, 93, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 93, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 93, 3}) -> {[], 0};
get_daily_reward({2, 94, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 94, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 94, 3}) -> {[], 0};
get_daily_reward({2, 95, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 95, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 95, 3}) -> {[], 0};
get_daily_reward({2, 96, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 96, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 96, 3}) -> {[], 0};
get_daily_reward({2, 97, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 97, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 97, 3}) -> {[], 0};
get_daily_reward({2, 98, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 98, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 98, 3}) -> {[], 0};
get_daily_reward({2, 99, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 99, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 99, 3}) -> {[], 0};
get_daily_reward({2, 100, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 100, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 100, 3}) -> {[], 0};
get_daily_reward({2, 101, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 101, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 101, 3}) -> {[], 0};
get_daily_reward({2, 102, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 102, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 102, 3}) -> {[], 0};
get_daily_reward({2, 103, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 103, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 103, 3}) -> {[], 0};
get_daily_reward({2, 104, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 104, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 104, 3}) -> {[], 0};
get_daily_reward({2, 105, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 105, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 105, 3}) -> {[], 0};
get_daily_reward({2, 106, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 106, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 106, 3}) -> {[], 0};
get_daily_reward({2, 107, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 107, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 107, 3}) -> {[], 0};
get_daily_reward({2, 108, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 108, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 108, 3}) -> {[], 0};
get_daily_reward({2, 109, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 109, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 109, 3}) -> {[], 0};
get_daily_reward({2, 110, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 110, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 110, 3}) -> {[], 0};
get_daily_reward({2, 111, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 111, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 111, 3}) -> {[], 0};
get_daily_reward({2, 112, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 112, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 112, 3}) -> {[], 0};
get_daily_reward({2, 113, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 113, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 113, 3}) -> {[], 0};
get_daily_reward({2, 114, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 114, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 114, 3}) -> {[], 0};
get_daily_reward({2, 115, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 115, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 115, 3}) -> {[], 0};
get_daily_reward({2, 116, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 116, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 116, 3}) -> {[], 0};
get_daily_reward({2, 117, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 117, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 117, 3}) -> {[], 0};
get_daily_reward({2, 118, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 118, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 118, 3}) -> {[], 0};
get_daily_reward({2, 119, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 119, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 119, 3}) -> {[], 0};
get_daily_reward({2, 120, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 120, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 120, 3}) -> {[], 0};
get_daily_reward({2, 121, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 121, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 121, 3}) -> {[], 0};
get_daily_reward({2, 122, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 122, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 122, 3}) -> {[], 0};
get_daily_reward({2, 123, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 123, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 123, 3}) -> {[], 0};
get_daily_reward({2, 124, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 124, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 124, 3}) -> {[], 0};
get_daily_reward({2, 125, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 125, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 125, 3}) -> {[], 0};
get_daily_reward({2, 126, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 126, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 126, 3}) -> {[], 0};
get_daily_reward({2, 127, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 127, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 127, 3}) -> {[], 0};
get_daily_reward({2, 128, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 128, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 128, 3}) -> {[], 0};
get_daily_reward({2, 129, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 129, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 129, 3}) -> {[], 0};
get_daily_reward({2, 130, 2}) -> {[{90019, 1, 10}], 0};
get_daily_reward({2, 130, 1}) -> {[{90019, 1, 5}], 0};
get_daily_reward({2, 130, 3}) -> {[], 0};
get_daily_reward({1, 20, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 20, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 20, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 21, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 21, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 21, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 22, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 22, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 22, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 23, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 23, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 23, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 24, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 24, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 24, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 25, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 25, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 25, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 26, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 26, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 26, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 27, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 27, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 27, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 28, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 28, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 28, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 29, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 29, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 29, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 30, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 30, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 30, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 31, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 31, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 31, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 32, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 32, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 32, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 33, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 33, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 33, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 34, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 34, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 34, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 35, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 35, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 35, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 36, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 36, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 36, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 37, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 37, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 37, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 38, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 38, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 38, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 39, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 39, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 39, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 40, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 40, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 40, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 41, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 41, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 41, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 42, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 42, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 42, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 43, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 43, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 43, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 44, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 44, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 44, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 45, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 45, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 45, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 46, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 46, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 46, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 47, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 47, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 47, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 48, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 48, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 48, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 49, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 49, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 49, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 50, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 50, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 50, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 51, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 51, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 51, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 52, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 52, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 52, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 53, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 53, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 53, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 54, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 54, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 54, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 55, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 55, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 55, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 56, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 56, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 56, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 57, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 57, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 57, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 58, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 58, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 58, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 59, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 59, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 59, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 60, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 60, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 60, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 61, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 61, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 61, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 62, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 62, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 62, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 63, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 63, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 63, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 64, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 64, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 64, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 65, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 65, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 65, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 66, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 66, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 66, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 67, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 67, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 67, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 68, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 68, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 68, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 69, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 69, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 69, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 70, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 70, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 70, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 71, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 71, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 71, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 72, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 72, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 72, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 73, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 73, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 73, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 74, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 74, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 74, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 75, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 75, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 75, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 76, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 76, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 76, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 77, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 77, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 77, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 78, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 78, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 78, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 79, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 79, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 79, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 80, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 80, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 80, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 81, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 81, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 81, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 82, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 82, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 82, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 83, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 83, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 83, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 84, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 84, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 84, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 85, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 85, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 85, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 86, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 86, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 86, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 87, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 87, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 87, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 88, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 88, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 88, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 89, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 89, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 89, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 90, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 90, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 90, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 91, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 91, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 91, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 92, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 92, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 92, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 93, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 93, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 93, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 94, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 94, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 94, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 95, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 95, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 95, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 96, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 96, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 96, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 97, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 97, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 97, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 98, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 98, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 98, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 99, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 99, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 99, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 100, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 100, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 100, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 101, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 101, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 101, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 102, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 102, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 102, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 103, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 103, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 103, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 104, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 104, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 104, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 105, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 105, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 105, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 106, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 106, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 106, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 107, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 107, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 107, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 108, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 108, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 108, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 109, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 109, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 109, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 110, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 110, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 110, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 111, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 111, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 111, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 112, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 112, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 112, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 113, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 113, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 113, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 114, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 114, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 114, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 115, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 115, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 115, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 116, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 116, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 116, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 117, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 117, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 117, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 118, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 118, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 118, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 119, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 119, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 119, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 120, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 120, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 120, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 121, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 121, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 121, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 122, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 122, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 122, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 123, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 123, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 123, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 124, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 124, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 124, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 125, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 125, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 125, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 126, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 126, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 126, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 127, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 127, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 127, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 128, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 128, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 128, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 129, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 129, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 129, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward({1, 130, 2}) ->
    {[{20004, 0, 2}, {20005, 0, 2}], 5};
get_daily_reward({1, 130, 1}) ->
    {[{20005, 0, 1}, {20052, 0, 1}], 3};
get_daily_reward({1, 130, 3}) -> {[{20052, 0, 1}], 1};
get_daily_reward(_) -> false.

get_encourage({2, 55}) -> [val_not_exist];
get_encourage({2, 56}) -> [val_not_exist];
get_encourage({2, 57}) -> [val_not_exist];
get_encourage({2, 58}) -> [val_not_exist];
get_encourage({2, 59}) -> [val_not_exist];
get_encourage({2, 60}) -> [val_not_exist];
get_encourage({2, 61}) -> [val_not_exist];
get_encourage({2, 62}) -> [val_not_exist];
get_encourage({2, 63}) -> [val_not_exist];
get_encourage({2, 64}) -> [val_not_exist];
get_encourage({2, 65}) -> [val_not_exist];
get_encourage({2, 66}) -> [val_not_exist];
get_encourage({2, 67}) -> [val_not_exist];
get_encourage({2, 68}) -> [val_not_exist];
get_encourage({2, 69}) -> [val_not_exist];
get_encourage({2, 70}) -> [val_not_exist];
get_encourage({2, 71}) -> [val_not_exist];
get_encourage({2, 72}) -> [val_not_exist];
get_encourage({2, 73}) -> [val_not_exist];
get_encourage({2, 74}) -> [val_not_exist];
get_encourage({2, 75}) -> [val_not_exist];
get_encourage({2, 76}) -> [val_not_exist];
get_encourage({2, 77}) -> [val_not_exist];
get_encourage({2, 78}) -> [val_not_exist];
get_encourage({2, 79}) -> [val_not_exist];
get_encourage({2, 80}) -> [val_not_exist];
get_encourage({2, 81}) -> [val_not_exist];
get_encourage({2, 82}) -> [val_not_exist];
get_encourage({2, 83}) -> [val_not_exist];
get_encourage({2, 84}) -> [val_not_exist];
get_encourage({2, 85}) -> [val_not_exist];
get_encourage({2, 86}) -> [val_not_exist];
get_encourage({2, 87}) -> [val_not_exist];
get_encourage({2, 88}) -> [val_not_exist];
get_encourage({2, 89}) -> [val_not_exist];
get_encourage({2, 90}) -> [val_not_exist];
get_encourage({2, 91}) -> [val_not_exist];
get_encourage({2, 92}) -> [val_not_exist];
get_encourage({2, 93}) -> [val_not_exist];
get_encourage({2, 94}) -> [val_not_exist];
get_encourage({2, 95}) -> [val_not_exist];
get_encourage({2, 96}) -> [val_not_exist];
get_encourage({2, 97}) -> [val_not_exist];
get_encourage({2, 98}) -> [val_not_exist];
get_encourage({2, 99}) -> [val_not_exist];
get_encourage({2, 100}) -> [val_not_exist];
get_encourage({1, 20}) -> [val_not_exist];
get_encourage({1, 21}) -> [val_not_exist];
get_encourage({1, 22}) -> [val_not_exist];
get_encourage({1, 23}) -> [val_not_exist];
get_encourage({1, 24}) -> [val_not_exist];
get_encourage({1, 25}) -> [val_not_exist];
get_encourage({1, 26}) -> [val_not_exist];
get_encourage({1, 27}) -> [val_not_exist];
get_encourage({1, 28}) -> [val_not_exist];
get_encourage({1, 29}) -> [val_not_exist];
get_encourage({1, 30}) -> [val_not_exist];
get_encourage({1, 31}) -> [val_not_exist];
get_encourage({1, 32}) -> [val_not_exist];
get_encourage({1, 33}) -> [val_not_exist];
get_encourage({1, 34}) -> [val_not_exist];
get_encourage({1, 35}) -> [val_not_exist];
get_encourage({1, 36}) -> [val_not_exist];
get_encourage({1, 37}) -> [val_not_exist];
get_encourage({1, 38}) -> [val_not_exist];
get_encourage({1, 39}) -> [val_not_exist];
get_encourage({1, 40}) -> [val_not_exist];
get_encourage({1, 41}) -> [val_not_exist];
get_encourage({1, 42}) -> [val_not_exist];
get_encourage({1, 43}) -> [val_not_exist];
get_encourage({1, 44}) -> [val_not_exist];
get_encourage({1, 45}) -> [val_not_exist];
get_encourage({1, 46}) -> [val_not_exist];
get_encourage({1, 47}) -> [val_not_exist];
get_encourage({1, 48}) -> [val_not_exist];
get_encourage({1, 49}) -> [val_not_exist];
get_encourage({1, 50}) -> [val_not_exist];
get_encourage({1, 51}) -> [val_not_exist];
get_encourage({1, 52}) -> [val_not_exist];
get_encourage({1, 53}) -> [val_not_exist];
get_encourage({1, 54}) -> [val_not_exist];
get_encourage({1, 55}) -> [val_not_exist];
get_encourage({1, 56}) -> [val_not_exist];
get_encourage({1, 57}) -> [val_not_exist];
get_encourage({1, 58}) -> [val_not_exist];
get_encourage({1, 59}) -> [val_not_exist];
get_encourage({1, 60}) -> [val_not_exist];
get_encourage({1, 61}) -> [val_not_exist];
get_encourage({1, 62}) -> [val_not_exist];
get_encourage({1, 63}) -> [val_not_exist];
get_encourage({1, 64}) -> [val_not_exist];
get_encourage({1, 65}) -> [val_not_exist];
get_encourage({1, 66}) -> [val_not_exist];
get_encourage({1, 67}) -> [val_not_exist];
get_encourage({1, 68}) -> [val_not_exist];
get_encourage({1, 69}) -> [val_not_exist];
get_encourage({1, 70}) -> [val_not_exist];
get_encourage({1, 71}) -> [val_not_exist];
get_encourage({1, 72}) -> [val_not_exist];
get_encourage({1, 73}) -> [val_not_exist];
get_encourage({1, 74}) -> [val_not_exist];
get_encourage({1, 75}) -> [val_not_exist];
get_encourage({1, 76}) -> [val_not_exist];
get_encourage({1, 77}) -> [val_not_exist];
get_encourage({1, 78}) -> [val_not_exist];
get_encourage({1, 79}) -> [val_not_exist];
get_encourage({1, 80}) -> [val_not_exist];
get_encourage({1, 81}) -> [val_not_exist];
get_encourage({1, 82}) -> [val_not_exist];
get_encourage({1, 83}) -> [val_not_exist];
get_encourage({1, 84}) -> [val_not_exist];
get_encourage({1, 85}) -> [val_not_exist];
get_encourage({1, 86}) -> [val_not_exist];
get_encourage({1, 87}) -> [val_not_exist];
get_encourage({1, 88}) -> [val_not_exist];
get_encourage({1, 89}) -> [val_not_exist];
get_encourage({1, 90}) -> [val_not_exist];
get_encourage({1, 91}) -> [val_not_exist];
get_encourage({1, 92}) -> [val_not_exist];
get_encourage({1, 93}) -> [val_not_exist];
get_encourage({1, 94}) -> [val_not_exist];
get_encourage({1, 95}) -> [val_not_exist];
get_encourage({1, 96}) -> [val_not_exist];
get_encourage({1, 97}) -> [val_not_exist];
get_encourage({1, 98}) -> [val_not_exist];
get_encourage({1, 99}) -> [val_not_exist];
get_encourage({1, 100}) -> [val_not_exist];
get_encourage(_) -> [].

get_quit({2, Lev}) when Lev >= 0 andalso Lev =< 199 ->
    {[{23037, 1, 1}, {20002, 1, 2}],
     lang:get("已经出师，下次请给徒弟更多帮助哦！")};
get_quit({2, Lev})
    when Lev >= 200 andalso Lev =< 9999999 ->
    {[{23036, 1, 1}, {20002, 1, 3}],
     lang:get("已经完美出师，他觉得你堪称一个完美师傅！")};
get_quit({1, Lev}) when Lev >= 0 andalso Lev =< 999 ->
    {[{23038, 1, 1}], lang:get("您已经学成而归，顺利出师了！")};
get_quit(_) -> {[], ""}.

teacher_honors() -> [].

get_teacher_honor(_) -> 0.

levs() ->
    [20,
     25,
     30,
     33,
     36,
     39,
     42,
     44,
     46,
     48,
     50,
     52,
     54,
     56,
     58,
     60,
     62,
     64].

get_quit_desc(Val) when Val >= 4 andalso Val =< 4 ->
    #teacher_quit_desc_data{min = 4, max = 4, radio = 1000,
                            title = lang:get("出师提示"),
                            msg =
                                lang:get("当前出师弟子是您本月<color=#ffff00>第4位</color>弟子，下次出师师傅"
                                         "获得的经验将<color=#00ff00>减少60%</color>,且无法获得<colo"
                                         "r=#00ff00>良师礼包</color>")};
get_quit_desc(Val) when Val >= 5 andalso Val =< 7 ->
    #teacher_quit_desc_data{min = 5, max = 7, radio = 350,
                            title = lang:get("出师提示"),
                            msg =
                                lang:get("您本月的出师弟子<color=#ffff00>超过4人</color>，出师获得的经验将<"
                                         "color=#ffff00>减少60%</color>,且无法获得<color=#00ff"
                                         "00>良师礼包</color>")};
get_quit_desc(Val) when Val >= 8 andalso Val =< 8 ->
    #teacher_quit_desc_data{min = 8, max = 8, radio = 250,
                            title = lang:get("出师提示"),
                            msg =
                                lang:get("当前出师弟子您本月的<color=#ffff00>第8位</color>弟子，下次出师师傅"
                                         "获得的经验将<color=#00ff00>减少80%</color>,且无法获得<colo"
                                         "r=#00ff00>良师礼包</color>")};
get_quit_desc(Val)
    when Val >= 9 andalso Val =< 100000 ->
    #teacher_quit_desc_data{min = 9, max = 100000,
                            radio = 150, title = lang:get("出师提示"),
                            msg =
                                lang:get("您本月的出师弟子<color=#ffff00>超过8人</color>，出师获得的经验将<"
                                         "color=#00ff00>减少80%</color>,且无法获得<color=#00ff"
                                         "00>良师礼包</color>")};
get_quit_desc(_) -> false.

get_condition(35) -> {40, 75, 43, 80};
get_condition(40) -> {40, 75, 43, 80};
get_condition(45) -> {45, 75, 50, 80};
get_condition(50) -> {50, 75, 55, 80};
get_condition(55) -> {55, 75, 60, 80};
get_condition(60) -> {60, 75, 65, 80};
get_condition(65) -> {65, 75, 70, 80};
get_condition(70) -> {70, 75, 75, 80};
get_condition(75) -> {70, 75, 80, 80};
get_condition(80) -> {70, 75, 85, 80};
get_condition(85) -> {70, 75, 85, 80};
get_condition(90) -> {70, 75, 85, 80};
get_condition(95) -> {70, 75, 85, 80};
get_condition(100) -> {70, 75, 85, 80};
get_condition(105) -> {70, 75, 85, 80};
get_condition(110) -> {70, 75, 85, 80};
get_condition(115) -> {70, 75, 85, 80};
get_condition(120) -> {70, 75, 85, 80};
get_condition(125) -> {70, 75, 85, 80};
get_condition(130) -> {70, 75, 85, 80};
get_condition(_) -> false.

get_daily_goals(Val1, Val2)
    when Val1 >= 40 andalso Val1 =< 64 andalso Val2 =:= 1 ->
    {lang:get("师徒组队挑战<color='#ffff00'>天空之塔</color>"),
     [#quest_progress{label = evt_tower_teacher, target = 0,
                      param = [], target_val = 4}],
     [{23286, 0, 1}, {90019, 0, 50}],
     [{23288, 0, 1}],
     3,
     30,
     lang:get("师徒同心"),
     lang:get("师徒同心成功完成每日目标获得以下奖励！\n师父每周最多可获得三次奖励，超过次数时转化为师道值"),
     lang:get("师徒同心"),
     lang:get("师徒同心成功完成每日目标获得以下奖励！")};
get_daily_goals(Val1, Val2)
    when Val1 >= 40 andalso Val1 =< 64 andalso Val2 =:= 0 ->
    {lang:get("师徒组队挑战<color='#ffff00'>世界boss</color>"),
     [#quest_progress{label = evt_boss_teacher, target = 0,
                      param = [], target_val = 1}],
     [{23286, 0, 1}, {90019, 0, 50}],
     [{23288, 0, 1}],
     3,
     30,
     lang:get("师徒同心"),
     lang:get("师徒同心成功完成每日目标获得以下奖励！\n师父每周最多可获得三次奖励，超过次数时转化为师道值"),
     lang:get("师徒同心"),
     lang:get("师徒同心成功完成每日目标获得以下奖励！")};
get_daily_goals(Val1, Val2)
    when Val1 >= 65 andalso Val1 =< 79 andalso Val2 =:= 1 ->
    {lang:get("师徒组队挑战<color='#ffff00'>悬赏任务</color>"),
     [#quest_progress{label = evt_quest_offer_teacher,
                      target = 0, param = [], target_val = 10}],
     [{23286, 0, 1}, {90019, 0, 80}],
     [{23288, 0, 1}],
     3,
     50,
     lang:get("师徒同心"),
     lang:get("师徒同心成功完成每日目标获得以下奖励！\n师父每周最多可获得三次奖励，超过次数时转化为师道值"),
     lang:get("师徒同心"),
     lang:get("师徒同心成功完成每日目标获得以下奖励！")};
get_daily_goals(Val1, Val2)
    when Val1 >= 65 andalso Val1 =< 79 andalso Val2 =:= 0 ->
    {lang:get("师徒组队挑战<color='#ffff00'>天空之塔</color>"),
     [#quest_progress{label = evt_tower_teacher, target = 0,
                      param = [], target_val = 4}],
     [{23286, 0, 1}, {90019, 0, 80}],
     [{23288, 0, 1}],
     3,
     50,
     lang:get("师徒同心"),
     lang:get("师徒同心成功完成每日目标获得以下奖励！\n师父每周最多可获得三次奖励，超过次数时转化为师道值"),
     lang:get("师徒同心"),
     lang:get("师徒同心成功完成每日目标获得以下奖励！")};
get_daily_goals(_, _) -> false.

get_drop_reward(8) ->
    {8, [{23286, 0, 1}], 10, [{23288, 0, 1}], 10};
get_drop_reward(5) ->
    {5, [{23286, 0, 1}], 100, [{23288, 0, 1}], 100};
get_drop_reward(11) ->
    {11, [{23286, 0, 1}], 10, [{23288, 0, 1}], 10};
get_drop_reward(13) ->
    {13, [{23286, 0, 1}], 10, [{23288, 0, 1}], 10};
get_drop_reward(16) ->
    {16, [{23286, 0, 1}], 20, [{23288, 0, 1}], 20};
get_drop_reward(63) ->
    {63, [{23286, 0, 1}], 30, [{23288, 0, 1}], 30};
get_drop_reward(54) ->
    {54, [{23286, 0, 1}], 10, [{23288, 0, 1}], 10};
get_drop_reward(_) -> false.

