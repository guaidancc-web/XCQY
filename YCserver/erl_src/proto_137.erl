-file("src/proto/proto_137.erl", 1).

-module(proto_137).

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

-file("src/proto/proto_137.erl", 14).

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

-file("src/proto/proto_137.erl", 15).

-file("inc/shipping.hrl", 1).

-record(m_shipping, {ver = 1, total_num = 0}).

-record(shipping,
        {rid = {1, "", 0},
         world_lev = 0,
         role_lev = 0,
         type = 1,
         status = 0,
         reset_time = 0,
         start_time = 0,
         help = 0,
         show_list = [],
         cells = []}).

-record(shipping_cell,
        {ver = 1,
         id = 0,
         type = 1,
         status = 1,
         help_type = 0,
         pack_type = 0,
         normal_rewards = [],
         rewards = [],
         item_base_id = 0,
         need_num = 0,
         help_friends = [],
         help_guild = {"", 0, ""},
         quest_id = 0}).

-record(shipping_cell_data,
        {id = 0,
         classify = 0,
         classes = 0,
         lev = 0,
         item_base_id = 0,
         need_num = 0,
         weight = 0,
         exp = 0,
         ratio = 0,
         quest_id = 0}).

-record(shipping_classify_data,
        {classify = 0,
         min_num = 0,
         max_num = 0,
         is_show = 0,
         weight = 0}).

-record(shipping_cell_quset_data,
        {id = 0,
         classify = 0,
         quest_id = 0,
         item_base_id = 0,
         ratio = 0,
         week_min = 0,
         week_max = 0}).

-record(quest_shipping_data,
        {id = 0,
         type = 0,
         ring = 0,
         max_ring = 0,
         next_id = 0,
         rewards = [],
         leader_exp_mode = 0,
         leader_ratio = 0,
         exp_mode = 0,
         ratio = 0}).

-record(quest_shipping_reward_data,
        {id = 0,
         min = 0,
         max = 0,
         ratio = 0,
         rewards = [],
         need_num = 0,
         exp_mode = 0,
         mate_rewards = [],
         mate_exp_mode = 0}).

-file("src/proto/proto_137.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 13700,
     {V0_role_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_role_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13700:16/little,
       D_a_t_a/binary>>};
pack(srv, 13700, {V0_shipping}) ->
    D_a_t_a = <<(length(V0_shipping)):16/little,
                (list_to_binary([<<V1_role_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   V1_shipping_type:8/little,
                                   V1_shipping_status:8/little,
                                   V1_start_time:32/little,
                                   V1_help_num:8/little,
                                   (length(V1_shipping_cell)):16/little,
                                   (list_to_binary([<<V2_id:32/little,
                                                      V2_type:8/little,
                                                      V2_status:8/little,
                                                      V2_help_type:8/little,
                                                      V2_item_base_id:32/little,
                                                      V2_quest_id:32/little,
                                                      V2_need_num:8/little,
                                                      (length(V2_rewards)):16/little,
                                                      (list_to_binary([<<V3_assets:32/little,
                                                                         V3_val:32/little>>
                                                                       || {V3_assets,
                                                                           V3_val}
                                                                              <- V2_rewards]))/binary>>
                                                    || {V2_id,
                                                        V2_type,
                                                        V2_status,
                                                        V2_help_type,
                                                        V2_item_base_id,
                                                        V2_quest_id,
                                                        V2_need_num,
                                                        V2_rewards}
                                                           <- V1_shipping_cell]))/binary>>
                                 || {V1_role_id,
                                     V1_platform,
                                     V1_zone_id,
                                     V1_shipping_type,
                                     V1_shipping_status,
                                     V1_start_time,
                                     V1_help_num,
                                     V1_shipping_cell}
                                        <- V0_shipping]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13700:16/little,
       D_a_t_a/binary>>};
pack(cli, 13701, {}) ->
    {ok, <<2:32/little, 13701:16/little>>};
pack(srv, 13701, {V0_flag, V0_ids}) ->
    D_a_t_a = <<V0_flag:8/little,
                (length(V0_ids)):16/little,
                (list_to_binary([<<V1_item_base_id:32/little>>
                                 || V1_item_base_id <- V0_ids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13701:16/little,
       D_a_t_a/binary>>};
pack(cli, 13702, {}) ->
    {ok, <<2:32/little, 13702:16/little>>};
pack(srv, 13702, {}) ->
    {ok, <<2:32/little, 13702:16/little>>};
pack(cli, 13703, {V0_cell_id}) ->
    D_a_t_a = <<V0_cell_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13703:16/little,
       D_a_t_a/binary>>};
pack(srv, 13703,
     {#shipping_cell{id = V0_id, status = V0_status,
                     help_type = V0_help_type}}) ->
    D_a_t_a = <<V0_id:32/little, V0_status:8/little,
                V0_help_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13703:16/little,
       D_a_t_a/binary>>};
pack(cli, 13704,
     {V0_tag,
      V0_role_id,
      V0_platform,
      V0_zone_id,
      V0_cell_id}) ->
    D_a_t_a = <<V0_tag:8/little, V0_role_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_cell_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13704:16/little,
       D_a_t_a/binary>>};
pack(srv, 13704,
     {#shipping_cell{id = V0_id, status = V0_status,
                     help_type = V0_help_type}}) ->
    D_a_t_a = <<V0_id:32/little, V0_status:8/little,
                V0_help_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13704:16/little,
       D_a_t_a/binary>>};
pack(cli, 13705, {}) ->
    {ok, <<2:32/little, 13705:16/little>>};
pack(srv, 13705, {V0_op_code}) ->
    D_a_t_a = <<V0_op_code:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13705:16/little,
       D_a_t_a/binary>>};
pack(cli, 13706, {V0_cell_id}) ->
    D_a_t_a = <<V0_cell_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13706:16/little,
       D_a_t_a/binary>>};
pack(srv, 13706, {V0_op_code, V0_cell_id}) ->
    D_a_t_a = <<V0_op_code:8/little, V0_cell_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13706:16/little,
       D_a_t_a/binary>>};
pack(cli, 13707, {V0_ids, V0_cell_id}) ->
    D_a_t_a = <<(length(V0_ids)):16/little,
                (list_to_binary([<<V1_role_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little>>
                                 || {V1_role_id, V1_platform, V1_zone_id}
                                        <- V0_ids]))/binary,
                V0_cell_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13707:16/little,
       D_a_t_a/binary>>};
pack(srv, 13707, {V0_op_code, V0_cell_id}) ->
    D_a_t_a = <<V0_op_code:8/little, V0_cell_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13707:16/little,
       D_a_t_a/binary>>};
pack(cli, 13708, {}) ->
    {ok, <<2:32/little, 13708:16/little>>};
pack(srv, 13708, {}) ->
    {ok, <<2:32/little, 13708:16/little>>};
pack(cli, 13709, {}) ->
    {ok, <<2:32/little, 13709:16/little>>};
pack(srv, 13709, {V0_status, V0_start_time}) ->
    D_a_t_a = <<V0_status:8/little,
                V0_start_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13709:16/little,
       D_a_t_a/binary>>};
pack(cli, 13710,
     {V0_flag,
      V0_role_id,
      V0_platform,
      V0_zone_id,
      V0_cell_id}) ->
    D_a_t_a = <<V0_flag:8/little, V0_role_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_cell_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13710:16/little,
       D_a_t_a/binary>>};
pack(srv, 13710, {V0_op_code, V0_shipping_cell}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (length(V0_shipping_cell)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_type:8/little,
                                   V1_status:8/little, V1_help_type:8/little,
                                   V1_item_base_id:32/little,
                                   V1_quest_id:32/little, V1_need_num:8/little,
                                   (length(V1_rewards)):16/little,
                                   (list_to_binary([<<V2_assets:32/little,
                                                      V2_val:32/little>>
                                                    || {V2_assets, V2_val}
                                                           <- V1_rewards]))/binary>>
                                 || {V1_id,
                                     V1_type,
                                     V1_status,
                                     V1_help_type,
                                     V1_item_base_id,
                                     V1_quest_id,
                                     V1_need_num,
                                     V1_rewards}
                                        <- V0_shipping_cell]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13710:16/little,
       D_a_t_a/binary>>};
pack(cli, 13711, {}) ->
    {ok, <<2:32/little, 13711:16/little>>};
pack(srv, 13711,
     {V0_role_id, V0_platform, V0_zone_id, V0_cell_id}) ->
    D_a_t_a = <<V0_role_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_cell_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13711:16/little,
       D_a_t_a/binary>>};
pack(cli, 13712, {}) ->
    {ok, <<2:32/little, 13712:16/little>>};
pack(srv, 13712, {V0_op_code}) ->
    D_a_t_a = <<V0_op_code:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13712:16/little,
       D_a_t_a/binary>>};
pack(cli, 13713, {}) ->
    {ok, <<2:32/little, 13713:16/little>>};
pack(srv, 13713,
     {V0_op_code,
      V0_type,
      V0_num,
      V0_quest_id,
      V0_ratio,
      V0_item}) ->
    D_a_t_a = <<V0_op_code:8/little, V0_type:32/little,
                V0_num:32/little, V0_quest_id:32/little,
                V0_ratio:32/little, (length(V0_item)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_num:32/little>>
                                 || {V1_id, V1_num} <- V0_item]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13713:16/little,
       D_a_t_a/binary>>};
pack(cli, 13714, {}) ->
    {ok, <<2:32/little, 13714:16/little>>};
pack(srv, 13714, {V0_num, V0_wave}) ->
    D_a_t_a = <<V0_num:32/little, V0_wave:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13714:16/little,
       D_a_t_a/binary>>};
pack(cli, 13715, {V0_cell_id}) ->
    D_a_t_a = <<V0_cell_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13715:16/little,
       D_a_t_a/binary>>};
pack(srv, 13715, {V0_flag}) ->
    D_a_t_a = <<V0_flag:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13715:16/little,
       D_a_t_a/binary>>};
pack(cli, 13716, {V0_battle_id, V0_uid}) ->
    D_a_t_a = <<V0_battle_id:32/little, V0_uid:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13716:16/little,
       D_a_t_a/binary>>};
pack(srv, 13716,
     {V0_battle_id, V0_uid, V0_id, V0_num, V0_list}) ->
    D_a_t_a = <<V0_battle_id:32/little, V0_uid:32/little,
                V0_id:32/little, V0_num:32/little,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_item_id:32/little, V1_bind:32/little,
                                   V1_num:32/little>>
                                 || {V1_id, V1_item_id, V1_bind, V1_num}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13716:16/little,
       D_a_t_a/binary>>};
pack(cli, 13717, {}) ->
    {ok, <<2:32/little, 13717:16/little>>};
pack(srv, 13717, {}) ->
    {ok, <<2:32/little, 13717:16/little>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 13700, _B0) ->
    {V1_role_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_role_id, V1_platform, V1_zone_id}};
unpack(cli, 13700, _B0) ->
    {V1_shipping, _B25} = protocol:array(_B0,
                                         fun (_B1) ->
                                                 {V2_role_id, _B2} =
                                                     protocol:uint32(_B1),
                                                 {V2_platform, _B3} =
                                                     protocol:string(_B2),
                                                 {V2_zone_id, _B4} =
                                                     protocol:uint32(_B3),
                                                 {V2_shipping_type, _B5} =
                                                     protocol:uint8(_B4),
                                                 {V2_shipping_status, _B6} =
                                                     protocol:uint8(_B5),
                                                 {V2_start_time, _B7} =
                                                     protocol:uint32(_B6),
                                                 {V2_help_num, _B8} =
                                                     protocol:uint8(_B7),
                                                 {V2_shipping_cell, _B23} =
                                                     protocol:array(_B8,
                                                                    fun (_B9) ->
                                                                            {V3_id,
                                                                             _B10} =
                                                                                protocol:uint32(_B9),
                                                                            {V3_type,
                                                                             _B11} =
                                                                                protocol:uint8(_B10),
                                                                            {V3_status,
                                                                             _B12} =
                                                                                protocol:uint8(_B11),
                                                                            {V3_help_type,
                                                                             _B13} =
                                                                                protocol:uint8(_B12),
                                                                            {V3_item_base_id,
                                                                             _B14} =
                                                                                protocol:uint32(_B13),
                                                                            {V3_quest_id,
                                                                             _B15} =
                                                                                protocol:uint32(_B14),
                                                                            {V3_need_num,
                                                                             _B16} =
                                                                                protocol:uint8(_B15),
                                                                            {V3_rewards,
                                                                             _B21} =
                                                                                protocol:array(_B16,
                                                                                               fun
                                                                                                   (_B17) ->
                                                                                                       {V4_assets,
                                                                                                        _B18} =
                                                                                                           protocol:uint32(_B17),
                                                                                                       {V4_val,
                                                                                                        _B19} =
                                                                                                           protocol:uint32(_B18),
                                                                                                       {{V4_assets,
                                                                                                         V4_val},
                                                                                                        _B19}
                                                                                               end),
                                                                            {{V3_id,
                                                                              V3_type,
                                                                              V3_status,
                                                                              V3_help_type,
                                                                              V3_item_base_id,
                                                                              V3_quest_id,
                                                                              V3_need_num,
                                                                              V3_rewards},
                                                                             _B21}
                                                                    end),
                                                 {{V2_role_id,
                                                   V2_platform,
                                                   V2_zone_id,
                                                   V2_shipping_type,
                                                   V2_shipping_status,
                                                   V2_start_time,
                                                   V2_help_num,
                                                   V2_shipping_cell},
                                                  _B23}
                                         end),
    {ok, {V1_shipping}};
unpack(srv, 13701, _B0) -> {ok, {}};
unpack(cli, 13701, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_ids, _B5} = protocol:array(_B1,
                                   fun (_B2) ->
                                           {V2_item_base_id, _B3} =
                                               protocol:uint32(_B2),
                                           {{V2_item_base_id}, _B3}
                                   end),
    {ok, {V1_flag, V1_ids}};
unpack(srv, 13702, _B0) -> {ok, {}};
unpack(cli, 13702, _B0) -> {ok, {}};
unpack(srv, 13703, _B0) ->
    {V1_cell_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_cell_id}};
unpack(cli, 13703, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_status, _B2} = protocol:uint8(_B1),
    {V1_help_type, _B3} = protocol:uint8(_B2),
    {ok, {V1_id, V1_status, V1_help_type}};
unpack(srv, 13704, _B0) ->
    {V1_tag, _B1} = protocol:uint8(_B0),
    {V1_role_id, _B2} = protocol:uint32(_B1),
    {V1_platform, _B3} = protocol:string(_B2),
    {V1_zone_id, _B4} = protocol:uint32(_B3),
    {V1_cell_id, _B5} = protocol:uint32(_B4),
    {ok,
     {V1_tag,
      V1_role_id,
      V1_platform,
      V1_zone_id,
      V1_cell_id}};
unpack(cli, 13704, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_status, _B2} = protocol:uint8(_B1),
    {V1_help_type, _B3} = protocol:uint8(_B2),
    {ok, {V1_id, V1_status, V1_help_type}};
unpack(srv, 13705, _B0) -> {ok, {}};
unpack(cli, 13705, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {ok, {V1_op_code}};
unpack(srv, 13706, _B0) ->
    {V1_cell_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_cell_id}};
unpack(cli, 13706, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_cell_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_op_code, V1_cell_id}};
unpack(srv, 13707, _B0) ->
    {V1_ids, _B6} = protocol:array(_B0,
                                   fun (_B1) ->
                                           {V2_role_id, _B2} =
                                               protocol:uint32(_B1),
                                           {V2_platform, _B3} =
                                               protocol:string(_B2),
                                           {V2_zone_id, _B4} =
                                               protocol:uint32(_B3),
                                           {{V2_role_id,
                                             V2_platform,
                                             V2_zone_id},
                                            _B4}
                                   end),
    {V1_cell_id, _B7} = protocol:uint8(_B6),
    {ok, {V1_ids, V1_cell_id}};
unpack(cli, 13707, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_cell_id, _B2} = protocol:uint8(_B1),
    {ok, {V1_op_code, V1_cell_id}};
unpack(srv, 13708, _B0) -> {ok, {}};
unpack(cli, 13708, _B0) -> {ok, {}};
unpack(srv, 13709, _B0) -> {ok, {}};
unpack(cli, 13709, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_start_time, _B2} = protocol:uint32(_B1),
    {ok, {V1_status, V1_start_time}};
unpack(srv, 13710, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_role_id, _B2} = protocol:uint32(_B1),
    {V1_platform, _B3} = protocol:string(_B2),
    {V1_zone_id, _B4} = protocol:uint32(_B3),
    {V1_cell_id, _B5} = protocol:uint32(_B4),
    {ok,
     {V1_flag,
      V1_role_id,
      V1_platform,
      V1_zone_id,
      V1_cell_id}};
unpack(cli, 13710, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_shipping_cell, _B16} = protocol:array(_B1,
                                              fun (_B2) ->
                                                      {V2_id, _B3} =
                                                          protocol:uint32(_B2),
                                                      {V2_type, _B4} =
                                                          protocol:uint8(_B3),
                                                      {V2_status, _B5} =
                                                          protocol:uint8(_B4),
                                                      {V2_help_type, _B6} =
                                                          protocol:uint8(_B5),
                                                      {V2_item_base_id, _B7} =
                                                          protocol:uint32(_B6),
                                                      {V2_quest_id, _B8} =
                                                          protocol:uint32(_B7),
                                                      {V2_need_num, _B9} =
                                                          protocol:uint8(_B8),
                                                      {V2_rewards, _B14} =
                                                          protocol:array(_B9,
                                                                         fun
                                                                             (_B10) ->
                                                                                 {V3_assets,
                                                                                  _B11} =
                                                                                     protocol:uint32(_B10),
                                                                                 {V3_val,
                                                                                  _B12} =
                                                                                     protocol:uint32(_B11),
                                                                                 {{V3_assets,
                                                                                   V3_val},
                                                                                  _B12}
                                                                         end),
                                                      {{V2_id,
                                                        V2_type,
                                                        V2_status,
                                                        V2_help_type,
                                                        V2_item_base_id,
                                                        V2_quest_id,
                                                        V2_need_num,
                                                        V2_rewards},
                                                       _B14}
                                              end),
    {ok, {V1_op_code, V1_shipping_cell}};
unpack(srv, 13711, _B0) -> {ok, {}};
unpack(cli, 13711, _B0) ->
    {V1_role_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_cell_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_role_id, V1_platform, V1_zone_id, V1_cell_id}};
unpack(srv, 13712, _B0) -> {ok, {}};
unpack(cli, 13712, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {ok, {V1_op_code}};
unpack(srv, 13713, _B0) -> {ok, {}};
unpack(cli, 13713, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_type, _B2} = protocol:uint32(_B1),
    {V1_num, _B3} = protocol:uint32(_B2),
    {V1_quest_id, _B4} = protocol:uint32(_B3),
    {V1_ratio, _B5} = protocol:uint32(_B4),
    {V1_item, _B10} = protocol:array(_B5,
                                     fun (_B6) ->
                                             {V2_id, _B7} =
                                                 protocol:uint32(_B6),
                                             {V2_num, _B8} =
                                                 protocol:uint32(_B7),
                                             {{V2_id, V2_num}, _B8}
                                     end),
    {ok,
     {V1_op_code,
      V1_type,
      V1_num,
      V1_quest_id,
      V1_ratio,
      V1_item}};
unpack(srv, 13714, _B0) -> {ok, {}};
unpack(cli, 13714, _B0) ->
    {V1_num, _B1} = protocol:uint32(_B0),
    {V1_wave, _B2} = protocol:uint32(_B1),
    {ok, {V1_num, V1_wave}};
unpack(srv, 13715, _B0) ->
    {V1_cell_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_cell_id}};
unpack(cli, 13715, _B0) ->
    {V1_flag, _B1} = protocol:uint32(_B0),
    {ok, {V1_flag}};
unpack(srv, 13716, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_uid, _B2} = protocol:uint32(_B1),
    {ok, {V1_battle_id, V1_uid}};
unpack(cli, 13716, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_uid, _B2} = protocol:uint32(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {V1_num, _B4} = protocol:uint32(_B3),
    {V1_list, _B11} = protocol:array(_B4,
                                     fun (_B5) ->
                                             {V2_id, _B6} =
                                                 protocol:uint32(_B5),
                                             {V2_item_id, _B7} =
                                                 protocol:uint32(_B6),
                                             {V2_bind, _B8} =
                                                 protocol:uint32(_B7),
                                             {V2_num, _B9} =
                                                 protocol:uint32(_B8),
                                             {{V2_id,
                                               V2_item_id,
                                               V2_bind,
                                               V2_num},
                                              _B9}
                                     end),
    {ok, {V1_battle_id, V1_uid, V1_id, V1_num, V1_list}};
unpack(srv, 13717, _B0) -> {ok, {}};
unpack(cli, 13717, _B0) -> {ok, {}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

