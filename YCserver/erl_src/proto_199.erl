-file("src/proto/proto_199.erl", 1).

-module(proto_199).

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

-file("src/proto/proto_199.erl", 14).

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

-file("src/proto/proto_199.erl", 15).

-file("inc/camp_dragon_boat.hrl", 1).

-record(m_camp_dragon_boat,
        {ver = 0,
         start_time = 0 :: non_neg_integer(),
         time_span = 0 :: non_neg_integer(),
         rewarded = [] :: non_neg_integer(),
         rewarded_time = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         fought = 0 :: non_neg_integer(),
         triggers = []}).

-record(dragon_boat_role,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: 0..5,
         time_span = 0 :: integer(),
         is_leader = 0 :: 0 | 1}).

-record(dragon_boat_team,
        {ver = 0,
         id = [] :: list(),
         time_span = 0 :: integer(),
         members = [],
         rank = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         leader_name = "" :: list()}).

-file("src/proto/proto_199.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 19900, {}) ->
    {ok, <<2:32/little, 19900:16/little>>};
pack(srv, 19900,
     {#m_camp_dragon_boat{start_time = V0_start_time,
                          done = V0_done}}) ->
    D_a_t_a = <<V0_start_time:32/little, V0_done:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19900:16/little,
       D_a_t_a/binary>>};
pack(cli, 19901, {}) ->
    {ok, <<2:32/little, 19901:16/little>>};
pack(srv, 19901,
     {V0_status, V0_time_out, V0_camp_id}) ->
    D_a_t_a = <<V0_status:8/little, V0_time_out:32/little,
                V0_camp_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19901:16/little,
       D_a_t_a/binary>>};
pack(cli, 19902, {}) ->
    {ok, <<2:32/little, 19902:16/little>>};
pack(srv, 19902, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19902:16/little,
       D_a_t_a/binary>>};
pack(cli, 19903, {}) ->
    {ok, <<2:32/little, 19903:16/little>>};
pack(srv, 19903, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19903:16/little,
       D_a_t_a/binary>>};
pack(cli, 19904, {}) ->
    {ok, <<2:32/little, 19904:16/little>>};
pack(srv, 19904, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19904:16/little,
       D_a_t_a/binary>>};
pack(cli, 19905, {}) ->
    {ok, <<2:32/little, 19905:16/little>>};
pack(srv, 19905, {V0_time_span, V0_reward}) ->
    D_a_t_a = <<V0_time_span:32/little,
                (length(V0_reward)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_num:32/little>>
                                 || {V1_base_id, V1_num}
                                        <- V0_reward]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19905:16/little,
       D_a_t_a/binary>>};
pack(cli, 19906, {}) ->
    {ok, <<2:32/little, 19906:16/little>>};
pack(srv, 19906, {V0_dragon_boat_team, V0_self_rank}) ->
    D_a_t_a = <<(length(V0_dragon_boat_team)):16/little,
                (list_to_binary([<<(protocol:pack(string,
                                                  V1_leader_name))/binary,
                                   V1_done:8/little, V1_rank:16/little,
                                   V1_time_span:32/little>>
                                 || #dragon_boat_team{leader_name =
                                                          V1_leader_name,
                                                      done = V1_done,
                                                      rank = V1_rank,
                                                      time_span = V1_time_span}
                                        <- V0_dragon_boat_team]))/binary,
                V0_self_rank:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19906:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 19900, _B0) -> {ok, {}};
unpack(cli, 19900, _B0) ->
    {V1_start_time, _B1} = protocol:uint32(_B0),
    {V1_done, _B2} = protocol:uint8(_B1),
    {ok, {V1_start_time, V1_done}};
unpack(srv, 19901, _B0) -> {ok, {}};
unpack(cli, 19901, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_time_out, _B2} = protocol:uint32(_B1),
    {V1_camp_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_status, V1_time_out, V1_camp_id}};
unpack(srv, 19902, _B0) -> {ok, {}};
unpack(cli, 19902, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 19903, _B0) -> {ok, {}};
unpack(cli, 19903, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 19904, _B0) -> {ok, {}};
unpack(cli, 19904, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 19905, _B0) -> {ok, {}};
unpack(cli, 19905, _B0) ->
    {V1_time_span, _B1} = protocol:uint32(_B0),
    {V1_reward, _B6} = protocol:array(_B1,
                                      fun (_B2) ->
                                              {V2_base_id, _B3} =
                                                  protocol:uint32(_B2),
                                              {V2_num, _B4} =
                                                  protocol:uint32(_B3),
                                              {{V2_base_id, V2_num}, _B4}
                                      end),
    {ok, {V1_time_span, V1_reward}};
unpack(srv, 19906, _B0) -> {ok, {}};
unpack(cli, 19906, _B0) ->
    {V1_dragon_boat_team, _B7} = protocol:array(_B0,
                                                fun (_B1) ->
                                                        {V2_leader_name, _B2} =
                                                            protocol:string(_B1),
                                                        {V2_done, _B3} =
                                                            protocol:uint8(_B2),
                                                        {V2_rank, _B4} =
                                                            protocol:uint16(_B3),
                                                        {V2_time_span, _B5} =
                                                            protocol:uint32(_B4),
                                                        {{V2_leader_name,
                                                          V2_done,
                                                          V2_rank,
                                                          V2_time_span},
                                                         _B5}
                                                end),
    {V1_self_rank, _B8} = protocol:uint16(_B7),
    {ok, {V1_dragon_boat_team, V1_self_rank}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

