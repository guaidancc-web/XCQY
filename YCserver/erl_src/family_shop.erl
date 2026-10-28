-file("src/mod/family/family_shop.erl", 1).

-module(family_shop).

-file("inc/family.hrl", 1).

-record(beans_reward,
        {id = 0,
         giver_id = {0, "", 0},
         giver_name = "",
         belong_id = {0, "", 0},
         pos = {0, 0},
         give_time = 0}).

-record(magic_beans,
        {ver = 2,
         growth = 0 :: non_neg_integer(),
         flower_num = 0 :: non_neg_integer(),
         wake_time = 0 :: non_neg_integer(),
         event_record = [],
         fosters = [],
         inviters = [],
         beans_rewards = [],
         next_beanrw_id = 0}).

-record(family_info,
        {ver = 5 :: pos_integer(),
         id = {0, "", 0},
         master_id = {0, "", 0},
         master_name = "",
         master_classes = 0 :: pos_integer(),
         master_lev = 1 :: pos_integer(),
         master_sex = 0 :: 0..2,
         lover_id = {0, "", 0},
         lover_name = "",
         pid :: undefined | pid(),
         house_info = undefined,
         yard_info = undefined,
         visitor = [],
         last_visit_time = 0,
         visit_lock = 1,
         last_rf_time = 0,
         magic_beans = #magic_beans{},
         battle_id}).

-record(furnishing,
        {id = 0 :: non_neg_integer(),
         base_id = 0,
         num = 1,
         status = 1,
         belong = {0, "", 0},
         pos = {1, 1, 1, 1} :: tuple(),
         dir = 0 :: 0..1}).

-record(house_info,
        {ver = 3 :: pos_integer(),
         map_id = 0,
         map_pid :: undefined | pid(),
         furnishings = [] :: list(),
         env_val = 0,
         lev = 1 :: pos_integer(),
         floor_lev = 0 :: non_neg_integer(),
         bdg_info = [] :: list(),
         furishing_max_lev_info = [] :: list(),
         next_fur_id = 1,
         cleanness = 100,
         last_clean_time = 0,
         housekeeper_action_times = 0,
         is_upgrade_bdg = []}).

-record(building_info, {type = 1, lev = 0, exp = 0}).

-record(yard_info,
        {ver = 1 :: pos_integer(),
         map_id = 0,
         map_pid :: undefined | pid(),
         furnishings = [] :: list(),
         levl = 1 :: pos_integer(),
         floor_lev = 0 :: non_neg_integer()}).

-record(family_store,
        {ver = 1,
         next_time = 0 :: non_neg_integer(),
         goods_list = []}).

-record(m_family,
        {ver = 1,
         cur_id = {0, "", 0},
         pid :: undefined | pid(),
         idle_family = {0, "", 0},
         family_store = #family_store{},
         family_effect = [],
         effect_use_info = []}).

-record(family_pet_train_info,
        {id = 1, pet_id = 0, end_time = 0}).

-record(fshop_item,
        {id = 0,
         store_type = 1,
         base_id = 0,
         type = 90000,
         val = 0,
         count = 1}).

-record(family_child,
        {id = {0, "", 0},
         name = "",
         classes = 0 :: pos_integer(),
         lev = 1 :: pos_integer(),
         sex = 0 :: 0..2,
         stage = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         unit_id = {0, 0},
         unit_base_id = 0}).

-file("src/mod/family/family_shop.erl", 12).

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

-file("src/mod/family/family_shop.erl", 13).

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

-file("src/mod/family/family_shop.erl", 14).

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

-file("src/mod/family/family_shop.erl", 15).

-export([buy/3,
         login/1,
         push_11211/1,
         flush_store/1,
         open_store/1]).

login(#role{m_family = #m_family{cur_id = FamilyId}})
    when FamilyId =:= {0, "", 0} ->
    ok;
login(Role = #role{m_family =
                       MFamily = #m_family{family_store =
                                               FamilyStore =
                                                   #family_store{next_time =
                                                                     NextTime}}}) ->
    Now = date:unixtime(),
    case Now >= NextTime of
        true ->
            NewGoods = rand_fshop_item(Role),
            NextDiff = date:next_diff(21, 0, 0),
            NewNextTime = Now + NextDiff,
            NewFamilyStore = FamilyStore#family_store{next_time =
                                                          NewNextTime,
                                                      goods_list = NewGoods},
            NewRole = Role#role{m_family =
                                    MFamily#m_family{family_store =
                                                         NewFamilyStore}},
            NewRole1 = role_timer:set(#timer{id =
                                                 reset_family_store_nine,
                                             timeout = NextDiff * 1000,
                                             times = 1, m = family_shop,
                                             f = flush_store, a = []},
                                      NewRole),
            {ok, NewRole1};
        false ->
            NextDiff = NextTime - Now,
            Role1 = role_timer:set(#timer{id =
                                              reset_family_store_nine,
                                          timeout = NextDiff * 1000, times = 1,
                                          m = family_shop, f = flush_store,
                                          a = []},
                                   Role),
            {ok, Role1}
    end;
login(_) -> ok.

buy(Role = #role{m_family =
                     MFamily = #m_family{family_store =
                                             FamilyStore =
                                                 #family_store{goods_list =
                                                                   GoodsList}}},
    GoodsId, Num) ->
    case lists:keyfind(GoodsId, #fshop_item.id, GoodsList)
        of
        Fitem = #fshop_item{type = Label, val = Val,
                            count = Count, base_id = BaseId}
            when Count > 0 ->
            BuyNum = min(Count, Num),
            Loss = format:val_to_loss([{Label, Val * BuyNum}]),
            case role_gain:do_notice(Loss, Role) of
                {ok, LossRole} ->
                    case family_logic:add_frunishing(Role, BaseId, BuyNum)
                        of
                        ok ->
                            NewFItem = Fitem#fshop_item{count = Count - BuyNum},
                            NewGoodsList = lists:keystore(GoodsId,
                                                          #fshop_item.id,
                                                          GoodsList,
                                                          NewFItem),
                            NewRole = LossRole#role{m_family =
                                                        MFamily#m_family{family_store
                                                                             =
                                                                             FamilyStore#family_store{goods_list
                                                                                                          =
                                                                                                          NewGoodsList}}},
                            push_11211(NewRole, [NewFItem]),
                            {ok, NewRole};
                        {false, Reason} -> {false, Reason};
                        _Else ->
                            logger:error("购买家具时，添加家具出错:~w",
                                         [_Else],
                                         family_shop,
                                         67),
                            _Else
                    end;
                _ -> {false, lang:get("购买所需资源不足")}
            end;
        _ -> {false, lang:get("已经售罄")}
    end.

flush_store(Role = #role{m_family =
                             MFamily = #m_family{family_store =
                                                     FamilyStore =
                                                         #family_store{}}}) ->
    Now = date:unixtime(),
    NewGoods = rand_fshop_item(Role),
    NextDiff = date:next_diff(21, 0, 0),
    NewNextTime = Now + NextDiff,
    NewFamilyStore = FamilyStore#family_store{next_time =
                                                  NewNextTime,
                                              goods_list = NewGoods},
    NewRole = Role#role{m_family =
                            MFamily#m_family{family_store = NewFamilyStore}},
    NewRole1 = role_timer:set(#timer{id =
                                         reset_family_store_nine,
                                     timeout = NextDiff * 1000, times = 1,
                                     m = family_shop, f = flush_store, a = []},
                              NewRole),
    push_11211(NewRole1),
    {ok, NewRole1};
flush_store(Role) -> {ok, Role}.

rand_fshop_item(#role{lev = Lev, classes = Classes,
                      sex = Sex}) ->
    NormalGoodsList = case family_data:get_rand_list(1) of
                          NL = [_ | _] -> NL;
                          _ -> []
                      end,
    RandNormalStoreList = filter_condition(Lev,
                                           Classes,
                                           Sex,
                                           NormalGoodsList),
    {CN, _} = family_data:get_store_rf_count(),
    NormalResultList = case
                           util:rand_list_n(RandNormalStoreList, 2, CN)
                           of
                           NRandList when is_list(NRandList) ->
                               Fun = fun ({GoodsId, _}, NResultList) ->
                                             case
                                                 family_data:get_furnishing_goods(GoodsId)
                                                 of
                                                 FsItem = #fshop_item{} ->
                                                     [FsItem | NResultList];
                                                 _ -> NResultList
                                             end;
                                         (_, NResultList) -> NResultList
                                     end,
                               lists:foldr(Fun, [], NRandList);
                           _ -> []
                       end,
    SumptuousGoodsList = case family_data:get_rand_list(2)
                             of
                             SL = [_ | _] -> SL;
                             _ -> []
                         end,
    RandSumptuousStoreList = filter_condition(Lev,
                                              Classes,
                                              Sex,
                                              SumptuousGoodsList),
    {_, CS} = family_data:get_store_rf_count(),
    case util:rand_list_n(RandSumptuousStoreList, 2, CS) of
        SRandList when is_list(SRandList) ->
            SFun = fun ({GoodsId, _}, SResultList) ->
                           case family_data:get_furnishing_goods(GoodsId) of
                               FsItem = #fshop_item{} -> [FsItem | SResultList];
                               _ -> SResultList
                           end;
                       (_, SResultList) -> SResultList
                   end,
            lists:foldr(SFun, NormalResultList, SRandList);
        _ -> []
    end.

filter_condition(Lev, Classes, Sex, RandList) ->
    filter_condition(Lev, Classes, Sex, RandList, []).

filter_condition(_, _, _, [], ResultList) -> ResultList;
filter_condition(Lev, Classes, Sex,
                 [#{id := Id, lev_low := CfgLevLow,
                    lev_high := CfgLevHigh, classes := CfgClasses,
                    sex := CfgSex, ratio := Ratio}
                  | Rest],
                 ResultList) ->
    case Lev >= CfgLevLow andalso
             Lev =< CfgLevHigh andalso
                 (Sex =:= CfgSex orelse CfgSex =:= 2) andalso
                     (Classes =:= CfgClasses orelse CfgClasses =:= 0)
        of
        true ->
            filter_condition(Lev,
                             Classes,
                             Sex,
                             Rest,
                             [{Id, Ratio} | ResultList]);
        false ->
            filter_condition(Lev, Classes, Sex, Rest, ResultList)
    end.

push_11211(Role = #role{m_family =
                            #m_family{family_store =
                                          #family_store{goods_list =
                                                            GoodsList}}}) ->
    role:link_send(Role, 11211, {GoodsList}),
    ok;
push_11211(_) -> ok.

push_11211(Role, GoodsList) ->
    role:link_send(Role, 11211, {GoodsList}),
    ok.

open_store(Role = #role{m_family =
                            MFamily = #m_family{family_store =
                                                    FamilyStore =
                                                        #family_store{next_time
                                                                          =
                                                                          NextTime}}}) ->
    Now = date:unixtime(),
    case Now >= NextTime of
        true ->
            NewGoods = rand_fshop_item(Role),
            NextDiff = date:next_diff(21, 0, 0),
            NewNextTime = Now + NextDiff,
            NewFamilyStore = FamilyStore#family_store{next_time =
                                                          NewNextTime,
                                                      goods_list = NewGoods},
            NewRole = Role#role{m_family =
                                    MFamily#m_family{family_store =
                                                         NewFamilyStore}},
            NewRole1 = role_timer:set(#timer{id =
                                                 reset_family_store_nine,
                                             timeout = NextDiff * 1000,
                                             times = 1, m = family_shop,
                                             f = flush_store, a = []},
                                      NewRole),
            push_11211(NewRole1),
            NewRole1;
        false ->
            NextDiff = NextTime - Now,
            Role1 = role_timer:set(#timer{id =
                                              reset_family_store_nine,
                                          timeout = NextDiff * 1000, times = 1,
                                          m = family_shop, f = flush_store,
                                          a = []},
                                   Role),
            Role1
    end;
open_store(Role) -> Role.

