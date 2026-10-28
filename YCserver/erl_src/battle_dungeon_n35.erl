-file("src/battle/battle_dungeon_n35.erl", 1).

-module(battle_dungeon_n35).

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

-file("src/battle/battle_dungeon_n35.erl", 14).

-file("inc/condition.hrl", 1).

-record(condition,
        {label :: undefined | atom(),
         op = eq ::
             ue | eq | lt | gt | le | ge | range | include,
         val :: undefined | term(),
         msg = "" :: list()}).

-file("src/battle/battle_dungeon_n35.erl", 15).

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

-file("src/battle/battle_dungeon_n35.erl", 16).

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

-file("src/battle/battle_dungeon_n35.erl", 17).

-spec cfg() -> #battle_base{}.

cfg() ->
    #battle_base{id = 1, name = battle_dungeon_n35,
                 map = [20005], type = 2,
                 enter_point = {20005, 1701, 1711},
                 unit =
                     [#{type => unit, id => 1, base => 50021,
                        pos => {20005, 562, 1714},
                        event => [{evt_battle_unit_killed}], disabled => ""}],
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
                                                      op = eq, val = {9}}]},
                      #battle_trigger{name = "count", status = close,
                                      event = [{timer, count, 3, 1}], vars = [],
                                      condition = []},
                      #battle_trigger{name = "catfeet", status = close,
                                      event = [{timer, count, 1, 11}],
                                      vars = [], condition = []},
                      #battle_trigger{name = "eyes", status = close,
                                      event = [], vars = [], condition = []},
                      #battle_trigger{name = "roll", status = close,
                                      event = [{timer, count, 2, 1}], vars = [],
                                      condition = []},
                      #battle_trigger{name = "plot", status = open,
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
                                                      op = eq,
                                                      val = {9999}}]}]}.

-spec trigger(bitstring()) -> ok.

trigger("mon2") ->
    battle_fun:create_unit(#{type => unit, id => 2,
                             base => 50022, pos => {20005, 966, 1024},
                             event => [{evt_battle_unit_killed}],
                             disabled => ""}),
    ok;
trigger("mon3") ->
    battle_fun:create_unit(#{type => unit, id => 3,
                             base => 50023, pos => {20005, 1607, 655},
                             event => [{evt_battle_unit_killed}],
                             disabled => ""}),
    ok;
trigger("boss") ->
    battle_fun:create_unit(#{type => unit, id => 9,
                             base => 50039, pos => {20005, 388, 368},
                             event => [{evt_battle_unit_killed}],
                             disabled => ""}),
    ok;
trigger("open") ->
    battle_fun:push_card(1000),
    ok;
trigger("count") ->
    battle_fun:trigger_open("roll"),
    ok;
trigger("catfeet") ->
    ignore,
    ok;
trigger("eyes") ->
    ignore,
    ok;
trigger("roll") ->
    battle_fun:push_card(1000),
    ok;
trigger("plot") ->
    battle_fun:push_plot(50010),
    ok;
trigger("chest") ->
    battle_fun:create_unit(#{type => unit, id => 9999,
                             base => 50036, pos => {20005, 974, 1018},
                             event => [{evt_battle_unit_killed}],
                             disabled => ""}),
    ok;
trigger("chest_roll") ->
    battle_fun:push_roll(34),
    ok;
trigger(Name) ->
    logger:error("调用的触器器[~ts:trigger(~ts)]不存在",
                 [battle_dungeon_n35, Name],
                 battle_dungeon_n35,
                 96),
    ok.

