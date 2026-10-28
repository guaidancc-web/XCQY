-file("src/proto/proto_159.erl", 1).

-module(proto_159).

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

-file("src/proto/proto_159.erl", 14).

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

-file("src/proto/proto_159.erl", 15).

-file("inc/pray.hrl", 1).

-record(m_pray,
        {ver = 0 :: pos_integer(),
         day_best = 1 :: non_neg_integer(),
         free_rf_count = 0 :: non_neg_integer(),
         pay_rf_count = 0 :: non_neg_integer(),
         pray_result = [1, 0] :: list(),
         rewards = [] :: list(),
         is_receive = 0 :: 0..1,
         buff = 0 :: non_neg_integer()}).

-file("src/proto/proto_159.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 15900, {}) ->
    {ok, <<2:32/little, 15900:16/little>>};
pack(srv, 15900,
     {#m_pray{day_best = V0_day_best,
              free_rf_count = V0_free_rf_count,
              pay_rf_count = V0_pay_rf_count,
              pray_result = V0_pray_result, rewards = V0_rewards,
              is_receive = V0_is_receive, buff = V0_buff}}) ->
    D_a_t_a = <<V0_day_best:8/little,
                V0_free_rf_count:8/little, V0_pay_rf_count:8/little,
                (length(V0_pray_result)):16/little,
                (list_to_binary([<<V1_pray_lv:8/little>>
                                 || V1_pray_lv <- V0_pray_result]))/binary,
                (length(V0_rewards)):16/little,
                (list_to_binary([<<V1_item_id:32/little,
                                   V1_bind:8/little, V1_count:32/little>>
                                 || {V1_item_id, V1_bind, V1_count}
                                        <- V0_rewards]))/binary,
                V0_is_receive:8/little, V0_buff:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15900:16/little,
       D_a_t_a/binary>>};
pack(cli, 15901, {}) ->
    {ok, <<2:32/little, 15901:16/little>>};
pack(srv, 15901, {V0_errc_ode, V0_msg}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15901:16/little,
       D_a_t_a/binary>>};
pack(cli, 15902, {}) ->
    {ok, <<2:32/little, 15902:16/little>>};
pack(srv, 15902, {V0_errc_ode, V0_msg}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15902:16/little,
       D_a_t_a/binary>>};
pack(cli, 15903, {}) ->
    {ok, <<2:32/little, 15903:16/little>>};
pack(srv, 15903, {V0_errc_ode, V0_msg}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15903:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 15900, _B0) -> {ok, {}};
unpack(cli, 15900, _B0) ->
    {V1_day_best, _B1} = protocol:uint8(_B0),
    {V1_free_rf_count, _B2} = protocol:uint8(_B1),
    {V1_pay_rf_count, _B3} = protocol:uint8(_B2),
    {V1_pray_result, _B7} = protocol:array(_B3,
                                           fun (_B4) ->
                                                   {V2_pray_lv, _B5} =
                                                       protocol:uint8(_B4),
                                                   {{V2_pray_lv}, _B5}
                                           end),
    {V1_rewards, _B13} = protocol:array(_B7,
                                        fun (_B8) ->
                                                {V2_item_id, _B9} =
                                                    protocol:uint32(_B8),
                                                {V2_bind, _B10} =
                                                    protocol:uint8(_B9),
                                                {V2_count, _B11} =
                                                    protocol:uint32(_B10),
                                                {{V2_item_id,
                                                  V2_bind,
                                                  V2_count},
                                                 _B11}
                                        end),
    {V1_is_receive, _B14} = protocol:uint8(_B13),
    {V1_buff, _B15} = protocol:uint32(_B14),
    {ok,
     {V1_day_best,
      V1_free_rf_count,
      V1_pay_rf_count,
      V1_pray_result,
      V1_rewards,
      V1_is_receive,
      V1_buff}};
unpack(srv, 15901, _B0) -> {ok, {}};
unpack(cli, 15901, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_errc_ode, V1_msg}};
unpack(srv, 15902, _B0) -> {ok, {}};
unpack(cli, 15902, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_errc_ode, V1_msg}};
unpack(srv, 15903, _B0) -> {ok, {}};
unpack(cli, 15903, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_errc_ode, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

