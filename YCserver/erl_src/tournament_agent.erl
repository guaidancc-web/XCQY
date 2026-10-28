-file("src/mod/tournament/tournament_agent.erl", 1).

-module(tournament_agent).

-behaviour(gen_server).

-export([start_link/0,
         update_profile/1,
         get_profile/1,
         local_profile/1,
         get_result/1,
         local_result/1,
         change_top_lev/1,
         ban_reported/1,
         sync_profile/1,
         push_matched/2,
         combat_over/2,
         fight_result/1,
         update_rank/2,
         update_rank/3,
         like/3,
         report/4,
         get_badge_record/1,
         role_badge_record/1,
         gm/1]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

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

-file("src/mod/tournament/tournament_agent.erl", 33).

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

-file("src/mod/tournament/tournament_agent.erl", 34).

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

-file("src/mod/tournament/tournament_agent.erl", 35).

-file("inc/tournament.hrl", 1).

-record(m_tournament,
        {ver = 3 :: non_neg_integer(),
         triggers = [] :: list(),
         status = 0 :: non_neg_integer(),
         rewarded = [] :: list(),
         pk_type = 0,
         kingbadgenum = 0,
         starlev = 0,
         kingbadge = [] :: list(),
         showbadge = 0}).

-record(tournament_profile,
        {id = {0, "", 0} :: tuple(),
         ver = 11 :: non_neg_integer(),
         name = "" :: string(),
         lev = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         rank_point = 0 :: non_neg_integer(),
         liked = 0 :: non_neg_integer(),
         liked_other = 0 :: non_neg_integer(),
         last_matched = 0 :: non_neg_integer(),
         day_matched = 0 :: non_neg_integer(),
         day_win = 0 :: non_neg_integer(),
         day_win_sustained = 0 :: non_neg_integer(),
         season_rank_lev = 1 :: non_neg_integer(),
         season_rank_point = 0 :: non_neg_integer(),
         combat_count = 0 :: non_neg_integer(),
         win_count = 0 :: non_neg_integer(),
         win_sustained = 0 :: non_neg_integer(),
         season_kill = 0 :: non_neg_integer(),
         season_reverse = 0 :: non_neg_integer(),
         season_revive = 0 :: non_neg_integer(),
         season_dmg = 0 :: non_neg_integer(),
         season_bearing_dmg = 0 :: non_neg_integer(),
         season_zero_dmg = 0 :: non_neg_integer(),
         season_pet_revive = 0 :: non_neg_integer(),
         best_rank_point = 0 :: non_neg_integer(),
         best_rank_lev = 1 :: non_neg_integer(),
         best_win_count = 0 :: non_neg_integer(),
         best_win_sustained = 0 :: non_neg_integer(),
         best_partner = [] :: list(),
         week_rank_lev = 1 :: non_neg_integer(),
         week_rank_point = 0 :: non_neg_integer(),
         awesome_kill = 0 :: non_neg_integer(),
         awesome_kill_num = 0 :: non_neg_integer(),
         awesome_dmg = 0 :: non_neg_integer(),
         awesome_heal = 0 :: non_neg_integer(),
         awesome_control = 0 :: non_neg_integer(),
         mvp = 0 :: non_neg_integer(),
         loss_mvp = 0 :: non_neg_integer(),
         season_awesome_kill = 0 :: non_neg_integer(),
         season_awesome_kill_num = 0 :: non_neg_integer(),
         season_awesome_dmg = 0 :: non_neg_integer(),
         season_awesome_heal = 0 :: non_neg_integer(),
         season_awesome_control = 0 :: non_neg_integer(),
         season_mvp = 0 :: non_neg_integer(),
         season_loss_mvp = 0 :: non_neg_integer(),
         consecutive_lost = 0 :: non_neg_integer(),
         reported = 0 :: non_neg_integer(),
         reported_other = 0 :: non_neg_integer(),
         reported_logs = [] :: list(),
         banned_date = 0 :: non_neg_integer(),
         reported_single_match = 0,
         is_auto_combat = 0,
         guards = [],
         historical_high = 0 :: non_neg_integer(),
         show_badge_id = 0 :: non_neg_integer(),
         promotion_win = 0 :: non_neg_integer(),
         upgrade_point = 0 :: non_neg_integer()}).

-record(tournament_role,
        {id = {0, "", 0} :: tuple(),
         status = 0 :: non_neg_integer(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         fc = 0 :: non_neg_integer(),
         looks = [] :: list(),
         times = 1 :: non_neg_integer(),
         point = 1 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         rank_point = 0 :: non_neg_integer(),
         pid :: undefined | pid() | 0,
         is_online = 0 :: 0 | 1,
         match_id = 0 :: non_neg_integer(),
         side = 0 :: non_neg_integer(),
         is_leader = 0 :: 0 | 1,
         last_matched = 0 :: non_neg_integer(),
         team_id = [] :: list(),
         formation_id = 1 :: non_neg_integer(),
         formation_lev = 1 :: non_neg_integer(),
         partner = [] :: list(),
         consecutive_lost = 0 :: non_neg_integer(),
         reported = 0 :: non_neg_integer(),
         guards = [],
         show_badge_id = 0 :: non_neg_integer()}).

-record(tournament_team,
        {ids = [] :: list(),
         output_num = 0 :: non_neg_integer(),
         assist_num = {0, 0} ::
             {non_neg_integer(), non_neg_integer()},
         origin_ids = [] :: list(),
         num = 1 :: non_neg_integer(),
         sum_point = 0 :: non_neg_integer(),
         max_point = 0 :: non_neg_integer(),
         min_point = 0 :: non_neg_integer(),
         sum_lev = 0 :: non_neg_integer(),
         max_lev = 0 :: non_neg_integer(),
         min_lev = 0 :: non_neg_integer(),
         tried_match = 0 :: non_neg_integer(),
         match_id = 0 :: non_neg_integer(),
         usurpers = [] :: list(),
         order = [] :: list(),
         classes = [] :: list()}).

-record(tournament_match,
        {id = 0 :: non_neg_integer(),
         teams = [] :: list(),
         time = 0 :: non_neg_integer(),
         combat_pid :: undefined | pid(),
         calc_args = [] :: list()}).

-record(tournament_usurper,
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

-record(tournament_celebrity,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer()}).

-record(tournament_fighter,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         rank_point = 0 :: non_neg_integer(),
         kill_num = 0,
         dead_num = 0,
         total_heal = 0,
         control_num = 0,
         total_hurt = 0 :: non_neg_integer(),
         total_dmg = 0 :: non_neg_integer(),
         mvp_score = 0 :: non_neg_integer()}).

-record(tournament_season_role,
        {ver = 0,
         id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         reward_lev = 0 :: non_neg_integer(),
         rewarded = 0 :: non_neg_integer()}).

-record(tournament_result,
        {id = {0, "", 0},
         ver = 3,
         is_win = 1,
         mates = [],
         rival = [],
         match_id = 0,
         record_pz = {"", 0} :: tuple(),
         time = 0,
         rank_lev = 0}).

-record(tournament_result_role,
        {id = {0, "", 0},
         ver = 1,
         recent = [],
         last_recent = []}).

-record(king_badge,
        {id = 0,
         status = 0,
         active_effect_type = 3,
         active_attr = [],
         fc = 0}).

-record(tournament_match_report_info,
        {match_id, can_report = [], result}).

-file("src/mod/tournament/tournament_agent.erl", 36).

-record(state,
        {announce_ref :: undefined | reference(),
         announce_lev = 0,
         week_ref :: undefined | reference(),
         season_ref :: undefined | reference(),
         reported_ids = []}).

update_profile([P = #tournament_profile{} | T]) ->
    tournament_agent ! {update_profile, [P | T]};
update_profile(P = #tournament_profile{}) ->
    tournament_agent ! {update_profile, P}.

change_top_lev([]) -> ok;
change_top_lev(Changed) ->
    tournament_agent ! {change_top_lev, Changed}.

ban_reported([]) -> ok;
ban_reported(Changed) ->
    tournament_agent ! {ban_reported, Changed}.

sync_profile([]) -> ok;
sync_profile(Changed) ->
    tournament_agent ! {sync_profile, Changed}.

get_profile({Id, Platform, ZoneId}) ->
    big_world:call(Platform,
                   ZoneId,
                   tournament_agent,
                   local_profile,
                   [{Id, Platform, ZoneId}]).

get_badge_record({Id, Platform, ZoneId}) ->
    logger:debug("=======", [], tournament_agent, 90),
    big_world:call(Platform,
                   ZoneId,
                   tournament_agent,
                   role_badge_record,
                   [{Id, Platform, ZoneId}]).

local_profile(Id) ->
    case ets:lookup(tournament_profile, Id) of
        [P = #tournament_profile{}] -> P;
        _ -> false
    end.

role_badge_record(Id) ->
    logger:debug("=======", [], tournament_agent, 103),
    case role_query:attr(by_id,
                         Id,
                         [#role.m_tournament, #role.classes])
        of
        {ok, [#m_tournament{kingbadge = BadgeList}, Classes]} ->
            HoldList = [BadgeId
                        || #king_badge{id = BadgeId, status = Status}
                               <- BadgeList,
                           Status =:= 1],
            case HoldList of
                [] -> {ok, {Classes, [], []}};
                _ ->
                    ActiveSetList =
                        tournament_attr:get_activeset(BadgeList),
                    {ok, {Classes, HoldList, ActiveSetList}}
            end;
        _ ->
            logger:info("角色不在线或查找不到角色", [], tournament_agent, 115),
            {false, "角色不在线或查找不到角色"}
    end.

get_result({Id, Platform, ZoneId}) ->
    big_world:call(Platform,
                   ZoneId,
                   tournament_agent,
                   local_result,
                   [{Id, Platform, ZoneId}]).

local_result(Id) ->
    case ets:lookup(tournament_result, Id) of
        [P = #tournament_result{}] -> P;
        _ -> false
    end.

push_matched(#tournament_role{id = Id}, Data) ->
    role:apply(async,
               Id,
               {tournament_role, callback, [{matched, Data}]}),
    ok.

combat_over(Type,
            Args = #{profile :=
                         Profile = #tournament_profile{id = Id},
                     season_rank_lev := OldSeasonLev}) ->
    case role_query:pid(by_id, Id) of
        {ok, Pid} ->
            role:apply(async,
                       Pid,
                       {tournament_role,
                        callback,
                        [{combat_over, Type, Args}]});
        _ ->
            mail_reward(Profile, Type, OldSeasonLev),
            update_profile(Profile)
    end.

fight_result(Id) ->
    case role_query:pid(by_id, Id) of
        {ok, Pid} ->
            role:apply(async,
                       Pid,
                       {tournament_role, callback, [fight_result]});
        _ -> ok
    end.

update_rank(Type, L) ->
    ets:insert(tournament_rank, L),
    dets:insert(tournament_rank, L),
    tournament_agent ! {update_rank, Type}.

update_rank(Type, L, Celebrity) ->
    dets:delete_all_objects(tournament_rank),
    ets:delete_all_objects(tournament_rank),
    ets:insert(tournament_rank, L),
    dets:insert(tournament_rank, L),
    ets:insert(tournament_rank, Celebrity),
    dets:insert(tournament_rank, Celebrity),
    tournament_agent ! {update_rank, Type}.

like(Name, TargetId, Liked) ->
    case role_query:pid(by_id, TargetId) of
        {ok, Pid} ->
            notice:send({pid, Pid},
                        3,
                        {lang:get("~ts赞了一个你的战绩"), [{role_2, Name}]});
        _ -> ok
    end,
    tournament_agent ! {like, TargetId, Liked}.

report(_Name, TargetId, Liked, Logs) ->
    tournament_agent ! {report, TargetId, Liked, Logs}.

gm(clear) ->
    ets:insert(tournament_profile,
               [P#tournament_profile{last_matched = 0}
                || P <- ets:tab2list(tournament_profile)]);
gm({rank_lev,
    #role{id = Id, name = Name, classes = Classes,
          sex = Sex},
    RankLev}) ->
    NewRankLev = max(1, min(11, RankLev)),
    P1 = case local_profile(Id) of
             P = #tournament_profile{} ->
                 P#tournament_profile{rank_lev = NewRankLev,
                                      rank_point = (NewRankLev - 1) * 100,
                                      combat_count = NewRankLev};
             _ ->
                 #tournament_profile{id = Id, name = Name,
                                     classes = Classes, sex = Sex,
                                     rank_lev = NewRankLev,
                                     rank_point = (NewRankLev - 1) * 100,
                                     combat_count = NewRankLev}
         end,
    update_profile(P1),
    case role_query:pid(by_id, Id) of
        {ok, Pid} ->
            role:apply(async,
                       Pid,
                       {tournament_role, callback, [{fire_achieve, P1}]});
        _ -> ok
    end,
    big_world:cast(ets, insert, [tournament_profile, P1]);
gm({rank_point,
    #role{id = Id, name = Name, classes = Classes,
          sex = Sex},
    RankLev,
    RankPoint}) ->
    NewRankLev = max(1, min(11, RankLev)),
    P1 = case local_profile(Id) of
             P = #tournament_profile{} ->
                 P#tournament_profile{rank_lev = NewRankLev,
                                      rank_point =
                                          (NewRankLev - 1) * 100 + RankPoint,
                                      combat_count = NewRankLev};
             _ ->
                 #tournament_profile{id = Id, name = Name,
                                     classes = Classes, sex = Sex,
                                     rank_lev = NewRankLev,
                                     rank_point =
                                         (NewRankLev - 1) * 100 + RankPoint,
                                     combat_count = NewRankLev}
         end,
    update_profile(P1),
    case role_query:pid(by_id, Id) of
        {ok, Pid} ->
            role:apply(async,
                       Pid,
                       {tournament_role, callback, [{fire_achieve, P1}]});
        _ -> ok
    end,
    big_world:cast(ets, insert, [tournament_profile, P1]);
gm({rank_lev_max,
    #role{id = Id, name = Name, classes = Classes,
          sex = Sex},
    RankLev}) ->
    NewRankLev = max(1, min(11, RankLev)),
    P1 = case local_profile(Id) of
             P = #tournament_profile{} ->
                 P#tournament_profile{rank_lev = NewRankLev,
                                      rank_point = (NewRankLev - 1) * 100,
                                      best_rank_lev = NewRankLev,
                                      combat_count = NewRankLev,
                                      historical_high = NewRankLev};
             _ ->
                 #tournament_profile{id = Id, name = Name,
                                     classes = Classes, sex = Sex,
                                     rank_lev = NewRankLev,
                                     best_rank_lev = NewRankLev,
                                     rank_point = (NewRankLev - 1) * 100,
                                     combat_count = NewRankLev,
                                     historical_high = NewRankLev}
         end,
    update_profile(P1),
    case role_query:pid(by_id, Id) of
        {ok, Pid} ->
            role:apply(async,
                       Pid,
                       {tournament_role, callback, [{fire_achieve, P1}]});
        _ -> ok
    end,
    big_world:cast(ets, insert, [tournament_profile, P1]);
gm({max_point,
    #role{id = Id, name = Name, classes = Classes,
          sex = Sex},
    RankLev}) ->
    NewRankLev = max(1, min(11, RankLev)) - 1,
    P1 = case local_profile(Id) of
             P = #tournament_profile{} ->
                 P#tournament_profile{rank_lev = NewRankLev,
                                      rank_point = NewRankLev * 100,
                                      combat_count = RankLev};
             _ ->
                 #tournament_profile{id = Id, name = Name,
                                     classes = Classes, sex = Sex,
                                     rank_lev = NewRankLev,
                                     rank_point = NewRankLev * 100,
                                     combat_count = RankLev}
         end,
    update_profile(P1),
    big_world:cast(ets, insert, [tournament_profile, P1]);
gm(season_reset) ->
    big_world:cast(erlang,
                   send,
                   [tournament, {season_reset, gm_reset}]);
gm(season_count) ->
    big_world:cast(erlang,
                   send,
                   [tournament, {season_reset, gm_count}]).

start_link() ->
    gen_server:start_link({local, tournament_agent},
                          tournament_agent,
                          [],
                          []).

init([]) ->
    logger:info("启动中...", [], tournament_agent, 260),
    dets:open_file(tournament_profile,
                   [{file, "./dets/tournament_profile.dets"},
                    {keypos, #tournament_profile.id}]),
    dets:open_file(tournament_rank,
                   [{file, "./dets/tournament_rank.dets"}, {keypos, 1}]),
    dets:open_file(tournament_rank_local,
                   [{file, "./dets/tournament_rank_local.dets"},
                    {keypos, 1}]),
    dets:open_file(tournament_result,
                   [{file, "./dets/tournament_result.dets"},
                    {keypos, #tournament_result.id}]),
    dets:open_file(tournament_result_role,
                   [{file, "./dets/tournament_result_role.dets"},
                    {keypos, #tournament_result_role.id}]),
    ets:new(tournament_profile,
            [set,
             named_table,
             public,
             {keypos, #tournament_profile.id}]),
    ets:new(tournament_rank,
            [set, named_table, public, {keypos, 1}]),
    ets:new(tournament_rank_local,
            [set, named_table, public, {keypos, 1}]),
    ets:new(tournament_result,
            [set,
             named_table,
             public,
             {keypos, #tournament_result.id}]),
    ets:new(tournament_result_role,
            [set,
             named_table,
             public,
             {keypos, #tournament_result_role.id}]),
    load_data(),
    case env:get(tournament_season_id) of
        NId when is_integer(NId) -> ok;
        _ -> env:save(tournament_season_id, 1)
    end,
    case env:get(tournament_result_id) of
        RecId when is_integer(RecId) -> ok;
        _ -> env:set(tournament_result_id, 1)
    end,
    tournament_season:init(),
    {Day, Sec} = {7, {0, 10, 0}},
    Tt = date:week_next_diff([Day], Sec),
    Ref = erlang:send_after(Tt * 1000, self(), week_reward),
    SeasonRef = erlang:send_after(600000,
                                  self(),
                                  sync_season_id),
    erlang:send_after(10000, self(), loop),
    State = #state{week_ref = Ref, season_ref = SeasonRef},
    update_local_rank(refresh),
    logger:info("启动完成，周奖励时间 ~w",
                [Tt],
                tournament_agent,
                290),
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({update_profile, P}, State) ->
    ets:insert(tournament_profile, P),
    dets:insert(tournament_profile, P),
    {noreply, State};
handle_info({acc_matched,
             #tournament_role{id = Id, name = Name,
                              classes = Classes, sex = Sex, lev = Lev,
                              last_matched = Now}},
            State) ->
    P1 = case ets:lookup(tournament_profile, Id) of
             [P = #tournament_profile{last_matched = Last,
                                      day_matched = Matched}] ->
                 case date:is_same_day(Now, Last) of
                     true ->
                         P#tournament_profile{last_matched = Now,
                                              day_matched = Matched + 1};
                     _ ->
                         P#tournament_profile{last_matched = Now,
                                              day_matched = 1, day_win = 0,
                                              day_win_sustained = 0}
                 end;
             _ ->
                 #tournament_profile{id = Id, name = Name,
                                     classes = Classes, sex = Sex, lev = Lev,
                                     last_matched = Now, day_matched = 1}
         end,
    ets:insert(tournament_profile, P1),
    dets:insert(tournament_profile, P1),
    {noreply, State};
handle_info({update_rank, refresh}, State) ->
    update_local_rank(refresh),
    {noreply, State};
handle_info({update_rank, final},
            State = #state{announce_ref = OldRef,
                           reported_ids = _Ids}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    update_local_rank(final),
    announce_rank(70),
    check_season_reward(),
    Ref = erlang:send_after(60000, self(), announce),
    {noreply,
     State#state{announce_lev = 80, announce_ref = Ref,
                 reported_ids = []}};
handle_info(announce,
            State = #state{announce_lev = Lev,
                           announce_ref = OldRef}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    announce_rank(Lev),
    NewLev = Lev + 10,
    Ref = case NewLev < 101 of
              true -> erlang:send_after(60000, self(), announce);
              _ -> 0
          end,
    {noreply,
     State#state{announce_ref = Ref, announce_lev = NewLev}};
handle_info(week_reward,
            State = #state{week_ref = OldRef}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    week_reward(),
    {Day, Sec} = {7, {0, 10, 0}},
    Tt = date:week_next_diff([Day], Sec),
    Ref = erlang:send_after(Tt * 1000, self(), week_reward),
    {noreply, State#state{week_ref = Ref}};
handle_info({like, Id, Liked}, State) ->
    case ets:lookup(tournament_profile, Id) of
        [P = #tournament_profile{}] ->
            P1 = P#tournament_profile{liked = Liked},
            ets:insert(tournament_profile, P1),
            dets:insert(tournament_profile, P1);
        _ -> ok
    end,
    {noreply, State};
handle_info({report, Id, Liked, Logs},
            State = #state{reported_ids = Ids}) ->
    case ets:lookup(tournament_profile, Id) of
        [P = #tournament_profile{}] ->
            P1 = P#tournament_profile{reported = Liked,
                                      reported_logs = Logs},
            ets:insert(tournament_profile, P1),
            dets:insert(tournament_profile, P1);
        _ -> ok
    end,
    NewIds = case lists:keyfind(Id, 1, Ids) of
                 {Id, N} -> lists:keyreplace(Id, 1, Ids, {Id, N + 1});
                 _ -> [{Id, 1} | Ids]
             end,
    {noreply, State#state{reported_ids = NewIds}};
handle_info(sync_season_id,
            State = #state{season_ref = OldRef}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    SeasonRef = case big_world:call(env,
                                    get,
                                    [tournament_season_id])
                    of
                    Id when is_integer(Id) ->
                        case env:get(tournament_season_id) of
                            Id ->
                                logger:info("赛季id 和中央服一致: ~w",
                                            [Id],
                                            tournament_agent,
                                            402),
                                ok;
                            _ ->
                                logger:info("更新赛季id: ~w",
                                            [Id],
                                            tournament_agent,
                                            405),
                                env:save(tournament_season_id, Id),
                                tournament_season:reset(count, Id),
                                Honors = [{I, 31015}
                                          || [I]
                                                 <- ets:match(tournament_profile,
                                                              #tournament_profile{id
                                                                                      =
                                                                                      '$1',
                                                                                  rank_lev
                                                                                      =
                                                                                      11,
                                                                                  _
                                                                                      =
                                                                                      '_'})],
                                honor_mgr:replace(tournament_top_rank_honor,
                                                  Honors,
                                                  0),
                                tournament_agent ! season_reward,
                                tournament_agent ! tournament_season
                        end,
                        SeasonTt = date:next_diff({12, 0, 2}),
                        erlang:send_after(SeasonTt * 1000 + 600000,
                                          self(),
                                          sync_season_id);
                    _ -> erlang:send_after(600000, self(), sync_season_id)
                end,
    {noreply, State#state{season_ref = SeasonRef}};
handle_info(tournament_season, State) ->
    campaign_rank_mgr ! {all_info, tournament_season},
    {noreply, State};
handle_info(season_reward, State) ->
    tournament_season:auto_reward(),
    {noreply, State};
handle_info({change_top_lev, Changed}, State) ->
    do_change_top_lev(Changed),
    ets:insert(tournament_profile, Changed),
    dets:insert(tournament_profile, Changed),
    Honors = [{I, 31015}
              || [I]
                     <- ets:match(tournament_profile,
                                  #tournament_profile{id = '$1', rank_lev = 11,
                                                      _ = '_'})],
    honor_mgr:replace(tournament_top_rank_honor, Honors, 0),
    {noreply, State};
handle_info({ban_reported, Changed}, State) ->
    {{_, M, D}, _} =
        date:seconds_to_datetime(date:unixtime() + 172800),
    DateStr = util:flist(lang:get("~w月~w日"), [M, D]),
    Title = lang:get("武道会禁赛通知"),
    ContentArgs = [{string_2, 5, lang:get("不良游戏行为")},
                   {string_2, 1, 25},
                   {string_2, 5, DateStr}],
    Content =
        notice:format(lang:get("由于您在武道大会中出现~ts，严重影响其他玩家游戏体验，系统将自动扣除~ts点武道分并禁赛"
                               "2天至~ts，请认真对待每一场比武，共建良好游戏环境。"),
                      ContentArgs),
    FeedbackTitle = lang:get("武道会举报成功"),
    FeedbackContent =
        lang:get("您在武道会中举报了~ts，系统已核实其不良游戏行为，并对Ta禁赛以及扣除一定武道积分，感谢"
                 "您对游戏环境做出的贡献。"),
    [role:pack_send(Id, 16405, {TP})
     || TP = #tournament_profile{id = Id} <- Changed],
    do_ban_reported(Changed,
                    #{title => Title, content => Content,
                      feedback_title => FeedbackTitle,
                      feedback_content => FeedbackContent}),
    ets:insert(tournament_profile, Changed),
    dets:insert(tournament_profile, Changed),
    {noreply, State};
handle_info({sync_profile, Changed}, State) ->
    [role:pack_send(Id, 16405, {TP})
     || TP = #tournament_profile{id = Id} <- Changed],
    ets:insert(tournament_profile, Changed),
    dets:insert(tournament_profile, Changed),
    {noreply, State};
handle_info(loop, State) ->
    env:save_counter(tournament_result_id, 0),
    erlang:send_after(10000, self(), loop),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

load_data() ->
    case dets:first(tournament_profile) of
        '$end_of_table' ->
            logger:info("没有数据需要加载", [], tournament_agent, 485),
            [];
        _ ->
            dets:traverse(tournament_profile,
                          fun (P) ->
                                  case tournament_ver:do_profile(P) of
                                      {false, Reason} ->
                                          logger:error("武道会数据转换失败:~w",
                                                       [Reason],
                                                       tournament_agent,
                                                       492),
                                          {done, false};
                                      {ok, P1 = #tournament_profile{}} ->
                                          ets:insert(tournament_profile, P1),
                                          dets:insert(tournament_profile, P1),
                                          continue
                                  end
                          end)
    end,
    case dets:first(tournament_rank) of
        '$end_of_table' ->
            logger:info("没有数据需要加载", [], tournament_agent, 504),
            [];
        _ ->
            dets:traverse(tournament_rank,
                          fun (R) ->
                                  case tournament_ver:do_rank(R) of
                                      {false, Reason} ->
                                          logger:error("武道会数据转换失败:~w",
                                                       [Reason],
                                                       tournament_agent,
                                                       511),
                                          {done, false};
                                      {ok, Rank} ->
                                          ets:insert(tournament_rank, Rank),
                                          dets:insert(tournament_rank, Rank),
                                          continue
                                  end
                          end)
    end,
    case dets:first(tournament_rank_local) of
        '$end_of_table' ->
            logger:info("没有数据需要加载", [], tournament_agent, 523),
            [];
        _ ->
            dets:traverse(tournament_rank_local,
                          fun (R1) ->
                                  case tournament_ver:do_rank(R1) of
                                      {false, Reason} ->
                                          logger:error("武道会数据转换失败:~w",
                                                       [Reason],
                                                       tournament_agent,
                                                       530),
                                          {done, false};
                                      {ok, Rank1} ->
                                          ets:insert(tournament_rank_local,
                                                     Rank1),
                                          dets:insert(tournament_rank_local,
                                                      Rank1),
                                          continue
                                  end
                          end)
    end,
    case dets:first(tournament_result) of
        '$end_of_table' ->
            logger:info("没有数据需要加载", [], tournament_agent, 542),
            [];
        _ ->
            dets:traverse(tournament_result,
                          fun (S) ->
                                  case tournament_ver:do_result(S) of
                                      {false, Reason} ->
                                          logger:error("武道会数据转换失败:~w",
                                                       [Reason],
                                                       tournament_agent,
                                                       549),
                                          {done, false};
                                      {ok, S1 = #tournament_result{}} ->
                                          ets:insert(tournament_result, S1),
                                          dets:insert(tournament_result, S1),
                                          continue
                                  end
                          end)
    end,
    case dets:first(tournament_result_role) of
        '$end_of_table' ->
            logger:info("没有数据需要加载", [], tournament_agent, 561),
            [];
        _ ->
            dets:traverse(tournament_result_role,
                          fun (S) ->
                                  case tournament_ver:do_result_role(S) of
                                      {false, Reason} ->
                                          logger:error("武道会数据转换失败:~w",
                                                       [Reason],
                                                       tournament_agent,
                                                       568),
                                          {done, false};
                                      {ok, S1 = #tournament_result_role{}} ->
                                          ets:insert(tournament_result_role,
                                                     S1),
                                          dets:insert(tournament_result_role,
                                                      S1),
                                          continue
                                  end
                          end)
    end,
    ok.

update_local_rank(Type) ->
    L = ets:tab2list(tournament_profile),
    L2 = tournament_rank:sort_group(L),
    L3 = update_celebrity(Type, L),
    ets:insert(tournament_rank_local, L2),
    dets:insert(tournament_rank_local, L2),
    ets:insert(tournament_rank_local, L3),
    dets:insert(tournament_rank_local, L3).

update_celebrity(final, L) ->
    tournament_rank:sort_celebrity(L);
update_celebrity(_, _) -> [].

announce_rank(Key0) ->
    Key = case Key0 of
              100 -> 101;
              _ -> Key0
          end,
    case ets:lookup(tournament_rank_local, Key) of
        [{_, [H | T]}] ->
            GroupName = case Key of
                            80 -> lang:get("骁勇组");
                            90 -> lang:get("英雄组");
                            101 -> lang:get("传说组");
                            _ -> lang:get("精锐组")
                        end,
            Fmt =
                lang:get("~ts活动结束，恭喜~ts等夺得本服~ts前十，问鼎群雄！{face_1,31}"),
            L1 = lists:sublist([H | T], 3),
            Msg = notice:format(Fmt,
                                [{string_2, 1, lang:get("天下第一武道会")},
                                 {role_1,
                                  [{Id, Name}
                                   || #tournament_profile{id = Id, name = Name}
                                          <- L1]},
                                 {string_2, 1, GroupName}]),
            notice:cast(all, 5, Msg);
        _ -> ok
    end.

mail_reward(#tournament_profile{id = Id,
                                rank_lev = ARlev},
            Type, BSRlev) ->
    case tournament_data:get(ARlev) of
        #{advance_reward := Reward} when ARlev > BSRlev ->
            Items1 = [{BaseId, 0, Num} || {BaseId, Num} <- Reward],
            Title = lang:get("武道会奖励"),
            Result = case Type of
                         win -> lang:get("胜利");
                         _ -> lang:get("失败")
                     end,
            Content = util:flist(lang:get("上次战斗结果~ts, 获得如下奖励"),
                                 [Result]),
            mail:send(Id,
                      #{title => Title, content => Content, items => Items1});
        _ -> ok
    end.

week_reward() ->
    Now = date:unixtime(),
    L = ets:tab2list(tournament_profile),
    do_week_reward(L, Now).

do_week_reward([], _) -> ok;
do_week_reward([#tournament_profile{id = Id,
                                    last_matched = Last, rank_lev = RankLev}
                | T],
               Now) ->
    case date:is_same_week(Last, Now) of
        true ->
            case tournament_data:get(RankLev) of
                #{week_reward := Reward = [_ | _]} ->
                    Items1 = [{BaseId, 0, Num} || {BaseId, Num} <- Reward],
                    Title = lang:get("天下第一武道会红利"),
                    Content =
                        notice:format(lang:get("恭喜你在本周天下第一武道会中获得：~ts\n请查收备战奖励，祝你在周日12:30武道会再创佳绩！"),
                                      [{string_2,
                                        1,
                                        tournament_data:get_name(RankLev)}]),
                    mail:send(Id,
                              #{title => Title, content => Content,
                                items => Items1});
                _ -> ok
            end;
        _ -> ok
    end,
    do_week_reward(T, Now).

check_season_reward() ->
    case erlang:time() of
        {H, _, _} when H > 22 ->
            tournament_agent ! season_reward;
        _ -> ok
    end.

do_change_top_lev([]) -> ok;
do_change_top_lev([#tournament_profile{rank_lev = 11,
                                       id = Id}
                   | T]) ->
    case local_profile(Id) of
        #tournament_profile{season_rank_lev = OldSeasonLev}
            when OldSeasonLev < 11 ->
            Title = lang:get("星辰王者·一鸣惊人"),
            Content =
                notice:format(lang:get("您在天下第一武道会新赛季中，拥有登峰造极50分以上，并名列全部服务器前100名，恭喜您首次"
                                       "晋级~ts头衔，并获得~ts称号、晋级奖励{face_1,29}"),
                              [{string_2, 1, tournament_data:get_name(11)},
                               {string_2, 1, lang:get("武道·星辰王者")}]),
            Items = case tournament_data:get(11) of
                        #{advance_reward := Reward} ->
                            [{I, 0, N} || {I, N} <- Reward];
                        _ -> []
                    end,
            mail:send(Id,
                      #{title => Title, content => Content, items => Items});
        #tournament_profile{rank_lev = 11} ->
            Title = lang:get("星辰王者·舍我其谁"),
            Content =
                notice:format(lang:get("您在天下第一武道会中稳如泰山，仍然名列全部服务器前100名，继续享有~ts头衔和~ts荣耀"
                                       "称号！{face_1,10}"),
                              [{string_2, 1, tournament_data:get_name(11)},
                               {string_2, 1, lang:get("武道·星辰王者")}]),
            mail:send(Id,
                      #{title => Title, content => Content, items => []});
        _ ->
            Title = lang:get("武道会·星辰王者！"),
            Content =
                notice:format(lang:get("您在天下第一武道会中表现优秀，拥有登峰造极50分以上，并名列全部服务器前100名，顺利晋级"
                                       "~ts头衔，并获得~ts称号！{face_1,29}"),
                              [{string_2, 1, tournament_data:get_name(11)},
                               {string_2, 1, lang:get("武道·星辰王者")}]),
            mail:send(Id,
                      #{title => Title, content => Content, items => []})
    end,
    do_change_top_lev(T);
do_change_top_lev([#tournament_profile{id = Id} | T]) ->
    case local_profile(Id) of
        #tournament_profile{rank_lev = 11} ->
            Title = lang:get("星辰王者·失之交臂"),
            Content =
                notice:format(lang:get("天下第一武道会竞争激烈，您未能满足王者标准（登峰造极50分以上，并名列全部服务器前100名"
                                       "），已重新回到~ts头衔。胜败兵家常事，期待您王者归来！{face_1,7}"),
                              [{string_2, 1, tournament_data:get_name(10)}]),
            mail:send(Id,
                      #{title => Title, content => Content, items => []});
        _ -> ok
    end,
    do_change_top_lev(T).

do_ban_reported([], _) -> ok;
do_ban_reported([#tournament_profile{id = Id,
                                     reported_logs = Logs, name = RoleName}
                 | T],
                MailInfo = #{title := Title, content := Content,
                             feedback_content := FeedbackContent,
                             feedback_title := FeedbackTitle}) ->
    FeedbackContent1 = notice:format(FeedbackContent,
                                     [{role_2, RoleName}]),
    mail:send(Id, Title, Content),
    [begin
         [mail:send(RId, FeedbackTitle, FeedbackContent1)
          || RId <- ReportIds]
     end
     || {_MatchId, ReportIds} <- Logs],
    do_ban_reported(T, MailInfo).

