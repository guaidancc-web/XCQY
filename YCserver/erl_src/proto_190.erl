-file("src/proto/proto_190.erl", 1).

-module(proto_190).

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

-file("src/proto/proto_190.erl", 14).

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

-file("src/proto/proto_190.erl", 15).

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

-file("src/proto/proto_190.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 19000,
     {V0_group_rid, V0_group_platform, V0_group_zone_id}) ->
    D_a_t_a = <<V0_group_rid:32/little,
                (protocol:pack(string, V0_group_platform))/binary,
                V0_group_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19000:16/little,
       D_a_t_a/binary>>};
pack(srv, 19000,
     {#friend_group{id =
                        {V0_group_id, V0_group_platform, V0_group_zone_id},
                    name = V0_name, content = V0_content,
                    owner_id =
                        {V0_owner_rid, V0_owner_platform, V0_owner_zone_id},
                    owner_name = V0_owner_name,
                    owner_classes = V0_owner_classes,
                    owner_lev = V0_owner_lev, owner_sex = V0_owner_sex,
                    owner_fc = V0_owner_fc, members = V0_members}}) ->
    D_a_t_a = <<V0_group_id:32/little,
                (protocol:pack(string, V0_group_platform))/binary,
                V0_group_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                (protocol:pack(string, V0_content))/binary,
                V0_owner_rid:32/little,
                (protocol:pack(string, V0_owner_platform))/binary,
                V0_owner_zone_id:16/little,
                (protocol:pack(string, V0_owner_name))/binary,
                V0_owner_classes:8/little, V0_owner_lev:16/little,
                V0_owner_sex:8/little, V0_owner_fc:32/little,
                (length(V0_members)):16/little,
                (list_to_binary([<<V1_role_rid:32/little,
                                   (protocol:pack(string,
                                                  V1_role_platform))/binary,
                                   V1_role_zone_id:16/little,
                                   (protocol:pack(string, V1_role_name))/binary,
                                   V1_role_classes:8/little,
                                   V1_role_lev:16/little, V1_role_sex:8/little,
                                   V1_online:8/little, V1_online_time:32/little,
                                   V1_post:16/little, V1_notice:8/little>>
                                 || #friend_group_role_data{role_id =
                                                                {V1_role_rid,
                                                                 V1_role_platform,
                                                                 V1_role_zone_id},
                                                            role_name =
                                                                V1_role_name,
                                                            role_classes =
                                                                V1_role_classes,
                                                            role_lev =
                                                                V1_role_lev,
                                                            role_sex =
                                                                V1_role_sex,
                                                            online = V1_online,
                                                            online_time =
                                                                V1_online_time,
                                                            post = V1_post,
                                                            notice = V1_notice}
                                        <- V0_members]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19000:16/little,
       D_a_t_a/binary>>};
pack(cli, 19001, {}) ->
    {ok, <<2:32/little, 19001:16/little>>};
pack(srv, 19001,
     {#friend_group_role{groups = V0_groups,
                         create = V0_create, join = V0_join,
                         unlock = V0_unlock},
      V0_extra}) ->
    D_a_t_a = <<(length(V0_groups)):16/little,
                (list_to_binary([<<V1_group_rid:32/little,
                                   (protocol:pack(string,
                                                  V1_group_platform))/binary,
                                   V1_group_zone_id:16/little,
                                   (protocol:pack(string,
                                                  V1_group_name))/binary,
                                   (protocol:pack(string,
                                                  V1_group_content))/binary,
                                   V1_role_rid:32/little,
                                   (protocol:pack(string,
                                                  V1_role_platform))/binary,
                                   V1_role_zone_id:16/little,
                                   (protocol:pack(string,
                                                  V1_owner_name))/binary,
                                   V1_owner_classes:8/little,
                                   V1_owner_sex:8/little, V1_time:32/little>>
                                 || #friend_group_data{group_id =
                                                           {V1_group_rid,
                                                            V1_group_platform,
                                                            V1_group_zone_id},
                                                       group_name =
                                                           V1_group_name,
                                                       group_content =
                                                           V1_group_content,
                                                       owner_id =
                                                           {V1_role_rid,
                                                            V1_role_platform,
                                                            V1_role_zone_id},
                                                       owner_name =
                                                           V1_owner_name,
                                                       owner_classes =
                                                           V1_owner_classes,
                                                       owner_sex = V1_owner_sex,
                                                       time = V1_time}
                                        <- V0_groups]))/binary,
                V0_create:16/little, V0_join:16/little,
                V0_unlock:16/little, V0_extra:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19001:16/little,
       D_a_t_a/binary>>};
pack(cli, 19002, {V0_name}) ->
    D_a_t_a = <<(protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19002:16/little,
       D_a_t_a/binary>>};
pack(srv, 19002, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19002:16/little,
       D_a_t_a/binary>>};
pack(cli, 19003,
     {V0_id,
      V0_platform,
      V0_zone_id,
      V0_role_id,
      V0_role_platform,
      V0_role_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_role_id:32/little,
                (protocol:pack(string, V0_role_platform))/binary,
                V0_role_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19003:16/little,
       D_a_t_a/binary>>};
pack(srv, 19003, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19003:16/little,
       D_a_t_a/binary>>};
pack(cli, 19004, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19004:16/little,
       D_a_t_a/binary>>};
pack(srv, 19004, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19004:16/little,
       D_a_t_a/binary>>};
pack(cli, 19005, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19005:16/little,
       D_a_t_a/binary>>};
pack(srv, 19005, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19005:16/little,
       D_a_t_a/binary>>};
pack(cli, 19006,
     {V0_id, V0_platform, V0_zone_id, V0_name}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19006:16/little,
       D_a_t_a/binary>>};
pack(srv, 19006, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19006:16/little,
       D_a_t_a/binary>>};
pack(cli, 19007,
     {V0_id, V0_platform, V0_zone_id, V0_content}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_content))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19007:16/little,
       D_a_t_a/binary>>};
pack(srv, 19007, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19007:16/little,
       D_a_t_a/binary>>};
pack(cli, 19008,
     {V0_id,
      V0_platform,
      V0_zone_id,
      V0_role_id,
      V0_role_platform,
      V0_role_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_role_id:32/little,
                (protocol:pack(string, V0_role_platform))/binary,
                V0_role_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19008:16/little,
       D_a_t_a/binary>>};
pack(srv, 19008, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19008:16/little,
       D_a_t_a/binary>>};
pack(cli, 19009, {}) ->
    {ok, <<2:32/little, 19009:16/little>>};
pack(srv, 19009,
     {#friend_group_role{inviteds = V0_inviteds,
                         applys = V0_applys}}) ->
    D_a_t_a = <<(length(V0_inviteds)):16/little,
                (list_to_binary([<<V1_role_rid:32/little,
                                   (protocol:pack(string,
                                                  V1_role_platform))/binary,
                                   V1_role_zone_id:32/little,
                                   V1_group_rid:32/little,
                                   (protocol:pack(string,
                                                  V1_group_platform))/binary,
                                   V1_group_zone_id:16/little,
                                   (protocol:pack(string,
                                                  V1_group_name))/binary,
                                   (protocol:pack(string, V1_role_name))/binary,
                                   V1_time:32/little, V1_role_classes:8/little,
                                   V1_role_sex:8/little, V1_role_lev:16/little>>
                                 || {{{V1_role_rid,
                                       V1_role_platform,
                                       V1_role_zone_id},
                                      {V1_group_rid,
                                       V1_group_platform,
                                       V1_group_zone_id}},
                                     V1_group_name,
                                     V1_role_name,
                                     V1_time,
                                     V1_role_classes,
                                     V1_role_sex,
                                     V1_role_lev}
                                        <- V0_inviteds]))/binary,
                (length(V0_applys)):16/little,
                (list_to_binary([<<V1_role_rid:32/little,
                                   (protocol:pack(string,
                                                  V1_role_platform))/binary,
                                   V1_role_zone_id:32/little,
                                   V1_group_rid:32/little,
                                   (protocol:pack(string,
                                                  V1_group_platform))/binary,
                                   V1_group_zone_id:16/little,
                                   (protocol:pack(string,
                                                  V1_group_name))/binary,
                                   (protocol:pack(string, V1_role_name))/binary,
                                   V1_role_classes:8/little,
                                   V1_role_sex:8/little, V1_role_lev:16/little>>
                                 || {{{V1_role_rid,
                                       V1_role_platform,
                                       V1_role_zone_id},
                                      {V1_group_rid,
                                       V1_group_platform,
                                       V1_group_zone_id}},
                                     V1_group_name,
                                     V1_role_name,
                                     V1_role_classes,
                                     V1_role_sex,
                                     V1_role_lev}
                                        <- V0_applys]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19009:16/little,
       D_a_t_a/binary>>};
pack(cli, 19010,
     {V0_id,
      V0_platform,
      V0_zone_id,
      V0_role_rid,
      V0_role_platform,
      V0_role_zone_id,
      V0_flag}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_role_rid:32/little,
                (protocol:pack(string, V0_role_platform))/binary,
                V0_role_zone_id:32/little, V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19010:16/little,
       D_a_t_a/binary>>};
pack(srv, 19010, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19010:16/little,
       D_a_t_a/binary>>};
pack(cli, 19011,
     {V0_id, V0_platform, V0_zone_id, V0_flag}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19011:16/little,
       D_a_t_a/binary>>};
pack(srv, 19011, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19011:16/little,
       D_a_t_a/binary>>};
pack(cli, 19012, {}) ->
    {ok, <<2:32/little, 19012:16/little>>};
pack(srv, 19012,
     {V0_name,
      {V0_group_rid, V0_group_platform, V0_group_zone_id},
      V0_group_name}) ->
    D_a_t_a = <<(protocol:pack(string, V0_name))/binary,
                V0_group_rid:32/little,
                (protocol:pack(string, V0_group_platform))/binary,
                V0_group_zone_id:16/little,
                (protocol:pack(string, V0_group_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19012:16/little,
       D_a_t_a/binary>>};
pack(cli, 19013,
     {V0_id, V0_platform, V0_zone_id, V0_flag}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19013:16/little,
       D_a_t_a/binary>>};
pack(srv, 19013, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19013:16/little,
       D_a_t_a/binary>>};
pack(cli, 19014,
     {V0_id,
      V0_platform,
      V0_zone_id,
      V0_role_rid,
      V0_role_platform,
      V0_role_zone_id,
      V0_flag}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_role_rid:32/little,
                (protocol:pack(string, V0_role_platform))/binary,
                V0_role_zone_id:32/little, V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19014:16/little,
       D_a_t_a/binary>>};
pack(srv, 19014, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19014:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 19000, _B0) ->
    {V1_group_rid, _B1} = protocol:uint32(_B0),
    {V1_group_platform, _B2} = protocol:string(_B1),
    {V1_group_zone_id, _B3} = protocol:uint16(_B2),
    {ok,
     {V1_group_rid, V1_group_platform, V1_group_zone_id}};
unpack(cli, 19000, _B0) ->
    {V1_group_id, _B1} = protocol:uint32(_B0),
    {V1_group_platform, _B2} = protocol:string(_B1),
    {V1_group_zone_id, _B3} = protocol:uint16(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_content, _B5} = protocol:string(_B4),
    {V1_owner_rid, _B6} = protocol:uint32(_B5),
    {V1_owner_platform, _B7} = protocol:string(_B6),
    {V1_owner_zone_id, _B8} = protocol:uint16(_B7),
    {V1_owner_name, _B9} = protocol:string(_B8),
    {V1_owner_classes, _B10} = protocol:uint8(_B9),
    {V1_owner_lev, _B11} = protocol:uint16(_B10),
    {V1_owner_sex, _B12} = protocol:uint8(_B11),
    {V1_owner_fc, _B13} = protocol:uint32(_B12),
    {V1_members, _B27} = protocol:array(_B13,
                                        fun (_B14) ->
                                                {V2_role_rid, _B15} =
                                                    protocol:uint32(_B14),
                                                {V2_role_platform, _B16} =
                                                    protocol:string(_B15),
                                                {V2_role_zone_id, _B17} =
                                                    protocol:uint16(_B16),
                                                {V2_role_name, _B18} =
                                                    protocol:string(_B17),
                                                {V2_role_classes, _B19} =
                                                    protocol:uint8(_B18),
                                                {V2_role_lev, _B20} =
                                                    protocol:uint16(_B19),
                                                {V2_role_sex, _B21} =
                                                    protocol:uint8(_B20),
                                                {V2_online, _B22} =
                                                    protocol:uint8(_B21),
                                                {V2_online_time, _B23} =
                                                    protocol:uint32(_B22),
                                                {V2_post, _B24} =
                                                    protocol:uint16(_B23),
                                                {V2_notice, _B25} =
                                                    protocol:uint8(_B24),
                                                {{V2_role_rid,
                                                  V2_role_platform,
                                                  V2_role_zone_id,
                                                  V2_role_name,
                                                  V2_role_classes,
                                                  V2_role_lev,
                                                  V2_role_sex,
                                                  V2_online,
                                                  V2_online_time,
                                                  V2_post,
                                                  V2_notice},
                                                 _B25}
                                        end),
    {ok,
     {V1_group_id,
      V1_group_platform,
      V1_group_zone_id,
      V1_name,
      V1_content,
      V1_owner_rid,
      V1_owner_platform,
      V1_owner_zone_id,
      V1_owner_name,
      V1_owner_classes,
      V1_owner_lev,
      V1_owner_sex,
      V1_owner_fc,
      V1_members}};
unpack(srv, 19001, _B0) -> {ok, {}};
unpack(cli, 19001, _B0) ->
    {V1_groups, _B15} = protocol:array(_B0,
                                       fun (_B1) ->
                                               {V2_group_rid, _B2} =
                                                   protocol:uint32(_B1),
                                               {V2_group_platform, _B3} =
                                                   protocol:string(_B2),
                                               {V2_group_zone_id, _B4} =
                                                   protocol:uint16(_B3),
                                               {V2_group_name, _B5} =
                                                   protocol:string(_B4),
                                               {V2_group_content, _B6} =
                                                   protocol:string(_B5),
                                               {V2_role_rid, _B7} =
                                                   protocol:uint32(_B6),
                                               {V2_role_platform, _B8} =
                                                   protocol:string(_B7),
                                               {V2_role_zone_id, _B9} =
                                                   protocol:uint16(_B8),
                                               {V2_owner_name, _B10} =
                                                   protocol:string(_B9),
                                               {V2_owner_classes, _B11} =
                                                   protocol:uint8(_B10),
                                               {V2_owner_sex, _B12} =
                                                   protocol:uint8(_B11),
                                               {V2_time, _B13} =
                                                   protocol:uint32(_B12),
                                               {{V2_group_rid,
                                                 V2_group_platform,
                                                 V2_group_zone_id,
                                                 V2_group_name,
                                                 V2_group_content,
                                                 V2_role_rid,
                                                 V2_role_platform,
                                                 V2_role_zone_id,
                                                 V2_owner_name,
                                                 V2_owner_classes,
                                                 V2_owner_sex,
                                                 V2_time},
                                                _B13}
                                       end),
    {V1_create, _B16} = protocol:uint16(_B15),
    {V1_join, _B17} = protocol:uint16(_B16),
    {V1_unlock, _B18} = protocol:uint16(_B17),
    {V1_extra, _B19} = protocol:uint16(_B18),
    {ok,
     {V1_groups, V1_create, V1_join, V1_unlock, V1_extra}};
unpack(srv, 19002, _B0) ->
    {V1_name, _B1} = protocol:string(_B0),
    {ok, {V1_name}};
unpack(cli, 19002, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 19003, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_role_id, _B4} = protocol:uint32(_B3),
    {V1_role_platform, _B5} = protocol:string(_B4),
    {V1_role_zone_id, _B6} = protocol:uint32(_B5),
    {ok,
     {V1_id,
      V1_platform,
      V1_zone_id,
      V1_role_id,
      V1_role_platform,
      V1_role_zone_id}};
unpack(cli, 19003, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 19004, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 19004, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 19005, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 19005, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 19006, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {ok, {V1_id, V1_platform, V1_zone_id, V1_name}};
unpack(cli, 19006, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 19007, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_content, _B4} = protocol:string(_B3),
    {ok, {V1_id, V1_platform, V1_zone_id, V1_content}};
unpack(cli, 19007, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 19008, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_role_id, _B4} = protocol:uint32(_B3),
    {V1_role_platform, _B5} = protocol:string(_B4),
    {V1_role_zone_id, _B6} = protocol:uint32(_B5),
    {ok,
     {V1_id,
      V1_platform,
      V1_zone_id,
      V1_role_id,
      V1_role_platform,
      V1_role_zone_id}};
unpack(cli, 19008, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 19009, _B0) -> {ok, {}};
unpack(cli, 19009, _B0) ->
    {V1_inviteds, _B11} = protocol:array(_B0,
                                         fun (_B1) ->
                                                 {V2_role_id, _B2} =
                                                     protocol:tuple(_B1),
                                                 {V2_group_id, _B3} =
                                                     protocol:tuple(_B2),
                                                 {V2_group_name, _B4} =
                                                     protocol:string(_B3),
                                                 {V2_role_name, _B5} =
                                                     protocol:string(_B4),
                                                 {V2_time, _B6} =
                                                     protocol:uint32(_B5),
                                                 {V2_role_classes, _B7} =
                                                     protocol:uint8(_B6),
                                                 {V2_role_sex, _B8} =
                                                     protocol:uint8(_B7),
                                                 {V2_role_lev, _B9} =
                                                     protocol:uint16(_B8),
                                                 {{V2_role_id,
                                                   V2_group_id,
                                                   V2_group_name,
                                                   V2_role_name,
                                                   V2_time,
                                                   V2_role_classes,
                                                   V2_role_sex,
                                                   V2_role_lev},
                                                  _B9}
                                         end),
    {V1_applys, _B21} = protocol:array(_B11,
                                       fun (_B12) ->
                                               {V2_role_id, _B13} =
                                                   protocol:tuple(_B12),
                                               {V2_group_id, _B14} =
                                                   protocol:tuple(_B13),
                                               {V2_group_name, _B15} =
                                                   protocol:string(_B14),
                                               {V2_role_name, _B16} =
                                                   protocol:string(_B15),
                                               {V2_role_classes, _B17} =
                                                   protocol:uint8(_B16),
                                               {V2_role_sex, _B18} =
                                                   protocol:uint8(_B17),
                                               {V2_role_lev, _B19} =
                                                   protocol:uint16(_B18),
                                               {{V2_role_id,
                                                 V2_group_id,
                                                 V2_group_name,
                                                 V2_role_name,
                                                 V2_role_classes,
                                                 V2_role_sex,
                                                 V2_role_lev},
                                                _B19}
                                       end),
    {ok, {V1_inviteds, V1_applys}};
unpack(srv, 19010, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_role_rid, _B4} = protocol:uint32(_B3),
    {V1_role_platform, _B5} = protocol:string(_B4),
    {V1_role_zone_id, _B6} = protocol:uint32(_B5),
    {V1_flag, _B7} = protocol:uint8(_B6),
    {ok,
     {V1_id,
      V1_platform,
      V1_zone_id,
      V1_role_rid,
      V1_role_platform,
      V1_role_zone_id,
      V1_flag}};
unpack(cli, 19010, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 19011, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_flag, _B4} = protocol:uint8(_B3),
    {ok, {V1_id, V1_platform, V1_zone_id, V1_flag}};
unpack(cli, 19011, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 19012, _B0) -> {ok, {}};
unpack(cli, 19012, _B0) ->
    {V1_name, _B1} = protocol:string(_B0),
    {V1_group_rid, _B2} = protocol:uint32(_B1),
    {V1_group_platform, _B3} = protocol:string(_B2),
    {V1_group_zone_id, _B4} = protocol:uint16(_B3),
    {V1_group_name, _B5} = protocol:string(_B4),
    {ok,
     {V1_name,
      V1_group_rid,
      V1_group_platform,
      V1_group_zone_id,
      V1_group_name}};
unpack(srv, 19013, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_flag, _B4} = protocol:uint8(_B3),
    {ok, {V1_id, V1_platform, V1_zone_id, V1_flag}};
unpack(cli, 19013, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 19014, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_role_rid, _B4} = protocol:uint32(_B3),
    {V1_role_platform, _B5} = protocol:string(_B4),
    {V1_role_zone_id, _B6} = protocol:uint32(_B5),
    {V1_flag, _B7} = protocol:uint8(_B6),
    {ok,
     {V1_id,
      V1_platform,
      V1_zone_id,
      V1_role_rid,
      V1_role_platform,
      V1_role_zone_id,
      V1_flag}};
unpack(cli, 19014, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

