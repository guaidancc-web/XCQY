-file("src/proto/proto_143.erl", 1).

-module(proto_143).

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

-file("src/proto/proto_143.erl", 14).

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

-file("src/proto/proto_143.erl", 15).

-file("inc/tower.hrl", 1).

-record(m_tower, {gain_list = [], pass_boss = []}).

-file("src/proto/proto_143.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 14300, {}) ->
    {ok, <<2:32/little, 14300:16/little>>};
pack(srv, 14300, {V0_pass_boss}) ->
    D_a_t_a = <<(length(V0_pass_boss)):16/little,
                (list_to_binary([<<V1_floor:8/little,
                                   V1_is_pass_gain:8/little,
                                   (length(V1_unit_list)):16/little,
                                   (list_to_binary([<<V2_unit_id:32/little>>
                                                    || V2_unit_id
                                                           <- V1_unit_list]))/binary>>
                                 || {V1_floor, V1_is_pass_gain, V1_unit_list}
                                        <- V0_pass_boss]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14300:16/little,
       D_a_t_a/binary>>};
pack(cli, 14301, {V0_floor}) ->
    D_a_t_a = <<V0_floor:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14301:16/little,
       D_a_t_a/binary>>};
pack(srv, 14301, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14301:16/little,
       D_a_t_a/binary>>};
pack(cli, 14302, {V0_floor}) ->
    D_a_t_a = <<V0_floor:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14302:16/little,
       D_a_t_a/binary>>};
pack(srv, 14302, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14302:16/little,
       D_a_t_a/binary>>};
pack(cli, 14303, {}) ->
    {ok, <<2:32/little, 14303:16/little>>};
pack(srv, 14303,
     {V0_order, V0_type, V0_gain_list, V0_show_list}) ->
    D_a_t_a = <<V0_order:8/little, V0_type:8/little,
                (length(V0_gain_list)):16/little,
                (list_to_binary([<<V1_item_id1:32/little,
                                   V1_num1:32/little>>
                                 || {V1_item_id1, V1_num1}
                                        <- V0_gain_list]))/binary,
                (length(V0_show_list)):16/little,
                (list_to_binary([<<V1_item_id2:32/little,
                                   V1_num2:32/little>>
                                 || {V1_item_id2, V1_num2}
                                        <- V0_show_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14303:16/little,
       D_a_t_a/binary>>};
pack(cli, 14304, {V0_order}) ->
    D_a_t_a = <<V0_order:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14304:16/little,
       D_a_t_a/binary>>};
pack(srv, 14304, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14304:16/little,
       D_a_t_a/binary>>};
pack(cli, 14305, {}) ->
    {ok, <<2:32/little, 14305:16/little>>};
pack(srv, 14305, {V0_num}) ->
    D_a_t_a = <<V0_num:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14305:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 14300, _B0) -> {ok, {}};
unpack(cli, 14300, _B0) ->
    {V1_pass_boss, _B9} = protocol:array(_B0,
                                         fun (_B1) ->
                                                 {V2_floor, _B2} =
                                                     protocol:uint8(_B1),
                                                 {V2_is_pass_gain, _B3} =
                                                     protocol:uint8(_B2),
                                                 {V2_unit_list, _B7} =
                                                     protocol:array(_B3,
                                                                    fun (_B4) ->
                                                                            {V3_unit_id,
                                                                             _B5} =
                                                                                protocol:uint32(_B4),
                                                                            {{V3_unit_id},
                                                                             _B5}
                                                                    end),
                                                 {{V2_floor,
                                                   V2_is_pass_gain,
                                                   V2_unit_list},
                                                  _B7}
                                         end),
    {ok, {V1_pass_boss}};
unpack(srv, 14301, _B0) ->
    {V1_floor, _B1} = protocol:uint8(_B0),
    {ok, {V1_floor}};
unpack(cli, 14301, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14302, _B0) ->
    {V1_floor, _B1} = protocol:uint8(_B0),
    {ok, {V1_floor}};
unpack(cli, 14302, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14303, _B0) -> {ok, {}};
unpack(cli, 14303, _B0) ->
    {V1_order, _B1} = protocol:uint8(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {V1_gain_list, _B7} = protocol:array(_B2,
                                         fun (_B3) ->
                                                 {V2_item_id1, _B4} =
                                                     protocol:uint32(_B3),
                                                 {V2_num1, _B5} =
                                                     protocol:uint32(_B4),
                                                 {{V2_item_id1, V2_num1}, _B5}
                                         end),
    {V1_show_list, _B12} = protocol:array(_B7,
                                          fun (_B8) ->
                                                  {V2_item_id2, _B9} =
                                                      protocol:uint32(_B8),
                                                  {V2_num2, _B10} =
                                                      protocol:uint32(_B9),
                                                  {{V2_item_id2, V2_num2}, _B10}
                                          end),
    {ok, {V1_order, V1_type, V1_gain_list, V1_show_list}};
unpack(srv, 14304, _B0) ->
    {V1_order, _B1} = protocol:uint8(_B0),
    {ok, {V1_order}};
unpack(cli, 14304, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14305, _B0) -> {ok, {}};
unpack(cli, 14305, _B0) ->
    {V1_num, _B1} = protocol:uint8(_B0),
    {ok, {V1_num}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

