-file("src/proto/proto_127.erl", 1).

-module(proto_127).

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

-file("src/proto/proto_127.erl", 14).

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

-file("src/proto/proto_127.erl", 15).

-file("inc/honor.hrl", 1).

-record(m_honor,
        {ver = 3,
         use_id = 0,
         last_id = 0,
         r_list = [] :: list(),
         pre_id = 0,
         r_pre_list = [] :: list(),
         pre_reward_list = [] :: list()}).

-record(honor,
        {id = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer()}).

-record(pre_honor,
        {pre_id = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer()}).

-record(honor_info,
        {key :: undefined | atom(),
         list = [] :: list(),
         end_time = 0 :: non_neg_integer()}).

-record(honor_base,
        {id = 0 :: non_neg_integer(),
         name = "" :: list(),
         type = 0 :: non_neg_integer(),
         mode_type = 0 :: non_neg_integer(),
         show_type = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         is_cast = 0,
         sex = 2 :: non_neg_integer(),
         attr_list = [] :: list(),
         is_can_pre = 0 :: non_neg_integer(),
         collect_val = 0 :: non_neg_integer(),
         color = 12 :: non_neg_integer()}).

-record(pre_honor_base,
        {pre_id = 0 :: non_neg_integer(),
         pre_name = "" :: list(),
         is_cast = 0,
         items = [] :: list(),
         loss_items = [] :: list()}).

-file("src/proto/proto_127.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 12700, {}) ->
    {ok, <<2:32/little, 12700:16/little>>};
pack(srv, 12700,
     {V0_use_id,
      V0_honor_list,
      V0_use_pre_id,
      V0_pre_honor_list,
      V0_pre_reward_list}) ->
    D_a_t_a = <<V0_use_id:32/little,
                (length(V0_honor_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_end_time:32/little>>
                                 || #honor{id = V1_id, end_time = V1_end_time}
                                        <- V0_honor_list]))/binary,
                V0_use_pre_id:32/little,
                (length(V0_pre_honor_list)):16/little,
                (list_to_binary([<<V1_pre_id:32/little,
                                   V1_end_time:32/little>>
                                 || #pre_honor{pre_id = V1_pre_id,
                                               end_time = V1_end_time}
                                        <- V0_pre_honor_list]))/binary,
                (length(V0_pre_reward_list)):16/little,
                (list_to_binary([<<V1_reward_id:32/little>>
                                 || V1_reward_id
                                        <- V0_pre_reward_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12700:16/little,
       D_a_t_a/binary>>};
pack(cli, 12701, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12701:16/little,
       D_a_t_a/binary>>};
pack(srv, 12701, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12701:16/little,
       D_a_t_a/binary>>};
pack(cli, 12702, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12702:16/little,
       D_a_t_a/binary>>};
pack(srv, 12702, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12702:16/little,
       D_a_t_a/binary>>};
pack(cli, 12703, {}) ->
    {ok, <<2:32/little, 12703:16/little>>};
pack(srv, 12703, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12703:16/little,
       D_a_t_a/binary>>};
pack(cli, 12704, {}) ->
    {ok, <<2:32/little, 12704:16/little>>};
pack(srv, 12704, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12704:16/little,
       D_a_t_a/binary>>};
pack(cli, 12705, {}) ->
    {ok, <<2:32/little, 12705:16/little>>};
pack(srv, 12705, {V0_honor_list}) ->
    D_a_t_a = <<(length(V0_honor_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_end_time:32/little>>
                                 || #honor{id = V1_id, end_time = V1_end_time}
                                        <- V0_honor_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12705:16/little,
       D_a_t_a/binary>>};
pack(cli, 12706, {}) ->
    {ok, <<2:32/little, 12706:16/little>>};
pack(srv, 12706, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12706:16/little,
       D_a_t_a/binary>>};
pack(cli, 12707, {}) ->
    {ok, <<2:32/little, 12707:16/little>>};
pack(srv, 12707, {V0_pre_code, V0_pre_id}) ->
    D_a_t_a = <<V0_pre_code:8/little, V0_pre_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12707:16/little,
       D_a_t_a/binary>>};
pack(cli, 12708, {V0_pre_id}) ->
    D_a_t_a = <<V0_pre_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12708:16/little,
       D_a_t_a/binary>>};
pack(srv, 12708, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12708:16/little,
       D_a_t_a/binary>>};
pack(cli, 12709, {V0_pre_id}) ->
    D_a_t_a = <<V0_pre_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12709:16/little,
       D_a_t_a/binary>>};
pack(srv, 12709, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12709:16/little,
       D_a_t_a/binary>>};
pack(cli, 12710, {V0_reward_id}) ->
    D_a_t_a = <<V0_reward_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12710:16/little,
       D_a_t_a/binary>>};
pack(srv, 12710, {V0_reward_id, V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_reward_id:32/little, V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12710:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 12700, _B0) -> {ok, {}};
unpack(cli, 12700, _B0) ->
    {V1_use_id, _B1} = protocol:uint32(_B0),
    {V1_honor_list, _B6} = protocol:array(_B1,
                                          fun (_B2) ->
                                                  {V2_id, _B3} =
                                                      protocol:uint32(_B2),
                                                  {V2_end_time, _B4} =
                                                      protocol:uint32(_B3),
                                                  {{V2_id, V2_end_time}, _B4}
                                          end),
    {V1_use_pre_id, _B7} = protocol:uint32(_B6),
    {V1_pre_honor_list, _B12} = protocol:array(_B7,
                                               fun (_B8) ->
                                                       {V2_pre_id, _B9} =
                                                           protocol:uint32(_B8),
                                                       {V2_end_time, _B10} =
                                                           protocol:uint32(_B9),
                                                       {{V2_pre_id,
                                                         V2_end_time},
                                                        _B10}
                                               end),
    {V1_pre_reward_list, _B16} = protocol:array(_B12,
                                                fun (_B13) ->
                                                        {V2_reward_id, _B14} =
                                                            protocol:uint32(_B13),
                                                        {{V2_reward_id}, _B14}
                                                end),
    {ok,
     {V1_use_id,
      V1_honor_list,
      V1_use_pre_id,
      V1_pre_honor_list,
      V1_pre_reward_list}};
unpack(srv, 12701, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 12701, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 12702, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 12702, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 12703, _B0) -> {ok, {}};
unpack(cli, 12703, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(srv, 12704, _B0) -> {ok, {}};
unpack(cli, 12704, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(srv, 12705, _B0) -> {ok, {}};
unpack(cli, 12705, _B0) ->
    {V1_honor_list, _B5} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_id, _B2} =
                                                      protocol:uint32(_B1),
                                                  {V2_end_time, _B3} =
                                                      protocol:uint32(_B2),
                                                  {{V2_id, V2_end_time}, _B3}
                                          end),
    {ok, {V1_honor_list}};
unpack(srv, 12706, _B0) -> {ok, {}};
unpack(cli, 12706, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(srv, 12707, _B0) -> {ok, {}};
unpack(cli, 12707, _B0) ->
    {V1_pre_code, _B1} = protocol:uint8(_B0),
    {V1_pre_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_pre_code, V1_pre_id}};
unpack(srv, 12708, _B0) ->
    {V1_pre_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_pre_id}};
unpack(cli, 12708, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 12709, _B0) ->
    {V1_pre_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_pre_id}};
unpack(cli, 12709, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 12710, _B0) ->
    {V1_reward_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_reward_id}};
unpack(cli, 12710, _B0) ->
    {V1_reward_id, _B1} = protocol:uint32(_B0),
    {V1_flag, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_reward_id, V1_flag, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

