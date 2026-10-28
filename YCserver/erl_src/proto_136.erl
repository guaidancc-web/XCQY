-file("src/proto/proto_136.erl", 1).

-module(proto_136).

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

-file("src/proto/proto_136.erl", 14).

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

-file("src/proto/proto_136.erl", 15).

-file("inc/treasure.hrl", 1).

-record(treasure_reward,
        {map_id = 0,
         use_id = 0,
         reward_id = 0,
         reward_time = 0,
         show = []}).

-record(treasure_compass,
        {compass_id = 0,
         use_id = 0,
         compass_endtime = 0,
         map_id = 0,
         x = 0,
         y = 0}).

-record(m_treasure,
        {status = 0,
         reward = #treasure_reward{},
         compass = #treasure_compass{},
         total_count = 0}).

-record(treasure, {id = 1, type = 1, val = 1, num = 1}).

-record(treasure_data,
        {type = 1,
         val = 1,
         num = 1,
         ratio = 0,
         show_ratio = 0,
         can_show = 1,
         sex = 0,
         lev_low = 0,
         lev_high = 0,
         classes = 0,
         break_times_min = 0,
         break_times_max = 0}).

-file("src/proto/proto_136.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 13600, {}) ->
    {ok, <<2:32/little, 13600:16/little>>};
pack(srv, 13600,
     {V0_status,
      V0_can_num,
      V0_gain_id,
      V0_time,
      V0_table,
      V0_compass_id,
      V0_compass_end_time,
      V0_map_id,
      V0_x,
      V0_y}) ->
    D_a_t_a = <<V0_status:8/little, V0_can_num:8/little,
                V0_gain_id:8/little, V0_time:32/little,
                (length(V0_table)):16/little,
                (list_to_binary([<<V1_id:8/little, V1_type:8/little,
                                   V1_val:32/little, V1_num:8/little>>
                                 || #treasure{id = V1_id, type = V1_type,
                                              val = V1_val, num = V1_num}
                                        <- V0_table]))/binary,
                V0_compass_id:8/little, V0_compass_end_time:32/little,
                V0_map_id:16/little, V0_x:16/little, V0_y:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13600:16/little,
       D_a_t_a/binary>>};
pack(cli, 13601, {}) ->
    {ok, <<2:32/little, 13601:16/little>>};
pack(srv, 13601, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13601:16/little,
       D_a_t_a/binary>>};
pack(cli, 13602, {}) ->
    {ok, <<2:32/little, 13602:16/little>>};
pack(srv, 13602, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13602:16/little,
       D_a_t_a/binary>>};
pack(cli, 13603, {}) ->
    {ok, <<2:32/little, 13603:16/little>>};
pack(srv, 13603, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13603:16/little,
       D_a_t_a/binary>>};
pack(cli, 13604, {}) ->
    {ok, <<2:32/little, 13604:16/little>>};
pack(srv, 13604, {V0_result, V0_msg, V0_can_num}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_can_num:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13604:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 13600, _B0) -> {ok, {}};
unpack(cli, 13600, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_can_num, _B2} = protocol:uint8(_B1),
    {V1_gain_id, _B3} = protocol:uint8(_B2),
    {V1_time, _B4} = protocol:uint32(_B3),
    {V1_table, _B11} = protocol:array(_B4,
                                      fun (_B5) ->
                                              {V2_id, _B6} =
                                                  protocol:uint8(_B5),
                                              {V2_type, _B7} =
                                                  protocol:uint8(_B6),
                                              {V2_val, _B8} =
                                                  protocol:uint32(_B7),
                                              {V2_num, _B9} =
                                                  protocol:uint8(_B8),
                                              {{V2_id, V2_type, V2_val, V2_num},
                                               _B9}
                                      end),
    {V1_compass_id, _B12} = protocol:uint8(_B11),
    {V1_compass_end_time, _B13} = protocol:uint32(_B12),
    {V1_map_id, _B14} = protocol:uint16(_B13),
    {V1_x, _B15} = protocol:uint16(_B14),
    {V1_y, _B16} = protocol:uint16(_B15),
    {ok,
     {V1_status,
      V1_can_num,
      V1_gain_id,
      V1_time,
      V1_table,
      V1_compass_id,
      V1_compass_end_time,
      V1_map_id,
      V1_x,
      V1_y}};
unpack(srv, 13601, _B0) -> {ok, {}};
unpack(cli, 13601, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 13602, _B0) -> {ok, {}};
unpack(cli, 13602, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 13603, _B0) -> {ok, {}};
unpack(cli, 13603, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 13604, _B0) -> {ok, {}};
unpack(cli, 13604, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_can_num, _B3} = protocol:uint8(_B2),
    {ok, {V1_result, V1_msg, V1_can_num}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

