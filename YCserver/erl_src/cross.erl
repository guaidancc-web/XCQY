-file("src/sys/cross.erl", 1).

-module(cross).

-behaviour(gen_server).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([start_link/0,
         cast/3,
         cast/4,
         cast/5,
         call/3,
         call/5,
         list/0,
         ready/5,
         info/0,
         sync_combine_mirror/2,
         is_ready/0,
         split_by_zone/2,
         is_merge/0,
         is_center/0,
         get_center_lev/0,
         reload/0]).

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

-file("src/sys/cross.erl", 31).

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

-file("src/sys/cross.erl", 32).

-record(state, {remote_pid, ref}).

-spec start_link() -> {ok, pid()} |
                      ignore |
                      {error, term()}.

start_link() ->
    gen_server:start_link({local, cross}, cross, [], []).

-spec cast(Group, M, F, A) -> ok when Group :: all |
                                               p(),
                                      M :: atom(), F :: atom(), A :: list().

cast(all, M, F, A) ->
    Fun = fun (#mirror{nodename = Name, ready = 1,
                       flag = main},
               Acc) ->
                  [Name | Acc];
              (_, Acc) -> Acc
          end,
    do_cast(ets:foldl(Fun, [], mirrors), M, F, A);
cast(Platform, M, F, A) when is_bitstring(Platform) ->
    Fun = fun (#mirror{id = {P, _Z}, nodename = Name,
                       ready = 1, flag = main},
               Acc)
                  when P =:= Platform ->
                  [Name | Acc];
              (_, Acc) -> Acc
          end,
    do_cast(ets:foldl(Fun, [], mirrors), M, F, A).

-spec cast(atom(), atom(), list()) -> term() |
                                      {error, term()}.

cast(M, F, A) ->
    case env:get(center) of
        #center{ready = 1, node = Node} ->
            rpc:cast(Node, M, F, A),
            ok;
        _ -> {error, center_not_ready}
    end.

-spec call(atom(), atom(), list()) -> term() |
                                      {error, term()}.

call(M, F, A) ->
    case env:get(center) of
        #center{ready = 1, node = Node} ->
            case rpc:call(Node, M, F, A) of
                {badrpc, Reason} -> {error, Reason};
                Rtn -> Rtn
            end;
        _ -> {error, center_not_ready}
    end.

-spec cast(Platform, ZoneId, M, F, A) -> ok |
                                         {error, center_not_ready} |
                                         {error, node_not_found} |
                                         {error, node_not_ready} |
                                         {error, term()} when Platform ::
                                                                  bitstring(),
                                                              ZoneId ::
                                                                  non_neg_integer(),
                                                              M :: atom(),
                                                              F :: atom(),
                                                              A :: list().

cast(Platform, ZoneId, M, F, A) ->
    case env:get(center) of
        #center{platform = P, zone_id = Z}
            when Platform =:= P andalso ZoneId =:= Z ->
            apply(M, F, A);
        #center{center_platform = CenterPlatform,
                center_zone_id = CenterZoneId}
            when Platform =:= CenterPlatform andalso
                     ZoneId =:= CenterZoneId ->
            cast(M, F, A);
        #center{combine = C, ready = IsReady} ->
            case lists:member({Platform, ZoneId}, C) of
                true -> apply(M, F, A);
                false when IsReady =:= 1 ->
                    case catch ets:lookup(mirrors, {Platform, ZoneId}) of
                        [] -> {error, node_not_found};
                        [#mirror{ready = 1, nodename = NodeName}] ->
                            rpc:cast(NodeName, M, F, A),
                            ok;
                        _ -> {error, node_not_ready}
                    end;
                _ -> {error, center_not_ready}
            end;
        _ -> {error, center_not_ready}
    end.

-spec call(Platform, ZoneId, M, F, A) -> term() |
                                         {error, center_not_ready} |
                                         {error, node_not_found} |
                                         {error, node_not_ready} |
                                         {error, term()} when Platform ::
                                                                  bitstring(),
                                                              ZoneId ::
                                                                  non_neg_integer(),
                                                              M :: atom(),
                                                              F :: atom(),
                                                              A :: list().

call(Platform, ZoneId, M, F, A) ->
    case env:get(center) of
        #center{platform = P, zone_id = Z}
            when Platform =:= P andalso ZoneId =:= Z ->
            apply(M, F, A);
        #center{center_platform = CenterPlatform,
                center_zone_id = CenterZoneId}
            when Platform =:= CenterPlatform andalso
                     ZoneId =:= CenterZoneId ->
            call(M, F, A);
        #center{combine = C, ready = IsReady} ->
            case lists:member({Platform, ZoneId}, C) of
                true -> apply(M, F, A);
                false when IsReady =:= 1 ->
                    case catch ets:lookup(mirrors, {Platform, ZoneId}) of
                        [] -> {error, node_not_found};
                        [#mirror{ready = 1, nodename = NodeName}] ->
                            case rpc:call(NodeName, M, F, A) of
                                {badrpc, Reason} -> {error, Reason};
                                Rtn -> Rtn
                            end;
                        _ -> {error, node_not_ready}
                    end;
                _ -> {error, center_not_ready}
            end;
        _ -> {error, center_not_ready}
    end.

-spec list() -> {error, center_not_ready} | [#mirror{}].

list() ->
    case env:get(center) of
        #center{ready = 1} ->
            [N || N = #mirror{ready = 1} <- ets:tab2list(mirrors)];
        _ -> {error, center_not_ready}
    end.

info() ->
    lists:zip([record_name | record_info(fields, center)],
              tuple_to_list(env:get(center))).

fire(center_connect) ->
    role_group:pack_send(world, 10020, {1}),
    ok;
fire(center_disconnect) ->
    role_group:pack_send(world, 10020, {0}),
    ok.

sync_combine_mirror(Mirror = #mirror{id = DestZone,
                                     flag = Flag},
                    CombineList) ->
    lists:foreach(fun ({Plat, ZoneId}) ->
                          CombineMirror = Mirror#mirror{id = {Plat, ZoneId},
                                                        combine = [],
                                                        flag = sub},
                          ets:insert(mirrors, CombineMirror)
                  end,
                  CombineList),
    ets:insert(mirrors, Mirror),
    case Flag of
        main ->
            c_mirror:update_merge_mapping(DestZone, CombineList);
        _ -> skip
    end,
    ok.

is_ready() ->
    case env:get(center) of
        #center{ready = IsReady} -> IsReady;
        _ -> 0
    end.

split_by_zone(List, Pos) ->
    split_by_zone(List, Pos, []).

split_by_zone([], _Pos, List) ->
    [{Dest, lists:reverse(L)} || {Dest, L} <- List];
split_by_zone([R | T], Pos, List) ->
    {P, Z} = case element(Pos, R) of
                 {_, P1, Z1} -> {P1, Z1};
                 {P1, Z1} -> {P1, Z1}
             end,
    Dest = c_mirror:get_zone_mapping(P, Z),
    NewList = case lists:keyfind(Dest, 1, List) of
                  false -> [{Dest, [R]} | List];
                  {Dest, L1} ->
                      lists:keyreplace(Dest, 1, List, {Dest, [R | L1]})
              end,
    split_by_zone(T, Pos, NewList).

is_merge() ->
    case env:get(combine) of
        [_ | _] -> true;
        [] -> false;
        _Err ->
            logger:error("无法获取合服状态:~w", [_Err], cross, 244),
            false
    end.

is_center() ->
    case env:get(is_center) of
        true -> true;
        _ -> false
    end.

-spec get_center_lev() -> high | low | false.

get_center_lev() ->
    case is_center() of
        true ->
            case env:get(zone_id) of
                9000 -> high;
                _ -> low
            end;
        _ ->
            case env:get(center) of
                #center{ready = 1, center_zone_id = 9000} -> high;
                #center{ready = 1} -> low;
                _ -> false
            end
    end.

reload() -> cross ! reload.

ready(RemotePid, NodeName, CenterVer, CenterPlatform,
      CenterZoneId) ->
    gen_server:cast(cross,
                    {ready,
                     RemotePid,
                     NodeName,
                     CenterVer,
                     CenterPlatform,
                     CenterZoneId}).

init([]) ->
    logger:info("[~w] 正在启动...", [cross], cross, 291),
    process_flag(trap_exit, true),
    ets:new(mirrors,
            [set, named_table, public, {keypos, #mirror.id}]),
    ets:new(merge_zone_mapping, [set, named_table, public]),
    env:set(is_cross_center, false),
    State = #state{},
    erlang:send_after(util:rand(30000, 60000),
                      self(),
                      check_online),
    logger:info("[~w] 启动完成", [cross], cross, 301),
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({ready,
             RemotePid,
             CenterName,
             CenterVer,
             CenterPlatform,
             CenterZoneId},
            State) ->
    CurVer = env:get(version),
    env:set(center_version, CenterVer),
    case CurVer =:= CenterVer of
        true ->
            Ref = erlang:monitor(process, RemotePid),
            Platform = env:get(platform),
            ZoneId = env:get(zone_id),
            CombineZone = env:get(combine),
            env:set(center,
                    #center{ready = 1, pid = RemotePid, node = CenterName,
                            platform = Platform, zone_id = ZoneId,
                            combine = CombineZone,
                            center_platform = CenterPlatform,
                            center_zone_id = CenterZoneId}),
            RemotePid !
                {ready, self(), {Platform, ZoneId}, CombineZone},
            logger:info("已经与中央服建立连接, 等待中央服返回其他节点信息",
                        [],
                        cross,
                        319),
            fire(center_connect),
            {noreply,
             State#state{remote_pid = RemotePid, ref = Ref}};
        false -> {noreply, State}
    end;
handle_cast(Msg, State) ->
    logger:error("中央服镜像进程收到未知消息: ~w", [Msg], cross, 327),
    {noreply, State}.

handle_info(check_online, State) ->
    case is_ready() of
        0 ->
            erlang:send_after(util:rand(30000, 60000),
                              self(),
                              check_online),
            self() ! reload;
        _ -> ingore
    end,
    {noreply, State};
handle_info(reload, State) ->
    logger:debug("重载加入跨服:", [], cross, 344),
    case check_connect([world_lev, env_set, node], #{}) of
        {true, _Args = #{center_node := CenterNode}} ->
            connect_center(CenterNode);
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
    logger:debug("当前节点成功加入, 并收到其他节点连接信息", [], cross, 358),
    {noreply, State#state{}};
handle_info({join,
             M = #mirror{id = _Id, combine = CombineList}},
            State = #state{}) ->
    logger:debug("节点[~p]加入了集群, 合服列表[~p]",
                 [_Id, CombineList],
                 cross,
                 363),
    sync_combine_mirror(M, CombineList),
    {noreply, State};
handle_info({update,
             M = #mirror{id = _Id, combine = CombineList}},
            State = #state{}) ->
    sync_combine_mirror(M, CombineList),
    logger:debug("节点[~p]更新了信息, 合服列表[~p]",
                 [_Id, CombineList],
                 cross,
                 370),
    {noreply, State#state{}};
handle_info({leave,
             M = #mirror{id = _Id, combine = CombineList}},
            State = #state{}) ->
    logger:debug("节点[~p]离开了集群, 合服列表[~p]",
                 [_Id, CombineList],
                 cross,
                 375),
    sync_combine_mirror(M, CombineList),
    {noreply, State};
handle_info({'DOWN', Ref, _Type, _Object, Reason},
            State = #state{ref = Ref}) ->
    #center{node = NodeName} = env:get(center),
    logger:info("与中央服[~w]的连接已经断开: ~w",
                [NodeName, Reason],
                cross,
                381),
    erlang:demonitor(Ref),
    env:set(center,
            #center{ready = 0, pid = undefined, node = undefined,
                    platform = env:get(platform),
                    zone_id = env:get(zone_id),
                    combine = env:get(combine)}),
    fire(center_disconnect),
    ets:delete_all_objects(mirrors),
    erlang:send_after(util:rand(30000, 60000),
                      self(),
                      check_online),
    {noreply,
     State#state{remote_pid = undefined, ref = undefined}};
handle_info(Info, State) ->
    logger:error("中央服镜像进程收到未知消息: ~w", [Info], cross, 393),
    {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...", [cross], cross, 397),
    logger:info("[~w] 关闭完成", [cross], cross, 398),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_cast([], _M, _F, _A) -> ok;
do_cast([N | T], M, F, A) ->
    rpc:cast(N, M, F, A),
    do_cast(T, M, F, A).

check_connect([], Args) -> {true, Args};
check_connect([env_set | Rest], Args) ->
    case env:get(is_connect_center) of
        1 -> check_connect(Rest, Args);
        _ -> false
    end;
check_connect([world_lev | Rest], Args) ->
    case is_center() of
        true -> true;
        _ ->
            {WroldLev, _} = world_lev:get_world_lev(),
            case WroldLev >= 50 of
                true -> check_connect(Rest, Args);
                _ -> false
            end
    end;
check_connect([node | Rest], Args) ->
    case env:get(center_node) of
        undefined -> false;
        CenterNodeName ->
            case net_adm:ping(CenterNodeName) of
                pong ->
                    check_connect(Rest,
                                  Args#{center_node => CenterNodeName});
                pang -> false
            end
    end;
check_connect([_Oth | Rest], Args) ->
    check_connect(Rest, Args).

connect_center(CenterNodeName) ->
    Platform = env:get(platform),
    ZoneId = env:get(zone_id),
    Ver = env:get(version),
    Cookie = env:get(cookie),
    LocalNode = erlang:node(),
    Mirror = #mirror{id = {Platform, ZoneId},
                     nodename = LocalNode, cookie = Cookie, ver = Ver},
    case rpc:call(CenterNodeName,
                  c_mirror_mgr,
                  cross_connect,
                  [Mirror])
        of
        {badrpc, Reason} -> {error, Reason};
        Rtn -> Rtn
    end.

