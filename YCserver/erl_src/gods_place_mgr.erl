-file("src/mod/gods_duel/gods_place_mgr.erl", 1).

-module(gods_place_mgr).

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
         loadtest/3,
         gm_creatbox/0,
         load_data/1,
         get_state/0,
         is_have_ceremony/0,
         look_zone_list/0,
         send_allzone/1]).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

-export([idle/2,
         notice/2,
         ceremony/2,
         ready/2,
         challenge_ready/2,
         challenge/2,
         challenge_manual/2,
         active/2,
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

-file("src/mod/gods_duel/gods_place_mgr.erl", 44).

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

-file("src/mod/gods_duel/gods_place_mgr.erl", 45).

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

-file("src/mod/gods_duel/gods_place_mgr.erl", 46).

-file("inc/gods_place.hrl", 1).

-record(gods_place_team_statue,
        {ver = 1,
         team_id = 0,
         id = {0, "", 0},
         name = "",
         lev = 0,
         members = [],
         qualification = 0,
         serial_id = 0,
         team_leader = {0, "", 0}}).

-record(gods_place_team_mate_statue,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         break_times = 0,
         looks = []}).

-record(m_gods_place,
        {ver = 3,
         group_id = 0,
         zone_id = 0,
         zone_pid = 0,
         pick_chest = 0,
         worship_times = 0,
         total_num = 0,
         sys_barrage = 1,
         ply_barrage = 1,
         barrage_time = 0,
         efficiency_flag = 0,
         pick_flag = 0}).

-file("src/mod/gods_duel/gods_place_mgr.erl", 47).

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

-file("src/mod/gods_duel/gods_place_mgr.erl", 48).

-file("inc/looks.hrl", 1).

-file("src/mod/gods_duel/gods_place_mgr.erl", 49).

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

-file("src/mod/gods_duel/gods_place_mgr.erl", 50).

-record(state,
        {ts = 0,
         timeout = infinity,
         zone_nextid = 1,
         zone_list = []}).

start_link() ->
    gen_fsm:start_link({local, gods_place_mgr},
                       gods_place_mgr,
                       [],
                       []).

reload() -> gods_place_mgr ! reload.

m(Event) -> gen_fsm:send_event(gods_place_mgr, Event).

info(Msg) -> gods_place_mgr ! Msg.

call(Msg) ->
    case catch
             gen_fsm:sync_send_all_state_event(gods_place_mgr, Msg)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

cast(Msg) ->
    logger:debug("~w", [Msg], gods_place_mgr, 90),
    gen_fsm:send_all_state_event(gods_place_mgr, Msg).

init([]) ->
    process_flag(trap_exit, true),
    {StateName, TimeOut} = get_state(),
    State = #state{ts = date:now2(), timeout = TimeOut},
    dets:open_file(gods_place_team_statue,
                   [{file, "./dets/gods_place_team_statue.dets"},
                    {keypos, #gods_place_team_statue.team_id},
                    {type, set}]),
    ets:new(gods_place_team_statue,
            [set,
             named_table,
             public,
             {keypos, #gods_place_team_statue.team_id}]),
    dets:to_ets(gods_place_team_statue,
                gods_place_team_statue),
    dets:open_file(gods_place_season,
                   [{file, "./dets/gods_place_season.dets"},
                    {keypos, 1},
                    {type, set}]),
    ets:new(gods_place_season,
            [set, named_table, public, {keypos, 1}]),
    dets:to_ets(gods_place_season, gods_place_season),
    ToClient = case StateName of
                   idle -> 0;
                   notice -> 1;
                   ceremony -> 2;
                   active -> 3
               end,
    big_world:cast(all,
                   gods_place_agent,
                   info,
                   [{update_state, ToClient, date:now2(), TimeOut}]),
    ChallengeList = case catch ets:lookup(gods_place_season,
                                          season_id)
                        of
                        [{season_id, SeasonId}] ->
                            case catch ets:lookup(gods_place_team_statue,
                                                  5 + SeasonId * 10)
                                of
                                [#gods_place_team_statue{name = Name,
                                                         members = Members}] ->
                                    env:set(challengename, Name),
                                    [Rid
                                     || #gods_place_team_mate_statue{id = Rid}
                                            <- Members];
                                _ -> []
                            end;
                        _ -> []
                    end,
    env:set(challengelist, ChallengeList),
    logger:info("诸神殿堂活动启动完成", [], gods_place_mgr, 126),
    {ok, StateName, State, TimeOut}.

handle_event({exit_place, GId, ZoneId, ZonePid},
             StateName, State) ->
    NewState = zone_exit(GId, ZoneId, ZonePid, State),
    gods_place_zone:cast(ZonePid, {exit_place}),
    continue(StateName, NewState);
handle_event({send_barrage, ZonePid, Msg}, StateName,
             State) ->
    gods_place_zone:cast(ZonePid, {send_barrage, Msg}),
    continue(StateName, State);
handle_event(_Event, StateName, State) ->
    logger:error("未知消息 ~w", [_Event], gods_place_mgr, 140),
    continue(StateName, State).

handle_sync_event({get_status}, _From, idle,
                  State = #state{ts = Ts, timeout = Timeout}) ->
    continue({0, Ts, Timeout}, idle, State);
handle_sync_event({get_status}, _From, notice,
                  State = #state{ts = Ts, timeout = Timeout}) ->
    continue({1, Ts, Timeout}, notice, State);
handle_sync_event({get_status}, _From, ceremony,
                  State = #state{ts = Ts, timeout = Timeout}) ->
    continue({2, Ts, Timeout}, ceremony, State);
handle_sync_event({get_status}, _From, active,
                  State = #state{ts = Ts, timeout = Timeout}) ->
    continue({3, Ts, Timeout}, active, State);
handle_sync_event({get_status}, _From, ending,
                  State = #state{ts = Ts, timeout = Timeout}) ->
    continue({4, Ts, Timeout}, ending, State);
handle_sync_event({get_status}, _From, ready,
                  State = #state{ts = Ts, timeout = Timeout}) ->
    continue({5, Ts, Timeout}, ready, State);
handle_sync_event({get_status}, _From, challenge_ready,
                  State = #state{ts = Ts, timeout = Timeout}) ->
    continue({6, Ts, Timeout}, challenge_ready, State);
handle_sync_event({get_status}, _From, challenge,
                  State = #state{ts = Ts, timeout = Timeout}) ->
    continue({7, Ts, Timeout}, challenge, State);
handle_sync_event({get_status}, _From, challenge_manual,
                  State = #state{ts = Ts, timeout = Timeout}) ->
    continue({8, Ts, Timeout}, challenge_manual, State);
handle_sync_event({drop_box_time}, _From, active,
                  State = #state{ts = Ts, timeout = Timeout}) ->
    continue({Ts, Timeout}, active, State);
handle_sync_event({drop_box_time}, _From, StateName,
                  State) ->
    continue({error, lang:get("")}, StateName, State);
handle_sync_event(champion_drop_box_time, _From, active,
                  State = #state{ts = Ts, timeout = Timeout}) ->
    continue({Ts, Timeout}, active, State);
handle_sync_event(champion_drop_box_time, _From,
                  StateName, State) ->
    continue({error, lang:get("")}, StateName, State);
handle_sync_event(get_season_id, _From, StateName,
                  State) ->
    SeasonId = case ets:lookup(gods_place_season, season_id)
                   of
                   [] -> gods_duel_common:get_season_id();
                   [{season_id, Num}] -> Num
               end,
    continue(SeasonId, StateName, State);
handle_sync_event(get_one_map_id, _From, StateName,
                  State = #state{zone_list = ZoneList}) ->
    MapId = case lists:keyfind(5, 1, ZoneList) of
                false -> 0;
                {5, [{_ZoneId, ZonePid, _} | _]} ->
                    case gods_place_zone:call(ZonePid, quest_map_id) of
                        Id when is_integer(Id) -> Id;
                        _ -> 0
                    end
            end,
    continue(MapId, StateName, State);
handle_sync_event(get_gods_challenge_list, _From,
                  StateName, State) ->
    ChallengeList = case env:get(challengelist) of
                        List when is_list(List) -> List;
                        _ ->
                            case catch ets:lookup(gods_place_season, season_id)
                                of
                                [{season_id, SeasonId}] ->
                                    case catch
                                             ets:lookup(gods_place_team_statue,
                                                        5 + SeasonId * 10)
                                        of
                                        [#gods_place_team_statue{members =
                                                                     Members}] ->
                                            [Rid
                                             || #gods_place_team_mate_statue{id
                                                                                 =
                                                                                 Rid}
                                                    <- Members];
                                        _ -> []
                                    end;
                                _ -> []
                            end
                    end,
    continue({ok, ChallengeList}, StateName, State);
handle_sync_event({enter, _, _}, _From, idle, State) ->
    continue({false, lang:get("活动未开启")}, idle, State);
handle_sync_event({enter, GroupId, RidList}, _From,
                  StateName, State = #state{zone_list = Zones}) ->
    Num = length(RidList),
    {ReplyData, NState} = case is_have_ceremony() of
                              true ->
                                  ChallengeList = case env:get(challengelist) of
                                                      undefined -> [];
                                                      _ChallengeList ->
                                                          _ChallengeList
                                                  end,
                                  case RidList -- ChallengeList of
                                      RidList ->
                                          do_enter(StateName,
                                                   State,
                                                   GroupId,
                                                   Num);
                                      _RestTeam ->
                                          case lists:keyfind(5, 1, Zones) of
                                              {5, ZoneList} ->
                                                  {ZoneId, ZonePid, _} =
                                                      lists:nth(1,
                                                                lists:keysort(1,
                                                                              ZoneList)),
                                                  logger:debug("~w,~w",
                                                               [ZoneId,
                                                                ZonePid],
                                                               gods_place_mgr,
                                                               228),
                                                  Reply = case
                                                              gods_place_zone:call(ZonePid,
                                                                                   {enter,
                                                                                    Num})
                                                              of
                                                              {false,
                                                               _Reason} ->
                                                                  {false,
                                                                   lang:get("进入诸神殿堂失败")};
                                                              Data -> Data
                                                          end,
                                                  {Reply,
                                                   zone_enter(GroupId,
                                                              ZoneId,
                                                              ZonePid,
                                                              Num,
                                                              State)};
                                              _ ->
                                                  logger:error("进入诸神殿堂失败",
                                                               [],
                                                               gods_place_mgr,
                                                               237),
                                                  {{false,
                                                    lang:get("进入诸神殿堂失败")},
                                                   State}
                                          end
                                  end;
                              _ -> do_enter(StateName, State, GroupId, Num)
                          end,
    continue(ReplyData, StateName, NState);
handle_sync_event(_Event, _From, StateName,
                  State = #state{}) ->
    Reply = todo,
    continue(Reply, StateName, State).

handle_info(notice, StateName, State) ->
    Msg =
        lang:get("<color='#00ff00'>诸神挑战</color>将会在22:00开启，诸神们将等"
                 "待诸神王者组冠军发起挑战，强者们能战胜强大的神祇吗？让我们拭目以待{face_1,101}"
                 ""),
    big_world:cast(all, notice, cast, [all, 11, Msg]),
    big_world:cast(all, notice, cast, [all, 4, Msg]),
    continue(StateName, State);
handle_info({update,
             ChampionTeamInfo = #gods_place_team_statue{team_leader =
                                                            LeaderId,
                                                        name = TeamName,
                                                        lev = TeamLev,
                                                        members = Members}},
            StateName, State) ->
    NewMembers = case lists:keytake(LeaderId,
                                    #gods_place_team_mate_statue.id,
                                    Members)
                     of
                     {value, Leader, Rest} -> lists:reverse([Leader | Rest]);
                     _ ->
                         logger:error("队伍信息有误", [], gods_place_mgr, 262),
                         []
                 end,
    NewTeamInfo =
        ChampionTeamInfo#gods_place_team_statue{members =
                                                    NewMembers},
    update_champion_profile(NewTeamInfo),
    update_gods_place_season(gods_duel_common:get_season_id()),
    ChallengeList = case TeamLev =:= 5 of
                        true ->
                            List = [Rid
                                    || #gods_place_team_mate_statue{id = Rid}
                                           <- NewMembers],
                            env:set(challengelist, List),
                            env:set(challengename, TeamName),
                            Title = lang:get("诸神挑战资格通知"),
                            Content =
                                lang:get("恭喜你获得了本届诸神之战的冠军，获得<color='#00ff00'>诸神挑战</colo"
                                         "r>参与资格，活动即将在21:00开启，请在全服玩家的见证下展现你的英姿吧，到诸神殿堂场景"
                                         "处，向诸神们发起挑战。挑战成功全服玩家将会获得天神送出的奖励哦{face_1,15}"),
                            gods_challenge_mgr:send_mail(List, Title, Content),
                            List;
                        _ -> []
                    end,
    big_world:cast(all,
                   gods_place_agent,
                   info,
                   [{update_team, NewTeamInfo, ChallengeList}]),
    continue(StateName, State);
handle_info({update,
             Id,
             ChampionTeamInfo = #gods_place_team_statue{team_leader =
                                                            LeaderId,
                                                        name = TeamName,
                                                        lev = TeamLev,
                                                        members = Members}},
            StateName, State) ->
    NewMembers = case lists:keytake(LeaderId,
                                    #gods_place_team_mate_statue.id,
                                    Members)
                     of
                     {value, Leader, Rest} -> lists:reverse([Leader | Rest]);
                     _ ->
                         logger:error("队伍信息有误", [], gods_place_mgr, 288),
                         []
                 end,
    NewTeamInfo =
        ChampionTeamInfo#gods_place_team_statue{members =
                                                    NewMembers},
    update_champion_profile(NewTeamInfo),
    update_gods_place_season(Id),
    ChallengeList = case TeamLev =:= 5 of
                        true ->
                            List = [Rid
                                    || #gods_place_team_mate_statue{id = Rid}
                                           <- NewMembers],
                            env:set(challengelist, List),
                            env:set(challengename, TeamName),
                            List;
                        _ -> []
                    end,
    big_world:cast(all,
                   gods_place_agent,
                   info,
                   [{update_team, NewTeamInfo, ChallengeList}]),
    continue(StateName, State);
handle_info(create_box, active, State) ->
    case get(create_box_ref) of
        undefined -> ignore;
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef)
    end,
    sync_allzone(State, create_box),
    continue(active, State);
handle_info(create_box, StateName, State) ->
    logger:debug("活动没开始撒什么币", [], gods_place_mgr, 315),
    case get(create_box_ref) of
        undefined -> ignore;
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef)
    end,
    continue(StateName, State);
handle_info(ret_act_notice, StateName, State) ->
    case get(ret_act_notice_ref) of
        undefined -> ignore;
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef)
    end,
    big_world:cast(all,
                   notice,
                   cast,
                   [all,
                    5,
                    lang:get("<color='#00ff00'>封神殿堂</color>稍后将会继续洒下冠军宝箱，请玩家"
                             "继续等待宝箱的到来{face_1,22}")]),
    big_world:cast(all,
                   notice,
                   cast,
                   [all,
                    11,
                    lang:get("<color='#00ff00'>封神殿堂</color>稍后将会继续洒下冠军宝箱，请玩家"
                             "继续等待宝箱的到来{face_1,22}")]),
    continue(StateName, State);
handle_info(ret_act_box, StateName, State) ->
    case get(ret_act_box_ref) of
        undefined -> ignore;
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef)
    end,
    sync_allzone(State, rand_barrage),
    sync_allzone(State, create_box),
    continue(StateName, State);
handle_info(reset, _StateName, State) ->
    ets:delete_all_objects(gods_place_team_statue),
    dets:delete_all_objects(gods_place_team_statue),
    ets:delete_all_objects(gods_place_season),
    dets:delete_all_objects(gods_place_season),
    State1 = uninit_zone(State),
    {StateName, TimeOut} = get_state(),
    ToClient = case StateName of
                   idle -> 0;
                   notice -> 1;
                   ceremony -> 2;
                   active -> 3
               end,
    NewState = State1#state{ts = date:now2(),
                            timeout = TimeOut},
    big_world:cast(all,
                   gods_place_agent,
                   info,
                   [{reset, ToClient, date:now2(), TimeOut}]),
    logger:info("重置诸神殿堂完成...", [], gods_place_mgr, 366),
    continue(StateName, NewState);
handle_info(look_zone_list, StateName,
            State = #state{zone_list = ZoneList}) ->
    logger:info("~w", [ZoneList], gods_place_mgr, 371),
    continue(StateName, State);
handle_info(reload, _, State1) ->
    logger:info("诸神殿堂活动收到重载消息", [], gods_place_mgr, 375),
    State2 = uninit_zone(State1),
    {StateName, TimeOut} = get_state(),
    State3 = State2#state{ts = date:now2(),
                          timeout = TimeOut},
    ToClient = case StateName of
                   idle -> 0;
                   notice -> 1;
                   ceremony -> 2;
                   active -> 3
               end,
    big_world:cast(all,
                   gods_place_agent,
                   info,
                   [{update_state, ToClient, date:now2(), TimeOut}]),
    logger:info("诸神殿堂活动重载完成", [], gods_place_mgr, 389),
    continue(StateName, State3);
handle_info(start_combat, challenge_manual, State) ->
    logger:info("手动挑战成功开始", [], gods_place_mgr, 393),
    {[_StartTime], [EndTime]} =
        gods_duel_data:get_season_second({1, 34}),
    TimeState = date:now_diff(today, EndTime),
    big_world:cast(all,
                   gods_place_agent,
                   info,
                   [{update_state, 7, date:now2(), TimeState * 1000}]),
    continue(challenge,
             State#state{ts = date:now2(),
                         timeout = TimeState * 1000});
handle_info(start_combat, StateName, State) ->
    logger:error("不在手动挑战阶段不能开始", [], gods_place_mgr, 399),
    continue(StateName, State);
handle_info({send_msg, Msg}, StateName, State) ->
    sync_allzone(State, Msg),
    continue(StateName, State);
handle_info(check_challenger_ready, ready, State) ->
    erlang:send_after(30000,
                      self(),
                      check_challenger_ready),
    ChallengeList = case env:get(challengelist) of
                        undefined -> [];
                        _ChallengeList -> _ChallengeList
                    end,
    Reply = case
                gods_challenge_mgr:get_challenger_role_id(ChallengeList,
                                                          ChallengeList)
                of
                {ok, #role{}} -> 1;
                _ -> 0
            end,
    env:set(challenger_ready, Reply),
    sync_allzone(State, {push_17955, {Reply}}),
    continue(ready, State);
handle_info(check_challenger_ready, StateName, State) ->
    env:set(challenger_ready, 0),
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
    logger:info("诸神殿堂进入广播时间", [], gods_place_mgr, 451),
    State1 = init_zone(State),
    NewState = State1#state{ts = date:now2(),
                            timeout = 300 * 1000},
    big_world:cast(all,
                   gods_place_agent,
                   info,
                   [{update_state, 1, date:now2(), 300 * 1000}]),
    continue(notice, NewState).

notice(timeout, State = #state{}) ->
    logger:info("诸神殿堂广播结束", [], gods_place_mgr, 461),
    {StateName, Timeout, ToClient} = case is_have_ceremony()
                                         of
                                         true -> {ceremony, 140 * 1000, 2};
                                         _ ->
                                             sync_allzone(State, rand_barrage),
                                             sync_allzone(State, creat_statue),
                                             Ref = erlang:send_after(5 * 60 *
                                                                         1000,
                                                                     self(),
                                                                     create_box),
                                             put(create_box_ref, Ref),
                                             {active, (1500 + 140) * 1000, 3}
                                     end,
    NewState = State#state{ts = date:now2(),
                           timeout = Timeout},
    big_world:cast(all,
                   gods_place_agent,
                   info,
                   [{update_state, ToClient, date:now2(), Timeout}]),
    continue(StateName, NewState).

ceremony(timeout, State = #state{}) ->
    logger:info("诸神殿堂仪式结束", [], gods_place_mgr, 479),
    {StateName, NewState} = case
                                gods_duel_data:get_season_second({1, 34})
                                of
                                {[_StartTime], [_EndTime]} ->
                                    big_world:cast(all,
                                                   gods_place_agent,
                                                   info,
                                                   [{update_state,
                                                     5,
                                                     date:now2(),
                                                     460 * 1000}]),
                                    erlang:send_after(30000,
                                                      self(),
                                                      check_challenger_ready),
                                    gods_challenge_mgr:info(update_challenge_info),
                                    {ready,
                                     State#state{ts = date:now2(),
                                                 timeout = 460 * 1000}};
                                _ ->
                                    big_world:cast(all,
                                                   gods_place_agent,
                                                   info,
                                                   [{update_state,
                                                     3,
                                                     date:now2(),
                                                     1500 * 1000}]),
                                    {active,
                                     State#state{ts = date:now2(),
                                                 timeout = 1500 * 1000}}
                            end,
    sync_allzone(State, rand_barrage),
    sync_allzone(State, creat_statue),
    sync_allzone(State, create_box),
    continue(StateName, NewState).

ready(timeout, State = #state{}) ->
    logger:info("诸神殿堂挑战准备阶段结束", [], gods_place_mgr, 503),
    TeamName = env:get(challengename),
    Content =
        notice:format(lang:get("<color='#ffff00'>诸神挑战</color>将于22:15正式开启，请<co"
                               "lor='#00ff00'>~ts</color>的成员在5分钟内组好队伍准备{face_"
                               "1,116}"),
                      [{string_1, TeamName}]),
    big_world:cast(all, notice, cast, [all, 4, Content]),
    big_world:cast(all, notice, cast, [all, 11, Content]),
    {[StartTime], [_EndTime]} =
        gods_duel_data:get_season_second({1, 34}),
    TimeState = date:unixtime(zero) +
                    calendar:time_to_seconds(StartTime)
                    + 15 * 60
                    - date:unixtime2(),
    big_world:cast(all,
                   gods_place_agent,
                   info,
                   [{update_state, 6, date:now2(), TimeState * 1000}]),
    NState = State#state{ts = date:now2(),
                         timeout = TimeState * 1000},
    sync_allzone(State, close_box),
    sync_allzone(State, stop_barrage),
    sync_allzone(State, make_npc),
    continue(challenge_ready, NState).

challenge_ready(timeout, State = #state{}) ->
    logger:info("诸神冠军队准备阶段结束", [], gods_place_mgr, 521),
    {StateName, NewState} = case
                                gods_challenge_mgr:start_combat()
                                of
                                true ->
                                    {[_StartTime], [EndTime]} =
                                        gods_duel_data:get_season_second({1,
                                                                          34}),
                                    TimeState = date:now_diff(today, EndTime),
                                    big_world:cast(all,
                                                   gods_place_agent,
                                                   info,
                                                   [{update_state,
                                                     7,
                                                     date:now2(),
                                                     TimeState * 1000}]),
                                    {challenge,
                                     State#state{ts = date:now2(),
                                                 timeout = TimeState * 1000}};
                                false ->
                                    big_world:cast(all,
                                                   gods_place_agent,
                                                   info,
                                                   [{update_state,
                                                     8,
                                                     date:now2(),
                                                     10 * 60 * 1000}]),
                                    {challenge_manual,
                                     State#state{ts = date:now2(),
                                                 timeout = 10 * 60 * 1000}}
                            end,
    continue(StateName, NewState).

challenge_manual(timeout, State = #state{}) ->
    logger:info("诸神冠军队手动开启阶段结束", [], gods_place_mgr, 543),
    {[_StartTime], [EndTime]} =
        gods_duel_data:get_season_second({1, 34}),
    TimeState = date:now_diff(today, EndTime),
    gods_challenge_mgr:cast_watch_info(4),
    TeamName = case env:get(challengename) of
                   undefined -> lang:get("神秘战队");
                   _TeamName -> _TeamName
               end,
    Msg =
        notice:format(lang:get("诸神们在等待良久之后，始终等不到<color='#00ff00'>~ts</color>队"
                               "伍成员的到来，终于扬长而去，很遗憾全服玩家没能获得来自天神的礼物"),
                      [{string_1, TeamName}]),
    big_world:cast(all, notice, cast, [all, 11, Msg]),
    big_world:cast(all, notice, cast, [all, 5, Msg]),
    Title = lang:get("诸神挑战"),
    Content =
        lang:get("很遗憾，由于你的队伍没能及时参与，没能在全服玩家的见证下发起<color='#00ff00"
                 "'>诸神挑战</color>，活动发起失败"),
    ChallengeList = case env:get(challengelist) of
                        undefined -> [];
                        _ChallengeList -> _ChallengeList
                    end,
    gods_challenge_mgr:send_mail(ChallengeList,
                                 Title,
                                 Content),
    Ref = erlang:send_after(10 * 1000,
                            self(),
                            ret_act_notice),
    put(ret_act_notice_ref, Ref),
    Ref1 = erlang:send_after(5 * 60 * 1000,
                             self(),
                             ret_act_box),
    put(ret_act_box_ref, Ref1),
    big_world:cast(all,
                   gods_place_agent,
                   info,
                   [{update_state, 3, date:now2(), TimeState * 1000}]),
    continue(active,
             State#state{ts = date:now2(),
                         timeout = TimeState * 1000}).

challenge(timeout, State = #state{}) ->
    logger:info("诸神挑战boss结束", [], gods_place_mgr, 570),
    {[_StartTime], [EndTime]} =
        gods_duel_data:get_season_second({1, 34}),
    TimeState = date:now_diff(today, EndTime),
    {StateName, NewState} = case TimeState < 5 * 60 + 60 of
                                true ->
                                    big_world:cast(all,
                                                   gods_place_agent,
                                                   info,
                                                   [{update_state,
                                                     4,
                                                     date:now2(),
                                                     TimeState * 1000}]),
                                    gods_challenge_mgr:info(challenge_timeout),
                                    sync_allzone(State, clear_npc),
                                    {ending,
                                     State#state{ts = date:now2(),
                                                 timeout = TimeState * 1000}};
                                _ ->
                                    Ref = erlang:send_after(10 * 1000,
                                                            self(),
                                                            ret_act_notice),
                                    put(ret_act_notice_ref, Ref),
                                    Ref1 = erlang:send_after(5 * 60 * 1000,
                                                             self(),
                                                             ret_act_box),
                                    put(ret_act_box_ref, Ref1),
                                    big_world:cast(all,
                                                   gods_place_agent,
                                                   info,
                                                   [{update_state,
                                                     3,
                                                     date:now2(),
                                                     TimeState * 1000}]),
                                    {active,
                                     State#state{ts = date:now2(),
                                                 timeout = TimeState * 1000}}
                            end,
    continue(StateName, NewState).

active(timeout, State = #state{}) ->
    logger:info("诸神殿堂活动结束", [], gods_place_mgr, 597),
    {NewState, EndTime} = {State#state{ts = date:now2(),
                                       timeout = util:rand(120, 300) * 1000},
                           util:rand(120, 300)},
    big_world:cast(all,
                   gods_place_agent,
                   info,
                   [{update_state, 4, date:now2(), EndTime * 1000}]),
    sync_allzone(State, close_box),
    sync_allzone(State, stop_barrage),
    continue(ending, NewState).

ending(timeout, State = #state{}) ->
    logger:info("诸神殿堂活动结束, 进行清理", [], gods_place_mgr, 619),
    {_, TimeOut} = get_state(),
    State1 = State#state{ts = date:now2(),
                         timeout = TimeOut, zone_nextid = 1},
    gods_challenge_mgr:info({update_watch_status, 0}),
    big_world:cast(all,
                   gods_place_agent,
                   info,
                   [{update_state, 0, date:now2(), TimeOut}]),
    NewState = uninit_zone(State1),
    continue(idle, NewState).

loadtest(Group, Id, Num) ->
    Members = case Num of
                  7 ->
                      [#gods_place_team_mate_statue{id = {5, "unite", 80},
                                                    name = [20313, 23569],
                                                    lev = 98, classes = 1,
                                                    sex = 1, break_times = 1,
                                                    looks = []},
                       #gods_place_team_mate_statue{id = {357, "unite", 80},
                                                    name =
                                                        [19968,
                                                         31508,
                                                         30011,
                                                         31179,
                                                         20937,
                                                         20022],
                                                    classes = 1, sex = 1,
                                                    lev = 97, break_times = 1,
                                                    looks = []},
                       #gods_place_team_mate_statue{id = {31, "unite", 78},
                                                    name =
                                                        [28156,
                                                         28156,
                                                         27777,
                                                         22914,
                                                         38634,
                                                         20022],
                                                    classes = 5, sex = 0,
                                                    lev = 98, break_times = 1,
                                                    looks = []},
                       #gods_place_team_mate_statue{id = {2701, "unite", 77},
                                                    name =
                                                        [29030,
                                                         29030,
                                                         26262,
                                                         22914,
                                                         38451,
                                                         20022],
                                                    classes = 1, sex = 0,
                                                    lev = 98, break_times = 1,
                                                    looks = []},
                       #gods_place_team_mate_statue{id = {86577, "dev", 1},
                                                    name =
                                                        util:flist("~w龙井five~w",
                                                                   [Group, Id]),
                                                    lev = 84 + Group * 5,
                                                    classes = 4,
                                                    sex = util:rand(1, 2),
                                                    break_times = 0,
                                                    looks =
                                                        [{1, 0, 10301, []},
                                                         {68, 0, 0, []}]},
                       #gods_place_team_mate_statue{id = {83294, "dev", 1},
                                                    name =
                                                        util:flist("~w龙井six~w",
                                                                   [Group, Id]),
                                                    lev = 83 + Group * 5,
                                                    classes = 4,
                                                    sex = util:rand(1, 2),
                                                    break_times = 0,
                                                    looks =
                                                        [{1, 0, 10301, []},
                                                         {68, 0, 0, []}]},
                       #gods_place_team_mate_statue{id = {83295, "dev", 1},
                                                    name =
                                                        util:flist("~w龙井seven~w",
                                                                   [Group, Id]),
                                                    lev = 82 + Group * 5,
                                                    classes = 4,
                                                    sex = util:rand(1, 2),
                                                    break_times = 0,
                                                    looks =
                                                        [{1, 0, 10301, []},
                                                         {68, 0, 0, []}]}];
                  6 ->
                      [#gods_place_team_mate_statue{id = {85356, "dev", 1},
                                                    name =
                                                        util:flist("~w龙井one~w",
                                                                   [Group, Id]),
                                                    lev = 80 + Group * 5,
                                                    classes = 6, sex = 0,
                                                    break_times = 0,
                                                    looks =
                                                        [{67, 0, 1, []},
                                                         {1, 171120, 10503, []},
                                                         {50, 0, 20024, []},
                                                         {2, 50094, 50094, []},
                                                         {3, 51094, 51094, []},
                                                         {6, 0, 53078, []},
                                                         {52, 2, 11129, []},
                                                         {68, 0, 0, []}]},
                       #gods_place_team_mate_statue{id = {86581, "dev", 1},
                                                    name =
                                                        util:flist("~w龙井two~w",
                                                                   [Group, Id]),
                                                    lev = 81 + Group * 5,
                                                    classes = 1, sex = 0,
                                                    break_times = 0,
                                                    looks =
                                                        [{67, 0, 1, []},
                                                         {1, 111120, 10005, []},
                                                         {50, 0, 20005, []},
                                                         {2, 50078, 50078, []},
                                                         {3, 51078, 51078, []},
                                                         {6, 0, 53045, []},
                                                         {52, 2, 11129, []},
                                                         {68, 0, 0, []}]},
                       #gods_place_team_mate_statue{id = {83348, "dev", 1},
                                                    name =
                                                        util:flist("~w龙井three~w",
                                                                   [Group, Id]),
                                                    lev = 82 + Group * 5,
                                                    classes = 2, sex = 0,
                                                    break_times = 0,
                                                    looks =
                                                        [{67, 0, 1, []},
                                                         {1, 121120, 10102, []},
                                                         {50, 0, 20005, []},
                                                         {2, 50076, 50076, []},
                                                         {3, 51076, 51076, []},
                                                         {52, 2, 11061, "青之肖丁"},
                                                         {68, 0, 0, []}]},
                       #gods_place_team_mate_statue{id = {83183, "dev", 1},
                                                    name =
                                                        util:flist("~w龙井four~w",
                                                                   [Group, Id]),
                                                    lev = 83 + Group * 5,
                                                    classes = 3, sex = 1,
                                                    break_times = 0,
                                                    looks =
                                                        [{67, 0, 1, []},
                                                         {1, 131100, 10207, []},
                                                         {50, 0, 20005, []},
                                                         {2, 50053, 50053, []},
                                                         {3, 51053, 51053, []},
                                                         {52, 2, 11129, []},
                                                         {68, 0, 0, []}]},
                       #gods_place_team_mate_statue{id = {86577, "dev", 1},
                                                    name =
                                                        util:flist("~w龙井five~w",
                                                                   [Group, Id]),
                                                    lev = 84 + Group * 5,
                                                    classes = 4,
                                                    sex = util:rand(1, 2),
                                                    break_times = 0,
                                                    looks =
                                                        [{1, 0, 10301, []},
                                                         {68, 0, 0, []}]},
                       #gods_place_team_mate_statue{id = {83294, "dev", 1},
                                                    name =
                                                        util:flist("~w龙井six~w",
                                                                   [Group, Id]),
                                                    lev = 83 + Group * 5,
                                                    classes = 4,
                                                    sex = util:rand(1, 2),
                                                    break_times = 0,
                                                    looks =
                                                        [{1, 0, 10301, []},
                                                         {68, 0, 0, []}]}];
                  5 ->
                      [#gods_place_team_mate_statue{id = {85356, "dev", 1},
                                                    name =
                                                        util:flist("~w龙井one~w",
                                                                   [Group, Id]),
                                                    lev = 80 + Group * 5,
                                                    classes = 6, sex = 0,
                                                    break_times = 0,
                                                    looks =
                                                        [{67, 0, 1, []},
                                                         {1, 171120, 10503, []},
                                                         {50, 0, 20024, []},
                                                         {2, 50094, 50094, []},
                                                         {3, 51094, 51094, []},
                                                         {6, 0, 53078, []},
                                                         {52, 2, 11129, []},
                                                         {68, 0, 0, []}]},
                       #gods_place_team_mate_statue{id = {86581, "dev", 1},
                                                    name =
                                                        util:flist("~w龙井two~w",
                                                                   [Group, Id]),
                                                    lev = 81 + Group * 5,
                                                    classes = 1, sex = 0,
                                                    break_times = 0,
                                                    looks =
                                                        [{67, 0, 1, []},
                                                         {1, 111120, 10005, []},
                                                         {50, 0, 20005, []},
                                                         {2, 50078, 50078, []},
                                                         {3, 51078, 51078, []},
                                                         {6, 0, 53045, []},
                                                         {52, 2, 11129, []},
                                                         {68, 0, 0, []}]},
                       #gods_place_team_mate_statue{id = {83348, "dev", 1},
                                                    name =
                                                        util:flist("~w龙井three~w",
                                                                   [Group, Id]),
                                                    lev = 82 + Group * 5,
                                                    classes = 2, sex = 0,
                                                    break_times = 0,
                                                    looks =
                                                        [{67, 0, 1, []},
                                                         {1, 121120, 10102, []},
                                                         {50, 0, 20005, []},
                                                         {2, 50076, 50076, []},
                                                         {3, 51076, 51076, []},
                                                         {52, 2, 11061, "青之肖丁"},
                                                         {68, 0, 0, []}]},
                       #gods_place_team_mate_statue{id = {83183, "dev", 1},
                                                    name =
                                                        util:flist("~w龙井four~w",
                                                                   [Group, Id]),
                                                    lev = 83 + Group * 5,
                                                    classes = 3, sex = 1,
                                                    break_times = 0,
                                                    looks =
                                                        [{67, 0, 1, []},
                                                         {1, 131100, 10207, []},
                                                         {50, 0, 20005, []},
                                                         {2, 50053, 50053, []},
                                                         {3, 51053, 51053, []},
                                                         {52, 2, 11129, []},
                                                         {68, 0, 0, []}]},
                       #gods_place_team_mate_statue{id = {86577, "dev", 1},
                                                    name =
                                                        util:flist("~w龙井five~w",
                                                                   [Group, Id]),
                                                    lev = 84 + Group * 5,
                                                    classes = 4,
                                                    sex = util:rand(1, 2),
                                                    break_times = 0,
                                                    looks =
                                                        [{1, 0, 10301, []},
                                                         {68, 0, 0, []}]}]
              end,
    ChampionTeamInfo = #gods_place_team_statue{team_id =
                                                   Group + Id * 10,
                                               id = {Group + Id, "local", 1},
                                               name =
                                                   util:flist("~w侧滑队~w",
                                                              [Group, Id]),
                                               lev = Group, members = Members,
                                               qualification = 8,
                                               serial_id = Id,
                                               team_leader = {5, "local", 1}},
    gods_place_mgr:info({update, ChampionTeamInfo}).

load_data(Id) ->
    case ets:tab2list(gods_duel_season_data) of
        [#gods_duel_season_data{history_season_info =
                                    SeasonInfo}] ->
            case lists:keyfind(Id,
                               #gods_duel_season_info.id,
                               SeasonInfo)
                of
                #gods_duel_season_info{teams = Teams} ->
                    case Teams of
                        [] ->
                            logger:error("未找到第~w赛季的队伍信息",
                                         [Id],
                                         gods_place_mgr,
                                         678),
                            ok;
                        List -> do_data(Id, 5, List)
                    end;
                _ ->
                    logger:error("未找到第~w赛季的队伍信息",
                                 [Id],
                                 gods_place_mgr,
                                 684),
                    ok
            end;
        _ ->
            logger:error("未找到第~w赛季的队伍信息",
                         [Id],
                         gods_place_mgr,
                         688),
            ok
    end.

do_data(_Id, 0, _T) -> ok;
do_data(Id, Group, Teams) ->
    case lists:keyfind(Group, 1, Teams) of
        {Group, GTeams} ->
            case lists:keyfind(13,
                               #gods_duel_team.qualification,
                               GTeams)
                of
                #gods_duel_team{id = Lid, name = Tname,
                                qualification = Qua, members = Members1} ->
                    Fun = fun (#gods_duel_team_mate{id = Rid = {RID, P, Z},
                                                    name = RName,
                                                    classes = RClasses,
                                                    sex = RSex, lev = RLev,
                                                    break_times = Rbreak},
                               Temp) ->
                                  case big_world:call(P,
                                                      Z,
                                                      role_query,
                                                      attr,
                                                      [by_id,
                                                       RID,
                                                       P,
                                                       Z,
                                                       [#role.s_looks]])
                                      of
                                      {ok, [Looks]} ->
                                          Looks1 = [{LooksType,
                                                     LooksMode,
                                                     LooksVal,
                                                     LooksStr}
                                                    || {LooksType,
                                                        LooksMode,
                                                        LooksVal,
                                                        LooksStr}
                                                           <- Looks,
                                                       lists:member(LooksType,
                                                                    [1,
                                                                     2,
                                                                     3,
                                                                     4,
                                                                     6])],
                                          [#gods_place_team_mate_statue{id =
                                                                            Rid,
                                                                        name =
                                                                            RName,
                                                                        classes
                                                                            =
                                                                            RClasses,
                                                                        sex =
                                                                            RSex,
                                                                        lev =
                                                                            RLev,
                                                                        break_times
                                                                            =
                                                                            Rbreak,
                                                                        looks =
                                                                            Looks1}
                                           | Temp];
                                      _ ->
                                          case big_world:call(P,
                                                              Z,
                                                              robot_mgr,
                                                              get_looks_role,
                                                              [Rid])
                                              of
                                              {ok, Looks} when is_list(Looks) ->
                                                  Looks1 = [{LooksType,
                                                             LooksMode,
                                                             LooksVal,
                                                             LooksStr}
                                                            || {LooksType,
                                                                LooksMode,
                                                                LooksVal,
                                                                LooksStr}
                                                                   <- Looks,
                                                               lists:member(LooksType,
                                                                            [1,
                                                                             2,
                                                                             3,
                                                                             4,
                                                                             6])],
                                                  [#gods_place_team_mate_statue{id
                                                                                    =
                                                                                    Rid,
                                                                                name
                                                                                    =
                                                                                    RName,
                                                                                lev
                                                                                    =
                                                                                    RLev,
                                                                                classes
                                                                                    =
                                                                                    RClasses,
                                                                                sex
                                                                                    =
                                                                                    RSex,
                                                                                break_times
                                                                                    =
                                                                                    Rbreak,
                                                                                looks
                                                                                    =
                                                                                    Looks1}
                                                   | Temp];
                                              _Msg ->
                                                  logger:info("取机器人数据出错:~w",
                                                              [_Msg],
                                                              gods_place_mgr,
                                                              709),
                                                  [#gods_place_team_mate_statue{id
                                                                                    =
                                                                                    Rid,
                                                                                name
                                                                                    =
                                                                                    RName,
                                                                                lev
                                                                                    =
                                                                                    RLev,
                                                                                classes
                                                                                    =
                                                                                    RClasses,
                                                                                sex
                                                                                    =
                                                                                    RSex,
                                                                                break_times
                                                                                    =
                                                                                    Rbreak,
                                                                                looks
                                                                                    =
                                                                                    []}
                                                   | Temp]
                                          end
                                  end;
                              (_, Temp) -> Temp
                          end,
                    Members2 = lists:foldl(Fun, [], Members1),
                    ChampionTeamInfo = #gods_place_team_statue{team_id =
                                                                   Group +
                                                                       Id * 10,
                                                               id = Lid,
                                                               name = Tname,
                                                               lev = Group,
                                                               members =
                                                                   Members2,
                                                               qualification =
                                                                   Qua,
                                                               serial_id = Id,
                                                               team_leader =
                                                                   Lid},
                    gods_place_mgr:info({update, Id, ChampionTeamInfo});
                _ ->
                    logger:error("未找到第~w赛季分组为:~w的冠军队",
                                 [Id, Group],
                                 gods_place_mgr,
                                 719),
                    ok
            end;
        _ ->
            logger:error("未找到第~w赛季分组为:~w的冠军队",
                         [Id, Group],
                         gods_place_mgr,
                         723),
            ok
    end,
    do_data(Id, Group - 1, Teams).

gm_creatbox() -> gods_place_mgr:info(create_box).

next() -> gen_fsm:send_event(gods_place_mgr, timeout).

look_zone_list() -> gods_place_mgr ! look_zone_list.

reset() -> gods_place_mgr ! reset.

init_zone(State = #state{zone_nextid = ZoneNextId}) ->
    {ZoneList, NextId} = do_init_zone(5, ZoneNextId, []),
    State#state{zone_list = ZoneList, zone_nextid = NextId}.

do_init_zone(Seq, NextId, ZoneList) when Seq =< 0 ->
    {ZoneList, NextId};
do_init_zone(Seq, NextId, ZoneList) ->
    case create_zone(Seq, NextId) of
        {true, NextId, ZonePid} ->
            do_init_zone(Seq - 1,
                         NextId + 1,
                         [{Seq, [{NextId, ZonePid, 0}]} | ZoneList]);
        false -> do_init_zone(Seq - 1, NextId, ZoneList)
    end.

create_zone(Seq, NextId) ->
    case gods_place_zone:start_link(Seq, NextId) of
        {ok, ZonePid} -> {true, NextId, ZonePid};
        _Err ->
            logger:error("开启诸神殿堂失败:~w:~w",
                         [Seq, _Err],
                         gods_place_mgr,
                         763),
            false
    end.

uninit_zone(State = #state{zone_list = ZoneList}) ->
    {NZList, NId} = do_uninit_zone(5, ZoneList),
    State#state{zone_list = NZList, zone_nextid = NId}.

do_uninit_zone(Seq, [{_, GZoneList} | T]) ->
    release_zone(GZoneList),
    do_uninit_zone(Seq - 1, T);
do_uninit_zone(Seq, _ZoneList) when Seq =< 0 -> {[], 1};
do_uninit_zone(_Seq, []) -> {[], 1}.

release_zone([{_, ZonePid, _} | Rest]) ->
    gods_place_zone:cast(ZonePid, close),
    release_zone(Rest);
release_zone([]) -> ok.

query_zone_info(Zones, GId, Num) ->
    GZones = case lists:keyfind(GId, 1, Zones) of
                 false -> [];
                 {GId, _GZones} -> _GZones
             end,
    logger:debug("~w", [GZones], gods_place_mgr, 789),
    query_zone_info2(GZones, Num, {-1, -1, -1}).

query_zone_info2([], _, {ZoneId, ZonePid, Count}) ->
    {ZoneId, ZonePid, Count};
query_zone_info2([{ZoneId, ZonePid, RoleCount} | Rest],
                 Num, {_ZoneId, _ZonePid, Count})
    when RoleCount + Num =< 90 ->
    case RoleCount < Count orelse Count =:= -1 of
        true ->
            query_zone_info2(Rest,
                             Num,
                             {ZoneId, ZonePid, RoleCount});
        false ->
            query_zone_info2(Rest, Num, {_ZoneId, _ZonePid, Count})
    end;
query_zone_info2([_ | Rest], Num,
                 {ZoneId, ZonePid, Count}) ->
    query_zone_info2(Rest, Num, {ZoneId, ZonePid, Count}).

zone_enter(GId, ZoneId, ZonePid, Num,
           State = #state{zone_list = Zones,
                          zone_nextid = NextId}) ->
    {NewZones, NextId2} = case lists:keytake(GId, 1, Zones)
                              of
                              {value, {GId, GZones}, Rest} ->
                                  case lists:keyfind(ZoneId, 1, GZones) of
                                      {ZoneId, ZonePid, Count} ->
                                          NGZones = lists:keyreplace(ZoneId,
                                                                     1,
                                                                     GZones,
                                                                     {ZoneId,
                                                                      ZonePid,
                                                                      Count +
                                                                          Num}),
                                          {[{GId, NGZones} | Rest], NextId};
                                      false ->
                                          NGZones = [{ZoneId, ZonePid, Num}
                                                     | GZones],
                                          {[{GId, NGZones} | Rest], NextId + 1}
                                  end;
                              _ ->
                                  {[{GId, [{ZoneId, ZonePid, Num}]} | Zones],
                                   NextId + 1}
                          end,
    State#state{zone_list = NewZones,
                zone_nextid = NextId2}.

zone_exit(GId, ZoneId, ZonePid,
          State = #state{zone_list = Zones}) ->
    NewZones = case lists:keytake(GId, 1, Zones) of
                   {value, {GId, GZones}, Rest} ->
                       case lists:keyfind(ZoneId, 1, GZones) of
                           {ZoneId, ZonePid, Count} ->
                               NGZones = lists:keyreplace(ZoneId,
                                                          1,
                                                          GZones,
                                                          {ZoneId,
                                                           ZonePid,
                                                           Count - 1}),
                               [{GId, NGZones} | Rest];
                           _ ->
                               logger:info("该房间已经关闭~w, ~w",
                                           [ZoneId, ZonePid],
                                           gods_place_mgr,
                                           829),
                               Zones
                       end;
                   _ ->
                       logger:info("该段位的房间已经全部关闭~w, ~w, ~w",
                                   [GId, ZoneId, ZonePid],
                                   gods_place_mgr,
                                   833),
                       Zones
               end,
    State#state{zone_list = NewZones}.

is_have_ceremony() ->
    case
        gods_duel_data:get_season_date({gods_duel_common:get_season_id(),
                                        31})
        of
        {_, [EndTime]} ->
            {Today, _} = date:seconds_to_datetime(date:unixtime2()),
            EndTime =:= Today orelse Today =:= {2018, 11, 26};
        _ -> false
    end.

get_state() ->
    {StateName, TimeOut} = case
                               agenda:get_state_timeout(2068, 300)
                               of
                               {idle, Tt} -> {idle, Tt};
                               {notice, _} -> {notice, 300};
                               {active, _} ->
                                   case is_have_ceremony() of
                                       true -> {ceremony, 140};
                                       _ -> {active, 140 + 1500}
                                   end
                           end,
    {StateName, TimeOut * 1000}.

sync_allzone(#state{zone_list = ZoneList}, Msg) ->
    do_sync_allzone(5, ZoneList, Msg).

do_sync_allzone(Seq, [{_, GZoneList} | T], Msg) ->
    sync_group_zone(GZoneList, Msg),
    do_sync_allzone(Seq - 1, T, Msg);
do_sync_allzone(Seq, _ZoneList, _Msg) when Seq =< 0 ->
    ok;
do_sync_allzone(_Seq, [], _Msg) -> ok.

sync_group_zone([{_, ZonePid, _} | Rest], Msg) ->
    gods_place_zone:cast(ZonePid, Msg),
    sync_group_zone(Rest, Msg);
sync_group_zone([], _Msg) -> ok.

send_allzone(Msg) -> gods_place_mgr ! {send_msg, Msg}.

do_enter(StateName,
         State = #state{ts = Ts, zone_list = Zones,
                        zone_nextid = NextId},
         GroupId, Num) ->
    case query_zone_info(Zones, GroupId, Num) of
        {-1, -1, -1} ->
            case create_zone(GroupId, NextId) of
                {true, ZoneId, ZonePid} ->
                    Reply = case gods_place_zone:call(ZonePid, {enter, Num})
                                of
                                {false, _Reason} ->
                                    {false, lang:get("进入诸神殿堂失败")};
                                Data -> Data
                            end,
                    case StateName of
                        _
                            when StateName =:= active orelse
                                     StateName =:= ready ->
                            T1 = util:floor(timer:now_diff(erlang:now(), Ts) /
                                                1000),
                            SpanTime = case T1 > 0 of
                                           true -> T1 div 1000;
                                           false -> 0
                                       end,
                            LeftTime = 5 * 60 - SpanTime rem (5 * 60),
                            NextRound = SpanTime div (5 * 60) + 1,
                            gods_place_zone:cast(ZonePid,
                                                 {create_box,
                                                  LeftTime,
                                                  NextRound}),
                            gods_place_zone:cast(ZonePid, rand_barrage),
                            gods_place_zone:cast(ZonePid, creat_statue);
                        _
                            when StateName =:= challenge_ready orelse
                                     StateName =:= challenge orelse
                                         StateName =:= challenge_manual ->
                            gods_place_zone:cast(ZonePid, creat_statue),
                            gods_place_zone:cast(ZonePid, make_npc);
                        _ -> ok
                    end,
                    {Reply,
                     zone_enter(GroupId, ZoneId, ZonePid, Num, State)};
                false -> {{false, lang:get("央服开启诸神殿堂失败")}, State}
            end;
        {ZoneId, ZonePid, _} ->
            logger:debug("~w,~w",
                         [ZoneId, ZonePid],
                         gods_place_mgr,
                         910),
            Reply = case gods_place_zone:call(ZonePid, {enter, Num})
                        of
                        {false, _Reason} -> {false, lang:get("进入诸神殿堂失败")};
                        Data -> Data
                    end,
            {Reply,
             zone_enter(GroupId, ZoneId, ZonePid, Num, State)};
        _ -> {{false, lang:get("进入诸神殿堂失败")}, State}
    end.

update_champion_profile(ChampionTeamInfo) ->
    ets:insert(gods_place_team_statue, ChampionTeamInfo),
    dets:insert(gods_place_team_statue, ChampionTeamInfo),
    ok.

update_gods_place_season(SeasonId) ->
    ets:insert(gods_place_season, {season_id, SeasonId}),
    dets:insert(gods_place_season, {season_id, SeasonId}),
    ok.

