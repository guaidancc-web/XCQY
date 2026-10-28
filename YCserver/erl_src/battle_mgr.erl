-file("src/mod/battle/battle_mgr.erl", 1).

-module(battle_mgr).

-behaviour(gen_server).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([start_link/1,
         fetch_ids/1,
         evt/2,
         evt/3,
         lookup/1,
         find_info/2,
         info/1,
         info/2,
         apply/3,
         apply/4]).

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

-file("src/mod/battle/battle_mgr.erl", 24).

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

-file("src/mod/battle/battle_mgr.erl", 25).

-record(state, {next_id = 10000}).

-spec start_link(tuple()) -> {ok, pid()} |
                             ignore |
                             {error, term()}.

start_link(Mod) ->
    gen_server:start_link({local, battle_mgr},
                          battle_mgr,
                          [Mod],
                          []).

-spec fetch_ids(non_neg_integer()) -> false |
                                      {ok, list()} |
                                      any().

fetch_ids(Num) when Num >= 1 ->
    case catch gen_server:call(battle_mgr,
                               {fetch_ids, Num},
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end;
fetch_ids(_) -> false.

-spec evt(Id :: pos_integer(), Evt :: any(),
          Events :: list()) -> ignore | ok.

evt(_Id, [], _Events) -> ok;
evt(Id, [Evt | T], Events) ->
    evt(Id, Evt, Events),
    evt(Id, T, Events);
evt(Id, Evt, Events) ->
    Event = element(1, Evt),
    case lists:keyfind(Event, 1, Events) of
        false -> ignore;
        _ -> evt(Id, Evt)
    end.

-spec evt(Id :: pid() | pos_integer(),
          Evt :: any()) -> {event, any()} | {error, not_found}.

evt(Pid, Evt) when is_pid(Pid) -> Pid ! {event, Evt};
evt(Id, Evt) ->
    case catch ets:lookup(battle, Id) of
        [#battle{pid = Pid}] -> Pid ! {event, Evt};
        _ -> {error, not_found}
    end.

-spec lookup(pos_integer()) -> false | {ok, #battle{}}.

lookup(Id) ->
    case catch ets:lookup(battle, Id) of
        [Battle = #battle{}] -> {ok, Battle};
        _ -> false
    end.

info(Msg) ->
    Fun = fun (#battle{pid = Pid}, _) -> Pid ! Msg end,
    ets:foldl(Fun, 1, battle).

info(Id, Msg) ->
    case catch ets:lookup(battle, Id) of
        [#battle{pid = Pid}] when is_pid(Pid) -> Pid ! Msg;
        _ -> {error, not_found}
    end.

find_info(map, Id) ->
    case lookup(Id) of
        {ok,
         _Battle = #battle{enter_point = {MapBaseId, X, Y},
                           map = LoadMaps}} ->
            case battle:find_map_id(MapBaseId, LoadMaps) of
                false -> {false, "地图创建失败，无法进入"};
                {ok, MapId} ->
                    P = env:get(platform),
                    Z = env:get(zone_id),
                    {ok, {P, Z, MapId, X, Y}}
            end;
        _ -> {false, "不存在的战场，无法获取进入点"}
    end.

apply(T, BattleId, Mfa) when is_integer(BattleId) ->
    case catch ets:lookup(battle, BattleId) of
        [#battle{pid = BattlePid}] ->
            battle_mgr:apply(T, BattlePid, Mfa);
        _ ->
            logger:error("无法获取战场[~w]的进程，无法执行[~w]",
                         [BattleId, Mfa],
                         battle_mgr,
                         115),
            {error, not_pid}
    end;
apply(async, BattlePid, _Mfa)
    when not is_pid(BattlePid) ->
    logger:error("战场回调使用非PID，无法调用[~w]",
                 [_Mfa],
                 battle_mgr,
                 119),
    ok;
apply(async, BattlePid, {F}) ->
    BattlePid ! {apply_async, {F}},
    ok;
apply(async, BattlePid, {F, A}) ->
    BattlePid ! {apply_async, {F, A}},
    ok;
apply(async, BattlePid, {M, F, A}) ->
    BattlePid ! {apply_async, {M, F, A}},
    ok;
apply(sync, BattlePid, _Mfa)
    when not is_pid(BattlePid) ->
    {error, not_pid};
apply(sync, BattlePid, Mfa) when self() =:= BattlePid ->
    {M, F, _, _} = hd(tl(erlang:get_stacktrace())),
    logger:error("调用者[~w:~w]执行apply[~w]时发生错误：调用了自身",
                 [M, F, Mfa],
                 battle_mgr,
                 135),
    {error, self_call};
apply(sync, BattlePid, {F}) ->
    case catch gen_server:call(BattlePid,
                               {apply_sync, F},
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end;
apply(sync, BattlePid, {F, A}) ->
    case catch gen_server:call(BattlePid,
                               {apply_sync, {F, A}},
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end;
apply(sync, BattlePid, {M, F, A}) ->
    case catch gen_server:call(BattlePid,
                               {apply_sync, {M, F, A}},
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

apply(send_after, _BattlePid, TimeOut, _Mfa)
    when TimeOut =< 0 ->
    logger:error("战场延时回调时间设置错误，无法调用[~w]",
                 [_Mfa],
                 battle_mgr,
                 145),
    ok;
apply(send_after, BattlePid, _TimeOut, _Mfa)
    when not is_pid(BattlePid) ->
    logger:error("战场回调使用非PID，无法调用[~w]",
                 [_Mfa],
                 battle_mgr,
                 148),
    ok;
apply(send_after, BattlePid, TimeOut, {M, F, A}) ->
    erlang:send_after(TimeOut * 1000,
                      BattlePid,
                      {apply_async, {M, F, A}}),
    ok.

init([Mod]) ->
    process_flag(trap_exit, true),
    logger:info("[~w] 正在启动...",
                [battle_mgr],
                battle_mgr,
                160),
    ets:new(battle,
            [set, named_table, public, {keypos, #battle.id}]),
    case Mod of
        center -> startup([battle_world_center]);
        big_world -> startup([]);
        _ -> startup([battle_world])
    end,
    State = #state{},
    logger:info("[~w] 启动完成...",
                [battle_mgr],
                battle_mgr,
                171),
    {ok, State}.

handle_call({fetch_ids, Num}, _From,
            State = #state{next_id = NextId}) ->
    Ids = lists:seq(NextId, NextId + Num - 1),
    {reply, {ok, Ids}, State#state{next_id = NextId + Num}};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...",
                [battle_mgr],
                battle_mgr,
                188),
    logger:info("[~w] 关闭完成", [battle_mgr], battle_mgr, 189),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

startup([]) -> ok;
startup([Battle | T]) ->
    case battle:start(Battle:cfg()) of
        {ok, _} -> ignore;
        Err ->
            logger:error("战场[~ts]启动失败: ~w",
                         [Battle, Err],
                         battle_mgr,
                         204)
    end,
    startup(T).

