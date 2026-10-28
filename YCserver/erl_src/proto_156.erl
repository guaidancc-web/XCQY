-file("src/proto/proto_156.erl", 1).

-module(proto_156).

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

-file("src/proto/proto_156.erl", 14).

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

-file("src/proto/proto_156.erl", 15).

-file("inc/meet_pet.hrl", 1).

-record(meet_pet_camp,
        {ver = 1,
         rid,
         camp_id = 0,
         camp_val = 0,
         status = 1,
         round = 0,
         day_round = 0,
         camp_list = [],
         pet_base_id = 0,
         ext = #{rand_pos => undefined, triggers => []}}).

-record(meet_pet_camp_data,
        {camp_id = 0,
         round = 0,
         weight = 0,
         unit_base_id = 0,
         battle_id = 0,
         map_base_id = 0}).

-record(meet_pet,
        {switch = close,
         ts,
         timeout,
         phase = idle,
         pet_ids = [],
         battle_ids = [],
         ext =
             #{pet_queue => queue:new(), notice_ref => undefined}}).

-record(meet_pet_item_reward,
        {base_id = 0,
         classes = 0,
         weight = 0,
         num = 0,
         is_notice = 0}).

-file("src/proto/proto_156.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 15600, {}) ->
    {ok, <<2:32/little, 15600:16/little>>};
pack(srv, 15600, {V0_phase, V0_time}) ->
    D_a_t_a = <<V0_phase:8/little, V0_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15600:16/little,
       D_a_t_a/binary>>};
pack(cli, 15601, {}) ->
    {ok, <<2:32/little, 15601:16/little>>};
pack(srv, 15601, {V0_pet_base_id}) ->
    D_a_t_a = <<(length(V0_pet_base_id)):16/little,
                (list_to_binary([<<V1_base_id:32/little>>
                                 || V1_base_id <- V0_pet_base_id]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15601:16/little,
       D_a_t_a/binary>>};
pack(cli, 15602, {}) ->
    {ok, <<2:32/little, 15602:16/little>>};
pack(srv, 15602,
     {V0_op_code, V0_msg, V0_pet_base_id}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_pet_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15602:16/little,
       D_a_t_a/binary>>};
pack(cli, 15603, {}) ->
    {ok, <<2:32/little, 15603:16/little>>};
pack(srv, 15603, {V0_op_code, V0_msg}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15603:16/little,
       D_a_t_a/binary>>};
pack(cli, 15604, {}) ->
    {ok, <<2:32/little, 15604:16/little>>};
pack(srv, 15604, {V0_op_code, V0_msg}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15604:16/little,
       D_a_t_a/binary>>};
pack(cli, 15605, {}) ->
    {ok, <<2:32/little, 15605:16/little>>};
pack(srv, 15605, {V0_status, V0_pet_base_id}) ->
    D_a_t_a = <<V0_status:8/little,
                V0_pet_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15605:16/little,
       D_a_t_a/binary>>};
pack(cli, 15607, {}) ->
    {ok, <<2:32/little, 15607:16/little>>};
pack(srv, 15607, {V0_op_code, V0_msg}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15607:16/little,
       D_a_t_a/binary>>};
pack(cli, 15608, {}) ->
    {ok, <<2:32/little, 15608:16/little>>};
pack(srv, 15608, {V0_round, V0_camp_id, V0_status}) ->
    D_a_t_a = <<V0_round:8/little, V0_camp_id:32/little,
                V0_status:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15608:16/little,
       D_a_t_a/binary>>};
pack(cli, 15609, {}) ->
    {ok, <<2:32/little, 15609:16/little>>};
pack(srv, 15609, {V0_camp_id}) ->
    D_a_t_a = <<V0_camp_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15609:16/little,
       D_a_t_a/binary>>};
pack(cli, 15610, {}) ->
    {ok, <<2:32/little, 15610:16/little>>};
pack(srv, 15610,
     {V0_op_code, V0_msg, V0_pet_base_id}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_pet_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15610:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 15600, _B0) -> {ok, {}};
unpack(cli, 15600, _B0) ->
    {V1_phase, _B1} = protocol:uint8(_B0),
    {V1_time, _B2} = protocol:uint32(_B1),
    {ok, {V1_phase, V1_time}};
unpack(srv, 15601, _B0) -> {ok, {}};
unpack(cli, 15601, _B0) ->
    {V1_pet_base_id, _B4} = protocol:array(_B0,
                                           fun (_B1) ->
                                                   {V2_base_id, _B2} =
                                                       protocol:uint32(_B1),
                                                   {{V2_base_id}, _B2}
                                           end),
    {ok, {V1_pet_base_id}};
unpack(srv, 15602, _B0) -> {ok, {}};
unpack(cli, 15602, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_pet_base_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_op_code, V1_msg, V1_pet_base_id}};
unpack(srv, 15603, _B0) -> {ok, {}};
unpack(cli, 15603, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_op_code, V1_msg}};
unpack(srv, 15604, _B0) -> {ok, {}};
unpack(cli, 15604, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_op_code, V1_msg}};
unpack(srv, 15605, _B0) -> {ok, {}};
unpack(cli, 15605, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_pet_base_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_status, V1_pet_base_id}};
unpack(srv, 15607, _B0) -> {ok, {}};
unpack(cli, 15607, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_op_code, V1_msg}};
unpack(srv, 15608, _B0) -> {ok, {}};
unpack(cli, 15608, _B0) ->
    {V1_round, _B1} = protocol:uint8(_B0),
    {V1_camp_id, _B2} = protocol:uint32(_B1),
    {V1_status, _B3} = protocol:uint8(_B2),
    {ok, {V1_round, V1_camp_id, V1_status}};
unpack(srv, 15609, _B0) -> {ok, {}};
unpack(cli, 15609, _B0) ->
    {V1_camp_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_camp_id}};
unpack(srv, 15610, _B0) -> {ok, {}};
unpack(cli, 15610, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_pet_base_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_op_code, V1_msg, V1_pet_base_id}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

