-file("src/mod/shop/npc_shop.erl", 1).

-module(npc_shop).

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

-file("src/mod/shop/npc_shop.erl", 16).

-file("inc/npc_shop.hrl", 1).

-record(npc_shop_item_data,
        {base_id :: undefined | pos_integer(),
         name :: undefined | pos_integer(),
         classes = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         step = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         group = 0 :: non_neg_integer(),
         lev_limit = 0 :: non_neg_integer(),
         price :: undefined | pos_integer(),
         item_cost :: undefined | pos_integer()}).

-file("src/mod/shop/npc_shop.erl", 17).

-file("inc/log.hrl", 1).

-file("src/mod/shop/npc_shop.erl", 18).

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

-file("src/mod/shop/npc_shop.erl", 19).

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

-file("src/mod/shop/npc_shop.erl", 20).

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

-file("src/mod/shop/npc_shop.erl", 21).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/shop/npc_shop.erl", 22).

-record(args, {a1, a2, a3, a4, a5 = []}).

-export([buy/4, exchange_gold/3]).

buy(2, Role = #role{classes = Classes, lev = Lev},
    BaseID, Num) ->
    case npc_shop_data:get_eqm(BaseID) of
        #npc_shop_item_data{lev_limit = LevCfg}
            when LevCfg > Lev ->
            {false, lang:get("等级不足，无法购买")};
        #npc_shop_item_data{classes = ClassesCfg, price = Price}
            when ClassesCfg =:= 0 orelse Classes =:= ClassesCfg ->
            Args = #args{a1 = BaseID, a2 = Num, a3 = Price,
                         a4 = undefined},
            buy_flow([check, final], Role, Args);
        _None -> {false, lang:get("此物品只有指定的职业才能购买 ")}
    end;
buy(1, Role = #role{lev = Lev}, BaseID, Num) ->
    case npc_shop_data:get_medicine(BaseID) of
        #npc_shop_item_data{lev_limit = LevCfg}
            when LevCfg > Lev ->
            {false, lang:get("等级不足，无法购买")};
        #npc_shop_item_data{price = Price, step = Step} ->
            Args = #args{a1 = BaseID, a2 = Num, a3 = Price,
                         a4 = Step},
            buy_flow([check, final], Role, Args);
        _None -> false
    end;
buy(3, Role = #role{lev = Lev}, BaseID, Num) ->
    case npc_shop_data:get_challenge_medicine(BaseID) of
        #npc_shop_item_data{lev_limit = LevCfg}
            when LevCfg > Lev ->
            {false, lang:get("等级不足，无法购买")};
        #npc_shop_item_data{price = Price} ->
            Args = #args{a1 = BaseID, a2 = Num, a3 = Price,
                         a4 = max(1, Lev - 20)},
            buy_flow([check, final], Role, Args);
        _None -> false
    end;
buy(4,
    Role = #role{lev = Lev, classes = Classes, sex = Sex},
    BaseID, Num) ->
    case npc_shop_data:get_fashion_exchange(BaseID) of
        #npc_shop_item_data{lev_limit = LevCfg}
            when LevCfg > Lev ->
            {false, lang:get("等级不足，无法购买")};
        #npc_shop_item_data{sex = ItemSex}
            when ItemSex =/= Sex andalso ItemSex =/= 2 ->
            {false, lang:get("你的性别不符合，无法购买此商品")};
        #npc_shop_item_data{classes = ItemClasses}
            when ItemClasses =/= Classes andalso
                     ItemClasses =/= 0 ->
            {false, lang:get("你的职业不符合，无法购买此商品")};
        #npc_shop_item_data{price = Price,
                            item_cost = ItemCost} ->
            Args = #args{a1 = BaseID, a2 = Num, a3 = Price,
                         a4 = undefined, a5 = ItemCost},
            buy_flow([check, final], Role, Args);
        _None -> false
    end;
buy(_, _, _, _) -> false.

exchange_gold(BaseId, Num, Role) ->
    {WorldLev, _Time} = world_lev:get_world_lev(Role),
    case market_silver_data:get_exchange(WorldLev) of
        Rate when is_integer(Rate) ->
            case npc_shop_data:get(BaseId) of
                #npc_shop_item_data{price = UnitPrice} ->
                    {ok, util:ceil(UnitPrice / Rate) * Num};
                false -> false
            end;
        _None -> false
    end.

buy_flow([], _, _) -> false;
buy_flow([check | _],
         #role{p_bag = #package{free_cell = []}}, _) ->
    {false, lang:get("背包已满，无法购买")};
buy_flow([check | RestSteps], Role, Args) ->
    buy_flow(RestSteps, Role, Args);
buy_flow([final], Role = #role{pid = Pid},
         #args{a1 = BaseID, a2 = Num, a3 = Price, a4 = Step,
               a5 = ItemCost}) ->
    logger:debug("购买NPC商店物品:~w",
                 [{BaseID, Num, Price, Step}],
                 npc_shop,
                 110),
    Loss = #loss{label = coin, val = Num * Price,
                 msg = lang:get("银币不足，无法购买该物品")},
    ItemCosts = [{ItemId, Count * Num}
                 || {ItemId, Count} <- ItemCost],
    Cost = format:val_to_loss(ItemCosts),
    Gain = case Step of
               undefined ->
                   #gain{label = item_base_id,
                         val =
                             [#{base_id => BaseID, bind => 1,
                                quantity => Num}]};
               Step ->
                   #gain{label = item_base_id,
                         val =
                             [#{base_id => BaseID, bind => 1, step => Step,
                                quantity => Num}]}
           end,
    GL = Cost ++ [Loss, Gain],
    case role_gain:do(GL, Role) of
        Rtn = {ok, NewRole} ->
            Text = format:gain_text(GL, NewRole),
            notice:send(NewRole, 3, Text),
            notice:gain_item(Pid, 1, [{BaseID, Num}]),
            LogText = log_buy_text(Loss, Gain),
            log:assets(log_npc_shop, Role, NewRole, "购买", LogText),
            case both of
                both ->
                    case catch log_old:assets(log_npc_shop,
                                              Role,
                                              NewRole,
                                              "购买",
                                              LogText)
                        of
                        _Err = {'EXIT', _} ->
                            logger:error("日志记录时出错:~w", [_Err], npc_shop, 129),
                            ok;
                        _ -> ok
                    end;
                _ -> skip
            end,
            Rtn;
        {false, #loss{msg = Msg}} -> {false, Msg};
        {false, #gain{msg = Msg}} -> {false, Msg};
        _Err ->
            logger:error("购买NPC商店物品错误[~w]", [_Err], npc_shop, 136),
            false
    end;
buy_flow(Steps, _, _) ->
    logger:error("购买NPC物品流程出错[~w]", [Steps], npc_shop, 140),
    false.

log_buy_text(Loss, Gain) ->
    util:flist("~ts$$~ts",
               [log:item_str(Loss), log:item_str(Gain)]).

