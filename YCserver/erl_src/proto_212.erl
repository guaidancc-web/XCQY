-file("src/proto/proto_212.erl", 1).

-module(proto_212).

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

-file("src/proto/proto_212.erl", 14).

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

-file("src/proto/proto_212.erl", 15).

-file("inc/camp_pray.hrl", 1).

-record(m_camp_pray,
        {ver = 2,
         camp_id = 0,
         reset_times = 0,
         choose_ids = [],
         do_times = 0,
         must_items = []}).

-file("src/proto/proto_212.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 21200, {}) ->
    {ok, <<2:32/little, 21200:16/little>>};
pack(srv, 21200,
     {#m_camp_pray{reset_times = V0_reset_times,
                   choose_ids = V0_choose_ids},
      V0_pray_times}) ->
    D_a_t_a = <<V0_reset_times:8/little,
                (length(V0_choose_ids)):16/little,
                (list_to_binary([<<V1_id:32/little>>
                                 || V1_id <- V0_choose_ids]))/binary,
                V0_pray_times:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 21200:16/little,
       D_a_t_a/binary>>};
pack(cli, 21201, {V0_choose_items}) ->
    D_a_t_a = <<(length(V0_choose_items)):16/little,
                (list_to_binary([<<V1_id:32/little>>
                                 || V1_id <- V0_choose_items]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 21201:16/little,
       D_a_t_a/binary>>};
pack(srv, 21201, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 21201:16/little,
       D_a_t_a/binary>>};
pack(cli, 21202, {V0_mode}) ->
    D_a_t_a = <<V0_mode:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 21202:16/little,
       D_a_t_a/binary>>};
pack(srv, 21202, {V0_flag, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 21202:16/little,
       D_a_t_a/binary>>};
pack(cli, 21203, {}) ->
    {ok, <<2:32/little, 21203:16/little>>};
pack(srv, 21203, {V0_flag, V0_msg, V0_gain}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                (length(V0_gain)):16/little,
                (list_to_binary([<<V1_item_id:32/little,
                                   V1_count:32/little>>
                                 || {V1_item_id, V1_count}
                                        <- V0_gain]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 21203:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 21200, _B0) -> {ok, {}};
unpack(cli, 21200, _B0) ->
    {V1_reset_times, _B1} = protocol:uint8(_B0),
    {V1_choose_ids, _B5} = protocol:array(_B1,
                                          fun (_B2) ->
                                                  {V2_id, _B3} =
                                                      protocol:uint32(_B2),
                                                  {{V2_id}, _B3}
                                          end),
    {V1_pray_times, _B6} = protocol:uint32(_B5),
    {ok, {V1_reset_times, V1_choose_ids, V1_pray_times}};
unpack(srv, 21201, _B0) ->
    {V1_choose_items, _B4} = protocol:array(_B0,
                                            fun (_B1) ->
                                                    {V2_id, _B2} =
                                                        protocol:uint32(_B1),
                                                    {{V2_id}, _B2}
                                            end),
    {ok, {V1_choose_items}};
unpack(cli, 21201, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 21202, _B0) ->
    {V1_mode, _B1} = protocol:uint8(_B0),
    {ok, {V1_mode}};
unpack(cli, 21202, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_id}};
unpack(srv, 21203, _B0) -> {ok, {}};
unpack(cli, 21203, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_gain, _B7} = protocol:array(_B2,
                                    fun (_B3) ->
                                            {V2_item_id, _B4} =
                                                protocol:uint32(_B3),
                                            {V2_count, _B5} =
                                                protocol:uint32(_B4),
                                            {{V2_item_id, V2_count}, _B5}
                                    end),
    {ok, {V1_flag, V1_msg, V1_gain}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

