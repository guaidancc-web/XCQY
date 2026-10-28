-file("src/mod/extension/extension_mgr.erl", 1).

-module(extension_mgr).

-behaviour(gen_server).

-export([start_link/0, cast/1, call/1, info/1]).

-export([lookup_role/1,
         insert/1,
         do_async_role_info/2,
         async_role_info/2,
         do_update_role_ship/3,
         push_17502/1]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

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

-file("src/mod/extension/extension_mgr.erl", 30).

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

-file("src/mod/extension/extension_mgr.erl", 31).

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

-file("src/mod/extension/extension_mgr.erl", 32).

-file("inc/extension.hrl", 1).

-record(m_extension,
        {ver = 3,
         init = 0,
         key = "",
         key_time = 0,
         ships = [],
         apply_id = {0, "", 0},
         apply_key = "",
         apply_name = "",
         day_score = 0,
         day_flag = 0}).

-record(extension_key,
        {key, role_id, role_name = "", time}).

-record(extension_role,
        {ver = 2,
         id,
         name,
         apply_id = {0, "", 0},
         apply_key = "",
         apply_name = "",
         key = "",
         key_time = 0,
         ships = [],
         rewarded = [],
         day_score = 0,
         day_flag = 0}).

-record(extension_ship,
        {ver = 2,
         id = {0, "", 0},
         name = "",
         score = 0,
         key = "",
         time = 0,
         activity_score = 0,
         activity_time = []}).

-file("src/mod/extension/extension_mgr.erl", 33).

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

-file("src/mod/extension/extension_mgr.erl", 34).

-record(state, {}).

cast(Args) -> gen_server:cast(extension_mgr, Args).

call(Args) ->
    case catch gen_server:call(extension_mgr, Args, 10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

info(Args) -> extension_mgr ! Args.

start_link() ->
    gen_server:start_link({local, extension_mgr},
                          extension_mgr,
                          [],
                          []).

lookup_role(RoleId) ->
    case catch ets:lookup(ets_extension_role, RoleId) of
        [ExtRole = #extension_role{}] -> {true, ExtRole};
        [] -> null;
        _ -> false
    end.

insert(Data) ->
    ets:insert(ets_extension_role, Data),
    dets:insert(dets_extension_role, Data),
    ok.

init([]) ->
    logger:info("[~w] 正在启动...",
                [extension_mgr],
                extension_mgr,
                87),
    process_flag(trap_exit, true),
    dets:open_file(dets_extension_role,
                   [{file, "./dets/extension_role.dets"},
                    {keypos, #extension_role.id}]),
    ets:new(ets_extension_role,
            [set,
             named_table,
             public,
             {keypos, #extension_role.id}]),
    StartFlag = case dets:first(dets_extension_role) of
                    '$end_of_table' ->
                        logger:info("推广员没有数据需要加载", [], extension_mgr, 94),
                        [];
                    _ ->
                        dets:traverse(dets_extension_role,
                                      fun (ExtRole) ->
                                              case
                                                  extension_ver:do_role(ExtRole)
                                                  of
                                                  {false, Reason} ->
                                                      logger:error("推广员数据转换失败:~w",
                                                                   [Reason],
                                                                   extension_mgr,
                                                                   101),
                                                      {done, false};
                                                  {ok, NewExtRole} ->
                                                      ets:insert(ets_extension_role,
                                                                 NewExtRole),
                                                      continue
                                              end
                                      end)
                end,
    case StartFlag of
        [] ->
            logger:info("[~w] 启动完成",
                        [extension_mgr],
                        extension_mgr,
                        112),
            {ok, #state{}};
        _Err ->
            logger:error("推广员数据文件载入失败:~w",
                         [_Err],
                         extension_mgr,
                         115),
            {stop, data_load_err}
    end.

handle_call({remote_add_ship,
             #extension_key{key = Key, role_id = TRoleId},
             ExtShip},
            _From, State) ->
    Reply = case check_apply_role(TRoleId, ExtShip, Key) of
                {true, TExtRole} ->
                    insert(TExtRole),
                    async_role_info(TRoleId, TExtRole),
                    ok;
                {false, Reason} -> {false, Reason}
            end,
    {reply, Reply, State};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({add_ship,
             ExtensionKey = #extension_key{role_id =
                                               TRoleId = {_, P, Z},
                                           key = Key},
             SExtRole = #extension_role{id = SRoleId,
                                        name = SRoleName},
             RolePid},
            State) ->
    case lookup_role(SRoleId) of
        null ->
            ExtShip = #extension_ship{id = SRoleId,
                                      name = SRoleName, key = Key,
                                      time = date:unixtime()},
            case role_misc:is_local_role(TRoleId) of
                true ->
                    case check_apply_role(TRoleId, ExtShip, Key) of
                        {true, TExtRole} ->
                            insert(TExtRole),
                            insert(SExtRole),
                            async_role_info(TRoleId, TExtRole),
                            notice_17500(RolePid,
                                         {1, lang:get("成功绑定邀请人")},
                                         SExtRole);
                        {false, Reason} -> notice_17500(RolePid, {0, Reason})
                    end;
                false ->
                    case big_world:call(P,
                                        Z,
                                        extension_mgr,
                                        call,
                                        [{remote_add_ship,
                                          ExtensionKey,
                                          ExtShip}])
                        of
                        ok ->
                            insert(SExtRole),
                            notice_17500(RolePid,
                                         {1, lang:get("成功绑定邀请人")},
                                         SExtRole);
                        {false, Reason} -> notice_17500(RolePid, {0, Reason});
                        _Err ->
                            logger:error("请求其它服增加邀请信息时失败:~w",
                                         [_Err],
                                         extension_mgr,
                                         157),
                            notice_17500(RolePid, {0, lang:get("系统繁忙，无法绑定邀请")})
                    end
            end;
        _ ->
            notice_17500(RolePid, {0, lang:get("已绑定邀请人，请勿重复绑定")})
    end,
    {noreply, State};
handle_cast({create_code, RoleId, RoleName, RolePid},
            State) ->
    Flag = case lookup_role(RoleId) of
               null ->
                   {true, #extension_role{id = RoleId, name = RoleName}};
               {true, ExtRole = #extension_role{}} ->
                   {true,
                    ExtRole#extension_role{id = RoleId, name = RoleName}};
               _ -> false
           end,
    case Flag of
        {true, OldExtRole} ->
            case extension:is_invalid_key(OldExtRole) of
                true ->
                    case big_world:call(c_extension_mgr,
                                        call,
                                        [{make_code, RoleId, RoleName}])
                        of
                        {error, big_world_not_ready} ->
                            notice_17501(RolePid,
                                         {0, lang:get("跨服未连接，无法申请邀请码")}),
                            {noreply, State};
                        {true, HashCode, Time} ->
                            NewExtRole = OldExtRole#extension_role{key =
                                                                       HashCode,
                                                                   key_time =
                                                                       Time},
                            insert(NewExtRole),
                            notice_17501(RolePid,
                                         {1, lang:get("更换邀请码成功")},
                                         NewExtRole),
                            {noreply, State};
                        {false, Reason} ->
                            notice_17501(RolePid, {0, Reason}),
                            {noreply, State};
                        _Err ->
                            logger:error("大世界申请邀请码失败:~w",
                                         [_Err],
                                         extension_mgr,
                                         194),
                            notice_17501(RolePid,
                                         {0, lang:get("系统繁忙，无法申请邀请码")}),
                            {noreply, State}
                    end;
                false ->
                    Msg = util:flist(lang:get("使用~w次后或申请1天后才可以更换新的邀请码"),
                                     [2]),
                    notice_17501(RolePid, {0, Msg}),
                    {noreply, State}
            end;
        false ->
            notice_17501(RolePid, {0, lang:get("系统繁忙，无法申请")}),
            {noreply, State}
    end;
handle_cast({charge,
             RoleId,
             RoleName,
             RoleLev,
             ApplyId,
             Charge},
            State) ->
    case lookup_role(ApplyId) of
        {true,
         ExtRole = #extension_role{ships = Ships,
                                   day_flag = DayFlag, day_score = DayScore,
                                   name = ApplyName}} ->
            case lists:keyfind(RoleId, #extension_ship.id, Ships) of
                ExtShip = #extension_ship{score = Score}
                    when Score < 3000 ->
                    ChargeGold = max(1,
                                     round(Charge * 2.99999999999999988898e-2)),
                    AddScore = min(3000 - Score, ChargeGold),
                    NewScore = Score + AddScore,
                    NewExtShip = ExtShip#extension_ship{score = NewScore},
                    NewShips = lists:keystore(RoleId,
                                              #extension_ship.id,
                                              Ships,
                                              NewExtShip),
                    Now = date:unixtime(),
                    NewDayScore = case date:is_same_day(Now, DayFlag) of
                                      true -> DayScore + AddScore;
                                      false -> AddScore
                                  end,
                    NewExtRole = ExtRole#extension_role{ships = NewShips,
                                                        day_flag = Now,
                                                        day_score =
                                                            NewDayScore},
                    insert(NewExtRole),
                    send_mail({charge,
                               ApplyId,
                               AddScore,
                               NewScore,
                               ApplyName,
                               NewExtRole,
                               RoleId,
                               RoleName,
                               RoleLev}),
                    ok;
                _ -> ok
            end;
        _ -> ok
    end,
    {noreply, State};
handle_cast({activity,
             RoleId,
             RoleName,
             ApplyId,
             RoleLev},
            State) ->
    case lookup_role(ApplyId) of
        {true,
         ExtRole = #extension_role{ships = Ships,
                                   day_flag = DayFlag, day_score = DayScore,
                                   name = ApplyName}} ->
            case lists:keyfind(RoleId, #extension_ship.id, Ships) of
                ExtShip = #extension_ship{score = Score,
                                          activity_score = ActivityScore,
                                          activity_time = ActivityTime}
                    when Score < 3000 andalso ActivityScore < 500 ->
                    CheckFlag = case extension_data:get_activity(RoleLev) of
                                    {LevFlag, MaxTime} when MaxTime > 0 ->
                                        case lists:keyfind(LevFlag,
                                                           1,
                                                           ActivityTime)
                                            of
                                            {_, LevTime}
                                                when LevTime < MaxTime ->
                                                {true, LevFlag, LevTime + 1};
                                            false -> {true, LevFlag, 1};
                                            _ -> false
                                        end;
                                    _ -> false
                                end,
                    case CheckFlag of
                        {true, GetLevFlag, GetLevTime} ->
                            AddScore = lists:min([30,
                                                  500 - ActivityScore,
                                                  3000 - Score]),
                            NewScore = Score + AddScore,
                            NewActivityScore = ActivityScore + AddScore,
                            NewActivityTime = lists:keystore(GetLevFlag,
                                                             1,
                                                             ActivityTime,
                                                             {GetLevFlag,
                                                              GetLevTime}),
                            NewExtShip = ExtShip#extension_ship{score =
                                                                    NewScore,
                                                                activity_score =
                                                                    NewActivityScore,
                                                                activity_time =
                                                                    NewActivityTime},
                            NewShips = lists:keystore(RoleId,
                                                      #extension_ship.id,
                                                      Ships,
                                                      NewExtShip),
                            Now = date:unixtime(),
                            NewDayScore = case date:is_same_day(Now, DayFlag) of
                                              true -> DayScore + AddScore;
                                              false -> AddScore
                                          end,
                            NewExtRole = ExtRole#extension_role{ships =
                                                                    NewShips,
                                                                day_flag = Now,
                                                                day_score =
                                                                    NewDayScore},
                            insert(NewExtRole),
                            send_mail({activity,
                                       ApplyId,
                                       AddScore,
                                       NewScore,
                                       ApplyName,
                                       NewExtRole,
                                       RoleId,
                                       RoleName,
                                       RoleLev}),
                            ok;
                        _ -> ok
                    end;
                _ -> ok
            end;
        _ -> ok
    end,
    {noreply, State};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(_Info, State) ->
    logger:error("收到未知消息:~w", [_Info], extension_mgr, 288),
    {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...",
                [extension_mgr],
                extension_mgr,
                292),
    logger:info("[~w] 关闭完成",
                [extension_mgr],
                extension_mgr,
                293),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

send_mail({charge,
           ApplyId,
           AddScore,
           NewScore,
           ApplyName,
           ExtRole = #extension_role{ships = _Ships},
           RoleId,
           RoleName,
           RoleLev}) ->
    Title = lang:get("推广充值奖励"),
    Content =
        notice:format(lang:get("~ts进行了充值，你获得了~ts返利奖励，充值越多返利越多！大家为星辰共同努力吧{face"
                               "_1, 18}"),
                      [{role_2, RoleName}, {assets_1, 90026, AddScore}]),
    Items = [{90026, AddScore}],
    mail:send(ApplyId,
              #{title => Title, content => Content, items => Items}),
    log:extension(ApplyId,
                  ApplyName,
                  RoleId,
                  RoleName,
                  RoleLev,
                  Title,
                  AddScore,
                  NewScore),
    async_role_info(ApplyId, ExtRole),
    ok;
send_mail({activity,
           ApplyId,
           AddScore,
           NewScore,
           ApplyName,
           ExtRole = #extension_role{ships = _Ships},
           RoleId,
           RoleName,
           RoleLev}) ->
    Title = lang:get("推广活跃奖励"),
    Content =
        notice:format(lang:get("~ts活跃度达到~ts点，你获得了~ts奖励，充值越多返利越多！大家为星辰共同努力吧{fa"
                               "ce_1, 18}"),
                      [{role_2, RoleName},
                       {string_2, 1, "75"},
                       {assets_1, 90026, AddScore}]),
    Items = [{90026, AddScore}],
    mail:send(ApplyId,
              #{title => Title, content => Content, items => Items}),
    log:extension(ApplyId,
                  ApplyName,
                  RoleId,
                  RoleName,
                  RoleLev,
                  Title,
                  AddScore,
                  NewScore),
    async_role_info(ApplyId, ExtRole),
    ok;
send_mail(_) -> ok.

notice_17500(RolePid, Msg) ->
    role:pack_send(RolePid, 17500, Msg),
    ok.

notice_17500(RolePid, Msg,
             ExtRole = #extension_role{}) ->
    role:pack_send(RolePid, 17500, Msg),
    role:apply(async,
               RolePid,
               {extension_mgr, do_async_role_info, [ExtRole]}),
    ok.

notice_17501(RolePid, Msg) ->
    role:pack_send(RolePid, 17501, Msg),
    ok.

notice_17501(RolePid, Msg,
             ExtRole = #extension_role{}) ->
    role:pack_send(RolePid, 17501, Msg),
    role:apply(async,
               RolePid,
               {extension_mgr, do_async_role_info, [ExtRole]}),
    ok.

async_role_info(RoleId, ExtRole) ->
    case role_query:pid(by_id, RoleId) of
        {ok, RolePid} ->
            role:apply(async,
                       RolePid,
                       {extension_mgr, do_async_role_info, [ExtRole]}),
            ok;
        _ -> skip
    end.

do_async_role_info(Role = #role{m_extension = MExt},
                   #extension_role{apply_id = ApplyId,
                                   apply_key = ApplyKey, apply_name = ApplyName,
                                   key = Key, key_time = KeyTime, ships = Ships,
                                   day_flag = DayFlag, day_score = DayScore}) ->
    NewMExt = MExt#m_extension{init = 1, key = Key,
                               key_time = KeyTime, ships = Ships,
                               apply_id = ApplyId, apply_key = ApplyKey,
                               apply_name = ApplyName, day_flag = DayFlag,
                               day_score = DayScore},
    NewRole = Role#role{m_extension = NewMExt},
    Now = date:unixtime(),
    NewDayScore = case date:is_same_day(Now, DayFlag) of
                      true -> DayScore;
                      _ -> 0
                  end,
    role:link_send(NewRole,
                   17502,
                   {Key,
                    KeyTime,
                    Ships,
                    ApplyId,
                    ApplyKey,
                    ApplyName,
                    NewDayScore}),
    {ok, NewRole}.

push_17502(Role = #role{m_extension =
                            MExt = #m_extension{init = 1}}) ->
    Data = make_17502(MExt),
    role:link_send(Role, 17502, Data),
    ok;
push_17502(Role = #role{id = RoleId,
                        m_extension = MExt}) ->
    case extension_mgr:lookup_role(RoleId) of
        {true,
         #extension_role{apply_id = ApplyId,
                         apply_key = ApplyKey, key = Key, key_time = KeyTime,
                         ships = Ships, apply_name = ApplyName,
                         day_flag = DayFlag, day_score = DayScore}} ->
            NewMExt = MExt#m_extension{init = 1, key = Key,
                                       key_time = KeyTime, ships = Ships,
                                       apply_id = ApplyId, apply_key = ApplyKey,
                                       apply_name = ApplyName,
                                       day_flag = DayFlag,
                                       day_score = DayScore},
            NewRole = Role#role{m_extension = NewMExt},
            Data = make_17502(NewMExt),
            role:link_send(NewRole, 17502, Data),
            {ok, NewRole};
        null ->
            NewMExt = #m_extension{init = 1},
            NewRole = Role#role{m_extension = NewMExt},
            Data = make_17502(NewMExt),
            role:link_send(NewRole, 17502, Data),
            {ok, NewRole};
        _ -> ok
    end.

make_17502(#m_extension{key = Key, key_time = KeyTime,
                        ships = Ships, apply_id = ApplyId, apply_key = ApplyKey,
                        apply_name = ApplyName, day_flag = DayFlag,
                        day_score = DayScore}) ->
    Now = date:unixtime(),
    NewDayScore = case date:is_same_day(Now, DayFlag) of
                      true -> DayScore;
                      _ -> 0
                  end,
    {Key,
     KeyTime,
     Ships,
     ApplyId,
     ApplyKey,
     ApplyName,
     NewDayScore}.

check_apply_role(TRoleId,
                 ExtShip = #extension_ship{id = SRoleId}, Key) ->
    case lookup_role(TRoleId) of
        {true,
         ExtRole = #extension_role{key = Key, ships = Ships}} ->
            Len = length(Ships),
            case Len >= 20 of
                true -> {false, lang:get("对方邀请名额已满，无法绑定")};
                false ->
                    case extension:is_invalid_key(ExtRole) of
                        false ->
                            NewShips = lists:keystore(SRoleId,
                                                      #extension_ship.id,
                                                      Ships,
                                                      ExtShip),
                            NewExtRole = ExtRole#extension_role{ships =
                                                                    NewShips},
                            update_role_ship(TRoleId, ExtShip, NewShips),
                            {true, NewExtRole};
                        true -> {false, lang:get("当前邀请码已失效，请重新输入新的邀请码")}
                    end
            end;
        {true, #extension_role{}} ->
            {false, lang:get("当前邀请码已失效，请重新输入新的邀请码")};
        _ -> {false, lang:get("当前邀请码已失效，请重新输入新的邀请码")}
    end.

update_role_ship(RoleId, ExtShip, Ships) ->
    case role_query:pid(by_id, RoleId) of
        {ok, Pid} ->
            role:apply(async,
                       Pid,
                       {extension_mgr, do_update_role_ship, [ExtShip, Ships]}),
            ok;
        _ -> ok
    end.

do_update_role_ship(Role = #role{m_extension = MExt},
                    ExtShip, Ships) ->
    NewMExt = MExt#m_extension{ships = Ships},
    NewRole = Role#role{m_extension = NewMExt},
    role:link_send(NewRole, 17503, {ExtShip}),
    {ok, NewRole}.

