-file("src/mod/market/market_tests.erl", 1).

-module(market_tests).

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

-file("src/mod/market/market_tests.erl", 13).

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

-file("src/mod/market/market_tests.erl", 14).

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

-file("src/mod/market/market_tests.erl", 15).

-file("inc/market.hrl", 1).

-record(market_price,
        {base_id = 0,
         price = 0,
         assets = 0,
         source = 0,
         val1 = 0,
         val2 = 0,
         val3 = 0,
         val4 = 0}).

-file("src/mod/market/market_tests.erl", 16).

-file("inc/market_silver.hrl", 1).

-record(m_market_silver,
        {ver = 1,
         refresh_time = 0,
         is_first_on_sale = 1,
         refresh = []}).

-record(market_silver_shop,
        {ver = 2,
         rid,
         max_cell_id = 0,
         free_ids = [],
         cells = [],
         name = "",
         pid,
         last_logout = 0}).

-record(market_silver_shop_cell,
        {ver = 2,
         cell_id = 0,
         item_base_id = 0,
         num = 0,
         item_attrs = [],
         price = 0,
         expiry = 0,
         sold_num = 0,
         status = 0,
         system_price = 0,
         percent = 100,
         sale_time = 0}).

-record(market_silver_price,
        {ver = 3,
         item_base_id = 0,
         price = 0,
         sellers = [],
         deal_price = [],
         recover_num = 0,
         day_recover = 0,
         day_auto = 0,
         ext = []}).

-record(market_silver_refresh,
        {id = 0,
         item_base_id = 0,
         num = 0,
         item_attrs = [],
         price = 0,
         cell_id = 0,
         seller_id,
         status = 0}).

-record(market_silver_item_data,
        {base_id = 0,
         type = 0,
         step = 0,
         classes = 0,
         min_lev = 0,
         max_lev = 0,
         is_system = 1,
         is_quest_need = 0,
         def_price = 0,
         min_price = 0,
         max_price = 0,
         gain_label = coin,
         world_lev = 0,
         pre_base_id = 0,
         pre_pcnt = 1000,
         group = 0,
         group_id = 0,
         update_time,
         chain_type = 0,
         fix_price = 0}).

-record(market_silver_draw_item,
        {cell_id = 0,
         base_id = 0,
         num = 0,
         rest = 0,
         price = 0,
         pcnt = 0,
         attrs = []}).

-file("src/mod/market/market_tests.erl", 17).

-file("inc/market_gold.hrl", 1).

-record(m_market_gold, {ver = 1, limit_data = []}).

-record(market_gold_item_data,
        {id :: undefined | pos_integer(),
         base_id :: undefined | pos_integer(),
         catalg_1 :: undefined | pos_integer(),
         catalg_2 :: undefined | pos_integer(),
         init_price :: undefined | non_neg_integer(),
         init_stock :: undefined | non_neg_integer(),
         world_lev :: undefined | non_neg_integer(),
         max_price :: undefined | non_neg_integer(),
         min_price :: undefined | non_neg_integer(),
         is_exchange :: undefined | 0 | 1,
         day_limit :: undefined | non_neg_integer(),
         classes :: undefined | non_neg_integer(),
         up_ratio :: undefined | non_neg_integer(),
         down_ratio :: undefined | non_neg_integer()}).

-record(market_gold_item,
        {id :: undefined | pos_integer(),
         base_id = 0 :: pos_integer(),
         stock = 0 :: non_neg_integer(),
         init_stock = 0 :: non_neg_integer(),
         init_price = 0 :: non_neg_integer(),
         def_price = 0 :: non_neg_integer(),
         cur_price = 0 :: non_neg_integer(),
         margin = 1000 :: non_neg_integer(),
         margin_acc = 1000 :: non_neg_integer(),
         day_sold = 0 :: non_neg_integer(),
         day_buy = 0 :: non_neg_integer(),
         ver = 1 :: non_neg_integer()}).

-record(market_gold_change_item,
        {base_id = 0 :: pos_integer(),
         got_list = [] :: list(),
         catalg_1 = 0 :: pos_integer(),
         catalg_2 = 0 :: pos_integer()}).

-record(market_gold_price,
        {base_id = 0,
         margin_type = 0,
         init_price = 0,
         buy_price = 0,
         margin = 0}).

-record(market_gold_limit_data,
        {id = 0,
         min = 0,
         max = 0,
         num = 0,
         is_show = 0,
         type = 0}).

-file("src/mod/market/market_tests.erl", 18).

-export([gm_check_recover/0,
         gm_recover/0,
         gm_silver_print_price/0,
         gm_silver_reset/0]).

-export([gm_gold_lookup/1,
         gm_gold_lookup_items/3,
         gm_gold_refresh/0,
         gm_gold_set/5]).

gm_check_recover() ->
    F = fun (#market_silver_price{recover_num = Num,
                                  item_base_id = ItemBaseId},
             Acc)
                when Num > 0 ->
                ItemName = item:attr(name, ItemBaseId),
                Msg = util:flist("base_id:~w, name:~ts, 回购数量:~w~n",
                                 [ItemBaseId, ItemName, Num]),
                [Msg | Acc];
            (_, Acc) -> Acc
        end,
    Rtn = ets:foldl(F, [], market_silver_price_tab),
    case Rtn of
        [_ | _] -> string:join(Rtn, ",");
        _ -> util:flist("没有需要回购道具")
    end.

gm_recover() ->
    case case catch gen_server:call(market_silver,
                                    server_recover,
                                    10000)
             of
             {'EXIT', {timeout, _}} -> {error, timeout};
             {'EXIT', {noproc, _}} -> {error, noproc};
             {'EXIT', {normal, _}} -> {error, exit};
             {'EXIT', _Call_Err} -> {error, _Call_Err};
             _Call_Return -> _Call_Return
         end
        of
        {ok, ShopList} ->
            F = fun (#market_silver_shop{name = Name,
                                         cells = Cells},
                     Acc) ->
                        Msg = util:flist("name:~ts, 摊位信息:~w~n", [Name, Cells]),
                        [Msg | Acc];
                    (_, Acc) -> Acc
                end,
            Rtn = lists:foldl(F, [], ShopList),
            case Rtn of
                [_ | _] -> string:join(Rtn, ",");
                _ -> util:flist("没有可以回购的物品")
            end;
        _ -> util:flist("没有可以回购的物品")
    end.

gm_silver_print_price() ->
    F = fun (#market_silver_price{item_base_id = ItemBaseId,
                                  price = Price, deal_price = DealPrice},
             Acc) ->
                ItemName = item:attr(name, ItemBaseId),
                Msg =
                    util:flist("base_id:~w, name:~ts, 当前价格:~w, 当日成交价格列表:~w~n",
                               [ItemBaseId, ItemName, Price, DealPrice]),
                [Msg | Acc];
            (_, Acc) -> Acc
        end,
    Rtn = ets:foldl(F, [], market_silver_price_tab),
    string:join(Rtn, ",").

gm_silver_reset() ->
    market_silver ! reset,
    util:flist("重置银币市场完成").

gm_gold_lookup(BaseId) ->
    case catch ets:lookup(market_gold_item_tab, BaseId) of
        [#market_gold_item{stock = Stock,
                           init_stock = InitStock, init_price = InitPirce,
                           margin = Margin}] ->
            case item_data:get(BaseId) of
                #item_base{name = Name} ->
                    util:flist("查询金币市场数据[BaseId:~w][name:~ts][当前库存:~w][当日起始库存"
                               ":~w][当日起始价格:~w][幅度:~w]",
                               [BaseId,
                                Name,
                                Stock,
                                InitStock,
                                InitPirce,
                                Margin]);
                _False ->
                    util:flist("查询金币市场数据错误，不存在物品[BaseId:~w]", [BaseId])
            end;
        _ -> util:flist("查询金币市场数据错误[BaseId:~w]", [BaseId])
    end.

gm_gold_lookup_items(Catalg1, Catalg2, Role) ->
    CurWorldLev = world_lev:get_world_lev(Role),
    Catalg = {Catalg1, Catalg2},
    case market_gold_data:get_catalg_world_lev(Catalg) of
        CatalgWorldLev when CurWorldLev >= CatalgWorldLev ->
            Ids = market_gold_data:get_catalg_items(Catalg),
            NewIds = [Id
                      || {Id, ItemWorldLev} <- Ids,
                         ItemWorldLev =< CurWorldLev],
            Items = market_gold:get_items(NewIds, []),
            BaseIds = [Id
                       || #market_gold_item{base_id = Id} <- Items],
            util:flist("查询市场类别[Catalg1:~w][Catalg2:~w]~n列表:~w",
                       [Catalg1, Catalg2, BaseIds]);
        _WorldLev ->
            util:flist("查询市场类别数据错误[Catalg1:~w][Catalg2:~w]",
                       [Catalg1, Catalg2])
    end.

gm_gold_refresh() ->
    case case catch gen_server:call(market_gold,
                                    reset,
                                    10000)
             of
             {'EXIT', {timeout, _}} -> {error, timeout};
             {'EXIT', {noproc, _}} -> {error, noproc};
             {'EXIT', {normal, _}} -> {error, exit};
             {'EXIT', _Call_Err} -> {error, _Call_Err};
             _Call_Return -> _Call_Return
         end
        of
        {ok, List} ->
            F = fun (#market_gold_item{base_id = BaseId,
                                       stock = Stock, init_stock = InitStock,
                                       init_price = InitPirce, margin = Margin},
                     Acc) ->
                        Name = item:attr(name, BaseId),
                        Args = [BaseId,
                                Name,
                                Stock,
                                InitStock,
                                InitPirce,
                                Margin],
                        Msg =
                            util:flist("[BaseId:~w][name:~ts][当前库存:~w][当日起始库存:~w][当日起"
                                       "始价格:~w][幅度:~w]~n",
                                       Args),
                        [Msg | Acc];
                    (_, Acc) -> Acc
                end,
            Rtn = lists:foldl(F, [], List),
            case Rtn of
                [_ | _] -> string:join(Rtn, ",");
                _ -> util:flist("没有要更新的物品")
            end;
        _ -> util:flist("刷新失败")
    end.

gm_gold_set(BaseId, CurPrice, InitPrice, Stock, Role) ->
    case catch ets:lookup(market_gold_item_tab, BaseId) of
        [Item = #market_gold_item{}] ->
            Item1 = case CurPrice >= 0 of
                        true -> Item#market_gold_item{cur_price = CurPrice};
                        false -> Item
                    end,
            Item2 = case InitPrice >= 0 of
                        true -> Item1#market_gold_item{init_price = InitPrice};
                        false -> Item1
                    end,
            Item3 = case Stock >= 0 of
                        true -> Item2#market_gold_item{stock = Stock};
                        false -> Item2
                    end,
            NewItem = Item3,
            catch ets:insert(market_gold_item_tab, NewItem),
            catch dets:insert(market_gold_item_tab, NewItem),
            role:link_send(Role, 12418, {[NewItem]}),
            util:flist("设置金市[id:~w]数据成功", [BaseId]);
        _ -> util:flist("设置金市数据失败，未知的道具[id:~w]", [BaseId])
    end.

