-file("src/mod/market/market.erl", 1).

-module(market).

-export([query_all_price/2,
         query_priority_price/2,
         purchs_all/2,
         auto_buy_effect/2,
         get_open_srv_price/2,
         send_open_srv_notice/2,
         buy/3]).

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

-file("src/mod/market/market.erl", 24).

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

-file("src/mod/market/market.erl", 25).

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

-file("src/mod/market/market.erl", 26).

-file("inc/log.hrl", 1).

-file("src/mod/market/market.erl", 27).

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

-file("src/mod/market/market.erl", 28).

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

-file("src/mod/market/market.erl", 29).

-file("inc/assets.hrl", 1).

-record(assets,
        {ver = 41 :: pos_integer(),
         exp = 0 :: non_neg_integer(),
         coin = 0 :: non_neg_integer(),
         coin_bind = 0 :: non_neg_integer(),
         gold = 0 :: non_neg_integer(),
         gold_bind = 0 :: non_neg_integer(),
         intelligs = 0 :: non_neg_integer(),
         guild = 0 :: non_neg_integer(),
         energy = 0 :: non_neg_integer(),
         satiety = 300 :: non_neg_integer(),
         stars_score = 0 :: non_neg_integer(),
         reserve_exp = 0 :: non_neg_integer(),
         character = 0 :: non_neg_integer(),
         alchemy = 0 :: non_neg_integer(),
         love = 0 :: non_neg_integer(),
         teacher_score = 0 :: non_neg_integer(),
         tournament = 0 :: non_neg_integer(),
         lottery_luck = 0 :: non_neg_integer(),
         endless_challenge = 0 :: non_neg_integer(),
         handbook_point = 0 :: non_neg_integer(),
         autumn_score = 0 :: non_neg_integer(),
         star_gold = 0 :: non_neg_integer(),
         halloween = 0 :: non_neg_integer(),
         thanksgiving = 0 :: non_neg_integer(),
         new_year = 0 :: non_neg_integer(),
         firecracker = 0 :: non_neg_integer(),
         glue_pudding = 0 :: non_neg_integer(),
         crystal = 0 :: non_neg_integer(),
         ticket = 0 :: non_neg_integer(),
         brother = 0 :: non_neg_integer(),
         egg = 0 :: non_neg_integer(),
         exchange = 0 :: non_neg_integer(),
         turn = 0 :: non_neg_integer(),
         father = 0 :: non_neg_integer(),
         lucky_ticket = 0 :: non_neg_integer(),
         dollar = 0 :: non_neg_integer(),
         naughty = 0 :: non_neg_integer(),
         concentric = 0 :: non_neg_integer(),
         qixiIntegral = 0 :: non_neg_integer(),
         sunshine = 0 :: non_neg_integer(),
         cut_price = 0 :: non_neg_integer(),
         single_dog = 0 :: non_neg_integer(),
         panda_score = 0 :: non_neg_integer(),
         joyful_egg = 0 :: non_neg_integer(),
         godswar = 0 :: non_neg_integer(),
         skl_unique_exp = 0 :: non_neg_integer(),
         happy_score = 0 :: non_neg_integer(),
         slot_machine = 0 :: non_neg_integer(),
         reserve_gold = 0 :: non_neg_integer(),
         zillionaire_sc = 0,
         score_exchange = 0 :: non_neg_integer(),
         new_open_turn = 0 :: non_neg_integer(),
         long_active = 0 :: non_neg_integer(),
         long_score = 0 :: non_neg_integer(),
         camp_pray_sc = 0 :: non_neg_integer()}).

-file("src/mod/market/market.erl", 30).

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

-file("src/mod/market/market.erl", 31).

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

-file("src/mod/market/market.erl", 32).

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

-file("src/mod/market/market.erl", 33).

query_all_price(Ids, Role) ->
    case get_item_priority(Ids, []) of
        false -> false;
        NewIds -> query_priority_price(NewIds, Role)
    end.

query_priority_price(Ids, Role) ->
    case query_priority_price(Ids, Role, []) of
        false -> false;
        Acc -> {ok, Acc}
    end.

query_priority_price([], _Role, Acc) -> Acc;
query_priority_price([{Id, Priority} | Rest], Role,
                     Acc) ->
    case do_query_priority_price(Priority, Id, Role) of
        {ok, MarketPrice = #market_price{}} ->
            query_priority_price(Rest, Role, [MarketPrice | Acc]);
        _ ->
            logger:error("获取市场价格失败[Id:~w][source:~w]",
                         [Id, Priority],
                         market,
                         67),
            false
    end.

get_item_priority([], Acc) -> Acc;
get_item_priority([{BaseId} | Rest], Acc) ->
    case item_data:get_buy_source(BaseId) of
        Data = {_, List} when is_list(List) ->
            get_item_priority(Rest, [Data | Acc]);
        _None -> false
    end;
get_item_priority([_ | Rest], Acc) ->
    get_item_priority(Rest, Acc).

do_role_gain([], _WorldLev, GL, LogType, Role) ->
    {ok, GL, LogType, Role};
do_role_gain([{Type, BaseId, Num, Price} | Rest],
             WorldLev, GL, LogType, Role) ->
    Gain = #gain{label = item_base_id,
                 val = [{BaseId, 0, Num}]},
    TypeLoss = case Type of
                   3 -> #loss{label = coin, val = Num * Price};
                   2 -> #loss{label = gold_bind, val = Num * Price};
                   _False -> #loss{label = gold, val = Num * Price}
               end,
    case role_gain:do([TypeLoss, Gain], Role) of
        {ok, TypeLossRole} ->
            NewLogType = merge_log_type(Type, BaseId, Num, LogType),
            do_role_gain(Rest,
                         WorldLev,
                         [TypeLoss, Gain | GL],
                         NewLogType,
                         TypeLossRole);
        {false, #loss{label = coin, val = Val}} ->
            case market_silver_data:get_exchange(WorldLev) of
                Rate when is_integer(Rate) ->
                    NewVal = util:ceil(Val / Rate),
                    Loss = #loss{label = gold, val = NewVal},
                    case role_gain:do([Loss, Gain], Role) of
                        {ok, LossRole} ->
                            NewLogType = merge_log_type(1,
                                                        BaseId,
                                                        Num,
                                                        LogType),
                            do_role_gain(Rest,
                                         WorldLev,
                                         [Loss, Gain | GL],
                                         NewLogType,
                                         LossRole);
                        _GoldFalse -> {false, lang:get("钻石不足")}
                    end;
                _None -> {false, lang:get("银币不足")}
            end;
        {false, #loss{label = gold_bind, val = Val}} ->
            case market_gold_data:get_exchange(WorldLev) of
                Rate when is_integer(Rate) ->
                    NewVal = util:ceil(Val / Rate),
                    Loss = #loss{label = gold, val = NewVal},
                    case role_gain:do([Loss, Gain], Role) of
                        {ok, LossRole} ->
                            NewLogType = merge_log_type(1,
                                                        BaseId,
                                                        Num,
                                                        LogType),
                            do_role_gain(Rest,
                                         WorldLev,
                                         [Loss, Gain | GL],
                                         NewLogType,
                                         LossRole);
                        _GoldLoss -> {false, lang:get("钻石不足")}
                    end;
                _None -> {false, lang:get("金币不足")}
            end;
        _Unknow -> {false, lang:get("钻石不足")}
    end.

merge_log_type(Type, BaseId, Num, LogType) ->
    case lists:keytake(Type, 1, LogType) of
        {value, {Type, List}, RestLogType} ->
            [{Type, [{BaseId, Num} | List]} | RestLogType];
        false -> [{Type, [{BaseId, Num}]} | LogType]
    end.

purchs_all(Items, Role) ->
    NewItems = package:merge(Items),
    purchs_all(NewItems, [], Role).

purchs_all([], Acc, Role) ->
    {WorldLev, _NextTime} = world_lev:get_world_lev(Role),
    case do_role_gain(Acc, WorldLev, [], [], Role) of
        {ok, GL, LogType, NRole} ->
            GoldSource = case lists:keyfind(2, 1, LogType) of
                             {_, List} -> List;
                             _False -> []
                         end,
            purchs_all_margin(GoldSource, Role),
            Text = format:gain_text(GL, NRole),
            notice:send(NRole, 3, Text),
            {ok, NRole};
        {false, Msg} -> {false, Msg};
        _False -> {false, ""}
    end;
purchs_all([{BaseId, Num} | Rest], Acc, Role) ->
    case item_data:get_buy_source(BaseId) of
        Priority = {_, List} when is_list(List) ->
            case query_priority_price([Priority], Role) of
                false -> false;
                {ok, [{Type, [{_BaseId, Price}]}]} ->
                    purchs_all(Rest,
                               [{Type, BaseId, Num, Price} | Acc],
                               Role)
            end;
        _None -> {false, lang:get("钻石不足")}
    end.

buy(Role, List, Scene) ->
    case role_gain:item_base_id_to_assets(List,
                                          Role,
                                          [],
                                          [],
                                          [],
                                          [],
                                          [])
        of
        {ok,
         AssetsLoss,
         _MarketEffect,
         _LogItems,
         GainItems,
         Role1,
         NewLog} ->
            Loss = AssetsLoss ++ format:val_to_gain(GainItems),
            case role_gain:do_notice(Loss, Role1) of
                {ok, NewRole} ->
                    Text = case rpc_cfg:log_title(Scene, 0) of
                               undefined -> lang:get("快捷购买");
                               Title -> Title
                           end,
                    log:make_market_log(NewRole, Text, AssetsLoss, NewLog),
                    {ok, NewRole};
                {false, #loss{msg = Msg}} -> {false, Msg};
                {false, #gain{msg = Msg}} -> {false, Msg};
                _ -> {false, lang:get("背包空间不足")}
            end;
        {false, Msg} when is_list(Msg) -> {false, Msg};
        _False -> {false, lang:get("购买错误")}
    end.

purchs_all_margin([], _Role) -> [];
purchs_all_margin(GoldSource, Role) ->
    case market_gold:change_margin(buy, GoldSource, Role) of
        {ok, Acc} -> Acc;
        _False -> []
    end.

auto_buy_effect([], _Role) -> ok;
auto_buy_effect([{5, ItemInfo} | Rest], Role) ->
    logger:debug("======~w", [ItemInfo], market, 259),
    market_gold:change_margin(buy, ItemInfo, Role),
    auto_buy_effect(Rest, Role);
auto_buy_effect([{4, ItemInfo} | Rest], Role) ->
    market_silver:auto_buy_seller(ItemInfo, Role),
    auto_buy_effect(Rest, Role);
auto_buy_effect([_H | Rest], Role) ->
    auto_buy_effect(Rest, Role).

get_open_srv_price(20038, Price) ->
    get_open_srv_price(Price);
get_open_srv_price(20095, Price) ->
    get_open_srv_price(Price);
get_open_srv_price(_, Price) -> Price.

get_open_srv_price(Price) ->
    case date:open_srv_day() =< 14 of
        true -> util:floor(Price * 9.0e-1);
        _ -> Price
    end.

send_open_srv_notice([{_BaseId, 0} | T], Role) ->
    send_open_srv_notice(T, Role);
send_open_srv_notice([{BaseId, _Num} | T], Role) ->
    send_open_srv_notice(BaseId, Role),
    send_open_srv_notice(T, Role);
send_open_srv_notice(20038, Role) ->
    send_open_srv_notice2(Role);
send_open_srv_notice(20095, Role) ->
    send_open_srv_notice2(Role);
send_open_srv_notice(_, _) -> "".

send_open_srv_notice2(Role) ->
    case date:open_srv_day() =< 14 of
        true ->
            notice:send(Role,
                        1,
                        notice:format(lang:get("已享受开服活动期间~ts兑换优惠"),
                                      [{string_2, 5, lang:get("9折")}]));
        _ -> ""
    end.

do_query_priority_price([], _Id, _Role) -> false;
do_query_priority_price([Type = 1 | Rest], Id, Role) ->
    case shop_mgr:get_shop_item2(Id, Role) of
        {ok, Price, _AssetsType, SId} ->
            {ok,
             #market_price{base_id = Id, price = Price,
                           source = Type, assets = 90002, val1 = SId}};
        _ -> do_query_priority_price(Rest, Id, Role)
    end;
do_query_priority_price([2 | Rest], Id, Role) ->
    case market_gold:query_market_price(Id) of
        {ok, MarketPrice} -> {ok, MarketPrice};
        false -> do_query_priority_price(Rest, Id, Role)
    end;
do_query_priority_price([3 | Rest], Id, Role) ->
    case market_silver:query_market_price(Id) of
        {ok, MarketPrice} -> {ok, MarketPrice};
        false -> do_query_priority_price(Rest, Id, Role)
    end;
do_query_priority_price([Type = 4 | Rest], Id, Role) ->
    case npc_shop:exchange_gold(Id, 1, Role) of
        {ok, Price} ->
            {ok,
             #market_price{base_id = Id, price = Price,
                           source = Type, assets = 90002}};
        false -> do_query_priority_price(Rest, Id, Role)
    end;
do_query_priority_price([_H | _Rest], _Id, _Role) ->
    false.

