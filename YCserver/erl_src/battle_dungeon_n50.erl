-file("src/battle/battle_dungeon_n50.erl", 1).

-module(battle_dungeon_n50).

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

-file("src/battle/battle_dungeon_n50.erl", 14).

-file("inc/condition.hrl", 1).

-record(condition,
        {label :: undefined | atom(),
         op = eq ::
             ue | eq | lt | gt | le | ge | range | include,
         val :: undefined | term(),
         msg = "" :: list()}).

-file("src/battle/battle_dungeon_n50.erl", 15).

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

-file("src/battle/battle_dungeon_n50.erl", 16).

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

-file("src/battle/battle_dungeon_n50.erl", 17).

-spec cfg() -> #battle_base{}.

cfg() ->
    #battle_base{id = 50, name = battle_dungeon_n50,
                 map = [20004], type = 2,
                 enter_point = {20004, 1597, 1846},
                 unit =
                     [#{type => unit, id => 1, base => 50041,
                        pos => {20004, 344, 1557},
                        event => [{evt_battle_unit_killed}], disabled => ""},
                      #{type => unit, id => 101, base => 51058,
                        pos => {20004, 1496, 1331}, event => [],
                        disabled => ""},
                      #{type => unit, id => 102, base => 51057,
                        pos => {20004, 1039, 1088}, event => [],
                        disabled => ""},
                      #{type => unit, id => 103, base => 51056,
                        pos => {20004, 1026, 1707},
                        event => [{timer, count, 8, 1}], disabled => ""},
                      #{type => unit, id => 201, base => 51054,
                        pos => {20004, 265, 436}, event => [], disabled => ""},
                      #{type => unit, id => 202, base => 51054,
                        pos => {20004, 214, 447}, event => [], disabled => ""},
                      #{type => unit, id => 203, base => 51054,
                        pos => {20004, 1639, 1107}, event => [],
                        disabled => ""},
                      #{type => unit, id => 204, base => 51054,
                        pos => {20004, 328, 913}, event => [], disabled => ""},
                      #{type => unit, id => 211, base => 51053,
                        pos => {20004, 1711, 1053}, event => [],
                        disabled => ""},
                      #{type => unit, id => 212, base => 51053,
                        pos => {20004, 1690, 1137}, event => [],
                        disabled => ""},
                      #{type => unit, id => 213, base => 51053,
                        pos => {20004, 378, 948}, event => [], disabled => ""},
                      #{type => unit, id => 104, base => 51055,
                        pos => {20004, 1069, 442}, event => [], disabled => ""},
                      #{type => unit, id => 105, base => 51052,
                        pos => {20004, 839, 1538},
                        event => [{timer, count, 7, 1}], disabled => ""},
                      #{type => unit, id => 106, base => 51051,
                        pos => {20004, 1312, 393}, event => [], disabled => ""},
                      #{type => unit, id => 107, base => 51050,
                        pos => {20004, 629, 361}, event => [], disabled => ""},
                      #{type => unit, id => 108, base => 51052,
                        pos => {20004, 1693, 695},
                        event => [{timer, count, 7, 30}], disabled => ""},
                      #{type => unit, id => 205, base => 51054,
                        pos => {20004, 214, 1524}, event => [], disabled => ""},
                      #{type => unit, id => 206, base => 51054,
                        pos => {20004, 372, 1490}, event => [],
                        disabled => ""}],
                 point = [], global = [{num, 0}],
                 trigger =
                     [#battle_trigger{name = "mon2", status = open,
                                      event = [{evt_battle_unit_killed}],
                                      vars = [],
                                      condition =
                                          [#condition{label = unit_killed_id,
                                                      op = eq, val = {1}}]},
                      #battle_trigger{name = "mon3", status = open,
                                      event = [{evt_battle_unit_killed}],
                                      vars = [],
                                      condition =
                                          [#condition{label = unit_killed_id,
                                                      op = eq, val = {2}}]},
                      #battle_trigger{name = "boss", status = open,
                                      event = [{evt_battle_unit_killed}],
                                      vars = [],
                                      condition =
                                          [#condition{label = unit_killed_id,
                                                      op = eq, val = {3}}]},
                      #battle_trigger{name = "open", status = open,
                                      event = [{evt_battle_unit_killed}],
                                      vars = [],
                                      condition =
                                          [#condition{label = unit_killed_id,
                                                      op = eq, val = {4}}]},
                      #battle_trigger{name = "count", status = close,
                                      event = [{timer, count, 3, 1}], vars = [],
                                      condition = []},
                      #battle_trigger{name = "roll", status = close,
                                      event = [{timer, count, 2, 1}], vars = [],
                                      condition = []},
                      #battle_trigger{name = "chest", status = close,
                                      event = [{evt_battle_unit_killed}],
                                      vars = [],
                                      condition =
                                          [#condition{label = unit_killed_id,
                                                      op = eq, val = {2}}]},
                      #battle_trigger{name = "chest_roll", status = close,
                                      event = [{evt_battle_unit_killed}],
                                      vars = [],
                                      condition =
                                          [#condition{label = unit_killed_id,
                                                      op = eq, val = {9999}}]},
                      #battle_trigger{name = "plot", status = open,
                                      event = [{timer, count, 2, 1}], vars = [],
                                      condition = []},
                      #battle_trigger{name = "edragon", status = close,
                                      event = [{timer, cycle, 7, 1}], vars = [],
                                      condition = []},
                      #battle_trigger{name = "opendragon", status = close,
                                      event = [{timer, count, 5, 100}],
                                      vars = [], condition = []},
                      #battle_trigger{name = "dragon", status = close,
                                      event = [{timer, count, 1, 1}], vars = [],
                                      condition = []}]}.

-spec trigger(bitstring()) -> ok.

trigger("mon2") ->
    battle_fun:create_unit(#{type => unit, id => 2,
                             base => 50042, pos => {20004, 1051, 1082},
                             event => [{evt_battle_unit_killed}],
                             disabled => ""}),
    ok;
trigger("mon3") ->
    battle_fun:create_unit(#{type => unit, id => 3,
                             base => 50043, pos => {20004, 1661, 734},
                             event => [{evt_battle_unit_killed}],
                             disabled => ""}),
    ok;
trigger("boss") ->
    battle_fun:create_unit(#{type => unit, id => 4,
                             base => 50059, pos => {20004, 1037, 431},
                             event => [{evt_battle_unit_killed}],
                             disabled => ""}),
    ok;
trigger("open") ->
    battle_fun:push_card(1001),
    ok;
trigger("count") ->
    battle_fun:push_dun_gain(),
    ok;
trigger("roll") ->
    battle_fun:push_roll(55),
    ok;
trigger("chest") ->
    battle_fun:create_unit(#{type => unit, id => 9999,
                             base => 50057, pos => {20004, 1050, 1086},
                             event => [{evt_battle_unit_killed}],
                             disabled => ""}),
    ok;
trigger("chest_roll") ->
    battle_fun:push_roll(54),
    ok;
trigger("plot") ->
    battle_fun:push_plot(50020),
    ok;
trigger("edragon") ->
    battle_fun:create_unit(#{type => unit, id => 100,
                             base => 51052, pos => {20004, 486, 348},
                             event => [{evt_battle_unit_killed}],
                             disabled => ""}),
    ok;
trigger("opendragon") ->
    battle_fun:trigger_open("dragon"),
    ok;
trigger("dragon") ->
    battle_fun:create_unit(#{type => unit, id => 99998,
                             base => 51052, pos => {20004, 1632, 1874},
                             event => [], disabled => ""}),
    ok;
trigger(Name) ->
    logger:error("调用的触器器[~ts:trigger(~ts)]不存在",
                 [battle_dungeon_n50, Name],
                 battle_dungeon_n50,
                 118),
    ok.

