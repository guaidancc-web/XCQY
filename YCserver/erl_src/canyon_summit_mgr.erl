-file("src/mod/canyon_summit/canyon_summit_mgr.erl", 1).

-module(canyon_summit_mgr).

-author(hugh).

-behaviour(gen_fsm).

-export([start_link/0,
         m/1,
         call/1,
         cast/1,
         info/1,
         next/0,
         reload/0,
         reset/0,
         update/2,
         send_msg/1,
         get_team/0,
         gm_clear_team/0,
         get_result/0]).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

-export([idle/2,
         notice/2,
         ready/2,
         calculate/2,
         battle_ready/2,
         battle_active/2,
         ending/2]).

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

-file("src/mod/canyon_summit/canyon_summit_mgr.erl",
      41).

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

-file("src/mod/canyon_summit/canyon_summit_mgr.erl",
      42).

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

-file("src/mod/canyon_summit/canyon_summit_mgr.erl",
      43).

-file("inc/canyon_summit.hrl", 1).

-record(canyon_summit_role,
        {id = {0, "", 0} :: tuple(),
         ver = 1,
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         win = 0 :: non_neg_integer(),
         lost = 0 :: non_neg_integer(),
         group_id = 0 :: non_neg_integer(),
         fight = 0 :: non_neg_integer(),
         movability = 1000 :: non_neg_integer(),
         match_id = 0 :: non_neg_integer(),
         side = 1,
         pid :: undefined | reference(),
         last_killed = 0 :: non_neg_integer(),
         picked = 0 :: non_neg_integer(),
         last_win = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         operating_unit = 0 :: 0 | tuple(),
         last_operated = 0 :: non_neg_integer(),
         attacked_unit = 0 :: non_neg_integer(),
         guarded_unit = 0 :: non_neg_integer(),
         cannon_attacked = 0 :: non_neg_integer(),
         cannon_used = 0 :: non_neg_integer(),
         guarding_unit = 0 :: non_neg_integer(),
         operating_num = 0 :: non_neg_integer()}).

-record(canyon_summit_side,
        {id = {0, 0, 0} :: {integer(), integer(), integer()},
         win = 0 :: non_neg_integer(),
         lost = 0 :: non_neg_integer(),
         movability = 0 :: non_neg_integer(),
         member_num = 0 :: non_neg_integer(),
         members = [],
         remain_num = 0,
         map_id = 0 :: non_neg_integer(),
         match_pid = 0 :: pid(),
         time = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         duration = 0 :: non_neg_integer(),
         attacked_unit = 0 :: non_neg_integer(),
         guarded_unit = 0 :: non_neg_integer(),
         remain_unit = 3 :: non_neg_integer(),
         subsidize_buff = [] :: list(),
         all_fc = 0 :: non_neg_integer()}).

-record(canyon_summit_team,
        {ver = 1 :: pos_integer(),
         match_group = 0,
         leader = {0, "", 0},
         member_num = 0,
         members = [],
         fight_capacity = 0,
         team_side = 0,
         battle_id = 0,
         match_pid = undefined :: pid(),
         map_id = 0}).

-record(canyon_summit_match,
        {id = {0, 0} :: {non_neg_integer(), non_neg_integer()},
         pid :: undefined | pid(),
         map_id = 0 :: non_neg_integer(),
         map_pid = 0 :: pid(),
         battle_id = 0 :: non_neg_integer(),
         battle_pid = 0 :: pid(),
         win_side = 0,
         combat_time = 0,
         is_judge = false,
         cannon_ready = false,
         time = 0 :: non_neg_integer()}).

-record(canyon_summit_info,
        {id = {0, 0},
         group_id = 0,
         match_id = 0,
         map_id = 0,
         match_pid = 0,
         black_num = 0,
         red_num = 0,
         black_fc = 0,
         red_fc = 0,
         black_team_num = 0,
         red_team_num = 0}).

-record(canyon_summit_unit,
        {id = {0, 0, 0} :: tuple(),
         match_id = 0 :: non_neg_integer(),
         group_id = 0 :: non_neg_integer(),
         battle_id = 0 :: non_neg_integer(),
         side = 0,
         duration = 1000 :: non_neg_integer(),
         operators = [] :: list(),
         last_operated = 0 :: non_neg_integer()}).

-record(canyon_summit_operator,
        {id = {0, "", 0} :: tuple(),
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         side = 0,
         timeout = 0 :: non_neg_integer()}).

-record(canyon_summit_result,
        {id = {0, 0},
         red_fc = 0,
         red_team_num = 0,
         red_role_num = 0,
         black_fc = 0,
         black_team_num = 0,
         black_role_num = 0,
         red_acc_team = 0,
         black_acc_team = 0,
         red_acc_role = 0,
         black_acc_role = 0}).

-file("src/mod/canyon_summit/canyon_summit_mgr.erl",
      44).

-file("inc/looks.hrl", 1).

-file("src/mod/canyon_summit/canyon_summit_mgr.erl",
      45).

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

-file("src/mod/canyon_summit/canyon_summit_mgr.erl",
      46).

-file("inc/rank.hrl", 1).

-record(rank,
        {type = 1,
         show_list = [],
         list = [],
         last_val = 0,
         len = 0}).

-record(rank_rc,
        {ver = 3 :: pos_integer(),
         id = {roleid, platform, zoneid} :: term(),
         rank = 1,
         time = 0 :: non_neg_integer(),
         role_id = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: list(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = "",
         pet,
         guard,
         eqm}).

-record(rank_cfg,
        {type = 0 :: non_neg_integer(),
         num = 100 :: non_neg_integer(),
         keys = [#rank_rc.val3, #rank_rc.val2, #rank_rc.val1] ::
             [pos_integer()],
         min_val = 1 :: pos_integer(),
         nologin = 0 :: non_neg_integer(),
         zone = rank_zone_1 :: atom()}).

-file("src/mod/canyon_summit/canyon_summit_mgr.erl",
      47).

-record(state,
        {ts = 0,
         timeout = infinity,
         zone_nextid = 1,
         zone_list = []}).

start_link() ->
    gen_fsm:start_link({local, canyon_summit_mgr},
                       canyon_summit_mgr,
                       [],
                       []).

reload() -> canyon_summit_mgr ! reload.

m(Event) ->
    gen_fsm:send_event(canyon_summit_mgr, Event).

info(Msg) -> canyon_summit_mgr ! Msg.

call(Msg) ->
    case catch
             gen_fsm:sync_send_all_state_event(canyon_summit_mgr,
                                               Msg)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

cast(Msg) ->
    logger:debug("~w", [Msg], canyon_summit_mgr, 87),
    gen_fsm:send_all_state_event(canyon_summit_mgr, Msg).

init([]) ->
    process_flag(trap_exit, true),
    ets:new(canyon_summit_role,
            [set,
             named_table,
             public,
             {keypos, #canyon_summit_role.id}]),
    ets:new(canyon_summit_team,
            [set,
             named_table,
             public,
             {keypos, #canyon_summit_team.leader}]),
    ets:new(canyon_summit_side,
            [set,
             named_table,
             public,
             {keypos, #canyon_summit_side.id}]),
    ets:new(canyon_summit_match,
            [set,
             named_table,
             public,
             {keypos, #canyon_summit_match.id}]),
    ets:new(canyon_summit_unit,
            [set,
             named_table,
             public,
             {keypos, #canyon_summit_unit.id}]),
    ets:new(canyon_summit_info,
            [set,
             named_table,
             public,
             {keypos, #canyon_summit_info.id}]),
    ets:new(canyon_summit_result,
            [set,
             named_table,
             public,
             {keypos, #canyon_summit_result.id}]),
    {StateName, TimeOut} = get_state(),
    State = #state{ts = date:now2(), timeout = TimeOut},
    ToClient = case StateName of
                   idle -> 0;
                   notice -> 1;
                   ready -> 2;
                   battle_active -> 5
               end,
    cross:cast(all,
               canyon_summit_agent,
               info,
               [{update_state, ToClient, date:now2(), TimeOut}]),
    GroupList = canyon_summit_data:get_all_group(),
    GroupNum = lists:max(GroupList),
    env:set(canyon_group_num, GroupNum),
    logger:info("峡谷之巅活动启动完成", [], canyon_summit_mgr, 124),
    {ok, StateName, State, TimeOut}.

handle_event({exit_place, GroupId}, StateName, State) ->
    NewState = zone_exit(GroupId, State),
    continue(StateName, NewState);
handle_event({cast_chat_msg, Rid, 10400, WorldData},
             StateName, State)
    when StateName =:= battle_ready orelse
             StateName =:= battle_active ->
    logger:debug("==================~w",
                 [Rid],
                 canyon_summit_mgr,
                 132),
    case ets:lookup(canyon_summit_role, Rid) of
        [#canyon_summit_role{pid = Pid, group_id = GroupId,
                             match_id = MatchId, side = Side}]
            when is_pid(Pid) ->
            case ets:lookup(canyon_summit_side,
                            {GroupId, MatchId, Side})
                of
                [#canyon_summit_side{members = Members}] ->
                    [begin
                         case ets:lookup(canyon_summit_role, Id) of
                             [#canyon_summit_role{pid = RPid}]
                                 when is_pid(RPid) ->
                                 role:pack_send(RPid, 10400, WorldData);
                             _ -> ok
                         end
                     end
                     || Id <- Members];
                _ ->
                    logger:error("未找到该阵营~w",
                                 [{GroupId, MatchId, Side}],
                                 canyon_summit_mgr,
                                 145),
                    ok
            end;
        _ ->
            logger:error("未找到该角色~w", [Rid], canyon_summit_mgr, 149),
            ok
    end,
    continue(StateName, State);
handle_event({cast_chat_msg, Rid, 10400, _WorldData},
             StateName, State) ->
    notice:send(Rid, 1, lang:get("还没有加入阵营")),
    continue(StateName, State);
handle_event(_Event, StateName, State) ->
    logger:error("未知消息 ~w",
                 [_Event],
                 canyon_summit_mgr,
                 158),
    continue(StateName, State).

handle_sync_event(get_status, _From, idle,
                  State = #state{ts = Ts, timeout = Timeout}) ->
    continue({0, Ts, Timeout}, idle, State);
handle_sync_event(get_status, _From, notice,
                  State = #state{ts = Ts, timeout = Timeout}) ->
    continue({1, Ts, Timeout}, notice, State);
handle_sync_event(get_status, _From, ready,
                  State = #state{ts = Ts, timeout = Timeout}) ->
    continue({2, Ts, Timeout}, ready, State);
handle_sync_event(get_status, _From, calculate,
                  State = #state{ts = Ts, timeout = Timeout}) ->
    continue({3, Ts, Timeout}, calculate, State);
handle_sync_event(get_status, _From, battle_ready,
                  State = #state{ts = Ts, timeout = Timeout}) ->
    continue({4, Ts, Timeout}, battle_ready, State);
handle_sync_event(get_status, _From, battle_active,
                  State = #state{ts = Ts, timeout = Timeout}) ->
    continue({5, Ts, Timeout}, battle_active, State);
handle_sync_event(get_status, _From, ending,
                  State = #state{ts = Ts, timeout = Timeout}) ->
    continue({6, Ts, Timeout}, ending, State);
handle_sync_event({enter, _, _}, _From, idle, State) ->
    continue({false, lang:get("活动未开启")}, idle, State);
handle_sync_event({enter, GroupId, Num}, _From,
                  StateName, State)
    when StateName =:= ready ->
    {ReplyData, NState} = do_enter(State, GroupId, Num),
    continue(ReplyData, StateName, NState);
handle_sync_event({enter, _, _}, _From, StateName,
                  State)
    when StateName =:= notice ->
    continue({false,
              lang:get("峡谷之巅即将开始，请留意进场通知{face_1,30}")},
             StateName,
             State);
handle_sync_event({enter, _, _}, _From, StateName,
                  State) ->
    continue({false,
              lang:get("峡谷之巅已经开始，战火纷飞不宜出入，以免误伤。还请下次尽早入场哦~{face_1,22}")},
             StateName,
             State);
handle_sync_event({query_role, Rid}, _From, StateName,
                  State) ->
    Data = case ets:lookup(canyon_summit_role, Rid) of
               [CRole = #canyon_summit_role{}] -> CRole;
               _ -> #canyon_summit_role{id = Rid}
           end,
    continue(Data, StateName, State);
handle_sync_event(get_team, _From, StateName, State) ->
    continue(ets:tab2list(canyon_summit_team),
             StateName,
             State);
handle_sync_event({get_side_info, GroupId, MatchId},
                  _From, StateName, State) ->
    L1 = case ets:lookup(canyon_summit_side,
                         {GroupId, MatchId, 2})
             of
             A1 = [#canyon_summit_side{}] -> A1;
             _ -> []
         end,
    L2 = case ets:lookup(canyon_summit_side,
                         {GroupId, MatchId, 1})
             of
             A2 = [#canyon_summit_side{}] -> A2;
             _ -> []
         end,
    continue(L1 ++ L2, StateName, State);
handle_sync_event({get_result, Id}, _From, StateName,
                  State) ->
    Reply = case ets:lookup(canyon_summit_side, Id) of
                [#canyon_summit_side{is_win = Result}] -> Result;
                _ -> false
            end,
    continue(Reply, StateName, State);
handle_sync_event({get_side_meminfo, GroupId, MatchId},
                  _From, StateName, State) ->
    L1 = case ets:lookup(canyon_summit_side,
                         {GroupId, MatchId, 2})
             of
             [#canyon_summit_side{members = Members1}] ->
                 lists:flatten([begin
                                    case catch ets:lookup(canyon_summit_role,
                                                          MemId)
                                        of
                                        List when is_list(List) -> List;
                                        _ -> []
                                    end
                                end
                                || MemId <- Members1]);
             _ -> []
         end,
    L2 = case ets:lookup(canyon_summit_side,
                         {GroupId, MatchId, 1})
             of
             [#canyon_summit_side{members = Members2}] ->
                 lists:flatten([begin
                                    case catch ets:lookup(canyon_summit_role,
                                                          MemId)
                                        of
                                        List when is_list(List) -> List;
                                        _ -> []
                                    end
                                end
                                || MemId <- Members2]);
             _ -> []
         end,
    continue(L1 ++ L2, StateName, State);
handle_sync_event({enter_gap_match,
                   GroupId,
                   MemNum,
                   RoleIds},
                  _From, StateName, State) ->
    InfoList = case ets:match_object(canyon_summit_info,
                                     #canyon_summit_info{group_id = GroupId,
                                                         _ = '_'})
                   of
                   _MatchList when is_list(_MatchList) -> _MatchList;
                   _ -> []
               end,
    Data = get_less_side(InfoList, MemNum, RoleIds),
    continue(Data, StateName, State);
handle_sync_event(make_result, _From, StateName, State)
    when StateName =:= notice orelse
             StateName =:= ready orelse StateName =:= calculate ->
    continue(lang:get("战场还未开启，暂时看不到分配结果"),
             StateName,
             State);
handle_sync_event(make_result, _From, StateName,
                  State) ->
    InfoList = ets:tab2list(canyon_summit_info),
    RList = [begin
                 case ets:lookup(canyon_summit_result, Id) of
                     [R = #canyon_summit_result{}] ->
                         R#canyon_summit_result{red_fc = RedFc,
                                                red_team_num = RTeamNum,
                                                red_role_num = RedNum,
                                                black_fc = BlackFc,
                                                black_team_num = BTeamNum,
                                                black_role_num = BlackNum};
                     _ ->
                         #canyon_summit_result{id = Id, red_fc = RedFc,
                                               red_team_num = RTeamNum,
                                               red_role_num = RedNum,
                                               black_fc = BlackFc,
                                               black_team_num = BTeamNum,
                                               black_role_num = BlackNum}
                 end
             end
             || #canyon_summit_info{id = Id, black_num = BlackNum,
                                    red_num = RedNum, black_fc = BlackFc,
                                    red_fc = RedFc, black_team_num = BTeamNum,
                                    red_team_num = RTeamNum}
                    <- InfoList],
    continue(RList, StateName, State);
handle_sync_event(_Event, _From, StateName,
                  State = #state{}) ->
    Reply = todo,
    continue(Reply, StateName, State).

handle_info({notice_cast, Num}, StateName, State) ->
    del_timer(notice_cast_ref),
    Content = case Num of
                  1 ->
                      Ref = erlang:send_after(300 * 1000,
                                              self(),
                                              {notice_cast, Num + 1}),
                      put(notice_cast_ref, Ref),
                      lang:get("<color='#00ff00'>峡谷之巅</color>（70级以上可参与）将在<col"
                               "or='#00ff00'>15</color>分钟后开启，请各位勇士做好准备！{face_"
                               "1,7}");
                  2 ->
                      Ref = erlang:send_after(300 * 1000,
                                              self(),
                                              {notice_cast, Num + 1}),
                      put(notice_cast_ref, Ref),
                      lang:get("<color='#00ff00'>峡谷之巅</color>（70级以上可参与）将在<col"
                               "or='#00ff00'>10</color>分钟后开启，请各位勇士做好准备！{face_"
                               "1,7}");
                  _ ->
                      lang:get("<color='#00ff00'>峡谷之巅</color>（70级以上可参与）将在<col"
                               "or='#00ff00'>5</color>分钟后开启，请各位勇士做好准备！{face_1"
                               ",7}")
              end,
    cross:cast(all,
               canyon_summit_agent,
               info,
               [{notice_cast, 8, Content}]),
    continue(StateName, State);
handle_info({enroll, RoleList}, StateName, State) ->
    update(canyon_summit_role, RoleList),
    continue(StateName, State);
handle_info({enroll_team, TeamInfo}, StateName,
            State) ->
    update(canyon_summit_team, TeamInfo),
    continue(StateName, State);
handle_info(reset, _StateName, State) ->
    ets:delete_all_objects(canyon_summit_role),
    ets:delete_all_objects(canyon_summit_team),
    State1 = uninit_zone(State),
    {StateName, TimeOut} = get_state(),
    ToClient = case StateName of
                   idle -> 0;
                   notice -> 1;
                   ready -> 2;
                   battle_active -> 5
               end,
    NewState = State1#state{ts = date:now2(),
                            timeout = TimeOut},
    cross:cast(all,
               canyon_summit_agent,
               info,
               [{reset, ToClient, date:now2(), TimeOut}]),
    logger:info("重置峡谷之巅完成...", [], canyon_summit_mgr, 310),
    continue(StateName, NewState);
handle_info(judge, StateName, State)
    when StateName =:= battle_active orelse
             StateName =:= battle_ready ->
    del_timer(canyon_judge_ref),
    sync_allbattle(judge),
    continue(StateName, State);
handle_info(judge, StateName, State) ->
    del_timer(canyon_judge_ref),
    continue(StateName, State);
handle_info(cannon_ready, StateName, State)
    when StateName =:= battle_active orelse
             StateName =:= battle_ready ->
    del_timer(canyon_judge_ref),
    sync_allbattle(cannon_ready),
    continue(StateName, State);
handle_info(cannon_ready, StateName, State) ->
    del_timer(canyon_judge_ref),
    continue(StateName, State);
handle_info({send_msg, Msg}, StateName, State)
    when StateName =:= battle_active orelse
             StateName =:= battle_ready ->
    logger:debug("~ts", [Msg], canyon_summit_mgr, 333),
    sync_allbattle(Msg),
    continue(StateName, State);
handle_info({send_msg, Msg}, StateName, State) ->
    logger:debug("~ts", [Msg], canyon_summit_mgr, 338),
    sync_allzone(State, Msg),
    continue(StateName, State);
handle_info(enroll_end, calculate,
            State = #state{zone_list = ZoneList}) ->
    del_timer(canyon_enroll_ref),
    arrange_team(ZoneList, env:get(canyon_group_num)),
    continue(calculate, State);
handle_info(enroll_end, StateName, State) ->
    del_timer(canyon_enroll_ref),
    continue(StateName, State);
handle_info(trans_match, battle_ready, State) ->
    del_timer(canyon_trans_match_ref),
    cross:cast(all,
               canyon_summit_agent,
               info,
               [trans_team]),
    continue(battle_ready, State);
handle_info(trans_match, StateName, State) ->
    del_timer(canyon_trans_match_ref),
    continue(StateName, State);
handle_info(close_ready, battle_ready, State) ->
    del_timer(canyon_close_ready_ref),
    NState = uninit_zone(State),
    continue(battle_ready, NState);
handle_info(close_ready, StateName, State) ->
    del_timer(canyon_close_ready_ref),
    continue(StateName, State);
handle_info(notice_not_ready, ready, State) ->
    sync_allzone(State, notice_not_ready),
    continue(ready, State);
handle_info(notice_not_ready, StateName, State) ->
    continue(StateName, State);
handle_info(_Event, StateName, State) ->
    continue(StateName, State).

terminate(_Reason, _StateName, _State) -> ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

continue(StateName,
         State = #state{timeout = infinity}) ->
    {next_state, StateName, State, infinity};
continue(StateName,
         State = #state{ts = Ts, timeout = TimeOut}) ->
    {next_state,
     StateName,
     State,
     util:time_left(TimeOut, Ts)}.

continue(Reply, StateName,
         State = #state{timeout = infinity}) ->
    {reply, Reply, StateName, State, infinity};
continue(Reply, StateName,
         State = #state{ts = Ts, timeout = TimeOut}) ->
    {reply,
     Reply,
     StateName,
     State,
     util:time_left(TimeOut, Ts)}.

idle(timeout, State = #state{}) ->
    logger:info("峡谷之巅进入广播时间", [], canyon_summit_mgr, 400),
    State1 = init_zone(State),
    NewState = State1#state{ts = date:now2(),
                            timeout = 900 * 1000},
    info({notice_cast, 1}),
    clear_ets(),
    cross:cast(all,
               canyon_summit_agent,
               info,
               [{update_state, 1, date:now2(), 900 * 1000}]),
    cross:cast(all, canyon_summit_agent, info, [del_info]),
    continue(notice, NewState).

notice(timeout, State = #state{}) ->
    logger:info("峡谷之巅广播结束", [], canyon_summit_mgr, 416),
    del_timer(notice_cast_ref),
    CastMsg =
        notice:format(lang:get("~ts准备厅已开启，请各位勇士火速前往集结！"),
                      [{string_2, 4, lang:get("峡谷之巅")}]),
    cross:cast(all,
               canyon_summit_agent,
               info,
               [{notice_cast, 5, CastMsg}]),
    NewState = State#state{ts = date:now2(),
                           timeout = 900 * 1000},
    sync_allzone(State, notice_team),
    cross:cast(all,
               canyon_summit_agent,
               info,
               [{update_state, 2, date:now2(), 900 * 1000}]),
    continue(ready, NewState).

ready(timeout, State = #state{}) ->
    logger:info("峡谷之巅准备阶段结束，进入分配阶段",
                [],
                canyon_summit_mgr,
                430),
    cross:cast(all, canyon_summit_agent, info, [enroll]),
    sync_allzone(State, enroll_team),
    EnrollRef = erlang:send_after(5 * 1000,
                                  self(),
                                  enroll_end),
    put(canyon_enroll_ref, EnrollRef),
    NewState = State#state{ts = date:now2(),
                           timeout = 10 * 1000},
    cross:cast(all,
               canyon_summit_agent,
               info,
               [{update_state, 3, date:now2(), 10 * 1000}]),
    continue(calculate, NewState).

calculate(timeout, State = #state{}) ->
    logger:info("计算阶段结束，进入战场", [], canyon_summit_mgr, 446),
    TransRef = erlang:send_after(120 * 1000,
                                 self(),
                                 trans_match),
    CloseReadyRef = erlang:send_after((120 + 5) * 1000,
                                      self(),
                                      close_ready),
    put(canyon_close_ready_ref, CloseReadyRef),
    put(canyon_trans_match_ref, TransRef),
    State1 = State#state{ts = date:now2(),
                         timeout = 300 * 1000},
    cross:cast(all,
               canyon_summit_agent,
               info,
               [{update_state, 4, date:now2(), 300 * 1000}]),
    continue(battle_ready, State1).

battle_ready(timeout, State = #state{}) ->
    logger:info("战场准备阶段结束，开始战斗",
                [],
                canyon_summit_mgr,
                461),
    sync_allbattle(active),
    JudgeRef = erlang:send_after(900 * 1000, self(), judge),
    CannonRef = erlang:send_after(480 * 1000,
                                  self(),
                                  cannon_ready),
    put(canyon_judge_ref, JudgeRef),
    put(canyon_cannon_ref, CannonRef),
    NState = uninit_zone(State),
    State1 = NState#state{ts = date:now2(),
                          timeout = 2400 * 1000},
    cross:cast(all,
               canyon_summit_agent,
               info,
               [{update_state, 5, date:now2(), 2400 * 1000}]),
    continue(battle_active, State1).

battle_active(timeout, State = #state{}) ->
    logger:info("峡谷之巅活动结束，发放奖励",
                [],
                canyon_summit_mgr,
                476),
    sync_allbattle(calc_result),
    State1 = State#state{ts = date:now2(),
                         timeout = 300 * 1000},
    cross:cast(all,
               canyon_summit_agent,
               info,
               [{update_state, 6, date:now2(), 300 * 1000}]),
    continue(ending, State1).

ending(timeout, State = #state{}) ->
    logger:info("峡谷之巅活动结束, 进行清理",
                [],
                canyon_summit_mgr,
                487),
    {_, TimeOut} = get_state(),
    NewState = State#state{ts = date:now2(),
                           timeout = TimeOut},
    canyon_summit_rank(),
    sync_allbattle(leave),
    cross:cast(all,
               canyon_summit_agent,
               info,
               [update_rank]),
    cross:cast(all,
               canyon_summit_agent,
               info,
               [{update_state, 0, date:now2(), TimeOut}]),
    continue(idle, NewState).

next() ->
    gen_fsm:send_event(canyon_summit_mgr, timeout).

reset() -> canyon_summit_mgr ! reset.

send_msg(Msg) -> canyon_summit_mgr ! {send_msg, Msg}.

get_team() -> canyon_summit_mgr:call(get_team).

get_result() -> canyon_summit_mgr:call(make_result).

init_zone(State) ->
    ZoneList = case canyon_summit_data:get_all_group() of
                   Groups when is_list(Groups) ->
                       [begin
                            case canyon_summit_zone:start_link(GroupId) of
                                {ok, ZonePid} -> {GroupId, ZonePid, 0};
                                _ -> {GroupId, undef, 0}
                            end
                        end
                        || GroupId <- Groups];
                   _ -> []
               end,
    State#state{zone_list = ZoneList}.

uninit_zone(State = #state{zone_list = ZoneList}) ->
    [canyon_summit_zone:cast(ZonePid, close)
     || {_, ZonePid, _} <- ZoneList],
    State#state{zone_list = [], zone_nextid = 0}.

do_enter(State = #state{zone_list = Zones}, GroupId,
         Num) ->
    case lists:keyfind(GroupId, 1, Zones) of
        {GroupId, ZonePid, _} ->
            Reply = case canyon_summit_zone:call(ZonePid,
                                                 {enter, Num})
                        of
                        {false, _Reason} -> {false, lang:get("进入峡谷之巅失败")};
                        Data -> Data
                    end,
            {Reply, zone_enter(GroupId, Num, State)};
        _ ->
            case canyon_summit_zone:start_link(GroupId) of
                {ok, ZonePid} ->
                    Reply = case canyon_summit_zone:call(ZonePid,
                                                         {enter, Num})
                                of
                                {false, _Reason} ->
                                    {false, lang:get("进入峡谷之巅失败")};
                                Data -> Data
                            end,
                    NewZones = [{GroupId, ZonePid, Num} | Zones],
                    {Reply, State#state{zone_list = NewZones}};
                _ -> {{false, lang:get("进入峡谷之巅失败")}, State}
            end
    end.

zone_enter(GroupId, Num,
           State = #state{zone_list = Zones}) ->
    NewZones = case lists:keytake(GroupId, 1, Zones) of
                   {value, {GroupId, ZonePid, Count}, Rest} ->
                       [{GroupId, ZonePid, Count + Num} | Rest];
                   _ ->
                       case canyon_summit_zone:start_link(GroupId) of
                           {ok, ZonePid} -> [{GroupId, ZonePid, Num} | Zones];
                           _ -> [{GroupId, undef, 0} | Zones]
                       end
               end,
    State#state{zone_list = NewZones}.

zone_exit(GroupId, State = #state{zone_list = Zones}) ->
    NewZones = case lists:keytake(GroupId, 1, Zones) of
                   {value, {GroupId, ZonePid, Count}, Rest} ->
                       [{GroupId, ZonePid, Count - 1} | Rest];
                   _ -> Zones
               end,
    State#state{zone_list = NewZones}.

get_state() ->
    {StateName, TimeOut} = case
                               agenda:get_state_timeout(2106, 900)
                               of
                               {idle, Tt} -> {idle, Tt};
                               {notice, _} -> {notice, 900};
                               {active, _} -> {battle_active, 2400}
                           end,
    {StateName, TimeOut * 1000}.

sync_allzone(#state{zone_list = ZoneList}, Msg) ->
    [canyon_summit_zone:cast(ZonePid, Msg)
     || {_, ZonePid, _} <- ZoneList],
    ok.

sync_allbattle(Msg) ->
    logger:debug("======~ts",
                 [Msg],
                 canyon_summit_mgr,
                 610),
    Fun = fun (#canyon_summit_match{pid = MatchPid}, _) ->
                  MatchPid ! Msg;
              (_, _) -> ok
          end,
    ets:foldl(Fun, ok, canyon_summit_match).

del_timer(Lable) ->
    case get(Lable) of
        undefined -> ignore;
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef)
    end.

arrange_team(_ZoneList, GroupId) when GroupId =< 0 ->
    ok;
arrange_team(ZoneList, GroupId) ->
    TeamList = case ets:match_object(canyon_summit_team,
                                     #canyon_summit_team{match_group = GroupId,
                                                         _ = '_'})
                   of
                   _TeamList when is_list(_TeamList) -> _TeamList;
                   _ -> []
               end,
    AllNum = length(TeamList),
    ArrangeList = case AllNum of
                      AllNum when AllNum < 14 -> [];
                      AllNum when AllNum < 28 -> [AllNum];
                      AllNum ->
                          Matches = AllNum div 20,
                          MatchNum = case AllNum rem 20 of
                                         RemNum when RemNum >= 8 -> Matches + 1;
                                         _RemNum -> Matches
                                     end,
                          ErgNum = AllNum div (2 * MatchNum),
                          AddNum = AllNum rem (2 * MatchNum),
                          Num1 = AddNum div 2,
                          case AddNum rem 2 of
                              1 ->
                                  L1 = lists:duplicate(Num1, ErgNum * 2 + 2),
                                  L3 = case MatchNum - Num1 - 1 > 0 of
                                           true ->
                                               L2 = lists:duplicate(MatchNum -
                                                                        Num1
                                                                        - 1,
                                                                    ErgNum * 2),
                                               [ErgNum * 2 + 1 | L2];
                                           _ -> [ErgNum * 2 + 1]
                                       end,
                                  L1 ++ L3;
                              _ ->
                                  L1 = lists:duplicate(Num1, ErgNum * 2 + 2),
                                  L2 = lists:duplicate(MatchNum - Num1,
                                                       ErgNum * 2),
                                  L1 ++ L2
                          end
                  end,
    logger:debug("~w",
                 [ArrangeList],
                 canyon_summit_mgr,
                 670),
    case ArrangeList of
        [] ->
            case lists:keyfind(GroupId, 1, ZoneList) of
                {GroupId, ZonePid, _} ->
                    canyon_summit_zone:cast(ZonePid, role_less);
                _ -> ok
            end,
            arrange_team(ZoneList, GroupId - 1);
        _ ->
            SorData =
                util:keys_sort([#canyon_summit_team.fight_capacity,
                                #canyon_summit_team.member_num],
                               TeamList),
            MatchList = make_match(GroupId, length(ArrangeList)),
            logger:debug("~w", [MatchList], canyon_summit_mgr, 683),
            make_allocate(SorData,
                          1,
                          MatchList,
                          #{arrange_list => ArrangeList, group_id => GroupId}),
            arrange_team(ZoneList, GroupId - 1)
    end.

make_match(GroupId, MatchNum) ->
    IndexList = lists:seq(1, MatchNum),
    [begin
         case
             canyon_summit_match:start_link(#canyon_summit_match{id =
                                                                     {GroupId,
                                                                      Index}})
             of
             {ok, MatchPid} ->
                 case gen_server:call(MatchPid,
                                      {get_map_id, {GroupId, Index}})
                     of
                     MapId when is_integer(MapId) ->
                         {Index, MatchPid, MapId};
                     _Err ->
                         logger:error("开启战场失败:~w",
                                      [_Err],
                                      canyon_summit_mgr,
                                      699),
                         {Index, undefined, 0}
                 end;
             _Err ->
                 logger:error("开启战场失败:~w",
                              [_Err],
                              canyon_summit_mgr,
                              703),
                 {Index, undefined, 0}
         end
     end
     || Index <- IndexList].

make_allocate(SorData, Num, MatchList,
              Arg = #{group_id := GroupId}) ->
    logger:debug("第~w轮遍历战场", [Num], canyon_summit_mgr, 709),
    Fun = fun ({Index, MatchPid, MapId},
               [H1 = #canyon_summit_team{}, H2 = #canyon_summit_team{}
                | Temp]) ->
                  {Side1, Side2} = case Num rem 2 of
                                       1 -> {2, 1};
                                       _ -> {1, 2}
                                   end,
                  make_side_info(H1,
                                 Arg#{index => Index, side => Side1,
                                      match_pid => MatchPid, map_id => MapId}),
                  make_side_info(H2,
                                 Arg#{index => Index, side => Side2,
                                      match_pid => MatchPid, map_id => MapId}),
                  Temp;
              ({Index, MatchPid, MapId},
               [H = #canyon_summit_team{}]) ->
                  Side = case Num rem 2 of
                             1 -> 2;
                             _ -> 1
                         end,
                  make_side_info(H,
                                 Arg#{index => Index, side => Side,
                                      match_pid => MatchPid, map_id => MapId}),
                  [];
              (_, []) -> []
          end,
    case lists:foldl(Fun, SorData, MatchList) of
        [] ->
            IndexList = lists:seq(1, length(MatchList)),
            [begin
                 {BlackNum, MapId, MatchPid, BlackFc} = case
                                                            ets:lookup(canyon_summit_side,
                                                                       {GroupId,
                                                                        I,
                                                                        2})
                                                            of
                                                            [#canyon_summit_side{member_num
                                                                                     =
                                                                                     _BlackNum,
                                                                                 map_id
                                                                                     =
                                                                                     _MapId,
                                                                                 match_pid
                                                                                     =
                                                                                     _MatchPid,
                                                                                 all_fc
                                                                                     =
                                                                                     _BlackFc}] ->
                                                                {_BlackNum,
                                                                 _MapId,
                                                                 _MatchPid,
                                                                 _BlackFc};
                                                            _ ->
                                                                {0,
                                                                 0,
                                                                 undefine,
                                                                 0}
                                                        end,
                 {RedNum, RedFc} = case ets:lookup(canyon_summit_side,
                                                   {GroupId, I, 1})
                                       of
                                       [#canyon_summit_side{member_num =
                                                                _RedNum,
                                                            all_fc = _RedFc}] ->
                                           {_RedNum, _RedFc};
                                       _ -> {0, 0}
                                   end,
                 update(canyon_summit_info,
                        #canyon_summit_info{id = {GroupId, I},
                                            group_id = GroupId, match_id = I,
                                            map_id = MapId,
                                            match_pid = MatchPid,
                                            black_num = BlackNum,
                                            red_num = RedNum,
                                            black_fc = BlackFc, red_fc = RedFc,
                                            black_team_num = Num + Num rem 2,
                                            red_team_num = Num})
             end
             || I <- IndexList],
            ok;
        Temp when is_list(Temp) ->
            make_allocate(Temp, Num + 1, MatchList, Arg)
    end.

make_side_info(TeamInfo = #canyon_summit_team{member_num
                                                  = MemNum,
                                              members = Mems,
                                              leader = {_, LP, LZ},
                                              fight_capacity = Fc},
               #{index := Index, group_id := GroupId, side := Side,
                 match_pid := MatchPid, map_id := MapId,
                 arrange_list := ArrangeList}) ->
    NewTeam = TeamInfo#canyon_summit_team{team_side = Side,
                                          match_pid = MatchPid, map_id = MapId},
    update(canyon_summit_team, NewTeam),
    cross:cast(LP,
               LZ,
               canyon_summit_agent,
               sync_update,
               [canyon_summit_team, NewTeam]),
    SideInfo = case ets:lookup(canyon_summit_side,
                               {GroupId, Index, Side})
                   of
                   [CanyonSide = #canyon_summit_side{member_num =
                                                         MemberNum,
                                                     members = Members,
                                                     all_fc = OldFc}] ->
                       CanyonSide#canyon_summit_side{member_num =
                                                         MemberNum + MemNum,
                                                     members = Mems ++ Members,
                                                     remain_num =
                                                         MemberNum + MemNum,
                                                     all_fc = OldFc + Fc};
                   _ ->
                       #canyon_summit_side{id = {GroupId, Index, Side},
                                           member_num = MemNum,
                                           remain_num = MemNum, members = Mems,
                                           map_id = MapId, match_pid = MatchPid,
                                           all_fc = Fc}
               end,
    update(canyon_summit_side, SideInfo),
    [begin
         RoleInfo = case ets:lookup(canyon_summit_role, Rid) of
                        [CanyonRole = #canyon_summit_role{}] ->
                            CanyonRole#canyon_summit_role{match_id = Index,
                                                          side = Side};
                        _ ->
                            #canyon_summit_role{id = Rid, group_id = GroupId,
                                                match_id = Index, side = Side}
                    end,
         update(canyon_summit_role, RoleInfo),
         cross:cast(P,
                    Z,
                    canyon_summit_agent,
                    sync_update,
                    [canyon_summit_role, RoleInfo])
     end
     || Rid = {_, P, Z} <- Mems],
    logger:info("战场列表：~w, 战场id:~w, 阵营：~w，战力：~w, 队伍人数：~w, "
                "总数：~w",
                [ArrangeList,
                 {GroupId, Index},
                 Side,
                 Fc,
                 MemNum,
                 lists:nth(Index, ArrangeList)],
                canyon_summit_mgr,
                767),
    ok.

canyon_summit_rank() ->
    GroupList = canyon_summit_data:get_all_group(),
    Fun = fun (Id, Temp) when is_integer(Id) ->
                  RankType = get_rank_type(Id),
                  case lists:keyfind(RankType, 1, Temp) of
                      {RankType, L} ->
                          lists:keyreplace(RankType,
                                           1,
                                           Temp,
                                           {RankType, [Id | L]});
                      _ -> [{RankType, [Id]} | Temp]
                  end;
              (_, Temp) -> Temp
          end,
    NList = lists:foldl(Fun, [], GroupList),
    [canyon_summit_rank(RankType, IdList)
     || {RankType, IdList} <- NList].

canyon_summit_rank(RankType, IdList) ->
    ProfileList = [begin
                       case ets:match_object(canyon_summit_role,
                                             #canyon_summit_role{group_id =
                                                                     GroupId,
                                                                 _ = '_'})
                           of
                           _ProfileList when is_list(_ProfileList) ->
                               _ProfileList;
                           _ -> []
                       end
                   end
                   || GroupId <- IdList],
    NList = lists:flatten(ProfileList),
    SortData =
        lists:reverse(lists:keysort(#canyon_summit_role.score,
                                    NList)),
    RankData = to_rank_rc(SortData, 1, []),
    rank_zone:cast(RankType,
                   {replace, RankType, RankData, #{}}).

get_rank_type(1) -> 83;
get_rank_type(2) -> 83;
get_rank_type(3) -> 84;
get_rank_type(4) -> 84;
get_rank_type(5) -> 85;
get_rank_type(6) -> 85;
get_rank_type(7) -> 86;
get_rank_type(_) -> 0.

to_rank_rc([], _, Acc) -> Acc;
to_rank_rc([CanyonRole | Rest], Rank, Acc) ->
    #canyon_summit_role{id = Id = {RId, Plat, ZoneId},
                        name = Name, sex = Sex, classes = Classes, lev = Lev,
                        score = Score, group_id = Group} =
        CanyonRole,
    RankRc = #rank_rc{id = Id, rank = Rank, role_id = RId,
                      platform = Plat, zone_id = ZoneId, name = Name,
                      sex = Sex, classes = Classes, lev = Lev, val1 = Score,
                      val2 = Group},
    to_rank_rc(Rest, Rank + 1, [RankRc | Acc]).

get_less_side([Info = #canyon_summit_info{black_num =
                                              BlackNum,
                                          red_num = RedNum}
               | T],
              MemNum, RoleIds) ->
    case BlackNum + RedNum >= 100 of
        true ->
            case BlackNum =:= RedNum of
                true -> get_less_side(T, MemNum, RoleIds);
                _ ->
                    case insert_single(Info, MemNum, RoleIds) of
                        false -> get_less_side(T, MemNum, RoleIds);
                        Data -> Data
                    end
            end;
        _ ->
            case BlackNum =:= RedNum of
                true ->
                    case insert_max(Info, MemNum, RoleIds) of
                        false -> get_less_side(T, MemNum, RoleIds);
                        Data -> Data
                    end;
                _ ->
                    case insert_single(Info, MemNum, RoleIds) of
                        false -> get_less_side(T, MemNum, RoleIds);
                        Data -> Data
                    end
            end
    end;
get_less_side([], _, _) ->
    {false, lang:get("没有合适的战场可以进入")}.

insert_max(Info = #canyon_summit_info{group_id =
                                          GroupId,
                                      match_id = MatchId, black_num = BlackNum,
                                      red_num = RedNum, map_id = MapId,
                                      match_pid = MatchPid},
           MemNum, RoleIds) ->
    case 50 - BlackNum of
        GapNum when MemNum =< GapNum ->
            case util:rand(1, 2) of
                1 ->
                    update(canyon_summit_info,
                           Info#canyon_summit_info{red_num = RedNum + MemNum}),
                    change_info(GroupId, MatchId, 1, MemNum, RoleIds),
                    {MapId, MatchPid, 1};
                _ ->
                    update(canyon_summit_info,
                           Info#canyon_summit_info{black_num =
                                                       BlackNum + MemNum}),
                    change_info(GroupId, MatchId, 2, MemNum, RoleIds),
                    {MapId, MatchPid, 2}
            end;
        _ -> false
    end.

insert_single(Info = #canyon_summit_info{group_id =
                                             GroupId,
                                         match_id = MatchId,
                                         black_num = BlackNum, red_num = RedNum,
                                         map_id = MapId, match_pid = MatchPid},
              MemNum, RoleIds) ->
    case abs(BlackNum - RedNum) of
        GapNum when MemNum =< GapNum ->
            case BlackNum > RedNum of
                true ->
                    update(canyon_summit_info,
                           Info#canyon_summit_info{red_num = RedNum + MemNum}),
                    change_info(GroupId, MatchId, 1, MemNum, RoleIds),
                    {MapId, MatchPid, 1};
                _ ->
                    update(canyon_summit_info,
                           Info#canyon_summit_info{black_num =
                                                       BlackNum + MemNum}),
                    change_info(GroupId, MatchId, 2, MemNum, RoleIds),
                    {MapId, MatchPid, 2}
            end;
        _ -> false
    end.

change_info(GroupId, MatchId, Side, MemNum, RoleIds) ->
    NewA = case ets:lookup(canyon_summit_side,
                           {GroupId, MatchId, Side})
               of
               [A = #canyon_summit_side{member_num = Num,
                                        members = Mems,
                                        remain_num = RemainNum}] ->
                   A#canyon_summit_side{member_num = Num + MemNum,
                                        members = RoleIds ++ Mems,
                                        remain_num = RemainNum + MemNum};
               _ ->
                   #canyon_summit_side{member_num = MemNum,
                                       members = RoleIds, remain_num = MemNum}
           end,
    logger:info("单人候补入场，角色id：~w, 人数：~w, 战场id：~w, 阵营：~w",
                [RoleIds, MemNum, {GroupId, MatchId}, Side],
                canyon_summit_mgr,
                978),
    change_result({GroupId, MatchId}, Side, MemNum),
    update(canyon_summit_side, NewA),
    [begin
         RoleInfo = case ets:lookup(canyon_summit_role, Rid) of
                        [CanyonRole = #canyon_summit_role{}] ->
                            CanyonRole#canyon_summit_role{match_id = MatchId,
                                                          side = Side};
                        _ ->
                            #canyon_summit_role{id = Rid, group_id = GroupId,
                                                match_id = MatchId, side = Side}
                    end,
         update(canyon_summit_role, RoleInfo),
         cross:cast(P,
                    Z,
                    canyon_summit_agent,
                    sync_update,
                    [canyon_summit_role, RoleInfo])
     end
     || Rid = {_, P, Z} <- RoleIds].

change_result(Id, 1, MemNum) ->
    NewR = case ets:lookup(canyon_summit_result, Id) of
               [R = #canyon_summit_result{red_acc_team = AccTeam,
                                          red_acc_role = AccNum}] ->
                   R#canyon_summit_result{red_acc_team = AccTeam + 1,
                                          red_acc_role = AccNum + MemNum};
               _ ->
                   #canyon_summit_result{id = Id, red_acc_team = 1,
                                         red_acc_role = MemNum}
           end,
    update(canyon_summit_result, NewR);
change_result(Id, 2, MemNum) ->
    NewR = case ets:lookup(canyon_summit_result, Id) of
               [R = #canyon_summit_result{black_acc_team = AccTeam,
                                          black_acc_role = AccNum}] ->
                   R#canyon_summit_result{black_acc_team = AccTeam + 1,
                                          black_acc_role = AccNum + MemNum};
               _ ->
                   #canyon_summit_result{id = Id, black_acc_team = 1,
                                         black_acc_role = MemNum}
           end,
    update(canyon_summit_result, NewR).

update(canyon_summit_role,
       [R = #canyon_summit_role{} | T]) ->
    ets:insert(canyon_summit_role, R),
    update(canyon_summit_role, T);
update(canyon_summit_role, []) -> ok;
update(canyon_summit_role, R = #canyon_summit_role{}) ->
    ets:insert(canyon_summit_role, R),
    ok;
update(canyon_summit_team,
       Info = #canyon_summit_team{}) ->
    ets:insert(canyon_summit_team, Info),
    ok;
update(canyon_summit_team,
       [Info = #canyon_summit_team{} | T]) ->
    ets:insert(canyon_summit_team, Info),
    update(canyon_summit_team, T);
update(canyon_summit_team, []) -> ok;
update(canyon_summit_side,
       SideInfo = #canyon_summit_side{}) ->
    ets:insert(canyon_summit_side, SideInfo),
    ok;
update(canyon_summit_side,
       [Info = #canyon_summit_side{} | T]) ->
    ets:insert(canyon_summit_side, Info),
    update(canyon_summit_side, T);
update(canyon_summit_side, []) -> ok;
update(canyon_summit_info,
       SummitInfo = #canyon_summit_info{}) ->
    ets:insert(canyon_summit_info, SummitInfo),
    ok;
update(canyon_summit_result,
       SummitResult = #canyon_summit_result{}) ->
    ets:insert(canyon_summit_result, SummitResult),
    ok;
update(_Lable, _Data) ->
    logger:error("未知的数据~ts: ~w",
                 [_Lable, _Data],
                 canyon_summit_mgr,
                 1050),
    ok.

clear_ets() ->
    ets:delete_all_objects(canyon_summit_side),
    ets:delete_all_objects(canyon_summit_team),
    ets:delete_all_objects(canyon_summit_match),
    ets:delete_all_objects(canyon_summit_unit),
    ets:delete_all_objects(canyon_summit_role),
    ets:delete_all_objects(canyon_summit_info),
    ets:delete_all_objects(canyon_summit_result),
    ok.

gm_clear_team() ->
    ets:delete_all_objects(canyon_summit_team),
    ok.

