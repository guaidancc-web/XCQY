-file("src/mod/campaign/camp_series_recharge_open.erl",
      1).

-module(camp_series_recharge_open).

-export([init/0,
         zero_flush/2,
         login/1,
         push/1,
         async_recharge/2,
         get_reward/2,
         day_get/1,
         recharge/2,
         change_state/1,
         change_state_cb/1,
         gm_reset/2,
         set_day/2,
         refresh_state/0,
         refresh_state/1]).

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

-file("src/mod/campaign/camp_series_recharge_open.erl",
      29).

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

-file("src/mod/campaign/camp_series_recharge_open.erl",
      30).

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

-file("src/mod/campaign/camp_series_recharge_open.erl",
      31).

-file("inc/camp_series_recharge.hrl", 1).

-record(camp_series_recharge,
        {var = 1,
         day_time = 0,
         day_gold = 0,
         reward = [],
         day = 0,
         status = 0,
         first_time = 0,
         activity_time = 0}).

-file("src/mod/campaign/camp_series_recharge_open.erl",
      32).

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

-file("src/mod/campaign/camp_series_recharge_open.erl",
      32).

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

-file("src/mod/campaign/camp_series_recharge_open.erl",
      34).

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

-file("src/mod/campaign/camp_series_recharge_open.erl",
      35).

init() -> #camp_series_recharge{}.

zero_flush(Role, _Args) -> {ok, flush(Role, push)}.

login(_Role) -> ok.

flush(Role0 = #role{}, Push) ->
    case campaign_mgr:check_new_camp2() of
        false ->
            Role = #role{m_campaign =
                             Mc = #m_campaign{recharge_open =
                                                  Recharge =
                                                      #camp_series_recharge{day_time
                                                                                =
                                                                                _DayTime,
                                                                            reward
                                                                                =
                                                                                Rewards}}} =
                       flush_activity(Role0),
            Now = erlang:date(),
            DayList = [Day
                       || {Day, Status} <- Rewards, Status =/= 0],
            DayMax = case DayList of
                         [] -> 0;
                         _ -> lists:max(DayList)
                     end,
            DayMaxConfig = day_max_config(),
            Rewards1 = case DayMax >= DayMaxConfig of
                           true -> Rewards;
                           _ ->
                               lists:keystore(DayMax + 1,
                                              1,
                                              Rewards,
                                              {DayMax + 1, 0})
                       end,
            NewRole = Role#role{m_campaign =
                                    Mc#m_campaign{recharge_open =
                                                      Recharge#camp_series_recharge{day
                                                                                        =
                                                                                        DayMax,
                                                                                    day_time
                                                                                        =
                                                                                        Now,
                                                                                    day_gold
                                                                                        =
                                                                                        0,
                                                                                    status
                                                                                        =
                                                                                        0,
                                                                                    reward
                                                                                        =
                                                                                        Rewards1}}},
            case Push of
                push -> push(NewRole);
                _ -> ignore
            end,
            NewRole;
        _ -> Role0
    end.

flush_activity(Role) -> Role.

recharge(Role0 = #role{pid = Pid,
                       m_campaign =
                           MC = #m_campaign{can_reward = _CanReward,
                                            rewarded = Rewarded,
                                            recharge_open =
                                                Recharge =
                                                    #camp_series_recharge{first_time
                                                                              =
                                                                              FirstTime}}},
         Gold) ->
    OldGold = var:get_var(Role0, day, 102, 0),
    NewGold = OldGold + Gold,
    logger:debug("连续充值  今天充值 ~w",
                 [{OldGold, NewGold}],
                 camp_series_recharge_open,
                 80),
    Role = case FirstTime of
               0 ->
                   case lists:keyfind(1, 1, Rewarded) of
                       false ->
                           Role0#role{m_campaign =
                                          MC#m_campaign{recharge_open =
                                                            Recharge#camp_series_recharge{first_time
                                                                                              =
                                                                                              date:unixtime()}}};
                       _ -> Role0
                   end;
               _ -> Role0
           end,
    push(Role),
    logger:debug("连续充值  今天充值 ~w",
                 [{get_recharge_gold(Role0),
                   camp_pay_continus:get_recharge_gold(Role)}],
                 camp_series_recharge_open,
                 93),
    case {get_recharge_gold(Role0),
          camp_pay_continus:get_recharge_gold(Role)}
        of
        {{true, Gold1}, {true, Gold2}}
            when NewGold >= Gold1 andalso NewGold >= Gold2 ->
            case Gold1 =< Gold2 of
                true ->
                    role:apply(async,
                               Pid,
                               {camp_pay_continus, async_recharge, [NewGold]}),
                    update_gold(Role, 0, Gold);
                _ ->
                    role:apply(async,
                               Pid,
                               {camp_series_recharge_open,
                                async_recharge,
                                [NewGold]}),
                    update_gold(Role, 0, Gold)
            end;
        {{true, Gold1}, {true, _Gold2}} when NewGold >= Gold1 ->
            role:apply(async,
                       Pid,
                       {camp_series_recharge_open, async_recharge, [NewGold]}),
            update_gold(Role, 0, Gold);
        {{true, _Gold1}, {true, Gold2}} when NewGold >= Gold2 ->
            role:apply(async,
                       Pid,
                       {camp_pay_continus, async_recharge, [NewGold]}),
            update_gold(Role, 0, Gold);
        {false, {true, Gold2}} when NewGold >= Gold2 ->
            role:apply(async,
                       Pid,
                       {camp_pay_continus, async_recharge, [NewGold]}),
            update_gold(Role, 0, Gold);
        {{true, Gold1}, false} when NewGold >= Gold1 ->
            role:apply(async,
                       Pid,
                       {camp_series_recharge_open, async_recharge, [NewGold]}),
            update_gold(Role, 0, Gold);
        _ -> update_gold(Role, NewGold, Gold)
    end.

update_gold(Role, NewGold, AddGold) ->
    Role1 = var:add_var(Role, day, 101, AddGold),
    NewRole = var:set_var(Role1, day, 102, NewGold),
    {ok, NewRole}.

get_recharge_gold(Role = #role{m_campaign =
                                   #m_campaign{recharge_open =
                                                   #camp_series_recharge{day =
                                                                             Day,
                                                                         reward
                                                                             =
                                                                             Rewards,
                                                                         status
                                                                             =
                                                                             0}}}) ->
    DayNow = day_get(Role),
    case DayNow > 0 of
        true ->
            NewDay = case Day of
                         0 -> Day + 1;
                         _ ->
                             case lists:keyfind(Day, 1, Rewards) of
                                 false -> Day;
                                 {Day, 0} -> Day;
                                 _ -> Day + 1
                             end
                     end,
            case lists:keyfind(NewDay, 1, Rewards) of
                {_Day, Status} when Status >= 1 -> false;
                _ ->
                    case data_get(Role, NewDay) of
                        #{lower := Lower} -> {true, Lower};
                        _ -> false
                    end
            end;
        _ -> false
    end;
get_recharge_gold(Role = #role{m_campaign =
                                   #m_campaign{recharge_open =
                                                   #camp_series_recharge{day =
                                                                             Day,
                                                                         reward
                                                                             =
                                                                             Rewards}}}) ->
    DayNow = day_get(Role),
    case DayNow > 0 of
        true ->
            case lists:keyfind(Day, 1, Rewards) of
                {Day, Status} when Status >= 1 -> false;
                _ ->
                    case data_get(Role, Day) of
                        #{lower := Lower} -> {true, Lower};
                        _ -> false
                    end
            end;
        _ -> false
    end.

async_recharge(Role0 = #role{pid = Pid,
                             m_campaign =
                                 MC = #m_campaign{can_reward = _CanReward,
                                                  rewarded = Rewarded,
                                                  recharge_open =
                                                      Recharge =
                                                          #camp_series_recharge{first_time
                                                                                    =
                                                                                    FirstTime}}},
               Gold) ->
    Role = case FirstTime of
               0 ->
                   case lists:keyfind(1, 1, Rewarded) of
                       false ->
                           Role0#role{m_campaign =
                                          MC#m_campaign{recharge_open =
                                                            Recharge#camp_series_recharge{first_time
                                                                                              =
                                                                                              date:unixtime()}}};
                       _ -> Role0
                   end;
               _ -> Role0
           end,
    DayNow = day_get(Role0),
    case DayNow > 0 of
        true ->
            NewRole = async_recharge_do(Role, Gold, DayNow),
            push(NewRole),
            {ok, NewRole};
        _ ->
            role:apply(async,
                       Pid,
                       {camp_pay_continus, async_recharge, [Gold]}),
            push(Role),
            {ok, Role}
    end.

async_recharge_do(Role = #role{pid = Pid,
                               m_campaign =
                                   Mc = #m_campaign{recharge_open =
                                                        Recharge =
                                                            #camp_series_recharge{day
                                                                                      =
                                                                                      Day,
                                                                                  reward
                                                                                      =
                                                                                      Rewards,
                                                                                  status
                                                                                      =
                                                                                      0}}},
                  Gold, _DayNow) ->
    NewDay = case Day of
                 0 -> Day + 1;
                 _ ->
                     case lists:keyfind(Day, 1, Rewards) of
                         false -> Day;
                         {Day, 0} -> Day;
                         _ -> Day + 1
                     end
             end,
    case data_get(Role, NewDay) of
        #{lower := Lower} ->
            case Gold >= Lower of
                true ->
                    Role#role{m_campaign =
                                  Mc#m_campaign{recharge_open =
                                                    Recharge#camp_series_recharge{day
                                                                                      =
                                                                                      NewDay,
                                                                                  day_gold
                                                                                      =
                                                                                      Gold,
                                                                                  reward
                                                                                      =
                                                                                      lists:keystore(NewDay,
                                                                                                     1,
                                                                                                     Rewards,
                                                                                                     {NewDay,
                                                                                                      1}),
                                                                                  status
                                                                                      =
                                                                                      1}}};
                _ ->
                    Role#role{m_campaign =
                                  Mc#m_campaign{recharge_open =
                                                    Recharge#camp_series_recharge{day
                                                                                      =
                                                                                      NewDay,
                                                                                  day_gold
                                                                                      =
                                                                                      Gold,
                                                                                  status
                                                                                      =
                                                                                      1}}}
            end;
        _ ->
            role:apply(async,
                       Pid,
                       {camp_pay_continus, async_recharge, [Gold]}),
            Role#role{m_campaign =
                          Mc#m_campaign{recharge_open =
                                            Recharge#camp_series_recharge{day =
                                                                              NewDay,
                                                                          day_gold
                                                                              =
                                                                              Gold,
                                                                          status
                                                                              =
                                                                              1}}}
    end;
async_recharge_do(Role = #role{pid = Pid,
                               m_campaign =
                                   Mc = #m_campaign{recharge_open =
                                                        Recharge =
                                                            #camp_series_recharge{day
                                                                                      =
                                                                                      Day,
                                                                                  reward
                                                                                      =
                                                                                      Rewards,
                                                                                  day_gold
                                                                                      =
                                                                                      DayGold}}},
                  Gold, _DayNow) ->
    case lists:keyfind(Day, 1, Rewards) of
        false ->
            case data_get(Role, Day) of
                #{lower := Lower} ->
                    case DayGold + Gold >= Lower of
                        true ->
                            Role#role{m_campaign =
                                          Mc#m_campaign{recharge_open =
                                                            Recharge#camp_series_recharge{day_gold
                                                                                              =
                                                                                              Gold
                                                                                                  +
                                                                                                  DayGold,
                                                                                          reward
                                                                                              =
                                                                                              lists:keystore(Day,
                                                                                                             1,
                                                                                                             Rewards,
                                                                                                             {Day,
                                                                                                              1})}}};
                        _ ->
                            Role#role{m_campaign =
                                          Mc#m_campaign{recharge_open =
                                                            Recharge#camp_series_recharge{day_gold
                                                                                              =
                                                                                              Gold
                                                                                                  +
                                                                                                  DayGold}}}
                    end;
                _ ->
                    role:apply(async,
                               Pid,
                               {camp_pay_continus, async_recharge, [Gold]}),
                    Role#role{m_campaign =
                                  Mc#m_campaign{recharge_open =
                                                    Recharge#camp_series_recharge{day_gold
                                                                                      =
                                                                                      Gold
                                                                                          +
                                                                                          DayGold}}}
            end;
        {Day, 0} ->
            case data_get(Role, Day) of
                #{lower := Lower} ->
                    case DayGold + Gold >= Lower of
                        true ->
                            Role#role{m_campaign =
                                          Mc#m_campaign{recharge_open =
                                                            Recharge#camp_series_recharge{day_gold
                                                                                              =
                                                                                              Gold
                                                                                                  +
                                                                                                  DayGold,
                                                                                          reward
                                                                                              =
                                                                                              lists:keystore(Day,
                                                                                                             1,
                                                                                                             Rewards,
                                                                                                             {Day,
                                                                                                              1})}}};
                        _ ->
                            Role#role{m_campaign =
                                          Mc#m_campaign{recharge_open =
                                                            Recharge#camp_series_recharge{day_gold
                                                                                              =
                                                                                              Gold
                                                                                                  +
                                                                                                  DayGold}}}
                    end;
                _ ->
                    role:apply(async,
                               Pid,
                               {camp_pay_continus, async_recharge, [Gold]}),
                    Role#role{m_campaign =
                                  Mc#m_campaign{recharge_open =
                                                    Recharge#camp_series_recharge{day_gold
                                                                                      =
                                                                                      Gold
                                                                                          +
                                                                                          DayGold}}}
            end;
        _ ->
            role:apply(async,
                       Pid,
                       {camp_pay_continus, async_recharge, [Gold]}),
            Role#role{m_campaign =
                          Mc#m_campaign{recharge_open =
                                            Recharge#camp_series_recharge{day_gold
                                                                              =
                                                                              Gold
                                                                                  +
                                                                                  DayGold}}}
    end.

push(Role = #role{m_campaign =
                      #m_campaign{recharge_open =
                                      Recharge = #camp_series_recharge{day =
                                                                           Day,
                                                                       reward =
                                                                           Rewards,
                                                                       status =
                                                                           0}}}) ->
    NewDay = case Day of
                 0 -> Day + 1;
                 _ ->
                     case lists:keyfind(Day, 1, Rewards) of
                         false -> Day;
                         {Day, 0} -> Day;
                         _ -> Day + 1
                     end
             end,
    DayMaxConfig = day_max_config(),
    NewDay1 = min(DayMaxConfig, NewDay),
    Rewards1 = case lists:keyfind(NewDay1, 1, Rewards) of
                   false -> [{NewDay1, 0} | Rewards];
                   _ -> Rewards
               end,
    DayNow = day_get(Role),
    case campaign_mgr:check_new_camp2() of
        true -> ok;
        _ ->
            role:pack_send(Role,
                           17817,
                           {DayNow,
                            Recharge#camp_series_recharge{reward = Rewards1}})
    end;
push(Role = #role{m_campaign =
                      #m_campaign{recharge_open = Recharge}}) ->
    DayNow = day_get(Role),
    case campaign_mgr:check_new_camp2() of
        true -> ok;
        _ -> role:pack_send(Role, 17817, {DayNow, Recharge})
    end.

get_reward(Role = #role{lev = Lev,
                        m_campaign =
                            Mc = #m_campaign{recharge_open =
                                                 Recharge =
                                                     #camp_series_recharge{reward
                                                                               =
                                                                               Rewards}}},
           RewardId) ->
    case campaign_mgr:check_new_camp2() of
        false ->
            case lists:keyfind(RewardId, 1, Rewards) of
                {RewardId, Status} when Status =:= 1 ->
                    case data_get(Role, RewardId) of
                        #{reward := Reward} ->
                            Reward1 = lists:foldl(fun ({ItemId, Bind, Num},
                                                       Acc) ->
                                                          [{ItemId, Bind, Num}
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
                                                          [{ItemId, Bind, Num}
                                                           | Acc];
                                                      (_, Acc) -> Acc
                                                  end,
                                                  [],
                                                  Reward),
                            Gain = format:val_to_gain(Reward1),
                            case role_gain:do_notice(Gain, Role) of
                                {ok, Role1} ->
                                    NewRole = Role1#role{m_campaign =
                                                             Mc#m_campaign{recharge_open
                                                                               =
                                                                               Recharge#camp_series_recharge{reward
                                                                                                                 =
                                                                                                                 lists:keystore(RewardId,
                                                                                                                                1,
                                                                                                                                Rewards,
                                                                                                                                {RewardId,
                                                                                                                                 2})}}},
                                    push(NewRole),
                                    {ok, NewRole};
                                {false, #gain{msg = Msg}} -> {false, Msg}
                            end;
                        _ -> {false, lang:get("配置错误")}
                    end;
                {_RewardId, Status} when Status =:= 2 ->
                    {false, lang:get("该奖励已领取")};
                _ -> {false, lang:get("该奖励不可领取")}
            end;
        _ -> {false, lang:get("该活动已结束，请联系gm")}
    end.

day_get(Role) ->
    case day_get_first(Role) of
        Day when is_integer(Day) -> Day;
        _ -> 0
    end.

day_get_first(#role{m_campaign =
                        #m_campaign{recharge_open =
                                        #camp_series_recharge{first_time =
                                                                  0}}}) ->
    0;
day_get_first(#role{m_campaign =
                        #m_campaign{recharge_open =
                                        #camp_series_recharge{first_time =
                                                                  FirstTime}}}) ->
    EndTime = date:unixtime({zero, FirstTime}) + 15 * 86400,
    Now = date:unixtime(),
    case Now =< EndTime of
        true -> date:day_diff(FirstTime, Now) + 1;
        _ -> 0
    end.

data_get(_Role, Day) ->
    camp_series_recharge_data:get_open(Day).

day_max_config() ->
    length(camp_series_recharge_data:list_open()).

gm_reset(Role = #role{m_campaign =
                          Mc = #m_campaign{recharge_open =
                                               Recharge =
                                                   #camp_series_recharge{reward
                                                                             =
                                                                             Rewards}}},
         0) ->
    DayList = [Day
               || {Day, Status} <- Rewards, Status =/= 0],
    DayMax = lists:max(DayList),
    DayMaxConfig = day_max_config(),
    Rewards1 = case DayMax >= DayMaxConfig of
                   true -> Rewards;
                   _ ->
                       lists:keystore(DayMax + 1, 1, Rewards, {DayMax + 1, 0})
               end,
    logger:debug("刷新reward值 ~w~n",
                 [{Rewards, Rewards1, DayMax}],
                 camp_series_recharge_open,
                 364),
    {ok,
     Role#role{m_campaign =
                   Mc#m_campaign{recharge_open =
                                     Recharge#camp_series_recharge{reward =
                                                                       Rewards1,
                                                                   day_gold = 0,
                                                                   status =
                                                                       0}}}};
gm_reset(Role = #role{id = RoleId,
                      m_campaign =
                          Mc = #m_campaign{recharge_open =
                                               Recharge =
                                                   #camp_series_recharge{reward
                                                                             =
                                                                             Rewards}}},
         Day) ->
    logger:info("修复玩家 ~w 充值天数为 ~w",
                [RoleId, Day],
                camp_series_recharge_open,
                367),
    _DayMaxConfig = day_max_config(),
    Result = case lists:keyfind(Day, 1, Rewards) of
                 false -> ok;
                 {Day, State} when State =:= 0 -> ok;
                 _ -> false
             end,
    case Result of
        ok ->
            Rewards2 = case Day > 1 of
                           true ->
                               Rewards1 = [{Day1, 2}
                                           || Day1 <- lists:seq(1, Day - 1)],
                               [{Day, 0} | Rewards1];
                           _ -> [{1, 0}]
                       end,
            logger:debug("刷新reward值 ~w~n",
                         [{Rewards, Rewards2, _DayMaxConfig}],
                         camp_series_recharge_open,
                         382),
            Time = date:unixtime() - Day * 86400,
            NewRole = Role#role{m_campaign =
                                    Mc#m_campaign{recharge_open =
                                                      Recharge#camp_series_recharge{reward
                                                                                        =
                                                                                        Rewards2,
                                                                                    status
                                                                                        =
                                                                                        0,
                                                                                    day
                                                                                        =
                                                                                        Day
                                                                                            -
                                                                                            1,
                                                                                    first_time
                                                                                        =
                                                                                        Time}}},
            push(NewRole),
            logger:info("修复完成 ~w",
                        [RoleId],
                        camp_series_recharge_open,
                        386),
            {ok, NewRole};
        _ ->
            logger:info("已经修复玩家,不需要重新修复  ~w",
                        [RoleId],
                        camp_series_recharge_open,
                        389),
            ok
    end.

set_day(RoleId, Day) when Day > 0 ->
    case role_misc:is_local_role(RoleId) of
        true ->
            role:apply(async,
                       RoleId,
                       {camp_series_recharge_open, gm_reset, [Day]});
        _ -> skip
    end.

refresh_state() ->
    role_group:apply(world,
                     {camp_series_recharge_open, refresh_state, []}).

refresh_state(Role = #role{m_campaign =
                               #m_campaign{recharge_open =
                                               #camp_series_recharge{day_gold =
                                                                         0}}}) ->
    {ok, var:set_var(Role, day, 103, 1)};
refresh_state(Role = #role{id = RoleId,
                           m_campaign =
                               MC = #m_campaign{recharge_open =
                                                    #camp_series_recharge{day =
                                                                              Day,
                                                                          reward
                                                                              =
                                                                              OpenReward,
                                                                          day_gold
                                                                              =
                                                                              DayGold},
                                                recharge =
                                                    Recharge =
                                                        #camp_series_recharge{reward
                                                                                  =
                                                                                  Reward}}}) ->
    case var:get_var(Role, day, 103, 0) of
        0 ->
            case lists:keyfind(Day, 1, OpenReward) of
                {_Day, 0} when Day =< 5 andalso Day > 0 ->
                    case lists:keyfind(1, 1, Reward) of
                        {1, Statue} when Statue >= 1 ->
                            {ok, var:set_var(Role, day, 103, 1)};
                        _ ->
                            Recharge1 = case date:unixtime() < 1489420800 of
                                            true ->
                                                Recharge#camp_series_recharge{day_gold
                                                                                  =
                                                                                  60,
                                                                              status
                                                                                  =
                                                                                  1,
                                                                              day
                                                                                  =
                                                                                  1,
                                                                              reward
                                                                                  =
                                                                                  [{1,
                                                                                    1}]};
                                            _ ->
                                                Recharge#camp_series_recharge{day_gold
                                                                                  =
                                                                                  0,
                                                                              status
                                                                                  =
                                                                                  0,
                                                                              day
                                                                                  =
                                                                                  2,
                                                                              reward
                                                                                  =
                                                                                  [{2,
                                                                                    0},
                                                                                   {1,
                                                                                    1}]}
                                        end,
                            logger:info("连续充值修复玩家 ~w ~w",
                                        [RoleId, Recharge1],
                                        camp_series_recharge_open,
                                        423),
                            Gold = max(DayGold - 60, 0),
                            Role1 = var:set_var(Role, day, 101, DayGold),
                            Role2 = var:set_var(Role1, day, 102, Gold),
                            Role3 = var:set_var(Role2, day, 103, 1),
                            NewRole = Role3#role{m_campaign =
                                                     MC#m_campaign{recharge =
                                                                       Recharge1}},
                            camp_series_recharge:push(NewRole),
                            {ok, NewRole}
                    end;
                _ -> {ok, var:set_var(Role, day, 103, 1)}
            end;
        _ -> ok
    end;
refresh_state(#role{m_campaign = _Mc}) ->
    logger:debug("活动数据 ~w",
                 [_Mc],
                 camp_series_recharge_open,
                 439),
    ok.

change_state(RoleId) ->
    role:apply(async,
               RoleId,
               {camp_series_recharge_open, change_state_cb, []}).

change_state_cb(Role = #role{m_campaign =
                                 MC = #m_campaign{recharge_open =
                                                      RechargeOpen}}) ->
    logger:info("执行成功", [], camp_series_recharge_open, 446),
    NewRole = Role#role{m_campaign =
                            MC#m_campaign{recharge_open =
                                              RechargeOpen#camp_series_recharge{first_time
                                                                                    =
                                                                                    date:unixtime()
                                                                                        -
                                                                                        86400
                                                                                            *
                                                                                            7,
                                                                                day_time
                                                                                    =
                                                                                    erlang:date(),
                                                                                day
                                                                                    =
                                                                                    5,
                                                                                reward
                                                                                    =
                                                                                    [{1,
                                                                                      1},
                                                                                     {2,
                                                                                      1},
                                                                                     {3,
                                                                                      1},
                                                                                     {4,
                                                                                      1},
                                                                                     {5,
                                                                                      1}]}}},
    push(NewRole),
    {ok, NewRole}.

