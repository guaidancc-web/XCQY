-file("src/mod/black_white_chess/camp_black_white_ch"
      "ess_rpc.erl",
      1).

-module(camp_black_white_chess_rpc).

-export([handle/3]).

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

-file("src/mod/black_white_chess/camp_black_white_ch"
      "ess_rpc.erl",
      5).

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

-file("src/mod/black_white_chess/camp_black_white_ch"
      "ess_rpc.erl",
      5).

handle(20900, {},
       Role = #role{id = RoleId, s_event = Event,
                    s_event_pid = EventPid, cross_type = _CrossType}) ->
    Reply = case Event =:= 68 of
                true ->
                    case big_world:is_connect() of
                        {true, _} ->
                            logger:debug("跨服调用00",
                                         [],
                                         camp_black_white_chess_rpc,
                                         12),
                            big_world:call(camp_black_white_chess,
                                           call,
                                           [EventPid,
                                            {get_player_information,
                                             #{role_id => RoleId}}]);
                        _ ->
                            logger:debug("本服调用01",
                                         [],
                                         camp_black_white_chess_rpc,
                                         15),
                            camp_black_white_chess:call(EventPid,
                                                        {get_player_information,
                                                         #{role_id => RoleId}})
                    end;
                _ ->
                    camp_black_white_chess:get_self_information_to_20900(Role)
            end,
    logger:debug("Reply ~w ",
                 [Reply],
                 camp_black_white_chess_rpc,
                 21),
    {reply, Reply};
handle(20901, {},
       _Role = #role{s_event = Event, s_event_pid = EventPid,
                     cross_type = _CrossType}) ->
    case Event =:= 68 of
        true ->
            case big_world:is_connect() of
                {true, _} ->
                    big_world:cast(camp_black_white_chess,
                                   cast,
                                   [EventPid, {push_chess}]),
                    ok;
                _ ->
                    camp_black_white_chess:cast(EventPid, {push_chess}),
                    ok
            end;
        _ -> ok
    end;
handle(20903, {MsgNum},
       _Role = #role{id = RoleId, cross_type = _CrossType,
                     s_event = Event, s_event_pid = EventPid}) ->
    case Event =:= 68 of
        true ->
            case big_world:is_connect() of
                {true, _} ->
                    logger:debug("33333",
                                 [],
                                 camp_black_white_chess_rpc,
                                 49),
                    big_world:cast(camp_black_white_chess,
                                   cast,
                                   [EventPid,
                                    {say,
                                     #{role_id => RoleId, msg_id => MsgNum}}]);
                _ ->
                    logger:debug("22222",
                                 [],
                                 camp_black_white_chess_rpc,
                                 52),
                    logger:debug("isPid~w",
                                 [erlang:is_pid(EventPid)],
                                 camp_black_white_chess_rpc,
                                 53),
                    camp_black_white_chess:cast(EventPid,
                                                {say,
                                                 #{role_id => RoleId,
                                                   msg_id => MsgNum}})
            end,
            ok;
        _ ->
            logger:debug("当前不在活动中",
                         [],
                         camp_black_white_chess_rpc,
                         58),
            ok
    end;
handle(20904, {},
       _Role = #role{id = RoleId, pid = Pid, s_event = Event,
                     s_event_pid = EventPid, cross_type = _CrossType}) ->
    logger:debug("进行求和",
                 [],
                 camp_black_white_chess_rpc,
                 69),
    case Event =:= 68 of
        true ->
            case big_world:is_connect() of
                {true, _} ->
                    big_world:cast(camp_black_white_chess,
                                   cast,
                                   [EventPid,
                                    {ask_draw,
                                     #{role_id => RoleId, pid => Pid}}]);
                _ ->
                    camp_black_white_chess:cast(EventPid,
                                                {ask_draw,
                                                 #{role_id => RoleId,
                                                   pid => Pid}})
            end,
            ok;
        _ ->
            logger:debug("玩家不在活动中",
                         [],
                         camp_black_white_chess_rpc,
                         80),
            ok
    end;
handle(20905, {Result},
       _Role = #role{id = RoleId, pid = Pid, s_event = Event,
                     s_event_pid = EventPid, cross_type = _CrossType}) ->
    logger:debug("进行回应求和",
                 [],
                 camp_black_white_chess_rpc,
                 89),
    case Event =:= 68 of
        true ->
            case big_world:is_connect() of
                {true, _} ->
                    big_world:cast(camp_black_white_chess,
                                   cast,
                                   [EventPid,
                                    {reply_draw,
                                     #{role_id => RoleId, pid => Pid,
                                       result => Result}}]);
                _ ->
                    camp_black_white_chess:cast(EventPid,
                                                {reply_draw,
                                                 #{role_id => RoleId,
                                                   pid => Pid,
                                                   result => Result}})
            end,
            ok;
        _ ->
            logger:debug("玩家不在活动中",
                         [],
                         camp_black_white_chess_rpc,
                         100),
            ok
    end;
handle(20906, {},
       _Role = #role{id = RoleId, pid = Pid, s_event = Event,
                     s_event_pid = EventPid, cross_type = _CrossType}) ->
    case Event =:= 68 of
        true ->
            case big_world:is_connect() of
                {true, _} ->
                    big_world:cast(camp_black_white_chess,
                                   cast,
                                   [EventPid,
                                    {give_up,
                                     #{role_id => RoleId, pid => Pid}}]);
                _ ->
                    camp_black_white_chess:cast(EventPid,
                                                {give_up,
                                                 #{role_id => RoleId,
                                                   pid => Pid}})
            end,
            ok;
        _ ->
            logger:debug("玩家不在活动中",
                         [],
                         camp_black_white_chess_rpc,
                         118),
            ok
    end;
handle(20907, {X, Y},
       _Role = #role{id = RoleId, cross_type = _CrossType,
                     s_event = Event, s_event_pid = EventPid}) ->
    case Event =:= 68 of
        true ->
            Reply = case big_world:is_connect() of
                        {true, _} ->
                            big_world:call(camp_black_white_chess,
                                           call,
                                           [EventPid,
                                            {place_chess, RoleId, X, Y}]);
                        _ ->
                            camp_black_white_chess:call(EventPid,
                                                        {place_chess,
                                                         RoleId,
                                                         X,
                                                         Y})
                    end,
            logger:debug("Reply:~w",
                         [Reply],
                         camp_black_white_chess_rpc,
                         134),
            {reply, Reply};
        _ -> ok
    end;
handle(20908, {}, Role) ->
    logger:debug("龙凤棋开始匹配",
                 [],
                 camp_black_white_chess_rpc,
                 141),
    Result = case big_world:is_connect() of
                 {true, _} ->
                     logger:debug("big_world调用",
                                  [],
                                  camp_black_white_chess_rpc,
                                  144),
                     big_world:call(camp_black_white_chess_mgr,
                                    new_match,
                                    [Role]);
                 _ ->
                     logger:debug("本服调用",
                                  [],
                                  camp_black_white_chess_rpc,
                                  147),
                     camp_black_white_chess_mgr:new_match(Role)
             end,
    case Result of
        ok -> ok;
        {ok, NewRole, Msg} -> {reply, {1, Msg}, NewRole};
        {false, Reason} ->
            logger:debug("=-===== ~ts",
                         [Reason],
                         camp_black_white_chess_rpc,
                         155),
            {reply, {0, Reason}}
    end;
handle(20909, {}, Role) ->
    logger:debug("龙凤棋取消匹配",
                 [],
                 camp_black_white_chess_rpc,
                 160),
    Result = case big_world:is_connect() of
                 {true, _} ->
                     logger:debug("big_world调用",
                                  [],
                                  camp_black_white_chess_rpc,
                                  163),
                     big_world:call(camp_black_white_chess_mgr,
                                    cancle_match,
                                    [Role]);
                 _ ->
                     logger:debug("本服调用",
                                  [],
                                  camp_black_white_chess_rpc,
                                  166),
                     camp_black_white_chess_mgr:cancle_match(Role)
             end,
    case Result of
        {ok, NewRole, Msg} -> {reply, {1, Msg}, NewRole};
        {flase, Reason} ->
            logger:debug("Reason:~w",
                         [Reason],
                         camp_black_white_chess_rpc,
                         173),
            {reply, {0, Reason}}
    end;
handle(20910, {},
       Role = #role{cross_type = _CrossType}) ->
    logger:debug("aaaaaaaaaaaaaaaaaaaaa",
                 [],
                 camp_black_white_chess_rpc,
                 178),
    Reply = camp_black_white_chess_mgr:get_times(Role),
    logger:debug("~w",
                 [Reply],
                 camp_black_white_chess_rpc,
                 180),
    {reply, Reply};
handle(20912, {RId, Platform, ZoneId}, Role) ->
    FriendId = {RId, Platform, ZoneId},
    logger:debug("收到邀请好友的协议",
                 [],
                 camp_black_white_chess_rpc,
                 186),
    case catch camp_black_white_chess_mgr:invite(Role,
                                                 FriendId)
        of
        Msg = {1, _} -> {reply, Msg};
        Msg = {0, _} -> {reply, Msg};
        _Oth ->
            logger:debug("发生错误:~w",
                         [_Oth],
                         camp_black_white_chess_rpc,
                         193),
            {reply, {0, lang:get("发生错误")}}
    end;
handle(20913, {RId, Platform, ZoneId}, Role) ->
    logger:debug("收到回应好友邀请的协议",
                 [],
                 camp_black_white_chess_rpc,
                 198),
    FriendId = {RId, Platform, ZoneId},
    case catch camp_black_white_chess_mgr:reply_invite(Role,
                                                       #{role_id => FriendId})
        of
        Msg = {1, _} -> {reply, Msg};
        Msg = {0, _} -> {reply, Msg};
        _Oth ->
            logger:debug("发生错误:~w",
                         [_Oth],
                         camp_black_white_chess_rpc,
                         206),
            {reply, {0, lang:get("发生错误")}}
    end;
handle(_Cmd, _Data, _Role) ->
    logger:debug("模块[~w]收到无效的RPC调用[~w]: ~w",
                 [camp_black_white_chess_rpc, _Cmd, _Data],
                 camp_black_white_chess_rpc,
                 213),
    {error, unknow_command}.

