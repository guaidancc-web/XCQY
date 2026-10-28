-file("src/mod/friend/friend_wish_agent.erl", 1).

-module(friend_wish_agent).

-author(hugh).

-behaviour(gen_fsm).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

-export([idle/2, active/2, clean/2]).

-export([start_link/0,
         audit/7,
         get_wish_list/2,
         get_lantern_content/1,
         open_wish/1,
         gm_audit/2,
         get_state/0,
         lookup_batch_moment/1,
         gm_clean_data/0,
         reload/0,
         send_lucky_reward/1,
         get_lucky_roles/1,
         get_history_wishs/0,
         update_reward_tile/0,
         login/1]).

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

-file("src/mod/friend/friend_wish_agent.erl", 37).

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

-file("src/mod/friend/friend_wish_agent.erl", 38).

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

-file("src/mod/friend/friend_wish_agent.erl", 39).

-file("inc/battle.hrl", 1).

-record(battle_base,
        {id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         sub_id = 0,
         sub_type = 0,
         name :: undefined | atom(),
         pid :: undefined | undefine | pid(),
         global = [] :: list(),
         map = [] :: list(),
         unit = [] :: list(),
         point = [] :: list(),
         trigger = [] :: list(),
         enter_point = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()}}).

-record(battle,
        {id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         sub_id = 0,
         sub_type = 0,
         name :: undefined | atom(),
         pid :: undefined | undefine | pid(),
         map = [] :: list(),
         enter_point = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         ext = [],
         role_id = {0, "", 0}}).

-record(battle_context,
        {grade = 1 :: pos_integer(),
         score = 0 :: non_neg_integer(),
         round = 0 :: non_neg_integer(),
         max_dmg = 0 :: non_neg_integer(),
         hurt = 0 :: non_neg_integer(),
         ratio_val = 0,
         die_num = 0}).

-record(battle_role,
        {id,
         status = 1,
         pid,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer(),
         is_kill_boss = 0 :: 0..1,
         sub_id = 0 :: non_neg_integer(),
         flip_cards = [] :: [],
         has_reward_floor = [],
         context = #battle_context{}}).

-record(battle_combat_info,
        {sub_id = 0, sub_type = 0, gains = []}).

-record(battle_trigger,
        {name :: undefined | bitstring(),
         status = open :: open | close,
         event = [] :: [tuple()],
         vars = [] :: [tuple()],
         condition = [] :: [tuple()],
         action = [] :: list()}).

-record(tri_timer,
        {mode :: undefined | cycle | count,
         times = 0 :: integer(),
         timeout = 1000 :: pos_integer()}).

-record(cfg_act,
        {tpl :: undefined | atom(), cfg = [] :: list()}).

-record(tpl_act,
        {name = "" :: string(),
         type :: undefined | atom(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_cond,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_cond,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_evt,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_evt,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_val,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_val,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_unit,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_unit,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(point,
        {map = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(tpl_fun,
        {name :: undefined | atom(),
         return :: undefined | unit | point,
         args = [] :: [atom()],
         code = "" :: string(),
         mfa_code = "" :: string(),
         label = "" :: string(),
         desc = "" :: string()}).

-file("src/mod/friend/friend_wish_agent.erl", 40).

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

-file("src/mod/friend/friend_wish_agent.erl", 41).

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

-file("src/mod/friend/friend_wish_agent.erl", 42).

-record(state, {ts = 0, timeout = 0, camp_id = 0}).

start_link() ->
    gen_fsm:start_link({local, friend_wish_agent},
                       friend_wish_agent,
                       [],
                       []).

audit(Id, Plat, ZoneId, RoleId, RolePlat, RoleZoneId,
      State) ->
    friend_wish_agent !
        {audit,
         {Id, Plat, ZoneId},
         {RoleId, RolePlat, RoleZoneId},
         State},
    ok.

gm_audit(#role{id = RoleId}, Status) ->
    Spec = [{#friend_moment{_ = '_', rid = '$1',
                            type = '$2'},
             [{'andalso',
               {'=:=', '$1', {RoleId}},
               {'=:=', '$2', 2}}],
             ['$_']}],
    Moments = ets:select(friend_moment, Spec),
    [audit(Id,
           Plat,
           ZoneId,
           RId,
           RolePlat,
           RoleZoneId,
           Status)
     || #friend_moment{id = {Id, Plat, ZoneId},
                       rid = {RId, RolePlat, RoleZoneId}}
            <- Moments].

get_wish_list(GetCampId, Type) ->
    CampId = get_camp_id(),
    case GetCampId =:= CampId of
        true ->
            WishList = get_camp_wish_list(GetCampId, Type),
            {WishList, []};
        _ ->
            WishList = get_history_wishs(GetCampId, Type),
            LuckyWishIds = get_lucky_roles(GetCampId),
            {WishList, LuckyWishIds}
    end.

get_history_wishs() ->
    CurCampId = get_camp_id(),
    CampList = friend_wish_data:camp_list(),
    HisCampIds = [Cid || Cid <- CampList, Cid < CurCampId],
    [begin
         DefaultPlat = get_default_plat(),
         ThemeId = get_default_theme_id(CampId, DefaultPlat, 1),
         CampWishs =
             friend_circle:batch_query_moments([ThemeId]),
         {CampId, CampWishs}
     end
     || CampId <- HisCampIds].

get_camp_wish_list(_, 2) ->
    Key = friend_wish_moments,
    case erlang:get(Key) of
        L = [_ | _] -> friend_circle:list_moments(L, Key, 1);
        _ -> []
    end;
get_camp_wish_list(GetCampId, _) ->
    Key = friend_wish_moments,
    List = ets:tab2list(friend_moment_wish_audit),
    List1 = [{Id, Rid, Time}
             || #friend_moment_wish_audit{moment_id = Id,
                                          role_id = Rid, audit_time = Time,
                                          camp_id = CampId}
                    <- List,
                CampId =:= GetCampId],
    SortList = lists:reverse(lists:keysort(3, List1)),
    SortList1 = [{Id, Rid} || {Id, Rid, _} <- SortList],
    friend_circle:list_moments(SortList1, Key, 1).

get_history_wishs(_, 2) ->
    Key = friend_wish_his_moments,
    case erlang:get(Key) of
        L = [_ | _] -> friend_circle:list_moments(L, Key, 1);
        _ -> []
    end;
get_history_wishs(GetCampId, _) ->
    Key = friend_wish_his_moments,
    List = ets:tab2list(friend_moment_wish_audit),
    List1 = [{Id, Rid, RewardTitle}
             || #friend_moment_wish_audit{moment_id = Id,
                                          role_id = Rid, camp_id = Campid,
                                          reward_title = RewardTitle}
                    <- List,
                Campid =:= GetCampId],
    SortList = lists:reverse(lists:keysort(3, List1)),
    SortList1 = [{Id, Rid} || {Id, Rid, _} <- SortList],
    friend_circle:list_moments(SortList1, Key, 1).

get_lantern_content(_CampId) ->
    List =
        lists:sublist(ets:tab2list(friend_moment_wish_lantern),
                      50),
    Fun = fun ({_, Content}, {Num, Rtn}) when Num >= 0 ->
                  {Num - 1, [Content | Rtn]};
              (_, Rtn) -> Rtn
          end,
    ets:foldl(Fun, {50, []}, friend_moment_wish_lantern),
    [Content || {_, Content} <- List].

open_wish(Role) ->
    case var:get_var(Role, other, 2120, 0) of
        X when X =< 1 ->
            role:pack_send(Role, 11895, {1, lang:get("")}),
            ok;
        _ ->
            Gain = format:val_to_gain([{70129, 1}]),
            case role_gain:do_notice(Gain, Role) of
                {ok, GainRole} ->
                    NewRole = var:set_var(GainRole, other, 2120, 1),
                    {ok, NewRole};
                _ ->
                    Title = lang:get("庆典欢庆奖励"),
                    Content = lang:get("由于您的背包已满,奖励通过邮件发放"),
                    mail:send(Role, Title, Content, [{70129, 1}]),
                    NewRole = var:set_var(Role, other, 2120, 1),
                    {ok, NewRole}
            end
    end.

login(Role = #role{}) ->
    case var:get_var(Role, other, 2120, 0) of
        1 -> ok;
        _ ->
            NewRole = var:set_var(Role, other, 2120, 1),
            {ok, NewRole}
    end.

init([]) ->
    logger:info("庆典寄语启动中....", [], friend_wish_agent, 238),
    dets:open_file(friend_moment_wishs,
                   [{file, "./dets/friend_moment_wishs.dets"},
                    {keypos, 1}]),
    ets:new(friend_moment_wishs,
            [set, named_table, public, {keypos, 1}]),
    dets:to_ets(friend_moment_wishs, friend_moment_wishs),
    dets:open_file(friend_moment_wish_audit,
                   [{file, "./dets/friend_wish_audit.dets"},
                    {keypos, #friend_moment_wish_audit.moment_id}]),
    ets:new(friend_moment_wish_audit,
            [set,
             named_table,
             public,
             {keypos, #friend_moment_wish_audit.moment_id}]),
    dets:to_ets(friend_moment_wish_audit,
                friend_moment_wish_audit),
    dets:open_file(friend_moment_wish_lantern,
                   [{file, "./dets/friend_moment_wish_lantern.dets"},
                    {keypos, 1}]),
    ets:new(friend_moment_wish_lantern,
            [set, named_table, public, {keypos, 1}]),
    dets:to_ets(friend_moment_wish_lantern,
                friend_moment_wish_lantern),
    CampId = get_camp_id(),
    case CampId =/= 0 of
        true -> init_sys_wish();
        _ -> ok
    end,
    {StateName, TimeOut} = get_state(),
    State = #state{ts = erlang:now(), timeout = TimeOut,
                   camp_id = CampId},
    case StateName of
        active -> init_npc(CampId);
        _ -> ok
    end,
    logger:info("庆典寄语启动完成....", [], friend_wish_agent, 275),
    {ok, StateName, State, TimeOut}.

handle_event({deliver_moment, Moment, _Photos},
             StateName, State) ->
    save_role_wish(Moment),
    CampId = get_camp_id(),
    case is_local_moment(Moment) of
        true ->
            Theme = case friend_wish_data:get_theme_info(CampId) of
                        #{theme := _Theme} -> _Theme;
                        _ -> lang:get("周年庆祝福")
                    end,
            IsPhoto = case _Photos of
                          [_ | _] -> 1;
                          _ -> 0
                      end,
            save_mysql_wish(Moment, CampId, Theme, 0, IsPhoto);
        _ -> ok
    end,
    continue(StateName, State);
handle_event(_Event, StateName, State) ->
    logger:info("收到未处理的协议:~w",
                [_Event],
                friend_wish_agent,
                302),
    continue(StateName, State).

handle_sync_event(_Event, _From, StateName, State) ->
    logger:info("收到未处理的协议:~w, 发送方:~w",
                [_Event, _From],
                friend_wish_agent,
                306),
    Reply = ok,
    continue(StateName, Reply, State).

handle_info(reload, StateName, State) ->
    CampId = get_camp_id(),
    init_npc(CampId),
    reload_sys_wish(),
    {NewStateName, TimeOut} = get_state(),
    logger:info("星辰主题活动重载:由~w状态切换为~w",
                [StateName, NewStateName],
                friend_wish_agent,
                316),
    NewState = State#state{ts = erlang:now(),
                           timeout = TimeOut, camp_id = CampId},
    continue(NewStateName, NewState);
handle_info({audit,
             {Id, Plat, ZoneId},
             {_RoleId, _RolePlat, _RoleZoneId},
             Status},
            StateName = active, State) ->
    update_mysql_wish(Id, Plat, ZoneId, Status),
    case friend_circle:fetch(friend_moment,
                             {Id, Plat, ZoneId})
        of
        [FM = #friend_moment{}] ->
            big_world:cast(all,
                           erlang,
                           send,
                           [friend_wish_agent, {audit_cross, FM, Status}]);
        _ -> ok
    end,
    continue(StateName, State);
handle_info({audit_cross,
             #friend_moment{id = MId = {Id, Plat, Zone}, rid = Rid,
                            name = Name, content = Content},
             Status},
            StateName = active, State) ->
    case role_misc:is_local_role(Rid) of
        true ->
            case Status =:= 1 orelse Status =:= 2 of
                true ->
                    MailTitle = lang:get("朋友圈上首页啦！"),
                    MailContent =
                        lang:get("恭喜您的朋友圈内容通过审核，已成功登上首页，快去看看吧^_^"),
                    mail:send(Rid, MailTitle, MailContent);
                _ -> ok
            end;
        _ -> ok
    end,
    Now = date:unixtime(),
    case Status of
        0 ->
            remove_ets_wish({Id, Plat, Zone}),
            ok;
        1 -> update_ets_wish(MId, Rid, Now);
        2 ->
            update_ets_wish(MId, Rid, Now),
            ServerName = case
                             server_list_data:get_server_name({Plat, Zone})
                             of
                             _ServerName when is_list(_ServerName) ->
                                 _ServerName;
                             _ -> lang:get("神秘大陆")
                         end,
            Content1 = notice:format(lang:get("~ts ~ts:\n~ts"),
                                     [{role_2, ServerName},
                                      {role_2, Name},
                                      {string_1, Content}]),
            update_ets_lantern({{Id, Plat, Zone}, Content1});
        4 ->
            ServerName = case
                             server_list_data:get_server_name({Plat, Zone})
                             of
                             _ServerName when is_list(_ServerName) ->
                                 _ServerName;
                             _ -> lang:get("神秘大陆")
                         end,
            Content1 = notice:format(lang:get("~ts ~ts:\n~ts"),
                                     [{role_2, ServerName},
                                      {role_2, Name},
                                      {string_1, Content}]),
            update_ets_lantern({{Id, Plat, Zone}, Content1});
        _ -> remove_ets_wish({Id, Plat, Zone})
    end,
    continue(StateName, State);
handle_info({send_lucky_reward,
             RoleId,
             MomentId,
             CampId},
            StateName, State) ->
    logger:debug("对玩家发送幸运奖励:~w",
                 [{RoleId, MomentId, CampId}],
                 friend_wish_agent,
                 390),
    case role_misc:is_local_role(RoleId) of
        true ->
            case friend_wish_data:get_lucky_reward(CampId) of
                #{title := Title, content := Content,
                  reward := Reward} ->
                    mail:send(RoleId, Title, Content, Reward);
                _ -> ok
            end;
        _ -> ok
    end,
    case lookup_audit(MomentId) of
        {ok, F} ->
            NewF = F#friend_moment_wish_audit{reward_title = 999},
            update_ets_wish(NewF);
        _ -> ok
    end,
    continue(StateName, State);
handle_info(_Info, StateName, State) ->
    logger:info("收到未知消息:~w",
                [_Info],
                friend_wish_agent,
                411),
    continue(StateName, State).

terminate(_Reason, _StateName, _State) -> ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

idle(timeout, State) ->
    CampId = get_camp_id(),
    init_npc(CampId),
    init_sys_wish(),
    {_StateName, TimeOut} = get_state(),
    logger:info("庆典寄语进程从~w切换到:~w",
                [idle, {active, TimeOut}],
                friend_wish_agent,
                427),
    NewState = State#state{ts = erlang:now(),
                           timeout = TimeOut, camp_id = CampId},
    continue(active, NewState).

active(timeout, State = #state{camp_id = CampId}) ->
    remove_npc(CampId),
    send_reward(CampId),
    ets:delete_all_objects(friend_moment_wishs),
    dets:delete_all_objects(friend_moment_wishs),
    logger:info("庆典寄语进程从~w切换到",
                [clean],
                friend_wish_agent,
                446),
    NewState = State#state{ts = erlang:now(),
                           timeout = 2 * 86400 * 1000},
    continue(clean, NewState).

clean(timeout, State) ->
    ets:delete_all_objects(friend_moment_wish_lantern),
    dets:delete_all_objects(friend_moment_wish_lantern),
    {_StateName, TimeOut} = get_state(),
    logger:info("庆典寄语进程从~w切换到:~w",
                [clean, {idle, TimeOut}],
                friend_wish_agent,
                461),
    NewState = State#state{ts = erlang:now(),
                           timeout = TimeOut, camp_id = 0},
    continue(idle, NewState).

deault_sys_id() ->
    case {env:get(platform), env:get(zone_id)} of
        {"local", 1} -> {0, "local", 1};
        {"dev", 1} -> {0, "dev", 1};
        _ -> {0, "ios", 1}
    end.

delete_init_photo() ->
    Mid = deault_sys_id(),
    DeleteFlag = case {env:get(platform), env:get(zone_id)}
                     of
                     {"local", 1} -> true;
                     {"dev", 1} -> true;
                     {"ios", 1} -> true;
                     _ -> false
                 end,
    case DeleteFlag of
        true ->
            case friend_circle:fetch(friend_moment, Mid) of
                [Moment = #friend_moment{}] ->
                    Photos = friend_circle:fetch(friend_moment_photo, Mid),
                    [friend_circle:delete(Photo) || Photo <- Photos],
                    friend_circle:delete(Moment);
                _ -> ok
            end;
        _ -> ok
    end.

get_state() ->
    Now = date:unixtime(),
    case campaign_mgr:get_camp_time(60051) of
        {StartTime, EndTime} ->
            case Now >= StartTime andalso Now =< EndTime of
                false ->
                    TimeOut = if Now < StartTime ->
                                     (StartTime - Now) * 1000;
                                 true -> infinity
                              end,
                    {idle, TimeOut};
                _ ->
                    TimeOut = EndTime - Now,
                    {active, TimeOut * 1000}
            end;
        _ -> {idle, infinity}
    end.

init_sys_wish() ->
    Now = date:unixtime(),
    case get_camp_id() of
        CampId when CampId =/= 0 ->
            DefaultPlat = get_default_plat(),
            ThemeId = get_default_theme_id(CampId, DefaultPlat, 1),
            case lookup_audit(ThemeId) of
                {ok, _} -> ok;
                _ ->
                    case friend_wish_data:get_theme_info(CampId) of
                        #{npc_name := NpcName, content := Content} ->
                            Moment = #friend_moment{name = NpcName, sex = 0,
                                                    ctime = Now, type = 3,
                                                    content = Content},
                            {Photos, Thumbs} = {[], []},
                            case {env:get(platform), env:get(zone_id)} of
                                {DefaultPlat, 1} ->
                                    InitMoment = Moment#friend_moment{id =
                                                                          ThemeId,
                                                                      rid =
                                                                          ThemeId},
                                    catch ets:insert(friend_moment, InitMoment),
                                    catch dets:insert(friend_moment,
                                                      InitMoment),
                                    friend_circle:save_photos(Photos,
                                                              Thumbs,
                                                              InitMoment);
                                _ -> ok
                            end,
                            DefaultAuditMoment =
                                #friend_moment_wish_audit{moment_id = ThemeId,
                                                          role_id = ThemeId,
                                                          audit_time = Now,
                                                          camp_id = CampId},
                            ets:insert(friend_moment_wish_audit,
                                       DefaultAuditMoment),
                            dets:insert(friend_moment_wish_audit,
                                        DefaultAuditMoment),
                            ok;
                        _ -> ok
                    end
            end;
        _ -> ok
    end.

init_npc(CampId) ->
    case friend_wish_data:get_wish_npc(CampId) of
        Data = [_ | _] ->
            [unit_mgr:create({59, NpcId + 1000000 * Index},
                             NpcId,
                             {MapId, X, Y})
             || #{unit_id := NpcId, index := Index, map_id := MapId,
                  pos_x := X, pos_y := Y}
                    <- Data];
        _ -> ok
    end.

remove_npc(CampId) ->
    case friend_wish_data:get_wish_npc(CampId) of
        Data = [_ | _] ->
            [unit_mgr:remove({59, NpcId + 1000000 * Index})
             || #{unit_id := NpcId, index := Index} <- Data];
        _ -> ok
    end.

gm_clean_data() ->
    CampId = get_camp_id(),
    remove_npc(CampId),
    delete_init_photo(),
    ets:delete_all_objects(friend_moment_wishs),
    dets:delete_all_objects(friend_moment_wishs),
    ets:delete_all_objects(friend_moment_wish_audit),
    dets:delete_all_objects(friend_moment_wish_audit),
    ets:delete_all_objects(friend_moment_wish_lantern),
    dets:delete_all_objects(friend_moment_wish_lantern),
    ok.

reload() -> friend_wish_agent ! reload.

send_reward(CampId) ->
    case get_lucky_roles(CampId) of
        [] ->
            send_title_reward(CampId),
            send_wish_reward(CampId),
            send_lucky_reward(CampId),
            update_reward_tile();
        _ -> ok
    end.

send_wish_reward(CampId) ->
    Fun = fun ({_MomentId, RoleId}, ResultL) ->
                  case role_misc:is_local_role(RoleId) of
                      true -> lists:keystore(RoleId, 1, ResultL, {RoleId, 0});
                      _ -> ResultL
                  end
          end,
    RoleList = ets:foldl(Fun, [], friend_moment_wishs),
    logger:debug("玩家列表~w",
                 [RoleList],
                 friend_wish_agent,
                 640),
    [begin
         case friend_wish_data:get_coment_reward({CampId, 0}) of
             {Title, Content, L = [_ | _]} ->
                 Count = ets:select_count(friend_moment_wish_audit,
                                          [{#friend_moment_wish_audit{role_id =
                                                                          '$1',
                                                                      _ = '_'},
                                            [],
                                            [{'=:=', '$1', {RoleId}}]}]),
                 case Count =< 0 of
                     true -> mail:send(RoleId, Title, Content, L);
                     _ -> ok
                 end;
             _ -> ok
         end
     end
     || {RoleId, _} <- RoleList].

send_title_reward(CampId) ->
    Fun = fun (#friend_moment_wish_audit{moment_id =
                                             MomentId,
                                         role_id = RoleId,
                                         camp_id = AuditCampId},
               ResultL)
                  when AuditCampId =:= CampId ->
                  case role_misc:is_local_role(RoleId) of
                      true ->
                          case friend_circle:fetch(friend_moment, MomentId) of
                              [#friend_moment{}] ->
                                  CommentCount =
                                      ets:select_count(friend_comment,
                                                       [{#friend_comment{ver =
                                                                             '_',
                                                                         id =
                                                                             '_',
                                                                         moment_id
                                                                             =
                                                                             '$1',
                                                                         rid =
                                                                             '_',
                                                                         name =
                                                                             '_',
                                                                         sex =
                                                                             '_',
                                                                         classes
                                                                             =
                                                                             '_',
                                                                         msg =
                                                                             '_',
                                                                         mentions
                                                                             =
                                                                             '_',
                                                                         ctime =
                                                                             '_'},
                                                         [],
                                                         [{'=:=',
                                                           '$1',
                                                           {MomentId}}]}]),
                                  LikeCount =
                                      ets:select_count(friend_moment_like,
                                                       [{#friend_moment_like{_ =
                                                                                 '_',
                                                                             moment_id
                                                                                 =
                                                                                 '$1'},
                                                         [{'=:=',
                                                           '$1',
                                                           {MomentId}}],
                                                         [true]}]),
                                  TitleLev =
                                      friend_wish_data:get_title_lev(CampId,
                                                                     LikeCount,
                                                                     CommentCount),
                                  case lists:keyfind(RoleId, 1, ResultL) of
                                      {RoleId, _, OldLev} ->
                                          case TitleLev > OldLev of
                                              true ->
                                                  lists:keystore(RoleId,
                                                                 1,
                                                                 ResultL,
                                                                 {RoleId,
                                                                  MomentId,
                                                                  max(OldLev,
                                                                      TitleLev)});
                                              _ -> ResultL
                                          end;
                                      _ ->
                                          lists:keystore(RoleId,
                                                         1,
                                                         ResultL,
                                                         {RoleId,
                                                          MomentId,
                                                          TitleLev})
                                  end;
                              _ -> ResultL
                          end;
                      _ -> ResultL
                  end;
              (_, ResultL) -> ResultL
          end,
    RoleList = ets:foldl(Fun, [], friend_moment_wish_audit),
    [begin
         case friend_wish_data:get_coment_reward({CampId,
                                                  TitleLev})
             of
             {Title, Content, RwL = [_ | _]} ->
                 mail:send(RoleId, Title, Content, RwL);
             _ -> ok
         end
     end
     || {RoleId, _MomentId, TitleLev} <- RoleList].

send_lucky_reward(CampId) ->
    logger:debug("进行抽奖=======:~w",
                 [CampId],
                 friend_wish_agent,
                 692),
    DefaultPlat = get_default_plat(),
    case {env:get(platform), env:get(zone_id)} of
        {DefaultPlat, 1} ->
            DefaultMomentId = get_default_theme_id(CampId,
                                                   DefaultPlat,
                                                   1),
            MomentIds = [MomentId
                         || #friend_moment_wish_audit{moment_id = MomentId,
                                                      camp_id = FwCampId}
                                <- ets:tab2list(friend_moment_wish_audit),
                            MomentId =/= DefaultMomentId, FwCampId =:= CampId],
            MomentInfos =
                friend_circle:batch_query_moments(MomentIds),
            logger:debug("参与抽奖的朋友圈id:~w",
                         [MomentInfos],
                         friend_wish_agent,
                         701),
            RoleFun = fun ({#friend_moment{id = MomentId,
                                           rid = RoleId, likes = Likes},
                            Comments,
                            _},
                           Rtn) ->
                              LickCount = erlang:length(Likes),
                              CommentCount = erlang:length(Comments),
                              Score = LickCount * 1 + CommentCount * 1,
                              case lists:keyfind(RoleId, 1, Rtn) of
                                  {RoleId, _, OldSc} when Score > OldSc ->
                                      lists:keystore(RoleId,
                                                     1,
                                                     Rtn,
                                                     {RoleId, MomentId, Score});
                                  {_, _, _} -> Rtn;
                                  _ -> [{RoleId, MomentId, Score} | Rtn]
                              end
                      end,
            RoleScList = lists:foldl(RoleFun, [], MomentInfos),
            #{score := JoinScore} =
                friend_wish_data:get_lucky_reward(CampId),
            [Data
             || Data = {_, _, Sc} <- RoleScList, Sc >= JoinScore],
            logger:debug("参与抽奖的朋友圈id:~w",
                         [RoleScList],
                         friend_wish_agent,
                         719),
            SortDescList = lists:reverse(lists:keysort(3,
                                                       RoleScList)),
            case friend_wish_data:get_lucky_reward(CampId) of
                #{range := Range, num := Num} ->
                    RandList = lists:sublist(SortDescList, Range),
                    case catch util:rand_list_n(RandList, Num) of
                        RandResult when is_list(RandResult) ->
                            [begin
                                 big_world:cast(all,
                                                erlang,
                                                send,
                                                [friend_wish_agent,
                                                 {send_lucky_reward,
                                                  RoleId,
                                                  MomentId,
                                                  CampId}])
                             end
                             || {RoleId, MomentId, _} <- RandResult];
                        _ -> ok
                    end
            end;
        _ -> ok
    end.

continue(StateName,
         State = #state{timeout = infinity}) ->
    {next_state, StateName, State, infinity};
continue(StateName,
         State = #state{ts = Ts, timeout = Tidle}) ->
    {next_state,
     StateName,
     State,
     util:time_left(Tidle, Ts)}.

continue(Reply, StateName,
         State = #state{timeout = infinity}) ->
    {reply, Reply, StateName, State, infinity};
continue(StateName, Reply,
         State = #state{ts = Ts, timeout = Tidle}) ->
    {reply,
     Reply,
     StateName,
     State,
     util:time_left(Tidle, Ts)}.

save_role_wish(#friend_moment{id = Mid, rid = RoleId,
                              type = 2}) ->
    ets:insert(friend_moment_wishs, {Mid, RoleId}),
    dets:insert(friend_moment_wishs, {Mid, RoleId});
save_role_wish(_Else) -> ok.

lookup_audit(MomentId) ->
    case catch ets:lookup(friend_moment_wish_audit,
                          MomentId)
        of
        [F = #friend_moment_wish_audit{}] -> {ok, F};
        _ -> false
    end.

update_ets_wish(MomentId, RoleId, Time) ->
    CampId = get_camp_id(),
    AuditWish = #friend_moment_wish_audit{moment_id =
                                              MomentId,
                                          role_id = RoleId, audit_time = Time,
                                          camp_id = CampId},
    ets:insert(friend_moment_wish_audit, AuditWish),
    dets:insert(friend_moment_wish_audit, AuditWish),
    ok.

update_ets_wish(AuditWish) ->
    ets:insert(friend_moment_wish_audit, AuditWish),
    dets:insert(friend_moment_wish_audit, AuditWish),
    ok.

update_ets_lantern(Data) ->
    ets:insert(friend_moment_wish_lantern, Data),
    dets:insert(friend_moment_wish_lantern, Data),
    ok.

remove_ets_wish(MomentId) ->
    ets:delete(friend_moment_wish_audit, MomentId),
    dets:delete(friend_moment_wish_audit, MomentId),
    ok.

update_wish_reward_lev(MomentId, RewardTitle) ->
    case catch ets:lookup(friend_moment_wish_audit,
                          MomentId)
        of
        [WA = #friend_moment_wish_audit{reward_title =
                                            OldTitleLev}]
            when OldTitleLev =/= 999 ->
            NewWA = WA#friend_moment_wish_audit{reward_title =
                                                    RewardTitle},
            update_ets_wish(NewWA);
        _ -> ok
    end.

save_mysql_wish(#friend_moment{id = {Mid, Plat, ZoneId},
                               rid = {RoleId, RolePlat, RoleZoneId},
                               ctime = Time, name = Name, content = Content},
                CampId, Theme, State, IsPhoto) ->
    Sql = "replace into friend_moment_wish(id, "
          "platform, zone_id, role_id, role_platform, "
          "role_zone_id, time, lev, name, camp_id, "
          "theme, content, is_photo, state) values(?, "
          "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
          "?)",
    db:exec(Sql,
            [Mid,
             Plat,
             ZoneId,
             RoleId,
             RolePlat,
             RoleZoneId,
             Time,
             1,
             Name,
             CampId,
             Theme,
             Content,
             IsPhoto,
             State]).

update_mysql_wish(Id, Plat, ZoneId, State) ->
    Sql = "update friend_moment_wish set state "
          "= ? where id = ? and platform = ? and "
          "zone_id = ?",
    db:exec(Sql, [State, Id, Plat, ZoneId]),
    ok.

is_local_moment(#friend_moment{id = Id}) ->
    role_misc:is_local_role(Id);
is_local_moment(_) -> false.

lookup_batch_moment(MomentIds) ->
    lookup_batch_moment(MomentIds, []).

lookup_batch_moment([], Result) -> {ok, Result};
lookup_batch_moment([MomentId | Rest], Result) ->
    case friend_circle:fetch(friend_moment, MomentId) of
        [Fm] ->
            NewResult = [Fm | Result],
            lookup_batch_moment(Rest, NewResult);
        _ -> lookup_batch_moment(Rest, Result)
    end.

get_camp_id() ->
    case campaign_mgr:get_camp_info(60051) of
        #camp_cache{id = Id} -> Id;
        _ -> 0
    end.

get_default_theme_id(CampId, Platform, ZoneId) ->
    ThemeId = 10000000 + CampId,
    {ThemeId, Platform, ZoneId}.

get_default_plat() ->
    case env:get(platform) of
        "local" -> "local";
        "dev" -> "dev";
        "beta" -> "ios";
        "mix" -> "ios";
        "ios" -> "ios";
        "unite" -> "ios";
        "test" -> "test";
        "tw" -> "tw";
        "eyou" -> "eyou";
        "th" -> "th";
        "enap" -> "enap";
        "enus" -> "enus";
        "eneu" -> "eneu";
        "korea" -> "korea";
        "camp" -> "camp";
        _ -> "ios"
    end.

get_lucky_roles(CampId) ->
    Title = 999,
    Spec = [{#friend_moment_wish_audit{_ = '_',
                                       reward_title = '$1', camp_id = '$2'},
             [{'andalso',
               {'=:=', '$1', Title},
               {'=:=', '$2', CampId}}],
             ['$_']}],
    LuckyWishs = ets:select(friend_moment_wish_audit, Spec),
    [Id
     || #friend_moment_wish_audit{moment_id = Id}
            <- LuckyWishs].

update_reward_tile() ->
    List = ets:tab2list(friend_moment_wish_audit),
    MomentIds = [Mid
                 || #friend_moment_wish_audit{moment_id = Mid} <- List],
    MomentInfos =
        friend_circle:batch_query_moments(MomentIds),
    RoleFun = fun ({#friend_moment{id = MomentId,
                                   likes = Likes},
                    _Comments,
                    _},
                   _) ->
                      LickCount = erlang:length(Likes),
                      Score = LickCount * 1,
                      update_wish_reward_lev(MomentId, Score);
                  (_, _) -> ok
              end,
    lists:foldl(RoleFun, ok, MomentInfos).

reload_sys_wish() ->
    Now = date:unixtime(),
    case get_camp_id() of
        CampId when CampId =/= 0 ->
            DefaultPlat = get_default_plat(),
            ThemeId = get_default_theme_id(CampId, DefaultPlat, 1),
            case lookup_audit(ThemeId) of
                {ok, #friend_moment_wish_audit{}} ->
                    case friend_wish_data:get_theme_info(CampId) of
                        #{npc_name := NpcName, content := Content} ->
                            {Photos, Thumbs} = {[], []},
                            case {env:get(platform), env:get(zone_id)} of
                                {DefaultPlat, 1} ->
                                    case friend_circle:fetch(friend_moment,
                                                             {ThemeId,
                                                              DefaultPlat,
                                                              1})
                                        of
                                        [FM = #friend_moment{}] ->
                                            NFM = FM#friend_moment{name =
                                                                       NpcName,
                                                                   content =
                                                                       Content},
                                            catch ets:insert(friend_moment,
                                                             NFM),
                                            catch dets:insert(friend_moment,
                                                              NFM),
                                            friend_circle:save_photos(Photos,
                                                                      Thumbs,
                                                                      NFM);
                                        _ -> ok
                                    end;
                                _ -> ok
                            end
                    end;
                _ ->
                    case friend_wish_data:get_theme_info(CampId) of
                        #{npc_name := NpcName, content := Content} ->
                            Moment = #friend_moment{name = NpcName, sex = 0,
                                                    ctime = Now, type = 3,
                                                    content = Content},
                            {Photos, Thumbs} = {[], []},
                            case {env:get(platform), env:get(zone_id)} of
                                {DefaultPlat, 1} ->
                                    InitMoment = Moment#friend_moment{id =
                                                                          ThemeId,
                                                                      rid =
                                                                          ThemeId},
                                    catch ets:insert(friend_moment, InitMoment),
                                    catch dets:insert(friend_moment,
                                                      InitMoment),
                                    friend_circle:save_photos(Photos,
                                                              Thumbs,
                                                              InitMoment);
                                _ -> ok
                            end,
                            DefaultAuditMoment =
                                #friend_moment_wish_audit{moment_id = ThemeId,
                                                          role_id = ThemeId,
                                                          audit_time = Now,
                                                          camp_id = CampId},
                            ets:insert(friend_moment_wish_audit,
                                       DefaultAuditMoment),
                            dets:insert(friend_moment_wish_audit,
                                        DefaultAuditMoment),
                            ok;
                        _ -> ok
                    end
            end;
        _ -> ok
    end.

