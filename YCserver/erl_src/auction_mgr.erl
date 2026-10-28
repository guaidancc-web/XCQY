-file("src/mod/auction/auction_mgr.erl", 1).

-module(auction_mgr).

-behaviour(gen_fsm).

-export([start_link/0,
         m/1,
         call/1,
         cast/1,
         info/1,
         send/2]).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

-export([idle/2,
         auction/2,
         prepare/2,
         over/2,
         continue/2,
         continue/3]).

-export([leave_cast/1,
         focus_get/1,
         focus_list_get/1,
         focus_cast/2,
         join_cast/1,
         time_list/0,
         start_gm/2,
         auction_list/0,
         data_init/0,
         auction_get/1,
         time_init/0,
         time_status_get/0,
         auction_item_send/1,
         item_status_do/0,
         next_time_deal/1,
         update_data/1,
         update_data/2]).

-record(state,
        {ts = 0, time_next = 0, timeout = 0, status = idle}).

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

-file("src/mod/auction/auction_mgr.erl", 66).

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

-file("src/mod/auction/auction_mgr.erl", 67).

-file("inc/notice.hrl", 1).

-record(notice,
        {id = 1 :: pos_integer(),
         type = 0 :: non_neg_integer(),
         pos = 1 :: pos_integer(),
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         msg = "" :: bitstring()}).

-record(notice_board,
        {id = 1,
         type = 1,
         start_time = 0,
         end_time = 0,
         title = "",
         content = "",
         msg = "",
         gain = [],
         condition = []}).

-record(notice_scroll,
        {id = 1,
         type = 1,
         start_time = 0,
         end_time = 0,
         interval_time = 0,
         content = ""}).

-record(notice_board_log, {id = 1, log_list = []}).

-record(campaign_notice,
        {title = [] :: list(),
         content = [] :: list(),
         process = [] :: list(),
         extern_content = [] :: list(),
         rewards = [] :: list()}).

-file("src/mod/auction/auction_mgr.erl", 68).

-file("inc/gain.hrl", 1).

-record(gain,
        {label :: undefined | atom(),
         val :: undefined | term(),
         msg = "" :: list(),
         source = 0 :: non_neg_integer(),
         notice_msg = "" :: list(),
         reason :: undefined | atom(),
         ext = 0 :: term(),
         notice = 0 :: 0..1,
         ext_val = 0}).

-record(loss,
        {label :: undefined | atom(),
         val :: undefined | term(),
         msg = "" :: list(),
         notice_msg = "" :: list(),
         source = 0 :: non_neg_integer(),
         reason :: undefined | atom(),
         ext = 0 :: term(),
         ext_val = 0,
         auto_scene = "" :: list()}).

-record(gain_text_opts,
        {order = loss :: gain | loss,
         gain_tag = "" :: string(),
         loss_tag = "" :: string(),
         split_str = "，" :: string(),
         split_op_str = "，" :: string(),
         merge_type = [] :: list(),
         fly_to_bag = 0 :: non_neg_integer()}).

-file("src/mod/auction/auction_mgr.erl", 69).

-file("inc/assets.hrl", 1).

-record(assets,
        {ver = 41 :: pos_integer(),
         exp = 0 :: non_neg_integer(),
         coin = 0 :: non_neg_integer(),
         coin_bind = 0 :: non_neg_integer(),
         gold = 0 :: non_neg_integer(),
         gold_bind = 0 :: non_neg_integer(),
         intelligs = 0 :: non_neg_integer(),
         guild = 0 :: non_neg_integer(),
         energy = 0 :: non_neg_integer(),
         satiety = 300 :: non_neg_integer(),
         stars_score = 0 :: non_neg_integer(),
         reserve_exp = 0 :: non_neg_integer(),
         character = 0 :: non_neg_integer(),
         alchemy = 0 :: non_neg_integer(),
         love = 0 :: non_neg_integer(),
         teacher_score = 0 :: non_neg_integer(),
         tournament = 0 :: non_neg_integer(),
         lottery_luck = 0 :: non_neg_integer(),
         endless_challenge = 0 :: non_neg_integer(),
         handbook_point = 0 :: non_neg_integer(),
         autumn_score = 0 :: non_neg_integer(),
         star_gold = 0 :: non_neg_integer(),
         halloween = 0 :: non_neg_integer(),
         thanksgiving = 0 :: non_neg_integer(),
         new_year = 0 :: non_neg_integer(),
         firecracker = 0 :: non_neg_integer(),
         glue_pudding = 0 :: non_neg_integer(),
         crystal = 0 :: non_neg_integer(),
         ticket = 0 :: non_neg_integer(),
         brother = 0 :: non_neg_integer(),
         egg = 0 :: non_neg_integer(),
         exchange = 0 :: non_neg_integer(),
         turn = 0 :: non_neg_integer(),
         father = 0 :: non_neg_integer(),
         lucky_ticket = 0 :: non_neg_integer(),
         dollar = 0 :: non_neg_integer(),
         naughty = 0 :: non_neg_integer(),
         concentric = 0 :: non_neg_integer(),
         qixiIntegral = 0 :: non_neg_integer(),
         sunshine = 0 :: non_neg_integer(),
         cut_price = 0 :: non_neg_integer(),
         single_dog = 0 :: non_neg_integer(),
         panda_score = 0 :: non_neg_integer(),
         joyful_egg = 0 :: non_neg_integer(),
         godswar = 0 :: non_neg_integer(),
         skl_unique_exp = 0 :: non_neg_integer(),
         happy_score = 0 :: non_neg_integer(),
         slot_machine = 0 :: non_neg_integer(),
         reserve_gold = 0 :: non_neg_integer(),
         zillionaire_sc = 0,
         score_exchange = 0 :: non_neg_integer(),
         new_open_turn = 0 :: non_neg_integer(),
         long_active = 0 :: non_neg_integer(),
         long_score = 0 :: non_neg_integer(),
         camp_pray_sc = 0 :: non_neg_integer()}).

-file("src/mod/auction/auction_mgr.erl", 70).

-file("inc/auction.hrl", 1).

-record(auction,
        {idx = 0 :: non_neg_integer(),
         item_id = 0 :: non_neg_integer(),
         item_count = 0 :: non_neg_integer(),
         gold = 0 :: non_neg_integer(),
         gold_once = 1 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         time_auction = 0 :: non_neg_integer(),
         state = 0 :: non_neg_integer(),
         week = 0 :: non_neg_integer(),
         role_id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         role_name = "" :: list(),
         focus = [] :: list(),
         auto = [] :: list(),
         history = [] :: list()}).

-file("src/mod/auction/auction_mgr.erl", 71).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/auction/auction_mgr.erl", 72).

start_link() ->
    gen_fsm:start_link({local, auction_mgr},
                       auction_mgr,
                       [],
                       []).

m(Event) -> gen_fsm:send_event(auction_mgr, Event).

call(Msg) ->
    case catch
             gen_fsm:sync_send_all_state_event(auction_mgr, Msg)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

cast(Msg) ->
    gen_fsm:send_all_state_event(auction_mgr, Msg).

info(Msg) -> auction_mgr ! Msg.

send({Rid, P, Z}, Msg) ->
    case role_query:pid(by_id, Rid, P, Z) of
        {ok, Pid} -> notice:send({pid, Pid}, 1, Msg);
        _ -> skip
    end.

init([]) ->
    logger:info("[~w] 正在启动...",
                [auction_mgr],
                auction_mgr,
                123),
    process_flag(trap_exit, true),
    put(role_conn, []),
    dets:open_file(auction,
                   [{file, "./dets/auction.dets"},
                    {keypos, #auction.idx},
                    {type, set}]),
    dets:open_file(auction_focus,
                   [{file, "./dets/auction_focus.dets"},
                    {keypos, #auction.idx},
                    {type, set}]),
    ets:new(auction,
            [set, named_table, public, {keypos, #auction.idx}]),
    ets:new(auction_time,
            [set, named_table, public, {keypos, 1}]),
    ets:new(auction_focus,
            [set, named_table, public, {keypos, 1}]),
    ets:new(auction_conn,
            [set, named_table, public, {keypos, 1}]),
    case dets:first(auction) of
        '$end_of_table' ->
            logger:info("竞拍没有数据需要加载", [], auction_mgr, 140);
        _ ->
            dets:traverse(auction,
                          fun (A = #auction{idx = Idx}) ->
                                  update_id(item_idx, Idx),
                                  ets:insert(auction, A),
                                  continue;
                              (_Err) ->
                                  logger:error("错误的竞拍数据:~w",
                                               [_Err],
                                               auction_mgr,
                                               148),
                                  {done, false}
                          end),
            put(item_idx, get(item_idx) + 1),
            self() ! deal
    end,
    dets:to_ets(auction_focus, auction_focus),
    erlang:send_after(date:next_diff(0, 0, 5) * 1000,
                      self(),
                      refresh),
    time_init(),
    {Time, Status} = time_status_get(),
    Now = date:unixtime(),
    Timeout = (Time - Now) * 1000,
    logger:info("[~w] 启动完成...",
                [auction_mgr],
                auction_mgr,
                162),
    logger:info("竞拍开启时间[~w]",
                [{Status,
                  Time,
                  Timeout,
                  util:time_left(Timeout, erlang:now())}],
                auction_mgr,
                163),
    case auction_list() of
        [_ | _] ->
            auction_item_send(Now),
            {ok,
             Status,
             #state{ts = erlang:now(), time_next = Time,
                    timeout = Timeout, status = Status},
             Timeout};
        _ ->
            {ok,
             Status,
             #state{ts = erlang:now(), time_next = Time,
                    timeout = Timeout, status = Status},
             Timeout}
    end.

handle_sync_event({add_gold,
                   #role{id = Id, name = Name},
                   RoleId,
                   Idx,
                   GoldAdd,
                   Gold},
                  _From, StateName, State) ->
    logger:debug("auction ~w~n",
                 [{Idx, GoldAdd, Gold}],
                 auction_mgr,
                 175),
    Reply = case ets:lookup(auction, Idx) of
                [Auction = #auction{gold = GoldNow, state = State1,
                                    role_id = RoleId1, role_name = RoleName,
                                    gold_once = GoldOnce, item_id = ItemId,
                                    time = Time, time_auction = _Time1}] ->
                    case GoldNow =:= Gold andalso RoleId =:= RoleId1 of
                        true ->
                            case State1 =:= 2 of
                                true ->
                                    Now = date:unixtime(),
                                    GoldNow1 = GoldNow + GoldAdd,
                                    mail_send(Id,
                                              RoleId,
                                              RoleName,
                                              ItemId,
                                              GoldNow1,
                                              GoldNow),
                                    OverTime = case Now - Time < 60 of
                                                   true -> Now + 60;
                                                   _ -> Time
                                               end,
                                    logger:debug("==============~w~n",
                                                 [{Time,
                                                   _Time1,
                                                   GoldNow1,
                                                   OverTime}],
                                                 auction_mgr,
                                                 190),
                                    update_data(Auction#auction{gold = GoldNow1,
                                                                role_id = Id,
                                                                role_name =
                                                                    Name,
                                                                time_auction =
                                                                    OverTime,
                                                                state =
                                                                    State1}),
                                    auction_item_send(Now),
                                    next_time_deal(Now),
                                    {ok, Msg} = proto_167:pack(srv,
                                                               16703,
                                                               {Idx,
                                                                GoldNow1,
                                                                GoldNow1,
                                                                GoldOnce,
                                                                OverTime,
                                                                State1}),
                                    logger:debug("协议 703 ~w~n",
                                                 [Msg],
                                                 auction_mgr,
                                                 195),
                                    do_cast(Msg),
                                    {ok, null};
                                _ ->
                                    case State1 of
                                        1 -> {false, lang:get("该物品尚未开始拍卖")};
                                        _ -> {false, lang:get("该物品已被拍卖")}
                                    end
                            end;
                        _ -> {false, lang:get("请重新拍卖")}
                    end;
                _ -> {false, lang:get("该物品已被拍卖")}
            end,
    logger:debug("==============~w~n",
                 [Reply],
                 auction_mgr,
                 212),
    continue(StateName, Reply, State);
handle_sync_event(_Event, _From, StateName, State) ->
    logger:debug("==============~w~n",
                 [_Event],
                 auction_mgr,
                 218),
    Reply = ok,
    continue(StateName, Reply, State).

handle_event(_Event, StateName, State) ->
    logger:error("竞拍系统管理进程收到未处理的消息:~w",
                 [_Event],
                 auction_mgr,
                 224),
    continue(StateName, State).

handle_info(start_gm, _StateName, _State) ->
    logger:debug("========handle_info======~w~n",
                 [start_gm],
                 auction_mgr,
                 229),
    {Time, _Status} = time_status_get(),
    logger:debug("========handle_info======~w~n",
                 [_Status],
                 auction_mgr,
                 231),
    Now = date:unixtime(),
    Timeout = (Time - Now) * 1000,
    continue(idle,
             #state{status = idle, timeout = Timeout,
                    time_next = Time, ts = erlang:now()});
handle_info(deal, StateName, State) ->
    logger:debug("========handle_info======~w~n",
                 [deal],
                 auction_mgr,
                 238),
    Now = date:unixtime(),
    auction_item_send(Now),
    next_time_deal(Now),
    continue(StateName, State);
handle_info({focus, #role{id = Rid} = Role, Idx},
            StateName, State) ->
    logger:debug("Role focus=============~w~n",
                 [Idx],
                 auction_mgr,
                 246),
    case ets:lookup(auction, Idx) of
        [#auction{} | _] ->
            List = focus_list_get(Rid),
            case lists:member(Idx, List) of
                true ->
                    update_data(auction_focus,
                                {Rid, lists:delete(Idx, List)}),
                    push(Role, 16702, {Idx, 0});
                _ ->
                    update_data(auction_focus, {Rid, [Idx | List]}),
                    push(Role, 16702, {Idx, 1})
            end;
        _ -> ignore
    end,
    continue(StateName, State);
handle_info(_Info, StateName, State) ->
    logger:debug(" no handle info ~w~n",
                 [_Info],
                 auction_mgr,
                 264),
    continue(StateName, State).

terminate(_Reason, _StateName, _State) ->
    logger:info("[~w] 正在关闭...",
                [auction_mgr],
                auction_mgr,
                268),
    logger:info("[~w] 关闭完成",
                [auction_mgr],
                auction_mgr,
                269),
    ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

time_init() ->
    time_init([{0,
                {date:day_of_the_week(date:unixtime()),
                 begin
                     {_, {H, _M, _S}} =
                         date:seconds_to_datetime(date:unixtime()),
                     H
                 end,
                 begin
                     {_, {_H, M, _S}} =
                         date:seconds_to_datetime(date:unixtime()),
                     M
                 end,
                 begin
                     {_, {_H, _M, S}} =
                         date:seconds_to_datetime(date:unixtime()),
                     S
                 end}},
               {{date:day_of_the_week(date:unixtime()),
                 begin
                     {_, {H, _M, _S}} =
                         date:seconds_to_datetime(date:unixtime()),
                     H
                 end,
                 begin
                     {_, {_H, M, _S}} =
                         date:seconds_to_datetime(date:unixtime()),
                     M
                 end,
                 begin
                     {_, {_H, _M, S}} =
                         date:seconds_to_datetime(date:unixtime()),
                     S
                 end
                     + 10},
                {date:day_of_the_week(date:unixtime()),
                 begin
                     {_, {H, _M, _S}} =
                         date:seconds_to_datetime(date:unixtime()),
                     H
                 end,
                 begin
                     {_, {_H, M, _S}} =
                         date:seconds_to_datetime(date:unixtime()),
                     M
                 end
                     + 2,
                 begin
                     {_, {_H, _M, S}} =
                         date:seconds_to_datetime(date:unixtime()),
                     S
                 end}}]).

time_init(TimeList) ->
    Unixtime = date:unixtime(),
    Week = date:day_of_the_week(Unixtime),
    Fun = fun ({{Week1, H1, Min1, S1},
                {Week2, H2, Min2, S2}},
               {IdxAcc, TimeAcc}) ->
                  {Y1, M1, D1} = weed_to_ymd(Unixtime, Week, Week1),
                  {Y2, M2, D2} = weed_to_ymd(Unixtime, Week, Week2),
                  {IdxAcc + 1,
                   [{IdxAcc,
                     {date:datetime_to_seconds({Y1, M1, D1, H1, Min1, S1}),
                      date:datetime_to_seconds({Y2, M2, D2, H2, Min2, S2})}}
                    | TimeAcc]};
              ({0, {Week2, H2, Min2, S2}}, {IdxAcc, TimeAcc}) ->
                  {Y2, M2, D2} = weed_to_ymd(Unixtime, Week, Week2),
                  {IdxAcc + 1,
                   [{IdxAcc,
                     {0,
                      date:datetime_to_seconds({Y2, M2, D2, H2, Min2, S2})}}
                    | TimeAcc]};
              ({{Week1, H1, Min1, S1}, 0}, {IdxAcc, TimeAcc}) ->
                  {Y1, M1, D1} = weed_to_ymd(Unixtime, Week, Week1),
                  {IdxAcc + 1,
                   [{IdxAcc,
                     {date:datetime_to_seconds({Y1, M1, D1, H1, Min1, S1}),
                      0}}
                    | TimeAcc]}
          end,
    {_Idx, List} = lists:foldl(Fun, {1, []}, TimeList),
    ets:insert(auction_time, List),
    logger:debug("时间列表~w~n", [List], auction_mgr, 299),
    List.

weed_to_ymd(Unixtime, Week, Week1) ->
    case Week1 >= Week of
        true ->
            {{Y, M, D}, _} = date:seconds_to_datetime(Unixtime +
                                                          (Week1 - Week) *
                                                              86400),
            {Y, M, D};
        _ ->
            {{Y, M, D}, _} = date:seconds_to_datetime(Unixtime -
                                                          (Week - Week1) *
                                                              86400),
            {Y, M, D}
    end.

idle(timeout, _State) ->
    data_init(),
    {Time, Status} = time_status_get(),
    logger:debug("空闲阶段结束~w~n",
                 [{Status, Time - date:unixtime()}],
                 auction_mgr,
                 328),
    continue(Status,
             #state{timeout = (Time - date:unixtime()) * 1000,
                    ts = erlang:now(), status = Status});
idle(_, State) -> continue(idle, State).

prepare(timeout, _State) ->
    {Time, Status} = time_status_get(),
    logger:debug("准备阶段结束~w~n",
                 [{Status, Time - date:unixtime()}],
                 auction_mgr,
                 336),
    AuctionList = item_status_do(),
    update_data(AuctionList),
    List = [{Idx, Gold, 0, GoldOnce, OverTime, State}
            || #auction{idx = Idx, gold = Gold,
                        gold_once = GoldOnce, time_auction = OverTime,
                        state = State}
                   <- AuctionList],
    {ok, Msg} = proto_167:pack(srv, 16707, {List}),
    logger:debug("协议 707 ~w~n", [Msg], auction_mgr, 342),
    do_cast(Msg),
    continue(Status,
             #state{timeout = (Time - date:unixtime()) * 1000,
                    ts = erlang:now(), status = Status});
prepare(_, State) -> continue(prepare, State).

auction(timeout, _State) ->
    {Time, Status} = time_status_get(),
    logger:debug("竞拍结束一轮~w~n",
                 [{Status, Time - date:unixtime()}],
                 auction_mgr,
                 351),
    Now = date:unixtime(),
    auction_item_send(Now),
    next_time_deal(Now),
    continue(Status,
             #state{timeout = (Time - date:unixtime()) * 1000,
                    ts = erlang:now(), status = Status});
auction(_, State) -> continue(auction, State).

over(timeout, _State) ->
    {Time, Status} = time_status_get(),
    logger:debug("竞拍结束超时~w~n",
                 [{Status, Time - date:unixtime()}],
                 auction_mgr,
                 362),
    continue(Status,
             #state{timeout = (Time - date:unixtime()) * 1000,
                    ts = erlang:now(), status = Status});
over(_, State) -> continue(auction, State).

continue(StateName,
         State = #state{timeout = infinity}) ->
    {next_state, StateName, State, infinity};
continue(StateName,
         State = #state{ts = Ts, timeout = Timeout}) ->
    logger:debug("继续下一个状态~w~n",
                 [{StateName,
                   date:unixtime(),
                   util:time_left(Timeout, Ts)}],
                 auction_mgr,
                 371),
    {next_state,
     StateName,
     State,
     util:time_left(Timeout, Ts)}.

continue(Reply, StateName,
         State = #state{timeout = infinity}) ->
    {reply, Reply, StateName, State, infinity};
continue(Reply, StateName,
         State = #state{ts = Ts, timeout = Timeout}) ->
    {reply,
     Reply,
     StateName,
     State,
     util:time_left(Timeout, Ts)}.

start_gm(StartTime, EndTime) ->
    Week1 = date:day_of_the_week(StartTime),
    Week2 = date:day_of_the_week(EndTime),
    {_, {H1, M1, S1}} = date:seconds_to_datetime(StartTime +
                                                     5),
    {_, {H2, M2, S2}} = date:seconds_to_datetime(StartTime +
                                                     10),
    {_, {H3, M3, S3}} = date:seconds_to_datetime(EndTime),
    List = [{0, {Week1, H1, M1, S1}},
            {{Week1, H2, M2, S2}, {Week2, H3, M3, S3}}],
    logger:debug("=========~w~n", [List], auction_mgr, 389),
    time_init(List),
    info(start_gm).

time_list() -> ets:tab2list(auction_time).

auction_list() -> ets:tab2list(auction).

auction_get(Idx) ->
    case ets:lookup(auction, Idx) of
        [#auction{} = Auction | _] -> Auction;
        _ -> false
    end.

focus_get(Rid) ->
    List = focus_list_get(Rid),
    Fun = fun (Idx, Acc) ->
                  case ets:lookup(auction, Idx) of
                      [#auction{idx = Idx, item_id = ItemId,
                                item_count = ItemCount, role_id = RoldId,
                                gold = Gold, gold_once = GoldOnce, time = Time,
                                state = State}
                       | _] ->
                          GoldMy = case Rid =:= RoldId of
                                       true -> Gold;
                                       _ -> 0
                                   end,
                          [{Idx,
                            ItemId,
                            ItemCount,
                            Gold,
                            GoldMy,
                            GoldOnce,
                            Time,
                            State}
                           | Acc];
                      _ -> Acc
                  end
          end,
    lists:foldl(Fun, [], List).

focus_list_get(Rid) ->
    case ets:lookup(auction_focus, Rid) of
        [{_, List} | _] -> List;
        _ -> []
    end.

focus_cast(Role, Idx) -> info({focus, Role, Idx}).

leave_cast(Role) -> del_conn(Role).

join_cast(Role) -> set_conn(Role).

mail_send(RoleId, RoleId, _RoleName, _ItemId,
          _GoldOther, _Gold) ->
    ignore;
mail_send(_Id, RoleId, RoleName, ItemId, GoldOther,
          GoldNow) ->
    Title = "竞拍返还",
    Content =
        notice:format(lang:get("亲爱的~ts\n  您对~ts的出价 ~ts被~ts以~ts的价格超越了"),
                      [{role_2, RoleName},
                       {item_2, ItemId},
                       {assets_1, 90002, GoldNow},
                       {role_2, RoleName},
                       {assets_1, 90002, GoldOther}]),
    mail:send(RoleId, Title, Content, [{90002, GoldNow}]).

time_status_get() ->
    Now = date:unixtime(),
    TimeList = time_list(),
    TimeList1 = lists:keysort(1, TimeList),
    time_next(TimeList1, Now).

time_next([{_, {0, Time2}} | Tail], Now) ->
    case Now < Time2 of
        true -> {Time2, idle};
        _ -> time_next(Tail, Now)
    end;
time_next([{_, {Time1, Time2}} | Tail], Now) ->
    case Now < Time1 of
        true -> {Time1, prepare};
        _ ->
            case Now < Time2 of
                true -> {Time2, auction};
                _ -> time_next(Tail, Now)
            end
    end;
time_next([], Now) ->
    NextDiff = date:next_diff(0, 0, 6),
    NextTime = NextDiff + Now,
    {NextTime, over}.

push(#role{link = #link{conn_pid = ConnPid}}, Cmd,
     Data) ->
    sys_conn:pack_send(ConnPid, Cmd, Data).

do_cast(Bin) -> do_cast(get_conn(), Bin).

do_cast([], _Bin) -> ok;
do_cast([{_RoleId, ConnPid} | T], Bin) ->
    logger:debug("广播数据~w~n", [ConnPid], auction_mgr, 495),
    ConnPid ! {send_data, Bin},
    do_cast(T, Bin).

item_status_do() ->
    Week = date:day_of_the_week(date:unixtime()),
    List = auction_list(),
    logger:debug("=======item_status_do========~w~n",
                 [{Week, List}],
                 auction_mgr,
                 503),
    item_status_do(List, Week, []).

item_status_do([Auction = #auction{week = Week} | List],
               Week, Acc) ->
    item_status_do(List,
                   Week,
                   [Auction#auction{state = 2} | Acc]);
item_status_do([_Auction | List], Week, Acc) ->
    item_status_do(List, Week, Acc);
item_status_do([], _Week, Acc) -> Acc.

data_init() ->
    ets:delete_all_objects(auction),
    ets:delete_all_objects(auction_focus),
    put(item_idx, 1),
    data_init2(),
    ok.

data_init2() ->
    WorldLev = 50,
    TimeList = ets:tab2list(auction_time),
    case auction_data:world_lev_data(WorldLev) of
        #{min := Min, max := Max} ->
            data_init2(TimeList, Min, Max);
        _ -> ignore
    end.

data_init2([], _Min, _Max) -> ok;
data_init2([{_Idx, {0, _TimeEnd}} | List], Min, Max) ->
    data_init2(List, Min, Max);
data_init2([{_Idx, {_TimeStart, 0}} | List], Min,
           Max) ->
    data_init2(List, Min, Max);
data_init2([{_Idx, {_TimeStart, TimeEnd}} | List], Min,
           Max) ->
    Week = date:day_of_the_week(TimeEnd),
    WorldLev = 50,
    Count = util:rand(Min, Max),
    ItemIdList = auction_data:list(),
    Fun = fun (Id, Acc) ->
                  case auction_data:item_data(Id) of
                      #{world_lev := WorldLev1, odds := Odds}
                          when WorldLev >= WorldLev1 ->
                          [{Id, Odds} | Acc];
                      _R -> Acc
                  end
          end,
    ItemOddsList = lists:foldl(Fun, [], ItemIdList),
    logger:debug("======_R====~w~n",
                 [ItemOddsList],
                 auction_mgr,
                 554),
    ItemOddsList1 = util:rand_list_n(ItemOddsList,
                                     2,
                                     Count),
    Fun1 = fun ({Id, _Odds}, ListAcc) ->
                   case auction_data:item_data(Id) of
                       #{min := Min1, max := Max1, gold := Gold,
                         gold_once := GoldOnce} ->
                           [#auction{idx = put(item_idx, get(item_idx) + 1),
                                     item_id = Id, gold = Gold,
                                     gold_once = GoldOnce,
                                     item_count = util:rand(Min1, Max1),
                                     state = 1, time = TimeEnd,
                                     time_auction = TimeEnd, week = Week}
                            | ListAcc];
                       _R ->
                           logger:debug("======_R====~w~n",
                                        [_R],
                                        auction_mgr,
                                        561),
                           ListAcc
                   end
           end,
    ItemList = lists:foldl(Fun1, [], ItemOddsList1),
    logger:debug("==========~w~n",
                 [ItemList],
                 auction_mgr,
                 566),
    logger:debug("====item_idx===~w~n",
                 [get(item_idx)],
                 auction_mgr,
                 567),
    update_data(ItemList),
    data_init2(List, Min, Max).

auction_item_send(Now) ->
    Conds = [{'=<', '$2', Now}],
    Ms = [{#auction{state = 2, time_auction = '$2',
                    _ = '_'},
           Conds,
           ['$_']}],
    List = auction_item_send2(ets:select(auction, Ms), []),
    case List of
        [] -> ignore;
        _ ->
            List1 = [{Idx, Gold, 0, GoldOnce, OverTime, State}
                     || #auction{idx = Idx, gold = Gold,
                                 gold_once = GoldOnce, time_auction = OverTime,
                                 state = State}
                            <- List],
            {ok, Msg} = proto_167:pack(srv, 16707, {List1}),
            logger:debug("====协议167====~n", [], auction_mgr, 582),
            do_cast(Msg)
    end.

auction_item_send2([Auction = #auction{item_id = ItemId,
                                       item_count = ItemCount, role_id = RoleId,
                                       role_name = RoleName, gold = Gold}
                    | List],
                   Acc)
    when RoleId =/= {1, "", 0} ->
    Title = lang:get("成功竞拍"),
    Content =
        notice:format(lang:get("亲爱的~ts\n  您以~ts的价格成功的竞拍了！\t"),
                      [{role_2, RoleName}, {assets_1, 90002, Gold}]),
    mail:send(RoleId,
              Title,
              Content,
              [{ItemId, ItemCount}]),
    update_data(Auction#auction{state = 3}),
    auction_item_send2(List,
                       [Auction#auction{state = 3} | Acc]);
auction_item_send2([Auction | List], Acc) ->
    update_data(Auction#auction{state = 3}),
    auction_item_send2(List,
                       [Auction#auction{state = 3} | Acc]);
auction_item_send2([], Acc) -> Acc.

next_time_deal(Now) ->
    WeekNow = date:day_of_the_week(date:unixtime()),
    Ms = [{#auction{state = 2, week = WeekNow,
                    time_auction = '$2', _ = '_'},
           [],
           ['$_']}],
    List = ets:select(auction, Ms),
    case List of
        [_ | _] ->
            [#auction{idx = _Idx, time_auction = TimeAuction} | _] =
                lists:keysort(#auction.time_auction, List),
            case get(auction_ref) of
                undefine -> ignore;
                TRef -> timer:cancel(TRef)
            end,
            MinTime = TimeAuction - Now,
            logger:debug("========================~w~n",
                         [{_Idx, TimeAuction, MinTime, self()}],
                         auction_mgr,
                         609),
            case MinTime > 0 of
                true ->
                    Ref = erlang:send_after(MinTime * 1000, self(), deal),
                    put(auction_ref, Ref);
                _ ->
                    logger:debug("========================~w~n",
                                 [{_Idx, TimeAuction, MinTime}],
                                 auction_mgr,
                                 615)
            end;
        _ ->
            logger:debug("============null============~w~n",
                         [List],
                         auction_mgr,
                         617),
            ok
    end.

set_conn(#role{id = RoleId,
               link = #link{conn_pid = ConnPid}}) ->
    catch ets:insert(auction_conn, {RoleId, ConnPid}).

del_conn(#role{id = RoleId}) ->
    catch ets:delete(auction_conn, RoleId).

get_conn() -> ets:tab2list(auction_conn).

update_id(Key, Id) ->
    case get(Key) of
        undefined -> put(Key, max(1, Id));
        ID -> put(Key, max(ID, Id))
    end.

update_data(Data) ->
    update_ets(auction, Data),
    update_dets(auction, Data).

update_data(Table, Data) ->
    update_ets(Table, Data),
    update_dets(Table, Data).

update_ets(Table, Data) -> ets:insert(Table, Data).

update_dets(Table, Data) -> dets:insert(Table, Data).

