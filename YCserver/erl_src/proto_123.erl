-file("src/proto/proto_123.erl", 1).

-module(proto_123).

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

-file("src/proto/proto_123.erl", 14).

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

-file("src/proto/proto_123.erl", 15).

-file("inc/roll.hrl", 1).

-record(roll,
        {id = 0,
         mode = 0,
         key = 0,
         end_tick = 0,
         timeout = 0,
         items = [],
         has_reward = 0,
         channel}).

-record(roll_item,
        {id = 1,
         has_reward = 0,
         base_id = 0,
         origin_base_id = 0,
         num = 1,
         choices = [1],
         roles = [],
         is_cast = 0,
         crystal = 0}).

-record(roll_role,
        {role_id,
         name = "",
         pid,
         sex = 0,
         classes = 0,
         choice = 0,
         rand_num = 0,
         time = 0,
         reward = 0,
         team_status = 0}).

-file("src/proto/proto_123.erl", 16).

-file("inc/card.hrl", 1).

-record(card_data,
        {id = 0,
         name = "",
         from_name = "",
         list = [],
         show_list = [],
         cast_msg = "",
         channel,
         title = "",
         content = "",
         limit_mode = 0,
         limit_num = 0,
         card_num = 0,
         timeout = 0}).

-record(card,
        {id = 0,
         name = "",
         base_id = 0,
         mode = 0,
         dungeon_id = 0,
         floor = 0,
         list = [],
         limit_mode = 0,
         limit_num = 0,
         ref,
         roles = [],
         end_time = 0,
         from_name = ""}).

-record(card_info,
        {pos = 0,
         role_id = {0, "", 0},
         name = "",
         item_id = 0,
         bind = 0,
         num = 0,
         is_cast = 0}).

-record(card_role,
        {role_id = {0, "", 0}, name = "", pid = 0, flag = 0}).

-file("src/proto/proto_123.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 12300, {}) ->
    {ok, <<2:32/little, 12300:16/little>>};
pack(srv, 12300,
     {V0_roll_id,
      V0_mode,
      V0_key,
      V0_end_tick,
      V0_roll_item}) ->
    D_a_t_a = <<V0_roll_id:16/little, V0_mode:8/little,
                V0_key:32/little, V0_end_tick:32/little,
                (length(V0_roll_item)):16/little,
                (list_to_binary([<<V1_id:8/little, V1_base_id:32/little,
                                   V1_num:32/little, V1_has_reward:8/little,
                                   (length(V1_roles)):16/little,
                                   (list_to_binary([<<V2_r_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_r_platform))/binary,
                                                      V2_r_zone:16/little,
                                                      (protocol:pack(string,
                                                                     V2_name))/binary,
                                                      V2_sex:8/little,
                                                      V2_classes:8/little,
                                                      V2_rand_num:8/little,
                                                      V2_choice:8/little,
                                                      V2_reward:8/little>>
                                                    || #roll_role{role_id =
                                                                      {V2_r_id,
                                                                       V2_r_platform,
                                                                       V2_r_zone},
                                                                  name =
                                                                      V2_name,
                                                                  sex = V2_sex,
                                                                  classes =
                                                                      V2_classes,
                                                                  rand_num =
                                                                      V2_rand_num,
                                                                  choice =
                                                                      V2_choice,
                                                                  reward =
                                                                      V2_reward}
                                                           <- V1_roles]))/binary>>
                                 || #roll_item{id = V1_id, base_id = V1_base_id,
                                               num = V1_num,
                                               has_reward = V1_has_reward,
                                               roles = V1_roles}
                                        <- V0_roll_item]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12300:16/little,
       D_a_t_a/binary>>};
pack(cli, 12301, {}) ->
    {ok, <<2:32/little, 12301:16/little>>};
pack(srv, 12301,
     {V0_roll_id, V0_end_tick, V0_id, V0_roles}) ->
    D_a_t_a = <<V0_roll_id:16/little, V0_end_tick:32/little,
                V0_id:8/little, (length(V0_roles)):16/little,
                (list_to_binary([<<V1_r_id:32/little,
                                   (protocol:pack(string,
                                                  V1_r_platform))/binary,
                                   V1_r_zone:16/little, V1_rand_num:8/little,
                                   V1_choice:8/little, V1_reward:8/little>>
                                 || #roll_role{role_id =
                                                   {V1_r_id,
                                                    V1_r_platform,
                                                    V1_r_zone},
                                               rand_num = V1_rand_num,
                                               choice = V1_choice,
                                               reward = V1_reward}
                                        <- V0_roles]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12301:16/little,
       D_a_t_a/binary>>};
pack(cli, 12302, {V0_roll_id, V0_item_id}) ->
    D_a_t_a = <<V0_roll_id:16/little,
                V0_item_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12302:16/little,
       D_a_t_a/binary>>};
pack(srv, 12302, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12302:16/little,
       D_a_t_a/binary>>};
pack(cli, 12320, {}) ->
    {ok, <<2:32/little, 12320:16/little>>};
pack(srv, 12320,
     {V0_id,
      V0_base_id,
      V0_name,
      V0_from_name,
      V0_mode,
      V0_dungeon_id,
      V0_floor,
      V0_end_time,
      V0_list,
      V0_roles}) ->
    D_a_t_a = <<V0_id:32/little, V0_base_id:32/little,
                (protocol:pack(string, V0_name))/binary,
                (protocol:pack(string, V0_from_name))/binary,
                V0_mode:8/little, V0_dungeon_id:32/little,
                V0_floor:32/little, V0_end_time:32/little,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_pos:32/little, V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_item_id:32/little, V1_bind:32/little,
                                   V1_num:32/little>>
                                 || #card_info{pos = V1_pos,
                                               role_id =
                                                   {V1_rid,
                                                    V1_platform,
                                                    V1_zone_id},
                                               name = V1_name,
                                               item_id = V1_item_id,
                                               bind = V1_bind, num = V1_num}
                                        <- V0_list]))/binary,
                (length(V0_roles)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_flag:8/little>>
                                 || #card_role{role_id =
                                                   {V1_rid,
                                                    V1_platform,
                                                    V1_zone_id},
                                               name = V1_name, flag = V1_flag}
                                        <- V0_roles]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12320:16/little,
       D_a_t_a/binary>>};
pack(cli, 12321, {V0_card_id, V0_pos}) ->
    D_a_t_a = <<V0_card_id:32/little, V0_pos:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12321:16/little,
       D_a_t_a/binary>>};
pack(srv, 12321,
     {V0_card_id,
      V0_base_id,
      V0_pos,
      V0_item_id,
      V0_bind,
      V0_num,
      {V0_rid, V0_platform, V0_zone_id},
      V0_name}) ->
    D_a_t_a = <<V0_card_id:32/little, V0_base_id:32/little,
                V0_pos:32/little, V0_item_id:32/little,
                V0_bind:32/little, V0_num:32/little, V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12321:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 12300, _B0) -> {ok, {}};
unpack(cli, 12300, _B0) ->
    {V1_roll_id, _B1} = protocol:uint16(_B0),
    {V1_mode, _B2} = protocol:uint8(_B1),
    {V1_key, _B3} = protocol:uint32(_B2),
    {V1_end_tick, _B4} = protocol:uint32(_B3),
    {V1_roll_item, _B23} = protocol:array(_B4,
                                          fun (_B5) ->
                                                  {V2_id, _B6} =
                                                      protocol:uint8(_B5),
                                                  {V2_base_id, _B7} =
                                                      protocol:uint32(_B6),
                                                  {V2_num, _B8} =
                                                      protocol:uint32(_B7),
                                                  {V2_has_reward, _B9} =
                                                      protocol:uint8(_B8),
                                                  {V2_roles, _B21} =
                                                      protocol:array(_B9,
                                                                     fun
                                                                         (_B10) ->
                                                                             {V3_r_id,
                                                                              _B11} =
                                                                                 protocol:uint32(_B10),
                                                                             {V3_r_platform,
                                                                              _B12} =
                                                                                 protocol:string(_B11),
                                                                             {V3_r_zone,
                                                                              _B13} =
                                                                                 protocol:uint16(_B12),
                                                                             {V3_name,
                                                                              _B14} =
                                                                                 protocol:string(_B13),
                                                                             {V3_sex,
                                                                              _B15} =
                                                                                 protocol:uint8(_B14),
                                                                             {V3_classes,
                                                                              _B16} =
                                                                                 protocol:uint8(_B15),
                                                                             {V3_rand_num,
                                                                              _B17} =
                                                                                 protocol:uint8(_B16),
                                                                             {V3_choice,
                                                                              _B18} =
                                                                                 protocol:uint8(_B17),
                                                                             {V3_reward,
                                                                              _B19} =
                                                                                 protocol:uint8(_B18),
                                                                             {{V3_r_id,
                                                                               V3_r_platform,
                                                                               V3_r_zone,
                                                                               V3_name,
                                                                               V3_sex,
                                                                               V3_classes,
                                                                               V3_rand_num,
                                                                               V3_choice,
                                                                               V3_reward},
                                                                              _B19}
                                                                     end),
                                                  {{V2_id,
                                                    V2_base_id,
                                                    V2_num,
                                                    V2_has_reward,
                                                    V2_roles},
                                                   _B21}
                                          end),
    {ok,
     {V1_roll_id,
      V1_mode,
      V1_key,
      V1_end_tick,
      V1_roll_item}};
unpack(srv, 12301, _B0) -> {ok, {}};
unpack(cli, 12301, _B0) ->
    {V1_roll_id, _B1} = protocol:uint16(_B0),
    {V1_end_tick, _B2} = protocol:uint32(_B1),
    {V1_id, _B3} = protocol:uint8(_B2),
    {V1_roles, _B12} = protocol:array(_B3,
                                      fun (_B4) ->
                                              {V2_r_id, _B5} =
                                                  protocol:uint32(_B4),
                                              {V2_r_platform, _B6} =
                                                  protocol:string(_B5),
                                              {V2_r_zone, _B7} =
                                                  protocol:uint16(_B6),
                                              {V2_rand_num, _B8} =
                                                  protocol:uint8(_B7),
                                              {V2_choice, _B9} =
                                                  protocol:uint8(_B8),
                                              {V2_reward, _B10} =
                                                  protocol:uint8(_B9),
                                              {{V2_r_id,
                                                V2_r_platform,
                                                V2_r_zone,
                                                V2_rand_num,
                                                V2_choice,
                                                V2_reward},
                                               _B10}
                                      end),
    {ok, {V1_roll_id, V1_end_tick, V1_id, V1_roles}};
unpack(srv, 12302, _B0) ->
    {V1_roll_id, _B1} = protocol:uint16(_B0),
    {V1_item_id, _B2} = protocol:uint16(_B1),
    {ok, {V1_roll_id, V1_item_id}};
unpack(cli, 12302, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 12320, _B0) -> {ok, {}};
unpack(cli, 12320, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_base_id, _B2} = protocol:uint32(_B1),
    {V1_name, _B3} = protocol:string(_B2),
    {V1_from_name, _B4} = protocol:string(_B3),
    {V1_mode, _B5} = protocol:uint8(_B4),
    {V1_dungeon_id, _B6} = protocol:uint32(_B5),
    {V1_floor, _B7} = protocol:uint32(_B6),
    {V1_end_time, _B8} = protocol:uint32(_B7),
    {V1_list, _B19} = protocol:array(_B8,
                                     fun (_B9) ->
                                             {V2_pos, _B10} =
                                                 protocol:uint32(_B9),
                                             {V2_rid, _B11} =
                                                 protocol:uint32(_B10),
                                             {V2_platform, _B12} =
                                                 protocol:string(_B11),
                                             {V2_zone_id, _B13} =
                                                 protocol:uint32(_B12),
                                             {V2_name, _B14} =
                                                 protocol:string(_B13),
                                             {V2_item_id, _B15} =
                                                 protocol:uint32(_B14),
                                             {V2_bind, _B16} =
                                                 protocol:uint32(_B15),
                                             {V2_num, _B17} =
                                                 protocol:uint32(_B16),
                                             {{V2_pos,
                                               V2_rid,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_name,
                                               V2_item_id,
                                               V2_bind,
                                               V2_num},
                                              _B17}
                                     end),
    {V1_roles, _B27} = protocol:array(_B19,
                                      fun (_B20) ->
                                              {V2_rid, _B21} =
                                                  protocol:uint32(_B20),
                                              {V2_platform, _B22} =
                                                  protocol:string(_B21),
                                              {V2_zone_id, _B23} =
                                                  protocol:uint32(_B22),
                                              {V2_name, _B24} =
                                                  protocol:string(_B23),
                                              {V2_flag, _B25} =
                                                  protocol:uint8(_B24),
                                              {{V2_rid,
                                                V2_platform,
                                                V2_zone_id,
                                                V2_name,
                                                V2_flag},
                                               _B25}
                                      end),
    {ok,
     {V1_id,
      V1_base_id,
      V1_name,
      V1_from_name,
      V1_mode,
      V1_dungeon_id,
      V1_floor,
      V1_end_time,
      V1_list,
      V1_roles}};
unpack(srv, 12321, _B0) ->
    {V1_card_id, _B1} = protocol:uint32(_B0),
    {V1_pos, _B2} = protocol:uint32(_B1),
    {ok, {V1_card_id, V1_pos}};
unpack(cli, 12321, _B0) ->
    {V1_card_id, _B1} = protocol:uint32(_B0),
    {V1_base_id, _B2} = protocol:uint32(_B1),
    {V1_pos, _B3} = protocol:uint32(_B2),
    {V1_item_id, _B4} = protocol:uint32(_B3),
    {V1_bind, _B5} = protocol:uint32(_B4),
    {V1_num, _B6} = protocol:uint32(_B5),
    {V1_rid, _B7} = protocol:uint32(_B6),
    {V1_platform, _B8} = protocol:string(_B7),
    {V1_zone_id, _B9} = protocol:uint32(_B8),
    {V1_name, _B10} = protocol:string(_B9),
    {ok,
     {V1_card_id,
      V1_base_id,
      V1_pos,
      V1_item_id,
      V1_bind,
      V1_num,
      V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

