-file("src/mod/map/map_grid.erl", 1).

-module(map_grid).

-behaviour(gen_server).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([start_link/1,
         stop/1,
         enter/2,
         move/7,
         transmit/11,
         leave/7,
         update/2,
         update_status/2,
         update_conn_pid/6,
         in_9grid/3,
         distance/2,
         send_all_dir/2,
         async_apply/2]).

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

-file("src/mod/map/map_grid.erl", 27).

-file("inc/map.hrl", 1).

-record(map,
        {id = 1 :: pos_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         base_id = 1 :: pos_integer(),
         res_id = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         ctrl_pid :: undefined | pid(),
         grid_info = [] :: [{pid(), pos_integer()}],
         name = "" :: bitstring(),
         condition = [] :: list(),
         num = 0 :: non_neg_integer(),
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer()}).

-record(map_grid,
        {map_pid :: undefined | pid(),
         map_id = 1 :: pos_integer(),
         base_id = 1 :: pos_integer(),
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer()}).

-record(map_data,
        {id = 1 :: pos_integer(),
         name = "" :: list(),
         condition = [] :: [tuple()],
         revive = [] :: [tuple()],
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer(),
         grid_x = 0 :: pos_integer(),
         grid_y = 0 :: pos_integer(),
         max_pre_layer = 60 :: pos_integer(),
         startup = 0 :: 0..1,
         is_single = 0 :: 0..1}).

-file("src/mod/map/map_grid.erl", 28).

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

-file("src/mod/map/map_grid.erl", 29).

-file("inc/pos.hrl", 1).

-record(pos_history,
        {map = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(pos,
        {map = 10001 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         last :: undefined | #pos_history{},
         map_base_id = 0 :: non_neg_integer(),
         map_pid = 0 :: non_neg_integer() | pid(),
         map_grid_pid = 0 :: non_neg_integer() | pid(),
         hidden = 1 :: 0 | 1,
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         dir = 0 :: 0..255}).

-file("src/mod/map/map_grid.erl", 30).

-spec start_link(#map_grid{}) -> {ok, pid()} |
                                 ignore |
                                 {error, term()}.

start_link(MapGrid) ->
    gen_server:start_link(map_grid, [MapGrid], []).

-spec stop(pid()) -> ok.

stop(Pid) ->
    Pid ! stop,
    ok.

-spec enter(pid(), #map_role{}) -> ok.

enter(Pid, MapRole) ->
    Pid ! {enter, MapRole},
    ok.

-spec move(pid(), pid(), non_neg_integer(),
           non_neg_integer(), non_neg_integer(), non_neg_integer(),
           non_neg_integer()) -> ok.

move(Pid, RolePid, SrcX, SrcY, DestX, DestY, Dir) ->
    Pid ! {move, RolePid, SrcX, SrcY, DestX, DestY, Dir},
    ok.

-spec transmit(pid(), pos_integer(), pos_integer(),
               pos_integer(), pid(), non_neg_integer(),
               non_neg_integer(), non_neg_integer(), non_neg_integer(),
               list(), list()) -> ok.

transmit(Pid, BaseId, Mode, Speed, RolePid, SrcX, SrcY,
         DestX, DestY, DestList, Looks) ->
    Pid !
        {transmit,
         BaseId,
         Mode,
         Speed,
         RolePid,
         SrcX,
         SrcY,
         DestX,
         DestY,
         DestList,
         Looks},
    ok.

-spec leave(pid(), pid(), non_neg_integer(),
            non_neg_integer(), pos_integer(), bitstring(),
            non_neg_integer()) -> ok.

leave(Pid, RolePid, X, Y, Rid, Platform, ZoneId) ->
    Pid ! {leave, RolePid, X, Y, Rid, Platform, ZoneId},
    ok.

-spec update(pid(), #map_role{}) -> ok.

update(Pid, MapRole) when is_pid(Pid) ->
    Pid ! {update, MapRole},
    ok;
update(_Pid, _MapRole) -> ok.

send_all_dir(Pid, MapRole) when is_pid(Pid) ->
    Pid ! {send_all_dir, MapRole},
    ok;
send_all_dir(_Pid, _MapRole) -> ok.

update_status(Pid, MapRole) when is_pid(Pid) ->
    Pid ! {update_status, MapRole},
    ok;
update_status(_Pid, _MapRole) -> ok.

async_apply(#role{pos =
                      #pos{map_grid_pid = MapPid, x = X, y = Y}},
            MFA)
    when is_pid(MapPid) ->
    async_apply(MapPid, {X, Y}, MFA);
async_apply(#role{}, _MFA) ->
    {false, lang:get("角色不在场景中")}.

async_apply(MapPid, XY, MFA) ->
    MapPid ! {async_apply, XY, MFA},
    ok.

-spec update_conn_pid(pid(), pid(), non_neg_integer(),
                      non_neg_integer(), pid(), pid()) -> ok.

update_conn_pid(Pid, RolePid, X, Y, ConnPid,
                NewConnPid) ->
    Pid !
        {update_conn_pid, RolePid, X, Y, ConnPid, NewConnPid},
    ok.

-spec in_9grid(pid(), non_neg_integer(),
               non_neg_integer()) -> [tuple()].

in_9grid(Pid, X, Y) ->
    case catch gen_server:call(Pid, {in_9grid, X, Y}, 10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

-spec distance(#pos{}, #pos{}) -> {ok,
                                   {integer(), integer()}} |
                                  false.

distance(#pos{map_pid = MapPid, x = X1, y = Y1},
         #pos{map_pid = MapPid, x = X2, y = Y2}) ->
    Dx = erlang:abs(util:floor(X1 / 600) -
                        util:floor(X2 / 600)),
    Dy = erlang:abs(util:floor(Y1 / 370) -
                        util:floor(Y2 / 370)),
    {ok, {Dx, Dy}};
distance(_, _) -> false.

init([MapGrid = #map_grid{width = W, height = H}]) ->
    grid(util:floor(W / 600) + 1, util:floor(H / 370) + 1),
    {ok, MapGrid}.

handle_call({in_9grid, X, Y}, _From,
            State = #map_grid{width = W, height = H}) ->
    Dx = if X =< 0 -> 0;
            X > W -> W;
            true -> X
         end,
    Dy = if Y =< 0 -> 0;
            Y > H -> H;
            true -> Y
         end,
    {reply,
     get_in_9grid(util:floor(Dx / 600),
                  util:floor(Dy / 370)),
     State};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({enter,
             MapRole = #map_role{name = _Name, conn_pid = _ConnPid,
                                 x = X, y = Y, speed = _Speed}},
            State = #map_grid{map_id = MapId, width = W,
                              height = H}) ->
    Dx = if X =< 0 -> 0;
            X > W -> W;
            true -> X
         end,
    Dy = if Y =< 0 -> 0;
            Y > H -> H;
            true -> Y
         end,
    Gx = util:floor(Dx / 600),
    Gy = util:floor(Dy / 370),
    R = MapRole#map_role{map = MapId, gx = Gx, gy = Gy},
    put({Gx, Gy}, [R | get({Gx, Gy})]),
    {ok, Bin} = proto_101:pack(srv, 10113, R),
    L1 = [get(P)
          || P
                 <- [{Gx - 1, Gy - 1},
                     {Gx - 1, Gy},
                     {Gx - 1, Gy + 1},
                     {Gx, Gy + 1},
                     {Gx + 1, Gy + 1},
                     {Gx + 1, Gy},
                     {Gx + 1, Gy - 1},
                     {Gx, Gy - 1},
                     {Gx, Gy}]],
    grid_cast(L1, Bin),
    {noreply, State};
handle_info({move,
             RolePid,
             SrcX,
             SrcY,
             DestX,
             DestY,
             Dir},
            State) ->
    Gx1 = util:floor(SrcX / 600),
    Gy1 = util:floor(SrcY / 370),
    case lists:keyfind(RolePid,
                       #map_role.pid,
                       get({Gx1, Gy1}))
        of
        false -> logger:debug("无效的移动操作", [], map_grid, 231);
        R ->
            do_move(R#map_role{x = DestX, y = DestY,
                               gx = util:floor(DestX / 600),
                               gy = util:floor(DestY / 370), dir = Dir},
                    SrcX,
                    SrcY,
                    Gx1,
                    Gy1)
    end,
    {noreply, State};
handle_info({transmit,
             BaseId,
             Mode,
             Speed,
             RolePid,
             SrcX,
             SrcY,
             DestX,
             DestY,
             DestList,
             Looks},
            State = #map_grid{base_id = BaseId}) ->
    Gx1 = util:floor(SrcX / 600),
    Gy1 = util:floor(SrcY / 370),
    case lists:keyfind(RolePid,
                       #map_role.pid,
                       get({Gx1, Gy1}))
        of
        false -> logger:debug("无效的移动操作", [], map_grid, 242);
        R ->
            do_transmit(R#map_role{x = DestX, y = DestY,
                                   gx = util:floor(DestX / 600),
                                   gy = util:floor(DestY / 370), looks = Looks},
                        Mode,
                        Speed,
                        SrcX,
                        SrcY,
                        Gx1,
                        Gy1,
                        DestList)
    end,
    {noreply, State};
handle_info({update_conn_pid,
             RolePid,
             X,
             Y,
             _ConnPid,
             NewConnPid},
            State = #map_grid{width = W, height = H}) ->
    Dx = if X =< 0 -> 0;
            X > W -> W;
            true -> X
         end,
    Dy = if Y =< 0 -> 0;
            Y > H -> H;
            true -> Y
         end,
    Gx = util:floor(Dx / 600),
    Gy = util:floor(Dy / 370),
    logger:debug("更新角色连接PID： ~w",
                 [NewConnPid],
                 map_grid,
                 254),
    case lists:keyfind(RolePid,
                       #map_role.pid,
                       get({Gx, Gy}))
        of
        false -> ignore;
        Mr ->
            put({Gx, Gy},
                lists:keyreplace(RolePid,
                                 #map_role.pid,
                                 get({Gx, Gy}),
                                 Mr#map_role{conn_pid = NewConnPid}))
    end,
    {noreply, State};
handle_info({update,
             MapRole = #map_role{pid = RolePid, x = X, y = Y,
                                 looks = Looks}},
            State = #map_grid{width = W, height = H}) ->
    Dx = if X =< 0 -> 0;
            X > W -> W;
            true -> X
         end,
    Dy = if Y =< 0 -> 0;
            Y > H -> H;
            true -> Y
         end,
    Gx = util:floor(Dx / 600),
    Gy = util:floor(Dy / 370),
    Mr = MapRole#map_role{gx = Gx, gy = Gy, looks = Looks},
    put({Gx, Gy},
        lists:keyreplace(RolePid,
                         #map_role.pid,
                         get({Gx, Gy}),
                         Mr)),
    {ok, Bin} = proto_101:pack(srv, 10117, Mr),
    L1 = [get(P)
          || P
                 <- [{Gx - 1, Gy - 1},
                     {Gx - 1, Gy},
                     {Gx - 1, Gy + 1},
                     {Gx, Gy + 1},
                     {Gx + 1, Gy + 1},
                     {Gx + 1, Gy},
                     {Gx + 1, Gy - 1},
                     {Gx, Gy - 1},
                     {Gx, Gy}]],
    grid_cast(L1, Bin),
    {noreply, State};
handle_info({async_apply, {X, Y}, MFA},
            State = #map_grid{width = W, height = H}) ->
    Dx = if X =< 0 -> 0;
            X > W -> W;
            true -> X
         end,
    Dy = if Y =< 0 -> 0;
            Y > H -> H;
            true -> Y
         end,
    Gx = util:floor(Dx / 600),
    Gy = util:floor(Dy / 370),
    Fun = fun (L1) ->
                  lists:foreach(fun (#map_role{pid = Pid}) ->
                                        catch role:apply(async, Pid, MFA)
                                end,
                                L1)
          end,
    [Fun(get(P))
     || P
            <- [{Gx - 1, Gy - 1},
                {Gx - 1, Gy},
                {Gx - 1, Gy + 1},
                {Gx, Gy + 1},
                {Gx + 1, Gy + 1},
                {Gx + 1, Gy},
                {Gx + 1, Gy - 1},
                {Gx, Gy - 1},
                {Gx, Gy}]],
    {noreply, State};
handle_info({send_all_dir,
             #map_role{conn_pid = ConnPid, x = X, y = Y}},
            State = #map_grid{width = W, height = H}) ->
    Dx = if X =< 0 -> 0;
            X > W -> W;
            true -> X
         end,
    Dy = if Y =< 0 -> 0;
            Y > H -> H;
            true -> Y
         end,
    Gx = util:floor(Dx / 600),
    Gy = util:floor(Dy / 370),
    RL = [get(P)
          || P
                 <- [{Gx - 1, Gy - 1},
                     {Gx - 1, Gy},
                     {Gx - 1, Gy + 1},
                     {Gx, Gy + 1},
                     {Gx + 1, Gy + 1},
                     {Gx + 1, Gy},
                     {Gx + 1, Gy - 1},
                     {Gx, Gy - 1},
                     {Gx, Gy}]],
    L = flatmap(RL, []),
    {ok, Bin} = proto_101:pack(srv, 10169, {L}),
    ConnPid ! {send_data, Bin},
    {noreply, State};
handle_info({update_status,
             MapRole = #map_role{pid = RolePid, x = X, y = Y,
                                 event = Event}},
            State = #map_grid{width = W, height = H}) ->
    Dx = if X =< 0 -> 0;
            X > W -> W;
            true -> X
         end,
    Dy = if Y =< 0 -> 0;
            Y > H -> H;
            true -> Y
         end,
    Gx = util:floor(Dx / 600),
    Gy = util:floor(Dy / 370),
    Mr = MapRole#map_role{gx = Gx, gy = Gy, event = Event},
    put({Gx, Gy},
        lists:keyreplace(RolePid,
                         #map_role.pid,
                         get({Gx, Gy}),
                         Mr)),
    {ok, Bin} = proto_101:pack(srv, 10123, Mr),
    L1 = [get(P)
          || P
                 <- [{Gx - 1, Gy - 1},
                     {Gx - 1, Gy},
                     {Gx - 1, Gy + 1},
                     {Gx, Gy + 1},
                     {Gx + 1, Gy + 1},
                     {Gx + 1, Gy},
                     {Gx + 1, Gy - 1},
                     {Gx, Gy - 1},
                     {Gx, Gy}]],
    grid_cast(L1, Bin),
    {noreply, State};
handle_info({leave,
             RolePid,
             X,
             Y,
             Rid,
             Platform,
             ZoneId},
            State = #map_grid{width = W, height = H}) ->
    Dx = if X =< 0 -> 0;
            X > W -> W;
            true -> X
         end,
    Dy = if Y =< 0 -> 0;
            Y > H -> H;
            true -> Y
         end,
    Gx = util:floor(Dx / 600),
    Gy = util:floor(Dy / 370),
    put({Gx, Gy},
        lists:keydelete(RolePid, #map_role.pid, get({Gx, Gy}))),
    {ok, LeaveMsg} = proto_101:pack(srv,
                                    10114,
                                    {Rid, Platform, ZoneId}),
    L1 = [get(P)
          || P
                 <- [{Gx - 1, Gy - 1},
                     {Gx - 1, Gy},
                     {Gx - 1, Gy + 1},
                     {Gx, Gy + 1},
                     {Gx + 1, Gy + 1},
                     {Gx + 1, Gy},
                     {Gx + 1, Gy - 1},
                     {Gx, Gy - 1},
                     {Gx, Gy}]],
    grid_cast(L1, LeaveMsg),
    {noreply, State};
handle_info(stop, State) -> {stop, normal, State};
handle_info(_Info,
            State = #map_grid{base_id = BaseId}) ->
    logger:error("地图九宫格[~w]接收到未知信息：~w",
                 [BaseId, _Info],
                 map_grid,
                 331),
    {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

grid(-1, Gy) -> grid_y(-1, Gy);
grid(Gx, Gy) ->
    grid_y(Gx, Gy),
    grid(Gx - 1, Gy).

grid_y(Gx, -1) -> put({Gx, -1}, []);
grid_y(Gx, Gy) ->
    put({Gx, Gy}, []),
    grid_y(Gx, Gy - 1).

grid_cast([], _Msg) -> ok;
grid_cast([H | T], Msg) ->
    do_cast(H, Msg),
    grid_cast(T, Msg).

do_cast([], _Bin) -> ok;
do_cast([#map_role{conn_pid = ConnPid} | T], Bin) ->
    ConnPid ! {send_data, Bin},
    do_cast(T, Bin).

send_role_list(ConnPid, RL) ->
    L = flatmap(RL, []),
    {ok, B} = proto_101:pack(srv, 10116, {L}),
    ConnPid ! {send_data, B}.

get_in_9grid(Gx, Gy) ->
    L = [get(P)
         || P
                <- [{Gx - 1, Gy - 1},
                    {Gx - 1, Gy},
                    {Gx - 1, Gy + 1},
                    {Gx, Gy + 1},
                    {Gx + 1, Gy + 1},
                    {Gx + 1, Gy},
                    {Gx + 1, Gy - 1},
                    {Gx, Gy - 1},
                    {Gx, Gy}]],
    flatmap(L, []).

flatmap([], List) -> List;
flatmap([H | T], List) -> flatmap(T, H ++ List).

do_move(R = #map_role{pid = Rpid, rid = Rid,
                      platform = Platform, zone_id = ZoneId, x = DestX,
                      y = DestY, dir = Dir, gx = Gx2, gy = Gy2},
        X, Y, Gx1, Gy1)
    when Gx1 =:= Gx2 andalso Gy1 =:= Gy2 ->
    put({Gx2, Gy2},
        lists:keyreplace(Rpid,
                         #map_role.pid,
                         get({Gx2, Gy2}),
                         R)),
    P10115 = {Rid,
              Platform,
              ZoneId,
              Dir,
              X,
              Y,
              DestX,
              DestY,
              Gx2,
              Gy2},
    {ok, MoveMsg} = proto_101:pack(srv, 10115, P10115),
    L1 = [get(P)
          || P
                 <- [{Gx1 - 1, Gy1 - 1},
                     {Gx1 - 1, Gy1},
                     {Gx1 - 1, Gy1 + 1},
                     {Gx1, Gy1 + 1},
                     {Gx1 + 1, Gy1 + 1},
                     {Gx1 + 1, Gy1},
                     {Gx1 + 1, Gy1 - 1},
                     {Gx1, Gy1 - 1},
                     {Gx1, Gy1}]],
    grid_cast(L1, MoveMsg);
do_move(R = #map_role{pid = Rpid, rid = Rid,
                      platform = Platform, zone_id = ZoneId, x = DestX,
                      y = DestY, dir = Dir, gx = Gx2, gy = Gy2},
        X, Y, Gx1, Gy1)
    when Gx1 =:= Gx2 andalso Gy1 > Gy2 ->
    put({Gx1, Gy1},
        lists:keydelete(Rpid, #map_role.pid, get({Gx1, Gy1}))),
    put({Gx2, Gy2}, [R | get({Gx2, Gy2})]),
    P10115 = {Rid,
              Platform,
              ZoneId,
              Dir,
              X,
              Y,
              DestX,
              DestY,
              Gx2,
              Gy2},
    {ok, MoveMsg} = proto_101:pack(srv, 10115, P10115),
    P10114 = {Rid, Platform, ZoneId},
    {ok, LeaveMsg} = proto_101:pack(srv, 10114, P10114),
    AllGrid = [{Gx1 - 1, Gy1 - 1},
               {Gx1 - 1, Gy1},
               {Gx1 - 1, Gy1 + 1},
               {Gx1, Gy1 + 1},
               {Gx1 + 1, Gy1 + 1},
               {Gx1 + 1, Gy1},
               {Gx1 + 1, Gy1 - 1},
               {Gx1, Gy1 - 1},
               {Gx1, Gy1}],
    Normal = AllGrid --
                 [{Gx1 - 1, Gy1 + 1},
                  {Gx1, Gy1 + 1},
                  {Gx1 + 1, Gy1 + 1}],
    LeaveList = [get(P)
                 || P
                        <- [{Gx1 - 1, Gy1 + 1},
                            {Gx1, Gy1 + 1},
                            {Gx1 + 1, Gy1 + 1}]],
    NormalList = [get(P) || P <- Normal],
    grid_cast(LeaveList, LeaveMsg),
    grid_cast(NormalList, MoveMsg),
    L = [get(P)
         || P
                <- [{Gx2 - 1, Gy2 - 1},
                    {Gx2, Gy2 - 1},
                    {Gx2 + 1, Gy2 - 1}]],
    {ok, Bin} = proto_101:pack(srv, 10113, R),
    grid_cast(L, Bin),
    grid_cast(L, MoveMsg),
    send_role_list(R#map_role.conn_pid, L);
do_move(R = #map_role{pid = Rpid, rid = Rid,
                      platform = Platform, zone_id = ZoneId, x = DestX,
                      y = DestY, dir = Dir, gx = Gx2, gy = Gy2},
        X, Y, Gx1, Gy1)
    when Gx1 =:= Gx2 andalso Gy1 < Gy2 ->
    put({Gx1, Gy1},
        lists:keydelete(Rpid, #map_role.pid, get({Gx1, Gy1}))),
    put({Gx2, Gy2}, [R | get({Gx2, Gy2})]),
    P10115 = {Rid,
              Platform,
              ZoneId,
              Dir,
              X,
              Y,
              DestX,
              DestY,
              Gx2,
              Gy2},
    {ok, MoveMsg} = proto_101:pack(srv, 10115, P10115),
    P10114 = {Rid, Platform, ZoneId},
    {ok, LeaveMsg} = proto_101:pack(srv, 10114, P10114),
    AllGrid = [{Gx1 - 1, Gy1 - 1},
               {Gx1 - 1, Gy1},
               {Gx1 - 1, Gy1 + 1},
               {Gx1, Gy1 + 1},
               {Gx1 + 1, Gy1 + 1},
               {Gx1 + 1, Gy1},
               {Gx1 + 1, Gy1 - 1},
               {Gx1, Gy1 - 1},
               {Gx1, Gy1}],
    Normal = AllGrid --
                 [{Gx1 - 1, Gy1 - 1},
                  {Gx1, Gy1 - 1},
                  {Gx1 + 1, Gy1 - 1}],
    LeaveList = [get(P)
                 || P
                        <- [{Gx1 - 1, Gy1 - 1},
                            {Gx1, Gy1 - 1},
                            {Gx1 + 1, Gy1 - 1}]],
    NormalList = [get(P) || P <- Normal],
    grid_cast(LeaveList, LeaveMsg),
    grid_cast(NormalList, MoveMsg),
    L = [get(P)
         || P
                <- [{Gx2 - 1, Gy2 + 1},
                    {Gx2, Gy2 + 1},
                    {Gx2 + 1, Gy2 + 1}]],
    {ok, Bin} = proto_101:pack(srv, 10113, R),
    grid_cast(L, Bin),
    grid_cast(L, MoveMsg),
    send_role_list(R#map_role.conn_pid, L);
do_move(R = #map_role{pid = Rpid, rid = Rid,
                      platform = Platform, zone_id = ZoneId, x = DestX,
                      y = DestY, dir = Dir, gx = Gx2, gy = Gy2},
        X, Y, Gx1, Gy1)
    when Gx1 > Gx2 andalso Gy1 =:= Gy2 ->
    put({Gx1, Gy1},
        lists:keydelete(Rpid, #map_role.pid, get({Gx1, Gy1}))),
    put({Gx2, Gy2}, [R | get({Gx2, Gy2})]),
    P10115 = {Rid,
              Platform,
              ZoneId,
              Dir,
              X,
              Y,
              DestX,
              DestY,
              Gx2,
              Gy2},
    {ok, MoveMsg} = proto_101:pack(srv, 10115, P10115),
    P10114 = {Rid, Platform, ZoneId},
    {ok, LeaveMsg} = proto_101:pack(srv, 10114, P10114),
    AllGrid = [{Gx1 - 1, Gy1 - 1},
               {Gx1 - 1, Gy1},
               {Gx1 - 1, Gy1 + 1},
               {Gx1, Gy1 + 1},
               {Gx1 + 1, Gy1 + 1},
               {Gx1 + 1, Gy1},
               {Gx1 + 1, Gy1 - 1},
               {Gx1, Gy1 - 1},
               {Gx1, Gy1}],
    Normal = AllGrid --
                 [{Gx1 + 1, Gy1 - 1},
                  {Gx1 + 1, Gy1},
                  {Gx1 + 1, Gy1 + 1}],
    LeaveList = [get(P)
                 || P
                        <- [{Gx1 + 1, Gy1 - 1},
                            {Gx1 + 1, Gy1},
                            {Gx1 + 1, Gy1 + 1}]],
    NormalList = [get(P) || P <- Normal],
    grid_cast(LeaveList, LeaveMsg),
    grid_cast(NormalList, MoveMsg),
    L = [get(P)
         || P
                <- [{Gx2 - 1, Gy2 - 1},
                    {Gx2 - 1, Gy2},
                    {Gx2 - 1, Gy2 + 1}]],
    {ok, Bin} = proto_101:pack(srv, 10113, R),
    grid_cast(L, Bin),
    grid_cast(L, MoveMsg),
    send_role_list(R#map_role.conn_pid, L);
do_move(R = #map_role{pid = Rpid, rid = Rid,
                      platform = Platform, zone_id = ZoneId, x = DestX,
                      y = DestY, dir = Dir, gx = Gx2, gy = Gy2},
        X, Y, Gx1, Gy1)
    when Gx1 < Gx2 andalso Gy1 =:= Gy2 ->
    put({Gx1, Gy1},
        lists:keydelete(Rpid, #map_role.pid, get({Gx1, Gy1}))),
    put({Gx2, Gy2}, [R | get({Gx2, Gy2})]),
    P10115 = {Rid,
              Platform,
              ZoneId,
              Dir,
              X,
              Y,
              DestX,
              DestY,
              Gx2,
              Gy2},
    {ok, MoveMsg} = proto_101:pack(srv, 10115, P10115),
    P10114 = {Rid, Platform, ZoneId},
    {ok, LeaveMsg} = proto_101:pack(srv, 10114, P10114),
    AllGrid = [{Gx1 - 1, Gy1 - 1},
               {Gx1 - 1, Gy1},
               {Gx1 - 1, Gy1 + 1},
               {Gx1, Gy1 + 1},
               {Gx1 + 1, Gy1 + 1},
               {Gx1 + 1, Gy1},
               {Gx1 + 1, Gy1 - 1},
               {Gx1, Gy1 - 1},
               {Gx1, Gy1}],
    Normal = AllGrid --
                 [{Gx1 - 1, Gy1 - 1},
                  {Gx1 - 1, Gy1},
                  {Gx1 - 1, Gy1 + 1}],
    LeaveList = [get(P)
                 || P
                        <- [{Gx1 - 1, Gy1 - 1},
                            {Gx1 - 1, Gy1},
                            {Gx1 - 1, Gy1 + 1}]],
    NormalList = [get(P) || P <- Normal],
    grid_cast(LeaveList, LeaveMsg),
    grid_cast(NormalList, MoveMsg),
    L = [get(P)
         || P
                <- [{Gx2 + 1, Gy2 - 1},
                    {Gx2 + 1, Gy2},
                    {Gx2 + 1, Gy2 + 1}]],
    {ok, Bin} = proto_101:pack(srv, 10113, R),
    grid_cast(L, Bin),
    grid_cast(L, MoveMsg),
    send_role_list(R#map_role.conn_pid, L);
do_move(R = #map_role{pid = Rpid, rid = Rid,
                      platform = Platform, zone_id = ZoneId, x = DestX,
                      y = DestY, dir = Dir, gx = Gx2, gy = Gy2},
        X, Y, Gx1, Gy1)
    when Gx1 > Gx2 andalso Gy1 > Gy2 ->
    put({Gx1, Gy1},
        lists:keydelete(Rpid, #map_role.pid, get({Gx1, Gy1}))),
    put({Gx2, Gy2}, [R | get({Gx2, Gy2})]),
    P10115 = {Rid,
              Platform,
              ZoneId,
              Dir,
              X,
              Y,
              DestX,
              DestY,
              Gx2,
              Gy2},
    {ok, MoveMsg} = proto_101:pack(srv, 10115, P10115),
    P10114 = {Rid, Platform, ZoneId},
    {ok, LeaveMsg} = proto_101:pack(srv, 10114, P10114),
    AllGrid = [{Gx1 - 1, Gy1 - 1},
               {Gx1 - 1, Gy1},
               {Gx1 - 1, Gy1 + 1},
               {Gx1, Gy1 + 1},
               {Gx1 + 1, Gy1 + 1},
               {Gx1 + 1, Gy1},
               {Gx1 + 1, Gy1 - 1},
               {Gx1, Gy1 - 1},
               {Gx1, Gy1}],
    Normal = AllGrid --
                 [{Gx1 + 1, Gy1 - 1},
                  {Gx1 + 1, Gy1},
                  {Gx1 + 1, Gy1 + 1},
                  {Gx1, Gy1 + 1},
                  {Gx1 - 1, Gy1 + 1}],
    LeaveList = [get(P)
                 || P
                        <- [{Gx1 + 1, Gy1 - 1},
                            {Gx1 + 1, Gy1},
                            {Gx1 + 1, Gy1 + 1},
                            {Gx1, Gy1 + 1},
                            {Gx1 - 1, Gy1 + 1}]],
    NormalList = [get(P) || P <- Normal],
    grid_cast(LeaveList, LeaveMsg),
    grid_cast(NormalList, MoveMsg),
    L = [get(P)
         || P
                <- [{Gx2 - 1, Gy2 + 1},
                    {Gx2 - 1, Gy2},
                    {Gx2 - 1, Gy2 - 1},
                    {Gx2, Gy2 - 1},
                    {Gx2 + 1, Gy2 - 1}]],
    {ok, Bin} = proto_101:pack(srv, 10113, R),
    grid_cast(L, Bin),
    grid_cast(L, MoveMsg),
    send_role_list(R#map_role.conn_pid, L);
do_move(R = #map_role{pid = Rpid, rid = Rid,
                      platform = Platform, zone_id = ZoneId, x = DestX,
                      y = DestY, dir = Dir, gx = Gx2, gy = Gy2},
        X, Y, Gx1, Gy1)
    when Gx1 > Gx2 andalso Gy1 < Gy2 ->
    put({Gx1, Gy1},
        lists:keydelete(Rpid, #map_role.pid, get({Gx1, Gy1}))),
    put({Gx2, Gy2}, [R | get({Gx2, Gy2})]),
    P10115 = {Rid,
              Platform,
              ZoneId,
              Dir,
              X,
              Y,
              DestX,
              DestY,
              Gx2,
              Gy2},
    {ok, MoveMsg} = proto_101:pack(srv, 10115, P10115),
    P10114 = {Rid, Platform, ZoneId},
    {ok, LeaveMsg} = proto_101:pack(srv, 10114, P10114),
    AllGrid = [{Gx1 - 1, Gy1 - 1},
               {Gx1 - 1, Gy1},
               {Gx1 - 1, Gy1 + 1},
               {Gx1, Gy1 + 1},
               {Gx1 + 1, Gy1 + 1},
               {Gx1 + 1, Gy1},
               {Gx1 + 1, Gy1 - 1},
               {Gx1, Gy1 - 1},
               {Gx1, Gy1}],
    Normal = AllGrid --
                 [{Gx1 - 1, Gy1 - 1},
                  {Gx1, Gy1 - 1},
                  {Gx1 + 1, Gy1 - 1},
                  {Gx1 + 1, Gy1},
                  {Gx1 + 1, Gy1 + 1}],
    LeaveList = [get(P)
                 || P
                        <- [{Gx1 - 1, Gy1 - 1},
                            {Gx1, Gy1 - 1},
                            {Gx1 + 1, Gy1 - 1},
                            {Gx1 + 1, Gy1},
                            {Gx1 + 1, Gy1 + 1}]],
    NormalList = [get(P) || P <- Normal],
    grid_cast(LeaveList, LeaveMsg),
    grid_cast(NormalList, MoveMsg),
    L = [get(P)
         || P
                <- [{Gx2 - 1, Gy2 - 1},
                    {Gx2 - 1, Gy2},
                    {Gx2 - 1, Gy2 + 1},
                    {Gx2, Gy2 + 1},
                    {Gx2 + 1, Gy2 + 1}]],
    {ok, Bin} = proto_101:pack(srv, 10113, R),
    grid_cast(L, Bin),
    grid_cast(L, MoveMsg),
    send_role_list(R#map_role.conn_pid, L);
do_move(R = #map_role{pid = Rpid, rid = Rid,
                      platform = Platform, zone_id = ZoneId, x = DestX,
                      y = DestY, dir = Dir, gx = Gx2, gy = Gy2},
        X, Y, Gx1, Gy1)
    when Gx1 < Gx2 andalso Gy1 > Gy2 ->
    put({Gx1, Gy1},
        lists:keydelete(Rpid, #map_role.pid, get({Gx1, Gy1}))),
    put({Gx2, Gy2}, [R | get({Gx2, Gy2})]),
    P10115 = {Rid,
              Platform,
              ZoneId,
              Dir,
              X,
              Y,
              DestX,
              DestY,
              Gx2,
              Gy2},
    {ok, MoveMsg} = proto_101:pack(srv, 10115, P10115),
    P10114 = {Rid, Platform, ZoneId},
    {ok, LeaveMsg} = proto_101:pack(srv, 10114, P10114),
    AllGrid = [{Gx1 - 1, Gy1 - 1},
               {Gx1 - 1, Gy1},
               {Gx1 - 1, Gy1 + 1},
               {Gx1, Gy1 + 1},
               {Gx1 + 1, Gy1 + 1},
               {Gx1 + 1, Gy1},
               {Gx1 + 1, Gy1 - 1},
               {Gx1, Gy1 - 1},
               {Gx1, Gy1}],
    Normal = AllGrid --
                 [{Gx1 - 1, Gy1 - 1},
                  {Gx1 - 1, Gy1},
                  {Gx1 - 1, Gy1 + 1},
                  {Gx1, Gy1 + 1},
                  {Gx1 + 1, Gy1 + 1}],
    LeaveList = [get(P)
                 || P
                        <- [{Gx1 - 1, Gy1 - 1},
                            {Gx1 - 1, Gy1},
                            {Gx1 - 1, Gy1 + 1},
                            {Gx1, Gy1 + 1},
                            {Gx1 + 1, Gy1 + 1}]],
    NormalList = [get(P) || P <- Normal],
    grid_cast(LeaveList, LeaveMsg),
    grid_cast(NormalList, MoveMsg),
    L = [get(P)
         || P
                <- [{Gx2 - 1, Gy2 - 1},
                    {Gx2, Gy2 - 1},
                    {Gx2 + 1, Gy2 - 1},
                    {Gx2 + 1, Gy2},
                    {Gx2 + 1, Gy2 + 1}]],
    {ok, Bin} = proto_101:pack(srv, 10113, R),
    grid_cast(L, Bin),
    grid_cast(L, MoveMsg),
    send_role_list(R#map_role.conn_pid, L);
do_move(R = #map_role{pid = Rpid, rid = Rid,
                      platform = Platform, zone_id = ZoneId, x = DestX,
                      y = DestY, dir = Dir, gx = Gx2, gy = Gy2},
        X, Y, Gx1, Gy1)
    when Gx1 < Gx2 andalso Gy1 < Gy2 ->
    put({Gx1, Gy1},
        lists:keydelete(Rpid, #map_role.pid, get({Gx1, Gy1}))),
    put({Gx2, Gy2}, [R | get({Gx2, Gy2})]),
    P10115 = {Rid,
              Platform,
              ZoneId,
              Dir,
              X,
              Y,
              DestX,
              DestY,
              Gx2,
              Gy2},
    {ok, MoveMsg} = proto_101:pack(srv, 10115, P10115),
    P10114 = {Rid, Platform, ZoneId},
    {ok, LeaveMsg} = proto_101:pack(srv, 10114, P10114),
    AllGrid = [{Gx1 - 1, Gy1 - 1},
               {Gx1 - 1, Gy1},
               {Gx1 - 1, Gy1 + 1},
               {Gx1, Gy1 + 1},
               {Gx1 + 1, Gy1 + 1},
               {Gx1 + 1, Gy1},
               {Gx1 + 1, Gy1 - 1},
               {Gx1, Gy1 - 1},
               {Gx1, Gy1}],
    Normal = AllGrid --
                 [{Gx1 - 1, Gy1 + 1},
                  {Gx1 - 1, Gy1},
                  {Gx1 - 1, Gy1 - 1},
                  {Gx1, Gy1 - 1},
                  {Gx1 + 1, Gy1 - 1}],
    LeaveList = [get(P)
                 || P
                        <- [{Gx1 - 1, Gy1 + 1},
                            {Gx1 - 1, Gy1},
                            {Gx1 - 1, Gy1 - 1},
                            {Gx1, Gy1 - 1},
                            {Gx1 + 1, Gy1 - 1}]],
    NormalList = [get(P) || P <- Normal],
    grid_cast(LeaveList, LeaveMsg),
    grid_cast(NormalList, MoveMsg),
    L = [get(P)
         || P
                <- [{Gx2 + 1, Gy2 - 1},
                    {Gx2 + 1, Gy2},
                    {Gx2 + 1, Gy2 + 1},
                    {Gx2, Gy2 + 1},
                    {Gx2 - 1, Gy2 + 1}]],
    {ok, Bin} = proto_101:pack(srv, 10113, R),
    grid_cast(L, Bin),
    grid_cast(L, MoveMsg),
    send_role_list(R#map_role.conn_pid, L);
do_move(_R, _X, _Y, _Gx1, _Gy1) ->
    logger:debug("角色移动时的数据异常", [], map_grid, 529),
    ignore.

do_transmit(R = #map_role{pid = Rpid, rid = Rid,
                          platform = Platform, zone_id = ZoneId, dir = Dir,
                          gx = Gx2, gy = Gy2},
            Mode, Speed, X, Y, Gx1, Gy1, DestList)
    when Gx1 =:= Gx2 andalso Gy1 =:= Gy2 ->
    put({Gx2, Gy2},
        lists:keyreplace(Rpid,
                         #map_role.pid,
                         get({Gx2, Gy2}),
                         R)),
    P10118 = {Rid,
              Platform,
              ZoneId,
              Mode,
              Speed,
              Dir,
              X,
              Y,
              DestList,
              Gx2,
              Gy2},
    {ok, MoveMsg} = proto_101:pack(srv, 10118, P10118),
    L1 = [get(P)
          || P
                 <- [{Gx1 - 1, Gy1 - 1},
                     {Gx1 - 1, Gy1},
                     {Gx1 - 1, Gy1 + 1},
                     {Gx1, Gy1 + 1},
                     {Gx1 + 1, Gy1 + 1},
                     {Gx1 + 1, Gy1},
                     {Gx1 + 1, Gy1 - 1},
                     {Gx1, Gy1 - 1},
                     {Gx1, Gy1}]],
    grid_cast(L1, MoveMsg);
do_transmit(R = #map_role{pid = Rpid, rid = Rid,
                          platform = Platform, zone_id = ZoneId, dir = Dir,
                          gx = Gx2, gy = Gy2},
            Mode, Speed, X, Y, Gx1, Gy1, DestList) ->
    put({Gx1, Gy1},
        lists:keydelete(Rpid, #map_role.pid, get({Gx1, Gy1}))),
    put({Gx2, Gy2}, [R | get({Gx2, Gy2})]),
    P10118 = {Rid,
              Platform,
              ZoneId,
              Mode,
              Speed,
              Dir,
              X,
              Y,
              DestList,
              Gx2,
              Gy2},
    {ok, MoveMsg} = proto_101:pack(srv, 10118, P10118),
    P10114 = {Rid, Platform, ZoneId},
    {ok, LeaveMsg} = proto_101:pack(srv, 10114, P10114),
    AllGrid = [{Gx1 - 1, Gy1 - 1},
               {Gx1 - 1, Gy1},
               {Gx1 - 1, Gy1 + 1},
               {Gx1, Gy1 + 1},
               {Gx1 + 1, Gy1 + 1},
               {Gx1 + 1, Gy1},
               {Gx1 + 1, Gy1 - 1},
               {Gx1, Gy1 - 1},
               {Gx1, Gy1}],
    Normal = AllGrid --
                 [{Gx1 - 1, Gy1},
                  {Gx1 - 1, Gy1 - 1},
                  {Gx1 - 1, Gy1 + 1},
                  {Gx1, Gy1},
                  {Gx1, Gy1 - 1},
                  {Gx1, Gy1 + 1},
                  {Gx1 + 1, Gy1},
                  {Gx1 + 1, Gy1 - 1},
                  {Gx1 + 1, Gy1 + 1}],
    LeaveList = [get(P)
                 || P
                        <- [{Gx1 - 1, Gy1},
                            {Gx1 - 1, Gy1 - 1},
                            {Gx1 - 1, Gy1 + 1},
                            {Gx1, Gy1},
                            {Gx1, Gy1 - 1},
                            {Gx1, Gy1 + 1},
                            {Gx1 + 1, Gy1},
                            {Gx1 + 1, Gy1 - 1},
                            {Gx1 + 1, Gy1 + 1}]],
    NormalList = [get(P) || P <- Normal],
    grid_cast(LeaveList, LeaveMsg),
    grid_cast(NormalList, MoveMsg),
    L = [get(P)
         || P
                <- [{Gx2 - 1, Gy2},
                    {Gx2 - 1, Gy2 - 1},
                    {Gx2 - 1, Gy2 + 1},
                    {Gx2, Gy2},
                    {Gx2, Gy2 - 1},
                    {Gx2, Gy2 + 1},
                    {Gx2 + 1, Gy2},
                    {Gx2 + 1, Gy2 - 1},
                    {Gx2 + 1, Gy2 + 1}]],
    {ok, Bin} = proto_101:pack(srv, 10113, R),
    grid_cast(L, Bin),
    grid_cast(L, MoveMsg),
    send_role_list(R#map_role.conn_pid, L);
do_transmit(_R, _Mode, _Speed, _X, _Y, _Gx1, _Gy1, _) ->
    logger:debug("角色传送时的数据异常", [], map_grid, 568),
    ignore.

