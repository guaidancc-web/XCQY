-file("src/mod/goodvoice/c_goodvoice_mgr.erl", 1).

-module(c_goodvoice_mgr).

-behaviour(gen_server).

-export([start_link/0, cast/1, call/1, info/1]).

-export([set_status/1]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-file("inc/goodvoice.hrl", 1).

-record(goodvoice,
        {ver = 4,
         role_id = {0, "", 0},
         id = 0,
         platform = "",
         zone_id = 0,
         name = "",
         sex = 0,
         lev = 0,
         classes = 0,
         time = 0,
         summary = "",
         update_time = 0,
         file_name = "",
         liked = 0,
         likers = [],
         flower_likers = [],
         today_flower = 0,
         update_flower = 0,
         caster_num = 0,
         caster = [],
         logs = [],
         only_liked = 0,
         flower = 0}).

-record(goodvoice_report_info,
        {id, time, lev, name, report = []}).

-record(goodvoice_report,
        {id, order, name, lev, time, filename}).

-record(goodvoice_rank,
        {ver = 1,
         role_id = {0, "", 0},
         id = 0,
         platform = "",
         zone_id = 0,
         name = "",
         sex = 0,
         lev = 0,
         classes = 0,
         time = 0,
         summary = "",
         update_time = 0,
         file_name = "",
         liked = 0,
         today_flower = 0,
         update_flower = 0,
         caster_num = 0,
         rank = 0,
         only_liked = 0,
         flower = 0}).

-file("src/mod/goodvoice/c_goodvoice_mgr.erl", 26).

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

-file("src/mod/goodvoice/c_goodvoice_mgr.erl", 27).

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

-file("src/mod/goodvoice/c_goodvoice_mgr.erl", 28).

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

-file("src/mod/goodvoice/c_goodvoice_mgr.erl", 29).

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

-file("src/mod/goodvoice/c_goodvoice_mgr.erl", 30).

-file("inc/item.hrl", 1).

-record(item_base,
        {id = 0 :: non_neg_integer(),
         name = "" :: list(),
         type = 0 :: non_neg_integer(),
         quality = 0 :: 0..4,
         overlap = 1 :: pos_integer(),
         look_id = 0 :: non_neg_integer(),
         use_type = 0 :: 0..4,
         expire_type = 0 :: non_neg_integer(),
         expire_time = 0 ::
             non_neg_integer() |
             {{pos_integer(), pos_integer(), pos_integer()},
              {non_neg_integer(),
               non_neg_integer(),
               non_neg_integer()}},
         attr = [] :: [tuple()],
         lev = 0,
         classes = 0,
         sex = 2,
         buy_source = [],
         condition = [] :: [tuple()],
         effect = [] :: [tuple()],
         alchemy = 0 :: non_neg_integer()}).

-record(item,
        {ver = 0 :: non_neg_integer(),
         id = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         bind = 1 :: 0 | 1,
         look_id = 0,
         type = 0 :: non_neg_integer(),
         use_type = 0 :: 0..4,
         quality = 0 :: 0..4,
         craft = 0 :: 0..5,
         enchant = -1 :: integer(),
         growth_lev = 0,
         growth_val = 0,
         step = 0 :: pos_integer(),
         quantity = 1 :: 0..250,
         pos = 0 :: non_neg_integer(),
         expire_type = 0 :: 0..4,
         expire_time = 0 :: non_neg_integer(),
         attr = [] :: [tuple()],
         reset_attr = [],
         lev = 1 :: pos_integer(),
         classes = 0 :: 0..6,
         sex = 2 :: 0..2,
         extra = [] :: [tuple()],
         data = [] :: [any()]}).

-record(item_extra_info, {source, price}).

-file("src/mod/goodvoice/c_goodvoice_mgr.erl", 31).

-record(state, {status = 1, cast_flag = 0}).

set_status(Status) ->
    case Status =:= 1 orelse Status >= 6 andalso Status =< 8
        of
        true -> cast({set_status, Status});
        _ -> skip
    end.

cast(Args) -> gen_server:cast(c_goodvoice_mgr, Args).

call(Args) ->
    case catch gen_server:call(c_goodvoice_mgr, Args, 10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

info(Args) -> c_goodvoice_mgr ! Args.

start_link() ->
    gen_server:start_link({local, c_goodvoice_mgr},
                          c_goodvoice_mgr,
                          [],
                          []).

init([]) ->
    logger:info("[~w] 正在启动...",
                [c_goodvoice_mgr],
                c_goodvoice_mgr,
                67),
    process_flag(trap_exit, true),
    ets:new(ets_goodvoice_all,
            [set,
             named_table,
             public,
             {keypos, #goodvoice.role_id}]),
    dets:open_file(goodvoice_rank,
                   [{file, "./dets/goodvoice_rank.dets"},
                    {keypos, #goodvoice_rank.role_id}]),
    ets:new(goodvoice_rank,
            [set,
             named_table,
             public,
             {keypos, #goodvoice_rank.role_id}]),
    dets:open_file(goodvoice_rank_only_liked,
                   [{file, "./dets/goodvoice_rank_only_liked.dets"},
                    {keypos, #goodvoice_rank.role_id}]),
    ets:new(goodvoice_rank_only_liked,
            [set,
             named_table,
             public,
             {keypos, #goodvoice_rank.role_id}]),
    goodvoice_mgr:load_rank_data(),
    {Status, NeedTime} = calc_status(),
    logger:info("好声音当前状态是[~w],进入下个状态还需[~w]秒",
                [Status, NeedTime],
                c_goodvoice_mgr,
                79),
    Ref = erlang:send_after(date:next_diff(0, 0, 2) * 1000,
                            self(),
                            zero_reset),
    put(goodvoice_reset_time, Ref),
    case Status of
        1 when NeedTime =:= 0 -> skip;
        _ ->
            erlang:send_after(40 * 1000, self(), init),
            LastTime = date:unixtime(zero) + 86400 -
                           date:unixtime(),
            case NeedTime > LastTime of
                true -> skip;
                false ->
                    Ref1 = erlang:send_after((NeedTime + 1) * 1000,
                                             self(),
                                             status_reset),
                    put(goodvoice_status_reset, Ref1)
            end
    end,
    logger:info("[~w] 启动完成",
                [c_goodvoice_mgr],
                c_goodvoice_mgr,
                97),
    {ok, #state{status = Status}}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({set_status, Status}, State) ->
    logger:info("好声音跨服进入[~w]状态",
                [Status],
                c_goodvoice_mgr,
                104),
    case Status of
        6 ->
            case get(goodvoice_update_ref) of
                OldRef1 when is_reference(OldRef1) ->
                    erlang:cancel_timer(OldRef1);
                _ -> skip
            end,
            Ref2 = erlang:send_after(60 * 1000,
                                     self(),
                                     update_data),
            put(goodvoice_update_ref, Ref2),
            ok;
        7 -> ok;
        8 -> ok;
        1 ->
            {WinList1, WinList2} = calc_win_list(),
            env:save(goodvoice_winner, WinList1),
            env:save(goodvoice_winner_only_liked, WinList2),
            case WinList1 of
                [_ | _] ->
                    NameList1 = merge_role_name(lists:sublist(WinList1, 3),
                                                []),
                    Msg1 =
                        notice:format(lang:get("~ts全服投票结束，恭喜~ts获得偶像榜前三名，成为全服玩家心中的偶像歌手，光芒万丈{fa"
                                               "ce_1, 56}"),
                                      [{string_2, 1, lang:get("星辰好声音")},
                                       {string_1, NameList1}]),
                    big_world:cast(all, notice, cast, [all, 8, Msg1]);
                _ ->
                    Msg1 =
                        notice:format(lang:get("~ts全服投票结束，无人参与活动，真是遗憾{face_1, 3}"),
                                      [{string_2, 1, lang:get("星辰好声音")}]),
                    big_world:cast(all, notice, cast, [all, 8, Msg1])
            end,
            case WinList2 of
                [_ | _] ->
                    NameList2 = merge_role_name(lists:sublist(WinList2, 3),
                                                []),
                    Msg2 =
                        notice:format(lang:get("~ts全服投票结束，恭喜~ts获得实力榜前三名，成为全服玩家心中的实力唱将，热烈祝贺{fa"
                                               "ce_1, 3}"),
                                      [{string_2, 1, lang:get("星辰好声音")},
                                       {string_1, NameList2}]),
                    big_world:cast(all, notice, cast, [all, 8, Msg2]);
                _ ->
                    Msg2 =
                        notice:format(lang:get("~ts全服投票结束，无人参与活动，真是遗憾{face_1, 3}"),
                                      [{string_2, 1, lang:get("星辰好声音")}]),
                    big_world:cast(all, notice, cast, [all, 8, Msg2])
            end;
        _ -> skip
    end,
    {noreply, State#state{status = Status}};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(init, State = #state{status = Status})
    when Status =/= 1 ->
    case get(goodvoice_update_ref) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> skip
    end,
    big_world:cast(all,
                   goodvoice_mgr,
                   info,
                   [init_push_local_data]),
    Ref = erlang:send_after(60 * 1000, self(), update_data),
    put(goodvoice_update_ref, Ref),
    {noreply, State};
handle_info(update_data,
            State = #state{status = Status})
    when Status =/= 1 ->
    big_world:cast(all,
                   goodvoice_mgr,
                   info,
                   [push_local_data]),
    case get(goodvoice_update_ref) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> skip
    end,
    Ref = erlang:send_after(60 * 1000, self(), update_data),
    put(goodvoice_update_ref, Ref),
    self() ! cast_data,
    {noreply, State};
handle_info(gm_update_rank, State) ->
    case get(goodvoice_update_rank_ref) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> skip
    end,
    big_world:cast(all,
                   goodvoice_mgr,
                   info,
                   [init_push_local_data]),
    Ref = erlang:send_after(2000, self(), update_rank),
    put(goodvoice_update_rank_ref, Ref),
    {noreply, State};
handle_info({update_local_data,
             _Platform,
             _ZoneId,
             Data},
            State) ->
    ets:insert(ets_goodvoice_all, Data),
    {noreply, State#state{cast_flag = 1}};
handle_info(cast_data, State = #state{cast_flag = 1}) ->
    Data = ets:tab2list(ets_goodvoice_all),
    big_world:cast(all,
                   goodvoice_mgr,
                   info,
                   [{update_all_data, Data}]),
    {noreply, State#state{cast_flag = 0}};
handle_info(cast_data, State) -> {noreply, State};
handle_info(update_rank, State) ->
    case get(goodvoice_update_rank_ref) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> skip
    end,
    Data = ets:tab2list(ets_goodvoice_all),
    SorData = util:keys_sort([#goodvoice.caster_num,
                              #goodvoice.liked],
                             Data),
    SorData2 = util:keys_sort([#goodvoice.caster_num,
                               #goodvoice.only_liked],
                              Data),
    update_rank(SorData),
    update_rank_only_liked(SorData2),
    {noreply, State};
handle_info(zero_reset, State) ->
    case get(goodvoice_reset_time) of
        OldRef1 when is_reference(OldRef1) ->
            erlang:cancel_timer(OldRef1);
        _ -> skip
    end,
    case get(goodvoice_status_reset) of
        OldRef2 when is_reference(OldRef2) ->
            erlang:cancel_timer(OldRef2);
        _ -> skip
    end,
    Ref = erlang:send_after(date:next_diff(0, 0, 2) * 1000,
                            self(),
                            zero_reset),
    put(goodvoice_reset_time, Ref),
    {Status, NeedTime} = calc_status(),
    logger:info("0点计算好声音当前状态[~w]还需[~w]秒进入下阶段",
                [Status, NeedTime],
                c_goodvoice_mgr,
                222),
    case Status of
        1 when NeedTime =:= 0 -> skip;
        _ ->
            LastTime = date:unixtime(zero) + 86400 -
                           date:unixtime(),
            case NeedTime > LastTime of
                true -> skip;
                false ->
                    Ref1 = erlang:send_after((NeedTime + 1) * 1000,
                                             self(),
                                             status_reset),
                    put(goodvoice_status_reset, Ref1)
            end
    end,
    {noreply, State#state{status = Status}};
handle_info(status_reset,
            State = #state{status = Status}) ->
    case get(goodvoice_status_reset) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> skip
    end,
    {NewStatus, NeedTime} = calc_status(),
    case NewStatus of
        1 when NeedTime =:= 0 -> skip;
        _ ->
            LastTime = date:unixtime(zero) + 86400 -
                           date:unixtime(),
            case NeedTime > LastTime of
                true -> skip;
                false ->
                    Ref1 = erlang:send_after((NeedTime + 1) * 1000,
                                             self(),
                                             status_reset),
                    put(goodvoice_status_reset, Ref1)
            end
    end,
    logger:info("好声音活动从[~w]跳转到[~w]状态",
                [Status, NewStatus],
                c_goodvoice_mgr,
                253),
    case NewStatus of
        6 ->
            case get(goodvoice_update_ref) of
                OldRef1 when is_reference(OldRef1) ->
                    erlang:cancel_timer(OldRef1);
                _ -> skip
            end,
            Ref2 = erlang:send_after(60 * 1000,
                                     self(),
                                     update_data),
            put(goodvoice_update_ref, Ref2),
            ok;
        7 -> ok;
        8 -> ok;
        1 ->
            {WinList1, WinList2} = calc_win_list(),
            env:save(goodvoice_winner, WinList1),
            env:save(goodvoice_winner_only_liked, WinList2),
            case WinList1 of
                [_ | _] ->
                    NameList1 = merge_role_name(WinList1, []),
                    Msg1 =
                        notice:format(lang:get("~ts全服投票结束，恭喜~ts获得偶像榜前三名，成为全服玩家心中的偶像歌手，光芒万丈{fa"
                                               "ce_1, 56}"),
                                      [{string_2, 1, lang:get("星辰好声音")},
                                       {string_1, NameList1}]),
                    big_world:cast(all, notice, cast, [all, 8, Msg1]);
                _ ->
                    Msg1 =
                        notice:format(lang:get("~ts全服投票结束，无人参与活动，真是遗憾{face_1, 3}"),
                                      [{string_2, 1, lang:get("星辰好声音")}]),
                    big_world:cast(all, notice, cast, [all, 8, Msg1])
            end,
            case WinList2 of
                [_ | _] ->
                    NameList2 = merge_role_name(WinList2, []),
                    Msg2 =
                        notice:format(lang:get("~ts全服投票结束，恭喜~ts获得实力榜前三名，成为全服玩家心中的实力唱将，热烈祝贺{fa"
                                               "ce_1, 3}"),
                                      [{string_2, 1, lang:get("星辰好声音")},
                                       {string_1, NameList2}]),
                    big_world:cast(all, notice, cast, [all, 8, Msg2]);
                _ ->
                    Msg2 =
                        notice:format(lang:get("~ts全服投票结束，无人参与活动，真是遗憾{face_1, 3}"),
                                      [{string_2, 1, lang:get("星辰好声音")}]),
                    big_world:cast(all, notice, cast, [all, 8, Msg2])
            end;
        _ -> skip
    end,
    {noreply, State#state{status = NewStatus}};
handle_info(_Info, State) ->
    logger:error("收到未知消息:~w",
                 [_Info],
                 c_goodvoice_mgr,
                 295),
    {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...",
                [c_goodvoice_mgr],
                c_goodvoice_mgr,
                299),
    logger:info("[~w] 关闭完成",
                [c_goodvoice_mgr],
                c_goodvoice_mgr,
                300),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

calc_win_list() ->
    Data = ets:tab2list(ets_goodvoice_all),
    SorData1 = util:keys_sort([#goodvoice.caster_num,
                               #goodvoice.liked],
                              Data),
    update_rank(SorData1),
    SorData2 = util:keys_sort([#goodvoice.caster_num,
                               #goodvoice.only_liked],
                              Data),
    update_rank_only_liked(SorData2),
    {L1, L2} = do_calc_win_list(SorData1,
                                SorData2,
                                1,
                                [],
                                [],
                                []),
    {L1, L2}.

do_calc_win_list([], [], _Num, WinList1, WinList2,
                 _List) ->
    {lists:reverse(WinList1), lists:reverse(WinList2)};
do_calc_win_list([GoodVoice1 = #goodvoice{role_id =
                                              RoleId1,
                                          name = Name1}
                  | T1],
                 [GoodVoice2 = #goodvoice{role_id = RoleId2,
                                          name = Name2}
                  | T2],
                 Num, WinList1, WinList2, List) ->
    List1 = case lists:member(RoleId1, List) of
                true -> List;
                _ ->
                    send_reward(GoodVoice1, Num, 1),
                    [RoleId1 | List]
            end,
    List2 = case lists:member(RoleId2, List1) of
                true -> List1;
                _ ->
                    send_reward(GoodVoice2, Num, 2),
                    [RoleId2 | List1]
            end,
    case Num =< 10 of
        true ->
            do_calc_win_list(T1,
                             T2,
                             Num + 1,
                             [{RoleId1, Name1, Num} | WinList1],
                             [{RoleId2, Name2, Num} | WinList2],
                             List2);
        false ->
            do_calc_win_list(T1,
                             T2,
                             Num + 1,
                             WinList1,
                             WinList2,
                             List2)
    end;
do_calc_win_list([],
                 [GoodVoice2 = #goodvoice{role_id = RoleId2,
                                          name = Name2}
                  | T2],
                 Num, WinList1, WinList2, List) ->
    List2 = case lists:member(RoleId2, List) of
                true -> List;
                _ ->
                    send_reward(GoodVoice2, Num, 2),
                    [RoleId2 | List]
            end,
    case Num =< 10 of
        true ->
            do_calc_win_list([],
                             T2,
                             Num + 1,
                             WinList1,
                             [{RoleId2, Name2, Num} | WinList2],
                             List2);
        false ->
            do_calc_win_list([],
                             T2,
                             Num + 1,
                             WinList1,
                             WinList2,
                             List2)
    end;
do_calc_win_list([GoodVoice1 = #goodvoice{role_id =
                                              RoleId1,
                                          name = Name1}
                  | T1],
                 [], Num, WinList1, WinList2, List) ->
    List2 = case lists:member(RoleId1, List) of
                true -> List;
                _ ->
                    send_reward(GoodVoice1, Num, 1),
                    [RoleId1 | List]
            end,
    case Num =< 10 of
        true ->
            do_calc_win_list(T1,
                             [],
                             Num + 1,
                             [{RoleId1, Name1, Num} | WinList1],
                             WinList2,
                             List2);
        false ->
            do_calc_win_list(T1,
                             [],
                             Num + 1,
                             WinList1,
                             WinList2,
                             List2)
    end.

send_reward(#goodvoice{role_id =
                           RoleId = {_, Rplat, Rzone},
                       name = Name, liked = Liked},
            Num, RewardType)
    when RewardType =:= 1 ->
    Items = sing_data:get({RewardType, 2, Num}),
    Title = lang:get("好声音奖励"),
    Content = if Num =:= 1 ->
                     notice:format(lang:get("恭喜您获得~ts！"),
                                   [{string_2, 1, lang:get("星辰好声音-入围赛偶像榜冠军")}]);
                 Num =:= 2 ->
                     notice:format(lang:get("恭喜您获得~ts！"),
                                   [{string_2, 1, lang:get("星辰好声音-入围赛偶像榜亚军")}]);
                 Num =:= 3 ->
                     notice:format(lang:get("恭喜您获得~ts！"),
                                   [{string_2, 1, lang:get("星辰好声音-入围赛偶像榜季军")}]);
                 Num =< 10 ->
                     notice:format(lang:get("恭喜您获得~ts第~ts名！"),
                                   [{string_2, 1, lang:get("星辰好声音-入围赛偶像榜")},
                                    {string_2, 1, Num}]);
                 Num =< 20 ->
                     notice:format(lang:get("恭喜您获得~ts第~ts名！"),
                                   [{string_2, 1, lang:get("星辰好声音-入围赛偶像榜")},
                                    {string_2, 1, Num}]);
                 true ->
                     notice:format(lang:get("感谢您参与本届~ts！"),
                                   [{string_2, 1, lang:get("星辰好声音-入围赛")}])
              end,
    logger:info("给[~ts]发送好声音偶像榜排名[~w]奖励[~w]",
                [Name, Num, Liked],
                c_goodvoice_mgr,
                391),
    big_world:cast(Rplat,
                   Rzone,
                   mail,
                   send,
                   [RoleId,
                    #{title => Title, content => Content, items => Items}]),
    ok;
send_reward(#goodvoice{role_id =
                           RoleId = {_, Rplat, Rzone},
                       name = Name, liked = Liked},
            Num, RewardType) ->
    Items = sing_data:get({RewardType, 2, Num}),
    Title = lang:get("好声音奖励"),
    Content = if Num =:= 1 ->
                     notice:format(lang:get("恭喜您获得~ts！"),
                                   [{string_2, 1, lang:get("星辰好声音-入围赛实力榜冠军")}]);
                 Num =:= 2 ->
                     notice:format(lang:get("恭喜您获得~ts！"),
                                   [{string_2, 1, lang:get("星辰好声音-入围赛实力榜亚军")}]);
                 Num =:= 3 ->
                     notice:format(lang:get("恭喜您获得~ts！"),
                                   [{string_2, 1, lang:get("星辰好声音-入围赛实力榜季军")}]);
                 Num =< 10 ->
                     notice:format(lang:get("恭喜您获得~ts第~ts名！"),
                                   [{string_2, 1, lang:get("星辰好声音-入围赛实力榜")},
                                    {string_2, 1, Num}]);
                 Num =< 20 ->
                     notice:format(lang:get("恭喜您获得~ts第~ts名！"),
                                   [{string_2, 1, lang:get("星辰好声音-入围赛实力榜")},
                                    {string_2, 1, Num}]);
                 true ->
                     notice:format(lang:get("感谢您参与本届~ts！"),
                                   [{string_2, 1, lang:get("星辰好声音-入围赛")}])
              end,
    logger:info("给[~ts]发送好声音实力榜排名[~w]奖励[~w]",
                [Name, Num, Liked],
                c_goodvoice_mgr,
                412),
    big_world:cast(Rplat,
                   Rzone,
                   mail,
                   send,
                   [RoleId,
                    #{title => Title, content => Content, items => Items}]),
    ok;
send_reward(_, _, _) -> ok.

merge_role_name([], Acc) ->
    Acc1 = lists:reverse(Acc),
    string:join(Acc1, "、");
merge_role_name([{_, RoleName, _} | Rest], Acc) ->
    merge_role_name(Rest,
                    [util:flist("{string_2, ~w, ~ts}", [1, RoleName])
                     | Acc]);
merge_role_name([_ | Rest], Acc) ->
    merge_role_name(Rest, Acc).

calc_status() ->
    Now = date:unixtime(),
    ShowStartTime = date:datetime_to_seconds({2019,
                                              7,
                                              8,
                                              0,
                                              1,
                                              0}),
    ShowEndTime = date:datetime_to_seconds({2019,
                                            7,
                                            10,
                                            23,
                                            59,
                                            0}),
    AllVoteWaitStartTime = date:datetime_to_seconds({2019,
                                                     7,
                                                     10,
                                                     23,
                                                     59,
                                                     0}),
    AllVoteWaitEndTime = date:datetime_to_seconds({2019,
                                                   7,
                                                   12,
                                                   0,
                                                   1,
                                                   0}),
    AllVoteStartTime = date:datetime_to_seconds({2019,
                                                 7,
                                                 12,
                                                 0,
                                                 1,
                                                 0}),
    AllVoteEndTime = date:datetime_to_seconds({2019,
                                               7,
                                               19,
                                               23,
                                               59,
                                               0}),
    if Now < ShowStartTime -> {1, ShowStartTime - Now};
       Now >= ShowStartTime andalso Now < ShowEndTime ->
           {6, ShowEndTime - Now};
       Now >= AllVoteWaitStartTime andalso
           Now < AllVoteWaitEndTime ->
           {7, AllVoteWaitEndTime - Now};
       Now >= AllVoteStartTime andalso Now < AllVoteEndTime ->
           {8, AllVoteEndTime - Now};
       true -> {1, 0}
    end.

update_rank(L) ->
    ets:delete_all_objects(goodvoice_rank),
    dets:delete_all_objects(goodvoice_rank),
    L1 = update_rank(L, 1),
    ets:insert(goodvoice_rank, L1),
    dets:insert(goodvoice_rank, L1),
    big_world:cast(all, goodvoice_mgr, update_rank, [L1]).

update_rank_only_liked(L) ->
    ets:delete_all_objects(goodvoice_rank_only_liked),
    dets:delete_all_objects(goodvoice_rank_only_liked),
    L1 = update_rank(L, 1),
    ets:insert(goodvoice_rank_only_liked, L1),
    dets:insert(goodvoice_rank_only_liked, L1),
    big_world:cast(all,
                   goodvoice_mgr,
                   update_rank_only_liked,
                   [L1]).

update_rank([], _) -> [];
update_rank(_, Num) when Num > 50 -> [];
update_rank([#goodvoice{role_id = RoleId,
                        name = RoleName, sex = Sex, classes = Classes,
                        time = Time, summary = Summary, update_time = Now,
                        lev = Lev, file_name = FileName, liked = Liked,
                        flower = Flower, only_liked = OnlyLiked}
             | T],
            Num) ->
    [#goodvoice_rank{role_id = RoleId, name = RoleName,
                     sex = Sex, classes = Classes, time = Time,
                     summary = Summary, update_time = Now, lev = Lev,
                     file_name = FileName, rank = Num, liked = Liked,
                     flower = Flower, only_liked = OnlyLiked}
     | update_rank(T, Num + 1)].

