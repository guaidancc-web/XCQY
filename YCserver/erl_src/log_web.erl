-file("src/log/log_web.erl", 1).

-module(log_web).

-behaviour(gen_server).

-export([info/1, cast/1, call/1, start_link/1]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-compile(export_all).

-record(state, {buffer = [] :: [tuple()]}).

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

-file("src/log/log_web.erl", 17).

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

-file("src/log/log_web.erl", 18).

info(Info) -> log_web ! Info.

cast(Info) -> gen_server:cast(log_web, Info).

call(Info) ->
    case catch gen_server:call(log_web, Info, 10000) of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

start_link(N) ->
    gen_server:start_link(log_web, [N], []).

init([N]) ->
    logger:info("[~w] 正在启动...", [log_web], log_web, 40),
    process_flag(trap_exit, true),
    put(n, N),
    put(key, env:get(server_key)),
    State = #state{},
    erlang:register(list_to_atom(lists:concat(["log_proc_web_",
                                               N])),
                    self()),
    logger:info("[~w] 启动完成", [log_web], log_web, 46),
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({web, Info}, State = #state{buffer = []}) ->
    erlang:send_after(1000, self(), tick),
    {noreply, State#state{buffer = [{1, Info}]}};
handle_info({web, Info},
            State = #state{buffer = Buffer}) ->
    {noreply, State#state{buffer = [{1, Info} | Buffer]}};
handle_info(tick, State = #state{buffer = Buffer}) ->
    NewBuffer = web_tick(Buffer, 100, []),
    case NewBuffer of
        [] -> ok;
        _ -> erlang:send_after(2000, self(), tick)
    end,
    {noreply, State#state{buffer = NewBuffer}};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

web_tick([], _N, ErrBuffer) -> ErrBuffer;
web_tick(Buffer, 0, []) -> Buffer;
web_tick(Buffer, 0, ErrBuffer) -> ErrBuffer ++ Buffer;
web_tick([{ErrN, Info} | T], N, ErrBuffer) ->
    case catch do_web_info(Info) of
        break -> web_tick(T, N - 1, ErrBuffer);
        ok -> web_tick(T, N - 1, ErrBuffer);
        retry when ErrN < 2 ->
            web_tick(T, N - 1, [{ErrN + 1, Info} | ErrBuffer]);
        _Err when ErrN < 2 ->
            logger:error("处理信息[~w]出错~w次, 会再次尝试处理: ~w",
                         [Info, ErrN, _Err],
                         log_web,
                         100),
            web_tick(T, N - 1, [{ErrN + 1, Info} | ErrBuffer]);
        _Err ->
            logger:error("处理信息[~w]出错~w次, 丢弃不再处理: ~w",
                         [Info, ErrN, _Err],
                         log_web,
                         103),
            web_tick(T, N - 1, ErrBuffer)
    end.

do_web_info({baidu, [{"role_name", Name} | Data]}) ->
    Name1 = encode_uri_rfc3986:encode(Name),
    Name2 = encode_uri_rfc3986:encode(Name1),
    Fun = fun ({K, V}, 1)
                  when is_binary(V) orelse is_list(V) ->
                  io_lib:format("~ts~ts", [K, V]);
              ({K, V}, 1) -> io_lib:format("~ts~w", [K, V]);
              ({K, V}, _) when is_binary(V) orelse is_list(V) ->
                  io_lib:format("~ts=~ts", [K, V]);
              ({K, V}, _) -> io_lib:format("~ts=~w", [K, V])
          end,
    Key = case get(key) of
              undefined -> env:get(server_key);
              Key1 -> Key1
          end,
    SortS = string:join([Fun(I, 1)
                         || I
                                <- lists:keysort(1,
                                                 [{"role_name", Name1},
                                                  {"api_key",
                                                   "486a185e0148d043a0303b146cf16c44"},
                                                  {"timestamp",
                                                   log:time_format("yyyy-MM-dd hh:mm:ss")}
                                                  | Data])],
                        ""),
    SouceString = lists:concat([Key, SortS]),
    Sign = string:to_upper(util:md5(SouceString)),
    Data1 = [{"role_name", Name2},
             {"api_key", "486a185e0148d043a0303b146cf16c44"},
             {"timestamp", log:time_format("yyyy-MM-dd hh:mm:ss")},
             {"sign", Sign}
             | Data],
    S = string:join([Fun(I, 2) || I <- Data1], "&"),
    post("http://youxi.baidu.com/roleAction/gameRolePos"
         "t.jsp",
         S);
do_web_info({360, Data}) ->
    Fun = fun ({_K, V}, 1)
                  when is_binary(V) orelse is_list(V) ->
                  io_lib:format("~ts", [V]);
              ({_K, V}, 1) -> io_lib:format("~w", [V]);
              ({K, V}, _) when is_binary(V) ->
                  io_lib:format("~ts=~ts",
                                [K, encode_uri_rfc3986:encode(V)]);
              ({K, V}, _) when is_list(V) ->
                  io_lib:format("~ts=~ts", [K, V]);
              ({K, V}, _) -> io_lib:format("~ts=~w", [K, V])
          end,
    Key = case get(key) of
              undefined -> env:get(server_key);
              Key1 -> Key1
          end,
    SortS = string:join([Fun(I, 1)
                         || I <- lists:keysort(1, Data)],
                        ""),
    SouceString = lists:concat([SortS, Key]),
    Sign = util:md5(SouceString),
    Data1 = [{"sign", Sign} | Data],
    S = string:join([Fun(I, 2) || I <- Data1], "&"),
    post("http://game.api.1360.com/player", S).

test(S) ->
    post("http://youxi.baidu.com/roleAction/gameRolePos"
         "t.jsp",
         S).

post(Url, Data) ->
    post_web({Url,
              [],
              "application/x-www-form-urlencoded",
              util:to_binary(Data)}).

post_web(Request) ->
    post_web(Request, [{timeout, 5000}], []).

post_web(Request, HttpOptions, Options) ->
    case httpc:request(post, Request, HttpOptions, Options)
        of
        {ok,
         {_,
          _,
          Err = [$E, $R, $R, $O, $R, $_, $1, $0, $0 | _]}} ->
            logger:info("参数错误，或者参数格式错误 [~ts]", [Err], log_web, 167),
            break;
        {ok,
         {_,
          _,
          Err = [$E, $R, $R, $O, $R, $_, $2, $0, $0 | _]}} ->
            logger:info("签名错误 [~ts]", [Err], log_web, 170),
            break;
        {ok,
         {_,
          _,
          Err = [$E, $R, $R, $O, $R, $_, $3, $0, $0 | _]}} ->
            logger:info("Post失败，加入重试机制 [~ts]", [Err], log_web, 173),
            retry;
        {ok, {_, _, _Err = [$E, $R, $R, $O, $R, $_ | _]}} -> ok;
        {ok, {_, _, _Body}} -> ok;
        {ok, _Result} -> ok;
        {error, Reason} -> {error, Reason};
        Err -> Err
    end.

