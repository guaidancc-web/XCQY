-file("src/proto/proto_139.erl", 1).

-module(proto_139).

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

-file("src/proto/proto_139.erl", 14).

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

-file("src/proto/proto_139.erl", 15).

-file("inc/store.hrl", 1).

-record(m_store, {next_time = 0, items = []}).

-record(s_item,
        {id = 0,
         idx = 0,
         num = 1,
         bind = 1,
         type = 0,
         val = 0,
         flag = 0}).

-file("src/proto/proto_139.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 13900, {}) ->
    {ok, <<2:32/little, 13900:16/little>>};
pack(srv, 13900,
     {V0_last_view,
      #m_store{next_time = V0_next_time, items = V0_items},
      V0_refresh,
      V0_refreshed}) ->
    D_a_t_a = <<V0_last_view:32/little,
                V0_next_time:32/little, (length(V0_items)):16/little,
                (list_to_binary([<<V1_idx:16/little, V1_id:32/little,
                                   V1_num:32/little, V1_bind:8/little,
                                   V1_type:32/little, V1_val:32/little,
                                   V1_flag:8/little>>
                                 || #s_item{idx = V1_idx, id = V1_id,
                                            num = V1_num, bind = V1_bind,
                                            type = V1_type, val = V1_val,
                                            flag = V1_flag}
                                        <- V0_items]))/binary,
                V0_refresh:32/little, V0_refreshed:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13900:16/little,
       D_a_t_a/binary>>};
pack(cli, 13901, {V0_idx}) ->
    D_a_t_a = <<V0_idx:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13901:16/little,
       D_a_t_a/binary>>};
pack(srv, 13901, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13901:16/little,
       D_a_t_a/binary>>};
pack(cli, 13902, {}) ->
    {ok, <<2:32/little, 13902:16/little>>};
pack(srv, 13902, {V0_last_view}) ->
    D_a_t_a = <<V0_last_view:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13902:16/little,
       D_a_t_a/binary>>};
pack(cli, 13903, {}) ->
    {ok, <<2:32/little, 13903:16/little>>};
pack(srv, 13903, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13903:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 13900, _B0) -> {ok, {}};
unpack(cli, 13900, _B0) ->
    {V1_last_view, _B1} = protocol:uint32(_B0),
    {V1_next_time, _B2} = protocol:uint32(_B1),
    {V1_items, _B12} = protocol:array(_B2,
                                      fun (_B3) ->
                                              {V2_idx, _B4} =
                                                  protocol:uint16(_B3),
                                              {V2_id, _B5} =
                                                  protocol:uint32(_B4),
                                              {V2_num, _B6} =
                                                  protocol:uint32(_B5),
                                              {V2_bind, _B7} =
                                                  protocol:uint8(_B6),
                                              {V2_type, _B8} =
                                                  protocol:uint32(_B7),
                                              {V2_val, _B9} =
                                                  protocol:uint32(_B8),
                                              {V2_flag, _B10} =
                                                  protocol:uint8(_B9),
                                              {{V2_idx,
                                                V2_id,
                                                V2_num,
                                                V2_bind,
                                                V2_type,
                                                V2_val,
                                                V2_flag},
                                               _B10}
                                      end),
    {V1_refresh, _B13} = protocol:uint32(_B12),
    {V1_refreshed, _B14} = protocol:uint32(_B13),
    {ok,
     {V1_last_view,
      V1_next_time,
      V1_items,
      V1_refresh,
      V1_refreshed}};
unpack(srv, 13901, _B0) ->
    {V1_idx, _B1} = protocol:uint16(_B0),
    {ok, {V1_idx}};
unpack(cli, 13901, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 13902, _B0) -> {ok, {}};
unpack(cli, 13902, _B0) ->
    {V1_last_view, _B1} = protocol:uint32(_B0),
    {ok, {V1_last_view}};
unpack(srv, 13903, _B0) -> {ok, {}};
unpack(cli, 13903, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

