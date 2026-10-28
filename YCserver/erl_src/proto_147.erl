-file("src/proto/proto_147.erl", 1).

-module(proto_147).

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

-file("src/proto/proto_147.erl", 14).

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

-file("src/proto/proto_147.erl", 15).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 14700, {V0_content, V0_contact}) ->
    D_a_t_a = <<(protocol:pack(string, V0_content))/binary,
                (protocol:pack(string, V0_contact))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14700:16/little,
       D_a_t_a/binary>>};
pack(srv, 14700, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14700:16/little,
       D_a_t_a/binary>>};
pack(cli, 14701, {}) ->
    {ok, <<2:32/little, 14701:16/little>>};
pack(srv, 14701, {V0_version, V0_msg}) ->
    D_a_t_a = <<(protocol:pack(string, V0_version))/binary,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14701:16/little,
       D_a_t_a/binary>>};
pack(cli, 14702,
     {V0_rid,
      V0_platform,
      V0_zone_id,
      V0_reason,
      V0_msg,
      V0_type,
      V0_flag}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_reason))/binary,
                (length(V0_msg)):16/little,
                (list_to_binary([<<(protocol:pack(string,
                                                  V1_title))/binary,
                                   (protocol:pack(string, V1_content))/binary,
                                   V1_chat_time:32/little>>
                                 || {V1_title, V1_content, V1_chat_time}
                                        <- V0_msg]))/binary,
                V0_type:8/little, V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14702:16/little,
       D_a_t_a/binary>>};
pack(srv, 14702, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14702:16/little,
       D_a_t_a/binary>>};
pack(cli, 14703, {}) ->
    {ok, <<2:32/little, 14703:16/little>>};
pack(srv, 14703, {V0_name, V0_borad}) ->
    D_a_t_a = <<(protocol:pack(string, V0_name))/binary,
                (length(V0_borad)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_content))/binary,
                                   (protocol:pack(string,
                                                  V1_publish_name))/binary>>
                                 || {{V1_rid, V1_platform, V1_zone_id},
                                     V1_content,
                                     V1_publish_name}
                                        <- V0_borad]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14703:16/little,
       D_a_t_a/binary>>};
pack(cli, 14704, {}) ->
    {ok, <<2:32/little, 14704:16/little>>};
pack(srv, 14704, {V0_name, V0_mail}) ->
    D_a_t_a = <<(protocol:pack(string, V0_name))/binary,
                (length(V0_mail)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_title))/binary,
                                   (protocol:pack(string, V1_content))/binary,
                                   (protocol:pack(string,
                                                  V1_publish_name))/binary>>
                                 || {{V1_rid, V1_platform, V1_zone_id},
                                     V1_title,
                                     V1_content,
                                     V1_publish_name}
                                        <- V0_mail]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14704:16/little,
       D_a_t_a/binary>>};
pack(cli, 14705, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14705:16/little,
       D_a_t_a/binary>>};
pack(srv, 14705, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14705:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 14700, _B0) ->
    {V1_content, _B1} = protocol:string(_B0),
    {V1_contact, _B2} = protocol:string(_B1),
    {ok, {V1_content, V1_contact}};
unpack(cli, 14700, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14701, _B0) -> {ok, {}};
unpack(cli, 14701, _B0) ->
    {V1_version, _B1} = protocol:string(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_version, V1_msg}};
unpack(srv, 14702, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_reason, _B4} = protocol:string(_B3),
    {V1_msg, _B10} = protocol:array(_B4,
                                    fun (_B5) ->
                                            {V2_title, _B6} =
                                                protocol:string(_B5),
                                            {V2_content, _B7} =
                                                protocol:string(_B6),
                                            {V2_chat_time, _B8} =
                                                protocol:uint32(_B7),
                                            {{V2_title,
                                              V2_content,
                                              V2_chat_time},
                                             _B8}
                                    end),
    {V1_type, _B11} = protocol:uint8(_B10),
    {V1_flag, _B12} = protocol:uint8(_B11),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_reason,
      V1_msg,
      V1_type,
      V1_flag}};
unpack(cli, 14702, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14703, _B0) -> {ok, {}};
unpack(cli, 14703, _B0) ->
    {V1_name, _B1} = protocol:string(_B0),
    {V1_borad, _B9} = protocol:array(_B1,
                                     fun (_B2) ->
                                             {V2_rid, _B3} =
                                                 protocol:uint32(_B2),
                                             {V2_platform, _B4} =
                                                 protocol:string(_B3),
                                             {V2_zone_id, _B5} =
                                                 protocol:uint32(_B4),
                                             {V2_content, _B6} =
                                                 protocol:string(_B5),
                                             {V2_publish_name, _B7} =
                                                 protocol:string(_B6),
                                             {{V2_rid,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_content,
                                               V2_publish_name},
                                              _B7}
                                     end),
    {ok, {V1_name, V1_borad}};
unpack(srv, 14704, _B0) -> {ok, {}};
unpack(cli, 14704, _B0) ->
    {V1_name, _B1} = protocol:string(_B0),
    {V1_mail, _B10} = protocol:array(_B1,
                                     fun (_B2) ->
                                             {V2_rid, _B3} =
                                                 protocol:uint32(_B2),
                                             {V2_platform, _B4} =
                                                 protocol:string(_B3),
                                             {V2_zone_id, _B5} =
                                                 protocol:uint32(_B4),
                                             {V2_title, _B6} =
                                                 protocol:string(_B5),
                                             {V2_content, _B7} =
                                                 protocol:string(_B6),
                                             {V2_publish_name, _B8} =
                                                 protocol:string(_B7),
                                             {{V2_rid,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_title,
                                               V2_content,
                                               V2_publish_name},
                                              _B8}
                                     end),
    {ok, {V1_name, V1_mail}};
unpack(srv, 14705, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 14705, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

