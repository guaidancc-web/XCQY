-file("src/mod/preparation/preparation_role.erl", 1).

-module(preparation_role).

-export([init/0,
         init_cache/0,
         update/1,
         delete/1,
         lookup/1,
         login/1,
         logout/1,
         join/2,
         join_to_follow/2,
         leave/1,
         match/1,
         unmatch/1,
         offline/1,
         callback/2,
         callback/4,
         push/2]).

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

-file("src/mod/preparation/preparation_role.erl", 28).

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

-file("src/mod/preparation/preparation_role.erl", 29).

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

-file("src/mod/preparation/preparation_role.erl", 30).

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

-file("src/mod/preparation/preparation_role.erl", 31).

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

-file("src/mod/preparation/preparation_role.erl", 32).

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

-file("src/mod/preparation/preparation_role.erl", 33).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/preparation/preparation_role.erl", 34).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/preparation/preparation_role.erl", 35).

-file("inc/preparation.hrl", 1).

-record(m_preparation,
        {ver = 0,
         pid :: undefined | pid(),
         id = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer()}).

-record(preparation_room,
        {ver = 0,
         id = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         map_id = 0 :: non_neg_integer(),
         map_pid :: undefined | pid(),
         matching = [] :: list(),
         num = 1,
         matched = 0 :: non_neg_integer(),
         match_ref :: undefined | reference(),
         mode = 1,
         is_open = true :: boolean()}).

-record(preparation_team,
        {ids = [] :: list(),
         origin_ids = [] :: list(),
         num = 1 :: non_neg_integer(),
         sum_lev = 0 :: non_neg_integer(),
         max_lev = 0 :: non_neg_integer(),
         min_lev = 0 :: non_neg_integer(),
         tried_match = 0 :: non_neg_integer(),
         room_id = 0 :: non_neg_integer(),
         order = [] :: list(),
         classes = [] :: list()}).

-record(preparation_role,
        {ver = 0,
         id = {0, "", 0},
         name = "",
         pid :: undefined | pid(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         looks = [] :: list(),
         fc = 0 :: non_neg_integer(),
         room_id = 0 :: non_neg_integer(),
         s_ride = 0,
         preparation_pid :: undefined | pid(),
         matched = 0 :: non_neg_integer(),
         formation_id = 1,
         formation_lev = 1,
         team_id = [] :: list(),
         partner = [] :: list(),
         group = 1 :: non_neg_integer()}).

-record(preparation_show_role,
        {id = {0, "", 0},
         name = "",
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         group = 1 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         looks = [] :: list()}).

-file("src/mod/preparation/preparation_role.erl", 36).

init() -> #m_preparation{}.

offline(MP = #m_preparation{}) ->
    MP#m_preparation{pid = undefined}.

init_cache() ->
    ets:new(preparation_role,
            [set,
             named_table,
             public,
             {keypos, #preparation_role.id}]).

lookup(Id) -> ets:lookup(preparation_role, Id).

update([]) -> ok;
update([H | T]) ->
    update(H),
    update(T);
update(R = #preparation_role{}) ->
    ets:insert(preparation_role, R).

delete(#preparation_role{id = Id}) -> delete(Id);
delete(Id) -> ets:delete(preparation_role, Id).

login(Role = #role{s_event = 42,
                   m_preparation = MP = #m_preparation{id = RoomId},
                   pos = Pos}) ->
    case call(RoomId, preparation_room, lookup, [RoomId]) of
        [#preparation_room{pid = Pid, is_open = true}] ->
            case preparation_room:lookup(RoomId) of
                [#preparation_room{map_id = MapId}] ->
                    {ok,
                     Role#role{m_preparation = MP#m_preparation{pid = Pid},
                               pos = Pos#pos{map = MapId}}};
                _ ->
                    {LMapId, Lx, Ly} = util:rand_list([{10001, 306, 3507},
                                                       {10001, 2583, 3848},
                                                       {10001, 4957, 3680},
                                                       {10001, 445, 2565},
                                                       {10001, 4646, 704},
                                                       {10001, 841, 1033},
                                                       {10001, 2098, 1834},
                                                       {10001, 3617, 1816}]),
                    NewPos = Pos#pos{map = LMapId, x = Lx, y = Ly},
                    {ok, Role#role{s_event = 0, pos = NewPos}}
            end;
        _ ->
            {LMapId, Lx, Ly} = util:rand_list([{10001, 306, 3507},
                                               {10001, 2583, 3848},
                                               {10001, 4957, 3680},
                                               {10001, 445, 2565},
                                               {10001, 4646, 704},
                                               {10001, 841, 1033},
                                               {10001, 2098, 1834},
                                               {10001, 3617, 1816}]),
            NewPos = Pos#pos{map = LMapId, x = Lx, y = Ly},
            {ok, Role#role{s_event = 0, pos = NewPos}}
    end;
login(_) -> ok.

logout(#role{s_event = 42, id = Id,
             m_preparation = #m_preparation{pid = Pid}}) ->
    preparation_room:logout(Pid, Id),
    ok;
logout(_) -> ok.

join(#role{s_event = 42}, _RoomId) ->
    {false, lang:get("当前已经在准备厅中了")};
join(#role{cross_type = CrossType}, _RoomId)
    when CrossType =/= 0 ->
    {false, lang:get("只能在本服进入匹配大厅哦")};
join(Role = #role{name = Name}, RoomId) ->
    case check_join([{room_id, RoomId}], Role) of
        ok ->
            Registrant = to(Role, RoomId),
            case preparation_room:enter(Registrant) of
                {ok, Args = #{pid := Pid}} ->
                    ToPos = get_pos(Args),
                    Role1 = Role#role{s_event = 42,
                                      m_preparation =
                                          #m_preparation{id = RoomId,
                                                         pid = Pid}},
                    TeamEvt = make_team_event(Role1, RoomId, Pid),
                    case map:role_enter(ToPos, TeamEvt, Role1) of
                        {error, Reason} ->
                            logger:error("[~ts]进入匹配大厅失败:~w",
                                         [Name, Reason],
                                         preparation_role,
                                         113),
                            {false, lang:get("进入匹配大厅失败")};
                        {ok, NewRole} ->
                            push(NewRole, 18300),
                            team:stop_recruiting(NewRole),
                            {ok, NewRole}
                    end;
                EnterFail -> EnterFail
            end;
        Else -> Else
    end.

join_to_follow(Role, RoomId) ->
    case join(Role, RoomId) of
        {ok, NewRole} ->
            team:follow(NewRole),
            {ok, NewRole};
        {false, Why} ->
            Msg = util:flist(lang:get("~ts，无法归队"), [Why]),
            notice:send(Role, 1, Msg)
    end.

leave(#role{s_event = 42,
            m_preparation = #m_preparation{status = 1}}) ->
    {false, lang:get("当前在匹配中，请先取消匹配")};
leave(#role{s_event = 42,
            m_team = #m_team{status = 2, pid = Pid}})
    when is_pid(Pid) ->
    {false, lang:get("跟随队伍中，请让队长操作")};
leave(Role = #role{s_event = 42,
                   m_preparation =
                       #m_preparation{status = 2, pid = Pid, id = RoomId},
                   id = Id, name = Name}) ->
    case preparation_room:check_leave(Pid, Id) of
        ok ->
            Role1 = looks:calc(Role#role{s_event = 0,
                                         s_event_pid = undefined,
                                         m_preparation = init()}),
            ToPos = util:rand_list([{10001, 306, 3507},
                                    {10001, 2583, 3848},
                                    {10001, 4957, 3680},
                                    {10001, 445, 2565},
                                    {10001, 4646, 704},
                                    {10001, 841, 1033},
                                    {10001, 2098, 1834},
                                    {10001, 3617, 1816}]),
            TeamEvt = make_team_event(Role1, RoomId, Pid),
            case map:role_enter(ToPos, TeamEvt, Role1) of
                {error, Reason} ->
                    logger:error("[~ts]退出准备区失败:~w",
                                 [Name, Reason],
                                 preparation_role,
                                 149),
                    {false, lang:get("退出准备区失败")};
                {ok, NewRole} ->
                    push(NewRole, 18300),
                    {ok, NewRole}
            end;
        Else -> Else
    end;
leave(Role = #role{s_event = 42,
                   m_preparation = #m_preparation{pid = Pid, id = RoomId},
                   name = Name, id = Id}) ->
    preparation_room:leave(Pid, Id),
    Role1 = looks:calc(Role#role{s_event = 0,
                                 s_event_pid = undefined,
                                 m_preparation = init()}),
    ToPos = util:rand_list([{10001, 306, 3507},
                            {10001, 2583, 3848},
                            {10001, 4957, 3680},
                            {10001, 445, 2565},
                            {10001, 4646, 704},
                            {10001, 841, 1033},
                            {10001, 2098, 1834},
                            {10001, 3617, 1816}]),
    TeamEvt = make_team_event(Role1, RoomId, Pid),
    case map:role_enter(ToPos, TeamEvt, Role1) of
        {error, Reason} ->
            logger:error("[~ts]退出准备区失败:~w",
                         [Name, Reason],
                         preparation_role,
                         164),
            {false, lang:get("退出准备区失败")};
        {ok, NewRole} ->
            push(NewRole, 18300),
            {ok, NewRole}
    end;
leave(_Role) -> {false, lang:get("不在大厅中")}.

match(#role{s_event = 42,
            m_preparation = #m_preparation{status = 1}}) ->
    {false, lang:get("你已经在匹配中，请稍等")};
match(#role{s_event = 42,
            m_preparation = #m_preparation{status = 2}}) ->
    {false, lang:get("已经匹配上了，请稍等")};
match(#role{s_event = 42,
            m_team = #m_team{status = 2, pid = Pid}})
    when is_pid(Pid) ->
    {false, lang:get("跟随队伍中，请让队长操作")};
match(Role = #role{s_event = 42,
                   m_preparation =
                       MP = #m_preparation{pid = Pid, id = RoomId},
                   id = Id}) ->
    case check_team_mate(Role) of
        {ok, []} -> {false, lang:get("匹配失败")};
        {ok, TeamMates0} ->
            TeamMates = set_partner(TeamMates0),
            case preparation_room:match(Pid, TeamMates) of
                ok ->
                    [role:apply(async,
                                MPid,
                                {preparation_role,
                                 callback,
                                 [{follow_match, RoomId}]})
                     || #preparation_role{pid = MPid, id = Mid} <- TeamMates,
                        Mid =/= Id],
                    Role1 = Role#role{m_preparation =
                                          MP#m_preparation{status = 1}},
                    push(Role1, 18300),
                    {ok, Role1};
                MatchFail -> MatchFail
            end;
        Else -> Else
    end;
match(_Role) -> {false, lang:get("不在准备区中不能匹配")}.

unmatch(#role{s_event = 42,
              m_preparation = #m_preparation{status = 2}}) ->
    {false, lang:get("已经匹配上了，请稍等")};
unmatch(#role{s_event = 42,
              m_preparation = #m_preparation{status = Status}})
    when Status =/= 1 ->
    {false, lang:get("还没开始匹配，不用取消")};
unmatch(Role = #role{s_event = 42,
                     m_preparation = MP = #m_preparation{pid = Pid},
                     id = Id}) ->
    preparation_room:unmatch(Pid, Id),
    Role1 = Role#role{m_preparation =
                          MP#m_preparation{status = 0}},
    push(Role1, 18300),
    {ok, Role1};
unmatch(_Role) -> {false, lang:get("不在准备区中")}.

callback(Role = #role{s_event = 42,
                      m_preparation = MP = #m_preparation{id = RoomId}},
         {follow_match, RoomId}) ->
    NewRole = Role#role{m_preparation =
                            MP#m_preparation{status = 1}},
    push(NewRole, 18300),
    push(NewRole, {18303, {1, lang:get("开始匹配")}}),
    map:role_update(NewRole),
    {ok, NewRole};
callback(Role = #role{s_event = 42,
                      m_preparation = MP = #m_preparation{id = RoomId}},
         {unmatch, RoomId}) ->
    NewRole = Role#role{m_preparation =
                            MP#m_preparation{status = 0}},
    push(NewRole, 18300),
    push(NewRole, {18304, {1, lang:get("匹配已取消")}}),
    map:role_update(NewRole),
    {ok, NewRole};
callback(Role = #role{s_event = 42,
                      m_preparation = MP = #m_preparation{id = RoomId}},
         {set_status, RoomId, Status}) ->
    NewRole = Role#role{m_preparation =
                            MP#m_preparation{status = Status}},
    push(NewRole, 18300),
    map:role_update(NewRole),
    {ok, NewRole};
callback(Role = #role{s_event = 42, name = Name},
         clear) ->
    Role2 = case unmatch(Role) of
                {ok, Role1} -> Role1;
                _ -> Role
            end,
    Role3 = looks:calc(Role2#role{s_event = 0,
                                  s_event_pid = undefined,
                                  m_preparation = init()}),
    ToPos = util:rand_list([{10001, 306, 3507},
                            {10001, 2583, 3848},
                            {10001, 4957, 3680},
                            {10001, 445, 2565},
                            {10001, 4646, 704},
                            {10001, 841, 1033},
                            {10001, 2098, 1834},
                            {10001, 3617, 1816}]),
    case map:role_enter(ToPos, preparation, Role3) of
        {error, Reason} ->
            logger:error("[~ts]退出准备区失败:~w",
                         [Name, Reason],
                         preparation_role,
                         252),
            {ok, Role3};
        {ok, NewRole} ->
            push(NewRole, 18300),
            {ok, NewRole}
    end;
callback(Role = #role{s_event = 42}, leave) ->
    Role2 = case unmatch(Role) of
                {ok, Role1} -> Role1;
                _ -> Role
            end,
    case leave(Role2) of
        {ok, NewRole} -> {ok, NewRole};
        _ -> {ok, Role2}
    end;
callback(_, _Info) ->
    logger:error("无效回调 ~w", [_Info], preparation_role, 270),
    ok.

callback(_, Role = #role{name = _Name}, _,
         {follow_join, RoomId, Pid}) ->
    NewRole = Role#role{m_preparation =
                            #m_preparation{id = RoomId, pid = Pid}},
    push(NewRole, 18300),
    map:role_update(NewRole),
    {ok, NewRole};
callback(_, Role = #role{}, _, follow_leave) ->
    NewRole = Role#role{m_preparation = #m_preparation{}},
    push(NewRole, 18300),
    map:role_update(NewRole),
    {ok, NewRole}.

push(#role{link = #link{conn_pid = ConnPid},
           s_event = 42,
           m_preparation =
               #m_preparation{id = Id, status = Status}},
     Cmd = 18300) ->
    sys_conn:pack_send(ConnPid, Cmd, {Status, Id});
push(#role{link = #link{conn_pid = ConnPid},
           s_event = 42},
     {Cmd, Data}) ->
    sys_conn:pack_send(ConnPid, Cmd, Data);
push(_, _) -> ok.

to(#role{id = Id, name = Name, lev = Lev, pid = Pid,
         sex = Sex, classes = Classes,
         m_lev_break = #m_lev_break{times = Times}},
   RoomId) ->
    #preparation_role{id = Id, name = Name,
                      lev = Lev + 6 * Times, room_id = RoomId, pid = Pid,
                      sex = Sex, classes = Classes};
to(#team_mate{id = Id, name = Name, lev = Lev,
              pid = Pid, sex = Sex, classes = Classes,
              lev_break_times = BreakTimes},
   RoomId) ->
    #preparation_role{id = Id, name = Name,
                      lev = Lev + 6 * BreakTimes, room_id = RoomId, pid = Pid,
                      sex = Sex, classes = Classes}.

check_join([], _) -> ok;
check_join([{room_id, RoomId} | T], Role) ->
    case
        (preparation_cfg:get_module(RoomId)):check_join(Role)
        of
        ok -> check_join(T, Role);
        Else -> Else
    end.

get_pos(#{platform := P, zone_id := Z, map_id := MapId,
          map_base := MapBase}) ->
    {X, Y} = map:rand_pos(MapBase),
    {P, Z, MapId, X, Y}.

make_team_event(Role = #role{s_event = Event}, RoomId,
                Pid) ->
    case check_team(Role) of
        [] -> self;
        MateIds when Event =:= 42 ->
            #{label => enter_event, event => Event,
              role_ids => MateIds,
              mfa =>
                  {preparation_role,
                   callback,
                   [{follow_join, RoomId, Pid}]}};
        MateIds ->
            #{label => exit_event, event => Event,
              role_ids => MateIds,
              mfa => {preparation_role, callback, [follow_leave]}}
    end.

check_team(Role = #role{m_team =
                            #m_team{pid = Pid, status = 1}})
    when is_pid(Pid) ->
    case team:get_members(Role) of
        TeamList = [_ | _] ->
            [Id || #team_mate{id = Id, status = 2} <- TeamList];
        _ -> []
    end;
check_team(_) -> [].

check_team_mate(Role = #role{m_preparation =
                                 #m_preparation{id = RoomId}}) ->
    TeamLimit = case preparation_data:get(RoomId) of
                    #{team_limit := Limit} -> Limit;
                    _ -> 5
                end,
    case
        (preparation_cfg:get_module(RoomId)):check_match(Role)
        of
        {ok, [H | T]} when length([H | T]) > TeamLimit ->
            {false,
             notice:format(lang:get("队伍人数不能大于~ts人"),
                           [{string_2, 5, TeamLimit}])};
        {ok, [H | T]} ->
            {ok,
             [to(Mate, RoomId) || Mate = #team_mate{} <- [H | T]]};
        Else -> Else
    end.

set_partner([]) -> [];
set_partner([H = #preparation_role{id = Id, partner = P}
             | T]) ->
    NH = H#preparation_role{partner =
                                P ++ [Mid || #preparation_role{id = Mid} <- T]},
    [NH | set_partner([M#preparation_role{partner =
                                              [Id | MP]}
                       || M = #preparation_role{partner = MP} <- T])].

call(RoomId, M, F, A) ->
    case preparation_data:get(RoomId) of
        #{mode := 1} -> big_world:call(M, F, A);
        _ -> erlang:apply(M, F, A)
    end.

