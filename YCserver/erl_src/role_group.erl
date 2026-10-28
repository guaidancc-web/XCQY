-file("src/mod/role/role_group.erl", 1).

-module(role_group).

-behaviour(gen_server).

-export([start_link/1,
         members/1,
         join/2,
         leave/2,
         apply_no_args/3,
         apply/2,
         send/2,
         pack_send/3,
         pack_cast/3,
         kick_all_offline/0]).

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

-file("src/mod/role/role_group.erl", 24).

-file("inc/group.hrl", 1).

-record(member,
        {pid :: undefined | pid(),
         conn_pid :: undefined | pid()}).

-file("src/mod/role/role_group.erl", 25).

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

-file("src/mod/role/role_group.erl", 26).

tab(world) -> role_group;
tab(center_world) -> center_group.

tab_all() -> [world].

tab_all(center) -> [center_world].

start_link(Mod) ->
    gen_server:start_link({local, role_group},
                          role_group,
                          [Mod],
                          []).

-spec members(atom() | {atom(), any()}) -> {ok,
                                            [#member{}]} |
                                           {error, term()}.

members(Name) ->
    case catch ets:tab2list(tab(Name)) of
        L when is_list(L) -> {ok, L};
        {'EXIT', {badarg, _}} ->
            {error, role_group_not_running};
        Err -> {error, Err}
    end.

-spec join(atom() | {atom(), any()}, #member{}) -> ok |
                                                   {error, term()}.

join(Name, Info) -> ets:insert(tab(Name), Info).

-spec leave(atom() | {atom(), any()}, pid()) -> ok |
                                                {error, term()}.

leave(Name, RolePid) -> ets:delete(tab(Name), RolePid).

apply_no_args(Name, M, F) ->
    role_group:apply(Name, {M, F, []}).

-spec apply(atom() | {atom(), any()},
            {atom(), atom(), list()}) -> ok | {error, term()}.

apply(Name, {M, F, A}) ->
    case members(Name) of
        {error, Reason} -> {error, Reason};
        {ok, L} -> do_apply(L, {M, F, A})
    end.

-spec send(atom() | {atom(), any()}, binary()) -> ok |
                                                  {error, term()}.

send(Name, Bin) ->
    case members(Name) of
        {error, Reason} -> {error, Reason};
        {ok, L} -> do_send(L, Bin)
    end.

-spec pack_send(atom() | {atom(), any()}, pos_integer(),
                tuple()) -> ok | {error, term()}.

pack_send(Name, Code, Data) ->
    case members(Name) of
        {error, Reason} -> {error, Reason};
        {ok, L} ->
            case mapping:module(game_server, Code) of
                {ok, _Auth, _Caller, Parser, _ModName} ->
                    case catch Parser:pack(srv, Code, Data) of
                        {ok, Bin} -> do_send(L, Bin);
                        Err ->
                            logger:error("打包数据出错[Code:~w][Err:~w]",
                                         [Code, Err],
                                         role_group,
                                         95)
                    end;
                {error, _Code} ->
                    logger:error("模块影射失败[~w]:~w",
                                 [Code, Data],
                                 role_group,
                                 98)
            end
    end.

-spec pack_cast(Pids, Code, Data) -> ok when Pids ::
                                                 [pid()],
                                             Code :: pos_integer(),
                                             Data :: tuple().

pack_cast(Pids, Code, Data) ->
    case mapping:module(game_server, Code) of
        {ok, _Auth, _Caller, Proto, _ModName} ->
            case Proto:pack(srv, Code, Data) of
                {ok, Bin} ->
                    lists:foreach(fun (Pid) ->
                                          case is_pid(Pid) of
                                              true -> Pid ! {socket_proxy, Bin};
                                              false -> ignore
                                          end
                                  end,
                                  Pids);
                {error, Reason} ->
                    logger:error("打包数据出错[Code:~w][Data:~w][Reason:~w]",
                                 [Code, Data, Reason],
                                 role_group,
                                 119)
            end;
        {error, _Code} ->
            logger:error("模块影射失败[~w]:~w",
                         [Code, Data],
                         role_group,
                         122)
    end.

-spec kick_all_offline() -> ok.

kick_all_offline() ->
    lists:foreach(fun (#role_cache{pid = Pid}) ->
                          case is_pid(Pid) of
                              true ->
                                  catch role:stop(sync,
                                                  Pid,
                                                  lang:get("游戏更新，请重启游戏"));
                              false -> ignore
                          end
                  end,
                  role_query:all_cached_roles()).

init([Mod]) ->
    logger:info("[~w] 正在启动...",
                [role_group],
                role_group,
                140),
    process_flag(trap_exit, true),
    case Mod of
        center ->
            [ets:new(tab(Name),
                     [set, named_table, public, {keypos, #member.pid}])
             || Name <- tab_all(center)];
        _ ->
            [ets:new(tab(Name),
                     [set, named_table, public, {keypos, #member.pid}])
             || Name <- tab_all()]
    end,
    State = #state{},
    logger:info("[~w] 启动完成", [role_group], role_group, 149),
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...",
                [role_group],
                role_group,
                162),
    logger:info("[~w] 关闭完成", [role_group], role_group, 163),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_apply([], _) -> ok;
do_apply([#member{pid = Pid} | T], {M, F, A}) ->
    role:apply(async, Pid, {M, F, A}),
    do_apply(T, {M, F, A}).

do_send([], _) -> ok;
do_send([#member{conn_pid = Pid} | T], Bin) ->
    Pid ! {send_data, Bin},
    do_send(T, Bin).

