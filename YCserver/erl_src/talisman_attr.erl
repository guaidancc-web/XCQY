-file("src/mod/talisman/talisman_attr.erl", 1).

-module(talisman_attr).

-export([init/1,
         calc/2,
         calc_pet/2,
         calc_child/2,
         calc_fc/1,
         calc_all_fc/1,
         recalc/2,
         init_base/1]).

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

-file("src/mod/talisman/talisman_attr.erl", 21).

-file("inc/talisman.hrl", 1).

-record(m_talisman,
        {ver = 5,
         next_id = 1,
         use_plan = 1,
         plan_1 = [],
         plan_2 = [],
         items = [],
         fusion_lev = 0,
         fusion_val = 0,
         skills = [],
         fc = 0,
         remold_formula = [],
         last_gain_id = 0,
         volume = 48}).

-record(talisman,
        {ver = 3,
         id = 1,
         base_id = 0,
         type = 0,
         quality = 0,
         lev = 0,
         attr = [],
         num = 1,
         fc = 0}).

-record(talisman_base,
        {base_id = 0,
         name = "",
         type = 0,
         quality = 0,
         lev = 0,
         need_lev = 0,
         need_lev_break = 0,
         set_id = 0,
         fusion_val = 0,
         base_attr = [],
         grade = 0}).

-file("src/mod/talisman/talisman_attr.erl", 22).

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

-file("src/mod/talisman/talisman_attr.erl", 23).

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

-file("src/mod/talisman/talisman_attr.erl", 24).

-file("inc/item.hrl", 1).

-record(item_base,
        {id = 0 :: non_neg_integer(),
         name = "" :: list(),
         type = 0 :: non_neg_integer(),
         quality = 0 :: 0..4,
         overlap = 1 :: pos_integer(),
         look_id = 0 :: non_neg_integer(),
         use_type = 0 :: 0..4,
         expire_type = 0 :: non_neg_integer(),
         expire_time = 0 ::
             non_neg_integer() |
             {{pos_integer(), pos_integer(), pos_integer()},
              {non_neg_integer(),
               non_neg_integer(),
               non_neg_integer()}},
         attr = [] :: [tuple()],
         lev = 0,
         classes = 0,
         sex = 2,
         buy_source = [],
         condition = [] :: [tuple()],
         effect = [] :: [tuple()],
         alchemy = 0 :: non_neg_integer()}).

-record(item,
        {ver = 0 :: non_neg_integer(),
         id = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         bind = 1 :: 0 | 1,
         look_id = 0,
         type = 0 :: non_neg_integer(),
         use_type = 0 :: 0..4,
         quality = 0 :: 0..4,
         craft = 0 :: 0..5,
         enchant = -1 :: integer(),
         growth_lev = 0,
         growth_val = 0,
         step = 0 :: pos_integer(),
         quantity = 1 :: 0..250,
         pos = 0 :: non_neg_integer(),
         expire_type = 0 :: 0..4,
         expire_time = 0 :: non_neg_integer(),
         attr = [] :: [tuple()],
         reset_attr = [],
         lev = 1 :: pos_integer(),
         classes = 0 :: 0..6,
         sex = 2 :: 0..2,
         extra = [] :: [tuple()],
         data = [] :: [any()]}).

-record(item_extra_info, {source, price}).

-file("src/mod/talisman/talisman_attr.erl", 25).

calc(Ac = #attr_calc{},
     #role{m_talisman =
               #m_talisman{use_plan = UsePlan, plan_1 = Plan1,
                           plan_2 = Plan2, items = Items,
                           fusion_lev = FuSionLev}}) ->
    Ids = case UsePlan of
              1 -> Plan1;
              _ -> Plan2
          end,
    GetItems = [I
                || I = #talisman{id = Id} <- Items,
                   lists:keymember(Id, 2, Ids) =:= true],
    EffectFusion = case talisman_data:get_fusion(FuSionLev)
                       of
                       Feffect = #{} -> Feffect;
                       _ -> #{}
                   end,
    Ac1 = do_calc_base(1, Ac, GetItems, EffectFusion),
    Ac1;
calc(_Ac, _) ->
    logger:error("属性错误，无法计算", [], talisman_attr, 42),
    _Ac.

calc_pet(Ac = #attr_calc{},
         #role{m_talisman =
                   #m_talisman{use_plan = UsePlan, plan_1 = Plan1,
                               plan_2 = Plan2, items = Items,
                               fusion_lev = FuSionLev}}) ->
    Ids = case UsePlan of
              1 -> Plan1;
              _ -> Plan2
          end,
    GetItems = [I
                || I = #talisman{id = Id} <- Items,
                   lists:keymember(Id, 2, Ids) =:= true],
    EffectFusion = case talisman_data:get_fusion(FuSionLev)
                       of
                       Feffect = #{} -> Feffect;
                       _ -> #{}
                   end,
    Ac1 = do_calc_base(2, Ac, GetItems, EffectFusion),
    Ac1;
calc_pet(_Ac, _) ->
    logger:error("属性错误，无法计算", [], talisman_attr, 58),
    _Ac.

calc_child(Ac = #attr_calc{},
           #role{m_talisman =
                     #m_talisman{use_plan = UsePlan, plan_1 = Plan1,
                                 plan_2 = Plan2, items = Items,
                                 fusion_lev = FuSionLev}}) ->
    Ids = case UsePlan of
              1 -> Plan1;
              _ -> Plan2
          end,
    GetItems = [I
                || I = #talisman{id = Id} <- Items,
                   lists:keymember(Id, 2, Ids) =:= true],
    EffectFusion = case talisman_data:get_fusion(FuSionLev)
                       of
                       Feffect = #{} -> Feffect;
                       _ -> #{}
                   end,
    Ac1 = do_calc_base(2, Ac, GetItems, EffectFusion),
    Ac1;
calc_child(_Ac, _) -> _Ac.

recalc(Role = #role{m_talisman =
                        Mtalisman = #m_talisman{items = Items}},
       Push) ->
    NewItems = [recalc_talisman(I) || I <- Items],
    NewMtalisman = Mtalisman#m_talisman{items = NewItems},
    NewRole = Role#role{m_talisman = NewMtalisman},
    NewRole1 = talisman_attr:calc_all_fc(NewRole),
    NewRole2 = case Push of
                   1 -> attr:calc_and_push(NewRole1);
                   _ -> attr:calc(NewRole1)
               end,
    {ok, NewRole2}.

calc_all_fc(Role = #role{m_talisman =
                             Mtalisman = #m_talisman{items = Items,
                                                     fusion_lev = FuSionLev,
                                                     use_plan = UsePlan,
                                                     plan_1 = Plan1,
                                                     plan_2 = Plan2}}) ->
    Ids = case UsePlan of
              1 -> Plan1;
              _ -> Plan2
          end,
    AllFc = lists:sum([Fc
                       || #talisman{fc = Fc, id = Id} <- Items,
                          lists:keymember(Id, 2, Ids) =:= true]),
    FuSionFc = talisman_data:get_fusion_fc(FuSionLev),
    SetFc = talisman:get_set_fc(Role),
    NewFc = AllFc + FuSionFc + SetFc,
    NewMtalisman = Mtalisman#m_talisman{fc = NewFc},
    NewRole = Role#role{m_talisman = NewMtalisman},
    NewRole.

calc_fc(Talisman = #talisman{base_id = BaseID,
                             lev = Lev, type = Type, quality = Quality,
                             attr = Attr}) ->
    BaseFc = talisman_data:get_base_fc({Lev, Quality}),
    #talisman_base{grade = Grade} =
        talisman_data:get(BaseID),
    SpecialFc = do_calc_fc(Type, Lev, Attr, 0, Grade),
    Talisman#talisman{fc = BaseFc + SpecialFc}.

do_calc_fc(_, _, [], Fc, _Grade) -> Fc;
do_calc_fc(Type, Lev, [#attr_base{val = 0} | T], Fc,
           _Grade) ->
    do_calc_fc(Type, Lev, T, Fc, _Grade);
do_calc_fc(Type, Lev,
           [#attr_base{name = Name, flag = Flag, type = 9} | T],
           Fc, Grade) ->
    Step = Flag rem 100,
    Fc1 = talisman_data:get_special_fc({Type, Lev, Name}),
    {_, Ratio} = talisman_data:get_step_ratio({Step,
                                               Grade}),
    AddFc = round(Fc1 * Ratio / 1000),
    do_calc_fc(Type, Lev, T, Fc + AddFc, Grade);
do_calc_fc(Type, Lev, [_ | T], Fc, _Grade) ->
    do_calc_fc(Type, Lev, T, Fc, _Grade).

do_calc_base(_ActionObj, Ac, [], _EffectFusion) -> Ac;
do_calc_base(ActionObj, Ac,
             [#talisman{base_id = BaseId, type = Type, attr = Attr}
              | T],
             EffectFusion) ->
    Attr1 = [A
             || A = #attr_base{val = Val, flag = Flag} <- Attr,
                Val =/= 0, Flag div 10000 rem 10 =:= ActionObj],
    EnchantAttr = calc_enchant(Attr1, Type, EffectFusion),
    Fun = fun (AttrBase = #attr_base{name = Name}) ->
                  case lists:member(Name, [101, 102, 103, 104, 105]) of
                      true -> AttrBase#attr_base{calc_type = 1};
                      _ -> AttrBase
                  end;
              (AttrBase) -> AttrBase
          end,
    Attr2 = lists:map(Fun, Attr1),
    case attr_type:do_attr(Attr2 ++ EnchantAttr, Ac) of
        {false, Reason} ->
            logger:error("法宝属性计算出错[~w]:[~w]",
                         [BaseId, Reason],
                         talisman_attr,
                         151),
            do_calc_base(ActionObj, Ac, T, EffectFusion);
        {ok, NewAc} ->
            do_calc_base(ActionObj, NewAc, T, EffectFusion)
    end.

calc_enchant(Attr, Type, EffectFusion) ->
    BaseAttr = [A || A = #attr_base{} <- Attr],
    CheckFlag = case Type of
                    148 ->
                        case maps:get(up_mask, EffectFusion, 0) of
                            Ratio when Ratio > 0 -> {true, Ratio};
                            _ -> false
                        end;
                    147 ->
                        case maps:get(up_ring, EffectFusion, 0) of
                            Ratio when Ratio > 0 -> {true, Ratio};
                            _ -> false
                        end;
                    149 ->
                        case maps:get(up_cloak, EffectFusion, 0) of
                            Ratio when Ratio > 0 -> {true, Ratio};
                            _ -> false
                        end;
                    150 ->
                        case maps:get(up_blazon, EffectFusion, 0) of
                            Ratio when Ratio > 0 -> {true, Ratio};
                            _ -> false
                        end;
                    _ -> false
                end,
    case CheckFlag of
        {true, AddRatio} ->
            [A#attr_base{val = util:ceil(Val * AddRatio / 1000)}
             || A = #attr_base{val = Val} <- BaseAttr];
        _ -> []
    end.

recalc_talisman(Talisman = #talisman{type = Type,
                                     lev = Lev, quality = Quality,
                                     base_id = BaseId, attr = Attr}) ->
    BaseAttr = init_base(BaseId),
    #talisman_base{grade = Grade} =
        talisman_data:get(BaseId),
    SpecialAttr = recalc_special(Type,
                                 Lev,
                                 Quality,
                                 Attr,
                                 Grade),
    AttrList = BaseAttr ++ SpecialAttr,
    NewTalisman = Talisman#talisman{attr = AttrList},
    NewTalisman1 = calc_fc(NewTalisman),
    NewTalisman1.

init(Talisman = #talisman{type = Type, lev = Lev,
                          quality = Quality, base_id = BaseId}) ->
    BaseAttr = init_base(BaseId),
    #talisman_base{grade = Grade} =
        talisman_data:get(BaseId),
    SpecialAttr = init_special(Type, Lev, Quality, Grade),
    AttrList = BaseAttr ++ SpecialAttr,
    Talisman#talisman{attr = AttrList}.

init_base(BaseId) ->
    case talisman_data:get(BaseId) of
        #talisman_base{base_attr = BaseAttr = [_ | _]} ->
            Attrs = attr_type:to_attr(fixed,
                                      7,
                                      0 + 0 * 100 + 1 * 10000,
                                      BaseAttr),
            Attrs;
        _ -> []
    end.

init_special(Type, Lev, Quality, Grade) ->
    case talisman_data:get_num({Quality, Grade}) of
        #{val_num := ValNumList, max_num := MaxNum} ->
            {ValNum, _} = util:rand_list(ValNumList, 2),
            do_init_special({Type, Lev, Quality, Grade},
                            1,
                            ValNum,
                            MaxNum,
                            []);
        _ -> []
    end.

do_init_special(_, Num, _ValNum, MaxNum, AttrList)
    when Num > MaxNum ->
    AttrList;
do_init_special({Type, Lev, Quality, Grade}, Num,
                ValNum, MaxNum, AttrList)
    when Num > ValNum ->
    Attr = #attr_base{type = 9, name = 0,
                      flag = 0 + Num * 100 + 0 * 10000},
    do_init_special({Type, Lev, Quality, Grade},
                    Num + 1,
                    ValNum,
                    MaxNum,
                    [Attr | AttrList]);
do_init_special({Type, Lev, Quality, Grade}, Num,
                ValNum, MaxNum, AttrList) ->
    case make_one_special(Num, Type, Lev, Quality, Grade) of
        {true, Attr} ->
            do_init_special({Type, Lev, Quality, Grade},
                            Num + 1,
                            ValNum,
                            MaxNum,
                            Attr ++ AttrList);
        _Err ->
            do_init_special({Type, Lev, Quality, Grade},
                            Num + 1,
                            ValNum,
                            MaxNum,
                            AttrList)
    end.

make_one_special(Num, Type, Lev, Quality, Grade) ->
    F = fun (ActionObj) ->
                erlang:is_map(talisman_data:get_special({Type,
                                                         Lev,
                                                         Quality,
                                                         Grade,
                                                         ActionObj}))
        end,
    case lists:any(F, [1, 2]) of
        true ->
            List = [begin
                        case talisman_data:get_special({Type,
                                                        Lev,
                                                        Quality,
                                                        Grade,
                                                        ActionObj})
                            of
                            Special when erlang:is_map(Special) ->
                                #{attr_name1 := AttrName1,
                                  attr_val1 := AttrVal1,
                                  attr_ratio1 := AttrRatio1,
                                  attr_name2 := AttrName2,
                                  attr_val2 := AttrVal2,
                                  attr_ratio2 := AttrRatio2,
                                  attr_name3 := AttrName3,
                                  attr_val3 := AttrVal3,
                                  attr_ratio3 := AttrRatio3,
                                  attr_name4 := AttrName4,
                                  attr_val4 := AttrVal4,
                                  attr_ratio4 := AttrRatio4,
                                  attr_name5 := AttrName5,
                                  attr_val5 := AttrVal5,
                                  attr_ratio5 := AttrRatio5,
                                  attr_name6 := AttrName6,
                                  attr_val6 := AttrVal6,
                                  attr_ratio6 := AttrRatio6,
                                  attr_name7 := AttrName7,
                                  attr_val7 := AttrVal7,
                                  attr_ratio7 := AttrRatio7,
                                  attr_name8 := AttrName8,
                                  attr_val8 := AttrVal8,
                                  attr_ratio8 := AttrRatio8,
                                  attr_name9 := AttrName9,
                                  attr_val9 := AttrVal9,
                                  attr_ratio9 := AttrRatio9,
                                  attr_name10 := AttrName10,
                                  attr_val10 := AttrVal10,
                                  attr_ratio10 := AttrRatio10,
                                  attr_name11 := AttrName11,
                                  attr_val11 := AttrVal11,
                                  attr_ratio11 := AttrRatio11} =
                                    Special,
                                [{ActionObj, AttrName1, AttrVal1, AttrRatio1},
                                 {ActionObj, AttrName2, AttrVal2, AttrRatio2},
                                 {ActionObj, AttrName3, AttrVal3, AttrRatio3},
                                 {ActionObj, AttrName4, AttrVal4, AttrRatio4},
                                 {ActionObj, AttrName5, AttrVal5, AttrRatio5},
                                 {ActionObj, AttrName6, AttrVal6, AttrRatio6},
                                 {ActionObj, AttrName7, AttrVal7, AttrRatio7},
                                 {ActionObj, AttrName8, AttrVal8, AttrRatio8},
                                 {ActionObj, AttrName9, AttrVal9, AttrRatio9},
                                 {ActionObj,
                                  AttrName10,
                                  AttrVal10,
                                  AttrRatio10},
                                 {ActionObj,
                                  AttrName11,
                                  AttrVal11,
                                  AttrRatio11}];
                            _ -> []
                        end
                    end
                    || ActionObj <- [1, 2]],
            ListT = lists:flatten(List),
            case [{ActionObj, N, V, R}
                  || {ActionObj, N, V, R} <- ListT,
                     V =/= 0 andalso R =/= 0]
                of
                List1 = [_ | _] ->
                    case talisman_data:get_step_list({Quality, Grade}) of
                        StepList = [_ | _] ->
                            {Step, _} = util:rand_list(StepList, 2),
                            {Ratio, _} = talisman_data:get_step_ratio({Step,
                                                                       Grade}),
                            {ActionObj, AttrName, AttrVal, _} =
                                util:rand_list(List1, 4),
                            Val = round(AttrVal * Ratio / 1000),
                            Flag = Step + Num * 100 + ActionObj * 10000,
                            Attr = attr_type:to_attr(fixed,
                                                     9,
                                                     Flag,
                                                     [{AttrName, Val}]),
                            {true, Attr};
                        _Err ->
                            logger:error("生成属性出错:~w,~w,~w,~w,~w",
                                         [Type, Lev, Quality, Grade, _Err],
                                         talisman_attr,
                                         296),
                            false
                    end;
                _Err ->
                    logger:error("生成属性出错:~w,~w,~w,~w,~w",
                                 [Type, Lev, Quality, Grade, _Err],
                                 talisman_attr,
                                 300),
                    false
            end;
        _Err ->
            logger:error("生成属性出错:~w,~w,~w,~w,~w",
                         [Type, Lev, Quality, Grade, _Err],
                         talisman_attr,
                         304),
            false
    end.

recalc_special(Type, Lev, Quality, Attr, Grade) ->
    F = fun (ActionObj) ->
                erlang:is_map(talisman_data:get_special({Type,
                                                         Lev,
                                                         Quality,
                                                         Grade,
                                                         ActionObj}))
        end,
    case lists:any(F, [1, 2]) of
        true ->
            List = [begin
                        case talisman_data:get_special({Type,
                                                        Lev,
                                                        Quality,
                                                        Grade,
                                                        ActionObj})
                            of
                            Special when erlang:is_map(Special) ->
                                #{attr_name1 := AttrName1,
                                  attr_val1 := AttrVal1,
                                  attr_ratio1 := AttrRatio1,
                                  attr_name2 := AttrName2,
                                  attr_val2 := AttrVal2,
                                  attr_ratio2 := AttrRatio2,
                                  attr_name3 := AttrName3,
                                  attr_val3 := AttrVal3,
                                  attr_ratio3 := AttrRatio3,
                                  attr_name4 := AttrName4,
                                  attr_val4 := AttrVal4,
                                  attr_ratio4 := AttrRatio4,
                                  attr_name5 := AttrName5,
                                  attr_val5 := AttrVal5,
                                  attr_ratio5 := AttrRatio5,
                                  attr_name6 := AttrName6,
                                  attr_val6 := AttrVal6,
                                  attr_ratio6 := AttrRatio6,
                                  attr_name7 := AttrName7,
                                  attr_val7 := AttrVal7,
                                  attr_ratio7 := AttrRatio7,
                                  attr_name8 := AttrName8,
                                  attr_val8 := AttrVal8,
                                  attr_ratio8 := AttrRatio8,
                                  attr_name9 := AttrName9,
                                  attr_val9 := AttrVal9,
                                  attr_ratio9 := AttrRatio9,
                                  attr_name10 := AttrName10,
                                  attr_val10 := AttrVal10,
                                  attr_ratio10 := AttrRatio10,
                                  attr_name11 := AttrName11,
                                  attr_val11 := AttrVal11,
                                  attr_ratio11 := AttrRatio11} =
                                    Special,
                                [{{ActionObj, AttrName1}, AttrVal1, AttrRatio1},
                                 {{ActionObj, AttrName2}, AttrVal2, AttrRatio2},
                                 {{ActionObj, AttrName3}, AttrVal3, AttrRatio3},
                                 {{ActionObj, AttrName4}, AttrVal4, AttrRatio4},
                                 {{ActionObj, AttrName5}, AttrVal5, AttrRatio5},
                                 {{ActionObj, AttrName6}, AttrVal6, AttrRatio6},
                                 {{ActionObj, AttrName7}, AttrVal7, AttrRatio7},
                                 {{ActionObj, AttrName8}, AttrVal8, AttrRatio8},
                                 {{ActionObj, AttrName9}, AttrVal9, AttrRatio9},
                                 {{ActionObj, AttrName10},
                                  AttrVal10,
                                  AttrRatio10},
                                 {{ActionObj, AttrName11},
                                  AttrVal11,
                                  AttrRatio11}];
                            _ -> []
                        end
                    end
                    || ActionObj <- [1, 2]],
            ListT = lists:flatten(List),
            case [{N, V, R}
                  || {N, V, R} <- ListT, V =/= 0 andalso R =/= 0]
                of
                List1 = [_ | _] ->
                    Attr1 = [A
                             || A = #attr_base{type = Atype} <- Attr,
                                Atype =:= 9],
                    do_recalc_special(List1, Attr1, [], Grade);
                _ ->
                    logger:error("重算法宝属性时无法计算:~w:~w ~w ~w",
                                 [Type, Lev, Quality, Grade],
                                 talisman_attr,
                                 354),
                    Attr1 = [A
                             || A = #attr_base{type = Atype} <- Attr,
                                Atype =:= 9],
                    Attr1
            end;
        _ ->
            logger:error("重算法宝属性时无法计算:~w:~w ~w ~w",
                         [Type, Lev, Quality, Grade],
                         talisman_attr,
                         359),
            Attr1 = [A
                     || A = #attr_base{type = Atype} <- Attr, Atype =:= 9],
            Attr1
    end.

do_recalc_special(_BaseList, [], Attr, _Grade) ->
    lists:reverse(Attr);
do_recalc_special(BaseList,
                  [A = #attr_base{val = 0} | T], Attr, _Grade) ->
    do_recalc_special(BaseList, T, [A | Attr], _Grade);
do_recalc_special(BaseList,
                  [A = #attr_base{name = Name, flag = Flag} | T], Attr,
                  Grade) ->
    case lists:keyfind({Flag div 10000 rem 10, Name},
                       1,
                       BaseList)
        of
        {_, AttrVal, _} ->
            Step = Flag rem 100,
            {Ratio, _} = talisman_data:get_step_ratio({Step,
                                                       Grade}),
            Val = round(AttrVal * Ratio / 1000),
            do_recalc_special(BaseList,
                              T,
                              [A#attr_base{val = Val} | Attr],
                              Grade);
        _ -> do_recalc_special(BaseList, T, [A | Attr], Grade)
    end.

