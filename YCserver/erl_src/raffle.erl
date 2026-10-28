-file("src/mod/raffle/raffle.erl", 1).

-module(raffle).

-behaviour(gen_server).

-export([init/0,
         switch/1,
         get_log/0,
         draw/2,
         reward/1,
         push/2]).

-export([start_link/0]).

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

-file("src/mod/raffle/raffle.erl", 21).

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

-file("src/mod/raffle/raffle.erl", 22).

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

-file("src/mod/raffle/raffle.erl", 23).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/raffle/raffle.erl", 24).

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

-file("src/mod/raffle/raffle.erl", 25).

-file("inc/timer.hrl", 1).

-record(timer,
        {id :: undefined | term(),
         timeout = 1000 :: pos_integer(),
         m :: undefined | atom(),
         f :: undefined | function() | atom(),
         a = [] :: [term()],
         times = 1 :: integer(),
         next_tick = 0 :: non_neg_integer(),
         set_time = 1 :: pos_integer()}).

-record(rtimer,
        {ref :: undefined | reference(),
         key :: undefined | reference(),
         timers = [] :: [#timer{}]}).

-record(s_timer,
        {ref :: undefined | reference(),
         timers = [] :: [#timer{}]}).

-file("src/mod/raffle/raffle.erl", 26).

-file("inc/raffle.hrl", 1).

-record(m_raffle, {ver = 0, prizes = []}).

-record(raffle_log,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         time = 0 :: integer(),
         prizes = []}).

-file("src/mod/raffle/raffle.erl", 27).

-record(state,
        {switch = 0,
         ts :: undefined | tuple(),
         timeout = 0 :: non_neg_integer(),
         switch_ref :: undefined | reference()}).

init() -> #m_raffle{}.

switch(Status) -> raffle ! {switch, Status}.

get_log() ->
    case ets:lookup(raffle_log, 1) of
        [{_, L}] -> L;
        _ -> []
    end.

draw(Role, Times) ->
    case check_draw(Role, Times) of
        ok -> do_draw(Role, raffle_data:get_cost(Times));
        Else -> Else
    end.

reward(Role = #role{m_raffle =
                        #m_raffle{prizes = [_ | _]}}) ->
    do_reward(Role);
reward(_) -> ok.

push(_, Cmd = 19200) ->
    Data = case env:get(raffle_switch) of
               1 -> {1, 3600};
               _ -> {0, 0}
           end,
    sys_conn:pack_send(Cmd, Data),
    ok;
push(_, Cmd = 19201) ->
    Log = get_log(),
    sys_conn:pack_send(Cmd, {Log}),
    ok.

start_link() ->
    gen_server:start_link({local, raffle}, raffle, [], []).

init([]) ->
    logger:info("开始启动...", [], raffle, 103),
    ets:new(raffle_log,
            [set, named_table, public, {keypos, 1}]),
    State = #state{},
    env:set(raffle_switch, 0),
    logger:info("启动完成", [], raffle, 107),
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({switch, Status},
            State = #state{switch_ref = OldRef}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    case Status of
        0 ->
            env:set(raffle_switch, Status),
            role_group:pack_send(world, 19200, {0, 0}),
            {noreply, State#state{switch = Status}};
        _ ->
            env:set(raffle_switch, Status),
            Timeout = 3600 * 1000,
            Ref = erlang:send_after(Timeout, self(), {switch, 0}),
            role_group:pack_send(world,
                                 19200,
                                 {1, Timeout div 1000}),
            {noreply,
             State#state{switch = Status, ts = erlang:now(),
                         timeout = Timeout, switch_ref = Ref}}
    end;
handle_info({log, Type, Log}, State) ->
    case ets:lookup(raffle_log, Type) of
        [{Type, Logs}] ->
            ets:insert(raffle_log,
                       {Type, lists:sublist([Log | Logs], 10)});
        _ -> ets:insert(raffle_log, {Type, [Log]})
    end,
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

check_draw(_, _) ->
    case env:get(raffle_switch) of
        1 -> ok;
        _ -> {false, lang:get("抽奖活动还没开始")}
    end.

do_draw(Role = #role{},
        #{type := Type, cost := Cost}) ->
    Loss = format:val_to_loss(Cost),
    case role_gain:do_notice(Loss, Role) of
        {ok,
         Role1 = #role{m_raffle =
                           MR = #m_raffle{prizes = Has}}} ->
            case get_prize(Role, Type) of
                {ok, Id, Items, Prize} ->
                    Role2 = Role1#role{m_raffle =
                                           MR#m_raffle{prizes = Prize ++ Has}},
                    {ok, Id, Items, Role2};
                Else ->
                    logger:error("抽奖失败 ~w", [Else], raffle, 178),
                    {false, lang:get("抽奖失败")}
            end;
        {false, #loss{msg = Msg}} -> {false, Msg}
    end;
do_draw(_, _Else) ->
    logger:debug("抽奖类型 ~w", [_Else], raffle, 185),
    {false, lang:get("不能这样抽哦")}.

do_reward(Role = #role{m_raffle =
                           MR = #m_raffle{prizes = Prizes},
                       id = RoleId, name = Name}) ->
    Items = [{ItemId, 0, ItemNum}
             || #{item_id := ItemId, item_num := ItemNum} <- Prizes],
    AnnItems = [{Aid, Anum}
                || #{item_id := Aid, item_num := Anum, announce := 1}
                       <- Prizes],
    Gain = format:val_to_gain(Items),
    Role1 = Role#role{m_raffle = MR#m_raffle{prizes = []}},
    case role_gain:do_notice(Gain, Role1) of
        {ok, Role2} ->
            announce_and_log(RoleId, Name, AnnItems),
            {ok, Role2};
        {false, #gain{reason = bag_full}} ->
            Title = lang:get("抽奖奖励"),
            Content = lang:get("背包已满，奖励通过邮件发送，请查收。"),
            mail:send(Role1,
                      #{title => Title, content => Content, items => Items}),
            announce_and_log(RoleId, Name, AnnItems),
            {ok, Role1};
        {false, #gain{msg = Msg}} -> {false, Msg}
    end.

announce_and_log(RoleId, Name, Announce) ->
    case Announce of
        [] -> ok;
        _ ->
            Log = #raffle_log{id = RoleId, name = Name,
                              prizes = Announce, time = date:unixtime()},
            raffle ! {log, 1, Log},
            Format =
                lang:get("~ts在~ts中抽奖时，终于摆脱黑手，抽到了~ts{face_1,20}"),
            Msg = notice:format(Format,
                                [{role_2, Name},
                                 {string_2, 1, lang:get("彩虹魔盒")},
                                 {item_2, Announce}]),
            notice:cast(all, 5, Msg)
    end.

get_prize(#role{classes = Classes, lev = Lev, sex = Sex,
                m_lev_break = #m_lev_break{times = Times}},
          Type) ->
    L = [O
         || O = #{classes := C, sex := S}
                <- raffle_data:get_prize(),
            (C =:= Classes orelse C =:= 0) andalso
                (S =:= Sex orelse S =:= 2)],
    L1 = [O
          || O = #{lev_min := LevMin, lev_max := LevMax,
                   break_times_min := BreakMin,
                   break_times_max := BreakMax}
                 <- L,
             LevMin =< Lev andalso
                 (LevMax =:= 0 orelse LevMax >= Lev) andalso
                     BreakMin =< Times andalso BreakMax >= Times],
    Num = case Type of
              2 -> 10;
              _ -> 1
          end,
    L3 = do_get_prize(L1, Num),
    case lists:keysort(1, L3) of
        [{_, #{id := Id}} | _] ->
            {ok,
             Id,
             [{ItemId, ItemNum}
              || {_, #{item_id := ItemId, item_num := ItemNum}}
                     <- L3],
             [O || {_, O} <- L3]};
        _ -> {false, lang:get("找不到数据")}
    end.

do_get_prize([], _) -> [];
do_get_prize(_, Num) when Num < 1 -> [];
do_get_prize(L, Num) ->
    case util:rand_list(L, item_weight) of
        O = #{item_weight := Weight, item_id := ItemId} ->
            [{Weight, O#{item_id := item_type:special_id(ItemId)}}
             | do_get_prize(L, Num - 1)];
        _ -> []
    end.

