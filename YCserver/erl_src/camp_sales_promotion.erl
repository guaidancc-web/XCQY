-file("src/mod/campaign/camp_sales_promotion.erl", 1).

-module(camp_sales_promotion).

-export([login/1,
         send_info/2,
         get_today_purchase/1,
         buy/3,
         zero_flush/2,
         gm_set_today_purchase/3,
         reload/0]).

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

-file("src/mod/campaign/camp_sales_promotion.erl", 23).

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

-file("src/mod/campaign/camp_sales_promotion.erl", 24).

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

-file("src/mod/campaign/camp_sales_promotion.erl", 25).

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

-file("src/mod/campaign/camp_sales_promotion.erl", 26).

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

-file("src/mod/campaign/camp_sales_promotion.erl", 27).

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

-file("src/mod/campaign/camp_sales_promotion.erl", 28).

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

-file("src/mod/campaign/camp_sales_promotion.erl", 29).

-file("inc/camp_sales_promotion.hrl", 1).

-author("Liyufei").

-record(gift_info,
        {item_id,
         item_name,
         price,
         buy_limit,
         spec_effect,
         promotion_id,
         content_name}).

-file("src/mod/campaign/camp_sales_promotion.erl", 30).

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

-file("src/mod/campaign/camp_sales_promotion.erl", 31).

login(Role) ->
    case get_day() of
        0 -> {ok, Role};
        _ ->
            Now = date(),
            BuyLog = var:get_var(Role, other, 2103, []),
            NRole = case lists:keyfind(date(), 1, BuyLog) of
                        {Now, _} -> Role;
                        false ->
                            NewBuyLog = [{date(), 0} | BuyLog],
                            Role1 = var:set_var(Role, other, 2103, NewBuyLog),
                            Role1
                    end,
            send_info(NRole#role.id, NRole),
            {ok, NRole}
    end.

reload() ->
    case get_day() of
        0 -> ok;
        Day ->
            role_group:apply(world,
                             {camp_sales_promotion, zero_flush, [Day]})
    end.

zero_flush(Role, _Day) ->
    logger:debug("======~w=================",
                 [_Day],
                 camp_sales_promotion,
                 60),
    Now = date(),
    BuyLog = var:get_var(Role, other, 2103, []),
    NRole = case lists:keytake(Now, 1, BuyLog) of
                {value, {Now, _}, Rest} ->
                    NewBuyLog = [{Now, 0} | Rest],
                    Role1 = var:set_var(Role, other, 2103, NewBuyLog),
                    Role1;
                _ ->
                    NewBuyLog = [{Now, 0} | BuyLog],
                    Role1 = var:set_var(Role, other, 2103, NewBuyLog),
                    Role1
            end,
    send_info(NRole#role.id, NRole),
    {ok, NRole}.

get_today_purchase(Role) ->
    BuyLog = var:get_var(Role, other, 2103, []),
    logger:debug("~w", [BuyLog], camp_sales_promotion, 78),
    Now = date(),
    case lists:keyfind(Now, 1, BuyLog) of
        {Now, BuyNum} -> {ok, BuyNum};
        _ -> {false, lang:get("购买日期和活动日期没对上，数据出错")}
    end.

buy(ItemID, Num, Role) ->
    case check_buy(ItemID, Num, Role) of
        {ok, NewNum} -> do_buy(ItemID, Num, NewNum, Role);
        {false, Msg} -> {false, Msg}
    end.

send_info(SendRoleID,
          #role{lev = Lv, sex = Sex, classes = Classes} = Role) ->
    case get_day() of
        0 -> {false, lang:get("活动尚未开启")};
        Day ->
            AllGift = camp_sales_promotion_data:get_all_gift(),
            TodayGift = filter_gift(Day, Lv, Sex, AllGift),
            case get_today_purchase(Role) of
                {ok, BuyNum} ->
                    Fun = fun (GiftId, Temp) ->
                                  case pack_info(GiftId,
                                                 Lv,
                                                 Sex,
                                                 Classes,
                                                 BuyNum)
                                      of
                                      {ok, Info} -> [Info | Temp];
                                      false -> Temp
                                  end
                          end,
                    InfoList = lists:foldl(Fun, [], TodayGift),
                    role:pack_send(SendRoleID, 20406, {InfoList}),
                    ok;
                {false, Msg} -> {false, Msg}
            end
    end.

pack_info(GiftId, Lv, Sex, Classes, BuyNum) ->
    case item_gift_data:get(GiftId) of
        {_, List} ->
            #gift_info{item_name = Name, price = Price,
                       buy_limit = BuyLimit, spec_effect = SpecEffect,
                       promotion_id = PromotionId,
                       content_name = ContentName} =
                camp_sales_promotion_data:get_gift_info(GiftId),
            GiftInfo = [{ItemIDT,
                         NumT,
                         case lists:member(ItemIDT, SpecEffect) of
                             true -> 1;
                             false -> 0
                         end}
                        || #{item_id := ItemIDT, num := NumT, lev_low := LvLow,
                             lev_high := LvHigh, sex := SexT,
                             classes := ClassesT}
                               <- List,
                           (Lv >= LvLow andalso Lv =< LvHigh orelse
                                LvLow =:= 0 andalso LvHigh =:= 0)
                               andalso
                               (Sex =:= SexT orelse SexT =:= 2) andalso
                                   (ClassesT =:= Classes orelse
                                        ClassesT =:= 0)],
            PromotionInfo =
                camp_sales_promotion_data:get_promotion_info(PromotionId),
            {ok,
             {GiftId,
              Name,
              Price,
              BuyLimit,
              GiftInfo,
              ContentName,
              PromotionInfo,
              BuyNum}};
        _ -> false
    end.

do_buy(ItemID, Num, NewNum, Role) ->
    #gift_info{price = Price, buy_limit = MaxNum,
               promotion_id = PromotionId} =
        camp_sales_promotion_data:get_gift_info(ItemID),
    Loss = format:val_to_loss([{90002, Price * Num}]),
    role:send_buff_begin(),
    Gain = format:val_to_gain([{ItemID, 0, Num}]),
    case role_gain:do_notice(Loss ++ Gain, Role) of
        {false, #loss{msg = Msg}} ->
            role:send_buff_clean(),
            {false, Msg};
        {false, #gain{msg = Msg}} ->
            role:send_buff_clean(),
            {false, Msg};
        {ok, Role2} ->
            role:send_buff_flush(),
            Role3 = set_today_purchase(Role2, NewNum),
            {RList, {NextC, NextRId, _, NextRNum}} =
                do_reward(NewNum - Num, NewNum, PromotionId),
            case NewNum < MaxNum of
                true when RList =/= [] ->
                    PresentName = case item_data:get(NextRId) of
                                      #item_base{name = Name} -> Name;
                                      _ -> lang:get("未知道具")
                                  end,
                    case camp_sales_promotion_data:get_mail_cfg(2) of
                        #{mail_title := MailTitle, mail_content := Content} ->
                            Content2 = notice:format(Content,
                                                     [{string_2,
                                                       1,
                                                       NextC - NewNum},
                                                      {string_2, 1, NextRNum},
                                                      {string_2,
                                                       5,
                                                       PresentName}]),
                            Msg = lang:get("赠送的奖励已通过邮件发放，请查收哟{face_1,3}"),
                            notice:send(Role3, 1, Msg),
                            mail:send(Role3,
                                      #{title => lang:get(MailTitle),
                                        content => lang:get(Content2),
                                        items => RList});
                        _ -> ignore
                    end;
                false ->
                    case camp_sales_promotion_data:get_mail_cfg(1) of
                        #{mail_title := MailTitle, mail_content := Content} ->
                            Msg = lang:get("赠送的奖励已通过邮件发放，请查收哟{face_1,3}"),
                            notice:send(Role3, 1, Msg),
                            mail:send(Role3,
                                      #{title => lang:get(MailTitle),
                                        content => lang:get(Content),
                                        items => RList});
                        _ -> ignore
                    end;
                _ -> ignore
            end,
            role:pack_send(Role3, 20407, {1, lang:get(""), NewNum}),
            {ok, Role3};
        _Err ->
            logger:debug("~w", [_Err], camp_sales_promotion, 185),
            role:send_buff_clean(),
            {false, lang:get("系统错误")}
    end.

do_reward(OldNum, NewNum, PromotionId) ->
    PromotionList =
        camp_sales_promotion_data:get_promotion_info(PromotionId),
    RList = [{PresentId, Bound, RNum}
             || {CNum, PresentId, Bound, RNum} <- PromotionList,
                CNum > OldNum, CNum =< NewNum],
    NotCNum = [CNum
               || {CNum, _, _, _} <- PromotionList, CNum > NewNum],
    NextR = case NotCNum of
                [] -> {0, 0, 0, 0};
                _ ->
                    NextCNum = lists:min(NotCNum),
                    lists:keyfind(NextCNum, 1, PromotionList)
            end,
    {RList, NextR}.

get_day() ->
    Now = date:unixtime2(),
    case get_camp() of
        {_Id, ST, ET} when ST =< Now andalso ET >= Now ->
            date:day_diff(ST, Now) + 1;
        _ -> 0
    end.

get_today_gift(#role{lev = Lv, sex = Sex}) ->
    case get_day() of
        0 -> [];
        Day ->
            AllGift = camp_sales_promotion_data:get_all_gift(),
            filter_gift(Day, Lv, Sex, AllGift)
    end.

set_today_purchase(Role, NewNum) ->
    BuyLog = var:get_var(Role, other, 2103, []),
    Now = date(),
    case lists:keytake(Now, 1, BuyLog) of
        {value, {Now, _}, Rest} ->
            NewBuyLog = [{Now, NewNum} | Rest],
            NRole = var:set_var(Role, other, 2103, NewBuyLog),
            NRole;
        _ -> Role
    end.

check_camp_start() ->
    Now = date:unixtime2(),
    case campaign_mgr:get_camp_info(60042) of
        #camp_cache{start_time = StartT, end_time = EndT}
            when StartT =< Now andalso Now < EndT ->
            ok;
        _ -> {false, lang:get("活动尚未开启")}
    end.

get_camp() ->
    case campaign_mgr:get_camp_info(60042) of
        #camp_cache{id = Id, start_time = St, end_time = ET} ->
            {Id, St, ET};
        _ -> {0, -1, -1}
    end.

filter_gift(_Day, _Lv, _Sex, []) -> [];
filter_gift(Day, Lv, Sex,
            [{Day2, MinLv, MaxLv, Sex2, ItemList} | Rest]) ->
    case Day =:= Day2 andalso
             Lv >= MinLv andalso
                 Lv =< MaxLv andalso (Sex =:= Sex2 orelse Sex2 =:= 2)
        of
        true -> ItemList;
        _ -> filter_gift(Day, Lv, Sex, Rest)
    end.

check_buy(ItemID, Num, Role) ->
    case check_camp_start() of
        ok ->
            case check_is_exit(ItemID, Role) of
                ok ->
                    case check_buy_limit(ItemID, Num, Role) of
                        {ok, NewNum} -> {ok, NewNum};
                        {false, Msg} -> {false, Msg}
                    end;
                {false, Msg} -> {false, Msg}
            end;
        {false, Msg} -> {false, Msg}
    end.

check_is_exit(ItemID, Role) ->
    TodayGift = get_today_gift(Role),
    case lists:member(ItemID, TodayGift) of
        true -> ok;
        _ -> {false, lang:get("不存在的道具")}
    end.

check_buy_limit(ItemID, Num, Role) ->
    case camp_sales_promotion_data:get_gift_info(ItemID) of
        #gift_info{buy_limit = MaxNum} ->
            case get_today_purchase(Role) of
                {ok, PurchaseNum} when PurchaseNum + Num =< MaxNum ->
                    {ok, PurchaseNum + Num};
                {ok, _} -> {false, lang:get("已超出最大购买限额")};
                {false, Msg} -> {false, Msg}
            end;
        _ -> {false, lang:get("礼包信息错误")}
    end.

gm_set_today_purchase(Role, NewNum, Day) ->
    BuyLog = var:get_var(Role, other, 2103, []),
    case lists:keytake(Day, 1, BuyLog) of
        {value, {Day, _}, Rest} ->
            NewBuyLog = [{Day, NewNum} | Rest],
            logger:debug("~w",
                         [NewBuyLog],
                         camp_sales_promotion,
                         315),
            NRole = var:set_var(Role, other, 2103, NewBuyLog),
            NRole;
        _ ->
            NewBuyLog = [{Day, NewNum} | BuyLog],
            logger:debug("~w",
                         [NewBuyLog],
                         camp_sales_promotion,
                         320),
            NRole = var:set_var(Role, other, 2103, NewBuyLog),
            NRole
    end.

