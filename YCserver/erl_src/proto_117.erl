-file("src/proto/proto_117.erl", 1).

-module(proto_117).

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

-file("src/proto/proto_117.erl", 14).

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

-file("src/proto/proto_117.erl", 15).

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

-file("src/proto/proto_117.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 11700, {}) ->
    {ok, <<2:32/little, 11700:16/little>>};
pack(srv, 11700,
     #team{type = V0_type, lev_flag = V0_lev_flag,
           team_formation = V0_team_formation,
           team_formation_lev = V0_team_formation_lev,
           status = V0_status, last_join_time = V0_last_join_time,
           combat_num = V0_combat_num, members = V0_members,
           order = V0_order}) ->
    D_a_t_a = <<V0_type:8/little, V0_lev_flag:8/little,
                V0_team_formation:8/little,
                V0_team_formation_lev:8/little, V0_status:8/little,
                V0_last_join_time:32/little, V0_combat_num:32/little,
                (length(V0_members)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:8/little, V1_face_id:32/little,
                                   V1_status:8/little,
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
                                   V1_join_type:8/little,
                                   V1_join_sub_type:8/little,
                                   V1_join_time:32/little,
                                   V1_combat_num:32/little>>
                                 || #team_mate{id =
                                                   {V1_rid,
                                                    V1_platform,
                                                    V1_zone_id},
                                               name = V1_name, sex = V1_sex,
                                               classes = V1_classes,
                                               lev = V1_lev,
                                               face_id = V1_face_id,
                                               status = V1_status,
                                               looks = V1_looks,
                                               join_type = V1_join_type,
                                               join_sub_type = V1_join_sub_type,
                                               join_time = V1_join_time,
                                               combat_num = V1_combat_num}
                                        <- V0_members]))/binary,
                (length(V0_order)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little>>
                                 || {V1_rid, V1_platform, V1_zone_id}
                                        <- V0_order]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11700:16/little,
       D_a_t_a/binary>>};
pack(cli, 11701, {}) ->
    {ok, <<2:32/little, 11701:16/little>>};
pack(srv, 11701, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11701:16/little,
       D_a_t_a/binary>>};
pack(cli, 11702, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11702:16/little,
       D_a_t_a/binary>>};
pack(srv, 11702, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11702:16/little,
       D_a_t_a/binary>>};
pack(cli, 11703,
     {V0_rid, V0_platform, V0_zone_id, V0_type}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_type:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11703:16/little,
       D_a_t_a/binary>>};
pack(srv, 11703, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11703:16/little,
       D_a_t_a/binary>>};
pack(cli, 11704, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11704:16/little,
       D_a_t_a/binary>>};
pack(srv, 11704, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11704:16/little,
       D_a_t_a/binary>>};
pack(cli, 11705, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11705:16/little,
       D_a_t_a/binary>>};
pack(srv, 11705, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11705:16/little,
       D_a_t_a/binary>>};
pack(cli, 11706, {}) ->
    {ok, <<2:32/little, 11706:16/little>>};
pack(srv, 11706, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11706:16/little,
       D_a_t_a/binary>>};
pack(cli, 11707, {}) ->
    {ok, <<2:32/little, 11707:16/little>>};
pack(srv, 11707, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11707:16/little,
       D_a_t_a/binary>>};
pack(cli, 11708, {}) ->
    {ok, <<2:32/little, 11708:16/little>>};
pack(srv, 11708, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11708:16/little,
       D_a_t_a/binary>>};
pack(cli, 11709, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11709:16/little,
       D_a_t_a/binary>>};
pack(srv, 11709, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11709:16/little,
       D_a_t_a/binary>>};
pack(cli, 11710, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11710:16/little,
       D_a_t_a/binary>>};
pack(srv, 11710, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11710:16/little,
       D_a_t_a/binary>>};
pack(cli, 11711, {V0_type, V0_lev_flag}) ->
    D_a_t_a = <<V0_type:8/little, V0_lev_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11711:16/little,
       D_a_t_a/binary>>};
pack(srv, 11711, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11711:16/little,
       D_a_t_a/binary>>};
pack(cli, 11712, {}) ->
    {ok, <<2:32/little, 11712:16/little>>};
pack(srv, 11712,
     {V0_matching_teams, V0_matching_roles}) ->
    D_a_t_a = <<V0_matching_teams:16/little,
                V0_matching_roles:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11712:16/little,
       D_a_t_a/binary>>};
pack(cli, 11713, {}) ->
    {ok, <<2:32/little, 11713:16/little>>};
pack(srv, 11713, {V0_inviting}) ->
    D_a_t_a = <<(length(V0_inviting)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:8/little, V1_type:8/little,
                                   V1_member_num:8/little,
                                   V1_inviter_status:8/little>>
                                 || #team_recruitment{id =
                                                          {V1_rid,
                                                           V1_platform,
                                                           V1_zone_id},
                                                      name = V1_name,
                                                      sex = V1_sex,
                                                      classes = V1_classes,
                                                      lev = V1_lev,
                                                      type = V1_type,
                                                      member_num =
                                                          V1_member_num,
                                                      inviter_status =
                                                          V1_inviter_status}
                                        <- V0_inviting]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11713:16/little,
       D_a_t_a/binary>>};
pack(cli, 11714, {V0_types}) ->
    D_a_t_a = <<(length(V0_types)):16/little,
                (list_to_binary([<<V1_type:8/little>>
                                 || V1_type <- V0_types]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11714:16/little,
       D_a_t_a/binary>>};
pack(srv, 11714,
     {V0_result, V0_types, V0_msg, V0_mtime}) ->
    D_a_t_a = <<V0_result:8/little,
                (length(V0_types)):16/little,
                (list_to_binary([<<V1_type:8/little>>
                                 || V1_type <- V0_types]))/binary,
                (protocol:pack(string, V0_msg))/binary,
                V0_mtime:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11714:16/little,
       D_a_t_a/binary>>};
pack(cli, 11715, {}) ->
    {ok, <<2:32/little, 11715:16/little>>};
pack(srv, 11715,
     {#team_recruitment{id =
                            {V0_rid, V0_platform, V0_zone_id},
                        name = V0_name, sex = V0_sex, classes = V0_classes,
                        lev = V0_lev, type = V0_type,
                        member_num = V0_member_num,
                        inviter_status = V0_inviter_status,
                        cross_type = V0_cross_type}}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_sex:8/little, V0_classes:8/little, V0_lev:8/little,
                V0_type:8/little, V0_member_num:8/little,
                V0_inviter_status:8/little, V0_cross_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11715:16/little,
       D_a_t_a/binary>>};
pack(cli, 11716, {}) ->
    {ok, <<2:32/little, 11716:16/little>>};
pack(srv, 11716, {V0_applys}) ->
    D_a_t_a = <<(length(V0_applys)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:8/little, V1_face_id:32/little,
                                   V1_status:8/little,
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
                                                           <- V1_looks]))/binary>>
                                 || #team_mate{id =
                                                   {V1_rid,
                                                    V1_platform,
                                                    V1_zone_id},
                                               name = V1_name, sex = V1_sex,
                                               classes = V1_classes,
                                               lev = V1_lev,
                                               face_id = V1_face_id,
                                               status = V1_status,
                                               looks = V1_looks}
                                        <- V0_applys]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11716:16/little,
       D_a_t_a/binary>>};
pack(cli, 11717, {}) ->
    {ok, <<2:32/little, 11717:16/little>>};
pack(srv, 11717,
     {#team_mate{id = {V0_rid, V0_platform, V0_zone_id},
                 name = V0_name, sex = V0_sex, classes = V0_classes,
                 lev = V0_lev, face_id = V0_face_id, status = V0_status,
                 looks = V0_looks}}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_name))/binary,
                V0_sex:8/little, V0_classes:8/little, V0_lev:8/little,
                V0_face_id:32/little, V0_status:8/little,
                (length(V0_looks)):16/little,
                (list_to_binary([<<V1_looks_type:32/little,
                                   V1_looks_mode:32/little,
                                   V1_looks_val:32/little,
                                   (protocol:pack(string,
                                                  V1_looks_str))/binary>>
                                 || {V1_looks_type,
                                     V1_looks_mode,
                                     V1_looks_val,
                                     V1_looks_str}
                                        <- V0_looks]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11717:16/little,
       D_a_t_a/binary>>};
pack(cli, 11718,
     {V0_rid, V0_platform, V0_zone_id, V0_type}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_type:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11718:16/little,
       D_a_t_a/binary>>};
pack(srv, 11718, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11718:16/little,
       D_a_t_a/binary>>};
pack(cli, 11719, {}) ->
    {ok, <<2:32/little, 11719:16/little>>};
pack(srv, 11719, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11719:16/little,
       D_a_t_a/binary>>};
pack(cli, 11720, {}) ->
    {ok, <<2:32/little, 11720:16/little>>};
pack(srv, 11720, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11720:16/little,
       D_a_t_a/binary>>};
pack(cli, 11721, {}) ->
    {ok, <<2:32/little, 11721:16/little>>};
pack(srv, 11721, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11721:16/little,
       D_a_t_a/binary>>};
pack(cli, 11722, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11722:16/little,
       D_a_t_a/binary>>};
pack(srv, 11722, {V0_result, V0_msg, V0_status}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_status:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11722:16/little,
       D_a_t_a/binary>>};
pack(cli, 11723, {}) ->
    {ok, <<2:32/little, 11723:16/little>>};
pack(srv, 11723, {V0_add, V0_update, V0_del}) ->
    D_a_t_a = <<(length(V0_add)):16/little,
                (list_to_binary([<<V1_id:8/little, V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_face_id:32/little, V1_lev:32/little,
                                   V1_lev_min:8/little, V1_lev_max:8/little,
                                   V1_team_type:8/little,
                                   V1_member_num:8/little, V1_matched:32/little,
                                   (length(V1_args)):16/little,
                                   (list_to_binary([<<V2_key:8/little,
                                                      V2_value:32/little>>
                                                    || {V2_key, V2_value}
                                                           <- V1_args]))/binary>>
                                 || {V1_id,
                                     V1_rid,
                                     V1_platform,
                                     V1_zone_id,
                                     V1_name,
                                     V1_face_id,
                                     V1_lev,
                                     V1_lev_min,
                                     V1_lev_max,
                                     V1_team_type,
                                     V1_member_num,
                                     V1_matched,
                                     V1_args}
                                        <- V0_add]))/binary,
                (length(V0_update)):16/little,
                (list_to_binary([<<V1_id:8/little, V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_face_id:32/little, V1_lev:32/little,
                                   V1_lev_min:8/little, V1_lev_max:8/little,
                                   V1_team_type:8/little,
                                   V1_member_num:8/little, V1_matched:32/little,
                                   (length(V1_args)):16/little,
                                   (list_to_binary([<<V2_key:8/little,
                                                      V2_value:32/little>>
                                                    || {V2_key, V2_value}
                                                           <- V1_args]))/binary>>
                                 || {V1_id,
                                     V1_rid,
                                     V1_platform,
                                     V1_zone_id,
                                     V1_name,
                                     V1_face_id,
                                     V1_lev,
                                     V1_lev_min,
                                     V1_lev_max,
                                     V1_team_type,
                                     V1_member_num,
                                     V1_matched,
                                     V1_args}
                                        <- V0_update]))/binary,
                (length(V0_del)):16/little,
                (list_to_binary([<<V1_id:8/little>>
                                 || V1_id <- V0_del]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11723:16/little,
       D_a_t_a/binary>>};
pack(cli, 11724, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11724:16/little,
       D_a_t_a/binary>>};
pack(srv, 11724, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11724:16/little,
       D_a_t_a/binary>>};
pack(cli, 11725, {}) ->
    {ok, <<2:32/little, 11725:16/little>>};
pack(srv, 11725,
     {V0_type,
      V0_lev_flag,
      V0_team_formation,
      V0_team_formation_lev,
      V0_status,
      V0_last_join_time,
      V0_combat_num}) ->
    D_a_t_a = <<V0_type:8/little, V0_lev_flag:8/little,
                V0_team_formation:8/little,
                V0_team_formation_lev:8/little, V0_status:8/little,
                V0_last_join_time:32/little, V0_combat_num:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11725:16/little,
       D_a_t_a/binary>>};
pack(cli, 11726, {}) ->
    {ok, <<2:32/little, 11726:16/little>>};
pack(srv, 11726, {V0_members, V0_order}) ->
    D_a_t_a = <<(length(V0_members)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:8/little, V1_face_id:32/little,
                                   V1_status:8/little,
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
                                   V1_join_type:8/little,
                                   V1_join_sub_type:8/little,
                                   V1_join_time:32/little,
                                   V1_combat_num:32/little>>
                                 || #team_mate{id =
                                                   {V1_rid,
                                                    V1_platform,
                                                    V1_zone_id},
                                               name = V1_name, sex = V1_sex,
                                               classes = V1_classes,
                                               lev = V1_lev,
                                               face_id = V1_face_id,
                                               status = V1_status,
                                               looks = V1_looks,
                                               join_type = V1_join_type,
                                               join_sub_type = V1_join_sub_type,
                                               join_time = V1_join_time,
                                               combat_num = V1_combat_num}
                                        <- V0_members]))/binary,
                (length(V0_order)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little>>
                                 || {V1_rid, V1_platform, V1_zone_id}
                                        <- V0_order]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11726:16/little,
       D_a_t_a/binary>>};
pack(cli, 11727, {}) ->
    {ok, <<2:32/little, 11727:16/little>>};
pack(srv, 11727, {V0_members, V0_order}) ->
    D_a_t_a = <<(length(V0_members)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little>>
                                 || {V1_rid, V1_platform, V1_zone_id}
                                        <- V0_members]))/binary,
                (length(V0_order)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little>>
                                 || {V1_rid, V1_platform, V1_zone_id}
                                        <- V0_order]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11727:16/little,
       D_a_t_a/binary>>};
pack(cli, 11728, {V0_type}) ->
    D_a_t_a = <<V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11728:16/little,
       D_a_t_a/binary>>};
pack(srv, 11728, {V0_recruitment_list}) ->
    D_a_t_a = <<(length(V0_recruitment_list)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:8/little, V1_type:8/little,
                                   V1_member_num:8/little>>
                                 || #team_recruitment{id =
                                                          {V1_rid,
                                                           V1_platform,
                                                           V1_zone_id},
                                                      name = V1_name,
                                                      sex = V1_sex,
                                                      classes = V1_classes,
                                                      lev = V1_lev,
                                                      type = V1_type,
                                                      member_num =
                                                          V1_member_num}
                                        <- V0_recruitment_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11728:16/little,
       D_a_t_a/binary>>};
pack(cli, 11729, {}) ->
    {ok, <<2:32/little, 11729:16/little>>};
pack(srv, 11729, {V0_members}) ->
    D_a_t_a = <<(length(V0_members)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   V1_combat_num:32/little>>
                                 || #team_mate{id =
                                                   {V1_rid,
                                                    V1_platform,
                                                    V1_zone_id},
                                               combat_num = V1_combat_num}
                                        <- V0_members]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11729:16/little,
       D_a_t_a/binary>>};
pack(cli, 11730, {}) ->
    {ok, <<2:32/little, 11730:16/little>>};
pack(srv, 11730, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11730:16/little,
       D_a_t_a/binary>>};
pack(cli, 11731, {V0_decision}) ->
    D_a_t_a = <<V0_decision:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11731:16/little,
       D_a_t_a/binary>>};
pack(srv, 11731, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11731:16/little,
       D_a_t_a/binary>>};
pack(cli, 11732, {}) ->
    {ok, <<2:32/little, 11732:16/little>>};
pack(srv, 11732,
     {#team_usurper{id = {V0_rid, V0_platform, V0_zone_id},
                    name = V0_name, sex = V0_sex, classes = V0_classes,
                    lev = V0_lev}}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_sex:8/little, V0_classes:8/little, V0_lev:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11732:16/little,
       D_a_t_a/binary>>};
pack(cli, 11733, {}) ->
    {ok, <<2:32/little, 11733:16/little>>};
pack(srv, 11733, {V0_add, V0_update, V0_del}) ->
    D_a_t_a = <<(length(V0_add)):16/little,
                (list_to_binary([<<V1_id:8/little, V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_face_id:32/little, V1_lev:32/little,
                                   V1_lev_min:8/little, V1_lev_max:8/little,
                                   V1_team_type:8/little,
                                   V1_member_num:8/little, V1_matched:32/little,
                                   (length(V1_args)):16/little,
                                   (list_to_binary([<<V2_key:8/little,
                                                      V2_value:32/little>>
                                                    || {V2_key, V2_value}
                                                           <- V1_args]))/binary>>
                                 || {V1_id,
                                     V1_rid,
                                     V1_platform,
                                     V1_zone_id,
                                     V1_name,
                                     V1_sex,
                                     V1_classes,
                                     V1_face_id,
                                     V1_lev,
                                     V1_lev_min,
                                     V1_lev_max,
                                     V1_team_type,
                                     V1_member_num,
                                     V1_matched,
                                     V1_args}
                                        <- V0_add]))/binary,
                (length(V0_update)):16/little,
                (list_to_binary([<<V1_id:8/little, V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_face_id:32/little, V1_lev:32/little,
                                   V1_lev_min:8/little, V1_lev_max:8/little,
                                   V1_team_type:8/little,
                                   V1_member_num:8/little, V1_matched:32/little,
                                   (length(V1_args)):16/little,
                                   (list_to_binary([<<V2_key:8/little,
                                                      V2_value:32/little>>
                                                    || {V2_key, V2_value}
                                                           <- V1_args]))/binary>>
                                 || {V1_id,
                                     V1_rid,
                                     V1_platform,
                                     V1_zone_id,
                                     V1_name,
                                     V1_sex,
                                     V1_classes,
                                     V1_face_id,
                                     V1_lev,
                                     V1_lev_min,
                                     V1_lev_max,
                                     V1_team_type,
                                     V1_member_num,
                                     V1_matched,
                                     V1_args}
                                        <- V0_update]))/binary,
                (length(V0_del)):16/little,
                (list_to_binary([<<V1_id:8/little>>
                                 || V1_id <- V0_del]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11733:16/little,
       D_a_t_a/binary>>};
pack(cli, 11734, {V0_team_id}) ->
    D_a_t_a = <<V0_team_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11734:16/little,
       D_a_t_a/binary>>};
pack(srv, 11734, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11734:16/little,
       D_a_t_a/binary>>};
pack(cli, 11735, {}) ->
    {ok, <<2:32/little, 11735:16/little>>};
pack(srv, 11735, {V0_team_mark}) ->
    D_a_t_a = <<V0_team_mark:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11735:16/little,
       D_a_t_a/binary>>};
pack(cli, 11736, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11736:16/little,
       D_a_t_a/binary>>};
pack(srv, 11736, {V0_members}) ->
    D_a_t_a = <<(length(V0_members)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:8/little, V1_face_id:32/little,
                                   V1_status:8/little,
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
                                   V1_join_type:8/little,
                                   V1_join_sub_type:8/little,
                                   V1_join_time:32/little,
                                   V1_combat_num:32/little>>
                                 || #team_mate{id =
                                                   {V1_rid,
                                                    V1_platform,
                                                    V1_zone_id},
                                               name = V1_name, sex = V1_sex,
                                               classes = V1_classes,
                                               lev = V1_lev,
                                               face_id = V1_face_id,
                                               status = V1_status,
                                               looks = V1_looks,
                                               join_type = V1_join_type,
                                               join_sub_type = V1_join_sub_type,
                                               join_time = V1_join_time,
                                               combat_num = V1_combat_num}
                                        <- V0_members]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11736:16/little,
       D_a_t_a/binary>>};
pack(cli, 11737, {V0_flag}) ->
    D_a_t_a = <<V0_flag:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11737:16/little,
       D_a_t_a/binary>>};
pack(srv, 11737, {V0_flag}) ->
    D_a_t_a = <<V0_flag:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11737:16/little,
       D_a_t_a/binary>>};
pack(cli, 11738, {}) ->
    {ok, <<2:32/little, 11738:16/little>>};
pack(srv, 11738,
     {{V0_rid, V0_platform, V0_zone_id},
      V0_name,
      V0_lev,
      V0_cross_type}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_lev:8/little, V0_cross_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11738:16/little,
       D_a_t_a/binary>>};
pack(cli, 11739, {}) ->
    {ok, <<2:32/little, 11739:16/little>>};
pack(srv, 11739, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11739:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 11700, _B0) -> {ok, {}};
unpack(cli, 11700, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_lev_flag, _B2} = protocol:uint8(_B1),
    {V1_team_formation, _B3} = protocol:uint8(_B2),
    {V1_team_formation_lev, _B4} = protocol:uint8(_B3),
    {V1_status, _B5} = protocol:uint8(_B4),
    {V1_last_join_time, _B6} = protocol:uint32(_B5),
    {V1_combat_num, _B7} = protocol:uint32(_B6),
    {V1_members, _B30} = protocol:array(_B7,
                                        fun (_B8) ->
                                                {V2_rid, _B9} =
                                                    protocol:uint32(_B8),
                                                {V2_platform, _B10} =
                                                    protocol:string(_B9),
                                                {V2_zone_id, _B11} =
                                                    protocol:uint32(_B10),
                                                {V2_name, _B12} =
                                                    protocol:string(_B11),
                                                {V2_sex, _B13} =
                                                    protocol:uint8(_B12),
                                                {V2_classes, _B14} =
                                                    protocol:uint8(_B13),
                                                {V2_lev, _B15} =
                                                    protocol:uint8(_B14),
                                                {V2_face_id, _B16} =
                                                    protocol:uint32(_B15),
                                                {V2_status, _B17} =
                                                    protocol:uint8(_B16),
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
                                                {V2_join_type, _B25} =
                                                    protocol:uint8(_B24),
                                                {V2_join_sub_type, _B26} =
                                                    protocol:uint8(_B25),
                                                {V2_join_time, _B27} =
                                                    protocol:uint32(_B26),
                                                {V2_combat_num, _B28} =
                                                    protocol:uint32(_B27),
                                                {{V2_rid,
                                                  V2_platform,
                                                  V2_zone_id,
                                                  V2_name,
                                                  V2_sex,
                                                  V2_classes,
                                                  V2_lev,
                                                  V2_face_id,
                                                  V2_status,
                                                  V2_looks,
                                                  V2_join_type,
                                                  V2_join_sub_type,
                                                  V2_join_time,
                                                  V2_combat_num},
                                                 _B28}
                                        end),
    {V1_order, _B36} = protocol:array(_B30,
                                      fun (_B31) ->
                                              {V2_rid, _B32} =
                                                  protocol:uint32(_B31),
                                              {V2_platform, _B33} =
                                                  protocol:string(_B32),
                                              {V2_zone_id, _B34} =
                                                  protocol:uint32(_B33),
                                              {{V2_rid,
                                                V2_platform,
                                                V2_zone_id},
                                               _B34}
                                      end),
    {ok,
     {V1_type,
      V1_lev_flag,
      V1_team_formation,
      V1_team_formation_lev,
      V1_status,
      V1_last_join_time,
      V1_combat_num,
      V1_members,
      V1_order}};
unpack(srv, 11701, _B0) -> {ok, {}};
unpack(cli, 11701, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11702, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 11702, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11703, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_type, _B4} = protocol:uint16(_B3),
    {ok, {V1_rid, V1_platform, V1_zone_id, V1_type}};
unpack(cli, 11703, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11704, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 11704, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11705, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 11705, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11706, _B0) -> {ok, {}};
unpack(cli, 11706, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11707, _B0) -> {ok, {}};
unpack(cli, 11707, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11708, _B0) -> {ok, {}};
unpack(cli, 11708, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11709, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 11709, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11710, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 11710, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11711, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_lev_flag, _B2} = protocol:uint8(_B1),
    {ok, {V1_type, V1_lev_flag}};
unpack(cli, 11711, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11712, _B0) -> {ok, {}};
unpack(cli, 11712, _B0) ->
    {V1_matching_teams, _B1} = protocol:uint16(_B0),
    {V1_matching_roles, _B2} = protocol:uint16(_B1),
    {ok, {V1_matching_teams, V1_matching_roles}};
unpack(srv, 11713, _B0) -> {ok, {}};
unpack(cli, 11713, _B0) ->
    {V1_inviting, _B13} = protocol:array(_B0,
                                         fun (_B1) ->
                                                 {V2_rid, _B2} =
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
                                                 {V2_type, _B9} =
                                                     protocol:uint8(_B8),
                                                 {V2_member_num, _B10} =
                                                     protocol:uint8(_B9),
                                                 {V2_inviter_status, _B11} =
                                                     protocol:uint8(_B10),
                                                 {{V2_rid,
                                                   V2_platform,
                                                   V2_zone_id,
                                                   V2_name,
                                                   V2_sex,
                                                   V2_classes,
                                                   V2_lev,
                                                   V2_type,
                                                   V2_member_num,
                                                   V2_inviter_status},
                                                  _B11}
                                         end),
    {ok, {V1_inviting}};
unpack(srv, 11714, _B0) ->
    {V1_types, _B4} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_type, _B2} =
                                                 protocol:uint8(_B1),
                                             {{V2_type}, _B2}
                                     end),
    {ok, {V1_types}};
unpack(cli, 11714, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_types, _B5} = protocol:array(_B1,
                                     fun (_B2) ->
                                             {V2_type, _B3} =
                                                 protocol:uint8(_B2),
                                             {{V2_type}, _B3}
                                     end),
    {V1_msg, _B6} = protocol:string(_B5),
    {V1_mtime, _B7} = protocol:uint32(_B6),
    {ok, {V1_result, V1_types, V1_msg, V1_mtime}};
unpack(srv, 11715, _B0) -> {ok, {}};
unpack(cli, 11715, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_sex, _B5} = protocol:uint8(_B4),
    {V1_classes, _B6} = protocol:uint8(_B5),
    {V1_lev, _B7} = protocol:uint8(_B6),
    {V1_type, _B8} = protocol:uint8(_B7),
    {V1_member_num, _B9} = protocol:uint8(_B8),
    {V1_inviter_status, _B10} = protocol:uint8(_B9),
    {V1_cross_type, _B11} = protocol:uint8(_B10),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_sex,
      V1_classes,
      V1_lev,
      V1_type,
      V1_member_num,
      V1_inviter_status,
      V1_cross_type}};
unpack(srv, 11716, _B0) -> {ok, {}};
unpack(cli, 11716, _B0) ->
    {V1_applys, _B19} = protocol:array(_B0,
                                       fun (_B1) ->
                                               {V2_rid, _B2} =
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
                                               {V2_face_id, _B9} =
                                                   protocol:uint32(_B8),
                                               {V2_status, _B10} =
                                                   protocol:uint8(_B9),
                                               {V2_looks, _B17} =
                                                   protocol:array(_B10,
                                                                  fun (_B11) ->
                                                                          {V3_looks_type,
                                                                           _B12} =
                                                                              protocol:uint32(_B11),
                                                                          {V3_looks_mode,
                                                                           _B13} =
                                                                              protocol:uint32(_B12),
                                                                          {V3_looks_val,
                                                                           _B14} =
                                                                              protocol:uint32(_B13),
                                                                          {V3_looks_str,
                                                                           _B15} =
                                                                              protocol:string(_B14),
                                                                          {{V3_looks_type,
                                                                            V3_looks_mode,
                                                                            V3_looks_val,
                                                                            V3_looks_str},
                                                                           _B15}
                                                                  end),
                                               {{V2_rid,
                                                 V2_platform,
                                                 V2_zone_id,
                                                 V2_name,
                                                 V2_sex,
                                                 V2_classes,
                                                 V2_lev,
                                                 V2_face_id,
                                                 V2_status,
                                                 V2_looks},
                                                _B17}
                                       end),
    {ok, {V1_applys}};
unpack(srv, 11717, _B0) -> {ok, {}};
unpack(cli, 11717, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_sex, _B5} = protocol:uint8(_B4),
    {V1_classes, _B6} = protocol:uint8(_B5),
    {V1_lev, _B7} = protocol:uint8(_B6),
    {V1_face_id, _B8} = protocol:uint32(_B7),
    {V1_status, _B9} = protocol:uint8(_B8),
    {V1_looks, _B16} = protocol:array(_B9,
                                      fun (_B10) ->
                                              {V2_looks_type, _B11} =
                                                  protocol:uint32(_B10),
                                              {V2_looks_mode, _B12} =
                                                  protocol:uint32(_B11),
                                              {V2_looks_val, _B13} =
                                                  protocol:uint32(_B12),
                                              {V2_looks_str, _B14} =
                                                  protocol:string(_B13),
                                              {{V2_looks_type,
                                                V2_looks_mode,
                                                V2_looks_val,
                                                V2_looks_str},
                                               _B14}
                                      end),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_sex,
      V1_classes,
      V1_lev,
      V1_face_id,
      V1_status,
      V1_looks}};
unpack(srv, 11718, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_type, _B4} = protocol:uint16(_B3),
    {ok, {V1_rid, V1_platform, V1_zone_id, V1_type}};
unpack(cli, 11718, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11719, _B0) -> {ok, {}};
unpack(cli, 11719, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11720, _B0) -> {ok, {}};
unpack(cli, 11720, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11721, _B0) -> {ok, {}};
unpack(cli, 11721, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11722, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 11722, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_status, _B3} = protocol:uint8(_B2),
    {ok, {V1_result, V1_msg, V1_status}};
unpack(srv, 11723, _B0) -> {ok, {}};
unpack(cli, 11723, _B0) ->
    {V1_add, _B20} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_id, _B2} = protocol:uint8(_B1),
                                            {V2_rid, _B3} =
                                                protocol:uint32(_B2),
                                            {V2_platform, _B4} =
                                                protocol:string(_B3),
                                            {V2_zone_id, _B5} =
                                                protocol:uint32(_B4),
                                            {V2_name, _B6} =
                                                protocol:string(_B5),
                                            {V2_face_id, _B7} =
                                                protocol:uint32(_B6),
                                            {V2_lev, _B8} =
                                                protocol:uint32(_B7),
                                            {V2_lev_min, _B9} =
                                                protocol:uint8(_B8),
                                            {V2_lev_max, _B10} =
                                                protocol:uint8(_B9),
                                            {V2_team_type, _B11} =
                                                protocol:uint8(_B10),
                                            {V2_member_num, _B12} =
                                                protocol:uint8(_B11),
                                            {V2_matched, _B13} =
                                                protocol:uint32(_B12),
                                            {V2_args, _B18} =
                                                protocol:array(_B13,
                                                               fun (_B14) ->
                                                                       {V3_key,
                                                                        _B15} =
                                                                           protocol:uint8(_B14),
                                                                       {V3_value,
                                                                        _B16} =
                                                                           protocol:uint32(_B15),
                                                                       {{V3_key,
                                                                         V3_value},
                                                                        _B16}
                                                               end),
                                            {{V2_id,
                                              V2_rid,
                                              V2_platform,
                                              V2_zone_id,
                                              V2_name,
                                              V2_face_id,
                                              V2_lev,
                                              V2_lev_min,
                                              V2_lev_max,
                                              V2_team_type,
                                              V2_member_num,
                                              V2_matched,
                                              V2_args},
                                             _B18}
                                    end),
    {V1_update, _B40} = protocol:array(_B20,
                                       fun (_B21) ->
                                               {V2_id, _B22} =
                                                   protocol:uint8(_B21),
                                               {V2_rid, _B23} =
                                                   protocol:uint32(_B22),
                                               {V2_platform, _B24} =
                                                   protocol:string(_B23),
                                               {V2_zone_id, _B25} =
                                                   protocol:uint32(_B24),
                                               {V2_name, _B26} =
                                                   protocol:string(_B25),
                                               {V2_face_id, _B27} =
                                                   protocol:uint32(_B26),
                                               {V2_lev, _B28} =
                                                   protocol:uint32(_B27),
                                               {V2_lev_min, _B29} =
                                                   protocol:uint8(_B28),
                                               {V2_lev_max, _B30} =
                                                   protocol:uint8(_B29),
                                               {V2_team_type, _B31} =
                                                   protocol:uint8(_B30),
                                               {V2_member_num, _B32} =
                                                   protocol:uint8(_B31),
                                               {V2_matched, _B33} =
                                                   protocol:uint32(_B32),
                                               {V2_args, _B38} =
                                                   protocol:array(_B33,
                                                                  fun (_B34) ->
                                                                          {V3_key,
                                                                           _B35} =
                                                                              protocol:uint8(_B34),
                                                                          {V3_value,
                                                                           _B36} =
                                                                              protocol:uint32(_B35),
                                                                          {{V3_key,
                                                                            V3_value},
                                                                           _B36}
                                                                  end),
                                               {{V2_id,
                                                 V2_rid,
                                                 V2_platform,
                                                 V2_zone_id,
                                                 V2_name,
                                                 V2_face_id,
                                                 V2_lev,
                                                 V2_lev_min,
                                                 V2_lev_max,
                                                 V2_team_type,
                                                 V2_member_num,
                                                 V2_matched,
                                                 V2_args},
                                                _B38}
                                       end),
    {V1_del, _B44} = protocol:array(_B40,
                                    fun (_B41) ->
                                            {V2_id, _B42} =
                                                protocol:uint8(_B41),
                                            {{V2_id}, _B42}
                                    end),
    {ok, {V1_add, V1_update, V1_del}};
unpack(srv, 11724, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 11724, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11725, _B0) -> {ok, {}};
unpack(cli, 11725, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_lev_flag, _B2} = protocol:uint8(_B1),
    {V1_team_formation, _B3} = protocol:uint8(_B2),
    {V1_team_formation_lev, _B4} = protocol:uint8(_B3),
    {V1_status, _B5} = protocol:uint8(_B4),
    {V1_last_join_time, _B6} = protocol:uint32(_B5),
    {V1_combat_num, _B7} = protocol:uint32(_B6),
    {ok,
     {V1_type,
      V1_lev_flag,
      V1_team_formation,
      V1_team_formation_lev,
      V1_status,
      V1_last_join_time,
      V1_combat_num}};
unpack(srv, 11726, _B0) -> {ok, {}};
unpack(cli, 11726, _B0) ->
    {V1_members, _B23} = protocol:array(_B0,
                                        fun (_B1) ->
                                                {V2_rid, _B2} =
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
                                                {V2_face_id, _B9} =
                                                    protocol:uint32(_B8),
                                                {V2_status, _B10} =
                                                    protocol:uint8(_B9),
                                                {V2_looks, _B17} =
                                                    protocol:array(_B10,
                                                                   fun (_B11) ->
                                                                           {V3_looks_type,
                                                                            _B12} =
                                                                               protocol:uint32(_B11),
                                                                           {V3_looks_mode,
                                                                            _B13} =
                                                                               protocol:uint32(_B12),
                                                                           {V3_looks_val,
                                                                            _B14} =
                                                                               protocol:uint32(_B13),
                                                                           {V3_looks_str,
                                                                            _B15} =
                                                                               protocol:string(_B14),
                                                                           {{V3_looks_type,
                                                                             V3_looks_mode,
                                                                             V3_looks_val,
                                                                             V3_looks_str},
                                                                            _B15}
                                                                   end),
                                                {V2_join_type, _B18} =
                                                    protocol:uint8(_B17),
                                                {V2_join_sub_type, _B19} =
                                                    protocol:uint8(_B18),
                                                {V2_join_time, _B20} =
                                                    protocol:uint32(_B19),
                                                {V2_combat_num, _B21} =
                                                    protocol:uint32(_B20),
                                                {{V2_rid,
                                                  V2_platform,
                                                  V2_zone_id,
                                                  V2_name,
                                                  V2_sex,
                                                  V2_classes,
                                                  V2_lev,
                                                  V2_face_id,
                                                  V2_status,
                                                  V2_looks,
                                                  V2_join_type,
                                                  V2_join_sub_type,
                                                  V2_join_time,
                                                  V2_combat_num},
                                                 _B21}
                                        end),
    {V1_order, _B29} = protocol:array(_B23,
                                      fun (_B24) ->
                                              {V2_rid, _B25} =
                                                  protocol:uint32(_B24),
                                              {V2_platform, _B26} =
                                                  protocol:string(_B25),
                                              {V2_zone_id, _B27} =
                                                  protocol:uint16(_B26),
                                              {{V2_rid,
                                                V2_platform,
                                                V2_zone_id},
                                               _B27}
                                      end),
    {ok, {V1_members, V1_order}};
unpack(srv, 11727, _B0) -> {ok, {}};
unpack(cli, 11727, _B0) ->
    {V1_members, _B6} = protocol:array(_B0,
                                       fun (_B1) ->
                                               {V2_rid, _B2} =
                                                   protocol:uint32(_B1),
                                               {V2_platform, _B3} =
                                                   protocol:string(_B2),
                                               {V2_zone_id, _B4} =
                                                   protocol:uint16(_B3),
                                               {{V2_rid,
                                                 V2_platform,
                                                 V2_zone_id},
                                                _B4}
                                       end),
    {V1_order, _B12} = protocol:array(_B6,
                                      fun (_B7) ->
                                              {V2_rid, _B8} =
                                                  protocol:uint32(_B7),
                                              {V2_platform, _B9} =
                                                  protocol:string(_B8),
                                              {V2_zone_id, _B10} =
                                                  protocol:uint16(_B9),
                                              {{V2_rid,
                                                V2_platform,
                                                V2_zone_id},
                                               _B10}
                                      end),
    {ok, {V1_members, V1_order}};
unpack(srv, 11728, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_type}};
unpack(cli, 11728, _B0) ->
    {V1_recruitment_list, _B12} = protocol:array(_B0,
                                                 fun (_B1) ->
                                                         {V2_rid, _B2} =
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
                                                         {V2_type, _B9} =
                                                             protocol:uint8(_B8),
                                                         {V2_member_num, _B10} =
                                                             protocol:uint8(_B9),
                                                         {{V2_rid,
                                                           V2_platform,
                                                           V2_zone_id,
                                                           V2_name,
                                                           V2_sex,
                                                           V2_classes,
                                                           V2_lev,
                                                           V2_type,
                                                           V2_member_num},
                                                          _B10}
                                                 end),
    {ok, {V1_recruitment_list}};
unpack(srv, 11729, _B0) -> {ok, {}};
unpack(cli, 11729, _B0) ->
    {V1_members, _B7} = protocol:array(_B0,
                                       fun (_B1) ->
                                               {V2_rid, _B2} =
                                                   protocol:uint32(_B1),
                                               {V2_platform, _B3} =
                                                   protocol:string(_B2),
                                               {V2_zone_id, _B4} =
                                                   protocol:uint16(_B3),
                                               {V2_combat_num, _B5} =
                                                   protocol:uint32(_B4),
                                               {{V2_rid,
                                                 V2_platform,
                                                 V2_zone_id,
                                                 V2_combat_num},
                                                _B5}
                                       end),
    {ok, {V1_members}};
unpack(srv, 11730, _B0) -> {ok, {}};
unpack(cli, 11730, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11731, _B0) ->
    {V1_decision, _B1} = protocol:uint8(_B0),
    {ok, {V1_decision}};
unpack(cli, 11731, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11732, _B0) -> {ok, {}};
unpack(cli, 11732, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_sex, _B5} = protocol:uint8(_B4),
    {V1_classes, _B6} = protocol:uint8(_B5),
    {V1_lev, _B7} = protocol:uint8(_B6),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_sex,
      V1_classes,
      V1_lev}};
unpack(srv, 11733, _B0) -> {ok, {}};
unpack(cli, 11733, _B0) ->
    {V1_add, _B22} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_id, _B2} = protocol:uint8(_B1),
                                            {V2_rid, _B3} =
                                                protocol:uint32(_B2),
                                            {V2_platform, _B4} =
                                                protocol:string(_B3),
                                            {V2_zone_id, _B5} =
                                                protocol:uint32(_B4),
                                            {V2_name, _B6} =
                                                protocol:string(_B5),
                                            {V2_sex, _B7} = protocol:uint8(_B6),
                                            {V2_classes, _B8} =
                                                protocol:uint8(_B7),
                                            {V2_face_id, _B9} =
                                                protocol:uint32(_B8),
                                            {V2_lev, _B10} =
                                                protocol:uint32(_B9),
                                            {V2_lev_min, _B11} =
                                                protocol:uint8(_B10),
                                            {V2_lev_max, _B12} =
                                                protocol:uint8(_B11),
                                            {V2_team_type, _B13} =
                                                protocol:uint8(_B12),
                                            {V2_member_num, _B14} =
                                                protocol:uint8(_B13),
                                            {V2_matched, _B15} =
                                                protocol:uint32(_B14),
                                            {V2_args, _B20} =
                                                protocol:array(_B15,
                                                               fun (_B16) ->
                                                                       {V3_key,
                                                                        _B17} =
                                                                           protocol:uint8(_B16),
                                                                       {V3_value,
                                                                        _B18} =
                                                                           protocol:uint32(_B17),
                                                                       {{V3_key,
                                                                         V3_value},
                                                                        _B18}
                                                               end),
                                            {{V2_id,
                                              V2_rid,
                                              V2_platform,
                                              V2_zone_id,
                                              V2_name,
                                              V2_sex,
                                              V2_classes,
                                              V2_face_id,
                                              V2_lev,
                                              V2_lev_min,
                                              V2_lev_max,
                                              V2_team_type,
                                              V2_member_num,
                                              V2_matched,
                                              V2_args},
                                             _B20}
                                    end),
    {V1_update, _B44} = protocol:array(_B22,
                                       fun (_B23) ->
                                               {V2_id, _B24} =
                                                   protocol:uint8(_B23),
                                               {V2_rid, _B25} =
                                                   protocol:uint32(_B24),
                                               {V2_platform, _B26} =
                                                   protocol:string(_B25),
                                               {V2_zone_id, _B27} =
                                                   protocol:uint32(_B26),
                                               {V2_name, _B28} =
                                                   protocol:string(_B27),
                                               {V2_sex, _B29} =
                                                   protocol:uint8(_B28),
                                               {V2_classes, _B30} =
                                                   protocol:uint8(_B29),
                                               {V2_face_id, _B31} =
                                                   protocol:uint32(_B30),
                                               {V2_lev, _B32} =
                                                   protocol:uint32(_B31),
                                               {V2_lev_min, _B33} =
                                                   protocol:uint8(_B32),
                                               {V2_lev_max, _B34} =
                                                   protocol:uint8(_B33),
                                               {V2_team_type, _B35} =
                                                   protocol:uint8(_B34),
                                               {V2_member_num, _B36} =
                                                   protocol:uint8(_B35),
                                               {V2_matched, _B37} =
                                                   protocol:uint32(_B36),
                                               {V2_args, _B42} =
                                                   protocol:array(_B37,
                                                                  fun (_B38) ->
                                                                          {V3_key,
                                                                           _B39} =
                                                                              protocol:uint8(_B38),
                                                                          {V3_value,
                                                                           _B40} =
                                                                              protocol:uint32(_B39),
                                                                          {{V3_key,
                                                                            V3_value},
                                                                           _B40}
                                                                  end),
                                               {{V2_id,
                                                 V2_rid,
                                                 V2_platform,
                                                 V2_zone_id,
                                                 V2_name,
                                                 V2_sex,
                                                 V2_classes,
                                                 V2_face_id,
                                                 V2_lev,
                                                 V2_lev_min,
                                                 V2_lev_max,
                                                 V2_team_type,
                                                 V2_member_num,
                                                 V2_matched,
                                                 V2_args},
                                                _B42}
                                       end),
    {V1_del, _B48} = protocol:array(_B44,
                                    fun (_B45) ->
                                            {V2_id, _B46} =
                                                protocol:uint8(_B45),
                                            {{V2_id}, _B46}
                                    end),
    {ok, {V1_add, V1_update, V1_del}};
unpack(srv, 11734, _B0) ->
    {V1_team_id, _B1} = protocol:uint16(_B0),
    {ok, {V1_team_id}};
unpack(cli, 11734, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11735, _B0) -> {ok, {}};
unpack(cli, 11735, _B0) ->
    {V1_team_mark, _B1} = protocol:uint16(_B0),
    {ok, {V1_team_mark}};
unpack(srv, 11736, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 11736, _B0) ->
    {V1_members, _B23} = protocol:array(_B0,
                                        fun (_B1) ->
                                                {V2_rid, _B2} =
                                                    protocol:uint32(_B1),
                                                {V2_platform, _B3} =
                                                    protocol:string(_B2),
                                                {V2_zone_id, _B4} =
                                                    protocol:uint32(_B3),
                                                {V2_name, _B5} =
                                                    protocol:string(_B4),
                                                {V2_sex, _B6} =
                                                    protocol:uint8(_B5),
                                                {V2_classes, _B7} =
                                                    protocol:uint8(_B6),
                                                {V2_lev, _B8} =
                                                    protocol:uint8(_B7),
                                                {V2_face_id, _B9} =
                                                    protocol:uint32(_B8),
                                                {V2_status, _B10} =
                                                    protocol:uint8(_B9),
                                                {V2_looks, _B17} =
                                                    protocol:array(_B10,
                                                                   fun (_B11) ->
                                                                           {V3_looks_type,
                                                                            _B12} =
                                                                               protocol:uint32(_B11),
                                                                           {V3_looks_mode,
                                                                            _B13} =
                                                                               protocol:uint32(_B12),
                                                                           {V3_looks_val,
                                                                            _B14} =
                                                                               protocol:uint32(_B13),
                                                                           {V3_looks_str,
                                                                            _B15} =
                                                                               protocol:string(_B14),
                                                                           {{V3_looks_type,
                                                                             V3_looks_mode,
                                                                             V3_looks_val,
                                                                             V3_looks_str},
                                                                            _B15}
                                                                   end),
                                                {V2_join_type, _B18} =
                                                    protocol:uint8(_B17),
                                                {V2_join_sub_type, _B19} =
                                                    protocol:uint8(_B18),
                                                {V2_join_time, _B20} =
                                                    protocol:uint32(_B19),
                                                {V2_combat_num, _B21} =
                                                    protocol:uint32(_B20),
                                                {{V2_rid,
                                                  V2_platform,
                                                  V2_zone_id,
                                                  V2_name,
                                                  V2_sex,
                                                  V2_classes,
                                                  V2_lev,
                                                  V2_face_id,
                                                  V2_status,
                                                  V2_looks,
                                                  V2_join_type,
                                                  V2_join_sub_type,
                                                  V2_join_time,
                                                  V2_combat_num},
                                                 _B21}
                                        end),
    {ok, {V1_members}};
unpack(srv, 11737, _B0) ->
    {V1_flag, _B1} = protocol:uint16(_B0),
    {ok, {V1_flag}};
unpack(cli, 11737, _B0) ->
    {V1_flag, _B1} = protocol:uint16(_B0),
    {ok, {V1_flag}};
unpack(srv, 11738, _B0) -> {ok, {}};
unpack(cli, 11738, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_lev, _B5} = protocol:uint8(_B4),
    {V1_cross_type, _B6} = protocol:uint8(_B5),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_lev,
      V1_cross_type}};
unpack(srv, 11739, _B0) -> {ok, {}};
unpack(cli, 11739, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

