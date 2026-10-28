-file("src/mod/rank/rank_mgr.erl", 1).

-module(rank_mgr).

-behaviour(gen_server).

-export([lookup/1, clear/1]).

-export([start_link/0, cast/1, info/1]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

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

-file("src/mod/rank/rank_mgr.erl", 22).

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

-file("src/mod/rank/rank_mgr.erl", 23).

-file("inc/item.hrl", 1).

-record(item_base,
        {id = 0 :: non_neg_integer(),
         name = "" :: list(),
         type = 0 :: non_neg_integer(),
         quality = 0 :: 0..4,
         overlap = 1 :: pos_integer(),
         look_id = 0 :: non_neg_integer(),
         use_type = 0 :: 0..4,
         expire_type = 0 :: non_neg_integer(),
         expire_time = 0 ::
             non_neg_integer() |
             {{pos_integer(), pos_integer(), pos_integer()},
              {non_neg_integer(),
               non_neg_integer(),
               non_neg_integer()}},
         attr = [] :: [tuple()],
         lev = 0,
         classes = 0,
         sex = 2,
         buy_source = [],
         condition = [] :: [tuple()],
         effect = [] :: [tuple()],
         alchemy = 0 :: non_neg_integer()}).

-record(item,
        {ver = 0 :: non_neg_integer(),
         id = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         bind = 1 :: 0 | 1,
         look_id = 0,
         type = 0 :: non_neg_integer(),
         use_type = 0 :: 0..4,
         quality = 0 :: 0..4,
         craft = 0 :: 0..5,
         enchant = -1 :: integer(),
         growth_lev = 0,
         growth_val = 0,
         step = 0 :: pos_integer(),
         quantity = 1 :: 0..250,
         pos = 0 :: non_neg_integer(),
         expire_type = 0 :: 0..4,
         expire_time = 0 :: non_neg_integer(),
         attr = [] :: [tuple()],
         reset_attr = [],
         lev = 1 :: pos_integer(),
         classes = 0 :: 0..6,
         sex = 2 :: 0..2,
         extra = [] :: [tuple()],
         data = [] :: [any()]}).

-record(item_extra_info, {source, price}).

-file("src/mod/rank/rank_mgr.erl", 24).

-spec lookup(pos_integer()) -> #rank{}.

lookup(Type) ->
    case catch ets:lookup(sys_rank, Type) of
        [Rank = #rank{}] -> Rank;
        _ -> #rank{type = Type}
    end.

-spec cast(tuple()) -> ok.

cast(Args) -> gen_server:cast(rank_mgr, Args).

clear(Type) -> cast({clear, [Type]}).

-spec info(tuple()) -> ok.

info(Args) -> rank_mgr ! Args.

start_link() ->
    gen_server:start_link({local, rank_mgr},
                          rank_mgr,
                          [],
                          []).

init([]) ->
    logger:info("[~w] 正在启动...", [rank_mgr], rank_mgr, 51),
    process_flag(trap_exit, true),
    dets:open_file(sys_rank,
                   [{file, "./dets/sys_rank.dets"},
                    {keypos, #rank.type},
                    {type, set}]),
    ets:new(sys_rank,
            [set, named_table, public, {keypos, #rank.type}]),
    {ok, _Pid1} = rank_zone:start(1),
    {ok, _Pid2} = rank_zone:start(2),
    {ok, _Pid3} = rank_zone:start(3),
    {ok, _Pid4} = rank_zone:start(4),
    load_data(),
    erlang:send_after(date:next_diff(0, 0, 1) * 1000,
                      self(),
                      update_hour_zero),
    erlang:send_after(600 * 1000, self(), save),
    State = #state{},
    logger:info("[~w] 启动完成", [rank_mgr], rank_mgr, 63),
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({clear, TypeList}, State) ->
    logger:info("开始清空排行榜: ~w", [TypeList], rank_mgr, 71),
    clear_rank(TypeList),
    {noreply, State};
handle_cast({delete, TypeList}, State) ->
    logger:info("开始删除排行榜: ~w", [TypeList], rank_mgr, 77),
    NewTypeList = if TypeList =:= all ->
                         [1,
                          2,
                          3,
                          4,
                          20,
                          21,
                          22,
                          23,
                          24,
                          25,
                          26,
                          27,
                          5,
                          6,
                          30,
                          31,
                          32,
                          33,
                          34,
                          35,
                          36,
                          35,
                          37,
                          38,
                          39,
                          40,
                          41,
                          7,
                          100,
                          101,
                          42,
                          43,
                          44,
                          45,
                          46,
                          47,
                          52,
                          53,
                          65,
                          56,
                          66,
                          67,
                          68,
                          69,
                          70,
                          71,
                          79,
                          80,
                          81,
                          82];
                     is_integer(TypeList) ->
                         dets:delete(sys_rank, TypeList),
                         [TypeList];
                     true -> TypeList
                  end,
    lists:foreach(fun (Type) ->
                          rank_zone:cast(Type, {delete, Type})
                  end,
                  NewTypeList),
    {noreply, State};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(save, State) ->
    logger:info("保存排行榜数据", [], rank_mgr, 95),
    Fun = fun (Rank, _) -> dets:insert(sys_rank, Rank) end,
    ets:foldl(Fun, 0, sys_rank),
    erlang:send_after(util:rand(1800, 2400) * 1000,
                      self(),
                      save),
    {noreply, State};
handle_info(update_hour_zero, State) ->
    logger:info("排行榜统计0点更新开始", [], rank_mgr, 104),
    erlang:send_after(date:next_diff(0, 0, 1) * 1000,
                      self(),
                      update_hour_zero),
    zero_auto_update([1,
                      2,
                      3,
                      20,
                      21,
                      22,
                      23,
                      24,
                      25,
                      26,
                      27,
                      5,
                      6,
                      31,
                      38,
                      7,
                      100,
                      101,
                      52]),
    logger:info("排行榜统计0点更新结束", [], rank_mgr, 107),
    {noreply, State};
handle_info(gm_update_hour_zero, State) ->
    logger:info("排行榜统计gm更新开始", [], rank_mgr, 112),
    zero_auto_update([1,
                      2,
                      3,
                      20,
                      21,
                      22,
                      23,
                      24,
                      25,
                      26,
                      27,
                      5,
                      6,
                      31,
                      38,
                      7,
                      100,
                      101,
                      52]),
    logger:info("排行榜统计gm更新结束", [], rank_mgr, 114),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...", [rank_mgr], rank_mgr, 121),
    L = ets:tab2list(sys_rank),
    dets:insert(sys_rank, L),
    logger:info("[~w] 关闭完成", [rank_mgr], rank_mgr, 124),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

clear_rank(Type) when is_integer(Type) ->
    rank_zone:cast(Type, {clear, Type});
clear_rank([Type | T]) ->
    clear_rank(Type),
    clear_rank(T);
clear_rank(all) ->
    clear_rank([1,
                2,
                3,
                4,
                20,
                21,
                22,
                23,
                24,
                25,
                26,
                27,
                5,
                6,
                30,
                31,
                32,
                33,
                34,
                35,
                36,
                35,
                37,
                38,
                39,
                40,
                41,
                7,
                100,
                101,
                42,
                43,
                44,
                45,
                46,
                47,
                52,
                53,
                65,
                56,
                66,
                67,
                68,
                69,
                70,
                71,
                79,
                80,
                81,
                82]);
clear_rank(_Type) -> ok.

zero_auto_update([]) -> ok;
zero_auto_update([I | T]) ->
    zero_auto_update(I),
    zero_auto_update(T);
zero_auto_update(RankType) ->
    case rank_zone:cfg(RankType) of
        #rank_cfg{nologin = NoLogin} when NoLogin > 0 ->
            rank_zone:cast(RankType,
                           {nologin, RankType, NoLogin * 86400});
        _ -> skip
    end,
    rank_zone:cast(RankType, {update_show_list, RankType}),
    ok.

load_data() ->
    Fun = fun (Rank) ->
                  ver(Rank),
                  continue
          end,
    dets:traverse(sys_rank, Fun).

ver(Rank = #rank{list = List, type = Type,
                 show_list = ShowList}) ->
    case lists:member(Type,
                      [1,
                       2,
                       3,
                       4,
                       20,
                       21,
                       22,
                       23,
                       24,
                       25,
                       26,
                       27,
                       5,
                       6,
                       30,
                       31,
                       32,
                       33,
                       34,
                       35,
                       36,
                       35,
                       37,
                       38,
                       39,
                       40,
                       41,
                       7,
                       100,
                       101,
                       42,
                       43,
                       44,
                       45,
                       46,
                       47,
                       52,
                       53,
                       65,
                       56,
                       66,
                       67,
                       68,
                       69,
                       70,
                       71,
                       79,
                       80,
                       81,
                       82])
        of
        true ->
            rank_zone:update_ets(Rank#rank{list = rc_ver(List, []),
                                           show_list = rc_ver(ShowList, [])});
        _ ->
            cast({delete, Type}),
            false
    end;
ver(_Rank) -> false.

rc_ver([], L) -> lists:reverse(L);
rc_ver([I | T], L) ->
    case catch do_rc_ver(I) of
        {ok, NewI} -> rc_ver(T, [NewI | L]);
        _ -> rc_ver(T, L)
    end.

do_rc_ver({rank_rc,
           Ver = 1,
           Id,
           Rank,
           Time,
           RoleId,
           Platform,
           ZoneId,
           Name,
           Sex,
           Classes,
           Val1,
           Val2,
           Val3,
           Val4,
           Desc,
           Pet,
           Guard}) ->
    Lev = 0,
    do_rc_ver({rank_rc,
               Ver + 1,
               Id,
               Rank,
               Time,
               RoleId,
               Platform,
               ZoneId,
               Name,
               Sex,
               Classes,
               Lev,
               Val1,
               Val2,
               Val3,
               Val4,
               Desc,
               Pet,
               Guard});
do_rc_ver({rank_rc,
           Ver = 2,
           Id,
           Rank,
           Time,
           RoleId,
           Platform,
           ZoneId,
           Name,
           Sex,
           Classes,
           Lev,
           Val1,
           Val2,
           Val3,
           Val4,
           Desc,
           Pet,
           Guard}) ->
    Eqm = undefined,
    do_rc_ver({rank_rc,
               Ver + 1,
               Id,
               Rank,
               Time,
               RoleId,
               Platform,
               ZoneId,
               Name,
               Sex,
               Classes,
               Lev,
               Val1,
               Val2,
               Val3,
               Val4,
               Desc,
               Pet,
               Guard,
               Eqm});
do_rc_ver(Rc = #rank_rc{ver = 3}) ->
    do_rc_ver_field([pet, guard], Rc);
do_rc_ver(_Rc) ->
    logger:error("错误的排行榜结构:~w", [_Rc], rank_mgr, 195),
    false.

do_rc_ver_field([], Rc) -> {ok, Rc};
do_rc_ver_field([Field | T], Rc) ->
    case do_rc_ver_field(Field, Rc) of
        {ok, NewRc} -> do_rc_ver_field(T, NewRc);
        false -> false
    end;
do_rc_ver_field(pet, Rc = #rank_rc{pet = undefined}) ->
    {ok, Rc};
do_rc_ver_field(pet, Rc = #rank_rc{pet = Pet}) ->
    case pet_ver:do_pet(Pet) of
        {ok, NewPet} -> {ok, Rc#rank_rc{pet = NewPet}};
        _ -> {ok, Rc}
    end;
do_rc_ver_field(guard,
                Rc = #rank_rc{guard = undefined}) ->
    {ok, Rc};
do_rc_ver_field(guard, Rc = #rank_rc{guard = Guard}) ->
    case guard_ver:do_guard_ver(Guard) of
        {ok, NewGuard} -> {ok, Rc#rank_rc{guard = NewGuard}};
        _ -> {ok, Rc}
    end.

