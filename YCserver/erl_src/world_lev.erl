-file("src/mod/world_lev/world_lev.erl", 1).

-module(world_lev).

-behaviour(gen_server).

-export([start_link/0,
         init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([get_world_lev/0,
         get_world_lev/1,
         get_world_lev_yesterday/0,
         login/1,
         set_base_lev/2,
         calc_exp/1,
         calc_exp/2,
         gm_set/1,
         reset/0]).

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

-file("src/mod/world_lev/world_lev.erl", 28).

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

-file("src/mod/world_lev/world_lev.erl", 29).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/world_lev/world_lev.erl", 30).

-file("inc/var.hrl", 1).

-record(m_var,
        {ver = 1,
         last_reset_time = 0 :: non_neg_integer(),
         last_reset_five_time = 0,
         last_reset_week_five_time = 0,
         day_vars = [] :: [tuple()],
         day_five_vars = [] :: [tuple()],
         week_five_vars = [],
         last_acc_time = 0,
         acc_time = 0,
         acc_vars = [] :: [tuple()],
         other_vars = [] :: [tuple()]}).

-record(role_var,
        {id = {0, "", 0} :: tuple(),
         ver = 1,
         last_reset_time = 0 :: non_neg_integer(),
         day_vars = [] :: [tuple()],
         forever_vars = [] :: [tuple()],
         last_reset_five_time = 0,
         last_reset_week_five_time = 0,
         day_five_vars = [] :: [tuple()],
         week_five_vars = []}).

-file("src/mod/world_lev/world_lev.erl", 31).

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

-file("src/mod/world_lev/world_lev.erl", 32).

-file("inc/adm.hrl", 1).

-record(m_adm, {last_feedback = 0}).

-record(adm_report_info,
        {id, time, classes, lev, name, report = []}).

-record(adm_report,
        {id,
         order,
         name,
         lev,
         time,
         type,
         reason,
         msg = [],
         flag = 0}).

-record(adm_device_info,
        {id, type = 1 :: non_neg_integer()}).

-record(auth_sfz_cfg,
        {plat_channel = {"", 0},
         platform = "",
         channel_reg = 0,
         name = "",
         can_charge = 1,
         is_nonage = 0,
         charge_limit = 5000,
         is_wallow = 0,
         down_sec = 10800,
         is_show_phone = 0,
         show_info = "gm.3k.com",
         is_mail = 0,
         is_mid_exp = 0,
         is_lev_60 = 0,
         is_need_check = 0}).

-record(role_charge_cfg, {id = {0, "", 0}, label = ""}).

-file("src/mod/world_lev/world_lev.erl", 33).

-record(state, {}).

-spec start_link() -> {ok, pid()} |
                      ignore |
                      {error, term()}.

start_link() ->
    gen_server:start_link({local, world_lev},
                          world_lev,
                          [],
                          []).

login(Role) -> set_base_lev(Role, env:get(world_lev)).

gm_set(Flag) ->
    gen_server:cast(world_lev, {gm_set, Flag}).

reset() -> world_lev ! reset.

calc_exp(Role = #role{lev = RoleLevBase,
                      id = {_, Plat, _}, channel_reg = ChannelReg}) ->
    AuthSfzFlag = var:get_var(Role, day_five, 152, 0),
    AuthSfzRatio = case AuthSfzFlag of
                       1 ->
                           case adm_mgr:query_auth_cfg_info({Plat, ChannelReg})
                               of
                               [#auth_sfz_cfg{is_mid_exp = 1}] -> 500;
                               _ -> 1000
                           end;
                       _ -> 1000
                   end,
    {RtnWorldLev, RtnExpRatio, RtnCoinRatio} = case
                                                   var:get_var(Role,
                                                               other,
                                                               2000,
                                                               -1)
                                                   of
                                                   {WorldLev, _} ->
                                                       RoleLev = case WorldLev
                                                                          >= 100
                                                                          andalso
                                                                          lev_break:get_times(Role)
                                                                              =:=
                                                                              0
                                                                     of
                                                                     true ->
                                                                         min(RoleLevBase,
                                                                             95);
                                                                     _ ->
                                                                         levup:get_real_lev(Role)
                                                                 end,
                                                       logger:debug("玩家等级:~w",
                                                                    [RoleLev],
                                                                    world_lev,
                                                                    85),
                                                       case RoleLev =< 28 of
                                                           true ->
                                                               {WorldLev,
                                                                1000,
                                                                0};
                                                           false ->
                                                               LevNum = RoleLev
                                                                            -
                                                                            WorldLev,
                                                               case LevNum =< 0
                                                                        andalso
                                                                        WorldLev
                                                                            =<
                                                                            40
                                                                   of
                                                                   true ->
                                                                       {WorldLev,
                                                                        1000,
                                                                        0};
                                                                   false ->
                                                                       {ExpRatio,
                                                                        CoinRatio} =
                                                                           world_lev_data:get_ratio(LevNum),
                                                                       {WorldLev,
                                                                        ExpRatio,
                                                                        CoinRatio}
                                                               end
                                                       end;
                                                   _ -> {40, 0, 0}
                                               end,
    logger:debug("加经验世界等级参数:~w",
                 [{RtnWorldLev,
                   round(RtnExpRatio * AuthSfzRatio / 1000),
                   round(RtnCoinRatio * AuthSfzRatio / 1000)}],
                 world_lev,
                 101),
    {RtnWorldLev,
     round(RtnExpRatio * AuthSfzRatio / 1000),
     round(RtnCoinRatio * AuthSfzRatio / 1000)}.

calc_exp(RoleLev, WorldLev) ->
    case RoleLev =< 28 of
        true -> {WorldLev, 1000, 0};
        false ->
            LevNum = RoleLev - WorldLev,
            case LevNum =< 0 andalso WorldLev =< 40 of
                true -> {WorldLev, 1000, 0};
                false ->
                    {ExpRatio, CoinRatio} =
                        world_lev_data:get_ratio(LevNum),
                    {WorldLev, ExpRatio, CoinRatio}
            end
    end.

-spec get_world_lev() -> {WorldLev, NextTime} |
                         undefined when WorldLev :: pos_integer(),
                                        NextTime :: pos_integer().

get_world_lev() -> env:get(world_lev).

get_world_lev_yesterday() ->
    env:get(world_lev_yesterday).

-spec get_world_lev(Role :: #role{}) -> {WorldLev ::
                                             non_neg_integer(),
                                         NextTime :: pos_integer()}.

get_world_lev(Role) ->
    case var:get_var(Role, other, 2000) of
        {WorldLev, NextTime} -> {WorldLev, NextTime};
        _ ->
            logger:error("无法获取世界等级", [], world_lev, 134),
            {40, 0}
    end.

init([]) ->
    process_flag(trap_exit, true),
    logger:info("[~w] 正在启动...",
                [world_lev],
                world_lev,
                144),
    case calc_world_lev() of
        {true, WorldLev, NextTime} ->
            logger:info("[~w] 启动完成...",
                        [world_lev],
                        world_lev,
                        148),
            logger:info("当前服务器等级:~w, 当前时间为:~w, 下次开放时间为:~w",
                        [WorldLev, date:unixtime(), NextTime],
                        world_lev,
                        149),
            Ref = erlang:send_after(date:next_diff(0, 0, 2) * 1000,
                                    self(),
                                    reset),
            Ref2 = erlang:send_after(date:next_diff(23, 59, 55) *
                                         1000,
                                     self(),
                                     update),
            put(reset_time, Ref),
            put(update_time, Ref2),
            env:save(world_lev, {WorldLev, NextTime}),
            {ok, #state{}};
        false ->
            logger:error("无法计算当前服务器的服务器等级", [], world_lev, 157),
            {stop, world_lev_error}
    end.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({gm_set, LevFlag}, State) ->
    case world_lev_data:get(LevFlag) of
        #{lev := WorldLev} ->
            {_, NextTime} = env:get(world_lev),
            env:save(world_lev, {WorldLev, NextTime}),
            lev_change(WorldLev, NextTime),
            role_group:apply(world,
                             {world_lev, set_base_lev, [{WorldLev, NextTime}]}),
            hero_mgr ! {world_lev, WorldLev},
            {noreply, State};
        _ -> {noreply, State}
    end;
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(reset, State) ->
    case get(reset_time) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> skip
    end,
    case calc_world_lev() of
        {true, WorldLev, NextTime} ->
            logger:info("更新服务器等级:~w, 当前时间为:~w, 下次开放时间为:~w",
                        [WorldLev, date:unixtime(), NextTime],
                        world_lev,
                        189),
            lev_change(WorldLev, NextTime),
            role_group:apply(world,
                             {world_lev, set_base_lev, [{WorldLev, NextTime}]}),
            rencounter_agent ! {world_lev, WorldLev},
            hero_mgr ! {world_lev, WorldLev};
        _ -> logger:error("无法计算服务器等级", [], world_lev, 195)
    end,
    Ref = erlang:send_after(date:next_diff(0, 0, 2) * 1000,
                            self(),
                            reset),
    put(reset_time, Ref),
    {noreply, State};
handle_info(update, State) ->
    case get(update_time) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> skip
    end,
    case get_world_lev() of
        {WorldLev, _Time} ->
            env:save(world_lev_yesterday, WorldLev);
        _ -> ok
    end,
    Ref = erlang:send_after(date:next_diff(23, 59, 57) *
                                1000,
                            self(),
                            update),
    put(update_time, Ref),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...",
                [world_lev],
                world_lev,
                220),
    logger:info("[~w] 关闭完成", [world_lev], world_lev, 221),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

lev_change(WorldLev, NextTime) ->
    world_boss:lev_change(WorldLev),
    env:save(world_lev, {WorldLev, NextTime}),
    ok.

calc_world_lev() ->
    case date:open_srv_day() of
        Day when is_integer(Day) ->
            Day1 = case {env:get(platform), env:get(zone_id)} of
                       {"beta", 1} -> Day + 2;
                       {"beta", 2} -> Day + 2;
                       _ -> Day
                   end,
            KilldedT = case lev_break:get_boss_killed_time() of
                           0 -> 0;
                           KT ->
                               KT2 = max(KT,
                                         date:datetime_to_seconds({{2016,
                                                                    12,
                                                                    4},
                                                                   {0, 0, 0}})),
                               logger:info("突破时间 ~w, 调整时间 ~w",
                                           [KT, KT2],
                                           world_lev,
                                           250),
                               KT2
                       end,
            SrvOpenTime = env:get(srv_open_time),
            Now = date:unixtime(),
            Day2 = case Now =< SrvOpenTime of
                       true -> 1;
                       _ -> Day1
                   end,
            {Day3, Flag} = case KilldedT > 0 of
                               true ->
                                   {date:day_diff(KilldedT, date:unixtime()),
                                    14};
                               _ -> {Day2, 1}
                           end,
            case do_calc_world_lev(Day3, Flag) of
                {WorldLev, NextTime} ->
                    WorldLev2 = case KilldedT > 0 of
                                    false -> min(WorldLev, 95);
                                    _ -> WorldLev
                                end,
                    NextTime2 = case WorldLev2 of
                                    95 -> 0;
                                    _ -> NextTime
                                end,
                    calc_world_lev2(Day3 - 1, Flag, KilldedT, WorldLev2),
                    env:save(world_lev, {WorldLev2, NextTime2}),
                    {true, WorldLev2, NextTime2};
                _ -> false
            end;
        false -> false
    end.

calc_world_lev2(Day, Flag, KilldedT, Default)
    when Day =< 0 ->
    calc_world_lev2(1, Flag, KilldedT, Default);
calc_world_lev2(Day, Flag, KilldedT, Default) ->
    case do_calc_world_lev(Day, Flag) of
        {WorldLev, _NextTime} ->
            WorldLev2 = case KilldedT > 0 of
                            false -> min(WorldLev, 95);
                            _ -> WorldLev
                        end,
            env:save(world_lev_yesterday, WorldLev2);
        _ -> env:save(world_lev_yesterday, Default)
    end.

do_calc_world_lev(Day, Flag) ->
    case world_lev_data:get(Flag) of
        #{lev := Lev, flag := 1} -> {Lev, 0};
        #{keep := KeepDay, lev := Lev} when Day =< KeepDay ->
            NextTime = date:unixtime(zero) +
                           (KeepDay - Day + 1) * 86400,
            {Lev, NextTime};
        #{keep := KeepDay} ->
            do_calc_world_lev(Day - KeepDay, Flag + 1);
        _ -> false
    end.

set_base_lev(Role = #role{link =
                              #link{conn_pid = ConnPid}},
             {WorldLev, NextTime}) ->
    Role1 = var:set_var(Role,
                        other,
                        2000,
                        {WorldLev, NextTime}),
    sys_conn:pack_send(ConnPid, 9904, {WorldLev, NextTime}),
    {ok, Role1}.

