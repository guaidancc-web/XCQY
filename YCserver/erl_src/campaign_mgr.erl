-file("src/mod/campaign/campaign_mgr.erl", 1).

-module(campaign_mgr).

-behaviour(gen_server).

-export([reload/0,
         ico/0,
         cli_ico/0,
         lookup_ico/1,
         camp/0,
         srv_camp/0,
         type_camp/1,
         lookup_camp/1,
         get_var/1,
         get_var/2,
         save_var/2,
         check_save_counter/2,
         save_counter/2,
         del_var/1,
         get_camp_time/1,
         get_camp_info/1,
         get_camp_id/1,
         rpc_quest_camp_time/2,
         check_new_camp/1,
         check_new_camp2/0]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-record(state, {}).

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

-file("src/mod/campaign/campaign_mgr.erl", 36).

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

-file("src/mod/campaign/campaign_mgr.erl", 37).

ico() ->
    case catch ets:tab2list(camp_ico_info) of
        L = [_ | _] -> L;
        _ -> []
    end.

cli_ico() ->
    [{IcoId, StartT, EndT}
     || {_Id, IcoId, 1, StartT, EndT} <- ico()].

rpc_quest_camp_time(Role, CampId) ->
    case ets:lookup(camp_time, CampId) of
        [#camp_time{id = Id, start_time = StartTime,
                    end_time = EndTime}] ->
            Reply = {Id, StartTime, EndTime},
            logger:debug("时间========:~w",
                         [Reply],
                         campaign_mgr,
                         54),
            role:link_send(Role, 17868, Reply);
        _ ->
            case lookup_ico(CampId) of
                {_, _, _, StartTime, EndTime} ->
                    Reply = {CampId, StartTime, EndTime},
                    logger:debug("时间========:~w",
                                 [Reply],
                                 campaign_mgr,
                                 60),
                    role:link_send(Role, 17868, Reply);
                _ -> ok
            end
    end.

lookup_ico(Id) ->
    case catch ets:lookup(camp_ico_info, Id) of
        [Ico] -> Ico;
        _ -> false
    end.

-spec camp() -> [#camp_cache{}].

camp() ->
    case catch ets:tab2list(camp_info) of
        L = [_ | _] -> L;
        _ -> []
    end.

srv_camp() ->
    [Camp || Camp = #camp_cache{is_srv_open = 1} <- camp()].

type_camp(SecType) ->
    [Camp
     || Camp = #camp_cache{sec_type = SecType1} <- camp(),
        SecType =:= SecType1].

get_camp_time(Type) when is_integer(Type) ->
    case type_camp(Type) of
        [#camp_cache{start_time = StartTime, end_time = EndTime}
         | _] ->
            {StartTime, EndTime};
        _ -> {-1, -1}
    end;
get_camp_time(_) -> {-1, -1}.

get_camp_info(Type) when is_integer(Type) ->
    case type_camp(Type) of
        [C = #camp_cache{} | _] -> C;
        _ -> false
    end;
get_camp_info(_) -> false.

get_camp_id(Type) ->
    case campaign_mgr:get_camp_info(Type) of
        #camp_cache{id = ID} -> ID;
        _ -> 0
    end.

lookup_camp(Id) ->
    case catch ets:lookup(camp_info, Id) of
        [Camp] -> Camp;
        _ -> false
    end.

get_var(Key, DefVal) ->
    case get_var(Key) of
        undefined -> DefVal;
        error -> DefVal;
        Val -> Val
    end.

-spec get_var(any()) -> undefined | false | any().

get_var(Key) ->
    case catch ets:lookup(camp_var, Key) of
        [] -> undefined;
        [{_, Val}] -> Val;
        _ -> error
    end.

save_var(Key, Val) ->
    ets:insert(camp_var, {Key, Val}),
    dets:insert(camp_var, {Key, Val}),
    Val.

check_save_counter(Key, N) ->
    case get_var(Key) of
        undefined -> save_var(Key, N);
        _ -> save_counter(Key, N)
    end.

save_counter(Key, Val) ->
    V = ets:update_counter(camp_var, Key, Val),
    dets:insert(camp_var, {Key, V}),
    V.

-spec del_var(any()) -> ok | {error, term()}.

del_var(Key) ->
    ets:delete(camp_var, Key),
    dets:delete(camp_var, Key),
    ok.

-spec reload() -> ok.

reload() -> info(reload).

info(Info) -> campaign_mgr ! Info.

cast(Info) -> gen_server:cast(campaign_mgr, Info).

call(Info) ->
    case catch gen_server:call(campaign_mgr, Info, 10000) of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

start_link() ->
    gen_server:start_link({local, campaign_mgr},
                          campaign_mgr,
                          [],
                          []).

init([]) ->
    logger:info("[~w] 正在启动...",
                [campaign_mgr],
                campaign_mgr,
                186),
    process_flag(trap_exit, true),
    ets:new(camp_var,
            [set, named_table, public, {keypos, 1}]),
    dets:open_file(camp_var,
                   [{file, "./dets/camp_var.dets"},
                    {keypos, 1},
                    {type, set}]),
    dets:to_ets(camp_var, camp_var),
    ets:new(camp_ico_info,
            [set, named_table, protected, {keypos, 1}]),
    ets:new(camp_info,
            [set,
             named_table,
             protected,
             {keypos, #camp_cache.id}]),
    dets:open_file(camp_time,
                   [{file, "./dets/camp_time.dets"},
                    {keypos, #camp_time.id},
                    {type, set}]),
    ets:new(camp_time,
            [set, named_table, public, {keypos, #camp_time.id}]),
    dets:to_ets(camp_time, camp_time),
    do_reload(),
    erlang:send_after(date:next_diff(0, 0, 0) * 1000 + 100,
                      self(),
                      zero),
    State = #state{},
    logger:info("[~w] 启动完成",
                [campaign_mgr],
                campaign_mgr,
                200),
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(reload, State) ->
    logger:info("重载活动数据", [], campaign_mgr, 211),
    erase(srv_open_time),
    erase(merge_time),
    OldIcoL = ico(),
    OldCampL = camp(),
    {IcoL, CampL} = do_reload(),
    case OldIcoL -- IcoL of
        [] when length(OldIcoL) =:= length(IcoL) -> skip;
        _ ->
            role_group:pack_send(world,
                                 14003,
                                 {[{IcoId, StartT, EndT}
                                   || {_Id, IcoId, 1, StartT, EndT} <- ico()]})
    end,
    role_group:apply(world, {campaign, push_camp, []}),
    type_update([],
                lists:keysort(1, OldCampL),
                lists:keysort(1, CampL)),
    camp_guild_bady:reload(),
    camp_dragon_boat ! reload,
    camp_hide_seek ! reload,
    camp_halloween_mgr ! reload,
    quest_summer:reload(),
    campaign_unit:reload(),
    campaign_rank_mgr:reload(),
    camp_sales_promotion:reload(),
    camp_cut_price:reload(),
    camp_fashion_promote:reload(),
    camp_wish_flower:reload(),
    camp_exchange:reload(),
    brave_trial:reload(),
    camp_recharge_gift:reload(),
    camp_new_flop:reload(),
    camp_series_recharge:reload(),
    camp_sign_draw:reload(),
    camp_zero_buy:reload(),
    camp_pet_egg:reload(),
    camp_pass_flower_language ! reload,
    camp_consume_rebate:reload(),
    friend_wish_agent:reload(),
    camp_fruit:reload(),
    camp_black_white_chess_mgr:reload(),
    camp_doll:reload(),
    camp_score_exchange:reload(),
    camp_new_discount:reload(),
    camp_scratch_card:reload(),
    camp_zillionaire:reload(),
    camp_new_series_recharge:reload(),
    camp_bring_up_open:reload(),
    camp_new_limit:reload(),
    camp_charge_seven_gift:reload(),
    camp_lucky_tree:reload(),
    campaign_group_purchase:info(reload),
    camp_long_active:reload(),
    camp_gift_custom:reload(),
    camp_pray:reload(),
    {noreply, State};
handle_info(reload_ico, State) ->
    logger:info("重载图标数据", [], campaign_mgr, 306),
    OldIcoL = ico(),
    IcoL = do_reload_ico(date:unixtime()),
    case OldIcoL -- IcoL of
        [] when length(OldIcoL) =:= length(IcoL) -> skip;
        _ ->
            role_group:pack_send(world,
                                 14003,
                                 {[{IcoId, StartT, EndT}
                                   || {_Id, IcoId, 1, StartT, EndT} <- ico()]})
    end,
    {noreply, State};
handle_info({reload_camp, Id}, State) ->
    logger:info("重载活动数据:~w", [Id], campaign_mgr, 317),
    case do_load_camp(campaign_data:get(Id),
                      date:unixtime(),
                      [])
        of
        [] -> ets:delete(camp_info, Id);
        CampL -> ets:insert(camp_info, CampL)
    end,
    {noreply, State};
handle_info(zero, State) ->
    do_zero_clear(campaign_data:all()),
    self() ! reload,
    campaign_misc:special_reward(),
    erlang:send_after(date:next_diff(0, 0, 0) * 1000 + 100,
                      self(),
                      zero),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("开始关闭", [], campaign_mgr, 337),
    logger:info("关闭完成", [], campaign_mgr, 338),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

reset_timer(TriKey, T, Info) ->
    reset_timer(TriKey, T, Info, Info).

reset_timer(_TriKey, T, _Info, ReloadInfo)
    when T >= 864000 ->
    erlang:send_after(864000 * 1000, self(), ReloadInfo);
reset_timer(TriKey, T, Info, _ReloadInfo) ->
    del_timer(TriKey),
    Ref = erlang:send_after(T * 1000, self(), Info),
    put({timer, TriKey}, Ref).

del_timer(TriKey) ->
    case get({timer, TriKey}) of
        undefined -> skip;
        Ref -> catch erlang:cancel_timer(Ref)
    end.

do_zero_clear([Id | T]) ->
    do_zero_clear(campaign_data:get(Id)),
    do_zero_clear(T);
do_zero_clear(_) -> ok.

type_update([], _OldCampL, _NewCampL) -> ok;
type_update([SecType | T], OldCampL, NewCampL) ->
    L1 = [Camp
          || Camp = #camp_cache{sec_type = SecType1} <- OldCampL,
             SecType1 =:= SecType],
    L2 = [Camp
          || Camp = #camp_cache{sec_type = SecType1} <- NewCampL,
             SecType1 =:= SecType],
    do_type_update(SecType, L1, L2),
    type_update(T, OldCampL, NewCampL).

do_type_update(_SecType, L, L) -> skip;
do_type_update(_SecType, _L1, _L2) -> skip.

do_reload() ->
    [del_timer(TriKey) || {{timer, TriKey}, _} <- get()],
    Now = date:unixtime(),
    {do_reload_ico(Now), do_reload_camp(Now)}.

do_reload_ico(Now) ->
    clear_val(),
    put(reload_ico_time, 86400),
    IcoL = load_ico(campaign_data:ico(), Now, []),
    ets:delete_all_objects(camp_ico_info),
    ets:insert(camp_ico_info, IcoL),
    reset_timer(reload_ico,
                get(reload_ico_time),
                reload_ico),
    IcoL.

do_reload_camp(Now) ->
    clear_val(),
    CampL = load_camp(campaign_data:all(), Now, []),
    ets:delete_all_objects(camp_info),
    ets:insert(camp_info, CampL),
    CampL.

clear_val() ->
    erase(merge_zero_time),
    erase(merge_days),
    erase(srv_open_zero_time),
    erase(srv_open_days),
    erase(merge_index).

load_ico([], _Now, L) -> L;
load_ico([Cfg | T], Now, L) ->
    NewL = do_load_ico(Cfg, Now, L),
    load_ico(T, Now, NewL).

do_load_ico(#camp_ico{id = Id, ico_id = IcoId,
                      name = Name, is_show = IsShow, start_time = ST,
                      end_time = ET, white_list = WhiteList,
                      black_list = BlackList, min_open_time = MinOpenTime,
                      max_open_time = MaxOpenTime},
            Now, L) ->
    case check_white_black(WhiteList, BlackList) of
        false -> L;
        true ->
            case check_open_time(MinOpenTime, MaxOpenTime) of
                false -> L;
                true ->
                    case date:parse_time(ST, ET) of
                        {StartT, _EndT} when StartT > Now ->
                            put(reload_ico_time,
                                min(StartT - Now, get(reload_ico_time))),
                            logger:info("活动图标[~w:~w:~ts]未开始，开始时间为:~w",
                                        [Id,
                                         IcoId,
                                         Name,
                                         date:seconds_to_datetime(StartT)],
                                        campaign_mgr,
                                        420),
                            L;
                        {StartT, 0} ->
                            logger:info("活动图标[~w:~w:~ts]开始，永久存在",
                                        [Id, IcoId, Name],
                                        campaign_mgr,
                                        423),
                            [{Id, IcoId, IsShow, StartT, 0} | L];
                        {StartT, EndT} when EndT > Now ->
                            logger:info("活动图标[~w:~w:~ts]开始，结束时间为:~w",
                                        [Id,
                                         IcoId,
                                         Name,
                                         date:seconds_to_datetime(EndT)],
                                        campaign_mgr,
                                        426),
                            put(reload_ico_time,
                                min(EndT - Now, get(reload_ico_time))),
                            [{Id, IcoId, IsShow, StartT, EndT} | L];
                        _ -> L
                    end
            end
    end.

load_camp([], _Now, L) -> L;
load_camp([Id | T], Now, L) ->
    NewL = do_load_camp(campaign_data:get(Id), Now, L),
    load_camp(T, Now, NewL).

do_load_camp(Camp = #camp_cfg{id = Id, name = Name,
                              status = 1, sec_type = SecType, start_time = TST,
                              end_time = TET, cli_start_time = TCliST,
                              cli_end_time = TCliET, white_list = WhiteList,
                              black_list = BlackList,
                              min_open_time = MinOpenTime,
                              max_open_time = MaxOpenTime, merge_min = MergeMin,
                              merge_max = MergeMax, is_keep_time = IsKeepTime},
             Now, L) ->
    case check_white_black(WhiteList, BlackList) of
        false -> L;
        true ->
            MergeFlag = check_merge_index(MergeMin, MergeMax),
            case check_open_time(MinOpenTime, MaxOpenTime) of
                false -> L;
                true when MergeFlag == true ->
                    case check_new_open(Camp) of
                        0 -> L;
                        _ ->
                            {TimeFlag, ST, ET} = case IsKeepTime of
                                                     1 ->
                                                         case
                                                             ets:lookup(camp_time,
                                                                        Id)
                                                             of
                                                             [#camp_time{start_time
                                                                             =
                                                                             TStartT,
                                                                         end_time
                                                                             =
                                                                             TEndT}] ->
                                                                 {true,
                                                                  TStartT,
                                                                  TEndT};
                                                             _ ->
                                                                 {false,
                                                                  TST,
                                                                  TET}
                                                         end;
                                                     _ -> {false, TST, TET}
                                                 end,
                            {CliST, CliET} = case IsKeepTime of
                                                 1 when TimeFlag == true ->
                                                     {ST, ET};
                                                 _ -> {TCliST, TCliET}
                                             end,
                            IsSrvOpen = is_srv_open(Camp),
                            case date:parse_time(CliST, CliET) of
                                {CliStartT, _CliEndT} when CliStartT > Now ->
                                    reset_timer({reload_camp, Id},
                                                CliStartT - Now,
                                                {reload_camp, Id}),
                                    L;
                                {CliStartT, CliEndT = 0} ->
                                    case date:parse_time(ST, ET) of
                                        {StartT, EndT} when StartT > Now ->
                                            reset_timer({reload_camp, Id},
                                                        StartT - Now,
                                                        {reload_camp, Id}),
                                            keep_time(TimeFlag,
                                                      Id,
                                                      StartT,
                                                      EndT,
                                                      Camp),
                                            [#camp_cache{id = Id,
                                                         sec_type = SecType,
                                                         start_time = StartT,
                                                         end_time = EndT,
                                                         cli_start_time =
                                                             CliStartT,
                                                         cli_end_time = CliEndT}
                                             | L];
                                        {StartT, EndT = 0} ->
                                            keep_time(TimeFlag,
                                                      Id,
                                                      StartT,
                                                      EndT,
                                                      Camp),
                                            [#camp_cache{id = Id,
                                                         sec_type = SecType,
                                                         is_srv_open =
                                                             IsSrvOpen,
                                                         start_time = StartT,
                                                         end_time = EndT,
                                                         cli_start_time =
                                                             CliStartT,
                                                         cli_end_time = CliEndT}
                                             | L];
                                        {StartT, EndT} when EndT > Now ->
                                            reset_timer({reload_camp, Id},
                                                        EndT - Now,
                                                        {reload_camp, Id}),
                                            keep_time(TimeFlag,
                                                      Id,
                                                      StartT,
                                                      EndT,
                                                      Camp),
                                            [#camp_cache{id = Id,
                                                         sec_type = SecType,
                                                         is_srv_open =
                                                             IsSrvOpen,
                                                         start_time = StartT,
                                                         end_time = EndT,
                                                         cli_start_time =
                                                             CliStartT,
                                                         cli_end_time = CliEndT}
                                             | L];
                                        {StartT, EndT} ->
                                            [#camp_cache{id = Id,
                                                         sec_type = SecType,
                                                         start_time = StartT,
                                                         end_time = EndT,
                                                         cli_start_time =
                                                             CliStartT,
                                                         cli_end_time = CliEndT}
                                             | L]
                                    end;
                                {CliStartT, CliEndT} when CliEndT > Now ->
                                    case date:parse_time(ST, ET) of
                                        {StartT, _EndT}
                                            when StartT >= CliEndT ->
                                            logger:error("活动[~w:~ts]配置错误 不存在有效时间段",
                                                         [Id, Name],
                                                         campaign_mgr,
                                                         493),
                                            L;
                                        {StartT, EndT} when StartT > Now ->
                                            reset_timer({reload_camp, Id},
                                                        StartT - Now,
                                                        {reload_camp, Id}),
                                            keep_time(TimeFlag,
                                                      Id,
                                                      StartT,
                                                      EndT,
                                                      Camp),
                                            [#camp_cache{id = Id,
                                                         sec_type = SecType,
                                                         start_time = StartT,
                                                         end_time = EndT,
                                                         cli_start_time =
                                                             CliStartT,
                                                         cli_end_time = CliEndT}
                                             | L];
                                        {StartT, EndT = 0} ->
                                            keep_time(TimeFlag,
                                                      Id,
                                                      StartT,
                                                      EndT,
                                                      Camp),
                                            [#camp_cache{id = Id,
                                                         sec_type = SecType,
                                                         is_srv_open =
                                                             IsSrvOpen,
                                                         start_time = StartT,
                                                         end_time = EndT,
                                                         cli_start_time =
                                                             CliStartT,
                                                         cli_end_time = CliEndT}
                                             | L];
                                        {StartT, EndT} when EndT > Now ->
                                            reset_timer({reload_camp, Id},
                                                        min(CliEndT, EndT) -
                                                            Now,
                                                        {reload_camp, Id}),
                                            keep_time(TimeFlag,
                                                      Id,
                                                      StartT,
                                                      EndT,
                                                      Camp),
                                            [#camp_cache{id = Id,
                                                         sec_type = SecType,
                                                         is_srv_open =
                                                             IsSrvOpen,
                                                         start_time = StartT,
                                                         end_time = EndT,
                                                         cli_start_time =
                                                             CliStartT,
                                                         cli_end_time = CliEndT}
                                             | L];
                                        {StartT, EndT} ->
                                            reset_timer({reload_camp, Id},
                                                        CliEndT - Now,
                                                        {reload_camp, Id}),
                                            keep_time(TimeFlag,
                                                      Id,
                                                      StartT,
                                                      EndT,
                                                      Camp),
                                            [#camp_cache{id = Id,
                                                         sec_type = SecType,
                                                         start_time = StartT,
                                                         end_time = EndT,
                                                         cli_start_time =
                                                             CliStartT,
                                                         cli_end_time = CliEndT}
                                             | L]
                                    end;
                                _ -> L
                            end
                    end;
                _ ->
                    logger:debug("合服次数~w",
                                 [{Id,
                                   MergeMin,
                                   MergeMax,
                                   env:get(merge_index)}],
                                 campaign_mgr,
                                 516),
                    L
            end
    end;
do_load_camp(_Camp, _Now, L) -> L.

keep_time(false, Id, StartT, EndT,
          #camp_cfg{is_keep_time = 1}) ->
    CampTime = #camp_time{id = Id, start_time = StartT,
                          end_time = EndT},
    ets:insert(camp_time, CampTime),
    dets:insert(camp_time, CampTime),
    ok;
keep_time(_, _Id, _StartT, _EndT, _) -> ok.

is_srv_open(#camp_cfg{reward_type = 99}) -> 0;
is_srv_open(#camp_cfg{settlement = 99}) -> 0;
is_srv_open(#camp_cfg{camp_cond = undefined}) -> 0;
is_srv_open(#camp_cfg{sec_type = 10005, reward = []}) ->
    1;
is_srv_open(#camp_cfg{sec_type = 10006, reward = []}) ->
    1;
is_srv_open(#camp_cfg{sec_type = 60017, reward = []}) ->
    1;
is_srv_open(#camp_cfg{reward = []}) -> 0;
is_srv_open(#camp_cfg{sec_type = SecType})
    when SecType =:= 60059 orelse
             SecType =:= 60058 orelse
                 SecType =:= 60057 orelse SecType =:= 60060 ->
    case campaign_data:get_new_camp_open(env:get(platform))
        of
        {_, TimeStamp} when is_integer(TimeStamp) ->
            case env:srv_open_time() >= TimeStamp of
                true -> 1;
                _ -> 0
            end;
        _ -> 0
    end;
is_srv_open(_Camp) -> 1.

check_new_open(#camp_cfg{id = Id,
                         sec_type = SecType}) ->
    case Id >= 81 andalso Id =< 115 orelse
             Id >= 509 andalso Id =< 522 orelse Id == 377
        of
        true ->
            SecTypes = [60002, 10002, 20001],
            case lists:member(SecType, SecTypes) of
                true ->
                    case campaign_data:get_new_camp_open(env:get(platform))
                        of
                        {_, TimeStamp} ->
                            case env:srv_open_time() >= TimeStamp of
                                true -> 0;
                                _ -> 1
                            end;
                        _ -> 1
                    end;
                _ -> 1
            end;
        _ when Id =:= 1012 andalso SecType =:= 60058 ->
            BringUpStampTime = 1573142400,
            case env:srv_open_time() >= BringUpStampTime of
                true -> 0;
                _ -> 1
            end;
        _ -> 1
    end;
check_new_open(_) -> 1.

check_white_black([], []) -> true;
check_white_black(WhiteList, BlackList) ->
    P = env:const_var(platform),
    Z = env:const_var(zone_id),
    check_white(WhiteList, P, Z) andalso
        check_black(BlackList, P, Z).

check_white([], _P, _Z) -> true;
check_white(L, P, Z) ->
    [1 || {P1, Z1} <- L, P =:= P1, Z =:= Z1 orelse Z1 =:= 0]
        =/= [].

check_black([], _P, _Z) -> true;
check_black(L, P, Z) ->
    [1 || {P1, Z1} <- L, P =:= P1, Z =:= Z1 orelse Z1 =:= 0]
        =:= [].

check_open_time(0, 0) -> true;
check_open_time(StartT, EndT)
    when StartT < 100000000 andalso EndT < 100000000 ->
    Days = date:open_srv_day(),
    Days >= StartT andalso (Days =< EndT orelse EndT =:= 0);
check_open_time(StartT, EndT) ->
    Time = env:srv_open_time(),
    Time >= StartT andalso (Time =< EndT orelse EndT =:= 0).

check_merge_index(0, 0) -> true;
check_merge_index(Min, Max) ->
    case env:get(merge_index) of
        Index
            when is_integer(Index) andalso
                     Index >= Min andalso Index =< Max ->
            true;
        _ -> false
    end.

check_new_camp(_) -> false.

check_new_camp2() ->
    case campaign_data:get_new_camp_open(env:get(platform))
        of
        {_, TimeStamp} ->
            case env:srv_open_time() >= TimeStamp of
                true -> true;
                _ -> false
            end;
        _ -> false
    end.

