-file("src/battle/battle_shipping_1.erl", 1).

-module(battle_shipping_1).

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

-file("src/battle/battle_shipping_1.erl", 14).

-file("inc/condition.hrl", 1).

-record(condition,
        {label :: undefined | atom(),
         op = eq ::
             ue | eq | lt | gt | le | ge | range | include,
         val :: undefined | term(),
         msg = "" :: list()}).

-file("src/battle/battle_shipping_1.erl", 15).

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

-file("src/battle/battle_shipping_1.erl", 16).

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

-file("src/battle/battle_shipping_1.erl", 17).

-spec cfg() -> #battle_base{}.

cfg() ->
    #battle_base{id = 1, name = battle_shipping_1,
                 map = [51010], type = 2,
                 enter_point = {51010, 1600, 560}, unit = [], point = [],
                 global = [{count_down, 30}, {count_down2, 102}],
                 trigger =
                     [#battle_trigger{name = "box_a1", status = open,
                                      event = [{timer, count, 30, 1}],
                                      vars = [], condition = []},
                      #battle_trigger{name = "box_a2", status = open,
                                      event = [{timer, count, 48, 1}],
                                      vars = [], condition = []},
                      #battle_trigger{name = "box_a3", status = open,
                                      event = [{timer, count, 66, 1}],
                                      vars = [], condition = []},
                      #battle_trigger{name = "box_a4", status = open,
                                      event = [{timer, count, 84, 1}],
                                      vars = [], condition = []},
                      #battle_trigger{name = "box_b1", status = open,
                                      event = [{timer, count, 30, 1}],
                                      vars = [], condition = []},
                      #battle_trigger{name = "box_b2", status = open,
                                      event = [{timer, count, 48, 1}],
                                      vars = [], condition = []},
                      #battle_trigger{name = "box_b3", status = open,
                                      event = [{timer, count, 66, 1}],
                                      vars = [], condition = []},
                      #battle_trigger{name = "box_b4", status = open,
                                      event = [{timer, count, 84, 1}],
                                      vars = [], condition = []},
                      #battle_trigger{name = "box_c", status = open,
                                      event = [{timer, count, 102, 1}],
                                      vars = [], condition = []},
                      #battle_trigger{name = "clean_1", status = open,
                                      event = [{timer, count, 48, 1}],
                                      vars = [], condition = []},
                      #battle_trigger{name = "clean_2", status = open,
                                      event = [{timer, count, 66, 1}],
                                      vars = [], condition = []},
                      #battle_trigger{name = "clean_3", status = open,
                                      event = [{timer, count, 84, 1}],
                                      vars = [], condition = []},
                      #battle_trigger{name = "clean_4", status = open,
                                      event = [{timer, count, 102, 1}],
                                      vars = [], condition = []},
                      #battle_trigger{name = "settlement", status = open,
                                      event = [{timer, count, 102, 1}],
                                      vars = [], condition = []},
                      #battle_trigger{name = "xxxxxclean_b1", status = close,
                                      event = [], vars = [], condition = []},
                      #battle_trigger{name = "xxxxxclean_b2", status = close,
                                      event = [], vars = [], condition = []}]}.

-spec trigger(bitstring()) -> ok.

trigger("box_a1") ->
    battle_fun:create_rand_unit(#{type => unit, min => 1,
                                  max => 7, base => 73251, map => 51010,
                                  event => [{evt_battle_unit_picked}],
                                  disabled => ""}),
    battle_fun:send(3,
                    lang:get([26032,
                              30340,
                              23453,
                              31665,
                              24050,
                              38477,
                              20020,
                              65292,
                              25235,
                              32039,
                              26102,
                              38388,
                              24320,
                              21551,
                              21834,
                              123,
                              102,
                              97,
                              99,
                              101,
                              95,
                              49,
                              44,
                              51,
                              54,
                              125])),
    ok;
trigger("box_a2") ->
    battle_fun:create_rand_unit(#{type => unit, min => 9,
                                  max => 15, base => 73251, map => 51010,
                                  event => [{evt_battle_unit_picked}],
                                  disabled => ""}),
    battle_fun:send(3,
                    lang:get([26032,
                              30340,
                              23453,
                              31665,
                              24050,
                              38477,
                              20020,
                              65292,
                              25235,
                              32039,
                              26102,
                              38388,
                              24320,
                              21551,
                              21834,
                              123,
                              102,
                              97,
                              99,
                              101,
                              95,
                              49,
                              44,
                              51,
                              54,
                              125])),
    ok;
trigger("box_a3") ->
    battle_fun:create_rand_unit(#{type => unit, min => 17,
                                  max => 23, base => 73251, map => 51010,
                                  event => [{evt_battle_unit_picked}],
                                  disabled => ""}),
    battle_fun:send(3,
                    lang:get([26032,
                              30340,
                              23453,
                              31665,
                              24050,
                              38477,
                              20020,
                              65292,
                              25235,
                              32039,
                              26102,
                              38388,
                              24320,
                              21551,
                              21834,
                              123,
                              102,
                              97,
                              99,
                              101,
                              95,
                              49,
                              44,
                              51,
                              54,
                              125])),
    ok;
trigger("box_a4") ->
    battle_fun:create_rand_unit(#{type => unit, min => 25,
                                  max => 31, base => 73251, map => 51010,
                                  event => [{evt_battle_unit_picked}],
                                  disabled => ""}),
    battle_fun:send(3,
                    lang:get([26032,
                              30340,
                              23453,
                              31665,
                              24050,
                              38477,
                              20020,
                              65292,
                              25235,
                              32039,
                              26102,
                              38388,
                              24320,
                              21551,
                              21834,
                              123,
                              102,
                              97,
                              99,
                              101,
                              95,
                              49,
                              44,
                              51,
                              54,
                              125])),
    ok;
trigger("box_b1") ->
    battle_fun:create_rand_unit(#{type => unit, min => 8,
                                  max => 8, base => 73250, map => 51010,
                                  event => [{evt_battle_unit_picked}],
                                  disabled => ""}),
    ok;
trigger("box_b2") ->
    battle_fun:create_rand_unit(#{type => unit, min => 16,
                                  max => 16, base => 73250, map => 51010,
                                  event => [{evt_battle_unit_picked}],
                                  disabled => ""}),
    ok;
trigger("box_b3") ->
    battle_fun:create_rand_unit(#{type => unit, min => 24,
                                  max => 24, base => 73250, map => 51010,
                                  event => [{evt_battle_unit_picked}],
                                  disabled => ""}),
    ok;
trigger("box_b4") ->
    battle_fun:create_rand_unit(#{type => unit, min => 32,
                                  max => 32, base => 73250, map => 51010,
                                  event => [{evt_battle_unit_picked}],
                                  disabled => ""}),
    ok;
trigger("box_c") ->
    battle_fun:create_rand_unit(#{type => unit, min => 33,
                                  max => 47, base => 73252, map => 51010,
                                  event => [{evt_battle_unit_picked}],
                                  disabled => ""}),
    ok;
trigger("clean_1") ->
    battle_fun:unit_force_remove(1, 8),
    ok;
trigger("clean_2") ->
    battle_fun:unit_force_remove(9, 16),
    ok;
trigger("clean_3") ->
    battle_fun:unit_force_remove(17, 24),
    ok;
trigger("clean_4") ->
    battle_fun:unit_force_remove(25, 32),
    ok;
trigger("settlement") ->
    battle_fun:push_dun_gain(),
    ok;
trigger("xxxxxclean_b1") ->
    ignore,
    ok;
trigger("xxxxxclean_b2") ->
    ignore,
    ok;
trigger(Name) ->
    logger:error("调用的触器器[~ts:trigger(~ts)]不存在",
                 [battle_shipping_1, Name],
                 battle_shipping_1,
                 126),
    ok.

