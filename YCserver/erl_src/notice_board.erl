-file("src/mod/notice/notice_board.erl", 1).

-module(notice_board).

-behaviour(gen_server).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([start_link/0,
         reload/0,
         reload_board/0,
         reload_scroll/0,
         get_notice_board/1,
         get_filter_notice_board/1,
         read_notice_board/4,
         async_read_notice_board/2,
         push_mail/2]).

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

-file("src/mod/notice/notice_board.erl", 25).

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

-file("src/mod/notice/notice_board.erl", 26).

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

-file("src/mod/notice/notice_board.erl", 27).

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

-file("src/mod/notice/notice_board.erl", 28).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/notice/notice_board.erl", 29).

-file("inc/query.hrl", 1).

-record(name_index,
        {name = "" :: list(),
         id = 0 :: non_neg_integer(),
         acc = "" :: list(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid()}).

-record(id_index,
        {id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         acc = "" :: list(),
         name = "" :: list(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid()}).

-record(acc_index,
        {acc = {"", "", 0} ::
             {list(), list(), non_neg_integer()},
         id = 0 :: non_neg_integer(),
         name = "" :: list(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid()}).

-file("src/mod/notice/notice_board.erl", 30).

-file("inc/condition.hrl", 1).

-record(condition,
        {label :: undefined | atom(),
         op = eq ::
             ue | eq | lt | gt | le | ge | range | include,
         val :: undefined | term(),
         msg = "" :: list()}).

-file("src/mod/notice/notice_board.erl", 31).

-file("inc/log.hrl", 1).

-file("src/mod/notice/notice_board.erl", 32).

-record(state,
        {top_roll_time = 20,
         top = [],
         left_roll_time = 20,
         left = [],
         boards = [],
         future_boards = []}).

-spec start_link() -> {ok, pid()} |
                      ignore |
                      {error, term()}.

start_link() ->
    gen_server:start_link({local, notice_board},
                          notice_board,
                          [],
                          []).

reload() ->
    notice_board ! reload,
    ok.

reload_board() ->
    notice_board ! load_notice_board,
    ok.

reload_scroll() ->
    notice_board ! load_notice_scroll,
    ok.

get_notice_board(Pid) ->
    notice_board ! {get_notice_board, Pid},
    ok.

get_filter_notice_board(Pid) ->
    notice_board ! {get_filter_notice_board, Pid},
    ok.

read_notice_board(RoleId, RolePid, RoleLev, BoardId) ->
    gen_server:cast(notice_board,
                    {read_notice_board, RoleId, RolePid, RoleLev, BoardId}).

get_notice_board_fail(RoleId, BoardId) ->
    gen_server:cast(notice_board,
                    {fail_get_notice_board, RoleId, BoardId}).

push_mail(#role{pid = Pid}, _Type) ->
    notice_board ! {get_mail, Pid},
    ok.

init([]) ->
    logger:info("[~w] 正在启动...",
                [notice_board],
                notice_board,
                97),
    process_flag(trap_exit, true),
    dets:open_file(notice_board_log,
                   [{file, "./dets/notice_board_log.dets"},
                    {keypos, #notice_board.id},
                    {type, set}]),
    ets:new(ets_notice_board_log,
            [set,
             named_table,
             public,
             {keypos, #notice_board_log.id}]),
    dets:to_ets(notice_board_log, ets_notice_board_log),
    ets:new(notice_scroll,
            [set,
             named_table,
             public,
             {keypos, #notice_scroll.id}]),
    State = #state{},
    put(scroll_timer, []),
    put(open_timer2, []),
    self() ! reload,
    self() ! top_roll,
    self() ! left_roll,
    self() ! load_notice_board,
    self() ! load_notice_scroll,
    erlang:send_after(date:next_diff(0, 0, 0) * 1000,
                      self(),
                      day_tick),
    logger:info("[~w] 启动完成",
                [notice_board],
                notice_board,
                112),
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({read_notice_board,
             RoleId,
             RolePid,
             RoleLev,
             BoardId},
            State = #state{boards = Boards}) ->
    case find_log(BoardId, RoleId) of
        error -> {noreply, State};
        {true, _} -> {noreply, State};
        {false,
         NoticeLog = #notice_board_log{log_list = OldLogList}} ->
            Now = date:unixtime(),
            case lists:keyfind(BoardId, #notice_board.id, Boards) of
                Notice = #notice_board{end_time = Time,
                                       condition = Cond}
                    when Time >= Now ->
                    case check_cond(RoleLev, Cond) of
                        {false, Reason} ->
                            role:pack_send(RolePid, 9923, {0, Reason, BoardId}),
                            {noreply, State};
                        true ->
                            role:apply(async,
                                       RolePid,
                                       {notice_board,
                                        async_read_notice_board,
                                        [Notice]}),
                            NewNoticeLog = NoticeLog#notice_board_log{log_list =
                                                                          [RoleId
                                                                           | OldLogList]},
                            insert_board_log(NewNoticeLog),
                            {noreply, State};
                        _ -> {noreply, State}
                    end;
                _ -> {noreply, State}
            end
    end;
handle_cast({fail_get_notice_board, RoleId, BoardId},
            State) ->
    case find_log(BoardId, RoleId) of
        error -> {noreply, State};
        {false, _} -> {noreply, State};
        {true,
         NoticeLog = #notice_board_log{log_list = OldLogList}} ->
            NewNoticeLog = NoticeLog#notice_board_log{log_list =
                                                          OldLogList --
                                                              [RoleId]},
            insert_board_log(NewNoticeLog),
            {noreply, State}
    end;
handle_cast(_Msg, State) -> {noreply, State}.

handle_info({get_notice_board, Pid},
            State = #state{boards = Boards}) ->
    role:apply(async,
               Pid,
               {fun async_broadcast_notice_board/2, [Boards]}),
    {noreply, State};
handle_info({get_filter_notice_board, Pid},
            State = #state{boards = Boards}) ->
    Log = ets:tab2list(ets_notice_board_log),
    role:apply(async,
               Pid,
               {fun async_broadcast_notice_board/4,
                [Boards, Log, check_log]}),
    {noreply, State};
handle_info({get_mail, Pid},
            State = #state{boards = Boards}) ->
    Log = ets:tab2list(ets_notice_board_log),
    role:apply(async,
               Pid,
               {fun async_broadcast_mail_board/4,
                [Boards, Log, check_log]}),
    {noreply, State};
handle_info(load_notice_board, State) ->
    clean_expire_timer(),
    clean_open_timer(),
    Boards = notice_db:load_boards(),
    Now = date:unixtime(),
    {FutureBoards, NowBoards} = lists:partition(fun
                                                    (#notice_board{start_time =
                                                                       StartTime}) ->
                                                        StartTime > Now
                                                end,
                                                Boards),
    OrderBoards =
        lists:reverse(lists:keysort(#notice_board.id,
                                    NowBoards)),
    set_expire_timer(NowBoards),
    set_open_timer(FutureBoards),
    OldLog = ets:tab2list(ets_notice_board_log),
    del_board_log(),
    NewLog = load_board_log(Boards, OldLog),
    broadcast_notice_board(OrderBoards, NewLog),
    {noreply,
     State#state{boards = NowBoards,
                 future_boards = FutureBoards}};
handle_info(load_notice_scroll, State) ->
    Scroll = notice_db:load_scroll(),
    Now = date:unixtime(),
    clean_scroll_timer(),
    ets:delete_all_objects(notice_scroll),
    [ets:insert(notice_scroll, I) || I <- Scroll],
    {FutureScroll, NowScroll} = lists:partition(fun
                                                    (#notice_scroll{start_time =
                                                                        StartTime}) ->
                                                        StartTime > Now
                                                end,
                                                Scroll),
    set_scroll_timer(NowScroll),
    set_open_timer2(FutureScroll),
    {noreply, State};
handle_info({open_board, Id},
            State = #state{boards = Boards,
                           future_boards = FutureBoards}) ->
    case lists:keyfind(Id, #notice_board.id, FutureBoards)
        of
        Notice = #notice_board{end_time = EndTime} ->
            Now = date:unixtime(),
            case EndTime =< Now of
                true -> {noreply, State};
                false ->
                    case util:send_after((EndTime - Now) * 1000,
                                         self(),
                                         {close_board, Id})
                        of
                        false -> ok;
                        Ref -> add_expire_timer(Id, Ref)
                    end,
                    NewBoards =
                        lists:reverse(lists:keysort(#notice_board.id,
                                                    [Notice | Boards])),
                    broadcast_add_board(Notice),
                    Log = ets:tab2list(ets_notice_board_log),
                    List = ets:tab2list(role_id_index),
                    lists:foreach(fun (#id_index{pid = Pid}) ->
                                          role:apply(async,
                                                     Pid,
                                                     {fun async_broadcast_mail_board/4,
                                                      [NewBoards,
                                                       Log,
                                                       check_log]})
                                  end,
                                  List),
                    {noreply,
                     State#state{boards = NewBoards,
                                 future_boards =
                                     lists:keydelete(Id,
                                                     #notice_board.id,
                                                     FutureBoards)}}
            end;
        _ -> {noreply, State}
    end;
handle_info({open_scroll, Id}, State) ->
    OpenTimer2 = get(open_timer2),
    NewOpenTimer2 = lists:keydelete(Id, 1, OpenTimer2),
    put(open_timer2, NewOpenTimer2),
    case ets:lookup(notice_scroll, Id) of
        [#notice_scroll{start_time = StartTime, type = Type,
                        interval_time = IntervalTime, end_time = EndTime,
                        content = Content}] ->
            ScrollTimer = get(scroll_timer),
            Now = date:unixtime(),
            NextTime = scroll_next(Now, StartTime, IntervalTime, 0),
            Ref = case NextTime >= EndTime of
                      true ->
                          util:send_after((EndTime - Now) * 1000,
                                          self(),
                                          {close_scroll, Id});
                      _ ->
                          util:send_after((NextTime - Now) * 1000,
                                          self(),
                                          {next_scroll, Id})
                  end,
            case Ref of
                false -> ok;
                _ ->
                    logger:debug("滚动广播开始：~ts",
                                 [Content],
                                 notice_board,
                                 261),
                    notice:cast(all, Type, Content),
                    NewScrollTimer = lists:keystore(Id,
                                                    1,
                                                    ScrollTimer,
                                                    {Id, Ref}),
                    put(scroll_timer, NewScrollTimer)
            end;
        _ -> ignore
    end,
    {noreply, State};
handle_info({close_scroll, Id}, State) ->
    ScrollTimer = get(scroll_timer),
    NewScrollTimer = lists:keydelete(Id, 1, ScrollTimer),
    put(scroll_timer, NewScrollTimer),
    ets:delete(notice_scroll, Id),
    logger:debug("滚动广播结束：~w", [Id], notice_board, 277),
    {noreply, State};
handle_info({next_scroll, Id}, State) ->
    case ets:lookup(notice_scroll, Id) of
        [#notice_scroll{start_time = StartTime, type = Type,
                        interval_time = IntervalTime, end_time = EndTime,
                        content = Content}] ->
            ScrollTimer = get(scroll_timer),
            Now = date:unixtime(),
            NextTime = scroll_next(Now, StartTime, IntervalTime, 0),
            Ref = case NextTime >= EndTime of
                      true ->
                          util:send_after((EndTime - Now) * 1000,
                                          self(),
                                          {close_scroll, Id});
                      _ ->
                          util:send_after((NextTime - Now) * 1000,
                                          self(),
                                          {next_scroll, Id})
                  end,
            case Ref of
                false -> ok;
                _ ->
                    logger:debug("滚动广播：~ts", [Content], notice_board, 298),
                    notice:cast(all, Type, Content),
                    NewScrollTimer = lists:keystore(Id,
                                                    1,
                                                    ScrollTimer,
                                                    {Id, Ref}),
                    put(scroll_timer, NewScrollTimer)
            end;
        _ ->
            ScrollTimer = get(scroll_timer),
            NewScrollTimer = lists:keydelete(Id, 1, ScrollTimer),
            put(scroll_timer, NewScrollTimer)
    end,
    {noreply, State};
handle_info({close_board, Id},
            State = #state{boards = Boards}) ->
    NewBoards = lists:keydelete(Id,
                                #notice_board.id,
                                Boards),
    del_expire_timer(Id),
    del_board_log(Id),
    role_group:pack_send(world, 9922, {Id}),
    {noreply, State#state{boards = NewBoards}};
handle_info(day_tick, State) ->
    erlang:send_after(86400 * 1000, self(), day_tick),
    self() ! reload,
    self() ! load_notice_scroll,
    {noreply, State};
handle_info(reload,
            #state{boards = Boards,
                   future_boards = FutureBoards}) ->
    NewState = load_db(),
    {noreply,
     NewState#state{boards = Boards,
                    future_boards = FutureBoards}};
handle_info(left_roll,
            State = #state{left_roll_time = LeftRollTime,
                           left = Left}) ->
    util:send_after(LeftRollTime * 1000, self(), left_roll),
    case broadcast(Left) of
        false -> {noreply, State};
        {false, NewLeft} ->
            {noreply, State#state{left = NewLeft}};
        {Msg, NewLeft} ->
            notice:cast(all, 8, Msg),
            {noreply, State#state{left = NewLeft}}
    end;
handle_info(top_roll,
            State = #state{top_roll_time = TopRollTime,
                           top = Top}) ->
    util:send_after(TopRollTime * 1000, self(), top_roll),
    case broadcast(Top) of
        false -> {noreply, State};
        {false, NewTop} -> {noreply, State#state{top = NewTop}};
        {Msg, NewTop} ->
            notice:cast(all, 8, Msg),
            {noreply, State#state{top = NewTop}}
    end;
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...",
                [notice_board],
                notice_board,
                362),
    logger:info("[~w] 关闭完成",
                [notice_board],
                notice_board,
                363),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

async_read_notice_board(#role{link =
                                  #link{conn_pid = ConnPid}},
                        #notice_board{id = Id, gain = []}) ->
    sys_conn:pack_send(ConnPid, 9923, {1, "", Id}),
    ok;
async_read_notice_board(Role = #role{id = RoleId,
                                     link = #link{conn_pid = ConnPid}},
                        #notice_board{id = Id, title = Title, gain = Gain}) ->
    Gains = format:val_to_gain(Gain),
    case role_gain:do_notice(Gains, Role, lang:get("公告领取"))
        of
        {ok, NewRole} ->
            LogMsg = util:fbin("Id:~w ~ts", [Id, Title]),
            log:drop(reward, NewRole, Gains, "领取通知", LogMsg),
            log:assets([gold, coin, gold_bind],
                       Role,
                       NewRole,
                       "领取通知",
                       LogMsg),
            case both of
                both ->
                    case catch log_old:assets([gold, coin, gold_bind],
                                              Role,
                                              NewRole,
                                              "领取通知",
                                              LogMsg)
                        of
                        _Err = {'EXIT', _} ->
                            logger:error("日志记录时出错:~w",
                                         [_Err],
                                         notice_board,
                                         387),
                            ok;
                        _ -> ok
                    end;
                _ -> skip
            end,
            sys_conn:pack_send(ConnPid, 9923, {1, "", Id}),
            {ok, NewRole};
        {false, #gain{reason = bag_full}} ->
            sys_conn:pack_send(ConnPid,
                               9923,
                               {0, lang:get("背包已满,请整理背包再来领取"), Id}),
            get_notice_board_fail(RoleId, Id),
            ok;
        {false, #gain{reason = error_item}} ->
            logger:error("错误的公告道具,无法领取:~w",
                         [Gain],
                         notice_board,
                         396),
            sys_conn:pack_send(ConnPid,
                               9923,
                               {0, lang:get("错误的数据"), Id}),
            get_notice_board_fail(RoleId, Id),
            ok;
        _Err ->
            logger:error("未知的公告领取错误:~w", [_Err], notice_board, 401),
            ok
    end.

check_cond(_RoleLev, []) -> true;
check_cond(RoleLev, [{lev, Lev} | T]) ->
    case RoleLev >= Lev of
        false ->
            {false, util:fbin(lang:get("角色等级不足~w级,无法领取附件"), [Lev])};
        true -> check_cond(RoleLev, T)
    end.

find_log(BoardId, RoleId) ->
    case ets:lookup(ets_notice_board_log, BoardId) of
        [] -> {false, #notice_board_log{id = BoardId}};
        [NoticeLog = #notice_board_log{log_list = LogList}] ->
            case lists:member(RoleId, LogList) of
                false -> {false, NoticeLog};
                true -> {true, NoticeLog}
            end;
        _ -> error
    end.

del_board_log() ->
    ets:delete_all_objects(ets_notice_board_log),
    dets:delete_all_objects(notice_board_log).

del_board_log(Id) ->
    ets:delete(ets_notice_board_log, Id),
    dets:delete(notice_board_log, Id).

insert_board_log(Log) ->
    ets:insert(ets_notice_board_log, Log),
    dets:insert(notice_board_log, Log).

broadcast_add_board(Notice) ->
    List = ets:tab2list(role_id_index),
    lists:foreach(fun (#id_index{pid = Pid}) ->
                          role:apply(async,
                                     Pid,
                                     {fun async_broadcast_add_board/2,
                                      [Notice]})
                  end,
                  List).

async_broadcast_add_board(#role{link =
                                    #link{conn_pid = ConnPid}},
                          Notice) ->
    sys_conn:pack_send(ConnPid, 9921, Notice),
    ok.

broadcast_notice_board(Boards, Log) ->
    List = ets:tab2list(role_id_index),
    lists:foreach(fun (#id_index{pid = Pid}) ->
                          role:apply(async,
                                     Pid,
                                     {fun async_broadcast_notice_board/4,
                                      [Boards, Log, check_log]})
                  end,
                  List),
    lists:foreach(fun (#id_index{pid = Pid}) ->
                          role:apply(async,
                                     Pid,
                                     {fun async_broadcast_mail_board/4,
                                      [Boards, Log, check_log]})
                  end,
                  List).

async_broadcast_notice_board(#role{link =
                                       #link{conn_pid = ConnPid}},
                             Boards) ->
    case Boards of
        [] -> ok;
        _ -> sys_conn:pack_send(ConnPid, 9924, {Boards})
    end,
    ok.

async_broadcast_notice_board(Role = #role{link =
                                              #link{conn_pid = ConnPid}},
                             Boards, Log, check_log) ->
    RealBoard = check_broad_log(Boards, Log, Role),
    case RealBoard of
        [] -> sys_conn:pack_send(ConnPid, 9920, {[]});
        _ -> sys_conn:pack_send(ConnPid, 9920, {RealBoard})
    end,
    ok.

async_broadcast_mail_board(Role = #role{link =
                                            #link{conn_pid = ConnPid}},
                           TBoards, Log, check_log) ->
    Boards = [I
              || I = #notice_board{type = Type} <- TBoards,
                 Type =/= 1 andalso check_recive(Role, I) == true],
    RealBoard = check_broad_log(Boards, Log, Role),
    case RealBoard of
        [] -> sys_conn:pack_send(ConnPid, 9934, {[], Boards});
        _ ->
            sys_conn:pack_send(ConnPid, 9934, {RealBoard, Boards})
    end,
    ok.

check_recive(#role{lev = RoleLev},
             #notice_board{condition = Cond}) ->
    check_cond(RoleLev, Cond).

check_broad_log(Boards, Log, Role) ->
    check_broad_log(Boards, Log, Role, []).

check_broad_log([], _Log, _Role, RealBoard) ->
    lists:reverse(RealBoard);
check_broad_log([B = #notice_board{id = Id} | T], Log,
                Role = #role{id = RoleId}, RealBoard) ->
    case check_recive(Role, B) of
        {false, _} -> check_broad_log(T, Log, Role, RealBoard);
        true ->
            case lists:keyfind(Id, #notice_board_log.id, Log) of
                false -> check_broad_log(T, Log, Role, [B | RealBoard]);
                #notice_board_log{log_list = LogList} ->
                    case lists:member(RoleId, LogList) of
                        true -> check_broad_log(T, Log, Role, RealBoard);
                        false -> check_broad_log(T, Log, Role, [B | RealBoard])
                    end
            end
    end.

load_board_log(Boards, Log) ->
    load_board_log(Boards, Log, []).

load_board_log([], _Log, NewLog) -> NewLog;
load_board_log([#notice_board{id = Id} | T], Log,
               NewLog) ->
    case lists:keyfind(Id, #notice_board_log.id, Log) of
        L = #notice_board_log{id = Id} ->
            insert_board_log(L),
            load_board_log(T, Log, [L | NewLog]);
        _ -> load_board_log(T, Log, NewLog)
    end.

set_open_timer(Timer) ->
    Now = date:unixtime(),
    set_open_timer(Now, Timer, []).

set_open_timer(_Now, [], Refs) ->
    put(open_timer, Refs),
    ok;
set_open_timer(Now,
               [#notice_board{id = Id, start_time = StartTime} | T],
               Refs)
    when StartTime > Now ->
    case util:send_after((StartTime - Now) * 1000,
                         self(),
                         {open_board, Id})
        of
        false -> ok;
        Ref -> set_open_timer(Now, T, [{Id, Ref} | Refs])
    end;
set_open_timer(Now, [#notice_board{id = Id} | T],
               Refs) ->
    logger:error("开启时间设置错误的后台公告:~w",
                 [Id],
                 notice_board,
                 539),
    set_open_timer(Now, T, Refs).

set_open_timer2(Timer) ->
    Now = date:unixtime(),
    set_open_timer2(Now, Timer, []).

set_open_timer2(_Now, [], Refs) ->
    put(open_timer2, Refs),
    ok;
set_open_timer2(Now,
                [#notice_scroll{id = Id, start_time = StartTime} | T],
                Refs)
    when StartTime > Now ->
    case util:send_after((StartTime - Now) * 1000,
                         self(),
                         {open_scroll, Id})
        of
        false -> ok;
        Ref -> set_open_timer2(Now, T, [{Id, Ref} | Refs])
    end;
set_open_timer2(Now, [#notice_scroll{id = Id} | T],
                Refs) ->
    logger:error("开启时间设置错误的后台公告:~w",
                 [Id],
                 notice_board,
                 557),
    set_open_timer2(Now, T, Refs).

set_expire_timer(Timer) ->
    Now = date:unixtime(),
    set_expire_timer(Now, Timer, []).

set_expire_timer(_Now, [], Refs) ->
    put(expire_timer, Refs),
    ok;
set_expire_timer(Now,
                 [#notice_board{id = Id, end_time = EndTime} | T], Refs)
    when EndTime > Now ->
    case util:send_after((EndTime - Now) * 1000,
                         self(),
                         {close_board, Id})
        of
        false -> ok;
        Ref -> set_expire_timer(Now, T, [{Id, Ref} | Refs])
    end;
set_expire_timer(Now, [#notice_board{id = Id} | T],
                 Refs) ->
    logger:error("过期时间设置错误的后台公告:~w",
                 [Id],
                 notice_board,
                 576),
    set_expire_timer(Now, T, Refs).

set_scroll_timer(Timer) ->
    Now = date:unixtime(),
    RefList = get(scroll_timer),
    set_scroll_timer(Now, Timer, RefList).

set_scroll_timer(_Now, [], Refs) ->
    put(scroll_timer, Refs);
set_scroll_timer(Now,
                 [#notice_scroll{id = Id, start_time = StartTime,
                                 interval_time = IntervalTime,
                                 end_time = EndTime}
                  | T],
                 Refs) ->
    case lists:keyfind(Id, 1, Refs) of
        false when Now >= EndTime ->
            set_scroll_timer(Now, T, Refs);
        false when Now >= StartTime ->
            NextTime = scroll_next(Now, StartTime, IntervalTime, 0),
            Ref = case NextTime >= EndTime of
                      true ->
                          util:send_after((EndTime - Now) * 1000,
                                          self(),
                                          {close_scroll, Id});
                      _ ->
                          util:send_after((NextTime - Now) * 1000,
                                          self(),
                                          {next_scroll, Id})
                  end,
            case Ref of
                false -> ok;
                _ -> set_scroll_timer(Now, T, [{Id, Ref} | Refs])
            end;
        _ -> set_scroll_timer(Now, T, Refs)
    end.

scroll_next(Now, StartTime, IntervalTime, Num)
    when StartTime + Num * IntervalTime > Now ->
    StartTime + Num * IntervalTime;
scroll_next(Now, StartTime, IntervalTime, Num) ->
    scroll_next(Now, StartTime, IntervalTime, Num + 1).

clean_expire_timer() ->
    List = case get(expire_timer) of
               L when is_list(L) -> L;
               undefined -> []
           end,
    clean_expire_timer(List).

clean_expire_timer([]) -> ok;
clean_expire_timer([{_Id, Ref} | T]) ->
    case is_reference(Ref) of
        true -> erlang:cancel_timer(Ref);
        false -> skip
    end,
    clean_expire_timer(T).

clean_scroll_timer() ->
    List = case get(scroll_timer) of
               L when is_list(L) -> L;
               undefined -> []
           end,
    List2 = case get(open_timer2) of
                L2 when is_list(L2) -> L2;
                _ -> []
            end,
    clean_scroll_timer(List ++ List2),
    put(scroll_timer, []),
    put(open_timer2, []).

clean_scroll_timer([]) -> ok;
clean_scroll_timer([{_Id, Ref} | T]) ->
    case is_reference(Ref) of
        true -> erlang:cancel_timer(Ref);
        false -> skip
    end,
    clean_scroll_timer(T).

clean_open_timer() ->
    List = case get(open_timer) of
               L when is_list(L) -> L;
               undefined -> []
           end,
    clean_open_timer(List).

clean_open_timer([]) -> ok;
clean_open_timer([{_Id, Ref} | T]) ->
    case is_reference(Ref) of
        true -> erlang:cancel_timer(Ref);
        false -> skip
    end,
    clean_open_timer(T).

del_expire_timer(Id) ->
    List = case get(expire_timer) of
               L when is_list(L) -> L;
               _ -> []
           end,
    put(expire_timer, lists:keydelete(Id, 1, List)).

add_expire_timer(Id, Ref) ->
    List = case get(expire_timer) of
               L when is_list(L) -> L;
               _ -> []
           end,
    case lists:keyfind(Id, 1, List) of
        false -> put(expire_timer, [{Id, Ref} | List]);
        _ ->
            put(expire_timer,
                lists:keyreplace(Id, 1, List, {Id, Ref}))
    end.

broadcast([]) -> false;
broadcast(Notice) -> broadcast(Notice, []).

broadcast([], NewNotice) -> {false, NewNotice};
broadcast([H = #notice{start_time = Start,
                       end_time = End, msg = Msg}
           | T],
          NewNotice) ->
    Now = date:unixtime(),
    case Now >= Start of
        false -> broadcast(T, NewNotice ++ [H]);
        true ->
            case Now < End orelse End =:= 0 of
                true -> {Msg, T ++ NewNotice ++ [H]};
                false -> broadcast(T, NewNotice)
            end
    end.

load_db() ->
    Flag = check_open_flag(),
    Sql = "select nid, pos, timing, start_time, "
          "end_time, msg, start_flag from sys_notice "
          "where ((start_flag <= ? and end_flag "
          ">= ?) or start_flag = 0) and able = "
          "1",
    case db:get_all(Sql, [Flag, Flag]) of
        {ok, Notice} -> convert(Notice);
        _Err -> #state{}
    end.

check_open_flag() ->
    OpenTime = env:srv_open_time(),
    Now = date:unixtime(),
    date:day_diff(OpenTime, Now) + 1.

convert(Notice) -> convert(Notice, #state{}).

convert([], State = #state{top = Top, left = Left}) ->
    State#state{top = lists:keysort(#notice.id, Top),
                left = lists:keysort(#notice.id, Left)};
convert([[Id, 7, Time, Start, End, Msg, StartFlag] | T],
        State = #state{top_roll_time = TopRollTime, top = Top})
    when StartFlag =:= 0 ->
    case date:unixtime() < End orelse End =:= 0 of
        true ->
            Notice = #notice{id = Id, pos = 8, start_time = Start,
                             end_time = End, msg = Msg},
            convert(T,
                    State#state{top_roll_time = max(Time, TopRollTime),
                                top = [Notice | Top]});
        false -> convert(T, State)
    end;
convert([[Id, 7, Time, _Start, _End, Msg, _StartFlag]
         | T],
        State = #state{top_roll_time = TopRollTime,
                       top = Top}) ->
    Notice = #notice{id = Id, pos = 8, msg = Msg},
    convert(T,
            State#state{top_roll_time = max(Time, TopRollTime),
                        top = [Notice | Top]});
convert([[Id, 8, Time, Start, End, Msg, StartFlag] | T],
        State = #state{left_roll_time = LeftRollTime,
                       left = Left})
    when StartFlag =:= 0 ->
    case date:unixtime() < End orelse End =:= 0 of
        true ->
            Notice = #notice{id = Id, pos = 8, start_time = Start,
                             end_time = End, msg = Msg},
            convert(T,
                    State#state{left_roll_time = max(Time, LeftRollTime),
                                left = [Notice | Left]});
        false -> convert(T, State)
    end;
convert([[Id, 8, Time, _Start, _End, Msg, _StartFlag]
         | T],
        State = #state{left_roll_time = LeftRollTime,
                       left = Left}) ->
    Notice = #notice{id = Id, pos = 8, msg = Msg},
    convert(T,
            State#state{left_roll_time = max(Time, LeftRollTime),
                        left = [Notice | Left]});
convert([[Id,
          _Pos,
          _Time,
          _Start,
          _End,
          Msg,
          _StartFlag]
         | T],
        State) ->
    logger:error("错误的公告类型:~w, ~w",
                 [Id, Msg],
                 notice_board,
                 747),
    convert(T, State).

