-file("src/proto/proto_131.erl", 1).

-module(proto_131).

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

-file("src/proto/proto_131.erl", 14).

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

-file("src/proto/proto_131.erl", 15).

-file("inc/trial.hrl", 1).

-record(trial_unit,
        {battle_id = 0,
         unit_id = 0,
         unit_baseid = 0,
         unit_name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         dir = 0,
         looks = [],
         map_id = 0,
         x = 0,
         y = 0}).

-record(m_trial,
        {ver = 3,
         mode = 0,
         order = 0,
         fighter,
         unit = #trial_unit{},
         direct_order = 0,
         clear_normal = 0,
         round = 0,
         times = 2,
         coin = 0,
         reset = 2,
         max_order_easy = 0,
         max_order_hard = 0,
         has_match = [],
         is_helped = "",
         gain_items = []}).

-record(trial_help,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         type = 1,
         unit_id = 0,
         battle_id = 0,
         unit_name = "",
         time = 0}).

-file("src/proto/proto_131.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 13100, {}) ->
    {ok, <<2:32/little, 13100:16/little>>};
pack(srv, 13100,
     {V0_mode,
      V0_order,
      V0_direct_order,
      V0_reset,
      V0_round,
      V0_coin,
      V0_times,
      V0_max_times,
      V0_clear_normal,
      V0_max_order_easy,
      V0_max_order_hard,
      #trial_unit{battle_id = V0_battle_id,
                  unit_id = V0_unit_id, unit_baseid = V0_unit_baseid,
                  unit_name = V0_unit_name, classes = V0_classes,
                  sex = V0_sex, dir = V0_dir, map_id = V0_map_id,
                  x = V0_x, y = V0_y, lev = V0_lev, looks = V0_looks},
      V0_can_ask}) ->
    D_a_t_a = <<V0_mode:8/little, V0_order:8/little,
                V0_direct_order:8/little, V0_reset:8/little,
                V0_round:16/little, V0_coin:32/little,
                V0_times:8/little, V0_max_times:8/little,
                V0_clear_normal:8/little, V0_max_order_easy:8/little,
                V0_max_order_hard:8/little, V0_battle_id:32/little,
                V0_unit_id:32/little, V0_unit_baseid:32/little,
                (protocol:pack(string, V0_unit_name))/binary,
                V0_classes:8/little, V0_sex:8/little, V0_dir:8/little,
                V0_map_id:32/little, V0_x:32/little, V0_y:32/little,
                V0_lev:8/little, (length(V0_looks)):16/little,
                (list_to_binary([<<V1_looks_type:32/little,
                                   V1_looks_mode:32/little,
                                   V1_looks_val:32/little,
                                   (protocol:pack(string,
                                                  V1_looks_str))/binary>>
                                 || {V1_looks_type,
                                     V1_looks_mode,
                                     V1_looks_val,
                                     V1_looks_str}
                                        <- V0_looks]))/binary,
                V0_can_ask:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13100:16/little,
       D_a_t_a/binary>>};
pack(cli, 13101, {V0_mode}) ->
    D_a_t_a = <<V0_mode:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13101:16/little,
       D_a_t_a/binary>>};
pack(srv, 13101, {V0_flag, V0_msg, V0_reset}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_reset:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13101:16/little,
       D_a_t_a/binary>>};
pack(cli, 13102, {}) ->
    {ok, <<2:32/little, 13102:16/little>>};
pack(srv, 13102,
     {V0_mode,
      V0_order,
      V0_direct_order,
      V0_round,
      V0_coin,
      V0_times,
      V0_max_times,
      V0_clear_normal,
      V0_max_order_easy,
      V0_max_order_hard,
      #trial_unit{battle_id = V0_battle_id,
                  unit_id = V0_unit_id, unit_baseid = V0_unit_baseid,
                  unit_name = V0_unit_name, classes = V0_classes,
                  sex = V0_sex, dir = V0_dir, map_id = V0_map_id,
                  x = V0_x, y = V0_y, lev = V0_lev, looks = V0_looks},
      V0_can_ask}) ->
    D_a_t_a = <<V0_mode:8/little, V0_order:8/little,
                V0_direct_order:8/little, V0_round:16/little,
                V0_coin:32/little, V0_times:8/little,
                V0_max_times:8/little, V0_clear_normal:8/little,
                V0_max_order_easy:8/little, V0_max_order_hard:8/little,
                V0_battle_id:32/little, V0_unit_id:32/little,
                V0_unit_baseid:32/little,
                (protocol:pack(string, V0_unit_name))/binary,
                V0_classes:8/little, V0_sex:8/little, V0_dir:8/little,
                V0_map_id:32/little, V0_x:32/little, V0_y:32/little,
                V0_lev:8/little, (length(V0_looks)):16/little,
                (list_to_binary([<<V1_looks_type:32/little,
                                   V1_looks_mode:32/little,
                                   V1_looks_val:32/little,
                                   (protocol:pack(string,
                                                  V1_looks_str))/binary>>
                                 || {V1_looks_type,
                                     V1_looks_mode,
                                     V1_looks_val,
                                     V1_looks_str}
                                        <- V0_looks]))/binary,
                V0_can_ask:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13102:16/little,
       D_a_t_a/binary>>};
pack(cli, 13103, {}) ->
    {ok, <<2:32/little, 13103:16/little>>};
pack(srv, 13103, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13103:16/little,
       D_a_t_a/binary>>};
pack(cli, 13104, {}) ->
    {ok, <<2:32/little, 13104:16/little>>};
pack(srv, 13104, {V0_flag, V0_gain_items}) ->
    D_a_t_a = <<V0_flag:8/little,
                (length(V0_gain_items)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_num:32/little>>
                                 || {V1_base_id, V1_num}
                                        <- V0_gain_items]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13104:16/little,
       D_a_t_a/binary>>};
pack(cli, 13105, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13105:16/little,
       D_a_t_a/binary>>};
pack(srv, 13105, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13105:16/little,
       D_a_t_a/binary>>};
pack(cli, 13106, {}) ->
    {ok, <<2:32/little, 13106:16/little>>};
pack(srv, 13106, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13106:16/little,
       D_a_t_a/binary>>};
pack(cli, 13107,
     {V0_rid, V0_platform, V0_zone_id, V0_type}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13107:16/little,
       D_a_t_a/binary>>};
pack(srv, 13107, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13107:16/little,
       D_a_t_a/binary>>};
pack(cli, 13108, {}) ->
    {ok, <<2:32/little, 13108:16/little>>};
pack(srv, 13108,
     {#trial_help{id = {V0_rid, V0_platform, V0_zone_id},
                  name = V0_name, lev = V0_lev, sex = V0_sex,
                  classes = V0_classes, type = V0_type,
                  unit_name = V0_unit_name, time = V0_time}}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_lev:8/little, V0_sex:8/little, V0_classes:8/little,
                V0_type:8/little,
                (protocol:pack(string, V0_unit_name))/binary,
                V0_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13108:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 13100, _B0) -> {ok, {}};
unpack(cli, 13100, _B0) ->
    {V1_mode, _B1} = protocol:uint8(_B0),
    {V1_order, _B2} = protocol:uint8(_B1),
    {V1_direct_order, _B3} = protocol:uint8(_B2),
    {V1_reset, _B4} = protocol:uint8(_B3),
    {V1_round, _B5} = protocol:uint16(_B4),
    {V1_coin, _B6} = protocol:uint32(_B5),
    {V1_times, _B7} = protocol:uint8(_B6),
    {V1_max_times, _B8} = protocol:uint8(_B7),
    {V1_clear_normal, _B9} = protocol:uint8(_B8),
    {V1_max_order_easy, _B10} = protocol:uint8(_B9),
    {V1_max_order_hard, _B11} = protocol:uint8(_B10),
    {V1_battle_id, _B12} = protocol:uint32(_B11),
    {V1_unit_id, _B13} = protocol:uint32(_B12),
    {V1_unit_baseid, _B14} = protocol:uint32(_B13),
    {V1_unit_name, _B15} = protocol:string(_B14),
    {V1_classes, _B16} = protocol:uint8(_B15),
    {V1_sex, _B17} = protocol:uint8(_B16),
    {V1_dir, _B18} = protocol:uint8(_B17),
    {V1_map_id, _B19} = protocol:uint32(_B18),
    {V1_x, _B20} = protocol:uint32(_B19),
    {V1_y, _B21} = protocol:uint32(_B20),
    {V1_lev, _B22} = protocol:uint8(_B21),
    {V1_looks, _B29} = protocol:array(_B22,
                                      fun (_B23) ->
                                              {V2_looks_type, _B24} =
                                                  protocol:uint32(_B23),
                                              {V2_looks_mode, _B25} =
                                                  protocol:uint32(_B24),
                                              {V2_looks_val, _B26} =
                                                  protocol:uint32(_B25),
                                              {V2_looks_str, _B27} =
                                                  protocol:string(_B26),
                                              {{V2_looks_type,
                                                V2_looks_mode,
                                                V2_looks_val,
                                                V2_looks_str},
                                               _B27}
                                      end),
    {V1_can_ask, _B30} = protocol:uint8(_B29),
    {ok,
     {V1_mode,
      V1_order,
      V1_direct_order,
      V1_reset,
      V1_round,
      V1_coin,
      V1_times,
      V1_max_times,
      V1_clear_normal,
      V1_max_order_easy,
      V1_max_order_hard,
      V1_battle_id,
      V1_unit_id,
      V1_unit_baseid,
      V1_unit_name,
      V1_classes,
      V1_sex,
      V1_dir,
      V1_map_id,
      V1_x,
      V1_y,
      V1_lev,
      V1_looks,
      V1_can_ask}};
unpack(srv, 13101, _B0) ->
    {V1_mode, _B1} = protocol:uint8(_B0),
    {ok, {V1_mode}};
unpack(cli, 13101, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_reset, _B3} = protocol:uint8(_B2),
    {ok, {V1_flag, V1_msg, V1_reset}};
unpack(srv, 13102, _B0) -> {ok, {}};
unpack(cli, 13102, _B0) ->
    {V1_mode, _B1} = protocol:uint8(_B0),
    {V1_order, _B2} = protocol:uint8(_B1),
    {V1_direct_order, _B3} = protocol:uint8(_B2),
    {V1_round, _B4} = protocol:uint16(_B3),
    {V1_coin, _B5} = protocol:uint32(_B4),
    {V1_times, _B6} = protocol:uint8(_B5),
    {V1_max_times, _B7} = protocol:uint8(_B6),
    {V1_clear_normal, _B8} = protocol:uint8(_B7),
    {V1_max_order_easy, _B9} = protocol:uint8(_B8),
    {V1_max_order_hard, _B10} = protocol:uint8(_B9),
    {V1_battle_id, _B11} = protocol:uint32(_B10),
    {V1_unit_id, _B12} = protocol:uint32(_B11),
    {V1_unit_baseid, _B13} = protocol:uint32(_B12),
    {V1_unit_name, _B14} = protocol:string(_B13),
    {V1_classes, _B15} = protocol:uint8(_B14),
    {V1_sex, _B16} = protocol:uint8(_B15),
    {V1_dir, _B17} = protocol:uint8(_B16),
    {V1_map_id, _B18} = protocol:uint32(_B17),
    {V1_x, _B19} = protocol:uint32(_B18),
    {V1_y, _B20} = protocol:uint32(_B19),
    {V1_lev, _B21} = protocol:uint8(_B20),
    {V1_looks, _B28} = protocol:array(_B21,
                                      fun (_B22) ->
                                              {V2_looks_type, _B23} =
                                                  protocol:uint32(_B22),
                                              {V2_looks_mode, _B24} =
                                                  protocol:uint32(_B23),
                                              {V2_looks_val, _B25} =
                                                  protocol:uint32(_B24),
                                              {V2_looks_str, _B26} =
                                                  protocol:string(_B25),
                                              {{V2_looks_type,
                                                V2_looks_mode,
                                                V2_looks_val,
                                                V2_looks_str},
                                               _B26}
                                      end),
    {V1_can_ask, _B29} = protocol:uint8(_B28),
    {ok,
     {V1_mode,
      V1_order,
      V1_direct_order,
      V1_round,
      V1_coin,
      V1_times,
      V1_max_times,
      V1_clear_normal,
      V1_max_order_easy,
      V1_max_order_hard,
      V1_battle_id,
      V1_unit_id,
      V1_unit_baseid,
      V1_unit_name,
      V1_classes,
      V1_sex,
      V1_dir,
      V1_map_id,
      V1_x,
      V1_y,
      V1_lev,
      V1_looks,
      V1_can_ask}};
unpack(srv, 13103, _B0) -> {ok, {}};
unpack(cli, 13103, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 13104, _B0) -> {ok, {}};
unpack(cli, 13104, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_gain_items, _B6} = protocol:array(_B1,
                                          fun (_B2) ->
                                                  {V2_base_id, _B3} =
                                                      protocol:uint32(_B2),
                                                  {V2_num, _B4} =
                                                      protocol:uint32(_B3),
                                                  {{V2_base_id, V2_num}, _B4}
                                          end),
    {ok, {V1_flag, V1_gain_items}};
unpack(srv, 13105, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 13105, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 13106, _B0) -> {ok, {}};
unpack(cli, 13106, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 13107, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_type, _B4} = protocol:uint8(_B3),
    {ok, {V1_rid, V1_platform, V1_zone_id, V1_type}};
unpack(cli, 13107, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 13108, _B0) -> {ok, {}};
unpack(cli, 13108, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_lev, _B5} = protocol:uint8(_B4),
    {V1_sex, _B6} = protocol:uint8(_B5),
    {V1_classes, _B7} = protocol:uint8(_B6),
    {V1_type, _B8} = protocol:uint8(_B7),
    {V1_unit_name, _B9} = protocol:string(_B8),
    {V1_time, _B10} = protocol:uint32(_B9),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_lev,
      V1_sex,
      V1_classes,
      V1_type,
      V1_unit_name,
      V1_time}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

