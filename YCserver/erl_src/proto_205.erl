-file("src/proto/proto_205.erl", 1).

-module(proto_205).

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

-file("src/proto/proto_205.erl", 14).

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

-file("src/proto/proto_205.erl", 15).

-file("inc/guild_dragon.hrl", 1).

-author("jia").

-record(guild_dragon_role,
        {ver = 2,
         rid = {0, "", 0},
         map_pid = 0 :: pid(),
         name = "",
         lev = 0,
         sex = 0,
         classes = 0,
         looks = [],
         guild_id = {0, "", 0},
         guild_name = "",
         history = [],
         person_point = 0,
         rewards = [],
         update_time = 0,
         total_person_point = 0,
         challenge_msg_list = [],
         challenge_time = 0,
         loot_status = 0,
         loot_time = 0,
         looted_time = 0,
         max_rank = 0,
         honor_id = 0,
         pre_honor_id = 0,
         sign = 0,
         total_num = 0,
         sys_barrage = 1,
         ply_barrage = 1,
         barrage_time = 0,
         rank_index = 0,
         looted_num = 0,
         is_in_map = 0}).

-record(guild_dragon_history,
        {time = 0, point = 0, rewards = [], rank_index = 0}).

-record(guild_dragon_challenge_msg,
        {target_type = 0,
         target_id = {0, "", 0},
         msg = "",
         add_time = 0}).

-record(guild_dragon_guild,
        {ver = 1,
         guild_id = {0, "", 0},
         guild_name = "",
         lev = 0,
         leader_name = "",
         guild_point = 0,
         update_time = 0,
         rewards = [],
         max_rank = 0,
         history = []}).

-record(guild_dragon_fighter,
        {ver = 1,
         id = {0, "", 0},
         formation = 1,
         formation_lev = 1,
         guards = [],
         first_pet = 0,
         first_pet_base_id = 0}).

-file("src/proto/proto_205.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 20500, {}) ->
    {ok, <<2:32/little, 20500:16/little>>};
pack(srv, 20500,
     {V0_point,
      V0_challenge_msg,
      V0_challenge_time,
      V0_loot_time,
      V0_looted_time,
      V0_sys_value,
      V0_ply_value,
      V0_barrage_time,
      V0_rank_index}) ->
    D_a_t_a = <<V0_point:32/little,
                (length(V0_challenge_msg)):16/little,
                (list_to_binary([<<V1_target_type:32/little,
                                   V1_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_msg))/binary,
                                   V1_add_time:32/little>>
                                 || #guild_dragon_challenge_msg{target_type =
                                                                    V1_target_type,
                                                                target_id =
                                                                    {V1_id,
                                                                     V1_platform,
                                                                     V1_zone_id},
                                                                msg = V1_msg,
                                                                add_time =
                                                                    V1_add_time}
                                        <- V0_challenge_msg]))/binary,
                V0_challenge_time:32/little, V0_loot_time:32/little,
                V0_looted_time:32/little, V0_sys_value:8/little,
                V0_ply_value:8/little, V0_barrage_time:32/little,
                V0_rank_index:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20500:16/little,
       D_a_t_a/binary>>};
pack(cli, 20501, {}) ->
    {ok, <<2:32/little, 20501:16/little>>};
pack(srv, 20501,
     {V0_state,
      V0_start_time,
      V0_end_time,
      V0_boss_start_time,
      V0_boss_end_time}) ->
    D_a_t_a = <<V0_state:8/little, V0_start_time:32/little,
                V0_end_time:32/little, V0_boss_start_time:32/little,
                V0_boss_end_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20501:16/little,
       D_a_t_a/binary>>};
pack(cli, 20502, {V0_rank_type, V0_rank_num}) ->
    D_a_t_a = <<V0_rank_type:8/little,
                V0_rank_num:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20502:16/little,
       D_a_t_a/binary>>};
pack(srv, 20502, {V0_rank_type, V0_rank_list}) ->
    D_a_t_a = <<V0_rank_type:8/little,
                (length(V0_rank_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   V1_rank_index:32/little,
                                   (protocol:pack(string,
                                                  V1_target_name))/binary,
                                   (protocol:pack(string,
                                                  V1_guild_name))/binary,
                                   V1_point:32/little, V1_classes:8/little,
                                   V1_sex:8/little, V1_lev:32/little>>
                                 || {{V1_id, V1_platform, V1_zone_id},
                                     V1_rank_index,
                                     V1_target_name,
                                     V1_guild_name,
                                     V1_point,
                                     V1_classes,
                                     V1_sex,
                                     V1_lev}
                                        <- V0_rank_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20502:16/little,
       D_a_t_a/binary>>};
pack(cli, 20503, {}) ->
    {ok, <<2:32/little, 20503:16/little>>};
pack(srv, 20503, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20503:16/little,
       D_a_t_a/binary>>};
pack(cli, 20504, {}) ->
    {ok, <<2:32/little, 20504:16/little>>};
pack(srv, 20504, {V0_loot_list}) ->
    D_a_t_a = <<(length(V0_loot_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_role_name))/binary,
                                   V1_lev:32/little, V1_sex:8/little,
                                   V1_classes:32/little,
                                   V1_rank_index:32/little, V1_point:32/little,
                                   V1_loot_state:8/little,
                                   V1_looted_time:32/little, V1_g_id:32/little,
                                   (protocol:pack(string,
                                                  V1_g_platform))/binary,
                                   V1_g_zone_id:32/little,
                                   (protocol:pack(string,
                                                  V1_guild_name))/binary,
                                   V1_looted_num:32/little>>
                                 || {{V1_id, V1_platform, V1_zone_id},
                                     V1_role_name,
                                     V1_lev,
                                     V1_sex,
                                     V1_classes,
                                     V1_rank_index,
                                     V1_point,
                                     V1_loot_state,
                                     V1_looted_time,
                                     {V1_g_id, V1_g_platform, V1_g_zone_id},
                                     V1_guild_name,
                                     V1_looted_num}
                                        <- V0_loot_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20504:16/little,
       D_a_t_a/binary>>};
pack(cli, 20505, {}) ->
    {ok, <<2:32/little, 20505:16/little>>};
pack(srv, 20505, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20505:16/little,
       D_a_t_a/binary>>};
pack(cli, 20506, {}) ->
    {ok, <<2:32/little, 20506:16/little>>};
pack(srv, 20506,
     {V0_round,
      V0_damage,
      V0_point,
      V0_person_items,
      V0_guild_items,
      V0_scale}) ->
    D_a_t_a = <<V0_round:16/little, V0_damage:32/little,
                V0_point:32/little, (length(V0_person_items)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_bind:8/little, V1_num:32/little>>
                                 || {V1_base_id, V1_bind, V1_num}
                                        <- V0_person_items]))/binary,
                (length(V0_guild_items)):16/little,
                (list_to_binary([<<V1_g_base_id:32/little,
                                   V1_g_bind:8/little, V1_g_num:32/little>>
                                 || {V1_g_base_id, V1_g_bind, V1_g_num}
                                        <- V0_guild_items]))/binary,
                V0_scale:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20506:16/little,
       D_a_t_a/binary>>};
pack(cli, 20507, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20507:16/little,
       D_a_t_a/binary>>};
pack(srv, 20507, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20507:16/little,
       D_a_t_a/binary>>};
pack(cli, 20508, {}) ->
    {ok, <<2:32/little, 20508:16/little>>};
pack(srv, 20508,
     {V0_target_name,
      V0_target_guild,
      V0_is_win,
      V0_round,
      V0_loot_point,
      V0_rank_index}) ->
    D_a_t_a = <<(protocol:pack(string,
                               V0_target_name))/binary,
                (protocol:pack(string, V0_target_guild))/binary,
                V0_is_win:8/little, V0_round:16/little,
                V0_loot_point:32/little, V0_rank_index:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20508:16/little,
       D_a_t_a/binary>>};
pack(cli, 20509, {}) ->
    {ok, <<2:32/little, 20509:16/little>>};
pack(srv, 20509, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20509:16/little,
       D_a_t_a/binary>>};
pack(cli, 20510, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20510:16/little,
       D_a_t_a/binary>>};
pack(srv, 20510,
     {{V0_id, V0_platform, V0_zone_id},
      V0_looks,
      V0_honor_id,
      V0_pre_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, (length(V0_looks)):16/little,
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
                V0_honor_id:32/little, V0_pre_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20510:16/little,
       D_a_t_a/binary>>};
pack(cli, 20511,
     {V0_type, V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_type:32/little, V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20511:16/little,
       D_a_t_a/binary>>};
pack(srv, 20511,
     {V0_type,
      {V0_id, V0_platform, V0_zone_id},
      V0_rewards}) ->
    D_a_t_a = <<V0_type:32/little, V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, (length(V0_rewards)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_bind:8/little, V1_num:32/little>>
                                 || {V1_base_id, V1_bind, V1_num}
                                        <- V0_rewards]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20511:16/little,
       D_a_t_a/binary>>};
pack(cli, 20512, {}) ->
    {ok, <<2:32/little, 20512:16/little>>};
pack(srv, 20512,
     {V0_person_rank_list, V0_point_rewards, V0_msg}) ->
    D_a_t_a = <<(length(V0_person_rank_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   V1_rank_index:32/little,
                                   (protocol:pack(string,
                                                  V1_target_name))/binary,
                                   (protocol:pack(string,
                                                  V1_guild_name))/binary,
                                   V1_point:32/little, V1_classes:8/little,
                                   V1_sex:8/little, V1_lev:32/little>>
                                 || {{V1_id, V1_platform, V1_zone_id},
                                     V1_rank_index,
                                     V1_target_name,
                                     V1_guild_name,
                                     V1_point,
                                     V1_classes,
                                     V1_sex,
                                     V1_lev}
                                        <- V0_person_rank_list]))/binary,
                (length(V0_point_rewards)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_bind:8/little, V1_num:32/little>>
                                 || {V1_base_id, V1_bind, V1_num}
                                        <- V0_point_rewards]))/binary,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20512:16/little,
       D_a_t_a/binary>>};
pack(cli, 20513, {V0_type, V0_value}) ->
    D_a_t_a = <<V0_type:32/little, V0_value:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20513:16/little,
       D_a_t_a/binary>>};
pack(srv, 20513,
     {V0_type, V0_value, V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_type:32/little, V0_value:8/little,
                V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20513:16/little,
       D_a_t_a/binary>>};
pack(cli, 20514, {V0_msg}) ->
    D_a_t_a = <<(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20514:16/little,
       D_a_t_a/binary>>};
pack(srv, 20514, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20514:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 20500, _B0) -> {ok, {}};
unpack(cli, 20500, _B0) ->
    {V1_point, _B1} = protocol:uint32(_B0),
    {V1_challenge_msg, _B10} = protocol:array(_B1,
                                              fun (_B2) ->
                                                      {V2_target_type, _B3} =
                                                          protocol:uint32(_B2),
                                                      {V2_id, _B4} =
                                                          protocol:uint32(_B3),
                                                      {V2_platform, _B5} =
                                                          protocol:string(_B4),
                                                      {V2_zone_id, _B6} =
                                                          protocol:uint32(_B5),
                                                      {V2_msg, _B7} =
                                                          protocol:string(_B6),
                                                      {V2_add_time, _B8} =
                                                          protocol:uint32(_B7),
                                                      {{V2_target_type,
                                                        V2_id,
                                                        V2_platform,
                                                        V2_zone_id,
                                                        V2_msg,
                                                        V2_add_time},
                                                       _B8}
                                              end),
    {V1_challenge_time, _B11} = protocol:uint32(_B10),
    {V1_loot_time, _B12} = protocol:uint32(_B11),
    {V1_looted_time, _B13} = protocol:uint32(_B12),
    {V1_sys_value, _B14} = protocol:uint8(_B13),
    {V1_ply_value, _B15} = protocol:uint8(_B14),
    {V1_barrage_time, _B16} = protocol:uint32(_B15),
    {V1_rank_index, _B17} = protocol:uint32(_B16),
    {ok,
     {V1_point,
      V1_challenge_msg,
      V1_challenge_time,
      V1_loot_time,
      V1_looted_time,
      V1_sys_value,
      V1_ply_value,
      V1_barrage_time,
      V1_rank_index}};
unpack(srv, 20501, _B0) -> {ok, {}};
unpack(cli, 20501, _B0) ->
    {V1_state, _B1} = protocol:uint8(_B0),
    {V1_start_time, _B2} = protocol:uint32(_B1),
    {V1_end_time, _B3} = protocol:uint32(_B2),
    {V1_boss_start_time, _B4} = protocol:uint32(_B3),
    {V1_boss_end_time, _B5} = protocol:uint32(_B4),
    {ok,
     {V1_state,
      V1_start_time,
      V1_end_time,
      V1_boss_start_time,
      V1_boss_end_time}};
unpack(srv, 20502, _B0) ->
    {V1_rank_type, _B1} = protocol:uint8(_B0),
    {V1_rank_num, _B2} = protocol:uint32(_B1),
    {ok, {V1_rank_type, V1_rank_num}};
unpack(cli, 20502, _B0) ->
    {V1_rank_type, _B1} = protocol:uint8(_B0),
    {V1_rank_list, _B14} = protocol:array(_B1,
                                          fun (_B2) ->
                                                  {V2_id, _B3} =
                                                      protocol:uint32(_B2),
                                                  {V2_platform, _B4} =
                                                      protocol:string(_B3),
                                                  {V2_zone_id, _B5} =
                                                      protocol:uint32(_B4),
                                                  {V2_rank_index, _B6} =
                                                      protocol:uint32(_B5),
                                                  {V2_target_name, _B7} =
                                                      protocol:string(_B6),
                                                  {V2_guild_name, _B8} =
                                                      protocol:string(_B7),
                                                  {V2_point, _B9} =
                                                      protocol:uint32(_B8),
                                                  {V2_classes, _B10} =
                                                      protocol:uint8(_B9),
                                                  {V2_sex, _B11} =
                                                      protocol:uint8(_B10),
                                                  {V2_lev, _B12} =
                                                      protocol:uint32(_B11),
                                                  {{V2_id,
                                                    V2_platform,
                                                    V2_zone_id,
                                                    V2_rank_index,
                                                    V2_target_name,
                                                    V2_guild_name,
                                                    V2_point,
                                                    V2_classes,
                                                    V2_sex,
                                                    V2_lev},
                                                   _B12}
                                          end),
    {ok, {V1_rank_type, V1_rank_list}};
unpack(srv, 20503, _B0) -> {ok, {}};
unpack(cli, 20503, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 20504, _B0) -> {ok, {}};
unpack(cli, 20504, _B0) ->
    {V1_loot_list, _B19} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_id, _B2} =
                                                      protocol:uint32(_B1),
                                                  {V2_platform, _B3} =
                                                      protocol:string(_B2),
                                                  {V2_zone_id, _B4} =
                                                      protocol:uint32(_B3),
                                                  {V2_role_name, _B5} =
                                                      protocol:string(_B4),
                                                  {V2_lev, _B6} =
                                                      protocol:uint32(_B5),
                                                  {V2_sex, _B7} =
                                                      protocol:uint8(_B6),
                                                  {V2_classes, _B8} =
                                                      protocol:uint32(_B7),
                                                  {V2_rank_index, _B9} =
                                                      protocol:uint32(_B8),
                                                  {V2_point, _B10} =
                                                      protocol:uint32(_B9),
                                                  {V2_loot_state, _B11} =
                                                      protocol:uint8(_B10),
                                                  {V2_looted_time, _B12} =
                                                      protocol:uint32(_B11),
                                                  {V2_g_id, _B13} =
                                                      protocol:uint32(_B12),
                                                  {V2_g_platform, _B14} =
                                                      protocol:string(_B13),
                                                  {V2_g_zone_id, _B15} =
                                                      protocol:uint32(_B14),
                                                  {V2_guild_name, _B16} =
                                                      protocol:string(_B15),
                                                  {V2_looted_num, _B17} =
                                                      protocol:uint32(_B16),
                                                  {{V2_id,
                                                    V2_platform,
                                                    V2_zone_id,
                                                    V2_role_name,
                                                    V2_lev,
                                                    V2_sex,
                                                    V2_classes,
                                                    V2_rank_index,
                                                    V2_point,
                                                    V2_loot_state,
                                                    V2_looted_time,
                                                    V2_g_id,
                                                    V2_g_platform,
                                                    V2_g_zone_id,
                                                    V2_guild_name,
                                                    V2_looted_num},
                                                   _B17}
                                          end),
    {ok, {V1_loot_list}};
unpack(srv, 20505, _B0) -> {ok, {}};
unpack(cli, 20505, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 20506, _B0) -> {ok, {}};
unpack(cli, 20506, _B0) ->
    {V1_round, _B1} = protocol:uint16(_B0),
    {V1_damage, _B2} = protocol:uint32(_B1),
    {V1_point, _B3} = protocol:uint32(_B2),
    {V1_person_items, _B9} = protocol:array(_B3,
                                            fun (_B4) ->
                                                    {V2_base_id, _B5} =
                                                        protocol:uint32(_B4),
                                                    {V2_bind, _B6} =
                                                        protocol:uint8(_B5),
                                                    {V2_num, _B7} =
                                                        protocol:uint32(_B6),
                                                    {{V2_base_id,
                                                      V2_bind,
                                                      V2_num},
                                                     _B7}
                                            end),
    {V1_guild_items, _B15} = protocol:array(_B9,
                                            fun (_B10) ->
                                                    {V2_g_base_id, _B11} =
                                                        protocol:uint32(_B10),
                                                    {V2_g_bind, _B12} =
                                                        protocol:uint8(_B11),
                                                    {V2_g_num, _B13} =
                                                        protocol:uint32(_B12),
                                                    {{V2_g_base_id,
                                                      V2_g_bind,
                                                      V2_g_num},
                                                     _B13}
                                            end),
    {V1_scale, _B16} = protocol:uint8(_B15),
    {ok,
     {V1_round,
      V1_damage,
      V1_point,
      V1_person_items,
      V1_guild_items,
      V1_scale}};
unpack(srv, 20507, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 20507, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 20508, _B0) -> {ok, {}};
unpack(cli, 20508, _B0) ->
    {V1_target_name, _B1} = protocol:string(_B0),
    {V1_target_guild, _B2} = protocol:string(_B1),
    {V1_is_win, _B3} = protocol:uint8(_B2),
    {V1_round, _B4} = protocol:uint16(_B3),
    {V1_loot_point, _B5} = protocol:uint32(_B4),
    {V1_rank_index, _B6} = protocol:uint32(_B5),
    {ok,
     {V1_target_name,
      V1_target_guild,
      V1_is_win,
      V1_round,
      V1_loot_point,
      V1_rank_index}};
unpack(srv, 20509, _B0) -> {ok, {}};
unpack(cli, 20509, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 20510, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 20510, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_looks, _B10} = protocol:array(_B3,
                                      fun (_B4) ->
                                              {V2_looks_type, _B5} =
                                                  protocol:uint32(_B4),
                                              {V2_looks_mode, _B6} =
                                                  protocol:uint32(_B5),
                                              {V2_looks_val, _B7} =
                                                  protocol:uint32(_B6),
                                              {V2_looks_str, _B8} =
                                                  protocol:string(_B7),
                                              {{V2_looks_type,
                                                V2_looks_mode,
                                                V2_looks_val,
                                                V2_looks_str},
                                               _B8}
                                      end),
    {V1_honor_id, _B11} = protocol:uint32(_B10),
    {V1_pre_id, _B12} = protocol:uint32(_B11),
    {ok,
     {V1_id,
      V1_platform,
      V1_zone_id,
      V1_looks,
      V1_honor_id,
      V1_pre_id}};
unpack(srv, 20511, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_platform, _B3} = protocol:string(_B2),
    {V1_zone_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_type, V1_id, V1_platform, V1_zone_id}};
unpack(cli, 20511, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_platform, _B3} = protocol:string(_B2),
    {V1_zone_id, _B4} = protocol:uint32(_B3),
    {V1_rewards, _B10} = protocol:array(_B4,
                                        fun (_B5) ->
                                                {V2_base_id, _B6} =
                                                    protocol:uint32(_B5),
                                                {V2_bind, _B7} =
                                                    protocol:uint8(_B6),
                                                {V2_num, _B8} =
                                                    protocol:uint32(_B7),
                                                {{V2_base_id, V2_bind, V2_num},
                                                 _B8}
                                        end),
    {ok,
     {V1_type, V1_id, V1_platform, V1_zone_id, V1_rewards}};
unpack(srv, 20512, _B0) -> {ok, {}};
unpack(cli, 20512, _B0) ->
    {V1_person_rank_list, _B13} = protocol:array(_B0,
                                                 fun (_B1) ->
                                                         {V2_id, _B2} =
                                                             protocol:uint32(_B1),
                                                         {V2_platform, _B3} =
                                                             protocol:string(_B2),
                                                         {V2_zone_id, _B4} =
                                                             protocol:uint32(_B3),
                                                         {V2_rank_index, _B5} =
                                                             protocol:uint32(_B4),
                                                         {V2_target_name, _B6} =
                                                             protocol:string(_B5),
                                                         {V2_guild_name, _B7} =
                                                             protocol:string(_B6),
                                                         {V2_point, _B8} =
                                                             protocol:uint32(_B7),
                                                         {V2_classes, _B9} =
                                                             protocol:uint8(_B8),
                                                         {V2_sex, _B10} =
                                                             protocol:uint8(_B9),
                                                         {V2_lev, _B11} =
                                                             protocol:uint32(_B10),
                                                         {{V2_id,
                                                           V2_platform,
                                                           V2_zone_id,
                                                           V2_rank_index,
                                                           V2_target_name,
                                                           V2_guild_name,
                                                           V2_point,
                                                           V2_classes,
                                                           V2_sex,
                                                           V2_lev},
                                                          _B11}
                                                 end),
    {V1_point_rewards, _B19} = protocol:array(_B13,
                                              fun (_B14) ->
                                                      {V2_base_id, _B15} =
                                                          protocol:uint32(_B14),
                                                      {V2_bind, _B16} =
                                                          protocol:uint8(_B15),
                                                      {V2_num, _B17} =
                                                          protocol:uint32(_B16),
                                                      {{V2_base_id,
                                                        V2_bind,
                                                        V2_num},
                                                       _B17}
                                              end),
    {V1_msg, _B20} = protocol:string(_B19),
    {ok, {V1_person_rank_list, V1_point_rewards, V1_msg}};
unpack(srv, 20513, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_value, _B2} = protocol:uint8(_B1),
    {ok, {V1_type, V1_value}};
unpack(cli, 20513, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_value, _B2} = protocol:uint8(_B1),
    {V1_flag, _B3} = protocol:uint8(_B2),
    {V1_msg, _B4} = protocol:string(_B3),
    {ok, {V1_type, V1_value, V1_flag, V1_msg}};
unpack(srv, 20514, _B0) ->
    {V1_msg, _B1} = protocol:string(_B0),
    {ok, {V1_msg}};
unpack(cli, 20514, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

