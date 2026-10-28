-file("src/mod/campaign/campaign_snow_mgr.erl", 1).

-module(campaign_snow_mgr).

-behaviour(gen_fsm).

-export([idle/2, active/2, m/0]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

-record(state, {ts, timeout}).

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

-file("src/mod/campaign/campaign_snow_mgr.erl", 30).

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

-file("src/mod/campaign/campaign_snow_mgr.erl", 31).

-file("inc/campaign_snow.hrl", 1).

-file("src/mod/campaign/campaign_snow_mgr.erl", 32).

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

-file("src/mod/campaign/campaign_snow_mgr.erl", 33).

m() -> gen_fsm:send_event(campaign_snow_mgr, timeout).

info(Info) -> campaign_snow_mgr ! Info.

cast(Event) ->
    gen_fsm:send_all_state_event(campaign_snow_mgr, Event).

call(Info) ->
    case catch
             gen_fsm:sync_send_all_state_event(campaign_snow_mgr,
                                               Info,
                                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

start_link() ->
    gen_fsm:start_link({local, campaign_snow_mgr},
                       campaign_snow_mgr,
                       [],
                       []).

init([]) ->
    logger:info("[~w] 正在启动...",
                [campaign_snow_mgr],
                campaign_snow_mgr,
                54),
    process_flag(trap_exit, true),
    {StateName, IdleTime} = get_idle_time(),
    Timeout = case IdleTime of
                  undefined -> infinity;
                  _ -> IdleTime
              end,
    Ref = erlang:send_after(date:next_diff(0, 0, 20) * 1000,
                            self(),
                            zero_check),
    put(zero_reset_time, Ref),
    State = #state{ts = erlang:now(), timeout = IdleTime},
    save(StateName, State),
    logger:info("打雪仗状态[~w],持续时间[~w]",
                [StateName, IdleTime],
                campaign_snow_mgr,
                66),
    logger:info("[~w] 启动完成",
                [campaign_snow_mgr],
                campaign_snow_mgr,
                67),
    {ok, StateName, State, Timeout}.

handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event(_Event, _From, StateName, State) ->
    continue(StateName, false, State).

handle_info(notice, active, State) ->
    case get(campaign_snow_notice_ref) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    Msg =
        notice:format(lang:get("~ts正在进行中，还没参加的人快快放下手中的武器和任务，搓个雪球加入战圈吧！{face_1"
                               ", 7}"),
                      [{string_2, 1, lang:get("雪球大战")}]),
    notice:cast(all, 5, Msg),
    Ref = erlang:send_after(600 * 1000, self(), notice),
    put(campaign_snow_notice_ref, Ref),
    continue(active, State);
handle_info(notice, StateName, State) ->
    continue(StateName, State);
handle_info(zero_check, _StateName, State = #state{}) ->
    case get(campaign_snow_zero_ref) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    {NewStateName, IdleTime} = get_idle_time(),
    Ref = erlang:send_after(date:next_diff(0, 0, 20) * 1000,
                            self(),
                            zero_check),
    put(campaign_snow_zero_ref, Ref),
    State1 = State#state{ts = erlang:now(),
                         timeout = IdleTime},
    logger:info("打雪仗检测状态[~w],持续时间[~w]",
                [NewStateName, IdleTime],
                campaign_snow_mgr,
                101),
    save(NewStateName, State1),
    continue(NewStateName, State1);
handle_info(reload, _StateName, State = #state{}) ->
    case get(campaign_snow_zero_ref) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    {NewStateName, IdleTime} = get_idle_time(),
    Ref = erlang:send_after(date:next_diff(0, 0, 20) * 1000,
                            self(),
                            zero_check),
    put(campaign_snow_zero_ref, Ref),
    State1 = State#state{ts = erlang:now(),
                         timeout = IdleTime},
    case {NewStateName, IdleTime} of
        {idle, _} ->
            role_group:pack_send(world, 18306, {0, 0, 1000});
        {active, IdleTime} when is_integer(IdleTime) ->
            role_group:pack_send(world,
                                 18306,
                                 {2, IdleTime div 1000, 1000});
        _ -> role_group:pack_send(world, 18306, {0, 0, 1000})
    end,
    logger:info("打雪仗活动重载，下个阶段[~w]持续时间[~w]",
                [NewStateName, IdleTime],
                campaign_snow_mgr,
                125),
    save(NewStateName, State1),
    continue(NewStateName, State1);
handle_info(_Info, StateName, State) ->
    logger:debug("未知消息[Info:~w][stateName:~w]",
                 [_Info, StateName],
                 campaign_snow_mgr,
                 130),
    continue(StateName, State).

terminate(_Reason, _StateName, _State) ->
    logger:info("开始关闭", [], campaign_snow_mgr, 134),
    logger:info("关闭完成", [], campaign_snow_mgr, 135),
    ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

save(StateName, #state{ts = Ts, timeout = Timeout}) ->
    env:set(campaign_snow_time,
            #{state_name => StateName, ts => Ts,
              timeout => Timeout}),
    ok.

get_idle_time() ->
    {StateName, Tt} = agenda:get_state_timeout(2101, 0),
    {StateName, Tt * 1000}.

idle(timeout, State = #state{}) ->
    Msg =
        notice:format(lang:get("~ts开始啦！是时候放下武器，用手中的雪球来一场堂堂正正的对决啦！{face_1, 7}"),
                      [{string_2, 1, lang:get("雪球大战")}]),
    notice:cast(all, 5, Msg),
    Ref = erlang:send_after(600 * 1000, self(), notice),
    put(campaign_snow_notice_ref, Ref),
    Timeout = agenda:get_duration(2101) * 1000,
    NewState = State#state{ts = erlang:now(),
                           timeout = Timeout},
    logger:info("打雪仗进入活动阶段,持续时间[~w]",
                [Timeout],
                campaign_snow_mgr,
                161),
    role_group:pack_send(world,
                         18306,
                         {2, Timeout div 1000, 1000}),
    save(active, NewState),
    continue(active, NewState);
idle(_Event, State) -> continue(idle, State).

active(timeout, State) ->
    Msg =
        notice:format(lang:get("~ts活动结束啦，回家吃饭，下次再战{face_1, 18}"),
                      [{string_2, 1, lang:get("雪球大战")}]),
    notice:cast(all, 5, Msg),
    {StateName, IdleTime} = get_idle_time(),
    NewState = State#state{ts = erlang:now(),
                           timeout = IdleTime},
    case {StateName, IdleTime} of
        {idle, _} ->
            role_group:pack_send(world, 18306, {0, 0, 1000});
        {active, IdleTime} when is_integer(IdleTime) ->
            role_group:pack_send(world,
                                 18306,
                                 {2, IdleTime div 1000, 1000});
        _ -> role_group:pack_send(world, 18306, {0, 0, 1000})
    end,
    logger:info("打雪仗活动结束，下个阶段[~w]持续时间[~w]",
                [StateName, IdleTime],
                campaign_snow_mgr,
                182),
    save(StateName, NewState),
    continue(StateName, NewState);
active(_Event, State) -> continue(active, State).

continue(StateName,
         #state{timeout = undefined} = State) ->
    {next_state, StateName, State, infinity};
continue(StateName,
         #state{ts = Ts, timeout = Timeout} = State) ->
    {next_state,
     StateName,
     State,
     util:time_left(Timeout, Ts)}.

continue(StateName, Reply,
         #state{timeout = undefined} = State) ->
    {reply, Reply, StateName, State, infinity};
continue(StateName, Reply,
         #state{ts = Ts, timeout = Timeout} = State) ->
    {reply,
     Reply,
     StateName,
     State,
     util:time_left(Timeout, Ts)}.

