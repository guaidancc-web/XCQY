-file("src/mod/lucky_money/lucky_money.erl", 1).

-module(lucky_money).

-behaviour(gen_server).

-export([start_link/0,
         push/1,
         get_reward/2,
         get_state/0,
         gm_push/2,
         fix/0,
         send_mail/0,
         repair_luck_money/0]).

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

-file("src/mod/lucky_money/lucky_money.erl", 25).

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

-file("src/mod/lucky_money/lucky_money.erl", 26).

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

-file("src/mod/lucky_money/lucky_money.erl", 27).

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

-file("src/mod/lucky_money/lucky_money.erl", 28).

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

-file("src/mod/lucky_money/lucky_money.erl", 29).

-file("inc/lucky_money.hrl", 1).

-record(lucky_money,
        {id = 0,
         round_id_now = 0,
         day = 0,
         start_time = 0,
         end_time = 0,
         assets_type = 0}).

-record(lucky_money_role,
        {role_id = {0, "", 0}, lists = []}).

-record(m_lucky_money, {lists = []}).

-record(lucky_money_data,
        {id = 0,
         day = 0,
         round_id = 0,
         status = 0,
         ratio = 0,
         limit = 0,
         assets_type = 0,
         assets_value = 0,
         init_value = 0,
         reward = []}).

-file("src/mod/lucky_money/lucky_money.erl", 30).

fix() -> lucky_money ! {fix_role, 2, 90000}.

push(Role) ->
    Lmr = fetch(Role#role.id),
    LuckyMoney = env:get(lucky_money),
    role:link_send(Role, 18700, {Lmr, LuckyMoney}),
    ok.

get_reward(Role = #role{id = RoleId}, Id) ->
    #lucky_money{day = DayNow, round_id_now = RoundIdNow} =
        env:get(lucky_money),
    Lmr = #lucky_money_role{lists = LuckyMoneyList} =
              fetch(RoleId),
    Result = case get_lucky_money_data(LuckyMoneyList, Id)
                 of
                 {ok,
                  #lucky_money_data{status = 1, day = Day,
                                    round_id = RoundId, reward = Reward} =
                      Data}
                     when DayNow =:= Day andalso RoundIdNow =:= RoundId ->
                     Data1 = Data#lucky_money_data{status = 2},
                     {ok, Reward, Data1};
                 {ok,
                  #lucky_money_data{status = Status, round_id = RoundId,
                                    ratio = Ratio, limit = Limit,
                                    assets_type = AssetsType,
                                    assets_value = AssetsValue,
                                    init_value = InitValue} =
                      Data}
                     when Status =/= 3 andalso RoundIdNow > RoundId ->
                     Value = min(Limit,
                                 util:ceil(AssetsValue * Ratio / 100) +
                                     InitValue),
                     Data1 = Data#lucky_money_data{status = 3},
                     {ok, [{AssetsType, Value}], Data1};
                 {ok, #lucky_money_data{status = Status}}
                     when Status =:= 2 ->
                     {false, lang:get("该时间不可以领取")};
                 {ok, #lucky_money_data{status = Status}}
                     when Status =:= 3 ->
                     {false, lang:get("已领取奖励")};
                 _R ->
                     logger:error("领取压岁钱错误：~w", [_R], lucky_money, 64),
                     {false, lang:get("该奖励不可领取")}
             end,
    case Result of
        {ok, NewReward, NewData} ->
            Gain = format:val_to_gain(NewReward),
            case role_gain:do_notice(Gain, Role) of
                {ok, Role1} ->
                    NewList = lists:keystore(Id,
                                             #lucky_money_data.id,
                                             LuckyMoneyList,
                                             NewData),
                    save(Lmr#lucky_money_role{lists = NewList}),
                    push(Role1),
                    {ok, Role1};
                {false, #gain{msg = Msg}} -> {false, Msg}
            end;
        {false, Msg} -> {false, Msg}
    end.

start_link() ->
    gen_server:start_link({local, lucky_money},
                          lucky_money,
                          [],
                          []).

init([]) ->
    logger:info("开始启动...", [], lucky_money, 91),
    process_flag(trap_exit, true),
    ets:new(lucky_money_role,
            [set,
             named_table,
             public,
             {keypos, #lucky_money_role.role_id}]),
    dets:open_file(lucky_money_role,
                   [{file, "./dets/lucky_money_role.dets"},
                    {keypos, #lucky_money_role.role_id},
                    {type, set}]),
    dets:to_ets(lucky_money_role, lucky_money_role),
    State = get_state(),
    env:save(lucky_money, State),
    Ref = erlang:send_after(date:next_diff(0, 0, 5) * 1000,
                            self(),
                            refresh),
    put(time_ref, Ref),
    logger:info("启动完成", [], lucky_money, 100),
    {ok, State}.

handle_call(_Info, _From, State) -> {noreply, State}.

handle_cast(_info, State) -> {noreply, State}.

handle_info({loss,
             #{role_id := RoleId, type := Type, value := Value}},
            State = #lucky_money{assets_type = AssetsType,
                                 day = Day, id = Id})
    when AssetsType =:= Type andalso Day =/= 0 ->
    Lmr = #lucky_money_role{lists = LuckyMoneyList} =
              fetch(RoleId),
    case get_lucky_money_data(LuckyMoneyList, Id) of
        {ok,
         Data = #lucky_money_data{assets_value = OldValue}} ->
            NewData = Data#lucky_money_data{assets_value =
                                                OldValue + Value},
            NewList = lists:keystore(Id,
                                     #lucky_money_data.id,
                                     LuckyMoneyList,
                                     NewData),
            save(Lmr#lucky_money_role{lists = NewList});
        _ -> ok
    end,
    {noreply, State};
handle_info({loss, _Args}, State) -> {noreply, State};
handle_info(refresh, _OldState) ->
    logger:debug("======", [], lucky_money, 126),
    case get(time_ref) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> skip
    end,
    Ref = erlang:send_after(date:next_diff(0, 0, 5) * 1000,
                            self(),
                            refresh),
    put(time_ref, Ref),
    State = get_state(),
    env:save(lucky_money, State),
    {noreply, State};
handle_info({gm, Day}, State) ->
    RoundId = util:ceil(Day / 6),
    NewDay = case Day rem 6 of
                 0 -> 6;
                 Day1 -> Day1
             end,
    {Id1, AssetsType1} = case
                             lucky_money_data:get_lucky_money({RoundId, NewDay})
                             of
                             #{id := Id, assets_type := AssetsType} ->
                                 {Id, AssetsType};
                             _ -> {0, 0}
                         end,
    logger:debug("Day:~w RoundId:~w NewDay:~w Id1:~w AssetsType"
                 ":~w data ~w",
                 [Day,
                  RoundId,
                  NewDay,
                  Id1,
                  AssetsType1,
                  lucky_money_data:get_lucky_money({RoundId, NewDay})],
                 lucky_money,
                 147),
    NewState = State#lucky_money{day = NewDay, id = Id1,
                                 assets_type = AssetsType1,
                                 round_id_now = RoundId},
    env:save(lucky_money, NewState),
    role_group:apply(world, {lucky_money, gm_push, [{}]}),
    {noreply, NewState};
handle_info({fix_role, Id, AssetsType}, State) ->
    AllList = ets:tab2list(lucky_money_role),
    Fun = fun (Lmr = #lucky_money_role{lists = Lists}) ->
                  case lists:keyfind(Id, #lucky_money_data.id, Lists) of
                      false -> ok;
                      Data ->
                          NewData = Data#lucky_money_data{assets_type =
                                                              AssetsType},
                          NewList = lists:keystore(Id,
                                                   #lucky_money_data.id,
                                                   Lists,
                                                   NewData),
                          save(Lmr#lucky_money_role{lists = NewList})
                  end
          end,
    lists:foreach(Fun, AllList),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...",
                [lucky_money],
                lucky_money,
                169),
    dets:close(lucky_money_role),
    logger:info("[~w] 关闭完成",
                [lucky_money],
                lucky_money,
                171),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

fetch(RoleId) ->
    case ets:lookup(lucky_money_role, RoleId) of
        [Lmr] -> Lmr;
        _ -> #lucky_money_role{role_id = RoleId}
    end.

save(Lmr) ->
    ets:insert(lucky_money_role, Lmr),
    dets:insert(lucky_money_role, Lmr).

get_state() ->
    Now = date:unixtime(),
    TimeList = lucky_money_data:get_time_list(),
    TimeList1 = lists:keysort(1, TimeList),
    {RoundId, Day} = get_round_id_day(Now, TimeList1),
    {Id1, AssetsType1} = case
                             lucky_money_data:get_lucky_money({RoundId, Day})
                             of
                             #{id := Id, assets_type := AssetsType} ->
                                 {Id, AssetsType};
                             _ -> {0, 0}
                         end,
    #lucky_money{round_id_now = RoundId, day = Day,
                 id = Id1, assets_type = AssetsType1}.

get_round_id_day(_Now, []) -> {0, 0};
get_round_id_day(Now,
                 [{RoundId, StartTime, EndTime}]) ->
    case StartTime =< Now andalso Now < EndTime of
        true ->
            Day = date:day_diff(StartTime, date:unixtime()) + 1,
            {RoundId, Day};
        _ ->
            case Now >= EndTime of
                true ->
                    Day = date:day_diff(StartTime, date:unixtime()) + 1,
                    {RoundId + 1, Day};
                _ ->
                    ets:delete_all_objects(lucky_money_role),
                    dets:delete_all_objects(lucky_money_role),
                    {0, 0}
            end
    end;
get_round_id_day(Now,
                 [{RoundId, StartTime, EndTime} | T]) ->
    case StartTime =< Now andalso Now < EndTime of
        true ->
            Day = date:day_diff(StartTime, date:unixtime()) + 1,
            {RoundId, Day};
        _ -> get_round_id_day(Now, T)
    end.

get_lucky_money_data(Lists, Id) ->
    case lists:keyfind(Id, #lucky_money_data.id, Lists) of
        false ->
            case lucky_money_data:get_lucky_money_id(Id) of
                #{round_id := RoundId, day := Day} ->
                    init_data(RoundId, Day);
                _ -> false
            end;
        Data -> {ok, Data}
    end.

init_data(RoundId, Day) ->
    case lucky_money_data:get_lucky_money({RoundId, Day}) of
        #{assets_type := AssetsType,
          assets_value := AssetsValue, ratio := Ratio,
          limit := Limit, reward := Reward, id := Id} ->
            {ok,
             #lucky_money_data{init_value = AssetsValue,
                               round_id = RoundId, day = Day, id = Id,
                               assets_type = AssetsType, ratio = Ratio,
                               limit = Limit, reward = Reward, status = 1}};
        _ -> false
    end.

gm_push(Role, _) ->
    push(Role),
    ok.

send_mail() ->
    List = [],
    lists:foreach(fun ({RoleId, GoldValue}) ->
                          case role_misc:is_local_role(RoleId) of
                              true ->
                                  logger:info("压岁钱已补偿玩家: ~w, ~w",
                                              [RoleId, GoldValue],
                                              lucky_money,
                                              261),
                                  mail:send(RoleId,
                                            lang:get("压岁钱活动补偿"),
                                            lang:get("亲爱的玩家，系统查询到您在23号凌晨00:00~00:40之间压岁钱货币显示异常问题中有消"
                                                     "耗金币，特此补偿您<color='#ffff00'>消耗*10%</color>的金币返还"
                                                     "，请查收{face_1,1}"),
                                            [{90003, GoldValue}]);
                              _ -> skip
                          end
                  end,
                  List).

repair_luck_money() ->
    Fun = fun (#lucky_money_role{role_id = RoleId,
                                 lists = L},
               Rtn)
                  when length(L) >= 2 ->
                  [RoleId | Rtn];
              (_, Rtn) -> Rtn
          end,
    DeleteData = ets:foldl(Fun, [], lucky_money_role),
    [ets:delete(lucky_money_role, Data)
     || Data <- DeleteData],
    [dets:delete(lucky_money_role, Data)
     || Data <- DeleteData],
    logger:info("被清除角色id~w",
                [DeleteData],
                lucky_money,
                275),
    role_group:apply(world, {lucky_money, push, []}),
    ok.

