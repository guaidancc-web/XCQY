-file("src/mod/campaign/c_camp_fashion_vote.erl", 1).

-module(c_camp_fashion_vote).

-author("jia").

-behaviour(gen_fsm).

-export([start_link/0]).

-export([init/1,
         idle/2,
         vote/2,
         show/2,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4,
         call/1,
         cast/1,
         reload/0,
         gm_clean/0,
         get_state/0,
         do_lucky_dog/0]).

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

-file("src/mod/campaign/c_camp_fashion_vote.erl", 51).

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

-file("src/mod/campaign/c_camp_fashion_vote.erl", 52).

-file("inc/camp_fashion_vote.hrl", 1).

-author("jia").

-record(camp_fashion_vote_role,
        {rid = {0, "", 0},
         name = "",
         lev = 0,
         sex = 0,
         classes = 0,
         zone_name = "",
         vote_times = 0,
         voted_times = 0,
         invite_votes = 0,
         reply_invites = 0,
         update_time = 0,
         vote_groups = []}).

-record(camp_fashion_vote_group,
        {group_id = 0,
         vote_list = [],
         vote_num = 0,
         vote_time = 0}).

-record(camp_fashion_vote_lucky,
        {group_id = 0,
         lucky_list = [],
         vote_num = 0,
         vote_rate = 0}).

-record(camp_fashion_vote_invite,
        {invite_key = {{0, "", 0}, {0, "", 0}, 0},
         invite_id = {0, "", 0},
         replay_id = {0, "", 0},
         group_id = 0,
         invite_state = 1,
         invite_time = 0}).

-file("src/mod/campaign/c_camp_fashion_vote.erl", 53).

-record(state, {ts = 0, timeout = 0}).

reload() -> cast(reload).

gm_clean() -> cast(gm_clean).

cast(Msg) ->
    gen_fsm:send_all_state_event(c_camp_fashion_vote, Msg).

call(Msg) ->
    try
        gen_fsm:sync_send_all_state_event(c_camp_fashion_vote,
                                          Msg)
    catch
        _Type:_Reason -> {error, timeout}
    end.

start_link() ->
    gen_fsm:start_link({local, c_camp_fashion_vote},
                       c_camp_fashion_vote,
                       [],
                       []).

init([]) ->
    logger:info("央服时装评选活动开始启动...",
                [],
                c_camp_fashion_vote,
                81),
    process_flag(trap_exit, true),
    dets:open_file(camp_fashion_vote_role,
                   [{file, "./dets/camp_fashion_vote_role.dets"},
                    {keypos, #camp_fashion_vote_role.rid}]),
    ets:new(camp_fashion_vote_role,
            [set,
             named_table,
             public,
             {keypos, #camp_fashion_vote_role.rid}]),
    dets:open_file(camp_fashion_vote_group,
                   [{file, "./dets/camp_fashion_vote_group.dets"},
                    {keypos, #camp_fashion_vote_group.group_id}]),
    ets:new(camp_fashion_vote_group,
            [set,
             named_table,
             public,
             {keypos, #camp_fashion_vote_group.group_id}]),
    dets:open_file(camp_fashion_vote_lucky,
                   [{file, "./dets/camp_fashion_vote_lucky.dets"},
                    {keypos, #camp_fashion_vote_lucky.group_id}]),
    ets:new(camp_fashion_vote_lucky,
            [set,
             named_table,
             public,
             {keypos, #camp_fashion_vote_lucky.group_id}]),
    dets:to_ets(camp_fashion_vote_role,
                camp_fashion_vote_role),
    dets:to_ets(camp_fashion_vote_group,
                camp_fashion_vote_group),
    dets:to_ets(camp_fashion_vote_lucky,
                camp_fashion_vote_lucky),
    case camp_fashion_vote_data:get_etc_config() of
        [#{camp_id := CampID}] ->
            case env:get(camp_fashion_vote_camp_id) of
                CampID when is_integer(CampID) -> ok;
                _ ->
                    env:save(camp_fashion_vote_camp_id, CampID),
                    init_data(),
                    ok
            end;
        _ ->
            logger:error("央服时装评选活动启动错误，配置表出错",
                         [],
                         c_camp_fashion_vote,
                         108),
            ok
    end,
    {StateName, TimeOut} = get_state(),
    NewState = #state{ts = erlang:now(), timeout = TimeOut},
    logger:info("央服时装评选活动启动完成",
                [],
                c_camp_fashion_vote,
                113),
    {ok, StateName, NewState, TimeOut}.

idle(timeout, State) ->
    {StateName, TimeOut} = get_state(),
    NState = State#state{ts = erlang:now(),
                         timeout = TimeOut},
    big_world:cast(all,
                   camp_fashion_vote,
                   info,
                   [push_camp]),
    continue(StateName, NState).

vote(timeout, State) ->
    do_lucky_dog(),
    {_StateName, TimeOut} = get_state(),
    NState = State#state{ts = erlang:now(),
                         timeout = TimeOut},
    continue(show, NState).

show(timeout, State) ->
    {_, TimeOut} = get_state(),
    NState = State#state{ts = erlang:now(),
                         timeout = TimeOut},
    continue(idle, NState).

handle_event({get_lucky_dogs, Args}, StateName,
             State) ->
    case StateName of
        show ->
            #{rid := Rid} = Args,
            {Platform, ZoneId} = Rid,
            LuckyDogs = ets:tab2list(camp_fashion_vote_lucky),
            big_world:cast(Platform,
                           ZoneId,
                           camp_fashion_vote,
                           role_lucky_dogs,
                           [LuckyDogs, Rid]);
        _ -> ok
    end,
    continue(StateName, State);
handle_event(reload, _StateName, State) ->
    logger:info("央服时装评选活动收到重载消息",
                [],
                c_camp_fashion_vote,
                145),
    case camp_fashion_vote_data:get_etc_config() of
        [#{camp_id := CampID}] ->
            case env:get(camp_fashion_vote_camp_id) of
                CampID when is_integer(CampID) -> ok;
                _ ->
                    env:save(camp_fashion_vote_camp_id, CampID),
                    init_data(),
                    ok
            end;
        _ ->
            logger:error("央服时装评选活动启动错误，配置表出错",
                         [],
                         c_camp_fashion_vote,
                         157),
            ok
    end,
    big_world:cast(all, camp_fashion_vote, cast, [reload]),
    {StateName, TimeOut} = get_state(),
    NewState = State#state{ts = erlang:now(),
                           timeout = TimeOut},
    continue(StateName, NewState);
handle_event({add_vote_role, VoteRole}, StateName,
             State) ->
    case StateName of
        vote -> save_vote_role(VoteRole);
        _ -> ok
    end,
    continue(StateName, State);
handle_event({update_vote_role, Args = #{rid := Rid}},
             StateName, State) ->
    case StateName of
        vote ->
            case get_vote_role(Rid) of
                {ok,
                 VoteRole = #camp_fashion_vote_role{name = OldName,
                                                    classes = OldClasses,
                                                    lev = OldLev}} ->
                    NewName = maps:get(name, Args, OldName),
                    NewLev = maps:get(lev, Args, OldLev),
                    NewClasses = maps:get(classes, Args, OldClasses),
                    NewVoteRole = VoteRole#camp_fashion_vote_role{name =
                                                                      NewName,
                                                                  lev = NewLev,
                                                                  classes =
                                                                      NewClasses},
                    save_vote_role(NewVoteRole);
                _ -> ok
            end;
        _ -> ok
    end,
    continue(StateName, State);
handle_event(gm_clean, StateName, State) ->
    init_data(),
    continue(StateName, State);
handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event({vote, Args}, _From, StateName,
                  State) ->
    Reply = case StateName of
                vote ->
                    Rid = maps:get(rid, Args, {0, "", 0}),
                    VoteNum = maps:get(vote_num, Args, 1),
                    GroupID = maps:get(group_id, Args, 1),
                    case get_vote_role(Rid) of
                        {ok, #camp_fashion_vote_role{}} ->
                            case get_vote_group(GroupID) of
                                {ok,
                                 Group = #camp_fashion_vote_group{vote_list =
                                                                      VoteList,
                                                                  vote_num =
                                                                      OldTotalNum}} ->
                                    RoleVote = case lists:keyfind(Rid,
                                                                  1,
                                                                  VoteList)
                                                   of
                                                   {Rid, OldVoteNum, _W} ->
                                                       W = 100,
                                                       {Rid,
                                                        OldVoteNum + VoteNum,
                                                        W};
                                                   _ -> {Rid, VoteNum, 10}
                                               end,
                                    NewVoteList = lists:keystore(Rid,
                                                                 1,
                                                                 VoteList,
                                                                 RoleVote),
                                    NewGroup =
                                        Group#camp_fashion_vote_group{vote_list
                                                                          =
                                                                          NewVoteList,
                                                                      vote_num =
                                                                          OldTotalNum
                                                                              +
                                                                              VoteNum,
                                                                      vote_time
                                                                          =
                                                                          date:unixtime()},
                                    save_vote_group(NewGroup),
                                    {ok, RoleVote};
                                _ -> {false, lang:get("投票分组出错")}
                            end;
                        _ERR -> {false, not_vote_role}
                    end;
                _ -> {false, lang:get("当前不是投票时间")}
            end,
    continue(Reply, StateName, State);
handle_sync_event({invite_vote, _Args}, _From,
                  StateName, State) ->
    Reply = case StateName of
                vote -> {ok, vote};
                _ -> {false, lang:get("当前不是拉票时间")}
            end,
    continue(Reply, StateName, State);
handle_sync_event(_Event, _From, StateName, State) ->
    Reply = ok,
    continue(Reply, StateName, State).

handle_info(_Info, StateName, State) ->
    logger:debug("收到未知消息", [], c_camp_fashion_vote, 249),
    continue(StateName, State).

terminate(_Reason, _StateName, _State) -> ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    continue(StateName, State).

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

get_state() ->
    case camp_fashion_vote_data:get_etc_config() of
        [#{camp_id := CampID,
           show_start_time := ShowStartTime}] ->
            case campaign_data:get(CampID) of
                #camp_cfg{start_time = StartTime, end_time = EndTime} ->
                    ShowTime = date:datetime_to_seconds(ShowStartTime),
                    Now = date:unixtime(),
                    if Now < StartTime ->
                           logger:debug("时装评选活动时间未到未开启",
                                        [],
                                        c_camp_fashion_vote,
                                        276),
                           {idle, (StartTime - Now) * 1000};
                       Now >= StartTime andalso Now < ShowTime ->
                           logger:debug("时装评选活动投票阶段",
                                        [],
                                        c_camp_fashion_vote,
                                        279),
                           {vote, (ShowTime - Now) * 1000};
                       Now >= ShowTime andalso Now < EndTime ->
                           logger:debug("时装评选活动展示阶段",
                                        [],
                                        c_camp_fashion_vote,
                                        282),
                           {show, (EndTime - Now) * 1000};
                       true ->
                           logger:debug("时装评选活动时间已结束",
                                        [],
                                        c_camp_fashion_vote,
                                        285),
                           {idle, date:next_diff(0) * 1000}
                    end;
                _ ->
                    logger:error("campaign_data配置错误",
                                 [],
                                 c_camp_fashion_vote,
                                 289),
                    {idle, date:next_diff(0) * 1000}
            end;
        _ ->
            logger:error("camp_fashion_vote_data配置错误",
                         [],
                         c_camp_fashion_vote,
                         293),
            {idle, date:next_diff(0) * 1000}
    end.

get_vote_role(Rid) ->
    case catch ets:lookup(camp_fashion_vote_role, Rid) of
        [VR = #camp_fashion_vote_role{} | _] -> {ok, VR};
        _ -> {false, not_found}
    end.

get_vote_group(GroupID) ->
    case catch ets:lookup(camp_fashion_vote_group, GroupID)
        of
        [Group = #camp_fashion_vote_group{} | _] -> {ok, Group};
        _ ->
            case lists:member(GroupID,
                              camp_fashion_vote_data:group_id_list())
                of
                true ->
                    Group = #camp_fashion_vote_group{group_id = GroupID},
                    save_vote_group(Group),
                    {ok, Group};
                _ -> {false, error_group_id}
            end
    end.

save_vote_role(VoteRole) ->
    ets:insert(camp_fashion_vote_role, VoteRole),
    dets:insert(camp_fashion_vote_role, VoteRole),
    ok.

save_vote_group(Group) ->
    ets:insert(camp_fashion_vote_group, Group),
    dets:insert(camp_fashion_vote_group, Group),
    ok.

do_lucky_dog() ->
    Groups1 = ets:tab2list(camp_fashion_vote_group),
    Groups2 = util:keys_sort([{asc,
                               #camp_fashion_vote_group.vote_time},
                              #camp_fashion_vote_group.vote_num],
                             Groups1),
    {TotalVote, _, Groups3} = lists:foldl(fun (Group,
                                               {TVoteNum, Index, Acc}) ->
                                                  case Group of
                                                      #camp_fashion_vote_group{group_id
                                                                                   =
                                                                                   GroupID,
                                                                               vote_list
                                                                                   =
                                                                                   VoteList,
                                                                               vote_num
                                                                                   =
                                                                                   VoteNum}
                                                          when length(VoteList)
                                                                   > 0 ->
                                                          LuckyDogs = case Index
                                                                               <
                                                                               4
                                                                          of
                                                                          true ->
                                                                              case
                                                                                  util:rand_list_n(VoteList,
                                                                                                   2,
                                                                                                   10)
                                                                                  of
                                                                                  LuckyRoles
                                                                                      when
                                                                                        is_list(LuckyRoles) ->
                                                                                      lists:foldl(fun
                                                                                                      ({Rid,
                                                                                                        _,
                                                                                                        _},
                                                                                                       Acc2) ->
                                                                                                          case
                                                                                                              get_vote_role(Rid)
                                                                                                              of
                                                                                                              {ok,
                                                                                                               #camp_fashion_vote_role{rid
                                                                                                                                           =
                                                                                                                                           Rid,
                                                                                                                                       name
                                                                                                                                           =
                                                                                                                                           Name,
                                                                                                                                       sex
                                                                                                                                           =
                                                                                                                                           Sex,
                                                                                                                                       zone_name
                                                                                                                                           =
                                                                                                                                           ZoneName,
                                                                                                                                       lev
                                                                                                                                           =
                                                                                                                                           Lev,
                                                                                                                                       classes
                                                                                                                                           =
                                                                                                                                           Classes}} ->
                                                                                                                  [{Rid,
                                                                                                                    ZoneName,
                                                                                                                    Name,
                                                                                                                    Lev,
                                                                                                                    Classes,
                                                                                                                    Sex}
                                                                                                                   | Acc2];
                                                                                                              _ ->
                                                                                                                  Acc2
                                                                                                          end;
                                                                                                      (_,
                                                                                                       Acc2) ->
                                                                                                          Acc2
                                                                                                  end,
                                                                                                  [],
                                                                                                  LuckyRoles);
                                                                                  _ ->
                                                                                      []
                                                                              end;
                                                                          _ ->
                                                                              []
                                                                      end,
                                                          Lucky =
                                                              #camp_fashion_vote_lucky{group_id
                                                                                           =
                                                                                           GroupID,
                                                                                       vote_num
                                                                                           =
                                                                                           VoteNum,
                                                                                       lucky_list
                                                                                           =
                                                                                           LuckyDogs},
                                                          NTVoteNum = TVoteNum +
                                                                          VoteNum,
                                                          NewAcc = [Lucky
                                                                    | Acc],
                                                          NewIndex = Index + 1,
                                                          {NTVoteNum,
                                                           NewIndex,
                                                           NewAcc};
                                                      _ ->
                                                          {TVoteNum, Index, Acc}
                                                  end
                                          end,
                                          {0, 1, []},
                                          Groups2),
    Groups4 = lists:foldl(fun (Groups5 =
                                   #camp_fashion_vote_lucky{vote_num = VN},
                               Acc3) ->
                                  VoteRate = round(VN / TotalVote * 1000),
                                  Groups6 =
                                      Groups5#camp_fashion_vote_lucky{vote_rate
                                                                          =
                                                                          VoteRate},
                                  [Groups6 | Acc3];
                              (_, Acc3) -> Acc3
                          end,
                          [],
                          Groups3),
    save_vote_lucky(Groups4),
    big_world:cast(all,
                   camp_fashion_vote,
                   cast,
                   [{send_lucky_dogs, Groups4}]),
    ok.

save_vote_lucky(LuckyDogs) ->
    ets:insert(camp_fashion_vote_lucky, LuckyDogs),
    dets:insert(camp_fashion_vote_lucky, LuckyDogs).

init_data() ->
    ets:delete_all_objects(camp_fashion_vote_group),
    ets:delete_all_objects(camp_fashion_vote_lucky),
    ets:delete_all_objects(camp_fashion_vote_role),
    dets:delete_all_objects(camp_fashion_vote_group),
    dets:delete_all_objects(camp_fashion_vote_lucky),
    dets:delete_all_objects(camp_fashion_vote_role),
    big_world:cast(all,
                   camp_fashion_vote,
                   cast,
                   [init_data]).

