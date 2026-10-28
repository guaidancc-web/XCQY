-file("src/mod/cross_group/cross_group_agent.erl", 1).

-module(cross_group_agent).

-behaviour(gen_server).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([start_link/0]).

-export([get_group/1]).

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

-file("src/mod/cross_group/cross_group_agent.erl", 22).

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

-file("src/mod/cross_group/cross_group_agent.erl", 23).

-compile(export_all).

-spec start_link() -> {ok, pid()} |
                      ignore |
                      {error, term()}.

start_link() ->
    gen_server:start_link({local, cross_group_agent},
                          cross_group_agent,
                          [],
                          []).

get_group({Platform, ZoneId}) ->
    case ets:lookup(ets_server_group, {Platform, ZoneId}) of
        [{_, GroupId}] -> GroupId;
        _ -> 0
    end.

init([]) ->
    logger:info("[~w] 正在启动...",
                [cross_group_agent],
                cross_group_agent,
                51),
    process_flag(trap_exit, true),
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
                                 {info, sync_server_info, ok}),
    erlang:put(sync_server_info_ref, TimerRef),
    logger:info("[~w] 启动完成...",
                [cross_group_agent],
                cross_group_agent,
                68),
    {ok, #state{}}.

handle_call({call, Msg, Args}, _From, State) ->
    case catch do_handle_call(State, Msg, Args) of
        {ok, Reply} -> {reply, Reply, State};
        {ok, Reply, NewState} -> {reply, Reply, NewState};
        {stop, NewState} -> {stop, normal, NewState};
        {stop, Reason, NewState} -> {stop, Reason, NewState};
        {false, Reason} ->
            logger:error("[~w]进程处理同步消息时失败:~w, ~w, ~w",
                         [cross_group_agent, Msg, Args, Reason],
                         cross_group_agent,
                         83),
            {noreply, State};
        Else ->
            logger:error("[~w]进程处理同步消息时失败:~w, ~w, ~w",
                         [cross_group_agent, Msg, Args, Else],
                         cross_group_agent,
                         86),
            {noreply, State}
    end;
handle_call(_Request, _From, State) ->
    logger:error("未知的[~w]同步消息:~w",
                 [cross_group_agent, _Request],
                 cross_group_agent,
                 91),
    {noreply, State}.

handle_cast({cast, Msg, Args}, State) ->
    case catch do_handle_cast(State, Msg, Args) of
        ok -> {noreply, State};
        {ok, NewState} -> {noreply, NewState};
        {stop, NewState} -> {stop, normal, NewState};
        {stop, Reason, NewState} -> {stop, Reason, NewState};
        {false, Reason} ->
            logger:error("[~w]进程处理异步消息时失败:~w, ~w, ~w",
                         [cross_group_agent, Msg, Args, Reason],
                         cross_group_agent,
                         106),
            {noreply, State};
        Else ->
            logger:error("[~w]进程处理异步消息时失败:~w, ~w, ~w",
                         [cross_group_agent, Msg, Args, Else],
                         cross_group_agent,
                         109),
            {noreply, State}
    end;
handle_cast(_Msg, State) ->
    logger:error("未知的[~w]异步消息:~w",
                 [cross_group_agent, _Msg],
                 cross_group_agent,
                 113),
    {noreply, State}.

handle_info({info, Msg, Args}, State) ->
    case catch do_handle_info(State, Msg, Args) of
        ok -> {noreply, State};
        {ok, NewState} -> {noreply, NewState};
        {stop, NewState} -> {stop, normal, NewState};
        {stop, Reason, NewState} -> {stop, Reason, NewState};
        {false, Reason} ->
            logger:error("[~w]进程处理消息时失败:~w, ~w, ~w",
                         [cross_group_agent, Msg, Args, Reason],
                         cross_group_agent,
                         128),
            {noreply, State};
        Else ->
            logger:error("[~w]进程处理消息时失败:~w, ~w, ~w",
                         [cross_group_agent, Msg, Args, Else],
                         cross_group_agent,
                         131),
            {noreply, State}
    end;
handle_info(_Info, State) ->
    logger:error("未知的[~w]INFO消息:~w",
                 [cross_group_agent, _Info],
                 cross_group_agent,
                 135),
    {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...",
                [cross_group_agent],
                cross_group_agent,
                139),
    logger:info("[~w] 关闭完成",
                [cross_group_agent],
                cross_group_agent,
                140),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_handle_call(_State, Msg, Args) ->
    logger:error("未知的call消息:~w, ~w",
                 [Msg, Args],
                 cross_group_agent,
                 156),
    ok.

do_handle_cast(_State, sync_group_info,
               #{groups := Groups, server_group := ServerGroup}) ->
    ets:delete_all_objects(ets_group_info),
    dets:delete_all_objects(ets_group_info),
    ets:delete_all_objects(ets_server_group),
    dets:delete_all_objects(ets_server_group),
    cross_group_mgr:update_sub_group(Groups),
    cross_group_mgr:update_server_group(ServerGroup),
    reload(),
    ok;
do_handle_cast(_State, Msg, Args) ->
    logger:error("未知的cast消息:~w, ~w",
                 [Msg, Args],
                 cross_group_agent,
                 176),
    ok.

do_handle_info(_State, sync_server_info, _) ->
    case get(divide_group_ref) of
        Ref when is_reference(Ref) -> erlang:cancel_timer(Ref);
        _ -> ok
    end,
    ServerInfo = query_server_info(),
    Args = {cast, sync_server_info, ServerInfo},
    cross:cast(gen_server, cast, [cross_group_mgr, Args]),
    TimeOut = calc_time_out(),
    TimerRef = erlang:send_after(TimeOut * 1000,
                                 self(),
                                 {info, sync_server_info, ok}),
    erlang:put(sync_server_info_ref, TimerRef),
    ok;
do_handle_info(_State, Msg, Args) ->
    logger:error("未知的info消息:~w, ~w",
                 [Msg, Args],
                 cross_group_agent,
                 196),
    ok.

reload() ->
    warrior_mgr:reload(),
    ok.

calc_time_out() ->
    Hour = date:hour(),
    case Hour >= 14 of
        true -> date:next_diff(0, 0, 1);
        _ ->
            NextHour = (Hour + 1) rem 24,
            date:next_diff(NextHour, 0, 5)
    end.

query_server_info() ->
    TopLev = robot_mgr:get_top_lev(),
    TotalFc = case env:get(max_world_fc) of
                  FcList = [_ | _] ->
                      lists:sum([Fc || {_, Fc} <- FcList]);
                  _ -> 0
              end,
    {WorldLev, _} = world_lev:get_world_lev(),
    IsBreak = lev_break:get_boss_killed(),
    Plat = env:get(platform),
    ZoneId = env:get(zone_id),
    logger:debug("区服信息:#{platform => ~w, zone_id => ~w, "
                 "max_role_lev => ~w, max_role_fc => ~w, "
                 "world_lev => ~w, is_break => ~w}",
                 [Plat, ZoneId, TopLev, TotalFc, WorldLev, IsBreak],
                 cross_group_agent,
                 230),
    #{platform => Plat, zone_id => ZoneId,
      max_role_lev => TopLev, max_role_fc => TotalFc,
      world_lev => WorldLev, is_break => IsBreak}.

