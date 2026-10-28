-file("src/proto/proto_138.erl", 1).

-module(proto_138).

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

-file("src/proto/proto_138.erl", 14).

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

-file("src/proto/proto_138.erl", 15).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 13800, {}) ->
    {ok, <<2:32/little, 13800:16/little>>};
pack(srv, 13800, {}) ->
    {ok, <<2:32/little, 13800:16/little>>};
pack(cli, 13801, {V0_flag, V0_item_base_id, V0_num}) ->
    D_a_t_a = <<V0_flag:8/little, V0_item_base_id:32/little,
                V0_num:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13801:16/little,
       D_a_t_a/binary>>};
pack(srv, 13801,
     {V0_count, V0_item_base_id, V0_star}) ->
    D_a_t_a = <<V0_count:8/little,
                V0_item_base_id:32/little, V0_star:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13801:16/little,
       D_a_t_a/binary>>};
pack(cli, 13802, {}) ->
    {ok, <<2:32/little, 13802:16/little>>};
pack(srv, 13802, {V0_star}) ->
    D_a_t_a = <<V0_star:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13802:16/little,
       D_a_t_a/binary>>};
pack(cli, 13803,
     {V0_role_id,
      V0_platform,
      V0_zone_id,
      V0_flag,
      V0_item_base_id,
      V0_num}) ->
    D_a_t_a = <<V0_role_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_flag:8/little,
                V0_item_base_id:32/little, V0_num:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13803:16/little,
       D_a_t_a/binary>>};
pack(srv, 13803,
     {V0_role_id,
      V0_platform,
      V0_zone_id,
      V0_name,
      V0_lev,
      V0_classes,
      V0_sex,
      V0_star,
      V0_self_star}) ->
    D_a_t_a = <<V0_role_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_name))/binary,
                V0_lev:32/little, V0_classes:8/little, V0_sex:8/little,
                V0_star:8/little, V0_self_star:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13803:16/little,
       D_a_t_a/binary>>};
pack(cli, 13804, {}) ->
    {ok, <<2:32/little, 13804:16/little>>};
pack(srv, 13804, {V0_quest_kill}) ->
    D_a_t_a = <<(length(V0_quest_kill)):16/little,
                (list_to_binary([<<V1_role_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:32/little, V1_classes:8/little,
                                   V1_sex:8/little, V1_star:8/little>>
                                 || {V1_role_id,
                                     V1_platform,
                                     V1_zone_id,
                                     V1_name,
                                     V1_lev,
                                     V1_classes,
                                     V1_sex,
                                     V1_star}
                                        <- V0_quest_kill]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13804:16/little,
       D_a_t_a/binary>>};
pack(cli, 13805, {}) ->
    {ok, <<2:32/little, 13805:16/little>>};
pack(srv, 13805, {V0_quest_kill_star_record}) ->
    D_a_t_a =
        <<(length(V0_quest_kill_star_record)):16/little,
          (list_to_binary([<<V1_role_id:32/little,
                             (protocol:pack(string, V1_platform))/binary,
                             V1_zone_id:32/little, V1_type:8/little,
                             (protocol:pack(string, V1_help_name))/binary,
                             V1_time:32/little, V1_star:8/little,
                             V1_help_star:8/little>>
                           || {V1_role_id,
                               V1_platform,
                               V1_zone_id,
                               V1_type,
                               V1_help_name,
                               V1_time,
                               V1_star,
                               V1_help_star}
                                  <- V0_quest_kill_star_record]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13805:16/little,
       D_a_t_a/binary>>};
pack(cli, 13806, {}) ->
    {ok, <<2:32/little, 13806:16/little>>};
pack(srv, 13806,
     {V0_quest_id, V0_star, V0_count, V0_item_base_id}) ->
    D_a_t_a = <<V0_quest_id:32/little, V0_star:8/little,
                V0_count:8/little, V0_item_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13806:16/little,
       D_a_t_a/binary>>};
pack(cli, 13807, {}) ->
    {ok, <<2:32/little, 13807:16/little>>};
pack(srv, 13807, {V0_star, V0_name}) ->
    D_a_t_a = <<V0_star:8/little,
                (protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13807:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 13800, _B0) -> {ok, {}};
unpack(cli, 13800, _B0) -> {ok, {}};
unpack(srv, 13801, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_item_base_id, _B2} = protocol:uint32(_B1),
    {V1_num, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_item_base_id, V1_num}};
unpack(cli, 13801, _B0) ->
    {V1_count, _B1} = protocol:uint8(_B0),
    {V1_item_base_id, _B2} = protocol:uint32(_B1),
    {V1_star, _B3} = protocol:uint8(_B2),
    {ok, {V1_count, V1_item_base_id, V1_star}};
unpack(srv, 13802, _B0) -> {ok, {}};
unpack(cli, 13802, _B0) ->
    {V1_star, _B1} = protocol:uint8(_B0),
    {ok, {V1_star}};
unpack(srv, 13803, _B0) ->
    {V1_role_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_flag, _B4} = protocol:uint8(_B3),
    {V1_item_base_id, _B5} = protocol:uint32(_B4),
    {V1_num, _B6} = protocol:uint32(_B5),
    {ok,
     {V1_role_id,
      V1_platform,
      V1_zone_id,
      V1_flag,
      V1_item_base_id,
      V1_num}};
unpack(cli, 13803, _B0) ->
    {V1_role_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_lev, _B5} = protocol:uint32(_B4),
    {V1_classes, _B6} = protocol:uint8(_B5),
    {V1_sex, _B7} = protocol:uint8(_B6),
    {V1_star, _B8} = protocol:uint8(_B7),
    {V1_self_star, _B9} = protocol:uint8(_B8),
    {ok,
     {V1_role_id,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_lev,
      V1_classes,
      V1_sex,
      V1_star,
      V1_self_star}};
unpack(srv, 13804, _B0) -> {ok, {}};
unpack(cli, 13804, _B0) ->
    {V1_quest_kill, _B11} = protocol:array(_B0,
                                           fun (_B1) ->
                                                   {V2_role_id, _B2} =
                                                       protocol:uint32(_B1),
                                                   {V2_platform, _B3} =
                                                       protocol:string(_B2),
                                                   {V2_zone_id, _B4} =
                                                       protocol:uint32(_B3),
                                                   {V2_name, _B5} =
                                                       protocol:string(_B4),
                                                   {V2_lev, _B6} =
                                                       protocol:uint32(_B5),
                                                   {V2_classes, _B7} =
                                                       protocol:uint8(_B6),
                                                   {V2_sex, _B8} =
                                                       protocol:uint8(_B7),
                                                   {V2_star, _B9} =
                                                       protocol:uint8(_B8),
                                                   {{V2_role_id,
                                                     V2_platform,
                                                     V2_zone_id,
                                                     V2_name,
                                                     V2_lev,
                                                     V2_classes,
                                                     V2_sex,
                                                     V2_star},
                                                    _B9}
                                           end),
    {ok, {V1_quest_kill}};
unpack(srv, 13805, _B0) -> {ok, {}};
unpack(cli, 13805, _B0) ->
    {V1_quest_kill_star_record, _B11} = protocol:array(_B0,
                                                       fun (_B1) ->
                                                               {V2_role_id,
                                                                _B2} =
                                                                   protocol:uint32(_B1),
                                                               {V2_platform,
                                                                _B3} =
                                                                   protocol:string(_B2),
                                                               {V2_zone_id,
                                                                _B4} =
                                                                   protocol:uint32(_B3),
                                                               {V2_type, _B5} =
                                                                   protocol:uint8(_B4),
                                                               {V2_help_name,
                                                                _B6} =
                                                                   protocol:string(_B5),
                                                               {V2_time, _B7} =
                                                                   protocol:uint32(_B6),
                                                               {V2_star, _B8} =
                                                                   protocol:uint8(_B7),
                                                               {V2_help_star,
                                                                _B9} =
                                                                   protocol:uint8(_B8),
                                                               {{V2_role_id,
                                                                 V2_platform,
                                                                 V2_zone_id,
                                                                 V2_type,
                                                                 V2_help_name,
                                                                 V2_time,
                                                                 V2_star,
                                                                 V2_help_star},
                                                                _B9}
                                                       end),
    {ok, {V1_quest_kill_star_record}};
unpack(srv, 13806, _B0) -> {ok, {}};
unpack(cli, 13806, _B0) ->
    {V1_quest_id, _B1} = protocol:uint32(_B0),
    {V1_star, _B2} = protocol:uint8(_B1),
    {V1_count, _B3} = protocol:uint8(_B2),
    {V1_item_base_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_quest_id, V1_star, V1_count, V1_item_base_id}};
unpack(srv, 13807, _B0) -> {ok, {}};
unpack(cli, 13807, _B0) ->
    {V1_star, _B1} = protocol:uint8(_B0),
    {V1_name, _B2} = protocol:string(_B1),
    {ok, {V1_star, V1_name}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

