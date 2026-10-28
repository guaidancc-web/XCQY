-file("src/proto/proto_10.erl", 1).

-module(proto_10).

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

-file("src/proto/proto_10.erl", 14).

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

-file("src/proto/proto_10.erl", 15).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 1010,
     {V0_account,
      V0_type,
      V0_platform,
      V0_zone_id,
      V0_channel_reg,
      V0_dispense_id,
      V0_device_id,
      V0_device_type,
      V0_use_id,
      V0_ts,
      V0_ticket}) ->
    D_a_t_a = <<(protocol:pack(string, V0_account))/binary,
                V0_type:8/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_channel_reg:32/little,
                (protocol:pack(string, V0_dispense_id))/binary,
                (protocol:pack(string, V0_device_id))/binary,
                V0_device_type:8/little,
                (protocol:pack(string, V0_use_id))/binary,
                (protocol:pack(string, V0_ts))/binary,
                (protocol:pack(string, V0_ticket))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 1010:16/little,
       D_a_t_a/binary>>};
pack(srv, 1010, {V0_flag, V0_msg, V0_list}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                (length(V0_list)):16/little,
                (list_to_binary([<<(protocol:pack(string,
                                                  V1_platform))/binary,
                                   V1_zone_id:32/little>>
                                 || {V1_platform, V1_zone_id}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 1010:16/little,
       D_a_t_a/binary>>};
pack(cli, 1011,
     {V0_account,
      V0_type,
      V0_platform,
      V0_zone_id,
      V0_channel_reg,
      V0_dispense_id,
      V0_device_id,
      V0_device_type,
      V0_use_id,
      V0_ts,
      V0_ticket,
      V0_guid,
      V0_cp_ext}) ->
    D_a_t_a = <<(protocol:pack(string, V0_account))/binary,
                V0_type:8/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_channel_reg:32/little,
                (protocol:pack(string, V0_dispense_id))/binary,
                (protocol:pack(string, V0_device_id))/binary,
                V0_device_type:8/little,
                (protocol:pack(string, V0_use_id))/binary,
                (protocol:pack(string, V0_ts))/binary,
                (protocol:pack(string, V0_ticket))/binary,
                (protocol:pack(string, V0_guid))/binary,
                (protocol:pack(string, V0_cp_ext))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 1011:16/little,
       D_a_t_a/binary>>};
pack(srv, 1011, {V0_flag, V0_msg, V0_list}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                (length(V0_list)):16/little,
                (list_to_binary([<<(protocol:pack(string,
                                                  V1_platform))/binary,
                                   V1_zone_id:32/little>>
                                 || {V1_platform, V1_zone_id}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 1011:16/little,
       D_a_t_a/binary>>};
pack(cli, 1020, {}) ->
    {ok, <<2:32/little, 1020:16/little>>};
pack(srv, 1020, {}) ->
    {ok, <<2:32/little, 1020:16/little>>};
pack(cli, 1080, {}) ->
    {ok, <<2:32/little, 1080:16/little>>};
pack(srv, 1080, {V0_msg}) ->
    D_a_t_a = <<(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 1080:16/little,
       D_a_t_a/binary>>};
pack(cli, 1097, {V0_platform}) ->
    D_a_t_a = <<(protocol:pack(string,
                               V0_platform))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 1097:16/little,
       D_a_t_a/binary>>};
pack(srv, 1097, {V0_version}) ->
    D_a_t_a = <<(protocol:pack(string,
                               V0_version))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 1097:16/little,
       D_a_t_a/binary>>};
pack(cli, 1098, {V0_time}) ->
    D_a_t_a = <<V0_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 1098:16/little,
       D_a_t_a/binary>>};
pack(srv, 1098, {V0_client_time, V0_server_time}) ->
    D_a_t_a = <<V0_client_time:32/little,
                V0_server_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 1098:16/little,
       D_a_t_a/binary>>};
pack(cli, 1099, {V0_time}) ->
    D_a_t_a = <<V0_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 1099:16/little,
       D_a_t_a/binary>>};
pack(srv, 1099, {V0_client_time, V0_server_time}) ->
    D_a_t_a = <<V0_client_time:32/little,
                V0_server_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 1099:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 1010, _B0) ->
    {V1_account, _B1} = protocol:string(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {V1_platform, _B3} = protocol:string(_B2),
    {V1_zone_id, _B4} = protocol:uint32(_B3),
    {V1_channel_reg, _B5} = protocol:uint32(_B4),
    {V1_dispense_id, _B6} = protocol:string(_B5),
    {V1_device_id, _B7} = protocol:string(_B6),
    {V1_device_type, _B8} = protocol:uint8(_B7),
    {V1_use_id, _B9} = protocol:string(_B8),
    {V1_ts, _B10} = protocol:string(_B9),
    {V1_ticket, _B11} = protocol:string(_B10),
    {ok,
     {V1_account,
      V1_type,
      V1_platform,
      V1_zone_id,
      V1_channel_reg,
      V1_dispense_id,
      V1_device_id,
      V1_device_type,
      V1_use_id,
      V1_ts,
      V1_ticket}};
unpack(cli, 1010, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_list, _B7} = protocol:array(_B2,
                                    fun (_B3) ->
                                            {V2_platform, _B4} =
                                                protocol:string(_B3),
                                            {V2_zone_id, _B5} =
                                                protocol:uint32(_B4),
                                            {{V2_platform, V2_zone_id}, _B5}
                                    end),
    {ok, {V1_flag, V1_msg, V1_list}};
unpack(srv, 1011, _B0) ->
    {V1_account, _B1} = protocol:string(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {V1_platform, _B3} = protocol:string(_B2),
    {V1_zone_id, _B4} = protocol:uint32(_B3),
    {V1_channel_reg, _B5} = protocol:uint32(_B4),
    {V1_dispense_id, _B6} = protocol:string(_B5),
    {V1_device_id, _B7} = protocol:string(_B6),
    {V1_device_type, _B8} = protocol:uint8(_B7),
    {V1_use_id, _B9} = protocol:string(_B8),
    {V1_ts, _B10} = protocol:string(_B9),
    {V1_ticket, _B11} = protocol:string(_B10),
    {V1_guid, _B12} = protocol:string(_B11),
    {V1_cp_ext, _B13} = protocol:string(_B12),
    {ok,
     {V1_account,
      V1_type,
      V1_platform,
      V1_zone_id,
      V1_channel_reg,
      V1_dispense_id,
      V1_device_id,
      V1_device_type,
      V1_use_id,
      V1_ts,
      V1_ticket,
      V1_guid,
      V1_cp_ext}};
unpack(cli, 1011, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_list, _B7} = protocol:array(_B2,
                                    fun (_B3) ->
                                            {V2_platform, _B4} =
                                                protocol:string(_B3),
                                            {V2_zone_id, _B5} =
                                                protocol:uint32(_B4),
                                            {{V2_platform, V2_zone_id}, _B5}
                                    end),
    {ok, {V1_flag, V1_msg, V1_list}};
unpack(srv, 1020, _B0) -> {ok, {}};
unpack(cli, 1020, _B0) -> {ok, {}};
unpack(srv, 1080, _B0) -> {ok, {}};
unpack(cli, 1080, _B0) ->
    {V1_msg, _B1} = protocol:string(_B0),
    {ok, {V1_msg}};
unpack(srv, 1097, _B0) ->
    {V1_platform, _B1} = protocol:string(_B0),
    {ok, {V1_platform}};
unpack(cli, 1097, _B0) ->
    {V1_version, _B1} = protocol:string(_B0),
    {ok, {V1_version}};
unpack(srv, 1098, _B0) ->
    {V1_time, _B1} = protocol:uint32(_B0),
    {ok, {V1_time}};
unpack(cli, 1098, _B0) ->
    {V1_client_time, _B1} = protocol:uint32(_B0),
    {V1_server_time, _B2} = protocol:uint32(_B1),
    {ok, {V1_client_time, V1_server_time}};
unpack(srv, 1099, _B0) ->
    {V1_time, _B1} = protocol:uint32(_B0),
    {ok, {V1_time}};
unpack(cli, 1099, _B0) ->
    {V1_client_time, _B1} = protocol:uint32(_B0),
    {V1_server_time, _B2} = protocol:uint32(_B1),
    {ok, {V1_client_time, V1_server_time}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

