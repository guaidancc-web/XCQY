-file("src/proto/proto_184.erl", 1).

-module(proto_184).

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

-file("src/proto/proto_184.erl", 14).

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

-file("src/proto/proto_184.erl", 15).

-file("inc/reward_back.hrl", 1).

-record(m_reward_back,
        {ver = 3,
         next_id = 1,
         list = [],
         zero_time = 0,
         five_time = 0,
         world_lev = 40,
         last_lev = 1}).

-record(reward_back_data,
        {ver = 1,
         id = 0,
         active_id = 0,
         finish = 0,
         all = 0,
         back = 0,
         reward = [],
         time = 0}).

-file("src/proto/proto_184.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 18400, {}) ->
    {ok, <<2:32/little, 18400:16/little>>};
pack(srv, 18400,
     {#m_reward_back{last_lev = V0_last_lev,
                     list = V0_list}}) ->
    D_a_t_a = <<V0_last_lev:16/little,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_active_id:16/little,
                                   V1_finish:16/little, V1_all:16/little,
                                   V1_back:16/little,
                                   (length(V1_reward)):16/little,
                                   (list_to_binary([<<V2_type:32/little,
                                                      V2_value:32/little>>
                                                    || {V2_type, V2_value}
                                                           <- V1_reward]))/binary>>
                                 || #reward_back_data{active_id = V1_active_id,
                                                      finish = V1_finish,
                                                      all = V1_all,
                                                      back = V1_back,
                                                      reward = V1_reward}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18400:16/little,
       D_a_t_a/binary>>};
pack(cli, 18401, {V0_acitve_id, V0_times, V0_type}) ->
    D_a_t_a = <<V0_acitve_id:16/little, V0_times:8/little,
                V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18401:16/little,
       D_a_t_a/binary>>};
pack(srv, 18401, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18401:16/little,
       D_a_t_a/binary>>};
pack(cli, 18402, {V0_type}) ->
    D_a_t_a = <<V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18402:16/little,
       D_a_t_a/binary>>};
pack(srv, 18402, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18402:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 18400, _B0) -> {ok, {}};
unpack(cli, 18400, _B0) ->
    {V1_last_lev, _B1} = protocol:uint16(_B0),
    {V1_list, _B13} = protocol:array(_B1,
                                     fun (_B2) ->
                                             {V2_active_id, _B3} =
                                                 protocol:uint16(_B2),
                                             {V2_finish, _B4} =
                                                 protocol:uint16(_B3),
                                             {V2_all, _B5} =
                                                 protocol:uint16(_B4),
                                             {V2_back, _B6} =
                                                 protocol:uint16(_B5),
                                             {V2_reward, _B11} =
                                                 protocol:array(_B6,
                                                                fun (_B7) ->
                                                                        {V3_type,
                                                                         _B8} =
                                                                            protocol:uint32(_B7),
                                                                        {V3_value,
                                                                         _B9} =
                                                                            protocol:uint32(_B8),
                                                                        {{V3_type,
                                                                          V3_value},
                                                                         _B9}
                                                                end),
                                             {{V2_active_id,
                                               V2_finish,
                                               V2_all,
                                               V2_back,
                                               V2_reward},
                                              _B11}
                                     end),
    {ok, {V1_last_lev, V1_list}};
unpack(srv, 18401, _B0) ->
    {V1_acitve_id, _B1} = protocol:uint16(_B0),
    {V1_times, _B2} = protocol:uint8(_B1),
    {V1_type, _B3} = protocol:uint8(_B2),
    {ok, {V1_acitve_id, V1_times, V1_type}};
unpack(cli, 18401, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 18402, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_type}};
unpack(cli, 18402, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

