-file("src/mod/camp_pray/camp_pray.erl", 1).

-module(camp_pray).

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

-file("src/mod/camp_pray/camp_pray.erl", 10).

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

-file("src/mod/camp_pray/camp_pray.erl", 11).

-file("inc/camp_pray.hrl", 1).

-record(m_camp_pray,
        {ver = 2,
         camp_id = 0,
         reset_times = 0,
         choose_ids = [],
         do_times = 0,
         must_items = []}).

-file("src/mod/camp_pray/camp_pray.erl", 12).

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

-file("src/mod/camp_pray/camp_pray.erl", 13).

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

-file("src/mod/camp_pray/camp_pray.erl", 14).

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

-file("src/mod/camp_pray/camp_pray.erl", 15).

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

-file("src/mod/camp_pray/camp_pray.erl", 16).

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

-file("src/mod/camp_pray/camp_pray.erl", 17).

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

-file("src/mod/camp_pray/camp_pray.erl", 18).

-export([init/0,
         login/1,
         auto_reward/1,
         reload/0,
         init_camp/1,
         push/1,
         choose_pool_items/2,
         pray/2,
         reward/1]).

-export([calc_reward/5]).

init() -> #m_camp_pray{}.

login(Role) -> init_camp(Role).

auto_reward(Role) ->
    case reward(Role) of
        {ok, NewRole, _} -> {ok, NewRole};
        _Else ->
            logger:debug("发放奖励错误:~w", [_Else], camp_pray, 60),
            ok
    end.

reload() ->
    role_group:apply(world, {camp_pray, init_camp, []}).

init_camp(Role = #role{m_camp_pray =
                           #m_camp_pray{camp_id = RoleCampId}}) ->
    CampId = get_camp_id(),
    case RoleCampId =/= CampId of
        true -> do_init_camp(Role, CampId);
        _ -> ok
    end.

push(Role = #role{m_camp_pray = MCampPray}) ->
    Times = var:get_var(Role, day, 638, 0),
    role:link_send(Role, 21200, {MCampPray, Times}),
    ok.

choose_pool_items(Role, Ids) ->
    Steps = [check, cost, set],
    Args = #{choose_ids => Ids},
    do_choose(Steps, Role, Args).

pray(Role, Mode) ->
    Steps = [check_times,
             check_pool,
             cost,
             calc_reward,
             add_timer],
    Args = #{mode => Mode},
    case reward(Role) of
        ok -> do_pray(Steps, Role, Args);
        {ok, RewardRole, _Items} ->
            case do_pray(Steps, RewardRole, Args) of
                {ok, NewRole, RewardId} -> {ok, NewRole, RewardId};
                {false, Reason} -> {false, RewardRole, Reason}
            end
    end.

reward(Role) ->
    TimerRole = role_timer:del(camp_pray_reward_timer,
                               Role),
    VarItems = var:get_var(Role, other, 2158, undefined),
    Reward = erase(camp_pray_reward),
    NewWard = case VarItems =/= undefined of
                  true -> VarItems;
                  _ -> Reward
              end,
    case NewWard of
        {[], _, _} ->
            logger:error("~ts奖励为空:~w",
                         [Role#role.name, Reward],
                         camp_pray,
                         121),
            ok;
        {GainItems, CastItems, ScReward} ->
            case CastItems of
                [_ | _] ->
                    NewCastItems = format:merge_val(CastItems, []),
                    notice:cast(all,
                                5,
                                lang:get("~ts在祈愿福阁中许下愿望,竟然获得了~ts"),
                                [{role_2, Role#role.name},
                                 {item_2, NewCastItems}]);
                _ -> ok
            end,
            NewGainItems = GainItems ++ ScReward,
            Gain = format:val_to_gain(NewGainItems),
            VarRole = var:set_var(TimerRole,
                                  other,
                                  2158,
                                  undefined),
            case role_gain:do_notice(Gain, VarRole) of
                {ok, GainRole} ->
                    Items = [{ItemId, Count}
                             || {ItemId, _Bind, Count} <- GainItems],
                    {ok, GainRole, Items};
                _ ->
                    Title = lang:get("祈愿福阁"),
                    Content = lang:get("背包已满,奖励已通过邮件发放,请查收:"),
                    mail:send(Role, Title, Content, NewGainItems),
                    notice:send(Role, 1, lang:get("背包已满,奖励已通过邮件发放")),
                    Items = [{ItemId, Count}
                             || {ItemId, _Bind, Count} <- GainItems],
                    {ok, VarRole, Items}
            end;
        _Else ->
            logger:debug("当前没有奖励:~w", [_Else], camp_pray, 146),
            ok
    end.

do_choose([], Role, _Args) -> {ok, Role};
do_choose([check | Rest], Role, Args) ->
    case do_check_ids([is_null,
                       count,
                       classes_info,
                       pool_count],
                      Role,
                      Args)
        of
        {true, NewArgs} -> do_choose(Rest, Role, NewArgs);
        {false, Reason} -> {false, Reason};
        _Err -> {false, lang:get("奖池选取物品不符合条件")}
    end;
do_choose([cost | Rest], Role,
          Args = #{is_reset := true}) ->
    logger:debug("============", [], camp_pray, 170),
    case calc_rest_cost(Role) of
        Cost = [_ | _] ->
            Loss = format:val_to_loss(Cost),
            case role_gain:do_notice(Loss, Role) of
                {ok, LossRole} ->
                    NewRole = add_reset_times(LossRole),
                    do_choose(Rest, NewRole, Args);
                {false, #loss{msg = Msg}} -> {false, Msg};
                _ -> {false, lang:get("重置消耗不足")}
            end;
        _ ->
            NewRole = add_reset_times(Role),
            do_choose(Rest, NewRole, Args)
    end;
do_choose([cost | Rest], Role, Args) ->
    logger:debug("============:~w", [Args], camp_pray, 188),
    do_choose(Rest, Role, Args);
do_choose([set | Rest], Role,
          Args = #{choose_ids := Ids}) ->
    NewRole = update_choose_ids(Role, Ids),
    push(NewRole),
    do_choose(Rest, NewRole, Args);
do_choose([_Other | _], _Role, _Args) ->
    logger:error("未知步骤:~w, 参数:~w",
                 [_Other, _Args],
                 camp_pray,
                 195),
    {false, lang:get("系统错误")}.

do_check_ids([], _Role, Args) -> {true, Args};
do_check_ids([is_null | Rest],
             Role = #role{m_camp_pray =
                              #m_camp_pray{choose_ids = []}},
             Args) ->
    do_check_ids(Rest, Role, Args);
do_check_ids([is_null | Rest],
             Role = #role{m_camp_pray =
                              #m_camp_pray{choose_ids = ChooseIds}},
             Args = #{choose_ids := Ids}) ->
    case ChooseIds -- Ids of
        [] -> {false, lang:get("当前选择的奖池无变化，请重新选择{face_1,3}")};
        _ -> do_check_ids(Rest, Role, Args#{is_reset => true})
    end;
do_check_ids([count | Rest], Role,
             Args = #{choose_ids := Ids}) ->
    case erlang:length(Ids) =/= 10 of
        true ->
            {false, lang:get("当前未选满所需的奖池奖励哟，快去选择心仪的道具吧{face_1,3}")};
        _ -> do_check_ids(Rest, Role, Args)
    end;
do_check_ids([classes_info | Rest], Role,
             Args = #{choose_ids := Ids}) ->
    case check_cond_ids(Role, Ids) of
        true -> do_check_ids(Rest, Role, Args);
        {false, Reason} -> {false, Reason};
        _Else ->
            logger:debug("检测失败:~w", [_Else], camp_pray, 224),
            _Else
    end;
do_check_ids([pool_count | Rest], Role,
             Args = #{choose_ids := Ids}) ->
    PoolIdCount = analyse_ids_pool(Ids),
    PoolCountCfg = camp_pray_data:pool_info(),
    case PoolCountCfg -- PoolIdCount of
        [] -> do_check_ids(Rest, Role, Args);
        _ -> {false, lang:get("您选择的奖池道具数量不符合条件,请重新选择")}
    end;
do_check_ids([_Other | _], _R, _Args) ->
    logger:error("未知校验:~w, 参数:~w",
                 [_Other, _Args],
                 camp_pray,
                 237),
    {false, lang:get("系统错误")}.

update_choose_ids(Role = #role{m_camp_pray = MCampPray},
                  Ids) ->
    Role#role{m_camp_pray =
                  MCampPray#m_camp_pray{choose_ids = Ids}}.

analyse_ids_pool(Ids) -> analyse_ids_pool(Ids, []).

analyse_ids_pool([], Result) -> Result;
analyse_ids_pool([Id | R], Result) ->
    case camp_pray_data:get(Id) of
        #{pool_id := PoolId} ->
            NewResult = case lists:keyfind(PoolId, 1, Result) of
                            {_, C} ->
                                lists:keystore(PoolId,
                                               1,
                                               Result,
                                               {PoolId, C + 1});
                            _ -> [{PoolId, 1} | Result]
                        end,
            analyse_ids_pool(R, NewResult);
        _ -> analyse_ids_pool(R, Result)
    end.

check_cond_ids(_Role, []) -> true;
check_cond_ids(Role = #role{classes = RoleClasses,
                            sex = RoleSex, lev = RoleLev},
               [Id | R]) ->
    case camp_pray_data:get(Id) of
        #{classes := Classes, sex := Sex, min_lev := MinLev,
          max_lev := MaxLev}
            when (Classes =:= 0 orelse Classes =:= RoleClasses)
                     andalso
                     (Sex =:= 2 orelse Sex =:= RoleSex) andalso
                         (MinLev =:= 0 orelse MinLev =< RoleLev) andalso
                             (MaxLev =:= 0 orelse MaxLev >= RoleLev) ->
            check_cond_ids(Role, R);
        _Else ->
            logger:debug("~w不满足条件:~w", [Id, _Else], camp_pray, 274),
            {false, lang:get("您选择的道具不符合条件")}
    end.

do_pray([], Role, _Args = #{reward_id := RewardId}) ->
    push(Role),
    {ok, Role, RewardId};
do_pray([check_times | Rest],
        Role = #role{p_bag = PBag}, Args = #{mode := Mode}) ->
    ItemId = camp_pray_data:get_key_value_1(2),
    {_, ItemCount} = package:count(by_base_id,
                                   ItemId,
                                   PBag),
    Count = case Mode of
                1 -> 1;
                _ -> 10
            end,
    {UseItem, Cost} = case ItemCount >= Count of
                          true -> {1, [{ItemId, Count}]};
                          _ ->
                              GoldCost = case Mode of
                                             1 ->
                                                 camp_pray_data:get_key_value_1(3);
                                             _ ->
                                                 camp_pray_data:get_key_value_1(9)
                                         end,
                              {0, GoldCost}
                      end,
    Loss = format:val_to_loss(Cost),
    NeedTimes = case Mode of
                    1 -> 1;
                    2 -> 10
                end,
    case UseItem of
        0 ->
            Times = var:get_var(Role, day, 638, 0),
            case camp_pray_data:get_key_value_1(10) - Times <
                     NeedTimes
                of
                true -> {false, lang:get("今日祈愿次数已用完")};
                _ ->
                    do_pray(Rest,
                            Role,
                            Args#{loss => Loss, add_times => NeedTimes,
                                  count => NeedTimes})
            end;
        _ ->
            do_pray(Rest,
                    Role,
                    Args#{loss => Loss, add_times => 0, count => NeedTimes})
    end;
do_pray([check_pool | _],
        #role{m_camp_pray = #m_camp_pray{choose_ids = []}},
        _Args) ->
    {false, lang:get("当前未选满所需的奖池奖励哟，快去选择心仪的道具吧{face_1,3}")};
do_pray([check_pool | Rest], Role, Args) ->
    do_pray(Rest, Role, Args);
do_pray([cost | Rest], Role,
        Args = #{loss := Loss, add_times := AddTimes}) ->
    case role_gain:do_notice(Loss, Role) of
        {ok, LossRole} ->
            VarRole = case AddTimes > 0 of
                          true -> var:add_var(LossRole, day, 638, AddTimes, 0);
                          _ -> LossRole
                      end,
            do_pray(Rest, VarRole, Args);
        {false, #loss{msg = Msg}} -> {false, Msg};
        _ -> {false, lang:get("祈愿道具不足")}
    end;
do_pray([calc_reward | Rest], Role,
        Args = #{count := Count}) ->
    case calc_reward(Role, Count) of
        {true, NewRole, RewardCfg} ->
            logger:debug("奖励信息:~w", [RewardCfg], camp_pray, 336),
            ScoreReward = camp_pray_data:get_key_value_1(5),
            ScReward = [{Assets, Val * Count}
                        || {Assets, Val} <- ScoreReward],
            do_pray(Rest,
                    NewRole,
                    Args#{reward_cfg => RewardCfg, sc_reward => ScReward});
        {false, Reason} -> {false, Reason}
    end;
do_pray([add_timer | Rest], Role,
        Args = #{reward_cfg := RewardCfg,
                 sc_reward := ScReward}) ->
    Timer = #timer{id = camp_pray_reward_timer,
                   timeout = 10000, m = camp_pray, f = auto_reward,
                   a = []},
    TimerRole = role_timer:add(Timer, Role),
    case partation_items(RewardCfg) of
        {RewardId, GainItems, CastItems} ->
            VarRole = var:set_var(TimerRole,
                                  other,
                                  2158,
                                  {GainItems, CastItems, ScReward}),
            do_pray(Rest, VarRole, Args#{reward_id => RewardId});
        _ ->
            logger:error("暂时未配置抽奖道具", [], camp_pray, 352),
            {false, lang:get("系统错误")}
    end;
do_pray([_Other | _], _Role, _Args) ->
    logger:error("未知步骤:~w, 参数:~w",
                 [_Other, _Args],
                 camp_pray,
                 356),
    {false, lang:get("系统错误")}.

calc_reward(Role = #role{m_camp_pray =
                             MCampPray = #m_camp_pray{choose_ids = ChooseIds,
                                                      do_times = DoTimes,
                                                      must_items = MustItems}},
            Count) ->
    PrayCfg = [camp_pray_data:get(Id) || Id <- ChooseIds],
    case calc_reward(PrayCfg, DoTimes, MustItems, Count, [])
        of
        {true, NewDoTimes, NewMustItems, RewardCfg} ->
            NewRole = Role#role{m_camp_pray =
                                    MCampPray#m_camp_pray{do_times = NewDoTimes,
                                                          must_items =
                                                              NewMustItems}},
            {true, NewRole, RewardCfg};
        {false, Reason} -> {false, Reason}
    end.

calc_reward(_RandList, DoTimes, MustItems, Count,
            Result)
    when Count =< 0 ->
    {true, DoTimes, MustItems, Result};
calc_reward(RandList, DoTimes, MustItems, Count,
            Result) ->
    {IsMust, NewRandList} = filter_rand_list(RandList,
                                             DoTimes,
                                             MustItems,
                                             []),
    case util:rand_list(NewRandList, ratio) of
        Cfg = #{id := Id} ->
            NewDoTimes = case IsMust of
                             true -> 0;
                             _ -> DoTimes + 1
                         end,
            NewMustItems = case is_must_items(Cfg) of
                               true ->
                                   case lists:keyfind(Id, 1, MustItems) of
                                       {_Id, Times} ->
                                           lists:keystore(Id,
                                                          1,
                                                          MustItems,
                                                          {Id, Times + 1});
                                       _ -> [{Id, 1} | MustItems]
                                   end;
                               _ -> MustItems
                           end,
            calc_reward(RandList,
                        NewDoTimes,
                        NewMustItems,
                        Count - 1,
                        [Cfg | Result]);
        _Else ->
            logger:debug("抽奖失败:~w", [_Else], camp_pray, 392),
            {false, lang:get("错误的奖励信息")}
    end.

filter_rand_list([], _DoTimes, _MustItems, Result) ->
    {false, Result};
filter_rand_list([Cfg = #{must_no := 0, must_do := 0}
                  | Rest],
                 DoTimes, MustItems, Result) ->
    filter_rand_list(Rest,
                     DoTimes,
                     MustItems,
                     [Cfg | Result]);
filter_rand_list([#{must_no := MustNo} | Rest], DoTimes,
                 MustItems, Result)
    when MustNo > 0 andalso DoTimes < MustNo ->
    filter_rand_list(Rest, DoTimes, MustItems, Result);
filter_rand_list([Cfg = #{id := Id, must_do := MustDo}
                  | Rest],
                 DoTimes, MustItems, Result)
    when MustDo > 0 andalso DoTimes >= MustDo ->
    MaxTimes = maps:get(max_times, Cfg, 0),
    case MaxTimes > 0 of
        true ->
            case lists:keyfind(Id, 1, MustItems) of
                {_, Times} when Times >= MaxTimes ->
                    filter_rand_list(Rest, DoTimes, MustItems, Result);
                _ -> {true, [Cfg]}
            end;
        _ -> {true, [Cfg]}
    end;
filter_rand_list([Cfg = #{id := Id} | Rest], DoTimes,
                 MustItems, Result) ->
    MaxTimes = maps:get(max_times, Cfg, 0),
    case MaxTimes > 0 of
        true ->
            case lists:keyfind(Id, 1, MustItems) of
                {_, Times} when Times >= MaxTimes ->
                    filter_rand_list(Rest, DoTimes, MustItems, Result);
                _ ->
                    filter_rand_list(Rest,
                                     DoTimes,
                                     MustItems,
                                     [Cfg | Result])
            end;
        _ ->
            filter_rand_list(Rest,
                             DoTimes,
                             MustItems,
                             [Cfg | Result])
    end.

partation_items(CfgList = [#{id := RewardId} | _]) ->
    Rewards = [{ItemId, Bind, Count}
               || #{item_id := ItemId, bind := Bind, count := Count}
                      <- CfgList],
    CastItems = [{ItemId, Count}
                 || #{item_id := ItemId, count := Count, is_cast := 1}
                        <- CfgList],
    {RewardId, Rewards, CastItems};
partation_items(_) -> false.

calc_rest_cost(#role{m_camp_pray =
                         #m_camp_pray{reset_times = ResetTimes}}) ->
    case ResetTimes >= camp_pray_data:get_key_value_1(1) of
        true -> camp_pray_data:get_key_value_1(4);
        _ -> []
    end.

get_camp_id() -> campaign_mgr:get_camp_id(60065).

do_init_camp(Role = #role{m_camp_pray =
                              MCampPray = #m_camp_pray{}},
             Campid) ->
    NewMCampPray = MCampPray#m_camp_pray{camp_id = Campid,
                                         choose_ids = [], reset_times = 0,
                                         must_items = [], do_times = 0},
    NewRole = Role#role{m_camp_pray = NewMCampPray},
    {ok, NewRole}.

add_reset_times(Role = #role{m_camp_pray =
                                 MCampPray = #m_camp_pray{reset_times =
                                                              ResetTimes}}) ->
    NewMCampPray = MCampPray#m_camp_pray{choose_ids = [],
                                         reset_times = ResetTimes + 1},
    Role#role{m_camp_pray = NewMCampPray}.

is_must_items(#{must_no := MustNo,
                must_do := MustDo}) ->
    MustDo =/= 0 orelse MustNo =/= 0;
is_must_items(_) -> false.

