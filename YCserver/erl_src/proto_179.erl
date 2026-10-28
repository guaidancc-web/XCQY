-file("src/proto/proto_179.erl", 1).

-module(proto_179).

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

-file("src/proto/proto_179.erl", 14).

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

-file("src/proto/proto_179.erl", 15).

-file("inc/gods_duel.hrl", 1).

-record(gods_duel_team,
        {ver = 1 :: pos_integer(),
         id = {0, "", 0},
         name = "",
         lev = 0,
         match_group = 0,
         leader = {0, "", 0},
         member_num = 0,
         members = [],
         fight_capacity = 0,
         applys = [],
         invite_info = [],
         declaration = "",
         win_times = 0,
         loss_times = 0,
         qualification = 0,
         team_group_256 = 0,
         team_group_64 = 0,
         team_group_8 = 0,
         team_group_4 = 0,
         team_seq = 0,
         team_index = 0}).

-record(gods_duel_team_mate,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         break_times = 0,
         position = 0,
         fight_capacity = 0,
         join_time = 0}).

-record(m_gods_duel,
        {ver = 2, team_id = {0, "", 0}, gods_score = 0}).

-record(gods_duel_season_data,
        {ver = 1, serial_id = 0, history_season_info = []}).

-record(gods_duel_season_info,
        {ver = 1,
         id = 0,
         status = 0,
         teams = [],
         group_order = 0,
         season_time_info = []}).

-record(invite_info,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         break_times = 0,
         classes = 0,
         sex = 0,
         total_fc = 0,
         online = 0}).

-record(gods_duel_join_team,
        {id = {0, "", 0},
         team_pid = undefined,
         team_data = undefined,
         fighters = [],
         is_ready = false}).

-record(gods_duel_match,
        {id = {0, 0},
         teams = [],
         combat_pid = undefined :: pid(),
         calc_args = [],
         combat_ref = undefined,
         is_over = 0,
         map_id = 0,
         map_pid = undefined,
         roles = []}).

-record(gods_duel_match_profile,
        {id = 0,
         ver = 1,
         season_id = 0,
         match_type = 0,
         match_round = 0,
         match_id = 0,
         group_id = 0,
         combat_type = 0,
         atk_name,
         dfd_name,
         combat_pid = undefined :: pid(),
         is_over = 0,
         platform = "",
         zone_id = 0,
         time = 0,
         fc_diff = 0,
         round = 0}).

-record(gods_duel_fighter,
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

-record(gods_duel_vote,
        {ver = 0 :: non_neg_integer(),
         id = {0, "", 0} :: tuple(),
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         choices = [] :: list(),
         time = 0 :: non_neg_integer()}).

-record(gods_duel_vote_choice,
        {id = {0, "", 0} :: tuple(),
         match_round = 0 :: non_neg_integer(),
         match_zone = 0,
         is_right = 0 :: 0..2}).

-record(gods_duel_poll,
        {id = {0, "", 0} :: tuple(),
         match_round = 0 :: non_neg_integer(),
         voted_cnt = 0 :: non_neg_integer()}).

-record(gods_duel_profile,
        {id = {0, "", 0} :: tuple(),
         ver = 1 :: non_neg_integer(),
         name = "" :: string(),
         lev = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         gods_duel_score = 0 :: non_neg_integer()}).

-record(gods_challenge_info,
        {id, combat_pid, is_over = 0}).

-record(gods_duel_team_rank,
        {ver = 1, serial_id = 0, history_season_info = []}).

-record(gods_duel_team_rank_data,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         leader = {0, "", 0},
         member_num = 0,
         members = [],
         fight_capacity = 0,
         win_times = 0,
         qualification = 0,
         rank = 0}).

-record(gods_duel_team_rank_mate,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 2,
         lev = 0,
         break_times = 0,
         position = 2,
         fight_capacity = 0,
         looks = []}).

-record(gods_challenge_team,
        {season_id = 0,
         team_name = "",
         member_num = 0,
         members = []}).

-record(gods_challenge_team_mate,
        {id = {0, "", 0}, name = ""}).

-file("src/proto/proto_179.erl", 16).

-file("inc/gods_place.hrl", 1).

-record(gods_place_team_statue,
        {ver = 1,
         team_id = 0,
         id = {0, "", 0},
         name = "",
         lev = 0,
         members = [],
         qualification = 0,
         serial_id = 0,
         team_leader = {0, "", 0}}).

-record(gods_place_team_mate_statue,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         break_times = 0,
         looks = []}).

-record(m_gods_place,
        {ver = 3,
         group_id = 0,
         zone_id = 0,
         zone_pid = 0,
         pick_chest = 0,
         worship_times = 0,
         total_num = 0,
         sys_barrage = 1,
         ply_barrage = 1,
         barrage_time = 0,
         efficiency_flag = 0,
         pick_flag = 0}).

-file("src/proto/proto_179.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 17900, {}) ->
    {ok, <<2:32/little, 17900:16/little>>};
pack(srv, 17900,
     {#gods_duel_team{id = {V0_tid, V0_platform, V0_zone_id},
                      name = V0_name, lev = V0_lev,
                      match_group = V0_match_group, members = V0_members,
                      fight_capacity = V0_fight_capacity, applys = V0_applys,
                      declaration = V0_declaration, win_times = V0_win_times,
                      loss_times = V0_loss_times,
                      qualification = V0_qualification,
                      team_group_256 = V0_team_group_256,
                      team_group_64 = V0_team_group_64,
                      team_group_8 = V0_team_group_8,
                      team_group_4 = V0_team_group_4, team_seq = V0_team_seq,
                      team_index = V0_team_index}}) ->
    D_a_t_a = <<V0_tid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_lev:8/little, V0_match_group:8/little,
                (length(V0_members)):16/little,
                (list_to_binary([<<V1_tid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_classes:8/little, V1_sex:8/little,
                                   V1_lev:16/little, V1_break_times:8/little,
                                   V1_position:8/little,
                                   V1_fight_capacity:32/little>>
                                 || #gods_duel_team_mate{id =
                                                             {V1_tid,
                                                              V1_platform,
                                                              V1_zone_id},
                                                         name = V1_name,
                                                         classes = V1_classes,
                                                         sex = V1_sex,
                                                         lev = V1_lev,
                                                         break_times =
                                                             V1_break_times,
                                                         position = V1_position,
                                                         fight_capacity =
                                                             V1_fight_capacity}
                                        <- V0_members]))/binary,
                V0_fight_capacity:32/little,
                (length(V0_applys)):16/little,
                (list_to_binary([<<V1_tid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_classes:8/little, V1_sex:8/little,
                                   V1_lev:16/little, V1_break_times:8/little,
                                   V1_position:8/little,
                                   V1_fight_capacity:32/little>>
                                 || #gods_duel_team_mate{id =
                                                             {V1_tid,
                                                              V1_platform,
                                                              V1_zone_id},
                                                         name = V1_name,
                                                         classes = V1_classes,
                                                         sex = V1_sex,
                                                         lev = V1_lev,
                                                         break_times =
                                                             V1_break_times,
                                                         position = V1_position,
                                                         fight_capacity =
                                                             V1_fight_capacity}
                                        <- V0_applys]))/binary,
                (protocol:pack(string, V0_declaration))/binary,
                V0_win_times:8/little, V0_loss_times:8/little,
                V0_qualification:32/little, V0_team_group_256:32/little,
                V0_team_group_64:32/little, V0_team_group_8:32/little,
                V0_team_group_4:32/little, V0_team_seq:8/little,
                V0_team_index:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17900:16/little,
       D_a_t_a/binary>>};
pack(cli, 17901, {V0_name}) ->
    D_a_t_a = <<(protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17901:16/little,
       D_a_t_a/binary>>};
pack(srv, 17901, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17901:16/little,
       D_a_t_a/binary>>};
pack(cli, 17902, {}) ->
    {ok, <<2:32/little, 17902:16/little>>};
pack(srv, 17902, {V0_type, V0_leader_name, V0_name}) ->
    D_a_t_a = <<V0_type:8/little,
                (protocol:pack(string, V0_leader_name))/binary,
                (protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17902:16/little,
       D_a_t_a/binary>>};
pack(cli, 17903, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17903:16/little,
       D_a_t_a/binary>>};
pack(srv, 17903, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17903:16/little,
       D_a_t_a/binary>>};
pack(cli, 17904, {}) ->
    {ok, <<2:32/little, 17904:16/little>>};
pack(srv, 17904, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17904:16/little,
       D_a_t_a/binary>>};
pack(cli, 17905, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17905:16/little,
       D_a_t_a/binary>>};
pack(srv, 17905, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17905:16/little,
       D_a_t_a/binary>>};
pack(cli, 17906, {}) ->
    {ok, <<2:32/little, 17906:16/little>>};
pack(srv, 17906, {V0_team_list}) ->
    D_a_t_a = <<(length(V0_team_list)):16/little,
                (list_to_binary([<<V1_tid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:8/little, V1_member_num:8/little,
                                   V1_win_times:8/little,
                                   V1_loss_times:8/little,
                                   (length(V1_members)):16/little,
                                   (list_to_binary([<<V2_tid:32/little,
                                                      (protocol:pack(string,
                                                                     V2_platform))/binary,
                                                      V2_zone_id:16/little,
                                                      (protocol:pack(string,
                                                                     V2_name))/binary,
                                                      V2_classes:8/little,
                                                      V2_sex:8/little,
                                                      V2_lev:16/little,
                                                      V2_break_times:8/little,
                                                      V2_position:8/little,
                                                      V2_fight_capacity:32/little>>
                                                    || #gods_duel_team_mate{id =
                                                                                {V2_tid,
                                                                                 V2_platform,
                                                                                 V2_zone_id},
                                                                            name
                                                                                =
                                                                                V2_name,
                                                                            classes
                                                                                =
                                                                                V2_classes,
                                                                            sex
                                                                                =
                                                                                V2_sex,
                                                                            lev
                                                                                =
                                                                                V2_lev,
                                                                            break_times
                                                                                =
                                                                                V2_break_times,
                                                                            position
                                                                                =
                                                                                V2_position,
                                                                            fight_capacity
                                                                                =
                                                                                V2_fight_capacity}
                                                           <- V1_members]))/binary>>
                                 || #gods_duel_team{id =
                                                        {V1_tid,
                                                         V1_platform,
                                                         V1_zone_id},
                                                    name = V1_name,
                                                    lev = V1_lev,
                                                    member_num = V1_member_num,
                                                    win_times = V1_win_times,
                                                    loss_times = V1_loss_times,
                                                    members = V1_members}
                                        <- V0_team_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17906:16/little,
       D_a_t_a/binary>>};
pack(cli, 17907, {{V0_tid, V0_platform, V0_zone_id}}) ->
    D_a_t_a = <<V0_tid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17907:16/little,
       D_a_t_a/binary>>};
pack(srv, 17907, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17907:16/little,
       D_a_t_a/binary>>};
pack(cli, 17908,
     {{V0_rid, V0_platform, V0_zone_id}, V0_flag}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17908:16/little,
       D_a_t_a/binary>>};
pack(srv, 17908, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17908:16/little,
       D_a_t_a/binary>>};
pack(cli, 17909, {{V0_rid, V0_platform, V0_zone_id}}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17909:16/little,
       D_a_t_a/binary>>};
pack(srv, 17909, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17909:16/little,
       D_a_t_a/binary>>};
pack(cli, 17910, {V0_type}) ->
    D_a_t_a = <<V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17910:16/little,
       D_a_t_a/binary>>};
pack(srv, 17910, {V0_type, V0_invite_list}) ->
    D_a_t_a = <<V0_type:8/little,
                (length(V0_invite_list)):16/little,
                (list_to_binary([<<V1_fid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:32/little, V1_break_times:8/little,
                                   V1_classes:8/little, V1_sex:8/little,
                                   V1_total_fc:32/little, V1_online:8/little>>
                                 || #invite_info{id =
                                                     {V1_fid,
                                                      V1_platform,
                                                      V1_zone_id},
                                                 name = V1_name, lev = V1_lev,
                                                 break_times = V1_break_times,
                                                 classes = V1_classes,
                                                 sex = V1_sex,
                                                 total_fc = V1_total_fc,
                                                 online = V1_online}
                                        <- V0_invite_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17910:16/little,
       D_a_t_a/binary>>};
pack(cli, 17911, {V0_type}) ->
    D_a_t_a = <<V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17911:16/little,
       D_a_t_a/binary>>};
pack(srv, 17911, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17911:16/little,
       D_a_t_a/binary>>};
pack(cli, 17912, {V0_name}) ->
    D_a_t_a = <<(protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17912:16/little,
       D_a_t_a/binary>>};
pack(srv, 17912, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17912:16/little,
       D_a_t_a/binary>>};
pack(cli, 17913, {V0_declaration}) ->
    D_a_t_a = <<(protocol:pack(string,
                               V0_declaration))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17913:16/little,
       D_a_t_a/binary>>};
pack(srv, 17913, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17913:16/little,
       D_a_t_a/binary>>};
pack(cli, 17914,
     {V0_fid1,
      V0_platform1,
      V0_zone_id1,
      V0_fid2,
      V0_platform2,
      V0_zone_id2}) ->
    D_a_t_a = <<V0_fid1:32/little,
                (protocol:pack(string, V0_platform1))/binary,
                V0_zone_id1:16/little, V0_fid2:32/little,
                (protocol:pack(string, V0_platform2))/binary,
                V0_zone_id2:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17914:16/little,
       D_a_t_a/binary>>};
pack(srv, 17914, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17914:16/little,
       D_a_t_a/binary>>};
pack(cli, 17915, {}) ->
    {ok, <<2:32/little, 17915:16/little>>};
pack(srv, 17915, {V0_state, V0_season_id}) ->
    D_a_t_a = <<V0_state:8/little, V0_season_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17915:16/little,
       D_a_t_a/binary>>};
pack(cli, 17916, {}) ->
    {ok, <<2:32/little, 17916:16/little>>};
pack(srv, 17916, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17916:16/little,
       D_a_t_a/binary>>};
pack(cli, 17917, {V0_zone_id, V0_index}) ->
    D_a_t_a = <<V0_zone_id:8/little, V0_index:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17917:16/little,
       D_a_t_a/binary>>};
pack(srv, 17917,
     {V0_zone_id, V0_index, V0_team_list}) ->
    D_a_t_a = <<V0_zone_id:8/little, V0_index:8/little,
                (length(V0_team_list)):16/little,
                (list_to_binary([<<V1_tid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:8/little, V1_member_num:8/little,
                                   V1_win_times:8/little,
                                   V1_loss_times:8/little,
                                   V1_team_group_256:32/little,
                                   (length(V1_members)):16/little,
                                   (list_to_binary([<<V2_tid:32/little,
                                                      (protocol:pack(string,
                                                                     V2_platform))/binary,
                                                      V2_zone_id:16/little,
                                                      (protocol:pack(string,
                                                                     V2_name))/binary,
                                                      V2_classes:8/little,
                                                      V2_sex:8/little,
                                                      V2_lev:16/little,
                                                      V2_break_times:8/little,
                                                      V2_position:8/little,
                                                      V2_fight_capacity:32/little>>
                                                    || #gods_duel_team_mate{id =
                                                                                {V2_tid,
                                                                                 V2_platform,
                                                                                 V2_zone_id},
                                                                            name
                                                                                =
                                                                                V2_name,
                                                                            classes
                                                                                =
                                                                                V2_classes,
                                                                            sex
                                                                                =
                                                                                V2_sex,
                                                                            lev
                                                                                =
                                                                                V2_lev,
                                                                            break_times
                                                                                =
                                                                                V2_break_times,
                                                                            position
                                                                                =
                                                                                V2_position,
                                                                            fight_capacity
                                                                                =
                                                                                V2_fight_capacity}
                                                           <- V1_members]))/binary>>
                                 || #gods_duel_team{id =
                                                        {V1_tid,
                                                         V1_platform,
                                                         V1_zone_id},
                                                    name = V1_name,
                                                    lev = V1_lev,
                                                    member_num = V1_member_num,
                                                    win_times = V1_win_times,
                                                    loss_times = V1_loss_times,
                                                    team_group_256 =
                                                        V1_team_group_256,
                                                    members = V1_members}
                                        <- V0_team_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17917:16/little,
       D_a_t_a/binary>>};
pack(cli, 17918, {}) ->
    {ok, <<2:32/little, 17918:16/little>>};
pack(srv, 17918,
     {V0_flag,
      #gods_duel_team{id = {V0_tid, V0_platform, V0_zone_id},
                      name = V0_name, lev = V0_lev,
                      match_group = V0_match_group, members = V0_members,
                      fight_capacity = V0_fight_capacity, applys = V0_applys,
                      declaration = V0_declaration, win_times = V0_win_times,
                      loss_times = V0_loss_times,
                      qualification = V0_qualification,
                      team_group_256 = V0_team_group_256,
                      team_group_64 = V0_team_group_64,
                      team_group_8 = V0_team_group_8,
                      team_group_4 = V0_team_group_4, team_seq = V0_team_seq,
                      team_index = V0_team_index}}) ->
    D_a_t_a = <<V0_flag:32/little, V0_tid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_lev:8/little, V0_match_group:8/little,
                (length(V0_members)):16/little,
                (list_to_binary([<<V1_tid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_classes:8/little, V1_sex:8/little,
                                   V1_lev:16/little, V1_break_times:8/little,
                                   V1_position:8/little,
                                   V1_fight_capacity:32/little>>
                                 || #gods_duel_team_mate{id =
                                                             {V1_tid,
                                                              V1_platform,
                                                              V1_zone_id},
                                                         name = V1_name,
                                                         classes = V1_classes,
                                                         sex = V1_sex,
                                                         lev = V1_lev,
                                                         break_times =
                                                             V1_break_times,
                                                         position = V1_position,
                                                         fight_capacity =
                                                             V1_fight_capacity}
                                        <- V0_members]))/binary,
                V0_fight_capacity:32/little,
                (length(V0_applys)):16/little,
                (list_to_binary([<<V1_tid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_classes:8/little, V1_sex:8/little,
                                   V1_lev:16/little, V1_break_times:8/little,
                                   V1_position:8/little,
                                   V1_fight_capacity:32/little>>
                                 || #gods_duel_team_mate{id =
                                                             {V1_tid,
                                                              V1_platform,
                                                              V1_zone_id},
                                                         name = V1_name,
                                                         classes = V1_classes,
                                                         sex = V1_sex,
                                                         lev = V1_lev,
                                                         break_times =
                                                             V1_break_times,
                                                         position = V1_position,
                                                         fight_capacity =
                                                             V1_fight_capacity}
                                        <- V0_applys]))/binary,
                (protocol:pack(string, V0_declaration))/binary,
                V0_win_times:8/little, V0_loss_times:8/little,
                V0_qualification:32/little, V0_team_group_256:32/little,
                V0_team_group_64:32/little, V0_team_group_8:32/little,
                V0_team_group_4:32/little, V0_team_seq:8/little,
                V0_team_index:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17918:16/little,
       D_a_t_a/binary>>};
pack(cli, 17919, {}) ->
    {ok, <<2:32/little, 17919:16/little>>};
pack(srv, 17919, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17919:16/little,
       D_a_t_a/binary>>};
pack(cli, 17920, {}) ->
    {ok, <<2:32/little, 17920:16/little>>};
pack(srv, 17920, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17920:16/little,
       D_a_t_a/binary>>};
pack(cli, 17921, {}) ->
    {ok, <<2:32/little, 17921:16/little>>};
pack(srv, 17921, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17921:16/little,
       D_a_t_a/binary>>};
pack(cli, 17922, {}) ->
    {ok, <<2:32/little, 17922:16/little>>};
pack(srv, 17922,
     {{V0_tid_1, V0_platform_1, V0_id_1},
      V0_team_name_1,
      V0_status_1,
      {V0_tid_2, V0_platform_2, V0_id_2},
      V0_team_name_2,
      V0_status_2}) ->
    D_a_t_a = <<V0_tid_1:32/little,
                (protocol:pack(string, V0_platform_1))/binary,
                V0_id_1:16/little,
                (protocol:pack(string, V0_team_name_1))/binary,
                V0_status_1:8/little, V0_tid_2:32/little,
                (protocol:pack(string, V0_platform_2))/binary,
                V0_id_2:16/little,
                (protocol:pack(string, V0_team_name_2))/binary,
                V0_status_2:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17922:16/little,
       D_a_t_a/binary>>};
pack(cli, 17923, {}) ->
    {ok, <<2:32/little, 17923:16/little>>};
pack(srv, 17923, {V0_flag, V0_state, V0_left_time}) ->
    D_a_t_a = <<V0_flag:8/little, V0_state:8/little,
                V0_left_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17923:16/little,
       D_a_t_a/binary>>};
pack(cli, 17924, {}) ->
    {ok, <<2:32/little, 17924:16/little>>};
pack(srv, 17924, {V0_team_list}) ->
    D_a_t_a = <<(length(V0_team_list)):16/little,
                (list_to_binary([<<V1_tid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:8/little, V1_member_num:8/little,
                                   V1_team_group_256:32/little,
                                   V1_team_group_64:32/little,
                                   (length(V1_members)):16/little,
                                   (list_to_binary([<<V2_tid:32/little,
                                                      (protocol:pack(string,
                                                                     V2_platform))/binary,
                                                      V2_zone_id:16/little,
                                                      (protocol:pack(string,
                                                                     V2_name))/binary,
                                                      V2_classes:8/little,
                                                      V2_sex:8/little,
                                                      V2_lev:16/little,
                                                      V2_break_times:8/little,
                                                      V2_position:8/little,
                                                      V2_fight_capacity:32/little>>
                                                    || #gods_duel_team_mate{id =
                                                                                {V2_tid,
                                                                                 V2_platform,
                                                                                 V2_zone_id},
                                                                            name
                                                                                =
                                                                                V2_name,
                                                                            classes
                                                                                =
                                                                                V2_classes,
                                                                            sex
                                                                                =
                                                                                V2_sex,
                                                                            lev
                                                                                =
                                                                                V2_lev,
                                                                            break_times
                                                                                =
                                                                                V2_break_times,
                                                                            position
                                                                                =
                                                                                V2_position,
                                                                            fight_capacity
                                                                                =
                                                                                V2_fight_capacity}
                                                           <- V1_members]))/binary>>
                                 || #gods_duel_team{id =
                                                        {V1_tid,
                                                         V1_platform,
                                                         V1_zone_id},
                                                    name = V1_name,
                                                    lev = V1_lev,
                                                    member_num = V1_member_num,
                                                    team_group_256 =
                                                        V1_team_group_256,
                                                    team_group_64 =
                                                        V1_team_group_64,
                                                    members = V1_members}
                                        <- V0_team_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17924:16/little,
       D_a_t_a/binary>>};
pack(cli, 17925, {V0_zone_id}) ->
    D_a_t_a = <<V0_zone_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17925:16/little,
       D_a_t_a/binary>>};
pack(srv, 17925, {V0_zone_id, V0_team_list}) ->
    D_a_t_a = <<V0_zone_id:8/little,
                (length(V0_team_list)):16/little,
                (list_to_binary([<<V1_tid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:8/little, V1_member_num:8/little,
                                   V1_qualification:32/little,
                                   V1_team_group_64:32/little,
                                   (length(V1_members)):16/little,
                                   (list_to_binary([<<V2_tid:32/little,
                                                      (protocol:pack(string,
                                                                     V2_platform))/binary,
                                                      V2_zone_id:16/little,
                                                      (protocol:pack(string,
                                                                     V2_name))/binary,
                                                      V2_classes:8/little,
                                                      V2_sex:8/little,
                                                      V2_lev:16/little,
                                                      V2_break_times:8/little,
                                                      V2_position:8/little,
                                                      V2_fight_capacity:32/little>>
                                                    || #gods_duel_team_mate{id =
                                                                                {V2_tid,
                                                                                 V2_platform,
                                                                                 V2_zone_id},
                                                                            name
                                                                                =
                                                                                V2_name,
                                                                            classes
                                                                                =
                                                                                V2_classes,
                                                                            sex
                                                                                =
                                                                                V2_sex,
                                                                            lev
                                                                                =
                                                                                V2_lev,
                                                                            break_times
                                                                                =
                                                                                V2_break_times,
                                                                            position
                                                                                =
                                                                                V2_position,
                                                                            fight_capacity
                                                                                =
                                                                                V2_fight_capacity}
                                                           <- V1_members]))/binary>>
                                 || #gods_duel_team{id =
                                                        {V1_tid,
                                                         V1_platform,
                                                         V1_zone_id},
                                                    name = V1_name,
                                                    lev = V1_lev,
                                                    member_num = V1_member_num,
                                                    qualification =
                                                        V1_qualification,
                                                    team_group_64 =
                                                        V1_team_group_64,
                                                    members = V1_members}
                                        <- V0_team_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17925:16/little,
       D_a_t_a/binary>>};
pack(cli, 17926, {}) ->
    {ok, <<2:32/little, 17926:16/little>>};
pack(srv, 17926, {V0_result, V0_mates, V0_rival}) ->
    D_a_t_a = <<V0_result:8/little,
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
                                 || #gods_duel_fighter{id =
                                                           {V1_rid,
                                                            V1_platform,
                                                            V1_zone_id},
                                                       name = V1_name,
                                                       sex = V1_sex,
                                                       classes = V1_classes,
                                                       lev = V1_lev,
                                                       total_hurt =
                                                           V1_total_hurt,
                                                       total_dmg = V1_total_dmg,
                                                       total_heal =
                                                           V1_total_heal,
                                                       kill_num = V1_kill_num,
                                                       dead_num = V1_dead_num,
                                                       control_num =
                                                           V1_control_num,
                                                       mvp_score = V1_mvp_score}
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
                                 || #gods_duel_fighter{id =
                                                           {V1_rid,
                                                            V1_platform,
                                                            V1_zone_id},
                                                       name = V1_name,
                                                       sex = V1_sex,
                                                       classes = V1_classes,
                                                       lev = V1_lev,
                                                       total_hurt =
                                                           V1_total_hurt,
                                                       total_dmg = V1_total_dmg,
                                                       total_heal =
                                                           V1_total_heal,
                                                       kill_num = V1_kill_num,
                                                       dead_num = V1_dead_num,
                                                       control_num =
                                                           V1_control_num,
                                                       mvp_score = V1_mvp_score}
                                        <- V0_rival]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17926:16/little,
       D_a_t_a/binary>>};
pack(cli, 17927, {}) ->
    {ok, <<2:32/little, 17927:16/little>>};
pack(srv, 17927, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17927:16/little,
       D_a_t_a/binary>>};
pack(cli, 17928,
     {V0_season_id, V0_group_id, V0_watch_type}) ->
    D_a_t_a = <<V0_season_id:32/little,
                V0_group_id:32/little, V0_watch_type:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17928:16/little,
       D_a_t_a/binary>>};
pack(srv, 17928,
     {V0_gods_duel_match_profile,
      V0_platform,
      V0_zone_id}) ->
    D_a_t_a =
        <<(length(V0_gods_duel_match_profile)):16/little,
          (list_to_binary([<<V1_id:32/little,
                             V1_season_id:16/little, V1_match_round:8/little,
                             V1_match_type:8/little, V1_combat_type:8/little,
                             V1_group_id:8/little, V1_is_over:8/little,
                             (protocol:pack(string, V1_atk_name))/binary,
                             (protocol:pack(string, V1_dfd_name))/binary,
                             V1_time:32/little>>
                           || #gods_duel_match_profile{id = V1_id,
                                                       season_id = V1_season_id,
                                                       match_round =
                                                           V1_match_round,
                                                       match_type =
                                                           V1_match_type,
                                                       combat_type =
                                                           V1_combat_type,
                                                       group_id = V1_group_id,
                                                       is_over = V1_is_over,
                                                       atk_name = V1_atk_name,
                                                       dfd_name = V1_dfd_name,
                                                       time = V1_time}
                                  <- V0_gods_duel_match_profile]))/binary,
          (protocol:pack(string, V0_platform))/binary,
          V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17928:16/little,
       D_a_t_a/binary>>};
pack(cli, 17929, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17929:16/little,
       D_a_t_a/binary>>};
pack(srv, 17929, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17929:16/little,
       D_a_t_a/binary>>};
pack(cli, 17930, {}) ->
    {ok, <<2:32/little, 17930:16/little>>};
pack(srv, 17930,
     {V0_gods_duel_vote_choice, V0_gods_duel_poll}) ->
    D_a_t_a =
        <<(length(V0_gods_duel_vote_choice)):16/little,
          (list_to_binary([<<V1_tid:32/little,
                             (protocol:pack(string, V1_platform))/binary,
                             V1_zone_id:16/little, V1_match_round:8/little,
                             V1_is_right:8/little>>
                           || #gods_duel_vote_choice{id =
                                                         {V1_tid,
                                                          V1_platform,
                                                          V1_zone_id},
                                                     match_round =
                                                         V1_match_round,
                                                     is_right = V1_is_right}
                                  <- V0_gods_duel_vote_choice]))/binary,
          (length(V0_gods_duel_poll)):16/little,
          (list_to_binary([<<V1_tid:32/little,
                             (protocol:pack(string, V1_platform))/binary,
                             V1_zone_id:16/little, V1_voted_cnt:32/little>>
                           || #gods_duel_poll{id =
                                                  {V1_tid,
                                                   V1_platform,
                                                   V1_zone_id},
                                              voted_cnt = V1_voted_cnt}
                                  <- V0_gods_duel_poll]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17930:16/little,
       D_a_t_a/binary>>};
pack(cli, 17931, {V0_match_zone, V0_id}) ->
    D_a_t_a = <<V0_match_zone:8/little,
                (length(V0_id)):16/little,
                (list_to_binary([<<V1_tid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little>>
                                 || {V1_tid, V1_platform, V1_zone_id}
                                        <- V0_id]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17931:16/little,
       D_a_t_a/binary>>};
pack(srv, 17931, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17931:16/little,
       D_a_t_a/binary>>};
pack(cli, 17932, {V0_zone_id, V0_season_id}) ->
    D_a_t_a = <<V0_zone_id:8/little,
                V0_season_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17932:16/little,
       D_a_t_a/binary>>};
pack(srv, 17932,
     {V0_zone_id, V0_season_id, V0_team_list}) ->
    D_a_t_a = <<V0_zone_id:8/little, V0_season_id:32/little,
                (length(V0_team_list)):16/little,
                (list_to_binary([<<V1_tid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:8/little, V1_member_num:8/little,
                                   V1_qualification:32/little,
                                   V1_team_group_64:32/little,
                                   (length(V1_members)):16/little,
                                   (list_to_binary([<<V2_tid:32/little,
                                                      (protocol:pack(string,
                                                                     V2_platform))/binary,
                                                      V2_zone_id:16/little,
                                                      (protocol:pack(string,
                                                                     V2_name))/binary,
                                                      V2_classes:8/little,
                                                      V2_sex:8/little,
                                                      V2_lev:16/little,
                                                      V2_break_times:8/little,
                                                      V2_position:8/little,
                                                      V2_fight_capacity:32/little>>
                                                    || #gods_duel_team_mate{id =
                                                                                {V2_tid,
                                                                                 V2_platform,
                                                                                 V2_zone_id},
                                                                            name
                                                                                =
                                                                                V2_name,
                                                                            classes
                                                                                =
                                                                                V2_classes,
                                                                            sex
                                                                                =
                                                                                V2_sex,
                                                                            lev
                                                                                =
                                                                                V2_lev,
                                                                            break_times
                                                                                =
                                                                                V2_break_times,
                                                                            position
                                                                                =
                                                                                V2_position,
                                                                            fight_capacity
                                                                                =
                                                                                V2_fight_capacity}
                                                           <- V1_members]))/binary>>
                                 || #gods_duel_team{id =
                                                        {V1_tid,
                                                         V1_platform,
                                                         V1_zone_id},
                                                    name = V1_name,
                                                    lev = V1_lev,
                                                    member_num = V1_member_num,
                                                    qualification =
                                                        V1_qualification,
                                                    team_group_64 =
                                                        V1_team_group_64,
                                                    members = V1_members}
                                        <- V0_team_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17932:16/little,
       D_a_t_a/binary>>};
pack(cli, 17933, {V0_season_id}) ->
    D_a_t_a = <<V0_season_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17933:16/little,
       D_a_t_a/binary>>};
pack(srv, 17933, {V0_season_id, V0_season_time}) ->
    D_a_t_a = <<V0_season_id:32/little,
                (length(V0_season_time)):16/little,
                (list_to_binary([<<V1_state_code:8/little,
                                   V1_start_time:32/little,
                                   V1_end_time:32/little>>
                                 || {V1_state_code, V1_start_time, V1_end_time}
                                        <- V0_season_time]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17933:16/little,
       D_a_t_a/binary>>};
pack(cli, 17934, {}) ->
    {ok, <<2:32/little, 17934:16/little>>};
pack(srv, 17934, {V0_rank_info}) ->
    D_a_t_a = <<(length(V0_rank_info)):16/little,
                (list_to_binary([<<V1_rank:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_star:32/little, V1_need_score:32/little,
                                   (length(V1_reward)):16/little,
                                   (list_to_binary([<<V2_id:32/little,
                                                      V2_bound:8/little,
                                                      V2_value:32/little>>
                                                    || {V2_id,
                                                        V2_bound,
                                                        V2_value}
                                                           <- V1_reward]))/binary,
                                   V1_badge_id:32/little>>
                                 || {V1_rank,
                                     V1_name,
                                     V1_star,
                                     V1_need_score,
                                     V1_reward,
                                     V1_badge_id}
                                        <- V0_rank_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17934:16/little,
       D_a_t_a/binary>>};
pack(cli, 17935, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17935:16/little,
       D_a_t_a/binary>>};
pack(srv, 17935,
     {#gods_duel_profile{id =
                             {V0_rid, V0_platform, V0_zone_id},
                         rank_lev = V0_rank_lev,
                         gods_duel_score = V0_gods_duel_score}}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_rank_lev:32/little,
                V0_gods_duel_score:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17935:16/little,
       D_a_t_a/binary>>};
pack(cli, 17936, {}) ->
    {ok, <<2:32/little, 17936:16/little>>};
pack(srv, 17936,
     {#gods_duel_profile{rank_lev = V0_rank_lev,
                         gods_duel_score = V0_gods_duel_score}}) ->
    D_a_t_a = <<V0_rank_lev:32/little,
                V0_gods_duel_score:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17936:16/little,
       D_a_t_a/binary>>};
pack(cli, 17937, {V0_type, V0_group}) ->
    D_a_t_a = <<V0_type:8/little, V0_group:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17937:16/little,
       D_a_t_a/binary>>};
pack(srv, 17937, {V0_type, V0_group, V0_rank}) ->
    D_a_t_a = <<V0_type:8/little, V0_group:8/little,
                (length(V0_rank)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_rank_lev:8/little,
                                   V1_gods_duel_score:16/little>>
                                 || #gods_duel_profile{id =
                                                           {V1_rid,
                                                            V1_platform,
                                                            V1_zone_id},
                                                       name = V1_name,
                                                       sex = V1_sex,
                                                       classes = V1_classes,
                                                       rank_lev = V1_rank_lev,
                                                       gods_duel_score =
                                                           V1_gods_duel_score}
                                        <- V0_rank]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17937:16/little,
       D_a_t_a/binary>>};
pack(cli, 17938, {}) ->
    {ok, <<2:32/little, 17938:16/little>>};
pack(srv, 17938, {V0_status, V0_end_time}) ->
    D_a_t_a = <<V0_status:8/little, V0_end_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17938:16/little,
       D_a_t_a/binary>>};
pack(cli, 17939, {}) ->
    {ok, <<2:32/little, 17939:16/little>>};
pack(srv, 17939, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17939:16/little,
       D_a_t_a/binary>>};
pack(cli, 17940, {}) ->
    {ok, <<2:32/little, 17940:16/little>>};
pack(srv, 17940, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17940:16/little,
       D_a_t_a/binary>>};
pack(cli, 17941, {}) ->
    {ok, <<2:32/little, 17941:16/little>>};
pack(srv, 17941, {V0_champion_teams}) ->
    D_a_t_a = <<(length(V0_champion_teams)):16/little,
                (list_to_binary([<<V1_tid:32/little,
                                   (protocol:pack(string, V1_platfrom))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:32/little,
                                   (length(V1_members)):16/little,
                                   (list_to_binary([<<V2_rid:32/little,
                                                      (protocol:pack(string,
                                                                     V2_platfrom))/binary,
                                                      V2_zone_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_name))/binary,
                                                      V2_lev:32/little,
                                                      V2_sex:8/little,
                                                      V2_classes:8/little,
                                                      V2_break_times:8/little,
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
                                                                              <- V2_looks]))/binary>>
                                                    || #gods_place_team_mate_statue{id
                                                                                        =
                                                                                        {V2_rid,
                                                                                         V2_platfrom,
                                                                                         V2_zone_id},
                                                                                    name
                                                                                        =
                                                                                        V2_name,
                                                                                    lev
                                                                                        =
                                                                                        V2_lev,
                                                                                    sex
                                                                                        =
                                                                                        V2_sex,
                                                                                    classes
                                                                                        =
                                                                                        V2_classes,
                                                                                    break_times
                                                                                        =
                                                                                        V2_break_times,
                                                                                    looks
                                                                                        =
                                                                                        V2_looks}
                                                           <- V1_members]))/binary,
                                   V1_serial_id:32/little>>
                                 || #gods_place_team_statue{id =
                                                                {V1_tid,
                                                                 V1_platfrom,
                                                                 V1_zone_id},
                                                            name = V1_name,
                                                            lev = V1_lev,
                                                            members =
                                                                V1_members,
                                                            serial_id =
                                                                V1_serial_id}
                                        <- V0_champion_teams]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17941:16/little,
       D_a_t_a/binary>>};
pack(cli, 17942, {}) ->
    {ok, <<2:32/little, 17942:16/little>>};
pack(srv, 17942, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17942:16/little,
       D_a_t_a/binary>>};
pack(cli, 17943, {V0_type, V0_value}) ->
    D_a_t_a = <<V0_type:32/little, V0_value:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17943:16/little,
       D_a_t_a/binary>>};
pack(srv, 17943,
     {V0_type, V0_value, V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_type:32/little, V0_value:8/little,
                V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17943:16/little,
       D_a_t_a/binary>>};
pack(cli, 17944, {V0_msg}) ->
    D_a_t_a = <<(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17944:16/little,
       D_a_t_a/binary>>};
pack(srv, 17944, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17944:16/little,
       D_a_t_a/binary>>};
pack(cli, 17945, {}) ->
    {ok, <<2:32/little, 17945:16/little>>};
pack(srv, 17945, {V0_err_code, V0_msg_list}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (length(V0_msg_list)):16/little,
                (list_to_binary([<<V1_msg_id:32/little,
                                   (protocol:pack(string, V1_msg))/binary>>
                                 || {V1_msg_id, V1_msg}
                                        <- V0_msg_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17945:16/little,
       D_a_t_a/binary>>};
pack(cli, 17946, {}) ->
    {ok, <<2:32/little, 17946:16/little>>};
pack(srv, 17946,
     {V0_err_code,
      V0_start_time,
      V0_next_round,
      V0_all_round,
      V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                V0_start_time:32/little, V0_next_round:32/little,
                V0_all_round:32/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17946:16/little,
       D_a_t_a/binary>>};
pack(cli, 17947, {}) ->
    {ok, <<2:32/little, 17947:16/little>>};
pack(srv, 17947, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17947:16/little,
       D_a_t_a/binary>>};
pack(cli, 17948, {}) ->
    {ok, <<2:32/little, 17948:16/little>>};
pack(srv, 17948, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17948:16/little,
       D_a_t_a/binary>>};
pack(cli, 17949, {}) ->
    {ok, <<2:32/little, 17949:16/little>>};
pack(srv, 17949, {}) ->
    {ok, <<2:32/little, 17949:16/little>>};
pack(cli, 17950, {}) ->
    {ok, <<2:32/little, 17950:16/little>>};
pack(srv, 17950, {V0_video_list}) ->
    D_a_t_a = <<(length(V0_video_list)):16/little,
                (list_to_binary([<<V1_list_id:8/little,
                                   (length(V1_gods_duel_video)):16/little,
                                   (list_to_binary([<<V2_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_platform))/binary,
                                                      V2_zone_id:32/little,
                                                      V2_season_id:16/little,
                                                      V2_match_round:8/little,
                                                      V2_group_id:8/little,
                                                      (protocol:pack(string,
                                                                     V2_atk_name))/binary,
                                                      (protocol:pack(string,
                                                                     V2_dfd_name))/binary,
                                                      V2_time:32/little,
                                                      V2_replayed:32/little>>
                                                    || {V2_id,
                                                        V2_platform,
                                                        V2_zone_id,
                                                        V2_season_id,
                                                        V2_match_round,
                                                        V2_group_id,
                                                        V2_atk_name,
                                                        V2_dfd_name,
                                                        V2_time,
                                                        V2_replayed}
                                                           <- V1_gods_duel_video]))/binary>>
                                 || {V1_list_id, V1_gods_duel_video}
                                        <- V0_video_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17950:16/little,
       D_a_t_a/binary>>};
pack(cli, 17951, {}) ->
    {ok, <<2:32/little, 17951:16/little>>};
pack(srv, 17951, {V0_gods_duel_champion_videos}) ->
    D_a_t_a =
        <<(length(V0_gods_duel_champion_videos)):16/little,
          (list_to_binary([<<V1_id:32/little,
                             (protocol:pack(string, V1_platform))/binary,
                             V1_zone_id:32/little, V1_season_id:16/little,
                             V1_match_round:8/little, V1_group_id:8/little,
                             (protocol:pack(string, V1_atk_name))/binary,
                             (protocol:pack(string, V1_dfd_name))/binary,
                             V1_time:32/little, V1_replayed:32/little>>
                           || {V1_id,
                               V1_platform,
                               V1_zone_id,
                               V1_season_id,
                               V1_match_round,
                               V1_group_id,
                               V1_atk_name,
                               V1_dfd_name,
                               V1_time,
                               V1_replayed}
                                  <- V0_gods_duel_champion_videos]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17951:16/little,
       D_a_t_a/binary>>};
pack(cli, 17952, {}) ->
    {ok, <<2:32/little, 17952:16/little>>};
pack(srv, 17952, {V0_end_time}) ->
    D_a_t_a = <<V0_end_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17952:16/little,
       D_a_t_a/binary>>};
pack(cli, 17953, {}) ->
    {ok, <<2:32/little, 17953:16/little>>};
pack(srv, 17953, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17953:16/little,
       D_a_t_a/binary>>};
pack(cli, 17954, {}) ->
    {ok, <<2:32/little, 17954:16/little>>};
pack(srv, 17954, {V0_first_time, V0_manual_time}) ->
    D_a_t_a = <<V0_first_time:32/little,
                V0_manual_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17954:16/little,
       D_a_t_a/binary>>};
pack(cli, 17955, {}) ->
    {ok, <<2:32/little, 17955:16/little>>};
pack(srv, 17955, {V0_err_code}) ->
    D_a_t_a = <<V0_err_code:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17955:16/little,
       D_a_t_a/binary>>};
pack(cli, 17956, {}) ->
    {ok, <<2:32/little, 17956:16/little>>};
pack(srv, 17956, {V0_status}) ->
    D_a_t_a = <<V0_status:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17956:16/little,
       D_a_t_a/binary>>};
pack(cli, 17957, {V0_season_id}) ->
    D_a_t_a = <<V0_season_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17957:16/little,
       D_a_t_a/binary>>};
pack(srv, 17957, {V0_hp_percent, V0_id}) ->
    D_a_t_a = <<V0_hp_percent:32/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17957:16/little,
       D_a_t_a/binary>>};
pack(cli, 17958, {}) ->
    {ok, <<2:32/little, 17958:16/little>>};
pack(srv, 17958, {V0_result, V0_times, V0_mates}) ->
    D_a_t_a = <<V0_result:8/little, V0_times:32/little,
                (length(V0_mates)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:8/little, V1_total_dmg:32/little,
                                   V1_total_heal:32/little>>
                                 || {{V1_rid, V1_platform, V1_zone_id},
                                     V1_name,
                                     V1_sex,
                                     V1_classes,
                                     V1_lev,
                                     V1_total_dmg,
                                     V1_total_heal}
                                        <- V0_mates]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17958:16/little,
       D_a_t_a/binary>>};
pack(cli, 17959, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17959:16/little,
       D_a_t_a/binary>>};
pack(srv, 17959, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17959:16/little,
       D_a_t_a/binary>>};
pack(cli, 17960, {}) ->
    {ok, <<2:32/little, 17960:16/little>>};
pack(srv, 17960, {V0_has_reward}) ->
    D_a_t_a = <<V0_has_reward:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17960:16/little,
       D_a_t_a/binary>>};
pack(cli, 17961, {}) ->
    {ok, <<2:32/little, 17961:16/little>>};
pack(srv, 17961, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17961:16/little,
       D_a_t_a/binary>>};
pack(cli, 17962, {}) ->
    {ok, <<2:32/little, 17962:16/little>>};
pack(srv, 17962, {V0_status, V0_team_name}) ->
    D_a_t_a = <<V0_status:8/little,
                (protocol:pack(string, V0_team_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17962:16/little,
       D_a_t_a/binary>>};
pack(cli, 17963, {V0_choice}) ->
    D_a_t_a = <<V0_choice:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17963:16/little,
       D_a_t_a/binary>>};
pack(srv, 17963, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17963:16/little,
       D_a_t_a/binary>>};
pack(cli, 17964, {}) ->
    {ok, <<2:32/little, 17964:16/little>>};
pack(srv, 17964,
     {V0_support_num,
      V0_unsupport_num,
      V0_unknow_num,
      V0_observer_num,
      V0_wave,
      V0_boss_id,
      V0_boss_hp_percent}) ->
    D_a_t_a = <<V0_support_num:32/little,
                V0_unsupport_num:32/little, V0_unknow_num:32/little,
                V0_observer_num:32/little, V0_wave:32/little,
                V0_boss_id:32/little, V0_boss_hp_percent:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17964:16/little,
       D_a_t_a/binary>>};
pack(cli, 17965, {}) ->
    {ok, <<2:32/little, 17965:16/little>>};
pack(srv, 17965, {V0_err_code, V0_start_time}) ->
    D_a_t_a = <<V0_err_code:8/little,
                V0_start_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17965:16/little,
       D_a_t_a/binary>>};
pack(cli, 17966, {}) ->
    {ok, <<2:32/little, 17966:16/little>>};
pack(srv, 17966, {V0_start_time}) ->
    D_a_t_a = <<V0_start_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17966:16/little,
       D_a_t_a/binary>>};
pack(cli, 17967, {}) ->
    {ok, <<2:32/little, 17967:16/little>>};
pack(srv, 17967, {V0_champion_teams}) ->
    D_a_t_a = <<(length(V0_champion_teams)):16/little,
                (list_to_binary([<<V1_tid:32/little,
                                   (protocol:pack(string, V1_platfrom))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:32/little, V1_match_group:8/little,
                                   (length(V1_members)):16/little,
                                   (list_to_binary([<<V2_rid:32/little,
                                                      (protocol:pack(string,
                                                                     V2_platfrom))/binary,
                                                      V2_zone_id:32/little,
                                                      V2_fight_capacity:32/little,
                                                      V2_position:8/little,
                                                      (protocol:pack(string,
                                                                     V2_name))/binary,
                                                      V2_lev:32/little,
                                                      V2_sex:8/little,
                                                      V2_classes:8/little,
                                                      V2_break_times:8/little>>
                                                    || #gods_duel_team_mate{id =
                                                                                {V2_rid,
                                                                                 V2_platfrom,
                                                                                 V2_zone_id},
                                                                            fight_capacity
                                                                                =
                                                                                V2_fight_capacity,
                                                                            position
                                                                                =
                                                                                V2_position,
                                                                            name
                                                                                =
                                                                                V2_name,
                                                                            lev
                                                                                =
                                                                                V2_lev,
                                                                            sex
                                                                                =
                                                                                V2_sex,
                                                                            classes
                                                                                =
                                                                                V2_classes,
                                                                            break_times
                                                                                =
                                                                                V2_break_times}
                                                           <- V1_members]))/binary>>
                                 || #gods_duel_team{id =
                                                        {V1_tid,
                                                         V1_platfrom,
                                                         V1_zone_id},
                                                    name = V1_name,
                                                    lev = V1_lev,
                                                    match_group =
                                                        V1_match_group,
                                                    members = V1_members}
                                        <- V0_champion_teams]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17967:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 17900, _B0) -> {ok, {}};
unpack(cli, 17900, _B0) ->
    {V1_tid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_lev, _B5} = protocol:uint8(_B4),
    {V1_match_group, _B6} = protocol:uint8(_B5),
    {V1_members, _B19} = protocol:array(_B6,
                                        fun (_B7) ->
                                                {V2_tid, _B8} =
                                                    protocol:uint32(_B7),
                                                {V2_platform, _B9} =
                                                    protocol:string(_B8),
                                                {V2_zone_id, _B10} =
                                                    protocol:uint16(_B9),
                                                {V2_name, _B11} =
                                                    protocol:string(_B10),
                                                {V2_classes, _B12} =
                                                    protocol:uint8(_B11),
                                                {V2_sex, _B13} =
                                                    protocol:uint8(_B12),
                                                {V2_lev, _B14} =
                                                    protocol:uint16(_B13),
                                                {V2_break_times, _B15} =
                                                    protocol:uint8(_B14),
                                                {V2_position, _B16} =
                                                    protocol:uint8(_B15),
                                                {V2_fight_capacity, _B17} =
                                                    protocol:uint32(_B16),
                                                {{V2_tid,
                                                  V2_platform,
                                                  V2_zone_id,
                                                  V2_name,
                                                  V2_classes,
                                                  V2_sex,
                                                  V2_lev,
                                                  V2_break_times,
                                                  V2_position,
                                                  V2_fight_capacity},
                                                 _B17}
                                        end),
    {V1_fight_capacity, _B20} = protocol:uint32(_B19),
    {V1_applys, _B33} = protocol:array(_B20,
                                       fun (_B21) ->
                                               {V2_tid, _B22} =
                                                   protocol:uint32(_B21),
                                               {V2_platform, _B23} =
                                                   protocol:string(_B22),
                                               {V2_zone_id, _B24} =
                                                   protocol:uint16(_B23),
                                               {V2_name, _B25} =
                                                   protocol:string(_B24),
                                               {V2_classes, _B26} =
                                                   protocol:uint8(_B25),
                                               {V2_sex, _B27} =
                                                   protocol:uint8(_B26),
                                               {V2_lev, _B28} =
                                                   protocol:uint16(_B27),
                                               {V2_break_times, _B29} =
                                                   protocol:uint8(_B28),
                                               {V2_position, _B30} =
                                                   protocol:uint8(_B29),
                                               {V2_fight_capacity, _B31} =
                                                   protocol:uint32(_B30),
                                               {{V2_tid,
                                                 V2_platform,
                                                 V2_zone_id,
                                                 V2_name,
                                                 V2_classes,
                                                 V2_sex,
                                                 V2_lev,
                                                 V2_break_times,
                                                 V2_position,
                                                 V2_fight_capacity},
                                                _B31}
                                       end),
    {V1_declaration, _B34} = protocol:string(_B33),
    {V1_win_times, _B35} = protocol:uint8(_B34),
    {V1_loss_times, _B36} = protocol:uint8(_B35),
    {V1_qualification, _B37} = protocol:uint32(_B36),
    {V1_team_group_256, _B38} = protocol:uint32(_B37),
    {V1_team_group_64, _B39} = protocol:uint32(_B38),
    {V1_team_group_8, _B40} = protocol:uint32(_B39),
    {V1_team_group_4, _B41} = protocol:uint32(_B40),
    {V1_team_seq, _B42} = protocol:uint8(_B41),
    {V1_team_index, _B43} = protocol:uint16(_B42),
    {ok,
     {V1_tid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_lev,
      V1_match_group,
      V1_members,
      V1_fight_capacity,
      V1_applys,
      V1_declaration,
      V1_win_times,
      V1_loss_times,
      V1_qualification,
      V1_team_group_256,
      V1_team_group_64,
      V1_team_group_8,
      V1_team_group_4,
      V1_team_seq,
      V1_team_index}};
unpack(srv, 17901, _B0) ->
    {V1_name, _B1} = protocol:string(_B0),
    {ok, {V1_name}};
unpack(cli, 17901, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17902, _B0) -> {ok, {}};
unpack(cli, 17902, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_leader_name, _B2} = protocol:string(_B1),
    {V1_name, _B3} = protocol:string(_B2),
    {ok, {V1_type, V1_leader_name, V1_name}};
unpack(srv, 17903, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(cli, 17903, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17904, _B0) -> {ok, {}};
unpack(cli, 17904, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17905, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 17905, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17906, _B0) -> {ok, {}};
unpack(cli, 17906, _B0) ->
    {V1_team_list, _B24} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_tid, _B2} =
                                                      protocol:uint32(_B1),
                                                  {V2_platform, _B3} =
                                                      protocol:string(_B2),
                                                  {V2_zone_id, _B4} =
                                                      protocol:uint16(_B3),
                                                  {V2_name, _B5} =
                                                      protocol:string(_B4),
                                                  {V2_lev, _B6} =
                                                      protocol:uint8(_B5),
                                                  {V2_member_num, _B7} =
                                                      protocol:uint8(_B6),
                                                  {V2_win_times, _B8} =
                                                      protocol:uint8(_B7),
                                                  {V2_loss_times, _B9} =
                                                      protocol:uint8(_B8),
                                                  {V2_members, _B22} =
                                                      protocol:array(_B9,
                                                                     fun
                                                                         (_B10) ->
                                                                             {V3_tid,
                                                                              _B11} =
                                                                                 protocol:uint32(_B10),
                                                                             {V3_platform,
                                                                              _B12} =
                                                                                 protocol:string(_B11),
                                                                             {V3_zone_id,
                                                                              _B13} =
                                                                                 protocol:uint16(_B12),
                                                                             {V3_name,
                                                                              _B14} =
                                                                                 protocol:string(_B13),
                                                                             {V3_classes,
                                                                              _B15} =
                                                                                 protocol:uint8(_B14),
                                                                             {V3_sex,
                                                                              _B16} =
                                                                                 protocol:uint8(_B15),
                                                                             {V3_lev,
                                                                              _B17} =
                                                                                 protocol:uint16(_B16),
                                                                             {V3_break_times,
                                                                              _B18} =
                                                                                 protocol:uint8(_B17),
                                                                             {V3_position,
                                                                              _B19} =
                                                                                 protocol:uint8(_B18),
                                                                             {V3_fight_capacity,
                                                                              _B20} =
                                                                                 protocol:uint32(_B19),
                                                                             {{V3_tid,
                                                                               V3_platform,
                                                                               V3_zone_id,
                                                                               V3_name,
                                                                               V3_classes,
                                                                               V3_sex,
                                                                               V3_lev,
                                                                               V3_break_times,
                                                                               V3_position,
                                                                               V3_fight_capacity},
                                                                              _B20}
                                                                     end),
                                                  {{V2_tid,
                                                    V2_platform,
                                                    V2_zone_id,
                                                    V2_name,
                                                    V2_lev,
                                                    V2_member_num,
                                                    V2_win_times,
                                                    V2_loss_times,
                                                    V2_members},
                                                   _B22}
                                          end),
    {ok, {V1_team_list}};
unpack(srv, 17907, _B0) ->
    {V1_tid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_tid, V1_platform, V1_zone_id}};
unpack(cli, 17907, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17908, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_flag, _B4} = protocol:uint8(_B3),
    {ok, {V1_rid, V1_platform, V1_zone_id, V1_flag}};
unpack(cli, 17908, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17909, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 17909, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17910, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_type}};
unpack(cli, 17910, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_invite_list, _B14} = protocol:array(_B1,
                                            fun (_B2) ->
                                                    {V2_fid, _B3} =
                                                        protocol:uint32(_B2),
                                                    {V2_platform, _B4} =
                                                        protocol:string(_B3),
                                                    {V2_zone_id, _B5} =
                                                        protocol:uint16(_B4),
                                                    {V2_name, _B6} =
                                                        protocol:string(_B5),
                                                    {V2_lev, _B7} =
                                                        protocol:uint32(_B6),
                                                    {V2_break_times, _B8} =
                                                        protocol:uint8(_B7),
                                                    {V2_classes, _B9} =
                                                        protocol:uint8(_B8),
                                                    {V2_sex, _B10} =
                                                        protocol:uint8(_B9),
                                                    {V2_total_fc, _B11} =
                                                        protocol:uint32(_B10),
                                                    {V2_online, _B12} =
                                                        protocol:uint8(_B11),
                                                    {{V2_fid,
                                                      V2_platform,
                                                      V2_zone_id,
                                                      V2_name,
                                                      V2_lev,
                                                      V2_break_times,
                                                      V2_classes,
                                                      V2_sex,
                                                      V2_total_fc,
                                                      V2_online},
                                                     _B12}
                                            end),
    {ok, {V1_type, V1_invite_list}};
unpack(srv, 17911, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_type}};
unpack(cli, 17911, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17912, _B0) ->
    {V1_name, _B1} = protocol:string(_B0),
    {ok, {V1_name}};
unpack(cli, 17912, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17913, _B0) ->
    {V1_declaration, _B1} = protocol:string(_B0),
    {ok, {V1_declaration}};
unpack(cli, 17913, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17914, _B0) ->
    {V1_fid1, _B1} = protocol:uint32(_B0),
    {V1_platform1, _B2} = protocol:string(_B1),
    {V1_zone_id1, _B3} = protocol:uint16(_B2),
    {V1_fid2, _B4} = protocol:uint32(_B3),
    {V1_platform2, _B5} = protocol:string(_B4),
    {V1_zone_id2, _B6} = protocol:uint16(_B5),
    {ok,
     {V1_fid1,
      V1_platform1,
      V1_zone_id1,
      V1_fid2,
      V1_platform2,
      V1_zone_id2}};
unpack(cli, 17914, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17915, _B0) -> {ok, {}};
unpack(cli, 17915, _B0) ->
    {V1_state, _B1} = protocol:uint8(_B0),
    {V1_season_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_state, V1_season_id}};
unpack(srv, 17916, _B0) -> {ok, {}};
unpack(cli, 17916, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17917, _B0) ->
    {V1_zone_id, _B1} = protocol:uint8(_B0),
    {V1_index, _B2} = protocol:uint8(_B1),
    {ok, {V1_zone_id, V1_index}};
unpack(cli, 17917, _B0) ->
    {V1_zone_id, _B1} = protocol:uint8(_B0),
    {V1_index, _B2} = protocol:uint8(_B1),
    {V1_team_list, _B27} = protocol:array(_B2,
                                          fun (_B3) ->
                                                  {V2_tid, _B4} =
                                                      protocol:uint32(_B3),
                                                  {V2_platform, _B5} =
                                                      protocol:string(_B4),
                                                  {V2_zone_id, _B6} =
                                                      protocol:uint16(_B5),
                                                  {V2_name, _B7} =
                                                      protocol:string(_B6),
                                                  {V2_lev, _B8} =
                                                      protocol:uint8(_B7),
                                                  {V2_member_num, _B9} =
                                                      protocol:uint8(_B8),
                                                  {V2_win_times, _B10} =
                                                      protocol:uint8(_B9),
                                                  {V2_loss_times, _B11} =
                                                      protocol:uint8(_B10),
                                                  {V2_team_group_256, _B12} =
                                                      protocol:uint32(_B11),
                                                  {V2_members, _B25} =
                                                      protocol:array(_B12,
                                                                     fun
                                                                         (_B13) ->
                                                                             {V3_tid,
                                                                              _B14} =
                                                                                 protocol:uint32(_B13),
                                                                             {V3_platform,
                                                                              _B15} =
                                                                                 protocol:string(_B14),
                                                                             {V3_zone_id,
                                                                              _B16} =
                                                                                 protocol:uint16(_B15),
                                                                             {V3_name,
                                                                              _B17} =
                                                                                 protocol:string(_B16),
                                                                             {V3_classes,
                                                                              _B18} =
                                                                                 protocol:uint8(_B17),
                                                                             {V3_sex,
                                                                              _B19} =
                                                                                 protocol:uint8(_B18),
                                                                             {V3_lev,
                                                                              _B20} =
                                                                                 protocol:uint16(_B19),
                                                                             {V3_break_times,
                                                                              _B21} =
                                                                                 protocol:uint8(_B20),
                                                                             {V3_position,
                                                                              _B22} =
                                                                                 protocol:uint8(_B21),
                                                                             {V3_fight_capacity,
                                                                              _B23} =
                                                                                 protocol:uint32(_B22),
                                                                             {{V3_tid,
                                                                               V3_platform,
                                                                               V3_zone_id,
                                                                               V3_name,
                                                                               V3_classes,
                                                                               V3_sex,
                                                                               V3_lev,
                                                                               V3_break_times,
                                                                               V3_position,
                                                                               V3_fight_capacity},
                                                                              _B23}
                                                                     end),
                                                  {{V2_tid,
                                                    V2_platform,
                                                    V2_zone_id,
                                                    V2_name,
                                                    V2_lev,
                                                    V2_member_num,
                                                    V2_win_times,
                                                    V2_loss_times,
                                                    V2_team_group_256,
                                                    V2_members},
                                                   _B25}
                                          end),
    {ok, {V1_zone_id, V1_index, V1_team_list}};
unpack(srv, 17918, _B0) -> {ok, {}};
unpack(cli, 17918, _B0) ->
    {V1_flag, _B1} = protocol:uint32(_B0),
    {V1_tid, _B2} = protocol:uint32(_B1),
    {V1_platform, _B3} = protocol:string(_B2),
    {V1_zone_id, _B4} = protocol:uint16(_B3),
    {V1_name, _B5} = protocol:string(_B4),
    {V1_lev, _B6} = protocol:uint8(_B5),
    {V1_match_group, _B7} = protocol:uint8(_B6),
    {V1_members, _B20} = protocol:array(_B7,
                                        fun (_B8) ->
                                                {V2_tid, _B9} =
                                                    protocol:uint32(_B8),
                                                {V2_platform, _B10} =
                                                    protocol:string(_B9),
                                                {V2_zone_id, _B11} =
                                                    protocol:uint16(_B10),
                                                {V2_name, _B12} =
                                                    protocol:string(_B11),
                                                {V2_classes, _B13} =
                                                    protocol:uint8(_B12),
                                                {V2_sex, _B14} =
                                                    protocol:uint8(_B13),
                                                {V2_lev, _B15} =
                                                    protocol:uint16(_B14),
                                                {V2_break_times, _B16} =
                                                    protocol:uint8(_B15),
                                                {V2_position, _B17} =
                                                    protocol:uint8(_B16),
                                                {V2_fight_capacity, _B18} =
                                                    protocol:uint32(_B17),
                                                {{V2_tid,
                                                  V2_platform,
                                                  V2_zone_id,
                                                  V2_name,
                                                  V2_classes,
                                                  V2_sex,
                                                  V2_lev,
                                                  V2_break_times,
                                                  V2_position,
                                                  V2_fight_capacity},
                                                 _B18}
                                        end),
    {V1_fight_capacity, _B21} = protocol:uint32(_B20),
    {V1_applys, _B34} = protocol:array(_B21,
                                       fun (_B22) ->
                                               {V2_tid, _B23} =
                                                   protocol:uint32(_B22),
                                               {V2_platform, _B24} =
                                                   protocol:string(_B23),
                                               {V2_zone_id, _B25} =
                                                   protocol:uint16(_B24),
                                               {V2_name, _B26} =
                                                   protocol:string(_B25),
                                               {V2_classes, _B27} =
                                                   protocol:uint8(_B26),
                                               {V2_sex, _B28} =
                                                   protocol:uint8(_B27),
                                               {V2_lev, _B29} =
                                                   protocol:uint16(_B28),
                                               {V2_break_times, _B30} =
                                                   protocol:uint8(_B29),
                                               {V2_position, _B31} =
                                                   protocol:uint8(_B30),
                                               {V2_fight_capacity, _B32} =
                                                   protocol:uint32(_B31),
                                               {{V2_tid,
                                                 V2_platform,
                                                 V2_zone_id,
                                                 V2_name,
                                                 V2_classes,
                                                 V2_sex,
                                                 V2_lev,
                                                 V2_break_times,
                                                 V2_position,
                                                 V2_fight_capacity},
                                                _B32}
                                       end),
    {V1_declaration, _B35} = protocol:string(_B34),
    {V1_win_times, _B36} = protocol:uint8(_B35),
    {V1_loss_times, _B37} = protocol:uint8(_B36),
    {V1_qualification, _B38} = protocol:uint32(_B37),
    {V1_team_group_256, _B39} = protocol:uint32(_B38),
    {V1_team_group_64, _B40} = protocol:uint32(_B39),
    {V1_team_group_8, _B41} = protocol:uint32(_B40),
    {V1_team_group_4, _B42} = protocol:uint32(_B41),
    {V1_team_seq, _B43} = protocol:uint8(_B42),
    {V1_team_index, _B44} = protocol:uint16(_B43),
    {ok,
     {V1_flag,
      V1_tid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_lev,
      V1_match_group,
      V1_members,
      V1_fight_capacity,
      V1_applys,
      V1_declaration,
      V1_win_times,
      V1_loss_times,
      V1_qualification,
      V1_team_group_256,
      V1_team_group_64,
      V1_team_group_8,
      V1_team_group_4,
      V1_team_seq,
      V1_team_index}};
unpack(srv, 17919, _B0) -> {ok, {}};
unpack(cli, 17919, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17920, _B0) -> {ok, {}};
unpack(cli, 17920, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17921, _B0) -> {ok, {}};
unpack(cli, 17921, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17922, _B0) -> {ok, {}};
unpack(cli, 17922, _B0) ->
    {V1_tid_1, _B1} = protocol:uint32(_B0),
    {V1_platform_1, _B2} = protocol:string(_B1),
    {V1_id_1, _B3} = protocol:uint16(_B2),
    {V1_team_name_1, _B4} = protocol:string(_B3),
    {V1_status_1, _B5} = protocol:uint8(_B4),
    {V1_tid_2, _B6} = protocol:uint32(_B5),
    {V1_platform_2, _B7} = protocol:string(_B6),
    {V1_id_2, _B8} = protocol:uint16(_B7),
    {V1_team_name_2, _B9} = protocol:string(_B8),
    {V1_status_2, _B10} = protocol:uint8(_B9),
    {ok,
     {V1_tid_1,
      V1_platform_1,
      V1_id_1,
      V1_team_name_1,
      V1_status_1,
      V1_tid_2,
      V1_platform_2,
      V1_id_2,
      V1_team_name_2,
      V1_status_2}};
unpack(srv, 17923, _B0) -> {ok, {}};
unpack(cli, 17923, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_state, _B2} = protocol:uint8(_B1),
    {V1_left_time, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_state, V1_left_time}};
unpack(srv, 17924, _B0) -> {ok, {}};
unpack(cli, 17924, _B0) ->
    {V1_team_list, _B24} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_tid, _B2} =
                                                      protocol:uint32(_B1),
                                                  {V2_platform, _B3} =
                                                      protocol:string(_B2),
                                                  {V2_zone_id, _B4} =
                                                      protocol:uint16(_B3),
                                                  {V2_name, _B5} =
                                                      protocol:string(_B4),
                                                  {V2_lev, _B6} =
                                                      protocol:uint8(_B5),
                                                  {V2_member_num, _B7} =
                                                      protocol:uint8(_B6),
                                                  {V2_team_group_256, _B8} =
                                                      protocol:uint32(_B7),
                                                  {V2_team_group_64, _B9} =
                                                      protocol:uint32(_B8),
                                                  {V2_members, _B22} =
                                                      protocol:array(_B9,
                                                                     fun
                                                                         (_B10) ->
                                                                             {V3_tid,
                                                                              _B11} =
                                                                                 protocol:uint32(_B10),
                                                                             {V3_platform,
                                                                              _B12} =
                                                                                 protocol:string(_B11),
                                                                             {V3_zone_id,
                                                                              _B13} =
                                                                                 protocol:uint16(_B12),
                                                                             {V3_name,
                                                                              _B14} =
                                                                                 protocol:string(_B13),
                                                                             {V3_classes,
                                                                              _B15} =
                                                                                 protocol:uint8(_B14),
                                                                             {V3_sex,
                                                                              _B16} =
                                                                                 protocol:uint8(_B15),
                                                                             {V3_lev,
                                                                              _B17} =
                                                                                 protocol:uint16(_B16),
                                                                             {V3_break_times,
                                                                              _B18} =
                                                                                 protocol:uint8(_B17),
                                                                             {V3_position,
                                                                              _B19} =
                                                                                 protocol:uint8(_B18),
                                                                             {V3_fight_capacity,
                                                                              _B20} =
                                                                                 protocol:uint32(_B19),
                                                                             {{V3_tid,
                                                                               V3_platform,
                                                                               V3_zone_id,
                                                                               V3_name,
                                                                               V3_classes,
                                                                               V3_sex,
                                                                               V3_lev,
                                                                               V3_break_times,
                                                                               V3_position,
                                                                               V3_fight_capacity},
                                                                              _B20}
                                                                     end),
                                                  {{V2_tid,
                                                    V2_platform,
                                                    V2_zone_id,
                                                    V2_name,
                                                    V2_lev,
                                                    V2_member_num,
                                                    V2_team_group_256,
                                                    V2_team_group_64,
                                                    V2_members},
                                                   _B22}
                                          end),
    {ok, {V1_team_list}};
unpack(srv, 17925, _B0) ->
    {V1_zone_id, _B1} = protocol:uint8(_B0),
    {ok, {V1_zone_id}};
unpack(cli, 17925, _B0) ->
    {V1_zone_id, _B1} = protocol:uint8(_B0),
    {V1_team_list, _B25} = protocol:array(_B1,
                                          fun (_B2) ->
                                                  {V2_tid, _B3} =
                                                      protocol:uint32(_B2),
                                                  {V2_platform, _B4} =
                                                      protocol:string(_B3),
                                                  {V2_zone_id, _B5} =
                                                      protocol:uint16(_B4),
                                                  {V2_name, _B6} =
                                                      protocol:string(_B5),
                                                  {V2_lev, _B7} =
                                                      protocol:uint8(_B6),
                                                  {V2_member_num, _B8} =
                                                      protocol:uint8(_B7),
                                                  {V2_qualification, _B9} =
                                                      protocol:uint32(_B8),
                                                  {V2_team_group_64, _B10} =
                                                      protocol:uint32(_B9),
                                                  {V2_members, _B23} =
                                                      protocol:array(_B10,
                                                                     fun
                                                                         (_B11) ->
                                                                             {V3_tid,
                                                                              _B12} =
                                                                                 protocol:uint32(_B11),
                                                                             {V3_platform,
                                                                              _B13} =
                                                                                 protocol:string(_B12),
                                                                             {V3_zone_id,
                                                                              _B14} =
                                                                                 protocol:uint16(_B13),
                                                                             {V3_name,
                                                                              _B15} =
                                                                                 protocol:string(_B14),
                                                                             {V3_classes,
                                                                              _B16} =
                                                                                 protocol:uint8(_B15),
                                                                             {V3_sex,
                                                                              _B17} =
                                                                                 protocol:uint8(_B16),
                                                                             {V3_lev,
                                                                              _B18} =
                                                                                 protocol:uint16(_B17),
                                                                             {V3_break_times,
                                                                              _B19} =
                                                                                 protocol:uint8(_B18),
                                                                             {V3_position,
                                                                              _B20} =
                                                                                 protocol:uint8(_B19),
                                                                             {V3_fight_capacity,
                                                                              _B21} =
                                                                                 protocol:uint32(_B20),
                                                                             {{V3_tid,
                                                                               V3_platform,
                                                                               V3_zone_id,
                                                                               V3_name,
                                                                               V3_classes,
                                                                               V3_sex,
                                                                               V3_lev,
                                                                               V3_break_times,
                                                                               V3_position,
                                                                               V3_fight_capacity},
                                                                              _B21}
                                                                     end),
                                                  {{V2_tid,
                                                    V2_platform,
                                                    V2_zone_id,
                                                    V2_name,
                                                    V2_lev,
                                                    V2_member_num,
                                                    V2_qualification,
                                                    V2_team_group_64,
                                                    V2_members},
                                                   _B23}
                                          end),
    {ok, {V1_zone_id, V1_team_list}};
unpack(srv, 17926, _B0) -> {ok, {}};
unpack(cli, 17926, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_mates, _B18} = protocol:array(_B1,
                                      fun (_B2) ->
                                              {V2_rid, _B3} =
                                                  protocol:uint32(_B2),
                                              {V2_platform, _B4} =
                                                  protocol:string(_B3),
                                              {V2_zone_id, _B5} =
                                                  protocol:uint32(_B4),
                                              {V2_name, _B6} =
                                                  protocol:string(_B5),
                                              {V2_sex, _B7} =
                                                  protocol:uint8(_B6),
                                              {V2_classes, _B8} =
                                                  protocol:uint8(_B7),
                                              {V2_lev, _B9} =
                                                  protocol:uint8(_B8),
                                              {V2_total_hurt, _B10} =
                                                  protocol:uint32(_B9),
                                              {V2_total_dmg, _B11} =
                                                  protocol:uint32(_B10),
                                              {V2_total_heal, _B12} =
                                                  protocol:uint32(_B11),
                                              {V2_kill_num, _B13} =
                                                  protocol:uint16(_B12),
                                              {V2_dead_num, _B14} =
                                                  protocol:uint16(_B13),
                                              {V2_control_num, _B15} =
                                                  protocol:uint16(_B14),
                                              {V2_mvp_score, _B16} =
                                                  protocol:uint16(_B15),
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
                                               _B16}
                                      end),
    {V1_rival, _B35} = protocol:array(_B18,
                                      fun (_B19) ->
                                              {V2_rid, _B20} =
                                                  protocol:uint32(_B19),
                                              {V2_platform, _B21} =
                                                  protocol:string(_B20),
                                              {V2_zone_id, _B22} =
                                                  protocol:uint32(_B21),
                                              {V2_name, _B23} =
                                                  protocol:string(_B22),
                                              {V2_sex, _B24} =
                                                  protocol:uint8(_B23),
                                              {V2_classes, _B25} =
                                                  protocol:uint8(_B24),
                                              {V2_lev, _B26} =
                                                  protocol:uint8(_B25),
                                              {V2_total_hurt, _B27} =
                                                  protocol:uint32(_B26),
                                              {V2_total_dmg, _B28} =
                                                  protocol:uint32(_B27),
                                              {V2_total_heal, _B29} =
                                                  protocol:uint32(_B28),
                                              {V2_kill_num, _B30} =
                                                  protocol:uint16(_B29),
                                              {V2_dead_num, _B31} =
                                                  protocol:uint16(_B30),
                                              {V2_control_num, _B32} =
                                                  protocol:uint16(_B31),
                                              {V2_mvp_score, _B33} =
                                                  protocol:uint16(_B32),
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
                                               _B33}
                                      end),
    {ok, {V1_result, V1_mates, V1_rival}};
unpack(srv, 17927, _B0) -> {ok, {}};
unpack(cli, 17927, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17928, _B0) ->
    {V1_season_id, _B1} = protocol:uint32(_B0),
    {V1_group_id, _B2} = protocol:uint32(_B1),
    {V1_watch_type, _B3} = protocol:uint32(_B2),
    {ok, {V1_season_id, V1_group_id, V1_watch_type}};
unpack(cli, 17928, _B0) ->
    {V1_gods_duel_match_profile, _B13} = protocol:array(_B0,
                                                        fun (_B1) ->
                                                                {V2_id, _B2} =
                                                                    protocol:uint32(_B1),
                                                                {V2_season_id,
                                                                 _B3} =
                                                                    protocol:uint16(_B2),
                                                                {V2_match_round,
                                                                 _B4} =
                                                                    protocol:uint8(_B3),
                                                                {V2_match_type,
                                                                 _B5} =
                                                                    protocol:uint8(_B4),
                                                                {V2_combat_type,
                                                                 _B6} =
                                                                    protocol:uint8(_B5),
                                                                {V2_group_id,
                                                                 _B7} =
                                                                    protocol:uint8(_B6),
                                                                {V2_is_over,
                                                                 _B8} =
                                                                    protocol:uint8(_B7),
                                                                {V2_atk_name,
                                                                 _B9} =
                                                                    protocol:string(_B8),
                                                                {V2_dfd_name,
                                                                 _B10} =
                                                                    protocol:string(_B9),
                                                                {V2_time,
                                                                 _B11} =
                                                                    protocol:uint32(_B10),
                                                                {{V2_id,
                                                                  V2_season_id,
                                                                  V2_match_round,
                                                                  V2_match_type,
                                                                  V2_combat_type,
                                                                  V2_group_id,
                                                                  V2_is_over,
                                                                  V2_atk_name,
                                                                  V2_dfd_name,
                                                                  V2_time},
                                                                 _B11}
                                                        end),
    {V1_platform, _B14} = protocol:string(_B13),
    {V1_zone_id, _B15} = protocol:uint32(_B14),
    {ok,
     {V1_gods_duel_match_profile, V1_platform, V1_zone_id}};
unpack(srv, 17929, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 17929, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17930, _B0) -> {ok, {}};
unpack(cli, 17930, _B0) ->
    {V1_gods_duel_vote_choice, _B8} = protocol:array(_B0,
                                                     fun (_B1) ->
                                                             {V2_tid, _B2} =
                                                                 protocol:uint32(_B1),
                                                             {V2_platform,
                                                              _B3} =
                                                                 protocol:string(_B2),
                                                             {V2_zone_id, _B4} =
                                                                 protocol:uint16(_B3),
                                                             {V2_match_round,
                                                              _B5} =
                                                                 protocol:uint8(_B4),
                                                             {V2_is_right,
                                                              _B6} =
                                                                 protocol:uint8(_B5),
                                                             {{V2_tid,
                                                               V2_platform,
                                                               V2_zone_id,
                                                               V2_match_round,
                                                               V2_is_right},
                                                              _B6}
                                                     end),
    {V1_gods_duel_poll, _B15} = protocol:array(_B8,
                                               fun (_B9) ->
                                                       {V2_tid, _B10} =
                                                           protocol:uint32(_B9),
                                                       {V2_platform, _B11} =
                                                           protocol:string(_B10),
                                                       {V2_zone_id, _B12} =
                                                           protocol:uint16(_B11),
                                                       {V2_voted_cnt, _B13} =
                                                           protocol:uint32(_B12),
                                                       {{V2_tid,
                                                         V2_platform,
                                                         V2_zone_id,
                                                         V2_voted_cnt},
                                                        _B13}
                                               end),
    {ok, {V1_gods_duel_vote_choice, V1_gods_duel_poll}};
unpack(srv, 17931, _B0) ->
    {V1_match_zone, _B1} = protocol:uint8(_B0),
    {V1_id, _B7} = protocol:array(_B1,
                                  fun (_B2) ->
                                          {V2_tid, _B3} = protocol:uint32(_B2),
                                          {V2_platform, _B4} =
                                              protocol:string(_B3),
                                          {V2_zone_id, _B5} =
                                              protocol:uint16(_B4),
                                          {{V2_tid, V2_platform, V2_zone_id},
                                           _B5}
                                  end),
    {ok, {V1_match_zone, V1_id}};
unpack(cli, 17931, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17932, _B0) ->
    {V1_zone_id, _B1} = protocol:uint8(_B0),
    {V1_season_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_zone_id, V1_season_id}};
unpack(cli, 17932, _B0) ->
    {V1_zone_id, _B1} = protocol:uint8(_B0),
    {V1_season_id, _B2} = protocol:uint32(_B1),
    {V1_team_list, _B26} = protocol:array(_B2,
                                          fun (_B3) ->
                                                  {V2_tid, _B4} =
                                                      protocol:uint32(_B3),
                                                  {V2_platform, _B5} =
                                                      protocol:string(_B4),
                                                  {V2_zone_id, _B6} =
                                                      protocol:uint16(_B5),
                                                  {V2_name, _B7} =
                                                      protocol:string(_B6),
                                                  {V2_lev, _B8} =
                                                      protocol:uint8(_B7),
                                                  {V2_member_num, _B9} =
                                                      protocol:uint8(_B8),
                                                  {V2_qualification, _B10} =
                                                      protocol:uint32(_B9),
                                                  {V2_team_group_64, _B11} =
                                                      protocol:uint32(_B10),
                                                  {V2_members, _B24} =
                                                      protocol:array(_B11,
                                                                     fun
                                                                         (_B12) ->
                                                                             {V3_tid,
                                                                              _B13} =
                                                                                 protocol:uint32(_B12),
                                                                             {V3_platform,
                                                                              _B14} =
                                                                                 protocol:string(_B13),
                                                                             {V3_zone_id,
                                                                              _B15} =
                                                                                 protocol:uint16(_B14),
                                                                             {V3_name,
                                                                              _B16} =
                                                                                 protocol:string(_B15),
                                                                             {V3_classes,
                                                                              _B17} =
                                                                                 protocol:uint8(_B16),
                                                                             {V3_sex,
                                                                              _B18} =
                                                                                 protocol:uint8(_B17),
                                                                             {V3_lev,
                                                                              _B19} =
                                                                                 protocol:uint16(_B18),
                                                                             {V3_break_times,
                                                                              _B20} =
                                                                                 protocol:uint8(_B19),
                                                                             {V3_position,
                                                                              _B21} =
                                                                                 protocol:uint8(_B20),
                                                                             {V3_fight_capacity,
                                                                              _B22} =
                                                                                 protocol:uint32(_B21),
                                                                             {{V3_tid,
                                                                               V3_platform,
                                                                               V3_zone_id,
                                                                               V3_name,
                                                                               V3_classes,
                                                                               V3_sex,
                                                                               V3_lev,
                                                                               V3_break_times,
                                                                               V3_position,
                                                                               V3_fight_capacity},
                                                                              _B22}
                                                                     end),
                                                  {{V2_tid,
                                                    V2_platform,
                                                    V2_zone_id,
                                                    V2_name,
                                                    V2_lev,
                                                    V2_member_num,
                                                    V2_qualification,
                                                    V2_team_group_64,
                                                    V2_members},
                                                   _B24}
                                          end),
    {ok, {V1_zone_id, V1_season_id, V1_team_list}};
unpack(srv, 17933, _B0) ->
    {V1_season_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_season_id}};
unpack(cli, 17933, _B0) ->
    {V1_season_id, _B1} = protocol:uint32(_B0),
    {V1_season_time, _B7} = protocol:array(_B1,
                                           fun (_B2) ->
                                                   {V2_state_code, _B3} =
                                                       protocol:uint8(_B2),
                                                   {V2_start_time, _B4} =
                                                       protocol:uint32(_B3),
                                                   {V2_end_time, _B5} =
                                                       protocol:uint32(_B4),
                                                   {{V2_state_code,
                                                     V2_start_time,
                                                     V2_end_time},
                                                    _B5}
                                           end),
    {ok, {V1_season_id, V1_season_time}};
unpack(srv, 17934, _B0) -> {ok, {}};
unpack(cli, 17934, _B0) ->
    {V1_rank_info, _B14} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_rank, _B2} =
                                                      protocol:uint32(_B1),
                                                  {V2_name, _B3} =
                                                      protocol:string(_B2),
                                                  {V2_star, _B4} =
                                                      protocol:uint32(_B3),
                                                  {V2_need_score, _B5} =
                                                      protocol:uint32(_B4),
                                                  {V2_reward, _B11} =
                                                      protocol:array(_B5,
                                                                     fun
                                                                         (_B6) ->
                                                                             {V3_id,
                                                                              _B7} =
                                                                                 protocol:uint32(_B6),
                                                                             {V3_bound,
                                                                              _B8} =
                                                                                 protocol:uint8(_B7),
                                                                             {V3_value,
                                                                              _B9} =
                                                                                 protocol:uint32(_B8),
                                                                             {{V3_id,
                                                                               V3_bound,
                                                                               V3_value},
                                                                              _B9}
                                                                     end),
                                                  {V2_badge_id, _B12} =
                                                      protocol:uint32(_B11),
                                                  {{V2_rank,
                                                    V2_name,
                                                    V2_star,
                                                    V2_need_score,
                                                    V2_reward,
                                                    V2_badge_id},
                                                   _B12}
                                          end),
    {ok, {V1_rank_info}};
unpack(srv, 17935, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 17935, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_rank_lev, _B4} = protocol:uint32(_B3),
    {V1_gods_duel_score, _B5} = protocol:uint32(_B4),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_rank_lev,
      V1_gods_duel_score}};
unpack(srv, 17936, _B0) -> {ok, {}};
unpack(cli, 17936, _B0) ->
    {V1_rank_lev, _B1} = protocol:uint32(_B0),
    {V1_gods_duel_score, _B2} = protocol:uint32(_B1),
    {ok, {V1_rank_lev, V1_gods_duel_score}};
unpack(srv, 17937, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_group, _B2} = protocol:uint8(_B1),
    {ok, {V1_type, V1_group}};
unpack(cli, 17937, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_group, _B2} = protocol:uint8(_B1),
    {V1_rank, _B13} = protocol:array(_B2,
                                     fun (_B3) ->
                                             {V2_rid, _B4} =
                                                 protocol:uint32(_B3),
                                             {V2_platform, _B5} =
                                                 protocol:string(_B4),
                                             {V2_zone_id, _B6} =
                                                 protocol:uint32(_B5),
                                             {V2_name, _B7} =
                                                 protocol:string(_B6),
                                             {V2_sex, _B8} =
                                                 protocol:uint8(_B7),
                                             {V2_classes, _B9} =
                                                 protocol:uint8(_B8),
                                             {V2_rank_lev, _B10} =
                                                 protocol:uint8(_B9),
                                             {V2_gods_duel_score, _B11} =
                                                 protocol:uint16(_B10),
                                             {{V2_rid,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_name,
                                               V2_sex,
                                               V2_classes,
                                               V2_rank_lev,
                                               V2_gods_duel_score},
                                              _B11}
                                     end),
    {ok, {V1_type, V1_group, V1_rank}};
unpack(srv, 17938, _B0) -> {ok, {}};
unpack(cli, 17938, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_end_time, _B2} = protocol:uint32(_B1),
    {ok, {V1_status, V1_end_time}};
unpack(srv, 17939, _B0) -> {ok, {}};
unpack(cli, 17939, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17940, _B0) -> {ok, {}};
unpack(cli, 17940, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17941, _B0) -> {ok, {}};
unpack(cli, 17941, _B0) ->
    {V1_champion_teams, _B27} = protocol:array(_B0,
                                               fun (_B1) ->
                                                       {V2_tid, _B2} =
                                                           protocol:uint32(_B1),
                                                       {V2_platfrom, _B3} =
                                                           protocol:string(_B2),
                                                       {V2_zone_id, _B4} =
                                                           protocol:uint32(_B3),
                                                       {V2_name, _B5} =
                                                           protocol:string(_B4),
                                                       {V2_lev, _B6} =
                                                           protocol:uint32(_B5),
                                                       {V2_members, _B24} =
                                                           protocol:array(_B6,
                                                                          fun
                                                                              (_B7) ->
                                                                                  {V3_rid,
                                                                                   _B8} =
                                                                                      protocol:uint32(_B7),
                                                                                  {V3_platfrom,
                                                                                   _B9} =
                                                                                      protocol:string(_B8),
                                                                                  {V3_zone_id,
                                                                                   _B10} =
                                                                                      protocol:uint32(_B9),
                                                                                  {V3_name,
                                                                                   _B11} =
                                                                                      protocol:string(_B10),
                                                                                  {V3_lev,
                                                                                   _B12} =
                                                                                      protocol:uint32(_B11),
                                                                                  {V3_sex,
                                                                                   _B13} =
                                                                                      protocol:uint8(_B12),
                                                                                  {V3_classes,
                                                                                   _B14} =
                                                                                      protocol:uint8(_B13),
                                                                                  {V3_break_times,
                                                                                   _B15} =
                                                                                      protocol:uint8(_B14),
                                                                                  {V3_looks,
                                                                                   _B22} =
                                                                                      protocol:array(_B15,
                                                                                                     fun
                                                                                                         (_B16) ->
                                                                                                             {V4_looks_type,
                                                                                                              _B17} =
                                                                                                                 protocol:uint32(_B16),
                                                                                                             {V4_looks_mode,
                                                                                                              _B18} =
                                                                                                                 protocol:uint32(_B17),
                                                                                                             {V4_looks_val,
                                                                                                              _B19} =
                                                                                                                 protocol:uint32(_B18),
                                                                                                             {V4_looks_str,
                                                                                                              _B20} =
                                                                                                                 protocol:string(_B19),
                                                                                                             {{V4_looks_type,
                                                                                                               V4_looks_mode,
                                                                                                               V4_looks_val,
                                                                                                               V4_looks_str},
                                                                                                              _B20}
                                                                                                     end),
                                                                                  {{V3_rid,
                                                                                    V3_platfrom,
                                                                                    V3_zone_id,
                                                                                    V3_name,
                                                                                    V3_lev,
                                                                                    V3_sex,
                                                                                    V3_classes,
                                                                                    V3_break_times,
                                                                                    V3_looks},
                                                                                   _B22}
                                                                          end),
                                                       {V2_serial_id, _B25} =
                                                           protocol:uint32(_B24),
                                                       {{V2_tid,
                                                         V2_platfrom,
                                                         V2_zone_id,
                                                         V2_name,
                                                         V2_lev,
                                                         V2_members,
                                                         V2_serial_id},
                                                        _B25}
                                               end),
    {ok, {V1_champion_teams}};
unpack(srv, 17942, _B0) -> {ok, {}};
unpack(cli, 17942, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17943, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_value, _B2} = protocol:uint8(_B1),
    {ok, {V1_type, V1_value}};
unpack(cli, 17943, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_value, _B2} = protocol:uint8(_B1),
    {V1_flag, _B3} = protocol:uint8(_B2),
    {V1_msg, _B4} = protocol:string(_B3),
    {ok, {V1_type, V1_value, V1_flag, V1_msg}};
unpack(srv, 17944, _B0) ->
    {V1_msg, _B1} = protocol:string(_B0),
    {ok, {V1_msg}};
unpack(cli, 17944, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17945, _B0) -> {ok, {}};
unpack(cli, 17945, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg_list, _B6} = protocol:array(_B1,
                                        fun (_B2) ->
                                                {V2_msg_id, _B3} =
                                                    protocol:uint32(_B2),
                                                {V2_msg, _B4} =
                                                    protocol:string(_B3),
                                                {{V2_msg_id, V2_msg}, _B4}
                                        end),
    {ok, {V1_err_code, V1_msg_list}};
unpack(srv, 17946, _B0) -> {ok, {}};
unpack(cli, 17946, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_start_time, _B2} = protocol:uint32(_B1),
    {V1_next_round, _B3} = protocol:uint32(_B2),
    {V1_all_round, _B4} = protocol:uint32(_B3),
    {V1_msg, _B5} = protocol:string(_B4),
    {ok,
     {V1_err_code,
      V1_start_time,
      V1_next_round,
      V1_all_round,
      V1_msg}};
unpack(srv, 17947, _B0) -> {ok, {}};
unpack(cli, 17947, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(srv, 17948, _B0) -> {ok, {}};
unpack(cli, 17948, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(srv, 17949, _B0) -> {ok, {}};
unpack(cli, 17949, _B0) -> {ok, {}};
unpack(srv, 17950, _B0) -> {ok, {}};
unpack(cli, 17950, _B0) ->
    {V1_video_list, _B17} = protocol:array(_B0,
                                           fun (_B1) ->
                                                   {V2_list_id, _B2} =
                                                       protocol:uint8(_B1),
                                                   {V2_gods_duel_video, _B15} =
                                                       protocol:array(_B2,
                                                                      fun
                                                                          (_B3) ->
                                                                              {V3_id,
                                                                               _B4} =
                                                                                  protocol:uint32(_B3),
                                                                              {V3_platform,
                                                                               _B5} =
                                                                                  protocol:string(_B4),
                                                                              {V3_zone_id,
                                                                               _B6} =
                                                                                  protocol:uint32(_B5),
                                                                              {V3_season_id,
                                                                               _B7} =
                                                                                  protocol:uint16(_B6),
                                                                              {V3_match_round,
                                                                               _B8} =
                                                                                  protocol:uint8(_B7),
                                                                              {V3_group_id,
                                                                               _B9} =
                                                                                  protocol:uint8(_B8),
                                                                              {V3_atk_name,
                                                                               _B10} =
                                                                                  protocol:string(_B9),
                                                                              {V3_dfd_name,
                                                                               _B11} =
                                                                                  protocol:string(_B10),
                                                                              {V3_time,
                                                                               _B12} =
                                                                                  protocol:uint32(_B11),
                                                                              {V3_replayed,
                                                                               _B13} =
                                                                                  protocol:uint32(_B12),
                                                                              {{V3_id,
                                                                                V3_platform,
                                                                                V3_zone_id,
                                                                                V3_season_id,
                                                                                V3_match_round,
                                                                                V3_group_id,
                                                                                V3_atk_name,
                                                                                V3_dfd_name,
                                                                                V3_time,
                                                                                V3_replayed},
                                                                               _B13}
                                                                      end),
                                                   {{V2_list_id,
                                                     V2_gods_duel_video},
                                                    _B15}
                                           end),
    {ok, {V1_video_list}};
unpack(srv, 17951, _B0) -> {ok, {}};
unpack(cli, 17951, _B0) ->
    {V1_gods_duel_champion_videos, _B13} =
        protocol:array(_B0,
                       fun (_B1) ->
                               {V2_id, _B2} = protocol:uint32(_B1),
                               {V2_platform, _B3} = protocol:string(_B2),
                               {V2_zone_id, _B4} = protocol:uint32(_B3),
                               {V2_season_id, _B5} = protocol:uint16(_B4),
                               {V2_match_round, _B6} = protocol:uint8(_B5),
                               {V2_group_id, _B7} = protocol:uint8(_B6),
                               {V2_atk_name, _B8} = protocol:string(_B7),
                               {V2_dfd_name, _B9} = protocol:string(_B8),
                               {V2_time, _B10} = protocol:uint32(_B9),
                               {V2_replayed, _B11} = protocol:uint32(_B10),
                               {{V2_id,
                                 V2_platform,
                                 V2_zone_id,
                                 V2_season_id,
                                 V2_match_round,
                                 V2_group_id,
                                 V2_atk_name,
                                 V2_dfd_name,
                                 V2_time,
                                 V2_replayed},
                                _B11}
                       end),
    {ok, {V1_gods_duel_champion_videos}};
unpack(srv, 17952, _B0) -> {ok, {}};
unpack(cli, 17952, _B0) ->
    {V1_end_time, _B1} = protocol:uint32(_B0),
    {ok, {V1_end_time}};
unpack(srv, 17953, _B0) -> {ok, {}};
unpack(cli, 17953, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(srv, 17954, _B0) -> {ok, {}};
unpack(cli, 17954, _B0) ->
    {V1_first_time, _B1} = protocol:uint32(_B0),
    {V1_manual_time, _B2} = protocol:uint32(_B1),
    {ok, {V1_first_time, V1_manual_time}};
unpack(srv, 17955, _B0) -> {ok, {}};
unpack(cli, 17955, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {ok, {V1_err_code}};
unpack(srv, 17956, _B0) -> {ok, {}};
unpack(cli, 17956, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {ok, {V1_status}};
unpack(srv, 17957, _B0) ->
    {V1_season_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_season_id}};
unpack(cli, 17957, _B0) ->
    {V1_hp_percent, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_hp_percent, V1_id}};
unpack(srv, 17958, _B0) -> {ok, {}};
unpack(cli, 17958, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_times, _B2} = protocol:uint32(_B1),
    {V1_mates, _B14} = protocol:array(_B2,
                                      fun (_B3) ->
                                              {V2_rid, _B4} =
                                                  protocol:uint32(_B3),
                                              {V2_platform, _B5} =
                                                  protocol:string(_B4),
                                              {V2_zone_id, _B6} =
                                                  protocol:uint32(_B5),
                                              {V2_name, _B7} =
                                                  protocol:string(_B6),
                                              {V2_sex, _B8} =
                                                  protocol:uint8(_B7),
                                              {V2_classes, _B9} =
                                                  protocol:uint8(_B8),
                                              {V2_lev, _B10} =
                                                  protocol:uint8(_B9),
                                              {V2_total_dmg, _B11} =
                                                  protocol:uint32(_B10),
                                              {V2_total_heal, _B12} =
                                                  protocol:uint32(_B11),
                                              {{V2_rid,
                                                V2_platform,
                                                V2_zone_id,
                                                V2_name,
                                                V2_sex,
                                                V2_classes,
                                                V2_lev,
                                                V2_total_dmg,
                                                V2_total_heal},
                                               _B12}
                                      end),
    {ok, {V1_result, V1_times, V1_mates}};
unpack(srv, 17959, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 17959, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17960, _B0) -> {ok, {}};
unpack(cli, 17960, _B0) ->
    {V1_has_reward, _B1} = protocol:uint8(_B0),
    {ok, {V1_has_reward}};
unpack(srv, 17961, _B0) -> {ok, {}};
unpack(cli, 17961, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17962, _B0) -> {ok, {}};
unpack(cli, 17962, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_team_name, _B2} = protocol:string(_B1),
    {ok, {V1_status, V1_team_name}};
unpack(srv, 17963, _B0) ->
    {V1_choice, _B1} = protocol:uint8(_B0),
    {ok, {V1_choice}};
unpack(cli, 17963, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 17964, _B0) -> {ok, {}};
unpack(cli, 17964, _B0) ->
    {V1_support_num, _B1} = protocol:uint32(_B0),
    {V1_unsupport_num, _B2} = protocol:uint32(_B1),
    {V1_unknow_num, _B3} = protocol:uint32(_B2),
    {V1_observer_num, _B4} = protocol:uint32(_B3),
    {V1_wave, _B5} = protocol:uint32(_B4),
    {V1_boss_id, _B6} = protocol:uint32(_B5),
    {V1_boss_hp_percent, _B7} = protocol:uint32(_B6),
    {ok,
     {V1_support_num,
      V1_unsupport_num,
      V1_unknow_num,
      V1_observer_num,
      V1_wave,
      V1_boss_id,
      V1_boss_hp_percent}};
unpack(srv, 17965, _B0) -> {ok, {}};
unpack(cli, 17965, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_start_time, _B2} = protocol:uint32(_B1),
    {ok, {V1_err_code, V1_start_time}};
unpack(srv, 17966, _B0) -> {ok, {}};
unpack(cli, 17966, _B0) ->
    {V1_start_time, _B1} = protocol:uint32(_B0),
    {ok, {V1_start_time}};
unpack(srv, 17967, _B0) -> {ok, {}};
unpack(cli, 17967, _B0) ->
    {V1_champion_teams, _B22} = protocol:array(_B0,
                                               fun (_B1) ->
                                                       {V2_tid, _B2} =
                                                           protocol:uint32(_B1),
                                                       {V2_platfrom, _B3} =
                                                           protocol:string(_B2),
                                                       {V2_zone_id, _B4} =
                                                           protocol:uint32(_B3),
                                                       {V2_name, _B5} =
                                                           protocol:string(_B4),
                                                       {V2_lev, _B6} =
                                                           protocol:uint32(_B5),
                                                       {V2_match_group, _B7} =
                                                           protocol:uint8(_B6),
                                                       {V2_members, _B20} =
                                                           protocol:array(_B7,
                                                                          fun
                                                                              (_B8) ->
                                                                                  {V3_rid,
                                                                                   _B9} =
                                                                                      protocol:uint32(_B8),
                                                                                  {V3_platfrom,
                                                                                   _B10} =
                                                                                      protocol:string(_B9),
                                                                                  {V3_zone_id,
                                                                                   _B11} =
                                                                                      protocol:uint32(_B10),
                                                                                  {V3_fight_capacity,
                                                                                   _B12} =
                                                                                      protocol:uint32(_B11),
                                                                                  {V3_position,
                                                                                   _B13} =
                                                                                      protocol:uint8(_B12),
                                                                                  {V3_name,
                                                                                   _B14} =
                                                                                      protocol:string(_B13),
                                                                                  {V3_lev,
                                                                                   _B15} =
                                                                                      protocol:uint32(_B14),
                                                                                  {V3_sex,
                                                                                   _B16} =
                                                                                      protocol:uint8(_B15),
                                                                                  {V3_classes,
                                                                                   _B17} =
                                                                                      protocol:uint8(_B16),
                                                                                  {V3_break_times,
                                                                                   _B18} =
                                                                                      protocol:uint8(_B17),
                                                                                  {{V3_rid,
                                                                                    V3_platfrom,
                                                                                    V3_zone_id,
                                                                                    V3_fight_capacity,
                                                                                    V3_position,
                                                                                    V3_name,
                                                                                    V3_lev,
                                                                                    V3_sex,
                                                                                    V3_classes,
                                                                                    V3_break_times},
                                                                                   _B18}
                                                                          end),
                                                       {{V2_tid,
                                                         V2_platfrom,
                                                         V2_zone_id,
                                                         V2_name,
                                                         V2_lev,
                                                         V2_match_group,
                                                         V2_members},
                                                        _B20}
                                               end),
    {ok, {V1_champion_teams}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

