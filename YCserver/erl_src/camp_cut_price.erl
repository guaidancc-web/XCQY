-file("src/mod/campaign/camp_cut_price.erl", 1).

-module(camp_cut_price).

-author("Lith").

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

-file("src/mod/campaign/camp_cut_price.erl", 13).

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

-file("src/mod/campaign/camp_cut_price.erl", 14).

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

-file("src/mod/campaign/camp_cut_price.erl", 15).

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

-file("src/mod/campaign/camp_cut_price.erl", 16).

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

-file("src/mod/campaign/camp_cut_price.erl", 17).

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

-file("src/mod/campaign/camp_cut_price.erl", 18).

-file("inc/camp_cut_price.hrl", 1).

-author("Lith").

-record(m_camp_cut_price,
        {camp_id,
         data = [],
         log = [],
         help_role,
         be_helped_list = [],
         notice_list = []}).

-record(gift_info,
        {item_id, type, old_price, price, is_buy}).

-record(log_info,
        {name,
         role_id,
         platform,
         zone_id,
         sex,
         classes,
         cut_price,
         time}).

-file("src/mod/campaign/camp_cut_price.erl", 19).

-export([init/0,
         login/1,
         zero_flush2/2,
         zero_flush/2,
         info/2,
         async_info/2,
         close_tab/1,
         async_close_tab/2,
         cut_price/2,
         async_cut_price/3,
         buy/2,
         reload/0,
         init_price/1,
         batch_init_price/0]).

-export([gm_cut_price/1,
         gm_cut_price/2,
         do_notice_gift_end/1]).

reload() ->
    role_group:apply(world,
                     {camp_cut_price, zero_flush2, [zero]}).

batch_init_price() ->
    role_group:apply(world,
                     {camp_cut_price, init_price, []}).

init() ->
    #m_camp_cut_price{camp_id = get_camp_id(), data = [],
                      log = [], be_helped_list = []}.

init_cfg_price(Role) -> {ok, Role}.

login(Role) ->
    case get_camp_time() of
        {-1, -1} -> {ok, Role};
        _ ->
            NewRole1 = case check_reset(Role) of
                           true -> reset_camp_cut_price(Role);
                           false -> Role
                       end,
            NewRole = repair_data(NewRole1),
            {ok, Role1} = init_cfg_price(NewRole),
            {ok, Role2} = init_today_gift(Role1),
            {ok, Role3} = del_help_role(Role2),
            {ok, Role4} = reset_notice_list(Role3),
            {ok, Role5} = notice_gift_end(Role4),
            {ok, Role5}
    end.

zero_flush2(Role, _) ->
    case get_camp_time() of
        {-1, -1} -> {ok, Role};
        _ ->
            NewRole1 = case check_reset(Role) of
                           true -> reset_camp_cut_price(Role);
                           false -> Role
                       end,
            NewRole = repair_data(NewRole1),
            {ok, Role2} = init_today_gift(NewRole),
            {ok, Role3} = del_help_role(Role2),
            {ok, Role4} = reset_notice_list(Role3),
            {ok, Role5} = reset_be_helped_list(Role4),
            send_info(Role5#role.id,
                      Role5#role.m_camp_cut_price,
                      Role5),
            {ok, Role6} = notice_gift_end(Role5),
            {ok, Role6}
    end.

zero_flush(Role, _) ->
    case get_camp_time() of
        {-1, -1} -> {ok, Role};
        _ ->
            {ok, NRole} = reset_be_helped_list(Role),
            {ok, NRole}
    end.

init_price(Role) ->
    case get_camp_time() of
        {-1, -1} -> {ok, Role};
        _ ->
            {ok, PriceRole} = init_cfg_price(Role),
            {ok, Role2} = init_today_gift(PriceRole),
            send_info(Role2#role.id,
                      Role2#role.m_camp_cut_price,
                      Role2),
            {ok, PriceRole}
    end.

info(TRoleID, #role{id = RoleID} = Role) ->
    case check_camp_start() of
        ok ->
            case TRoleID =:= RoleID of
                true ->
                    {ok, Role2} = init_today_gift(Role),
                    send_info(RoleID, Role2#role.m_camp_cut_price, Role2),
                    {ok, Role2};
                false ->
                    {ok, Role2} = close_tab(Role),
                    {ok, Role3} = add_help_role(TRoleID, Role2),
                    set_help_time(),
                    async(TRoleID, {camp_cut_price, async_info, [RoleID]}),
                    {ok, Role3}
            end;
        _ -> {ok, Role}
    end.

async_info(#role{m_camp_cut_price = MCampCutPrice} =
               Role,
           SRoleID) ->
    {ok, Role2} = add_notice_list(SRoleID, Role),
    send_info(SRoleID, MCampCutPrice, Role2),
    {ok, Role2}.

close_tab(#role{id = RoleID} = Role) ->
    HelpRoleID = get_help_role(Role),
    {ok, Role2} = del_help_role(Role),
    case HelpRoleID =/= undefined of
        true ->
            async(HelpRoleID,
                  {camp_cut_price, async_close_tab, [RoleID]});
        _ -> ignore
    end,
    {ok, Role2}.

async_close_tab(Role, SRoleID) ->
    {ok, Role2} = del_notice_list(SRoleID, Role),
    {ok, Role2}.

cut_price(TRoleID, #role{id = RoleID} = Role) ->
    SRoleInfo = {Role#role.name,
                 Role#role.id,
                 Role#role.platform,
                 Role#role.zone_id,
                 Role#role.sex,
                 Role#role.classes},
    {ok, Role2} = add_help_role(TRoleID, Role),
    HelpTime = get_help_time(),
    case HelpTime =:= 0 orelse
             date:is_same_day(HelpTime, date:unixtime2())
        of
        true ->
            async(TRoleID,
                  {camp_cut_price, async_cut_price, [RoleID, SRoleInfo]});
        _ ->
            role:pack_send(RoleID,
                           20402,
                           {0, 0, lang:get("礼包已过期不能砍价")})
    end,
    {ok, Role2}.

async_cut_price(Role, SRoleID, SRoleInfo) ->
    case check_cut_price(Role, SRoleID) of
        {ok, RestCutPrice, BigGift, GiftInfo} ->
            do_cut_price(SRoleID,
                         SRoleInfo,
                         RestCutPrice,
                         BigGift,
                         GiftInfo,
                         Role);
        {false, Msg} ->
            role:pack_send(SRoleID, 20402, {0, 0, Msg}),
            {ok, Role}
    end.

gm_cut_price(Role) ->
    GiftInfo = get_today_gift(Role),
    BigGift = lists:keyfind(1, #gift_info.type, GiftInfo),
    {_Num, _, _, MinPrice, _BuyLimit, _SpecEffect, _} =
        camp_cut_price_data:get_gift_info(BigGift#gift_info.item_id),
    BigGift2 = BigGift#gift_info{price = MinPrice},
    GiftInfo2 = lists:keystore(1,
                               #gift_info.type,
                               GiftInfo,
                               BigGift2),
    {ok, Role2} = set_today_gift(Role, GiftInfo2),
    send_info(Role#role.id,
              Role#role.m_camp_cut_price,
              Role2),
    {ok, Role2}.

gm_cut_price(Role, Price) ->
    GiftInfo = get_today_gift(Role),
    BigGift = lists:keyfind(1, #gift_info.type, GiftInfo),
    {_Num, _, _, MinPrice, _BuyLimit, _SpecEffect, _} =
        camp_cut_price_data:get_gift_info(BigGift#gift_info.item_id),
    Price2 = case BigGift#gift_info.price - Price > MinPrice
                 of
                 true -> BigGift#gift_info.price - Price;
                 false -> MinPrice
             end,
    BigGift2 = BigGift#gift_info{price = Price2},
    GiftInfo2 = lists:keystore(1,
                               #gift_info.type,
                               GiftInfo,
                               BigGift2),
    {ok, Role2} = set_today_gift(Role, GiftInfo2),
    send_info(Role#role.id,
              Role#role.m_camp_cut_price,
              Role2),
    {ok, Role2}.

buy(ItemID, Role) ->
    case check_buy(ItemID, Role) of
        {ok, Gift, GiftInfo} -> do_buy(Gift, GiftInfo, Role);
        {false, Msg} -> role:pack_send(Role, 20403, {0, Msg})
    end.

notice_gift_end(Role) ->
    case get_camp_day() rem 2 =:= 0 of
        true ->
            Now = date:unixtime2(),
            {_, {H, _, _}} = date:seconds_to_datetime(Now),
            case H < 12 of
                true ->
                    DiffSec = date:next_diff(12, 0, 0),
                    Timer = #timer{id = {camp_cut_price, notice_gift_end},
                                   timeout = DiffSec * 1000, times = 1,
                                   m = camp_cut_price, f = do_notice_gift_end,
                                   a = []},
                    Role2 = role_timer:set(Timer, Role),
                    {ok, Role2};
                false ->
                    Timer = #timer{id = {camp_cut_price, notice_gift_end},
                                   timeout = 1000, times = 1,
                                   m = camp_cut_price, f = do_notice_gift_end,
                                   a = []},
                    Role2 = role_timer:set(Timer, Role),
                    {ok, Role2}
            end;
        _ -> {ok, Role}
    end.

do_notice_gift_end(Role) ->
    mail:send(Role,
              #{title => lang:get("砍价礼包过期提醒"),
                content =>
                    lang:get("砍价活动礼包，即将在<color='#ffff00'>今日0点</color>结束，快去呼"
                             "唤好友齐砍价吧！砍到心仪的价格时，别忘了购买哟"),
                items => []}),
    {ok, Role}.

check_reset(Role) ->
    CampID = get_camp_id(),
    CampID =/=
        (Role#role.m_camp_cut_price)#m_camp_cut_price.camp_id.

reset_camp_cut_price(Role) ->
    Role#role{m_camp_cut_price = init()}.

async(TRoleID, MFA) ->
    case role:apply(async, TRoleID, MFA) of
        ok -> ok;
        _ -> {false, lang:get("对方不在线呢")}
    end.

send_info(SendRoleID, MCampCutPrice,
          #role{id = {RoleID, PF, ZoneID}} = Role) ->
    RestDay = get_rest_day(),
    Gift = get_today_gift(Role),
    PriceInfo = pack_price_info(Gift, Role),
    LogInfo =
        pack_log_info(MCampCutPrice#m_camp_cut_price.log),
    role:pack_send(SendRoleID,
                   20400,
                   {RoleID,
                    PF,
                    ZoneID,
                    RestDay,
                    PriceInfo,
                    LogInfo,
                    case check_be_helped_today(SendRoleID, Role) of
                        true -> 0;
                        false -> 1
                    end}),
    ok.

pack_price_info(Gift,
                #role{lev = Lv, sex = Sex, classes = Classes} =
                    _Role) ->
    PriceInfo1 = [begin
                      {_, List} = item_gift_data:get(ItemID),
                      {Num,
                       _,
                       _,
                       MinPrice,
                       BuyLimit,
                       SpecEffect,
                       ChangePrice} =
                          camp_cut_price_data:get_gift_info(ItemID),
                      GiftInfo = [{ItemIDT,
                                   NumT,
                                   case lists:member(ItemIDT, SpecEffect) of
                                       true -> 1;
                                       false -> 0
                                   end}
                                  || #{item_id := ItemIDT, num := NumT,
                                       lev_low := LvLow, lev_high := LvHigh,
                                       sex := SexT, classes := ClassesT}
                                         <- List,
                                     (Lv >= LvLow andalso Lv =< LvHigh orelse
                                          LvLow =:= 0 andalso LvHigh =:= 0)
                                         andalso
                                         (Sex =:= SexT orelse SexT =:= 2)
                                             andalso
                                             (ClassesT =:= Classes orelse
                                                  ClassesT =:= 0)],
                      {ItemID,
                       Num,
                       GiftInfo,
                       Type,
                       OldPrice,
                       Price,
                       MinPrice,
                       BuyLimit,
                       BuyTimes,
                       [{ChangePrice}]}
                  end
                  || #gift_info{item_id = ItemID, type = Type,
                                old_price = OldPrice, price = Price,
                                is_buy = BuyTimes}
                         <- Gift],
    PriceInfo1.

pack_log_info(Log) ->
    [{Name,
      RoleID,
      PF,
      ZoneID,
      Sex,
      Classes,
      CutPrice,
      Time}
     || #log_info{name = Name, role_id = RoleID,
                  platform = PF, zone_id = ZoneID, sex = Sex,
                  classes = Classes, cut_price = CutPrice, time = Time}
            <- Log].

check_camp_start() ->
    Now = date:unixtime2(),
    case campaign_mgr:get_camp_info(60038) of
        #camp_cache{start_time = StartT, end_time = EndT}
            when StartT =< Now andalso Now < EndT ->
            ok;
        _ -> {false, lang:get("活动尚未开启")}
    end.

check_cut_price(#role{id = SRoleID} = _Role, SRoleID) ->
    {false, lang:get("不能给自己砍价")};
check_cut_price(Role, SRoleID) ->
    case check_camp_start() of
        ok ->
            case check_be_helped_today(SRoleID, Role) of
                true -> {false, lang:get("每人每天只能为同一个朋友砍价一次")};
                _ ->
                    GiftInfo = get_today_gift(Role),
                    case lists:keyfind(1, #gift_info.type, GiftInfo) of
                        #gift_info{} = BigGift ->
                            case check_min_price(BigGift) of
                                {ok, RestCutPrice} ->
                                    case check_buy_limit(BigGift) of
                                        true ->
                                            {ok,
                                             RestCutPrice,
                                             BigGift,
                                             GiftInfo};
                                        false ->
                                            {false, lang:get("礼包已经被买走，没法砍价了")}
                                    end;
                                {false, Msg} -> {false, Msg}
                            end;
                        _ -> {false, lang:get("生成礼包错误，请联系工作人员")}
                    end
            end;
        {false, Msg} -> {false, Msg}
    end.

check_min_price(BigGift) ->
    case
        camp_cut_price_data:get_gift_info(BigGift#gift_info.item_id)
        of
        {_, _, _, MinPrice, _, _, _} ->
            RestCutPrice = BigGift#gift_info.price - MinPrice,
            case RestCutPrice > 0 of
                true -> {ok, RestCutPrice};
                _ -> {false, lang:get("已经砍到最低价了")}
            end;
        _ -> {false, lang:get("配置错误，请联系工作人员")}
    end.

do_cut_price(SRoleID, SRoleInfo, RestCutPrice, BigGift,
             GiftInfo, #role{name = RoleName} = Role) ->
    CutPriceList = camp_cut_price_data:get_cut_price_list(),
    {CutPrice, _} = util:rand_list(CutPriceList, 2),
    CutPrice2 = case CutPrice >= RestCutPrice of
                    true ->
                        notice_limit_price(Role),
                        RestCutPrice;
                    _ -> CutPrice
                end,
    notice(SRoleInfo, RoleName, CutPrice2),
    BigGift2 = BigGift#gift_info{price =
                                     BigGift#gift_info.price - CutPrice2},
    GiftInfo2 = lists:keystore(1,
                               #gift_info.type,
                               GiftInfo,
                               BigGift2),
    {ok, Role2} = set_today_gift(Role, GiftInfo2),
    {ok, Role3} = add_be_helped_list(SRoleID, Role2),
    {ok, Role4} = add_log(Role3, SRoleInfo, CutPrice2),
    MCampCutPrice = Role4#role.m_camp_cut_price,
    send_info(Role#role.id, MCampCutPrice, Role4),
    [send_info(TRoleID, MCampCutPrice, Role4)
     || TRoleID
            <- MCampCutPrice#m_camp_cut_price.notice_list],
    role:pack_send(SRoleID,
                   20402,
                   {1, CutPrice2, lang:get("")}),
    {ok, Role4}.

notice({TName, _, _TPF, _TZoneID, _TSex, _TClasses},
       SRoleName, CutPrice)
    when CutPrice >= 800 ->
    Msg =
        notice:format(lang:get("在~ts中~ts大刀一挥，帮~ts砍掉了~ts！堪称砍价大神哇！{face_1,114}"),
                      [{string_2, 1, lang:get("砍价活动")},
                       {role_2, TName},
                       {role_2, SRoleName},
                       {assets_1, 90002, CutPrice}]),
    notice:cast(all, 5, Msg);
notice(_, _, _) -> ok.

notice_limit_price(Role) ->
    mail:send(Role,
              #{title => lang:get("砍价活动提醒"),
                content => lang:get("亲爱的玩家，当前礼包已被砍价到最低价了哟，请尽快前往购买吧~ "),
                items => []}),
    notice:send(Role,
                3,
                lang:get("亲爱的玩家，当前礼包已被砍价到最低价了哟，请尽快前往购买吧~ ")).

check_buy(ItemID, Role) ->
    case check_camp_start() of
        ok ->
            case check_is_exit(ItemID, Role) of
                {ok, Gift, GiftInfo} ->
                    case check_buy_limit(Gift) of
                        true -> {ok, Gift, GiftInfo};
                        false -> {false, lang:get("礼包已经被买走")}
                    end;
                {false, Msg} -> {false, Msg}
            end;
        {false, Msg} -> {false, Msg}
    end.

check_is_exit(ItemID, Role) ->
    GiftInfo = get_today_gift(Role),
    case lists:keyfind(ItemID, #gift_info.item_id, GiftInfo)
        of
        #gift_info{} = Gift -> {ok, Gift, GiftInfo};
        _ -> {false, lang:get("生成道具出错，请联系客服")}
    end.

check_buy_limit(Gift) ->
    {_, _, _, _, BuyLimit, _, _} =
        camp_cut_price_data:get_gift_info(Gift#gift_info.item_id),
    Gift#gift_info.is_buy < BuyLimit.

do_buy(Gift, GiftInfo, Role) ->
    Price = Gift#gift_info.price,
    Loss = format:val_to_loss([{90002, Price}]),
    {Num, _, _, _, _, _, _} =
        camp_cut_price_data:get_gift_info(Gift#gift_info.item_id),
    GiftFlatten = flatten_gift(Gift, Num, Role),
    Gain = format:val_to_gain(GiftFlatten),
    case role_gain:do_notice(Loss, Role) of
        {ok, Role2} ->
            Gift2 = Gift#gift_info{is_buy =
                                       Gift#gift_info.is_buy + 1},
            GiftInfo2 = lists:keystore(Gift#gift_info.item_id,
                                       #gift_info.item_id,
                                       GiftInfo,
                                       Gift2),
            {ok, Role3} = set_today_gift(Role2, GiftInfo2),
            Gain2 = Gain,
            case role_gain:do_notice(Gain2, Role3) of
                {ok, Role4} ->
                    role:pack_send(Role4, 20403, {1, ""}),
                    send_info(Role4#role.id,
                              Role4#role.m_camp_cut_price,
                              Role4),
                    {ok, Role4};
                _Err ->
                    mail:send(Role3,
                              #{title => lang:get("砍价活动礼包"),
                                content =>
                                    lang:get("由于您的背包已满，砍价活动获得的奖励通过邮件下发给您，请查收"),
                                items => GiftFlatten}),
                    notice:send(Role3, 3, lang:get("背包已满，奖励已通过邮件发放")),
                    role:pack_send(Role3, 20403, {1, ""}),
                    send_info(Role3#role.id,
                              Role3#role.m_camp_cut_price,
                              Role3),
                    {ok, Role3}
            end;
        _ ->
            send_info(Role#role.id,
                      Role#role.m_camp_cut_price,
                      Role),
            role:pack_send(Role, 20403, {0, "钻石不足，请先充值"}),
            {ok, Role}
    end.

flatten_gift(#gift_info{type = 2} = Gift, Num, _Role) ->
    [{Gift#gift_info.item_id, 0, Num}];
flatten_gift(#gift_info{type = 1} = Gift, Num,
             #role{lev = Lv, sex = Sex, classes = Classes} =
                 _Role) ->
    {_, List} = item_gift_data:get(Gift#gift_info.item_id),
    GiftInfo = [{ItemIDT, 0, NumT * Num}
                || #{item_id := ItemIDT, num := NumT, lev_low := LvLow,
                     lev_high := LvHigh, sex := SexT, classes := ClassesT}
                       <- List,
                   (Lv >= LvLow andalso Lv =< LvHigh orelse
                        LvLow =:= 0 andalso LvHigh =:= 0)
                       andalso
                       (Sex =:= SexT orelse SexT =:= 2) andalso
                           (ClassesT =:= Classes orelse ClassesT =:= 0)],
    GiftInfo.

get_camp_day() ->
    {StartTime, _} = campaign_mgr:get_camp_time(60038),
    date:day_diff(StartTime, date:unixtime2()) + 1.

get_camp_time() -> campaign_mgr:get_camp_time(60038).

get_rest_day() ->
    TemDay = get_camp_day() rem 2,
    RDay = case TemDay of
               0 -> 1;
               _ -> 2 - TemDay + 1
           end,
    RDay.

get_camp_id() ->
    case campaign_mgr:get_camp_info(60038) of
        #camp_cache{id = ID} -> ID;
        _ -> 0
    end.

filter_gift(Role) ->
    #role{lev = Lv, sex = Sex} = Role,
    filter_gift(Lv, Sex).

filter_gift(Lv, Sex) ->
    Day = get_camp_day(),
    AllGift = camp_cut_price_data:get_all_gift(),
    filter_gift2(Day, Lv, Sex, AllGift).

filter_gift2(_Day, _Lv, _Sex, []) -> [];
filter_gift2(Day, Lv, Sex,
             [{Day2, MinLv, MaxLv, Sex2, ItemList} | Rest]) ->
    case Day =:= Day2 andalso
             Lv >= MinLv andalso
                 Lv =< MaxLv andalso (Sex =:= Sex2 orelse Sex2 =:= 2)
        of
        true -> ItemList;
        _ -> filter_gift2(Day, Lv, Sex, Rest)
    end.

get_gift(Role, Day) ->
    Data =
        (Role#role.m_camp_cut_price)#m_camp_cut_price.data,
    case lists:keyfind(Day, 1, Data) of
        {Day, GiftInfo} -> GiftInfo;
        _ -> []
    end.

get_today_gift(Role) ->
    Day = get_camp_day(),
    get_gift(Role, Day).

set_today_gift(Role, GiftInfo) ->
    Day = get_camp_day(),
    MCampCutPrice = Role#role.m_camp_cut_price,
    Data = MCampCutPrice#m_camp_cut_price.data,
    Data2 = lists:keystore(Day, 1, Data, {Day, GiftInfo}),
    MCampCutPrice2 = MCampCutPrice#m_camp_cut_price{data =
                                                        Data2},
    {ok, Role#role{m_camp_cut_price = MCampCutPrice2}}.

init_today_gift(Role) ->
    case get_today_gift(Role) of
        [] ->
            case get_camp_day() rem 2 =/= 1 of
                true ->
                    Fun = fun (Gift) ->
                                  case inherit_big_gift(Role) of
                                      #gift_info{} = BigGift ->
                                          lists:keystore(1,
                                                         #gift_info.type,
                                                         Gift,
                                                         BigGift);
                                      undefined -> Gift
                                  end
                          end,
                    {ok, Role2} = init_today_gift2(Fun, Role),
                    {ok, Role2};
                _ ->
                    Fun = fun (Gift) -> Gift end,
                    {ok, Role2} = init_today_gift2(Fun, Role),
                    {ok, Role2}
            end;
        GiftInfo ->
            GiftInfo2 = [begin
                             case camp_cut_price_data:get_gift_info(ItemID) of
                                 {_Num,
                                  _,
                                  OldPrice,
                                  _MinPrice,
                                  _BuyLimit,
                                  _SpecEffect,
                                  _ChangePrice} ->
                                     case Price > OldPrice of
                                         true ->
                                             Gift#gift_info{old_price =
                                                                OldPrice,
                                                            price = OldPrice};
                                         false ->
                                             Gift#gift_info{old_price =
                                                                OldPrice}
                                     end;
                                 _ -> Gift
                             end
                         end
                         || Gift = #gift_info{item_id = ItemID, price = Price}
                                <- GiftInfo],
            {ok, Role2} = set_today_gift(Role, GiftInfo2),
            {ok, Role2}
    end.

init_today_gift2(Fun, Role) ->
    Gift = filter_gift(Role),
    GiftInfo = trans_gift_info(Gift),
    GiftInfo2 = Fun(GiftInfo),
    {ok, Role2} = set_today_gift(Role, GiftInfo2),
    {ok, Role3} = case get_camp_day() rem 2 =:= 1 of
                      true -> del_log(Role2);
                      false -> {ok, Role2}
                  end,
    {ok, Role3}.

inherit_big_gift(Role) ->
    Day = get_camp_day(),
    inherit_big_gift(Role, Day - 1).

inherit_big_gift(_Role, 0) -> undefined;
inherit_big_gift(Role, 1) ->
    case get_gift(Role, 1) of
        [] -> undefined;
        GiftInfo ->
            case lists:keyfind(1, #gift_info.type, GiftInfo) of
                #gift_info{} = BigGift -> BigGift;
                _ -> undefined
            end
    end;
inherit_big_gift(Role, Day) ->
    case get_gift(Role, Day) of
        [] -> inherit_big_gift(Role, Day - 1);
        GiftInfo ->
            case lists:keyfind(1, #gift_info.type, GiftInfo) of
                #gift_info{} = BigGift -> BigGift;
                _ -> inherit_big_gift(Role, Day - 1)
            end
    end.

trans_gift_info(Gift) ->
    lists:foldl(fun (ItemID, Acc) ->
                        case camp_cut_price_data:get_gift_info(ItemID) of
                            {_, Type, Price, _, _, _, _} ->
                                [#gift_info{item_id = ItemID, type = Type,
                                            old_price = Price, price = Price,
                                            is_buy = 0}
                                 | Acc];
                            _ -> Acc
                        end
                end,
                [],
                Gift).

add_log(Role,
        {TName, {TRoleID, _, _}, TPF, TZoneID, TSex, TClasses},
        CutPrice) ->
    LogInfo = #log_info{name = TName, role_id = TRoleID,
                        platform = TPF, zone_id = TZoneID, sex = TSex,
                        classes = TClasses, cut_price = CutPrice,
                        time = date:unixtime2()},
    MCampCutPrice = Role#role.m_camp_cut_price,
    Log = MCampCutPrice#m_camp_cut_price.log,
    case erlang:length(Log) >= 10 of
        true -> Log2 = [LogInfo | lists:droplast(Log)];
        _ -> Log2 = [LogInfo | Log]
    end,
    MCampCutPrice2 = MCampCutPrice#m_camp_cut_price{log =
                                                        Log2},
    Role2 = Role#role{m_camp_cut_price = MCampCutPrice2},
    {ok, Role2}.

del_log(Role) ->
    MCampCutPrice = Role#role.m_camp_cut_price,
    MCampCutPrice2 = MCampCutPrice#m_camp_cut_price{log =
                                                        []},
    {ok, Role#role{m_camp_cut_price = MCampCutPrice2}}.

check_be_helped_today(CheckRoleID, Role) ->
    MCampCutPrice = Role#role.m_camp_cut_price,
    BeHelpedList =
        MCampCutPrice#m_camp_cut_price.be_helped_list,
    lists:member(CheckRoleID, BeHelpedList).

add_be_helped_list(TRoleID, Role) ->
    AddFun = fun (BeHelpedList) ->
                     case lists:member(TRoleID, BeHelpedList) of
                         true -> BeHelpedList;
                         false -> [TRoleID | BeHelpedList]
                     end
             end,
    change_be_helped_list(AddFun, Role).

reset_be_helped_list(Role) ->
    ResetFun = fun (_BeHelpedList) -> [] end,
    change_be_helped_list(ResetFun, Role).

change_be_helped_list(Fun, Role) ->
    MCampCutPrice = Role#role.m_camp_cut_price,
    BeHelpedList =
        MCampCutPrice#m_camp_cut_price.be_helped_list,
    BeHelpedList2 = Fun(BeHelpedList),
    MCampCutPrice2 =
        MCampCutPrice#m_camp_cut_price{be_helped_list =
                                           BeHelpedList2},
    Role2 = Role#role{m_camp_cut_price = MCampCutPrice2},
    {ok, Role2}.

get_help_role(Role) ->
    MCampCutPrice = Role#role.m_camp_cut_price,
    MCampCutPrice#m_camp_cut_price.help_role.

add_help_role(TRoleID, Role) ->
    MCampCutPrice = Role#role.m_camp_cut_price,
    MCampCutPrice2 =
        MCampCutPrice#m_camp_cut_price{help_role = TRoleID},
    Role2 = Role#role{m_camp_cut_price = MCampCutPrice2},
    {ok, Role2}.

del_help_role(Role) ->
    MCampCutPrice = Role#role.m_camp_cut_price,
    MCampCutPrice2 =
        MCampCutPrice#m_camp_cut_price{help_role = undefined},
    Role2 = Role#role{m_camp_cut_price = MCampCutPrice2},
    {ok, Role2}.

set_help_time() ->
    erlang:put({camp_cut_price, help_time},
               date:unixtime2()).

get_help_time() ->
    case erlang:get({camp_cut_price, help_time}) of
        Time when erlang:is_integer(Time) -> Time;
        _ -> 0
    end.

add_notice_list(TRoleID, Role) ->
    AddFun = fun (NoticeList) ->
                     case lists:member(TRoleID, NoticeList) of
                         true -> NoticeList;
                         false ->
                             case erlang:length(NoticeList) > 50 of
                                 true -> [TRoleID | lists:droplast(NoticeList)];
                                 _ -> [TRoleID | NoticeList]
                             end
                     end
             end,
    change_notice_list(AddFun, Role).

del_notice_list(TRoleID, Role) ->
    DelFun = fun (NoticeList) ->
                     lists:delete(TRoleID, NoticeList)
             end,
    change_notice_list(DelFun, Role).

reset_notice_list(Role) ->
    ResetFun = fun (_NoticeList) -> [] end,
    change_notice_list(ResetFun, Role).

change_notice_list(Fun, Role) ->
    MCampCutPrice = Role#role.m_camp_cut_price,
    NoticeList = MCampCutPrice#m_camp_cut_price.notice_list,
    NoticeList2 = Fun(NoticeList),
    MCampCutPrice2 =
        MCampCutPrice#m_camp_cut_price{notice_list =
                                           NoticeList2},
    Role2 = Role#role{m_camp_cut_price = MCampCutPrice2},
    {ok, Role2}.

repair_data(Role = #role{m_camp_cut_price =
                             MCampCutPrice}) ->
    NewCampId = get_camp_id(),
    AllGiftList = camp_cut_price_data:get_all_gift(),
    DayGiftList = [{GiftId1, GiftId2, Date}
                   || {Date, _MinLev, _MaxLev, _Sex, [GiftId1, GiftId2]}
                          <- AllGiftList],
    NewRole1 = Role#role{m_camp_cut_price =
                             MCampCutPrice#m_camp_cut_price{camp_id =
                                                                NewCampId}},
    NewRole = repair_gift_data(DayGiftList, NewRole1),
    NewRole.

repair_gift_data([], Role) -> Role;
repair_gift_data([{GiftId1, GiftId2, Day} | T],
                 Role = #role{m_camp_cut_price =
                                  MCampCutPrice = #m_camp_cut_price{data =
                                                                        Data}}) ->
    NewData = case lists:keyfind(Day, 1, Data) of
                  {Day, GiftInfo} ->
                      NewGiftInfo1 = check_gift_id(GiftInfo,
                                                   GiftId1,
                                                   GiftId2,
                                                   []),
                      NewGiftInfo = case length(NewGiftInfo1) =:= 2 of
                                        true -> NewGiftInfo1;
                                        _ -> []
                                    end,
                      lists:keystore(Day, 1, Data, {Day, NewGiftInfo});
                  _ -> Data
              end,
    NewRole = Role#role{m_camp_cut_price =
                            MCampCutPrice#m_camp_cut_price{data = NewData}},
    repair_gift_data(T, NewRole).

check_gift_id([], _GiftId1, _GiftId2, NewGiftInfo) ->
    NewGiftInfo;
check_gift_id([GiftInfo = #gift_info{item_id = ItemId}
               | T],
              GiftId1, GiftId2, NewGiftInfo) ->
    case ItemId =:= GiftId1 orelse ItemId =:= GiftId2 of
        true ->
            check_gift_id(T,
                          GiftId1,
                          GiftId2,
                          [GiftInfo | NewGiftInfo]);
        _ -> check_gift_id(T, GiftId1, GiftId2, NewGiftInfo)
    end.

