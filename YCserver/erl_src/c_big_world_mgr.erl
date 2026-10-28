-file("src/center/big_world/c_big_world_mgr.erl", 1).

-module(c_big_world_mgr).

-behaviour(gen_server).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([start_link/0,
         start_big_world_mirror/2,
         stop_big_world_mirror/2,
         add/1,
         add/2,
         del/2,
         info/2,
         all_zone/0,
         mirrors/0,
         sync_node/1,
         ready_node/1,
         leave_node/1,
         close_node/1,
         update_node/1,
         reload_node/1,
         big_world_connect/1]).

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

-file("src/center/big_world/c_big_world_mgr.erl", 32).

-file("inc/mirror.hrl", 1).

-record(mirror,
        {id = {"", 0} :: {bitstring(), non_neg_integer()},
         disabled = 0 :: atom(),
         auto_connect = 0 :: 0 | 1,
         nodename :: undefined | atom(),
         type = zone :: center | zone | oms,
         cookie = "m8B2E89I@O1n3z1" :: string(),
         node_connected = false :: boolean(),
         ready = 0 :: 0 | 1,
         pid :: undefined | pid(),
         remote_pid :: undefined | pid(),
         ref :: undefined | reference(),
         ver = "" :: string(),
         flag = main :: main | sub,
         combine = []}).

-file("src/center/big_world/c_big_world_mgr.erl", 33).

-record(state, {}).

start_link() ->
    gen_server:start_link({local, c_big_world_mgr},
                          c_big_world_mgr,
                          [],
                          []).

start_big_world_mirror(Platform, ZoneId) ->
    case info(Platform, ZoneId) of
        {ok, #mirror{pid = Pid}} when is_pid(Pid) -> ok;
        {ok, Mirror} ->
            gen_server:cast(c_big_world_mgr,
                            {start_big_world_mirror, Mirror});
        Err -> Err
    end.

stop_big_world_mirror(Platform, ZoneId) ->
    case info(Platform, ZoneId) of
        {ok,
         #mirror{id = Id, pid = Pid, flag = main,
                 combine = Combine}} ->
            case is_pid(Pid) andalso is_process_alive(Pid) of
                true -> c_big_world:stop(Pid);
                false ->
                    ets:delete(big_world_mirrors, Id),
                    lists:foreach(fun ({P, Z}) ->
                                          ets:delete(big_world_mirrors, {P, Z});
                                      (_) -> skip
                                  end,
                                  Combine)
            end;
        {ok, #mirror{flag = sub}} -> ok;
        {error, mirror_not_exists} -> ok;
        Err -> Err
    end.

info(Platform, ZoneId) ->
    case catch ets:lookup(big_world_mirrors,
                          {Platform, ZoneId})
        of
        [Node] -> {ok, Node};
        [] -> {error, mirror_not_exists};
        {'EXIT', {badarg, _}} ->
            {error, c_center_mgr_not_running};
        Err -> {error, Err}
    end.

all_zone() ->
    [Id
     || #mirror{id = Id, type = zone, node_connected = true}
            <- ets:tab2list(big_world_mirrors)].

add([]) -> ok;
add([{Platform, ZoneId} | T]) ->
    add(Platform, ZoneId),
    add(T);
add([_ | T]) -> add(T).

add(Platform, ZoneId) ->
    case info(Platform, ZoneId) of
        {ok, _} ->
            logger:debug("节点[~ts ~w]已经存在",
                         [Platform, ZoneId],
                         c_big_world_mgr,
                         102),
            {error, mirror_exists};
        {error, mirror_not_exists} ->
            gen_server:cast(c_big_world_mgr,
                            {add, Platform, ZoneId}),
            ok;
        {error, Reason} -> {error, Reason}
    end.

del(Platform, ZoneId) ->
    case info(Platform, ZoneId) of
        {ok, #mirror{pid = Pid}} when is_pid(Pid) ->
            c_big_world:stop(Pid),
            ok;
        {ok, _} ->
            ets:delete(big_world_mirrors, {Platform, ZoneId}),
            ok;
        {error, Reason} -> {error, Reason}
    end.

reload_node({P, Z}) ->
    case mirrors(P, Z) of
        {error, Err1} ->
            logger:error("更新节点[~w]失败[~w]",
                         [{P, Z}, Err1],
                         c_big_world_mgr,
                         126);
        {ok, Mirror} ->
            case info(P, Z) of
                {ok, #mirror{pid = Pid}} when is_pid(Pid) ->
                    c_big_world:update(Pid, Mirror);
                Err2 ->
                    logger:error("重载节点[~w]时,无法获取镜像状态[~w]",
                                 [{P, Z}, Err2],
                                 c_big_world_mgr,
                                 132)
            end
    end,
    ok.

big_world_connect(M) ->
    gen_server:cast(c_big_world_mgr,
                    {big_world_connect, M}).

sync_node(NodeState) ->
    gen_server:cast(c_big_world_mgr,
                    {sync_node, NodeState}).

ready_node(NodeState) ->
    gen_server:cast(c_big_world_mgr,
                    {ready_node, NodeState}).

leave_node(NodeState) ->
    gen_server:cast(c_big_world_mgr,
                    {leave_node, NodeState}).

close_node(NodeState) ->
    gen_server:cast(c_big_world_mgr,
                    {close_node, NodeState}).

update_node(NodeState) ->
    gen_server:cast(c_big_world_mgr,
                    {update_node, NodeState}).

init([]) ->
    logger:info("[~w] 正在启动...",
                [c_big_world_mgr],
                c_big_world_mgr,
                174),
    process_flag(trap_exit, true),
    ets:new(big_world_mirrors,
            [set, named_table, public, {keypos, #mirror.id}]),
    ets:new(merge_zone_mapping, [set, named_table, public]),
    env:set(is_big_world_center, true),
    State = #state{},
    logger:info("[~w] 启动完成",
                [c_big_world_mgr],
                c_big_world_mgr,
                180),
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({big_world_connect,
             M = #mirror{id = {P, Z}, nodename = Nnode,
                         cookie = Ncookie, ver = Nver}},
            State) ->
    case info(P, Z) of
        {ok,
         #mirror{pid = Pid, nodename = Node, cookie = Cookie,
                 ver = Ver}} ->
            case Nnode =:= Node andalso
                     Ncookie =:= Cookie andalso Nver =:= Ver
                of
                true ->
                    case is_pid(Pid) andalso is_process_alive(Pid) of
                        true -> ignore;
                        false ->
                            stop_big_world_mirror(P, Z),
                            do_start_mirror(M)
                    end;
                false ->
                    stop_big_world_mirror(P, Z),
                    do_start_mirror(M)
            end;
        {error, mirror_not_exists} -> do_start_mirror(M);
        _Err ->
            logger:error("查找[~ts_~w]的镜像进程信息失败:~w",
                         [P, Z, _Err],
                         c_big_world_mgr,
                         220)
    end,
    {noreply, State};
handle_cast({start_big_world_mirror, Mirror}, State) ->
    do_start_mirror(Mirror),
    {noreply, State};
handle_cast({sync_node, NodeState}, State) ->
    do_sync(NodeState),
    {noreply, State};
handle_cast({leave_node, NodeState}, State) ->
    do_sync(NodeState),
    do_send_to_all({leave, NodeState}),
    {noreply, State};
handle_cast({update_node, NodeState}, State) ->
    do_sync(NodeState),
    do_send_to_all({update, NodeState}),
    {noreply, State};
handle_cast({close_node, NodeState}, State) ->
    do_send_to_all({leave, NodeState}),
    {noreply, State};
handle_cast({ready_node, NodeState}, State) ->
    do_sync(NodeState),
    do_send_join(NodeState),
    {noreply, State};
handle_cast({add, Platform, ZoneId}, State) ->
    case info(Platform, ZoneId) of
        {error, mirror_not_exists} ->
            case mirrors(Platform, ZoneId) of
                {ok, Mirror} ->
                    do_start_mirror(Mirror),
                    {noreply, State};
                {error, Error} ->
                    logger:error("增加节点[~ts:~w]失败:~w",
                                 [Platform, ZoneId, Error],
                                 c_big_world_mgr,
                                 265),
                    {noreply, State}
            end;
        _ ->
            logger:error("节点[~ts:~w]已经存在无法启动",
                         [Platform, ZoneId],
                         c_big_world_mgr,
                         269),
            {noreply, State}
    end;
handle_cast(reload, State) ->
    logger:info("重载节点", [], c_big_world_mgr, 275),
    do_reload(),
    {noreply, State};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

mirrors() ->
    Sql = "select platform, zone_id, disabled, "
          "auto_connect, nodename, type, cookie, "
          "ver from oms_mirrors",
    case db:get_all(Sql) of
        {error, Err} -> {error, Err};
        {ok, L} ->
            L1 = [to_mirror(MirrorData) || MirrorData <- L],
            {ok, L1}
    end.

mirrors(P, Z) ->
    Sql = "select platform, zone_id, disabled, "
          "auto_connect, nodename, type, cookie, "
          "ver from oms_mirrors where platform "
          "= ? and zone_id = ?",
    case db:get_all(Sql, [P, Z]) of
        {error, Err} -> {error, Err};
        {ok, [L | _]} ->
            L1 = to_mirror(L),
            {ok, L1};
        Err1 -> {error, Err1}
    end.

to_mirror([P,
           Z,
           Disabled,
           AutoConnect,
           NodeName,
           TypeStr,
           Cookie,
           Ver]) ->
    #mirror{id = {P, Z}, disabled = Disabled,
            auto_connect = AutoConnect,
            nodename = util:to_atom(NodeName),
            type = util:to_atom(TypeStr),
            cookie = util:to_atom(Cookie), ver = Ver, flag = main}.

load([], _) -> ok;
load([M = #mirror{nodename = CurNode} | T], CurNode) ->
    ets:insert(big_world_mirrors, M),
    load(T, CurNode);
load([M = #mirror{id = {P, Z}, combine = _Ncombine,
                  nodename = Nnode, cookie = Ncookie, ver = Nver}
      | T],
     CurNode) ->
    case info(P, Z) of
        {ok,
         #mirror{pid = Pid, nodename = Node, cookie = Cookie,
                 ver = Ver}} ->
            case Nnode =:= Node andalso
                     Ncookie =:= Cookie andalso Nver =:= Ver
                of
                true ->
                    case is_pid(Pid) andalso is_process_alive(Pid) of
                        true -> ignore;
                        false ->
                            stop_big_world_mirror(P, Z),
                            do_start_mirror(M)
                    end;
                false ->
                    stop_big_world_mirror(P, Z),
                    do_start_mirror(M)
            end;
        {error, mirror_not_exists} -> do_start_mirror(M);
        _Err ->
            logger:error("查找[~ts_~w]的镜像进程信息失败:~w",
                         [P, Z, _Err],
                         c_big_world_mgr,
                         351)
    end,
    load(T, CurNode);
load(_, _) -> {error, mirror_info_error}.

do_start_mirror(Mirror = #mirror{id = {P, Z},
                                 nodename = NodeName, ver = Version,
                                 cookie = Cookie}) ->
    BigWorldVersion = env:get(version),
    BigWorldCookie = env:get(cookie),
    case BigWorldVersion =:= Version andalso
             BigWorldCookie =:= Cookie
        of
        true ->
            case c_big_world:start_link(NodeName, Mirror) of
                {ok, _} -> ignore;
                {error, {already_started, Pid}} ->
                    logger:error("[~ts_~w]的镜像进程启动重复启动:~w",
                                 [P, Z, Pid],
                                 c_big_world_mgr,
                                 368),
                    ignore;
                {error, Err} ->
                    logger:error("[~ts_~w]的镜像进程启动失败: ~w",
                                 [P, Z, Err],
                                 c_big_world_mgr,
                                 371)
            end,
            ok;
        _ ->
            logger:debug("节点版本[~w]与大世界版本[~w]不一致",
                         [NodeName, Version],
                         c_big_world_mgr,
                         375),
            ingore
    end.

stop_big_world_mirrors([]) -> ok;
stop_big_world_mirrors([{Platform, ZoneId} | T]) ->
    stop_big_world_mirror(Platform, ZoneId),
    stop_big_world_mirrors(T);
stop_big_world_mirrors([#mirror{id = {P, Z}} | T]) ->
    stop_big_world_mirror(P, Z),
    stop_big_world_mirrors(T).

do_send_to_all(Msg) ->
    do_send_to_all(ets:tab2list(big_world_mirrors), Msg).

do_send_to_all([], _) -> ok;
do_send_to_all([#mirror{remote_pid = Pid, ready = Ready,
                        flag = main}
                | T],
               Msg)
    when is_pid(Pid) andalso Ready =:= 1 ->
    Pid ! Msg,
    do_send_to_all(T, Msg);
do_send_to_all([_M | T], Msg) -> do_send_to_all(T, Msg).

do_send_join(M) ->
    AllNode = ets:tab2list(big_world_mirrors),
    do_send_join(M, AllNode, AllNode).

do_send_join(_Mirror, _AllNode, []) -> ok;
do_send_join(M = #mirror{nodename = Node}, AllNode,
             [#mirror{nodename = Node, remote_pid = Pid, ready = 1,
                      flag = main}
              | T])
    when is_pid(Pid) ->
    Pid ! {ready_join, M, AllNode},
    do_send_join(M, AllNode, T);
do_send_join(M, AllNode,
             [#mirror{remote_pid = Pid, ready = 1, flag = main} | T])
    when is_pid(Pid) ->
    Pid ! {join, M},
    do_send_join(M, AllNode, T);
do_send_join(M, AllNode, [_M | T]) ->
    do_send_join(M, AllNode, T).

do_sync(Node = #mirror{combine = CombineList}) ->
    lists:foreach(fun ({Plat, ZoneId}) ->
                          CombineNode = Node#mirror{id = {Plat, ZoneId},
                                                    combine = [], flag = sub},
                          ets:insert(big_world_mirrors, CombineNode)
                  end,
                  CombineList),
    ets:insert(big_world_mirrors, Node).

do_reload() ->
    case mirrors() of
        {error, Err} ->
            logger:error("加载全部节点信息失败:~w",
                         [Err],
                         c_big_world_mgr,
                         431),
            {error, Err};
        {ok, Mirrors} ->
            CenterVer = env:get(version),
            OpenedMirrors = [Mirror
                             || Mirror = #mirror{disabled = Disabled, ver = Ver}
                                    <- Mirrors,
                                Disabled =:= 0 andalso CenterVer =:= Ver],
            ClosedMirrors = [Mirror
                             || Mirror = #mirror{disabled = Disabled, ver = Ver}
                                    <- Mirrors,
                                Disabled =:= 1 orelse CenterVer =/= Ver],
            stop_big_world_mirrors(ClosedMirrors),
            case load(OpenedMirrors, node()) of
                {error, Reason} ->
                    logger:error("重载节点信息失败:~w",
                                 [Reason],
                                 c_big_world_mgr,
                                 447),
                    {error, Reason};
                ok -> ok
            end
    end.

