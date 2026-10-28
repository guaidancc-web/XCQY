-file("src/data/goal_data.erl", 1).

-module(goal_data).

-export([list/0,
         get/1,
         get_discount/1,
         get_complete/1]).

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

-file("src/data/goal_data.erl", 17).

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

-file("src/data/goal_data.erl", 18).

list() ->
    [800070,
     800071,
     800072,
     800073,
     800074,
     800075,
     800076,
     800077,
     800078,
     800079,
     800080,
     800081,
     800082,
     800083,
     800084,
     800085,
     800086,
     800087,
     800088,
     800089,
     800090,
     800091,
     800092,
     800093,
     800094,
     800095,
     800096,
     800097,
     800098,
     800099,
     800100,
     800101,
     800102,
     800103,
     800104,
     800105,
     800106,
     800107,
     800108,
     800109,
     800110,
     800111,
     800112,
     800113,
     800114,
     800115,
     800116,
     800117,
     800118,
     800119,
     800120,
     800121,
     800122,
     800123,
     800124,
     800125,
     800126,
     800127,
     800128,
     800129,
     800130,
     800131,
     800132,
     800133,
     800134,
     800135,
     800136,
     800137,
     800138,
     800139,
     800140,
     800141,
     800142,
     800143,
     800144,
     800145,
     800146,
     800147,
     800148,
     800149,
     800150,
     800151,
     800152,
     800153,
     800154,
     800155,
     800156,
     800157,
     800158,
     800159,
     800160,
     800161,
     800162,
     800163,
     800164,
     800165,
     800166,
     800167,
     800168,
     800169,
     800170,
     800171,
     800172,
     800173,
     810000,
     810001,
     810002,
     810003,
     810004,
     810005,
     810006,
     820109,
     820125,
     820156].

get(800070) ->
    #quest_data{id = 800070,
                name =
                    lang:get("<color='#c7f9ff'>征服普通模式极寒试炼<color='#00ff00'>第"
                             "3关</color></color>"),
                day = 1, lev = 30, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_trial, target = 1,
                                     param = [], target_val = 3}],
                rewards_commit = [{90000, 20000}]};
get(800071) ->
    #quest_data{id = 800071,
                name =
                    lang:get("<color='#c7f9ff'>征服普通模式极寒试炼<color='#00ff00'>第"
                             "5关</color></color>"),
                day = 1, lev = 30, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_trial, target = 1,
                                     param = [], target_val = 5}],
                rewards_commit = [{90000, 20000}]};
get(800072) ->
    #quest_data{id = 800072,
                name =
                    lang:get("<color='#c7f9ff'>征服普通模式极寒试炼<color='#00ff00'>第"
                             "6关</color></color>"),
                day = 1, lev = 30, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_trial, target = 1,
                                     param = [], target_val = 6}],
                rewards_commit = [{90000, 30000}]};
get(800073) ->
    #quest_data{id = 800073,
                name =
                    lang:get("<color='#c7f9ff'>征服困难模式极寒试炼<color='#00ff00'>第"
                             "3关</color></color>"),
                day = 1, lev = 30, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_trial, target = 2,
                                     param = [], target_val = 3}],
                rewards_commit = [{90000, 30000}, {20800, 1}]};
get(800074) ->
    #quest_data{id = 800074,
                name =
                    lang:get("<color='#c7f9ff'>征服困难模式极寒试炼<color='#00ff00'>第"
                             "5关</color></color>"),
                day = 1, lev = 30, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_trial, target = 2,
                                     param = [], target_val = 5}],
                rewards_commit = [{90000, 30000}, {20803, 1}]};
get(800075) ->
    #quest_data{id = 800075,
                name =
                    lang:get("<color='#c7f9ff'>击败天空之塔BOSS<color='#00ff00'>利"
                             "贝尔二世</color></color>"),
                day = 1, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_kill_npc, target = 55499,
                                     param = [], target_val = 1}],
                rewards_commit = [{90000, 30000}, {20034, 1}]};
get(800076) ->
    #quest_data{id = 800076,
                name =
                    lang:get("<color='#c7f9ff'>装备镶嵌<color='#00ff00'>1</colo"
                             "r>颗<color='#00ff00'>1级</color>宝石</color>"),
                day = 1, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_blacksmith_embed_lev,
                                     target = 1, param = [], target_val = 1}],
                rewards_commit = [{90000, 20000}]};
get(800077) ->
    #quest_data{id = 800077,
                name =
                    lang:get("<color='#c7f9ff'>装备镶嵌<color='#00ff00'>3</colo"
                             "r>颗<color='#00ff00'>1级</color>宝石</color>"),
                day = 1, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_blacksmith_embed_lev,
                                     target = 1, param = [], target_val = 3}],
                rewards_commit = [{90000, 20000}]};
get(800078) ->
    #quest_data{id = 800078,
                name =
                    lang:get("<color='#c7f9ff'>全身装备镶嵌<color='#00ff00'>5</co"
                             "lor>颗<color='#00ff00'>1级</color>宝石</color>"),
                day = 1, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_blacksmith_embed_lev,
                                     target = 1, param = [], target_val = 5}],
                rewards_commit = [{90000, 20000}]};
get(800079) ->
    #quest_data{id = 800079,
                name =
                    lang:get("<color='#c7f9ff'>全身装备镶嵌<color='#00ff00'>8</co"
                             "lor>颗<color='#00ff00'>1级</color>宝石</color>"),
                day = 1, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_blacksmith_embed_lev,
                                     target = 1, param = [], target_val = 8}],
                rewards_commit = [{90000, 30000}, {20800, 1}]};
get(800080) ->
    #quest_data{id = 800080,
                name =
                    lang:get("<color='#c7f9ff'>全身装备镶嵌<color='#00ff00'>3</co"
                             "lor>颗<color='#00ff00'>2级</color>宝石</color>"),
                day = 1, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_blacksmith_embed_lev,
                                     target = 2, param = [], target_val = 3}],
                rewards_commit = [{90000, 20000}, {20800, 1}]};
get(800081) ->
    #quest_data{id = 800081,
                name =
                    lang:get("<color='#c7f9ff'>全身装备镶嵌<color='#00ff00'>5</co"
                             "lor>颗<color='#00ff00'>2级</color>宝石</color>"),
                day = 1, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_blacksmith_embed_lev,
                                     target = 2, param = [], target_val = 5}],
                rewards_commit = [{90000, 20000}, {20800, 1}]};
get(800082) ->
    #quest_data{id = 800082,
                name =
                    lang:get("<color='#c7f9ff'>全身装备镶嵌<color='#00ff00'>8</co"
                             "lor>颗<color='#00ff00'>2级</color>宝石</color>"),
                day = 1, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_blacksmith_embed_lev,
                                     target = 2, param = [], target_val = 8}],
                rewards_commit = [{90000, 30000}, {20800, 1}]};
get(800083) ->
    #quest_data{id = 800083,
                name =
                    lang:get("<color='#c7f9ff'>竞技场达到<color='#00ff00'>1050分<"
                             "/color></color>"),
                day = 2, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_arena_cup, target = 0,
                                     param = [], target_val = 1050}],
                rewards_commit = [{90000, 20000}, {90012, 5}]};
get(800084) ->
    #quest_data{id = 800084,
                name =
                    lang:get("<color='#c7f9ff'>竞技场达到<color='#00ff00'>1100分<"
                             "/color></color>"),
                day = 2, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_arena_cup, target = 0,
                                     param = [], target_val = 1100}],
                rewards_commit = [{90000, 20000}, {90012, 5}]};
get(800085) ->
    #quest_data{id = 800085,
                name =
                    lang:get("<color='#c7f9ff'>竞技场达到<color='#00ff00'>1200分<"
                             "/color></color>"),
                day = 2, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_arena_cup, target = 0,
                                     param = [], target_val = 1200}],
                rewards_commit = [{90000, 20000}, {90012, 5}]};
get(800086) ->
    #quest_data{id = 800086,
                name =
                    lang:get("<color='#c7f9ff'>竞技场达到<color='#00ff00'>1300分<"
                             "/color></color>"),
                day = 2, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_arena_cup, target = 0,
                                     param = [], target_val = 1300}],
                rewards_commit = [{90000, 20000}, {20025, 1}]};
get(800087) ->
    #quest_data{id = 800087,
                name =
                    lang:get("<color='#c7f9ff'>竞技场达到<color='#00ff00'>1400分<"
                             "/color></color>"),
                day = 2, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_arena_cup, target = 0,
                                     param = [], target_val = 1400}],
                rewards_commit = [{90000, 30000}, {20025, 1}]};
get(800088) ->
    #quest_data{id = 800088,
                name =
                    lang:get("<color='#c7f9ff'>竞技场达到<color='#00ff00'>1500分<"
                             "/color></color>"),
                day = 2, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_arena_cup, target = 0,
                                     param = [], target_val = 1500}],
                rewards_commit = [{90012, 10}, {20025, 1}]};
get(800089) ->
    #quest_data{id = 800089,
                name =
                    lang:get("<color='#c7f9ff'>3个冒险技能升至<color='#00ff00'>1级<"
                             "/color></color>"),
                day = 2, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_skill_prac_levup,
                                     target = 0, param = [{lev, 1}],
                                     target_val = 3}],
                rewards_commit = [{90000, 20000}, {90013, 30}]};
get(800090) ->
    #quest_data{id = 800090,
                name =
                    lang:get("<color='#c7f9ff'>6个冒险技能升至<color='#00ff00'>1级<"
                             "/color></color>"),
                day = 2, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_skill_prac_levup,
                                     target = 0, param = [{lev, 1}],
                                     target_val = 6}],
                rewards_commit = [{90000, 30000}, {90013, 30}]};
get(800091) ->
    #quest_data{id = 800091,
                name =
                    lang:get("<color='#c7f9ff'>6个冒险技能升至<color='#00ff00'>2级<"
                             "/color></color>"),
                day = 2, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_skill_prac_levup,
                                     target = 0, param = [{lev, 2}],
                                     target_val = 6}],
                rewards_commit = [{90000, 20000}, {90013, 50}]};
get(800092) ->
    #quest_data{id = 800092,
                name =
                    lang:get("<color='#c7f9ff'>6个冒险技能升至<color='#00ff00'>3级<"
                             "/color></color>"),
                day = 2, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_skill_prac_levup,
                                     target = 0, param = [{lev, 3}],
                                     target_val = 6}],
                rewards_commit = [{90000, 30000}, {90013, 70}]};
get(800093) ->
    #quest_data{id = 800093,
                name =
                    lang:get("<color='#c7f9ff'>6个冒险技能达到<color='#00ff00'>4级<"
                             "/color></color>"),
                day = 2, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_skill_prac_levup,
                                     target = 0, param = [{lev, 4}],
                                     target_val = 6}],
                rewards_commit = [{90000, 30000}, {90013, 100}]};
get(800094) ->
    #quest_data{id = 800094,
                name =
                    lang:get("<color='#c7f9ff'>6个冒险技能达到<color='#00ff00'>5级<"
                             "/color></color>"),
                day = 2, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_skill_prac_levup,
                                     target = 0, param = [{lev, 5}],
                                     target_val = 6}],
                rewards_commit = [{90000, 30000}, {20025, 1}]};
get(800095) ->
    #quest_data{id = 800095,
                name =
                    lang:get("<color='#c7f9ff'>1个冒险技能达到<color='#00ff00'>7级<"
                             "/color></color>"),
                day = 2, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_skill_prac_levup,
                                     target = 0, param = [{lev, 7}],
                                     target_val = 1}],
                rewards_commit = [{90000, 30000}, {20025, 1}]};
get(800096) ->
    #quest_data{id = 800096,
                name =
                    lang:get("<color='#c7f9ff'>完成<color='#00ff00'>1轮</color"
                             ">公会任务</color>"),
                day = 3, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_quest_guild_round,
                                     target = 0, param = [], target_val = 1}],
                rewards_commit = [{90000, 20000}, {90011, 20}]};
get(800097) ->
    #quest_data{id = 800097,
                name =
                    lang:get("<color='#c7f9ff'>完成<color='#00ff00'>2轮</color"
                             ">公会任务</color>"),
                day = 3, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_quest_guild_round,
                                     target = 0, param = [], target_val = 2}],
                rewards_commit = [{90000, 20000}, {90011, 20}]};
get(800098) ->
    #quest_data{id = 800098,
                name =
                    lang:get("<color='#c7f9ff'>完成<color='#00ff00'>3轮</color"
                             ">公会任务</color>"),
                day = 3, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_quest_guild_round,
                                     target = 0, param = [], target_val = 3}],
                rewards_commit = [{20019, 3}, {90011, 30}]};
get(800099) ->
    #quest_data{id = 800099,
                name =
                    lang:get("<color='#c7f9ff'>完成<color='#00ff00'>5轮</color"
                             ">公会任务</color>"),
                day = 3, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_quest_guild_round,
                                     target = 0, param = [], target_val = 5}],
                rewards_commit = [{90000, 30000}, {90011, 50}]};
get(800100) ->
    #quest_data{id = 800100,
                name =
                    lang:get("<color='#c7f9ff'>完成<color='#00ff00'>8轮</color"
                             ">公会任务</color>"),
                day = 3, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_quest_guild_round,
                                     target = 0, param = [], target_val = 8}],
                rewards_commit = [{90000, 50000}, {90011, 50}]};
get(800101) ->
    #quest_data{id = 800101,
                name =
                    lang:get("<color='#c7f9ff'>成功挑战<color='#00ff00'>50级世界BO"
                             "SS</color></color>"),
                day = 3, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_kill_npc, target = 71002,
                                     param = [], target_val = 1}],
                rewards_commit = [{90000, 30000}, {90011, 70}]};
get(800102) ->
    #quest_data{id = 800102,
                name =
                    lang:get("<color='#c7f9ff'>任意生活技能提升至<color='#00ff00'>31"
                             "级</color></color>"),
                day = 3, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_skill_life_levup,
                                     target = 0, param = [], target_val = 31}],
                rewards_commit = [{90000, 20000}, {90011, 10}]};
get(800103) ->
    #quest_data{id = 800103,
                name =
                    lang:get("<color='#c7f9ff'>任意生活技能提升至<color='#00ff00'>40"
                             "级</color></color>"),
                day = 3, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_skill_life_levup,
                                     target = 0, param = [], target_val = 40}],
                rewards_commit = [{90000, 30000}, {90011, 20}]};
get(800104) ->
    #quest_data{id = 800104,
                name =
                    lang:get("<color='#c7f9ff'>任意生活技能提升至<color='#00ff00'>50"
                             "级</color></color>"),
                day = 3, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_skill_life_levup,
                                     target = 0, param = [], target_val = 50}],
                rewards_commit = [{90000, 30000}, {90011, 30}]};
get(800105) ->
    #quest_data{id = 800105,
                name =
                    lang:get("<color='#c7f9ff'>任意生活技能提升至<color='#00ff00'>60"
                             "级</color></color>"),
                day = 3, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_skill_life_levup,
                                     target = 0, param = [], target_val = 60}],
                rewards_commit = [{90000, 50000}, {90011, 50}]};
get(800106) ->
    #quest_data{id = 800106,
                name =
                    lang:get("<color='#c7f9ff'><color='#00ff00'>“强壮精通”</col"
                             "or>提升至<color='#00ff00'>10级</color></color>"),
                day = 3, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_skill_life_levup,
                                     target = 10008, param = [],
                                     target_val = 10}],
                rewards_commit = [{90000, 20000}, {90011, 10}]};
get(800107) ->
    #quest_data{id = 800107,
                name =
                    lang:get("<color='#c7f9ff'><color='#00ff00'>“强壮精通”</col"
                             "or>提升至<color='#00ff00'>20级</color></color>"),
                day = 3, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_skill_life_levup,
                                     target = 10008, param = [],
                                     target_val = 20}],
                rewards_commit = [{90000, 30000}, {90011, 20}]};
get(800108) ->
    #quest_data{id = 800108,
                name =
                    lang:get("<color='#c7f9ff'><color='#00ff00'>“强壮精通”</col"
                             "or>提升至<color='#00ff00'>30级</color></color>"),
                day = 3, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_skill_life_levup,
                                     target = 10008, param = [],
                                     target_val = 30}],
                rewards_commit = [{90000, 30000}, {90011, 30}]};
get(800109) ->
    #quest_data{id = 800109,
                name =
                    lang:get("<color='#c7f9ff'><color='#00ff00'>“强壮精通”</col"
                             "or>提升至<color='#00ff00'>40级</color></color>"),
                day = 3, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_skill_life_levup,
                                     target = 10008, param = [],
                                     target_val = 40}],
                rewards_commit = [{90000, 50000}, {90011, 50}]};
get(820109) ->
    #quest_data{id = 820109,
                name =
                    lang:get("<color='#c7f9ff'><color='#00ff00'>“强壮精通”</col"
                             "or>提升至<color='#00ff00'>50级</color></color>"),
                day = 3, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_skill_life_levup,
                                     target = 10008, param = [],
                                     target_val = 50}],
                rewards_commit = [{90000, 50000}, {90011, 50}]};
get(800110) ->
    #quest_data{id = 800110,
                name =
                    lang:get("<color='#c7f9ff'>通过<color='#00ff00'>爵位挑战</col"
                             "or>第2关</color>"),
                day = 4, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_glory, target = 0,
                                     param = [], target_val = 2}],
                rewards_commit = [{90000, 20000}]};
get(800111) ->
    #quest_data{id = 800111,
                name =
                    lang:get("<color='#c7f9ff'>通过<color='#00ff00'>爵位挑战</col"
                             "or>第4关</color>"),
                day = 4, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_glory, target = 0,
                                     param = [], target_val = 4}],
                rewards_commit = [{90000, 20000}]};
get(800112) ->
    #quest_data{id = 800112,
                name =
                    lang:get("<color='#c7f9ff'>通过<color='#00ff00'>爵位挑战</col"
                             "or>第5关</color>"),
                day = 4, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_glory, target = 0,
                                     param = [], target_val = 5}],
                rewards_commit = [{90000, 20000}]};
get(800113) ->
    #quest_data{id = 800113,
                name =
                    lang:get("<color='#c7f9ff'>通过<color='#00ff00'>爵位挑战</col"
                             "or>第6关</color>"),
                day = 4, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_glory, target = 0,
                                     param = [], target_val = 6}],
                rewards_commit = [{90000, 20000}]};
get(800114) ->
    #quest_data{id = 800114,
                name =
                    lang:get("<color='#c7f9ff'>通过<color='#00ff00'>爵位挑战</col"
                             "or>第8关</color>"),
                day = 4, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_glory, target = 0,
                                     param = [], target_val = 8}],
                rewards_commit = [{90000, 20000}]};
get(800115) ->
    #quest_data{id = 800115,
                name =
                    lang:get("<color='#c7f9ff'>通过<color='#00ff00'>爵位挑战</col"
                             "or>第10关</color>"),
                day = 4, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_glory, target = 0,
                                     param = [], target_val = 10}],
                rewards_commit = [{90000, 50000}, {20020, 1}]};
get(800116) ->
    #quest_data{id = 800116,
                name =
                    lang:get("<color='#c7f9ff'>通过<color='#00ff00'>爵位挑战</col"
                             "or>第11关</color>"),
                day = 4, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_glory, target = 0,
                                     param = [], target_val = 11}],
                rewards_commit = [{90000, 50000}, {20020, 1}]};
get(800117) ->
    #quest_data{id = 800117,
                name =
                    lang:get("<color='#c7f9ff'>通过<color='#00ff00'>爵位挑战</col"
                             "or>第13关</color>"),
                day = 4, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_glory, target = 0,
                                     param = [], target_val = 13}],
                rewards_commit = [{90000, 50000}, {20020, 2}]};
get(800118) ->
    #quest_data{id = 800118,
                name =
                    lang:get("<color='#c7f9ff'>单件装备<color='#00ff00'>强化+3</c"
                             "olor></color>"),
                day = 4, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_enchant, target = 3,
                                     param = [], target_val = 1}],
                rewards_commit = [{90000, 20000}]};
get(800119) ->
    #quest_data{id = 800119,
                name =
                    lang:get("<color='#c7f9ff'>单件装备<color='#00ff00'>强化+4</c"
                             "olor></color>"),
                day = 4, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_enchant, target = 4,
                                     param = [], target_val = 1}],
                rewards_commit = [{90000, 20000}]};
get(800120) ->
    #quest_data{id = 800120,
                name =
                    lang:get("<color='#c7f9ff'>单件装备<color='#00ff00'>强化+5</c"
                             "olor></color>"),
                day = 4, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_enchant, target = 5,
                                     param = [], target_val = 1}],
                rewards_commit = [{90000, 20000}, {20020, 1}]};
get(800121) ->
    #quest_data{id = 800121,
                name =
                    lang:get("<color='#c7f9ff'>全身装备<color='#00ff00'>强化+3</c"
                             "olor></color>"),
                day = 4, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_enchant, target = 3,
                                     param = [], target_val = 8}],
                rewards_commit = [{90000, 20000}, {20020, 1}]};
get(800122) ->
    #quest_data{id = 800122,
                name =
                    lang:get("<color='#c7f9ff'>全身装备<color='#00ff00'>强化+4</c"
                             "olor></color>"),
                day = 4, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_enchant, target = 4,
                                     param = [], target_val = 8}],
                rewards_commit = [{90000, 30000}, {20020, 1}]};
get(800123) ->
    #quest_data{id = 800123,
                name =
                    lang:get("<color='#c7f9ff'>全身装备<color='#00ff00'>强化+5</c"
                             "olor></color>"),
                day = 4, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_enchant, target = 5,
                                     param = [], target_val = 8}],
                rewards_commit = [{20021, 1}, {20020, 1}]};
get(800124) ->
    #quest_data{id = 800124,
                name =
                    lang:get("<color='#c7f9ff'>单件装备<color='#00ff00'>强化+8</c"
                             "olor></color>"),
                day = 4, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_enchant, target = 8,
                                     param = [], target_val = 1}],
                rewards_commit = [{20021, 1}, {20020, 2}]};
get(800125) ->
    #quest_data{id = 800125,
                name =
                    lang:get("<color='#c7f9ff'>全身装备<color='#00ff00'>强化+7</c"
                             "olor></color>"),
                day = 4, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_enchant, target = 7,
                                     param = [], target_val = 8}],
                rewards_commit = [{20022, 1}, {20020, 2}]};
get(820125) ->
    #quest_data{id = 820125,
                name =
                    lang:get("<color='#c7f9ff'>单件装备<color='#00ff00'>强化+9</c"
                             "olor></color>"),
                day = 4, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_enchant, target = 9,
                                     param = [], target_val = 1}],
                rewards_commit = [{20021, 1}, {20020, 1}]};
get(800126) ->
    #quest_data{id = 800126,
                name =
                    lang:get("<color='#c7f9ff'>装填满<color='#00ff00'>1次</colo"
                             "r>所有远航商人箱子</color>"),
                day = 5, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_shipping_sail, target = 0,
                                     param = [], target_val = 1}],
                rewards_commit = [{90013, 50}]};
get(800127) ->
    #quest_data{id = 800127,
                name =
                    lang:get("<color='#c7f9ff'>装填满<color='#00ff00'>3次</colo"
                             "r>所有远航商人箱子</color>"),
                day = 5, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_shipping_sail, target = 0,
                                     param = [], target_val = 3}],
                rewards_commit = [{90013, 50}]};
get(800128) ->
    #quest_data{id = 800128,
                name =
                    lang:get("<color='#c7f9ff'>装填满<color='#00ff00'>5次</colo"
                             "r>所有远航商人箱子</color>"),
                day = 5, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_shipping_sail, target = 0,
                                     param = [], target_val = 5}],
                rewards_commit = [{90013, 50}, {90000, 30000}]};
get(800129) ->
    #quest_data{id = 800129,
                name =
                    lang:get("<color='#c7f9ff'>装填满<color='#00ff00'>6次</colo"
                             "r>所有远航商人箱子</color>"),
                day = 5, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_shipping_sail, target = 0,
                                     param = [], target_val = 6}],
                rewards_commit = [{90013, 50}, {90000, 30000}]};
get(800130) ->
    #quest_data{id = 800130,
                name =
                    lang:get("<color='#c7f9ff'>装填满<color='#00ff00'>8次</colo"
                             "r>所有远航商人箱子</color>"),
                day = 5, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_shipping_sail, target = 0,
                                     param = [], target_val = 8}],
                rewards_commit = [{90013, 80}, {90000, 30000}]};
get(800131) ->
    #quest_data{id = 800131,
                name =
                    lang:get("<color='#c7f9ff'>装填满<color='#00ff00'>10次</col"
                             "or>所有远航商人箱子</color>"),
                day = 5, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_shipping_sail, target = 0,
                                     param = [], target_val = 10}],
                rewards_commit = [{90013, 100}, {90000, 30000}]};
get(800132) ->
    #quest_data{id = 800132,
                name =
                    lang:get("<color='#c7f9ff'>装填满<color='#00ff00'>12次</col"
                             "or>所有远航商人箱子</color>"),
                day = 5, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_shipping_sail, target = 0,
                                     param = [], target_val = 12}],
                rewards_commit = [{22216, 1}, {90000, 30000}]};
get(800133) ->
    #quest_data{id = 800133,
                name =
                    lang:get("<color='#c7f9ff'>帮助公会成员或好友装填<color='#00ff00'>"
                             "1次</color>远航箱子</color>"),
                day = 5, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_shipping_help, target = 0,
                                     param = [], target_val = 1}],
                rewards_commit = [{90013, 50}]};
get(800134) ->
    #quest_data{id = 800134,
                name =
                    lang:get("<color='#c7f9ff'>帮助公会成员或好友装填<color='#00ff00'>"
                             "5次</color>远航箱子</color>"),
                day = 5, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_shipping_help, target = 0,
                                     param = [], target_val = 5}],
                rewards_commit = [{90013, 100}]};
get(800135) ->
    #quest_data{id = 800135,
                name =
                    lang:get("<color='#c7f9ff'>1个冒险技能升至<color='#00ff00'>8级<"
                             "/color></color>"),
                day = 5, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_skill_prac_levup,
                                     target = 0, param = [{lev, 8}],
                                     target_val = 1}],
                rewards_commit = [{90013, 100}, {90000, 30000}]};
get(800136) ->
    #quest_data{id = 800136,
                name =
                    lang:get("<color='#c7f9ff'>6个冒险技能升至<color='#00ff00'>5级<"
                             "/color></color>"),
                day = 5, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_skill_prac_levup,
                                     target = 0, param = [{lev, 5}],
                                     target_val = 6}],
                rewards_commit = [{90013, 100}, {90000, 30000}]};
get(800137) ->
    #quest_data{id = 800137,
                name =
                    lang:get("<color='#c7f9ff'>6个冒险技能升至<color='#00ff00'>6级<"
                             "/color></color>"),
                day = 5, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_skill_prac_levup,
                                     target = 0, param = [{lev, 6}],
                                     target_val = 6}],
                rewards_commit = [{90013, 150}, {90000, 50000}]};
get(800138) ->
    #quest_data{id = 800138,
                name =
                    lang:get("<color='#c7f9ff'>1个冒险技能升至<color='#00ff00'>9级<"
                             "/color></color>"),
                day = 5, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_skill_prac_levup,
                                     target = 0, param = [{lev, 9}],
                                     target_val = 1}],
                rewards_commit = [{90013, 150}, {90000, 30000}]};
get(800139) ->
    #quest_data{id = 800139,
                name =
                    lang:get("<color='#c7f9ff'>3个冒险技能达到<color='#00ff00'>7级<"
                             "/color></color>"),
                day = 5, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_skill_prac_levup,
                                     target = 0, param = [{lev, 7}],
                                     target_val = 3}],
                rewards_commit = [{20025, 1}, {90000, 30000}]};
get(800140) ->
    #quest_data{id = 800140,
                name =
                    lang:get("<color='#c7f9ff'>6个冒险技能达到<color='#00ff00'>7级<"
                             "/color></color>"),
                day = 5, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_skill_prac_levup,
                                     target = 0, param = [{lev, 7}],
                                     target_val = 6}],
                rewards_commit = [{20025, 1}, {90000, 30000}]};
get(800141) ->
    #quest_data{id = 800141,
                name =
                    lang:get("<color='#c7f9ff'>3个冒险技能达到<color='#00ff00'>8级<"
                             "/color></color>"),
                day = 5, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_skill_prac_levup,
                                     target = 0, param = [{lev, 8}],
                                     target_val = 3}],
                rewards_commit = [{20025, 1}, {90000, 30000}]};
get(800142) ->
    #quest_data{id = 800142,
                name =
                    lang:get("<color='#c7f9ff'>6个冒险技能达到<color='#00ff00'>8级<"
                             "/color></color>"),
                day = 5, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_skill_prac_levup,
                                     target = 0, param = [{lev, 8}],
                                     target_val = 6}],
                rewards_commit = [{20025, 1}, {90000, 30000}]};
get(800143) ->
    #quest_data{id = 800143,
                name =
                    lang:get("<color='#c7f9ff'>1个冒险技能升至<color='#00ff00'>10级"
                             "</color></color>"),
                day = 5, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_skill_prac_levup,
                                     target = 0, param = [{lev, 10}],
                                     target_val = 1}],
                rewards_commit = [{22216, 1}, {90000, 50000}]};
get(800144) ->
    #quest_data{id = 800144,
                name =
                    lang:get("<color='#c7f9ff'>成功通过十二星座<color='#00ff00'>1星挑"
                             "战</color></color>"),
                day = 6, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_constellation, target = 0,
                                     param = [], target_val = 1}],
                rewards_commit = [{90003, 1000}, {90000, 30000}]};
get(800145) ->
    #quest_data{id = 800145,
                name =
                    lang:get("<color='#c7f9ff'>成功通过十二星座<color='#00ff00'>3星挑"
                             "战</color></color>"),
                day = 6, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_constellation, target = 0,
                                     param = [], target_val = 3}],
                rewards_commit = [{90003, 1000}, {90000, 30000}]};
get(800146) ->
    #quest_data{id = 800146,
                name =
                    lang:get("<color='#c7f9ff'>成功通过十二星座<color='#00ff00'>5星挑"
                             "战</color></color>"),
                day = 6, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_constellation, target = 0,
                                     param = [], target_val = 5}],
                rewards_commit = [{90003, 1000}, {90000, 30000}]};
get(800147) ->
    #quest_data{id = 800147,
                name =
                    lang:get("<color='#c7f9ff'>成功通过十二星座<color='#00ff00'>6星挑"
                             "战</color></color>"),
                day = 6, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_constellation, target = 0,
                                     param = [], target_val = 6}],
                rewards_commit = [{90003, 2000}, {90000, 30000}]};
get(800148) ->
    #quest_data{id = 800148,
                name =
                    lang:get("<color='#c7f9ff'>成功通过十二星座<color='#00ff00'>7星挑"
                             "战</color></color>"),
                day = 6, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_constellation, target = 0,
                                     param = [], target_val = 7}],
                rewards_commit = [{21100, 1}, {90000, 50000}]};
get(800149) ->
    #quest_data{id = 800149,
                name =
                    lang:get("<color='#c7f9ff'>成功通过十二星座<color='#00ff00'>8星挑"
                             "战</color></color>"),
                day = 6, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_constellation, target = 0,
                                     param = [], target_val = 8}],
                rewards_commit = [{21101, 1}, {90000, 50000}]};
get(800150) ->
    #quest_data{id = 800150,
                name =
                    lang:get("<color='#c7f9ff'>拥有<color='#00ff00'>1阶</color"
                             ">翅膀</color>"),
                day = 6, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_wing_lev, target = 1,
                                     param = [{star_lev, 1}], target_val = 1}],
                rewards_commit = [{90000, 10000}]};
get(800151) ->
    #quest_data{id = 800151,
                name =
                    lang:get("<color='#c7f9ff'>拥有<color='#00ff00'>2阶</color"
                             ">翅膀</color>"),
                day = 6, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_wing_lev, target = 2,
                                     param = [{star_lev, 1}], target_val = 1}],
                rewards_commit = [{90000, 20000}]};
get(800152) ->
    #quest_data{id = 800152,
                name =
                    lang:get("<color='#c7f9ff'>拥有<color='#00ff00'>3阶</color"
                             ">翅膀</color>"),
                day = 6, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_wing_lev, target = 3,
                                     param = [{star_lev, 1}], target_val = 1}],
                rewards_commit = [{90000, 20000}]};
get(800153) ->
    #quest_data{id = 800153,
                name =
                    lang:get("<color='#c7f9ff'>拥有<color='#00ff00'>3阶6级</col"
                             "or>翅膀</color>"),
                day = 6, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_wing_lev, target = 3,
                                     param = [{star_lev, 6}], target_val = 1}],
                rewards_commit = [{90000, 30000}]};
get(800154) ->
    #quest_data{id = 800154,
                name =
                    lang:get("<color='#c7f9ff'>拥有<color='#00ff00'>4阶</color"
                             ">翅膀</color>"),
                day = 6, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_wing_lev, target = 4,
                                     param = [{star_lev, 1}], target_val = 1}],
                rewards_commit = [{21100, 1}, {90000, 30000}]};
get(800155) ->
    #quest_data{id = 800155,
                name =
                    lang:get("<color='#c7f9ff'>拥有<color='#00ff00'>4阶6级</col"
                             "or>翅膀</color>"),
                day = 6, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_wing_lev, target = 4,
                                     param = [{star_lev, 6}], target_val = 1}],
                rewards_commit = [{90000, 30000}]};
get(800156) ->
    #quest_data{id = 800156,
                name =
                    lang:get("<color='#c7f9ff'>拥有<color='#00ff00'>5阶</color"
                             ">翅膀</color>"),
                day = 6, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_wing_lev, target = 5,
                                     param = [{star_lev, 1}], target_val = 1}],
                rewards_commit = [{20002, 1}, {90000, 30000}]};
get(820156) ->
    #quest_data{id = 820156,
                name =
                    lang:get("<color='#c7f9ff'>拥有<color='#00ff00'>6阶</color"
                             ">翅膀</color>"),
                day = 6, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_wing_lev, target = 6,
                                     param = [{star_lev, 1}], target_val = 1}],
                rewards_commit = [{20076, 1}, {90000, 30000}]};
get(800157) ->
    #quest_data{id = 800157,
                name =
                    lang:get("<color='#c7f9ff'>竞技场达到<color='#00ff00'>1600分<"
                             "/color></color>"),
                day = 7, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_arena_cup, target = 0,
                                     param = [], target_val = 1600}],
                rewards_commit = [{90012, 8}, {90000, 30000}]};
get(800158) ->
    #quest_data{id = 800158,
                name =
                    lang:get("<color='#c7f9ff'>竞技场达到<color='#00ff00'>1700分<"
                             "/color></color>"),
                day = 7, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_arena_cup, target = 0,
                                     param = [], target_val = 1700}],
                rewards_commit = [{90012, 10}, {90000, 30000}]};
get(800159) ->
    #quest_data{id = 800159,
                name =
                    lang:get("<color='#c7f9ff'>竞技场达到<color='#00ff00'>1800分<"
                             "/color></color>"),
                day = 7, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_arena_cup, target = 0,
                                     param = [], target_val = 1800}],
                rewards_commit = [{90012, 20}]};
get(800160) ->
    #quest_data{id = 800160,
                name =
                    lang:get("<color='#c7f9ff'>竞技场达到<color='#00ff00'>1850分<"
                             "/color></color>"),
                day = 7, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_arena_cup, target = 0,
                                     param = [], target_val = 1850}],
                rewards_commit = [{90012, 20}]};
get(800161) ->
    #quest_data{id = 800161,
                name =
                    lang:get("<color='#c7f9ff'>竞技场达到<color='#00ff00'>1900分<"
                             "/color></color>"),
                day = 7, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_arena_cup, target = 0,
                                     param = [], target_val = 1900}],
                rewards_commit = [{90012, 20}]};
get(800162) ->
    #quest_data{id = 800162,
                name =
                    lang:get("<color='#c7f9ff'>竞技场达到<color='#00ff00'>1950分<"
                             "/color></color>"),
                day = 7, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_arena_cup, target = 0,
                                     param = [], target_val = 1950}],
                rewards_commit = [{20034, 1}]};
get(800163) ->
    #quest_data{id = 800163,
                name =
                    lang:get("<color='#c7f9ff'>竞技场达到<color='#00ff00'>2000分<"
                             "/color></color>"),
                day = 7, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_arena_cup, target = 0,
                                     param = [], target_val = 2000}],
                rewards_commit = [{20034, 1}]};
get(800164) ->
    #quest_data{id = 800164,
                name =
                    lang:get("<color='#c7f9ff'>竞技场达到<color='#00ff00'>2100分<"
                             "/color></color>"),
                day = 7, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_arena_cup, target = 0,
                                     param = [], target_val = 2100}],
                rewards_commit = [{20034, 1}, {90000, 50000}]};
get(800165) ->
    #quest_data{id = 800165,
                name =
                    lang:get("<color='#c7f9ff'>装备镶嵌<color='#00ff00'>1</colo"
                             "r>颗<color='#00ff00'>5级</color>宝石</color>"),
                day = 7, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_blacksmith_embed_lev,
                                     target = 5, param = [], target_val = 1}],
                rewards_commit = [{90000, 20000}]};
get(800166) ->
    #quest_data{id = 800166,
                name =
                    lang:get("<color='#c7f9ff'>装备镶嵌<color='#00ff00'>1</colo"
                             "r>颗<color='#00ff00'>6级</color>宝石</color>"),
                day = 7, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_blacksmith_embed_lev,
                                     target = 6, param = [], target_val = 1}],
                rewards_commit = [{90000, 20000}]};
get(800167) ->
    #quest_data{id = 800167,
                name =
                    lang:get("<color='#c7f9ff'>装备镶嵌<color='#00ff00'>1</colo"
                             "r>颗<color='#00ff00'>7级</color>宝石</color>"),
                day = 7, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_blacksmith_embed_lev,
                                     target = 7, param = [], target_val = 1}],
                rewards_commit = [{90000, 20000}]};
get(800168) ->
    #quest_data{id = 800168,
                name =
                    lang:get("<color='#c7f9ff'>全身装备镶嵌<color='#00ff00'>8</co"
                             "lor>颗<color='#00ff00'>4级</color>宝石</color>"),
                day = 7, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_blacksmith_embed_lev,
                                     target = 4, param = [], target_val = 8}],
                rewards_commit = [{20034, 1}, {90000, 20000}]};
get(800169) ->
    #quest_data{id = 800169,
                name =
                    lang:get("<color='#c7f9ff'>全身装备镶嵌<color='#00ff00'>5</co"
                             "lor>颗<color='#00ff00'>5级</color>宝石</color>"),
                day = 7, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_blacksmith_embed_lev,
                                     target = 5, param = [], target_val = 5}],
                rewards_commit = [{20034, 1}, {90000, 20000}]};
get(800170) ->
    #quest_data{id = 800170,
                name =
                    lang:get("<color='#c7f9ff'>全身装备镶嵌<color='#00ff00'>8</co"
                             "lor>颗<color='#00ff00'>5级</color>宝石</color>"),
                day = 7, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_blacksmith_embed_lev,
                                     target = 5, param = [], target_val = 8}],
                rewards_commit = [{20034, 1}, {90000, 30000}]};
get(800171) ->
    #quest_data{id = 800171,
                name =
                    lang:get("<color='#c7f9ff'>全身装备镶嵌<color='#00ff00'>16</c"
                             "olor>颗<color='#00ff00'>4级</color>宝石</color>"),
                day = 7, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_blacksmith_embed_lev,
                                     target = 4, param = [], target_val = 16}],
                rewards_commit = [{20034, 2}, {90000, 30000}]};
get(800172) ->
    #quest_data{id = 800172,
                name =
                    lang:get("<color='#c7f9ff'>全身装备镶嵌<color='#00ff00'>16</c"
                             "olor>颗<color='#00ff00'>5级</color>宝石</color>"),
                day = 7, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_blacksmith_embed_lev,
                                     target = 5, param = [], target_val = 16}],
                rewards_commit = [{20034, 2}, {90000, 30000}]};
get(800173) ->
    #quest_data{id = 800173,
                name =
                    lang:get("<color='#c7f9ff'>全身装备镶嵌<color='#00ff00'>16</c"
                             "olor>颗<color='#00ff00'>6级</color>宝石</color>"),
                day = 7, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_blacksmith_embed_lev,
                                     target = 6, param = [], target_val = 16}],
                rewards_commit = [{22585, 1}, {90000, 30000}]};
get(810000) ->
    #quest_data{id = 810000,
                name =
                    lang:get("<color='#c7f9ff'>角色等级达到<color='#00ff00'>40</c"
                             "olor>级</color>"),
                day = 1, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_levup, target = 0,
                                     param = [], target_val = 40}],
                rewards_commit = [{21722, 1}]};
get(810001) ->
    #quest_data{id = 810001,
                name =
                    lang:get("<color='#c7f9ff'>角色等级达到<color='#00ff00'>43</c"
                             "olor>级</color>"),
                day = 2, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_levup, target = 0,
                                     param = [], target_val = 43}],
                rewards_commit = [{90003, 2000}]};
get(810002) ->
    #quest_data{id = 810002,
                name =
                    lang:get("<color='#c7f9ff'>角色等级达到<color='#00ff00'>48</c"
                             "olor>级</color>"),
                day = 3, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_levup, target = 0,
                                     param = [], target_val = 48}],
                rewards_commit = [{90011, 100}]};
get(810003) ->
    #quest_data{id = 810003,
                name =
                    lang:get("<color='#c7f9ff'>角色等级达到<color='#00ff00'>51</c"
                             "olor>级</color>"),
                day = 4, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_levup, target = 0,
                                     param = [], target_val = 51}],
                rewards_commit = [{20021, 1}]};
get(810004) ->
    #quest_data{id = 810004,
                name =
                    lang:get("<color='#c7f9ff'>角色等级达到<color='#00ff00'>53</c"
                             "olor>级</color>"),
                day = 5, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_levup, target = 0,
                                     param = [], target_val = 53}],
                rewards_commit = [{20025, 1}]};
get(810005) ->
    #quest_data{id = 810005,
                name =
                    lang:get("<color='#c7f9ff'>角色等级达到<color='#00ff00'>55</c"
                             "olor>级</color>"),
                day = 6, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_levup, target = 0,
                                     param = [], target_val = 55}],
                rewards_commit = [{20002, 1}]};
get(810006) ->
    #quest_data{id = 810006,
                name =
                    lang:get("<color='#c7f9ff'>角色等级达到<color='#00ff00'>58</c"
                             "olor>级</color>"),
                day = 7, lev = 40, pre_quest = 0,
                progress =
                    [#quest_progress{label = evt_levup, target = 0,
                                     param = [], target_val = 58}],
                rewards_commit = [{20034, 1}]};
get(_) -> false.

get_discount(1) ->
    #{id => 1, day => 1, assets_type => 90002, price => 520,
      item_reward => [{20034, 20}, {20002, 5}, {20005, 10}],
      lev => 60, total_count => 300, day_charge => 0};
get_discount(2) ->
    #{id => 2, day => 2, assets_type => 90002, price => 399,
      item_reward => [{22216, 2}, {20025, 10}], lev => 65,
      total_count => 280, day_charge => 0};
get_discount(3) ->
    #{id => 3, day => 3, assets_type => 90002, price => 480,
      item_reward => [{20616, 1}, {20075, 2}, {20019, 5}],
      lev => 70, total_count => 260, day_charge => 0};
get_discount(4) ->
    #{id => 4, day => 4, assets_type => 90002, price => 480,
      item_reward => [{20009, 1}, {20021, 15}, {20020, 20}],
      lev => 75, total_count => 220, day_charge => 0};
get_discount(5) ->
    #{id => 5, day => 5, assets_type => 90002, price => 799,
      item_reward => [{22216, 5}, {90003, 30000}], lev => 80,
      total_count => 200, day_charge => 0};
get_discount(6) ->
    #{id => 6, day => 6, assets_type => 90002, price => 700,
      item_reward => [{21100, 10}, {90000, 2000000}],
      lev => 85, total_count => 180, day_charge => 0};
get_discount(7) ->
    #{id => 7, day => 7, assets_type => 90002, price => 720,
      item_reward => [{22219, 10}, {22585, 3}], lev => 90,
      total_count => 160, day_charge => 0};
get_discount(8) ->
    #{id => 8, day => 1, assets_type => 90002, price => 0,
      item_reward => [{90026, 100}, {20000, 1}, {20002, 1}],
      total_count => 999999999, day_charge => 1};
get_discount(9) ->
    #{id => 9, day => 2, assets_type => 90002, price => 0,
      item_reward => [{22216, 1}, {20006, 20}],
      total_count => 999999999, day_charge => 1};
get_discount(10) ->
    #{id => 10, day => 3, assets_type => 90002, price => 0,
      item_reward => [{90026, 120}, {20052, 5}],
      total_count => 999999999, day_charge => 1};
get_discount(11) ->
    #{id => 11, day => 4, assets_type => 90002, price => 0,
      item_reward => [{29048, 1}, {22249, 1}],
      total_count => 999999999, day_charge => 1};
get_discount(12) ->
    #{id => 12, day => 5, assets_type => 90002, price => 0,
      item_reward => [{90026, 150}, {22249, 1}],
      total_count => 999999999, day_charge => 1};
get_discount(13) ->
    #{id => 13, day => 6, assets_type => 90002, price => 0,
      item_reward => [{20087, 3}, {20002, 2}],
      total_count => 999999999, day_charge => 1};
get_discount(14) ->
    #{id => 14, day => 7, assets_type => 90002, price => 0,
      item_reward => [{90026, 150}, {22248, 1}],
      total_count => 999999999, day_charge => 1};
get_discount(15) ->
    #{id => 15, day => 1, assets_type => 90002,
      price => 520,
      item_reward => [{20034, 20}, {20002, 5}, {20005, 10}],
      total_count => 999999999, day_charge => 0};
get_discount(16) ->
    #{id => 16, day => 2, assets_type => 90002,
      price => 399, item_reward => [{22216, 2}, {20025, 10}],
      total_count => 999999999, day_charge => 0};
get_discount(17) ->
    #{id => 17, day => 3, assets_type => 90002,
      price => 480,
      item_reward => [{20616, 1}, {20075, 2}, {20019, 5}],
      total_count => 999999999, day_charge => 0};
get_discount(18) ->
    #{id => 18, day => 4, assets_type => 90002,
      price => 480,
      item_reward => [{20009, 1}, {20021, 15}, {20020, 20}],
      total_count => 999999999, day_charge => 0};
get_discount(19) ->
    #{id => 19, day => 5, assets_type => 90002,
      price => 799,
      item_reward => [{22216, 5}, {90003, 30000}],
      total_count => 999999999, day_charge => 0};
get_discount(20) ->
    #{id => 20, day => 6, assets_type => 90002,
      price => 700,
      item_reward => [{21100, 10}, {90000, 2000000}],
      total_count => 999999999, day_charge => 0};
get_discount(21) ->
    #{id => 21, day => 7, assets_type => 90002,
      price => 720, item_reward => [{22219, 10}, {22585, 3}],
      total_count => 999999999, day_charge => 0};
get_discount(_) -> false.

get_complete(10) -> [{20005, 2}, {20025, 1}];
get_complete(20) -> [{90026, 100}, {20034, 2}];
get_complete(30) ->
    [{20545, 1}, {20021, 2}, {90000, 80000}];
get_complete(50) ->
    [{22396, 1}, {20006, 8}, {90000, 120000}];
get_complete(70) ->
    [{20053, 1}, {90026, 200}, {90000, 200000}];
get_complete(85) ->
    [{22617, 1}, {20020, 8}, {90000, 200000}];
get_complete(100) ->
    [{20617, 1}, {20076, 1}, {22219, 2}, {90000, 200000}];
get_complete(_) -> false.

