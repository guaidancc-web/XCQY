-file("src/mod/campaign/camp_scratch_card.erl", 1).

-module(camp_scratch_card).

-author("Suhan").

-file("inc/camp_scratch_card.hrl", 1).

-author("Suhan").

-record(m_camp_scratch_card,
        {camp_id = 0, first_items = [], items = []}).

-record(camp_scratch_card_data,
        {item_id, bind, num, weight}).

-file("src/mod/campaign/camp_scratch_card.erl", 13).

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

-file("src/mod/campaign/camp_scratch_card.erl", 14).

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

-file("src/mod/campaign/camp_scratch_card.erl", 15).

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

-file("src/mod/campaign/camp_scratch_card.erl", 16).

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

-file("src/mod/campaign/camp_scratch_card.erl", 17).

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

-file("src/mod/campaign/camp_scratch_card.erl", 18).

-export([init/0,
         login/1,
         reload/0,
         flush/1,
         push_card/1,
         use_card/2,
         get_reward/2,
         get_new_card/2]).

init() -> #m_camp_scratch_card{}.

login(Role = #role{m_campaign =
                       MCampaign = #m_campaign{camp_scratch_card =
                                                   CampScratchCard =
                                                       #m_camp_scratch_card{camp_id
                                                                                =
                                                                                CampId,
                                                                            items
                                                                                =
                                                                                Items}}}) ->
    Now = date:unixtime2(),
    case Items of
        [] -> skip;
        ItemsList when is_list(ItemsList) ->
            Title = lang:get("刮刮乐奖励"),
            Content = lang:get("您的奖励尚未领取，将通过邮件发放，请查收"),
            mail:send(Role, Title, Content, ItemsList);
        _ -> skip
    end,
    case campaign_mgr:get_camp_time(60055) of
        {StartTime, EndTime}
            when StartTime =< Now andalso Now =< EndTime ->
            NewCampId = campaign_mgr:get_camp_id(60055),
            case NewCampId =/= CampId of
                true ->
                    NewFirstItems = case get_new_card() of
                                        FirstItems when is_list(FirstItems) ->
                                            FirstItems;
                                        _ -> []
                                    end,
                    {ok,
                     Role#role{m_campaign =
                                   MCampaign#m_campaign{camp_scratch_card =
                                                            CampScratchCard#m_camp_scratch_card{camp_id
                                                                                                    =
                                                                                                    NewCampId,
                                                                                                first_items
                                                                                                    =
                                                                                                    NewFirstItems,
                                                                                                items
                                                                                                    =
                                                                                                    []}}}};
                _ ->
                    {ok,
                     Role#role{m_campaign =
                                   MCampaign#m_campaign{camp_scratch_card =
                                                            CampScratchCard#m_camp_scratch_card{items
                                                                                                    =
                                                                                                    []}}}}
            end;
        _ ->
            {ok,
             Role#role{m_campaign =
                           MCampaign#m_campaign{camp_scratch_card =
                                                    CampScratchCard#m_camp_scratch_card{items
                                                                                            =
                                                                                            []}}}}
    end.

reload() ->
    role_group:apply(world, {camp_scratch_card, flush, []}).

flush(Role = #role{m_campaign =
                       MCampaign = #m_campaign{camp_scratch_card =
                                                   CampScratchCard =
                                                       #m_camp_scratch_card{camp_id
                                                                                =
                                                                                CampId,
                                                                            items
                                                                                =
                                                                                Items}}}) ->
    Now = date:unixtime2(),
    case campaign_mgr:get_camp_time(60055) of
        {StartTime, EndTime}
            when StartTime =< Now andalso Now =< EndTime ->
            NewCampId = campaign_mgr:get_camp_id(60055),
            case NewCampId =:= CampId of
                true -> ok;
                _ ->
                    case Items of
                        [] -> skip;
                        ItemList when is_list(ItemList) ->
                            Title = lang:get("刮刮乐奖励"),
                            Content = lang:get("您的奖励尚未领取，将通过邮件发放，请查收"),
                            mail:send(Role, Title, Content, ItemList);
                        _ -> skip
                    end,
                    case get_new_card() of
                        FirstList when is_list(FirstList) ->
                            {ok,
                             Role#role{m_campaign =
                                           MCampaign#m_campaign{camp_scratch_card
                                                                    =
                                                                    CampScratchCard#m_camp_scratch_card{camp_id
                                                                                                            =
                                                                                                            NewCampId,
                                                                                                        first_items
                                                                                                            =
                                                                                                            FirstList,
                                                                                                        items
                                                                                                            =
                                                                                                            []}}}};
                        _ ->
                            {ok,
                             Role#role{m_campaign =
                                           MCampaign#m_campaign{camp_scratch_card
                                                                    =
                                                                    CampScratchCard#m_camp_scratch_card{camp_id
                                                                                                            =
                                                                                                            NewCampId,
                                                                                                        first_items
                                                                                                            =
                                                                                                            [],
                                                                                                        items
                                                                                                            =
                                                                                                            []}}}}
                    end
            end;
        _ ->
            case Items of
                [] -> skip;
                ItemList when is_list(ItemList) ->
                    Title = lang:get("刮刮乐奖励"),
                    Content = lang:get("您的奖励尚未领取，将通过邮件发放，请查收"),
                    mail:send(Role, Title, Content, ItemList);
                _ -> skip
            end,
            {ok,
             Role#role{m_campaign =
                           MCampaign#m_campaign{camp_scratch_card =
                                                    CampScratchCard#m_camp_scratch_card{items
                                                                                            =
                                                                                            []}}}}
    end.

push_card(Role = #role{m_campaign =
                           MCampaign = #m_campaign{camp_scratch_card =
                                                       CampScratchCard =
                                                           #m_camp_scratch_card{camp_id
                                                                                    =
                                                                                    OldCampId,
                                                                                first_items
                                                                                    =
                                                                                    FirstItems}}}) ->
    Now = date:unixtime2(),
    case campaign_mgr:get_camp_time(60055) of
        {StartTime, EndTime}
            when StartTime =< Now andalso Now =< EndTime ->
            CampId = campaign_mgr:get_camp_id(60055),
            case CampId =:= OldCampId of
                true ->
                    case FirstItems of
                        [{ItemId, _, _} | _] -> {ok, ItemId};
                        _ ->
                            case get_new_card() of
                                NewFirstItems = [{ItemId, _, _}] ->
                                    {ok,
                                     ItemId,
                                     Role#role{m_campaign =
                                                   MCampaign#m_campaign{camp_scratch_card
                                                                            =
                                                                            CampScratchCard#m_camp_scratch_card{first_items
                                                                                                                    =
                                                                                                                    NewFirstItems}}}};
                                _ -> {false, 0}
                            end
                    end;
                _ ->
                    case get_new_card() of
                        NewFirstItems = [{ItemId, _, _}] ->
                            {ok,
                             ItemId,
                             Role#role{m_campaign =
                                           MCampaign#m_campaign{camp_scratch_card
                                                                    =
                                                                    CampScratchCard#m_camp_scratch_card{first_items
                                                                                                            =
                                                                                                            NewFirstItems}}}};
                        _ -> {false, 0}
                    end
            end;
        _ -> {false, 0}
    end.

use_card(Role = #role{m_campaign =
                          MCampaign = #m_campaign{camp_scratch_card =
                                                      CampScratchCard =
                                                          #m_camp_scratch_card{first_items
                                                                                   =
                                                                                   FirstItems,
                                                                               items
                                                                                   =
                                                                                   OldItems}},
                      p_bag = Bag},
         Type) ->
    Now = date:unixtime2(),
    case campaign_mgr:get_camp_time(60055) of
        {StartTime, EndTime}
            when StartTime =< Now andalso Now =< EndTime ->
            case camp_scratch_card_data:get_config() of
                [ConfigBaseId] when is_integer(ConfigBaseId) ->
                    Num = case Type of
                              2 ->
                                  {_, BagNum} = package:count(by_base_id,
                                                              ConfigBaseId,
                                                              Bag),
                                  max(1, BagNum);
                              _ -> 1
                          end,
                    Loss = format:val_to_loss([{ConfigBaseId, Num}]),
                    GetNewCardNum = Num - length(FirstItems),
                    case get_new_card(GetNewCardNum, []) of
                        CardList when is_list(CardList) ->
                            NewItems = merge_card_list(FirstItems ++ CardList,
                                                       OldItems),
                            case get_new_card() of
                                NewFirstItems when is_list(NewFirstItems) ->
                                    case role_gain:do_notice(Loss, Role) of
                                        {ok, NewRole} ->
                                            ReturnId = case FirstItems of
                                                           [{FirstItemId,
                                                             _,
                                                             _}] ->
                                                               FirstItemId;
                                                           _ ->
                                                               case NewItems of
                                                                   [{NewItemsId,
                                                                     _,
                                                                     _}
                                                                    | _] ->
                                                                       NewItemsId;
                                                                   _ -> 0
                                                               end
                                                       end,
                                            {ok,
                                             ReturnId,
                                             NewRole#role{m_campaign =
                                                              MCampaign#m_campaign{camp_scratch_card
                                                                                       =
                                                                                       CampScratchCard#m_camp_scratch_card{first_items
                                                                                                                               =
                                                                                                                               NewFirstItems,
                                                                                                                           items
                                                                                                                               =
                                                                                                                               NewItems}}}};
                                        _ -> {false, lang:get("刮刮卡道具不足")}
                                    end;
                                _ -> {false, lang:get("刮刮卡数据出错")}
                            end;
                        _ -> {false, lang:get("刮刮卡数据出错")}
                    end;
                _ -> {false, lang:get("数据出错")}
            end;
        _ -> {false, lang:get("活动暂未开启")}
    end.

get_reward(Role = #role{m_campaign =
                            MCampaign = #m_campaign{camp_scratch_card =
                                                        CampScratchCard =
                                                            #m_camp_scratch_card{items
                                                                                     =
                                                                                     Items}}},
           Flag) ->
    case Items of
        [] -> {false, lang:get("")};
        _ ->
            Gain = format:val_to_gain(Items),
            case Flag of
                0 ->
                    case role_gain:do_notice(Gain, Role) of
                        {ok, NewRole} ->
                            {ok,
                             NewRole#role{m_campaign =
                                              MCampaign#m_campaign{camp_scratch_card
                                                                       =
                                                                       CampScratchCard#m_camp_scratch_card{items
                                                                                                               =
                                                                                                               []}}}};
                        _ ->
                            Title = lang:get("刮刮乐奖励"),
                            Content = lang:get("由于您获得奖励时背包已满，奖励通过邮件发放给您，请查收"),
                            mail:send(Role, Title, Content, Items),
                            {ok,
                             Role#role{m_campaign =
                                           MCampaign#m_campaign{camp_scratch_card
                                                                    =
                                                                    CampScratchCard#m_camp_scratch_card{items
                                                                                                            =
                                                                                                            []}}}}
                    end;
                _ ->
                    Title = lang:get("刮刮乐奖励"),
                    Content = lang:get("您的奖励尚未领取，将通过邮件发放，请查收"),
                    mail:send(Role, Title, Content, Items),
                    {ok,
                     Role#role{m_campaign =
                                   MCampaign#m_campaign{camp_scratch_card =
                                                            CampScratchCard#m_camp_scratch_card{items
                                                                                                    =
                                                                                                    []}}}}
            end
    end.

get_new_card(Num, List) when Num =< 0 -> List;
get_new_card(Num, List) ->
    case get_new_card() of
        NewCardList
            when is_list(NewCardList) andalso NewCardList =/= [] ->
            NewList = merge_card_list(NewCardList, List),
            get_new_card(Num - 1, NewList);
        _ -> false
    end.

get_new_card() ->
    case camp_scratch_card_data:get_reward() of
        ItemList when is_list(ItemList) ->
            case ItemList of
                [] -> false;
                _ ->
                    case util:rand_list(ItemList,
                                        #camp_scratch_card_data.weight)
                        of
                        #camp_scratch_card_data{item_id = ItemId, bind = Bind,
                                                num = Num} ->
                            [{ItemId, Bind, Num}];
                        _ -> false
                    end
            end;
        _ -> false
    end.

merge_card_list([], CardList) -> CardList;
merge_card_list([{ItemId, Bind, ItemNum} | Rest],
                CardList) ->
    NewCardList = case lists:keyfind(ItemId, 1, CardList) of
                      {_, _, OldNum} ->
                          lists:keystore(ItemId,
                                         1,
                                         CardList,
                                         {ItemId, Bind, ItemNum + OldNum});
                      _ ->
                          lists:keystore(ItemId,
                                         1,
                                         CardList,
                                         {ItemId, Bind, ItemNum})
                  end,
    merge_card_list(Rest, NewCardList).

