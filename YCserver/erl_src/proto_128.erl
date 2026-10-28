-file("src/proto/proto_128.erl", 1).

-module(proto_128).

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

-file("src/proto/proto_128.erl", 14).

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

-file("src/proto/proto_128.erl", 15).

-file("inc/buff.hrl", 1).

-record(m_buff, {ver = 2, r_list = [], show = 1}).

-record(buff_base,
        {id = 1,
         name = "",
         class = 0,
         lev = 0,
         cancel = 0,
         same_buff_mode = 0,
         type = 1,
         sub_type = 0,
         time_mode = 0,
         max_time_num = 1,
         duration = 0,
         max_effect_lev = 1,
         looks = [],
         attr = [],
         guard_attr = [],
         pet_attr = [],
         end_date = 0,
         extra = [],
         effect = [],
         dynamic_attr = [],
         pvp_limit = 0,
         desc = ""}).

-record(buff,
        {ver = 4,
         id = 1,
         class = 0,
         lev = 0,
         cancel = 0,
         type = 1,
         same_buff_mode = 0,
         time_mode = 0,
         duration = 0,
         max_duration = 1,
         effect_lev = 1,
         end_date = 0,
         start_time = 0,
         looks = [],
         dynamic_attr = [],
         pvped = 0,
         ext_param = [],
         args = 1}).

-file("src/proto/proto_128.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 12800, {}) ->
    {ok, <<2:32/little, 12800:16/little>>};
pack(srv, 12800, {V0_buff_list}) ->
    D_a_t_a = <<(length(V0_buff_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_duration:32/signed-little,
                                   V1_cancel:8/little, V1_effect_lev:8/little,
                                   V1_start_time:32/little,
                                   (length(V1_dynamic_attr)):16/little,
                                   (list_to_binary([<<V2_attr:8/little,
                                                      V2_value:32/little>>
                                                    || {V2_attr, V2_value}
                                                           <- V1_dynamic_attr]))/binary,
                                   V1_pvped:16/little>>
                                 || #buff{id = V1_id, duration = V1_duration,
                                          cancel = V1_cancel,
                                          effect_lev = V1_effect_lev,
                                          start_time = V1_start_time,
                                          dynamic_attr = V1_dynamic_attr,
                                          pvped = V1_pvped}
                                        <- V0_buff_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12800:16/little,
       D_a_t_a/binary>>};
pack(cli, 12801, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12801:16/little,
       D_a_t_a/binary>>};
pack(srv, 12801, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12801:16/little,
       D_a_t_a/binary>>};
pack(cli, 12802, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12802:16/little,
       D_a_t_a/binary>>};
pack(srv, 12802, {V0_flag, V0_msg, V0_show}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_show:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12802:16/little,
       D_a_t_a/binary>>};
pack(cli, 12803, {}) ->
    {ok, <<2:32/little, 12803:16/little>>};
pack(srv, 12803, {V0_show}) ->
    D_a_t_a = <<V0_show:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12803:16/little,
       D_a_t_a/binary>>};
pack(cli, 12804, {}) ->
    {ok, <<2:32/little, 12804:16/little>>};
pack(srv, 12804, {V0_msg, V0_base_id}) ->
    D_a_t_a = <<(protocol:pack(string, V0_msg))/binary,
                V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12804:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 12800, _B0) -> {ok, {}};
unpack(cli, 12800, _B0) ->
    {V1_buff_list, _B14} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_id, _B2} =
                                                      protocol:uint32(_B1),
                                                  {V2_duration, _B3} =
                                                      protocol:int32(_B2),
                                                  {V2_cancel, _B4} =
                                                      protocol:uint8(_B3),
                                                  {V2_effect_lev, _B5} =
                                                      protocol:uint8(_B4),
                                                  {V2_start_time, _B6} =
                                                      protocol:uint32(_B5),
                                                  {V2_dynamic_attr, _B11} =
                                                      protocol:array(_B6,
                                                                     fun
                                                                         (_B7) ->
                                                                             {V3_attr,
                                                                              _B8} =
                                                                                 protocol:uint8(_B7),
                                                                             {V3_value,
                                                                              _B9} =
                                                                                 protocol:uint32(_B8),
                                                                             {{V3_attr,
                                                                               V3_value},
                                                                              _B9}
                                                                     end),
                                                  {V2_pvped, _B12} =
                                                      protocol:uint16(_B11),
                                                  {{V2_id,
                                                    V2_duration,
                                                    V2_cancel,
                                                    V2_effect_lev,
                                                    V2_start_time,
                                                    V2_dynamic_attr,
                                                    V2_pvped},
                                                   _B12}
                                          end),
    {ok, {V1_buff_list}};
unpack(srv, 12801, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 12801, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 12802, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(cli, 12802, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_show, _B3} = protocol:uint8(_B2),
    {ok, {V1_flag, V1_msg, V1_show}};
unpack(srv, 12803, _B0) -> {ok, {}};
unpack(cli, 12803, _B0) ->
    {V1_show, _B1} = protocol:uint8(_B0),
    {ok, {V1_show}};
unpack(srv, 12804, _B0) -> {ok, {}};
unpack(cli, 12804, _B0) ->
    {V1_msg, _B1} = protocol:string(_B0),
    {V1_base_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_msg, V1_base_id}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

