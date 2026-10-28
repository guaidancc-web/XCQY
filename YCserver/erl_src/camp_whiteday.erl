-file("src/mod/campaign/camp_whiteday.erl", 1).

-module(camp_whiteday).

-behaviour(gen_server).

-export([push/1,
         push/2,
         wish/3,
         look/2,
         votive/2,
         get/1,
         get_votive/1]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-record(state, {}).

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

-file("src/mod/campaign/camp_whiteday.erl", 24).

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

-file("src/mod/campaign/camp_whiteday.erl", 25).

-file("inc/camp_whiteday.hrl", 1).

-record(camp_whiteday,
        {id = {0, "", 0},
         owner = {0, "", 0},
         role_id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         type = 0,
         reward = [],
         wish = "",
         flag = 0,
         timeout = 0,
         intimacy = 0}).

-record(camp_whiteday_index,
        {id = 0, role_id = {0, "", 0}}).

-file("src/mod/campaign/camp_whiteday.erl", 26).

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

-file("src/mod/campaign/camp_whiteday.erl", 27).

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

-file("src/mod/campaign/camp_whiteday.erl", 28).

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

-file("src/mod/campaign/camp_whiteday.erl", 29).

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

-file("src/mod/campaign/camp_whiteday.erl", 30).

-file("inc/condition.hrl", 1).

-record(condition,
        {label :: undefined | atom(),
         op = eq ::
             ue | eq | lt | gt | le | ge | range | include,
         val :: undefined | term(),
         msg = "" :: list()}).

-file("src/mod/campaign/camp_whiteday.erl", 31).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/campaign/camp_whiteday.erl", 32).

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

-file("src/mod/campaign/camp_whiteday.erl", 33).

-file("inc/friend.hrl", 1).

-record(friendship,
        {owner = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         type = 0 :: non_neg_integer(),
         intimacy = 0 :: non_neg_integer(),
         ct = 0 :: non_neg_integer()}).

-record(friend_role,
        {id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         ver = 6,
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         break_times = 0,
         fc = 0 :: non_neg_integer(),
         face = 1 :: pos_integer(),
         intimacy = 0 :: non_neg_integer(),
         glamor = 0 :: non_neg_integer(),
         signature = "" :: string(),
         city = "" :: string(),
         online = 0 :: 0 | 1,
         online_time = 0 :: non_neg_integer(),
         total_fc = 0 :: non_neg_integer(),
         guild = "" :: string(),
         qualifying,
         arena,
         pet,
         guard,
         skill_prac = 0,
         achievement = 0,
         received_num = 0,
         given_num = 0,
         update_time = 0,
         looks = [] :: list(),
         offline_push = 0,
         glory_max_id = 0,
         glory_time = 0}).

-record(friend_request,
        {owner = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         fc = 0 :: non_neg_integer(),
         total_fc = 0 :: non_neg_integer(),
         face = 1 :: pos_integer(),
         ct = 0 :: non_neg_integer()}).

-record(friend_present,
        {ver = 0,
         giver = {0, "", 0},
         recipient = {0, "", 0},
         time = 0 :: integer(),
         num = 0 :: integer()}).

-record(m_friend,
        {ver = 2,
         signature = "星辰奇缘真好玩！" :: string(),
         num = 0 :: non_neg_integer(),
         fans = 0 :: non_neg_integer(),
         log_next_id = 1 :: pos_integer(),
         flower = 0 :: non_neg_integer(),
         intimacy = 0 :: non_neg_integer(),
         glamor = 0 :: non_neg_integer(),
         city = "" :: string(),
         set_num = 0 :: non_neg_integer(),
         cond_city = 1 :: 0..1,
         cond_sex = 1 :: 0..1,
         cond_fc = 1 :: 0..1,
         received_presents = [] :: [],
         given_presents = [] :: [],
         received_num = 0 :: non_neg_integer(),
         given_num = 0 :: non_neg_integer(),
         popularity_rewarded = [] :: list(),
         offline_push = 0}).

-record(friend_zone,
        {ver = 14 :: non_neg_integer(),
         id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         photo = [] :: non_neg_integer(),
         birth = "" :: non_neg_integer(),
         constellation = 0 :: non_neg_integer(),
         abo = 0 :: non_neg_integer(),
         signature = "" :: string(),
         spouse_id = {0, "", 0} :: tuple(),
         spouse_name = "" :: string(),
         region = "" :: string(),
         online_time = 0 :: non_neg_integer(),
         guild = "" :: string(),
         subscribed = [],
         fans = [],
         visitors = [],
         visited = 0 :: non_neg_integer(),
         tags = [],
         liked = 0 :: non_neg_integer(),
         likes = [],
         privacy = 0 :: 0 | 1,
         prize_num = 0 :: non_neg_integer(),
         own_trends = [] :: [non_neg_integer()],
         subscribed_trends = [] :: [non_neg_integer()],
         photo_auditing = 0 :: non_neg_integer(),
         photo_audited = 0 :: non_neg_integer(),
         present_num = 0 :: non_neg_integer(),
         name_used = "" :: string(),
         week_liked = 0 :: non_neg_integer(),
         last_liked = 0 :: non_neg_integer(),
         honor_id = 0 :: non_neg_integer(),
         lover_name = "" :: string(),
         theme = 401 :: non_neg_integer(),
         badges = [] :: list(),
         photo_frame = 0 :: non_neg_integer(),
         teacher_name = "" :: string(),
         own_trend_num = 0,
         city = "" :: string(),
         is_shared_region = 1 :: 0 | 1,
         sworn_name = "" :: string(),
         show_honor = 0 :: non_neg_integer(),
         pre_honor_id = 0 :: non_neg_integer(),
         privacy_zone = 0 :: 0 | 1,
         privacy_moments = 0 :: 0 | 1}).

-record(friend_trend,
        {ver = 0 :: non_neg_integer(),
         zone_id = {0, "", 0},
         rid = {0, "", 0},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         photo = 1 :: pos_integer(),
         id = 0 :: non_neg_integer(),
         type = 0 :: 0 | 1,
         content = "" :: string(),
         liked = 0 :: non_neg_integer(),
         likes = [],
         presents = [],
         ctime = 0 :: non_neg_integer()}).

-record(friend_visitor,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         photo = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer()}).

-record(friend_subscription,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         photo = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         cared = 0 :: non_neg_integer(),
         interacted = 0 :: non_neg_integer()}).

-record(friend_zone_rank,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         photo = 0 :: non_neg_integer(),
         liked = 0 :: non_neg_integer(),
         prize_num = 0 :: non_neg_integer()}).

-record(friend_zone_rank_week,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         photo = 0 :: non_neg_integer(),
         liked = 0 :: non_neg_integer(),
         last_liked = 0 :: non_neg_integer(),
         prize_num = 0 :: non_neg_integer()}).

-record(friend_like,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         got_prize = 0 :: 0 | 1,
         time = 0 :: non_neg_integer()}).

-record(friend_zone_photo,
        {id = 1,
         ver = 0,
         uploaded = 0,
         auditing = 0,
         audited = 0,
         default = 0}).

-record(friend_circle,
        {ver = 3 :: non_neg_integer(),
         id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         region = "" :: string(),
         city = "" :: string(),
         moments = [] :: list(),
         subscriptions = [] :: list(),
         block = [] :: list(),
         unsubscribed = [] :: list(),
         notifications = [] :: list(),
         is_shared_region = 1 :: 0 | 1,
         unread_num = 0 :: non_neg_integer(),
         privacy_moments = 0 :: 0 | 1}).

-record(friend_moment,
        {ver = 1 :: non_neg_integer(),
         id = {0, "", 0},
         rid = {0, "", 0},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         content = "" :: string(),
         liked = 0 :: non_neg_integer(),
         likes = [],
         mentions = [],
         ctime = 0 :: non_neg_integer(),
         type = 1}).

-record(friend_comment,
        {ver = 0 :: non_neg_integer(),
         id = {0, "", 0},
         moment_id = {0, "", 0},
         rid = {0, "", 0},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         msg = "" :: string(),
         mentions = [],
         ctime = 0 :: non_neg_integer()}).

-record(friend_moment_like,
        {ver = 0 :: non_neg_integer(),
         moment_id = {0, "", 0},
         rid = {0, "", 0},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         ctime = 0 :: non_neg_integer()}).

-record(friend_moment_photo,
        {id = 1,
         moment_id = {0, "", 0},
         rid = {0, "", 0},
         ver = 0,
         uploaded = 0,
         auditing = 1,
         audited = 0}).

-record(friend_circle_report,
        {id = {{0, "", 0}, 0, 0},
         rid = {0, "", 0},
         moment_id = {0, "", 0},
         spec_id = 0,
         type = 0,
         name = "",
         lev = 1,
         time = 0,
         content = "",
         reporter_id = {0, "", 0},
         reporter_name = "",
         reporter_lev = 0}).

-record(friend_circle_region,
        {ver = 0 :: non_neg_integer(),
         region = "" :: string(),
         city = "" :: string(),
         moments = [] :: list()}).

-record(friend_recall,
        {role_id = {0, "", 0},
         role_name = "",
         id = 0 :: non_neg_integer(),
         activity = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         role_id_bind = {0, "", 0},
         role_name_bind = "",
         lists = [] :: list(),
         rewards = [] :: list(),
         lists_time = [] :: list(),
         time_return = 0 :: non_neg_integer()}).

-record(friend_recalled,
        {role_id = {0, "", 0},
         status = 0 :: non_neg_integer(),
         bind = 0 :: non_neg_integer(),
         time_return = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         activity = 0 :: non_neg_integer(),
         rewards = [] :: list(),
         lists = [] :: list(),
         recall_list = [] :: list(),
         role_id_recall = {0, "", 0},
         role_name_recall = "" :: string(),
         login = 0 :: non_neg_integer(),
         activity_id = 0 :: non_neg_integer()}).

-record(friend_group,
        {ver = 0,
         id = {0, "", 0},
         name = "",
         content = "",
         owner_id = {0, "", 0},
         owner_name = "",
         owner_classes = 0,
         owner_sex = 0,
         owner_lev = 1,
         owner_fc = 0,
         owner_face = 1,
         time = 0,
         members = [],
         trends = [],
         historys = [],
         invites = []}).

-record(friend_group_role,
        {ver = 1,
         id = {0, "", 0},
         groups = [],
         inviteds = [],
         create = 0,
         join = 0,
         unlock = 0,
         applys = []}).

-record(friend_group_trend,
        {type = 0, string1 = "", string2 = "", time = 0}).

-record(friend_group_chat,
        {role_id = 0, msgs = "", time = 0}).

-record(friend_group_data,
        {group_id = {0, "", 0},
         group_name = "",
         group_content = "",
         owner_id = {0, "", 0},
         owner_name = "",
         owner_classes = 0,
         owner_sex = 0,
         time = 0}).

-record(friend_group_role_data,
        {role_id = {0, "", 0},
         role_name = "",
         role_classes = 0,
         role_lev = 0,
         role_sex = 0,
         online = 0,
         online_time = 0,
         post = 0,
         notice = 1,
         pid = undefined}).

-record(friend_moment_wish_audit,
        {ver = 1,
         moment_id = {0, "", 0},
         role_id = {0, "", 0},
         audit_time = 0,
         reward_title = 0,
         camp_id = 0}).

-file("src/mod/campaign/camp_whiteday.erl", 34).

-file("inc/trigger.hrl", 1).

-record(trigger,
        {id = 1 :: pos_integer(),
         label :: undefined | atom(),
         m :: undefined | atom(),
         f :: undefined | function() | atom(),
         a = [] :: list()}).

-record(evt_enter_map,
        {id = 1 :: pos_integer(),
         base_id = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(evt_ico, {id = 0 :: non_neg_integer()}).

-record(evt_close_guide, {id = 0 :: pos_integer()}).

-record(evt_guild, {}).

-record(evt_guild_leave, {val = 0}).

-record(evt_guild_war, {}).

-record(evt_battle_plot,
        {plot_id = 1 :: pos_integer(),
         role_id = {1, "", 0} ::
             {pos_integer(), bitstring(), non_neg_integer()},
         role_name = "" :: bitstring(),
         role_pid :: undefined | pid()}).

-record(evt_plot,
        {id = 1 :: pos_integer(), type = 1 :: pos_integer()}).

-record(evt_shop_buy,
        {assets_type = 0 :: non_neg_integer(),
         val = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         bind = 0 :: 0..1,
         num = 0 :: non_neg_integer()}).

-record(evt_store_buy, {s_items = []}).

-record(evt_enchant,
        {base_id = 1 :: pos_integer(),
         pre_lev = 1 :: pos_integer(),
         lev = 1 :: pos_integer(),
         type = 0 :: non_neg_integer(),
         pos = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer()}).

-record(evt_select, {type = 0 :: non_neg_integer()}).

-record(evt_guild_lev, {}).

-record(evt_skill_up, {id = 0, lev = 0}).

-record(evt_skill_unique_up, {id = 0, lev = 0}).

-record(evt_quest_treasure, {}).

-record(evt_fc,
        {val :: undefined | pos_integer(),
         now_val = 0 :: non_neg_integer()}).

-record(evt_wedding_score, {}).

-record(evt_wedding_req_agreed, {}).

-record(evt_wedding_marry, {}).

-record(evt_wedding_divorce, {}).

-record(evt_guard, {base_id = 0, num = 0}).

-record(evt_leave_map,
        {id = 1 :: pos_integer(),
         base_id = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(evt_move_map,
        {base_id = 1 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(evt_dungeon_enter,
        {id = 0 :: non_neg_integer()}).

-record(evt_dungeon_exit,
        {id = 0 :: non_neg_integer()}).

-record(evt_dungeon_pass,
        {id = 0 :: non_neg_integer()}).

-record(evt_dungeon_kill_unit,
        {dun_id = 0, unit_id = 0}).

-record(evt_dungeon_unit_reward,
        {id = 0 :: non_neg_integer()}).

-record(evt_get_item,
        {base_id = 1 :: pos_integer(),
         num = 1 :: pos_integer()}).

-record(evt_use_item,
        {base_id :: undefined | pos_integer(),
         num = 0 :: pos_integer()}).

-record(evt_use_item_type,
        {type = 0 :: non_neg_integer()}).

-record(evt_del_item,
        {base_id :: undefined | pos_integer(),
         num = 0 :: pos_integer()}).

-record(evt_gain_coin,
        {val = 1 :: pos_integer(),
         source :: undefined | atom()}).

-record(evt_have_coin, {val = 1 :: pos_integer()}).

-record(evt_loss_coin,
        {val = 1 :: pos_integer(),
         reason :: undefined | atom()}).

-record(evt_gain_gold,
        {val = 1 :: pos_integer(),
         source :: undefined | atom()}).

-record(evt_loss_gold,
        {val = 1 :: pos_integer(),
         reason :: undefined | atom()}).

-record(evt_loss_gold_bind, {val = 1 :: pos_integer()}).

-record(evt_levup,
        {old_lev = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer()}).

-record(evt_logout, {}).

-record(evt_tower, {floor = 0, unit_id = 0}).

-record(evt_tower_floor, {floor = 0}).

-record(evt_glory, {lev_id = 0}).

-record(evt_reset_eqm, {type = 0}).

-record(evt_cli_loaded, {mod = 0 :: non_neg_integer()}).

-record(evt_eqm, {type = 0}).

-record(evt_pet_war, {base_id = 0}).

-record(evt_pet_skill, {base_id = 0}).

-record(evt_pet_rest, {base_id = 0}).

-record(evt_select_pet, {}).

-record(evt_get_pet,
        {base_id = 0,
         genre = 0,
         lev = 0,
         status = 0,
         is_catched = false,
         talent = 0}).

-record(evt_del_pet, {base_id = 0, num = 0}).

-record(evt_levup_pet,
        {pet_id = 0, base_id = 0, lev = 0}).

-record(evt_aptitude_pet, {base_id = 0, genre = 0}).

-record(evt_pick_flower, {id}).

-record(evt_send_flower,
        {num = 0, val = 0, base_id = 0, recv_id, items = []}).

-record(evt_recv_flower, {num = 0, val = 0, send_id}).

-record(evt_accept_quest, {id = 0 :: pos_integer()}).

-record(evt_commit_quest,
        {id = 0 :: pos_integer(), sec_type = 0}).

-record(evt_finish_quest, {id = 0 :: pos_integer()}).

-record(evt_quest_guild_round, {}).

-record(evt_commit_quest_chain,
        {id = 0 :: pos_integer(), type = 0}).

-record(evt_giveup_quest, {id = 0 :: pos_integer()}).

-record(evt_quest_del, {id = 0 :: pos_integer()}).

-record(evt_map_role_enter,
        {id = 0 :: non_neg_integer(),
         platform = <<>> :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         map_id = 1 :: pos_integer(),
         map_base_id = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(evt_map_role_move,
        {role_id = {0, "", 0},
         role_pid = 0 :: non_neg_integer() | pid(),
         map_id = 1 :: pos_integer(),
         map_base_id = 1 :: pos_integer(),
         sx = 0 :: non_neg_integer(),
         sy = 0 :: non_neg_integer(),
         dx = 0 :: non_neg_integer(),
         dy = 0 :: non_neg_integer(),
         event = 0 :: non_neg_integer()}).

-record(evt_map_role_leave,
        {role_pid = 0 :: non_neg_integer() | pid(),
         map_id = 1 :: pos_integer(),
         map_base_id = 1 :: pos_integer()}).

-record(evt_combat_round,
        {round :: undefined | pos_integer(),
         self = [] :: [tuple()],
         opp = [] :: [tuple()]}).

-record(evt_combat_init,
        {self = [] :: [tuple()], opp = [] :: [tuple()]}).

-record(evt_kill_npc,
        {id = 0 :: non_neg_integer(),
         base_id = 1 :: pos_integer(),
         origin_id = {1, 1} :: tuple(),
         ratio_val = 0,
         num = 1 :: pos_integer()}).

-record(evt_kill_npc_lose,
        {id = 0 :: non_neg_integer(),
         base_id = 1 :: pos_integer(),
         num = 1 :: pos_integer()}).

-record(evt_kill_role_clone,
        {id = {0, "robot", 0}, ratio_val = 0}).

-record(evt_fight_unit,
        {id = 0 :: non_neg_integer(),
         base_id = 1 :: pos_integer(),
         num = 1 :: pos_integer()}).

-record(evt_mount_combat,
        {combat_type = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer()}).

-record(evt_unit_click,
        {id = 0 :: non_neg_integer(),
         role_id = {0, "", 0},
         name = "",
         pid,
         type = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         do_type = -1 :: integer()}).

-record(evt_online_time, {acc_time = 0, add_val = 0}).

-record(evt_battle_role_enter,
        {id = 0 :: non_neg_integer(),
         platform = "" :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid(),
         name = "" :: bitstring(),
         dun_id = 0 :: non_neg_integer(),
         last_pos = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         enter_pos = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         dun_role :: undefined | tuple()}).

-record(evt_battle_enter_map,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         name = "" :: bitstring(),
         pid :: undefined | pid(),
         map_base_id = 0 :: non_neg_integer()}).

-record(evt_battle_role_login,
        {id = 0 :: non_neg_integer(),
         platform = "" :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid(),
         name = "" :: bitstring(),
         last_pos = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         enter_pos = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()}}).

-record(evt_battle_role_exit,
        {id = 0 :: non_neg_integer(),
         platform = "" :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: bitstring()}).

-record(evt_battle_role_logout,
        {id = 0 :: non_neg_integer(),
         platform = "" :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         ext_id = 0 :: non_neg_integer()}).

-record(evt_battle_unit_killed,
        {unit_id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         role_list = [] ::
             [{role_id(), list(), undefined | pid()}]}).

-record(evt_battle_unit_picked,
        {unit_id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 1 :: pos_integer(),
         type = 102 :: pos_integer(),
         action_type = 1 :: pos_integer(),
         map_base_id = 1,
         x = 1,
         y = 1,
         role_id = {1, "", 0},
         role_name = "",
         role_pid}).

-record(evt_battle_unit_die,
        {unit_id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 1 :: pos_integer(),
         type = 1 :: pos_integer()}).

-record(evt_create_unit,
        {unit_id = {1, 1}, base_id = 1, type = 1}).

-record(evt_team_join, {pid :: undefined | pid()}).

-record(evt_team_leave, {}).

-record(evt_team_away, {}).

-record(evt_team_follow, {}).

-record(evt_team_appoint, {status, leader_id}).

-record(evt_arena_fight, {}).

-record(evt_arena_win, {cup = 0}).

-record(evt_trial, {mode = 0}).

-record(evt_escort, {}).

-record(evt_friend, {num = 0}).

-record(evt_fairyland, {}).

-record(evt_fairyland_floor,
        {floor = 0, is_leader = 0}).

-record(evt_fairyland_box, {box_punish = 0}).

-record(evt_pet, {}).

-record(evt_pet_lev, {old_lev = 0, lev = 0}).

-record(evt_quest_offer_ring, {ring = 0, old_ring = 0}).

-record(evt_quest_offer_reward, {}).

-record(evt_qualifying_combat, {type = 0}).

-record(evt_qualifying_combat_over,
        {type = 0, win_flag = 0}).

-record(evt_guild_answer, {}).

-record(evt_parade, {}).

-record(evt_market_silver_first_on_sale, {}).

-record(evt_market_gold_bind_buy,
        {base_id = 0,
         num = 0,
         init_price = 0,
         price = 0,
         margin = 0}).

-record(evt_market_gold_bind_sold,
        {base_id = 0, price = 0}).

-record(evt_kill_guild_robber, {}).

-record(evt_shipping_sail, {type = 0}).

-record(evt_shipping_commit, {type = 0, pack_type = 0}).

-record(evt_shipping_help, {}).

-record(evt_treasure, {base_id = 0}).

-record(evt_treasure_compass, {}).

-record(evt_guild_propagate, {}).

-record(evt_pay, {sn = "", gold = 0, source = 0}).

-record(evt_kill_treasure_ghost, {}).

-record(evt_pray, {}).

-record(evt_skill_prac_levup, {id = 0, lev = 0}).

-record(evt_skill_life_levup, {id = 0, lev = 0}).

-record(evt_skill_life_produce,
        {id = 0, base_id = 0, num = 0}).

-record(evt_blacksmith_embed, {num = 0}).

-record(evt_blacksmith_embed_lev, {lev = 0}).

-record(evt_blacksmith_enchant,
        {base_id = 0,
         is_succ = 0,
         luck_list = 0,
         is_protect = 0,
         all_lev = 0,
         pre_all_lev = 0,
         sum_lev = 0,
         pre_sum_lev = 0}).

-record(evt_guild_plant_mature, {}).

-record(evt_examination, {type = 1 :: 1..3}).

-record(evt_question_match, {score = 0}).

-record(evt_question_match_answer, {is_right = 0}).

-record(evt_question_match_mvp, {}).

-record(evt_question_match_last_right, {count = 0}).

-record(evt_warrior_fight, {win_flag = 0}).

-record(evt_warrior_reward, {win_flag = 0, score = 0}).

-record(evt_warrior, {}).

-record(evt_gold_league_fight, {win_flag = 0}).

-record(evt_gold_league_reward,
        {win_flag = 0, score = 0}).

-record(evt_gold_league, {}).

-record(evt_achievement, {id = 0}).

-record(evt_gain_achieve, {val = 0}).

-record(evt_gain_gold_bind,
        {val = 1 :: pos_integer(),
         source :: undefined | atom()}).

-record(evt_have_gold_bind, {val = 1 :: pos_integer()}).

-record(evt_wing,
        {grade = 1 :: pos_integer(),
         growth = 1 :: pos_integer(),
         star = 0}).

-record(evt_wing_reset, {}).

-record(evt_wing_skill, {count = 0}).

-record(evt_wing_lev,
        {grade = 1 :: pos_integer(), star_lev = 0}).

-record(evt_fuse, {base_id = 0 :: non_neg_integer()}).

-record(evt_guild_post,
        {post = 0 :: non_neg_integer()}).

-record(evt_examination_answer,
        {is_right = 1 :: 1 | 2}).

-record(evt_pet_use_item, {base_id = 0}).

-record(evt_pet_repleace_skill, {}).

-record(evt_activity, {val = 0}).

-record(evt_pet_rename, {}).

-record(evt_pet_free, {}).

-record(evt_pet_stone_upgrade, {grade = 0}).

-record(evt_guard_upgrade_eqm, {}).

-record(evt_guard_reset_eqm, {}).

-record(evt_guard_embed_gem, {}).

-record(evt_friend_intimacy, {val = 0}).

-record(evt_friend_intimacy_camp,
        {val = 0, target_id = {0, "", 0}}).

-record(evt_friend_zone_photo, {}).

-record(evt_friend_zone_like, {val = 0}).

-record(evt_friend_zone_liked, {val = 0}).

-record(evt_friend_zone_like_baby, {val = 0}).

-record(evt_friend_zone_leave_trend, {}).

-record(evt_friend_zone_leave_trended, {val = 0}).

-record(evt_formation_lev, {id = 0, lev = 0}).

-record(evt_alchemy_produce, {item_list = []}).

-record(evt_alchemy_melt, {item_list = []}).

-record(evt_classes_challenge_order, {order = 0}).

-record(evt_classes_challenge_rank, {rank = 0}).

-record(evt_classes_challenge_up_rank, {rank = 0}).

-record(evt_market_silver_assets,
        {assets = coin, val = 0}).

-record(evt_market_silver_sold,
        {assets = [], sold_items = []}).

-record(evt_market_silver_buy, {num = 0}).

-record(evt_combat_statistics,
        {revive = 0,
         pet_revive = 0,
         cast_pet = 0,
         use_item = 0,
         is_win = 0,
         is_die = 0,
         guard = [],
         kill_group = 0,
         killed_group = 0,
         kill_group_pet = 0,
         kill_group_target = 0,
         killed_group_target = 0,
         kill_group_target_pet = 0}).

-record(evt_honor, {id = 0}).

-record(evt_pre_honor, {pre_id = 0}).

-record(evt_fashion, {}).

-record(evt_gain_character, {val = 1 :: pos_integer()}).

-record(evt_campaign_unit_match, {val = 0}).

-record(evt_campaign_unit_heap2, {val = 0}).

-record(evt_campaign_unit_match_boss, {val = 0}).

-record(evt_campaign_unit_card, {val = 0}).

-record(evt_campaign_unit_card_boss, {val = 0}).

-record(evt_campaign_unit_order, {val = 0}).

-record(evt_campaign_unit_order_boss, {val = 0}).

-record(evt_campaign_unit_steal, {val = 0}).

-record(evt_campaign_unit_kill, {val = 0}).

-record(evt_campaign_unit_base, {val = 0}).

-record(evt_campaign_unit_kill_boss, {val = 0}).

-record(evt_campaign_unit_fox, {val = 0}).

-record(evt_qualifying, {}).

-record(evt_gain_guild, {val = 1 :: pos_integer()}).

-record(evt_guard_score,
        {val = 0 :: non_neg_integer()}).

-record(evt_constellation,
        {lev = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer()}).

-record(evt_constellation_score,
        {lev = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer()}).

-record(evt_roll,
        {point = 0 :: non_neg_integer(),
         reward = 0 :: non_neg_integer()}).

-record(evt_finish_marriage_question, {}).

-record(evt_commit_marriage_question, {}).

-record(evt_marriage_flower, {}).

-record(evt_finish_couple_question, {}).

-record(evt_finish_couple_task, {}).

-record(evt_commit_couple_question, {}).

-record(evt_couple_flower, {}).

-record(evt_cultivate_plant, {}).

-record(evt_guild_plant_irrigate, {}).

-record(evt_teacher_score_sum, {score = 0}).

-record(evt_teacher_student, {num = 0}).

-record(evt_finish_ask_question, {fun_type = 0}).

-record(evt_teacher_to_sudent, {id = {0, "", 0}}).

-record(evt_teacher, {num = 0}).

-record(evt_commit_ask_question, {}).

-record(evt_get_pet_item_skill_guide, {}).

-record(evt_brave_trial_order, {order = 0}).

-record(evt_shipping_dun, {flag = 0}).

-record(evt_consume, {gold = 0, source = 0}).

-record(evt_guild_hero, {}).

-record(evt_hero, {}).

-record(evt_lover_combat, {win_flag = 0}).

-record(evt_wedding_treasure, {base_id = 0}).

-record(evt_constellation_first, {base_id = 0}).

-record(evt_boss_first, {base_id = 0}).

-record(evt_quest_prac_help, {}).

-record(evt_arena_win_rate, {classes = 0, rate = 0}).

-record(evt_wedding_guest, {}).

-record(evt_dragon_boat, {camp_id = 0}).

-record(evt_dragon_boat_rank, {camp_id = 0, rank = 0}).

-record(evt_dragon_boat_cplt,
        {camp_id = 0, time_span = 0}).

-record(evt_mount_dye_diff, {dye_id = 0, val = 0}).

-record(evt_arena_cup, {cup = 0}).

-record(evt_arena_cup_target, {id = 0}).

-record(evt_arena_roll, {flag = 0, num = 0}).

-record(evt_achi_num, {id = 0, num = 0}).

-record(evt_dun_first, {id = 0, floor = 0}).

-record(evt_tournament_combat, {type = 0}).

-record(evt_comprehend_eqm, {}).

-record(evt_elf_combat, {}).

-record(evt_finish_goal, {id = 0}).

-record(evt_hide_seek, {}).

-record(evt_hide_seek_help, {}).

-record(evt_hide_seek_reward, {}).

-record(evt_camp_fruit, {base_id = 0, num = 0}).

-record(evt_camp_fruit_help, {base_id = 0, num = 0}).

-record(evt_camp_fruit_reward, {}).

-record(evt_tournament,
        {awesome_kill = 0,
         awesome_kill_num = 0,
         awesome_dmg = 0,
         awesome_heal = 0,
         awesome_control = 0,
         mvp = 0,
         rank_lev = 0,
         liked = 0 :: non_neg_integer(),
         best_win_count = 0 :: non_neg_integer()}).

-record(evt_tournament_point,
        {rank_lev = 0, rank_point = 0}).

-record(evt_friend_circle,
        {photos = 0, mentions = 0, day_num = 0}).

-record(evt_friend_circle_liked, {num = 0, other = 0}).

-record(evt_friend_circle_like, {self = 0}).

-record(evt_friend_circle_commented,
        {num = 0, other = 0}).

-record(evt_friend_circle_comment, {self = 0}).

-record(evt_family_update, {type = 0, lev = 0}).

-record(evt_family, {lev = 0}).

-record(evt_family_env, {env = 0}).

-record(evt_family_self_magic_beans, {}).

-record(evt_family_help_magic_beans, {}).

-record(evt_family_furnishing, {type = 0, count = 0}).

-record(evt_own_mount, {status = 0, count = 0}).

-record(evt_mount_growth, {growth = 0}).

-record(evt_mount_appearand, {count = 0}).

-record(evt_mount_mange_pet, {}).

-record(evt_mount_lev, {lev = 0}).

-record(evt_mount_attr, {}).

-record(evt_everyday, {val = 0}).

-record(evt_campaign_reward,
        {type = 0, sec_type = 0, id = 0}).

-record(evt_wedding_day, {day = 0}).

-record(evt_lev_break, {}).

-record(evt_enjoy_moon, {}).

-record(evt_enjoy_moon_wish, {type = 1}).

-record(evt_join_glue_pudding, {}).

-record(evt_glue_pudding_answer, {result = 0}).

-record(evt_glue_pudding_win, {}).

-record(evt_join_kongming_lanterns, {camp_id = 0}).

-record(evt_kongming_lanterns_answer,
        {camp_id = 0, result = 0}).

-record(evt_kongming_lanterns_win, {camp_id = 0}).

-record(evt_join_mid_pudding, {}).

-record(evt_mid_pudding_answer, {result = 0}).

-record(evt_mid_pudding_win, {}).

-record(evt_mid_pudding_agenda, {}).

-record(evt_guild_dragon, {}).

-record(evt_lev_break_active, {}).

-record(evt_camp_cake_finish, {}).

-record(evt_camp_cake_exit, {}).

-record(evt_camp_cake_sub, {}).

-record(evt_national_wisdom, {}).

-record(evt_national_wisdom_right, {}).

-record(evt_national_wisdom_luckyer, {}).

-record(evt_campaign_bag_fill, {}).

-record(evt_rainbow_lottery_day, {}).

-record(evt_campaign_bag_reward, {}).

-record(evt_lev_break_exch, {val = 0}).

-record(evt_classes_modify_times, {times = 0}).

-record(evt_use_fruit_limit, {base_id = 0, lev = 0}).

-record(endless_challenge_cross, {wave = 0}).

-record(endless_challenge_card, {}).

-record(evt_camp_halloween, {}).

-record(evt_camp_halloween_rank, {win = 0, rank = 0}).

-record(evt_camp_halloween_first, {}).

-record(evt_sworn_finish, {times = 0}).

-record(evt_sworn_invite, {times = 0}).

-record(evt_sworn_defined_name, {times = 0}).

-record(evt_sworn_name, {times = 0}).

-record(evt_sworn_skill, {times = 0}).

-record(evt_other, {}).

-record(evt_guild_league_join, {}).

-record(evt_guild_league_cannon, {}).

-record(evt_guild_league_win, {}).

-record(evt_campaign_snow, {val = 0}).

-record(evt_child_info,
        {growth_type = 0, skills = [], talent_skills = []}).

-record(evt_child_eat, {base_id = 0, num = 0}).

-record(evt_child_study,
        {study_str = 0,
         study_con = 0,
         study_mag = 0,
         study_agi = 0,
         study_end = 0}).

-record(evt_go_to_bed, {}).

-record(evt_child_combat,
        {combat_type = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer()}).

-record(evt_child_deliver, {}).

-record(evt_child_grow, {stage}).

-record(evt_fashion_collect_lev, {lev = 0}).

-record(evt_maze, {times = 0}).

-record(evt_maze_sweep, {}).

-record(evt_maze_monster, {}).

-record(evt_maze_gold, {gold = 0}).

-record(evt_maze_monkey, {}).

-record(evt_maze_cat, {}).

-record(evt_may_day_bags, {}).

-record(evt_may_day_help, {}).

-record(evt_may_day_clean, {camp_id = 0}).

-record(evt_rencounter, {is_win = 0}).

-record(evt_rencounter_star,
        {rank_lev = 1, star = 0, total_star = 0}).

-record(evt_guild_siege_combat, {is_win = 0, star = 1}).

-record(evt_guild_dungeon, {}).

-record(evt_guild_pray, {}).

-record(evt_talisman, {type = 0, id = 0}).

-record(evt_camp_whiteday, {type = 0}).

-record(evt_camp_animal_chess, {}).

-record(evt_animal_chess_win, {}).

-record(evt_animal_chess_soldier, {}).

-record(evt_animal_chess_fail, {}).

-record(evt_animal_chess_coach_killed, {}).

-record(evt_animal_chess_kill_coach, {}).

-record(evt_animal_chess_kill_soldier, {}).

-record(evt_pet_add_point, {pet_id = 0, base_id = 0}).

-record(evt_combat_over,
        {combat_type = 0, win_flag = win}).

-record(evt_goodvoice, {}).

-record(evt_spirit_treasure_general, {}).

-record(evt_spirit_treasure_boss, {}).

-record(evt_spirit_treasure_offer_star, {star = 0}).

-record(evt_spirit_treasure_first_kill, {}).

-record(evt_spirit_treasure_boss_wave, {wave = 0}).

-record(evt_oracle_treasure_general, {}).

-record(evt_oracle_treasure_boss, {}).

-record(evt_oracle_treasure_offer_star, {star = 0}).

-record(evt_oracle_treasure_first_kill, {}).

-record(evt_oracle_treasure_boss_wave, {wave = 0}).

-record(evt_oracle_treasure_boss_times, {times = 0}).

-record(evt_camp_7_7th_point, {val = 0}).

-record(evt_chat_guild, {}).

-record(evt_guard_activate, {}).

-record(evt_exquisite_shelf_wave, {wave = 0}).

-record(evt_chat, {channel = undefined, content = ""}).

-record(evt_combat_wing_power, {val = 0}).

-record(evt_combat_sq_point,
        {combat_type = 0,
         is_win = lose,
         val = 0,
         unit_lev = 0}).

-record(evt_guild_dragon_times, {times = 0}).

-record(evt_guild_dragon_rank, {rank = 0}).

-record(evt_guild_dragon_total_point, {point = 0}).

-record(evt_exquisite_shelf_help, {}).

-record(evt_rushing_top_final_times, {final_times = 0}).

-record(g_evt_lev, {val = 0}).

-record(g_evt_member, {val = 0}).

-record(evt_expression, {}).

-record(evt_fuse_expression, {cost_item_id = 0}).

-record(evt_kingbadge,
        {base_id = 0 :: non_neg_integer()}).

-record(evt_sprog_mount, {}).

-record(evt_gods_duel_score, {score = 0}).

-record(evt_provocation_times, {}).

-record(evt_provocation_5v5, {}).

-record(evt_quest_offer_teacher, {}).

-record(evt_boss_teacher, {}).

-record(evt_constellation_kill, {}).

-record(evt_tower_teacher, {}).

-record(evt_gain_experience, {val = 0}).

-record(evt_provocation_use_horn, {}).

-record(evt_provocation_duel_win, {}).

-record(evt_provocation_duel_5v5_win, {}).

-record(evt_stars_trial,
        {base_id = 0,
         round = 99,
         use_item_num = 50,
         self_die_times = 0,
         pet_summon = 0,
         combat_formation = 0}).

-record(evt_stars_trial_combat_round, {dies = []}).

-record(evt_stars_trial_combat,
        {npc_dies = 0,
         after_die_done = 0,
         skill_use_times = []}).

-record(evt_camp_black_white_chess, {}).

-record(evt_black_white_chess_change_in_round,
        {change_num = 0}).

-record(evt_black_white_chess_win, {}).

-record(evt_black_white_chess_lose, {}).

-record(evt_black_white_chess_more_than_ops_chess,
        {num = 0}).

-record(evt_black_white_chess_draw_whitout_ask_draw,
        {}).

-record(evt_black_white_chess_win_remain_one_color, {}).

-record(evt_black_white_chess_lose_remain_one_color,
        {}).

-record(evt_canyon_summit_join, {}).

-record(evt_canyon_summit_cannon, {}).

-record(evt_canyon_summit_win, {}).

-record(evt_star_moon, {}).

-record(evt_truth_dare_join, {}).

-record(evt_truth_dare_lucky, {}).

-record(evt_truth_dare_lucky_choose, {type = 0}).

-record(evt_truth_dare_end, {type = 0}).

-record(evt_truth_dare_two_fail, {}).

-record(evt_truth_dare_one_shot, {}).

-record(evt_general_send_flower, {items = []}).

-file("src/mod/campaign/camp_whiteday.erl", 35).

-file("inc/log.hrl", 1).

-file("src/mod/campaign/camp_whiteday.erl", 36).

push(Role) ->
    WishTimes = var:get_var(Role, day, 99, 0),
    VotiveTimes = var:get_var(Role, day, 100, 0),
    GetTimes = var:get_var(Role, day, 98, 0),
    GetVotiveTimes = var:get_var(Role, day, 107, 0),
    role:link_send(Role,
                   17828,
                   {WishTimes, VotiveTimes, GetTimes, GetVotiveTimes}),
    ok.

push(Role, CampWhiteday) ->
    logger:debug("============= ~w",
                 [CampWhiteday],
                 camp_whiteday,
                 72),
    {_, Time} = var:get_var(Role, day, 108, {0, 0}),
    role:link_send(Role, 17830, {Time, CampWhiteday}),
    ok.

wish(Role = #role{id = RoleId, name = RoleName,
                  classes = RoleClasses, lev = RoleLev, sex = RoleSex},
     Wish, Type)
    when Type >= 1 andalso Type =< 9 ->
    WishTimes = var:get_var(Role, day, 99, 0),
    case WishTimes < 1 of
        true ->
            Loss = [],
            case role_gain:do_notice(Loss, Role) of
                {ok, Role1} ->
                    case call({wish,
                               #{role_id => RoleId, role_name => RoleName,
                                 role_sex => RoleSex,
                                 role_classes => RoleClasses,
                                 role_lev => RoleLev, type => Type,
                                 wish => Wish}})
                        of
                        ok ->
                            NewRole = var:set_var(Role1,
                                                  day,
                                                  99,
                                                  WishTimes + 1),
                            push(NewRole),
                            log:mod(NewRole,
                                    camp_whiteday,
                                    lang:get("白色情人节许愿"),
                                    util:flist("许愿类型:~w", [Type])),
                            {ok,
                             role_trigger:fire(#evt_camp_whiteday{type = 0},
                                               NewRole)};
                        {false, Reason} -> {false, Reason};
                        _ -> {false, lang:get("系统繁忙")}
                    end;
                {false, #loss{msg = Msg}} -> {false, Msg}
            end;
        _ -> {false, lang:get("次数不足")}
    end;
wish(_, _Wish, _Type) ->
    logger:info("错误的数据 ~w ~w",
                [_Wish, _Type],
                camp_whiteday,
                104),
    {false, lang:get("数据错误")}.

look(Role = #role{id = RoleId,
                  p_bag = #package{items = _Items}},
     Id) ->
    case fetch(RoleId) of
        {ok, CampWhiteday} ->
            push(Role, CampWhiteday),
            {ok, Role};
        _ ->
            ExpireTime = date:unixtime() + 1800,
            case call({look,
                       #{role_id => RoleId, time => ExpireTime}})
                of
                {ok, CampWhiteday} ->
                    NewRole = var:set_var(Role, day, 108, {Id, ExpireTime}),
                    push(NewRole, CampWhiteday),
                    {ok, NewRole};
                {false, Reason} -> {false, Reason};
                _ -> {false, lang:get("系统繁忙")}
            end
    end.

votive(Role = #role{id = RoleId, lev = Lev,
                    name = RoleName, sex = _Sex},
       Type) ->
    WishTimes = var:get_var(Role, day, 99, 0),
    case wedding_data:get_whiteday_votive(Type) of
        _ when WishTimes == 0 ->
            {false, lang:get("今天没有许愿，先去许个愿望吧")};
        #{cost := AssetsList, reward := Reward,
          rand_reward := RandReward, mode := Mode} ->
            {_Id, _Time} = var:get_var(Role, day, 108, {0, 0}),
            VotiveTimes = var:get_var(Role, day, 100, 0),
            Loss = format:val_to_loss(AssetsList),
            ItemLoss = [],
            AddRand = case util:rand_list(RandReward, 4) of
                          {RItemId, RBind, RNum, _} -> [{RItemId, RBind, RNum}];
                          _ -> []
                      end,
            AddExp = case levup_data:get_exp({Mode, Lev}) of
                         #{exp := ExpVal, pet_exp := PetExpVal} ->
                             [{90010, 0, ExpVal}, {90005, 0, PetExpVal}];
                         _ -> []
                     end,
            Gain = format:val_to_gain(Reward ++ AddRand ++ AddExp),
            logger:debug("情人节 还愿 ~w",
                         [{AssetsList, VotiveTimes}],
                         camp_whiteday,
                         158),
            case VotiveTimes < 2 of
                true ->
                    case role_gain:do_notice(Loss ++ ItemLoss ++ Gain, Role)
                        of
                        {ok, Role1} ->
                            case call({votive,
                                       #{role_id => RoleId, cost_type => Type,
                                         role_name => RoleName}})
                                of
                                {ok, _CampWhiteday} ->
                                    Msg = case Type of
                                              1 ->
                                                  lang:get("对方已经收到了你的礼物，绯月女神将见证你们这段情谊！");
                                              _ ->
                                                  lang:get("对方已经收到了你的礼物，绯月女神将见证你们这段情谊！")
                                          end,
                                    NewRole = var:set_var(Role1,
                                                          day,
                                                          100,
                                                          VotiveTimes + 1),
                                    push(NewRole),
                                    {ok,
                                     role_trigger:fire(#evt_camp_whiteday{type =
                                                                              1},
                                                       NewRole),
                                     Msg};
                                {false, Reason} -> {false, Reason};
                                _R ->
                                    logger:debug("白色情人节错误 ~w",
                                                 [_R],
                                                 camp_whiteday,
                                                 175),
                                    {false, lang:get("系统繁忙")}
                            end;
                        {false, #loss{msg = Msg}} -> {false, Msg};
                        {false, #gain{msg = Msg}} -> {false, Msg}
                    end;
                _ -> {false, lang:get("次数不足")}
            end;
        _ -> {false, lang:get("类型错误,无法还愿")}
    end.

get(Role) ->
    GetTimes = var:get_var(Role, day, 98, 0),
    case GetTimes < 1 of
        true ->
            Gain = format:val_to_gain([{24019, 1}]),
            case role_gain:do_notice(Gain, Role) of
                {ok, Role1} ->
                    NewRole = var:set_var(Role1, day, 98, GetTimes + 1),
                    push(NewRole),
                    {ok, NewRole};
                {false, #gain{msg = Msg}} -> {false, Msg}
            end;
        _ -> {false, lang:get("没有可领取次数")}
    end.

get_votive(Role = #role{id = RoleId}) ->
    case fetch(RoleId) of
        {ok, _CampWhiteday} -> {false, lang:get("不能领取")};
        _ ->
            GetTimes = var:get_var(Role, day, 107, 0),
            case GetTimes < 2 of
                true ->
                    ExpireTime = date:unixtime(zero) + 86400,
                    case call({look,
                               #{role_id => RoleId, time => ExpireTime}})
                        of
                        {ok, _CampWhiteday} ->
                            Role2 = var:set_var(Role,
                                                day,
                                                108,
                                                {1, ExpireTime}),
                            NewRole = var:set_var(Role2,
                                                  day,
                                                  107,
                                                  GetTimes + 1),
                            push(NewRole),
                            {ok, NewRole};
                        {false, Reason} -> {false, Reason};
                        _ -> {false, lang:get("系统繁忙")}
                    end;
                _ -> {false, lang:get("没有可领取次数")}
            end
    end.

info(Info) -> camp_whiteday ! Info.

cast(Info) -> gen_server:cast(camp_whiteday, Info).

call(Info) ->
    case catch gen_server:call(camp_whiteday, Info, 10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

start_link() ->
    gen_server:start_link({local, camp_whiteday},
                          camp_whiteday,
                          [],
                          []).

init([]) ->
    logger:info("[~w] 正在启动...",
                [camp_whiteday],
                camp_whiteday,
                248),
    process_flag(trap_exit, true),
    ets:new(camp_whiteday,
            [set,
             named_table,
             public,
             {keypos, #camp_whiteday.id}]),
    dets:open_file(camp_whiteday,
                   [{file, "./dets/camp_whiteday.dets"},
                    {keypos, #camp_whiteday.id},
                    {type, set}]),
    dets:to_ets(camp_whiteday, camp_whiteday),
    erlang:send_after(date:next_diff(0, 0, 0) * 1000 + 100,
                      self(),
                      zero),
    State = #state{},
    logger:info("[~w] 启动完成",
                [camp_whiteday],
                camp_whiteday,
                256),
    {ok, State}.

handle_call({wish,
             #{role_id := RoleId, role_name := RoleName,
               role_sex := RoleSex, role_classes := RoleClasses,
               role_lev := RoleLev, type := Type, wish := Wish}},
            _From, State) ->
    Id = get_id(),
    CampWhiteday = #camp_whiteday{id = Id, role_id = RoleId,
                                  name = RoleName, sex = RoleSex,
                                  classes = RoleClasses, lev = RoleLev,
                                  wish = Wish, type = Type},
    save(CampWhiteday),
    big_world:cast(c_camp_whiteday,
                   cast,
                   [{add_id, Id, RoleId}]),
    {reply, ok, State};
handle_call({look,
             Args = #{role_id := RoleId, time := Time}},
            _From, State) ->
    MatchSpec = [{#camp_whiteday{owner = {0, "", 0},
                                 flag = 0, role_id = '$3', _ = '_'},
                  [{'=/=', {const, RoleId}, '$3'}],
                  ['$_']}],
    IsLocal = role_misc:is_local_role(RoleId),
    Reply = case ets:select(camp_whiteday, MatchSpec) of
                [_ | _] = List ->
                    FriendList = friend:list(RoleId),
                    CampWhiteday = get_close_one(List, FriendList),
                    NewCampWhiteday = CampWhiteday#camp_whiteday{owner =
                                                                     RoleId,
                                                                 timeout =
                                                                     Time},
                    save(NewCampWhiteday),
                    info(deal_timeout),
                    big_world:cast(c_camp_whiteday,
                                   cast,
                                   [{del_id, CampWhiteday#camp_whiteday.id}]),
                    {ok, NewCampWhiteday};
                _ when IsLocal == true ->
                    {false, lang:get("当前愿望都被完成了，请稍候再来看看吧{face_1,3}")};
                [] ->
                    case big_world:call(c_camp_whiteday,
                                        call,
                                        [{get_data, Args}])
                        of
                        {ok, CampWhiteday} ->
                            info(deal_timeout),
                            save(CampWhiteday),
                            {ok, CampWhiteday};
                        {false, Reason} -> {false, Reason};
                        {error, big_world_not_ready} ->
                            {false, lang:get("当前愿望都被完成了，请稍候再来看看吧{face_1,3}")};
                        _R ->
                            logger:debug("ddddddddddddddd ~w",
                                         [_R],
                                         camp_whiteday,
                                         299),
                            {false, lang:get("系统繁忙,请稍后重试1")}
                    end;
                _ -> {false, lang:get("当前愿望都被完成了，请稍候再来看看吧{face_1,3}")}
            end,
    {reply, Reply, State};
handle_call({check_wish, RoleId}, _From, State) ->
    MatchSpec = [{#camp_whiteday{owner = {0, "", 0},
                                 flag = 0, role_id = '$3', _ = '_'},
                  [{'=/=', {const, RoleId}, '$3'}],
                  ['$_']}],
    Reply = case ets:select(camp_whiteday, MatchSpec) of
                [_ | _] -> ok;
                [] ->
                    case big_world:call(c_camp_whiteday,
                                        call,
                                        [{check_wish, RoleId}])
                        of
                        ok -> ok;
                        _R -> {false, lang:get("当前还没有玩家许愿，一会再来看看吧{face_1,3}")}
                    end;
                _ -> {false, lang:get("当前还没有玩家许愿，一会再来看看吧{face_1,3}")}
            end,
    {reply, Reply, State};
handle_call({look_id,
             #{id := Id, role_id := RoleId, time := Time}},
            _From, State) ->
    Reply = case ets:lookup(camp_whiteday, Id) of
                [#camp_whiteday{owner = {0, "", 0}} = CampWhiteday] ->
                    NewCampWhiteday = CampWhiteday#camp_whiteday{owner =
                                                                     RoleId,
                                                                 timeout =
                                                                     Time},
                    save(NewCampWhiteday),
                    info(deal_timeout),
                    {ok, NewCampWhiteday};
                _ ->
                    logger:error("还愿人数过多 ", [], camp_whiteday, 331),
                    {false, lang:get("当前还愿人数过多,请稍后重试")}
            end,
    {reply, Reply, State};
handle_call({votive,
             #{role_id := RoleId, cost_type := CostType,
               role_name := RoleName}},
            _From, State) ->
    MatchSpec = [{#camp_whiteday{owner = RoleId, flag = 0,
                                 _ = '_'},
                  [],
                  ['$_']}],
    Reply = case ets:select(camp_whiteday, MatchSpec) of
                [CampWhiteday = #camp_whiteday{role_id =
                                                   ToRoleId = {_,
                                                               Platform,
                                                               ZoneId},
                                               sex = Sex, type = Type}] ->
                    {Title1, Content1, Reward1} = case
                                                      wedding_data:get_whiteday_votive(CostType)
                                                      of
                                                      #{title := Title,
                                                        content := Content} ->
                                                          {Title,
                                                           notice:format(Content,
                                                                         [{role_2,
                                                                           RoleName}]),
                                                           get_reward(Type,
                                                                      Sex,
                                                                      CostType)};
                                                      _ ->
                                                          {lang:get("恭喜您愿望成真！"),
                                                           notice:format(lang:get("星语星愿一线牵，真情可贵愿望成！~ts倾囊相助，帮您<color='#ffff00'>实现"
                                                                                  "愿望</color>。愿你们情谊永存，快打开礼物看看吧^_^"),
                                                                         [{role_2,
                                                                           RoleName}]),
                                                           get_reward(Type,
                                                                      Sex,
                                                                      CostType)}
                                                  end,
                    case Reward1 of
                        [] -> ok;
                        _ ->
                            case role_misc:is_local_role(ToRoleId) of
                                true ->
                                    mail:send(ToRoleId,
                                              Title1,
                                              Content1,
                                              Reward1);
                                _ ->
                                    big_world:cast(Platform,
                                                   ZoneId,
                                                   mail,
                                                   send,
                                                   [ToRoleId,
                                                    Title1,
                                                    Content1,
                                                    Reward1])
                            end
                    end,
                    NewCampWhiteday = CampWhiteday#camp_whiteday{flag = 1},
                    save(NewCampWhiteday),
                    {ok, NewCampWhiteday};
                _ -> {false, lang:get("该愿望已被实现")}
            end,
    {reply, Reply, State};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(zero, State) ->
    ets:delete_all_objects(camp_whiteday),
    dets:delete_all_objects(camp_whiteday),
    erlang:send_after(date:next_diff(0, 0, 7) * 1000,
                      self(),
                      zero),
    {noreply, State};
handle_info(deal_timeout, State) ->
    Time = date:unixtime(),
    MatchSpec = [{#camp_whiteday{owner = '$1',
                                 timeout = '$2', flag = 0, _ = '_'},
                  [{'=/=', {const, {0, "", 0}}, '$1'},
                   {'=<', '$2', Time}],
                  ['$_']}],
    TimeoutList = ets:select(camp_whiteday, MatchSpec),
    lists:foreach(fun (CampWhiteday = #camp_whiteday{id =
                                                         Id,
                                                     role_id = RoleId}) ->
                          save(CampWhiteday#camp_whiteday{owner = {0, "", 0},
                                                          timeout = 0}),
                          big_world:cast(c_camp_whiteday,
                                         cast,
                                         [{add_id, Id, RoleId}]),
                          ok
                  end,
                  TimeoutList),
    MatchSpec1 = [{#camp_whiteday{owner = '$1',
                                  timeout = '$2', flag = 0, _ = '_'},
                   [{'=/=', {const, {0, "", 0}}, '$1'}, {'>', '$2', Time}],
                   ['$_']}],
    RemainList = ets:select(camp_whiteday, MatchSpec1),
    logger:debug("已超时列表长度 ~w 未超时列表长度 ~w",
                 [length(TimeoutList), RemainList],
                 camp_whiteday,
                 387),
    case RemainList of
        [_ | _] ->
            [#camp_whiteday{timeout = NextTime} | _] =
                lists:keysort(#camp_whiteday.timeout, RemainList),
            case erlang:get(tref) of
                TRef when is_reference(TRef) ->
                    erlang:cancel_timer(TRef);
                _ -> skip
            end,
            NewTRef = erlang:send_after((NextTime - Time) * 1000,
                                        self(),
                                        deal_timeout),
            put(tref, NewTRef);
        _ -> skip
    end,
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("开始关闭", [], camp_whiteday, 405),
    logger:info("关闭完成", [], camp_whiteday, 406),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

get_id() ->
    Id1 = case env:get(whiteday_id) of
              Id when is_integer(Id) -> Id;
              _ -> 1
          end,
    env:save(whiteday_id, Id1 + 1),
    {Id1, env:get(platform), env:get(zone_id)}.

save(CampWhiteday) ->
    ets:insert(camp_whiteday, CampWhiteday),
    ok.

fetch(RoleId) ->
    MatchSpec = [{#camp_whiteday{owner = RoleId, flag = 0,
                                 _ = '_'},
                  [],
                  ['$_']}],
    case ets:select(camp_whiteday, MatchSpec) of
        [#camp_whiteday{} = CampWhiteday | _] ->
            {ok, CampWhiteday};
        _ -> false
    end.

get_reward(Type, Sex, CostType) ->
    TList1 = wedding_data:get_whiteday({Type, 2}),
    TList2 = wedding_data:get_whiteday({Type, Sex}),
    List = TList1 ++ TList2,
    List1 = case CostType of
                1 ->
                    [{ItemId, Bind, Num, Odds}
                     || {ItemId, Bind, Num, Odds, _AddOdds} <- List];
                _ ->
                    [{ItemId, Bind, Num, Odds + AddOdds}
                     || {ItemId, Bind, Num, Odds, AddOdds} <- List]
            end,
    case util:rand_list(List1, 4) of
        {ItemId1, _Bind1, _Num1, _Odds1} ->
            logger:debug("========= ~w",
                         [List1],
                         camp_whiteday,
                         449),
            case CostType of
                1 -> [{ItemId1, 0, 1}];
                _ -> [{ItemId1, 0, 2}]
            end;
        _ -> []
    end.

get_close_one(List, FriendList) ->
    RoleIds = [{Fid, Intimacy}
               || {#friendship{intimacy = Intimacy, id = Fid}, _FRole}
                      <- FriendList,
                  Intimacy > 0],
    logger:debug("========= 全部好友ID======== ~w",
                 [RoleIds],
                 camp_whiteday,
                 463),
    case RoleIds of
        [] -> util:rand_list(List);
        _ ->
            RoleIds1 = lists:reverse(lists:keysort(2, RoleIds)),
            case do_get_close_one(List, RoleIds1) of
                [] -> util:rand_list(List);
                {ok, CampWhiteday} -> CampWhiteday
            end
    end.

do_get_close_one(_, []) -> [];
do_get_close_one([], _RoleIds) -> [];
do_get_close_one(List, [{RoleId, _Intimacy} | T]) ->
    case lists:keyfind(RoleId, #camp_whiteday.role_id, List)
        of
        #camp_whiteday{} = CampWhiteday ->
            logger:debug("========= 全部好友ID======== ~w",
                         [_Intimacy],
                         camp_whiteday,
                         479),
            {ok, CampWhiteday};
        _ -> do_get_close_one(List, T)
    end.

