-file("src/mod/misc/month_card.erl", 1).

-module(month_card).

-export([charge/3,
         state_get/1,
         get_privilege/2,
         reward_get/1,
         zero_flush/2,
         login/1,
         lev_up/2,
         send_mail/1,
         create_mail/1,
         compensate_mail/1,
         open_mail/1,
         compensate_reward_get/2,
         open_mail_notice/1]).

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

-file("src/mod/misc/month_card.erl", 29).

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

-file("src/mod/misc/month_card.erl", 30).

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

-file("src/mod/misc/month_card.erl", 31).

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

-file("src/mod/misc/month_card.erl", 32).

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

-file("src/mod/misc/month_card.erl", 33).

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

-file("src/mod/misc/month_card.erl", 34).

-file("inc/rank.hrl", 1).

-record(rank,
        {type = 1,
         show_list = [],
         list = [],
         last_val = 0,
         len = 0}).

-record(rank_rc,
        {ver = 3 :: pos_integer(),
         id = {roleid, platform, zoneid} :: term(),
         rank = 1,
         time = 0 :: non_neg_integer(),
         role_id = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: list(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = "",
         pet,
         guard,
         eqm}).

-record(rank_cfg,
        {type = 0 :: non_neg_integer(),
         num = 100 :: non_neg_integer(),
         keys = [#rank_rc.val3, #rank_rc.val2, #rank_rc.val1] ::
             [pos_integer()],
         min_val = 1 :: pos_integer(),
         nologin = 0 :: non_neg_integer(),
         zone = rank_zone_1 :: atom()}).

-file("src/mod/misc/month_card.erl", 35).

charge(#role{charge = Charge, id = {Rid, P, Z}} = Role,
       Gold, NewGold) ->
    case month_card_data:get_reward(Gold) of
        #{gold_bind := GoldBind, day := Day} ->
            case var:get_var(Role, other, 2022, #card_state{}) of
                #card_state{day = Day0, day_sum = DaySum, state = State,
                            buy_time = OldBuyTime} ->
                    {ok, Role1} = role_gain:do_notice([#gain{label = gold,
                                                             val = NewGold}],
                                                      Role#role{charge =
                                                                    Charge +
                                                                        Gold},
                                                      lang:get("充值月卡")),
                    Time = date:unixtime(),
                    {NewState, NewBuyTime, NewDaySum} = case Day0 > 0 of
                                                            true ->
                                                                {State,
                                                                 OldBuyTime,
                                                                 DaySum + Day};
                                                            _ -> {1, Time, Day}
                                                        end,
                    NewRole = var:set_var(Role1,
                                          other,
                                          2022,
                                          #card_state{gold = Gold,
                                                      gold_bind = GoldBind,
                                                      buy_time = NewBuyTime,
                                                      state = NewState,
                                                      day = Day + Day0,
                                                      day_sum = NewDaySum,
                                                      daily_time = Time}),
                    role:pack_send(NewRole, 9932, {NewState, Day + Day0}),
                    BackMsg =
                        notice:format(lang:get("恭喜您购买了<color='#ffff00'>月度礼包</color>，每天登录可在<co"
                                               "lor='#ffff00'>任务栏</color>领取<color='#00ff00'>~"
                                               "ts</color>{assets_2,90003}，不要错过哦{face_1,18}"),
                                      [{string_1, GoldBind}]),
                    notice:pop(Role, 2, BackMsg),
                    {ok, NewRole};
                _ ->
                    logger:info("角色[~w, ~ts, ~w] 重复充值月卡",
                                [Rid, P, Z],
                                month_card,
                                67),
                    notice:send(Role,
                                1,
                                lang:get("你已经购买了<color='#ffff00'>月度礼包</color>,无法进行重复购买")),
                    role_gain:do_notice([#gain{label = gold,
                                               val = NewGold}],
                                        Role#role{charge = Charge + Gold},
                                        lang:get("在线充值"))
            end;
        _Err -> ok
    end.

state_get(Role) ->
    #card_state{state = State, day = Day} =
        var:get_var(Role, other, 2022, #card_state{}),
    {Day, State}.

get_privilege(Role, Type) ->
    get_privilege(Type, state_get(Role), Role).

get_privilege(market_silver_refresh, {Day, _}, _) ->
    case Day > 0 of
        true -> 30;
        _ -> 0
    end;
get_privilege(alchemy_produce, {Day, _}, _) ->
    case Day > 0 of
        true -> 600;
        _ -> 0
    end;
get_privilege(family_cleanness, {Day, _}, _) ->
    case Day > 0 of
        true -> 5;
        _ -> 0
    end;
get_privilege(friend_present, {Day, _}, _) ->
    case Day > 0 of
        true -> 1;
        _ -> 0
    end;
get_privilege(energy_limit, {Day, _}, _) ->
    case Day > 0 of
        true -> 200;
        _ -> 0
    end;
get_privilege(washing_times, {Day, _}, Role) ->
    case Day > 0 of
        true -> 3 - var:get_var(Role, other, 2115, 0);
        _ -> 0
    end.

reward_get(Role) ->
    MonthCard = #card_state{state = State, day = Day,
                            day_sum = DaySum, gold_bind = GoldBind} =
                    var:get_var(Role, other, 2022, #card_state{}),
    case 0 < Day andalso Day =< DaySum of
        true ->
            case State > 0 of
                true ->
                    GL = format:val_to_gain([{90003, GoldBind}]),
                    {ok, NewRole} = role_gain:do_notice(GL, Role),
                    NewRole1 = var:set_var(NewRole,
                                           other,
                                           2022,
                                           MonthCard#card_state{state = 0}),
                    role:pack_send(NewRole, 9932, {0, Day}),
                    {ok, NewRole1};
                _ -> {false, lang:get("已领取该奖励,不可重复领取")}
            end;
        _ -> {false, lang:get("该奖励不可领取")}
    end.

zero_flush(Role, Args) ->
    MonthCard = #card_state{buy_time = BuyTime,
                            day_sum = DaySum} =
                    var:get_var(Role, other, 2022, #card_state{}),
    Now = date:unixtime(),
    Day = date:day_diff(BuyTime, Now),
    {State, NewDay} = case Day < DaySum of
                          true -> {1, DaySum - Day};
                          _ -> {0, 0}
                      end,
    logger:debug("============月卡：~w",
                 [{NewDay, BuyTime}],
                 month_card,
                 151),
    NewRole = var:set_var(Role,
                          other,
                          2022,
                          MonthCard#card_state{state = State, day = NewDay,
                                               daily_time = Now}),
    case Args of
        login -> ignore;
        _ -> role:pack_send(NewRole, 9932, {State, NewDay})
    end,
    NewRole1 = open_mail_notice(NewRole),
    NewRole2 = case NewDay > 0 of
                   true -> satiety:modify(NewRole1, 10);
                   _ -> NewRole1
               end,
    NewRole3 = var:set_var(NewRole2, other, 2115, 0),
    {ok, NewRole3}.

login(Role) ->
    Role1 = open_mail_notice(Role),
    Now = date:unixtime(),
    #card_state{daily_time = DailyTime} = var:get_var(Role,
                                                      other,
                                                      2022,
                                                      #card_state{}),
    case date:is_same_day(Now, DailyTime) of
        true -> {ok, Role1};
        _ -> zero_flush(Role1, login)
    end.

lev_up(OldLev, #role{lev = NewLev, pid = Pid})
    when OldLev < 5 andalso NewLev >= 12 ->
    role:apply(async, Pid, {month_card, send_mail, []}),
    role:apply(async, Pid, {month_card, open_mail, []}),
    ok;
lev_up(OldLev, #role{lev = NewLev, pid = Pid})
    when OldLev < 5 andalso NewLev >= 5 ->
    role:apply(async, Pid, {month_card, send_mail, []}),
    ok;
lev_up(OldLev, #role{lev = NewLev, pid = Pid})
    when OldLev < 12 andalso NewLev >= 12 ->
    role:apply(async, Pid, {month_card, open_mail, []}),
    ok;
lev_up(_OldLev, _Role) -> ok.

send_mail(Role) ->
    List = var:get_var(Role, other, 2023, []),
    logger:debug("======send_mail======~w~n",
                 [List],
                 month_card,
                 193),
    case List of
        [] ->
            State1 = create_mail(Role),
            State3 = compensate_mail(Role),
            NewRole = var:set_var(Role,
                                  other,
                                  2023,
                                  [State1, State3]),
            {ok, NewRole};
        _ -> ok
    end.

create_mail(#role{classes = Classes, name = RoleName} =
                Role) ->
    case compensate_data:get_mail(Classes) of
        {Title, Content} ->
            Content1 = notice:format(Content,
                                     [{string_1, RoleName}]),
            mail:send(Role, Title, Content1),
            create_1;
        _ ->
            logger:error("创建角色邮件 ~w~n",
                         [RoleName],
                         month_card,
                         212),
            create_2
    end.

open_mail(Role) ->
    Day = date:open_srv_day(),
    case Day =< 15 of
        true ->
            List = var:get_var(Role, other, 2023, []),
            case lists:member(open_1, List) of
                false ->
                    Title = lang:get("开服冲榜赢大奖"),
                    Content = case env:srv_open_time() <
                                       date:datetime_to_seconds({{2017, 7, 17},
                                                                 {9, 0, 0}})
                                  of
                                  true ->
                                      notice:format(lang:get("亲爱的玩家：\n  欢迎来到<color='#ffff00'>《星辰奇缘》</color>"
                                                             "的世界！您所在的新服设立了<color='#ffff00'>实力、竞技、等级、宠物、人气和"
                                                             "恩爱</color>排名，截至<color='#ffff00'>~ts天23点59分</c"
                                                             "olor>后服务器各榜单前<color='#ffff00'>10</color>名可获得超"
                                                             "值奖励。快来参与吧{face_1,57}\n<color='#ffff00'>人气榜</c"
                                                             "olor>前十可获得稀有时装<color='#ffff00'>【绝世芳华】</color>\n"
                                                             "<color='#ffff00'>竞技榜</color>前十可获得<color='#fff"
                                                             "f00'>500</color>{assets_2, 90002}\n<color='#f"
                                                             "fff00'>实力榜</color>前十可获得稀有饰品<color='#ffff00'>【"
                                                             "至尊皇冠】</color>\n<color='#ffff00'>恩爱榜</color>前十"
                                                             "可获得稀有饰品<color='#ffff00'>【浓情蜜意】</color>\n<colo"
                                                             "r='#ffff00'>宠物榜</color>前十可获得超值礼包<color='#ffff"
                                                             "00'>【宠物排行礼包】</color>\n<color='#ffff00'>等级榜</c"
                                                             "olor>前十可获得超值礼包<color='#ffff00'>【等级排行礼包】</colo"
                                                             "r>\n{panel_2, 16000, #00ff00, 详情可在开服活动内查看, "
                                                             "12}"),
                                                    [{string_1, 15 - Day}]);
                                  _ ->
                                      notice:format(lang:get("亲爱的玩家：\n  欢迎来到<color='#ffff00'>《星辰奇缘》</color>"
                                                             "的世界！您所在的新服设立了<color='#ffff00'>竞技、等级、宠物、人气、恩爱和"
                                                             "爵位</color>排名，截至<color='#ffff00'>~ts天23点59分</c"
                                                             "olor>后服务器各榜单前<color='#ffff00'>10</color>名可获得超"
                                                             "值奖励。快来参与吧{face_1,57}\n<color='#ffff00'>人气榜</c"
                                                             "olor>前十可获得稀有时装<color='#ffff00'>【绝世芳华】</color>\n"
                                                             "<color='#ffff00'>竞技榜</color>前十可获得<color='#fff"
                                                             "f00'>500</color>{assets_2, 90002}\n<color='#f"
                                                             "fff00'>爵位榜</color>前十可获得稀有饰品<color='#ffff00'>【"
                                                             "爵位排行礼包】</color>\n<color='#ffff00'>恩爱榜</color>"
                                                             "前十可获得稀有饰品<color='#ffff00'>【浓情蜜意】</color>\n<co"
                                                             "lor='#ffff00'>宠物榜</color>前十可获得超值礼包<color='#ff"
                                                             "ff00'>【宠物排行礼包】</color>\n<color='#ffff00'>等级榜<"
                                                             "/color>前十可获得超值礼包<color='#ffff00'>【等级排行礼包】</co"
                                                             "lor>\n{panel_2, 16000, #00ff00, 详情可在开服活动内查看, "
                                                             "12}"),
                                                    [{string_1, 15 - Day}])
                              end,
                    mail:send(Role, Title, Content),
                    {ok, var:set_var(Role, other, 2023, [open_1 | List])};
                _ ->
                    {ok, var:set_var(Role, other, 2023, [open_2 | List])}
            end;
        _ -> ok
    end.

open_mail_notice(Role) ->
    Day = date:open_srv_day(),
    case Day =:= 13 of
        true ->
            List = var:get_var(Role, other, 2023, []),
            case lists:member(open_3, List) of
                false ->
                    case compensate_data:get_mail_other(1) of
                        #{title := Title, content := Content} ->
                            mail:send(Role, Title, Content),
                            var:set_var(Role, other, 2023, [open_3 | List]);
                        _ -> Role
                    end;
                _ -> Role
            end;
        _ -> Role
    end.

compensate_mail(#role{lev = Lev, name = RoleName} =
                    Role) ->
    case world_lev:get_world_lev() of
        {WorldLev, _} ->
            Id = compensate_reward_get(WorldLev - Lev, 0),
            case compensate_data:get_reward(Id) of
                [_ | _] = ItemList ->
                    Title = lang:get("新玩家鼓励"),
                    Content =
                        notice:format(lang:get("亲爱的<color='#ffff00'>~ts</color>:\n  "
                                               "恭喜你获得新秀升级大礼包，内含大量经验、冒险经验奖励，可以帮助您更快提升等级战力哦，祝您在"
                                               "星辰世界中能够收获更大的欢乐{face_1,34}"),
                                      [{string_1, RoleName}]),
                    mail:send(Role, Title, Content, ItemList),
                    compensate_1;
                _ -> compensate_2
            end;
        _ -> compensate_3
    end.

compensate_reward_get(Lv, Id) ->
    List = compensate_data:list(),
    compensate_reward_get(List, Lv, Id).

compensate_reward_get([H | List], MyLv, _Id)
    when MyLv >= H ->
    compensate_reward_get(List, MyLv, H);
compensate_reward_get(_, _Lv0, Id) -> Id.

