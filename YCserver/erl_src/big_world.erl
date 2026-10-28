-file("src/sys/big_world.erl", 1).

-module(big_world).

-behaviour(gen_server).

-export([start_link/0,
         ready/5,
         call/3,
         call/5,
         cast/3,
         cast/4,
         cast/5,
         is_connect/0,
         is_big_world_center/0,
         reload/0]).

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

-file("src/sys/big_world.erl", 26).

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

-file("src/sys/big_world.erl", 27).

-record(state, {node, remote_pid, ref}).

start_link() ->
    gen_server:start_link({local, big_world},
                          big_world,
                          [],
                          []).

ready(RemotePid, NodeName, CenterVer, CenterPlatform,
      CenterZoneId) ->
    gen_server:cast(big_world,
                    {ready,
                     RemotePid,
                     NodeName,
                     CenterVer,
                     CenterPlatform,
                     CenterZoneId}).

call(M, F, A) ->
    case env:get(big_world_center) of
        #{ready := 1, node := Node} -> rpc:call(Node, M, F, A);
        _ -> {error, big_world_not_ready}
    end.

call(Platform, ZoneId, M, F, A) ->
    case env:get(big_world_center) of
        #{platform := P, zone_id := Z}
            when Platform =:= P andalso ZoneId =:= Z ->
            apply(M, F, A);
        #{center_platform := CenterPlatform,
          center_zone_id := CenterZoneId}
            when Platform =:= CenterPlatform andalso
                     ZoneId =:= CenterZoneId ->
            call(M, F, A);
        #{combine := C, ready := IsReady} ->
            case lists:member({Platform, ZoneId}, C) of
                true -> apply(M, F, A);
                false when IsReady =:= 1 ->
                    case catch ets:lookup(big_world_mirrors,
                                          {Platform, ZoneId})
                        of
                        [] -> {error, node_not_found};
                        [#mirror{ready = 1, nodename = NodeName}] ->
                            case rpc:call(NodeName, M, F, A) of
                                {badrpc, Reason} -> {error, Reason};
                                Rtn -> Rtn
                            end;
                        _ -> {error, node_not_ready}
                    end;
                _ -> {error, big_world_not_ready}
            end;
        _ -> {error, big_world_not_ready}
    end.

cast(M, F, A) ->
    case env:get(big_world_center) of
        #{ready := 1, node := Node} -> rpc:cast(Node, M, F, A);
        _ -> {error, big_world_not_ready}
    end.

cast(all, M, F, A) ->
    Fun = fun (#mirror{nodename = Name, ready = 1,
                       flag = main},
               Acc) ->
                  [Name | Acc];
              (_, Acc) -> Acc
          end,
    do_cast(ets:foldl(Fun, [], big_world_mirrors), M, F, A);
cast(Platform, M, F, A) when is_bitstring(Platform) ->
    Fun = fun (#mirror{id = {P, _Z}, nodename = Name,
                       ready = 1, flag = main},
               Acc)
                  when P =:= Platform ->
                  [Name | Acc];
              (_, Acc) -> Acc
          end,
    do_cast(ets:foldl(Fun, [], big_world_mirrors), M, F, A).

cast(Platform, ZoneId, M, F, A) ->
    case env:get(big_world_center) of
        #{platform := P, zone_id := Z}
            when Platform =:= P andalso ZoneId =:= Z ->
            apply(M, F, A);
        #{center_platform := CenterPlatform,
          center_zone_id := CenterZoneId}
            when Platform =:= CenterPlatform andalso
                     ZoneId =:= CenterZoneId ->
            cast(M, F, A);
        #{combine := C, ready := IsReady} ->
            case lists:member({Platform, ZoneId}, C) of
                true -> apply(M, F, A);
                false when IsReady =:= 1 ->
                    case catch ets:lookup(big_world_mirrors,
                                          {Platform, ZoneId})
                        of
                        [] -> {error, node_not_found};
                        [#mirror{ready = 1, nodename = NodeName}] ->
                            rpc:cast(NodeName, M, F, A),
                            ok;
                        _ -> {error, node_not_ready}
                    end;
                _ -> {error, big_world_not_ready}
            end;
        _ -> {error, big_world_not_ready}
    end.

is_connect() ->
    case env:get(big_world_center) of
        #{ready := 1, node := Node, pid := RemotePid} ->
            {true, {Node, RemotePid}};
        _ -> false
    end.

is_big_world_center() ->
    case env:get(is_big_world_center) of
        true -> true;
        _ -> false
    end.

reload() -> big_world ! reload.

fire(big_world_center_connect) ->
    erlang:send_after(60000, rencounter_agent, reset_role),
    ok;
fire(big_world_center_disconnect) -> ok.

sync_combine_mirror(Mirror = #mirror{id = DestZone,
                                     flag = Flag},
                    CombineList) ->
    lists:foreach(fun ({Plat, ZoneId}) ->
                          CombineMirror = Mirror#mirror{id = {Plat, ZoneId},
                                                        combine = [],
                                                        flag = sub},
                          ets:insert(big_world_mirrors, CombineMirror)
                  end,
                  CombineList),
    ets:insert(big_world_mirrors, Mirror),
    case Flag of
        main ->
            c_big_world:update_merge_mapping(DestZone, CombineList);
        _ -> skip
    end,
    ok.

init([]) ->
    logger:info("[~w] 正在启动...",
                [big_world],
                big_world,
                192),
    State = #state{},
    ets:new(big_world_mirrors,
            [set, named_table, public, {keypos, #mirror.id}]),
    env:set(is_big_world_center, false),
    logger:info("[~w] 启动完成", [big_world], big_world, 196),
    erlang:send_after(util:rand(30000, 60000),
                      self(),
                      check_online),
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({ready,
             RemotePid,
             CenterName,
             CenterVer,
             CenterPlatform,
             CenterZoneId},
            State = #state{node = undefined}) ->
    CurVer = env:get(version),
    case CurVer =:= CenterVer of
        true ->
            Ref = erlang:monitor(process, RemotePid),
            Platform = env:get(platform),
            ZoneId = env:get(zone_id),
            CombineZone = env:get(combine),
            env:set(big_world_center,
                    #{ready => 1, pid => RemotePid, node => CenterName,
                      platform => Platform, zone_id => ZoneId,
                      combine => CombineZone,
                      center_platform => CenterPlatform,
                      center_zone_id => CenterZoneId}),
            RemotePid !
                {ready, self(), {Platform, ZoneId}, CombineZone},
            logger:info("已经与大世界中央服[~w]建立连接",
                        [CenterName],
                        big_world,
                        214),
            fire(big_world_center_connect),
            {noreply,
             State#state{remote_pid = RemotePid, node = CenterName,
                         ref = Ref}};
        false -> {noreply, State}
    end;
handle_cast(Msg, State) ->
    logger:error("收到未知消息: ~w", [Msg], big_world, 222),
    {noreply, State}.

handle_info(check_online, State) ->
    case env:get(big_world_center) of
        #{ready := 0} ->
            erlang:send_after(util:rand(30000, 60000),
                              self(),
                              check_online),
            self() ! reload;
        _ -> ingore
    end,
    {noreply, State};
handle_info(reload, State) ->
    case check_connect([world_lev,
                        env_set,
                        node,
                        version,
                        cookie],
                       #{})
        of
        {true, _Args = #{big_world_node := BigWorldNode}} ->
            connect_big_world(BigWorldNode);
        _Else -> ingore
    end,
    {noreply, State};
handle_info({ready_join,
             _LocalNode = #mirror{},
             AllMirrors},
            State) ->
    lists:foreach(fun (Mirror = #mirror{combine =
                                            CombineList}) ->
                          sync_combine_mirror(Mirror, CombineList)
                  end,
                  AllMirrors),
    logger:debug("当前节点成功加入大世界, 并收到其他节点连接信息",
                 [],
                 big_world,
                 254),
    {noreply, State#state{}};
handle_info({join,
             M = #mirror{id = _Id, combine = CombineList}},
            State = #state{}) ->
    logger:debug("节点[~p]加入了大世界集群, 合服列表[~p]",
                 [_Id, CombineList],
                 big_world,
                 259),
    sync_combine_mirror(M, CombineList),
    {noreply, State};
handle_info({update,
             M = #mirror{id = _Id, combine = CombineList}},
            State = #state{}) ->
    sync_combine_mirror(M, CombineList),
    logger:debug("节点[~p]更新了大世界集群信息, 合服列表[~p]",
                 [_Id, CombineList],
                 big_world,
                 266),
    {noreply, State#state{}};
handle_info({leave,
             M = #mirror{id = _Id, combine = CombineList}},
            State = #state{}) ->
    logger:debug("节点[~p]离开了大世界集群, 合服列表[~p]",
                 [_Id, CombineList],
                 big_world,
                 271),
    sync_combine_mirror(M, CombineList),
    {noreply, State};
handle_info({'DOWN', Ref, _Type, _Object, Reason},
            State = #state{ref = Ref}) ->
    #{node := NodeName} = env:get(big_world_center),
    logger:info("与大世界中央服[~w]的连接已经断开: ~w",
                [NodeName, Reason],
                big_world,
                277),
    erlang:demonitor(Ref),
    env:set(big_world_center,
            #{ready => 0, pid => undefined, node => undefined,
              platform => env:get(platform),
              zone_id => env:get(zone_id),
              combine => env:get(combine)}),
    fire(big_world_center_disconnect),
    erlang:send_after(util:rand(30000, 60000),
                      self(),
                      check_online),
    {noreply,
     State#state{remote_pid = undefined, ref = undefined,
                 node = undefined}};
handle_info(Info, State) ->
    logger:error("收到未知消息: ~w", [Info], big_world, 288),
    {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_cast([], _M, _F, _A) -> ok;
do_cast([N | T], M, F, A) ->
    rpc:cast(N, M, F, A),
    do_cast(T, M, F, A).

check_connect([], Args) -> {true, Args};
check_connect([env_set | Rest], Args) ->
    case env:get(is_connect_big_world) of
        1 -> check_connect(Rest, Args);
        _ -> false
    end;
check_connect([world_lev | Rest], Args) ->
    check_connect(Rest, Args);
check_connect([node | Rest], Args) ->
    case env:get(big_world_node) of
        undefined -> false;
        CenterNodeName ->
            case net_adm:ping(CenterNodeName) of
                pong ->
                    check_connect(Rest,
                                  Args#{big_world_node => CenterNodeName});
                pang -> false
            end
    end;
check_connect([_Oth | Rest], Args) ->
    check_connect(Rest, Args).

connect_big_world(CenterNodeName) ->
    Platform = env:get(platform),
    ZoneId = env:get(zone_id),
    Ver = env:get(version),
    Cookie = env:get(cookie),
    LocalNode = erlang:node(),
    Mirror = #mirror{id = {Platform, ZoneId},
                     nodename = LocalNode, cookie = Cookie, ver = Ver},
    case rpc:call(CenterNodeName,
                  c_big_world_mgr,
                  big_world_connect,
                  [Mirror])
        of
        {badrpc, Reason} -> {error, Reason};
        Rtn -> Rtn
    end.

