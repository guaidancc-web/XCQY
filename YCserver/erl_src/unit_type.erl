-file("src/mod/unit/unit_type.erl", 1).

-module(unit_type).

-export([order/3,
         search_trace/1,
         search_attack/1,
         rand_path/1,
         loaf_path/1,
         rand_path_in_range/3,
         calc_max_range/3]).

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

-file("src/mod/unit/unit_type.erl", 18).

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

-file("src/mod/unit/unit_type.erl", 19).

-file("inc/unit.hrl", 1).

-record(unit_order,
        {order :: undefined | move | guard | attack | atom(),
         type = 0 :: 0..2,
         arg :: undefined | tuple() | [tuple()],
         data :: undefined | term(),
         condition = [] :: list(),
         over :: undefined | defense | stop | atom()}).

-record(unit_data,
        {id = 0 :: pos_integer(),
         type = 1 :: non_neg_integer(),
         fun_type = 1 :: non_neg_integer(),
         desc = "",
         classes = 0,
         sex = 0,
         lev = 1,
         name = "" :: list(),
         activity = 0 :: 0..1,
         guide_lev = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         nature = 0 :: non_neg_integer(),
         disabled = "" :: bitstring(),
         condition = [] :: [tuple()],
         speed = 120 :: pos_integer(),
         lock = 0 :: 0 | 1,
         t_move = 3 :: pos_integer(),
         t_atk = 3 :: pos_integer(),
         range_trace = 200 :: pos_integer(),
         range_atk = 100 :: pos_integer(),
         gain = [] :: list(),
         formation = 1,
         formation_lev = 1,
         slave = [] :: list(),
         talk = [] :: list(),
         looks = [] :: list(),
         data = [] :: list(),
         def_status = defense :: defense | patrol | loaf}).

-record(unit,
        {id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 0 :: non_neg_integer(),
         type = 1 :: non_neg_integer(),
         fun_type = 1,
         name = "" :: list(),
         pid = 0 :: non_neg_integer() | pid(),
         lev = 1,
         classes = 0,
         sex = 0,
         activity = 0 :: 0..1,
         dun_info :: undefined | {pid(), pos_integer()},
         combat_pid = 0 :: non_neg_integer() | pid(),
         status = 0 :: non_neg_integer(),
         guide_lev = 0 :: non_neg_integer(),
         nature = 0 :: non_neg_integer(),
         disabled = "" :: list(),
         condition = [] :: [tuple()],
         speed = 180 :: pos_integer(),
         lock = 0 :: 0 | 1,
         range_trace = 200 :: pos_integer(),
         range_atk = 100 :: pos_integer(),
         defxy = {0, 0, 0} :: tuple(),
         def_status = defense :: defense | patrol | loaf,
         talk = [] :: list(),
         pos :: undefined | tuple(),
         data :: undefined | term(),
         looks = [] :: [tuple()],
         evt = [] :: [atom()],
         formation = 1,
         formation_lev = 1,
         slave = [] :: list(),
         prop = [] :: [{non_neg_integer(), string()}],
         order = [] :: list(),
         path = [] :: list(),
         ts = {1, 1, 1} ::
             {pos_integer(), pos_integer(), pos_integer()},
         t_move = 3 :: pos_integer(),
         t_atk = 3 :: pos_integer(),
         ai_id = 0,
         ai = {[], []} :: {list(), list()},
         attr,
         role_id = {0, "", 0}}).

-record(map_unit,
        {id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 0 :: non_neg_integer(),
         type = 1 :: pos_integer(),
         activity = 0 :: 0..1,
         status = 0 :: non_neg_integer(),
         classes = 0,
         sex = 0,
         guide_lev = 0 :: non_neg_integer(),
         name = "" :: list(),
         speed = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         gx = 0 :: non_neg_integer(),
         gy = 0 :: non_neg_integer(),
         looks = [] :: [tuple()],
         prop = [] :: [tuple()]}).

-record(plot_unit,
        {id = 0 :: pos_integer(),
         name = "" :: bitstring(),
         base_id = 0 :: non_neg_integer(),
         type = 1,
         fun_type = 1,
         dun_id = 0 :: non_neg_integer(),
         map = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         dir = 0 :: non_neg_integer(),
         act_type = "" :: bitstring(),
         looks = [] :: [tuple()],
         status = 0 :: non_neg_integer(),
         quest_id = 0 :: non_neg_integer(),
         quest_prog_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer()}).

-record(unit_statue,
        {type = 0,
         id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         looks = []}).

-file("src/mod/unit/unit_type.erl", 20).

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

-file("src/mod/unit/unit_type.erl", 21).

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

-file("src/mod/unit/unit_type.erl", 22).

-spec order(Order, StateName, Unit) -> {ok,
                                        atom(),
                                        #unit{}} |
                                       error when Order :: #unit_order{},
                                                  StateName :: atom(),
                                                  Unit :: #unit{}.

order(Order = #unit_order{order = patrol,
                          arg = {MapBaseId, X, Y}},
      _StateName,
      Unit = #unit{id = _UnitId,
                   pos = #pos{map_pid = MapPid}}) ->
    Path = unit_type:rand_path({MapBaseId, X, Y}),
    map:unit_move(MapPid, Unit, X, Y),
    logger:debug("单位[~w]收到巡逻指令，获得路径:~w",
                 [Unit#unit.base_id, Path],
                 unit_type,
                 35),
    {ok,
     Order,
     patrol,
     Unit#unit{defxy = {MapBaseId, X, Y}, path = Path,
               ts = now()}};
order(Order = #unit_order{order = loaf}, _StateName,
      Unit = #unit{id = _UnitId,
                   pos =
                       #pos{map_base_id = MapBaseId, x = X, y = Y,
                            map_pid = MapPid}}) ->
    Path = unit_type:rand_path({MapBaseId, X, Y}),
    map:unit_move(MapPid, Unit, X, Y),
    logger:debug("单位[~w]收到游荡指令，获得路径:~w",
                 [Unit#unit.base_id, Path],
                 unit_type,
                 42),
    {ok, Order, loaf, Unit#unit{path = Path, ts = now()}};
order(Order = #unit_order{order = move,
                          arg = {MapBaseId, Tx, Ty}},
      _StateName,
      Unit = #unit{id = _UnitId,
                   pos =
                       Pos = #pos{map_pid = MapPid, map_base_id = MapBaseId,
                                  x = X, y = Y, map = MapId},
                   speed = Speed, t_move = Tmove}) ->
    case path(Speed * Tmove div 1000,
              MapId,
              MapBaseId,
              {X, Y},
              {Tx, Ty})
        of
        [] ->
            logger:error("操作单位移动的目标地点不可达到:~w ~w",
                         [Tx, Ty],
                         unit_type,
                         50),
            error;
        _P = [{Nx, Ny} | Path] ->
            map:unit_move(MapPid, Unit, Nx, Ny),
            NewUnit = Unit#unit{pos = Pos#pos{x = Nx, y = Ny},
                                path = Path, ts = now()},
            {ok, Order, move, NewUnit}
    end;
order(Order = #unit_order{order = direct_move,
                          arg = {Tx, Ty}},
      _StateName,
      Unit = #unit{id = _UnitId,
                   pos = Pos = #pos{map_pid = MapPid}}) ->
    map:unit_move(MapPid, Unit, Tx, Ty),
    NewUnit = Unit#unit{pos = Pos#pos{x = Tx, y = Ty},
                        ts = now()},
    {ok, Order, move, NewUnit};
order(Order = #unit_order{order = move,
                          arg = {MapBaseId, Tx, Ty, Speed, Tmove}},
      _StateName,
      Unit = #unit{id = _UnitId,
                   pos =
                       Pos = #pos{map = MapId, map_pid = MapPid,
                                  map_base_id = MapBaseId, x = X, y = Y}}) ->
    case path(Speed * Tmove,
              MapId,
              MapBaseId,
              {X, Y},
              {Tx, Ty})
        of
        [] ->
            logger:error("操作单位移动的目标地点不可达到:~w ~w",
                         [Tx, Ty],
                         unit_type,
                         68),
            error;
        [{Nx, Ny} | Path] ->
            logger:debug("单位[~w]收到移动指令[~w, ~w]，获得实际路径点:~w",
                         [Unit#unit.base_id, Speed, Tmove, [{Nx, Ny} | Path]],
                         unit_type,
                         71),
            map:unit_move(MapPid, Unit, Nx, Ny),
            NewUnit = Unit#unit{pos = Pos#pos{x = Nx, y = Ny},
                                speed = Speed, t_move = Tmove, path = Path,
                                ts = now()},
            {ok, Order#unit_order{data = Path}, move, NewUnit}
    end;
order(Order = #unit_order{order = move,
                          arg = [{Nx, Ny} | Path]},
      _StateName,
      Unit = #unit{id = _UnitId,
                   pos = Pos = #pos{map_pid = MapPid}}) ->
    map:unit_move(MapPid, Unit, Nx, Ny),
    NewUnit = Unit#unit{pos = Pos#pos{x = Nx, y = Ny},
                        path = Path, ts = now()},
    {ok, Order, move, NewUnit};
order(Order = #unit_order{order = guard,
                          arg = {unit, TargetId}},
      _StateName,
      Unit = #unit{id = _UnitId,
                   pos = Pos = #pos{map = MapId, map_pid = MapPid}}) ->
    case unit_mgr:info(TargetId) of
        {error, _} -> error;
        {ok,
         #unit{pos =
                   #pos{map = Map, map_base_id = MapBaseId, x = Tx,
                        y = Ty}}}
            when Map =:= MapId ->
            Path = unit_type:rand_path({MapBaseId, Tx, Ty}),
            map:unit_move(MapPid, Unit, Tx, Ty),
            NewUnit = Unit#unit{pos = Pos#pos{x = Tx, y = Ty},
                                path = Path, ts = now()},
            logger:debug("单位接收守卫指令，移动至~w，路径:~w",
                         [{Tx, Ty}, Path],
                         unit_type,
                         90),
            {ok, Order#unit_order{data = Path}, guard, NewUnit};
        _ ->
            logger:error("单位[~s]收到守卫指令，无法再当前地图找到守卫目标[~w]",
                         [Unit#unit.name, TargetId],
                         unit_type,
                         93),
            error
    end;
order(Order = #unit_order{order = guard,
                          arg = {unit, TargetId, Tmove}},
      _StateName,
      Unit = #unit{id = _UnitId,
                   pos = Pos = #pos{map = MapId, map_pid = MapPid}}) ->
    case unit_mgr:info(TargetId) of
        {error, _} -> error;
        {ok,
         #unit{pos =
                   #pos{map = Map, map_base_id = MapBaseId, x = Tx,
                        y = Ty}}}
            when Map =:= MapId ->
            Path = unit_type:rand_path({MapBaseId, Tx, Ty}),
            map:unit_move(MapPid, Unit, Tx, Ty),
            NewUnit = Unit#unit{pos = Pos#pos{x = Tx, y = Ty},
                                path = Path, t_move = Tmove, ts = now()},
            logger:debug("单位接收守卫指令，移动至~w，路径:~w",
                         [{Tx, Ty}, Path],
                         unit_type,
                         103),
            {ok, Order#unit_order{data = Path}, guard, NewUnit};
        _ ->
            logger:error("单位[~s]收到守卫指令，无法再当前地图找到守卫目标[~w]",
                         [Unit#unit.name, TargetId],
                         unit_type,
                         106),
            error
    end;
order(Order = #unit_order{order = guard,
                          arg = {role, {Rid, Plat, Zone}}},
      _StateName,
      Unit = #unit{id = _UnitId,
                   pos = Pos = #pos{map = MapId, map_pid = MapPid}}) ->
    case role_query:attr(by_id,
                         Rid,
                         Plat,
                         Zone,
                         [#role.pos])
        of
        {error, _} -> error;
        {ok,
         [#pos{map = Map, map_base_id = MapBaseId, x = Tx,
               y = Ty}]}
            when Map =:= MapId ->
            Path = unit_type:rand_path({MapBaseId, Tx, Ty}),
            map:unit_move(MapPid, Unit, Tx, Ty),
            NewUnit = Unit#unit{pos = Pos#pos{x = Tx, y = Ty},
                                path = Path, ts = now()},
            logger:debug("单位接收守卫指令，移动至~w，路径:~w",
                         [{Tx, Ty}, Path],
                         unit_type,
                         116),
            {ok, Order#unit_order{data = Path}, guard, NewUnit};
        _ ->
            logger:error("单位[~s]收到守卫指令，无法再当前地图找到守卫目标[~w]",
                         [Unit#unit.name, {Rid, Plat, Zone}],
                         unit_type,
                         119),
            error
    end;
order(Order = #unit_order{order = attack,
                          arg = {MapId, Tx, Ty}},
      _,
      Unit = #unit{id = _UnitId,
                   pos =
                       Pos = #pos{map = MapId, map_base_id = MapBaseId,
                                  map_pid = MapPid, x = X, y = Y},
                   speed = Speed, t_move = Tmove}) ->
    case path(Speed * Tmove div 1000,
              MapId,
              MapBaseId,
              {X, Y},
              {Tx, Ty})
        of
        [] ->
            logger:error("操作单位攻击的目标地点不可达到:~w",
                         [Tx, Ty],
                         unit_type,
                         127),
            error;
        [{Nx, Ny} | Path] ->
            map:unit_move(MapPid, Unit, Nx, Ny),
            NewUnit = Unit#unit{pos = Pos#pos{x = Nx, y = Ny},
                                path = Path, ts = now()},
            {ok, Order#unit_order{data = Path}, attack, NewUnit}
    end;
order(Order = #unit_order{order = attack,
                          arg = {MapId, Tx, Ty, Speed, Tmove}},
      _,
      Unit = #unit{id = _UnitId,
                   pos =
                       Pos = #pos{map = MapId, map_base_id = MapBaseId,
                                  map_pid = MapPid, x = X, y = Y}}) ->
    case path(Speed * Tmove div 1000,
              MapId,
              MapBaseId,
              {X, Y},
              {Tx, Ty})
        of
        [] ->
            logger:error("操作单位攻击的目标地点不可达到:~w",
                         [Tx, Ty],
                         unit_type,
                         137),
            error;
        [{Nx, Ny} | Path] ->
            map:unit_move(MapPid, Unit, Nx, Ny),
            NewUnit = Unit#unit{pos = Pos#pos{x = Nx, y = Ny},
                                speed = Speed, t_move = Tmove, path = Path,
                                ts = now()},
            {ok, Order#unit_order{data = Path}, attack, NewUnit}
    end;
order(_Order, _, _) ->
    logger:error("错误的指令：~w", [_Order], unit_type, 146),
    error.

-spec search_trace(#unit{}) -> false |
                               {ok, #map_role{}}.

search_trace(Unit = #unit{nature = 1, disabled = ""}) ->
    case do_search_all(Unit) of
        [] -> false;
        L ->
            MapRole = util:rand_list(L),
            case check_trace(Unit, MapRole) of
                false -> false;
                true -> {ok, MapRole}
            end
    end;
search_trace(_Unit) -> false.

-spec search_attack(#unit{}) -> false |
                                {ok, #map_role{}}.

search_attack(Unit = #unit{nature = 1,
                           disabled = ""}) ->
    case do_search_all(Unit) of
        [] -> false;
        L ->
            MapRole = util:rand_list(L),
            case check_attack(Unit, MapRole) of
                false -> false;
                true -> {ok, MapRole}
            end
    end;
search_attack(_) -> false.

-spec rand_path(tuple() | #unit{}) -> list().

rand_path({_, X, Y}) -> rand_path(20, {X, Y}, 100, []);
rand_path(#unit{defxy = {_, X, Y}}) ->
    rand_path(20, {X, Y}, 100, []).

-spec rand_path_in_range(BaseId :: pos_integer(),
                         non_neg_integer(), non_neg_integer()) -> list().

rand_path_in_range(BaseId, X, Y) ->
    case get(rand_path_in_range) of
        {MinX, MaxX, MinY, MaxY}
            when MinX =/= MaxX orelse MinY =/= MaxY ->
            do_rand_path_in_range(20, MinX, MaxX, MinY, MaxY, []);
        undefined ->
            put(rand_path_in_range, calc_max_range(BaseId, X, Y)),
            rand_path_in_range(BaseId, X, Y);
        _ -> []
    end.

do_rand_path_in_range(0, _MinX, _MaxX, _MinY, _MaxY,
                      L) ->
    L;
do_rand_path_in_range(N, MinX, MaxX, MinY, MaxY, L) ->
    do_rand_path_in_range(N - 1,
                          MinX,
                          MaxX,
                          MinY,
                          MaxY,
                          [{util:rand(MinX, MaxX), util:rand(MinY, MaxY)} | L]).

-spec calc_max_range(pos_integer(), non_neg_integer(),
                     non_neg_integer()) -> {MinX,
                                            MaxX,
                                            MinY,
                                            MaxY} when MinX ::
                                                           non_neg_integer(),
                                                       MaxX ::
                                                           non_neg_integer(),
                                                       MinY ::
                                                           non_neg_integer(),
                                                       MaxY ::
                                                           non_neg_integer().

calc_max_range(BaseId, X, Y) ->
    {ok, #map_data{grid_x = GridX, grid_y = GridY}} =
        map_data:get(BaseId),
    GX = X div GridX,
    GY = Y div GridY,
    N = 120,
    Nx = util:ceil(N / GridX),
    Ny = util:ceil(N / GridY),
    WalkL = [{X1, Y1}
             || {X1, Y1} <- map_data_walkable:get(BaseId),
                abs(X1 - GX) =< Nx, abs(Y1 - GY) =< Ny],
    Num = length(WalkL),
    if Num >= (Nx * 2 + 1) * (Ny * 2 + 1) ->
           {(GX - Nx) * GridX + GridX div 2,
            (GX + Nx) * GridX + GridX div 2,
            (GY - Ny) * GridY + GridY div 2,
            (GY + Ny) * GridY + GridY div 2};
       Num =< 1 -> {X, X, Y, Y};
       true ->
           case do_calc_point(GX - Nx,
                              GY - Ny,
                              GX + Nx,
                              GY + Ny,
                              GridX,
                              GridY,
                              WalkL)
               of
               {MinX, MinY, MaxX, MaxY} ->
                   {MinX * GridX + GridX div 2,
                    MaxX * GridX + GridX div 2,
                    MinY * GridY + GridY div 2,
                    MaxY * GridY + GridY div 2};
               _ -> {X, X, Y, Y}
           end
    end.

do_calc_point(Gx, Gx, Gy, Gy, _GridX, _GridY, _WalkL) ->
    false;
do_calc_point(Sx, Sy, Tx, Ty, GridX, GridY, WalkL) ->
    N1 = lists:sum([GridX
                    || X <- lists:seq(Sx, Tx), Sy =/= Ty,
                       lists:member({X, Sy}, WalkL) =:= false]),
    N2 = lists:sum([GridY
                    || Y <- lists:seq(Sy, Ty), Sx =/= Tx,
                       lists:member({Sx, Y}, WalkL) =:= false]),
    N3 = lists:sum([GridX
                    || X <- lists:seq(Sx, Tx), Sy =/= Ty,
                       lists:member({X, Ty}, WalkL) =:= false]),
    N4 = lists:sum([GridY
                    || Y <- lists:seq(Sy, Ty), Sx =/= Tx,
                       lists:member({Tx, Y}, WalkL) =:= false]),
    case lists:max([N1, N2, N3, N4]) of
        0 -> {Sx, Sy, Tx, Ty};
        N1 ->
            do_calc_point(Sx, Sy + 1, Tx, Ty, GridX, GridY, WalkL);
        N2 ->
            do_calc_point(Sx + 1, Sy, Tx, Ty, GridX, GridY, WalkL);
        N3 ->
            do_calc_point(Sx, Sy, Tx, Ty - 1, GridX, GridY, WalkL);
        _ ->
            do_calc_point(Sx, Sy, Tx - 1, Ty, GridX, GridY, WalkL)
    end.

-spec loaf_path(tuple() | #unit{}) -> list().

loaf_path({MapId, MapBaseId, X, Y}) ->
    {TileWidth, TileHeight} =
        map_mgr:get_map_tile(MapBaseId),
    {Width, Height} = map_mgr:get_map_size(MapBaseId),
    loaf_path(30,
              MapId,
              MapBaseId,
              {X, Y},
              150,
              [],
              {TileWidth, TileHeight},
              {Width, Height});
loaf_path(#unit{pos =
                    #pos{map = MapId, map_base_id = MapBaseId, x = X,
                         y = Y}}) ->
    {TileWidth, TileHeight} =
        map_mgr:get_map_tile(MapBaseId),
    {Width, Height} = map_mgr:get_map_size(MapBaseId),
    loaf_path(30,
              MapId,
              MapBaseId,
              {X, Y},
              150,
              [],
              {TileWidth, TileHeight},
              {Width, Height}).

do_search_all(#unit{type = Type,
                    pos =
                        #pos{map_grid_pid = MapGridPid, map_base_id = BaseId,
                             x = X, y = Y}})
    when is_pid(MapGridPid) ->
    Mod = map_data:get_mod(BaseId),
    case Mod:in_9grid(MapGridPid, X, Y) of
        L when is_list(L) -> do_search_all(Type, L, []);
        _ -> []
    end;
do_search_all(#unit{id = _UnitId, base_id = _BaseId,
                    pos = _Pos}) ->
    logger:error("单位[~w, ~w]搜索附近玩家异常[~w]",
                 [_UnitId, _BaseId, _Pos],
                 unit_type,
                 271),
    [].

do_search_all(_Type, [], BackL) -> BackL;
do_search_all(_, [MapRole = #map_role{status = 0} | _],
              BackL) ->
    [MapRole | BackL];
do_search_all(Type, [_Mr | T], BackL) ->
    do_search_all(Type, T, BackL).

check_trace(_U, #map_role{status = Status})
    when Status =/= 0 ->
    false;
check_trace(#unit{range_trace = RangeTrace,
                  pos = #pos{x = X, y = Y}},
            #map_role{x = Tx, y = Ty}) ->
    distance({X, Y}, {Tx, Ty}) < RangeTrace;
check_trace(_, _) -> false.

check_attack(_U, #map_role{status = Status})
    when Status =/= 0 ->
    false;
check_attack(#unit{range_atk = RangeAtk,
                   pos = #pos{x = X, y = Y}},
             #map_role{x = Tx, y = Ty}) ->
    distance({X, Y}, {Tx, Ty}) < RangeAtk;
check_attack(_, _) -> false.

rand_path(0, _, _D, RandList) -> RandList;
rand_path(N, {DefX, DefY}, D, RandList) ->
    Nx = util:rand(DefX - D, DefX + D),
    Ny = util:rand(DefY - D, DefY + D),
    rand_path(N - 1,
              {DefX, DefY},
              D,
              [{Nx, Ny} | RandList]).

loaf_path(0, _, _, _, _D, RandList, {_, _}, {_, _}) ->
    lists:reverse(RandList);
loaf_path(N, MapId, MapBaseId, {DefX, DefY}, D,
          RandList, {TileWidth, TileHeight}, {Width, Height}) ->
    NewDefX1 = util:check_range(DefX - util:rand(80, D),
                                1,
                                Width),
    NewDefX2 = util:check_range(DefX + util:rand(80, D),
                                1,
                                Width),
    NewDefY1 = util:check_range(DefY - util:rand(80, D),
                                1,
                                Height),
    NewDefY2 = util:check_range(DefY + util:rand(80, D),
                                1,
                                Height),
    Nx = util:rand(NewDefX1, NewDefX2),
    Ny = util:rand(NewDefY1, NewDefY2),
    Fx = Nx div TileWidth,
    Fy = Ny div TileHeight,
    case map_mgr:is_blocked(MapId, MapBaseId, Fx, Fy) of
        true ->
            loaf_path(N - 1,
                      MapId,
                      MapBaseId,
                      {DefX, DefY},
                      D,
                      RandList,
                      {TileWidth, TileHeight},
                      {Width, Height});
        false ->
            loaf_path(N - 1,
                      MapId,
                      MapBaseId,
                      {Nx, Ny},
                      D,
                      [{Nx, Ny} | RandList],
                      {TileWidth, TileHeight},
                      {Width, Height})
    end.

distance({Fx, Fy}, {Fx, Fy}) -> 0;
distance({Fx, Fy}, {Fx, Ty}) -> abs(Fy - Ty);
distance({Fx, Fy}, {Tx, Fy}) -> abs(Fx - Tx);
distance({Fx, Fy}, {Tx, Ty}) ->
    math:sqrt(math:pow(Fx - Tx, 2) + math:pow(Fy - Ty, 2)).

path(PerMove, MapId, BaseId, {Fx, Fy}, {Tx, Ty}) ->
    case map_mgr:paths(MapId, BaseId, {Fx, Fy}, {Tx, Ty}) of
        Path when is_list(Path) ->
            path_point(PerMove, {Fx, Fy}, Path, undefined, []);
        blocked ->
            logger:error("寻路卡死无法开始", [], unit_type, 336),
            []
    end.

path_point(PerMove, _S, Path, _LastPoint, _BackPath)
    when PerMove =< 70 ->
    Path;
path_point(_PerMove, _S, [{X, Y}], _LastPoint,
           BackPath) ->
    lists:reverse([{X, Y} | BackPath]);
path_point(PerMove, {Sx, Sy}, [{X, Y} | Path],
           LastPoint, BackPath) ->
    case distance({Sx, Sy}, {X, Y}) > PerMove of
        true when LastPoint =:= undefined ->
            path_point(PerMove,
                       {X, Y},
                       Path,
                       {X, Y},
                       [{X, Y} | BackPath]);
        true ->
            path_point(PerMove,
                       LastPoint,
                       [{X, Y} | Path],
                       LastPoint,
                       [LastPoint | BackPath]);
        false ->
            path_point(PerMove, {Sx, Sy}, Path, {X, Y}, BackPath)
    end.

