-file("src/center/big_world/c_big_world.erl", 1).

-module(c_big_world).

-behaviour(gen_server).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([start_link/2,
         stop/1,
         update/2,
         get_zone_mapping/2,
         update_merge_mapping/2]).

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

-file("src/center/big_world/c_big_world.erl", 21).

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

-file("src/center/big_world/c_big_world.erl", 22).

start_link(Name, Node) ->
    gen_server:start_link({local, Name},
                          c_big_world,
                          [Node],
                          []).

-spec stop(pid()) -> ok.

stop(Pid) ->
    Pid ! stop,
    ok.

-spec update(pid(), #mirror{}) -> ok.

update(Pid, Node) ->
    Pid ! {update, Node},
    ok.

get_zone_mapping(Platform, ZoneId) ->
    case catch ets:lookup(merge_zone_mapping,
                          {Platform, ZoneId})
        of
        [{_, {DestPlat, DestZone}}] -> {DestPlat, DestZone};
        _ ->
            case role_misc:is_local_role({Platform, ZoneId}) of
                true -> {env:get(platform), env:get(zone_id)};
                false -> {Platform, ZoneId}
            end
    end.

init([M = #mirror{id = Id, nodename = NodeName,
                  cookie = Cookie}]) ->
    logger:info("正在启动节点[~p]的镜像进程", [Id], c_big_world, 63),
    case env:get(is_big_world_center) of
        true ->
            env:set(big_world_center,
                    #{ready => 1, pid => self(), node => node(),
                      platform => env:get(platform),
                      zone_id => env:get(zone_id),
                      combine => env:get(combine),
                      center_platform => env:get(platform),
                      center_zone_id => env:get(zone_id)});
        _ -> ignore
    end,
    N = util:to_atom(NodeName),
    C = util:to_atom(Cookie),
    erlang:set_cookie(N, C),
    State = M#mirror{pid = self()},
    erlang:send_after(util:rand(3000, 6000),
                      self(),
                      check_online),
    c_big_world_mgr:sync_node(State),
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(check_online, State) ->
    {noreply, check_online(State)};
handle_info({ready, RemotePid, DestZone, CombineZone},
            State = #mirror{nodename = NodeName}) ->
    Ref = erlang:monitor(process, RemotePid),
    logger:info("已经与节点[~w]建立连接, 返回全部全部节点信息",
                [NodeName],
                c_big_world,
                90),
    NewState = State#mirror{ready = 1,
                            remote_pid = RemotePid, ref = Ref,
                            combine = CombineZone},
    update_merge_mapping(DestZone, CombineZone),
    c_big_world_mgr:ready_node(NewState),
    {noreply, NewState};
handle_info({'DOWN', Ref, _Type, _Object, Reason},
            State = #mirror{id = _Id, nodename = NodeName,
                            ref = Ref}) ->
    logger:info("节点[~w]已经断开连接: ~w",
                [NodeName, Reason],
                c_big_world,
                98),
    erlang:demonitor(Ref),
    NewState = State#mirror{ready = 0,
                            remote_pid = undefined, ref = undefined},
    c_big_world_mgr:leave_node(NewState),
    {noreply, check_online(NewState)};
handle_info({update, Node},
            #mirror{node_connected = Connected, ready = Ready,
                    pid = Pid, remote_pid = RemotePid, ref = Ref}) ->
    NewState = Node#mirror{node_connected = Connected,
                           ready = Ready, pid = Pid, remote_pid = RemotePid,
                           ref = Ref},
    c_big_world_mgr:update_node(NewState),
    {noreply, NewState};
handle_info(stop,
            State = #mirror{nodename = NodeName}) ->
    logger:info("节点[~w]的镜像收到关闭命令...",
                [NodeName],
                c_big_world,
                112),
    {stop, normal, State};
handle_info(Info,
            State = #mirror{nodename = NodeName}) ->
    logger:error("节点[~w]的镜像进程收到未知消息: ~w",
                 [NodeName, Info],
                 c_big_world,
                 116),
    {noreply, State}.

terminate(_Reason,
          State = #mirror{id = Id, ref = Ref, nodename = NodeName,
                          combine = Combine}) ->
    case is_reference(Ref) of
        false -> ignore;
        true -> erlang:demonitor(Ref)
    end,
    NewState = State#mirror{node_connected = false,
                            ready = 0, pid = undefined, remote_pid = undefined,
                            ref = undefined},
    c_big_world_mgr:close_node(NewState),
    ets:delete(big_world_mirrors, Id),
    lists:foreach(fun ({Platform, ZoneId}) ->
                          ets:delete(big_world_mirrors, {Platform, ZoneId});
                      (_) -> skip
                  end,
                  Combine),
    logger:info("节点[~w]的镜像进程关闭",
                [NodeName],
                c_big_world,
                134),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

update_merge_mapping({P, Z}, []) ->
    ets:insert(merge_zone_mapping, {{P, Z}, {P, Z}}),
    ok;
update_merge_mapping({DestP, DestZ},
                     [{OriP, OriZ} | T]) ->
    ets:insert(merge_zone_mapping,
               {{OriP, OriZ}, {DestP, DestZ}}),
    update_merge_mapping({DestP, DestZ}, T);
update_merge_mapping({DestP, DestZ}, [_E | T]) ->
    logger:error("错误的服务器标识：~w", [_E], c_big_world, 151),
    update_merge_mapping({DestP, DestZ}, T).

check_online(State = #mirror{ready = 1}) -> State;
check_online(State = #mirror{nodename = NodeName,
                             node_connected = false}) ->
    NewState = case net_adm:ping(NodeName) of
                   pang -> State#mirror{node_connected = false};
                   pong ->
                       rpc:call(NodeName,
                                big_world,
                                ready,
                                [self(),
                                 node(),
                                 env:get(version),
                                 env:get(platform),
                                 env:get(zone_id)]),
                       State#mirror{node_connected = true}
               end,
    erlang:send_after(3000 + util:rand(1000, 5000),
                      self(),
                      check_online),
    NewState;
check_online(State = #mirror{nodename = NodeName,
                             ready = 0}) ->
    _Result = rpc:call(NodeName,
                       big_world,
                       ready,
                       [self(),
                        node(),
                        env:get(version),
                        env:get(platform),
                        env:get(zone_id)]),
    erlang:send_after(3000, self(), check_online),
    State.

