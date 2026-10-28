-file("src/mod/friend/friend_recall.erl", 1).

-module(friend_recall).

-behaviour(gen_server).

-export([start_link/0, cast/1, call/1, info/1]).

-export([login/1,
         recall/3,
         recalled_reward/2,
         recall_reward/2,
         bind/2,
         add_activity/3,
         add_activity/2,
         get_activity/1,
         state_change/2,
         reset_buffs/1,
         timer_tick/1,
         apply_evt/2,
         message_push/3,
         reset_recalled/0,
         push_11879/1,
         push_11881/1,
         push_11885/1,
         push_11885/2,
         push_11886/1,
         gm_buff_change/2,
         gm_activity/2,
         gm_cancl_recall/1,
         gm_cancl_recalled/1,
         test/1]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

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

-file("src/mod/friend/friend_recall.erl", 52).

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

-file("src/mod/friend/friend_recall.erl", 53).

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

-file("src/mod/friend/friend_recall.erl", 54).

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

-file("src/mod/friend/friend_recall.erl", 55).

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

-file("src/mod/friend/friend_recall.erl", 56).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/friend/friend_recall.erl", 57).

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

-file("src/mod/friend/friend_recall.erl", 58).

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

-file("src/mod/friend/friend_recall.erl", 59).

-file("inc/buff.hrl", 1).

-record(m_buff, {ver = 2, r_list = [], show = 1}).

-record(buff_base,
        {id = 1,
         name = "",
         class = 0,
         lev = 0,
         cancel = 0,
         same_buff_mode = 0,
         type = 1,
         sub_type = 0,
         time_mode = 0,
         max_time_num = 1,
         duration = 0,
         max_effect_lev = 1,
         looks = [],
         attr = [],
         guard_attr = [],
         pet_attr = [],
         end_date = 0,
         extra = [],
         effect = [],
         dynamic_attr = [],
         pvp_limit = 0,
         desc = ""}).

-record(buff,
        {ver = 4,
         id = 1,
         class = 0,
         lev = 0,
         cancel = 0,
         type = 1,
         same_buff_mode = 0,
         time_mode = 0,
         duration = 0,
         max_duration = 1,
         effect_lev = 1,
         end_date = 0,
         start_time = 0,
         looks = [],
         dynamic_attr = [],
         pvped = 0,
         ext_param = [],
         args = 1}).

-file("src/mod/friend/friend_recall.erl", 60).

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

-file("src/mod/friend/friend_recall.erl", 61).

-file("inc/regression_login.hrl", 1).

-record(regression_login,
        {flag = 0 :: non_neg_integer(),
         reward_id = 0 :: non_neg_integer(),
         time_return = 0 :: non_neg_integer(),
         unixtime = 0 :: non_neg_integer(),
         rewards = [] :: list(),
         reward_all = 0 :: non_neg_integer()}).

-file("src/mod/friend/friend_recall.erl", 62).

-record(state, {}).

login(#role{lev = Lev}) when Lev < 70 -> ok;
login(#role{id = RoleId, name = _RoleName,
            time_info = {_TimeLogin, TimeLogout}} =
          Role0) ->
    {_, Role} = role_trigger:add([#trigger{label =
                                               evt_activity,
                                           a = [], m = friend_recall,
                                           f = apply_evt}],
                                 Role0),
    Now = date:unixtime(),
    case fetch_recalled(RoleId) of
        #friend_recalled{status = 1, lists = List} ->
            [friend_recall ! {notice_login, RecallRoleId, RoleId}
             || RecallRoleId <- List],
            Role1 = var:set_var(Role, other, 2059, 1),
            NewRole = reset_buffs(Role1),
            {ok, NewRole};
        #friend_recalled{status = 0, lists = List,
                         recall_list = List1} =
            Fr ->
            case check_time(TimeLogout) of
                true ->
                    friend_recall ! refresh_recalled,
                    save(Fr#friend_recalled{status = 1, time_return = Now,
                                            time = Now + 30 * 86400, lists = [],
                                            recall_list = List ++ List1,
                                            bind = 0, activity = 0,
                                            rewards = [],
                                            role_id_recall = {0, "", 0},
                                            role_name_recall = "",
                                            activity_id = 0, login = 1}),
                    [friend_recall ! {notice_login, RecallRoleId, RoleId}
                     || RecallRoleId <- List],
                    Role1 = var:set_var(Role, other, 2059, 1),
                    Role2 = var:set_var(Role1,
                                        other,
                                        2065,
                                        {[], 0, Now, 0}),
                    NewRole = reset_buffs(Role2),
                    {ok, NewRole};
                _ -> ok
            end;
        Fr = #friend_recalled{status = 2,
                              time_return = TimeReturn, lists = List,
                              recall_list = List1}
            when TimeReturn < 1511841600 ->
            case check_time(TimeLogout) of
                true ->
                    friend_recall ! refresh_recalled,
                    save(Fr#friend_recalled{status = 1, time_return = Now,
                                            time = Now + 30 * 86400, lists = [],
                                            recall_list = List ++ List1,
                                            bind = 0, activity = 0,
                                            rewards = [],
                                            role_id_recall = {0, "", 0},
                                            role_name_recall = "",
                                            activity_id = 0, login = 1}),
                    [friend_recall ! {notice_login, RecallRoleId, RoleId}
                     || RecallRoleId <- List],
                    Role1 = var:set_var(Role, other, 2059, 1),
                    Role2 = var:set_var(Role1,
                                        other,
                                        2065,
                                        {[], 0, Now, 0}),
                    NewRole = reset_buffs(Role2),
                    {ok, NewRole};
                _ -> ok
            end;
        _ ->
            Role1 = reset_buffs(Role),
            {ok, var:set_var(Role1, other, 2059, 0)}
    end.

recall(#role{id = RoleId = {_Id, _Platform, _ZoneId},
             name = RoleName} =
           Role,
       ToRoleId, Pos) ->
    Reasult = case friend:fetch(by_id, ToRoleId) of
                  #friend_role{lev = Lev} when Lev < 70 ->
                      {false, lang:get("好友等级不足70")};
                  #friend_role{online_time = OnlineTime,
                               name = ToRoleName} ->
                      case check_time(OnlineTime) of
                          true -> {ok, ToRoleName};
                          _ -> {false, lang:get("该好友离线不足8天,不能招募")}
                      end;
                  _ -> {false, lang:get("该玩家不是你好友,不能招募")}
              end,
    case Reasult of
        {ok, ToRoleName1} ->
            case fetch(Role) of
                #friend_recall{id = Id, lists = List,
                               lists_time = ListTime} =
                    FriendRecall ->
                    case lists:keyfind(ToRoleId, 1, List) of
                        false ->
                            gen_server:cast(friend_recall,
                                            {recall,
                                             #{role_id => RoleId,
                                               to_role_id => ToRoleId}}),
                            message_push(ToRoleName1,
                                         env:get(platform),
                                         env:get(zone_id)),
                            mail:send(ToRoleId,
                                      lang:get("招募好友"),
                                      notice:format(lang:get("亲爱的~ts，您的好友~ts招募了你并有些话要对你说：\n回来吧！我和小伙伴们都非常想念你"
                                                             ",我的ID是~ts，你可在回归奖励里输入我的ID就能获得丰厚奖励哦！让我一起再续星辰奇缘梦"
                                                             "吧！"),
                                                    [{role_2, ToRoleName1},
                                                     {role_2, RoleName},
                                                     {string_2, 5, Id}])),
                            NewFriendRecall = FriendRecall#friend_recall{lists =
                                                                             [{ToRoleId,
                                                                               Pos,
                                                                               0}
                                                                              | List],
                                                                         lists_time
                                                                             =
                                                                             lists:keystore(ToRoleId,
                                                                                            1,
                                                                                            ListTime,
                                                                                            {ToRoleId,
                                                                                             date:unixtime()
                                                                                                 +
                                                                                                 30
                                                                                                     *
                                                                                                     86400})},
                            save(NewFriendRecall),
                            friend_recall ! {refresh, RoleId},
                            push_11879(Role),
                            {ok, Role, lang:get("招募信息已经发送，呼唤好友回归一起领奖励吧！")};
                        _ -> {false, lang:get("你已招募了该好友,不能再次招募")}
                    end;
                _ -> {false, lang:get("当前不可招募")}
            end;
        Else -> Else
    end.

bind(Role, Id) ->
    case gen_server:call(friend_recall, {bind, Role, Id}) of
        ok -> {ok, Role};
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("系统繁忙")}
    end.

recalled_reward(Role = #role{id = RoleId}, Id) ->
    FRed = #friend_recalled{status = Status,
                            rewards = Rewards, activity = ActivityNow,
                            time = LastTime} =
               fetch_recalled(RoleId),
    case check_recalled_reward(Id,
                               [status, reward, activity],
                               #{id => Id, status => Status, rewards => Rewards,
                                 activity => ActivityNow})
        of
        {ok, #{reward := Reward}} ->
            Gain = format:val_to_gain(Reward),
            case role_gain:do_notice(Gain, Role) of
                {ok, NewRole} ->
                    RewardCount =
                        length(friend_data:get_recalled_reward_list()),
                    case length(Rewards) + 1 >= RewardCount of
                        true ->
                            NextTime = date:get_five_reset(date:unixtime()) +
                                           86400,
                            save(FRed#friend_recalled{time =
                                                          min(NextTime,
                                                              LastTime),
                                                      rewards =
                                                          [Id | Rewards]}),
                            friend_recall ! refresh_recalled;
                        _ ->
                            save(FRed#friend_recalled{rewards = [Id | Rewards]})
                    end,
                    push_11881(Role),
                    {ok, NewRole, lang:get("")};
                {false, #gain{msg = Msg}} -> {false, Msg}
            end;
        {false, Reason} -> {false, Reason}
    end.

check_recalled_reward(Cfg, Cond, Args)
    when is_map(Cfg) ->
    check_recalled_reward_cond(Cfg, Cond, Args);
check_recalled_reward(Id, Cond, Args) ->
    case friend_data:get_recalled_reward(Id) of
        Cfg = #{} -> check_recalled_reward(Cfg, Cond, Args);
        _ -> {false, lang:get("没有该奖励数据")}
    end.

check_recalled_reward_cond(Cfg, [], _Args) -> {ok, Cfg};
check_recalled_reward_cond(Cfg, [status | Rest],
                           Args = #{status := Status}) ->
    case Status of
        1 -> check_recalled_reward_cond(Cfg, Rest, Args);
        _ -> {false, lang:get("当前没有玩家绑定你,不能领取奖励")}
    end;
check_recalled_reward_cond(Cfg, [reward | Rest],
                           Args = #{id := Id, rewards := Rewards}) ->
    case lists:member(Id, Rewards) of
        false -> check_recalled_reward_cond(Cfg, Rest, Args);
        _ -> {false, lang:get("已领取该奖励,不能重复领取")}
    end;
check_recalled_reward_cond(Cfg = #{activity :=
                                       Activity},
                           [activity | Rest],
                           Args = #{activity := ActivityNow}) ->
    case ActivityNow >= Activity of
        true -> check_recalled_reward_cond(Cfg, Rest, Args);
        _ -> {false, lang:get("累计活跃度不足,无法领取")}
    end.

recall_reward(Role = #role{id = RoleId, lev = Lev},
              Id) ->
    FriendRecall = #friend_recall{status = Status,
                                  rewards = Rewards,
                                  role_id_bind = RoleIdBind} =
                       fetch(Role),
    case check_recall_reward(Id,
                             [status, reward, activity],
                             #{id => Id, status => Status, rewards => Rewards,
                               role_id_bind => RoleIdBind})
        of
        {ok, #{reward := Reward}} ->
            Reward1 = [{ItemId, Count}
                       || {LevMin, LevMax, ItemId, Count} <- Reward,
                          Lev >= LevMin andalso Lev =< LevMax],
            Gain = format:val_to_gain(Reward1),
            case role_gain:do_notice(Gain, Role) of
                {ok, NewRole} ->
                    save(FriendRecall#friend_recall{rewards =
                                                        [Id | Rewards]}),
                    push_11879(RoleId),
                    {ok, NewRole, lang:get("领取成功")};
                {false, #gain{msg = Msg}} -> {false, Msg}
            end;
        {false, Reason} -> {false, Reason}
    end.

check_recall_reward(Cfg, Cond, Args) when is_map(Cfg) ->
    check_recall_reward_cond(Cfg, Cond, Args);
check_recall_reward(Id, Cond, Args) ->
    case friend_data:get_recall_reward(Id) of
        Cfg = #{} -> check_recall_reward(Cfg, Cond, Args);
        _ -> {false, lang:get("没有该奖励数据")}
    end.

check_recall_reward_cond(Cfg, [], _Args) -> {ok, Cfg};
check_recall_reward_cond(Cfg, [status | Rest],
                         Args = #{status := Status}) ->
    case Status of
        1 -> check_recall_reward_cond(Cfg, Rest, Args);
        _ -> {false, lang:get("当前没有玩家绑定你,不能领取奖励")}
    end;
check_recall_reward_cond(Cfg, [reward | Rest],
                         Args = #{id := Id, rewards := Rewards}) ->
    case lists:member(Id, Rewards) of
        false -> check_recall_reward_cond(Cfg, Rest, Args);
        _ -> {false, lang:get("已领取该奖励,不能重复领取")}
    end;
check_recall_reward_cond(Cfg = #{activity := Activity},
                         [activity | Rest],
                         Args = #{role_id_bind := RoleIdBind}) ->
    ActivityNow = get_activity(RoleIdBind),
    case ActivityNow >= Activity of
        true -> check_recall_reward_cond(Cfg, Rest, Args);
        _ -> {false, lang:get("绑定玩家累计活跃度不足,无法领取")}
    end.

add_activity(Role = #role{id = RoleId, name = Name},
             Activity) ->
    logger:debug("累计活跃度 状态 ~w",
                 [var:get_var(Role, other, 2059, 0)],
                 friend_recall,
                 263),
    case var:get_var(Role, other, 2059, 0) of
        1 ->
            friend_recall ! {add_activity, RoleId, Name, Activity};
        _ ->
            logger:debug("已经不是老玩家啦 ", [], friend_recall, 268),
            logger:debug("已经不是老玩家啦 ", [], friend_recall, 269),
            logger:debug("已经不是老玩家啦 ", [], friend_recall, 270),
            skip
    end,
    ok.

add_activity(RoleId, _Name, Activity) ->
    role:apply(async,
               RoleId,
               {friend_recall, add_activity, [Activity]}).

get_activity(RoleId) ->
    case fetch_recalled(RoleId) of
        #friend_recalled{activity = Activity} -> Activity;
        _ -> 0
    end.

send_mail(_RoleIds, _RoleName, _Activity, ActivityId) ->
    ActivityId.

push_11879(#role{id = RoleId, name = RoleName,
                 link = #link{conn_pid = Pid}}) ->
    case fetch(RoleId) of
        #friend_recall{} = FriendRecall ->
            sys_conn:pack_send(Pid, 11879, {FriendRecall});
        _ ->
            case gen_server:call(friend_recall, fetch_id) of
                {ok, Id} ->
                    NewFr = #friend_recall{role_id = RoleId,
                                           role_name = RoleName, id = Id},
                    save(NewFr),
                    sys_conn:pack_send(Pid, 11879, {NewFr});
                _ -> ok
            end
    end;
push_11879(#friend_recall{role_id = RoleId} =
               FriendRecall) ->
    role:pack_send(RoleId, 11879, {FriendRecall});
push_11879(RoleId) ->
    case fetch(RoleId) of
        #friend_recall{} = FriendRecall ->
            role:pack_send(RoleId, 11879, {FriendRecall});
        _ -> ok
    end.

push_11881(#role{id = RoleId,
                 link = #link{conn_pid = Pid}}) ->
    FRed = fetch_recalled(RoleId),
    sys_conn:pack_send(Pid, 11881, {FRed});
push_11881(RoleId) ->
    FRed = fetch_recalled(RoleId),
    role:pack_send(RoleId, 11881, {FRed}).

push_11885(#role{id = RoleId,
                 link = #link{conn_pid = Pid}}) ->
    case fetch_recalled(RoleId) of
        #friend_recalled{activity = Activity,
                         role_id_recall = RoleIdRecall,
                         time_return = TimeReturn} ->
            sys_conn:pack_send(Pid,
                               11885,
                               {RoleId, Activity, TimeReturn}),
            role:pack_send(RoleIdRecall,
                           11885,
                           {RoleId, Activity, TimeReturn});
        _ -> ok
    end;
push_11885(RoleId) ->
    case fetch_recalled(RoleId) of
        #friend_recalled{activity = Activity,
                         time_return = TimeReturn} ->
            role:pack_send(RoleId,
                           11885,
                           {RoleId, Activity, TimeReturn});
        _ -> ok
    end.

push_11885(#role{link = #link{conn_pid = Pid}},
           ToRoleId) ->
    case fetch_recalled(ToRoleId) of
        #friend_recalled{activity = Activity,
                         time_return = TimeReturn} ->
            sys_conn:pack_send(Pid,
                               11885,
                               {ToRoleId, Activity, TimeReturn});
        _ -> skip
    end;
push_11885(OwnerId, RoleId) ->
    case fetch_recalled(RoleId) of
        #friend_recalled{activity = Activity,
                         time_return = TimeReturn} ->
            role:pack_send(OwnerId,
                           11885,
                           {RoleId, Activity, TimeReturn});
        _ -> ok
    end.

push_11886(Role = #role{link =
                            #link{conn_pid = Pid}}) ->
    case var:get_var(Role, other, 2065, {[], 0, 0, 0}) of
        {Buffs, _Time, _ReturnTime, _Day} ->
            sys_conn:pack_send(Pid, 11886, {Buffs});
        _ -> ok
    end.

cast(Args) -> gen_server:cast(friend_recall, Args).

call(Args) ->
    case catch gen_server:call(friend_recall, Args, 10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

info(Args) -> friend_recall ! Args.

start_link() ->
    gen_server:start_link({local, friend_recall},
                          friend_recall,
                          [],
                          []).

init([]) ->
    logger:info("开始启动...", [], friend_recall, 403),
    process_flag(trap_exit, true),
    dets:open_file(friend_recall,
                   [{file, "./dets/friend_recall.dets"},
                    {keypos, #friend_recall.role_id},
                    {type, set}]),
    dets:open_file(friend_recalled,
                   [{file, "./dets/friend_recalled.dets"},
                    {keypos, #friend_recalled.role_id},
                    {type, set}]),
    ets:new(friend_recall,
            [set,
             named_table,
             public,
             {keypos, #friend_recall.role_id}]),
    ets:new(friend_recalled,
            [set,
             named_table,
             public,
             {keypos, #friend_recalled.role_id}]),
    case dets:first(friend_recall) of
        '$end_of_table' ->
            logger:info("没有数据需要加载", [], friend_recall, 412),
            [];
        _ ->
            dets:traverse(friend_recall,
                          fun (#friend_recall{id = Id, lists_time = []} = FR) ->
                                  save(FR#friend_recall{id = to_string(Id)}),
                                  continue;
                              (#friend_recall{id = Id, role_id = RoleId,
                                              lists_time = ListsTime} =
                                   FR) ->
                                  [{_ToRoleId, Time} | _] = lists:keysort(2,
                                                                          ListsTime),
                                  Tref = erlang:send_after(max(0,
                                                               Time -
                                                                   date:unixtime())
                                                               * 1000,
                                                           friend_recall,
                                                           {refresh, RoleId}),
                                  put({refresh, RoleId}, Tref),
                                  save(FR#friend_recall{id = to_string(Id)}),
                                  continue
                          end)
    end,
    dets:to_ets(friend_recalled, friend_recalled),
    friend_recall ! refresh_recalled,
    friend_recall ! refresh,
    logger:info("启动完成", [], friend_recall, 432),
    {ok, #state{}}.

handle_call(fetch_id, _From, State) ->
    Id = create_id(),
    {reply, {ok, to_string(Id)}, State};
handle_call({bind,
             #role{id = RoleId, name = RoleName},
             Id},
            _From, State) ->
    FRed = #friend_recalled{status = Status, bind = IdBind,
                            rewards = Rewards, lists = Lists} =
               fetch_recalled(RoleId),
    Reply = case check_bind([status,
                             id_bind,
                             activity,
                             rewards,
                             id],
                            #{status => Status, id_bind => IdBind,
                              rewards => Rewards, role_id => RoleId, id => Id})
                of
                {ok,
                 #{friend_recall :=
                       Recall = #friend_recall{role_id = RecallId,
                                               role_name = RecallName,
                                               lists_time = ListsTime}}} ->
                    NewRecall = Recall#friend_recall{role_id_bind = RoleId,
                                                     role_name_bind = RoleName,
                                                     status = 1, rewards = [],
                                                     lists_time =
                                                         lists:keystore(RoleId,
                                                                        1,
                                                                        ListsTime,
                                                                        {RoleId,
                                                                         date:unixtime()
                                                                             +
                                                                             30
                                                                                 *
                                                                                 86400})},
                    save(NewRecall),
                    friend_recall ! {refresh, RecallId},
                    NewFRed = FRed#friend_recalled{bind = 1,
                                                   role_id_recall = RecallId,
                                                   role_name_recall =
                                                       RecallName,
                                                   recall_list =
                                                       lists:delete(RecallId,
                                                                    Lists)},
                    save(NewFRed),
                    role:pack_send(RoleId, 11881, {NewFRed}),
                    role:pack_send(RecallId, 11879, {NewRecall}),
                    push_11885(RecallId, RoleId),
                    ok;
                {false, Reason} -> {false, Reason}
            end,
    {reply, Reply, State};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({recall,
             #{role_id := RoleId, to_role_id := ToRoleId}},
            State) ->
    Fred = #friend_recalled{lists = Lists} =
               fetch_recalled(ToRoleId),
    save(Fred#friend_recalled{lists = [RoleId | Lists]}),
    {noreply, State};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info({add_activity, RoleId, RoleName, Activity},
            State) ->
    case fetch_recalled(RoleId) of
        FriendRecall = #friend_recalled{status = 1,
                                        role_id_recall = RecallId,
                                        activity = ActivityNow,
                                        recall_list = RoleIds,
                                        activity_id = ActivityId} ->
            NewActivityId = send_mail(RoleIds,
                                      RoleName,
                                      ActivityNow + Activity,
                                      ActivityId),
            save(FriendRecall#friend_recalled{activity =
                                                  ActivityNow + Activity,
                                              activity_id = NewActivityId}),
            push_11885(RecallId, RoleId),
            push_11885(RoleId);
        _R ->
            role:apply(async,
                       RoleId,
                       {friend_recall, state_change, [0]}),
            logger:debug("已经领取全部奖励  过期啦!!!!",
                         [],
                         friend_recall,
                         478)
    end,
    {noreply, State};
handle_info({notice_login, RecallRoleId, RoleId},
            State) ->
    case fetch(RecallRoleId) of
        Fr = #friend_recall{lists = Lists} ->
            case lists:keyfind(RoleId, 1, Lists) of
                {RoleId, Pos, _Login} ->
                    Lists1 = lists:keystore(RoleId,
                                            1,
                                            Lists,
                                            {RoleId, Pos, 1}),
                    NewFr = Fr#friend_recall{lists = Lists1},
                    save(NewFr),
                    push_11879(RecallRoleId);
                _ -> ok
            end;
        _ -> ok
    end,
    {noreply, State};
handle_info({refresh, RoleId}, State) ->
    case get({refresh, RoleId}) of
        undefined -> skip;
        TimerRef -> erlang:cancel_timer(TimerRef)
    end,
    Now = date:unixtime(),
    case fetch(RoleId) of
        #friend_recall{role_id = RoleId,
                       lists_time = ListsTime0} =
            Fr ->
            ToRoleIds = [ToRoleId
                         || {ToRoleId, Time} <- ListsTime0, Time =< Now],
            Fun = fun (ToRoleId1,
                       Acc = #friend_recall{lists = Lists,
                                            role_id_bind = BindRoleId,
                                            lists_time = ListsTime}) ->
                          Lists1 = lists:keydelete(ToRoleId1, 1, Lists),
                          ListsTime1 = lists:keydelete(ToRoleId1, 1, ListsTime),
                          case ToRoleId1 =:= BindRoleId of
                              true ->
                                  Acc#friend_recall{role_id_bind = {0, "", 0},
                                                    role_name_bind = "",
                                                    lists = Lists1,
                                                    lists_time = ListsTime1};
                              _ ->
                                  Acc#friend_recall{lists = Lists1,
                                                    lists_time = ListsTime1}
                          end
                  end,
            NewFr = lists:foldl(Fun, Fr, ToRoleIds),
            case NewFr of
                #friend_recall{lists_time = [_ | _] = ListsTime2} ->
                    [{_ToRoleId2, Time2} | _] = lists:keysort(2,
                                                              ListsTime2),
                    NewTref = erlang:send_after(max(1, Time2 - Now) * 1000,
                                                friend_recall,
                                                {refresh, RoleId}),
                    put({refresh, RoleId}, NewTref);
                _ -> skip
            end,
            save(NewFr),
            push_11879(RoleId);
        _ -> ignore
    end,
    {noreply, State};
handle_info(refresh_recalled, State) ->
    Now = date:unixtime(),
    MatchSpec = [{#friend_recalled{status = '$1',
                                   time = '$2', _ = '_'},
                  [{'=:=', '$1', 1}, {'=<', '$2', Now}],
                  ['$_']}],
    List = ets:select(friend_recalled, MatchSpec),
    Fun = fun (#friend_recalled{role_id = RoleId} = FRed) ->
                  role:apply(async,
                             RoleId,
                             {friend_recall, state_change, [0]}),
                  save(FRed#friend_recalled{status = 2}),
                  push_11881(RoleId),
                  friend_recall ! {deal_role, RoleId}
          end,
    lists:foreach(Fun, List),
    case ets:select(friend_recalled,
                    [{#friend_recalled{status = '$1', _ = '_'},
                      [{'=:=', '$1', 1}],
                      ['$_']}])
        of
        [_ | _] = List1 ->
            [#friend_recalled{time = Time} | _] =
                lists:keysort(#friend_recalled.time, List1),
            case get(refresh_recalled) of
                undefined -> ignore;
                TRef -> erlang:cancel_timer(TRef)
            end,
            NewTRef = erlang:send_after(max(Time - date:unixtime(),
                                            0)
                                            * 1000,
                                        self(),
                                        refresh_recalled),
            put(refresh_recalled, NewTRef);
        _ -> ignore
    end,
    {noreply, State};
handle_info(deal_repeat, State) ->
    logger:info("开始执行命令  ", [], friend_recall, 556),
    logger:info("列表长度 ~w ",
                [ets:info(friend_recall, size)],
                friend_recall,
                557),
    List = ets:tab2list(friend_recall),
    do_update_data(List),
    logger:info("完成执行命令 ", [], friend_recall, 560),
    {noreply, State};
handle_info({deal_role, RoleId}, State) ->
    case fetch_recalled(RoleId) of
        #friend_recalled{role_id_recall =
                             {Id, _Platform, _ZoneId} = RoleIdRecall,
                         status = 2}
            when Id =/= 0 ->
            case fetch(RoleIdRecall) of
                FR = #friend_recall{role_id_bind = RoleIdBind}
                    when RoleIdBind =:= RoleId ->
                    logger:info("已解除关系玩家 ~w ~w",
                                [RoleId, RoleIdRecall],
                                friend_recall,
                                568),
                    NewFR = FR#friend_recall{role_id_bind = {0, "", 0},
                                             role_name_bind = "", rewards = [],
                                             time_return = 0},
                    save(NewFR),
                    role:pack_send(RoleIdRecall, 11879, {NewFR});
                _ -> ok
            end;
        _ -> ok
    end,
    {noreply, State};
handle_info(fix_all, State) ->
    logger:info("开始执行命令  ", [], friend_recall, 579),
    MatchSpec = [{#friend_recalled{status = '$1', _ = '_'},
                  [{'=:=', '$1', 2}],
                  ['$_']}],
    List = ets:select(friend_recalled, MatchSpec),
    logger:info("所有玩家数量 ~w",
                [length(List)],
                friend_recall,
                582),
    [friend_recall ! {deal_role, RoleId}
     || #friend_recalled{role_id = RoleId} <- List],
    logger:info("完成执行命令 ", [], friend_recall, 584),
    {noreply, State};
handle_info({deal_merge, File1, File2}, State) ->
    logger:info("开始执行命令  ", [], friend_recall, 587),
    dets:open_file(friend_recalled_merge1,
                   [{file,
                     util:flist(["./dets/",
                                 File1,
                                 "/friend_recalled.dets"])},
                    {keypos, #friend_recalled.role_id},
                    {type, set}]),
    dets:open_file(friend_recalled_merge2,
                   [{file,
                     util:flist(["./dets/",
                                 File2,
                                 "/friend_recalled.dets"])},
                    {keypos, #friend_recalled.role_id},
                    {type, set}]),
    dets:open_file(friend_recall_merge1,
                   [{file,
                     util:flist(["./dets/", File1, "/friend_recall.dets"])},
                    {keypos, #friend_recall.role_id},
                    {type, set}]),
    dets:open_file(friend_recall_merge2,
                   [{file,
                     util:flist(["./dets/", File2, "/friend_recall.dets"])},
                    {keypos, #friend_recall.role_id},
                    {type, set}]),
    deal_merge_recall(friend_recall_merge1),
    deal_merge_recall(friend_recall_merge2),
    deal_merge_recalled(friend_recalled_merge1),
    deal_merge_recalled(friend_recalled_merge2),
    logger:info("完成执行命令 ", [], friend_recall, 601),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...",
                [friend_recall],
                friend_recall,
                607),
    util:close_dets(friend_recall),
    util:close_dets(friend_recalled),
    logger:info("[~w] 关闭完成",
                [friend_recall],
                friend_recall,
                610),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

deal_merge_recalled(Name) ->
    case dets:first(Name) of
        '$end_of_table' ->
            logger:info("没有数据需要加载", [], friend_recall, 619),
            [];
        _ ->
            dets:traverse(Name,
                          fun (#friend_recalled{status = 0}) -> continue;
                              (FRed) ->
                                  logger:info("旧服被招募玩家数据 ~w",
                                              [FRed#friend_recalled.role_id],
                                              friend_recall,
                                              626),
                                  save(FRed),
                                  continue
                          end)
    end.

deal_merge_recall(Name) ->
    case dets:first(Name) of
        '$end_of_table' ->
            logger:info("没有数据需要加载", [], friend_recall, 636),
            [];
        _ ->
            dets:traverse(Name,
                          fun (#friend_recall{status = 0}) -> continue;
                              (FRed = #friend_recall{role_id = RoleId}) ->
                                  case fetch(RoleId) of
                                      #friend_recall{role_id_bind =
                                                         {0, "", 0}} ->
                                          skip;
                                      #friend_recall{role_id_bind =
                                                         RoleIdBind} ->
                                          logger:info("解绑玩家 ~w ~w",
                                                      [RoleId, RoleIdBind],
                                                      friend_recall,
                                                      647),
                                          do_update_data2(RoleIdBind);
                                      _ -> skip
                                  end,
                                  NewFR = FRed#friend_recall{id = create_id()},
                                  save(NewFR),
                                  erlang:spawn(role,
                                               pack_send,
                                               [RoleId, 11879, {NewFR}]),
                                  continue
                          end)
    end.

do_update_data([]) -> ok;
do_update_data([FR = #friend_recall{role_id = RoleId,
                                    id = Id, role_id_bind = RoleIdBind}
                | List]) ->
    case lists:keytake(Id, #friend_recall.id, List) of
        {value,
         OtherFR = #friend_recall{role_id = OtherRoleId,
                                  role_id_bind = OtherIdBind},
         List1} ->
            NewId1 = create_id(),
            NewFR1 = FR#friend_recall{id = NewId1,
                                      role_id_bind = {0, "", 0},
                                      role_name_bind = ""},
            erlang:spawn(role,
                         pack_send,
                         [RoleId, 11879, {NewFR1}]),
            save(NewFR1),
            do_update_data2(RoleIdBind),
            NewId2 = create_id(),
            NewOtherFR2 = OtherFR#friend_recall{id = NewId2,
                                                role_id_bind = {0, "", 0},
                                                role_name_bind = ""},
            erlang:spawn(role,
                         pack_send,
                         [OtherRoleId, 11879, {NewOtherFR2}]),
            save(NewOtherFR2),
            do_update_data2(OtherIdBind),
            do_update_data(List1);
        _ -> do_update_data(List)
    end.

do_update_data2({0, _, _}) -> ok;
do_update_data2(RoleId) ->
    case fetch_recalled(RoleId) of
        FRed = #friend_recalled{activity = Activity} ->
            logger:info("被处理 玩家 ID:~w 活跃度:~w",
                        [RoleId, Activity],
                        friend_recall,
                        685),
            NewFRed = FRed#friend_recalled{role_id_recall =
                                               {0, "", 0},
                                           role_name_recall = "", bind = 0,
                                           rewards = [], activity = 0},
            role:pack_send(RoleId, 11881, {NewFRed}),
            save(NewFRed);
        _ ->
            logger:debug("dddddddd~w",
                         [RoleId],
                         friend_recall,
                         690),
            ok
    end.

test(Num) ->
    List = lists:seq(1, Num),
    Now = date:unixtime(),
    [save(#friend_recall{id = Id, role_id = {Id, "test", 1},
                         lists_time =
                             [{{Id, "test", 1}, Now},
                              {{Id, "test", 2}, Now},
                              {{Id, "test", 3}, Now}]})
     || Id <- List],
    [save(#friend_recall{id = Id, role_id = {Id, "test", 2},
                         lists_time =
                             [{{Id, "test", 1}, Now},
                              {{Id, "test", 2}, Now},
                              {{Id, "test", 3}, Now}]})
     || Id <- List].

select(MatchSpec) ->
    ets:select(friend_recall, MatchSpec).

fetch(#role{id = RoleId}) ->
    case catch ets:lookup(friend_recall, RoleId) of
        [#friend_recall{} = FriendRecall | _] ->
            logger:debug("=====~w", [RoleId], friend_recall, 707),
            FriendRecall;
        _R -> false
    end;
fetch(RoleId) ->
    case catch ets:lookup(friend_recall, RoleId) of
        [#friend_recall{} = FriendRecall | _] -> FriendRecall;
        _R -> false
    end.

fetch_recalled(RoleId) ->
    case catch ets:lookup(friend_recalled, RoleId) of
        [#friend_recalled{} = Recalled] -> Recalled;
        _ -> #friend_recalled{role_id = RoleId}
    end.

save(FriendRecall)
    when is_record(FriendRecall, friend_recall) ->
    ets:insert(friend_recall, FriendRecall),
    dets:insert(friend_recall, FriendRecall);
save(FriendRecalled)
    when is_record(FriendRecalled, friend_recalled) ->
    ets:insert(friend_recalled, FriendRecalled),
    dets:insert(friend_recalled, FriendRecalled).

check_time(0) -> false;
check_time(TimeLogout) ->
    logger:debug("上一次退出游戏时间~w",
                 [TimeLogout],
                 friend_recall,
                 737),
    date:unixtime() - TimeLogout >= 8 * 86400.

check_bind([], Args) -> {ok, Args};
check_bind([status | Rest],
           Args = #{status := Status}) ->
    logger:debug("DDDDDDDDDDDDDDDDDDD~w",
                 [Status],
                 friend_recall,
                 742),
    case Status of
        1 -> check_bind(Rest, Args);
        _ -> {false, lang:get("条件不符合,不能绑定招募者")}
    end;
check_bind([id_bind | Rest],
           Args = #{id_bind := IdBind}) ->
    case IdBind of
        0 -> check_bind(Rest, Args);
        _ -> {false, lang:get("你已绑定其他玩家,不能再次绑定")}
    end;
check_bind([activity | Rest],
           Args = #{role_id := RoleId}) ->
    Activity = get_activity(RoleId),
    ActivityMax1 = case friend_data:get_recalled_reward(2)
                       of
                       #{activity := ActivityMax} -> ActivityMax;
                       _ -> 900
                   end,
    case Activity < ActivityMax1 of
        true -> check_bind(Rest, Args);
        _ ->
            {false,
             notice:format(lang:get("活跃度达到~ts及以上后不能绑定招募人"),
                           [{string_2, 0, ActivityMax1}])}
    end;
check_bind([rewards | Rest],
           Args = #{rewards := Rewards}) ->
    case Rewards of
        [] -> check_bind(Rest, Args);
        _ -> {false, lang:get("你已领取第一档奖励,不能绑定招募人")}
    end;
check_bind([id | Rest],
           Args = #{id := Id, role_id := RoleId}) ->
    case select([{#friend_recall{id = '$1', _ = '_'},
                  [{'=:=', '$1', Id}],
                  ['$_']}])
        of
        [#friend_recall{role_id_bind = {RoleIdBind, _P, _Z}}
         | _]
            when RoleIdBind =/= 0 ->
            {false, lang:get("您所输入的ID已经被其他玩家绑定过，请重新输入!")};
        [#friend_recall{role_id = RoleId} | _] ->
            {false, lang:get("该招募ID是你自己的,不能绑定自己")};
        [Recall = #friend_recall{} | _] ->
            check_bind(Rest, Args#{friend_recall => Recall});
        _ -> {false, lang:get("该招募者ID不存在,不能绑定")}
    end.

state_change(Role, State) ->
    logger:debug("==============~w~n",
                 [State],
                 friend_recall,
                 781),
    {ok, var:set_var(Role, other, 2059, State)}.

apply_evt(#evt_activity{val = Val}, Role) ->
    logger:debug("增加活跃度  ~w", [Val], friend_recall, 786),
    add_activity(Role, Val),
    ok;
apply_evt(_, _Role) -> ok.

create_id() ->
    Platform = env:get(platform),
    ZoneId = env:get(zone_id),
    NextId = case env:get(friend_recall) of
                 Id when is_integer(Id) -> Id;
                 _ -> 1
             end,
    env:save(friend_recall, NextId + 1),
    PlatformNum = case
                      friend_data:get_platform_num(Platform)
                      of
                      #{num := Num} -> Num;
                      _ -> 99
                  end,
    NextId * 100000 + PlatformNum * 1000 + ZoneId.

reset_buffs(Role) ->
    {Time, ReturnTime, Day} = case var:get_var(Role,
                                               other,
                                               2065,
                                               {[], 0, 0, 0})
                                  of
                                  {_, Time0, ReturnTime0, Day0} ->
                                      {Time0, ReturnTime0, Day0};
                                  _ -> {0, 0, 0}
                              end,
    NewDay = Day + 1,
    ReturnDay = date:day_diff(date:unixtime(), ReturnTime) +
                    1,
    case date:is_today(Time) of
        true -> Role;
        _ ->
            case NewDay =< 7 andalso ReturnDay =< 30 of
                true ->
                    BuffList = friend_data:get_growth_buff(NewDay),
                    Role1 = var:set_var(Role,
                                        other,
                                        2065,
                                        {BuffList,
                                         date:unixtime(),
                                         ReturnTime,
                                         NewDay}),
                    Fun = fun (BuffId, Acc) ->
                                  case buff_data:get(BuffId) of
                                      B = #buff_base{} ->
                                          [B#buff_base{duration =
                                                           date:unixtime({next_day,
                                                                          date:unixtime()})
                                                               -
                                                               date:unixtime()}
                                           | Acc];
                                      _ -> Acc
                                  end
                          end,
                    BuffList2 = lists:foldl(Fun, [], BuffList),
                    {ok, Role2} = buff:add_and_calc(Role1, BuffList2),
                    Timer = #timer{id = friend_recall,
                                   timeout =
                                       max(0,
                                           date:unixtime({next_day,
                                                          date:unixtime()})
                                               - date:unixtime())
                                           * 1000,
                                   times = 1, m = friend_recall, f = timer_tick,
                                   a = []},
                    role_timer:set(Timer, Role2);
                _ ->
                    var:set_var(Role,
                                other,
                                2065,
                                {[], date:unixtime(), ReturnTime, Day})
            end
    end.

to_string(FriendRecall = #friend_recall{id = _Id}) ->
    FriendRecall;
to_string(Id) when is_integer(Id) ->
    erlang:integer_to_list(Id);
to_string(Id) -> Id.

timer_tick(Role) ->
    NewRole = reset_buffs(Role),
    push_11886(NewRole),
    {ok, NewRole}.

message_push(RoleName, Platfrom, ZoneId) ->
    SrvId = util:flist("~ts~ts~ts",
                       [Platfrom, "_", util:to_list(ZoneId)]),
    Sign = util:md5(util:flist("~ts~ts~ts",
                               [SrvId,
                                util:to_list(util:fbin(RoleName)),
                                "daDDsd*34_34Rjsdd2lhj"])),
    S = util:flist("srv_id=~ts&role_name=~ts&sign=~ts",
                   [SrvId, RoleName, Sign]),
    logger:debug("消息推送参数 ~ts", [S], friend_recall, 860),
    erlang:spawn(log_web,
                 post,
                 ["http://smp.xcqy12.shiyuegame.com/api.php/pf/p"
                  "ushmessage/push/",
                  util:fbin(S)]).

reset_recalled() ->
    ets:match_delete(friend_recalled,
                     #friend_recalled{_ = '_', status = 2}),
    dets:match_delete(friend_recalled,
                      #friend_recalled{_ = '_', status = 2}).

gm_cancl_recall(#role{id = RoleId}) ->
    case fetch(RoleId) of
        FR = #friend_recall{} ->
            save(FR#friend_recall{lists = [],
                                  role_id_bind = {0, "", 0},
                                  role_name_bind = ""});
        _ -> ok
    end,
    ok.

gm_cancl_recalled(#role{id = RoleId} = Role) ->
    case fetch_recalled(RoleId) of
        #friend_recalled{bind = 0} -> ok;
        FRed = #friend_recalled{role_id_recall = ToRoleId} ->
            NewFRed = FRed#friend_recalled{bind = 0,
                                           role_id_recall = {0, "", 0},
                                           role_name_recall = ""},
            save(NewFRed),
            push_11881(Role),
            case fetch(ToRoleId) of
                FR = #friend_recall{} ->
                    NewFR = FR#friend_recall{role_id_bind = {0, "", 0},
                                             role_name_bind = "", lists = []},
                    save(NewFR),
                    push_11879(ToRoleId);
                _ -> ok
            end
    end,
    ok.

gm_activity(#role{id = RoleId, name = Name},
            Activity) ->
    case fetch_recalled(RoleId) of
        #friend_recalled{} = _FRed ->
            add_activity(RoleId, Name, Activity);
        _ ->
            logger:debug("不是老玩家", [], friend_recall, 904),
            ok
    end,
    ok.

gm_buff_change(Role, Day)
    when Day >= 0 andalso Day =< 7 ->
    ReturnTime = date:unixtime() - (Day - 1) * 86400,
    BuffList = friend_data:get_growth_buff(Day),
    logger:debug("BUFF列表ID ~w",
                 [BuffList],
                 friend_recall,
                 912),
    Fun = fun (BuffId, Acc) ->
                  case buff_data:get(BuffId) of
                      B = #buff_base{} ->
                          [B#buff_base{duration =
                                           date:unixtime({next_day,
                                                          date:unixtime()})
                                               - date:unixtime()}
                           | Acc];
                      _ -> Acc
                  end
          end,
    BuffList2 = lists:foldl(Fun, [], BuffList),
    Role1 = var:set_var(Role,
                        other,
                        2065,
                        {BuffList, date:unixtime(), ReturnTime, Day}),
    {ok, Role2} = buff:add_and_calc(Role1, BuffList2),
    push_11886(Role2),
    {ok, Role2};
gm_buff_change(_Role, _) ->
    {false, lang:get("天数必须在1-7之间")}.

