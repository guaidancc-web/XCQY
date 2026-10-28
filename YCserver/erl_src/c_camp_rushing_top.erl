-file("src/mod/campaign/c_camp_rushing_top.erl", 1).

-module(c_camp_rushing_top).

-author("Jia").

-behaviour(gen_fsm).

-export([start_link/0]).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

-export([idle/2,
         sign/2,
         ready/2,
         answer/2,
         reward/2,
         get_state/0,
         call/1,
         cast/1,
         info/1,
         get_cur_cfg_season/0,
         reload/0,
         send_reward/0,
         reload_state/0]).

-record(state,
        {ts = erlang:now(),
         timeout = 0,
         rushing_ref = undefind}).

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

-file("src/mod/campaign/c_camp_rushing_top.erl", 61).

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

-file("src/mod/campaign/c_camp_rushing_top.erl", 62).

-file("inc/camp_rushing_top.hrl", 1).

-author("jia").

-record(camp_rushing_top_season_info,
        {season_id = 0,
         cur_index = 0,
         total_index = 0,
         question_group = 0,
         option_a = 0,
         option_b = 0,
         option_c = 0,
         gold = 0,
         final_num = 0,
         final_roles = [],
         gain_gold = 0,
         last_num = 0}).

-record(camp_rushing_top_role,
        {rid = {0, "", 0},
         name = "",
         lev = 0,
         sex = 0,
         classes = 0,
         is_sign = 0,
         in_map = 0,
         index = 0,
         option = 0,
         is_lost = 0,
         sign_times = 0,
         final_times = 0,
         revive_times = 0,
         sys_barrage = 1,
         ply_barrage = 1,
         barrage_time = 0}).

-record(camp_rushing_top_question_base,
        {question_group = 0,
         question_index = 0,
         question = "",
         option_a = "",
         option_b = "",
         option_c = "",
         answer = 0}).

-file("src/mod/campaign/c_camp_rushing_top.erl", 63).

start_link() ->
    gen_fsm:start_link({local, c_camp_rushing_top},
                       c_camp_rushing_top,
                       [],
                       []).

cast(Msg) ->
    gen_fsm:send_all_state_event(c_camp_rushing_top, Msg).

info(Msg) ->
    logger:debug("收到消息yyyyyyyyyyyyyyyyyyy~w",
                 [Msg],
                 c_camp_rushing_top,
                 74),
    c_camp_rushing_top ! Msg.

reload() -> info(reload).

reload_state() -> info(reload_state).

call(Msg) ->
    try
        gen_fsm:sync_send_all_state_event(c_camp_rushing_top,
                                          Msg)
    catch
        _Type:_Reason -> {error, timeout}
    end.

init([]) ->
    logger:info("央服冲顶答题活动开始启动...",
                [],
                c_camp_rushing_top,
                94),
    process_flag(trap_exit, true),
    dets:open_file(camp_rushing_top_season_info,
                   [{file, "./dets/camp_rushing_top_season_info.dets"},
                    {keypos, 1},
                    {type, set}]),
    ets:new(camp_rushing_top_season_info,
            [set, named_table, public, {keypos, 1}]),
    dets:to_ets(camp_rushing_top_season_info,
                camp_rushing_top_season_info),
    dets:open_file(camp_rushing_top_role,
                   [{file, "./dets/camp_rushing_top_role.dets"},
                    {keypos, #camp_rushing_top_role.rid}]),
    ets:new(camp_rushing_top_role,
            [set,
             named_table,
             public,
             {keypos, #camp_rushing_top_role.rid}]),
    dets:to_ets(camp_rushing_top_role,
                camp_rushing_top_role),
    {StateName, TimeOut} = get_state(),
    State = #state{ts = erlang:now(), timeout = TimeOut},
    NewState = case StateName of
                   answer ->
                       QuestionTime =
                           camp_rushing_top:get_config(question_time),
                       Ref = set_timer(QuestionTime, question),
                       State#state{rushing_ref = Ref};
                   _ -> State
               end,
    logger:info("央服冲顶答题活动启动完成",
                [],
                c_camp_rushing_top,
                117),
    {ok, StateName, NewState}.

idle(timeout, State) ->
    {CfgStateName, TimeOut} = get_state(),
    NewState = State#state{ts = date:now2(),
                           timeout = TimeOut},
    StateName = case get_cur_cfg_season() of
                    {ok,
                     #{session_id := SeasonID, question_group := GroupID}}
                        when CfgStateName =:= sign ->
                        InitGold = get_cur_total_gold(SeasonID),
                        GroupLists =
                            camp_rushing_top_data:question_list(GroupID),
                        TotalGold = InitGold,
                        FinalNum = case camp_rushing_top_data:get_offsex(0) of
                                       {0, ExpectGold, OffSet} ->
                                           ROffSet = util:rand(-OffSet, OffSet)
                                                         / 1000
                                                         + 1,
                                           round(TotalGold / ExpectGold *
                                                     ROffSet);
                                       _ -> 0
                                   end,
                        NewInfo = #camp_rushing_top_season_info{final_num =
                                                                    FinalNum,
                                                                gold =
                                                                    TotalGold,
                                                                season_id =
                                                                    SeasonID,
                                                                total_index =
                                                                    length(GroupLists),
                                                                question_group =
                                                                    GroupID,
                                                                last_num =
                                                                    FinalNum},
                        save_season_info(NewInfo),
                        Args = #{state_name => CfgStateName, timeout => TimeOut,
                                 info => NewInfo},
                        push_zone_state(Args),
                        CfgStateName;
                    {false, unopen} -> idle
                end,
    continue(StateName, NewState).

sign(timeout, State) ->
    {_, TimeOut} = get_state(),
    NewState = State#state{ts = erlang:now(),
                           timeout = TimeOut},
    Info = get_cur_season_info(),
    Args = #{state_name => ready, timeout => TimeOut,
             info => Info},
    push_zone_state(Args),
    continue(ready, NewState).

ready(timeout, State) ->
    {_, TimeOut} = get_state(),
    TimeQuestion = camp_rushing_top:get_config(first_time),
    Ref = set_timer(TimeQuestion, question),
    NewState = State#state{ts = erlang:now(),
                           timeout = TimeOut, rushing_ref = Ref},
    Info = get_cur_season_info(),
    Args = #{state_name => answer, timeout => TimeOut,
             info => Info},
    push_zone_state(Args),
    continue(answer, NewState).

answer(timeout, State = #state{rushing_ref = Ref}) ->
    stop_timer(Ref),
    {_, TimeOut} = get_state(),
    NewState = State#state{ts = erlang:now(),
                           timeout = TimeOut, rushing_ref = undefiend},
    Info = get_cur_season_info(),
    Args = #{state_name => reward, timeout => TimeOut,
             info => Info},
    push_zone_state(Args),
    send_reward(),
    continue(reward, NewState).

reward(timeout, State) ->
    {_, TimeOut} = get_state(),
    NewState = State#state{ts = erlang:now(),
                           timeout = TimeOut},
    Info = get_cur_season_info(),
    Args = #{state_name => idle, timeout => TimeOut,
             info => Info},
    push_zone_state(Args),
    continue(idle, NewState).

continue(StateName,
         State = #state{timeout = infinity}) ->
    {next_state, StateName, State, infinity};
continue(StateName,
         State = #state{ts = Ts, timeout = TimeOut}) ->
    {next_state,
     StateName,
     State,
     util:time_left(TimeOut, Ts)}.

continue(Reply, StateName,
         State = #state{timeout = infinity}) ->
    {reply, Reply, StateName, State, infinity};
continue(Reply, StateName,
         State = #state{ts = Ts, timeout = TimeOut}) ->
    {reply,
     Reply,
     StateName,
     State,
     util:time_left(TimeOut, Ts)}.

handle_event({request_season_info, P, Z}, StateName,
             State = #state{ts = Ts, timeout = TimeOut}) ->
    Info = get_cur_season_info(),
    TimeOut2 = util:time_left(TimeOut, Ts),
    TimeOut3 = round(TimeOut2 / 1000),
    Args = #{state_code => get_state_code(StateName),
             timeout => TimeOut3, info => Info},
    big_world:cast(P,
                   Z,
                   camp_rushing_top,
                   cast,
                   [{push_rush_state, Args}]),
    continue(StateName, State);
handle_event({add_rush_role, RushRole}, StateName,
             State) ->
    case StateName =:= ready orelse StateName =:= sign of
        true -> save_rushing_role(RushRole);
        _ -> ok
    end,
    continue(StateName, State);
handle_event({send_barrage_msg, BarrageMsg}, StateName,
             State) ->
    case StateName =:= ready orelse StateName =:= answer of
        true ->
            big_world:cast(all,
                           camp_rushing_top,
                           cast,
                           [{zone_barrage_msg, BarrageMsg}]);
        _ -> ok
    end,
    continue(StateName, State);
handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event({push_zone_info,
                   ZInfo = #camp_rushing_top_season_info{cur_index =
                                                             ZoneIndex,
                                                         final_roles =
                                                             ZFinalRoles,
                                                         option_a = ZOptionA,
                                                         option_b = ZOptionB,
                                                         option_c = ZOptionC}},
                  _From, StateName, State) ->
    logger:info("收到区服同步答案数据~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",
                [],
                c_camp_rushing_top,
                225),
    Reply = case StateName of
                answer ->
                    case get_cur_season_info() of
                        Info = #camp_rushing_top_season_info{cur_index =
                                                                 CenterIndex,
                                                             final_roles =
                                                                 FinalRoles,
                                                             option_a = OptionA,
                                                             option_b = OptionB,
                                                             option_c =
                                                                 OptionC} ->
                            case ZoneIndex =:= CenterIndex of
                                true ->
                                    NewInfo =
                                        Info#camp_rushing_top_season_info{final_roles
                                                                              =
                                                                              FinalRoles
                                                                                  ++
                                                                                  ZFinalRoles,
                                                                          option_a
                                                                              =
                                                                              OptionA
                                                                                  +
                                                                                  ZOptionA,
                                                                          option_b
                                                                              =
                                                                              OptionB
                                                                                  +
                                                                                  ZOptionB,
                                                                          option_c
                                                                              =
                                                                              OptionC
                                                                                  +
                                                                                  ZOptionC},
                                    save_season_info(NewInfo),
                                    ok;
                                _ ->
                                    logger:error("区服上传不同题目的作答:~w",
                                                 [ZInfo],
                                                 c_camp_rushing_top,
                                                 237),
                                    ok
                            end;
                        _ ->
                            logger:error("中央season数据出错:~w",
                                         [ZInfo],
                                         c_camp_rushing_top,
                                         241),
                            ok
                    end;
                _ ->
                    logger:error("区服数据在~w阶段上传：~w",
                                 [StateName, ZInfo],
                                 c_camp_rushing_top,
                                 245),
                    ok
            end,
    continue(Reply, StateName, State);
handle_sync_event(_Event, _From, StateName, State) ->
    logger:info("冲顶答题跨服收到未知同步请求：~w",
                [_Event],
                c_camp_rushing_top,
                251),
    Reply = ok,
    continue(Reply, StateName, State).

handle_info(re_question, StateName, State) ->
    Info = #camp_rushing_top_season_info{season_id =
                                             SeasonId} =
               get_cur_season_info(),
    {TotalIndex, GroupID} = case
                                camp_rushing_top_data:get_season(SeasonId)
                                of
                                #{question_group := QGroup} ->
                                    GroupLists =
                                        camp_rushing_top_data:question_list(QGroup),
                                    {length(GroupLists), QGroup};
                                _ -> {0, 0}
                            end,
    TotalGold = get_cur_total_gold(SeasonId),
    NewInfo = Info#camp_rushing_top_season_info{season_id =
                                                    SeasonId,
                                                gold = TotalGold,
                                                total_index = TotalIndex,
                                                question_group = GroupID,
                                                cur_index = 0},
    save_season_info(NewInfo),
    info(question),
    continue(StateName, State);
handle_info(question, StateName,
            State = #state{rushing_ref = OldRef}) ->
    logger:info("开始发题~~~~~~~~~~~~~~~~~~~~~~",
                [],
                c_camp_rushing_top,
                273),
    stop_timer(OldRef),
    Info = #camp_rushing_top_season_info{final_num =
                                             FinalNum,
                                         cur_index = OldIndex,
                                         total_index = TotalIndex,
                                         question_group = GroupID} =
               get_cur_season_info(),
    NewRef = case StateName =:= answer andalso
                      OldIndex < TotalIndex
                 of
                 true ->
                     NewIndex = OldIndex + 1,
                     NewInfo = Info#camp_rushing_top_season_info{cur_index =
                                                                     NewIndex,
                                                                 final_num = 0,
                                                                 final_roles =
                                                                     [],
                                                                 option_a = 0,
                                                                 option_b = 0,
                                                                 option_c = 0,
                                                                 last_num =
                                                                     FinalNum},
                     save_season_info(NewInfo),
                     push_zone_question(GroupID, NewIndex),
                     AnswerTime = camp_rushing_top:get_config(answer_time),
                     set_timer(AnswerTime, answer_time_out);
                 _ -> undefind
             end,
    NewState = State#state{rushing_ref = NewRef},
    continue(StateName, NewState);
handle_info(answer_time_out, StateName,
            State = #state{rushing_ref = OldRef}) ->
    logger:info("停止答题~~~~~~~~~~~~~~~~~~~~~~",
                [],
                c_camp_rushing_top,
                293),
    stop_timer(OldRef),
    NoticeTime = camp_rushing_top:get_config(notice_time),
    push_zone_notice(),
    NewRef = set_timer(NoticeTime, notice_time),
    NewState = State#state{rushing_ref = NewRef},
    continue(StateName, NewState);
handle_info(notice_time, StateName,
            State = #state{rushing_ref = OldRef}) ->
    logger:info("公布答案~~~~~~~~~~~~~~~~~~~~~~",
                [],
                c_camp_rushing_top,
                302),
    stop_timer(OldRef),
    QuestionTime =
        camp_rushing_top:get_config(question_time),
    NewRef = set_timer(QuestionTime, question),
    push_zone_answer(),
    NewState = State#state{rushing_ref = NewRef},
    continue(StateName, NewState);
handle_info(reload, StateName, State) ->
    {NewStateName, NewState} = case StateName =:= idle
                                        orelse StateName =:= sign
                                   of
                                   true ->
                                       {STName, TimeOut} = get_state(),
                                       case STName of
                                           _
                                               when STName =:= idle orelse
                                                        STName =:= sign ->
                                               State1 = #state{ts =
                                                                   erlang:now(),
                                                               timeout =
                                                                   TimeOut},
                                               Info = get_cur_season_info(),
                                               Args = #{state_name => STName,
                                                        timeout => TimeOut,
                                                        info => Info},
                                               push_zone_state(Args),
                                               {STName, State1};
                                           _ -> {StateName, State}
                                       end;
                                   _ -> {StateName, State}
                               end,
    continue(NewStateName, NewState);
handle_info(reload_state, _StateName, State) ->
    {StateName, TimeOut} = get_state(),
    NewState = State#state{ts = erlang:now(),
                           timeout = TimeOut},
    Info = get_cur_season_info(),
    Args = #{state_name => StateName, timeout => TimeOut,
             info => Info},
    push_zone_state(Args),
    continue(StateName, NewState);
handle_info(_Info, StateName, State) ->
    continue(StateName, State).

terminate(_Reason, _StateName, _State) -> ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

get_state() ->
    NewSeasonID = case catch
                           ets:lookup(camp_rushing_top_season_info,
                                      camp_rushing_top_season_info)
                      of
                      [#camp_rushing_top_season_info{season_id = SID}] ->
                          SID + 1;
                      _ ->
                          [FirstID | _] =
                              camp_rushing_top_data:season_id_list(),
                          FirstID
                  end,
    Now = date:unixtime(),
    case get_cur_cfg_season() of
        {ok,
         #{start_time := StartTime, ready_time := ReadyTime,
           answer_time := AnswerTime, question_group := GroupID,
           end_time := ET}}
            when ET > Now ->
            QuestionList =
                camp_rushing_top_data:question_list(GroupID),
            TotalIndex = length(QuestionList),
            [QT, AT, NT, RT, FT, CT] =
                camp_rushing_top:get_etc_config([question_time,
                                                 answer_time,
                                                 notice_time,
                                                 reward_time,
                                                 first_time,
                                                 clean_time]),
            TotalTime = FT + (AT + NT + QT) * TotalIndex + RT - QT,
            RewardTime = AnswerTime + TotalTime,
            EndTime = RewardTime + CT,
            if Now < StartTime -> {idle, (StartTime - Now) * 1000};
               Now >= StartTime andalso Now < ReadyTime ->
                   logger:debug("当前报名阶段", [], c_camp_rushing_top, 372),
                   {sign, (ReadyTime - Now) * 1000};
               Now >= ReadyTime andalso Now < AnswerTime ->
                   logger:debug("当前准备阶段", [], c_camp_rushing_top, 375),
                   {ready, (AnswerTime - Now) * 1000};
               Now >= AnswerTime andalso Now < RewardTime ->
                   logger:debug("当前答题阶段", [], c_camp_rushing_top, 378),
                   {answer, (RewardTime - Now) * 1000};
               Now >= RewardTime andalso Now < EndTime ->
                   logger:debug("当前奖励阶段", [], c_camp_rushing_top, 381),
                   {reward, (EndTime - Now) * 1000};
               true ->
                   case camp_rushing_top_data:get_season(NewSeasonID) of
                       #{start_time := NStartTime} when NStartTime > Now ->
                           {idle, (NStartTime - Now) * 1000};
                       _ -> {idle, 10 * 60 * 1000}
                   end
            end;
        _ ->
            case camp_rushing_top_data:get_season(NewSeasonID) of
                #{start_time := NStartTime} when NStartTime >= Now ->
                    {idle, (NStartTime - Now) * 1000};
                _ -> {idle, 10 * 60 * 1000}
            end
    end.

get_cur_cfg_season() ->
    SeasonLists = camp_rushing_top_data:season_id_list(),
    check_season(SeasonLists).

check_season([]) -> {false, unopen};
check_season([SeasonID | T]) ->
    case check_season(SeasonID) of
        {ok, Season} -> {ok, Season};
        _ -> check_season(T)
    end;
check_season(SeasonID) when is_integer(SeasonID) ->
    Now = date:unixtime(),
    case camp_rushing_top_data:get_season(SeasonID) of
        Season = #{start_time := StartTime, end_time := EndTime}
            when StartTime =< Now andalso EndTime > Now ->
            {ok, Season};
        _ -> {false, unopen}
    end.

get_cur_season_info() ->
    case catch ets:lookup(camp_rushing_top_season_info,
                          camp_rushing_top_season_info)
        of
        [Info = #camp_rushing_top_season_info{}] -> Info;
        _ ->
            SeasonId = 1,
            {TotalIndex, GroupID} = case
                                        camp_rushing_top_data:get_season(SeasonId)
                                        of
                                        #{question_group := QGroup} ->
                                            GroupLists =
                                                camp_rushing_top_data:question_list(QGroup),
                                            {length(GroupLists), QGroup};
                                        _ -> {0, 0}
                                    end,
            TotalGold = get_cur_total_gold(SeasonId),
            FinalNum = case camp_rushing_top_data:get_offsex(0) of
                           {0, ExpectGold, OffSet} ->
                               ROffSet = util:rand(-OffSet, OffSet) / 1000 + 1,
                               round(TotalGold / ExpectGold * ROffSet);
                           _ -> 0
                       end,
            Info2 = #camp_rushing_top_season_info{final_num =
                                                      FinalNum,
                                                  season_id = SeasonId,
                                                  gold = TotalGold,
                                                  total_index = TotalIndex,
                                                  question_group = GroupID,
                                                  last_num = FinalNum},
            cast({save_season_info, Info2}),
            Info2
    end.

get_cur_total_gold(SeasonID) ->
    c_camp_lucky_draw:get_rushing_top_gold(SeasonID).

push_zone_state(Args) ->
    #{state_name := StateName, timeout := TimeOut,
      info := Info} =
        Args,
    NewArgs = #{state_code => get_state_code(StateName),
                timeout => round(TimeOut / 1000), info => Info},
    big_world:cast(all,
                   camp_rushing_top,
                   cast,
                   [{push_rush_state, NewArgs}]).

push_zone_question(GroupID, Index) ->
    big_world:cast(all,
                   camp_rushing_top,
                   cast,
                   [{push_rush_question, GroupID, Index}]).

push_zone_notice() ->
    big_world:cast(all,
                   camp_rushing_top,
                   info,
                   [push_rush_notice]).

push_zone_answer() ->
    Info = #camp_rushing_top_season_info{last_num = LastNum,
                                         question_group = GroupID,
                                         cur_index = Index, option_a = OptionA,
                                         option_b = OptionB, option_c = OptionC,
                                         gold = Gold} =
               get_cur_season_info(),
    CfgNum = case camp_rushing_top_data:get_offsex(Index) of
                 {Index, ExpectGold, Percent} ->
                     ROffSet = util:rand(-Percent, Percent) / 1000 + 1,
                     round(Gold / ExpectGold * ROffSet);
                 _ ->
                     logger:error("camp_rushing_top_data 奖池稀释配置出错~w",
                                  [Index],
                                  c_camp_rushing_top,
                                  472),
                     10000
             end,
    logger:debug("上题目人数~~~~~~~~~~~~~~~~~~~~~~~~~~：~w",
                 [LastNum],
                 c_camp_rushing_top,
                 475),
    Answer = case
                 camp_rushing_top_data:get_question({GroupID, Index})
                 of
                 #camp_rushing_top_question_base{answer = AS} -> AS;
                 _ -> 1
             end,
    {NewOptionA, NewOptionB, NewOptionC, FinalNum} = case
                                                         Answer
                                                         of
                                                         1 ->
                                                             NewOA = case
                                                                         OptionA
                                                                             >=
                                                                             CfgNum
                                                                         of
                                                                         true ->
                                                                             OptionA;
                                                                         _ ->
                                                                             CfgNum
                                                                     end,
                                                             TotalBC =
                                                                 max(OptionB +
                                                                         OptionC,
                                                                     1),
                                                             NewOB =
                                                                 round(OptionB /
                                                                           TotalBC
                                                                           *
                                                                           (LastNum
                                                                                -
                                                                                NewOA)),
                                                             NewOC =
                                                                 round(OptionC /
                                                                           TotalBC
                                                                           *
                                                                           (LastNum
                                                                                -
                                                                                NewOA)),
                                                             {NewOA,
                                                              NewOB,
                                                              NewOC,
                                                              NewOA};
                                                         2 ->
                                                             NewOB = case
                                                                         OptionB
                                                                             >=
                                                                             CfgNum
                                                                         of
                                                                         true ->
                                                                             OptionB;
                                                                         _ ->
                                                                             CfgNum
                                                                     end,
                                                             TotalAC =
                                                                 max(OptionA +
                                                                         OptionC,
                                                                     1),
                                                             NewOA =
                                                                 round(OptionA /
                                                                           TotalAC
                                                                           *
                                                                           (LastNum
                                                                                -
                                                                                NewOB)),
                                                             NewOC =
                                                                 round(OptionC /
                                                                           TotalAC
                                                                           *
                                                                           (LastNum
                                                                                -
                                                                                NewOB)),
                                                             {NewOA,
                                                              NewOB,
                                                              NewOC,
                                                              NewOB};
                                                         3 ->
                                                             NewOC = case
                                                                         OptionC
                                                                             >=
                                                                             CfgNum
                                                                         of
                                                                         true ->
                                                                             OptionC;
                                                                         _ ->
                                                                             CfgNum
                                                                     end,
                                                             TotalAB =
                                                                 max(OptionA +
                                                                         OptionB,
                                                                     1),
                                                             NewOA =
                                                                 round(OptionA /
                                                                           TotalAB
                                                                           *
                                                                           (LastNum
                                                                                -
                                                                                NewOC)),
                                                             NewOB =
                                                                 round(OptionB /
                                                                           TotalAB
                                                                           *
                                                                           (LastNum
                                                                                -
                                                                                NewOC)),
                                                             {NewOA,
                                                              NewOB,
                                                              NewOC,
                                                              NewOC};
                                                         _ ->
                                                             {OptionA,
                                                              OptionB,
                                                              OptionC,
                                                              OptionA}
                                                     end,
    logger:debug("当前题目人数：~w",
                 [{NewOptionA, NewOptionB, NewOptionC}],
                 c_camp_rushing_top,
                 524),
    SendInfo = Info#camp_rushing_top_season_info{option_a =
                                                     NewOptionA,
                                                 option_b = NewOptionB,
                                                 option_c = NewOptionC,
                                                 final_num = FinalNum},
    save_season_info(SendInfo),
    big_world:cast(all,
                   camp_rushing_top,
                   cast,
                   [{push_rush_answer, SendInfo}]).

send_reward() ->
    #camp_rushing_top_season_info{final_num = FinalNum,
                                  gold = TotalGold, season_id = SeasonID,
                                  total_index = TotalIndex} =
        get_cur_season_info(),
    GoldBaseID = camp_rushing_top:get_config(gold_id),
    GainNum = round(TotalGold / max(FinalNum, 1)),
    GainGold = [{GoldBaseID, GainNum}],
    LostRewards = case
                      camp_rushing_top_data:get_lost_reward({SeasonID,
                                                             TotalIndex})
                      of
                      {SeasonID, _, Reward} when length(Reward) > 0 -> Reward;
                      _ERR1 ->
                          logger:error("camp_rushing_top_data冲顶答题配置失败奖励错误：~w",
                                       [_ERR1],
                                       c_camp_rushing_top,
                                       539),
                          []
                  end,
    GainItems = GainGold ++ LostRewards,
    big_world:cast(all,
                   camp_rushing_top,
                   cast,
                   [{send_reward,
                     get_cur_season_info(),
                     GainNum,
                     GainItems}]).

set_timer(Time, InfoMsg) ->
    erlang:send_after(Time * 1000, self(), InfoMsg).

stop_timer(OldRef) when is_reference(OldRef) ->
    erlang:cancel_timer(OldRef);
stop_timer(_) -> ok.

get_state_code(StateName) ->
    case StateName of
        sign -> 2;
        ready -> 3;
        answer -> 4;
        reward -> 5;
        _ -> 1
    end.

save_season_info(Info) ->
    ets:insert(camp_rushing_top_season_info, Info),
    dets:insert(camp_rushing_top_season_info, Info).

save_rushing_role(Info) ->
    ets:insert(camp_rushing_top_role, Info),
    dets:insert(camp_rushing_top_role, Info).

