-file("src/mod/campaign/camp_discount.erl", 1).

-module(camp_discount).

-behaviour(gen_fsm).

-export([start_link/0,
         init/0,
         cast/1,
         call/1,
         info/1,
         login/1,
         get_staues/1,
         push/1,
         referesh_shop/1,
         refresh_group/3,
         reward/2,
         refresh/1,
         zero_flush/2,
         reply_repair_login/0]).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

-export([idel/2, active/2]).

-record(state, {campid, end_time, ts, timeout}).

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

-file("src/mod/campaign/camp_discount.erl", 41).

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

-file("src/mod/campaign/camp_discount.erl", 42).

-file("inc/campaign.hrl", 1).

-record(campaign_eggs,
        {ver = 0,
         location = 0 :: non_neg_integer(),
         footprints = [],
         last_moved = 0 :: non_neg_integer(),
         rolled = 0 :: non_neg_integer(),
         rewarded = []}).

-record(camp_login,
        {camp_id = 0,
         m_time = 0,
         num = 0,
         days = [],
         buys = []}).

-record(camp_login_data,
        {day = 0, reward = [], buys = [], cost = []}).

-record(camp_login_buy_data,
        {id = 0, reward = [], cost = [], cd = 0}).

-record(campaign_bags,
        {ver = 0,
         collected = [],
         last_filled = 0 :: non_neg_integer(),
         rewarded = 0}).

-record(campaign_card,
        {ver = 0,
         card_ver = 0,
         init = 0,
         times = 0,
         card_list = []}).

-record(campaign_card_open,
        {ver = 0,
         card_ver = 0,
         times = 0,
         init = 0,
         card_list = []}).

-record(camp_wish_flower,
        {ver = 1,
         floor = 1,
         times = 0,
         all_times = 0,
         camp_id = 0}).

-record(camp_new_flop,
        {ver = 1,
         group = 0,
         times = 0,
         rewarded = [],
         camp_id = 0}).

-record(camp_consume_rebate,
        {ver = 1, limit_item = []}).

-record(camp_new_acc_charge,
        {ver = 1, charge_val = 0, get_reward = []}).

-record(camp_charge_seven_gift,
        {ver = 1, id = 0, buy_time = 0, can_reward = []}).

-record(camp_lucky_tree,
        {id = 0,
         times = 0,
         reward_list = [],
         delay_reward = []}).

-record(camp_long_active,
        {ver = 1,
         id = 0,
         lev = 0,
         token_list = [],
         reward_levs = [],
         week_box = 0,
         last_reset_time = 0}).

-record(m_campaign,
        {ver = 27,
         acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list(),
         eggs = #campaign_eggs{},
         bags = #campaign_bags{},
         first_charge_double = [],
         camp_login = #camp_login{},
         hide_seek,
         login_roll,
         recharge = camp_series_recharge:init(),
         camp_card = #campaign_card{},
         wish_times = 0,
         camp_limit = [],
         camp_card_open = #campaign_card_open{},
         recharge_open = camp_series_recharge_open:init(),
         camp_wish_flower = #camp_wish_flower{},
         camp_doll = camp_doll:init(),
         camp_sign,
         camp_exchange,
         camp_animal_chess,
         camp_new_flop = #camp_new_flop{},
         multiplex_assert = 0,
         camp_consume_rebate = camp_consume_rebate:init(),
         camp_black_white_chess =
             camp_black_white_chess_mgr:init(),
         camp_scratch_card = camp_scratch_card:init(),
         camp_new_acc_charge = camp_new_acc_charge:init(),
         camp_charge_seven_gift = camp_charge_seven_gift:init(),
         camp_lucky_tree = camp_lucky_tree:init(),
         camp_long_active = camp_long_active:init(),
         gift_custom = camp_gift_custom:init()}).

-record(campaign_handle,
        {time = 0 :: non_neg_integer(),
         evt = {evt_rpc} :: tuple(),
         call_from = rpc :: evt | rpc,
         add_can_reward = 0 :: non_neg_integer(),
         camp :: undefined | tuple(),
         camp_info :: undefined | tuple(),
         push_list = [] :: [tuple()],
         push_cli = 0 :: 0..1,
         rpc_reward_num = 1 :: non_neg_integer(),
         return_acc = 0}).

-record(camp_collection,
        {camp_end_time = 0,
         reward_list = [],
         extra_data = [],
         random_index,
         red_dot}).

-record(camp_ico,
        {id = 0 :: non_neg_integer(),
         ico_id = 0 :: non_neg_integer(),
         name = "",
         is_show = 0 :: 0..1,
         start_time = 0 :: non_neg_integer() | tuple(),
         end_time = 0 :: non_neg_integer() | tuple(),
         white_list = [] :: list(),
         black_list = [] :: list(),
         min_open_time = 0 :: non_neg_integer() | tuple(),
         max_open_time = 0 :: non_neg_integer() | tuple()}).

-record(camp_cfg,
        {id = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         group_id = 0 :: non_neg_integer(),
         start_time = 0 :: non_neg_integer() | tuple(),
         end_time = 0 :: non_neg_integer() | tuple(),
         cli_start_time = 0 :: non_neg_integer() | tuple(),
         cli_end_time = 0 :: non_neg_integer() | tuple(),
         type = 0 :: pos_integer(),
         sec_type = 0 :: non_neg_integer(),
         status = 1 :: 0..1,
         reward_type = 2 :: pos_integer(),
         settlement = 2 :: non_neg_integer(),
         reward_title = "" :: bitstring(),
         reward_content = "" :: bitstring(),
         loss_items = [] :: list(),
         auto_buy = 0,
         reward = [] :: list(),
         camp_cond :: undefined | tuple(),
         reward_max = 1 :: non_neg_integer(),
         white_list = [] :: list(),
         black_list = [] :: list(),
         min_open_time = 0 :: non_neg_integer() | tuple(),
         max_open_time = 0 :: non_neg_integer() | tuple(),
         finish_id = 0 :: non_neg_integer(),
         finish_days = 0 :: non_neg_integer(),
         finish_end_days = 0 :: non_neg_integer(),
         cond_reward = [],
         merge_min = 0,
         merge_max = 0,
         is_keep_time = 0}).

-record(camp_cache,
        {id = 0 :: non_neg_integer(),
         sec_type = 0 :: non_neg_integer(),
         is_srv_open = 0 :: 0..1,
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         cli_start_time = 0 :: non_neg_integer(),
         cli_end_time = 0 :: non_neg_integer()}).

-record(camp_unit,
        {id = {0, 0}, base_id = 0, map_id = 0}).

-record(camp_time,
        {id = 0, start_time = 0, end_time = 0}).

-record(camp_item,
        {item = 0,
         start_time = 0,
         end_time = 0,
         open = 0,
         msg = 0}).

-record(camp_assets_data,
        {type = 0, items = [], max = 0, var_type = day}).

-record(camp_gift_custom,
        {ver = 1,
         camp_id = 0,
         gift = [],
         buy = [],
         extra_reward = 0}).

-file("src/mod/campaign/camp_discount.erl", 43).

-file("inc/camp_discount.hrl", 1).

-record(camp_discount_config_data,
        {id = 0,
         group_id = 0,
         item_list = [],
         cost1 = 0,
         cost2 = [],
         min_lev = 0,
         max_lev = 0,
         sex = 0,
         classes = 0,
         limit_role_num = 0,
         limit_zone_num = 0,
         weigth = 0,
         show_effect = 0,
         show_item = [],
         show_type = 0}).

-record(m_camp_discount,
        {camp_id = 0,
         refresh_time = 0,
         shop_list = [],
         limit_list = [],
         refresh_num = 0,
         last_group = 0}).

-record(camp_discount_limit, {id, num}).

-file("src/mod/campaign/camp_discount.erl", 44).

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

-file("src/mod/campaign/camp_discount.erl", 45).

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

-file("src/mod/campaign/camp_discount.erl", 46).

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

-file("src/mod/campaign/camp_discount.erl", 47).

-file("inc/log.hrl", 1).

-file("src/mod/campaign/camp_discount.erl", 48).

login(Role = #role{m_camp_discount =
                       MCampDiscount = #m_camp_discount{camp_id = CampID,
                                                        refresh_time =
                                                            RefreshTime}}) ->
    case get_idle_time() of
        {active, CampID, _} ->
            Now = date:unixtime(),
            case RefreshTime - Now > 8 * 60 * 60 of
                true ->
                    RefreshTime2 = fix_refreshtime(RefreshTime),
                    NRole = Role#role{m_camp_discount =
                                          MCampDiscount#m_camp_discount{refresh_time
                                                                            =
                                                                            RefreshTime2}},
                    {ok, NRole};
                false -> ok
            end;
        _ -> ok
    end;
login(_) -> ok.

reply_repair_login() ->
    role_group:apply(world, {camp_discount, login, []}).

fix_refreshtime(RefreshTime) ->
    Now = date:unixtime(),
    case RefreshTime - Now > 8 * 60 * 60 of
        true -> fix_refreshtime(RefreshTime - 8 * 60 * 60);
        false -> RefreshTime
    end.

zero_flush(NRole = #role{m_camp_discount =
                             MCampDiscount},
           _) ->
    NRole1 = NRole#role{m_camp_discount =
                            MCampDiscount#m_camp_discount{refresh_num = 0}},
    push(NRole1).

init() -> #m_camp_discount{}.

start_link() ->
    gen_fsm:start_link({local, camp_discount},
                       camp_discount,
                       [],
                       []).

cast(Event) ->
    gen_fsm:send_all_state_event(camp_discount, Event).

call(Event) ->
    try gen_fsm:sync_send_all_state_event(camp_discount,
                                          Event)
    catch
        _Type:_Reason ->
            logger:debug("Type: ~w  Reason: ~w",
                         [_Type, _Reason],
                         camp_discount,
                         101),
            {error, timeout}
    end.

info(Info) -> camp_discount ! Info.

init([]) ->
    logger:info("开始启动折扣商店...", [], camp_discount, 110),
    process_flag(trap_exit, true),
    {StateName, CampID, TimeLeft} = get_idle_time(),
    logger:info("折扣商店下一个状态~w",
                [{StateName, TimeLeft}],
                camp_discount,
                113),
    Now = date:unixtime(),
    State = #state{campid = CampID, ts = date:now2(),
                   timeout = TimeLeft},
    NewState = case StateName of
                   active ->
                       State#state{end_time = Now + TimeLeft div 1000};
                   _ -> State
               end,
    dets:open_file(camp_discount_limit,
                   [{file, "./dets/camp_discount_limit.dets"},
                    {keypos, #camp_discount_limit.id}]),
    ets:new(camp_discount_limit,
            [set,
             named_table,
             public,
             {keypos, #camp_discount_limit.id}]),
    dets:to_ets(camp_discount_limit, camp_discount_limit),
    logger:info("启动完成", [], camp_discount, 125),
    {ok, StateName, NewState, TimeLeft}.

handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event(_Event, _From, StateName, State) ->
    Reply = false,
    continue(StateName, Reply, State).

handle_info(reload, _, _) ->
    {StateName, CampID, TimeLeft} = get_idle_time(),
    continue(StateName,
             #state{campid = CampID, ts = date:now2(),
                    timeout = TimeLeft});
handle_info(_Info, StateName, State) ->
    continue(StateName, State).

terminate(_Reason, _StateName, _State) -> ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

idel(timeout, State) ->
    {StateName, CampID, TimeLeft} = get_idle_time(),
    logger:info("下一个状态~w",
                [{StateName, TimeLeft}],
                camp_discount,
                152),
    NState = State#state{campid = CampID, ts = date:now2(),
                         timeout = TimeLeft},
    Now = date:unixtime(),
    NewState = case StateName of
                   active ->
                       NState2 = State#state{end_time =
                                                 Now + TimeLeft div 1000},
                       ets:delete_all_objects(camp_discount_limit),
                       dets:delete_all_objects(camp_discount_limit),
                       NState2;
                   _ -> NState
               end,
    continue(StateName, NewState);
idel(_Any, State) -> continue(idel, State).

active(timeout, State) ->
    {StateName, CampID, TimeLeft} = get_idle_time(),
    logger:info("下一个状态~w",
                [{StateName, TimeLeft}],
                camp_discount,
                171),
    NState = State#state{campid = CampID, ts = date:now2(),
                         timeout = TimeLeft},
    NewState = case StateName of
                   active ->
                       Now = date:unixtime(),
                       NState2 = State#state{end_time =
                                                 Now + TimeLeft div 1000},
                       NState2;
                   _ -> NState
               end,
    continue(StateName,
             NewState#state{ts = date:now2(), timeout = TimeLeft});
active(_Any, State) -> continue(idel, State).

get_staues(active) -> 1;
get_staues(_) -> 0.

continue(StateName,
         State = #state{ts = Ts, timeout = Tidle}) ->
    {next_state,
     StateName,
     State,
     util:time_left(Tidle, Ts)}.

continue(StateName, Reply,
         State = #state{ts = Ts, timeout = Tidle}) ->
    {reply,
     Reply,
     StateName,
     State,
     util:time_left(Tidle, Ts)}.

get_idle_time() ->
    Now = date:unixtime(),
    {ID, StartTime, EndTime} = get_camp(60033),
    if Now < StartTime ->
           {idel, ID, max((StartTime - Now) * 1000, 1)};
       Now >= StartTime andalso Now < EndTime ->
           {active, ID, max((EndTime - Now) * 1000, 1)};
       true -> {idel, ID, date:next_diff(0) * 1000}
    end.

get_camp(CampSec) ->
    case campaign_mgr:get_camp_info(CampSec) of
        #camp_cache{id = Id, start_time = St, end_time = ET} ->
            {Id, St, ET};
        _ -> {0, -1, -1}
    end.

push(Role = #role{m_camp_discount =
                      #m_camp_discount{camp_id = CampId,
                                       refresh_time = RefTime,
                                       shop_list = ShopList,
                                       refresh_num = RefNum}}) ->
    case get_idle_time() of
        {active, CampId, _} ->
            case RefTime - date:unixtime() > 0 of
                true ->
                    ShopList1 = zone_limit_shop(ShopList),
                    sys_conn:pack_send(17871, {ShopList1, RefTime, RefNum}),
                    {ok, Role};
                false ->
                    {ok,
                     NRole = #role{m_camp_discount =
                                       #m_camp_discount{refresh_time = NRefTime,
                                                        shop_list = NShopList,
                                                        refresh_num =
                                                            NRefNum}}} =
                        referesh_shop(Role),
                    NShopList1 = zone_limit_shop(NShopList),
                    sys_conn:pack_send(17871,
                                       {NShopList1, NRefTime, NRefNum}),
                    {ok, NRole}
            end;
        {active, NCampId, _} ->
            {ok,
             NRole = #role{m_camp_discount =
                               #m_camp_discount{camp_id = NCampId,
                                                refresh_time = NRefTime,
                                                shop_list = NShopList,
                                                refresh_num = NRefNum}}} =
                referesh_shop(Role),
            NShopList1 = zone_limit_shop(NShopList),
            sys_conn:pack_send(17871,
                               {NShopList1, NRefTime, NRefNum}),
            {ok, NRole};
        _ ->
            sys_conn:pack_send(17871, {[], 0, 0}),
            {ok, Role}
    end.

referesh_shop(Role = #role{m_camp_discount =
                               MCampDiscount = #m_camp_discount{camp_id =
                                                                    OldCampId,
                                                                refresh_time =
                                                                    RefTime}}) ->
    case get_idle_time() of
        {active, OldCampId, _} ->
            case RefTime - date:unixtime() > 0 of
                true -> {ok, Role};
                false ->
                    NRole = do_referesh_shop(OldCampId, Role, 2),
                    {ok, NRole}
            end;
        {active, NewCampId, _} ->
            NRole = do_referesh_shop(NewCampId,
                                     Role#role{m_camp_discount =
                                                   MCampDiscount#m_camp_discount{limit_list
                                                                                     =
                                                                                     []}},
                                     2),
            {ok, NRole};
        _ -> {ok, Role}
    end.

do_referesh_shop(CampId,
                 Role = #role{m_camp_discount =
                                  MCampDiscount = #m_camp_discount{refresh_time
                                                                       =
                                                                       LastTime}},
                 Type) ->
    GroupIds = camp_discount_data:list(),
    ShopGodds = refresh_group(Role, GroupIds, []),
    RandomIds = [{NShopId, 0}
                 || #camp_discount_config_data{id = NShopId}
                        <- ShopGodds],
    RandomIdsLog = [NShopIdLog
                    || {NShopIdLog, _} <- RandomIds],
    log:mod(Role,
            camp_discount,
            lang:get("限时商店刷新商品"),
            util:flist("商店刷新的商店id:~w", [RandomIdsLog])),
    LastTime2 = case Type of
                    1 -> date:unixtime() + 8 * 60 * 60;
                    _ -> get_refresh_time(LastTime)
                end,
    NRole = Role#role{m_camp_discount =
                          MCampDiscount#m_camp_discount{camp_id = CampId,
                                                        refresh_time =
                                                            LastTime2,
                                                        shop_list = RandomIds}},
    NRole.

refresh_group(_Role, [], GroupItems) -> GroupItems;
refresh_group(Role, [GroupId | Rest], GroupItems) ->
    RfCount = case Rest of
                  [] -> 8 - length(GroupItems);
                  _ ->
                      CountRatio = camp_discount_data:group_count(GroupId),
                      case util:rand_list(CountRatio, 2) of
                          {Count, _} -> Count;
                          _ -> 0
                      end
              end,
    logger:debug("分组~w刷新:~w",
                 [GroupId, RfCount],
                 camp_discount,
                 288),
    Goods = rand_goods(Role, GroupId, RfCount),
    NewGroupItems = Goods ++ GroupItems,
    refresh_group(Role, Rest, NewGroupItems).

rand_goods(Role, GroupId, Count) ->
    GoodsList = camp_discount_data:group_shop_list(GroupId),
    FilterGoods = filter_cond(Role, GoodsList, []),
    case util:rand_list_n(FilterGoods,
                          #camp_discount_config_data.weigth,
                          Count)
        of
        _L = [_ | _] -> _L;
        _ -> []
    end.

filter_cond(_Role, [], FilterGoods) -> FilterGoods;
filter_cond(Role = #role{classes = Classes, sex = Sex,
                         lev = Lev,
                         m_camp_discount =
                             #m_camp_discount{limit_list = LimitList}},
            [Data = #camp_discount_config_data{id = ShopId,
                                               limit_role_num = RoleLimitNum,
                                               sex = ISex, min_lev = MinLev,
                                               max_lev = MaxLev,
                                               classes = IClasses}
             | Rest],
            FilterGoods)
    when (MinLev =:= 0 andalso MaxLev =:= 0 orelse
              Lev >= MinLev andalso Lev =< MaxLev)
             andalso
             (ISex =:= 2 orelse Sex =:= ISex) andalso
                 (IClasses =:= 0 orelse IClasses =:= Classes) ->
    Limit = case RoleLimitNum > 0 of
                true ->
                    case lists:keyfind(ShopId,
                                       #camp_discount_limit.id,
                                       LimitList)
                        of
                        #camp_discount_limit{num = Num} -> RoleLimitNum > Num;
                        false -> true
                    end;
                false -> true
            end,
    case Limit of
        true -> filter_cond(Role, Rest, [Data | FilterGoods]);
        _ -> filter_cond(Role, Rest, FilterGoods)
    end;
filter_cond(Role, [_ | Rest], FilterGoods) ->
    filter_cond(Role, Rest, FilterGoods).

get_refresh_time(0) ->
    {_ID, StartTime, _EndTime} = get_camp(60033),
    get_refresh_time(StartTime);
get_refresh_time(LastTime) ->
    Now = date:unixtime(),
    RefreshTime = LastTime + 8 * 60 * 60,
    case RefreshTime > Now of
        true -> RefreshTime;
        _ -> get_refresh_time(RefreshTime)
    end.

zone_limit_shop(ShopList) ->
    lists:foldl(fun ({ShopID, IsBuy}, List) ->
                        BuyNum = case ets:lookup(camp_discount_limit, ShopID) of
                                     [#camp_discount_limit{id = ShopID,
                                                           num = Num}
                                      | _] ->
                                         Num;
                                     _ -> 0
                                 end,
                        ShopData = camp_discount_data:get_shop_data(ShopID),
                        [{ShopID, IsBuy, BuyNum, ShopData} | List]
                end,
                [],
                ShopList).

reward(ShopID,
       Role = #role{m_camp_discount =
                        #m_camp_discount{camp_id = CampID,
                                         limit_list = LimitList,
                                         refresh_time = RefreshTime,
                                         shop_list = ShopList}}) ->
    Result = case get_idle_time() of
                 {active, CampID, _} -> {ok, CampID};
                 {active, _NCampID, _} ->
                     {ok, NRole} = push(Role),
                     {ok, NRole, lang:get("商店物品已刷新")};
                 _ -> {false, lang:get("不在活动期间")}
             end,
    case Result of
        {ok, _} ->
            case lists:keyfind(ShopID, 1, ShopList) of
                {ShopID, 0} ->
                    case RefreshTime - date:unixtime() > 0 of
                        false ->
                            {ok, NRole2} = push(Role),
                            {ok, NRole2, lang:get("商店物品已刷新")};
                        true ->
                            ShopData = camp_discount_data:get_shop_data(ShopID),
                            case ShopData of
                                #camp_discount_config_data{id = ShopID,
                                                           limit_role_num =
                                                               RoleLimitNum,
                                                           limit_zone_num =
                                                               ZoneLimitNum} ->
                                    Limit1 = case RoleLimitNum > 0 of
                                                 true ->
                                                     case lists:keyfind(ShopID,
                                                                        #camp_discount_limit.id,
                                                                        LimitList)
                                                         of
                                                         #camp_discount_limit{id
                                                                                  =
                                                                                  ShopID,
                                                                              num
                                                                                  =
                                                                                  Num} ->
                                                             RoleLimitNum > Num;
                                                         false -> true
                                                     end;
                                                 false -> true
                                             end,
                                    Limit2 = case ZoneLimitNum > 0 of
                                                 true ->
                                                     ZoneBuyNum = case
                                                                      ets:lookup(camp_discount_limit,
                                                                                 ShopID)
                                                                      of
                                                                      [#camp_discount_limit{id
                                                                                                =
                                                                                                ShopID,
                                                                                            num
                                                                                                =
                                                                                                ZoneNum}] ->
                                                                          ZoneNum;
                                                                      _ -> 0
                                                                  end,
                                                     ZoneLimitNum > ZoneBuyNum;
                                                 _ -> true
                                             end,
                                    case Limit1 andalso Limit2 of
                                        true -> do_reward(Role, ShopData);
                                        _ ->
                                            {false,
                                             lang:get("已达限购数额，请选购其他商品{face_1,3}")}
                                    end;
                                _ -> {false, lang:get("没有找到配置")}
                            end
                    end;
                {ShopID, 1} -> {false, lang:get("你已经购买该商品")};
                _ -> {false, lang:get("刷新列表不存在该商品")}
            end;
        {ok, NRole3, Reason1} -> {ok, NRole3, Reason1};
        {false, Reason2} -> {false, Reason2}
    end.

do_reward(Role = #role{classes = Classes, sex = Sex,
                       lev = Lev},
          #camp_discount_config_data{id = ShopID, sex = ISex,
                                     min_lev = MinLev, max_lev = MaxLev,
                                     classes = IClasses, item_list = ItemList,
                                     cost2 = Cost,
                                     limit_zone_num = ZoneLimitNum,
                                     limit_role_num = RoleLimitNum}) ->
    Gain = format:val_to_gain(ItemList) ++
               format:val_to_loss(Cost),
    case (MinLev == 0 andalso MaxLev == 0 orelse
              Lev >= MinLev andalso Lev =< MaxLev)
             andalso
             (ISex == 2 orelse Sex == ISex) andalso
                 (IClasses == 0 orelse IClasses == Classes)
        of
        true ->
            case role_gain:do_notice(Gain, Role, lang:get("限时商店"))
                of
                {ok,
                 NRole = #role{m_camp_discount =
                                   MCampDiscount = #m_camp_discount{limit_list =
                                                                        LimitList,
                                                                    shop_list =
                                                                        ShopList}}} ->
                    NewRoleLimitList = case RoleLimitNum > 0 of
                                           true ->
                                               case lists:keyfind(ShopID,
                                                                  #camp_discount_limit.id,
                                                                  LimitList)
                                                   of
                                                   #camp_discount_limit{id =
                                                                            ShopID,
                                                                        num =
                                                                            Num}
                                                       when RoleLimitNum >
                                                                Num ->
                                                       lists:keyreplace(ShopID,
                                                                        #camp_discount_limit.id,
                                                                        LimitList,
                                                                        #camp_discount_limit{id
                                                                                                 =
                                                                                                 ShopID,
                                                                                             num
                                                                                                 =
                                                                                                 Num
                                                                                                     +
                                                                                                     1});
                                                   false ->
                                                       [#camp_discount_limit{id
                                                                                 =
                                                                                 ShopID,
                                                                             num
                                                                                 =
                                                                                 1}
                                                        | LimitList]
                                               end;
                                           false -> LimitList
                                       end,
                    case ZoneLimitNum > 0 of
                        true ->
                            ZoneBuyNum = case ets:lookup(camp_discount_limit,
                                                         ShopID)
                                             of
                                             [#camp_discount_limit{id = ShopID,
                                                                   num =
                                                                       ZoneNum}] ->
                                                 ZoneNum;
                                             _ -> 0
                                         end,
                            ZoneLimit = #camp_discount_limit{id = ShopID,
                                                             num =
                                                                 ZoneBuyNum +
                                                                     1},
                            dets:insert(camp_discount_limit, ZoneLimit),
                            ets:insert(camp_discount_limit, ZoneLimit);
                        false -> ok
                    end,
                    NShopList = lists:keyreplace(ShopID,
                                                 1,
                                                 ShopList,
                                                 {ShopID, 1}),
                    NRole2 = NRole#role{m_camp_discount =
                                            MCampDiscount#m_camp_discount{limit_list
                                                                              =
                                                                              NewRoleLimitList,
                                                                          shop_list
                                                                              =
                                                                              NShopList}},
                    {ok, NRole3} = push(NRole2),
                    {ok, NRole3};
                {false, #loss{label = Label}} ->
                    Msg = case Label of
                              gold_bind -> lang:get("金币不足{face_1,9}");
                              gold -> lang:get("钻石不足，请前往充值{face_1,9}");
                              _ -> lang:get("余额不足{face_1,9}")
                          end,
                    {false, Msg};
                {false, _} -> {false, lang:get("背包空间不足")}
            end;
        _ -> {false, lang:get("该道具对你无用")}
    end.

refresh(Role) ->
    case get_idle_time() of
        {active, CampID, _} ->
            RefNum = var:get_var(Role, day, 616, 0),
            case RefNum < 999 of
                true ->
                    case campaign_data:get(CampID) of
                        #camp_cfg{loss_items = LossItems} ->
                            Gain = format:val_to_loss(LossItems),
                            case role_gain:do_notice(Gain,
                                                     Role,
                                                     lang:get("限时商店刷新"))
                                of
                                {ok, NRole1} ->
                                    NRole2 = #role{m_camp_discount =
                                                       MCampDiscount} =
                                                 do_referesh_shop(CampID,
                                                                  NRole1,
                                                                  1),
                                    NRole3 = var:set_var(NRole2,
                                                         day,
                                                         616,
                                                         RefNum + 1),
                                    NRole4 = NRole3#role{m_camp_discount =
                                                             MCampDiscount#m_camp_discount{refresh_num
                                                                                               =
                                                                                               RefNum
                                                                                                   +
                                                                                                   1}},
                                    {ok, NRole5} = push(NRole4),
                                    {ok, NRole5};
                                {false, #loss{}} -> {false, lang:get("材料不足")};
                                {false, _} -> {false, lang:get("系统错误")}
                            end;
                        _ -> {false, lang:get("找不到道具id")}
                    end;
                false -> {false, lang:get("今日不能再刷新了")}
            end;
        _ -> {false, lang:get("活动尚未开始")}
    end.

