-file("src/mod/endless_challenge/endless_challenge_r"
      "ank.erl",
      1).

-module(endless_challenge_rank).

-behaviour(gen_server).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([start_link/0,
         get_rank/1,
         update_endless_wave_rank/0,
         update_endless_wave_rank/1,
         reset/0,
         get_mark_rank/0,
         update_data_to_rank/0,
         dets_sync_rank/1,
         rever/0]).

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

-file("src/mod/endless_challenge/endless_challenge_r"
      "ank.erl",
      24).

-file("inc/endless_challenge.hrl", 1).

-record(m_endless_challenge,
        {ver = 3 :: pos_integer(),
         is_prepare = 0 :: non_neg_integer(),
         choose_skills = [],
         reward_list = [],
         best_wave = 0 :: non_neg_integer(),
         skill_list = [] :: list(),
         turn_count = 0,
         free_count = 0,
         fighter_times = 0}).

-record(mate_data,
        {id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         best_wave = 0,
         max_wave = 0,
         is_prepare = 0 :: non_neg_integer(),
         choose_skills = []}).

-record(endless_challenge_rank,
        {ver = 1 :: non_neg_integer(),
         id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         wave = 0 :: non_neg_integer(),
         use_time = 0 :: non_neg_integer(),
         mate_datas = []}).

-file("src/mod/endless_challenge/endless_challenge_r"
      "ank.erl",
      25).

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

-file("src/mod/endless_challenge/endless_challenge_r"
      "ank.erl",
      26).

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

-file("src/mod/endless_challenge/endless_challenge_r"
      "ank.erl",
      27).

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

-file("src/mod/endless_challenge/endless_challenge_r"
      "ank.erl",
      28).

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

-file("src/mod/endless_challenge/endless_challenge_r"
      "ank.erl",
      29).

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

-file("src/mod/endless_challenge/endless_challenge_r"
      "ank.erl",
      30).

-record(state,
        {type = local, rank_lev_list = [], rank_lev_num = 0}).

keys() ->
    [{asc, #endless_challenge_rank.use_time},
     #endless_challenge_rank.wave].

start_link() ->
    gen_server:start_link({local, endless_challenge_rank},
                          endless_challenge_rank,
                          [],
                          []).

update_endless_wave_rank() ->
    gen_server:cast(endless_challenge_rank,
                    update_endless_wave_rank).

update_endless_wave_rank([]) -> ok;
update_endless_wave_rank([I = #endless_challenge_rank{id
                                                          =
                                                          {_, Platform, ZoneId}}
                          | T]) ->
    cross:cast(Platform,
               ZoneId,
               gen_server,
               cast,
               [endless_challenge_rank,
                {update_endless_wave_rank, [I]}]),
    update_endless_wave_rank(T).

reset() ->
    gen_server:cast(endless_challenge_rank, {reset}).

update_data_to_rank() ->
    gen_server:cast(endless_challenge_rank,
                    update_data_to_rank).

get_rank(Role) -> do_get_rank(Role).

do_get_rank(#role{pid = RolePid}) ->
    gen_server:cast(endless_challenge_rank,
                    {get_rank, RolePid}),
    ok.

get_mark_rank() ->
    AllRoleMark = ets:tab2list(qualifying_role_mark),
    SortRoleMark = lists:sublist(util:keys_sort(keys(),
                                                AllRoleMark),
                                 100),
    SortRoleMark.

rever() ->
    gen_server:cast(endless_challenge_rank, rever),
    ok.

init([]) ->
    logger:info("[~w] 正在启动...",
                [endless_challenge_rank],
                endless_challenge_rank,
                90),
    process_flag(trap_exit, true),
    dets:open_file(endless_challenge_rank,
                   [{file, "./dets/endless_challenge_rank.dets"},
                    {keypos, #endless_challenge_rank.id},
                    {type, set}]),
    ets:new(endless_challenge_rank,
            [set,
             named_table,
             public,
             {keypos, #endless_challenge_rank.id}]),
    dets:to_ets(endless_challenge_rank,
                endless_challenge_rank),
    State = #state{type = 1},
    update_endless_wave_rank(),
    RewardRef = erlang:send_after(date:next_diff(23, 0, 1) *
                                      1000,
                                  self(),
                                  reward_tick),
    put(reward_tick_ref, RewardRef),
    ResetRef = erlang:send_after(date:next_diff(5, 0, 1) *
                                     1000,
                                 self(),
                                 reset_tick),
    put(reset_tick_ref, ResetRef),
    logger:info("[~w] 启动完成",
                [endless_challenge_rank],
                endless_challenge_rank,
                107),
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(update_endless_wave_rank,
            State = #state{}) ->
    AllRoleMark = ets:tab2list(endless_challenge_rank),
    SortRoleMark = lists:sublist(util:keys_sort(keys(),
                                                AllRoleMark),
                                 100),
    Fun = fun (RoleMark = #endless_challenge_rank{mate_datas
                                                      = MateDatas},
               List) ->
                  NewMateDatas = ver_mate_data(MateDatas, []),
                  [RoleMark#endless_challenge_rank{mate_datas =
                                                       NewMateDatas}
                   | List]
          end,
    SortRoleMark1 = lists:reverse(lists:foldl(Fun,
                                              [],
                                              SortRoleMark)),
    RoleNum = length(SortRoleMark1),
    NewState = State#state{rank_lev_list = SortRoleMark1,
                           rank_lev_num = RoleNum},
    {noreply, NewState};
handle_cast(rever,
            State = #state{rank_lev_list = RankLevList}) ->
    Fun = fun (RoleMark = #endless_challenge_rank{mate_datas
                                                      = MateDatas},
               List) ->
                  NewMateDatas = ver_mate_data(MateDatas, []),
                  [RoleMark#endless_challenge_rank{mate_datas =
                                                       NewMateDatas}
                   | List]
          end,
    RankLevList1 = lists:reverse(lists:foldl(Fun,
                                             [],
                                             RankLevList)),
    RoleNum = length(RankLevList1),
    NewState = State#state{rank_lev_list = RankLevList1,
                           rank_lev_num = RoleNum},
    {noreply, NewState};
handle_cast({update_endless_wave_rank, RoleWaveInfo},
            State = #state{rank_lev_list = RoleRankList}) ->
    NewRoleMarks = merge_role_mark(RoleRankList,
                                   RoleWaveInfo),
    SortRoleMark = lists:sublist(util:keys_sort(keys(),
                                                NewRoleMarks),
                                 100),
    RoleNum = length(SortRoleMark),
    NewState = State#state{rank_lev_list = SortRoleMark,
                           rank_lev_num = RoleNum},
    {noreply, NewState};
handle_cast({reset}, State) ->
    {noreply, State#state{rank_lev_list = []}};
handle_cast({get_rank, RolePid},
            State = #state{rank_lev_list = RankLevList,
                           rank_lev_num = RankLevNum}) ->
    RankList = case RankLevNum > 0 of
                   true -> lists:sublist(RankLevList, 1, RankLevNum);
                   false -> []
               end,
    PushRankList = convert_push_rank_list(RankList),
    logger:debug("推送的数据:~w",
                 [PushRankList],
                 endless_challenge_rank,
                 159),
    role:pack_send(RolePid, 17206, {PushRankList}),
    {noreply, State};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(rank_info,
            State = #state{rank_lev_list = RankList}) ->
    logger:info("排行信息列表:~w",
                [RankList],
                endless_challenge_rank,
                167),
    {noreply, State};
handle_info(reward_tick, State = #state{}) ->
    logger:debug("无尽试炼排行结算===========",
                 [],
                 endless_challenge_rank,
                 171),
    case get(reward_tick_ref) of
        CLRef when is_reference(CLRef) ->
            erlang:cancel_timer(CLRef);
        _ -> skip
    end,
    Ref = erlang:send_after(86400 * 1000,
                            self(),
                            reward_tick),
    put(reward_tick_ref, Ref),
    NewState = rank_day_reward(State),
    {noreply, NewState};
handle_info(reset_tick, State = #state{}) ->
    NewState = reset_rank_list(State),
    case get(reset_tick_ref) of
        CLRef when is_reference(CLRef) ->
            erlang:cancel_timer(CLRef);
        _ -> skip
    end,
    Ref = erlang:send_after(86400 * 1000,
                            self(),
                            reset_tick),
    put(reset_tick_ref, Ref),
    {noreply, NewState};
handle_info(_Info, State) ->
    logger:error("收到未知消息: ~w",
                 [_Info],
                 endless_challenge_rank,
                 197),
    {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...",
                [endless_challenge_rank],
                endless_challenge_rank,
                201),
    logger:info("[~w] 关闭完成",
                [endless_challenge_rank],
                endless_challenge_rank,
                202),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

merge_role_mark(RoleRankList, []) -> RoleRankList;
merge_role_mark(RoleRankList,
                [WaveInfo = #endless_challenge_rank{id = RoleId,
                                                    wave = Wave,
                                                    use_time = UseTime}
                 | T]) ->
    NewRankList = case lists:keyfind(RoleId,
                                     #endless_challenge_rank.id,
                                     RoleRankList)
                      of
                      #endless_challenge_rank{wave = RankWave}
                          when Wave > RankWave ->
                          dets_sync_rank(WaveInfo),
                          lists:keystore(RoleId,
                                         #endless_challenge_rank.id,
                                         RoleRankList,
                                         WaveInfo);
                      #endless_challenge_rank{wave = RankWave,
                                              use_time = RankUseTime}
                          when Wave =:= RankWave andalso
                                   UseTime < RankUseTime ->
                          dets_sync_rank(WaveInfo),
                          lists:keystore(RoleId,
                                         #endless_challenge_rank.id,
                                         RoleRankList,
                                         WaveInfo);
                      #endless_challenge_rank{} -> RoleRankList;
                      _ ->
                          dets_sync_rank(WaveInfo),
                          lists:keystore(RoleId,
                                         #endless_challenge_rank.id,
                                         RoleRankList,
                                         WaveInfo)
                  end,
    merge_role_mark(NewRankList, T).

dets_sync_rank(RankData = #endless_challenge_rank{}) ->
    ets:insert(endless_challenge_rank, RankData),
    dets:insert(endless_challenge_rank, RankData).

rank_day_reward(State = #state{rank_lev_list =
                                   RankList}) ->
    send_rank_reward(RankList),
    State.

reset_rank_list(State) ->
    ets:delete_all_objects(endless_challenge_rank),
    dets:delete_all_objects(endless_challenge_rank),
    State#state{rank_lev_list = [], rank_lev_num = 0}.

convert_push_rank_list(RankList) ->
    convert_push_rank_list(RankList,
                           1,
                           length(RankList),
                           []).

convert_push_rank_list([], _, _, PushRankList) ->
    PushRankList;
convert_push_rank_list(_, RankNum, Num, PushRankList)
    when RankNum > Num ->
    PushRankList;
convert_push_rank_list([Data = #endless_challenge_rank{}
                        | Rest],
                       Index, Num, PushRankList) ->
    convert_push_rank_list(Rest,
                           Index + 1,
                           Num,
                           [{Index, Data} | PushRankList]);
convert_push_rank_list([_ | Rest], Index, Num,
                       PushRankList) ->
    convert_push_rank_list(Rest, Index, Num, PushRankList).

send_rank_reward(RankList) ->
    send_rank_reward(RankList, 1, 100).

send_rank_reward([], _Rank, _MaxNum) -> ok;
send_rank_reward(_, MaxNum, MaxNum) -> ok;
send_rank_reward([#endless_challenge_rank{id = RoleId,
                                          wave = Wave, use_time = UseTime}
                  | Rest],
                 Rank, MaxNum) ->
    Title = lang:get("无尽挑战排行奖励"),
    Min = UseTime div 60,
    Sec = UseTime rem 60,
    ResultMsg = util:flist(lang:get("用时~w分~w秒击杀~w波"),
                           [Min, Sec, Wave]),
    Content =
        notice:format(lang:get("恭喜您在今日无尽挑战中以~ts的成绩获得了第~ts名,希望在新的一天你能达到更好的成绩，以"
                               "下是您的奖励:"),
                      [{string_2, 4, ResultMsg}, {string_2, 4, Rank}]),
    Reward = endless_challenge_data:get_rank_reward(Rank),
    mail:send(RoleId,
              #{title => Title, content => Content, items => Reward}),
    send_rank_reward(Rest, Rank + 1, MaxNum);
send_rank_reward([_ | Rest], Rank, MaxNum) ->
    send_rank_reward(Rest, Rank, MaxNum).

ver_mate_data([], Mates) -> Mates;
ver_mate_data([H | T], Mates) ->
    case ver_mate_data(H) of
        {ok, NewH} -> ver_mate_data(T, [NewH | Mates]);
        _ -> ver_mate_data(T, Mates)
    end.

ver_mate_data({mate_data,
               Id,
               Name,
               Classes,
               Sex,
               Lev,
               BestWave,
               IsPrepare,
               ChooseSkills}) ->
    MaxWave = 0,
    ver_mate_data({mate_data,
                   Id,
                   Name,
                   Classes,
                   Sex,
                   Lev,
                   BestWave,
                   MaxWave,
                   IsPrepare,
                   ChooseSkills});
ver_mate_data(MateData = #mate_data{}) ->
    {ok, MateData};
ver_mate_data(_Err) ->
    logger:error("无法转换队员版本:~w",
                 [_Err],
                 endless_challenge_rank,
                 303),
    false.

