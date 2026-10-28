-file("src/mod/gods_duel/gods_duel_mgr.erl", 1).

-module(gods_duel_mgr).

-behaviour(gen_fsm).

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

-file("src/mod/gods_duel/gods_duel_mgr.erl", 12).

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

-file("src/mod/gods_duel/gods_duel_mgr.erl", 13).

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

-file("src/mod/gods_duel/gods_duel_mgr.erl", 14).

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

-file("src/mod/gods_duel/gods_duel_mgr.erl", 15).

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

-file("src/mod/gods_duel/gods_duel_mgr.erl", 16).

-file("inc/looks.hrl", 1).

-file("src/mod/gods_duel/gods_duel_mgr.erl", 17).

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

-file("src/mod/gods_duel/gods_duel_mgr.erl", 18).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

-export([idle/2,
         prepare/2,
         sign/2,
         notice/2,
         match_256_idle_1/2,
         match_256_1/2,
         match_256_idle_2/2,
         match_256_2/2,
         match_256_idle_3/2,
         match_256_3/2,
         match_idle_32/2,
         match_32/2,
         match_idle_16/2,
         match_16/2,
         match_idle_8/2,
         match_8/2,
         match_idle_4/2,
         match_4/2,
         match_idle_half/2,
         match_half/2,
         match_idle_third/2,
         match_third/2,
         match_idle_champion/2,
         match_champion/2,
         ending/2,
         repair_group_id/0]).

-export([start_link/0,
         get_status/0,
         reload/0,
         next/0,
         reset/0,
         call/1,
         info/1,
         cast/1,
         save_team_group/1,
         get_current_season_id/0]).

-record(state,
        {timeout = 0,
         ts = 0,
         season_time_info = [],
         season_id = 0}).

start_link() ->
    gen_fsm:start_link({local, gods_duel_mgr},
                       gods_duel_mgr,
                       [],
                       []).

get_status() -> call(gods_duel_mgr, get_status).

reload() -> gods_duel_mgr ! reload.

next() -> gen_fsm:send_event(gods_duel_mgr, timeout).

reset() -> gods_duel_mgr ! reset.

call(Msg) -> call(gods_duel_mgr, Msg).

info(Msg) -> gods_duel_mgr ! Msg.

cast(Msg) ->
    gen_fsm:send_all_state_event(gods_duel_mgr, Msg).

idle(timeout, State) ->
    SeasonID = gods_duel_common:get_season_id(),
    case get_state(#gods_duel_season_info{id = SeasonID}) of
        {0, TimeOut, _, TimeInfo} ->
            case 1 of
                1 ->
                    logger:info("诸神之战进入准备阶段：~w",
                                [State],
                                gods_duel_mgr,
                                145),
                    cast_status(prepare),
                    update_season_status(1),
                    TimeOut2 = get_time_out(1, TimeInfo),
                    NewState = State#state{ts = now(), timeout = TimeOut2,
                                           season_time_info = TimeInfo},
                    continue(prepare, NewState);
                _ ->
                    NewState = State#state{ts = now(), timeout = TimeOut,
                                           season_time_info = TimeInfo},
                    continue(idle, NewState)
            end;
        {1, TimeOut, _, TimeInfo} ->
            logger:info("诸神之战进入准备阶段：~w",
                        [State],
                        gods_duel_mgr,
                        167),
            cast_status(prepare),
            update_season_status(1),
            TimeOut = get_time_out(1, TimeInfo),
            NewState = State#state{ts = now(), timeout = TimeOut,
                                   season_time_info = TimeInfo,
                                   season_id = SeasonID},
            continue(prepare, NewState);
        _ ->
            NewState = State#state{ts = now(),
                                   timeout = date:next_diff(0) * 1000,
                                   season_time_info = []},
            continue(idle, NewState)
    end.

prepare(timeout,
        State = #state{season_time_info = TimeInfo}) ->
    logger:info("诸神之战进入报名阶段：~w",
                [State],
                gods_duel_mgr,
                190),
    cast_status(sign),
    update_season_status(2),
    TimeOut = get_time_out(2, TimeInfo),
    NoticeSignTimeOut = max(TimeOut div 1000 - 5 * 3600, 0),
    erlang:send_after(NoticeSignTimeOut * 1000,
                      self(),
                      notice_sign_mail),
    Hour = date:hour(),
    RankTimeOut = date:next_diff(Hour + 1, 0, 0),
    RankRef = erlang:send_after(RankTimeOut * 1000,
                                self(),
                                rank_cleanness),
    put(rank_ref, RankRef),
    NewState = State#state{ts = now(), timeout = TimeOut},
    continue(sign, NewState).

sign(timeout,
     State = #state{season_time_info = TimeInfo}) ->
    logger:info("诸神之战进入公示阶段：~w",
                [State],
                gods_duel_mgr,
                216),
    ThresholdInfo = calc_threshold_info(),
    big_world:cast(all,
                   gods_duel_agent,
                   info,
                   [{last_team_sign, ThresholdInfo}]),
    cast_status(notice),
    update_season_status(3),
    erlang:send_after(300000, self(), fetch_group),
    TimeOut = get_time_out(3, TimeInfo),
    NewState = State#state{ts = now(), timeout = TimeOut},
    continue(notice, NewState).

notice(timeout,
       State = #state{season_time_info = TimeInfo}) ->
    logger:info("进入小组赛场1空闲:~w",
                [State],
                gods_duel_mgr,
                235),
    cast_status(match_256_idle_1),
    update_season_status(4),
    TimeOut = get_time_out(4, TimeInfo),
    start_mail_prompt_ref(TimeOut),
    NewState = State#state{ts = now(), timeout = TimeOut},
    continue(match_256_idle_1, NewState).

match_256_idle_1(timeout,
                 State = #state{season_time_info = TimeInfo}) ->
    cast_status(match_256_1),
    update_season_status(5),
    gods_duel_match:info({start_match, 5}),
    TimeOut = get_time_out(5, TimeInfo),
    NewState = State#state{ts = now(), timeout = TimeOut},
    continue(match_256_1, NewState).

match_256_1(timeout,
            State = #state{season_time_info = TimeInfo}) ->
    cast_status(match_256_idle_2),
    update_season_status(6),
    TimeOut = get_time_out(6, TimeInfo),
    start_mail_prompt_ref(TimeOut),
    NewState = State#state{ts = now(), timeout = TimeOut},
    continue(match_256_idle_2, NewState).

match_256_idle_2(timeout,
                 State = #state{season_time_info = TimeInfo}) ->
    cast_status(match_256_2),
    update_season_status(7),
    gods_duel_match:info({start_match, 7}),
    TimeOut = get_time_out(7, TimeInfo),
    NewState = State#state{ts = now(), timeout = TimeOut},
    continue(match_256_2, NewState).

match_256_2(timeout,
            State = #state{season_time_info = TimeInfo}) ->
    cast_status(match_256_idle_3),
    update_season_status(8),
    TimeOut = get_time_out(8, TimeInfo),
    start_mail_prompt_ref(TimeOut),
    NewState = State#state{ts = now(), timeout = TimeOut},
    continue(match_256_idle_3, NewState).

match_256_idle_3(timeout,
                 State = #state{season_time_info = TimeInfo}) ->
    cast_status(match_256_3),
    update_season_status(9),
    gods_duel_match:info({start_match, 9}),
    TimeOut = get_time_out(9, TimeInfo),
    NewState = State#state{ts = now(), timeout = TimeOut},
    continue(match_256_3, NewState).

match_256_3(timeout,
            State = #state{season_time_info = TimeInfo}) ->
    cast_status(match_idle_32),
    update_season_status(18),
    start_prompt_ref(),
    TimeOut = get_time_out(18, TimeInfo),
    start_mail_prompt_ref(TimeOut),
    NewState = State#state{ts = now(), timeout = TimeOut},
    continue(match_idle_32, NewState).

match_idle_32(timeout,
              State = #state{season_time_info = TimeInfo}) ->
    cast_status(match_32),
    update_season_status(19),
    gods_duel_match:info({start_match, 19}),
    TimeOut = get_time_out(19, TimeInfo),
    NewState = State#state{ts = now(), timeout = TimeOut},
    continue(match_32, NewState).

match_32(timeout,
         State = #state{season_time_info = TimeInfo}) ->
    cast_status(match_idle_16),
    update_season_status(20),
    start_prompt_ref(),
    TimeOut = get_time_out(20, TimeInfo),
    start_mail_prompt_ref(TimeOut),
    NewState = State#state{ts = now(), timeout = TimeOut},
    continue(match_idle_16, NewState).

match_idle_16(timeout,
              State = #state{season_time_info = TimeInfo}) ->
    cast_status(match_16),
    update_season_status(21),
    gods_duel_match:info({start_match, 21}),
    TimeOut = get_time_out(21, TimeInfo),
    NewState = State#state{ts = now(), timeout = TimeOut},
    continue(match_16, NewState).

match_16(timeout,
         State = #state{season_time_info = TimeInfo}) ->
    cast_status(match_idle_8),
    update_season_status(22),
    start_prompt_ref(),
    TimeOut = get_time_out(22, TimeInfo),
    start_mail_prompt_ref(TimeOut),
    NewState = State#state{ts = now(), timeout = TimeOut},
    continue(match_idle_8, NewState).

match_idle_8(timeout,
             State = #state{season_time_info = TimeInfo}) ->
    cast_status(match_8),
    update_season_status(23),
    gods_duel_match:info({start_match, 23}),
    TimeOut = get_time_out(23, TimeInfo),
    NewState = State#state{ts = now(), timeout = TimeOut},
    continue(match_8, NewState).

match_8(timeout,
        State = #state{season_time_info = TimeInfo}) ->
    cast_status(match_idle_4),
    update_season_status(24),
    start_prompt_ref(),
    TimeOut = get_time_out(24, TimeInfo),
    start_mail_prompt_ref(TimeOut),
    NewState = State#state{ts = now(), timeout = TimeOut},
    continue(match_idle_4, NewState).

match_idle_4(timeout,
             State = #state{season_time_info = TimeInfo}) ->
    cast_status(match_4),
    update_season_status(25),
    gods_duel_match:info({start_match, 25}),
    TimeOut = get_time_out(25, TimeInfo),
    NewState = State#state{ts = now(), timeout = TimeOut},
    continue(match_4, NewState).

match_4(timeout,
        State = #state{season_time_info = TimeInfo}) ->
    cast_status(match_idle_half),
    update_season_status(26),
    start_prompt_ref(),
    TimeOut = get_time_out(26, TimeInfo),
    start_mail_prompt_ref(TimeOut),
    NewState = State#state{ts = now(), timeout = TimeOut},
    continue(match_idle_half, NewState).

match_idle_half(timeout,
                State = #state{season_time_info = TimeInfo}) ->
    cast_status(match_half),
    update_season_status(27),
    gods_duel_match:info({start_match, 27}),
    TimeOut = get_time_out(27, TimeInfo),
    NewState = State#state{ts = now(), timeout = TimeOut},
    continue(match_half, NewState).

match_half(timeout,
           State = #state{season_time_info = TimeInfo}) ->
    cast_status(match_idle_third),
    update_season_status(28),
    start_prompt_ref(),
    TimeOut = get_time_out(28, TimeInfo),
    start_mail_prompt_ref(TimeOut),
    NewState = State#state{ts = now(), timeout = TimeOut},
    continue(match_idle_third, NewState).

match_idle_third(timeout,
                 State = #state{season_time_info = TimeInfo}) ->
    cast_status(match_third),
    update_season_status(29),
    gods_duel_match:info({start_match, 29}),
    TimeOut = get_time_out(29, TimeInfo),
    NewState = State#state{ts = now(), timeout = TimeOut},
    continue(match_third, NewState).

match_third(timeout,
            State = #state{season_time_info = TimeInfo}) ->
    cast_status(match_idle_champion),
    update_season_status(30),
    start_prompt_ref(),
    TimeOut = get_time_out(30, TimeInfo),
    start_mail_prompt_ref(TimeOut),
    NewState = State#state{ts = now(), timeout = TimeOut},
    continue(match_idle_champion, NewState).

match_idle_champion(timeout,
                    State = #state{season_time_info = TimeInfo}) ->
    cast_status(match_champion),
    update_season_status(31),
    gods_duel_match:info({start_match, 31}),
    TimeOut = get_time_out(31, TimeInfo),
    NewState = State#state{ts = now(), timeout = TimeOut},
    continue(match_champion, NewState).

match_champion(timeout, State = #state{}) ->
    cast_status(ending),
    update_season_status(33),
    NewState = State#state{ts = now(), timeout = 60000},
    continue(ending, NewState).

ending(timeout,
       _State = #state{season_id = SeasonId}) ->
    cast_status(idle),
    update_season_status(0),
    gods_challenge_mgr:info({update_season_id, SeasonId}),
    EndingSeaonInfo = #gods_duel_season_info{teams =
                                                 Teams} =
                          case ets:lookup(gods_duel_season_info,
                                          gods_duel_season_info)
                              of
                              [SeasonInfo = #gods_duel_season_info{}] ->
                                  SeasonJoinTeam =
                                      ets:tab2list(gods_duel_group_team),
                                  Teams8Strong =
                                      filter_8strong_teams(SeasonJoinTeam, []),
                                  SeasonInfo#gods_duel_season_info{teams =
                                                                       Teams8Strong};
                              _ -> #gods_duel_season_info{}
                          end,
    case ets:lookup(gods_duel_season_data,
                    gods_duel_season_data)
        of
        [SeasonData = #gods_duel_season_data{history_season_info
                                                 = HisSeasonInfo}] ->
            NewHisSeasonInfo = [EndingSeaonInfo | HisSeasonInfo],
            NewSeasonData =
                SeasonData#gods_duel_season_data{history_season_info =
                                                     NewHisSeasonInfo},
            big_world:cast(all,
                           gods_duel_agent,
                           info,
                           [{update_season_data, NewSeasonData}]),
            update_season_data(NewSeasonData);
        _ -> ok
    end,
    ChampionTeamFun = fun ({_, GodsTeams}) ->
                              case [ChampionTeam
                                    || ChampionTeam =
                                           #gods_duel_team{qualification = 13}
                                           <- GodsTeams]
                                  of
                                  [_Team | _] -> _Team;
                                  _ -> #gods_duel_team{}
                              end
                      end,
    ChampionTeamInfo = lists:map(ChampionTeamFun, Teams),
    big_world:cast(all,
                   gods_duel_agent,
                   info,
                   [{update_championteam, ChampionTeamInfo}]),
    case lists:keyfind(5, 1, Teams) of
        {_, TeamList} ->
            case [Team
                  || Team = #gods_duel_team{qualification = Qualification}
                         <- TeamList,
                     Qualification =:= 13]
                of
                [#gods_duel_team{name = TeamName,
                                 member_num = MembersNum, members = Members}
                 | _] ->
                    NewMembers = [#gods_challenge_team_mate{id = RoleId,
                                                            name = RoleName}
                                  || #gods_duel_team_mate{id = RoleId,
                                                          name = RoleName}
                                         <- Members],
                    NewGodsChallengeTeam = #gods_challenge_team{season_id =
                                                                    SeasonId,
                                                                team_name =
                                                                    TeamName,
                                                                members =
                                                                    NewMembers,
                                                                member_num =
                                                                    MembersNum},
                    env:save(gods_challenge_team, NewGodsChallengeTeam),
                    big_world:cast(all,
                                   gods_duel_agent,
                                   info,
                                   [{update_challenge_team,
                                     NewGodsChallengeTeam}]),
                    ok;
                _ -> ok
            end;
        _ -> ok
    end,
    big_world:cast(all,
                   gods_duel_agent,
                   info,
                   [send_honor]),
    update_rank(),
    GroupTeam = ets:tab2list(gods_duel_group_team),
    gods_duel_rank:update_rank(GroupTeam),
    ets:delete_all_objects(gods_duel_team_sign),
    dets:delete_all_objects(gods_duel_team_sign),
    big_world:cast(all,
                   gods_duel_agent,
                   info,
                   [{reset, false}]),
    NewSeasonID = gods_duel_common:get_new_season_id(),
    Now = date:unixtime(),
    Timeout = case
                  gods_duel_common:get_state_get_time_config(NewSeasonID,
                                                             1)
                  of
                  {NewStartTime, _NewEndTime} when NewStartTime > Now ->
                      (NewStartTime - Now) * 1000;
                  _ -> infinity
              end,
    NewState = #state{ts = now(), timeout = Timeout,
                      season_time_info = []},
    continue(idle, NewState).

init([]) ->
    process_flag(trap_exit, true),
    logger:info("启动诸神之战赛季管理进程...", [], gods_duel_mgr, 706),
    dets:open_file(gods_duel_season_data,
                   [{file, "./dets/gods_duel_season_data.dets"},
                    {keypos, 1},
                    {type, set}]),
    ets:new(gods_duel_season_data,
            [set, named_table, public, {keypos, 1}]),
    dets:to_ets(gods_duel_season_data,
                gods_duel_season_data),
    dets:open_file(gods_duel_season_info,
                   [{file, "./dets/gods_duel_season.dets"},
                    {keypos, 1},
                    {type, set}]),
    ets:new(gods_duel_season_info,
            [set, named_table, public, {keypos, 1}]),
    dets:to_ets(gods_duel_season_info,
                gods_duel_season_info),
    dets:open_file(gods_duel_team_sign,
                   [{file, "./dets/gods_duel_team_sign.dets"},
                    {keypos, #gods_duel_team.id},
                    {type, set}]),
    ets:new(gods_duel_team_sign,
            [set,
             named_table,
             public,
             {keypos, #gods_duel_team.id}]),
    dets:to_ets(gods_duel_team_sign, gods_duel_team_sign),
    dets:open_file(gods_duel_group_team,
                   [{file, "./dets/gods_duel_group_team.dets"},
                    {keypos, 1},
                    {type, set}]),
    ets:new(gods_duel_group_team,
            [set, named_table, public, {keypos, 1}]),
    dets:to_ets(gods_duel_group_team, gods_duel_group_team),
    dets:open_file(gods_duel_poll,
                   [{file, "./dets/gods_duel_poll.dets"},
                    {keypos, #gods_duel_poll.id}]),
    ets:new(gods_duel_poll,
            [set,
             named_table,
             public,
             {keypos, #gods_duel_poll.id}]),
    dets:to_ets(gods_duel_poll, gods_duel_poll),
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
    dets:open_file(gods_duel_team_rank,
                   [{file, "./dets/gods_duel_team_rank.dets"},
                    {keypos, 1}]),
    ets:new(gods_duel_team_rank,
            [set, named_table, public, {keypos, 1}]),
    dets:to_ets(gods_duel_team_rank, gods_duel_team_rank),
    update_rank(),
    erlang:send_after(120 * 1000, self(), update_team_rank),
    case gods_duel_match:start_link() of
        {ok, _Pid} ->
            OldSeasonId = gods_duel_common:get_season_id(),
            case gods_duel_common:get_new_season_id(OldSeasonId) of
                CfgSeasonId
                    when is_integer(CfgSeasonId) andalso
                             CfgSeasonId > OldSeasonId ->
                    info(reset),
                    {ok, idle, #state{}, infinity};
                CfgSeasonId
                    when is_integer(CfgSeasonId) andalso
                             CfgSeasonId =:= OldSeasonId ->
                    case ets:lookup(gods_duel_season_info,
                                    gods_duel_season_info)
                        of
                        [SeasonInfo = #gods_duel_season_info{}] ->
                            {_StateOrder, TimeOut, StateName, TimeCfg} =
                                get_state(SeasonInfo),
                            logger:debug("重新加载配置后赛季信息:~w",
                                         [{_StateOrder,
                                           TimeOut,
                                           StateName,
                                           TimeCfg}],
                                         gods_duel_mgr,
                                         768),
                            NewSeasonInfo =
                                SeasonInfo#gods_duel_season_info{season_time_info
                                                                     = TimeCfg},
                            update_season_info(NewSeasonInfo),
                            case StateName of
                                _
                                    when StateName =:= idle orelse
                                             StateName =:= prepare orelse
                                                 StateName =:= notice orelse
                                                     StateName =:= ending ->
                                    ok;
                                ignore ->
                                    Hour = date:hour(),
                                    RankTimeOut = date:next_diff(Hour + 1,
                                                                 0,
                                                                 0),
                                    RankRef = erlang:send_after(RankTimeOut *
                                                                    1000,
                                                                self(),
                                                                rank_cleanness),
                                    put(rank_ref, RankRef);
                                _ ->
                                    ProfileRankRef = erlang:send_after(600000,
                                                                       self(),
                                                                       update_rank),
                                    put(profile_rank_ref, ProfileRankRef)
                            end,
                            Ts = now(),
                            State = #state{ts = Ts, timeout = TimeOut,
                                           season_time_info = TimeCfg,
                                           season_id = CfgSeasonId},
                            NextTimeOut = case TimeOut of
                                              infinity -> infinity;
                                              _ -> util:time_left(TimeOut, Ts)
                                          end,
                            logger:info("启动诸神之战赛季管理进程完成...",
                                        [],
                                        gods_duel_mgr,
                                        801),
                            {ok, StateName, State, NextTimeOut};
                        _ ->
                            info(reset),
                            logger:info("启动诸神之战赛季管理进程完成...",
                                        [],
                                        gods_duel_mgr,
                                        805),
                            {ok, idle, #state{}, infinity}
                    end;
                _Err ->
                    logger:error("启动诸神管理进程失败，旧赛季:~w, 赛季配置:~w",
                                 [OldSeasonId, _Err],
                                 gods_duel_mgr,
                                 809),
                    {stop, season_id_config_error}
            end;
        _ -> {stop, start_gods_duel_match_failed}
    end.

handle_event(_Event, StateName, State) ->
    logger:error("未知消息 ~w", [_Event], gods_duel_mgr, 817),
    continue(StateName, State).

handle_sync_event(get_gods_season_data, _From,
                  StateName, State = #state{}) ->
    SeasonData = case catch
                          ets:lookup(gods_duel_season_data,
                                     gods_duel_season_data)
                     of
                     [_Data = #gods_duel_season_data{}] -> _Data;
                     _ -> #gods_duel_season_data{}
                 end,
    Reply = {ok, SeasonData},
    continue(Reply, StateName, State);
handle_sync_event(get_status, _From, StateName,
                  State = #state{season_id = SeasonId}) ->
    StateOrder =
        gods_duel_common:get_state_order(StateName),
    Reply = {ok, StateOrder, SeasonId},
    continue(Reply, StateName, State);
handle_sync_event(get_group_info, _From, StateName,
                  State) ->
    GroupTeamInfo = ets:tab2list(gods_duel_group_team),
    Reply = {ok, GroupTeamInfo},
    continue(Reply, StateName, State);
handle_sync_event(_Event, _From, StateName, State) ->
    logger:error("未知消息 ~w", [_Event], gods_duel_mgr, 844),
    Reply = false,
    continue(Reply, StateName, State).

handle_info({update_member_info,
             TeamId,
             RoleId,
             Lev,
             Classes,
             Name,
             Sex},
            StateName, State) ->
    case StateName of
        prepare -> ok;
        sign -> ok;
        _ ->
            case ets:lookup(gods_duel_team_sign, TeamId) of
                [SignTeam = #gods_duel_team{lev = GroupId,
                                            members = Members}] ->
                    NewMembers = case lists:keyfind(RoleId,
                                                    #gods_duel_team_mate.id,
                                                    Members)
                                     of
                                     TeamMate = #gods_duel_team_mate{} ->
                                         NewTeamMate =
                                             TeamMate#gods_duel_team_mate{lev =
                                                                              Lev,
                                                                          classes
                                                                              =
                                                                              Classes,
                                                                          name =
                                                                              Name,
                                                                          sex =
                                                                              Sex},
                                         lists:keystore(RoleId,
                                                        #gods_duel_team_mate.id,
                                                        Members,
                                                        NewTeamMate);
                                     _ -> Members
                                 end,
                    NewSignTeam = SignTeam#gods_duel_team{members =
                                                              NewMembers},
                    save_sign_team(NewSignTeam),
                    case ets:lookup(gods_duel_group_team, GroupId) of
                        [{GroupId, TeamList}] ->
                            case lists:keyfind(TeamId,
                                               #gods_duel_team.id,
                                               TeamList)
                                of
                                GroupGodsTeam = #gods_duel_team{members =
                                                                    GroupMembers} ->
                                    NewGroupMembers = case lists:keyfind(RoleId,
                                                                         #gods_duel_team_mate.id,
                                                                         GroupMembers)
                                                          of
                                                          GroupTeamMate =
                                                              #gods_duel_team_mate{} ->
                                                              NewGroupTeamMate =
                                                                  GroupTeamMate#gods_duel_team_mate{lev
                                                                                                        =
                                                                                                        Lev,
                                                                                                    classes
                                                                                                        =
                                                                                                        Classes,
                                                                                                    name
                                                                                                        =
                                                                                                        Name,
                                                                                                    sex
                                                                                                        =
                                                                                                        Sex},
                                                              lists:keystore(RoleId,
                                                                             #gods_duel_team_mate.id,
                                                                             GroupMembers,
                                                                             NewGroupTeamMate);
                                                          _ -> GroupMembers
                                                      end,
                                    NewGodsTeam =
                                        GroupGodsTeam#gods_duel_team{members =
                                                                         NewGroupMembers},
                                    NewTeamList = lists:keystore(TeamId,
                                                                 #gods_duel_team.id,
                                                                 TeamList,
                                                                 NewGodsTeam),
                                    save_team_group([{GroupId, NewTeamList}]);
                                _ -> ok
                            end;
                        _ -> ok
                    end;
                _ -> lang:get("")
            end
    end,
    continue(StateName, State);
handle_info({set_season_id, SeasonId}, StateName,
            State) ->
    logger:info("设置诸神赛季ID:~w",
                [SeasonId],
                gods_duel_mgr,
                893),
    NewState = State#state{season_id = SeasonId},
    case ets:lookup(gods_duel_season_data,
                    gods_duel_season_data)
        of
        [SeasonData = #gods_duel_season_data{}] ->
            NewSeasonData =
                SeasonData#gods_duel_season_data{serial_id = SeasonId},
            update_season_data(NewSeasonData);
        _ -> ok
    end,
    case ets:lookup(gods_duel_season_info,
                    gods_duel_season_info)
        of
        [SeasonInfo = #gods_duel_season_info{}] ->
            NewSeasonInfo = SeasonInfo#gods_duel_season_info{id =
                                                                 SeasonId},
            update_season_info(NewSeasonInfo);
        _ -> ok
    end,
    ets:update_element(gods_duel_season_info,
                       gods_duel_season_info,
                       {#gods_duel_season_info.id, SeasonId}),
    big_world:cast(all,
                   gods_duel_agent,
                   info,
                   [{set_season_id, SeasonId}]),
    continue(StateName, NewState);
handle_info({team_sign, TeamInfo}, StateName, State) ->
    logger:debug("战队进行报名:~w",
                 [TeamInfo],
                 gods_duel_mgr,
                 921),
    save_sign_team(TeamInfo),
    continue(StateName, State);
handle_info({team_dismiss, TeamId}, StateName, State) ->
    logger:debug("解散队伍:~w", [TeamId], gods_duel_mgr, 927),
    remove_sign_team(TeamId),
    continue(StateName, State);
handle_info({gods_champion, #{team_id := TeamId}},
            StateName, State) ->
    logger:debug("==================",
                 [],
                 gods_duel_mgr,
                 932),
    SeasonId = gods_duel_common:get_season_id(),
    ChampionTeamInfo = case ets:lookup(gods_duel_team_sign,
                                       TeamId)
                           of
                           [#gods_duel_team{id = TeamId, name = TeamName,
                                            lev = TeamLev, members = Members,
                                            qualification = Qualification}] ->
                               Fun = fun (#gods_duel_team_mate{id =
                                                                   Id = {Rid,
                                                                         P,
                                                                         Z},
                                                               name = Name,
                                                               classes =
                                                                   Classes,
                                                               sex = Sex,
                                                               lev = Lev,
                                                               break_times =
                                                                   BKTimes},
                                          Temp) ->
                                             case big_world:call(P,
                                                                 Z,
                                                                 role_query,
                                                                 attr,
                                                                 [by_id,
                                                                  Rid,
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
                                                     [#gods_place_team_mate_statue{id
                                                                                       =
                                                                                       Id,
                                                                                   name
                                                                                       =
                                                                                       Name,
                                                                                   classes
                                                                                       =
                                                                                       Classes,
                                                                                   sex
                                                                                       =
                                                                                       Sex,
                                                                                   lev
                                                                                       =
                                                                                       Lev,
                                                                                   break_times
                                                                                       =
                                                                                       BKTimes,
                                                                                   looks
                                                                                       =
                                                                                       Looks1}
                                                      | Temp];
                                                 _ ->
                                                     case big_world:call(P,
                                                                         Z,
                                                                         robot_mgr,
                                                                         get_looks_role,
                                                                         [Id])
                                                         of
                                                         {ok, Looks}
                                                             when
                                                               is_list(Looks) ->
                                                             Looks1 =
                                                                 [{LooksType,
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
                                                                                               Id,
                                                                                           name
                                                                                               =
                                                                                               Name,
                                                                                           classes
                                                                                               =
                                                                                               Classes,
                                                                                           sex
                                                                                               =
                                                                                               Sex,
                                                                                           lev
                                                                                               =
                                                                                               Lev,
                                                                                           break_times
                                                                                               =
                                                                                               BKTimes,
                                                                                           looks
                                                                                               =
                                                                                               Looks1}
                                                              | Temp];
                                                         _Msg ->
                                                             logger:debug("取机器人数据出错:~w",
                                                                          [_Msg],
                                                                          gods_duel_mgr,
                                                                          947),
                                                             [#gods_place_team_mate_statue{id
                                                                                               =
                                                                                               Id,
                                                                                           name
                                                                                               =
                                                                                               Name,
                                                                                           classes
                                                                                               =
                                                                                               Classes,
                                                                                           sex
                                                                                               =
                                                                                               Sex,
                                                                                           lev
                                                                                               =
                                                                                               Lev,
                                                                                           break_times
                                                                                               =
                                                                                               BKTimes,
                                                                                           looks
                                                                                               =
                                                                                               []}
                                                              | Temp]
                                                     end
                                             end
                                     end,
                               NMembers = lists:foldl(Fun, [], Members),
                               #gods_place_team_statue{team_id =
                                                           TeamLev +
                                                               SeasonId * 10,
                                                       id = TeamId,
                                                       name = TeamName,
                                                       lev = TeamLev,
                                                       members = NMembers,
                                                       qualification =
                                                           Qualification,
                                                       serial_id = SeasonId,
                                                       team_leader = TeamId};
                           _ ->
                               logger:debug("没有该队伍信息", [], gods_duel_mgr, 955),
                               #gods_place_team_statue{}
                       end,
    logger:debug("==================~w",
                 [ChampionTeamInfo],
                 gods_duel_mgr,
                 958),
    gods_place_mgr:info({update, ChampionTeamInfo}),
    continue(StateName, State);
handle_info({combat_over,
             #{win := Win, loss := Loss, win_team := WTid,
               loss_team := LTid, match_id := {_MatchId, ZoneId}}},
            StateName,
            State = #state{season_time_info = TimeInfo}) ->
    SeasonStatus =
        gods_duel_common:get_state_order(StateName),
    case LTid of
        {_, _, _} ->
            LTeamName = case ets:lookup(gods_duel_team_sign, LTid)
                            of
                            [#gods_duel_team{name = _LName}] -> _LName;
                            _ -> lang:get("")
                        end,
            {MatchGroup, MatchIndex} = case
                                           gods_duel_common:get_match_index(SeasonStatus
                                                                                -
                                                                                1)
                                           of
                                           false -> {2, 7};
                                           _Else -> _Else
                                       end,
            NextWinnerMatchSeasonOrder =
                gods_duel_common:get_next_match_status(MatchGroup,
                                                       MatchIndex,
                                                       win),
            NextWinnerMatchTime = case
                                      lists:keyfind(NextWinnerMatchSeasonOrder,
                                                    1,
                                                    TimeInfo)
                                      of
                                      {_, _WStartTime, _WEndTime} ->
                                          {_WStartTime, _WEndTime};
                                      _ -> {0, 0}
                                  end,
            NextLosserMatchSeasonOrder =
                gods_duel_common:get_next_match_status(MatchGroup,
                                                       MatchIndex,
                                                       loss),
            NextLosserMatchTime = case
                                      lists:keyfind(NextLosserMatchSeasonOrder,
                                                    1,
                                                    TimeInfo)
                                      of
                                      {_, _LStartTime, _LEndTime} ->
                                          {_LStartTime, _LEndTime};
                                      _ -> {0, 0}
                                  end,
            big_world:cast(all,
                           gods_duel_agent,
                           info,
                           [{combat_over,
                             Win,
                             WTid,
                             #{loss_team_name => LTeamName,
                               next_match_time => NextWinnerMatchTime,
                               match_zone => ZoneId}}]),
            update_group_team_info(win, WTid, ZoneId),
            WTeamName = case ets:lookup(gods_duel_team_sign, WTid)
                            of
                            [#gods_duel_team{name = _WName}] -> _WName;
                            _ -> lang:get("")
                        end,
            update_group_team_info(loss, LTid, ZoneId),
            big_world:cast(all,
                           gods_duel_agent,
                           info,
                           [{combat_over,
                             Loss,
                             LTid,
                             #{win_team_name => WTeamName,
                               next_match_time => NextLosserMatchTime,
                               match_zone => ZoneId}}]);
        team_null ->
            {MatchGroup, MatchIndex} = case
                                           gods_duel_common:get_match_index(SeasonStatus
                                                                                -
                                                                                1)
                                           of
                                           false -> {2, 7};
                                           _Else -> _Else
                                       end,
            NextWinnerMatchSeasonOrder =
                gods_duel_common:get_next_match_status(MatchGroup,
                                                       MatchIndex,
                                                       win),
            NextWinnerMatchTime = case
                                      lists:keyfind(NextWinnerMatchSeasonOrder,
                                                    1,
                                                    TimeInfo)
                                      of
                                      {_, _WStartTime, _WEndTime} ->
                                          {_WStartTime, _WEndTime};
                                      _ -> {0, 0}
                                  end,
            big_world:cast(all,
                           gods_duel_agent,
                           info,
                           [{combat_over,
                             Win,
                             WTid,
                             #{next_match_time => NextWinnerMatchTime,
                               match_zone => ZoneId}}]),
            update_group_team_info(win, WTid, ZoneId),
            ok;
        _ ->
            logger:error("战斗结算错误:~w", [LTid], gods_duel_mgr, 1023),
            ok
    end,
    case gods_duel_common:get_match_index(SeasonStatus - 1)
        of
        {2, MatchRound} ->
            case gods_duel_common:is_vote_match(MatchRound) of
                true ->
                    big_world:cast(all,
                                   gods_duel_agent,
                                   info,
                                   [{vote_result, WTid, LTid, MatchRound}]),
                    ok;
                false -> ok
            end,
            WinTeamName = case ets:lookup(gods_duel_team_sign, WTid)
                              of
                              [#gods_duel_team{name = _WinName}] -> _WinName;
                              _ -> lang:get("")
                          end,
            {_, NoticePlatform, NoticeZoneId} = WTid,
            case MatchRound of
                1 when Win =:= win ->
                    NoticeMsg =
                        notice:format(lang:get("~ts几番角逐，终于战胜对手，成功晋级诸神32强{face_1, 18}"),
                                      [{string_2, 2, WinTeamName}]),
                    big_world:cast(NoticePlatform,
                                   NoticeZoneId,
                                   notice,
                                   cast,
                                   [all, 5, NoticeMsg]),
                    ok;
                2 when Win =:= win ->
                    NoticeMsg =
                        notice:format(lang:get("~ts一番鏖战，力克强敌，成功挺进诸神16强{face_1, 18}"),
                                      [{string_2, 2, WinTeamName}]),
                    big_world:cast(NoticePlatform,
                                   NoticeZoneId,
                                   notice,
                                   cast,
                                   [all, 5, NoticeMsg]),
                    ok;
                3 when Win =:= win ->
                    NoticeMsg =
                        notice:format(lang:get("~ts与对手激烈交锋，各施手段，终于取得胜利，晋级诸神8强{face_1, "
                                               "18}"),
                                      [{string_2, 2, WinTeamName}]),
                    big_world:cast(NoticePlatform,
                                   NoticeZoneId,
                                   notice,
                                   cast,
                                   [all, 5, NoticeMsg]),
                    ok;
                4 when Win =:= win ->
                    NoticeMsg =
                        notice:format(lang:get("~ts力克诸神强敌，终于脱颖而出，成功晋级诸神四强{face_1, 18}"),
                                      [{string_2, 2, WinTeamName}]),
                    big_world:cast(all, notice, cast, [all, 5, NoticeMsg]),
                    big_world:cast(all, notice, cast, [all, 11, NoticeMsg]),
                    ok;
                6 ->
                    Args = #{win_team_name => WinTeamName},
                    big_world:cast(all,
                                   gods_duel_agent,
                                   info,
                                   [{final_match_jubilation, 6, Args}]),
                    ok;
                5 when Win =:= win ->
                    NoticeMsg =
                        notice:format(lang:get("~ts历经血战，终于战胜对手进入决赛，谁将问鼎诸神冠军，我们拭目以待{face_1, "
                                               "18}{face_1, 18}"),
                                      [{string_2, 2, WinTeamName}]),
                    big_world:cast(all, notice, cast, [all, 5, NoticeMsg]),
                    big_world:cast(all, notice, cast, [all, 11, NoticeMsg]),
                    ok;
                7 ->
                    LossTeamName = case ets:lookup(gods_duel_team_sign,
                                                   LTid)
                                       of
                                       [#gods_duel_team{name = _LossName}] ->
                                           _LossName;
                                       _ -> lang:get("")
                                   end,
                    case Win of
                        win ->
                            NoticeMsg =
                                notice:format(lang:get("~ts终于战胜了强大的~ts，站在了诸神之巅，成为全服的王者{face_1, "
                                                       "18}"),
                                              [{string_2, 2, WinTeamName},
                                               {string_2, 2, LossTeamName}]),
                            big_world:cast(all,
                                           notice,
                                           cast,
                                           [all, 11, NoticeMsg]),
                            big_world:cast(all,
                                           notice,
                                           cast,
                                           [all, 5, NoticeMsg]);
                        _ -> ok
                    end,
                    MatchZone = case ets:lookup(gods_duel_team_sign, WTid)
                                    of
                                    [#gods_duel_team{lev = ZoneId}] -> ZoneId;
                                    _ -> 1
                                end,
                    Args = #{win_team_name => WinTeamName,
                             loss_team_name => LossTeamName,
                             match_zone => MatchZone},
                    big_world:cast(all,
                                   gods_duel_agent,
                                   info,
                                   [{final_match_jubilation, 7, Args}]),
                    ok;
                _ -> ok
            end;
        {1, _} ->
            case Win of
                win ->
                    WinTeamName = case ets:lookup(gods_duel_team_sign, WTid)
                                      of
                                      [#gods_duel_team{name = _WinName}] ->
                                          _WinName;
                                      _ -> lang:get("")
                                  end,
                    NoticeMsg =
                        notice:format(lang:get("~ts在~ts小组赛中，轻松击败对手，成功进入下一轮{face_1, 7}"),
                                      [{string_2, 2, WinTeamName},
                                       {string_2, 1, lang:get("诸神之战")}]),
                    {_, NoticePlatform, NoticeZoneId} = WTid,
                    big_world:cast(NoticePlatform,
                                   NoticeZoneId,
                                   notice,
                                   cast,
                                   [all, 5, NoticeMsg]),
                    ok;
                _ -> ok
            end;
        _ -> ok
    end,
    continue(StateName, State);
handle_info(statistics, StateName, State = #state{}) ->
    Qualifition64Teams = statistics_group_team_score(),
    save_qua64_team(Qualifition64Teams),
    big_world:cast(all,
                   gods_duel_agent,
                   info,
                   [{qualification_64_result, Qualifition64Teams}]),
    continue(StateName, State);
handle_info({team_rise_jubilation, SeasonStatus},
            StateName, State) ->
    case SeasonStatus of
        25 ->
            Qua4Fun = fun ({ZoneId, GroupTeamList}, Rtn) ->
                              Qua4TeamList = lists:filter(fun
                                                              (#gods_duel_team{qualification
                                                                                   =
                                                                                   Qua}) ->
                                                                  Qua =:= 7
                                                          end,
                                                          GroupTeamList),
                              [{ZoneId, Qua4TeamList} | Rtn]
                      end,
            AllQuaTeamList = ets:foldl(Qua4Fun,
                                       [],
                                       gods_duel_group_team),
            big_world:cast(all,
                           gods_duel_agent,
                           info,
                           [{team_rise_jubilation, AllQuaTeamList}]),
            ok;
        _ -> ok
    end,
    continue(StateName, State);
handle_info(reload, StateName, State) ->
    OldSeasonId = gods_duel_common:get_season_id(),
    case gods_duel_common:get_new_season_id(OldSeasonId) of
        CfgSeasonId
            when is_integer(CfgSeasonId) andalso
                     CfgSeasonId > OldSeasonId ->
            info(reset),
            continue(StateName, State);
        CfgSeasonId
            when is_integer(CfgSeasonId) andalso
                     CfgSeasonId =:= OldSeasonId ->
            case ets:lookup(gods_duel_season_info,
                            gods_duel_season_info)
                of
                [SeasonInfo = #gods_duel_season_info{}] ->
                    {_StateOrder, TimeOut, NewStateName, TimeCfg} =
                        get_state(SeasonInfo),
                    logger:debug("重新加载配置后赛季信息:~w",
                                 [{_StateOrder,
                                   TimeOut,
                                   NewStateName,
                                   TimeCfg}],
                                 gods_duel_mgr,
                                 1157),
                    NewSeasonInfo =
                        SeasonInfo#gods_duel_season_info{season_time_info =
                                                             TimeCfg},
                    update_season_info(NewSeasonInfo),
                    case StateName of
                        sign ->
                            Hour = date:hour(),
                            RankTimeOut = date:next_diff(Hour + 1, 0, 0),
                            RankRef = erlang:send_after(RankTimeOut * 1000,
                                                        self(),
                                                        rank_cleanness),
                            put(rank_ref, RankRef);
                        _ -> ok
                    end,
                    Ts = now(),
                    NewState = State#state{ts = Ts, timeout = TimeOut,
                                           season_time_info = TimeCfg,
                                           season_id = CfgSeasonId},
                    logger:info("启动诸神之战赛季管理进程完成...",
                                [],
                                gods_duel_mgr,
                                1179),
                    continue(NewStateName, NewState);
                _ ->
                    info(reset),
                    logger:info("启动诸神之战赛季管理进程完成...",
                                [],
                                gods_duel_mgr,
                                1183),
                    continue(StateName, State)
            end;
        _Err ->
            logger:error("重新加载配置失败，旧赛季:~w, 赛季配置:~w",
                         [OldSeasonId, _Err],
                         gods_duel_mgr,
                         1187),
            continue(StateName, State)
    end;
handle_info(reload_with_out_check, StateName, State) ->
    logger:debug("进行时间配置重载,重载前:~w",
                 [State],
                 gods_duel_mgr,
                 1192),
    TimeCfg = gods_duel_common:get_time_config(1, 32, []),
    {NewStateName, NewState} = case catch
                                        ets:lookup(gods_duel_season_info,
                                                   gods_duel_season_info)
                                   of
                                   [SeasonInfo = #gods_duel_season_info{}] ->
                                       NewSeasonInfo =
                                           SeasonInfo#gods_duel_season_info{season_time_info
                                                                                =
                                                                                TimeCfg},
                                       update_season_info(NewSeasonInfo),
                                       ReloadState = State#state{ts = now(),
                                                                 timeout =
                                                                     infinity,
                                                                 season_time_info
                                                                     = TimeCfg},
                                       {StateName, ReloadState};
                                   _ -> {StateName, State}
                               end,
    logger:debug("进行时间配置重载,重载前:~w",
                 [NewState],
                 gods_duel_mgr,
                 1208),
    continue(NewStateName, NewState);
handle_info(fetch_group, StateName, State) ->
    SeedTeamList = get_group_info(plat_zone),
    GroupRankList = get_group_info(group),
    logger:debug("种子队伍信息:~w",
                 [SeedTeamList],
                 gods_duel_mgr,
                 1219),
    GroupFun = fun ({Group, RankList}, Rtn) ->
                       SeedTeams = case lists:keyfind(Group, 1, SeedTeamList)
                                       of
                                       {_, _SeedTeamList} -> _SeedTeamList;
                                       _ -> []
                                   end,
                       FilterSeedTeamFun = fun (#gods_duel_team{id = Id},
                                                {RtnList, CheckList}) ->
                                                   case lists:keymember(Id,
                                                                        #gods_duel_team.id,
                                                                        CheckList)
                                                       of
                                                       true ->
                                                           NewRtn =
                                                               lists:keydelete(Id,
                                                                               #gods_duel_team.id,
                                                                               RtnList),
                                                           {NewRtn, CheckList};
                                                       false ->
                                                           {RtnList, CheckList}
                                                   end
                                           end,
                       {NewRankList, _} = lists:foldl(FilterSeedTeamFun,
                                                      {RankList, SeedTeams},
                                                      RankList),
                       NormalTeamList =
                           lists:sublist(util:keys_sort([#gods_duel_team.fight_capacity],
                                                        NewRankList),
                                         128 - length(SeedTeams)),
                       [{Group, NormalTeamList} | Rtn];
                   (_, Rtn) -> Rtn
               end,
    NormalTeamList = lists:foldl(GroupFun,
                                 [],
                                 GroupRankList),
    ResultTeamList = combine_normal_seed(SeedTeamList,
                                         NormalTeamList),
    TeamGroupInfo = divide_into_group(ResultTeamList, []),
    logger:debug("===============:~w",
                 [TeamGroupInfo],
                 gods_duel_mgr,
                 1251),
    save_team_group(TeamGroupInfo),
    big_world:cast(all,
                   gods_duel_agent,
                   info,
                   [{group_result, TeamGroupInfo}]),
    continue(StateName, State);
handle_info({repare_group_match_4,
             #gods_duel_team{id = TeamId, lev = ZoneId,
                             win_times = WinTimes, loss_times = LossTimes}},
            StateName, State) ->
    logger:debug("收到修复同步：~w",
                 [TeamId],
                 gods_duel_mgr,
                 1262),
    case catch ets:lookup(gods_duel_group_team, ZoneId) of
        [{_, GroupTeamList}] ->
            case lists:keyfind(TeamId,
                               #gods_duel_team.id,
                               GroupTeamList)
                of
                TeamInfo = #gods_duel_team{} ->
                    NewTeamInfo = TeamInfo#gods_duel_team{win_times =
                                                              WinTimes,
                                                          loss_times =
                                                              LossTimes},
                    NewGroupTeamList = lists:keystore(TeamId,
                                                      #gods_duel_team.id,
                                                      GroupTeamList,
                                                      NewTeamInfo),
                    save_team_group([{ZoneId, NewGroupTeamList}]);
                _ -> ok
            end;
        _ -> ok
    end,
    continue(StateName, State);
handle_info(repare_dispense, StateName, State) ->
    Data = ets:foldl(fun ({ZoneId, GroupTeamList}, Rtn) ->
                             [{ZoneId, GroupTeamList} | Rtn]
                     end,
                     [],
                     gods_duel_group_team),
    big_world:cast(all,
                   gods_duel_agent,
                   info,
                   [{repare_dispense, Data}]),
    continue(StateName, State);
handle_info({repair_group_data, Data}, StateName,
            State) ->
    save_team_group(Data),
    Qualifition64Teams = statistics_group_team_score(),
    save_qua64_team(Qualifition64Teams),
    continue(StateName, State);
handle_info({repare_group_match_1,
             #gods_duel_team{id = TeamId, lev = ZoneId,
                             loss_times = LossTimes, win_times = WinTimes}},
            StateName, State) ->
    case ets:lookup(gods_duel_group_team, ZoneId) of
        [{_, GroupTeamList}] ->
            case lists:keyfind(TeamId,
                               #gods_duel_team.id,
                               GroupTeamList)
                of
                Team = #gods_duel_team{} ->
                    NewTeam = Team#gods_duel_team{loss_times = LossTimes,
                                                  win_times = WinTimes},
                    NewGroupTeamList = lists:keyreplace(TeamId,
                                                        #gods_duel_team.id,
                                                        GroupTeamList,
                                                        NewTeam),
                    save_team_group([{ZoneId, NewGroupTeamList}]);
                _ -> ok
            end;
        _ -> ok
    end,
    continue(StateName, State);
handle_info({repare_final_match, Data}, StateName,
            State) ->
    Fun = fun (#gods_duel_team{id = TeamId, lev = ZoneId,
                               qualification = Qua, members = Members}) ->
                  case ets:lookup(gods_duel_group_team, ZoneId) of
                      [{_, GroupTeamList}] ->
                          case lists:keyfind(TeamId,
                                             #gods_duel_team.id,
                                             GroupTeamList)
                              of
                              Team = #gods_duel_team{} ->
                                  NewTeam = case TeamId of
                                                {4882, "ios", 36} ->
                                                    Team#gods_duel_team{qualification
                                                                            =
                                                                            Qua,
                                                                        members
                                                                            =
                                                                            Members};
                                                {6983, "mix", 34} ->
                                                    Team#gods_duel_team{qualification
                                                                            =
                                                                            Qua,
                                                                        members
                                                                            =
                                                                            Members};
                                                _ ->
                                                    Team#gods_duel_team{members
                                                                            =
                                                                            Members}
                                            end,
                                  NewGroupTeamList = lists:keystore(TeamId,
                                                                    #gods_duel_team.id,
                                                                    GroupTeamList,
                                                                    NewTeam),
                                  save_team_group([{ZoneId, NewGroupTeamList}]);
                              _ -> ok
                          end;
                      _ -> ok
                  end;
              (_) -> ok
          end,
    lists:foreach(Fun, Data),
    continue(StateName, State);
handle_info({goto_state, StateName}, _StateName,
            State) ->
    continue(StateName,
             State#state{ts = now(), timeout = 0});
handle_info(reset, _StateName, _State) ->
    ets:delete_all_objects(gods_duel_team_sign),
    dets:delete_all_objects(gods_duel_team_sign),
    ets:delete_all_objects(gods_duel_group_team),
    dets:delete_all_objects(gods_duel_group_team),
    NewSeasonId = gods_duel_common:get_new_season_id(),
    {StateOrder, TimeOut, StateName, TimeCfg} =
        get_state(#gods_duel_season_info{id = NewSeasonId}),
    logger:debug("重置初始化:~w",
                 [{StateOrder, TimeOut, StateName, TimeCfg}],
                 gods_duel_mgr,
                 1363),
    NewSeasonInfo = #gods_duel_season_info{id = NewSeasonId,
                                           status = StateOrder,
                                           season_time_info = TimeCfg},
    update_season_info(NewSeasonInfo),
    case ets:lookup(gods_duel_season_data,
                    gods_duel_season_data)
        of
        [SeasonData = #gods_duel_season_data{}] ->
            NewSeasonData =
                SeasonData#gods_duel_season_data{serial_id =
                                                     NewSeasonId},
            update_season_data(NewSeasonData);
        _ ->
            update_season_data(#gods_duel_season_data{serial_id =
                                                          NewSeasonId})
    end,
    big_world:cast(all,
                   gods_duel_agent,
                   info,
                   [{reset, true}]),
    State = #state{ts = now(), timeout = TimeOut,
                   season_time_info = TimeCfg, season_id = NewSeasonId},
    logger:info("重置诸神之战赛季完成...", [], gods_duel_mgr, 1386),
    continue(StateName, State);
handle_info(rank_cleanness, StateName, State) ->
    case get(rank_ref) of
        RankRef when is_reference(RankRef) ->
            erlang:cancel_timer(RankRef);
        _ -> skip
    end,
    case StateName of
        sign ->
            Hour = date:hour(),
            RankTimeOut = date:next_diff(Hour + 1, 0, 0),
            NewRankRef = erlang:send_after(RankTimeOut * 1000,
                                           self(),
                                           rank_cleanness),
            put(rank_ref, NewRankRef),
            update_threshold();
        notice -> update_threshold();
        _ -> ok
    end,
    continue(StateName, State);
handle_info({sign_team, TeamList}, StateName, State) ->
    case StateName of
        sign ->
            lists:foreach(fun save_sign_team/1, TeamList),
            ok;
        notice ->
            lists:foreach(fun save_sign_team/1, TeamList),
            ok;
        _ -> ok
    end,
    continue(StateName, State);
handle_info(prompt_join, StateName,
            State = #state{season_time_info = TimeInfo}) ->
    SeasonStatus =
        gods_duel_common:get_state_order(StateName),
    StartFlag = case SeasonStatus of
                    18 -> true;
                    20 -> true;
                    22 -> true;
                    24 -> true;
                    26 -> true;
                    28 -> true;
                    30 -> true;
                    _ -> false
                end,
    case StartFlag of
        true ->
            start_prompt_ref(),
            case lists:keyfind(SeasonStatus + 1, 1, TimeInfo) of
                {_, Begin, _End} ->
                    {_, {Hour, Min, _}} = date:seconds_to_datetime(Begin),
                    case date:is_today(Begin) andalso Hour >= 5 of
                        true ->
                            case gods_duel_common:get_match_index(SeasonStatus)
                                of
                                {2, MatchRound} ->
                                    MatchName =
                                        gods_duel_common:get_final_match_name(MatchRound),
                                    MatchQua =
                                        gods_duel_common:get_final_match_qua(MatchRound),
                                    TeamFun = fun (#gods_duel_team{name =
                                                                       TeamName,
                                                                   members =
                                                                       Members,
                                                                   qualification
                                                                       = Qua})
                                                      when Qua =:= MatchQua ->
                                                      MailContent =
                                                          notice:format(lang:get("您所在的战队~ts将参加于今天~ts举行的诸神之战淘汰赛~ts，请提前做好准备，祝您在比赛"
                                                                                 "中取得好成绩{face_1,18}"),
                                                                        [{string_2,
                                                                          1,
                                                                          TeamName},
                                                                         {string_2,
                                                                          5,
                                                                          util:flist("~2.10.0w:~2.10.0w",
                                                                                     [Hour,
                                                                                      Min])},
                                                                         {string_2,
                                                                          1,
                                                                          MatchName}]),
                                                      Title =
                                                          lang:get("诸神参赛提醒"),
                                                      lists:foreach(fun
                                                                        (#gods_duel_team_mate{id
                                                                                                  =
                                                                                                  Id =
                                                                                                      {_,
                                                                                                       Plat,
                                                                                                       Zone}}) ->
                                                                            big_world:cast(Plat,
                                                                                           Zone,
                                                                                           mail,
                                                                                           send,
                                                                                           [Id,
                                                                                            Title,
                                                                                            MailContent])
                                                                    end,
                                                                    Members),
                                                      ok;
                                                  (_) -> ok
                                              end,
                                    GroupFun = fun ({_ZoneId, TeamGroupList},
                                                    ok) ->
                                                       lists:foreach(TeamFun,
                                                                     TeamGroupList),
                                                       ok
                                               end,
                                    ets:foldl(GroupFun,
                                              ok,
                                              gods_duel_group_team);
                                _ -> ok
                            end,
                            ok;
                        false -> ok
                    end;
                _ -> ok
            end;
        false -> ok
    end,
    continue(StateName, State);
handle_info(mail_prompt_join, StateName,
            State = #state{ts = TS, timeout = TimeOut}) ->
    SeasonStatus =
        gods_duel_common:get_state_order(StateName),
    StartFlag = case SeasonStatus of
                    0 -> false;
                    1 -> false;
                    2 -> false;
                    31 -> false;
                    32 -> false;
                    _ -> true
                end,
    case StartFlag of
        true ->
            case gods_duel_common:get_match_index(SeasonStatus) of
                {_, MatchRound} ->
                    MatchQua =
                        gods_duel_common:get_final_match_qua(MatchRound),
                    {M, S, _} = TS,
                    {{_, Month, Day}, {Hour, Min, _}} =
                        date:seconds_to_datetime(round(TimeOut / 1000) +
                                                     M * 1000000
                                                     + S),
                    TimeOutStr1 = lists:concat(["(",
                                                Month,
                                                lang:get("月"),
                                                Day,
                                                lang:get("日"),
                                                ")"]),
                    TimeOutStr2 = lists:concat([Hour, ":", Min]),
                    TeamFun = fun (#gods_duel_team{members = Members,
                                                   qualification = Qua})
                                      when Qua =:= MatchQua ->
                                      MailContent =
                                          notice:format(lang:get("勇敢的诸神参赛者您好，诸神之战下一场比赛将于今日~ts~ts开始，快组织好战队成员准备迎战吧！"),
                                                        [{string_2,
                                                          1,
                                                          TimeOutStr1},
                                                         {string_2,
                                                          5,
                                                          TimeOutStr2}]),
                                      Title = lang:get("诸神参赛提醒"),
                                      lists:foreach(fun (#gods_duel_team_mate{id
                                                                                  =
                                                                                  Id =
                                                                                      {_,
                                                                                       Plat,
                                                                                       Zone}}) ->
                                                            big_world:cast(Plat,
                                                                           Zone,
                                                                           mail,
                                                                           send,
                                                                           [Id,
                                                                            Title,
                                                                            MailContent])
                                                    end,
                                                    Members),
                                      ok;
                                  (_) -> ok
                              end,
                    GroupFun = fun ({_ZoneId, TeamGroupList}, ok) ->
                                       lists:foreach(TeamFun, TeamGroupList),
                                       ok
                               end,
                    ets:foldl(GroupFun, ok, gods_duel_group_team);
                _ -> ok
            end;
        false -> ok
    end,
    continue(StateName, State);
handle_info({update_team_members, TeamList}, StateName,
            State) ->
    Fun = fun (#gods_duel_team{id = TeamId,
                               members = Members, lev = ZoneId}) ->
                  case ets:lookup(gods_duel_group_team, ZoneId) of
                      [{_, GroupTeamList}] ->
                          case lists:keyfind(TeamId,
                                             #gods_duel_team.id,
                                             GroupTeamList)
                              of
                              GroupTeam = #gods_duel_team{} ->
                                  NewGroupTeam =
                                      GroupTeam#gods_duel_team{members =
                                                                   Members},
                                  NewGroupTeamList = lists:keystore(TeamId,
                                                                    #gods_duel_team.id,
                                                                    GroupTeamList,
                                                                    NewGroupTeam),
                                  logger:debug("更新队伍:~w",
                                               [TeamId],
                                               gods_duel_mgr,
                                               1533),
                                  save_team_group([{ZoneId, NewGroupTeamList}]);
                              _ -> ok
                          end;
                      _ -> ok
                  end;
              (_) -> ok
          end,
    lists:foreach(Fun, TeamList),
    continue(StateName, State);
handle_info(notice_sign_mail, StateName, State) ->
    big_world:cast(all,
                   gods_duel_agent,
                   info,
                   [notice_sign_mail]),
    continue(StateName, State);
handle_info({sync_voting, MatchRound, Voteing},
            StateName, State) ->
    acc_voting(Voteing, MatchRound),
    continue(StateName, State);
handle_info(vote_reset, StateName, State) ->
    ets:delete_all_objects(gods_duel_poll),
    dets:delete_all_objects(gods_duel_poll),
    big_world:cast(all,
                   gods_duel_agent,
                   info,
                   [vote_reset]),
    continue(StateName, State);
handle_info(end_season, _StateName, State) ->
    big_world:cast(all,
                   gods_duel_agent,
                   info,
                   [end_season]),
    continue(idle, State#state{timeout = infinity});
handle_info({set_vote_ratio, Ratio}, StateName,
            State = #state{}) ->
    SeasonStatus =
        gods_duel_common:get_state_order(StateName),
    case gods_duel_common:get_match_index(SeasonStatus) of
        {_, MatchRound} ->
            Fun = fun (Poll = #gods_duel_poll{id = Id,
                                              match_round = PollMatchRound},
                       DoneList)
                          when PollMatchRound =:= MatchRound ->
                          case lists:member(Id, DoneList) of
                              true -> DoneList;
                              false ->
                                  case
                                      gods_duel_match:get_target_team_id(SeasonStatus,
                                                                         Id)
                                      of
                                      {true, TargetTeamId} ->
                                          case ets:lookup(gods_duel_poll,
                                                          TargetTeamId)
                                              of
                                              [TargetPoll =
                                                   #gods_duel_poll{match_round =
                                                                       TargetPollMatchRound}]
                                                  when TargetPollMatchRound =:=
                                                           MatchRound ->
                                                  logger:debug("=========:~w",
                                                               [{Poll, Ratio}],
                                                               gods_duel_mgr,
                                                               1584),
                                                  NewPoll =
                                                      Poll#gods_duel_poll{voted_cnt
                                                                              =
                                                                              Ratio
                                                                                  *
                                                                                  100},
                                                  sync_poll(NewPoll),
                                                  update_poll(NewPoll),
                                                  NewTargetPoll =
                                                      TargetPoll#gods_duel_poll{voted_cnt
                                                                                    =
                                                                                    max(0,
                                                                                        100
                                                                                            -
                                                                                            Ratio)
                                                                                        *
                                                                                        100},
                                                  sync_poll(NewTargetPoll),
                                                  update_poll(NewTargetPoll),
                                                  [Id, TargetTeamId | DoneList];
                                              _ ->
                                                  NewPoll =
                                                      Poll#gods_duel_poll{voted_cnt
                                                                              =
                                                                              Ratio
                                                                                  *
                                                                                  100},
                                                  sync_poll(NewPoll),
                                                  update_poll(NewPoll),
                                                  NewTargetPoll =
                                                      Poll#gods_duel_poll{id =
                                                                              TargetTeamId,
                                                                          match_round
                                                                              =
                                                                              MatchRound,
                                                                          voted_cnt
                                                                              =
                                                                              max(0,
                                                                                  100
                                                                                      -
                                                                                      Ratio)
                                                                                  *
                                                                                  100},
                                                  sync_poll(NewTargetPoll),
                                                  update_poll(NewTargetPoll),
                                                  [Id, TargetTeamId | DoneList]
                                          end;
                                      false ->
                                          NewPoll =
                                              Poll#gods_duel_poll{voted_cnt =
                                                                      Ratio *
                                                                          100},
                                          update_poll(NewPoll),
                                          sync_poll(NewPoll),
                                          [Id | DoneList]
                                  end
                          end;
                      (_, RtnList) -> RtnList
                  end,
            ets:foldl(Fun, [], gods_duel_poll);
        _ -> ok
    end,
    continue(StateName, State);
handle_info(print, StateName, State) ->
    logger:info("赛程状态[~w],赛程信息[~w]",
                [StateName, State],
                gods_duel_mgr,
                1617),
    continue(StateName, State);
handle_info({update_gods_duel_profile, P}, StateName,
            State) ->
    update_gods_duel_profile(P),
    continue(StateName, State);
handle_info(update_rank, StateName, State) ->
    case get(profile_rank_ref) of
        ProfileRankRef when is_reference(ProfileRankRef) ->
            erlang:cancel_timer(ProfileRankRef);
        _ -> skip
    end,
    SeasonStatus =
        gods_duel_common:get_state_order(StateName),
    StartFlag = case SeasonStatus of
                    0 -> false;
                    1 -> false;
                    2 -> false;
                    32 -> false;
                    _ -> true
                end,
    case StartFlag of
        true ->
            update_rank(),
            ProfileRankRef1 = erlang:send_after(600000,
                                                self(),
                                                update_rank),
            put(profile_rank_ref, ProfileRankRef1);
        false -> ignore
    end,
    continue(StateName, State);
handle_info(update_team_rank, StateName, State) ->
    gods_duel_rank:update_team_rank(),
    continue(StateName, State);
handle_info(_Info, StateName, State) ->
    logger:error("未知消息 ~w", [_Info], gods_duel_mgr, 1653),
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

get_state(#gods_duel_season_info{id = SeasonID}) ->
    TimeCfg = gods_duel_common:get_time_config(SeasonID,
                                               1,
                                               34,
                                               []),
    {StateOrder, TimeOut} = get_cur_state(TimeCfg),
    {StateOrder,
     TimeOut,
     get_state_name(StateOrder),
     TimeCfg}.

get_cur_state(TimeCfg) ->
    get_cur_state(TimeCfg, {0, date:next_diff(0) * 1000}).

get_cur_state([], Result) -> Result;
get_cur_state([{StateOrder, StartTime, EndTime} | T],
              Result) ->
    Now = date:unixtime(),
    case StartTime =< Now andalso Now < EndTime of
        true -> {StateOrder, (EndTime - Now) * 1000};
        _ -> get_cur_state(T, Result)
    end;
get_cur_state([_ | T], Result) ->
    get_cur_state(T, Result).

get_state_name(StateOrder) ->
    case StateOrder of
        0 -> idle;
        1 -> prepare;
        2 -> sign;
        3 -> notice;
        4 -> match_256_idle_1;
        5 -> match_256_1;
        6 -> match_256_idle_2;
        7 -> match_256_2;
        8 -> match_256_idle_3;
        9 -> match_256_3;
        10 -> match_256_idle_4;
        11 -> match_256_4;
        12 -> match_256_idle_5;
        13 -> match_256_5;
        14 -> match_256_idle_6;
        15 -> match_256_6;
        16 -> match_256_idle_7;
        17 -> match_256_7;
        18 -> match_idle_32;
        19 -> match_32;
        20 -> match_idle_16;
        21 -> match_16;
        22 -> match_idle_8;
        23 -> match_8;
        24 -> match_idle_4;
        25 -> match_4;
        26 -> match_idle_half;
        27 -> match_half;
        28 -> match_idle_third;
        29 -> match_third;
        30 -> match_idle_champion;
        31 -> match_champion;
        32 -> reward;
        _ -> idle
    end.

get_current_season_id() ->
    case ets:lookup(gods_duel_season_info,
                    gods_duel_season_info)
        of
        [#gods_duel_season_info{id = SeasonId}] ->
            {ok, SeasonId};
        _ -> false
    end.

update_season_data(SeasonData) ->
    ets:insert(gods_duel_season_data, SeasonData),
    dets:insert(gods_duel_season_data, SeasonData),
    ok.

update_season_info(SeasonInfo =
                       #gods_duel_season_info{}) ->
    ets:insert(gods_duel_season_info, SeasonInfo),
    dets:insert(gods_duel_season_info, SeasonInfo),
    ok.

update_season_status(Status) ->
    case catch ets:lookup(gods_duel_season_info,
                          gods_duel_season_info)
        of
        [SeasonInfo = #gods_duel_season_info{}] ->
            NewSeasonInfo = SeasonInfo#gods_duel_season_info{status
                                                                 = Status},
            update_season_info(NewSeasonInfo);
        _ -> ok
    end.

save_sign_team(TeamInfo) ->
    ets:insert(gods_duel_team_sign, TeamInfo),
    dets:insert(gods_duel_team_sign, TeamInfo),
    ok.

remove_sign_team(TeamId) ->
    ets:delete(gods_duel_team_sign, TeamId),
    dets:delete(gods_duel_team_sign, TeamId),
    ok.

save_team_group([]) -> ok;
save_team_group([{ZoneId, TeamGroupList} | Rest]) ->
    ets:insert(gods_duel_group_team,
               {ZoneId, TeamGroupList}),
    dets:insert(gods_duel_group_team,
                {ZoneId, TeamGroupList}),
    save_team_group(Rest).

update_poll(Poll) ->
    ets:insert(gods_duel_poll, Poll),
    dets:insert(gods_duel_poll, Poll),
    ok.

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

update_group_team_info(WinOrLoss, TeamId, ZoneId) ->
    case catch ets:lookup(gods_duel_group_team, ZoneId) of
        [{_, GroupTeamList}] ->
            case lists:keyfind(TeamId,
                               #gods_duel_team.id,
                               GroupTeamList)
                of
                TeamInfo = #gods_duel_team{} ->
                    NewTeamInfo = update_group_match_combat(TeamInfo,
                                                            WinOrLoss),
                    NewGroupTeamList = lists:keystore(TeamId,
                                                      #gods_duel_team.id,
                                                      GroupTeamList,
                                                      NewTeamInfo),
                    save_team_group([{ZoneId, NewGroupTeamList}]);
                _ -> ok
            end;
        _ -> ok
    end.

update_gods_duel_profile(Profile) ->
    ets:insert(gods_duel_profile, Profile),
    dets:insert(gods_duel_profile, Profile).

call(Mod, Event) ->
    try gen_fsm:sync_send_all_state_event(Mod, Event) catch
        _Type:_Reason ->
            logger:debug("诸神之战调用失败 Type:~w Reason: ~w",
                         [Mod, Event],
                         gods_duel_mgr,
                         1876),
            {error, timeout}
    end.

cast_status(StateName) ->
    Status = gods_duel_common:get_state_order(StateName),
    big_world:cast(all,
                   gods_duel_agent,
                   update_status,
                   [Status]).

get_group_info(plat_zone) ->
    GroupList1 = get_group_info(group),
    PlatFun = fun (TeamInfo = #gods_duel_team{id =
                                                  {_, Plat, Zone}},
                   Rtn) ->
                      GroupNum = c_mirror:get_zone_mapping(Plat, Zone),
                      case lists:keyfind(GroupNum, 1, Rtn) of
                          {_, BriefList} ->
                              NewBriefList = [TeamInfo | BriefList],
                              lists:keystore(GroupNum,
                                             1,
                                             Rtn,
                                             {GroupNum, NewBriefList});
                          _ ->
                              NewBriefList = [TeamInfo],
                              lists:keystore(GroupNum,
                                             1,
                                             Rtn,
                                             {GroupNum, NewBriefList})
                      end;
                  (_E, Rtn) -> Rtn
              end,
    RankFun = fun ({GroupNum, RankList}, Rtn) ->
                      NewRankList = lists:foldl(PlatFun, [], RankList),
                      [{GroupNum, NewRankList} | Rtn]
              end,
    GroupList2 = lists:foldl(RankFun, [], GroupList1),
    SortFun1 = fun ({_PlatZone, RankList}, Rtn) ->
                       NewRankList =
                           lists:sublist(util:keys_sort([#gods_duel_team.fight_capacity],
                                                        RankList),
                                         1),
                       NewRankList ++ Rtn
               end,
    SortFun = fun ({Group, PlatRankList}, Rtn) ->
                      SeedTeam = lists:foldl(SortFun1, [], PlatRankList),
                      [{Group, SeedTeam} | Rtn]
              end,
    lists:foldl(SortFun, [], GroupList2);
get_group_info(group) ->
    Fun = fun (TeamInfo = #gods_duel_team{lev = GroupNum,
                                          member_num = Num},
               Rtn)
                  when Num >= 5 ->
                  case lists:keyfind(GroupNum, 1, Rtn) of
                      {_, BriefList} ->
                          NewBriefList = [TeamInfo | BriefList],
                          lists:keystore(GroupNum,
                                         1,
                                         Rtn,
                                         {GroupNum, NewBriefList});
                      _ ->
                          NewBriefList = [TeamInfo],
                          lists:keystore(GroupNum,
                                         1,
                                         Rtn,
                                         {GroupNum, NewBriefList})
                  end;
              (_, Rtn) -> Rtn
          end,
    GroupList = ets:foldl(Fun, [], gods_duel_team_sign),
    SortFun = fun ({Group, RankList}, Rtn) ->
                      NewRankList =
                          lists:sublist(util:keys_sort([#gods_duel_team.fight_capacity],
                                                       RankList),
                                        256),
                      [{Group, NewRankList} | Rtn]
              end,
    lists:foldl(SortFun, [], GroupList).

get_time_out(StateOrder, TimeInfo) ->
    case lists:keyfind(StateOrder, 1, TimeInfo) of
        {_, _Begin, End} ->
            Now = date:unixtime(),
            (End - Now) * 1000;
        _ -> infinity
    end.

combine_normal_seed([], NormalTeamList) ->
    NormalTeamList;
combine_normal_seed([{GroupNum, GSTeamList} | Rest],
                    NormalTeamList) ->
    case lists:keyfind(GroupNum, 1, NormalTeamList) of
        {_, GNTeamList} ->
            NewTeamList = GSTeamList ++ GNTeamList,
            NewGroupTeamList = lists:keystore(GroupNum,
                                              1,
                                              NormalTeamList,
                                              {GroupNum, NewTeamList}),
            combine_normal_seed(Rest, NewGroupTeamList);
        _ ->
            NewGroupTeamList = [{GroupNum, GSTeamList}
                                | NormalTeamList],
            combine_normal_seed(Rest, NewGroupTeamList)
    end.

divide_into_group([], TeamGroupInfo) -> TeamGroupInfo;
divide_into_group([{ZoneId, TeamList} | Rest],
                  TeamGroupInfo) ->
    SortTeamList =
        util:keys_sort([#gods_duel_team.fight_capacity],
                       TeamList),
    IndexList = lists:foldl(fun (N, RtnIndexList) ->
                                    L = lists:seq(1 + (N - 1) * 32, N * 32),
                                    RtnIndexList ++ L
                            end,
                            [],
                            lists:seq(1, 8)),
    Fun = fun (TeamInfo = #gods_duel_team{},
               {[N | Left], RtnList}) ->
                  {Left,
                   [TeamInfo#gods_duel_team{team_group_256 = N,
                                            qualification = 2}
                    | RtnList]}
          end,
    {_, TeamGroupList} = lists:foldl(Fun,
                                     {IndexList, []},
                                     SortTeamList),
    divide_into_group(Rest,
                      [{ZoneId, TeamGroupList} | TeamGroupInfo]).

calc_threshold_info() ->
    GroupList = get_group_info(group),
    ThresholdFun = fun ({Group, RankList}, Rtn) ->
                           case length(RankList) >= 128 of
                               true ->
                                   MinFc = case lists:reverse(RankList) of
                                               [#gods_duel_team{fight_capacity =
                                                                    Fc}
                                                | _] ->
                                                   Fc;
                                               _ -> 0
                                           end,
                                   [{Group, MinFc} | Rtn];
                               false -> [{Group, 0} | Rtn]
                           end
                   end,
    lists:foldl(ThresholdFun, [], GroupList).

update_threshold() ->
    ThresholdInfo = calc_threshold_info(),
    big_world:cast(all,
                   gods_duel_agent,
                   info,
                   [{update_threshold, ThresholdInfo}]).

update_group_match_combat(TeamInfo =
                              #gods_duel_team{qualification = Qua,
                                              win_times = WinTimes,
                                              loss_times = LossTimes},
                          WinOrLoss)
    when Qua =:= 1 orelse Qua =:= 2 ->
    TeamInfo1 = TeamInfo#gods_duel_team{qualification = 2},
    case WinOrLoss of
        win ->
            TeamInfo1#gods_duel_team{win_times = WinTimes + 1};
        loss ->
            TeamInfo1#gods_duel_team{loss_times = LossTimes + 1};
        _ -> TeamInfo1
    end;
update_group_match_combat(TeamInfo =
                              #gods_duel_team{qualification = Qua},
                          WinOrLoss)
    when Qua =:= 3 orelse
             Qua =:= 4 orelse Qua =:= 5 orelse Qua =:= 6 ->
    case WinOrLoss of
        win -> TeamInfo#gods_duel_team{qualification = Qua + 1};
        loss -> TeamInfo
    end;
update_group_match_combat(TeamInfo =
                              #gods_duel_team{qualification = 7},
                          WinOrLoss) ->
    case WinOrLoss of
        win -> TeamInfo#gods_duel_team{qualification = 11};
        loss -> TeamInfo#gods_duel_team{qualification = 8}
    end;
update_group_match_combat(TeamInfo =
                              #gods_duel_team{qualification = 8},
                          WinOrLoss) ->
    case WinOrLoss of
        win -> TeamInfo#gods_duel_team{qualification = 10};
        loss -> TeamInfo#gods_duel_team{qualification = 9}
    end;
update_group_match_combat(TeamInfo =
                              #gods_duel_team{qualification = 11},
                          WinOrLoss) ->
    case WinOrLoss of
        win -> TeamInfo#gods_duel_team{qualification = 13};
        loss -> TeamInfo#gods_duel_team{qualification = 12}
    end;
update_group_match_combat(TeamInfo, _) -> TeamInfo.

statistics_group_team_score() ->
    statistics_group_team_score([1, 2, 3, 4, 5, 6], []).

statistics_group_team_score([], ZoneQua64TeamList) ->
    ZoneQua64TeamList;
statistics_group_team_score([ZoneId | Rest],
                            ZoneQua64TeamList) ->
    case ets:lookup(gods_duel_group_team, ZoneId) of
        [{_, GroupTeamList}] ->
            LineTeamList = divide_line_32(GroupTeamList, []),
            Qua64TeamList = calc_group_qualify_64(LineTeamList, []),
            statistics_group_team_score(Rest,
                                        [{ZoneId, Qua64TeamList}
                                         | ZoneQua64TeamList]);
        _ ->
            statistics_group_team_score(Rest, ZoneQua64TeamList)
    end.

divide_line_32([], LineList) -> LineList;
divide_line_32([GTeam = #gods_duel_team{team_group_256 =
                                            Rank}
                | Rest],
               LineList) ->
    LineNum = gods_duel_common:get_line_num(Rank),
    NewLineList = case lists:keyfind(LineNum, 1, LineList)
                      of
                      {_, LineTeams} ->
                          lists:keystore(LineNum,
                                         1,
                                         LineList,
                                         {LineNum, [GTeam | LineTeams]});
                      _ -> [{LineNum, [GTeam]} | LineList]
                  end,
    divide_line_32(Rest, NewLineList);
divide_line_32([_ | Rest], LineList) ->
    divide_line_32(Rest, LineList).

calc_group_qualify_64([], Qualifition64Team) ->
    Qualifition64Team;
calc_group_qualify_64([{LineNum, TeamList} | Rest],
                      Qualifition64Team) ->
    QuaTeams = case
                   lists:sublist(util:keys_sort([#gods_duel_team.fight_capacity,
                                                 #gods_duel_team.win_times],
                                                TeamList),
                                 2)
                   of
                   [Team1, Team2] ->
                       NewTeam1 = Team1#gods_duel_team{qualification = 3,
                                                       team_group_64 = LineNum},
                       NewTeam2 = Team2#gods_duel_team{qualification = 3,
                                                       team_group_64 =
                                                           LineNum + 32},
                       [NewTeam1, NewTeam2];
                   [Team1] ->
                       [Team1#gods_duel_team{qualification = 3,
                                             team_group_64 = LineNum}];
                   _ -> []
               end,
    calc_group_qualify_64(Rest,
                          QuaTeams ++ Qualifition64Team);
calc_group_qualify_64([_ | Rest], Qualifition64Team) ->
    calc_group_qualify_64(Rest, Qualifition64Team).

acc_voting([], _) -> ok;
acc_voting([{TeamId, Num} | T], MatchRound) ->
    P1 = case ets:lookup(gods_duel_poll, TeamId) of
             [P = #gods_duel_poll{match_round = MatchRound,
                                  voted_cnt = VotedCnt}] ->
                 P#gods_duel_poll{voted_cnt = VotedCnt + Num};
             _ ->
                 #gods_duel_poll{id = TeamId, voted_cnt = Num,
                                 match_round = MatchRound}
         end,
    update_poll(P1),
    sync_poll(P1),
    acc_voting(T, MatchRound).

sync_poll(Poll) ->
    big_world:cast(all,
                   gods_duel_agent,
                   info,
                   [{sync_poll, Poll}]),
    ok.

start_prompt_ref() ->
    case get(prompt_ref) of
        Ref when is_reference(Ref) -> erlang:cancel_timer(Ref);
        _ -> false
    end,
    TimeOut = date:next_diff(17, 0, 0),
    PromptRef = erlang:send_after(TimeOut * 1000,
                                  self(),
                                  prompt_join),
    put(prompt_ref, PromptRef).

start_mail_prompt_ref(TimeOut) ->
    MailTime = TimeOut - 8 * 60 * 1000,
    case MailTime > 0 of
        true ->
            case get(mail_prompt_ref) of
                Ref when is_reference(Ref) -> erlang:cancel_timer(Ref);
                _ -> false
            end,
            PromptRef = erlang:send_after(MailTime,
                                          self(),
                                          mail_prompt_join),
            put(mail_prompt_ref, PromptRef);
        _ -> info(mail_prompt_join)
    end.

filter_8strong_teams([], Teams) -> Teams;
filter_8strong_teams([{GroupId, TeamList} | Rest],
                     Teams) ->
    Team8Strong = lists:filter(fun
                                   (#gods_duel_team{qualification = Qua}) ->
                                       Qua >= 5
                               end,
                               TeamList),
    filter_8strong_teams(Rest,
                         [{GroupId, Team8Strong} | Teams]).

repair_group_id() ->
    GroupList = ets:tab2list(gods_duel_team_sign),
    lists:foreach(fun (TeamInfo = #gods_duel_team{lev =
                                                      Lev}) ->
                          NewTeamInfo = case Lev =:= 6 of
                                            true ->
                                                TeamInfo#gods_duel_team{lev =
                                                                            5};
                                            _ -> TeamInfo
                                        end,
                          save_sign_team(NewTeamInfo)
                  end,
                  GroupList).

update_rank() ->
    L = ets:tab2list(gods_duel_profile),
    L2 = gods_duel_rank:sort_group(L),
    dets:delete_all_objects(gods_duel_rank),
    ets:delete_all_objects(gods_duel_rank),
    ets:insert(gods_duel_rank, L2),
    dets:insert(gods_duel_rank, L2),
    big_world:cast(all, gods_duel_agent, update_rank, [L2]).

