-file("src/proto/proto_203.erl", 1).

-module(proto_203).

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

-file("src/proto/proto_203.erl", 14).

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

-file("src/proto/proto_203.erl", 15).

-file("inc/exquisite_shelf.hrl", 1).

-record(m_exquisite_shelf,
        {ver = 2,
         wave = 0,
         shelf_id = 0,
         shelf_pid,
         pos_wave = 0,
         card_info = [],
         help_times = 0,
         is_get_help = 0}).

-record(exquisite_shelf_util,
        {id = 0,
         cross_type = 0,
         pid = 0,
         battle_id = 0,
         wave_info = [],
         wave = 1,
         lev = 1,
         challenges = [],
         create_time = 0}).

-record(exquisite_shelf_wave_info,
        {wave = 0,
         map_base_id = 0,
         map_id = 0,
         map_pid,
         units = [],
         status = 0}).

-record(exquisite_shelf_card_info,
        {wave = 1,
         shelf_lev = 1,
         type = 2,
         normal_card = [],
         gold_card = []}).

-record(exquisite_shelf_card_item,
        {index = 1,
         item_id = 0,
         num = 0,
         is_get = 0,
         is_notice = 0,
         is_show = 0}).

-record(exquisite_shelf_fast_combat_record,
        {shelf_wave = {0, 0},
         use_time = 0,
         record_id = {0, {0, "", 0}}}).

-file("src/proto/proto_203.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 20300, {}) ->
    {ok, <<2:32/little, 20300:16/little>>};
pack(srv, 20300, {V0_max_wave, V0_flag}) ->
    D_a_t_a = <<V0_max_wave:32/little, V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20300:16/little,
       D_a_t_a/binary>>};
pack(cli, 20301, {V0_wave}) ->
    D_a_t_a = <<V0_wave:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20301:16/little,
       D_a_t_a/binary>>};
pack(srv, 20301, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20301:16/little,
       D_a_t_a/binary>>};
pack(cli, 20302, {}) ->
    {ok, <<2:32/little, 20302:16/little>>};
pack(srv, 20302, {V0_unit_info}) ->
    D_a_t_a = <<(length(V0_unit_info)):16/little,
                (list_to_binary([<<V1_wave:8/little,
                                   V1_base_id:32/little>>
                                 || {V1_wave, V1_base_id}
                                        <- V0_unit_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20302:16/little,
       D_a_t_a/binary>>};
pack(cli, 20303, {}) ->
    {ok, <<2:32/little, 20303:16/little>>};
pack(srv, 20303, {V0_wave, V0_msg}) ->
    D_a_t_a = <<V0_wave:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20303:16/little,
       D_a_t_a/binary>>};
pack(cli, 20304, {V0_is_restart, V0_is_plot}) ->
    D_a_t_a = <<V0_is_restart:8/little,
                V0_is_plot:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20304:16/little,
       D_a_t_a/binary>>};
pack(srv, 20304, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20304:16/little,
       D_a_t_a/binary>>};
pack(cli, 20305, {}) ->
    {ok, <<2:32/little, 20305:16/little>>};
pack(srv, 20305, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20305:16/little,
       D_a_t_a/binary>>};
pack(cli, 20306, {}) ->
    {ok, <<2:32/little, 20306:16/little>>};
pack(srv, 20306,
     {V0_wave, V0_battle_id, V0_base_id, V0_status}) ->
    D_a_t_a = <<V0_wave:8/little, V0_battle_id:32/little,
                V0_base_id:32/little, V0_status:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20306:16/little,
       D_a_t_a/binary>>};
pack(cli, 20307, {}) ->
    {ok, <<2:32/little, 20307:16/little>>};
pack(srv, 20307, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20307:16/little,
       D_a_t_a/binary>>};
pack(cli, 20308, {}) ->
    {ok, <<2:32/little, 20308:16/little>>};
pack(srv, 20308,
     {V0_type,
      V0_wave,
      V0_normal_gain_list,
      V0_gold_gain_list}) ->
    D_a_t_a = <<V0_type:8/little, V0_wave:8/little,
                (length(V0_normal_gain_list)):16/little,
                (list_to_binary([<<V1_index:32/little,
                                   V1_item_id:32/little, V1_num:32/little,
                                   V1_is_get:32/little>>
                                 || #exquisite_shelf_card_item{index = V1_index,
                                                               item_id =
                                                                   V1_item_id,
                                                               num = V1_num,
                                                               is_get =
                                                                   V1_is_get}
                                        <- V0_normal_gain_list]))/binary,
                (length(V0_gold_gain_list)):16/little,
                (list_to_binary([<<V1_index:32/little,
                                   V1_item_id:32/little, V1_num:32/little,
                                   V1_is_get:32/little>>
                                 || #exquisite_shelf_card_item{index = V1_index,
                                                               item_id =
                                                                   V1_item_id,
                                                               num = V1_num,
                                                               is_get =
                                                                   V1_is_get}
                                        <- V0_gold_gain_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20308:16/little,
       D_a_t_a/binary>>};
pack(cli, 20309, {}) ->
    {ok, <<2:32/little, 20309:16/little>>};
pack(srv, 20309, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20309:16/little,
       D_a_t_a/binary>>};
pack(cli, 20310, {V0_order, V0_type}) ->
    D_a_t_a = <<V0_order:8/little, V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20310:16/little,
       D_a_t_a/binary>>};
pack(srv, 20310, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20310:16/little,
       D_a_t_a/binary>>};
pack(cli, 20311, {}) ->
    {ok, <<2:32/little, 20311:16/little>>};
pack(srv, 20311, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20311:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 20300, _B0) -> {ok, {}};
unpack(cli, 20300, _B0) ->
    {V1_max_wave, _B1} = protocol:uint32(_B0),
    {V1_flag, _B2} = protocol:uint8(_B1),
    {ok, {V1_max_wave, V1_flag}};
unpack(srv, 20301, _B0) ->
    {V1_wave, _B1} = protocol:uint8(_B0),
    {ok, {V1_wave}};
unpack(cli, 20301, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 20302, _B0) -> {ok, {}};
unpack(cli, 20302, _B0) ->
    {V1_unit_info, _B5} = protocol:array(_B0,
                                         fun (_B1) ->
                                                 {V2_wave, _B2} =
                                                     protocol:uint8(_B1),
                                                 {V2_base_id, _B3} =
                                                     protocol:uint32(_B2),
                                                 {{V2_wave, V2_base_id}, _B3}
                                         end),
    {ok, {V1_unit_info}};
unpack(srv, 20303, _B0) -> {ok, {}};
unpack(cli, 20303, _B0) ->
    {V1_wave, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_wave, V1_msg}};
unpack(srv, 20304, _B0) ->
    {V1_is_restart, _B1} = protocol:uint8(_B0),
    {V1_is_plot, _B2} = protocol:uint8(_B1),
    {ok, {V1_is_restart, V1_is_plot}};
unpack(cli, 20304, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 20305, _B0) -> {ok, {}};
unpack(cli, 20305, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 20306, _B0) -> {ok, {}};
unpack(cli, 20306, _B0) ->
    {V1_wave, _B1} = protocol:uint8(_B0),
    {V1_battle_id, _B2} = protocol:uint32(_B1),
    {V1_base_id, _B3} = protocol:uint32(_B2),
    {V1_status, _B4} = protocol:uint8(_B3),
    {ok, {V1_wave, V1_battle_id, V1_base_id, V1_status}};
unpack(srv, 20307, _B0) -> {ok, {}};
unpack(cli, 20307, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 20308, _B0) -> {ok, {}};
unpack(cli, 20308, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_wave, _B2} = protocol:uint8(_B1),
    {V1_normal_gain_list, _B9} = protocol:array(_B2,
                                                fun (_B3) ->
                                                        {V2_index, _B4} =
                                                            protocol:uint32(_B3),
                                                        {V2_item_id, _B5} =
                                                            protocol:uint32(_B4),
                                                        {V2_num, _B6} =
                                                            protocol:uint32(_B5),
                                                        {V2_is_get, _B7} =
                                                            protocol:uint32(_B6),
                                                        {{V2_index,
                                                          V2_item_id,
                                                          V2_num,
                                                          V2_is_get},
                                                         _B7}
                                                end),
    {V1_gold_gain_list, _B16} = protocol:array(_B9,
                                               fun (_B10) ->
                                                       {V2_index, _B11} =
                                                           protocol:uint32(_B10),
                                                       {V2_item_id, _B12} =
                                                           protocol:uint32(_B11),
                                                       {V2_num, _B13} =
                                                           protocol:uint32(_B12),
                                                       {V2_is_get, _B14} =
                                                           protocol:uint32(_B13),
                                                       {{V2_index,
                                                         V2_item_id,
                                                         V2_num,
                                                         V2_is_get},
                                                        _B14}
                                               end),
    {ok,
     {V1_type,
      V1_wave,
      V1_normal_gain_list,
      V1_gold_gain_list}};
unpack(srv, 20309, _B0) -> {ok, {}};
unpack(cli, 20309, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 20310, _B0) ->
    {V1_order, _B1} = protocol:uint8(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {ok, {V1_order, V1_type}};
unpack(cli, 20310, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 20311, _B0) -> {ok, {}};
unpack(cli, 20311, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

