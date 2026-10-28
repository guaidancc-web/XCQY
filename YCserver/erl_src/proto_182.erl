-file("src/proto/proto_182.erl", 1).

-module(proto_182).

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

-file("src/proto/proto_182.erl", 14).

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

-file("src/proto/proto_182.erl", 15).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 18200, {}) ->
    {ok, <<2:32/little, 18200:16/little>>};
pack(srv, 18200, {V0_gold_times, V0_silver_times}) ->
    D_a_t_a = <<V0_gold_times:32/little,
                V0_silver_times:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18200:16/little,
       D_a_t_a/binary>>};
pack(cli, 18201, {V0_uint_id}) ->
    D_a_t_a = <<V0_uint_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18201:16/little,
       D_a_t_a/binary>>};
pack(srv, 18201, {V0_flag, V0_msg, V0_item_type_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_item_type_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18201:16/little,
       D_a_t_a/binary>>};
pack(cli, 18202, {}) ->
    {ok, <<2:32/little, 18202:16/little>>};
pack(srv, 18202, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18202:16/little,
       D_a_t_a/binary>>};
pack(cli, 18203, {V0_key_base_id}) ->
    D_a_t_a = <<V0_key_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18203:16/little,
       D_a_t_a/binary>>};
pack(srv, 18203, {V0_flag, V0_msg, V0_x, V0_y}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary, V0_x:32/little,
                V0_y:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18203:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 18200, _B0) -> {ok, {}};
unpack(cli, 18200, _B0) ->
    {V1_gold_times, _B1} = protocol:uint32(_B0),
    {V1_silver_times, _B2} = protocol:uint32(_B1),
    {ok, {V1_gold_times, V1_silver_times}};
unpack(srv, 18201, _B0) ->
    {V1_uint_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_uint_id}};
unpack(cli, 18201, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_item_type_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_flag, V1_msg, V1_item_type_id}};
unpack(srv, 18202, _B0) -> {ok, {}};
unpack(cli, 18202, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 18203, _B0) ->
    {V1_key_base_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_key_base_id}};
unpack(cli, 18203, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_x, _B3} = protocol:uint32(_B2),
    {V1_y, _B4} = protocol:uint32(_B3),
    {ok, {V1_flag, V1_msg, V1_x, V1_y}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

