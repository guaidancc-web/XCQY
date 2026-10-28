-file("src/mod/campaign_inquiry/campaign_inquiry_rol"
      "e.erl",
      1).

-module(campaign_inquiry_role).

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

-file("src/mod/campaign_inquiry/campaign_inquiry_rol"
      "e.erl",
      12).

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

-file("src/mod/campaign_inquiry/campaign_inquiry_rol"
      "e.erl",
      13).

-file("inc/campaign_inquiry.hrl", 1).

-record(m_camp_inquiry, {ver = 1, inquiry_list = []}).

-record(camp_inquiry,
        {ver = 1,
         camp_id = 0,
         clue_list = [],
         inquiry_status = 1,
         start_time = 0,
         end_time = 0}).

-record(camp_clue,
        {ver = 1,
         id = 0,
         quest_id = 0,
         status = 0,
         answer = 1}).

-file("src/mod/campaign_inquiry/campaign_inquiry_rol"
      "e.erl",
      14).

-file("inc/timer.hrl", 1).

-record(timer,
        {id :: undefined | term(),
         timeout = 1000 :: pos_integer(),
         m :: undefined | atom(),
         f :: undefined | function() | atom(),
         a = [] :: [term()],
         times = 1 :: integer(),
         next_tick = 0 :: non_neg_integer(),
         set_time = 1 :: pos_integer()}).

-record(rtimer,
        {ref :: undefined | reference(),
         key :: undefined | reference(),
         timers = [] :: [#timer{}]}).

-record(s_timer,
        {ref :: undefined | reference(),
         timers = [] :: [#timer{}]}).

-file("src/mod/campaign_inquiry/campaign_inquiry_rol"
      "e.erl",
      15).

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

-file("src/mod/campaign_inquiry/campaign_inquiry_rol"
      "e.erl",
      16).

-file("inc/campaign.hrl", 1).

-record(campaign_eggs,
        {ver = 0,
         location = 0 :: non_neg_integer(),
         footprints = [],
         last_moved = 0 :: non_neg_integer(),
         rolled = 0 :: non_neg_integer(),
         rewarded = []}).

-record(camp_login,
        {camp_id = 0,
         m_time = 0,
         num = 0,
         days = [],
         buys = []}).

-record(camp_login_data,
        {day = 0, reward = [], buys = [], cost = []}).

-record(camp_login_buy_data,
        {id = 0, reward = [], cost = [], cd = 0}).

-record(campaign_bags,
        {ver = 0,
         collected = [],
         last_filled = 0 :: non_neg_integer(),
         rewarded = 0}).

-record(campaign_card,
        {ver = 0,
         card_ver = 0,
         init = 0,
         times = 0,
         card_list = []}).

-record(campaign_card_open,
        {ver = 0,
         card_ver = 0,
         times = 0,
         init = 0,
         card_list = []}).

-record(camp_wish_flower,
        {ver = 1,
         floor = 1,
         times = 0,
         all_times = 0,
         camp_id = 0}).

-record(camp_new_flop,
        {ver = 1,
         group = 0,
         times = 0,
         rewarded = [],
         camp_id = 0}).

-record(camp_consume_rebate,
        {ver = 1, limit_item = []}).

-record(camp_new_acc_charge,
        {ver = 1, charge_val = 0, get_reward = []}).

-record(camp_charge_seven_gift,
        {ver = 1, id = 0, buy_time = 0, can_reward = []}).

-record(camp_lucky_tree,
        {id = 0,
         times = 0,
         reward_list = [],
         delay_reward = []}).

-record(camp_long_active,
        {ver = 1,
         id = 0,
         lev = 0,
         token_list = [],
         reward_levs = [],
         week_box = 0,
         last_reset_time = 0}).

-record(m_campaign,
        {ver = 27,
         acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list(),
         eggs = #campaign_eggs{},
         bags = #campaign_bags{},
         first_charge_double = [],
         camp_login = #camp_login{},
         hide_seek,
         login_roll,
         recharge = camp_series_recharge:init(),
         camp_card = #campaign_card{},
         wish_times = 0,
         camp_limit = [],
         camp_card_open = #campaign_card_open{},
         recharge_open = camp_series_recharge_open:init(),
         camp_wish_flower = #camp_wish_flower{},
         camp_doll = camp_doll:init(),
         camp_sign,
         camp_exchange,
         camp_animal_chess,
         camp_new_flop = #camp_new_flop{},
         multiplex_assert = 0,
         camp_consume_rebate = camp_consume_rebate:init(),
         camp_black_white_chess =
             camp_black_white_chess_mgr:init(),
         camp_scratch_card = camp_scratch_card:init(),
         camp_new_acc_charge = camp_new_acc_charge:init(),
         camp_charge_seven_gift = camp_charge_seven_gift:init(),
         camp_lucky_tree = camp_lucky_tree:init(),
         camp_long_active = camp_long_active:init(),
         gift_custom = camp_gift_custom:init()}).

-record(campaign_handle,
        {time = 0 :: non_neg_integer(),
         evt = {evt_rpc} :: tuple(),
         call_from = rpc :: evt | rpc,
         add_can_reward = 0 :: non_neg_integer(),
         camp :: undefined | tuple(),
         camp_info :: undefined | tuple(),
         push_list = [] :: [tuple()],
         push_cli = 0 :: 0..1,
         rpc_reward_num = 1 :: non_neg_integer(),
         return_acc = 0}).

-record(camp_collection,
        {camp_end_time = 0,
         reward_list = [],
         extra_data = [],
         random_index,
         red_dot}).

-record(camp_ico,
        {id = 0 :: non_neg_integer(),
         ico_id = 0 :: non_neg_integer(),
         name = "",
         is_show = 0 :: 0..1,
         start_time = 0 :: non_neg_integer() | tuple(),
         end_time = 0 :: non_neg_integer() | tuple(),
         white_list = [] :: list(),
         black_list = [] :: list(),
         min_open_time = 0 :: non_neg_integer() | tuple(),
         max_open_time = 0 :: non_neg_integer() | tuple()}).

-record(camp_cfg,
        {id = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         group_id = 0 :: non_neg_integer(),
         start_time = 0 :: non_neg_integer() | tuple(),
         end_time = 0 :: non_neg_integer() | tuple(),
         cli_start_time = 0 :: non_neg_integer() | tuple(),
         cli_end_time = 0 :: non_neg_integer() | tuple(),
         type = 0 :: pos_integer(),
         sec_type = 0 :: non_neg_integer(),
         status = 1 :: 0..1,
         reward_type = 2 :: pos_integer(),
         settlement = 2 :: non_neg_integer(),
         reward_title = "" :: bitstring(),
         reward_content = "" :: bitstring(),
         loss_items = [] :: list(),
         auto_buy = 0,
         reward = [] :: list(),
         camp_cond :: undefined | tuple(),
         reward_max = 1 :: non_neg_integer(),
         white_list = [] :: list(),
         black_list = [] :: list(),
         min_open_time = 0 :: non_neg_integer() | tuple(),
         max_open_time = 0 :: non_neg_integer() | tuple(),
         finish_id = 0 :: non_neg_integer(),
         finish_days = 0 :: non_neg_integer(),
         finish_end_days = 0 :: non_neg_integer(),
         cond_reward = [],
         merge_min = 0,
         merge_max = 0,
         is_keep_time = 0}).

-record(camp_cache,
        {id = 0 :: non_neg_integer(),
         sec_type = 0 :: non_neg_integer(),
         is_srv_open = 0 :: 0..1,
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         cli_start_time = 0 :: non_neg_integer(),
         cli_end_time = 0 :: non_neg_integer()}).

-record(camp_unit,
        {id = {0, 0}, base_id = 0, map_id = 0}).

-record(camp_time,
        {id = 0, start_time = 0, end_time = 0}).

-record(camp_item,
        {item = 0,
         start_time = 0,
         end_time = 0,
         open = 0,
         msg = 0}).

-record(camp_assets_data,
        {type = 0, items = [], max = 0, var_type = day}).

-record(camp_gift_custom,
        {ver = 1,
         camp_id = 0,
         gift = [],
         buy = [],
         extra_reward = 0}).

-file("src/mod/campaign_inquiry/campaign_inquiry_rol"
      "e.erl",
      17).

-export([rpc_answer_inquiry/3,
         rpc_inquiry_result/2,
         rpc_get_inquiry_reward/2,
         push/1]).

-export([init/0,
         login/1,
         levup/2,
         check_inquiry_camp/1,
         reload/0,
         commit/2,
         get_clue/4,
         gm_set_clue_status/3]).

reload() ->
    role_group:apply(world,
                     {campaign_inquiry_role, check_inquiry_camp, []}),
    ok.

init() -> #m_camp_inquiry{}.

login(Role = #role{lev = Lev}) when Lev >= 30 ->
    {ok, NewRole} = check_inquiry_camp(Role),
    {ok, NewRole};
login(_Role) -> ok.

levup(Role = #role{lev = NewLev}, OldLev)
    when OldLev < 30 andalso NewLev >= 30 ->
    logger:debug("=====campaign_inquiry_role========:~w",
                 [{OldLev, NewLev}],
                 campaign_inquiry_role,
                 54),
    {ok, NewRole} = check_inquiry_camp(Role),
    NewRole;
levup(_Role = #role{lev = _OldLev}, _NewLev) ->
    logger:debug("=======campaign_inquiry_role======:~w",
                 [{_OldLev, _NewLev}],
                 campaign_inquiry_role,
                 58),
    _Role.

gm_set_clue_status(Role, ClueId, Status) ->
    case get_clue(by_clue, Role, ClueId) of
        {true, CampId, CampClue} ->
            NewCampClue = CampClue#camp_clue{status = Status},
            NewRole = update_camp_clue(Role, CampId, NewCampClue),
            push(NewRole),
            NewRole;
        _ -> Role
    end.

commit(Role, QuestId) ->
    logger:debug("提交任务：~w",
                 [QuestId],
                 campaign_inquiry_role,
                 73),
    case get_clue(by_quest, Role, QuestId) of
        {true, CampId, CampClue = #camp_clue{id = ClueId}} ->
            NewCampClue = CampClue#camp_clue{quest_id = QuestId,
                                             status = 3},
            NextClueRole = case
                               camp_inquiry_data:get_clue_info(ClueId)
                               of
                               #{next_clue := NextClueId}
                                   when NextClueId =/= 0 ->
                                   case get_clue(by_clue, Role, NextClueId) of
                                       {true, _, NextClue} ->
                                           NewNextClue =
                                               NextClue#camp_clue{status = 1},
                                           update_camp_clue(Role,
                                                            CampId,
                                                            NewNextClue);
                                       _Else -> Role
                                   end;
                               _ -> Role
                           end,
            NewRole = update_camp_clue(NextClueRole,
                                       CampId,
                                       NewCampClue),
            {ok, NewRole};
        _ -> {ok, Role}
    end.

check_inquiry_camp(Role = #role{m_camp_inquiry =
                                    MCampInquiry = #m_camp_inquiry{inquiry_list
                                                                       =
                                                                       InquiryList}}) ->
    CampList = camp_inquiry_data:get_camp_list(),
    Now = date:unixtime(),
    CampFun = fun (CampId, {NextTime, CampInfoList}) ->
                      {StartTtime, EndTime, Status} = case
                                                          campaign_time:get_time({camp,
                                                                                  CampId})
                                                          of
                                                          {-1, -1} ->
                                                              case
                                                                  campaign_data:get(CampId)
                                                                  of
                                                                  #camp_cfg{start_time
                                                                                =
                                                                                StartT,
                                                                            end_time
                                                                                =
                                                                                EndT}
                                                                      when Now <
                                                                               StartT ->
                                                                      {StartT,
                                                                       EndT,
                                                                       0};
                                                                  #camp_cfg{start_time
                                                                                =
                                                                                _StartT,
                                                                            end_time
                                                                                =
                                                                                EndT}
                                                                      when Now >
                                                                               EndT ->
                                                                      {-1,
                                                                       -1,
                                                                       0};
                                                                  _ ->
                                                                      {-1,
                                                                       -1,
                                                                       0}
                                                              end;
                                                          {StartT, EndT}
                                                              when Now <
                                                                       StartT ->
                                                              {StartT, EndT, 0};
                                                          {StartT, EndT}
                                                              when Now < EndT ->
                                                              {StartT, EndT, 1};
                                                          _ -> {-1, -1, 0}
                                                      end,
                      NextTime1 = case StartTtime >= Now of
                                      true
                                          when StartTtime =< NextTime orelse
                                                   NextTime =:= 0 ->
                                          StartTtime;
                                      _ -> NextTime
                                  end,
                      NextTime2 = case EndTime >= Now of
                                      true
                                          when EndTime =< NextTime1 orelse
                                                   NextTime1 =:= 0 ->
                                          EndTime;
                                      _ -> NextTime1
                                  end,
                      NewNextTime = NextTime2,
                      {NewNextTime,
                       [{CampId, StartTtime, EndTime, Status} | CampInfoList]}
              end,
    {NextTimerTime, CampInfo} = lists:foldl(CampFun,
                                            {0, []},
                                            CampList),
    logger:debug("检查调查活动:~w",
                 [CampInfo],
                 campaign_inquiry_role,
                 132),
    RoleFun = fun ({CampId, StartTime, EndTime, Status},
                   RtnCampInquiry) ->
                      NewCampInquiry = case lists:keyfind(CampId,
                                                          #camp_inquiry.camp_id,
                                                          InquiryList)
                                           of
                                           CampInquiry = #camp_inquiry{} ->
                                               CampInquiry#camp_inquiry{inquiry_status
                                                                            =
                                                                            Status,
                                                                        start_time
                                                                            =
                                                                            StartTime,
                                                                        end_time
                                                                            =
                                                                            EndTime};
                                           _ ->
                                               ClueList = factory_clue(CampId),
                                               #camp_inquiry{camp_id = CampId,
                                                             clue_list =
                                                                 ClueList,
                                                             inquiry_status =
                                                                 Status,
                                                             start_time =
                                                                 StartTime,
                                                             end_time = EndTime}
                                       end,
                      [NewCampInquiry | RtnCampInquiry]
              end,
    NewInquiryList = lists:foldl(RoleFun, [], CampInfo),
    logger:debug("角色新的调查信息:~w, 下一超时时间:~w",
                 [NewInquiryList, NextTimerTime],
                 campaign_inquiry_role,
                 145),
    GiveUpAllQuest = [[QuestId
                       || #camp_clue{status = 2, quest_id = QuestId}
                              <- ClueList]
                      || #camp_inquiry{clue_list = ClueList,
                                       inquiry_status = 0}
                             <- NewInquiryList],
    DeleteQuest = [[QuestId
                    || #camp_clue{status = 2, quest_id = QuestId}
                           <- ClueList]
                   || #camp_inquiry{camp_id = OldCampId,
                                    clue_list = ClueList, inquiry_status = 1}
                          <- InquiryList,
                      not
                          lists:keymember(OldCampId,
                                          #camp_inquiry.camp_id,
                                          NewInquiryList)],
    GiveUpQuests = lists:flatten(GiveUpAllQuest ++
                                     DeleteQuest),
    logger:debug("删除任务列表:~w",
                 [GiveUpQuests],
                 campaign_inquiry_role,
                 157),
    GiveUpQuestRole = giveup_quest(GiveUpQuests, Role),
    DelTimerRole = role_timer:del(camp_inquiry,
                                  GiveUpQuestRole),
    InquieryRole = DelTimerRole#role{m_camp_inquiry =
                                         MCampInquiry#m_camp_inquiry{inquiry_list
                                                                         =
                                                                         NewInquiryList}},
    AddTimerRole = case NextTimerTime > 0 of
                       true ->
                           TimeOut = NextTimerTime - Now + 10,
                           Timer = #timer{id = camp_inquiry,
                                          timeout = TimeOut * 1000, times = 1,
                                          m = campaign_inquiry_role,
                                          f = check_inquiry_camp, a = []},
                           role_timer:add(Timer, InquieryRole);
                       _ -> InquieryRole
                   end,
    NewRole = AddTimerRole,
    {ok, NewRole}.

push(Role = #role{m_camp_inquiry =
                      #m_camp_inquiry{inquiry_list = InquiryList}}) ->
    logger:debug("========:~w",
                 [InquiryList],
                 campaign_inquiry_role,
                 179),
    role:link_send(Role, 20600, {InquiryList}),
    ok.

rpc_answer_inquiry(Role, ClueId, Answer) ->
    case check_clue(Role, ClueId) of
        {true, CampId, CampClue} ->
            catch gen_server:cast(adm_mgr,
                                  {update_camp_clue_answer, ClueId, Answer}),
            case camp_inquiry_data:get_clue_info(ClueId) of
                #{quest_id := QuestId} ->
                    logger:debug("==========:~w",
                                 [QuestId],
                                 campaign_inquiry_role,
                                 193),
                    case quest:accept_handle([condition, accept, fire],
                                             Role,
                                             QuestId)
                        of
                        {ok, QuestRole} ->
                            NewCampClue = CampClue#camp_clue{answer = Answer,
                                                             status = 2,
                                                             quest_id =
                                                                 QuestId},
                            NewRole = update_camp_clue(QuestRole,
                                                       CampId,
                                                       NewCampClue),
                            push(NewRole),
                            {ok, NewRole};
                        ok -> {false, lang:get("接受活动调查任务失败")};
                        {false, Reason} -> {false, Reason};
                        {error, Reason} -> {false, Reason}
                    end;
                _ -> {false, lang:get("接受活动调查任务失败")}
            end;
        {false, Result} -> {false, Result};
        _ -> {false, lang:get("未知的线索信息")}
    end.

rpc_inquiry_result(Role = #role{pid = RolePid},
                   ClueId) ->
    case get_clue(by_clue, Role, ClueId) of
        {true, _CampId, #camp_clue{status = Status}}
            when Status =:= 2 orelse
                     Status =:= 3 orelse Status =:= 4 ->
            gen_server:cast(adm_mgr,
                            {role_get_inquiry_result, RolePid, ClueId});
        _ -> ok
    end.

rpc_get_inquiry_reward(Role = #role{lev = Lev,
                                    sex = RoleSex},
                       ClueId) ->
    case get_clue(by_clue, Role, ClueId) of
        {true, _CampId, #camp_clue{status = 4}} ->
            {false, lang:get("您已经领取了该活动调查奖励")};
        {true,
         CampId,
         CampClue = #camp_clue{status = 3, answer = Answer}} ->
            NewCampClue = CampClue#camp_clue{status = 4},
            ClueRole = update_camp_clue(Role, CampId, NewCampClue),
            RewardList = camp_inquiry_data:get_reward(ClueId),
            RewardItems = [Items
                           || {Items, LevMin, LevMax, Sex} <- RewardList,
                              Lev >= LevMin andalso Lev =< LevMax,
                              RoleSex =:= Sex orelse Sex =:= 2],
            NewRewardItems = lists:flatten(RewardItems),
            Gain = format:val_to_gain(NewRewardItems),
            Title = lang:get("竞猜成功"),
            Content = lang:get("恭喜您参与功能预告线索任务时，猜对了正确答案，获得额外竞猜奖励！"),
            MailItems = case camp_inquiry_data:get_clue_info(ClueId)
                            of
                            #{right_reward := _MailItems,
                              question_id := QuestionId} ->
                                RightAnswer =
                                    question_data:get_inquiry_answer(QuestionId),
                                case RightAnswer =:= Answer of
                                    true -> _MailItems;
                                    _ -> []
                                end;
                            _ -> []
                        end,
            case role_gain:do_notice(Gain, ClueRole) of
                {ok, GainRole} ->
                    push(ClueRole),
                    case MailItems of
                        [_ | _] ->
                            notice:return(lang:get("恭喜您回答正确，额外奖励已通过邮件发放")),
                            mail:send(GainRole, Title, Content, MailItems);
                        _ -> ok
                    end,
                    {ok, GainRole};
                {false, #gain{}} ->
                    FullTitle = lang:get("活动调查奖励"),
                    FullContent = lang:get("由于您的背包已满，活动调查奖励通过邮件下发给您，请查收:"),
                    mail:send(ClueRole,
                              FullTitle,
                              FullContent,
                              NewRewardItems),
                    case MailItems of
                        [_ | _] ->
                            notice:return(lang:get("恭喜您回答正确，额外奖励已通过邮件发放")),
                            mail:send(ClueRole, Title, Content, MailItems);
                        _ -> ok
                    end,
                    push(ClueRole),
                    {ok, ClueRole};
                _ -> {false, lang:get("领取活动调查奖励失败")}
            end;
        _ -> {false, lang:get("您未完成该线索，无法领取奖励")}
    end.

factory_clue(CampId) ->
    ClueList = camp_inquiry_data:get_clue_list(CampId),
    Fun = fun (ClueId, Rtn) ->
                  case camp_inquiry_data:get_clue_info(ClueId) of
                      #{quest_id := QuestId, is_first := IsFirst} ->
                          Status = case IsFirst of
                                       1 -> 1;
                                       _ -> 0
                                   end,
                          CampClue = #camp_clue{id = ClueId, quest_id = QuestId,
                                                status = Status},
                          [CampClue | Rtn];
                      _ -> Rtn
                  end
          end,
    lists:foldl(Fun, [], ClueList).

get_clue(Type,
         #role{m_camp_inquiry =
                   #m_camp_inquiry{inquiry_list = InquiryList}},
         Id) ->
    get_clue(Type,
             InquiryList,
             Id,
             {false, lang:get("未知的线索信息")}).

get_clue(_, [], _ClueId, Result) -> Result;
get_clue(by_clue,
         [#camp_inquiry{camp_id = CampId, clue_list = ClueList}
          | Rest],
         ClueId, Result) ->
    case lists:keyfind(ClueId, #camp_clue.id, ClueList) of
        CampClue = #camp_clue{} -> {true, CampId, CampClue};
        _ -> get_clue(by_clue, Rest, ClueId, Result)
    end;
get_clue(by_quest,
         [#camp_inquiry{camp_id = CampId, clue_list = ClueList}
          | Rest],
         QuestId, Result) ->
    case lists:keyfind(QuestId,
                       #camp_clue.quest_id,
                       ClueList)
        of
        CampClue = #camp_clue{} -> {true, CampId, CampClue};
        _ -> get_clue(by_quest, Rest, QuestId, Result)
    end.

check_clue(#role{m_camp_inquiry =
                     #m_camp_inquiry{inquiry_list = InquiryList}},
           ClueId) ->
    case get_clue(by_clue,
                  InquiryList,
                  ClueId,
                  {false, lang:get("未知的线索信息")})
        of
        {true, CampId, CampClue = #camp_clue{status = 1}} ->
            {true, CampId, CampClue};
        {true, _CampId, #camp_clue{status = 0}} ->
            {false, lang:get("该线索未解锁，请先完成前一条线索")};
        {true, _CampId, #camp_clue{status = 2}} ->
            {false, lang:get("您已经回答过该线索")};
        {true, _CampId, #camp_clue{status = 3}} ->
            {false, lang:get("您已经回答过该线索")};
        _Else -> _Else
    end.

update_camp_clue(Role = #role{m_camp_inquiry =
                                  MCampInquiry = #m_camp_inquiry{inquiry_list =
                                                                     InquiryList}},
                 CampId, NewCampClue = #camp_clue{id = Id}) ->
    case lists:keyfind(CampId,
                       #camp_inquiry.camp_id,
                       InquiryList)
        of
        CampInquiry = #camp_inquiry{clue_list = ClueList} ->
            NewClueList = lists:keystore(Id,
                                         #camp_clue.id,
                                         ClueList,
                                         NewCampClue),
            NewCampInquiry = CampInquiry#camp_inquiry{clue_list =
                                                          NewClueList},
            NewInquiryList = lists:keystore(CampId,
                                            #camp_inquiry.camp_id,
                                            InquiryList,
                                            NewCampInquiry),
            Role#role{m_camp_inquiry =
                          MCampInquiry#m_camp_inquiry{inquiry_list =
                                                          NewInquiryList}};
        _ -> Role
    end.

giveup_quest([], Role) -> Role;
giveup_quest([QuestId | Rest], Role) ->
    logger:debug("删除任务:~w",
                 [QuestId],
                 campaign_inquiry_role,
                 349),
    case quest:giveup(QuestId, Role) of
        {ok, NewRole} -> giveup_quest(Rest, NewRole);
        _Else ->
            logger:debug("删除任务:~w失败:~w",
                         [QuestId, _Else],
                         campaign_inquiry_role,
                         354),
            giveup_quest(Rest, Role)
    end.

