-file("src/proto/proto_129.erl", 1).

-module(proto_129).

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

-file("src/proto/proto_129.erl", 14).

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

-file("src/proto/proto_129.erl", 15).

-file("inc/formation.hrl", 1).

-record(m_formation,
        {id = 1, lev = 1, pos = 1, forms = [], team_form = []}).

-record(formation, {id = 0, lev = 0, exp = 0}).

-record(formation_data,
        {id = 0,
         type = 1,
         lev = 0,
         max_lev = 1,
         name = "",
         pos_desc = [],
         attr_1 = [],
         attr_2 = [],
         attr_3 = [],
         attr_4 = [],
         attr_5 = [],
         pet_attr = [],
         strong_restrain = [],
         weak_restrain = [],
         next_exp = 0,
         need_item = [],
         item_id = 0}).

-file("src/proto/proto_129.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 12900, {}) ->
    {ok, <<2:32/little, 12900:16/little>>};
pack(srv, 12900, {V0_id, V0_lev, V0_formation_list}) ->
    D_a_t_a = <<V0_id:8/little, V0_lev:8/little,
                (length(V0_formation_list)):16/little,
                (list_to_binary([<<V1_id:8/little, V1_lev:8/little,
                                   V1_exp:16/little>>
                                 || #formation{id = V1_id, lev = V1_lev,
                                               exp = V1_exp}
                                        <- V0_formation_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12900:16/little,
       D_a_t_a/binary>>};
pack(cli, 12901, {V0_id}) ->
    D_a_t_a = <<V0_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12901:16/little,
       D_a_t_a/binary>>};
pack(srv, 12901, {V0_flag, V0_msg, V0_id, V0_lev}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary, V0_id:8/little,
                V0_lev:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12901:16/little,
       D_a_t_a/binary>>};
pack(cli, 12902, {}) ->
    {ok, <<2:32/little, 12902:16/little>>};
pack(srv, 12902, {V0_guards}) ->
    D_a_t_a = <<(length(V0_guards)):16/little,
                (list_to_binary([<<V1_guard_id:32/little,
                                   V1_number:8/little, V1_status:8/little,
                                   V1_quality:8/little>>
                                 || {V1_guard_id,
                                     V1_number,
                                     V1_status,
                                     V1_quality}
                                        <- V0_guards]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12902:16/little,
       D_a_t_a/binary>>};
pack(cli, 12903,
     {V0_role_id1,
      V0_platform1,
      V0_zone_id1,
      V0_role_id2,
      V0_platform2,
      V0_zone_id2}) ->
    D_a_t_a = <<V0_role_id1:32/little,
                (protocol:pack(string, V0_platform1))/binary,
                V0_zone_id1:16/little, V0_role_id2:32/little,
                (protocol:pack(string, V0_platform2))/binary,
                V0_zone_id2:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12903:16/little,
       D_a_t_a/binary>>};
pack(srv, 12903, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12903:16/little,
       D_a_t_a/binary>>};
pack(cli, 12904, {V0_guard_id1, V0_guard_id2}) ->
    D_a_t_a = <<V0_guard_id1:32/little,
                V0_guard_id2:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12904:16/little,
       D_a_t_a/binary>>};
pack(srv, 12904, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12904:16/little,
       D_a_t_a/binary>>};
pack(cli, 12905,
     {V0_guard_id1, V0_flag, V0_guard_id2}) ->
    D_a_t_a = <<V0_guard_id1:32/little, V0_flag:8/little,
                V0_guard_id2:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12905:16/little,
       D_a_t_a/binary>>};
pack(srv, 12905, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12905:16/little,
       D_a_t_a/binary>>};
pack(cli, 12906, {}) ->
    {ok, <<2:32/little, 12906:16/little>>};
pack(srv, 12906,
     {V0_id, V0_lev1, V0_exp1, V0_lev2, V0_exp2}) ->
    D_a_t_a = <<V0_id:8/little, V0_lev1:8/little,
                V0_exp1:16/little, V0_lev2:8/little,
                V0_exp2:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12906:16/little,
       D_a_t_a/binary>>};
pack(cli, 12907, {V0_id, V0_item_id, V0_num}) ->
    D_a_t_a = <<V0_id:8/little, V0_item_id:32/little,
                V0_num:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12907:16/little,
       D_a_t_a/binary>>};
pack(srv, 12907, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12907:16/little,
       D_a_t_a/binary>>};
pack(cli, 12908, {}) ->
    {ok, <<2:32/little, 12908:16/little>>};
pack(srv, 12908, {V0_guards}) ->
    D_a_t_a = <<(length(V0_guards)):16/little,
                (list_to_binary([<<V1_guard_id:32/little>>
                                 || V1_guard_id <- V0_guards]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12908:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 12900, _B0) -> {ok, {}};
unpack(cli, 12900, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {V1_lev, _B2} = protocol:uint8(_B1),
    {V1_formation_list, _B8} = protocol:array(_B2,
                                              fun (_B3) ->
                                                      {V2_id, _B4} =
                                                          protocol:uint8(_B3),
                                                      {V2_lev, _B5} =
                                                          protocol:uint8(_B4),
                                                      {V2_exp, _B6} =
                                                          protocol:uint16(_B5),
                                                      {{V2_id, V2_lev, V2_exp},
                                                       _B6}
                                              end),
    {ok, {V1_id, V1_lev, V1_formation_list}};
unpack(srv, 12901, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {ok, {V1_id}};
unpack(cli, 12901, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint8(_B2),
    {V1_lev, _B4} = protocol:uint8(_B3),
    {ok, {V1_flag, V1_msg, V1_id, V1_lev}};
unpack(srv, 12902, _B0) -> {ok, {}};
unpack(cli, 12902, _B0) ->
    {V1_guards, _B7} = protocol:array(_B0,
                                      fun (_B1) ->
                                              {V2_guard_id, _B2} =
                                                  protocol:uint32(_B1),
                                              {V2_number, _B3} =
                                                  protocol:uint8(_B2),
                                              {V2_status, _B4} =
                                                  protocol:uint8(_B3),
                                              {V2_quality, _B5} =
                                                  protocol:uint8(_B4),
                                              {{V2_guard_id,
                                                V2_number,
                                                V2_status,
                                                V2_quality},
                                               _B5}
                                      end),
    {ok, {V1_guards}};
unpack(srv, 12903, _B0) ->
    {V1_role_id1, _B1} = protocol:uint32(_B0),
    {V1_platform1, _B2} = protocol:string(_B1),
    {V1_zone_id1, _B3} = protocol:uint16(_B2),
    {V1_role_id2, _B4} = protocol:uint32(_B3),
    {V1_platform2, _B5} = protocol:string(_B4),
    {V1_zone_id2, _B6} = protocol:uint16(_B5),
    {ok,
     {V1_role_id1,
      V1_platform1,
      V1_zone_id1,
      V1_role_id2,
      V1_platform2,
      V1_zone_id2}};
unpack(cli, 12903, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 12904, _B0) ->
    {V1_guard_id1, _B1} = protocol:uint32(_B0),
    {V1_guard_id2, _B2} = protocol:uint32(_B1),
    {ok, {V1_guard_id1, V1_guard_id2}};
unpack(cli, 12904, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 12905, _B0) ->
    {V1_guard_id1, _B1} = protocol:uint32(_B0),
    {V1_flag, _B2} = protocol:uint8(_B1),
    {V1_guard_id2, _B3} = protocol:uint32(_B2),
    {ok, {V1_guard_id1, V1_flag, V1_guard_id2}};
unpack(cli, 12905, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 12906, _B0) -> {ok, {}};
unpack(cli, 12906, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {V1_lev1, _B2} = protocol:uint8(_B1),
    {V1_exp1, _B3} = protocol:uint16(_B2),
    {V1_lev2, _B4} = protocol:uint8(_B3),
    {V1_exp2, _B5} = protocol:uint16(_B4),
    {ok, {V1_id, V1_lev1, V1_exp1, V1_lev2, V1_exp2}};
unpack(srv, 12907, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {V1_item_id, _B2} = protocol:uint32(_B1),
    {V1_num, _B3} = protocol:uint8(_B2),
    {ok, {V1_id, V1_item_id, V1_num}};
unpack(cli, 12907, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 12908, _B0) -> {ok, {}};
unpack(cli, 12908, _B0) ->
    {V1_guards, _B4} = protocol:array(_B0,
                                      fun (_B1) ->
                                              {V2_guard_id, _B2} =
                                                  protocol:uint32(_B1),
                                              {{V2_guard_id}, _B2}
                                      end),
    {ok, {V1_guards}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

