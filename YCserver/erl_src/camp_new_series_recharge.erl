-file("src/mod/campaign/camp_new_series_recharge.erl",
      1).

-module(camp_new_series_recharge).

-author("Liyufei").

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

-file("src/mod/campaign/camp_new_series_recharge.erl",
      11).

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

-file("src/mod/campaign/camp_new_series_recharge.erl",
      12).

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

-file("src/mod/campaign/camp_new_series_recharge.erl",
      13).

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

-file("src/mod/campaign/camp_new_series_recharge.erl",
      14).

-file("inc/var.hrl", 1).

-record(m_var,
        {ver = 1,
         last_reset_time = 0 :: non_neg_integer(),
         last_reset_five_time = 0,
         last_reset_week_five_time = 0,
         day_vars = [] :: [tuple()],
         day_five_vars = [] :: [tuple()],
         week_five_vars = [],
         last_acc_time = 0,
         acc_time = 0,
         acc_vars = [] :: [tuple()],
         other_vars = [] :: [tuple()]}).

-record(role_var,
        {id = {0, "", 0} :: tuple(),
         ver = 1,
         last_reset_time = 0 :: non_neg_integer(),
         day_vars = [] :: [tuple()],
         forever_vars = [] :: [tuple()],
         last_reset_five_time = 0,
         last_reset_week_five_time = 0,
         day_five_vars = [] :: [tuple()],
         week_five_vars = []}).

-file("src/mod/campaign/camp_new_series_recharge.erl",
      15).

-file("inc/query.hrl", 1).

-record(name_index,
        {name = "" :: list(),
         id = 0 :: non_neg_integer(),
         acc = "" :: list(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid()}).

-record(id_index,
        {id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         acc = "" :: list(),
         name = "" :: list(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid()}).

-record(acc_index,
        {acc = {"", "", 0} ::
             {list(), list(), non_neg_integer()},
         id = 0 :: non_neg_integer(),
         name = "" :: list(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid()}).

-file("src/mod/campaign/camp_new_series_recharge.erl",
      16).

-export([reload/0,
         push_20470/1,
         push_20471/2,
         async_recharge/2,
         get_reward/2,
         zero_flush/1,
         gm_reset/1,
         gm_lookup/1,
         sync_print_log/1,
         async_reset/1]).

gm_lookup(RoleId) ->
    case role:apply(sync,
                    RoleId,
                    {camp_new_series_recharge, sync_print_log, []})
        of
        Data = {_RewardLog, _ChargeLog} -> Data;
        _Err ->
            logger:debug("~w",
                         [_Err],
                         camp_new_series_recharge,
                         36),
            lang:get("未能查到玩家数据，检查是否在线")
    end.

gm_reset(RoleId) ->
    role:apply(async,
               RoleId,
               {camp_new_series_recharge, async_reset, []}),
    ok.

sync_print_log(Role) ->
    RewardLog = var:get_var(Role, other, 2140, []),
    ChargeLog = var:get_var(Role, other, 2139, {0, 0}),
    {ok, {RewardLog, ChargeLog}}.

async_reset(Role) ->
    Role1 = var:set_var(Role, other, 2140, []),
    Role2 = var:set_var(Role1, other, 2139, {0, 0}),
    {ok, Role2}.

reload() ->
    case get_day() of
        0 -> ok;
        _Day ->
            role_group:apply(world,
                             {camp_new_series_recharge, zero_flush, []})
    end.

push_20470(Role = #role{lev = Lev, sex = RSex}) ->
    DayList = camp_series_recharge_data:list_new_open(),
    case get_day() =:= 0 orelse DayList =:= [] of
        true -> ok;
        _ ->
            InfoList = [begin
                            #{reward := Reward, v_item := VItems, desc := Desc,
                              lower := Lower} =
                                camp_series_recharge_data:get_new_open(Day),
                            NReward = lists:foldl(fun ({ItemId, Bind, Num},
                                                       Acc) ->
                                                          [{ItemId,
                                                            Bind,
                                                            Num,
                                                            0}
                                                           | Acc];
                                                      ({ItemId,
                                                        Bind,
                                                        Num,
                                                        LevMin,
                                                        LevMax},
                                                       Acc)
                                                          when LevMin =< Lev
                                                                   andalso
                                                                   Lev =<
                                                                       LevMax ->
                                                          [{ItemId,
                                                            Bind,
                                                            Num,
                                                            0}
                                                           | Acc];
                                                      ({ItemId,
                                                        Bind,
                                                        Num,
                                                        LevMin,
                                                        LevMax,
                                                        Sex,
                                                        ClientEffect},
                                                       Acc)
                                                          when LevMin =< Lev
                                                                   andalso
                                                                   Lev =< LevMax
                                                                       andalso
                                                                       (Sex =:=
                                                                            RSex
                                                                            orelse
                                                                            Sex
                                                                                =:=
                                                                                2) ->
                                                          [{ItemId,
                                                            Bind,
                                                            Num,
                                                            ClientEffect}
                                                           | Acc];
                                                      (_, Acc) -> Acc
                                                  end,
                                                  [],
                                                  Reward),
                            {VItemId, VEffect} = case [{_ItemId, _Effect}
                                                       || {_ItemId,
                                                           MinLev,
                                                           MaxLev,
                                                           _Sex,
                                                           _Effect}
                                                              <- VItems,
                                                          MinLev =< Lev andalso
                                                              Lev =< MaxLev
                                                                  andalso
                                                                  (_Sex =:= RSex
                                                                       orelse
                                                                       _Sex =:=
                                                                           2)]
                                                          ++
                                                          [{ItemId, Effect}
                                                           || {ItemId, Effect}
                                                                  <- VItems]
                                                     of
                                                     [{_VItemId, _VEffect}] ->
                                                         {_VItemId, _VEffect};
                                                     _ -> {0, 0}
                                                 end,
                            {Day,
                             lists:reverse(NReward),
                             Lower,
                             VItemId,
                             VEffect,
                             Desc}
                        end
                        || Day <- DayList],
            Data = {InfoList},
            logger:debug("~w",
                         [Data],
                         camp_new_series_recharge,
                         86),
            role:pack_send(Role, 20470, Data),
            ok
    end.

push_20471(Role, Gold) ->
    CampNow = get_day(),
    RewardList = var:get_var(Role, other, 2140, []),
    {ChargeDay, CampDay} = var:get_var(Role,
                                       other,
                                       2139,
                                       {0, 0}),
    VisionDay = case CampDay =:= CampNow of
                    true -> ChargeDay;
                    _ -> ChargeDay + 1
                end,
    Data = {ChargeDay, RewardList, Gold, VisionDay},
    logger:debug("~w",
                 [Data],
                 camp_new_series_recharge,
                 101),
    role:pack_send(Role, 20471, Data),
    ok.

zero_flush(Role = #role{}) ->
    case campaign_mgr:check_new_camp2() =:= false orelse
             get_day() =:= 0
        of
        true ->
            logger:debug("=====",
                         [],
                         camp_new_series_recharge,
                         108),
            ok;
        _ ->
            ChargeVal = var:get_var(Role, other, 2141, 0),
            push_20471(Role, ChargeVal),
            ok
    end.

async_recharge(Role = #role{pid = Pid}, Gold) ->
    OldGold = var:get_var(Role, other, 2141, 0),
    NewGold = OldGold + Gold,
    logger:debug("连续充值~w  充值达到 ~w",
                 [OldGold, NewGold],
                 camp_new_series_recharge,
                 120),
    DayNow = get_day(),
    case var:get_var(Role, other, 2139, {0, 0}) of
        {_, DayNow} ->
            logger:debug("已触发过今日的连充奖励",
                         [],
                         camp_new_series_recharge,
                         125),
            role:apply(async,
                       Pid,
                       {camp_pay_continus, async_recharge, [Gold]}),
            ok;
        {ChargeDay, CampDay}
            when CampDay < DayNow andalso ChargeDay < DayNow ->
            NChargeDay = ChargeDay + 1,
            logger:debug("活动第~w天，触发连充第~w天奖励",
                         [DayNow, NChargeDay],
                         camp_new_series_recharge,
                         130),
            case camp_series_recharge_data:get_new_open(NChargeDay)
                of
                #{lower := Lower} ->
                    case NewGold >= Lower of
                        true ->
                            logger:debug("成功触发奖励",
                                         [],
                                         camp_new_series_recharge,
                                         135),
                            Role1 = var:set_var(Role,
                                                other,
                                                2139,
                                                {NChargeDay, DayNow}),
                            Role2 = var:set_var(Role1, other, 2141, 0),
                            Role3 = var:add_var(Role2, other, 2142, Gold),
                            push_20471(Role3, 0),
                            {ok, Role3};
                        _ ->
                            logger:debug("未成功触发奖励",
                                         [],
                                         camp_new_series_recharge,
                                         144),
                            Role1 = var:set_var(Role, other, 2141, NewGold),
                            Role2 = var:add_var(Role1, other, 2142, Gold),
                            role:apply(async,
                                       Pid,
                                       {camp_pay_continus,
                                        async_recharge,
                                        [Gold]}),
                            push_20471(Role2, NewGold),
                            {ok, Role2}
                    end;
                _ ->
                    logger:debug("已经领完所有的奖励，没有第~w天的",
                                 [NChargeDay],
                                 camp_new_series_recharge,
                                 153),
                    role:apply(async,
                               Pid,
                               {camp_pay_continus, async_recharge, [Gold]}),
                    ok
            end;
        _Info ->
            logger:info("其他原因未能正常触发连充奖励~w",
                        [_Info],
                        camp_new_series_recharge,
                        158),
            role:apply(async,
                       Pid,
                       {camp_pay_continus, async_recharge, [Gold]}),
            ok
    end.

get_reward(Role = #role{lev = Lev, sex = RSex},
           RewardId) ->
    case campaign_mgr:check_new_camp2() of
        true ->
            RewardList = var:get_var(Role, other, 2140, []),
            {ChargeDay, _} = var:get_var(Role, other, 2139, {0, 0}),
            NowDay = get_day(),
            case ChargeDay >= RewardId of
                true when NowDay =/= 0 ->
                    case lists:member(RewardId, RewardList) of
                        false ->
                            logger:debug("领取第~w天连充的奖励",
                                         [RewardId],
                                         camp_new_series_recharge,
                                         174),
                            case
                                camp_series_recharge_data:get_new_open(RewardId)
                                of
                                #{reward := Reward} ->
                                    NReward = lists:foldl(fun ({ItemId,
                                                                Bind,
                                                                Num},
                                                               Acc) ->
                                                                  [{ItemId,
                                                                    Bind,
                                                                    Num}
                                                                   | Acc];
                                                              ({ItemId,
                                                                Bind,
                                                                Num,
                                                                LevMin,
                                                                LevMax},
                                                               Acc)
                                                                  when LevMin =<
                                                                           Lev
                                                                           andalso
                                                                           Lev
                                                                               =<
                                                                               LevMax ->
                                                                  [{ItemId,
                                                                    Bind,
                                                                    Num}
                                                                   | Acc];
                                                              ({ItemId,
                                                                Bind,
                                                                Num,
                                                                LevMin,
                                                                LevMax,
                                                                Sex,
                                                                _ClientEffect},
                                                               Acc)
                                                                  when LevMin =<
                                                                           Lev
                                                                           andalso
                                                                           Lev
                                                                               =<
                                                                               LevMax
                                                                               andalso
                                                                               (Sex
                                                                                    =:=
                                                                                    RSex
                                                                                    orelse
                                                                                    Sex
                                                                                        =:=
                                                                                        2) ->
                                                                  [{ItemId,
                                                                    Bind,
                                                                    Num}
                                                                   | Acc];
                                                              (_, Acc) -> Acc
                                                          end,
                                                          [],
                                                          Reward),
                                    Gain = format:val_to_gain(NReward),
                                    case role_gain:do_notice(Gain, Role) of
                                        {ok, Role1} ->
                                            Role2 = var:set_var(Role1,
                                                                other,
                                                                2140,
                                                                [RewardId
                                                                 | RewardList]),
                                            push_20471(Role2, 0),
                                            {ok, Role2};
                                        {false, #gain{msg = Msg}} ->
                                            {false, Msg}
                                    end;
                                _ -> {false, lang:get("配置错误")}
                            end;
                        _ ->
                            logger:debug("领取过第~w天连充的奖励，不能再领",
                                         [RewardId],
                                         camp_new_series_recharge,
                                         199),
                            {false, lang:get("奖励已领取")}
                    end;
                true ->
                    logger:debug("活动已结束，不能领取奖励",
                                 [],
                                 camp_new_series_recharge,
                                 203),
                    {false, lang:get("活动已结束，不能领取奖励")};
                false ->
                    logger:debug("还没充值，不能领取第~w天连充的奖励",
                                 [RewardId],
                                 camp_new_series_recharge,
                                 206),
                    {false, lang:get("达成充值目标后才能领取哦，请充值后再领取")}
            end;
        _ -> {false, lang:get("该活动未开启，请联系gm")}
    end.

get_camp() ->
    case campaign_mgr:get_camp_info(60057) of
        #camp_cache{id = Id, start_time = St, end_time = ET} ->
            {Id, St, ET};
        _ -> {0, -1, -1}
    end.

get_day() ->
    Now = date:unixtime2(),
    case get_camp() of
        {_Id, ST, ET} when ST =< Now andalso ET >= Now ->
            date:day_diff(ST, Now) + 1;
        _ -> 0
    end.

