-file("src/proto/proto_168.erl", 1).

-module(proto_168).

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

-file("src/proto/proto_168.erl", 14).

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

-file("src/proto/proto_168.erl", 15).

-file("inc/goodvoice.hrl", 1).

-record(goodvoice,
        {ver = 4,
         role_id = {0, "", 0},
         id = 0,
         platform = "",
         zone_id = 0,
         name = "",
         sex = 0,
         lev = 0,
         classes = 0,
         time = 0,
         summary = "",
         update_time = 0,
         file_name = "",
         liked = 0,
         likers = [],
         flower_likers = [],
         today_flower = 0,
         update_flower = 0,
         caster_num = 0,
         caster = [],
         logs = [],
         only_liked = 0,
         flower = 0}).

-record(goodvoice_report_info,
        {id, time, lev, name, report = []}).

-record(goodvoice_report,
        {id, order, name, lev, time, filename}).

-record(goodvoice_rank,
        {ver = 1,
         role_id = {0, "", 0},
         id = 0,
         platform = "",
         zone_id = 0,
         name = "",
         sex = 0,
         lev = 0,
         classes = 0,
         time = 0,
         summary = "",
         update_time = 0,
         file_name = "",
         liked = 0,
         today_flower = 0,
         update_flower = 0,
         caster_num = 0,
         rank = 0,
         only_liked = 0,
         flower = 0}).

-file("src/proto/proto_168.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 16800, {V0_summary, V0_voice, V0_time}) ->
    D_a_t_a = <<(protocol:pack(string, V0_summary))/binary,
                (byte_size(V0_voice)):32/little, V0_voice/binary,
                V0_time:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16800:16/little,
       D_a_t_a/binary>>};
pack(srv, 16800, {V0_result, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16800:16/little,
       D_a_t_a/binary>>};
pack(cli, 16801, {}) ->
    {ok, <<2:32/little, 16801:16/little>>};
pack(srv, 16801, {V0_goodvoice_list, V0_follow}) ->
    D_a_t_a = <<(length(V0_goodvoice_list)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:8/little, V1_time:16/little,
                                   V1_update_time:32/little,
                                   (protocol:pack(string, V1_summary))/binary,
                                   V1_liked:32/little, V1_caster_num:32/little,
                                   V1_only_liked:32/little>>
                                 || #goodvoice{id = V1_id,
                                               role_id =
                                                   {V1_rid,
                                                    V1_platform,
                                                    V1_zone_id},
                                               name = V1_name, sex = V1_sex,
                                               classes = V1_classes,
                                               lev = V1_lev, time = V1_time,
                                               update_time = V1_update_time,
                                               summary = V1_summary,
                                               liked = V1_liked,
                                               caster_num = V1_caster_num,
                                               only_liked = V1_only_liked}
                                        <- V0_goodvoice_list]))/binary,
                (length(V0_follow)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little>>
                                 || {V1_rid, V1_platform, V1_zone_id}
                                        <- V0_follow]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16801:16/little,
       D_a_t_a/binary>>};
pack(cli, 16802, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16802:16/little,
       D_a_t_a/binary>>};
pack(srv, 16802,
     {V0_result,
      V0_msg,
      V0_id,
      V0_rid,
      V0_platform,
      V0_zone_id,
      V0_update_time,
      V0_voice}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary, V0_id:32/little,
                V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_update_time:32/little,
                (byte_size(V0_voice)):32/little, V0_voice/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16802:16/little,
       D_a_t_a/binary>>};
pack(cli, 16803, {}) ->
    {ok, <<2:32/little, 16803:16/little>>};
pack(srv, 16803,
     {#goodvoice{id = V0_id, time = V0_time,
                 update_time = V0_update_time, summary = V0_summary,
                 liked = V0_liked, caster_num = V0_caster_num}}) ->
    D_a_t_a = <<V0_id:32/little, V0_time:16/little,
                V0_update_time:32/little,
                (protocol:pack(string, V0_summary))/binary,
                V0_liked:32/little, V0_caster_num:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16803:16/little,
       D_a_t_a/binary>>};
pack(cli, 16804, {V0_voice, V0_time}) ->
    D_a_t_a = <<(byte_size(V0_voice)):32/little,
                V0_voice/binary, V0_time:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16804:16/little,
       D_a_t_a/binary>>};
pack(srv, 16804, {V0_result, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16804:16/little,
       D_a_t_a/binary>>};
pack(cli, 16805, {V0_summary}) ->
    D_a_t_a = <<(protocol:pack(string,
                               V0_summary))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16805:16/little,
       D_a_t_a/binary>>};
pack(srv, 16805, {V0_result, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16805:16/little,
       D_a_t_a/binary>>};
pack(cli, 16806,
     {V0_rid, V0_platform, V0_zone_id, V0_follow}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_follow:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16806:16/little,
       D_a_t_a/binary>>};
pack(srv, 16806,
     {V0_result,
      V0_msg,
      V0_rid,
      V0_platform,
      V0_zone_id,
      V0_follow}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_follow:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16806:16/little,
       D_a_t_a/binary>>};
pack(cli, 16807, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16807:16/little,
       D_a_t_a/binary>>};
pack(srv, 16807, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16807:16/little,
       D_a_t_a/binary>>};
pack(cli, 16808, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16808:16/little,
       D_a_t_a/binary>>};
pack(srv, 16808,
     {#goodvoice{id = V0_id,
                 role_id = {V0_rid, V0_platform, V0_zone_id},
                 name = V0_name, sex = V0_sex, classes = V0_classes,
                 lev = V0_lev, time = V0_time,
                 update_time = V0_update_time, summary = V0_summary,
                 liked = V0_liked, caster_num = V0_caster_num}}) ->
    D_a_t_a = <<V0_id:32/little, V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_name))/binary,
                V0_sex:8/little, V0_classes:8/little, V0_lev:8/little,
                V0_time:16/little, V0_update_time:32/little,
                (protocol:pack(string, V0_summary))/binary,
                V0_liked:32/little, V0_caster_num:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16808:16/little,
       D_a_t_a/binary>>};
pack(cli, 16809, {}) ->
    {ok, <<2:32/little, 16809:16/little>>};
pack(srv, 16809, {V0_status}) ->
    D_a_t_a = <<V0_status:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16809:16/little,
       D_a_t_a/binary>>};
pack(cli, 16810, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16810:16/little,
       D_a_t_a/binary>>};
pack(srv, 16810,
     {V0_result,
      V0_msg,
      V0_rid,
      V0_platform,
      V0_zone_id,
      V0_liked,
      V0_vote_num}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_liked:32/little,
                V0_vote_num:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16810:16/little,
       D_a_t_a/binary>>};
pack(cli, 16811, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16811:16/little,
       D_a_t_a/binary>>};
pack(srv, 16811, {V0_logs}) ->
    D_a_t_a = <<(length(V0_logs)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_type:8/little, V1_val:8/little>>
                                 || {{V1_rid, V1_platform, V1_zone_id},
                                     V1_name,
                                     V1_type,
                                     V1_val}
                                        <- V0_logs]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16811:16/little,
       D_a_t_a/binary>>};
pack(cli, 16812, {}) ->
    {ok, <<2:32/little, 16812:16/little>>};
pack(srv, 16812, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16812:16/little,
       D_a_t_a/binary>>};
pack(cli, 16813, {}) ->
    {ok, <<2:32/little, 16813:16/little>>};
pack(srv, 16813, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little>>
                                 || {V1_rid, V1_platform, V1_zone_id}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16813:16/little,
       D_a_t_a/binary>>};
pack(cli, 16814, {V0_type}) ->
    D_a_t_a = <<V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16814:16/little,
       D_a_t_a/binary>>};
pack(srv, 16814, {V0_type, V0_goodvoice_rank}) ->
    D_a_t_a = <<V0_type:8/little,
                (length(V0_goodvoice_rank)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:8/little, V1_time:16/little,
                                   V1_update_time:32/little,
                                   (protocol:pack(string, V1_summary))/binary,
                                   V1_liked:32/little, V1_caster_num:32/little,
                                   V1_rank:32/little, V1_only_liked:32/little>>
                                 || #goodvoice_rank{id = V1_id,
                                                    role_id =
                                                        {V1_rid,
                                                         V1_platform,
                                                         V1_zone_id},
                                                    name = V1_name,
                                                    sex = V1_sex,
                                                    classes = V1_classes,
                                                    lev = V1_lev,
                                                    time = V1_time,
                                                    update_time =
                                                        V1_update_time,
                                                    summary = V1_summary,
                                                    liked = V1_liked,
                                                    caster_num = V1_caster_num,
                                                    rank = V1_rank,
                                                    only_liked = V1_only_liked}
                                        <- V0_goodvoice_rank]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16814:16/little,
       D_a_t_a/binary>>};
pack(cli, 16815, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16815:16/little,
       D_a_t_a/binary>>};
pack(srv, 16815,
     {V0_result,
      V0_msg,
      V0_id,
      V0_rid,
      V0_platform,
      V0_zone_id,
      V0_update_time,
      V0_voice}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary, V0_id:32/little,
                V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_update_time:32/little,
                (byte_size(V0_voice)):32/little, V0_voice/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16815:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 16800, _B0) ->
    {V1_summary, _B1} = protocol:string(_B0),
    {V1_voice, _B2} = protocol:byte(_B1),
    {V1_time, _B3} = protocol:uint16(_B2),
    {ok, {V1_summary, V1_voice, V1_time}};
unpack(cli, 16800, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_result, V1_msg, V1_id}};
unpack(srv, 16801, _B0) -> {ok, {}};
unpack(cli, 16801, _B0) ->
    {V1_goodvoice_list, _B17} = protocol:array(_B0,
                                               fun (_B1) ->
                                                       {V2_id, _B2} =
                                                           protocol:uint32(_B1),
                                                       {V2_rid, _B3} =
                                                           protocol:uint32(_B2),
                                                       {V2_platform, _B4} =
                                                           protocol:string(_B3),
                                                       {V2_zone_id, _B5} =
                                                           protocol:uint32(_B4),
                                                       {V2_name, _B6} =
                                                           protocol:string(_B5),
                                                       {V2_sex, _B7} =
                                                           protocol:uint8(_B6),
                                                       {V2_classes, _B8} =
                                                           protocol:uint8(_B7),
                                                       {V2_lev, _B9} =
                                                           protocol:uint8(_B8),
                                                       {V2_time, _B10} =
                                                           protocol:uint16(_B9),
                                                       {V2_update_time, _B11} =
                                                           protocol:uint32(_B10),
                                                       {V2_summary, _B12} =
                                                           protocol:string(_B11),
                                                       {V2_liked, _B13} =
                                                           protocol:uint32(_B12),
                                                       {V2_caster_num, _B14} =
                                                           protocol:uint32(_B13),
                                                       {V2_only_liked, _B15} =
                                                           protocol:uint32(_B14),
                                                       {{V2_id,
                                                         V2_rid,
                                                         V2_platform,
                                                         V2_zone_id,
                                                         V2_name,
                                                         V2_sex,
                                                         V2_classes,
                                                         V2_lev,
                                                         V2_time,
                                                         V2_update_time,
                                                         V2_summary,
                                                         V2_liked,
                                                         V2_caster_num,
                                                         V2_only_liked},
                                                        _B15}
                                               end),
    {V1_follow, _B23} = protocol:array(_B17,
                                       fun (_B18) ->
                                               {V2_rid, _B19} =
                                                   protocol:uint32(_B18),
                                               {V2_platform, _B20} =
                                                   protocol:string(_B19),
                                               {V2_zone_id, _B21} =
                                                   protocol:uint32(_B20),
                                               {{V2_rid,
                                                 V2_platform,
                                                 V2_zone_id},
                                                _B21}
                                       end),
    {ok, {V1_goodvoice_list, V1_follow}};
unpack(srv, 16802, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 16802, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {V1_rid, _B4} = protocol:uint32(_B3),
    {V1_platform, _B5} = protocol:string(_B4),
    {V1_zone_id, _B6} = protocol:uint32(_B5),
    {V1_update_time, _B7} = protocol:uint32(_B6),
    {V1_voice, _B8} = protocol:byte(_B7),
    {ok,
     {V1_result,
      V1_msg,
      V1_id,
      V1_rid,
      V1_platform,
      V1_zone_id,
      V1_update_time,
      V1_voice}};
unpack(srv, 16803, _B0) -> {ok, {}};
unpack(cli, 16803, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_time, _B2} = protocol:uint16(_B1),
    {V1_update_time, _B3} = protocol:uint32(_B2),
    {V1_summary, _B4} = protocol:string(_B3),
    {V1_liked, _B5} = protocol:uint32(_B4),
    {V1_caster_num, _B6} = protocol:uint32(_B5),
    {ok,
     {V1_id,
      V1_time,
      V1_update_time,
      V1_summary,
      V1_liked,
      V1_caster_num}};
unpack(srv, 16804, _B0) ->
    {V1_voice, _B1} = protocol:byte(_B0),
    {V1_time, _B2} = protocol:uint16(_B1),
    {ok, {V1_voice, V1_time}};
unpack(cli, 16804, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_result, V1_msg, V1_id}};
unpack(srv, 16805, _B0) ->
    {V1_summary, _B1} = protocol:string(_B0),
    {ok, {V1_summary}};
unpack(cli, 16805, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_result, V1_msg, V1_id}};
unpack(srv, 16806, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_follow, _B4} = protocol:uint8(_B3),
    {ok, {V1_rid, V1_platform, V1_zone_id, V1_follow}};
unpack(cli, 16806, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_rid, _B3} = protocol:uint32(_B2),
    {V1_platform, _B4} = protocol:string(_B3),
    {V1_zone_id, _B5} = protocol:uint32(_B4),
    {V1_follow, _B6} = protocol:uint8(_B5),
    {ok,
     {V1_result,
      V1_msg,
      V1_rid,
      V1_platform,
      V1_zone_id,
      V1_follow}};
unpack(srv, 16807, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 16807, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 16808, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 16808, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_rid, _B2} = protocol:uint32(_B1),
    {V1_platform, _B3} = protocol:string(_B2),
    {V1_zone_id, _B4} = protocol:uint32(_B3),
    {V1_name, _B5} = protocol:string(_B4),
    {V1_sex, _B6} = protocol:uint8(_B5),
    {V1_classes, _B7} = protocol:uint8(_B6),
    {V1_lev, _B8} = protocol:uint8(_B7),
    {V1_time, _B9} = protocol:uint16(_B8),
    {V1_update_time, _B10} = protocol:uint32(_B9),
    {V1_summary, _B11} = protocol:string(_B10),
    {V1_liked, _B12} = protocol:uint32(_B11),
    {V1_caster_num, _B13} = protocol:uint32(_B12),
    {ok,
     {V1_id,
      V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_sex,
      V1_classes,
      V1_lev,
      V1_time,
      V1_update_time,
      V1_summary,
      V1_liked,
      V1_caster_num}};
unpack(srv, 16809, _B0) -> {ok, {}};
unpack(cli, 16809, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {ok, {V1_status}};
unpack(srv, 16810, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 16810, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_rid, _B3} = protocol:uint32(_B2),
    {V1_platform, _B4} = protocol:string(_B3),
    {V1_zone_id, _B5} = protocol:uint32(_B4),
    {V1_liked, _B6} = protocol:uint32(_B5),
    {V1_vote_num, _B7} = protocol:uint8(_B6),
    {ok,
     {V1_result,
      V1_msg,
      V1_rid,
      V1_platform,
      V1_zone_id,
      V1_liked,
      V1_vote_num}};
unpack(srv, 16811, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 16811, _B0) ->
    {V1_logs, _B9} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_rid, _B2} =
                                                protocol:uint32(_B1),
                                            {V2_platform, _B3} =
                                                protocol:string(_B2),
                                            {V2_zone_id, _B4} =
                                                protocol:uint32(_B3),
                                            {V2_name, _B5} =
                                                protocol:string(_B4),
                                            {V2_type, _B6} =
                                                protocol:uint8(_B5),
                                            {V2_val, _B7} = protocol:uint8(_B6),
                                            {{V2_rid,
                                              V2_platform,
                                              V2_zone_id,
                                              V2_name,
                                              V2_type,
                                              V2_val},
                                             _B7}
                                    end),
    {ok, {V1_logs}};
unpack(srv, 16812, _B0) -> {ok, {}};
unpack(cli, 16812, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(srv, 16813, _B0) -> {ok, {}};
unpack(cli, 16813, _B0) ->
    {V1_list, _B6} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_rid, _B2} =
                                                protocol:uint32(_B1),
                                            {V2_platform, _B3} =
                                                protocol:string(_B2),
                                            {V2_zone_id, _B4} =
                                                protocol:uint32(_B3),
                                            {{V2_rid, V2_platform, V2_zone_id},
                                             _B4}
                                    end),
    {ok, {V1_list}};
unpack(srv, 16814, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_type}};
unpack(cli, 16814, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_goodvoice_rank, _B19} = protocol:array(_B1,
                                               fun (_B2) ->
                                                       {V2_id, _B3} =
                                                           protocol:uint32(_B2),
                                                       {V2_rid, _B4} =
                                                           protocol:uint32(_B3),
                                                       {V2_platform, _B5} =
                                                           protocol:string(_B4),
                                                       {V2_zone_id, _B6} =
                                                           protocol:uint32(_B5),
                                                       {V2_name, _B7} =
                                                           protocol:string(_B6),
                                                       {V2_sex, _B8} =
                                                           protocol:uint8(_B7),
                                                       {V2_classes, _B9} =
                                                           protocol:uint8(_B8),
                                                       {V2_lev, _B10} =
                                                           protocol:uint8(_B9),
                                                       {V2_time, _B11} =
                                                           protocol:uint16(_B10),
                                                       {V2_update_time, _B12} =
                                                           protocol:uint32(_B11),
                                                       {V2_summary, _B13} =
                                                           protocol:string(_B12),
                                                       {V2_liked, _B14} =
                                                           protocol:uint32(_B13),
                                                       {V2_caster_num, _B15} =
                                                           protocol:uint32(_B14),
                                                       {V2_rank, _B16} =
                                                           protocol:uint32(_B15),
                                                       {V2_only_liked, _B17} =
                                                           protocol:uint32(_B16),
                                                       {{V2_id,
                                                         V2_rid,
                                                         V2_platform,
                                                         V2_zone_id,
                                                         V2_name,
                                                         V2_sex,
                                                         V2_classes,
                                                         V2_lev,
                                                         V2_time,
                                                         V2_update_time,
                                                         V2_summary,
                                                         V2_liked,
                                                         V2_caster_num,
                                                         V2_rank,
                                                         V2_only_liked},
                                                        _B17}
                                               end),
    {ok, {V1_type, V1_goodvoice_rank}};
unpack(srv, 16815, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 16815, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {V1_rid, _B4} = protocol:uint32(_B3),
    {V1_platform, _B5} = protocol:string(_B4),
    {V1_zone_id, _B6} = protocol:uint32(_B5),
    {V1_update_time, _B7} = protocol:uint32(_B6),
    {V1_voice, _B8} = protocol:byte(_B7),
    {ok,
     {V1_result,
      V1_msg,
      V1_id,
      V1_rid,
      V1_platform,
      V1_zone_id,
      V1_update_time,
      V1_voice}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

