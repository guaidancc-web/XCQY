-file("src/mod/misc/card_mgr.erl", 1).

-module(card_mgr).

-behaviour(gen_server).

-export([start_link/0, cast/1, get_media_card/2]).

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

-file("src/mod/misc/card_mgr.erl", 18).

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

-file("src/mod/misc/card_mgr.erl", 19).

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

-file("src/mod/misc/card_mgr.erl", 20).

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

-file("src/mod/misc/card_mgr.erl", 21).

-file("inc/log.hrl", 1).

-file("src/mod/misc/card_mgr.erl", 22).

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

-file("src/mod/misc/card_mgr.erl", 23).

-record(state, {}).

-spec start_link() -> {ok, pid()} |
                      ignore |
                      {error, term()}.

start_link() ->
    gen_server:start_link({local, card_mgr},
                          card_mgr,
                          [],
                          []).

cast(Args) -> gen_server:cast(card_mgr, Args).

get_media_card(Role = #role{channel_reg = ChannelReg},
               CardNum) ->
    CommonCardList = media_card_data:list_all(),
    case lists:member(CardNum, CommonCardList) of
        true ->
            GetCardList = var:get_var(Role, acc, 1021, []),
            case lists:member(CardNum, GetCardList) of
                true -> {false, lang:get("您已经领取过该礼包了")};
                _ ->
                    Now = date:unixtime(),
                    case media_card_data:get_card(CardNum) of
                        #{start_time := StartTime, end_time := EndTime,
                          limit_plat := LimitPlat, reward := Rewards = [_ | _]}
                            when Now >= StartTime andalso Now =< EndTime ->
                            CheckChannel = case lists:member(ChannelReg,
                                                             LimitPlat)
                                               of
                                               true -> true;
                                               false when LimitPlat =:= [] ->
                                                   true;
                                               _ -> {false, lang:get("卡号已过期")}
                                           end,
                            case CheckChannel of
                                true ->
                                    VarRole = var:set_var(Role,
                                                          acc,
                                                          1021,
                                                          [CardNum
                                                           | GetCardList]),
                                    Gain = format:val_to_gain(Rewards),
                                    case role_gain:do_notice(Gain, VarRole) of
                                        {ok, GainRole} -> {ok, GainRole};
                                        _ ->
                                            Titile = lang:get("媒体卡礼包"),
                                            Content =
                                                lang:get("由于背包已满，媒体卡礼包通过邮件发送"),
                                            mail:send(VarRole,
                                                      Titile,
                                                      Content,
                                                      Rewards),
                                            {ok, VarRole}
                                    end;
                                {false, Reason} -> {false, Reason}
                            end;
                        _ -> {false, lang:get("卡号无效")}
                    end
            end;
        _ -> get_media_card(Role, CardNum, old)
    end.

get_media_card(Role, CardNum, old)
    when length(CardNum) =:= 32 ->
    case check_junior_card(Role, CardNum) of
        true ->
            NewCardVar = var:get_var(Role, acc, 1010, []),
            case NewCardVar > 1 of
                true -> {false, lang:get("您已经领取过新手卡")};
                false ->
                    Gain = format:val_to_gain([{29013, 1}]),
                    case role_gain:do(Role, Gain) of
                        {ok, RewardRole} ->
                            NewRole = var:set_var(RewardRole,
                                                  acc,
                                                  1010,
                                                  RewardRole),
                            Msg = notice:format(lang:get("领取~ts礼包，获得~ts"),
                                                [{string_2,
                                                  5,
                                                  lang:get("新手礼包")},
                                                 {item_2, Gain}]),
                            notice:send(NewRole, 3, Msg),
                            notice:gain_item(NewRole, Gain),
                            {ok, NewRole};
                        {false, _} -> {false, lang:get("错误的奖励数据, 无法领取")}
                    end
            end;
        false -> {false, lang:get("卡号无效")}
    end;
get_media_card(Role = #role{id = RoleId, name = Name,
                            lev = Lev},
               CardNum, old) ->
    MediaList = var:get_var(Role, acc, 1002, []),
    Args = #{role_id => RoleId, name => Name, lev => Lev,
             card => CardNum, media_list => MediaList},
    case case catch gen_server:call(card_mgr,
                                    {get_media_card, Args},
                                    10000)
             of
             {'EXIT', {timeout, _}} -> {error, timeout};
             {'EXIT', {noproc, _}} -> {error, noproc};
             {'EXIT', {normal, _}} -> {error, exit};
             {'EXIT', _Call_Err} -> {error, _Call_Err};
             _Call_Return -> _Call_Return
         end
        of
        {ok, MediaId, MediaName, HasNum, Gain} ->
            Result = case format:val_to_gain(Gain) of
                         GainList = [_ | _] -> {true, GainList};
                         _ -> false
                     end,
            case Result of
                {true, NewGainList} ->
                    case role_gain:do(NewGainList, Role) of
                        {false, #gain{reason = bag_full}} ->
                            Media = {MediaId, HasNum + 1},
                            NewMediaList = lists:keystore(MediaId,
                                                          1,
                                                          MediaList,
                                                          Media),
                            NewRole = var:set_var(Role,
                                                  acc,
                                                  1002,
                                                  NewMediaList),
                            Msg =
                                notice:format(lang:get("领取~ts礼包，获得~ts，背包已满，已经通过邮件发送"),
                                              [{string_2, 5, MediaName},
                                               {item_2, Gain}]),
                            notice:send(NewRole, 3, Msg),
                            Title = lang:get("领取礼包"),
                            Content = util:flist(lang:get("领取~ts礼包时背包已满，奖励如下"),
                                                 [MediaName]),
                            mail:send(NewRole,
                                      #{title => Title, content => Content,
                                        items => Gain}),
                            {ok, NewRole};
                        {false, _} ->
                            logger:error("领取媒体卡时奖励错误:~w",
                                         [NewGainList],
                                         card_mgr,
                                         147),
                            cast({rollback, RoleId, CardNum}),
                            {false, lang:get("错误的奖励数据, 无法领取")};
                        {ok, NewRole} ->
                            Media = {MediaId, HasNum + 1},
                            NewMediaList = lists:keystore(MediaId,
                                                          1,
                                                          MediaList,
                                                          Media),
                            NewRole1 = var:set_var(NewRole,
                                                   acc,
                                                   1002,
                                                   NewMediaList),
                            Msg = notice:format(lang:get("领取~ts礼包，获得~ts"),
                                                [{string_2, 5, MediaName},
                                                 {item_2, Gain}]),
                            notice:send(NewRole1, 3, Msg),
                            notice:gain_item(NewRole1, NewGainList),
                            log:mod(NewRole1,
                                    card,
                                    log:format([MediaId,
                                                {"~ts", CardNum},
                                                {"~ts", MediaName},
                                                {"~ts",
                                                 log:item_str(NewGainList)}])),
                            {ok, NewRole1}
                    end;
                false ->
                    logger:error("领取媒体卡时奖励错误:~w", [Gain], card_mgr, 161),
                    cast({rollback, RoleId, CardNum}),
                    {false, lang:get("礼包配置错误, 无法领取")}
            end;
        {false, Reason} -> {false, Reason};
        _Err ->
            logger:error("领取媒体卡发生错误:~w", [_Err], card_mgr, 168),
            {false, lang:get("系统正忙, 请稍后尝试")}
    end.

init([]) ->
    logger:info("[~w] 正在启动...", [card_mgr], card_mgr, 182),
    process_flag(trap_exit, true),
    put(last_card_list, []),
    State = #state{},
    logger:info("[~w] 启动完成", [card_mgr], card_mgr, 186),
    {ok, State}.

handle_call({get_media_card,
             #{role_id := RoleId, name := RoleName, lev := RoleLev,
               media_list := MediaList, card := CardNum}},
            _From, State) ->
    Now = date:unixtime(),
    LastList = get(last_card_list),
    Reply = case lists:member(CardNum, LastList) of
                false ->
                    case get_card(CardNum) of
                        {ok, [Type, 0]} ->
                            case get_card_reward(Type) of
                                {ok, [_, _, _, NeedLev, _, 1, _]}
                                    when RoleLev < NeedLev ->
                                    {false,
                                     util:flist(lang:get("您的等级不足~w级，无法领取"),
                                                [NeedLev])};
                                {ok,
                                 [CardName, StartT, EndT, _, MaxNum, 1, Items]}
                                    when Now >= StartT andalso
                                             (Now =< EndT orelse EndT =:= 0) ->
                                    HasNum = case lists:keyfind(Type,
                                                                1,
                                                                MediaList)
                                                 of
                                                 {_, Num} -> Num;
                                                 _ -> 0
                                             end,
                                    case HasNum >= MaxNum of
                                        true ->
                                            Msg =
                                                notice:format(lang:get("~ts类型卡领取次数已达上限"),
                                                              [{string_2,
                                                                5,
                                                                CardName}]),
                                            {false, Msg};
                                        false ->
                                            put(last_card_list,
                                                lists:sublist([CardNum
                                                               | LastList],
                                                              100)),
                                            update_card(CardNum,
                                                        RoleId,
                                                        RoleName),
                                            {ok, Type, CardName, HasNum, Items}
                                    end;
                                {ok, _} -> {false, lang:get("卡号已经过期, 无法领取")};
                                _Err -> {false, lang:get("无法找到对应奖励数据")}
                            end;
                        {ok, _} -> {false, lang:get("卡号不存在, 无法领取")};
                        _Err ->
                            logger:error("_Err:~w", [_Err], card_mgr, 224),
                            {false, lang:get("卡号不存在, 无法领取")}
                    end;
                true -> {false, lang:get("卡号已经被领取")}
            end,
    {reply, Reply, State};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({rollback, _RoleId, CardNum}, State) ->
    put(last_card_list,
        lists:delete(CardNum, get(last_card_list))),
    update_card(CardNum, {0, "", 0}, ""),
    {noreply, State};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...", [card_mgr], card_mgr, 247),
    logger:info("[~w] 关闭完成", [card_mgr], card_mgr, 248),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

get_card(CardNum) ->
    Sql = "select type, rid from media_card where "
          "card_num = ?",
    db:get_row(Sql, [CardNum]).

get_card_reward(Type) ->
    Sql = "select name, start_time, end_time, lev, "
          "num, status, items from media_card_type "
          "where id = ?",
    case db:get_row(Sql, [Type]) of
        {ok,
         [CardName,
          StartT,
          EndT,
          NeedLev,
          MaxNum,
          Status,
          Items]} ->
            case to_items(Items) of
                {ok, NewItems} ->
                    {ok,
                     [CardName,
                      StartT,
                      EndT,
                      NeedLev,
                      MaxNum,
                      Status,
                      NewItems]};
                false -> false
            end;
        _Err ->
            logger:error("查找媒体卡奖励数据错误:~w", [_Err], card_mgr, 275),
            false
    end.

update_card(CardNum, {Rid, Platform, ZoneId}, Name) ->
    Sql = "update media_card set rid = ?, platform "
          "= ?, zone_id = ?, name = ?, get_time "
          "= ? where card_num = ?",
    db:exec(Sql,
            [Rid,
             Platform,
             ZoneId,
             Name,
             date:unixtime(),
             CardNum]).

to_items(Items) ->
    case util:string_to_term(Items) of
        {ok, Items1 = [_ | _]} -> {ok, Items1};
        _Err ->
            logger:error("解析奖励错误:~w, ~w",
                         [Items, _Err],
                         card_mgr,
                         289),
            false
    end.

check_junior_card(#role{id = {_R, Plat, Zone},
                        account = Acc},
                  CardNum) ->
    CardBin = unicode:characters_to_binary(CardNum),
    Ticket = Plat ++
                 integer_to_list(Zone) ++ "a4c1ad4ad" ++ Acc,
    logger:debug("ticket ~ts", [Ticket], card_mgr, 296),
    case util:md5(Ticket) of
        <<_:(8 * 14), CardBin/binary>> -> true;
        _Else -> false
    end.

