-file("src/mod/lottery/lottery_mgr.erl", 1).

-module(lottery_mgr).

-behaviour(gen_fsm).

-export([start_link/0,
         m/1,
         call/1,
         cast/1,
         info/1,
         send/2]).

-export([idle/2, lottery_1/2, lottery_2/2]).

-export([lottery_call/1,
         update_data/1,
         update_data/2,
         send_mail_local/5,
         send_mail_success/1,
         send_message_local/2,
         lottery_update_local/3,
         load_lottery_all/0,
         load_data_focus/0,
         write/2,
         time_get/0,
         time_set/4,
         time_refresh/1,
         get_data/1,
         out_num/5,
         start_api/2,
         config_time/1,
         stop_force_api/0,
         time_update_init/0,
         update_all/1,
         test/1,
         log/3,
         get_times_all/0,
         update_times_all/1,
         update_times_rare/1,
         get_times_rare/0,
         add_times_rare/1,
         cut_times_rare/1,
         return/0,
         update_local_data/0,
         update_local_data/2,
         update_local_all_data/0,
         request_local_data/2,
         update_times_buy_change/2,
         get_times_buy_change/0,
         delete_times_buy/0,
         pause_next_api/0,
         start_next_api/0,
         get_client_state/1]).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

-record(state,
        {ts = 0 :: tuple(),
         timeout = 0 :: non_neg_integer(),
         status = idle}).

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

-file("src/mod/lottery/lottery_mgr.erl", 82).

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

-file("src/mod/lottery/lottery_mgr.erl", 83).

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

-file("src/mod/lottery/lottery_mgr.erl", 84).

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

-file("src/mod/lottery/lottery_mgr.erl", 85).

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

-file("src/mod/lottery/lottery_mgr.erl", 86).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/lottery/lottery_mgr.erl", 87).

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

-file("src/mod/lottery/lottery_mgr.erl", 88).

start_link() ->
    gen_fsm:start_link({local, lottery_mgr},
                       lottery_mgr,
                       [],
                       []).

m(Event) -> gen_fsm:send_event(lottery_mgr, Event).

call(Msg) ->
    case catch
             gen_fsm:sync_send_all_state_event(lottery_mgr, Msg)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

cast(Msg) ->
    gen_fsm:send_all_state_event(lottery_mgr, Msg).

info(Msg) -> lottery_mgr ! Msg.

send({Rid, P, Z}, Msg) ->
    case role_query:pid(by_id, Rid, P, Z) of
        {ok, Pid} -> notice:send({pid, Pid}, 1, Msg);
        _ -> skip
    end.

init([]) ->
    logger:info("[~w] 正在启动...",
                [lottery_mgr],
                lottery_mgr,
                127),
    process_flag(trap_exit, true),
    dets:open_file(lottery,
                   [{file, "./dets/lottery.dets"},
                    {keypos, #lottery.idx},
                    {type, set}]),
    dets:open_file(lottery_all,
                   [{file, "./dets/lottery_all.dets"},
                    {keypos, #lottery.idx},
                    {type, set}]),
    dets:open_file(lottery_misc,
                   [{file, "./dets/lottery_misc.dets"},
                    {keypos, 1},
                    {type, set}]),
    dets:open_file(lottery_mail,
                   [{file, "./dets/lottery_mail.dets"},
                    {keypos, #lottery_mail.idx},
                    {type, set}]),
    dets:open_file(lottery_buy,
                   [{file, "./dets/lottery_buy.dets"},
                    {keypos, 1},
                    {type, set}]),
    ets:new(lottery,
            [set, named_table, public, {keypos, #lottery.idx}]),
    ets:new(lottery_all,
            [set, named_table, public, {keypos, #lottery.idx}]),
    ets:new(lottery_misc,
            [set, named_table, public, {keypos, 1}]),
    ets:new(lottery_mail,
            [set,
             named_table,
             public,
             {keypos, #lottery_mail.idx}]),
    ets:new(lottery_buy,
            [set, named_table, public, {keypos, 1}]),
    ets:new(lottery_change,
            [set, named_table, public, {keypos, #lottery.idx}]),
    RefreshRef = erlang:send_after(date:next_diff(0, 0, 7) *
                                       1000,
                                   self(),
                                   refresh),
    put(refresh_ref, RefreshRef),
    put(max_lottery_id, 1),
    put(max_misc_id, 1),
    time_update_init(),
    load_data_misc(),
    load_lottery_all(),
    load_data_mail(),
    load_data_times_buy(),
    Flag = case dets:first(lottery) of
               '$end_of_table' ->
                   logger:info("一元夺宝没有数据需要加载", [], lottery_mgr, 154),
                   init;
               _ ->
                   dets:traverse(lottery,
                                 fun (L) ->
                                         case lottery_ver:do(L) of
                                             {ok,
                                              L1 = #lottery{idx_temp =
                                                                IdxTemp}} ->
                                                 update_id(max_lottery_id,
                                                           IdxTemp),
                                                 ets:insert(lottery, L1),
                                                 continue;
                                             _G ->
                                                 logger:error("无法转换一元夺宝数据:~w",
                                                              [_G],
                                                              lottery_mgr,
                                                              165),
                                                 {done, false}
                                         end
                                 end),
                   put(max_lottery_id, get(max_lottery_id) + 1),
                   self() ! deal,
                   self() ! deal_show
           end,
    {Status, Timeout} = time_refresh(Flag),
    logger:debug("=================~w",
                 [{Timeout, Status}],
                 lottery_mgr,
                 176),
    NewTref = erlang:send_after(10 * 1000,
                                self(),
                                update_local_data),
    put(update_tref, NewTref),
    logger:info("启动完成", [], lottery_mgr, 179),
    {ok,
     Status,
     #state{ts = now(), timeout = Timeout, status = Status},
     Timeout}.

handle_sync_event({lottery,
                   Role = #{id := RoleId = {_Id, Platform, ZoneId},
                            name := RoleName},
                   Idx,
                   ItemIdx,
                   Count,
                   All},
                  _From, StateName, State)
    when StateName =:= lottery_1 ->
    Reply = case ets:lookup(lottery, Idx) of
                [Lottery = #lottery{item_idx = ItemIdx,
                                    item_id = ItemId, times_now = TimesNow,
                                    times_sum = TimesSum, id_data = IdData,
                                    left_list = LeftList, history = Historys,
                                    num_list = NumList, buy_list = BuyList,
                                    gold_type = GoldType, gold_once = GoldOnce,
                                    item_count = ItemCount}] ->
                    case lottery_check(Role, Lottery, Count, All) of
                        {ok, NewCount} ->
                            Now = date:unixtime(),
                            {NumList1,
                             LeftList1,
                             BuyList1,
                             Historys1,
                             LotteryState1,
                             Time1} =
                                lottery_do(Role,
                                           Idx,
                                           NewCount,
                                           NumList,
                                           BuyList,
                                           Historys,
                                           IdData,
                                           LeftList),
                            History = #lottery_history{time = Now,
                                                       num =
                                                           lottery:time_to_num(Now),
                                                       role_id = RoleId,
                                                       role_name = RoleName,
                                                       item_id = ItemId,
                                                       count = NewCount},
                            TimesNow1 = TimesNow + NewCount,
                            Lottery1 = Lottery#lottery{times_now = TimesNow1,
                                                       left_list = LeftList1,
                                                       num_list = NumList1,
                                                       buy_list = BuyList1,
                                                       history = Historys1,
                                                       state = LotteryState1,
                                                       time = Time1},
                            update_data(Lottery1),
                            update_history(History),
                            update_time_update(GoldType, Now),
                            update_times_all(NewCount),
                            deal_check(NumList1, TimesSum - TimesNow1),
                            TimesMy = get_times_buy(Role, Idx),
                            big_world:cast(Platform,
                                           ZoneId,
                                           log,
                                           lottery,
                                           [Role,
                                            #lottery{idx = Idx,
                                                     item_idx = ItemIdx,
                                                     item_id = ItemId,
                                                     item_count = ItemCount,
                                                     gold_type = GoldType,
                                                     gold_once = GoldOnce},
                                            NewCount,
                                            1]),
                            {ok, {Lottery1, TimesMy, NewCount}};
                        {false, Reason} -> {false, Reason};
                        {false, Lottery1, TimesMy, Msg} ->
                            {false, Lottery1, TimesMy, Msg}
                    end;
                _R -> {false, "该物品不存在"}
            end,
    continue(Reply, StateName, State);
handle_sync_event({lottery,
                   _Role,
                   _Idx,
                   _ItemIdx,
                   _Count,
                   _All},
                  _From, StateName, State) ->
    logger:debug("aaaaaaaaaaaaaaaaaa",
                 [],
                 lottery_mgr,
                 212),
    Reply = {false, "当前时间不可购买"},
    continue(Reply, StateName, State);
handle_sync_event(_Event, _From, StateName, State) ->
    logger:debug("==============~w",
                 [_Event],
                 lottery_mgr,
                 219),
    Reply = ok,
    continue(StateName, Reply, State).

handle_event(stop_force, _StateName, _State) ->
    time_set(stop_force, 0, 0, 0),
    update_data(lottery_misc, {config_time, [{0, 0}]}),
    deal_over_handle(),
    big_world:cast(all,
                   role_group,
                   pack_send,
                   [world, 16904, {0, 0, 0}]),
    lottery:broadcast_end(),
    continue(stop_force,
             #state{ts = now(), timeout = infinity,
                    status = stop_force});
handle_event(_Event, StateName, State) ->
    logger:debug("未知消息 ~w", [_Event], lottery_mgr, 231),
    continue(StateName, State).

handle_info(pause_next, StateName, State) ->
    put(pause_next, true),
    logger:info("一元夺宝暂停上新道具~n", [], lottery_mgr, 237),
    continue(StateName, State);
handle_info(start_next, StateName, State) ->
    erase(pause_next),
    logger:info("一元夺宝重新上新道具 ~n", [], lottery_mgr, 242),
    continue(StateName, State);
handle_info(refresh, _StateName, _State) ->
    case get(refresh_ref) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> skip
    end,
    NewRef = erlang:send_after(date:next_diff(0, 0, 7) *
                                   1000,
                               self(),
                               refresh),
    put(refresh_ref, NewRef),
    {StatusServ1, TimeOut} = time_refresh(),
    case StatusServ1 of
        idel -> data_clean();
        _ -> ignore
    end,
    logger:info("一元夺宝零点刷新 ~w",
                [StatusServ1],
                lottery_mgr,
                256),
    continue(StatusServ1,
             #state{ts = now(), timeout = TimeOut});
handle_info(gm_refresh, _StateName, _State) ->
    {StatusServ1, TimeOut} = time_refresh(),
    case StatusServ1 of
        idel -> data_clean();
        _ -> ignore
    end,
    logger:debug("零点刷新~w",
                 [{StatusServ1, TimeOut}],
                 lottery_mgr,
                 263),
    continue(StatusServ1,
             #state{ts = now(), timeout = TimeOut});
handle_info(start, _StateName, _State) ->
    data_clean(),
    time_update_init(),
    logger:debug("活动开始初始化 ~n", [], lottery_mgr, 269),
    lottery:data_init(),
    lottery:data_pos_shuffle(),
    {StatusServ, TimeOut} = time_refresh(),
    update_local_all_data(),
    add_timer_tref(),
    continue(StatusServ,
             #state{ts = now(), timeout = TimeOut});
handle_info({start_gm, StartTime, EndTime}, _StateName,
            _State) ->
    data_clean(),
    {_, {H1, Min1, S1}} =
        date:seconds_to_datetime(StartTime),
    Week1 = date:day_of_the_week(StartTime),
    {_, {H2, Min2, S2}} = date:seconds_to_datetime(EndTime),
    Week2 = date:day_of_the_week(EndTime),
    {_, {H3, Min3, S3}} = date:seconds_to_datetime(EndTime +
                                                       60),
    Week3 = date:day_of_the_week(EndTime + 60),
    {_, {H4, Min4, S4}} = date:seconds_to_datetime(EndTime +
                                                       60
                                                       + EndTime
                                                       - StartTime),
    Week4 = date:day_of_the_week(EndTime + 60 + EndTime -
                                     StartTime),
    update_data(lottery_misc,
                {config_time,
                 [{{Week1, H1, Min1, S1}, {Week2, H2, Min2, S2}},
                  {{Week3, H3, Min3, S3}, {Week4, H4, Min4, S4}}]}),
    time_update_init(),
    time_set(lottery_1, 1, StartTime, EndTime),
    logger:debug("活动开始初始化 ~n", [], lottery_mgr, 291),
    case get(max_lottery_id) of
        MaxId when is_integer(MaxId) -> ingnore;
        _ -> put(max_lottery_id, 1)
    end,
    lottery:data_init(gm),
    lottery:data_pos_shuffle(),
    update_local_all_data(),
    add_timer_tref(),
    big_world:cast(all,
                   role_group,
                   pack_send,
                   [world, 16904, {1, StartTime, EndTime}]),
    lottery:broadcast_start(),
    logger:debug("===========timeout========~w",
                 [EndTime - date:unixtime() - 3 * 60],
                 lottery_mgr,
                 301),
    continue(lottery_1,
             #state{ts = now(),
                    timeout = (EndTime - date:unixtime() - 3 * 60) * 1000,
                    status = lottery_1});
handle_info({next_item, Idx, ItemIdx, Pos, GoldType},
            StateName, State) ->
    case ets:lookup(lottery, Idx) of
        [Lottery = #lottery{} | _] ->
            erlang:spawn(lottery_mgr,
                         update_all,
                         [Lottery#lottery{state = 4, pos = 0}]),
            case StateName of
                lottery_1 ->
                    case get(pause_next) of
                        undefined ->
                            update_time_update(GoldType, date:unixtime()),
                            case lottery:next_item(ItemIdx, Pos, GoldType) of
                                ignore ->
                                    update_data(Lottery#lottery{state = 4}),
                                    update_local_data(lottery,
                                                      Lottery#lottery{state =
                                                                          4});
                                _ ->
                                    update_data(Lottery#lottery{state = 4,
                                                                pos = 0}),
                                    update_local_data(lottery,
                                                      Lottery#lottery{state = 4,
                                                                      pos = 0})
                            end;
                        _ ->
                            logger:info(" 暂停上新道具   ~n", [], lottery_mgr, 323),
                            ignore
                    end;
                _ -> ignore
            end;
        _ -> ignore
    end,
    continue(StateName, State);
handle_info(deal, StateName, State) ->
    deal_handle(),
    continue(StateName, State);
handle_info(deal_show, StateName, State) ->
    deal_show_handle(),
    continue(StateName, State);
handle_info(deal_over, _StateName, _State) ->
    logger:debug("Role deal ", [], lottery_mgr, 341),
    {StatusServ, TimeOut} = time_refresh(),
    MatchSpec = [{#lottery{state = '$1', _ = '_'},
                  [{'=:=', '$1', 1}],
                  ['$_']}],
    List = ets:select(lottery, MatchSpec),
    send_mail_return(List),
    continue(StatusServ,
             #state{ts = now(), timeout = TimeOut,
                    status = StatusServ});
handle_info(back_mail, StateName, State) ->
    MatchSpec = [{#lottery{state = '$1', _ = '_'},
                  [{'=:=', '$1', 5}],
                  ['$_']}],
    List = ets:select(lottery, MatchSpec),
    logger:info("重新返还邮件个数 ~w",
                [length(List)],
                lottery_mgr,
                353),
    send_mail_return(List),
    continue(StateName, State);
handle_info(mail_length, StateName, State) ->
    MatchSpec = [{#lottery{state = '$1', _ = '_'},
                  [{'=:=', '$1', 5}],
                  ['$_']}],
    List = ets:select(lottery, MatchSpec),
    logger:info("重新返还邮件个数 ~w",
                [length(List)],
                lottery_mgr,
                360),
    continue(StateName, State);
handle_info(mail_check, StateName, State) ->
    case get(mail_tref) of
        undefined -> ignore;
        Tref -> erlang:cancel_timer(Tref)
    end,
    logger:debug("mail check info ", [], lottery_mgr, 366),
    case ets:tab2list(lottery_mail) of
        [] ->
            logger:debug("mail check info ~n",
                         [],
                         lottery_mgr,
                         368),
            ignore;
        List ->
            Now = date:unixtime(),
            Fun = fun (_LotteryMail = #lottery_mail{idx = Idx,
                                                    role_id =
                                                        {_RoleId,
                                                         Platform,
                                                         ZoneId} =
                                                            Role,
                                                    title = Title,
                                                    content = Content,
                                                    item_list = ItemList,
                                                    time = Time}) ->
                          logger:debug("mail check info ~p~n",
                                       [{Idx, Now - Time}],
                                       lottery_mgr,
                                       373),
                          case Now - Time > 5 * 60 of
                              true ->
                                  big_world:cast(Platform,
                                                 ZoneId,
                                                 lottery_mgr,
                                                 send_mail_local,
                                                 [Role,
                                                  Title,
                                                  Content,
                                                  ItemList,
                                                  Idx]);
                              _ -> ignore
                          end
                  end,
            lists:foreach(Fun, List),
            mail_check_tref()
    end,
    continue(StateName, State);
handle_info({delete_mail, Idx}, StateName, State) ->
    delete_mail(Idx),
    continue(StateName, State);
handle_info(update_local_data, StateName, State)
    when StateName =:= lottery_1 orelse
             StateName =:= lottery_2 ->
    update_local_data(),
    continue(StateName, State);
handle_info(update_local_data, StateName, State) ->
    logger:debug("竞拍结束,最后一次全部更新一遍", [], lottery_mgr, 395),
    update_local_all_data(),
    continue(StateName, State);
handle_info(_Info, StateName, State) ->
    logger:debug("未知消息 ~w", [_Info], lottery_mgr, 399),
    continue(StateName, State).

terminate(_Reason, _StateName, _State) ->
    logger:info("[~w] 正在关闭...",
                [lottery_mgr],
                lottery_mgr,
                403),
    util:close_dets(lottery),
    util:close_dets(lottery_misc),
    util:close_dets(lottery_mail),
    util:close_dets(lottery_buy),
    util:close_dets(lottery_all),
    logger:info("[~w] 关闭完成",
                [lottery_mgr],
                lottery_mgr,
                409),
    ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

idle(timeout, _State) ->
    data_clean(),
    logger:debug("活动开始初始化 ~n", [], lottery_mgr, 423),
    time_update_init(),
    lottery:data_init(),
    lottery:data_pos_shuffle(),
    {StatusServ, TimeOut} = time_refresh(),
    logger:debug("空闲超时,活动开始初始化~w",
                 [{StatusServ, TimeOut}],
                 lottery_mgr,
                 428),
    {StatusCli, StartTime, EndTime} = time_get(),
    big_world:cast(all,
                   role_group,
                   pack_send,
                   [world, 16904, {StatusCli, StartTime, EndTime}]),
    update_local_all_data(),
    add_timer_tref(),
    lottery:broadcast_start(),
    continue(StatusServ,
             #state{ts = now(), status = StatusServ,
                    timeout = TimeOut});
idle(_, State) -> continue(idle, State).

lottery_1(timeout, _State) ->
    MatchSpec = [{#lottery{state = '$1', _ = '_'},
                  [{'=:=', '$1', 1}],
                  ['$_']}],
    List = ets:select(lottery, MatchSpec),
    logger:debug("竞拍超时,返还资金~w",
                 [{date:seconds_to_datetime(date:unixtime()),
                   length(List)}],
                 lottery_mgr,
                 443),
    send_mail_return(List),
    {StatusServ, TimeOut} = time_refresh(),
    continue(StatusServ,
             #state{ts = now(), status = StatusServ,
                    timeout = TimeOut});
lottery_1(_, State) ->
    logger:debug("===========~w",
                 [State],
                 lottery_mgr,
                 448),
    continue(lottery_1, State).

lottery_2(timeout, _State) ->
    deal_handle(),
    deal_over_handle(),
    {StatusServ, TimeOut} = time_refresh(),
    {StatusCli, StartTime, EndTime} = time_get(),
    logger:debug("活动结束~w",
                 [{StatusServ, TimeOut}],
                 lottery_mgr,
                 457),
    big_world:cast(all,
                   role_group,
                   pack_send,
                   [world, 16904, {StatusCli, StartTime, EndTime}]),
    lottery:broadcast_end(),
    continue(StatusServ,
             #state{status = StatusServ, ts = now(),
                    timeout = TimeOut});
lottery_2(_, State) ->
    logger:debug("===========~w",
                 [State],
                 lottery_mgr,
                 462),
    continue(lottery_2, State).

continue(StateName,
         State = #state{timeout = infinity}) ->
    {next_state, StateName, State, infinity};
continue(StateName,
         State = #state{ts = Ts, timeout = Timeout}) ->
    {next_state,
     StateName,
     State,
     util:time_left(Timeout, Ts)}.

continue(Reply, StateName,
         State = #state{timeout = infinity}) ->
    {reply, Reply, StateName, State, infinity};
continue(Reply, StateName,
         State = #state{ts = Ts, timeout = Timeout}) ->
    {reply,
     Reply,
     StateName,
     State,
     util:time_left(Timeout, Ts)}.

lottery_call({lottery,
              Role,
              Idx,
              ItemIdx,
              Count,
              All}) ->
    logger:debug("=====lottery call=====~w",
                 [All],
                 lottery_mgr,
                 486),
    call({lottery, Role, Idx, ItemIdx, Count, All}).

request_local_data(_Platform, _ZoneId) ->
    logger:debug("游戏服开服,同步数据~w",
                 [{_Platform, _ZoneId}],
                 lottery_mgr,
                 490),
    Lottery = ets:tab2list(lottery),
    LotteryAll = [],
    LotteryMisc = ets:tab2list(lottery_misc),
    TimesBuy = ets:tab2list(lottery_buy),
    {ok, Lottery, LotteryAll, LotteryMisc, TimesBuy}.

update_local_all_data() ->
    Lottery = ets:tab2list(lottery),
    LotteryAll = [],
    LotteryMisc = ets:tab2list(lottery_misc),
    TimesBuy = ets:tab2list(lottery_buy),
    ets:delete_all_objects(lottery_change),
    logger:debug("开服更新其他服务器数据", [], lottery_mgr, 503),
    big_world:cast(all,
                   lottery_local,
                   update_local_data,
                   [all, {Lottery, LotteryAll, LotteryMisc, TimesBuy}]).

update_local_data() ->
    List = ets:tab2list(lottery_change),
    ets:delete_all_objects(lottery_change),
    update_local_data2(List).

update_local_data2(List) ->
    TimesAll = get_times_all(),
    TimeUpdate = get_time_update(0),
    TimesBuyList = get_times_buy_change(),
    ets:insert(lottery_misc, {times_buy_change, []}),
    big_world:cast(all,
                   lottery_local,
                   update_local_data,
                   [List, TimesAll, TimeUpdate, TimesBuyList]),
    add_timer_tref().

update_local_data(Type, Data) ->
    big_world:cast(all,
                   lottery_local,
                   update_local_data,
                   [Type, Data]).

add_timer_tref() ->
    case get(update_tref) of
        undefined -> ignore;
        Tref -> erlang:cancel_timer(Tref)
    end,
    NewTref = erlang:send_after(3 * 1000,
                                self(),
                                update_local_data),
    put(update_tref, NewTref).

time_refresh() -> time_refresh([]).

time_refresh(StartFlag) ->
    {StatusServ, {StartTime, EndTime}} = lottery:time_get(),
    logger:debug("==========time_refresh======~w",
                 [{StatusServ,
                   date:seconds_to_datetime(StartTime),
                   date:seconds_to_datetime(EndTime)}],
                 lottery_mgr,
                 539),
    Now = date:unixtime(),
    StatusCli = case StartTime =< Now andalso Now =< EndTime
                    of
                    true -> 1;
                    _ -> 0
                end,
    StatusCli1 = get_client_state(StatusCli),
    time_set(StatusServ, StatusCli1, StartTime, EndTime),
    Now = date:unixtime(),
    case StatusServ of
        idle -> {StatusServ, (StartTime - Now) * 1000};
        lottery_1 ->
            case StartFlag of
                init -> self() ! start;
                _ -> ignore
            end,
            {StatusServ, (EndTime - Now - 3 * 60) * 1000};
        lottery_2 -> {StatusServ, (EndTime - Now) * 1000};
        _ -> {StatusServ, infinity}
    end.

time_set(StatusServ, StatusCli, StartTime, EndTime) ->
    update_time({StatusServ,
                 StatusCli,
                 StartTime,
                 EndTime}),
    update_local_data(time,
                      {StatusServ, StatusCli, StartTime, EndTime}).

time_get() ->
    case ets:lookup(lottery_misc, time) of
        [{_, {_StatusServ, StatusCli, TimeStart, TimeEnd}}] ->
            {StatusCli, TimeStart, TimeEnd};
        _ -> {0, 0, 0}
    end.

lottery_check(#{id := {_RoleId, Platform, ZoneId}} =
                  Role,
              #lottery{idx = Idx, state = State, times_now = TimesNow,
                       times_sum = TimesSum} =
                  Lottery,
              Count, All) ->
    case State of
        1 ->
            case All of
                0 ->
                    case TimesNow + Count =< TimesSum of
                        true -> {ok, Count};
                        _ ->
                            TimesMy = get_times_buy(Role, Idx),
                            {false, Lottery, TimesMy, 1}
                    end;
                _ ->
                    case TimesNow + Count >= TimesSum of
                        true -> {ok, max(TimesSum - TimesNow, 0)};
                        _ -> {false, lang:get("数据错误")}
                    end
            end;
        _ ->
            TimesMy = get_times_buy(Role, Idx),
            big_world:cast(Platform,
                           ZoneId,
                           lottery_mgr,
                           lottery_update_local,
                           [Role, Lottery, TimesMy]),
            {false, lang:get("该物品已经满员")}
    end.

lottery_do(#{id := RoleId, name := Name} = Role, Idx,
           Count, NumList, BuyList, HistoryLists, IdData,
           LeftList) ->
    {NumList1, LeftList1, OutList1} = out_num(Count,
                                              NumList,
                                              IdData,
                                              LeftList,
                                              []),
    RoleList = [],
    update_times_buy(Role, Idx, length(OutList1)),
    HistoryLists2 = case lists:keytake(RoleId,
                                       1,
                                       HistoryLists)
                        of
                        {value,
                         {RoleId, Name, HistoryList, LastTimes},
                         HistoryLists1} ->
                            HistoryList1 = OutList1 ++ HistoryList,
                            [{RoleId,
                              Name,
                              HistoryList1,
                              LastTimes + length(OutList1)}
                             | HistoryLists1];
                        _ ->
                            [{RoleId, Name, OutList1, length(OutList1)}
                             | HistoryLists]
                    end,
    {State, Time} = case NumList1 of
                        [] -> {2, date:unixtime() + 3 * 60};
                        _ -> {1, 0}
                    end,
    {NumList1,
     LeftList1,
     RoleList ++ BuyList,
     HistoryLists2,
     State,
     Time}.

out_num(_Count, [], _IdData, LeftList, Acc) ->
    {[], LeftList, Acc};
out_num(0, NumList, _IdData, LeftList, Acc) ->
    {NumList, LeftList, Acc};
out_num(Count, [{Num, Index} | NumList], IdData,
        LeftList, Acc) ->
    case LeftList of
        {Num, LeftList1} ->
            List1 = lists:sublist(LeftList1, Count),
            Length = length(List1),
            LeftList2 = lists:sublist(LeftList1,
                                      Length + 1,
                                      length(LeftList1)),
            case LeftList2 of
                [] ->
                    out_num(Count - Length,
                            NumList,
                            IdData,
                            [],
                            List1 ++ Acc);
                _ ->
                    out_num(Count - Length,
                            [{Num, Index} | NumList],
                            IdData,
                            {Num, LeftList2},
                            List1 ++ Acc)
            end;
        _ ->
            case lottery_data:rand_list({IdData, Num}) of
                #{num_list := List} ->
                    List1 = lists:sublist(List, Index, Count),
                    Length = length(List1),
                    case Length + Index > 1000 of
                        true ->
                            out_num(Count - Length,
                                    NumList,
                                    IdData,
                                    LeftList,
                                    List1 ++ Acc);
                        _ ->
                            out_num(Count - Length,
                                    [{Num, Index + Length} | NumList],
                                    IdData,
                                    LeftList,
                                    List1 ++ Acc)
                    end;
                _ -> out_num(Count, NumList, IdData, LeftList, Acc)
            end
    end.

deal_handle() ->
    Now = date:unixtime(),
    MatchSpec = [{#lottery{state = '$1', time = '$2',
                           _ = '_'},
                  [{'=:=', '$1', 2}, {'=<', '$2', Now}],
                  ['$_']}],
    List = ets:select(lottery, MatchSpec),
    send_mail(List),
    case ets:select(lottery,
                    [{#lottery{state = '$1', _ = '_'},
                      [{'=:=', '$1', 2}],
                      ['$_']}])
        of
        [_ | _] = List1 ->
            [#lottery{time = Time} | _] =
                lists:keysort(#lottery.time, List1),
            case get(deal_ref) of
                undefined -> ignore;
                TRef -> erlang:cancel_timer(TRef)
            end,
            NewTRef = erlang:send_after(abs(Time - date:unixtime())
                                            * 1000,
                                        self(),
                                        deal),
            put(deal_ref, NewTRef);
        _ -> ignore
    end.

deal_show_handle() ->
    Now = date:unixtime(),
    Conn = [{'=:=', '$13', 3}, {'=<', '$10', Now}],
    case lottery_local:list_to_client(lottery, Conn) of
        {ok, List} ->
            logger:debug("Role deal show ~w",
                         [length(List)],
                         lottery_mgr,
                         676),
            [erlang:send_after(max(1, Time - date:unixtime()) *
                                   1000,
                               self(),
                               {next_item, Idx, ItemIdx, Pos, GoldType})
             || #lottery{idx = Idx, item_idx = ItemIdx, pos = Pos,
                         gold_type = GoldType, time = Time}
                    <- List];
        _ -> ignore
    end.

deal_over_handle() ->
    logger:debug("Role deal ", [], lottery_mgr, 683),
    time_update_init(),
    MatchSpec = [{#lottery{state = '$1', _ = '_'},
                  [{'=:=', '$1', 1}],
                  ['$_']}],
    List = ets:select(lottery, MatchSpec),
    logger:debug("Role deal ~w",
                 [length(List)],
                 lottery_mgr,
                 688),
    send_mail_return(List).

deal_check([], _Times) -> self() ! deal;
deal_check(_List, 0) -> self() ! deal;
deal_check(_List, _Times) -> ok.

send_mail([]) -> ok;
send_mail([#lottery{idx = Idx, item_id = ItemId,
                    item_idx = ItemIdx, item_count = ItemCount,
                    times_sum = TimesSum, pos = Pos, history = History,
                    buy_list = _BuyList, gold_type = GoldType,
                    gold_once = GoldOnce} =
               Lottery
           | Tail]) ->
    logger:debug("中奖结果揭晓 期号:~p", [Idx], lottery_mgr, 701),
    HistoryAll = get_data(history),
    Sum = history_sum(HistoryAll, 0),
    LuckyNum = Sum rem TimesSum,
    case get_lottery_role(History, LuckyNum) of
        {{_RId, Platform, ZoneId} = Role, RoleName, TimesMy} ->
            update_time_update(GoldType, date:unixtime()),
            Lottery1 = Lottery#lottery{state = 3,
                                       lucky_num = LuckyNum,
                                       role_name = RoleName,
                                       times_lottery = TimesMy, role_id = Role,
                                       history_deal = HistoryAll, num_sum = Sum,
                                       time = date:unixtime() + 30},
            update_data(Lottery1),
            Title = lang:get("恭喜中奖！"),
            Content =
                notice:format(lang:get("恭喜您在一元夺宝~ts期中幸运获奖~ts\n奖品总需人次~ts，您参与~ts人次。\n幸运"
                                       "号码：~ts希望您好运连连！"),
                              [{string_2, 1, Idx},
                               {item_2, ItemId, ItemCount},
                               {string_2, 5, TimesSum},
                               {string_2, 1, TimesMy},
                               {string_2, 1, lottery:head_add(LuckyNum, 5)}]),
            Content1 =
                notice:format(lang:get("恭喜您在一元夺宝中幸运获得~ts\n(宝贝已通过~ts发送,敬请查收)"),
                              [{item_2, ItemId, ItemCount},
                               {string_2, 5, "邮件"}]),
            ItemList = [{ItemId, 0, ItemCount}],
            IdxMail = put(max_misc_id, get(max_misc_id) + 1),
            update_mail(#lottery_mail{idx = IdxMail, role_id = Role,
                                      title = Title, content = Content,
                                      item_list = ItemList,
                                      time = date:unixtime()}),
            update_reward_log(#lottery_reward_log{idx = Idx,
                                                  role_id = Role,
                                                  role_name = RoleName,
                                                  item_idx = ItemIdx,
                                                  item_id = ItemId,
                                                  item_count = ItemCount,
                                                  times_buy = TimesMy,
                                                  times_sum = TimesSum,
                                                  time = date:unixtime()}),
            big_world:cast(Platform,
                           ZoneId,
                           lottery_mgr,
                           send_mail_local,
                           [Role, Title, Content, ItemList, IdxMail]),
            big_world:cast(Platform,
                           ZoneId,
                           lottery_mgr,
                           send_message_local,
                           [Role, Content1]),
            mail_check_tref(),
            lottery:broadcast_reward(Role, RoleName, ItemIdx),
            ServerName = get_server_name(Role),
            mail_send_luck(Lottery,
                           History,
                           Role,
                           RoleName,
                           ServerName),
            erlang:spawn(lottery_mgr,
                         log,
                         [#lottery{idx = Idx, item_idx = ItemIdx,
                                   item_id = ItemId, item_count = ItemCount,
                                   gold_type = GoldType, gold_once = GoldOnce},
                          History,
                          Role]),
            erlang:send_after(30 * 1000,
                              self(),
                              {next_item, Idx, ItemIdx, Pos, GoldType});
        _ ->
            Lottery1 = Lottery#lottery{state = 3, pos = 0,
                                       lucky_num = LuckyNum,
                                       time = date:unixtime() + 30},
            update_local_data(lottery, Lottery1),
            update_data(Lottery1),
            logger:error("一元夺宝中奖结算出错了,啊啊啊啊!!!{LuckyNum,TimesSum}~w",
                         [{ItemIdx, LuckyNum, TimesSum}],
                         lottery_mgr,
                         729)
    end,
    send_mail(Tail).

log(Lottery,
    [{RoleId = {_Id, Platform, ZoneId},
      RoleName,
      _NumList,
      Count}
     | History],
    Role)
    when RoleId =/= Role ->
    big_world:cast(Platform,
                   ZoneId,
                   log,
                   lottery,
                   [#role{id = RoleId, name = RoleName, account = "xxx"},
                    Lottery,
                    Count,
                    4]),
    log(Lottery, History, Role);
log(Lottery,
    [{RoleId = {_Id, Platform, ZoneId},
      RoleName,
      _NumList,
      Count}
     | History],
    RoleId) ->
    big_world:cast(Platform,
                   ZoneId,
                   log,
                   lottery,
                   [#role{id = RoleId, name = RoleName, account = "xxx"},
                    Lottery,
                    Count,
                    3]),
    log(Lottery, History, RoleId);
log(_Lottery, [], _RoleId) -> ok.

get_lottery_role([{RoleId, RoleName, NumList, Count}
                  | History],
                 LuckyNum) ->
    case lists:member(LuckyNum, NumList) of
        true -> {RoleId, RoleName, Count};
        _ -> get_lottery_role(History, LuckyNum)
    end;
get_lottery_role([], _LuckyNum) -> false.

send_mail_return([Lottery = #lottery{history = History}
                  | List]) ->
    update_data(Lottery#lottery{state = 5}),
    send_mail_return2(History, Lottery),
    send_mail_return(List);
send_mail_return([]) ->
    time_update_init(),
    ok.

send_mail_return2([{{_Id, Platform, ZoneId} = RoleId,
                    Name,
                    _NumList,
                    LastTimes}
                   | List],
                  Lottery = #lottery{idx = Idx, item_idx = ItemIdx,
                                     item_id = ItemId, gold_type = GoldType,
                                     item_count = ItemCount,
                                     gold_once = GoldOnce}) ->
    logger:debug("资金返回~w",
                 [{length(_NumList), LastTimes}],
                 lottery_mgr,
                 763),
    Title = lang:get("资金返还"),
    Content =
        notice:format(lang:get("一元夺宝活动已经关闭，您参与的~ts期~ts未达到揭晓条件，现全额返还您的参与资金。期待你"
                               "的下次参与！"),
                      [{string_2, 5, Idx}, {item_2, ItemId, ItemCount}]),
    ItemList = [{GoldType, LastTimes * GoldOnce}],
    MailIdx = put(max_misc_id, get(max_misc_id) + 1),
    update_mail(#lottery_mail{idx = MailIdx, title = Title,
                              content = Content, item_list = ItemList,
                              time = date:unixtime(), role_id = RoleId}),
    big_world:cast(Platform,
                   ZoneId,
                   log,
                   lottery,
                   [#role{id = RoleId, name = Name, account = "xxx"},
                    #lottery{idx = Idx, item_idx = ItemIdx,
                             item_id = ItemId, item_count = ItemCount,
                             gold_type = GoldType, gold_once = GoldOnce},
                    LastTimes,
                    2]),
    big_world:cast(Platform,
                   ZoneId,
                   lottery_mgr,
                   send_mail_local,
                   [RoleId, Title, Content, ItemList, MailIdx]),
    mail_check_tref(),
    send_mail_return2(List, Lottery);
send_mail_return2([], _Lottery) -> ok.

send_mail_local(Role, Title, Content, ItemList, Idx) ->
    mail:send(Role, Title, Content, ItemList),
    big_world:cast(lottery_mgr, send_mail_success, [Idx]).

mail_check_tref() ->
    case get(mail_ref) of
        undefined ->
            Tref = erlang:send_after(60 * 1000, self(), mail_check),
            put(mail_ref, Tref);
        _ -> ignore
    end.

send_mail_success(Idx) ->
    info({delete_mail, Idx}),
    ok.

send_message_local({Rid, P, Z}, Content) ->
    case role_query:pid(by_id, Rid, P, Z) of
        {ok, Pid} -> notice:pop({pid, Pid}, 2, Content);
        _ -> ignore
    end.

lottery_update_local(#{conn_pid := ConnPid}, Lottery,
                     TimesMy) ->
    {ok, Msg} = proto_169:pack(srv,
                               16902,
                               {Lottery, TimesMy, 0}),
    ConnPid ! {send_data, Msg},
    ok.

history_sum([], Sum) -> Sum;
history_sum([#lottery_history{num = Num} | Tail],
            Sum) ->
    history_sum(Tail, Sum + Num).

update_id(Key, Id) ->
    case get(Key) of
        undefined -> put(Key, max(1, Id));
        ID -> put(Key, max(ID, Id))
    end.

update_data(Lottery) ->
    update_ets(lottery, Lottery),
    ets:insert(lottery_change, Lottery),
    update_dets(lottery, Lottery).

update_data(Table, Data) ->
    update_ets(Table, Data),
    update_dets(Table, Data).

update_ets(Table, Data) -> ets:insert(Table, Data).

update_dets(Table, Data) ->
    lottery_asyn ! {insert, Table, Data},
    ok.

update_reward_log(Data) ->
    Datas = case ets:lookup(lottery_misc, reward_log) of
                [{_, LogList} | _] ->
                    LogList1 =
                        lists:sublist(lists:reverse(lists:keysort(#lottery_reward_log.time,
                                                                  LogList)),
                                      19),
                    [Data | LogList1];
                _ -> [Data]
            end,
    update_data(lottery_misc, {reward_log, Datas}),
    update_local_data(reward_log, Datas).

update_history(Data) ->
    Data1 = case ets:lookup(lottery_misc, history) of
                [{_, History} | _] ->
                    History1 =
                        lists:sublist(lists:reverse(lists:keysort(#lottery_history.time,
                                                                  History)),
                                      19),
                    [Data | History1];
                _ -> [Data]
            end,
    update_data(lottery_misc, {history, Data1}).

update_mail(Data) -> update_data(lottery_mail, Data).

update_time_update(GoldType, Time) ->
    update_data(lottery_misc, {{time_update, 0}, Time}),
    update_data(lottery_misc,
                {{time_update, GoldType}, Time}).

update_time(Data) ->
    update_data(lottery_misc, {time, Data}).

update_times_buy(#{id := RoleId} = Role, Idx, Count) ->
    List1 = get_times_buy(Role),
    case lists:keytake(Idx, 1, List1) of
        {value, {Idx, Count1}, List2} ->
            update_times_buy_change(RoleId,
                                    [{Idx, Count + Count1} | List2]),
            update_data(lottery_buy,
                        {RoleId, [{Idx, Count + Count1} | List2]});
        _ ->
            update_times_buy_change(RoleId, [{Idx, Count} | List1]),
            update_data(lottery_buy,
                        {RoleId, [{Idx, Count} | List1]})
    end.

update_times_buy_change(RoleId, NewList) ->
    List1 = get_times_buy_change(),
    case lists:keytake({times_buy, RoleId}, 1, List1) of
        {value, _, List2} ->
            ets:insert(lottery_misc,
                       {times_buy_change, [{RoleId, NewList} | List2]});
        _ ->
            ets:insert(lottery_misc,
                       {times_buy_change, [{RoleId, NewList} | List1]})
    end.

get_times_buy_change() ->
    case ets:lookup(lottery_misc, times_buy_change) of
        [{_, List}] -> List;
        _ -> []
    end.

get_times_buy(#role{id = RoleId}) ->
    case ets:lookup(lottery_buy, RoleId) of
        [{_, List}] -> List;
        _ -> []
    end;
get_times_buy(#{id := RoleId}) ->
    case ets:lookup(lottery_buy, RoleId) of
        [{_, List}] -> List;
        _ -> []
    end.

get_times_buy(Role, Idx) ->
    case get_times_buy(Role) of
        [_ | _] = List ->
            case lists:keyfind(Idx, 1, List) of
                {Idx, Count} -> Count;
                _ -> 0
            end;
        _ -> 0
    end.

delete_times_buy() ->
    ets:delete_all_objects(lottery_buy),
    lottery_asyn ! {del_all, lottery_buy}.

update_times_all(Count) ->
    Times = get_times_all(),
    Times1 = case Times > 9999999 of
                 true -> round(Times * 2.5e-1);
                 _ -> Times
             end,
    update_data(lottery_misc, {times_all, Count + Times1}).

get_times_all() ->
    case ets:lookup(lottery_misc, times_all) of
        [{_, Times} | _] -> Times;
        _ -> 0
    end.

get_time_update(GoldType) ->
    case ets:lookup(lottery_misc, {time_update, GoldType})
        of
        [{_, Time}] -> Time;
        _ -> 0
    end.

get_data(Key) ->
    case ets:lookup(lottery_misc, Key) of
        [{_, List} | _] -> List;
        _ -> []
    end.

update_times_rare(Times) ->
    update_data(lottery_misc, {times_rare, Times}).

get_times_rare() ->
    case ets:lookup(lottery_misc, times_rare) of
        [{_, Times} | _] -> Times;
        _ -> 0
    end.

add_times_rare(Rare) ->
    Times = get_times_rare(),
    update_times_rare(Times + Rare).

cut_times_rare(0) -> ignore;
cut_times_rare(Rare) ->
    Times = get_times_rare(),
    update_times_rare(Times - Rare).

update_all(Lottery) ->
    Size = ets:info(lottery_all, size),
    logger:debug("====文件大小==~w", [Size], lottery_mgr, 988),
    case Size >= 100 of
        true ->
            List = ets:tab2list(lottery_all),
            logger:debug("删除文件~n", [], lottery_mgr, 992),
            ListDelet = lists:sublist(lists:keysort(#lottery.time,
                                                    List),
                                      20),
            Fun = fun (#lottery{idx = Idx}) ->
                          ets:delete(lottery_all, Idx),
                          lottery_asyn ! {del, lottery_all, Idx}
                  end,
            lists:foreach(Fun, ListDelet);
        _ -> ignore
    end,
    update_data(lottery_all, Lottery),
    big_world:cast(all,
                   lottery_local,
                   update_local_data,
                   [lottery_all, Lottery]).

delete_mail(Idx) ->
    ets:delete(lottery_mail, Idx),
    lottery_asyn ! {del, lottery_mail, Idx}.

data_clean() ->
    delete_times_buy(),
    update_times_rare(0),
    update_data(lottery_misc, {times_all, 0}),
    lottery_asyn ! {del_all, lottery},
    ets:delete_all_objects(lottery).

time_update_init() ->
    Now = date:unixtime(),
    update_time_update(0, Now),
    update_time_update(90002, Now),
    update_time_update(90003, Now),
    update_time_update(90000, Now).

load_data_misc() ->
    case dets:first(lottery_misc) of
        '$end_of_table' ->
            logger:info("一元夺宝邮件没有数据需要加载", [], lottery_mgr, 1032),
            [];
        _ ->
            dets:traverse(lottery_misc,
                          fun ({mail, _Data}) ->
                                  ignore,
                                  continue;
                              ({Key, Data}) ->
                                  ets:insert(lottery_misc, {Key, Data}),
                                  continue;
                              (_Err) ->
                                  logger:error("错误的一元夺宝邮件数据:~w",
                                               [_Err],
                                               lottery_mgr,
                                               1043),
                                  {done, false}
                          end)
    end.

load_data_mail() ->
    case dets:first(lottery_mail) of
        '$end_of_table' ->
            logger:info("一元夺宝邮件没有数据需要加载", [], lottery_mgr, 1053),
            [];
        _ ->
            dets:traverse(lottery_mail,
                          fun (#lottery_mail{idx = Idx} = Data) ->
                                  update_id(max_misc_id, Idx),
                                  ets:insert(lottery_mail, Data),
                                  continue;
                              (_Err) ->
                                  logger:error("错误的一元夺宝邮件数据:~w",
                                               [_Err],
                                               lottery_mgr,
                                               1062),
                                  {done, false}
                          end),
            put(max_misc_id, get(max_misc_id) + 1)
    end.

load_data_times_buy() ->
    dets:to_ets(lottery_buy, lottery_buy).

load_lottery_all() ->
    case dets:first(lottery_all) of
        '$end_of_table' ->
            logger:info("一元夺宝历史记录没有数据需要加载", [], lottery_mgr, 1076),
            [];
        _ ->
            dets:traverse(lottery_all,
                          fun (L) ->
                                  case lottery_ver:do(L) of
                                      {ok, Lottery = #lottery{}} ->
                                          ets:insert(lottery_all, Lottery),
                                          continue;
                                      _G ->
                                          logger:error("无法转换一元夺宝历史数据:~w",
                                                       [_G],
                                                       lottery_mgr,
                                                       1086),
                                          {done, false}
                                  end
                          end)
    end.

load_data_focus() ->
    dets:to_ets(lottery_focus, lottery_focus).

config_time(TimeList) ->
    update_data(lottery_misc, {config_time, TimeList}),
    info(refresh).

start_api(StartTime, EndTime) ->
    cast({start_gm, StartTime, EndTime}).

stop_force_api() -> cast(stop_force).

pause_next_api() -> info(pause_next).

start_next_api() -> info(start_next).

mail_send_luck(_Lottery, [], _Role, _RoleName,
               _ServerName) ->
    ok;
mail_send_luck(Lottery,
               [{Role, _RoleName, _, _TimesMy} | History], Role,
               RoleName, ServerName) ->
    mail_send_luck(Lottery,
                   History,
                   Role,
                   RoleName,
                   ServerName);
mail_send_luck(#lottery{idx = Idx, gold_type = GoldType,
                        gold_once = GoldOnce, item_id = ItemId,
                        item_count = ItemCount} =
                   Lottery,
               [{{_RId, Platform, ZoneId} = Role,
                 _RoleName,
                 _,
                 TimesMy}
                | History],
               RoleLuck, RoleName, ServerName) ->
    Title = lang:get("一元夺宝·幸运值返还"),
    Gold = GoldOnce * TimesMy,
    Luck = luck_count_get(GoldType, Gold),
    case Luck > 0 of
        true ->
            Content =
                notice:format(lang:get("您在一元夺宝~ts期与~ts擦肩而过，中奖者为~ts的~ts。您积攒了~ts幸运值，~ts"
                                       "幸运值可前往~ts使用，祝您下次好运哦{face_1,9}"),
                              [{string_2, 1, Idx},
                               {item_2, ItemId, ItemCount},
                               {string_2, 5, util:flist("[~ts]", [ServerName])},
                               {role_2, RoleName},
                               {assets_1, 90022, Luck},
                               {assets_2, 90022},
                               {string_2, 5, lang:get("[一元夺宝-兑换]")}]),
            IdxMail = put(max_misc_id, get(max_misc_id) + 1),
            ItemList = [{90022, Luck}],
            update_mail(#lottery_mail{idx = IdxMail, role_id = Role,
                                      title = Title, content = Content,
                                      item_list = ItemList,
                                      time = date:unixtime()}),
            big_world:cast(Platform,
                           ZoneId,
                           lottery_mgr,
                           send_mail_local,
                           [Role, Title, Content, ItemList, IdxMail]),
            mail_send_luck(Lottery,
                           History,
                           RoleLuck,
                           RoleName,
                           ServerName);
        _ ->
            mail_send_luck(Lottery,
                           History,
                           RoleLuck,
                           RoleName,
                           ServerName)
    end.

luck_count_get(90002, Gold) ->
    {Per, _} = lottery:gold_gold_bind_get(),
    per_get(Per, Gold);
luck_count_get(90003, GoldBind) ->
    {_, Per} = lottery:gold_gold_bind_get(),
    per_get(Per, GoldBind);
luck_count_get(_, _) -> 0.

per_get(0, _Gold) -> 0;
per_get(Per, Gold) -> round(Gold / Per).

get_server_name({_Id, Platform, ZoneId}) ->
    case server_list_data:get_server_name({Platform,
                                           ZoneId})
        of
        false -> lang:get("神秘大陆");
        ServerName -> ServerName
    end.

get_client_state(1) -> 1;
get_client_state(State) ->
    Now = date:unixtime(),
    {StartTime, EndTime} = start_end_time_get(),
    logger:info("一元夺宝活动跨度时间 ~w",
                [{StartTime, EndTime}],
                lottery_mgr,
                1174),
    case StartTime =< Now andalso Now < EndTime of
        true -> 1;
        _ -> State
    end.

start_end_time_get() ->
    Now = date:unixtime(),
    Week = date:day_of_the_week(Now),
    case lottery_mgr:get_data(config_time) of
        [_ | _] = List ->
            NextDay = date:unixtime({next_day, Now}),
            start_end_time_get(List, Week, NextDay, 0);
        _ ->
            case lottery_data:time_list() of
                [_ | _] = List1 ->
                    start_end_time_get(List1, Week, Now, Now);
                _ -> {0, 0}
            end
    end.

start_end_time_get([], _Week, StartTime, EndTime) ->
    {StartTime, EndTime};
start_end_time_get([{{Week, Hour1, Min1, Sec1},
                     {Week, Hour2, Min2, Sec2}}
                    | List],
                   Week, StartTime, EndTime) ->
    {{Year, Mon, Day}, {_H, _M, _S}} =
        date:seconds_to_datetime(date:unixtime()),
    StartTime1 = date:datetime_to_seconds({{Year, Mon, Day},
                                           {Hour1, Min1, Sec1}}),
    EndTime1 = date:datetime_to_seconds({{Year, Mon, Day},
                                         {Hour2, Min2, Sec2}}),
    start_end_time_get(List,
                       Week,
                       min(StartTime, StartTime1),
                       max(EndTime, EndTime1));
start_end_time_get([{{Year, Month, Day},
                     {Hour1, Min1, Sec1},
                     {Hour2, Min2, Sec2}}
                    | List],
                   Week, StartTime, EndTime) ->
    {{NowYear, NowMonth, NowDay}, {_H, _M, _S}} =
        date:seconds_to_datetime(date:unixtime()),
    case Year =:= NowYear andalso
             Month =:= NowMonth andalso Day =:= NowDay
        of
        true ->
            StartTime1 = date:datetime_to_seconds({{Year,
                                                    Month,
                                                    Day},
                                                   {Hour1, Min1, Sec1}}),
            EndTime1 = date:datetime_to_seconds({{Year, Month, Day},
                                                 {Hour2, Min2, Sec2}}),
            start_end_time_get(List,
                               Week,
                               min(StartTime, StartTime1),
                               max(EndTime, EndTime1));
        _ -> start_end_time_get(List, Week, StartTime, EndTime)
    end;
start_end_time_get([_R | List], Week, StartTime,
                   EndTime) ->
    start_end_time_get(List, Week, StartTime, EndTime).

write(Start, End) ->
    FileAbsolutePath = lists:append([get_local_path(),
                                     "/",
                                     "a.txt"]),
    {ok, IoDevice} = file:open(FileAbsolutePath, [append]),
    Fun = fun (_, {Acc1, Acc2}) ->
                  Content = util:shuffle(lists:seq(Acc1, Acc2)),
                  io:format(IoDevice, "~w", [Content]),
                  {Acc1 + 1000, Acc2 + 1000}
          end,
    lists:foldl(Fun, {Start, End}, lists:seq(1, 100)),
    file:close(IoDevice),
    ok.

get_local_path() ->
    filename:dirname(code:which(lottery_mgr)).

test(Count) ->
    {MicSec, _L} = timer:tc(util,
                            shuffle,
                            [lists:seq(1, Count)]),
    MicSec div 1000.

return() ->
    List = ets:tab2list(lottery),
    List2 = return(List, []),
    logger:info("return_send_email ~w",
                [{length(List), length(List2)}],
                lottery_mgr,
                1243),
    return_send_email(List2).

return([], Acc) -> Acc;
return([#lottery{role_id = RoleId, history = BuyList,
                 gold_type = Type, gold_once = GoldOnce}
        | List],
       Acc) ->
    logger:debug("buy list ~w",
                 [length(BuyList)],
                 lottery_mgr,
                 1248),
    Acc2 = return2(BuyList, Acc, Type, GoldOnce, RoleId),
    return(List, Acc2).

return2([], Acc, _Type, _GoldOnce, _RoleLottery) -> Acc;
return2([{RoldLotery, _Name, _NumList, _Times} | List],
        Acc, Type, GoldOnce, RoldLotery) ->
    return2(List, Acc, Type, GoldOnce, RoldLotery);
return2([{RoleId, _Name, _NumList, Times} | List], Acc,
        Type, GoldOnce, RoldLotery) ->
    case lists:keytake(RoleId, 1, Acc) of
        {value,
         {RoldId, {GoldType, Gold}, {GoldBindType, GoldBind}},
         Acc2} ->
            case Type of
                90002 ->
                    return2(List,
                            [{RoldId,
                              {GoldType, Gold + GoldOnce * Times},
                              {GoldBindType, GoldBind}}
                             | Acc2],
                            Type,
                            GoldOnce,
                            RoldLotery);
                _ ->
                    return2(List,
                            [{RoldId,
                              {GoldType, Gold},
                              {GoldBindType, GoldBind + GoldOnce * Times}}
                             | Acc2],
                            Type,
                            GoldOnce,
                            RoldLotery)
            end;
        _ ->
            case Type of
                90002 ->
                    return2(List,
                            [{RoleId, {90002, GoldOnce * Times}, {90003, 0}}
                             | Acc],
                            Type,
                            GoldOnce,
                            RoldLotery);
                _ ->
                    return2(List,
                            [{RoleId, {90002, 0}, {90003, GoldOnce * Times}}
                             | Acc],
                            Type,
                            GoldOnce,
                            RoldLotery)
            end
    end.

return_send_email([]) -> ok;
return_send_email([{{_RoleId, Platform, ZoneId} = Role,
                    Gold,
                    GoldBind}
                   | List2]) ->
    logger:debug("return_send_email~w",
                 [{Role, Gold, GoldBind}],
                 lottery_mgr,
                 1275),
    Title = "一元夺宝资金返还",
    Content =
        "感谢您参与本次一元夺宝活动，测试期间没中奖的资金将予以返还，请查收。本活动将进一步优化调整"
        "后再开放，祝您游戏愉快{face_1,3}",
    ItemList = [{Type, Value}
                || {Type, Value} <- [Gold, GoldBind], Value > 0],
    big_world:cast(Platform,
                   ZoneId,
                   mail,
                   send,
                   [Role, Title, Content, ItemList]),
    logger:info("给[~w]发送一元夺宝返还[~w]",
                [Role, ItemList],
                lottery_mgr,
                1280),
    return_send_email(List2).

