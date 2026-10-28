-file("src/mod/help/help.erl", 1).

-module(help).

-export([init/0,
         logout/1,
         help/2,
         info/1,
         get_sended/1,
         ack_recv/2,
         add/2,
         add/3,
         del_help_msg/3,
         pop_next_id/1,
         free_id/2,
         assist/2,
         help_timeout/2,
         apply_del_help_info/2,
         del_help_info_by_recruit_type/2,
         del_help_info_by_fun_type/2,
         del_help_info_by_id/2,
         leader_leave/1,
         del_help_info_by_cfg_id/2]).

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

-file("src/mod/help/help.erl", 38).

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

-file("src/mod/help/help.erl", 39).

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

-file("src/mod/help/help.erl", 40).

-file("inc/team.hrl", 1).

-record(team,
        {ver = 0,
         pid :: undefined | pid(),
         leader,
         members = [] :: list(),
         applys = [],
         pos :: undefined | tuple(),
         member_num = 1,
         status = 0,
         matched = 0 :: non_neg_integer(),
         is_fly = 0 :: 0 | 1,
         order = [],
         team_formation = 1,
         team_formation_lev = 1,
         usurpers = [],
         type = 0,
         lev_flag = 0,
         lev_min = 0,
         lev_max = 0,
         last_join_time = 0,
         combat_num = 0,
         chat_recruit_info = [],
         target = 0,
         cross_type = 0,
         dun_id = 0}).

-record(m_team,
        {ver = 0,
         pid :: undefined | pid(),
         status = 3 :: non_neg_integer(),
         applys = [],
         mod = 0,
         speed = 0,
         recruitment_time = 0,
         recruitment_ids = lists:seq(1, 5),
         recruitment = [],
         member_num = 0}).

-record(team_mate,
        {ver = 0,
         id = {0, "", 0},
         name = "",
         pid :: undefined | pid(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         status = 3 :: non_neg_integer(),
         looks = [] :: list(),
         fc = 0 :: non_neg_integer(),
         expect_type = [] :: non_neg_integer(),
         s_ride = 0,
         team_pid :: undefined | pid(),
         matched = 0 :: non_neg_integer(),
         formation_id = 1,
         formation_lev = 1,
         mod = 0,
         speed = 0,
         join_type = 1,
         join_sub_type = 0,
         join_time = 0,
         combat_num = 0,
         constellation_lev = 0,
         lover_id = {0, "", 0},
         lover_name = "",
         lover_status = 0,
         quest_couple_round = 0}).

-record(team_recruitment,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         pid,
         type = 0,
         status = 1,
         member_num = 1,
         inviter_status = 0,
         lev_min = 0,
         lev_max = 0,
         matched = 0 :: non_neg_integer(),
         notice_list = [] :: list(),
         cur_classes = [] :: list(),
         constellation_lev = 0,
         chat_recruit_info = [],
         lover_id = {0, "", 0},
         lover_name = "",
         lover_status = 0,
         quest_couple_round = 0,
         precision_notice_list = [] :: list(),
         cross_type = 0}).

-record(team_recruit_room,
        {lev = 0, role_num = 0, members = []}).

-record(team_usurper,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         leader_objected = 0 :: 0 | 1,
         total = 0 :: integer(),
         pros = 0 :: integer(),
         cons = 0 :: integer(),
         time = 0 :: integer(),
         voted_ids = []}).

-record(team_recruit_lev_range,
        {flag = 0, lev = 0, val1 = 0, val2 = 0}).

-record(team_start_args, {pos, is_fly = 0, target = 0}).

-file("src/mod/help/help.erl", 41).

-file("inc/help.hrl", 1).

-record(m_help,
        {ver = 1,
         next_id = 1,
         free_ids = [],
         send_msg = [],
         recv_msg = [],
         ext = []}).

-record(help_state,
        {next_record_id = 1, free_record_ids = []}).

-record(help_msg,
        {id = 0,
         help_rid,
         help_id = 0,
         record_id = 0,
         time = 0,
         digit_array = [],
         str_array = [],
         ext = []}).

-record(help_record, {record_id = 0, rid}).

-record(help_data,
        {id = 0 :: pos_integer(),
         title = "",
         fun_type = 0,
         type = 0,
         help_args :: undefined | term()}).

-file("src/mod/help/help.erl", 42).

init() -> #m_help{}.

logout(Role = #role{m_help =
                        #m_help{send_msg = SendMsg}}) ->
    RtnRole = case del_help_info(SendMsg, Role) of
                  {ok, DelRole} -> DelRole;
                  _ -> Role
              end,
    MHelp = #m_help{},
    NewRole = RtnRole#role{m_help = MHelp},
    {ok, NewRole}.

info(#role{m_help = #m_help{recv_msg = RecvMsg}}) ->
    {ok, RecvMsg}.

get_sended(#role{m_help =
                     #m_help{send_msg = SendMsg}}) ->
    {ok, SendMsg}.

help(HelpId, Role) ->
    case help_data:get(HelpId) of
        Data = #help_data{} ->
            case check_help_cond(Data, Role) of
                true -> handle_help(Data, Role);
                Rtn -> Rtn
            end;
        _ ->
            logger:error("[~ts]无效的求助信息[HelpId:~w]",
                         [Role#role.name, HelpId],
                         help,
                         88),
            {false, lang:get("无法发起求助")}
    end.

check_help_cond(#help_data{fun_type = 4}, _Role) ->
    true;
check_help_cond(#help_data{fun_type = 5}, _Role) ->
    true;
check_help_cond(#help_data{fun_type = 6}, _Role) ->
    true;
check_help_cond(_HelpData,
                #role{m_team =
                          #m_team{status = 1, pid = Pid,
                                  member_num = MemberNum}})
    when is_pid(Pid) ->
    case MemberNum < 5 of
        true -> true;
        false -> {false, lang:get("您的队伍已经满了哦，无需求助啦")}
    end;
check_help_cond(_HelpData, _Role) -> true.

assist(HelpMsgId,
       Role = #role{id = SelfId,
                    m_help = #m_help{recv_msg = RecvMsg}}) ->
    case lists:keyfind(HelpMsgId, #help_msg.id, RecvMsg) of
        HelpMsg = #help_msg{help_id = HelpId,
                            help_rid = HelpRid}
            when HelpRid =/= SelfId ->
            case help_data:get(HelpId) of
                HelpData = #help_data{} ->
                    case handle_assist(HelpData, HelpMsg, Role) of
                        ok -> ok;
                        {ok, NewRole} -> {ok, NewRole};
                        Rtn -> Rtn
                    end;
                _ -> {false, lang:get("无效的求助信息")}
            end;
        #help_msg{} -> {false, lang:get("这是您自己的求助信息")};
        _ -> {false, lang:get("该求助信息已失效")}
    end.

-spec add(HelpMsg, Role) -> {ok, NewHelpMsg, NewRole} |
                            {false, string()} when HelpMsg :: #help_msg{},
                                                   NewHelpMsg :: #help_msg{},
                                                   Role :: #role{},
                                                   NewRole :: #role{}.

add(HelpMsg = #help_msg{help_id = HelpId}, Role) ->
    case help_data:get(HelpId) of
        Data = #help_data{} -> add(Data, HelpMsg, Role);
        _ ->
            logger:error("[~ts]无效的求助信息[HelpId:~w]",
                         [Role#role.name, HelpId],
                         help,
                         136),
            {false, lang:get("无法发起求助")}
    end.

add(HelpData, HelpMsg, Role) ->
    case check_add_max_cond(HelpData, HelpMsg, Role) of
        {true, NewHelpMsg} ->
            handle_add_new(HelpData, NewHelpMsg, Role);
        {same, SameMsg} ->
            handle_add_same(HelpData, HelpMsg, SameMsg, Role);
        Rtn -> Rtn
    end.

check_add_max_cond(HelpData, HelpMsg,
                   Role = #role{m_help = #m_help{send_msg = SendMsg}}) ->
    case length(SendMsg) =< 10 of
        true -> check_add_same_cond(HelpData, HelpMsg, Role);
        false -> {false, lang:get("超出同时求助次数限制")}
    end.

check_add_same_cond(#help_data{id = HelpId}, HelpMsg,
                    #role{m_help = #m_help{send_msg = SendMsg}}) ->
    case lists:keyfind(HelpId, #help_msg.help_id, SendMsg)
        of
        SameMsg = #help_msg{} -> {same, SameMsg};
        _ -> {true, HelpMsg}
    end.

handle_add_new(HelpData, HelpMsg, Role) ->
    case help_mgr:fetch_ids(1) of
        {ok, [RecordId]} ->
            NewHelpMsg = HelpMsg#help_msg{record_id = RecordId},
            handle_add(HelpData, NewHelpMsg, Role);
        _ -> {false, lang:get("无法发起求助")}
    end.

handle_add_same(HelpData, HelpMsg, SameHelpMsg, Role) ->
    case del_help_info(SameHelpMsg, Role) of
        {ok, NewRole} ->
            handle_add_new(HelpData, HelpMsg, NewRole);
        Rtn -> Rtn
    end.

handle_add(#help_data{fun_type = 1},
           HelpMsg = #help_msg{id = MsgId},
           Role = #role{m_help =
                            MHelp = #m_help{send_msg = SendMsg}}) ->
    NewSendMsg = [HelpMsg | SendMsg],
    NewMHelp = MHelp#m_help{send_msg = NewSendMsg},
    AddRole = Role#role{m_help = NewMHelp},
    TimerId = {help_msg_valid_timer, MsgId},
    Timeout = 60 * 1000,
    Timer = #timer{id = TimerId, timeout = Timeout,
                   m = help, f = help_timeout, a = [MsgId]},
    TimerRole = role_timer:add(Timer, AddRole),
    NewRole = TimerRole,
    {ok, HelpMsg, NewRole};
handle_add(#help_data{fun_type = 2},
           HelpMsg = #help_msg{id = MsgId},
           Role = #role{m_help =
                            MHelp = #m_help{send_msg = SendMsg}}) ->
    NewSendMsg = [HelpMsg | SendMsg],
    NewMHelp = MHelp#m_help{send_msg = NewSendMsg},
    AddRole = Role#role{m_help = NewMHelp},
    TimerId = {help_msg_valid_timer, MsgId},
    Timeout = 60 * 1000,
    Timer = #timer{id = TimerId, timeout = Timeout,
                   m = help, f = help_timeout, a = [MsgId]},
    TimerRole = role_timer:add(Timer, AddRole),
    NewRole = TimerRole,
    {ok, HelpMsg, NewRole};
handle_add(#help_data{fun_type = 3},
           HelpMsg = #help_msg{id = MsgId},
           Role = #role{m_help =
                            MHelp = #m_help{send_msg = SendMsg}}) ->
    NewSendMsg = [HelpMsg | SendMsg],
    NewMHelp = MHelp#m_help{send_msg = NewSendMsg},
    AddRole = Role#role{m_help = NewMHelp},
    TimerId = {help_msg_valid_timer, MsgId},
    Timeout = 60 * 1000,
    Timer = #timer{id = TimerId, timeout = Timeout,
                   m = help, f = help_timeout, a = [MsgId]},
    TimerRole = role_timer:add(Timer, AddRole),
    NewRole = TimerRole,
    {ok, HelpMsg, NewRole};
handle_add(#help_data{fun_type = 4},
           HelpMsg = #help_msg{id = MsgId},
           Role = #role{m_help =
                            MHelp = #m_help{send_msg = SendMsg}}) ->
    NewSendMsg = [HelpMsg | SendMsg],
    NewMHelp = MHelp#m_help{send_msg = NewSendMsg},
    AddRole = Role#role{m_help = NewMHelp},
    TimerId = {help_msg_valid_timer, MsgId},
    Timeout = 60 * 1000,
    Timer = #timer{id = TimerId, timeout = Timeout,
                   m = help, f = help_timeout, a = [MsgId]},
    TimerRole = role_timer:add(Timer, AddRole),
    NewRole = TimerRole,
    {ok, HelpMsg, NewRole};
handle_add(#help_data{fun_type = 5},
           HelpMsg = #help_msg{id = MsgId},
           Role = #role{m_help =
                            MHelp = #m_help{send_msg = SendMsg}}) ->
    NewSendMsg = [HelpMsg | SendMsg],
    NewMHelp = MHelp#m_help{send_msg = NewSendMsg},
    AddRole = Role#role{m_help = NewMHelp},
    TimerId = {help_msg_valid_timer, MsgId},
    Timeout = 300 * 1000,
    Timer = #timer{id = TimerId, timeout = Timeout,
                   m = help, f = help_timeout, a = [MsgId]},
    TimerRole = role_timer:add(Timer, AddRole),
    NewRole = TimerRole,
    {ok, HelpMsg, NewRole};
handle_add(#help_data{fun_type = 6},
           HelpMsg = #help_msg{id = MsgId},
           Role = #role{m_help =
                            MHelp = #m_help{send_msg = SendMsg}}) ->
    NewSendMsg = [HelpMsg | SendMsg],
    NewMHelp = MHelp#m_help{send_msg = NewSendMsg},
    AddRole = Role#role{m_help = NewMHelp},
    TimerId = {help_msg_valid_timer, MsgId},
    Timeout = 60 * 1000,
    Timer = #timer{id = TimerId, timeout = Timeout,
                   m = help, f = help_timeout, a = [MsgId]},
    TimerRole = role_timer:add(Timer, AddRole),
    NewRole = TimerRole,
    {ok, HelpMsg, NewRole};
handle_add(#help_data{fun_type = 7},
           HelpMsg = #help_msg{id = MsgId},
           Role = #role{m_help =
                            MHelp = #m_help{send_msg = SendMsg}}) ->
    NewSendMsg = [HelpMsg | SendMsg],
    NewMHelp = MHelp#m_help{send_msg = NewSendMsg},
    AddRole = Role#role{m_help = NewMHelp},
    TimerId = {help_msg_valid_timer, MsgId},
    Timeout = 60 * 1000,
    Timer = #timer{id = TimerId, timeout = Timeout,
                   m = help, f = help_timeout, a = [MsgId]},
    TimerRole = role_timer:add(Timer, AddRole),
    NewRole = TimerRole,
    {ok, HelpMsg, NewRole};
handle_add(#help_data{fun_type = 8},
           HelpMsg = #help_msg{id = MsgId},
           Role = #role{m_help =
                            MHelp = #m_help{send_msg = SendMsg}}) ->
    NewSendMsg = [HelpMsg | SendMsg],
    NewMHelp = MHelp#m_help{send_msg = NewSendMsg},
    AddRole = Role#role{m_help = NewMHelp},
    TimerId = {help_msg_valid_timer, MsgId},
    Timeout = 60 * 1000,
    Timer = #timer{id = TimerId, timeout = Timeout,
                   m = help, f = help_timeout, a = [MsgId]},
    TimerRole = role_timer:add(Timer, AddRole),
    NewRole = TimerRole,
    {ok, HelpMsg, NewRole};
handle_add(_Data, _HelpMsg, _Role) ->
    {false, lang:get("未知的求助")}.

help_timeout(Role = #role{m_help =
                              #m_help{send_msg = SendMsg}},
             MsgId) ->
    case lists:keyfind(MsgId, #help_msg.id, SendMsg) of
        HelpMsg = #help_msg{} ->
            case del_help_info(HelpMsg, Role) of
                {ok,
                 NewRole = #role{m_help =
                                     #m_help{send_msg = NewSendMsg}}} ->
                    role:link_send(NewRole, 16004, {NewSendMsg}),
                    {remove, NewRole};
                _ -> remove
            end;
        _ -> remove
    end.

leader_leave(Role = #role{m_team =
                              #m_team{status = 1, pid = TeamPid}})
    when is_pid(TeamPid) ->
    case del_team_fun_type_help([1, 2, 7], Role) of
        {ok, NewRole} -> NewRole;
        _ -> Role
    end;
leader_leave(Role) -> Role.

del_team_fun_type_help([], Role) -> {ok, Role};
del_team_fun_type_help([FunType | Rest], Role) ->
    case del_help_info_by_fun_type(Role, FunType) of
        {ok, NewRole} -> del_team_fun_type_help(Rest, NewRole);
        _ -> del_team_fun_type_help(Rest, Role)
    end.

del_help_info_by_recruit_type(Role = #role{m_help =
                                               #m_help{send_msg = SendMsg}},
                              RecruitType) ->
    Msgs = case RecruitType of
               12 ->
                   HelpFunType = 1,
                   find_help_msg_by_fun_type(SendMsg, HelpFunType, []);
               _ -> []
           end,
    case Msgs of
        [_ | _] -> del_help_info(Msgs, Role);
        _ -> ok
    end.

del_help_info_by_fun_type(Role = #role{m_help =
                                           #m_help{send_msg = SendMsg}},
                          HelpFunType) ->
    Msgs = find_help_msg_by_fun_type(SendMsg,
                                     HelpFunType,
                                     []),
    case Msgs of
        [_ | _] -> del_help_info(Msgs, Role);
        _ -> ok
    end.

del_help_info_by_id(Role, HelpId) ->
    case help_data:get(HelpId) of
        #help_data{fun_type = FunType} ->
            del_help_info_by_fun_type(Role, FunType);
        _ -> ok
    end.

del_help_info_by_cfg_id(Role, []) -> {ok, Role};
del_help_info_by_cfg_id(Role, [HelpId | T]) ->
    {ok, NRole} = del_help_info_by_cfg_id(Role, HelpId),
    del_help_info_by_cfg_id(NRole, T);
del_help_info_by_cfg_id(Role, HelpId) ->
    Msgs = find_help_msg_by_cfg_id(Role, HelpId),
    del_help_info(Msgs, Role).

find_help_msg_by_fun_type([], _FunType, Acc) -> Acc;
find_help_msg_by_fun_type([Msg = #help_msg{help_id =
                                               HelpId}
                           | Rest],
                          FunType, Acc) ->
    NewAcc = case help_data:get(HelpId) of
                 #help_data{fun_type = FunType} -> [Msg | Acc];
                 _ -> Acc
             end,
    find_help_msg_by_fun_type(Rest, FunType, NewAcc).

find_help_msg_by_cfg_id(#role{m_help =
                                  #m_help{send_msg = SendMsg}},
                        HelpId) ->
    find_help_msg_by_cfg_id(SendMsg, HelpId, []).

find_help_msg_by_cfg_id([], _HelpId, Acc) -> Acc;
find_help_msg_by_cfg_id([Msg = #help_msg{help_id =
                                             HelpId}
                         | Rest],
                        HelpId, Acc) ->
    find_help_msg_by_cfg_id(Rest, HelpId, [Msg | Acc]);
find_help_msg_by_cfg_id([_Msg | Rest], HelpId, Acc) ->
    find_help_msg_by_cfg_id(Rest, HelpId, Acc).

del_help_info([],
              Role = #role{m_help = #m_help{send_msg = SendMsg}}) ->
    role:link_send(Role, 16004, {SendMsg}),
    {ok, Role};
del_help_info([Msg | Rest], Role) ->
    NewRole = case del_help_info(Msg, Role) of
                  {ok, RtnRole} -> RtnRole;
                  _ -> Role
              end,
    del_help_info(Rest, NewRole);
del_help_info(#help_msg{record_id = RecordId,
                        id = MsgId},
              Role = #role{m_help =
                               MHelp = #m_help{send_msg = SendMsg}}) ->
    case help_mgr:lookup_help_record(RecordId) of
        {ok, []} -> {ok, Role};
        {ok, HelpRecords} ->
            async_del_help_info(HelpRecords, Role),
            help_mgr:del_help_record(RecordId),
            NewSendMsg = lists:keydelete(MsgId,
                                         #help_msg.id,
                                         SendMsg),
            NewMHelp = MHelp#m_help{send_msg = NewSendMsg},
            MHelpRole = Role#role{m_help = NewMHelp},
            TimerId = {help_msg_valid_timer, MsgId},
            NewRole = role_timer:del(TimerId, MHelpRole),
            help_mgr:free_record_id(RecordId),
            {ok, NewRole};
        _ -> {false, lang:get("没有可以删除的求助信息")}
    end.

async_del_help_info([], _Role) -> ok;
async_del_help_info([#help_record{rid = Rid,
                                  record_id = RecordId}
                     | Rest],
                    Role) ->
    case role_query:local_pid(by_id, Rid) of
        {ok, Pid} ->
            role:apply(async,
                       Pid,
                       {help, apply_del_help_info, [RecordId]}),
            ok;
        _ -> ok
    end,
    async_del_help_info(Rest, Role).

apply_del_help_info(Role, RecordId) ->
    case del_help_msg(Role, by_record_id, RecordId) of
        {ok, NewRole} -> {ok, NewRole};
        _ -> ok
    end.

ack_recv(HelpMsg = #help_msg{record_id = RecordId},
         Role = #role{id = SelfId,
                      m_help = MHelp = #m_help{recv_msg = Msgs}}) ->
    Now = date:unixtime(),
    {DelMsg, AddMsg, NewMHelp} = case check_same_msg(Msgs,
                                                     HelpMsg)
                                     of
                                     {true,
                                      DelHelpMsg = #help_msg{id = MsgId}} ->
                                         DelMsgs = lists:keydelete(MsgId,
                                                                   #help_msg.id,
                                                                   Msgs),
                                         AddHelpMsg = HelpMsg#help_msg{id =
                                                                           MsgId,
                                                                       time =
                                                                           Now},
                                         NewMsgs = [AddHelpMsg | DelMsgs],
                                         RtnMHelp = MHelp#m_help{recv_msg =
                                                                     NewMsgs},
                                         {[DelHelpMsg], [AddHelpMsg], RtnMHelp};
                                     _ ->
                                         case length(Msgs) < 10 of
                                             true ->
                                                 {ok, NextMsgId, PopMHelp} =
                                                     pop_next_id(MHelp),
                                                 #m_help{recv_msg = PopMsgs} =
                                                     PopMHelp,
                                                 AddHelpMsg =
                                                     HelpMsg#help_msg{id =
                                                                          NextMsgId,
                                                                      time =
                                                                          Now},
                                                 NewMsgs = [AddHelpMsg
                                                            | PopMsgs],
                                                 RtnMHelp =
                                                     PopMHelp#m_help{recv_msg =
                                                                         NewMsgs},
                                                 {[], [AddHelpMsg], RtnMHelp};
                                             false ->
                                                 case
                                                     lists:keysort(#help_msg.time,
                                                                   Msgs)
                                                     of
                                                     [DelHelpMsg = #help_msg{id
                                                                                 =
                                                                                 MsgId}
                                                      | RestMsgs] ->
                                                         AddHelpMsg =
                                                             HelpMsg#help_msg{id
                                                                                  =
                                                                                  MsgId,
                                                                              time
                                                                                  =
                                                                                  Now},
                                                         NewMsgs = [AddHelpMsg
                                                                    | RestMsgs],
                                                         RtnMHelp =
                                                             MHelp#m_help{recv_msg
                                                                              =
                                                                              NewMsgs},
                                                         {[DelHelpMsg],
                                                          [AddHelpMsg],
                                                          RtnMHelp};
                                                     _ ->
                                                         {ok,
                                                          NextMsgId,
                                                          PopMHelp} =
                                                             pop_next_id(MHelp),
                                                         #m_help{recv_msg =
                                                                     PopMsgs} =
                                                             PopMHelp,
                                                         AddHelpMsg =
                                                             HelpMsg#help_msg{id
                                                                                  =
                                                                                  NextMsgId,
                                                                              time
                                                                                  =
                                                                                  Now},
                                                         NewMsgs = [AddHelpMsg
                                                                    | PopMsgs],
                                                         RtnMHelp =
                                                             PopMHelp#m_help{recv_msg
                                                                                 =
                                                                                 NewMsgs},
                                                         {[],
                                                          [AddHelpMsg],
                                                          RtnMHelp}
                                                 end
                                         end
                                 end,
    HelpRecord = #help_record{record_id = RecordId,
                              rid = SelfId},
    help_mgr:set(help_record_tab, HelpRecord),
    NewRole = Role#role{m_help = NewMHelp},
    logger:debug("[~ts]收到求助RecordId:~w",
                 [NewRole#role.name, RecordId],
                 help,
                 487),
    logger:debug("[~ts]协议:~w  ~w",
                 [NewRole#role.name, AddMsg, DelMsg],
                 help,
                 488),
    help_mgr:del_recv_msg_record(DelMsg, NewRole),
    push_help_msg(AddMsg, DelMsg, NewRole),
    NewRole;
ack_recv(_Unknow, Role) ->
    logger:debug("求助错误格式 ~w", [_Unknow], help, 493),
    Role.

del_help_msg(Role = #role{m_help =
                              MHelp = #m_help{recv_msg = RecvMsg}},
             by_msg_id, MsgId) ->
    case lists:keyfind(MsgId, #help_msg.id, RecvMsg) of
        HelpMsg = #help_msg{} ->
            NewRecvMsg = lists:keydelete(MsgId,
                                         #help_msg.id,
                                         RecvMsg),
            DelMHelp = MHelp#m_help{recv_msg = NewRecvMsg},
            {ok, NewMHelp} = free_id(DelMHelp, MsgId),
            NewRole = Role#role{m_help = NewMHelp},
            push_help_msg([], [HelpMsg], NewRole),
            {ok, NewRole};
        _False ->
            logger:debug("[~ts]删除不匹配的求助信息[False:~w]",
                         [Role#role.name, _False],
                         help,
                         508),
            {false, lang:get("删除无效的求助信息")}
    end;
del_help_msg(Role = #role{m_help =
                              MHelp = #m_help{recv_msg = RecvMsg}},
             by_record_id, RecordId) ->
    case lists:keyfind(RecordId,
                       #help_msg.record_id,
                       RecvMsg)
        of
        HelpMsg = #help_msg{id = MsgId} ->
            NewRecvMsg = lists:keydelete(MsgId,
                                         #help_msg.id,
                                         RecvMsg),
            DelMHelp = MHelp#m_help{recv_msg = NewRecvMsg},
            {ok, NewMHelp} = free_id(DelMHelp, MsgId),
            NewRole = Role#role{m_help = NewMHelp},
            push_help_msg([], [HelpMsg], NewRole),
            {ok, NewRole};
        _False ->
            logger:debug("[~ts]删除不匹配的求助信息[False:~w][RecordId:~w]",
                         [Role#role.name, _False, RecordId],
                         help,
                         522),
            {false, lang:get("删除无效的求助信息")}
    end;
del_help_msg(_Role, _Label, _Id) ->
    logger:debug("[~ts]删除不匹配的求助信息[False:~w]",
                 [_Role#role.name, {_Label, _Id}],
                 help,
                 526),
    {false, lang:get("删除无效的求助信息")}.

pop_next_id(State = #help_state{next_record_id =
                                    NextRecordId,
                                free_record_ids = FreeIds}) ->
    {NextId, NewFreeIds, NewNextRecordId} =
        pop_next_id(FreeIds, NextRecordId),
    NewState = State#help_state{next_record_id =
                                    NewNextRecordId,
                                free_record_ids = NewFreeIds},
    {ok, NextId, NewState};
pop_next_id(MHelp = #m_help{next_id = NextId,
                            free_ids = FreeIds}) ->
    {RtnNextId, NewFreeIds, NewNextId} =
        pop_next_id(FreeIds, NextId),
    NewMHelp = MHelp#m_help{next_id = NewNextId,
                            free_ids = NewFreeIds},
    {ok, RtnNextId, NewMHelp}.

pop_next_id([], NextId) -> {NextId, [], NextId + 1};
pop_next_id([Id | Rest], NextId) -> {Id, Rest, NextId}.

free_id(MHelp = #m_help{free_ids = FreeIds}, Id) ->
    {ok, MHelp#m_help{free_ids = [Id | FreeIds]}};
free_id(State = #help_state{free_record_ids = FreeIds},
        Id) ->
    {ok,
     State#help_state{free_record_ids = [Id | FreeIds]}};
free_id(Unknow, _Id) ->
    logger:error("未知的资源结构:~w", [Unknow], help, 547),
    {ok, Unknow}.

push_help_msg(NewMsgList, DelMsgList, Role) ->
    role:link_send(Role, 16002, {NewMsgList, DelMsgList}),
    ok.

check_same_msg([], _) -> false;
check_same_msg([Msg = #help_msg{help_id = HelpId,
                                help_rid = HelpRid}
                | _Rest],
               #help_msg{help_id = HelpId, help_rid = HelpRid}) ->
    {true, Msg};
check_same_msg([_ | Rest], HelpMsg) ->
    check_same_msg(Rest, HelpMsg).

handle_help(HelpData = #help_data{fun_type = 1},
            Role) ->
    quest_prac:help(HelpData, Role);
handle_help(HelpData = #help_data{fun_type = 2},
            Role) ->
    quest_chain:help(HelpData, Role);
handle_help(HelpData = #help_data{fun_type = 3},
            Role) ->
    trial:ask_help(Role, HelpData);
handle_help(HelpData = #help_data{fun_type = 6},
            Role) ->
    examination:ask_help(Role, HelpData);
handle_help(HelpData = #help_data{fun_type = 7},
            Role) ->
    lev_break:help(HelpData, Role);
handle_help(HelpData = #help_data{fun_type = 8},
            Role) ->
    dungeon_team:ask_help(Role, HelpData);
handle_help(_HelpData, _Role) ->
    {false, lang:get("无法发起求助")}.

handle_assist(HelpData = #help_data{fun_type = 1},
              HelpMsg, Role) ->
    quest_prac:assist(HelpData, HelpMsg, Role);
handle_assist(HelpData = #help_data{fun_type = 2},
              HelpMsg, Role) ->
    quest_chain:assist(HelpData, HelpMsg, Role);
handle_assist(HelpData = #help_data{fun_type = 3},
              HelpMsg, Role) ->
    trial:answer_help(Role, HelpMsg, HelpData);
handle_assist(HelpData = #help_data{fun_type = 8},
              HelpMsg, Role) ->
    dungeon_team:answer_help(Role, HelpMsg, HelpData);
handle_assist(#help_data{fun_type = 4}, HelpMsg,
              Role) ->
    role:send_buff_begin(),
    case campaign_bags:assist(Role, HelpMsg) of
        {ok, Role1} ->
            role:send_buff_flush(),
            {ok, Role1};
        Else ->
            role:send_buff_clean(),
            Else
    end;
handle_assist(#help_data{fun_type = 5}, HelpMsg,
              Role) ->
    role:send_buff_begin(),
    case camp_fruit:assist(Role, HelpMsg) of
        {ok, Role1} ->
            role:send_buff_flush(),
            {ok, Role1};
        ok ->
            role:send_buff_flush(),
            ok;
        Else ->
            role:send_buff_clean(),
            Else
    end;
handle_assist(#help_data{fun_type = 6}, HelpMsg,
              Role) ->
    examination:assist(Role, HelpMsg);
handle_assist(HelpData = #help_data{fun_type = 7},
              HelpMsg, Role) ->
    lev_break:assist(HelpData, HelpMsg, Role);
handle_assist(_HelpData, _HelpMsg, _Role) ->
    {false, lang:get("无效的求助信息")}.

