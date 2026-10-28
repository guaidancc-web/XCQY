-file("src/proto/proto_118.erl", 1).

-module(proto_118).

-export([pack/3, unpack/3]).

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

-file("src/proto/proto_118.erl", 14).

-file("inc/protocol.hrl", 1).

-record(module,
        {code :: undefined | pos_integer(),
         type :: undefined | game_server | monitor | tester,
         need_auth = true :: boolean(),
         caller = connector :: connector | object,
         module :: undefined | atom(),
         desc = "" :: string()}).

-record(rpc,
        {code = 0 :: non_neg_integer(),
         disable = false :: boolean(),
         autolog = false :: boolean(),
         autozip = false :: boolean(),
         condition = [] :: [tuple()],
         log_title :: undefined | string(),
         req_desc ::
             undefined |
             string() |
             {string(), [atom()]} |
             {atom(), atom(), tuple()},
         req = [] :: {atom(), [tuple()]} | [tuple()],
         reply_desc ::
             undefined |
             string() |
             {string(), [atom()]} |
             {atom(), atom(), tuple()},
         reply = [] :: {atom(), [tuple()]} | [tuple()],
         parser :: undefined | atom(),
         mod :: undefined | atom(),
         can_cache = true :: boolean()}).

-file("src/proto/proto_118.erl", 15).

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

-file("src/proto/proto_118.erl", 16).

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

-file("src/proto/proto_118.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 11800, {}) ->
    {ok, <<2:32/little, 11800:16/little>>};
pack(srv, 11800,
     {#m_friend{signature = V0_signature, fans = V0_fans,
                glamor = V0_glamor, offline_push = V0_offline_push},
      V0_max_num}) ->
    D_a_t_a = <<(protocol:pack(string,
                               V0_signature))/binary,
                V0_fans:16/little, V0_glamor:32/little,
                V0_offline_push:8/little, V0_max_num:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11800:16/little,
       D_a_t_a/binary>>};
pack(cli, 11801, {}) ->
    {ok, <<2:32/little, 11801:16/little>>};
pack(srv, 11801, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little, V1_type:8/little,
                                   V1_intimacy:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_online:8/little, V1_sex:8/little,
                                   V1_classes:8/little, V1_lev:8/little,
                                   V1_fc:32/little, V1_total_fc:32/little,
                                   V1_face:32/little, V1_glamor:32/little,
                                   (protocol:pack(string, V1_signature))/binary,
                                   (protocol:pack(string, V1_city))/binary,
                                   V1_online_time:32/little,
                                   (protocol:pack(string, V1_guild))/binary,
                                   (length(V1_looks)):16/little,
                                   (list_to_binary([<<V2_looks_type:32/little,
                                                      V2_looks_mode:32/little,
                                                      V2_looks_val:32/little,
                                                      (protocol:pack(string,
                                                                     V2_looks_str))/binary>>
                                                    || {V2_looks_type,
                                                        V2_looks_mode,
                                                        V2_looks_val,
                                                        V2_looks_str}
                                                           <- V1_looks]))/binary,
                                   V1_offline_push:8/little>>
                                 || {#friendship{id =
                                                     {V1_id,
                                                      V1_platform,
                                                      V1_zone_id},
                                                 type = V1_type,
                                                 intimacy = V1_intimacy},
                                     #friend_role{name = V1_name,
                                                  online = V1_online,
                                                  sex = V1_sex,
                                                  classes = V1_classes,
                                                  lev = V1_lev, fc = V1_fc,
                                                  total_fc = V1_total_fc,
                                                  face = V1_face,
                                                  glamor = V1_glamor,
                                                  signature = V1_signature,
                                                  city = V1_city,
                                                  online_time = V1_online_time,
                                                  guild = V1_guild,
                                                  looks = V1_looks,
                                                  offline_push =
                                                      V1_offline_push}}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11801:16/little,
       D_a_t_a/binary>>};
pack(cli, 11802, {}) ->
    {ok, <<2:32/little, 11802:16/little>>};
pack(srv, 11802, {V0_type, V0_list}) ->
    D_a_t_a = <<V0_type:8/little,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little, V1_type:8/little,
                                   V1_intimacy:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_online:8/little, V1_sex:8/little,
                                   V1_classes:8/little, V1_lev:8/little,
                                   V1_fc:32/little, V1_total_fc:32/little,
                                   V1_face:32/little, V1_glamor:32/little,
                                   (protocol:pack(string, V1_signature))/binary,
                                   (protocol:pack(string, V1_city))/binary,
                                   V1_online_time:32/little,
                                   (protocol:pack(string, V1_guild))/binary,
                                   (length(V1_looks)):16/little,
                                   (list_to_binary([<<V2_looks_type:32/little,
                                                      V2_looks_mode:32/little,
                                                      V2_looks_val:32/little,
                                                      (protocol:pack(string,
                                                                     V2_looks_str))/binary>>
                                                    || {V2_looks_type,
                                                        V2_looks_mode,
                                                        V2_looks_val,
                                                        V2_looks_str}
                                                           <- V1_looks]))/binary,
                                   V1_offline_push:8/little>>
                                 || {#friendship{id =
                                                     {V1_id,
                                                      V1_platform,
                                                      V1_zone_id},
                                                 type = V1_type,
                                                 intimacy = V1_intimacy},
                                     #friend_role{name = V1_name,
                                                  online = V1_online,
                                                  sex = V1_sex,
                                                  classes = V1_classes,
                                                  lev = V1_lev, fc = V1_fc,
                                                  total_fc = V1_total_fc,
                                                  face = V1_face,
                                                  glamor = V1_glamor,
                                                  signature = V1_signature,
                                                  city = V1_city,
                                                  online_time = V1_online_time,
                                                  guild = V1_guild,
                                                  looks = V1_looks,
                                                  offline_push =
                                                      V1_offline_push}}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11802:16/little,
       D_a_t_a/binary>>};
pack(cli, 11803, {V0_signature}) ->
    D_a_t_a = <<(protocol:pack(string,
                               V0_signature))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11803:16/little,
       D_a_t_a/binary>>};
pack(srv, 11803, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11803:16/little,
       D_a_t_a/binary>>};
pack(cli, 11804, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11804:16/little,
       D_a_t_a/binary>>};
pack(srv, 11804, {}) ->
    {ok, <<2:32/little, 11804:16/little>>};
pack(cli, 11805,
     {V0_flag, V0_name, V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_name))/binary,
                V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11805:16/little,
       D_a_t_a/binary>>};
pack(srv, 11805, {}) ->
    {ok, <<2:32/little, 11805:16/little>>};
pack(cli, 11806, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11806:16/little,
       D_a_t_a/binary>>};
pack(srv, 11806, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11806:16/little,
       D_a_t_a/binary>>};
pack(cli, 11807, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11807:16/little,
       D_a_t_a/binary>>};
pack(srv, 11807, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11807:16/little,
       D_a_t_a/binary>>};
pack(cli, 11808, {V0_name}) ->
    D_a_t_a = <<(protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11808:16/little,
       D_a_t_a/binary>>};
pack(srv, 11808,
     #role_info{id = V0_id, platform = V0_platform,
                zone_id = V0_zone_id, name = V0_name, sex = V0_sex,
                classes = V0_classes, lev = V0_lev, fc = V0_fc,
                guild = V0_guild}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_sex:8/little, V0_classes:8/little, V0_lev:8/little,
                V0_fc:16/little,
                (protocol:pack(string, V0_guild))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11808:16/little,
       D_a_t_a/binary>>};
pack(cli, 11809, {}) ->
    {ok, <<2:32/little, 11809:16/little>>};
pack(srv, 11809,
     {#friend_request{id = {V0_id, V0_platform, V0_zone_id},
                      name = V0_name, sex = V0_sex, classes = V0_classes,
                      lev = V0_lev, fc = V0_fc, total_fc = V0_total_fc,
                      face = V0_face}}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_sex:8/little, V0_classes:8/little, V0_lev:8/little,
                V0_fc:32/little, V0_total_fc:32/little,
                V0_face:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11809:16/little,
       D_a_t_a/binary>>};
pack(cli, 11810, {}) ->
    {ok, <<2:32/little, 11810:16/little>>};
pack(srv, 11810, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_online:8/little, V1_sex:8/little,
                                   V1_classes:8/little, V1_lev:8/little,
                                   V1_fc:32/little, V1_total_fc:32/little,
                                   V1_face:32/little, V1_glamor:32/little,
                                   (protocol:pack(string, V1_signature))/binary,
                                   (protocol:pack(string, V1_city))/binary,
                                   V1_online_time:32/little,
                                   (protocol:pack(string, V1_guild))/binary,
                                   (length(V1_looks)):16/little,
                                   (list_to_binary([<<V2_looks_type:32/little,
                                                      V2_looks_mode:32/little,
                                                      V2_looks_val:32/little,
                                                      (protocol:pack(string,
                                                                     V2_looks_str))/binary>>
                                                    || {V2_looks_type,
                                                        V2_looks_mode,
                                                        V2_looks_val,
                                                        V2_looks_str}
                                                           <- V1_looks]))/binary,
                                   V1_offline_push:8/little>>
                                 || #friend_role{id =
                                                     {V1_id,
                                                      V1_platform,
                                                      V1_zone_id},
                                                 name = V1_name,
                                                 online = V1_online,
                                                 sex = V1_sex,
                                                 classes = V1_classes,
                                                 lev = V1_lev, fc = V1_fc,
                                                 total_fc = V1_total_fc,
                                                 face = V1_face,
                                                 glamor = V1_glamor,
                                                 signature = V1_signature,
                                                 city = V1_city,
                                                 online_time = V1_online_time,
                                                 guild = V1_guild,
                                                 looks = V1_looks,
                                                 offline_push = V1_offline_push}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11810:16/little,
       D_a_t_a/binary>>};
pack(cli, 11811, {}) ->
    {ok, <<2:32/little, 11811:16/little>>};
pack(srv, 11811, {V0_friend_request}) ->
    D_a_t_a = <<(length(V0_friend_request)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:8/little, V1_fc:32/little,
                                   V1_total_fc:32/little, V1_face:32/little>>
                                 || #friend_request{id =
                                                        {V1_id,
                                                         V1_platform,
                                                         V1_zone_id},
                                                    name = V1_name,
                                                    sex = V1_sex,
                                                    classes = V1_classes,
                                                    lev = V1_lev, fc = V1_fc,
                                                    total_fc = V1_total_fc,
                                                    face = V1_face}
                                        <- V0_friend_request]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11811:16/little,
       D_a_t_a/binary>>};
pack(cli, 11820, {}) ->
    {ok, <<2:32/little, 11820:16/little>>};
pack(srv, 11820,
     {#friend_zone{name = V0_name, name_used = V0_name_used,
                   sex = V0_sex, classes = V0_classes, birth = V0_birth,
                   constellation = V0_constellation, abo = V0_abo,
                   signature = V0_signature, spouse_name = V0_spouse_name,
                   guild = V0_guild, region = V0_region, city = V0_city,
                   is_shared_region = V0_is_shared_region,
                   visited = V0_visited, privacy = V0_privacy,
                   liked = V0_liked, prize_num = V0_prize_num,
                   present_num = V0_present_num, honor_id = V0_honor_id,
                   lover_name = V0_lover_name,
                   teacher_name = V0_teacher_name, theme = V0_theme,
                   photo_frame = V0_photo_frame,
                   sworn_name = V0_sworn_name, photo = V0_photo,
                   badges = V0_badges, visitors = V0_visitors,
                   subscribed = V0_subscribed, fans = V0_fans,
                   tags = V0_tags, show_honor = V0_show_honor,
                   pre_honor_id = V0_pre_honor_id,
                   privacy_zone = V0_privacy_zone,
                   privacy_moments = V0_privacy_moments}}) ->
    D_a_t_a = <<(protocol:pack(string, V0_name))/binary,
                (protocol:pack(string, V0_name_used))/binary,
                V0_sex:8/little, V0_classes:8/little,
                (protocol:pack(string, V0_birth))/binary,
                V0_constellation:8/little, V0_abo:8/little,
                (protocol:pack(string, V0_signature))/binary,
                (protocol:pack(string, V0_spouse_name))/binary,
                (protocol:pack(string, V0_guild))/binary,
                (protocol:pack(string, V0_region))/binary,
                (protocol:pack(string, V0_city))/binary,
                V0_is_shared_region:8/little, V0_visited:32/little,
                V0_privacy:8/little, V0_liked:32/little,
                V0_prize_num:32/little, V0_present_num:32/little,
                V0_honor_id:32/little,
                (protocol:pack(string, V0_lover_name))/binary,
                (protocol:pack(string, V0_teacher_name))/binary,
                V0_theme:16/little, V0_photo_frame:16/little,
                (protocol:pack(string, V0_sworn_name))/binary,
                (length(V0_photo)):16/little,
                (list_to_binary([<<V1_id:8/little, V1_auditing:8/little,
                                   V1_uploaded:32/little>>
                                 || #friend_zone_photo{id = V1_id,
                                                       auditing = V1_auditing,
                                                       uploaded = V1_uploaded}
                                        <- V0_photo]))/binary,
                (length(V0_badges)):16/little,
                (list_to_binary([<<V1_badge_id:16/little>>
                                 || V1_badge_id <- V0_badges]))/binary,
                (length(V0_visitors)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_classes:8/little, V1_sex:8/little,
                                   V1_time:32/little>>
                                 || #friend_visitor{id =
                                                        {V1_id,
                                                         V1_platform,
                                                         V1_zone_id},
                                                    name = V1_name,
                                                    classes = V1_classes,
                                                    sex = V1_sex,
                                                    time = V1_time}
                                        <- V0_visitors]))/binary,
                (length(V0_subscribed)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_classes:8/little, V1_sex:8/little,
                                   V1_cared:8/little, V1_interacted:32/little>>
                                 || #friend_subscription{id =
                                                             {V1_id,
                                                              V1_platform,
                                                              V1_zone_id},
                                                         name = V1_name,
                                                         classes = V1_classes,
                                                         sex = V1_sex,
                                                         cared = V1_cared,
                                                         interacted =
                                                             V1_interacted}
                                        <- V0_subscribed]))/binary,
                (length(V0_fans)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_classes:8/little, V1_sex:8/little,
                                   V1_cared:8/little, V1_interacted:32/little>>
                                 || #friend_subscription{id =
                                                             {V1_id,
                                                              V1_platform,
                                                              V1_zone_id},
                                                         name = V1_name,
                                                         classes = V1_classes,
                                                         sex = V1_sex,
                                                         cared = V1_cared,
                                                         interacted =
                                                             V1_interacted}
                                        <- V0_fans]))/binary,
                (length(V0_tags)):16/little,
                (list_to_binary([<<V1_tag_id:8/little,
                                   (protocol:pack(string, V1_tag))/binary>>
                                 || {V1_tag_id, V1_tag} <- V0_tags]))/binary,
                V0_show_honor:16/little, V0_pre_honor_id:32/little,
                V0_privacy_zone:8/little, V0_privacy_moments:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11820:16/little,
       D_a_t_a/binary>>};
pack(cli, 11821, {}) ->
    {ok, <<2:32/little, 11821:16/little>>};
pack(srv, 11821, {V0_trends}) ->
    D_a_t_a = <<(length(V0_trends)):16/little,
                (list_to_binary([<<V1_likable:8/little, V1_id:32/little,
                                   V1_type:8/little, V1_role_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   (protocol:pack(string, V1_content))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_ctime:32/little, V1_liked:32/little,
                                   (length(V1_presents)):16/little,
                                   (list_to_binary([<<V2_base_id:32/little,
                                                      V2_num:32/little>>
                                                    || {V2_base_id, V2_num}
                                                           <- V1_presents]))/binary>>
                                 || {V1_likable,
                                     #friend_trend{id = V1_id, type = V1_type,
                                                   rid =
                                                       {V1_role_id,
                                                        V1_platform,
                                                        V1_zone_id},
                                                   name = V1_name,
                                                   content = V1_content,
                                                   sex = V1_sex,
                                                   classes = V1_classes,
                                                   ctime = V1_ctime,
                                                   liked = V1_liked,
                                                   presents = V1_presents}}
                                        <- V0_trends]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11821:16/little,
       D_a_t_a/binary>>};
pack(cli, 11822, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11822:16/little,
       D_a_t_a/binary>>};
pack(srv, 11822,
     {#friend_zone{name = V0_name, name_used = V0_name_used,
                   sex = V0_sex, classes = V0_classes, lev = V0_lev,
                   birth = V0_birth, constellation = V0_constellation,
                   abo = V0_abo, signature = V0_signature,
                   spouse_name = V0_spouse_name, guild = V0_guild,
                   region = V0_region, city = V0_city,
                   is_shared_region = V0_is_shared_region,
                   visited = V0_visited, privacy = V0_privacy,
                   liked = V0_liked, prize_num = V0_prize_num,
                   present_num = V0_present_num, honor_id = V0_honor_id,
                   lover_name = V0_lover_name,
                   teacher_name = V0_teacher_name, theme = V0_theme,
                   photo_frame = V0_photo_frame,
                   sworn_name = V0_sworn_name, photo = V0_photo,
                   badges = V0_badges, visitors = V0_visitors,
                   subscribed = V0_subscribed, fans = V0_fans,
                   tags = V0_tags, show_honor = V0_show_honor,
                   pre_honor_id = V0_pre_honor_id},
      V0_is_subscribed,
      V0_likable}) ->
    D_a_t_a = <<(protocol:pack(string, V0_name))/binary,
                (protocol:pack(string, V0_name_used))/binary,
                V0_sex:8/little, V0_classes:8/little, V0_lev:16/little,
                (protocol:pack(string, V0_birth))/binary,
                V0_constellation:8/little, V0_abo:8/little,
                (protocol:pack(string, V0_signature))/binary,
                (protocol:pack(string, V0_spouse_name))/binary,
                (protocol:pack(string, V0_guild))/binary,
                (protocol:pack(string, V0_region))/binary,
                (protocol:pack(string, V0_city))/binary,
                V0_is_shared_region:8/little, V0_visited:32/little,
                V0_privacy:8/little, V0_liked:32/little,
                V0_prize_num:32/little, V0_present_num:32/little,
                V0_honor_id:32/little,
                (protocol:pack(string, V0_lover_name))/binary,
                (protocol:pack(string, V0_teacher_name))/binary,
                V0_theme:16/little, V0_photo_frame:16/little,
                (protocol:pack(string, V0_sworn_name))/binary,
                (length(V0_photo)):16/little,
                (list_to_binary([<<V1_id:8/little, V1_auditing:8/little,
                                   V1_uploaded:32/little>>
                                 || #friend_zone_photo{id = V1_id,
                                                       auditing = V1_auditing,
                                                       uploaded = V1_uploaded}
                                        <- V0_photo]))/binary,
                (length(V0_badges)):16/little,
                (list_to_binary([<<V1_badge_id:16/little>>
                                 || V1_badge_id <- V0_badges]))/binary,
                (length(V0_visitors)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_classes:8/little, V1_sex:8/little,
                                   V1_time:32/little>>
                                 || #friend_visitor{id =
                                                        {V1_id,
                                                         V1_platform,
                                                         V1_zone_id},
                                                    name = V1_name,
                                                    classes = V1_classes,
                                                    sex = V1_sex,
                                                    time = V1_time}
                                        <- V0_visitors]))/binary,
                (length(V0_subscribed)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_classes:8/little, V1_sex:8/little,
                                   V1_cared:8/little, V1_interacted:32/little>>
                                 || #friend_subscription{id =
                                                             {V1_id,
                                                              V1_platform,
                                                              V1_zone_id},
                                                         name = V1_name,
                                                         classes = V1_classes,
                                                         sex = V1_sex,
                                                         cared = V1_cared,
                                                         interacted =
                                                             V1_interacted}
                                        <- V0_subscribed]))/binary,
                (length(V0_fans)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_classes:8/little, V1_sex:8/little,
                                   V1_cared:8/little, V1_interacted:32/little>>
                                 || #friend_subscription{id =
                                                             {V1_id,
                                                              V1_platform,
                                                              V1_zone_id},
                                                         name = V1_name,
                                                         classes = V1_classes,
                                                         sex = V1_sex,
                                                         cared = V1_cared,
                                                         interacted =
                                                             V1_interacted}
                                        <- V0_fans]))/binary,
                (length(V0_tags)):16/little,
                (list_to_binary([<<V1_tag_id:8/little,
                                   (protocol:pack(string, V1_tag))/binary>>
                                 || {V1_tag_id, V1_tag} <- V0_tags]))/binary,
                V0_show_honor:16/little, V0_pre_honor_id:32/little,
                V0_is_subscribed:8/little, V0_likable:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11822:16/little,
       D_a_t_a/binary>>};
pack(cli, 11823,
     {V0_type,
      V0_content,
      V0_id,
      V0_platform,
      V0_zone_id}) ->
    D_a_t_a = <<V0_type:8/little,
                (protocol:pack(string, V0_content))/binary,
                V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11823:16/little,
       D_a_t_a/binary>>};
pack(srv, 11823, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11823:16/little,
       D_a_t_a/binary>>};
pack(cli, 11824, {V0_id, V0_content}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_content))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11824:16/little,
       D_a_t_a/binary>>};
pack(srv, 11824, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11824:16/little,
       D_a_t_a/binary>>};
pack(cli, 11825, {V0_type}) ->
    D_a_t_a = <<V0_type:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11825:16/little,
       D_a_t_a/binary>>};
pack(srv, 11825, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11825:16/little,
       D_a_t_a/binary>>};
pack(cli, 11826,
     {V0_id, V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little, V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11826:16/little,
       D_a_t_a/binary>>};
pack(srv, 11826, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11826:16/little,
       D_a_t_a/binary>>};
pack(cli, 11827, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11827:16/little,
       D_a_t_a/binary>>};
pack(srv, 11827, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11827:16/little,
       D_a_t_a/binary>>};
pack(cli, 11828, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11828:16/little,
       D_a_t_a/binary>>};
pack(srv, 11828, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11828:16/little,
       D_a_t_a/binary>>};
pack(cli, 11829, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11829:16/little,
       D_a_t_a/binary>>};
pack(srv, 11829, {V0_trends}) ->
    D_a_t_a = <<(length(V0_trends)):16/little,
                (list_to_binary([<<V1_likable:8/little, V1_id:32/little,
                                   V1_type:8/little, V1_role_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   (protocol:pack(string, V1_content))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_ctime:32/little, V1_liked:32/little,
                                   (length(V1_presents)):16/little,
                                   (list_to_binary([<<V2_base_id:32/little,
                                                      V2_num:32/little>>
                                                    || {V2_base_id, V2_num}
                                                           <- V1_presents]))/binary>>
                                 || {V1_likable,
                                     #friend_trend{id = V1_id, type = V1_type,
                                                   rid =
                                                       {V1_role_id,
                                                        V1_platform,
                                                        V1_zone_id},
                                                   name = V1_name,
                                                   content = V1_content,
                                                   sex = V1_sex,
                                                   classes = V1_classes,
                                                   ctime = V1_ctime,
                                                   liked = V1_liked,
                                                   presents = V1_presents}}
                                        <- V0_trends]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11829:16/little,
       D_a_t_a/binary>>};
pack(cli, 11830,
     {V0_id, V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little, V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11830:16/little,
       D_a_t_a/binary>>};
pack(srv, 11830,
     {#friend_trend{id = V0_id, type = V0_type,
                    rid = {V0_role_id, V0_platform, V0_zone_id},
                    name = V0_name, content = V0_content, sex = V0_sex,
                    classes = V0_classes, ctime = V0_ctime,
                    liked = V0_liked, presents = V0_presents}}) ->
    D_a_t_a = <<V0_id:32/little, V0_type:8/little,
                V0_role_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                (protocol:pack(string, V0_content))/binary,
                V0_sex:8/little, V0_classes:8/little,
                V0_ctime:32/little, V0_liked:32/little,
                (length(V0_presents)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_num:32/little>>
                                 || {V1_base_id, V1_num}
                                        <- V0_presents]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11830:16/little,
       D_a_t_a/binary>>};
pack(cli, 11831, {V0_tag}) ->
    D_a_t_a = <<(protocol:pack(string, V0_tag))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11831:16/little,
       D_a_t_a/binary>>};
pack(srv, 11831, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11831:16/little,
       D_a_t_a/binary>>};
pack(cli, 11832, {V0_id}) ->
    D_a_t_a = <<V0_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11832:16/little,
       D_a_t_a/binary>>};
pack(srv, 11832, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11832:16/little,
       D_a_t_a/binary>>};
pack(cli, 11833,
     {V0_birth,
      V0_constellation,
      V0_abo,
      V0_signature,
      V0_region,
      V0_sex}) ->
    D_a_t_a = <<(protocol:pack(string, V0_birth))/binary,
                V0_constellation:8/little, V0_abo:8/little,
                (protocol:pack(string, V0_signature))/binary,
                (protocol:pack(string, V0_region))/binary,
                V0_sex:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11833:16/little,
       D_a_t_a/binary>>};
pack(srv, 11833, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11833:16/little,
       D_a_t_a/binary>>};
pack(cli, 11834, {V0_id, V0_photo}) ->
    D_a_t_a = <<V0_id:8/little,
                (byte_size(V0_photo)):32/little, V0_photo/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11834:16/little,
       D_a_t_a/binary>>};
pack(srv, 11834, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11834:16/little,
       D_a_t_a/binary>>};
pack(cli, 11835, {V0_privacy}) ->
    D_a_t_a = <<V0_privacy:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11835:16/little,
       D_a_t_a/binary>>};
pack(srv, 11835, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11835:16/little,
       D_a_t_a/binary>>};
pack(cli, 11836,
     {V0_role_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_role_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11836:16/little,
       D_a_t_a/binary>>};
pack(srv, 11836,
     {V0_result, V0_msg, V0_item_base_id}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_item_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11836:16/little,
       D_a_t_a/binary>>};
pack(cli, 11837, {V0_num}) ->
    D_a_t_a = <<V0_num:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11837:16/little,
       D_a_t_a/binary>>};
pack(srv, 11837, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11837:16/little,
       D_a_t_a/binary>>};
pack(cli, 11838, {}) ->
    {ok, <<2:32/little, 11838:16/little>>};
pack(srv, 11838, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_photo:8/little, V1_liked:32/little,
                                   V1_prize_num:32/little>>
                                 || #friend_zone_rank{id =
                                                          {V1_id,
                                                           V1_platform,
                                                           V1_zone_id},
                                                      name = V1_name,
                                                      sex = V1_sex,
                                                      classes = V1_classes,
                                                      photo = V1_photo,
                                                      liked = V1_liked,
                                                      prize_num = V1_prize_num}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11838:16/little,
       D_a_t_a/binary>>};
pack(cli, 11839, {}) ->
    {ok, <<2:32/little, 11839:16/little>>};
pack(srv, 11839, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_photo:8/little, V1_liked:32/little,
                                   V1_prize_num:32/little>>
                                 || #friend_zone_rank{id =
                                                          {V1_id,
                                                           V1_platform,
                                                           V1_zone_id},
                                                      name = V1_name,
                                                      sex = V1_sex,
                                                      classes = V1_classes,
                                                      photo = V1_photo,
                                                      liked = V1_liked,
                                                      prize_num = V1_prize_num}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11839:16/little,
       D_a_t_a/binary>>};
pack(cli, 11840, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11840:16/little,
       D_a_t_a/binary>>};
pack(srv, 11840, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:8/little, V1_got_prize:8/little,
                                   V1_time:32/little>>
                                 || #friend_like{id =
                                                     {V1_id,
                                                      V1_platform,
                                                      V1_zone_id},
                                                 name = V1_name, sex = V1_sex,
                                                 classes = V1_classes,
                                                 lev = V1_lev,
                                                 got_prize = V1_got_prize,
                                                 time = V1_time}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11840:16/little,
       D_a_t_a/binary>>};
pack(cli, 11841,
     {{V0_id, V0_platform, V0_zone_id}, V0_list}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, (length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_num:32/little>>
                                 || {V1_id, V1_num} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11841:16/little,
       D_a_t_a/binary>>};
pack(srv, 11841, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11841:16/little,
       D_a_t_a/binary>>};
pack(cli, 11842,
     {{V0_id, V0_platform, V0_zone_id}, V0_list, V0_msg}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, (length(V0_list)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_num:32/little>>
                                 || {V1_base_id, V1_num} <- V0_list]))/binary,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11842:16/little,
       D_a_t_a/binary>>};
pack(srv, 11842, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11842:16/little,
       D_a_t_a/binary>>};
pack(cli, 11843, {}) ->
    {ok, <<2:32/little, 11843:16/little>>};
pack(srv, 11843,
     {{V0_id, V0_platform, V0_zone_id},
      V0_name,
      V0_base_id,
      V0_msg}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_base_id:32/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11843:16/little,
       D_a_t_a/binary>>};
pack(cli, 11844, {}) ->
    {ok, <<2:32/little, 11844:16/little>>};
pack(srv, 11844, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little, V1_num:32/little,
                                   V1_time:32/little>>
                                 || #friend_present{recipient =
                                                        {V1_id,
                                                         V1_platform,
                                                         V1_zone_id},
                                                    num = V1_num,
                                                    time = V1_time}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11844:16/little,
       D_a_t_a/binary>>};
pack(cli, 11845, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11845:16/little,
       D_a_t_a/binary>>};
pack(srv, 11845, {V0_photo}) ->
    D_a_t_a = <<(length(V0_photo)):16/little,
                (list_to_binary([<<V1_id:8/little,
                                   (byte_size(V1_photo_bin)):32/little,
                                   V1_photo_bin/binary, V1_auditing:8/little,
                                   V1_default:8/little, V1_uploaded:32/little>>
                                 || {V1_id,
                                     V1_photo_bin,
                                     V1_auditing,
                                     V1_default,
                                     V1_uploaded}
                                        <- V0_photo]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11845:16/little,
       D_a_t_a/binary>>};
pack(cli, 11846, {V0_id}) ->
    D_a_t_a = <<V0_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11846:16/little,
       D_a_t_a/binary>>};
pack(srv, 11846, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11846:16/little,
       D_a_t_a/binary>>};
pack(cli, 11847, {}) ->
    {ok, <<2:32/little, 11847:16/little>>};
pack(srv, 11847, {V0_rewarded}) ->
    D_a_t_a = <<(length(V0_rewarded)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_time:32/little>>
                                 || {V1_id, V1_time} <- V0_rewarded]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11847:16/little,
       D_a_t_a/binary>>};
pack(cli, 11848, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11848:16/little,
       D_a_t_a/binary>>};
pack(srv, 11848, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11848:16/little,
       D_a_t_a/binary>>};
pack(cli, 11849,
     {V0_content,
      V0_id,
      V0_role_id,
      V0_platform,
      V0_zone_id}) ->
    D_a_t_a = <<(protocol:pack(string, V0_content))/binary,
                V0_id:32/little, V0_role_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11849:16/little,
       D_a_t_a/binary>>};
pack(srv, 11849, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11849:16/little,
       D_a_t_a/binary>>};
pack(cli, 11850, {V0_id}) ->
    D_a_t_a = <<V0_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11850:16/little,
       D_a_t_a/binary>>};
pack(srv, 11850, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11850:16/little,
       D_a_t_a/binary>>};
pack(cli, 11851, {V0_id}) ->
    D_a_t_a = <<V0_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11851:16/little,
       D_a_t_a/binary>>};
pack(srv, 11851, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11851:16/little,
       D_a_t_a/binary>>};
pack(cli, 11852, {V0_badges}) ->
    D_a_t_a = <<(length(V0_badges)):16/little,
                (list_to_binary([<<V1_badge_id:16/little>>
                                 || V1_badge_id <- V0_badges]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11852:16/little,
       D_a_t_a/binary>>};
pack(srv, 11852, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11852:16/little,
       D_a_t_a/binary>>};
pack(cli, 11853, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11853:16/little,
       D_a_t_a/binary>>};
pack(srv, 11853, {V0_photo}) ->
    D_a_t_a = <<(length(V0_photo)):16/little,
                (list_to_binary([<<V1_id:8/little,
                                   (byte_size(V1_photo_bin)):32/little,
                                   V1_photo_bin/binary>>
                                 || {V1_id, V1_photo_bin}
                                        <- V0_photo]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11853:16/little,
       D_a_t_a/binary>>};
pack(cli, 11854, {V0_id}) ->
    D_a_t_a = <<V0_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11854:16/little,
       D_a_t_a/binary>>};
pack(srv, 11854, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11854:16/little,
       D_a_t_a/binary>>};
pack(cli, 11855, {}) ->
    {ok, <<2:32/little, 11855:16/little>>};
pack(srv, 11855, {V0_friend_role}) ->
    D_a_t_a = <<(length(V0_friend_role)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_online:8/little, V1_lev:8/little,
                                   (protocol:pack(string, V1_guild))/binary,
                                   (length(V1_looks)):16/little,
                                   (list_to_binary([<<V2_looks_type:32/little,
                                                      V2_looks_mode:32/little,
                                                      V2_looks_val:32/little,
                                                      (protocol:pack(string,
                                                                     V2_looks_str))/binary>>
                                                    || {V2_looks_type,
                                                        V2_looks_mode,
                                                        V2_looks_val,
                                                        V2_looks_str}
                                                           <- V1_looks]))/binary,
                                   V1_offline_push:8/little>>
                                 || #friend_role{id =
                                                     {V1_id,
                                                      V1_platform,
                                                      V1_zone_id},
                                                 name = V1_name,
                                                 online = V1_online,
                                                 lev = V1_lev, guild = V1_guild,
                                                 looks = V1_looks,
                                                 offline_push = V1_offline_push}
                                        <- V0_friend_role]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11855:16/little,
       D_a_t_a/binary>>};
pack(cli, 11856, {V0_page}) ->
    D_a_t_a = <<V0_page:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11856:16/little,
       D_a_t_a/binary>>};
pack(srv, 11856, {V0_page, V0_moments}) ->
    D_a_t_a = <<V0_page:8/little,
                (length(V0_moments)):16/little,
                (list_to_binary([<<V1_m_id:32/little,
                                   (protocol:pack(string,
                                                  V1_m_platform))/binary,
                                   V1_m_zone_id:16/little, V1_type:8/little,
                                   V1_role_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   (protocol:pack(string, V1_content))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_ctime:32/little,
                                   (length(V1_likes)):16/little,
                                   (list_to_binary([<<V2_liker_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_liker_platform))/binary,
                                                      V2_liker_zone_id:16/little,
                                                      (protocol:pack(string,
                                                                     V2_name))/binary,
                                                      V2_sex:8/little,
                                                      V2_classes:8/little,
                                                      V2_ctime:32/little>>
                                                    || #friend_moment_like{rid =
                                                                               {V2_liker_id,
                                                                                V2_liker_platform,
                                                                                V2_liker_zone_id},
                                                                           name
                                                                               =
                                                                               V2_name,
                                                                           sex =
                                                                               V2_sex,
                                                                           classes
                                                                               =
                                                                               V2_classes,
                                                                           ctime
                                                                               =
                                                                               V2_ctime}
                                                           <- V1_likes]))/binary,
                                   (length(V1_friend_comment)):16/little,
                                   (list_to_binary([<<V2_commentator_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_commentator_platform))/binary,
                                                      V2_commentator_zone_id:16/little,
                                                      V2_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_name))/binary,
                                                      V2_sex:8/little,
                                                      V2_classes:8/little,
                                                      V2_ctime:32/little,
                                                      (protocol:pack(string,
                                                                     V2_msg))/binary>>
                                                    || #friend_comment{rid =
                                                                           {V2_commentator_id,
                                                                            V2_commentator_platform,
                                                                            V2_commentator_zone_id},
                                                                       id =
                                                                           V2_id,
                                                                       name =
                                                                           V2_name,
                                                                       sex =
                                                                           V2_sex,
                                                                       classes =
                                                                           V2_classes,
                                                                       ctime =
                                                                           V2_ctime,
                                                                       msg =
                                                                           V2_msg}
                                                           <- V1_friend_comment]))/binary,
                                   (length(V1_friend_moment_photo)):16/little,
                                   (list_to_binary([<<V2_id:8/little,
                                                      V2_auditing:8/little,
                                                      V2_uploaded:32/little>>
                                                    || #friend_moment_photo{id =
                                                                                V2_id,
                                                                            auditing
                                                                                =
                                                                                V2_auditing,
                                                                            uploaded
                                                                                =
                                                                                V2_uploaded}
                                                           <- V1_friend_moment_photo]))/binary>>
                                 || {#friend_moment{id =
                                                        {V1_m_id,
                                                         V1_m_platform,
                                                         V1_m_zone_id},
                                                    type = V1_type,
                                                    rid =
                                                        {V1_role_id,
                                                         V1_platform,
                                                         V1_zone_id},
                                                    name = V1_name,
                                                    content = V1_content,
                                                    sex = V1_sex,
                                                    classes = V1_classes,
                                                    ctime = V1_ctime,
                                                    likes = V1_likes},
                                     V1_friend_comment,
                                     V1_friend_moment_photo}
                                        <- V0_moments]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11856:16/little,
       D_a_t_a/binary>>};
pack(cli, 11857,
     {V0_role_id, V0_platform, V0_zone_id, V0_page}) ->
    D_a_t_a = <<V0_role_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_page:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11857:16/little,
       D_a_t_a/binary>>};
pack(srv, 11857,
     {V0_circle_id,
      V0_circle_platform,
      V0_circle_zone_id,
      V0_page,
      V0_moments}) ->
    D_a_t_a = <<V0_circle_id:32/little,
                (protocol:pack(string, V0_circle_platform))/binary,
                V0_circle_zone_id:16/little, V0_page:8/little,
                (length(V0_moments)):16/little,
                (list_to_binary([<<V1_m_id:32/little,
                                   (protocol:pack(string,
                                                  V1_m_platform))/binary,
                                   V1_m_zone_id:16/little, V1_type:8/little,
                                   V1_role_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   (protocol:pack(string, V1_content))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_ctime:32/little,
                                   (length(V1_likes)):16/little,
                                   (list_to_binary([<<V2_liker_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_liker_platform))/binary,
                                                      V2_liker_zone_id:16/little,
                                                      (protocol:pack(string,
                                                                     V2_name))/binary,
                                                      V2_sex:8/little,
                                                      V2_classes:8/little,
                                                      V2_ctime:32/little>>
                                                    || #friend_moment_like{rid =
                                                                               {V2_liker_id,
                                                                                V2_liker_platform,
                                                                                V2_liker_zone_id},
                                                                           name
                                                                               =
                                                                               V2_name,
                                                                           sex =
                                                                               V2_sex,
                                                                           classes
                                                                               =
                                                                               V2_classes,
                                                                           ctime
                                                                               =
                                                                               V2_ctime}
                                                           <- V1_likes]))/binary,
                                   (length(V1_friend_comment)):16/little,
                                   (list_to_binary([<<V2_commentator_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_commentator_platform))/binary,
                                                      V2_commentator_zone_id:16/little,
                                                      V2_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_name))/binary,
                                                      V2_sex:8/little,
                                                      V2_classes:8/little,
                                                      V2_ctime:32/little,
                                                      (protocol:pack(string,
                                                                     V2_msg))/binary>>
                                                    || #friend_comment{rid =
                                                                           {V2_commentator_id,
                                                                            V2_commentator_platform,
                                                                            V2_commentator_zone_id},
                                                                       id =
                                                                           V2_id,
                                                                       name =
                                                                           V2_name,
                                                                       sex =
                                                                           V2_sex,
                                                                       classes =
                                                                           V2_classes,
                                                                       ctime =
                                                                           V2_ctime,
                                                                       msg =
                                                                           V2_msg}
                                                           <- V1_friend_comment]))/binary,
                                   (length(V1_friend_moment_photo)):16/little,
                                   (list_to_binary([<<V2_id:8/little,
                                                      V2_auditing:8/little,
                                                      V2_uploaded:32/little>>
                                                    || #friend_moment_photo{id =
                                                                                V2_id,
                                                                            auditing
                                                                                =
                                                                                V2_auditing,
                                                                            uploaded
                                                                                =
                                                                                V2_uploaded}
                                                           <- V1_friend_moment_photo]))/binary>>
                                 || {#friend_moment{id =
                                                        {V1_m_id,
                                                         V1_m_platform,
                                                         V1_m_zone_id},
                                                    type = V1_type,
                                                    rid =
                                                        {V1_role_id,
                                                         V1_platform,
                                                         V1_zone_id},
                                                    name = V1_name,
                                                    content = V1_content,
                                                    sex = V1_sex,
                                                    classes = V1_classes,
                                                    ctime = V1_ctime,
                                                    likes = V1_likes},
                                     V1_friend_comment,
                                     V1_friend_moment_photo}
                                        <- V0_moments]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11857:16/little,
       D_a_t_a/binary>>};
pack(cli, 11858,
     {V0_content,
      V0_type,
      V0_photos,
      V0_thumbs,
      V0_mentions}) ->
    D_a_t_a = <<(protocol:pack(string, V0_content))/binary,
                V0_type:8/little, (length(V0_photos)):16/little,
                (list_to_binary([<<(byte_size(V1_photo)):32/little,
                                   V1_photo/binary>>
                                 || V1_photo <- V0_photos]))/binary,
                (length(V0_thumbs)):16/little,
                (list_to_binary([<<(byte_size(V1_thumb)):32/little,
                                   V1_thumb/binary>>
                                 || V1_thumb <- V0_thumbs]))/binary,
                (length(V0_mentions)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little>>
                                 || {V1_rid, V1_platform, V1_zone_id}
                                        <- V0_mentions]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11858:16/little,
       D_a_t_a/binary>>};
pack(srv, 11858, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11858:16/little,
       D_a_t_a/binary>>};
pack(cli, 11859, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11859:16/little,
       D_a_t_a/binary>>};
pack(srv, 11859, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11859:16/little,
       D_a_t_a/binary>>};
pack(cli, 11860, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11860:16/little,
       D_a_t_a/binary>>};
pack(srv, 11860, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11860:16/little,
       D_a_t_a/binary>>};
pack(cli, 11861, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11861:16/little,
       D_a_t_a/binary>>};
pack(srv, 11861, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11861:16/little,
       D_a_t_a/binary>>};
pack(cli, 11862,
     {V0_id,
      V0_platform,
      V0_zone_id,
      V0_content,
      V0_mentions}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_content))/binary,
                (length(V0_mentions)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little>>
                                 || {V1_rid, V1_platform, V1_zone_id}
                                        <- V0_mentions]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11862:16/little,
       D_a_t_a/binary>>};
pack(srv, 11862, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11862:16/little,
       D_a_t_a/binary>>};
pack(cli, 11863,
     {V0_moment_id,
      V0_platform,
      V0_zone_id,
      V0_comment_id}) ->
    D_a_t_a = <<V0_moment_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_comment_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11863:16/little,
       D_a_t_a/binary>>};
pack(srv, 11863, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11863:16/little,
       D_a_t_a/binary>>};
pack(cli, 11864, {V0_moment_id, V0_photo_id}) ->
    D_a_t_a = <<V0_moment_id:32/little,
                V0_photo_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11864:16/little,
       D_a_t_a/binary>>};
pack(srv, 11864,
     {V0_flag, V0_msg, V0_moment_id, V0_photo_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_moment_id:32/little, V0_photo_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11864:16/little,
       D_a_t_a/binary>>};
pack(cli, 11865, {}) ->
    {ok, <<2:32/little, 11865:16/little>>};
pack(srv, 11865,
     {V0_up_type,
      #friend_moment{id =
                         {V0_m_id, V0_m_platform, V0_m_zone_id},
                     type = V0_type,
                     rid = {V0_role_id, V0_platform, V0_zone_id},
                     name = V0_name, content = V0_content, sex = V0_sex,
                     classes = V0_classes, ctime = V0_ctime,
                     likes = V0_likes},
      V0_friend_moment_photo}) ->
    D_a_t_a = <<V0_up_type:8/little, V0_m_id:32/little,
                (protocol:pack(string, V0_m_platform))/binary,
                V0_m_zone_id:16/little, V0_type:8/little,
                V0_role_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                (protocol:pack(string, V0_content))/binary,
                V0_sex:8/little, V0_classes:8/little,
                V0_ctime:32/little, (length(V0_likes)):16/little,
                (list_to_binary([<<V1_liker_id:32/little,
                                   (protocol:pack(string,
                                                  V1_liker_platform))/binary,
                                   V1_liker_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_ctime:32/little>>
                                 || #friend_moment_like{rid =
                                                            {V1_liker_id,
                                                             V1_liker_platform,
                                                             V1_liker_zone_id},
                                                        name = V1_name,
                                                        sex = V1_sex,
                                                        classes = V1_classes,
                                                        ctime = V1_ctime}
                                        <- V0_likes]))/binary,
                (length(V0_friend_moment_photo)):16/little,
                (list_to_binary([<<V1_id:8/little, V1_auditing:8/little,
                                   V1_uploaded:32/little>>
                                 || #friend_moment_photo{id = V1_id,
                                                         auditing = V1_auditing,
                                                         uploaded = V1_uploaded}
                                        <- V0_friend_moment_photo]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11865:16/little,
       D_a_t_a/binary>>};
pack(cli, 11866, {}) ->
    {ok, <<2:32/little, 11866:16/little>>};
pack(srv, 11866,
     {V0_type,
      #friend_comment{id = V0_id,
                      moment_id = {V0_m_id, V0_m_platform, V0_m_zone_id},
                      rid = {V0_role_id, V0_platform, V0_zone_id},
                      name = V0_name, msg = V0_msg, sex = V0_sex,
                      classes = V0_classes, ctime = V0_ctime}}) ->
    D_a_t_a = <<V0_type:8/little, V0_id:32/little,
                V0_m_id:32/little,
                (protocol:pack(string, V0_m_platform))/binary,
                V0_m_zone_id:16/little, V0_role_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                (protocol:pack(string, V0_msg))/binary, V0_sex:8/little,
                V0_classes:8/little, V0_ctime:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11866:16/little,
       D_a_t_a/binary>>};
pack(cli, 11867, {}) ->
    {ok, <<2:32/little, 11867:16/little>>};
pack(srv, 11867,
     {V0_type,
      #friend_moment_like{moment_id =
                              {V0_m_id, V0_m_platform, V0_m_zone_id},
                          rid = {V0_role_id, V0_platform, V0_zone_id},
                          name = V0_name, sex = V0_sex, classes = V0_classes,
                          ctime = V0_ctime}}) ->
    D_a_t_a = <<V0_type:8/little, V0_m_id:32/little,
                (protocol:pack(string, V0_m_platform))/binary,
                V0_m_zone_id:16/little, V0_role_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_sex:8/little, V0_classes:8/little,
                V0_ctime:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11867:16/little,
       D_a_t_a/binary>>};
pack(cli, 11868,
     {V0_moment_id, V0_platform, V0_zone_id, V0_photo_id}) ->
    D_a_t_a = <<V0_moment_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_photo_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11868:16/little,
       D_a_t_a/binary>>};
pack(srv, 11868, {V0_photo}) ->
    D_a_t_a = <<(length(V0_photo)):16/little,
                (list_to_binary([<<V1_id:8/little, V1_m_id:32/little,
                                   (protocol:pack(string,
                                                  V1_m_platform))/binary,
                                   V1_m_zone_id:16/little,
                                   (byte_size(V1_photo_bin)):32/little,
                                   V1_photo_bin/binary, V1_auditing:8/little,
                                   V1_uploaded:32/little>>
                                 || {V1_id,
                                     {V1_m_id, V1_m_platform, V1_m_zone_id},
                                     V1_photo_bin,
                                     V1_auditing,
                                     V1_uploaded}
                                        <- V0_photo]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11868:16/little,
       D_a_t_a/binary>>};
pack(cli, 11869,
     {V0_moment_id,
      V0_platform,
      V0_zone_id,
      V0_type,
      V0_spec_id}) ->
    D_a_t_a = <<V0_moment_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_type:8/little,
                V0_spec_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11869:16/little,
       D_a_t_a/binary>>};
pack(srv, 11869, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11869:16/little,
       D_a_t_a/binary>>};
pack(cli, 11870, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11870:16/little,
       D_a_t_a/binary>>};
pack(srv, 11870, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11870:16/little,
       D_a_t_a/binary>>};
pack(cli, 11871, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11871:16/little,
       D_a_t_a/binary>>};
pack(srv, 11871, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11871:16/little,
       D_a_t_a/binary>>};
pack(cli, 11872,
     {V0_moment_id, V0_platform, V0_zone_id, V0_photo_id}) ->
    D_a_t_a = <<V0_moment_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_photo_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11872:16/little,
       D_a_t_a/binary>>};
pack(srv, 11872, {V0_thumb}) ->
    D_a_t_a = <<(length(V0_thumb)):16/little,
                (list_to_binary([<<V1_id:8/little, V1_m_id:32/little,
                                   (protocol:pack(string,
                                                  V1_m_platform))/binary,
                                   V1_m_zone_id:16/little,
                                   (byte_size(V1_thumb_bin)):32/little,
                                   V1_thumb_bin/binary, V1_auditing:8/little,
                                   V1_uploaded:32/little>>
                                 || {V1_id,
                                     {V1_m_id, V1_m_platform, V1_m_zone_id},
                                     V1_thumb_bin,
                                     V1_auditing,
                                     V1_uploaded}
                                        <- V0_thumb]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11872:16/little,
       D_a_t_a/binary>>};
pack(cli, 11873, {V0_page}) ->
    D_a_t_a = <<V0_page:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11873:16/little,
       D_a_t_a/binary>>};
pack(srv, 11873, {V0_page, V0_moments}) ->
    D_a_t_a = <<V0_page:8/little,
                (length(V0_moments)):16/little,
                (list_to_binary([<<V1_m_id:32/little,
                                   (protocol:pack(string,
                                                  V1_m_platform))/binary,
                                   V1_m_zone_id:16/little, V1_type:8/little,
                                   V1_role_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   (protocol:pack(string, V1_content))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_ctime:32/little,
                                   (length(V1_likes)):16/little,
                                   (list_to_binary([<<V2_liker_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_liker_platform))/binary,
                                                      V2_liker_zone_id:16/little,
                                                      (protocol:pack(string,
                                                                     V2_name))/binary,
                                                      V2_sex:8/little,
                                                      V2_classes:8/little,
                                                      V2_ctime:32/little>>
                                                    || #friend_moment_like{rid =
                                                                               {V2_liker_id,
                                                                                V2_liker_platform,
                                                                                V2_liker_zone_id},
                                                                           name
                                                                               =
                                                                               V2_name,
                                                                           sex =
                                                                               V2_sex,
                                                                           classes
                                                                               =
                                                                               V2_classes,
                                                                           ctime
                                                                               =
                                                                               V2_ctime}
                                                           <- V1_likes]))/binary,
                                   (length(V1_friend_comment)):16/little,
                                   (list_to_binary([<<V2_commentator_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_commentator_platform))/binary,
                                                      V2_commentator_zone_id:16/little,
                                                      V2_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_name))/binary,
                                                      V2_sex:8/little,
                                                      V2_classes:8/little,
                                                      V2_ctime:32/little,
                                                      (protocol:pack(string,
                                                                     V2_msg))/binary>>
                                                    || #friend_comment{rid =
                                                                           {V2_commentator_id,
                                                                            V2_commentator_platform,
                                                                            V2_commentator_zone_id},
                                                                       id =
                                                                           V2_id,
                                                                       name =
                                                                           V2_name,
                                                                       sex =
                                                                           V2_sex,
                                                                       classes =
                                                                           V2_classes,
                                                                       ctime =
                                                                           V2_ctime,
                                                                       msg =
                                                                           V2_msg}
                                                           <- V1_friend_comment]))/binary,
                                   (length(V1_friend_moment_photo)):16/little,
                                   (list_to_binary([<<V2_id:8/little,
                                                      V2_auditing:8/little,
                                                      V2_uploaded:32/little>>
                                                    || #friend_moment_photo{id =
                                                                                V2_id,
                                                                            auditing
                                                                                =
                                                                                V2_auditing,
                                                                            uploaded
                                                                                =
                                                                                V2_uploaded}
                                                           <- V1_friend_moment_photo]))/binary>>
                                 || {#friend_moment{id =
                                                        {V1_m_id,
                                                         V1_m_platform,
                                                         V1_m_zone_id},
                                                    type = V1_type,
                                                    rid =
                                                        {V1_role_id,
                                                         V1_platform,
                                                         V1_zone_id},
                                                    name = V1_name,
                                                    content = V1_content,
                                                    sex = V1_sex,
                                                    classes = V1_classes,
                                                    ctime = V1_ctime,
                                                    likes = V1_likes},
                                     V1_friend_comment,
                                     V1_friend_moment_photo}
                                        <- V0_moments]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11873:16/little,
       D_a_t_a/binary>>};
pack(cli, 11874,
     {V0_region, V0_city, V0_is_shared_region}) ->
    D_a_t_a = <<(protocol:pack(string, V0_region))/binary,
                (protocol:pack(string, V0_city))/binary,
                V0_is_shared_region:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11874:16/little,
       D_a_t_a/binary>>};
pack(srv, 11874, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11874:16/little,
       D_a_t_a/binary>>};
pack(cli, 11875, {V0_page}) ->
    D_a_t_a = <<V0_page:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11875:16/little,
       D_a_t_a/binary>>};
pack(srv, 11875, {V0_page, V0_moments}) ->
    D_a_t_a = <<V0_page:8/little,
                (length(V0_moments)):16/little,
                (list_to_binary([<<V1_m_id:32/little,
                                   (protocol:pack(string,
                                                  V1_m_platform))/binary,
                                   V1_m_zone_id:16/little, V1_type:8/little,
                                   V1_role_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   (protocol:pack(string, V1_content))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_ctime:32/little,
                                   (length(V1_likes)):16/little,
                                   (list_to_binary([<<V2_liker_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_liker_platform))/binary,
                                                      V2_liker_zone_id:16/little,
                                                      (protocol:pack(string,
                                                                     V2_name))/binary,
                                                      V2_sex:8/little,
                                                      V2_classes:8/little,
                                                      V2_ctime:32/little>>
                                                    || #friend_moment_like{rid =
                                                                               {V2_liker_id,
                                                                                V2_liker_platform,
                                                                                V2_liker_zone_id},
                                                                           name
                                                                               =
                                                                               V2_name,
                                                                           sex =
                                                                               V2_sex,
                                                                           classes
                                                                               =
                                                                               V2_classes,
                                                                           ctime
                                                                               =
                                                                               V2_ctime}
                                                           <- V1_likes]))/binary,
                                   (length(V1_friend_comment)):16/little,
                                   (list_to_binary([<<V2_commentator_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_commentator_platform))/binary,
                                                      V2_commentator_zone_id:16/little,
                                                      V2_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_name))/binary,
                                                      V2_sex:8/little,
                                                      V2_classes:8/little,
                                                      V2_ctime:32/little,
                                                      (protocol:pack(string,
                                                                     V2_msg))/binary>>
                                                    || #friend_comment{rid =
                                                                           {V2_commentator_id,
                                                                            V2_commentator_platform,
                                                                            V2_commentator_zone_id},
                                                                       id =
                                                                           V2_id,
                                                                       name =
                                                                           V2_name,
                                                                       sex =
                                                                           V2_sex,
                                                                       classes =
                                                                           V2_classes,
                                                                       ctime =
                                                                           V2_ctime,
                                                                       msg =
                                                                           V2_msg}
                                                           <- V1_friend_comment]))/binary,
                                   (length(V1_friend_moment_photo)):16/little,
                                   (list_to_binary([<<V2_id:8/little,
                                                      V2_auditing:8/little,
                                                      V2_uploaded:32/little>>
                                                    || #friend_moment_photo{id =
                                                                                V2_id,
                                                                            auditing
                                                                                =
                                                                                V2_auditing,
                                                                            uploaded
                                                                                =
                                                                                V2_uploaded}
                                                           <- V1_friend_moment_photo]))/binary>>
                                 || {#friend_moment{id =
                                                        {V1_m_id,
                                                         V1_m_platform,
                                                         V1_m_zone_id},
                                                    type = V1_type,
                                                    rid =
                                                        {V1_role_id,
                                                         V1_platform,
                                                         V1_zone_id},
                                                    name = V1_name,
                                                    content = V1_content,
                                                    sex = V1_sex,
                                                    classes = V1_classes,
                                                    ctime = V1_ctime,
                                                    likes = V1_likes},
                                     V1_friend_comment,
                                     V1_friend_moment_photo}
                                        <- V0_moments]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11875:16/little,
       D_a_t_a/binary>>};
pack(cli, 11876, {}) ->
    {ok, <<2:32/little, 11876:16/little>>};
pack(srv, 11876, {V0_notifications_num}) ->
    D_a_t_a = <<V0_notifications_num:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11876:16/little,
       D_a_t_a/binary>>};
pack(cli, 11877, {}) ->
    {ok, <<2:32/little, 11877:16/little>>};
pack(srv, 11877, {V0_unread_num}) ->
    D_a_t_a = <<V0_unread_num:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11877:16/little,
       D_a_t_a/binary>>};
pack(cli, 11878,
     {V0_rid, V0_platform, V0_zone_id, V0_pos}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_pos:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11878:16/little,
       D_a_t_a/binary>>};
pack(srv, 11878, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11878:16/little,
       D_a_t_a/binary>>};
pack(cli, 11879, {}) ->
    {ok, <<2:32/little, 11879:16/little>>};
pack(srv, 11879,
     {#friend_recall{id = V0_id, lists = V0_lists,
                     rewards = V0_rewards,
                     role_id_bind = {V0_role_id, V0_platform, V0_zone_id},
                     role_name_bind = V0_role_name_bind}}) ->
    D_a_t_a = <<(protocol:pack(string, V0_id))/binary,
                (length(V0_lists)):16/little,
                (list_to_binary([<<V1_role_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little, V1_pos:8/little,
                                   V1_login:8/little>>
                                 || {{V1_role_id, V1_platform, V1_zone_id},
                                     V1_pos,
                                     V1_login}
                                        <- V0_lists]))/binary,
                (length(V0_rewards)):16/little,
                (list_to_binary([<<V1_id:8/little>>
                                 || V1_id <- V0_rewards]))/binary,
                V0_role_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_role_name_bind))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11879:16/little,
       D_a_t_a/binary>>};
pack(cli, 11880, {V0_rid}) ->
    D_a_t_a = <<(protocol:pack(string, V0_rid))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11880:16/little,
       D_a_t_a/binary>>};
pack(srv, 11880, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11880:16/little,
       D_a_t_a/binary>>};
pack(cli, 11881, {}) ->
    {ok, <<2:32/little, 11881:16/little>>};
pack(srv, 11881,
     {#friend_recalled{status = V0_status, bind = V0_bind,
                       time_return = V0_time_return, rewards = V0_rewards,
                       role_id_recall = {V0_role_id, V0_platform, V0_zone_id},
                       role_name_recall = V0_role_name_recall}}) ->
    D_a_t_a = <<V0_status:8/little, V0_bind:8/little,
                V0_time_return:32/little,
                (length(V0_rewards)):16/little,
                (list_to_binary([<<V1_id:8/little>>
                                 || V1_id <- V0_rewards]))/binary,
                V0_role_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_role_name_recall))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11881:16/little,
       D_a_t_a/binary>>};
pack(cli, 11882, {V0_id}) ->
    D_a_t_a = <<V0_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11882:16/little,
       D_a_t_a/binary>>};
pack(srv, 11882, {V0_id, V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_id:8/little, V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11882:16/little,
       D_a_t_a/binary>>};
pack(cli, 11884, {V0_id}) ->
    D_a_t_a = <<V0_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11884:16/little,
       D_a_t_a/binary>>};
pack(srv, 11884, {V0_id, V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_id:8/little, V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11884:16/little,
       D_a_t_a/binary>>};
pack(cli, 11885,
     {V0_role_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_role_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11885:16/little,
       D_a_t_a/binary>>};
pack(srv, 11885,
     {{V0_role_id, V0_platform, V0_zone_id},
      V0_activite,
      V0_time_return}) ->
    D_a_t_a = <<V0_role_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_activite:32/little,
                V0_time_return:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11885:16/little,
       D_a_t_a/binary>>};
pack(cli, 11886, {}) ->
    {ok, <<2:32/little, 11886:16/little>>};
pack(srv, 11886, {V0_buffs}) ->
    D_a_t_a = <<(length(V0_buffs)):16/little,
                (list_to_binary([<<V1_buff_id:16/little>>
                                 || V1_buff_id <- V0_buffs]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11886:16/little,
       D_a_t_a/binary>>};
pack(cli, 11887, {}) ->
    {ok, <<2:32/little, 11887:16/little>>};
pack(srv, 11887, {V0_times}) ->
    D_a_t_a = <<V0_times:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11887:16/little,
       D_a_t_a/binary>>};
pack(cli, 11888, {V0_offline_push}) ->
    D_a_t_a = <<V0_offline_push:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11888:16/little,
       D_a_t_a/binary>>};
pack(srv, 11888, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11888:16/little,
       D_a_t_a/binary>>};
pack(cli, 11889, {V0_item_id}) ->
    D_a_t_a = <<V0_item_id:32/signed-little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11889:16/little,
       D_a_t_a/binary>>};
pack(srv, 11889,
     {V0_item_id,
      {V0_rid, V0_platform, V0_zone_id},
      V0_role_name,
      V0_times}) ->
    D_a_t_a = <<V0_item_id:32/little, V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_role_name))/binary,
                V0_times:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11889:16/little,
       D_a_t_a/binary>>};
pack(cli, 11890, {V0_id, V0_msg}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11890:16/little,
       D_a_t_a/binary>>};
pack(srv, 11890, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/signed-little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11890:16/little,
       D_a_t_a/binary>>};
pack(cli, 11891, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11891:16/little,
       D_a_t_a/binary>>};
pack(srv, 11891, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11891:16/little,
       D_a_t_a/binary>>};
pack(cli, 11892, {V0_honor_id}) ->
    D_a_t_a = <<V0_honor_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11892:16/little,
       D_a_t_a/binary>>};
pack(srv, 11892, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11892:16/little,
       D_a_t_a/binary>>};
pack(cli, 11893, {V0_camp_id, V0_req_type}) ->
    D_a_t_a = <<V0_camp_id:32/little,
                V0_req_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11893:16/little,
       D_a_t_a/binary>>};
pack(srv, 11893,
     {V0_camp_id, V0_req_type, V0_moments, V0_lucky_list}) ->
    D_a_t_a = <<V0_camp_id:32/little, V0_req_type:8/little,
                (length(V0_moments)):16/little,
                (list_to_binary([<<V1_m_id:32/little,
                                   (protocol:pack(string,
                                                  V1_m_platform))/binary,
                                   V1_m_zone_id:16/little, V1_type:8/little,
                                   V1_role_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   (protocol:pack(string, V1_content))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_ctime:32/little,
                                   (length(V1_likes)):16/little,
                                   (list_to_binary([<<V2_liker_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_liker_platform))/binary,
                                                      V2_liker_zone_id:16/little,
                                                      (protocol:pack(string,
                                                                     V2_name))/binary,
                                                      V2_sex:8/little,
                                                      V2_classes:8/little,
                                                      V2_ctime:32/little>>
                                                    || #friend_moment_like{rid =
                                                                               {V2_liker_id,
                                                                                V2_liker_platform,
                                                                                V2_liker_zone_id},
                                                                           name
                                                                               =
                                                                               V2_name,
                                                                           sex =
                                                                               V2_sex,
                                                                           classes
                                                                               =
                                                                               V2_classes,
                                                                           ctime
                                                                               =
                                                                               V2_ctime}
                                                           <- V1_likes]))/binary,
                                   (length(V1_friend_comment)):16/little,
                                   (list_to_binary([<<V2_commentator_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_commentator_platform))/binary,
                                                      V2_commentator_zone_id:16/little,
                                                      V2_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_name))/binary,
                                                      V2_sex:8/little,
                                                      V2_classes:8/little,
                                                      V2_ctime:32/little,
                                                      (protocol:pack(string,
                                                                     V2_msg))/binary>>
                                                    || #friend_comment{rid =
                                                                           {V2_commentator_id,
                                                                            V2_commentator_platform,
                                                                            V2_commentator_zone_id},
                                                                       id =
                                                                           V2_id,
                                                                       name =
                                                                           V2_name,
                                                                       sex =
                                                                           V2_sex,
                                                                       classes =
                                                                           V2_classes,
                                                                       ctime =
                                                                           V2_ctime,
                                                                       msg =
                                                                           V2_msg}
                                                           <- V1_friend_comment]))/binary,
                                   (length(V1_friend_moment_photo)):16/little,
                                   (list_to_binary([<<V2_id:8/little,
                                                      V2_auditing:8/little,
                                                      V2_uploaded:32/little>>
                                                    || #friend_moment_photo{id =
                                                                                V2_id,
                                                                            auditing
                                                                                =
                                                                                V2_auditing,
                                                                            uploaded
                                                                                =
                                                                                V2_uploaded}
                                                           <- V1_friend_moment_photo]))/binary>>
                                 || {#friend_moment{id =
                                                        {V1_m_id,
                                                         V1_m_platform,
                                                         V1_m_zone_id},
                                                    type = V1_type,
                                                    rid =
                                                        {V1_role_id,
                                                         V1_platform,
                                                         V1_zone_id},
                                                    name = V1_name,
                                                    content = V1_content,
                                                    sex = V1_sex,
                                                    classes = V1_classes,
                                                    ctime = V1_ctime,
                                                    likes = V1_likes},
                                     V1_friend_comment,
                                     V1_friend_moment_photo}
                                        <- V0_moments]))/binary,
                (length(V0_lucky_list)):16/little,
                (list_to_binary([<<V1_moment_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little>>
                                 || {V1_moment_id, V1_platform, V1_zone_id}
                                        <- V0_lucky_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11893:16/little,
       D_a_t_a/binary>>};
pack(cli, 11894, {V0_camp_id}) ->
    D_a_t_a = <<V0_camp_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11894:16/little,
       D_a_t_a/binary>>};
pack(srv, 11894, {V0_contents}) ->
    D_a_t_a = <<(length(V0_contents)):16/little,
                (list_to_binary([<<(protocol:pack(string,
                                                  V1_content))/binary>>
                                 || V1_content <- V0_contents]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11894:16/little,
       D_a_t_a/binary>>};
pack(cli, 11895, {}) ->
    {ok, <<2:32/little, 11895:16/little>>};
pack(srv, 11895, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11895:16/little,
       D_a_t_a/binary>>};
pack(cli, 11896, {}) ->
    {ok, <<2:32/little, 11896:16/little>>};
pack(srv, 11896, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11896:16/little,
       D_a_t_a/binary>>};
pack(cli, 11897, {}) ->
    {ok, <<2:32/little, 11897:16/little>>};
pack(srv, 11897, {V0_camp_wish}) ->
    D_a_t_a = <<(length(V0_camp_wish)):16/little,
                (list_to_binary([<<V1_camp_id:32/little,
                                   (length(V1_moments)):16/little,
                                   (list_to_binary([<<V2_m_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_m_platform))/binary,
                                                      V2_m_zone_id:16/little,
                                                      V2_type:8/little,
                                                      V2_role_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_platform))/binary,
                                                      V2_zone_id:16/little,
                                                      (protocol:pack(string,
                                                                     V2_name))/binary,
                                                      (protocol:pack(string,
                                                                     V2_content))/binary,
                                                      V2_sex:8/little,
                                                      V2_classes:8/little,
                                                      V2_ctime:32/little,
                                                      (length(V2_likes)):16/little,
                                                      (list_to_binary([<<V3_liker_id:32/little,
                                                                         (protocol:pack(string,
                                                                                        V3_liker_platform))/binary,
                                                                         V3_liker_zone_id:16/little,
                                                                         (protocol:pack(string,
                                                                                        V3_name))/binary,
                                                                         V3_sex:8/little,
                                                                         V3_classes:8/little,
                                                                         V3_ctime:32/little>>
                                                                       || #friend_moment_like{rid
                                                                                                  =
                                                                                                  {V3_liker_id,
                                                                                                   V3_liker_platform,
                                                                                                   V3_liker_zone_id},
                                                                                              name
                                                                                                  =
                                                                                                  V3_name,
                                                                                              sex
                                                                                                  =
                                                                                                  V3_sex,
                                                                                              classes
                                                                                                  =
                                                                                                  V3_classes,
                                                                                              ctime
                                                                                                  =
                                                                                                  V3_ctime}
                                                                              <- V2_likes]))/binary,
                                                      (length(V2_friend_comment)):16/little,
                                                      (list_to_binary([<<V3_commentator_id:32/little,
                                                                         (protocol:pack(string,
                                                                                        V3_commentator_platform))/binary,
                                                                         V3_commentator_zone_id:16/little,
                                                                         V3_id:32/little,
                                                                         (protocol:pack(string,
                                                                                        V3_name))/binary,
                                                                         V3_sex:8/little,
                                                                         V3_classes:8/little,
                                                                         V3_ctime:32/little,
                                                                         (protocol:pack(string,
                                                                                        V3_msg))/binary>>
                                                                       || #friend_comment{rid
                                                                                              =
                                                                                              {V3_commentator_id,
                                                                                               V3_commentator_platform,
                                                                                               V3_commentator_zone_id},
                                                                                          id
                                                                                              =
                                                                                              V3_id,
                                                                                          name
                                                                                              =
                                                                                              V3_name,
                                                                                          sex
                                                                                              =
                                                                                              V3_sex,
                                                                                          classes
                                                                                              =
                                                                                              V3_classes,
                                                                                          ctime
                                                                                              =
                                                                                              V3_ctime,
                                                                                          msg
                                                                                              =
                                                                                              V3_msg}
                                                                              <- V2_friend_comment]))/binary,
                                                      (length(V2_friend_moment_photo)):16/little,
                                                      (list_to_binary([<<V3_id:8/little,
                                                                         V3_auditing:8/little,
                                                                         V3_uploaded:32/little>>
                                                                       || #friend_moment_photo{id
                                                                                                   =
                                                                                                   V3_id,
                                                                                               auditing
                                                                                                   =
                                                                                                   V3_auditing,
                                                                                               uploaded
                                                                                                   =
                                                                                                   V3_uploaded}
                                                                              <- V2_friend_moment_photo]))/binary>>
                                                    || {#friend_moment{id =
                                                                           {V2_m_id,
                                                                            V2_m_platform,
                                                                            V2_m_zone_id},
                                                                       type =
                                                                           V2_type,
                                                                       rid =
                                                                           {V2_role_id,
                                                                            V2_platform,
                                                                            V2_zone_id},
                                                                       name =
                                                                           V2_name,
                                                                       content =
                                                                           V2_content,
                                                                       sex =
                                                                           V2_sex,
                                                                       classes =
                                                                           V2_classes,
                                                                       ctime =
                                                                           V2_ctime,
                                                                       likes =
                                                                           V2_likes},
                                                        V2_friend_comment,
                                                        V2_friend_moment_photo}
                                                           <- V1_moments]))/binary>>
                                 || {V1_camp_id, V1_moments}
                                        <- V0_camp_wish]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11897:16/little,
       D_a_t_a/binary>>};
pack(cli, 11898, {V0_privacy_zone}) ->
    D_a_t_a = <<V0_privacy_zone:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11898:16/little,
       D_a_t_a/binary>>};
pack(srv, 11898, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11898:16/little,
       D_a_t_a/binary>>};
pack(cli, 11899, {V0_privacy_moments}) ->
    D_a_t_a = <<V0_privacy_moments:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11899:16/little,
       D_a_t_a/binary>>};
pack(srv, 11899, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11899:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 11800, _B0) -> {ok, {}};
unpack(cli, 11800, _B0) ->
    {V1_signature, _B1} = protocol:string(_B0),
    {V1_fans, _B2} = protocol:uint16(_B1),
    {V1_glamor, _B3} = protocol:uint32(_B2),
    {V1_offline_push, _B4} = protocol:uint8(_B3),
    {V1_max_num, _B5} = protocol:uint16(_B4),
    {ok,
     {V1_signature,
      V1_fans,
      V1_glamor,
      V1_offline_push,
      V1_max_num}};
unpack(srv, 11801, _B0) -> {ok, {}};
unpack(cli, 11801, _B0) ->
    {V1_list, _B29} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_id, _B2} =
                                                 protocol:uint32(_B1),
                                             {V2_platform, _B3} =
                                                 protocol:string(_B2),
                                             {V2_zone_id, _B4} =
                                                 protocol:uint16(_B3),
                                             {V2_type, _B5} =
                                                 protocol:uint8(_B4),
                                             {V2_intimacy, _B6} =
                                                 protocol:uint32(_B5),
                                             {V2_name, _B7} =
                                                 protocol:string(_B6),
                                             {V2_online, _B8} =
                                                 protocol:uint8(_B7),
                                             {V2_sex, _B9} =
                                                 protocol:uint8(_B8),
                                             {V2_classes, _B10} =
                                                 protocol:uint8(_B9),
                                             {V2_lev, _B11} =
                                                 protocol:uint8(_B10),
                                             {V2_fc, _B12} =
                                                 protocol:uint32(_B11),
                                             {V2_total_fc, _B13} =
                                                 protocol:uint32(_B12),
                                             {V2_face, _B14} =
                                                 protocol:uint32(_B13),
                                             {V2_glamor, _B15} =
                                                 protocol:uint32(_B14),
                                             {V2_signature, _B16} =
                                                 protocol:string(_B15),
                                             {V2_city, _B17} =
                                                 protocol:string(_B16),
                                             {V2_online_time, _B18} =
                                                 protocol:uint32(_B17),
                                             {V2_guild, _B19} =
                                                 protocol:string(_B18),
                                             {V2_looks, _B26} =
                                                 protocol:array(_B19,
                                                                fun (_B20) ->
                                                                        {V3_looks_type,
                                                                         _B21} =
                                                                            protocol:uint32(_B20),
                                                                        {V3_looks_mode,
                                                                         _B22} =
                                                                            protocol:uint32(_B21),
                                                                        {V3_looks_val,
                                                                         _B23} =
                                                                            protocol:uint32(_B22),
                                                                        {V3_looks_str,
                                                                         _B24} =
                                                                            protocol:string(_B23),
                                                                        {{V3_looks_type,
                                                                          V3_looks_mode,
                                                                          V3_looks_val,
                                                                          V3_looks_str},
                                                                         _B24}
                                                                end),
                                             {V2_offline_push, _B27} =
                                                 protocol:uint8(_B26),
                                             {{V2_id,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_type,
                                               V2_intimacy,
                                               V2_name,
                                               V2_online,
                                               V2_sex,
                                               V2_classes,
                                               V2_lev,
                                               V2_fc,
                                               V2_total_fc,
                                               V2_face,
                                               V2_glamor,
                                               V2_signature,
                                               V2_city,
                                               V2_online_time,
                                               V2_guild,
                                               V2_looks,
                                               V2_offline_push},
                                              _B27}
                                     end),
    {ok, {V1_list}};
unpack(srv, 11802, _B0) -> {ok, {}};
unpack(cli, 11802, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_list, _B30} = protocol:array(_B1,
                                     fun (_B2) ->
                                             {V2_id, _B3} =
                                                 protocol:uint32(_B2),
                                             {V2_platform, _B4} =
                                                 protocol:string(_B3),
                                             {V2_zone_id, _B5} =
                                                 protocol:uint16(_B4),
                                             {V2_type, _B6} =
                                                 protocol:uint8(_B5),
                                             {V2_intimacy, _B7} =
                                                 protocol:uint32(_B6),
                                             {V2_name, _B8} =
                                                 protocol:string(_B7),
                                             {V2_online, _B9} =
                                                 protocol:uint8(_B8),
                                             {V2_sex, _B10} =
                                                 protocol:uint8(_B9),
                                             {V2_classes, _B11} =
                                                 protocol:uint8(_B10),
                                             {V2_lev, _B12} =
                                                 protocol:uint8(_B11),
                                             {V2_fc, _B13} =
                                                 protocol:uint32(_B12),
                                             {V2_total_fc, _B14} =
                                                 protocol:uint32(_B13),
                                             {V2_face, _B15} =
                                                 protocol:uint32(_B14),
                                             {V2_glamor, _B16} =
                                                 protocol:uint32(_B15),
                                             {V2_signature, _B17} =
                                                 protocol:string(_B16),
                                             {V2_city, _B18} =
                                                 protocol:string(_B17),
                                             {V2_online_time, _B19} =
                                                 protocol:uint32(_B18),
                                             {V2_guild, _B20} =
                                                 protocol:string(_B19),
                                             {V2_looks, _B27} =
                                                 protocol:array(_B20,
                                                                fun (_B21) ->
                                                                        {V3_looks_type,
                                                                         _B22} =
                                                                            protocol:uint32(_B21),
                                                                        {V3_looks_mode,
                                                                         _B23} =
                                                                            protocol:uint32(_B22),
                                                                        {V3_looks_val,
                                                                         _B24} =
                                                                            protocol:uint32(_B23),
                                                                        {V3_looks_str,
                                                                         _B25} =
                                                                            protocol:string(_B24),
                                                                        {{V3_looks_type,
                                                                          V3_looks_mode,
                                                                          V3_looks_val,
                                                                          V3_looks_str},
                                                                         _B25}
                                                                end),
                                             {V2_offline_push, _B28} =
                                                 protocol:uint8(_B27),
                                             {{V2_id,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_type,
                                               V2_intimacy,
                                               V2_name,
                                               V2_online,
                                               V2_sex,
                                               V2_classes,
                                               V2_lev,
                                               V2_fc,
                                               V2_total_fc,
                                               V2_face,
                                               V2_glamor,
                                               V2_signature,
                                               V2_city,
                                               V2_online_time,
                                               V2_guild,
                                               V2_looks,
                                               V2_offline_push},
                                              _B28}
                                     end),
    {ok, {V1_type, V1_list}};
unpack(srv, 11803, _B0) ->
    {V1_signature, _B1} = protocol:string(_B0),
    {ok, {V1_signature}};
unpack(cli, 11803, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11804, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 11804, _B0) -> {ok, {}};
unpack(srv, 11805, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_name, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {V1_platform, _B4} = protocol:string(_B3),
    {V1_zone_id, _B5} = protocol:uint16(_B4),
    {ok,
     {V1_flag, V1_name, V1_id, V1_platform, V1_zone_id}};
unpack(cli, 11805, _B0) -> {ok, {}};
unpack(srv, 11806, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 11806, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(srv, 11807, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 11807, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11808, _B0) ->
    {V1_name, _B1} = protocol:string(_B0),
    {ok, {V1_name}};
unpack(cli, 11808, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_sex, _B5} = protocol:uint8(_B4),
    {V1_classes, _B6} = protocol:uint8(_B5),
    {V1_lev, _B7} = protocol:uint8(_B6),
    {V1_fc, _B8} = protocol:uint16(_B7),
    {V1_guild, _B9} = protocol:string(_B8),
    {ok,
     {V1_id,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_sex,
      V1_classes,
      V1_lev,
      V1_fc,
      V1_guild}};
unpack(srv, 11809, _B0) -> {ok, {}};
unpack(cli, 11809, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_sex, _B5} = protocol:uint8(_B4),
    {V1_classes, _B6} = protocol:uint8(_B5),
    {V1_lev, _B7} = protocol:uint8(_B6),
    {V1_fc, _B8} = protocol:uint32(_B7),
    {V1_total_fc, _B9} = protocol:uint32(_B8),
    {V1_face, _B10} = protocol:uint32(_B9),
    {ok,
     {V1_id,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_sex,
      V1_classes,
      V1_lev,
      V1_fc,
      V1_total_fc,
      V1_face}};
unpack(srv, 11810, _B0) -> {ok, {}};
unpack(cli, 11810, _B0) ->
    {V1_list, _B27} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_id, _B2} =
                                                 protocol:uint32(_B1),
                                             {V2_platform, _B3} =
                                                 protocol:string(_B2),
                                             {V2_zone_id, _B4} =
                                                 protocol:uint16(_B3),
                                             {V2_name, _B5} =
                                                 protocol:string(_B4),
                                             {V2_online, _B6} =
                                                 protocol:uint8(_B5),
                                             {V2_sex, _B7} =
                                                 protocol:uint8(_B6),
                                             {V2_classes, _B8} =
                                                 protocol:uint8(_B7),
                                             {V2_lev, _B9} =
                                                 protocol:uint8(_B8),
                                             {V2_fc, _B10} =
                                                 protocol:uint32(_B9),
                                             {V2_total_fc, _B11} =
                                                 protocol:uint32(_B10),
                                             {V2_face, _B12} =
                                                 protocol:uint32(_B11),
                                             {V2_glamor, _B13} =
                                                 protocol:uint32(_B12),
                                             {V2_signature, _B14} =
                                                 protocol:string(_B13),
                                             {V2_city, _B15} =
                                                 protocol:string(_B14),
                                             {V2_online_time, _B16} =
                                                 protocol:uint32(_B15),
                                             {V2_guild, _B17} =
                                                 protocol:string(_B16),
                                             {V2_looks, _B24} =
                                                 protocol:array(_B17,
                                                                fun (_B18) ->
                                                                        {V3_looks_type,
                                                                         _B19} =
                                                                            protocol:uint32(_B18),
                                                                        {V3_looks_mode,
                                                                         _B20} =
                                                                            protocol:uint32(_B19),
                                                                        {V3_looks_val,
                                                                         _B21} =
                                                                            protocol:uint32(_B20),
                                                                        {V3_looks_str,
                                                                         _B22} =
                                                                            protocol:string(_B21),
                                                                        {{V3_looks_type,
                                                                          V3_looks_mode,
                                                                          V3_looks_val,
                                                                          V3_looks_str},
                                                                         _B22}
                                                                end),
                                             {V2_offline_push, _B25} =
                                                 protocol:uint8(_B24),
                                             {{V2_id,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_name,
                                               V2_online,
                                               V2_sex,
                                               V2_classes,
                                               V2_lev,
                                               V2_fc,
                                               V2_total_fc,
                                               V2_face,
                                               V2_glamor,
                                               V2_signature,
                                               V2_city,
                                               V2_online_time,
                                               V2_guild,
                                               V2_looks,
                                               V2_offline_push},
                                              _B25}
                                     end),
    {ok, {V1_list}};
unpack(srv, 11811, _B0) -> {ok, {}};
unpack(cli, 11811, _B0) ->
    {V1_friend_request, _B13} = protocol:array(_B0,
                                               fun (_B1) ->
                                                       {V2_id, _B2} =
                                                           protocol:uint32(_B1),
                                                       {V2_platform, _B3} =
                                                           protocol:string(_B2),
                                                       {V2_zone_id, _B4} =
                                                           protocol:uint16(_B3),
                                                       {V2_name, _B5} =
                                                           protocol:string(_B4),
                                                       {V2_sex, _B6} =
                                                           protocol:uint8(_B5),
                                                       {V2_classes, _B7} =
                                                           protocol:uint8(_B6),
                                                       {V2_lev, _B8} =
                                                           protocol:uint8(_B7),
                                                       {V2_fc, _B9} =
                                                           protocol:uint32(_B8),
                                                       {V2_total_fc, _B10} =
                                                           protocol:uint32(_B9),
                                                       {V2_face, _B11} =
                                                           protocol:uint32(_B10),
                                                       {{V2_id,
                                                         V2_platform,
                                                         V2_zone_id,
                                                         V2_name,
                                                         V2_sex,
                                                         V2_classes,
                                                         V2_lev,
                                                         V2_fc,
                                                         V2_total_fc,
                                                         V2_face},
                                                        _B11}
                                               end),
    {ok, {V1_friend_request}};
unpack(srv, 11820, _B0) -> {ok, {}};
unpack(cli, 11820, _B0) ->
    {V1_name, _B1} = protocol:string(_B0),
    {V1_name_used, _B2} = protocol:string(_B1),
    {V1_sex, _B3} = protocol:uint8(_B2),
    {V1_classes, _B4} = protocol:uint8(_B3),
    {V1_birth, _B5} = protocol:string(_B4),
    {V1_constellation, _B6} = protocol:uint8(_B5),
    {V1_abo, _B7} = protocol:uint8(_B6),
    {V1_signature, _B8} = protocol:string(_B7),
    {V1_spouse_name, _B9} = protocol:string(_B8),
    {V1_guild, _B10} = protocol:string(_B9),
    {V1_region, _B11} = protocol:string(_B10),
    {V1_city, _B12} = protocol:string(_B11),
    {V1_is_shared_region, _B13} = protocol:uint8(_B12),
    {V1_visited, _B14} = protocol:uint32(_B13),
    {V1_privacy, _B15} = protocol:uint8(_B14),
    {V1_liked, _B16} = protocol:uint32(_B15),
    {V1_prize_num, _B17} = protocol:uint32(_B16),
    {V1_present_num, _B18} = protocol:uint32(_B17),
    {V1_honor_id, _B19} = protocol:uint32(_B18),
    {V1_lover_name, _B20} = protocol:string(_B19),
    {V1_teacher_name, _B21} = protocol:string(_B20),
    {V1_theme, _B22} = protocol:uint16(_B21),
    {V1_photo_frame, _B23} = protocol:uint16(_B22),
    {V1_sworn_name, _B24} = protocol:string(_B23),
    {V1_photo, _B30} = protocol:array(_B24,
                                      fun (_B25) ->
                                              {V2_id, _B26} =
                                                  protocol:uint8(_B25),
                                              {V2_auditing, _B27} =
                                                  protocol:uint8(_B26),
                                              {V2_uploaded, _B28} =
                                                  protocol:uint32(_B27),
                                              {{V2_id,
                                                V2_auditing,
                                                V2_uploaded},
                                               _B28}
                                      end),
    {V1_badges, _B34} = protocol:array(_B30,
                                       fun (_B31) ->
                                               {V2_badge_id, _B32} =
                                                   protocol:uint16(_B31),
                                               {{V2_badge_id}, _B32}
                                       end),
    {V1_visitors, _B44} = protocol:array(_B34,
                                         fun (_B35) ->
                                                 {V2_id, _B36} =
                                                     protocol:uint32(_B35),
                                                 {V2_platform, _B37} =
                                                     protocol:string(_B36),
                                                 {V2_zone_id, _B38} =
                                                     protocol:uint16(_B37),
                                                 {V2_name, _B39} =
                                                     protocol:string(_B38),
                                                 {V2_classes, _B40} =
                                                     protocol:uint8(_B39),
                                                 {V2_sex, _B41} =
                                                     protocol:uint8(_B40),
                                                 {V2_time, _B42} =
                                                     protocol:uint32(_B41),
                                                 {{V2_id,
                                                   V2_platform,
                                                   V2_zone_id,
                                                   V2_name,
                                                   V2_classes,
                                                   V2_sex,
                                                   V2_time},
                                                  _B42}
                                         end),
    {V1_subscribed, _B55} = protocol:array(_B44,
                                           fun (_B45) ->
                                                   {V2_id, _B46} =
                                                       protocol:uint32(_B45),
                                                   {V2_platform, _B47} =
                                                       protocol:string(_B46),
                                                   {V2_zone_id, _B48} =
                                                       protocol:uint16(_B47),
                                                   {V2_name, _B49} =
                                                       protocol:string(_B48),
                                                   {V2_classes, _B50} =
                                                       protocol:uint8(_B49),
                                                   {V2_sex, _B51} =
                                                       protocol:uint8(_B50),
                                                   {V2_cared, _B52} =
                                                       protocol:uint8(_B51),
                                                   {V2_interacted, _B53} =
                                                       protocol:uint32(_B52),
                                                   {{V2_id,
                                                     V2_platform,
                                                     V2_zone_id,
                                                     V2_name,
                                                     V2_classes,
                                                     V2_sex,
                                                     V2_cared,
                                                     V2_interacted},
                                                    _B53}
                                           end),
    {V1_fans, _B66} = protocol:array(_B55,
                                     fun (_B56) ->
                                             {V2_id, _B57} =
                                                 protocol:uint32(_B56),
                                             {V2_platform, _B58} =
                                                 protocol:string(_B57),
                                             {V2_zone_id, _B59} =
                                                 protocol:uint16(_B58),
                                             {V2_name, _B60} =
                                                 protocol:string(_B59),
                                             {V2_classes, _B61} =
                                                 protocol:uint8(_B60),
                                             {V2_sex, _B62} =
                                                 protocol:uint8(_B61),
                                             {V2_cared, _B63} =
                                                 protocol:uint8(_B62),
                                             {V2_interacted, _B64} =
                                                 protocol:uint32(_B63),
                                             {{V2_id,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_name,
                                               V2_classes,
                                               V2_sex,
                                               V2_cared,
                                               V2_interacted},
                                              _B64}
                                     end),
    {V1_tags, _B71} = protocol:array(_B66,
                                     fun (_B67) ->
                                             {V2_tag_id, _B68} =
                                                 protocol:uint8(_B67),
                                             {V2_tag, _B69} =
                                                 protocol:string(_B68),
                                             {{V2_tag_id, V2_tag}, _B69}
                                     end),
    {V1_show_honor, _B72} = protocol:uint16(_B71),
    {V1_pre_honor_id, _B73} = protocol:uint32(_B72),
    {V1_privacy_zone, _B74} = protocol:uint8(_B73),
    {V1_privacy_moments, _B75} = protocol:uint8(_B74),
    {ok,
     {V1_name,
      V1_name_used,
      V1_sex,
      V1_classes,
      V1_birth,
      V1_constellation,
      V1_abo,
      V1_signature,
      V1_spouse_name,
      V1_guild,
      V1_region,
      V1_city,
      V1_is_shared_region,
      V1_visited,
      V1_privacy,
      V1_liked,
      V1_prize_num,
      V1_present_num,
      V1_honor_id,
      V1_lover_name,
      V1_teacher_name,
      V1_theme,
      V1_photo_frame,
      V1_sworn_name,
      V1_photo,
      V1_badges,
      V1_visitors,
      V1_subscribed,
      V1_fans,
      V1_tags,
      V1_show_honor,
      V1_pre_honor_id,
      V1_privacy_zone,
      V1_privacy_moments}};
unpack(srv, 11821, _B0) -> {ok, {}};
unpack(cli, 11821, _B0) ->
    {V1_trends, _B20} = protocol:array(_B0,
                                       fun (_B1) ->
                                               {V2_likable, _B2} =
                                                   protocol:uint8(_B1),
                                               {V2_id, _B3} =
                                                   protocol:uint32(_B2),
                                               {V2_type, _B4} =
                                                   protocol:uint8(_B3),
                                               {V2_role_id, _B5} =
                                                   protocol:uint32(_B4),
                                               {V2_platform, _B6} =
                                                   protocol:string(_B5),
                                               {V2_zone_id, _B7} =
                                                   protocol:uint16(_B6),
                                               {V2_name, _B8} =
                                                   protocol:string(_B7),
                                               {V2_content, _B9} =
                                                   protocol:string(_B8),
                                               {V2_sex, _B10} =
                                                   protocol:uint8(_B9),
                                               {V2_classes, _B11} =
                                                   protocol:uint8(_B10),
                                               {V2_ctime, _B12} =
                                                   protocol:uint32(_B11),
                                               {V2_liked, _B13} =
                                                   protocol:uint32(_B12),
                                               {V2_presents, _B18} =
                                                   protocol:array(_B13,
                                                                  fun (_B14) ->
                                                                          {V3_base_id,
                                                                           _B15} =
                                                                              protocol:uint32(_B14),
                                                                          {V3_num,
                                                                           _B16} =
                                                                              protocol:uint32(_B15),
                                                                          {{V3_base_id,
                                                                            V3_num},
                                                                           _B16}
                                                                  end),
                                               {{V2_likable,
                                                 V2_id,
                                                 V2_type,
                                                 V2_role_id,
                                                 V2_platform,
                                                 V2_zone_id,
                                                 V2_name,
                                                 V2_content,
                                                 V2_sex,
                                                 V2_classes,
                                                 V2_ctime,
                                                 V2_liked,
                                                 V2_presents},
                                                _B18}
                                       end),
    {ok, {V1_trends}};
unpack(srv, 11822, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 11822, _B0) ->
    {V1_name, _B1} = protocol:string(_B0),
    {V1_name_used, _B2} = protocol:string(_B1),
    {V1_sex, _B3} = protocol:uint8(_B2),
    {V1_classes, _B4} = protocol:uint8(_B3),
    {V1_lev, _B5} = protocol:uint16(_B4),
    {V1_birth, _B6} = protocol:string(_B5),
    {V1_constellation, _B7} = protocol:uint8(_B6),
    {V1_abo, _B8} = protocol:uint8(_B7),
    {V1_signature, _B9} = protocol:string(_B8),
    {V1_spouse_name, _B10} = protocol:string(_B9),
    {V1_guild, _B11} = protocol:string(_B10),
    {V1_region, _B12} = protocol:string(_B11),
    {V1_city, _B13} = protocol:string(_B12),
    {V1_is_shared_region, _B14} = protocol:uint8(_B13),
    {V1_visited, _B15} = protocol:uint32(_B14),
    {V1_privacy, _B16} = protocol:uint8(_B15),
    {V1_liked, _B17} = protocol:uint32(_B16),
    {V1_prize_num, _B18} = protocol:uint32(_B17),
    {V1_present_num, _B19} = protocol:uint32(_B18),
    {V1_honor_id, _B20} = protocol:uint32(_B19),
    {V1_lover_name, _B21} = protocol:string(_B20),
    {V1_teacher_name, _B22} = protocol:string(_B21),
    {V1_theme, _B23} = protocol:uint16(_B22),
    {V1_photo_frame, _B24} = protocol:uint16(_B23),
    {V1_sworn_name, _B25} = protocol:string(_B24),
    {V1_photo, _B31} = protocol:array(_B25,
                                      fun (_B26) ->
                                              {V2_id, _B27} =
                                                  protocol:uint8(_B26),
                                              {V2_auditing, _B28} =
                                                  protocol:uint8(_B27),
                                              {V2_uploaded, _B29} =
                                                  protocol:uint32(_B28),
                                              {{V2_id,
                                                V2_auditing,
                                                V2_uploaded},
                                               _B29}
                                      end),
    {V1_badges, _B35} = protocol:array(_B31,
                                       fun (_B32) ->
                                               {V2_badge_id, _B33} =
                                                   protocol:uint16(_B32),
                                               {{V2_badge_id}, _B33}
                                       end),
    {V1_visitors, _B45} = protocol:array(_B35,
                                         fun (_B36) ->
                                                 {V2_id, _B37} =
                                                     protocol:uint32(_B36),
                                                 {V2_platform, _B38} =
                                                     protocol:string(_B37),
                                                 {V2_zone_id, _B39} =
                                                     protocol:uint16(_B38),
                                                 {V2_name, _B40} =
                                                     protocol:string(_B39),
                                                 {V2_classes, _B41} =
                                                     protocol:uint8(_B40),
                                                 {V2_sex, _B42} =
                                                     protocol:uint8(_B41),
                                                 {V2_time, _B43} =
                                                     protocol:uint32(_B42),
                                                 {{V2_id,
                                                   V2_platform,
                                                   V2_zone_id,
                                                   V2_name,
                                                   V2_classes,
                                                   V2_sex,
                                                   V2_time},
                                                  _B43}
                                         end),
    {V1_subscribed, _B56} = protocol:array(_B45,
                                           fun (_B46) ->
                                                   {V2_id, _B47} =
                                                       protocol:uint32(_B46),
                                                   {V2_platform, _B48} =
                                                       protocol:string(_B47),
                                                   {V2_zone_id, _B49} =
                                                       protocol:uint16(_B48),
                                                   {V2_name, _B50} =
                                                       protocol:string(_B49),
                                                   {V2_classes, _B51} =
                                                       protocol:uint8(_B50),
                                                   {V2_sex, _B52} =
                                                       protocol:uint8(_B51),
                                                   {V2_cared, _B53} =
                                                       protocol:uint8(_B52),
                                                   {V2_interacted, _B54} =
                                                       protocol:uint32(_B53),
                                                   {{V2_id,
                                                     V2_platform,
                                                     V2_zone_id,
                                                     V2_name,
                                                     V2_classes,
                                                     V2_sex,
                                                     V2_cared,
                                                     V2_interacted},
                                                    _B54}
                                           end),
    {V1_fans, _B67} = protocol:array(_B56,
                                     fun (_B57) ->
                                             {V2_id, _B58} =
                                                 protocol:uint32(_B57),
                                             {V2_platform, _B59} =
                                                 protocol:string(_B58),
                                             {V2_zone_id, _B60} =
                                                 protocol:uint16(_B59),
                                             {V2_name, _B61} =
                                                 protocol:string(_B60),
                                             {V2_classes, _B62} =
                                                 protocol:uint8(_B61),
                                             {V2_sex, _B63} =
                                                 protocol:uint8(_B62),
                                             {V2_cared, _B64} =
                                                 protocol:uint8(_B63),
                                             {V2_interacted, _B65} =
                                                 protocol:uint32(_B64),
                                             {{V2_id,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_name,
                                               V2_classes,
                                               V2_sex,
                                               V2_cared,
                                               V2_interacted},
                                              _B65}
                                     end),
    {V1_tags, _B72} = protocol:array(_B67,
                                     fun (_B68) ->
                                             {V2_tag_id, _B69} =
                                                 protocol:uint8(_B68),
                                             {V2_tag, _B70} =
                                                 protocol:string(_B69),
                                             {{V2_tag_id, V2_tag}, _B70}
                                     end),
    {V1_show_honor, _B73} = protocol:uint16(_B72),
    {V1_pre_honor_id, _B74} = protocol:uint32(_B73),
    {V1_is_subscribed, _B75} = protocol:uint8(_B74),
    {V1_likable, _B76} = protocol:uint8(_B75),
    {ok,
     {V1_name,
      V1_name_used,
      V1_sex,
      V1_classes,
      V1_lev,
      V1_birth,
      V1_constellation,
      V1_abo,
      V1_signature,
      V1_spouse_name,
      V1_guild,
      V1_region,
      V1_city,
      V1_is_shared_region,
      V1_visited,
      V1_privacy,
      V1_liked,
      V1_prize_num,
      V1_present_num,
      V1_honor_id,
      V1_lover_name,
      V1_teacher_name,
      V1_theme,
      V1_photo_frame,
      V1_sworn_name,
      V1_photo,
      V1_badges,
      V1_visitors,
      V1_subscribed,
      V1_fans,
      V1_tags,
      V1_show_honor,
      V1_pre_honor_id,
      V1_is_subscribed,
      V1_likable}};
unpack(srv, 11823, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_content, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {V1_platform, _B4} = protocol:string(_B3),
    {V1_zone_id, _B5} = protocol:uint16(_B4),
    {ok,
     {V1_type, V1_content, V1_id, V1_platform, V1_zone_id}};
unpack(cli, 11823, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11824, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_content, _B2} = protocol:string(_B1),
    {ok, {V1_id, V1_content}};
unpack(cli, 11824, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11825, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {ok, {V1_type}};
unpack(cli, 11825, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11826, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_rid, _B2} = protocol:uint32(_B1),
    {V1_platform, _B3} = protocol:string(_B2),
    {V1_zone_id, _B4} = protocol:uint16(_B3),
    {ok, {V1_id, V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 11826, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11827, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 11827, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11828, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 11828, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11829, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 11829, _B0) ->
    {V1_trends, _B20} = protocol:array(_B0,
                                       fun (_B1) ->
                                               {V2_likable, _B2} =
                                                   protocol:uint8(_B1),
                                               {V2_id, _B3} =
                                                   protocol:uint32(_B2),
                                               {V2_type, _B4} =
                                                   protocol:uint8(_B3),
                                               {V2_role_id, _B5} =
                                                   protocol:uint32(_B4),
                                               {V2_platform, _B6} =
                                                   protocol:string(_B5),
                                               {V2_zone_id, _B7} =
                                                   protocol:uint16(_B6),
                                               {V2_name, _B8} =
                                                   protocol:string(_B7),
                                               {V2_content, _B9} =
                                                   protocol:string(_B8),
                                               {V2_sex, _B10} =
                                                   protocol:uint8(_B9),
                                               {V2_classes, _B11} =
                                                   protocol:uint8(_B10),
                                               {V2_ctime, _B12} =
                                                   protocol:uint32(_B11),
                                               {V2_liked, _B13} =
                                                   protocol:uint32(_B12),
                                               {V2_presents, _B18} =
                                                   protocol:array(_B13,
                                                                  fun (_B14) ->
                                                                          {V3_base_id,
                                                                           _B15} =
                                                                              protocol:uint32(_B14),
                                                                          {V3_num,
                                                                           _B16} =
                                                                              protocol:uint32(_B15),
                                                                          {{V3_base_id,
                                                                            V3_num},
                                                                           _B16}
                                                                  end),
                                               {{V2_likable,
                                                 V2_id,
                                                 V2_type,
                                                 V2_role_id,
                                                 V2_platform,
                                                 V2_zone_id,
                                                 V2_name,
                                                 V2_content,
                                                 V2_sex,
                                                 V2_classes,
                                                 V2_ctime,
                                                 V2_liked,
                                                 V2_presents},
                                                _B18}
                                       end),
    {ok, {V1_trends}};
unpack(srv, 11830, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_platform, _B3} = protocol:string(_B2),
    {V1_zone_id, _B4} = protocol:uint16(_B3),
    {ok, {V1_id, V1_id, V1_platform, V1_zone_id}};
unpack(cli, 11830, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {V1_role_id, _B3} = protocol:uint32(_B2),
    {V1_platform, _B4} = protocol:string(_B3),
    {V1_zone_id, _B5} = protocol:uint16(_B4),
    {V1_name, _B6} = protocol:string(_B5),
    {V1_content, _B7} = protocol:string(_B6),
    {V1_sex, _B8} = protocol:uint8(_B7),
    {V1_classes, _B9} = protocol:uint8(_B8),
    {V1_ctime, _B10} = protocol:uint32(_B9),
    {V1_liked, _B11} = protocol:uint32(_B10),
    {V1_presents, _B16} = protocol:array(_B11,
                                         fun (_B12) ->
                                                 {V2_base_id, _B13} =
                                                     protocol:uint32(_B12),
                                                 {V2_num, _B14} =
                                                     protocol:uint32(_B13),
                                                 {{V2_base_id, V2_num}, _B14}
                                         end),
    {ok,
     {V1_id,
      V1_type,
      V1_role_id,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_content,
      V1_sex,
      V1_classes,
      V1_ctime,
      V1_liked,
      V1_presents}};
unpack(srv, 11831, _B0) ->
    {V1_tag, _B1} = protocol:string(_B0),
    {ok, {V1_tag}};
unpack(cli, 11831, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11832, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {ok, {V1_id}};
unpack(cli, 11832, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11833, _B0) ->
    {V1_birth, _B1} = protocol:string(_B0),
    {V1_constellation, _B2} = protocol:uint8(_B1),
    {V1_abo, _B3} = protocol:uint8(_B2),
    {V1_signature, _B4} = protocol:string(_B3),
    {V1_region, _B5} = protocol:string(_B4),
    {V1_sex, _B6} = protocol:uint8(_B5),
    {ok,
     {V1_birth,
      V1_constellation,
      V1_abo,
      V1_signature,
      V1_region,
      V1_sex}};
unpack(cli, 11833, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11834, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {V1_photo, _B2} = protocol:byte(_B1),
    {ok, {V1_id, V1_photo}};
unpack(cli, 11834, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11835, _B0) ->
    {V1_privacy, _B1} = protocol:uint8(_B0),
    {ok, {V1_privacy}};
unpack(cli, 11835, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11836, _B0) ->
    {V1_role_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_role_id, V1_platform, V1_zone_id}};
unpack(cli, 11836, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_item_base_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_result, V1_msg, V1_item_base_id}};
unpack(srv, 11837, _B0) ->
    {V1_num, _B1} = protocol:uint8(_B0),
    {ok, {V1_num}};
unpack(cli, 11837, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11838, _B0) -> {ok, {}};
unpack(cli, 11838, _B0) ->
    {V1_list, _B12} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_id, _B2} =
                                                 protocol:uint32(_B1),
                                             {V2_platform, _B3} =
                                                 protocol:string(_B2),
                                             {V2_zone_id, _B4} =
                                                 protocol:uint16(_B3),
                                             {V2_name, _B5} =
                                                 protocol:string(_B4),
                                             {V2_sex, _B6} =
                                                 protocol:uint8(_B5),
                                             {V2_classes, _B7} =
                                                 protocol:uint8(_B6),
                                             {V2_photo, _B8} =
                                                 protocol:uint8(_B7),
                                             {V2_liked, _B9} =
                                                 protocol:uint32(_B8),
                                             {V2_prize_num, _B10} =
                                                 protocol:uint32(_B9),
                                             {{V2_id,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_name,
                                               V2_sex,
                                               V2_classes,
                                               V2_photo,
                                               V2_liked,
                                               V2_prize_num},
                                              _B10}
                                     end),
    {ok, {V1_list}};
unpack(srv, 11839, _B0) -> {ok, {}};
unpack(cli, 11839, _B0) ->
    {V1_list, _B12} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_id, _B2} =
                                                 protocol:uint32(_B1),
                                             {V2_platform, _B3} =
                                                 protocol:string(_B2),
                                             {V2_zone_id, _B4} =
                                                 protocol:uint16(_B3),
                                             {V2_name, _B5} =
                                                 protocol:string(_B4),
                                             {V2_sex, _B6} =
                                                 protocol:uint8(_B5),
                                             {V2_classes, _B7} =
                                                 protocol:uint8(_B6),
                                             {V2_photo, _B8} =
                                                 protocol:uint8(_B7),
                                             {V2_liked, _B9} =
                                                 protocol:uint32(_B8),
                                             {V2_prize_num, _B10} =
                                                 protocol:uint32(_B9),
                                             {{V2_id,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_name,
                                               V2_sex,
                                               V2_classes,
                                               V2_photo,
                                               V2_liked,
                                               V2_prize_num},
                                              _B10}
                                     end),
    {ok, {V1_list}};
unpack(srv, 11840, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 11840, _B0) ->
    {V1_list, _B12} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_id, _B2} =
                                                 protocol:uint32(_B1),
                                             {V2_platform, _B3} =
                                                 protocol:string(_B2),
                                             {V2_zone_id, _B4} =
                                                 protocol:uint16(_B3),
                                             {V2_name, _B5} =
                                                 protocol:string(_B4),
                                             {V2_sex, _B6} =
                                                 protocol:uint8(_B5),
                                             {V2_classes, _B7} =
                                                 protocol:uint8(_B6),
                                             {V2_lev, _B8} =
                                                 protocol:uint8(_B7),
                                             {V2_got_prize, _B9} =
                                                 protocol:uint8(_B8),
                                             {V2_time, _B10} =
                                                 protocol:uint32(_B9),
                                             {{V2_id,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_name,
                                               V2_sex,
                                               V2_classes,
                                               V2_lev,
                                               V2_got_prize,
                                               V2_time},
                                              _B10}
                                     end),
    {ok, {V1_list}};
unpack(srv, 11841, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_list, _B8} = protocol:array(_B3,
                                    fun (_B4) ->
                                            {V2_id, _B5} = protocol:uint32(_B4),
                                            {V2_num, _B6} =
                                                protocol:uint32(_B5),
                                            {{V2_id, V2_num}, _B6}
                                    end),
    {ok, {V1_id, V1_platform, V1_zone_id, V1_list}};
unpack(cli, 11841, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11842, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_list, _B8} = protocol:array(_B3,
                                    fun (_B4) ->
                                            {V2_base_id, _B5} =
                                                protocol:uint32(_B4),
                                            {V2_num, _B6} =
                                                protocol:uint32(_B5),
                                            {{V2_base_id, V2_num}, _B6}
                                    end),
    {V1_msg, _B9} = protocol:string(_B8),
    {ok, {V1_id, V1_platform, V1_zone_id, V1_list, V1_msg}};
unpack(cli, 11842, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11843, _B0) -> {ok, {}};
unpack(cli, 11843, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_base_id, _B5} = protocol:uint32(_B4),
    {V1_msg, _B6} = protocol:string(_B5),
    {ok,
     {V1_id,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_base_id,
      V1_msg}};
unpack(srv, 11844, _B0) -> {ok, {}};
unpack(cli, 11844, _B0) ->
    {V1_list, _B8} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_id, _B2} = protocol:uint32(_B1),
                                            {V2_platform, _B3} =
                                                protocol:string(_B2),
                                            {V2_zone_id, _B4} =
                                                protocol:uint16(_B3),
                                            {V2_num, _B5} =
                                                protocol:uint32(_B4),
                                            {V2_time, _B6} =
                                                protocol:uint32(_B5),
                                            {{V2_id,
                                              V2_platform,
                                              V2_zone_id,
                                              V2_num,
                                              V2_time},
                                             _B6}
                                    end),
    {ok, {V1_list}};
unpack(srv, 11845, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 11845, _B0) ->
    {V1_photo, _B8} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_id, _B2} = protocol:uint8(_B1),
                                             {V2_photo_bin, _B3} =
                                                 protocol:byte(_B2),
                                             {V2_auditing, _B4} =
                                                 protocol:uint8(_B3),
                                             {V2_default, _B5} =
                                                 protocol:uint8(_B4),
                                             {V2_uploaded, _B6} =
                                                 protocol:uint32(_B5),
                                             {{V2_id,
                                               V2_photo_bin,
                                               V2_auditing,
                                               V2_default,
                                               V2_uploaded},
                                              _B6}
                                     end),
    {ok, {V1_photo}};
unpack(srv, 11846, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {ok, {V1_id}};
unpack(cli, 11846, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11847, _B0) -> {ok, {}};
unpack(cli, 11847, _B0) ->
    {V1_rewarded, _B5} = protocol:array(_B0,
                                        fun (_B1) ->
                                                {V2_id, _B2} =
                                                    protocol:uint32(_B1),
                                                {V2_time, _B3} =
                                                    protocol:uint32(_B2),
                                                {{V2_id, V2_time}, _B3}
                                        end),
    {ok, {V1_rewarded}};
unpack(srv, 11848, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 11848, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11849, _B0) ->
    {V1_content, _B1} = protocol:string(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_role_id, _B3} = protocol:uint32(_B2),
    {V1_platform, _B4} = protocol:string(_B3),
    {V1_zone_id, _B5} = protocol:uint16(_B4),
    {ok,
     {V1_content,
      V1_id,
      V1_role_id,
      V1_platform,
      V1_zone_id}};
unpack(cli, 11849, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11850, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0),
    {ok, {V1_id}};
unpack(cli, 11850, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11851, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0),
    {ok, {V1_id}};
unpack(cli, 11851, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11852, _B0) ->
    {V1_badges, _B4} = protocol:array(_B0,
                                      fun (_B1) ->
                                              {V2_badge_id, _B2} =
                                                  protocol:uint16(_B1),
                                              {{V2_badge_id}, _B2}
                                      end),
    {ok, {V1_badges}};
unpack(cli, 11852, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11853, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 11853, _B0) ->
    {V1_photo, _B5} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_id, _B2} = protocol:uint8(_B1),
                                             {V2_photo_bin, _B3} =
                                                 protocol:byte(_B2),
                                             {{V2_id, V2_photo_bin}, _B3}
                                     end),
    {ok, {V1_photo}};
unpack(srv, 11854, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {ok, {V1_id}};
unpack(cli, 11854, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11855, _B0) -> {ok, {}};
unpack(cli, 11855, _B0) ->
    {V1_friend_role, _B18} = protocol:array(_B0,
                                            fun (_B1) ->
                                                    {V2_id, _B2} =
                                                        protocol:uint32(_B1),
                                                    {V2_platform, _B3} =
                                                        protocol:string(_B2),
                                                    {V2_zone_id, _B4} =
                                                        protocol:uint16(_B3),
                                                    {V2_name, _B5} =
                                                        protocol:string(_B4),
                                                    {V2_online, _B6} =
                                                        protocol:uint8(_B5),
                                                    {V2_lev, _B7} =
                                                        protocol:uint8(_B6),
                                                    {V2_guild, _B8} =
                                                        protocol:string(_B7),
                                                    {V2_looks, _B15} =
                                                        protocol:array(_B8,
                                                                       fun
                                                                           (_B9) ->
                                                                               {V3_looks_type,
                                                                                _B10} =
                                                                                   protocol:uint32(_B9),
                                                                               {V3_looks_mode,
                                                                                _B11} =
                                                                                   protocol:uint32(_B10),
                                                                               {V3_looks_val,
                                                                                _B12} =
                                                                                   protocol:uint32(_B11),
                                                                               {V3_looks_str,
                                                                                _B13} =
                                                                                   protocol:string(_B12),
                                                                               {{V3_looks_type,
                                                                                 V3_looks_mode,
                                                                                 V3_looks_val,
                                                                                 V3_looks_str},
                                                                                _B13}
                                                                       end),
                                                    {V2_offline_push, _B16} =
                                                        protocol:uint8(_B15),
                                                    {{V2_id,
                                                      V2_platform,
                                                      V2_zone_id,
                                                      V2_name,
                                                      V2_online,
                                                      V2_lev,
                                                      V2_guild,
                                                      V2_looks,
                                                      V2_offline_push},
                                                     _B16}
                                            end),
    {ok, {V1_friend_role}};
unpack(srv, 11856, _B0) ->
    {V1_page, _B1} = protocol:uint8(_B0),
    {ok, {V1_page}};
unpack(cli, 11856, _B0) ->
    {V1_page, _B1} = protocol:uint8(_B0),
    {V1_moments, _B44} = protocol:array(_B1,
                                        fun (_B2) ->
                                                {V2_m_id, _B3} =
                                                    protocol:uint32(_B2),
                                                {V2_m_platform, _B4} =
                                                    protocol:string(_B3),
                                                {V2_m_zone_id, _B5} =
                                                    protocol:uint16(_B4),
                                                {V2_type, _B6} =
                                                    protocol:uint8(_B5),
                                                {V2_role_id, _B7} =
                                                    protocol:uint32(_B6),
                                                {V2_platform, _B8} =
                                                    protocol:string(_B7),
                                                {V2_zone_id, _B9} =
                                                    protocol:uint16(_B8),
                                                {V2_name, _B10} =
                                                    protocol:string(_B9),
                                                {V2_content, _B11} =
                                                    protocol:string(_B10),
                                                {V2_sex, _B12} =
                                                    protocol:uint8(_B11),
                                                {V2_classes, _B13} =
                                                    protocol:uint8(_B12),
                                                {V2_ctime, _B14} =
                                                    protocol:uint32(_B13),
                                                {V2_likes, _B24} =
                                                    protocol:array(_B14,
                                                                   fun (_B15) ->
                                                                           {V3_liker_id,
                                                                            _B16} =
                                                                               protocol:uint32(_B15),
                                                                           {V3_liker_platform,
                                                                            _B17} =
                                                                               protocol:string(_B16),
                                                                           {V3_liker_zone_id,
                                                                            _B18} =
                                                                               protocol:uint16(_B17),
                                                                           {V3_name,
                                                                            _B19} =
                                                                               protocol:string(_B18),
                                                                           {V3_sex,
                                                                            _B20} =
                                                                               protocol:uint8(_B19),
                                                                           {V3_classes,
                                                                            _B21} =
                                                                               protocol:uint8(_B20),
                                                                           {V3_ctime,
                                                                            _B22} =
                                                                               protocol:uint32(_B21),
                                                                           {{V3_liker_id,
                                                                             V3_liker_platform,
                                                                             V3_liker_zone_id,
                                                                             V3_name,
                                                                             V3_sex,
                                                                             V3_classes,
                                                                             V3_ctime},
                                                                            _B22}
                                                                   end),
                                                {V2_friend_comment, _B36} =
                                                    protocol:array(_B24,
                                                                   fun (_B25) ->
                                                                           {V3_commentator_id,
                                                                            _B26} =
                                                                               protocol:uint32(_B25),
                                                                           {V3_commentator_platform,
                                                                            _B27} =
                                                                               protocol:string(_B26),
                                                                           {V3_commentator_zone_id,
                                                                            _B28} =
                                                                               protocol:uint16(_B27),
                                                                           {V3_id,
                                                                            _B29} =
                                                                               protocol:uint32(_B28),
                                                                           {V3_name,
                                                                            _B30} =
                                                                               protocol:string(_B29),
                                                                           {V3_sex,
                                                                            _B31} =
                                                                               protocol:uint8(_B30),
                                                                           {V3_classes,
                                                                            _B32} =
                                                                               protocol:uint8(_B31),
                                                                           {V3_ctime,
                                                                            _B33} =
                                                                               protocol:uint32(_B32),
                                                                           {V3_msg,
                                                                            _B34} =
                                                                               protocol:string(_B33),
                                                                           {{V3_commentator_id,
                                                                             V3_commentator_platform,
                                                                             V3_commentator_zone_id,
                                                                             V3_id,
                                                                             V3_name,
                                                                             V3_sex,
                                                                             V3_classes,
                                                                             V3_ctime,
                                                                             V3_msg},
                                                                            _B34}
                                                                   end),
                                                {V2_friend_moment_photo, _B42} =
                                                    protocol:array(_B36,
                                                                   fun (_B37) ->
                                                                           {V3_id,
                                                                            _B38} =
                                                                               protocol:uint8(_B37),
                                                                           {V3_auditing,
                                                                            _B39} =
                                                                               protocol:uint8(_B38),
                                                                           {V3_uploaded,
                                                                            _B40} =
                                                                               protocol:uint32(_B39),
                                                                           {{V3_id,
                                                                             V3_auditing,
                                                                             V3_uploaded},
                                                                            _B40}
                                                                   end),
                                                {{V2_m_id,
                                                  V2_m_platform,
                                                  V2_m_zone_id,
                                                  V2_type,
                                                  V2_role_id,
                                                  V2_platform,
                                                  V2_zone_id,
                                                  V2_name,
                                                  V2_content,
                                                  V2_sex,
                                                  V2_classes,
                                                  V2_ctime,
                                                  V2_likes,
                                                  V2_friend_comment,
                                                  V2_friend_moment_photo},
                                                 _B42}
                                        end),
    {ok, {V1_page, V1_moments}};
unpack(srv, 11857, _B0) ->
    {V1_role_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_page, _B4} = protocol:uint8(_B3),
    {ok, {V1_role_id, V1_platform, V1_zone_id, V1_page}};
unpack(cli, 11857, _B0) ->
    {V1_circle_id, _B1} = protocol:uint32(_B0),
    {V1_circle_platform, _B2} = protocol:string(_B1),
    {V1_circle_zone_id, _B3} = protocol:uint16(_B2),
    {V1_page, _B4} = protocol:uint8(_B3),
    {V1_moments, _B47} = protocol:array(_B4,
                                        fun (_B5) ->
                                                {V2_m_id, _B6} =
                                                    protocol:uint32(_B5),
                                                {V2_m_platform, _B7} =
                                                    protocol:string(_B6),
                                                {V2_m_zone_id, _B8} =
                                                    protocol:uint16(_B7),
                                                {V2_type, _B9} =
                                                    protocol:uint8(_B8),
                                                {V2_role_id, _B10} =
                                                    protocol:uint32(_B9),
                                                {V2_platform, _B11} =
                                                    protocol:string(_B10),
                                                {V2_zone_id, _B12} =
                                                    protocol:uint16(_B11),
                                                {V2_name, _B13} =
                                                    protocol:string(_B12),
                                                {V2_content, _B14} =
                                                    protocol:string(_B13),
                                                {V2_sex, _B15} =
                                                    protocol:uint8(_B14),
                                                {V2_classes, _B16} =
                                                    protocol:uint8(_B15),
                                                {V2_ctime, _B17} =
                                                    protocol:uint32(_B16),
                                                {V2_likes, _B27} =
                                                    protocol:array(_B17,
                                                                   fun (_B18) ->
                                                                           {V3_liker_id,
                                                                            _B19} =
                                                                               protocol:uint32(_B18),
                                                                           {V3_liker_platform,
                                                                            _B20} =
                                                                               protocol:string(_B19),
                                                                           {V3_liker_zone_id,
                                                                            _B21} =
                                                                               protocol:uint16(_B20),
                                                                           {V3_name,
                                                                            _B22} =
                                                                               protocol:string(_B21),
                                                                           {V3_sex,
                                                                            _B23} =
                                                                               protocol:uint8(_B22),
                                                                           {V3_classes,
                                                                            _B24} =
                                                                               protocol:uint8(_B23),
                                                                           {V3_ctime,
                                                                            _B25} =
                                                                               protocol:uint32(_B24),
                                                                           {{V3_liker_id,
                                                                             V3_liker_platform,
                                                                             V3_liker_zone_id,
                                                                             V3_name,
                                                                             V3_sex,
                                                                             V3_classes,
                                                                             V3_ctime},
                                                                            _B25}
                                                                   end),
                                                {V2_friend_comment, _B39} =
                                                    protocol:array(_B27,
                                                                   fun (_B28) ->
                                                                           {V3_commentator_id,
                                                                            _B29} =
                                                                               protocol:uint32(_B28),
                                                                           {V3_commentator_platform,
                                                                            _B30} =
                                                                               protocol:string(_B29),
                                                                           {V3_commentator_zone_id,
                                                                            _B31} =
                                                                               protocol:uint16(_B30),
                                                                           {V3_id,
                                                                            _B32} =
                                                                               protocol:uint32(_B31),
                                                                           {V3_name,
                                                                            _B33} =
                                                                               protocol:string(_B32),
                                                                           {V3_sex,
                                                                            _B34} =
                                                                               protocol:uint8(_B33),
                                                                           {V3_classes,
                                                                            _B35} =
                                                                               protocol:uint8(_B34),
                                                                           {V3_ctime,
                                                                            _B36} =
                                                                               protocol:uint32(_B35),
                                                                           {V3_msg,
                                                                            _B37} =
                                                                               protocol:string(_B36),
                                                                           {{V3_commentator_id,
                                                                             V3_commentator_platform,
                                                                             V3_commentator_zone_id,
                                                                             V3_id,
                                                                             V3_name,
                                                                             V3_sex,
                                                                             V3_classes,
                                                                             V3_ctime,
                                                                             V3_msg},
                                                                            _B37}
                                                                   end),
                                                {V2_friend_moment_photo, _B45} =
                                                    protocol:array(_B39,
                                                                   fun (_B40) ->
                                                                           {V3_id,
                                                                            _B41} =
                                                                               protocol:uint8(_B40),
                                                                           {V3_auditing,
                                                                            _B42} =
                                                                               protocol:uint8(_B41),
                                                                           {V3_uploaded,
                                                                            _B43} =
                                                                               protocol:uint32(_B42),
                                                                           {{V3_id,
                                                                             V3_auditing,
                                                                             V3_uploaded},
                                                                            _B43}
                                                                   end),
                                                {{V2_m_id,
                                                  V2_m_platform,
                                                  V2_m_zone_id,
                                                  V2_type,
                                                  V2_role_id,
                                                  V2_platform,
                                                  V2_zone_id,
                                                  V2_name,
                                                  V2_content,
                                                  V2_sex,
                                                  V2_classes,
                                                  V2_ctime,
                                                  V2_likes,
                                                  V2_friend_comment,
                                                  V2_friend_moment_photo},
                                                 _B45}
                                        end),
    {ok,
     {V1_circle_id,
      V1_circle_platform,
      V1_circle_zone_id,
      V1_page,
      V1_moments}};
unpack(srv, 11858, _B0) ->
    {V1_content, _B1} = protocol:string(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {V1_photos, _B6} = protocol:array(_B2,
                                      fun (_B3) ->
                                              {V2_photo, _B4} =
                                                  protocol:byte(_B3),
                                              {{V2_photo}, _B4}
                                      end),
    {V1_thumbs, _B10} = protocol:array(_B6,
                                       fun (_B7) ->
                                               {V2_thumb, _B8} =
                                                   protocol:byte(_B7),
                                               {{V2_thumb}, _B8}
                                       end),
    {V1_mentions, _B16} = protocol:array(_B10,
                                         fun (_B11) ->
                                                 {V2_rid, _B12} =
                                                     protocol:uint32(_B11),
                                                 {V2_platform, _B13} =
                                                     protocol:string(_B12),
                                                 {V2_zone_id, _B14} =
                                                     protocol:uint16(_B13),
                                                 {{V2_rid,
                                                   V2_platform,
                                                   V2_zone_id},
                                                  _B14}
                                         end),
    {ok,
     {V1_content,
      V1_type,
      V1_photos,
      V1_thumbs,
      V1_mentions}};
unpack(cli, 11858, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11859, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 11859, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11860, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 11860, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11861, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 11861, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11862, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_content, _B4} = protocol:string(_B3),
    {V1_mentions, _B10} = protocol:array(_B4,
                                         fun (_B5) ->
                                                 {V2_rid, _B6} =
                                                     protocol:uint32(_B5),
                                                 {V2_platform, _B7} =
                                                     protocol:string(_B6),
                                                 {V2_zone_id, _B8} =
                                                     protocol:uint16(_B7),
                                                 {{V2_rid,
                                                   V2_platform,
                                                   V2_zone_id},
                                                  _B8}
                                         end),
    {ok,
     {V1_id,
      V1_platform,
      V1_zone_id,
      V1_content,
      V1_mentions}};
unpack(cli, 11862, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11863, _B0) ->
    {V1_moment_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_comment_id, _B4} = protocol:uint32(_B3),
    {ok,
     {V1_moment_id, V1_platform, V1_zone_id, V1_comment_id}};
unpack(cli, 11863, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11864, _B0) ->
    {V1_moment_id, _B1} = protocol:uint32(_B0),
    {V1_photo_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_moment_id, V1_photo_id}};
unpack(cli, 11864, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_moment_id, _B3} = protocol:uint32(_B2),
    {V1_photo_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_flag, V1_msg, V1_moment_id, V1_photo_id}};
unpack(srv, 11865, _B0) -> {ok, {}};
unpack(cli, 11865, _B0) ->
    {V1_up_type, _B1} = protocol:uint8(_B0),
    {V1_m_id, _B2} = protocol:uint32(_B1),
    {V1_m_platform, _B3} = protocol:string(_B2),
    {V1_m_zone_id, _B4} = protocol:uint16(_B3),
    {V1_type, _B5} = protocol:uint8(_B4),
    {V1_role_id, _B6} = protocol:uint32(_B5),
    {V1_platform, _B7} = protocol:string(_B6),
    {V1_zone_id, _B8} = protocol:uint16(_B7),
    {V1_name, _B9} = protocol:string(_B8),
    {V1_content, _B10} = protocol:string(_B9),
    {V1_sex, _B11} = protocol:uint8(_B10),
    {V1_classes, _B12} = protocol:uint8(_B11),
    {V1_ctime, _B13} = protocol:uint32(_B12),
    {V1_likes, _B23} = protocol:array(_B13,
                                      fun (_B14) ->
                                              {V2_liker_id, _B15} =
                                                  protocol:uint32(_B14),
                                              {V2_liker_platform, _B16} =
                                                  protocol:string(_B15),
                                              {V2_liker_zone_id, _B17} =
                                                  protocol:uint16(_B16),
                                              {V2_name, _B18} =
                                                  protocol:string(_B17),
                                              {V2_sex, _B19} =
                                                  protocol:uint8(_B18),
                                              {V2_classes, _B20} =
                                                  protocol:uint8(_B19),
                                              {V2_ctime, _B21} =
                                                  protocol:uint32(_B20),
                                              {{V2_liker_id,
                                                V2_liker_platform,
                                                V2_liker_zone_id,
                                                V2_name,
                                                V2_sex,
                                                V2_classes,
                                                V2_ctime},
                                               _B21}
                                      end),
    {V1_friend_moment_photo, _B29} = protocol:array(_B23,
                                                    fun (_B24) ->
                                                            {V2_id, _B25} =
                                                                protocol:uint8(_B24),
                                                            {V2_auditing,
                                                             _B26} =
                                                                protocol:uint8(_B25),
                                                            {V2_uploaded,
                                                             _B27} =
                                                                protocol:uint32(_B26),
                                                            {{V2_id,
                                                              V2_auditing,
                                                              V2_uploaded},
                                                             _B27}
                                                    end),
    {ok,
     {V1_up_type,
      V1_m_id,
      V1_m_platform,
      V1_m_zone_id,
      V1_type,
      V1_role_id,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_content,
      V1_sex,
      V1_classes,
      V1_ctime,
      V1_likes,
      V1_friend_moment_photo}};
unpack(srv, 11866, _B0) -> {ok, {}};
unpack(cli, 11866, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_m_id, _B3} = protocol:uint32(_B2),
    {V1_m_platform, _B4} = protocol:string(_B3),
    {V1_m_zone_id, _B5} = protocol:uint16(_B4),
    {V1_role_id, _B6} = protocol:uint32(_B5),
    {V1_platform, _B7} = protocol:string(_B6),
    {V1_zone_id, _B8} = protocol:uint16(_B7),
    {V1_name, _B9} = protocol:string(_B8),
    {V1_msg, _B10} = protocol:string(_B9),
    {V1_sex, _B11} = protocol:uint8(_B10),
    {V1_classes, _B12} = protocol:uint8(_B11),
    {V1_ctime, _B13} = protocol:uint32(_B12),
    {ok,
     {V1_type,
      V1_id,
      V1_m_id,
      V1_m_platform,
      V1_m_zone_id,
      V1_role_id,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_msg,
      V1_sex,
      V1_classes,
      V1_ctime}};
unpack(srv, 11867, _B0) -> {ok, {}};
unpack(cli, 11867, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_m_id, _B2} = protocol:uint32(_B1),
    {V1_m_platform, _B3} = protocol:string(_B2),
    {V1_m_zone_id, _B4} = protocol:uint16(_B3),
    {V1_role_id, _B5} = protocol:uint32(_B4),
    {V1_platform, _B6} = protocol:string(_B5),
    {V1_zone_id, _B7} = protocol:uint16(_B6),
    {V1_name, _B8} = protocol:string(_B7),
    {V1_sex, _B9} = protocol:uint8(_B8),
    {V1_classes, _B10} = protocol:uint8(_B9),
    {V1_ctime, _B11} = protocol:uint32(_B10),
    {ok,
     {V1_type,
      V1_m_id,
      V1_m_platform,
      V1_m_zone_id,
      V1_role_id,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_sex,
      V1_classes,
      V1_ctime}};
unpack(srv, 11868, _B0) ->
    {V1_moment_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_photo_id, _B4} = protocol:uint8(_B3),
    {ok,
     {V1_moment_id, V1_platform, V1_zone_id, V1_photo_id}};
unpack(cli, 11868, _B0) ->
    {V1_photo, _B10} = protocol:array(_B0,
                                      fun (_B1) ->
                                              {V2_id, _B2} =
                                                  protocol:uint8(_B1),
                                              {V2_m_id, _B3} =
                                                  protocol:uint32(_B2),
                                              {V2_m_platform, _B4} =
                                                  protocol:string(_B3),
                                              {V2_m_zone_id, _B5} =
                                                  protocol:uint16(_B4),
                                              {V2_photo_bin, _B6} =
                                                  protocol:byte(_B5),
                                              {V2_auditing, _B7} =
                                                  protocol:uint8(_B6),
                                              {V2_uploaded, _B8} =
                                                  protocol:uint32(_B7),
                                              {{V2_id,
                                                V2_m_id,
                                                V2_m_platform,
                                                V2_m_zone_id,
                                                V2_photo_bin,
                                                V2_auditing,
                                                V2_uploaded},
                                               _B8}
                                      end),
    {ok, {V1_photo}};
unpack(srv, 11869, _B0) ->
    {V1_moment_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_type, _B4} = protocol:uint8(_B3),
    {V1_spec_id, _B5} = protocol:uint32(_B4),
    {ok,
     {V1_moment_id,
      V1_platform,
      V1_zone_id,
      V1_type,
      V1_spec_id}};
unpack(cli, 11869, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11870, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 11870, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11871, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 11871, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11872, _B0) ->
    {V1_moment_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_photo_id, _B4} = protocol:uint8(_B3),
    {ok,
     {V1_moment_id, V1_platform, V1_zone_id, V1_photo_id}};
unpack(cli, 11872, _B0) ->
    {V1_thumb, _B10} = protocol:array(_B0,
                                      fun (_B1) ->
                                              {V2_id, _B2} =
                                                  protocol:uint8(_B1),
                                              {V2_m_id, _B3} =
                                                  protocol:uint32(_B2),
                                              {V2_m_platform, _B4} =
                                                  protocol:string(_B3),
                                              {V2_m_zone_id, _B5} =
                                                  protocol:uint16(_B4),
                                              {V2_thumb_bin, _B6} =
                                                  protocol:byte(_B5),
                                              {V2_auditing, _B7} =
                                                  protocol:uint8(_B6),
                                              {V2_uploaded, _B8} =
                                                  protocol:uint32(_B7),
                                              {{V2_id,
                                                V2_m_id,
                                                V2_m_platform,
                                                V2_m_zone_id,
                                                V2_thumb_bin,
                                                V2_auditing,
                                                V2_uploaded},
                                               _B8}
                                      end),
    {ok, {V1_thumb}};
unpack(srv, 11873, _B0) ->
    {V1_page, _B1} = protocol:uint8(_B0),
    {ok, {V1_page}};
unpack(cli, 11873, _B0) ->
    {V1_page, _B1} = protocol:uint8(_B0),
    {V1_moments, _B44} = protocol:array(_B1,
                                        fun (_B2) ->
                                                {V2_m_id, _B3} =
                                                    protocol:uint32(_B2),
                                                {V2_m_platform, _B4} =
                                                    protocol:string(_B3),
                                                {V2_m_zone_id, _B5} =
                                                    protocol:uint16(_B4),
                                                {V2_type, _B6} =
                                                    protocol:uint8(_B5),
                                                {V2_role_id, _B7} =
                                                    protocol:uint32(_B6),
                                                {V2_platform, _B8} =
                                                    protocol:string(_B7),
                                                {V2_zone_id, _B9} =
                                                    protocol:uint16(_B8),
                                                {V2_name, _B10} =
                                                    protocol:string(_B9),
                                                {V2_content, _B11} =
                                                    protocol:string(_B10),
                                                {V2_sex, _B12} =
                                                    protocol:uint8(_B11),
                                                {V2_classes, _B13} =
                                                    protocol:uint8(_B12),
                                                {V2_ctime, _B14} =
                                                    protocol:uint32(_B13),
                                                {V2_likes, _B24} =
                                                    protocol:array(_B14,
                                                                   fun (_B15) ->
                                                                           {V3_liker_id,
                                                                            _B16} =
                                                                               protocol:uint32(_B15),
                                                                           {V3_liker_platform,
                                                                            _B17} =
                                                                               protocol:string(_B16),
                                                                           {V3_liker_zone_id,
                                                                            _B18} =
                                                                               protocol:uint16(_B17),
                                                                           {V3_name,
                                                                            _B19} =
                                                                               protocol:string(_B18),
                                                                           {V3_sex,
                                                                            _B20} =
                                                                               protocol:uint8(_B19),
                                                                           {V3_classes,
                                                                            _B21} =
                                                                               protocol:uint8(_B20),
                                                                           {V3_ctime,
                                                                            _B22} =
                                                                               protocol:uint32(_B21),
                                                                           {{V3_liker_id,
                                                                             V3_liker_platform,
                                                                             V3_liker_zone_id,
                                                                             V3_name,
                                                                             V3_sex,
                                                                             V3_classes,
                                                                             V3_ctime},
                                                                            _B22}
                                                                   end),
                                                {V2_friend_comment, _B36} =
                                                    protocol:array(_B24,
                                                                   fun (_B25) ->
                                                                           {V3_commentator_id,
                                                                            _B26} =
                                                                               protocol:uint32(_B25),
                                                                           {V3_commentator_platform,
                                                                            _B27} =
                                                                               protocol:string(_B26),
                                                                           {V3_commentator_zone_id,
                                                                            _B28} =
                                                                               protocol:uint16(_B27),
                                                                           {V3_id,
                                                                            _B29} =
                                                                               protocol:uint32(_B28),
                                                                           {V3_name,
                                                                            _B30} =
                                                                               protocol:string(_B29),
                                                                           {V3_sex,
                                                                            _B31} =
                                                                               protocol:uint8(_B30),
                                                                           {V3_classes,
                                                                            _B32} =
                                                                               protocol:uint8(_B31),
                                                                           {V3_ctime,
                                                                            _B33} =
                                                                               protocol:uint32(_B32),
                                                                           {V3_msg,
                                                                            _B34} =
                                                                               protocol:string(_B33),
                                                                           {{V3_commentator_id,
                                                                             V3_commentator_platform,
                                                                             V3_commentator_zone_id,
                                                                             V3_id,
                                                                             V3_name,
                                                                             V3_sex,
                                                                             V3_classes,
                                                                             V3_ctime,
                                                                             V3_msg},
                                                                            _B34}
                                                                   end),
                                                {V2_friend_moment_photo, _B42} =
                                                    protocol:array(_B36,
                                                                   fun (_B37) ->
                                                                           {V3_id,
                                                                            _B38} =
                                                                               protocol:uint8(_B37),
                                                                           {V3_auditing,
                                                                            _B39} =
                                                                               protocol:uint8(_B38),
                                                                           {V3_uploaded,
                                                                            _B40} =
                                                                               protocol:uint32(_B39),
                                                                           {{V3_id,
                                                                             V3_auditing,
                                                                             V3_uploaded},
                                                                            _B40}
                                                                   end),
                                                {{V2_m_id,
                                                  V2_m_platform,
                                                  V2_m_zone_id,
                                                  V2_type,
                                                  V2_role_id,
                                                  V2_platform,
                                                  V2_zone_id,
                                                  V2_name,
                                                  V2_content,
                                                  V2_sex,
                                                  V2_classes,
                                                  V2_ctime,
                                                  V2_likes,
                                                  V2_friend_comment,
                                                  V2_friend_moment_photo},
                                                 _B42}
                                        end),
    {ok, {V1_page, V1_moments}};
unpack(srv, 11874, _B0) ->
    {V1_region, _B1} = protocol:string(_B0),
    {V1_city, _B2} = protocol:string(_B1),
    {V1_is_shared_region, _B3} = protocol:uint8(_B2),
    {ok, {V1_region, V1_city, V1_is_shared_region}};
unpack(cli, 11874, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11875, _B0) ->
    {V1_page, _B1} = protocol:uint8(_B0),
    {ok, {V1_page}};
unpack(cli, 11875, _B0) ->
    {V1_page, _B1} = protocol:uint8(_B0),
    {V1_moments, _B44} = protocol:array(_B1,
                                        fun (_B2) ->
                                                {V2_m_id, _B3} =
                                                    protocol:uint32(_B2),
                                                {V2_m_platform, _B4} =
                                                    protocol:string(_B3),
                                                {V2_m_zone_id, _B5} =
                                                    protocol:uint16(_B4),
                                                {V2_type, _B6} =
                                                    protocol:uint8(_B5),
                                                {V2_role_id, _B7} =
                                                    protocol:uint32(_B6),
                                                {V2_platform, _B8} =
                                                    protocol:string(_B7),
                                                {V2_zone_id, _B9} =
                                                    protocol:uint16(_B8),
                                                {V2_name, _B10} =
                                                    protocol:string(_B9),
                                                {V2_content, _B11} =
                                                    protocol:string(_B10),
                                                {V2_sex, _B12} =
                                                    protocol:uint8(_B11),
                                                {V2_classes, _B13} =
                                                    protocol:uint8(_B12),
                                                {V2_ctime, _B14} =
                                                    protocol:uint32(_B13),
                                                {V2_likes, _B24} =
                                                    protocol:array(_B14,
                                                                   fun (_B15) ->
                                                                           {V3_liker_id,
                                                                            _B16} =
                                                                               protocol:uint32(_B15),
                                                                           {V3_liker_platform,
                                                                            _B17} =
                                                                               protocol:string(_B16),
                                                                           {V3_liker_zone_id,
                                                                            _B18} =
                                                                               protocol:uint16(_B17),
                                                                           {V3_name,
                                                                            _B19} =
                                                                               protocol:string(_B18),
                                                                           {V3_sex,
                                                                            _B20} =
                                                                               protocol:uint8(_B19),
                                                                           {V3_classes,
                                                                            _B21} =
                                                                               protocol:uint8(_B20),
                                                                           {V3_ctime,
                                                                            _B22} =
                                                                               protocol:uint32(_B21),
                                                                           {{V3_liker_id,
                                                                             V3_liker_platform,
                                                                             V3_liker_zone_id,
                                                                             V3_name,
                                                                             V3_sex,
                                                                             V3_classes,
                                                                             V3_ctime},
                                                                            _B22}
                                                                   end),
                                                {V2_friend_comment, _B36} =
                                                    protocol:array(_B24,
                                                                   fun (_B25) ->
                                                                           {V3_commentator_id,
                                                                            _B26} =
                                                                               protocol:uint32(_B25),
                                                                           {V3_commentator_platform,
                                                                            _B27} =
                                                                               protocol:string(_B26),
                                                                           {V3_commentator_zone_id,
                                                                            _B28} =
                                                                               protocol:uint16(_B27),
                                                                           {V3_id,
                                                                            _B29} =
                                                                               protocol:uint32(_B28),
                                                                           {V3_name,
                                                                            _B30} =
                                                                               protocol:string(_B29),
                                                                           {V3_sex,
                                                                            _B31} =
                                                                               protocol:uint8(_B30),
                                                                           {V3_classes,
                                                                            _B32} =
                                                                               protocol:uint8(_B31),
                                                                           {V3_ctime,
                                                                            _B33} =
                                                                               protocol:uint32(_B32),
                                                                           {V3_msg,
                                                                            _B34} =
                                                                               protocol:string(_B33),
                                                                           {{V3_commentator_id,
                                                                             V3_commentator_platform,
                                                                             V3_commentator_zone_id,
                                                                             V3_id,
                                                                             V3_name,
                                                                             V3_sex,
                                                                             V3_classes,
                                                                             V3_ctime,
                                                                             V3_msg},
                                                                            _B34}
                                                                   end),
                                                {V2_friend_moment_photo, _B42} =
                                                    protocol:array(_B36,
                                                                   fun (_B37) ->
                                                                           {V3_id,
                                                                            _B38} =
                                                                               protocol:uint8(_B37),
                                                                           {V3_auditing,
                                                                            _B39} =
                                                                               protocol:uint8(_B38),
                                                                           {V3_uploaded,
                                                                            _B40} =
                                                                               protocol:uint32(_B39),
                                                                           {{V3_id,
                                                                             V3_auditing,
                                                                             V3_uploaded},
                                                                            _B40}
                                                                   end),
                                                {{V2_m_id,
                                                  V2_m_platform,
                                                  V2_m_zone_id,
                                                  V2_type,
                                                  V2_role_id,
                                                  V2_platform,
                                                  V2_zone_id,
                                                  V2_name,
                                                  V2_content,
                                                  V2_sex,
                                                  V2_classes,
                                                  V2_ctime,
                                                  V2_likes,
                                                  V2_friend_comment,
                                                  V2_friend_moment_photo},
                                                 _B42}
                                        end),
    {ok, {V1_page, V1_moments}};
unpack(srv, 11876, _B0) -> {ok, {}};
unpack(cli, 11876, _B0) ->
    {V1_notifications_num, _B1} = protocol:uint8(_B0),
    {ok, {V1_notifications_num}};
unpack(srv, 11877, _B0) -> {ok, {}};
unpack(cli, 11877, _B0) ->
    {V1_unread_num, _B1} = protocol:uint8(_B0),
    {ok, {V1_unread_num}};
unpack(srv, 11878, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_pos, _B4} = protocol:uint8(_B3),
    {ok, {V1_rid, V1_platform, V1_zone_id, V1_pos}};
unpack(cli, 11878, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11879, _B0) -> {ok, {}};
unpack(cli, 11879, _B0) ->
    {V1_id, _B1} = protocol:string(_B0),
    {V1_lists, _B9} = protocol:array(_B1,
                                     fun (_B2) ->
                                             {V2_role_id, _B3} =
                                                 protocol:uint32(_B2),
                                             {V2_platform, _B4} =
                                                 protocol:string(_B3),
                                             {V2_zone_id, _B5} =
                                                 protocol:uint16(_B4),
                                             {V2_pos, _B6} =
                                                 protocol:uint8(_B5),
                                             {V2_login, _B7} =
                                                 protocol:uint8(_B6),
                                             {{V2_role_id,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_pos,
                                               V2_login},
                                              _B7}
                                     end),
    {V1_rewards, _B13} = protocol:array(_B9,
                                        fun (_B10) ->
                                                {V2_id, _B11} =
                                                    protocol:uint8(_B10),
                                                {{V2_id}, _B11}
                                        end),
    {V1_role_id, _B14} = protocol:uint32(_B13),
    {V1_platform, _B15} = protocol:string(_B14),
    {V1_zone_id, _B16} = protocol:uint16(_B15),
    {V1_role_name_bind, _B17} = protocol:string(_B16),
    {ok,
     {V1_id,
      V1_lists,
      V1_rewards,
      V1_role_id,
      V1_platform,
      V1_zone_id,
      V1_role_name_bind}};
unpack(srv, 11880, _B0) ->
    {V1_rid, _B1} = protocol:string(_B0),
    {ok, {V1_rid}};
unpack(cli, 11880, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11881, _B0) -> {ok, {}};
unpack(cli, 11881, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_bind, _B2} = protocol:uint8(_B1),
    {V1_time_return, _B3} = protocol:uint32(_B2),
    {V1_rewards, _B7} = protocol:array(_B3,
                                       fun (_B4) ->
                                               {V2_id, _B5} =
                                                   protocol:uint8(_B4),
                                               {{V2_id}, _B5}
                                       end),
    {V1_role_id, _B8} = protocol:uint32(_B7),
    {V1_platform, _B9} = protocol:string(_B8),
    {V1_zone_id, _B10} = protocol:uint16(_B9),
    {V1_role_name_recall, _B11} = protocol:string(_B10),
    {ok,
     {V1_status,
      V1_bind,
      V1_time_return,
      V1_rewards,
      V1_role_id,
      V1_platform,
      V1_zone_id,
      V1_role_name_recall}};
unpack(srv, 11882, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {ok, {V1_id}};
unpack(cli, 11882, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {V1_flag, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_id, V1_flag, V1_msg}};
unpack(srv, 11884, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {ok, {V1_id}};
unpack(cli, 11884, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {V1_flag, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_id, V1_flag, V1_msg}};
unpack(srv, 11885, _B0) ->
    {V1_role_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_role_id, V1_platform, V1_zone_id}};
unpack(cli, 11885, _B0) ->
    {V1_role_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_activite, _B4} = protocol:uint32(_B3),
    {V1_time_return, _B5} = protocol:uint32(_B4),
    {ok,
     {V1_role_id,
      V1_platform,
      V1_zone_id,
      V1_activite,
      V1_time_return}};
unpack(srv, 11886, _B0) -> {ok, {}};
unpack(cli, 11886, _B0) ->
    {V1_buffs, _B4} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_buff_id, _B2} =
                                                 protocol:uint16(_B1),
                                             {{V2_buff_id}, _B2}
                                     end),
    {ok, {V1_buffs}};
unpack(srv, 11887, _B0) -> {ok, {}};
unpack(cli, 11887, _B0) ->
    {V1_times, _B1} = protocol:uint16(_B0),
    {ok, {V1_times}};
unpack(srv, 11888, _B0) ->
    {V1_offline_push, _B1} = protocol:uint8(_B0),
    {ok, {V1_offline_push}};
unpack(cli, 11888, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11889, _B0) ->
    {V1_item_id, _B1} = protocol:int32(_B0),
    {ok, {V1_item_id}};
unpack(cli, 11889, _B0) ->
    {V1_item_id, _B1} = protocol:uint32(_B0),
    {V1_rid, _B2} = protocol:uint32(_B1),
    {V1_platform, _B3} = protocol:string(_B2),
    {V1_zone_id, _B4} = protocol:uint16(_B3),
    {V1_role_name, _B5} = protocol:string(_B4),
    {V1_times, _B6} = protocol:uint32(_B5),
    {ok,
     {V1_item_id,
      V1_rid,
      V1_platform,
      V1_zone_id,
      V1_role_name,
      V1_times}};
unpack(srv, 11890, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_id, V1_msg}};
unpack(cli, 11890, _B0) ->
    {V1_flag, _B1} = protocol:int8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11891, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 11891, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11892, _B0) ->
    {V1_honor_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_honor_id}};
unpack(cli, 11892, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11893, _B0) ->
    {V1_camp_id, _B1} = protocol:uint32(_B0),
    {V1_req_type, _B2} = protocol:uint8(_B1),
    {ok, {V1_camp_id, V1_req_type}};
unpack(cli, 11893, _B0) ->
    {V1_camp_id, _B1} = protocol:uint32(_B0),
    {V1_req_type, _B2} = protocol:uint8(_B1),
    {V1_moments, _B45} = protocol:array(_B2,
                                        fun (_B3) ->
                                                {V2_m_id, _B4} =
                                                    protocol:uint32(_B3),
                                                {V2_m_platform, _B5} =
                                                    protocol:string(_B4),
                                                {V2_m_zone_id, _B6} =
                                                    protocol:uint16(_B5),
                                                {V2_type, _B7} =
                                                    protocol:uint8(_B6),
                                                {V2_role_id, _B8} =
                                                    protocol:uint32(_B7),
                                                {V2_platform, _B9} =
                                                    protocol:string(_B8),
                                                {V2_zone_id, _B10} =
                                                    protocol:uint16(_B9),
                                                {V2_name, _B11} =
                                                    protocol:string(_B10),
                                                {V2_content, _B12} =
                                                    protocol:string(_B11),
                                                {V2_sex, _B13} =
                                                    protocol:uint8(_B12),
                                                {V2_classes, _B14} =
                                                    protocol:uint8(_B13),
                                                {V2_ctime, _B15} =
                                                    protocol:uint32(_B14),
                                                {V2_likes, _B25} =
                                                    protocol:array(_B15,
                                                                   fun (_B16) ->
                                                                           {V3_liker_id,
                                                                            _B17} =
                                                                               protocol:uint32(_B16),
                                                                           {V3_liker_platform,
                                                                            _B18} =
                                                                               protocol:string(_B17),
                                                                           {V3_liker_zone_id,
                                                                            _B19} =
                                                                               protocol:uint16(_B18),
                                                                           {V3_name,
                                                                            _B20} =
                                                                               protocol:string(_B19),
                                                                           {V3_sex,
                                                                            _B21} =
                                                                               protocol:uint8(_B20),
                                                                           {V3_classes,
                                                                            _B22} =
                                                                               protocol:uint8(_B21),
                                                                           {V3_ctime,
                                                                            _B23} =
                                                                               protocol:uint32(_B22),
                                                                           {{V3_liker_id,
                                                                             V3_liker_platform,
                                                                             V3_liker_zone_id,
                                                                             V3_name,
                                                                             V3_sex,
                                                                             V3_classes,
                                                                             V3_ctime},
                                                                            _B23}
                                                                   end),
                                                {V2_friend_comment, _B37} =
                                                    protocol:array(_B25,
                                                                   fun (_B26) ->
                                                                           {V3_commentator_id,
                                                                            _B27} =
                                                                               protocol:uint32(_B26),
                                                                           {V3_commentator_platform,
                                                                            _B28} =
                                                                               protocol:string(_B27),
                                                                           {V3_commentator_zone_id,
                                                                            _B29} =
                                                                               protocol:uint16(_B28),
                                                                           {V3_id,
                                                                            _B30} =
                                                                               protocol:uint32(_B29),
                                                                           {V3_name,
                                                                            _B31} =
                                                                               protocol:string(_B30),
                                                                           {V3_sex,
                                                                            _B32} =
                                                                               protocol:uint8(_B31),
                                                                           {V3_classes,
                                                                            _B33} =
                                                                               protocol:uint8(_B32),
                                                                           {V3_ctime,
                                                                            _B34} =
                                                                               protocol:uint32(_B33),
                                                                           {V3_msg,
                                                                            _B35} =
                                                                               protocol:string(_B34),
                                                                           {{V3_commentator_id,
                                                                             V3_commentator_platform,
                                                                             V3_commentator_zone_id,
                                                                             V3_id,
                                                                             V3_name,
                                                                             V3_sex,
                                                                             V3_classes,
                                                                             V3_ctime,
                                                                             V3_msg},
                                                                            _B35}
                                                                   end),
                                                {V2_friend_moment_photo, _B43} =
                                                    protocol:array(_B37,
                                                                   fun (_B38) ->
                                                                           {V3_id,
                                                                            _B39} =
                                                                               protocol:uint8(_B38),
                                                                           {V3_auditing,
                                                                            _B40} =
                                                                               protocol:uint8(_B39),
                                                                           {V3_uploaded,
                                                                            _B41} =
                                                                               protocol:uint32(_B40),
                                                                           {{V3_id,
                                                                             V3_auditing,
                                                                             V3_uploaded},
                                                                            _B41}
                                                                   end),
                                                {{V2_m_id,
                                                  V2_m_platform,
                                                  V2_m_zone_id,
                                                  V2_type,
                                                  V2_role_id,
                                                  V2_platform,
                                                  V2_zone_id,
                                                  V2_name,
                                                  V2_content,
                                                  V2_sex,
                                                  V2_classes,
                                                  V2_ctime,
                                                  V2_likes,
                                                  V2_friend_comment,
                                                  V2_friend_moment_photo},
                                                 _B43}
                                        end),
    {V1_lucky_list, _B51} = protocol:array(_B45,
                                           fun (_B46) ->
                                                   {V2_moment_id, _B47} =
                                                       protocol:uint32(_B46),
                                                   {V2_platform, _B48} =
                                                       protocol:string(_B47),
                                                   {V2_zone_id, _B49} =
                                                       protocol:uint32(_B48),
                                                   {{V2_moment_id,
                                                     V2_platform,
                                                     V2_zone_id},
                                                    _B49}
                                           end),
    {ok,
     {V1_camp_id, V1_req_type, V1_moments, V1_lucky_list}};
unpack(srv, 11894, _B0) ->
    {V1_camp_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_camp_id}};
unpack(cli, 11894, _B0) ->
    {V1_contents, _B4} = protocol:array(_B0,
                                        fun (_B1) ->
                                                {V2_content, _B2} =
                                                    protocol:string(_B1),
                                                {{V2_content}, _B2}
                                        end),
    {ok, {V1_contents}};
unpack(srv, 11895, _B0) -> {ok, {}};
unpack(cli, 11895, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11896, _B0) -> {ok, {}};
unpack(cli, 11896, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(srv, 11897, _B0) -> {ok, {}};
unpack(cli, 11897, _B0) ->
    {V1_camp_wish, _B47} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_camp_id, _B2} =
                                                      protocol:uint32(_B1),
                                                  {V2_moments, _B45} =
                                                      protocol:array(_B2,
                                                                     fun
                                                                         (_B3) ->
                                                                             {V3_m_id,
                                                                              _B4} =
                                                                                 protocol:uint32(_B3),
                                                                             {V3_m_platform,
                                                                              _B5} =
                                                                                 protocol:string(_B4),
                                                                             {V3_m_zone_id,
                                                                              _B6} =
                                                                                 protocol:uint16(_B5),
                                                                             {V3_type,
                                                                              _B7} =
                                                                                 protocol:uint8(_B6),
                                                                             {V3_role_id,
                                                                              _B8} =
                                                                                 protocol:uint32(_B7),
                                                                             {V3_platform,
                                                                              _B9} =
                                                                                 protocol:string(_B8),
                                                                             {V3_zone_id,
                                                                              _B10} =
                                                                                 protocol:uint16(_B9),
                                                                             {V3_name,
                                                                              _B11} =
                                                                                 protocol:string(_B10),
                                                                             {V3_content,
                                                                              _B12} =
                                                                                 protocol:string(_B11),
                                                                             {V3_sex,
                                                                              _B13} =
                                                                                 protocol:uint8(_B12),
                                                                             {V3_classes,
                                                                              _B14} =
                                                                                 protocol:uint8(_B13),
                                                                             {V3_ctime,
                                                                              _B15} =
                                                                                 protocol:uint32(_B14),
                                                                             {V3_likes,
                                                                              _B25} =
                                                                                 protocol:array(_B15,
                                                                                                fun
                                                                                                    (_B16) ->
                                                                                                        {V4_liker_id,
                                                                                                         _B17} =
                                                                                                            protocol:uint32(_B16),
                                                                                                        {V4_liker_platform,
                                                                                                         _B18} =
                                                                                                            protocol:string(_B17),
                                                                                                        {V4_liker_zone_id,
                                                                                                         _B19} =
                                                                                                            protocol:uint16(_B18),
                                                                                                        {V4_name,
                                                                                                         _B20} =
                                                                                                            protocol:string(_B19),
                                                                                                        {V4_sex,
                                                                                                         _B21} =
                                                                                                            protocol:uint8(_B20),
                                                                                                        {V4_classes,
                                                                                                         _B22} =
                                                                                                            protocol:uint8(_B21),
                                                                                                        {V4_ctime,
                                                                                                         _B23} =
                                                                                                            protocol:uint32(_B22),
                                                                                                        {{V4_liker_id,
                                                                                                          V4_liker_platform,
                                                                                                          V4_liker_zone_id,
                                                                                                          V4_name,
                                                                                                          V4_sex,
                                                                                                          V4_classes,
                                                                                                          V4_ctime},
                                                                                                         _B23}
                                                                                                end),
                                                                             {V3_friend_comment,
                                                                              _B37} =
                                                                                 protocol:array(_B25,
                                                                                                fun
                                                                                                    (_B26) ->
                                                                                                        {V4_commentator_id,
                                                                                                         _B27} =
                                                                                                            protocol:uint32(_B26),
                                                                                                        {V4_commentator_platform,
                                                                                                         _B28} =
                                                                                                            protocol:string(_B27),
                                                                                                        {V4_commentator_zone_id,
                                                                                                         _B29} =
                                                                                                            protocol:uint16(_B28),
                                                                                                        {V4_id,
                                                                                                         _B30} =
                                                                                                            protocol:uint32(_B29),
                                                                                                        {V4_name,
                                                                                                         _B31} =
                                                                                                            protocol:string(_B30),
                                                                                                        {V4_sex,
                                                                                                         _B32} =
                                                                                                            protocol:uint8(_B31),
                                                                                                        {V4_classes,
                                                                                                         _B33} =
                                                                                                            protocol:uint8(_B32),
                                                                                                        {V4_ctime,
                                                                                                         _B34} =
                                                                                                            protocol:uint32(_B33),
                                                                                                        {V4_msg,
                                                                                                         _B35} =
                                                                                                            protocol:string(_B34),
                                                                                                        {{V4_commentator_id,
                                                                                                          V4_commentator_platform,
                                                                                                          V4_commentator_zone_id,
                                                                                                          V4_id,
                                                                                                          V4_name,
                                                                                                          V4_sex,
                                                                                                          V4_classes,
                                                                                                          V4_ctime,
                                                                                                          V4_msg},
                                                                                                         _B35}
                                                                                                end),
                                                                             {V3_friend_moment_photo,
                                                                              _B43} =
                                                                                 protocol:array(_B37,
                                                                                                fun
                                                                                                    (_B38) ->
                                                                                                        {V4_id,
                                                                                                         _B39} =
                                                                                                            protocol:uint8(_B38),
                                                                                                        {V4_auditing,
                                                                                                         _B40} =
                                                                                                            protocol:uint8(_B39),
                                                                                                        {V4_uploaded,
                                                                                                         _B41} =
                                                                                                            protocol:uint32(_B40),
                                                                                                        {{V4_id,
                                                                                                          V4_auditing,
                                                                                                          V4_uploaded},
                                                                                                         _B41}
                                                                                                end),
                                                                             {{V3_m_id,
                                                                               V3_m_platform,
                                                                               V3_m_zone_id,
                                                                               V3_type,
                                                                               V3_role_id,
                                                                               V3_platform,
                                                                               V3_zone_id,
                                                                               V3_name,
                                                                               V3_content,
                                                                               V3_sex,
                                                                               V3_classes,
                                                                               V3_ctime,
                                                                               V3_likes,
                                                                               V3_friend_comment,
                                                                               V3_friend_moment_photo},
                                                                              _B43}
                                                                     end),
                                                  {{V2_camp_id, V2_moments},
                                                   _B45}
                                          end),
    {ok, {V1_camp_wish}};
unpack(srv, 11898, _B0) ->
    {V1_privacy_zone, _B1} = protocol:uint8(_B0),
    {ok, {V1_privacy_zone}};
unpack(cli, 11898, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11899, _B0) ->
    {V1_privacy_moments, _B1} = protocol:uint8(_B0),
    {ok, {V1_privacy_moments}};
unpack(cli, 11899, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

