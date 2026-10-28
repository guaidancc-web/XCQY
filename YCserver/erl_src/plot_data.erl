-file("src/data/plot_data.erl", 1).

-module(plot_data).

-export([vars/0,
         open_list/0,
         all_list/0,
         get/1,
         get_guide/1]).

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

-file("src/data/plot_data.erl", 17).

-file("inc/plot.hrl", 1).

-record(m_plot,
        {ver = 1 :: pos_integer(),
         plot_quest_ver = 1 :: pos_integer(),
         finished = [] :: [pos_integer()],
         play_list = [] :: [pos_integer()],
         do_list = [] :: [tuple()],
         combat_list = [] :: [tuple()],
         fun_icons = [] :: [pos_integer()],
         unit_list = [] :: [tuple()],
         map_list = [] :: [pos_integer()],
         guide_list = [] :: [pos_integer()],
         dun_id = 0 :: non_neg_integer(),
         hide_mode = 0 :: non_neg_integer(),
         scene = [] :: list(),
         dungeon = [] :: list(),
         quest_trace = 0 :: non_neg_integer()}).

-record(plot,
        {id :: undefined | non_neg_integer(),
         num = 0 :: non_neg_integer(),
         act_idx = 0 :: non_neg_integer()}).

-record(plot_trigger,
        {id = 0 :: non_neg_integer(),
         name = "" :: list(),
         lev = 0 :: non_neg_integer(),
         status = 1 :: 0 | 1,
         type = 1 :: 1 | 2,
         off_line = 0 :: 0..2,
         can_skip = 1 :: 0..1,
         hide_layer = 1 :: 0..1,
         res_list = [] :: [bitstring()],
         maps = [] :: [pos_integer()],
         num = 1 :: non_neg_integer(),
         event = [] :: [tuple()],
         vars = [] :: [tuple()],
         cond_logic = 'and' :: atom(),
         condition = [] :: [tuple()],
         action = [] :: [tuple()],
         lev_break_min_times = 0,
         lev_break_max_times = 1}).

-record(plot_act,
        {id = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         label :: undefined | atom(),
         time = 0 :: non_neg_integer(),
         mode = 0 :: non_neg_integer(),
         unit_id = 0 :: non_neg_integer(),
         unit_base_id = 0 :: non_neg_integer(),
         looks = [] :: list(),
         ext_info = [] :: [{pos_integer(), bitstring()}],
         battle_id = 0 :: non_neg_integer(),
         mapid = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         val = 0 :: non_neg_integer(),
         ext_val = 0 :: non_neg_integer(),
         res_id = 0 :: non_neg_integer(),
         color = "" :: bitstring(),
         msg = "" :: bitstring(),
         ext_msg = "" :: bitstring(),
         gain = [] :: [{pos_integer(), pos_integer()}],
         need_next = 0 :: 0..1,
         timeout = 0 :: non_neg_integer(),
         skip_do = 0 :: 0..1,
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer()}).

-record(plot_quest_revise_data,
        {ver = 0 :: non_neg_integer(),
         min_lev = 0 :: non_neg_integer(),
         max_lev = 0 :: non_neg_integer(),
         min_exp = 0 :: non_neg_integer(),
         pos :: undefined | tuple(),
         finish_quests = [] :: [pos_integer()],
         finish_reward_quests = [] :: [pos_integer()],
         finish_plots = [] :: [pos_integer()],
         open_plots = [] :: [pos_integer()],
         open_sys_list = [] :: [pos_integer()],
         open_map_list = [] :: [pos_integer()],
         skill_list = [] :: [pos_integer()],
         reward_list = [] :: list()}).

-record(plot_quest_unit,
        {label,
         id = 0,
         base_id = 0,
         pos,
         dir,
         act_type,
         is_rand_pos = 0}).

-file("src/data/plot_data.erl", 18).

-file("inc/sys_ico.hrl", 1).

-record(sys_ico_data,
        {id = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         type = 1 :: non_neg_integer(),
         prior = 0 :: non_neg_integer(),
         auto_lev = 0 :: non_neg_integer(),
         can_handle = 0 :: 0..1,
         is_plot = 0 :: 0..1,
         only_client = 0 :: 0..1,
         is_show_time = 1 :: 0..1,
         start_time = 0 :: term(),
         end_time = 0 :: term(),
         need_lev = 0 :: non_neg_integer(),
         need_fc = 0 :: non_neg_integer(),
         white_list = [] :: list(),
         black_list = [] :: list()}).

-record(sys_ico,
        {id = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         timeout = 0 :: non_neg_integer(),
         num = 0 :: non_neg_integer()}).

-file("src/data/plot_data.erl", 19).

-file("inc/condition.hrl", 1).

-record(condition,
        {label :: undefined | atom(),
         op = eq ::
             ue | eq | lt | gt | le | ge | range | include,
         val :: undefined | term(),
         msg = "" :: list()}).

-file("src/data/plot_data.erl", 20).

vars() -> [].

open_list() ->
    [10044,
     10046,
     10372,
     100,
     101,
     110,
     120,
     70000,
     70010,
     70020,
     70036,
     70037,
     70038,
     70039,
     70040,
     70044,
     70046,
     70050,
     70060,
     70174,
     70176,
     70177,
     70180,
     70185,
     70190,
     70300,
     70347,
     70384,
     70394,
     10440,
     10510,
     10574,
     10640,
     10700,
     10740,
     10830,
     10870,
     10940,
     11000,
     11070,
     11130,
     11152,
     11170,
     11200,
     11230,
     11250,
     11260,
     11330,
     11390,
     11404,
     11434,
     11460,
     11470,
     11550,
     11630,
     11660,
     11720,
     30000,
     30020,
     30030,
     30040,
     30050,
     30070,
     30080,
     30100,
     30140,
     30120,
     30150,
     30170,
     30180,
     30190,
     30200,
     30300,
     30400,
     30500,
     30600,
     30700,
     41730,
     43000,
     43050,
     43120,
     43170,
     43210,
     43211,
     43212,
     44000,
     44002,
     44500,
     44510,
     44520,
     44530,
     44531,
     44535,
     44540,
     44550,
     44560,
     44570,
     44580,
     50000,
     50001,
     50010,
     50011,
     50020,
     50021,
     50030,
     50031,
     50040,
     50041,
     50042,
     50112,
     60000,
     60010,
     82003,
     83000,
     83001,
     83025,
     83026,
     83100,
     83110,
     83120,
     83129,
     83130,
     83140,
     83160,
     83165,
     83170,
     83180,
     83190,
     83200,
     83210].

all_list() ->
    [100,
     10000,
     10006,
     10020,
     10035,
     10040,
     10044,
     10046,
     10048,
     10050,
     10060,
     101,
     10100,
     10130,
     10134,
     10140,
     10170,
     10174,
     10175,
     10176,
     10180,
     10184,
     10185,
     10190,
     10192,
     10193,
     10194,
     10196,
     10300,
     10310,
     10320,
     10330,
     10332,
     10344,
     10346,
     10347,
     10350,
     10372,
     10374,
     10375,
     10380,
     10384,
     10386,
     10390,
     10394,
     10400,
     10401,
     10420,
     10424,
     10430,
     10440,
     10444,
     10446,
     10450,
     10460,
     10470,
     10480,
     10484,
     10486,
     10490,
     10495,
     10496,
     10500,
     10502,
     10504,
     10510,
     10520,
     10534,
     10540,
     10550,
     10560,
     10574,
     10576,
     10578,
     10580,
     10585,
     10590,
     10600,
     10610,
     10620,
     10624,
     10640,
     10650,
     10660,
     10670,
     10680,
     10690,
     10700,
     10710,
     10720,
     10730,
     10740,
     10750,
     10760,
     10770,
     10780,
     10790,
     10800,
     10810,
     10820,
     10830,
     10840,
     10850,
     10860,
     10870,
     10880,
     10890,
     10900,
     10910,
     10920,
     10930,
     10940,
     10950,
     10960,
     10970,
     10980,
     10990,
     110,
     11000,
     11010,
     11020,
     11030,
     11040,
     11050,
     11060,
     11070,
     11080,
     11090,
     11100,
     11110,
     11120,
     11130,
     11140,
     11150,
     11152,
     11154,
     11156,
     11160,
     11162,
     11170,
     11172,
     11180,
     11190,
     11192,
     11200,
     11210,
     11212,
     11220,
     11224,
     11226,
     11230,
     11232,
     11240,
     11250,
     11260,
     11270,
     11280,
     11290,
     11300,
     11310,
     11320,
     11330,
     11340,
     11350,
     11360,
     11370,
     11380,
     11390,
     11400,
     11404,
     11410,
     11420,
     11426,
     11427,
     11428,
     11430,
     11434,
     11440,
     11450,
     11460,
     11470,
     11480,
     11490,
     11500,
     11510,
     11520,
     11530,
     11540,
     11550,
     11560,
     11570,
     11580,
     11586,
     11590,
     11600,
     11610,
     11620,
     11630,
     11640,
     11660,
     11670,
     11680,
     11690,
     11700,
     11710,
     11720,
     11730,
     11740,
     11750,
     11760,
     11770,
     11780,
     11790,
     120,
     30000,
     30020,
     30030,
     30040,
     30045,
     30050,
     30060,
     30070,
     30080,
     30090,
     30100,
     30110,
     30120,
     30130,
     30140,
     30150,
     30160,
     30170,
     30180,
     30190,
     30200,
     30300,
     30400,
     30500,
     30600,
     30700,
     30701,
     70000,
     70006,
     70010,
     70020,
     70035,
     70036,
     70037,
     70038,
     70039,
     70040,
     70044,
     70046,
     70048,
     70050,
     70060,
     70100,
     70130,
     70134,
     70140,
     70170,
     70174,
     70175,
     70176,
     70177,
     70180,
     70184,
     70185,
     70190,
     70192,
     70193,
     70194,
     70196,
     70300,
     70310,
     70320,
     70330,
     70332,
     70346,
     70347,
     70350,
     70360,
     70372,
     70374,
     70380,
     70384,
     70386,
     70390,
     70394,
     9020,
     9030,
     41730,
     43000,
     43010,
     43020,
     43030,
     43040,
     43050,
     43060,
     43070,
     43080,
     43090,
     43100,
     43110,
     43120,
     43130,
     43140,
     43150,
     43160,
     43170,
     43180,
     43190,
     43200,
     43204,
     43210,
     43211,
     43212,
     44000,
     44002,
     44010,
     44500,
     44510,
     44520,
     44530,
     44531,
     44535,
     44540,
     44550,
     44560,
     44570,
     44580,
     50000,
     50001,
     50010,
     50011,
     50020,
     50021,
     50030,
     50031,
     50040,
     50041,
     50042,
     50112,
     60000,
     60010,
     82003,
     83000,
     83001,
     83025,
     83026,
     83100,
     83110,
     83120,
     83129,
     83130,
     83140,
     83160,
     83165,
     83170,
     83180,
     83190,
     83200,
     83210].

get(10000) ->
    #plot_trigger{id = 10000, name = lang:get("回归"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10030}],
                  action =
                      [{trigger_del, 9020},
                       {plot_unit_create,
                        9041,
                        40039,
                        "史密斯",
                        {point, 10001, 738, 910},
                        7,
                        "stand",
                        1,
                        []},
                       {plot_unit_create,
                        9042,
                        40039,
                        "克拉克",
                        {point, 10001, 726, 1046},
                        6,
                        "stand",
                        1,
                        []},
                       {plot_unit_create,
                        9043,
                        40039,
                        "米克",
                        {point, 10001, 1063, 1036},
                        3,
                        "stand",
                        1,
                        []},
                       {play_plot, 9040},
                       {plot_unit_del, 9000},
                       {plot_unit_del, 9001},
                       {plot_unit_del, 9002}]};
get(10006) ->
    #plot_trigger{id = 10006, name = lang:get("获得宠物"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20000}],
                  action =
                      [{trigger_del, 10000},
                       {trigger_open, 10010},
                       {trigger_open, 10020}]};
get(10020) ->
    #plot_trigger{id = 10020, name = lang:get("飞信"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10001], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10030}],
                  action =
                      [{plot_unit_del, 9041},
                       {plot_unit_del, 9042},
                       {plot_unit_del, 9043},
                       {pet_war},
                       {plot_unit_create,
                        10004,
                        40039,
                        "地院学员",
                        {point, 10001, 1136, 2914},
                        5,
                        "stand",
                        1,
                        []},
                       {plot_unit_create,
                        10006,
                        40039,
                        "地院学员",
                        {point, 10001, 1671, 2914},
                        3,
                        "stand",
                        1,
                        []},
                       {trigger_open, 10035}]};
get(10035) ->
    #plot_trigger{id = 10035, name = lang:get("林雷出现"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 99, off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20012}],
                  action =
                      [{play_plot, 10051},
                       {trigger_del, 10020},
                       {trigger_open, 10040},
                       {kill_npc, 40037}]};
get(10040) ->
    #plot_trigger{id = 10040, name = lang:get("林雷放话"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 2, maps = [10001], off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40037}],
                  action =
                      [{play_plot, 10060},
                       {plot_unit_del, 10004},
                       {plot_unit_del, 10006},
                       {inter_monologue,
                        0,
                        0,
                        "",
                        "糟了，回来后忘了去拜访老师，会不会挨骂啊……",
                        2000},
                       {trigger_del, 10035},
                       {trigger_del, 10036},
                       {trigger_del, 10037},
                       {trigger_del, 10038},
                       {trigger_del, 10039},
                       {trigger_open, 10044},
                       {trigger_open, 10050}]};
get(10044) ->
    #plot_trigger{id = 10044, name = lang:get("升级技能"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 2, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10060}],
                  action =
                      [{play_plot, 10070},
                       {play_guide, 10001},
                       {trigger_del, 10040},
                       {trigger_del, 10050},
                       {trigger_open, 10046}]};
get(10046) ->
    #plot_trigger{id = 10046, name = lang:get("建立星台"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 3, maps = [10001], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10066}],
                  action =
                      [{plot_unit_create,
                        10052,
                        10007,
                        "星台",
                        {point, 10001, 1646, 2032},
                        0,
                        "stand",
                        1,
                        []},
                       {trigger_open, 10140},
                       {trigger_open, 10048}]};
get(10048) ->
    #plot_trigger{id = 10048, name = lang:get("传送星台"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 0, lev = 3, maps = [10001], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 10052}],
                  action = [{goto, {point, 20001, 702, 1523}}]};
get(10050) ->
    #plot_trigger{id = 10050, name = lang:get("建立星台"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 2, maps = [10001], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10070}],
                  action =
                      [{plot_unit_create,
                        10050,
                        10007,
                        "星台",
                        {point, 10001, 2027, 1111},
                        0,
                        "stand",
                        1,
                        []},
                       {trigger_del, 10040},
                       {trigger_open, 10100},
                       {trigger_open, 10060}]};
get(10060) ->
    #plot_trigger{id = 10060, name = lang:get("传送星台"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 0, lev = 3, maps = [10001], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 10050}],
                  action = [{goto, {point, 20001, 539, 1549}}]};
get(10100) ->
    #plot_trigger{id = 10100, name = lang:get("地院出现"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 999, maps = [20001], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20022}],
                  action =
                      [{trigger_del, 10050},
                       {trigger_open, 10130},
                       {kill_npc, 41000}]};
get(10130) ->
    #plot_trigger{id = 10130, name = lang:get("击败地院"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 99, maps = [20001], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10070}],
                  action =
                      [{trigger_del, 10100},
                       {plot_unit_del, 20022},
                       {play_guide, 10001},
                       {trigger_open, 10134}]};
get(10134) ->
    #plot_trigger{id = 10134, name = lang:get("升级完技能"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [20001], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10071}],
                  action =
                      [{inter_monologue,
                        0,
                        0,
                        "",
                        "看来地院的人知道我们要来星台了！哼，别想阻拦我们！",
                        3000},
                       {trigger_del, 10130},
                       {trigger_open, 10140}]};
get(10140) ->
    #plot_trigger{id = 10140, name = lang:get("杜维"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [20001], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20023}],
                  action =
                      [{trigger_del, 10134},
                       {trigger_open, 10174},
                       {trigger_open, 10170},
                       {trigger_open, 10175},
                       {trigger_open, 10176},
                       {play_plot, 10104}]};
get(10170) ->
    #plot_trigger{id = 10170, name = lang:get("击败杜维"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 999, maps = [20001], off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 41001}],
                  action =
                      [{trigger_del, 10140},
                       {plot_unit_del, 20023},
                       {play_plot, 10120},
                       {trigger_del, 10150},
                       {trigger_del, 10160},
                       {trigger_open, 10180}]};
get(10174) ->
    #plot_trigger{id = 10174, name = lang:get("操作林雷"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 4, maps = [20001], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20025}],
                  action =
                      [{play_plot, 10110},
                       {trigger_open, 10175},
                       {kill_npc, 41040}]};
get(10175) ->
    #plot_trigger{id = 10175, name = lang:get("被地狱火消灭"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 4, maps = [20001], off_line = 0,
                  event = [{evt_kill_npc_lose}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 41040}],
                  action =
                      [{play_plot, 10114},
                       {plot_unit_del, 20026},
                       {trigger_del, 10174},
                       {trigger_del, 10176},
                       {trigger_del, 10160},
                       {trigger_del, 10150},
                       {trigger_open, 10180}]};
get(10176) ->
    #plot_trigger{id = 10176, name = lang:get("消灭地狱火"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 4, maps = [20001], off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 41040}],
                  action =
                      [{play_plot, 10114},
                       {plot_unit_del, 20026},
                       {trigger_del, 10174},
                       {trigger_del, 10175},
                       {trigger_del, 10160},
                       {trigger_del, 10150},
                       {trigger_open, 10180}]};
get(10180) ->
    #plot_trigger{id = 10180, name = lang:get("占星"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10066}],
                  action =
                      [{play_plot, 10130},
                       {trigger_del, 10170},
                       {trigger_del, 10177},
                       {trigger_del, 10176},
                       {trigger_del, 10044},
                       {plot_unit_create,
                        10040,
                        40005,
                        "圣心城",
                        {point, 20001, 1517, 262},
                        7,
                        "stand",
                        1,
                        []},
                       {play_plot, 10132},
                       {goto, {point, 10001, 2050, 1794}},
                       {trigger_open, 10185},
                       {trigger_open, 10184}]};
get(10184) ->
    #plot_trigger{id = 10184, name = lang:get("传送"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 0, lev = 1, maps = [20001], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 10040}],
                  action = [{goto, {point, 10001, 2050, 1794}}]};
get(10185) ->
    #plot_trigger{id = 10185, name = lang:get("删除传送阵"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10001], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10084}],
                  action =
                      [{plot_unit_del, 10040},
                       {plot_unit_del, 10050},
                       {plot_unit_del, 10052},
                       {trigger_del, 10184},
                       {trigger_del, 10180},
                       {trigger_del, 10060},
                       {trigger_del, 10048},
                       {trigger_open, 10190}]};
get(10190) ->
    #plot_trigger{id = 10190, name = lang:get("给波芘送花"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10001], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10090}],
                  action = [{trigger_del, 10185}, {trigger_open, 10192}]};
get(10192) ->
    #plot_trigger{id = 10192, name = lang:get("打水盗"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20034}],
                  action =
                      [{trigger_del, 10190},
                       {trigger_open, 10193},
                       {trigger_open, 10194},
                       {trigger_open, 10195},
                       {kill_npc, 40042}]};
get(10193) ->
    #plot_trigger{id = 10193, name = lang:get("打垮头目"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10001], off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40042}],
                  action =
                      [{plot_unit_del, 20034},
                       {trigger_del, 10194},
                       {trigger_del, 10195},
                       {trigger_del, 10196},
                       {play_plot, 10143},
                       {trigger_open, 10300}]};
get(10194) ->
    #plot_trigger{id = 10194, name = lang:get("被水盗打垮"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10001], off_line = 0,
                  event = [{evt_kill_npc_lose}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40042}],
                  action =
                      [{trigger_del, 10192},
                       {plot_unit_create,
                        20034,
                        40042,
                        "水盗头目",
                        {point, 20001, 4606, 3449},
                        5,
                        "stand",
                        1,
                        []},
                       {trigger_open, 10196}]};
get(10196) ->
    #plot_trigger{id = 10196, name = lang:get("被杀后继续打头目"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10001], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20034}],
                  action = [{kill_npc, 40042}]};
get(10300) ->
    #plot_trigger{id = 10300, name = lang:get("招募成功"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10001], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10160}],
                  action =
                      [{play_plot, 10300},
                       {trigger_del, 10193},
                       {trigger_open, 10310}]};
get(10310) ->
    #plot_trigger{id = 10310, name = lang:get("遇见莉娜"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10002], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10170}],
                  action =
                      [{play_plot, 10310},
                       {trigger_del, 10300},
                       {trigger_open, 10320}]};
get(10320) ->
    #plot_trigger{id = 10320, name = lang:get("提升"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10002], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10190}],
                  action =
                      [{play_plot, 10320},
                       {trigger_del, 10310},
                       {trigger_open, 10330}]};
get(10330) ->
    #plot_trigger{id = 10330, name = lang:get("遇到拉斐尔"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10200}],
                  action =
                      [{play_plot, 10330},
                       {play_plot, 10334},
                       {trigger_del, 10310},
                       {trigger_open, 10332}]};
get(10332) ->
    #plot_trigger{id = 10332, name = lang:get("飞起来"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20061}],
                  action =
                      [{play_plot, 10338},
                       {wing, 600000, 20005},
                       {add_buff, 30000},
                       {trigger_del, 10330},
                       {trigger_open, 10344},
                       {trigger_open, 10346}]};
get(10344) ->
    #plot_trigger{id = 10344, name = lang:get("采集圣水"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10003], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20064}],
                  action =
                      [{play_plot, 10344},
                       {trigger_del, 10332},
                       {trigger_open, 10350},
                       {trigger_open, 10346}]};
get(10346) ->
    #plot_trigger{id = 10346, name = lang:get("打蓝雯"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 10, off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20062}],
                  action =
                      [{play_plot, 10346},
                       {trigger_open, 10347},
                       {kill_npc, 40013}]};
get(10347) ->
    #plot_trigger{id = 10347, name = lang:get("打垮蓝雯"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40013}],
                  action = [{trigger_del, 10346}]};
get(10350) ->
    #plot_trigger{id = 10350, name = lang:get("破解"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10003], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10210}],
                  action =
                      [{wing, 0, 20005},
                       {del_buff, 30000},
                       {trigger_del, 10340},
                       {trigger_del, 10347},
                       {trigger_open, 10360}]};
get(10372) ->
    #plot_trigger{id = 10372, name = lang:get("安慰爱丽儿"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 12, maps = [10003], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10230}],
                  action =
                      [{play_plot, 10372},
                       {trigger_del, 10370},
                       {trigger_open, 10374}]};
get(10374) ->
    #plot_trigger{id = 10374, name = lang:get("魔化林雷"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10003], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20090}],
                  action =
                      [{play_plot, 10374},
                       {trigger_del, 10370},
                       {trigger_open, 10380},
                       {trigger_open, 10375},
                       {kill_npc, 40038}]};
get(10375) ->
    #plot_trigger{id = 10375, name = lang:get("加入助战"),
                  status = 0, type = 2, can_skip = 1, hide_layer = 0,
                  num = 0, lev = 13, off_line = 0,
                  event = [{evt_combat_init}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40038}],
                  action = [{add_fighter, 1, 40076}]};
get(10380) ->
    #plot_trigger{id = 10380, name = lang:get("回学院"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40038}],
                  action =
                      [{play_plot, 10380},
                       {trigger_del, 10370},
                       {trigger_del, 10375},
                       {trigger_open, 10384},
                       {trigger_open, 10390}]};
get(10384) ->
    #plot_trigger{id = 10384, name = lang:get("领取新手宠物"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10001], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10260}],
                  action = [{trigger_open, 10386}]};
get(10386) ->
    #plot_trigger{id = 10386, name = lang:get("洗髓宠物"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10001], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10270}],
                  action =
                      [{play_plot, 10386},
                       {trigger_del, 10384},
                       {trigger_del, 10386}]};
get(10390) ->
    #plot_trigger{id = 10390, name = lang:get("肖恩教授"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10001], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10280}],
                  action =
                      [{play_plot, 10390},
                       {trigger_del, 10380},
                       {trigger_del, 10386},
                       {trigger_open, 10400}]};
get(10394) ->
    #plot_trigger{id = 10394, name = lang:get("开启日常"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 150, maps = [10001], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10310}],
                  action =
                      [{open_sys, [{14, 14}]}, {sound_play, 278, 1}]};
get(100) ->
    #plot_trigger{id = 100, name = lang:get("捕宠战斗说话1"),
                  status = 1, type = 2, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_combat_round}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq, val = 40018},
                       #condition{label = combat_round, op = eq, val = 1}],
                  action = [{guide, 100}]};
get(101) ->
    #plot_trigger{id = 101, name = lang:get("海盗战菲雅入"),
                  status = 1, type = 2, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_combat_round}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq, val = 40042},
                       #condition{label = combat_round, op = eq, val = 2}],
                  action = [{add_fighter, 0, 40068}]};
get(110) ->
    #plot_trigger{id = 110, name = lang:get("捕宠战斗说话1"),
                  status = 1, type = 2, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_combat_round}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq, val = 40042},
                       #condition{label = combat_round, op = eq, val = 1}],
                  action = [{guide, 102}]};
get(120) ->
    #plot_trigger{id = 120, name = lang:get("加蓝雯"),
                  status = 1, type = 2, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_combat_round}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq, val = 40038},
                       #condition{label = combat_round, op = eq, val = 2}],
                  action = [{add_fighter, 0, 40076}]};
get(9020) ->
    #plot_trigger{id = 9020, name = lang:get("进场"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 1, maps = [10001], off_line = 0,
                  event = [{evt_cli_loaded}], cond_logic = 'and',
                  condition =
                      [#condition{label = map_base_id, op = eq, val = 10001}],
                  action = [{trigger_del, 9010}, {trigger_open, 10000}]};
get(9030) ->
    #plot_trigger{id = 9030, name = lang:get("进场"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 1, maps = [10001], off_line = 0,
                  event = [{evt_enter_map}], cond_logic = 'and',
                  condition =
                      [#condition{label = map_base_id, op = eq, val = 10001}],
                  action =
                      [{play_plot, 9030},
                       {play_guide, 10000},
                       {trigger_del, 9010},
                       {trigger_open, 10000}]};
get(70000) ->
    #plot_trigger{id = 70000, name = lang:get("回归"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 22030}],
                  action =
                      [{trigger_del, 9020},
                       {plot_unit_create,
                        9041,
                        40039,
                        "史密斯",
                        {point, 10001, 795, 890},
                        7,
                        "stand",
                        1,
                        []},
                       {plot_unit_create,
                        9042,
                        40039,
                        "克拉克",
                        {point, 10001, 770, 1046},
                        6,
                        "stand",
                        1,
                        []},
                       {plot_unit_create,
                        9043,
                        40039,
                        "米克",
                        {point, 10001, 1000, 1018},
                        3,
                        "stand",
                        1,
                        []},
                       {play_plot, 9040},
                       {plot_unit_del, 9000},
                       {plot_unit_del, 9001},
                       {plot_unit_del, 9002}]};
get(70006) ->
    #plot_trigger{id = 70006, name = lang:get("获得宠物"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20000}],
                  action =
                      [{trigger_del, 10000},
                       {plot_unit_del, 9041},
                       {plot_unit_del, 9042},
                       {plot_unit_del, 9043},
                       {trigger_open, 70010},
                       {trigger_open, 70020}]};
get(70010) ->
    #plot_trigger{id = 70010, name = lang:get("捕宠"),
                  status = 1, type = 2, can_skip = 0, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_combat_init}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40018}],
                  action =
                      [{add_fighter, 1, 42001},
                       {add_fighter, 1, 42002},
                       {add_fighter, 1, 42003}]};
get(70020) ->
    #plot_trigger{id = 70020, name = lang:get("飞信"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10001], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 22030}],
                  action =
                      [{plot_unit_del, 9041},
                       {plot_unit_del, 9042},
                       {plot_unit_del, 9043},
                       {pet_war},
                       {plot_unit_create,
                        10004,
                        40039,
                        "地院学员",
                        {point, 10001, 1136, 2914},
                        5,
                        "stand",
                        1,
                        []},
                       {plot_unit_create,
                        10006,
                        40039,
                        "地院学员",
                        {point, 10001, 1671, 2914},
                        3,
                        "stand",
                        1,
                        []},
                       {trigger_open, 70035}]};
get(70035) ->
    #plot_trigger{id = 70035, name = lang:get("林雷出现"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 99, off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20012}],
                  action =
                      [{play_plot, 10051},
                       {trigger_del, 70020},
                       {kill_npc, 40037}]};
get(70036) ->
    #plot_trigger{id = 70036, name = lang:get("战斗指引1"),
                  status = 1, type = 2, can_skip = 0, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_combat_round}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq, val = 40037},
                       #condition{label = combat_round, op = eq, val = 1}],
                  action = [{guide, 1001}]};
get(70037) ->
    #plot_trigger{id = 70037, name = lang:get("战斗指引2"),
                  status = 1, type = 2, can_skip = 0, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_combat_round}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq, val = 40037},
                       #condition{label = combat_round, op = eq, val = 2}],
                  action = [{guide, 1002}]};
get(70038) ->
    #plot_trigger{id = 70038, name = lang:get("战斗指引3"),
                  status = 1, type = 2, can_skip = 0, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_combat_round}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq, val = 41000},
                       #condition{label = combat_round, op = eq, val = 1}],
                  action = [{guide, 1002}]};
get(70039) ->
    #plot_trigger{id = 70039, name = lang:get("战斗指引3"),
                  status = 1, type = 2, can_skip = 0, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_combat_round}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq, val = 41001},
                       #condition{label = combat_round, op = eq, val = 1}],
                  action = [{guide, 1002}]};
get(70040) ->
    #plot_trigger{id = 70040, name = lang:get("林雷放话"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 2, maps = [10001], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 22054}],
                  action =
                      [{play_plot, 10060},
                       {plot_unit_del, 10004},
                       {plot_unit_del, 10006},
                       {inter_monologue,
                        0,
                        0,
                        "",
                        "糟了，回来后忘了去拜访老师，会不会挨骂啊……",
                        2000},
                       {trigger_del, 70035},
                       {trigger_del, 70036},
                       {trigger_del, 70037},
                       {trigger_del, 70038},
                       {trigger_del, 70039},
                       {trigger_open, 70050}]};
get(70044) ->
    #plot_trigger{id = 70044, name = lang:get("升级技能"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 2, maps = [10001], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 22060}],
                  action =
                      [{play_plot, 10070},
                       {play_guide, 10001},
                       {trigger_del, 70040},
                       {trigger_del, 70050},
                       {trigger_open, 70046}]};
get(70046) ->
    #plot_trigger{id = 70046, name = lang:get("建立星台"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 3, maps = [10001], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 22066}],
                  action =
                      [{plot_unit_create,
                        10052,
                        10007,
                        "星台",
                        {point, 10001, 1646, 2032},
                        0,
                        "stand",
                        1,
                        []},
                       {trigger_open, 70140},
                       {trigger_open, 70048}]};
get(70048) ->
    #plot_trigger{id = 70048, name = lang:get("传送星台"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 0, lev = 3, maps = [10001], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 10052}],
                  action = [{goto, {point, 20001, 702, 1523}}]};
get(70050) ->
    #plot_trigger{id = 70050, name = lang:get("建立星台"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 2, maps = [10001], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 22070}],
                  action =
                      [{plot_unit_create,
                        10050,
                        10007,
                        "星台",
                        {point, 10001, 2027, 1111},
                        0,
                        "stand",
                        1,
                        []},
                       {trigger_del, 70040},
                       {trigger_open, 70100},
                       {trigger_open, 70060}]};
get(70060) ->
    #plot_trigger{id = 70060, name = lang:get("传送星台"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 0, lev = 3, maps = [10001], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 10050}],
                  action = [{goto, {point, 20001, 539, 1549}}]};
get(70100) ->
    #plot_trigger{id = 70100, name = lang:get("地院出现"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 999, maps = [20001], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20022}],
                  action =
                      [{trigger_del, 70050},
                       {trigger_open, 70130},
                       {kill_npc, 41000}]};
get(70130) ->
    #plot_trigger{id = 70130, name = lang:get("打垮地院"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 99, maps = [20001], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 22070}],
                  action =
                      [{trigger_del, 70100},
                       {plot_unit_del, 20022},
                       {play_guide, 10001},
                       {trigger_open, 70134}]};
get(70134) ->
    #plot_trigger{id = 70134, name = lang:get("升级完技能"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [20001], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 22071}],
                  action =
                      [{inter_monologue,
                        0,
                        0,
                        "",
                        "看来地院的人知道我们要来星台了！哼，别想阻拦我们！",
                        3000},
                       {trigger_del, 70130},
                       {trigger_open, 70140}]};
get(70140) ->
    #plot_trigger{id = 70140, name = lang:get("杜维"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [20001], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20023}],
                  action = [{trigger_del, 70134}, {play_plot, 10104}]};
get(70170) ->
    #plot_trigger{id = 70170, name = lang:get("打垮杜维"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 999, maps = [20001], off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 41001}],
                  action =
                      [{trigger_del, 70140},
                       {plot_unit_del, 20023},
                       {play_plot, 10120},
                       {trigger_del, 70150},
                       {trigger_del, 70160},
                       {trigger_open, 70180}]};
get(70174) ->
    #plot_trigger{id = 70174, name = lang:get("操作林雷"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 4, maps = [20001], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20025}],
                  action = [{play_plot, 10110}, {kill_npc, 41040}]};
get(70175) ->
    #plot_trigger{id = 70175, name = lang:get("被地狱火消灭"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 4, maps = [20001], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 22066}],
                  action =
                      [{play_plot, 10114},
                       {plot_unit_del, 20026},
                       {trigger_del, 70174},
                       {trigger_del, 70176},
                       {trigger_del, 70160},
                       {trigger_del, 70150},
                       {trigger_open, 70180}]};
get(70176) ->
    #plot_trigger{id = 70176, name = lang:get("消灭地狱火"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 4, maps = [20001], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 22066}],
                  action =
                      [{play_plot, 10114},
                       {plot_unit_del, 20026},
                       {trigger_del, 70174},
                       {trigger_del, 70175},
                       {trigger_del, 70160},
                       {trigger_del, 70150},
                       {trigger_open, 70180}]};
get(70177) ->
    #plot_trigger{id = 70177, name = lang:get("打地狱火"),
                  status = 1, type = 2, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_combat_init}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 41040}],
                  action =
                      [{add_fighter, 1, 41050},
                       {add_fighter, 1, 41051},
                       {add_fighter, 1, 41052},
                       {add_fighter, 1, 41053},
                       {add_fighter, 1, 41054},
                       {add_fighter, 1, 41055}]};
get(70180) ->
    #plot_trigger{id = 70180, name = lang:get("占星"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20024}],
                  action =
                      [{play_plot, 10130},
                       {plot_unit_del, 10052},
                       {trigger_del, 70170},
                       {trigger_del, 70177},
                       {trigger_del, 70176},
                       {trigger_del, 70044},
                       {plot_unit_create,
                        10040,
                        40005,
                        "圣心城",
                        {point, 20001, 1517, 262},
                        7,
                        "stand",
                        1,
                        []},
                       {play_plot, 10132},
                       {goto, {point, 10001, 2050, 1794}},
                       {trigger_open, 70185},
                       {trigger_open, 70184}]};
get(70184) ->
    #plot_trigger{id = 70184, name = lang:get("传送"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 0, lev = 1, maps = [20001], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 10040}],
                  action = [{goto, {point, 10001, 2050, 1794}}]};
get(70185) ->
    #plot_trigger{id = 70185, name = lang:get("删除传送阵"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 22084}],
                  action =
                      [{plot_unit_del, 70040},
                       {plot_unit_del, 70050},
                       {plot_unit_del, 70052},
                       {trigger_del, 70184},
                       {trigger_del, 70180},
                       {trigger_del, 70060},
                       {trigger_del, 70048},
                       {trigger_open, 70190}]};
get(70190) ->
    #plot_trigger{id = 70190, name = lang:get("给波芘送花"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 22090}],
                  action = [{trigger_del, 70185}, {trigger_open, 70192}]};
get(70192) ->
    #plot_trigger{id = 70192, name = lang:get("打水盗"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20034}],
                  action =
                      [{trigger_del, 70190},
                       {trigger_open, 70193},
                       {trigger_open, 70194},
                       {kill_npc, 40042}]};
get(70193) ->
    #plot_trigger{id = 70193, name = lang:get("打垮头目"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10001], off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40042}],
                  action =
                      [{plot_unit_del, 20034},
                       {trigger_del, 70194},
                       {trigger_del, 70196},
                       {play_plot, 10143},
                       {trigger_open, 70300}]};
get(70194) ->
    #plot_trigger{id = 70194, name = lang:get("被水盗打死"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10001], off_line = 0,
                  event = [{evt_kill_npc_lose}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40042}],
                  action =
                      [{trigger_del, 70192},
                       {plot_unit_create,
                        20034,
                        40042,
                        "水盗头目",
                        {point, 20001, 4606, 3449},
                        5,
                        "stand",
                        1,
                        []},
                       {trigger_open, 70196}]};
get(70196) ->
    #plot_trigger{id = 70196, name = lang:get("被杀后继续打头目"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10001], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20034}],
                  action = [{kill_npc, 40042}]};
get(70300) ->
    #plot_trigger{id = 70300, name = lang:get("招募成功"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 22160}],
                  action =
                      [{play_plot, 10300},
                       {trigger_del, 70193},
                       {trigger_open, 70310}]};
get(70310) ->
    #plot_trigger{id = 70310, name = lang:get("遇见莉娜"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 22170}],
                  action =
                      [{play_plot, 10310},
                       {trigger_del, 70300},
                       {trigger_open, 70320}]};
get(70320) ->
    #plot_trigger{id = 70320, name = lang:get("提升"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 22190}],
                  action =
                      [{play_plot, 10320},
                       {trigger_del, 70310},
                       {trigger_open, 70330}]};
get(70330) ->
    #plot_trigger{id = 70330, name = lang:get("遇到拉斐尔"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 22200}],
                  action =
                      [{play_plot, 10330},
                       {play_plot, 10334},
                       {trigger_del, 70310},
                       {trigger_open, 70332}]};
get(70332) ->
    #plot_trigger{id = 70332, name = lang:get("开启封印"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20061}],
                  action =
                      [{play_plot, 10338},
                       {wing, 600000, 20005},
                       {add_buff, 30000},
                       {trigger_del, 70330},
                       {trigger_open, 70346}]};
get(70346) ->
    #plot_trigger{id = 70346, name = lang:get("打蓝雯"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 150, off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20062}],
                  action = [{trigger_open, 70347}, {kill_npc, 40013}]};
get(70347) ->
    #plot_trigger{id = 70347, name = lang:get("打垮蓝雯"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 10, off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40013}],
                  action = [{trigger_del, 70346}, {trigger_open, 70350}]};
get(70350) ->
    #plot_trigger{id = 70350, name = lang:get("破解"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 22220}],
                  action =
                      [{wing, 0, 20005},
                       {del_buff, 30000},
                       {trigger_del, 70347},
                       {trigger_open, 70360}]};
get(70360) ->
    #plot_trigger{id = 70360, name = lang:get("获得星辰石"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10003], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20074}],
                  action =
                      [{play_plot, 10356},
                       {trigger_del, 70350},
                       {trigger_open, 70372}]};
get(70372) ->
    #plot_trigger{id = 70372, name = lang:get("安慰爱丽儿"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 12, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 22230}],
                  action =
                      [{play_plot, 10372},
                       {trigger_del, 70360},
                       {trigger_open, 70374}]};
get(70374) ->
    #plot_trigger{id = 70374, name = lang:get("魔化林雷"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10003], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20090}],
                  action =
                      [{play_plot, 10374},
                       {trigger_del, 70370},
                       {trigger_open, 70380},
                       {kill_npc, 40038}]};
get(70380) ->
    #plot_trigger{id = 70380, name = lang:get("回学院"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40038}],
                  action =
                      [{trigger_del, 70370},
                       {trigger_del, 70375},
                       {trigger_open, 70390}]};
get(70384) ->
    #plot_trigger{id = 70384, name = lang:get("领取新手宠物"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 22260}],
                  action = [{play_plot, 10380}, {trigger_open, 70386}]};
get(70386) ->
    #plot_trigger{id = 70386, name = lang:get("洗髓宠物"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 22270}],
                  action =
                      [{play_plot, 10386},
                       {trigger_del, 70384},
                       {trigger_del, 70386},
                       {trigger_open, 70390}]};
get(70390) ->
    #plot_trigger{id = 70390, name = lang:get("肖恩教授"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 22280}],
                  action =
                      [{play_plot, 10390},
                       {trigger_del, 70380},
                       {trigger_del, 70386},
                       {trigger_open, 10400}]};
get(70394) ->
    #plot_trigger{id = 70394, name = lang:get("开启日常"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 150, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 22310}],
                  action =
                      [{open_sys, [{14, 14}]}, {sound_play, 278, 1}]};
get(10400) ->
    #plot_trigger{id = 10400, name = lang:get("地震"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10320}],
                  action =
                      [{play_plot, 10400},
                       {trigger_del, 70390},
                       {trigger_del, 10390},
                       {trigger_open, 10401}]};
get(10401) ->
    #plot_trigger{id = 10401, name = lang:get("地震"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10320}],
                  action =
                      [{play_plot, 10410},
                       {trigger_del, 10400},
                       {trigger_open, 10420}]};
get(10420) ->
    #plot_trigger{id = 10420, name = lang:get("打错人"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10360}],
                  action =
                      [{play_plot, 10430},
                       {trigger_del, 10401},
                       {trigger_open, 10424}]};
get(10424) ->
    #plot_trigger{id = 10424, name = lang:get("打垮水手长"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10001], off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40080}],
                  action =
                      [{play_plot, 10434},
                       {trigger_del, 10420},
                       {trigger_open, 10430}]};
get(10430) ->
    #plot_trigger{id = 10430, name = lang:get("守卫"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10374}],
                  action =
                      [{play_plot, 10440},
                       {trigger_del, 10424},
                       {trigger_open, 10440}]};
get(10440) ->
    #plot_trigger{id = 10440, name = lang:get("怀疑马丁"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 24, lev = 1, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10380}],
                  action =
                      [{play_plot, 10450},
                       {trigger_del, 10430},
                       {trigger_open, 10444}]};
get(10444) ->
    #plot_trigger{id = 10444, name = lang:get("学徒"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10001], off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40090}],
                  action =
                      [{play_plot, 10454},
                       {trigger_del, 10440},
                       {trigger_open, 10446}]};
get(10446) ->
    #plot_trigger{id = 10446, name = lang:get("海盗探子"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10002], off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40100}],
                  action =
                      [{play_plot, 10456},
                       {trigger_del, 10444},
                       {trigger_open, 10450}]};
get(10450) ->
    #plot_trigger{id = 10450, name = lang:get("找马丁"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10400}],
                  action =
                      [{play_plot, 10460},
                       {trigger_del, 10446},
                       {trigger_open, 10460}]};
get(10460) ->
    #plot_trigger{id = 10460, name = lang:get("找到马丁"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10410}],
                  action =
                      [{trigger_del, 10450},
                       {play_plot, 10470},
                       {trigger_open, 10470}]};
get(10470) ->
    #plot_trigger{id = 10470, name = lang:get("求助贤者"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10414}],
                  action =
                      [{play_plot, 10480},
                       {trigger_del, 10460},
                       {trigger_open, 10480}]};
get(10480) ->
    #plot_trigger{id = 10480, name = lang:get("显隐之尘"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10438}],
                  action =
                      [{play_plot, 10490},
                       {trigger_del, 10470},
                       {trigger_open, 10484}]};
get(10484) ->
    #plot_trigger{id = 10484, name = lang:get("娜迦复仇"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10003], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20146}],
                  action =
                      [{play_plot, 10494},
                       {trigger_del, 10480},
                       {trigger_open, 10486}]};
get(10486) ->
    #plot_trigger{id = 10486, name = lang:get("打死娜迦"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10003], off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40130}],
                  action =
                      [{play_plot, 10496},
                       {trigger_del, 10484},
                       {trigger_open, 10490}]};
get(10490) ->
    #plot_trigger{id = 10490, name = lang:get("交给凯恩"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10440}],
                  action =
                      [{play_plot, 10500},
                       {trigger_del, 10486},
                       {trigger_open, 10495}]};
get(10495) ->
    #plot_trigger{id = 10495, name = lang:get("望远镜"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10455}],
                  action =
                      [{play_plot, 10502},
                       {trigger_del, 10490},
                       {trigger_open, 10496}]};
get(10496) ->
    #plot_trigger{id = 10496, name = lang:get("打海盗探子"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10002], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20152}],
                  action =
                      [{play_plot, 10504},
                       {trigger_del, 10495},
                       {trigger_open, 10500},
                       {kill_npc, 40140}]};
get(10500) ->
    #plot_trigger{id = 10500, name = lang:get("击败马丁"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10002], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20161}],
                  action =
                      [{play_plot, 10510},
                       {trigger_del, 10496},
                       {trigger_open, 10502},
                       {kill_npc, 40150}]};
get(10502) ->
    #plot_trigger{id = 10502, name = lang:get("休整"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10002], off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40150}],
                  action =
                      [{play_plot, 10512},
                       {trigger_del, 10500},
                       {trigger_open, 10504}]};
get(10504) ->
    #plot_trigger{id = 10504, name = lang:get("劫囚2"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10002], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20162}],
                  action =
                      [{play_plot, 10514},
                       {trigger_del, 10502},
                       {trigger_open, 10510},
                       {kill_npc, 40160}]};
get(10510) ->
    #plot_trigger{id = 10510, name = lang:get("俘虏"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 28, lev = 1, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10475}],
                  action =
                      [{play_plot, 10520},
                       {trigger_del, 10504},
                       {trigger_open, 10520}]};
get(10520) ->
    #plot_trigger{id = 10520, name = lang:get("精灵长老"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10004], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10486}],
                  action =
                      [{play_plot, 10530},
                       {trigger_del, 10510},
                       {trigger_open, 10534}]};
get(10534) ->
    #plot_trigger{id = 10534, name = lang:get("魔的分身"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10494}],
                  action =
                      [{play_plot, 10550},
                       {trigger_del, 10520},
                       {trigger_open, 10540},
                       {kill_npc, 40058}]};
get(10540) ->
    #plot_trigger{id = 10540, name = lang:get("梦魇之王"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10004], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10490}],
                  action =
                      [{play_plot, 10560},
                       {plot_unit_create,
                        10230,
                        40044,
                        "马丁",
                        {point, 10001, 3142, 1485},
                        0,
                        "dead",
                        1,
                        []},
                       {trigger_del, 10534},
                       {trigger_open, 10550}]};
get(10550) ->
    #plot_trigger{id = 10550, name = lang:get("梦杀"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10510}],
                  action =
                      [{plot_unit_create,
                        10220,
                        40058,
                        "魔",
                        {point, 10001, 2374, 1741},
                        5,
                        "stand",
                        1,
                        []},
                       {play_plot, 10570},
                       {plot_unit_create,
                        10240,
                        40059,
                        "梦境之门",
                        {point, 10001, 3142, 1485},
                        0,
                        "stand",
                        1,
                        []},
                       {play_plot, 10590},
                       {plot_unit_del, 10220},
                       {trigger_del, 10540},
                       {trigger_open, 10560}]};
get(10560) ->
    #plot_trigger{id = 10560, name = lang:get("梦杀完成"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10001], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10510}],
                  action =
                      [{trigger_del, 10550},
                       {plot_unit_del, 10245},
                       {play_plot, 10600}]};
get(10574) ->
    #plot_trigger{id = 10574, name = lang:get("封口"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10521}],
                  action = [{play_plot, 10614}, {trigger_open, 10576}]};
get(10576) ->
    #plot_trigger{id = 10576, name = lang:get("空白信纸"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10524}],
                  action =
                      [{play_plot, 10616},
                       {trigger_del, 10574},
                       {trigger_open, 10578}]};
get(10578) ->
    #plot_trigger{id = 10578, name = lang:get("古文字典"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10528}],
                  action =
                      [{play_plot, 10618},
                       {trigger_del, 10576},
                       {trigger_open, 10580}]};
get(10580) ->
    #plot_trigger{id = 10580, name = lang:get("获得消息2"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10530}],
                  action =
                      [{play_plot, 10620},
                       {trigger_del, 10576},
                       {trigger_open, 10590}]};
get(10585) ->
    #plot_trigger{id = 10585, name = lang:get("暗号"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10540}],
                  action =
                      [{play_plot, 10625},
                       {trigger_del, 10580},
                       {trigger_open, 10590}]};
get(10590) ->
    #plot_trigger{id = 10590, name = lang:get("接头"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10002], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20196}],
                  action =
                      [{play_plot, 10630},
                       {trigger_del, 10585},
                       {trigger_open, 10600},
                       {kill_npc, 20196}]};
get(10600) ->
    #plot_trigger{id = 10600, name = lang:get("干掉接touren"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10002], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10540}],
                  action =
                      [{play_plot, 10640},
                       {inter_monologue,
                        0,
                        0,
                        "",
                        "奇怪，说马丁<color='#66ff00'>在监督学院中的某人</color>，这人是谁呢？",
                        3000},
                       {trigger_del, 10590},
                       {trigger_open, 10610}]};
get(10610) ->
    #plot_trigger{id = 10610, name = lang:get("飞瀑村接头"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10003], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 10260}],
                  action =
                      [{play_plot, 10650},
                       {trigger_del, 10600},
                       {trigger_open, 10620},
                       {kill_npc, 40250}]};
get(10620) ->
    #plot_trigger{id = 10620, name = lang:get("接货"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, maps = [10003], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 10270}],
                  action =
                      [{play_plot, 10660},
                       {trigger_del, 10610},
                       {trigger_open, 10630},
                       {kill_npc, 40064}]};
get(10624) ->
    #plot_trigger{id = 10624, name = lang:get("星辰石【耀阳】"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 1, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10564}],
                  action =
                      [{play_plot, 10664},
                       {trigger_del, 10620},
                       {inter_monologue,
                        0,
                        0,
                        "",
                        "第三块星辰石获得，还差四块，得继续加油啊！",
                        3000},
                       {trigger_open, 10640}]};
get(10640) ->
    #plot_trigger{id = 10640, name = lang:get("建立伊芙"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 44, maps = [10001], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10568}],
                  action =
                      [{play_plot, 10670},
                       {inter_monologue,
                        0,
                        0,
                        "",
                        "想不到极北之域还埋藏着一块<color='#66ff00'>星辰石</color>！叫上伊"
                        "芙，一定要抢到！",
                        3000},
                       {trigger_del, 10620},
                       {trigger_open, 10650}]};
get(10650) ->
    #plot_trigger{id = 10650, name = lang:get("找到伊芙"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 44, maps = [10001], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20201}],
                  action =
                      [{play_plot, 10680},
                       {trigger_del, 10640},
                       {trigger_open, 10660}]};
get(10660) ->
    #plot_trigger{id = 10660, name = lang:get("找到伊芙"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 44, maps = [10007], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10590}],
                  action =
                      [{play_plot, 10690},
                       {trigger_del, 10650},
                       {trigger_open, 10670}]};
get(10670) ->
    #plot_trigger{id = 10670, name = lang:get("调查妖精"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 44, maps = [10007], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10600}],
                  action =
                      [{play_plot, 10700},
                       {trigger_del, 10660},
                       {trigger_open, 10680}]};
get(10680) ->
    #plot_trigger{id = 10680, name = lang:get("熔岩领主"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 44, maps = [10007], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40295}],
                  action =
                      [{play_plot, 10710},
                       {trigger_del, 10670},
                       {trigger_open, 10690}]};
get(10690) ->
    #plot_trigger{id = 10690, name = lang:get("打垮魔熊"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 44, maps = [10007], off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40300}],
                  action =
                      [{play_plot, 10720},
                       {trigger_del, 10680},
                       {trigger_open, 10700}]};
get(10700) ->
    #plot_trigger{id = 10700, name = lang:get("世仇"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 47, maps = [10007], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10660}],
                  action =
                      [{play_plot, 10730},
                       {trigger_del, 10690},
                       {trigger_open, 10710}]};
get(10710) ->
    #plot_trigger{id = 10710, name = lang:get("拷问是女"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 47, maps = [50011], off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40310}],
                  action =
                      [{play_plot, 10740},
                       {trigger_del, 10700},
                       {trigger_open, 10720}]};
get(10720) ->
    #plot_trigger{id = 10720, name = lang:get("巨人之血"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 47, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10710}],
                  action =
                      [{play_plot, 10750},
                       {trigger_del, 10710},
                       {trigger_open, 10730}]};
get(10730) ->
    #plot_trigger{id = 10730, name = lang:get("苏醒的熔岩领主"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 47, off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40340}],
                  action = [{play_plot, 10760}, {trigger_del, 10720}]};
get(10740) ->
    #plot_trigger{id = 10740, name = lang:get("领主的召唤"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 50, maps = [10007], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10750}],
                  action =
                      [{play_plot, 10770},
                       {trigger_del, 10730},
                       {trigger_open, 10750}]};
get(10750) ->
    #plot_trigger{id = 10750, name = lang:get("解救部下"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 50, maps = [10007], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10750}],
                  action =
                      [{play_plot, 10780},
                       {trigger_del, 10740},
                       {trigger_open, 10760}]};
get(10760) ->
    #plot_trigger{id = 10760, name = lang:get("王子不在"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 50, maps = [10007], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10760}],
                  action =
                      [{play_plot, 10790},
                       {trigger_del, 10750},
                       {trigger_open, 10770}]};
get(10770) ->
    #plot_trigger{id = 10770, name = lang:get("伊芙被劫"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 50, maps = [10007], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10770}],
                  action =
                      [{play_plot, 10800},
                       {trigger_del, 10760},
                       {trigger_open, 10780}]};
get(10780) ->
    #plot_trigger{id = 10780, name = lang:get("水晶来历"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 50, maps = [10001], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10790}],
                  action =
                      [{play_plot, 10810},
                       {trigger_del, 10770},
                       {trigger_open, 10790}]};
get(10790) ->
    #plot_trigger{id = 10790, name = lang:get("暗杀叮叮当"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 50, maps = [10001], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20340}],
                  action =
                      [{play_plot, 10820},
                       {trigger_del, 10780},
                       {trigger_open, 10800}]};
get(10800) ->
    #plot_trigger{id = 10800, name = lang:get("阴影踪迹"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 50, maps = [10001], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10800}],
                  action =
                      [{play_plot, 10830},
                       {trigger_del, 10790},
                       {trigger_open, 10810}]};
get(10810) ->
    #plot_trigger{id = 10810, name = lang:get("封锁线"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 50, maps = [10007], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10810}],
                  action =
                      [{play_plot, 10840},
                       {trigger_del, 10800},
                       {trigger_open, 10820}]};
get(10820) ->
    #plot_trigger{id = 10820, name = lang:get("领主离开"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 50, maps = [10007], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10830}],
                  action =
                      [{play_plot, 10850},
                       {trigger_del, 10810},
                       {trigger_open, 10830}]};
get(10830) ->
    #plot_trigger{id = 10830, name = lang:get("解释药剂"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 53, maps = [10001], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10920}],
                  action =
                      [{play_plot, 10860},
                       {trigger_del, 10820},
                       {trigger_open, 10840}]};
get(10840) ->
    #plot_trigger{id = 10840, name = lang:get("伪装"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 53, maps = [10003], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10930}],
                  action =
                      [{play_plot, 10870},
                       {add_buff, 30001},
                       {play_plot, 10880},
                       {trigger_del, 10830},
                       {trigger_open, 10850}]};
get(10850) ->
    #plot_trigger{id = 10850, name = lang:get("拷问"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 53, maps = [10003], off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40420}],
                  action =
                      [{play_plot, 10890},
                       {del_buff, 30001},
                       {trigger_del, 10840},
                       {trigger_open, 10860}]};
get(10860) ->
    #plot_trigger{id = 10860, name = lang:get("阴影兵长"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 53, maps = [10003], off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20390}],
                  action = [{play_plot, 10900}, {trigger_del, 10850}]};
get(10870) ->
    #plot_trigger{id = 10870, name = lang:get("吐真剂"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 56, maps = [10004], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10990}],
                  action =
                      [{play_plot, 10910},
                       {trigger_del, 10860},
                       {trigger_open, 10880}]};
get(10880) ->
    #plot_trigger{id = 10880, name = lang:get("拷问断后"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 56, maps = [10004], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 10990}],
                  action =
                      [{play_plot, 10920},
                       {trigger_del, 10870},
                       {trigger_open, 10890}]};
get(10890) ->
    #plot_trigger{id = 10890, name = lang:get("指向妖姬"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 56, maps = [10002], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 11010}],
                  action =
                      [{play_plot, 10930},
                       {trigger_del, 10880},
                       {trigger_open, 10900}]};
get(10900) ->
    #plot_trigger{id = 10900, name = lang:get("馋鬼的任务"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 56, maps = [10002], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 11030}],
                  action =
                      [{play_plot, 10940},
                       {trigger_del, 10890},
                       {trigger_open, 10910}]};
get(10910) ->
    #plot_trigger{id = 10910, name = lang:get("指向老渔夫"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 56, maps = [10002], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 11030}],
                  action =
                      [{play_plot, 10950},
                       {trigger_del, 10900},
                       {trigger_open, 10920}]};
get(10920) ->
    #plot_trigger{id = 10920, name = lang:get("向飞瀑村前进"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 56, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 11050}],
                  action =
                      [{inter_monologue, 0, 0, "", "要去飞瀑村？希望我能赶得上他们！", 3000},
                       {plot_unit_create,
                        10350,
                        40000,
                        "伊芙",
                        {point, 10003, 2427, 382},
                        1,
                        "stand",
                        1,
                        []},
                       {trigger_del, 10910},
                       {trigger_open, 10930}]};
get(10930) ->
    #plot_trigger{id = 10930, name = lang:get("救出伊芙"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 56, maps = [10003], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 11050}],
                  action =
                      [{play_plot, 10960},
                       {plot_unit_del, 10350},
                       {trigger_del, 10920}]};
get(10940) ->
    #plot_trigger{id = 10940, name = lang:get("对话伊芙"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 59, maps = [10001], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20460}],
                  action =
                      [{play_plot, 10970},
                       {trigger_del, 10930},
                       {trigger_open, 10950}]};
get(10950) ->
    #plot_trigger{id = 10950, name = lang:get("伊芙的秘密"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 59, maps = [10001], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 11090}],
                  action =
                      [{play_plot, 10980},
                       {trigger_del, 10940},
                       {trigger_open, 10960}]};
get(10960) ->
    #plot_trigger{id = 10960, name = lang:get("侦查"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 59, maps = [10002], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 11100}],
                  action =
                      [{play_plot, 10990},
                       {trigger_del, 10950},
                       {trigger_open, 10970}]};
get(10970) ->
    #plot_trigger{id = 10970, name = lang:get("地心钻探"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 59, maps = [10002], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 11130}],
                  action =
                      [{play_plot, 11000},
                       {trigger_del, 10960},
                       {trigger_open, 10980}]};
get(10980) ->
    #plot_trigger{id = 10980, name = lang:get("挖掘暮雪"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 59, maps = [10002], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20511}],
                  action =
                      [{play_plot, 11010},
                       {trigger_del, 10970},
                       {trigger_open, 10990}]};
get(10990) ->
    #plot_trigger{id = 10990, name = lang:get("挖出暮雪"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 59, maps = [10004], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 11170}],
                  action = [{play_plot, 11020}, {trigger_del, 10980}]};
get(11000) ->
    #plot_trigger{id = 11000, name = lang:get("伊芙的求助"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 62, maps = [10001], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20530}],
                  action = [{play_plot, 11030}, {trigger_open, 11010}]};
get(11010) ->
    #plot_trigger{id = 11010, name = lang:get("安置监视装置"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 62, maps = [10001], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20560}],
                  action =
                      [{play_plot, 11040},
                       {trigger_del, 11000},
                       {trigger_open, 11020}]};
get(11020) ->
    #plot_trigger{id = 11020, name = lang:get("监视"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 62, maps = [10001], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 11220}],
                  action =
                      [{play_plot, 11050},
                       {trigger_del, 11010},
                       {trigger_open, 11030}]};
get(11030) ->
    #plot_trigger{id = 11030, name = lang:get("交易"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 62, maps = [10001], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 11250}],
                  action =
                      [{play_plot, 11060},
                       {trigger_del, 11020},
                       {trigger_open, 11040}]};
get(11040) ->
    #plot_trigger{id = 11040, name = lang:get("精灵宝箱"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 62, maps = [10001], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20601}],
                  action =
                      [{play_plot, 11070},
                       {trigger_del, 11030},
                       {trigger_open, 11050}]};
get(11050) ->
    #plot_trigger{id = 11050, name = lang:get("鉴定宝箱"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 62, maps = [10004], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 11276}],
                  action =
                      [{play_plot, 11080},
                       {trigger_del, 11040},
                       {trigger_open, 11060}]};
get(11060) ->
    #plot_trigger{id = 11060, name = lang:get("击败守护者"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 62, maps = [10004], off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40620}],
                  action = [{play_plot, 11090}, {trigger_del, 11050}]};
get(11070) ->
    #plot_trigger{id = 11070, name = lang:get("导师讲述院长"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 65, maps = [10001], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 11310}],
                  action = [{play_plot, 11100}, {trigger_open, 11080}]};
get(11080) ->
    #plot_trigger{id = 11080, name = lang:get("剪烛夜话"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 65, maps = [10003], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 11320}],
                  action =
                      [{play_plot, 11110},
                       {trigger_del, 11070},
                       {trigger_open, 11090}]};
get(11090) ->
    #plot_trigger{id = 11090, name = lang:get("福波斯"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 65, maps = [10003], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 11330}],
                  action =
                      [{play_plot, 11120},
                       {trigger_del, 11080},
                       {trigger_open, 11100}]};
get(11100) ->
    #plot_trigger{id = 11100, name = lang:get("往年秘辛"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 65, maps = [10004], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 11340}],
                  action =
                      [{play_plot, 11130},
                       {trigger_del, 11090},
                       {trigger_open, 11110}]};
get(11110) ->
    #plot_trigger{id = 11110, name = lang:get("上古英灵"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 65, maps = [10004], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 20640}],
                  action =
                      [{play_plot, 11140},
                       {trigger_del, 11100},
                       {trigger_open, 11120}]};
get(11120) ->
    #plot_trigger{id = 11120, name = lang:get("摘星者线索"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 65, maps = [10004], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 11360}],
                  action = [{play_plot, 11150}, {trigger_del, 11110}]};
get(11130) ->
    #plot_trigger{id = 11130, name = lang:get("拷问近卫"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 65, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 11390}],
                  action =
                      [{plot_unit_create,
                        10480,
                        10007,
                        "隐秘之门",
                        {point, 50022, 200, 2332},
                        0,
                        "stand",
                        1,
                        []},
                       {play_plot, 11160},
                       {trigger_del, 11120},
                       {trigger_open, 11140},
                       {trigger_open, 11150}]};
get(11140) ->
    #plot_trigger{id = 11140, name = lang:get("传送"),
                  status = 0, type = 1, can_skip = 0, hide_layer = 0,
                  num = 0, lev = 65, maps = [50022], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 10480}],
                  action = [{goto, {point, 20001, 571, 1583}}]};
get(11150) ->
    #plot_trigger{id = 11150, name = lang:get("院长情报"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 65, maps = [20001], off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40660}],
                  action =
                      [{play_plot, 11170},
                       {trigger_del, 11130},
                       {trigger_del, 11140}]};
get(11152) ->
    #plot_trigger{id = 11152, name = lang:get("导师的思路"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 68, maps = [10001], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 11420}],
                  action =
                      [{play_plot, 11172},
                       {trigger_del, 11150},
                       {trigger_open, 11154}]};
get(11154) ->
    #plot_trigger{id = 11154, name = lang:get("伪装的使者"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 68, maps = [10001], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 11450}],
                  action =
                      [{play_plot, 11174},
                       {trigger_del, 11152},
                       {trigger_open, 11156}]};
get(11156) ->
    #plot_trigger{id = 11156, name = lang:get("打垮教授使者"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 68, maps = [10001], off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40670}],
                  action =
                      [{play_plot, 11176},
                       {trigger_del, 11154},
                       {trigger_open, 11160}]};
get(11160) ->
    #plot_trigger{id = 11160, name = lang:get("龙血剑灵"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 68, maps = [10007], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 11510}],
                  action =
                      [{play_plot, 11180},
                       {trigger_del, 11156},
                       {trigger_open, 11162}]};
get(11162) ->
    #plot_trigger{id = 11162, name = lang:get("打垮剑灵"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 68, maps = [10007], off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40700}],
                  action = [{play_plot, 11182}, {trigger_del, 11156}]};
get(11170) ->
    #plot_trigger{id = 11170, name = lang:get("怀疑教授"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 71, maps = [10001], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 11580}],
                  action =
                      [{play_plot, 11190},
                       {trigger_del, 11160},
                       {trigger_open, 11172}]};
get(11172) ->
    #plot_trigger{id = 11172, name = lang:get("打垮隐形人"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 71, maps = [10002], off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40730}],
                  action =
                      [{play_plot, 11192},
                       {trigger_del, 11170},
                       {trigger_open, 11180}]};
get(11180) ->
    #plot_trigger{id = 11180, name = lang:get("请求验证"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 71, maps = [10001], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 11600}],
                  action =
                      [{play_plot, 11200},
                       {trigger_del, 11172},
                       {trigger_open, 11190}]};
get(11190) ->
    #plot_trigger{id = 11190, name = lang:get("拷问情报"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 71, maps = [10001], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 11640}],
                  action =
                      [{play_plot, 11210},
                       {trigger_del, 11180},
                       {trigger_open, 11192}]};
get(11192) ->
    #plot_trigger{id = 11192, name = lang:get("打垮无面"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 71, maps = [50023], off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40750}],
                  action = [{play_plot, 11212}, {trigger_del, 11190}]};
get(11200) ->
    #plot_trigger{id = 11200, name = lang:get("争议的情报"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 74, maps = [10001], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 11660}],
                  action =
                      [{play_plot, 11220},
                       {trigger_del, 11192},
                       {trigger_open, 11210}]};
get(11210) ->
    #plot_trigger{id = 11210, name = lang:get("导师的意见"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 74, maps = [10001], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 11670}],
                  action =
                      [{play_plot, 11230},
                       {trigger_del, 11200},
                       {trigger_open, 11212}]};
get(11212) ->
    #plot_trigger{id = 11212, name = lang:get("打劫宝库"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 74, maps = [10004], off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40770}],
                  action =
                      [{play_plot, 11232},
                       {trigger_del, 11210},
                       {trigger_open, 11220}]};
get(11220) ->
    #plot_trigger{id = 11220, name = lang:get("龙诞香的来历"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 74, maps = [10004], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 11740}],
                  action =
                      [{play_plot, 11240},
                       {trigger_del, 11212},
                       {trigger_open, 11224}]};
get(11224) ->
    #plot_trigger{id = 11224, name = lang:get("引诱风暴主宰"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 74, maps = [50023], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 11750}],
                  action =
                      [{play_plot, 11244},
                       {trigger_del, 11220},
                       {trigger_open, 11226}]};
get(11226) ->
    #plot_trigger{id = 11226, name = lang:get("打垮风暴主宰"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 74, maps = [50023], off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40810}],
                  action = [{play_plot, 11246}, {trigger_del, 11224}]};
get(11230) ->
    #plot_trigger{id = 11230, name = lang:get("德林的办法"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 77, maps = [10001], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 11780}],
                  action =
                      [{play_plot, 11250},
                       {trigger_del, 11224},
                       {trigger_open, 11232}]};
get(11232) ->
    #plot_trigger{id = 11232, name = lang:get("打垮督军"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 77, maps = [10003], off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40830}],
                  action =
                      [{play_plot, 11252},
                       {trigger_del, 11230},
                       {trigger_open, 11240}]};
get(11240) ->
    #plot_trigger{id = 11240, name = lang:get("肖恩之死"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 77, maps = [10001], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 11910}],
                  action =
                      [{play_plot, 11260},
                       {trigger_del, 11230},
                       {trigger_open, 11250}]};
get(11250) ->
    #plot_trigger{id = 11250, name = lang:get("打垮教授"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 77, maps = [10001], off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40850}],
                  action = [{play_plot, 11270}, {trigger_del, 11240}]};
get(11260) ->
    #plot_trigger{id = 11260, name = lang:get("安妮的召唤"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 80, maps = [10001], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 11930}],
                  action =
                      [{play_plot, 11280},
                       {trigger_del, 11250},
                       {trigger_open, 11270}]};
get(11270) ->
    #plot_trigger{id = 11270, name = lang:get("德林嘱咐"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 80, maps = [10001], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 11940}],
                  action =
                      [{play_plot, 11290},
                       {trigger_del, 11260},
                       {trigger_open, 11280}]};
get(11280) ->
    #plot_trigger{id = 11280, name = lang:get("流浪商人会面"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 80, maps = [50011], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 11990}],
                  action =
                      [{play_plot, 11300},
                       {trigger_del, 11270},
                       {trigger_open, 11290}]};
get(11290) ->
    #plot_trigger{id = 11290, name = lang:get("获得信件"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 80, off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40860}],
                  action =
                      [{play_plot, 11310},
                       {trigger_del, 11280},
                       {trigger_open, 11300}]};
get(11300) ->
    #plot_trigger{id = 11300, name = lang:get("洗掉记忆"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 80, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12000}],
                  action =
                      [{play_plot, 11320},
                       {trigger_del, 11290},
                       {trigger_open, 11310}]};
get(11310) ->
    #plot_trigger{id = 11310, name = lang:get("德林要杀流浪"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 80, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12030}],
                  action =
                      [{play_plot, 11330},
                       {trigger_del, 11300},
                       {trigger_open, 11320}]};
get(11320) ->
    #plot_trigger{id = 11320, name = lang:get("流浪变身"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 80, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12040}],
                  action = [{play_plot, 11340}, {trigger_del, 11310}]};
get(11330) ->
    #plot_trigger{id = 11330, name = lang:get("找人伪装肖恩"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 82, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12060}],
                  action =
                      [{play_plot, 11350},
                       {trigger_del, 11320},
                       {trigger_open, 11340}]};
get(11340) ->
    #plot_trigger{id = 11340, name = lang:get("大可的试炼"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 82, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12090}],
                  action =
                      [{play_plot, 11360},
                       {trigger_del, 11330},
                       {trigger_open, 11350}]};
get(11350) ->
    #plot_trigger{id = 11350, name = lang:get("大可的认可"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 82, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12100}],
                  action =
                      [{play_plot, 11370},
                       {trigger_del, 11340},
                       {trigger_open, 11360}]};
get(11360) ->
    #plot_trigger{id = 11360, name = lang:get("时空能量药剂"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 82, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12110}],
                  action =
                      [{play_plot, 11380},
                       {trigger_del, 11350},
                       {trigger_open, 11370}]};
get(11370) ->
    #plot_trigger{id = 11370, name = lang:get("唤醒位面守望者"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 82, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12160}],
                  action =
                      [{play_plot, 11390},
                       {trigger_del, 11360},
                       {trigger_open, 11380}]};
get(11380) ->
    #plot_trigger{id = 11380, name = lang:get("通道"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 82, off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40890}],
                  action = [{play_plot, 11400}, {trigger_del, 11370}]};
get(11390) ->
    #plot_trigger{id = 11390, name = lang:get("守望者出问题"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 85, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12190}],
                  action =
                      [{play_plot, 11410},
                       {trigger_del, 11380},
                       {trigger_open, 11400}]};
get(11400) ->
    #plot_trigger{id = 11400, name = lang:get("位面通道"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 85, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12200}],
                  action =
                      [{play_plot, 11420},
                       {trigger_del, 11390},
                       {trigger_open, 11410}]};
get(11404) ->
    #plot_trigger{id = 11404, name = lang:get("传送到位面中转站"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 0, lev = 85, off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40898}],
                  action =
                      [{goto, {point, 20002, 577, 1696}},
                       {quest_finish, 12200}]};
get(11410) ->
    #plot_trigger{id = 11410, name = lang:get("位面中转站"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 85, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12210}],
                  action =
                      [{play_plot, 11430},
                       {trigger_del, 11400},
                       {trigger_open, 11420}]};
get(11420) ->
    #plot_trigger{id = 11420, name = lang:get("杀雷霆战神"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 85, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12220}],
                  action =
                      [{play_plot, 11440},
                       {trigger_del, 11410},
                       {trigger_open, 11430},
                       {trigger_open, 11428},
                       {trigger_open, 11427},
                       {trigger_open, 11426}]};
get(11426) ->
    #plot_trigger{id = 11426, name = lang:get("开启位面之钥1"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 85, off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40906}],
                  action = [{play_plot, 11446}]};
get(11427) ->
    #plot_trigger{id = 11427, name = lang:get("开启位面之钥2"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 85, off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40907}],
                  action = [{play_plot, 11447}]};
get(11428) ->
    #plot_trigger{id = 11428, name = lang:get("开启位面之钥3"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 85, off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40908}],
                  action = [{play_plot, 11448}]};
get(11430) ->
    #plot_trigger{id = 11430, name = lang:get("开启通道"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 85, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12240}],
                  action =
                      [{play_plot, 11450},
                       {trigger_del, 11420},
                       {trigger_del, 11426},
                       {trigger_del, 11427},
                       {trigger_del, 11428},
                       {trigger_open, 11440}]};
get(11434) ->
    #plot_trigger{id = 11434, name = lang:get("传送到花果山"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 0, lev = 85, off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40909}],
                  action =
                      [{goto, {point, 20003, 730, 1663}},
                       {quest_finish, 12240}]};
get(11440) ->
    #plot_trigger{id = 11440, name = lang:get("遭遇战"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 85, maps = [20003], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12250}],
                  action =
                      [{play_plot, 11460},
                       {trigger_del, 11430},
                       {trigger_open, 11450}]};
get(11450) ->
    #plot_trigger{id = 11450, name = lang:get("二师兄出现"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 85, maps = [20003], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12260}],
                  action =
                      [{play_plot, 11470},
                       {trigger_del, 11440},
                       {trigger_open, 11460}]};
get(11460) ->
    #plot_trigger{id = 11460, name = lang:get("打完二师兄"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 85, maps = [20003], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12270}],
                  action = [{play_plot, 11480}, {trigger_del, 11450}]};
get(11470) ->
    #plot_trigger{id = 11470, name = lang:get("目击者"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 88, maps = [50031], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12320}],
                  action =
                      [{play_plot, 11490},
                       {trigger_del, 11460},
                       {trigger_open, 11480}]};
get(11480) ->
    #plot_trigger{id = 11480, name = lang:get("月之圣水"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 88, maps = [10003], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 21040}],
                  action =
                      [{play_plot, 11500},
                       {trigger_del, 11470},
                       {trigger_open, 11490}]};
get(11490) ->
    #plot_trigger{id = 11490, name = lang:get("月光女神"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 88, maps = [50031], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12360}],
                  action =
                      [{play_plot, 11510},
                       {trigger_del, 11480},
                       {trigger_open, 11500}]};
get(11500) ->
    #plot_trigger{id = 11500, name = lang:get("打垮月光女神"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 88, maps = [50031], off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40920}],
                  action =
                      [{play_plot, 11520},
                       {trigger_del, 11490},
                       {trigger_open, 11510}]};
get(11510) ->
    #plot_trigger{id = 11510, name = lang:get("错过"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 88, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12380}],
                  action =
                      [{play_plot, 11530},
                       {trigger_del, 11500},
                       {trigger_open, 11520}]};
get(11520) ->
    #plot_trigger{id = 11520, name = lang:get("猴王遇险"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 88, maps = [50011], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12390}],
                  action =
                      [{play_plot, 11540},
                       {trigger_del, 11510},
                       {trigger_open, 11530}]};
get(11530) ->
    #plot_trigger{id = 11530, name = lang:get("请猴王帮助"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 88, maps = [50011], off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40930}],
                  action =
                      [{play_plot, 11550},
                       {trigger_del, 11520},
                       {trigger_open, 11540}]};
get(11540) ->
    #plot_trigger{id = 11540, name = lang:get("猴王变身"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 88, maps = [10001], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12390}],
                  action = [{play_plot, 11560}, {trigger_del, 11530}]};
get(11550) ->
    #plot_trigger{id = 11550, name = lang:get("房顶之人"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 91, maps = [10001], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12440}],
                  action =
                      [{play_plot, 11570},
                       {trigger_del, 11540},
                       {trigger_open, 11560}]};
get(11560) ->
    #plot_trigger{id = 11560, name = lang:get("血伯爵"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 91, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12450}],
                  action =
                      [{play_plot, 11580},
                       {trigger_del, 11550},
                       {trigger_open, 11570}]};
get(11570) ->
    #plot_trigger{id = 11570, name = lang:get("打垮血伯爵"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 91, maps = [10001], off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40940}],
                  action =
                      [{play_plot, 11590},
                       {trigger_del, 11560},
                       {trigger_open, 11580}]};
get(11580) ->
    #plot_trigger{id = 11580, name = lang:get("审问"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 91, maps = [10001], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12470}],
                  action =
                      [{play_plot, 11600},
                       {trigger_del, 11570},
                       {trigger_open, 11586}]};
get(11586) ->
    #plot_trigger{id = 11586, name = lang:get("决定释放"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 91, maps = [10001], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12480}],
                  action =
                      [{play_plot, 11610},
                       {trigger_del, 11580},
                       {trigger_open, 11590}]};
get(11590) ->
    #plot_trigger{id = 11590, name = lang:get("变身"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 91, maps = [10001], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12480}],
                  action =
                      [{add_buff, 30001},
                       {trigger_del, 11586},
                       {trigger_open, 11600}]};
get(11600) ->
    #plot_trigger{id = 11600, name = lang:get("释放血伯爵"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 91, maps = [10001], off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 40946}],
                  action =
                      [{del_buff, 30001},
                       {add_buff, 30001},
                       {play_plot, 11620},
                       {del_buff, 30001},
                       {trigger_del, 11590},
                       {trigger_open, 11610}]};
get(11610) ->
    #plot_trigger{id = 11610, name = lang:get("会面前"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 91, maps = [10001], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12510}],
                  action =
                      [{play_plot, 11630},
                       {trigger_del, 11600},
                       {trigger_open, 11620}]};
get(11620) ->
    #plot_trigger{id = 11620, name = lang:get("皎月公爵"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 91, maps = [10002], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 21070}],
                  action = [{play_plot, 11640}, {trigger_del, 11610}]};
get(11630) ->
    #plot_trigger{id = 11630, name = lang:get("考验"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 99, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12600}],
                  action =
                      [{play_plot, 11650},
                       {trigger_open, 11640},
                       {trigger_del, 11620}]};
get(11640) ->
    #plot_trigger{id = 11640, name = lang:get("地图隐藏的入口"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 100, maps = [10001], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12620}],
                  action = [{play_plot, 11660}, {trigger_del, 11630}]};
get(11660) ->
    #plot_trigger{id = 11660, name = lang:get("龙人的误会"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 95, maps = [10009], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12670}],
                  action =
                      [{play_plot, 11670},
                       {trigger_del, 11640},
                       {trigger_open, 11670}],
                  lev_break_min_times = 1};
get(11670) ->
    #plot_trigger{id = 11670, name = lang:get("取东西"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 95, maps = [10009], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12710}],
                  action =
                      [{play_plot, 11680},
                       {trigger_del, 11660},
                       {trigger_open, 11680}],
                  lev_break_min_times = 1};
get(11680) ->
    #plot_trigger{id = 11680, name = lang:get("肖恩记忆碎片"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 95, maps = [10009], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 12720}],
                  action =
                      [{play_plot, 11690},
                       {trigger_del, 11670},
                       {trigger_open, 11690}],
                  lev_break_min_times = 1};
get(11690) ->
    #plot_trigger{id = 11690, name = lang:get("巨龙的考验"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 95, maps = [10009], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12740}],
                  action =
                      [{play_plot, 11700},
                       {trigger_del, 11680},
                       {trigger_open, 11700}],
                  lev_break_min_times = 1};
get(11700) ->
    #plot_trigger{id = 11700, name = lang:get("打败巴尼"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 95, maps = [10009], off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 41101}],
                  action =
                      [{play_plot, 11710},
                       {trigger_del, 11690},
                       {trigger_open, 11710}],
                  lev_break_min_times = 1};
get(11710) ->
    #plot_trigger{id = 11710, name = lang:get("德林的疑惑"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 95, maps = [10001], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12750}],
                  action = [{play_plot, 11720}, {trigger_del, 11700}],
                  lev_break_min_times = 1};
get(11720) ->
    #plot_trigger{id = 11720, name = lang:get("新的消息"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 95, maps = [10001], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12760}],
                  action = [{play_plot, 11730}, {trigger_open, 11730}],
                  lev_break_min_times = 1};
get(11730) ->
    #plot_trigger{id = 11730, name = lang:get("风之旅人"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 95, maps = [10002], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12770}],
                  action =
                      [{play_plot, 11740},
                       {trigger_del, 11720},
                       {trigger_open, 11740}],
                  lev_break_min_times = 1};
get(11740) ->
    #plot_trigger{id = 11740, name = lang:get("蛛丝马迹"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 95, maps = [10002], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12790}],
                  action =
                      [{play_plot, 11750},
                       {trigger_del, 11730},
                       {trigger_open, 11750}],
                  lev_break_min_times = 1};
get(11750) ->
    #plot_trigger{id = 11750, name = lang:get("幽冥骑士"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 95, maps = [50013], off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 41114}],
                  action =
                      [{play_plot, 11760},
                       {trigger_del, 11740},
                       {trigger_open, 11760}],
                  lev_break_min_times = 1};
get(11760) ->
    #plot_trigger{id = 11760, name = lang:get("战前准备"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 95, maps = [10002], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12840}],
                  action =
                      [{play_plot, 11770},
                       {trigger_del, 11750},
                       {trigger_open, 11770}],
                  lev_break_min_times = 1};
get(11770) ->
    #plot_trigger{id = 11770, name = lang:get("解开封印"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 95, maps = [20002], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12850}],
                  action =
                      [{play_plot, 11780},
                       {trigger_del, 11760},
                       {trigger_open, 11780}],
                  lev_break_min_times = 1};
get(11780) ->
    #plot_trigger{id = 11780, name = lang:get("封印掌控者"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 95, maps = [20002], off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 41121}],
                  action =
                      [{play_plot, 11790},
                       {trigger_del, 11770},
                       {trigger_open, 11790}],
                  lev_break_min_times = 1};
get(11790) ->
    #plot_trigger{id = 11790, name = lang:get("暗流涌动"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 0,
                  num = 1, lev = 95, maps = [10001], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 12870}],
                  action = [{play_plot, 11800}, {trigger_del, 11780}],
                  lev_break_min_times = 1};
get(30000) ->
    #plot_trigger{id = 30000, name = lang:get("悬赏任务"),
                  status = 1, type = 1, can_skip = 0, hide_layer = 0,
                  num = 1, lev = 19, off_line = 0, event = [{evt_levup}],
                  cond_logic = 'and',
                  condition =
                      [#condition{label = lev, op = eq, val = 20}],
                  action =
                      [{open_sys,
                        [{1000, 14}],
                        "悬赏任务：<color='#00ff00'>战斗</color>胜利后可获得<color="
                        "'#00ff00'>大量经验</color>"},
                       {sound_play, 278, 1}]};
get(30020) ->
    #plot_trigger{id = 30020, name = lang:get("挂机上古妖魔"),
                  status = 1, type = 1, can_skip = 0, hide_layer = 0,
                  num = 1, lev = 24, off_line = 0, event = [{evt_levup}],
                  cond_logic = 'and',
                  condition =
                      [#condition{label = lev, op = eq, val = 25}],
                  action =
                      [{open_sys,
                        [{1014, 14}],
                        "上古妖魔：<color='#00ff00'>挑战</color>上古野怪，可获<color"
                        "='#00ff00'>大量经验</color>与<color='#00ff00'>宠物经验"
                        "</color>"},
                       {trigger_del, 30000},
                       {sound_play, 278, 1}]};
get(30030) ->
    #plot_trigger{id = 30030, name = lang:get("竞技场"),
                  status = 1, type = 1, can_skip = 0, hide_layer = 0,
                  num = 1, lev = 27, off_line = 0, event = [{evt_levup}],
                  cond_logic = 'and',
                  condition =
                      [#condition{label = lev, op = eq, val = 28}],
                  action =
                      [{open_sys,
                        [{28, 28}],
                        "竞技场：<color='#00ff00'>挑战</color>高手，赢取<color='#"
                        "00ff00'>经验</color>、<color='#00ff00'>宠物经验</col"
                        "or>与<color='#00ff00'>星辰积分</color>"},
                       {trigger_del, 30020}]};
get(30040) ->
    #plot_trigger{id = 30040, name = lang:get("宝图任务"),
                  status = 1, type = 1, can_skip = 0, hide_layer = 0,
                  num = 1, lev = 29, off_line = 0, event = [{evt_levup}],
                  cond_logic = 'and',
                  condition =
                      [#condition{label = lev, op = eq, val = 30}],
                  action =
                      [{open_sys,
                        [{1006, 14}],
                        "极寒试炼：<color='#00ff00'>挑战</color>高手，赢取<color='"
                        "#00ff00'>大量银币</color>"},
                       {trigger_del, 30030},
                       {sound_play, 278, 1}]};
get(30045) ->
    #plot_trigger{id = 30045, name = lang:get("宝图任务"),
                  status = 0, type = 1, can_skip = 0, hide_layer = 0,
                  num = 1, lev = 150, off_line = 0, event = [{evt_levup}],
                  cond_logic = 'and',
                  condition =
                      [#condition{label = lev, op = eq, val = 150}],
                  action =
                      [{open_sys,
                        [{1011, 14}],
                        "宝图任务：完成任务可获得<color='#00ff00'>藏宝图</color>"},
                       {trigger_del, 30030},
                       {sound_play, 278, 1}]};
get(30050) ->
    #plot_trigger{id = 30050, name = lang:get("远航商人"),
                  status = 1, type = 1, can_skip = 0, hide_layer = 0,
                  num = 1, lev = 31, off_line = 0, event = [{evt_levup}],
                  cond_logic = 'and',
                  condition =
                      [#condition{label = lev, op = eq, val = 32}],
                  action =
                      [{open_sys,
                        [{1009, 14}],
                        "远航商人：提交任务可获得<color='#00ff00'>大量冒险经验</color>"},
                       {trigger_del, 30040},
                       {sound_play, 278, 1}]};
get(30060) ->
    #plot_trigger{id = 30060, name = lang:get("精灵公主"),
                  status = 0, type = 1, can_skip = 0, hide_layer = 0,
                  num = 1, lev = 150, off_line = 0, event = [{evt_levup}],
                  cond_logic = 'and',
                  condition =
                      [#condition{label = lev, op = eq, val = 150}],
                  action =
                      [{open_sys,
                        [{1026, 14}],
                        "副本：通关副本可获得<color='#00ff00'>装备魂</color>及其它<col"
                        "or='#00ff00'>奖励</color>"},
                       {trigger_del, 30050},
                       {sound_play, 278, 1}]};
get(30070) ->
    #plot_trigger{id = 30070, name = lang:get("锻造"),
                  status = 1, type = 1, can_skip = 0, hide_layer = 0,
                  num = 1, lev = 39, off_line = 0, event = [{evt_levup}],
                  cond_logic = 'and',
                  condition =
                      [#condition{label = lev, op = eq, val = 40}],
                  action =
                      [{open_sys,
                        [{5, 5}],
                        "锻造：开启后可<color='#00ff00'>升级装备</color>"},
                       {trigger_del, 30060},
                       {sound_play, 278, 1}]};
get(30080) ->
    #plot_trigger{id = 30080, name = lang:get("荣耀试炼"),
                  status = 1, type = 1, can_skip = 0, hide_layer = 0,
                  num = 1, lev = 42, off_line = 0, event = [{evt_levup}],
                  cond_logic = 'and',
                  condition =
                      [#condition{label = lev, op = eq, val = 43}],
                  action =
                      [{open_sys,
                        [{1024, 14}],
                        "爵位挑战：<color='#00ff00'>挑战</color>成功可获得<color='"
                        "#00ff00'>称号</color>、<color='#00ff00'>冒险技能加成</"
                        "color>及其它<color='#00ff00'>奖励</color>"},
                       {trigger_del, 30070},
                       {sound_play, 278, 1}]};
get(30090) ->
    #plot_trigger{id = 30090, name = lang:get("天空之塔"),
                  status = 0, type = 1, can_skip = 0, hide_layer = 0,
                  num = 1, lev = 44, off_line = 0, event = [{evt_levup}],
                  cond_logic = 'and',
                  condition =
                      [#condition{label = lev, op = eq, val = 45}],
                  action =
                      [{open_sys,
                        [{1004, 14}],
                        "天空之塔：挑战BOSS可获<color='#00ff00'>星月石</color>及其他<"
                        "color='#00ff00'>奖励</color>"},
                       {trigger_del, 30080},
                       {sound_play, 278, 1}]};
get(30100) ->
    #plot_trigger{id = 30100, name = lang:get("强化"),
                  status = 1, type = 1, can_skip = 0, hide_layer = 0,
                  num = 1, lev = 49, off_line = 0, event = [{evt_levup}],
                  cond_logic = 'and',
                  condition =
                      [#condition{label = lev, op = eq, val = 50}],
                  action =
                      [{open_sys,
                        [{5, 5}],
                        "强化：开启后可<color='#00ff00'>强化装备</color>，提升<color"
                        "='#00ff00'>装备属性</color>"},
                       {trigger_del, 30090},
                       {sound_play, 278, 1}]};
get(30110) ->
    #plot_trigger{id = 30110, name = lang:get("熔火和熔火挑战"),
                  status = 0, type = 1, can_skip = 0, hide_layer = 0,
                  num = 1, lev = 150, off_line = 0, event = [{evt_levup}],
                  cond_logic = 'and',
                  condition =
                      [#condition{label = lev, op = eq, val = 150}],
                  action =
                      [{open_sys,
                        [{3001, 14}],
                        "副本：通关副本可获得<color='#00ff00'>装备魂</color>及其它<col"
                        "or='#00ff00'>奖励</color>"},
                       {trigger_del, 30100},
                       {sound_play, 278, 1}]};
get(30140) ->
    #plot_trigger{id = 30140, name = lang:get("坐骑系统"),
                  status = 1, type = 1, can_skip = 0, hide_layer = 0,
                  num = 1, lev = 77, off_line = 0, event = [{evt_levup}],
                  cond_logic = 'and',
                  condition =
                      [#condition{label = lev, op = eq, val = 78}],
                  action =
                      [{open_sys,
                        [{35, 35}],
                        "坐骑：开启后可孵化并骑乘<color='#00ff00'>坐骑</color>，还可获得<"
                        "color='#00ff00'>属性加成</color>"},
                       {trigger_del, 30110},
                       {sound_play, 278, 1}]};
get(30120) ->
    #plot_trigger{id = 30120, name = lang:get("仓库指引"),
                  status = 1, type = 1, can_skip = 0, hide_layer = 0,
                  num = 1, lev = 30, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 41510}],
                  action = [{play_plot, 30120}, {trigger_del, 30120}]};
get(30130) ->
    #plot_trigger{id = 30130, name = lang:get("捕宠指引"),
                  status = 0, type = 2, can_skip = 0, hide_layer = 0,
                  num = 0, lev = 29, off_line = 0,
                  event = [{evt_combat_round}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 76380}],
                  action = [{guide, 10004}]};
get(30150) ->
    #plot_trigger{id = 30150, name = lang:get("奖励系统"),
                  status = 1, type = 1, can_skip = 0, hide_layer = 0,
                  num = 1, lev = 4, off_line = 0, event = [{evt_levup}],
                  cond_logic = 'and',
                  condition = [#condition{label = lev, op = eq, val = 5}],
                  action =
                      [{open_sys,
                        [{22, 22}],
                        "奖励：开启后可<color='#00ff00'>领取</color>各式<color='#"
                        "00ff00'>奖励</color>"},
                       {sound_play, 278, 1}]};
get(30160) ->
    #plot_trigger{id = 30160, name = lang:get("日程"),
                  status = 0, type = 1, can_skip = 0, hide_layer = 0,
                  num = 1, lev = 16, off_line = 0, event = [{evt_levup}],
                  cond_logic = 'and',
                  condition =
                      [#condition{label = lev, op = eq, val = 17}],
                  action = [{open_sys, [{14, 14}]}]};
get(30170) ->
    #plot_trigger{id = 30170, name = lang:get("宝石镶嵌引导"),
                  status = 1, type = 1, can_skip = 0, hide_layer = 0,
                  num = 1, lev = 40, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 41260}],
                  action = [{play_plot, 30170}, {open_panel, 10600}]};
get(30180) ->
    #plot_trigger{id = 30180, name = lang:get("宝藏迷城"),
                  status = 1, type = 1, can_skip = 0, hide_layer = 0,
                  num = 1, lev = 35, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 41180}],
                  action = [{play_plot, 30180}]};
get(30190) ->
    #plot_trigger{id = 30190, name = lang:get("精灵宝物"),
                  status = 1, type = 1, can_skip = 0, hide_layer = 0,
                  num = 1, lev = 64, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 41750}],
                  action = [{play_plot, 30190}]};
get(30200) ->
    #plot_trigger{id = 30200, name = lang:get("翅膀开启"),
                  status = 1, type = 1, can_skip = 0, hide_layer = 0,
                  num = 1, lev = 11, off_line = 0, event = [{evt_levup}],
                  cond_logic = 'and',
                  condition =
                      [#condition{label = lev, op = eq, val = 13}],
                  action =
                      [{open_sys,
                        [{15, 1}],
                        "翅膀：开启后可升级或进阶<color='#00ff00'>翅膀</color>"},
                       {sound_play, 278, 1},
                       {wait_client, 2500},
                       {play_guide, 10010}]};
get(30300) ->
    #plot_trigger{id = 30300, name = lang:get("护符和符石"),
                  status = 1, type = 1, can_skip = 0, hide_layer = 0,
                  num = 1, lev = 45, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 41529}],
                  action = [{play_plot, 30300}, {open_panel, 10500}]};
get(30400) ->
    #plot_trigger{id = 30400, name = lang:get("了解精炼"),
                  status = 1, type = 1, can_skip = 0, hide_layer = 0,
                  num = 1, lev = 80, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 41639}],
                  action = [{play_plot, 30400}, {open_panel, 10600}]};
get(30500) ->
    #plot_trigger{id = 30500, name = lang:get("了解魂石"),
                  status = 1, type = 1, can_skip = 0, hide_layer = 0,
                  num = 1, lev = 55, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 41852}],
                  action = [{play_plot, 30500}, {open_panel, 10900}]};
get(30600) ->
    #plot_trigger{id = 30600, name = lang:get("了解萌系表情包"),
                  status = 1, type = 1, can_skip = 0, hide_layer = 0,
                  num = 1, lev = 30, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 41900}],
                  action = [{play_plot, 30600}]};
get(30700) ->
    #plot_trigger{id = 30700, name = lang:get("了解坐骑"),
                  status = 1, type = 1, can_skip = 0, hide_layer = 0,
                  num = 1, lev = 30, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 41910}],
                  action = [{play_plot, 30700}, {trigger_open, 30701}]};
get(30701) ->
    #plot_trigger{id = 30701, name = lang:get("呆萌坐骑"),
                  status = 0, type = 1, can_skip = 0, hide_layer = 0,
                  num = 1, lev = 30, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 41912}],
                  action = [{play_plot, 30701}, {trigger_del, 30700}]};
get(41730) ->
    #plot_trigger{id = 41730, name = lang:get("孕育子女"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 68, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 41730}],
                  action = [{play_plot, 41730}]};
get(43000) ->
    #plot_trigger{id = 43000, name = lang:get("失踪的公主"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 33, maps = [10003], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 43000}],
                  action = [{play_plot, 43000}, {trigger_open, 43010}]};
get(43010) ->
    #plot_trigger{id = 43010, name = lang:get("公主的恋人"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 33, maps = [10002], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 43010}],
                  action =
                      [{play_plot, 43010},
                       {trigger_del, 43000},
                       {trigger_open, 43020}]};
get(43020) ->
    #plot_trigger{id = 43020, name = lang:get("利贝尔王子"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 33, maps = [10007], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 43020}],
                  action =
                      [{play_plot, 43020},
                       {trigger_del, 43010},
                       {trigger_open, 43030}]};
get(43030) ->
    #plot_trigger{id = 43030, name = lang:get("风之旅人"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 33, maps = [10002], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 43030}],
                  action =
                      [{play_plot, 43030},
                       {trigger_del, 43020},
                       {trigger_open, 43040}]};
get(43040) ->
    #plot_trigger{id = 43040, name = lang:get("进入飞瀑村"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 33, maps = [10002], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 43050}],
                  action = [{play_plot, 43040}, {trigger_del, 43030}]};
get(43050) ->
    #plot_trigger{id = 43050, name = lang:get("伊芙的邀请"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 42, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 43070}],
                  action =
                      [{play_plot, 43050},
                       {trigger_del, 43040},
                       {trigger_open, 43060}]};
get(43060) ->
    #plot_trigger{id = 43060, name = lang:get("琴雅的心事"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 42, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 43080}],
                  action =
                      [{play_plot, 43060},
                       {trigger_del, 43050},
                       {trigger_open, 43070}]};
get(43070) ->
    #plot_trigger{id = 43070, name = lang:get("花火"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 42, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 43090}],
                  action =
                      [{play_plot, 43070},
                       {trigger_del, 43060},
                       {trigger_open, 43080}]};
get(43080) ->
    #plot_trigger{id = 43080, name = lang:get("出发"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 42, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 43100}],
                  action =
                      [{play_plot, 43080},
                       {trigger_del, 43070},
                       {trigger_open, 43090}]};
get(43090) ->
    #plot_trigger{id = 43090, name = lang:get("风暴之灵"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 42, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 43110}],
                  action =
                      [{play_plot, 43090},
                       {trigger_del, 43080},
                       {trigger_open, 43100}]};
get(43100) ->
    #plot_trigger{id = 43100, name = lang:get("回忆"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 42, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 43120}],
                  action =
                      [{play_plot, 43100},
                       {trigger_del, 43090},
                       {trigger_open, 43110}]};
get(43110) ->
    #plot_trigger{id = 43110, name = lang:get("回忆"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 42, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 43130}],
                  action = [{play_plot, 43110}, {trigger_del, 43100}]};
get(43120) ->
    #plot_trigger{id = 43120, name = lang:get("争吵"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 45, maps = [10007], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 43140}],
                  action = [{play_plot, 43120}, {trigger_open, 43130}]};
get(43130) ->
    #plot_trigger{id = 43130, name = lang:get("侦查"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 45, maps = [10007], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 43160}],
                  action =
                      [{play_plot, 43130},
                       {trigger_del, 43120},
                       {trigger_open, 43140}]};
get(43140) ->
    #plot_trigger{id = 43140, name = lang:get("存粮"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 45, maps = [10007], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 43170}],
                  action =
                      [{play_plot, 43140},
                       {trigger_del, 43130},
                       {trigger_open, 43150}]};
get(43150) ->
    #plot_trigger{id = 43150, name = lang:get("考验"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 45, maps = [10007], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 43180}],
                  action =
                      [{play_plot, 43150},
                       {trigger_del, 43140},
                       {trigger_open, 43160}]};
get(43160) ->
    #plot_trigger{id = 43160, name = lang:get("承认"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 45, maps = [10007], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 43190}],
                  action = [{play_plot, 43160}, {trigger_del, 43150}]};
get(43170) ->
    #plot_trigger{id = 43170, name = lang:get("贤者召唤"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 48, maps = [10003], off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 43200}],
                  action = [{play_plot, 43170}, {trigger_open, 43180}]};
get(43180) ->
    #plot_trigger{id = 43180, name = lang:get("问话1"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 48, maps = [10003], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 43210}],
                  action =
                      [{play_plot, 43180},
                       {trigger_del, 43170},
                       {trigger_open, 43190}]};
get(43190) ->
    #plot_trigger{id = 43190, name = lang:get("问话2"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 48, maps = [10003], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 43220}],
                  action =
                      [{play_plot, 43190},
                       {trigger_del, 43180},
                       {trigger_open, 43200}]};
get(43200) ->
    #plot_trigger{id = 43200, name = lang:get("问话3"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 48, maps = [10003], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 43230}],
                  action = [{play_plot, 43200}, {trigger_del, 43190}]};
get(43204) ->
    #plot_trigger{id = 43204, name = lang:get("生死决断"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 48, maps = [10003], off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 43240}],
                  action = [{play_plot, 43204}, {trigger_del, 43200}]};
get(43210) ->
    #plot_trigger{id = 43210, name = lang:get("生死决断1"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 48, maps = [10003], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 43240}],
                  action =
                      [{play_plot, 43210},
                       {quest_commit, 43240},
                       {quest, 43250},
                       {trigger_del, 43204},
                       {trigger_del, 43211},
                       {trigger_del, 43212}]};
get(43211) ->
    #plot_trigger{id = 43211, name = lang:get("生死决断2"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 48, maps = [10003], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 43241}],
                  action =
                      [{play_plot, 43211},
                       {quest_commit, 43240},
                       {quest, 43255},
                       {trigger_del, 43204},
                       {trigger_del, 43210},
                       {trigger_del, 43212}]};
get(43212) ->
    #plot_trigger{id = 43212, name = lang:get("生死决断3"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 48, maps = [10003], off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 43241}],
                  action =
                      [{play_plot, 43212},
                       {quest_commit, 43240},
                       {quest, 43250},
                       {trigger_del, 43204},
                       {trigger_del, 43210},
                       {trigger_del, 43211}]};
get(44000) ->
    #plot_trigger{id = 44000, name = lang:get("世界突破"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 99, off_line = 0, event = [{evt_levup}],
                  cond_logic = 'and',
                  condition =
                      [#condition{label = lev, op = eq, val = 100}],
                  action =
                      [{play_plot, 44000},
                       {trigger_del, 44002},
                       {trigger_open, 44010}]};
get(44002) ->
    #plot_trigger{id = 44002, name = lang:get("世界突破"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 100, off_line = 0,
                  event = [{evt_cli_loaded}], cond_logic = 'and',
                  action =
                      [{play_plot, 44000},
                       {trigger_del, 44000},
                       {trigger_open, 44010}]};
get(44010) ->
    #plot_trigger{id = 44010, name = lang:get("世界突破2"),
                  status = 0, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 99, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 44000}],
                  action =
                      [{play_plot, 44010},
                       {trigger_del, 44002},
                       {trigger_del, 44000}]};
get(44500) ->
    #plot_trigger{id = 44500, name = lang:get("职业奥秘"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 88, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 44500}],
                  action =
                      [{play_plot, 44500},
                       {trigger_del, 44500},
                       {trigger_open, 44510}]};
get(44510) ->
    #plot_trigger{id = 44510, name = lang:get("终极绝招"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 90, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 44510}],
                  action =
                      [{play_plot, 44510},
                       {trigger_del, 44510},
                       {trigger_open, 44520}]};
get(44520) ->
    #plot_trigger{id = 44520, name = lang:get("遗迹消息"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 90, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 44520}],
                  action =
                      [{play_plot, 44520},
                       {trigger_del, 44520},
                       {trigger_open, 44530}]};
get(44530) ->
    #plot_trigger{id = 44530, name = lang:get("遗迹消息"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 90, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 44530}],
                  action =
                      [{play_plot, 44530},
                       {trigger_del, 44530},
                       {trigger_open, 44531}]};
get(44531) ->
    #plot_trigger{id = 44531, name = lang:get("遗迹消息"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 90, off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 41136}],
                  action =
                      [{play_plot, 44531},
                       {trigger_del, 44531},
                       {trigger_open, 44535}]};
get(44535) ->
    #plot_trigger{id = 44535, name = lang:get("遗迹消息"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 90, off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 41129}],
                  action =
                      [{play_plot, 44535},
                       {trigger_del, 44535},
                       {trigger_open, 44540}]};
get(44540) ->
    #plot_trigger{id = 44540, name = lang:get("遗迹消息"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 90, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 44545}],
                  action =
                      [{play_plot, 44540},
                       {trigger_del, 44540},
                       {trigger_open, 44550}]};
get(44550) ->
    #plot_trigger{id = 44550, name = lang:get("遗迹消息"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 90, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 44550}],
                  action =
                      [{play_plot, 44550},
                       {trigger_del, 44550},
                       {trigger_open, 44560}]};
get(44560) ->
    #plot_trigger{id = 44560, name = lang:get("遗迹消息"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 90, off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 41131}],
                  action =
                      [{play_plot, 44560},
                       {trigger_del, 44560},
                       {trigger_open, 44570}]};
get(44570) ->
    #plot_trigger{id = 44570, name = lang:get("遗迹消息"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 1, lev = 90, off_line = 0,
                  event = [{evt_kill_npc}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_base_id, op = eq,
                                  val = 41132}],
                  action =
                      [{play_plot, 44570},
                       {trigger_del, 44570},
                       {trigger_open, 44580}]};
get(44580) ->
    #plot_trigger{id = 44580, name = lang:get("遗迹消息"),
                  status = 1, type = 1, can_skip = 0, hide_layer = 1,
                  num = 1, lev = 90, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 44580}],
                  action = [{play_plot, 44580}, {trigger_del, 44580}]};
get(50000) ->
    #plot_trigger{id = 50000, name = lang:get("暑假-采集雨露"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 0, lev = 30, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 81200}],
                  action = [{play_plot, 50000}]};
get(50001) ->
    #plot_trigger{id = 50001, name = lang:get("暑假-采集雨露"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 0, lev = 30, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 81201}],
                  action = [{play_plot, 50001}]};
get(50010) ->
    #plot_trigger{id = 50010, name = lang:get("暑假-酋长的签名"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 0, lev = 30, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 81210}],
                  action = [{play_plot, 50010}]};
get(50011) ->
    #plot_trigger{id = 50011, name = lang:get("暑假-酋长的签名"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 0, lev = 30, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 81212}],
                  action = [{play_plot, 50011}]};
get(50020) ->
    #plot_trigger{id = 50020, name = lang:get("暑假-强盗"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 0, lev = 30, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 81220}],
                  action = [{play_plot, 50020}]};
get(50021) ->
    #plot_trigger{id = 50021, name = lang:get("暑假-强盗"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 0, lev = 30, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 81221}],
                  action = [{play_plot, 50021}]};
get(50030) ->
    #plot_trigger{id = 50030, name = lang:get("暑假-美食家"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 0, lev = 30, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 81230}],
                  action = [{play_plot, 50030}]};
get(50031) ->
    #plot_trigger{id = 50031, name = lang:get("暑假-美食家"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 0, lev = 30, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 81232}],
                  action = [{play_plot, 50031}]};
get(50040) ->
    #plot_trigger{id = 50040, name = lang:get("暑假-烟花"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 0, lev = 30, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 81240}],
                  action = [{play_plot, 50040}]};
get(50041) ->
    #plot_trigger{id = 50041, name = lang:get("暑假-烟花"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 0, lev = 30, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 81241}],
                  action = [{play_plot, 50041}]};
get(50042) ->
    #plot_trigger{id = 50042, name = lang:get("暑假-烟花"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 0, lev = 30, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 81242}],
                  action = [{play_plot, 50042}]};
get(50112) ->
    #plot_trigger{id = 50112, name = lang:get("暑假-蛋糕"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 0, lev = 30, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 81313}],
                  action = [{play_plot, 50111}]};
get(60000) ->
    #plot_trigger{id = 60000, name = lang:get("五行修业-探听"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 0, lev = 65, off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 35000}],
                  action =
                      [{add_buff, 30002},
                       {play_plot, 60000},
                       {del_buff, 30002}]};
get(60010) ->
    #plot_trigger{id = 60010, name = lang:get("五行修业-保护"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 0, lev = 65, off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 35010}],
                  action = [{play_plot, 60010}]};
get(82003) ->
    #plot_trigger{id = 82003, name = lang:get("燃放烟花"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 0, lev = 30, off_line = 0,
                  event = [{evt_unit_click}], cond_logic = 'and',
                  condition =
                      [#condition{label = unit_id, op = eq, val = 81242}],
                  action = [{play_plot, 82020}]};
get(83000) ->
    #plot_trigger{id = 83000, name = lang:get("育儿专家"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 0, lev = 68, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 83000}],
                  action = [{play_plot, 83000}]};
get(83001) ->
    #plot_trigger{id = 83001, name = lang:get("育儿专家"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 0, lev = 68, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 83000}],
                  action = [{play_plot, 83001}]};
get(83025) ->
    #plot_trigger{id = 83025, name = lang:get("吃药"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 0, lev = 68, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 83026}],
                  action = [{play_plot, 83025}]};
get(83026) ->
    #plot_trigger{id = 83026, name = lang:get("调养"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 0, lev = 68, off_line = 0,
                  event = [{evt_commit_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 83028}],
                  action = [{play_plot, 83030}]};
get(83100) ->
    #plot_trigger{id = 83100, name = lang:get("购买容器"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 0, lev = 68, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 83100}],
                  action =
                      [{play_plot, 83101},
                       {inter_monologue,
                        0,
                        0,
                        "",
                        "得先去买一只装泉水的<color='#66ff00'>瓶子</color>",
                        2500}]};
get(83110) ->
    #plot_trigger{id = 83110, name = lang:get("采集泉水"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 0, lev = 68, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 83110}],
                  action =
                      [{inter_monologue,
                        0,
                        0,
                        "",
                        "<color='#ffff00'>精灵泉水</color>应该是在<color='#fff"
                        "f00'>精灵之森</color>吧，找找看",
                        2500}]};
get(83120) ->
    #plot_trigger{id = 83120, name = lang:get("浇灌"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 0, lev = 68, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 83120}],
                  action = [{play_plot, 83120}]};
get(83129) ->
    #plot_trigger{id = 83129, name = lang:get("育儿专家"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 0, lev = 68, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 83130}],
                  action = [{play_plot, 83129}]};
get(83130) ->
    #plot_trigger{id = 83130, name = lang:get("育儿专家"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 0, lev = 68, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 83140}],
                  action = [{play_plot, 83130}]};
get(83140) ->
    #plot_trigger{id = 83140, name = lang:get("音乐熏陶"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 0, lev = 68, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 83150}],
                  action = [{play_plot, 83140}]};
get(83160) ->
    #plot_trigger{id = 83160, name = lang:get("禀报杰森"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 0, lev = 68, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 83170}],
                  action = [{play_plot, 83150}]};
get(83165) ->
    #plot_trigger{id = 83165, name = lang:get("禀报杰森"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 0, lev = 68, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 83160}],
                  action =
                      [{inter_monologue,
                        0,
                        0,
                        "",
                        "必须让<color='#ffff00'>杰森队长</color>好好管管这些人！！！",
                        2500}]};
get(83170) ->
    #plot_trigger{id = 83170, name = lang:get("育儿专家"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 0, lev = 68, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 83180}],
                  action = [{play_plot, 83170}]};
get(83180) ->
    #plot_trigger{id = 83180, name = lang:get("育儿专家"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 0, lev = 68, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 83190}],
                  action = [{play_plot, 83180}]};
get(83190) ->
    #plot_trigger{id = 83190, name = lang:get("音乐熏陶"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 0, lev = 68, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 83200}],
                  action = [{play_plot, 83190}]};
get(83200) ->
    #plot_trigger{id = 83200, name = lang:get("禀报杰森"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 0, lev = 68, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 83210}],
                  action =
                      [{inter_monologue,
                        0,
                        0,
                        "",
                        "必须让<color='#ffff00'>杰森队长</color>好好管管这些人！！！",
                        2500}]};
get(83210) ->
    #plot_trigger{id = 83210, name = lang:get("禀报杰森"),
                  status = 1, type = 1, can_skip = 1, hide_layer = 1,
                  num = 0, lev = 68, off_line = 0,
                  event = [{evt_accept_quest}], cond_logic = 'and',
                  condition =
                      [#condition{label = quest_id, op = eq, val = 83220}],
                  action = [{play_plot, 83210}]};
get(_Id) -> {error, not_exists}.

get_guide(10000) ->
    [#condition{label = quest_guide, op = eq, val = 10000}];
get_guide(10001) ->
    [#condition{label = skill_init, op = lt, val = 4}];
get_guide(_Id) -> [].

