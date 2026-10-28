-file("src/mod/quest/quest_filter.erl", 1).

-module(quest_filter).

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

-file("src/mod/quest/quest_filter.erl", 9).

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

-file("src/mod/quest/quest_filter.erl", 10).

-file("inc/quest.hrl", 1).

-file("inc/quest_king.hrl", 1).

-record(quest_king,
        {ver = 1,
         stage = 1,
         finish = [],
         doing = [],
         rf_times = 0}).

-file("inc/quest.hrl", 36).

-record(quest_data,
        {id = 1 :: pos_integer(),
         phase = 1 :: pos_integer(),
         quest_line = 1,
         type = 1 :: pos_integer(),
         sec_type = 1 :: pos_integer(),
         name = "" :: list(),
         mode = 1 :: pos_integer(),
         leader_cond = [] :: [tuple()],
         is_leader_quest = 0 :: 0 | 1,
         can_giveup = 0 :: 0..1,
         lev = 1 :: pos_integer(),
         lev_break_min_times = 0 :: non_neg_integer(),
         lev_break_max_times = 0 :: non_neg_integer(),
         max_lev = 0 :: non_neg_integer(),
         auto_finished_lev = 0 :: non_neg_integer(),
         classes = 0 :: 0..4,
         pre_quest ::
             undefined | non_neg_integer() | [non_neg_integer()],
         check_distance = 0 :: 0..1,
         npc_accept_battle = 0 :: non_neg_integer(),
         npc_accept_id = 0 :: non_neg_integer(),
         npc_accept = 0 :: non_neg_integer(),
         npc_commit_battle = 0 :: non_neg_integer(),
         npc_commit_id = 0 :: non_neg_integer(),
         npc_commit = 0 :: non_neg_integer(),
         start_time = 0 ::
             tuple() | non_neg_integer() | undefined,
         end_time = 0 :: tuple() | non_neg_integer() | undefined,
         condition = [] :: [tuple()],
         progress = [] :: [tuple()],
         rewards_accept = [] :: [tuple()],
         rewards_commit = [] :: [tuple()],
         commit_loss = [] :: [tuple()],
         rewards_vip = [] :: [tuple()],
         action_accept = [] :: [tuple()],
         action_commit = [] :: [tuple()],
         times = 1 :: non_neg_integer(),
         desc = "" :: list(),
         auto_accept = 0 :: 0..1,
         is_auto_finished_gain = 0 :: 0..1,
         weekdays = [] :: [pos_integer()],
         white_list = [] :: list(),
         black_list = [] :: list(),
         notice_msg = "" :: list(),
         val_from_prev = 0 :: 0..1,
         honor = 0 :: non_neg_integer(),
         ach_num = 0 :: non_neg_integer(),
         rewards_badge = 0 :: non_neg_integer(),
         day = 0 :: non_neg_integer(),
         extra = []}).

-record(quest_extra_data,
        {name = 0, classes = 0, val1 = 0, val2 = 0, list = []}).

-record(quest_classes,
        {quest_id = 0,
         first_time = 0,
         ring = 1,
         round = 0,
         total_count = 0,
         done_list = []}).

-record(quest_offer,
        {quest_id = 0,
         day_count = 0,
         leader_count = 0,
         leader_quest_count = 0,
         round = 0,
         total_count = 0,
         team_args = []}).

-record(quest_treasure,
        {quest_id = 0, round = 0, total_count = 0}).

-record(quest_guild,
        {quest_id = 0,
         last_accepted = 0,
         ring = 1,
         round = 0,
         total_count = 0,
         done_list = []}).

-record(quest_chain,
        {quest_id = 0,
         accept_time = 0,
         type = 0,
         ext_data = [],
         round = 0,
         total_count = 0,
         commit_npc}).

-record(quest_marriage,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         round = 0,
         total_count = 0,
         ext_data = quest_marriage:quest_ext_data()}).

-record(quest_couple,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         round = 0,
         total_count = 0,
         partner_id,
         ext_data = quest_couple:quest_ext_data()}).

-record(quest_prac,
        {part = 1, chapter = 2, section = 0}).

-record(quest_plant,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         unit_id = 0,
         phase = 0,
         pos = {0, 0, 0},
         done_list = []}).

-record(quest_teacher,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         partner_id,
         round = 0,
         total_count = 0,
         stats = [],
         ext_data = quest_teacher:quest_ext_data()}).

-record(quest_shipping, {list = []}).

-record(quest_pursue,
        {quest_id = 0,
         last_accepted = 0,
         round_started = 0,
         ring = 1,
         round = 0,
         total_count = 0,
         done_list = []}).

-record(quest_child,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         mode = 1,
         unit_id = 0,
         done_list = []}).

-record(quest_pregnancy,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         mode = 1,
         done_list = []}).

-record(quest_acquaintance,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         partner_id = 0,
         partner_name = "",
         done_list = [],
         ring = 0,
         rpc_accepted = 0}).

-record(quest_summer,
        {ver = 1,
         finish = [],
         doing = [],
         score = 0,
         rewarded = []}).

-record(quest_single_dog,
        {ver = 1, finish = [], round = 1, extra = #{}}).

-record(quest_sign_draw, {finish = [], doing = []}).

-record(quest_score_exchange,
        {finish = [], doing = []}).

-record(quest_long_active, {finish = [], doing = []}).

-record(m_quest,
        {ver = 19,
         quest = [] :: list(),
         acceptable = [] :: list(),
         finished = [] :: list(),
         day_finished = [],
         quest_classes = #quest_classes{} :: #quest_classes{},
         quest_offer = #quest_offer{} :: #quest_offer{},
         quest_prac = #quest_prac{} :: #quest_prac{},
         quest_treasure = #quest_treasure{},
         quest_guild = #quest_guild{},
         quest_chain = #quest_chain{},
         quest_marriage = #quest_marriage{},
         quest_couple = #quest_couple{},
         quest_plant = #quest_plant{},
         quest_teacher = #quest_teacher{},
         quest_shipping = #quest_shipping{},
         quest_pursue = #quest_pursue{},
         quest_line = 2,
         quest_child = #quest_child{},
         quest_pregnancy = #quest_pregnancy{},
         quest_acquaintance = #quest_acquaintance{},
         quest_king = #quest_king{},
         quest_summer = #quest_summer{},
         quest_single_dog = #quest_single_dog{},
         quest_sign_draw = #quest_sign_draw{},
         quest_score_exchange = #quest_score_exchange{},
         quest_long_active = #quest_long_active{}}).

-record(quest,
        {id = 1 :: pos_integer(),
         name = "" :: binary(),
         type = 1 :: pos_integer(),
         sec_type = 1 :: pos_integer(),
         finish = 0 :: 0..2,
         quality = 0 :: 0..4,
         progress = [] :: [tuple()],
         accept_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         finish_time = 0 :: non_neg_integer(),
         round = 0 :: non_neg_integer()}).

-record(quest_progress,
        {id = 0 :: non_neg_integer(),
         label :: undefined | atom(),
         target = 0 :: non_neg_integer(),
         param = [] :: list(),
         finish = 0 :: 0..1,
         trigger :: undefined | tuple(),
         target_val = 1 :: pos_integer(),
         value = 0 :: non_neg_integer(),
         msg = "" :: bitstring() | string(),
         ext_data = [] :: [tuple()],
         dyn_ext_data = [] :: [tuple()]}).

-record(quest_rewards,
        {prob = 1000 :: pos_integer(),
         classes = 0 :: 0..4,
         gain :: undefined | tuple(),
         action :: undefined | function()}).

-record(quest_stats,
        {sec_type = 1, stats = [], desc = []}).

-file("src/mod/quest/quest_filter.erl", 11).

-type check_label() :: classes |
                       lev |
                       accepted |
                       pre_quest |
                       accept_cond |
                       time |
                       week |
                       srv.

-record(filter_acc,
        {main_and_side = [], prac = [], classes_cyc = []}).

-export([accept_list/1,
         check/2,
         check/3,
         filter_list/3]).

-spec accept_list(#role{}) -> #role{}.

accept_list(Role = #role{m_quest =
                             #m_quest{finished = Finished, quest = Quests}}) ->
    Lev = lev_break:lev(Role),
    L = lev_list(Lev, []),
    DoingL = [Id || #quest{id = Id} <- Quests],
    L1 = L -- Finished,
    L2 = L1 -- DoingL,
    FilterAcc = filter(L2, Role, #filter_acc{}),
    {ok,
     NewFilterAcc = #filter_acc{main_and_side = MAndS},
     TrueAcc,
     FilterRole = #role{m_quest = MQuest}} =
        filter_special([4, 5, 6], FilterAcc, [], Role),
    Acceptable = merge_acceptable(TrueAcc,
                                  NewFilterAcc,
                                  MAndS),
    NRole = FilterRole#role{m_quest =
                                MQuest#m_quest{acceptable = Acceptable}},
    auto_finished(NRole).

auto_finished(Role = #role{m_quest =
                               #m_quest{finished = Finished, quest = Quests,
                                        acceptable = Acceptable,
                                        quest_line = QuestLine}}) ->
    Lev = lev_break:lev(Role),
    L = lev_auto_finished_list(Lev, []),
    DoingL = [Id || #quest{id = Id} <- Quests],
    L1 = L -- Finished,
    L2 = L1 -- DoingL,
    NewL = L2,
    DataL3 = quest_line_filter(NewL, QuestLine, []),
    DataL4 = filter_auto_finished(DataL3,
                                  NewL,
                                  pre_quest,
                                  []),
    DataL5 = filter_auto_finished(DataL4,
                                  DoingL,
                                  pre_quest,
                                  []),
    DataL6 = filter_auto_finished(DataL5,
                                  Acceptable,
                                  pre_quest,
                                  []),
    MainQuests = [Quest
                  || Quest = #quest{sec_type = 1} <- Quests],
    DataL7 = filter_auto_finished(DataL6,
                                  MainQuests,
                                  phase,
                                  []),
    CfgL1 = [quest_data:get(QuestId)
             || QuestId <- Acceptable],
    ACfgL = [Cfg
             || Cfg = #quest_data{sec_type = 1} <- CfgL1],
    DataL8 = filter_auto_finished(DataL7, ACfgL, phase, []),
    DataL = filter_auto_finished(DataL8,
                                 Finished,
                                 phase,
                                 []),
    logger:debug("[~ts]默认完成等级的任务[A:~w][D:~w][F:~w][NewL:~w][Dat"
                 "aL:~w]",
                 [Role#role.name,
                  Acceptable,
                  DoingL,
                  Finished,
                  NewL,
                  DataL],
                 quest_filter,
                 74),
    case DataL of
        [_ | _] ->
            {ok, NewRole} = quest:handle_auto_finished(DataL, Role),
            quest:flush(NewRole, push);
        _ -> Role
    end.

quest_line_filter([], _Line, QuestList) -> QuestList;
quest_line_filter([QuestId | T], Line, QuestList) ->
    case quest_data:get(QuestId) of
        Quest = #quest_data{quest_line = QuestLine1}
            when QuestLine1 =:= Line orelse QuestLine1 =:= 0 ->
            quest_line_filter(T, Line, [Quest | QuestList]);
        _ -> quest_line_filter(T, Line, QuestList)
    end.

filter_auto_finished([], _L, _Label, Acc) -> Acc;
filter_auto_finished([Data = #quest_data{} | Rest], L,
                     Label = pre_quest, Acc) ->
    Bool = case Data of
               #quest_data{pre_quest = [0 | PreQuest]} ->
                   pre_quest_check(one, PreQuest, L);
               #quest_data{pre_quest = PreQuest = [_ | _]} ->
                   pre_quest_check(one, PreQuest, L);
               _ -> true
           end,
    NewAcc = case Bool of
                 false -> [Data | Acc];
                 _ -> Acc
             end,
    filter_auto_finished(Rest, L, Label, NewAcc);
filter_auto_finished(List, [], phase, _Acc) -> List;
filter_auto_finished([Data = #quest_data{phase = Phase,
                                         id = Id, sec_type = 1}
                      | Rest],
                     L, Label = phase, Acc) ->
    List1 = case L of
                [#quest{} | _] ->
                    CfgL = [quest_data:get(QuestId)
                            || #quest{id = QuestId} <- L],
                    [1
                     || #quest_data{phase = PhaseCfg, id = IdCfg} <- CfgL,
                        PhaseCfg < Phase, Id =/= IdCfg];
                [#quest_data{} | _] ->
                    [1
                     || #quest_data{phase = PhaseCfg, id = IdCfg} <- L,
                        PhaseCfg < Phase, Id =/= IdCfg];
                _ ->
                    CfgL = [quest_data:get(QuestId) || QuestId <- L],
                    case [1
                          || #quest_data{phase = PhaseCfg} <- CfgL,
                             PhaseCfg > Phase]
                        of
                        [] -> [1];
                        _ -> []
                    end
            end,
    NewAcc = case List1 of
                 [] -> [Data | Acc];
                 _ -> Acc
             end,
    filter_auto_finished(Rest, L, Label, NewAcc);
filter_auto_finished([_ | Rest], L, Label, Acc) ->
    filter_auto_finished(Rest, L, Label, Acc).

-spec filter_list(SecType :: pos_integer,
                  All :: [pos_integer()], #role{}) -> [] |
                                                      [pos_integer()].

filter_list(4, All, Role) ->
    #filter_acc{classes_cyc = Cyc} = filter(All,
                                            Role,
                                            #filter_acc{}),
    Cyc;
filter_list(_Type, _All, _Role) -> [].

-spec check(#quest_data{} | integer(),
            #role{}) -> boolean().

-spec check(#quest_data{}, Steps :: check_label(),
            #role{}) -> boolean().

check(QuestData = #quest_data{}, Role) ->
    check(QuestData,
          [classes, lev, pre_quest, accept_cond, time, week, srv],
          Role);
check(QuestId, Role) when is_integer(QuestId) ->
    case quest_data:get(QuestId) of
        QuestData = #quest_data{} ->
            check(QuestData,
                  [classes, lev, pre_quest, accept_cond, time, week, srv],
                  Role);
        _False -> false
    end.

check(QuestData = #quest_data{sec_type = 1}, Steps,
      Role) ->
    check_cond(Steps, QuestData, Role);
check(QuestData = #quest_data{sec_type = 2}, Steps,
      Role) ->
    check_cond(Steps, QuestData, Role);
check(QuestData = #quest_data{sec_type = 3}, Steps,
      Role) ->
    check_cond(Steps, QuestData, Role);
check(QuestData = #quest_data{sec_type = 5}, Steps,
      Role) ->
    check_cond(Steps, QuestData, Role);
check(QuestData = #quest_data{sec_type = 6}, Steps,
      Role) ->
    check_cond(Steps, QuestData, Role);
check(QuestData = #quest_data{}, Steps, Role) ->
    check_cond(Steps, QuestData, Role);
check(_, _, _) ->
    logger:error("未知任务类型", [], quest_filter, 164),
    false.

lev_list(0, L) -> L;
lev_list(Lev, L) ->
    L1 = quest_data:lev_list(Lev),
    lev_list(Lev - 1, lists:flatten([L1, L])).

lev_auto_finished_list(0, L) -> L;
lev_auto_finished_list(Lev, L) ->
    L1 = quest_data:lev_auto_finished(Lev),
    lev_auto_finished_list(Lev - 1, L1 ++ L).

-spec filter(Ids, Role,
             FilterAcc) -> NewFilterAcc when Ids :: [pos_integer()],
                                             Role :: #role{},
                                             FilterAcc :: #filter_acc{},
                                             NewFilterAcc :: #filter_acc{}.

filter([], _Role, NewFilterAcc) -> NewFilterAcc;
filter([Id | Rest], Role, FilterAcc) ->
    case quest_data:get(Id) of
        {error, Reason} ->
            logger:error("不存在任务[~w]的配置数据: ~w",
                         [Id, Reason],
                         quest_filter,
                         202),
            filter(Rest, Role, FilterAcc);
        QuestData = #quest_data{sec_type = Type} ->
            case filter_check(Type, QuestData, Role) of
                true ->
                    NewFilterAcc = add_filter_acc(Type, Id, FilterAcc),
                    filter(Rest, Role, NewFilterAcc);
                false -> filter(Rest, Role, FilterAcc);
                _Other -> filter(Rest, Role, FilterAcc)
            end
    end.

add_filter_acc(1, Id,
               FilterAcc = #filter_acc{main_and_side = MAndS}) ->
    FilterAcc#filter_acc{main_and_side = [Id | MAndS]};
add_filter_acc(2, Id,
               FilterAcc = #filter_acc{main_and_side = MAndS}) ->
    FilterAcc#filter_acc{main_and_side = [Id | MAndS]};
add_filter_acc(13, Id,
               FilterAcc = #filter_acc{main_and_side = MAndS}) ->
    FilterAcc#filter_acc{main_and_side = [Id | MAndS]};
add_filter_acc(4, Id,
               FilterAcc = #filter_acc{classes_cyc = Cyc}) ->
    FilterAcc#filter_acc{classes_cyc = [Id | Cyc]};
add_filter_acc(5, Id,
               FilterAcc = #filter_acc{prac = Prac}) ->
    FilterAcc#filter_acc{prac = [Id | Prac]};
add_filter_acc(6, Id,
               FilterAcc = #filter_acc{prac = Prac}) ->
    FilterAcc#filter_acc{prac = [Id | Prac]};
add_filter_acc(26, Id,
               FilterAcc = #filter_acc{prac = Prac}) ->
    FilterAcc#filter_acc{prac = [Id | Prac]};
add_filter_acc(_Type, _Id, FilterAcc) -> FilterAcc.

filter_check(1, QuestData, Role) ->
    check_cond([classes,
                lev,
                lev_break,
                pre_quest,
                accept_cond,
                time,
                week,
                srv],
               QuestData,
               Role);
filter_check(2, QuestData, Role) ->
    check_cond([classes,
                lev,
                lev_break,
                pre_quest,
                accept_cond,
                time,
                week,
                srv],
               QuestData,
               Role);
filter_check(13, QuestData, Role) ->
    check_cond([classes,
                lev,
                lev_break,
                pre_quest,
                accept_cond,
                time,
                week,
                srv],
               QuestData,
               Role);
filter_check(3, QuestData, Role) ->
    check_cond([classes,
                lev,
                lev_break,
                pre_quest,
                accept_cond,
                time,
                week,
                srv],
               QuestData,
               Role);
filter_check(4, QuestData, Role) ->
    check_cond([classes,
                lev,
                lev_break,
                pre_quest,
                accept_cond,
                time,
                week,
                srv],
               QuestData,
               Role);
filter_check(5, QuestData, Role) ->
    check_cond([classes,
                lev,
                lev_break,
                pre_quest,
                accept_cond,
                time,
                week,
                srv],
               QuestData,
               Role);
filter_check(6, QuestData, Role) ->
    check_cond([classes,
                lev,
                lev_break,
                pre_quest,
                accept_cond,
                time,
                week,
                srv],
               QuestData,
               Role);
filter_check(26, QuestData, Role) ->
    check_cond([classes,
                lev,
                lev_break,
                pre_quest,
                accept_cond,
                time,
                week,
                srv],
               QuestData,
               Role);
filter_check(_Type, _QuestData, _Role) -> false.

filter_special([], FilterAcc, TrueAcc, Role) ->
    {ok, FilterAcc, TrueAcc, Role};
filter_special([SecType | RestTypes], FilterAcc,
               TrueAcc, Role) ->
    case filter_special(SecType, FilterAcc, Role) of
        ok ->
            filter_special(RestTypes,
                           FilterAcc,
                           [SecType | TrueAcc],
                           Role);
        {ok, NewFilterAcc = #filter_acc{}} ->
            filter_special(RestTypes,
                           NewFilterAcc,
                           [SecType | TrueAcc],
                           Role);
        {ok, NewRole = #role{}} ->
            filter_special(RestTypes,
                           FilterAcc,
                           [SecType | TrueAcc],
                           NewRole);
        {ok, NewFilterAcc, NewRole} ->
            filter_special(RestTypes,
                           NewFilterAcc,
                           [SecType | TrueAcc],
                           NewRole);
        false ->
            filter_special(RestTypes, FilterAcc, TrueAcc, Role)
    end.

filter_special(4,
               FilterAcc = #filter_acc{classes_cyc = Cyc}, Role) ->
    case quest_classes:check_cond(Role, Cyc) of
        {ok, NewRole} ->
            {ok, FilterAcc#filter_acc{classes_cyc = []}, NewRole};
        {ok, NewRole, Id} ->
            {ok, FilterAcc#filter_acc{classes_cyc = [Id]}, NewRole};
        _ -> false
    end;
filter_special(5, #filter_acc{prac = Prac}, Role) ->
    case quest_prac:check_cond(Role, Prac) of
        ok -> ok;
        false -> false
    end;
filter_special(6, #filter_acc{prac = Prac}, Role) ->
    case quest_prac:check_cond(Role, Prac) of
        ok -> ok;
        false -> false
    end;
filter_special(_SecType, _FilterAcc, _Role) -> false.

merge_acceptable([], _FilterAcc, Acceptable) ->
    Acceptable;
merge_acceptable([SecType | RestTypes], FilterAcc,
                 Acc) ->
    NewAcc = merge_acceptable(SecType, FilterAcc, Acc),
    merge_acceptable(RestTypes, FilterAcc, NewAcc);
merge_acceptable(4, #filter_acc{classes_cyc = Cyc},
                 Acc) ->
    lists:flatten([Cyc, Acc]);
merge_acceptable(5, #filter_acc{prac = Prac}, Acc) ->
    lists:flatten([Prac, Acc]);
merge_acceptable(_Type, _FilterAcc, Acc) -> Acc.

-spec check_cond(Labels, QuestData, Role) -> boolean() |
                                             {false,
                                              ErrMsg :: string()} when Labels ::
                                                                           check_label(),
                                                                       QuestData ::
                                                                           #quest_data{},
                                                                       Role ::
                                                                           #role{}.

check_cond([], _QuestData, _Role) -> true;
check_cond([Label | Rest], QuestData, Role) ->
    case check_cond(Label, QuestData, Role) of
        true -> check_cond(Rest, QuestData, Role);
        false -> false
    end;
check_cond(classes, #quest_data{classes = NeedClasses},
           #role{classes = RoleClasses}) ->
    RoleClasses =:= NeedClasses orelse NeedClasses =:= 0;
check_cond(accepted, #quest_data{id = Id},
           #role{m_quest = #m_quest{quest = Quests}}) ->
    lists:keyfind(Id, #quest.id, Quests) =:= false;
check_cond(pre_quest,
           #quest_data{pre_quest = [0 | PreQuest]},
           #role{m_quest = #m_quest{finished = Finished}}) ->
    pre_quest_check(all, PreQuest, Finished);
check_cond(pre_quest,
           #quest_data{pre_quest = PreQuest = [_ | _]},
           #role{m_quest = #m_quest{finished = Finished}}) ->
    pre_quest_check(one, PreQuest, Finished);
check_cond(pre_quest, _QuestData, _Role) -> true;
check_cond(accept_cond, #quest_data{condition = Conds},
           Role) ->
    role_cond:check(Conds, Role) =:= true;
check_cond(lev,
           #quest_data{lev = MinLev, max_lev = MaxLev}, Role) ->
    RoleLev = lev_break:lev(Role),
    RoleLev >= MinLev andalso
        (RoleLev =< MaxLev orelse MaxLev =:= 0);
check_cond(lev_break,
           #quest_data{lev_break_min_times = MinLevBreak,
                       lev_break_max_times = MaxLevBreak},
           Role) ->
    LevBreakTimes = lev_break:get_times(Role),
    LevBreakTimes >= MinLevBreak andalso
        LevBreakTimes =< MaxLevBreak;
check_cond(time,
           #quest_data{id = _Id, start_time = ST, end_time = ET},
           _Role) ->
    {StartT, EndT} = date:parse_time(ST, ET),
    quest:set_check_timer([StartT, EndT]),
    Now = date:unixtime(),
    Now >= StartT andalso (Now < EndT orelse EndT =:= 0);
check_cond(week, #quest_data{weekdays = WeedDays},
           _Role) ->
    Week = date:day_of_the_week(date:unixtime()),
    WeedDays =:= [] orelse lists:member(Week, WeedDays);
check_cond(srv, Data, Role) -> check_srv(Role, Data);
check_cond(_Label, _QuestData, _Role) ->
    logger:error("查找不到标签：~w", [_Label], quest_filter, 374),
    false.

pre_quest_check(all, [], _Finished) -> true;
pre_quest_check(one, [], _Finished) -> false;
pre_quest_check(one = Label, [H | T], Finished) ->
    case lists:member(H, Finished) of
        true -> true;
        _ -> pre_quest_check(Label, T, Finished)
    end;
pre_quest_check(all = Label, [H | T], Finished) ->
    case lists:member(H, Finished) of
        false -> false;
        _ -> pre_quest_check(Label, T, Finished)
    end.

check_srv(_Role,
          #quest_data{white_list = [], black_list = []}) ->
    true;
check_srv(#role{platform = P, zone_id = Z},
          #quest_data{white_list = WhiteL,
                      black_list = BlackL}) ->
    check_srv(P, Z, WhiteL, white) andalso
        check_srv(P, Z, BlackL, black).

check_srv(_P, _Z, [], _) -> true;
check_srv(P, Z, L, white) ->
    [1 || {P1, Z1} <- L, P =:= P1, Z =:= Z1 orelse Z1 =:= 0]
        =/= [];
check_srv(P, Z, L, black) ->
    [1 || {P1, Z1} <- L, P =:= P1, Z =:= Z1 orelse Z1 =:= 0]
        =:= [].

