-file("src/mod/agenda/agenda_week.erl", 1).

-module(agenda_week).

-author("Suhan").

-export([init/0,
         login/1,
         reload/1,
         add_activity/2,
         reset_week_five/2,
         push/1,
         get_activity_reward/2,
         gm_set_week_activity/2,
         batch_reset_week_five/0,
         gm_reset_week_five/1]).

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

-file("src/mod/agenda/agenda_week.erl", 28).

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

-file("src/mod/agenda/agenda_week.erl", 29).

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

-file("src/mod/agenda/agenda_week.erl", 30).

-file("inc/gain.hrl", 1).

-record(gain,
        {label :: undefined | atom(),
         val :: undefined | term(),
         msg = "" :: list(),
         source = 0 :: non_neg_integer(),
         notice_msg = "" :: list(),
         reason :: undefined | atom(),
         ext = 0 :: term(),
         notice = 0 :: 0..1,
         ext_val = 0}).

-record(loss,
        {label :: undefined | atom(),
         val :: undefined | term(),
         msg = "" :: list(),
         notice_msg = "" :: list(),
         source = 0 :: non_neg_integer(),
         reason :: undefined | atom(),
         ext = 0 :: term(),
         ext_val = 0,
         auto_scene = "" :: list()}).

-record(gain_text_opts,
        {order = loss :: gain | loss,
         gain_tag = "" :: string(),
         loss_tag = "" :: string(),
         split_str = "，" :: string(),
         split_op_str = "，" :: string(),
         merge_type = [] :: list(),
         fly_to_bag = 0 :: non_neg_integer()}).

-file("src/mod/agenda/agenda_week.erl", 31).

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

-file("src/mod/agenda/agenda_week.erl", 32).

init() -> #m_agenda_week{}.

login(Role = #role{m_agenda_week =
                       MAgendaWeek = #m_agenda_week{id = OldId}}) ->
    NewId = case OldId =< 0 of
                true -> get_new_id(OldId);
                _ -> OldId
            end,
    NewRole = Role#role{m_agenda_week =
                            MAgendaWeek#m_agenda_week{id = NewId}},
    {ok, NewRole}.

reload(_Role) -> ok.

batch_reset_week_five() ->
    role_group:apply(world,
                     {agenda_week, gm_reset_week_five, []}).

gm_reset_week_five(Role = #role{m_agenda =
                                    #m_agenda{activity = NormalActivity},
                                m_agenda_week =
                                    MAgendaWeek = #m_agenda_week{id =
                                                                     OldId}}) ->
    send_reward(Role),
    NewId = get_new_id(OldId),
    NewRole = Role#role{m_agenda_week =
                            MAgendaWeek#m_agenda_week{id = NewId,
                                                      week_activity =
                                                          NormalActivity,
                                                      rewards = []}},
    push(NewRole),
    {ok, NewRole}.

reset_week_five(Role = #role{m_agenda_week =
                                 MAgendaWeek = #m_agenda_week{id = OldId}},
                _OldRole) ->
    send_reward(Role),
    NewId = get_new_id(OldId),
    NewRole = Role#role{m_agenda_week =
                            MAgendaWeek#m_agenda_week{id = NewId,
                                                      week_activity = 0,
                                                      rewards = []}},
    push(NewRole),
    {ok, NewRole}.

add_activity(Role = #role{m_agenda_week =
                              MAgendaWeek = #m_agenda_week{week_activity =
                                                               OldWeekActivity}},
             AddActivity) ->
    NewWeekActivity = OldWeekActivity + AddActivity,
    LastTime = date:unixtime(),
    NewRole = Role#role{m_agenda_week =
                            MAgendaWeek#m_agenda_week{week_activity =
                                                          NewWeekActivity,
                                                      last_add_activity_time =
                                                          LastTime}},
    push(NewRole),
    NewRole.

push(Role = #role{m_agenda_week =
                      _MAgendaWeek = #m_agenda_week{id = Id,
                                                    week_activity =
                                                        WeekActivity,
                                                    rewards = OldRewards}}) ->
    Data = case agenda_week_data:get_activity(Id) of
               {Id,
                _Day,
                ActivityNeed1,
                Rewards1,
                RewardsName1,
                RewardsIcon1,
                RewardsDesc1,
                ActivityNeed2,
                Rewards2,
                RewardsName2,
                RewardsIcon2,
                RewardsDesc2} ->
                   Flag1 = case lists:member(ActivityNeed1, OldRewards) of
                               true -> 1;
                               _ -> 0
                           end,
                   Flag2 = case lists:member(ActivityNeed2, OldRewards) of
                               true -> 1;
                               _ -> 0
                           end,
                   {WeekActivity,
                    [{ActivityNeed1,
                      Rewards1,
                      RewardsName1,
                      RewardsIcon1,
                      RewardsDesc1,
                      Flag1},
                     {ActivityNeed2,
                      Rewards2,
                      RewardsName2,
                      RewardsIcon2,
                      RewardsDesc2,
                      Flag2}]};
               _ ->
                   logger:debug("周活跃度奖励期号ID配置不存在", [], agenda_week, 97),
                   {WeekActivity, []}
           end,
    role:link_send(Role, 12010, Data).

get_activity_reward(Role = #role{m_agenda_week =
                                     _MAgendaWeek = #m_agenda_week{id = Id,
                                                                   week_activity
                                                                       =
                                                                       WeekActivity,
                                                                   rewards =
                                                                       OldRewards}},
                    Activity) ->
    case lists:member(Activity, OldRewards) of
        false ->
            case WeekActivity >= Activity of
                true ->
                    case agenda_week_data:get_activity(Id) of
                        {Id,
                         _Day,
                         ActivityNeed1,
                         Rewards1,
                         _RewardsName1,
                         _RewardsIcon1,
                         _RewardsDesc1,
                         ActivityNeed2,
                         Rewards2,
                         _RewardsName2,
                         _RewardsIcon2,
                         _RewardsDesc2} ->
                            case Activity =:= ActivityNeed1 orelse
                                     Activity =:= ActivityNeed2
                                of
                                true ->
                                    case ActivityNeed1 =:= Activity of
                                        true ->
                                            do_get_activity_reward(Role,
                                                                   Rewards1,
                                                                   ActivityNeed1);
                                        _ ->
                                            case ActivityNeed2 =:= Activity of
                                                true ->
                                                    do_get_activity_reward(Role,
                                                                           Rewards2,
                                                                           ActivityNeed2);
                                                _ -> {false, lang:get("")}
                                            end
                                    end;
                                _ -> {false, lang:get("奖励不存在哟{face_1,3}")}
                            end;
                        _ -> {false, lang:get("奖励不存在哟{face_1,3}")}
                    end;
                _ ->
                    Msg = notice:format(lang:get("本周总活跃达到~ts可领取{face_1,3}"),
                                        [{string_1, Activity}]),
                    notice:send(Role, 1, Msg),
                    {false, lang:get("")}
            end;
        _ -> {false, lang:get("奖励已领取哟{face_1,3}")}
    end.

gm_set_week_activity(Role = #role{m_agenda_week =
                                      MAgendaWeek},
                     Val) ->
    NewRole = Role#role{m_agenda_week =
                            MAgendaWeek#m_agenda_week{week_activity = Val,
                                                      last_add_activity_time =
                                                          date:unixtime()}},
    {ok, NewRole}.

send_reward(Role) ->
    Rewards = get_reward(Role),
    case Rewards of
        [] -> ok;
        _ ->
            Title = lang:get("周活跃奖励"),
            Content = lang:get("您在上周未领取的周活跃奖励，请查收"),
            mail:send(Role, Title, Content, Rewards)
    end.

get_new_id(OldId) ->
    NewId = OldId + 1,
    case agenda_week_data:get_activity(NewId) of
        {NewId,
         Day,
         _ActivityNeed1,
         _Rewards1,
         _RewardsName1,
         _RewardsIcon1,
         _RewardsDesc1,
         _ActivityNeed2,
         _Rewards2,
         _RewardsName2,
         _RewardsIcon2,
         _RewardsDesc2} ->
            Now = date:unixtime(),
            case Now < Day of
                true -> OldId;
                _ -> get_new_id(NewId)
            end;
        _ -> OldId
    end.

get_reward(#role{m_agenda_week =
                     #m_agenda_week{id = Id, week_activity = WeekActivity,
                                    rewards = OldRewards}}) ->
    case agenda_week_data:get_activity(Id) of
        {Id,
         _Day,
         ActivityNeed1,
         Rewards1,
         _RewardsName1,
         _RewardsIcon1,
         _RewardsDesc1,
         ActivityNeed2,
         Rewards2,
         _RewardsName2,
         _RewardsIcon2,
         _RewardsDesc2} ->
            case WeekActivity >= ActivityNeed1 of
                true ->
                    ResRewards = case lists:member(ActivityNeed1,
                                                   OldRewards)
                                     of
                                     false -> Rewards1;
                                     _ -> []
                                 end,
                    case WeekActivity >= ActivityNeed2 of
                        true ->
                            case lists:member(ActivityNeed2, OldRewards) of
                                false -> Rewards2 ++ ResRewards;
                                _ -> ResRewards
                            end;
                        _ -> ResRewards
                    end;
                _ -> []
            end;
        _ -> []
    end.

do_get_activity_reward(Role = #role{m_agenda_week =
                                        MAgendaWeek = #m_agenda_week{rewards =
                                                                         OldRewards}},
                       Rewards, ActivityNeed) ->
    GainRewards = format:val_to_gain(Rewards),
    case role_gain:do_notice(GainRewards, Role) of
        {ok, NewRole1} ->
            NewRewards = [ActivityNeed | OldRewards],
            NewMAgendaWeek = MAgendaWeek#m_agenda_week{rewards =
                                                           NewRewards},
            NewRole = NewRole1#role{m_agenda_week = NewMAgendaWeek},
            notice:send(NewRole, 1, lang:get("恭喜领取成功{face_1,3}")),
            push(NewRole),
            {ok, lang:get(""), NewRole};
        _ ->
            NewRole = Role#role{m_agenda_week =
                                    MAgendaWeek#m_agenda_week{rewards =
                                                                  [ActivityNeed
                                                                   | OldRewards]}},
            Title = lang:get("周活跃奖励"),
            Content = lang:get("领取周活跃奖励时背包已满，请查收"),
            mail:send(NewRole, Title, Content, Rewards),
            notice:send(NewRole, 1, lang:get("背包满请查收邮件{face_1,3}")),
            push(NewRole),
            {ok, lang:get(""), NewRole}
    end.

