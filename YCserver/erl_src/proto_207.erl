-file("src/proto/proto_207.erl", 1).

-module(proto_207).

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

-file("src/proto/proto_207.erl", 14).

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

-file("src/proto/proto_207.erl", 15).

-file("inc/provocation.hrl", 1).

-record(m_provocation,
        {ver = 3,
         room_id = 0,
         book_id = 0,
         identity = 0,
         triggers = [],
         map_id = 0,
         room_check = 1,
         book_check = 0,
         video_check = 0,
         invited_list = [],
         published_list = [],
         pick_batch_list = [],
         pick_box_num = 0,
         pick_packet_num = 0}).

-record(provocation_room,
        {ver = 1,
         id = 0,
         pid = undefined :: pid(),
         name = [],
         room_lev_min = 0,
         min_lev_break = 0,
         room_lev_max = 200,
         max_lev_break = 1,
         master_fc = 0,
         mode = 1,
         password = [],
         status = 0,
         master_id = {0, "", 0},
         master_lev = 0,
         master_break = 0,
         master_name = [],
         master_sex = 0,
         master_class = 0,
         master_head = 0,
         customer_id = {0, "", 0},
         master_team_pid = undefined :: pid(),
         customer_team_pid = undefined :: pid(),
         last_vedio_id = {0, "", 0},
         provocation_type = 0,
         target_rival = {0, "", 0},
         target_name = [],
         make_horn_role = {0, "", 0},
         horn_name = [],
         horn_start_time = 0}).

-record(provocation_team,
        {ver = 1,
         team_formation = 0,
         team_formation_lev = 0,
         order = [],
         guards = [],
         team_mate = []}).

-record(provocation_fight_team,
        {leader_id = {0, "", 0}, fighters = []}).

-record(provocation_profile,
        {ver = 2,
         id = {0, "", 0},
         pid = undefined :: pid(),
         name = "",
         classes = 0,
         lev = 0,
         sex = 0,
         break_times = 0,
         fc = 0,
         looks = [] :: list(),
         head = 0,
         formation_id = 1 :: non_neg_integer(),
         formation_lev = 1 :: non_neg_integer(),
         guards = [],
         join_time = 0}).

-record(provocation_book,
        {ver = 1,
         id = 0,
         name = [],
         book_lev_min = 0,
         min_lev_break = 0,
         book_lev_max = 200,
         max_lev_break = 0,
         master_fc = 0,
         mode = 1,
         master_id = {0, "", 0},
         master_lev = 0,
         master_name = [],
         master_sex = 0,
         master_class = 0,
         master_head = 0,
         master_break = 0,
         live_status = 1,
         time_stamp = 0,
         provocation_type = 0}).

-record(provocation_fighter,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         kill_num = 0,
         dead_num = 0,
         total_heal = 0,
         control_num = 0,
         total_hurt = 0 :: non_neg_integer(),
         total_dmg = 0 :: non_neg_integer(),
         mvp_score = 0 :: non_neg_integer()}).

-record(provocation_result,
        {id = {0, "", 0},
         ver = 1,
         is_win = 1,
         mates = [],
         rival = [],
         match_id = 0,
         record_pz = {"", 0} :: tuple(),
         time = 0}).

-record(provocation_result_role,
        {id = {0, "", 0},
         ver = 1,
         recent = [],
         last_recent = []}).

-record(provocation_slices,
        {key = {0, 0}, role_list = []}).

-record(provocation_publish,
        {help_id = 0,
         msg_id = 0,
         record_id = 0,
         channel = 0,
         map_id = 0}).

-record(provocation_box,
        {map_id = 0,
         type = 0,
         batch_id = 0,
         time_stamp = 0,
         boxlist = []}).

-file("src/proto/proto_207.erl", 16).

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

-file("src/proto/proto_207.erl", 17).

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

-file("src/proto/proto_207.erl", 18).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 20700, {V0_init_flag}) ->
    D_a_t_a = <<V0_init_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20700:16/little,
       D_a_t_a/binary>>};
pack(srv, 20700, {V0_provocation_room}) ->
    D_a_t_a = <<(length(V0_provocation_room)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_room_lev_min:8/little,
                                   V1_min_lev_break:8/little,
                                   V1_room_lev_max:8/little,
                                   V1_max_lev_break:8/little,
                                   V1_master_fc:32/little, V1_mode:8/little,
                                   (protocol:pack(string, V1_password))/binary,
                                   V1_status:8/little, V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little, V1_master_lev:8/little,
                                   (protocol:pack(string,
                                                  V1_master_name))/binary,
                                   V1_master_sex:8/little,
                                   V1_master_class:8/little,
                                   V1_master_head:32/little,
                                   V1_provocation_type:8/little>>
                                 || #provocation_room{id = V1_id,
                                                      name = V1_name,
                                                      room_lev_min =
                                                          V1_room_lev_min,
                                                      min_lev_break =
                                                          V1_min_lev_break,
                                                      room_lev_max =
                                                          V1_room_lev_max,
                                                      max_lev_break =
                                                          V1_max_lev_break,
                                                      master_fc = V1_master_fc,
                                                      mode = V1_mode,
                                                      password = V1_password,
                                                      status = V1_status,
                                                      master_id =
                                                          {V1_rid,
                                                           V1_platform,
                                                           V1_zone_id},
                                                      master_lev =
                                                          V1_master_lev,
                                                      master_name =
                                                          V1_master_name,
                                                      master_sex =
                                                          V1_master_sex,
                                                      master_class =
                                                          V1_master_class,
                                                      master_head =
                                                          V1_master_head,
                                                      provocation_type =
                                                          V1_provocation_type}
                                        <- V0_provocation_room]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20700:16/little,
       D_a_t_a/binary>>};
pack(cli, 20701, {}) ->
    {ok, <<2:32/little, 20701:16/little>>};
pack(srv, 20701, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20701:16/little,
       D_a_t_a/binary>>};
pack(cli, 20702, {}) ->
    {ok, <<2:32/little, 20702:16/little>>};
pack(srv, 20702, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20702:16/little,
       D_a_t_a/binary>>};
pack(cli, 20703,
     {V0_room_name,
      V0_room_mode,
      V0_room_lev_min,
      V0_min_lev_break,
      V0_room_lev_max,
      V0_max_lev_break,
      V0_room_password,
      V0_provocation_type}) ->
    D_a_t_a = <<(protocol:pack(string,
                               V0_room_name))/binary,
                V0_room_mode:8/little, V0_room_lev_min:8/little,
                V0_min_lev_break:8/little, V0_room_lev_max:8/little,
                V0_max_lev_break:8/little,
                (protocol:pack(string, V0_room_password))/binary,
                V0_provocation_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20703:16/little,
       D_a_t_a/binary>>};
pack(srv, 20703, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20703:16/little,
       D_a_t_a/binary>>};
pack(cli, 20704, {}) ->
    {ok, <<2:32/little, 20704:16/little>>};
pack(srv, 20704,
     {#provocation_room{id = V0_id, name = V0_name,
                        room_lev_min = V0_room_lev_min,
                        min_lev_break = V0_min_lev_break,
                        room_lev_max = V0_room_lev_max,
                        max_lev_break = V0_max_lev_break, mode = V0_mode,
                        password = V0_password, status = V0_status,
                        master_id = {V0_rid, V0_platform, V0_zone_id},
                        master_lev = V0_master_lev,
                        master_name = V0_master_name,
                        master_sex = V0_master_sex,
                        master_class = V0_master_class,
                        master_head = V0_master_head,
                        provocation_type = V0_provocation_type,
                        target_rival =
                            {V0_target_rid,
                             V0_target_platform,
                             V0_target_zone_id},
                        make_horn_role =
                            {V0_horn_rid, V0_horn_platform, V0_horn_zone_id}},
      V0_provocation_team}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_name))/binary,
                V0_room_lev_min:8/little, V0_min_lev_break:8/little,
                V0_room_lev_max:8/little, V0_max_lev_break:8/little,
                V0_mode:8/little,
                (protocol:pack(string, V0_password))/binary,
                V0_status:8/little, V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_master_lev:8/little,
                (protocol:pack(string, V0_master_name))/binary,
                V0_master_sex:8/little, V0_master_class:8/little,
                V0_master_head:32/little, V0_provocation_type:8/little,
                V0_target_rid:32/little,
                (protocol:pack(string, V0_target_platform))/binary,
                V0_target_zone_id:32/little, V0_horn_rid:32/little,
                (protocol:pack(string, V0_horn_platform))/binary,
                V0_horn_zone_id:32/little,
                (length(V0_provocation_team)):16/little,
                (list_to_binary([<<V1_team_formation:8/little,
                                   V1_team_formation_lev:8/little,
                                   (length(V1_order)):16/little,
                                   (list_to_binary([<<V2_rid:32/little,
                                                      (protocol:pack(string,
                                                                     V2_platform))/binary,
                                                      V2_zone_id:32/little>>
                                                    || {V2_rid,
                                                        V2_platform,
                                                        V2_zone_id}
                                                           <- V1_order]))/binary,
                                   (length(V1_guards)):16/little,
                                   (list_to_binary([<<V2_base_id:32/little,
                                                      V2_status:8/little,
                                                      V2_war_id:8/little,
                                                      V2_quality:8/little>>
                                                    || {V2_base_id,
                                                        V2_status,
                                                        V2_war_id,
                                                        V2_quality}
                                                           <- V1_guards]))/binary,
                                   (length(V1_team_mate)):16/little,
                                   (list_to_binary([<<V2_rid:32/little,
                                                      (protocol:pack(string,
                                                                     V2_platform))/binary,
                                                      V2_zone_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_name))/binary,
                                                      V2_sex:8/little,
                                                      V2_classes:8/little,
                                                      V2_lev:8/little,
                                                      V2_face_id:32/little,
                                                      V2_status:8/little,
                                                      (length(V2_looks)):16/little,
                                                      (list_to_binary([<<V3_looks_type:32/little,
                                                                         V3_looks_mode:32/little,
                                                                         V3_looks_val:32/little,
                                                                         (protocol:pack(string,
                                                                                        V3_looks_str))/binary>>
                                                                       || {V3_looks_type,
                                                                           V3_looks_mode,
                                                                           V3_looks_val,
                                                                           V3_looks_str}
                                                                              <- V2_looks]))/binary,
                                                      V2_join_type:8/little,
                                                      V2_join_sub_type:8/little,
                                                      V2_join_time:32/little,
                                                      V2_combat_num:32/little>>
                                                    || #team_mate{id =
                                                                      {V2_rid,
                                                                       V2_platform,
                                                                       V2_zone_id},
                                                                  name =
                                                                      V2_name,
                                                                  sex = V2_sex,
                                                                  classes =
                                                                      V2_classes,
                                                                  lev = V2_lev,
                                                                  face_id =
                                                                      V2_face_id,
                                                                  status =
                                                                      V2_status,
                                                                  looks =
                                                                      V2_looks,
                                                                  join_type =
                                                                      V2_join_type,
                                                                  join_sub_type
                                                                      =
                                                                      V2_join_sub_type,
                                                                  join_time =
                                                                      V2_join_time,
                                                                  combat_num =
                                                                      V2_combat_num}
                                                           <- V1_team_mate]))/binary>>
                                 || #provocation_team{team_formation =
                                                          V1_team_formation,
                                                      team_formation_lev =
                                                          V1_team_formation_lev,
                                                      order = V1_order,
                                                      guards = V1_guards,
                                                      team_mate = V1_team_mate}
                                        <- V0_provocation_team]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20704:16/little,
       D_a_t_a/binary>>};
pack(cli, 20705, {V0_room_id, V0_password}) ->
    D_a_t_a = <<V0_room_id:32/little,
                (protocol:pack(string, V0_password))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20705:16/little,
       D_a_t_a/binary>>};
pack(srv, 20705, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20705:16/little,
       D_a_t_a/binary>>};
pack(cli, 20706,
     {V0_room_id,
      V0_name,
      V0_mode,
      V0_room_lev_min,
      V0_min_lev_break,
      V0_room_lev_max,
      V0_max_lev_break,
      V0_password,
      V0_provocation_type}) ->
    D_a_t_a = <<V0_room_id:32/little,
                (protocol:pack(string, V0_name))/binary,
                V0_mode:8/little, V0_room_lev_min:8/little,
                V0_min_lev_break:8/little, V0_room_lev_max:8/little,
                V0_max_lev_break:8/little,
                (protocol:pack(string, V0_password))/binary,
                V0_provocation_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20706:16/little,
       D_a_t_a/binary>>};
pack(srv, 20706, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20706:16/little,
       D_a_t_a/binary>>};
pack(cli, 20707, {}) ->
    {ok, <<2:32/little, 20707:16/little>>};
pack(srv, 20707, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20707:16/little,
       D_a_t_a/binary>>};
pack(cli, 20708, {{V0_rid, V0_platform, V0_zone_id}}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20708:16/little,
       D_a_t_a/binary>>};
pack(srv, 20708, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20708:16/little,
       D_a_t_a/binary>>};
pack(cli, 20709, {V0_channel, V0_flag}) ->
    D_a_t_a = <<V0_channel:8/little, V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20709:16/little,
       D_a_t_a/binary>>};
pack(srv, 20709, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20709:16/little,
       D_a_t_a/binary>>};
pack(cli, 20710, {}) ->
    {ok, <<2:32/little, 20710:16/little>>};
pack(srv, 20710, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20710:16/little,
       D_a_t_a/binary>>};
pack(cli, 20711, {}) ->
    {ok, <<2:32/little, 20711:16/little>>};
pack(srv, 20711, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20711:16/little,
       D_a_t_a/binary>>};
pack(cli, 20712, {}) ->
    {ok, <<2:32/little, 20712:16/little>>};
pack(srv, 20712,
     {V0_room_check, V0_book_check, V0_video_check}) ->
    D_a_t_a = <<V0_room_check:8/little,
                V0_book_check:8/little, V0_video_check:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20712:16/little,
       D_a_t_a/binary>>};
pack(cli, 20713, {}) ->
    {ok, <<2:32/little, 20713:16/little>>};
pack(srv, 20713, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20713:16/little,
       D_a_t_a/binary>>};
pack(cli, 20714, {}) ->
    {ok, <<2:32/little, 20714:16/little>>};
pack(srv, 20714,
     {V0_result,
      V0_r_type,
      V0_r_id,
      V0_r_platform,
      V0_r_zone_id,
      V0_mates,
      V0_rival}) ->
    D_a_t_a = <<V0_result:8/little, V0_r_type:16/little,
                V0_r_id:32/little,
                (protocol:pack(string, V0_r_platform))/binary,
                V0_r_zone_id:16/little, (length(V0_mates)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:8/little, V1_total_hurt:32/little,
                                   V1_total_dmg:32/little,
                                   V1_total_heal:32/little,
                                   V1_kill_num:16/little, V1_dead_num:16/little,
                                   V1_control_num:16/little,
                                   V1_mvp_score:16/little>>
                                 || #provocation_fighter{id =
                                                             {V1_rid,
                                                              V1_platform,
                                                              V1_zone_id},
                                                         name = V1_name,
                                                         sex = V1_sex,
                                                         classes = V1_classes,
                                                         lev = V1_lev,
                                                         total_hurt =
                                                             V1_total_hurt,
                                                         total_dmg =
                                                             V1_total_dmg,
                                                         total_heal =
                                                             V1_total_heal,
                                                         kill_num = V1_kill_num,
                                                         dead_num = V1_dead_num,
                                                         control_num =
                                                             V1_control_num,
                                                         mvp_score =
                                                             V1_mvp_score}
                                        <- V0_mates]))/binary,
                (length(V0_rival)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:8/little, V1_total_hurt:32/little,
                                   V1_total_dmg:32/little,
                                   V1_total_heal:32/little,
                                   V1_kill_num:16/little, V1_dead_num:16/little,
                                   V1_control_num:16/little,
                                   V1_mvp_score:16/little>>
                                 || #provocation_fighter{id =
                                                             {V1_rid,
                                                              V1_platform,
                                                              V1_zone_id},
                                                         name = V1_name,
                                                         sex = V1_sex,
                                                         classes = V1_classes,
                                                         lev = V1_lev,
                                                         total_hurt =
                                                             V1_total_hurt,
                                                         total_dmg =
                                                             V1_total_dmg,
                                                         total_heal =
                                                             V1_total_heal,
                                                         kill_num = V1_kill_num,
                                                         dead_num = V1_dead_num,
                                                         control_num =
                                                             V1_control_num,
                                                         mvp_score =
                                                             V1_mvp_score}
                                        <- V0_rival]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20714:16/little,
       D_a_t_a/binary>>};
pack(cli, 20715, {}) ->
    {ok, <<2:32/little, 20715:16/little>>};
pack(srv, 20715, {V0_last_recent}) ->
    D_a_t_a = <<(length(V0_last_recent)):16/little,
                (list_to_binary([<<V1_time:32/little,
                                   (protocol:pack(string, V1_atk_name))/binary,
                                   (protocol:pack(string, V1_dfd_name))/binary,
                                   V1_atk_sex:8/little, V1_atk_classes:8/little,
                                   V1_atk_face_id:32/little,
                                   V1_dfd_sex:8/little, V1_dfd_classes:8/little,
                                   V1_dfd_face_id:32/little,
                                   V1_best_result:8/little, V1_r_id:32/little,
                                   (protocol:pack(string,
                                                  V1_r_platform))/binary,
                                   V1_r_zone_id:32/little>>
                                 || {V1_time,
                                     V1_atk_name,
                                     V1_dfd_name,
                                     V1_atk_sex,
                                     V1_atk_classes,
                                     V1_atk_face_id,
                                     V1_dfd_sex,
                                     V1_dfd_classes,
                                     V1_dfd_face_id,
                                     V1_best_result,
                                     {V1_r_id, V1_r_platform, V1_r_zone_id}}
                                        <- V0_last_recent]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20715:16/little,
       D_a_t_a/binary>>};
pack(cli, 20716, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20716:16/little,
       D_a_t_a/binary>>};
pack(srv, 20716,
     {#provocation_result{id =
                              {V0_r_id, V0_r_platform, V0_r_zone_id},
                          is_win = V0_is_win, mates = V0_mates,
                          rival = V0_rival}}) ->
    D_a_t_a = <<V0_r_id:32/little,
                (protocol:pack(string, V0_r_platform))/binary,
                V0_r_zone_id:32/little, V0_is_win:8/little,
                (length(V0_mates)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:8/little, V1_total_hurt:32/little,
                                   V1_total_dmg:32/little,
                                   V1_total_heal:32/little,
                                   V1_kill_num:16/little, V1_dead_num:16/little,
                                   V1_control_num:16/little,
                                   V1_mvp_score:16/little>>
                                 || #provocation_fighter{id =
                                                             {V1_rid,
                                                              V1_platform,
                                                              V1_zone_id},
                                                         name = V1_name,
                                                         sex = V1_sex,
                                                         classes = V1_classes,
                                                         lev = V1_lev,
                                                         total_hurt =
                                                             V1_total_hurt,
                                                         total_dmg =
                                                             V1_total_dmg,
                                                         total_heal =
                                                             V1_total_heal,
                                                         kill_num = V1_kill_num,
                                                         dead_num = V1_dead_num,
                                                         control_num =
                                                             V1_control_num,
                                                         mvp_score =
                                                             V1_mvp_score}
                                        <- V0_mates]))/binary,
                (length(V0_rival)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:8/little, V1_total_hurt:32/little,
                                   V1_total_dmg:32/little,
                                   V1_total_heal:32/little,
                                   V1_kill_num:16/little, V1_dead_num:16/little,
                                   V1_control_num:16/little,
                                   V1_mvp_score:16/little>>
                                 || #provocation_fighter{id =
                                                             {V1_rid,
                                                              V1_platform,
                                                              V1_zone_id},
                                                         name = V1_name,
                                                         sex = V1_sex,
                                                         classes = V1_classes,
                                                         lev = V1_lev,
                                                         total_hurt =
                                                             V1_total_hurt,
                                                         total_dmg =
                                                             V1_total_dmg,
                                                         total_heal =
                                                             V1_total_heal,
                                                         kill_num = V1_kill_num,
                                                         dead_num = V1_dead_num,
                                                         control_num =
                                                             V1_control_num,
                                                         mvp_score =
                                                             V1_mvp_score}
                                        <- V0_rival]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20716:16/little,
       D_a_t_a/binary>>};
pack(cli, 20717, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20717:16/little,
       D_a_t_a/binary>>};
pack(srv, 20717, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20717:16/little,
       D_a_t_a/binary>>};
pack(cli, 20718,
     {V0_room_check, V0_book_check, V0_video_check}) ->
    D_a_t_a = <<V0_room_check:8/little,
                V0_book_check:8/little, V0_video_check:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20718:16/little,
       D_a_t_a/binary>>};
pack(srv, 20718, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20718:16/little,
       D_a_t_a/binary>>};
pack(cli, 20719, {}) ->
    {ok, <<2:32/little, 20719:16/little>>};
pack(srv, 20719, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20719:16/little,
       D_a_t_a/binary>>};
pack(cli, 20720,
     {V0_rid, V0_platform, V0_zone_id, V0_type}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20720:16/little,
       D_a_t_a/binary>>};
pack(srv, 20720, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20720:16/little,
       D_a_t_a/binary>>};
pack(cli, 20721, {}) ->
    {ok, <<2:32/little, 20721:16/little>>};
pack(srv, 20721,
     {{V0_rid, V0_platform, V0_zone_id},
      V0_name,
      V0_lev,
      V0_type,
      V0_room_type}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_lev:8/little, V0_type:8/little,
                V0_room_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20721:16/little,
       D_a_t_a/binary>>};
pack(cli, 20722,
     {V0_rid, V0_platform, V0_zone_id, V0_flag, V0_type}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_flag:8/little,
                V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20722:16/little,
       D_a_t_a/binary>>};
pack(srv, 20722, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20722:16/little,
       D_a_t_a/binary>>};
pack(cli, 20723, {}) ->
    {ok, <<2:32/little, 20723:16/little>>};
pack(srv, 20723, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_online:8/little, V1_sex:8/little,
                                   V1_classes:8/little, V1_lev:8/little,
                                   V1_total_fc:32/little, V1_face:32/little>>
                                 || #friend_role{id =
                                                     {V1_id,
                                                      V1_platform,
                                                      V1_zone_id},
                                                 name = V1_name,
                                                 online = V1_online,
                                                 sex = V1_sex,
                                                 classes = V1_classes,
                                                 lev = V1_lev,
                                                 total_fc = V1_total_fc,
                                                 face = V1_face}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20723:16/little,
       D_a_t_a/binary>>};
pack(cli, 20724, {}) ->
    {ok, <<2:32/little, 20724:16/little>>};
pack(srv, 20724, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_online:8/little, V1_sex:8/little,
                                   V1_classes:8/little, V1_lev:8/little,
                                   V1_total_fc:32/little, V1_face:32/little>>
                                 || #friend_role{id =
                                                     {V1_id,
                                                      V1_platform,
                                                      V1_zone_id},
                                                 name = V1_name,
                                                 online = V1_online,
                                                 sex = V1_sex,
                                                 classes = V1_classes,
                                                 lev = V1_lev,
                                                 total_fc = V1_total_fc,
                                                 face = V1_face}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20724:16/little,
       D_a_t_a/binary>>};
pack(cli, 20725, {V0_init_flag}) ->
    D_a_t_a = <<V0_init_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20725:16/little,
       D_a_t_a/binary>>};
pack(srv, 20725, {V0_provocation_book}) ->
    D_a_t_a = <<(length(V0_provocation_book)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_book_lev_min:8/little,
                                   V1_min_lev_break:8/little,
                                   V1_book_lev_max:8/little,
                                   V1_max_lev_break:8/little,
                                   V1_master_fc:32/little, V1_mode:8/little,
                                   V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little, V1_master_lev:8/little,
                                   (protocol:pack(string,
                                                  V1_master_name))/binary,
                                   V1_master_sex:8/little,
                                   V1_master_class:8/little,
                                   V1_master_head:32/little,
                                   V1_live_status:8/little,
                                   V1_provocation_type:8/little>>
                                 || #provocation_book{id = V1_id,
                                                      name = V1_name,
                                                      book_lev_min =
                                                          V1_book_lev_min,
                                                      min_lev_break =
                                                          V1_min_lev_break,
                                                      book_lev_max =
                                                          V1_book_lev_max,
                                                      max_lev_break =
                                                          V1_max_lev_break,
                                                      master_fc = V1_master_fc,
                                                      mode = V1_mode,
                                                      master_id =
                                                          {V1_rid,
                                                           V1_platform,
                                                           V1_zone_id},
                                                      master_lev =
                                                          V1_master_lev,
                                                      master_name =
                                                          V1_master_name,
                                                      master_sex =
                                                          V1_master_sex,
                                                      master_class =
                                                          V1_master_class,
                                                      master_head =
                                                          V1_master_head,
                                                      live_status =
                                                          V1_live_status,
                                                      provocation_type =
                                                          V1_provocation_type}
                                        <- V0_provocation_book]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20725:16/little,
       D_a_t_a/binary>>};
pack(cli, 20726,
     {V0_book_name,
      V0_book_mode,
      V0_book_lev_min,
      V0_min_lev_break,
      V0_book_lev_max,
      V0_max_lev_break,
      V0_is_send_book,
      V0_provocation_type}) ->
    D_a_t_a = <<(protocol:pack(string,
                               V0_book_name))/binary,
                V0_book_mode:8/little, V0_book_lev_min:8/little,
                V0_min_lev_break:8/little, V0_book_lev_max:8/little,
                V0_max_lev_break:8/little, V0_is_send_book:8/little,
                V0_provocation_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20726:16/little,
       D_a_t_a/binary>>};
pack(srv, 20726, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20726:16/little,
       D_a_t_a/binary>>};
pack(cli, 20727,
     {V0_id,
      V0_book_name,
      V0_book_mode,
      V0_book_lev_min,
      V0_min_lev_break,
      V0_book_lev_max,
      V0_max_lev_break,
      V0_is_send_book,
      V0_provocation_type}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_book_name))/binary,
                V0_book_mode:8/little, V0_book_lev_min:8/little,
                V0_min_lev_break:8/little, V0_book_lev_max:8/little,
                V0_max_lev_break:8/little, V0_is_send_book:8/little,
                V0_provocation_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20727:16/little,
       D_a_t_a/binary>>};
pack(srv, 20727, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20727:16/little,
       D_a_t_a/binary>>};
pack(cli, 20728, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20728:16/little,
       D_a_t_a/binary>>};
pack(srv, 20728, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20728:16/little,
       D_a_t_a/binary>>};
pack(cli, 20729, {V0_room_id}) ->
    D_a_t_a = <<V0_room_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20729:16/little,
       D_a_t_a/binary>>};
pack(srv, 20729,
     {#provocation_room{id = V0_id, name = V0_name,
                        room_lev_min = V0_room_lev_min,
                        min_lev_break = V0_min_lev_break,
                        room_lev_max = V0_room_lev_max,
                        max_lev_break = V0_max_lev_break, mode = V0_mode,
                        password = V0_password, status = V0_status,
                        master_id = {V0_m_rid, V0_m_platform, V0_m_zone_id},
                        master_lev = V0_master_lev,
                        master_name = V0_master_name,
                        master_sex = V0_master_sex,
                        master_class = V0_master_class,
                        master_head = V0_master_head,
                        customer_id = {V0_c_rid, V0_c_platform, V0_c_zone_id},
                        last_vedio_id = {V0_r_id, V0_r_platform, V0_r_zone_id}},
      V0_customer_lev,
      V0_customer_name,
      V0_customer_sex,
      V0_customer_class,
      V0_customer_head}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_name))/binary,
                V0_room_lev_min:8/little, V0_min_lev_break:8/little,
                V0_room_lev_max:8/little, V0_max_lev_break:8/little,
                V0_mode:8/little,
                (protocol:pack(string, V0_password))/binary,
                V0_status:8/little, V0_m_rid:32/little,
                (protocol:pack(string, V0_m_platform))/binary,
                V0_m_zone_id:32/little, V0_master_lev:8/little,
                (protocol:pack(string, V0_master_name))/binary,
                V0_master_sex:8/little, V0_master_class:8/little,
                V0_master_head:32/little, V0_c_rid:32/little,
                (protocol:pack(string, V0_c_platform))/binary,
                V0_c_zone_id:32/little, V0_r_id:32/little,
                (protocol:pack(string, V0_r_platform))/binary,
                V0_r_zone_id:16/little, V0_customer_lev:8/little,
                (protocol:pack(string, V0_customer_name))/binary,
                V0_customer_sex:8/little, V0_customer_class:8/little,
                V0_customer_head:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20729:16/little,
       D_a_t_a/binary>>};
pack(cli, 20730, {V0_init_flag}) ->
    D_a_t_a = <<V0_init_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20730:16/little,
       D_a_t_a/binary>>};
pack(srv, 20730, {V0_provocation_room}) ->
    D_a_t_a = <<(length(V0_provocation_room)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_room_lev_min:8/little,
                                   V1_min_lev_break:8/little,
                                   V1_room_lev_max:8/little,
                                   V1_max_lev_break:8/little,
                                   V1_master_fc:32/little, V1_mode:8/little,
                                   (protocol:pack(string, V1_password))/binary,
                                   V1_status:8/little, V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little, V1_master_lev:8/little,
                                   (protocol:pack(string,
                                                  V1_master_name))/binary,
                                   V1_master_sex:8/little,
                                   V1_master_class:8/little,
                                   V1_master_head:32/little,
                                   V1_provocation_type:8/little>>
                                 || #provocation_room{id = V1_id,
                                                      name = V1_name,
                                                      room_lev_min =
                                                          V1_room_lev_min,
                                                      min_lev_break =
                                                          V1_min_lev_break,
                                                      room_lev_max =
                                                          V1_room_lev_max,
                                                      max_lev_break =
                                                          V1_max_lev_break,
                                                      master_fc = V1_master_fc,
                                                      mode = V1_mode,
                                                      password = V1_password,
                                                      status = V1_status,
                                                      master_id =
                                                          {V1_rid,
                                                           V1_platform,
                                                           V1_zone_id},
                                                      master_lev =
                                                          V1_master_lev,
                                                      master_name =
                                                          V1_master_name,
                                                      master_sex =
                                                          V1_master_sex,
                                                      master_class =
                                                          V1_master_class,
                                                      master_head =
                                                          V1_master_head,
                                                      provocation_type =
                                                          V1_provocation_type}
                                        <- V0_provocation_room]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20730:16/little,
       D_a_t_a/binary>>};
pack(cli, 20731, {V0_room_id}) ->
    D_a_t_a = <<V0_room_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20731:16/little,
       D_a_t_a/binary>>};
pack(srv, 20731, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20731:16/little,
       D_a_t_a/binary>>};
pack(cli, 20732,
     {V0_room_id,
      V0_flag,
      V0_password,
      V0_r_id,
      V0_r_platform,
      V0_r_zone_id}) ->
    D_a_t_a = <<V0_room_id:32/little, V0_flag:8/little,
                (protocol:pack(string, V0_password))/binary,
                V0_r_id:32/little,
                (protocol:pack(string, V0_r_platform))/binary,
                V0_r_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20732:16/little,
       D_a_t_a/binary>>};
pack(srv, 20732, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20732:16/little,
       D_a_t_a/binary>>};
pack(cli, 20733, {{V0_id, V0_platform, V0_zone_id}}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20733:16/little,
       D_a_t_a/binary>>};
pack(srv, 20733, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20733:16/little,
       D_a_t_a/binary>>};
pack(cli, 20734, {V0_name}) ->
    D_a_t_a = <<(protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20734:16/little,
       D_a_t_a/binary>>};
pack(srv, 20734, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20734:16/little,
       D_a_t_a/binary>>};
pack(cli, 20735, {}) ->
    {ok, <<2:32/little, 20735:16/little>>};
pack(srv, 20735, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20735:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 20700, _B0) ->
    {V1_init_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_init_flag}};
unpack(cli, 20700, _B0) ->
    {V1_provocation_room, _B22} = protocol:array(_B0,
                                                 fun (_B1) ->
                                                         {V2_id, _B2} =
                                                             protocol:uint32(_B1),
                                                         {V2_name, _B3} =
                                                             protocol:string(_B2),
                                                         {V2_room_lev_min,
                                                          _B4} =
                                                             protocol:uint8(_B3),
                                                         {V2_min_lev_break,
                                                          _B5} =
                                                             protocol:uint8(_B4),
                                                         {V2_room_lev_max,
                                                          _B6} =
                                                             protocol:uint8(_B5),
                                                         {V2_max_lev_break,
                                                          _B7} =
                                                             protocol:uint8(_B6),
                                                         {V2_master_fc, _B8} =
                                                             protocol:uint32(_B7),
                                                         {V2_mode, _B9} =
                                                             protocol:uint8(_B8),
                                                         {V2_password, _B10} =
                                                             protocol:string(_B9),
                                                         {V2_status, _B11} =
                                                             protocol:uint8(_B10),
                                                         {V2_rid, _B12} =
                                                             protocol:uint32(_B11),
                                                         {V2_platform, _B13} =
                                                             protocol:string(_B12),
                                                         {V2_zone_id, _B14} =
                                                             protocol:uint32(_B13),
                                                         {V2_master_lev, _B15} =
                                                             protocol:uint8(_B14),
                                                         {V2_master_name,
                                                          _B16} =
                                                             protocol:string(_B15),
                                                         {V2_master_sex, _B17} =
                                                             protocol:uint8(_B16),
                                                         {V2_master_class,
                                                          _B18} =
                                                             protocol:uint8(_B17),
                                                         {V2_master_head,
                                                          _B19} =
                                                             protocol:uint32(_B18),
                                                         {V2_provocation_type,
                                                          _B20} =
                                                             protocol:uint8(_B19),
                                                         {{V2_id,
                                                           V2_name,
                                                           V2_room_lev_min,
                                                           V2_min_lev_break,
                                                           V2_room_lev_max,
                                                           V2_max_lev_break,
                                                           V2_master_fc,
                                                           V2_mode,
                                                           V2_password,
                                                           V2_status,
                                                           V2_rid,
                                                           V2_platform,
                                                           V2_zone_id,
                                                           V2_master_lev,
                                                           V2_master_name,
                                                           V2_master_sex,
                                                           V2_master_class,
                                                           V2_master_head,
                                                           V2_provocation_type},
                                                          _B20}
                                                 end),
    {ok, {V1_provocation_room}};
unpack(srv, 20701, _B0) -> {ok, {}};
unpack(cli, 20701, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 20702, _B0) -> {ok, {}};
unpack(cli, 20702, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 20703, _B0) ->
    {V1_room_name, _B1} = protocol:string(_B0),
    {V1_room_mode, _B2} = protocol:uint8(_B1),
    {V1_room_lev_min, _B3} = protocol:uint8(_B2),
    {V1_min_lev_break, _B4} = protocol:uint8(_B3),
    {V1_room_lev_max, _B5} = protocol:uint8(_B4),
    {V1_max_lev_break, _B6} = protocol:uint8(_B5),
    {V1_room_password, _B7} = protocol:string(_B6),
    {V1_provocation_type, _B8} = protocol:uint8(_B7),
    {ok,
     {V1_room_name,
      V1_room_mode,
      V1_room_lev_min,
      V1_min_lev_break,
      V1_room_lev_max,
      V1_max_lev_break,
      V1_room_password,
      V1_provocation_type}};
unpack(cli, 20703, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 20704, _B0) -> {ok, {}};
unpack(cli, 20704, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_name, _B2} = protocol:string(_B1),
    {V1_room_lev_min, _B3} = protocol:uint8(_B2),
    {V1_min_lev_break, _B4} = protocol:uint8(_B3),
    {V1_room_lev_max, _B5} = protocol:uint8(_B4),
    {V1_max_lev_break, _B6} = protocol:uint8(_B5),
    {V1_mode, _B7} = protocol:uint8(_B6),
    {V1_password, _B8} = protocol:string(_B7),
    {V1_status, _B9} = protocol:uint8(_B8),
    {V1_rid, _B10} = protocol:uint32(_B9),
    {V1_platform, _B11} = protocol:string(_B10),
    {V1_zone_id, _B12} = protocol:uint32(_B11),
    {V1_master_lev, _B13} = protocol:uint8(_B12),
    {V1_master_name, _B14} = protocol:string(_B13),
    {V1_master_sex, _B15} = protocol:uint8(_B14),
    {V1_master_class, _B16} = protocol:uint8(_B15),
    {V1_master_head, _B17} = protocol:uint32(_B16),
    {V1_provocation_type, _B18} = protocol:uint8(_B17),
    {V1_target_rid, _B19} = protocol:uint32(_B18),
    {V1_target_platform, _B20} = protocol:string(_B19),
    {V1_target_zone_id, _B21} = protocol:uint32(_B20),
    {V1_horn_rid, _B22} = protocol:uint32(_B21),
    {V1_horn_platform, _B23} = protocol:string(_B22),
    {V1_horn_zone_id, _B24} = protocol:uint32(_B23),
    {V1_provocation_team, _B65} = protocol:array(_B24,
                                                 fun (_B25) ->
                                                         {V2_team_formation,
                                                          _B26} =
                                                             protocol:uint8(_B25),
                                                         {V2_team_formation_lev,
                                                          _B27} =
                                                             protocol:uint8(_B26),
                                                         {V2_order, _B33} =
                                                             protocol:array(_B27,
                                                                            fun
                                                                                (_B28) ->
                                                                                    {V3_rid,
                                                                                     _B29} =
                                                                                        protocol:uint32(_B28),
                                                                                    {V3_platform,
                                                                                     _B30} =
                                                                                        protocol:string(_B29),
                                                                                    {V3_zone_id,
                                                                                     _B31} =
                                                                                        protocol:uint32(_B30),
                                                                                    {{V3_rid,
                                                                                      V3_platform,
                                                                                      V3_zone_id},
                                                                                     _B31}
                                                                            end),
                                                         {V2_guards, _B40} =
                                                             protocol:array(_B33,
                                                                            fun
                                                                                (_B34) ->
                                                                                    {V3_base_id,
                                                                                     _B35} =
                                                                                        protocol:uint32(_B34),
                                                                                    {V3_status,
                                                                                     _B36} =
                                                                                        protocol:uint8(_B35),
                                                                                    {V3_war_id,
                                                                                     _B37} =
                                                                                        protocol:uint8(_B36),
                                                                                    {V3_quality,
                                                                                     _B38} =
                                                                                        protocol:uint8(_B37),
                                                                                    {{V3_base_id,
                                                                                      V3_status,
                                                                                      V3_war_id,
                                                                                      V3_quality},
                                                                                     _B38}
                                                                            end),
                                                         {V2_team_mate, _B63} =
                                                             protocol:array(_B40,
                                                                            fun
                                                                                (_B41) ->
                                                                                    {V3_rid,
                                                                                     _B42} =
                                                                                        protocol:uint32(_B41),
                                                                                    {V3_platform,
                                                                                     _B43} =
                                                                                        protocol:string(_B42),
                                                                                    {V3_zone_id,
                                                                                     _B44} =
                                                                                        protocol:uint32(_B43),
                                                                                    {V3_name,
                                                                                     _B45} =
                                                                                        protocol:string(_B44),
                                                                                    {V3_sex,
                                                                                     _B46} =
                                                                                        protocol:uint8(_B45),
                                                                                    {V3_classes,
                                                                                     _B47} =
                                                                                        protocol:uint8(_B46),
                                                                                    {V3_lev,
                                                                                     _B48} =
                                                                                        protocol:uint8(_B47),
                                                                                    {V3_face_id,
                                                                                     _B49} =
                                                                                        protocol:uint32(_B48),
                                                                                    {V3_status,
                                                                                     _B50} =
                                                                                        protocol:uint8(_B49),
                                                                                    {V3_looks,
                                                                                     _B57} =
                                                                                        protocol:array(_B50,
                                                                                                       fun
                                                                                                           (_B51) ->
                                                                                                               {V4_looks_type,
                                                                                                                _B52} =
                                                                                                                   protocol:uint32(_B51),
                                                                                                               {V4_looks_mode,
                                                                                                                _B53} =
                                                                                                                   protocol:uint32(_B52),
                                                                                                               {V4_looks_val,
                                                                                                                _B54} =
                                                                                                                   protocol:uint32(_B53),
                                                                                                               {V4_looks_str,
                                                                                                                _B55} =
                                                                                                                   protocol:string(_B54),
                                                                                                               {{V4_looks_type,
                                                                                                                 V4_looks_mode,
                                                                                                                 V4_looks_val,
                                                                                                                 V4_looks_str},
                                                                                                                _B55}
                                                                                                       end),
                                                                                    {V3_join_type,
                                                                                     _B58} =
                                                                                        protocol:uint8(_B57),
                                                                                    {V3_join_sub_type,
                                                                                     _B59} =
                                                                                        protocol:uint8(_B58),
                                                                                    {V3_join_time,
                                                                                     _B60} =
                                                                                        protocol:uint32(_B59),
                                                                                    {V3_combat_num,
                                                                                     _B61} =
                                                                                        protocol:uint32(_B60),
                                                                                    {{V3_rid,
                                                                                      V3_platform,
                                                                                      V3_zone_id,
                                                                                      V3_name,
                                                                                      V3_sex,
                                                                                      V3_classes,
                                                                                      V3_lev,
                                                                                      V3_face_id,
                                                                                      V3_status,
                                                                                      V3_looks,
                                                                                      V3_join_type,
                                                                                      V3_join_sub_type,
                                                                                      V3_join_time,
                                                                                      V3_combat_num},
                                                                                     _B61}
                                                                            end),
                                                         {{V2_team_formation,
                                                           V2_team_formation_lev,
                                                           V2_order,
                                                           V2_guards,
                                                           V2_team_mate},
                                                          _B63}
                                                 end),
    {ok,
     {V1_id,
      V1_name,
      V1_room_lev_min,
      V1_min_lev_break,
      V1_room_lev_max,
      V1_max_lev_break,
      V1_mode,
      V1_password,
      V1_status,
      V1_rid,
      V1_platform,
      V1_zone_id,
      V1_master_lev,
      V1_master_name,
      V1_master_sex,
      V1_master_class,
      V1_master_head,
      V1_provocation_type,
      V1_target_rid,
      V1_target_platform,
      V1_target_zone_id,
      V1_horn_rid,
      V1_horn_platform,
      V1_horn_zone_id,
      V1_provocation_team}};
unpack(srv, 20705, _B0) ->
    {V1_room_id, _B1} = protocol:uint32(_B0),
    {V1_password, _B2} = protocol:string(_B1),
    {ok, {V1_room_id, V1_password}};
unpack(cli, 20705, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 20706, _B0) ->
    {V1_room_id, _B1} = protocol:uint32(_B0),
    {V1_name, _B2} = protocol:string(_B1),
    {V1_mode, _B3} = protocol:uint8(_B2),
    {V1_room_lev_min, _B4} = protocol:uint8(_B3),
    {V1_min_lev_break, _B5} = protocol:uint8(_B4),
    {V1_room_lev_max, _B6} = protocol:uint8(_B5),
    {V1_max_lev_break, _B7} = protocol:uint8(_B6),
    {V1_password, _B8} = protocol:string(_B7),
    {V1_provocation_type, _B9} = protocol:uint8(_B8),
    {ok,
     {V1_room_id,
      V1_name,
      V1_mode,
      V1_room_lev_min,
      V1_min_lev_break,
      V1_room_lev_max,
      V1_max_lev_break,
      V1_password,
      V1_provocation_type}};
unpack(cli, 20706, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 20707, _B0) -> {ok, {}};
unpack(cli, 20707, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 20708, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 20708, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 20709, _B0) ->
    {V1_channel, _B1} = protocol:uint8(_B0),
    {V1_flag, _B2} = protocol:uint8(_B1),
    {ok, {V1_channel, V1_flag}};
unpack(cli, 20709, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 20710, _B0) -> {ok, {}};
unpack(cli, 20710, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 20711, _B0) -> {ok, {}};
unpack(cli, 20711, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 20712, _B0) -> {ok, {}};
unpack(cli, 20712, _B0) ->
    {V1_room_check, _B1} = protocol:uint8(_B0),
    {V1_book_check, _B2} = protocol:uint8(_B1),
    {V1_video_check, _B3} = protocol:uint8(_B2),
    {ok, {V1_room_check, V1_book_check, V1_video_check}};
unpack(srv, 20713, _B0) -> {ok, {}};
unpack(cli, 20713, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 20714, _B0) -> {ok, {}};
unpack(cli, 20714, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_r_type, _B2} = protocol:uint16(_B1),
    {V1_r_id, _B3} = protocol:uint32(_B2),
    {V1_r_platform, _B4} = protocol:string(_B3),
    {V1_r_zone_id, _B5} = protocol:uint16(_B4),
    {V1_mates, _B22} = protocol:array(_B5,
                                      fun (_B6) ->
                                              {V2_rid, _B7} =
                                                  protocol:uint32(_B6),
                                              {V2_platform, _B8} =
                                                  protocol:string(_B7),
                                              {V2_zone_id, _B9} =
                                                  protocol:uint32(_B8),
                                              {V2_name, _B10} =
                                                  protocol:string(_B9),
                                              {V2_sex, _B11} =
                                                  protocol:uint8(_B10),
                                              {V2_classes, _B12} =
                                                  protocol:uint8(_B11),
                                              {V2_lev, _B13} =
                                                  protocol:uint8(_B12),
                                              {V2_total_hurt, _B14} =
                                                  protocol:uint32(_B13),
                                              {V2_total_dmg, _B15} =
                                                  protocol:uint32(_B14),
                                              {V2_total_heal, _B16} =
                                                  protocol:uint32(_B15),
                                              {V2_kill_num, _B17} =
                                                  protocol:uint16(_B16),
                                              {V2_dead_num, _B18} =
                                                  protocol:uint16(_B17),
                                              {V2_control_num, _B19} =
                                                  protocol:uint16(_B18),
                                              {V2_mvp_score, _B20} =
                                                  protocol:uint16(_B19),
                                              {{V2_rid,
                                                V2_platform,
                                                V2_zone_id,
                                                V2_name,
                                                V2_sex,
                                                V2_classes,
                                                V2_lev,
                                                V2_total_hurt,
                                                V2_total_dmg,
                                                V2_total_heal,
                                                V2_kill_num,
                                                V2_dead_num,
                                                V2_control_num,
                                                V2_mvp_score},
                                               _B20}
                                      end),
    {V1_rival, _B39} = protocol:array(_B22,
                                      fun (_B23) ->
                                              {V2_rid, _B24} =
                                                  protocol:uint32(_B23),
                                              {V2_platform, _B25} =
                                                  protocol:string(_B24),
                                              {V2_zone_id, _B26} =
                                                  protocol:uint32(_B25),
                                              {V2_name, _B27} =
                                                  protocol:string(_B26),
                                              {V2_sex, _B28} =
                                                  protocol:uint8(_B27),
                                              {V2_classes, _B29} =
                                                  protocol:uint8(_B28),
                                              {V2_lev, _B30} =
                                                  protocol:uint8(_B29),
                                              {V2_total_hurt, _B31} =
                                                  protocol:uint32(_B30),
                                              {V2_total_dmg, _B32} =
                                                  protocol:uint32(_B31),
                                              {V2_total_heal, _B33} =
                                                  protocol:uint32(_B32),
                                              {V2_kill_num, _B34} =
                                                  protocol:uint16(_B33),
                                              {V2_dead_num, _B35} =
                                                  protocol:uint16(_B34),
                                              {V2_control_num, _B36} =
                                                  protocol:uint16(_B35),
                                              {V2_mvp_score, _B37} =
                                                  protocol:uint16(_B36),
                                              {{V2_rid,
                                                V2_platform,
                                                V2_zone_id,
                                                V2_name,
                                                V2_sex,
                                                V2_classes,
                                                V2_lev,
                                                V2_total_hurt,
                                                V2_total_dmg,
                                                V2_total_heal,
                                                V2_kill_num,
                                                V2_dead_num,
                                                V2_control_num,
                                                V2_mvp_score},
                                               _B37}
                                      end),
    {ok,
     {V1_result,
      V1_r_type,
      V1_r_id,
      V1_r_platform,
      V1_r_zone_id,
      V1_mates,
      V1_rival}};
unpack(srv, 20715, _B0) -> {ok, {}};
unpack(cli, 20715, _B0) ->
    {V1_last_recent, _B16} = protocol:array(_B0,
                                            fun (_B1) ->
                                                    {V2_time, _B2} =
                                                        protocol:uint32(_B1),
                                                    {V2_atk_name, _B3} =
                                                        protocol:string(_B2),
                                                    {V2_dfd_name, _B4} =
                                                        protocol:string(_B3),
                                                    {V2_atk_sex, _B5} =
                                                        protocol:uint8(_B4),
                                                    {V2_atk_classes, _B6} =
                                                        protocol:uint8(_B5),
                                                    {V2_atk_face_id, _B7} =
                                                        protocol:uint32(_B6),
                                                    {V2_dfd_sex, _B8} =
                                                        protocol:uint8(_B7),
                                                    {V2_dfd_classes, _B9} =
                                                        protocol:uint8(_B8),
                                                    {V2_dfd_face_id, _B10} =
                                                        protocol:uint32(_B9),
                                                    {V2_best_result, _B11} =
                                                        protocol:uint8(_B10),
                                                    {V2_r_id, _B12} =
                                                        protocol:uint32(_B11),
                                                    {V2_r_platform, _B13} =
                                                        protocol:string(_B12),
                                                    {V2_r_zone_id, _B14} =
                                                        protocol:uint32(_B13),
                                                    {{V2_time,
                                                      V2_atk_name,
                                                      V2_dfd_name,
                                                      V2_atk_sex,
                                                      V2_atk_classes,
                                                      V2_atk_face_id,
                                                      V2_dfd_sex,
                                                      V2_dfd_classes,
                                                      V2_dfd_face_id,
                                                      V2_best_result,
                                                      V2_r_id,
                                                      V2_r_platform,
                                                      V2_r_zone_id},
                                                     _B14}
                                            end),
    {ok, {V1_last_recent}};
unpack(srv, 20716, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 20716, _B0) ->
    {V1_r_id, _B1} = protocol:uint32(_B0),
    {V1_r_platform, _B2} = protocol:string(_B1),
    {V1_r_zone_id, _B3} = protocol:uint32(_B2),
    {V1_is_win, _B4} = protocol:uint8(_B3),
    {V1_mates, _B21} = protocol:array(_B4,
                                      fun (_B5) ->
                                              {V2_rid, _B6} =
                                                  protocol:uint32(_B5),
                                              {V2_platform, _B7} =
                                                  protocol:string(_B6),
                                              {V2_zone_id, _B8} =
                                                  protocol:uint32(_B7),
                                              {V2_name, _B9} =
                                                  protocol:string(_B8),
                                              {V2_sex, _B10} =
                                                  protocol:uint8(_B9),
                                              {V2_classes, _B11} =
                                                  protocol:uint8(_B10),
                                              {V2_lev, _B12} =
                                                  protocol:uint8(_B11),
                                              {V2_total_hurt, _B13} =
                                                  protocol:uint32(_B12),
                                              {V2_total_dmg, _B14} =
                                                  protocol:uint32(_B13),
                                              {V2_total_heal, _B15} =
                                                  protocol:uint32(_B14),
                                              {V2_kill_num, _B16} =
                                                  protocol:uint16(_B15),
                                              {V2_dead_num, _B17} =
                                                  protocol:uint16(_B16),
                                              {V2_control_num, _B18} =
                                                  protocol:uint16(_B17),
                                              {V2_mvp_score, _B19} =
                                                  protocol:uint16(_B18),
                                              {{V2_rid,
                                                V2_platform,
                                                V2_zone_id,
                                                V2_name,
                                                V2_sex,
                                                V2_classes,
                                                V2_lev,
                                                V2_total_hurt,
                                                V2_total_dmg,
                                                V2_total_heal,
                                                V2_kill_num,
                                                V2_dead_num,
                                                V2_control_num,
                                                V2_mvp_score},
                                               _B19}
                                      end),
    {V1_rival, _B38} = protocol:array(_B21,
                                      fun (_B22) ->
                                              {V2_rid, _B23} =
                                                  protocol:uint32(_B22),
                                              {V2_platform, _B24} =
                                                  protocol:string(_B23),
                                              {V2_zone_id, _B25} =
                                                  protocol:uint32(_B24),
                                              {V2_name, _B26} =
                                                  protocol:string(_B25),
                                              {V2_sex, _B27} =
                                                  protocol:uint8(_B26),
                                              {V2_classes, _B28} =
                                                  protocol:uint8(_B27),
                                              {V2_lev, _B29} =
                                                  protocol:uint8(_B28),
                                              {V2_total_hurt, _B30} =
                                                  protocol:uint32(_B29),
                                              {V2_total_dmg, _B31} =
                                                  protocol:uint32(_B30),
                                              {V2_total_heal, _B32} =
                                                  protocol:uint32(_B31),
                                              {V2_kill_num, _B33} =
                                                  protocol:uint16(_B32),
                                              {V2_dead_num, _B34} =
                                                  protocol:uint16(_B33),
                                              {V2_control_num, _B35} =
                                                  protocol:uint16(_B34),
                                              {V2_mvp_score, _B36} =
                                                  protocol:uint16(_B35),
                                              {{V2_rid,
                                                V2_platform,
                                                V2_zone_id,
                                                V2_name,
                                                V2_sex,
                                                V2_classes,
                                                V2_lev,
                                                V2_total_hurt,
                                                V2_total_dmg,
                                                V2_total_heal,
                                                V2_kill_num,
                                                V2_dead_num,
                                                V2_control_num,
                                                V2_mvp_score},
                                               _B36}
                                      end),
    {ok,
     {V1_r_id,
      V1_r_platform,
      V1_r_zone_id,
      V1_is_win,
      V1_mates,
      V1_rival}};
unpack(srv, 20717, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 20717, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 20718, _B0) ->
    {V1_room_check, _B1} = protocol:uint8(_B0),
    {V1_book_check, _B2} = protocol:uint8(_B1),
    {V1_video_check, _B3} = protocol:uint8(_B2),
    {ok, {V1_room_check, V1_book_check, V1_video_check}};
unpack(cli, 20718, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 20719, _B0) -> {ok, {}};
unpack(cli, 20719, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 20720, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_type, _B4} = protocol:uint8(_B3),
    {ok, {V1_rid, V1_platform, V1_zone_id, V1_type}};
unpack(cli, 20720, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 20721, _B0) -> {ok, {}};
unpack(cli, 20721, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_lev, _B5} = protocol:uint8(_B4),
    {V1_type, _B6} = protocol:uint8(_B5),
    {V1_room_type, _B7} = protocol:uint8(_B6),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_lev,
      V1_type,
      V1_room_type}};
unpack(srv, 20722, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_flag, _B4} = protocol:uint8(_B3),
    {V1_type, _B5} = protocol:uint8(_B4),
    {ok,
     {V1_rid, V1_platform, V1_zone_id, V1_flag, V1_type}};
unpack(cli, 20722, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 20723, _B0) -> {ok, {}};
unpack(cli, 20723, _B0) ->
    {V1_list, _B13} = protocol:array(_B0,
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
                                             {V2_total_fc, _B10} =
                                                 protocol:uint32(_B9),
                                             {V2_face, _B11} =
                                                 protocol:uint32(_B10),
                                             {{V2_id,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_name,
                                               V2_online,
                                               V2_sex,
                                               V2_classes,
                                               V2_lev,
                                               V2_total_fc,
                                               V2_face},
                                              _B11}
                                     end),
    {ok, {V1_list}};
unpack(srv, 20724, _B0) -> {ok, {}};
unpack(cli, 20724, _B0) ->
    {V1_list, _B13} = protocol:array(_B0,
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
                                             {V2_total_fc, _B10} =
                                                 protocol:uint32(_B9),
                                             {V2_face, _B11} =
                                                 protocol:uint32(_B10),
                                             {{V2_id,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_name,
                                               V2_online,
                                               V2_sex,
                                               V2_classes,
                                               V2_lev,
                                               V2_total_fc,
                                               V2_face},
                                              _B11}
                                     end),
    {ok, {V1_list}};
unpack(srv, 20725, _B0) ->
    {V1_init_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_init_flag}};
unpack(cli, 20725, _B0) ->
    {V1_provocation_book, _B21} = protocol:array(_B0,
                                                 fun (_B1) ->
                                                         {V2_id, _B2} =
                                                             protocol:uint32(_B1),
                                                         {V2_name, _B3} =
                                                             protocol:string(_B2),
                                                         {V2_book_lev_min,
                                                          _B4} =
                                                             protocol:uint8(_B3),
                                                         {V2_min_lev_break,
                                                          _B5} =
                                                             protocol:uint8(_B4),
                                                         {V2_book_lev_max,
                                                          _B6} =
                                                             protocol:uint8(_B5),
                                                         {V2_max_lev_break,
                                                          _B7} =
                                                             protocol:uint8(_B6),
                                                         {V2_master_fc, _B8} =
                                                             protocol:uint32(_B7),
                                                         {V2_mode, _B9} =
                                                             protocol:uint8(_B8),
                                                         {V2_rid, _B10} =
                                                             protocol:uint32(_B9),
                                                         {V2_platform, _B11} =
                                                             protocol:string(_B10),
                                                         {V2_zone_id, _B12} =
                                                             protocol:uint32(_B11),
                                                         {V2_master_lev, _B13} =
                                                             protocol:uint8(_B12),
                                                         {V2_master_name,
                                                          _B14} =
                                                             protocol:string(_B13),
                                                         {V2_master_sex, _B15} =
                                                             protocol:uint8(_B14),
                                                         {V2_master_class,
                                                          _B16} =
                                                             protocol:uint8(_B15),
                                                         {V2_master_head,
                                                          _B17} =
                                                             protocol:uint32(_B16),
                                                         {V2_live_status,
                                                          _B18} =
                                                             protocol:uint8(_B17),
                                                         {V2_provocation_type,
                                                          _B19} =
                                                             protocol:uint8(_B18),
                                                         {{V2_id,
                                                           V2_name,
                                                           V2_book_lev_min,
                                                           V2_min_lev_break,
                                                           V2_book_lev_max,
                                                           V2_max_lev_break,
                                                           V2_master_fc,
                                                           V2_mode,
                                                           V2_rid,
                                                           V2_platform,
                                                           V2_zone_id,
                                                           V2_master_lev,
                                                           V2_master_name,
                                                           V2_master_sex,
                                                           V2_master_class,
                                                           V2_master_head,
                                                           V2_live_status,
                                                           V2_provocation_type},
                                                          _B19}
                                                 end),
    {ok, {V1_provocation_book}};
unpack(srv, 20726, _B0) ->
    {V1_book_name, _B1} = protocol:string(_B0),
    {V1_book_mode, _B2} = protocol:uint8(_B1),
    {V1_book_lev_min, _B3} = protocol:uint8(_B2),
    {V1_min_lev_break, _B4} = protocol:uint8(_B3),
    {V1_book_lev_max, _B5} = protocol:uint8(_B4),
    {V1_max_lev_break, _B6} = protocol:uint8(_B5),
    {V1_is_send_book, _B7} = protocol:uint8(_B6),
    {V1_provocation_type, _B8} = protocol:uint8(_B7),
    {ok,
     {V1_book_name,
      V1_book_mode,
      V1_book_lev_min,
      V1_min_lev_break,
      V1_book_lev_max,
      V1_max_lev_break,
      V1_is_send_book,
      V1_provocation_type}};
unpack(cli, 20726, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 20727, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_book_name, _B2} = protocol:string(_B1),
    {V1_book_mode, _B3} = protocol:uint8(_B2),
    {V1_book_lev_min, _B4} = protocol:uint8(_B3),
    {V1_min_lev_break, _B5} = protocol:uint8(_B4),
    {V1_book_lev_max, _B6} = protocol:uint8(_B5),
    {V1_max_lev_break, _B7} = protocol:uint8(_B6),
    {V1_is_send_book, _B8} = protocol:uint8(_B7),
    {V1_provocation_type, _B9} = protocol:uint8(_B8),
    {ok,
     {V1_id,
      V1_book_name,
      V1_book_mode,
      V1_book_lev_min,
      V1_min_lev_break,
      V1_book_lev_max,
      V1_max_lev_break,
      V1_is_send_book,
      V1_provocation_type}};
unpack(cli, 20727, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 20728, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 20728, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 20729, _B0) ->
    {V1_room_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_room_id}};
unpack(cli, 20729, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_name, _B2} = protocol:string(_B1),
    {V1_room_lev_min, _B3} = protocol:uint8(_B2),
    {V1_min_lev_break, _B4} = protocol:uint8(_B3),
    {V1_room_lev_max, _B5} = protocol:uint8(_B4),
    {V1_max_lev_break, _B6} = protocol:uint8(_B5),
    {V1_mode, _B7} = protocol:uint8(_B6),
    {V1_password, _B8} = protocol:string(_B7),
    {V1_status, _B9} = protocol:uint8(_B8),
    {V1_m_rid, _B10} = protocol:uint32(_B9),
    {V1_m_platform, _B11} = protocol:string(_B10),
    {V1_m_zone_id, _B12} = protocol:uint32(_B11),
    {V1_master_lev, _B13} = protocol:uint8(_B12),
    {V1_master_name, _B14} = protocol:string(_B13),
    {V1_master_sex, _B15} = protocol:uint8(_B14),
    {V1_master_class, _B16} = protocol:uint8(_B15),
    {V1_master_head, _B17} = protocol:uint32(_B16),
    {V1_c_rid, _B18} = protocol:uint32(_B17),
    {V1_c_platform, _B19} = protocol:string(_B18),
    {V1_c_zone_id, _B20} = protocol:uint32(_B19),
    {V1_r_id, _B21} = protocol:uint32(_B20),
    {V1_r_platform, _B22} = protocol:string(_B21),
    {V1_r_zone_id, _B23} = protocol:uint16(_B22),
    {V1_customer_lev, _B24} = protocol:uint8(_B23),
    {V1_customer_name, _B25} = protocol:string(_B24),
    {V1_customer_sex, _B26} = protocol:uint8(_B25),
    {V1_customer_class, _B27} = protocol:uint8(_B26),
    {V1_customer_head, _B28} = protocol:uint32(_B27),
    {ok,
     {V1_id,
      V1_name,
      V1_room_lev_min,
      V1_min_lev_break,
      V1_room_lev_max,
      V1_max_lev_break,
      V1_mode,
      V1_password,
      V1_status,
      V1_m_rid,
      V1_m_platform,
      V1_m_zone_id,
      V1_master_lev,
      V1_master_name,
      V1_master_sex,
      V1_master_class,
      V1_master_head,
      V1_c_rid,
      V1_c_platform,
      V1_c_zone_id,
      V1_r_id,
      V1_r_platform,
      V1_r_zone_id,
      V1_customer_lev,
      V1_customer_name,
      V1_customer_sex,
      V1_customer_class,
      V1_customer_head}};
unpack(srv, 20730, _B0) ->
    {V1_init_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_init_flag}};
unpack(cli, 20730, _B0) ->
    {V1_provocation_room, _B22} = protocol:array(_B0,
                                                 fun (_B1) ->
                                                         {V2_id, _B2} =
                                                             protocol:uint32(_B1),
                                                         {V2_name, _B3} =
                                                             protocol:string(_B2),
                                                         {V2_room_lev_min,
                                                          _B4} =
                                                             protocol:uint8(_B3),
                                                         {V2_min_lev_break,
                                                          _B5} =
                                                             protocol:uint8(_B4),
                                                         {V2_room_lev_max,
                                                          _B6} =
                                                             protocol:uint8(_B5),
                                                         {V2_max_lev_break,
                                                          _B7} =
                                                             protocol:uint8(_B6),
                                                         {V2_master_fc, _B8} =
                                                             protocol:uint32(_B7),
                                                         {V2_mode, _B9} =
                                                             protocol:uint8(_B8),
                                                         {V2_password, _B10} =
                                                             protocol:string(_B9),
                                                         {V2_status, _B11} =
                                                             protocol:uint8(_B10),
                                                         {V2_rid, _B12} =
                                                             protocol:uint32(_B11),
                                                         {V2_platform, _B13} =
                                                             protocol:string(_B12),
                                                         {V2_zone_id, _B14} =
                                                             protocol:uint32(_B13),
                                                         {V2_master_lev, _B15} =
                                                             protocol:uint8(_B14),
                                                         {V2_master_name,
                                                          _B16} =
                                                             protocol:string(_B15),
                                                         {V2_master_sex, _B17} =
                                                             protocol:uint8(_B16),
                                                         {V2_master_class,
                                                          _B18} =
                                                             protocol:uint8(_B17),
                                                         {V2_master_head,
                                                          _B19} =
                                                             protocol:uint32(_B18),
                                                         {V2_provocation_type,
                                                          _B20} =
                                                             protocol:uint8(_B19),
                                                         {{V2_id,
                                                           V2_name,
                                                           V2_room_lev_min,
                                                           V2_min_lev_break,
                                                           V2_room_lev_max,
                                                           V2_max_lev_break,
                                                           V2_master_fc,
                                                           V2_mode,
                                                           V2_password,
                                                           V2_status,
                                                           V2_rid,
                                                           V2_platform,
                                                           V2_zone_id,
                                                           V2_master_lev,
                                                           V2_master_name,
                                                           V2_master_sex,
                                                           V2_master_class,
                                                           V2_master_head,
                                                           V2_provocation_type},
                                                          _B20}
                                                 end),
    {ok, {V1_provocation_room}};
unpack(srv, 20731, _B0) ->
    {V1_room_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_room_id}};
unpack(cli, 20731, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 20732, _B0) ->
    {V1_room_id, _B1} = protocol:uint32(_B0),
    {V1_flag, _B2} = protocol:uint8(_B1),
    {V1_password, _B3} = protocol:string(_B2),
    {V1_r_id, _B4} = protocol:uint32(_B3),
    {V1_r_platform, _B5} = protocol:string(_B4),
    {V1_r_zone_id, _B6} = protocol:uint16(_B5),
    {ok,
     {V1_room_id,
      V1_flag,
      V1_password,
      V1_r_id,
      V1_r_platform,
      V1_r_zone_id}};
unpack(cli, 20732, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 20733, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 20733, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 20734, _B0) ->
    {V1_name, _B1} = protocol:string(_B0),
    {ok, {V1_name}};
unpack(cli, 20734, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 20735, _B0) -> {ok, {}};
unpack(cli, 20735, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

