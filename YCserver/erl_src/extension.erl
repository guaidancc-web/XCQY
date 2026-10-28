-file("src/mod/extension/extension.erl", 1).

-module(extension).

-export([add_ship/2,
         create_code/1,
         is_invalid_key/1,
         delay_login/1,
         init/0,
         get_bind_reward/2,
         charge/2,
         activity/2,
         logout/1]).

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

-file("src/mod/extension/extension.erl", 22).

-file("inc/extension.hrl", 1).

-record(m_extension,
        {ver = 3,
         init = 0,
         key = "",
         key_time = 0,
         ships = [],
         apply_id = {0, "", 0},
         apply_key = "",
         apply_name = "",
         day_score = 0,
         day_flag = 0}).

-record(extension_key,
        {key, role_id, role_name = "", time}).

-record(extension_role,
        {ver = 2,
         id,
         name,
         apply_id = {0, "", 0},
         apply_key = "",
         apply_name = "",
         key = "",
         key_time = 0,
         ships = [],
         rewarded = [],
         day_score = 0,
         day_flag = 0}).

-record(extension_ship,
        {ver = 2,
         id = {0, "", 0},
         name = "",
         score = 0,
         key = "",
         time = 0,
         activity_score = 0,
         activity_time = []}).

-file("src/mod/extension/extension.erl", 23).

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

-file("src/mod/extension/extension.erl", 24).

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

-file("src/mod/extension/extension.erl", 25).

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

-file("src/mod/extension/extension.erl", 26).

init() -> #m_extension{}.

charge(#role{id = RoleId, name = RoleName,
             lev = RoleLev,
             m_extension =
                 #m_extension{apply_id = ApplyId = {_, P, Z}}},
       Charge)
    when Charge > 0 andalso ApplyId =/= {0, "", 0} ->
    big_world:cast(P,
                   Z,
                   extension_mgr,
                   cast,
                   [{charge, RoleId, RoleName, RoleLev, ApplyId, Charge}]),
    ok;
charge(_, _) -> ok.

activity(#role{id = RoleId, name = RoleName,
               lev = RoleLev,
               m_extension =
                   #m_extension{apply_id = ApplyId = {_, P, Z}}},
         22538)
    when ApplyId =/= {0, "", 0} ->
    big_world:cast(P,
                   Z,
                   extension_mgr,
                   cast,
                   [{activity, RoleId, RoleName, ApplyId, RoleLev}]),
    ok;
activity(_, _) -> ok.

delay_login(#role{m_extension =
                      #m_extension{init = 1}}) ->
    ok;
delay_login(Role = #role{id = RoleId,
                         m_extension = MExt}) ->
    case extension_mgr:lookup_role(RoleId) of
        {true,
         #extension_role{apply_id = ApplyId,
                         apply_key = ApplyKey, key = Key, key_time = KeyTime,
                         ships = Ships, apply_name = ApplyName,
                         day_flag = DayFlag, day_score = DayScore}} ->
            NewMExt = MExt#m_extension{init = 1, key = Key,
                                       key_time = KeyTime, ships = Ships,
                                       apply_id = ApplyId, apply_key = ApplyKey,
                                       apply_name = ApplyName,
                                       day_flag = DayFlag,
                                       day_score = DayScore},
            NewRole = Role#role{m_extension = NewMExt},
            {ok, NewRole};
        null ->
            NewMExt = #m_extension{init = 1},
            NewRole = Role#role{m_extension = NewMExt},
            {ok, NewRole};
        _ -> ok
    end.

logout(Role = #role{m_extension = MExt}) ->
    NewMExt = MExt#m_extension{init = 0},
    {ok, Role#role{m_extension = NewMExt}}.

get_bind_reward(Role = #role{id = RoleId, lev = Lev,
                             classes = Classes, sex = Sex},
                Id) ->
    RewardList = var:get_var(Role, other, 2043, []),
    case lists:keymember(Id, 1, RewardList) of
        true -> {false, lang:get("已领取该奖励，无法再次领取")};
        false ->
            case extension_mgr:lookup_role(RoleId) of
                {true, #extension_role{apply_id = {0, "", 0}}} ->
                    {false, lang:get("需要先绑定邀请人才可以领取奖励")};
                {true, #extension_role{}} ->
                    case extension_data:get(Id) of
                        #{need_lev := NeedLev} when Lev < NeedLev ->
                            {false,
                             util:flist(lang:get("等级不足~w级，无法领取奖励"), [NeedLev])};
                        #{gain_list := GainList} ->
                            GainList1 = [{ItemId, Bind, Num}
                                         || {NeedClasses,
                                             NeedSex,
                                             ItemId,
                                             Bind,
                                             Num}
                                                <- GainList,
                                            (NeedClasses =:= Classes orelse
                                                 NeedClasses =:= 0)
                                                andalso
                                                (NeedSex =:= Sex orelse
                                                     NeedSex =:= 2)],
                            case format:val_to_gain(GainList1) of
                                Gain = [_ | _] ->
                                    case role_gain:do_notice(Gain, Role) of
                                        {false, #gain{msg = Msg}} ->
                                            {false, Msg};
                                        {ok, NewRole} ->
                                            Msg = lang:get("领取奖励成功"),
                                            NewRewardList = [{Id,
                                                              date:unixtime()}
                                                             | RewardList],
                                            NewRole1 = var:set_var(NewRole,
                                                                   other,
                                                                   2043,
                                                                   NewRewardList),
                                            role:link_send(NewRole1,
                                                           17505,
                                                           {NewRewardList}),
                                            {ok, NewRole1, Msg}
                                    end;
                                _ -> {false, lang:get("找不到对应的奖励")}
                            end;
                        _ -> {false, lang:get("找不到对应的奖励")}
                    end;
                _ -> {false, lang:get("需要先绑定邀请人才可以领取奖励")}
            end
    end.

add_ship(Role = #role{pid = RolePid}, HashCode) ->
    case check_add_ship([lev, has_ship, check_code],
                        Role,
                        #{code => HashCode})
        of
        {true, ExtensionKey, ExtensionRole} ->
            extension_mgr:cast({add_ship,
                                ExtensionKey,
                                ExtensionRole,
                                RolePid}),
            ok;
        {false, Reason} -> {false, Reason}
    end.

check_add_ship([], _, _) -> {false, lang:get("错误的流程")};
check_add_ship([lev | T], Role = #role{lev = Lev},
               Args) ->
    case Lev =< 20 of
        true -> check_add_ship(T, Role, Args);
        false ->
            {false, util:flist(lang:get("等级超过~w，无法绑定邀请"), [20])}
    end;
check_add_ship([has_ship | T],
               Role = #role{id = RoleId}, Args) ->
    case extension_mgr:lookup_role(RoleId) of
        null -> check_add_ship(T, Role, Args);
        _ -> {false, lang:get("已绑定邀请，无法再次绑定")}
    end;
check_add_ship([check_code | _T],
               #role{id = SRoleId, name = SRoleName},
               #{code := Code}) ->
    case big_world:call(c_extension_mgr, lookup_key, [Code])
        of
        {error, big_world_not_ready} ->
            {false, lang:get("跨服断开连接中，无法添加邀请")};
        {true, #extension_key{role_id = SRoleId}} ->
            {false, lang:get("请勿使用自己的邀请码")};
        {true,
         ExtensionKey = #extension_key{role_id = TRoleId,
                                       role_name = TRoleName}} ->
            ExtensionRole = #extension_role{id = SRoleId,
                                            name = SRoleName,
                                            apply_id = TRoleId,
                                            apply_key = Code,
                                            apply_name = TRoleName},
            {true, ExtensionKey, ExtensionRole};
        false -> {false, lang:get("不存在的邀请码，无法添加邀请")};
        _Err ->
            logger:error("大世界请求邀请码信息时失败:~w",
                         [_Err],
                         extension,
                         158),
            {false, lang:get("系统繁忙中，请稍后尝试")}
    end;
check_add_ship([_ | T], Role, Args) ->
    check_add_ship(T, Role, Args).

create_code(Role = #role{id = RoleId, pid = RolePid,
                         name = RoleName}) ->
    case check_create_code([lev, has_code], Role, #{}) of
        true ->
            extension_mgr:cast({create_code,
                                RoleId,
                                RoleName,
                                RolePid}),
            ok;
        {false, Reason} -> {false, Reason}
    end.

check_create_code([], _Role, _Args) ->
    {false, lang:get("错误的流程")};
check_create_code([lev | T], Role = #role{lev = Lev},
                  Args) ->
    case Lev >= 50 of
        true -> check_create_code(T, Role, Args);
        false ->
            {false, util:flist(lang:get("角色等级不足~w级，无法申请激活码"), [50])}
    end;
check_create_code([has_code | _T], #role{id = RoleId},
                  _Args) ->
    case extension_mgr:lookup_role(RoleId) of
        null -> true;
        {true, ExtensionRole = #extension_role{}} ->
            case is_invalid_key(ExtensionRole) of
                true -> true;
                _ ->
                    Msg = util:flist(lang:get("使用~w次或申请1天后才可以更换新的邀请码"),
                                     [2]),
                    {false, Msg}
            end;
        _ -> {false, lang:get("系统繁忙，无法更换激活码")}
    end.

is_invalid_key(#extension_role{key = ""}) -> true;
is_invalid_key(#extension_role{key = Key,
                               key_time = KeyTime, ships = Ships}) ->
    Now = date:unixtime(),
    case date:is_same_day(Now, KeyTime) of
        true ->
            case count_key(Ships, Key) >= 2 of
                true -> true;
                false -> false
            end;
        false -> true
    end.

count_key(Ships, Key) -> count_key(Ships, Key, 0).

count_key([], _, Num) -> Num;
count_key([#extension_ship{key = Key} | T], Key, Num) ->
    count_key(T, Key, Num + 1);
count_key([_ | T], Key, Num) -> count_key(T, Key, Num).

