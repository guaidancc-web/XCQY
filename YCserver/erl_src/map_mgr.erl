-file("src/mod/map/map_mgr.erl", 1).

-module(map_mgr).

-behaviour(gen_server).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([start_link/1,
         pid/1,
         pid/3,
         info/1,
         info/3,
         path/4,
         paths/4,
         is_blocked/3,
         is_blocked/4,
         create/1,
         get_map_tile/1,
         get_map_size/1,
         rand_point/2]).

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

-file("src/mod/map/map_mgr.erl", 29).

-file("inc/map.hrl", 1).

-record(map,
        {id = 1 :: pos_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         base_id = 1 :: pos_integer(),
         res_id = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         ctrl_pid :: undefined | pid(),
         grid_info = [] :: [{pid(), pos_integer()}],
         name = "" :: bitstring(),
         condition = [] :: list(),
         num = 0 :: non_neg_integer(),
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer()}).

-record(map_grid,
        {map_pid :: undefined | pid(),
         map_id = 1 :: pos_integer(),
         base_id = 1 :: pos_integer(),
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer()}).

-record(map_data,
        {id = 1 :: pos_integer(),
         name = "" :: list(),
         condition = [] :: [tuple()],
         revive = [] :: [tuple()],
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer(),
         grid_x = 0 :: pos_integer(),
         grid_y = 0 :: pos_integer(),
         max_pre_layer = 60 :: pos_integer(),
         startup = 0 :: 0..1,
         is_single = 0 :: 0..1}).

-file("src/mod/map/map_mgr.erl", 30).

-record(state, {next_id = 100000}).

-spec start_link(tuple()) -> {ok, pid()} |
                             ignore |
                             {error, term()}.

start_link(Mod) ->
    gen_server:start_link({local, map_mgr},
                          map_mgr,
                          [Mod],
                          []).

-spec create(pos_integer()) -> {ok,
                                pid(),
                                pos_integer()} |
                               {error, term()}.

create(BaseId) ->
    NormalMap = map_data:startup(),
    case lists:member(BaseId, NormalMap) of
        true -> {error, map_type_error};
        false ->
            case map_data:get(BaseId) of
                {error, Reason} -> {error, Reason};
                {ok,
                 #map_data{condition = Cond, width = W, height = H,
                           name = Name}} ->
                    Id = gen_server:call(map_mgr, fetch_id),
                    Map = #map{platform = env:get(platform),
                               zone_id = env:get(zone_id), id = Id,
                               base_id = BaseId, name = Name, condition = Cond,
                               width = W, height = H},
                    case catch map:start_link(Map) of
                        {ok, MapPid} -> {ok, MapPid, Id};
                        _Err ->
                            logger:error("创建地图进程失败:~w", [_Err], map_mgr, 59),
                            {error, map_create_error}
                    end
            end
    end.

-spec pid(MapId :: pos_integer()) -> {ok, pid()} |
                                     {error, not_found}.

pid(MapId) ->
    case catch ets:lookup_element(map_info, MapId, #map.pid)
        of
        Pid when is_pid(Pid) -> {ok, Pid};
        _Err ->
            logger:error("未发现地图进程[~w:~w]",
                         [MapId, _Err],
                         map_mgr,
                         71),
            {error, not_found}
    end.

-spec pid(Platform :: bitstring(),
          ZoneId :: non_neg_integer(),
          MapId :: pos_integer()) -> {ok, pid()} |
                                     {error, not_found} |
                                     {error, term()}.

pid(Platform, ZoneId, MapId) ->
    cross:call(Platform, ZoneId, map_mgr, pid, [MapId]).

-spec info(pos_integer()) -> {ok, #map{}} |
                             {error, not_found}.

info(MapId) ->
    case catch ets:lookup(map_info, MapId) of
        [Map] -> {ok, Map};
        _ -> {error, not_found}
    end.

-spec info(Platform :: bitstring(),
           ZoneId :: non_neg_integer(),
           MapId :: pos_integer()) -> {ok, #map{}} |
                                      {error, term()}.

info(_Platform, 0, MapId) ->
    cross:call(map_mgr, info, [MapId]);
info(Platform, ZoneId = 9999, MapId) ->
    case env:get(big_world_center) of
        #{platform := CenterPlatform, zone_id := CenterZoneId}
            when Platform =:= CenterPlatform andalso
                     ZoneId =:= CenterZoneId ->
            big_world:call(map_mgr, info, [MapId]);
        _ ->
            big_world:call(Platform, ZoneId, map_mgr, info, [MapId])
    end;
info(Platform, ZoneId, MapId) ->
    case env:get(center) of
        #center{center_platform = CenterPlatform,
                center_zone_id = CenterZoneId}
            when Platform =:= CenterPlatform andalso
                     ZoneId =:= CenterZoneId ->
            cross:call(map_mgr, info, [MapId]);
        _ ->
            cross:call(Platform, ZoneId, map_mgr, info, [MapId])
    end.

-spec is_blocked(MapId :: pos_integer(),
                 BaseId :: pos_integer(), TileX :: pos_integer(),
                 TileY :: pos_integer()) -> boolean().

is_blocked(MapId, BaseId, TileX, TileY) ->
    case catch ets:lookup(map_info_walkable,
                          {BaseId, TileX, TileY})
        of
        [] -> true;
        [_] ->
            case map:is_blocked(MapId, BaseId, TileX, TileY) of
                true -> true;
                false -> false
            end;
        _ -> true
    end.

is_blocked(_MapId, _BaseId, []) -> false;
is_blocked(MapId, BaseId, [{X, Y} | Rest]) ->
    case is_blocked(MapId, BaseId, X, Y) of
        true ->
            logger:debug("格子[~w]不可移动", [{X, Y}], map_mgr, 124),
            true;
        false -> is_blocked(MapId, BaseId, Rest)
    end;
is_blocked(MapId, TileX, TileY) ->
    case info(MapId) of
        {ok, #map{base_id = BaseId}} ->
            is_blocked(MapId, BaseId, TileX, TileY);
        _ -> true
    end.

-spec rand_point(MapId :: pos_integer(),
                 #map_data{} | pos_integer()) -> {X :: pos_integer(),
                                                  Y :: pos_integer()}.

rand_point(MapId, MapBaseId)
    when is_integer(MapBaseId) ->
    {ok, MapData} = map_data:get(MapBaseId),
    rand_point(MapId, MapData);
rand_point(MapId,
           MapData = #map_data{id = MapBaseId, grid_x = GridX,
                               grid_y = GridY, width = W, height = H}) ->
    X = util:rand(30, W - 30),
    Y = util:rand(30, H - 30),
    case map_mgr:is_blocked(MapId,
                            MapBaseId,
                            X div GridX,
                            Y div GridY)
        of
        false -> {X, Y};
        _ -> rand_point(MapId, MapData)
    end.

-spec path(MapId :: pos_integer(),
           BaseId :: pos_integer(),
           Point1 :: {pos_integer(), pos_integer()},
           Point2 :: {pos_integer(), pos_integer()}) -> blocked |
                                                        {pos_integer(),
                                                         pos_integer()}.

path(MapId, BaseId, {X1, Y1}, {X2, Y2}) ->
    {TileWidth, TileHeight} = get_map_tile(BaseId),
    Fx = X1 div TileWidth,
    Fy = Y1 div TileHeight,
    Tx = X2 div TileWidth,
    Ty = Y2 div TileHeight,
    case path(MapId, BaseId, {Fx, Fy}, {Fx, Fy}, {Tx, Ty})
        of
        blocked -> blocked;
        {Tx, Ty} -> {X2, Y2};
        {X, Y} -> {X * TileWidth, Y * TileHeight}
    end.

path(MapId, BaseId, From, S = {X1, Y1}, D = {X2, Y2}) ->
    X = if X1 < X2 -> X1 + 1;
           X1 > X2 -> X1 - 1;
           true -> X1
        end,
    Y = if Y1 < Y2 -> Y1 + 1;
           Y1 > Y2 -> Y1 - 1;
           true -> Y1
        end,
    case is_blocked(MapId, BaseId, X, Y) of
        true when S =:= From -> blocked;
        true -> {X1, Y1};
        false when X =:= X2 andalso Y =:= Y2 -> {X, Y};
        false -> path(MapId, BaseId, From, {X, Y}, D)
    end.

-spec paths(pos_integer(), pos_integer(), tuple(),
            tuple()) -> blocked | list().

paths(MapId, BaseId, {X1, Y1}, {X2, Y2}) ->
    {TileWidth, TileHeight} = get_map_tile(BaseId),
    Fx = X1 div TileWidth,
    Fy = Y1 div TileHeight,
    Tx = X2 div TileWidth,
    Ty = Y2 div TileHeight,
    case paths(MapId,
               BaseId,
               {Fx, Fy},
               {Fx, Fy},
               {Tx, Ty},
               [])
        of
        {{Tx, Ty}, Path} ->
            lists:reverse([{X2, Y2} | [{Xx * TileWidth,
                                        Yy * TileHeight}
                                       || {Xx, Yy} <- Path]]);
        {{Dx, Dy}, Path} ->
            lists:reverse([{Xx * TileWidth, Yy * TileHeight}
                           || {Xx, Yy} <- [{Dx, Dy} | Path]]);
        blocked -> blocked
    end.

paths(MapId, BaseId, From, S = {X1, Y1}, D = {X2, Y2},
      Path) ->
    X = if X1 < X2 -> X1 + 1;
           X1 > X2 -> X1 - 1;
           true -> X1
        end,
    Y = if Y1 < Y2 -> Y1 + 1;
           Y1 > Y2 -> Y1 - 1;
           true -> Y1
        end,
    case is_blocked(MapId, BaseId, X, Y) of
        true when S =:= From -> blocked;
        true -> {{X1, Y1}, Path};
        false when X =:= X2 andalso Y =:= Y2 -> {{X, Y}, Path};
        false ->
            paths(MapId, BaseId, From, {X, Y}, D, [{X, Y} | Path])
    end.

init([Mod]) ->
    logger:info("[~w] 正在启动...", [map_mgr], map_mgr, 219),
    process_flag(trap_exit, true),
    ets:new(map_pid,
            [set, named_table, public, {keypos, 1}]),
    ets:new(map_info,
            [set, named_table, public, {keypos, #map.id}]),
    ets:new(map_info_walkable,
            [set, named_table, protected]),
    ets:new(map_dynamic_block, [set, named_table, public]),
    load_walkable(map_data:all()),
    case Mod of
        center ->
            create_startup([10001,
                            10002,
                            10003,
                            10004,
                            10007,
                            41001,
                            41002,
                            41003,
                            50001,
                            50002,
                            50003,
                            50011,
                            50012,
                            50013,
                            50021,
                            50022,
                            50023,
                            50031,
                            50032,
                            50033,
                            42000,
                            42100,
                            30015,
                            53005,
                            53006,
                            53014]);
        big_world -> create_startup([]);
        _ -> create_startup(map_data:startup())
    end,
    State = #state{},
    logger:info("[~w] 启动完成", [map_mgr], map_mgr, 235),
    {ok, State}.

handle_call(fetch_id, _From,
            State = #state{next_id = Id}) ->
    {reply, Id, State#state{next_id = Id + 1}};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({'EXIT', _Pid, normal}, State) ->
    logger:debug("连接的进程[~w]已经正常退出", [_Pid], map_mgr, 250),
    {noreply, State};
handle_info({'EXIT', Pid, Why}, State) ->
    logger:error("连接的进程[~w]异常退出: ~w",
                 [Pid, Why],
                 map_mgr,
                 255),
    {noreply, State};
handle_info(_Info, State) ->
    logger:error("收到未知消息: ~w", [_Info], map_mgr, 259),
    {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...", [map_mgr], map_mgr, 263),
    logger:info("[~w] 关闭完成", [map_mgr], map_mgr, 264),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

get_map_tile(BaseId) ->
    case map_data:get(BaseId) of
        {ok, #map_data{grid_x = GridX, grid_y = GridY}} ->
            {GridX, GridY};
        _ ->
            logger:error("地图[~w]数据无法找到", [BaseId], map_mgr, 279),
            {30, 30}
    end.

get_map_size(BaseId) ->
    W = case map_data:get(BaseId) of
            {ok, #map_data{width = Width}} -> Width;
            _ -> 1500
        end,
    H = case map_data:get(BaseId) of
            {ok, #map_data{height = Height}} -> Height;
            _ -> 720
        end,
    {W, H}.

create_startup([]) -> ok;
create_startup([BaseId | T]) when BaseId < 100000 ->
    case map_data:get(BaseId) of
        {error, _Reason} ->
            logger:error("创建地图失败:不存在的地图[~w]",
                         [BaseId],
                         map_mgr,
                         298);
        {ok,
         #map_data{id = BaseId, name = Name, condition = Cond,
                   width = W, height = H}} ->
            Map = #map{id = BaseId, platform = env:get(platform),
                       zone_id = env:get(zone_id), name = Name,
                       base_id = BaseId, condition = Cond, width = W,
                       height = H},
            case catch map:start_link(Map) of
                {ok, _Pid} -> ok;
                _Err -> logger:error("创建地图失败:~w", [_Err], map_mgr, 303)
            end
    end,
    create_startup(T);
create_startup([BaseId | T]) ->
    logger:error("创建地图失败:固定地图的ID[~w]不能大于100000",
                 [BaseId],
                 map_mgr,
                 308),
    create_startup(T).

load_walkable([]) -> ok;
load_walkable([BaseId | T]) ->
    case map_data_walkable:get(BaseId) of
        false ->
            logger:error("地图[~w]不存在", [BaseId], map_mgr, 315);
        Block -> do_load_walkable(BaseId, Block)
    end,
    load_walkable(T).

do_load_walkable(_BaseId, []) -> ok;
do_load_walkable(BaseId, [{X, Y} | T]) ->
    ets:insert(map_info_walkable, {{BaseId, X, Y}}),
    do_load_walkable(BaseId, T).

