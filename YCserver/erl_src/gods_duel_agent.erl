-file("src/mod/gods_duel/gods_duel_agent.erl", 1).

-module(gods_duel_agent).

-behaviour(gen_server).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([start_link/0,
         info/1,
         call/1,
         update_status/1,
         query_forget_sign_team/0,
         repare_forget_sign_team/0,
         notice/1,
         do_team_notice/1,
         get_role_vote/1,
         lookup_match_profile/1,
         get_match_teams_odds/1,
         get_profile/1,
         local_profile/1,
         update_rank/1,
         gm_update_team_group/0,
         gm_get_honor/3,
         gm_send_honor/3]).

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

-file("src/mod/gods_duel/gods_duel_agent.erl", 35).

-file("inc/gods_duel.hrl", 1).

-record(gods_duel_team,
        {ver = 1 :: pos_integer(),
         id = {0, "", 0},
         name = "",
         lev = 0,
         match_group = 0,
         leader = {0, "", 0},
         member_num = 0,
         members = [],
         fight_capacity = 0,
         applys = [],
         invite_info = [],
         declaration = "",
         win_times = 0,
         loss_times = 0,
         qualification = 0,
         team_group_256 = 0,
         team_group_64 = 0,
         team_group_8 = 0,
         team_group_4 = 0,
         team_seq = 0,
         team_index = 0}).

-record(gods_duel_team_mate,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         break_times = 0,
         position = 0,
         fight_capacity = 0,
         join_time = 0}).

-record(m_gods_duel,
        {ver = 2, team_id = {0, "", 0}, gods_score = 0}).

-record(gods_duel_season_data,
        {ver = 1, serial_id = 0, history_season_info = []}).

-record(gods_duel_season_info,
        {ver = 1,
         id = 0,
         status = 0,
         teams = [],
         group_order = 0,
         season_time_info = []}).

-record(invite_info,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         break_times = 0,
         classes = 0,
         sex = 0,
         total_fc = 0,
         online = 0}).

-record(gods_duel_join_team,
        {id = {0, "", 0},
         team_pid = undefined,
         team_data = undefined,
         fighters = [],
         is_ready = false}).

-record(gods_duel_match,
        {id = {0, 0},
         teams = [],
         combat_pid = undefined :: pid(),
         calc_args = [],
         combat_ref = undefined,
         is_over = 0,
         map_id = 0,
         map_pid = undefined,
         roles = []}).

-record(gods_duel_match_profile,
        {id = 0,
         ver = 1,
         season_id = 0,
         match_type = 0,
         match_round = 0,
         match_id = 0,
         group_id = 0,
         combat_type = 0,
         atk_name,
         dfd_name,
         combat_pid = undefined :: pid(),
         is_over = 0,
         platform = "",
         zone_id = 0,
         time = 0,
         fc_diff = 0,
         round = 0}).

-record(gods_duel_fighter,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         kill_num = 0,
         dead_num = 0,
         total_heal = 0,
         control_num = 0,
         total_hurt = 0 :: non_neg_integer(),
         total_dmg = 0 :: non_neg_integer(),
         mvp_score = 0 :: non_neg_integer()}).

-record(gods_duel_vote,
        {ver = 0 :: non_neg_integer(),
         id = {0, "", 0} :: tuple(),
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         choices = [] :: list(),
         time = 0 :: non_neg_integer()}).

-record(gods_duel_vote_choice,
        {id = {0, "", 0} :: tuple(),
         match_round = 0 :: non_neg_integer(),
         match_zone = 0,
         is_right = 0 :: 0..2}).

-record(gods_duel_poll,
        {id = {0, "", 0} :: tuple(),
         match_round = 0 :: non_neg_integer(),
         voted_cnt = 0 :: non_neg_integer()}).

-record(gods_duel_profile,
        {id = {0, "", 0} :: tuple(),
         ver = 1 :: non_neg_integer(),
         name = "" :: string(),
         lev = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         gods_duel_score = 0 :: non_neg_integer()}).

-record(gods_challenge_info,
        {id, combat_pid, is_over = 0}).

-record(gods_duel_team_rank,
        {ver = 1, serial_id = 0, history_season_info = []}).

-record(gods_duel_team_rank_data,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         leader = {0, "", 0},
         member_num = 0,
         members = [],
         fight_capacity = 0,
         win_times = 0,
         qualification = 0,
         rank = 0}).

-record(gods_duel_team_rank_mate,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 2,
         lev = 0,
         break_times = 0,
         position = 2,
         fight_capacity = 0,
         looks = []}).

-record(gods_challenge_team,
        {season_id = 0,
         team_name = "",
         member_num = 0,
         members = []}).

-record(gods_challenge_team_mate,
        {id = {0, "", 0}, name = ""}).

-file("src/mod/gods_duel/gods_duel_agent.erl", 36).

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

-file("src/mod/gods_duel/gods_duel_agent.erl", 37).

-file("inc/robot.hrl", 1).

-record(robot_role,
        {ver = 4,
         id = {0, "", 0} :: tuple(),
         name = "" :: list(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         fc = 0,
         face = 0,
         ai_id = 0,
         skills = [],
         talents = [],
         pet,
         backup_pets = [],
         guard,
         slave = [],
         attr :: undefined | tuple(),
         looks = [],
         time = 0,
         m_formation,
         pet_fc = 0,
         all_fc = 0,
         cup = 1000,
         m_lev_break}).

-record(robot_role_index,
        {id = {0, "", 0} :: tuple(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         fc = 0,
         pet_fc = 0,
         cup = 1000,
         all_fc = 0,
         time = 0}).

-file("src/mod/gods_duel/gods_duel_agent.erl", 38).

-file("inc/assets.hrl", 1).

-record(assets,
        {ver = 41 :: pos_integer(),
         exp = 0 :: non_neg_integer(),
         coin = 0 :: non_neg_integer(),
         coin_bind = 0 :: non_neg_integer(),
         gold = 0 :: non_neg_integer(),
         gold_bind = 0 :: non_neg_integer(),
         intelligs = 0 :: non_neg_integer(),
         guild = 0 :: non_neg_integer(),
         energy = 0 :: non_neg_integer(),
         satiety = 300 :: non_neg_integer(),
         stars_score = 0 :: non_neg_integer(),
         reserve_exp = 0 :: non_neg_integer(),
         character = 0 :: non_neg_integer(),
         alchemy = 0 :: non_neg_integer(),
         love = 0 :: non_neg_integer(),
         teacher_score = 0 :: non_neg_integer(),
         tournament = 0 :: non_neg_integer(),
         lottery_luck = 0 :: non_neg_integer(),
         endless_challenge = 0 :: non_neg_integer(),
         handbook_point = 0 :: non_neg_integer(),
         autumn_score = 0 :: non_neg_integer(),
         star_gold = 0 :: non_neg_integer(),
         halloween = 0 :: non_neg_integer(),
         thanksgiving = 0 :: non_neg_integer(),
         new_year = 0 :: non_neg_integer(),
         firecracker = 0 :: non_neg_integer(),
         glue_pudding = 0 :: non_neg_integer(),
         crystal = 0 :: non_neg_integer(),
         ticket = 0 :: non_neg_integer(),
         brother = 0 :: non_neg_integer(),
         egg = 0 :: non_neg_integer(),
         exchange = 0 :: non_neg_integer(),
         turn = 0 :: non_neg_integer(),
         father = 0 :: non_neg_integer(),
         lucky_ticket = 0 :: non_neg_integer(),
         dollar = 0 :: non_neg_integer(),
         naughty = 0 :: non_neg_integer(),
         concentric = 0 :: non_neg_integer(),
         qixiIntegral = 0 :: non_neg_integer(),
         sunshine = 0 :: non_neg_integer(),
         cut_price = 0 :: non_neg_integer(),
         single_dog = 0 :: non_neg_integer(),
         panda_score = 0 :: non_neg_integer(),
         joyful_egg = 0 :: non_neg_integer(),
         godswar = 0 :: non_neg_integer(),
         skl_unique_exp = 0 :: non_neg_integer(),
         happy_score = 0 :: non_neg_integer(),
         slot_machine = 0 :: non_neg_integer(),
         reserve_gold = 0 :: non_neg_integer(),
         zillionaire_sc = 0,
         score_exchange = 0 :: non_neg_integer(),
         new_open_turn = 0 :: non_neg_integer(),
         long_active = 0 :: non_neg_integer(),
         long_score = 0 :: non_neg_integer(),
         camp_pray_sc = 0 :: non_neg_integer()}).

-file("src/mod/gods_duel/gods_duel_agent.erl", 39).

-record(state,
        {threshold_info = [],
         confirm_refs = [],
         status = 0,
         season_id = 0,
         voting = []}).

start_link() ->
    gen_server:start_link({local, gods_duel_agent},
                          gods_duel_agent,
                          [],
                          []).

info(Msg) ->
    gods_duel_agent ! Msg,
    ok.

call(Msg) ->
    case catch gen_server:call(gods_duel_agent, Msg, 10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

update_status() ->
    erlang:send_after(30000, self(), update_status).

update_status(Status) -> info({update_status, Status}).

get_profile({Id, Platform, ZoneId}) ->
    big_world:call(Platform,
                   ZoneId,
                   gods_duel_agent,
                   local_profile,
                   [{Id, Platform, ZoneId}]).

local_profile(Id) ->
    case ets:lookup(gods_duel_profile, Id) of
        [P = #gods_duel_profile{}] -> P;
        _ -> false
    end.

init([]) ->
    logger:info("启动诸神之战代理...", [], gods_duel_agent, 83),
    State = #state{},
    dets:open_file(gods_duel_season_data,
                   [{file, "./dets/gods_duel_season_data.dets"},
                    {keypos, 1},
                    {type, set}]),
    ets:new(gods_duel_season_data,
            [set, named_table, public, {keypos, 1}]),
    dets:to_ets(gods_duel_season_data,
                gods_duel_season_data),
    dets:open_file(gods_duel_team_data,
                   [{file, "./dets/gods_duel_team_data.dets"},
                    {keypos, #gods_duel_team.id},
                    {type, set}]),
    ets:new(gods_duel_team_data,
            [set,
             named_table,
             public,
             {keypos, #gods_duel_team.id}]),
    dets:to_ets(gods_duel_team_data, gods_duel_team_data),
    dets:open_file(gods_duel_team_role_ids,
                   [{file, "./dets/gods_duel_team_role_ids.dets"},
                    {keypos, 1},
                    {type, set}]),
    ets:new(gods_duel_team_role_ids,
            [set, named_table, public, {keypos, 1}]),
    dets:to_ets(gods_duel_team_role_ids,
                gods_duel_team_role_ids),
    dets:open_file(gods_duel_group_team,
                   [{file, "./dets/gods_duel_group_team.dets"},
                    {keypos, 1},
                    {type, set}]),
    ets:new(gods_duel_group_team,
            [set, named_table, public, {keypos, 1}]),
    dets:to_ets(gods_duel_group_team, gods_duel_group_team),
    ets:new(gods_duel_team_names,
            [set, named_table, public, {keypos, 1}]),
    dets:open_file(gods_duel_match_profile,
                   [{file, "./dets/gods_duel_match_profile.dets"},
                    {keypos, #gods_duel_match_profile.id},
                    {type, set}]),
    ets:new(gods_duel_match_profile,
            [set,
             named_table,
             public,
             {keypos, #gods_duel_match_profile.id}]),
    dets:open_file(gods_duel_vote,
                   [{file, "./dets/gods_duel_vote.dets"},
                    {keypos, #gods_duel_vote.id}]),
    ets:new(gods_duel_vote,
            [set,
             named_table,
             public,
             {keypos, #gods_duel_vote.id}]),
    dets:to_ets(gods_duel_vote, gods_duel_vote),
    dets:open_file(gods_duel_poll,
                   [{file, "./dets/gods_duel_poll.dets"},
                    {keypos, #gods_duel_poll.id}]),
    ets:new(gods_duel_poll,
            [set,
             named_table,
             public,
             {keypos, #gods_duel_poll.id}]),
    dets:to_ets(gods_duel_vote, gods_duel_vote),
    dets:open_file(gods_duel_profile,
                   [{file, "./dets/gods_duel_profile.dets"},
                    {keypos, #gods_duel_profile.id}]),
    ets:new(gods_duel_profile,
            [set,
             named_table,
             public,
             {keypos, #gods_duel_profile.id}]),
    dets:to_ets(gods_duel_profile, gods_duel_profile),
    dets:open_file(gods_duel_rank,
                   [{file, "./dets/gods_duel_rank.dets"}, {keypos, 1}]),
    ets:new(gods_duel_rank,
            [set, named_table, public, {keypos, 1}]),
    dets:to_ets(gods_duel_rank, gods_duel_rank),
    dets:open_file(gods_duel_rank_local,
                   [{file, "./dets/gods_duel_rank_local.dets"},
                    {keypos, 1}]),
    ets:new(gods_duel_rank_local,
            [set, named_table, public, {keypos, 1}]),
    dets:to_ets(gods_duel_rank_local, gods_duel_rank_local),
    dets:open_file(gods_duel_team_rank,
                   [{file, "./dets/gods_duel_team_rank.dets"},
                    {keypos, 1}]),
    ets:new(gods_duel_team_rank,
            [set, named_table, public, {keypos, 1}]),
    dets:to_ets(gods_duel_team_rank, gods_duel_team_rank),
    update_status(),
    update_local_rank(),
    case dets:first(gods_duel_team_data) of
        '$end_of_table' ->
            logger:info("诸神之战没有队伍数据需要加载", [], gods_duel_agent, 146),
            [];
        _ ->
            dets:traverse(gods_duel_team_data,
                          fun (TeamInfo) ->
                                  gods_duel_team:update_name_used(TeamInfo),
                                  continue
                          end)
    end,
    Result = case dets:first(gods_duel_match_profile) of
                 '$end_of_table' ->
                     logger:info("没有数据需要加载", [], gods_duel_agent, 159),
                     [];
                 _ ->
                     dets:traverse(gods_duel_match_profile,
                                   fun (Data) ->
                                           case
                                               gods_duel_ver:conver_match_profile(Data)
                                               of
                                               {false, _} -> {done, false};
                                               {ok, NewData} ->
                                                   update_match_profile(NewData),
                                                   continue
                                           end
                                   end)
             end,
    case Result of
        [] ->
            logger:info("启动诸神之战代理成功...", [], gods_duel_agent, 176),
            {ok, State};
        _Err ->
            logger:debug("加载数据失败:~w", [_Err], gods_duel_agent, 180),
            {stop, data_load_err}
    end.

handle_call({create_team,
             TeamName,
             MemberNum,
             LeaderInfo = #gods_duel_team_mate{id = LeaderId}},
            _From, State = #state{confirm_refs = ConfirmRefs}) ->
    TeamInfo = gods_duel_team:create_team(TeamName,
                                          LeaderInfo,
                                          MemberNum),
    ConfirmRef = erlang:send_after(30000,
                                   self(),
                                   {team_confirm, LeaderId}),
    NewConfirmRefs = [{LeaderId, ConfirmRef} | ConfirmRefs],
    gods_duel_team:save_team_data(TeamInfo),
    NewState = State#state{confirm_refs = NewConfirmRefs},
    {reply, ok, NewState};
handle_call({approve_join_team, TeamId, ApplyId, Flag},
            _From, State) ->
    Reply = gods_duel_team:approve_join_team(TeamId,
                                             ApplyId,
                                             Flag),
    {reply, Reply, State};
handle_call({invite_team, RoleId, InviteId, TeamId},
            _From, State) ->
    case gods_duel_team:invite_team(RoleId,
                                    InviteId,
                                    TeamId)
        of
        ok -> {reply, ok, State};
        {false, Reason} -> {reply, {false, Reason}, State}
    end;
handle_call({apply_invite_team, Flag, TeamId, TeamMate},
            _From, State) ->
    Reply = case gods_duel_team:apply_invite_team(TeamId,
                                                  TeamMate,
                                                  Flag)
                of
                {ok, Msg} -> {ok, Msg};
                {false, Reason} -> {false, Reason};
                _Else -> _Else
            end,
    {reply, Reply, State};
handle_call({gods_duel_group_team, ZoneId}, _From,
            State) ->
    logger:debug("查询分组信息:~w",
                 [ZoneId],
                 gods_duel_agent,
                 215),
    case catch ets:lookup(gods_duel_group_team, ZoneId) of
        [{_, TeamGroupList}] ->
            Reply = {ok, TeamGroupList},
            {reply, Reply, State};
        _ -> {reply, false, State}
    end;
handle_call({vote,
             #{id := Id, match_zone := ZoneId, name := Name,
               lev := Lev, classes := Classes, sex := Sex,
               team_ids := Tids}},
            _From, State = #state{voting = Voting}) ->
    logger:debug("选择的队伍列表：~w",
                 [Tids],
                 gods_duel_agent,
                 226),
    SeasonId = gods_duel_common:get_season_id(),
    G1 = #gods_duel_vote{choices = Done} = case
                                               ets:lookup(gods_duel_vote, Id)
                                               of
                                               [G = #gods_duel_vote{season =
                                                                        SeasonId}] ->
                                                   G;
                                               _ ->
                                                   #gods_duel_vote{id = Id,
                                                                   name = Name,
                                                                   sex = Sex,
                                                                   classes =
                                                                       Classes,
                                                                   lev = Lev,
                                                                   season =
                                                                       SeasonId}
                                           end,
    MatchRound = case gods_duel_common:get_match_index() of
                     {2, _MatchRound} -> _MatchRound;
                     _ -> 1
                 end,
    MatchTeams =
        gods_duel_common:get_gods_duel_match_list(MatchRound),
    {Reply, NewVoting} = case check_vote(Tids,
                                         #{match_round => MatchRound,
                                           match_teams => MatchTeams,
                                           season => SeasonId, done => Done,
                                           match_zone => ZoneId})
                             of
                             {ok, Choices} ->
                                 update_vote(G1#gods_duel_vote{choices =
                                                                   Choices}),
                                 {true, acc_voting(Tids, Voting)};
                             Else -> {Else, Voting}
                         end,
    {reply, Reply, State#state{voting = NewVoting}};
handle_call({guess, _}, _From, State) ->
    Reply = {false, lang:get("现在不能竞猜哦")},
    {reply, Reply, State};
handle_call(_Request, _From, State) ->
    logger:error("诸神之战代理进程收到未知消息:~w",
                 [_Request],
                 gods_duel_agent,
                 258),
    {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({update_championteam, ChampionTeamInfo},
            State) ->
    role_group:pack_send(world, 17967, {ChampionTeamInfo}),
    {noreply, State};
handle_info({set_season_id, SeasonId}, State) ->
    update_season_id(SeasonId),
    NewState = State#state{season_id = SeasonId},
    {noreply, NewState};
handle_info({update_match_status,
             MatchState,
             SeasonStatus,
             StartTime},
            State) ->
    env:set(match_status,
            #{match_state => MatchState,
              season_status => SeasonStatus,
              start_time => StartTime}),
    role_group:pack_send(world,
                         17923,
                         {MatchState, SeasonStatus, StartTime}),
    {noreply, State};
handle_info({match_end, MatchRound}, State) ->
    MatchTable = get_match_teams_odds(MatchRound),
    logger:debug("对阵表:~w",
                 [MatchTable],
                 gods_duel_agent,
                 282),
    SeasonName = gods_duel_common:get_season_name(),
    MatchName =
        gods_duel_common:get_final_match_name(MatchRound),
    SeasonId = gods_duel_common:get_season_id(),
    ChoiceFun = fun (#gods_duel_vote_choice{id = TeamId,
                                            match_round = MR,
                                            match_zone = ZoneId, is_right = 1},
                     {Odds, RightRnt, _VoteFlag})
                        when MR =:= MatchRound ->
                        case lists:keyfind(ZoneId, 1, MatchTable) of
                            {_, ZoneMatchList} ->
                                case lists:keyfind(TeamId, 1, ZoneMatchList) of
                                    {TeamId, TeamOdds} ->
                                        NewOdds = [{TeamId, TeamOdds} | Odds],
                                        {NewOdds, RightRnt + 1, true};
                                    _ -> {Odds, RightRnt + 1, true}
                                end;
                            _ -> {Odds, RightRnt, true}
                        end;
                    (#gods_duel_vote_choice{match_round = MR},
                     {Odds, RightRnt, _VoteFlag})
                        when MR =:= MatchRound ->
                        {Odds, RightRnt, true};
                    (_Other, Rtn) -> Rtn
                end,
    VoteFun = fun (#gods_duel_vote{id = Id,
                                   season = VoteSeason, choices = Choices},
                   _Rtn)
                      when VoteSeason =:= SeasonId ->
                      {TeamOdds, RightNum, IsVote} = lists:foldl(ChoiceFun,
                                                                 {[], 0, false},
                                                                 Choices),
                      logger:debug("玩家[~w]淘汰赛轮次[~w]猜中[~w]只队伍，队伍赔率：~w",
                                   [Id, MatchRound, RightNum, TeamOdds],
                                   gods_duel_agent,
                                   308),
                      WrongCoinBase = case
                                          gods_duel_data:get_vote_coin({MatchRound,
                                                                        0})
                                          of
                                          false -> 0;
                                          _Else -> _Else
                                      end,
                      case gods_duel_data:get_vote_coin({MatchRound,
                                                         RightNum})
                          of
                          false ->
                              logger:error("投票奖励配置错误：~w",
                                           [{MatchRound, RightNum}],
                                           gods_duel_agent,
                                           316),
                              0;
                          CoinBase ->
                              Title = lang:get("诸神投票结果"),
                              MatchCount =
                                  gods_duel_common:get_match_team_count(MatchRound),
                              case RightNum > 0 of
                                  true ->
                                      RightCoin = lists:foldl(fun ({_,
                                                                    TheTeamOdds},
                                                                   RtnCoin) ->
                                                                      TeamCoin =
                                                                          round(CoinBase
                                                                                    *
                                                                                    TheTeamOdds
                                                                                    /
                                                                                    1000),
                                                                      RtnCoin +
                                                                          TeamCoin
                                                              end,
                                                              0,
                                                              TeamOdds),
                                      WrongCount = MatchCount - RightNum,
                                      WrongCoin = WrongCount * WrongCoinBase,
                                      Coin = WrongCoin + RightCoin,
                                      MailContent =
                                          notice:format(lang:get("恭喜，在~ts赛季~ts中，您投票支持的战队中有~ts队获得胜利，感谢您的投票与支持，获得"
                                                                 "以下奖励，请查收："),
                                                        [{string_2,
                                                          1,
                                                          SeasonName},
                                                         {string_2,
                                                          1,
                                                          MatchName},
                                                         {string_2,
                                                          1,
                                                          RightNum}]),
                                      mail:send(Id,
                                                #{title => Title,
                                                  content => MailContent,
                                                  items => [{90000, Coin}]});
                                  false when IsVote =:= true ->
                                      MailContent =
                                          notice:format(lang:get("很遗憾，在~ts赛季~ts中，你投票支持的战队未能获得胜利，您仅获得以下奖励，请查收："),
                                                        [{string_2,
                                                          1,
                                                          SeasonName},
                                                         {string_2,
                                                          1,
                                                          MatchName}]),
                                      Coin = WrongCoinBase * MatchCount,
                                      mail:send(Id,
                                                #{title => Title,
                                                  content => MailContent,
                                                  items => [{90000, Coin}]});
                                  _ -> ok
                              end
                      end;
                  (_, _Rtn) -> ok
              end,
    ets:foldl(VoteFun, ok, gods_duel_vote),
    {noreply, State};
handle_info({team_confirm, TeamId},
            State = #state{confirm_refs = ConfirmRefs}) ->
    logger:debug("战队创建后30秒确认:~w",
                 [TeamId],
                 gods_duel_agent,
                 349),
    case lists:keyfind(TeamId, 1, ConfirmRefs) of
        {_, Ref} when is_reference(Ref) ->
            erlang:cancel_timer(Ref);
        _ -> ok
    end,
    NewConfirmRefs = lists:keydelete(TeamId,
                                     1,
                                     ConfirmRefs),
    case gods_duel_team:lookup(TeamId) of
        {ok,
         #gods_duel_team{member_num = MemberNum,
                         members = Members}}
            when length(Members) < MemberNum ->
            Msg = lang:get("由于您的队伍成员没有回应您的请求，战队创建失败"),
            notice:send(TeamId, 1, Msg),
            NewState = State#state{confirm_refs = NewConfirmRefs},
            gods_duel_team:remove_team_data(TeamId),
            {noreply, NewState};
        {ok, _TeamInfo} ->
            NewState = State#state{confirm_refs = NewConfirmRefs},
            {noreply, NewState};
        false ->
            Msg = lang:get("由于您的队伍成员没有回应您的请求，战队创建失败"),
            notice:send(TeamId, 1, Msg),
            NewState = State#state{confirm_refs = NewConfirmRefs},
            {noreply, NewState}
    end;
handle_info({apply_create_team,
             Flag,
             TeamId,
             TeamMate = #gods_duel_team_mate{id = TeamMateId}},
            State = #state{confirm_refs = ConfirmRefs}) ->
    NewState = case gods_duel_team:lookup(TeamId) of
                   {ok,
                    TeamInfo = #gods_duel_team{name = TeamName,
                                               members = Members,
                                               member_num = Num}} ->
                       case lists:keymember(TeamMateId,
                                            #gods_duel_team_mate.id,
                                            Members)
                           of
                           true -> State;
                           false ->
                               case length(Members) =/= Num of
                                   true ->
                                       case Flag of
                                           1 ->
                                               NewMembers = [TeamMate
                                                             | Members],
                                               TeamInfo1 =
                                                   TeamInfo#gods_duel_team{members
                                                                               =
                                                                               NewMembers},
                                               NewTeamInfo =
                                                   gods_duel_team:update_team_info(TeamInfo1),
                                               gods_duel_team:save_team_data(NewTeamInfo),
                                               CurrentNum = length(NewMembers),
                                               NewConfirmRefs = case CurrentNum
                                                                         >= Num
                                                                    of
                                                                    true ->
                                                                        gods_duel_team:send_mail(create_team,
                                                                                                 NewMembers,
                                                                                                 #{team_name
                                                                                                       =>
                                                                                                       TeamName,
                                                                                                   team_num
                                                                                                       =>
                                                                                                       CurrentNum}),
                                                                        UpdateInfo =
                                                                            [{MateId,
                                                                              TeamId}
                                                                             || #gods_duel_team_mate{id
                                                                                                         =
                                                                                                         MateId}
                                                                                    <- NewMembers],
                                                                        lists:foreach(fun
                                                                                          ({FMateId,
                                                                                            FTeamId}) ->
                                                                                              gods_duel_team:update_role_team_id({FMateId,
                                                                                                                                  FTeamId}),
                                                                                              case
                                                                                                  FTeamId
                                                                                                      =:=
                                                                                                      FMateId
                                                                                                  of
                                                                                                  true ->
                                                                                                      role:apply(async,
                                                                                                                 TeamId,
                                                                                                                 {gods_duel_team,
                                                                                                                  reply_create_team_success,
                                                                                                                  []}),
                                                                                                      notice:send(FMateId,
                                                                                                                  1,
                                                                                                                  lang:get("战队创建成功"));
                                                                                                  false ->
                                                                                                      notice:send(FMateId,
                                                                                                                  1,
                                                                                                                  lang:get("成功加入战队"))
                                                                                              end
                                                                                      end,
                                                                                      UpdateInfo),
                                                                        gods_duel_team:update_name_used(TeamInfo),
                                                                        gods_duel_team:async_member(TeamId,
                                                                                                    [1,
                                                                                                     2,
                                                                                                     3],
                                                                                                    {gods_duel_role,
                                                                                                     push_gods_duel_team,
                                                                                                     []}),
                                                                        case
                                                                            lists:keyfind(TeamId,
                                                                                          1,
                                                                                          ConfirmRefs)
                                                                            of
                                                                            {_,
                                                                             Ref}
                                                                                when
                                                                                  is_reference(Ref) ->
                                                                                erlang:cancel_timer(Ref);
                                                                            _ ->
                                                                                skip
                                                                        end,
                                                                        lists:keydelete(TeamId,
                                                                                        1,
                                                                                        ConfirmRefs);
                                                                    false ->
                                                                        ConfirmRefs
                                                                end,
                                               State#state{confirm_refs =
                                                               NewConfirmRefs};
                                           0 ->
                                               case lists:keyfind(TeamId,
                                                                  1,
                                                                  ConfirmRefs)
                                                   of
                                                   {_, Ref}
                                                       when is_reference(Ref) ->
                                                       erlang:cancel_timer(Ref);
                                                   _ -> skip
                                               end,
                                               gods_duel_team:remove_team_data(TeamId),
                                               NewConfirmRefs =
                                                   lists:keydelete(TeamId,
                                                                   1,
                                                                   ConfirmRefs),
                                               State#state{confirm_refs =
                                                               NewConfirmRefs}
                                       end;
                                   false ->
                                       case lists:keyfind(TeamId,
                                                          1,
                                                          ConfirmRefs)
                                           of
                                           {_, Ref} when is_reference(Ref) ->
                                               erlang:cancel_timer(Ref);
                                           _ -> skip
                                       end,
                                       NewConfirmRefs = lists:keydelete(TeamId,
                                                                        1,
                                                                        ConfirmRefs),
                                       State#state{confirm_refs =
                                                       NewConfirmRefs}
                               end
                       end;
                   _ ->
                       case lists:keyfind(TeamId, 1, ConfirmRefs) of
                           {_, Ref} when is_reference(Ref) ->
                               erlang:cancel_timer(Ref);
                           _ -> skip
                       end,
                       NewConfirmRefs = lists:keydelete(TeamId,
                                                        1,
                                                        ConfirmRefs),
                       State#state{confirm_refs = NewConfirmRefs}
               end,
    {noreply, NewState};
handle_info({update_season_data, SeasonData}, State) ->
    update_season_data(SeasonData),
    {noreply, State};
handle_info(update_season_data, State) ->
    logger:debug("获取赛季总体信息", [], gods_duel_agent, 469),
    case big_world:call(gods_duel_mgr,
                        call,
                        [get_gods_season_data])
        of
        {ok, SeasonData} ->
            update_season_data(SeasonData),
            erlang:send_after(60000, self(), update_team_rank),
            ok;
        _ ->
            erlang:send_after(300000, self(), update_season_data)
    end,
    {noreply, State};
handle_info(update_team_rank, State) ->
    gods_duel_rank:update_team_rank(),
    {noreply, State};
handle_info({update_challenge_team, GodsChallengeTeam},
            State) ->
    env:save(gods_challenge_team, GodsChallengeTeam),
    {noreply, State};
handle_info({apply_join_team, TeamMate, TeamId},
            State) ->
    gods_duel_team:apply_join_team(TeamMate, TeamId),
    {noreply, State};
handle_info({dismiss_team, TeamId}, State) ->
    logger:debug("解散战队:~w", [TeamId], gods_duel_agent, 495),
    gods_duel_team:dismiss_team(TeamId),
    {noreply, State};
handle_info({leave_team, RoleId, TeamId}, State) ->
    logger:debug("离开战队:~w",
                 [{RoleId, TeamId}],
                 gods_duel_agent,
                 500),
    gods_duel_team:leave_team(RoleId, TeamId),
    {noreply, State};
handle_info({kick_mate, TeamId, MateId}, State) ->
    logger:debug("战队~w踢出队员:~w",
                 [TeamId, MateId],
                 gods_duel_agent,
                 505),
    gods_duel_team:agent_kick_mate(TeamId, MateId),
    {noreply, State};
handle_info({set_declaration, TeamId, Declaration},
            State) ->
    gods_duel_team:agent_set_declaration(TeamId,
                                         Declaration),
    {noreply, State};
handle_info({modify_team_name, TeamId, TeamName},
            State) ->
    gods_duel_team:agent_modify_team_name(TeamId, TeamName),
    {noreply, State};
handle_info({exchange_alternate, TeamId, Id1, Id2},
            State) ->
    gods_duel_team:agent_exchange_alternate(TeamId,
                                            Id1,
                                            Id2),
    {noreply, State};
handle_info({team_sign, TeamId},
            State = #state{season_id = SeasonId}) ->
    gods_duel_team:agent_team_sign(TeamId, SeasonId),
    {noreply, State};
handle_info({update_member_lev, TeamId, RoleId, Lev},
            State = #state{season_id = SeasonId}) ->
    gods_duel_team:update_member_info(lev,
                                      TeamId,
                                      RoleId,
                                      Lev,
                                      #{season_id => SeasonId}),
    {noreply, State};
handle_info({update_member_break_times,
             TeamId,
             RoleId,
             Lev,
             BreakTimes},
            State = #state{season_id = SeasonId}) ->
    gods_duel_team:update_member_info(break_times,
                                      TeamId,
                                      RoleId,
                                      BreakTimes,
                                      #{season_id => SeasonId, lev => Lev}),
    {noreply, State};
handle_info({update_member_fc, TeamId, RoleId, TotalFc},
            State) ->
    gods_duel_team:update_member_info(fc,
                                      TeamId,
                                      RoleId,
                                      TotalFc,
                                      #{}),
    {noreply, State};
handle_info({update_member_info,
             TeamId,
             RoleId,
             Lev,
             Classes,
             Name,
             Sex},
            State) ->
    gods_duel_team:update_member_info(info,
                                      TeamId,
                                      RoleId,
                                      {Lev, Classes, Name, Sex},
                                      #{}),
    {noreply, State};
handle_info({combat_over, WinOrLoss, TeamId, Args},
            State) ->
    logger:debug("战队TeamId【~w】战斗结果:~w",
                 [TeamId, WinOrLoss],
                 gods_duel_agent,
                 551),
    gods_duel_team:update_match_combat(by_id,
                                       TeamId,
                                       WinOrLoss,
                                       Args),
    {noreply, State};
handle_info({group_result, TeamGroupInfo}, State) ->
    logger:debug("广播分组信息:~w",
                 [TeamGroupInfo],
                 gods_duel_agent,
                 558),
    save_team_group(TeamGroupInfo),
    modify_team_group_info(TeamGroupInfo),
    send_failed_mail(),
    {noreply, State};
handle_info({qualification_64_result,
             Qualifition64Teams},
            State) ->
    logger:debug("64强队伍:~w",
                 [Qualifition64Teams],
                 gods_duel_agent,
                 569),
    gods_duel_team:reward_qua64_team(Qualifition64Teams),
    save_qua64_team(Qualifition64Teams),
    {noreply, State};
handle_info({team_rise_jubilation, AllQuaTeamList},
            State) ->
    Fun = fun ({ZoneId, Qua4TeamList}, Rtn) ->
                  LocalQuaTeams = lists:filter(fun (#gods_duel_team{id =
                                                                        TeamId}) ->
                                                       role_misc:is_local_role(TeamId)
                                               end,
                                               Qua4TeamList),
                  GroupName = case gods_duel_data:get_group_name(ZoneId)
                                  of
                                  {ZoneId, _, GName} -> GName;
                                  _ -> lang:get("诸神之战")
                              end,
                  case LocalQuaTeams of
                      [] -> Rtn;
                      _ ->
                          GroupTitle = notice:format(lang:get("~ts"),
                                                     [{string_2,
                                                       1,
                                                       GroupName}]),
                          TeamContent = lists:foldl(fun (#gods_duel_team{name =
                                                                             TeamName,
                                                                         members
                                                                             =
                                                                             Members},
                                                         NamesRtn) ->
                                                            MemberNum =
                                                                length(Members),
                                                            MemberNames =
                                                                string:join(lists:duplicate(MemberNum,
                                                                                            "~ts"),
                                                                            "、"),
                                                            Fmt1 =
                                                                notice:format(lang:get("战队~ts:~ts、"),
                                                                              [{string_2,
                                                                                4,
                                                                                TeamName},
                                                                               {string_1,
                                                                                MemberNames}]),
                                                            NamesStr = [{role_2,
                                                                         MateName}
                                                                        || #gods_duel_team_mate{name
                                                                                                    =
                                                                                                    MateName}
                                                                               <- Members],
                                                            Names =
                                                                notice:format(Fmt1,
                                                                              NamesStr),
                                                            [Names | NamesRtn]
                                                    end,
                                                    [],
                                                    LocalQuaTeams),
                          [GroupTitle ++ TeamContent | Rtn]
                  end
          end,
    LocalQuaTeamStr = lists:foldl(Fun, [], AllQuaTeamList),
    case LocalQuaTeamStr of
        [] -> ok;
        _ ->
            _Content =
                notice:format(lang:get("~ts锣鼓喧天，鞭炮齐鸣{face_1,13}，恭喜来自本服的以上战队在诸神之战中英勇奋战"
                                       "，成功挺进~ts，值此普天同庆之时，让我们为他们欢呼吧{face_1,18}"),
                              [{string_1, LocalQuaTeamStr},
                               {string_2, 1, lang:get("4强")}]),
            _Title = lang:get("普天同庆·4强"),
            notice:cast(all, 5, _Content)
    end,
    {noreply, State};
handle_info({final_match_jubilation, 6, Args}, State) ->
    do_notice(152, Args),
    {noreply, State};
handle_info({final_match_jubilation, 7, Args}, State) ->
    do_notice(153, Args),
    {noreply, State};
handle_info(push_status,
            State = #state{status = 2, season_id = SeasonId}) ->
    case get(push_status_ref) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    Hour = date:hour(),
    PushStatusTimeOut = case Hour < 6 orelse Hour >= 17 of
                            true -> date:next_diff(6, 1, 0);
                            false -> date:next_diff(17, 1, 0)
                        end,
    PushStatusRef = erlang:send_after(PushStatusTimeOut *
                                          1000,
                                      self(),
                                      push_status),
    put(push_status_ref, PushStatusRef),
    logger:debug("广播活动状态:~w",
                 [{2, SeasonId}],
                 gods_duel_agent,
                 646),
    role_group:pack_send(world, 17915, {2, SeasonId}),
    {noreply, State};
handle_info(push_status, State) -> {noreply, State};
handle_info(update_status, State) ->
    NewState = case big_world:call(gods_duel_mgr,
                                   get_status,
                                   [])
                   of
                   {ok, Status, SeasonId} ->
                       env:save(gods_season_status, Status),
                       case gods_duel_common:get_season_id() of
                           OldSeasonId when OldSeasonId =/= SeasonId ->
                               info(update_season_data),
                               ok;
                           _ -> ok
                       end,
                       logger:debug("~w", [Status], gods_duel_agent, 666),
                       role_group:pack_send(world, 17915, {Status, SeasonId}),
                       case Status of
                           2 ->
                               Hour = date:hour(),
                               NextHour = Hour + 1 rem 23,
                               SignTimeOut = date:next_diff(NextHour, 30, 0),
                               SignRef = erlang:send_after(SignTimeOut * 1000,
                                                           self(),
                                                           sign_team),
                               put(sign_team_ref, SignRef),
                               PushStatusTimeOut = case Hour < 6 orelse
                                                            Hour >= 17
                                                       of
                                                       true ->
                                                           date:next_diff(6,
                                                                          0,
                                                                          0);
                                                       false ->
                                                           date:next_diff(17,
                                                                          0,
                                                                          0)
                                                   end,
                               PushStatusRef =
                                   erlang:send_after(PushStatusTimeOut * 1000,
                                                     self(),
                                                     push_status),
                               put(push_status_ref, PushStatusRef);
                           _ when Status > 2 andalso Status < 4 ->
                               info(update_group_info),
                               ok;
                           _ -> ok
                       end,
                       State#state{status = Status, season_id = SeasonId};
                   _Err ->
                       logger:debug("更新小组赛对战信息失败，5分钟之后重新尝试：~w",
                                    [_Err],
                                    gods_duel_agent,
                                    695),
                       erlang:send_after(60000, self(), update_status),
                       State
               end,
    {noreply, NewState};
handle_info({update_status, Status},
            State = #state{season_id = SeasonId}) ->
    logger:info("接收到央服推送:~w",
                [Status],
                gods_duel_agent,
                703),
    NewState = State#state{status = Status},
    env:save(gods_season_status, Status),
    case Status of
        2 ->
            Hour = date:hour(),
            NextHour = Hour + 1 rem 23,
            SignTimeOut = date:next_diff(NextHour, 30, 0),
            SignRef = erlang:send_after(SignTimeOut * 1000,
                                        self(),
                                        sign_team),
            put(sign_team_ref, SignRef);
        24 -> start_vote_ref();
        25 -> info(sync_voting);
        26 -> start_vote_ref();
        27 -> info(sync_voting);
        28 -> start_vote_ref();
        29 -> info(sync_voting);
        30 -> start_vote_ref();
        31 -> info(sync_voting);
        _ -> ok
    end,
    logger:debug("~w", [Status], gods_duel_agent, 735),
    role_group:pack_send(world, 17915, {Status, SeasonId}),
    do_notice(Status, #{season_id => SeasonId}),
    {noreply, NewState};
handle_info({update_team_ready_status,
             TeamId,
             UpType,
             Status},
            State) ->
    logger:debug("=========update_team_ready_status",
                 [],
                 gods_duel_agent,
                 742),
    gods_duel_team:update_team_ready_status(TeamId,
                                            UpType,
                                            Status),
    {noreply, State};
handle_info({update_threshold, ThresholdInfo}, State) ->
    logger:debug("更新阈值信息:~w",
                 [ThresholdInfo],
                 gods_duel_agent,
                 748),
    NewState = State#state{threshold_info = ThresholdInfo},
    {noreply, NewState};
handle_info(update_group_info, State) ->
    case big_world:call(gods_duel_mgr,
                        call,
                        [get_group_info])
        of
        {ok, TeamGroupInfo} ->
            save_team_group(TeamGroupInfo),
            modify_team_group_info(TeamGroupInfo),
            send_failed_mail(),
            ok;
        _ -> ok
    end,
    {noreply, State};
handle_info({last_team_sign, ThresholdInfo}, State) ->
    NewState = State#state{threshold_info = ThresholdInfo},
    info(sign_team),
    {noreply, NewState};
handle_info(sign_team,
            State = #state{threshold_info = ThresholdInfo}) ->
    case get(sign_team_ref) of
        Ref when is_reference(Ref) -> erlang:cancel_timer(Ref);
        _ -> ok
    end,
    case env:get(gods_season_status) of
        2 ->
            Hour = date:hour(),
            NextHour = Hour + 1 rem 23,
            SignTimeOut = date:next_diff(NextHour, 30, 0),
            SignRef = erlang:send_after(SignTimeOut * 1000,
                                        self(),
                                        sign_team),
            put(sign_team_ref, SignRef);
        _ -> ok
    end,
    Fun = fun (TeamInfo = #gods_duel_team{}, Rtn) ->
                  case check_sign_brief(TeamInfo, ThresholdInfo) of
                      true -> [TeamInfo | Rtn];
                      false -> Rtn
                  end
          end,
    case ets:foldl(Fun, [], gods_duel_team_data) of
        [] ->
            logger:debug("队伍统计信息为空", [], gods_duel_agent, 800),
            ok;
        TeamList ->
            logger:debug("注册队伍简讯:~w",
                         [TeamList],
                         gods_duel_agent,
                         803),
            SignFun = fun (#gods_duel_team{id = TeamId}, Rtn) ->
                              case gods_duel_team:lookup(TeamId) of
                                  {ok, Team} ->
                                      NewTeam =
                                          Team#gods_duel_team{qualification =
                                                                  1},
                                      gods_duel_team:save_team_data(NewTeam),
                                      [NewTeam | Rtn];
                                  _ -> Rtn
                              end;
                          (_Other, Rtn) -> Rtn
                      end,
            NewTeamList = lists:foldl(SignFun, [], TeamList),
            big_world:cast(gods_duel_mgr,
                           info,
                           [{sign_team, NewTeamList}])
    end,
    {noreply, State};
handle_info({update_match_profile, MatchProfile},
            State) ->
    update_match_profile(MatchProfile),
    {noreply, State};
handle_info(sync_voting,
            State = #state{voting = Voting,
                           status = SeasonStatus}) ->
    case get(vote_ref) of
        Ref when erlang:is_reference(Ref) ->
            erlang:cancel_timer(Ref);
        _ -> ok
    end,
    MatchRound = case gods_duel_common:get_match_index() of
                     {2, _MR} -> _MR;
                     _ -> 0
                 end,
    case Voting of
        [] -> ok;
        _ ->
            big_world:cast(gods_duel_mgr,
                           info,
                           [{sync_voting, MatchRound, Voting}])
    end,
    case SeasonStatus of
        24 -> start_vote_ref();
        26 -> start_vote_ref();
        28 -> start_vote_ref();
        30 -> start_vote_ref();
        _ -> ok
    end,
    {noreply, State#state{voting = []}};
handle_info({sync_poll, Poll}, State) ->
    update_poll(Poll),
    {noreply, State};
handle_info({vote_result, WTid, LTid, MatchRound},
            State) ->
    SeasonId = gods_duel_common:get_season_id(),
    ChoiceFun = fun (VoteChoice = #gods_duel_vote_choice{id
                                                             = TeamId,
                                                         match_round = MR},
                     Rtn)
                        when MR =:= MatchRound ->
                        case TeamId of
                            WTid ->
                                NV = VoteChoice#gods_duel_vote_choice{is_right =
                                                                          1},
                                [NV | Rtn];
                            LTid ->
                                NV = VoteChoice#gods_duel_vote_choice{is_right =
                                                                          2},
                                [NV | Rtn];
                            _ -> [VoteChoice | Rtn]
                        end;
                    (_Other, Rtn) -> [_Other | Rtn]
                end,
    VoteFun = fun (Vote = #gods_duel_vote{season =
                                              VoteSeason,
                                          choices = Choices},
                   _Rtn)
                      when VoteSeason =:= SeasonId ->
                      NewChoices = lists:foldl(ChoiceFun, [], Choices),
                      NewVote = Vote#gods_duel_vote{choices = NewChoices},
                      update_vote(NewVote);
                  (_, _Rtn) -> ok
              end,
    ets:foldl(VoteFun, ok, gods_duel_vote),
    {noreply, State};
handle_info(repare_group_match_1, State) ->
    repare_group_match_1(),
    {noreply, State};
handle_info(repare_final_match, State) ->
    repare_final_match(),
    {noreply, State};
handle_info({repare_dispense, Data}, State) ->
    ets:delete_all_objects(gods_duel_group_team),
    dets:delete_all_objects(gods_duel_group_team),
    save_team_group(Data),
    Fun1 = fun (#gods_duel_team{id = TeamId,
                                qualification = Qua, team_group_64 = Rank64,
                                win_times = W, loss_times = L,
                                team_group_256 = Rank256}) ->
                   case gods_duel_team:lookup(TeamId) of
                       {ok, Team = #gods_duel_team{}} ->
                           NewTeam = Team#gods_duel_team{qualification = Qua,
                                                         team_group_64 = Rank64,
                                                         win_times = W,
                                                         loss_times = L,
                                                         team_group_256 =
                                                             Rank256},
                           gods_duel_team:save_team_data(NewTeam);
                       _ -> ok
                   end
           end,
    Fun2 = fun ({_ZoneId, GroupTeamList}) ->
                   lists:foreach(Fun1, GroupTeamList)
           end,
    lists:foreach(Fun2, Data),
    {noreply, State};
handle_info({reset, IsClearGroup}, State) ->
    logger:debug("赛季重置", [], gods_duel_agent, 920),
    info(update_status),
    ets:delete_all_objects(gods_duel_team_data),
    dets:delete_all_objects(gods_duel_team_data),
    ets:delete_all_objects(gods_duel_team_role_ids),
    dets:delete_all_objects(gods_duel_team_role_ids),
    ets:delete_all_objects(gods_duel_vote),
    dets:delete_all_objects(gods_duel_vote),
    ets:delete_all_objects(gods_duel_poll),
    dets:delete_all_objects(gods_duel_poll),
    case IsClearGroup of
        true ->
            ets:delete_all_objects(gods_duel_group_team),
            dets:delete_all_objects(gods_duel_group_team);
        false -> ok
    end,
    ets:delete_all_objects(gods_duel_team_names),
    {noreply, State};
handle_info(vote_reset, State) ->
    ets:delete_all_objects(gods_duel_poll),
    dets:delete_all_objects(gods_duel_poll),
    ets:delete_all_objects(gods_duel_vote),
    dets:delete_all_objects(gods_duel_vote),
    {noreply, State};
handle_info(send_honor, State) ->
    honor_mgr:clear(gods_duel_champion_honor),
    honor_mgr:clear(gods_duel_second_honor),
    honor_mgr:clear(gods_duel_third_honor),
    honor_mgr:clear(gods_duel_fourth_honor),
    honor_mgr:clear(gods_duel_8_honor),
    HonorFun = fun (#gods_duel_team{id = TeamId,
                                    members = Members, qualification = Qua}) ->
                       case role_misc:is_local_role(TeamId) of
                           true ->
                               HonorInfo = case Qua of
                                               13 ->
                                                   {gods_duel_champion_honor,
                                                    11300};
                                               12 ->
                                                   {gods_duel_second_honor,
                                                    11301};
                                               10 ->
                                                   {gods_duel_third_honor,
                                                    11302};
                                               9 ->
                                                   {gods_duel_fourth_honor,
                                                    11303};
                                               6 -> {gods_duel_8_honor, 11304};
                                               _ -> false
                                           end,
                               case HonorInfo of
                                   false -> ok;
                                   {HonorAtom, HonorId} ->
                                       MateHonorIds = [{MateId, HonorId}
                                                       || #gods_duel_team_mate{id
                                                                                   =
                                                                                   MateId}
                                                              <- Members],
                                       honor_mgr:add(HonorAtom,
                                                     MateHonorIds,
                                                     date:unixtime() + 2592000),
                                       ok
                               end;
                           false -> ok
                       end;
                   (_) -> ok
               end,
    GroupFun = fun ({_ZoneId, TeamGroupList}, ok) ->
                       lists:foreach(HonorFun, TeamGroupList),
                       ok
               end,
    ets:foldl(GroupFun, ok, gods_duel_group_team),
    {noreply, State};
handle_info(notice_sign_mail, State) ->
    Fun = fun (#gods_duel_team{members = Members,
                               name = TeamName},
               ok)
                  when length(Members) < 5 ->
                  SeasonName = gods_duel_common:get_season_name(),
                  Title = lang:get("报名提醒"),
                  Content =
                      notice:format(lang:get("~ts赛季即将于~ts后报名截止，您的战队~ts人数不足~ts人，报名截止后将无法入围，请"
                                             "尽快补充队员。"),
                                    [{string_2, 1, SeasonName},
                                     {string_2, 5, lang:get("5小时")},
                                     {string_2, 2, TeamName},
                                     {string_2, 1, 5}]),
                  lists:foreach(fun (#gods_duel_team_mate{id = MateId}) ->
                                        mail:send(MateId, Title, Content)
                                end,
                                Members),
                  ok;
              (_, ok) -> ok
          end,
    ets:foldl(Fun, ok, gods_duel_team_data),
    {noreply, State};
handle_info(end_season, State) ->
    env:save(gods_season_status, 0),
    {noreply, State#state{status = 0}};
handle_info({set_vote_ratio, Ratio}, State) ->
    big_world:call(gods_duel_mgr,
                   info,
                   [{set_vote_ratio, Ratio}]),
    {noreply, State};
handle_info(print, State) ->
    logger:info("代理进程信息:~w",
                [State],
                gods_duel_agent,
                1025),
    {noreply, State};
handle_info({update_profile,
             P = #gods_duel_profile{id = Id, rank_lev = NewRankLev,
                                    gods_duel_score = NewGodsScore}},
            State) ->
    BRlev = case get_profile(Id) of
                #gods_duel_profile{rank_lev = Blv} -> Blv;
                _ -> 1
            end,
    case BRlev < NewRankLev of
        true ->
            case gods_duel_data:get_gods_lev(NewRankLev) of
                #{need_score := NeedScore, item_list := RewardList,
                  lev_name := LevName}
                    when NewGodsScore >= NeedScore ->
                    Msg =
                        lang:get("恭喜您在诸神之战中晋级为“~ts”，以下的荣誉奖励将伴随您继续征战，尽请查收。同时[聊天-"
                                 "荣誉]中，点击[诸神荣誉]即可与他人进行分享，万人膜拜哟{face_1,3}"),
                    Content = notice:format(Msg, [{string_1, LevName}]),
                    mail:send(Id,
                              #{title => lang:get("诸神荣誉晋级"), content => Content,
                                items => RewardList});
                _ ->
                    logger:debug("~ts",
                                 lang:get("配置出错"),
                                 gods_duel_agent,
                                 1042),
                    ignore
            end;
        false -> ignore
    end,
    case role_query:pid(by_id, Id) of
        {ok, Pid} ->
            role:apply(async,
                       Pid,
                       {gods_duel_role,
                        callback,
                        [{caculate_gods_duel_score, NewGodsScore}]});
        _ -> ignore
    end,
    update_gods_duel_profile(P),
    big_world:call(gods_duel_mgr,
                   info,
                   [{update_gods_duel_profile, P}]),
    {noreply, State};
handle_info({update_rank}, State) ->
    update_local_rank(),
    {noreply, State};
handle_info({update_team_rank, NewTeamRank}, State) ->
    update_team_rank(NewTeamRank),
    {noreply, State};
handle_info(_Info, State) ->
    logger:error("诸神之战代理进程收到未知的消息:~w",
                 [_Info],
                 gods_duel_agent,
                 1068),
    {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_notice(1, #{}) ->
    SeasonName = gods_duel_common:get_season_name(),
    Msg =
        notice:format(lang:get("~ts赛季即将开启，快去创建属于自己的战队，为了立于诸神之巅而奋勇拼搏吧！！！{face_"
                               "1,18}"),
                      [{string_2, 1, SeasonName}]),
    notice:cast(all, 5, Msg),
    ok;
do_notice(2, #{}) ->
    SeasonName = gods_duel_common:get_season_name(),
    Msg =
        notice:format(lang:get("~ts赛季开启报名啦，各战队队长快来报名吧，还没加入战队的同学们抓紧时间哦，诸神之巅的荣耀"
                               "正在向你们招手{face_1,7}"),
                      [{string_2, 1, SeasonName}]),
    notice:cast(all, 5, Msg),
    ok;
do_notice(3, #{}) ->
    SeasonName = gods_duel_common:get_season_name(),
    Msg =
        notice:format(lang:get("~ts赛季报名已截止，目前正在统计当中，5分钟后公布参赛战队及分组信息，战火即将点燃，你们"
                               "准备好了吗？{face_1,25}"),
                      [{string_2, 1, SeasonName}]),
    notice:cast(all, 5, Msg),
    ok;
do_notice(5, #{}) ->
    SeasonName = gods_duel_common:get_season_name(),
    Msg =
        notice:format(lang:get("~ts赛季小组赛~ts即将开始，大家开始入场，祝君旗开得胜{face_1, "
                               "15}"),
                      [{string_2, 1, SeasonName},
                       {string_2, 1, lang:get("第1轮")}]),
    notice:cast(all, 5, Msg),
    do_team_notice(5),
    ok;
do_notice(7, #{}) ->
    SeasonName = gods_duel_common:get_season_name(),
    Msg =
        notice:format(lang:get("~ts赛季小组赛~ts即将开始，大家开始入场，祝君旗开得胜{face_1, "
                               "15}"),
                      [{string_2, 1, SeasonName},
                       {string_2, 1, lang:get("第2轮")}]),
    notice:cast(all, 5, Msg),
    do_team_notice(7),
    ok;
do_notice(9, #{}) ->
    SeasonName = gods_duel_common:get_season_name(),
    Msg =
        notice:format(lang:get("~ts赛季小组赛~ts即将开始，大家开始入场，祝君旗开得胜{face_1, "
                               "15}"),
                      [{string_2, 1, SeasonName},
                       {string_2, 1, lang:get("第3轮")}]),
    notice:cast(all, 5, Msg),
    do_team_notice(9),
    ok;
do_notice(11, #{}) ->
    SeasonName = gods_duel_common:get_season_name(),
    Msg =
        notice:format(lang:get("~ts赛季小组赛~ts即将开始，大家开始入场，祝君旗开得胜{face_1, "
                               "15}"),
                      [{string_2, 1, SeasonName},
                       {string_2, 1, lang:get("第4轮")}]),
    notice:cast(all, 5, Msg),
    do_team_notice(11),
    ok;
do_notice(13, #{}) ->
    SeasonName = gods_duel_common:get_season_name(),
    Msg =
        notice:format(lang:get("~ts赛季小组赛~ts即将开始，大家开始入场，祝君旗开得胜{face_1, "
                               "15}"),
                      [{string_2, 1, SeasonName},
                       {string_2, 1, lang:get("第5轮")}]),
    notice:cast(all, 5, Msg),
    do_team_notice(13),
    ok;
do_notice(15, #{}) ->
    SeasonName = gods_duel_common:get_season_name(),
    Msg =
        notice:format(lang:get("~ts赛季小组赛~ts即将开始，大家开始入场，祝君旗开得胜{face_1, "
                               "15}"),
                      [{string_2, 1, SeasonName},
                       {string_2, 1, lang:get("第6轮")}]),
    notice:cast(all, 5, Msg),
    do_team_notice(15),
    ok;
do_notice(17, #{}) ->
    SeasonName = gods_duel_common:get_season_name(),
    Msg =
        notice:format(lang:get("~ts赛季小组赛~ts即将开始，大家开始入场，祝君旗开得胜{face_1, "
                               "15}"),
                      [{string_2, 1, SeasonName},
                       {string_2, 1, lang:get("第7轮")}]),
    notice:cast(all, 5, Msg),
    do_team_notice(17),
    ok;
do_notice(19, #{}) ->
    SeasonName = gods_duel_common:get_season_name(),
    Msg =
        notice:format(lang:get("~ts赛季淘汰赛~ts即将开始，大家开始入场，祝君旗开得胜{face_1, "
                               "15}"),
                      [{string_2, 1, SeasonName},
                       {string_2, 1, lang:get("64进32战")}]),
    notice:cast(all, 5, Msg),
    do_team_notice(19),
    ok;
do_notice(21, #{}) ->
    SeasonName = gods_duel_common:get_season_name(),
    Msg =
        notice:format(lang:get("~ts赛季淘汰赛~ts即将开始，大家开始入场，祝君旗开得胜{face_1, "
                               "15}"),
                      [{string_2, 1, SeasonName},
                       {string_2, 1, lang:get("32进16战")}]),
    notice:cast(all, 5, Msg),
    do_team_notice(21),
    ok;
do_notice(23, #{}) ->
    SeasonName = gods_duel_common:get_season_name(),
    Msg =
        notice:format(lang:get("~ts赛季淘汰赛~ts即将开始，大家开始入场，祝君旗开得胜{face_1, "
                               "15}"),
                      [{string_2, 1, SeasonName},
                       {string_2, 1, lang:get("16进8战")}]),
    notice:cast(all, 5, Msg),
    do_team_notice(23),
    ok;
do_notice(25, #{}) ->
    SeasonName = gods_duel_common:get_season_name(),
    Msg =
        notice:format(lang:get("~ts赛季淘汰赛~ts即将开始，大家开始入场，祝君旗开得胜{face_1, "
                               "15}"),
                      [{string_2, 1, SeasonName},
                       {string_2, 1, lang:get("8进4战")}]),
    notice:cast(all, 5, Msg),
    do_team_notice(25),
    ok;
do_notice(27, #{}) ->
    SeasonName = gods_duel_common:get_season_name(),
    Msg =
        notice:format(lang:get("~ts赛季淘汰赛~ts即将开始，大家开始入场，祝君旗开得胜{face_1, "
                               "15}"),
                      [{string_2, 1, SeasonName},
                       {string_2, 1, lang:get("半决赛")}]),
    notice:cast(all, 5, Msg),
    do_team_notice(27),
    ok;
do_notice(29, #{}) ->
    SeasonName = gods_duel_common:get_season_name(),
    Msg =
        notice:format(lang:get("~ts赛季淘汰赛~ts即将开始，大家开始入场，祝君旗开得胜{face_1, "
                               "15}"),
                      [{string_2, 1, SeasonName},
                       {string_2, 1, lang:get("季军赛")}]),
    notice:cast(all, 5, Msg),
    do_team_notice(29),
    ok;
do_notice(31, #{}) ->
    SeasonName = gods_duel_common:get_season_name(),
    Msg =
        notice:format(lang:get("~ts赛季淘汰赛~ts即将开始，大家开始入场，祝君旗开得胜{face_1, "
                               "15}"),
                      [{string_2, 1, SeasonName},
                       {string_2, 1, lang:get("决赛")}]),
    notice:cast(all, 5, Msg),
    do_team_notice(31),
    ok;
do_notice(150, #{}) ->
    logger:debug("yyyyyyyyyyyyyyyyyyyyyyyy",
                 [],
                 gods_duel_agent,
                 1188),
    SeasonName = gods_duel_common:get_season_name(),
    SeasonStatus = gods_duel_common:get_season_status(),
    Msg = case
              gods_duel_common:get_match_index(SeasonStatus)
              of
              {1, Value} ->
                  notice:format(lang:get("~ts赛季小组赛~ts正式开始，祝同学们力克强敌取得胜利{face_1,38}"),
                                [{string_2, 1, SeasonName},
                                 {string_2, 1, util:flist("第~w轮", [Value])}]);
              {2, MatchIndex} ->
                  FinalMatchName =
                      gods_duel_common:get_final_match_name(MatchIndex),
                  notice:format(lang:get("~ts赛季淘汰赛~ts正式开始，祝同学们力克强敌取得胜利{face_1,38}"),
                                [{string_2, 1, SeasonName},
                                 {string_2, 1, FinalMatchName}]);
              _ERR ->
                  logger:debug("yyyyyyyyyyyyyyyyyyyyyyyy~w",
                               [_ERR],
                               gods_duel_agent,
                               1198),
                  false
          end,
    case Msg of
        false -> ok;
        _ ->
            notice:cast(all, 5, Msg),
            ok
    end;
do_notice(151, _) ->
    SeasonName = gods_duel_common:get_season_name(),
    SeasonStatus = gods_duel_common:get_season_status(),
    case gods_duel_common:get_match_index(SeasonStatus - 1)
        of
        {1, Value} ->
            Msg = case Value =< 6 of
                      true ->
                          notice:format(lang:get("~ts赛季小组赛~ts结束，恭喜获得胜利的队伍，失败的队伍也不要气馁，让我们为他们双方喝彩"
                                                 "{face_1,38}"),
                                        [{string_2, 1, SeasonName},
                                         {string_2,
                                          1,
                                          util:flist("第~w轮", [Value])}]);
                      false ->
                          notice:format(lang:get("~ts赛季小组赛正式结束，恭喜晋级淘汰赛64强的队伍，愿你们所向披靡勇夺桂冠！{face_"
                                                 "1,18}"),
                                        [{string_2, 1, SeasonName}])
                  end,
            notice:cast(all, 5, Msg),
            ok;
        {2, MatchIndex} ->
            Msg = case MatchIndex of
                      1 ->
                          notice:format(lang:get("~ts赛季淘汰赛~ts结束，感谢双方队伍为我们奉上了精彩的比赛，同时恭喜晋级的队伍，让我们"
                                                 "为双方喝彩{face_1,38}"),
                                        [{string_2, 1, SeasonName},
                                         {string_2, 1, lang:get("64进32战")}]);
                      2 ->
                          notice:format(lang:get("~ts赛季淘汰赛~ts结束，感谢双方队伍为我们奉上了精彩的比赛，同时恭喜晋级的队伍，让我们"
                                                 "为双方喝彩{face_1,38}"),
                                        [{string_2, 1, SeasonName},
                                         {string_2, 1, lang:get("32进16战")}]);
                      3 ->
                          notice:format(lang:get("~ts赛季淘汰赛~ts结束，感谢双方队伍为我们奉上了精彩的比赛，同时恭喜晋级的队伍，让我们"
                                                 "为双方喝彩{face_1,38}"),
                                        [{string_2, 1, SeasonName},
                                         {string_2, 1, lang:get("16进8战")}]);
                      4 ->
                          notice:format(lang:get("~ts赛季淘汰赛~ts结束，感谢双方队伍为我们奉上了精彩的比赛，同时恭喜晋级的队伍，让我们"
                                                 "为双方喝彩{face_1,38}"),
                                        [{string_2, 1, SeasonName},
                                         {string_2, 1, lang:get("8进4战")}]);
                      5 ->
                          notice:format(lang:get("~ts赛季淘汰赛~ts正式结束，感谢双方队伍为我们奉上了精彩的比赛，恭喜获胜的战队，你们无"
                                                 "愧当世强者的美名，让我们为他们欢呼{face_1,25}"),
                                        [{string_2, 1, SeasonName},
                                         {string_2, 1, lang:get("半决赛")}]);
                      6 ->
                          notice:format(lang:get("~ts赛季淘汰赛~ts正式结束，感谢双方队伍为我们奉上了精彩的比赛，恭喜获胜的战队，你们无"
                                                 "愧当世强者的美名，让我们为他们欢呼{face_1,25}"),
                                        [{string_2, 1, SeasonName},
                                         {string_2, 1, lang:get("季军赛")}]);
                      7 ->
                          notice:format(lang:get("~ts赛季淘汰赛~ts正式结束，感谢双方队伍为我们奉上了精彩的比赛，恭喜获胜的战队，你们无"
                                                 "愧当世强者的美名，让我们为他们欢呼{face_1,25}"),
                                        [{string_2, 1, SeasonName},
                                         {string_2, 1, lang:get("决赛")}]);
                      _ -> lang:get("")
                  end,
            case length(Msg) > 0 of
                true -> notice:cast(all, 5, Msg);
                false -> ok
            end,
            ok;
        _ -> ok
    end;
do_notice(152, #{win_team_name := TeamName}) ->
    SeasonName = gods_duel_common:get_season_name(),
    Msg =
        notice:format(lang:get("~ts赛季淘汰赛~ts正式结束，恭喜战队~ts摘得~ts，你们无愧当世强者的美名，让我们为"
                               "他们欢呼!{face_1,25}"),
                      [{string_2, 1, SeasonName},
                       {string_2, 1, lang:get("季军赛")},
                       {string_2, 1, TeamName},
                       {string_2, 1, lang:get("季军")}]),
    notice:cast(all, 5, Msg);
do_notice(153,
          #{win_team_name := WinName, loss_team_name := LossName,
            match_zone := MatchZone}) ->
    SeasonName = gods_duel_common:get_season_name(),
    ZoneName = gods_duel_team:get_group_name(MatchZone),
    Msg =
        notice:format(lang:get("~ts赛季淘汰赛~ts~ts正式结束，恭喜战队~ts摘得~ts，踏上诸神之巅，同时恭喜~t"
                               "s获得~ts，双方的英姿都将永载史册！{face_1,38}"),
                      [{string_2, 1, SeasonName},
                       {string_2, 1, ZoneName},
                       {string_2, 1, lang:get("决赛")},
                       {string_2, 2, WinName},
                       {string_2, 6, lang:get("冠军桂冠")},
                       {string_2, 2, LossName},
                       {string_2, 4, lang:get("亚军奖杯")}]),
    notice:cast(all, 10, Msg),
    notice:cast(all, 5, Msg);
do_notice(_, _) -> ok.

do_team_notice(SeasonStatus) ->
    case gods_duel_common:get_match_index(SeasonStatus) of
        {1, Value} ->
            Fun = fun (#gods_duel_team{team_group_256 = SelfRank,
                                       members = Members, id = TeamId},
                       {TeamList, MatchIndex}) ->
                          TargetRank =
                              gods_duel_team:get_target_rank(SeasonStatus,
                                                             SelfRank),
                          case role_misc:is_local_role(TeamId) of
                              true ->
                                  case lists:keyfind(TargetRank,
                                                     #gods_duel_team.team_group_256,
                                                     TeamList)
                                      of
                                      #gods_duel_team{name = TargetTeamName} ->
                                          {MatchTypeName, CombatName} = case
                                                                            gods_duel_common:get_match_index(SeasonStatus)
                                                                            of
                                                                            {1,
                                                                             MatchIndex} ->
                                                                                {lang:get("小组赛"),
                                                                                 util:flist("第~w轮",
                                                                                            [MatchIndex])};
                                                                            {2,
                                                                             MatchIndex} ->
                                                                                {lang:get("淘汰赛"),
                                                                                 gods_duel_common:get_final_match_name(MatchIndex)};
                                                                            _ ->
                                                                                {lang:get("比赛"),
                                                                                 lang:get("")}
                                                                        end,
                                          Msg =
                                              notice:format(lang:get("您所属的战队与~ts的~ts~ts即将开始，请尽快入场，加油！{face_1,38}"),
                                                            [{string_2,
                                                              1,
                                                              TargetTeamName},
                                                             {string_1,
                                                              MatchTypeName},
                                                             {string_2,
                                                              1,
                                                              CombatName}]),
                                          lists:foreach(fun
                                                            (#gods_duel_team_mate{id
                                                                                      =
                                                                                      MateId,
                                                                                  name
                                                                                      =
                                                                                      _MateName}) ->
                                                                notice:send(MateId,
                                                                            5,
                                                                            Msg)
                                                        end,
                                                        Members),
                                          {TeamList, MatchIndex};
                                      _ -> {TeamList, MatchIndex}
                                  end;
                              false -> {TeamList, MatchIndex}
                          end;
                      (_, Rtn) -> Rtn
                  end,
            NoticeFun = fun ({_ZoneId, TeamList}, _) ->
                                lists:foldl(Fun, {TeamList, Value}, TeamList),
                                ok
                        end,
            ets:foldl(NoticeFun, true, gods_duel_group_team),
            ok;
        {2, MatchRound} ->
            logger:debug("==================",
                         [],
                         gods_duel_agent,
                         1301),
            MatchQua =
                gods_duel_common:get_final_match_qua(MatchRound),
            MatchTableList =
                gods_duel_common:get_gods_duel_match_list(MatchRound),
            FinalMatchName =
                gods_duel_common:get_final_match_name(MatchRound),
            Fun = fun (#gods_duel_team{members = Members,
                                       qualification = TeamQua, id = TeamId,
                                       team_group_64 = SelfRank},
                       GroupTeamList)
                          when TeamQua >= 3 ->
                          case role_misc:is_local_role(TeamId) of
                              true ->
                                  case lists:filter(fun ({_, TeamRankList}) ->
                                                            lists:member(SelfRank,
                                                                         TeamRankList)
                                                    end,
                                                    MatchTableList)
                                      of
                                      [{_, TeamRankList}] ->
                                          MatchTeams = lists:filter(fun
                                                                        (#gods_duel_team{qualification
                                                                                             =
                                                                                             Qua,
                                                                                         id
                                                                                             =
                                                                                             Id,
                                                                                         team_group_64
                                                                                             =
                                                                                             Rank}) ->
                                                                            Qua
                                                                                =:=
                                                                                MatchQua
                                                                                andalso
                                                                                lists:member(Rank,
                                                                                             TeamRankList)
                                                                                    andalso
                                                                                    Id
                                                                                        =/=
                                                                                        TeamId
                                                                    end,
                                                                    GroupTeamList),
                                          case MatchTeams of
                                              [#gods_duel_team{name =
                                                                   TargetTeamName}] ->
                                                  logger:debug("==================:~w",
                                                               [TeamId],
                                                               gods_duel_agent,
                                                               1317),
                                                  Msg =
                                                      notice:format(lang:get("您所属的战队与~ts的淘汰赛~ts即将开始，请尽快入场，加油！{face_1,25}"),
                                                                    [{string_2,
                                                                      1,
                                                                      TargetTeamName},
                                                                     {string_2,
                                                                      1,
                                                                      FinalMatchName}]),
                                                  lists:foreach(fun
                                                                    (#gods_duel_team_mate{id
                                                                                              =
                                                                                              MateId,
                                                                                          name
                                                                                              =
                                                                                              _MateName}) ->
                                                                        notice:send(MateId,
                                                                                    5,
                                                                                    Msg)
                                                                end,
                                                                Members),
                                                  GroupTeamList;
                                              _Err ->
                                                  logger:debug("==================:~w",
                                                               [_Err],
                                                               gods_duel_agent,
                                                               1326),
                                                  GroupTeamList
                                          end;
                                      _Err ->
                                          logger:debug("==================:~w",
                                                       [_Err],
                                                       gods_duel_agent,
                                                       1330),
                                          GroupTeamList
                                  end;
                              false -> GroupTeamList
                          end;
                      (_, GroupTeamList) -> GroupTeamList
                  end,
            NoticeFun = fun ({_ZoneId, TeamList}, _) ->
                                lists:foldl(Fun, TeamList, TeamList),
                                ok
                        end,
            ets:foldl(NoticeFun, true, gods_duel_group_team);
        _ -> ok
    end.

check_sign_brief(_, []) -> true;
check_sign_brief(#gods_duel_team{lev = GroupNum,
                                 fight_capacity = Fc, member_num = Num},
                 ThresholdInfo)
    when Num >= 5 ->
    case lists:keyfind(GroupNum, 1, ThresholdInfo) of
        {_, ThresholdValue} when Fc > ThresholdValue -> true;
        _Else ->
            logger:debug("低于阈值:~w",
                         [{Fc, _Else}],
                         gods_duel_agent,
                         1352),
            true
    end;
check_sign_brief(_Else, _) ->
    logger:debug("战队数据不符合报名", [], gods_duel_agent, 1356),
    false.

modify_team_group_info([]) -> ok;
modify_team_group_info([{_ZoneId, GroupList} | Rest]) ->
    modify_team_group_info(team_group, GroupList),
    modify_team_group_info(Rest).

modify_team_group_info(team_group, []) -> ok;
modify_team_group_info(team_group,
                       [#gods_duel_team{id = TeamId, team_group_256 = Rank}
                        | Rest]) ->
    case gods_duel_team:lookup(TeamId) of
        {ok,
         TeamInfo = #gods_duel_team{lev = Lev, name = TeamName,
                                    members = Members}} ->
            NewTeamInfo = TeamInfo#gods_duel_team{qualification = 2,
                                                  team_group_256 = Rank,
                                                  win_times = 0,
                                                  loss_times = 0},
            gods_duel_team:save_team_data(NewTeamInfo),
            RealGroup = gods_duel_common:get_line_num(Rank),
            ZoneName = case (RealGroup - 1) div 8 + 1 of
                           1 -> lang:get("A");
                           2 -> lang:get("B");
                           3 -> lang:get("C");
                           4 -> lang:get("D");
                           _ -> lang:get("A")
                       end,
            Index = (RealGroup - 1) rem 8 + 1,
            Args = #{team_name => TeamName, team_lev => Lev,
                     zone_name => ZoneName, index => Index},
            gods_duel_team:send_mail(qualification_256,
                                     Members,
                                     Args),
            modify_team_group_info(team_group, Rest);
        _ -> modify_team_group_info(team_group, Rest)
    end;
modify_team_group_info(team_group, [_Oth | Rest]) ->
    modify_team_group_info(team_group, Rest).

save_team_group([]) -> ok;
save_team_group([{ZoneId, TeamGroupList} | Rest]) ->
    ets:insert(gods_duel_group_team,
               {ZoneId, TeamGroupList}),
    dets:insert(gods_duel_group_team,
                {ZoneId, TeamGroupList}),
    save_team_group(Rest).

update_match_profile(MatchProfile) ->
    ets:insert(gods_duel_match_profile, MatchProfile),
    dets:insert(gods_duel_match_profile, MatchProfile),
    ok.

lookup_match_profile(CombatRecordId) ->
    case catch ets:lookup(gods_duel_match_profile,
                          CombatRecordId)
        of
        [MatchProfile = #gods_duel_match_profile{}] ->
            {ok, MatchProfile};
        _ -> false
    end.

update_vote(VoteInfo) ->
    ets:insert(gods_duel_vote, VoteInfo),
    dets:insert(gods_duel_vote, VoteInfo),
    ok.

update_poll(Poll) ->
    ets:insert(gods_duel_poll, Poll),
    dets:insert(gods_duel_poll, Poll),
    ok.

update_season_data(SeasonData) ->
    ets:insert(gods_duel_season_data, SeasonData),
    dets:insert(gods_duel_season_data, SeasonData).

update_gods_duel_profile(Profile) ->
    ets:insert(gods_duel_profile, Profile),
    dets:insert(gods_duel_profile, Profile).

update_season_id(SeasonId) ->
    case ets:lookup(gods_duel_season_data,
                    gods_duel_season_data)
        of
        [Data = #gods_duel_season_data{}] ->
            NewData = Data#gods_duel_season_data{serial_id =
                                                     SeasonId},
            update_season_data(NewData);
        _ -> ok
    end.

save_qua64_team([]) -> ok;
save_qua64_team([{ZoneId, Qua64Teams} | Rest]) ->
    Fun = fun (GTeam = #gods_duel_team{id = TeamId}, Rtn) ->
                  lists:keystore(TeamId, #gods_duel_team.id, Rtn, GTeam)
          end,
    case ets:lookup(gods_duel_group_team, ZoneId) of
        [{_, GroupTeamList}] ->
            NewGroupTeamList = lists:foldl(Fun,
                                           GroupTeamList,
                                           Qua64Teams),
            save_team_group([{ZoneId, NewGroupTeamList}]);
        _ -> ok
    end,
    save_qua64_team(Rest);
save_qua64_team([_ | Rest]) -> save_qua64_team(Rest).

notice(NoticeIndex) -> do_notice(NoticeIndex, #{}).

get_role_vote(RoleId) ->
    SeasonId = gods_duel_common:get_season_id(),
    case gods_duel_common:get_match_index() of
        {2, MatchRound} ->
            Polls = ets:match_object(gods_duel_poll,
                                     #gods_duel_poll{match_round = MatchRound,
                                                     _ = '_'}),
            case ets:lookup(gods_duel_vote, RoleId) of
                [#gods_duel_vote{season = SeasonId,
                                 choices = Choices}] ->
                    {Choices, Polls};
                _ -> {[], Polls}
            end;
        _ -> {[], []}
    end.

send_failed_mail() ->
    Fun = fun (#gods_duel_team{name = TeamName,
                               members = Members,
                               qualification = Qualification},
               _Rtn)
                  when Qualification =:= 1 ->
                  gods_duel_team:send_mail(loss_group, Members, TeamName),
                  true;
              (_, Rtn) -> Rtn
          end,
    ets:foldl(Fun, false, gods_duel_team_data).

query_forget_sign_team() ->
    {Count, Forgets} = ets:foldl(fun
                                     (#gods_duel_team{member_num = Num,
                                                      members = Members,
                                                      qualification = 0},
                                      {R, RtnMembers})
                                         when Num >= 5 ->
                                         MateList = [{Plat, Zone, Name, Fc}
                                                     || #gods_duel_team_mate{id
                                                                                 =
                                                                                 {_,
                                                                                  Plat,
                                                                                  Zone},
                                                                             name
                                                                                 =
                                                                                 Name,
                                                                             fight_capacity
                                                                                 =
                                                                                 Fc}
                                                            <- Members],
                                         {R + 1, MateList ++ RtnMembers};
                                     (_, R) -> R
                                 end,
                                 {0, []},
                                 gods_duel_team_data),
    util:cn("   未报名战队数:                 ~40w~n", [Count]),
    lists:foreach(fun ({Platfrom,
                        ZoneId,
                        RoleName,
                        TotalFc}) ->
                          util:cn("渠道：~ts  区服:~w  角色名:~ts  综合战力:~w~n",
                                  [Platfrom, ZoneId, RoleName, TotalFc])
                  end,
                  Forgets).

repare_forget_sign_team() ->
    TeamList = ets:foldl(fun (Team =
                                  #gods_duel_team{qualification = Qua},
                              Rtn)
                                 when Qua >= 1 ->
                                 RtnTeam = Team#gods_duel_team{applys = []},
                                 [RtnTeam | Rtn];
                             (_, Rtn) -> Rtn
                         end,
                         [],
                         gods_duel_team_data),
    logger:debug("更新队伍信息:~w",
                 [TeamList],
                 gods_duel_agent,
                 1503),
    big_world:cast(gods_duel_mgr,
                   info,
                   [{update_team_members, TeamList}]).

repare_group_match_1() ->
    logger:debug("============", [], gods_duel_agent, 1509),
    LossTeamList = get_season_2loss_team(),
    ets:foldl(fun (Team = #gods_duel_team{id = Id,
                                          members = Members,
                                          loss_times = LossTimes,
                                          win_times = WinTimes},
                   ok) ->
                      case lists:member(Id, LossTeamList) of
                          true ->
                              NewTeam = Team#gods_duel_team{loss_times =
                                                                LossTimes - 1,
                                                            win_times =
                                                                WinTimes + 1},
                              gods_duel_team:save_team_data(NewTeam),
                              Title = lang:get("诸神S2第一场处理"),
                              Content =
                                  lang:get("由于部分参赛队员反馈在第一场时无法看到活动图标，经诸神之战赛制委员会研究决定，将您的第一场"
                                           "比赛成绩改为“胜利”，希望你们在接下来的比赛中势如破竹，一举夺魁{face_1,1}"),
                              [mail:send(MateId, Title, Content)
                               || #gods_duel_team_mate{id = MateId} <- Members],
                              big_world:call(gods_duel_mgr,
                                             info,
                                             [{repare_group_match_1,
                                               NewTeam#gods_duel_team{applys =
                                                                          []}}]),
                              ok;
                          false -> ok
                      end
              end,
              ok,
              gods_duel_team_data).

check_vote([], #{done := Done}) -> {ok, Done};
check_vote([TeamId | Rest],
           Args = #{match_round := MatchRound,
                    match_zone := ZoneId, match_teams := MatchTeams,
                    done := Done}) ->
    case ets:lookup(gods_duel_group_team, ZoneId) of
        [{_, TeamGroupList}] ->
            case lists:keyfind(TeamId,
                               #gods_duel_team.id,
                               TeamGroupList)
                of
                #gods_duel_team{team_group_64 = SelfRank} ->
                    Fun = fun ({_, RankList}) ->
                                  lists:member(SelfRank, RankList)
                          end,
                    CheckResult = lists:map(Fun, MatchTeams),
                    case lists:member(true, CheckResult) of
                        true ->
                            Choice = #gods_duel_vote_choice{id = TeamId,
                                                            match_round =
                                                                MatchRound,
                                                            match_zone = ZoneId,
                                                            is_right = 0},
                            check_vote(Rest, Args#{done => [Choice | Done]});
                        false -> {false, lang:get("您选择的队伍不能参加本次对决哦")}
                    end;
                _ -> {false, lang:get("您选择的队伍不能参加本次对决哦")}
            end;
        _ -> {false, lang:get("您选择的队伍不能参加本次对决哦")}
    end;
check_vote(_, _) -> {ok, []}.

acc_voting([], Voting) -> Voting;
acc_voting([Gid | T], Voting) ->
    logger:debug("==============:~w",
                 [{Gid, 1, Voting}],
                 gods_duel_agent,
                 1562),
    case lists:keyfind(Gid, 1, Voting) of
        {Gid, Num} ->
            acc_voting(T,
                       lists:keyreplace(Gid, 1, Voting, {Gid, Num + 1}));
        _ -> acc_voting(T, [{Gid, 1} | Voting])
    end.

start_vote_ref() ->
    TimeOut = 300000,
    VoteRef = erlang:send_after(TimeOut,
                                self(),
                                sync_voting),
    put(vote_ref, VoteRef).

get_match_teams_odds(MatchRound) ->
    MatchTableList =
        gods_duel_common:get_gods_duel_match_list(MatchRound),
    {LossQua, WinQua} =
        gods_duel_common:get_final_match_combat_qua(MatchRound),
    MatchTableFun = fun ({ZoneId, GroupTeamList},
                         MatchTableRtn) ->
                            MatchTeamOdds = lists:foldl(fun ({_MatchId,
                                                              RankList},
                                                             RtnOdds) ->
                                                                Teams =
                                                                    lists:filter(fun
                                                                                     (#gods_duel_team{team_group_64
                                                                                                          =
                                                                                                          TeamRank,
                                                                                                      qualification
                                                                                                          =
                                                                                                          Qua}) ->
                                                                                         lists:member(TeamRank,
                                                                                                      RankList)
                                                                                             andalso
                                                                                             (Qua
                                                                                                  =:=
                                                                                                  LossQua
                                                                                                  orelse
                                                                                                  Qua
                                                                                                      =:=
                                                                                                      WinQua)
                                                                                 end,
                                                                                 GroupTeamList),
                                                                TotalVotedFun =
                                                                    fun
                                                                        (#gods_duel_team{id
                                                                                             =
                                                                                             TeamId},
                                                                         Rtn) ->
                                                                            case
                                                                                ets:lookup(gods_duel_poll,
                                                                                           TeamId)
                                                                                of
                                                                                [#gods_duel_poll{voted_cnt
                                                                                                     =
                                                                                                     VotedCnt}] ->
                                                                                    VotedCnt
                                                                                        +
                                                                                        Rtn;
                                                                                _ ->
                                                                                    Rtn
                                                                            end;
                                                                        (_,
                                                                         Rtn) ->
                                                                            Rtn
                                                                    end,
                                                                TotalVotedCnt =
                                                                    lists:foldl(TotalVotedFun,
                                                                                1,
                                                                                Teams),
                                                                logger:debug("参赛队伍:~w",
                                                                             [{ZoneId,
                                                                               _MatchId,
                                                                               Teams,
                                                                               TotalVotedCnt}],
                                                                             gods_duel_agent,
                                                                             1601),
                                                                OddsFun = fun
                                                                              (#gods_duel_team{id
                                                                                                   =
                                                                                                   TeamId},
                                                                               Rtn) ->
                                                                                  case
                                                                                      ets:lookup(gods_duel_poll,
                                                                                                 TeamId)
                                                                                      of
                                                                                      [#gods_duel_poll{voted_cnt
                                                                                                           =
                                                                                                           VotedCnt}] ->
                                                                                          logger:debug("=============:~w",
                                                                                                       [TeamId],
                                                                                                       gods_duel_agent,
                                                                                                       1607),
                                                                                          case
                                                                                              TotalVotedCnt
                                                                                                  =<
                                                                                                  100
                                                                                              of
                                                                                              true ->
                                                                                                  [{TeamId,
                                                                                                    1000}
                                                                                                   | Rtn];
                                                                                              false ->
                                                                                                  Odds =
                                                                                                      max(min(1700,
                                                                                                              round((TotalVotedCnt
                                                                                                                         -
                                                                                                                         VotedCnt)
                                                                                                                        /
                                                                                                                        TotalVotedCnt
                                                                                                                        *
                                                                                                                        2000)),
                                                                                                          300),
                                                                                                  [{TeamId,
                                                                                                    Odds}
                                                                                                   | Rtn]
                                                                                          end;
                                                                                      _Else ->
                                                                                          logger:debug("=============:~w",
                                                                                                       [_Else],
                                                                                                       gods_duel_agent,
                                                                                                       1621),
                                                                                          Rtn
                                                                                  end;
                                                                              (_Else,
                                                                               Rtn) ->
                                                                                  logger:debug("=============:~w",
                                                                                               [_Else],
                                                                                               gods_duel_agent,
                                                                                               1625),
                                                                                  Rtn
                                                                          end,
                                                                TeamOadds =
                                                                    lists:foldl(OddsFun,
                                                                                [],
                                                                                Teams),
                                                                logger:debug("=============:~w",
                                                                             [{TeamOadds}],
                                                                             gods_duel_agent,
                                                                             1629),
                                                                TeamOadds ++
                                                                    RtnOdds
                                                        end,
                                                        ok,
                                                        MatchTableList),
                            [{ZoneId, MatchTeamOdds} | MatchTableRtn]
                    end,
    ets:foldl(MatchTableFun, [], gods_duel_group_team).

repare_final_match() ->
    Fun = fun (T = #gods_duel_team{id = Id,
                                   members = Members, qualification = Qua},
               Rtn)
                  when Qua >= 3 ->
                  RtnTeam = case Id of
                                {4882, "ios", 36} ->
                                    NT = T#gods_duel_team{qualification = 4},
                                    gods_duel_team:save_team_data(NT),
                                    Title = lang:get("战队晋级"),
                                    Content =
                                        lang:get("您所属的战队老婆最大在诸神之战淘汰赛64进32战比赛中胜利但却被淘汰，现该问题已修复，很高"
                                                 "兴的通知您，根据战斗结果您的战队老婆最大成功晋级32强，请于今晚22:35准时参与诸神之战"
                                                 "32进16强战。"),
                                    lists:foreach(fun (#gods_duel_team_mate{id =
                                                                                MateId}) ->
                                                          mail:send(MateId,
                                                                    Title,
                                                                    Content)
                                                  end,
                                                  Members),
                                    NT;
                                {6983, "mix", 34} ->
                                    NT = T#gods_duel_team{qualification = 3},
                                    gods_duel_team:save_team_data(NT),
                                    Title = lang:get("战队晋级失败通知"),
                                    Content =
                                        lang:get("您所属的战队冰封火箭队诸神之战淘汰赛64进32战比赛中失败但却晋级32强，现该问题已修复，"
                                                 "很遗憾的通知您，根据战斗结果您的战队冰封火箭队止步64强，战队将无法参与之后的比赛，祝下赛"
                                                 "季取得更好的成绩。"),
                                    lists:foreach(fun (#gods_duel_team_mate{id =
                                                                                MateId}) ->
                                                          mail:send(MateId,
                                                                    Title,
                                                                    Content)
                                                  end,
                                                  Members),
                                    NT;
                                _ -> T
                            end,
                  [RtnTeam | Rtn];
              (_Other, Rtn) -> Rtn
          end,
    RepairTeam = ets:foldl(Fun, [], gods_duel_team_data),
    big_world:cast(gods_duel_mgr,
                   info,
                   [{repare_final_match, RepairTeam}]).

update_local_rank() ->
    L = ets:tab2list(gods_duel_profile),
    L2 = gods_duel_rank:sort_group(L),
    ets:insert(gods_duel_rank_local, L2),
    dets:insert(gods_duel_rank_local, L2).

update_rank(L) ->
    dets:delete_all_objects(gods_duel_rank),
    ets:delete_all_objects(gods_duel_rank),
    ets:insert(gods_duel_rank, L),
    dets:insert(gods_duel_rank, L),
    gods_duel_agent ! {update_rank}.

update_team_rank(TeamRank) ->
    ets:insert(gods_duel_team_rank, TeamRank),
    dets:insert(gods_duel_team_rank, TeamRank).

get_season_2loss_team() ->
    [{13743, "beta", 43}, {5749, "mix", 33}].

gm_update_team_group() ->
    UpdateLevFun = fun (#gods_duel_team{id = TeamId,
                                        lev = GroupId}) ->
                           case role_misc:is_local_role(TeamId) of
                               true ->
                                   case gods_duel_team:lookup(TeamId) of
                                       {ok,
                                        Team = #gods_duel_team{lev = NowGroup}}
                                           when NowGroup =/= GroupId ->
                                           NewTeam = Team#gods_duel_team{lev =
                                                                             GroupId},
                                           gods_duel_team:save_team_data(NewTeam);
                                       _ -> ok
                                   end;
                               _ -> ok
                           end
                   end,
    GroupTeamFun = fun ({_, TeamList}, _) ->
                           lists:foreach(UpdateLevFun, TeamList)
                   end,
    ets:foldl(GroupTeamFun, ok, gods_duel_group_team).

gm_get_honor(SeasonNum, Group, Quality) ->
    case ets:tab2list(gods_duel_season_data) of
        [#gods_duel_season_data{history_season_info =
                                    SeasonInfo}] ->
            case lists:keyfind(SeasonNum,
                               #gods_duel_season_info.id,
                               SeasonInfo)
                of
                #gods_duel_season_info{teams = Teams} ->
                    case lists:keyfind(Group, 1, Teams) of
                        {_, GTeams} ->
                            case lists:keyfind(Quality,
                                               #gods_duel_team.qualification,
                                               GTeams)
                                of
                                #gods_duel_team{id = Lid, members = Members} ->
                                    case role_misc:is_local_role(Lid) of
                                        true -> {ok, Members};
                                        _ -> {false, Members}
                                    end;
                                _ ->
                                    logger:debug("~w",
                                                 [GTeams],
                                                 gods_duel_agent,
                                                 1726),
                                    {ok, lang:get("未找到队伍信息")}
                            end;
                        _ ->
                            logger:debug("~w", [Teams], gods_duel_agent, 1730),
                            {false, lang:get("未找到组别数据")}
                    end
            end;
        _ -> {ok, lang:get("未找到该赛季的队伍信息")}
    end.

gm_send_honor(SeasonNum, Group, Quality) ->
    case ets:tab2list(gods_duel_season_data) of
        [#gods_duel_season_data{history_season_info =
                                    SeasonInfo}] ->
            case lists:keyfind(SeasonNum,
                               #gods_duel_season_info.id,
                               SeasonInfo)
                of
                #gods_duel_season_info{teams = Teams} ->
                    case lists:keyfind(Group, 1, Teams) of
                        {_, GTeams} ->
                            case lists:keyfind(Quality,
                                               #gods_duel_team.qualification,
                                               GTeams)
                                of
                                #gods_duel_team{id = Lid, members = Members} ->
                                    case role_misc:is_local_role(Lid) of
                                        true -> send_honor(Quality, Members);
                                        _ -> {false, Members}
                                    end;
                                _ ->
                                    logger:debug("~w",
                                                 [GTeams],
                                                 gods_duel_agent,
                                                 1754),
                                    {ok, lang:get("未找到该赛季的该队伍信息")}
                            end;
                        _ ->
                            logger:debug("~w", [Teams], gods_duel_agent, 1758),
                            {false, lang:get("未找到该组数据")}
                    end
            end;
        _ -> {ok, lang:get("未找到该赛季的队伍信息")}
    end.

send_honor(Qua, Members) ->
    HonorInfo = case Qua of
                    13 -> {gods_duel_champion_honor, 11300};
                    12 -> {gods_duel_second_honor, 11301};
                    10 -> {gods_duel_third_honor, 11302};
                    9 -> {gods_duel_fourth_honor, 11303};
                    6 -> {gods_duel_8_honor, 11304};
                    _ -> false
                end,
    case HonorInfo of
        false -> ok;
        {HonorAtom, HonorId} ->
            MateHonorIds = [{MateId, HonorId}
                            || #gods_duel_team_mate{id = MateId} <- Members],
            honor_mgr:add(HonorAtom,
                          MateHonorIds,
                          date:unixtime() + 2592000),
            ok
    end.

