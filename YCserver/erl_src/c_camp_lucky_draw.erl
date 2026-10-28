-file("src/mod/campaign/c_camp_lucky_draw.erl", 1).

-module(c_camp_lucky_draw).

-author("jia").

-behaviour(gen_server).

-export([start_link/0]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3,
         cast/1,
         call/1,
         info/1,
         check_is_open/0,
         reload/0,
         get_rushing_top_gold/1]).

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

-file("src/mod/campaign/c_camp_lucky_draw.erl", 37).

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

-file("src/mod/campaign/c_camp_lucky_draw.erl", 38).

-file("inc/camp_lucky_draw.hrl", 1).

-author("jia").

-record(camp_lucky_draw_reward_base,
        {group_id = 0,
         base_id = 0,
         bind = 0,
         num = 0,
         min_times = 0,
         is_free = 0,
         weight = 0,
         icon = "",
         min_lev = 0,
         max_lev = 0,
         sex = 2,
         classes = 0,
         is_record = 0,
         is_effect = 0,
         is_cast = 0,
         add_weight = 0,
         is_zone_cast = 0}).

-record(camp_lucky_draw_role,
        {rid = {0, "", 0},
         name = "",
         lev = 0,
         sex = 2,
         classes = 0,
         free_times = 0,
         draw_times = 0,
         update_time = 0}).

-record(camp_lucky_draw_info,
        {camp_id = 0, gold = 0, add_gold = 0, msg_list = []}).

-record(camp_lucky_draw_record_msg,
        {add_time = 0, msg = ""}).

-file("src/mod/campaign/c_camp_lucky_draw.erl", 39).

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

-file("src/mod/campaign/c_camp_lucky_draw.erl", 40).

-record(state, {camp_id = 0, refreshRef = undefind}).

start_link() ->
    gen_server:start_link({local, c_camp_lucky_draw},
                          c_camp_lucky_draw,
                          [],
                          []).

init([]) ->
    dets:open_file(camp_lucky_draw_info,
                   [{file, "./dets/camp_lucky_draw_info.dets"},
                    {keypos, #camp_lucky_draw_info.camp_id}]),
    ets:new(camp_lucky_draw_info,
            [set,
             named_table,
             public,
             {keypos, #camp_lucky_draw_info.camp_id}]),
    dets:to_ets(camp_lucky_draw_info, camp_lucky_draw_info),
    CampID = case check_is_open() of
                 {ok, CID} ->
                     case get_cur_info() of
                         #camp_lucky_draw_info{camp_id = CID} -> CID;
                         _ ->
                             case camp_lucky_draw_data:get_etc_config() of
                                 [#{camp_id := CID2, init_gold := InitGold}] ->
                                     Info = #camp_lucky_draw_info{camp_id =
                                                                      CID2,
                                                                  gold =
                                                                      InitGold},
                                     save_lucky_draw_info(Info),
                                     CID;
                                 _ ->
                                     logger:error("camp_lucky_draw_data配置出错",
                                                  [],
                                                  c_camp_lucky_draw,
                                                  68),
                                     CID
                             end
                     end;
                 _ -> 0
             end,
    RefreshRef = erlang:send_after(date:next_diff(0) * 1000
                                       + 100,
                                   self(),
                                   zero_refresh),
    {ok, #state{refreshRef = RefreshRef, camp_id = CampID}}.

reload() -> info(zero_refresh).

cast(Info) -> gen_server:cast(c_camp_lucky_draw, Info).

call(Info) ->
    case catch gen_server:call(c_camp_lucky_draw,
                               Info,
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

info(Info) -> c_camp_lucky_draw ! Info.

handle_call({push_zone_gold,
             #camp_lucky_draw_info{camp_id = CampID,
                                   add_gold = AddGold},
             ZoneMsg},
            _From, State) ->
    Reply = case get_cur_info() of
                Info = #camp_lucky_draw_info{gold = Gold,
                                             camp_id = CampID,
                                             msg_list = OldMsg} ->
                    TotalGold = Gold + AddGold,
                    TotalMsg = ZoneMsg ++ OldMsg,
                    Msg =
                        lists:keysort(#camp_lucky_draw_record_msg.add_time,
                                      TotalMsg),
                    NewMsg = lists:sublist(lists:reverse(Msg), 20),
                    NewInfo = Info#camp_lucky_draw_info{gold = TotalGold,
                                                        add_gold = 0,
                                                        msg_list = NewMsg},
                    save_lucky_draw_info(NewInfo),
                    big_world:cast(all,
                                   camp_lucky_draw,
                                   cast,
                                   [{center_camp_draw_info, NewInfo}]),
                    {ok, NewInfo};
                _ -> {false, lang:get("获取活动信息出错")}
            end,
    {reply, Reply, State};
handle_call({get_center_gold, {AddGold, GroupID}},
            _From, State) ->
    Reply = case get_cur_info() of
                Info = #camp_lucky_draw_info{gold = Gold} ->
                    TotalGold = min(300000, Gold + AddGold),
                    GainGold = case
                                   camp_lucky_draw_data:get_gold_info(GroupID)
                                   of
                                   {GroupID, Percent, MinGold, MaxGold} ->
                                       max(min(round(Percent / 1000 *
                                                         TotalGold),
                                               MaxGold),
                                           MinGold);
                                   _ -> 0
                               end,
                    NewGold = TotalGold - GainGold,
                    NewInfo = Info#camp_lucky_draw_info{gold = NewGold},
                    save_lucky_draw_info(NewInfo),
                    case GroupID of
                        1 ->
                            logger:info("qqqqqqqqqqqqqqqqqqqqqqqqqqq抽中特等奖了：~w",
                                        [GainGold],
                                        c_camp_lucky_draw,
                                        126);
                        2 ->
                            logger:info("aaaaaaaaaaaaaaaaaaaaaaaaaaa抽中一等奖了：~w",
                                        [GainGold],
                                        c_camp_lucky_draw,
                                        128);
                        _ ->
                            logger:info("bbbbbbbbbbbbbbbbbbbbbbbbbbb抽中二等奖了：~w",
                                        [GainGold],
                                        c_camp_lucky_draw,
                                        130)
                    end,
                    {ok, GainGold, NewGold};
                _ -> {false, lang:get("获取活动信息出错")}
            end,
    {reply, Reply, State};
handle_call(_Request, _From, State) ->
    Reply = ok,
    logger:info("全服转盘抽奖收到未知CALL:~w",
                [_Request],
                c_camp_lucky_draw,
                140),
    {reply, Reply, State}.

handle_cast({update_and_push_info, Info}, State) ->
    save_lucky_draw_info(Info),
    big_world:cast(all,
                   camp_lucky_draw,
                   cast,
                   [{center_camp_draw_info, Info}]),
    {noreply, State};
handle_cast({request_center_info, Rid = {_ID, P, Z}},
            State) ->
    case get_cur_info() of
        Info = #camp_lucky_draw_info{gold = OldGold} ->
            NewGold = get_new_gold(OldGold),
            NewInfo = case OldGold < NewGold of
                          true ->
                              Info2 = Info#camp_lucky_draw_info{gold = NewGold},
                              save_lucky_draw_info(Info2),
                              Info2;
                          _ -> Info
                      end,
            big_world:cast(P,
                           Z,
                           camp_lucky_draw,
                           cast,
                           [{init_draw_info, Rid, NewInfo}]);
        false ->
            logger:debug("转盘抽奖活动尚未开启！！！！！",
                         [],
                         c_camp_lucky_draw,
                         163),
            ok;
        _ -> ok
    end,
    {noreply, State};
handle_cast(_Request, State) ->
    logger:info("全服转盘抽奖活动中央服收到未知Cast:~w",
                [_Request],
                c_camp_lucky_draw,
                170),
    {noreply, State}.

handle_info(zero_refresh,
            State = #state{refreshRef = OldRef}) ->
    case is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    CampID = case check_is_open() of
                 {ok, CID} ->
                     case get_cur_info() of
                         #camp_lucky_draw_info{camp_id = CID} -> CID;
                         _ ->
                             case camp_lucky_draw_data:get_etc_config() of
                                 [#{camp_id := CID2, init_gold := InitGold}] ->
                                     Info = #camp_lucky_draw_info{camp_id =
                                                                      CID2,
                                                                  gold =
                                                                      InitGold},
                                     save_lucky_draw_info(Info),
                                     CID;
                                 _ ->
                                     logger:error("camp_lucky_draw_data配置出错",
                                                  [],
                                                  c_camp_lucky_draw,
                                                  193),
                                     CID
                             end
                     end;
                 _ -> 0
             end,
    NewRef = erlang:send_after(date:next_diff(0) * 1000 +
                                   100,
                               self(),
                               zero_refresh),
    {noreply,
     State#state{refreshRef = NewRef, camp_id = CampID}};
handle_info(_Info, State) ->
    logger:info("全服转盘抽奖活动中央服收到未知Info:~w",
                [_Info],
                c_camp_lucky_draw,
                204),
    {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

get_cur_info() ->
    case check_is_open() of
        {ok, CampID} ->
            case catch ets:lookup(camp_lucky_draw_info, CampID) of
                [Info = #camp_lucky_draw_info{gold = OldGold}] ->
                    InitGold = case camp_lucky_draw_data:get_etc_config() of
                                   [#{init_gold := ITGOld}] -> ITGOld;
                                   _ ->
                                       logger:error("camp_lucky_draw_data配置错误",
                                                    [],
                                                    c_camp_lucky_draw,
                                                    223),
                                       3000
                               end,
                    NewGold = min(300000, max(InitGold, OldGold)),
                    Info#camp_lucky_draw_info{gold = NewGold};
                _ ->
                    case camp_lucky_draw_data:get_etc_config() of
                        [#{camp_id := CID, init_gold := InitGold}] ->
                            #camp_lucky_draw_info{camp_id = CID,
                                                  gold = InitGold};
                        _ ->
                            logger:error("camp_lucky_draw_data配置错误",
                                         [],
                                         c_camp_lucky_draw,
                                         233),
                            false
                    end
            end;
        _ -> false
    end.

check_is_open() ->
    case camp_lucky_draw_data:get_etc_config() of
        [#{camp_id := CampID}] ->
            Now = date:unixtime(),
            case campaign_data:get(CampID) of
                #camp_cfg{start_time = StartTime, end_time = EndTime}
                    when EndTime >= Now andalso StartTime =< Now ->
                    {ok, CampID};
                _ -> 0
            end;
        _ ->
            logger:error("camp_lucky_draw_data配置错误",
                         [],
                         c_camp_lucky_draw,
                         252),
            0
    end.

save_lucky_draw_info(DrawInfo) ->
    ets:insert(camp_lucky_draw_info, DrawInfo),
    dets:insert(camp_lucky_draw_info, DrawInfo).

get_rushing_top_gold(SeasonID) ->
    case camp_rushing_top_data:get_rushing_gold(SeasonID) of
        {SeasonID, Percent, MinGold, MaxGold} ->
            DrawGold = case get_cur_info() of
                           Info = #camp_lucky_draw_info{gold = Gold} ->
                               logger:debug("同期转盘抽奖奖金池：~w",
                                            [Gold],
                                            c_camp_lucky_draw,
                                            268),
                               ReGold = round(Percent * Gold / 1000),
                               NewGold = get_new_gold(Gold - ReGold),
                               NewInfo = Info#camp_lucky_draw_info{gold =
                                                                       NewGold},
                               cast({update_and_push_info, NewInfo}),
                               ReGold;
                           _ -> 0
                       end,
            max(min(DrawGold, MaxGold), MinGold);
        _ ->
            logger:error("camp_rushing_top_data抽取奖池配置错误",
                         [],
                         c_camp_lucky_draw,
                         279),
            100000
    end.

get_new_gold(Gold) ->
    case camp_lucky_draw_data:get_etc_config() of
        [#{init_gold := ITGold}] ->
            case Gold < ITGold of
                true -> ITGold;
                _ -> Gold
            end,
            ITGold;
        _ ->
            logger:error("camp_lucky_draw_data配置错误",
                         [],
                         c_camp_lucky_draw,
                         294),
            Gold
    end.

