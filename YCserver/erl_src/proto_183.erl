-file("src/proto/proto_183.erl", 1).

-module(proto_183).

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

-file("src/proto/proto_183.erl", 14).

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

-file("src/proto/proto_183.erl", 15).

-file("inc/preparation.hrl", 1).

-record(m_preparation,
        {ver = 0,
         pid :: undefined | pid(),
         id = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer()}).

-record(preparation_room,
        {ver = 0,
         id = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         map_id = 0 :: non_neg_integer(),
         map_pid :: undefined | pid(),
         matching = [] :: list(),
         num = 1,
         matched = 0 :: non_neg_integer(),
         match_ref :: undefined | reference(),
         mode = 1,
         is_open = true :: boolean()}).

-record(preparation_team,
        {ids = [] :: list(),
         origin_ids = [] :: list(),
         num = 1 :: non_neg_integer(),
         sum_lev = 0 :: non_neg_integer(),
         max_lev = 0 :: non_neg_integer(),
         min_lev = 0 :: non_neg_integer(),
         tried_match = 0 :: non_neg_integer(),
         room_id = 0 :: non_neg_integer(),
         order = [] :: list(),
         classes = [] :: list()}).

-record(preparation_role,
        {ver = 0,
         id = {0, "", 0},
         name = "",
         pid :: undefined | pid(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         looks = [] :: list(),
         fc = 0 :: non_neg_integer(),
         room_id = 0 :: non_neg_integer(),
         s_ride = 0,
         preparation_pid :: undefined | pid(),
         matched = 0 :: non_neg_integer(),
         formation_id = 1,
         formation_lev = 1,
         team_id = [] :: list(),
         partner = [] :: list(),
         group = 1 :: non_neg_integer()}).

-record(preparation_show_role,
        {id = {0, "", 0},
         name = "",
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         group = 1 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         looks = [] :: list()}).

-file("src/proto/proto_183.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 18300, {}) ->
    {ok, <<2:32/little, 18300:16/little>>};
pack(srv, 18300, {V0_status, V0_id}) ->
    D_a_t_a = <<V0_status:8/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18300:16/little,
       D_a_t_a/binary>>};
pack(cli, 18301, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18301:16/little,
       D_a_t_a/binary>>};
pack(srv, 18301, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18301:16/little,
       D_a_t_a/binary>>};
pack(cli, 18302, {}) ->
    {ok, <<2:32/little, 18302:16/little>>};
pack(srv, 18302, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18302:16/little,
       D_a_t_a/binary>>};
pack(cli, 18303, {}) ->
    {ok, <<2:32/little, 18303:16/little>>};
pack(srv, 18303, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18303:16/little,
       D_a_t_a/binary>>};
pack(cli, 18304, {}) ->
    {ok, <<2:32/little, 18304:16/little>>};
pack(srv, 18304, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18304:16/little,
       D_a_t_a/binary>>};
pack(cli, 18305, {}) ->
    {ok, <<2:32/little, 18305:16/little>>};
pack(srv, 18305,
     {V0_time, V0_id, V0_preparation_show_list}) ->
    D_a_t_a = <<V0_time:8/little, V0_id:32/little,
                (length(V0_preparation_show_list)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:8/little, V1_group:8/little,
                                   V1_lev_break_times:8/little,
                                   (length(V1_looks)):16/little,
                                   (list_to_binary([<<V2_looks_type:32/little,
                                                      V2_looks_mode:32/little,
                                                      V2_looks_val:32/little,
                                                      (protocol:pack(string,
                                                                     V2_looks_str))/binary>>
                                                    || {V2_looks_type,
                                                        V2_looks_mode,
                                                        V2_looks_val,
                                                        V2_looks_str}
                                                           <- V1_looks]))/binary>>
                                 || #preparation_show_role{id =
                                                               {V1_rid,
                                                                V1_platform,
                                                                V1_zone_id},
                                                           name = V1_name,
                                                           sex = V1_sex,
                                                           classes = V1_classes,
                                                           lev = V1_lev,
                                                           group = V1_group,
                                                           lev_break_times =
                                                               V1_lev_break_times,
                                                           looks = V1_looks}
                                        <- V0_preparation_show_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18305:16/little,
       D_a_t_a/binary>>};
pack(cli, 18306, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18306:16/little,
       D_a_t_a/binary>>};
pack(srv, 18306, {V0_status, V0_timeout, V0_id}) ->
    D_a_t_a = <<V0_status:8/little, V0_timeout:32/little,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18306:16/little,
       D_a_t_a/binary>>};
pack(cli, 18307, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18307:16/little,
       D_a_t_a/binary>>};
pack(srv, 18307, {V0_id, V0_count}) ->
    D_a_t_a = <<V0_id:32/little, V0_count:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18307:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 18300, _B0) -> {ok, {}};
unpack(cli, 18300, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_status, V1_id}};
unpack(srv, 18301, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 18301, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 18302, _B0) -> {ok, {}};
unpack(cli, 18302, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 18303, _B0) -> {ok, {}};
unpack(cli, 18303, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 18304, _B0) -> {ok, {}};
unpack(cli, 18304, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 18305, _B0) -> {ok, {}};
unpack(cli, 18305, _B0) ->
    {V1_time, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_preparation_show_list, _B21} = protocol:array(_B2,
                                                      fun (_B3) ->
                                                              {V2_rid, _B4} =
                                                                  protocol:uint32(_B3),
                                                              {V2_platform,
                                                               _B5} =
                                                                  protocol:string(_B4),
                                                              {V2_zone_id,
                                                               _B6} =
                                                                  protocol:uint16(_B5),
                                                              {V2_name, _B7} =
                                                                  protocol:string(_B6),
                                                              {V2_sex, _B8} =
                                                                  protocol:uint8(_B7),
                                                              {V2_classes,
                                                               _B9} =
                                                                  protocol:uint8(_B8),
                                                              {V2_lev, _B10} =
                                                                  protocol:uint8(_B9),
                                                              {V2_group, _B11} =
                                                                  protocol:uint8(_B10),
                                                              {V2_lev_break_times,
                                                               _B12} =
                                                                  protocol:uint8(_B11),
                                                              {V2_looks, _B19} =
                                                                  protocol:array(_B12,
                                                                                 fun
                                                                                     (_B13) ->
                                                                                         {V3_looks_type,
                                                                                          _B14} =
                                                                                             protocol:uint32(_B13),
                                                                                         {V3_looks_mode,
                                                                                          _B15} =
                                                                                             protocol:uint32(_B14),
                                                                                         {V3_looks_val,
                                                                                          _B16} =
                                                                                             protocol:uint32(_B15),
                                                                                         {V3_looks_str,
                                                                                          _B17} =
                                                                                             protocol:string(_B16),
                                                                                         {{V3_looks_type,
                                                                                           V3_looks_mode,
                                                                                           V3_looks_val,
                                                                                           V3_looks_str},
                                                                                          _B17}
                                                                                 end),
                                                              {{V2_rid,
                                                                V2_platform,
                                                                V2_zone_id,
                                                                V2_name,
                                                                V2_sex,
                                                                V2_classes,
                                                                V2_lev,
                                                                V2_group,
                                                                V2_lev_break_times,
                                                                V2_looks},
                                                               _B19}
                                                      end),
    {ok, {V1_time, V1_id, V1_preparation_show_list}};
unpack(srv, 18306, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 18306, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_timeout, _B2} = protocol:uint32(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_status, V1_timeout, V1_id}};
unpack(srv, 18307, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 18307, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_count, _B2} = protocol:uint8(_B1),
    {ok, {V1_id, V1_count}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

