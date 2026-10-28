-file("src/proto/proto_152.erl", 1).

-module(proto_152).

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

-file("src/proto/proto_152.erl", 14).

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

-file("src/proto/proto_152.erl", 15).

-file("inc/constellation.hrl", 1).

-record(m_constellation,
        {ver = 2,
         lev = 0 :: non_neg_integer(),
         finished = [],
         summoned = []}).

-record(constellation_first,
        {key = {0, 0},
         ver = 0,
         lev = 0 :: non_neg_integer(),
         winner = [],
         mtime = 0,
         base_id = 0}).

-record(constellation_unit,
        {id = {0, 0},
         lev = 0,
         base_id = 0,
         map_id = 0,
         x = 0,
         y = 0,
         fail = 0,
         guards = []}).

-record(constellation_winner,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         classes = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         looks = [],
         finished = 0 :: non_neg_integer(),
         round = 0 :: non_neg_integer(),
         is_leader = 0 :: non_neg_integer()}).

-record(constellation_summoned,
        {ver = 2,
         lev = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         map = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer()}).

-record(constellation_role,
        {id = {0, "", 0},
         name = "" :: string(),
         classes = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         id_now = 0 :: non_neg_integer(),
         title_lev = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         max_kill = 0 :: non_neg_integer()}).

-record(constellation_first_data,
        {min = 0, max = 0, rate = 0, attr = []}).

-record(constellation_guard,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         sex = 0,
         classes = 0,
         looks = [],
         base_id = 0}).

-file("src/proto/proto_152.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 15200, {}) ->
    {ok, <<2:32/little, 15200:16/little>>};
pack(srv, 15200, {V0_status, V0_timeout}) ->
    D_a_t_a = <<V0_status:8/little, V0_timeout:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15200:16/little,
       D_a_t_a/binary>>};
pack(cli, 15201, {}) ->
    {ok, <<2:32/little, 15201:16/little>>};
pack(srv, 15201,
     {#m_constellation{lev = V0_lev, summoned = V0_summoned},
      V0_today_summoned}) ->
    D_a_t_a = <<V0_lev:8/little,
                (length(V0_summoned)):16/little,
                (list_to_binary([<<V1_map:32/little, V1_x:32/little,
                                   V1_y:32/little, V1_base_id:32/little,
                                   V1_lev:8/little, V1_time:32/little>>
                                 || #constellation_summoned{map = V1_map,
                                                            x = V1_x, y = V1_y,
                                                            base_id =
                                                                V1_base_id,
                                                            lev = V1_lev,
                                                            time = V1_time}
                                        <- V0_summoned]))/binary,
                V0_today_summoned:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15201:16/little,
       D_a_t_a/binary>>};
pack(cli, 15202, {}) ->
    {ok, <<2:32/little, 15202:16/little>>};
pack(srv, 15202, {V0_constellation_unit}) ->
    D_a_t_a = <<(length(V0_constellation_unit)):16/little,
                (list_to_binary([<<V1_map_id:32/little,
                                   V1_base_id:32/little, V1_lev:8/little>>
                                 || #constellation_unit{map_id = V1_map_id,
                                                        base_id = V1_base_id,
                                                        lev = V1_lev}
                                        <- V0_constellation_unit]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15202:16/little,
       D_a_t_a/binary>>};
pack(cli, 15203, {}) ->
    {ok, <<2:32/little, 15203:16/little>>};
pack(srv, 15203, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15203:16/little,
       D_a_t_a/binary>>};
pack(cli, 15204, {}) ->
    {ok, <<2:32/little, 15204:16/little>>};
pack(srv, 15204, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15204:16/little,
       D_a_t_a/binary>>};
pack(cli, 15205, {}) ->
    {ok, <<2:32/little, 15205:16/little>>};
pack(srv, 15205, {V0_map_num, V0_constellation_unit}) ->
    D_a_t_a = <<(length(V0_map_num)):16/little,
                (list_to_binary([<<V1_map_id:32/little,
                                   V1_num:32/little>>
                                 || {V1_map_id, V1_num} <- V0_map_num]))/binary,
                (length(V0_constellation_unit)):16/little,
                (list_to_binary([<<V1_map_id:32/little,
                                   V1_base_id:32/little, V1_lev:8/little>>
                                 || #constellation_unit{map_id = V1_map_id,
                                                        base_id = V1_base_id,
                                                        lev = V1_lev}
                                        <- V0_constellation_unit]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15205:16/little,
       D_a_t_a/binary>>};
pack(cli, 15206, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15206:16/little,
       D_a_t_a/binary>>};
pack(srv, 15206,
     {#constellation_role{id =
                              {V0_id, V0_platform, V0_zone_id},
                          name = V0_name, lev = V0_lev,
                          title_lev = V0_title_lev, classes = V0_classes,
                          sex = V0_sex, max_kill = V0_max_kill,
                          id_now = V0_id_now},
      V0_flag,
      V0_msg}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_name))/binary,
                V0_lev:8/little, V0_title_lev:8/little,
                V0_classes:8/little, V0_sex:8/little,
                V0_max_kill:8/little, V0_id_now:32/little,
                V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15206:16/little,
       D_a_t_a/binary>>};
pack(cli, 15207, {V0_battle_id, V0_id}) ->
    D_a_t_a = <<V0_battle_id:32/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15207:16/little,
       D_a_t_a/binary>>};
pack(srv, 15207,
     {V0_lev,
      V0_base_id,
      V0_status,
      V0_mtime,
      V0_rate,
      V0_list}) ->
    D_a_t_a = <<V0_lev:32/little, V0_base_id:32/little,
                V0_status:32/little, V0_mtime:32/little,
                V0_rate:32/little, (length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_classes:32/little, V1_sex:32/little,
                                   V1_is_leader:32/little>>
                                 || #constellation_winner{id =
                                                              {V1_id,
                                                               V1_platform,
                                                               V1_zone_id},
                                                          name = V1_name,
                                                          classes = V1_classes,
                                                          sex = V1_sex,
                                                          is_leader =
                                                              V1_is_leader}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15207:16/little,
       D_a_t_a/binary>>};
pack(cli, 15208, {V0_battle_id, V0_id}) ->
    D_a_t_a = <<V0_battle_id:32/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15208:16/little,
       D_a_t_a/binary>>};
pack(srv, 15208, {V0_lev, V0_base_id, V0_list}) ->
    D_a_t_a = <<V0_lev:32/little, V0_base_id:32/little,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_classes:32/little, V1_sex:32/little>>
                                 || #constellation_guard{id =
                                                             {V1_id,
                                                              V1_platform,
                                                              V1_zone_id},
                                                         name = V1_name,
                                                         classes = V1_classes,
                                                         sex = V1_sex}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15208:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 15200, _B0) -> {ok, {}};
unpack(cli, 15200, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_timeout, _B2} = protocol:uint32(_B1),
    {ok, {V1_status, V1_timeout}};
unpack(srv, 15201, _B0) -> {ok, {}};
unpack(cli, 15201, _B0) ->
    {V1_lev, _B1} = protocol:uint8(_B0),
    {V1_summoned, _B10} = protocol:array(_B1,
                                         fun (_B2) ->
                                                 {V2_map, _B3} =
                                                     protocol:uint32(_B2),
                                                 {V2_x, _B4} =
                                                     protocol:uint32(_B3),
                                                 {V2_y, _B5} =
                                                     protocol:uint32(_B4),
                                                 {V2_base_id, _B6} =
                                                     protocol:uint32(_B5),
                                                 {V2_lev, _B7} =
                                                     protocol:uint8(_B6),
                                                 {V2_time, _B8} =
                                                     protocol:uint32(_B7),
                                                 {{V2_map,
                                                   V2_x,
                                                   V2_y,
                                                   V2_base_id,
                                                   V2_lev,
                                                   V2_time},
                                                  _B8}
                                         end),
    {V1_today_summoned, _B11} = protocol:uint32(_B10),
    {ok, {V1_lev, V1_summoned, V1_today_summoned}};
unpack(srv, 15202, _B0) -> {ok, {}};
unpack(cli, 15202, _B0) ->
    {V1_constellation_unit, _B6} = protocol:array(_B0,
                                                  fun (_B1) ->
                                                          {V2_map_id, _B2} =
                                                              protocol:uint32(_B1),
                                                          {V2_base_id, _B3} =
                                                              protocol:uint32(_B2),
                                                          {V2_lev, _B4} =
                                                              protocol:uint8(_B3),
                                                          {{V2_map_id,
                                                            V2_base_id,
                                                            V2_lev},
                                                           _B4}
                                                  end),
    {ok, {V1_constellation_unit}};
unpack(srv, 15203, _B0) -> {ok, {}};
unpack(cli, 15203, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 15204, _B0) -> {ok, {}};
unpack(cli, 15204, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 15205, _B0) -> {ok, {}};
unpack(cli, 15205, _B0) ->
    {V1_map_num, _B5} = protocol:array(_B0,
                                       fun (_B1) ->
                                               {V2_map_id, _B2} =
                                                   protocol:uint32(_B1),
                                               {V2_num, _B3} =
                                                   protocol:uint32(_B2),
                                               {{V2_map_id, V2_num}, _B3}
                                       end),
    {V1_constellation_unit, _B11} = protocol:array(_B5,
                                                   fun (_B6) ->
                                                           {V2_map_id, _B7} =
                                                               protocol:uint32(_B6),
                                                           {V2_base_id, _B8} =
                                                               protocol:uint32(_B7),
                                                           {V2_lev, _B9} =
                                                               protocol:uint8(_B8),
                                                           {{V2_map_id,
                                                             V2_base_id,
                                                             V2_lev},
                                                            _B9}
                                                   end),
    {ok, {V1_map_num, V1_constellation_unit}};
unpack(srv, 15206, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 15206, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_lev, _B5} = protocol:uint8(_B4),
    {V1_title_lev, _B6} = protocol:uint8(_B5),
    {V1_classes, _B7} = protocol:uint8(_B6),
    {V1_sex, _B8} = protocol:uint8(_B7),
    {V1_max_kill, _B9} = protocol:uint8(_B8),
    {V1_id_now, _B10} = protocol:uint32(_B9),
    {V1_flag, _B11} = protocol:uint8(_B10),
    {V1_msg, _B12} = protocol:string(_B11),
    {ok,
     {V1_id,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_lev,
      V1_title_lev,
      V1_classes,
      V1_sex,
      V1_max_kill,
      V1_id_now,
      V1_flag,
      V1_msg}};
unpack(srv, 15207, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_battle_id, V1_id}};
unpack(cli, 15207, _B0) ->
    {V1_lev, _B1} = protocol:uint32(_B0),
    {V1_base_id, _B2} = protocol:uint32(_B1),
    {V1_status, _B3} = protocol:uint32(_B2),
    {V1_mtime, _B4} = protocol:uint32(_B3),
    {V1_rate, _B5} = protocol:uint32(_B4),
    {V1_list, _B15} = protocol:array(_B5,
                                     fun (_B6) ->
                                             {V2_id, _B7} =
                                                 protocol:uint32(_B6),
                                             {V2_platform, _B8} =
                                                 protocol:string(_B7),
                                             {V2_zone_id, _B9} =
                                                 protocol:uint32(_B8),
                                             {V2_name, _B10} =
                                                 protocol:string(_B9),
                                             {V2_classes, _B11} =
                                                 protocol:uint32(_B10),
                                             {V2_sex, _B12} =
                                                 protocol:uint32(_B11),
                                             {V2_is_leader, _B13} =
                                                 protocol:uint32(_B12),
                                             {{V2_id,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_name,
                                               V2_classes,
                                               V2_sex,
                                               V2_is_leader},
                                              _B13}
                                     end),
    {ok,
     {V1_lev,
      V1_base_id,
      V1_status,
      V1_mtime,
      V1_rate,
      V1_list}};
unpack(srv, 15208, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_battle_id, V1_id}};
unpack(cli, 15208, _B0) ->
    {V1_lev, _B1} = protocol:uint32(_B0),
    {V1_base_id, _B2} = protocol:uint32(_B1),
    {V1_list, _B11} = protocol:array(_B2,
                                     fun (_B3) ->
                                             {V2_id, _B4} =
                                                 protocol:uint32(_B3),
                                             {V2_platform, _B5} =
                                                 protocol:string(_B4),
                                             {V2_zone_id, _B6} =
                                                 protocol:uint32(_B5),
                                             {V2_name, _B7} =
                                                 protocol:string(_B6),
                                             {V2_classes, _B8} =
                                                 protocol:uint32(_B7),
                                             {V2_sex, _B9} =
                                                 protocol:uint32(_B8),
                                             {{V2_id,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_name,
                                               V2_classes,
                                               V2_sex},
                                              _B9}
                                     end),
    {ok, {V1_lev, V1_base_id, V1_list}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

