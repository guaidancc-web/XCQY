-file("src/proto/proto_210.erl", 1).

-module(proto_210).

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

-file("src/proto/proto_210.erl", 14).

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

-file("src/proto/proto_210.erl", 15).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 21000, {}) ->
    {ok, <<2:32/little, 21000:16/little>>};
pack(srv, 21000, {V0_item_list}) ->
    D_a_t_a = <<(length(V0_item_list)):16/little,
                (list_to_binary([<<V1_item_id:32/little,
                                   (protocol:pack(string, V1_item_name))/binary,
                                   V1_price:32/little, V1_loss_type:32/little,
                                   V1_type_id:8/little>>
                                 || {V1_item_id,
                                     V1_item_name,
                                     V1_price,
                                     V1_loss_type,
                                     V1_type_id}
                                        <- V0_item_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 21000:16/little,
       D_a_t_a/binary>>};
pack(cli, 21001,
     {V0_item_id,
      V0_cost_msg,
      {V0_rid, V0_platform, V0_zone_id}}) ->
    D_a_t_a = <<V0_item_id:32/little,
                (protocol:pack(string, V0_cost_msg))/binary,
                V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 21001:16/little,
       D_a_t_a/binary>>};
pack(srv, 21001, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 21001:16/little,
       D_a_t_a/binary>>};
pack(cli, 21002,
     {V0_item_id,
      V0_cost_msg,
      {V0_rid, V0_platform, V0_zone_id}}) ->
    D_a_t_a = <<V0_item_id:32/little,
                (protocol:pack(string, V0_cost_msg))/binary,
                V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 21002:16/little,
       D_a_t_a/binary>>};
pack(srv, 21002, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 21002:16/little,
       D_a_t_a/binary>>};
pack(cli, 21003, {}) ->
    {ok, <<2:32/little, 21003:16/little>>};
pack(srv, 21003, {V0_context_list}) ->
    D_a_t_a = <<(length(V0_context_list)):16/little,
                (list_to_binary([<<(protocol:pack(string,
                                                  V1_context))/binary>>
                                 || V1_context <- V0_context_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 21003:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 21000, _B0) -> {ok, {}};
unpack(cli, 21000, _B0) ->
    {V1_item_list, _B8} = protocol:array(_B0,
                                         fun (_B1) ->
                                                 {V2_item_id, _B2} =
                                                     protocol:uint32(_B1),
                                                 {V2_item_name, _B3} =
                                                     protocol:string(_B2),
                                                 {V2_price, _B4} =
                                                     protocol:uint32(_B3),
                                                 {V2_loss_type, _B5} =
                                                     protocol:uint32(_B4),
                                                 {V2_type_id, _B6} =
                                                     protocol:uint8(_B5),
                                                 {{V2_item_id,
                                                   V2_item_name,
                                                   V2_price,
                                                   V2_loss_type,
                                                   V2_type_id},
                                                  _B6}
                                         end),
    {ok, {V1_item_list}};
unpack(srv, 21001, _B0) ->
    {V1_item_id, _B1} = protocol:uint32(_B0),
    {V1_cost_msg, _B2} = protocol:string(_B1),
    {V1_rid, _B3} = protocol:uint32(_B2),
    {V1_platform, _B4} = protocol:string(_B3),
    {V1_zone_id, _B5} = protocol:uint32(_B4),
    {ok,
     {V1_item_id,
      V1_cost_msg,
      V1_rid,
      V1_platform,
      V1_zone_id}};
unpack(cli, 21001, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 21002, _B0) ->
    {V1_item_id, _B1} = protocol:uint32(_B0),
    {V1_cost_msg, _B2} = protocol:string(_B1),
    {V1_rid, _B3} = protocol:uint32(_B2),
    {V1_platform, _B4} = protocol:string(_B3),
    {V1_zone_id, _B5} = protocol:uint32(_B4),
    {ok,
     {V1_item_id,
      V1_cost_msg,
      V1_rid,
      V1_platform,
      V1_zone_id}};
unpack(cli, 21002, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 21003, _B0) -> {ok, {}};
unpack(cli, 21003, _B0) ->
    {V1_context_list, _B4} = protocol:array(_B0,
                                            fun (_B1) ->
                                                    {V2_context, _B2} =
                                                        protocol:string(_B1),
                                                    {{V2_context}, _B2}
                                            end),
    {ok, {V1_context_list}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

