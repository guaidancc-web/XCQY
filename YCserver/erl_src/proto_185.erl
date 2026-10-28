-file("src/proto/proto_185.erl", 1).

-module(proto_185).

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

-file("src/proto/proto_185.erl", 14).

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

-file("src/proto/proto_185.erl", 15).

-file("inc/red_packet.hrl", 1).

-record(red_packet,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         type = 1,
         title = "" :: string(),
         assets_type = 0,
         amount = 0 :: non_neg_integer(),
         remain = 0 :: non_neg_integer(),
         total = 0 :: non_neg_integer(),
         num = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         packs = [],
         log = [] :: list(),
         has_soul = 0}).

-record(red_packet_grab_log,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         time = 0,
         value = 0,
         is_item = 0}).

-file("src/proto/proto_185.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 18500, {}) ->
    {ok, <<2:32/little, 18500:16/little>>};
pack(srv, 18500, {V0_is_over, V0_red_packet_list}) ->
    D_a_t_a = <<V0_is_over:8/little,
                (length(V0_red_packet_list)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:32/little, V1_classes:8/little,
                                   V1_sex:8/little, V1_type:8/little,
                                   (protocol:pack(string, V1_title))/binary,
                                   V1_time:32/little, V1_num:32/little,
                                   (length(V1_log)):16/little,
                                   (list_to_binary([<<V2_grabid:32/little,
                                                      (protocol:pack(string,
                                                                     V2_gplatform))/binary,
                                                      V2_gzone_id:32/little,
                                                      V2_lev:32/little,
                                                      (protocol:pack(string,
                                                                     V2_name))/binary,
                                                      V2_classes:8/little,
                                                      V2_sex:8/little,
                                                      V2_time:32/little,
                                                      V2_value:32/little,
                                                      V2_is_item:8/little>>
                                                    || #red_packet_grab_log{id =
                                                                                {V2_grabid,
                                                                                 V2_gplatform,
                                                                                 V2_gzone_id},
                                                                            lev
                                                                                =
                                                                                V2_lev,
                                                                            name
                                                                                =
                                                                                V2_name,
                                                                            classes
                                                                                =
                                                                                V2_classes,
                                                                            sex
                                                                                =
                                                                                V2_sex,
                                                                            time
                                                                                =
                                                                                V2_time,
                                                                            value
                                                                                =
                                                                                V2_value,
                                                                            is_item
                                                                                =
                                                                                V2_is_item}
                                                           <- V1_log]))/binary>>
                                 || #red_packet{id =
                                                    {V1_rid,
                                                     V1_platform,
                                                     V1_zone_id},
                                                name = V1_name, lev = V1_lev,
                                                classes = V1_classes,
                                                sex = V1_sex, type = V1_type,
                                                title = V1_title,
                                                time = V1_time, num = V1_num,
                                                log = V1_log}
                                        <- V0_red_packet_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18500:16/little,
       D_a_t_a/binary>>};
pack(cli, 18501, {}) ->
    {ok, <<2:32/little, 18501:16/little>>};
pack(srv, 18501,
     {#red_packet{id = {V0_rid, V0_platform, V0_zone_id},
                  name = V0_name, lev = V0_lev, classes = V0_classes,
                  sex = V0_sex, type = V0_type, title = V0_title,
                  time = V0_time}}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_name))/binary,
                V0_lev:32/little, V0_classes:8/little, V0_sex:8/little,
                V0_type:8/little,
                (protocol:pack(string, V0_title))/binary,
                V0_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18501:16/little,
       D_a_t_a/binary>>};
pack(cli, 18502,
     {V0_type, V0_lev, V0_count, V0_title}) ->
    D_a_t_a = <<V0_type:8/little, V0_lev:8/little,
                V0_count:8/little,
                (protocol:pack(string, V0_title))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18502:16/little,
       D_a_t_a/binary>>};
pack(srv, 18502, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18502:16/little,
       D_a_t_a/binary>>};
pack(cli, 18503, {{V0_rid, V0_platform, V0_zone_id}}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18503:16/little,
       D_a_t_a/binary>>};
pack(srv, 18503, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18503:16/little,
       D_a_t_a/binary>>};
pack(cli, 18504, {V0_unit_id}) ->
    D_a_t_a = <<V0_unit_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18504:16/little,
       D_a_t_a/binary>>};
pack(srv, 18504, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18504:16/little,
       D_a_t_a/binary>>};
pack(cli, 18505, {{V0_rid, V0_platform, V0_zone_id}}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18505:16/little,
       D_a_t_a/binary>>};
pack(srv, 18505,
     {#red_packet{id = {V0_rid, V0_platform, V0_zone_id},
                  name = V0_name, lev = V0_lev, classes = V0_classes,
                  sex = V0_sex, type = V0_type, title = V0_title,
                  amount = V0_amount, assets_type = V0_assets_type,
                  remain = V0_remain, total = V0_total, num = V0_num,
                  time = V0_time, log = V0_log}}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_name))/binary,
                V0_lev:32/little, V0_classes:8/little, V0_sex:8/little,
                V0_type:8/little,
                (protocol:pack(string, V0_title))/binary,
                V0_amount:32/little, V0_assets_type:32/little,
                V0_remain:32/little, V0_total:32/little,
                V0_num:32/little, V0_time:32/little,
                (length(V0_log)):16/little,
                (list_to_binary([<<V1_grabid:32/little,
                                   (protocol:pack(string, V1_gplatform))/binary,
                                   V1_gzone_id:32/little, V1_lev:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_classes:8/little, V1_sex:8/little,
                                   V1_time:32/little, V1_value:32/little,
                                   V1_is_item:8/little>>
                                 || #red_packet_grab_log{id =
                                                             {V1_grabid,
                                                              V1_gplatform,
                                                              V1_gzone_id},
                                                         lev = V1_lev,
                                                         name = V1_name,
                                                         classes = V1_classes,
                                                         sex = V1_sex,
                                                         time = V1_time,
                                                         value = V1_value,
                                                         is_item = V1_is_item}
                                        <- V0_log]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18505:16/little,
       D_a_t_a/binary>>};
pack(cli, 18506, {}) ->
    {ok, <<2:32/little, 18506:16/little>>};
pack(srv, 18506,
     {{V0_grabid, V0_gplatform, V0_gzone_id},
      V0_lev,
      V0_name,
      V0_classes,
      V0_sex,
      V0_time,
      V0_value,
      V0_is_item}) ->
    D_a_t_a = <<V0_grabid:32/little,
                (protocol:pack(string, V0_gplatform))/binary,
                V0_gzone_id:32/little, V0_lev:32/little,
                (protocol:pack(string, V0_name))/binary,
                V0_classes:8/little, V0_sex:8/little, V0_time:32/little,
                V0_value:32/little, V0_is_item:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18506:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 18500, _B0) -> {ok, {}};
unpack(cli, 18500, _B0) ->
    {V1_is_over, _B1} = protocol:uint8(_B0),
    {V1_red_packet_list, _B28} = protocol:array(_B1,
                                                fun (_B2) ->
                                                        {V2_rid, _B3} =
                                                            protocol:uint32(_B2),
                                                        {V2_platform, _B4} =
                                                            protocol:string(_B3),
                                                        {V2_zone_id, _B5} =
                                                            protocol:uint32(_B4),
                                                        {V2_name, _B6} =
                                                            protocol:string(_B5),
                                                        {V2_lev, _B7} =
                                                            protocol:uint32(_B6),
                                                        {V2_classes, _B8} =
                                                            protocol:uint8(_B7),
                                                        {V2_sex, _B9} =
                                                            protocol:uint8(_B8),
                                                        {V2_type, _B10} =
                                                            protocol:uint8(_B9),
                                                        {V2_title, _B11} =
                                                            protocol:string(_B10),
                                                        {V2_time, _B12} =
                                                            protocol:uint32(_B11),
                                                        {V2_num, _B13} =
                                                            protocol:uint32(_B12),
                                                        {V2_log, _B26} =
                                                            protocol:array(_B13,
                                                                           fun
                                                                               (_B14) ->
                                                                                   {V3_grabid,
                                                                                    _B15} =
                                                                                       protocol:uint32(_B14),
                                                                                   {V3_gplatform,
                                                                                    _B16} =
                                                                                       protocol:string(_B15),
                                                                                   {V3_gzone_id,
                                                                                    _B17} =
                                                                                       protocol:uint32(_B16),
                                                                                   {V3_lev,
                                                                                    _B18} =
                                                                                       protocol:uint32(_B17),
                                                                                   {V3_name,
                                                                                    _B19} =
                                                                                       protocol:string(_B18),
                                                                                   {V3_classes,
                                                                                    _B20} =
                                                                                       protocol:uint8(_B19),
                                                                                   {V3_sex,
                                                                                    _B21} =
                                                                                       protocol:uint8(_B20),
                                                                                   {V3_time,
                                                                                    _B22} =
                                                                                       protocol:uint32(_B21),
                                                                                   {V3_value,
                                                                                    _B23} =
                                                                                       protocol:uint32(_B22),
                                                                                   {V3_is_item,
                                                                                    _B24} =
                                                                                       protocol:uint8(_B23),
                                                                                   {{V3_grabid,
                                                                                     V3_gplatform,
                                                                                     V3_gzone_id,
                                                                                     V3_lev,
                                                                                     V3_name,
                                                                                     V3_classes,
                                                                                     V3_sex,
                                                                                     V3_time,
                                                                                     V3_value,
                                                                                     V3_is_item},
                                                                                    _B24}
                                                                           end),
                                                        {{V2_rid,
                                                          V2_platform,
                                                          V2_zone_id,
                                                          V2_name,
                                                          V2_lev,
                                                          V2_classes,
                                                          V2_sex,
                                                          V2_type,
                                                          V2_title,
                                                          V2_time,
                                                          V2_num,
                                                          V2_log},
                                                         _B26}
                                                end),
    {ok, {V1_is_over, V1_red_packet_list}};
unpack(srv, 18501, _B0) -> {ok, {}};
unpack(cli, 18501, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_lev, _B5} = protocol:uint32(_B4),
    {V1_classes, _B6} = protocol:uint8(_B5),
    {V1_sex, _B7} = protocol:uint8(_B6),
    {V1_type, _B8} = protocol:uint8(_B7),
    {V1_title, _B9} = protocol:string(_B8),
    {V1_time, _B10} = protocol:uint32(_B9),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_lev,
      V1_classes,
      V1_sex,
      V1_type,
      V1_title,
      V1_time}};
unpack(srv, 18502, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_lev, _B2} = protocol:uint8(_B1),
    {V1_count, _B3} = protocol:uint8(_B2),
    {V1_title, _B4} = protocol:string(_B3),
    {ok, {V1_type, V1_lev, V1_count, V1_title}};
unpack(cli, 18502, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 18503, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 18503, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 18504, _B0) ->
    {V1_unit_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_unit_id}};
unpack(cli, 18504, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 18505, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 18505, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_lev, _B5} = protocol:uint32(_B4),
    {V1_classes, _B6} = protocol:uint8(_B5),
    {V1_sex, _B7} = protocol:uint8(_B6),
    {V1_type, _B8} = protocol:uint8(_B7),
    {V1_title, _B9} = protocol:string(_B8),
    {V1_amount, _B10} = protocol:uint32(_B9),
    {V1_assets_type, _B11} = protocol:uint32(_B10),
    {V1_remain, _B12} = protocol:uint32(_B11),
    {V1_total, _B13} = protocol:uint32(_B12),
    {V1_num, _B14} = protocol:uint32(_B13),
    {V1_time, _B15} = protocol:uint32(_B14),
    {V1_log, _B28} = protocol:array(_B15,
                                    fun (_B16) ->
                                            {V2_grabid, _B17} =
                                                protocol:uint32(_B16),
                                            {V2_gplatform, _B18} =
                                                protocol:string(_B17),
                                            {V2_gzone_id, _B19} =
                                                protocol:uint32(_B18),
                                            {V2_lev, _B20} =
                                                protocol:uint32(_B19),
                                            {V2_name, _B21} =
                                                protocol:string(_B20),
                                            {V2_classes, _B22} =
                                                protocol:uint8(_B21),
                                            {V2_sex, _B23} =
                                                protocol:uint8(_B22),
                                            {V2_time, _B24} =
                                                protocol:uint32(_B23),
                                            {V2_value, _B25} =
                                                protocol:uint32(_B24),
                                            {V2_is_item, _B26} =
                                                protocol:uint8(_B25),
                                            {{V2_grabid,
                                              V2_gplatform,
                                              V2_gzone_id,
                                              V2_lev,
                                              V2_name,
                                              V2_classes,
                                              V2_sex,
                                              V2_time,
                                              V2_value,
                                              V2_is_item},
                                             _B26}
                                    end),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_lev,
      V1_classes,
      V1_sex,
      V1_type,
      V1_title,
      V1_amount,
      V1_assets_type,
      V1_remain,
      V1_total,
      V1_num,
      V1_time,
      V1_log}};
unpack(srv, 18506, _B0) -> {ok, {}};
unpack(cli, 18506, _B0) ->
    {V1_grabid, _B1} = protocol:uint32(_B0),
    {V1_gplatform, _B2} = protocol:string(_B1),
    {V1_gzone_id, _B3} = protocol:uint32(_B2),
    {V1_lev, _B4} = protocol:uint32(_B3),
    {V1_name, _B5} = protocol:string(_B4),
    {V1_classes, _B6} = protocol:uint8(_B5),
    {V1_sex, _B7} = protocol:uint8(_B6),
    {V1_time, _B8} = protocol:uint32(_B7),
    {V1_value, _B9} = protocol:uint32(_B8),
    {V1_is_item, _B10} = protocol:uint8(_B9),
    {ok,
     {V1_grabid,
      V1_gplatform,
      V1_gzone_id,
      V1_lev,
      V1_name,
      V1_classes,
      V1_sex,
      V1_time,
      V1_value,
      V1_is_item}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

