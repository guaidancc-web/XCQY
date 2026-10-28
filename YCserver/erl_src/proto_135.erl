-file("src/proto/proto_135.erl", 1).

-module(proto_135).

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

-file("src/proto/proto_135.erl", 14).

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

-file("src/proto/proto_135.erl", 15).

-file("inc/qualifying.hrl", 1).

-record(m_qualifying,
        {rank_point = 1000,
         season_combat_count = 0,
         season_win_count = 0,
         update_time = 0,
         day_win = 0,
         day_log = [],
         sign_type = 0,
         win_flag = 0,
         win_five_flag = 0}).

-record(qualifying_role_mark,
        {id = {0, "", 0},
         ver = 4,
         name = "",
         rank_lev = 0,
         rank_type = 0,
         rank_point = 1000,
         lev = 0,
         sex = 0,
         classes = 0,
         looks = [],
         thumb_up = 0,
         thumb_up_other = 0,
         day_flag = 0,
         day_win = 0,
         day_win_streak = 0,
         season_max_rank_point = 1000,
         season_combat_count = 0,
         season_win_count = 0,
         season_win_streak = 0,
         season_max_win_streak = 0,
         week_flag = 0,
         week_max_rank_point = 0,
         up_ranklev_reward = []}).

-record(qualifying_role,
        {id = {0, "", 0},
         status = 0,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         fc = 0,
         rank_lev = 1,
         rank_point = 1000,
         looks = [],
         type = 1,
         times = 1,
         point = 1,
         cross_group = 0 :: non_neg_integer()}).

-record(qualifying_team,
        {ids = [],
         origin_team = [],
         rank_point = 1,
         point = 1,
         match_time = 0,
         reward_point = 1,
         cross_group = 0 :: non_neg_integer()}).

-record(qualifying_rank_data,
        {lev = 1,
         max_lev = 1,
         point = 0,
         need_point = 200,
         rank_type = 0,
         lev_name = "",
         gain = [],
         five_gain = [],
         rank_type_name = [],
         uplev_reward = 0}).

-record(qualifying_zone_role,
        {id = {0, "", 0},
         name = "",
         is_online = 1,
         zone_pid,
         pid,
         zone_id = 0}).

-record(qualifying_season_data,
        {ver = 1,
         id = 1 :: pos_integer(),
         end_time = 0,
         count = 0,
         champion_list = []}).

-file("src/proto/proto_135.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 13500, {V0_type}) ->
    D_a_t_a = <<V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13500:16/little,
       D_a_t_a/binary>>};
pack(srv, 13500, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13500:16/little,
       D_a_t_a/binary>>};
pack(cli, 13501, {}) ->
    {ok, <<2:32/little, 13501:16/little>>};
pack(srv, 13501, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13501:16/little,
       D_a_t_a/binary>>};
pack(cli, 13502, {}) ->
    {ok, <<2:32/little, 13502:16/little>>};
pack(srv, 13502,
     {V0_status, V0_time, V0_season_time}) ->
    D_a_t_a = <<V0_status:8/little, V0_time:32/little,
                V0_season_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13502:16/little,
       D_a_t_a/binary>>};
pack(cli, 13503, {}) ->
    {ok, <<2:32/little, 13503:16/little>>};
pack(srv, 13503, {V0_type, V0_teammate, V0_enemy}) ->
    D_a_t_a = <<V0_type:8/little,
                (length(V0_teammate)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:8/little, V1_rank_lev:8/little,
                                   V1_rank_point:16/little,
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
                                 || {{V1_rid, V1_platform, V1_zone_id},
                                     V1_name,
                                     V1_sex,
                                     V1_classes,
                                     V1_lev,
                                     V1_rank_lev,
                                     V1_rank_point,
                                     V1_looks}
                                        <- V0_teammate]))/binary,
                (length(V0_enemy)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:8/little, V1_rank_lev:8/little,
                                   V1_rank_point:16/little,
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
                                 || {{V1_rid, V1_platform, V1_zone_id},
                                     V1_name,
                                     V1_sex,
                                     V1_classes,
                                     V1_lev,
                                     V1_rank_lev,
                                     V1_rank_point,
                                     V1_looks}
                                        <- V0_enemy]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13503:16/little,
       D_a_t_a/binary>>};
pack(cli, 13504, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13504:16/little,
       D_a_t_a/binary>>};
pack(srv, 13504,
     #qualifying_role_mark{id =
                               {V0_rid, V0_platform, V0_zone_id},
                           rank_lev = V0_rank_lev, rank_point = V0_rank_point,
                           season_win_count = V0_season_win_count,
                           season_combat_count = V0_season_combat_count,
                           thumb_up = V0_thumb_up,
                           season_max_rank_point = V0_season_max_rank_point,
                           up_ranklev_reward = V0_up_ranklev_reward}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_rank_lev:8/little,
                V0_rank_point:16/little, V0_season_win_count:16/little,
                V0_season_combat_count:16/little, V0_thumb_up:16/little,
                V0_season_max_rank_point:32/little,
                (length(V0_up_ranklev_reward)):16/little,
                (list_to_binary([<<V1_rank_lev:8/signed-little,
                                   V1_is_get:8/little>>
                                 || {V1_rank_lev, V1_is_get}
                                        <- V0_up_ranklev_reward]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13504:16/little,
       D_a_t_a/binary>>};
pack(cli, 13505, {}) ->
    {ok, <<2:32/little, 13505:16/little>>};
pack(srv, 13505,
     #qualifying_role_mark{id =
                               {V0_rid, V0_platform, V0_zone_id},
                           rank_lev = V0_rank_lev, rank_point = V0_rank_point,
                           up_ranklev_reward = V0_up_ranklev_reward}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_rank_lev:8/little,
                V0_rank_point:16/little,
                (length(V0_up_ranklev_reward)):16/little,
                (list_to_binary([<<V1_rank_lev:8/signed-little,
                                   V1_is_get:8/little>>
                                 || {V1_rank_lev, V1_is_get}
                                        <- V0_up_ranklev_reward]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13505:16/little,
       D_a_t_a/binary>>};
pack(cli, 13506, {}) ->
    {ok, <<2:32/little, 13506:16/little>>};
pack(srv, 13506,
     {V0_result,
      V0_b_rank_point,
      V0_a_rank_point,
      V0_assets,
      V0_team_list}) ->
    D_a_t_a = <<V0_result:8/little,
                V0_b_rank_point:16/little, V0_a_rank_point:16/little,
                (length(V0_assets)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_val:32/little>>
                                 || {V1_id, V1_val} <- V0_assets]))/binary,
                (length(V0_team_list)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:8/little>>
                                 || {{V1_rid, V1_platform, V1_zone_id},
                                     V1_name,
                                     V1_sex,
                                     V1_classes,
                                     V1_lev}
                                        <- V0_team_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13506:16/little,
       D_a_t_a/binary>>};
pack(cli, 13508, {V0_type, V0_idx, V0_num}) ->
    D_a_t_a = <<V0_type:8/little, V0_idx:8/little,
                V0_num:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13508:16/little,
       D_a_t_a/binary>>};
pack(srv, 13508,
     {V0_type, V0_idx, V0_max_idx, V0_qualifying_roles}) ->
    D_a_t_a = <<V0_type:8/little, V0_idx:8/little,
                V0_max_idx:8/little,
                (length(V0_qualifying_roles)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_lev:8/little,
                                   V1_classes:8/little, V1_rank_lev:8/little,
                                   V1_rank_point:32/little,
                                   V1_season_win_count:16/little,
                                   V1_season_combat_count:16/little>>
                                 || #qualifying_role_mark{id =
                                                              {V1_rid,
                                                               V1_platform,
                                                               V1_zone_id},
                                                          name = V1_name,
                                                          sex = V1_sex,
                                                          lev = V1_lev,
                                                          classes = V1_classes,
                                                          rank_lev =
                                                              V1_rank_lev,
                                                          rank_point =
                                                              V1_rank_point,
                                                          season_win_count =
                                                              V1_season_win_count,
                                                          season_combat_count =
                                                              V1_season_combat_count}
                                        <- V0_qualifying_roles]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13508:16/little,
       D_a_t_a/binary>>};
pack(cli, 13509, {}) ->
    {ok, <<2:32/little, 13509:16/little>>};
pack(srv, 13509, {V0_msg_list}) ->
    D_a_t_a = <<(length(V0_msg_list)):16/little,
                (list_to_binary([<<V1_time:32/little,
                                   (protocol:pack(string, V1_msg))/binary>>
                                 || {V1_time, V1_msg}
                                        <- V0_msg_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13509:16/little,
       D_a_t_a/binary>>};
pack(cli, 13510, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13510:16/little,
       D_a_t_a/binary>>};
pack(srv, 13510, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13510:16/little,
       D_a_t_a/binary>>};
pack(cli, 13511, {}) ->
    {ok, <<2:32/little, 13511:16/little>>};
pack(srv, 13511,
     {V0_sign_type,
      V0_win,
      V0_win_flag,
      V0_win_five_flag,
      V0_count_list}) ->
    D_a_t_a = <<V0_sign_type:8/little, V0_win:8/little,
                V0_win_flag:8/little, V0_win_five_flag:8/little,
                (length(V0_count_list)):16/little,
                (list_to_binary([<<V1_type:8/little, V1_num:8/little>>
                                 || {V1_type, V1_num}
                                        <- V0_count_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13511:16/little,
       D_a_t_a/binary>>};
pack(cli, 13512, {}) ->
    {ok, <<2:32/little, 13512:16/little>>};
pack(srv, 13512, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13512:16/little,
       D_a_t_a/binary>>};
pack(cli, 13513, {}) ->
    {ok, <<2:32/little, 13513:16/little>>};
pack(srv, 13513, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13513:16/little,
       D_a_t_a/binary>>};
pack(cli, 13514, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13514:16/little,
       D_a_t_a/binary>>};
pack(srv, 13514, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13514:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 13500, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_type}};
unpack(cli, 13500, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 13501, _B0) -> {ok, {}};
unpack(cli, 13501, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 13502, _B0) -> {ok, {}};
unpack(cli, 13502, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_time, _B2} = protocol:uint32(_B1),
    {V1_season_time, _B3} = protocol:uint32(_B2),
    {ok, {V1_status, V1_time, V1_season_time}};
unpack(srv, 13503, _B0) -> {ok, {}};
unpack(cli, 13503, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_teammate, _B20} = protocol:array(_B1,
                                         fun (_B2) ->
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
                                                 {V2_rank_lev, _B10} =
                                                     protocol:uint8(_B9),
                                                 {V2_rank_point, _B11} =
                                                     protocol:uint16(_B10),
                                                 {V2_looks, _B18} =
                                                     protocol:array(_B11,
                                                                    fun
                                                                        (_B12) ->
                                                                            {V3_looks_type,
                                                                             _B13} =
                                                                                protocol:uint32(_B12),
                                                                            {V3_looks_mode,
                                                                             _B14} =
                                                                                protocol:uint32(_B13),
                                                                            {V3_looks_val,
                                                                             _B15} =
                                                                                protocol:uint32(_B14),
                                                                            {V3_looks_str,
                                                                             _B16} =
                                                                                protocol:string(_B15),
                                                                            {{V3_looks_type,
                                                                              V3_looks_mode,
                                                                              V3_looks_val,
                                                                              V3_looks_str},
                                                                             _B16}
                                                                    end),
                                                 {{V2_rid,
                                                   V2_platform,
                                                   V2_zone_id,
                                                   V2_name,
                                                   V2_sex,
                                                   V2_classes,
                                                   V2_lev,
                                                   V2_rank_lev,
                                                   V2_rank_point,
                                                   V2_looks},
                                                  _B18}
                                         end),
    {V1_enemy, _B39} = protocol:array(_B20,
                                      fun (_B21) ->
                                              {V2_rid, _B22} =
                                                  protocol:uint32(_B21),
                                              {V2_platform, _B23} =
                                                  protocol:string(_B22),
                                              {V2_zone_id, _B24} =
                                                  protocol:uint32(_B23),
                                              {V2_name, _B25} =
                                                  protocol:string(_B24),
                                              {V2_sex, _B26} =
                                                  protocol:uint8(_B25),
                                              {V2_classes, _B27} =
                                                  protocol:uint8(_B26),
                                              {V2_lev, _B28} =
                                                  protocol:uint8(_B27),
                                              {V2_rank_lev, _B29} =
                                                  protocol:uint8(_B28),
                                              {V2_rank_point, _B30} =
                                                  protocol:uint16(_B29),
                                              {V2_looks, _B37} =
                                                  protocol:array(_B30,
                                                                 fun (_B31) ->
                                                                         {V3_looks_type,
                                                                          _B32} =
                                                                             protocol:uint32(_B31),
                                                                         {V3_looks_mode,
                                                                          _B33} =
                                                                             protocol:uint32(_B32),
                                                                         {V3_looks_val,
                                                                          _B34} =
                                                                             protocol:uint32(_B33),
                                                                         {V3_looks_str,
                                                                          _B35} =
                                                                             protocol:string(_B34),
                                                                         {{V3_looks_type,
                                                                           V3_looks_mode,
                                                                           V3_looks_val,
                                                                           V3_looks_str},
                                                                          _B35}
                                                                 end),
                                              {{V2_rid,
                                                V2_platform,
                                                V2_zone_id,
                                                V2_name,
                                                V2_sex,
                                                V2_classes,
                                                V2_lev,
                                                V2_rank_lev,
                                                V2_rank_point,
                                                V2_looks},
                                               _B37}
                                      end),
    {ok, {V1_type, V1_teammate, V1_enemy}};
unpack(srv, 13504, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 13504, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_rank_lev, _B4} = protocol:uint8(_B3),
    {V1_rank_point, _B5} = protocol:uint16(_B4),
    {V1_season_win_count, _B6} = protocol:uint16(_B5),
    {V1_season_combat_count, _B7} = protocol:uint16(_B6),
    {V1_thumb_up, _B8} = protocol:uint16(_B7),
    {V1_season_max_rank_point, _B9} = protocol:uint32(_B8),
    {V1_up_ranklev_reward, _B14} = protocol:array(_B9,
                                                  fun (_B10) ->
                                                          {V2_rank_lev, _B11} =
                                                              protocol:int8(_B10),
                                                          {V2_is_get, _B12} =
                                                              protocol:uint8(_B11),
                                                          {{V2_rank_lev,
                                                            V2_is_get},
                                                           _B12}
                                                  end),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_rank_lev,
      V1_rank_point,
      V1_season_win_count,
      V1_season_combat_count,
      V1_thumb_up,
      V1_season_max_rank_point,
      V1_up_ranklev_reward}};
unpack(srv, 13505, _B0) -> {ok, {}};
unpack(cli, 13505, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_rank_lev, _B4} = protocol:uint8(_B3),
    {V1_rank_point, _B5} = protocol:uint16(_B4),
    {V1_up_ranklev_reward, _B10} = protocol:array(_B5,
                                                  fun (_B6) ->
                                                          {V2_rank_lev, _B7} =
                                                              protocol:int8(_B6),
                                                          {V2_is_get, _B8} =
                                                              protocol:uint8(_B7),
                                                          {{V2_rank_lev,
                                                            V2_is_get},
                                                           _B8}
                                                  end),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_rank_lev,
      V1_rank_point,
      V1_up_ranklev_reward}};
unpack(srv, 13506, _B0) -> {ok, {}};
unpack(cli, 13506, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_b_rank_point, _B2} = protocol:uint16(_B1),
    {V1_a_rank_point, _B3} = protocol:uint16(_B2),
    {V1_assets, _B8} = protocol:array(_B3,
                                      fun (_B4) ->
                                              {V2_id, _B5} =
                                                  protocol:uint32(_B4),
                                              {V2_val, _B6} =
                                                  protocol:uint32(_B5),
                                              {{V2_id, V2_val}, _B6}
                                      end),
    {V1_team_list, _B18} = protocol:array(_B8,
                                          fun (_B9) ->
                                                  {V2_rid, _B10} =
                                                      protocol:uint32(_B9),
                                                  {V2_platform, _B11} =
                                                      protocol:string(_B10),
                                                  {V2_zone_id, _B12} =
                                                      protocol:uint32(_B11),
                                                  {V2_name, _B13} =
                                                      protocol:string(_B12),
                                                  {V2_sex, _B14} =
                                                      protocol:uint8(_B13),
                                                  {V2_classes, _B15} =
                                                      protocol:uint8(_B14),
                                                  {V2_lev, _B16} =
                                                      protocol:uint8(_B15),
                                                  {{V2_rid,
                                                    V2_platform,
                                                    V2_zone_id,
                                                    V2_name,
                                                    V2_sex,
                                                    V2_classes,
                                                    V2_lev},
                                                   _B16}
                                          end),
    {ok,
     {V1_result,
      V1_b_rank_point,
      V1_a_rank_point,
      V1_assets,
      V1_team_list}};
unpack(srv, 13508, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_idx, _B2} = protocol:uint8(_B1),
    {V1_num, _B3} = protocol:uint8(_B2),
    {ok, {V1_type, V1_idx, V1_num}};
unpack(cli, 13508, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_idx, _B2} = protocol:uint8(_B1),
    {V1_max_idx, _B3} = protocol:uint8(_B2),
    {V1_qualifying_roles, _B17} = protocol:array(_B3,
                                                 fun (_B4) ->
                                                         {V2_rid, _B5} =
                                                             protocol:uint32(_B4),
                                                         {V2_platform, _B6} =
                                                             protocol:string(_B5),
                                                         {V2_zone_id, _B7} =
                                                             protocol:uint32(_B6),
                                                         {V2_name, _B8} =
                                                             protocol:string(_B7),
                                                         {V2_sex, _B9} =
                                                             protocol:uint8(_B8),
                                                         {V2_lev, _B10} =
                                                             protocol:uint8(_B9),
                                                         {V2_classes, _B11} =
                                                             protocol:uint8(_B10),
                                                         {V2_rank_lev, _B12} =
                                                             protocol:uint8(_B11),
                                                         {V2_rank_point, _B13} =
                                                             protocol:uint32(_B12),
                                                         {V2_season_win_count,
                                                          _B14} =
                                                             protocol:uint16(_B13),
                                                         {V2_season_combat_count,
                                                          _B15} =
                                                             protocol:uint16(_B14),
                                                         {{V2_rid,
                                                           V2_platform,
                                                           V2_zone_id,
                                                           V2_name,
                                                           V2_sex,
                                                           V2_lev,
                                                           V2_classes,
                                                           V2_rank_lev,
                                                           V2_rank_point,
                                                           V2_season_win_count,
                                                           V2_season_combat_count},
                                                          _B15}
                                                 end),
    {ok,
     {V1_type, V1_idx, V1_max_idx, V1_qualifying_roles}};
unpack(srv, 13509, _B0) -> {ok, {}};
unpack(cli, 13509, _B0) ->
    {V1_msg_list, _B5} = protocol:array(_B0,
                                        fun (_B1) ->
                                                {V2_time, _B2} =
                                                    protocol:uint32(_B1),
                                                {V2_msg, _B3} =
                                                    protocol:string(_B2),
                                                {{V2_time, V2_msg}, _B3}
                                        end),
    {ok, {V1_msg_list}};
unpack(srv, 13510, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 13510, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 13511, _B0) -> {ok, {}};
unpack(cli, 13511, _B0) ->
    {V1_sign_type, _B1} = protocol:uint8(_B0),
    {V1_win, _B2} = protocol:uint8(_B1),
    {V1_win_flag, _B3} = protocol:uint8(_B2),
    {V1_win_five_flag, _B4} = protocol:uint8(_B3),
    {V1_count_list, _B9} = protocol:array(_B4,
                                          fun (_B5) ->
                                                  {V2_type, _B6} =
                                                      protocol:uint8(_B5),
                                                  {V2_num, _B7} =
                                                      protocol:uint8(_B6),
                                                  {{V2_type, V2_num}, _B7}
                                          end),
    {ok,
     {V1_sign_type,
      V1_win,
      V1_win_flag,
      V1_win_five_flag,
      V1_count_list}};
unpack(srv, 13512, _B0) -> {ok, {}};
unpack(cli, 13512, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 13513, _B0) -> {ok, {}};
unpack(cli, 13513, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 13514, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(cli, 13514, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

