-file("src/mod/exquisite_shelf/exquisite_shelf.erl", 1).

-module(exquisite_shelf).

-behaviour(gen_server).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([info/2, call/2, cast/2, start_link/1]).

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

-file("src/mod/exquisite_shelf/exquisite_shelf.erl",
      20).

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

-file("src/mod/exquisite_shelf/exquisite_shelf.erl",
      21).

-file("inc/exquisite_shelf.hrl", 1).

-record(m_exquisite_shelf,
        {ver = 2,
         wave = 0,
         shelf_id = 0,
         shelf_pid,
         pos_wave = 0,
         card_info = [],
         help_times = 0,
         is_get_help = 0}).

-record(exquisite_shelf_util,
        {id = 0,
         cross_type = 0,
         pid = 0,
         battle_id = 0,
         wave_info = [],
         wave = 1,
         lev = 1,
         challenges = [],
         create_time = 0}).

-record(exquisite_shelf_wave_info,
        {wave = 0,
         map_base_id = 0,
         map_id = 0,
         map_pid,
         units = [],
         status = 0}).

-record(exquisite_shelf_card_info,
        {wave = 1,
         shelf_lev = 1,
         type = 2,
         normal_card = [],
         gold_card = []}).

-record(exquisite_shelf_card_item,
        {index = 1,
         item_id = 0,
         num = 0,
         is_get = 0,
         is_notice = 0,
         is_show = 0}).

-record(exquisite_shelf_fast_combat_record,
        {shelf_wave = {0, 0},
         use_time = 0,
         record_id = {0, {0, "", 0}}}).

-file("src/mod/exquisite_shelf/exquisite_shelf.erl",
      22).

-file("inc/unit.hrl", 1).

-record(unit_order,
        {order :: undefined | move | guard | attack | atom(),
         type = 0 :: 0..2,
         arg :: undefined | tuple() | [tuple()],
         data :: undefined | term(),
         condition = [] :: list(),
         over :: undefined | defense | stop | atom()}).

-record(unit_data,
        {id = 0 :: pos_integer(),
         type = 1 :: non_neg_integer(),
         fun_type = 1 :: non_neg_integer(),
         desc = "",
         classes = 0,
         sex = 0,
         lev = 1,
         name = "" :: list(),
         activity = 0 :: 0..1,
         guide_lev = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         nature = 0 :: non_neg_integer(),
         disabled = "" :: bitstring(),
         condition = [] :: [tuple()],
         speed = 120 :: pos_integer(),
         lock = 0 :: 0 | 1,
         t_move = 3 :: pos_integer(),
         t_atk = 3 :: pos_integer(),
         range_trace = 200 :: pos_integer(),
         range_atk = 100 :: pos_integer(),
         gain = [] :: list(),
         formation = 1,
         formation_lev = 1,
         slave = [] :: list(),
         talk = [] :: list(),
         looks = [] :: list(),
         data = [] :: list(),
         def_status = defense :: defense | patrol | loaf}).

-record(unit,
        {id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 0 :: non_neg_integer(),
         type = 1 :: non_neg_integer(),
         fun_type = 1,
         name = "" :: list(),
         pid = 0 :: non_neg_integer() | pid(),
         lev = 1,
         classes = 0,
         sex = 0,
         activity = 0 :: 0..1,
         dun_info :: undefined | {pid(), pos_integer()},
         combat_pid = 0 :: non_neg_integer() | pid(),
         status = 0 :: non_neg_integer(),
         guide_lev = 0 :: non_neg_integer(),
         nature = 0 :: non_neg_integer(),
         disabled = "" :: list(),
         condition = [] :: [tuple()],
         speed = 180 :: pos_integer(),
         lock = 0 :: 0 | 1,
         range_trace = 200 :: pos_integer(),
         range_atk = 100 :: pos_integer(),
         defxy = {0, 0, 0} :: tuple(),
         def_status = defense :: defense | patrol | loaf,
         talk = [] :: list(),
         pos :: undefined | tuple(),
         data :: undefined | term(),
         looks = [] :: [tuple()],
         evt = [] :: [atom()],
         formation = 1,
         formation_lev = 1,
         slave = [] :: list(),
         prop = [] :: [{non_neg_integer(), string()}],
         order = [] :: list(),
         path = [] :: list(),
         ts = {1, 1, 1} ::
             {pos_integer(), pos_integer(), pos_integer()},
         t_move = 3 :: pos_integer(),
         t_atk = 3 :: pos_integer(),
         ai_id = 0,
         ai = {[], []} :: {list(), list()},
         attr,
         role_id = {0, "", 0}}).

-record(map_unit,
        {id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 0 :: non_neg_integer(),
         type = 1 :: pos_integer(),
         activity = 0 :: 0..1,
         status = 0 :: non_neg_integer(),
         classes = 0,
         sex = 0,
         guide_lev = 0 :: non_neg_integer(),
         name = "" :: list(),
         speed = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         gx = 0 :: non_neg_integer(),
         gy = 0 :: non_neg_integer(),
         looks = [] :: [tuple()],
         prop = [] :: [tuple()]}).

-record(plot_unit,
        {id = 0 :: pos_integer(),
         name = "" :: bitstring(),
         base_id = 0 :: non_neg_integer(),
         type = 1,
         fun_type = 1,
         dun_id = 0 :: non_neg_integer(),
         map = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         dir = 0 :: non_neg_integer(),
         act_type = "" :: bitstring(),
         looks = [] :: [tuple()],
         status = 0 :: non_neg_integer(),
         quest_id = 0 :: non_neg_integer(),
         quest_prog_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer()}).

-record(unit_statue,
        {type = 0,
         id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         looks = []}).

-file("src/mod/exquisite_shelf/exquisite_shelf.erl",
      23).

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

-file("src/mod/exquisite_shelf/exquisite_shelf.erl",
      24).

-file("inc/pos.hrl", 1).

-record(pos_history,
        {map = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(pos,
        {map = 10001 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         last :: undefined | #pos_history{},
         map_base_id = 0 :: non_neg_integer(),
         map_pid = 0 :: non_neg_integer() | pid(),
         map_grid_pid = 0 :: non_neg_integer() | pid(),
         hidden = 1 :: 0 | 1,
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         dir = 0 :: 0..255}).

-file("src/mod/exquisite_shelf/exquisite_shelf.erl",
      25).

call(Pid, Msg) ->
    case catch gen_server:call(Pid, Msg, 10000) of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

info(Pid, Msg) -> Pid ! Msg.

cast(Pid, Msg) -> gen_server:cast(Pid, Msg).

start_link(Args) ->
    gen_server:start_link(exquisite_shelf, [Args], []).

init([#{wave := Wave, shelf_lev := ShelfLev,
        shelf_id := Id, cross_type := CrossType}]) ->
    logger:info("[~w] 正在启动...",
                [exquisite_shelf],
                exquisite_shelf,
                47),
    process_flag(trap_exit, true),
    case battle_mgr:fetch_ids(1) of
        {ok, [BattlelId]} ->
            case create_map(BattlelId, ShelfLev) of
                {false, _Reason} ->
                    logger:error("启动副本进程失败:~w",
                                 [_Reason],
                                 exquisite_shelf,
                                 56),
                    {stop, exquisite_shelf_faild_map};
                WaveInfo ->
                    State = #exquisite_shelf_util{id = Id, pid = self(),
                                                  wave = Wave, lev = ShelfLev,
                                                  battle_id = BattlelId,
                                                  wave_info = WaveInfo,
                                                  cross_type = CrossType,
                                                  create_time =
                                                      date:unixtime()},
                    exquisite_shelf_mgr:update_cache_shelf(State),
                    OverRef = erlang:send_after(180000, self(), check_over),
                    put(over_ref, OverRef),
                    {ok, State}
            end;
        _ -> {stop, exquisite_shelf_faild_battle}
    end.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({role_exit, RoleId},
            State = #exquisite_shelf_util{challenges =
                                              Challenges}) ->
    logger:debug("玩家退出副本:~w",
                 [RoleId],
                 exquisite_shelf,
                 90),
    NewChallenges = lists:delete(RoleId, Challenges),
    NewState = State#exquisite_shelf_util{challenges =
                                              NewChallenges},
    exquisite_shelf_mgr:update_cache_shelf(NewState),
    {noreply, NewState};
handle_cast({enter, EnterIds, IsPlot},
            State = #exquisite_shelf_util{wave = Wave,
                                          wave_info = WaveInfo}) ->
    case lists:keyfind(Wave,
                       #exquisite_shelf_wave_info.wave,
                       WaveInfo)
        of
        #exquisite_shelf_wave_info{map_id = MapId,
                                   units = Units} ->
            case lists:keyfind(Wave, 1, Units) of
                {_, {BattleId, UnitId}} ->
                    logger:debug("队伍进入副本:~w",
                                 [EnterIds],
                                 exquisite_shelf,
                                 103),
                    case Wave =< 6 of
                        true ->
                            case exquisite_shelf_data:get_show_unit(UnitId) of
                                0 -> ok;
                                ShowUnitId ->
                                    unit_mgr:remove({BattleId, ShowUnitId})
                            end,
                            {PosX, PosY, _} =
                                exquisite_shelf_data:get_unit_pos(Wave),
                            case unit_mgr:create({BattleId, UnitId},
                                                 UnitId,
                                                 {MapId, PosX, PosY})
                                of
                                {ok, #unit{}} ->
                                    logger:debug("队伍进入副本:~w",
                                                 [EnterIds],
                                                 exquisite_shelf,
                                                 116),
                                    [role:pack_send(RoleId,
                                                    20306,
                                                    {Wave, BattleId, UnitId, 1})
                                     || RoleId <- EnterIds],
                                    TimeOut = case IsPlot of
                                                  1 -> 16000;
                                                  _ -> 3000
                                              end,
                                    erlang:send_after(TimeOut,
                                                      self(),
                                                      {boss_move,
                                                       {BattleId, UnitId},
                                                       53007});
                                _Err ->
                                    logger:error("创建玲珑宝阁战斗单位出错:~w",
                                                 [_Err],
                                                 exquisite_shelf,
                                                 126),
                                    ingore
                            end;
                        _ ->
                            [role:pack_send(RoleId,
                                            20306,
                                            {Wave, BattleId, UnitId, 0})
                             || RoleId <- EnterIds],
                            TimeOut = 3000,
                            erlang:send_after(TimeOut,
                                              self(),
                                              {boss_move,
                                               {BattleId, UnitId},
                                               53008}),
                            ok
                    end;
                _Err ->
                    logger:error("创建玲珑宝阁战斗单位出错:~w",
                                 [_Err],
                                 exquisite_shelf,
                                 136),
                    ingore
            end;
        _ -> ingore
    end,
    OverRef = erlang:send_after(60000, self(), check_over),
    put(over_ref, OverRef),
    NewState = State#exquisite_shelf_util{challenges =
                                              EnterIds},
    exquisite_shelf_mgr:update_cache_shelf(NewState),
    {noreply, NewState};
handle_cast({combat_over, ExtArgs},
            State = #exquisite_shelf_util{wave = Wave,
                                          wave_info = WaveInfo,
                                          battle_id = BattleId,
                                          challenges = Challenges}) ->
    logger:debug("战斗结束：~w", [State], exquisite_shelf, 153),
    ChallengeWave = case lists:keyfind(shelf_wave,
                                       1,
                                       ExtArgs)
                        of
                        {_, {_ChallengeWave, _}} -> _ChallengeWave;
                        _ -> Wave
                    end,
    case ChallengeWave of
        _ when ChallengeWave < 7 -> remove_kill_unit(State);
        _ when ChallengeWave =:= 9 -> remove_kill_unit(State);
        _ -> ok
    end,
    NewWave = min(ChallengeWave + 1, 9),
    case Wave of
        9 ->
            Msg = lang:get("恭喜您通关本次玲珑宝阁"),
            [notice:send(ChallengeId, 1, Msg)
             || ChallengeId <- Challenges],
            ok;
        _ when Wave =:= 6 ->
            case lists:keyfind(Wave,
                               #exquisite_shelf_wave_info.wave,
                               WaveInfo)
                of
                #exquisite_shelf_wave_info{map_id = MapId} ->
                    {PosX, PosY} = {2492, 270},
                    unit_mgr:create({BattleId, 58031},
                                    58031,
                                    {MapId, PosX, PosY}),
                    Msg = lang:get("恭喜您完成本层挑战，传送阵已经打开，请前往下一层"),
                    [notice:send(ChallengeId, 1, Msg)
                     || ChallengeId <- Challenges],
                    ok;
                _ -> ingore
            end,
            ok;
        _ when Wave < 6 ->
            CreateUnitRef = erlang:send_after(60000,
                                              self(),
                                              create_next_unit),
            put(create_unit_ref, CreateUnitRef),
            ok;
        _ -> ok
    end,
    NewWaveInfo = case lists:keyfind(Wave,
                                     #exquisite_shelf_wave_info.wave,
                                     WaveInfo)
                      of
                      Info = #exquisite_shelf_wave_info{units = Units} ->
                          case ChallengeWave of
                              _
                                  when ChallengeWave =:= 9 orelse
                                           ChallengeWave =:= 6 ->
                                  UnitId = case lists:keyfind(Wave, 1, Units) of
                                               {_, {_, _UnitId}} -> _UnitId;
                                               _ -> 0
                                           end,
                                  Reply = {ChallengeWave, BattleId, UnitId, 2},
                                  [role:pack_send(RoleId, 20306, Reply)
                                   || RoleId <- Challenges];
                              _
                                  when ChallengeWave < 9 orelse
                                           ChallengeWave > 6 ->
                                  UnitId = case lists:keyfind(Wave, 1, Units) of
                                               {_, {_, _UnitId}} -> _UnitId;
                                               _ -> 0
                                           end,
                                  Reply = {ChallengeWave + 1,
                                           BattleId,
                                           UnitId,
                                           0},
                                  [role:pack_send(RoleId, 20306, Reply)
                                   || RoleId <- Challenges];
                              _ -> ok
                          end,
                          NewInfo = Info#exquisite_shelf_wave_info{status = 2},
                          lists:keyreplace(Wave,
                                           #exquisite_shelf_wave_info.wave,
                                           WaveInfo,
                                           NewInfo);
                      _ -> WaveInfo
                  end,
    NewState = State#exquisite_shelf_util{wave = NewWave,
                                          wave_info = NewWaveInfo},
    exquisite_shelf_mgr:update_cache_shelf(NewState),
    {noreply, NewState};
handle_cast(_Msg, State) ->
    logger:info("shelf_mgr收到未知的协议:~w",
                [_Msg],
                exquisite_shelf,
                232),
    {noreply, State}.

handle_info({'EXIT', _, normal}, State) ->
    {noreply, State};
handle_info(check_over,
            State = #exquisite_shelf_util{id = ShelfId,
                                          wave_info = WaveInfo,
                                          challenges = []}) ->
    logger:debug("结束副本=========:~w",
                 [State],
                 exquisite_shelf,
                 241),
    Fun = fun (#exquisite_shelf_wave_info{map_pid =
                                              MapPid}) ->
                  map:stop(MapPid)
          end,
    lists:foreach(Fun, WaveInfo),
    exquisite_shelf_mgr:delete_shelf(ShelfId),
    {stop, normal, State};
handle_info(check_over,
            State = #exquisite_shelf_util{id = ShelfId,
                                          create_time = CreateTime,
                                          wave_info = WaveInfo,
                                          challenges = Challenges}) ->
    case get(over_ref) of
        Ref when is_reference(Ref) -> erlang:cancel_timer(Ref);
        _ -> ok
    end,
    Now = date:unixtime(),
    case Now - CreateTime >= 10800 of
        true ->
            Fun = fun (#exquisite_shelf_wave_info{map_pid =
                                                      MapPid}) ->
                          map:stop(MapPid)
                  end,
            lists:foreach(Fun, WaveInfo),
            exquisite_shelf_mgr:delete_shelf(ShelfId),
            [role:apply(async,
                        RoleId,
                        {exquisite_shelf_role,
                         callback,
                         [apply_stop_challenge]})
             || RoleId <- Challenges],
            {stop, normal, State};
        false ->
            OverRef = erlang:send_after(60000, self(), check_over),
            put(over_ref, OverRef),
            {noreply, State}
    end;
handle_info({boss_move, UnitId, MapBaseId}, State) ->
    logger:debug("通知移动:~w", [UnitId], exquisite_shelf, 276),
    {MoveX, MoveY} = {1388, 728},
    unit:order(UnitId,
               #unit_order{type = 2, order = move,
                           arg = {MapBaseId, MoveX, MoveY}}),
    erlang:send_after(1500,
                      self(),
                      {boss_move_end, UnitId}),
    {noreply, State};
handle_info(create_next_unit, State) ->
    case get(create_unit_ref) of
        Ref when is_reference(Ref) -> erlang:cancel_timer(Ref);
        _ -> ok
    end,
    create_next_unit(State),
    {noreply, State};
handle_info({boss_move_end, {BattleId, UnitId}},
            State = #exquisite_shelf_util{wave = Wave,
                                          challenges = RoleIds}) ->
    [role:pack_send(RoleId,
                    20306,
                    {Wave, BattleId, UnitId, 0})
     || RoleId <- RoleIds],
    {noreply, State};
handle_info(_Info, State) ->
    logger:info("shelf_mgr收到未知的协议:~w",
                [_Info],
                exquisite_shelf,
                296),
    {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...",
                [exquisite_shelf],
                exquisite_shelf,
                300),
    logger:info("[~w] 关闭完成",
                [exquisite_shelf],
                exquisite_shelf,
                301),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

create_show_unit(UtilWave, ShelfLev, MapId, BattleId)
    when UtilWave =< 6 ->
    Fun = fun (Wave, Rtn) ->
                  case exquisite_shelf_mgr:lookup_wave_unit({Wave,
                                                             ShelfLev})
                      of
                      UnitId when is_integer(UnitId) andalso UnitId =/= 0 ->
                          case exquisite_shelf_data:get_unit_pos(Wave) of
                              {PosX, PosY, Dir} ->
                                  ShowUnitId =
                                      exquisite_shelf_data:get_show_unit(UnitId),
                                  case unit_mgr:create({BattleId, ShowUnitId},
                                                       ShowUnitId,
                                                       {MapId, PosX, PosY})
                                      of
                                      {ok, Unit = #unit{pos = Pos}} ->
                                          logger:debug("======create_show_unit=:~w,设置dir:~w",
                                                       [Pos, Dir],
                                                       exquisite_shelf,
                                                       320),
                                          unit_mgr:set_element(Unit,
                                                               [{pos,
                                                                 Pos#pos{dir =
                                                                             Dir}}]),
                                          ok;
                                      _ -> ok
                                  end,
                                  [{Wave, {BattleId, UnitId}} | Rtn];
                              _ -> Rtn
                          end;
                      _ -> Rtn
                  end
          end,
    lists:foldl(Fun, [], lists:seq(1, 6));
create_show_unit(Wave, ShelfLev, MapId, BattleId) ->
    case exquisite_shelf_mgr:lookup_wave_unit({Wave,
                                               ShelfLev})
        of
        UnitId when is_integer(UnitId) andalso UnitId =/= 0 ->
            case exquisite_shelf_data:get_unit_pos(Wave) of
                {PosX, PosY, _Dir} ->
                    unit_mgr:create({BattleId, UnitId},
                                    UnitId,
                                    {MapId, PosX, PosY}),
                    [{Wave, {BattleId, UnitId}}];
                _ -> []
            end;
        _ -> []
    end.

create_map(BattleId, ShelfLev) ->
    case create_low_map(BattleId, ShelfLev) of
        LowWaveInfo = [_ | _] ->
            case create_high_map(BattleId, ShelfLev) of
                HighWaveInfo = [_ | _] -> LowWaveInfo ++ HighWaveInfo;
                _Err ->
                    logger:error("创建玲珑宝阁地图失败:~w",
                                 [_Err],
                                 exquisite_shelf,
                                 351),
                    _Err
            end;
        _Err ->
            logger:error("创建玲珑宝阁地图失败:~w",
                         [_Err],
                         exquisite_shelf,
                         355),
            _Err
    end.

create_low_map(BattleId, ShelfLev) ->
    MapBaseId = exquisite_shelf_data:get_map(6),
    case create_map_info(6, ShelfLev, MapBaseId, BattleId)
        of
        WaveInfo = #exquisite_shelf_wave_info{} ->
            LowWaves = lists:seq(1, 6 - 1),
            OtherWaveInfo = [WaveInfo#exquisite_shelf_wave_info{wave
                                                                    = Wave}
                             || Wave <- LowWaves],
            [WaveInfo | OtherWaveInfo];
        {false, Reason} -> {false, Reason};
        _ -> lang:get("创建单位失败")
    end.

create_high_map(BattleId, ShelfLev) ->
    MapBaseId = exquisite_shelf_data:get_map(7),
    case create_map_info(7, ShelfLev, MapBaseId, BattleId)
        of
        WaveInfo = #exquisite_shelf_wave_info{units = Units} ->
            LowWaves = lists:seq(9 - 1, 9),
            OtherWaveInfo = [begin
                                 NewUnits = [{Wave, UnitId}
                                             || {_, UnitId} <- Units],
                                 WaveInfo#exquisite_shelf_wave_info{wave = Wave,
                                                                    units =
                                                                        NewUnits}
                             end
                             || Wave <- LowWaves],
            [WaveInfo | OtherWaveInfo];
        {false, Reason} -> {false, Reason};
        _ -> lang:get("创建单位失败")
    end.

create_map_info(Wave, ShelfLev, MapBaseId, BattleId) ->
    logger:debug("===========create_map_info:~w",
                 [{Wave, ShelfLev, MapBaseId, BattleId}],
                 exquisite_shelf,
                 402),
    case map_mgr:create(MapBaseId) of
        {ok, MapPid, MapId} ->
            Units = create_show_unit(Wave,
                                     ShelfLev,
                                     MapId,
                                     BattleId),
            #exquisite_shelf_wave_info{wave = Wave,
                                       map_base_id = MapBaseId,
                                       map_pid = MapPid, map_id = MapId,
                                       units = Units};
        _Else ->
            logger:debug("创建地图失败==========：~w",
                         [_Else],
                         exquisite_shelf,
                         408),
            {false, lang:get("创建地图失败")}
    end.

remove_kill_unit(#exquisite_shelf_util{wave = Wave,
                                       wave_info = WaveInfo}) ->
    case lists:keyfind(Wave,
                       #exquisite_shelf_wave_info.wave,
                       WaveInfo)
        of
        #exquisite_shelf_wave_info{units = Units} ->
            case lists:keyfind(Wave, 1, Units) of
                {_, UnitId} -> unit_mgr:remove(UnitId);
                _ -> ok
            end;
        _ -> ok
    end.

create_next_unit(#exquisite_shelf_util{wave = Wave,
                                       battle_id = BattleId,
                                       wave_info = WaveInfo,
                                       challenges = Challenges}) ->
    case Wave of
        _ when Wave =< 6 ->
            case lists:keyfind(Wave,
                               #exquisite_shelf_wave_info.wave,
                               WaveInfo)
                of
                #exquisite_shelf_wave_info{map_id = MapId,
                                           units = Units} ->
                    case lists:keyfind(Wave, 1, Units) of
                        {_, {_, UnitId}} ->
                            ShowUnitId =
                                exquisite_shelf_data:get_show_unit(UnitId),
                            unit_mgr:remove({BattleId, ShowUnitId}),
                            {PosX, PosY, _Dir} =
                                exquisite_shelf_data:get_unit_pos(Wave),
                            case unit_mgr:create({BattleId, UnitId},
                                                 UnitId,
                                                 {MapId, PosX, PosY})
                                of
                                {ok, _Unit} ->
                                    [role:pack_send(RoleId,
                                                    20306,
                                                    {Wave, BattleId, UnitId, 1})
                                     || RoleId <- Challenges],
                                    info(self(),
                                         {boss_move,
                                          {BattleId, UnitId},
                                          53007});
                                _Err ->
                                    logger:error("创建玲珑宝阁战斗单位出错:~w",
                                                 [_Err],
                                                 exquisite_shelf,
                                                 444),
                                    ingore
                            end;
                        _Err ->
                            logger:error("创建玲珑宝阁战斗单位出错:~w",
                                         [_Err],
                                         exquisite_shelf,
                                         448),
                            ingore
                    end;
                _ -> ingore
            end;
        _ ->
            case lists:keyfind(Wave,
                               #exquisite_shelf_wave_info.wave,
                               WaveInfo)
                of
                #exquisite_shelf_wave_info{units = Units} ->
                    case lists:keyfind(Wave, 1, Units) of
                        {_, {_, UnitId}} ->
                            [role:pack_send(RoleId,
                                            20306,
                                            {Wave, BattleId, UnitId, 1})
                             || RoleId <- Challenges],
                            erlang:send_after(3000,
                                              self(),
                                              {boss_move,
                                               {BattleId, UnitId},
                                               53008});
                        _Err ->
                            logger:error("创建玲珑宝阁战斗单位出错:~w",
                                         [_Err],
                                         exquisite_shelf,
                                         462),
                            ingore
                    end;
                _ -> ingore
            end
    end.

