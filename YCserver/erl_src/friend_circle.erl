-file("src/mod/friend/friend_circle.erl", 1).

-module(friend_circle).

-behaviour(gen_server).

-export([start_link/0]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([post/2,
         del_moment/2,
         comment/2,
         get_subscriptions/2,
         get_moments/2,
         get_region_moments/2,
         get_notifications/2,
         get_notifications_num/1,
         get_unread_num/1,
         get_photo/3,
         local_get_photo/3,
         get_thumb/3,
         local_get_thumb/3,
         audit_photo/3,
         del_photo/3,
         del_comment/3,
         like/2,
         unlike/2,
         unsubscribe/2,
         subscribe/2,
         delete/1,
         push/3,
         report/4,
         local_report/1,
         update/1,
         handle_report/7,
         fetch/2,
         list_moments/3,
         save_photos/3,
         batch_query_moments/1,
         batch_query_moments/2,
         lookup_circle/1,
         local_fetch/2]).

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

-file("src/mod/friend/friend_circle.erl", 48).

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

-file("src/mod/friend/friend_circle.erl", 49).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/friend/friend_circle.erl", 50).

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

-file("src/mod/friend/friend_circle.erl", 51).

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

-file("src/mod/friend/friend_circle.erl", 52).

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

-file("src/mod/friend/friend_circle.erl", 53).

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

-file("src/mod/friend/friend_circle.erl", 54).

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

-file("src/mod/friend/friend_circle.erl", 55).

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

-file("src/mod/friend/friend_circle.erl", 56).

-record(state,
        {report_ref :: undefined | reference(),
         sync_ref :: undefined | reference(),
         regions_to_sync = [],
         cities_to_sync = []}).

init([]) ->
    logger:info("开始启动...", [], friend_circle, 112),
    friend_util:init_ids(),
    dets:open_file(friend_circle,
                   [{file, "./dets/friend_circle.dets"},
                    {keypos, #friend_circle.id}]),
    ets:new(friend_circle,
            [set,
             named_table,
             public,
             {keypos, #friend_circle.id}]),
    dets:open_file(friend_moment,
                   [{file, "./dets/friend_moment.dets"},
                    {keypos, #friend_moment.id}]),
    ets:new(friend_moment,
            [set,
             named_table,
             public,
             {keypos, #friend_moment.id}]),
    dets:open_file(friend_comment,
                   [{file, "./dets/friend_comment.dets"},
                    {keypos, #friend_comment.moment_id},
                    {type, duplicate_bag}]),
    ets:new(friend_comment,
            [duplicate_bag,
             named_table,
             public,
             {keypos, #friend_comment.moment_id}]),
    dets:open_file(friend_moment_photo,
                   [{file, "./dets/friend_moment_photo.dets"},
                    {keypos, #friend_moment_photo.moment_id},
                    {type, duplicate_bag}]),
    ets:new(friend_moment_photo,
            [duplicate_bag,
             named_table,
             public,
             {keypos, #friend_moment_photo.moment_id}]),
    dets:open_file(friend_moment_like,
                   [{file, "./dets/friend_moment_like.dets"},
                    {keypos, #friend_moment_like.moment_id},
                    {type, duplicate_bag}]),
    ets:new(friend_moment_like,
            [duplicate_bag,
             named_table,
             public,
             {keypos, #friend_moment_like.moment_id}]),
    dets:open_file(friend_circle_region,
                   [{file, "./dets/friend_circle_region.dets"},
                    {keypos, #friend_circle_region.region}]),
    ets:new(friend_circle_region,
            [set,
             named_table,
             public,
             {keypos, #friend_circle_region.region}]),
    dets:open_file(friend_circle_city,
                   [{file, "./dets/friend_circle_city.dets"},
                    {keypos, #friend_circle_region.city}]),
    ets:new(friend_circle_city,
            [set,
             named_table,
             public,
             {keypos, #friend_circle_region.city}]),
    ets:new(friend_circle_report,
            [set,
             named_table,
             public,
             {keypos, #friend_circle_report.id}]),
    load_data(),
    friend_util:init_root_dir(),
    Ref = erlang:send_after(util:rand(4000, 10000),
                            self(),
                            load_report),
    SyncRef = erlang:send_after(600000,
                                self(),
                                sync_region),
    State = #state{report_ref = Ref, sync_ref = SyncRef},
    logger:info("启动完成", [], friend_circle, 138),
    {ok, State}.

post(#role{}, #{photos := Photos})
    when length(Photos) > 4 ->
    {false,
     notice:format(lang:get("最多只能发~ts张图片哦"),
                   [{string_2, 5, 4}])};
post(#role{lev = Lev}, _) when Lev < 25 ->
    {false,
     notice:format(lang:get("~ts级后才能发表状态喔，努力升级吧{face_1,9}"),
                   [{string_2, 5, 25}])};
post(_Role = #role{id = {Id, _, _}}, #{type := Type})
    when Type =:= 3 andalso Id =/= 0 ->
    Msg = lang:get("错误的寄语类型"),
    {false, Msg};
post(Role = #role{id = Id = {_, Platform, ZoneId},
                  sex = Sex, classes = Classes, name = Name},
     #{content := Content, photos := Photos,
       mentions := Mentions, thumbs := Thumbs,
       type := Type}) ->
    ContentForTest = re:replace(Content,
                                "{face_1,\\d}",
                                "a",
                                [global, unicode, {return, list}]),
    case util:check_text(ContentForTest,
                         140,
                         lang:get("内容"))
        of
        {false, Why} ->
            sys_conn:pack_send(10432, {0, 0, 11858}),
            {false, Why};
        _ ->
            Now = date:unixtime(),
            Mid = {friend_util:get_id(friend_moment),
                   Platform,
                   ZoneId},
            Moment = #friend_moment{id = Mid, name = Name,
                                    content = Content, rid = Id, sex = Sex,
                                    classes = Classes, mentions = Mentions,
                                    ctime = Now, type = Type},
            save(Moment),
            save_photos(Photos, Thumbs, Moment),
            NewPhotos = ets:lookup(friend_moment_photo, Mid),
            push(Role, 11865, {0, Moment, NewPhotos}),
            friend_circle ! {post, Moment, NewPhotos},
            case Type of
                2 ->
                    case big_world:is_connect() of
                        {true, _} ->
                            big_world:cast(all,
                                           gen_fsm,
                                           send_all_state_event,
                                           [friend_wish_agent,
                                            {deliver_moment,
                                             Moment,
                                             NewPhotos}]);
                        _ ->
                            gen_fsm:send_all_state_event(friend_wish_agent,
                                                         {deliver_moment,
                                                          Moment,
                                                          NewPhotos})
                    end;
                _ -> ok
            end,
            Loss = case Type of
                       2 -> format:val_to_loss([{90006, 10}]);
                       _ -> []
                   end,
            sys_conn:pack_send(10432, {1, 0, 11858}),
            case role_gain:do_notice(Loss, Role) of
                {ok, LossRole} ->
                    Groups = group_by_platform([Fid
                                                || Fid
                                                       <- friend:list_all_id(Id),
                                                   role_misc:is_local_role(Fid)
                                                       =:= false],
                                               []),
                    logger:debug("跨服好友 ~w", [Groups], friend_circle, 195),
                    [big_world:cast(Cplatform,
                                    CzoneId,
                                    erlang,
                                    send,
                                    [friend_circle,
                                     {deliver_moment,
                                      CFids,
                                      Moment,
                                      NewPhotos}])
                     || {{Cplatform, CzoneId}, CFids} <- Groups],
                    case fetch(friend_circle, Id) of
                        [#friend_circle{is_shared_region = 0}] -> ok;
                        [#friend_circle{region = Region, city = City}]
                            when Region =/= "" ->
                            big_world:cast(erlang,
                                           send,
                                           [friend_circle,
                                            {share_region,
                                             #{region => Region, city => City,
                                               rid => Id, moment_id => Mid}}]);
                        _ ->
                            big_world:cast(erlang,
                                           send,
                                           [friend_circle,
                                            {share_region,
                                             #{region => "unknown",
                                               city => "unknown", rid => Id,
                                               moment_id => Mid}}])
                    end,
                    {LastTime, Num} = var:get_var(LossRole,
                                                  other,
                                                  2031,
                                                  {0, 0}),
                    {NRole, NNum} = case date:day_diff(LastTime, Now) of
                                        0 -> {LossRole, Num};
                                        1 ->
                                            {var:set_var(LossRole,
                                                         other,
                                                         2031,
                                                         {Now, Num + 1}),
                                             Num + 1};
                                        _ ->
                                            {var:set_var(LossRole,
                                                         other,
                                                         2031,
                                                         {Now, 1}),
                                             1}
                                    end,
                    role_trigger:async_fire(Id,
                                            [#evt_friend_circle{photos =
                                                                    length(Photos),
                                                                mentions =
                                                                    length(Mentions),
                                                                day_num =
                                                                    NNum}]),
                    {ok, NRole};
                {false, #loss{msg = Msg}} -> {false, Msg};
                _ -> {false, lang:get("资源不足")}
            end
    end.

-spec comment(#role{}, #{}) -> ok.

comment(#role{lev = Lev}, _) when Lev < 20 ->
    {false,
     notice:format(lang:get("~ts级后才能评论和回复喔，努力升级吧{face_1,9}"),
                   [{string_2, 5, 20}])};
comment(Role = #role{id = Id, sex = Sex,
                     classes = Classes, name = Name},
        #{content := Content,
          moment_id := MomentId = {_, Platform, ZoneId},
          mentions := Mentions}) ->
    case util:check_text(Content, 140, lang:get("内容")) of
        {false, Why} -> {false, Why};
        _ ->
            Now = date:unixtime(),
            Comment = #friend_comment{moment_id = MomentId,
                                      name = Name, msg = Content, rid = Id,
                                      sex = Sex, classes = Classes,
                                      mentions = Mentions, ctime = Now},
            case big_world:call(Platform,
                                ZoneId,
                                gen_server,
                                call,
                                [friend_circle, {comment, Comment}])
                of
                {ok, CommentId} ->
                    push(Role,
                         11866,
                         {0, Comment#friend_comment{id = CommentId}}),
                    role_trigger:async_fire(Id,
                                            [#evt_friend_circle_comment{}]),
                    ok;
                Else -> Else
            end
    end.

get_subscriptions(#role{}, 1) ->
    Key = friend_circle_subscriptions,
    case erlang:get(Key) of
        [H | T] -> list_moments([H | T], Key, 1);
        _ -> []
    end;
get_subscriptions(#role{id = Id}, _) ->
    Key = friend_circle_subscriptions,
    case lookup_circle(Id) of
        {ok, #friend_circle{subscriptions = Subed}} ->
            friend_circle ! {read_new, Id},
            list_moments(Subed, Key, 1);
        _ -> []
    end.

get_moments(_Id, 1) ->
    Key = friend_circle_moments,
    case erlang:get(Key) of
        [H | T] -> list_moments([H | T], Key, 1);
        _ -> []
    end;
get_moments(Id, _) ->
    Key = friend_circle_moments,
    case fetch(friend_circle, Id) of
        [#friend_circle{moments = Own}] ->
            list_moments(Own, Key, 1);
        _ -> []
    end.

get_region_moments(_Id, 1) ->
    Key = friend_circle_region_moments,
    case erlang:get(Key) of
        [H | T] -> list_moments([H | T], Key, 1);
        _ -> []
    end;
get_region_moments(#role{id = Id}, _) ->
    Key = friend_circle_region_moments,
    case fetch(friend_circle, Id) of
        [#friend_circle{city = ""}] ->
            case ets:lookup(friend_circle_region, "unknown") of
                [#friend_circle_region{moments = [H | T]}] ->
                    list_moments([H | T], Key, 1);
                _ -> []
            end;
        [#friend_circle{city = City, region = Region}] ->
            case ets:lookup(friend_circle_city, City) of
                [#friend_circle_region{moments = L1}]
                    when length(L1) >= 8 * 20 ->
                    list_moments(L1, Key, 1);
                _ ->
                    case ets:lookup(friend_circle_region, Region) of
                        [#friend_circle_region{moments = L2}] ->
                            list_moments(L2, Key, 1);
                        _ -> []
                    end
            end;
        _ -> []
    end.

get_notifications(#role{}, 1) ->
    Key = friend_circle_notifications,
    case erlang:get(Key) of
        [H | T] -> list_moments([H | T], Key, 1);
        _ -> []
    end;
get_notifications(#role{id = Id}, _) ->
    Key = friend_circle_notifications,
    case lookup_circle(Id) of
        {ok, #friend_circle{notifications = Notices}} ->
            friend_circle ! {read_notification, Id},
            list_moments(Notices, Key, 1);
        _ -> []
    end.

get_notifications_num(#role{id = Id}) ->
    case lookup_circle(Id) of
        {ok, #friend_circle{notifications = Notices}} ->
            length(Notices);
        _ -> 0
    end.

get_unread_num(#role{id = Id}) ->
    case lookup_circle(Id) of
        {ok, #friend_circle{unread_num = UnreadNum}} ->
            UnreadNum;
        _ -> 0
    end.

get_photo(Rid, MomentId = {_, Platform, ZoneId},
          PhotoId) ->
    case big_world:call(Platform,
                        ZoneId,
                        friend_circle,
                        local_get_photo,
                        [Rid, MomentId, PhotoId])
        of
        [H | T] -> [H | T];
        _ -> []
    end.

local_get_photo(Rid, MomentId, PhotoId) ->
    L = ets:match_object(friend_moment_photo,
                         #friend_moment_photo{moment_id = MomentId,
                                              id = PhotoId, _ = '_'}),
    do_get_photo(Rid, photo, L).

get_thumb(Rid, MomentId = {_, Platform, ZoneId},
          PhotoId) ->
    case big_world:call(Platform,
                        ZoneId,
                        friend_circle,
                        local_get_thumb,
                        [Rid, MomentId, PhotoId])
        of
        [H | T] -> [H | T];
        _ -> []
    end.

local_get_thumb(Rid, MomentId, PhotoId) ->
    L = ets:match_object(friend_moment_photo,
                         #friend_moment_photo{moment_id = MomentId,
                                              id = PhotoId, _ = '_'}),
    do_get_photo(Rid, thumb, L).

audit_photo(MomentId = {Mid, _, _}, Id, Result) ->
    logger:info("审核信息 ~w",
                [{Id, Result}],
                friend_circle,
                365),
    PhotoSpec = #friend_moment_photo{moment_id = MomentId,
                                     id = Id, _ = '_'},
    case ets:match_object(friend_moment_photo, PhotoSpec) of
        [#friend_moment_photo{rid = Rid}] ->
            case Result of
                2 ->
                    MailInfo = #{items => [], title => lang:get("照片审核失败"),
                                 content =>
                                     lang:get("您好，您上传的照片未通过审核，请更换照片重新上传。（头像请不要包含违法违规内容）")},
                    mail:send(Rid, MailInfo),
                    file:delete(get_photo_name(Rid, Mid, Id));
                _ -> ok
            end,
            friend_circle ! {audit_photo, MomentId, Id, Result},
            ok;
        _ -> ok
    end.

del_photo(#role{id = Rid = {_, Platform, ZoneId}}, Mid,
          PhotoId) ->
    MomentId = {Mid, Platform, ZoneId},
    PhotoSpec = #friend_moment_photo{moment_id = MomentId,
                                     id = PhotoId, _ = '_'},
    case ets:match_object(friend_moment_photo, PhotoSpec) of
        [P = #friend_moment_photo{rid = Rid}] -> delete(P);
        [#friend_moment_photo{}] ->
            {false, lang:get("这个图片不是你的哦")};
        _ -> ok
    end.

del_moment(Role = #role{id = Rid}, MomentId) ->
    case fetch(friend_moment, MomentId) of
        [M = #friend_moment{rid = Rid}] ->
            push(Role, 11865, {1, M, []}),
            friend_circle ! {del_moment, M},
            ok;
        _ ->
            push(Role,
                 11865,
                 {1, #friend_moment{id = MomentId, rid = Rid}, []}),
            friend_circle ! {del_moment, Rid, MomentId},
            ok
    end.

del_comment(Role = #role{id = Rid},
            MomentId = {_, Platform, ZoneId}, CommentId) ->
    CommentSpec = #friend_comment{moment_id = MomentId,
                                  id = CommentId, _ = '_'},
    case ets:lookup(friend_moment, MomentId) of
        [#friend_moment{rid = Rid}] ->
            big_world:cast(Platform,
                           ZoneId,
                           friend_circle,
                           delete,
                           [CommentSpec]),
            push(Role,
                 11866,
                 {1,
                  #friend_comment{moment_id = MomentId, id = CommentId}}),
            ok;
        _ ->
            case big_world:call(Platform,
                                ZoneId,
                                ets,
                                match_object,
                                [friend_comment, CommentSpec])
                of
                [Comment = #friend_comment{rid = Rid}] ->
                    big_world:cast(Platform,
                                   ZoneId,
                                   friend_circle,
                                   delete,
                                   [Comment]),
                    push(Role,
                         11866,
                         {1,
                          #friend_comment{moment_id = MomentId,
                                          id = CommentId}}),
                    ok;
                [#friend_comment{}] ->
                    {false, lang:get("你不能删掉这个别人的评论哦")};
                _ -> ok
            end
    end.

like(#role{lev = Lev}, _) when Lev < 20 ->
    {false,
     notice:format(lang:get("~ts级后才能点赞哦，努力升级吧{face_1,9}"),
                   [{string_2, 5, 20}])};
like(Role = #role{id = Id},
     MomentId = {_, Platform, ZoneId}) ->
    LikeSpec = #friend_moment_like{moment_id = MomentId,
                                   rid = Id, _ = '_'},
    case big_world:call(Platform,
                        ZoneId,
                        ets,
                        match_object,
                        [friend_moment_like, LikeSpec])
        of
        [#friend_moment_like{}] -> {false, lang:get("你已经赞过了")};
        _ ->
            Like0 = to(like, Role),
            Like = Like0#friend_moment_like{moment_id = MomentId},
            case big_world:call(Platform,
                                ZoneId,
                                gen_server,
                                call,
                                [friend_circle, {like, Like}])
                of
                ok ->
                    push(Role, 11867, {0, Like}),
                    role_trigger:async_fire(Id,
                                            [#evt_friend_circle_like{}]),
                    ok;
                Else -> Else
            end
    end.

unlike(Role = #role{id = Rid},
       MomentId = {_, Platform, ZoneId}) ->
    big_world:cast(Platform,
                   ZoneId,
                   friend_circle,
                   delete,
                   [#friend_moment_like{rid = Rid, moment_id = MomentId,
                                        _ = '_'}]),
    push(Role,
         11867,
         {1,
          #friend_moment_like{rid = Rid, moment_id = MomentId}}),
    ok.

unsubscribe(#role{id = Id}, Id) ->
    {false, lang:get("不能屏蔽自己哦")};
unsubscribe(#role{id = Id}, TargetId) ->
    friend_circle ! {unsubscribe, Id, TargetId},
    ok.

subscribe(#role{id = Id}, Id) ->
    {false, lang:get("不用订阅自己的内容哦")};
subscribe(#role{id = Id}, TargetId) ->
    friend_circle ! {subscribe, Id, TargetId},
    ok.

report(#role{lev = Lev}, _, _, _) when Lev < 25 ->
    {false,
     notice:format(lang:get("~ts级后才能举报喔，努力升级吧{face_1,9}"),
                   [{string_2, 5, 25}])};
report(Role = #role{id = RoleId, name = RoleName,
                    lev = RoleLev},
       MomentId = {_, Platform, ZoneId}, ReportType, SpecId) ->
    Now = date:unixtime(),
    Report = #friend_circle_report{type = ReportType,
                                   reporter_id = RoleId,
                                   reporter_name = RoleName,
                                   reporter_lev = RoleLev, moment_id = MomentId,
                                   spec_id = SpecId, time = Now},
    Loss = format:val_to_loss([{90006, 10}]),
    Times = var:get_var(Role, day, 61, 0),
    case Times > 10 of
        true -> {reply, {0, lang:get("今日举报次数已满10次，无法再次提交")}};
        _ ->
            NewTimes = Times + 1,
            Role1 = var:set_var(Role, day, 61, NewTimes),
            case role_gain:do_notice(Loss,
                                     Role1,
                                     lang:get("感谢您，提交举报"))
                of
                {ok, NewRole} ->
                    case big_world:call(Platform,
                                        ZoneId,
                                        friend_circle,
                                        local_report,
                                        [Report])
                        of
                        ok ->
                            Msg =
                                lang:get("感谢您的反馈，客服人员将在第一时间核查被举报人的不当行为。核查结果将会邮件通知您!"),
                            {ok, Msg, NewRole};
                        {false, FailReason} -> {false, FailReason};
                        {error, center_not_ready} ->
                            {false, lang:get("还未与跨服时空连接，请稍后尝试")};
                        _ -> {false, lang:get("系统繁忙，请稍后尝试")}
                    end;
                {false, #loss{msg = Msg}} -> {false, Msg}
            end
    end.

local_report(Report) ->
    case make_report(Report) of
        #friend_circle_report{rid = Rid, reporter_id = Rid} ->
            {false, lang:get("不要举报自己了")};
        NewReport = #friend_circle_report{id = Id} ->
            case ets:lookup(friend_circle_report, Id) of
                [#friend_circle_report{}] ->
                    {false, lang:get("已经有人举报过，不用再举报了哦")};
                _ -> gen_server:call(friend_circle, {report, NewReport})
            end;
        Else -> Else
    end.

handle_report(Mid, Plat, Zone, ReportType, SpecId,
              HandleState, Items)
    when is_integer(Mid) andalso
             is_list(Plat) andalso
                 is_integer(Zone) andalso
                     HandleState >= 1 andalso HandleState =< 2 ->
    case check_item(Items) of
        {true, NewItems} ->
            logger:info("后台处理举报HandleState:~w, Items:~w, NewItems:~w",
                        [HandleState, Items, NewItems],
                        friend_circle,
                        523),
            friend_circle !
                {handle_report,
                 {{Mid, Plat, Zone}, ReportType, SpecId},
                 HandleState,
                 NewItems},
            ok;
        false ->
            logger:error("后台举报道具错误:~w",
                         [Items],
                         friend_circle,
                         527),
            false
    end;
handle_report(Mid, Plat, Zone, ReportType, SpecId,
              HandleState, Items) ->
    logger:error("后台举报发放错误参数:~w,~w,~w",
                 [{Mid, Plat, Zone, ReportType, SpecId},
                  HandleState,
                  Items],
                 friend_circle,
                 532),
    false.

update(Args = #{}) ->
    friend_circle ! {update, Args},
    ok.

push(#role{link = #link{conn_pid = ConnPid}}, Cmd,
     Data) ->
    sys_conn:pack_send(ConnPid, Cmd, Data);
push(Id = {_, Platform, ZoneId}, Cmd, Data) ->
    big_world:cast(Platform,
                   ZoneId,
                   role,
                   pack_send,
                   [Id, Cmd, Data]).

start_link() ->
    gen_server:start_link({local, friend_circle},
                          friend_circle,
                          [],
                          []).

handle_call({comment,
             Comment = #friend_comment{moment_id = MomentId,
                                       rid = CRid, mentions = Mentions}},
            _From, State) ->
    Reply = case ets:lookup(friend_moment, MomentId) of
                [#friend_moment{rid = Rid}] ->
                    CanComment = case fetch(friend_circle, Rid) of
                                     [#friend_circle{privacy_moments = 1}] ->
                                         case friend:is_friend(Rid, CRid) orelse
                                                  friend:is_cross_friend(Rid,
                                                                         CRid)
                                                      orelse CRid =:= Rid
                                             of
                                             true -> true;
                                             _ -> false
                                         end;
                                     _ -> true
                                 end,
                    case CanComment of
                        true ->
                            Cid = friend_util:get_id(friend_comment),
                            NewComment = Comment#friend_comment{id = Cid},
                            save(NewComment),
                            case CRid of
                                Rid -> ok;
                                _ -> push(Rid, 11866, {0, NewComment})
                            end,
                            [push(AtId, 11866, {0, NewComment})
                             || AtId <- Mentions,
                                lists:member(AtId, [CRid, Rid]) =:= false],
                            moment_notify([Rid | Mentions] -- [CRid], MomentId),
                            Liked = var:get_role_var(Rid, forever, 2029, 0),
                            var:acc_role_var(Rid, forever, 2029, 0),
                            LikedOther = var:get_role_var(Rid,
                                                          forever,
                                                          2030,
                                                          0),
                            NewLikedOther = case CRid of
                                                Rid -> LikedOther;
                                                _ ->
                                                    var:acc_role_var(Rid,
                                                                     forever,
                                                                     2030,
                                                                     0),
                                                    LikedOther + 1
                                            end,
                            role_trigger:async_fire(Rid,
                                                    [#evt_friend_circle_commented{num
                                                                                      =
                                                                                      Liked
                                                                                          +
                                                                                          1,
                                                                                  other
                                                                                      =
                                                                                      NewLikedOther}]),
                            {ok, Cid};
                        _ ->
                            Msg =
                                notice:format(lang:get("对方已禁止陌生人评论，~ts吧{face_1,3}"),
                                              [{string_2,
                                                5,
                                                lang:get("快加TA好友")}]),
                            {false, Msg}
                    end;
                _ -> {false, lang:get("动态已不存在")}
            end,
    {reply, Reply, State};
handle_call({like,
             Like = #friend_moment_like{moment_id = MomentId,
                                        rid = LRid}},
            _From, State) ->
    Reply = case ets:lookup(friend_moment, MomentId) of
                [#friend_moment{rid = Rid}] ->
                    delete(Like),
                    save(Like),
                    case LRid of
                        Rid -> ok;
                        _ ->
                            moment_notify([Rid], MomentId),
                            push(Rid, 11867, {0, Like})
                    end,
                    Liked = var:get_role_var(Rid, forever, 2028, 0),
                    var:acc_role_var(Rid, forever, 2028, 0),
                    LikedOther = var:get_role_var(Rid, forever, 2030, 0),
                    NewLikedOther = case LRid of
                                        Rid -> LikedOther;
                                        _ ->
                                            var:acc_role_var(Rid,
                                                             forever,
                                                             2030,
                                                             0),
                                            LikedOther + 1
                                    end,
                    role_trigger:async_fire(Rid,
                                            [#evt_friend_circle_liked{num =
                                                                          Liked
                                                                              +
                                                                              1,
                                                                      other =
                                                                          NewLikedOther}]),
                    ok;
                _ -> {false, lang:get("动态已不存在")}
            end,
    {reply, Reply, State};
handle_call({report, Report = #friend_circle_report{}},
            _From, State) ->
    Reply = case make_report(Report) of
                NewReport = #friend_circle_report{id = Id} ->
                    case ets:lookup(friend_circle_report, Id) of
                        [#friend_circle_report{}] ->
                            {false, lang:get("已经有人举报过，不用再举报了哦")};
                        _ ->
                            save_report(NewReport),
                            save(NewReport),
                            ok
                    end;
                Else -> Else
            end,
    {reply, Reply, State};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({post,
             Moment = #friend_moment{id = Mid, rid = Id},
             Photos},
            State) ->
    case lookup_circle(Id) of
        {ok,
         Circle = #friend_circle{moments = Mine,
                                 subscriptions = Subed}} ->
            Mine1 = case length(Mine) >= 1000 of
                        true ->
                            {NewL, DelL} = lists:split(1000, [Mid | Mine]),
                            logger:debug("要删除的 ~w", [DelL], friend_circle, 654),
                            lists:foreach(fun (I) ->
                                                  delete(#friend_moment{id = I})
                                          end,
                                          DelL),
                            NewL;
                        _ -> [Mid | Mine]
                    end,
            Subed1 = lists:sublist([{Mid, Id} | Subed], 500),
            save(Circle#friend_circle{moments = Mine1,
                                      subscriptions = Subed1}),
            deliver_moment([Fid
                            || Fid <- friend:list_id(Id),
                               role_misc:is_local_role(Fid)],
                           Moment,
                           Photos);
        _R ->
            save(#friend_circle{id = Id, moments = [Mid],
                                subscriptions = [{Mid, Id}]}),
            deliver_moment([Fid
                            || Fid <- friend:list_id(Id),
                               role_misc:is_local_role(Fid)],
                           Moment,
                           Photos)
    end,
    {noreply, State};
handle_info({del_moment,
             Moment = #friend_moment{rid = Rid, id = MomentId}},
            State) ->
    delete(Moment),
    unsubscribe_moment(Rid, MomentId),
    {noreply, State};
handle_info({del_moment, Rid, MomentId}, State) ->
    unsubscribe_moment(Rid, MomentId),
    {noreply, State};
handle_info({audit_photo, MomentId, Id, Result},
            State) ->
    Now = date:unixtime(),
    PhotoSpec = #friend_moment_photo{moment_id = MomentId,
                                     id = Id, _ = '_'},
    case ets:match_object(friend_moment_photo, PhotoSpec) of
        [P = #friend_zone_photo{}] ->
            P1 = P#friend_zone_photo{auditing = Result,
                                     audited = Now},
            save(P1);
        _ -> ok
    end,
    {noreply, State};
handle_info({deliver_moment, Ids, Moment, Photos},
            State) ->
    deliver_moment(Ids, Moment, Photos),
    {noreply, State};
handle_info({unsubscribe, Id, TargetId}, State) ->
    case lookup_circle(Id) of
        {ok,
         Circle = #friend_circle{subscriptions = Subed,
                                 unsubscribed = Unsubscribed}} ->
            Subed1 = [M || M = {_, Rid} <- Subed, Rid =/= TargetId],
            Unsubscribed1 = [TargetId | Unsubscribed],
            save(Circle#friend_circle{subscriptions = Subed1,
                                      unsubscribed = Unsubscribed1});
        _ ->
            save(#friend_circle{id = Id, unsubscribed = [TargetId]})
    end,
    {noreply, State};
handle_info({subscribe, Id, TargetId}, State) ->
    case lookup_circle(Id) of
        {ok,
         Circle = #friend_circle{unsubscribed = Unsubscribed}} ->
            Unsubscribed1 = [Unsubscribed] -- [TargetId],
            save(Circle#friend_circle{unsubscribed =
                                          Unsubscribed1});
        _ -> save(#friend_circle{id = Id, unsubscribed = []})
    end,
    {noreply, State};
handle_info(load_report, State) ->
    Sql = "select id, platform, zone_id, time, "
          "lev, name, role_id, role_platform, role_zone_"
          "id, report_type, spec_id, content, reporter_i"
          "d, reporter_platform, reporter_zone_id, "
          "reporter_name, reporter_lev from friend_circl"
          "e_report where state = ?",
    case db:get_all(Sql, [0]) of
        {ok, L} -> do_load_report(L);
        {error, _Err} ->
            logger:error("加载举报数时发生错误:~w",
                         [_Err],
                         friend_circle,
                         726)
    end,
    {noreply, State};
handle_info({share_region,
             #{region := Region, city := City, rid := Rid,
               moment_id := MomentId}},
            State = #state{regions_to_sync = Regions,
                           cities_to_sync = Cities}) ->
    case ets:lookup(friend_circle_city, City) of
        [CityCircle = #friend_circle_region{moments =
                                                CityMoments}] ->
            NewCityMoments = lists:sublist([{MomentId, Rid}
                                            | lists:keydelete(Rid,
                                                              2,
                                                              CityMoments)],
                                           500),
            save(CityCircle#friend_circle_region{moments =
                                                     NewCityMoments});
        _ ->
            save(#friend_circle_region{city = City,
                                       moments = [{MomentId, Rid}]})
    end,
    case ets:lookup(friend_circle_region, Region) of
        [RegionCircle = #friend_circle_region{moments =
                                                  RegionMoments}] ->
            NewRegionMoments = lists:sublist([{MomentId, Rid}
                                              | lists:keydelete(Rid,
                                                                2,
                                                                RegionMoments)],
                                             500),
            save(RegionCircle#friend_circle_region{moments =
                                                       NewRegionMoments});
        _ ->
            save(#friend_circle_region{region = Region,
                                       moments = [{MomentId, Rid}]})
    end,
    {noreply,
     State#state{regions_to_sync =
                     [Region | Regions -- [Region]],
                 cities_to_sync = [City | Cities -- [City]]}};
handle_info(sync_region,
            State = #state{regions_to_sync = Regions,
                           cities_to_sync = Cities, sync_ref = OldRef}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    case big_world:is_big_world_center() of
        true ->
            RegionMoments = get_regions(region, Regions),
            CityMoments = get_regions(city, Cities),
            big_world:cast(all,
                           erlang,
                           send,
                           [friend_circle,
                            {update_region, RegionMoments, CityMoments}]),
            SyncRef = erlang:send_after(600000,
                                        self(),
                                        sync_region),
            {noreply,
             State#state{regions_to_sync = [], cities_to_sync = [],
                         sync_ref = SyncRef}};
        _ ->
            {noreply,
             State#state{regions_to_sync = [], cities_to_sync = []}}
    end;
handle_info({update_region, RegionMoments, CityMoments},
            State) ->
    ets:insert(friend_circle_region, RegionMoments),
    dets:insert(friend_circle_region, RegionMoments),
    ets:insert(friend_circle_city, CityMoments),
    dets:insert(friend_circle_city, CityMoments),
    {noreply, State};
handle_info({update,
             #{id := Id, region := Region, city := City,
               is_shared_region := IsSharedRegion}},
            State) ->
    case fetch(friend_circle, Id) of
        [Circle = #friend_circle{region = OldRegion,
                                 city = OldCity, moments = [MomentId | _]}] ->
            big_world:cast(erlang,
                           send,
                           [friend_circle,
                            {change_region,
                             #{id => Id, moment_id => MomentId,
                               region => Region, city => City,
                               old_region => OldRegion, old_city => OldCity}}]),
            save(Circle#friend_circle{region = Region, city = City,
                                      is_shared_region = IsSharedRegion});
        [Circle = #friend_circle{}] ->
            save(Circle#friend_circle{region = Region, city = City,
                                      is_shared_region = IsSharedRegion});
        _ ->
            save(#friend_circle{id = Id, region = Region,
                                city = City, is_shared_region = IsSharedRegion})
    end,
    {noreply, State};
handle_info({update,
             #{id := Id, privacy_moments := PrivacyMoments}},
            State) ->
    case fetch(friend_circle, Id) of
        [Circle = #friend_circle{}] ->
            save(Circle#friend_circle{privacy_moments =
                                          PrivacyMoments});
        _ ->
            save(#friend_circle{id = Id,
                                privacy_moments = PrivacyMoments})
    end,
    {noreply, State};
handle_info({change_region,
             #{id := Rid, moment_id := _MomentId,
               old_region := OldRegion, old_city := OldCity}},
            State) ->
    case ets:lookup(friend_circle_city, OldCity) of
        [CityCircle = #friend_circle_region{moments =
                                                CityMoments}] ->
            NewCityMoments = lists:keydelete(Rid, 2, CityMoments),
            save(CityCircle#friend_circle_region{moments =
                                                     NewCityMoments});
        _ -> ok
    end,
    case ets:lookup(friend_circle_region, OldRegion) of
        [RegionCircle = #friend_circle_region{moments =
                                                  RegionMoments}] ->
            NewRegionMoments = lists:keydelete(Rid,
                                               2,
                                               RegionMoments),
            save(RegionCircle#friend_circle_region{moments =
                                                       NewRegionMoments});
        _ -> ok
    end,
    {noreply, State};
handle_info({read_notification, Id}, State) ->
    case lookup_circle(Id) of
        {ok, Circle = #friend_circle{}} ->
            save(Circle#friend_circle{notifications = []});
        _ -> ok
    end,
    {noreply, State};
handle_info({read_new, Id}, State) ->
    case lookup_circle(Id) of
        {ok, Circle = #friend_circle{}} ->
            save(Circle#friend_circle{unread_num = 0});
        _ -> ok
    end,
    {noreply, State};
handle_info({handle_report, Id, HandleState, Items},
            State) ->
    case ets:lookup(friend_circle_report, Id) of
        [Report = #friend_circle_report{}] ->
            case do_handle_report(Report, HandleState) of
                ok ->
                    mark_report(Id, HandleState, Items),
                    delete(Report),
                    reward_report(Report, HandleState, Items),
                    ok;
                {false, Reason} ->
                    logger:error("处理举报操作时出错:~w",
                                 [Reason],
                                 friend_circle,
                                 844),
                    ok
            end,
            {noreply, State};
        _ ->
            mark_report(Id, HandleState, []),
            {noreply, State}
    end;
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

load_data() ->
    case dets:first(friend_circle) of
        '$end_of_table' ->
            logger:info("没有数据需要加载", [], friend_circle, 872),
            [];
        _ ->
            dets:traverse(friend_circle,
                          fun (C) ->
                                  case friend_circle_ver:do(C) of
                                      {false, Reason} ->
                                          logger:error("空间数据转换失败:~w",
                                                       [Reason],
                                                       friend_circle,
                                                       879),
                                          {done, false};
                                      {ok, C} -> continue;
                                      {ok, NewC} ->
                                          dets:insert(friend_circle, NewC),
                                          continue
                                  end
                          end)
    end,
    case dets:first(friend_moment) of
        '$end_of_table' ->
            logger:info("没有数据需要加载", [], friend_circle, 891),
            [];
        _ ->
            dets:traverse(friend_moment,
                          fun (M) ->
                                  case friend_circle_ver:do_moment(M) of
                                      {error, MReason} ->
                                          logger:error("空间动态数据转换失败:~w",
                                                       [MReason],
                                                       friend_circle,
                                                       898),
                                          {done, false};
                                      {ok, NewM} ->
                                          save(NewM),
                                          continue
                                  end
                          end)
    end,
    dets:to_ets(friend_moment, friend_moment),
    dets:to_ets(friend_comment, friend_comment),
    dets:to_ets(friend_moment_photo, friend_moment_photo),
    dets:to_ets(friend_moment_like, friend_moment_like),
    dets:to_ets(friend_circle_region, friend_circle_region),
    dets:to_ets(friend_circle_city, friend_circle_city).

save(Data = #friend_moment{}) ->
    save(friend_moment, Data);
save(Data = #friend_circle{}) ->
    save(friend_circle, Data);
save(Data = #friend_comment{}) ->
    save(friend_comment, Data);
save(Data = #friend_moment_photo{}) ->
    save(friend_moment_photo, Data);
save(Data = #friend_circle_report{}) ->
    save(friend_circle_report, Data);
save(Data = #friend_moment_like{}) ->
    save(friend_moment_like, Data);
save(Data = #friend_circle_region{city = ""}) ->
    save(friend_circle_region, Data);
save(Data = #friend_circle_region{}) ->
    save(friend_circle_city, Data).

save(Tab, Data) ->
    ets:insert(Tab, Data),
    catch dets:insert(Tab, Data).

save_photos([H | T], ThumbBytes,
            M = #friend_moment{rid = Rid}) ->
    friend_util:mkdir(Rid),
    save_photos([H | T], ThumbBytes, M, 1);
save_photos(_, _, _) -> ok.

save_photos([], _, _, _) -> ok;
save_photos([{Bytes} | T], Thumbs,
            M = #friend_moment{id = Mid = {Id, _, _}, rid = Rid,
                               ctime = Time},
            Num) ->
    P = #friend_moment_photo{id = Num, rid = Rid,
                             moment_id = Mid, uploaded = Time},
    Fname = get_photo_name(Rid, Id, Num),
    case file:write_file(Fname, Bytes) of
        ok -> save(P);
        _Re ->
            logger:error("保存图片[~w, ~w]失败: ~w",
                         [Fname, Bytes, _Re],
                         friend_circle,
                         948)
    end,
    ThumbRest = case Thumbs of
                    [{ThumbBytes} | ThumbsT] ->
                        case file:write_file(get_thumb_name(Rid, Id, Num),
                                             ThumbBytes)
                            of
                            ok -> ok;
                            _Re1 ->
                                logger:error("保存缩略图失败 ~w",
                                             [_Re1],
                                             friend_circle,
                                             954)
                        end,
                        ThumbsT;
                    _ -> Thumbs
                end,
    save_photos(T, ThumbRest, M, Num + 1).

get_photo_name(Rid, Id, N) ->
    friend_util:personal_dir(Rid) ++
        "/moment_" ++
            integer_to_list(Id) ++
                "_" ++ integer_to_list(N) ++ ".png".

get_thumb_name(Rid, Id, N) ->
    friend_util:personal_dir(Rid) ++
        "/thumb_" ++
            integer_to_list(Id) ++
                "_" ++ integer_to_list(N) ++ ".png".

delete(#friend_circle_report{id = Id}) ->
    ets:delete(friend_circle_report, Id);
delete(#friend_moment_photo{id = Id,
                            moment_id = MomentId = {Mid, _, _}, rid = Rid}) ->
    case file:delete(get_photo_name(Rid, Mid, Id)) of
        ok -> ok;
        _Else ->
            logger:error("删除照片失败 ~w", [_Else], friend_circle, 977)
    end,
    case file:delete(get_thumb_name(Rid, Mid, Id)) of
        ok -> ok;
        _Else2 ->
            logger:error("删除缩略图失败 ~w", [_Else2], friend_circle, 982)
    end,
    ets:match_delete(friend_moment_photo,
                     #friend_moment_photo{id = Id, moment_id = MomentId,
                                          _ = '_'}),
    dets:match_delete(friend_moment_photo,
                      #friend_moment_photo{id = Id, moment_id = MomentId,
                                           _ = '_'});
delete(#friend_comment{id = Id,
                       moment_id = MomentId}) ->
    ets:match_delete(friend_comment,
                     #friend_comment{id = Id, moment_id = MomentId,
                                     _ = '_'}),
    dets:match_delete(friend_comment,
                      #friend_comment{id = Id, moment_id = MomentId,
                                      _ = '_'});
delete(#friend_moment_like{rid = Id,
                           moment_id = MomentId}) ->
    ets:match_delete(friend_moment_like,
                     #friend_moment_like{rid = Id, moment_id = MomentId,
                                         _ = '_'}),
    dets:match_delete(friend_moment_like,
                      #friend_moment_like{rid = Id, moment_id = MomentId,
                                          _ = '_'});
delete(#friend_moment{id = Id}) ->
    delete(friend_moment_like, Id),
    delete(friend_comment, Id),
    [delete(friend_moment_photo, P)
     || P <- ets:lookup(friend_moment_photo, Id)],
    delete(friend_moment, Id).

delete(Tab, Id) ->
    ets:delete(Tab, Id),
    dets:delete(Tab, Id).

deliver_moment([], _Moment, _Photos) -> ok;
deliver_moment([Id | T],
               Moment = #friend_moment{id = Mid, mentions = Mentions,
                                       rid = Rid},
               Photos) ->
    case lookup_circle(Id) of
        {ok,
         Circle = #friend_circle{subscriptions = Subed,
                                 unsubscribed = Unsubscribed,
                                 unread_num = UnreadNum}} ->
            case lists:member(Rid, Unsubscribed) of
                true -> ok;
                _ ->
                    Subed1 = lists:sublist([{Mid, Rid} | Subed], 500),
                    NewCircle = Circle#friend_circle{subscriptions = Subed1,
                                                     unread_num =
                                                         UnreadNum + 1},
                    push(Id, 11877, {UnreadNum + 1}),
                    case lists:member(Id, Mentions) of
                        true ->
                            do_moment_notify(NewCircle, Mid),
                            push(Id, 11865, {0, Moment, Photos});
                        _ -> save(NewCircle)
                    end
            end;
        _R ->
            NewCircle = #friend_circle{id = Id,
                                       subscriptions = [Mid], unread_num = 1},
            push(Id, 11877, {1}),
            case lists:member(Id, Mentions) of
                true ->
                    do_moment_notify(NewCircle, Mid),
                    push(Id, 11865, {0, Moment, Photos});
                _ -> save(NewCircle)
            end
    end,
    deliver_moment(T, Moment, Photos).

list_moments(Rest, Key, Num) when Num > 8 ->
    erlang:put(Key, Rest),
    [];
list_moments([], Key, _) ->
    erlang:put(Key, []),
    [];
list_moments([{Id, _Rid} | T], Key, Num) ->
    list_moments([Id | T], Key, Num);
list_moments([Id | T], Key, Num) ->
    case fetch(friend_moment, Id) of
        [Moment = #friend_moment{}] ->
            Coments = fetch(friend_comment, Id),
            Photos = fetch(friend_moment_photo, Id),
            Likes = fetch(friend_moment_like, Id),
            [{Moment#friend_moment{likes = Likes}, Coments, Photos}
             | list_moments(T, Key, Num + 1)];
        _ -> list_moments(T, Key, Num)
    end.

batch_query_moments(Ids) ->
    Fun = fun (MomentId = {_, Plat, Zone}, ResultL) ->
                  PlatZone = c_mirror:get_zone_mapping(Plat, Zone),
                  case lists:keyfind(PlatZone, 1, ResultL) of
                      {_, IdList} ->
                          lists:keystore(PlatZone,
                                         1,
                                         ResultL,
                                         {PlatZone, [MomentId | IdList]});
                      _ ->
                          lists:keystore(PlatZone,
                                         1,
                                         ResultL,
                                         {PlatZone, [MomentId]})
                  end;
              (_, ResultL) -> ResultL
          end,
    PlatZoneIds = lists:foldl(Fun, [], Ids),
    QueryFun = fun ({{Plat, Zone}, PZIds}, Rtn) ->
                       case catch big_world:call(Plat,
                                                 Zone,
                                                 friend_circle,
                                                 batch_query_moments,
                                                 [PZIds, []])
                           of
                           Moments when is_list(Moments) -> Moments ++ Rtn;
                           _ -> Rtn
                       end
               end,
    lists:foldl(QueryFun, [], PlatZoneIds).

batch_query_moments([], Moments) -> Moments;
batch_query_moments([Id | Rest], Moments) ->
    case fetch(friend_moment, Id) of
        [Moment = #friend_moment{}] ->
            Coments = fetch(friend_comment, Id),
            Photos = fetch(friend_moment_photo, Id),
            Likes = fetch(friend_moment_like, Id),
            NewMoments = [{Moment#friend_moment{likes = Likes},
                           Coments,
                           Photos}
                          | Moments],
            batch_query_moments(Rest, NewMoments);
        _ -> batch_query_moments(Rest, Moments)
    end.

fetch(Tab, Id = {_, Platform, ZoneId}) ->
    case catch big_world:call(Platform,
                              ZoneId,
                              friend_circle,
                              local_fetch,
                              [Tab, Id])
        of
        L when is_list(L) -> L;
        _ -> []
    end.

local_fetch(friend_circle, Id) ->
    case lookup_circle(Id) of
        {ok, _C} -> [_C];
        _ -> []
    end;
local_fetch(Tab, Id) -> catch ets:lookup(Tab, Id).

do_get_photo(_, _, []) -> [];
do_get_photo(Id, Type = photo,
             [#friend_moment_photo{rid = Id,
                                   moment_id = MomentId = {Mid, _, _}, id = N,
                                   auditing = Auditing = 0, uploaded = Uploaded}
              | T]) ->
    case file:read_file(get_photo_name(Id, Mid, N)) of
        {ok, Bin} ->
            [{N, MomentId, Bin, Auditing, Uploaded}
             | do_get_photo(Id, Type, T)];
        _Else -> do_get_photo(Id, Type, T)
    end;
do_get_photo(MyId, Type = photo,
             [#friend_moment_photo{rid = Id,
                                   moment_id = MomentId = {Mid, _, _}, id = N,
                                   auditing = Auditing = 1, uploaded = Uploaded}
              | T]) ->
    case file:read_file(get_photo_name(Id, Mid, N)) of
        {ok, Bin} ->
            [{N, MomentId, Bin, Auditing, Uploaded}
             | do_get_photo(MyId, Type, T)];
        _Else -> do_get_photo(MyId, Type, T)
    end;
do_get_photo(Id, Type = thumb,
             [#friend_moment_photo{rid = Id,
                                   moment_id = MomentId = {Mid, _, _}, id = N,
                                   auditing = Auditing = 0, uploaded = Uploaded}
              | T]) ->
    case file:read_file(get_thumb_name(Id, Mid, N)) of
        {ok, Bin} ->
            [{N, MomentId, Bin, Auditing, Uploaded}
             | do_get_photo(Id, Type, T)];
        _Else -> do_get_photo(Id, Type, T)
    end;
do_get_photo(MyId, Type = thumb,
             [#friend_moment_photo{rid = Id,
                                   moment_id = MomentId = {Mid, _, _}, id = N,
                                   auditing = Auditing = 1, uploaded = Uploaded}
              | T]) ->
    case file:read_file(get_thumb_name(Id, Mid, N)) of
        {ok, Bin} ->
            [{N, MomentId, Bin, Auditing, Uploaded}
             | do_get_photo(MyId, Type, T)];
        _Else -> do_get_photo(MyId, Type, T)
    end;
do_get_photo(MyId, Type, [_ | T]) ->
    do_get_photo(MyId, Type, T).

unsubscribe_moment(Rid, MomentId) ->
    case lookup_circle(Rid) of
        {ok,
         Circle = #friend_circle{subscriptions = Subed,
                                 moments = Moments}} ->
            save(Circle#friend_circle{subscriptions =
                                          Subed -- [{MomentId, Rid}],
                                      moments =
                                          lists:delete(MomentId, Moments)});
        _ -> ok
    end.

to(like,
   #role{id = Id, name = Name, sex = Sex,
         classes = Classes}) ->
    #friend_moment_like{rid = Id, name = Name, sex = Sex,
                        classes = Classes, ctime = date:unixtime()}.

group_by_platform([], Groups) -> Groups;
group_by_platform([Id = {_, P, Z} | T], Groups) ->
    K = c_big_world:get_zone_mapping(P, Z),
    Groups1 = case lists:keyfind(K, 1, Groups) of
                  {K, L} -> lists:keyreplace(K, 1, Groups, {K, [Id | L]});
                  _ -> [{K, [Id]} | Groups]
              end,
    group_by_platform(T, Groups1).

do_load_report([]) -> ok;
do_load_report([[Mid,
                 Mp,
                 Mz,
                 Time,
                 Lev,
                 Name,
                 Rid,
                 Rp,
                 Rz,
                 ReportType,
                 SpecId,
                 Content,
                 ReporterId,
                 ReporerPlatform,
                 ReporterZoneId,
                 ReporterName,
                 ReporterLev]
                | T]) ->
    MomentId = {Mid, Mp, Mz},
    Report = #friend_circle_report{id =
                                       {MomentId, ReportType, SpecId},
                                   rid = {Rid, Rp, Rz}, moment_id = MomentId,
                                   spec_id = SpecId, type = ReportType,
                                   name = Name, lev = Lev, time = Time,
                                   content = Content,
                                   reporter_id =
                                       {ReporterId,
                                        ReporerPlatform,
                                        ReporterZoneId},
                                   reporter_name = ReporterName,
                                   reporter_lev = ReporterLev},
    save(Report),
    do_load_report(T).

make_report(Report = #friend_circle_report{moment_id =
                                               MomentId,
                                           type = Type = 0}) ->
    case fetch(friend_moment, MomentId) of
        [#friend_moment{content = Content, rid = Rid,
                        name = Name}] ->
            Report#friend_circle_report{content = Content,
                                        name = Name, rid = Rid,
                                        id = {MomentId, Type, 0}};
        [] -> {false, lang:get("动态已不存在")};
        _ -> {false, lang:get("系统繁忙")}
    end;
make_report(Report = #friend_circle_report{moment_id =
                                               MomentId,
                                           spec_id = SpecId,
                                           type = Type = 2}) ->
    case fetch(friend_moment, MomentId) of
        [#friend_moment{content = Content, rid = Rid,
                        name = Name}] ->
            case ets:match_object(friend_moment_photo,
                                  #friend_moment_photo{moment_id = MomentId,
                                                       id = SpecId, _ = '_'})
                of
                [#friend_moment_photo{}] ->
                    Report#friend_circle_report{content = Content,
                                                rid = Rid, name = Name,
                                                id = {MomentId, Type, SpecId}};
                [] -> {false, lang:get("图片不存在")};
                _ -> {false, lang:get("系统繁忙")}
            end;
        [] -> {false, lang:get("动态已不存在")};
        _ -> {false, lang:get("系统繁忙")}
    end;
make_report(Report = #friend_circle_report{moment_id =
                                               MomentId,
                                           spec_id = SpecId,
                                           type = Type = 1}) ->
    case ets:match_object(friend_comment,
                          #friend_comment{moment_id = MomentId, id = SpecId,
                                          _ = '_'})
        of
        [#friend_comment{msg = Content, rid = Rid,
                         name = Name}] ->
            Report#friend_circle_report{content = Content,
                                        rid = Rid, name = Name,
                                        id = {MomentId, Type, SpecId}};
        [] -> {false, lang:get("评论不存在")};
        _ -> {false, lang:get("系统繁忙")}
    end.

save_report(#friend_circle_report{rid = {Rid, Rp, Rz},
                                  moment_id = {Mid, Mp, Mz}, spec_id = SpecId,
                                  type = ReportType, name = Name, lev = Lev,
                                  time = Time, content = Content,
                                  reporter_id =
                                      {ReporterId,
                                       ReporerPlatform,
                                       ReporterZoneId},
                                  reporter_name = ReporterName,
                                  reporter_lev = ReporterLev}) ->
    Sql = "replace into friend_circle_report(id, "
          "platform, zone_id, time, lev, name, "
          "role_id, role_platform, role_zone_id, "
          "report_type, spec_id, content, reporter_id, "
          "reporter_platform, reporter_zone_id, "
          "reporter_name, reporter_lev) values(?, "
          "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
          "?, ?, ?, ?)",
    db:exec(Sql,
            [Mid,
             Mp,
             Mz,
             Time,
             Lev,
             Name,
             Rid,
             Rp,
             Rz,
             ReportType,
             SpecId,
             Content,
             ReporterId,
             ReporerPlatform,
             ReporterZoneId,
             ReporterName,
             ReporterLev]),
    ok.

get_regions(_, []) -> [];
get_regions(Type = region, [Id | T]) ->
    case ets:lookup(friend_circle_region, Id) of
        [O = #friend_circle_region{}] ->
            [O | get_regions(Type, T)];
        _ -> get_regions(Type, T)
    end;
get_regions(Type = city, [Id | T]) ->
    case ets:lookup(friend_circle_city, Id) of
        [O = #friend_circle_region{}] ->
            [O | get_regions(Type, T)];
        _ -> get_regions(Type, T)
    end.

check_item(Items) -> check_item(Items, []).

check_item([], Items) -> {true, Items};
check_item([{ItemId, Bind, Num} | T], Items)
    when Num > 0 ->
    case item_data:get(ItemId) of
        #item_base{} ->
            check_item(T, [{ItemId, Bind, Num} | Items]);
        _ ->
            logger:error("举报发放不存在的奖励:~w",
                         [ItemId],
                         friend_circle,
                         1246),
            check_item(T, Items)
    end;
check_item([_Err | _T], _Items) -> false.

do_handle_report(_Report, 2) -> ok;
do_handle_report(#friend_circle_report{type = 2,
                                       rid = Rid, moment_id = MomentId,
                                       spec_id = SpecId},
                 1) ->
    Title = lang:get("朋友圈内容违规"),
    Content =
        lang:get("您的朋友圈图片被举报，已核实删除。和谐的游戏氛围需要大家共同创建，请勿发表不良内容{fac"
                 "e_1,25}。"),
    mail:send(Rid,
              #{title => Title, content => Content, items => []}),
    PhotoSpec = #friend_moment_photo{moment_id = MomentId,
                                     id = SpecId, rid = Rid},
    delete(PhotoSpec);
do_handle_report(#friend_circle_report{type = 1,
                                       rid = Rid, moment_id = MomentId,
                                       spec_id = SpecId},
                 1) ->
    Title = lang:get("朋友圈内容违规"),
    Content =
        lang:get("您的朋友圈评论被举报，已核实删除。和谐的游戏氛围需要大家共同创建，请勿发表不良内容{fac"
                 "e_1,25}。"),
    mail:send(Rid,
              #{title => Title, content => Content, items => []}),
    PhotoSpec = #friend_comment{moment_id = MomentId,
                                id = SpecId, rid = Rid},
    delete(PhotoSpec);
do_handle_report(#friend_circle_report{type = 0,
                                       rid = Rid, moment_id = MomentId},
                 1) ->
    Title = lang:get("朋友圈内容违规"),
    Content =
        lang:get("您的朋友圈内容被举报，已核实删除。和谐的游戏氛围需要大家共同创建，请勿发表不良内容{fac"
                 "e_1,25}。"),
    mail:send(Rid,
              #{title => Title, content => Content, items => []}),
    PhotoSpec = #friend_moment{id = MomentId, rid = Rid},
    delete(PhotoSpec);
do_handle_report(_, _) -> false.

mark_report({{Mid, Plat, ZoneId}, ReportType, SpecId},
            State, Items) ->
    Sql = "update friend_circle_report set state "
          "= ?, items = ? where id = ? and platform "
          "= ? and zone_id = ? and report_type "
          "= ? and spec_id = ?",
    ItemStr = do_item_string(Items, ""),
    case db:exec(Sql,
                 [State, ItemStr, Mid, Plat, ZoneId, ReportType, SpecId])
        of
        ok -> ok;
        {error, Reason} ->
            logger:error("更新举报数据库时失败~w",
                         [Reason],
                         friend_circle,
                         1283),
            {false, Reason}
    end.

do_item_string([], Str) -> Str;
do_item_string([{ItemId, Bind, Num} | T], Str) ->
    NewStr = util:flist("{~w,~w,~w},~ts",
                        [ItemId, Bind, Num, Str]),
    do_item_string(T, NewStr);
do_item_string([_ | T], Str) -> do_item_string(T, Str).

reward_report(#friend_circle_report{reporter_id =
                                        RoleId,
                                    name = Name},
              2, _Items) ->
    Title = lang:get("举报无效"),
    Content =
        notice:format(lang:get("您举报的~ts朋友圈内容/图片无效，恶意举报会伤害他人喔。{face_1,21}"),
                      [{role_2, Name}]),
    mail:send(RoleId,
              #{title => Title, content => Content, items => []}),
    ok;
reward_report(#friend_circle_report{name = Name,
                                    reporter_id = RoleId, type = ReportType},
              _State, Items) ->
    Title = lang:get("举报成功"),
    Content = case ReportType of
                  2 ->
                      notice:format(lang:get("您举报的~ts朋友圈图片，审核属实。良好的游戏氛围需要大家共同创建，这是您的奖励{face"
                                             "_1,9}。"),
                                    [{role_2, Name}]);
                  _ ->
                      notice:format(lang:get("您举报的~ts朋友圈内容，审核属实。良好的游戏氛围需要大家共同创建，这是您的奖励{face"
                                             "_1,9}。"),
                                    [{role_2, Name}])
              end,
    mail:send(RoleId,
              #{title => Title, content => Content, items => Items}),
    ok;
reward_report(_, _, _Items) -> ok.

moment_notify([], _) -> ok;
moment_notify([Id | T], MomentId) ->
    case fetch(friend_circle, Id) of
        [Circle = #friend_circle{}] ->
            do_moment_notify(Circle, MomentId);
        _ ->
            save(#friend_circle{id = Id,
                                notifications = [MomentId]})
    end,
    moment_notify(T, MomentId).

do_moment_notify(Circle = #friend_circle{notifications =
                                             Notices},
                 MomentId) ->
    save(Circle#friend_circle{notifications =
                                  lists:sublist([MomentId | Notices --
                                                                [MomentId]],
                                                20)}).

lookup_circle(CircleId) ->
    case catch ets:lookup(friend_circle, CircleId) of
        [_C = #friend_circle{}] -> {ok, _C};
        _ ->
            case catch dets:lookup(friend_circle, CircleId) of
                [_Dc = #friend_circle{}] ->
                    ets:insert(friend_circle, _Dc),
                    {ok, _Dc};
                _ -> false
            end
    end.

