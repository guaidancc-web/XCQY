-file("src/proto/proto_175.erl", 1).

-module(proto_175).

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

-file("src/proto/proto_175.erl", 14).

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

-file("src/proto/proto_175.erl", 15).

-file("inc/extension.hrl", 1).

-record(m_extension,
        {ver = 3,
         init = 0,
         key = "",
         key_time = 0,
         ships = [],
         apply_id = {0, "", 0},
         apply_key = "",
         apply_name = "",
         day_score = 0,
         day_flag = 0}).

-record(extension_key,
        {key, role_id, role_name = "", time}).

-record(extension_role,
        {ver = 2,
         id,
         name,
         apply_id = {0, "", 0},
         apply_key = "",
         apply_name = "",
         key = "",
         key_time = 0,
         ships = [],
         rewarded = [],
         day_score = 0,
         day_flag = 0}).

-record(extension_ship,
        {ver = 2,
         id = {0, "", 0},
         name = "",
         score = 0,
         key = "",
         time = 0,
         activity_score = 0,
         activity_time = []}).

-file("src/proto/proto_175.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 17500, {V0_key}) ->
    D_a_t_a = <<(protocol:pack(string, V0_key))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17500:16/little,
       D_a_t_a/binary>>};
pack(srv, 17500, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17500:16/little,
       D_a_t_a/binary>>};
pack(cli, 17501, {}) ->
    {ok, <<2:32/little, 17501:16/little>>};
pack(srv, 17501, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17501:16/little,
       D_a_t_a/binary>>};
pack(cli, 17502, {}) ->
    {ok, <<2:32/little, 17502:16/little>>};
pack(srv, 17502,
     {V0_key,
      V0_key_time,
      V0_ships,
      {V0_rid, V0_platform, V0_zone_id},
      V0_apply_key,
      V0_apply_name,
      V0_day_score}) ->
    D_a_t_a = <<(protocol:pack(string, V0_key))/binary,
                V0_key_time:32/little, (length(V0_ships)):16/little,
                (list_to_binary([<<V1_rid_1:32/little,
                                   (protocol:pack(string,
                                                  V1_platform_1))/binary,
                                   V1_zone_id_1:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_score:32/little,
                                   (protocol:pack(string, V1_key))/binary,
                                   V1_time:32/little>>
                                 || #extension_ship{id =
                                                        {V1_rid_1,
                                                         V1_platform_1,
                                                         V1_zone_id_1},
                                                    name = V1_name,
                                                    score = V1_score,
                                                    key = V1_key,
                                                    time = V1_time}
                                        <- V0_ships]))/binary,
                V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_apply_key))/binary,
                (protocol:pack(string, V0_apply_name))/binary,
                V0_day_score:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17502:16/little,
       D_a_t_a/binary>>};
pack(cli, 17503, {}) ->
    {ok, <<2:32/little, 17503:16/little>>};
pack(srv, 17503,
     {#extension_ship{id =
                          {V0_rid_1, V0_platform_1, V0_zone_id_1},
                      name = V0_name, score = V0_score, key = V0_key,
                      time = V0_time}}) ->
    D_a_t_a = <<V0_rid_1:32/little,
                (protocol:pack(string, V0_platform_1))/binary,
                V0_zone_id_1:32/little,
                (protocol:pack(string, V0_name))/binary,
                V0_score:32/little,
                (protocol:pack(string, V0_key))/binary,
                V0_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17503:16/little,
       D_a_t_a/binary>>};
pack(cli, 17504, {V0_gain_id}) ->
    D_a_t_a = <<V0_gain_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17504:16/little,
       D_a_t_a/binary>>};
pack(srv, 17504, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17504:16/little,
       D_a_t_a/binary>>};
pack(cli, 17505, {}) ->
    {ok, <<2:32/little, 17505:16/little>>};
pack(srv, 17505, {V0_gain_list}) ->
    D_a_t_a = <<(length(V0_gain_list)):16/little,
                (list_to_binary([<<V1_gain_id:8/little,
                                   V1_time:32/little>>
                                 || {V1_gain_id, V1_time}
                                        <- V0_gain_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17505:16/little,
       D_a_t_a/binary>>};
pack(cli, 17506, {}) ->
    {ok, <<2:32/little, 17506:16/little>>};
pack(srv, 17506, {}) ->
    {ok, <<2:32/little, 17506:16/little>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 17500, _B0) ->
    {V1_key, _B1} = protocol:string(_B0),
    {ok, {V1_key}};
unpack(cli, 17500, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17501, _B0) -> {ok, {}};
unpack(cli, 17501, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17502, _B0) -> {ok, {}};
unpack(cli, 17502, _B0) ->
    {V1_key, _B1} = protocol:string(_B0),
    {V1_key_time, _B2} = protocol:uint32(_B1),
    {V1_ships, _B12} = protocol:array(_B2,
                                      fun (_B3) ->
                                              {V2_rid_1, _B4} =
                                                  protocol:uint32(_B3),
                                              {V2_platform_1, _B5} =
                                                  protocol:string(_B4),
                                              {V2_zone_id_1, _B6} =
                                                  protocol:uint32(_B5),
                                              {V2_name, _B7} =
                                                  protocol:string(_B6),
                                              {V2_score, _B8} =
                                                  protocol:uint32(_B7),
                                              {V2_key, _B9} =
                                                  protocol:string(_B8),
                                              {V2_time, _B10} =
                                                  protocol:uint32(_B9),
                                              {{V2_rid_1,
                                                V2_platform_1,
                                                V2_zone_id_1,
                                                V2_name,
                                                V2_score,
                                                V2_key,
                                                V2_time},
                                               _B10}
                                      end),
    {V1_rid, _B13} = protocol:uint32(_B12),
    {V1_platform, _B14} = protocol:string(_B13),
    {V1_zone_id, _B15} = protocol:uint32(_B14),
    {V1_apply_key, _B16} = protocol:string(_B15),
    {V1_apply_name, _B17} = protocol:string(_B16),
    {V1_day_score, _B18} = protocol:uint32(_B17),
    {ok,
     {V1_key,
      V1_key_time,
      V1_ships,
      V1_rid,
      V1_platform,
      V1_zone_id,
      V1_apply_key,
      V1_apply_name,
      V1_day_score}};
unpack(srv, 17503, _B0) -> {ok, {}};
unpack(cli, 17503, _B0) ->
    {V1_rid_1, _B1} = protocol:uint32(_B0),
    {V1_platform_1, _B2} = protocol:string(_B1),
    {V1_zone_id_1, _B3} = protocol:uint32(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_score, _B5} = protocol:uint32(_B4),
    {V1_key, _B6} = protocol:string(_B5),
    {V1_time, _B7} = protocol:uint32(_B6),
    {ok,
     {V1_rid_1,
      V1_platform_1,
      V1_zone_id_1,
      V1_name,
      V1_score,
      V1_key,
      V1_time}};
unpack(srv, 17504, _B0) ->
    {V1_gain_id, _B1} = protocol:uint8(_B0),
    {ok, {V1_gain_id}};
unpack(cli, 17504, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17505, _B0) -> {ok, {}};
unpack(cli, 17505, _B0) ->
    {V1_gain_list, _B5} = protocol:array(_B0,
                                         fun (_B1) ->
                                                 {V2_gain_id, _B2} =
                                                     protocol:uint8(_B1),
                                                 {V2_time, _B3} =
                                                     protocol:uint32(_B2),
                                                 {{V2_gain_id, V2_time}, _B3}
                                         end),
    {ok, {V1_gain_list}};
unpack(srv, 17506, _B0) -> {ok, {}};
unpack(cli, 17506, _B0) -> {ok, {}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

