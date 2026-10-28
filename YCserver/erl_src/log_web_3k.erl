-file("src/log/log_web_3k.erl", 1).

-module(log_web_3k).

-behaviour(gen_server).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([start_link/0]).

-export([post/2]).

-record(state, {chat_buff = [], time_ref = undeine}).

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

-file("src/log/log_web_3k.erl", 26).

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

-file("src/log/log_web_3k.erl", 27).

post(chat, Data = #{}) ->
    gen_server:cast(log_web_3k, {cast, post_chat, Data});
post(report, Data = #{}) ->
    gen_server:cast(log_web_3k, {cast, post_report, Data});
post(_, _) -> ok.

-spec start_link() -> {ok, pid()} |
                      ignore |
                      {error, term()}.

start_link() ->
    gen_server:start_link({local, log_web_3k},
                          log_web_3k,
                          [],
                          []).

init([]) ->
    logger:info("[~w] 正在启动...",
                [log_web_3k],
                log_web_3k,
                60),
    process_flag(trap_exit, true),
    application:start(asn1),
    application:start(crypto),
    application:start(public_key),
    application:start(ssl),
    logger:info("[~w] 启动完成...",
                [log_web_3k],
                log_web_3k,
                66),
    TimeRef = erlang:send_after(60000,
                                self(),
                                {info, post, []}),
    {ok, #state{time_ref = TimeRef}}.

handle_call({call, Msg, Args}, _From, State) ->
    case catch do_handle_call(State, Msg, Args) of
        {ok, Reply} -> {reply, Reply, State};
        {ok, Reply, NewState} -> {reply, Reply, NewState};
        {false, Reason} ->
            logger:error("[~w]进程处理同步消息时失败:~w, ~w, ~w",
                         [log_web_3k, Msg, Args, Reason],
                         log_web_3k,
                         77),
            {noreply, State};
        Else ->
            logger:error("[~w]进程处理同步消息时失败:~w, ~w, ~w",
                         [log_web_3k, Msg, Args, Else],
                         log_web_3k,
                         80),
            {noreply, State}
    end;
handle_call(_Request, _From, State) ->
    logger:error("未知的[~w]同步消息:~w",
                 [log_web_3k, _Request],
                 log_web_3k,
                 85),
    {noreply, State}.

handle_cast({cast, Msg, Args}, State) ->
    case catch do_handle_cast(State, Msg, Args) of
        ok -> {noreply, State};
        {ok, NewState} -> {noreply, NewState};
        {stop, NewState} -> {stop, normal, NewState};
        {false, Reason} ->
            logger:error("[~w]进程处理异步消息时失败:~w, ~w, ~w",
                         [log_web_3k, Msg, Args, Reason],
                         log_web_3k,
                         98),
            {noreply, State};
        Else ->
            logger:error("[~w]进程处理异步消息时失败:~w, ~w, ~w",
                         [log_web_3k, Msg, Args, Else],
                         log_web_3k,
                         101),
            {noreply, State}
    end;
handle_cast(_Msg, State) ->
    logger:error("未知的[~w]异步消息:~w",
                 [log_web_3k, _Msg],
                 log_web_3k,
                 107),
    {noreply, State}.

handle_info({info, Msg, Args}, State) ->
    case catch do_handle_info(State, Msg, Args) of
        ok -> {noreply, State};
        {ok, NewState} -> {noreply, NewState};
        {false, Reason} ->
            logger:error("[~w]进程处理消息时失败:~w, ~w, ~w",
                         [log_web_3k, Msg, Args, Reason],
                         log_web_3k,
                         118),
            {noreply, State};
        Else ->
            logger:error("[~w]进程处理消息时失败:~w, ~w, ~w",
                         [log_web_3k, Msg, Args, Else],
                         log_web_3k,
                         121),
            {noreply, State}
    end;
handle_info(_Info, State) ->
    logger:error("未知的[~w]INFO消息:~w",
                 [log_web_3k, _Info],
                 log_web_3k,
                 135),
    {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...",
                [log_web_3k],
                log_web_3k,
                139),
    logger:info("[~w] 关闭完成", [log_web_3k], log_web_3k, 140),
    {stop, #state{}}.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_handle_call(_State, request,
               {Method, Request, HTTPOptions, Options}) ->
    case httpc:request(Method,
                       Request,
                       HTTPOptions,
                       Options)
        of
        {ok, Result} ->
            logger:debug("http请求成功:~w, 请求方式:~w, 请求信息:~w, http参数:~w, "
                         "传递参数:~w ",
                         [Result, Method, Request, HTTPOptions, Options],
                         log_web_3k,
                         158),
            {ok, Result};
        {error, Reason} ->
            logger:error("http请求失败:~w, 请求方式:~w, 请求信息:~w, http参数:~w, "
                         "传递参数:~w ",
                         [Reason, Method, Request, HTTPOptions, Options],
                         log_web_3k,
                         161),
            {false, Reason};
        Err ->
            logger:error("http请求失败:~w, 请求方式:~w, 请求信息:~w, http参数:~w, "
                         "传递参数:~w ",
                         [Err, Method, Request, HTTPOptions, Options],
                         log_web_3k,
                         164),
            Err
    end;
do_handle_call(_State, Msg, Args) ->
    logger:error("未知的call消息:~w, ~w",
                 [Msg, Args],
                 log_web_3k,
                 168),
    ok.

do_handle_cast(_State, request,
               {Method, Request, HTTPOptions, Options}) ->
    case httpc:request(Method,
                       Request,
                       HTTPOptions,
                       Options)
        of
        {ok, Result} ->
            logger:debug("http请求成功:~w, 请求方式:~w, 请求信息:~w, http参数:~w, "
                         "传递参数:~w ",
                         [Result, Method, Request, HTTPOptions, Options],
                         log_web_3k,
                         177),
            {ok, Result};
        {error, Reason} ->
            logger:error("http请求失败:~w, 请求方式:~w, 请求信息:~w, http参数:~w, "
                         "传递参数:~w ",
                         [Reason, Method, Request, HTTPOptions, Options],
                         log_web_3k,
                         180),
            {false, Reason};
        Err ->
            logger:error("http请求失败:~w, 请求方式:~w, 请求信息:~w, http参数:~w, "
                         "传递参数:~w ",
                         [Err, Method, Request, HTTPOptions, Options],
                         log_web_3k,
                         183),
            Err
    end;
do_handle_cast(State = #state{chat_buff = ChatBuff,
                              time_ref = TimeRef},
               post_chat, Data) ->
    NChatBuff = case catch json:encode({struct,
                                        maps:to_list(Data)})
                    of
                    JsonStr when is_list(JsonStr) ->
                        logger:debug("消息推送参数 ~ts", [JsonStr], log_web_3k, 191),
                        [JsonStr | ChatBuff];
                    _ERR ->
                        logger:error("转换出错 ~w", [_ERR], log_web_3k, 194),
                        ChatBuff
                end,
    NState = case length(NChatBuff) of
                 Len when Len < 20 -> State#state{chat_buff = NChatBuff};
                 _ ->
                     case is_reference(TimeRef) of
                         true -> erlang:cancel_timer(TimeRef);
                         _ -> ok
                     end,
                     NTimeRef = erlang:send_after(60000,
                                                  self(),
                                                  {info, post, []}),
                     web_push(1, NChatBuff),
                     #state{time_ref = NTimeRef}
             end,
    {ok, NState};
do_handle_cast(_State, post_report, Data) ->
    case catch json:encode({struct, maps:to_list(Data)}) of
        JsonStr when is_list(JsonStr) ->
            logger:debug("消息推送参数 ~ts", [JsonStr], log_web_3k, 215),
            web_push(2, [JsonStr]);
        _ERR ->
            logger:error("转换出错 ~w", [_ERR], log_web_3k, 218),
            {false, lang:get("转换出错")}
    end;
do_handle_cast(_State, Msg, Args) ->
    logger:error("未知的cast消息:~w, ~w",
                 [Msg, Args],
                 log_web_3k,
                 224),
    ok.

do_handle_info(#state{chat_buff = ChatBuff,
                      time_ref = TimeRef},
               post, []) ->
    case is_reference(TimeRef) of
        true -> erlang:cancel_timer(TimeRef);
        _ -> ok
    end,
    web_push(1, ChatBuff),
    NTimeRef = erlang:send_after(60000,
                                 self(),
                                 {info, post, []}),
    {ok, #state{time_ref = NTimeRef}};
do_handle_info(_State, Msg, Args) ->
    logger:error("未知的info消息:~w, ~w",
                 [Msg, Args],
                 log_web_3k,
                 241),
    ok.

web_push(_, []) -> ok;
web_push(Type, Data) ->
    NData = string:join(Data, ","),
    SouceString =
        util:flist("data=[~ts]&game_id=~w&secret=~ts",
                   [NData, 7, "0f199a0d5ecf2c3ebdda6c6761d22dc4"]),
    Sign = util:md5(SouceString),
    S = util:flist("game_id=~w&data=[~ts]&sign=~ts",
                   [7, NData, Sign]),
    logger:debug("消息推送参数 ~ts", [S], log_web_3k, 253),
    web_push(S, Type, 0).

web_push(S, Type, N) ->
    case do_web_push(Type, S) of
        break -> ok;
        ok -> ok;
        _ when N < 3 -> web_push(S, Type, N + 1);
        {retry, Reason} ->
            logger:error("处理信息出错~w次, 丢弃不再处理: ~p",
                         [N, Reason],
                         log_web_3k,
                         265);
        _Err ->
            logger:error("处理信息出错~w次, 丢弃不再处理: ~w",
                         [N, _Err],
                         log_web_3k,
                         267)
    end.

do_web_push(Type, S) ->
    NPostUrl = case Type of
                   1 -> "https://yichat.3k.com/?ct=Push" ++ "&ac=chat";
                   2 -> "https://yichat.3k.com/?ct=Push" ++ "&ac=report"
               end,
    case httpc:request(post,
                       {NPostUrl,
                        [],
                        "application/x-www-form-urlencoded",
                        util:to_binary(S)},
                       [{timeout, 5000}],
                       [{full_result, false}])
        of
        {ok, _Result} ->
            logger:debug("成功推送聊天记录到3k:~w",
                         [_Result],
                         log_web_3k,
                         276),
            ok;
        {error, Reason} -> {retry, Reason};
        Err ->
            logger:error("推送聊天记录信息失败:~w", [Err], log_web_3k, 281),
            retry
    end.

