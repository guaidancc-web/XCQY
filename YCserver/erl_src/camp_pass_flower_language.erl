-file("src/mod/campaign/camp_pass_flower_language.erl",
      1).

-module(camp_pass_flower_language).

-author("Suhan").

-behaviour(gen_fsm).

-export([start_link/0,
         init/0,
         zero_flush/2,
         info/1,
         sync_event/1,
         cast/1,
         check_flower/2,
         receive_flower/2,
         receive_flower/3,
         apply_flower_timeout/2,
         push_info/1,
         push_friend/2,
         reward/3,
         pass_flower/3,
         send_notice_mail/2,
         gm_add_flower/2,
         repair/0,
         calc_flower_num/0,
         apply_calc_flower_num/2]).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

-export([idle/2, active/2]).

-record(state,
        {id,
         ts,
         timeout,
         finish_pass_num,
         flower_pass_times,
         send_flower_ref,
         final_reward}).

-file("inc/camp_pass_flower_language.hrl", 1).

-author("Suhan").

-record(m_camp_pass_flower_language,
        {ver = 1,
         rank = 0,
         flower_state = [],
         final_reward_flag = 0}).

-record(camp_pass_flower_language_role,
        {rid, camp_id, day, rank, double_reward}).

-record(camp_pass_flower_language_state,
        {id = {0, 0},
         flower_pass_time,
         finish_num,
         final_reward}).

-file("src/mod/campaign/camp_pass_flower_language.erl",
      63).

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

-file("src/mod/campaign/camp_pass_flower_language.erl",
      64).

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

-file("src/mod/campaign/camp_pass_flower_language.erl",
      65).

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

-file("src/mod/campaign/camp_pass_flower_language.erl",
      66).

-file("inc/group.hrl", 1).

-record(member,
        {pid :: undefined | pid(),
         conn_pid :: undefined | pid()}).

-file("src/mod/campaign/camp_pass_flower_language.erl",
      67).

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

-file("src/mod/campaign/camp_pass_flower_language.erl",
      68).

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

-file("src/mod/campaign/camp_pass_flower_language.erl",
      69).

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

-file("src/mod/campaign/camp_pass_flower_language.erl",
      70).

init() ->
    FlowerList =
        camp_pass_flower_language_data:get_flower_list(),
    FlowerStateList = to_state_list(FlowerList, []),
    #m_camp_pass_flower_language{flower_state =
                                     FlowerStateList}.

start_link() ->
    gen_fsm:start_link({local, camp_pass_flower_language},
                       camp_pass_flower_language,
                       [],
                       []).

zero_flush(Role = #role{id = Rid,
                        m_camp_pass_flower_language =
                            #m_camp_pass_flower_language{flower_state =
                                                             FlowerState,
                                                         final_reward_flag =
                                                             FinalRewardFlag}},
           _) ->
    send_flush_not_get_reward(FlowerState, Role),
    case check_finish_pass(FlowerState) of
        true ->
            case FinalRewardFlag of
                0 ->
                    #{title := Title, content := Content} =
                        camp_pass_flower_language_data:get_text(3),
                    [Reward | _] =
                        camp_pass_flower_language_data:get_final_reward(),
                    RewardNum = case check_double_reward(Rid) of
                                    true -> 2;
                                    _ -> 1
                                end,
                    mail:send(Role, Title, Content, [{Reward, RewardNum}]);
                _ -> ok
            end;
        _ -> ok
    end,
    {ok, Role#role{m_camp_pass_flower_language = init()}}.

repair() -> camp_pass_flower_language ! repair.

info(Info) -> camp_pass_flower_language ! Info.

sync_event(Event) ->
    gen_fsm:sync_send_all_state_event(camp_pass_flower_language,
                                      Event).

cast(Event) ->
    gen_fsm:send_all_state_event(camp_pass_flower_language,
                                 Event).

calc_flower_num() ->
    {ok, RList} = role_group:members(world),
    _NumList = do_calc_flower_num(RList, []),
    logger:debug("~w",
                 [_NumList],
                 camp_pass_flower_language,
                 121),
    ok.

do_calc_flower_num([], NumList) -> NumList;
do_calc_flower_num([#member{pid = Pid} | T], NumList) ->
    case role:apply(sync,
                    Pid,
                    {camp_pass_flower_language,
                     apply_calc_flower_num,
                     [NumList]})
        of
        {ok, NewNumList} -> do_calc_flower_num(T, NewNumList);
        _ -> do_calc_flower_num(T, NumList)
    end.

apply_calc_flower_num(_Role =
                          #role{m_camp_pass_flower_language =
                                    #m_camp_pass_flower_language{flower_state =
                                                                     FlowerState}},
                      NumList) ->
    NewNumList = do_add_calc_flower_list(FlowerState,
                                         NumList),
    {ok, {ok, NewNumList}}.

do_add_calc_flower_list([], NumList) -> NumList;
do_add_calc_flower_list([{FlowerId, FlowerState} | T],
                        NumList) ->
    NewNumList = case FlowerState of
                     1 ->
                         case lists:keyfind(FlowerId, 1, NumList) of
                             {_, FlowerNum} ->
                                 lists:keystore(FlowerId,
                                                1,
                                                NumList,
                                                {FlowerId, FlowerNum + 1});
                             _ ->
                                 lists:keystore(FlowerId,
                                                1,
                                                NumList,
                                                {FlowerId, 1})
                         end;
                     _ -> NumList
                 end,
    do_add_calc_flower_list(T, NewNumList).

push_info(Role = #role{m_camp_pass_flower_language =
                           #m_camp_pass_flower_language{rank = Rank,
                                                        flower_state =
                                                            FlowerState,
                                                        final_reward_flag =
                                                            FinalRewardFlag}}) ->
    {FinishNum, FlowerPassNum} = case sync_event(info) of
                                     {FinishPassNum, FlowerFinishNum} ->
                                         {FinishPassNum, FlowerFinishNum};
                                     _ -> {0, []}
                                 end,
    NewFlowerState = to_push_flower_state(FlowerState,
                                          FlowerPassNum,
                                          []),
    Data = {NewFlowerState,
            FinalRewardFlag,
            FinishNum,
            Rank},
    role:link_send(Role, 20451, Data),
    ok.

push_friend(Role, FlowerId) ->
    List = friend:list(Role),
    PushList = check_friend(List, FlowerId, []),
    role:link_send(Role, 20455, {PushList}),
    ok.

check_friend([], _FlowerId, List) -> List;
check_friend([{#friendship{},
               #friend_role{id = Rid = {Id, Platform, ZoneId},
                            name = Name, lev = Lev, online = Online}}
              | T],
             FlowerId, List) ->
    case Online =:= 1 andalso Lev >= 30 of
        true ->
            case role:apply(sync,
                            Rid,
                            {camp_pass_flower_language,
                             check_flower,
                             [FlowerId]})
                of
                true ->
                    check_friend(T,
                                 FlowerId,
                                 [{Id, Platform, ZoneId, Name} | List]);
                _ -> check_friend(T, FlowerId, List)
            end;
        _ -> check_friend(T, FlowerId, List)
    end.

reward(Role = #role{m_camp_pass_flower_language =
                        MCampPassFlowerLanguage =
                            #m_camp_pass_flower_language{flower_state =
                                                             FlowerState}},
       1, FlowerId) ->
    case lists:keyfind(FlowerId, 1, FlowerState) of
        {_, 0} -> {false, lang:get("未获得该花")};
        {_, 1} -> {false, lang:get("未传递该花")};
        {_, 3} -> {false, lang:get("已领取过该奖励")};
        {_, 2} ->
            case
                camp_pass_flower_language_data:get_flower_info(FlowerId)
                of
                #{reward := RewardId} ->
                    NewFlowerState = lists:keystore(FlowerId,
                                                    1,
                                                    FlowerState,
                                                    {FlowerId, 3}),
                    NewMCampPassFlowerLanguage =
                        MCampPassFlowerLanguage#m_camp_pass_flower_language{flower_state
                                                                                =
                                                                                NewFlowerState},
                    NewRole = Role#role{m_camp_pass_flower_language =
                                            NewMCampPassFlowerLanguage},
                    Reward = [{RewardId, 1}],
                    Gain = format:val_to_gain(Reward),
                    case role_gain:do_notice(Gain, NewRole) of
                        {ok, Role1} -> {ok, lang:get(""), Role1};
                        _ ->
                            #{title := Title, content := Content} =
                                camp_pass_flower_language_data:get_text(2),
                            mail:send(NewRole, Title, Content, Reward),
                            {ok, lang:get("背包已满，奖励已通过邮件发放"), NewRole}
                    end;
                _ -> {false, lang:get("奖励不存在")}
            end;
        _ -> {false, lang:get("数据异常")}
    end;
reward(Role = #role{id = Rid,
                    m_camp_pass_flower_language =
                        MCampPassFlowerLanguage =
                            #m_camp_pass_flower_language{flower_state =
                                                             FlowerState,
                                                         final_reward_flag =
                                                             FinalRewardFlag}},
       2, _Id) ->
    case check_finish_pass(FlowerState) of
        true ->
            case FinalRewardFlag of
                0 ->
                    case camp_pass_flower_language_data:get_final_reward()
                        of
                        [RewardId | _] ->
                            RewardNum = case check_double_reward(Rid) of
                                            true ->
                                                info(final_reward),
                                                notice:send(Role,
                                                            1,
                                                            lang:get("幸运爆棚！恭喜获得鲸鱼公主的祝福获得了双倍奖励{face_1,38}")),
                                                2;
                                            _ -> 1
                                        end,
                            Reward = [{RewardId, RewardNum}],
                            Gain = format:val_to_gain(Reward),
                            NewMCampPassFlowerLanguage =
                                MCampPassFlowerLanguage#m_camp_pass_flower_language{final_reward_flag
                                                                                        =
                                                                                        1},
                            Role1 = Role#role{m_camp_pass_flower_language =
                                                  NewMCampPassFlowerLanguage},
                            OldCampRole = case
                                              ets:lookup(camp_pass_flower_language_role,
                                                         Rid)
                                              of
                                              [CampRole =
                                                   #camp_pass_flower_language_role{}
                                               | _] ->
                                                  CampRole;
                                              _ ->
                                                  #camp_pass_flower_language_role{rid
                                                                                      =
                                                                                      Rid,
                                                                                  camp_id
                                                                                      =
                                                                                      get_camp_id(),
                                                                                  day
                                                                                      =
                                                                                      get_camp_day(),
                                                                                  rank
                                                                                      =
                                                                                      0}
                                          end,
                            save_role(OldCampRole#camp_pass_flower_language_role{double_reward
                                                                                     =
                                                                                     RewardNum}),
                            case role_gain:do_notice(Gain, Role1) of
                                {ok, Role2} -> {ok, lang:get(""), Role2};
                                _ ->
                                    #{title := Title, content := Content} =
                                        camp_pass_flower_language_data:get_text(2),
                                    mail:send(Role1, Title, Content, Reward),
                                    {ok, lang:get("背包已满，奖励已通过邮件发放"), Role1}
                            end;
                        _ -> {false, lang:get("数据配置出错")}
                    end;
                _ -> {false, lang:get("不能重复领取该奖励")}
            end;
        _ -> {false, lang:get("您还未传递所有花哦")}
    end;
reward(_Role, _RewardType, _RewardId) ->
    logger:debug("~w",
                 [{_RewardType, _RewardId}],
                 camp_pass_flower_language,
                 266),
    Msg = lang:get("数据错误"),
    {false, Msg}.

pass_flower(Role = #role{id = Rid,
                         m_camp_pass_flower_language =
                             MCampPassFlowerLanguage =
                                 #m_camp_pass_flower_language{rank = OldRank,
                                                              flower_state =
                                                                  FlowerState}},
            FlowerId, RecRoleId) ->
    case lists:keyfind(FlowerId, 1, FlowerState) of
        {_, 1} ->
            case role:apply(sync,
                            RecRoleId,
                            {camp_pass_flower_language,
                             check_flower,
                             [FlowerId]})
                of
                true ->
                    case role:apply(sync,
                                    RecRoleId,
                                    {camp_pass_flower_language,
                                     receive_flower,
                                     [Role, {FlowerId, 1}]})
                        of
                        ok ->
                            Role1 = role_timer:del(FlowerId, Role),
                            cast({add_pass_times, FlowerId}),
                            NewFlowerState = lists:keystore(FlowerId,
                                                            1,
                                                            FlowerState,
                                                            {FlowerId, 2}),
                            NewRank = case check_finish_pass(NewFlowerState) of
                                          true ->
                                              Rank = sync_event({finish, Rid}),
                                              Rank;
                                          _ -> OldRank
                                      end,
                            NewMCampFlowerLanguage =
                                MCampPassFlowerLanguage#m_camp_pass_flower_language{rank
                                                                                        =
                                                                                        NewRank,
                                                                                    flower_state
                                                                                        =
                                                                                        NewFlowerState},
                            NewRole = Role1#role{m_camp_pass_flower_language =
                                                     NewMCampFlowerLanguage},
                            {ok, lang:get("已成功将花朵传递给好友了哟{face_1,9}"), NewRole};
                        _Reason -> {false, lang:get("对方已拥有或已传递这朵花了哟{face_1,6}")}
                    end;
                _ -> {false, lang:get("对方已拥有或已传递这朵花了哟{face_1,6}")}
            end;
        _ -> {false, lang:get("未获得这朵美丽的花儿哟，快去获得吧{face_1,3}")}
    end.

apply_flower_timeout(Role =
                         #role{m_camp_pass_flower_language =
                                   MCampPassFlowerLanguage =
                                       #m_camp_pass_flower_language{flower_state
                                                                        =
                                                                        FlowerState}},
                     FlowerId) ->
    case lists:keyfind(FlowerId, 1, FlowerState) of
        {_, 1} ->
            Zero = date:unixtime(zero),
            Time = date:unixtime(),
            case Time - Zero > 60 * 60 of
                true ->
                    info({flower_timeout, FlowerId}),
                    NewFlowerState1 = lists:keystore(FlowerId,
                                                     1,
                                                     FlowerState,
                                                     {FlowerId, 0}),
                    NewRole1 = Role#role{m_camp_pass_flower_language =
                                             MCampPassFlowerLanguage#m_camp_pass_flower_language{flower_state
                                                                                                     =
                                                                                                     NewFlowerState1}},
                    {remove, NewRole1};
                _ ->
                    NewFlowerState2 = lists:keystore(FlowerId,
                                                     1,
                                                     FlowerState,
                                                     {FlowerId, 0}),
                    NewRole2 = Role#role{m_camp_pass_flower_language =
                                             MCampPassFlowerLanguage#m_camp_pass_flower_language{flower_state
                                                                                                     =
                                                                                                     NewFlowerState2}},
                    {remove, NewRole2}
            end;
        _ -> {remove, Role}
    end.

check_flower(#role{m_camp_pass_flower_language =
                       #m_camp_pass_flower_language{flower_state =
                                                        FlowerState}},
             FlowerId) ->
    case lists:keyfind(FlowerId, 1, FlowerState) of
        {_, 1} -> {ok, false};
        {_, 2} -> {ok, false};
        {_, 3} -> {ok, false};
        _ -> {ok, true}
    end.

send_notice_mail(Role = #role{}, Type) ->
    #{title := Title, content := Content} =
        camp_pass_flower_language_data:get_text(Type),
    mail:send(Role, Title, Content).

receive_flower(Role = #role{lev = Lev,
                            m_camp_pass_flower_language =
                                MCampPassFlowerLanguage =
                                    #m_camp_pass_flower_language{flower_state =
                                                                     FlowerState}},
               {FlowerId, Type}) ->
    case Lev >= 30 of
        true ->
            case lists:keyfind(FlowerId, 1, FlowerState) of
                {_, 0} ->
                    NewFlowerState = lists:keystore(FlowerId,
                                                    1,
                                                    FlowerState,
                                                    {FlowerId, 1}),
                    [TimeoutMin | _] =
                        camp_pass_flower_language_data:get_cfg(),
                    NewRole = role_timer:add(#timer{id = FlowerId,
                                                    timeout =
                                                        TimeoutMin * 60 * 1000,
                                                    m =
                                                        camp_pass_flower_language,
                                                    f = apply_flower_timeout,
                                                    a = [FlowerId], times = 1},
                                             Role),
                    NewMCampPassFlowerLanguage =
                        MCampPassFlowerLanguage#m_camp_pass_flower_language{flower_state
                                                                                =
                                                                                NewFlowerState},
                    Data = {lang:get("神秘人"), FlowerId, TimeoutMin, Type},
                    case Type =:= 0 of
                        true ->
                            notice:send(NewRole,
                                        1,
                                        lang:get("恭喜获得鲸鱼公主带来的充满祝福的花朵！{face_1,18}"));
                        _ -> ok
                    end,
                    role:link_send(NewRole, 20454, Data),
                    {ok,
                     ok,
                     NewRole#role{m_camp_pass_flower_language =
                                      NewMCampPassFlowerLanguage}};
                {_, _} -> {ok, true};
                _ -> {ok, false}
            end;
        _ -> {ok, false}
    end.

receive_flower(Role = #role{lev = Lev,
                            m_camp_pass_flower_language =
                                MCampPassFlowerLanguage =
                                    #m_camp_pass_flower_language{flower_state =
                                                                     FlowerState}},
               _PassRole = #role{name = Name}, {FlowerId, Type}) ->
    case Lev >= 30 of
        true ->
            case lists:keyfind(FlowerId, 1, FlowerState) of
                {_, 0} ->
                    NewFlowerState = lists:keystore(FlowerId,
                                                    1,
                                                    FlowerState,
                                                    {FlowerId, 1}),
                    [TimeoutMin | _] =
                        camp_pass_flower_language_data:get_cfg(),
                    NewRole1 = role_timer:add(#timer{id = FlowerId,
                                                     timeout =
                                                         TimeoutMin * 60 * 1000,
                                                     m =
                                                         camp_pass_flower_language,
                                                     f = apply_flower_timeout,
                                                     a = [FlowerId], times = 1},
                                              Role),
                    NewMCampPassFlowerLanguage =
                        MCampPassFlowerLanguage#m_camp_pass_flower_language{flower_state
                                                                                =
                                                                                NewFlowerState},
                    NewRole2 = NewRole1#role{m_camp_pass_flower_language =
                                                 NewMCampPassFlowerLanguage},
                    Data = {Name, FlowerId, TimeoutMin, Type},
                    NewRole4 = case buff:add_and_calc(NewRole2, 21102) of
                                   {ok, NewRole3} -> NewRole3;
                                   {false, _Reason1} -> NewRole2
                               end,
                    NewRole6 = case buff:add_and_calc(NewRole4, 23102) of
                                   {ok, NewRole5} -> NewRole5;
                                   {false, _Reason2} -> NewRole4
                               end,
                    buff:push_show(NewRole6),
                    role:link_send(NewRole6, 20454, Data),
                    {ok, ok, NewRole6};
                _ -> {ok, false}
            end;
        _ -> {ok, false}
    end.

gm_add_flower(Role = #role{m_camp_pass_flower_language =
                               MCampPassFlowerLanguage =
                                   #m_camp_pass_flower_language{flower_state =
                                                                    FlowerState}},
              FlowerId) ->
    NewFlowerState = lists:keystore(FlowerId,
                                    1,
                                    FlowerState,
                                    {FlowerId, 1}),
    NewMCampFlowerLanguage =
        MCampPassFlowerLanguage#m_camp_pass_flower_language{flower_state
                                                                =
                                                                NewFlowerState},
    NewRole1 = Role#role{m_camp_pass_flower_language =
                             NewMCampFlowerLanguage},
    [TimeoutMin | _] =
        camp_pass_flower_language_data:get_cfg(),
    NewRole2 = role_timer:set(#timer{id = FlowerId,
                                     timeout = TimeoutMin * 60 * 1000,
                                     m = camp_pass_flower_language,
                                     f = apply_flower_timeout, a = [FlowerId],
                                     times = 1},
                              NewRole1),
    {ok, NewRole2}.

init([]) ->
    process_flag(trap_exit, true),
    {StateName, CampId, TimeLeft} = get_idle_time(),
    Day = case StateName of
              active -> get_camp_day();
              _ -> 0
          end,
    Ref = case StateName of
              active ->
                  SendFlowerList =
                      camp_pass_flower_language_data:get_send_flower_list(),
                  DaySendList = get_day_list(SendFlowerList, Day, []),
                  {SendId, NextTime} = get_next_send_id(DaySendList),
                  erlang:send_after(NextTime * 1000,
                                    self(),
                                    {send_flower, SendId});
              _ ->
                  SendId = 1,
                  #{send_time := [SendTime | _]} =
                      camp_pass_flower_language_data:get_send_flower_times(SendId),
                  NextTime = date:next_diff(SendTime),
                  erlang:send_after(NextTime * 1000,
                                    self(),
                                    {senf_flower, SendId})
          end,
    dets:open_file(camp_pass_flower_language_role,
                   [{file, "./dets/camp_pass_flower_language_role.dets"},
                    {type, set},
                    {keypos, #camp_pass_flower_language_role.rid}]),
    ets:new(camp_pass_flower_language_role,
            [set,
             named_table,
             public,
             {keypos, #camp_pass_flower_language_role.rid}]),
    dets:to_ets(camp_pass_flower_language_role,
                camp_pass_flower_language_role),
    dets:open_file(camp_pass_flower_language_state,
                   [{file, "./dets/camp_pass_flower_language_state.dets"},
                    {type, set},
                    {keypos, #camp_pass_flower_language_state.id}]),
    ets:new(camp_pass_flower_language_state,
            [set,
             named_table,
             public,
             {keypos, #camp_pass_flower_language_state.id}]),
    dets:to_ets(camp_pass_flower_language_state,
                camp_pass_flower_language_state),
    CfgFinalReward =
        camp_pass_flower_language_data:get_double_reward_info(),
    {NewFlowerPassTime, NewFinishNum, FinalReward} = case
                                                         StateName
                                                         of
                                                         active ->
                                                             case
                                                                 ets:lookup(camp_pass_flower_language_state,
                                                                            {CampId,
                                                                             Day})
                                                                 of
                                                                 [#camp_pass_flower_language_state{flower_pass_time
                                                                                                       =
                                                                                                       OldFlowerPassTime,
                                                                                                   finish_num
                                                                                                       =
                                                                                                       OldFinishNum,
                                                                                                   final_reward
                                                                                                       =
                                                                                                       OldFinalReward}
                                                                  | _] ->
                                                                     {OldFlowerPassTime,
                                                                      OldFinishNum,
                                                                      OldFinalReward};
                                                                 [] ->
                                                                     FlowerList =
                                                                         camp_pass_flower_language_data:get_flower_list(),
                                                                     FlowerPassTime =
                                                                         [{FlowerId,
                                                                           0}
                                                                          || FlowerId
                                                                                 <- FlowerList],
                                                                     {FlowerPassTime,
                                                                      0,
                                                                      CfgFinalReward}
                                                             end;
                                                         _ ->
                                                             FlowerList =
                                                                 camp_pass_flower_language_data:get_flower_list(),
                                                             FlowerPassTime =
                                                                 [{FlowerId, 0}
                                                                  || FlowerId
                                                                         <- FlowerList],
                                                             {FlowerPassTime,
                                                              0,
                                                              CfgFinalReward}
                                                     end,
    NewInfo = #camp_pass_flower_language_state{id =
                                                   {CampId, Day},
                                               flower_pass_time =
                                                   NewFlowerPassTime,
                                               finish_num = NewFinishNum,
                                               final_reward = FinalReward},
    save_state(NewInfo),
    State = #state{id = CampId, ts = date:now2(),
                   timeout = TimeLeft, finish_pass_num = NewFinishNum,
                   flower_pass_times = NewFlowerPassTime,
                   send_flower_ref = Ref, final_reward = FinalReward},
    {ok, StateName, State, TimeLeft}.

handle_event({add_pass_times, FlowerId}, active,
             State = #state{flower_pass_times = FlowerPassTime}) ->
    NewFlowerPassTime = case lists:keyfind(FlowerId,
                                           1,
                                           FlowerPassTime)
                            of
                            {_, PassTime} ->
                                AddRandNum = util:rand(1, 3),
                                lists:keystore(FlowerId,
                                               1,
                                               FlowerPassTime,
                                               {FlowerId,
                                                PassTime + AddRandNum});
                            _ -> FlowerPassTime
                        end,
    Id = {get_camp_id(), get_camp_day()},
    [OldData = #camp_pass_flower_language_state{} | _] =
        ets:lookup(camp_pass_flower_language_state, Id),
    NewData =
        OldData#camp_pass_flower_language_state{flower_pass_time
                                                    = NewFlowerPassTime},
    save_state(NewData),
    NewState = State#state{flower_pass_times =
                               NewFlowerPassTime},
    continue(active, NewState);
handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event({finish, Rid}, _From, active,
                  State = #state{finish_pass_num = FinishPassNum}) ->
    Reply = FinishPassNum + 1,
    CampId = get_camp_id(),
    Day = get_camp_day(),
    NewRoleData = #camp_pass_flower_language_role{rid = Rid,
                                                  camp_id = CampId, day = Day,
                                                  rank = Reply,
                                                  double_reward = 0},
    save_role(NewRoleData),
    [OldData = #camp_pass_flower_language_state{} | _] =
        ets:lookup(camp_pass_flower_language_state,
                   {CampId, Day}),
    NewData =
        OldData#camp_pass_flower_language_state{finish_num =
                                                    Reply},
    save_state(NewData),
    continue(Reply,
             active,
             State#state{finish_pass_num = Reply});
handle_sync_event(info, _From, StateName,
                  State = #state{finish_pass_num = FinishPassNum,
                                 flower_pass_times = FlowerPassNum}) ->
    Reply = {FinishPassNum, FlowerPassNum},
    continue(Reply, StateName, State);
handle_sync_event(_Event, _From, StateName, State) ->
    Reply = ok,
    continue(Reply, StateName, State).

handle_info(repair, StateName, State = #state{}) ->
    {_NewStateName, CampId, _TimeLeft} = get_idle_time(),
    Day = get_camp_day(),
    CfgFinalReward =
        camp_pass_flower_language_data:get_double_reward_info(),
    NewState = State#state{finish_pass_num = 0},
    {NewFlowerPassTime, _NewFinishNum, NewFinalReward} =
        case ets:lookup(camp_pass_flower_language_state,
                        {CampId, Day})
            of
            [#camp_pass_flower_language_state{flower_pass_time =
                                                  OldFlowerPassTime,
                                              finish_num = OldFinishNum,
                                              final_reward = OldFinalReward}
             | _] ->
                {OldFlowerPassTime, OldFinishNum, OldFinalReward};
            [] ->
                FlowerList =
                    camp_pass_flower_language_data:get_flower_list(),
                FlowerPassTime = [{FlowerId, 0}
                                  || FlowerId <- FlowerList],
                {FlowerPassTime, 0, CfgFinalReward}
        end,
    save_state(#camp_pass_flower_language_state{id =
                                                    {CampId, Day},
                                                flower_pass_time =
                                                    NewFlowerPassTime,
                                                finish_num = 0,
                                                final_reward = NewFinalReward}),
    continue(StateName, NewState);
handle_info(reload, _StateName,
            State = #state{send_flower_ref = OldRef}) ->
    {NewStateName, CampId, TimeLeft} = get_idle_time(),
    {StartTime, EndTime} = get_camp_time(),
    Now = date:unixtime(),
    CfgFinalReward =
        camp_pass_flower_language_data:get_double_reward_info(),
    case StartTime =< Now andalso Now =< EndTime of
        true ->
            case erlang:is_reference(OldRef) of
                true -> erlang:cancel_timer(OldRef);
                _ -> ok
            end,
            Day = get_camp_day(),
            SendFlowerList =
                camp_pass_flower_language_data:get_send_flower_list(),
            DaySendList = get_day_list(SendFlowerList, Day, []),
            {SendId, NextTime} = get_next_send_id(DaySendList),
            Ref = erlang:send_after(NextTime * 1000,
                                    self(),
                                    {send_flower, SendId}),
            {NewFlowerPassTime, NewFinishNum, NewFinalReward} = case
                                                                    ets:lookup(camp_pass_flower_language_state,
                                                                               {CampId,
                                                                                Day})
                                                                    of
                                                                    [#camp_pass_flower_language_state{flower_pass_time
                                                                                                          =
                                                                                                          OldFlowerPassTime,
                                                                                                      finish_num
                                                                                                          =
                                                                                                          OldFinishNum,
                                                                                                      final_reward
                                                                                                          =
                                                                                                          OldFinalReward}
                                                                     | _] ->
                                                                        {OldFlowerPassTime,
                                                                         OldFinishNum,
                                                                         OldFinalReward};
                                                                    [] ->
                                                                        FlowerList =
                                                                            camp_pass_flower_language_data:get_flower_list(),
                                                                        FlowerPassTime =
                                                                            [{FlowerId,
                                                                              0}
                                                                             || FlowerId
                                                                                    <- FlowerList],
                                                                        {FlowerPassTime,
                                                                         0,
                                                                         CfgFinalReward}
                                                                end,
            save_state(#camp_pass_flower_language_state{id =
                                                            {CampId, Day},
                                                        flower_pass_time =
                                                            NewFlowerPassTime,
                                                        finish_num =
                                                            NewFinishNum,
                                                        final_reward =
                                                            NewFinalReward}),
            continue(NewStateName,
                     #state{id = CampId, ts = date:now2(),
                            timeout = TimeLeft, finish_pass_num = NewFinishNum,
                            flower_pass_times = NewFlowerPassTime,
                            send_flower_ref = Ref,
                            final_reward = NewFinalReward});
        _ ->
            continue(NewStateName,
                     State#state{ts = date:now2(), timeout = TimeLeft})
    end;
handle_info({send_flower, SendId}, active, State) ->
    case
        camp_pass_flower_language_data:get_send_flower_times(SendId)
        of
        #{flower := FlowerList} ->
            send_flower(FlowerList),
            Msg =
                lang:get("鲜花飘飘，萌萌的鲸鱼公主给部分幸运儿送来了代表祝福的花朵，大家快去传递吧！将满满的祝福传遍星辰"),
            notice:cast(all, 5, Msg);
        _ -> ok
    end,
    Day = get_camp_day(),
    SendFlowerList =
        camp_pass_flower_language_data:get_send_flower_list(),
    DaySendList = get_day_list(SendFlowerList, Day, []),
    {NewSendId, NextTime} = get_next_send_id(DaySendList),
    Ref = erlang:send_after(NextTime * 1000,
                            self(),
                            {send_flower, NewSendId}),
    continue(active, State#state{send_flower_ref = Ref});
handle_info({flower_timeout, FlowerId}, active,
            State) ->
    send_timeout_flower(FlowerId),
    continue(active, State);
handle_info(final_reward, active,
            State = #state{final_reward = FinalReward}) ->
    CampId = get_camp_id(),
    Day = get_camp_day(),
    NewFinalReward = case
                         ets:lookup(camp_pass_flower_language_state,
                                    {CampId, Day})
                         of
                         [#camp_pass_flower_language_state{final_reward =
                                                               StateFinalReward}
                          | _] ->
                             StateFinalReward;
                         _ -> FinalReward
                     end,
    continue(active,
             State#state{final_reward = NewFinalReward});
handle_info(_Info, StateName, State) ->
    continue(StateName, State).

terminate(_Reason, _StateName, _State) -> ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

idle(timeout, State) -> idle_active_timeout(State);
idle(_Event, State) -> continue(idle, State).

active(timeout, State) -> idle_active_timeout(State);
active(_Event, State) -> continue(active, State).

idle_active_timeout(State = #state{send_flower_ref =
                                       OldRef}) ->
    {StateName, CampId, TimeLeft} = get_idle_time(),
    Day = case StateName of
              active -> get_camp_day();
              _ -> 0
          end,
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    Ref = case StateName of
              active ->
                  SendFlowerList =
                      camp_pass_flower_language_data:get_send_flower_list(),
                  DaySendList = get_day_list(SendFlowerList, Day, []),
                  {SendId, NextTime} = get_next_send_id(DaySendList),
                  erlang:send_after(NextTime * 1000,
                                    self(),
                                    {send_flower, SendId});
              _ -> undefined
          end,
    CfgFinalReward =
        camp_pass_flower_language_data:get_double_reward_info(),
    NewState = case StateName of
                   active ->
                       FlowerList =
                           camp_pass_flower_language_data:get_flower_list(),
                       FlowerPassTime = [{FlowerId, 0}
                                         || FlowerId <- FlowerList],
                       StateInfo = #camp_pass_flower_language_state{id =
                                                                        {CampId,
                                                                         Day},
                                                                    flower_pass_time
                                                                        =
                                                                        FlowerPassTime,
                                                                    finish_num =
                                                                        0,
                                                                    final_reward
                                                                        =
                                                                        CfgFinalReward},
                       save_state(StateInfo),
                       #state{id = CampId, ts = date:now2(),
                              timeout = TimeLeft, finish_pass_num = 0,
                              flower_pass_times = FlowerPassTime,
                              send_flower_ref = Ref,
                              final_reward = CfgFinalReward};
                   _ -> State#state{ts = date:now2(), timeout = TimeLeft}
               end,
    continue(StateName, NewState).

get_idle_time() ->
    CampId = get_camp_id(),
    {StartTime, EndTime} = get_camp_time(),
    Now = date:unixtime(),
    case StartTime =< Now andalso Now =< EndTime of
        true ->
            {active, CampId, max((EndTime - Now) * 1000, 1000)};
        _ -> {idle, CampId, date:next_diff(0) * 1000}
    end.

get_camp_day() ->
    {StartTime, _} = get_camp_time(),
    date:day_diff(StartTime, date:unixtime2()) + 1.

get_camp_time() -> campaign_mgr:get_camp_time(60049).

get_camp_id() -> campaign_mgr:get_camp_id(60049).

get_day_list([], _Day, DayList) -> DayList;
get_day_list([SendId | LeftList], Day, DayList) ->
    case
        camp_pass_flower_language_data:get_send_flower_times(SendId)
        of
        #{day := Day, send_time := [SendTime | _]} ->
            get_day_list(LeftList,
                         Day,
                         [{SendId, SendTime} | DayList]);
        _ -> get_day_list(LeftList, Day, DayList)
    end.

get_next_send_id(DayList) ->
    TimeList = [{SendId, date:next_diff(SendTime)}
                || {SendId, SendTime} <- DayList],
    get_next_send_id(TimeList, 0, 0).

get_next_send_id([], DiffTime, SendId) ->
    {SendId, DiffTime};
get_next_send_id([{SendId, DiffTime} | TimeList],
                 OldDiffTime, OldSendId) ->
    case OldSendId =:= 0 of
        true -> get_next_send_id(TimeList, DiffTime, SendId);
        _ ->
            case DiffTime < OldDiffTime of
                true -> get_next_send_id(TimeList, DiffTime, SendId);
                _ -> get_next_send_id(TimeList, OldDiffTime, OldSendId)
            end
    end.

send_timeout_flower(FlowerId) ->
    {ok, RList} = role_group:members(world),
    NewRList = check_flower_role_list(RList, FlowerId),
    do_send_timeout_flower(NewRList, FlowerId).

do_send_timeout_flower([], _FlowerId) -> ok;
do_send_timeout_flower(RList, FlowerId) ->
    #member{pid = Pid} = util:rand_list(RList),
    NewRList = lists:keydelete(Pid, #member.pid, RList),
    case role:apply(sync,
                    Pid,
                    {camp_pass_flower_language,
                     receive_flower,
                     [{FlowerId, 1}]})
        of
        ok ->
            role:apply(async,
                       Pid,
                       {camp_pass_flower_language, send_notice_mail, [5]}),
            ok;
        _ -> do_send_timeout_flower(NewRList, FlowerId)
    end.

send_flower(FlowerList) ->
    {ok, RList} = role_group:members(world),
    send_flower(FlowerList, RList).

send_flower([], _RList) -> ok;
send_flower([{FlowerId, FlowerNum} | LeftFlower],
            RList) ->
    NewRList = do_send_flower(RList,
                              FlowerNum,
                              FlowerId,
                              []),
    send_flower(LeftFlower, NewRList).

do_send_flower([], _FlowerNum, _FlowerId, NewRList) ->
    NewRList;
do_send_flower(RList, 0, _FlowerId, NewRList) ->
    RList ++ NewRList;
do_send_flower(RList, FlowerNum, FlowerId, ResRList) ->
    Member = #member{pid = Pid} = util:rand_list(RList),
    NewRList = lists:keydelete(Pid, #member.pid, RList),
    case role:apply(sync,
                    Pid,
                    {camp_pass_flower_language,
                     receive_flower,
                     [{FlowerId, 0}]})
        of
        ok ->
            role:apply(async,
                       Pid,
                       {camp_pass_flower_language, send_notice_mail, [4]}),
            do_send_flower(NewRList,
                           FlowerNum - 1,
                           FlowerId,
                           ResRList);
        true ->
            do_send_flower(NewRList,
                           FlowerNum,
                           FlowerId,
                           [Member | ResRList]);
        _ ->
            do_send_flower(NewRList, FlowerNum, FlowerId, ResRList)
    end.

send_flush_not_get_reward([], _Role) -> ok;
send_flush_not_get_reward([{FlowerId, FlowerState}
                           | FlowerList],
                          Role) ->
    case FlowerState of
        2 ->
            #{title := Title, content := Content} =
                camp_pass_flower_language_data:get_text(3),
            #{reward := Reward} =
                camp_pass_flower_language_data:get_flower_info(FlowerId),
            mail:send(Role, Title, Content, [{Reward, 1}]);
        _ -> ok
    end,
    send_flush_not_get_reward(FlowerList, Role).

check_flower_role_list(RList, FlowerId) ->
    do_check_flower_role_list(RList, FlowerId, []).

do_check_flower_role_list([], _FlowerId, NewList) ->
    NewList;
do_check_flower_role_list([Member = #member{pid = Pid}
                           | LeftList],
                          FlowerId, NewList) ->
    case role:apply(sync,
                    Pid,
                    {camp_pass_flower_language, check_flower, [FlowerId]})
        of
        true ->
            do_check_flower_role_list(LeftList,
                                      FlowerId,
                                      [Member | NewList]);
        _Reason ->
            do_check_flower_role_list(LeftList, FlowerId, NewList)
    end.

check_finish_pass([]) -> true;
check_finish_pass([{_FlowerId, FlowerState}
                   | FlowerStateList]) ->
    case FlowerState of
        3 -> check_finish_pass(FlowerStateList);
        2 -> check_finish_pass(FlowerStateList);
        _ -> false
    end.

check_double_reward(RoleId) ->
    case ets:lookup(camp_pass_flower_language_role, RoleId)
        of
        [#camp_pass_flower_language_role{camp_id = CampId,
                                         day = Day, rank = Rank,
                                         double_reward = DoubleReward}
         | _] ->
            case DoubleReward of
                0 ->
                    case ets:lookup(camp_pass_flower_language_state,
                                    {CampId, Day})
                        of
                        [CampPassFlowerLanguageState =
                             #camp_pass_flower_language_state{final_reward =
                                                                  FinalReward}
                         | _] ->
                            case do_check_double_reward(FinalReward, Rank, [])
                                of
                                {true, NewFinalReward} ->
                                    NewCampPassFlowerLanguageState =
                                        CampPassFlowerLanguageState#camp_pass_flower_language_state{final_reward
                                                                                                        =
                                                                                                        NewFinalReward},
                                    save_state(NewCampPassFlowerLanguageState),
                                    true;
                                _ -> false
                            end;
                        _ -> false
                    end;
                _ -> false
            end;
        _ -> false
    end.

do_check_double_reward([], _Rank, _FinalReward) ->
    false;
do_check_double_reward([{StartRank,
                         EndRank,
                         LeftNum,
                         Probability}
                        | T],
                       Rank, FinalReward) ->
    case StartRank =< Rank andalso Rank =< EndRank of
        true ->
            case LeftNum > 0 of
                true ->
                    case util:rand(1, 1000) =< Probability of
                        true ->
                            NewFinalReward1 = [{StartRank,
                                                EndRank,
                                                LeftNum - 1,
                                                Probability}
                                               | T],
                            NewFinalReward2 = NewFinalReward1 ++ FinalReward,
                            {true, NewFinalReward2};
                        _ -> false
                    end;
                _ -> false
            end;
        _ ->
            do_check_double_reward(T,
                                   Rank,
                                   [{StartRank, EndRank, LeftNum, Probability}
                                    | FinalReward])
    end.

save_state(Data) ->
    ets:insert(camp_pass_flower_language_state, Data),
    dets:insert(camp_pass_flower_language_state, Data).

save_role(Data) ->
    ets:insert(camp_pass_flower_language_role, Data),
    dets:insert(camp_pass_flower_language_role, Data).

to_push_flower_state([], _FlowerPassNum,
                     NewFlowerState) ->
    NewFlowerState;
to_push_flower_state([{FlowerId, FlowerState}
                      | FlowerStateList],
                     FlowerPassNum, NewFlowerState) ->
    case lists:keyfind(FlowerId, 1, FlowerPassNum) of
        {_, PassNum} ->
            to_push_flower_state(FlowerStateList,
                                 FlowerPassNum,
                                 [{FlowerId, FlowerState, PassNum}
                                  | NewFlowerState]);
        _ ->
            to_push_flower_state(FlowerStateList,
                                 FlowerPassNum,
                                 [{FlowerId, FlowerState, 0} | NewFlowerState])
    end.

to_state_list([], FlowerStateList) -> FlowerStateList;
to_state_list([FlowerId | LeftFlowerList],
              FlowerStateList) ->
    to_state_list(LeftFlowerList,
                  [{FlowerId, 0} | FlowerStateList]).

continue(StateName,
         State = #state{timeout = infinity}) ->
    {next_state, StateName, State, infinity};
continue(StateName,
         State = #state{ts = Ts, timeout = Timeout}) ->
    {next_state,
     StateName,
     State,
     util:time_left(Timeout, Ts)}.

continue(StateName, Reply,
         State = #state{timeout = infinity}) ->
    {reply, Reply, StateName, State, infinity};
continue(Reply, StateName,
         State = #state{ts = Ts, timeout = Timeout}) ->
    {reply,
     Reply,
     StateName,
     State,
     util:time_left(Timeout, Ts)}.

