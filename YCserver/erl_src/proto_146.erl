-file("src/proto/proto_146.erl", 1).

-module(proto_146).

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

-file("src/proto/proto_146.erl", 14).

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

-file("src/proto/proto_146.erl", 15).

-file("inc/fairyland.hrl", 1).

-record(m_fairyland,
        {ver = 0,
         keys = [],
         forward_envoys = [],
         floor = 0 :: integer(),
         last_joined = 0 :: integer(),
         triggers = [],
         exp = 0 :: non_neg_integer(),
         boss_prizes = []}).

-record(fairyland_floor,
        {id = 0 :: integer(),
         forward_envoy = 0 :: integer(),
         map_id = 0 :: integer(),
         map_pid :: undefined | pid(),
         map_base_id = 0 :: integer()}).

-record(fairyland_role,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         joined = 0 :: integer(),
         pid :: undefined | pid(),
         forward_envoys = [],
         box_boss_rewarded = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer()}).

-file("src/proto/proto_146.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 14600, {}) ->
    {ok, <<2:32/little, 14600:16/little>>};
pack(srv, 14600, {V0_status, V0_timeout}) ->
    D_a_t_a = <<V0_status:8/little, V0_timeout:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14600:16/little,
       D_a_t_a/binary>>};
pack(cli, 14601, {}) ->
    {ok, <<2:32/little, 14601:16/little>>};
pack(srv, 14601, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14601:16/little,
       D_a_t_a/binary>>};
pack(cli, 14602, {}) ->
    {ok, <<2:32/little, 14602:16/little>>};
pack(srv, 14602, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14602:16/little,
       D_a_t_a/binary>>};
pack(cli, 14603, {}) ->
    {ok, <<2:32/little, 14603:16/little>>};
pack(srv, 14603,
     {#m_fairyland{floor = V0_floor,
                   last_joined = V0_last_joined, exp = V0_exp,
                   keys = V0_keys, forward_envoys = V0_forward_envoys}}) ->
    D_a_t_a = <<V0_floor:8/little, V0_last_joined:32/little,
                V0_exp:32/little, (length(V0_keys)):16/little,
                (list_to_binary([<<V1_type:8/little, V1_num:16/little>>
                                 || {V1_type, V1_num} <- V0_keys]))/binary,
                (length(V0_forward_envoys)):16/little,
                (list_to_binary([<<V1_floor:8/little,
                                   V1_unit_base:32/little>>
                                 || {V1_floor, V1_unit_base}
                                        <- V0_forward_envoys]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14603:16/little,
       D_a_t_a/binary>>};
pack(cli, 14604, {}) ->
    {ok, <<2:32/little, 14604:16/little>>};
pack(srv, 14604, {V0_boss_id}) ->
    D_a_t_a = <<V0_boss_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14604:16/little,
       D_a_t_a/binary>>};
pack(cli, 14605, {V0_boss_id}) ->
    D_a_t_a = <<V0_boss_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14605:16/little,
       D_a_t_a/binary>>};
pack(srv, 14605, {V0_flag, V0_msg, V0_item_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_item_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14605:16/little,
       D_a_t_a/binary>>};
pack(cli, 14606, {}) ->
    {ok, <<2:32/little, 14606:16/little>>};
pack(srv, 14606, {V0_base_id, V0_type, V0_num}) ->
    D_a_t_a = <<V0_base_id:32/little, V0_type:8/little,
                V0_num:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14606:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 14600, _B0) -> {ok, {}};
unpack(cli, 14600, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_timeout, _B2} = protocol:uint32(_B1),
    {ok, {V1_status, V1_timeout}};
unpack(srv, 14601, _B0) -> {ok, {}};
unpack(cli, 14601, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14602, _B0) -> {ok, {}};
unpack(cli, 14602, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14603, _B0) -> {ok, {}};
unpack(cli, 14603, _B0) ->
    {V1_floor, _B1} = protocol:uint8(_B0),
    {V1_last_joined, _B2} = protocol:uint32(_B1),
    {V1_exp, _B3} = protocol:uint32(_B2),
    {V1_keys, _B8} = protocol:array(_B3,
                                    fun (_B4) ->
                                            {V2_type, _B5} =
                                                protocol:uint8(_B4),
                                            {V2_num, _B6} =
                                                protocol:uint16(_B5),
                                            {{V2_type, V2_num}, _B6}
                                    end),
    {V1_forward_envoys, _B13} = protocol:array(_B8,
                                               fun (_B9) ->
                                                       {V2_floor, _B10} =
                                                           protocol:uint8(_B9),
                                                       {V2_unit_base, _B11} =
                                                           protocol:uint32(_B10),
                                                       {{V2_floor,
                                                         V2_unit_base},
                                                        _B11}
                                               end),
    {ok,
     {V1_floor,
      V1_last_joined,
      V1_exp,
      V1_keys,
      V1_forward_envoys}};
unpack(srv, 14604, _B0) -> {ok, {}};
unpack(cli, 14604, _B0) ->
    {V1_boss_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_boss_id}};
unpack(srv, 14605, _B0) ->
    {V1_boss_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_boss_id}};
unpack(cli, 14605, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_item_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_item_id}};
unpack(srv, 14606, _B0) -> {ok, {}};
unpack(cli, 14606, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {V1_num, _B3} = protocol:uint16(_B2),
    {ok, {V1_base_id, V1_type, V1_num}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

