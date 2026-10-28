-file("src/battle/battle_dungeon_92.erl", 1).

-module(battle_dungeon_92).

-export([cfg/0, trigger/1]).

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

-file("src/battle/battle_dungeon_92.erl", 14).

-file("inc/condition.hrl", 1).

-record(condition,
        {label :: undefined | atom(),
         op = eq ::
             ue | eq | lt | gt | le | ge | range | include,
         val :: undefined | term(),
         msg = "" :: list()}).

-file("src/battle/battle_dungeon_92.erl", 15).

-file("inc/battle.hrl", 1).

-record(battle_base,
        {id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         sub_id = 0,
         sub_type = 0,
         name :: undefined | atom(),
         pid :: undefined | undefine | pid(),
         global = [] :: list(),
         map = [] :: list(),
         unit = [] :: list(),
         point = [] :: list(),
         trigger = [] :: list(),
         enter_point = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()}}).

-record(battle,
        {id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         sub_id = 0,
         sub_type = 0,
         name :: undefined | atom(),
         pid :: undefined | undefine | pid(),
         map = [] :: list(),
         enter_point = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         ext = [],
         role_id = {0, "", 0}}).

-record(battle_context,
        {grade = 1 :: pos_integer(),
         score = 0 :: non_neg_integer(),
         round = 0 :: non_neg_integer(),
         max_dmg = 0 :: non_neg_integer(),
         hurt = 0 :: non_neg_integer(),
         ratio_val = 0,
         die_num = 0}).

-record(battle_role,
        {id,
         status = 1,
         pid,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer(),
         is_kill_boss = 0 :: 0..1,
         sub_id = 0 :: non_neg_integer(),
         flip_cards = [] :: [],
         has_reward_floor = [],
         context = #battle_context{}}).

-record(battle_combat_info,
        {sub_id = 0, sub_type = 0, gains = []}).

-record(battle_trigger,
        {name :: undefined | bitstring(),
         status = open :: open | close,
         event = [] :: [tuple()],
         vars = [] :: [tuple()],
         condition = [] :: [tuple()],
         action = [] :: list()}).

-record(tri_timer,
        {mode :: undefined | cycle | count,
         times = 0 :: integer(),
         timeout = 1000 :: pos_integer()}).

-record(cfg_act,
        {tpl :: undefined | atom(), cfg = [] :: list()}).

-record(tpl_act,
        {name = "" :: string(),
         type :: undefined | atom(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_cond,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_cond,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_evt,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_evt,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_val,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_val,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_unit,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_unit,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(point,
        {map = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(tpl_fun,
        {name :: undefined | atom(),
         return :: undefined | unit | point,
         args = [] :: [atom()],
         code = "" :: string(),
         mfa_code = "" :: string(),
         label = "" :: string(),
         desc = "" :: string()}).

-file("src/battle/battle_dungeon_92.erl", 16).

-file("inc/unit.hrl", 1).

-record(unit_order,
        {order :: undefined | move | guard | attack | atom(),
         type = 0 :: 0..2,
         arg :: undefined | tuple() | [tuple()],
         data :: undefined | term(),
         condition = [] :: list(),
         over :: undefined | defense | stop | atom()}).

-record(unit_data,
        {id = 0 :: pos_integer(),
         type = 1 :: non_neg_integer(),
         fun_type = 1 :: non_neg_integer(),
         desc = "",
         classes = 0,
         sex = 0,
         lev = 1,
         name = "" :: list(),
         activity = 0 :: 0..1,
         guide_lev = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         nature = 0 :: non_neg_integer(),
         disabled = "" :: bitstring(),
         condition = [] :: [tuple()],
         speed = 120 :: pos_integer(),
         lock = 0 :: 0 | 1,
         t_move = 3 :: pos_integer(),
         t_atk = 3 :: pos_integer(),
         range_trace = 200 :: pos_integer(),
         range_atk = 100 :: pos_integer(),
         gain = [] :: list(),
         formation = 1,
         formation_lev = 1,
         slave = [] :: list(),
         talk = [] :: list(),
         looks = [] :: list(),
         data = [] :: list(),
         def_status = defense :: defense | patrol | loaf}).

-record(unit,
        {id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 0 :: non_neg_integer(),
         type = 1 :: non_neg_integer(),
         fun_type = 1,
         name = "" :: list(),
         pid = 0 :: non_neg_integer() | pid(),
         lev = 1,
         classes = 0,
         sex = 0,
         activity = 0 :: 0..1,
         dun_info :: undefined | {pid(), pos_integer()},
         combat_pid = 0 :: non_neg_integer() | pid(),
         status = 0 :: non_neg_integer(),
         guide_lev = 0 :: non_neg_integer(),
         nature = 0 :: non_neg_integer(),
         disabled = "" :: list(),
         condition = [] :: [tuple()],
         speed = 180 :: pos_integer(),
         lock = 0 :: 0 | 1,
         range_trace = 200 :: pos_integer(),
         range_atk = 100 :: pos_integer(),
         defxy = {0, 0, 0} :: tuple(),
         def_status = defense :: defense | patrol | loaf,
         talk = [] :: list(),
         pos :: undefined | tuple(),
         data :: undefined | term(),
         looks = [] :: [tuple()],
         evt = [] :: [atom()],
         formation = 1,
         formation_lev = 1,
         slave = [] :: list(),
         prop = [] :: [{non_neg_integer(), string()}],
         order = [] :: list(),
         path = [] :: list(),
         ts = {1, 1, 1} ::
             {pos_integer(), pos_integer(), pos_integer()},
         t_move = 3 :: pos_integer(),
         t_atk = 3 :: pos_integer(),
         ai_id = 0,
         ai = {[], []} :: {list(), list()},
         attr,
         role_id = {0, "", 0}}).

-record(map_unit,
        {id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 0 :: non_neg_integer(),
         type = 1 :: pos_integer(),
         activity = 0 :: 0..1,
         status = 0 :: non_neg_integer(),
         classes = 0,
         sex = 0,
         guide_lev = 0 :: non_neg_integer(),
         name = "" :: list(),
         speed = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         gx = 0 :: non_neg_integer(),
         gy = 0 :: non_neg_integer(),
         looks = [] :: [tuple()],
         prop = [] :: [tuple()]}).

-record(plot_unit,
        {id = 0 :: pos_integer(),
         name = "" :: bitstring(),
         base_id = 0 :: non_neg_integer(),
         type = 1,
         fun_type = 1,
         dun_id = 0 :: non_neg_integer(),
         map = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         dir = 0 :: non_neg_integer(),
         act_type = "" :: bitstring(),
         looks = [] :: [tuple()],
         status = 0 :: non_neg_integer(),
         quest_id = 0 :: non_neg_integer(),
         quest_prog_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer()}).

-record(unit_statue,
        {type = 0,
         id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         looks = []}).

-file("src/battle/battle_dungeon_92.erl", 17).

-spec cfg() -> #battle_base{}.

cfg() ->
    #battle_base{id = 1, name = battle_dungeon_92,
                 map =
                     [42001,
                      42002,
                      42003,
                      42004,
                      42005,
                      42006,
                      42007,
                      42008,
                      42009,
                      42010],
                 type = 2, enter_point = {42008, 1572, 1612},
                 unit =
                     [#{type => unit, id => 10081, base => 52085,
                        pos => {42008, 372, 1240},
                        event => [{evt_battle_unit_killed}], disabled => ""},
                      #{type => unit, id => 1, base => 52000,
                        pos => {42001, 861, 1190}, event => [], disabled => ""},
                      #{type => unit, id => 2, base => 52000,
                        pos => {42002, 855, 1190}, event => [], disabled => ""},
                      #{type => unit, id => 3, base => 52000,
                        pos => {42003, 856, 1194}, event => [], disabled => ""},
                      #{type => unit, id => 4, base => 52000,
                        pos => {42004, 857, 1193}, event => [], disabled => ""},
                      #{type => unit, id => 5, base => 52000,
                        pos => {42005, 854, 1195}, event => [], disabled => ""},
                      #{type => unit, id => 6, base => 52000,
                        pos => {42006, 859, 1191}, event => [], disabled => ""},
                      #{type => unit, id => 7, base => 52000,
                        pos => {42007, 850, 1195}, event => [], disabled => ""},
                      #{type => unit, id => 8, base => 52000,
                        pos => {42008, 860, 1192}, event => [], disabled => ""},
                      #{type => unit, id => 9, base => 52000,
                        pos => {42009, 856, 1190}, event => [], disabled => ""},
                      #{type => unit, id => 10, base => 52000,
                        pos => {42010, 859, 1192}, event => [], disabled => ""},
                      #{type => unit, id => 11, base => 52001,
                        pos => {42001, 1122, 1808}, event => [],
                        disabled => ""},
                      #{type => unit, id => 12, base => 52001,
                        pos => {42002, 1125, 1807}, event => [],
                        disabled => ""},
                      #{type => unit, id => 13, base => 52001,
                        pos => {42003, 1124, 1803}, event => [],
                        disabled => ""},
                      #{type => unit, id => 14, base => 52001,
                        pos => {42004, 1126, 1812}, event => [],
                        disabled => ""},
                      #{type => unit, id => 15, base => 52001,
                        pos => {42005, 1125, 1811}, event => [],
                        disabled => ""},
                      #{type => unit, id => 16, base => 52001,
                        pos => {42006, 1123, 1807}, event => [],
                        disabled => ""},
                      #{type => unit, id => 17, base => 52001,
                        pos => {42007, 1125, 1807}, event => [],
                        disabled => ""},
                      #{type => unit, id => 18, base => 52001,
                        pos => {42008, 1123, 1805}, event => [],
                        disabled => ""},
                      #{type => unit, id => 19, base => 52001,
                        pos => {42009, 1123, 1807}, event => [],
                        disabled => ""},
                      #{type => unit, id => 20, base => 52001,
                        pos => {42010, 1123, 1803}, event => [],
                        disabled => ""},
                      #{type => unit, id => 31, base => 52002,
                        pos => {42001, 1632, 635}, event => [], disabled => ""},
                      #{type => unit, id => 32, base => 52002,
                        pos => {42002, 1630, 624}, event => [], disabled => ""},
                      #{type => unit, id => 33, base => 52002,
                        pos => {42003, 1630, 627}, event => [], disabled => ""},
                      #{type => unit, id => 34, base => 52002,
                        pos => {42004, 1631, 625}, event => [], disabled => ""},
                      #{type => unit, id => 35, base => 52002,
                        pos => {42005, 1631, 627}, event => [], disabled => ""},
                      #{type => unit, id => 36, base => 52002,
                        pos => {42006, 1633, 626}, event => [], disabled => ""},
                      #{type => unit, id => 37, base => 52002,
                        pos => {42007, 1631, 627}, event => [], disabled => ""},
                      #{type => unit, id => 38, base => 52002,
                        pos => {42008, 1631, 626}, event => [], disabled => ""},
                      #{type => unit, id => 39, base => 52002,
                        pos => {42009, 1628, 625}, event => [], disabled => ""},
                      #{type => unit, id => 40, base => 52002,
                        pos => {42001, 1631, 625}, event => [], disabled => ""},
                      #{type => unit, id => 41, base => 52003,
                        pos => {42001, 657, 581}, event => [], disabled => ""},
                      #{type => unit, id => 42, base => 52003,
                        pos => {42002, 654, 580}, event => [], disabled => ""},
                      #{type => unit, id => 43, base => 52003,
                        pos => {42003, 657, 583}, event => [], disabled => ""},
                      #{type => unit, id => 44, base => 52003,
                        pos => {42004, 652, 580}, event => [], disabled => ""},
                      #{type => unit, id => 45, base => 52003,
                        pos => {42005, 651, 580}, event => [], disabled => ""},
                      #{type => unit, id => 46, base => 52003,
                        pos => {42006, 0, 0}, event => [], disabled => ""},
                      #{type => unit, id => 47, base => 52003,
                        pos => {42007, 657, 582}, event => [], disabled => ""},
                      #{type => unit, id => 48, base => 52003,
                        pos => {42008, 651, 577}, event => [], disabled => ""},
                      #{type => unit, id => 49, base => 52003,
                        pos => {42009, 655, 577}, event => [], disabled => ""},
                      #{type => unit, id => 50, base => 52003,
                        pos => {42010, 655, 580}, event => [], disabled => ""},
                      #{type => unit, id => 10085011, base => 52201,
                        pos => {42001, 514, 871}, event => [], disabled => ""},
                      #{type => unit, id => 10085021, base => 52202,
                        pos => {42002, 507, 879}, event => [], disabled => ""},
                      #{type => unit, id => 10085031, base => 52203,
                        pos => {42003, 516, 873}, event => [], disabled => ""},
                      #{type => unit, id => 10085041, base => 52204,
                        pos => {42004, 514, 876}, event => [], disabled => ""},
                      #{type => unit, id => 10085051, base => 52205,
                        pos => {42005, 514, 875}, event => [], disabled => ""},
                      #{type => unit, id => 10085061, base => 52206,
                        pos => {42006, 513, 876}, event => [], disabled => ""},
                      #{type => unit, id => 10085071, base => 52207,
                        pos => {42007, 511, 872}, event => [], disabled => ""},
                      #{type => unit, id => 10085081, base => 52208,
                        pos => {42008, 509, 869}, event => [], disabled => ""},
                      #{type => unit, id => 10085091, base => 52209,
                        pos => {42009, 518, 877}, event => [], disabled => ""},
                      #{type => unit, id => 10085101, base => 52210,
                        pos => {42010, 525, 886}, event => [], disabled => ""},
                      #{type => unit, id => 51, base => 52000,
                        pos => {42001, 1419, 1444}, event => [],
                        disabled => ""},
                      #{type => unit, id => 52, base => 52000,
                        pos => {42002, 1419, 1440}, event => [],
                        disabled => ""},
                      #{type => unit, id => 53, base => 52000,
                        pos => {42003, 1414, 1444}, event => [],
                        disabled => ""},
                      #{type => unit, id => 54, base => 52000,
                        pos => {42004, 1418, 1440}, event => [],
                        disabled => ""},
                      #{type => unit, id => 55, base => 52000,
                        pos => {42005, 1412, 1440}, event => [],
                        disabled => ""},
                      #{type => unit, id => 56, base => 52000,
                        pos => {42006, 1414, 1448}, event => [],
                        disabled => ""},
                      #{type => unit, id => 57, base => 52000,
                        pos => {42007, 1414, 1445}, event => [],
                        disabled => ""},
                      #{type => unit, id => 58, base => 52000,
                        pos => {42008, 1421, 1445}, event => [],
                        disabled => ""},
                      #{type => unit, id => 59, base => 52000,
                        pos => {42009, 1418, 1441}, event => [],
                        disabled => ""},
                      #{type => unit, id => 60, base => 52000,
                        pos => {42010, 1412, 1440}, event => [],
                        disabled => ""}],
                 point = [], global = [{num, 0}],
                 trigger =
                     [#battle_trigger{name = "boss1", status = open,
                                      event = [{evt_battle_unit_killed}],
                                      vars = [],
                                      condition =
                                          [#condition{label = unit_killed_id,
                                                      op = eq, val = {10011}}]},
                      #battle_trigger{name = "pass1", status = open,
                                      event = [{evt_battle_unit_killed}],
                                      vars = [],
                                      condition =
                                          [#condition{label = unit_killed_id,
                                                      op = eq, val = {10019}}]},
                      #battle_trigger{name = "mon2", status = open,
                                      event = [{evt_battle_unit_killed}],
                                      vars = [],
                                      condition =
                                          [#condition{label = unit_killed_id,
                                                      op = eq, val = {10019}}]},
                      #battle_trigger{name = "boss2", status = open,
                                      event = [{evt_battle_unit_killed}],
                                      vars = [],
                                      condition =
                                          [#condition{label = unit_killed_id,
                                                      op = eq, val = {10021}}]},
                      #battle_trigger{name = "pass2", status = open,
                                      event = [{evt_battle_unit_killed}],
                                      vars = [],
                                      condition =
                                          [#condition{label = unit_killed_id,
                                                      op = eq, val = {10029}}]},
                      #battle_trigger{name = "mon3", status = open,
                                      event = [{evt_battle_unit_killed}],
                                      vars = [],
                                      condition =
                                          [#condition{label = unit_killed_id,
                                                      op = eq, val = {10029}}]},
                      #battle_trigger{name = "boss3", status = open,
                                      event = [{evt_battle_unit_killed}],
                                      vars = [],
                                      condition =
                                          [#condition{label = unit_killed_id,
                                                      op = eq, val = {10031}}]},
                      #battle_trigger{name = "pass3", status = open,
                                      event = [{evt_battle_unit_killed}],
                                      vars = [],
                                      condition =
                                          [#condition{label = unit_killed_id,
                                                      op = eq, val = {10039}}]},
                      #battle_trigger{name = "mon4", status = open,
                                      event = [{evt_battle_unit_killed}],
                                      vars = [],
                                      condition =
                                          [#condition{label = unit_killed_id,
                                                      op = eq, val = {10039}}]},
                      #battle_trigger{name = "boss4", status = open,
                                      event = [{evt_battle_unit_killed}],
                                      vars = [],
                                      condition =
                                          [#condition{label = unit_killed_id,
                                                      op = eq, val = {10041}}]},
                      #battle_trigger{name = "pass4", status = open,
                                      event = [{evt_battle_unit_killed}],
                                      vars = [],
                                      condition =
                                          [#condition{label = unit_killed_id,
                                                      op = eq, val = {10049}}]},
                      #battle_trigger{name = "mon5", status = open,
                                      event = [{evt_battle_unit_killed}],
                                      vars = [],
                                      condition =
                                          [#condition{label = unit_killed_id,
                                                      op = eq, val = {10049}}]},
                      #battle_trigger{name = "boss5", status = open,
                                      event = [{evt_battle_unit_killed}],
                                      vars = [],
                                      condition =
                                          [#condition{label = unit_killed_id,
                                                      op = eq, val = {10051}}]},
                      #battle_trigger{name = "pass5", status = open,
                                      event = [{evt_battle_unit_killed}],
                                      vars = [],
                                      condition =
                                          [#condition{label = unit_killed_id,
                                                      op = eq, val = {10059}}]},
                      #battle_trigger{name = "mon6", status = open,
                                      event = [{evt_battle_unit_killed}],
                                      vars = [],
                                      condition =
                                          [#condition{label = unit_killed_id,
                                                      op = eq, val = {10059}}]},
                      #battle_trigger{name = "boss6", status = open,
                                      event = [{evt_battle_unit_killed}],
                                      vars = [],
                                      condition =
                                          [#condition{label = unit_killed_id,
                                                      op = eq, val = {10061}}]},
                      #battle_trigger{name = "pass6", status = open,
                                      event = [{evt_battle_unit_killed}],
                                      vars = [],
                                      condition =
                                          [#condition{label = unit_killed_id,
                                                      op = eq, val = {10069}}]},
                      #battle_trigger{name = "mon7", status = open,
                                      event = [{evt_battle_unit_killed}],
                                      vars = [],
                                      condition =
                                          [#condition{label = unit_killed_id,
                                                      op = eq, val = {10069}}]},
                      #battle_trigger{name = "boss7", status = open,
                                      event = [{evt_battle_unit_killed}],
                                      vars = [],
                                      condition =
                                          [#condition{label = unit_killed_id,
                                                      op = eq, val = {10071}}]},
                      #battle_trigger{name = "pass7", status = open,
                                      event = [{evt_battle_unit_killed}],
                                      vars = [],
                                      condition =
                                          [#condition{label = unit_killed_id,
                                                      op = eq, val = {10079}}]},
                      #battle_trigger{name = "mon8", status = open,
                                      event = [{evt_battle_unit_killed}],
                                      vars = [],
                                      condition =
                                          [#condition{label = unit_killed_id,
                                                      op = eq, val = {10079}}]},
                      #battle_trigger{name = "boss8", status = open,
                                      event = [{evt_battle_unit_killed}],
                                      vars = [],
                                      condition =
                                          [#condition{label = unit_killed_id,
                                                      op = eq, val = {10081}}]},
                      #battle_trigger{name = "pass8", status = open,
                                      event = [{evt_battle_unit_killed}],
                                      vars = [],
                                      condition =
                                          [#condition{label = unit_killed_id,
                                                      op = eq, val = {10089}}]},
                      #battle_trigger{name = "mon9", status = close,
                                      event = [{evt_battle_unit_killed}],
                                      vars = [],
                                      condition =
                                          [#condition{label = unit_killed_id,
                                                      op = eq, val = {10089}}]},
                      #battle_trigger{name = "boss9", status = open,
                                      event = [{evt_battle_unit_killed}],
                                      vars = [],
                                      condition =
                                          [#condition{label = unit_killed_id,
                                                      op = eq, val = {10089}}]},
                      #battle_trigger{name = "pass9", status = open,
                                      event = [{evt_battle_unit_killed}],
                                      vars = [],
                                      condition =
                                          [#condition{label = unit_killed_id,
                                                      op = eq, val = {10099}}]},
                      #battle_trigger{name = "mon10", status = open,
                                      event = [{evt_battle_unit_killed}],
                                      vars = [],
                                      condition =
                                          [#condition{label = unit_killed_id,
                                                      op = eq, val = {10099}}]},
                      #battle_trigger{name = "boss10", status = open,
                                      event = [{evt_battle_unit_killed}],
                                      vars = [],
                                      condition =
                                          [#condition{label = unit_killed_id,
                                                      op = eq, val = {10101}}]},
                      #battle_trigger{name = "pass10", status = open,
                                      event = [{evt_battle_unit_killed}],
                                      vars = [],
                                      condition =
                                          [#condition{label = unit_killed_id,
                                                      op = eq,
                                                      val = {10109}}]}]}.

-spec trigger(bitstring()) -> ok.

trigger("boss1") ->
    battle_fun:create_unit(#{type => unit, id => 10019,
                             base => 52011, pos => {42001, 1247, 725},
                             event => [{evt_battle_unit_killed}],
                             disabled => ""}),
    ok;
trigger("pass1") ->
    battle_fun:create_unit(#{type => tele, id => 10020,
                             name => lang:get([20256, 36865, 38453]),
                             base => 42000, pos => {42001, 1725, 420},
                             to_pos => {42002, 1596, 1617}, event => [],
                             disabled => ""}),
    battle_fun:pass_floor(1, today),
    ok;
trigger("mon2") ->
    battle_fun:create_unit(#{type => unit, id => 10021,
                             base => 52025, pos => {42002, 393, 1241},
                             event => [{evt_battle_unit_killed}],
                             disabled => ""}),
    ok;
trigger("boss2") ->
    battle_fun:create_unit(#{type => unit, id => 10029,
                             base => 52021, pos => {42002, 1255, 721},
                             event => [{evt_battle_unit_killed}],
                             disabled => ""}),
    ok;
trigger("pass2") ->
    battle_fun:create_unit(#{type => tele, id => 10030,
                             name => lang:get([20256, 36865, 38453]),
                             base => 42000, pos => {42002, 1733, 418},
                             to_pos => {42003, 1586, 1621}, event => [],
                             disabled => ""}),
    battle_fun:pass_floor(2, today),
    ok;
trigger("mon3") ->
    battle_fun:create_unit(#{type => unit, id => 10031,
                             base => 52035, pos => {42003, 391, 1246},
                             event => [{evt_battle_unit_killed}],
                             disabled => ""}),
    ok;
trigger("boss3") ->
    battle_fun:create_unit(#{type => unit, id => 10039,
                             base => 52031, pos => {42003, 1243, 719},
                             event => [{evt_battle_unit_killed}],
                             disabled => ""}),
    ok;
trigger("pass3") ->
    battle_fun:create_unit(#{type => tele, id => 10040,
                             name => lang:get([20256, 36865, 38453]),
                             base => 42000, pos => {42003, 1728, 417},
                             to_pos => {42004, 1599, 1612}, event => [],
                             disabled => ""}),
    battle_fun:push_card(1000, 3),
    battle_fun:pass_floor(3, today),
    ok;
trigger("mon4") ->
    battle_fun:create_unit(#{type => unit, id => 10041,
                             base => 52044, pos => {42004, 386, 1240},
                             event => [{evt_battle_unit_killed}],
                             disabled => ""}),
    ok;
trigger("boss4") ->
    battle_fun:create_unit(#{type => unit, id => 10049,
                             base => 52041, pos => {42004, 1252, 717},
                             event => [{evt_battle_unit_killed}],
                             disabled => ""}),
    ok;
trigger("pass4") ->
    battle_fun:create_unit(#{type => tele, id => 10050,
                             name => lang:get([20256, 36865, 38453]),
                             base => 42000, pos => {42004, 1728, 422},
                             to_pos => {42005, 1598, 1612}, event => [],
                             disabled => ""}),
    battle_fun:pass_floor(4, today),
    ok;
trigger("mon5") ->
    battle_fun:create_unit(#{type => unit, id => 10051,
                             base => 52054, pos => {42005, 386, 1240},
                             event => [{evt_battle_unit_killed}],
                             disabled => ""}),
    ok;
trigger("boss5") ->
    battle_fun:create_unit(#{type => unit, id => 10059,
                             base => 52051, pos => {42005, 1252, 717},
                             event => [{evt_battle_unit_killed}],
                             disabled => ""}),
    ok;
trigger("pass5") ->
    battle_fun:create_unit(#{type => tele, id => 10060,
                             name => lang:get([20256, 36865, 38453]),
                             base => 42000, pos => {42005, 1728, 422},
                             to_pos => {42006, 1598, 1612}, event => [],
                             disabled => ""}),
    battle_fun:pass_floor(5, today),
    ok;
trigger("mon6") ->
    battle_fun:create_unit(#{type => unit, id => 10061,
                             base => 52062, pos => {42006, 386, 1240},
                             event => [{evt_battle_unit_killed}],
                             disabled => ""}),
    ok;
trigger("boss6") ->
    battle_fun:create_unit(#{type => unit, id => 10069,
                             base => 52061, pos => {42006, 1252, 717},
                             event => [{evt_battle_unit_killed}],
                             disabled => ""}),
    ok;
trigger("pass6") ->
    battle_fun:create_unit(#{type => tele, id => 10070,
                             name => lang:get([20256, 36865, 38453]),
                             base => 42000, pos => {42006, 1728, 422},
                             to_pos => {42007, 1598, 1612}, event => [],
                             disabled => ""}),
    battle_fun:push_card(1001, 6),
    battle_fun:pass_floor(6, today),
    ok;
trigger("mon7") ->
    battle_fun:create_unit(#{type => unit, id => 10071,
                             base => 52075, pos => {42007, 386, 1240},
                             event => [{evt_battle_unit_killed}],
                             disabled => ""}),
    ok;
trigger("boss7") ->
    battle_fun:create_unit(#{type => unit, id => 10079,
                             base => 52071, pos => {42007, 1252, 717},
                             event => [{evt_battle_unit_killed}],
                             disabled => ""}),
    ok;
trigger("pass7") ->
    battle_fun:create_unit(#{type => tele, id => 10080,
                             name => lang:get([20256, 36865, 38453]),
                             base => 42000, pos => {42007, 1728, 422},
                             to_pos => {42008, 1598, 1612}, event => [],
                             disabled => ""}),
    battle_fun:pass_floor(7, today),
    ok;
trigger("mon8") ->
    battle_fun:create_unit(#{type => unit, id => 10081,
                             base => 52085, pos => {42008, 386, 1240},
                             event => [{evt_battle_unit_killed}],
                             disabled => ""}),
    ok;
trigger("boss8") ->
    battle_fun:create_unit(#{type => unit, id => 10089,
                             base => 52081, pos => {42008, 1252, 717},
                             event => [{evt_battle_unit_killed}],
                             disabled => ""}),
    ok;
trigger("pass8") ->
    battle_fun:pass_floor(8, today),
    battle_fun:create_unit(#{type => tele, id => 10090,
                             name => lang:get([20256, 36865, 38453]),
                             base => 42000, pos => {42008, 1729, 417},
                             to_pos => {42009, 1592, 1616}, event => [],
                             disabled => ""}),
    ok;
trigger("mon9") ->
    ignore,
    ok;
trigger("boss9") ->
    battle_fun:create_unit(#{type => unit, id => 10099,
                             base => 52091, pos => {42009, 1252, 717},
                             event => [{evt_battle_unit_killed}],
                             disabled => ""}),
    ok;
trigger("pass9") ->
    battle_fun:push_card(1002, 9),
    battle_fun:pass_floor(9, today),
    ok;
trigger("mon10") ->
    battle_fun:create_unit(#{type => unit, id => 10101,
                             base => 50045, pos => {42010, 386, 1240},
                             event => [{evt_battle_unit_killed}],
                             disabled => ""}),
    ok;
trigger("boss10") ->
    battle_fun:create_unit(#{type => unit, id => 10109,
                             base => 52101, pos => {42010, 1252, 717},
                             event => [{evt_battle_unit_killed}],
                             disabled => ""}),
    ok;
trigger("pass10") ->
    battle_fun:push_card(1003, 10),
    battle_fun:pass(),
    battle_fun:pass_floor(10, today),
    ok;
trigger(Name) ->
    logger:error("调用的触器器[~ts:trigger(~ts)]不存在",
                 [battle_dungeon_92, Name],
                 battle_dungeon_92,
                 259),
    ok.

