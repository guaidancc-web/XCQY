-file("src/proto/proto_192.erl", 1).

-module(proto_192).

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

-file("src/proto/proto_192.erl", 14).

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

-file("src/proto/proto_192.erl", 15).

-file("inc/raffle.hrl", 1).

-record(m_raffle, {ver = 0, prizes = []}).

-record(raffle_log,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         time = 0 :: integer(),
         prizes = []}).

-file("src/proto/proto_192.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 19200, {}) ->
    {ok, <<2:32/little, 19200:16/little>>};
pack(srv, 19200, {V0_status, V0_timeout}) ->
    D_a_t_a = <<V0_status:8/little, V0_timeout:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19200:16/little,
       D_a_t_a/binary>>};
pack(cli, 19201, {}) ->
    {ok, <<2:32/little, 19201:16/little>>};
pack(srv, 19201, {V0_logs}) ->
    D_a_t_a = <<(length(V0_logs)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_time:32/little,
                                   (length(V1_prizes)):16/little,
                                   (list_to_binary([<<V2_item_id:32/little,
                                                      V2_item_num:32/little>>
                                                    || {V2_item_id, V2_item_num}
                                                           <- V1_prizes]))/binary>>
                                 || #raffle_log{id =
                                                    {V1_rid,
                                                     V1_platform,
                                                     V1_zone_id},
                                                name = V1_name, time = V1_time,
                                                prizes = V1_prizes}
                                        <- V0_logs]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19201:16/little,
       D_a_t_a/binary>>};
pack(cli, 19202, {V0_times}) ->
    D_a_t_a = <<V0_times:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19202:16/little,
       D_a_t_a/binary>>};
pack(srv, 19202,
     {V0_flag, V0_msg, V0_times, V0_id, V0_prizes}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_times:8/little, V0_id:32/little,
                (length(V0_prizes)):16/little,
                (list_to_binary([<<V1_item_id:32/little,
                                   V1_item_num:32/little>>
                                 || {V1_item_id, V1_item_num}
                                        <- V0_prizes]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19202:16/little,
       D_a_t_a/binary>>};
pack(cli, 19203, {}) ->
    {ok, <<2:32/little, 19203:16/little>>};
pack(srv, 19203, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19203:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 19200, _B0) -> {ok, {}};
unpack(cli, 19200, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_timeout, _B2} = protocol:uint32(_B1),
    {ok, {V1_status, V1_timeout}};
unpack(srv, 19201, _B0) -> {ok, {}};
unpack(cli, 19201, _B0) ->
    {V1_logs, _B13} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_rid, _B2} =
                                                 protocol:uint32(_B1),
                                             {V2_platform, _B3} =
                                                 protocol:string(_B2),
                                             {V2_zone_id, _B4} =
                                                 protocol:uint32(_B3),
                                             {V2_name, _B5} =
                                                 protocol:string(_B4),
                                             {V2_time, _B6} =
                                                 protocol:uint32(_B5),
                                             {V2_prizes, _B11} =
                                                 protocol:array(_B6,
                                                                fun (_B7) ->
                                                                        {V3_item_id,
                                                                         _B8} =
                                                                            protocol:uint32(_B7),
                                                                        {V3_item_num,
                                                                         _B9} =
                                                                            protocol:uint32(_B8),
                                                                        {{V3_item_id,
                                                                          V3_item_num},
                                                                         _B9}
                                                                end),
                                             {{V2_rid,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_name,
                                               V2_time,
                                               V2_prizes},
                                              _B11}
                                     end),
    {ok, {V1_logs}};
unpack(srv, 19202, _B0) ->
    {V1_times, _B1} = protocol:uint8(_B0),
    {ok, {V1_times}};
unpack(cli, 19202, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_times, _B3} = protocol:uint8(_B2),
    {V1_id, _B4} = protocol:uint32(_B3),
    {V1_prizes, _B9} = protocol:array(_B4,
                                      fun (_B5) ->
                                              {V2_item_id, _B6} =
                                                  protocol:uint32(_B5),
                                              {V2_item_num, _B7} =
                                                  protocol:uint32(_B6),
                                              {{V2_item_id, V2_item_num}, _B7}
                                      end),
    {ok, {V1_flag, V1_msg, V1_times, V1_id, V1_prizes}};
unpack(srv, 19203, _B0) -> {ok, {}};
unpack(cli, 19203, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

