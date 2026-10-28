-file("src/mod/campaign/camp_fruit.erl", 1).

-module(camp_fruit).

-behaviour(gen_fsm).

-export([start_link/0,
         push/1,
         push/2,
         cast/1,
         call/1,
         info/1,
         reload/0,
         m/0,
         help_call/4,
         help_call_apply/2,
         help_call_other/2,
         plant/2,
         assist/2,
         pick/2,
         reward/1,
         logout/1,
         login/1,
         help_plant/6]).

-export([idel/2, active/2]).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

-record(state, {ts, timeout}).

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

-file("src/mod/campaign/camp_fruit.erl", 44).

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

-file("src/mod/campaign/camp_fruit.erl", 45).

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

-file("src/mod/campaign/camp_fruit.erl", 46).

-file("inc/camp_fruit.hrl", 1).

-record(camp_fruit,
        {id = {0, "", 0},
         lev = 0,
         list = [],
         start_time = 0,
         end_time = 0,
         helped = 0}).

-record(camp_fruit_land,
        {id = 0,
         status = 0,
         base_id = 0,
         num = 0,
         need_num = 0,
         start_time = 0,
         end_time = 0,
         guilds = [],
         friends = [],
         log = []}).

-record(camp_fruit_land_log,
        {id = {0, "", 0},
         name = "",
         type = 0,
         base_id = 0,
         num = 0,
         mtime = 0}).

-record(camp_fruit_data,
        {id = 0,
         item_id = 0,
         type = 0,
         num = 0,
         cd = 0,
         reward = [],
         rand_reward = [],
         cast_msg = "",
         help_reward = [],
         help_exp_mode = 0,
         help_exp_radio = 0,
         help_rand_reward = [],
         help_cast_msg = "",
         exp_mode = 0,
         exp_radio = 0,
         plant_reward = [],
         plant_rand_reward = [],
         plant_cast_msg = "",
         plant_exp_mode = 0,
         plant_exp_radio = 0,
         friend_help_id = 0,
         guild_help_id = 0}).

-record(camp_fruit_reward_data,
        {min = 0,
         max = 0,
         reward = [],
         rand_reward = [],
         cast_msg = "",
         exp_mode = 0,
         exp_radio = 0}).

-file("src/mod/campaign/camp_fruit.erl", 47).

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

-file("src/mod/campaign/camp_fruit.erl", 48).

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

-file("src/mod/campaign/camp_fruit.erl", 49).

-file("inc/guild.hrl", 1).

-type guild_id() :: {non_neg_integer(),
                     list(),
                     non_neg_integer()}.

-record(guild_apply,
        {id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 1,
         time = 0,
         type = 0,
         looks = [],
         cup = 0 :: non_neg_integer(),
         donation = 0 :: non_neg_integer(),
         tag = 0 :: non_neg_integer(),
         msg = "" :: string()}).

-record(guild_envelop,
        {ver = 1,
         title = "" :: string(),
         amount = 0 :: non_neg_integer(),
         remain = 0 :: non_neg_integer(),
         total = 0 :: non_neg_integer(),
         num = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         packs = [],
         log = [] :: list()}).

-record(guild_role,
        {id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         pid :: undefined | pid(),
         name = "" :: list(),
         sex = 0 :: 0 | 1,
         classes = 0 :: 0..4,
         lev = 1 :: pos_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         fc = 1 :: pos_integer(),
         synth_fc = 1 :: pos_integer(),
         post = 0 :: 0..5,
         status = 0 :: 0 | 1,
         last_login = 1 :: pos_integer(),
         last_logout = 1 :: pos_integer(),
         enter_time = 0 :: non_neg_integer(),
         signature = "" :: list(),
         value = 0,
         total_value = 0 :: non_neg_integer(),
         cup = 0 :: non_neg_integer(),
         looks = [],
         envelope = #guild_envelop{},
         requirement = [],
         signed = 0 :: non_neg_integer(),
         last_signed = 0 :: non_neg_integer(),
         mails = [],
         active = 0,
         ability = 0,
         chat_num = 0,
         doing = 0,
         chat_num_list = [],
         doing_list = [],
         element_attr = [] :: list(),
         tmp_element_attr = [] :: list()}).

-record(guild_leaver,
        {id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: list(),
         guild_id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         value = 0,
         total_value = 0 :: non_neg_integer(),
         time = 0 :: integer()}).

-record(guild_boss,
        {lev = 1 :: non_neg_integer(),
         step = 1 :: non_neg_integer(),
         unit_id = 0 :: non_neg_integer(),
         name = "",
         hp = 0 :: non_neg_integer(),
         hp_max = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         called = 0 :: integer(),
         log = [] :: list(),
         last_renamed = 0 :: non_neg_integer()}).

-record(guild_mercenary,
        {id = {0, "", 0},
         key :: undefined | tuple(),
         lev = 0 :: non_neg_integer(),
         name = "" :: string(),
         dispatched = 0 :: non_neg_integer(),
         recruited = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         gain = [],
         guard :: undefined | tuple()}).

-record(guild_totem,
        {ver = 0 :: non_neg_integer(),
         id = util:rand_list([101, 102, 103, 104, 105]) ::
             non_neg_integer(),
         changeable = 1 :: non_neg_integer(),
         last_changed = 0 :: non_neg_integer()}).

-record(guild_question_answer,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         guild_name = "" :: string(),
         option = 0 :: 0..4,
         result = 0 :: 0 | 1,
         score = 0 :: non_neg_integer(),
         answered = 0 :: non_neg_integer(),
         totem_id = 0 :: non_neg_integer(),
         rank = 0 :: non_neg_integer()}).

-record(guild_question,
        {ver = 0,
         id = 0 :: non_neg_integer(),
         answer = 0 :: 0..4,
         asked = 0 :: non_neg_integer(),
         answers = [] :: [#guild_question_answer{}],
         cheat_off = [],
         asked_num = 0 :: non_neg_integer(),
         cheat_nums = []}).

-record(guild_robber,
        {ver = 0 :: non_neg_integer(),
         id :: undefined | tuple(),
         today_generated = 0 :: non_neg_integer(),
         gen_hour = 0 :: non_neg_integer(),
         gen_time = 0 :: non_neg_integer(),
         total_killed = 0 :: non_neg_integer(),
         last_killed = 0 :: non_neg_integer(),
         killed_time = 0 :: non_neg_integer(),
         fighters = [],
         picker = []}).

-record(guild_treasure,
        {ver = 1 :: non_neg_integer(),
         added = 0 :: non_neg_integer(),
         setting_chance = 0 :: non_neg_integer(),
         setting_time = 0 :: non_neg_integer(),
         gen_time = 0 :: non_neg_integer(),
         generated = 0 :: non_neg_integer(),
         unit_num = 0 :: non_neg_integer(),
         total_killed = 0 :: non_neg_integer(),
         last_killed = 0 :: non_neg_integer(),
         killed_time = 0 :: non_neg_integer(),
         can_open = 0 :: 0,
         fighters = [],
         picker = [],
         type = win}).

-record(guild_loot,
        {ver = 0, items = [], log = [], allocated = []}).

-record(guild_usurper,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         ctime = 0 :: integer()}).

-record(guild_invitation,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         lev = 0,
         ctime = 0 :: integer(),
         guild_id :: undefined | tuple(),
         guild_name = "" :: string()}).

-record(guild_plant_irrigator,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         ctime = 0 :: integer()}).

-record(guild_plant,
        {ver = 0,
         pos = {0, 0},
         owner_rid = {0, "", 0},
         owner_name = "",
         irrigations = [],
         phase = 0,
         sowed = 0,
         matured = 0,
         fired = 0 :: 0 | 1,
         unit_id = {0, 0},
         unit_base_id = 0}).

-record(guild_union_apply,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         leader_id = {0, "", 0},
         leader_name = "" :: string(),
         ctime = 0 :: integer()}).

-record(guild_campaign,
        {acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list()}).

-record(guild_camp_web,
        {acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list(),
         overdue_time = 0 :: non_neg_integer(),
         end_reward = [] :: list(),
         time_list = [] :: list()}).

-record(element_info,
        {ver = 1, build_type = 0, lev = 1, time = 0}).

-record(guild,
        {id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         ver = 21 :: non_neg_integer(),
         name = "" :: list(),
         assets = 5000000,
         max_assets = 5000000,
         upkeep = 0,
         pid :: undefined | pid(),
         leader_name = "" :: list(),
         leader_id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         leader_sex = 0 :: 0 | 1,
         leader_classes = 0 :: 0..6,
         leader_lev = 0 :: non_neg_integer(),
         members = [] :: [#guild_role{}],
         mem_num = 0 :: non_neg_integer(),
         fresh_num = 0 :: non_neg_integer(),
         max_mem_num = 90,
         max_fresh_num = 100,
         board = "" :: list(),
         health = 100,
         join_type = 2,
         join_condition = [],
         apply_list = [],
         event_list = [],
         lev = 1 :: pos_integer(),
         lev_time = 0 :: non_neg_integer(),
         academy_lev = 0 :: non_neg_integer(),
         academy_time = 0 :: non_neg_integer(),
         store_lev = 0 :: non_neg_integer(),
         store_time = 0 :: non_neg_integer(),
         exchequer_lev = 0 :: non_neg_integer(),
         exchequer_time = 0 :: non_neg_integer(),
         lev_ref :: undefined | reference(),
         welfare_time = 0,
         welfare_list = [],
         store_tick_time = 0,
         store_list = [],
         create_time = 0,
         flag = 0,
         map_pid = 0,
         map_id = 0,
         boss = #guild_boss{},
         mercenarys = [] :: [#guild_mercenary{}],
         totem = #guild_totem{} :: #guild_totem{},
         question = #guild_question{},
         robber_num = 0 :: non_neg_integer(),
         robber_total_num = 0 :: non_neg_integer(),
         usurpers = [],
         activity = 0,
         plants = [],
         announcement = "" :: string(),
         union_applys = [] :: list(),
         union_applied = [] :: list(),
         today_used_medal = 0 :: integer(),
         last_medal_used = 0 :: integer(),
         today_upgraded_build = 0 :: integer(),
         last_build_upgraded = 0 :: integer(),
         today_destory_build = 0 :: integer(),
         last_build_destory = 0 :: integer(),
         treasure = #guild_treasure{},
         loot = #guild_loot{},
         week_assets = 0 :: integer(),
         formalizing_lev = 35 :: integer(),
         name_used = "" :: string(),
         create_id = {0, "", 0},
         create_name = "",
         guild_camp = #guild_campaign{},
         guild_camp_web = #guild_camp_web{},
         max_chat_num = 0,
         max_doing = 0,
         max_fc = 0,
         max_synth_fc = 0,
         element_info = [],
         uplev_element_times = 0,
         last_uplev_element = 0,
         upgrade_element_time = 0,
         mail_list = [],
         limit_mode = 0,
         is_lock_board = 0,
         board_id = {0, "", 0},
         announce_id = {0, "", 0}}).

-record(guild_element_attr,
        {ver = 1,
         effect_obj = 1,
         attr = [],
         attr_snd = [],
         add_skill_list = [],
         high_attr = [],
         end_time = 0}).

-record(m_guild,
        {ver = 3 :: pos_integer(),
         id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         name = "" :: list(),
         pid :: undefined | pid(),
         enter_time = 0,
         guild_lev = 1,
         post = 0 :: non_neg_integer(),
         value = 0,
         total_value = 0 :: non_neg_integer(),
         signature = "" :: list(),
         element_attr = [] :: list(),
         tmp_element_attr = [] :: list(),
         build_speed_num = 0 :: non_neg_integer()}).

-record(guild_emblem,
        {ver = 0, id = 0, type = 0, lev = 0}).

-record(m_guild_emblem,
        {ver = 0 :: non_neg_integer(),
         remain_point = 0 :: non_neg_integer(),
         total_point = 0 :: non_neg_integer(),
         emblems = []}).

-file("src/mod/campaign/camp_fruit.erl", 50).

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

-file("src/mod/campaign/camp_fruit.erl", 51).

-file("inc/help.hrl", 1).

-record(m_help,
        {ver = 1,
         next_id = 1,
         free_ids = [],
         send_msg = [],
         recv_msg = [],
         ext = []}).

-record(help_state,
        {next_record_id = 1, free_record_ids = []}).

-record(help_msg,
        {id = 0,
         help_rid,
         help_id = 0,
         record_id = 0,
         time = 0,
         digit_array = [],
         str_array = [],
         ext = []}).

-record(help_record, {record_id = 0, rid}).

-record(help_data,
        {id = 0 :: pos_integer(),
         title = "",
         fun_type = 0,
         type = 0,
         help_args :: undefined | term()}).

-file("src/mod/campaign/camp_fruit.erl", 52).

-file("inc/pet.hrl", 1).

-record(pet_attr,
        {point = 0,
         p_str = 0,
         p_con = 0,
         p_mag = 0,
         p_agi = 0,
         p_end = 0,
         pre_str = 0,
         pre_con = 0,
         pre_mag = 0,
         pre_agi = 0,
         pre_end = 0,
         max_hp_apt_used = 0,
         max_phy_apt_used = 0,
         max_pdef_apt_used = 0,
         max_magic_apt_used = 0,
         max_aspd_apt_used = 0,
         hp_aptitude = 0,
         phy_aptitude = 0,
         pdef_aptitude = 0,
         magic_aptitude = 0,
         aspd_aptitude = 0,
         max_hp_aptitude = 0,
         max_phy_aptitude = 0,
         max_pdef_aptitude = 0,
         max_magic_aptitude = 0,
         max_aspd_aptitude = 0}).

-record(pet_tmp_aptitude,
        {is_valid = 0,
         tmp_genre = 0,
         tmp_pet_attr = #pet_attr{} :: #pet_attr{},
         tmp_skills = [],
         tmp_growth = 0,
         tmp_growth_type = 0,
         tmp_happy = 0,
         talent = 0}).

-record(pet_base,
        {id = 0,
         name = "",
         type = 1,
         genre = 0,
         hp_aptitude = 0,
         phy_aptitude = 0,
         pdef_aptitude = 0,
         magic_aptitude = 0,
         aspd_aptitude = 0,
         need_lev_break = 0,
         base_skills = [],
         vari_skills = [],
         lev_break_skills = [],
         has_break_skill = 0,
         base_happy = 1000,
         min_happy_ratio = 800,
         max_happy_ratio = 1050,
         min_happy_genre_ratio = 1000,
         max_happy_genre_ratio = 1100,
         growth_blue = 0,
         growth_purple = 0,
         growth_orange = 0,
         growth_red = 0,
         model_id = 0,
         model_id1 = 0,
         model_id2 = 0,
         model_id3 = 0,
         skin_id_0 = 0,
         skin_id_1 = 0,
         skin_id_2 = 0,
         skin_id_3 = 0,
         skin_id_s0 = 0,
         skin_id_s1 = 0,
         skin_id_s2 = 0,
         skin_id_s3 = 0,
         cost = [],
         lev_break_cost = [],
         max_wash_time = 0,
         manual_level = 0}).

-record(pet_base_skill,
        {id = 0,
         name = "",
         type = 0,
         step = 0,
         lev = 0,
         max_exp = 0,
         attr = []}).

-record(pet_skill,
        {id = 0,
         lev = 1,
         exp = 1,
         step = 0,
         type = 0,
         source = 1,
         is_lock = 0,
         is_last_study = 0}).

-record(pet_skin,
        {use_skin = 0,
         has_skin = [],
         add_hp_aptitude = 0,
         add_phy_aptitude = 0,
         add_pdef_aptitude = 0,
         add_magic_aptitude = 0,
         add_aspd_aptitude = 0,
         add_growth = 0}).

-record(pet,
        {ver = 32 :: pos_integer(),
         id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         name = "" :: bitstring(),
         lev = 1 :: pos_integer(),
         talent = 0,
         growth = 0,
         growth_type = 2,
         use_growth = 0,
         genre = 0,
         exp = 0 :: non_neg_integer(),
         max_exp = 1 :: pos_integer(),
         status = 0 :: 0 | 1,
         base_id :: undefined | pos_integer(),
         attr :: undefined | tuple(),
         hp = 1,
         mp = 1,
         hp_max = 1,
         mp_max = 1,
         pet_attr = #pet_attr{} :: #pet_attr{},
         happy = 0 :: non_neg_integer(),
         looks = [] :: list(),
         skills = [],
         comprehend_lev = 1,
         grade = 0,
         grade_attr = [],
         stones = [],
         feed_item = [],
         feed_point = 0,
         free_reset_flag = 0,
         combat_talk = [],
         lock = 0,
         wash_time = 0,
         ai_skillid = 0,
         mount_skills = [],
         break_times = 0,
         is_first = 0,
         handbook_attr = [],
         handbook_num = 0,
         star_handbook_num = 0,
         pet_tmp_aptitude = #pet_tmp_aptitude{},
         glue_pudding_used = 0,
         pet_skin = #pet_skin{},
         spirit_attached = 0 :: 0 | 1,
         spirit_attached_id = 0 :: non_neg_integer(),
         spirit_skills = [],
         spirit_info = [],
         unreal = [],
         spirit_child_flag = 0 :: 0 | 1,
         spirit_child_id = {0, "", 0} :: tuple(),
         unreal_looks_flag = 0 :: 0 | 1,
         pet_rune = []}).

-record(m_pet,
        {ver = 2 :: pos_integer(),
         fresh_id = 1,
         next_id = 1 :: pos_integer(),
         pets = [] :: list(),
         rename = 3 :: non_neg_integer(),
         pet_nums = 5,
         time = 0}).

-record(m_pet_store,
        {ver = 1 :: pos_integer(),
         next_id = 1 :: pos_integer(),
         pets = [] :: list(),
         pet_nums = 4}).

-record(pet_goods,
        {base_id :: undefined | pos_integer(),
         actv_lev :: undefined | pos_integer(),
         stock :: undefined | pos_integer()}).

-record(pet_shop_data,
        {base_id :: undefined | pos_integer(),
         name :: undefined | binary(),
         actv_lev :: undefined | pos_integer(),
         def_buy_price :: undefined | pos_integer(),
         stock :: undefined | pos_integer()}).

-record(pet_exchange_data,
        {base_id = 0,
         item_id = 0,
         item_num = 0,
         exchange_item_num = 0,
         genre = 0,
         talent = 0}).

-record(pet_stone_polish_data,
        {stone_id = 0,
         attr = [],
         attr_name = 0,
         val_list = [],
         skill_list = []}).

-record(pet_unreal, {item_id = 0, timeout = 0}).

-record(pet_unreal_data,
        {item_id = 0,
         attr = [],
         skills = [],
         model_id = 0,
         skin_id = 0}).

-record(pet_rune,
        {rune_index = 0,
         rune_type = 0,
         rune_status = 0,
         rune_id = 0,
         rune_lev = 0,
         is_resonance = 0,
         resonances = []}).

-record(pet_resonance,
        {resonance_index = 0,
         resonance_id = 0,
         rune_index = 0}).

-file("src/mod/campaign/camp_fruit.erl", 53).

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

-file("src/mod/campaign/camp_fruit.erl", 54).

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

-file("src/mod/campaign/camp_fruit.erl", 55).

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

-file("src/mod/campaign/camp_fruit.erl", 56).

-file("inc/camp_web.hrl", 1).

-record(m_camp_web,
        {ver = 4 :: non_neg_integer(),
         acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list(),
         overdue_time = 0 :: non_neg_integer(),
         end_reward = [] :: list(),
         time_list = [] :: list(),
         card_info = {0, 0, 0, []} :: tuple()}).

-record(camp_web_ico,
        {id = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         title = "" :: bitstring(),
         ico = "" :: bitstring(),
         alert = "" :: bitstring(),
         gif = "" :: bitstring(),
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         login_open = 0 :: non_neg_integer(),
         is_show_time = 0 :: 0..1,
         menu_list = [] :: list()}).

-record(camp_web_menu,
        {id = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         sec_type = 0 :: non_neg_integer(),
         settlement = 0 :: non_neg_integer(),
         reward_mod = 0 :: non_neg_integer(),
         mail_title = "" :: bitstring(),
         mail_content = "" :: bitstring(),
         title = "" :: bitstring(),
         title2 = "" :: bitstring(),
         ico = "" :: bitstring(),
         title_ico = "" :: bitstring(),
         type_ico = "" :: bitstring(),
         total_ico = 0 :: non_neg_integer(),
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         sort_val = 0 :: non_neg_integer(),
         top_banner = "" :: bitstring(),
         rule_str = "" :: bitstring(),
         time_str = "" :: bitstring(),
         bottom_alert = "" :: bitstring(),
         reward_title = "" :: bitstring(),
         panel_type = "" :: bitstring(),
         cli_reward = "" :: bitstring(),
         button_text = "" :: bitstring(),
         is_button = 0 :: 0..1,
         notice_msg = "" :: bitstring(),
         camp_list = [] :: list(),
         is_tran = 0,
         tran_info = ""}).

-record(camp_web,
        {id = 0 :: non_neg_integer(),
         n = 1 :: pos_integer(),
         key = {0, 0} :: tuple(),
         type = 0 :: non_neg_integer(),
         sec_type = 0 :: non_neg_integer(),
         third_type = 0 :: non_neg_integer(),
         settlement = 0 :: non_neg_integer(),
         reward_num = 1 :: non_neg_integer(),
         reward_can = 0 :: non_neg_integer(),
         value = 0 :: non_neg_integer(),
         tar_val = 0 :: non_neg_integer(),
         ext_val = 0 :: non_neg_integer(),
         status = 0 :: 0..2,
         cond_msg = "" :: bitstring(),
         loss_items = [] :: list(),
         items = [] :: list(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         str1 = "" :: bitstring(),
         str2 = "" :: bitstring(),
         str3 = "" :: bitstring(),
         str4 = "" :: bitstring(),
         extra = [],
         data :: undefined | any(),
         is_desc = 0 :: 0..1}).

-record(camp_handle,
        {time = 0 :: non_neg_integer(),
         evt = {evt_rpc} :: tuple(),
         total_camp :: undefined | #camp_web_ico{},
         menu :: undefined | #camp_web_menu{},
         camp :: undefined | #camp_web{},
         call_form = rpc :: evt | rpc,
         add_can_reward = 0 :: non_neg_integer(),
         rpc_reward_num = 1 :: non_neg_integer(),
         push_cli = 0 :: 0..1,
         push_list = [] :: [tuple()],
         to_id,
         return_acc = 0}).

-file("src/mod/campaign/camp_fruit.erl", 57).

logout(Role) -> help:del_help_info_by_fun_type(Role, 5).

login(Role = #role{id = RoleId}) ->
    cast({login, RoleId}),
    help:del_help_info_by_fun_type(Role, 5).

-spec m() -> ok.

m() ->
    logger:info("有人输入了下阶段", [], camp_fruit, 69),
    gen_fsm:send_event(camp_fruit, timeout).

push(Role = #role{id = RoleId, pid = Pid, lev = Lev}) ->
    Help = var:get_var(Role, day, 51, 0),
    Helped = var:get_role_var(RoleId, day, 52, 0),
    cast({push,
          #{id => RoleId, pid => Pid, help => Help, lev => Lev,
            helped => Helped}}),
    ok.

push(Role = #role{id = RoleId, pid = Pid, lev = Lev},
     TargetId) ->
    Help = var:get_var(Role, day, 51, 0),
    Helped = var:get_role_var(RoleId, day, 52, 0),
    cast({push,
          #{id => TargetId, pid => Pid, help => Help, lev => Lev,
            helped => Helped}}),
    ok.

help_call(#role{id = RoleId, pid = Pid}, Type = 1, Id,
          List) ->
    case camp_fruit_data:get_land(Id) of
        Cfg = #camp_fruit_data{} ->
            cast({friend_help_call,
                  #{id => RoleId, pid => Pid, land_id => Id,
                    friends => List -- [RoleId], type => Type,
                    cfg => Cfg}});
        _ -> {false, lang:get("没有找到配置")}
    end;
help_call(#role{id = RoleId, pid = Pid,
                m_guild = #m_guild{id = GuildId}},
          Type, Id, _List) ->
    case camp_fruit_data:get_land(Id) of
        Cfg = #camp_fruit_data{} ->
            cast({guild_help_call,
                  #{id => RoleId, pid => Pid, land_id => Id,
                    friends => [GuildId], type => Type, cfg => Cfg}});
        _ -> {false, lang:get("没有找到配置")}
    end;
help_call(_, _Type, _, _List) ->
    {false, lang:get("请先加入一个公会")}.

help_call_apply(Role = #role{name = Name, id = RoleId,
                             m_guild = MGuild, sex = Sex, classes = Classes,
                             lev = Lev},
                #{type := Type, friends := Friends,
                  cfg :=
                      #camp_fruit_data{friend_help_id = FriendHelpId,
                                       guild_help_id = GuildHelpId},
                  land :=
                      #camp_fruit_land{num = Num, need_num = NeedNum,
                                       id = LandId, base_id = BaseId}}) ->
    GRoleIds = case MGuild of
                   #m_guild{id = Gid} ->
                       case guild_mgr:members(Gid) of
                           {ok, Members} ->
                               [GRoleId
                                || #guild_role{id = GRoleId} <- Members];
                           _ -> []
                       end;
                   _ -> []
               end,
    {HelpId, RoleIds} = case Type of
                            1 -> {FriendHelpId, Friends};
                            _ -> {GuildHelpId, GRoleIds}
                        end,
    Fmt = lang:get("~ts发起求助：~ts-~ts，快帮助TA吧"),
    NewNum = NeedNum - Num,
    Args = [{role_2, Name},
            {string_2, 1, lang:get("水果种植")},
            {item_2, BaseId, NewNum}],
    NoticeMsg = notice:format(Fmt, Args),
    StrArr = [{1000, NoticeMsg}, {1001, Name}],
    DigitArr = [{2, BaseId},
                {3, NewNum},
                {8, LandId},
                {9, Type},
                {5, Sex},
                {6, Classes},
                {7, Lev}],
    HelpMsg = #help_msg{help_rid = RoleId, help_id = HelpId,
                        str_array = StrArr, digit_array = DigitArr},
    case help_data:get(HelpId) of
        HelpData = #help_data{} ->
            case help:add(HelpData, HelpMsg, Role) of
                {ok, NewHelpMsg, NewRole} ->
                    MFA = {camp_fruit, help_call_other, [NewHelpMsg]},
                    [role:apply(async, TargetId, MFA)
                     || TargetId <- RoleIds],
                    notice:send(Role, 3, lang:get("成功发送求助信息")),
                    push(NewRole),
                    {ok, NewRole};
                {false, Reason} ->
                    notice:return(Reason),
                    ok;
                _Err ->
                    logger:error("求助出错：~w", [_Err], camp_fruit, 140),
                    ok
            end;
        _ ->
            notice:return(lang:get("找不到求助配置")),
            ok
    end.

help_call_other(Role = #role{}, HelpMsg) ->
    case var:get_var(Role, day, 51, 0) >= 9999999999 of
        true -> ok;
        _ ->
            NewRole = help:ack_recv(HelpMsg, Role),
            {ok, NewRole}
    end.

plant(Role = #role{id = RoleId, name = Name}, Id) ->
    case camp_fruit_data:get_land(Id) of
        #camp_fruit_data{guild_help_id = GuildHelpId,
                         friend_help_id = FriendHelpId,
                         plant_exp_mode = ExpMode, plant_exp_radio = Radio,
                         plant_rand_reward = RandReward,
                         plant_cast_msg = CastMsg, plant_reward = Reward} ->
            case call({check_plant, #{id => RoleId, land_id => Id}})
                of
                {ok,
                 #camp_fruit_land{base_id = BaseId, num = Num,
                                  need_num = NeedNum}} ->
                    NewNum = max(1, NeedNum - Num),
                    {RandItem, IsCast} = case RandReward of
                                             [] -> {[], 0};
                                             [_ | _] ->
                                                 case util:rand_list(RandReward,
                                                                     4)
                                                     of
                                                     {0,
                                                      _IBind,
                                                      _INum,
                                                      _,
                                                      _IsCast} ->
                                                         {[], 0};
                                                     {IItemId,
                                                      IBind,
                                                      INum,
                                                      _,
                                                      IIsCast} ->
                                                         IItemId2 =
                                                             item_type:special_id(IItemId),
                                                         {[{IItemId2,
                                                            IBind,
                                                            INum}],
                                                          IIsCast}
                                                 end
                                         end,
                    Exp = get_exp(Role, ExpMode, Radio / 1000),
                    PetExp = get_pet_exp(Role, ExpMode, Radio / 1000),
                    NewReward = [{IItemId, Ibind, INum}
                                 || {IItemId, Ibind, INum} <- Reward],
                    ItemList = Exp ++ PetExp ++ NewReward ++ RandItem,
                    Gain = format:val_to_gain(ItemList),
                    Loss = format:val_to_loss([{BaseId, NewNum}]),
                    case role_gain:do_notice(Loss ++ Gain,
                                             Role,
                                             lang:get("水果种植"))
                        of
                        {ok, NRole} ->
                            case call({plant,
                                       #{id => RoleId, name => Name,
                                         base_id => BaseId, land_id => Id,
                                         num => NewNum}})
                                of
                                {ok, true} ->
                                    {ok, NewRole} =
                                        help:del_help_info_by_cfg_id(NRole,
                                                                     [GuildHelpId,
                                                                      FriendHelpId]),
                                    push(NewRole),
                                    case IsCast == 1 andalso CastMsg =/= "" of
                                        true ->
                                            NewCastMsg =
                                                notice:replace_msg([{"#role#",
                                                                     [{role_2,
                                                                       Name}]},
                                                                    {"#item#",
                                                                     [{item_2,
                                                                       RandItem}]}],
                                                                   CastMsg),
                                            logger:debug("广播：~ts",
                                                         [NewCastMsg],
                                                         camp_fruit,
                                                         192),
                                            notice:cast(all, 4, NewCastMsg);
                                        _ -> ignore
                                    end,
                                    {ok, NewRole};
                                {false, Reason} -> {false, Reason};
                                _Err ->
                                    logger:error("~w", [_Err], camp_fruit, 201),
                                    {ok, NewRole} =
                                        help:del_help_info_by_cfg_id(NRole,
                                                                     [GuildHelpId,
                                                                      FriendHelpId]),
                                    push(NewRole),
                                    case IsCast == 1 andalso CastMsg =/= "" of
                                        true ->
                                            NewCastMsg =
                                                notice:replace_msg([{"#role#",
                                                                     [{role_2,
                                                                       Name}]},
                                                                    {"#item#",
                                                                     [{item_2,
                                                                       RandItem}]}],
                                                                   CastMsg),
                                            logger:debug("广播：~ts",
                                                         [NewCastMsg],
                                                         camp_fruit,
                                                         207),
                                            notice:cast(all, 4, NewCastMsg);
                                        _ -> ignore
                                    end,
                                    {ok,
                                     role_trigger:fire(#evt_camp_fruit{base_id =
                                                                           BaseId,
                                                                       num =
                                                                           NewNum},
                                                       NewRole)}
                            end;
                        {false, #gain{}} -> {false, lang:get("背包空间不足")};
                        {false, _} ->
                            {false,
                             lang:get("缺少种子，可<color='#ffff00'>求助好友</color>或通过<color="
                                      "'#ffff00'>暑假活动</color>获取")}
                    end;
                {false, Reason} -> {false, Reason};
                _Err ->
                    logger:error("~w", [_Err], camp_fruit, 222),
                    {false, lang:get("系统繁忙")}
            end;
        _ -> {false, lang:get("没有找到配置")}
    end.

assist(#role{lev = Lev}, _) when Lev < 30 ->
    {false,
     notice:format(lang:get("等级低于~ts级，不能帮助"),
                   [{string_2, 5, 30}])};
assist(Role = #role{id = RoleId},
       #help_msg{help_rid = TargetId, help_id = _HelpId,
                 str_array = [_, {1001, Name} | _],
                 digit_array =
                     [{2, ItemId}, {3, Num}, {8, Id}, {9, Type} | _]}) ->
    Help = var:get_var(Role, day, 51, 0),
    case camp_fruit_data:get_land(Id) of
        _ when Help >= 9999999999 ->
            {false, lang:get("今天帮助次数已满")};
        #camp_fruit_data{} ->
            case call({check_help_plant,
                       #{id => RoleId, target_id => TargetId, land_id => Id,
                         type => Type, guild_id => {0, "", 0},
                         base_id => ItemId, num => Num}})
                of
                {ok, _NNum, Land} ->
                    sys_conn:pack_send(14036, {TargetId, Name, [Land]}),
                    ok;
                {false, Reason} -> {false, Reason};
                _Err ->
                    logger:error("~w", [_Err], camp_fruit, 245),
                    {false, lang:get("系统繁忙")}
            end;
        _ -> {false, lang:get("没有找到配置")}
    end.

help_plant(#role{id = RoleId}, RoleId, _Id, _Type,
           _ItemId, _Num) ->
    {false, lang:get("自己的土地，就不用帮助了")};
help_plant(Role = #role{id = RoleId, name = Name,
                        m_guild = MGuild},
           TargetId, Id, Type, ItemId, Num) ->
    Help = var:get_var(Role, day, 51, 0),
    case camp_fruit_data:get_land(Id) of
        _ when Help >= 9999999999 ->
            {false, lang:get("今天帮助次数已满")};
        Cfg = #camp_fruit_data{help_reward = HelpRewards,
                               help_exp_mode = ExpMode, help_exp_radio = Radio,
                               help_rand_reward = RandReward,
                               help_cast_msg = CastMsg} ->
            NGid = case MGuild of
                       #m_guild{id = Gid} -> Gid;
                       _ -> {-1, "", 0}
                   end,
            case call({check_help_plant,
                       #{id => RoleId, target_id => TargetId, land_id => Id,
                         type => Type, guild_id => NGid, base_id => ItemId,
                         num => Num}})
                of
                {ok, NNum, #camp_fruit_land{}} ->
                    NewNum = max(1, NNum),
                    Exp = get_exp(Role, ExpMode, Radio / 1000),
                    PetExp = get_pet_exp(Role, ExpMode, Radio / 1000),
                    {RandItem, IsCast} = case RandReward of
                                             [] -> {[], 0};
                                             [_ | _] ->
                                                 case util:rand_list(RandReward,
                                                                     4)
                                                     of
                                                     {0,
                                                      _IBind,
                                                      _INum,
                                                      _,
                                                      _IsCast} ->
                                                         {[], 0};
                                                     {IItemId,
                                                      IBind,
                                                      INum,
                                                      _,
                                                      IIsCast} ->
                                                         IItemId2 =
                                                             item_type:special_id(IItemId),
                                                         {[{IItemId2,
                                                            IBind,
                                                            INum}],
                                                          IIsCast}
                                                 end
                                         end,
                    Loss = format:val_to_loss([{ItemId, NNum}]),
                    NewHelpRewards = [{IItemId, Ibind, INum}
                                      || {IItemId, Ibind, INum} <- HelpRewards],
                    Gain = format:val_to_gain(NewHelpRewards ++
                                                  Exp ++ PetExp ++ RandItem),
                    case role_gain:do_notice(Loss ++ Gain,
                                             Role,
                                             lang:get("帮助水果种植"))
                        of
                        {ok, NRole} ->
                            case call({help_plant,
                                       #{id => RoleId, name => Name,
                                         target_id => TargetId, land_id => Id,
                                         type => Type, base_id => ItemId,
                                         num => NewNum, cfg => Cfg}})
                                of
                                {ok, true, #camp_fruit_land{}, _Flag} ->
                                    mail:send(TargetId,
                                              lang:get("帮助水果种植"),
                                              notice:format(lang:get("~ts听到你的请求，慷慨地在你的田里播下了~ts个~ts，快去看看吧！"),
                                                            [{role_2, Name},
                                                             {string_2,
                                                              5,
                                                              NNum},
                                                             {item_2,
                                                              ItemId}])),
                                    role:apply(async,
                                               TargetId,
                                               {camp_fruit, push, []}),
                                    NewRole = var:set_var(NRole,
                                                          day,
                                                          51,
                                                          Help + 1),
                                    case IsCast == 1 andalso CastMsg =/= "" of
                                        true ->
                                            NewCastMsg =
                                                notice:replace_msg([{"#role#",
                                                                     [{role_2,
                                                                       Name}]},
                                                                    {"#item#",
                                                                     [{item_2,
                                                                       RandItem}]}],
                                                                   CastMsg),
                                            logger:debug("广播：~ts",
                                                         [NewCastMsg],
                                                         camp_fruit,
                                                         296),
                                            notice:cast(all, 4, NewCastMsg);
                                        _ -> ignore
                                    end,
                                    {ok,
                                     role_trigger:fire(#evt_camp_fruit_help{base_id
                                                                                =
                                                                                ItemId,
                                                                            num
                                                                                =
                                                                                NNum},
                                                       NewRole)};
                                {false, Reason} -> {false, Reason};
                                _Err ->
                                    role:apply(async,
                                               TargetId,
                                               {camp_fruit, push, []}),
                                    logger:error("~w", [_Err], camp_fruit, 306),
                                    mail:send(TargetId,
                                              lang:get("帮助水果种植"),
                                              notice:format(lang:get("~ts听到你的请求，慷慨地在你的田里播下了~ts个~ts，快去看看吧！"),
                                                            [{role_2, Name},
                                                             {string_2,
                                                              5,
                                                              NNum},
                                                             {item_2,
                                                              ItemId}])),
                                    push(NRole, TargetId),
                                    NewRole = var:set_var(NRole,
                                                          day,
                                                          51,
                                                          Help + 1),
                                    case IsCast == 1 andalso CastMsg =/= "" of
                                        true ->
                                            NewCastMsg =
                                                notice:replace_msg([{"#role#",
                                                                     [{role_2,
                                                                       Name}]},
                                                                    {"#item#",
                                                                     [{item_2,
                                                                       RandItem}]}],
                                                                   CastMsg),
                                            logger:debug("广播：~ts",
                                                         [NewCastMsg],
                                                         camp_fruit,
                                                         313),
                                            notice:cast(all, 4, NewCastMsg);
                                        _ -> ignore
                                    end,
                                    {ok,
                                     role_trigger:fire(#evt_camp_fruit_help{base_id
                                                                                =
                                                                                ItemId,
                                                                            num
                                                                                =
                                                                                NNum},
                                                       NewRole)}
                            end;
                        {false, #gain{}} -> {false, lang:get("背包空间不足")};
                        {false, _} -> {false, lang:get("材料不足")}
                    end;
                {false, Reason} -> {false, Reason};
                _Err ->
                    logger:error("~w", [_Err], camp_fruit, 328),
                    {false, lang:get("系统繁忙")}
            end;
        _ -> {false, lang:get("没有找到配置")}
    end.

pick(Role = #role{id = RoleId, name = Name}, Id) ->
    case camp_fruit_data:get_land(Id) of
        Cfg = #camp_fruit_data{reward = Reward,
                               rand_reward = RandReward, cast_msg = CastMsg,
                               exp_mode = ExpMode, exp_radio = Radio} ->
            case call({pick,
                       #{id => RoleId, name => Name, land_id => Id,
                         cfg => Cfg}})
                of
                {ok, true} ->
                    Exp = get_exp(Role, ExpMode, Radio / 1000),
                    PetExp = get_pet_exp(Role, ExpMode, Radio / 1000),
                    {RandItem, IsCast} = case RandReward of
                                             [] -> {[], 0};
                                             [_ | _] ->
                                                 case util:rand_list(RandReward,
                                                                     4)
                                                     of
                                                     {0,
                                                      _IBind,
                                                      _INum,
                                                      _,
                                                      _IsCast} ->
                                                         {[], 0};
                                                     {IItemId,
                                                      IBind,
                                                      INum,
                                                      _,
                                                      IIsCast} ->
                                                         IItemId2 =
                                                             item_type:special_id(IItemId),
                                                         {[{IItemId2,
                                                            IBind,
                                                            INum}],
                                                          IIsCast}
                                                 end
                                         end,
                    ItemList = Exp ++ PetExp ++ Reward ++ RandItem,
                    Gain = format:val_to_gain(ItemList),
                    NewRole = case role_gain:do_notice(Gain,
                                                       Role,
                                                       lang:get("摘取"))
                                  of
                                  {ok, NRole} -> NRole;
                                  {false, _} ->
                                      mail:send(Role,
                                                lang:get("水果摘取"),
                                                lang:get("背包已满"),
                                                ItemList),
                                      Role
                              end,
                    case IsCast == 1 andalso CastMsg =/= "" of
                        true ->
                            NewCastMsg = notice:replace_msg([{"#role#",
                                                              [{role_2, Name}]},
                                                             {"#item#",
                                                              [{item_2,
                                                                RandItem}]}],
                                                            CastMsg),
                            logger:debug("广播：~ts",
                                         [NewCastMsg],
                                         camp_fruit,
                                         367),
                            notice:cast(all, 4, NewCastMsg);
                        _ -> ignore
                    end,
                    push(NewRole),
                    {ok, NewRole};
                {false, Reason} -> {false, Reason};
                _Err ->
                    logger:error("~w", [_Err], camp_fruit, 377),
                    {false, lang:get("系统繁忙")}
            end;
        _ -> {false, lang:get("没有找到配置")}
    end.

reward(Role = #role{id = RoleId, name = Name,
                    lev = Lev}) ->
    case camp_fruit_data:get_reward(Lev) of
        #camp_fruit_reward_data{reward = Reward,
                                rand_reward = RandReward, cast_msg = CastMsg,
                                exp_mode = ExpMode, exp_radio = Radio} ->
            case call({reward, #{id => RoleId}}) of
                {ok, true} ->
                    Exp = get_exp(Role, ExpMode, Radio / 1000),
                    PetExp = get_pet_exp(Role, ExpMode, Radio / 1000),
                    {RandItem, IsCast} = case RandReward of
                                             [] -> {[], 0};
                                             [_ | _] ->
                                                 case util:rand_list(RandReward,
                                                                     4)
                                                     of
                                                     {0,
                                                      _IBind,
                                                      _INum,
                                                      _,
                                                      _IIsCast} ->
                                                         {[], 0};
                                                     {IItemId,
                                                      IBind,
                                                      INum,
                                                      _,
                                                      IIsCast} ->
                                                         IItemId2 =
                                                             item_type:special_id(IItemId),
                                                         {[{IItemId2,
                                                            IBind,
                                                            INum}],
                                                          IIsCast}
                                                 end
                                         end,
                    ItemList = Exp ++ PetExp ++ Reward ++ RandItem,
                    Gain = format:val_to_gain(ItemList),
                    NewRole = case role_gain:do_notice(Gain,
                                                       Role,
                                                       lang:get("水果种植领奖"))
                                  of
                                  {ok, NRole} -> NRole;
                                  {false, _} ->
                                      mail:send(Role,
                                                lang:get("水果种植领奖"),
                                                lang:get("背包已满"),
                                                ItemList),
                                      Role
                              end,
                    case IsCast == 1 andalso CastMsg =/= "" of
                        true ->
                            NewCastMsg = notice:replace_msg([{"#role#",
                                                              [{role_2, Name}]},
                                                             {"#item#",
                                                              [{item_2,
                                                                RandItem}]}],
                                                            CastMsg),
                            logger:debug("广播：~ts",
                                         [NewCastMsg],
                                         camp_fruit,
                                         415),
                            notice:cast(all, 4, NewCastMsg);
                        _ -> ignore
                    end,
                    push(NewRole),
                    {ok,
                     role_trigger:fire(#evt_camp_fruit_reward{}, NewRole)};
                {false, Reason} -> {false, Reason};
                _Err ->
                    logger:error("~w", [_Err], camp_fruit, 425),
                    {false, lang:get("系统繁忙")}
            end;
        _ -> {false, lang:get("没有找到配置")}
    end.

cast(Event) ->
    gen_fsm:send_all_state_event(camp_fruit, Event).

call(Event) ->
    try gen_fsm:sync_send_all_state_event(camp_fruit, Event)
    catch
        _Type:_Reason ->
            logger:debug("Type: ~w  Reason: ~w",
                         [_Type, _Reason],
                         camp_fruit,
                         442),
            {error, timeout}
    end.

info(Info) -> camp_fruit ! Info.

reload() ->
    camp_fruit ! reload,
    ok.

start_link() ->
    gen_fsm:start_link({local, camp_fruit},
                       camp_fruit,
                       [],
                       []).

init([]) ->
    logger:info("开始启动...", [], camp_fruit, 463),
    process_flag(trap_exit, true),
    dets:open_file(camp_fruit,
                   [{file, "./dets/camp_fruit.dets"},
                    {keypos, #camp_fruit.id}]),
    ets:new(camp_fruit,
            [set, named_table, public, {keypos, #camp_fruit.id}]),
    dets:to_ets(camp_fruit, camp_fruit),
    {StateName, TimeLeft} = get_idle_time(),
    NewState = #state{ts = date:now2(), timeout = TimeLeft},
    logger:info("启动完成", [], camp_fruit, 470),
    {ok, StateName, NewState}.

handle_event({login, RoleId}, StateName = active,
             State) ->
    case lookup(RoleId) of
        CampFruit = #camp_fruit{list = List} ->
            NewList = [I#camp_fruit_land{friends = [], guilds = []}
                       || I <- List],
            update_data(CampFruit#camp_fruit{list = NewList});
        _ -> ignore
    end,
    continue(StateName, State);
handle_event({push, Args = #{id := RoleId, lev := Lev}},
             StateName = active, State) ->
    Now = date:unixtime(),
    case lookup(RoleId) of
        CampFruit = #camp_fruit{list = [], end_time = EndTime}
            when EndTime + 15 * 3600 =< Now ->
            Lands = init_land(),
            NewCampFruit = CampFruit#camp_fruit{list = Lands,
                                                lev = Lev, start_time = Now,
                                                end_time = 0},
            do_push(NewCampFruit, Args),
            update_data(NewCampFruit);
        CampFruit = #camp_fruit{list = []} ->
            do_push(CampFruit, Args);
        CampFruit = #camp_fruit{} -> do_push(CampFruit, Args);
        _ ->
            Lands = init_land(),
            NewCampFruit = #camp_fruit{id = RoleId, list = Lands,
                                       start_time = Now, end_time = 0},
            do_push(NewCampFruit, Args),
            update_data(NewCampFruit)
    end,
    continue(StateName, State);
handle_event({friend_help_call,
              Args = #{id := RoleId, pid := Pid, land_id := Id,
                       friends := AFriends}},
             StateName = active, State) ->
    Result = case lookup(RoleId) of
                 #camp_fruit{list = []} ->
                     {false, lang:get("土地还不能种植，不能那么着急求助")};
                 CampFruit = #camp_fruit{list = List, helped = Helped} ->
                     Length = length([1
                                      || #camp_fruit_land{status = Status}
                                             <- List,
                                         Status == 1 orelse Status == 2]),
                     case lists:keyfind(Id, #camp_fruit_land.id, List) of
                         _ when Helped >= 9999999999999 ->
                             {false, lang:get("本轮被帮助次数已满")};
                         _ when Length < 2 ->
                             {false,
                              notice:format(lang:get("播种~ts块土地，才可使用求助"),
                                            [{string_2, 5, 2}])};
                         Land = #camp_fruit_land{status = 0,
                                                 friends = Friends} ->
                             AFriends2 = AFriends -- Friends,
                             NewFriends = Friends ++ AFriends2,
                             role:apply(async,
                                        Pid,
                                        {camp_fruit,
                                         help_call_apply,
                                         [Args#{land => Land}]}),
                             NewLand = Land#camp_fruit_land{friends =
                                                                NewFriends},
                             NewList = lists:keyreplace(Id,
                                                        #camp_fruit_land.id,
                                                        List,
                                                        NewLand),
                             NewCampFruit = CampFruit#camp_fruit{list =
                                                                     NewList},
                             update_data(NewCampFruit);
                         #camp_fruit_land{status = 1} ->
                             {false, lang:get("土地已种植，不能求助")};
                         #camp_fruit_land{} -> {false, lang:get("土地已收获，不能求助")};
                         _ -> {false, lang:get("没有找到该土地")}
                     end;
                 _ -> {false, lang:get("土地未初始化，不能求助")}
             end,
    case Result of
        {false, Reason} -> notice:send({pid, Pid}, 1, Reason);
        _ -> ok
    end,
    continue(StateName, State);
handle_event({guild_help_call,
              Args = #{id := RoleId, pid := Pid, land_id := Id,
                       friends := Guilds}},
             StateName = active, State) ->
    Result = case lookup(RoleId) of
                 #camp_fruit{list = []} ->
                     {false, lang:get("土地还不能种植，不能那么着急求助")};
                 CampFruit = #camp_fruit{list = List, helped = Helped} ->
                     Length = length([1
                                      || #camp_fruit_land{status = Status}
                                             <- List,
                                         Status == 1 orelse Status == 2]),
                     case lists:keyfind(Id, #camp_fruit_land.id, List) of
                         _ when Helped >= 9999999999999 ->
                             {false, lang:get("本轮被帮助次数已满")};
                         _ when Length < 2 ->
                             {false,
                              notice:format(lang:get("播种~ts块土地，才可使用求助"),
                                            [{string_2, 5, 2}])};
                         Land = #camp_fruit_land{status = 0} ->
                             role:apply(async,
                                        Pid,
                                        {camp_fruit,
                                         help_call_apply,
                                         [Args#{land => Land}]}),
                             NewLand = Land#camp_fruit_land{guilds = Guilds},
                             NewList = lists:keyreplace(Id,
                                                        #camp_fruit_land.id,
                                                        List,
                                                        NewLand),
                             NewCampFruit = CampFruit#camp_fruit{list =
                                                                     NewList},
                             update_data(NewCampFruit),
                             ok;
                         #camp_fruit_land{status = 1} ->
                             {false, lang:get("土地已种植，不能求助")};
                         #camp_fruit_land{} -> {false, lang:get("土地已收获，不能求助")};
                         _ -> {false, lang:get("没有找到该土地")}
                     end;
                 _ -> {false, lang:get("土地未初始化，不能求助")}
             end,
    case Result of
        {false, Reason} -> notice:send({pid, Pid}, 1, Reason);
        _ -> ok
    end,
    continue(StateName, State);
handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event({check_plant,
                   #{id := RoleId, land_id := Id}},
                  _From, StateName = active, State) ->
    Reply = case lookup(RoleId) of
                #camp_fruit{list = List} ->
                    case lists:keyfind(Id, #camp_fruit_land.id, List) of
                        Land = #camp_fruit_land{status = 0} -> {ok, Land};
                        #camp_fruit_land{status = 1} ->
                            {false, lang:get("土地已种植")};
                        #camp_fruit_land{} -> {false, lang:get("土地已收获")};
                        _ -> {false, lang:get("没有找到该土地")}
                    end;
                _ -> {false, lang:get("你还未初始化")}
            end,
    continue(StateName, Reply, State);
handle_sync_event({check_plant, _}, _From, StateName,
                  State) ->
    Reply = {false, lang:get("活动已过期")},
    continue(StateName, Reply, State);
handle_sync_event({check_help_plant,
                   #{id := RoleId, target_id := TargetId, land_id := Id,
                     base_id := BaseId, guild_id := GuildId, type := Type}},
                  _From, StateName = active, State) ->
    Reply = case lookup(TargetId) of
                #camp_fruit{list = List, helped = Helped} ->
                    case lists:keyfind(Id, #camp_fruit_land.id, List) of
                        _ when Helped >= 9999999999999 ->
                            {false, lang:get("该玩家被帮助次数已满")};
                        Land = #camp_fruit_land{status = 0, need_num = NeedNum,
                                                num = _Num, base_id = BaseId,
                                                friends = Friends,
                                                guilds = Guilds} ->
                            NewNum = NeedNum,
                            _HelpFlag = case Type of
                                            1 -> lists:member(RoleId, Friends);
                                            _ -> lists:member(GuildId, Guilds)
                                        end,
                            {ok, NewNum, Land};
                        #camp_fruit_land{status = 0} ->
                            {false, lang:get("种子不对")};
                        #camp_fruit_land{status = 1} ->
                            {false, lang:get("该求助已被完成")};
                        #camp_fruit_land{} -> {false, lang:get("土地已收获")};
                        _ -> {false, lang:get("没有找到该土地")}
                    end;
                _ -> {false, lang:get("你还未初始化")}
            end,
    continue(StateName, Reply, State);
handle_sync_event({check_help_plant, _}, _From,
                  StateName, State) ->
    Reply = {false, lang:get("活动已过期")},
    continue(StateName, Reply, State);
handle_sync_event({plant,
                   #{id := RoleId, name := Name, base_id := BaseId,
                     land_id := Id, num := NewNum}},
                  _From, StateName, State) ->
    Reply = case lookup(RoleId) of
                CampFruit = #camp_fruit{list = List} ->
                    case lists:keyfind(Id, #camp_fruit_land.id, List) of
                        Land = #camp_fruit_land{num = Num, status = 0,
                                                need_num = NeedNum,
                                                log = LogList} ->
                            Now = date:unixtime(),
                            Log = #camp_fruit_land_log{id = RoleId, name = Name,
                                                       base_id = BaseId,
                                                       num = NeedNum, type = 0,
                                                       mtime = Now},
                            NewLand = Land#camp_fruit_land{num =
                                                               min(Num + NewNum,
                                                                   NeedNum),
                                                           status = 1,
                                                           start_time = Now,
                                                           log =
                                                               [Log | LogList]},
                            NewList = lists:keyreplace(Id,
                                                       #camp_fruit_land.id,
                                                       List,
                                                       NewLand),
                            NewCampFruit = CampFruit#camp_fruit{list = NewList},
                            update_data(NewCampFruit),
                            {ok, true};
                        #camp_fruit_land{status = 1} ->
                            {false, lang:get("土地已种植")};
                        #camp_fruit_land{} -> {false, lang:get("土地已收获")};
                        _ -> {false, lang:get("没有找到该土地")}
                    end;
                _ -> {false, lang:get("你还未初始化")}
            end,
    continue(StateName, Reply, State);
handle_sync_event({help_plant,
                   #{id := RoleId, target_id := TargetId, name := Name,
                     base_id := BaseId, land_id := Id, type := Type,
                     num := NNum,
                     cfg :=
                         #camp_fruit_data{guild_help_id = GuildHelpId,
                                          friend_help_id = FriendHelpId}}},
                  _From, StateName, State) ->
    Reply = case lookup(TargetId) of
                CampFruit = #camp_fruit{list = List, helped = Helped} ->
                    case lists:keyfind(Id, #camp_fruit_land.id, List) of
                        Land = #camp_fruit_land{num = Num, status = 0,
                                                need_num = NeedNum,
                                                log = LogList} ->
                            Now = date:unixtime(),
                            Log = #camp_fruit_land_log{id = RoleId, name = Name,
                                                       base_id = BaseId,
                                                       num = NeedNum,
                                                       type = Type,
                                                       mtime = Now},
                            NewNum = min(Num + NNum, NeedNum),
                            NewLand = case NewNum >= NeedNum of
                                          true ->
                                              Land#camp_fruit_land{num = NewNum,
                                                                   status = 1,
                                                                   start_time =
                                                                       Now,
                                                                   log =
                                                                       [Log
                                                                        | LogList]};
                                          _ ->
                                              Land#camp_fruit_land{num = NewNum,
                                                                   log =
                                                                       [Log
                                                                        | LogList]}
                                      end,
                            NList = lists:keyreplace(Id,
                                                     #camp_fruit_land.id,
                                                     List,
                                                     NewLand),
                            NewHelped = Helped + 1,
                            NewList = case NewHelped >= 9999999999999 of
                                          true ->
                                              [I#camp_fruit_land{friends = [],
                                                                 guilds = []}
                                               || I <- NList];
                                          _ -> NList
                                      end,
                            NewCampFruit = CampFruit#camp_fruit{list = NewList,
                                                                helped =
                                                                    NewHelped},
                            update_data(NewCampFruit),
                            case NewHelped >= 9999999999999 of
                                true ->
                                    role:apply(async,
                                               TargetId,
                                               {help,
                                                del_help_info_by_fun_type,
                                                [5]});
                                false ->
                                    role:apply(async,
                                               TargetId,
                                               {help,
                                                del_help_info_by_cfg_id,
                                                [[GuildHelpId, FriendHelpId]]})
                            end,
                            {ok, true, NewLand, NewHelped >= 9999999999999};
                        #camp_fruit_land{status = 1} ->
                            {false, lang:get("土地已种植")};
                        #camp_fruit_land{} -> {false, lang:get("土地已收获")};
                        _ -> {false, lang:get("没有找到该土地")}
                    end;
                _ -> {false, lang:get("还未初始化")}
            end,
    continue(StateName, Reply, State);
handle_sync_event({pick,
                   #{id := RoleId, name := Name, land_id := Id,
                     cfg := #camp_fruit_data{cd = Cd}}},
                  _From, StateName, State) ->
    Reply = case lookup(RoleId) of
                CampFruit = #camp_fruit{list = List} ->
                    Now = date:unixtime(),
                    case lists:keyfind(Id, #camp_fruit_land.id, List) of
                        Land = #camp_fruit_land{status = 1,
                                                start_time = StartTime,
                                                log = LogList}
                            when Now >= StartTime + Cd ->
                            Log = #camp_fruit_land_log{id = RoleId, name = Name,
                                                       type = 3, mtime = Now},
                            NewLand = Land#camp_fruit_land{status = 2,
                                                           end_time = Now,
                                                           log =
                                                               [Log | LogList]},
                            NewList = lists:keyreplace(Id,
                                                       #camp_fruit_land.id,
                                                       List,
                                                       NewLand),
                            NewCampFruit = CampFruit#camp_fruit{list = NewList},
                            update_data(NewCampFruit),
                            {ok, true};
                        #camp_fruit_land{status = 1} ->
                            {false, lang:get("该水果还不能收获")};
                        #camp_fruit_land{status = 0} ->
                            {false, lang:get("土地未种植")};
                        #camp_fruit_land{} -> {false, lang:get("土地已收获")};
                        _ -> {false, lang:get("没有找到该土地")}
                    end;
                _ -> {false, lang:get("还未初始化")}
            end,
    continue(StateName, Reply, State);
handle_sync_event({reward, #{id := RoleId}}, _From,
                  StateName, State) ->
    Reply = case lookup(RoleId) of
                #camp_fruit{list = []} -> {false, lang:get("奖励领过领过奖")};
                CampFruit = #camp_fruit{list = List} ->
                    Now = date:unixtime(),
                    case [1
                          || #camp_fruit_land{status = Status} <- List,
                             Status =/= 2]
                        of
                        [] ->
                            NewCampFruit = CampFruit#camp_fruit{list = [],
                                                                end_time = Now,
                                                                helped = 0},
                            update_data(NewCampFruit),
                            {ok, true};
                        _ -> {false, lang:get("收获所有土地可领取大丰收奖励")}
                    end;
                _ -> {false, lang:get("还未初始化")}
            end,
    continue(StateName, Reply, State);
handle_sync_event(_Event, _From, StateName, State) ->
    Reply = ok,
    continue(StateName, Reply, State).

handle_info(reload, _StateName, State) ->
    {StateName, TimeLeft} = get_idle_time(),
    {next_state,
     StateName,
     State#state{ts = date:now2(), timeout = TimeLeft},
     TimeLeft};
handle_info(_Info, StateName, State) ->
    continue(StateName, State).

terminate(_Reason, _StateName, _State) -> ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

idel(timeout, State) ->
    {StateName, TimeLeft} = get_idle_time(),
    ets:delete_all_objects(camp_fruit),
    dets:delete_all_objects(camp_fruit),
    continue(StateName,
             State#state{ts = date:now2(), timeout = TimeLeft});
idel(_Any, State) -> continue(idel, State).

active(timeout, State) ->
    {_, TimeLeft} = get_idle_time(),
    List = ets:tab2list(camp_fruit),
    over_reward(List),
    ets:delete_all_objects(camp_fruit),
    dets:delete_all_objects(camp_fruit),
    continue(idel,
             State#state{ts = date:now2(), timeout = TimeLeft});
active(_Any, State) -> continue(idel, State).

get_idle_time() ->
    Now = date:unixtime(),
    {StartTime, EndTime} = case
                               campaign_mgr:get_camp_time(60005)
                               of
                               {-1, -1} ->
                                   {date:datetime_to_seconds({{2016, 3, 29},
                                                              {0, 0, 0}}),
                                    date:datetime_to_seconds({{2016, 4, 20},
                                                              {0, 0, 0}})};
                               {S, E} -> {S, E};
                               _ ->
                                   {date:datetime_to_seconds({{2016, 3, 29},
                                                              {0, 0, 0}}),
                                    date:datetime_to_seconds({{2016, 4, 20},
                                                              {0, 0, 0}})}
                           end,
    if Now < StartTime ->
           {idel, max((StartTime - Now) * 1000, 1)};
       Now >= StartTime andalso Now < EndTime ->
           {active, (EndTime - Now) * 1000};
       true -> {idel, date:next_diff(0) * 1000}
    end.

do_push(#camp_fruit{id = Id, start_time = ST,
                    end_time = ET, list = List, helped = Helped},
        #{help := Help, pid := Pid}) ->
    NET = case ET of
              0 -> 0;
              ET -> ET + 15 * 3600
          end,
    Msg = {Id, Help, Helped, ST, NET, List},
    role:pack_send(Pid, 14021, Msg).

over_reward([]) -> ok;
over_reward([#camp_fruit{list = []} | T]) ->
    over_reward(T);
over_reward([#camp_fruit{id = RoleId, lev = Lev,
                         list = List}
             | T]) ->
    case [1
          || #camp_fruit_land{status = Status} <- List,
             Status =/= 2]
        of
        [] ->
            case camp_fruit_data:get_reward(Lev) of
                #camp_fruit_reward_data{reward = Reward,
                                        rand_reward = RandReward} ->
                    {RandItem, _IsCast} = case RandReward of
                                              [] -> {[], 0};
                                              [_ | _] ->
                                                  case
                                                      util:rand_list(RandReward,
                                                                     4)
                                                      of
                                                      {0,
                                                       _IBind,
                                                       _INum,
                                                       _,
                                                       _IIsCast} ->
                                                          {[], 0};
                                                      {IItemId,
                                                       IBind,
                                                       INum,
                                                       _,
                                                       IIsCast} ->
                                                          IItemId2 =
                                                              item_type:special_id(IItemId),
                                                          {[{IItemId2,
                                                             IBind,
                                                             INum}],
                                                           IIsCast}
                                                  end
                                          end,
                    case Reward ++ RandItem of
                        [] -> ignore;
                        ItemList ->
                            mail:send(RoleId,
                                      lang:get("水果种植结束"),
                                      lang:get("水果种植活动结束了！\n付出就一定会有回报，你播下的种子最终也结出了果实。\n这些是你应得"
                                               "的收获，请查收～"),
                                      ItemList)
                    end;
                _ -> ignore
            end;
        _ ->
            case over_reward2(List, []) of
                [] -> ignore;
                ItemList ->
                    mail:send(RoleId,
                              lang:get("水果种植结束"),
                              lang:get("水果种植活动结束了！\n付出就一定会有回报，你播下的种子最终也结出了果实。\n这些是你应得"
                                       "的收获，请查收～"),
                              ItemList)
            end
    end,
    over_reward(T).

over_reward2([], List) -> List;
over_reward2([#camp_fruit_land{id = Id, status = 1}
              | T],
             List) ->
    case camp_fruit_data:get_land(Id) of
        #camp_fruit_data{reward = Reward,
                         rand_reward = RandReward} ->
            {RandItem, _IsCast} = case RandReward of
                                      [] -> {[], 0};
                                      [_ | _] ->
                                          case util:rand_list(RandReward, 4) of
                                              {0, _IBind, _INum, _, _IIsCast} ->
                                                  {[], 0};
                                              {IItemId,
                                               IBind,
                                               INum,
                                               _,
                                               IIsCast} ->
                                                  IItemId2 =
                                                      item_type:special_id(IItemId),
                                                  {[{IItemId2, IBind, INum}],
                                                   IIsCast}
                                          end
                                  end,
            ItemList = Reward ++ RandItem,
            over_reward2(T, List ++ ItemList);
        _ -> over_reward2(T, List)
    end;
over_reward2([_ | T], List) -> over_reward2(T, List).

init_land() ->
    Ids = camp_fruit_data:indexs(),
    List = init_index(Ids, []),
    init_land(List, []).

init_index([], List) -> List;
init_index([Id | T], List) ->
    {NId, _} = util:rand_list(camp_fruit_data:get_rand(Id),
                              2),
    init_index(T, [NId | List]).

init_land([], List) -> List;
init_land([Id | T], List) ->
    case camp_fruit_data:get_land(Id) of
        #camp_fruit_data{item_id = ItemId, num = Num} ->
            Land = #camp_fruit_land{id = Id, status = 0,
                                    base_id = ItemId, need_num = Num},
            init_land(T, [Land | List]);
        _ -> init_land(T, List)
    end.

lookup(RoleId) -> lookup(camp_fruit, RoleId).

lookup(Tab, RoleId) ->
    case ets:lookup(Tab, RoleId) of
        [] -> false;
        [R | _] -> R
    end.

update_data(R) -> update_data(camp_fruit, R).

update_data(Tab, R) ->
    update_ets(Tab, R),
    update_dets(Tab, R).

update_ets(Tab, Data) -> ets:insert(Tab, Data).

update_dets(Tab, Data) -> dets:insert(Tab, Data).

get_exp(#role{lev = Lev}, Mode, Rate) ->
    case levup_data:get_exp({Mode, Lev}) of
        #{exp := Exp} -> [{90010, 0, util:ceil(Exp * Rate)}];
        _ -> []
    end.

get_pet_exp(Role, Mode, Rate) ->
    case pet:get_war_pet(Role) of
        {ok, #pet{lev = Lev}} ->
            case levup_data:get_exp({Mode, Lev}) of
                #{pet_exp := Exp} ->
                    [{90005, 0, util:ceil(Exp * Rate)}];
                _ -> []
            end;
        _ -> []
    end.

continue(StateName,
         State = #state{ts = Ts, timeout = Tidle}) ->
    {next_state,
     StateName,
     State,
     util:time_left(Tidle, Ts)}.

continue(StateName, Reply,
         State = #state{ts = Ts, timeout = Tidle}) ->
    {reply,
     Reply,
     StateName,
     State,
     util:time_left(Tidle, Ts)}.

