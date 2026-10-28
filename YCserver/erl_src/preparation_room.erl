-file("src/mod/preparation/preparation_room.erl", 1).

-module(preparation_room).

-behaviour(gen_server).

-export([start_link/2,
         open_all/1,
         update/1,
         lookup/1,
         enter/1,
         leave/2,
         logout/2,
         match/2,
         unmatch/2,
         check_leave/2,
         open/1,
         close/1,
         delay_action/5]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

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

-file("src/mod/preparation/preparation_room.erl", 27).

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

-file("src/mod/preparation/preparation_room.erl", 28).

-file("inc/preparation.hrl", 1).

-record(m_preparation,
        {ver = 0,
         pid :: undefined | pid(),
         id = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer()}).

-record(preparation_room,
        {ver = 0,
         id = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         map_id = 0 :: non_neg_integer(),
         map_pid :: undefined | pid(),
         matching = [] :: list(),
         num = 1,
         matched = 0 :: non_neg_integer(),
         match_ref :: undefined | reference(),
         mode = 1,
         is_open = true :: boolean()}).

-record(preparation_team,
        {ids = [] :: list(),
         origin_ids = [] :: list(),
         num = 1 :: non_neg_integer(),
         sum_lev = 0 :: non_neg_integer(),
         max_lev = 0 :: non_neg_integer(),
         min_lev = 0 :: non_neg_integer(),
         tried_match = 0 :: non_neg_integer(),
         room_id = 0 :: non_neg_integer(),
         order = [] :: list(),
         classes = [] :: list()}).

-record(preparation_role,
        {ver = 0,
         id = {0, "", 0},
         name = "",
         pid :: undefined | pid(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         looks = [] :: list(),
         fc = 0 :: non_neg_integer(),
         room_id = 0 :: non_neg_integer(),
         s_ride = 0,
         preparation_pid :: undefined | pid(),
         matched = 0 :: non_neg_integer(),
         formation_id = 1,
         formation_lev = 1,
         team_id = [] :: list(),
         partner = [] :: list(),
         group = 1 :: non_neg_integer()}).

-record(preparation_show_role,
        {id = {0, "", 0},
         name = "",
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         group = 1 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         looks = [] :: list()}).

-file("src/mod/preparation/preparation_room.erl", 29).

open_all(Mode) ->
    ets:new(preparation_room,
            [set,
             named_table,
             public,
             {keypos, #preparation_room.id}]),
    do_open(preparation_data:list(), Mode).

update(Room = #preparation_room{}) ->
    ets:insert(preparation_room, Room).

lookup(Id) -> ets:lookup(preparation_room, Id).

delete(Id) -> ets:delete(preparation_room, Id).

enter(#preparation_role{room_id = Id}) ->
    case lookup(Id) of
        [#preparation_room{pid = Pid, map_id = MapId,
                           is_open = true}] ->
            Platform = env:get(platform),
            ZoneId = env:get(zone_id),
            ForceLocal = case world_lev:get_world_lev() of
                             {WorldLev, _} when WorldLev >= 60 -> false;
                             _ -> true
                         end,
            case preparation_data:get(Id) of
                #{mode := 1, map := MapBase}
                    when ForceLocal =:= false ->
                    case big_world:call(preparation_room, lookup, [Id]) of
                        [#preparation_room{pid = RemotePid}] ->
                            {ok,
                             #{map_id => MapId, pid => RemotePid,
                               platform => Platform, zone_id => ZoneId,
                               map_base => MapBase}};
                        _Else ->
                            logger:debug("找到不到 ~w",
                                         [_Else],
                                         preparation_room,
                                         71),
                            {false, lang:get("大厅还没开启")}
                    end;
                #{map := MapBase} ->
                    {ok,
                     #{map_id => MapId, pid => Pid, platform => Platform,
                       zone_id => ZoneId, map_base => MapBase}}
            end;
        _ -> {false, lang:get("大厅还没开启")}
    end.

leave(Pid, Id) when is_pid(Pid) -> Pid ! {leave, Id};
leave(_, _) -> ok.

check_leave(Pid, Id) when is_pid(Pid) ->
    case case catch gen_server:call(Pid,
                                    {check_leave, Id},
                                    10000)
             of
             {'EXIT', {timeout, _}} -> {error, timeout};
             {'EXIT', {noproc, _}} -> {error, noproc};
             {'EXIT', {normal, _}} -> {error, exit};
             {'EXIT', _Call_Err} -> {error, _Call_Err};
             _Call_Return -> _Call_Return
         end
        of
        {error, _} -> ok;
        Else -> Else
    end;
check_leave(_, _Id) -> ok.

open(RoomId) ->
    case lookup(RoomId) of
        [#preparation_room{pid = Pid, is_open = false}]
            when is_pid(Pid) ->
            Pid ! open;
        _ -> opened
    end.

close(RoomId) ->
    case lookup(RoomId) of
        [#preparation_room{pid = Pid, is_open = true}]
            when is_pid(Pid) ->
            Pid ! close;
        _ -> closed
    end.

logout(Pid, Id) -> leave(Pid, Id).

match(Pid, Mates) when is_pid(Pid) ->
    gen_server:call(Pid, {match, Mates});
match(_, _) -> {false, lang:get("匹配失败，请退出准备厅")}.

unmatch(Pid, Id) when is_pid(Pid) ->
    Pid ! {unmatch, Id};
unmatch(_, _) -> ok.

delay_action(Timeout, Ids, M, F, A) ->
    erlang:send_after(Timeout * 1000,
                      self(),
                      {apply_matched, Ids, M, F, A}).

start_link(Id, Mode) ->
    gen_server:start_link(preparation_room, [Id, Mode], []).

init([Id, Mode = 1]) ->
    Room = #preparation_room{id = Id, pid = self(),
                             mode = Mode},
    update(Room),
    {ok, Room};
init([Id, Mode]) ->
    case preparation_data:get(Id) of
        #{map := MapBase, npc := Npc} ->
            case map_mgr:create(MapBase) of
                {ok, MapPid, MapId} ->
                    create_units({47, MapId}, Npc),
                    Room = #preparation_room{id = Id, map_id = MapId,
                                             map_pid = MapPid, pid = self(),
                                             mode = Mode},
                    update(Room),
                    {ok, Room};
                _Err ->
                    logger:error("创建大厅失败: ~w",
                                 [_Err],
                                 preparation_room,
                                 155),
                    ok
            end;
        _ ->
            logger:error("没有大厅配置: ~w", [Id], preparation_room, 159),
            {stop, normal}
    end.

handle_call({match, _Mates}, _From,
            Room = #preparation_room{is_open = false}) ->
    Reply = {false, lang:get("大厅已停止匹配、请先退出")},
    {reply, Reply, Room};
handle_call({match, Mates}, _From,
            Room = #preparation_room{matching = Matching,
                                     match_ref = OldRef}) ->
    Team = #preparation_team{ids = Ids} =
               preparation_team:init(Mates),
    NewMaching = [Ids | Matching -- [Ids]],
    Room1 = case Matching of
                [] ->
                    case erlang:is_reference(OldRef) of
                        true -> erlang:cancel_timer(OldRef);
                        _ -> ok
                    end,
                    Ref = erlang:send_after(5000, self(), pair),
                    Room#preparation_room{matching = NewMaching,
                                          match_ref = Ref};
                _ -> Room#preparation_room{matching = NewMaching}
            end,
    Mates1 = [R#preparation_role{status = 1, team_id = Ids}
              || R <- Mates],
    preparation_role:update(Mates1),
    preparation_team:update(Team),
    update(Room1),
    {reply, ok, Room1};
handle_call({check_leave, Id}, _From, Room) ->
    Res = case preparation_role:lookup(Id) of
              [#preparation_role{status = 2}] ->
                  {false, lang:get("已经匹配上了，请稍等")};
              _ -> {ok, do_leave(Id, Room)}
          end,
    case Res of
        {ok, Room1 = #preparation_room{}} -> {reply, ok, Room1};
        _ -> {reply, Res, Room}
    end;
handle_call(_Request, _From, Room) ->
    {reply, false, Room}.

handle_cast(_Msg, Room) -> {noreply, Room}.

handle_info({leave, Id}, Room) ->
    Room1 = do_leave(Id, Room),
    update(Room1),
    {noreply, Room1};
handle_info({unmatch, Id}, Room) ->
    Room1 = do_leave(Id, Room),
    update(Room1),
    {noreply, Room1};
handle_info(pair,
            Room = #preparation_room{matching = Matching,
                                     match_ref = OldRef, id = RoomId}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    Room1 = case pair(Matching, RoomId) of
                [] -> Room#preparation_room{matching = []};
                NewMaching ->
                    Ref = erlang:send_after(5000, self(), pair),
                    Room#preparation_room{matching = NewMaching,
                                          match_ref = Ref}
            end,
    update(Room1),
    {noreply, Room1};
handle_info({apply_matched, Ids, M, F, A},
            Room = #preparation_room{id = RoomId}) ->
    Mates = preparation_team:get_mates(Ids),
    case catch erlang:spawn(M, F, [Mates | A]) of
        ok -> ok;
        _Res ->
            logger:debug("执行结果 ~w", [_Res], preparation_room, 242),
            ok
    end,
    [preparation_role:delete(Mid) || Mid <- Ids],
    preparation_team:delete(Ids),
    [role:apply(async,
                MPid,
                {preparation_role, callback, [{set_status, RoomId, 0}]})
     || #preparation_role{pid = MPid} <- Mates,
        is_pid(MPid)],
    {noreply, Room};
handle_info(open, Room) ->
    Room1 = Room#preparation_room{is_open = true},
    update(Room1),
    {noreply, Room1};
handle_info(close,
            Room = #preparation_room{map_pid = MapPid})
    when is_pid(MapPid) ->
    map:async_apply(MapPid,
                    {preparation_role, callback, [leave]}),
    Room1 = Room#preparation_room{is_open = false},
    update(Room1),
    {noreply, Room1};
handle_info(close, Room) ->
    Room1 = Room#preparation_room{is_open = false},
    update(Room1),
    {noreply, Room1};
handle_info(_Info, Room) ->
    logger:error("无效消息 ~w", [_Info], preparation_room, 268),
    {noreply, Room}.

terminate(_Reason,
          _Room = #preparation_room{id = Id}) ->
    delete(Id),
    ok.

code_change(_OldVsn, Room, _Extra) -> {ok, Room}.

do_open([], _Mode) -> ok;
do_open([Id | T], Mode) ->
    start_link(Id, Mode),
    do_open(T, Mode).

pair(Matching, RoomId) ->
    Cfg = preparation_data:get(RoomId),
    preparation_team:pair(Matching, Cfg).

create_units(_Where, []) -> ok;
create_units(Where = {GuildBattleId, MapId},
             [{BaseId, X, Y} | T]) ->
    unit_mgr:create(GuildBattleId, BaseId, {MapId, X, Y}),
    create_units(Where, T).

do_leave(Id,
         Room = #preparation_room{matching = Matching,
                                  id = RoomId}) ->
    DelIds = case preparation_role:lookup(Id) of
                 [#preparation_role{status = 1, team_id = Ids}] ->
                     L = preparation_team:get_mates(Ids),
                     [role:apply(async,
                                 MPid,
                                 {preparation_role,
                                  callback,
                                  [{unmatch, RoomId}]})
                      || #preparation_role{id = I, pid = MPid} <- L,
                         I =/= Id andalso is_pid(MPid)],
                     [preparation_role:delete(I) || I <- Ids],
                     preparation_team:delete(Ids),
                     [Ids];
                 _ -> []
             end,
    NewMaching = Matching -- DelIds,
    Room#preparation_room{matching = NewMaching}.

