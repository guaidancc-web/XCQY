-file("src/mod/misc/regression_login.erl", 1).

-module(regression_login).

-export([login/1,
         zero_flush/2,
         reward/2,
         reward_draw/1,
         reward_draw_get/1,
         limit_buy/2,
         gm_login_time/2,
         gm_login_day/2,
         fix_role/1,
         set_status/1,
         push_9938/1,
         push_pmd/1,
         get_role_regress_login/0,
         check_role_regress_login/1,
         get_role_regress_login/1]).

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

-file("src/mod/misc/regression_login.erl", 31).

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

-file("src/mod/misc/regression_login.erl", 32).

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

-file("src/mod/misc/regression_login.erl", 33).

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

-file("src/mod/misc/regression_login.erl", 34).

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

-file("src/mod/misc/regression_login.erl", 35).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/misc/regression_login.erl", 36).

-file("inc/regression_login.hrl", 1).

-record(regression_login,
        {flag = 0 :: non_neg_integer(),
         reward_id = 0 :: non_neg_integer(),
         time_return = 0 :: non_neg_integer(),
         unixtime = 0 :: non_neg_integer(),
         rewards = [] :: list(),
         reward_all = 0 :: non_neg_integer()}).

-file("src/mod/misc/regression_login.erl", 37).

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

-file("src/mod/misc/regression_login.erl", 38).

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

-file("src/mod/misc/regression_login.erl", 39).

zero_flush(Role, _Args) -> flush(Role, push).

login(#role{lev = Lev}) when Lev < 70 -> ok;
login(Role = #role{time_info =
                       {_TimeLogin, TimeLogout}}) ->
    Now = date:unixtime(),
    #regression_login{time_return = TimeReturn,
                      flag = Flag} =
        var:get_var(Role, other, 2062, #regression_login{}),
    case check_time(TimeLogout) =:= true of
        true when Flag =:= 0 ->
            NewRole = var:set_var(Role,
                                  other,
                                  2062,
                                  #regression_login{flag = 1, unixtime = Now,
                                                    time_return = Now,
                                                    rewards = [{1, 1, 0}]}),
            {ok, NewRole};
        true when Flag =:= 2 andalso TimeReturn < 1511841600 ->
            NewRole = var:set_var(Role,
                                  other,
                                  2062,
                                  #regression_login{flag = 1, unixtime = Now,
                                                    time_return = Now,
                                                    rewards = [{1, 1, 0}]}),
            {ok, NewRole};
        _ -> ok
    end.

flush(#role{lev = Lev}, _Args) when Lev < 70 -> ok;
flush(Role, Args) ->
    logger:debug("老玩家零点刷新 ~w",
                 [Args],
                 regression_login,
                 73),
    RL = #regression_login{unixtime = _Unixtime,
                           time_return = _TimeReturn, flag = Flag,
                           rewards = Rewards} =
             var:get_var(Role, other, 2062, #regression_login{}),
    Now = date:unixtime(),
    DayList = [OldDay || {OldDay, _, _} <- Rewards],
    Day = case DayList of
              [] -> 1;
              _ -> lists:max(DayList) + 1
          end,
    Rewards1 = rewards_fix(Rewards, Day - 1),
    case Flag =:= 1 andalso Day =< 7 of
        true ->
            NewRewards = case length(Rewards) =:= length(Rewards1)
                             of
                             true ->
                                 lists:keystore(Day, 1, Rewards1, {Day, 1, 0});
                             _ -> Rewards1
                         end,
            NewRole = var:set_var(Role,
                                  other,
                                  2062,
                                  RL#regression_login{unixtime = Now,
                                                      rewards = NewRewards}),
            case Args of
                push -> push_9938(NewRole);
                _ -> skip
            end,
            {ok, NewRole};
        _ ->
            NewFlag = case Rewards1 of
                          [] -> 0;
                          _ ->
                              case lists:keyfind(1, 2, Rewards1) of
                                  false -> 2;
                                  _ -> 1
                              end
                      end,
            NewRole = var:set_var(Role,
                                  other,
                                  2062,
                                  RL#regression_login{flag = NewFlag,
                                                      unixtime = Now,
                                                      rewards = Rewards1}),
            case Args of
                push -> push_9938(NewRole);
                _ -> skip
            end,
            {ok, NewRole}
    end.

reward(Role = #role{lev = Lev}, Day) when Day =:= 0 ->
    RL = #regression_login{reward_all = RewardAll} =
             var:get_var(Role, other, 2062, #regression_login{}),
    logger:debug("奖励状态", [], regression_login, 116),
    case RewardAll of
        1 ->
            case friend_data:get_reward(0, Lev) of
                #{reward := Reward} ->
                    Reward1 = [{ItemId, 0, Count}
                               || {LevMin, LevMax, ItemId, Count} <- Reward,
                                  LevMin =< Lev, LevMax >= Lev],
                    Formate = format:val_to_gain(Reward1),
                    case role_gain:do_notice(Formate, Role) of
                        {ok, Role1} ->
                            NewRole = var:set_var(Role1,
                                                  other,
                                                  2062,
                                                  RL#regression_login{reward_all
                                                                          = 2}),
                            push_9938(NewRole),
                            {ok, NewRole, ""};
                        {false, #gain{msg = Msg}} -> {false, Msg}
                    end;
                _ -> {false, lang:get("该奖励不可领取")}
            end;
        0 -> {false, lang:get("该奖励不可领取")};
        _ -> {false, lang:get("该奖励已领取")}
    end;
reward(Role = #role{lev = Lev}, Day)
    when Day >= 1 andalso Day =< 6 ->
    RL = #regression_login{rewards = Rewards,
                           reward_all = RewardAll} =
             var:get_var(Role, other, 2062, #regression_login{}),
    case lists:keyfind(Day, 1, Rewards) of
        {Day, Status, _Time} when Status =:= 1 ->
            case friend_data:get_reward(Day, Lev) of
                #{reward := Reward} ->
                    Reward1 = [{ItemId, 0, Count}
                               || {LevMin, LevMax, ItemId, Count} <- Reward,
                                  LevMin =< Lev, LevMax >= Lev],
                    logger:debug("===== 玩家 回归 登陆 奖励======~w",
                                 [Reward1],
                                 regression_login,
                                 146),
                    Formate = format:val_to_gain(Reward1),
                    case role_gain:do_notice(Formate, Role) of
                        {ok, Role1} ->
                            Time = date:unixtime({next_day, date:unixtime()}),
                            Rewards1 = lists:keystore(Day,
                                                      1,
                                                      Rewards,
                                                      {Day, 4, Time}),
                            RewardAll1 = reward_all_status(Rewards1, RewardAll),
                            NewRole = var:set_var(Role1,
                                                  other,
                                                  2062,
                                                  RL#regression_login{rewards =
                                                                          Rewards1,
                                                                      reward_all
                                                                          =
                                                                          RewardAll1}),
                            push_9938(NewRole),
                            {ok, NewRole, ""};
                        {false, #gain{msg = Msg}} -> {false, Msg}
                    end;
                _ -> {false, lang:get("该奖励不可领取")}
            end;
        {Day, 2} -> {false, lang:get("已领取该奖励")};
        _ -> {false, lang:get("不能领取该奖励")}
    end;
reward(_Role, _Day) -> {false, lang:get("该奖励不可领取")}.

reward_draw(Role) ->
    RL = #regression_login{rewards = Rewards,
                           reward_all = RewardAll} =
             var:get_var(Role, other, 2062, #regression_login{}),
    case lists:keyfind(7, 1, Rewards) of
        {Day, Status, _Time} when Status =:= 1 ->
            RandList = friend_data:list(),
            {RewardId, _Odds} = util:rand_list(RandList, 2),
            logger:debug("中奖 奖励 ID ~w",
                         [RewardId],
                         regression_login,
                         177),
            Rewards1 = lists:keystore(Day, 1, Rewards, {Day, 3, 0}),
            RewardAll1 = reward_all_status(Rewards1, RewardAll),
            NewRole = var:set_var(Role,
                                  other,
                                  2062,
                                  RL#regression_login{reward_id = RewardId,
                                                      rewards = Rewards1,
                                                      reward_all = RewardAll1}),
            erlang:send_after(8 * 1000,
                              self(),
                              {apply_async,
                               {regression_login, reward_draw_get, []}}),
            push_9938(NewRole),
            {ok, NewRole, RewardId};
        {_Day, 2, _Time} -> {false, lang:get("已抽取奖励,不能再次抽取")};
        _ ->
            logger:debug("抽奖奖励领取", [], regression_login, 186),
            {false, lang:get("已抽取奖励,不能再次抽取")}
    end.

reward_draw_get(Role = #role{name = Name, lev = Lev}) ->
    logger:debug("抽奖奖励领取", [], regression_login, 192),
    RL = #regression_login{reward_id = RewardId,
                           rewards = Rewards, reward_all = RewardAll} =
             var:get_var(Role, other, 2062, #regression_login{}),
    case lists:keyfind(7, 1, Rewards) of
        {Day, Status, _Time} when Status =:= 3 ->
            case friend_data:get_reward_draw(RewardId) of
                #{reward := DrawReward, cast := Cast} ->
                    Reward2 = case friend_data:get_reward(7, Lev) of
                                  #{reward := Reward1} -> Reward1;
                                  _ -> []
                              end,
                    Reward3 = [{ItemId, 0, Count}
                               || {LevMin, LevMax, ItemId, Count} <- Reward2,
                                  LevMin =< Lev, LevMax >= Lev],
                    logger:debug("抽奖奖励 获得奖励 ~w",
                                 [Reward3],
                                 regression_login,
                                 203),
                    DrawReward1 = [{ItemId, 0, Count}
                                   || {ItemId, Count} <- DrawReward],
                    Gain = format:val_to_gain(DrawReward1 ++ Reward3),
                    Time = date:unixtime({next_day, date:unixtime()}),
                    Rewards1 = lists:keystore(Day,
                                              1,
                                              Rewards,
                                              {Day, 4, Time}),
                    RewardAll1 = reward_all_status(Rewards1, RewardAll),
                    Role1 = var:set_var(Role,
                                        other,
                                        2062,
                                        RL#regression_login{rewards = Rewards1,
                                                            reward_all =
                                                                RewardAll1}),
                    cast(DrawReward, Name, Cast),
                    case role_gain:do_notice(Gain, Role1) of
                        {ok, NewRole} ->
                            push_9938(NewRole),
                            {ok, NewRole};
                        {false, _} ->
                            Title = lang:get("回归登陆"),
                            Content = lang:get("回归登陆抽奖时，背包已满"),
                            mail:send(Role1,
                                      #{title => Title, content => Content,
                                        items => DrawReward1 ++ Reward3}),
                            {ok, Role1}
                    end;
                _ -> ok
            end;
        _ -> ok
    end.

cast(Reward, Name, IsCast) ->
    case IsCast of
        1 ->
            Msg =
                notice:format("~ts在回归登陆中抽到~ts，高兴的笑开了花{face_1,3}，喜迎回归!",
                              [{role_2, Name}, {item_2, Reward}]),
            notice:cast(all, 5, Msg),
            PwdList1 = case env:get(regression_login) of
                           PwdList when is_list(PwdList) ->
                               lists:sublist(lists:reverse(lists:keysort(2,
                                                                         PwdList)),
                                             9);
                           _ -> []
                       end,
            env:save(regression_login,
                     [{Msg, date:unixtime()} | PwdList1]),
            role_group:pack_send(world, 9943, {Msg});
        _ -> ignore
    end.

limit_buy(Role = #role{lev = Lev}, Day) ->
    RL = #regression_login{rewards = Rewards} =
             var:get_var(Role, other, 2062, #regression_login{}),
    Now = date:unixtime(),
    case lists:keyfind(Day, 1, Rewards) of
        {Day, Status, Time}
            when Status =:= 4 andalso Now =< Time ->
            case friend_data:get_reward(Day, Lev) of
                #{limit := Limit, pirce := Price} ->
                    Loss = format:val_to_loss(Price),
                    Limit1 = [{ItemId, 0, Count}
                              || {ItemId, Count} <- Limit],
                    Gain = format:val_to_gain(Limit1),
                    case role_gain:do_notice(Loss ++ Gain, Role) of
                        {ok, Role1} ->
                            NewRole = var:set_var(Role1,
                                                  other,
                                                  2062,
                                                  RL#regression_login{rewards =
                                                                          lists:keystore(Day,
                                                                                         1,
                                                                                         Rewards,
                                                                                         {Day,
                                                                                          5,
                                                                                          Time})}),
                            push_9938(NewRole),
                            {ok, NewRole, lang:get("")};
                        {false, #gain{msg = Msg}} -> {false, Msg};
                        {false, #loss{msg = Msg}} -> {false, Msg}
                    end;
                _ -> {false, lang:get("数据错误")}
            end;
        {Day, 5, _Time} -> {false, lang:get("已购买, 不能重复购买")};
        _R ->
            logger:debug("===============~w",
                         [_R],
                         regression_login,
                         269),
            {false, lang:get("已过期,不能购买")}
    end.

reward_all_status(_, RewardAll) when RewardAll >= 1 ->
    RewardAll;
reward_all_status(Rewards, RewardAll) ->
    All = [Status
           || {_Day, Status, _Time} <- Rewards, Status >= 2],
    case length(All) >= 7 of
        true -> 1;
        _ -> RewardAll
    end.

push_9938(#role{lev = Lev,
                link = #link{conn_pid = Pid}} =
              Role)
    when Lev >= 60 ->
    RL = var:get_var(Role,
                     other,
                     2062,
                     #regression_login{}),
    sys_conn:pack_send(Pid, 9938, {RL});
push_9938(_) -> ok.

push_pmd(Role) ->
    case env:get(regression_login) of
        PwdList when is_list(PwdList) ->
            role:pack_send(Role, 9944, {PwdList});
        _ -> ok
    end.

check_time(0) -> false;
check_time(TimeLogout) ->
    case date:unixtime() - TimeLogout >= 8 * 86400 of
        true -> true;
        _ -> false
    end.

rewards_fix([], _Day) -> [];
rewards_fix(Rewards, 0) -> Rewards;
rewards_fix(Rewards, Day) ->
    DayList = [OldDay || {OldDay, _, _} <- Rewards],
    List = lists:seq(1, Day),
    List1 = List -- DayList,
    case List1 of
        [NewDay | _] -> [{NewDay, 1, 0} | Rewards];
        _ -> Rewards
    end.

fix_role(Role) when is_record(Role, role) ->
    NewRole = var:set_var(Role,
                          other,
                          2062,
                          #regression_login{flag = 1,
                                            unixtime = date:unixtime(),
                                            time_return = date:unixtime(),
                                            rewards = [{1, 1, 0}]}),
    push_9938(NewRole),
    logger:info("玩家回归修复", [], regression_login, 321),
    {ok, NewRole};
fix_role(RoleId) ->
    role:apply(async,
               RoleId,
               {regression_login, fix_role, []}).

set_status(Role) when is_record(Role, role) ->
    Rewards = [{Day, 5, 0} || Day <- lists:seq(1, 7)],
    NewRole = var:set_var(Role,
                          other,
                          2062,
                          #regression_login{flag = 2,
                                            unixtime = date:unixtime(),
                                            time_return =
                                                date:unixtime() - 30 * 86400,
                                            rewards = Rewards}),
    push_9938(NewRole),
    logger:info("玩家回归状态修复", [], regression_login, 331),
    {ok, NewRole};
set_status(RoleId) ->
    role:apply(async,
               RoleId,
               {regression_login, set_status, []}).

gm_login_day(Role, Day) ->
    Time = date:unixtime() - 86400 * (Day - 1),
    RL = #regression_login{rewards = Rewards} =
             var:get_var(Role, other, 2062, #regression_login{}),
    NewRole = var:set_var(Role,
                          other,
                          2062,
                          RL#regression_login{flag = 1,
                                              unixtime = date:unixtime(),
                                              time_return = Time,
                                              rewards =
                                                  lists:keystore(Day,
                                                                 1,
                                                                 Rewards,
                                                                 {Day, 1, 0})}),
    push_9938(NewRole),
    {ok, NewRole}.

gm_login_time(Role, Day) ->
    Time = date:unixtime() - 86400 * Day,
    RL = var:get_var(Role,
                     other,
                     2062,
                     #regression_login{}),
    NewRole = var:set_var(Role,
                          other,
                          2062,
                          RL#regression_login{flag = 1, time_return = Time,
                                              unixtime =
                                                  date:unixtime() - 86400}),
    push_9938(NewRole),
    {ok, NewRole}.

get_role_regress_login() ->
    role_group:apply(world,
                     {regression_login, get_role_regress_login, []}).

check_role_regress_login(Role = #role{id = RoleId}) ->
    case var:get_var(Role, other, 2062, #regression_login{})
        of
        #regression_login{time_return = TimeReturn, flag = 1}
            when TimeReturn >= 1511857680 andalso
                     TimeReturn < 1511859960 ->
            case catch ets:lookup(friend_recalled, RoleId) of
                [#friend_recalled{time_return = RecalledTimeReturn}]
                    when RecalledTimeReturn < 1511857680 ->
                    logger:info("角色回归数据异常:~w",
                                [RoleId],
                                regression_login,
                                361),
                    ok;
                _ -> ok
            end;
        _ -> ok
    end.

get_role_regress_login(Role = #role{id = RoleId}) ->
    case var:get_var(Role, other, 2062, #regression_login{})
        of
        Rl = #regression_login{time_return = TimeReturn,
                               flag = 1, rewards = OldRewards}
            when TimeReturn >= 1511857680 andalso
                     TimeReturn < 1511859960 ->
            case catch ets:lookup(friend_recalled, RoleId) of
                [#friend_recalled{time_return = RecalledTimeReturn}]
                    when RecalledTimeReturn < 1511857680 ->
                    logger:info("角色回归数据异常:~w",
                                [RoleId],
                                regression_login,
                                374),
                    NewRl = Rl#regression_login{flag = 2,
                                                time_return =
                                                    RecalledTimeReturn,
                                                rewards =
                                                    [{7, 5, 1511857680}
                                                     | OldRewards]},
                    ChgRlRole = var:set_var(Role, other, 2062, NewRl),
                    {ok, HonorRole} = honor:del(ChgRlRole, 31026, push),
                    NewRole = HonorRole,
                    push_9938(HonorRole),
                    {ok, NewRole};
                _ -> ok
            end;
        _ -> ok
    end.

