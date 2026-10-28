-file("src/mod/lottery/lottery.erl", 1).

-module(lottery).

-export([lottery/5,
         data_init/0,
         data_init/1,
         item_issue/1,
         time_to_num/1,
         next_item/3,
         join_list/2,
         detail/2,
         detail_num/3,
         time_get/0,
         time_request/0,
         head_add/2,
         push_16900/3,
         push_16901/1,
         request_history/1,
         data_pos_shuffle/0,
         time_open/0,
         rare_get/0,
         gold_gold_bind_get/0,
         gold_min_max_get/0,
         broadcast_reward/3,
         broadcast_start/0,
         broadcast_end/0]).

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

-file("src/mod/lottery/lottery.erl", 41).

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

-file("src/mod/lottery/lottery.erl", 42).

-file("inc/lottery.hrl", 1).

-record(lottery,
        {idx = 0 :: non_neg_integer(),
         ver = 2,
         idx_temp = 0 :: non_neg_integer(),
         item_idx = 0 :: non_neg_integer(),
         item_id = 0 :: non_neg_integer(),
         item_count = 0 :: non_neg_integer(),
         pos = 0 :: non_neg_integer(),
         gold_type = 0 :: non_neg_integer(),
         gold_once = 1 :: non_neg_integer(),
         times_sum = 0 :: non_neg_integer(),
         times_now = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         lucky_num = 0 :: non_neg_integer(),
         times_lottery = 0 :: non_neg_integer(),
         state = 0 :: non_neg_integer(),
         num_sum = 0 :: non_neg_integer(),
         hot = 0 :: non_neg_integer(),
         price = 0 :: non_neg_integer(),
         rare = 0 :: non_neg_integer(),
         sort = 0 :: non_neg_integer(),
         role_id = {0, "", 0},
         role_name = "" :: list(),
         history = [] :: list(),
         num_list = [] :: list(),
         id_data = 0 :: non_neg_integer(),
         left_list = [] :: list(),
         buy_list = [] :: list(),
         history_deal = [] :: list()}).

-record(lottery_history,
        {time = 0 :: non_neg_integer(),
         num = 0 :: non_neg_integer(),
         role_id = {0, "", 0} :: list(),
         role_name = "" :: list(),
         item_idx = 0 :: non_neg_integer(),
         item_id = 0 :: non_neg_integer(),
         count = 0 :: non_neg_integer()}).

-record(lottery_mail,
        {idx = 0 :: non_neg_integer(),
         role_id = {0, "", 0} :: list(),
         title = "" :: list(),
         content = "" :: list(),
         item_list = "" :: list(),
         time = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer()}).

-record(lottery_reward_log,
        {idx = 0 :: non_neg_integer(),
         role_id = {0, "", 0} :: list(),
         role_name = "" :: list(),
         item_idx = 0 :: non_neg_integer(),
         item_id = 0 :: non_neg_integer(),
         item_count = 0 :: non_neg_integer(),
         times_buy = 0 :: non_neg_integer(),
         times_sum = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer()}).

-file("src/mod/lottery/lottery.erl", 43).

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

-file("src/mod/lottery/lottery.erl", 44).

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

-file("src/mod/lottery/lottery.erl", 45).

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

-file("src/mod/lottery/lottery.erl", 46).

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

-file("src/mod/lottery/lottery.erl", 47).

-file("inc/log.hrl", 1).

-file("src/mod/lottery/lottery.erl", 48).

-file("inc/condition.hrl", 1).

-record(condition,
        {label :: undefined | atom(),
         op = eq ::
             ue | eq | lt | gt | le | ge | range | include,
         val :: undefined | term(),
         msg = "" :: list()}).

-file("src/mod/lottery/lottery.erl", 49).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/lottery/lottery.erl", 50).

time_request() ->
    case lottery_local:time_get() of
        {Status, TimeStart, TimeEnd} ->
            {Status, TimeStart, TimeEnd};
        _ -> {0, 0, 0}
    end.

time_get() ->
    case lottery_mgr:get_data(config_time) of
        [_ | _] = List -> time_get(List);
        _ ->
            case lottery_data:time_list() of
                [_ | _] = List1 -> time_get(List1);
                _ -> {no_open, {0, 0}}
            end
    end.

time_get([First | _Tail] = List) ->
    Unixtime = date:unixtime(),
    Week = date:day_of_the_week(Unixtime),
    time_get(List, Unixtime, Week, First).

time_get([], Unixtime, Week,
         {{Week1, H1, Min1, S1}, {Week2, H2, Min2, S2}}) ->
    {Y1, M1, D1} = weed_to_ymd(Unixtime, Week, Week1, 7),
    {Y2, M2, D2} = weed_to_ymd(Unixtime, Week, Week2, 7),
    Time1 = date:datetime_to_seconds({Y1,
                                      M1,
                                      D1,
                                      H1,
                                      Min1,
                                      S1}),
    Time2 = date:datetime_to_seconds({Y2,
                                      M2,
                                      D2,
                                      H2,
                                      Min2,
                                      S2}),
    logger:debug("===============~w",
                 [{{Y1, M1, D1},
                   Time1,
                   Time2,
                   date:seconds_to_datetime(Unixtime),
                   date:seconds_to_datetime(Time1),
                   date:seconds_to_datetime(Time2)}],
                 lottery,
                 85),
    {idle, {Time1, Time2}};
time_get([{{Week1, H1, Min1, S1}, {Week2, H2, Min2, S2}}
          | Tail],
         Unixtime, Week, First) ->
    {Y1, M1, D1} = weed_to_ymd(Unixtime, Week, Week1, 0),
    {Y2, M2, D2} = weed_to_ymd(Unixtime, Week, Week2, 0),
    Time1 = date:datetime_to_seconds({Y1,
                                      M1,
                                      D1,
                                      H1,
                                      Min1,
                                      S1}),
    Time2 = date:datetime_to_seconds({Y2,
                                      M2,
                                      D2,
                                      H2,
                                      Min2,
                                      S2}),
    logger:debug("===============~w",
                 [{Time1,
                   Time2,
                   date:seconds_to_datetime(Unixtime),
                   date:seconds_to_datetime(Time1),
                   date:seconds_to_datetime(Time2)}],
                 lottery,
                 92),
    case Unixtime < Time1 of
        true -> {idle, {Time1, Time2}};
        _ ->
            case Unixtime < Time2 of
                true ->
                    case Time2 - Unixtime > 3 * 60 of
                        true -> {lottery_1, {Time1, Time2}};
                        _ -> {lottery_2, {Time1, Time2}}
                    end;
                _ -> time_get(Tail, Unixtime, Week, First)
            end
    end;
time_get([{{Y, M, D}, {H1, Min1, S1}, {H2, Min2, S2}}
          | Tail],
         Unixtime, Week, First) ->
    Time1 = date:datetime_to_seconds({Y,
                                      M,
                                      D,
                                      H1,
                                      Min1,
                                      S1}),
    Time2 = date:datetime_to_seconds({Y,
                                      M,
                                      D,
                                      H2,
                                      Min2,
                                      S2}),
    logger:debug("===============~w",
                 [{Time1,
                   Time2,
                   date:seconds_to_datetime(Unixtime),
                   date:seconds_to_datetime(Time1),
                   date:seconds_to_datetime(Time2)}],
                 lottery,
                 113),
    case Unixtime < Time1 of
        true -> {idle, {Time1, Time2}};
        _ ->
            case Unixtime < Time2 of
                true ->
                    case Time2 - Unixtime > 3 * 60 of
                        true -> {lottery_1, {Time1, Time2}};
                        _ -> {lottery_2, {Time1, Time2}}
                    end;
                _ -> time_get(Tail, Unixtime, Week, First)
            end
    end;
time_get([_ | Tail], Unixtime, Week, First) ->
    time_get(Tail, Unixtime, Week, First);
time_get([], _Unixtime, _Week, _) -> {no_open, {0, 0}}.

weed_to_ymd(Unixtime, Week, Week1, Day) ->
    case Week1 >= Week of
        true ->
            {{Y, M, D}, _} = date:seconds_to_datetime(Unixtime +
                                                          (Week1 - Week) * 86400
                                                          + Day * 86400),
            {Y, M, D};
        _ ->
            {{Y, M, D}, _} = date:seconds_to_datetime(Unixtime -
                                                          (Week - Week1) * 86400
                                                          + Day * 86400),
            {Y, M, D}
    end.

push_16900(Role, Type, Time) ->
    ListTime = time_open(),
    case lottery_local:request(Role, Type, Time) of
        {Time1,
         ListItem,
         ListMy,
         ListHistory,
         TimesAll,
         FocusList}
            when is_list(ListItem) andalso is_list(ListHistory) ->
            {Time1,
             ListItem,
             ListMy,
             ListHistory,
             TimesAll,
             FocusList,
             ListTime};
        _R -> {Time, [], [], [], 0, [], ListTime}
    end.

push_16901(Role) ->
    case big_world:call(lottery, join_list, [Role]) of
        ItemList when is_list(ItemList) -> ItemList;
        _ -> []
    end.

request_history(PageNum) ->
    case lottery_local:request_history(PageNum) of
        {PageSum, PageNow, ListHistory} ->
            {PageSum, PageNow, ListHistory};
        _ -> {0, 1, []}
    end.

lottery(#role{id = RoleId} = Role, Idx, ItemIdx, Count,
        All)
    when All =:= 0 ->
    case lottery_data:item_data(ItemIdx) of
        #{type := GoldType, gold := GoldOnce} ->
            Loss = format:val_to_loss([{GoldType,
                                        GoldOnce * Count}]),
            case role_gain:do_notice(Loss, Role) of
                {ok, Role1} ->
                    case ets:lookup(lottery, Idx) of
                        [#lottery{times_now = TimesNow, times_sum = TimesSum}
                         | _]
                            when TimesNow < TimesSum ->
                            case big_world:call(lottery_mgr,
                                                call,
                                                [{lottery,
                                                  convert(Role),
                                                  Idx,
                                                  ItemIdx,
                                                  Count,
                                                  All}])
                                of
                                {ok, {Lottery, TimesMy, NewCount}} ->
                                    reply(Role, NewCount),
                                    {ok, Role1, {Lottery, TimesMy, 0}};
                                {error, timeout} ->
                                    logger:error("一元夺宝超时~w",
                                                 [{RoleId,
                                                   Idx,
                                                   ItemIdx,
                                                   Count}],
                                                 lottery,
                                                 182),
                                    {ok, Role1};
                                {false, Lottery, TimesMy, Msg} ->
                                    {false, {Lottery, TimesMy, Msg}};
                                {false, Reason} -> {false, Reason};
                                _R ->
                                    logger:error("一元夺宝未知错误,这就很尴尬啦~w",
                                                 [{RoleId,
                                                   Idx,
                                                   ItemIdx,
                                                   Count,
                                                   _R}],
                                                 lottery,
                                                 189),
                                    {false, lang:get("当前活动不可参加")}
                            end;
                        [#lottery{} = Lottery | _] ->
                            TimesMy = lottery_local:get_times_buy(Role, Idx),
                            {false, {Lottery, TimesMy}};
                        _ -> {false, lang:get("数据错误,请重新打开面板")}
                    end;
                {false, #loss{msg = Msg}} -> {false, Msg}
            end;
        _R -> {false, lang:get("该物品不可竞拍")}
    end;
lottery(#role{id = RoleId} = Role, Idx, ItemIdx, Count,
        All) ->
    case lottery_data:item_data(ItemIdx) of
        #{type := GoldType, gold := GoldOnce} ->
            Lable = case GoldType of
                        90000 -> coin;
                        90002 -> gold;
                        90003 -> gold_bind;
                        _ ->
                            logger:error("一元夺宝错误类型~w",
                                         [GoldType],
                                         lottery,
                                         211),
                            gold
                    end,
            case role_cond:check([#condition{label = Lable, op = ge,
                                             val = GoldOnce * Count}],
                                 Role)
                of
                true ->
                    case big_world:call(lottery_mgr,
                                        call,
                                        [{lottery,
                                          convert(Role),
                                          Idx,
                                          ItemIdx,
                                          Count,
                                          All}])
                        of
                        {ok, {Lottery, TimesMy, NewCount}} ->
                            reply(Role, NewCount),
                            Loss = format:val_to_loss([{GoldType,
                                                        GoldOnce * NewCount}]),
                            case role_gain:do_notice(Loss, Role) of
                                {ok, Role1} ->
                                    {ok, Role1, {Lottery, TimesMy, 0}};
                                {false, #loss{msg = Msg}} -> {false, Msg}
                            end;
                        {error, timeout} ->
                            logger:error("一元夺宝超时~w",
                                         [{RoleId, Idx, ItemIdx, Count}],
                                         lottery,
                                         227),
                            Loss = format:val_to_loss([{GoldType,
                                                        GoldOnce * Count}]),
                            case role_gain:do_notice(Loss, Role) of
                                {ok, Role1} -> {ok, Role1};
                                {false, #loss{msg = Msg}} -> {false, Msg}
                            end;
                        {false, Reason} -> {false, Reason};
                        _R ->
                            logger:debug("一元夺宝够买错误~w", [_R], lottery, 237),
                            {false, lang:get("当前活动不可参加")}
                    end;
                {false, #condition{msg = FailMsg}} -> {false, FailMsg}
            end;
        _R ->
            logger:debug("===========~w",
                         [{Idx, Count, _R}],
                         lottery,
                         243),
            {false, lang:get("该物品不可竞拍")}
    end.

convert(#role{id = RoleId, name = RoleName,
              link = #link{conn_pid = ConnPid}, account = Account,
              channel_reg = ChannelReg, lev = Lev,
              classes = Classes}) ->
    #{id => RoleId, name => RoleName, conn_pid => ConnPid,
      account => Account, channel_reg => ChannelReg,
      lev => Lev, classes => Classes}.

join_list(Role, PageNum) ->
    case lottery_local:join_list(Role, PageNum) of
        {ok, Data} -> Data;
        _ -> {[], [], 0, 1}
    end.

detail(Role, Idx) ->
    case lottery_local:detail(Role, Idx) of
        {error, _Error} -> {false, lang:get("暂时获取不了数据")};
        Return -> Return
    end.

detail_num(Role, Idx, PageNow) ->
    case lottery_local:detail_num(Role, Idx, PageNow) of
        {error, _Error} -> {false, lang:get("暂时获取不了数据")};
        Return -> Return
    end.

next_item(ItemIdx, Pos, GoldType) ->
    LotteryList = ets:select(lottery,
                             [{#lottery{gold_type = 90003, pos = '$1', _ = '_'},
                               [{'>', '$1', 0}],
                               ['$_']}]),
    logger:debug("=======next_item=========~w",
                 [length(LotteryList)],
                 lottery,
                 277),
    {Min, Max} = gold_min_max_get(),
    NewGoldType = if length(LotteryList) < Min -> 90003;
                     length(LotteryList) >= Max -> 90002;
                     true -> util:rand_list([90003, 90002])
                  end,
    case ets:lookup(lottery_misc, {data, GoldType}) of
        [{_, List} | _] ->
            case lists:keytake(ItemIdx, 1, List) of
                {value,
                 {ItemIdx, Odds, ItemIdxMax, Total, Rare},
                 List1} ->
                    logger:debug(" 上新道具没问题 ~n", [], lottery, 288),
                    lottery_mgr:cut_times_rare(Rare),
                    List2 = [{ItemIdx, Odds, ItemIdxMax + 1, Total, Rare}
                             | List1],
                    lottery_mgr:update_data(lottery_misc,
                                            {{data, GoldType}, List2});
                _R1 ->
                    logger:debug("没有剩余次数啦~w",
                                 [{_R1, GoldType, ItemIdx}],
                                 lottery,
                                 293),
                    ignore
            end;
        _ ->
            logger:debug("上新物品出错啦~w", [GoldType], lottery, 297),
            ignore
    end,
    List3 = data_init3(NewGoldType, 1, []),
    case List3 of
        [NextId | _] -> item_init(NextId, Pos);
        _R ->
            logger:debug("没有剩余次数啦~w",
                         [{ItemIdx, NewGoldType, _R}],
                         lottery,
                         305),
            ignore
    end.

gold_min_max_get() ->
    case lottery_data:gold_num() of
        [{Min, Max, _Rare, _Gold, _GoldBind} | _] -> {Min, Max};
        _ -> {5, 6}
    end.

rare_get() ->
    case lottery_data:gold_num() of
        [{_Min, _Max, Rare, _Gold, _GoldBind} | _] -> Rare;
        _ -> 4
    end.

gold_gold_bind_get() ->
    case lottery_data:gold_num() of
        [{_Min, _Max, _Rare, Gold, GoldBind} | _] ->
            {Gold, GoldBind};
        _ -> {1, 100}
    end.

data_init() ->
    put(max_lottery_id, 1),
    put(max_pos, 1),
    List = lottery_data:list(),
    {List1, GoldTypeList} = data_init(List, [], []),
    List2 = [{{data, GoldType}, Data}
             || {GoldType, Data} <- List1],
    lottery_mgr:update_data(lottery_misc, List2),
    data_init2(GoldTypeList),
    ok.

data_init(gm) ->
    put(max_pos, 1),
    List = lottery_data:list(),
    {List1, GoldTypeList} = data_init(List, [], []),
    List2 = [{{data, GoldType}, Data}
             || {GoldType, Data} <- List1],
    lottery_mgr:update_data(lottery_misc, List2),
    data_init2(GoldTypeList),
    ok.

data_init([], List, GoldType) -> {List, GoldType};
data_init([{ItemIdx, Odds, Type, Max, Total, Rare}
           | Tail],
          Acc, GoldType) ->
    case lists:keytake(Type, 1, Acc) of
        {value, {Type, List}, Acc1} ->
            data_init(Tail,
                      [{Type, [{ItemIdx, Odds, Max, Total, Rare} | List]}
                       | Acc1],
                      GoldType);
        _ ->
            data_init(Tail,
                      [{Type, [{ItemIdx, Odds, Max, Total, Rare}]} | Acc],
                      [Type | GoldType])
    end.

data_init2([]) -> ok;
data_init2([Type | Tail]) ->
    LotteryNum = case Type of
                     90002 -> 15;
                     _ -> 6
                 end,
    List2 = data_init3(Type, LotteryNum, []),
    item_init(List2, 1),
    data_init2(Tail).

data_init3(GoldType, Num, ItemIdxList) when Num > 0 ->
    case lottery_mgr:get_data({data, GoldType}) of
        [] -> data_init3(GoldType, Num - 1, ItemIdxList);
        List ->
            {NewRandList, NewList2} = list_pick(List),
            NewList1 = new_rand_list(NewRandList, []),
            case util:rand_list(NewList1, 2) of
                {ItemIdx, Odds, Max, Total, Rare} ->
                    lottery_mgr:add_times_rare(Rare),
                    case Total - 1 =< 0 of
                        true ->
                            logger:debug("======最后一个啦====~w",
                                         [ItemIdx],
                                         lottery,
                                         387),
                            lottery_mgr:update_data(lottery_misc,
                                                    {{data, GoldType},
                                                     lists:keydelete(ItemIdx,
                                                                     1,
                                                                     NewList1)
                                                         ++ NewList2}),
                            data_init3(GoldType,
                                       Num - 1,
                                       [ItemIdx | ItemIdxList]);
                        _ ->
                            logger:debug("==剩余数量=~w", [Total], lottery, 392),
                            lottery_mgr:update_data(lottery_misc,
                                                    {{data, GoldType},
                                                     [{ItemIdx,
                                                       Odds,
                                                       Max - 1,
                                                       Total - 1,
                                                       Rare}
                                                      | lists:keydelete(ItemIdx,
                                                                        1,
                                                                        NewList1)]
                                                         ++ NewList2}),
                            data_init3(GoldType,
                                       Num - 1,
                                       [ItemIdx | ItemIdxList])
                    end;
                _ -> data_init3(GoldType, Num - 1, ItemIdxList)
            end
    end;
data_init3(_GoldType, _Num, List) -> List.

new_rand_list([], Acc) -> Acc;
new_rand_list([{ItemIdx, _Odds, Max, Total, _Rare}
               | List],
              Acc) ->
    case lottery_data:item_data(ItemIdx) of
        #{odds := Odds, rare := Rare} ->
            new_rand_list(List,
                          [{ItemIdx, Odds, Max, Total, Rare} | Acc]);
        _ -> new_rand_list(List, Acc)
    end.

list_pick(List) ->
    TimesRare = lottery_mgr:get_times_rare(),
    list_pick(List, [], [], TimesRare).

list_pick([], Acc1, Acc2, _TimesRare) -> {Acc1, Acc2};
list_pick([{ItemIdx, Odds, Max, Total, Rare} | Tail],
          Acc1, Acc2, TimesRare)
    when Max > 0 andalso Rare =:= 0 ->
    list_pick(Tail,
              [{ItemIdx, Odds, Max, Total, Rare} | Acc1],
              Acc2,
              TimesRare);
list_pick([{ItemIdx, Odds, Max, Total, Rare} | Tail],
          Acc1, Acc2, TimesRare) ->
    RareMax = rare_get(),
    case Max > 0 andalso TimesRare < RareMax of
        true ->
            list_pick(Tail,
                      [{ItemIdx, Odds, Max, Total, Rare} | Acc1],
                      Acc2,
                      TimesRare);
        _ ->
            list_pick(Tail,
                      Acc1,
                      [{ItemIdx, Odds, Max, Total, Rare} | Acc2],
                      TimesRare)
    end.

item_init([], _Pos) -> ok;
item_init([ItemIdx | List], _Pos) ->
    case lottery_data:item_data(ItemIdx) of
        #{item_id := ItemId, item_count := ItemCount,
          sum := Sum, type := Type, gold := Gold, price := Price,
          hot := Hot, rare := Rare, sort := Sort} ->
            {NumList1, LeftList} = num_list_get(Sum),
            NumList2 = util:shuffle(NumList1),
            Idx1 = case get(max_lottery_id) of
                       Idx when is_integer(Idx) ->
                           put(max_lottery_id, get(max_lottery_id) + 1),
                           Idx;
                       _ ->
                           put(max_lottery_id, 1),
                           1
                   end,
            Pos = put(max_pos, get(max_pos) + 1),
            lottery_mgr:update_data(#lottery{idx = item_issue(Idx1),
                                             idx_temp = Idx1,
                                             id_data =
                                                 util:rand_list([1, 2, 3]),
                                             pos = Pos, item_idx = ItemIdx,
                                             item_id = ItemId,
                                             item_count = ItemCount,
                                             times_sum = Sum, gold_once = Gold,
                                             gold_type = Type,
                                             num_list = NumList2, state = 1,
                                             left_list = LeftList,
                                             price = Price, hot = Hot,
                                             rare = Rare, sort = Sort}),
            item_init(List, Pos + 1);
        _ ->
            logger:error("一元夺宝没有item数据错误~w",
                         [ItemIdx],
                         lottery,
                         448),
            item_init(List, _Pos)
    end;
item_init(ItemIdx, Pos) ->
    case lottery_data:item_data(ItemIdx) of
        #{item_id := ItemId, item_count := ItemCount,
          sum := Sum, type := Type, gold := Gold, price := Price,
          hot := Hot, rare := Rare, sort := Sort} ->
            {NumList1, LeftList} = num_list_get(Sum),
            NumList2 = util:shuffle(NumList1),
            Idx1 = case get(max_lottery_id) of
                       Idx when is_integer(Idx) ->
                           put(max_lottery_id, get(max_lottery_id) + 1),
                           Idx;
                       _ ->
                           put(max_lottery_id, 1),
                           1
                   end,
            lottery_mgr:update_data(#lottery{idx = item_issue(Idx1),
                                             idx_temp = Idx1,
                                             id_data =
                                                 util:rand_list([1, 2, 3]),
                                             pos = Pos, item_idx = ItemIdx,
                                             item_id = ItemId,
                                             item_count = ItemCount,
                                             times_sum = Sum, gold_once = Gold,
                                             gold_type = Type,
                                             num_list = NumList2, state = 1,
                                             left_list = LeftList,
                                             price = Price, hot = Hot,
                                             rare = Rare, sort = Sort});
        _ ->
            logger:error("一元夺宝没有item数据错误~w",
                         [ItemIdx],
                         lottery,
                         466),
            ignore
    end.

data_pos_shuffle() ->
    ets:safe_fixtable(lottery, true),
    case ets:info(lottery, size) of
        Size when Size > 0 ->
            First = ets:first(lottery),
            ets_clean(First,
                      lottery,
                      util:shuffle(lists:seq(1, Size)));
        _ -> ignore
    end,
    ets:safe_fixtable(lottery, false),
    ok.

ets_clean('$end_of_table', _Tab, _List) -> ok;
ets_clean(_Key, _Tab, []) -> ok;
ets_clean(Key, Tab, [Pos | PosTail]) ->
    case ets:lookup(Tab, Key) of
        [Val | _] -> ets:insert(Tab, Val#lottery{pos = Pos});
        _ -> ignore
    end,
    NextKey = ets:next(Tab, Key),
    ets_clean(NextKey, Tab, PosTail).

num_list_get(Sum) ->
    case Sum rem 1000 of
        0 ->
            NumList = lists:seq(1000, Sum, 1000),
            {[{Num, 1} || Num <- NumList], []};
        Left ->
            NumList = lists:seq(1000, Sum - Left + 1000, 1000),
            {[{Num, 1} || Num <- NumList],
             {Sum - Left + 1000,
              util:shuffle(lists:seq(Sum - Left, Sum - 1))}}
    end.

item_issue(Idx) ->
    {{Y, M, D}, _} =
        date:seconds_to_datetime(date:unixtime()),
    List = lists:concat([head_add(Y, 4),
                         head_add(M, 2),
                         head_add(D, 2),
                         head_add(Idx, 4)]),
    List.

time_to_num(Now) ->
    {_, {H, M, S}} = date:seconds_to_datetime(Now),
    List = lists:concat([head_add(H, 2),
                         head_add(M, 2),
                         head_add(S, 2)]),
    list_to_integer(List).

head_add(Data, Len) ->
    head_add2(Data, Len, length(util:to_list(Data))).

head_add2(Data, Len, Len1) when Len > Len1 ->
    Data2 = lists:concat(["0", "", Data]),
    head_add2(Data2, Len, Len1 + 1);
head_add2(Data, _Len, _Len1) -> Data.

broadcast_reward({_RoleId, Platform, ZoneId}, RoleName,
                 ItemIdx) ->
    case lottery_data:item_data(ItemIdx) of
        #{notice := Notice, item_id := ItemId,
          item_count := Count}
            when Notice =:= 1 ->
            case lottery_data:broadcast_data(4) of
                #{content := Content} ->
                    CastMsg = notice:format(Content,
                                            [{role_2, RoleName},
                                             {item_2, ItemId, Count}]),
                    big_world:cast(Platform,
                                   ZoneId,
                                   notice,
                                   cast,
                                   [all, 5, CastMsg]);
                _ -> ignore
            end;
        _ -> ignore
    end.

broadcast_start() ->
    case lottery_data:broadcast_data(1) of
        #{content := Content} ->
            big_world:cast(all, notice, cast, [all, 5, Content]);
        _ -> ignore
    end.

broadcast_end() ->
    case lottery_data:broadcast_data(2) of
        #{content := Content} ->
            big_world:cast(all, notice, cast, [all, 5, Content]);
        _ -> ignore
    end.

time_open() ->
    Lits = case lottery_mgr:get_data(config_time) of
               [_ | _] = List0 -> List0;
               _ ->
                   case lottery_data:time_list() of
                       [_ | _] = List0 -> List0;
                       _ -> []
                   end
           end,
    get_open_time(Lits, []).

get_open_time([{{Week1, H1, Min1, _S1},
                {_Week2, H2, Min2, _S2}}
               | Tail],
              L) ->
    Week = date:day_of_the_week(date:unixtime()),
    NewL = case Week1 =:= Week of
               true -> [{H1, Min1, H2, Min2} | L];
               _ -> L
           end,
    get_open_time(Tail, NewL);
get_open_time([{Day, {H1, Min1, _S1}, {H2, Min2, _S2}}
               | Tail],
              L) ->
    {Day1, _} = date:seconds_to_datetime(date:unixtime()),
    NewL = case Day =:= Day1 of
               true -> [{H1, Min1, H2, Min2} | L];
               _ -> L
           end,
    get_open_time(Tail, NewL);
get_open_time([], L) -> lists:reverse(L).

reply(Role, Count) ->
    BackMsg = notice:format("成功参与~ts人次，祝您好运{face_1,3}",
                            [{string_2, 5, Count}]),
    notice:send(Role, 1, BackMsg).

