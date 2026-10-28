-file("src/proto/proto_114.erl", 1).

-module(proto_114).

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

-file("src/proto/proto_114.erl", 14).

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

-file("src/proto/proto_114.erl", 15).

-file("inc/npc_shop.hrl", 1).

-record(npc_shop_item_data,
        {base_id :: undefined | pos_integer(),
         name :: undefined | pos_integer(),
         classes = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         step = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         group = 0 :: non_neg_integer(),
         lev_limit = 0 :: non_neg_integer(),
         price :: undefined | pos_integer(),
         item_cost :: undefined | pos_integer()}).

-file("src/proto/proto_114.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 11400, {V0_type, V0_base_id, V0_num}) ->
    D_a_t_a = <<V0_type:8/little, V0_base_id:32/little,
                V0_num:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11400:16/little,
       D_a_t_a/binary>>};
pack(srv, 11400, {}) ->
    {ok, <<2:32/little, 11400:16/little>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 11400, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_base_id, _B2} = protocol:uint32(_B1),
    {V1_num, _B3} = protocol:uint32(_B2),
    {ok, {V1_type, V1_base_id, V1_num}};
unpack(cli, 11400, _B0) -> {ok, {}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

