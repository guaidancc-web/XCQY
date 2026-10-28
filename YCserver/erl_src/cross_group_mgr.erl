-file("src/mod/cross_group/cross_group_mgr.erl", 1).

-module(cross_group_mgr).

-behaviour(gen_server).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([start_link/0]).

-export([update_sub_group/1,
         get_all_group/0,
         get_all_group_id/0,
         get_all_server_group/0,
         update_server_group/1]).

-record(state, {}).

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

-file("src/mod/cross_group/cross_group_mgr.erl", 26).

-file("inc/cross_group.hrl", 1).

-record(cross_group_server_info,
        {plat_zone = {"", 0},
         max_role_lev = 0,
         max_role_fc = 0,
         world_lev = 0,
         is_break = 0}).

-record(cross_group,
        {server_list = [], role_lev = 0, fc = 0, is_break = 0}).

-record(cross_sub_group,
        {id = 1,
         server_list = [],
         role_lev = 0,
         fc = 0,
         is_break = 0}).

-file("src/mod/cross_group/cross_group_mgr.erl", 27).

-compile(export_all).

-spec start_link() -> {ok, pid()} |
                      ignore |
                      {error, term()}.

start_link() ->
    gen_server:start_link({local, cross_group_mgr},
                          cross_group_mgr,
                          [],
                          []).

get_all_group() ->
    case catch ets:tab2list(ets_group_info) of
        GroupInfo = [_ | _] ->
            logger:debug("获取分组信息:~w",
                         [GroupInfo],
                         cross_group_mgr,
                         45),
            GroupInfo;
        _ -> []
    end.

get_all_group_id() ->
    case ets:tab2list(ets_group_info) of
        Groups = [_ | _] ->
            GroupIds = [Id || #cross_sub_group{id = Id} <- Groups],
            logger:debug("服务器所有分组id:~w",
                         [GroupIds],
                         cross_group_mgr,
                         54),
            GroupIds;
        _ -> []
    end.

get_all_server_group() ->
    case catch ets:tab2list(ets_server_group) of
        ServerGroup = [_ | _] ->
            logger:debug("所有服务器分组信息:~w",
                         [ServerGroup],
                         cross_group_mgr,
                         63),
            ServerGroup;
        _ -> []
    end.

init([]) ->
    logger:info("[~w] 正在启动...",
                [cross_group_mgr],
                cross_group_mgr,
                72),
    process_flag(trap_exit, true),
    ets:new(ets_server_info,
            [named_table,
             public,
             set,
             {keypos, #cross_group_server_info.plat_zone}]),
    dets:open_file(ets_server_info,
                   [{file, "./dets/ets_cross_group_server.dets"},
                    {keypos, #cross_group_server_info.plat_zone}]),
    dets:to_ets(ets_server_info, ets_server_info),
    ets:new(ets_group_info,
            [named_table,
             public,
             set,
             {keypos, #cross_sub_group.id}]),
    dets:open_file(ets_group_info,
                   [{file, "./dets/ets_cross_sub_group.dets"},
                    {keypos, #cross_sub_group.id}]),
    dets:to_ets(ets_group_info, ets_group_info),
    ets:new(ets_server_group,
            [named_table, public, set, {keypos, 1}]),
    dets:open_file(ets_server_group,
                   [{file, "./dets/ets_server_group.dets"}, {keypos, 1}]),
    dets:to_ets(ets_group_info, ets_group_info),
    TimeOut = calc_time_out(),
    TimerRef = erlang:send_after(TimeOut * 1000,
                                 self(),
                                 {info, divide_group, ok}),
    erlang:put(divide_group_ref, TimerRef),
    ets:new(ets_group_id,
            [named_table, public, set, {keypos, 1}]),
    ets:insert(ets_group_id, {group_id, 0}),
    logger:info("[~w] 启动完成...",
                [cross_group_mgr],
                cross_group_mgr,
                96),
    {ok, #state{}}.

handle_call({call, Msg, Args}, _From, State) ->
    case catch do_handle_call(State, Msg, Args) of
        {ok, Reply} -> {reply, Reply, State};
        {ok, Reply, NewState} -> {reply, Reply, NewState};
        {stop, NewState} -> {stop, normal, NewState};
        {stop, Reason, NewState} -> {stop, Reason, NewState};
        {false, Reason} ->
            logger:error("[~w]进程处理同步消息时失败:~w, ~w, ~w",
                         [cross_group_mgr, Msg, Args, Reason],
                         cross_group_mgr,
                         111),
            {noreply, State};
        Else ->
            logger:error("[~w]进程处理同步消息时失败:~w, ~w, ~w",
                         [cross_group_mgr, Msg, Args, Else],
                         cross_group_mgr,
                         114),
            {noreply, State}
    end;
handle_call(_Request, _From, State) ->
    logger:error("未知的[~w]同步消息:~w",
                 [cross_group_mgr, _Request],
                 cross_group_mgr,
                 119),
    {noreply, State}.

handle_cast({cast, Msg, Args}, State) ->
    case catch do_handle_cast(State, Msg, Args) of
        ok -> {noreply, State};
        {ok, NewState} -> {noreply, NewState};
        {stop, NewState} -> {stop, normal, NewState};
        {stop, Reason, NewState} -> {stop, Reason, NewState};
        {false, Reason} ->
            logger:error("[~w]进程处理异步消息时失败:~w, ~w, ~w",
                         [cross_group_mgr, Msg, Args, Reason],
                         cross_group_mgr,
                         134),
            {noreply, State};
        Else ->
            logger:error("[~w]进程处理异步消息时失败:~w, ~w, ~w",
                         [cross_group_mgr, Msg, Args, Else],
                         cross_group_mgr,
                         137),
            {noreply, State}
    end;
handle_cast(_Msg, State) ->
    logger:error("未知的[~w]异步消息:~w",
                 [cross_group_mgr, _Msg],
                 cross_group_mgr,
                 141),
    {noreply, State}.

handle_info({info, Msg, Args}, State) ->
    case catch do_handle_info(State, Msg, Args) of
        ok -> {noreply, State};
        {ok, NewState} -> {noreply, NewState};
        {stop, NewState} -> {stop, normal, NewState};
        {stop, Reason, NewState} -> {stop, Reason, NewState};
        {false, Reason} ->
            logger:error("[~w]进程处理消息时失败:~w, ~w, ~w",
                         [cross_group_mgr, Msg, Args, Reason],
                         cross_group_mgr,
                         156),
            {noreply, State};
        Else ->
            logger:error("[~w]进程处理消息时失败:~w, ~w, ~w",
                         [cross_group_mgr, Msg, Args, Else],
                         cross_group_mgr,
                         159),
            {noreply, State}
    end;
handle_info(_Info, State) ->
    logger:error("未知的[~w]INFO消息:~w",
                 [cross_group_mgr, _Info],
                 cross_group_mgr,
                 163),
    {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...",
                [cross_group_mgr],
                cross_group_mgr,
                167),
    logger:info("[~w] 关闭完成",
                [cross_group_mgr],
                cross_group_mgr,
                168),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_handle_call(_State, Msg, Args) ->
    logger:error("未知的call消息:~w, ~w",
                 [Msg, Args],
                 cross_group_mgr,
                 184),
    ok.

do_handle_cast(_State, sync_server_info, Args) ->
    logger:debug("收到数据:~w", [Args], cross_group_mgr, 191),
    ServerInfo = make_server_info(Args),
    update_server_info(ServerInfo),
    ok;
do_handle_cast(_State, Msg, Args) ->
    logger:error("未知的cast消息:~w, ~w",
                 [Msg, Args],
                 cross_group_mgr,
                 198),
    ok.

do_handle_info(_State, divide_group, _) ->
    case get(divide_group_ref) of
        Ref when is_reference(Ref) -> erlang:cancel_timer(Ref);
        _ -> ok
    end,
    Groups = divide_group(),
    ServerGroup = analyse_group(Groups, []),
    logger:debug("计算出的分组数据为:~w",
                 [Groups],
                 cross_group_mgr,
                 210),
    clean_group(),
    update_sub_group(Groups),
    update_server_group(ServerGroup),
    Args = {cast,
            sync_group_info,
            #{groups => Groups, server_group => ServerGroup}},
    cross:cast(all,
               gen_server,
               cast,
               [cross_group_agent, Args]),
    TimeOut = calc_time_out(),
    TimerRef = erlang:send_after(TimeOut * 1000,
                                 self(),
                                 {info, divide_group, ok}),
    erlang:put(divide_group_ref, TimerRef),
    ok;
do_handle_info(_State, Msg, Args) ->
    logger:error("未知的info消息:~w, ~w",
                 [Msg, Args],
                 cross_group_mgr,
                 227),
    ok.

make_server_info(#{platform := "beta", zone_id := 1}) ->
    ok;
make_server_info(#{world_lev := WorldLev})
    when WorldLev < 65 ->
    ok;
make_server_info(#{platform := Platform,
                   zone_id := ZoneId, max_role_lev := MaxRoleLev,
                   world_lev := WorldLev, max_role_fc := MaxRoleFc,
                   is_break := IsBreak}) ->
    #cross_group_server_info{plat_zone = {Platform, ZoneId},
                             max_role_lev = MaxRoleLev, max_role_fc = MaxRoleFc,
                             world_lev = WorldLev, is_break = IsBreak};
make_server_info(_) -> ok.

calc_time_out() ->
    Hour = date:hour(),
    case Hour >= 14 of
        true -> date:next_diff(0, 0, 5);
        _ ->
            NextHour = (Hour + 1) rem 24,
            date:next_diff(NextHour, 0, 5)
    end.

divide_group() ->
    ServerInfoList = ets:tab2list(ets_server_info),
    Fun = fun (#cross_group_server_info{plat_zone =
                                            {Plat, ZoneId},
                                        world_lev = WorldLev}) ->
                  c_mirror:get_zone_mapping(Plat, ZoneId) =:=
                      {Plat, ZoneId}
                      orelse
                      {Plat, ZoneId} =:= {"beta", 1} orelse WorldLev < 65
          end,
    {NewServerList, DeleteServerList} = lists:partition(Fun,
                                                        ServerInfoList),
    delete_server_info(DeleteServerList),
    NewServerInfoList = util:keys_sort([{asc,
                                         #cross_group_server_info.max_role_lev}],
                                       NewServerList),
    GroupServer = fetch_group(NewServerInfoList, []),
    logger:debug("第一步分组队伍:~w",
                 [GroupServer],
                 cross_group_mgr,
                 272),
    Groups = fetch_sub_group(GroupServer, []),
    [_G
     || _G = #cross_sub_group{server_list = ServerList}
            <- Groups,
        erlang:length(ServerList) > 1].

fetch_group([], GroupServer) -> GroupServer;
fetch_group([ServerInfo | Rest], GroupServer) ->
    NewGroupServer = insert_group(ServerInfo,
                                  GroupServer,
                                  []),
    fetch_group(Rest, NewGroupServer).

insert_group(ServerInfo, [], NewGroupServer) ->
    Group = to_cross_group(ServerInfo),
    [Group | NewGroupServer];
insert_group(#cross_group_server_info{plat_zone =
                                          {"beta", 1}},
             GroupServer, _NewGroupServer) ->
    GroupServer;
insert_group(#cross_group_server_info{world_lev =
                                          WorldLev},
             GroupServer, _NewGroupServer)
    when WorldLev < 65 ->
    GroupServer;
insert_group(ServerInfo, [Group | Rest],
             NewGroupServer) ->
    case check_match(ServerInfo, Group) of
        true ->
            NewGroup = merge_group(ServerInfo, Group),
            OtherGroup = Rest ++ NewGroupServer,
            [NewGroup | OtherGroup];
        _ ->
            insert_group(ServerInfo, Rest, [Group | NewGroupServer])
    end.

to_cross_group(ServerInfo =
                   #cross_group_server_info{max_role_lev = MaxRoleLev,
                                            max_role_fc = MaxRoleFc,
                                            is_break = IsBreak}) ->
    #cross_group{server_list = [ServerInfo],
                 role_lev = MaxRoleLev, fc = MaxRoleFc,
                 is_break = IsBreak}.

check_match(#cross_group_server_info{plat_zone =
                                         PlatZone,
                                     max_role_lev = MaxRoleLev,
                                     is_break = IsBreak},
            #cross_group{server_list = ServerList,
                         role_lev = RoleLev, is_break = GroupIsBreak}) ->
    MaxRoleLev div 10 =:= RoleLev div 10 andalso
        IsBreak =:= GroupIsBreak andalso
            is_ios_server(PlatZone) =:= is_ios_server(ServerList).

is_ios_server({"ios", _}) -> true;
is_ios_server({_, _}) -> false;
is_ios_server([]) -> false;
is_ios_server([#cross_group_server_info{plat_zone =
                                            {"ios", _}}
               | _]) ->
    true;
is_ios_server([_ | _]) -> false.

merge_group(Server = #cross_group_server_info{is_break =
                                                  IsBreak},
            CrossGroup = #cross_group{server_list = ServerList}) ->
    NewServerList = [Server | ServerList],
    AvgLev = round(lists:sum([Lev
                              || #cross_group_server_info{max_role_lev = Lev}
                                     <- NewServerList])
                       / erlang:length(NewServerList)),
    AvgFc = round(lists:sum([Fc
                             || #cross_group_server_info{max_role_fc = Fc}
                                    <- NewServerList])
                      / erlang:length(NewServerList)),
    NewCrossGroup = CrossGroup#cross_group{server_list =
                                               NewServerList,
                                           role_lev = AvgLev, fc = AvgFc,
                                           is_break = IsBreak},
    NewCrossGroup.

fetch_sub_group([], SubGroupServer) -> SubGroupServer;
fetch_sub_group([#cross_group{server_list = ServerList}
                 | Rest],
                SubGroupServer) ->
    Len = erlang:length(ServerList),
    case Len >= 2 of
        true ->
            SortedServerList = util:keys_sort([{asc,
                                                #cross_group_server_info.max_role_lev}],
                                              ServerList),
            SubServer = do_fetch_sub_group(SortedServerList, []),
            logger:debug("服务器信息:~w",
                         [SubServer],
                         cross_group_mgr,
                         358),
            fetch_sub_group(Rest, SubServer ++ SubGroupServer);
        _ -> fetch_sub_group(Rest, SubGroupServer)
    end.

do_fetch_sub_group([], SubGroupServer) ->
    SubGroupServer;
do_fetch_sub_group([ServerInfo | Rest],
                   SubGroupServer) ->
    SortFun = fun (#cross_sub_group{server_list = Sl1},
                   #cross_sub_group{server_list = Sl2}) ->
                      erlang:length(Sl1) < erlang:length(Sl2)
              end,
    SortedSubGroupServer = lists:sort(SortFun,
                                      SubGroupServer),
    NewSubGroupServer = insert_sub_group(ServerInfo,
                                         SortedSubGroupServer,
                                         []),
    do_fetch_sub_group(Rest, NewSubGroupServer).

insert_sub_group(ServerInfo, [], NewGroupServer) ->
    SubGroup = to_sub_group(ServerInfo),
    [SubGroup | NewGroupServer];
insert_sub_group(ServerInfo, [Group | Rest],
                 NewGroupServer) ->
    case check_sub_match(ServerInfo, Group) of
        true ->
            NewGroup = merge_sub_group(ServerInfo, Group),
            OtherGroup = Rest ++ NewGroupServer,
            [NewGroup | OtherGroup];
        _ ->
            insert_sub_group(ServerInfo,
                             Rest,
                             [Group | NewGroupServer])
    end.

to_sub_group(#cross_group_server_info{plat_zone =
                                          PlatZone,
                                      max_role_lev = RoleLev,
                                      max_role_fc = RoleFc,
                                      is_break = IsBreak}) ->
    GroupId = fetch_group_id(),
    #cross_sub_group{id = GroupId, server_list = [PlatZone],
                     role_lev = RoleLev, fc = RoleFc, is_break = IsBreak}.

check_sub_match(#cross_group_server_info{max_role_lev =
                                             MaxRoleLev},
                #cross_sub_group{server_list = ServerList,
                                 role_lev = RoleLev}) ->
    case length(ServerList) < 3 of
        true -> abs(MaxRoleLev - RoleLev) =< 1;
        _ -> false
    end.

merge_sub_group(#cross_group_server_info{plat_zone =
                                             PlatZone,
                                         max_role_lev = MaxRoleLev,
                                         max_role_fc = MaxRoleFc},
                CrossSubGroup = #cross_sub_group{server_list =
                                                     ServerList,
                                                 role_lev = RoleLev,
                                                 fc = RoleFc}) ->
    NewServerList = [PlatZone | ServerList],
    Len = length(ServerList),
    AvgLev = (MaxRoleLev + RoleLev * Len) div (Len + 1),
    AvgFc = (MaxRoleFc + RoleFc * Len) div (Len + 1),
    NewCrossGroup =
        CrossSubGroup#cross_sub_group{server_list =
                                          NewServerList,
                                      role_lev = AvgLev, fc = AvgFc},
    NewCrossGroup.

analyse_group([], ServerGroup) -> ServerGroup;
analyse_group([#cross_sub_group{id = Id,
                                server_list = ServerList}
               | Rest],
              ServerGroup) ->
    Sg = [{PlatZone, Id} || PlatZone <- ServerList],
    analyse_group(Rest, Sg ++ ServerGroup).

update_server_info(ServerInfo =
                       #cross_group_server_info{}) ->
    ets:insert(ets_server_info, ServerInfo),
    dets:insert(ets_server_info, ServerInfo),
    ok;
update_server_info(_) -> ok.

delete_server_info([]) -> ok;
delete_server_info([PlatZone | Rest]) ->
    delete_server_info(PlatZone),
    delete_server_info(Rest);
delete_server_info(PlatZone) ->
    ets:delete(ets_server_info, PlatZone),
    dets:delete(ets_server_info, PlatZone),
    ok.

clean_group() ->
    ets:delete_all_objects(ets_group_info),
    dets:delete_all_objects(ets_group_info),
    ets:delete_all_objects(ets_server_group),
    dets:delete_all_objects(ets_server_group),
    ok.

update_sub_group([]) -> ok;
update_sub_group([Group = #cross_sub_group{} | Rest]) ->
    update_sub_group(Group),
    update_sub_group(Rest);
update_sub_group([_ | Rest]) -> update_sub_group(Rest);
update_sub_group(Group = #cross_sub_group{}) ->
    ets:insert(ets_group_info, Group),
    dets:insert(ets_group_info, Group),
    ok;
update_sub_group(_) -> ok.

fetch_group_id() ->
    ets:update_counter(ets_group_id, group_id, 1).

update_server_group([]) -> ok;
update_server_group([ServerGroup | Rest]) ->
    update_server_group(ServerGroup),
    update_server_group(Rest);
update_server_group(ServerGroup) ->
    ets:insert(ets_server_group, ServerGroup),
    dets:insert(ets_server_group, ServerGroup),
    ok.

