-file("src/mod/client/client_rpc.erl", 1).

-module(client_rpc).

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

-file("src/mod/client/client_rpc.erl", 10).

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

-file("src/mod/client/client_rpc.erl", 11).

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

-file("src/mod/client/client_rpc.erl", 12).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/client/client_rpc.erl", 13).

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

-file("src/mod/client/client_rpc.erl", 14).

-file("inc/group.hrl", 1).

-record(member,
        {pid :: undefined | pid(),
         conn_pid :: undefined | pid()}).

-file("src/mod/client/client_rpc.erl", 15).

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

-file("src/mod/client/client_rpc.erl", 16).

handle(1100, {},
       Conn = #conn{account = Account, platform = P}) ->
    L = case role_data:list(Account, P) of
            L1 = [_ | _] -> L1;
            _ -> []
        end,
    NeedCdkey = client_auth:check_cdkey(Account),
    {reply,
     {"", L, NeedCdkey},
     Conn#conn{need_cdkey = NeedCdkey}};
handle(1110, {_, _, _, _}, #conn{need_cdkey = 1}) ->
    {reply, return_false(lang:get("需要先激活账号才能创建角色"))};
handle(1110, {"", _, _, _}, #conn{}) ->
    {reply, return_false(lang:get("角色名不能为空"))};
handle(1110, {_, _, _, _},
       #conn{pid_object = ObjectPid})
    when ObjectPid =/= undefined ->
    {reply,
     return_false(lang:get("当前客户端连接进程已经关联了某个角色，不能重复登录"))};
handle(1110, {Name, Sex, Classes, Z},
       Conn = #conn{account = Acc, socket = Socket, ip = Ip,
                    port = Port, platform = P, channel_reg = ChannelReg,
                    dispense = Dispense, device_id = DeviceId,
                    device_type = DeviceType})
    when Classes >= 1 andalso
             Classes =< 7 andalso (Sex =:= 0 orelse Sex =:= 1) ->
    Link = #link{socket = Socket, conn_pid = self(),
                 ip = Ip, port = Port},
    case util:check_name(Name) of
        {false, Reason} -> {reply, return_false(Reason)};
        ok ->
            T1 = date:unixtime(),
            case role_query:local_cache(by_acc, Acc, P, Z) of
                {ok, #role_cache{}} ->
                    {reply, return_false(lang:get("当前区服已有角色在线, 无法创建"))};
                {error, not_found} ->
                    T2 = date:unixtime(),
                    case role_data:local_fetch(by_acc, Acc, P, Z) of
                        {ok, _} ->
                            {reply, return_false(lang:get("当前区服已有角色, 无法创建"))};
                        {error, role_data_not_found} ->
                            T3 = date:unixtime(),
                            case role_data:create(Acc,
                                                  P,
                                                  Z,
                                                  Name,
                                                  Sex,
                                                  Classes,
                                                  self())
                                of
                                {ok, Role} ->
                                    NRole = Role#role{channel_reg = ChannelReg,
                                                      dispense = Dispense,
                                                      ip_reg = Ip,
                                                      time_reg =
                                                          date:unixtime(),
                                                      device_id = DeviceId,
                                                      device_type = DeviceType},
                                    case role_data:create_save(NRole) of
                                        {false, Reason} ->
                                            {reply, return_false(Reason)};
                                        ok ->
                                            role_start(NRole,
                                                       Link,
                                                       Conn,
                                                       T1,
                                                       T2,
                                                       T3,
                                                       create)
                                    end;
                                {false, Reason} ->
                                    {reply, return_false(Reason)};
                                {error, Err} ->
                                    logger:error("创建角色[account:~ts, platform:~ts, zone_id:~w]时发"
                                                 "生异常: ~w",
                                                 [Acc, P, Z, Err],
                                                 client_rpc,
                                                 78),
                                    {reply,
                                     return_false(lang:get("暂时无法创建新的角色，请稍后再试"))}
                            end;
                        {error, Err} ->
                            logger:error("角色[account:~ts, platform:~ts, zone_id:~w]登录时发"
                                         "生异常: ~w",
                                         [Acc, P, Z, Err],
                                         client_rpc,
                                         82),
                            {reply, return_false(lang:get("角色登录系统暂时不可用，请稍后再试"))}
                    end
            end
    end;
handle(1120, {_Z}, #conn{need_cdkey = 1}) ->
    {reply, return_false(lang:get("当前账号需要激活才能登陆角色"))};
handle(1120, {_Z}, #conn{pid_object = ObjectPid})
    when ObjectPid =/= undefined ->
    {reply,
     return_false(lang:get("当前客户端连接进程已经关联了某个角色，不能重复登录"))};
handle(1120, {Z},
       Conn = #conn{account = Acc, socket = Socket, ip = Ip,
                    port = Port, platform = P, device_id = DeviceId,
                    device_type = DeviceType}) ->
    Link = #link{socket = Socket, conn_pid = self(),
                 ip = Ip, port = Port},
    T1 = date:unixtime(),
    case role_query:local_pid(by_acc, Acc, P, Z) of
        {ok, Pid} when is_pid(Pid) ->
            role_switch(Pid, Link, Conn);
        {error, not_found} ->
            T2 = date:unixtime(),
            case role_data:local_fetch(by_acc, Acc, P, Z) of
                {ok, Role} ->
                    T3 = date:unixtime(),
                    case adm_api:login_check(Role) of
                        {ok, NewRole} ->
                            NewRole1 = NewRole#role{device_id = DeviceId,
                                                    device_type = DeviceType},
                            role_start(NewRole1, Link, Conn, T1, T2, T3, login);
                        {false, Reason} -> {reply, return_false(Reason)}
                    end;
                {error, role_data_not_found} ->
                    {reply, return_false(lang:get("当前区服没有角色"))};
                {error, Err} ->
                    logger:error("加载角色数据[account:~ts, platform:~ts, zone_id:~w]"
                                 "时发生异常: ~w",
                                 [Acc, P, Z, Err],
                                 client_rpc,
                                 114),
                    {reply, return_false(lang:get("加载角色数据时发生异常"))}
            end;
        {error, Err} ->
            logger:error("角色[account:~ts, platform:~ts, zone_id:~w]登录时发"
                         "生异常: ~w",
                         [Acc, P, Z, Err],
                         client_rpc,
                         118),
            {reply, return_false(lang:get("角色登录系统暂时不可用，请稍后再试"))};
        _Err ->
            logger:error("角色[account:~ts, platform:~ts, zone_id:~w]登录时发"
                         "生异常: ~w",
                         [Acc, P, Z, _Err],
                         client_rpc,
                         121),
            {reply, return_false(lang:get("角色登录系统暂时不可用，请稍后再试"))}
    end;
handle(_Cmd, _Data, _Role) ->
    logger:debug("模块[~w]收到无效的RPC调用[~w]: ~w",
                 [client_rpc, _Cmd, _Data],
                 client_rpc,
                 127),
    {error, unknow_command}.

role_switch(Pid, Link, Conn) ->
    case role:apply(sync, Pid, {fun fix_link/2, [Link]}) of
        {true, Return} ->
            {reply,
             Return,
             Conn#conn{object = role, pid_object = Pid}};
        {false, Return} -> {reply, Return};
        _ERR ->
            logger:debug("_ERR:~w", [_ERR], client_rpc, 142),
            {reply, return_false(lang:get("登录角色失败，请稍后重试"))}
    end.

role_start(Role = #role{id = Rid = {_, P, Z},
                        name = Name, account = Acc},
           Link = #link{ip = Ip}, Conn, T1, T2, T3, Mod) ->
    T4 = date:unixtime(),
    catch log_account:update(Role),
    case role:start(Role#role{link = Link,
                              ip_last_login = Ip})
        of
        {ok, Pid} ->
            erlang:link(Pid),
            Now = date:unixtime(),
            case Now - T1 > 5 of
                true ->
                    logger:error("角色[name:~ts, acc:~ts, id:~w]登录耗时：查cache角色是否在线"
                                 "T1:~w, 查寻角色T2:~w 检查登录T3:~w 启动进程T4:~w "
                                 "mod:~w",
                                 [Name,
                                  Acc,
                                  Rid,
                                  Now - T1,
                                  Now - T2,
                                  Now - T3,
                                  Now - T4,
                                  Mod],
                                 client_rpc,
                                 156);
                _ ->
                    logger:debug("登录[name:~ts, acc:~ts, id:~w]耗时：T1:~w, "
                                 "T2:~w T3:~w T4:~w mod:~w",
                                 [Name,
                                  Acc,
                                  Rid,
                                  Now - T1,
                                  Now - T2,
                                  Now - T3,
                                  Now - T4,
                                  Mod],
                                 client_rpc,
                                 158)
            end,
            {reply,
             return_true("", Role),
             Conn#conn{object = role, pid_object = Pid}};
        {error, {already_started, _}} ->
            LocalName = list_to_atom(lists:concat(["role_",
                                                   binary_to_list(unicode:characters_to_binary(Acc)),
                                                   "_",
                                                   P,
                                                   "_",
                                                   Z])),
            erlang:send(LocalName, {disconnect, normal_exit}),
            {reply, return_false(lang:get("角色已经在线，不能重复登录"))};
        Err ->
            logger:error("启动角色进程时发生异常: ~w", [Err], client_rpc, 166),
            {reply, return_false(lang:get("启动角色时发生异常"))}
    end.

-spec fix_link(Role, NewLink) -> {ok,
                                  Reply,
                                  NewRole} when Role :: #role{},
                                                NewLink :: #link{},
                                                Reply :: boolean(),
                                                NewRole :: #role{}.

fix_link(Role = #role{name = _Name,
                      cross_type = CrossType, pid = Pid,
                      link = #link{conn_pid = ConnPid},
                      pos = #pos{map_pid = MapPid}},
         NewLink = #link{conn_pid = NewConnPid,
                         ip = NewLoginIp}) ->
    logger:debug("角色[~ts]顶号上线", [_Name], client_rpc, 177),
    NewRole = Role#role{link = NewLink,
                        ip_last_login = NewLoginIp},
    role_group:leave(world, Pid),
    role_group:join(world,
                    #member{pid = Pid, conn_pid = NewConnPid}),
    case CrossType of
        1 ->
            cross:cast(role_group, leave, [center_world, Pid]),
            cross:cast(role_group,
                       join,
                       [center_world,
                        #member{pid = Pid, conn_pid = NewConnPid}]);
        _ -> ignore
    end,
    erlang:unlink(ConnPid),
    erlang:link(NewConnPid),
    put(conn_pid, NewConnPid),
    map:role_update_conn_pid(MapPid,
                             Pid,
                             ConnPid,
                             NewConnPid),
    case erase(disconnect_status) of
        {_, _, Ref} -> erlang:cancel_timer(Ref);
        _ -> ignore
    end,
    spawn(fun () ->
                  sys_conn:pack_send(ConnPid,
                                     9901,
                                     {1, lang:get("当前角色已经在别处登录，你被迫下线。")}),
                  util:sleep(500),
                  erlang:exit(ConnPid, kill)
          end),
    role_query:sync_cache(NewRole),
    role_query:sync_index(NewRole),
    {ok,
     {true, return_true("", NewRole)},
     role_misc:switch(NewRole)};
fix_link(_Role, _NewLink) ->
    {ok, {false, return_false(lang:get("角色正在登录，不能重复登录"))}}.

return_false(Msg) -> {0, Msg, 0, "", 0, "", 0, 0, 0, 0}.

return_true(Msg,
            #role{id = {Id, Platform, ZoneId}, name = Name,
                  lev = Lev, time_reg = TimeReg,
                  assets = #assets{gold = Gold}}) ->
    NewLev = max(1, Lev),
    {1,
     Msg,
     Id,
     Platform,
     ZoneId,
     Name,
     NewLev,
     0,
     Gold,
     TimeReg}.

