-file("src/proto/proto_173.erl", 1).

-module(proto_173).

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

-file("src/proto/proto_173.erl", 14).

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

-file("src/proto/proto_173.erl", 15).

-file("inc/head.hrl", 1).

-record(m_head,
        {ver = 2 :: pos_integer(),
         id_now = 0 :: non_neg_integer(),
         time_buy = 0 :: non_neg_integer(),
         day = 0 :: non_neg_integer(),
         head = [] :: list(),
         frame_id_now = 0 :: non_neg_integer(),
         frame_time_buy = 0 :: non_neg_integer(),
         frame_day = 0 :: non_neg_integer(),
         head_frame = [] :: list()}).

-record(head,
        {id = 0 :: non_neg_integer(),
         time_buy = 0 :: non_neg_integer(),
         day = 0 :: non_neg_integer(),
         list = [] :: list()}).

-record(head_frame,
        {id = 0 :: non_neg_integer(),
         time_buy = 0 :: non_neg_integer(),
         day = 0 :: non_neg_integer(),
         list = [] :: list()}).

-file("src/proto/proto_173.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 17300, {}) ->
    {ok, <<2:32/little, 17300:16/little>>};
pack(srv, 17300,
     {#m_head{id_now = V0_id_now, head = V0_head,
              frame_id_now = V0_frame_id_now,
              head_frame = V0_head_frame},
      V0_gold}) ->
    D_a_t_a = <<V0_id_now:8/little,
                (length(V0_head)):16/little,
                (list_to_binary([<<V1_id:8/little,
                                   V1_time_buy:32/little, V1_day:32/little,
                                   (length(V1_list)):16/little,
                                   (list_to_binary([<<V2_type:8/little,
                                                      V2_num:32/little>>
                                                    || {V2_type, V2_num}
                                                           <- V1_list]))/binary>>
                                 || #head{id = V1_id, time_buy = V1_time_buy,
                                          day = V1_day, list = V1_list}
                                        <- V0_head]))/binary,
                V0_frame_id_now:32/little,
                (length(V0_head_frame)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_time_buy:32/little, V1_day:32/little,
                                   (length(V1_list)):16/little,
                                   (list_to_binary([<<V2_type:8/little,
                                                      V2_num:32/little>>
                                                    || {V2_type, V2_num}
                                                           <- V1_list]))/binary>>
                                 || #head_frame{id = V1_id,
                                                time_buy = V1_time_buy,
                                                day = V1_day, list = V1_list}
                                        <- V0_head_frame]))/binary,
                V0_gold:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17300:16/little,
       D_a_t_a/binary>>};
pack(cli, 17301, {V0_id, V0_list}) ->
    D_a_t_a = <<V0_id:8/little, (length(V0_list)):16/little,
                (list_to_binary([<<V1_type:8/little, V1_num:32/little>>
                                 || {V1_type, V1_num} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17301:16/little,
       D_a_t_a/binary>>};
pack(srv, 17301, {}) ->
    {ok, <<2:32/little, 17301:16/little>>};
pack(cli, 17302, {V0_id}) ->
    D_a_t_a = <<V0_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17302:16/little,
       D_a_t_a/binary>>};
pack(srv, 17302, {V0_id, V0_msg}) ->
    D_a_t_a = <<V0_id:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17302:16/little,
       D_a_t_a/binary>>};
pack(cli, 17303, {V0_id}) ->
    D_a_t_a = <<V0_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17303:16/little,
       D_a_t_a/binary>>};
pack(srv, 17303, {}) ->
    {ok, <<2:32/little, 17303:16/little>>};
pack(cli, 17304, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17304:16/little,
       D_a_t_a/binary>>};
pack(srv, 17304,
     {{V0_rid, V0_platform, V0_zone_id}, V0_list}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, (length(V0_list)):16/little,
                (list_to_binary([<<V1_type:8/little, V1_num:16/little>>
                                 || {V1_type, V1_num} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17304:16/little,
       D_a_t_a/binary>>};
pack(cli, 17305, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17305:16/little,
       D_a_t_a/binary>>};
pack(srv, 17305, {}) ->
    {ok, <<2:32/little, 17305:16/little>>};
pack(cli, 17306, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17306:16/little,
       D_a_t_a/binary>>};
pack(srv, 17306, {V0_id, V0_msg}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17306:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 17300, _B0) -> {ok, {}};
unpack(cli, 17300, _B0) ->
    {V1_id_now, _B1} = protocol:uint8(_B0),
    {V1_head, _B12} = protocol:array(_B1,
                                     fun (_B2) ->
                                             {V2_id, _B3} = protocol:uint8(_B2),
                                             {V2_time_buy, _B4} =
                                                 protocol:uint32(_B3),
                                             {V2_day, _B5} =
                                                 protocol:uint32(_B4),
                                             {V2_list, _B10} =
                                                 protocol:array(_B5,
                                                                fun (_B6) ->
                                                                        {V3_type,
                                                                         _B7} =
                                                                            protocol:uint8(_B6),
                                                                        {V3_num,
                                                                         _B8} =
                                                                            protocol:uint32(_B7),
                                                                        {{V3_type,
                                                                          V3_num},
                                                                         _B8}
                                                                end),
                                             {{V2_id,
                                               V2_time_buy,
                                               V2_day,
                                               V2_list},
                                              _B10}
                                     end),
    {V1_frame_id_now, _B13} = protocol:uint32(_B12),
    {V1_head_frame, _B24} = protocol:array(_B13,
                                           fun (_B14) ->
                                                   {V2_id, _B15} =
                                                       protocol:uint32(_B14),
                                                   {V2_time_buy, _B16} =
                                                       protocol:uint32(_B15),
                                                   {V2_day, _B17} =
                                                       protocol:uint32(_B16),
                                                   {V2_list, _B22} =
                                                       protocol:array(_B17,
                                                                      fun
                                                                          (_B18) ->
                                                                              {V3_type,
                                                                               _B19} =
                                                                                  protocol:uint8(_B18),
                                                                              {V3_num,
                                                                               _B20} =
                                                                                  protocol:uint32(_B19),
                                                                              {{V3_type,
                                                                                V3_num},
                                                                               _B20}
                                                                      end),
                                                   {{V2_id,
                                                     V2_time_buy,
                                                     V2_day,
                                                     V2_list},
                                                    _B22}
                                           end),
    {V1_gold, _B25} = protocol:uint32(_B24),
    {ok,
     {V1_id_now,
      V1_head,
      V1_frame_id_now,
      V1_head_frame,
      V1_gold}};
unpack(srv, 17301, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {V1_list, _B6} = protocol:array(_B1,
                                    fun (_B2) ->
                                            {V2_type, _B3} =
                                                protocol:uint8(_B2),
                                            {V2_num, _B4} =
                                                protocol:uint32(_B3),
                                            {{V2_type, V2_num}, _B4}
                                    end),
    {ok, {V1_id, V1_list}};
unpack(cli, 17301, _B0) -> {ok, {}};
unpack(srv, 17302, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {ok, {V1_id}};
unpack(cli, 17302, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_id, V1_msg}};
unpack(srv, 17303, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {ok, {V1_id}};
unpack(cli, 17303, _B0) -> {ok, {}};
unpack(srv, 17304, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 17304, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_list, _B8} = protocol:array(_B3,
                                    fun (_B4) ->
                                            {V2_type, _B5} =
                                                protocol:uint8(_B4),
                                            {V2_num, _B6} =
                                                protocol:uint16(_B5),
                                            {{V2_type, V2_num}, _B6}
                                    end),
    {ok, {V1_rid, V1_platform, V1_zone_id, V1_list}};
unpack(srv, 17305, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 17305, _B0) -> {ok, {}};
unpack(srv, 17306, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 17306, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_id, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

