-file("src/mod/head/head.erl", 1).

-module(head).

-behaviour(gen_server).

-export([init/0,
         start_link/0,
         login/1,
         buy_head/3,
         change/2,
         timer_tick/1,
         look/1,
         format_secs/1,
         push/2,
         renew/2,
         gm_change/7,
         buy_head_frame/2,
         change_frame/2,
         wear_head_frame/2,
         gm_change_frame/8,
         expire_frame/1]).

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

-file("src/mod/head/head.erl", 39).

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

-file("src/mod/head/head.erl", 40).

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

-file("src/mod/head/head.erl", 41).

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

-file("src/mod/head/head.erl", 42).

-file("inc/head.hrl", 1).

-record(m_head,
        {ver = 2 :: pos_integer(),
         id_now = 0 :: non_neg_integer(),
         time_buy = 0 :: non_neg_integer(),
         day = 0 :: non_neg_integer(),
         head = [] :: list(),
         frame_id_now = 0 :: non_neg_integer(),
         frame_time_buy = 0 :: non_neg_integer(),
         frame_day = 0 :: non_neg_integer(),
         head_frame = [] :: list()}).

-record(head,
        {id = 0 :: non_neg_integer(),
         time_buy = 0 :: non_neg_integer(),
         day = 0 :: non_neg_integer(),
         list = [] :: list()}).

-record(head_frame,
        {id = 0 :: non_neg_integer(),
         time_buy = 0 :: non_neg_integer(),
         day = 0 :: non_neg_integer(),
         list = [] :: list()}).

-file("src/mod/head/head.erl", 43).

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

-file("src/mod/head/head.erl", 44).

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

-file("src/mod/head/head.erl", 45).

-record(state, {}).

init() -> #m_head{}.

login(Role = #role{m_head = #m_head{id_now = 0}}) ->
    {ok, NRole} = expire_frame(Role),
    {ok, NRole};
login(Role = #role{m_head =
                       #m_head{time_buy = TimeBuy, day = Day}}) ->
    Now = date:unixtime(),
    Timer = #timer{id = head,
                   timeout = max(0, TimeBuy + Day * 86400 - Now) * 1000,
                   times = 1, m = head, f = timer_tick, a = []},
    Role1 = role_timer:set(Timer, Role),
    {ok, NRole} = expire_frame(Role1),
    {ok, NRole};
login(_Role) -> ok.

buy_head(Role = #role{sex = Sex, id = RoleId,
                      m_head = MHead},
         Id, List) ->
    case check_same(List, MHead#m_head.head) of
        ok ->
            case check_list(head_data:list(), List, Sex, 0) of
                {true, Price} ->
                    Loss = format:val_to_loss([{90002, 300 + Price}]),
                    case role_gain:do_notice(Loss, Role) of
                        {ok, Role1} ->
                            NewId = new_id(MHead, Id),
                            HeadList1 = case lists:keytake(NewId,
                                                           #head.id,
                                                           MHead#m_head.head)
                                            of
                                            {value, _, HeadList} -> HeadList;
                                            _ -> MHead#m_head.head
                                        end,
                            Now = date:unixtime(),
                            NewHead = #head{id = NewId, list = List,
                                            time_buy = Now, day = 60},
                            MHead1 = MHead#m_head{id_now = NewId,
                                                  time_buy = Now, day = 60,
                                                  head = [NewHead | HeadList1]},
                            Role2 = Role1#role{m_head = MHead1},
                            Timer = #timer{id = head,
                                           timeout = 60 * 86400 * 1000,
                                           times = 1, m = head, f = timer_tick,
                                           a = []},
                            NRole = role_timer:set(Timer, Role2),
                            update_data(RoleId, {List, Now, 60}),
                            {ok, NRole, NewHead};
                        {false, #loss{msg = Msg}} -> {false, Msg}
                    end;
                _ -> {false, lang:get("数据错误")}
            end;
        _ -> {false, lang:get("已购买同样的头像,不能重复购买")}
    end.

check_list([], [], _Sex, Price) -> {true, Price};
check_list([4], [], _Sex, Price) -> {true, Price};
check_list([], _List, _Sex, _Price) -> false;
check_list([Type | TypeList], List, Sex, Acc) ->
    case lists:keytake(Type, 1, List) of
        {value, {Type, Num}, List1} ->
            case head_data:get_head({Type, Num}) of
                #{price := Price, sex := Sex1}
                    when Sex1 =:= 2 orelse Sex1 =:= Sex ->
                    check_list(TypeList, List1, Sex, Acc + Price);
                _R ->
                    logger:debug("数据不正确 ~w", [{_R, Sex}], head, 129),
                    false
            end;
        _ -> false
    end.

check_same(_List, []) -> ok;
check_same(List,
           [#head{time_buy = TimeBuy, day = Day, list = List1}
            | HeadList]) ->
    case TimeBuy + Day * 86400 > date:unixtime() of
        true ->
            case check_same2(List, List1) of
                ok -> check_same(List, HeadList);
                _ -> false
            end;
        _ -> check_same2(List, HeadList)
    end.

check_same2(List, List1)
    when length(List) =/= length(List1) ->
    ok;
check_same2(List, List1) ->
    case List -- List1 of
        [] -> false;
        _ -> ok
    end.

look(A = {_Rid, _Platform, _ZoneId}) ->
    case ets:lookup(ets_head, A) of
        [{_, {List1, TimeBuy1, Day1}}] ->
            case TimeBuy1 + Day1 * 86400 > date:unixtime() of
                true -> {ok, List1 ++ get_frame(A)};
                _ -> only_frame(A)
            end;
        _ -> only_frame(A)
    end.

get_frame({Rid, Platform, ZoneId}) ->
    case ets:lookup(ets_head_frame, {Rid, Platform, ZoneId})
        of
        [{_, {List, TimeBuy, Day}}] ->
            case TimeBuy + Day * 86400 > date:unixtime() of
                true -> List;
                _ -> []
            end;
        _ -> []
    end.

only_frame({Rid, Platform, ZoneId}) ->
    case get_frame({Rid, Platform, ZoneId}) of
        [] -> false;
        List -> {ok, List}
    end.

new_id(#m_head{head = HeadList}, IdBuy) ->
    Now = date:unixtime(),
    case lists:keyfind(IdBuy, #head.id, HeadList) of
        false -> IdBuy;
        #head{time_buy = TimeBuy, day = Day}
            when TimeBuy + Day * 86400 < Now ->
            IdBuy;
        _ -> new_id(lists:seq(1, 3) -- [IdBuy], HeadList, IdBuy)
    end.

new_id([], HeadList, IdBuy) ->
    case lists:keysort(#head.time_buy, HeadList) of
        [#head{id = Id} | _] -> Id;
        _ -> IdBuy
    end;
new_id([Id | IdList], HeadList, IdBuy) ->
    Now = date:unixtime(),
    case lists:keyfind(Id, #head.id, HeadList) of
        false -> Id;
        #head{time_buy = TimeBuy, day = Day}
            when TimeBuy + Day * 86400 < Now ->
            IdBuy;
        _ -> new_id(IdList, HeadList, IdBuy)
    end.

change(#role{m_head = #m_head{id_now = Id}}, Id) ->
    {false, lang:get("正在使用当前头像")};
change(Role = #role{id = RoleId,
                    m_head = #m_head{head = HeadList} = MHead},
       Id) ->
    case lists:keyfind(Id, #head.id, HeadList) of
        #head{day = Day, time_buy = TimeBuy, list = List} ->
            TimeNow = date:unixtime(),
            case TimeBuy + Day * 86400 > TimeNow of
                true ->
                    update_data(RoleId, {List, TimeBuy, Day}),
                    Role1 = Role#role{m_head =
                                          MHead#m_head{id_now = Id,
                                                       time_buy = TimeBuy,
                                                       day = Day}},
                    Timer = #timer{id = head,
                                   timeout =
                                       max(0,
                                           TimeBuy + Day * 86400 -
                                               date:unixtime())
                                           * 1000,
                                   times = 1, m = head, f = timer_tick, a = []},
                    NRole = role_timer:set(Timer, Role1),
                    {ok, NRole, lang:get("使用成功")};
                _ -> {false, lang:get("头像已过期")}
            end;
        _ ->
            logger:debug("头像不存在 ~w", [{Id, HeadList}], head, 242),
            {false, lang:get("该头像不存在")}
    end.

renew(Role = #role{sex = Sex, id = RoleId,
                   m_head = MHead = #m_head{head = HeadList}},
      Id) ->
    case lists:keytake(Id, #head.id, HeadList) of
        {value,
         Head = #head{time_buy = TimeBuyOld, day = DayOld,
                      list = List},
         HeadList1} ->
            case check_time(TimeBuyOld, DayOld) of
                ok ->
                    case check_list(head_data:list(), List, Sex, 0) of
                        {true, Price} ->
                            Loss = format:val_to_loss([{90002, 300 + Price}]),
                            case role_gain:do_notice(Loss, Role) of
                                {ok, Role1} ->
                                    DayNew = DayOld + 60,
                                    NewHead = Head#head{day = DayNew},
                                    MHead1 = MHead#m_head{id_now = Id,
                                                          time_buy = TimeBuyOld,
                                                          day = DayNew,
                                                          head =
                                                              [NewHead
                                                               | HeadList1]},
                                    Role2 = Role1#role{m_head = MHead1},
                                    Timer = #timer{id = head,
                                                   timeout =
                                                       DayNew * 86400 * 1000,
                                                   times = 1, m = head,
                                                   f = timer_tick, a = []},
                                    NRole = role_timer:set(Timer, Role2),
                                    update_data(RoleId,
                                                {List, TimeBuyOld, DayNew}),
                                    {ok, NRole};
                                {false, #loss{msg = Msg}} -> {false, Msg}
                            end;
                        _ -> {false, lang:get("数据错误")}
                    end;
                {false, Reason} -> {false, Reason}
            end;
        _ -> {false, lang:get("改头像不存在,不能续费")}
    end.

check_time(TimeBuyOld, DayOld) ->
    Now = date:unixtime(),
    case TimeBuyOld + DayOld * 86400 > Now of
        true ->
            case TimeBuyOld + DayOld * 86400 - Now < 5 * 86400 of
                true -> ok;
                _ -> {false, lang:get("当前时间不低于5天,不能续费")}
            end;
        _ -> {false, lang:get("改头像已失效,不能续费")}
    end.

timer_tick(Role = #role{m_head =
                            #m_head{id_now = 0}}) ->
    logger:debug("倒计时触发啦", [], head, 298),
    Role1 = role_timer:del(head, Role),
    {ok, Role1};
timer_tick(Role = #role{id = RoleId, name = RoleName,
                        m_head =
                            Mhead = #m_head{id_now = OldId, time_buy = OldTime,
                                            day = OldDay, head = Heads}}) ->
    logger:debug("倒计时触发啦~w",
                 [{OldId, OldTime, OldDay}],
                 head,
                 302),
    Role1 = role_timer:del(head, Role),
    Now = date:unixtime(),
    case OldTime + OldDay * 86400 =< Now of
        true ->
            Heads1 = [Head
                      || Head = #head{time_buy = Time, day = Day} <- Heads,
                         Time + Day * 86400 > Now],
            case Heads1 of
                [] ->
                    logger:debug("没有剩余头像可换", [], head, 311),
                    Title = lang:get("自定义头像过期"),
                    Msg =
                        lang:get("亲爱的~ts，你的第~ts套头像已经到期，现已将头像更换为默认头像，可前往头像设置界面设定"
                                 "新的头像哦{face_1,3}"),
                    Content = notice:format(Msg,
                                            [{role_2, RoleName},
                                             {string_2, 1, OldId}]),
                    mail:send(Role, Title, Content),
                    delete_data(RoleId),
                    NRole = Role#role{m_head =
                                          Mhead#m_head{id_now = 0, time_buy = 0,
                                                       day = 0}},
                    push(NRole, 17300),
                    constellation:update_tar_role(NRole),
                    {ok, NRole};
                _ ->
                    logger:debug("还有剩余头像可以换", [], head, 322),
                    [#head{time_buy = TimeBuyNow, day = DayNow, id = IdNow,
                           list = List}
                     | _] =
                        lists:keysort(#head.time_buy, Heads1),
                    Title = lang:get("自定义头像过期"),
                    Msg =
                        lang:get("亲爱的~ts，你的第~ts套头像已经到期，现已将头像更换为第~ts套头像（剩余时间：~ts）"),
                    Content = notice:format(Msg,
                                            [{role_2, RoleName},
                                             {string_2, 1, OldId},
                                             {string_2, 5, IdNow},
                                             {string_2,
                                              1,
                                              format_secs(TimeBuyNow +
                                                              DayNow * 86400
                                                              - Now)}]),
                    mail:send(Role, Title, Content),
                    Timer = #timer{id = head,
                                   timeout =
                                       (TimeBuyNow + DayNow * 86400 - Now) *
                                           1000,
                                   times = 1, m = head, f = timer_tick, a = []},
                    Role2 = role_timer:set(Timer, Role1),
                    NewRole = Role2#role{m_head =
                                             Mhead#m_head{id_now = IdNow,
                                                          time_buy = TimeBuyNow,
                                                          day = DayNow}},
                    push(NewRole, 17300),
                    update_data(RoleId, {List, TimeBuyNow, DayNow}),
                    constellation:update_tar_role(NewRole),
                    {ok, NewRole}
            end;
        _ ->
            logger:debug("未过期", [], head, 337),
            Timer = #timer{id = head,
                           timeout = (OldTime + OldDay * 86400 - Now) * 1000,
                           times = 1, m = head, f = timer_tick, a = []},
            NRole = role_timer:set(Timer, Role1),
            {ok, NRole}
    end.

expire_frame(Role = #role{id = RoleId, name = RoleName,
                          m_head =
                              Mhead = #m_head{frame_id_now = WearId,
                                              frame_time_buy = FTimeBuy,
                                              frame_day = FDay,
                                              head_frame = FrameList}})
    when FrameList =/= [] ->
    Now = date:unixtime(),
    ExpireList = [Id
                  || #head_frame{id = Id, time_buy = TimeBuy, day = Day}
                         <- FrameList,
                     Day =/= 0 andalso TimeBuy + Day * 86400 - Now =< 0],
    NewFrameList = case ExpireList of
                       [_ | _] ->
                           Fun = fun (Id, Temp) ->
                                         lists:keydelete(Id,
                                                         #head_frame.id,
                                                         Temp)
                                 end,
                           lists:foldl(Fun, FrameList, ExpireList);
                       [] -> FrameList
                   end,
    Role1 = case lists:member(WearId, ExpireList) of
                true ->
                    FrameName = case head_data:get_head_frame({5, WearId})
                                    of
                                    #{name := Name} -> Name;
                                    _ -> lang:get("未知头像框")
                                end,
                    Title = lang:get("头像框过期提示"),
                    Msg =
                        lang:get("亲爱的~ts:\n您的头像框~ts已到达使用期限，将无法继续使用\n {panel_2, "
                                 "17300, 5, 点击查看, 1, 2}"),
                    Content = notice:format(Msg,
                                            [{role_2, RoleName},
                                             {string_2, 1, FrameName}]),
                    mail:send(Role, Title, Content),
                    delete_frame_data(RoleId),
                    Role#role{m_head =
                                  Mhead#m_head{frame_id_now = 0,
                                               frame_time_buy = 0,
                                               frame_day = 0,
                                               head_frame = NewFrameList}};
                _ ->
                    update_frame_data(RoleId,
                                      {[{5, WearId}], FTimeBuy, FDay}),
                    Role#role{m_head =
                                  Mhead#m_head{head_frame = NewFrameList}}
            end,
    MinTime = calc_time(NewFrameList, Now, 0),
    logger:debug("~w", [MinTime], head, 410),
    Role2 = case MinTime > 0 of
                true ->
                    Timer = #timer{id = frame_expire,
                                   timeout = 1000 * MinTime, m = head,
                                   f = expire_frame, a = []},
                    role_timer:set(Timer, Role1);
                _ -> Role1
            end,
    push(Role2, 17300),
    {ok, Role2};
expire_frame(Role) -> {ok, Role}.

calc_time([#head_frame{time_buy = TimeBuy, day = Day}
           | T],
          Now, 0)
    when Day =/= 0 ->
    Time = TimeBuy + Day * 86400 - Now,
    calc_time(T, Now, Time);
calc_time([#head_frame{time_buy = TimeBuy, day = Day}
           | T],
          Now, Time)
    when Day =/= 0 ->
    NewTime = TimeBuy + Day * 86400 - Now,
    case Time > NewTime of
        true -> calc_time(T, Now, NewTime);
        _ -> calc_time(T, Now, Time)
    end;
calc_time([#head_frame{day = Day} | T], Now, Time)
    when Day =:= 0 ->
    calc_time(T, Now, Time);
calc_time([], _, Time) -> Time.

format_secs(Sec) when Sec >= 86400 ->
    util:flist(lang:get("~w天"), [Sec div 86400]);
format_secs(Sec) when Sec >= 3600 ->
    util:flist(lang:get("~w小时"), [Sec div 3600]);
format_secs(Sec) when Sec >= 60 ->
    util:flist(lang:get("~w分"), [Sec div 60]);
format_secs(Sec) -> util:flist(lang:get("~w秒"), [Sec]).

push(#role{m_head = MHead}, Cmd = 17300) ->
    sys_conn:pack_send(Cmd, {MHead, 300}),
    ok.

buy_head_frame(Role = #role{sex = Sex, id = RoleId,
                            m_head = MHead},
               Id) ->
    case head_data:get_head_frame({5, Id}) of
        #{cost := Cost, sex := Sex1, end_time := TimeLimit,
          name := FrameName}
            when (Sex1 =:= 2 orelse Sex1 =:= Sex) andalso
                     TimeLimit =:= 0 ->
            Loss = format:val_to_loss(Cost),
            case role_gain:do_notice(Loss, Role) of
                {ok, Role1} ->
                    Now = date:unixtime(),
                    {HeadFrameList1, TimeBuy} = case lists:keytake(Id,
                                                                   #head_frame.id,
                                                                   MHead#m_head.head_frame)
                                                    of
                                                    {value,
                                                     HF = #head_frame{time_buy =
                                                                          OldTime},
                                                     HeadFrameList} ->
                                                        {[HF#head_frame{day =
                                                                            TimeLimit}
                                                          | HeadFrameList],
                                                         OldTime};
                                                    _ ->
                                                        {[#head_frame{id = Id,
                                                                      list =
                                                                          [{5,
                                                                            Id}],
                                                                      time_buy =
                                                                          Now,
                                                                      day =
                                                                          TimeLimit}
                                                          | MHead#m_head.head_frame],
                                                         Now}
                                                end,
                    MHead1 = MHead#m_head{frame_id_now = Id,
                                          frame_time_buy = TimeBuy,
                                          frame_day = TimeLimit,
                                          head_frame = HeadFrameList1},
                    Role2 = Role1#role{m_head = MHead1},
                    update_frame_data(RoleId,
                                      {[{5, Id}], TimeBuy, TimeLimit}),
                    {ok, Role3} = expire_frame(Role2),
                    {ok,
                     Role3,
                     notice:format(lang:get("成功兑换永久~ts头像框{face_1, 3}"),
                                   [{string_2, 5, FrameName}])};
                {false, #loss{msg = Msg}} -> {false, Msg}
            end;
        #{cost := Cost, sex := Sex1, end_time := TimeLimit,
          name := FrameName}
            when Sex1 =:= 2 orelse Sex1 =:= Sex ->
            Loss = format:val_to_loss(Cost),
            case role_gain:do_notice(Loss, Role) of
                {ok, Role1} ->
                    Now = date:unixtime(),
                    {HeadFrameList1, TimeBuy, Day, Msg} = case
                                                              lists:keytake(Id,
                                                                            #head_frame.id,
                                                                            MHead#m_head.head_frame)
                                                              of
                                                              {value,
                                                               HF =
                                                                   #head_frame{time_buy
                                                                                   =
                                                                                   OldTime,
                                                                               day
                                                                                   =
                                                                                   OldDay},
                                                               HeadFrameList} ->
                                                                  {[HF#head_frame{day
                                                                                      =
                                                                                      OldDay
                                                                                          +
                                                                                          TimeLimit}
                                                                    | HeadFrameList],
                                                                   OldTime,
                                                                   OldDay +
                                                                       TimeLimit,
                                                                   notice:format(lang:get("成功续费~ts头像框，可使用时间~ts{face_1, 3}"),
                                                                                 [{string_2,
                                                                                   5,
                                                                                   FrameName},
                                                                                  {string_2,
                                                                                   1,
                                                                                   format_secs(OldTime
                                                                                                   +
                                                                                                   (OldDay
                                                                                                        +
                                                                                                        TimeLimit
                                                                                                        +
                                                                                                        1)
                                                                                                       *
                                                                                                       86400
                                                                                                   -
                                                                                                   Now)}])};
                                                              _ ->
                                                                  {[#head_frame{id
                                                                                    =
                                                                                    Id,
                                                                                list
                                                                                    =
                                                                                    [{5,
                                                                                      Id}],
                                                                                time_buy
                                                                                    =
                                                                                    Now,
                                                                                day
                                                                                    =
                                                                                    TimeLimit}
                                                                    | MHead#m_head.head_frame],
                                                                   Now,
                                                                   TimeLimit,
                                                                   notice:format(lang:get("成功兑换~ts头像框，可使用时间~ts{face_1, 3}"),
                                                                                 [{string_2,
                                                                                   5,
                                                                                   FrameName},
                                                                                  {string_2,
                                                                                   1,
                                                                                   format_secs(TimeLimit
                                                                                                   *
                                                                                                   86400)}])}
                                                          end,
                    MHead1 = MHead#m_head{frame_id_now = Id,
                                          frame_time_buy = TimeBuy,
                                          frame_day = Day,
                                          head_frame = HeadFrameList1},
                    Role2 = Role1#role{m_head = MHead1},
                    {ok, Role3} = expire_frame(Role2),
                    update_frame_data(RoleId, {[{5, Id}], TimeBuy, Day}),
                    {ok, Role3, Msg};
                {false, #loss{msg = Msg}} -> {false, Msg}
            end;
        _ -> {false, lang:get("数据错误")}
    end;
buy_head_frame(_Role, _Id) -> {false, lang:get("数据错误")}.

change_frame(Role = #role{id = RoleId,
                          m_head = #m_head{frame_id_now = Id} = MHead},
             0) ->
    case Id of
        0 -> {false, lang:get("当前没有佩戴头像框，不用卸下")};
        _ ->
            delete_frame_data(RoleId),
            NRole = Role#role{m_head =
                                  MHead#m_head{frame_id_now = 0,
                                               frame_time_buy = 0,
                                               frame_day = 0}},
            {ok,
             NRole,
             lang:get("已取消<color='#ffff00'>头像框</color>的佩戴")}
    end;
change_frame(#role{m_head = #m_head{frame_id_now = Id}},
             Id) ->
    {false, lang:get("正在使用当前头像框")};
change_frame(Role = #role{id = RoleId,
                          m_head = #m_head{head_frame = HeadFrameList} = MHead},
             Id) ->
    case lists:keyfind(Id, #head_frame.id, HeadFrameList) of
        #head_frame{day = Day, time_buy = TimeBuy,
                    list = List} ->
            TimeNow = date:unixtime(),
            case TimeBuy + Day * 86400 > TimeNow orelse Day =:= 0 of
                true ->
                    update_frame_data(RoleId, {List, TimeBuy, Day}),
                    NRole = Role#role{m_head =
                                          MHead#m_head{frame_id_now = Id,
                                                       frame_time_buy = TimeBuy,
                                                       frame_day = Day}},
                    FrameName = case head_data:get_head_frame({5, Id}) of
                                    #{name := Name} -> Name;
                                    _ -> lang:get("未知头像框")
                                end,
                    {ok,
                     NRole,
                     notice:format(lang:get("佩戴~ts头像框，光彩照人{face_1,18}"),
                                   [{string_2, 5, FrameName}])};
                _ -> {false, lang:get("头像框已过期")}
            end;
        _ ->
            logger:debug("头像框不存在 ~w",
                         [{Id, HeadFrameList}],
                         head,
                         536),
            {false, lang:get("该头像框不存在")}
    end.

wear_head_frame({BaseId, TimeId},
                Role = #role{id = Id, name = Name}) ->
    case do_wear(BaseId, TimeId, Role) of
        {ok, NewRole, Msg} -> {ok, NewRole, Msg};
        {false, Msg} -> {false, Msg};
        _Err ->
            logger:error("兑换头像框错误:~w, ~ts, ~w",
                         [Id, Name, _Err],
                         head,
                         548)
    end;
wear_head_frame(_, _Role) ->
    {false, lang:get("没有可以使用的头像框")}.

do_wear(Id, TimeId,
        Role = #role{sex = Sex, id = RoleId, m_head = MHead}) ->
    case check_wear(Id, Role) of
        true ->
            case head_data:get_time(TimeId) of
                #{end_time := EndTime} when EndTime =:= 0 ->
                    case head_data:get_head_frame({5, Id}) of
                        #{sex := Sex1, name := FrameName}
                            when Sex1 =:= 2 orelse Sex1 =:= Sex ->
                            Now = date:unixtime(),
                            {HeadFrameList1, TimeBuy} = case lists:keytake(Id,
                                                                           #head_frame.id,
                                                                           MHead#m_head.head_frame)
                                                            of
                                                            {value,
                                                             HF =
                                                                 #head_frame{time_buy
                                                                                 =
                                                                                 OldTime},
                                                             HeadFrameList} ->
                                                                {[HF#head_frame{day
                                                                                    =
                                                                                    EndTime}
                                                                  | HeadFrameList],
                                                                 OldTime};
                                                            _ ->
                                                                {[#head_frame{id
                                                                                  =
                                                                                  Id,
                                                                              list
                                                                                  =
                                                                                  [{5,
                                                                                    Id}],
                                                                              time_buy
                                                                                  =
                                                                                  Now,
                                                                              day
                                                                                  =
                                                                                  EndTime}
                                                                  | MHead#m_head.head_frame],
                                                                 Now}
                                                        end,
                            MHead1 = MHead#m_head{frame_id_now = Id,
                                                  frame_time_buy = TimeBuy,
                                                  frame_day = EndTime,
                                                  head_frame = HeadFrameList1},
                            Role1 = Role#role{m_head = MHead1},
                            update_frame_data(RoleId,
                                              {[{5, Id}], TimeBuy, EndTime}),
                            {ok, Role2} = expire_frame(Role1),
                            {ok,
                             Role2,
                             notice:format(lang:get("成功兑换永久~ts头像框{face_1, 3}"),
                                           [{string_2, 5, FrameName}])};
                        _ -> {false, lang:get("数据错误")}
                    end;
                #{end_time := EndTime} when EndTime =/= 0 ->
                    case head_data:get_head_frame({5, Id}) of
                        #{sex := Sex1, name := FrameName}
                            when Sex1 =:= 2 orelse Sex1 =:= Sex ->
                            Now = date:unixtime(),
                            {HeadFrameList1, TimeBuy, Day, Msg} = case
                                                                      lists:keytake(Id,
                                                                                    #head_frame.id,
                                                                                    MHead#m_head.head_frame)
                                                                      of
                                                                      {value,
                                                                       HF =
                                                                           #head_frame{time_buy
                                                                                           =
                                                                                           OldTime,
                                                                                       day
                                                                                           =
                                                                                           OldDay},
                                                                       HeadFrameList} ->
                                                                          {[HF#head_frame{day
                                                                                              =
                                                                                              OldDay
                                                                                                  +
                                                                                                  EndTime}
                                                                            | HeadFrameList],
                                                                           OldTime,
                                                                           OldDay
                                                                               +
                                                                               EndTime,
                                                                           notice:format(lang:get("成功续费~ts头像框，可使用时间~ts{face_1, 3}"),
                                                                                         [{string_2,
                                                                                           5,
                                                                                           FrameName},
                                                                                          {string_2,
                                                                                           1,
                                                                                           format_secs(OldTime
                                                                                                           +
                                                                                                           (OldDay
                                                                                                                +
                                                                                                                EndTime
                                                                                                                +
                                                                                                                1)
                                                                                                               *
                                                                                                               86400
                                                                                                           -
                                                                                                           Now)}])};
                                                                      _ ->
                                                                          {[#head_frame{id
                                                                                            =
                                                                                            Id,
                                                                                        list
                                                                                            =
                                                                                            [{5,
                                                                                              Id}],
                                                                                        time_buy
                                                                                            =
                                                                                            Now,
                                                                                        day
                                                                                            =
                                                                                            EndTime}
                                                                            | MHead#m_head.head_frame],
                                                                           Now,
                                                                           EndTime,
                                                                           notice:format(lang:get("成功兑换~ts头像框，可使用时间~ts{face_1, 3}"),
                                                                                         [{string_2,
                                                                                           5,
                                                                                           FrameName},
                                                                                          {string_2,
                                                                                           1,
                                                                                           format_secs(EndTime
                                                                                                           *
                                                                                                           86400)}])}
                                                                  end,
                            MHead1 = MHead#m_head{frame_id_now = Id,
                                                  frame_time_buy = TimeBuy,
                                                  frame_day = Day,
                                                  head_frame = HeadFrameList1},
                            Role1 = Role#role{m_head = MHead1},
                            {ok, Role2} = expire_frame(Role1),
                            update_frame_data(RoleId,
                                              {[{5, Id}], TimeBuy, Day}),
                            {ok, Role2, Msg};
                        _ -> {false, lang:get("数据错误")}
                    end;
                _ -> {false, lang:get("无法穿戴")}
            end;
        {false, Msg} -> {false, Msg};
        _ -> {false, lang:get("无法穿戴")}
    end.

check_wear(BaseId, #role{m_head = MHead}) ->
    case lists:keytake(BaseId,
                       #head_frame.id,
                       MHead#m_head.head_frame)
        of
        {value, #head_frame{day = OldDay}, _}
            when OldDay =:= 0 ->
            {false, lang:get("您已永久拥有这个头像框")};
        _ -> true
    end.

start_link() ->
    gen_server:start_link({local, head}, head, [], []).

init([]) ->
    logger:info("开始启动...", [], head, 615),
    process_flag(trap_exit, true),
    dets:open_file(dets_head,
                   [{file, "./dets/head.dets"}, {keypos, 1}, {type, set}]),
    ets:new(ets_head,
            [set, named_table, public, {keypos, 1}]),
    dets:to_ets(dets_head, ets_head),
    dets:open_file(dets_head_frame,
                   [{file, "./dets/head_frame.dets"},
                    {keypos, 1},
                    {type, set}]),
    ets:new(ets_head_frame,
            [set, named_table, public, {keypos, 1}]),
    dets:to_ets(dets_head_frame, ets_head_frame),
    logger:info("启动完成", [], head, 624),
    {ok, #state{}}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...", [head], head, 637),
    util:close_dets(dets_head),
    logger:info("[~w] 关闭完成", [head], head, 639),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

delete_data(RoleId) ->
    ets:delete(ets_head, RoleId),
    dets:delete(dets_head, RoleId).

update_data(RoleId, List) ->
    ets:insert(ets_head, {RoleId, List}),
    dets:insert(dets_head, {RoleId, List}).

delete_frame_data(RoleId) ->
    ets:delete(ets_head_frame, RoleId),
    dets:delete(dets_head_frame, RoleId).

update_frame_data(RoleId, List) ->
    ets:insert(ets_head_frame, {RoleId, List}),
    dets:insert(dets_head_frame, {RoleId, List}).

gm_change(#role{m_head = #m_head{id_now = 0}}, _Year,
          _Month, _Day, _Hour, _Min, _Sec) ->
    {false, lang:get("未购买头像,不能修改")};
gm_change(Role = #role{m_head =
                           MHead = #m_head{id_now = Id, day = DayLimit,
                                           head = Heads}},
          Year, Month, Day, Hour, Minute, Second) ->
    Time = date:datetime_to_seconds({Year,
                                     Month,
                                     Day,
                                     Hour,
                                     Minute,
                                     Second}),
    case lists:keytake(Id, #head.id, Heads) of
        {value, Head, Heads1} ->
            Head1 = Head#head{time_buy = Time},
            Role1 = Role#role{m_head =
                                  MHead#m_head{time_buy = Time,
                                               head = [Head1 | Heads1]}},
            Timer = #timer{id = head,
                           timeout =
                               max(0, Time + DayLimit * 86400 - date:unixtime())
                                   * 1000,
                           times = 1, m = head, f = timer_tick, a = []},
            NRole = role_timer:set(Timer, Role1),
            push(NRole, 17300),
            {ok, NRole};
        _ -> {false, lang:get("错误数据")}
    end.

gm_change_frame(#role{m_head =
                          #m_head{frame_id_now = 0}},
                0, _Year, _Month, _Day, _Hour, _Min, _Sec) ->
    {false, lang:get("未穿戴头像框,不能修改")};
gm_change_frame(Role = #role{m_head =
                                 #m_head{frame_id_now = Id}},
                0, Year, Month, Day, Hour, Minute, Second) ->
    gm_change_frame(Role,
                    Id,
                    Year,
                    Month,
                    Day,
                    Hour,
                    Minute,
                    Second);
gm_change_frame(Role = #role{m_head =
                                 MHead = #m_head{head_frame = HeadFrames}},
                Id, Year, Month, Day, Hour, Minute, Second) ->
    Time = date:datetime_to_seconds({Year,
                                     Month,
                                     Day,
                                     Hour,
                                     Minute,
                                     Second}),
    case lists:keytake(Id, #head_frame.id, HeadFrames) of
        {value, HeadFrame, List1} ->
            HeadF1 = HeadFrame#head_frame{time_buy = Time},
            Role1 = Role#role{m_head =
                                  MHead#m_head{head_frame = [HeadF1 | List1]}},
            {ok, NRole} = expire_frame(Role1),
            push(NRole, 17300),
            {ok, NRole};
        _ -> {false, lang:get("错误数据")}
    end.

