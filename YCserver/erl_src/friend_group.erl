-file("src/mod/friend/friend_group.erl", 1).

-module(friend_group).

-behaviour(gen_server).

-export([push_group/2,
         push_role/1,
         push_19009/1,
         login/1,
         logout/1,
         create/2,
         invite/3,
         quit/2,
         quit/1,
         disband/2,
         update_name/3,
         update_content/3,
         kicked/3,
         reply_invite/4,
         reply_invite/1,
         apply_for/3,
         apply_for/1,
         reply_apply_for/4,
         apply_for_accept/2,
         notice/3,
         notice/1,
         chat/3,
         chat_check/2,
         check/2,
         send_to_all/1,
         get_offline/1,
         fetch/1,
         fetch_role/1,
         fetch_local/1,
         fetch_role_local/1,
         save/1,
         save_local/1,
         save_chat/3]).

-export([start_link/0, call/1, cast/1, info/1]).

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

-file("src/mod/friend/friend_group.erl", 61).

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

-file("src/mod/friend/friend_group.erl", 62).

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

-file("src/mod/friend/friend_group.erl", 63).

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

-file("src/mod/friend/friend_group.erl", 64).

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

-file("src/mod/friend/friend_group.erl", 65).

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

-file("src/mod/friend/friend_group.erl", 66).

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

-file("src/mod/friend/friend_group.erl", 67).

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

-file("src/mod/friend/friend_group.erl", 68).

-file("inc/chat.hrl", 1).

-record(chat_msg,
        {rid = {0, "", 0} :: non_neg_integer(),
         platform = "" :: binary(),
         zone_id = 0 :: non_neg_integer(),
         channel = 0 :: non_neg_integer(),
         name = "" :: binary(),
         sex = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         msg = "" :: binary(),
         guild_name = "",
         special = [] :: [tuple()]}).

-record(chat_voice,
        {role_id,
         voice = <<>>,
         text = "",
         time = 0,
         channel,
         group_id}).

-record(chat_offline, {id = {0, "", 0}, msgs = []}).

-file("src/mod/friend/friend_group.erl", 69).

login(#role{id = RoleId, pid = Pid, name = RoleName,
            sex = RoleSex, classes = RoleClasses, lev = RoleLev}) ->
    logger:debug("好友群组上线登陆", [], friend_group, 83),
    Groups = case fetch_role(RoleId) of
                 #friend_group_role{groups = _Groups} -> _Groups;
                 _ -> []
             end,
    Now = date:unixtime(),
    lists:foreach(fun (#friend_group_data{group_id =
                                              GroupId = {_,
                                                         Platform,
                                                         ZoneId}}) ->
                          Args = #{role_id => RoleId, pid => Pid, time => Now,
                                   group_id => GroupId, role_name => RoleName,
                                   role_sex => RoleSex,
                                   role_classes => RoleClasses,
                                   role_lev => RoleLev},
                          case role_misc:is_local_role(GroupId) of
                              true -> info({login, Args});
                              _ ->
                                  big_world:cast(Platform,
                                                 ZoneId,
                                                 friend_group,
                                                 info,
                                                 [{login, Args}])
                          end
                  end,
                  Groups),
    ok.

logout(#role{id = RoleId, name = RoleName,
             sex = RoleSex, classes = RoleClasses, lev = RoleLev}) ->
    Groups = case fetch_role(RoleId) of
                 #friend_group_role{groups = _Groups} -> _Groups;
                 _ -> []
             end,
    Now = date:unixtime(),
    lists:foreach(fun (#friend_group_data{group_id =
                                              GroupId = {_,
                                                         Platform,
                                                         ZoneId}}) ->
                          Args = #{role_id => RoleId, time => Now,
                                   group_id => GroupId, role_name => RoleName,
                                   role_sex => RoleSex,
                                   role_classes => RoleClasses,
                                   role_lev => RoleLev},
                          case role_misc:is_local_role(GroupId) of
                              true -> info({logout, Args});
                              _ ->
                                  big_world:cast(Platform,
                                                 ZoneId,
                                                 friend_group,
                                                 info,
                                                 [{logout, Args}])
                          end
                  end,
                  Groups),
    ok.

push_group(Role, GroupId) when is_record(Role, role) ->
    case fetch(GroupId) of
        {ok, Group} -> role:link_send(Role, 19000, {Group});
        _R -> ok
    end;
push_group(RoleId, GroupId) ->
    case fetch(GroupId) of
        {ok, Group} -> role:pack_send(RoleId, 19000, {Group});
        _ -> ok
    end.

push_role(Role = #role{id = RoleId}) ->
    GroupRole = fetch_role(RoleId),
    role:link_send(Role, 19001, {GroupRole, 0});
push_role(RoleId) ->
    case fetch_role(RoleId) of
        false -> ignore;
        GroupRole ->
            role:pack_send(RoleId, 19001, {GroupRole, 0})
    end.

push_19009(Role = #role{id = RoleId}) ->
    GroupRole = fetch_role(RoleId),
    role:link_send(Role, 19009, {GroupRole}).

send_to_all(GroupId = {_, Platform, ZoneId}) ->
    logger:debug("=========== ~w",
                 [GroupId],
                 friend_group,
                 153),
    case role_misc:is_local_role(GroupId) of
        true -> cast({send_to_all, GroupId});
        _ ->
            big_world:cast(Platform,
                           ZoneId,
                           friend_group,
                           send_to_all,
                           [GroupId])
    end.

create(Role = #role{id = RoleId, lev = RoleLev,
                    name = RoleName, sex = RoleSex, classes = RoleClasses,
                    pid = Pid},
       GroupName) ->
    #friend_group_role{create = Create, unlock = Unlock} =
        fetch_role(RoleId),
    case friend_group_data:get(Create + 1) of
        #{lev := Lev} when RoleLev < Lev ->
            {false,
             notice:format(lang:get("等级不足~ts级,不能创建"),
                           [{string_2, 1, Lev}])};
        #{cost := Cost} ->
            case role_gain:do_notice(format:val_to_loss(Cost), Role)
                of
                {ok, Role1} ->
                    do_create(Role1,
                              #{role_id => RoleId, role_name => RoleName,
                                role_sex => RoleSex,
                                role_classes => RoleClasses,
                                role_lev => RoleLev, group_name => GroupName,
                                pid => Pid, unlock => Unlock + 1});
                {false, #loss{msg = Msg}} -> {false, Msg}
            end;
        _ -> {false, lang:get("没有可创建次数")}
    end.

do_create(Role, Args) ->
    case call({create, Args}) of
        {ok, GroupId} ->
            role:link_send(Role, 19002, {1, lang:get("创建成功")}),
            push_group(Role, GroupId),
            push_role(Role),
            {ok, Role};
        {false, Reason} -> {false, Reason};
        _R -> {false, lang:get("系统繁忙")}
    end.

invite(#role{id = RoleId}, _GroupId, TargeId)
    when RoleId =:= TargeId ->
    {false, lang:get("不能邀請自己")};
invite(#role{id = RoleId, name = RoleName,
             lev = RoleLev, sex = RoleSex, classes = RoleClasses},
       GroupId = {_, Platform, ZoneId}, TargeId) ->
    Args = #{role_id => RoleId, role_name => RoleName,
             group_id => GroupId, targe_id => TargeId,
             role_classes => RoleClasses, role_sex => RoleSex,
             role_lev => RoleLev},
    case role_misc:is_local_role(GroupId) of
        true -> invite(Args);
        _ ->
            case big_world:call(Platform,
                                ZoneId,
                                friend_group,
                                invite,
                                [Args])
                of
                {error, _} -> {false, lang:get("未连接跨服")};
                Eles -> Eles
            end
    end.

invite(Args = #{targe_id := _TargeId}) ->
    case call({invite, Args}) of
        ok -> {ok, lang:get("邀请成功")};
        {ok, #{friend_group_role := _NewFGR}} ->
            {ok, lang:get("邀请成功")};
        {false, Reason} -> {false, Reason};
        _R ->
            logger:info("~w", [_R], friend_group, 223),
            {false, lang:get("系统繁忙")}
    end.

quit(#role{id = RoleId, name = RoleName},
     GroupId = {_, Platform, ZoneId}) ->
    Args = #{role_id => RoleId, role_name => RoleName,
             group_id => GroupId},
    case role_misc:is_local_role(GroupId) of
        true -> quit(Args);
        _ ->
            case big_world:call(Platform,
                                ZoneId,
                                friend_group,
                                quit,
                                [Args])
                of
                {error, _} -> {false, lang:get("跨服未准备好")};
                Else -> Else
            end
    end.

quit(Args) ->
    case call({quit, Args}) of
        ok -> ok;
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("系统繁忙")}
    end.

disband(_Role = #role{id = RoleId}, GroupId) ->
    case call({disband,
               #{role_id => RoleId, group_id => GroupId}})
        of
        {ok, #{name := Name}} -> {ok, Name};
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("系统繁忙")}
    end.

update_name(#role{id = RoleId, name = RoleName},
            GroupId, Name) ->
    case call({update_name,
               #{role_id => RoleId, role_name => RoleName,
                 new_name => Name, group_id => GroupId}})
        of
        ok ->
            send_to_all(GroupId),
            ok;
        {false, Reason} -> {false, Reason};
        _R -> {false, lang:get("系统繁忙")}
    end.

update_content(#role{id = RoleId, name = RoleName},
               GroupId, Name) ->
    case call({update_content,
               #{role_id => RoleId, role_name => RoleName,
                 new_content => Name, group_id => GroupId}})
        of
        ok ->
            send_to_all(GroupId),
            ok;
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("系统繁忙")}
    end.

kicked(#role{id = RoleId, name = RoleName}, GroupId,
       TargetId) ->
    case call({kicked,
               #{role_id => RoleId, target_id => TargetId,
                 group_id => GroupId, role_name => RoleName}})
        of
        {ok, Msg} ->
            send_to_all(GroupId),
            {ok, Msg};
        {false, Reason} -> {false, Reason};
        _R -> {false, lang:get("系统繁忙")}
    end.

reply_invite(#role{id = RoleId, name = RoleName,
                   classes = RoleClasses, lev = RoleLev, sex = RoleSex,
                   pid = Pid},
             GroupId = {_, Platform, ZoneId}, InviteId, Flag) ->
    RoleData = #friend_group_role_data{role_id = RoleId,
                                       role_name = RoleName,
                                       role_classes = RoleClasses,
                                       role_lev = RoleLev, role_sex = RoleSex,
                                       online = 1, notice = 1, pid = Pid},
    Args = #{role_data => RoleData, role_id => RoleId,
             role_name => RoleName, group_id => GroupId,
             invite_id => InviteId, flag => Flag},
    case role_misc:is_local_role(GroupId) of
        true -> reply_invite(Args);
        _ ->
            case big_world:call(Platform,
                                ZoneId,
                                friend_group,
                                reply_invite,
                                [Args])
                of
                {error, _R} -> {false, lang:get("未连接跨服")};
                Eles -> Eles
            end
    end.

reply_invite(Args) ->
    case call({reply_invite, Args}) of
        {ok, Msg} -> {ok, Msg};
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("系统繁忙")}
    end.

notice(#role{id = RoleId},
       GroupId = {_, Platform, ZoneId}, Flag) ->
    Args = #{group_id => GroupId, flag => Flag,
             role_id => RoleId},
    case role_misc:is_local_role(GroupId) of
        true -> notice(Args);
        _ ->
            case big_world:call(Platform,
                                ZoneId,
                                friend_group,
                                notice,
                                [Args])
                of
                {error, _} -> {false, lang:get("未连接跨服")};
                Eles -> Eles
            end
    end.

notice(Args) ->
    case call({notice, Args}) of
        ok -> ok;
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("系统繁忙")}
    end.

apply_for(_Role, _GroupId, Flag) when Flag =:= 0 -> ok;
apply_for(#role{id = RoleId, name = RoleName,
                lev = RoleLev, sex = RoleSex, classes = RoleClasses},
          GroupId = {_, Platform, ZoneId}, _Flag) ->
    Args = #{role_id => RoleId, role_name => RoleName,
             group_id => GroupId, role_classes => RoleClasses,
             role_sex => RoleSex, role_lev => RoleLev},
    case role_misc:is_local_role(GroupId) of
        true -> apply_for(Args);
        _ ->
            case big_world:call(Platform,
                                ZoneId,
                                friend_group,
                                apply_for,
                                [Args])
                of
                {error, _R} -> {false, lang:get("未连接跨服")};
                Eles -> Eles
            end
    end.

apply_for(Args) ->
    case call({apply_for, Args}) of
        ok -> {ok, lang:get("你已成功申请加入该群组,请耐心等待群主审批")};
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("系统繁忙")}
    end.

reply_apply_for(#role{id = RoleId}, GroupId,
                ApplyRoleId, Flag) ->
    Args = #{role_id => RoleId, group_id => GroupId,
             apply_id => ApplyRoleId, flag => Flag},
    case role_misc:is_local_role(GroupId) of
        true -> reply_apply_for(Args);
        _ -> {false, lang:get("只有群主有权限")}
    end.

reply_apply_for(Args = #{group_id := GroupId}) ->
    case call({reply_apply_for, Args}) of
        ok ->
            send_to_all(GroupId),
            ok;
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("系统繁忙")}
    end.

apply_for_accept(Role, GroupId) ->
    logger:debug("===========更新个人数据==========",
                 [],
                 friend_group,
                 402),
    login(Role),
    push_group(Role, GroupId),
    push_role(Role),
    ok.

chat(GroupId = {_, Platform, ZoneId}, Cmd, Msg) ->
    case role_misc:is_local_role(GroupId) of
        true -> info({chat, GroupId, Cmd, Msg});
        _ ->
            big_world:cast(Platform,
                           ZoneId,
                           friend_group,
                           chat,
                           [GroupId, Cmd, Msg])
    end.

chat_check(#role{id = RoleId}, GroupId) ->
    logger:debug("================ ~w",
                 [{GroupId, fetch_role(RoleId)}],
                 friend_group,
                 420),
    case fetch_role(RoleId) of
        #friend_group_role{groups = Groups} ->
            case lists:keyfind(GroupId,
                               #friend_group_data.group_id,
                               Groups)
                of
                false -> false;
                _ -> ok
            end;
        _ -> false
    end.

chat_system(GroupId, Msg) ->
    chat(GroupId,
         10424,
         {9, GroupId, 0, "", 0, "", 0, 0, 0, Msg, "", []}).

get_offline(#role{id = RoleId, pid = Pid}) ->
    info({get_offline, RoleId, Pid}).

cast(Args) -> gen_server:cast(friend_group, Args).

call(Args) ->
    case catch gen_server:call(friend_group, Args, 10000) of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

info(Args) -> friend_group ! Args.

start_link() ->
    gen_server:start_link({local, friend_group},
                          friend_group,
                          [],
                          []).

init([]) ->
    logger:info("开始启动...", [], friend_group, 458),
    process_flag(trap_exit, true),
    ets:new(friend_group,
            [set, named_table, public, {keypos, #friend_group.id}]),
    dets:open_file(friend_group,
                   [{file, "./dets/friend_group.dets"},
                    {keypos, #friend_group.id},
                    {type, set}]),
    ets:new(friend_group_role,
            [set,
             named_table,
             public,
             {keypos, #friend_group_role.id}]),
    dets:open_file(friend_group_role,
                   [{file, "./dets/friend_group_role.dets"},
                    {keypos, #friend_group_role.id},
                    {type, set}]),
    ets:new(friend_group_chat,
            [set,
             named_table,
             public,
             {keypos, #friend_group_chat.role_id}]),
    dets:open_file(friend_group_chat,
                   [{file, "./dets/friend_group_chat.dets"},
                    {keypos, #friend_group_chat.role_id},
                    {type, set}]),
    Tref = erlang:send_after(date:next_diff(3, 0, 0) * 1000,
                             friend_group,
                             clean),
    put(clean_tref, Tref),
    case load_data() of
        [] ->
            logger:info("启动完成", [], friend_group, 471),
            {ok, #{}};
        _StartErr ->
            logger:error("好友群组加载数据失败:~w",
                         [_StartErr],
                         friend_group,
                         474),
            {stop, data_load_err}
    end.

handle_call({create,
             #{role_id := RoleId, role_name := RoleName,
               role_sex := RoleSex, role_classes := RoleClasses,
               role_lev := RoleLev, group_name := GroupName,
               pid := Pid}},
            _From, State) ->
    FGR = #friend_group_role{groups = Groups,
                             create = Create} =
              fetch_role(RoleId),
    Reply = case Create < 2 of
                true ->
                    GroupId = get_id(),
                    FriendGroup = #friend_group{id = GroupId,
                                                name = GroupName,
                                                owner_id = RoleId,
                                                owner_name = RoleName,
                                                owner_classes = RoleClasses,
                                                owner_lev = RoleLev,
                                                owner_sex = RoleSex,
                                                time = date:unixtime(),
                                                members =
                                                    [#friend_group_role_data{role_id
                                                                                 =
                                                                                 RoleId,
                                                                             role_name
                                                                                 =
                                                                                 RoleName,
                                                                             role_classes
                                                                                 =
                                                                                 RoleClasses,
                                                                             role_lev
                                                                                 =
                                                                                 RoleLev,
                                                                             role_sex
                                                                                 =
                                                                                 RoleSex,
                                                                             online
                                                                                 =
                                                                                 1,
                                                                             notice
                                                                                 =
                                                                                 1,
                                                                             post
                                                                                 =
                                                                                 1,
                                                                             pid
                                                                                 =
                                                                                 Pid}]},
                    save(FriendGroup),
                    Fgd = #friend_group_data{group_id = GroupId,
                                             group_name = GroupName,
                                             owner_id = RoleId,
                                             owner_name = RoleName,
                                             owner_classes = RoleClasses,
                                             owner_sex = RoleSex,
                                             time = date:unixtime()},
                    Fgd1 = lists:keystore(GroupId,
                                          #friend_group_data.group_id,
                                          Groups,
                                          Fgd),
                    save(FGR#friend_group_role{groups = Fgd1,
                                               create = Create + 1}),
                    {ok, GroupId};
                _ -> {false, lang:get("没有可创建次数")}
            end,
    {reply, Reply, State};
handle_call({invite,
             Args = #{role_id := RoleId, role_name := RoleName,
                      group_id := GroupId,
                      targe_id := TargeId = {_, TPlatform, TZoneId},
                      role_classes := RoleClasses, role_sex := RoleSex,
                      role_lev := RoleLev}},
            _From, State) ->
    Reply = case fetch(GroupId) of
                {ok,
                 #friend_group{id = GroupId, name = GroupName,
                               invites = Invites, owner_id = OwnerId} =
                     FriendGroup}
                    when OwnerId =:= RoleId ->
                    case check([invite_num, member, invite],
                               Args#{friend_group => FriendGroup})
                        of
                        ok ->
                            case fetch_role(TargeId) of
                                FGR = #friend_group_role{inviteds = Inviteds} ->
                                    Invite = {{RoleId, TargeId},
                                              TargeId,
                                              date:unixtime()},
                                    Inviteds1 = lists:keystore({RoleId,
                                                                GroupId},
                                                               1,
                                                               Inviteds,
                                                               {{RoleId,
                                                                 GroupId},
                                                                GroupName,
                                                                RoleName,
                                                                date:unixtime(),
                                                                RoleClasses,
                                                                RoleSex,
                                                                RoleLev}),
                                    NewFGR = FGR#friend_group_role{inviteds =
                                                                       Inviteds1},
                                    save(FriendGroup#friend_group{invites =
                                                                      [Invite
                                                                       | Invites]}),
                                    save(NewFGR),
                                    case role_misc:is_local_role(TargeId) of
                                        true ->
                                            role:pack_send(TargeId,
                                                           19009,
                                                           {NewFGR});
                                        _ ->
                                            big_world:cast(TPlatform,
                                                           TZoneId,
                                                           role,
                                                           pack_send,
                                                           [TargeId,
                                                            19009,
                                                            {NewFGR}])
                                    end,
                                    {ok, #{friend_group_role => NewFGR}};
                                _ -> {false, lang:get("未连接跨服")}
                            end;
                        {false, Reason} -> {false, Reason}
                    end;
                {ok, #friend_group{name = GroupName} = FriendGroup} ->
                    case check([invite_num, member, invite],
                               Args#{friend_group => FriendGroup})
                        of
                        ok ->
                            case role_misc:is_local_role(TargeId) of
                                true ->
                                    role:pack_send(TargeId,
                                                   19012,
                                                   {RoleName,
                                                    GroupId,
                                                    GroupName});
                                _ ->
                                    big_world:cast(TPlatform,
                                                   TZoneId,
                                                   role,
                                                   pack_send,
                                                   [TargeId,
                                                    19012,
                                                    {RoleName,
                                                     GroupId,
                                                     GroupName}])
                            end,
                            {ok, #{friend_group_role => FriendGroup}};
                        {false, Reason} -> {false, Reason}
                    end;
                _ -> ok
            end,
    {reply, Reply, State};
handle_call({quit,
             Args = #{role_id := RoleId, role_name := RoleName,
                      group_id := GroupId}},
            _From, State) ->
    Reply = case fetch(GroupId) of
                {ok, #friend_group{members = Members} = FriendGroup} ->
                    case check([quit], Args#{friend_group => FriendGroup})
                        of
                        ok ->
                            Members1 = lists:keydelete(RoleId,
                                                       #friend_group_role_data.role_id,
                                                       Members),
                            FriendGroup1 = FriendGroup#friend_group{members =
                                                                        Members1},
                            FGR = #friend_group_role{groups = Groups,
                                                     join = Join} =
                                      fetch_role(RoleId),
                            FGR1 = FGR#friend_group_role{groups =
                                                             lists:keydelete(GroupId,
                                                                             #friend_group_data.group_id,
                                                                             Groups),
                                                         join = Join - 1},
                            save(FriendGroup1),
                            save(FGR1),
                            chat_system(GroupId,
                                        notice:format(lang:get("~ts离开该群"),
                                                      [{string_1, RoleName}])),
                            ok;
                        {false, Reason} -> {false, Reason}
                    end;
                _ -> {false, lang:get("该群组已解散")}
            end,
    {reply, Reply, State};
handle_call({disband,
             Args = #{role_id := RoleId, group_id := GroupId}},
            _From, State) ->
    Reply = case fetch(GroupId) of
                {ok, #friend_group{owner_id = OwnerId}}
                    when RoleId =/= OwnerId ->
                    {false, lang:get("你不是群组,不能解散该群组")};
                {ok,
                 #friend_group{members = Members, name = GroupName,
                               owner_name = OwnerName} =
                     FriendGroup} ->
                    case check([disband],
                               Args#{friend_group => FriendGroup})
                        of
                        ok ->
                            Fun = fun (#friend_group_role_data{role_id =
                                                                   OtherId,
                                                               pid = Pid}) ->
                                          case fetch_role(OtherId) of
                                              FGR = #friend_group_role{groups =
                                                                           Groups,
                                                                       join =
                                                                           Join,
                                                                       create =
                                                                           Create} ->
                                                  Groups1 =
                                                      lists:keydelete(GroupId,
                                                                      #friend_group_data.group_id,
                                                                      Groups),
                                                  {Create1, Join1, Notice1} =
                                                      case OtherId =:= RoleId of
                                                          true ->
                                                              {Create - 1,
                                                               Join,
                                                               notice:format(lang:get("你解散了~ts群"),
                                                                             [{string_1,
                                                                               GroupName}])};
                                                          _ ->
                                                              {Create,
                                                               Join - 1,
                                                               notice:format(lang:get("群主~ts解散了~ts群"),
                                                                             [{string_1,
                                                                               OwnerName},
                                                                              {string_1,
                                                                               GroupName}])}
                                                      end,
                                                  save(FGR#friend_group_role{groups
                                                                                 =
                                                                                 Groups1,
                                                                             join
                                                                                 =
                                                                                 Join1,
                                                                             create
                                                                                 =
                                                                                 Create1}),
                                                  case is_pid(Pid) of
                                                      true ->
                                                          role:pack_send(Pid,
                                                                         19005,
                                                                         {1,
                                                                          Notice1}),
                                                          push_role(OtherId);
                                                      _ -> ok
                                                  end;
                                              _ -> ignore
                                          end
                                  end,
                            lists:foreach(Fun, Members),
                            delete(GroupId),
                            {ok, #{name => GroupName}};
                        {false, Reason} -> {false, Reason}
                    end;
                _ -> {false, lang:get("该群组已解散")}
            end,
    {reply, Reply, State};
handle_call({reply_invite,
             Args = #{role_data := RoleData, role_id := RoleId,
                      role_name := RoleName, invite_id := InviteId,
                      flag := Flag, group_id := GroupId}},
            _From, State) ->
    FGR = #friend_group_role{groups = Groups,
                             inviteds = Inviteds, join = Join} =
              fetch_role(RoleId),
    Reply = case fetch(GroupId) of
                {ok, #friend_group{invites = Invites} = FriendGroup}
                    when Flag =:= 0 ->
                    Invites1 = lists:keydelete({InviteId, RoleId},
                                               1,
                                               Invites),
                    FriendGroup1 = FriendGroup#friend_group{invites =
                                                                Invites1},
                    save(FriendGroup1),
                    save(FGR#friend_group_role{inviteds =
                                                   lists:keydelete({InviteId,
                                                                    GroupId},
                                                                   1,
                                                                   Inviteds)}),
                    {ok, ""};
                {ok,
                 #friend_group{invites = Invites, members = Members,
                               content = Content, name = GroupName,
                               owner_id = OwnerId, owner_sex = OwnerSex,
                               owner_classes = OwnerClasses} =
                     FriendGroup} ->
                    delete_invite(GroupId, RoleId),
                    case check([join_num, invited, join],
                               Args#{friend_group => FriendGroup, join => Join})
                        of
                        ok ->
                            Invites1 = lists:keydelete({InviteId, RoleId},
                                                       1,
                                                       Invites),
                            {Members1, Groups1, Join1} = case Flag of
                                                             1 ->
                                                                 chat_system(GroupId,
                                                                             notice:format(lang:get("~ts加入该群"),
                                                                                           [{string_1,
                                                                                             RoleName}])),
                                                                 {[RoleData
                                                                   | Members],
                                                                  lists:keystore(GroupId,
                                                                                 #friend_group_data.group_id,
                                                                                 Groups,
                                                                                 #friend_group_data{group_id
                                                                                                        =
                                                                                                        GroupId,
                                                                                                    group_content
                                                                                                        =
                                                                                                        Content,
                                                                                                    group_name
                                                                                                        =
                                                                                                        GroupName,
                                                                                                    owner_id
                                                                                                        =
                                                                                                        OwnerId,
                                                                                                    time
                                                                                                        =
                                                                                                        date:unixtime(),
                                                                                                    owner_sex
                                                                                                        =
                                                                                                        OwnerSex,
                                                                                                    owner_classes
                                                                                                        =
                                                                                                        OwnerClasses}),
                                                                  Join + 1};
                                                             _ ->
                                                                 {Members,
                                                                  Groups,
                                                                  Join}
                                                         end,
                            save(FGR#friend_group_role{groups = Groups1,
                                                       inviteds =
                                                           lists:keydelete({InviteId,
                                                                            GroupId},
                                                                           1,
                                                                           Inviteds),
                                                       join = Join1}),
                            FriendGroup1 = FriendGroup#friend_group{invites =
                                                                        Invites1,
                                                                    members =
                                                                        Members1},
                            save(FriendGroup1),
                            {ok,
                             notice:format(lang:get("成功加入~ts群组"),
                                           [{string_1, GroupName}])};
                        {false, Reason} -> {false, Reason}
                    end;
                _R ->
                    save(FGR#friend_group_role{inviteds =
                                                   lists:keydelete({InviteId,
                                                                    GroupId},
                                                                   1,
                                                                   Inviteds)}),
                    {false, lang:get("该群组已解散")}
            end,
    {reply, Reply, State};
handle_call({update_name,
             #{role_id := RoleId, role_name := RoleName,
               group_id := GroupId, new_name := GroupName}},
            _From, State) ->
    Reply = case fetch(GroupId) of
                {ok, #friend_group{owner_id = OwnerId}}
                    when OwnerId =/= RoleId ->
                    {false, lang:get("非群主无法修改")};
                {ok, #friend_group{members = Members} = FriendGroup} ->
                    FriendGroup1 = FriendGroup#friend_group{name =
                                                                GroupName},
                    save(FriendGroup1),
                    update_member(Members, GroupId, group_name, GroupName),
                    send_to_all(GroupId),
                    chat_system(GroupId,
                                notice:format(lang:get("~ts修改了群名称:~ts"),
                                              [{string_1, RoleName},
                                               {string_1, GroupName}])),
                    ok;
                _ -> {false, lang:get("该群组已解散")}
            end,
    {reply, Reply, State};
handle_call({update_content,
             #{role_id := RoleId, role_name := RoleName,
               group_id := GroupId, new_content := Content}},
            _From, State) ->
    Reply = case fetch(GroupId) of
                {ok, #friend_group{owner_id = OwnerId}}
                    when OwnerId =/= RoleId ->
                    {false, lang:get("非群主无法修改")};
                {ok, #friend_group{members = Members} = FriendGroup} ->
                    FriendGroup1 = FriendGroup#friend_group{content =
                                                                Content},
                    update_member(Members, GroupId, group_content, Content),
                    save(FriendGroup1),
                    chat_system(GroupId,
                                notice:format(lang:get("~ts修改了群公告:~ts"),
                                              [{string_1, RoleName},
                                               {string_1, Content}])),
                    ok;
                _ -> {false, lang:get("该群组已解散")}
            end,
    {reply, Reply, State};
handle_call({kicked,
             Args = #{group_id := GroupId, role_id := RoleId,
                      role_name := _RoleName, target_id := TargetId}},
            _From, State) ->
    Reply = case fetch(GroupId) of
                {ok, #friend_group{owner_id = OwnerId}}
                    when OwnerId =/= RoleId ->
                    {false, lang:get("只有群主有权限")};
                {ok, #friend_group{}} when RoleId =:= TargetId ->
                    {false, lang:get("不能踢自己")};
                {ok,
                 #friend_group{members = Members, name = GroupName} =
                     FriendGroup} ->
                    case check([kicked], Args#{friend_group => FriendGroup})
                        of
                        ok ->
                            case fetch_role(TargetId) of
                                Fgr = #friend_group_role{groups = Groups,
                                                         join = Join} ->
                                    #friend_group_role_data{role_name =
                                                                TargetName} =
                                        lists:keyfind(TargetId,
                                                      #friend_group_role_data.role_id,
                                                      Members),
                                    Members1 = lists:keydelete(TargetId,
                                                               #friend_group_role_data.role_id,
                                                               Members),
                                    FriendGroup1 =
                                        FriendGroup#friend_group{members =
                                                                     Members1},
                                    Groups1 = lists:keydelete(GroupId,
                                                              #friend_group_data.group_id,
                                                              Groups),
                                    save(FriendGroup1),
                                    save(Fgr#friend_group_role{groups = Groups1,
                                                               join =
                                                                   Join - 1}),
                                    notice:send(TargetId,
                                                1,
                                                notice:format(lang:get("很遗憾你被请离~ts群组"),
                                                              [{string_1,
                                                                GroupName}])),
                                    mail:send(TargetId,
                                              lang:get("离开群组"),
                                              notice:format(lang:get("群主遗憾的选择让您离开~ts群组"),
                                                            [{string_1,
                                                              GroupName}])),
                                    chat_system(GroupId,
                                                notice:format(lang:get("~ts被请离了"),
                                                              [{string_1,
                                                                TargetName}])),
                                    push_role(TargetId),
                                    {ok,
                                     notice:format(lang:get("你成功将~ts踢出群组"),
                                                   [{string_1, TargetName}])};
                                _ -> {false, lang:get("当前状态不能剔除跨服玩家")}
                            end;
                        {false, Reason} -> {false, Reason}
                    end;
                _ -> {false, lang:get("该群组已解散")}
            end,
    {reply, Reply, State};
handle_call({notice,
             Args = #{group_id := GroupId, role_id := RoleId,
                      flag := Flag}},
            _From, State) ->
    Reply = case fetch(GroupId) of
                {ok, #friend_group{members = Members} = FriendGroup} ->
                    case check([inside], Args#{friend_group => FriendGroup})
                        of
                        ok ->
                            GroupRole = lists:keyfind(RoleId,
                                                      #friend_group_role_data.role_id,
                                                      Members),
                            Members1 = lists:keystore(RoleId,
                                                      #friend_group_role_data.role_id,
                                                      Members,
                                                      GroupRole#friend_group_role_data{notice
                                                                                           =
                                                                                           Flag}),
                            save(FriendGroup#friend_group{members = Members1}),
                            ok;
                        {false, Reason} -> {false, Reason}
                    end;
                _ -> {false, lang:get("该群组已解散")}
            end,
    {reply, Reply, State};
handle_call({apply_for,
             Args = #{role_id := RoleId, role_name := RoleName,
                      group_id := GroupId, role_classes := RoleClasses,
                      role_sex := RoleSex, role_lev := RoleLev}},
            _From, State) ->
    Reply = case fetch(GroupId) of
                {ok,
                 #friend_group{id = GroupId, name = GroupName,
                               owner_id = OwnerId} =
                     FriendGroup} ->
                    case fetch_role(OwnerId) of
                        Fgr = #friend_group_role{applys = Applys} ->
                            case check([join_num, apply],
                                       Args#{friend_group => FriendGroup,
                                             applys => Applys})
                                of
                                ok ->
                                    NewApplys = lists:keystore({RoleId,
                                                                GroupId},
                                                               1,
                                                               Applys,
                                                               {{RoleId,
                                                                 GroupId},
                                                                GroupName,
                                                                RoleName,
                                                                RoleClasses,
                                                                RoleSex,
                                                                RoleLev}),
                                    NewFgr = Fgr#friend_group_role{applys =
                                                                       NewApplys},
                                    save(NewFgr),
                                    role:pack_send(OwnerId, 19009, {NewFgr}),
                                    ok;
                                {false, Reason} -> {false, Reason}
                            end;
                        _ -> {false, lang:get("群主数据错误")}
                    end;
                _ -> ok
            end,
    {reply, Reply, State};
handle_call({reply_apply_for,
             Args = #{role_id := RoleId, group_id := GroupId,
                      apply_id := ApplyId = {_, APlatform, AZoneId},
                      flag := Flag}},
            _From, State) ->
    Reply = case fetch(GroupId) of
                {ok,
                 #friend_group{id = GroupId, name = GroupName,
                               owner_id = OwnerId, members = Members,
                               content = Content, owner_classes = OwnerClasses,
                               owner_sex = OwnerSex} =
                     FriendGroup}
                    when OwnerId =:= RoleId ->
                    case fetch_role(RoleId) of
                        Fgr = #friend_group_role{applys = Applys}
                            when Flag =:= 0 ->
                            NewFgr = Fgr#friend_group_role{applys =
                                                               lists:keydelete({ApplyId,
                                                                                GroupId},
                                                                               1,
                                                                               Applys)},
                            save(NewFgr),
                            role:pack_send(OwnerId, 19009, {NewFgr}),
                            ok;
                        Fgr = #friend_group_role{applys = Applys} ->
                            case check([join_num, reply_apply],
                                       Args#{friend_group => FriendGroup,
                                             applys => Applys})
                                of
                                ok ->
                                    case fetch_role(ApplyId) of
                                        ApplyFgr = #friend_group_role{groups =
                                                                          Groups,
                                                                      join =
                                                                          Join} ->
                                            case lists:keyfind({ApplyId,
                                                                GroupId},
                                                               1,
                                                               Applys)
                                                of
                                                {_,
                                                 GroupName,
                                                 RoleName,
                                                 RoleClasses,
                                                 RoleSex,
                                                 RoleLev} ->
                                                    RoleData =
                                                        #friend_group_role_data{role_id
                                                                                    =
                                                                                    ApplyId,
                                                                                role_name
                                                                                    =
                                                                                    RoleName,
                                                                                role_classes
                                                                                    =
                                                                                    RoleClasses,
                                                                                role_lev
                                                                                    =
                                                                                    RoleLev,
                                                                                role_sex
                                                                                    =
                                                                                    RoleSex},
                                                    chat_system(GroupId,
                                                                notice:format(lang:get("~ts加入该群"),
                                                                              [{string_1,
                                                                                RoleName}])),
                                                    Members1 = [RoleData
                                                                | Members],
                                                    Groups1 =
                                                        lists:keystore(GroupId,
                                                                       #friend_group_data.group_id,
                                                                       Groups,
                                                                       #friend_group_data{group_id
                                                                                              =
                                                                                              GroupId,
                                                                                          group_content
                                                                                              =
                                                                                              Content,
                                                                                          group_name
                                                                                              =
                                                                                              GroupName,
                                                                                          owner_id
                                                                                              =
                                                                                              OwnerId,
                                                                                          time
                                                                                              =
                                                                                              date:unixtime(),
                                                                                          owner_sex
                                                                                              =
                                                                                              OwnerSex,
                                                                                          owner_classes
                                                                                              =
                                                                                              OwnerClasses}),
                                                    NewApplyFgr =
                                                        ApplyFgr#friend_group_role{groups
                                                                                       =
                                                                                       Groups1,
                                                                                   join
                                                                                       =
                                                                                       Join
                                                                                           +
                                                                                           1},
                                                    save(NewApplyFgr),
                                                    NewFgr =
                                                        Fgr#friend_group_role{applys
                                                                                  =
                                                                                  lists:keydelete({ApplyId,
                                                                                                   GroupId},
                                                                                                  1,
                                                                                                  Applys)},
                                                    FriendGroup1 =
                                                        FriendGroup#friend_group{members
                                                                                     =
                                                                                     Members1},
                                                    save(NewFgr),
                                                    save(FriendGroup1),
                                                    role:pack_send(OwnerId,
                                                                   19009,
                                                                   {NewFgr}),
                                                    case
                                                        role_misc:is_local_role(ApplyId)
                                                        of
                                                        true ->
                                                            role:apply(async,
                                                                       ApplyId,
                                                                       {friend_group,
                                                                        apply_for_accept,
                                                                        [GroupId]});
                                                        _ ->
                                                            big_world:cast(APlatform,
                                                                           AZoneId,
                                                                           role,
                                                                           apply,
                                                                           [async,
                                                                            ApplyId,
                                                                            {friend_group,
                                                                             apply_for_accept,
                                                                             [GroupId]}])
                                                    end,
                                                    ok;
                                                _R ->
                                                    logger:error("群主审批申请出错 ~w",
                                                                 [_R],
                                                                 friend_group,
                                                                 773),
                                                    {false, lang:get("数据出错")}
                                            end;
                                        _ ->
                                            {false, lang:get("无法获得该玩家数据,请稍后重试")}
                                    end;
                                {false, Reason} -> {false, Reason}
                            end
                    end;
                {ok, #friend_group{}} ->
                    {false, lang:get("你不是群主,不能同意")};
                _ -> ok
            end,
    {reply, Reply, State};
handle_call(_Info, _From, State) ->
    logger:debug("未处理消息 ~w", [_Info], friend_group, 790),
    {reply, lang:get("未处理"), State}.

handle_cast({send_to_all, GroupId}, State) ->
    case fetch(GroupId) of
        {ok, #friend_group{members = Members} = FriendGroup} ->
            Fun = fun (#friend_group_role_data{role_id =
                                                   RoleId = {_,
                                                             Platform,
                                                             ZoneId},
                                               pid = Pid})
                          when is_pid(Pid) ->
                          case role_misc:is_local_role(RoleId) of
                              true -> role:pack_send(Pid, 19000, {FriendGroup});
                              _ ->
                                  big_world:cast(Platform,
                                                 ZoneId,
                                                 role,
                                                 pack_send,
                                                 [Pid, 19000, {FriendGroup}])
                          end;
                      (#friend_group_role_data{role_id = _RoleId}) -> ok
                  end,
            lists:foreach(Fun, Members);
        _ -> ok
    end,
    {noreply, State};
handle_cast(_info, State) -> {noreply, State}.

handle_info({login,
             #{role_id := RoleId, pid := Pid, time := Now,
               group_id := GroupId, role_name := RoleName,
               role_sex := RoleSex, role_classes := RoleClasses,
               role_lev := RoleLev}},
            State) ->
    case fetch(GroupId) of
        {ok, #friend_group{members = Members} = FriendGroup} ->
            case lists:keyfind(RoleId,
                               #friend_group_role_data.role_id,
                               Members)
                of
                #friend_group_role_data{} = Fgr ->
                    Fgr1 = Fgr#friend_group_role_data{role_name = RoleName,
                                                      role_classes =
                                                          RoleClasses,
                                                      role_lev = RoleLev,
                                                      role_sex = RoleSex,
                                                      online_time = Now,
                                                      online = 1, pid = Pid},
                    Members1 = lists:keystore(RoleId,
                                              #friend_group_role_data.role_id,
                                              Members,
                                              Fgr1),
                    save(FriendGroup#friend_group{members = Members1}),
                    send_to_all(GroupId);
                _ ->
                    logger:debug("出错了了?? ~w",
                                 [{RoleId, GroupId}],
                                 friend_group,
                                 837)
            end;
        _ -> ok
    end,
    {noreply, State};
handle_info({logout,
             #{role_id := RoleId, time := Now, group_id := GroupId,
               role_name := RoleName, role_lev := RoleLev,
               role_sex := RoleSex, role_classes := RoleClasses}},
            State) ->
    case fetch(GroupId) of
        {ok, #friend_group{members = Members} = FriendGroup} ->
            case lists:keyfind(RoleId,
                               #friend_group_role_data.role_id,
                               Members)
                of
                #friend_group_role_data{} = Fgr ->
                    Fgr1 = Fgr#friend_group_role_data{role_name = RoleName,
                                                      role_classes =
                                                          RoleClasses,
                                                      role_lev = RoleLev,
                                                      role_sex = RoleSex,
                                                      online = 0,
                                                      online_time = Now,
                                                      pid = undefined},
                    Members1 = lists:keystore(RoleId,
                                              #friend_group_role_data.role_id,
                                              Members,
                                              Fgr1),
                    save(FriendGroup#friend_group{members = Members1});
                _ -> ok
            end;
        _ -> ok
    end,
    {noreply, State};
handle_info({chat, GroupId, Cmd, Msg}, State) ->
    case fetch(GroupId) of
        {ok, #friend_group{members = Members} = FriendGroup} ->
            save(FriendGroup#friend_group{time = date:unixtime()}),
            lists:foreach(fun (#friend_group_role_data{pid = Pid})
                                  when is_pid(Pid) ->
                                  role:pack_send(Pid, Cmd, Msg);
                              (#friend_group_role_data{role_id =
                                                           RoleId = {_,
                                                                     Platform,
                                                                     ZoneId}}) ->
                                  case role_misc:is_local_role(RoleId) of
                                      true -> save_chat(RoleId, Cmd, Msg);
                                      _ ->
                                          big_world:cast(Platform,
                                                         ZoneId,
                                                         friend_group,
                                                         save_chat,
                                                         [RoleId, Cmd, Msg])
                                  end
                          end,
                          Members);
        _ -> ok
    end,
    {noreply, State};
handle_info({get_offline, Id, Pid}, State) ->
    case ets:lookup(friend_group_chat, Id) of
        [#friend_group_chat{msgs = L}] ->
            dets:delete(friend_group_chat, Id),
            ets:delete(friend_group_chat, Id),
            lists:foreach(fun ({Cmd, Msg, _Time}) ->
                                  role:pack_send(Pid, Cmd, Msg)
                          end,
                          lists:reverse(L));
        _ -> ok
    end,
    {noreply, State};
handle_info(clean, State) ->
    List = ets:tab2list(friend_group),
    Now = date:unixtime(),
    lists:foreach(fun (#friend_group{time = Time,
                                     members = Members} =
                           Fg) ->
                          case Now - Time > 90 * 86400 of
                              true -> sys_disband(Members, Fg);
                              _ -> ok
                          end
                  end,
                  List),
    case get(clean_tref) of
        Tref when is_reference(Tref) ->
            erlang:cancel_timer(Tref);
        _ -> ok
    end,
    NewTref = erlang:send_after(date:next_diff(3, 0, 0) *
                                    1000,
                                friend_group,
                                clean),
    put(clean_tref, NewTref),
    {noreply, State};
handle_info(fix_create, State) ->
    List = ets:tab2list(friend_group_role),
    lists:foreach(fun (#friend_group_role{groups = Groups,
                                          create = Create, id = RoleId} =
                           Fgr) ->
                          case Create >= 0 of
                              true -> ok;
                              _ ->
                                  logger:info("群组已创建个数小于0",
                                              [],
                                              friend_group,
                                              916),
                                  NewCreate = calc_create_num(Groups,
                                                              RoleId,
                                                              0),
                                  save_local(Fgr#friend_group_role{create =
                                                                       NewCreate}),
                                  push_role(RoleId),
                                  ok
                          end
                  end,
                  List),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...",
                [friend_group],
                friend_group,
                928),
    util:close_dets(friend_group),
    util:close_dets(friend_group_role),
    util:close_dets(friend_group_chat),
    logger:info("[~w] 关闭完成",
                [friend_group],
                friend_group,
                932),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

load_data() ->
    case dets:first(friend_group) of
        '$end_of_table' ->
            logger:info("没有数据需要加载", [], friend_group, 942),
            [];
        _ ->
            dets:traverse(friend_group,
                          fun (Fg = #friend_group{members = Members}) ->
                                  Members1 =
                                      [GroupRole#friend_group_role_data{pid =
                                                                            undefined}
                                       || GroupRole <- Members],
                                  save(Fg#friend_group{members = Members1}),
                                  continue
                          end)
    end,
    StartFlag = case dets:first(friend_group_role) of
                    '$end_of_table' ->
                        logger:info("没有数据需要加载", [], friend_group, 955),
                        [];
                    _ ->
                        dets:traverse(friend_group_role,
                                      fun (Fgr) ->
                                              case friend_group_ver:do_role(Fgr)
                                                  of
                                                  {ok, NewFgr} ->
                                                      save_local(NewFgr),
                                                      continue;
                                                  {false, _Reason} ->
                                                      logger:error("无法转换好友群组版本数据:~w",
                                                                   [Fgr],
                                                                   friend_group,
                                                                   965),
                                                      {done, false}
                                              end
                                      end)
                end,
    dets:to_ets(friend_group_chat, friend_group_chat),
    StartFlag.

calc_create_num([], _RoleId, Num) -> Num;
calc_create_num([GroupId | Groups], RoleId, Num) ->
    case role_misc:is_local_role(GroupId) of
        true ->
            case fetch(GroupId) of
                #friend_group{owner_id = OwnerId}
                    when OwnerId =:= RoleId ->
                    calc_create_num(Groups, RoleId, Num + 1);
                _ -> calc_create_num(Groups, RoleId, Num)
            end;
        _ -> calc_create_num(Groups, RoleId, Num)
    end.

check([], _Args) -> ok;
check([name | T], Args = #{name := Name}) ->
    case util:utf8_len(Name) of
        0 -> {false, lang:get("群组名不能为空哟{face_1,47}")};
        Length when is_integer(Length) andalso Length > 6 ->
            {false, lang:get("群组名最多6个字")};
        _ ->
            case util:check_name(Name) of
                ok -> check(T, Args);
                {false, Reason} -> {false, Reason}
            end
    end;
check([content | T], Args = #{content := Content}) ->
    case util:utf8_len(Content) of
        Length when is_integer(Length) andalso Length > 20 ->
            {false, lang:get("群组名最多6个字")};
        _ -> check(T, Args)
    end;
check([world_lev | T],
      Args = #{world_lev := WorldLev, role_lev := RoleLev}) ->
    case RoleLev >= 60 of
        true ->
            case RoleLev >= WorldLev - 10 of
                true -> check(T, Args);
                _ ->
                    {false,
                     notice:format(lang:get("当前等级小于~ts~ts,不能创建群组"),
                                   [{string_2, 1, WorldLev - 10},
                                    {string_2, 1, lang:get("级")}])}
            end;
        _ ->
            {false,
             notice:format(lang:get("当前等级小于~ts,不能创建群组"),
                           [{string_2, 1, lang:get("60级")}])}
    end;
check([disband | T],
      Args = #{friend_group :=
                   #friend_group{owner_id = Owner},
               role_id := RoleId}) ->
    case Owner of
        RoleId -> check(T, Args);
        _ -> {false, lang:get("你不是群主,不能解散群组")}
    end;
check([invite_num | T],
      Args = #{friend_group :=
                   #friend_group{members = Members}}) ->
    case length(Members) < 15 of
        true -> check(T, Args);
        _ -> {false, lang:get("该群人数已满，无法再邀请其他玩家")}
    end;
check([join_num | T],
      Args = #{friend_group :=
                   #friend_group{members = Members}}) ->
    case length(Members) < 15 of
        true -> check(T, Args);
        _ -> {false, lang:get("该群人数已满，无法加入")}
    end;
check([join | T], Args = #{join := Join}) ->
    case Join < 3 of
        true -> check(T, Args);
        _ ->
            {false,
             notice:format(lang:get("最多可以加入~ts个群"), [{string_1, 3}])}
    end;
check([quit | _T],
      #{friend_group := #friend_group{owner_id = Owner},
        role_id := RoleId})
    when Owner =:= RoleId ->
    {false, lang:get("群主不能退出")};
check([quit | T],
      Args = #{friend_group :=
                   #friend_group{members = Members},
               role_id := RoleId}) ->
    case lists:keyfind(RoleId,
                       #friend_group_role_data.role_id,
                       Members)
        of
        false -> {false, lang:get("你已退出该群聊")};
        _ -> check(T, Args)
    end;
check([kicked | T],
      Args = #{friend_group :=
                   #friend_group{members = Members},
               target_id := TargeId}) ->
    case lists:keyfind(TargeId,
                       #friend_group_role_data.role_id,
                       Members)
        of
        false -> {false, lang:get("该玩家已被踢出群组")};
        _ -> check(T, Args)
    end;
check([inside | T],
      Args = #{role_id := RoleId,
               friend_group := #friend_group{members = Members}}) ->
    case lists:keyfind(RoleId,
                       #friend_group_role_data.role_id,
                       Members)
        of
        false -> {false, lang:get("你不是该群组成员")};
        _ -> check(T, Args)
    end;
check([member | T],
      Args = #{role_id := RoleId,
               friend_group := #friend_group{members = Members},
               targe_id := TargeId}) ->
    case lists:keyfind(RoleId,
                       #friend_group_role_data.role_id,
                       Members)
        of
        false -> {false, lang:get("你不是该群组成员,不能发起邀请")};
        _ ->
            case lists:keyfind(TargeId,
                               #friend_group_role_data.role_id,
                               Members)
                of
                false -> check(T, Args);
                _ -> {false, lang:get("该好友已经是该群组成员,不需要再次邀请")}
            end
    end;
check([invite | T],
      Args = #{friend_group :=
                   #friend_group{invites = Invites},
               role_id := RoleId, targe_id := TargeId}) ->
    case lists:keyfind({RoleId, TargeId}, 1, Invites) of
        false -> check(T, Args);
        {_, _, Time} ->
            Now = date:unixtime(),
            case Now - Time > 30 of
                true -> check(T, Args);
                _ -> {false, lang:get("你已邀请过该玩家,请耐心等待回应")}
            end
    end;
check([invited | T],
      Args = #{friend_group :=
                   #friend_group{invites = Invites},
               role_id := RoleId, invite_id := InviteId}) ->
    case lists:keyfind({InviteId, RoleId}, 1, Invites) of
        false -> {false, lang:get("该邀请已过期")};
        _ -> check(T, Args)
    end;
check([apply | T],
      Args = #{friend_group :=
                   #friend_group{members = Members},
               role_id := RoleId, applys := Applys}) ->
    case lists:keyfind(RoleId, 1, Applys) of
        false ->
            case lists:keyfind(RoleId,
                               #friend_group_role_data.role_id,
                               Members)
                of
                false -> check(T, Args);
                _ -> {false, lang:get("你已经在该群组,不需要再次申请")}
            end;
        _ -> {false, lang:get("你已经申请加入该群组,请耐心等待群主回应")}
    end;
check([reply_apply | T],
      Args = #{friend_group :=
                   #friend_group{members = Members},
               group_id := GroupId, apply_id := ApplyId,
               applys := Applys}) ->
    case lists:keyfind({ApplyId, GroupId}, 1, Applys) of
        false -> {false, lang:get("该申请已过期")};
        _ ->
            case lists:keyfind(ApplyId,
                               #friend_group_role_data.role_id,
                               Members)
                of
                false -> check(T, Args);
                _ -> {false, lang:get("该玩家已在该群组")}
            end
    end;
check([_R | T], Args) ->
    logger:error("好友群组未检查数据 ~w ~w",
                 [_R, Args],
                 friend_group,
                 1093),
    check(T, Args).

delete_invite(GroupId, RoleId) ->
    case fetch(GroupId) of
        {ok, #friend_group{invites = Invites} = FriendGroup} ->
            Invites1 = [{Id, TargetId, Time}
                        || {Id, TargetId, Time} <- Invites,
                           TargetId =/= RoleId],
            save(FriendGroup#friend_group{invites = Invites1}),
            send_to_all(GroupId);
        _ -> ok
    end.

sys_disband([], #friend_group{id = GroupId}) ->
    ets:delete(friend_group, GroupId),
    dets:delete(friend_group, GroupId),
    ok;
sys_disband([#friend_group_role_data{role_id = RoleId,
                                     pid = Pid}
             | Members],
            Fg = #friend_group{id = GroupId, name = GroupName,
                               owner_id = OwnerId}) ->
    case fetch_role(RoleId) of
        FGR = #friend_group_role{groups = Groups, join = Join,
                                 create = Create} ->
            {Create1, Join1} = case OwnerId =:= RoleId of
                                   true -> {max(0, Create - 1), Join};
                                   _ -> {Create, max(Join - 1, 0)}
                               end,
            NewFGR = FGR#friend_group_role{groups =
                                               lists:keydelete(GroupId,
                                                               #friend_group_data.group_id,
                                                               Groups),
                                           create = Create1, join = Join1},
            save(NewFGR),
            case is_pid(Pid) of
                true -> role:pack_send(RoleId, 19001, {NewFGR, 0});
                _ -> skip
            end,
            mail:send(RoleId,
                      lang:get("解散群组"),
                      notice:format(lang:get("由于~ts长时间无人管理，系统将解散该群"),
                                    [{string_1, GroupName}])),
            sys_disband(Members, Fg);
        _ ->
            logger:info("不是同一个服的 ~w", [RoleId], friend_group, 1127),
            sys_disband(Members, Fg)
    end.

update_member([], _GroupId, _Type, _Value) -> ok;
update_member([#friend_group_role_data{role_id = RoleId,
                                       pid = Pid}
               | Members],
              GroupId, Type, Value) ->
    case fetch_role(RoleId) of
        FGR = #friend_group_role{groups = Groups} ->
            case lists:keyfind(GroupId,
                               #friend_group_data.group_id,
                               Groups)
                of
                #friend_group_data{} = FGD ->
                    NewFGD = case Type of
                                 group_name ->
                                     FGD#friend_group_data{group_name = Value};
                                 group_content ->
                                     FGD#friend_group_data{group_content =
                                                               Value};
                                 _ -> FGR
                             end,
                    NewFGR = FGR#friend_group_role{groups =
                                                       lists:keystore(GroupId,
                                                                      #friend_group_data.group_id,
                                                                      Groups,
                                                                      NewFGD)},
                    save(NewFGR),
                    case is_pid(Pid) of
                        true -> role:pack_send(RoleId, 19001, {NewFGR, 0});
                        _ -> skip
                    end;
                _ -> ok
            end;
        _ -> ignore
    end,
    update_member(Members, GroupId, Type, Value).

get_id() ->
    Id1 = case env:get(friend_group_id) of
              Id when is_integer(Id) -> Id;
              _ -> 1
          end,
    env:save(friend_group_id, Id1 + 1),
    {Id1, env:get(platform), env:get(zone_id)}.

fetch(GroupId = {_, Platform, ZoneId}) ->
    case role_misc:is_local_role({Platform, ZoneId}) of
        true -> fetch_local(GroupId);
        _ ->
            big_world:call(Platform,
                           ZoneId,
                           friend_group,
                           fetch_local,
                           [GroupId])
    end.

fetch_local(GroupId) ->
    case ets:lookup(friend_group, GroupId) of
        [#friend_group{} = FriendGroup] -> {ok, FriendGroup};
        _ -> false
    end.

fetch_role(RoleId = {_, Platform, ZoneId}) ->
    case role_misc:is_local_role({Platform, ZoneId}) of
        true -> fetch_role_local(RoleId);
        _ ->
            case big_world:call(Platform,
                                ZoneId,
                                friend_group,
                                fetch_role_local,
                                [RoleId])
                of
                Fgr when is_record(Fgr, friend_group_role) -> Fgr;
                _R -> false
            end
    end.

fetch_role_local(RoleId) ->
    case ets:lookup(friend_group_role, RoleId) of
        [#friend_group_role{} = FriendGroupRole] ->
            FriendGroupRole;
        _ -> #friend_group_role{id = RoleId}
    end.

save(FriendGroup = #friend_group{id =
                                     {_, Platform, ZoneId}}) ->
    case role_misc:is_local_role({Platform, ZoneId}) of
        true -> save_local(FriendGroup);
        _ ->
            case big_world:call(Platform,
                                ZoneId,
                                friend_group,
                                save_local,
                                [FriendGroup])
                of
                ok -> ok;
                _ -> false
            end
    end;
save(FriendGroupRole = #friend_group_role{id =
                                              {_, Platform, ZoneId}}) ->
    case role_misc:is_local_role({Platform, ZoneId}) of
        true -> save_local(FriendGroupRole);
        _ ->
            case big_world:call(Platform,
                                ZoneId,
                                friend_group,
                                save_local,
                                [FriendGroupRole])
                of
                ok -> ok;
                _ -> false
            end
    end.

save_local(FriendGroup)
    when is_record(FriendGroup, friend_group) ->
    ets:insert(friend_group, FriendGroup),
    dets:insert(friend_group, FriendGroup),
    ok;
save_local(FriendGroupRole)
    when is_record(FriendGroupRole, friend_group_role) ->
    ets:insert(friend_group_role, FriendGroupRole),
    dets:insert(friend_group_role, FriendGroupRole),
    ok.

save_chat(RoleId, Cmd, Msg) ->
    NewOff = case ets:lookup(friend_group_chat, RoleId) of
                 [Off = #friend_group_chat{msgs = L}]
                     when length(L) > 100 ->
                     Off;
                 [Off = #friend_group_chat{msgs = L}] ->
                     Off#friend_group_chat{msgs =
                                               [{Cmd, Msg, date:unixtime()}
                                                | L]};
                 _ ->
                     #friend_group_chat{role_id = RoleId,
                                        msgs = [{Cmd, Msg, date:unixtime()}]}
             end,
    dets:insert(friend_group_chat, NewOff),
    ets:insert(friend_group_chat, NewOff),
    ok.

delete(GroupId) ->
    ets:delete(friend_group, GroupId),
    dets:delete_object(friend_group, GroupId).

