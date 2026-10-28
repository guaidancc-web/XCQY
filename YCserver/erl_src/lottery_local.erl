-file("src/mod/lottery/lottery_local.erl", 1).

-module(lottery_local).

-behaviour(gen_server).

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

-file("src/mod/lottery/lottery_local.erl", 10).

-file("inc/role.hrl", 1).

-record(role,
        {ver = 76 :: pos_integer(),
         pid :: undefined | pid(),
         loop_counter = 1 :: pos_integer(),
         is_gain = false,
         need_sync = false :: boolean(),
         time_info = {0, 0} ::
             {non_neg_integer(), non_neg_integer()},
         time_reg = 1 :: pos_integer(),
         ip_reg = {0, 0, 0, 0} :: tuple(),
         ip_last_login = {0, 0, 0, 0} :: tuple(),
         lock_status = 0,
         id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         channel_reg = 0 :: non_neg_integer(),
         dispense = "",
         device_id = "",
         device_type = 1,
         device_key = "",
         account = "" :: list(),
         name = "" :: list(),
         charge = 0 :: non_neg_integer(),
         consume = 0,
         label = 0 :: 0..2,
         sex = 2 :: 0..2,
         classes = 0 :: 0..5,
         lev = 0 :: non_neg_integer(),
         realm = 0 :: non_neg_integer(),
         speed = 0 :: non_neg_integer(),
         hp = 1 :: pos_integer(),
         mp = 1 :: pos_integer(),
         hp_max = 1 :: pos_integer(),
         mp_max = 1 :: pos_integer(),
         face = 1 :: pos_integer(),
         assets :: undefined | tuple(),
         attr :: undefined | tuple(),
         link :: undefined | tuple(),
         trigger = {1, []} :: {pos_integer(), [tuple()]},
         timer :: undefined | tuple(),
         pos :: undefined | tuple(),
         extra = [] :: [{non_neg_integer(), term()}],
         status = 0 :: 0..4,
         s_action = 0 :: non_neg_integer(),
         s_ride = 0 :: 0..3,
         s_event = 0 :: non_neg_integer(),
         s_event_pid = 0 :: 0 | undefined | pid(),
         s_name = 0 :: 0 | 1,
         s_looks = [] ::
             [{non_neg_integer(),
               non_neg_integer(),
               non_neg_integer(),
               bitstring()}],
         s_follow = [] :: [tuple()],
         debug_rpc = false :: boolean(),
         name_used = "" :: string(),
         cross_type = 0,
         m_attr_point,
         m_combat,
         m_quest,
         m_pet,
         m_skill,
         m_var,
         m_guard,
         m_plot,
         m_dungeon,
         m_guild,
         m_home,
         m_option,
         m_wing,
         m_team,
         m_honor,
         m_friend,
         m_wake,
         m_arena,
         m_market_silver,
         m_escort,
         m_buff,
         m_formation,
         m_skill_life,
         m_trial,
         m_fashion,
         m_satiety,
         m_agenda,
         m_parade,
         m_mail = [],
         m_qualifying,
         m_treasure,
         m_campaign,
         m_shipping,
         m_checkin,
         m_tower,
         m_classes_challenge,
         m_fairyland,
         m_glory,
         m_examination,
         m_adm,
         m_alchemy,
         m_pet_store,
         m_store,
         m_achievement,
         m_wedding,
         m_constellation,
         m_investment,
         m_privilege,
         m_limit_return,
         m_pray,
         m_teacher,
         m_help,
         m_achieve_shop,
         m_brave_trial,
         m_camp_dragon_boat,
         m_over_seas,
         m_hook_setting,
         m_tournament,
         m_market_gold,
         m_goal,
         m_family,
         m_charge_gift,
         m_mount,
         m_camp_web,
         m_handbook,
         m_endless_challenge,
         m_lev_break,
         m_head,
         m_extension,
         m_camp_cake,
         m_rainbow_lottery,
         m_sworn,
         m_gods_duel,
         m_preparation,
         m_reward_back,
         m_child,
         m_maze,
         m_raffle,
         m_rencounter,
         m_talisman,
         m_month_gift,
         m_pay_turn,
         m_camp_box,
         m_camp_pay_continus,
         m_spirit_treasure,
         m_camp_discount,
         m_camp_7_7th,
         m_new_expression,
         m_exquisite_shelf,
         m_camp_recharge,
         m_camp_recharge_gift,
         m_camp_collection,
         m_camp_cut_price,
         m_camp_inquiry,
         m_gods_place,
         m_camp_slot_machine,
         m_camp_sign_draw,
         m_agenda_week,
         m_exp_bottle,
         m_camp_zillionaire,
         m_provocation,
         m_oracle_treasure,
         m_camp_pass_flower_language,
         m_camp_score_exchange,
         m_camp_pray,
         p_bag,
         p_store,
         p_eqm,
         p_family_store}).

-record(map_role,
        {pid :: undefined | pid(),
         rid = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: list(),
         speed = 1 :: pos_integer(),
         conn_pid :: undefined | pid(),
         map = 0 :: non_neg_integer(),
         grid_pid :: undefined | pid(),
         dir = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         gx = 0 :: non_neg_integer(),
         gy = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         action = 0 :: non_neg_integer(),
         ride = 0 :: non_neg_integer(),
         event = 0 :: non_neg_integer(),
         hidden = 0 :: 0..1,
         label = 0 :: 0..2,
         lev = 1 :: pos_integer(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..5,
         realm = 0 :: non_neg_integer(),
         face = 1 :: pos_integer(),
         fc = 0 :: non_neg_integer(),
         prop = [] :: [{non_neg_integer(), string()}],
         looks = [] :: list(),
         follow_list = [] :: list(),
         guild = "" :: bitstring(),
         guild_post = "" :: bitstring(),
         guild_signature = "" :: bitstring(),
         guild_id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         team_status = 0 :: 0..4,
         team_num = 0,
         lover_rid = 0 :: non_neg_integer(),
         lover_platform = "" :: list(),
         lover_zone_id = 0 :: non_neg_integer(),
         lover_name = "" :: list(),
         lover_status = 0 :: non_neg_integer(),
         team_mark = 401 :: non_neg_integer(),
         foot_mark = 0 :: non_neg_integer()}).

-record(role_info,
        {id = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: list(),
         lock_status = 0 :: 0..3,
         lev = 1 :: pos_integer(),
         break_times = 0 :: non_neg_integer(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..5,
         fc = 0 :: pos_integer(),
         guild = "" :: list()}).

-record(role_name_used,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         new_name = "",
         sex = 0,
         classes = 0,
         time = 0}).

-record(role_profile,
        {id = {0, "", 0} :: tuple(),
         name = "" :: list(),
         lev = 1 :: pos_integer(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..5,
         fc = 0 :: pos_integer(),
         face = 0 :: non_neg_integer(),
         guild_id = {0, "", 0} :: tuple(),
         guild_name = "" :: list(),
         looks = [],
         achievement_point = 0 :: non_neg_integer(),
         achievement_assets_point = 0,
         achievement_list = [],
         status = 0 :: 0..4,
         team_status = 0 :: 0..4,
         team_num = 0,
         name_used = "" :: string(),
         honor_id = 0 :: non_neg_integer(),
         lover_name = "" :: string(),
         teacher_name = "" :: string(),
         tournament_lev = 0 :: non_neg_integer(),
         family_id = {0, "", 0} :: tuple(),
         break_times = 0 :: non_neg_integer(),
         pre_honor_id = 0 :: non_neg_integer()}).

-record(role_cache,
        {id = {1, "", 0} ::
             {pos_integer(), bitstring(), non_neg_integer()},
         pid :: undefined | pid(),
         link,
         account = "" :: bitstring(),
         name = "" :: bitstring(),
         label = 0 :: 0..2,
         face = 1,
         sex = 2 :: 0..2,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         hp = 1 :: pos_integer(),
         mp = 1 :: pos_integer(),
         hp_max = 1 :: pos_integer(),
         mp_max = 1 :: pos_integer(),
         status = 0 :: 0..4,
         s_action = 0 :: non_neg_integer(),
         s_event = 0 :: non_neg_integer(),
         pos,
         channel_reg = 0 :: non_neg_integer()}).

-record(card_state,
        {gold = 0,
         gold_bind = 0,
         buy_time = 0,
         state = 0,
         day = 0,
         day_sum = 0,
         daily_time = 0}).

-record(m_new_expression,
        {s_expression = [], b_expression = []}).

-file("src/mod/lottery/lottery_local.erl", 11).

-file("inc/lottery.hrl", 1).

-record(lottery,
        {idx = 0 :: non_neg_integer(),
         ver = 2,
         idx_temp = 0 :: non_neg_integer(),
         item_idx = 0 :: non_neg_integer(),
         item_id = 0 :: non_neg_integer(),
         item_count = 0 :: non_neg_integer(),
         pos = 0 :: non_neg_integer(),
         gold_type = 0 :: non_neg_integer(),
         gold_once = 1 :: non_neg_integer(),
         times_sum = 0 :: non_neg_integer(),
         times_now = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         lucky_num = 0 :: non_neg_integer(),
         times_lottery = 0 :: non_neg_integer(),
         state = 0 :: non_neg_integer(),
         num_sum = 0 :: non_neg_integer(),
         hot = 0 :: non_neg_integer(),
         price = 0 :: non_neg_integer(),
         rare = 0 :: non_neg_integer(),
         sort = 0 :: non_neg_integer(),
         role_id = {0, "", 0},
         role_name = "" :: list(),
         history = [] :: list(),
         num_list = [] :: list(),
         id_data = 0 :: non_neg_integer(),
         left_list = [] :: list(),
         buy_list = [] :: list(),
         history_deal = [] :: list()}).

-record(lottery_history,
        {time = 0 :: non_neg_integer(),
         num = 0 :: non_neg_integer(),
         role_id = {0, "", 0} :: list(),
         role_name = "" :: list(),
         item_idx = 0 :: non_neg_integer(),
         item_id = 0 :: non_neg_integer(),
         count = 0 :: non_neg_integer()}).

-record(lottery_mail,
        {idx = 0 :: non_neg_integer(),
         role_id = {0, "", 0} :: list(),
         title = "" :: list(),
         content = "" :: list(),
         item_list = "" :: list(),
         time = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer()}).

-record(lottery_reward_log,
        {idx = 0 :: non_neg_integer(),
         role_id = {0, "", 0} :: list(),
         role_name = "" :: list(),
         item_idx = 0 :: non_neg_integer(),
         item_id = 0 :: non_neg_integer(),
         item_count = 0 :: non_neg_integer(),
         times_buy = 0 :: non_neg_integer(),
         times_sum = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer()}).

-file("src/mod/lottery/lottery_local.erl", 12).

-export([start_link/0,
         request/3,
         request_history/1,
         join_list/2,
         detail/2,
         detail_num/3,
         update_local_data/4,
         update_local_data/2,
         update_ets/2,
         update_data/2,
         update_times_all/1,
         update_data/1,
         update_time/1,
         time_get/0,
         time_set/4,
         list_to_client/2,
         get_times_buy/1,
         get_times_buy/2,
         focus/2]).

start_link() ->
    gen_server:start_link({local, lottery_local},
                          lottery_local,
                          [],
                          []).

-record(state, {}).

init([]) ->
    logger:info("[~w] 正在启动...",
                [lottery_local],
                lottery_local,
                50),
    process_flag(trap_exit, true),
    dets:open_file(lottery_all,
                   [{file, "./dets/lottery_all.dets"},
                    {keypos, #lottery.idx},
                    {type, set}]),
    dets:open_file(lottery_focus,
                   [{file, "./dets/lottery_focus.dets"},
                    {keypos, 1},
                    {type, set}]),
    ets:new(lottery,
            [set, named_table, public, {keypos, #lottery.idx}]),
    ets:new(lottery_all,
            [set, named_table, public, {keypos, #lottery.idx}]),
    ets:new(lottery_buy,
            [set, named_table, public, {keypos, 1}]),
    ets:new(lottery_misc,
            [set, named_table, public, {keypos, 1}]),
    ets:new(lottery_focus,
            [set, named_table, public, {keypos, 1}]),
    lottery_mgr:load_lottery_all(),
    lottery_mgr:load_data_focus(),
    erlang:send_after(70 * 1000, self(), update_all_data),
    {ok, #state{}}.

handle_call(_Request, _From, State) ->
    Reply = ok,
    {reply, Reply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(update_all_data, State) ->
    case big_world:call(lottery_mgr,
                        request_local_data,
                        [env:get(platform), env:get(zone_id)])
        of
        {ok, Lottery, LotteryAll, LotteryMisc, TimesBuy} ->
            logger:debug("一元夺宝请求初始化数据", [], lottery_local, 77),
            update_local_data(all,
                              {Lottery, LotteryAll, LotteryMisc, TimesBuy}),
            case time_get() of
                {StatusCli, StartTime, EndTime} ->
                    role_group:pack_send(world,
                                         16904,
                                         {StatusCli, StartTime, EndTime});
                _ -> ignore
            end;
        _R ->
            logger:debug("一元夺宝请求初始化数据失败 ~w",
                         [_R],
                         lottery_local,
                         85),
            ignore
    end,
    {noreply, State};
handle_info({all,
             Lottery,
             LotteryAll,
             LotteryMisc,
             TimesBuy},
            State) ->
    ets:delete_all_objects(lottery),
    ets:delete_all_objects(lottery_misc),
    ets:delete_all_objects(lottery_buy),
    ets:insert(lottery, Lottery),
    ets:insert(lottery_all, LotteryAll),
    ets:insert(lottery_misc, LotteryMisc),
    ets:insert(lottery_buy, TimesBuy),
    {noreply, State};
handle_info(_Info, State) ->
    logger:debug("一元夺宝更新全部数据~w",
                 [_Info],
                 lottery_local,
                 99),
    {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...",
                [lottery_local],
                lottery_local,
                104),
    util:close_dets(lottery_all),
    logger:info("[~w] 关闭完成",
                [lottery_local],
                lottery_local,
                106),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

request(Role, Type, Time) ->
    case get_time_update(Type) of
        Time1 when Time1 =/= Time ->
            Conn = case Type =:= 0 of
                       true -> [{'>', '$5', 0}];
                       _ -> [{'andalso', {'=:=', '$6', Type}, {'>', '$5', 0}}]
                   end,
            case list_to_client(lottery, Conn) of
                {ok, List} ->
                    LogList1 = get_data(reward_log),
                    MyList = get_times_buy(Role),
                    TimesAll = get_times_all(),
                    FocusList = get_focus(Role),
                    logger:debug("==============~w",
                                 [{length(List),
                                   length(LogList1),
                                   length(MyList)}],
                                 lottery_local,
                                 133),
                    {Time1, List, MyList, LogList1, TimesAll, FocusList};
                _ -> {Time, [], [], [], 0, []}
            end;
        _ -> {Time, [], [], [], 0, []}
    end.

detail(Role, Idx) ->
    case catch ets:lookup(lottery, Idx) of
        [#lottery{idx = Idx, history = History,
                  num_sum = NumSum, history_deal = HistoryDeal} =
             Lottery] ->
            detail(Role,
                   History,
                   Idx,
                   NumSum,
                   HistoryDeal,
                   Lottery);
        _ ->
            case catch ets:lookup(lottery_all, Idx) of
                [#lottery{idx = Idx, history = History,
                          num_sum = NumSum, history_deal = HistoryDeal} =
                     Lottery
                 | _] ->
                    detail(Role,
                           History,
                           Idx,
                           NumSum,
                           HistoryDeal,
                           Lottery);
                _ -> {false, lang:get("该记录已被清除")}
            end
    end.

detail(#role{id = RoleId} = Role, History, Idx, NumSum,
       HistoryDeal, Lottery) ->
    List1 = case lists:keyfind(RoleId, 1, History) of
                {_RoleId, _Name, List, _Count} -> List;
                _ -> []
            end,
    {List2, PageSum} = get_num_page(List1, 1, 36),
    TimesMy = get_times_buy(Role, Idx),
    logger:debug("==========~w",
                 [{TimesMy, NumSum, length(List2)}],
                 lottery_local,
                 161),
    {Lottery,
     TimesMy,
     NumSum,
     HistoryDeal,
     PageSum,
     1,
     List2}.

detail_num(#role{id = RoleId}, Idx, PageNow) ->
    case catch ets:lookup(lottery, Idx) of
        [#lottery{history = History} | _] ->
            detail_num2(RoleId, Idx, History, PageNow);
        _ ->
            case ets:lookup(lottery_all, Idx) of
                [#lottery{history = History} | _] ->
                    logger:debug("=============~w",
                                 [length(History)],
                                 lottery_local,
                                 171),
                    detail_num2(RoleId, Idx, History, PageNow);
                _ -> {false, lang:get("该记录已被清除")}
            end
    end.

detail_num2(RoleId, Idx, History, PageNow) ->
    List1 = case lists:keyfind(RoleId, 1, History) of
                {_RoleId, _RoleName, List, _Count} -> List;
                _ -> []
            end,
    {List2, PageSum} = get_num_page(List1, PageNow, 36),
    logger:debug("===========~w",
                 [length(List2)],
                 lottery_local,
                 183),
    {Idx, PageSum, PageNow, List2}.

request_history(PageNum) ->
    case list_to_client(lottery_all, []) of
        {ok, ItemList} ->
            ItemList1 =
                lists:reverse(lists:keysort(#lottery.idx_temp,
                                            ItemList)),
            {ItemList2, PageSum} = get_num_page(ItemList1,
                                                PageNum,
                                                100),
            logger:debug("全部历史记录个数~w",
                         [length(ItemList2)],
                         lottery_local,
                         192),
            {PageSum, PageNum, ItemList2};
        _ -> {1, 1, []}
    end.

join_list(Role, PageNum) ->
    Conn = [{'orelse',
             {'=:=', '$14', 4},
             {'=:=', '$14', 3}}],
    ItemList = case list_to_client(lottery, Conn) of
                   {ok, List} ->
                       logger:debug("===========~w",
                                    [length(List)],
                                    lottery_local,
                                    201),
                       List;
                   _ ->
                       logger:debug("===========~w",
                                    [length([])],
                                    lottery_local,
                                    202),
                       []
               end,
    TimesBuyList = get_times_buy(Role),
    Fun = fun ({Idx, Times}, {Acc1, Acc2}) ->
                  case lists:keyfind(Idx, #lottery.idx, ItemList) of
                      false -> {Acc1, Acc2};
                      Lottery -> {[Lottery | Acc1], [{Idx, Times} | Acc2]}
                  end
          end,
    {ItemList1, TimesBuyList1} = lists:foldl(Fun,
                                             {[], []},
                                             TimesBuyList),
    {ItemList2, PageTotal} = get_num_page(ItemList1,
                                          PageNum,
                                          100),
    logger:debug("======join_list======~w",
                 [{length(ItemList),
                   length(TimesBuyList),
                   length(ItemList2),
                   length(TimesBuyList1),
                   PageTotal}],
                 lottery_local,
                 212),
    {ok, {ItemList2, TimesBuyList1, PageTotal, PageNum}}.

focus(Role, Idx) ->
    case ets:lookup(lottery, Idx) of
        [#lottery{item_idx = ItemIdx, item_id = ItemId,
                  item_count = ItemCount}
         | _] ->
            List = get_focus(Role),
            case lists:member(ItemIdx, List) of
                true ->
                    Msg = notice:format(lang:get("已~ts~ts"),
                                        [{string_2, 5, lang:get("取消关注")},
                                         {item_2, ItemId, ItemCount}]),
                    List1 = lists:delete(ItemIdx, List),
                    update_focus(Role, List1),
                    {Idx, ItemIdx, 0, Msg};
                _ ->
                    Msg = notice:format(lang:get("已~ts~ts,下次出现将~ts"),
                                        [{string_2, 5, lang:get("关注")},
                                         {item_2, ItemId, ItemCount},
                                         {string_2, 5, lang:get("置顶显示")}]),
                    List1 = [ItemIdx | List],
                    update_focus(Role, List1),
                    {Idx, ItemIdx, 1, Msg}
            end;
        _ -> {false, lang:get("该物品不存在,不能关注")}
    end.

get_num_page(List, Page, Num) ->
    LenTotal = length(List),
    PageTotal = util:ceil(LenTotal / Num),
    {Flag, NowPage} = if Page < 1 orelse PageTotal =:= 0 ->
                             {false, 1};
                         Page > PageTotal -> {false, PageTotal};
                         true -> {true, Page}
                      end,
    case Flag of
        true ->
            StartIdx = (NowPage - 1) * Num + 1,
            {lists:sublist(List, StartIdx, Num), PageTotal};
        false -> {[], PageTotal}
    end.

get_times_buy(#role{id = RoleId}) ->
    case ets:lookup(lottery_buy, RoleId) of
        [{_, List}] -> List;
        _ -> []
    end.

get_times_buy(Role, Idx) ->
    case get_times_buy(Role) of
        [_ | _] = List ->
            case lists:keyfind(Idx, 1, List) of
                {Idx, Count} -> Count;
                _ -> 0
            end;
        _ -> 0
    end.

get_time_update(GoldType) ->
    case ets:lookup(lottery_misc, {time_update, GoldType})
        of
        [{_, Time}] -> Time;
        _ -> 0
    end.

update_times_all(Count) ->
    Times = get_times_all(),
    Times1 = case Times > 9999999 of
                 true -> round(Times * 2.5e-1);
                 _ -> Times
             end,
    update_data(lottery_misc, {times_all, Count + Times1}).

get_times_all() ->
    case ets:lookup(lottery_misc, times_all) of
        [{_, Times} | _] -> Times;
        _ -> 0
    end.

get_focus(#role{id = RoleId}) ->
    case ets:lookup(lottery_focus, RoleId) of
        [{_, List} | _] -> List;
        _ -> []
    end.

update_focus(#role{id = RoleId}, List) ->
    update_data(lottery_focus, {RoleId, List}).

get_data(Key) ->
    case ets:lookup(lottery_misc, Key) of
        [{_, List} | _] -> List;
        _ -> []
    end.

time_set(StatusServ, StatusCli, StartTime, EndTime) ->
    update_time({StatusServ,
                 StatusCli,
                 StartTime,
                 EndTime}).

time_get() ->
    case ets:lookup(lottery_misc, time) of
        [{_, {_StatusServ, StatusCli, TimeStart, TimeEnd}}] ->
            {StatusCli, TimeStart, TimeEnd};
        _ -> {0, 0, 0}
    end.

update_time(Data) ->
    case Data of
        {_, StatusCli, StartTime, EndTime} ->
            role_group:pack_send(world,
                                 16904,
                                 {StatusCli, StartTime, EndTime});
        _ -> skip
    end,
    update_data(lottery_misc, {time, Data}).

update_data(Lottery) -> update_ets(lottery, Lottery).

update_data(Table, Data) -> update_ets(Table, Data).

update_ets(Table, Data) -> ets:insert(Table, Data).

update_local_data(Lottery, TimesAll, Time,
                  TimesBuyList) ->
    ets:insert(lottery, Lottery),
    ets:insert(lottery_misc, {times_all, TimesAll}),
    ets:insert(lottery_misc, {{time_update, 0}, Time}),
    ets:insert(lottery_buy, TimesBuyList).

update_local_data(all,
                  {Lottery, LotteryAll, LotteryMisc, TimesBuy}) ->
    lottery_local !
        {all, Lottery, LotteryAll, LotteryMisc, TimesBuy};
update_local_data(lottery_all, Data) ->
    Size = ets:info(lottery_all, size),
    logger:debug("====文件大小==~w",
                 [Size],
                 lottery_local,
                 349),
    case Size >= 100 of
        true ->
            case list_to_client(lottery_all, []) of
                {ok, List} ->
                    ListDelet = lists:sublist(lists:keysort(#lottery.time,
                                                            List),
                                              20),
                    Fun = fun (#lottery{idx = Idx}) ->
                                  ets:delete(lottery_all, Idx),
                                  dets:delete(lottery_all, Idx)
                          end,
                    lists:foreach(Fun, ListDelet);
                _ -> ignore
            end;
        _ -> ignore
    end,
    ets:insert(lottery_all, Data),
    dets:insert(lottery_all, Data);
update_local_data(time, Data) -> update_time(Data);
update_local_data(init, Lottery) ->
    ets:delete_all_objects(lottery),
    ets:insert(lottery, Lottery);
update_local_data(lottery, Lottery) ->
    ets:insert(lottery, Lottery);
update_local_data(reward_log, Datas) ->
    ets:insert(lottery_misc, {reward_log, Datas});
update_local_data(Type, Data) ->
    logger:info("未知类型,请注意检查哈!~w",
                [{Type, Data}],
                lottery_local,
                378),
    ok.

list_to_client(Table, Conn) ->
    Match = #lottery{idx = '$1', item_idx = '$2',
                     item_id = '$3', item_count = '$4', pos = '$5',
                     gold_type = '$6', gold_once = '$7', times_sum = '$8',
                     times_now = '$9', time = '$10', lucky_num = '$11',
                     times_lottery = '$12', state = '$13', num_sum = '$14',
                     hot = '$15', price = '$16', role_id = '$17',
                     role_name = '$18', rare = '$19', sort = '$20', _ = '_'},
    F = fun ([Idx,
              ItemIdx,
              ItemId,
              ItemCount,
              Pos,
              GoldType,
              GoldOnce,
              TimesSum,
              TimesNow,
              Time,
              LuckyNum,
              TimesLottery,
              State,
              NumSum,
              Hot,
              Price,
              RoleId,
              RoleName,
              Rare,
              Sort]) ->
                #lottery{idx = Idx, item_idx = ItemIdx,
                         item_id = ItemId, item_count = ItemCount, pos = Pos,
                         gold_type = GoldType, gold_once = GoldOnce,
                         times_sum = TimesSum, times_now = TimesNow,
                         time = Time, lucky_num = LuckyNum,
                         times_lottery = TimesLottery, state = State,
                         num_sum = NumSum, hot = Hot, price = Price,
                         role_id = RoleId, role_name = RoleName, rare = Rare,
                         sort = Sort}
        end,
    case catch ets:select(Table, [{Match, Conn, ['$$']}]) of
        L when is_list(L) -> {ok, [F(O) || O <- L]};
        _ -> {false, lang:get("系统繁忙，无法查询")}
    end.

