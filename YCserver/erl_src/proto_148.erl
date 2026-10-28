-file("src/proto/proto_148.erl", 1).

-module(proto_148).

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

-file("src/proto/proto_148.erl", 14).

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

-file("src/proto/proto_148.erl", 15).

-file("inc/classes_challenge.hrl", 1).

-record(m_classes_challenge,
        {ver = 2,
         id = 0 :: integer(),
         round = 0 :: integer(),
         done_list = [] :: list(),
         rewarded = [] :: list(),
         last_accepted = 0 :: integer(),
         time_span = 0 :: integer(),
         triggers = [],
         star = 0 :: integer(),
         gains = []}).

-record(classes_challenge_team,
        {ver = 0,
         id = [] :: list(),
         time_span = 0 :: integer(),
         members = [],
         star = 0 :: non_neg_integer(),
         rank = 0 :: non_neg_integer()}).

-record(classes_challenge_role,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: 0..5,
         time_span = 0 :: integer(),
         rank = 0 :: non_neg_integer(),
         star = 0 :: non_neg_integer(),
         is_leader = 0 :: 0 | 1}).

-file("src/proto/proto_148.erl", 16).

-file("inc/brave_trial.hrl", 1).

-record(m_brave_trial,
        {ver = 2,
         id = 0 :: integer(),
         done_list = [] :: list(),
         rewarded = [] :: list(),
         last_accepted = 0 :: integer(),
         time_span = 0 :: integer(),
         triggers = [],
         star = 0 :: integer(),
         gains = []}).

-record(brave_trial_team,
        {ver = 0,
         id = [] :: list(),
         time_span = 0 :: integer(),
         members = [],
         star = 0 :: non_neg_integer(),
         rank = 0 :: non_neg_integer()}).

-record(brave_trial_role,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: 0..5,
         time_span = 0 :: integer(),
         rank = 0 :: non_neg_integer(),
         star = 0 :: non_neg_integer(),
         is_leader = 0 :: 0 | 1}).

-file("src/proto/proto_148.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 14800, {}) ->
    {ok, <<2:32/little, 14800:16/little>>};
pack(srv, 14800, {V0_status, V0_timeout}) ->
    D_a_t_a = <<V0_status:8/little, V0_timeout:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14800:16/little,
       D_a_t_a/binary>>};
pack(cli, 14801, {}) ->
    {ok, <<2:32/little, 14801:16/little>>};
pack(srv, 14801, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14801:16/little,
       D_a_t_a/binary>>};
pack(cli, 14802, {}) ->
    {ok, <<2:32/little, 14802:16/little>>};
pack(srv, 14802,
     {#m_classes_challenge{id = V0_id, round = V0_round,
                           time_span = V0_time_span, done_list = V0_done_list,
                           rewarded = V0_rewarded}}) ->
    D_a_t_a = <<V0_id:8/little, V0_round:32/little,
                V0_time_span:32/little,
                (length(V0_done_list)):16/little,
                (list_to_binary([<<V1_done_id:8/little>>
                                 || V1_done_id <- V0_done_list]))/binary,
                (length(V0_rewarded)):16/little,
                (list_to_binary([<<V1_done_id:8/little>>
                                 || V1_done_id <- V0_rewarded]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14802:16/little,
       D_a_t_a/binary>>};
pack(cli, 14803, {V0_battle_id, V0_id, V0_star}) ->
    D_a_t_a = <<V0_battle_id:32/little, V0_id:32/little,
                V0_star:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14803:16/little,
       D_a_t_a/binary>>};
pack(srv, 14803, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14803:16/little,
       D_a_t_a/binary>>};
pack(cli, 14804, {}) ->
    {ok, <<2:32/little, 14804:16/little>>};
pack(srv, 14804,
     {#m_classes_challenge{star = V0_star,
                           time_span = V0_time_span, gains = V0_gains}}) ->
    D_a_t_a = <<V0_star:32/little, V0_time_span:32/little,
                (length(V0_gains)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_num:32/little>>
                                 || {V1_id, V1_num} <- V0_gains]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14804:16/little,
       D_a_t_a/binary>>};
pack(cli, 14805, {}) ->
    {ok, <<2:32/little, 14805:16/little>>};
pack(srv, 14805,
     {V0_rank, V0_my_time_span, V0_my_rank}) ->
    D_a_t_a = <<(length(V0_rank)):16/little,
                (list_to_binary([<<V1_rank:32/little, V1_star:32/little,
                                   V1_time_span:32/little,
                                   (length(V1_members)):16/little,
                                   (list_to_binary([<<V2_rid:32/little,
                                                      (protocol:pack(string,
                                                                     V2_platform))/binary,
                                                      V2_zone_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_name))/binary,
                                                      V2_classes:8/little,
                                                      V2_sex:8/little,
                                                      V2_is_leader:8/little>>
                                                    || #classes_challenge_role{id
                                                                                   =
                                                                                   {V2_rid,
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
                                                                               is_leader
                                                                                   =
                                                                                   V2_is_leader}
                                                           <- V1_members]))/binary>>
                                 || #classes_challenge_team{rank = V1_rank,
                                                            star = V1_star,
                                                            time_span =
                                                                V1_time_span,
                                                            members =
                                                                V1_members}
                                        <- V0_rank]))/binary,
                V0_my_time_span:32/little, V0_my_rank:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14805:16/little,
       D_a_t_a/binary>>};
pack(cli, 14809, {}) ->
    {ok, <<2:32/little, 14809:16/little>>};
pack(srv, 14809,
     {#m_brave_trial{id = V0_id, time_span = V0_time_span,
                     done_list = V0_done_list, rewarded = V0_rewarded}}) ->
    D_a_t_a = <<V0_id:8/little, V0_time_span:32/little,
                (length(V0_done_list)):16/little,
                (list_to_binary([<<V1_done_id:8/little>>
                                 || V1_done_id <- V0_done_list]))/binary,
                (length(V0_rewarded)):16/little,
                (list_to_binary([<<V1_done_id:8/little>>
                                 || V1_done_id <- V0_rewarded]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14809:16/little,
       D_a_t_a/binary>>};
pack(cli, 14810, {}) ->
    {ok, <<2:32/little, 14810:16/little>>};
pack(srv, 14810, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14810:16/little,
       D_a_t_a/binary>>};
pack(cli, 14811, {}) ->
    {ok, <<2:32/little, 14811:16/little>>};
pack(srv, 14811, {#m_brave_trial{gains = V0_gains}}) ->
    D_a_t_a = <<(length(V0_gains)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_num:32/little>>
                                 || {V1_id, V1_num} <- V0_gains]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14811:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 14800, _B0) -> {ok, {}};
unpack(cli, 14800, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_timeout, _B2} = protocol:uint32(_B1),
    {ok, {V1_status, V1_timeout}};
unpack(srv, 14801, _B0) -> {ok, {}};
unpack(cli, 14801, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14802, _B0) -> {ok, {}};
unpack(cli, 14802, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {V1_round, _B2} = protocol:uint32(_B1),
    {V1_time_span, _B3} = protocol:uint32(_B2),
    {V1_done_list, _B7} = protocol:array(_B3,
                                         fun (_B4) ->
                                                 {V2_done_id, _B5} =
                                                     protocol:uint8(_B4),
                                                 {{V2_done_id}, _B5}
                                         end),
    {V1_rewarded, _B11} = protocol:array(_B7,
                                         fun (_B8) ->
                                                 {V2_done_id, _B9} =
                                                     protocol:uint8(_B8),
                                                 {{V2_done_id}, _B9}
                                         end),
    {ok,
     {V1_id,
      V1_round,
      V1_time_span,
      V1_done_list,
      V1_rewarded}};
unpack(srv, 14803, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_star, _B3} = protocol:uint8(_B2),
    {ok, {V1_battle_id, V1_id, V1_star}};
unpack(cli, 14803, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14804, _B0) -> {ok, {}};
unpack(cli, 14804, _B0) ->
    {V1_star, _B1} = protocol:uint32(_B0),
    {V1_time_span, _B2} = protocol:uint32(_B1),
    {V1_gains, _B7} = protocol:array(_B2,
                                     fun (_B3) ->
                                             {V2_id, _B4} =
                                                 protocol:uint32(_B3),
                                             {V2_num, _B5} =
                                                 protocol:uint32(_B4),
                                             {{V2_id, V2_num}, _B5}
                                     end),
    {ok, {V1_star, V1_time_span, V1_gains}};
unpack(srv, 14805, _B0) -> {ok, {}};
unpack(cli, 14805, _B0) ->
    {V1_rank, _B16} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_rank, _B2} =
                                                 protocol:uint32(_B1),
                                             {V2_star, _B3} =
                                                 protocol:uint32(_B2),
                                             {V2_time_span, _B4} =
                                                 protocol:uint32(_B3),
                                             {V2_members, _B14} =
                                                 protocol:array(_B4,
                                                                fun (_B5) ->
                                                                        {V3_rid,
                                                                         _B6} =
                                                                            protocol:uint32(_B5),
                                                                        {V3_platform,
                                                                         _B7} =
                                                                            protocol:string(_B6),
                                                                        {V3_zone_id,
                                                                         _B8} =
                                                                            protocol:uint32(_B7),
                                                                        {V3_name,
                                                                         _B9} =
                                                                            protocol:string(_B8),
                                                                        {V3_classes,
                                                                         _B10} =
                                                                            protocol:uint8(_B9),
                                                                        {V3_sex,
                                                                         _B11} =
                                                                            protocol:uint8(_B10),
                                                                        {V3_is_leader,
                                                                         _B12} =
                                                                            protocol:uint8(_B11),
                                                                        {{V3_rid,
                                                                          V3_platform,
                                                                          V3_zone_id,
                                                                          V3_name,
                                                                          V3_classes,
                                                                          V3_sex,
                                                                          V3_is_leader},
                                                                         _B12}
                                                                end),
                                             {{V2_rank,
                                               V2_star,
                                               V2_time_span,
                                               V2_members},
                                              _B14}
                                     end),
    {V1_my_time_span, _B17} = protocol:uint32(_B16),
    {V1_my_rank, _B18} = protocol:uint32(_B17),
    {ok, {V1_rank, V1_my_time_span, V1_my_rank}};
unpack(srv, 14809, _B0) -> {ok, {}};
unpack(cli, 14809, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {V1_time_span, _B2} = protocol:uint32(_B1),
    {V1_done_list, _B6} = protocol:array(_B2,
                                         fun (_B3) ->
                                                 {V2_done_id, _B4} =
                                                     protocol:uint8(_B3),
                                                 {{V2_done_id}, _B4}
                                         end),
    {V1_rewarded, _B10} = protocol:array(_B6,
                                         fun (_B7) ->
                                                 {V2_done_id, _B8} =
                                                     protocol:uint8(_B7),
                                                 {{V2_done_id}, _B8}
                                         end),
    {ok, {V1_id, V1_time_span, V1_done_list, V1_rewarded}};
unpack(srv, 14810, _B0) -> {ok, {}};
unpack(cli, 14810, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14811, _B0) -> {ok, {}};
unpack(cli, 14811, _B0) ->
    {V1_gains, _B5} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_id, _B2} =
                                                 protocol:uint32(_B1),
                                             {V2_num, _B3} =
                                                 protocol:uint32(_B2),
                                             {{V2_id, V2_num}, _B3}
                                     end),
    {ok, {V1_gains}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

