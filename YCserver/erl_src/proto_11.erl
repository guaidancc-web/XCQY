-file("src/proto/proto_11.erl", 1).

-module(proto_11).

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

-file("src/proto/proto_11.erl", 14).

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

-file("src/proto/proto_11.erl", 15).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 1100, {}) ->
    {ok, <<2:32/little, 1100:16/little>>};
pack(srv, 1100, {V0_msg, V0_role_list, V0_cdkey}) ->
    D_a_t_a = <<(protocol:pack(string, V0_msg))/binary,
                (length(V0_role_list)):16/little,
                (list_to_binary([<<V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_lev:8/little,
                                   V1_classes:8/little>>
                                 || [V1_zone_id,
                                     V1_name,
                                     V1_sex,
                                     V1_lev,
                                     V1_classes]
                                        <- V0_role_list]))/binary,
                V0_cdkey:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 1100:16/little,
       D_a_t_a/binary>>};
pack(cli, 1101, {V0_cdkey}) ->
    D_a_t_a = <<(protocol:pack(string, V0_cdkey))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 1101:16/little,
       D_a_t_a/binary>>};
pack(srv, 1101, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 1101:16/little,
       D_a_t_a/binary>>};
pack(cli, 1110,
     {V0_name, V0_sex, V0_classes, V0_zone_id}) ->
    D_a_t_a = <<(protocol:pack(string, V0_name))/binary,
                V0_sex:8/little, V0_classes:8/little,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 1110:16/little,
       D_a_t_a/binary>>};
pack(srv, 1110,
     {V0_flag,
      V0_msg,
      V0_id,
      V0_platform,
      V0_zone_id,
      V0_name,
      V0_lev,
      V0_vip_lev,
      V0_gold,
      V0_time_reg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary, V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_lev:8/little, V0_vip_lev:8/little, V0_gold:32/little,
                V0_time_reg:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 1110:16/little,
       D_a_t_a/binary>>};
pack(cli, 1120, {V0_zone_id}) ->
    D_a_t_a = <<V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 1120:16/little,
       D_a_t_a/binary>>};
pack(srv, 1120,
     {V0_flag,
      V0_msg,
      V0_id,
      V0_platform,
      V0_zone_id,
      V0_name,
      V0_lev,
      V0_vip_lev,
      V0_gold,
      V0_time_reg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary, V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_lev:8/little, V0_vip_lev:8/little, V0_gold:32/little,
                V0_time_reg:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 1120:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 1100, _B0) -> {ok, {}};
unpack(cli, 1100, _B0) ->
    {V1_msg, _B1} = protocol:string(_B0),
    {V1_role_list, _B9} = protocol:array(_B1,
                                         fun (_B2) ->
                                                 {V2_zone_id, _B3} =
                                                     protocol:uint16(_B2),
                                                 {V2_name, _B4} =
                                                     protocol:string(_B3),
                                                 {V2_sex, _B5} =
                                                     protocol:uint8(_B4),
                                                 {V2_lev, _B6} =
                                                     protocol:uint8(_B5),
                                                 {V2_classes, _B7} =
                                                     protocol:uint8(_B6),
                                                 {{V2_zone_id,
                                                   V2_name,
                                                   V2_sex,
                                                   V2_lev,
                                                   V2_classes},
                                                  _B7}
                                         end),
    {V1_cdkey, _B10} = protocol:uint8(_B9),
    {ok, {V1_msg, V1_role_list, V1_cdkey}};
unpack(srv, 1101, _B0) ->
    {V1_cdkey, _B1} = protocol:string(_B0),
    {ok, {V1_cdkey}};
unpack(cli, 1101, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 1110, _B0) ->
    {V1_name, _B1} = protocol:string(_B0),
    {V1_sex, _B2} = protocol:uint8(_B1),
    {V1_classes, _B3} = protocol:uint8(_B2),
    {V1_zone_id, _B4} = protocol:uint16(_B3),
    {ok, {V1_name, V1_sex, V1_classes, V1_zone_id}};
unpack(cli, 1110, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {V1_platform, _B4} = protocol:string(_B3),
    {V1_zone_id, _B5} = protocol:uint16(_B4),
    {V1_name, _B6} = protocol:string(_B5),
    {V1_lev, _B7} = protocol:uint8(_B6),
    {V1_vip_lev, _B8} = protocol:uint8(_B7),
    {V1_gold, _B9} = protocol:uint32(_B8),
    {V1_time_reg, _B10} = protocol:uint32(_B9),
    {ok,
     {V1_flag,
      V1_msg,
      V1_id,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_lev,
      V1_vip_lev,
      V1_gold,
      V1_time_reg}};
unpack(srv, 1120, _B0) ->
    {V1_zone_id, _B1} = protocol:uint16(_B0),
    {ok, {V1_zone_id}};
unpack(cli, 1120, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {V1_platform, _B4} = protocol:string(_B3),
    {V1_zone_id, _B5} = protocol:uint16(_B4),
    {V1_name, _B6} = protocol:string(_B5),
    {V1_lev, _B7} = protocol:uint8(_B6),
    {V1_vip_lev, _B8} = protocol:uint8(_B7),
    {V1_gold, _B9} = protocol:uint32(_B8),
    {V1_time_reg, _B10} = protocol:uint32(_B9),
    {ok,
     {V1_flag,
      V1_msg,
      V1_id,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_lev,
      V1_vip_lev,
      V1_gold,
      V1_time_reg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

