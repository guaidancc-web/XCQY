-file("src/proto/proto_187.erl", 1).

-module(proto_187).

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

-file("src/proto/proto_187.erl", 14).

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

-file("src/proto/proto_187.erl", 15).

-file("inc/lucky_money.hrl", 1).

-record(lucky_money,
        {id = 0,
         round_id_now = 0,
         day = 0,
         start_time = 0,
         end_time = 0,
         assets_type = 0}).

-record(lucky_money_role,
        {role_id = {0, "", 0}, lists = []}).

-record(m_lucky_money, {lists = []}).

-record(lucky_money_data,
        {id = 0,
         day = 0,
         round_id = 0,
         status = 0,
         ratio = 0,
         limit = 0,
         assets_type = 0,
         assets_value = 0,
         init_value = 0,
         reward = []}).

-file("src/proto/proto_187.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 18700, {}) ->
    {ok, <<2:32/little, 18700:16/little>>};
pack(srv, 18700,
     {#lucky_money_role{lists = V0_lists},
      #lucky_money{round_id_now = V0_round_id_now,
                   day = V0_day, start_time = V0_start_time,
                   end_time = V0_end_time}}) ->
    D_a_t_a = <<(length(V0_lists)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_round_id:32/little, V1_day:8/little,
                                   V1_status:8/little, V1_limit:8/little,
                                   V1_assets_type:32/little,
                                   V1_assets_value:32/little,
                                   V1_init_value:32/little>>
                                 || #lucky_money_data{id = V1_id,
                                                      round_id = V1_round_id,
                                                      day = V1_day,
                                                      status = V1_status,
                                                      limit = V1_limit,
                                                      assets_type =
                                                          V1_assets_type,
                                                      assets_value =
                                                          V1_assets_value,
                                                      init_value =
                                                          V1_init_value}
                                        <- V0_lists]))/binary,
                V0_round_id_now:32/little, V0_day:16/little,
                V0_start_time:32/little, V0_end_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18700:16/little,
       D_a_t_a/binary>>};
pack(cli, 18701, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18701:16/little,
       D_a_t_a/binary>>};
pack(srv, 18701, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18701:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 18700, _B0) -> {ok, {}};
unpack(cli, 18700, _B0) ->
    {V1_lists, _B11} = protocol:array(_B0,
                                      fun (_B1) ->
                                              {V2_id, _B2} =
                                                  protocol:uint32(_B1),
                                              {V2_round_id, _B3} =
                                                  protocol:uint32(_B2),
                                              {V2_day, _B4} =
                                                  protocol:uint8(_B3),
                                              {V2_status, _B5} =
                                                  protocol:uint8(_B4),
                                              {V2_limit, _B6} =
                                                  protocol:uint8(_B5),
                                              {V2_assets_type, _B7} =
                                                  protocol:uint32(_B6),
                                              {V2_assets_value, _B8} =
                                                  protocol:uint32(_B7),
                                              {V2_init_value, _B9} =
                                                  protocol:uint32(_B8),
                                              {{V2_id,
                                                V2_round_id,
                                                V2_day,
                                                V2_status,
                                                V2_limit,
                                                V2_assets_type,
                                                V2_assets_value,
                                                V2_init_value},
                                               _B9}
                                      end),
    {V1_round_id_now, _B12} = protocol:uint32(_B11),
    {V1_day, _B13} = protocol:uint16(_B12),
    {V1_start_time, _B14} = protocol:uint32(_B13),
    {V1_end_time, _B15} = protocol:uint32(_B14),
    {ok,
     {V1_lists,
      V1_round_id_now,
      V1_day,
      V1_start_time,
      V1_end_time}};
unpack(srv, 18701, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 18701, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

