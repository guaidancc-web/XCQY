-file("src/mod/wing/wing_ver.erl", 1).

-module(wing_ver).

-export([do/1, get_wing_ids/2, get_wing_group/1]).

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

-file("src/mod/wing/wing_ver.erl", 16).

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

-file("src/mod/wing/wing_ver.erl", 17).

-file("inc/wing.hrl", 1).

-record(m_wing,
        {ver = 11 :: pos_integer(),
         grade = 0 :: non_neg_integer(),
         growth = 0,
         enhance_num = 0,
         wing_id = 0,
         plot_wing_id = 0,
         expiry = [],
         tmp_grade = 0 :: non_neg_integer(),
         tmp_growth = 0,
         tmp_wing_id = 0,
         star_lev = 1 :: non_neg_integer(),
         valid_plan = 1,
         plan_data = [] :: list(),
         change_times = 0,
         reset_times = 0,
         lev_break_skill = [],
         wing_ids = [],
         exp = 0,
         old_grade = 0,
         old_star = 0,
         appearance_list = [],
         speed = 1,
         wing_group_list = [],
         wing_power = 100}).

-record(wing_skill_plan,
        {index = 1,
         plan_name = [] :: list(),
         skills = [],
         tmp_skills = []}).

-record(wing_lev_break_skill,
        {ver = 1,
         skill_grade = 0,
         skill_id = 0,
         skill_lev = 0,
         skill_val = 0}).

-record(wing_skill,
        {ver = 1, key = {0, 0}, id = 0, lev = 0, is_lock = 0}).

-record(wing_lock_data,
        {grade = 0, max = 0, item_list = []}).

-record(wing_appearance,
        {id = 0,
         time = 0,
         timeout = 0,
         grade = 0,
         star_lev = 0}).

-record(wing_base_group,
        {group_id = 0,
         need_grade = 0,
         wing_ids = [],
         grades = [],
         loss_item = []}).

-record(wing_group,
        {ver = 1,
         group_id = 0,
         wing_ids = [],
         wing_times = 0,
         rewarded = 0}).

-file("src/mod/wing/wing_ver.erl", 18).

do({m_wing,
    Ver,
    Grade,
    Growth,
    EnhanceNum,
    WingId,
    PlotWingId,
    Expiry}) ->
    do({m_wing,
        Ver + 1,
        Grade,
        Growth,
        EnhanceNum,
        WingId,
        PlotWingId,
        Expiry,
        0,
        0,
        0});
do({m_wing,
    Ver,
    Grade,
    Growth,
    EnhanceNum,
    WingId,
    PlotWingId,
    Expiry,
    TmpGrade,
    TmpGrowth,
    TmpWingId}) ->
    Star = 0,
    TmpSkllls = [],
    Skills = [],
    do({m_wing,
        Ver + 1,
        Grade,
        Growth,
        EnhanceNum,
        WingId,
        PlotWingId,
        Expiry,
        TmpGrade,
        TmpGrowth,
        TmpWingId,
        Star,
        Skills,
        TmpSkllls});
do({m_wing,
    Ver = 3,
    Grade,
    Growth,
    EnhanceNum,
    WingId,
    PlotWingId,
    Expiry,
    TmpGrade,
    TmpGrowth,
    TmpWingId,
    Star,
    Skills,
    TmpSkllls}) ->
    NewVer = Ver + 1,
    ValidPlan = 1,
    PlanData = [{wing_skill_plan,
                 1,
                 "",
                 Skills,
                 TmpSkllls}],
    ChangeTimes = 0,
    do({m_wing,
        NewVer,
        Grade,
        Growth,
        EnhanceNum,
        WingId,
        PlotWingId,
        Expiry,
        TmpGrade,
        TmpGrowth,
        TmpWingId,
        Star,
        ValidPlan,
        PlanData,
        ChangeTimes});
do({m_wing,
    Ver = 4,
    Grade,
    Growth,
    EnhanceNum,
    WingId,
    PlotWingId,
    Expiry,
    TmpGrade,
    TmpGrowth,
    TmpWingId,
    Star,
    ValidPlan,
    PlanData,
    ChangeTimes}) ->
    NewVer = Ver + 1,
    ResetTimes = 0,
    do({m_wing,
        NewVer,
        Grade,
        Growth,
        EnhanceNum,
        WingId,
        PlotWingId,
        Expiry,
        TmpGrade,
        TmpGrowth,
        TmpWingId,
        Star,
        ValidPlan,
        PlanData,
        ChangeTimes,
        ResetTimes});
do({m_wing,
    Ver = 5,
    Grade,
    Growth,
    EnhanceNum,
    WingId,
    PlotWingId,
    Expiry,
    TmpGrade,
    TmpGrowth,
    TmpWingId,
    Star,
    ValidPlan,
    PlanData,
    ChangeTimes,
    ResetTimes}) ->
    NewVer = Ver + 1,
    LevBreakSkill = [],
    do({m_wing,
        NewVer,
        Grade,
        Growth,
        EnhanceNum,
        WingId,
        PlotWingId,
        Expiry,
        TmpGrade,
        TmpGrowth,
        TmpWingId,
        Star,
        ValidPlan,
        PlanData,
        ChangeTimes,
        ResetTimes,
        LevBreakSkill});
do({m_wing,
    Ver = 6,
    Grade,
    Growth,
    EnhanceNum,
    _WingId,
    PlotWingId,
    Expiry,
    TmpGrade,
    TmpGrowth,
    TmpWingId,
    Star,
    ValidPlan,
    PlanData,
    ChangeTimes,
    ResetTimes,
    LevBreakSkill}) ->
    NewVer = Ver + 1,
    case wing_data:get_star_to_lev({Grade, Star, Growth}) of
        {NewGrade, NewLev} ->
            {LastWingId, WingIds} = get_wing_ids(NewGrade, NewLev),
            do({m_wing,
                NewVer,
                NewGrade,
                Growth,
                EnhanceNum,
                LastWingId,
                PlotWingId,
                Expiry,
                TmpGrade,
                TmpGrowth,
                TmpWingId,
                NewLev,
                ValidPlan,
                PlanData,
                ChangeTimes,
                ResetTimes,
                LevBreakSkill,
                WingIds,
                0,
                Grade,
                Star});
        _ when Grade =:= 0 ->
            logger:info("翅膀转换 等阶~w 星级 ~w, 成长 ~w",
                        [Grade, Star, Growth],
                        wing_ver,
                        49),
            {LastWingId, WingIds} = get_wing_ids(Grade,
                                                 max(1, Star)),
            do({m_wing,
                NewVer,
                Grade,
                Growth,
                EnhanceNum,
                LastWingId,
                PlotWingId,
                Expiry,
                TmpGrade,
                TmpGrowth,
                TmpWingId,
                max(1, Star),
                ValidPlan,
                PlanData,
                ChangeTimes,
                ResetTimes,
                LevBreakSkill,
                WingIds,
                0,
                Grade,
                Star});
        _ ->
            logger:error("翅膀版本转换出错：~w",
                         [{Grade, Star, Growth}],
                         wing_ver,
                         53),
            {false, lang:get("翅膀版本转换出错")}
    end;
do({m_wing,
    Ver = 7,
    Grade,
    Growth,
    EnhanceNum,
    WingId,
    PlotWingId,
    Expiry,
    TmpGrade,
    TmpGrowth,
    TmpWingId,
    Star,
    ValidPlan,
    PlanData,
    ChangeTimes,
    ResetTimes,
    LevBreakSkill,
    WingIds,
    Exp,
    OldGrade,
    OldStar}) ->
    NewVer = Ver + 1,
    Fun = fun (WLBS = #wing_lev_break_skill{skill_grade =
                                                SkillGrade},
               Acc) ->
                  case SkillGrade of
                      7 ->
                          logger:debug("翅膀技能等阶需要转换的", [], wing_ver, 61),
                          [WLBS#wing_lev_break_skill{skill_grade = 15} | Acc];
                      _ ->
                          logger:debug("翅膀技能等阶不需要转换的 ~w",
                                       [SkillGrade],
                                       wing_ver,
                                       64),
                          [WLBS | Acc]
                  end
          end,
    NewLevBreakSkill = lists:foldl(Fun, [], LevBreakSkill),
    do({m_wing,
        NewVer,
        Grade,
        Growth,
        EnhanceNum,
        WingId,
        PlotWingId,
        Expiry,
        TmpGrade,
        TmpGrowth,
        TmpWingId,
        Star,
        ValidPlan,
        PlanData,
        ChangeTimes,
        ResetTimes,
        NewLevBreakSkill,
        WingIds,
        Exp,
        OldGrade,
        OldStar});
do({m_wing,
    Ver = 8,
    Grade,
    Growth,
    EnhanceNum,
    WingId,
    PlotWingId,
    Expiry,
    TmpGrade,
    TmpGrowth,
    TmpWingId,
    Star,
    ValidPlan,
    PlanData,
    ChangeTimes,
    ResetTimes,
    LevBreakSkill,
    WingIds,
    Exp,
    OldGrade,
    OldStar}) ->
    NewVer = Ver + 1,
    AppearanceList = [],
    do({m_wing,
        NewVer,
        Grade,
        Growth,
        EnhanceNum,
        WingId,
        PlotWingId,
        Expiry,
        TmpGrade,
        TmpGrowth,
        TmpWingId,
        Star,
        ValidPlan,
        PlanData,
        ChangeTimes,
        ResetTimes,
        LevBreakSkill,
        WingIds,
        Exp,
        OldGrade,
        OldStar,
        AppearanceList});
do({m_wing,
    Ver = 9,
    Grade,
    Growth,
    EnhanceNum,
    WingId,
    PlotWingId,
    Expiry,
    TmpGrade,
    TmpGrowth,
    TmpWingId,
    Star,
    ValidPlan,
    PlanData,
    ChangeTimes,
    ResetTimes,
    LevBreakSkill,
    WingIds,
    Exp,
    OldGrade,
    OldStar,
    AppearanceList}) ->
    NewVer = Ver + 1,
    Speed = 1,
    do({m_wing,
        NewVer,
        Grade,
        Growth,
        EnhanceNum,
        WingId,
        PlotWingId,
        Expiry,
        TmpGrade,
        TmpGrowth,
        TmpWingId,
        Star,
        ValidPlan,
        PlanData,
        ChangeTimes,
        ResetTimes,
        LevBreakSkill,
        WingIds,
        Exp,
        OldGrade,
        OldStar,
        AppearanceList,
        Speed});
do({m_wing,
    Ver = 10,
    Grade,
    Growth,
    EnhanceNum,
    WingId,
    PlotWingId,
    Expiry,
    TmpGrade,
    TmpGrowth,
    TmpWingId,
    Star,
    ValidPlan,
    PlanData,
    ChangeTimes,
    ResetTimes,
    LevBreakSkill,
    WingIds,
    Exp,
    OldGrade,
    OldStar,
    AppearanceList,
    Speed}) ->
    NewVer = Ver + 1,
    WingGroup = get_wing_group(WingIds),
    WingPower = 100,
    do({m_wing,
        NewVer,
        Grade,
        Growth,
        EnhanceNum,
        WingId,
        PlotWingId,
        Expiry,
        TmpGrade,
        TmpGrowth,
        TmpWingId,
        Star,
        ValidPlan,
        PlanData,
        ChangeTimes,
        ResetTimes,
        LevBreakSkill,
        WingIds,
        Exp,
        OldGrade,
        OldStar,
        AppearanceList,
        Speed,
        WingGroup,
        WingPower});
do(Data = #m_wing{ver = 11, plan_data = PlanData,
                  wing_group_list = WingGroups}) ->
    case skill_plan(PlanData, []) of
        {ok, NewPlanData} ->
            case convert_wing_group(WingGroups, []) of
                {ok, NewWingGroups} ->
                    {ok,
                     Data#m_wing{plan_data = NewPlanData,
                                 wing_group_list = NewWingGroups}};
                {false, Reason} -> {false, Reason};
                _ -> {false, lang:get("翅膀分组版本转换出错")}
            end;
        {false, Reason} -> {false, Reason}
    end;
do(Data) ->
    logger:error("翅膀版本转换出错：~w", [Data], wing_ver, 99),
    {false, lang:get("翅膀版本转换出错：")}.

skill_plan([], List) -> {ok, lists:reverse(List)};
skill_plan([I = #wing_skill_plan{skills = Skills,
                                 tmp_skills = TmpSkills}
            | T],
           List) ->
    case skill(Skills, []) of
        {ok, NSkills} ->
            case skill(TmpSkills, []) of
                {ok, NTSkills} ->
                    skill_plan(T,
                               [I#wing_skill_plan{skills = NSkills,
                                                  tmp_skills = NTSkills}
                                | List]);
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end.

skill([], List) -> {ok, List};
skill([I | T], List) ->
    case skill(I) of
        {ok, Skill} -> skill(T, [Skill | List]);
        {false, Reason} -> {false, Reason}
    end.

skill({Skill, Lev}) ->
    skill({wing_skill, 1, {Skill, Lev}, Skill, Lev, 0});
skill(Data = #wing_skill{ver = 1}) -> {ok, Data};
skill(_Err) ->
    logger:error("翅膀技能版本转换出错：~w", [_Err], wing_ver, 133),
    {false, lang:get("翅膀技能版本转换出错")}.

get_wing_ids(Grade, Lev) when Grade =:= 0 ->
    case do_get_wing_ids(Grade, lists:seq(1, Lev), []) of
        [Id | _] = WingIds -> {Id, WingIds};
        _ -> {0, []}
    end;
get_wing_ids(Grade, Lev) ->
    Ids = do_get_wing_ids(lists:seq(0, Grade - 1), []),
    case do_get_wing_ids(Grade, lists:seq(1, Lev), []) of
        [Id | _] = WingIds ->
            logger:debug("=========== ~w ~w",
                         [Ids, WingIds],
                         wing_ver,
                         148),
            {Id, WingIds ++ Ids};
        _ ->
            case Ids of
                [Id | _] ->
                    logger:debug("=========== ~w ~w",
                                 [Id, Ids],
                                 wing_ver,
                                 153),
                    {Id, Ids};
                _ -> {0, []}
            end
    end.

do_get_wing_ids([], Result) -> Result;
do_get_wing_ids([Grade | T], Result) ->
    Levs = wing_data:get_wing_grade_lev(Grade),
    Ids = do_get_wing_ids(Grade, Levs, []),
    do_get_wing_ids(T, Ids ++ Result).

do_get_wing_ids(_Grade, [], Result) -> Result;
do_get_wing_ids(Grade, [Lev | T], Result) ->
    case wing_data:get_wing_id({Grade, Lev}) of
        Id when is_integer(Id) ->
            do_get_wing_ids(Grade, T, [Id | Result]);
        _ -> do_get_wing_ids(Grade, T, Result)
    end.

get_wing_group(WingIDs) ->
    case wing_data:get_wing_group_ids() of
        [_ | _] = GroupList ->
            Fun = fun (GroupID, Acc) ->
                          case wing_data:get_wing_group_info(GroupID) of
                              #wing_base_group{wing_ids = WingGroupIDs} ->
                                  NewWingGroupIDs = [ID
                                                     || {ID, _, _}
                                                            <- WingGroupIDs],
                                  IDList = NewWingGroupIDs --
                                               NewWingGroupIDs -- WingIDs,
                                  case IDList of
                                      [_ | _] ->
                                          WingGroup = #wing_group{group_id =
                                                                      GroupID,
                                                                  wing_ids =
                                                                      IDList,
                                                                  wing_times =
                                                                      0},
                                          [WingGroup | Acc];
                                      _ -> Acc
                                  end;
                              _ -> Acc
                          end
                  end,
            lists:foldl(Fun, [], GroupList);
        _ -> []
    end.

convert_wing_group([], List) ->
    {ok, lists:reverse(List)};
convert_wing_group([H | T], List) ->
    case wing_group(H) of
        {ok, WingGroup} ->
            convert_wing_group(T, [WingGroup | List]);
        {false, Reason} -> {false, Reason}
    end.

wing_group({wing_group, GroupID, WingIDs, WingTimes}) ->
    wing_group({wing_group,
                1,
                GroupID,
                WingIDs,
                WingTimes,
                0});
wing_group(D = #wing_group{ver = 1}) -> {ok, D};
wing_group(_D) ->
    logger:error("翅膀分组版本转换失败~w", [_D], wing_ver, 214),
    {false, lang:get("翅膀分组版本转换失败")}.

