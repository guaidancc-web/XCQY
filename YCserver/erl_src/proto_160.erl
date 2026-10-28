-file("src/proto/proto_160.erl", 1).

-module(proto_160).

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

-file("src/proto/proto_160.erl", 14).

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

-file("src/proto/proto_160.erl", 15).

-file("inc/help.hrl", 1).

-record(m_help,
        {ver = 1,
         next_id = 1,
         free_ids = [],
         send_msg = [],
         recv_msg = [],
         ext = []}).

-record(help_state,
        {next_record_id = 1, free_record_ids = []}).

-record(help_msg,
        {id = 0,
         help_rid,
         help_id = 0,
         record_id = 0,
         time = 0,
         digit_array = [],
         str_array = [],
         ext = []}).

-record(help_record, {record_id = 0, rid}).

-record(help_data,
        {id = 0 :: pos_integer(),
         title = "",
         fun_type = 0,
         type = 0,
         help_args :: undefined | term()}).

-file("src/proto/proto_160.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 16000, {V0_help_id}) ->
    D_a_t_a = <<V0_help_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16000:16/little,
       D_a_t_a/binary>>};
pack(srv, 16000, {V0_op_code, V0_msg}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16000:16/little,
       D_a_t_a/binary>>};
pack(cli, 16001, {}) ->
    {ok, <<2:32/little, 16001:16/little>>};
pack(srv, 16001, {V0_help_msg}) ->
    D_a_t_a = <<(length(V0_help_msg)):16/little,
                (list_to_binary([<<V1_id:8/little, V1_help_id:32/little,
                                   (length(V1_digit_array)):16/little,
                                   (list_to_binary([<<V2_key:32/little,
                                                      V2_value:32/little>>
                                                    || {V2_key, V2_value}
                                                           <- V1_digit_array]))/binary,
                                   (length(V1_str_array)):16/little,
                                   (list_to_binary([<<V2_key:32/little,
                                                      (protocol:pack(string,
                                                                     V2_value))/binary>>
                                                    || {V2_key, V2_value}
                                                           <- V1_str_array]))/binary>>
                                 || #help_msg{id = V1_id, help_id = V1_help_id,
                                              digit_array = V1_digit_array,
                                              str_array = V1_str_array}
                                        <- V0_help_msg]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16001:16/little,
       D_a_t_a/binary>>};
pack(cli, 16002, {}) ->
    {ok, <<2:32/little, 16002:16/little>>};
pack(srv, 16002, {V0_add_help_msg, V0_del_help_msg}) ->
    D_a_t_a = <<(length(V0_add_help_msg)):16/little,
                (list_to_binary([<<V1_id:8/little, V1_help_id:32/little,
                                   V1_r_id:32/little,
                                   (protocol:pack(string,
                                                  V1_r_platform))/binary,
                                   V1_r_zone_id:32/little,
                                   (length(V1_digit_array)):16/little,
                                   (list_to_binary([<<V2_digit_key:32/little,
                                                      V2_digit_val:32/little>>
                                                    || {V2_digit_key,
                                                        V2_digit_val}
                                                           <- V1_digit_array]))/binary,
                                   (length(V1_str_array)):16/little,
                                   (list_to_binary([<<V2_str_key:32/little,
                                                      (protocol:pack(string,
                                                                     V2_str_val))/binary>>
                                                    || {V2_str_key, V2_str_val}
                                                           <- V1_str_array]))/binary>>
                                 || #help_msg{id = V1_id, help_id = V1_help_id,
                                              help_rid =
                                                  {V1_r_id,
                                                   V1_r_platform,
                                                   V1_r_zone_id},
                                              digit_array = V1_digit_array,
                                              str_array = V1_str_array}
                                        <- V0_add_help_msg]))/binary,
                (length(V0_del_help_msg)):16/little,
                (list_to_binary([<<V1_id:8/little>>
                                 || #help_msg{id = V1_id}
                                        <- V0_del_help_msg]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16002:16/little,
       D_a_t_a/binary>>};
pack(cli, 16003, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16003:16/little,
       D_a_t_a/binary>>};
pack(srv, 16003, {V0_op_code, V0_msg}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16003:16/little,
       D_a_t_a/binary>>};
pack(cli, 16004, {}) ->
    {ok, <<2:32/little, 16004:16/little>>};
pack(srv, 16004, {V0_help_msg}) ->
    D_a_t_a = <<(length(V0_help_msg)):16/little,
                (list_to_binary([<<V1_id:8/little, V1_help_id:32/little,
                                   (length(V1_digit_array)):16/little,
                                   (list_to_binary([<<V2_key:32/little,
                                                      V2_value:32/little>>
                                                    || {V2_key, V2_value}
                                                           <- V1_digit_array]))/binary,
                                   (length(V1_str_array)):16/little,
                                   (list_to_binary([<<V2_key:32/little,
                                                      (protocol:pack(string,
                                                                     V2_value))/binary>>
                                                    || {V2_key, V2_value}
                                                           <- V1_str_array]))/binary>>
                                 || #help_msg{id = V1_id, help_id = V1_help_id,
                                              digit_array = V1_digit_array,
                                              str_array = V1_str_array}
                                        <- V0_help_msg]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16004:16/little,
       D_a_t_a/binary>>};
pack(cli, 16005, {V0_help_id}) ->
    D_a_t_a = <<V0_help_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16005:16/little,
       D_a_t_a/binary>>};
pack(srv, 16005, {V0_op_code, V0_msg}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16005:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 16000, _B0) ->
    {V1_help_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_help_id}};
unpack(cli, 16000, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_op_code, V1_msg}};
unpack(srv, 16001, _B0) -> {ok, {}};
unpack(cli, 16001, _B0) ->
    {V1_help_msg, _B15} = protocol:array(_B0,
                                         fun (_B1) ->
                                                 {V2_id, _B2} =
                                                     protocol:uint8(_B1),
                                                 {V2_help_id, _B3} =
                                                     protocol:uint32(_B2),
                                                 {V2_digit_array, _B8} =
                                                     protocol:array(_B3,
                                                                    fun (_B4) ->
                                                                            {V3_key,
                                                                             _B5} =
                                                                                protocol:uint32(_B4),
                                                                            {V3_value,
                                                                             _B6} =
                                                                                protocol:uint32(_B5),
                                                                            {{V3_key,
                                                                              V3_value},
                                                                             _B6}
                                                                    end),
                                                 {V2_str_array, _B13} =
                                                     protocol:array(_B8,
                                                                    fun (_B9) ->
                                                                            {V3_key,
                                                                             _B10} =
                                                                                protocol:uint32(_B9),
                                                                            {V3_value,
                                                                             _B11} =
                                                                                protocol:string(_B10),
                                                                            {{V3_key,
                                                                              V3_value},
                                                                             _B11}
                                                                    end),
                                                 {{V2_id,
                                                   V2_help_id,
                                                   V2_digit_array,
                                                   V2_str_array},
                                                  _B13}
                                         end),
    {ok, {V1_help_msg}};
unpack(srv, 16002, _B0) -> {ok, {}};
unpack(cli, 16002, _B0) ->
    {V1_add_help_msg, _B18} = protocol:array(_B0,
                                             fun (_B1) ->
                                                     {V2_id, _B2} =
                                                         protocol:uint8(_B1),
                                                     {V2_help_id, _B3} =
                                                         protocol:uint32(_B2),
                                                     {V2_r_id, _B4} =
                                                         protocol:uint32(_B3),
                                                     {V2_r_platform, _B5} =
                                                         protocol:string(_B4),
                                                     {V2_r_zone_id, _B6} =
                                                         protocol:uint32(_B5),
                                                     {V2_digit_array, _B11} =
                                                         protocol:array(_B6,
                                                                        fun
                                                                            (_B7) ->
                                                                                {V3_digit_key,
                                                                                 _B8} =
                                                                                    protocol:uint32(_B7),
                                                                                {V3_digit_val,
                                                                                 _B9} =
                                                                                    protocol:uint32(_B8),
                                                                                {{V3_digit_key,
                                                                                  V3_digit_val},
                                                                                 _B9}
                                                                        end),
                                                     {V2_str_array, _B16} =
                                                         protocol:array(_B11,
                                                                        fun
                                                                            (_B12) ->
                                                                                {V3_str_key,
                                                                                 _B13} =
                                                                                    protocol:uint32(_B12),
                                                                                {V3_str_val,
                                                                                 _B14} =
                                                                                    protocol:string(_B13),
                                                                                {{V3_str_key,
                                                                                  V3_str_val},
                                                                                 _B14}
                                                                        end),
                                                     {{V2_id,
                                                       V2_help_id,
                                                       V2_r_id,
                                                       V2_r_platform,
                                                       V2_r_zone_id,
                                                       V2_digit_array,
                                                       V2_str_array},
                                                      _B16}
                                             end),
    {V1_del_help_msg, _B22} = protocol:array(_B18,
                                             fun (_B19) ->
                                                     {V2_id, _B20} =
                                                         protocol:uint8(_B19),
                                                     {{V2_id}, _B20}
                                             end),
    {ok, {V1_add_help_msg, V1_del_help_msg}};
unpack(srv, 16003, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 16003, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_op_code, V1_msg}};
unpack(srv, 16004, _B0) -> {ok, {}};
unpack(cli, 16004, _B0) ->
    {V1_help_msg, _B15} = protocol:array(_B0,
                                         fun (_B1) ->
                                                 {V2_id, _B2} =
                                                     protocol:uint8(_B1),
                                                 {V2_help_id, _B3} =
                                                     protocol:uint32(_B2),
                                                 {V2_digit_array, _B8} =
                                                     protocol:array(_B3,
                                                                    fun (_B4) ->
                                                                            {V3_key,
                                                                             _B5} =
                                                                                protocol:uint32(_B4),
                                                                            {V3_value,
                                                                             _B6} =
                                                                                protocol:uint32(_B5),
                                                                            {{V3_key,
                                                                              V3_value},
                                                                             _B6}
                                                                    end),
                                                 {V2_str_array, _B13} =
                                                     protocol:array(_B8,
                                                                    fun (_B9) ->
                                                                            {V3_key,
                                                                             _B10} =
                                                                                protocol:uint32(_B9),
                                                                            {V3_value,
                                                                             _B11} =
                                                                                protocol:string(_B10),
                                                                            {{V3_key,
                                                                              V3_value},
                                                                             _B11}
                                                                    end),
                                                 {{V2_id,
                                                   V2_help_id,
                                                   V2_digit_array,
                                                   V2_str_array},
                                                  _B13}
                                         end),
    {ok, {V1_help_msg}};
unpack(srv, 16005, _B0) ->
    {V1_help_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_help_id}};
unpack(cli, 16005, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_op_code, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

