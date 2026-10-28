-file("src/proto/proto_149.erl", 1).

-module(proto_149).

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

-file("src/proto/proto_149.erl", 14).

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

-file("src/proto/proto_149.erl", 15).

-file("inc/alchemy.hrl", 1).

-record(m_alchemy, {ver = 0, shops = []}).

-record(alchemy_shop,
        {ver = 1,
         id = 0 :: non_neg_integer(),
         volume = 0,
         products = [],
         is_auto = 1 :: 1 | 0}).

-file("src/proto/proto_149.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 14900, {}) ->
    {ok, <<2:32/little, 14900:16/little>>};
pack(srv, 14900, {V0_shops}) ->
    D_a_t_a = <<(length(V0_shops)):16/little,
                (list_to_binary([<<V1_id:16/little, V1_volume:8/little,
                                   V1_is_auto:8/little,
                                   (length(V1_products)):16/little,
                                   (list_to_binary([<<V2_time:32/little>>
                                                    || V2_time
                                                           <- V1_products]))/binary>>
                                 || #alchemy_shop{id = V1_id,
                                                  volume = V1_volume,
                                                  is_auto = V1_is_auto,
                                                  products = V1_products}
                                        <- V0_shops]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14900:16/little,
       D_a_t_a/binary>>};
pack(cli, 14901, {V0_id}) ->
    D_a_t_a = <<V0_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14901:16/little,
       D_a_t_a/binary>>};
pack(srv, 14901, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14901:16/little,
       D_a_t_a/binary>>};
pack(cli, 14902, {V0_id}) ->
    D_a_t_a = <<V0_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14902:16/little,
       D_a_t_a/binary>>};
pack(srv, 14902, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14902:16/little,
       D_a_t_a/binary>>};
pack(cli, 14903, {V0_id}) ->
    D_a_t_a = <<V0_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14903:16/little,
       D_a_t_a/binary>>};
pack(srv, 14903, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14903:16/little,
       D_a_t_a/binary>>};
pack(cli, 14904, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_num:32/little>>
                                 || {V1_id, V1_num} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14904:16/little,
       D_a_t_a/binary>>};
pack(srv, 14904, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14904:16/little,
       D_a_t_a/binary>>};
pack(cli, 14905, {V0_num}) ->
    D_a_t_a = <<V0_num:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14905:16/little,
       D_a_t_a/binary>>};
pack(srv, 14905, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14905:16/little,
       D_a_t_a/binary>>};
pack(cli, 14906, {}) ->
    {ok, <<2:32/little, 14906:16/little>>};
pack(srv, 14906, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14906:16/little,
       D_a_t_a/binary>>};
pack(cli, 14907, {}) ->
    {ok, <<2:32/little, 14907:16/little>>};
pack(srv, 14907, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14907:16/little,
       D_a_t_a/binary>>};
pack(cli, 14908, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14908:16/little,
       D_a_t_a/binary>>};
pack(srv, 14908, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14908:16/little,
       D_a_t_a/binary>>};
pack(cli, 14909, {V0_id, V0_is_auto}) ->
    D_a_t_a = <<V0_id:16/little, V0_is_auto:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14909:16/little,
       D_a_t_a/binary>>};
pack(srv, 14909, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14909:16/little,
       D_a_t_a/binary>>};
pack(cli, 14910, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14910:16/little,
       D_a_t_a/binary>>};
pack(srv, 14910, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14910:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 14900, _B0) -> {ok, {}};
unpack(cli, 14900, _B0) ->
    {V1_shops, _B10} = protocol:array(_B0,
                                      fun (_B1) ->
                                              {V2_id, _B2} =
                                                  protocol:uint16(_B1),
                                              {V2_volume, _B3} =
                                                  protocol:uint8(_B2),
                                              {V2_is_auto, _B4} =
                                                  protocol:uint8(_B3),
                                              {V2_products, _B8} =
                                                  protocol:array(_B4,
                                                                 fun (_B5) ->
                                                                         {V3_time,
                                                                          _B6} =
                                                                             protocol:uint32(_B5),
                                                                         {{V3_time},
                                                                          _B6}
                                                                 end),
                                              {{V2_id,
                                                V2_volume,
                                                V2_is_auto,
                                                V2_products},
                                               _B8}
                                      end),
    {ok, {V1_shops}};
unpack(srv, 14901, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0),
    {ok, {V1_id}};
unpack(cli, 14901, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14902, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0),
    {ok, {V1_id}};
unpack(cli, 14902, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14903, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0),
    {ok, {V1_id}};
unpack(cli, 14903, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14904, _B0) ->
    {V1_list, _B5} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_id, _B2} = protocol:uint32(_B1),
                                            {V2_num, _B3} =
                                                protocol:uint32(_B2),
                                            {{V2_id, V2_num}, _B3}
                                    end),
    {ok, {V1_list}};
unpack(cli, 14904, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14905, _B0) ->
    {V1_num, _B1} = protocol:uint16(_B0),
    {ok, {V1_num}};
unpack(cli, 14905, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14906, _B0) -> {ok, {}};
unpack(cli, 14906, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14907, _B0) -> {ok, {}};
unpack(cli, 14907, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14908, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 14908, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14909, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0),
    {V1_is_auto, _B2} = protocol:uint8(_B1),
    {ok, {V1_id, V1_is_auto}};
unpack(cli, 14909, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14910, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 14910, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

