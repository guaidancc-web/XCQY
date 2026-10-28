-file("src/mod/team/team_common.erl", 1).

-module(team_common).

-export([sync_callback/2,
         async_callback/2,
         sign_qualifying/3,
         combat_over/1,
         usurp/1,
         vote_usurper/2,
         async_member/3,
         do_async_member/3]).

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

-file("src/mod/team/team_common.erl", 21).

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

-file("src/mod/team/team_common.erl", 22).

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

-file("src/mod/team/team_common.erl", 23).

sign_qualifying(QualifyingType, TeamPid, LeaderId) ->
    team:apply(async,
               TeamPid,
               {team_common,
                async_callback,
                [{sign_qualifying, LeaderId, QualifyingType}]}).

combat_over(#role{m_team =
                      #m_team{pid = Pid, status = 1}})
    when is_pid(Pid) ->
    team:apply(async,
               Pid,
               {team_common, async_callback, [combat_over]});
combat_over(_) -> ok.

async_member(#role{m_team =
                       #m_team{pid = TeamPid, status = 1}},
             TeamStatus, {M, F, A})
    when is_pid(TeamPid) andalso
             is_atom(M) andalso is_atom(F) andalso is_list(A) ->
    team:apply(async,
               TeamPid,
               {team_common,
                do_async_member,
                [TeamStatus, {M, F, A}]});
async_member(_, _, _) -> ok.

usurp(#role{m_team = #m_team{pid = Pid, status = 1}})
    when is_pid(Pid) ->
    {false, lang:get("你已经是队长了")};
usurp(#role{m_team = #m_team{pid = Pid, status = 3}})
    when is_pid(Pid) ->
    {false, lang:get("暂离状态不能顶替队长")};
usurp(#role{id = Id, name = Name,
            m_team = #m_team{pid = Pid}, classes = Classes,
            sex = Sex, lev = Lev})
    when is_pid(Pid) ->
    Now = date:unixtime(),
    case erlang:get(team_usurper_cd) of
        I when is_integer(I) andalso Now - I < 60 + 40 ->
            {false,
             notice:format(lang:get("请~ts秒后再申请"),
                           [{string_2, 5, 60 + 40 - (Now - I)}])};
        _ ->
            U = #team_usurper{id = Id, name = Name, time = Now,
                              sex = Sex, classes = Classes, lev = Lev, pros = 1,
                              voted_ids = [Id]},
            case team:apply(sync,
                            Pid,
                            {team_common, sync_callback, [{usurp, U}]})
                of
                ok ->
                    erlang:put(team_usurper_cd, Now),
                    ok;
                Else -> Else
            end
    end;
usurp(_) -> {false, lang:get("请先加入队伍")}.

vote_usurper(Role = #role{id = Id,
                          m_team = #m_team{pid = Pid}, name = Name},
             Decision) ->
    case team_util:check_handover([escort,
                                   qualifying,
                                   combat],
                                  Role)
        of
        true ->
            team:apply(sync,
                       Pid,
                       {team_common,
                        sync_callback,
                        [{vote_usurper, Id, Name, Decision}]});
        Else -> Else
    end;
vote_usurper(_, _) -> {false, lang:get("请先加入队伍")}.

-spec sync_callback(#team{}, term()) -> {ok,
                                         Reply :: term()} |
                                        {ok, term(), #team{}}.

sync_callback(#team{leader = #team_mate{id = Id}},
              {usurp, #team_usurper{id = Id}}) ->
    {ok, {false, lang:get("你已经是队长了")}};
sync_callback(Team = #team{usurpers = [],
                           members = Members,
                           leader = #team_mate{pid = LeaderPid}},
              {usurp, U = #team_usurper{name = UName, id = Id}}) ->
    Result = case role:apply(sync,
                             LeaderPid,
                             {team_role, callback, [check_handover]})
                 of
                 true ->
                     NewU = U#team_usurper{total =
                                               length([M
                                                       || M = #team_mate{status
                                                                             =
                                                                             Status}
                                                              <- Members,
                                                          Status =/= 4])},
                     Team1 = Team#team{usurpers = [NewU]},
                     team_util:broadcast(Members,
                                         notice,
                                         notice:format(lang:get("~ts发起顶替队长投票"),
                                                       [{role_2, UName}])),
                     team_util:broadcast([Mp
                                          || Mp = #team_mate{id = Mid}
                                                 <- Members,
                                             Mid =/= Id],
                                         11732,
                                         {NewU}),
                     {ok, Team1};
                 Else -> Else
             end,
    case Result of
        {ok, NewTeam = #team{}} ->
            case erlang:get(team_usurper_check_ref) of
                OldRef when is_reference(OldRef) ->
                    erlang:cancel_timer(OldRef);
                _ -> ok
            end,
            erlang:put(team_usurper_check_ref,
                       erlang:send_after(40 * 1000, self(), check_usurper)),
            {ok, ok, NewTeam};
        _ -> {ok, Result}
    end;
sync_callback(_Team, {usurp, _}) ->
    {ok, {false, lang:get("当前已经有投票在进行中了")}};
sync_callback(Team = #team{usurpers =
                               [U = #team_usurper{id = TargetId,
                                                  voted_ids = Ids, pros = Pros,
                                                  cons = Cons, name = UName}],
                           members = Members, order = Order,
                           leader = #team_mate{name = LeaderName}},
              {vote_usurper, Id, Name, Decision}) ->
    logger:debug("投票 ~w", [Decision], team_common, 125),
    case lists:member(Id, Ids) of
        true -> {ok, {false, lang:get("你已经投过票了")}};
        _ ->
            Origin = #team_mate{id = OriginId, pid = LeaderPid} =
                         lists:keyfind(1, #team_mate.status, Members),
            Result = case Id =:= OriginId orelse
                              role:apply(sync,
                                         LeaderPid,
                                         {team_role,
                                          callback,
                                          [check_handover]})
                         of
                         true ->
                             case lists:keyfind(Id, #team_mate.id, Members) of
                                 #team_mate{status = 1} when Decision =:= 1 ->
                                     handover;
                                 #team_mate{status = 1} ->
                                     vote_usurper_check(Team#team{usurpers =
                                                                      [U#team_usurper{leader_objected
                                                                                          =
                                                                                          1,
                                                                                      voted_ids
                                                                                          =
                                                                                          [Id
                                                                                           | Ids]}]});
                                 _ when Decision =:= 1 ->
                                     vote_usurper_check(Team#team{usurpers =
                                                                      [U#team_usurper{pros
                                                                                          =
                                                                                          Pros
                                                                                              +
                                                                                              1,
                                                                                      voted_ids
                                                                                          =
                                                                                          [Id
                                                                                           | Ids]}]});
                                 _ ->
                                     vote_usurper_check(Team#team{usurpers =
                                                                      [U#team_usurper{cons
                                                                                          =
                                                                                          Cons
                                                                                              +
                                                                                              1,
                                                                                      voted_ids
                                                                                          =
                                                                                          [Id
                                                                                           | Ids]}]})
                             end;
                         Other -> Other
                     end,
            case Result of
                {ok, NewTeam = #team{}} ->
                    notice_vote_usurper(Name, Decision, Members),
                    {ok, ok, NewTeam};
                handover ->
                    case lists:keyfind(TargetId, #team_mate.id, Members) of
                        #team_mate{status = 3} ->
                            notice_vote_usurper(Name, Decision, Members),
                            team_util:broadcast(Members,
                                                notice,
                                                notice:format(lang:get("~ts在暂离状态，本次投票失败，队长仍然是~ts"),
                                                              [{role_2, UName},
                                                               {role_2,
                                                                LeaderName}])),
                            cancel_vote_timer(Members),
                            {ok, ok, Team#team{usurpers = []}};
                        M = #team_mate{status = Status, pid = Pid}
                            when Status =/= 4 andalso is_pid(Pid) ->
                            M1 = M#team_mate{status = 1},
                            Origin1 = Origin#team_mate{status = Status},
                            Members1 = lists:keyreplace(OriginId,
                                                        #team_mate.id,
                                                        Members,
                                                        Origin1),
                            Members2 = lists:keyreplace(TargetId,
                                                        #team_mate.id,
                                                        Members1,
                                                        M1),
                            role:apply(async,
                                       Pid,
                                       {team_role,
                                        callback,
                                        [{appoint, 1, Members2}]}),
                            role:apply(async,
                                       LeaderPid,
                                       {team_role,
                                        callback,
                                        [{appoint, Status, Members2}]}),
                            role:apply(async,
                                       LeaderPid,
                                       {mount, exit_double_ride, []}),
                            role:apply(async,
                                       Pid,
                                       {mount, exit_double_ride, []}),
                            team_mgr:update(Origin1),
                            team_mgr:update(M1),
                            notice_vote_usurper(Name, Decision, Members),
                            team_util:broadcast(Members2,
                                                notice,
                                                notice:format(lang:get("~ts投票成功，~ts成为新队长"),
                                                              [{role_2, UName},
                                                               {role_2,
                                                                UName}])),
                            Order1 = team_util:exchange_order(Order,
                                                              OriginId,
                                                              TargetId),
                            team_util:broadcast(Members2,
                                                11726,
                                                {[M1, Origin1], Order1}),
                            cancel_vote_timer(Members2),
                            Team1 = Team#team{members = Members2,
                                              order = Order1, usurpers = [],
                                              leader = M1},
                            NewTeam = team:update_formation(Team1),
                            team:push(NewTeam, 11725),
                            dungeon_team:handover(TargetId),
                            {ok, ok, NewTeam};
                        _ ->
                            notice_vote_usurper(Name, Decision, Members),
                            team_util:broadcast(Members,
                                                notice,
                                                notice:format(lang:get("~ts投票失败，队长仍然是~ts"),
                                                              [{role_2, UName},
                                                               {role_2,
                                                                LeaderName}])),
                            cancel_vote_timer(Members),
                            {ok, ok, Team#team{usurpers = []}}
                    end;
                {false, Why} ->
                    cancel_vote_timer(Members),
                    {ok, {false, Why}, Team#team{usurpers = []}};
                reject ->
                    team_util:broadcast(Members,
                                        notice,
                                        notice:format(lang:get("队长~ts反对~ts的投票"),
                                                      [{role_2, LeaderName},
                                                       {role_2, UName}])),
                    cancel_vote_timer(Members),
                    {ok, ok, Team#team{usurpers = []}};
                _Else ->
                    logger:debug("其他结果 ~w", [_Else], team_common, 192),
                    notice_vote_usurper(Name, Decision, Members),
                    team_util:broadcast(Members,
                                        notice,
                                        notice:format(lang:get("~ts投票失败，队长仍然是~ts"),
                                                      [{role_2, UName},
                                                       {role_2, LeaderName}])),
                    cancel_vote_timer(Members),
                    {ok, ok, Team#team{usurpers = []}}
            end
    end;
sync_callback(_Team, {vote_usurper, _, _, _}) ->
    {ok, {false, lang:get("当前已没有投票在进行")}};
sync_callback(_Team, _Info) ->
    logger:error("未知回调 ~w", [_Info], team_common, 203),
    {ok, false}.

-spec async_callback(#team{}, term()) -> ok |
                                         {ok, #team{}}.

async_callback(#team{members = Members},
               {sign_qualifying, LeaderId, QualifyingType}) ->
    case lists:keyfind(LeaderId, #team_mate.id, Members) of
        #team_mate{status = 1} ->
            case qualifying_util:check_team(Members, QualifyingType)
                of
                {true, SignTeamMate} ->
                    case qualifying_util:team_convert(SignTeamMate,
                                                      QualifyingType,
                                                      [],
                                                      [])
                        of
                        {true, QualifyingRoles, RolePids} ->
                            qualifying_mgr:sign_up(QualifyingType,
                                                   QualifyingRoles,
                                                   RolePids);
                        {false, Reason} -> team:notice_up(Members, Reason)
                    end;
                {false, Reason} -> team:notice_up(Members, Reason)
            end;
        _ -> skip
    end,
    ok;
async_callback(#team{members = Members}, combat_over)
    when length(Members) >= 5 ->
    ok;
async_callback(Team = #team{status = 1}, combat_over) ->
    NewTeam = Team#team{matched = date:unixtime()},
    {ok, NewTeam};
async_callback(_Team, combat_over) -> ok;
async_callback(Team = #team{usurpers =
                                [#team_usurper{id = TargetId, name = UName}],
                            members = Members,
                            leader =
                                Origin = #team_mate{id = OriginId,
                                                    pid = LeaderPid,
                                                    name = LeaderName},
                            order = Order},
               check_usurper) ->
    case do_check_usurper(Team) of
        {ok, NewTeam = #team{}} -> {ok, NewTeam};
        handover ->
            logger:debug("投票成功", [], team_common, 249),
            case lists:keyfind(TargetId, #team_mate.id, Members) of
                #team_mate{status = 3} ->
                    team_util:broadcast(Members,
                                        notice,
                                        notice:format(lang:get("~ts在暂离状态，本次投票失败，队长仍然是~ts"),
                                                      [{role_2, UName},
                                                       {role_2, LeaderName}])),
                    {ok, Team#team{usurpers = []}};
                M = #team_mate{status = Status, pid = Pid}
                    when Status =/= 4 andalso is_pid(Pid) ->
                    M1 = M#team_mate{status = 1},
                    Origin1 = Origin#team_mate{status = Status},
                    Members1 = lists:keyreplace(OriginId,
                                                #team_mate.id,
                                                Members,
                                                Origin1),
                    Members2 = lists:keyreplace(TargetId,
                                                #team_mate.id,
                                                Members1,
                                                M1),
                    role:apply(async,
                               Pid,
                               {team_role, callback, [{appoint, 1, Members2}]}),
                    role:apply(async,
                               LeaderPid,
                               {team_role,
                                callback,
                                [{appoint, Status, Members2}]}),
                    role:apply(async,
                               LeaderPid,
                               {mount, exit_double_ride, []}),
                    role:apply(async, Pid, {mount, exit_double_ride, []}),
                    team_mgr:update(Origin1),
                    team_mgr:update(M1),
                    team_util:broadcast(Members2,
                                        notice,
                                        notice:format(lang:get("~ts投票成功，~ts成为新队长"),
                                                      [{role_2, UName},
                                                       {role_2, UName}])),
                    Order1 = team_util:exchange_order(Order,
                                                      OriginId,
                                                      TargetId),
                    team_util:broadcast(Members2,
                                        11726,
                                        {[M1, Origin1], Order1}),
                    Team1 = Team#team{members = Members2, order = Order1,
                                      usurpers = [], leader = M1},
                    NewTeam = team:update_formation(Team1),
                    team:push(NewTeam, 11725),
                    {ok, NewTeam};
                _ ->
                    team_util:broadcast(Members,
                                        notice,
                                        notice:format(lang:get("~ts投票失败，队长仍然是~ts"),
                                                      [{role_2, UName},
                                                       {role_2, LeaderName}])),
                    {ok, Team#team{usurpers = []}}
            end;
        _Else ->
            logger:debug("其他结果 ~w", [_Else], team_common, 279),
            team_util:broadcast(Members,
                                notice,
                                notice:format(lang:get("~ts投票失败，队长仍然是~ts"),
                                              [{role_2, UName},
                                               {role_2, LeaderName}])),
            {ok, Team#team{usurpers = []}}
    end;
async_callback(_, check_usurper) -> ok;
async_callback(_Team, _Info) ->
    logger:debug("未知回调 ~w", [_Info], team_common, 286),
    ok.

do_async_member(#team{members = Members}, TeamStatus,
                {M, F, A}) ->
    lists:foreach(fun (#team_mate{name = _Name,
                                  status = Status, pid = Pid})
                          when Status =:= TeamStatus andalso is_pid(Pid) ->
                          role:apply(async, Pid, {M, F, A});
                      (_) -> skip
                  end,
                  Members),
    ok.

vote_usurper_check(#team{usurpers =
                             [#team_usurper{leader_objected = 1}]}) ->
    reject;
vote_usurper_check(#team{usurpers =
                             [#team_usurper{cons = Cons}]})
    when Cons >= 2 ->
    fail;
vote_usurper_check(Team) -> {ok, Team}.

do_check_usurper(#team{}) -> handover.

cancel_vote_timer(Members) ->
    team_util:broadcast(Members, 11731, {1, ""}),
    case erlang:get(team_usurper_check_ref) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> ok
    end.

notice_vote_usurper(Name, 1, Members) ->
    Msg = notice:format(lang:get("~ts投了同意票"),
                        [{role_2, Name}]),
    team_util:broadcast(Members, notice, Msg);
notice_vote_usurper(Name, _, Members) ->
    Msg = notice:format(lang:get("~ts投了反对票"),
                        [{role_2, Name}]),
    team_util:broadcast(Members, notice, Msg).

