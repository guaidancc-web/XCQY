-file("src/mod/adm/adm_util.erl", 1).

-module(adm_util).

-export([check/2, get_role_info/1]).

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

-file("src/mod/adm/adm_util.erl", 14).

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

-file("src/mod/adm/adm_util.erl", 15).

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

-file("src/mod/adm/adm_util.erl", 16).

-file("inc/query.hrl", 1).

-record(name_index,
        {name = "" :: list(),
         id = 0 :: non_neg_integer(),
         acc = "" :: list(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid()}).

-record(id_index,
        {id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         acc = "" :: list(),
         name = "" :: list(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid()}).

-record(acc_index,
        {acc = {"", "", 0} ::
             {list(), list(), non_neg_integer()},
         id = 0 :: non_neg_integer(),
         name = "" :: list(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid()}).

-file("src/mod/adm/adm_util.erl", 17).

-file("inc/var.hrl", 1).

-record(m_var,
        {ver = 1,
         last_reset_time = 0 :: non_neg_integer(),
         last_reset_five_time = 0,
         last_reset_week_five_time = 0,
         day_vars = [] :: [tuple()],
         day_five_vars = [] :: [tuple()],
         week_five_vars = [],
         last_acc_time = 0,
         acc_time = 0,
         acc_vars = [] :: [tuple()],
         other_vars = [] :: [tuple()]}).

-record(role_var,
        {id = {0, "", 0} :: tuple(),
         ver = 1,
         last_reset_time = 0 :: non_neg_integer(),
         day_vars = [] :: [tuple()],
         forever_vars = [] :: [tuple()],
         last_reset_five_time = 0,
         last_reset_week_five_time = 0,
         day_five_vars = [] :: [tuple()],
         week_five_vars = []}).

-file("src/mod/adm/adm_util.erl", 18).

check([], Args) -> {true, Args};
check([role | T], Args = #{role_info := RoleInfo}) ->
    SkipError = maps:get(skip_error, Args, 0),
    case check_role(RoleInfo, SkipError) of
        {true, NewRoleInfo} ->
            check(T, Args#{role_info => NewRoleInfo});
        {false, Reason} -> {false, Reason}
    end;
check([binary | T], Args = #{binary := Binary}) ->
    case check_binary(Binary) of
        true -> check(T, Args);
        {false, Reason} -> {false, Reason}
    end;
check([int | T], Args = #{int := Ints}) ->
    case check_int(Ints) of
        true -> check(T, Args);
        {false, Reason} -> {false, Reason}
    end;
check([gift | T],
      Args = #{gift := {GiftId, GiftStr},
               role_info := RoleInfo}) ->
    case check_gift(RoleInfo, GiftId, GiftStr) of
        true -> check(T, Args);
        {false, Reason} -> {false, Reason}
    end;
check([item | T], Args = #{items := Items}) ->
    case check_item(Items, []) of
        {true, NewItems} -> check(T, Args#{items => NewItems});
        {false, Reason} -> {false, Reason}
    end.

check_role(RoleInfo, SkipError) ->
    check_role(RoleInfo, SkipError, []).

check_role([], _, RoleInfo) -> {true, RoleInfo};
check_role([{RoleId, Platform, ZoneId} | T], SkipError,
           RoleInfo)
    when is_integer(RoleId) andalso
             is_list(Platform) andalso is_integer(ZoneId) ->
    case has_role_id({RoleId, Platform, ZoneId}) of
        true ->
            check_role(T,
                       SkipError,
                       [{RoleId, Platform, ZoneId} | RoleInfo]);
        _ when SkipError =:= 1 ->
            check_role(T, SkipError, RoleInfo);
        _ ->
            {false,
             util:flist("不存在的角色参数:~w", [{RoleId, Platform, ZoneId}])}
    end;
check_role([[RoleId, Platform, ZoneId] | T], SkipError,
           RoleInfo)
    when is_integer(RoleId) andalso
             is_list(Platform) andalso is_integer(ZoneId) ->
    case has_role_id({RoleId, Platform, ZoneId}) of
        true ->
            check_role(T,
                       SkipError,
                       [{RoleId, Platform, ZoneId} | RoleInfo]);
        _ when SkipError =:= 1 ->
            check_role(T, SkipError, RoleInfo);
        _ ->
            {false,
             util:flist("不存在的角色参数:~w", [{RoleId, Platform, ZoneId}])}
    end;
check_role([{RoleName, Platform, ZoneId} | T],
           SkipError, RoleInfo)
    when is_list(RoleName) andalso
             is_list(Platform) andalso is_integer(ZoneId) ->
    case get_role_info({RoleName, Platform, ZoneId}) of
        {true, #{role_id := RoleId}} ->
            check_role(T, SkipError, [RoleId | RoleInfo]);
        _ when SkipError =:= 1 ->
            check_role(T, SkipError, RoleInfo);
        {false, Reason} -> {false, Reason}
    end;
check_role([[RoleName, Platform, ZoneId] | T],
           SkipError, RoleInfo)
    when is_list(RoleName) andalso
             is_list(Platform) andalso is_integer(ZoneId) ->
    case get_role_info({RoleName, Platform, ZoneId}) of
        {true, #{role_id := RoleId}} ->
            check_role(T, SkipError, [RoleId | RoleInfo]);
        _ when SkipError =:= 1 ->
            check_role(T, SkipError, RoleInfo);
        {false, Reason} -> {false, Reason}
    end;
check_role([_ | T], 1, NewRoleInfo) ->
    check_role(T, 1, NewRoleInfo);
check_role([H | _T], _SkipError, _NewRoleInfo) ->
    {false, util:flist("错误的角色参数:~w", [H])}.

has_role_id({Rid, Platform, ZoneId})
    when is_integer(Rid) andalso
             is_list(Platform) andalso is_integer(ZoneId) ->
    case role_query:local_index(by_id,
                                {Rid, Platform, ZoneId})
        of
        {ok, _} -> true;
        _ ->
            Sql = "select account from role_info where "
                  "rid = ? and platform = ? and zone_id "
                  "= ?",
            case db:get_row(Sql, [Rid, Platform, ZoneId]) of
                {ok, [_Account]} -> true;
                _ -> false
            end
    end.

check_gift([{Rid, Platform, ZoneId}], GiftId,
           GiftStr) ->
    RoleId = {Rid, Platform, ZoneId},
    LogList = var:get_role_var(RoleId, forever, 3003, []),
    case lists:keymember(GiftId, 1, LogList) of
        false ->
            NewLogList = [{GiftId, GiftStr} | LogList],
            var:set_role_var(RoleId, forever, 3003, NewLogList),
            true;
        _ -> {false, "已经领取过该礼包"}
    end;
check_gift(_, _, _) -> {false, "不支持多人领取:~w"}.

check_binary([]) -> true;
check_binary([H | T]) when is_list(H) ->
    check_binary(T);
check_binary([H | _T]) ->
    {false, util:flist("错误的参数:~w", [H])}.

check_int([]) -> true;
check_int([H | T]) when is_integer(H) -> check_int(T);
check_int([H | _T]) ->
    {false, util:flist("错误的参数:~w", [H])}.

check_item([], Items) -> {true, Items};
check_item([[ItemId, Bind, Num] | T], Items)
    when is_integer(Num) andalso
             Num > 0 andalso (Bind =:= 1 orelse Bind =:= 0) ->
    case item_data:get(ItemId) of
        #item_base{} ->
            check_item(T, [{ItemId, Bind, Num} | Items]);
        _ -> {false, util:flist("不存在道具:~w", [ItemId])}
    end;
check_item([{ItemId, Bind, Num} | T], Items)
    when is_integer(Num) andalso
             Num > 0 andalso (Bind =:= 1 orelse Bind =:= 0) ->
    case item_data:get(ItemId) of
        #item_base{} ->
            check_item(T, [{ItemId, Bind, Num} | Items]);
        _ -> {false, util:flist("不存在道具:~w", [ItemId])}
    end;
check_item([H | _T], _Items) ->
    {false, util:flist("错误道具参数:~w", [H])}.

get_role_info({Rid, Platform, ZoneId})
    when is_integer(Rid) ->
    case role_query:index(by_id, Rid, Platform, ZoneId) of
        {ok, #id_index{name = Name, pid = Pid}} ->
            {true,
             #{role_id => {Rid, Platform, ZoneId}, online => 1,
               pid => Pid, name => Name}};
        {error, not_found} ->
            case role_data:info(by_id, Rid, Platform, ZoneId) of
                {ok,
                 #role_info{name = Name, lock_status = LockStatus}} ->
                    {true,
                     #{role_id => {Rid, Platform, ZoneId}, online => 0,
                       name => Name, lock_status => LockStatus}};
                _ -> {false, error}
            end;
        _ -> {false, error}
    end;
get_role_info({RoleName, Platform, ZoneId}) ->
    case role_query:index(by_name,
                          RoleName,
                          Platform,
                          ZoneId)
        of
        {ok, #name_index{id = Rid, pid = Pid}} ->
            {true,
             #{role_id => {Rid, Platform, ZoneId}, online => 1,
               pid => Pid, name => RoleName}};
        {error, not_found} ->
            case role_data:info(by_name, RoleName, Platform, ZoneId)
                of
                {ok, #role_info{id = Rid, lock_status = LockStatus}} ->
                    {true,
                     #{role_id => {Rid, Platform, ZoneId}, online => 0,
                       name => RoleName, lock_status => LockStatus}};
                _Err -> {false, error}
            end;
        _Err -> {false, error}
    end.

