-file("src/mod/friend/friend_zone.erl", 1).

-module(friend_zone).

-behaviour(gen_server).

-export([start_link/0,
         login/1,
         info/1,
         info/2,
         update/3,
         visit/2,
         get_trends/2,
         local_get_trends/2,
         get_subscribed/2,
         add_trend/4,
         add_trend/3,
         add_trend_no_check/3,
         leave_trend/2,
         edit_trend/3,
         del_trend/2,
         comment/4,
         like/3,
         like/2,
         add_prize/2,
         tag/2,
         untag/2,
         subscribe/2,
         unsubscribe/2,
         apply_evt/2,
         list/2,
         get_photo/2,
         local_get_photo/2,
         get_default_photo/1,
         del_photo/2,
         audit_photo/3,
         rename/2,
         has_photo/1,
         get_popularity/1,
         set_theme/2,
         set_photo_frame/2,
         set_badges/2,
         fetch/2,
         set_honor/2,
         del_all_trends/1,
         update_photo_log/0]).

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

-file("src/mod/friend/friend_zone.erl", 53).

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

-file("src/mod/friend/friend_zone.erl", 54).

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

-file("src/mod/friend/friend_zone.erl", 55).

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

-file("src/mod/friend/friend_zone.erl", 56).

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

-file("src/mod/friend/friend_zone.erl", 57).

-file("inc/rank.hrl", 1).

-record(rank,
        {type = 1,
         show_list = [],
         list = [],
         last_val = 0,
         len = 0}).

-record(rank_rc,
        {ver = 3 :: pos_integer(),
         id = {roleid, platform, zoneid} :: term(),
         rank = 1,
         time = 0 :: non_neg_integer(),
         role_id = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: list(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = "",
         pet,
         guard,
         eqm}).

-record(rank_cfg,
        {type = 0 :: non_neg_integer(),
         num = 100 :: non_neg_integer(),
         keys = [#rank_rc.val3, #rank_rc.val2, #rank_rc.val1] ::
             [pos_integer()],
         min_val = 1 :: pos_integer(),
         nologin = 0 :: non_neg_integer(),
         zone = rank_zone_1 :: atom()}).

-file("src/mod/friend/friend_zone.erl", 58).

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

-file("src/mod/friend/friend_zone.erl", 59).

-file("inc/honor.hrl", 1).

-record(m_honor,
        {ver = 3,
         use_id = 0,
         last_id = 0,
         r_list = [] :: list(),
         pre_id = 0,
         r_pre_list = [] :: list(),
         pre_reward_list = [] :: list()}).

-record(honor,
        {id = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer()}).

-record(pre_honor,
        {pre_id = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer()}).

-record(honor_info,
        {key :: undefined | atom(),
         list = [] :: list(),
         end_time = 0 :: non_neg_integer()}).

-record(honor_base,
        {id = 0 :: non_neg_integer(),
         name = "" :: list(),
         type = 0 :: non_neg_integer(),
         mode_type = 0 :: non_neg_integer(),
         show_type = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         is_cast = 0,
         sex = 2 :: non_neg_integer(),
         attr_list = [] :: list(),
         is_can_pre = 0 :: non_neg_integer(),
         collect_val = 0 :: non_neg_integer(),
         color = 12 :: non_neg_integer()}).

-record(pre_honor_base,
        {pre_id = 0 :: non_neg_integer(),
         pre_name = "" :: list(),
         is_cast = 0,
         items = [] :: list(),
         loss_items = [] :: list()}).

-file("src/mod/friend/friend_zone.erl", 60).

-file("inc/wedding.hrl", 1).

-record(m_wedding,
        {ver = 1,
         lover_id = {0, "", 0},
         lover_name = "",
         status = 0,
         honor_ids = [],
         reward = [],
         mail = []}).

-record(lover,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         name = "" :: bitstring(),
         lover_id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         lover_name = "" :: bitstring(),
         type = 1 :: 1..2,
         status = 1 :: 0..2,
         ring_lev = 0 :: non_neg_integer(),
         intimacy = 0 :: non_neg_integer(),
         order_index = 0 :: non_neg_integer(),
         order_time = 0 :: non_neg_integer(),
         atmosp = 0 :: non_neg_integer(),
         index = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         lover_sex = 2 :: 0..2,
         lover_classes = 0,
         lover_lev = 0,
         lover_fc = 0,
         lover_pet_fc = 0,
         lover_face = 0}).

-record(guest,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         name = "" :: bitstring(),
         pid = 0 :: 0 | pid(),
         act_list = [],
         unit_list = [],
         classes = 0,
         sex = 0,
         lev = 0,
         face = 0}).

-record(wedding_atmosp_data,
        {type = 0 :: non_neg_integer(),
         min_val = 0 :: non_neg_integer(),
         max_val = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         scene_reward = [] :: list(),
         scene_msg = "" :: string(),
         male_reward = [] :: list(),
         famale_reward = [] :: list(),
         title = "" :: string(),
         content = "" :: string()}).

-record(wedding_act_data,
        {id = 0,
         type = 0,
         target = 1,
         free_num = 0,
         max_num = 0,
         cost = [],
         msg = "",
         log_msg = "",
         atmosp = 0,
         gain = [],
         main_gain = [],
         effect_type = 0,
         effect_id = 1,
         effect_num = 1,
         cd = 0}).

-record(wedding_rank, {type = 0, list = []}).

-record(wedding_rank_rc,
        {id = {{0, "", 0}, {0, "", 0}},
         male_id = {0, "", 0},
         male_name = "",
         rank = 1,
         time = 0 :: non_neg_integer(),
         male_sex = 0 :: 0..2,
         male_classes = 0 :: 0..4,
         male_lev = 0 :: non_neg_integer(),
         female_id = {0, "", 0},
         female_name = "",
         female_sex = 0 :: 0..2,
         female_classes = 0 :: 0..4,
         female_lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = ""}).

-record(wedding_rank_cfg,
        {type = 0 :: non_neg_integer(),
         num = 100 :: non_neg_integer(),
         keys =
             [#wedding_rank_rc.val3,
              #wedding_rank_rc.val2,
              #wedding_rank_rc.val1]
             :: [pos_integer()],
         min_val = 1 :: pos_integer()}).

-record(wedding_unit_data,
        {id = 0, target = 0, rand = [], limit = 0}).

-record(wedding_rank_honor_data,
        {type = 0,
         rank = 0,
         male_honor = 0,
         female_honor = 0,
         reward = [],
         title = "",
         content = ""}).

-record(wedding_rank_honor_type_data,
        {type = 0, day = day}).

-file("src/mod/friend/friend_zone.erl", 61).

-file("inc/teacher.hrl", 1).

-record(m_teacher,
        {id = {0, "", 0},
         ver = 2,
         name = "",
         status = 0,
         daily = [],
         daily_reward = 0,
         daily_time = 0,
         target = [],
         target_reward = [],
         target_rewarded = [],
         target_over = [],
         evaluation = [],
         study_lev = 0,
         mtime = 0,
         daily_goals = [],
         goals_times = 0}).

-record(teacher,
        {id = {0, "", 0},
         ver = 1,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         guild_id = {0, "", 0},
         guild_name = "",
         msg = "",
         teacher_score = 0,
         teacher_score_offline = 0,
         login_time = 0,
         fc = 0,
         students = []}).

-record(student,
        {id = {0, "", 0},
         ver = 2,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         status = 0,
         in_time = 0,
         out_time = 0,
         login_time = 0,
         guild_id = {0, "", 0},
         guild_name = "",
         daily = [],
         daily_time = 0,
         daily_reward = 0,
         quest_student_reward = 0,
         quest_teacher_reward = 0,
         encourage_time = 0,
         target = [],
         teacher_score = 0,
         fc = 0,
         target_reward = [],
         target_rewarded = []}).

-record(teacher_daily,
        {id = 1 :: pos_integer(),
         finish = 0 :: 0..2,
         progress = [] :: [tuple()]}).

-record(teacher_daily_data,
        {id = 1 :: pos_integer(),
         name = "" :: binary(),
         progress = [] :: [tuple()],
         reward = [],
         exp = 0}).

-record(teacher_target,
        {id = 1 :: pos_integer(),
         finish = 0 :: 0..2,
         progress = [] :: [tuple()]}).

-record(teacher_target_data,
        {id = 1 :: pos_integer(),
         name = "" :: binary(),
         progress = [] :: [tuple()],
         student_reward = [],
         teacher_reward = [],
         student_exp = 0,
         teacher_exp = 0}).

-record(teacher_sign,
        {id = {0, "", 0},
         ver = 1,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         online = 0,
         login_time = 0,
         logout_time = 0,
         online_time = 0,
         is_sign = 0,
         msg = ""}).

-record(teacher_quit_desc_data,
        {min = 0, max = 0, radio = 0, title = "", msg = ""}).

-record(teacher_student_sign_info,
        {id = {0, "", 0},
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         msg = ""}).

-file("src/mod/friend/friend_zone.erl", 62).

-file("inc/achieve_shop.hrl", 1).

-record(m_achieve_shop,
        {ver = 5 :: pos_integer(),
         shops = [] :: list(),
         zone_theme = 0 :: non_neg_integer(),
         team_mark = 401 :: non_neg_integer(),
         chat_bubble = 301 :: non_neg_integer(),
         photo_frame = 0 :: non_neg_integer(),
         badges = [] :: list(),
         prefix = 0,
         honor = 0,
         footmark = 0 :: non_neg_integer()}).

-record(ashop_goods_info,
        {ver = 1 :: non_neg_integer(),
         id = 0 :: non_neg_integer(),
         state = 0 :: non_neg_integer(),
         expire = 0 :: non_neg_integer()}).

-file("src/mod/friend/friend_zone.erl", 63).

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

-file("src/mod/friend/friend_zone.erl", 64).

-file("inc/sworn.hrl", 1).

-record(m_sworn,
        {ver = 0 :: pos_integer(),
         id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         status = 0 :: non_neg_integer(),
         name = "" :: string(),
         name_defined = "" :: string(),
         time = 0 :: list()}).

-record(sworn_role,
        {ver = 0 :: pos_integer(),
         role_id = 0 :: non_neg_integer(),
         id = 0 :: non_neg_integer(),
         name = "" :: string(),
         name_defined = "" :: string(),
         status = 0 :: non_neg_integer()}).

-record(sworn,
        {ver = 0 :: pos_integer(),
         id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: string(),
         time = 0 :: non_neg_integer(),
         sworn_val = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         num = 0 :: non_neg_integer(),
         head = 0 :: non_neg_integer(),
         pos = 0 :: non_neg_integer(),
         timeout = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         members = [] :: list(),
         votes = [] :: list(),
         trends = [] :: list(),
         lists = [] :: list()}).

-record(sworn_member,
        {ver = 0 :: pos_integer(),
         pos = 0 :: non_neg_integer(),
         role_id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: string(),
         name_defined = "" :: string(),
         lev = 0 :: pos_integer(),
         classes = 0 :: pos_integer(),
         sex = 0 :: pos_integer(),
         times = 0 :: pos_integer(),
         free = 0 :: pos_integer()}).

-record(sworn_trend,
        {type = 0 :: non_neg_integer(),
         id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: string(),
         r_id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         r_name = "" :: string(),
         r_lev = 0 :: non_neg_integer(),
         r_sex = 0 :: non_neg_integer(),
         r_classes = 0 :: non_neg_integer(),
         rename = "" :: string(),
         timeout = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         reason_id = 0 :: non_neg_integer(),
         reason_msg = "" :: string(),
         votes = [] :: list(),
         agree = 0 :: non_neg_integer(),
         lists = [] :: list()}).

-record(sworn_evt,
        {role_id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         finish = 0 :: non_neg_integer(),
         skill = 0 :: non_neg_integer(),
         invite = 0 :: non_neg_integer(),
         prefix = 0 :: non_neg_integer(),
         personal = 0 :: non_neg_integer()}).

-file("src/mod/friend/friend_zone.erl", 65).

-file("inc/log.hrl", 1).

-file("src/mod/friend/friend_zone.erl", 66).

-record(state, {}).

-spec login(#role{}) -> ok.

login(Role = #role{id = Id, name = Name, sex = Sex,
                   classes = Classes, lev = Lev, name_used = NameUsed,
                   m_wedding = #m_wedding{lover_name = LoverName},
                   m_honor = #m_honor{use_id = HonorId},
                   m_achieve_shop =
                       #m_achieve_shop{zone_theme = ThemeId, badges = Badges,
                                       photo_frame = PhotoFrame},
                   m_teacher = #m_teacher{name = TeacherName},
                   m_guild = MGuild,
                   m_sworn =
                       #m_sworn{id = SwornId, name = Prefix,
                                name_defined = Personal}}) ->
    Now = date:unixtime(),
    GuildName = case MGuild of
                    #m_guild{name = Gname} -> Gname;
                    _ -> ""
                end,
    SwornName = case SwornId of
                    {SwornId1, _P, _Z} when SwornId1 > 0 ->
                        util:flist("~ts之~ts", [Prefix, Personal]);
                    _ -> ""
                end,
    Signature = case fetch(friend_zone, Id) of
                    [#friend_zone{signature = Sgn}] ->
                        Me = #{id => Id, sex => Sex, classes => Classes,
                               now => Now, name_used => NameUsed,
                               honor_id => HonorId, lover_name => LoverName,
                               theme => ThemeId, badges => Badges,
                               photo_frame => PhotoFrame,
                               teacher_name => TeacherName, guild => GuildName,
                               sworn_name => SwornName},
                        friend_zone ! {login, Me},
                        Sgn;
                    _ ->
                        Z = #friend_zone{id = Id, name = Name, sex = Sex,
                                         online_time = Now, classes = Classes,
                                         lev = Lev, honor_id = HonorId,
                                         lover_name = LoverName,
                                         theme = ThemeId, badges = Badges,
                                         photo_frame = PhotoFrame,
                                         teacher_name = TeacherName,
                                         guild = GuildName,
                                         sworn_name = SwornName},
                        save(Z),
                        ""
                end,
    L = [#trigger{label = evt_levup, a = [],
                  m = friend_zone, f = apply_evt}],
    Role2 = case friend:set_signature(Role, Signature) of
                {ok, Role1} -> Role1;
                _ -> Role
            end,
    {_, NRole} = role_trigger:add(L, Role2),
    {ok, NRole}.

-spec set_theme(#role{}, non_neg_integer()) -> ok.

set_theme(Role, ThemeId) ->
    achieve_shop:set_zone_theme(Role, ThemeId).

-spec set_honor(#role{}, non_neg_integer()) -> ok.

set_honor(Role, HonorId) ->
    achieve_shop:set_honor(Role, HonorId).

-spec set_photo_frame(#role{}, non_neg_integer()) -> ok.

set_photo_frame(Role, PhotoFrame) ->
    achieve_shop:set_photo_frame(Role, PhotoFrame).

set_badges(Role, Badges) ->
    achieve_shop:set_badges(Role, Badges).

lookup_friend_zone(Key) ->
    case catch ets:loookup(friend_zone, Key) of
        [Zone = #friend_zone{}] -> [Zone];
        _ ->
            case catch dets:lookup(friend_zone, Key) of
                [Zone] ->
                    case friend_zone_ver:do(Zone) of
                        {ok, NewZ} ->
                            save(NewZ),
                            [NewZ];
                        {false, Reason} ->
                            logger:error("空间数据转换失败:~w",
                                         [Reason],
                                         friend_zone,
                                         167),
                            false
                    end;
                _ -> false
            end
    end.

lookup_friend_trend(Key) ->
    case catch ets:loookup(friend_trend, Key) of
        [Trend = #friend_trend{}] -> [Trend];
        _ ->
            case catch dets:lookup(friend_trend, Key) of
                [Trend] -> [Trend];
                _ -> false
            end
    end.

fetch(friend_zone, Key) ->
    logger:debug("查询朋友圈:~w ================:~w",
                 [Key, util:get_stacktrace()],
                 friend_zone,
                 191),
    lookup_friend_zone(Key);
fetch(friend_trend, Key) -> lookup_friend_trend(Key);
fetch(Tab, Key) -> ets:lookup(Tab, Key).

rename(#role{name = Name, id = Id}, OldName) ->
    friend_zone ! {rename, Id, Name, OldName},
    ok.

apply_evt(_Evt, #role{lev = Lev}) when Lev < 10 -> ok;
apply_evt(#evt_levup{},
          #role{id = Id, name = Name, sex = Sex,
                classes = Classes, lev = Lev}) ->
    Now = date:unixtime(),
    case fetch(friend_zone, Id) of
        [#friend_zone{}] ->
            friend_zone ! {levup, Id, Lev},
            ok;
        _ ->
            save(#friend_zone{id = Id, name = Name, sex = Sex,
                              online_time = Now, classes = Classes, lev = Lev})
    end.

-spec info(#role{}) -> {#friend_zone{},
                        [#friend_trend{}]}.

info(#role{id = Id}) ->
    case fetch(friend_zone, Id) of
        [Zone = #friend_zone{}] -> {Zone};
        _ -> {#friend_zone{}}
    end.

info(Id, Pos) ->
    ets:lookup_element(friend_zone, Id, Pos).

-spec list(#role{}, friends | rank) -> [#friend_zone{}].

list(#role{id = Id}, friends) ->
    Ids = friend:list_id(Id),
    do_list(Ids);
list(#role{}, rank) -> ets:tab2list(friend_zone_rank).

-spec update(#role{}, Type :: atom(),
             Content :: term()) -> ok.

update(#role{lev = Lev}, photo, _Content)
    when Lev < 40 ->
    {false, util:flist(lang:get("角色等级达到~w可以上传照片"), [40])};
update(#role{id = Id}, Type, Content) ->
    case fetch(friend_zone, Id) of
        [Z = #friend_zone{}] when Type =:= photo ->
            do_update(Z, Type, Content);
        [#friend_zone{}] -> do_update(Id, Type, Content);
        _ -> {false, lang:get("你还没开通空间")}
    end.

tag(#role{id = Id}, Tag) ->
    case fetch(friend_zone, Id) of
        [#friend_zone{tags = Tags}] ->
            case lists:seq(1, 6) -- [I || {I, _} <- Tags] of
                [H | _] ->
                    friend_zone ! {tag, Id, {H, Tag}},
                    ok;
                _ -> {false, util:flist(lang:get("最多只能打~w个标签"), [6])}
            end;
        _ -> {false, lang:get("你还没开通空间")}
    end.

untag(#role{id = Id}, Tid) ->
    case fetch(friend_zone, Id) of
        [#friend_zone{tags = Tags}] ->
            case lists:keyfind(Tid, 1, Tags) of
                {Tid, _} ->
                    friend_zone ! {untag, Id, Tid},
                    ok;
                _ -> {false, lang:get("标签不存在")}
            end;
        _ -> {false, lang:get("你还没开通空间")}
    end.

-spec visit(#role{},
            TargetId :: tuple()) -> {#friend_zone{},
                                     [#friend_trend{}]}.

visit(R = #role{id = Id},
      TargetId = {_, Platform, ZoneId}) ->
    IsSubscribed = case fetch(friend_zone, Id) of
                       [#friend_zone{subscribed = Subed}] ->
                           case lists:keyfind(TargetId,
                                              #friend_subscription.id,
                                              Subed)
                               of
                               #friend_subscription{} -> 1;
                               _ -> 0
                           end;
                       _ -> 0
                   end,
    case big_world:call(Platform,
                        ZoneId,
                        friend_zone,
                        fetch,
                        [friend_zone, TargetId])
        of
        [Zone = #friend_zone{likes = Likes}] ->
            big_world:cast(Platform,
                           ZoneId,
                           erlang,
                           send,
                           [friend_zone,
                            {visit, TargetId, to(friend_visitor, R)}]),
            Zone1 = cover_privacy(Zone,
                                  friend:is_friend(R, TargetId)),
            Likable = case lists:keyfind(Id, 1, Likes) of
                          {Id, Last} ->
                              case date:is_same_day(date:unixtime(), Last) of
                                  true -> 0;
                                  _ -> 1
                              end;
                          _ -> 1
                      end,
            {Zone1, IsSubscribed, Likable};
        _ ->
            notice:send(R, 1, lang:get("找不到对方空间")),
            ok
    end.

-spec get_subscribed(#role{},
                     More :: 0 | 1) -> [#friend_trend{}].

get_subscribed(#role{id = Id}, _More) ->
    case fetch(friend_zone, Id) of
        [#friend_zone{subscribed_trends = Subs}] ->
            attach_likable(do_get_trends(Subs), Id);
        _ -> []
    end.

-spec get_trends(#role{}, Id :: tuple()) -> [{0 | 1,
                                              #friend_trend{}}].

get_trends(#role{id = Mine},
           Id = {_, Platform, ZoneId}) ->
    case big_world:call(Platform,
                        ZoneId,
                        friend_zone,
                        local_get_trends,
                        [Mine, Id])
        of
        [H | T] -> [H | T];
        _ -> []
    end.

local_get_trends(Mine, Id) ->
    case fetch(friend_zone, Id) of
        [#friend_zone{own_trends = Trends}] ->
            attach_likable(do_get_trends(Trends), Mine);
        _ -> []
    end.

-spec add_trend(#role{}, Type :: non_neg_integer(),
                Content :: string() | binary(),
                ZoneId :: tuple()) -> ok.

add_trend(Role, Type, Content, ZoneId) ->
    add_trend(Role,
              Type,
              #{content => Content, zone_id => ZoneId}).

add_trend(#role{lev = Lev}, _Type, _Info)
    when Lev < 40 ->
    {false, util:flist(lang:get("角色等级~w可以留言"), [40])};
add_trend(#role{id = Id, sex = Sex, classes = Classes,
                name = Name, pid = Pid},
          Type,
          Info = #{content := Content,
                   zone_id := ZoneId = {_, Platform, ZId}}) ->
    Presents = case Info of
                   #{presents := Pres} -> Pres;
                   _ -> []
               end,
    case util:check_text(Content, 100, lang:get("内容")) of
        {false, Why} -> {false, Why};
        _ ->
            case fetch(friend_zone, Id) of
                [#friend_zone{}] ->
                    Now = date:unixtime(),
                    case Id =:= ZoneId of
                        true ->
                            Tid = friend_util:get_id(friend_trend),
                            Trend = #friend_trend{zone_id = Id, id = Tid,
                                                  type = Type, name = Name,
                                                  content = Content, rid = Id,
                                                  sex = Sex, classes = Classes,
                                                  ctime = Now,
                                                  presents = Presents},
                            push(Pid, 11830, {Trend}),
                            save(Trend),
                            friend_zone ! {deliver_trend, Id, Tid},
                            ok;
                        _ ->
                            Popularity = case Info of
                                             #{popularity := Pop} -> Pop;
                                             _ -> 0
                                         end,
                            Trend = #friend_trend{zone_id = ZoneId, type = Type,
                                                  name = Name,
                                                  content = Content, rid = Id,
                                                  sex = Sex, classes = Classes,
                                                  ctime = Now,
                                                  presents = Presents},
                            case big_world:call(Platform,
                                                ZId,
                                                friend_zone,
                                                leave_trend,
                                                [Trend, Popularity])
                                of
                                ok -> ok;
                                {false, Reason} -> {false, Reason};
                                _ -> {false, lang:get("找不到留言")}
                            end
                    end;
                _ -> {false, lang:get("你还没开通空间")}
            end
    end.

leave_trend(Trend0 = #friend_trend{zone_id = ZoneId,
                                   rid = Id, presents = Presents},
            Popularity) ->
    case fetch(friend_zone, ZoneId) of
        [#friend_zone{privacy_zone = PrivacyZone}] ->
            CanLeaveTrend = case PrivacyZone =:= 0 of
                                true -> true;
                                _ ->
                                    case friend:is_friend(ZoneId, Id) orelse
                                             friend:is_cross_friend(ZoneId, Id)
                                        of
                                        true -> true;
                                        _ -> false
                                    end
                            end,
            case CanLeaveTrend of
                true ->
                    Tid = friend_util:get_id(friend_trend),
                    Trend = Trend0#friend_trend{id = Tid},
                    case role_query:pid(by_id, ZoneId) of
                        {ok, ToPid} -> push(ToPid, 11830, {Trend});
                        _ -> ok
                    end,
                    save(Trend),
                    PresentNum = lists:sum([Num || {_, Num} <- Presents]),
                    logger:debug("留言 ~w", [ZoneId], friend_zone, 426),
                    friend_zone !
                        {leave_trend, Id, ZoneId, Tid, Popularity, PresentNum},
                    ok;
                _ ->
                    Msg =
                        notice:format(lang:get("对方已禁止陌生人评论，~ts吧{face_1,3}"),
                                      [{string_2, 5, lang:get("快加TA好友")}]),
                    {false, Msg}
            end;
        _ -> {false, lang:get("对方还没开通空间")}
    end.

-spec edit_trend(#role{}, Type :: non_neg_integer(),
                 Content :: string() | binary()) -> ok.

edit_trend(#role{id = Id, pid = Pid}, Tid, Content) ->
    case util:text_banned(Content) of
        true -> {false, lang:get("内容中有禁用词语")};
        _ ->
            case fetch(friend_trend, Tid) of
                [Trend = #friend_trend{zone_id = Id}] ->
                    NewTrend = Trend#friend_trend{content = Content},
                    push(Pid, 11830, {NewTrend}),
                    save(NewTrend);
                _ -> {false, lang:get("修改失败")}
            end
    end.

-spec del_trend(#role{},
                TrendId :: non_neg_integer()) -> ok.

del_trend(#role{id = Id}, TrendId) ->
    case fetch(friend_trend, TrendId) of
        [Trend = #friend_trend{zone_id = Id}] ->
            delete(Trend),
            friend_zone ! {del_trend, Id, TrendId},
            ok;
        _ ->
            friend_zone ! {del_trend, Id, TrendId},
            ok
    end.

comment(Role = #role{id = Id, name = Name}, TrendId,
        Msg, Zid = {_, P, Z}) ->
    case big_world:call(P,
                        Z,
                        friend_zone,
                        fetch,
                        [friend_trend, TrendId])
        of
        [#friend_trend{zone_id = Zid, rid = Id}] ->
            add_trend(Role, 0, Msg, Zid);
        [#friend_trend{zone_id = Zid, rid = Zid}] ->
            add_trend(Role, 0, Msg, Zid);
        [#friend_trend{zone_id = Id, name = TName,
                       rid = Rid}] ->
            Content1 = notice:format(lang:get("对~ts说：~ts"),
                                     [{role_1, Rid, TName}, {string_1, Msg}]),
            add_trend(Role, 4, Content1, Id),
            Content2 = notice:format(lang:get("在~ts的空间对你说：~ts"),
                                     [{role_1, Id, Name}, {string_1, Msg}]),
            add_trend(Role, 4, Content2, Rid);
        [#friend_trend{zone_id = Zid = {_, P, Z}, name = TName,
                       rid = Rid}] ->
            case big_world:call(P,
                                Z,
                                friend_zone,
                                fetch,
                                [friend_zone, Zid])
                of
                [#friend_zone{name = ZName}] ->
                    Content1 = notice:format(lang:get("对~ts说：~ts"),
                                             [{role_1, Rid, TName},
                                              {string_1, Msg}]),
                    add_trend(Role, 4, Content1, Zid),
                    Content2 = notice:format(lang:get("在~ts的空间对你说：~ts"),
                                             [{role_1, Zid, ZName},
                                              {string_1, Msg}]),
                    add_trend(Role, 4, Content2, Rid);
                _ -> {false, lang:get("找不到对方空间")}
            end;
        _ -> {false, lang:get("找不到留言")}
    end.

-spec like(#role{}, TargetId :: tuple(),
           TrendId :: non_neg_integer()) -> ok.

like(#role{lev = Lev}, _TargetId, _TrendId)
    when Lev < 40 ->
    {false, util:flist(lang:get("角色等级~w可以点赞"), [40])};
like(#role{pid = Pid, id = Id}, TargetId, TrendId) ->
    case fetch(friend_trend, TrendId) of
        [#friend_trend{rid = Id}] ->
            {false, lang:get("不能赞自己的留言")};
        [#friend_trend{likes = Likes, zone_id = TargetId}] ->
            case lists:member(Id, Likes) of
                true -> {false, lang:get("你已赞过了")};
                _ ->
                    friend_zone ! {like, TargetId, TrendId, Pid, Id},
                    ok
            end;
        _ -> {false, lang:get("动态不存在")}
    end.

-spec like(#role{}, TargetId :: tuple()) -> ok.

like(#role{id = TargetId}, TargetId) ->
    {false, lang:get("不能踩自己的空间")};
like(#role{lev = Lev}, _TargetId) when Lev < 40 ->
    {false, util:fbin(lang:get("角色等级达到~w级才能踩空间"), [40])};
like(Role = #role{id = Id}, TargetId = {_, P, ZId}) ->
    case fetch(friend_zone, Id) of
        [#friend_zone{}] ->
            case big_world:call(P,
                                ZId,
                                friend_zone,
                                fetch,
                                [friend_zone, TargetId])
                of
                [Z = #friend_zone{}] -> do_like(Role, Z);
                _ -> {false, lang:get("对方还没开通空间")}
            end;
        _ -> {false, lang:get("你还没开通空间")}
    end.

do_like(Role = #role{id = Id},
        #friend_zone{likes = Likes, id = TargetId,
                     prize_num = PNum}) ->
    case lists:keyfind(Id, #friend_like.id, Likes) of
        #friend_like{time = Last} ->
            case date:is_same_day(date:unixtime(), Last) of
                true -> {false, lang:get("你今天已赞过对方了")};
                _ -> do_like_reward(Role, PNum, TargetId)
            end;
        _ -> do_like_reward(Role, PNum, TargetId)
    end.

do_like_reward(Role = #role{id = Rid, name = Rname},
               PNum, TargetId = {_, P, Z}) ->
    Like = to(friend_like, Role),
    case 10 > var:get_var(Role, day, friend_zone_liked, 0)
             andalso PNum > 0 andalso util:rand(1, 100) =< 20
        of
        true ->
            {A, Num, _} =
                util:rand_list(friend_data:get_high_prize(), 3),
            Role1 = var:acc_var(Role, day, friend_zone_liked),
            Gl = format:val_to_gain([{A, 0, Num}]),
            case big_world:call(P,
                                Z,
                                gen_server,
                                call,
                                [friend_zone,
                                 {like,
                                  Like#friend_like{got_prize = 1},
                                  TargetId}])
                of
                ok ->
                    case role_gain:do_notice(Gl, Role1) of
                        {ok, NewRole} ->
                            Msg = lang:get("点赞成功"),
                            add_trend_no_check(Role,
                                               2,
                                               lang:get("踩一踩，幸运的获得了主人留下的礼物^_^"),
                                               TargetId),
                            Notice = notice:format(lang:get("~ts刚刚点赞了你的空间"),
                                                   [{role_1, Rid, Rname}]),
                            big_world:cast(P,
                                           Z,
                                           role,
                                           apply,
                                           [async,
                                            TargetId,
                                            {notice, send, [3, Notice]}]),
                            {ok, Msg, A, NewRole};
                        _ -> {false, lang:get("背包是不是满了？")}
                    end;
                Else -> Else
            end;
        _ ->
            case big_world:cast(P,
                                Z,
                                gen_server,
                                call,
                                [friend_zone, {like, Like, TargetId}])
                of
                ok ->
                    Msg = lang:get("点赞成功"),
                    Notice = notice:format(lang:get("~ts刚刚点赞了你的空间"),
                                           [{role_1, Rid, Rname}]),
                    big_world:cast(P,
                                   Z,
                                   role,
                                   apply,
                                   [async,
                                    TargetId,
                                    {notice, send, [3, Notice]}]),
                    {ok, Msg, 0, Role};
                Else -> Else
            end
    end.

add_trend_no_check(Role, Type, Content, ZoneId) ->
    add_trend_no_check(Role,
                       Type,
                       #{content => Content, zone_id => ZoneId}).

add_trend_no_check(#role{id = Id, sex = Sex,
                         classes = Classes, name = Name, pid = Pid},
                   Type,
                   Info = #{content := Content,
                            zone_id := ZoneId = {_, Platform, ZId}}) ->
    Presents = case Info of
                   #{presents := Pres} -> Pres;
                   _ -> []
               end,
    case fetch(friend_zone, Id) of
        [#friend_zone{}] ->
            Now = date:unixtime(),
            case Id =:= ZoneId of
                true ->
                    Tid = friend_util:get_id(friend_trend),
                    Trend = #friend_trend{zone_id = Id, id = Tid,
                                          type = Type, name = Name,
                                          content = Content, rid = Id,
                                          sex = Sex, classes = Classes,
                                          ctime = Now, presents = Presents},
                    push(Pid, 11830, {Trend}),
                    save(Trend),
                    friend_zone ! {deliver_trend, Id, Tid},
                    ok;
                _ ->
                    Popularity = case Info of
                                     #{popularity := Pop} -> Pop;
                                     _ -> 0
                                 end,
                    Trend = #friend_trend{zone_id = ZoneId, type = Type,
                                          name = Name, content = Content,
                                          rid = Id, sex = Sex,
                                          classes = Classes, ctime = Now,
                                          presents = Presents},
                    big_world:call(Platform,
                                   ZId,
                                   friend_zone,
                                   leave_trend,
                                   [Trend, Popularity])
            end;
        _ -> {false, lang:get("你还没开通空间")}
    end.

-spec subscribe(#role{}, TargetId :: tuple()) -> ok.

subscribe(#role{id = Id}, TargetId) ->
    case fetch(friend_zone, Id) of
        [#friend_zone{subscribed = Subed}] ->
            case lists:keyfind(TargetId,
                               #friend_subscription.id,
                               Subed)
                of
                #friend_subscription{} ->
                    {false, lang:get("你已经关注过对方了")};
                _ ->
                    case fetch(friend_zone, TargetId) of
                        [#friend_zone{name = Name, classes = Classes,
                                      sex = Sex}] ->
                            Subs = #friend_subscription{id = TargetId,
                                                        name = Name,
                                                        classes = Classes,
                                                        sex = Sex},
                            friend_zone ! {subscribe, Id, Subs},
                            ok;
                        _ -> {false, lang:get("对方还没开通空间")}
                    end
            end;
        _ -> {false, lang:get("你还没开通空间")}
    end.

-spec unsubscribe(#role{}, TargetId :: tuple()) -> ok.

unsubscribe(#role{id = Id}, TargetId) ->
    case fetch(friend_zone, Id) of
        [#friend_zone{subscribed = Subed}] ->
            case lists:keyfind(TargetId,
                               #friend_subscription.id,
                               Subed)
                of
                #friend_subscription{} ->
                    friend_zone ! {unsubscribe, Id, TargetId},
                    ok;
                _ -> {false, lang:get("你还没关注对方了")}
            end;
        _ -> {false, lang:get("你还没开通空间")}
    end.

-spec add_prize(#role{}, Num :: pos_integer()) -> ok.

add_prize(#role{}, Num) when Num > 30 ->
    {false, util:flist(lang:get("最多只能投放~w大礼"), [30])};
add_prize(Role = #role{id = Id}, Num) ->
    case fetch(friend_zone, Id) of
        [#friend_zone{prize_num = PNum}] when PNum + Num > 30 ->
            {false, util:flist(lang:get("最多只能投放~w大礼"), [30])};
        [#friend_zone{}] ->
            case role_gain:do([#loss{label = coin,
                                     val = 38500 * Num}],
                              Role)
                of
                {ok, NewRole} ->
                    friend_zone ! {add_prize, Id, Num},
                    {ok, NewRole};
                _ -> {false, <<>>}
            end;
        _ -> {false, lang:get("你还没开通空间")}
    end.

get_photo(MyId, Id = {_, Platform, ZoneId}) ->
    case big_world:call(Platform,
                        ZoneId,
                        friend_zone,
                        local_get_photo,
                        [MyId, Id])
        of
        [H | T] -> [H | T];
        _ -> []
    end.

local_get_photo(MyId, Id) ->
    case fetch(friend_zone, Id) of
        [#friend_zone{photo = Photo}] ->
            do_get_photo(MyId, Id, Photo);
        _ -> []
    end.

get_default_photo(Id) ->
    case fetch(friend_zone, Id) of
        [#friend_zone{photo = Photo}] ->
            do_get_default_photo(Id, Photo);
        _ -> []
    end.

del_photo(#role{id = Id}, N) ->
    case fetch(friend_zone, Id) of
        [#friend_zone{}] ->
            case file:delete(get_face_photo(Id, N)) of
                ok ->
                    friend_zone ! {del_photo, Id, N},
                    ok;
                _Else ->
                    logger:debug("删除照片失败 ~w", [_Else], friend_zone, 720),
                    {false, lang:get("删除失败")}
            end;
        _ -> {false, lang:get("还没开通空间")}
    end.

audit_photo(Id, N, Result) ->
    logger:info("审核信息 ~w",
                [{Id, Result}],
                friend_zone,
                727),
    case fetch(friend_zone, Id) of
        [#friend_zone{}] ->
            case Result of
                2 ->
                    MailInfo = #{items => [], title => lang:get("照片审核失败"),
                                 content =>
                                     lang:get("您好，您上传的照片未通过审核，请更换照片重新上传。（头像请不要包含违法违规内容）")},
                    mail:send(Id, MailInfo),
                    file:delete(get_face_photo(Id, N));
                _ -> ok
            end,
            friend_zone ! {audit_photo, Id, N, Result},
            ok;
        _ -> ok
    end.

has_photo(#role{id = Id}) ->
    case fetch(friend_zone, Id) of
        [#friend_zone{photo = Photo}] ->
            case [A
                  || A = #friend_zone_photo{auditing = 1} <- Photo]
                of
                [] -> 0;
                _ -> 1
            end;
        _ -> 0
    end.

get_popularity(#role{id = Id}) ->
    case fetch(friend_zone, Id) of
        [#friend_zone{liked = Pop}] -> Pop;
        _ -> 0
    end.

del_all_trends(RoleId) ->
    Alltrends = ets:tab2list(friend_trend),
    logger:debug("======~w", [RoleId], friend_zone, 767),
    case Dellists = [FT
                     || FT = #friend_trend{rid = RoleId1} <- Alltrends,
                        RoleId1 =:= RoleId]
        of
        [] -> {false, lang:get("该玩家没有空间留言记录")};
        _ -> do_delall(Dellists)
    end.

do_delall([Trend = #friend_trend{zone_id = ZoneId,
                                 id = TrendId}
           | T]) ->
    delete(Trend),
    friend_zone ! {del_trend, ZoneId, TrendId},
    do_delall(T);
do_delall([]) -> ok.

start_link() ->
    gen_server:start_link({local, friend_zone},
                          friend_zone,
                          [],
                          []).

init([]) ->
    logger:info("开始启动...", [], friend_zone, 788),
    friend_util:init_ids(),
    dets:open_file(friend_zone,
                   [{file, "./dets/friend_zone.dets"},
                    {keypos, #friend_zone.id}]),
    ets:new(friend_zone,
            [set, named_table, public, {keypos, #friend_zone.id}]),
    dets:open_file(friend_trend,
                   [{file, "./dets/friend_trend.dets"},
                    {keypos, #friend_trend.id}]),
    ets:new(friend_trend,
            [set, named_table, public, {keypos, #friend_trend.id}]),
    dets:open_file(friend_zone_rank,
                   [{file, "./dets/friend_zone_rank.dets"},
                    {keypos, #friend_zone_rank.id}]),
    ets:new(friend_zone_rank,
            [set,
             named_table,
             public,
             {keypos, #friend_zone_rank.id}]),
    dets:open_file(friend_zone_rank_week,
                   [{file, "./dets/friend_zone_rank_week.dets"},
                    {keypos, #friend_zone_rank_week.id}]),
    ets:new(friend_zone_rank_week,
            [set,
             named_table,
             public,
             {keypos, #friend_zone_rank_week.id}]),
    load_data(),
    friend_util:init_root_dir(),
    erlang:send_after(date:next_diff(23, 58, 1) * 1000,
                      self(),
                      update_rank),
    State = #state{},
    logger:info("启动完成", [], friend_zone, 805),
    State = #state{},
    {ok, State}.

handle_call({like,
             Like = #friend_like{id = Id, got_prize = HighNum},
             TargetId},
            _From, State) ->
    Reply = case fetch(friend_zone, TargetId) of
                [Z = #friend_zone{liked = Liked, likes = Likes,
                                  prize_num = PNum}] ->
                    Now = date:unixtime(),
                    case lists:keyfind(Id, 1, Likes) of
                        #friend_like{time = Last} ->
                            case date:is_same_day(Now, Last) of
                                true -> {false, lang:get("今天已经赞过对方了")};
                                _ ->
                                    NewLikes = update_likes(Likes, Like),
                                    NewZ = add_week_liked(Z#friend_zone{liked =
                                                                            Liked
                                                                                +
                                                                                1,
                                                                        likes =
                                                                            NewLikes,
                                                                        prize_num
                                                                            =
                                                                            max(0,
                                                                                PNum
                                                                                    -
                                                                                    HighNum)},
                                                          Now,
                                                          1),
                                    update_rank(NewZ),
                                    role_trigger:async_fire(Id,
                                                            [#evt_friend_zone_like{val
                                                                                       =
                                                                                       Liked
                                                                                           +
                                                                                           1}]),
                                    role_trigger:async_fire(TargetId,
                                                            [#evt_friend_zone_liked{val
                                                                                        =
                                                                                        Liked
                                                                                            +
                                                                                            1}]),
                                    save(NewZ),
                                    ok
                            end;
                        _ ->
                            NewLikes = update_likes(Likes, Like),
                            NewZ = add_week_liked(Z#friend_zone{liked =
                                                                    Liked + 1,
                                                                likes =
                                                                    NewLikes,
                                                                prize_num =
                                                                    max(0,
                                                                        PNum -
                                                                            HighNum)},
                                                  Now,
                                                  1),
                            update_rank(NewZ),
                            camp_guild_bady:fire(add_score, Z, 1),
                            role_trigger:async_fire(Id,
                                                    [#evt_friend_zone_like{val =
                                                                               Liked
                                                                                   +
                                                                                   1},
                                                     #evt_friend_zone_like_baby{val
                                                                                    =
                                                                                    1}]),
                            role_trigger:async_fire(TargetId,
                                                    [#evt_friend_zone_liked{val
                                                                                =
                                                                                Liked
                                                                                    +
                                                                                    1}]),
                            save(NewZ),
                            ok
                    end;
                _ -> {false, lang:get("对方还没开通空间")}
            end,
    {reply, Reply, State};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({visit,
             TargetId,
             V = #friend_visitor{id = Id}},
            State) ->
    case fetch(friend_zone, TargetId) of
        [Z = #friend_zone{visitors = Visitors,
                          visited = Visited}] ->
            NewVisitors = case lists:keyfind(Id,
                                             #friend_visitor.id,
                                             Visitors)
                              of
                              #friend_visitor{} ->
                                  lists:keyreplace(Id,
                                                   #friend_visitor.id,
                                                   Visitors,
                                                   V);
                              _ -> lists:sublist([V | Visitors], 1, 6)
                          end,
            case fetch(friend_zone, Id) of
                [Zs = #friend_zone{}] ->
                    add_cared(Zs,
                              Z#friend_zone{visitors = NewVisitors,
                                            visited = Visited + 1},
                              1);
                _ ->
                    save(Z#friend_zone{visitors = NewVisitors,
                                       visited = Visited + 1})
            end;
        _ -> ok
    end,
    {noreply, State};
handle_info({like, TargetId, Tid, Pid, Id}, State) ->
    case fetch(friend_trend, Tid) of
        [T = #friend_trend{zone_id = TargetId, liked = Liked,
                           likes = Likes}] ->
            Likes1 = Likes -- [Id],
            NewT = T#friend_trend{liked = Liked + 1,
                                  likes = [Id | Likes1]},
            push(Pid, 11830, {NewT}),
            add_cared(Id, TargetId, 1),
            save(NewT);
        _ -> ok
    end,
    {noreply, State};
handle_info({add_prize, Id, Num}, State) ->
    case fetch(friend_zone, Id) of
        [Z = #friend_zone{prize_num = PNum}] ->
            save(Z#friend_zone{prize_num = min(30, PNum + Num)});
        _ -> ok
    end,
    {noreply, State};
handle_info({tag, Id, Tag}, State) ->
    case fetch(friend_zone, Id) of
        [Z = #friend_zone{tags = Tags}] ->
            save(Z#friend_zone{tags = [Tag | Tags]});
        _ -> ok
    end,
    {noreply, State};
handle_info({untag, Id, Tid}, State) ->
    case fetch(friend_zone, Id) of
        [Z = #friend_zone{tags = Tags}] ->
            save(Z#friend_zone{tags =
                                   lists:keydelete(Tid, 1, Tags)});
        _ -> ok
    end,
    {noreply, State};
handle_info({subscribe,
             Id,
             Sub = #friend_subscription{id = Sid}},
            State) ->
    case {fetch(friend_zone, Id), fetch(friend_zone, Sid)}
        of
        {[Z = #friend_zone{subscribed = Subed, name = Name,
                           classes = Classes, sex = Sex}],
         [Zs = #friend_zone{fans = Fans}]} ->
            Fan = #friend_subscription{id = Id, name = Name,
                                       classes = Classes, sex = Sex},
            save(Z#friend_zone{subscribed =
                                   lists:keystore(Sid,
                                                  #friend_subscription.id,
                                                  Subed,
                                                  Sub)}),
            save(Zs#friend_zone{fans =
                                    lists:keystore(Id,
                                                   #friend_subscription.id,
                                                   Fans,
                                                   Fan)});
        _ -> ok
    end,
    {noreply, State};
handle_info({unsubscribe, Id, Sid}, State) ->
    case fetch(friend_zone, Id) of
        [Z = #friend_zone{subscribed = Subed}] ->
            save(Z#friend_zone{subscribed =
                                   lists:keydelete(Sid,
                                                   #friend_subscription.id,
                                                   Subed)}),
            case fetch(friend_zone, Sid) of
                [Zs = #friend_zone{fans = Fans}] ->
                    save(Zs#friend_zone{fans =
                                            lists:keydelete(Id,
                                                            #friend_subscription.id,
                                                            Fans)});
                _ -> ok
            end;
        _ -> ok
    end,
    {noreply, State};
handle_info({update, photo, Id, N}, State) ->
    case fetch(friend_zone, Id) of
        [Z = #friend_zone{photo = Photo}] ->
            NewPhoto = lists:keystore(N,
                                      #friend_zone_photo.id,
                                      Photo,
                                      #friend_zone_photo{id = N,
                                                         uploaded =
                                                             date:unixtime(),
                                                         auditing = 0}),
            save(Z#friend_zone{photo = NewPhoto});
        _ -> ok
    end,
    {noreply, State};
handle_info({update, default_photo, Id, N}, State) ->
    case fetch(friend_zone, Id) of
        [Z = #friend_zone{photo = Photo}] ->
            NewPhoto = case lists:keyfind(N,
                                          #friend_zone_photo.id,
                                          Photo)
                           of
                           P = #friend_zone_photo{auditing = 1} ->
                               Photo1 = [P1#friend_zone_photo{default = 0}
                                         || P1 = #friend_zone_photo{} <- Photo],
                               lists:keyreplace(N,
                                                #friend_zone_photo.id,
                                                Photo1,
                                                P#friend_zone_photo{default =
                                                                        1});
                           _ -> Photo
                       end,
            save(Z#friend_zone{photo = NewPhoto});
        _ -> ok
    end,
    {noreply, State};
handle_info({del_photo, Id, N}, State) ->
    case fetch(friend_zone, Id) of
        [Z = #friend_zone{photo = Photo}] ->
            NewPhoto0 = lists:keydelete(N,
                                        #friend_zone_photo.id,
                                        Photo),
            NewPhoto = case [A
                             || A = #friend_zone_photo{auditing = 1}
                                    <- NewPhoto0]
                           of
                           [] ->
                               camp_guild_bady:fire(photo_del, Id, 0),
                               NewPhoto0;
                           [H = #friend_zone_photo{id = DefN} | Rest] ->
                               case lists:keyfind(1,
                                                  #friend_zone_photo.default,
                                                  Rest)
                                   of
                                   #friend_zone_photo{} -> NewPhoto0;
                                   _ ->
                                       lists:keyreplace(DefN,
                                                        #friend_zone_photo.id,
                                                        NewPhoto0,
                                                        H#friend_zone_photo{default
                                                                                =
                                                                                1})
                               end
                       end,
            save(Z#friend_zone{photo = NewPhoto});
        _ -> ok
    end,
    {noreply, State};
handle_info({audit_photo, Id, N, Result}, State) ->
    Now = date:unixtime(),
    case fetch(friend_zone, Id) of
        [Z = #friend_zone{photo = Photo, name = _Name}] ->
            case lists:keyfind(N, #friend_zone_photo.id, Photo) of
                P = #friend_zone_photo{uploaded = Uploaded,
                                       default = OldDefault} ->
                    NewDefault = case Result of
                                     2 -> 0;
                                     _ -> OldDefault
                                 end,
                    NewPhoto0 = lists:keyreplace(N,
                                                 #friend_zone_photo.id,
                                                 Photo,
                                                 P#friend_zone_photo{auditing =
                                                                         Result,
                                                                     audited =
                                                                         Now,
                                                                     default =
                                                                         NewDefault}),
                    NewPhoto = case [A
                                     || A = #friend_zone_photo{auditing = 1}
                                            <- NewPhoto0]
                                   of
                                   [] ->
                                       camp_guild_bady:fire(photo_auditing,
                                                            Id,
                                                            #{photo => 0,
                                                              photo_auditing =>
                                                                  Result}),
                                       NewPhoto0;
                                   [H = #friend_zone_photo{id = DefN} | Rest] ->
                                       camp_guild_bady:fire(photo_auditing,
                                                            Id,
                                                            #{photo => Uploaded,
                                                              photo_auditing =>
                                                                  Result}),
                                       case lists:keyfind(1,
                                                          #friend_zone_photo.default,
                                                          Rest)
                                           of
                                           #friend_zone_photo{} -> NewPhoto0;
                                           _ ->
                                               lists:keyreplace(DefN,
                                                                #friend_zone_photo.id,
                                                                NewPhoto0,
                                                                H#friend_zone_photo{default
                                                                                        =
                                                                                        1})
                                       end
                               end,
                    save(Z#friend_zone{photo = NewPhoto});
                _ ->
                    logger:error("~ts找不到第~w张照片",
                                 [_Name, N],
                                 friend_zone,
                                 1008),
                    ok
            end;
        _ -> ok
    end,
    {noreply, State};
handle_info({rename, Id, Name, OldName}, State) ->
    case fetch(friend_zone, Id) of
        [Z = #friend_zone{}] ->
            save(Z#friend_zone{name = Name, name_used = OldName});
        _ -> ok
    end,
    {noreply, State};
handle_info({update, guild, Id, Guild}, State) ->
    case fetch(friend_zone, Id) of
        [Z = #friend_zone{}] ->
            save(Z#friend_zone{guild = Guild});
        _ -> ok
    end,
    {noreply, State};
handle_info({update, lover, Id, LoverName}, State) ->
    case fetch(friend_zone, Id) of
        [Z = #friend_zone{}] ->
            save(Z#friend_zone{lover_name = LoverName});
        _ -> ok
    end,
    {noreply, State};
handle_info({update, teacher, Id, TeacherName},
            State) ->
    case fetch(friend_zone, Id) of
        [Z = #friend_zone{}] ->
            save(Z#friend_zone{teacher_name = TeacherName});
        _ -> ok
    end,
    {noreply, State};
handle_info({update, honor, Id, HonorId}, State) ->
    case fetch(friend_zone, Id) of
        [Z = #friend_zone{}] ->
            save(Z#friend_zone{honor_id = HonorId});
        _ -> ok
    end,
    {noreply, State};
handle_info({update, pre_honor, Id, PreHonorId},
            State) ->
    case fetch(friend_zone, Id) of
        [Z = #friend_zone{}] ->
            save(Z#friend_zone{pre_honor_id = PreHonorId});
        _ -> ok
    end,
    {noreply, State};
handle_info({update, show_honor, {Id, ShowHonorId}},
            State) ->
    case fetch(friend_zone, Id) of
        [Z = #friend_zone{}] ->
            save(Z#friend_zone{show_honor = ShowHonorId});
        _ -> ok
    end,
    {noreply, State};
handle_info({update, sworn, Id, SwornName}, State) ->
    case fetch(friend_zone, Id) of
        [Z = #friend_zone{}] ->
            save(Z#friend_zone{sworn_name = SwornName});
        _ -> ok
    end,
    {noreply, State};
handle_info({update,
             #{id := Id, birth := Birth, constellation := Constell,
               abo := Abo, signature := Signature, sex := _Sex}},
            State) ->
    case fetch(friend_zone, Id) of
        [Z = #friend_zone{}] ->
            save(Z#friend_zone{birth = Birth,
                               constellation = Constell, abo = Abo,
                               signature = Signature});
        _ -> ok
    end,
    {noreply, State};
handle_info({update,
             #{id := Id, region := Region, city := City,
               is_shared_region := IsSharedRegion}},
            State) ->
    case fetch(friend_zone, Id) of
        [Z = #friend_zone{}] ->
            save(Z#friend_zone{region = Region, city = City,
                               is_shared_region = IsSharedRegion});
        _ -> ok
    end,
    {noreply, State};
handle_info({update, privacy, {Id, Privacy}}, State) ->
    case fetch(friend_zone, Id) of
        [Z = #friend_zone{}] ->
            save(Z#friend_zone{privacy = Privacy});
        _ -> ok
    end,
    {noreply, State};
handle_info({update, theme, {Id, ThemeId}}, State) ->
    case fetch(friend_zone, Id) of
        [Z = #friend_zone{}] ->
            save(Z#friend_zone{theme = ThemeId});
        _ -> ok
    end,
    {noreply, State};
handle_info({update, photo_frame, {Id, PhotoFrame}},
            State) ->
    case fetch(friend_zone, Id) of
        [Z = #friend_zone{}] ->
            save(Z#friend_zone{photo_frame = PhotoFrame});
        _ -> ok
    end,
    {noreply, State};
handle_info({update, zone_badge, {Id, Badges}},
            State) ->
    case fetch(friend_zone, Id) of
        [Z = #friend_zone{}] ->
            save(Z#friend_zone{badges = Badges});
        _ -> ok
    end,
    {noreply, State};
handle_info({update, classes, {Id, Classes}}, State) ->
    case fetch(friend_zone, Id) of
        [Z = #friend_zone{}] ->
            save(Z#friend_zone{classes = Classes});
        _ -> ok
    end,
    {noreply, State};
handle_info({update, privacy_zone, {Id, PrivacyZone}},
            State) ->
    case fetch(friend_zone, Id) of
        [Z = #friend_zone{}] ->
            save(Z#friend_zone{privacy_zone = PrivacyZone});
        _ -> ok
    end,
    {noreply, State};
handle_info({update,
             privacy_moments,
             {Id, PrivacyMoments}},
            State) ->
    case fetch(friend_zone, Id) of
        [Z = #friend_zone{}] ->
            save(Z#friend_zone{privacy_moments = PrivacyMoments});
        _ -> ok
    end,
    {noreply, State};
handle_info({deliver_trend, Id, TrendId}, State) ->
    case fetch(friend_zone, Id) of
        [Zs = #friend_zone{own_trends = Mine, fans = Fans,
                           own_trend_num = OwnTrendNum}] ->
            Mine1 = case length(Mine) >= 50 of
                        true ->
                            {NewL, DelL} = lists:split(50, [TrendId | Mine]),
                            logger:debug("要删除的 ~w", [DelL], friend_zone, 1170),
                            lists:foreach(fun (I) -> delete(friend_trend, I)
                                          end,
                                          DelL),
                            NewL;
                        _ -> [TrendId | Mine]
                    end,
            save(Zs#friend_zone{own_trends = Mine1,
                                own_trend_num = OwnTrendNum + 1}),
            role_trigger:async_fire(Id,
                                    [#evt_friend_zone_leave_trended{val =
                                                                        OwnTrendNum
                                                                            +
                                                                            1}]),
            deliver_trend(Fans, TrendId);
        _R ->
            logger:error("找不到空间 sender: ~w",
                         [Id],
                         friend_zone,
                         1179),
            ok
    end,
    {noreply, State};
handle_info({del_trend, Id, TrendId}, State) ->
    logger:debug("====~w====~w",
                 [Id, TrendId],
                 friend_zone,
                 1186),
    case fetch(friend_zone, Id) of
        [Zs = #friend_zone{own_trends = Mine, fans = Fans}] ->
            save(Zs#friend_zone{own_trends =
                                    lists:delete(TrendId, Mine)}),
            delete_trends(Fans, TrendId);
        _R ->
            logger:error("找不到空间 sender: ~w",
                         [Id],
                         friend_zone,
                         1192),
            ok
    end,
    {noreply, State};
handle_info({leave_trend,
             Id,
             ZoneId,
             TrendId,
             Pop,
             PNum},
            State) ->
    case {fetch(friend_zone, Id),
          fetch(friend_zone, ZoneId)}
        of
        {[Zs = #friend_zone{}],
         [Z = #friend_zone{own_trends = Mine, liked = Liked,
                           present_num = PresentNum,
                           own_trend_num = OwnTrendNum}]} ->
            Mine1 = case length(Mine) >= 50 of
                        true ->
                            {NewL, DelL} = lists:split(50, [TrendId | Mine]),
                            logger:debug("要删除的 ~w", [DelL], friend_zone, 1204),
                            lists:foreach(fun (I) -> delete(friend_trend, I)
                                          end,
                                          DelL),
                            NewL;
                        _ -> [TrendId | Mine]
                    end,
            Z1 = add_week_liked(Z#friend_zone{own_trends = Mine1,
                                              liked = Liked + Pop,
                                              present_num = PresentNum + PNum,
                                              own_trend_num = OwnTrendNum + 1},
                                date:unixtime(),
                                Pop),
            camp_guild_bady:fire(add_score, Z, Pop),
            role_trigger:async_fire(Id,
                                    [#evt_friend_zone_leave_trend{}]),
            role_trigger:async_fire(ZoneId,
                                    [#evt_friend_zone_liked{val = Liked + Pop},
                                     #evt_friend_zone_leave_trended{val =
                                                                        OwnTrendNum
                                                                            +
                                                                            1},
                                     #evt_friend_zone_like_baby{val = Pop}]),
            update_rank(Z1),
            add_cared(Zs, Z1, 1);
        {_,
         [Z = #friend_zone{own_trends = Mine, liked = Liked,
                           present_num = PresentNum,
                           own_trend_num = OwnTrendNum}]} ->
            Mine1 = case length(Mine) >= 50 of
                        true ->
                            {NewL, DelL} = lists:split(50, [TrendId | Mine]),
                            logger:debug("要删除的 ~w", [DelL], friend_zone, 1219),
                            lists:foreach(fun (I) -> delete(friend_trend, I)
                                          end,
                                          DelL),
                            NewL;
                        _ -> [TrendId | Mine]
                    end,
            Z1 = add_week_liked(Z#friend_zone{own_trends = Mine1,
                                              liked = Liked + Pop,
                                              present_num = PresentNum + PNum,
                                              own_trend_num = OwnTrendNum + 1},
                                date:unixtime(),
                                Pop),
            camp_guild_bady:fire(add_score, Z, Pop),
            role_trigger:async_fire(Id,
                                    [#evt_friend_zone_leave_trend{}]),
            role_trigger:async_fire(ZoneId,
                                    [#evt_friend_zone_liked{val = Liked + Pop},
                                     #evt_friend_zone_leave_trended{val =
                                                                        OwnTrendNum
                                                                            +
                                                                            1},
                                     #evt_friend_zone_like_baby{val = Pop}]),
            update_rank(Z1),
            save(Z1);
        _R ->
            logger:error("找不到空间 sender: ~w, target : ~w, trend: ~w",
                         [Id, ZoneId, TrendId],
                         friend_zone,
                         1231),
            ok
    end,
    {noreply, State};
handle_info({add_cared, Id, TargetId, Val}, State) ->
    add_cared(Id, TargetId, Val),
    {noreply, State};
handle_info({login,
             #{id := Id, sex := Sex, classes := Classes, now := Now,
               name_used := NameUsed, honor_id := HonorId,
               lover_name := LoverName, theme := ThemeId,
               badges := Badges, photo_frame := PhotoFrame,
               teacher_name := TeacherName, guild := GuildName,
               sworn_name := SwornName}},
            State) ->
    case fetch(friend_zone, Id) of
        [Z = #friend_zone{}] ->
            save(Z#friend_zone{online_time = Now, sex = Sex,
                               classes = Classes, name_used = NameUsed,
                               honor_id = HonorId, lover_name = LoverName,
                               theme = ThemeId, badges = Badges,
                               photo_frame = PhotoFrame,
                               teacher_name = TeacherName, guild = GuildName,
                               sworn_name = SwornName});
        _ -> ok
    end,
    {noreply, State};
handle_info({levup, Id, Lev}, State) ->
    case fetch(friend_zone, Id) of
        [Z = #friend_zone{}] -> save(Z#friend_zone{lev = Lev});
        _ -> ok
    end,
    {noreply, State};
handle_info(update_rank, State) ->
    Now = date:unixtime(),
    L = ets:tab2list(friend_zone_rank),
    NewL = util:keys_sort([#friend_zone_rank.liked], L),
    LastL = lists:sublist(NewL, 100),
    RankList = to_rank_list(LastL, 1, Now),
    rank_zone:cast(4,
                   {replace, 4, RankList, #{reward => 1}}),
    LW = [R
          || R = #friend_zone_rank_week{last_liked = Last}
                 <- ets:tab2list(friend_zone_rank_week),
             date:is_same_week(Now, Last)],
    NewLW = util:keys_sort([#friend_zone_rank_week.liked],
                           LW),
    LastLW = lists:sublist(NewLW, 100),
    RankListW = to_rank_list(LastLW, 1, Now),
    rank_zone:cast(39,
                   {replace, 39, RankListW, #{reward => 1}}),
    lists:foreach(fun (RW =
                           #friend_zone_rank_week{last_liked = LastLiked}) ->
                          case date:is_same_week(Now, LastLiked) of
                              false -> delete(RW);
                              _ -> ok
                          end
                  end,
                  LW),
    erlang:send_after(date:next_diff(23, 58, 1) * 1000,
                      self(),
                      update_rank),
    {noreply, State};
handle_info(_Info, State) ->
    logger:debug("未处理消息 ~w", [_Info], friend_zone, 1284),
    {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_list([]) -> [];
do_list([Id | T]) ->
    case fetch(friend_zone, Id) of
        [Z = #friend_zone{}] ->
            [to(friend_rank, Z) | do_list(T)];
        _ -> do_list(T)
    end.

get_photo_name(1) -> "/face.png";
get_photo_name(N) ->
    "/face" ++ integer_to_list(N) ++ ".png".

do_update(_Id, photo, {Num, _Content})
    when Num < 1 orelse Num > 3 ->
    {false, lang:get("只能上传3张图片哦")};
do_update(_Id, photo, {_Num, Content})
    when byte_size(Content) div 1024 >= 200 ->
    {false, lang:get("图片最大不能超过200k")};
do_update(#friend_zone{id = Id, photo = Photo}, photo,
          {Num, Content}) ->
    Now = date:unixtime(),
    case lists:keyfind(Num, #friend_zone_photo.id, Photo) of
        #friend_zone_photo{uploaded = Uploaded, auditing = 0}
            when Now - Uploaded < 1800 ->
            {false, lang:get("你上传的图片还在审核中")};
        _ ->
            friend_util:mkdir(Id),
            _Re = file:write_file(get_face_photo(Id, Num), Content),
            friend_zone ! {update, photo, Id, Num},
            role_trigger:async_fire(Id, [#evt_friend_zone_photo{}]),
            ok
    end;
do_update(Id, default_photo, N) ->
    friend_zone ! {update, default_photo, Id, N},
    ok;
do_update(Id, profile,
          {Birth, Constell, Abo, Signature, _Region, Sex}) ->
    Input = #{id => Id, birth => Birth,
              constellation => Constell, abo => Abo,
              signature => Signature, sex => Sex},
    case check_input(maps:to_list(Input)) of
        ok ->
            friend_zone ! {update, Input},
            ok;
        Else -> Else
    end;
do_update(Id, guild, Guild) ->
    friend_zone ! {update, guild, Id, Guild},
    ok;
do_update(Id, lover, LoverName) ->
    friend_zone ! {update, lover, Id, LoverName},
    ok;
do_update(Id, teacher, TeacherName) ->
    friend_zone ! {update, teacher, Id, TeacherName},
    ok;
do_update(Id, honor, HonorId) ->
    friend_zone ! {update, honor, Id, HonorId},
    ok;
do_update(Id, pre_honor, PreHonorId) ->
    friend_zone ! {update, pre_honor, Id, PreHonorId},
    ok;
do_update(Id, privacy, Privacy) ->
    friend_zone ! {update, privacy, {Id, Privacy}},
    ok;
do_update(Id, theme, ThemeId) ->
    friend_zone ! {update, theme, {Id, ThemeId}},
    ok;
do_update(Id, show_honor, HonorId) ->
    friend_zone ! {update, show_honor, {Id, HonorId}},
    ok;
do_update(Id, photo_frame, PhotoFrame) ->
    friend_zone ! {update, photo_frame, {Id, PhotoFrame}},
    ok;
do_update(Id, region, {Region, City, IsSharedRegion}) ->
    case is_list(Region) andalso is_list(City) of
        true ->
            friend_zone !
                {update,
                 #{id => Id, region => Region, city => City,
                   is_shared_region => IsSharedRegion}},
            friend_circle:update(#{id => Id, region => Region,
                                   city => City,
                                   is_shared_region => IsSharedRegion}),
            ok;
        _ -> ok
    end;
do_update(Id, classes, Classes) ->
    friend_zone ! {update, classes, {Id, Classes}},
    ok;
do_update(Id, sworn, Sworn) ->
    friend_zone ! {update, sworn, Id, Sworn},
    ok;
do_update(Id, zone_badge, Badges) ->
    friend_zone ! {update, zone_badge, {Id, Badges}},
    ok;
do_update(Id, privacy_zone, PrivacyZone) ->
    friend_zone ! {update, privacy_zone, {Id, PrivacyZone}},
    ok;
do_update(Id, privacy_moments, PrivacyMoments) ->
    friend_zone !
        {update, privacy_moments, {Id, PrivacyMoments}},
    friend_circle:update(#{id => Id,
                           privacy_moments => PrivacyMoments}),
    ok.

delete(#friend_trend{id = Id}) ->
    delete(friend_trend, Id);
delete(#friend_zone_rank{id = Id}) ->
    delete(friend_zone_rank, Id);
delete(#friend_zone_rank_week{id = Id}) ->
    delete(friend_zone_rank_week, Id).

delete(Tab, Id) ->
    ets:delete(Tab, Id),
    dets:delete(Tab, Id).

save(Data = #friend_trend{}) ->
    save(friend_trend, Data);
save(Data = #friend_zone{}) -> save(friend_zone, Data);
save(Data = #friend_zone_rank{}) ->
    save(friend_zone_rank, Data);
save(Data = #friend_zone_rank_week{}) ->
    save(friend_zone_rank_week, Data).

save(Tab, Data) ->
    ets:insert(Tab, Data),
    catch dets:insert(Tab, Data).

to(friend_visitor,
   #role{id = Id, name = Name, sex = Sex,
         classes = Classes}) ->
    #friend_visitor{id = Id, name = Name, sex = Sex,
                    classes = Classes};
to(friend_rank,
   #friend_zone{id = Id, name = Name, sex = Sex,
                classes = Classes, prize_num = PreNum, photo = Photo,
                liked = Liked}) ->
    PhotoId = case lists:keyfind(1,
                                 #friend_zone_photo.default,
                                 Photo)
                  of
                  #friend_zone_photo{auditing = 1, id = N} -> N;
                  _ -> 0
              end,
    #friend_zone_rank{id = Id, name = Name, sex = Sex,
                      classes = Classes, prize_num = PreNum, photo = PhotoId,
                      liked = Liked};
to(friend_rank_week,
   #friend_zone{id = Id, name = Name, sex = Sex,
                classes = Classes, prize_num = PreNum, photo = Photo,
                week_liked = Liked, last_liked = Last}) ->
    PhotoId = case lists:keyfind(1,
                                 #friend_zone_photo.default,
                                 Photo)
                  of
                  #friend_zone_photo{auditing = 1, id = N} -> N;
                  _ -> 0
              end,
    #friend_zone_rank_week{id = Id, name = Name, sex = Sex,
                           classes = Classes, prize_num = PreNum,
                           photo = PhotoId, liked = Liked, last_liked = Last};
to(friend_like,
   #role{id = Id, name = Name, sex = Sex,
         classes = Classes, lev = Lev}) ->
    #friend_like{id = Id, name = Name, sex = Sex,
                 classes = Classes, lev = Lev, time = date:unixtime()}.

update_rank(Z = #friend_zone{}) ->
    R = to(friend_rank, Z),
    RW = to(friend_rank_week, Z),
    save(R),
    save(RW),
    case ets:info(friend_zone_rank, size) > 100 of
        true ->
            Fun = fun (#friend_zone_rank{liked = I1},
                       #friend_zone_rank{liked = I2}) ->
                          I1 < I2
                  end,
            [Last | _] = lists:sort(Fun,
                                    ets:tab2list(friend_zone_rank)),
            delete(Last);
        _ -> ok
    end.

do_get_trends([]) -> [];
do_get_trends([Id | T]) ->
    case fetch(friend_trend, Id) of
        [Trend] -> [Trend | do_get_trends(T)];
        _ -> do_get_trends(T)
    end.

load_data() ->
    dets:to_ets(friend_zone_rank, friend_zone_rank),
    dets:to_ets(friend_zone_rank_week,
                friend_zone_rank_week),
    ok.

push(#role{pid = Pid}, Cmd, Data) ->
    push(Pid, Cmd, Data);
push(Pid, Cmd, Data) -> role:pack_send(Pid, Cmd, Data).

check_input([]) -> ok;
check_input([{birth, Birth} | T]) ->
    case re:run(Birth,
                "^(\\d{4}年)*\\d{1,2}月\\d{1,2}日$",
                [{capture, none}, unicode])
        of
        match -> check_input(T);
        _ -> {false, lang:get("生日格式不对")}
    end;
check_input([{signature, Signature} | T]) ->
    case util:check_text(Signature, 20, lang:get("签名")) of
        {false, Why} -> {false, Why};
        _ -> check_input(T)
    end;
check_input([_ | T]) -> check_input(T).

cover_privacy(Z = #friend_zone{privacy = 0}, _) -> Z;
cover_privacy(Z, true) -> Z;
cover_privacy(Z, _) ->
    Z#friend_zone{birth = "", region = "", abo = 0,
                  constellation = 0}.

add_cared(Z = #friend_zone{id = Me, subscribed = Subed,
                           name = Name, classes = Classes, sex = Sex},
          Zs = #friend_zone{id = Other, fans = Fans}, Val) ->
    case lists:keyfind(Other,
                       #friend_subscription.id,
                       Subed)
        of
        Sub = #friend_subscription{cared = Cared} ->
            Now = date:unixtime(),
            NewCared = min(200, Cared + Val),
            Fan = #friend_subscription{id = Me, name = Name,
                                       classes = Classes, sex = Sex,
                                       cared = NewCared, interacted = Now},
            save(Z#friend_zone{subscribed =
                                   lists:keystore(Other,
                                                  #friend_subscription.id,
                                                  Subed,
                                                  Sub#friend_subscription{cared
                                                                              =
                                                                              NewCared,
                                                                          interacted
                                                                              =
                                                                              Now})}),
            save(Zs#friend_zone{fans =
                                    lists:keystore(Me,
                                                   #friend_subscription.id,
                                                   Fans,
                                                   Fan)});
        _ ->
            save(Z),
            save(Zs),
            ok
    end;
add_cared(Me, Other, Val) ->
    case {fetch(friend_zone, Me), fetch(friend_zone, Other)}
        of
        {[Z = #friend_zone{}], [Zs = #friend_zone{}]} ->
            add_cared(Z, Zs, Val);
        _ -> ok
    end.

attach_likable([], _) -> [];
attach_likable([H = #friend_trend{rid = Id} | T], Id) ->
    [{0, H} | attach_likable(T, Id)];
attach_likable([H = #friend_trend{likes = Likes} | T],
               Id) ->
    case lists:member(Id, Likes) of
        true -> [{0, H} | attach_likable(T, Id)];
        _ -> [{1, H} | attach_likable(T, Id)]
    end.

deliver_trend([], _) -> ok;
deliver_trend([#friend_subscription{id = Id} | T],
              Tid) ->
    case fetch(friend_zone, Id) of
        [Z = #friend_zone{subscribed_trends = Subs}] ->
            save(Z#friend_zone{subscribed_trends =
                                   lists:sublist([Tid | Subs], 50)}),
            deliver_trend(T, Tid);
        _ -> deliver_trend(T, Tid)
    end.

delete_trends([], _) -> ok;
delete_trends([#friend_subscription{id = Id} | T],
              Tid) ->
    case fetch(friend_zone, Id) of
        [Z = #friend_zone{subscribed_trends = Subs}] ->
            save(Z#friend_zone{subscribed_trends =
                                   lists:delete(Tid, Subs)}),
            delete_trends(T, Tid);
        _ -> delete_trends(T, Tid)
    end.

to_rank_list(LastL, Num, Now) ->
    to_rank_list(LastL, Num, Now, []).

to_rank_list([], _Num, _Now, RankList) ->
    lists:reverse(RankList);
to_rank_list([#friend_zone_rank{id =
                                    {RoleId, Platform, ZoneId},
                                name = Name, sex = Sex, classes = Classes,
                                liked = Cup}
              | T],
             Num, Now, RankList) ->
    RankRc = #rank_rc{id = {RoleId, Platform, ZoneId},
                      role_id = RoleId, platform = Platform, zone_id = ZoneId,
                      name = Name, sex = Sex, classes = Classes,
                      time = date:unixtime(), val1 = Cup},
    to_rank_list(T, Num + 1, Now, [RankRc | RankList]);
to_rank_list([#friend_zone_rank_week{id =
                                         {RoleId, Platform, ZoneId},
                                     name = Name, sex = Sex, classes = Classes,
                                     liked = Cup}
              | T],
             Num, Now, RankList) ->
    RankRc = #rank_rc{id = {RoleId, Platform, ZoneId},
                      role_id = RoleId, platform = Platform, zone_id = ZoneId,
                      name = Name, sex = Sex, classes = Classes,
                      time = date:unixtime(), val1 = Cup},
    to_rank_list(T, Num + 1, Now, [RankRc | RankList]).

update_likes(Likes, Like = #friend_like{id = Id}) ->
    Likes1 = lists:keystore(Id,
                            #friend_like.id,
                            Likes,
                            Like),
    Fun = fun (#friend_like{time = T1},
               #friend_like{time = T2}) ->
                  T1 > T2
          end,
    lists:sublist(lists:sort(Fun, Likes1), 50).

add_week_liked(Z = #friend_zone{}, _Now, 0) -> Z;
add_week_liked(Z = #friend_zone{week_liked = WeekLiked,
                                last_liked = LastLiked},
               Now, AddVal) ->
    case date:is_same_week(LastLiked, Now) of
        true ->
            Z#friend_zone{week_liked = WeekLiked + AddVal,
                          last_liked = Now};
        _ ->
            Z#friend_zone{week_liked = AddVal, last_liked = Now}
    end.

do_get_photo(_, _, []) -> [];
do_get_photo(Id, Id,
             [#friend_zone_photo{id = N, auditing = Auditing = 0,
                                 default = Default, uploaded = Uploaded}
              | T]) ->
    case file:read_file(get_face_photo(Id, N)) of
        {ok, Bin} ->
            [{N, Bin, Auditing, Default, Uploaded}
             | do_get_photo(Id, Id, T)];
        _Else -> do_get_photo(Id, Id, T)
    end;
do_get_photo(MyId, Id,
             [#friend_zone_photo{id = N, auditing = Auditing = 1,
                                 default = Default, uploaded = Uploaded}
              | T]) ->
    case file:read_file(get_face_photo(Id, N)) of
        {ok, Bin} ->
            [{N, Bin, Auditing, Default, Uploaded}
             | do_get_photo(MyId, Id, T)];
        _Else -> do_get_photo(MyId, Id, T)
    end;
do_get_photo(MyId, Id, [_ | T]) ->
    do_get_photo(MyId, Id, T).

do_get_default_photo(_, []) -> [];
do_get_default_photo(Id,
                     [#friend_zone_photo{id = N, auditing = 1, default = 1}
                      | T]) ->
    case file:read_file(get_face_photo(Id, N)) of
        {ok, Bin} -> [{N, Bin}];
        _Else -> do_get_default_photo(Id, T)
    end;
do_get_default_photo(Id, [_ | T]) ->
    do_get_default_photo(Id, T).

get_face_photo(Id, N) ->
    friend_util:personal_dir(Id) ++ get_photo_name(N).

update_photo_log() ->
    Fun = fun (#friend_zone{id = RoleId, name = Name,
                            classes = Classes, lev = Lev, photo = PhotoList},
               _) ->
                  [case both of
                       both ->
                           case catch log_old:photo(RoleId,
                                                    Name,
                                                    Classes,
                                                    Lev,
                                                    "上传",
                                                    PhotoId)
                               of
                               _Err = {'EXIT', _} ->
                                   logger:error("日志记录时出错:~w",
                                                [_Err],
                                                friend_zone,
                                                1625),
                                   ok;
                               _ -> ok
                           end;
                       _ -> skip
                   end
                   || #friend_zone_photo{id = PhotoId, auditing = 0}
                          <- PhotoList]
          end,
    ets:foldl(Fun, ok, friend_zone).

