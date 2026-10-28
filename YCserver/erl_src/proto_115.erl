-file("src/proto/proto_115.erl", 1).

-module(proto_115).

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

-file("src/proto/proto_115.erl", 14).

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

-file("src/proto/proto_115.erl", 15).

-file("inc/option.hrl", 1).

-record(m_option, {ver = 1, game_opts = []}).

-record(game_opt, {ver = 0, type = 0, val = 0}).

-file("src/proto/proto_115.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 11500, {}) ->
    {ok, <<2:32/little, 11500:16/little>>};
pack(srv, 11500, {V0_game_opts}) ->
    D_a_t_a = <<(length(V0_game_opts)):16/little,
                (list_to_binary([<<V1_type:8/little, V1_val:8/little>>
                                 || #game_opt{type = V1_type, val = V1_val}
                                        <- V0_game_opts]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11500:16/little,
       D_a_t_a/binary>>};
pack(cli, 11501, {V0_type, V0_val}) ->
    D_a_t_a = <<V0_type:8/little, V0_val:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11501:16/little,
       D_a_t_a/binary>>};
pack(srv, 11501, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11501:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 11500, _B0) -> {ok, {}};
unpack(cli, 11500, _B0) ->
    {V1_game_opts, _B5} = protocol:array(_B0,
                                         fun (_B1) ->
                                                 {V2_type, _B2} =
                                                     protocol:uint8(_B1),
                                                 {V2_val, _B3} =
                                                     protocol:uint8(_B2),
                                                 {{V2_type, V2_val}, _B3}
                                         end),
    {ok, {V1_game_opts}};
unpack(srv, 11501, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_val, _B2} = protocol:uint8(_B1),
    {ok, {V1_type, V1_val}};
unpack(cli, 11501, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

