-file("src/mod/eqm/eqm_attr.erl", 1).

-module(eqm_attr).

-export([calc/2,
         calc_eqm/1,
         init_eqm/1,
         get_stone_attr/1,
         get_role_init_attr/2,
         get_guard_init_attr/3,
         get_role_recalc_attr/4,
         get_guard_recalc_attr/4,
         get_role_effect_attr/3,
         get_guard_effect_attr/2,
         get_guard_effect_attr/3,
         get_all_enchant/3,
         push_eqm_point/1,
         get_base_attr/3,
         get_comprehend/1,
         init_base/4,
         init_special/4]).

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

-file("src/mod/eqm/eqm_attr.erl", 30).

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

-file("src/mod/eqm/eqm_attr.erl", 31).

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

-file("src/mod/eqm/eqm_attr.erl", 32).

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

-file("src/mod/eqm/eqm_attr.erl", 33).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/eqm/eqm_attr.erl", 34).

-file("inc/blacksmith.hrl", 1).

-record(enchant_fail_reward,
        {val = 0,
         item_list = [],
         title = "",
         msg = "",
         is_break = 0}).

-file("src/mod/eqm/eqm_attr.erl", 35).

push_eqm_point(Role = #role{p_eqm =
                                #package{items = Eqm}}) ->
    InitCalc = #attr_calc{attr = #attr{},
                          attr_no_ratio = #attr{speed = 0},
                          ratio = #attr{speed = 0},
                          attr_no_fc = #attr{speed = 0},
                          ratio_no_fc = #attr{speed = 0}},
    Data = case do_calc_eqm(InitCalc, Eqm) of
               #attr_calc{attr =
                              #attr{strength = Str, constitution = Con,
                                    magic = Mag, agility = Agi,
                                    endurance = End}} ->
                   {Str, Con, Mag, Agi, End};
               _ -> {0, 0, 0, 0, 0}
           end,
    role:link_send(Role, 10026, Data),
    ok.

-spec calc(Ac :: #attr_calc{},
           Role :: #role{}) -> NewAc :: #attr_calc{}.

calc(Ac = #attr_calc{},
     #role{classes = Classes,
           p_eqm = #package{items = Eqm}}) ->
    NewEqm = Eqm,
    Ac1 = do_calc_eqm(Ac, NewEqm),
    Ac2 = do_calc_lev(Ac1, Classes, NewEqm),
    Ac3 = do_calc_enchant(Ac2, NewEqm),
    Ac4 = do_calc_stone(Ac3, NewEqm),
    Ac5 = do_calc_comprehend(Ac4, Classes, NewEqm),
    Ac5;
calc(_Ac, _) ->
    logger:error("属性错误，无法计算", [], eqm_attr, 64),
    _Ac.

do_calc_eqm(Ac, []) -> Ac;
do_calc_eqm(Ac,
            [#item{base_id = BaseId, attr = Attr, type = _Type}
             | T]) ->
    case attr_type:do_attr(Attr, Ac) of
        {false, Reason} ->
            logger:error("装备属性计算出错[~w]:[~w]",
                         [BaseId, Reason],
                         eqm_attr,
                         74),
            do_calc_eqm(Ac, T);
        {ok, NewAc} -> do_calc_eqm(NewAc, T)
    end.

calc_eqm(Item = #item{type = Type, attr = Attr,
                      lev = Lev, enchant = Enchant, data = Data}) ->
    case lists:member(Type,
                      [1, 4, 2, 3, 5, 21, 22, 6, 7, 9, 10, 11, 12, 14])
        of
        true ->
            IsBreakEnchant = blacksmith:is_enchant_break(Item),
            OldBaseAttr = [A || A = #attr_base{type = 0} <- Attr],
            OldSpecialAttr = [A
                              || A = #attr_base{type = 2} <- Attr],
            OldEffectAttr = [A || A = #attr_base{type = 4} <- Attr],
            OldHoleAttr = [A || A = #attr_base{type = 3} <- Attr],
            OldCampAttr = [A || A = #attr_base{type = 5} <- Attr],
            OldCampCachedAttr = [A
                                 || A = #attr_base{type = 6} <- Attr],
            OldEffectSkill = [A
                              || A = #attr_base{type = 10} <- Attr],
            OldZeroSpeedAttr = [A
                                || A = #attr_base{type = 11} <- Attr],
            NewLev = case lists:keyfind(2, 1, Data) of
                         {2, {BackLev, NowLev, _BackAttr}}
                             when BackLev =/= NowLev ->
                             BackLev;
                         _ -> Lev
                     end,
            {CalcBaseAttr, SpecialAttr} = get_role_recalc_attr(Type,
                                                               NewLev,
                                                               OldBaseAttr,
                                                               OldSpecialAttr),
            EnchantAttr = calc_enchant_attr(IsBreakEnchant,
                                            Type,
                                            Enchant,
                                            CalcBaseAttr,
                                            OldEffectAttr),
            NewAttr = CalcBaseAttr ++
                          EnchantAttr ++
                              SpecialAttr ++
                                  OldEffectAttr ++
                                      OldHoleAttr ++
                                          OldCampAttr ++
                                              OldCampCachedAttr ++
                                                  OldEffectSkill ++
                                                      OldZeroSpeedAttr,
            Item#item{attr = NewAttr};
        false -> Item
    end.

init_eqm(Item = #item{type = Type, lev = Lev,
                      enchant = Enchant}) ->
    case lists:member(Type,
                      [1, 4, 2, 3, 5, 21, 22, 6, 7, 9, 10, 11, 12, 14])
        of
        true ->
            IsBreakEnchant = blacksmith:is_enchant_break(Item),
            {CalcBaseAttr, SpecialAttr} = get_role_init_attr(Type,
                                                             Lev),
            EnchantAttr = calc_enchant_attr(IsBreakEnchant,
                                            Type,
                                            Enchant,
                                            CalcBaseAttr,
                                            []),
            NewAttr = CalcBaseAttr ++ EnchantAttr ++ SpecialAttr,
            Item#item{attr = NewAttr};
        false -> Item
    end.

get_role_init_attr(Type, Lev) ->
    BaseAttr = eqm_data:get_base_attr(Type, Lev),
    RatioList = eqm_data:get_base_ratio(),
    RatioList1 = [{An, St, Ra, Rt}
                  || {MinLev, MaxLev, An, St, Ra, Rt} <- RatioList,
                     Lev >= MinLev andalso Lev =< MaxLev],
    BaseFlag = case Lev =< 30 of
                   true -> 12;
                   false -> 0
               end,
    CalcBaseAttr = init_base(BaseAttr,
                             RatioList1,
                             [],
                             BaseFlag),
    BaseVal = eqm_data:get_first_base(Lev),
    StepList = eqm_data:get_first_step(),
    StepList1 = [{Sp, Sr, Sa}
                 || {MinLev2, MaxLev2, Sp, Sr, Sa} <- StepList,
                    Lev >= MinLev2 andalso Lev =< MaxLev2],
    TypeList = eqm_data:get_first_type(),
    SpecialAttr = case Lev =< 30 of
                      true -> [];
                      false -> init_special(BaseVal, StepList1, TypeList, [])
                  end,
    {CalcBaseAttr, SpecialAttr}.

get_base_attr(Type, Lev, Step) ->
    BaseAttr = eqm_data:get_base_attr(Type, Lev),
    RatioList = eqm_data:get_base_ratio(),
    RatioList1 = [{An, St, Ra, Rt}
                  || {MinLev, MaxLev, An, St, Ra, Rt} <- RatioList,
                     Lev >= MinLev andalso Lev =< MaxLev],
    init_base(BaseAttr, RatioList1, [], Step).

get_comprehend(#role{classes = Classes,
                     p_eqm = #package{items = Eqm}}) ->
    Craft = get_comprehend(Eqm, Classes, 0),
    {ok, {Craft, Classes}}.

get_guard_init_attr(Type, Lev, Classes) ->
    {BaseFlag, Step, StepType, BaseAttrNameList} = case
                                                       guard_data:get_base_args({Type,
                                                                                 Classes})
                                                       of
                                                       {Bf,
                                                        Sp,
                                                        SpT,
                                                        Ban1,
                                                        Ban2} ->
                                                           {Bf,
                                                            Sp,
                                                            SpT,
                                                            [Ban1, Ban2]};
                                                       _ ->
                                                           {13,
                                                            9,
                                                            4,
                                                            [101, 102]}
                                                   end,
    BaseAttr = guard_data:get_base_attr(Type, Lev),
    RatioList = guard_data:get_base_ratio(),
    CalcBaseAttr = init_base(BaseAttr,
                             RatioList,
                             [],
                             BaseFlag),
    BaseVal = guard_data:get_first_base(Lev),
    StepList = guard_data:get_first_step(),
    StepList1 = [S
                 || S = {Sp1, _, _} <- StepList, Sp1 =:= Step],
    TypeList = guard_data:get_first_type(),
    TypeList1 = [T
                 || T = {SpT1, _, _, _} <- TypeList, SpT1 =:= StepType],
    SpecialAttr = init_special(BaseVal,
                               StepList1,
                               TypeList1,
                               BaseAttrNameList),
    {CalcBaseAttr, SpecialAttr}.

get_role_effect_attr(Type, Classes, Lev) ->
    List = eqm_data:get_effect_attr({Type, Lev}),
    List1 = [{E, R}
             || {C, E, R} <- List, C =:= Classes orelse C =:= 0],
    case List1 of
        [_ | _] ->
            case util:rand_list(List1, 2) of
                {[], _} -> [];
                {AttrList, _} ->
                    {AttrName, AttrVal} = util:rand_list(AttrList),
                    Attr = #attr_base{type = 4, name = AttrName,
                                      calc_type = 0, val = AttrVal},
                    [Attr]
            end;
        _ ->
            logger:error("无法获得[~w][~w][~w]的特效属性",
                         [Type, Classes, Lev],
                         eqm_attr,
                         208),
            []
    end.

get_guard_effect_attr(Type, Lev) ->
    case guard_data:get_effect_attr({Type, Lev}) of
        EffectList = [_ | _] ->
            case util:rand_list(EffectList, 2) of
                {[], _} -> [];
                {AttrList, _} ->
                    {AttrName, AttrVal} = util:rand_list(AttrList),
                    Attr = #attr_base{type = 4, name = AttrName,
                                      calc_type = 0, val = AttrVal},
                    [Attr]
            end;
        _ ->
            logger:error("无法获得[~w]的特效属性", [Type], eqm_attr, 227),
            []
    end.

get_guard_effect_attr(Type, Lev, DelList) ->
    case guard_data:get_effect_attr({Type, Lev}) of
        EffectList = [_ | _] ->
            NewEffectList = [{E -- DelList, R}
                             || {E, R} <- EffectList],
            case util:rand_list(NewEffectList, 2) of
                {[], _} -> [];
                {AttrList, _} ->
                    {AttrName, AttrVal} = util:rand_list(AttrList),
                    Attr = #attr_base{type = 4, name = AttrName,
                                      calc_type = 0, val = AttrVal},
                    [Attr]
            end;
        _ ->
            logger:error("无法获得[~w]的特效属性", [Type], eqm_attr, 244),
            []
    end.

get_role_recalc_attr(Type, Lev, EqmBaseAttr,
                     EqmSpecialAttr) ->
    BaseAttr = eqm_data:get_base_attr(Type, Lev),
    RatioList = eqm_data:get_base_ratio(),
    RatioList1 = [{An, St, Ra, Rt}
                  || {MinLev, MaxLev, An, St, Ra, Rt} <- RatioList,
                     Lev >= MinLev andalso Lev =< MaxLev],
    CalcBaseAttr = recalc_base_attr(BaseAttr,
                                    RatioList1,
                                    EqmBaseAttr,
                                    []),
    BaseVal = eqm_data:get_first_base(Lev),
    StepList = eqm_data:get_first_step(),
    StepList1 = [{Sp, Sr, Sa}
                 || {MinLev2, MaxLev2, Sp, Sr, Sa} <- StepList,
                    Lev >= MinLev2 andalso Lev =< MaxLev2],
    TypeList = eqm_data:get_first_type(),
    SpecialAttr = recalc_special_attr(BaseVal,
                                      StepList1,
                                      TypeList,
                                      EqmSpecialAttr,
                                      []),
    {CalcBaseAttr, SpecialAttr}.

get_guard_recalc_attr(Type, Lev, EqmBaseAttr,
                      EqmSpecialAttr) ->
    BaseAttr = guard_data:get_base_attr(Type, Lev),
    RatioList = guard_data:get_base_ratio(),
    CalcBaseAttr = recalc_base_attr(BaseAttr,
                                    RatioList,
                                    EqmBaseAttr,
                                    []),
    BaseVal = guard_data:get_first_base(Lev),
    StepList = guard_data:get_first_step(),
    TypeList = guard_data:get_first_type(),
    SpecialAttr = recalc_special_attr(BaseVal,
                                      StepList,
                                      TypeList,
                                      EqmSpecialAttr,
                                      []),
    {CalcBaseAttr, SpecialAttr}.

init_base([], _RatioList, BaseAttr, _BaseFlag) ->
    BaseAttr;
init_base([Attr | T], RatioList, BaseAttr, BaseFlag) ->
    case do_init_base(Attr, RatioList, BaseFlag) of
        {true, NewAttr} ->
            init_base(T, RatioList, [NewAttr | BaseAttr], BaseFlag);
        false -> init_base(T, RatioList, BaseAttr, BaseFlag)
    end.

init_special(BaseVal, StepList, TypeList = [_ | _],
             BaseAttrNameList) ->
    AttrNameList = case BaseAttrNameList of
                       [_, _] -> BaseAttrNameList;
                       _ -> [101, 102, 103, 104, 105]
                   end,
    case util:rand_list(TypeList, 2) of
        {0, _, _, _} -> [];
        {_, _, 0, 0} -> [];
        {Type, _, Val1, Val2} ->
            [AttrName1, AttrName2] = case AttrNameList of
                                         [_, _] -> AttrNameList;
                                         _ -> util:rand_list_n(AttrNameList, 2)
                                     end,
            {Step1, Ratio1, _} = util:rand_list(StepList, 3),
            {Step2, Ratio2, _} = util:rand_list(StepList, 3),
            AttrVal1 = round(BaseVal * Val1 / 1000 * Ratio1 / 1000),
            AttrVal2 = round(BaseVal * Val2 / 1000 * Ratio2 / 1000),
            List = case AttrVal1 =:= 0 of
                       true -> [];
                       false ->
                           Flag1 = Type * 1000 + Step1 * 10 + 1,
                           Attr1 = #attr_base{type = 2, name = AttrName1,
                                              flag = Flag1, calc_type = 1,
                                              val = AttrVal1},
                           [Attr1]
                   end,
            List1 = case AttrVal2 =:= 0 of
                        true -> List;
                        false ->
                            Flag2 = Type * 1000 + Step2 * 10 + 2,
                            Attr2 = #attr_base{type = 2, name = AttrName2,
                                               flag = Flag2, calc_type = 1,
                                               val = AttrVal2},
                            [Attr2 | List]
                    end,
            List1;
        _ -> []
    end;
init_special(_BaseVal, _StepList, _TypeList, _) -> [].

do_init_base(Attr = #attr_base{name = AttrName,
                               flag = Flag, val = OldVal},
             RatioList, BaseFlag) ->
    case [{An, St, Ra, Rt}
          || {An, St, Ra, Rt} <- RatioList, An =:= AttrName]
        of
        RatioList1 = [_ | _] ->
            {Step, Ratio} = case Flag of
                                0 ->
                                    case BaseFlag =:= 0 of
                                        true ->
                                            {_, St, Ra, _} =
                                                util:rand_list(RatioList1, 4),
                                            {St, Ra};
                                        false ->
                                            case lists:keyfind(BaseFlag,
                                                               2,
                                                               RatioList1)
                                                of
                                                {_, _, Ra, _} -> {BaseFlag, Ra};
                                                _ -> {BaseFlag, 800}
                                            end
                                    end;
                                100 -> {100, 0};
                                _ ->
                                    case lists:keyfind(Flag, 2, RatioList1) of
                                        {_, _, Ra, _} -> {Flag, Ra};
                                        _ -> {Flag, 800}
                                    end
                            end,
            NewVal = round(OldVal * Ratio / 1000),
            {true, Attr#attr_base{flag = Step, val = NewVal}};
        _ -> false
    end.

recalc_base_attr([], _RatioList, _OldAttr, BaseAttr) ->
    BaseAttr;
recalc_base_attr([Attr = #attr_base{name = AttrName}
                  | T],
                 RatioList, OldAttr, BaseAttr) ->
    Flag = case lists:keyfind(AttrName,
                              #attr_base.name,
                              OldAttr)
               of
               #attr_base{flag = Step} -> Step;
               _ -> 0
           end,
    case do_init_base(Attr#attr_base{flag = Flag},
                      RatioList,
                      0)
        of
        {true, NewAttr} ->
            recalc_base_attr(T,
                             RatioList,
                             OldAttr,
                             [NewAttr | BaseAttr]);
        false ->
            recalc_base_attr(T, RatioList, OldAttr, BaseAttr)
    end.

recalc_special_attr(_BaseVal, _StepList, [],
                    _OldSpecialAttr, _SpecialAttr) ->
    [];
recalc_special_attr(_BaseVal, _StepList, _TypeList, [],
                    SpecialAttr) ->
    SpecialAttr;
recalc_special_attr(BaseVal, StepList, TypeList,
                    [Attr | T], SpecialAttr) ->
    case do_recalc_special_attr(BaseVal,
                                StepList,
                                TypeList,
                                Attr)
        of
        {true, NewAttr} ->
            recalc_special_attr(BaseVal,
                                StepList,
                                TypeList,
                                T,
                                [NewAttr | SpecialAttr]);
        false ->
            recalc_special_attr(BaseVal,
                                StepList,
                                TypeList,
                                T,
                                SpecialAttr)
    end.

do_recalc_special_attr(_BaseVal, _StepList, _TypeList,
                       Attr = #attr_base{name = 100}) ->
    {true, Attr};
do_recalc_special_attr(BaseVal, StepList, TypeList,
                       Attr = #attr_base{name = Name, flag = Flag})
    when Name >= 101 andalso Name =< 105 ->
    Type = Flag div 1000,
    Step = Flag div 10 rem 100,
    Side = Flag rem 10,
    case lists:keyfind(Step, 1, StepList) of
        {_, StepRatio, _} ->
            TypeRatio = case lists:keyfind(Type, 1, TypeList) of
                            {_, _, Val1, _} when Side =:= 1 -> Val1;
                            {_, _, _, Val2} when Side =:= 2 -> Val2;
                            _ -> 0
                        end,
            Val = round(BaseVal * TypeRatio / 1000 * StepRatio /
                            1000),
            case Val =:= 0 of
                true -> false;
                false -> {true, Attr#attr_base{val = Val}}
            end;
        _ -> false
    end;
do_recalc_special_attr(_BaseVal, _StepList, _TypeList,
                       _Attr) ->
    false.

calc_enchant_attr(IsBreakEnchant, Type, Enchant,
                  BaseAttr, EffectAttr) ->
    TargetList = eqm_data:enchant_attr({Type, Enchant}),
    AddRatio1 = case lists:keyfind(150,
                                   #attr_base.name,
                                   EffectAttr)
                    of
                    #attr_base{val = Val} -> Val;
                    _ -> 0
                end,
    AddRatio2 = case IsBreakEnchant of
                    true -> 20;
                    _ -> 0
                end,
    AddRatio = AddRatio1 + AddRatio2,
    {Flag, ValList} = eqm_data:enchant_award({Type,
                                              Enchant}),
    AttrList = attr_type:to_attr(fixed, 1, Flag, ValList),
    AttrList ++
        do_calc_enchant_attr(BaseAttr, AddRatio, TargetList).

do_calc_enchant_attr(_BaseAttr, _AddRatio, []) -> [];
do_calc_enchant_attr(BaseAttr, AddRatio, TargetList) ->
    do_calc_enchant_attr(BaseAttr,
                         AddRatio,
                         TargetList,
                         []).

do_calc_enchant_attr(_BaseAttr, _AddRatio, [],
                     EnchantAttr) ->
    EnchantAttr;
do_calc_enchant_attr(BaseAttr, AddRatio,
                     [{AttrName, Ratio} | T], EnchantAttr) ->
    case lists:keyfind(AttrName, #attr_base.name, BaseAttr)
        of
        Attr = #attr_base{val = Val} ->
            NewVal = erlang:round(Val * (Ratio + AddRatio) / 1000),
            case NewVal =:= 0 of
                true ->
                    do_calc_enchant_attr(BaseAttr,
                                         AddRatio,
                                         T,
                                         EnchantAttr);
                false ->
                    NewAttr = Attr#attr_base{type = 1, val = NewVal,
                                             flag = 0},
                    do_calc_enchant_attr(BaseAttr,
                                         AddRatio,
                                         T,
                                         [NewAttr | EnchantAttr])
            end;
        _ ->
            do_calc_enchant_attr(BaseAttr, AddRatio, T, EnchantAttr)
    end.

do_calc_lev(Ac, _Classes, []) -> Ac;
do_calc_lev(Ac, Classes, Eqm) ->
    do_calc_lev(Ac, Classes, Eqm, 0, 0).

do_calc_lev(Ac, Classes, [], Lev, Num) when Num >= 8 ->
    case eqm_data:get_lev_attr({Lev, Classes}) of
        AttrVal = [_ | _] ->
            Attr = attr_type:to_attr(base, AttrVal),
            case attr_type:do_attr(Attr, Ac) of
                {false, Reason} ->
                    logger:error("装备套装计算出错[~w]:[~w]",
                                 [Lev, Reason],
                                 eqm_attr,
                                 470),
                    Ac;
                {ok, NewAc} -> NewAc
            end;
        _ -> Ac
    end;
do_calc_lev(Ac, _Classes, [], _Lev, _Num) -> Ac;
do_calc_lev(Ac, Classes, [#item{lev = Lev} | T], 0,
            0) ->
    NewLev = Lev div 10 * 10,
    do_calc_lev(Ac, Classes, T, NewLev, 1);
do_calc_lev(Ac, Classes, [#item{lev = Lev} | T], MinLev,
            Num) ->
    NewLev = Lev div 10 * 10,
    case NewLev < MinLev of
        true -> do_calc_lev(Ac, Classes, T, NewLev, Num + 1);
        false -> do_calc_lev(Ac, Classes, T, MinLev, Num + 1)
    end.

do_calc_enchant(Ac, []) -> Ac;
do_calc_enchant(Ac, Eqm) ->
    case get_all_enchant(Eqm, 1000, 0) of
        false -> Ac;
        {ok, AttrList, _, _} ->
            case attr_type:do_attr(AttrList, Ac) of
                {false, Reason} ->
                    logger:error("强化全身计算出错[~w]", [Reason], eqm_attr, 501),
                    Ac;
                {ok, NewAc} -> NewAc
            end
    end.

get_all_enchant([], 1000, _) -> false;
get_all_enchant([], EnchantLev, EnchantNum) ->
    {Attr, Skl, NEnchantLev} = case EnchantLev < 1000
                                        andalso EnchantNum =:= 8
                                   of
                                   true ->
                                       case
                                           eqm_data:get_enchant_attr(EnchantLev)
                                           of
                                           false -> {[], [], EnchantLev};
                                           {AttrList, SkillPrac} ->
                                               {attr_type:to_attr(base,
                                                                  AttrList),
                                                SkillPrac,
                                                EnchantLev}
                                       end;
                                   false -> {[], [], 0}
                               end,
    {ok, Attr, Skl, NEnchantLev};
get_all_enchant([#item{type = Type, enchant = Enchant}
                 | T],
                EnchantLev, EnchantNum) ->
    {NewEnchantLev, NewEnchantNum} = case Enchant > 0 of
                                         true ->
                                             case lists:member(Type,
                                                               [1,
                                                                4,
                                                                2,
                                                                3,
                                                                5,
                                                                21,
                                                                22,
                                                                6,
                                                                7,
                                                                9,
                                                                10,
                                                                11,
                                                                12,
                                                                14])
                                                 of
                                                 false ->
                                                     {EnchantLev, EnchantNum};
                                                 true ->
                                                     case Enchant =< EnchantLev
                                                         of
                                                         true ->
                                                             {Enchant,
                                                              EnchantNum + 1};
                                                         false ->
                                                             {EnchantLev,
                                                              EnchantNum + 1}
                                                     end
                                             end;
                                         false -> {EnchantLev, EnchantNum}
                                     end,
    get_all_enchant(T, NewEnchantLev, NewEnchantNum).

do_calc_stone(Ac, []) -> Ac;
do_calc_stone(Ac,
              [#item{base_id = BaseId, attr = Attr} | T]) ->
    StoneAttr = get_stone_attr(Attr),
    case attr_type:do_attr(StoneAttr, Ac) of
        {false, Reason} ->
            logger:error("装备宝石计算出错[~w]:[~w]",
                         [BaseId, Reason],
                         eqm_attr,
                         544),
            do_calc_stone(Ac, T);
        {ok, NewAc} -> do_calc_stone(NewAc, T)
    end.

get_stone_attr(Attr) ->
    AddRatio = case lists:keyfind(151,
                                  #attr_base.name,
                                  Attr)
                   of
                   #attr_base{val = Val} -> Val;
                   _ -> 0
               end,
    get_stone_attr(Attr, AddRatio, []).

get_stone_attr([], AddRatio, StoneAttr) ->
    NewStoneAttr = do_calc_stone_attr(StoneAttr, AddRatio),
    attr_type:to_attr(base, NewStoneAttr);
get_stone_attr([#attr_base{type = 3, val = Val} | T],
               AddRatio, StoneAttr)
    when Val =/= 0 ->
    case blacksmith:stone_info(Val) of
        #{attr := Sattr} ->
            get_stone_attr(T, AddRatio, Sattr ++ StoneAttr);
        _ -> get_stone_attr(T, AddRatio, StoneAttr)
    end;
get_stone_attr([_ | T], AddRatio, StoneAttr) ->
    get_stone_attr(T, AddRatio, StoneAttr).

do_calc_stone_attr(StoneAttr, Ratio) ->
    [{K, round(V * (1000 + Ratio) / 1000)}
     || {K, V} <- StoneAttr].

do_calc_comprehend(Ac, Classes, Eqm) ->
    Craft = get_comprehend(Eqm, Classes, 0),
    case eqm_data:get_comprehend_attr({Craft, Classes}) of
        [H | T] ->
            AttrList = attr_type:to_attr(base, [H | T]),
            case attr_type:do_attr(AttrList, Ac) of
                {false, Reason} ->
                    logger:error("精炼全身计算出错[~w]", [Reason], eqm_attr, 580),
                    Ac;
                {ok, NewAc} -> NewAc
            end;
        _ -> Ac
    end.

get_comprehend([], _Classes, Craft) -> Craft;
get_comprehend([#item{attr = Attr, type = Type} | T],
               Classes, Craft) ->
    case do_get_comprehend(#{craft => 1, min => 0,
                             type => Type, classes => Classes,
                             attr =>
                                 [{Flag, V}
                                  || #attr_base{type = 5, flag = Flag, val = V}
                                         <- Attr]})
        of
        0 -> 0;
        NewCraft when Craft =:= 0 orelse NewCraft < Craft ->
            get_comprehend(T, Classes, NewCraft);
        _ -> get_comprehend(T, Classes, Craft)
    end.

do_get_comprehend(Args = #{craft := Craft, min := Min,
                           type := Type, classes := Classes, attr := L}) ->
    case lists:keyfind(Craft, 1, L) of
        {Craft, Val} ->
            case blacksmith_data:get_comprehend({Classes,
                                                 Type,
                                                 Craft})
                of
                #{max_val := Max} ->
                    case util:floor(5 * (Val / Max) + 5.0e-1) >= 4 of
                        true ->
                            do_get_comprehend(Args#{craft := Craft + 1,
                                                    min := Craft});
                        _ -> Min
                    end;
                _ -> Min
            end;
        _ -> Min
    end.

