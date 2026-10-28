-file("src/mod/tournament/tournament_role.erl", 1).

-module(tournament_role).

-export([join/1,
         init/0,
         ready/1,
         ready_to_follow/1,
         quit/1,
         login/1,
         logout/1,
         reset/2,
         chat/3,
         change_form/2,
         handover/2,
         usurp/1,
         vote_usurper/2,
         change_order/3,
         get_advance_reward/1,
         get_rank_lev/1,
         like/2,
         report/3,
         post_resut/3,
         replay_result/2,
         rand_watch/1,
         push/2,
         callback/2,
         evt_callback/2,
         get_result_role/1,
         local_result_role/1,
         guard_open/3,
         get_badgeinfo/1,
         push_badgeinfo/1,
         promote/2,
         use_badge/2,
         group_login/0]).

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

-file("src/mod/tournament/tournament_role.erl", 44).

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

-file("src/mod/tournament/tournament_role.erl", 45).

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

-file("src/mod/tournament/tournament_role.erl", 46).

-file("inc/team.hrl", 1).

-record(team,
        {ver = 0,
         pid :: undefined | pid(),
         leader,
         members = [] :: list(),
         applys = [],
         pos :: undefined | tuple(),
         member_num = 1,
         status = 0,
         matched = 0 :: non_neg_integer(),
         is_fly = 0 :: 0 | 1,
         order = [],
         team_formation = 1,
         team_formation_lev = 1,
         usurpers = [],
         type = 0,
         lev_flag = 0,
         lev_min = 0,
         lev_max = 0,
         last_join_time = 0,
         combat_num = 0,
         chat_recruit_info = [],
         target = 0,
         cross_type = 0,
         dun_id = 0}).

-record(m_team,
        {ver = 0,
         pid :: undefined | pid(),
         status = 3 :: non_neg_integer(),
         applys = [],
         mod = 0,
         speed = 0,
         recruitment_time = 0,
         recruitment_ids = lists:seq(1, 5),
         recruitment = [],
         member_num = 0}).

-record(team_mate,
        {ver = 0,
         id = {0, "", 0},
         name = "",
         pid :: undefined | pid(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         status = 3 :: non_neg_integer(),
         looks = [] :: list(),
         fc = 0 :: non_neg_integer(),
         expect_type = [] :: non_neg_integer(),
         s_ride = 0,
         team_pid :: undefined | pid(),
         matched = 0 :: non_neg_integer(),
         formation_id = 1,
         formation_lev = 1,
         mod = 0,
         speed = 0,
         join_type = 1,
         join_sub_type = 0,
         join_time = 0,
         combat_num = 0,
         constellation_lev = 0,
         lover_id = {0, "", 0},
         lover_name = "",
         lover_status = 0,
         quest_couple_round = 0}).

-record(team_recruitment,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         pid,
         type = 0,
         status = 1,
         member_num = 1,
         inviter_status = 0,
         lev_min = 0,
         lev_max = 0,
         matched = 0 :: non_neg_integer(),
         notice_list = [] :: list(),
         cur_classes = [] :: list(),
         constellation_lev = 0,
         chat_recruit_info = [],
         lover_id = {0, "", 0},
         lover_name = "",
         lover_status = 0,
         quest_couple_round = 0,
         precision_notice_list = [] :: list(),
         cross_type = 0}).

-record(team_recruit_room,
        {lev = 0, role_num = 0, members = []}).

-record(team_usurper,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         leader_objected = 0 :: 0 | 1,
         total = 0 :: integer(),
         pros = 0 :: integer(),
         cons = 0 :: integer(),
         time = 0 :: integer(),
         voted_ids = []}).

-record(team_recruit_lev_range,
        {flag = 0, lev = 0, val1 = 0, val2 = 0}).

-record(team_start_args, {pos, is_fly = 0, target = 0}).

-file("src/mod/tournament/tournament_role.erl", 47).

-file("inc/attr.hrl", 1).

-record(attr_base,
        {type = 0 :: non_neg_integer(),
         name = 0 :: pos_integer(),
         flag = 0 :: non_neg_integer(),
         calc_type = 0 :: non_neg_integer(),
         val = 0 :: non_neg_integer()}).

-record(attr,
        {ver = 3,
         fc = 0 :: non_neg_integer(),
         speed = 260 :: pos_integer(),
         hp_max = 0 :: non_neg_integer(),
         mp_max = 0 :: non_neg_integer(),
         atk_speed = 0 :: non_neg_integer(),
         phy_dmg = 0 :: non_neg_integer(),
         magic_dmg = 0 :: non_neg_integer(),
         phy_def = 0 :: non_neg_integer(),
         magic_def = 0 :: non_neg_integer(),
         crit = 0 :: non_neg_integer(),
         tenacity = 0 :: non_neg_integer(),
         accuracy = 0 :: non_neg_integer(),
         evasion = 0 :: non_neg_integer(),
         holy_dmg = 0 :: non_neg_integer(),
         crit_dmg = 0 :: non_neg_integer(),
         crit_dmg_def = 0 :: non_neg_integer(),
         dmg_ratio = 0 :: non_neg_integer(),
         def_ratio = 0 :: non_neg_integer(),
         enhance_control = 0 :: non_neg_integer(),
         anti_control = 0 :: non_neg_integer(),
         escape = 0 :: non_neg_integer(),
         anti_escape = 0 :: non_neg_integer(),
         capture = 0 :: non_neg_integer(),
         phy_def_ratio = 0 :: non_neg_integer(),
         magic_def_ratio = 0 :: non_neg_integer(),
         phy_accuracy = 0 :: non_neg_integer(),
         magic_accuracy = 0 :: non_neg_integer(),
         phy_evasion = 0 :: non_neg_integer(),
         magic_evasion = 0 :: non_neg_integer(),
         phy_crit = 0 :: non_neg_integer(),
         magic_crit = 0 :: non_neg_integer(),
         phy_tenacity = 0 :: non_neg_integer(),
         magic_tenacity = 0 :: non_neg_integer(),
         heal_val = 0 :: non_neg_integer(),
         heal_ratio = 0 :: non_neg_integer(),
         eff_heal_ratio = 0 :: non_neg_integer(),
         phy_dmg_ratio = 0 :: non_neg_integer(),
         magic_dmg_ratio = 0 :: non_neg_integer(),
         strength = 0,
         constitution = 0,
         magic = 0,
         agility = 0,
         endurance = 0,
         exp_ratio = 0}).

-record(attr_calc,
        {attr :: undefined | #attr{},
         attr_no_ratio :: undefined | #attr{},
         ratio :: undefined | #attr{},
         attr_no_fc :: undefined | #attr{},
         ratio_no_fc :: undefined | #attr{}}).

-record(m_attr_point,
        {ver = 2,
         ext_point = [],
         first_free = 0,
         valid_plan = 1,
         plan_data = [],
         change_plan_times = 0}).

-record(attr_point_plan,
        {index = 1 :: pos_integer(),
         plan_name = [],
         strength = 0 :: pos_integer(),
         constitution = 0 :: non_neg_integer(),
         magic = 0 :: non_neg_integer(),
         agility = 0 :: non_neg_integer(),
         endurance = 0 :: non_neg_integer(),
         pre_str = 0,
         pre_con = 0,
         pre_magic = 0,
         pre_agi = 0,
         pre_end = 0}).

-file("src/mod/tournament/tournament_role.erl", 48).

-file("inc/combat.hrl", 1).

-record(combat,
        {type :: undefined | non_neg_integer(),
         pid :: undefined | pid(),
         result :: undefined | integer(),
         round = 1 :: non_neg_integer(),
         start_args :: undefined | tuple(),
         observers = [],
         winner = [],
         loser = [],
         atk_formation = 1,
         atk_formation_lev = 1,
         dfd_formation = 1,
         dfd_formation_lev = 1,
         waiting_join = [],
         cur_plot = 0,
         waiting_next_wave = [] :: [tuple()],
         all_waiting_next_wave = [],
         ts,
         start_time = 0 :: non_neg_integer(),
         t_play = 0 :: integer(),
         t_idle = 500 :: integer(),
         assign_gains = [],
         ratio_val = 0,
         start_failed_reason :: undefined | atom()}).

-record(fighter,
        {id = 0 :: non_neg_integer(),
         pid = 0 :: non_neg_integer() | pid(),
         type = 1,
         name = "",
         group = 0,
         classes = 0,
         sex = 0,
         face_id = 0,
         hp = 0,
         mp = 0,
         hp_max = 0,
         tmp_hp_max = 0,
         mp_max = 0,
         lev = 0,
         looks = [],
         is_die = 0,
         is_die_disappear = 0,
         is_escape = 0,
         is_defence = 0,
         is_radiance = 0,
         is_leader = 0,
         self_preside_status = 0,
         self_preside_text = "",
         target_preside_status = 0,
         target_preside_text = "",
         rid = 0,
         platform = "",
         zone_id = 0,
         origin_id,
         base_id = 0 :: non_neg_integer(),
         lover,
         res_id = 0,
         active_skills = [],
         passive_skills = [],
         halo_skills = [],
         has_use_item = 0,
         buffs = [],
         buff_infos = [],
         skill_cooldown = [],
         skill_infos = [],
         pet_skill_infos = [],
         child_skill_infos = [],
         last_skill = 0,
         attr,
         combat_init_attr,
         combat_dynamic_attr,
         pet_attr,
         m_init,
         action_num = 0,
         formation = 1,
         formation_lev = 1,
         pos = 0,
         order = 0,
         combat_statistics,
         result = 3,
         is_ai_action = 0,
         pre_action,
         action,
         talk = "",
         special_status,
         special_attr,
         s_event = 0,
         s_event_pid,
         active_pet,
         backup_pets = [],
         active_child,
         backup_childs = [],
         has_summon_pet = 0,
         active_guard = [],
         team_guard = [],
         is_hosted = 0,
         is_ready = 0,
         is_auto = 0,
         is_double_point = 0,
         plot = {id, [], []},
         max_catch_num = 0,
         catched = [],
         learn_skills = [],
         m_dungeon,
         anti_heal = 0,
         anger = 0,
         skill_prac_atk = 0,
         skill_prac_phy_def = 0,
         skill_prac_magic_def = 0,
         m_lev_break,
         sworn_id,
         dun_args,
         ext_args = [],
         talisman = [],
         master_pid = 0,
         master_fid = 0,
         master_pos = 0,
         combat_talk = [],
         guard_pid = 0,
         guard_fid = 0,
         guard_pos = 0,
         cost_mp_ratio = 1000,
         slave = [],
         unit_type = 0,
         ratio_val = 0,
         unit_fun_type = 0,
         ai_id = 0,
         ai = {[], []},
         ext = [],
         skill_plan = [],
         hook_index = 1,
         force_is_auto = 0}).

-record(combat_start_args,
        {common_referee :: undefined | pid(),
         other_referees = [] :: [{atom(), pid()}],
         ext_args = [] :: [{atom(), term()}],
         max_guard = 4}).

-record(combat_over_calc_data,
        {fighter :: undefined | tuple(),
         combat_result :: undefined | non_neg_integer(),
         rewards = [] :: [tuple()],
         record :: undefined | tuple()}).

-record(c_observer,
        {role_id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         pid :: undefined | pid(),
         name = "" :: list(),
         group = 0}).

-record(m_combat,
        {ver = 3 :: pos_integer(),
         pid :: undefined | pid(),
         observe_pid :: undefined | pid(),
         is_debug = 0 :: 0..1,
         ext = [] :: [tuple()],
         self_preside = [],
         target_preside = [],
         combat_type = 0}).

-record(m_combat_init,
        {skills = [] ::
             [{non_neg_integer(), non_neg_integer()}],
         talents = [],
         wing_skills = [],
         eff_skills = [],
         guard_skills = []}).

-record(fighter_wrap,
        {fighter,
         combat_pid = 0,
         s_event,
         m_team,
         status,
         s_action,
         pos :: undefined | tuple(),
         combat_type = 0}).

-record(c_item,
        {item_id,
         base_id :: undefined | non_neg_integer(),
         step = 0,
         target_type :: undefined | non_neg_integer(),
         skill_id = 0,
         skill_lev = 0,
         script_id :: undefined | non_neg_integer(),
         script_args = [] :: [integer()],
         buff_self = [],
         buff_target = [],
         anti_heal = 0,
         can_effect = 0,
         action :: undefined | function()}).

-record(c_skill,
        {id = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         passive_type = [] :: non_neg_integer(),
         act_flag = undefined,
         type_flag = undefined,
         use_type = {live, live},
         special_type = [],
         skill :: undefined | tuple(),
         action_no = 1 :: non_neg_integer(),
         target_no = 1 :: non_neg_integer(),
         keep_kill_num = 0 :: non_neg_integer(),
         action :: undefined | {atom(), list()},
         ext_args = [] :: [{atom(), non_neg_integer()}],
         trigger_before = [] ::
             [{{atom(), atom()}, [integer()]}],
         trigger_after = [] :: [{{atom(), atom()}, [integer()]}],
         reduce_dmg = 1000,
         reduce_heal = 1000,
         action_msg = "",
         pursue_attack = 0,
         pursue_skill_attack = 0,
         passive_args,
         variety_base}).

-record(c_buff_base,
        {id,
         eff_type = buff :: buff | debuff,
         type = 1,
         max_layer = 1,
         script_id = 0}).

-record(c_buff,
        {id :: undefined | non_neg_integer(),
         type,
         sec_type,
         layer = 1,
         script_id,
         caster_id :: undefined | non_neg_integer(),
         action_num = 0 :: non_neg_integer(),
         eff_type = buff :: buff | debuff,
         eff_sec_type = normal :: normal | control,
         hit_rate = 1000 :: non_neg_integer(),
         can_dispel = 1 :: 0..1,
         visible = 1 :: 0..1,
         time_unit = 0 :: non_neg_integer(),
         duration = 0 :: non_neg_integer(),
         duration_left = 0 :: non_neg_integer(),
         period = 1 :: non_neg_integer(),
         args = [],
         eff_val_before :: undefined | function(),
         eff_val_after :: undefined | function(),
         eff_before :: undefined | function(),
         eff :: undefined | function(),
         recalc :: undefined | function(),
         eff_after :: undefined | function(),
         compare :: undefined | function(),
         tips_calc :: undefined | function(),
         hit :: undefined | function(),
         can_eff :: undefined | function(),
         die_eff = 0,
         halo_eff_fighter_type = [] :: list()}).

-record(combat_statistics,
        {total_hurt = 0 :: non_neg_integer(),
         total_dmg = 0 :: non_neg_integer(),
         round_dmg = 0 :: non_neg_integer(),
         max_dmg = 0 :: non_neg_integer(),
         revive = 0,
         pet_revive = 0,
         cast_pet = 0,
         guard = [],
         has_use_item = 0,
         total_heal = 0,
         control_num = 0,
         dispel_num = 0,
         is_die = 0,
         kill_group = 0,
         killed_group = 0,
         kill_group_pet = 0,
         kill_group_target = 0,
         killed_group_target = 0,
         kill_group_target_pet = 0,
         child_skills = [],
         die_times = 0,
         skill_use_times = [],
         after_die_done = 0,
         auto_round = []}).

-record(combat_context,
        {type :: undefined | non_neg_integer(),
         start_time = 0 :: integer(),
         round = 0,
         pos_num = 0 :: integer(),
         origin_atk = [],
         origin_dfd = [],
         playing = [],
         self_side = [],
         op_side = [],
         skill_cooldown = [],
         all_waiting_next_wave = [] :: [list()],
         passive_attack = [] :: [],
         passive_skill_attack = [],
         pursue_attack = false,
         pursue_skill_attack = false,
         pursue_attack_list = [],
         revive_self = [],
         nirvana_list = [],
         ghost_list = [],
         revive_list = [],
         kill_by_self_list = [],
         avatar_list = [],
         mate_suck_list = [],
         skill_hurt = false :: true | false,
         skill_pursue_crit = false :: true | false,
         kill_someone = false :: true | false,
         skill_crit = false :: true | false,
         skill_dmg = 0,
         action_dmg = 0,
         multi_pursue_num = 0,
         link_hurt = [],
         is_passive_attack = false,
         revive_count = 0,
         is_skill_range = false,
         fisrt_target_id = 0,
         round_die = [],
         common_cooldown = []}).

-record(passive_effect,
        {atk_addt = 0 :: non_neg_integer(),
         atk_ratio = 0 :: non_neg_integer(),
         atk_holy_addt = 0 :: non_neg_integer(),
         buff_holy_addt = 0,
         atk_holy_ratio = 0 :: non_neg_integer(),
         dmg_addt = 0 :: non_neg_integer(),
         phy_dmg_dec = 0,
         magic_dmg_dec = 0,
         dmg_ext = 0,
         dmg_ratio = 0 :: non_neg_integer(),
         dmg_ratio_add = 0,
         def_ratio = 0 :: non_neg_integer(),
         hurt_multi = 0,
         suck_hp = 0,
         kill_suck_hp = 0,
         stone_suck_hp,
         suck_mp = 0,
         suck_mp_loss = 0,
         suck_mp_max = 0,
         master_suck_hp,
         feedback = 0,
         heal_ratio = 0,
         anti_skill,
         def_anti = 0,
         crit_ratio = 0,
         hit_ratio = 0,
         dec_def_ratio = 0,
         dec_phy_def = 0,
         dec_magic_def = 0,
         dec_phy_def_ratio = 0,
         dec_magic_def_ratio = 0,
         float_dmg = 0,
         ghost_atk = 0,
         phy_dmg_ratio = 0,
         defence = 0,
         magic_dmg_ratio = 0,
         revive_self_atk = 0,
         dec_dmg_flag = 0,
         self_val_changed = [],
         self_changed = [],
         target_val_changed = [],
         target_changed = [],
         buff_self_to_self = [] :: [tuple()],
         buff_self_to_target = [] :: [tuple()],
         buff_target_to_self = [] :: [tuple()],
         buff_target_to_target = [] :: [tuple()],
         del_target_buff = [],
         show_passive_skills = [] ::
             [{non_neg_integer(),
               non_neg_integer(),
               non_neg_integer()}],
         talents = [],
         pet_effect = [],
         conflict_list = [],
         ext_args = [],
         flag = 0,
         injury_ratio = 0,
         tar_ignore_die_ratio = 0,
         target_def_add_buff = [],
         phy_crit_extra_dmg = 0,
         mag_crit_extra_dmg = 0}).

-record(combat_init_attr,
        {dmg_ratio = 0,
         hurt_ratio = 0,
         magic_hurt_ratio = 0,
         crit_dmg_ratio = 0,
         crit_hurt_ratio = 0,
         heal_ratio = 0 :: non_neg_integer(),
         eff_heal_ratio = 0 :: non_neg_integer(),
         item_effect_ratio = 0,
         eff_item_effect_ratio = 0,
         can_be_crit = 1,
         anti_poison = 0,
         phy_dmg_ratio = 0,
         magic_dmg_ratio = 0,
         def_anger_ratio = 0,
         use_anger_ratio = 1000,
         debuff_buff_expire_ratio = {0, 0, 0},
         dec_ghost_ratio = 0,
         heal_crit_ratio = 0,
         eff_revive_ratio = 0,
         eff_heal_val = 0,
         add_chaos_ratio = 0,
         sworn_protect,
         anti_crit_ratio = 0,
         atk_not_anger = 0,
         hit_ratio = 0,
         phy_crit_extra_dmg = 0,
         mag_crit_extra_dmg = 0}).

-record(combat_dynamic_attr,
        {dmg_ratio = 0,
         hurt_ratio = 0,
         phy_hurt_ratio = 0,
         magic_hurt_ratio = 0,
         phy_final_hurt_ratio = 0,
         magic_final_hurt_ratio = 0,
         crit_dmg_ratio = 0,
         crit_hurt_ratio = 0,
         buff_reduce_dmg = 0,
         heal_ratio = 0 :: non_neg_integer(),
         eff_heal_ratio = 0 :: non_neg_integer(),
         eff_heal_val = 0,
         feedback = 0,
         reduce_dmg = 0,
         stone_reduce_dmg = 0,
         accuracy = 0,
         phy_accuracy = 0,
         magic_accuracy = 0,
         evasion = 0,
         phy_evasion = 0,
         magic_evasion = 0,
         phy_dmg_ratio = 0,
         magic_dmg_ratio = 0,
         can_attack_stealth = 0,
         buff_reduce_dmg_max = 0,
         mirror_feedback_rate = 0}).

-record(special_attr,
        {absorb_shield = 0,
         absorb_shield_type = 0,
         absorb_order = 0,
         absorb_shield_suck = 0,
         absorb_dmg = 0,
         magic_absorb_dmg = 0,
         model_order = 0,
         immunity = 0,
         has_immunity = 0,
         pre_action,
         next_action_stay = 0,
         reduce_self_phy_dmg = 0,
         reduce_phy_dmg = 0,
         anti_control_ratio = 0,
         can_feedback = 1,
         fixed_feedback = 0,
         can_anti_attack = 1,
         can_revive_self = 1,
         model_id = 0,
         model_val = 0,
         fixed_dmg = 0,
         anti_ratio = 0,
         anti_times = 0,
         anti_skill = base,
         anti_dmg_ratio = 0,
         protector = undefined,
         has_nirvana = 0,
         nirvaning = 0,
         has_ghost = 0,
         ghosting = 0,
         reviving = 0,
         has_revive_self = 0,
         anti_trial = 0,
         can_attack_stealth = 0,
         control_num = 0,
         has_fearless = 0,
         add_phy_layer = 0,
         last_dispel_phy_dmg_ratio = 0,
         last_eva_phy_dmg_ratio = 0,
         round_add_magic_dmg = 0,
         sleep_layer = 0,
         stone_layer = 0,
         is_sworn_protect = 0,
         is_sworn_heal = 0,
         chaos_ratio = 300,
         round_hurt = 0,
         dec_dmg,
         multi_atk_num = 0,
         has_multi_atk = 0,
         assist_atk_ratio = 0,
         assist_atk_skill = base,
         assist_atk_hurt_ratio = 1000,
         suck_hp = 0,
         suck_times = 1,
         rebound_times = 0,
         rebound_dmg_ratio = 0,
         trap_owener = 0,
         trap_buff = [],
         trap_ratio = 0,
         be_dmg_mp_times = 0,
         flush_pet_times = 0,
         save_life_times = 0,
         elem_dmg_absorb = 0,
         wheel_dmg = 0,
         wheel_skill = 0,
         be_attack_times = undefined,
         first_target_id = 0,
         rebound_type = 1,
         iron_body_times = 0,
         hp_link = 0}).

-record(special_status,
        {is_weakness = 0,
         is_seal = 0,
         is_silent = 0 :: 0..1,
         is_rest = 0,
         is_stealth = 0,
         cannot_use_skill = 0,
         is_taunt = 0 :: 0..1,
         is_chaos = 0,
         chaos_skill = 0,
         is_stun = 0,
         is_sleep = 0,
         is_stone = 0,
         is_anti_heal = 0,
         can_crit = 1,
         cannot_revive = 0,
         taunt_pid = undefined,
         soul_link = undefined,
         buff_revive_self = undefined,
         lover_revive_self = undefined,
         dec_taunt_dmg_ratio = 0,
         can_use_anger_skill = 1,
         bleed = 0,
         energy = 0,
         modify_script = [],
         is_tempt = 0,
         tempt_ratio = 0,
         tempt_dmg = 0,
         be_attack_skills = []}).

-record(buff_play,
        {order = 0 :: non_neg_integer(),
         sub_order = 0 :: non_neg_integer(),
         action_type :: undefined | non_neg_integer(),
         buff_id :: undefined | non_neg_integer(),
         layer = 1 :: pos_integer(),
         time_unit = 1 :: non_neg_integer(),
         duration = 0 :: non_neg_integer(),
         duration_left = 0 :: non_neg_integer(),
         is_hit = 1 :: 0..1,
         can_dispel = 1 :: 0..1,
         caster_id = 0 :: non_neg_integer(),
         target_id = 0 :: non_neg_integer(),
         skill_fid = 0 :: non_neg_integer(),
         target_changes = [] :: [{non_neg_integer(), integer()}],
         is_target_die = 0 :: 0..1,
         is_target_die_disappear = 0 :: 0..1,
         tips_args = [] :: [integer()]}).

-record(summon_play,
        {order = 0 :: non_neg_integer(),
         sub_order = 0 :: non_neg_integer(),
         summon_type :: undefined | non_neg_integer(),
         summoner_id :: undefined | non_neg_integer(),
         summons = [] :: [tuple()]}).

-record(skill_play,
        {order = 0 :: non_neg_integer(),
         sub_order = 0 :: non_neg_integer(),
         action_type :: undefined | non_neg_integer(),
         skill_id = 0 :: non_neg_integer(),
         skill_lev = 1 :: non_neg_integer(),
         attack_type :: undefined | non_neg_integer(),
         self_id = 0 :: non_neg_integer(),
         self_type = 0,
         self_classes = 0,
         self_origin_id = 0,
         self_res_id = 0,
         target_id = 0 :: non_neg_integer(),
         self_changes = [] :: [{non_neg_integer(), integer()}],
         target_changes = [] :: [{non_neg_integer(), integer()}],
         show_passive_skills = [] ::
             [{non_neg_integer(),
               non_neg_integer(),
               non_neg_integer()}],
         is_hit = 1 :: 0..1,
         is_defence = 0 :: 0..1,
         is_crit = 0 :: 0..1,
         is_self_die = 0 :: 0..1,
         is_self_die_disappear = 0 :: 0..1,
         is_target_die = 0 :: 0..1,
         is_target_die_disappear = 0 :: 0..1,
         talk = "" :: list(),
         action_msg = ""}).

-record(c_pet,
        {id = 0,
         ver = 6,
         base_id = 0,
         can_summon = 1,
         status = 0,
         name = "",
         lev = 0,
         looks = [],
         skills = [],
         hp = 1,
         mp = 1,
         attr,
         combat_talk = [],
         talent = 0,
         pet_attr,
         grade = 0,
         skill_plan = [],
         is_first = 0}).

-record(c_guard,
        {base_id = 0,
         war_id = 0,
         name = "",
         classes = 0,
         skills = [],
         attr,
         looks = []}).

-record(c_child,
        {id = 0,
         origin_id,
         ver = 1,
         base_id = 0,
         grade = 0,
         status = 0,
         can_summon = 1,
         name = "",
         classes = 0,
         lev = 0,
         looks = [],
         skills = [],
         hp = 1,
         mp = 1,
         attr,
         combat_talk = [],
         hungry = 0}).

-record(c_skill_addt_arg,
        {self_val_changed = [] :: [{atom(), integer()}],
         self_changed = [] :: [{non_neg_integer(), integer()}],
         target_val_changed = [] :: [{atom(), integer()}],
         target_changed = [] :: [{non_neg_integer(), integer()}],
         self_buff = [] :: [tuple()],
         target_buff = [] :: [tuple()],
         show_passive_skills = [] :: [tuple()],
         ext_args,
         skip_exec = 0,
         passive_flag,
         conflict_list = []}).

-record(action_effect,
        {can_crit = 1,
         can_feedback = 1,
         can_protect = 1,
         heal_hp = 0,
         can_anti_heal = 0,
         crit_flag = 0,
         holy_addt = 0,
         suck_hp = 0,
         mate_suck_hp = undefined,
         dec_def_ratio = 0,
         dec_magic_def_ratio = 0,
         default_atk = undefined,
         direct_dmg = undefined,
         calc_def = 0,
         hurt_multi = 1000,
         act_dmg = 0,
         hit_ratio = 0,
         crit_ratio = 0,
         crit_dmg_ratio = 0,
         act_dmg_ratio = 0,
         target_val_changes = [],
         target_changes = [],
         suck_buff,
         crit_suck_hp = 0,
         dmg_buff = [],
         injury_ratio = 0,
         extern_dmg = 0,
         act_hurt_multi = 0,
         alice_suck_max = 0}).

-record(combat_record_chat_mgr,
        {id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         break_times = 0,
         msg = "",
         report_cnt = 0}).

-record(combat_record,
        {id,
         type = 1,
         ver = 10,
         atk_name = "",
         dfd_name = "",
         combat_type = 0,
         time = 0,
         frames = [],
         cited = 0,
         likes = [],
         liked = 0,
         replayed = 0,
         round = 0,
         fighters = [],
         avg_lev = 0,
         shared = 0,
         atk_sex = 0,
         atk_classes = 0,
         dfd_sex = 0,
         dfd_classes = 0,
         screen_msg = []}).

-record(combat_record_role,
        {id = {0, "", 0}, recent = [], collection = []}).

-record(combat_record_marvelous,
        {id, combat_type = 0, time = 0}).

-record(combat_record_hot,
        {id,
         combat_type = 0,
         replayed = 0,
         shared = 0,
         liked = 0,
         time = 0}).

-record(combat_record_fighter,
        {id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         group = 0}).

-file("src/mod/tournament/tournament_role.erl", 49).

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

-file("src/mod/tournament/tournament_role.erl", 50).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/tournament/tournament_role.erl", 51).

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

-file("src/mod/tournament/tournament_role.erl", 52).

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

-file("src/mod/tournament/tournament_role.erl", 53).

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

-file("src/mod/tournament/tournament_role.erl", 54).

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

-file("src/mod/tournament/tournament_role.erl", 55).

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

-file("src/mod/tournament/tournament_role.erl", 56).

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

-file("src/mod/tournament/tournament_role.erl", 57).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/tournament/tournament_role.erl", 58).

-file("inc/tournament.hrl", 1).

-record(m_tournament,
        {ver = 3 :: non_neg_integer(),
         triggers = [] :: list(),
         status = 0 :: non_neg_integer(),
         rewarded = [] :: list(),
         pk_type = 0,
         kingbadgenum = 0,
         starlev = 0,
         kingbadge = [] :: list(),
         showbadge = 0}).

-record(tournament_profile,
        {id = {0, "", 0} :: tuple(),
         ver = 11 :: non_neg_integer(),
         name = "" :: string(),
         lev = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         rank_point = 0 :: non_neg_integer(),
         liked = 0 :: non_neg_integer(),
         liked_other = 0 :: non_neg_integer(),
         last_matched = 0 :: non_neg_integer(),
         day_matched = 0 :: non_neg_integer(),
         day_win = 0 :: non_neg_integer(),
         day_win_sustained = 0 :: non_neg_integer(),
         season_rank_lev = 1 :: non_neg_integer(),
         season_rank_point = 0 :: non_neg_integer(),
         combat_count = 0 :: non_neg_integer(),
         win_count = 0 :: non_neg_integer(),
         win_sustained = 0 :: non_neg_integer(),
         season_kill = 0 :: non_neg_integer(),
         season_reverse = 0 :: non_neg_integer(),
         season_revive = 0 :: non_neg_integer(),
         season_dmg = 0 :: non_neg_integer(),
         season_bearing_dmg = 0 :: non_neg_integer(),
         season_zero_dmg = 0 :: non_neg_integer(),
         season_pet_revive = 0 :: non_neg_integer(),
         best_rank_point = 0 :: non_neg_integer(),
         best_rank_lev = 1 :: non_neg_integer(),
         best_win_count = 0 :: non_neg_integer(),
         best_win_sustained = 0 :: non_neg_integer(),
         best_partner = [] :: list(),
         week_rank_lev = 1 :: non_neg_integer(),
         week_rank_point = 0 :: non_neg_integer(),
         awesome_kill = 0 :: non_neg_integer(),
         awesome_kill_num = 0 :: non_neg_integer(),
         awesome_dmg = 0 :: non_neg_integer(),
         awesome_heal = 0 :: non_neg_integer(),
         awesome_control = 0 :: non_neg_integer(),
         mvp = 0 :: non_neg_integer(),
         loss_mvp = 0 :: non_neg_integer(),
         season_awesome_kill = 0 :: non_neg_integer(),
         season_awesome_kill_num = 0 :: non_neg_integer(),
         season_awesome_dmg = 0 :: non_neg_integer(),
         season_awesome_heal = 0 :: non_neg_integer(),
         season_awesome_control = 0 :: non_neg_integer(),
         season_mvp = 0 :: non_neg_integer(),
         season_loss_mvp = 0 :: non_neg_integer(),
         consecutive_lost = 0 :: non_neg_integer(),
         reported = 0 :: non_neg_integer(),
         reported_other = 0 :: non_neg_integer(),
         reported_logs = [] :: list(),
         banned_date = 0 :: non_neg_integer(),
         reported_single_match = 0,
         is_auto_combat = 0,
         guards = [],
         historical_high = 0 :: non_neg_integer(),
         show_badge_id = 0 :: non_neg_integer(),
         promotion_win = 0 :: non_neg_integer(),
         upgrade_point = 0 :: non_neg_integer()}).

-record(tournament_role,
        {id = {0, "", 0} :: tuple(),
         status = 0 :: non_neg_integer(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         fc = 0 :: non_neg_integer(),
         looks = [] :: list(),
         times = 1 :: non_neg_integer(),
         point = 1 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         rank_point = 0 :: non_neg_integer(),
         pid :: undefined | pid() | 0,
         is_online = 0 :: 0 | 1,
         match_id = 0 :: non_neg_integer(),
         side = 0 :: non_neg_integer(),
         is_leader = 0 :: 0 | 1,
         last_matched = 0 :: non_neg_integer(),
         team_id = [] :: list(),
         formation_id = 1 :: non_neg_integer(),
         formation_lev = 1 :: non_neg_integer(),
         partner = [] :: list(),
         consecutive_lost = 0 :: non_neg_integer(),
         reported = 0 :: non_neg_integer(),
         guards = [],
         show_badge_id = 0 :: non_neg_integer()}).

-record(tournament_team,
        {ids = [] :: list(),
         output_num = 0 :: non_neg_integer(),
         assist_num = {0, 0} ::
             {non_neg_integer(), non_neg_integer()},
         origin_ids = [] :: list(),
         num = 1 :: non_neg_integer(),
         sum_point = 0 :: non_neg_integer(),
         max_point = 0 :: non_neg_integer(),
         min_point = 0 :: non_neg_integer(),
         sum_lev = 0 :: non_neg_integer(),
         max_lev = 0 :: non_neg_integer(),
         min_lev = 0 :: non_neg_integer(),
         tried_match = 0 :: non_neg_integer(),
         match_id = 0 :: non_neg_integer(),
         usurpers = [] :: list(),
         order = [] :: list(),
         classes = [] :: list()}).

-record(tournament_match,
        {id = 0 :: non_neg_integer(),
         teams = [] :: list(),
         time = 0 :: non_neg_integer(),
         combat_pid :: undefined | pid(),
         calc_args = [] :: list()}).

-record(tournament_usurper,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         leader_objected = 0 :: 0 | 1,
         total = 0 :: integer(),
         pros = 0 :: integer(),
         cons = 0 :: integer(),
         time = 0 :: integer(),
         voted_ids = []}).

-record(tournament_celebrity,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer()}).

-record(tournament_fighter,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         rank_point = 0 :: non_neg_integer(),
         kill_num = 0,
         dead_num = 0,
         total_heal = 0,
         control_num = 0,
         total_hurt = 0 :: non_neg_integer(),
         total_dmg = 0 :: non_neg_integer(),
         mvp_score = 0 :: non_neg_integer()}).

-record(tournament_season_role,
        {ver = 0,
         id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         reward_lev = 0 :: non_neg_integer(),
         rewarded = 0 :: non_neg_integer()}).

-record(tournament_result,
        {id = {0, "", 0},
         ver = 3,
         is_win = 1,
         mates = [],
         rival = [],
         match_id = 0,
         record_pz = {"", 0} :: tuple(),
         time = 0,
         rank_lev = 0}).

-record(tournament_result_role,
        {id = {0, "", 0},
         ver = 1,
         recent = [],
         last_recent = []}).

-record(king_badge,
        {id = 0,
         status = 0,
         active_effect_type = 3,
         active_attr = [],
         fc = 0}).

-record(tournament_match_report_info,
        {match_id, can_report = [], result}).

-file("src/mod/tournament/tournament_role.erl", 59).

-file("inc/guard.hrl", 1).

-record(m_guard,
        {ver = 1 :: pos_integer(),
         free_war_ids = [] :: [pos_integer()],
         tactics_fields = [] :: list(),
         tactics_attr = [] :: list(),
         guards = [] :: list()}).

-record(guard_eqm,
        {ver = 5,
         base_id :: undefined | non_neg_integer(),
         type :: undefined | non_neg_integer(),
         lev,
         eqm_attrs = [] :: list(),
         reset_base_id = 0,
         reset_attrs = [] :: list(),
         gem = [] :: list(),
         is_init = 1,
         timeout = 0,
         back_effect_timeout = 0,
         back_effect_attr = []}).

-record(guard_astroid,
        {ver = 2 :: non_neg_integer(),
         aroused = [] :: non_neg_integer(),
         skills = [] :: list(),
         attrs = [] :: list(),
         growth = 0 :: non_neg_integer(),
         active = 0 :: non_neg_integer()}).

-record(guard_astroid_star,
        {ver = 0,
         id = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         attrs = [] :: list()}).

-record(guard,
        {ver = 2,
         base_id = 0 :: non_neg_integer(),
         war_id = 0 :: non_neg_integer(),
         name = "" :: string(),
         alias = "" :: string(),
         classes = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         tac_pos = 0 :: non_neg_integer(),
         skills = [] :: list(),
         eqm = [] :: list(),
         attr :: undefined | tuple(),
         score = 0 :: non_neg_integer(),
         astroid = #guard_astroid{} :: #guard_astroid{}}).

-record(guard_data,
        {base_id = 0 :: non_neg_integer(),
         name = "" :: binary(),
         alias = "" :: binary(),
         classes = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         loss = [] :: tuple(),
         recruit_lev = 1 :: non_neg_integer(),
         desc = "" :: list(),
         normal_atk_id = 0 :: integer(),
         ai_id = 0 :: integer(),
         base_score = 0,
         growth = 0 :: non_neg_integer()}).

-record(guard_eqm_data,
        {base_id = 0 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         loss_coin = 0 :: [tuple()],
         reset_coin = 0 :: [tuple()],
         gem_list = [] :: list()}).

-record(guard_lev_data,
        {base_id :: undefined | non_neg_integer(),
         lev :: undefined | non_neg_integer(),
         lev_up_exp :: undefined | non_neg_integer(),
         attrs = [] :: non_neg_integer()}).

-record(guard_eqm_gem,
        {id = 0, base_id = 0, type = 0, lev = 0}).

-record(guard_eqm_gem_data,
        {base_id = 0,
         next_base_id = 0,
         name = "",
         lev = 0,
         type = 0,
         need_lev = 0,
         loss_coin = [],
         attrs = []}).

-file("src/mod/tournament/tournament_role.erl", 60).

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

-file("src/mod/tournament/tournament_role.erl", 61).

init() -> #m_tournament{}.

ready(Role = #role{id = Id,
                   m_tournament =
                       MT = #m_tournament{triggers = Triggers}}) ->
    case big_world:call(tournament, pk_type, []) of
        {ok, PkType} ->
            case check_join([lev,
                             event,
                             {matched, PkType},
                             team,
                             season_reward],
                            Role)
                of
                true ->
                    case check_team_mate(Role, PkType) of
                        {true, TeamMates} ->
                            case pk_type_check(Role, TeamMates, PkType) of
                                true ->
                                    [role:apply(async,
                                                Pid,
                                                {tournament_role,
                                                 callback,
                                                 [{follow_ready, PkType}]})
                                     || #tournament_role{pid = Pid, id = Mid}
                                            <- TeamMates,
                                        Mid =/= Id],
                                    {Role1, NewTriggers} = add_trigger([],
                                                                       Role,
                                                                       Triggers),
                                    NewRole = Role1#role{s_event = 24,
                                                         m_tournament =
                                                             MT#m_tournament{triggers
                                                                                 =
                                                                                 NewTriggers,
                                                                             pk_type
                                                                                 =
                                                                                 PkType}},
                                    map:role_update(NewRole),
                                    {ok, NewRole};
                                Else -> Else
                            end;
                        Fail -> Fail
                    end;
                Else -> Else
            end;
        _ -> {false, lang:get("服务器超时")}
    end.

ready_to_follow(Role = #role{}) ->
    case big_world:call(tournament, pk_type, []) of
        {ok, PkType} ->
            case check_join([lev, event, {matched, PkType}], Role)
                of
                true ->
                    NewRole = Role#role{s_event = 24},
                    team:follow(NewRole),
                    map:role_update(NewRole),
                    {ok, NewRole};
                {false, Why} ->
                    Msg = util:flist(lang:get("队长正在武道会中，~ts"), [Why]),
                    notice:send(Role, 1, Msg)
            end;
        _ -> {false, lang:get("系统超时")}
    end.

get_result_role({Id, Platform, ZoneId}) ->
    big_world:call(Platform,
                   ZoneId,
                   tournament_role,
                   local_result_role,
                   [{Id, Platform, ZoneId}]).

local_result_role(Id) ->
    case ets:lookup(tournament_result_role, Id) of
        [P = #tournament_result_role{}] -> P;
        _ -> false
    end.

join(#role{s_event = 25}) ->
    {false, lang:get("已经在武道会中")};
join(Role = #role{id = Id,
                  m_tournament = MTournament = #m_tournament{}}) ->
    case big_world:call(tournament, pk_type, []) of
        {ok, PkType} ->
            case check_join([lev, event, {matched, PkType}, team],
                            Role)
                of
                true ->
                    case check_team_mate(Role, PkType) of
                        {true, TeamMates0} ->
                            case pk_type_check(Role, TeamMates0, PkType) of
                                true ->
                                    TeamMates = set_partner(TeamMates0),
                                    NewMTournament =
                                        MTournament#m_tournament{pk_type =
                                                                     PkType},
                                    case big_world:call(tournament,
                                                        join,
                                                        [TeamMates])
                                        of
                                        ok ->
                                            [role:apply(async,
                                                        Pid,
                                                        {tournament_role,
                                                         callback,
                                                         [{follow_join,
                                                           PkType}]})
                                             || #tournament_role{pid = Pid,
                                                                 id = Mid}
                                                    <- TeamMates,
                                                Mid =/= Id],
                                            NewRole = Role#role{s_event = 74,
                                                                m_tournament =
                                                                    NewMTournament},
                                            map:role_update(NewRole),
                                            {ok, NewRole};
                                        {matching, _} ->
                                            NewRole = Role#role{s_event = 74,
                                                                m_tournament =
                                                                    NewMTournament},
                                            map:role_update(NewRole),
                                            {ok, NewRole};
                                        Else -> Else
                                    end;
                                Else -> Else
                            end;
                        Else -> Else
                    end;
                Else -> Else
            end;
        _ -> {false, lang:get("服务器超时")}
    end.

quit(Role = #role{s_event = 24,
                  m_tournament =
                      MT = #m_tournament{triggers = Triggers}}) ->
    team:leader_async(Role,
                      {tournament_role, callback, [quit]}),
    {Role1, _NewTriggers} = remove_trigger(all,
                                           Triggers,
                                           Role),
    MT1 = MT#m_tournament{triggers = []},
    NewRole = Role1#role{s_event = 0, m_tournament = MT1},
    map:role_update(NewRole),
    {ok, NewRole};
quit(Role = #role{s_event = 74, id = Id}) ->
    case big_world:call(tournament, quit, [Id]) of
        ok ->
            NewRole = Role#role{s_event = 24},
            map:role_update(NewRole),
            {ok, NewRole};
        Else -> Else
    end;
quit(_) -> {false, ""}.

login(Role = #role{s_event = 24}) ->
    {ok, Role#role{s_event = 0}};
login(Role = #role{s_event = 74}) ->
    {ok, Role#role{s_event = 0}};
login(Role = #role{s_event = 25, id = Id, pid = Pid}) ->
    big_world:cast(tournament, login, [Id, Pid]),
    {ok, Role#role{s_event = 0}};
login(_) -> ok.

logout(#role{s_event = 25, id = Id}) ->
    big_world:cast(tournament, logout, [Id]),
    ok;
logout(_) -> ok.

reset(Role = #role{lev = Lev, id = Id}, _OldRole)
    when Lev >= 70 ->
    OldAcc = case date:date() of
                 {_, _, 21} -> 0;
                 _ -> var:get_var(Role, acc, 1013, 0)
             end,
    LastDay = date:unixtime(zero) - 86400,
    DayNum = case tournament_agent:get_profile(Id) of
                 #tournament_profile{last_matched = Last,
                                     day_matched = Dm}
                     when Last =/= 0 ->
                     case date:is_same_day(Last, LastDay) of
                         true -> Dm;
                         false -> 0
                     end;
                 _ -> 0
             end,
    Week = date:day_of_the_week(LastDay),
    WeekFlag = case agenda_data:get(2049) of
                   #{args := Weeks} -> lists:member(Week, Weeks);
                   _ -> false
               end,
    NewRole = case WeekFlag of
                  true ->
                      case date:date() of
                          {_, _, 21} -> var:set_var(Role, acc, 1013, 0);
                          _ -> Role
                      end;
                  _ ->
                      case date:date() of
                          {_, _, 21} -> var:set_var(Role, acc, 1013, 0);
                          _ ->
                              AccNum = if DayNum >= 3 + OldAcc -> 0;
                                          true ->
                                              min(3,
                                                  max(1, 3 + OldAcc - DayNum))
                                       end,
                              var:set_var(Role, acc, 1013, AccNum)
                      end
              end,
    {ok, NewRole};
reset(_Role, _OldRole) -> ok.

chat(#role{s_event = 25, id = Id}, Cmd, Msg) ->
    big_world:cast(tournament_team, chat, [Id, Cmd, Msg]),
    ok;
chat(_, _, _) -> ok.

change_form(Role = #role{s_event = 25, id = Id},
            FormationId) ->
    case formation:check_formation(Role, FormationId) of
        {true, FormationLev} ->
            big_world:call(tournament,
                           change_form,
                           [Id, FormationId, FormationLev]);
        false -> {false, lang:get("不能使用该阵法")}
    end;
change_form(_, _) -> {false, lang:get("不在武道会中")}.

handover(#role{s_event = 25, id = Id}, TargetId) ->
    big_world:call(tournament, handover, [Id, TargetId]);
handover(_, _) -> {false, lang:get("不在武道会中")}.

guard_open(Role = #role{s_event = 25, id = Id,
                        m_guard = #m_guard{guards = Guards}},
           TargetId, Order) ->
    case lists:keyfind(TargetId, #guard.base_id, Guards) of
        #guard{} ->
            NGuards = get_guard(Role),
            big_world:call(tournament,
                           guard_open,
                           [Id, TargetId, Order, NGuards]);
        _ -> {false, lang:get("守护不存在")}
    end;
guard_open(_, _, _) -> {false, lang:get("不在武道会中")}.

change_order(#role{s_event = 25, id = Id}, {Oid, _, 0},
             {Tid, _, 0}) ->
    big_world:call(tournament,
                   change_order,
                   [Id, Oid, Tid]);
change_order(#role{s_event = 25, id = Id}, Oid,
             {Tid, _, 0}) ->
    big_world:call(tournament,
                   change_order,
                   [Id, Oid, Tid]);
change_order(#role{s_event = 25, id = Id}, {Oid, _, 0},
             Tid) ->
    big_world:call(tournament,
                   change_order,
                   [Id, Oid, Tid]);
change_order(#role{s_event = 25, id = Id}, Oid, Tid) ->
    big_world:call(tournament,
                   change_order,
                   [Id, Oid, Tid]);
change_order(_, _, _) -> {false, lang:get("不在武道会中")}.

usurp(#role{s_event = 25, id = Id}) ->
    big_world:call(tournament, usurp, [Id]);
usurp(_) -> {false, lang:get("不在武道会中")}.

vote_usurper(#role{s_event = 25, id = Id}, Decision) ->
    big_world:call(tournament,
                   vote_usurper,
                   [Id, Decision]);
vote_usurper(_, _) -> {false, lang:get("不在武道会中")}.

get_advance_reward(Role = #role{m_tournament =
                                    MT = #m_tournament{rewarded = Rewarded},
                                s_event = _Event}) ->
    Items = get_rewarded_items(Rewarded, []),
    Gain = format:val_to_gain(Items),
    Role1 = Role#role{m_tournament =
                          MT#m_tournament{rewarded = []}},
    case role_gain:do_notice(Gain, Role1) of
        {ok, Role2} -> {ok, Role2};
        {false, #gain{reason = bag_full}} ->
            Title = lang:get("武道会奖励"),
            Content = lang:get("背包已满，奖励通过邮件发送，请查收。"),
            mail:send(Role1,
                      #{title => Title, content => Content, items => Items}),
            {ok, Role1};
        {false, #gain{msg = Msg}} -> {false, Msg}
    end.

get_rank_lev(#role{id = Id}) -> get_rank_lev(Id);
get_rank_lev(Id) ->
    case ets:lookup(tournament_profile, Id) of
        [#tournament_profile{rank_lev = RankLev}] -> RankLev;
        _ -> 1
    end.

like(_Role = #role{id = Id, name = Name}, TargetId) ->
    case erlang:get(tournament_can_like) of
        Liked when is_list(Liked) ->
            logger:debug("can_like ~w",
                         [Liked],
                         tournament_role,
                         363),
            case lists:member(TargetId, Liked) of
                false -> {false, lang:get("不能给他点过赞了哦")};
                _ ->
                    big_world:cast(tournament, like, [Id, Name, TargetId]),
                    erlang:put(tournament_can_like, Liked -- [TargetId]),
                    ok
            end;
        _ -> {false, lang:get("现在不能点赞")}
    end.

report(_Role = #role{id = Id, name = Name}, TargetId,
       _RecId) ->
    case erlang:get(tournament_report) of
        TMR = #tournament_match_report_info{can_report =
                                                CanReportList,
                                            match_id = MatchId, result = Result}
            when is_list(CanReportList) ->
            logger:debug("举报信息:~w, 结果:~w",
                         [TargetId, Result],
                         tournament_role,
                         378),
            case lists:member(TargetId, CanReportList) of
                false -> {false, lang:get("您不能举报对方了哦")};
                _ ->
                    NewCanReport = lists:delete(TargetId, CanReportList),
                    NewTMR = TMR#tournament_match_report_info{can_report =
                                                                  NewCanReport},
                    put(tournament_report, NewTMR),
                    case check_target_honor(TargetId, Result) of
                        true ->
                            logger:debug("对方获得荣誉:", [], tournament_role, 388),
                            ok;
                        _ ->
                            big_world:cast(tournament,
                                           report,
                                           [Id, Name, TargetId, MatchId]),
                            ok
                    end
            end;
        _ -> {false, lang:get("现在不能举报")}
    end.

post_resut(Role = #role{}, Msg, Mentions) ->
    case erlang:get(tournament_result) of
        #tournament_result{id = {RsId, P, Z}} ->
            Content =
                util:flist(lang:get("{tournament_1,~w,~ts,~w}~ts"),
                           [RsId, P, Z, Msg]),
            case friend_circle:post(Role,
                                    #{content => Content, type => 1,
                                      mentions => Mentions, photos => [],
                                      thumbs => []})
                of
                {ok, NRole} ->
                    erlang:erase(tournament_result),
                    {ok, NRole};
                Else -> Else
            end;
        _ -> {false, lang:get("你已经分享过了")}
    end.

replay_result(#role{m_combat = #m_combat{pid = Pid}},
              _Id)
    when is_pid(Pid) ->
    {false, lang:get("战斗中不能看录像")};
replay_result(#role{link = #link{conn_pid = ConnPid}},
              Id) ->
    case tournament_agent:get_result(Id) of
        #tournament_result{match_id = MatchId,
                           record_pz = {P, Z}}
            when MatchId =/= 0 ->
            case big_world:call(P,
                                Z,
                                combat_record,
                                fetch,
                                [{12, {MatchId, P, Z}}])
                of
                Record = #combat_record{} ->
                    combat_record:replay(ConnPid, Record);
                _ -> {false, lang:get("录像已过期")}
            end;
        #tournament_result{match_id = MatchId, id = {_, P, Z}}
            when MatchId =/= 0 ->
            case big_world:call(P,
                                Z,
                                combat_record,
                                fetch,
                                [{12, MatchId}])
                of
                Record = #combat_record{} ->
                    combat_record:replay(ConnPid, Record);
                _ -> {false, lang:get("录像已过期")}
            end;
        _ -> {false, lang:get("找不到记录")}
    end.

rand_watch(Role) ->
    case big_world:call(tournament, rand_watch, []) of
        {ok, {Rid, Platform, ZoneId}, CombatPid} ->
            WatchArgs1 = #{watch_id => {Rid, Platform, ZoneId}},
            {ok, Ob} = role_convert:to(c_observer, Role),
            CombatPid ! {observer_enter, Ob, WatchArgs1},
            combat_util:member_enter_ob(Role,
                                        CombatPid,
                                        {Rid, Platform, ZoneId}),
            ok;
        _ -> {false, lang:get("没有合适的战斗可观战哦")}
    end.

push(#role{pid = Pid}, 16400) ->
    big_world:cast(tournament, push, [Pid, 16400]);
push(Role = #role{link = #link{conn_pid = ConnPid},
                  id = Id, s_event = 25,
                  m_tournament = #m_tournament{pk_type = PkType}},
     Cmd = 16407) ->
    MaxJoin = case PkType of
                  2 -> 5;
                  _ ->
                      tournament_season:calc_max_join(3,
                                                      var:get_var(Role,
                                                                  acc,
                                                                  1013,
                                                                  0))
              end,
    big_world:cast(tournament_team,
                   push_mate_info,
                   [ConnPid, {Cmd, MaxJoin, PkType}, Id]);
push(Role = #role{link = #link{conn_pid = ConnPid},
                  id = Id, s_event = Event,
                  m_tournament = #m_tournament{pk_type = PkType}},
     Cmd = 16407) ->
    Now = date:unixtime(),
    Profile = case tournament_agent:get_profile(Id) of
                  P = #tournament_profile{last_matched = Last,
                                          day_matched = Dm} ->
                      DayMatched = case date:is_same_day(Last, Now) of
                                       true -> Dm;
                                       _ -> 0
                                   end,
                      P#tournament_profile{day_matched = DayMatched};
                  _ -> #tournament_profile{}
              end,
    IsMatching = case Event of
                     25 -> 1;
                     74 -> 1;
                     _ -> 0
                 end,
    MaxJoin = case PkType of
                  2 -> 5;
                  _ ->
                      tournament_season:calc_max_join(3,
                                                      var:get_var(Role,
                                                                  acc,
                                                                  1013,
                                                                  0))
              end,
    Mates = case check_team_mate(Role, PkType) of
                {true, CMates} when is_list(CMates) -> CMates;
                _ -> [to(tournament_role, Role)]
            end,
    Data = {IsMatching,
            PkType,
            Profile,
            MaxJoin,
            Mates,
            []},
    logger:debug("======~w", [Mates], tournament_role, 493),
    sys_conn:pack_send(ConnPid, Cmd, Data);
push(#role{link = #link{conn_pid = ConnPid}},
     {Cmd, Data}) ->
    sys_conn:pack_send(ConnPid, Cmd, Data).

callback(Role = #role{s_event = 0,
                      m_tournament = MT = #m_tournament{triggers = Triggers}},
         {follow_ready, PkType}) ->
    {Role1, NewTriggers} = add_trigger([], Role, Triggers),
    NewRole = Role1#role{s_event = 24,
                         m_tournament =
                             MT#m_tournament{triggers = NewTriggers,
                                             pk_type = PkType}},
    push(NewRole, {16401, {1, ""}}),
    map:role_update(NewRole),
    case tournament_season:check(Role) of
        true -> ok;
        {false, Data} -> push(Role, {16421, Data})
    end,
    {ok, NewRole};
callback(Role = #role{s_event = 0,
                      m_tournament = MT = #m_tournament{triggers = Triggers}},
         {follow_join, PkType}) ->
    {Role1, NewTriggers} = add_trigger([], Role, Triggers),
    NewRole = Role1#role{s_event = 74,
                         m_tournament =
                             MT#m_tournament{triggers = NewTriggers,
                                             pk_type = PkType}},
    push(NewRole, {16402, {1, ""}}),
    map:role_update(NewRole),
    {ok, NewRole};
callback(Role = #role{s_event = 24,
                      m_tournament = MTournament},
         {follow_join, PkType}) ->
    push(Role, {16402, {1, ""}}),
    NewRole = Role#role{s_event = 74,
                        m_tournament =
                            MTournament#m_tournament{pk_type = PkType}},
    map:role_update(NewRole),
    {ok, NewRole};
callback(#role{s_event = _Event, name = _Name},
         {follow_join, _}) ->
    logger:debug("[~ts] event: ~w",
                 [_Name, _Event],
                 tournament_role,
                 541),
    ok;
callback(Role = #role{s_event = 0}, login) ->
    NewRole = Role#role{s_event = 25},
    map:role_update(NewRole),
    push(NewRole, {16402, {1, ""}}),
    {ok, NewRole};
callback(Role = #role{s_event = 74}, quit) ->
    push(Role, {16408, {1, ""}}),
    NewRole = Role#role{s_event = 24},
    map:role_update(NewRole),
    {ok, NewRole};
callback(Role = #role{s_event = 24,
                      m_tournament = MT = #m_tournament{triggers = Triggers}},
         quit) ->
    {Role1, _NewTriggers} = remove_trigger(all,
                                           Triggers,
                                           Role),
    MT1 = MT#m_tournament{triggers = []},
    push(Role1, {16403, {1, ""}}),
    NewRole = Role1#role{s_event = 0, m_tournament = MT1},
    map:role_update(NewRole),
    {ok, NewRole};
callback(#role{s_event = _Event, name = _Name}, quit) ->
    logger:debug("[~ts] event: ~w",
                 [_Name, _Event],
                 tournament_role,
                 565),
    ok;
callback(Role = #role{s_event = 24,
                      m_tournament = MT = #m_tournament{triggers = Triggers}},
         clear) ->
    {Role1, _NewTriggers} = remove_trigger(all,
                                           Triggers,
                                           Role),
    MT1 = MT#m_tournament{triggers = []},
    notice:send(Role, 3, lang:get("本次活动已结束")),
    push(Role1, {16403, {1, ""}}),
    NewRole = Role1#role{s_event = 0, m_tournament = MT1},
    map:role_update(NewRole),
    {ok, NewRole};
callback(Role = #role{s_event = 74,
                      m_tournament = MT = #m_tournament{triggers = Triggers}},
         clear) ->
    {Role1, _NewTriggers} = remove_trigger(all,
                                           Triggers,
                                           Role),
    MT1 = MT#m_tournament{triggers = []},
    notice:send(Role, 3, lang:get("本次活动已结束")),
    push(Role1, {16403, {1, ""}}),
    NewRole = Role1#role{s_event = 0, m_tournament = MT1},
    map:role_update(NewRole),
    {ok, NewRole};
callback(_, clear) -> ok;
callback(Role = #role{s_event = Event, id = Id,
                      name = Name},
         _Data = {combat_over,
                  Type,
                  #{profile :=
                        P = #tournament_profile{rank_lev = ARlev,
                                                rank_point = ARp,
                                                promotion_win = APW},
                    pk_type := PkType, season_rank_lev := BSRlev,
                    mates := Mates, rival := Rival, match_id := MatchId,
                    record_pz := {RP, RZ}, best := Best,
                    honor_point := HonorPoint, honor_name := HonorName,
                    client_point := ClientPoint}}) ->
    logger:debug("武道结算:~w", [_Data], tournament_role, 592),
    push(Role, {16403, {1, ""}}),
    {BRlev, BRp, BUpgradePoint} = case
                                      tournament_agent:get_profile(Id)
                                      of
                                      #tournament_profile{rank_lev = Blv,
                                                          rank_point = Bp,
                                                          upgrade_point =
                                                              UpgradePoint} ->
                                          {Blv, Bp, UpgradePoint};
                                      _ -> {1, 0, 0}
                                  end,
    case Type =:= win andalso ARp < BRp of
        true ->
            logger:error("[~ts]出现胜利分数变少before ~w, after ~w",
                         [Name, BRp, ARp],
                         tournament_role,
                         599);
        _ -> ok
    end,
    tournament_agent:update_profile(P),
    Reward = get_reward(BSRlev, ARlev),
    Result = case Type of
                 win -> 1;
                 _ -> 2
             end,
    NewEvent = case Event of
                   25 -> 0;
                   _ -> Event
               end,
    Role1 = do_reward(Role#role{s_event = NewEvent},
                      Reward,
                      ARlev),
    {Role2, CombatReward} = reward_combat(Role1, Type, P),
    logger:debug("~ts, ~w",
                 [Name, ClientPoint],
                 tournament_role,
                 634),
    notice_friends(#{season_rank_lev => BSRlev,
                     rank_lev => ARlev, id => Id, name => Name}),
    NewRole = fire_trigger(Role2, P, Type),
    map:role_update(NewRole),
    MateIds = [Mid
               || #tournament_fighter{id = Mid} <- Mates],
    erlang:put(tournament_can_like, MateIds),
    TourResult = #tournament_result{is_win = Result,
                                    mates = Mates, rival = Rival,
                                    match_id = MatchId, record_pz = {RP, RZ},
                                    time = date:unixtime(), rank_lev = ARlev},
    ResultInfo = #tournament_result{id = ResultId} =
                     save_result(Id, Best, TourResult),
    push(Role,
         {16406,
          {ResultId,
           Result,
           PkType,
           HonorPoint,
           BUpgradePoint,
           min(100, ClientPoint),
           BRp,
           ARp,
           BRlev,
           ARlev,
           Reward,
           CombatReward,
           Mates,
           Rival,
           HonorName,
           APW}}),
    erlang:put(tournament_match_id, MatchId),
    ReportInfo = #tournament_match_report_info{match_id =
                                                   MatchId,
                                               can_report = MateIds,
                                               result = ResultInfo},
    erlang:put(tournament_report, ReportInfo),
    {ok, NewRole};
callback(Role = #role{s_event = Event}, fight_result) ->
    Msg = lang:get("发起战斗失败，请重新匹配"),
    NewEvent = case Event of
                   25 -> 24;
                   74 -> 24;
                   _ -> Event
               end,
    NewRole = Role#role{s_event = NewEvent},
    push(NewRole, 16407),
    notice:send(NewRole, 3, Msg),
    map:role_update(NewRole),
    {ok, NewRole};
callback(Role = #role{s_event = 74}, {matched, Data}) ->
    notice:send(Role, 41, lang:get("武道会匹配成功，将在90秒后开始战斗")),
    NewRole = Role#role{s_event = 25},
    push(NewRole, {16404, Data}),
    map:role_update(NewRole),
    {ok, NewRole};
callback(Role = #role{s_event = _Event, name = _Name},
         {matched, _Data}) ->
    logger:debug("角色不在匹配状态中 [~ts] event ~w",
                 [_Name, _Event],
                 tournament_role,
                 675),
    {ok, Role};
callback(Role = #role{s_event = 25}, {usurp, Data}) ->
    push(Role, {16411, {Data}}),
    ok;
callback(Role = #role{s_event = 25},
         {push, Cmd, Data}) ->
    push(Role, {Cmd, Data}),
    ok;
callback(#role{s_event = _Event, name = _Name},
         {push, _, _}) ->
    logger:debug("[~ts] event: ~w",
                 [_Name, _Event],
                 tournament_role,
                 686),
    ok;
callback(Role, get_advance_reward) ->
    case get_advance_reward(Role) of
        {ok, NewRole} ->
            push(NewRole, {16417, {1, lang:get("成功领取奖励")}}),
            {ok, NewRole};
        _ -> ok
    end;
callback(Role = #role{name = Name},
         {convert,
          #{lev := LeadLev, rank_lev := RankLev,
            pk_type := PkType}}) ->
    Reply = case check_join([lev,
                             {leader_lev, LeadLev},
                             {rank_lev, RankLev},
                             follow,
                             event,
                             {matched, PkType}],
                            Role)
                of
                true -> {ok, to(tournament_role, Role)};
                {false, Why} ->
                    {false,
                     notice:format(lang:get("~ts~ts"),
                                   [{role_2, Name}, {string_1, Why}])};
                Else -> Else
            end,
    {ok, Reply};
callback(Role = #role{},
         {fire_achieve, P = #tournament_profile{}}) ->
    NewRole = fire_trigger(Role, P, 1),
    map:role_update(NewRole),
    {ok, NewRole};
callback(_, _Info) ->
    logger:error("未知回调 ~w", [_Info], tournament_role, 714),
    ok.

evt_callback(#evt_team_leave{},
             Role = #role{m_tournament =
                              MT = #m_tournament{triggers = Triggers},
                          s_event = 24}) ->
    {Role1, NewTriggers} = remove_trigger(all,
                                          Triggers,
                                          Role),
    NewRole = Role1#role{s_event = 0,
                         m_tournament =
                             MT#m_tournament{triggers = NewTriggers}},
    push(NewRole, {16403, {1, ""}}),
    {ok, NewRole};
evt_callback(#evt_team_join{pid = _Pid},
             #role{s_event = 24}) ->
    ok;
evt_callback(#evt_team_appoint{status = 1},
             Role = #role{m_tournament =
                              MT = #m_tournament{triggers = Triggers}}) ->
    {Role1, NewTriggers} = add_trigger([], Role, Triggers),
    NewRole = Role1#role{m_tournament =
                             MT#m_tournament{triggers = NewTriggers}},
    {ok, NewRole};
evt_callback(#evt_team_appoint{},
             Role = #role{m_tournament =
                              MT = #m_tournament{triggers = Triggers}}) ->
    {Role1, NewTriggers} = remove_trigger(evt_team_join,
                                          Triggers,
                                          Role),
    NewRole = Role1#role{m_tournament =
                             MT#m_tournament{triggers = NewTriggers}},
    {ok, NewRole};
evt_callback(_, _Role) -> ok.

check_join([], _Role) -> true;
check_join([lev | _T], #role{lev = Lev})
    when Lev < 70 ->
    {false, util:flist(lang:get("角色等级~w级才能参与"), [70])};
check_join([lev | T], Role) -> check_join(T, Role);
check_join([{leader_lev, LeadLev} | T],
           Role = #role{lev = Lev0,
                        m_lev_break = #m_lev_break{times = BreakTimes}}) ->
    Lev = Lev0 + 6 * BreakTimes,
    if LeadLev > 125 andalso Lev < 126 ->
           {false,
            notice:format(lang:get("等级还没~ts，不能开始匹配"),
                          [{string_2, 1, lang:get("突破120级")}])};
       Lev > 125 andalso LeadLev < 126 ->
           {false,
            notice:format(lang:get("等级已经~ts，不能开始匹配"),
                          [{string_2, 1, lang:get("突破120级")}])};
       LeadLev > 120 andalso Lev < 121 ->
           {false,
            notice:format(lang:get("等级还没~ts，不能开始匹配"),
                          [{string_2, 1, lang:get("突破115级")}])};
       Lev > 120 andalso LeadLev < 121 ->
           {false,
            notice:format(lang:get("等级已经~ts，不能开始匹配"),
                          [{string_2, 1, lang:get("突破115级")}])};
       LeadLev > 115 andalso Lev < 116 ->
           {false,
            notice:format(lang:get("等级还没~ts，不能开始匹配"),
                          [{string_2, 1, lang:get("突破110级")}])};
       Lev > 115 andalso LeadLev < 116 ->
           {false,
            notice:format(lang:get("等级已经~ts，不能开始匹配"),
                          [{string_2, 1, lang:get("突破110级")}])};
       LeadLev > 105 andalso Lev < 106 ->
           {false,
            notice:format(lang:get("等级还没~ts，不能开始匹配"),
                          [{string_2, 1, lang:get("突破100级")}])};
       Lev > 105 andalso LeadLev < 106 ->
           {false,
            notice:format(lang:get("等级已经~ts，不能开始匹配"),
                          [{string_2, 1, lang:get("突破100级")}])};
       LeadLev > 100 andalso Lev < 101 ->
           {false,
            notice:format(lang:get("等级还没~ts，不能开始匹配"),
                          [{string_2, 1, lang:get("突破")}])};
       Lev > 100 andalso LeadLev < 101 ->
           {false,
            notice:format(lang:get("等级已经~ts，不能开始匹配"),
                          [{string_2, 1, lang:get("突破")}])};
       LeadLev > 94 andalso Lev < 95 ->
           {false,
            notice:format(lang:get("等级不在~ts-~ts等级段内，不能开始匹配（等级段划分：70-74、75-79、80-8"
                                   "4……以此类推）"),
                          [{string_2, 1, 95}, {string_2, 1, 100}])};
       Lev > 94 andalso LeadLev < 95 ->
           {false,
            notice:format(lang:get("等级不在~ts-~ts等级段内，不能开始匹配（等级段划分：70-74、75-79、80-8"
                                   "4……以此类推）"),
                          [{string_2, 1, LeadLev div 5 * 5},
                           {string_2, 1, LeadLev div 5 * 5 + 4}])};
       Lev < 95 andalso
           LeadLev < 95 andalso Lev div 5 =/= LeadLev div 5 ->
           {false,
            notice:format(lang:get("等级不在~ts-~ts等级段内，不能开始匹配（等级段划分：70-74、75-79、80-8"
                                   "4……以此类推）"),
                          [{string_2, 1, LeadLev div 5 * 5},
                           {string_2, 1, LeadLev div 5 * 5 + 4}])};
       true -> check_join(T, Role)
    end;
check_join([{rank_lev, RankLev} | T],
           Role = #role{id = Id}) ->
    case tournament_agent:get_profile(Id) of
        #tournament_profile{rank_lev = Rl}
            when abs(RankLev - Rl) >= 3 ->
            {false,
             notice:format(lang:get("实力相差超过~ts个头衔，不能双排匹配哟{face_1,37}"),
                           [{string_2, 1, 3}])};
        #tournament_profile{} -> check_join(T, Role);
        _ ->
            case abs(RankLev - 1) >= 3 of
                true ->
                    {false,
                     notice:format(lang:get("实力相差超过~ts个头衔，不能双排匹配哟{face_1,37}"),
                                   [{string_2, 1, 3}])};
                _ -> check_join(T, Role)
            end
    end;
check_join([follow | T], Role) ->
    case team:get_status(Role) of
        {true, 2} -> check_join(T, Role);
        _ -> {false, lang:get("不在跟随状态，不能开始匹配")}
    end;
check_join([event | T], Role) ->
    case role_misc:check_event(Role, [24]) of
        true -> check_join(T, Role);
        Else -> Else
    end;
check_join([{matched, 2} | T], Role = #role{id = Id}) ->
    case tournament_agent:get_profile(Id) of
        #tournament_profile{day_matched = Matched,
                            last_matched = Last, banned_date = BannedDate} ->
            Now = date:unixtime(),
            case date:is_same_day(Now, Last) of
                true when Matched >= 5 ->
                    {false, lang:get("挑战次数已用完，休息一下吧！")};
                _ ->
                    case date:is_same_day(Now, BannedDate) of
                        true -> {false, lang:get("今天被罚停赛一天哦，明天再来吧")};
                        _ -> check_join(T, Role)
                    end
            end;
        _ -> check_join(T, Role)
    end;
check_join([{matched, _PkType} | T],
           Role = #role{id = Id}) ->
    MaxJoin = tournament_season:calc_max_join(3,
                                              var:get_var(Role, acc, 1013, 0)),
    case tournament_agent:get_profile(Id) of
        #tournament_profile{day_matched = Matched,
                            last_matched = Last, banned_date = BannedDate} ->
            Now = date:unixtime(),
            case date:is_same_day(Now, Last) of
                true when Matched >= MaxJoin ->
                    {false, lang:get("挑战次数已用完，休息一下吧！")};
                _ ->
                    case date:is_same_day(Now, BannedDate) of
                        true -> {false, lang:get("今天被罚停赛一天哦，明天再来吧")};
                        _ ->
                            Next = date:unixtime() + 86400,
                            case date:is_same_day(Next, BannedDate) of
                                true -> {false, lang:get("今天被罚停赛一天哦，明天再来吧")};
                                _ -> check_join(T, Role)
                            end
                    end
            end;
        _ -> check_join(T, Role)
    end;
check_join([team | T], Role) ->
    case team:get_status(Role) of
        {true, 1} -> check_join(T, Role);
        false -> check_join(T, Role);
        _ -> {false, lang:get("只有队长或单人可以报名")}
    end;
check_join([season_reward | T], Role) ->
    case tournament_season:check(Role) of
        true -> check_join(T, Role);
        {false, Data} ->
            push(Role, {16421, Data}),
            {false, ""}
    end.

check_team_mate(Role = #role{name = Name, lev = Lev,
                             classes = Classes, id = Id,
                             m_lev_break = #m_lev_break{times = BreakTimes},
                             m_team = #m_team{status = 1, pid = TeamPid}},
                PkType)
    when is_pid(TeamPid) ->
    TeamMats = team:get_members(Role),
    MateLen = length(TeamMats),
    case [Mate
          || Mate = #team_mate{status = State} <- TeamMats,
             State =:= 2]
        of
        _L when MateLen >= 2 ->
            {false, util:flist(lang:get("参与匹配队伍人数不能大于~w人"), [2])};
        L when length(L) >= 2 ->
            {false, lang:get("队员必须归队才能参与匹配哦")};
        L ->
            RankLev = case tournament_agent:get_profile(Id) of
                          #tournament_profile{rank_lev = Rl} -> Rl;
                          _ -> 1
                      end,
            case convert_mates(L,
                               #{lev => Lev + 6 * BreakTimes,
                                 classes => Classes, rank_lev => RankLev,
                                 pk_type => PkType})
                of
                CMates when is_list(CMates) ->
                    LastMates = [to(tournament_role, Role) | CMates],
                    case check_all_mate(LastMates,
                                        [{mate_lev, Lev, Name},
                                         {rank_lev, PkType},
                                         classes])
                        of
                        true -> {true, LastMates};
                        {false, Reason} -> {false, Reason}
                    end;
                Else -> Else
            end
    end;
check_team_mate(Role, _) ->
    LastMates = [to(tournament_role, Role)],
    {true, LastMates}.

pk_type_check(_Role, _TeamMates, _PkType) -> true.

check_all_mate(_, []) -> true;
check_all_mate(AllMate,
               [{mate_lev, 89, MsgName} | T]) ->
    Mates = [Name
             || #tournament_role{name = Name, lev = Lev} <- AllMate,
                Lev =/= 89],
    if length(Mates) > 0 ->
           Msg =
               notice:format(lang:get("~ts~ts级，只能和~ts级玩家进行双排匹配哦"),
                             [{role_2, MsgName},
                              {string_2, 5, 89},
                              {string_2, 5, 89}]),
           {false, Msg};
       true -> check_all_mate(AllMate, T)
    end;
check_all_mate(AllMate, [{mate_lev, _, _} | T]) ->
    Mates = [Name
             || #tournament_role{name = Name, lev = 89} <- AllMate],
    if length(Mates) > 0 ->
           [MsgName | _] = Mates,
           Msg =
               notice:format(lang:get("~ts~ts级，只能和~ts级玩家进行双排匹配哦"),
                             [{role_2, MsgName},
                              {string_2, 5, 89},
                              {string_2, 5, 89}]),
           {false, Msg};
       true -> check_all_mate(AllMate, T)
    end;
check_all_mate(AllMate, [{rank_lev, PkType} | T]) ->
    RankLevList = [{Name, RankLev}
                   || #tournament_role{name = Name, rank_lev = RankLev}
                          <- AllMate],
    case RankLevList of
        [{_, Ra}, {_, Rb}] when abs(Ra - Rb) >= 3 ->
            Msg =
                notice:format(lang:get("实力相差超过~ts个头衔，不能双排匹配哟{face_1,37}"),
                              [{string_2, 1, 3}]),
            {false, Msg};
        [{Na, Ra}, {Nb, Rb}, _] when abs(Ra - Rb) >= 3 ->
            Msg =
                notice:format(lang:get("~ts和~ts实力相差超过~ts个头衔，不能三排匹配哟{face_1,37}"),
                              [{role_2, Na}, {role_2, Nb}, {string_2, 1, 3}]),
            {false, Msg};
        [{Na, Ra}, _, {Nc, Rc}] when abs(Ra - Rc) >= 3 ->
            Msg =
                notice:format(lang:get("~ts和~ts实力相差超过~ts个头衔，不能三排匹配哟{face_1,37}"),
                              [{role_2, Na}, {role_2, Nc}, {string_2, 1, 3}]),
            {false, Msg};
        [_, {Nb, Rb}, {Nc, Rc}] when abs(Rb - Rc) >= 3 ->
            Msg =
                notice:format(lang:get("~ts和~ts实力相差超过~ts个头衔，不能三排匹配哟{face_1,37}"),
                              [{role_2, Nb}, {role_2, Nc}, {string_2, 1, 3}]),
            {false, Msg};
        [{Na, Ra}, _] when Ra > 9 andalso PkType == 1 ->
            Msg =
                notice:format(lang:get("~ts已超过~ts，不能进行双排{face_1,37}"),
                              [{role_2, Na},
                               {string_2, 1, tournament_data:get_name(9)}]),
            {false, Msg};
        [_, {Nb, Rb}] when Rb > 9 andalso PkType == 1 ->
            Msg =
                notice:format(lang:get("~ts已超过~ts，不能进行双排{face_1,37}"),
                              [{role_2, Nb},
                               {string_2, 1, tournament_data:get_name(9)}]),
            {false, Msg};
        [{Na, Ra}, _, _] when Ra > 5 ->
            Msg =
                notice:format(lang:get("~ts已超过~ts，不能进行三人排位{face_1,37}"),
                              [{role_2, Na},
                               {string_2, 1, tournament_data:get_name(5)}]),
            {false, Msg};
        [_, {Nb, Rb}, _] when Rb > 5 ->
            Msg =
                notice:format(lang:get("~ts已超过~ts，不能进行三人排位{face_1,37}"),
                              [{role_2, Nb},
                               {string_2, 1, tournament_data:get_name(5)}]),
            {false, Msg};
        [_, _, {Nc, Rc}] when Rc > 5 ->
            Msg =
                notice:format(lang:get("~ts已超过~ts，不能进行三人排位{face_1,37}"),
                              [{role_2, Nc},
                               {string_2, 1, tournament_data:get_name(5)}]),
            {false, Msg};
        _ -> check_all_mate(AllMate, T)
    end;
check_all_mate(AllMate, [classes | T]) ->
    ClassNum1 = [1
                 || #tournament_role{classes = Classes} <- AllMate,
                    Classes =:= 5],
    ClassNum2 = [1
                 || #tournament_role{classes = Classes} <- AllMate,
                    Classes =:= 4],
    ClassNum3 = [1
                 || #tournament_role{classes = Classes} <- AllMate,
                    Classes =/= 4 andalso Classes =/= 5],
    case length(ClassNum1) >= 2 of
        true ->
            {false, lang:get("秘言是队伍的战略核心，两名秘言不能一起匹配哟{face_1,4}")};
        false ->
            case length(ClassNum2) >= 2 of
                true ->
                    {false, lang:get("兽灵是队伍的战略核心，两名兽灵不能一起匹配哟{face_1,4}")};
                false ->
                    case length(ClassNum3) >= 3 of
                        true -> {false, lang:get("三名输出不能一起匹配哟{face_1,4}")};
                        false -> check_all_mate(AllMate, T)
                    end
            end
    end.

convert_mates([], _) -> [];
convert_mates([#team_mate{classes = 3} | _T],
              #{classes := 3, pk_type := 2}) ->
    {false, lang:get("战弓是队伍的战略核心，两名战弓不能双排哟{face_1,4}")};
convert_mates([#team_mate{classes = 5} | _T],
              #{classes := 5}) ->
    {false, lang:get("秘言是队伍的战略核心，两名秘言不能双排哟{face_1,4}")};
convert_mates([#team_mate{pid = Pid} | T], Arg) ->
    case role:apply(sync,
                    Pid,
                    {tournament_role, callback, [{convert, Arg}]})
        of
        {ok, R = #tournament_role{}} ->
            [R | convert_mates(T, Arg)];
        Else -> Else
    end.

to(tournament_role,
   Role = #role{id = Id, name = Name, classes = Classes,
                sex = Sex, lev = Lev, attr = #attr{fc = Fc}, pid = Pid,
                s_looks = Looks,
                m_lev_break = #m_lev_break{times = BreakTimes},
                m_tournament = #m_tournament{showbadge = BadgeId}}) ->
    {RankLev, RankPoint} = case
                               tournament_agent:get_profile(Id)
                               of
                               #tournament_profile{rank_lev = Rl,
                                                   rank_point = Rp} ->
                                   {Rl, Rp};
                               _ -> {1, 0}
                           end,
    {FormationId, FormationLev} =
        formation:get_use_formation(Role),
    PetFc = pet_attr:calc_fc(Role),
    IsLeader = case team:get_status(Role) of
                   {true, 1} -> 1;
                   _ -> 0
               end,
    SetGuards = case tournament_agent:get_profile(Id) of
                    #tournament_profile{guards = SGuards} -> SGuards;
                    _ -> []
                end,
    GList3 = get_guard(Role),
    GList4 = init_guard(SetGuards, GList3, []),
    #tournament_role{id = Id, name = Name,
                     classes = Classes, sex = Sex,
                     lev = Lev + 6 * BreakTimes, looks = Looks,
                     fc = Fc + PetFc, pid = Pid, rank_lev = RankLev,
                     rank_point = RankPoint, formation_lev = FormationLev,
                     formation_id = FormationId, is_leader = IsLeader,
                     guards = GList4, show_badge_id = BadgeId};
to(tournament_role,
   #team_mate{id = Id, name = Name, classes = Classes,
              sex = Sex, lev = Lev, fc = Fc, pid = Pid,
              lev_break_times = BreakTimes, looks = Looks}) ->
    {RankLev, RankPoint} = case
                               tournament_agent:get_profile(Id)
                               of
                               #tournament_profile{rank_lev = Rl,
                                                   rank_point = Rp} ->
                                   {Rl, Rp};
                               _ -> {1, 0}
                           end,
    BadgeId = case tournament_agent:role_badge_record(Id) of
                  [Id, _, _] -> Id;
                  _ -> 0
              end,
    #tournament_role{id = Id, name = Name,
                     classes = Classes, sex = Sex,
                     lev = Lev + 6 * BreakTimes, fc = Fc, pid = Pid,
                     rank_lev = RankLev, rank_point = RankPoint,
                     looks = Looks, show_badge_id = BadgeId}.

add_trigger([], Role, Triggers) -> {Role, Triggers};
add_trigger([Label | T], Role, Triggers) ->
    case lists:keyfind(Label, 1, Triggers) of
        {Label, _} -> add_trigger(T, Role, Triggers);
        _ ->
            {TriId, Role1} = role_trigger:add(#trigger{label =
                                                           Label,
                                                       m = tournament_role,
                                                       f = evt_callback,
                                                       a = []},
                                              Role),
            add_trigger(T, Role1, [TriId | Triggers])
    end.

remove_trigger(all, Triggers, Role) ->
    Role0 = role_trigger:del(Triggers, Role),
    {Role0, []};
remove_trigger(Label, Triggers, Role) ->
    TriIds = [Tid
              || Tid = {Lb, _} <- Triggers, Lb =:= Label],
    Role0 = role_trigger:del(TriIds, Role),
    {Role0,
     [One || One = {OLb, _} <- Triggers, OLb =/= Label]}.

notice_friends(#{season_rank_lev := BSRlev,
                 rank_lev := ARLev, id := Id, name := Name})
    when ARLev > 2 andalso ARLev > BSRlev ->
    Msg1 =
        notice:format(lang:get("~ts在~ts中表现出色，成功晋级至~ts，恭喜他{face_1,18}"),
                      [{role_2, Name},
                       {string_2, 1, lang:get("天下第一武道会")},
                       {string_2, 1, tournament_data:get_name(ARLev)}]),
    notice:cast(all, 5, Msg1),
    Friends = friend:list_id(Id),
    Msg =
        notice:format(lang:get("你的好友~ts在~ts成功晋级~ts！{face_1,29}"),
                      [{role_2, Name},
                       {string_2, 1, lang:get("天下第一武道会")},
                       {string_2, 1, tournament_data:get_name(ARLev)}]),
    do_notice(Friends, Msg);
notice_friends(_) -> ok.

do_notice([], _) -> ok;
do_notice([Id | T], Msg) ->
    case role_query:pid(by_id, Id) of
        {ok, Pid} -> notice:send({pid, Pid}, 3, Msg);
        _ -> ok
    end,
    do_notice(T, Msg).

get_reward(BSRlev, ARlev) when ARlev > BSRlev ->
    case tournament_data:get(ARlev) of
        #{advance_reward := Reward} -> Reward;
        _ -> []
    end;
get_reward(_, _) -> [].

do_reward(Role, [], _ARlev) -> Role;
do_reward(Role = #role{m_tournament =
                           MT = #m_tournament{rewarded = Rewarded}},
          _Reward, ARlev) ->
    NewRewarded = [ARlev | Rewarded -- [ARlev]],
    Timer = #timer{id = tournament_advance_reward,
                   timeout = 25000, times = 1, m = tournament_role,
                   f = callback, a = [get_advance_reward]},
    Role1 = Role#role{m_tournament =
                          MT#m_tournament{rewarded = NewRewarded}},
    role_timer:add(Timer, Role1).

set_partner([M1 = #tournament_role{id = Id1,
                                   name = Name1},
             M2 = #tournament_role{id = Id2, name = Name2}]) ->
    [M1#tournament_role{partner = [{Id2, Name2}]},
     M2#tournament_role{partner = [{Id1, Name1}]}];
set_partner([M1 = #tournament_role{id = Id1,
                                   name = Name1},
             M2 = #tournament_role{id = Id2, name = Name2},
             M3 = #tournament_role{id = Id3, name = Name3}]) ->
    [M1#tournament_role{partner =
                            [{Id2, Name2}, {Id3, Name3}]},
     M2#tournament_role{partner =
                            [{Id1, Name1}, {Id3, Name3}]},
     M3#tournament_role{partner =
                            [{Id1, Name1}, {Id2, Name2}]}];
set_partner(L) -> L.

get_rewarded_items([], Items) -> Items;
get_rewarded_items([RankLev | T], Items) ->
    case tournament_data:get(RankLev) of
        #{advance_reward := Reward} ->
            Items1 = [{I, 0, N} || {I, N} <- Reward] ++ Items,
            get_rewarded_items(T, Items1);
        _ -> get_rewarded_items(T, Items)
    end.

reward_combat(Role = #role{lev = Lev, name = Name},
              Type, #tournament_profile{day_matched = DayMatched}) ->
    {Result, ExpRate, StarScore} = case Type of
                                       win -> {1, 8.0e-1, 4};
                                       _ -> {2, 5.99999999999999977796e-1, 2}
                                   end,
    Gain1 = case levup_data:get_exp({3323, Lev}) of
                #{exp := Exp} ->
                    G1 = [{90010, round(Exp * ExpRate)},
                          {90020, StarScore}],
                    case pet:get_war_pet(Role) of
                        {ok, #pet{lev = PetLev}} ->
                            case levup_data:get_exp({3323, PetLev}) of
                                #{pet_exp := PetExp} ->
                                    [{90005, round(PetExp * ExpRate)} | G1];
                                _ -> G1
                            end;
                        _ -> G1
                    end;
                _R ->
                    logger:error("找不到经验模型 ~w ~w",
                                 [Lev, _R],
                                 tournament_role,
                                 1136),
                    [{90020, StarScore}]
            end,
    Rewarded = var:get_var(Role, day, 50, 0),
    {Role1, Gain3} = case util:rand(1, 100) =<
                              50 + 50 * max(0, DayMatched - Rewarded)
                         of
                         true ->
                             Gain2 = case
                                         tournament_data:get_combat_reward(Result)
                                         of
                                         L = [_ | _] ->
                                             case util:rand_list(L, item_weight)
                                                 of
                                                 #{item_id := ItemId,
                                                   bind := Bind,
                                                   item_num := ItemNum,
                                                   announce := Announce} ->
                                                     ItemId0 =
                                                         item_type:special_id(ItemId),
                                                     case Announce of
                                                         1 ->
                                                             AnStr = case Type
                                                                         of
                                                                         win ->
                                                                             notice:format(lang:get("~ts在~ts中高歌猛进，淘汰对手之后竟在地上发现~ts{face_1, "
                                                                                                    "20}"),
                                                                                           [{role_2,
                                                                                             Name},
                                                                                            {string_2,
                                                                                             1,
                                                                                             lang:get("天下第一武道会")},
                                                                                            {item_2,
                                                                                             ItemId0,
                                                                                             ItemNum}]);
                                                                         _ ->
                                                                             notice:format(lang:get("~ts在~ts中不幸落败，正要伤心之际竟发现口袋里多了~ts{face_1, "
                                                                                                    "29}"),
                                                                                           [{role_2,
                                                                                             Name},
                                                                                            {string_2,
                                                                                             1,
                                                                                             lang:get("天下第一武道会")},
                                                                                            {item_2,
                                                                                             ItemId0,
                                                                                             ItemNum}])
                                                                     end,
                                                             notice:cast(all,
                                                                         5,
                                                                         AnStr);
                                                         _ -> ok
                                                     end,
                                                     [{ItemId0, Bind, ItemNum}
                                                      | Gain1];
                                                 _ -> Gain1
                                             end;
                                         _ -> Gain1
                                     end,
                             {var:acc_var(Role, day, 50), Gain2};
                         _ -> {Role, Gain1}
                     end,
    case role_gain:do_notice(format:val_to_gain(Gain3),
                             Role1)
        of
        {ok, Role2} -> {Role2, gain_to_push(Gain3)};
        {false, #gain{reason = bag_full}} ->
            Title = lang:get("武道会奖励"),
            Content = lang:get("背包已满，奖励通过邮件发送，请查收。"),
            mail:send(Role1,
                      #{title => Title, content => Content, items => Gain3}),
            {Role1, gain_to_push(Gain3)};
        _ERR ->
            logger:error("[~ts] 获取奖励异常 ~w",
                         [Name, _ERR],
                         tournament_role,
                         1174),
            {Role, []}
    end;
reward_combat(Role, _, _) -> {Role, []}.

gain_to_push([]) -> [];
gain_to_push([{I, _, N} | T]) ->
    [{I, N} | gain_to_push(T)];
gain_to_push([{I, N} | T]) ->
    [{I, N} | gain_to_push(T)];
gain_to_push([_ | T]) -> gain_to_push(T).

fire_trigger(Role,
             #tournament_profile{rank_lev = RankLev,
                                 rank_point = RankPoint, liked = Liked,
                                 best_win_count = BestWinCount,
                                 awesome_kill = AwesomeKill,
                                 awesome_kill_num = AwesomeKillNum,
                                 awesome_dmg = AwesomeDmg,
                                 awesome_heal = AwesomeHeal,
                                 awesome_control = AwesomeControl, mvp = Mvp},
             Type) ->
    Evt1 = #evt_tournament{rank_lev = RankLev,
                           liked = Liked, best_win_count = BestWinCount,
                           awesome_kill = AwesomeKill,
                           awesome_kill_num = AwesomeKillNum,
                           awesome_dmg = AwesomeDmg, awesome_heal = AwesomeHeal,
                           awesome_control = AwesomeControl, mvp = Mvp},
    Evt2 = [#evt_tournament_combat{type = Type},
            #evt_tournament_point{rank_lev = RankLev,
                                  rank_point = RankPoint},
            Evt1],
    role_trigger:fire(Evt2, Role).

delete_post(Id) ->
    case ets:lookup(tournament_result, Id) of
        [#tournament_result{match_id = MatchId,
                            record_pz = {P, Z}}] ->
            combat_record:uncite([{{12, {MatchId, P, Z}}, 1}]);
        _ -> ok
    end,
    ets:delete(tournament_result, Id),
    dets:delete(tournament_result, Id).

save_result(Id = {_, P, Z}, Best,
            Result = #tournament_result{match_id = MatchId,
                                        record_pz = {Rp, Rz}, time = Time,
                                        rank_lev = RankLev, is_win = IsWin}) ->
    RsId = env:update_counter(tournament_result_id, 1),
    RecId = {RsId, P, Z},
    logger:debug("武道会结果id:~w",
                 [RecId],
                 tournament_role,
                 1209),
    Result1 = Result#tournament_result{id = RecId},
    combat_record:cite({12, {MatchId, Rp, Rz}}),
    ets:insert(tournament_result, Result1),
    dets:insert(tournament_result, Result1),
    Lr = {Time, RankLev, IsWin, Best, RecId},
    case ets:lookup(tournament_result_role, Id) of
        [R = #tournament_result_role{recent = Recent,
                                     last_recent = LastRecent}] ->
            NewRecent = lists:sublist([RecId | Recent], 50),
            NewLastRecent = lists:sublist([Lr | LastRecent], 10),
            Minus = Recent -- NewRecent,
            [delete_post(DelId) || DelId <- Minus],
            R1 = R#tournament_result_role{recent = NewRecent,
                                          last_recent = NewLastRecent},
            ets:insert(tournament_result_role, R1),
            dets:insert(tournament_result_role, R1);
        _ ->
            R1 = #tournament_result_role{id = Id, recent = [RecId],
                                         last_recent = [Lr]},
            ets:insert(tournament_result_role, R1),
            dets:insert(tournament_result_role, R1)
    end,
    put(tournament_result, Result1),
    Result1.

get_guard(Role) ->
    GList = guard_api:get_war_guard(Role),
    {GList1, GList2} = lists:partition(fun ({_GuardId,
                                             WarId,
                                             _Status,
                                             _Q}) ->
                                               WarId > 0
                                       end,
                                       GList),
    GList3 = lists:keysort(2, GList1),
    GList3 ++ GList2.

init_guard([], Glist, List) ->
    lists:reverse(List) ++ Glist;
init_guard([Id | T], GList, List) ->
    case lists:keyfind(Id, 1, GList) of
        I = {_, _, _, _} ->
            init_guard(T,
                       lists:keydelete(Id, 1, GList),
                       [I | List]);
        _ -> init_guard(T, GList, List)
    end.

get_badgeinfo(#role{m_tournament =
                        #m_tournament{kingbadgenum = BadgeNum,
                                      starlev = Starlev}}) ->
    {ok, {BadgeNum, Starlev}}.

push_badgeinfo(Role = #role{m_tournament =
                                #m_tournament{kingbadgenum = BadgeNum,
                                              starlev = Starlev}}) ->
    role:link_send(Role, 16431, {BadgeNum, Starlev}),
    ok.

promote(0,
        Role = #role{m_tournament =
                         MTournament = #m_tournament{kingbadgenum = BadgeNum,
                                                     starlev = Starlev}})
    when BadgeNum < 9 ->
    Cost = tournament_data:get_cost(BadgeNum),
    case Starlev + 1 < Cost of
        true ->
            case tournament_data:get_rewards({BadgeNum, Starlev}) of
                {_Id, _Bind, _Num} = Reward ->
                    Gain = format:val_to_gain([Reward]),
                    Loss = format:val_to_loss([{22785, 1}]),
                    case role_gain:do(Loss, Role) of
                        {ok, LossRole} ->
                            case role_gain:do(Gain, LossRole) of
                                {ok, NewRole} ->
                                    NStarlev = Starlev + 1,
                                    NMTournament =
                                        MTournament#m_tournament{starlev =
                                                                     NStarlev},
                                    NRole2 = NewRole#role{m_tournament =
                                                              NMTournament},
                                    role:link_send(16433, {[Reward], 0}),
                                    push_badgeinfo(NRole2),
                                    {ok, NRole2};
                                {false, #gain{reason = bag_full}} ->
                                    NStarlev = Starlev + 1,
                                    NMTournament =
                                        MTournament#m_tournament{starlev =
                                                                     NStarlev},
                                    NRole2 = LossRole#role{m_tournament =
                                                               NMTournament},
                                    Title = lang:get("王者徽章奖励"),
                                    Content =
                                        lang:get("您在提升王者徽章时背包已满，奖励通过邮件发放"),
                                    mail:send(NRole2,
                                              #{title => Title,
                                                content => Content,
                                                items => [Reward]}),
                                    role:link_send(16433, {[Reward], 0}),
                                    push_badgeinfo(NRole2),
                                    {ok, NRole2};
                                {false, #loss{msg = Msg}} -> {false, Msg};
                                _Err ->
                                    logger:debug("徽章升星失败，:~w",
                                                 [_Err],
                                                 tournament_role,
                                                 1286),
                                    {false, lang:get("徽章升星失败")}
                            end;
                        {false, #loss{msg = Msg}} -> {false, Msg};
                        Err ->
                            logger:debug("徽章升星出错：~w",
                                         [Err],
                                         tournament_role,
                                         1292),
                            {error, Err}
                    end;
                false ->
                    logger:debug("奖励道具出错", [], tournament_role, 1296),
                    {false, lang:get("奖励道具出错")}
            end;
        _ ->
            logger:debug("目前操作应该为兑换徽章", [], tournament_role, 1300),
            {false, lang:get("目前操作应该为兑换徽章")}
    end;
promote(1,
        Role = #role{m_tournament =
                         MTournament = #m_tournament{kingbadgenum = BadgeNum,
                                                     starlev = Starlev,
                                                     kingbadge = BadgeList},
                     id = RoleId})
    when BadgeNum < 9 ->
    Cost = tournament_data:get_cost(BadgeNum),
    case Starlev + 1 =:= Cost of
        true ->
            case tournament_data:get_rewards({BadgeNum, Starlev}) of
                {_Id, _Bind, _Num} = Reward ->
                    Gain = format:val_to_gain([Reward]),
                    Loss = format:val_to_loss([{22785, 1}]),
                    case role_gain:do(Loss, Role) of
                        {ok, LossRole} ->
                            case role_gain:do(Gain, LossRole) of
                                {ok, NewRole} ->
                                    AllBglist = [Bl
                                                 || Bl = {_, Weight}
                                                        <- tournament_data:get_bglist(),
                                                    Weight > 0],
                                    HoldList = [BadgeId
                                                || #king_badge{id = BadgeId,
                                                               status = Status}
                                                       <- BadgeList,
                                                   Status =:= 1],
                                    Fun = fun (BadgeId, Temp) ->
                                                  lists:keydelete(BadgeId,
                                                                  1,
                                                                  Temp)
                                          end,
                                    NotHoldList = lists:foldl(Fun,
                                                              AllBglist,
                                                              HoldList),
                                    case NotHoldList of
                                        [] -> {false, lang:get("你已经拥有所有的徽章")};
                                        _ ->
                                            {NewBadgeId, _} =
                                                util:rand_list(NotHoldList, 2),
                                            NRole2 =
                                                role_trigger:fire(#evt_kingbadge{base_id
                                                                                     =
                                                                                     NewBadgeId},
                                                                  NewRole),
                                            role:link_send(16433,
                                                           {[Reward],
                                                            NewBadgeId}),
                                            #{name := BadgeName} =
                                                achieve_shop_data:get(NewBadgeId),
                                            notice:cast(all,
                                                        4,
                                                        notice:format(lang:get("~ts锲而不舍，解锁了武道王者徽章~ts，全服小伙伴都惊呆了{face_1,4}"),
                                                                      [{role_2,
                                                                        NRole2},
                                                                       {string_2,
                                                                        4,
                                                                        BadgeName}])),
                                            NStarlev = 0,
                                            NBadgenum = BadgeNum + 1,
                                            NewBadgeList =
                                                tournament_attr:revise_kingbadge(NewBadgeId,
                                                                                 BadgeList),
                                            NMTournament =
                                                MTournament#m_tournament{kingbadgenum
                                                                             =
                                                                             NBadgenum,
                                                                         starlev
                                                                             =
                                                                             NStarlev,
                                                                         kingbadge
                                                                             =
                                                                             NewBadgeList,
                                                                         showbadge
                                                                             =
                                                                             NewBadgeId},
                                            NRole3 =
                                                attr:calc_and_push(NRole2#role{m_tournament
                                                                                   =
                                                                                   NMTournament}),
                                            push_badgeinfo(NRole3),
                                            [H | _] =
                                                [P#tournament_profile{show_badge_id
                                                                          =
                                                                          NewBadgeId}
                                                 || P = #tournament_profile{id =
                                                                                Rid}
                                                        <- ets:tab2list(tournament_profile),
                                                    Rid =:= RoleId],
                                            tournament_agent:update_profile(H),
                                            big_world:cast(tournament,
                                                           change_badge,
                                                           [RoleId,
                                                            NewBadgeId]),
                                            {ok, NRole3}
                                    end;
                                {false, #gain{reason = bag_full}} ->
                                    Title = lang:get("王者徽章奖励"),
                                    Content =
                                        lang:get("您在提升王者徽章时背包已满，奖励通过邮件发放"),
                                    mail:send(LossRole,
                                              #{title => Title,
                                                content => Content,
                                                items => [Reward]}),
                                    AllBglist = [Bl
                                                 || Bl = {_, Weight}
                                                        <- tournament_data:get_bglist(),
                                                    Weight > 0],
                                    HoldList = [BadgeId
                                                || #king_badge{id = BadgeId,
                                                               status = Status}
                                                       <- BadgeList,
                                                   Status =:= 1],
                                    Fun = fun (BadgeId, Temp) ->
                                                  lists:keydelete(BadgeId,
                                                                  1,
                                                                  Temp)
                                          end,
                                    NotHoldList = lists:foldl(Fun,
                                                              AllBglist,
                                                              HoldList),
                                    case NotHoldList of
                                        [] -> {false, lang:get("你已经拥有所有的徽章")};
                                        _ ->
                                            {NewBadgeId, _} =
                                                util:rand_list(NotHoldList, 2),
                                            NRole2 =
                                                role_trigger:fire(#evt_kingbadge{base_id
                                                                                     =
                                                                                     NewBadgeId},
                                                                  LossRole),
                                            role:link_send(16433,
                                                           {[Reward],
                                                            NewBadgeId}),
                                            #{name := BadgeName} =
                                                achieve_shop_data:get(NewBadgeId),
                                            notice:cast(all,
                                                        4,
                                                        notice:format(lang:get("~ts锲而不舍，解锁了武道王者徽章~ts，全服小伙伴都惊呆了{face_1,4}"),
                                                                      [{role_2,
                                                                        NRole2},
                                                                       {string_2,
                                                                        4,
                                                                        BadgeName}])),
                                            NStarlev = 0,
                                            NBadgenum = BadgeNum + 1,
                                            NewBadgeList =
                                                tournament_attr:revise_kingbadge(NewBadgeId,
                                                                                 BadgeList),
                                            NMTournament =
                                                MTournament#m_tournament{kingbadgenum
                                                                             =
                                                                             NBadgenum,
                                                                         starlev
                                                                             =
                                                                             NStarlev,
                                                                         kingbadge
                                                                             =
                                                                             NewBadgeList,
                                                                         showbadge
                                                                             =
                                                                             NewBadgeId},
                                            NRole3 =
                                                attr:calc_and_push(NRole2#role{m_tournament
                                                                                   =
                                                                                   NMTournament}),
                                            push_badgeinfo(NRole3),
                                            [H | _] =
                                                [P#tournament_profile{show_badge_id
                                                                          =
                                                                          NewBadgeId}
                                                 || P = #tournament_profile{id =
                                                                                Rid}
                                                        <- ets:tab2list(tournament_profile),
                                                    Rid =:= RoleId],
                                            tournament_agent:update_profile(H),
                                            big_world:cast(tournament,
                                                           change_badge,
                                                           [RoleId,
                                                            NewBadgeId]),
                                            {ok, NRole3}
                                    end;
                                {false, #loss{msg = Msg}} -> {false, Msg};
                                _Err ->
                                    logger:debug("徽章兑换失败，:~w",
                                                 [_Err],
                                                 tournament_role,
                                                 1375),
                                    {false, lang:get("徽章兑换失败")}
                            end;
                        {false, #loss{msg = Msg}} -> {false, Msg};
                        Err ->
                            logger:debug("徽章升星出错：~w",
                                         [Err],
                                         tournament_role,
                                         1381),
                            {error, Err}
                    end;
                _ ->
                    logger:debug("奖励道具出错", [], tournament_role, 1385),
                    {false, lang:get("奖励道具出错")}
            end;
        _ ->
            logger:debug("目前操作应该为徽章升星", [], tournament_role, 1389),
            {false, lang:get("目前操作应该为徽章升星")}
    end;
promote(_, _Role) ->
    logger:debug("徽章已满或其他错误", [], tournament_role, 1395),
    {false, lang:get("已经拥有所有徽章，不能再兑换")}.

use_badge(Role = #role{m_tournament =
                           MTournament = #m_tournament{},
                       id = RoleId},
          BadgeId) ->
    Newbadge = BadgeId,
    NMTournament = MTournament#m_tournament{showbadge =
                                                Newbadge},
    NRole = Role#role{m_tournament = NMTournament},
    [H | _] = [P#tournament_profile{show_badge_id =
                                        Newbadge}
               || P = #tournament_profile{id = Rid}
                      <- ets:tab2list(tournament_profile),
                  Rid =:= RoleId],
    tournament_agent:update_profile(H),
    big_world:cast(tournament,
                   change_badge,
                   [RoleId, Newbadge]),
    {ok, NRole}.

check_target_honor(TargetId,
                   #tournament_result{mates = Mates, rival = Rival}) ->
    AllFighter = Mates ++ Rival,
    MaxDmg = lists:max([Dmg
                        || #tournament_fighter{total_dmg = Dmg} <- AllFighter]),
    MaxKill = lists:max([Kill
                         || #tournament_fighter{kill_num = Kill}
                                <- AllFighter]),
    MaxHeal = lists:max([Heal
                         || #tournament_fighter{total_heal = Heal}
                                <- AllFighter]),
    MaxControl = lists:max([Control
                            || #tournament_fighter{control_num = Control}
                                   <- AllFighter]),
    MaxMvpSc = lists:max([MvpSc
                          || #tournament_fighter{mvp_score = MvpSc}
                                 <- AllFighter]),
    case lists:keyfind(TargetId,
                       #tournament_fighter.id,
                       Mates)
        of
        #tournament_fighter{total_dmg = MaxDmg} -> true;
        #tournament_fighter{kill_num = MaxKill} -> true;
        #tournament_fighter{total_heal = MaxHeal}
            when MaxHeal =/= 0 ->
            true;
        #tournament_fighter{control_num = MaxControl}
            when MaxControl =/= 0 ->
            true;
        #tournament_fighter{mvp_score = MaxMvpSc} -> true;
        _Else -> false
    end;
check_target_honor(_TargetId, _) -> true.

group_login() ->
    role_group:apply(world, {tournament_role, login, []}).

