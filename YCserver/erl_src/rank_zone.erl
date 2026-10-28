-file("src/mod/rank/rank_zone.erl", 1).

-module(rank_zone).

-behaviour(gen_server).

-export([cast/2,
         info/2,
         update_ets/1,
         update_rank/3,
         first_sort_key/1,
         cfg/1]).

-export([start/1]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-record(state, {zone = 1}).

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

-file("src/mod/rank/rank_zone.erl", 21).

-file("inc/rank.hrl", 1).

-record(rank,
        {type = 1,
         show_list = [],
         list = [],
         last_val = 0,
         len = 0}).

-record(rank_rc,
        {ver = 3 :: pos_integer(),
         id = {roleid, platform, zoneid} :: term(),
         rank = 1,
         time = 0 :: non_neg_integer(),
         role_id = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: list(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = "",
         pet,
         guard,
         eqm}).

-record(rank_cfg,
        {type = 0 :: non_neg_integer(),
         num = 100 :: non_neg_integer(),
         keys = [#rank_rc.val3, #rank_rc.val2, #rank_rc.val1] ::
             [pos_integer()],
         min_val = 1 :: pos_integer(),
         nologin = 0 :: non_neg_integer(),
         zone = rank_zone_1 :: atom()}).

-file("src/mod/rank/rank_zone.erl", 22).

-spec update_ets(#rank{}) -> ok.

update_ets(Rank = #rank{list = L}) ->
    Len = length(L),
    ets:insert(sys_rank, Rank#rank{len = Len}).

first_sort_key(SortKeys) ->
    case lists:reverse(SortKeys) of
        [{_, Key} | _] -> Key;
        [Key | _] -> Key
    end.

cfg(Type = 1) ->
    #rank_cfg{type = Type, min_val = 10,
              keys = [#rank_rc.val3, #rank_rc.val1, #rank_rc.val2],
              zone = rank_zone_1, nologin = 7};
cfg(Type = 7) ->
    #rank_cfg{type = Type, min_val = 5,
              keys = [#rank_rc.val2, #rank_rc.val1],
              zone = rank_zone_1, nologin = 7};
cfg(Type = 38) ->
    #rank_cfg{type = Type, min_val = 10,
              keys = [#rank_rc.val1], zone = rank_zone_1,
              nologin = 7};
cfg(Type = 2) ->
    #rank_cfg{type = Type, min_val = 2000,
              keys = [#rank_rc.val2, #rank_rc.val1],
              zone = rank_zone_2, nologin = 7};
cfg(Type = 3) ->
    #rank_cfg{type = Type, min_val = 200,
              keys = [#rank_rc.val2, #rank_rc.val1],
              zone = rank_zone_2, nologin = 7};
cfg(Type = 5) ->
    #rank_cfg{type = Type, min_val = 1,
              keys = [#rank_rc.val3, #rank_rc.val2, #rank_rc.val1],
              zone = rank_zone_2, nologin = 14};
cfg(Type = 6) ->
    #rank_cfg{type = Type, min_val = 1,
              keys = [#rank_rc.val3, #rank_rc.val2, #rank_rc.val1],
              zone = rank_zone_2, nologin = 14};
cfg(Type = 100) ->
    #rank_cfg{type = Type, min_val = 10,
              keys = [#rank_rc.val1], zone = rank_zone_2,
              nologin = 7};
cfg(Type = 101) ->
    #rank_cfg{type = Type, min_val = 1,
              keys = [#rank_rc.val1], zone = rank_zone_2,
              nologin = 365};
cfg(Type = 20) ->
    #rank_cfg{type = Type, min_val = 3000,
              keys = [#rank_rc.val2, #rank_rc.val1],
              zone = rank_zone_3, nologin = 7};
cfg(Type = 21) ->
    #rank_cfg{type = Type, min_val = 3000,
              keys = [#rank_rc.val2, #rank_rc.val1],
              zone = rank_zone_3, nologin = 7};
cfg(Type = 22) ->
    #rank_cfg{type = Type, min_val = 3000,
              keys = [#rank_rc.val2, #rank_rc.val1],
              zone = rank_zone_3, nologin = 7};
cfg(Type = 23) ->
    #rank_cfg{type = Type, min_val = 3000,
              keys = [#rank_rc.val2, #rank_rc.val1],
              zone = rank_zone_3, nologin = 7};
cfg(Type = 24) ->
    #rank_cfg{type = Type, min_val = 3000,
              keys = [#rank_rc.val2, #rank_rc.val1],
              zone = rank_zone_3, nologin = 7};
cfg(Type = 25) ->
    #rank_cfg{type = Type, min_val = 3000,
              keys = [#rank_rc.val2, #rank_rc.val1],
              zone = rank_zone_3, nologin = 7};
cfg(Type = 26) ->
    #rank_cfg{type = Type, min_val = 3000,
              keys = [#rank_rc.val2, #rank_rc.val1],
              zone = rank_zone_3, nologin = 7};
cfg(Type = 27) ->
    #rank_cfg{type = Type, min_val = 3000,
              keys = [#rank_rc.val2, #rank_rc.val1],
              zone = rank_zone_3, nologin = 7};
cfg(Type = 10) ->
    #rank_cfg{type = Type, min_val = 40,
              keys = [#rank_rc.val2, #rank_rc.val1],
              zone = rank_zone_3, nologin = 7};
cfg(Type = 11) ->
    #rank_cfg{type = Type, min_val = 40,
              keys = [#rank_rc.val2, #rank_rc.val1],
              zone = rank_zone_3, nologin = 7};
cfg(Type = 12) ->
    #rank_cfg{type = Type, min_val = 40,
              keys = [#rank_rc.val2, #rank_rc.val1],
              zone = rank_zone_3, nologin = 7};
cfg(Type = 13) ->
    #rank_cfg{type = Type, min_val = 40,
              keys = [#rank_rc.val2, #rank_rc.val1],
              zone = rank_zone_3, nologin = 7};
cfg(Type = 15) ->
    #rank_cfg{type = Type, min_val = 40,
              keys = [#rank_rc.val2, #rank_rc.val1],
              zone = rank_zone_3, nologin = 7};
cfg(Type = 16) ->
    #rank_cfg{type = Type, min_val = 40,
              keys = [#rank_rc.val2, #rank_rc.val1],
              zone = rank_zone_3, nologin = 7};
cfg(Type = 17) ->
    #rank_cfg{type = Type, min_val = 40,
              keys = [#rank_rc.val2, #rank_rc.val1],
              zone = rank_zone_3, nologin = 7};
cfg(Type = 19) ->
    #rank_cfg{type = Type, min_val = 40,
              keys = [#rank_rc.val2, #rank_rc.val1],
              zone = rank_zone_3, nologin = 7};
cfg(Type = 30) ->
    #rank_cfg{type = Type, min_val = 1000,
              keys = [#rank_rc.val2, #rank_rc.val1],
              zone = rank_zone_4};
cfg(Type = 4) ->
    #rank_cfg{type = Type, min_val = 10,
              keys = [#rank_rc.val2, #rank_rc.val1],
              zone = rank_zone_4};
cfg(Type = 39) ->
    #rank_cfg{type = Type, min_val = 5,
              keys = [#rank_rc.val2, #rank_rc.val1],
              zone = rank_zone_4};
cfg(Type = 40) ->
    #rank_cfg{type = Type, min_val = 5,
              keys = [#rank_rc.val2, #rank_rc.val1],
              zone = rank_zone_4};
cfg(Type = 31) ->
    #rank_cfg{type = Type, num = 20, min_val = 1,
              keys = [#rank_rc.val1, #rank_rc.val2],
              zone = rank_zone_4};
cfg(Type = 52) ->
    #rank_cfg{type = Type, num = 50, min_val = 1,
              keys = [#rank_rc.val1, #rank_rc.val2],
              zone = rank_zone_4};
cfg(Type = 46) ->
    #rank_cfg{type = Type, min_val = 5,
              keys = [#rank_rc.val2, #rank_rc.val1],
              zone = rank_zone_4};
cfg(Type)
    when Type =:= 33 orelse
             Type =:= 34 orelse Type =:= 35 orelse Type =:= 36 ->
    #rank_cfg{type = Type, num = 100, min_val = 100,
              keys = [#rank_rc.val1], zone = rank_zone_4};
cfg(Type = 37) ->
    #rank_cfg{type = Type, min_val = 12,
              keys = [#rank_rc.val2, #rank_rc.val1],
              zone = rank_zone_4, nologin = 7};
cfg(Type = 47) ->
    #rank_cfg{type = Type, min_val = 12,
              keys = [#rank_rc.val2, #rank_rc.val1],
              zone = rank_zone_4, nologin = 7};
cfg(Type = 41) ->
    #rank_cfg{type = Type, min_val = 12,
              keys = [#rank_rc.val2, #rank_rc.val1],
              zone = rank_zone_4, nologin = 7};
cfg(Type = 56) ->
    #rank_cfg{type = Type,
              keys = [{asc, #rank_rc.val2}, #rank_rc.val1],
              zone = rank_zone_4};
cfg(Type = 42) ->
    #rank_cfg{type = Type,
              keys = [#rank_rc.val2, #rank_rc.val1],
              zone = rank_zone_4};
cfg(Type = 43) ->
    #rank_cfg{type = Type,
              keys = [#rank_rc.val2, #rank_rc.val1],
              zone = rank_zone_4};
cfg(Type = 44) ->
    #rank_cfg{type = Type,
              keys = [#rank_rc.val2, #rank_rc.val1],
              zone = rank_zone_4};
cfg(Type = 45) ->
    #rank_cfg{type = Type,
              keys = [#rank_rc.val2, #rank_rc.val1],
              zone = rank_zone_4};
cfg(Type = 53) ->
    #rank_cfg{type = Type,
              keys = [#rank_rc.val2, #rank_rc.val1],
              zone = rank_zone_4};
cfg(Type)
    when Type =:= 61 orelse
             Type =:= 62 orelse Type =:= 63 orelse Type =:= 64 ->
    #rank_cfg{type = Type, num = 150, min_val = 0,
              keys = [#rank_rc.val1], zone = rank_zone_4};
cfg(Type = 65) ->
    #rank_cfg{type = Type,
              keys = [{asc, #rank_rc.val2}, #rank_rc.val1],
              zone = rank_zone_4};
cfg(Type = 66) ->
    #rank_cfg{type = Type,
              keys = [{asc, #rank_rc.val2}, #rank_rc.val1],
              zone = rank_zone_4};
cfg(Type)
    when Type =:= 67 orelse
             Type =:= 68 orelse
                 Type =:= 69 orelse Type =:= 70 orelse Type =:= 71 ->
    #rank_cfg{type = Type, zone = rank_zone_4};
cfg(Type) -> #rank_cfg{type = Type}.

-spec update_rank(Max :: pos_integer(), [pos_integer()],
                  [tuple()]) -> {[tuple()], non_neg_integer()}.

update_rank(Max, SortKeys, ToSortList) ->
    SortList = util:keys_sort(SortKeys, ToSortList),
    Len = length(SortList),
    if Max =:= 0 orelse Len < Max -> {SortList, 0};
       Len =:= Max ->
           [LastPlayer | _] = lists:reverse(SortList),
           FirstBasis = first_sort_key(SortKeys),
           {SortList, element(FirstBasis, LastPlayer)};
       Len =:= Max + 1 ->
           [_N | AscendRankedData] = lists:reverse(SortList),
           [LastPlayer | _] = AscendRankedData,
           FirstBasis = first_sort_key(SortKeys),
           {lists:reverse(AscendRankedData),
            element(FirstBasis, LastPlayer)};
       true -> {lists:sublist(SortList, Max), 0}
    end.

-spec cast(pos_integer(), any()) -> ok.

cast(Type, Args) ->
    gen_server:cast(element(#rank_cfg.zone, cfg(Type)),
                    Args).

-spec info(pos_integer(), any()) -> ok.

info(Type, Args) ->
    element(#rank_cfg.zone, cfg(Type)) ! Args.

start(Zone) -> gen_server:start(rank_zone, [Zone], []).

init([Zone]) ->
    logger:info("开始启动排行榜区：~w", [Zone], rank_zone, 191),
    process_flag(trap_exit, true),
    State = #state{zone = Zone},
    erlang:register(list_to_atom(lists:concat(["rank_zone_",
                                               Zone])),
                    self()),
    logger:info("启动完成排行榜区: ~w", [Zone], rank_zone, 196),
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({in_rank, Type, Id, Value, NewData},
            State) ->
    Rank = #rank{list = RankList, len = Len,
                 last_val = LastValue} =
               get_cache(Type),
    #rank_cfg{num = Max, keys = SortKeys} = cfg(Type),
    case lists:keyfind(Id, 3, RankList) of
        false ->
            case Value >= LastValue orelse Max > Len of
                false -> {noreply, State};
                true ->
                    ToSortList = [NewData | lists:reverse(RankList)],
                    {NewRankList, NewLastValue} = update_rank(Max,
                                                              SortKeys,
                                                              ToSortList),
                    NewRank = Rank#rank{list = NewRankList,
                                        last_val = NewLastValue},
                    update_cache(NewRank),
                    {noreply, State}
            end;
        _OldData ->
            case check_inrank(Type, Id, Value, _OldData) of
                true ->
                    NRandList = lists:keyreplace(Id, 3, RankList, NewData),
                    ToSortList = lists:reverse(NRandList),
                    {NewRankList, NewLastValue} = update_rank(Max,
                                                              SortKeys,
                                                              ToSortList),
                    NewRank = Rank#rank{list = NewRankList,
                                        last_val = NewLastValue},
                    update_cache(NewRank),
                    {noreply, State};
                _ -> {noreply, State}
            end
    end;
handle_cast({exit_rank, Type, Id}, State) ->
    Rank = #rank{list = RankList} = get_cache(Type),
    case lists:keyfind(Id, 3, RankList) of
        false -> {noreply, State};
        _ ->
            NewRankList = lists:keydelete(Id, 3, RankList),
            update_cache(Rank#rank{list = NewRankList,
                                   last_val = 0}),
            {noreply, State}
    end;
handle_cast({nologin, Type, T}, State) ->
    case get_cache(Type) of
        Rank = #rank{list = RankList = [#rank_rc{} | _]} ->
            OutTime = date:unixtime() - T,
            NewRankList = [Rc
                           || Rc = #rank_rc{time = Time} <- RankList,
                              Time >= OutTime],
            update_cache(Rank#rank{list = NewRankList});
        _ -> skip
    end,
    {noreply, State};
handle_cast({clear, Type}, State) ->
    logger:info("清空排行榜:~w", [Type], rank_zone, 260),
    Rank = get_cache(Type),
    NewRank = Rank#rank{show_list = [], list = []},
    update_cache(NewRank),
    {noreply, State};
handle_cast({delete, Type}, State) ->
    logger:info("删除排行榜:~w", [Type], rank_zone, 268),
    ets:delete(sys_rank, Type),
    {noreply, State};
handle_cast({update_show_list, RankType}, State) ->
    Rank = #rank{list = List} = get_cache(RankType),
    NewRank = Rank#rank{show_list = List},
    spawn(fun () -> rank_reward:reward(RankType, List) end),
    spawn(fun () ->
                  case lists:member(RankType,
                                    [1, 2, 3, 38, 52, 7, 56, 20, 31])
                      of
                      true -> log:rank(List, RankType);
                      _ -> ok
                  end
          end),
    update_cache(NewRank),
    {noreply, State};
handle_cast({replace, RankType, RankList, UpdateArgs},
            State) ->
    Rank = get_cache(RankType),
    NewRank = Rank#rank{show_list = RankList,
                        list = RankList},
    update_cache(NewRank),
    replace_trigger(RankType, RankList, UpdateArgs),
    {noreply, State};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State = #state{zone = Zone}) ->
    logger:info("正在关闭排行榜区：~w", [Zone], rank_zone, 304),
    logger:info("关闭完成排行榜区: ~w", [Zone], rank_zone, 305),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

replace_trigger(RankType, RankList, Args) ->
    case maps:get(reward, Args, 0) of
        1 ->
            spawn(fun () -> rank_reward:reward(RankType, RankList)
                  end);
        0 -> skip
    end,
    ok.

update_cache(Rank = #rank{type = Type, list = L}) ->
    Len = length(L),
    NewRank = Rank#rank{len = Len},
    put({rank, Type}, NewRank),
    ets:insert(sys_rank, NewRank).

get_cache(Type) ->
    case get({rank, Type}) of
        undefined ->
            Rank = rank_mgr:lookup(Type),
            put({rank, Type}, Rank),
            Rank;
        Rank -> Rank
    end.

check_inrank(65, _Id, Val, #rank_rc{val1 = OldVal1})
    when Val =< OldVal1 ->
    false;
check_inrank(66, _Id, Val, #rank_rc{val1 = OldVal1})
    when Val =< OldVal1 ->
    false;
check_inrank(_, _, _, _) -> true.

