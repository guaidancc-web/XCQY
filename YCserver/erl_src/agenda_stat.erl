-file("src/mod/agenda/agenda_stat.erl", 1).

-module(agenda_stat).

-behaviour(gen_server).

-export([start_link/0, reset/2, log/2]).

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

-file("src/mod/agenda/agenda_stat.erl", 17).

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

-file("src/mod/agenda/agenda_stat.erl", 18).

-file("inc/agenda.hrl", 1).

-record(m_agenda,
        {ver = 1 :: non_neg_integer(),
         progress = [],
         activity = 0 :: non_neg_integer(),
         last_joined = 0 :: non_neg_integer(),
         rewarded = [] :: [non_neg_integer()],
         last_rewarded = 0 :: non_neg_integer(),
         recommends = [] :: list(),
         last_recommended = 0 :: non_neg_integer()}).

-record(agenda_prog,
        {ver = 1,
         id = 0 :: non_neg_integer(),
         joined = 0 :: non_neg_integer(),
         last_joined = 0 :: non_neg_integer()}).

-record(agenda_stat,
        {id = 0 :: non_neg_integer(), joined = 0, finised = 0}).

-record(agenda_stat_role,
        {id = {0, "", 0},
         lev = 0,
         date = {0, 0, 0},
         logs = []}).

-record(m_agenda_week,
        {ver = 1,
         id = 0,
         week_activity = 0 :: non_neg_integer(),
         rewards = [],
         last_add_activity_time = 0}).

-file("src/mod/agenda/agenda_stat.erl", 19).

-record(state, {sync_ref :: undefined | reference()}).

reset(#role{lev = Lev}, _) when Lev < 30 -> ok;
reset(#role{id = Id, lev = Lev}, _) ->
    Date = date:date(),
    case ets:lookup(agenda_stat_role, Id) of
        [R = #agenda_stat_role{date = Date}] ->
            update(R#agenda_stat_role{lev = Lev});
        _ ->
            update(#agenda_stat_role{id = Id, date = Date,
                                     lev = Lev})
    end,
    ok.

log(#role{id = Id, lev = Lev}, #{id := Aid}) ->
    Date = date:date(),
    case ets:lookup(agenda_stat_role, Id) of
        [R = #agenda_stat_role{date = Date, logs = Acts}] ->
            NewActs = case lists:keyfind(Aid, #agenda_stat.id, Acts)
                          of
                          A = #agenda_stat{joined = Joined} ->
                              lists:keyreplace(Aid,
                                               #agenda_stat.id,
                                               Acts,
                                               A#agenda_stat{joined =
                                                                 Joined + 1});
                          _ -> [#agenda_stat{id = Aid, joined = 1} | Acts]
                      end,
            update(R#agenda_stat_role{lev = Lev, logs = NewActs});
        _ ->
            NewActs = [#agenda_stat{id = Aid, joined = 1}],
            update(#agenda_stat_role{id = Id, date = Date,
                                     lev = Lev, logs = NewActs})
    end.

start_link() ->
    gen_server:start_link({local, agenda_stat},
                          agenda_stat,
                          [],
                          []).

init([]) ->
    logger:info("开始启动...", [], agenda_stat, 69),
    dets:open_file(agenda_stat_role,
                   [{file, "./dets/agenda_stat_role.dets"},
                    {keypos, #agenda_stat_role.id},
                    {type, set}]),
    ets:new(agenda_stat_role,
            [set,
             named_table,
             {keypos, #agenda_stat_role.id},
             public]),
    load_data(),
    Timeout = date:next_diff(23, 59, 0) * 1000,
    Ref = erlang:send_after(Timeout, self(), sync),
    State = #state{sync_ref = Ref},
    logger:info("启动完成, 下次统计时间 ~w",
                [Timeout],
                agenda_stat,
                76),
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(sync, State = #state{sync_ref = OldRef}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    Date = date:date(),
    case ets:match_object(agenda_stat_role,
                          #agenda_stat_role{date = Date, _ = '_'})
        of
        [] -> ok;
        Roles ->
            Events = agenda_data:list(),
            sum_logs(Events, Roles)
    end,
    Timeout = date:next_diff(23, 59, 0) * 1000,
    logger:info("下次统计时间 ~w", [Timeout], agenda_stat, 99),
    Ref = erlang:send_after(Timeout, self(), sync),
    {noreply, State#state{sync_ref = Ref}};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

sum_logs([], _) -> ok;
sum_logs([Id | T], Roles) ->
    case agenda_data:get(Id) of
        E = #{id := Id, statistic := 1} ->
            sum_roles(Roles,
                      E#{joined => 0, finish => 0, total => 0, detail => []});
        _ -> ok
    end,
    sum_logs(T, Roles).

sum_roles([], E = #{detail := Detail}) ->
    [log:agenda_stat(E#{lev => Lv, lev_joined => LevJoin,
                        lev_finish => LevFinish, lev_total => LevTotal})
     || {Lv, LevJoin, LevFinish, LevTotal} <- Detail],
    ok;
sum_roles([#agenda_stat_role{lev = Lev} | T],
          E = #{open_leve := Min, max_leve := Max})
    when Lev < Min orelse Max =/= 0 andalso Lev > Max ->
    sum_roles(T, E);
sum_roles([#agenda_stat_role{logs = Acts, lev = Lev}
           | T],
          E = #{id := Id, total := Total, joined := Join,
                finish := Finish, max_try := Max, detail := Detail}) ->
    Lev1 = Lev div 10 * 10,
    {LevJoin, LevFinish, LevTotal} = case
                                         lists:keyfind(Lev1, 1, Detail)
                                         of
                                         {_, LvJ, LvF, LvT} -> {LvJ, LvF, LvT};
                                         _ -> {0, 0, 0}
                                     end,
    case lists:keyfind(Id, #agenda_stat.id, Acts) of
        #agenda_stat{joined = Joined} when Joined >= Max ->
            Detail1 = lists:keystore(Lev1,
                                     1,
                                     Detail,
                                     {Lev1,
                                      LevJoin + 1,
                                      LevFinish + 1,
                                      LevTotal + 1}),
            sum_roles(T,
                      E#{total := Total + 1, joined := Join + 1,
                         finish := Finish + 1, detail := Detail1});
        #agenda_stat{} ->
            Detail1 = lists:keystore(Lev1,
                                     1,
                                     Detail,
                                     {Lev1,
                                      LevJoin + 1,
                                      LevFinish,
                                      LevTotal + 1}),
            sum_roles(T,
                      E#{total := Total + 1, joined := Join + 1,
                         detail := Detail1});
        _ ->
            Detail1 = lists:keystore(Lev1,
                                     1,
                                     Detail,
                                     {Lev1, LevJoin, LevFinish, LevTotal + 1}),
            sum_roles(T, E#{total := Total + 1, detail := Detail1})
    end.

load_data() ->
    Date = date:date(),
    L = dets:match_object(agenda_stat_role,
                          #agenda_stat_role{date = Date, _ = '_'}),
    dets:delete_all_objects(agenda_stat_role),
    ets:insert(agenda_stat_role, L),
    dets:insert(agenda_stat_role, L).

update(R = #agenda_stat_role{}) ->
    ets:insert(agenda_stat_role, R),
    dets:insert(agenda_stat_role, R).

