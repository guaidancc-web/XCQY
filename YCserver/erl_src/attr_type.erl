-file("src/mod/attr/attr_type.erl", 1).

-module(attr_type).

-export([calc/3,
         merge_attr/2,
         to_attr/1,
         to_attr/2,
         to_attr/3,
         to_attr/4,
         do_attr/2]).

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

-file("src/mod/attr/attr_type.erl", 18).

-file("inc/attr.hrl", 1).

-record(attr_base,
        {type = 0 :: non_neg_integer(),
         name = 0 :: pos_integer(),
         flag = 0 :: non_neg_integer(),
         calc_type = 0 :: non_neg_integer(),
         val = 0 :: non_neg_integer()}).

-record(attr,
        {ver = 3,
         fc = 0 :: non_neg_integer(),
         speed = 260 :: pos_integer(),
         hp_max = 0 :: non_neg_integer(),
         mp_max = 0 :: non_neg_integer(),
         atk_speed = 0 :: non_neg_integer(),
         phy_dmg = 0 :: non_neg_integer(),
         magic_dmg = 0 :: non_neg_integer(),
         phy_def = 0 :: non_neg_integer(),
         magic_def = 0 :: non_neg_integer(),
         crit = 0 :: non_neg_integer(),
         tenacity = 0 :: non_neg_integer(),
         accuracy = 0 :: non_neg_integer(),
         evasion = 0 :: non_neg_integer(),
         holy_dmg = 0 :: non_neg_integer(),
         crit_dmg = 0 :: non_neg_integer(),
         crit_dmg_def = 0 :: non_neg_integer(),
         dmg_ratio = 0 :: non_neg_integer(),
         def_ratio = 0 :: non_neg_integer(),
         enhance_control = 0 :: non_neg_integer(),
         anti_control = 0 :: non_neg_integer(),
         escape = 0 :: non_neg_integer(),
         anti_escape = 0 :: non_neg_integer(),
         capture = 0 :: non_neg_integer(),
         phy_def_ratio = 0 :: non_neg_integer(),
         magic_def_ratio = 0 :: non_neg_integer(),
         phy_accuracy = 0 :: non_neg_integer(),
         magic_accuracy = 0 :: non_neg_integer(),
         phy_evasion = 0 :: non_neg_integer(),
         magic_evasion = 0 :: non_neg_integer(),
         phy_crit = 0 :: non_neg_integer(),
         magic_crit = 0 :: non_neg_integer(),
         phy_tenacity = 0 :: non_neg_integer(),
         magic_tenacity = 0 :: non_neg_integer(),
         heal_val = 0 :: non_neg_integer(),
         heal_ratio = 0 :: non_neg_integer(),
         eff_heal_ratio = 0 :: non_neg_integer(),
         phy_dmg_ratio = 0 :: non_neg_integer(),
         magic_dmg_ratio = 0 :: non_neg_integer(),
         strength = 0,
         constitution = 0,
         magic = 0,
         agility = 0,
         endurance = 0,
         exp_ratio = 0}).

-record(attr_calc,
        {attr :: undefined | #attr{},
         attr_no_ratio :: undefined | #attr{},
         ratio :: undefined | #attr{},
         attr_no_fc :: undefined | #attr{},
         ratio_no_fc :: undefined | #attr{}}).

-record(m_attr_point,
        {ver = 2,
         ext_point = [],
         first_free = 0,
         valid_plan = 1,
         plan_data = [],
         change_plan_times = 0}).

-record(attr_point_plan,
        {index = 1 :: pos_integer(),
         plan_name = [],
         strength = 0 :: pos_integer(),
         constitution = 0 :: non_neg_integer(),
         magic = 0 :: non_neg_integer(),
         agility = 0 :: non_neg_integer(),
         endurance = 0 :: non_neg_integer(),
         pre_str = 0,
         pre_con = 0,
         pre_magic = 0,
         pre_agi = 0,
         pre_end = 0}).

-file("src/mod/attr/attr_type.erl", 19).

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

-file("src/mod/attr/attr_type.erl", 20).

-spec calc(Atom, #attr_calc{},
           #role{}) -> #attr_calc{} when Atom :: base |
                                                 atom() |
                                                 [atom()].

calc([], Ac, _Role) -> Ac;
calc(_L = [Label | T], Ac, Role) ->
    NewAc = calc(Label, Ac, Role),
    calc(T, NewAc, Role);
calc(base, Ac = #attr_calc{attr = AttrVal},
     #role{classes = Classes, lev = Lev}) ->
    Attr = attr_data:get_classes_base({Lev, Classes}),
    Attr1 = attr:do_math_add(Attr, AttrVal),
    Ac#attr_calc{attr = Attr1};
calc(eqm, Ac = #attr_calc{}, Role = #role{}) ->
    NewAc = eqm_attr:calc(Ac, Role),
    NewAc;
calc(buff, Ac = #attr_calc{}, Role = #role{}) ->
    NewAc = buff_attr:calc(Ac, Role),
    NewAc;
calc(wing, Ac = #attr_calc{}, Role = #role{}) ->
    NewAc = wing_attr:calc(Ac, Role),
    NewAc;
calc(mount, Ac = #attr_calc{}, Role = #role{}) ->
    NewAc = mount_attr:calc(Ac, Role),
    NewAc;
calc(skill, Ac = #attr_calc{}, Role = #role{}) ->
    NewAc = skill:calc(Ac, Role),
    NewAc;
calc(honor, Ac = #attr_calc{}, Role = #role{}) ->
    NewAc = honor:calc(Ac, Role),
    NewAc;
calc(skill_life, Ac = #attr_calc{}, Role = #role{}) ->
    NewAc = skill_life:calc(Ac, Role),
    NewAc;
calc(escort, Ac = #attr_calc{}, Role = #role{}) ->
    NewAc = escort:calc(Ac, Role),
    NewAc;
calc(camp_cake, Ac = #attr_calc{}, Role = #role{}) ->
    NewAc = camp_cake:calc(Ac, Role),
    NewAc;
calc(skill_prac, Ac = #attr_calc{}, Role = #role{}) ->
    NewAc = skill_prac_attr:calc(Ac, Role),
    NewAc;
calc(achievement, Ac = #attr_calc{}, Role = #role{}) ->
    NewAc = achievement:calc(Ac, Role),
    NewAc;
calc(fashion, Ac = #attr_calc{}, Role = #role{}) ->
    NewAc = fashion_attr:calc(Ac, Role),
    NewAc;
calc(handbook, Ac = #attr_calc{}, Role = #role{}) ->
    NewAc = handbook_attr:calc_attr(Ac, Role),
    NewAc;
calc(king_badge, Ac = #attr_calc{}, Role = #role{}) ->
    NewAc = tournament_attr:calc_attr(Ac, Role),
    NewAc;
calc(guard_astroid, Ac = #attr_calc{},
     Role = #role{}) ->
    NewAc = guard_astroid:calc(Ac, Role),
    NewAc;
calc(talisman, Ac = #attr_calc{}, Role = #role{}) ->
    NewAc = talisman_attr:calc(Ac, Role),
    NewAc;
calc(attr_point, Ac = #attr_calc{},
     #role{lev = Lev,
           m_attr_point =
               #m_attr_point{valid_plan = ValidPlan,
                             plan_data = PlanData}}) ->
    {Str, Con, Mag, Agi, End} = case
                                    lists:keyfind(ValidPlan,
                                                  #attr_point_plan.index,
                                                  PlanData)
                                    of
                                    #attr_point_plan{strength = TStr,
                                                     constitution = TCon,
                                                     magic = TMag,
                                                     agility = TAgi,
                                                     endurance = TEnd} ->
                                        {TStr + Lev,
                                         TCon + Lev,
                                         TMag + Lev,
                                         TAgi + Lev,
                                         TEnd + Lev};
                                    false ->
                                        {Lev + 1,
                                         Lev + 1,
                                         Lev + 1,
                                         Lev + 1,
                                         Lev + 1}
                                end,
    Attr = to_attr(base,
                   [{101, Str},
                    {102, Con},
                    {103, Mag},
                    {104, Agi},
                    {105, End}]),
    case attr_type:do_attr(Attr, Ac) of
        {false, Reason} ->
            logger:error("角色加点计算出错[~w,~w,~w,~w,~w]:[~w]",
                         [Str, Con, Mag, Agi, End, Reason],
                         attr_type,
                         92),
            Ac;
        {ok, NewAc} -> NewAc
    end;
calc(guild_element, Ac = #attr_calc{},
     Role = #role{}) ->
    NewAc = guild_role:calc_attr(Ac, Role),
    NewAc;
calc(fc_update, Ac = #attr_calc{}, Role = #role{}) ->
    NewAc = fc_update:calc(Ac, Role),
    NewAc;
calc(Type, Ac, _Role) ->
    logger:error("未知的属性计算类型:~w", [Type], attr_type, 104),
    Ac.

-spec merge_attr([tuple()], [tuple()]) -> [tuple()].

merge_attr([], AttrList) -> AttrList;
merge_attr([{Name, AddVal} | T], AttrList) ->
    case lists:keytake(Name, 1, AttrList) of
        {value, {_, Val}, RestAttrList} ->
            merge_attr(T, [{Name, Val + AddVal} | RestAttrList]);
        false -> merge_attr(T, [{Name, AddVal} | AttrList])
    end.

-spec to_attr([tuple()]) -> [#attr_base{}].

to_attr(Attr) -> to_attr_2(Attr, []).

to_attr_2([], AttrList) -> AttrList;
to_attr_2([{Label, Name, Val} | T], AttrList) ->
    Flag = 0,
    case to_attr_base(Label, {0, Name, Val, Flag}) of
        false -> to_attr_2(T, AttrList);
        Attr -> to_attr_2(T, [Attr | AttrList])
    end.

-spec to_attr(base | fixed | no_fc,
              [tuple()]) -> [#attr_base{}].

to_attr(Label, Attr) -> to_attr_3(Label, Attr, []).

to_attr_3(_Label, [], AttrList) -> AttrList;
to_attr_3(Label, [{Name, Val} | T], AttrList) ->
    Flag = 0,
    case to_attr_base(Label, {0, Name, Val, Flag}) of
        false -> to_attr_3(Label, T, AttrList);
        Attr -> to_attr_3(Label, T, [Attr | AttrList])
    end.

-spec to_attr(base | fixed | no_fc, non_neg_integer(),
              [tuple()]) -> [#attr_base{}].

to_attr(Label, Flag, Attr) ->
    to_attr_4(Label, Flag, Attr, []).

to_attr_4(_Label, _Flag, [], AttrList) -> AttrList;
to_attr_4(Label, Flag, [{Name, Val} | T], AttrList) ->
    case to_attr_base(Label, {0, Name, Val, Flag}) of
        false -> to_attr_4(Label, Flag, T, AttrList);
        Attr -> to_attr_4(Label, Flag, T, [Attr | AttrList])
    end.

-spec to_attr(base | fixed | no_fc, Type,
              non_neg_integer(),
              [tuple()]) -> [#attr_base{}] when Type :: 0.

to_attr(Label, Type, Flag, Attr) ->
    to_attr_5(Label, Type, Flag, Attr, []).

to_attr_5(_Label, _Type, _Flag, [], AttrList) ->
    AttrList;
to_attr_5(Label, Type, Flag, [{Name, Val} | T],
          AttrList) ->
    case to_attr_base(Label, {Type, Name, Val, Flag}) of
        false -> to_attr_5(Label, Type, Flag, T, AttrList);
        Attr ->
            to_attr_5(Label, Type, Flag, T, [Attr | AttrList])
    end.

to_attr_base(base, {Type, Name, Val, Flag})
    when Name >= 1 andalso Name =< 50 ->
    #attr_base{type = Type, name = Name, val = Val,
               flag = Flag, calc_type = 1};
to_attr_base(base, {Type, Name, Val, Flag})
    when Name >= 51 andalso Name =< 100 ->
    #attr_base{type = Type, name = Name, val = Val,
               flag = Flag, calc_type = 3};
to_attr_base(base, {Type, Name, Val, Flag})
    when Name >= 101 andalso Name =< 105 ->
    #attr_base{type = Type, name = Name, val = Val,
               flag = Flag, calc_type = 1};
to_attr_base(fixed, {Type, Name, Val, Flag})
    when Name >= 1 andalso Name =< 50 ->
    #attr_base{type = Type, name = Name, val = Val,
               flag = Flag, calc_type = 2};
to_attr_base(fixed, {Type, Name, Val, Flag})
    when Name >= 51 andalso Name =< 100 ->
    #attr_base{type = Type, name = Name, val = Val,
               flag = Flag, calc_type = 3};
to_attr_base(fixed, {Type, Name, Val, Flag})
    when Name >= 101 andalso Name =< 105 ->
    #attr_base{type = Type, name = Name, val = Val,
               flag = Flag, calc_type = 2};
to_attr_base(no_fc, {Type, Name, Val, Flag})
    when Name >= 1 andalso Name =< 50 ->
    #attr_base{type = Type, name = Name, val = Val,
               flag = Flag, calc_type = 4};
to_attr_base(no_fc, {Type, Name, Val, Flag})
    when Name >= 51 andalso Name =< 100 ->
    #attr_base{type = Type, name = Name, val = Val,
               flag = Flag, calc_type = 5};
to_attr_base(no_fc, {Type, Name, Val, Flag})
    when Name >= 101 andalso Name =< 105 ->
    #attr_base{type = Type, name = Name, val = Val,
               flag = Flag, calc_type = 4};
to_attr_base(no_fc, {Type, Name = 44, Val, Flag}) ->
    #attr_base{type = Type, name = Name, val = Val,
               flag = Flag, calc_type = 4};
to_attr_base(Label, _I) ->
    logger:error("属性转换失败：Label:~w attr:~w",
                 [Label, _I],
                 attr_type,
                 200),
    false.

-spec do_attr([#attr_base{}], #attr_calc{}) -> {ok,
                                                #attr_calc{}} |
                                               {false, bitstring()}.

do_attr([], NewAc) -> {ok, NewAc};
do_attr([#attr_base{calc_type = 0} | T], AttrCalc) ->
    do_attr(T, AttrCalc);
do_attr([H = #attr_base{calc_type = 1} | T],
        AttrCalc = #attr_calc{attr = Attr}) ->
    case do(H, Attr) of
        {ok, NewAttr} ->
            do_attr(T, AttrCalc#attr_calc{attr = NewAttr});
        skip -> do_attr(T, AttrCalc)
    end;
do_attr([H = #attr_base{calc_type = 2} | T],
        AttrCalc = #attr_calc{attr_no_ratio = Attr}) ->
    case do(H, Attr) of
        {ok, NewAttr} ->
            do_attr(T, AttrCalc#attr_calc{attr_no_ratio = NewAttr});
        skip -> do_attr(T, AttrCalc)
    end;
do_attr([H = #attr_base{calc_type = 3} | T],
        AttrCalc = #attr_calc{ratio = Attr}) ->
    case do(H, Attr) of
        {ok, NewAttr} ->
            do_attr(T, AttrCalc#attr_calc{ratio = NewAttr});
        skip -> do_attr(T, AttrCalc)
    end;
do_attr([H = #attr_base{calc_type = 4} | T],
        AttrCalc = #attr_calc{attr_no_fc = Attr}) ->
    case do(H, Attr) of
        {ok, NewAttr} ->
            do_attr(T, AttrCalc#attr_calc{attr_no_fc = NewAttr});
        skip -> do_attr(T, AttrCalc)
    end;
do_attr([H = #attr_base{calc_type = 5} | T],
        AttrCalc = #attr_calc{ratio_no_fc = Attr}) ->
    case do(H, Attr) of
        {ok, NewAttr} ->
            do_attr(T, AttrCalc#attr_calc{ratio_no_fc = NewAttr});
        skip -> do_attr(T, AttrCalc)
    end;
do_attr([_H | T], AttrCalc) ->
    logger:error("角色属性计算遇到错误的属性[~w]忽略",
                 [_H],
                 attr_type,
                 234),
    do_attr(T, AttrCalc).

do(#attr_base{name = 12, val = Val,
              calc_type = CalcType},
   Attr = #attr{speed = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{speed = V + Val}};
do(#attr_base{name = 1, val = Val,
              calc_type = CalcType},
   Attr = #attr{hp_max = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{hp_max = V + Val}};
do(#attr_base{name = 2, val = Val,
              calc_type = CalcType},
   Attr = #attr{mp_max = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{mp_max = V + Val}};
do(#attr_base{name = 3, val = Val,
              calc_type = CalcType},
   Attr = #attr{atk_speed = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{atk_speed = V + Val}};
do(#attr_base{name = 4, val = Val,
              calc_type = CalcType},
   Attr = #attr{phy_dmg = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{phy_dmg = V + Val}};
do(#attr_base{name = 5, val = Val,
              calc_type = CalcType},
   Attr = #attr{magic_dmg = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{magic_dmg = V + Val}};
do(#attr_base{name = 6, val = Val,
              calc_type = CalcType},
   Attr = #attr{phy_def = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{phy_def = V + Val}};
do(#attr_base{name = 7, val = Val,
              calc_type = CalcType},
   Attr = #attr{magic_def = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{magic_def = V + Val}};
do(#attr_base{name = 8, val = Val,
              calc_type = CalcType},
   Attr = #attr{crit = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{crit = V + Val}};
do(#attr_base{name = 9, val = Val,
              calc_type = CalcType},
   Attr = #attr{tenacity = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{tenacity = V + Val}};
do(#attr_base{name = 10, val = Val,
              calc_type = CalcType},
   Attr = #attr{accuracy = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{accuracy = V + Val}};
do(#attr_base{name = 11, val = Val,
              calc_type = CalcType},
   Attr = #attr{evasion = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{evasion = V + Val}};
do(#attr_base{name = 21, val = Val,
              calc_type = CalcType},
   Attr = #attr{holy_dmg = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{holy_dmg = V + Val}};
do(#attr_base{name = 22, val = Val,
              calc_type = CalcType},
   Attr = #attr{crit_dmg = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{crit_dmg = V + Val}};
do(#attr_base{name = 47, val = Val,
              calc_type = CalcType},
   Attr = #attr{crit_dmg_def = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{crit_dmg_def = V + Val}};
do(#attr_base{name = 23, val = Val,
              calc_type = CalcType},
   Attr = #attr{dmg_ratio = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{dmg_ratio = V + Val}};
do(#attr_base{name = 45, val = Val,
              calc_type = CalcType},
   Attr = #attr{phy_dmg_ratio = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{phy_dmg_ratio = V + Val}};
do(#attr_base{name = 46, val = Val,
              calc_type = CalcType},
   Attr = #attr{magic_dmg_ratio = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{magic_dmg_ratio = V + Val}};
do(#attr_base{name = 24, val = Val,
              calc_type = CalcType},
   Attr = #attr{def_ratio = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{def_ratio = V + Val}};
do(#attr_base{name = 25, val = Val,
              calc_type = CalcType},
   Attr = #attr{enhance_control = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{enhance_control = V + Val}};
do(#attr_base{name = 26, val = Val,
              calc_type = CalcType},
   Attr = #attr{anti_control = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{anti_control = V + Val}};
do(#attr_base{name = 27, val = Val,
              calc_type = CalcType},
   Attr = #attr{escape = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{escape = V + Val}};
do(#attr_base{name = 28, val = Val,
              calc_type = CalcType},
   Attr = #attr{anti_escape = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{anti_escape = V + Val}};
do(#attr_base{name = 29, val = Val,
              calc_type = CalcType},
   Attr = #attr{capture = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{capture = V + Val}};
do(#attr_base{name = 30, val = Val,
              calc_type = CalcType},
   Attr = #attr{phy_def_ratio = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{phy_def_ratio = V + Val}};
do(#attr_base{name = 31, val = Val,
              calc_type = CalcType},
   Attr = #attr{magic_def_ratio = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{magic_def_ratio = V + Val}};
do(#attr_base{name = 33, val = Val,
              calc_type = CalcType},
   Attr = #attr{heal_ratio = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{heal_ratio = V + Val}};
do(#attr_base{name = 34, val = Val,
              calc_type = CalcType},
   Attr = #attr{eff_heal_ratio = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{eff_heal_ratio = V + Val}};
do(#attr_base{name = 35, val = Val,
              calc_type = CalcType},
   Attr = #attr{phy_crit = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{phy_crit = V + Val}};
do(#attr_base{name = 37, val = Val,
              calc_type = CalcType},
   Attr = #attr{phy_tenacity = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{phy_tenacity = V + Val}};
do(#attr_base{name = 39, val = Val,
              calc_type = CalcType},
   Attr = #attr{phy_accuracy = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{phy_accuracy = V + Val}};
do(#attr_base{name = 41, val = Val,
              calc_type = CalcType},
   Attr = #attr{phy_evasion = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{phy_evasion = V + Val}};
do(#attr_base{name = 36, val = Val,
              calc_type = CalcType},
   Attr = #attr{magic_crit = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{magic_crit = V + Val}};
do(#attr_base{name = 38, val = Val,
              calc_type = CalcType},
   Attr = #attr{magic_tenacity = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{magic_tenacity = V + Val}};
do(#attr_base{name = 40, val = Val,
              calc_type = CalcType},
   Attr = #attr{magic_accuracy = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{magic_accuracy = V + Val}};
do(#attr_base{name = 42, val = Val,
              calc_type = CalcType},
   Attr = #attr{magic_evasion = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{magic_evasion = V + Val}};
do(#attr_base{name = 43, val = Val,
              calc_type = CalcType},
   Attr = #attr{heal_val = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{heal_val = V + Val}};
do(#attr_base{name = 101, val = Val,
              calc_type = CalcType},
   Attr = #attr{strength = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{strength = V + Val}};
do(#attr_base{name = 102, val = Val,
              calc_type = CalcType},
   Attr = #attr{constitution = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{constitution = V + Val}};
do(#attr_base{name = 103, val = Val,
              calc_type = CalcType},
   Attr = #attr{magic = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{magic = V + Val}};
do(#attr_base{name = 104, val = Val,
              calc_type = CalcType},
   Attr = #attr{agility = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{agility = V + Val}};
do(#attr_base{name = 105, val = Val,
              calc_type = CalcType},
   Attr = #attr{endurance = V})
    when CalcType =:= 1 orelse
             CalcType =:= 2 orelse CalcType =:= 4 ->
    {ok, Attr#attr{endurance = V + Val}};
do(#attr_base{name = 44, val = Val},
   Attr = #attr{exp_ratio = V}) ->
    {ok, Attr#attr{exp_ratio = V + Val}};
do(#attr_base{name = 51, val = Val,
              calc_type = CalcType},
   Attr = #attr{hp_max = V})
    when CalcType =:= 3 orelse CalcType =:= 5 ->
    logger:debug("aaaaaaaaaaaaaa ~w ~w",
                 [Val, V],
                 attr_type,
                 426),
    {ok, Attr#attr{hp_max = V + Val}};
do(#attr_base{name = 52, val = Val,
              calc_type = CalcType},
   Attr = #attr{mp_max = V})
    when CalcType =:= 3 orelse CalcType =:= 5 ->
    {ok, Attr#attr{mp_max = V + Val}};
do(#attr_base{name = 53, val = Val,
              calc_type = CalcType},
   Attr = #attr{atk_speed = V})
    when CalcType =:= 3 orelse CalcType =:= 5 ->
    {ok, Attr#attr{atk_speed = V + Val}};
do(#attr_base{name = 54, val = Val,
              calc_type = CalcType},
   Attr = #attr{phy_dmg = V})
    when CalcType =:= 3 orelse CalcType =:= 5 ->
    {ok, Attr#attr{phy_dmg = V + Val}};
do(#attr_base{name = 55, val = Val,
              calc_type = CalcType},
   Attr = #attr{magic_dmg = V})
    when CalcType =:= 3 orelse CalcType =:= 5 ->
    {ok, Attr#attr{magic_dmg = V + Val}};
do(#attr_base{name = 56, val = Val,
              calc_type = CalcType},
   Attr = #attr{phy_def = V})
    when CalcType =:= 3 orelse CalcType =:= 5 ->
    {ok, Attr#attr{phy_def = V + Val}};
do(#attr_base{name = 57, val = Val,
              calc_type = CalcType},
   Attr = #attr{magic_def = V})
    when CalcType =:= 3 orelse CalcType =:= 5 ->
    {ok, Attr#attr{magic_def = V + Val}};
do(#attr_base{name = 58, val = Val,
              calc_type = CalcType},
   Attr = #attr{crit = V})
    when CalcType =:= 3 orelse CalcType =:= 5 ->
    {ok, Attr#attr{crit = V + Val}};
do(#attr_base{name = 59, val = Val,
              calc_type = CalcType},
   Attr = #attr{tenacity = V})
    when CalcType =:= 3 orelse CalcType =:= 5 ->
    {ok, Attr#attr{tenacity = V + Val}};
do(#attr_base{name = 60, val = Val,
              calc_type = CalcType},
   Attr = #attr{accuracy = V})
    when CalcType =:= 3 orelse CalcType =:= 5 ->
    {ok, Attr#attr{accuracy = V + Val}};
do(#attr_base{name = 61, val = Val,
              calc_type = CalcType},
   Attr = #attr{evasion = V})
    when CalcType =:= 3 orelse CalcType =:= 5 ->
    {ok, Attr#attr{evasion = V + Val}};
do(#attr_base{name = 62, val = Val,
              calc_type = CalcType},
   Attr = #attr{speed = V})
    when CalcType =:= 3 orelse CalcType =:= 5 ->
    {ok, Attr#attr{speed = V + Val}};
do(#attr_base{name = _Name, calc_type = _CalcType,
              val = _Val},
   _Attr) ->
    logger:error("属性计算遇到无法匹配的项[~w][~w][~w]忽略[~w]",
                 [_Name, _CalcType, _Val, util:get_stacktrace()],
                 attr_type,
                 465),
    skip.

