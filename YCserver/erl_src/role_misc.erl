-file("src/mod/role/role_misc.erl", 1).

-module(role_misc).

-export([status_to_text/1,
         classes_to_text/1,
         event_to_text/1,
         check_event/1,
         check_event/2,
         check_event_map/1,
         check_cd/1,
         check_cd/2,
         check_cd/3,
         is_local_role/1,
         is_cross_role/1,
         local_role/1,
         switch/1,
         get_ai/1,
         get_cd/1,
         rename/2,
         notice_rename/3,
         is_name_used/1,
         save_name_used/5,
         push_cross/1,
         check_merge_name/1,
         check_conn_pid/1,
         do_check_conn_pid/1,
         auth_sfz/3,
         push_10030/1,
         reset/2,
         delay_login/1,
         role_callback/2,
         get_role_auth_info/1,
         remove_adult/0,
         rpc_get_sfz_reward/1]).

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

-file("src/mod/role/role_misc.erl", 44).

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

-file("src/mod/role/role_misc.erl", 45).

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

-file("src/mod/role/role_misc.erl", 46).

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

-file("src/mod/role/role_misc.erl", 47).

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

-file("src/mod/role/role_misc.erl", 48).

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

-file("src/mod/role/role_misc.erl", 49).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/role/role_misc.erl", 50).

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

-file("src/mod/role/role_misc.erl", 51).

-file("inc/mirror.hrl", 1).

-record(mirror,
        {id = {"", 0} :: {bitstring(), non_neg_integer()},
         disabled = 0 :: atom(),
         auto_connect = 0 :: 0 | 1,
         nodename :: undefined | atom(),
         type = zone :: center | zone | oms,
         cookie = "m8B2E89I@O1n3z1" :: string(),
         node_connected = false :: boolean(),
         ready = 0 :: 0 | 1,
         pid :: undefined | pid(),
         remote_pid :: undefined | pid(),
         ref :: undefined | reference(),
         ver = "" :: string(),
         flag = main :: main | sub,
         combine = []}).

-file("src/mod/role/role_misc.erl", 52).

-file("inc/adm.hrl", 1).

-record(m_adm, {last_feedback = 0}).

-record(adm_report_info,
        {id, time, classes, lev, name, report = []}).

-record(adm_report,
        {id,
         order,
         name,
         lev,
         time,
         type,
         reason,
         msg = [],
         flag = 0}).

-record(adm_device_info,
        {id, type = 1 :: non_neg_integer()}).

-record(auth_sfz_cfg,
        {plat_channel = {"", 0},
         platform = "",
         channel_reg = 0,
         name = "",
         can_charge = 1,
         is_nonage = 0,
         charge_limit = 5000,
         is_wallow = 0,
         down_sec = 10800,
         is_show_phone = 0,
         show_info = "gm.3k.com",
         is_mail = 0,
         is_mid_exp = 0,
         is_lev_60 = 0,
         is_need_check = 0}).

-record(role_charge_cfg, {id = {0, "", 0}, label = ""}).

-file("src/mod/role/role_misc.erl", 53).

-file("inc/timer.hrl", 1).

-record(timer,
        {id :: undefined | term(),
         timeout = 1000 :: pos_integer(),
         m :: undefined | atom(),
         f :: undefined | function() | atom(),
         a = [] :: [term()],
         times = 1 :: integer(),
         next_tick = 0 :: non_neg_integer(),
         set_time = 1 :: pos_integer()}).

-record(rtimer,
        {ref :: undefined | reference(),
         key :: undefined | reference(),
         timers = [] :: [#timer{}]}).

-record(s_timer,
        {ref :: undefined | reference(),
         timers = [] :: [#timer{}]}).

-file("src/mod/role/role_misc.erl", 54).

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

-file("src/mod/role/role_misc.erl", 55).

switch(Role) ->
    Role1 = plot:switch(Role),
    Role2 = combat:role_switch(Role1),
    Role3 = parade:switch(Role2),
    Role3.

is_local_role(#role{id = {_, Plat, Zone}}) ->
    is_local_role({Plat, Zone});
is_local_role({_, Plat, Zone}) ->
    is_local_role({Plat, Zone});
is_local_role({Plat, Zone}) ->
    Local = {env:get(platform), env:get(zone_id)},
    case Local =:= {Plat, Zone} of
        true -> true;
        false ->
            case env:get(combine) of
                Locals when is_list(Locals) ->
                    lists:member({Plat, Zone}, Locals);
                _ -> false
            end
    end;
is_local_role(_) -> false.

is_cross_role(#role{id = {_, P, Z}}) ->
    is_cross_role({P, Z});
is_cross_role({_, P, Z}) -> is_cross_role({P, Z});
is_cross_role({P, Z}) ->
    case env:get(center) of
        #center{platform = P, zone_id = Z} -> true;
        #center{combine = C, ready = IsReady} ->
            case lists:member({P, Z}, C) of
                true -> true;
                false when IsReady =:= 1 ->
                    case catch ets:lookup(mirrors, {P, Z}) of
                        [#mirror{ready = 1}] -> true;
                        _ -> false
                    end;
                _ -> false
            end;
        _ -> false
    end.

check_conn_pid(TargetRoleId = {_, P, Z}) ->
    IsLocal = role_misc:is_local_role(TargetRoleId),
    case IsLocal of
        true ->
            case do_check_conn_pid(TargetRoleId) of
                {true, ConnPid} -> {true, IsLocal, ConnPid};
                _ -> {false, IsLocal}
            end;
        false ->
            case big_world:call(P,
                                Z,
                                role_misc,
                                do_check_conn_pid,
                                [TargetRoleId])
                of
                {true, ConnPid} -> {true, IsLocal, ConnPid};
                false -> {false, IsLocal};
                _ -> big_world_not_ready
            end
    end.

do_check_conn_pid(TargetRoleId) ->
    case ets:lookup(role_id_index, TargetRoleId) of
        [#id_index{conn_pid = Pid}] ->
            case is_pid(Pid) andalso is_process_alive(Pid) of
                true -> {true, Pid};
                _ -> false
            end;
        _ -> false
    end.

local_role(List) when is_list(List) ->
    local_role(List, []);
local_role(_) -> [].

local_role([], List) -> List;
local_role([M | T], List) ->
    case is_local_role(M) of
        true -> local_role(T, [M | List]);
        false -> local_role(T, List)
    end.

get_ai(1) -> 70001;
get_ai(2) -> 70002;
get_ai(3) -> 70003;
get_ai(4) -> 70004;
get_ai(5) -> 70005;
get_ai(6) -> 70006;
get_ai(7) -> 70007;
get_ai(_) -> 0.

status_to_text(0) -> lang:get("正常");
status_to_text(1) -> lang:get("死亡");
status_to_text(2) -> lang:get("战斗");
status_to_text(3) -> lang:get("传送");
status_to_text(4) -> lang:get("进行匹配").

classes_to_text(0) -> lang:get("任意");
classes_to_text(1) -> lang:get("狂剑");
classes_to_text(4) -> lang:get("兽灵");
classes_to_text(2) -> lang:get("魔导");
classes_to_text(3) -> lang:get("战弓");
classes_to_text(5) -> lang:get("秘言");
classes_to_text(6) -> lang:get("月魂");
classes_to_text(7) -> lang:get("圣骑").

event_to_text(0) -> lang:get("正常");
event_to_text(1) -> lang:get("副本");
event_to_text(_Event) -> lang:get("未知").

-spec check_cd(CmdName :: atom()) -> true | false.

check_cd(CmdName) ->
    Time = get_cd(CmdName),
    check_cd(CmdName, Time).

check_cd(_CmdName, 0) -> true;
check_cd(CmdName, Time) ->
    check_cd(CmdName, Time, false).

check_cd(CmdName, Time, Flag) ->
    Now = date:unixtime(ms),
    case get(CmdName) of
        T when is_integer(T) ->
            RTime = Now - T,
            case RTime >= Time of
                true ->
                    put(CmdName, Now),
                    true;
                false ->
                    case is_list(Flag) of
                        true when RTime =< 60000 ->
                            notice:return(notice:format(lang:get("~ts秒之后再来~ts"),
                                                        [{string_2,
                                                          1,
                                                          RTime div 1000},
                                                         {string_2, 1, Flag}]));
                        true ->
                            notice:return(notice:format(lang:get("~ts分钟之后再来~ts"),
                                                        [{string_2,
                                                          1,
                                                          RTime div 60000},
                                                         {string_2, 1, Flag}]));
                        _ -> ignore
                    end,
                    false
            end;
        _ ->
            put(CmdName, Now),
            true
    end.

-spec check_event_map(#role{}) -> {false, bitstring()} |
                                  true.

check_event_map(Role = #role{pos =
                                 #pos{map_base_id = MapBaseId}}) ->
    case check_event(Role) of
        {false, Reason} -> {false, Reason};
        true ->
            case lists:member(MapBaseId, []) of
                true -> true;
                false ->
                    case map_data:get_mod(MapBaseId) of
                        map_single -> {false, lang:get("该地图不能进行此操作")};
                        _ -> true
                    end
            end
    end;
check_event_map(_Role) ->
    {false, lang:get("当前状态不能进行此操作")}.

check_event(Role = #role{s_event = Event}, EventList) ->
    case lists:member(Event, EventList) of
        true -> check_event(Role#role{s_event = 0});
        _ -> check_event(Role)
    end.

trigger_rename(Role = #role{lev = Lev}, OldName,
               _NewName) ->
    map:role_update(Role),
    friend:rename(Role, OldName),
    friend_zone:rename(Role, OldName),
    guild_role:rename(Role, OldName),
    team:rename(Role, OldName),
    arena_mgr:rename(Role),
    goodvoice_mgr:rename(Role),
    role_data:save_info(Role),
    role_query:sync_cache(Role),
    role_query:sync_index(Role),
    robot_mgr:update(Role),
    wedding:set_name(Role),
    teacher:set_name(Role),
    sworn:update(Role, Lev),
    Role1 = child:parent_rename(Role),
    NewRole = Role1,
    NewRole.

notice_rename(Role, OldLev, NewLev)
    when OldLev < 39 andalso NewLev =:= 39 ->
    Time = var:get_var(Role, acc, 1005, 0),
    case Time =:= 0 of
        true ->
            Title = lang:get("改名通知"),
            Content =
                notice:format(lang:get("您好，恭喜您已经提升到39级了，在40级以前您有一次~ts的改名机会，可以在背包界面左侧的"
                                       "角色名字旁边点击【改名】按钮可以进行免费改名，当您升到40级后就无法进行免费改名了。如有改"
                                       "名需要，请尽快前往改名(*^__^*)"),
                              [{string_2, 1, lang:get("免费")}]),
            Items = [],
            mail:send(Role,
                      #{title => Title, content => Content, items => Items}),
            ok;
        _ -> ok
    end;
notice_rename(_, _, _) -> ok.

check_merge_name(Name) ->
    [M | _] = "[",
    case Name of
        [M | _] -> true;
        _ -> false
    end.

rename(Role = #role{id = RoleId, sex = Sex,
                    classes = Classes, name = OldName, account = Account,
                    link = #link{conn_pid = ConnPid}},
       NewName) ->
    case check_rename(Role) of
        {false, Reason} -> {false, Reason};
        true ->
            case role_data:is_name_used(NewName) of
                true -> {false, lang:get("该名字已经被使用")};
                false ->
                    case check_role_name(NewName, Account, ConnPid) of
                        ok ->
                            Role1 = Role#role{name = NewName,
                                              name_used = OldName},
                            case role_data:save_name_used(RoleId,
                                                          Sex,
                                                          Classes,
                                                          OldName,
                                                          NewName)
                                of
                                true ->
                                    Role2 = trigger_rename(Role1,
                                                           OldName,
                                                           NewName),
                                    {ok, Role2};
                                _Err -> {false, lang:get("系统繁忙, 无法使用")}
                            end;
                        {false, Reason} -> {false, Reason}
                    end
            end
    end.

check_rename(Role) ->
    case check_event(Role, [2]) of
        true -> true;
        {false, Reason} -> {false, Reason}
    end.

check_role_name(Name, Acc, ConnPid) ->
    case db:get_one("select count(*) from role where name "
                    "= ?",
                    [Name])
        of
        {error, _Err} -> {false, lang:get("系统繁忙, 请稍后尝试")};
        {ok, Num} when Num >= 1 -> {false, lang:get("角色名已存在")};
        {ok, _} ->
            case role_query:request_name(Name, {Acc, ConnPid}) of
                ok -> ok;
                {false, Reason} -> {false, Reason};
                _ -> {false, util:fbin(lang:get("系统繁忙, 请稍后尝试"))}
            end
    end.

is_name_used(Name) ->
    case catch ets:lookup(ets_role_name_used, Name) of
        [_ | _] -> true;
        [] -> false;
        _ -> true
    end.

save_name_used(RoleId, Sex, Classes, OldName,
               NewName) ->
    Cache = #role_name_used{id = RoleId, new_name = NewName,
                            name = OldName, sex = Sex, classes = Classes,
                            time = date:unixtime()},
    insert_name_used(Cache).

delay_login(Role = #role{id = {_, Plat, _},
                         channel_reg = ChannelReg, lev = Lev}) ->
    case "xcqy" of
        "xcqy" ->
            Content =
                lang:get("亲爱的玩家朋友，为了维护游戏的公平和秩序，我们在此郑重提示：官方<color='#FF00"
                         "00'>严禁任何第三方代理充值、广告拉人进群、线下交易、使用外挂或辅助</color>等行"
                         "为，这可能导致您的账号冻结。同时也为了您账号的安全，请勿<color='#FF0000'>"
                         "共享账号、不要相信加群领礼包、陌生人加微信</color>等诈骗信息，公平和谐的游戏环境，"
                         "由你我共同打造，给您带来的不便，还请见谅。"),
            notice:send(Role, 7, Content),
            ok;
        _ -> ok
    end,
    case adm_mgr:query_auth_cfg_info({Plat, ChannelReg}) of
        [_AtuhCfg = #auth_sfz_cfg{is_wallow = WallowFlag,
                                  down_sec = DownSec, is_mid_exp = ExpFlag,
                                  is_lev_60 = LevLimit}]
            when WallowFlag =:= 1 orelse ExpFlag =:= 1 ->
            case LevLimit =:= 1 andalso Lev > 60 of
                true -> ok;
                false ->
                    Flag = case WallowFlag of
                               1 -> wallow;
                               _ -> exp
                           end,
                    case get_role_auth_info(Role) of
                        {0, _} ->
                            logger:debug("角色未进行实名认证:", [], role_misc, 385),
                            OnlineSec = var:get_var(Role, day_five, 143, 0),
                            logger:debug("玩家在线时长:~w",
                                         [OnlineSec],
                                         role_misc,
                                         387),
                            TimeOut1 = max(DownSec - OnlineSec, 0) * 1000,
                            Timer1 = #timer{id = nonage_notice,
                                            timeout = TimeOut1, times = 1,
                                            m = role_misc, f = role_callback,
                                            a =
                                                [{nonage_notice,
                                                  not_auth,
                                                  Flag}]},
                            Role1 = role_timer:add(Timer1, Role),
                            NRole = case WallowFlag of
                                        1 ->
                                            TimeOut2 = max(DownSec - OnlineSec,
                                                           600)
                                                           * 1000,
                                            Timer2 = #timer{id = nonage_kick,
                                                            timeout = TimeOut2,
                                                            times = 1,
                                                            m = role_misc,
                                                            f = role_callback,
                                                            a = [nonage_kick]},
                                            role_timer:add(Timer2, Role1);
                                        _ -> Role1
                                    end,
                            {ok, NRole};
                        {1, 0} ->
                            IsAdult = case var:get_var(Role,
                                                       other,
                                                       2073,
                                                       undefined)
                                          of
                                          {StrSfz, Name} ->
                                              case check_sfz(StrSfz, Name) of
                                                  {true, _IsAdult} -> _IsAdult;
                                                  _ -> 0
                                              end;
                                          _ -> 0
                                      end,
                            VarRole = var:set_var(Role, other, 2088, IsAdult),
                            NRole = case IsAdult of
                                        0 ->
                                            logger:debug("角色未进行实名认证:~w",
                                                         [IsAdult],
                                                         role_misc,
                                                         415),
                                            OnlineSec = var:get_var(VarRole,
                                                                    day_five,
                                                                    143,
                                                                    0),
                                            logger:debug("玩家在线时长:~w",
                                                         [OnlineSec],
                                                         role_misc,
                                                         417),
                                            TimeOut1 = max(DownSec - OnlineSec,
                                                           0)
                                                           * 1000,
                                            Timer1 = #timer{id = nonage_notice,
                                                            timeout = TimeOut1,
                                                            times = 1,
                                                            m = role_misc,
                                                            f = role_callback,
                                                            a =
                                                                [{nonage_notice,
                                                                  nonage,
                                                                  Flag}]},
                                            Role1 = role_timer:add(Timer1,
                                                                   VarRole),
                                            case WallowFlag of
                                                1 ->
                                                    TimeOut2 = max(DownSec -
                                                                       OnlineSec,
                                                                   10)
                                                                   * 1000,
                                                    logger:debug("定时器：~w",
                                                                 [TimeOut2],
                                                                 role_misc,
                                                                 425),
                                                    Timer2 = #timer{id =
                                                                        nonage_kick,
                                                                    timeout =
                                                                        TimeOut2,
                                                                    times = 1,
                                                                    m =
                                                                        role_misc,
                                                                    f =
                                                                        role_callback,
                                                                    a =
                                                                        [nonage_kick]},
                                                    role_timer:add(Timer2,
                                                                   Role1);
                                                _ -> Role1
                                            end;
                                        1 -> VarRole
                                    end,
                            {ok, NRole};
                        _ -> ok
                    end
            end;
        _ -> ok
    end.

reset(Role, _OldRole) ->
    case var:get_var(Role, other, 2073, undefined) of
        undefined -> ok;
        {StrSfz, Name} ->
            IsAdult = var:get_var(Role, other, 2088, 0),
            case IsAdult of
                0 ->
                    case check_sfz(StrSfz, Name) of
                        {true, 1} ->
                            VarRole = var:set_var(Role, other, 2088, 1),
                            role:link_send(VarRole, 10030, {1, IsAdult}),
                            {ok, VarRole};
                        _ -> ok
                    end;
                _ -> ok
            end
    end.

push_10030(Role = #role{id = {_, Plat, _},
                        channel_reg = ChannelReg}) ->
    AuthInfo = get_role_auth_info(Role),
    logger:debug("角色认证信息:~w", [AuthInfo], role_misc, 463),
    case adm_mgr:query_auth_cfg_info({Plat, ChannelReg}) of
        [AuthCfg = #auth_sfz_cfg{}] ->
            role:link_send(Role, 10035, {[AuthCfg]}),
            role:link_send(Role, 10030, AuthInfo);
        _ -> role:link_send(Role, 10030, {2, 1})
    end.

get_role_auth_info(Role = #role{id = {_, Plat, _},
                                channel_reg = ChannelReg}) ->
    case adm_mgr:query_auth_cfg_info({Plat, ChannelReg}) of
        [#auth_sfz_cfg{}] ->
            case var:get_var(Role, other, 2073, undefined) of
                undefined -> {0, 0};
                {_StrSfz, _Name} ->
                    IsAdult = var:get_var(Role, other, 2088, 0),
                    {1, IsAdult}
            end;
        _ -> {2, 1}
    end.

auth_sfz(Role, StrSfz, Name) ->
    case var:get_var(Role, other, 2073, undefined) of
        undefined ->
            case check_sfz(StrSfz, Name) of
                {false, Reason} -> {false, Reason};
                {true, IsAdult} ->
                    AdultRole = case IsAdult of
                                    1 -> var:set_var(Role, day_five, 152, 0);
                                    _ -> Role
                                end,
                    case auth_sfz_data:get_reward(1) of
                        false -> {false, lang:get("当前无法进行认证")};
                        Reward = [_ | _] ->
                            TimerRole = role_timer:del(nonage_kick, AdultRole),
                            Gian = format:val_to_gain(Reward),
                            case role_gain:do_notice(Gian, TimerRole) of
                                {ok, GainRole} ->
                                    VarRole1 = var:set_var(GainRole,
                                                           other,
                                                           2073,
                                                           {StrSfz, Name}),
                                    VarRole2 = var:set_var(VarRole1,
                                                           other,
                                                           2088,
                                                           IsAdult),
                                    role:link_send(Role, 10030, {1, IsAdult}),
                                    {ok, VarRole2};
                                {false, _} ->
                                    Title = lang:get("身份验证奖励"),
                                    Content = lang:get("您通过了身份验证，这是您的身份验证奖励:"),
                                    mail:send(TimerRole,
                                              Title,
                                              Content,
                                              Reward),
                                    role:link_send(TimerRole,
                                                   10030,
                                                   {1, IsAdult}),
                                    VarRole1 = var:set_var(TimerRole,
                                                           other,
                                                           2073,
                                                           {StrSfz, Name}),
                                    VarRole2 = var:set_var(VarRole1,
                                                           other,
                                                           2088,
                                                           IsAdult),
                                    {ok, VarRole2}
                            end
                    end
            end;
        {_StrSfz, _Name} -> {false, lang:get("您已经认证过了,无需重复认证")}
    end.

role_callback(Role,
              {nonage_notice, NonageFlag, Flag}) ->
    case NonageFlag of
        nonage ->
            Msg = lang:get("您已进入疲劳游戏时间，游戏内收益减半，为了您的健康，请尽快下线休息。"),
            notice:pop(Role, 2, Msg);
        not_auth ->
            Msg = case Flag of
                      wallow ->
                          notice:format(lang:get("您已进入疲劳游戏时间，将在10分钟后强制下线。（请在~ts页面进行认证，已认证的成年玩家可"
                                                 "解除疲劳限制）"),
                                        [{string_2, 5, lang:get("[奖励-实名制]")}]);
                      exp ->
                          notice:format(lang:get("您已进入疲劳游戏时间，游戏内收益减半。（请在~ts页面进行认证，已认证的成年玩家可解除疲劳限制）"),
                                        [{string_2, 5, lang:get("[奖励-实名制]")}]);
                      _ ->
                          notice:format(lang:get("您已进入疲劳游戏时间，游戏内收益减半。（请在~ts页面进行认证，已认证的成年玩家可解除疲劳限制）"),
                                        [{string_2, 5, lang:get("[奖励-实名制]")}])
                  end,
            notice:pop(Role, 80, Msg);
        _ ->
            Msg = case Flag of
                      wallow ->
                          notice:format(lang:get("您已进入疲劳游戏时间，将在10分钟后强制下线。（请在~ts页面进行认证，已认证的成年玩家可"
                                                 "解除疲劳限制）"),
                                        [{string_2, 5, lang:get("[奖励-实名制]")}]);
                      exp ->
                          notice:format(lang:get("您已进入疲劳游戏时间，游戏内收益减半。（请在~ts页面进行认证，已认证的成年玩家可解除疲劳限制）"),
                                        [{string_2, 5, lang:get("[奖励-实名制]")}]);
                      _ ->
                          notice:format(lang:get("您已进入疲劳游戏时间，游戏内收益减半。（请在~ts页面进行认证，已认证的成年玩家可解除疲劳限制）"),
                                        [{string_2, 5, lang:get("[奖励-实名制]")}])
                  end,
            notice:pop(Role, 80, Msg)
    end,
    case Flag of
        exp ->
            NewRole = var:set_var(Role, day_five, 152, 1),
            {ok, NewRole};
        _ -> ok
    end;
role_callback(#role{pid = Pid, id = {_, Plat, _},
                    channel_reg = ChannelReg},
              nonage_kick) ->
    case adm_mgr:query_auth_cfg_info({Plat, ChannelReg}) of
        [#auth_sfz_cfg{is_wallow = 1}] ->
            Msg = notice:format(lang:get("您已进入疲劳游戏时间，系统强制下线\n~ts"),
                                [{string_2,
                                  5,
                                  lang:get("（重新登陆后可前往[奖励-实名认证]进行认证，已认证的成年玩家可解除疲劳限制）")}]),
            role:stop(async, Pid, Msg),
            ok;
        _ -> ok
    end;
role_callback(Role = #role{}, remove_adult) ->
    NewRole = var:set_var(Role, day_five, 152, 0),
    {ok, NewRole};
role_callback(_Role, _) -> ok.

check_sfz("", _) -> {false, lang:get("身份证号不能为空")};
check_sfz(_, "") -> {false, lang:get("姓名不能为空")};
check_sfz(StrSfz, _Name) ->
    Len = length(StrSfz),
    if Len =:= 15 ->
           {Y2, _} = string:to_integer(string:substr(StrSfz,
                                                     7,
                                                     2)),
           Year = 1900 + Y2,
           {NowYear, _, _} = erlang:date(),
           if NowYear - Year < 18 -> {true, 0};
              true -> {true, 1}
           end;
       Len =:= 18 ->
           {Year, _} = string:to_integer(string:substr(StrSfz,
                                                       7,
                                                       4)),
           {NowYear, _, _} = erlang:date(),
           if Year < 1850 -> {false, lang:get("非法身份证号")};
              true ->
                  {I18, Sum} = sumW(StrSfz, 0, 0),
                  A1 = getA1(Sum rem 11),
                  case A1 =:= I18 of
                      false -> {false, lang:get("身份证校验不正确")};
                      true when NowYear - Year < 18 -> {true, 0};
                      _ -> {true, 1}
                  end
           end;
       true -> {false, lang:get("身份证长度不合法")}
    end.

sumW([I18], Sum, 17) -> {ascii(I18), Sum};
sumW([Ii | T], Sum, I) ->
    Wi = getW(I) * ascii(Ii),
    sumW(T, Sum + Wi, I + 1).

getW(0) -> 7;
getW(1) -> 9;
getW(2) -> 10;
getW(3) -> 5;
getW(4) -> 8;
getW(5) -> 4;
getW(6) -> 2;
getW(7) -> 1;
getW(8) -> 6;
getW(9) -> 3;
getW(10) -> 7;
getW(11) -> 9;
getW(12) -> 10;
getW(13) -> 5;
getW(14) -> 8;
getW(15) -> 4;
getW(16) -> 2.

ascii($0) -> 0;
ascii($1) -> 1;
ascii($2) -> 2;
ascii($3) -> 3;
ascii($4) -> 4;
ascii($5) -> 5;
ascii($6) -> 6;
ascii($7) -> 7;
ascii($8) -> 8;
ascii($9) -> 9;
ascii($x) -> x;
ascii($X) -> x;
ascii(_) -> 0.

getA1(0) -> 1;
getA1(1) -> 0;
getA1(2) -> x;
getA1(3) -> 9;
getA1(4) -> 8;
getA1(5) -> 7;
getA1(6) -> 6;
getA1(7) -> 5;
getA1(8) -> 4;
getA1(9) -> 3;
getA1(10) -> 2.

insert_name_used(Cache) ->
    ets:insert(ets_role_name_used, Cache),
    ets:insert(role_name_used_list, Cache),
    dets:insert(dets_role_name_used, Cache),
    true.

push_cross(#role{cross_type = CrossType}) ->
    sys_conn:pack_send(10019, {CrossType}).

-spec check_event(#role{}) -> {false, bitstring()} |
                              true.

check_event(#role{s_event = 1}) ->
    {false, lang:get("副本中不能进行此操作")};
check_event(#role{s_event = 29}) ->
    {false, lang:get("您正在无尽试炼，不能进行此操作")};
check_event(#role{s_event = 3}) ->
    {false, lang:get("护送中不能进行此操作")};
check_event(#role{s_event = 5}) ->
    {false, lang:get("段位赛中不能进行此操作")};
check_event(#role{s_event = 4}) ->
    {false, lang:get("吃货巡游中不能进行此操作")};
check_event(#role{s_event = 10}) ->
    {false, lang:get("勇士战场准备中，不能进行此操作")};
check_event(#role{s_event = 11}) ->
    {false, lang:get("勇士战场中，不能进行此操作")};
check_event(#role{status = 1}) ->
    {false, lang:get("死亡中不能进行此操作")};
check_event(#role{status = 2}) ->
    {false, lang:get("战斗中不能进行此操作")};
check_event(#role{status = 4}) ->
    {false, lang:get("匹配中不能进行此操作")};
check_event(#role{status = 3}) ->
    {false, lang:get("传送中不能进行此操作")};
check_event(_Role = #role{s_action = 4}) ->
    {false, lang:get("剧情中不能进行此操作")};
check_event(#role{status = 0, s_event = 2}) -> true;
check_event(#role{status = 0, s_event = 0}) -> true;
check_event(#role{status = 0, s_event = 28}) -> true;
check_event(#role{status = 0, s_event = 47}) -> true;
check_event(_R) -> {false, lang:get("当前状态不能进行此操作")}.

get_cd(rpc_10400_world) -> 30000;
get_cd(rpc_10419) -> 60000;
get_cd(rpc_10400_center_world) -> 30000;
get_cd(rpc_10426) -> 10000;
get_cd(rpc_10400_map) -> 5000;
get_cd(rpc_10400_guild) -> 0;
get_cd(rpc_10400_canyon) -> 30000;
get_cd(rpc_10218) -> 30000;
get_cd(rpc_14702) -> 30000;
get_cd(rpc_wedding_guild) -> 60000;
get_cd({pick_wedding_box, _}) -> 60000;
get_cd(rpc_11711) -> 5000;
get_cd(rpc_16000) -> 30000;
get_cd({rpc_16000, _Question}) -> 10000;
get_cd(rpc_15004) -> 60000;
get_cd(rpc_14012) -> 60000;
get_cd(rpc_14013) -> 60000;
get_cd({rpc_ship_box, 73250}) -> 5000;
get_cd({rpc_ship_box, _}) -> 3000;
get_cd(rpc_16602) -> 300000;
get_cd({rpc_14022, _}) -> 3000;
get_cd({pick_flower_bag, _}) -> 120000;
get_cd(rpc_16900) -> 5000;
get_cd({pick_camp_box_id, _}) -> 60000;
get_cd(rpc_17921) -> 5000;
get_cd(rpc_18502) -> 60000;
get_cd(rpc_17834) -> 120000;
get_cd(rpc_17835) -> 120000;
get_cd(rpc_17836) -> 20000;
get_cd(rpc_17838) -> 20000;
get_cd(rpc_10570) -> 3000;
get_cd(rpc_11182) -> 30000;
get_cd({pick_gods_place_box, _}) -> 5 * 60 * 1000;
get_cd({check_silence, Type}) ->
    silent_data:get_check_cd(Type) * 60 * 1000;
get_cd(_) -> 1000.

remove_adult() ->
    role_group:apply(world,
                     {role_misc, role_callback, [remove_adult]}).

rpc_get_sfz_reward(Role) ->
    IsGet = var:get_var(Role, other, 2107, 0),
    case IsGet of
        1 -> {false, lang:get("您已经领取过认证奖励了")};
        _ ->
            VarRole = var:set_var(Role, other, 2107, 1),
            Rewards = auth_sfz_data:get_reward(1),
            Gain = format:val_to_gain(Rewards),
            case role_gain:do_notice(Gain, VarRole) of
                {ok, NewRole} ->
                    role:link_send(Role, 9954, {1}),
                    {ok, NewRole};
                _ ->
                    Title = lang:get("实名认证奖励"),
                    Content = lang:get("由于您的背包已满，实名认证奖励通过背包下发给您，请查收:"),
                    mail:send(VarRole, Title, Content, Rewards),
                    role:link_send(Role, 9954, {1}),
                    {ok, VarRole}
            end
    end.

