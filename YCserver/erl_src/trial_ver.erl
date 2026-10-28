-file("src/mod/trial/trial_ver.erl", 1).

-module(trial_ver).

-export([do/1]).

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

-file("src/mod/trial/trial_ver.erl", 13).

-file("inc/trial.hrl", 1).

-record(trial_unit,
        {battle_id = 0,
         unit_id = 0,
         unit_baseid = 0,
         unit_name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         dir = 0,
         looks = [],
         map_id = 0,
         x = 0,
         y = 0}).

-record(m_trial,
        {ver = 3,
         mode = 0,
         order = 0,
         fighter,
         unit = #trial_unit{},
         direct_order = 0,
         clear_normal = 0,
         round = 0,
         times = 2,
         coin = 0,
         reset = 2,
         max_order_easy = 0,
         max_order_hard = 0,
         has_match = [],
         is_helped = "",
         gain_items = []}).

-record(trial_help,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         type = 1,
         unit_id = 0,
         battle_id = 0,
         unit_name = "",
         time = 0}).

-file("src/mod/trial/trial_ver.erl", 14).

-file("inc/robot.hrl", 1).

-record(robot_role,
        {ver = 4,
         id = {0, "", 0} :: tuple(),
         name = "" :: list(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         fc = 0,
         face = 0,
         ai_id = 0,
         skills = [],
         talents = [],
         pet,
         backup_pets = [],
         guard,
         slave = [],
         attr :: undefined | tuple(),
         looks = [],
         time = 0,
         m_formation,
         pet_fc = 0,
         all_fc = 0,
         cup = 1000,
         m_lev_break}).

-record(robot_role_index,
        {id = {0, "", 0} :: tuple(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         fc = 0,
         pet_fc = 0,
         cup = 1000,
         all_fc = 0,
         time = 0}).

-file("src/mod/trial/trial_ver.erl", 15).

do({m_trial,
    Mode,
    Order,
    Fighter,
    Unit,
    Direct_order,
    Clear_normal,
    Round,
    Times,
    Coin,
    Reset,
    Max_order_easy,
    Max_order_hard,
    Has_match}) ->
    Ver = 1,
    IsHelped = "",
    NewOrder = case Order > 12 of
                   true when Fighter =:= box -> 12;
                   true when Order =:= 25 -> 12 + 1;
                   true when Fighter =:= undefined -> 12 + 1;
                   true -> 12 - 1;
                   _ -> Order
               end,
    do({m_trial,
        Ver,
        Mode,
        NewOrder,
        Fighter,
        Unit,
        Direct_order,
        Clear_normal,
        Round,
        Times,
        Coin,
        Reset,
        Max_order_easy,
        Max_order_hard,
        Has_match,
        IsHelped});
do({m_trial,
    Ver = 1,
    Mode,
    NewOrder,
    Fighter,
    Unit,
    Direct_order,
    Clear_normal,
    Round,
    Times,
    Coin,
    Reset,
    Max_order_easy,
    Max_order_hard,
    Has_match,
    IsHelped}) ->
    GainItems = [],
    do({m_trial,
        Ver + 1,
        Mode,
        NewOrder,
        Fighter,
        Unit,
        Direct_order,
        Clear_normal,
        Round,
        Times,
        Coin,
        Reset,
        Max_order_easy,
        Max_order_hard,
        Has_match,
        IsHelped,
        GainItems});
do({m_trial,
    Ver = 2,
    Mode,
    Order,
    Fighter,
    Unit,
    Direct_order,
    Clear_normal,
    Round,
    Times,
    Coin,
    Reset,
    Max_order_easy,
    Max_order_hard,
    Has_match,
    IsHelped,
    GainItems}) ->
    NewOrder = case Order > 12 of
                   true when Fighter =:= box -> 12;
                   true when Order =:= 21 -> 12 + 1;
                   true when Fighter =:= undefined -> 12 + 1;
                   true -> 12 - 1;
                   _ -> Order
               end,
    do({m_trial,
        Ver + 1,
        Mode,
        NewOrder,
        Fighter,
        Unit,
        Direct_order,
        Clear_normal,
        Round,
        Times,
        Coin,
        Reset,
        Max_order_easy,
        Max_order_hard,
        Has_match,
        IsHelped,
        GainItems});
do(Data = #m_trial{ver = 3, fighter = Fighter,
                   direct_order = DirectOrder}) ->
    NewFighter = case Fighter of
                     {self_clone, _} -> Fighter;
                     undefined -> Fighter;
                     box -> Fighter;
                     #robot_role{} -> Fighter;
                     _ ->
                         case robot_mgr:ver(Fighter) of
                             {ok, Fighter1} -> Fighter1;
                             _ -> Fighter
                         end
                 end,
    NewDirectOrder = case DirectOrder > 12 of
                         true -> 0;
                         false -> DirectOrder
                     end,
    {ok,
     Data#m_trial{fighter = NewFighter,
                  direct_order = NewDirectOrder}};
do(_) -> {false, lang:get("极寒数据转换失败")}.

