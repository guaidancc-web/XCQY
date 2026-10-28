-file("src/mod/strategy/strategy_mgr.erl", 1).

-module(strategy_mgr).

-behaviour(gen_server).

-export([start_link/0,
         list_title_select/2,
         list_title_id/2,
         list_title_ids/2,
         upload_cast/4,
         update_cast/2,
         edit_cast/5,
         update_all_cast/0]).

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

-file("src/mod/strategy/strategy_mgr.erl", 24).

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

-file("src/mod/strategy/strategy_mgr.erl", 25).

-file("inc/strategy.hrl", 1).

-record(title,
        {id = 0 :: non_neg_integer(),
         name = "" :: list(),
         content = "" :: list(),
         type = 1 :: non_neg_integer(),
         role_id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         role_name = "" :: list(),
         account = "" :: list(),
         gm = 0 :: 0..1,
         state = 0 :: non_neg_integer(),
         comment_num = 0 :: non_neg_integer(),
         like_num = 0 :: non_neg_integer(),
         time = 0 :: term(),
         answer = 0 :: 0..1,
         order = 0 :: non_neg_integer(),
         question = [] :: list(),
         reward = [] :: list()}).

-record(collect,
        {role_id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         list = [] :: list()}).

-record(answer,
        {id = 0 :: pos_integer(),
         name = "" :: list(),
         list = [] :: [{num, content}],
         correct = 0 :: pos_integer()}).

-file("src/mod/strategy/strategy_mgr.erl", 26).

start_link() ->
    gen_server:start_link({local, strategy_mgr},
                          strategy_mgr,
                          [],
                          []).

init([]) ->
    logger:info("[~w] 正在启动...",
                [strategy_mgr],
                strategy_mgr,
                35),
    process_flag(trap_exit, true),
    ets:new(strategy_title,
            [set, named_table, public, {keypos, #title.id}]),
    ets:new(strategy_title_local,
            [set, named_table, public, {keypos, #title.id}]),
    erlang:send_after(90000, self(), data_init),
    State = #state{},
    logger:info("[~w] 启动完成",
                [strategy_mgr],
                strategy_mgr,
                41),
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({upload,
             #role{id = {RoleId, Platform, ZoneId} = RoleIds,
                   name = RoleName, account = Account},
             Type,
             Title,
             Content},
            State) ->
    logger:debug("upload data ~w~n",
                 [{RoleId, Type}],
                 strategy_mgr,
                 49),
    Time = date:unixtime(),
    Id = get_title_id(),
    ets:insert(strategy_title_local,
               #title{id = Id, type = Type, time = Time, name = Title,
                      content = Content, role_id = RoleIds,
                      role_name = RoleName, gm = 0, order = Id}),
    spawn(fun () ->
                  db:exec("insert into strategy_title_local (id, "
                          "name, content, role_id, platform, zone_id, "
                          "role_name, account, type, state, time, "
                          "order_type) values (?, ?, ?, ?, ?, ?, "
                          "?, ?, ?, ?,?,?)",
                          [Id,
                           Title,
                           Content,
                           RoleId,
                           Platform,
                           ZoneId,
                           RoleName,
                           Account,
                           Type,
                           0,
                           Time,
                           Id])
          end),
    {noreply, State};
handle_cast({update, TitleId, CheckState}, State) ->
    case ets:lookup(strategy_title_local, TitleId) of
        [Title = #title{}] ->
            ets:insert(strategy_title_local,
                       Title#title{state = CheckState}),
            spawn(fun () ->
                          db:exec("update strategy_title_local set state "
                                  "= ?  where id = ?",
                                  [CheckState, TitleId])
                  end);
        _ -> ignore
    end,
    {noreply, State};
handle_cast(update_all, State) ->
    ets:delete_all_objects(strategy_title),
    Sql = "select id, name, content, role_id, platform, "
          "zone_id, role_name, account, type, gm, "
          "order_type, time from strategy_title "
          "",
    case db:get_all(Sql) of
        {ok, List} -> strategy_title_add(List);
        _ ->
            logger:error("strategy update all fail ~n",
                         [],
                         strategy_mgr,
                         76)
    end,
    {noreply, State};
handle_cast({edit,
             #role{id = {RoleId, Platform, ZoneId} = RoleIds,
                   name = RoleName, account = Account},
             Id,
             Type,
             Title,
             Content},
            State) ->
    Time = date:unixtime(),
    ets:insert(strategy_title_local,
               #title{id = Id, type = Type, time = Time, name = Title,
                      content = Content, role_id = RoleIds,
                      role_name = RoleName, gm = 0, state = 0}),
    spawn(fun () ->
                  db:exec("replace into strategy_title_local (id, "
                          "name, content, role_id, platform, zone_id, "
                          "role_name, account, type, state, time) "
                          "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)",
                          [Id,
                           Title,
                           Content,
                           RoleId,
                           Platform,
                           ZoneId,
                           RoleName,
                           Account,
                           Type,
                           0,
                           Time])
          end),
    {noreply, State};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(data_init, State) ->
    Sql = "select id, name, content, role_id, platform, "
          "zone_id, role_name, account, type, state, "
          "order_type, time from strategy_title_local "
          "",
    case db:get_all(Sql) of
        {ok, List} -> strategy_title_local_add(List);
        _R -> ignore
    end,
    Sql1 = "select id, name, content, role_id, platform, "
           "zone_id, role_name, account, type, gm, "
           "order_type, time from strategy_title "
           "",
    case db:get_all(Sql1) of
        {ok, List1} -> strategy_title_add(List1);
        _T -> ignore
    end,
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...",
                [strategy_mgr],
                strategy_mgr,
                114),
    logger:info("[~w] 关闭完成",
                [strategy_mgr],
                strategy_mgr,
                115),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

list_title_select(Ms, Type) ->
    ets:select(type_to_ets(Type), Ms).

list_title_id(TitleId, Type) ->
    case ets:lookup(type_to_ets(Type), TitleId) of
        [Title = #title{}] -> {ok, Title};
        _ ->
            case strategy:title_gm_id_get(TitleId, Type) of
                {ok, Title} -> {ok, Title};
                _ -> {0, lang:get("该攻略已被删除")}
            end
    end.

list_title_ids(Ids, Type) ->
    list_title_ids(Ids, Type, []).

list_title_ids([], _Type, TitleList) -> TitleList;
list_title_ids([Id | Tail], Type, TitleListAcc) ->
    case ets:lookup(type_to_ets(Type), Id) of
        [Title | _] when is_record(Title, title) ->
            list_title_ids(Tail, Type, [Title | TitleListAcc]);
        _ ->
            case strategy:title_gm_id_get(Id, Type) of
                {ok, Title} ->
                    list_title_ids(Tail, Type, [Title | TitleListAcc]);
                _ -> list_title_ids(Tail, Type, TitleListAcc)
            end
    end.

upload_cast(Role, Type, Title, Content) ->
    gen_server:cast(strategy_mgr,
                    {upload, Role, Type, Title, Content}).

update_cast(TitleId, State) ->
    gen_server:cast(strategy_mgr, {update, TitleId, State}).

update_all_cast() ->
    gen_server:cast(strategy_mgr, update_all).

edit_cast(Role, TitleId, Type, Title, Content) ->
    gen_server:cast(strategy_mgr,
                    {edit, Role, TitleId, Type, Title, Content}).

type_to_ets(local) -> strategy_title_local;
type_to_ets(0) -> strategy_title_local;
type_to_ets(_) -> strategy_title.

get_title_id() ->
    case erlang:get(title_max_id) of
        undefined ->
            case
                db:get_all("select max(id) from strategy_title_local ")
                of
                {ok, [[MaxId]]} when is_integer(MaxId) ->
                    put(title_max_id, MaxId + 2),
                    MaxId + 1;
                _ ->
                    put(title_max_id, 2),
                    1
            end;
        Id ->
            put(title_max_id, Id + 1),
            Id
    end.

strategy_title_local_add([]) -> true;
strategy_title_local_add([[Id,
                           Title,
                           Content,
                           RoleId,
                           Platform,
                           ZoneId,
                           RoleName,
                           Account,
                           Type,
                           State,
                           Order,
                           Time]
                          | Acc]) ->
    ets:insert(strategy_title_local,
               #title{id = Id, name = Title, content = Content,
                      type = Type, role_id = {RoleId, Platform, ZoneId},
                      role_name = RoleName, account = Account, state = State,
                      order = Order, time = Time}),
    strategy_title_local_add(Acc).

strategy_title_add([]) -> true;
strategy_title_add([[Id,
                     Title,
                     Content,
                     RoleId,
                     Platform,
                     ZoneId,
                     RoleName,
                     Account,
                     Type,
                     Gm,
                     Order,
                     Time]
                    | Acc]) ->
    ets:insert(strategy_title,
               #title{id = Id, name = Title, content = Content,
                      type = Type, role_id = {RoleId, Platform, ZoneId},
                      role_name = RoleName, account = Account, gm = Gm,
                      order = Order, time = Time}),
    strategy_title_add(Acc).

