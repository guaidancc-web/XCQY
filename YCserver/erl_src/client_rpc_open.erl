-file("src/mod/client/client_rpc_open.erl", 1).

-module(client_rpc_open).

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

-file("src/mod/client/client_rpc_open.erl", 10).

-file("inc/conn.hrl", 1).

-record(conn,
        {object :: undefined | connector | role,
         type = tester :: game_server | monitor | tester,
         account = "" :: list(),
         need_cdkey = 0,
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         channel_reg = 0 :: non_neg_integer(),
         dispense = "" :: list(),
         device_id = "",
         device_type = 1,
         role_id = 0 :: non_neg_integer(),
         pid_object :: undefined | pid(),
         socket :: undefined | port(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 1 :: pos_integer(),
         connect_time = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         recv_count = 0 :: non_neg_integer(),
         last_recv_count = 0 :: non_neg_integer(),
         send_count = 0 :: non_neg_integer(),
         error_send = 0 :: non_neg_integer(),
         bad_req_count = 0 :: non_neg_integer(),
         loop_counter = 0 :: non_neg_integer(),
         length = 0 :: non_neg_integer(),
         seq = 0 :: non_neg_integer(),
         read_head = false :: boolean(),
         bad_heart_time = 0,
         exact_heart_time = 0}).

-file("src/mod/client/client_rpc_open.erl", 11).

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

-file("src/mod/client/client_rpc_open.erl", 12).

handle(1020, {}, #conn{account = _Account}) ->
    logger:debug("账号[~ts]请求正常退出",
                 [_Account],
                 client_rpc_open,
                 22),
    stop;
handle(1010,
       {Account,
        _ClientType,
        Platform,
        ZoneId,
        ChannelReg,
        Dispense,
        DeviceId,
        DeviceType,
        UseId,
        Ts,
        Ticket},
       Conn = #conn{ip = Ip = {P1, P2, P3, P4}, port = Port,
                    account = ""}) ->
    Account1 = string:strip(Account),
    case auth_ticket(Account1,
                     Platform,
                     UseId,
                     Ts,
                     Ticket,
                     "",
                     "")
        of
        true ->
            case ip_mgr:is_blocked(Ip) of
                false ->
                    case catch forbid_check(Platform, ChannelReg) of
                        true ->
                            logger:debug("帐号[~ts]的平台[~ts]渠道[~w]已经被限制登陆新服",
                                         [Account1, Platform, ChannelReg],
                                         client_rpc_open,
                                         34),
                            {reply, {0, lang:get("该平台渠道新服已经关闭"), []}};
                        _ ->
                            case ip_mgr:is_max(Ip) of
                                true ->
                                    logger:debug("帐号[~ts]的IP[~w]已经达到连接上限",
                                                 [Account1, Ip],
                                                 client_rpc_open,
                                                 39),
                                    {reply, {0, lang:get("当前IP已经达到连接上限"), []}};
                                false ->
                                    logger:debug("帐号[~ts]的客户端[~w]验证通过",
                                                 [Account1, _ClientType],
                                                 client_rpc_open,
                                                 42),
                                    erlang:register(list_to_atom(lists:concat(["conn_",
                                                                               binary_to_list(unicode:characters_to_binary(Account1)),
                                                                               "_",
                                                                               P1,
                                                                               "_",
                                                                               P2,
                                                                               "_",
                                                                               P3,
                                                                               "_",
                                                                               P4,
                                                                               "_",
                                                                               Port])),
                                                    self()),
                                    NewConn = Conn#conn{account = Account1,
                                                        platform = Platform,
                                                        zone_id = ZoneId,
                                                        channel_reg =
                                                            ChannelReg,
                                                        dispense = Dispense,
                                                        device_id = DeviceId,
                                                        device_type =
                                                            DeviceType},
                                    NewLocals = case env:get(combine) of
                                                    Locals
                                                        when is_list(Locals) ->
                                                        Locals;
                                                    _ -> []
                                                end,
                                    Local = {env:get(platform),
                                             env:get(zone_id)},
                                    List = [Local | NewLocals],
                                    {reply, {1, "", List}, NewConn}
                            end
                    end;
                true ->
                    logger:debug("帐号[~ts]的IP[~w]被封",
                                 [Account1, Ip],
                                 client_rpc_open,
                                 55),
                    {reply, {0, lang:get("无法登陆"), []}}
            end;
        {false, Reason} ->
            logger:debug("帐号[~ts]的客户端[~w]验证失败",
                         [Account1, _ClientType],
                         client_rpc_open,
                         59),
            {reply, {0, Reason, []}}
    end;
handle(1011,
       {Account,
        _ClientType,
        Platform,
        ZoneId,
        ChannelReg,
        Dispense,
        DeviceId,
        DeviceType,
        UseId,
        Ts,
        Ticket,
        Guid,
        CpExt},
       Conn = #conn{ip = Ip = {P1, P2, P3, P4}, port = Port,
                    account = ""}) ->
    Account1 = string:strip(Account),
    case auth_ticket(Account1,
                     Platform,
                     UseId,
                     Ts,
                     Ticket,
                     Guid,
                     CpExt)
        of
        true ->
            case ip_mgr:is_blocked(Ip) of
                false ->
                    case catch forbid_check(Platform, ChannelReg) of
                        true ->
                            logger:debug("帐号[~ts]的平台[~ts]渠道[~w]已经被限制登陆新服",
                                         [Account1, Platform, ChannelReg],
                                         client_rpc_open,
                                         72),
                            {reply, {0, lang:get("该平台渠道新服已经关闭"), []}};
                        _ ->
                            case ip_mgr:is_max(Ip) of
                                true ->
                                    logger:debug("帐号[~ts]的IP[~w]已经达到连接上限",
                                                 [Account1, Ip],
                                                 client_rpc_open,
                                                 77),
                                    {reply, {0, lang:get("当前IP已经达到连接上限"), []}};
                                false ->
                                    logger:debug("帐号[~ts]的客户端[~w]验证通过",
                                                 [Account1, _ClientType],
                                                 client_rpc_open,
                                                 80),
                                    erlang:register(list_to_atom(lists:concat(["conn_",
                                                                               binary_to_list(unicode:characters_to_binary(Account1)),
                                                                               "_",
                                                                               P1,
                                                                               "_",
                                                                               P2,
                                                                               "_",
                                                                               P3,
                                                                               "_",
                                                                               P4,
                                                                               "_",
                                                                               Port])),
                                                    self()),
                                    NewConn = Conn#conn{account = Account1,
                                                        platform = Platform,
                                                        zone_id = ZoneId,
                                                        channel_reg =
                                                            ChannelReg,
                                                        dispense = Dispense,
                                                        device_id = DeviceId,
                                                        device_type =
                                                            DeviceType},
                                    NewLocals = case env:get(combine) of
                                                    Locals
                                                        when is_list(Locals) ->
                                                        Locals;
                                                    _ -> []
                                                end,
                                    Local = {env:get(platform),
                                             env:get(zone_id)},
                                    List = [Local | NewLocals],
                                    sys_conn:pack_send(self(),
                                                       1010,
                                                       {1, "", List}),
                                    {ok, NewConn}
                            end
                    end;
                true ->
                    logger:debug("帐号[~ts]的IP[~w]被封",
                                 [Account1, Ip],
                                 client_rpc_open,
                                 94),
                    sys_conn:pack_send(self(),
                                       1010,
                                       {0, lang:get("无法登陆"), []})
            end;
        {false, Reason} ->
            logger:debug("帐号[~ts]的客户端[~w]验证失败",
                         [Account1, _ClientType],
                         client_rpc_open,
                         98),
            sys_conn:pack_send(self(), 1010, {0, Reason, []}),
            ok
    end;
handle(1099, {Ping}, Conn) ->
    case speedup_check(true, Ping, Conn) of
        stop -> stop;
        {true, Ping, ServerTime} -> {reply, {Ping, ServerTime}};
        {true, Ping, ServerTime, NewConn} ->
            {reply, {Ping, ServerTime}, NewConn}
    end;
handle(1097, {Platform}, _Conn) ->
    Version = server_list_data:get_version(Platform),
    {reply, {Version}};
handle(_Cmd, _Data, _Role) ->
    logger:debug("无效的RPC调用[~w]: ~w",
                 [_Cmd, _Data],
                 client_rpc_open,
                 122),
    {error, unknow_command}.

auth_ticket(Account, Platform, _UseId, _Ts, _Ticket,
            _Guid, _CpExt) ->
    case client_auth:check_open(Platform, Account) of
        true -> true;
        {false, Reason} -> {false, Reason}
    end.

speedup_check(false, Ping, _) ->
    ServerTime = date:unixtime(),
    {true, Ping, ServerTime};
speedup_check(_, Ping,
              Conn = #conn{account = _Account,
                           bad_heart_time = OldBadHeartTime,
                           exact_heart_time = OldExactHeartTime,
                           pid_object = _RolePid}) ->
    ServerTime = date:unixtime(),
    case get(last_heart_time) of
        undefined ->
            put(last_heart_time, ServerTime),
            NewConn = Conn#conn{bad_heart_time = 0,
                                exact_heart_time = 1},
            {true, Ping, ServerTime, NewConn};
        ServerTime ->
            logger:debug("重复的心跳包:~ts, 进程pid:~w",
                         [_Account, self()],
                         client_rpc_open,
                         181),
            {true, Ping, ServerTime};
        LastHeartTime ->
            put(last_heart_time, ServerTime),
            case ServerTime =< LastHeartTime + 7 of
                true ->
                    NewExactHeartTime = 0,
                    NewBadHeartTime = OldBadHeartTime + 1,
                    NewConn = Conn#conn{bad_heart_time = NewBadHeartTime,
                                        exact_heart_time = NewExactHeartTime},
                    if NewBadHeartTime >= 6 ->
                           logger:debug("关闭角色--NewBadHeartTime:~w, NewExactHeartTime:~w",
                                        [NewBadHeartTime, NewExactHeartTime],
                                        client_rpc_open,
                                        192),
                           ConnPid = self(),
                           spawn(fun () ->
                                         sys_conn:pack_send(ConnPid,
                                                            14701,
                                                            {"0",
                                                             lang:get("网络不稳定，请重新开启游戏")}),
                                         util:sleep(500),
                                         erlang:exit(ConnPid, kill)
                                 end),
                           {true, Ping, ServerTime, NewConn};
                       NewBadHeartTime >= 3 ->
                           logger:debug("警告--NewBadHeartTime:~w, NewExactHeartTime:~w",
                                        [NewBadHeartTime, NewExactHeartTime],
                                        client_rpc_open,
                                        202),
                           notice:send({conn_pid, self()},
                                       3,
                                       lang:get("网络不稳定中，请切换到稳定网络")),
                           {true, Ping, ServerTime, NewConn};
                       true ->
                           logger:debug("错误计数--NewBadHeartTime:~w, NewExactHeartTime:~w",
                                        [NewBadHeartTime, NewExactHeartTime],
                                        client_rpc_open,
                                        206),
                           {true, Ping, ServerTime, NewConn}
                    end;
                false ->
                    NewExactHeartTime = min(20, OldExactHeartTime + 1),
                    NewBadHeartTime = case NewExactHeartTime >= 8 of
                                          true -> 0;
                                          false -> OldBadHeartTime
                                      end,
                    NewConn = Conn#conn{bad_heart_time = NewBadHeartTime,
                                        exact_heart_time = NewExactHeartTime},
                    {true, Ping, ServerTime, NewConn}
            end
    end.

forbid_check(Platform, ChannelReg) ->
    case server_list_data:get_forbid() of
        [] -> false;
        ForbidList when is_list(ForbidList) ->
            case lists:member({Platform, ChannelReg}, ForbidList) of
                true ->
                    case env:srv_open_time() of
                        0 -> false;
                        OpenTime when is_integer(OpenTime) ->
                            OpenTime >=
                                date:datetime_to_seconds({{2019, 1, 23},
                                                          {0, 0, 0}});
                        _ -> false
                    end;
                _ -> false
            end;
        _ -> false
    end.

