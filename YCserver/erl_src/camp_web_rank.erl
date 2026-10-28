-file("src/mod/campaign/camp_web_rank.erl", 1).

-module(camp_web_rank).

-behaviour(gen_fsm).

-export([start_link/1,
         idel/2,
         active/2,
         cast/2,
         lookup/1]).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

-record(state,
        {id = 0,
         sec_type = 0,
         zone,
         reward = [],
         mail_title = "",
         mail_content = "",
         ts,
         timeout}).

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

-file("src/mod/campaign/camp_web_rank.erl", 32).

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

-file("src/mod/campaign/camp_web_rank.erl", 33).

-file("inc/camp_web_rank.hrl", 1).

-record(camp_web_rank_cfg,
        {id = 0,
         sec_type = 0,
         num = 0,
         keys = [],
         min_val = 1,
         zone}).

-record(camp_web_rank_zone,
        {id = 0, sec_type = 0, zone, pid}).

-record(camp_web_rank,
        {sec_type = 1,
         show_list = [],
         list = [],
         last_val = 0,
         len = 0}).

-record(camp_web_rank_role,
        {key,
         id = {roleid, platform, zoneid} :: term(),
         sec_type = 0,
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
         desc = ""}).

-file("src/mod/campaign/camp_web_rank.erl", 34).

-file("inc/camp_web.hrl", 1).

-record(m_camp_web,
        {ver = 4 :: non_neg_integer(),
         acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list(),
         overdue_time = 0 :: non_neg_integer(),
         end_reward = [] :: list(),
         time_list = [] :: list(),
         card_info = {0, 0, 0, []} :: tuple()}).

-record(camp_web_ico,
        {id = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         title = "" :: bitstring(),
         ico = "" :: bitstring(),
         alert = "" :: bitstring(),
         gif = "" :: bitstring(),
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         login_open = 0 :: non_neg_integer(),
         is_show_time = 0 :: 0..1,
         menu_list = [] :: list()}).

-record(camp_web_menu,
        {id = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         sec_type = 0 :: non_neg_integer(),
         settlement = 0 :: non_neg_integer(),
         reward_mod = 0 :: non_neg_integer(),
         mail_title = "" :: bitstring(),
         mail_content = "" :: bitstring(),
         title = "" :: bitstring(),
         title2 = "" :: bitstring(),
         ico = "" :: bitstring(),
         title_ico = "" :: bitstring(),
         type_ico = "" :: bitstring(),
         total_ico = 0 :: non_neg_integer(),
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         sort_val = 0 :: non_neg_integer(),
         top_banner = "" :: bitstring(),
         rule_str = "" :: bitstring(),
         time_str = "" :: bitstring(),
         bottom_alert = "" :: bitstring(),
         reward_title = "" :: bitstring(),
         panel_type = "" :: bitstring(),
         cli_reward = "" :: bitstring(),
         button_text = "" :: bitstring(),
         is_button = 0 :: 0..1,
         notice_msg = "" :: bitstring(),
         camp_list = [] :: list(),
         is_tran = 0,
         tran_info = ""}).

-record(camp_web,
        {id = 0 :: non_neg_integer(),
         n = 1 :: pos_integer(),
         key = {0, 0} :: tuple(),
         type = 0 :: non_neg_integer(),
         sec_type = 0 :: non_neg_integer(),
         third_type = 0 :: non_neg_integer(),
         settlement = 0 :: non_neg_integer(),
         reward_num = 1 :: non_neg_integer(),
         reward_can = 0 :: non_neg_integer(),
         value = 0 :: non_neg_integer(),
         tar_val = 0 :: non_neg_integer(),
         ext_val = 0 :: non_neg_integer(),
         status = 0 :: 0..2,
         cond_msg = "" :: bitstring(),
         loss_items = [] :: list(),
         items = [] :: list(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         str1 = "" :: bitstring(),
         str2 = "" :: bitstring(),
         str3 = "" :: bitstring(),
         str4 = "" :: bitstring(),
         extra = [],
         data :: undefined | any(),
         is_desc = 0 :: 0..1}).

-record(camp_handle,
        {time = 0 :: non_neg_integer(),
         evt = {evt_rpc} :: tuple(),
         total_camp :: undefined | #camp_web_ico{},
         menu :: undefined | #camp_web_menu{},
         camp :: undefined | #camp_web{},
         call_form = rpc :: evt | rpc,
         add_can_reward = 0 :: non_neg_integer(),
         rpc_reward_num = 1 :: non_neg_integer(),
         push_cli = 0 :: 0..1,
         push_list = [] :: [tuple()],
         to_id,
         return_acc = 0}).

-file("src/mod/campaign/camp_web_rank.erl", 35).

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

-file("src/mod/campaign/camp_web_rank.erl", 36).

-file("/usr/local/lib/erlang/lib/stdlib-2.1/include/"
      "ms_transform.hrl",
      1).

-file("src/mod/campaign/camp_web_rank.erl", 37).

start_link(I = #camp_web_rank_cfg{zone = Zone}) ->
    gen_fsm:start_link({local, Zone},
                       camp_web_rank,
                       [I],
                       []).

cast(Pid, Info) ->
    gen_fsm:send_all_state_event(Pid, Info).

init([#camp_web_rank_cfg{id = Id, zone = Zone,
                         sec_type = SecType}]) ->
    logger:info("[~w] 正在启动...", [Zone], camp_web_rank, 52),
    process_flag(trap_exit, true),
    {StateName, TimeLeft} = get_idle_time(SecType),
    logger:info("下一个状态~w",
                [{StateName, TimeLeft, Zone}],
                camp_web_rank,
                55),
    {Reward, MailTitle, MailContent} = case
                                           camp_web_mgr:list_type(now,
                                                                  [SecType])
                                           of
                                           [{_,
                                             #camp_web_menu{camp_list =
                                                                CampList,
                                                            mail_title =
                                                                TMailTitle,
                                                            mail_content =
                                                                TMailContent}}
                                            | _] ->
                                               {CampList,
                                                TMailTitle,
                                                TMailContent};
                                           _ -> {[], "", ""}
                                       end,
    State = #state{id = Id, zone = Zone, sec_type = SecType,
                   ts = date:now2(), timeout = TimeLeft, reward = Reward,
                   mail_title = MailTitle, mail_content = MailContent},
    logger:info("[~w] 启动完成", [Zone], camp_web_rank, 63),
    {ok, StateName, State, TimeLeft}.

handle_event({update_role,
              R = #camp_web_rank_role{id = Id, val1 = Val1}},
             StateName = active,
             State = #state{sec_type = SecType}) ->
    logger:debug("======================================",
                 [],
                 camp_web_rank,
                 67),
    Key = {Id, SecType},
    NR = case ets:lookup(camp_web_rank_role, Key) of
             [#camp_web_rank_role{val1 = OldVal1}] ->
                 ets:insert(camp_web_rank_role,
                            R#camp_web_rank_role{val1 = OldVal1 + Val1}),
                 dets:insert(camp_web_rank_role,
                             R#camp_web_rank_role{val1 = OldVal1 + Val1}),
                 R#camp_web_rank_role{val1 = OldVal1 + Val1};
             _ ->
                 ets:insert(camp_web_rank_role, R),
                 dets:insert(camp_web_rank_role, R),
                 R
         end,
    in_rank(NR, State),
    continue(StateName, State);
handle_event({set_role,
              R = #camp_web_rank_role{id = Id}},
             StateName = active,
             State = #state{sec_type = SecType}) ->
    logger:debug("======================================",
                 [],
                 camp_web_rank,
                 83),
    Key = {Id, SecType},
    ets:lookup(camp_web_rank_role, Key),
    ets:insert(camp_web_rank_role, R),
    dets:insert(camp_web_rank_role, R),
    in_rank(R, State),
    continue(StateName, State);
handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event(_Event, _From, StateName, State) ->
    Reply = ok,
    continue(StateName, Reply, State).

handle_info(reload, _,
            State = #state{sec_type = SecType}) ->
    {StateName, TimeLeft} = get_idle_time(SecType),
    {Reward, MailTitle, MailContent} = case
                                           camp_web_mgr:list_type(now,
                                                                  [SecType])
                                           of
                                           [{_,
                                             #camp_web_menu{camp_list =
                                                                CampList,
                                                            mail_title =
                                                                TMailTitle,
                                                            mail_content =
                                                                TMailContent}}
                                            | _] ->
                                               {CampList,
                                                TMailTitle,
                                                TMailContent};
                                           _ -> {[], "", ""}
                                       end,
    continue(StateName,
             State#state{ts = date:now2(), timeout = TimeLeft,
                         reward = Reward, mail_title = MailTitle,
                         mail_content = MailContent});
handle_info(_Info, StateName, State) ->
    continue(StateName, State).

terminate(_Reason, _StateName, _State) -> ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

idel(timeout, State = #state{sec_type = SecType}) ->
    {StateName, TimeLeft} = get_idle_time(SecType),
    logger:info("下一个状态~w",
                [{StateName, TimeLeft, State}],
                camp_web_rank,
                123),
    {Reward, MailTitle, MailContent} = case
                                           camp_web_mgr:list_type(now,
                                                                  [SecType])
                                           of
                                           [{_,
                                             #camp_web_menu{camp_list =
                                                                CampList,
                                                            mail_title =
                                                                TMailTitle,
                                                            mail_content =
                                                                TMailContent}}
                                            | _] ->
                                               {CampList,
                                                TMailTitle,
                                                TMailContent};
                                           _ -> {[], "", ""}
                                       end,
    NState = State#state{ts = date:now2(),
                         timeout = TimeLeft, reward = Reward,
                         mail_title = MailTitle, mail_content = MailContent},
    MatchSpec = [{{camp_web_rank_role,
                   '$2',
                   '_',
                   '$1',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_'},
                  [{'==', '$1', {const, SecType}}],
                  ['$2']}],
    ets:select_delete(camp_web_rank_role, MatchSpec),
    dets:select_delete(camp_web_rank_role, MatchSpec),
    ets:delete(camp_web_rank, SecType),
    dets:delete(camp_web_rank, SecType),
    continue(StateName, NState);
idel(_Any, State) -> continue(idel, State).

active(timeout, State = #state{sec_type = SecType}) ->
    {_, TimeLeft} = get_idle_time(SecType),
    logger:info("下一个状态~w",
                [{idel, TimeLeft, State}],
                camp_web_rank,
                144),
    #camp_web_rank{list = Rank} = lookup(SecType),
    reward(Rank, 1, State),
    continue(idel,
             State#state{ts = date:now2(), timeout = TimeLeft});
active(_Any, State) -> continue(idel, State).

get_idle_time(SecType) ->
    Now = date:unixtime(),
    {StartTime, EndTime} = case
                               camp_web_mgr:get_camp_time(SecType)
                               of
                               {-1, -1} ->
                                   {date:datetime_to_seconds({{2016, 3, 29},
                                                              {0, 0, 0}}),
                                    date:datetime_to_seconds({{2016, 4, 20},
                                                              {0, 0, 0}})};
                               {S, E} -> {S, E};
                               _ ->
                                   {date:datetime_to_seconds({{2016, 3, 29},
                                                              {0, 0, 0}}),
                                    date:datetime_to_seconds({{2016, 4, 20},
                                                              {0, 0, 0}})}
                           end,
    if Now < StartTime ->
           {idel, max((StartTime - Now) * 1000, 1)};
       Now >= StartTime andalso Now < EndTime ->
           {active, max((EndTime - Now) * 1000, 1)};
       true -> {idel, date:next_diff(0) * 1000}
    end.

lookup(SecType) ->
    case ets:lookup(camp_web_rank, SecType) of
        [I = #camp_web_rank{}] -> I;
        _ -> #camp_web_rank{sec_type = SecType}
    end.

update(Data) ->
    ets:insert(camp_web_rank, Data),
    dets:insert(camp_web_rank, Data).

in_rank(NewData = #camp_web_rank_role{id = Id,
                                      val1 = Value},
        State = #state{sec_type = SecType}) ->
    Rank = #camp_web_rank{list = RankList, len = Len,
                          last_val = LastValue} =
               lookup(SecType),
    #camp_web_rank_cfg{num = Max, keys = SortKeys} =
        lists:keyfind(SecType,
                      #camp_web_rank_cfg.sec_type,
                      camp_web_rank_mgr:cfg()),
    case lists:keyfind(Id, #camp_web_rank_role.id, RankList)
        of
        false ->
            case Value >= LastValue orelse Max > Len of
                false -> {noreply, State};
                true ->
                    ToSortList = [NewData | lists:reverse(RankList)],
                    {NewRankList, NewLastValue} = rank_zone:update_rank(Max,
                                                                        SortKeys,
                                                                        ToSortList),
                    NewRank = Rank#camp_web_rank{list = NewRankList,
                                                 last_val = NewLastValue},
                    update(NewRank)
            end;
        _OldData ->
            NRandList = lists:keyreplace(Id,
                                         #camp_web_rank_role.id,
                                         RankList,
                                         NewData),
            ToSortList = lists:reverse(NRandList),
            {NewRankList, NewLastValue} = rank_zone:update_rank(Max,
                                                                SortKeys,
                                                                ToSortList),
            NewRank = Rank#camp_web_rank{list = NewRankList,
                                         last_val = NewLastValue},
            update(NewRank)
    end.

reward([], _, _) -> [];
reward([#camp_web_rank_role{id = Id, name = Name} | T],
       Rank,
       State = #state{sec_type = SecType,
                      mail_title = MailTitle, mail_content = MailContent,
                      reward = Reward}) ->
    case lists:keyfind(Rank, #camp_web.n, Reward) of
        #camp_web{items = Items} ->
            Content = notice:replace_msg([{"#role#",
                                           [{role_2, Name}]},
                                          {"#item#", [{item_2, Items}]},
                                          {"#rank#", [{string_2, 5, Rank}]}],
                                         MailContent),
            logger:info("排行榜活动：~w,~ts,名次:~w,id:~w,name:~ts",
                        [SecType, MailTitle, Rank, Id, Name],
                        camp_web_rank,
                        210),
            mail:send(Id, MailTitle, Content, Items);
        _ -> ignore
    end,
    reward(T, Rank + 1, State).

continue(StateName,
         State = #state{ts = Ts, timeout = Tidle}) ->
    {next_state,
     StateName,
     State,
     util:time_left(Tidle, Ts)}.

continue(StateName, Reply,
         State = #state{ts = Ts, timeout = Tidle}) ->
    {reply,
     Reply,
     StateName,
     State,
     util:time_left(Tidle, Ts)}.

