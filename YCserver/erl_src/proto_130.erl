-file("src/proto/proto_130.erl", 1).

-module(proto_130).

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

-file("src/proto/proto_130.erl", 14).

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

-file("src/proto/proto_130.erl", 15).

-file("inc/world_boss.hrl", 1).

-record(world_boss,
        {ver = 1 :: non_neg_integer(),
         id = 0 :: non_neg_integer(),
         first_killer = [],
         round_first = [],
         round_killer = [],
         killer_rank = [],
         last_killed = 0 :: non_neg_integer(),
         last_respawn = 0 :: non_neg_integer(),
         total_killed = 0 :: non_neg_integer(),
         is_rewarded = false :: true | false,
         is_rewarded_first = false :: true | false,
         map_id = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         recent_killer = []}).

-record(world_boss_killer,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         classes = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         looks = [],
         finished = 0 :: non_neg_integer(),
         round = 0 :: non_neg_integer(),
         is_leader = 0 :: non_neg_integer()}).

-record(world_boss_winner,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         rewarded = 0 :: non_neg_integer(),
         last_rewarded = 0 :: non_neg_integer()}).

-file("src/proto/proto_130.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 13000, {}) ->
    {ok, <<2:32/little, 13000:16/little>>};
pack(srv, 13000, {V0_boss_list, V0_rewardable}) ->
    D_a_t_a = <<(length(V0_boss_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_last_killed:32/signed-little,
                                   (length(V1_first_killer)):16/little,
                                   (list_to_binary([<<V2_rid:32/little,
                                                      (protocol:pack(string,
                                                                     V2_platform))/binary,
                                                      V2_zone_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_name))/binary,
                                                      V2_classes:8/little,
                                                      V2_sex:8/little,
                                                      V2_round:16/little,
                                                      V2_is_leader:8/little>>
                                                    || #world_boss_killer{id =
                                                                              {V2_rid,
                                                                               V2_platform,
                                                                               V2_zone_id},
                                                                          name =
                                                                              V2_name,
                                                                          classes
                                                                              =
                                                                              V2_classes,
                                                                          sex =
                                                                              V2_sex,
                                                                          round
                                                                              =
                                                                              V2_round,
                                                                          is_leader
                                                                              =
                                                                              V2_is_leader}
                                                           <- V1_first_killer]))/binary,
                                   (length(V1_round_first)):16/little,
                                   (list_to_binary([<<V2_rid:32/little,
                                                      (protocol:pack(string,
                                                                     V2_platform))/binary,
                                                      V2_zone_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_name))/binary,
                                                      V2_is_leader:8/little>>
                                                    || #world_boss_killer{id =
                                                                              {V2_rid,
                                                                               V2_platform,
                                                                               V2_zone_id},
                                                                          name =
                                                                              V2_name,
                                                                          is_leader
                                                                              =
                                                                              V2_is_leader}
                                                           <- V1_round_first]))/binary,
                                   V1_map_id:32/little, V1_x:32/little,
                                   V1_y:32/little>>
                                 || #world_boss{id = V1_id,
                                                last_killed = V1_last_killed,
                                                first_killer = V1_first_killer,
                                                round_first = V1_round_first,
                                                map_id = V1_map_id, x = V1_x,
                                                y = V1_y}
                                        <- V0_boss_list]))/binary,
                V0_rewardable:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13000:16/little,
       D_a_t_a/binary>>};
pack(cli, 13001, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13001:16/little,
       D_a_t_a/binary>>};
pack(srv, 13001, {V0_kill_rank}) ->
    D_a_t_a = <<(length(V0_kill_rank)):16/little,
                (list_to_binary([<<V1_rank_round:16/little,
                                   V1_finished:32/little,
                                   (length(V1_team)):16/little,
                                   (list_to_binary([<<V2_rid:32/little,
                                                      (protocol:pack(string,
                                                                     V2_platform))/binary,
                                                      V2_zone_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_name))/binary,
                                                      V2_is_leader:8/little,
                                                      V2_classes:8/little,
                                                      V2_sex:8/little,
                                                      V2_round:16/little>>
                                                    || #world_boss_killer{id =
                                                                              {V2_rid,
                                                                               V2_platform,
                                                                               V2_zone_id},
                                                                          name =
                                                                              V2_name,
                                                                          is_leader
                                                                              =
                                                                              V2_is_leader,
                                                                          classes
                                                                              =
                                                                              V2_classes,
                                                                          sex =
                                                                              V2_sex,
                                                                          round
                                                                              =
                                                                              V2_round}
                                                           <- V1_team]))/binary>>
                                 || {V1_rank_round, V1_finished, V1_team}
                                        <- V0_kill_rank]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13001:16/little,
       D_a_t_a/binary>>};
pack(cli, 13002, {}) ->
    {ok, <<2:32/little, 13002:16/little>>};
pack(srv, 13002, {V0_base_id, V0_id, V0_killer}) ->
    D_a_t_a = <<V0_base_id:32/little, V0_id:32/little,
                (length(V0_killer)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_classes:8/little, V1_sex:8/little,
                                   V1_is_leader:8/little,
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
                                 || #world_boss_killer{id =
                                                           {V1_rid,
                                                            V1_platform,
                                                            V1_zone_id},
                                                       name = V1_name,
                                                       classes = V1_classes,
                                                       sex = V1_sex,
                                                       is_leader = V1_is_leader,
                                                       looks = V1_looks}
                                        <- V0_killer]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13002:16/little,
       D_a_t_a/binary>>};
pack(cli, 13003, {V0_base_id, V0_finished}) ->
    D_a_t_a = <<V0_base_id:32/little,
                V0_finished:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13003:16/little,
       D_a_t_a/binary>>};
pack(srv, 13003, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13003:16/little,
       D_a_t_a/binary>>};
pack(cli, 13004, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13004:16/little,
       D_a_t_a/binary>>};
pack(srv, 13004, {V0_world_boss_killer}) ->
    D_a_t_a = <<(length(V0_world_boss_killer)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_is_leader:8/little, V1_classes:8/little,
                                   V1_sex:8/little, V1_round:16/little>>
                                 || #world_boss_killer{id =
                                                           {V1_rid,
                                                            V1_platform,
                                                            V1_zone_id},
                                                       name = V1_name,
                                                       is_leader = V1_is_leader,
                                                       classes = V1_classes,
                                                       sex = V1_sex,
                                                       round = V1_round}
                                        <- V0_world_boss_killer]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13004:16/little,
       D_a_t_a/binary>>};
pack(cli, 13005,
     {V0_rid, V0_r_platform, V0_r_zone_id, V0_base_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_r_platform))/binary,
                V0_r_zone_id:16/little, V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13005:16/little,
       D_a_t_a/binary>>};
pack(srv, 13005, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13005:16/little,
       D_a_t_a/binary>>};
pack(cli, 13006, {V0_base_id}) ->
    D_a_t_a = <<V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13006:16/little,
       D_a_t_a/binary>>};
pack(srv, 13006, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13006:16/little,
       D_a_t_a/binary>>};
pack(cli, 13007, {}) ->
    {ok, <<2:32/little, 13007:16/little>>};
pack(srv, 13007, {V0_id, V0_is_kill, V0_is_live}) ->
    D_a_t_a = <<V0_id:32/little, V0_is_kill:8/little,
                V0_is_live:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13007:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 13000, _B0) -> {ok, {}};
unpack(cli, 13000, _B0) ->
    {V1_boss_list, _B27} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_id, _B2} =
                                                      protocol:uint32(_B1),
                                                  {V2_last_killed, _B3} =
                                                      protocol:int32(_B2),
                                                  {V2_first_killer, _B14} =
                                                      protocol:array(_B3,
                                                                     fun
                                                                         (_B4) ->
                                                                             {V3_rid,
                                                                              _B5} =
                                                                                 protocol:uint32(_B4),
                                                                             {V3_platform,
                                                                              _B6} =
                                                                                 protocol:string(_B5),
                                                                             {V3_zone_id,
                                                                              _B7} =
                                                                                 protocol:uint32(_B6),
                                                                             {V3_name,
                                                                              _B8} =
                                                                                 protocol:string(_B7),
                                                                             {V3_classes,
                                                                              _B9} =
                                                                                 protocol:uint8(_B8),
                                                                             {V3_sex,
                                                                              _B10} =
                                                                                 protocol:uint8(_B9),
                                                                             {V3_round,
                                                                              _B11} =
                                                                                 protocol:uint16(_B10),
                                                                             {V3_is_leader,
                                                                              _B12} =
                                                                                 protocol:uint8(_B11),
                                                                             {{V3_rid,
                                                                               V3_platform,
                                                                               V3_zone_id,
                                                                               V3_name,
                                                                               V3_classes,
                                                                               V3_sex,
                                                                               V3_round,
                                                                               V3_is_leader},
                                                                              _B12}
                                                                     end),
                                                  {V2_round_first, _B22} =
                                                      protocol:array(_B14,
                                                                     fun
                                                                         (_B15) ->
                                                                             {V3_rid,
                                                                              _B16} =
                                                                                 protocol:uint32(_B15),
                                                                             {V3_platform,
                                                                              _B17} =
                                                                                 protocol:string(_B16),
                                                                             {V3_zone_id,
                                                                              _B18} =
                                                                                 protocol:uint32(_B17),
                                                                             {V3_name,
                                                                              _B19} =
                                                                                 protocol:string(_B18),
                                                                             {V3_is_leader,
                                                                              _B20} =
                                                                                 protocol:uint8(_B19),
                                                                             {{V3_rid,
                                                                               V3_platform,
                                                                               V3_zone_id,
                                                                               V3_name,
                                                                               V3_is_leader},
                                                                              _B20}
                                                                     end),
                                                  {V2_map_id, _B23} =
                                                      protocol:uint32(_B22),
                                                  {V2_x, _B24} =
                                                      protocol:uint32(_B23),
                                                  {V2_y, _B25} =
                                                      protocol:uint32(_B24),
                                                  {{V2_id,
                                                    V2_last_killed,
                                                    V2_first_killer,
                                                    V2_round_first,
                                                    V2_map_id,
                                                    V2_x,
                                                    V2_y},
                                                   _B25}
                                          end),
    {V1_rewardable, _B28} = protocol:uint32(_B27),
    {ok, {V1_boss_list, V1_rewardable}};
unpack(srv, 13001, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 13001, _B0) ->
    {V1_kill_rank, _B16} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_rank_round, _B2} =
                                                      protocol:uint16(_B1),
                                                  {V2_finished, _B3} =
                                                      protocol:uint32(_B2),
                                                  {V2_team, _B14} =
                                                      protocol:array(_B3,
                                                                     fun
                                                                         (_B4) ->
                                                                             {V3_rid,
                                                                              _B5} =
                                                                                 protocol:uint32(_B4),
                                                                             {V3_platform,
                                                                              _B6} =
                                                                                 protocol:string(_B5),
                                                                             {V3_zone_id,
                                                                              _B7} =
                                                                                 protocol:uint32(_B6),
                                                                             {V3_name,
                                                                              _B8} =
                                                                                 protocol:string(_B7),
                                                                             {V3_is_leader,
                                                                              _B9} =
                                                                                 protocol:uint8(_B8),
                                                                             {V3_classes,
                                                                              _B10} =
                                                                                 protocol:uint8(_B9),
                                                                             {V3_sex,
                                                                              _B11} =
                                                                                 protocol:uint8(_B10),
                                                                             {V3_round,
                                                                              _B12} =
                                                                                 protocol:uint16(_B11),
                                                                             {{V3_rid,
                                                                               V3_platform,
                                                                               V3_zone_id,
                                                                               V3_name,
                                                                               V3_is_leader,
                                                                               V3_classes,
                                                                               V3_sex,
                                                                               V3_round},
                                                                              _B12}
                                                                     end),
                                                  {{V2_rank_round,
                                                    V2_finished,
                                                    V2_team},
                                                   _B14}
                                          end),
    {ok, {V1_kill_rank}};
unpack(srv, 13002, _B0) -> {ok, {}};
unpack(cli, 13002, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_killer, _B19} = protocol:array(_B2,
                                       fun (_B3) ->
                                               {V2_rid, _B4} =
                                                   protocol:uint32(_B3),
                                               {V2_platform, _B5} =
                                                   protocol:string(_B4),
                                               {V2_zone_id, _B6} =
                                                   protocol:uint32(_B5),
                                               {V2_name, _B7} =
                                                   protocol:string(_B6),
                                               {V2_classes, _B8} =
                                                   protocol:uint8(_B7),
                                               {V2_sex, _B9} =
                                                   protocol:uint8(_B8),
                                               {V2_is_leader, _B10} =
                                                   protocol:uint8(_B9),
                                               {V2_looks, _B17} =
                                                   protocol:array(_B10,
                                                                  fun (_B11) ->
                                                                          {V3_looks_type,
                                                                           _B12} =
                                                                              protocol:uint32(_B11),
                                                                          {V3_looks_mode,
                                                                           _B13} =
                                                                              protocol:uint32(_B12),
                                                                          {V3_looks_val,
                                                                           _B14} =
                                                                              protocol:uint32(_B13),
                                                                          {V3_looks_str,
                                                                           _B15} =
                                                                              protocol:string(_B14),
                                                                          {{V3_looks_type,
                                                                            V3_looks_mode,
                                                                            V3_looks_val,
                                                                            V3_looks_str},
                                                                           _B15}
                                                                  end),
                                               {{V2_rid,
                                                 V2_platform,
                                                 V2_zone_id,
                                                 V2_name,
                                                 V2_classes,
                                                 V2_sex,
                                                 V2_is_leader,
                                                 V2_looks},
                                                _B17}
                                       end),
    {ok, {V1_base_id, V1_id, V1_killer}};
unpack(srv, 13003, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {V1_finished, _B2} = protocol:uint32(_B1),
    {ok, {V1_base_id, V1_finished}};
unpack(cli, 13003, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 13004, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 13004, _B0) ->
    {V1_world_boss_killer, _B11} = protocol:array(_B0,
                                                  fun (_B1) ->
                                                          {V2_rid, _B2} =
                                                              protocol:uint32(_B1),
                                                          {V2_platform, _B3} =
                                                              protocol:string(_B2),
                                                          {V2_zone_id, _B4} =
                                                              protocol:uint32(_B3),
                                                          {V2_name, _B5} =
                                                              protocol:string(_B4),
                                                          {V2_is_leader, _B6} =
                                                              protocol:uint8(_B5),
                                                          {V2_classes, _B7} =
                                                              protocol:uint8(_B6),
                                                          {V2_sex, _B8} =
                                                              protocol:uint8(_B7),
                                                          {V2_round, _B9} =
                                                              protocol:uint16(_B8),
                                                          {{V2_rid,
                                                            V2_platform,
                                                            V2_zone_id,
                                                            V2_name,
                                                            V2_is_leader,
                                                            V2_classes,
                                                            V2_sex,
                                                            V2_round},
                                                           _B9}
                                                  end),
    {ok, {V1_world_boss_killer}};
unpack(srv, 13005, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_r_platform, _B2} = protocol:string(_B1),
    {V1_r_zone_id, _B3} = protocol:uint16(_B2),
    {V1_base_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_rid, V1_r_platform, V1_r_zone_id, V1_base_id}};
unpack(cli, 13005, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 13006, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_base_id}};
unpack(cli, 13006, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 13007, _B0) -> {ok, {}};
unpack(cli, 13007, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_is_kill, _B2} = protocol:uint8(_B1),
    {V1_is_live, _B3} = protocol:uint8(_B2),
    {ok, {V1_id, V1_is_kill, V1_is_live}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

