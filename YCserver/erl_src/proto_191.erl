-file("src/proto/proto_191.erl", 1).

-module(proto_191).

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

-file("src/proto/proto_191.erl", 14).

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

-file("src/proto/proto_191.erl", 15).

-file("inc/guild_siege.hrl", 1).

-record(guild_siege_match,
        {ver = 1,
         round = 1,
         match_id = 1,
         lev_group = 0,
         guild_ids = [],
         guild_match_list = [],
         has_result = 0,
         win_guild_id = {0, "", 0}}).

-record(guild_siege_match_guild,
        {ver = 1,
         guild_id = {0, "", 0},
         guild_name = "",
         guild_lev = 0,
         round = 1,
         match_id = 1,
         score = 0,
         score_time = 0,
         score_log = [],
         win_star_3 = 0,
         win_star_2 = 0,
         win_star_1 = 0,
         atk_times = 0,
         win_times = 0,
         castle_num = 0,
         best_atk_id = {0, "", 0},
         best_atk_name = "",
         best_atk_data = {0, 0, 0},
         best_atk_combat_replay = {0, "", 0},
         best_def_id = {0, "", 0},
         best_def_name = "",
         best_def_data = {0, 0},
         best_def_combat_replay = {0, "", 0},
         castle_list = [],
         logs = []}).

-record(guild_siege_match_combat_log,
        {ver = 2,
         time = 0,
         star = 1,
         guild_id_1 = {0, "", 0},
         guild_name_1 = "",
         role_id_1 = {0, "", 0},
         role_name_1 = "",
         role_order_1 = 1,
         guild_id_2 = {0, "", 0},
         guild_name_2 = "",
         role_id_2 = {0, "", 0},
         role_name_2 = "",
         role_order_2 = 1,
         is_win = 0,
         combat_replay_id = {0, "", 0},
         role_lev_1 = 0,
         role_lev_2 = 0}).

-record(guild_siege_castle,
        {ver = 1,
         id = {0, "", 0},
         order = 0,
         castle_type = 0,
         name = "",
         lev = 0,
         lev_break_times = 0,
         sex = 0,
         classes = 0,
         loss_star = 0,
         def_win_times = 0,
         def_win_min_order = 0,
         def_times = 0,
         atk_times = 0,
         atk_win_times = 0,
         castle_log = [],
         can_look = 0,
         formation = 1,
         formation_lev = 1,
         guards = [],
         is_combat = 0,
         combat_pid,
         combat_id = {0, "", 0},
         combat_name = ""}).

-record(guild_siege_role,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         lev = 0,
         lev_break_times = 0,
         sex = 0,
         classes = 0,
         formation = 1,
         formation_lev = 1,
         guards = [],
         first_pet = 0,
         first_pet_base_id = 0,
         robot_role}).

-record(guild_siege_role_log,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         atk_num = 0,
         atk_log = []}).

-record(guild_siege_guild_rank,
        {ver = 2,
         guild_id = {0, "", 0},
         score = 0,
         logs = [],
         win_times = 0,
         all_times = 0,
         last_guild_id = {0, "", 0},
         punish_time = 0}).

-file("src/proto/proto_191.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 19100, {}) ->
    {ok, <<2:32/little, 19100:16/little>>};
pack(srv, 19100, {V0_status, V0_time, V0_round}) ->
    D_a_t_a = <<V0_status:8/little, V0_time:32/little,
                V0_round:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19100:16/little,
       D_a_t_a/binary>>};
pack(cli, 19101, {}) ->
    {ok, <<2:32/little, 19101:16/little>>};
pack(srv, 19101,
     {#guild_siege_match{round = V0_round,
                         match_id = V0_match_id, lev_group = V0_lev_group,
                         has_result = V0_has_result,
                         win_guild_id =
                             {V0_win_guild_rid,
                              V0_win_guild_plat,
                              V0_win_guild_zone},
                         guild_match_list = V0_guild_match_list}}) ->
    D_a_t_a = <<V0_round:8/little, V0_match_id:32/little,
                V0_lev_group:8/little, V0_has_result:8/little,
                V0_win_guild_rid:32/little,
                (protocol:pack(string, V0_win_guild_plat))/binary,
                V0_win_guild_zone:16/little,
                (length(V0_guild_match_list)):16/little,
                (list_to_binary([<<V1_guild_rid:32/little,
                                   (protocol:pack(string,
                                                  V1_guild_plat))/binary,
                                   V1_guild_zone:16/little,
                                   (protocol:pack(string,
                                                  V1_guild_name))/binary,
                                   V1_guild_lev:8/little,
                                   V1_win_star_3:16/little,
                                   V1_win_star_2:16/little,
                                   V1_win_star_1:16/little,
                                   V1_atk_times:16/little,
                                   V1_win_times:16/little,
                                   V1_castle_num:16/little, V1_score:16/little,
                                   V1_atk_rid:32/little,
                                   (protocol:pack(string, V1_atk_plat))/binary,
                                   V1_atk_zone:16/little,
                                   V1_a_replay_id:32/little,
                                   (protocol:pack(string,
                                                  V1_a_replay_plat))/binary,
                                   V1_a_replay_zone:16/little,
                                   (protocol:pack(string,
                                                  V1_best_atk_name))/binary,
                                   V1_def_rid:32/little,
                                   (protocol:pack(string, V1_def_plat))/binary,
                                   V1_def_zone:16/little,
                                   V1_d_replay_id:32/little,
                                   (protocol:pack(string,
                                                  V1_d_replay_plat))/binary,
                                   V1_d_replay_zone:16/little,
                                   (protocol:pack(string,
                                                  V1_best_def_name))/binary,
                                   (length(V1_castle_list)):16/little,
                                   (list_to_binary([<<V2_r_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_r_plat))/binary,
                                                      V2_r_zone:16/little,
                                                      V2_order:8/little,
                                                      (protocol:pack(string,
                                                                     V2_name))/binary,
                                                      V2_lev:8/little,
                                                      V2_classes:8/little,
                                                      V2_sex:8/little,
                                                      V2_lev_break_times:8/little,
                                                      V2_loss_star:8/little,
                                                      V2_def_times:16/little,
                                                      V2_def_win_times:16/little,
                                                      V2_atk_times:8/little,
                                                      V2_atk_win_times:8/little,
                                                      V2_is_combat:8/little>>
                                                    || #guild_siege_castle{id =
                                                                               {V2_r_id,
                                                                                V2_r_plat,
                                                                                V2_r_zone},
                                                                           order
                                                                               =
                                                                               V2_order,
                                                                           name
                                                                               =
                                                                               V2_name,
                                                                           lev =
                                                                               V2_lev,
                                                                           classes
                                                                               =
                                                                               V2_classes,
                                                                           sex =
                                                                               V2_sex,
                                                                           lev_break_times
                                                                               =
                                                                               V2_lev_break_times,
                                                                           loss_star
                                                                               =
                                                                               V2_loss_star,
                                                                           def_times
                                                                               =
                                                                               V2_def_times,
                                                                           def_win_times
                                                                               =
                                                                               V2_def_win_times,
                                                                           atk_times
                                                                               =
                                                                               V2_atk_times,
                                                                           atk_win_times
                                                                               =
                                                                               V2_atk_win_times,
                                                                           is_combat
                                                                               =
                                                                               V2_is_combat}
                                                           <- V1_castle_list]))/binary>>
                                 || #guild_siege_match_guild{guild_id =
                                                                 {V1_guild_rid,
                                                                  V1_guild_plat,
                                                                  V1_guild_zone},
                                                             guild_name =
                                                                 V1_guild_name,
                                                             guild_lev =
                                                                 V1_guild_lev,
                                                             win_star_3 =
                                                                 V1_win_star_3,
                                                             win_star_2 =
                                                                 V1_win_star_2,
                                                             win_star_1 =
                                                                 V1_win_star_1,
                                                             atk_times =
                                                                 V1_atk_times,
                                                             win_times =
                                                                 V1_win_times,
                                                             castle_num =
                                                                 V1_castle_num,
                                                             score = V1_score,
                                                             best_atk_id =
                                                                 {V1_atk_rid,
                                                                  V1_atk_plat,
                                                                  V1_atk_zone},
                                                             best_atk_combat_replay
                                                                 =
                                                                 {V1_a_replay_id,
                                                                  V1_a_replay_plat,
                                                                  V1_a_replay_zone},
                                                             best_atk_name =
                                                                 V1_best_atk_name,
                                                             best_def_id =
                                                                 {V1_def_rid,
                                                                  V1_def_plat,
                                                                  V1_def_zone},
                                                             best_def_combat_replay
                                                                 =
                                                                 {V1_d_replay_id,
                                                                  V1_d_replay_plat,
                                                                  V1_d_replay_zone},
                                                             best_def_name =
                                                                 V1_best_def_name,
                                                             castle_list =
                                                                 V1_castle_list}
                                        <- V0_guild_match_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19101:16/little,
       D_a_t_a/binary>>};
pack(cli, 19102, {V0_flag, V0_order}) ->
    D_a_t_a = <<V0_flag:8/little, V0_order:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19102:16/little,
       D_a_t_a/binary>>};
pack(srv, 19102,
     {V0_flag,
      #guild_siege_castle{id =
                              {V0_r_id, V0_r_plat, V0_r_zone},
                          order = V0_order, name = V0_name, lev = V0_lev,
                          classes = V0_classes, sex = V0_sex,
                          lev_break_times = V0_lev_break_times,
                          loss_star = V0_loss_star, def_times = V0_def_times,
                          def_win_times = V0_def_win_times,
                          atk_times = V0_atk_times,
                          atk_win_times = V0_atk_win_times,
                          can_look = V0_can_look, formation = V0_formation,
                          formation_lev = V0_formation_lev, guards = V0_guards,
                          is_combat = V0_is_combat,
                          castle_log = V0_castle_log}}) ->
    D_a_t_a = <<V0_flag:8/little, V0_r_id:32/little,
                (protocol:pack(string, V0_r_plat))/binary,
                V0_r_zone:16/little, V0_order:8/little,
                (protocol:pack(string, V0_name))/binary,
                V0_lev:8/little, V0_classes:8/little, V0_sex:8/little,
                V0_lev_break_times:8/little, V0_loss_star:8/little,
                V0_def_times:16/little, V0_def_win_times:16/little,
                V0_atk_times:8/little, V0_atk_win_times:8/little,
                V0_can_look:8/little, V0_formation:8/little,
                V0_formation_lev:8/little,
                (length(V0_guards)):16/little,
                (list_to_binary([<<V1_guard_id:32/little,
                                   V1_war_id:8/little>>
                                 || {V1_guard_id, V1_war_id}
                                        <- V0_guards]))/binary,
                V0_is_combat:8/little,
                (length(V0_castle_log)):16/little,
                (list_to_binary([<<V1_time:32/little, V1_star:8/little,
                                   V1_is_win:8/little, V1_guild_rid_1:32/little,
                                   (protocol:pack(string,
                                                  V1_guild_plat_1))/binary,
                                   V1_guild_zone_1:16/little,
                                   (protocol:pack(string,
                                                  V1_guild_name_1))/binary,
                                   V1_r_id_1:32/little,
                                   (protocol:pack(string, V1_r_plat_1))/binary,
                                   V1_r_zone_1:16/little,
                                   (protocol:pack(string,
                                                  V1_role_name_1))/binary,
                                   V1_role_order_1:8/little,
                                   V1_role_lev_1:16/little,
                                   V1_guild_rid_2:32/little,
                                   (protocol:pack(string,
                                                  V1_guild_plat_2))/binary,
                                   V1_guild_zone_2:16/little,
                                   (protocol:pack(string,
                                                  V1_guild_name_2))/binary,
                                   V1_r_id_2:32/little,
                                   (protocol:pack(string, V1_r_plat_2))/binary,
                                   V1_r_zone_2:16/little,
                                   (protocol:pack(string,
                                                  V1_role_name_2))/binary,
                                   V1_role_order_2:8/little,
                                   V1_role_lev_2:16/little,
                                   V1_replay_id:32/little,
                                   (protocol:pack(string,
                                                  V1_replay_plat))/binary,
                                   V1_replay_zone:16/little>>
                                 || #guild_siege_match_combat_log{time =
                                                                      V1_time,
                                                                  star =
                                                                      V1_star,
                                                                  is_win =
                                                                      V1_is_win,
                                                                  guild_id_1 =
                                                                      {V1_guild_rid_1,
                                                                       V1_guild_plat_1,
                                                                       V1_guild_zone_1},
                                                                  guild_name_1 =
                                                                      V1_guild_name_1,
                                                                  role_id_1 =
                                                                      {V1_r_id_1,
                                                                       V1_r_plat_1,
                                                                       V1_r_zone_1},
                                                                  role_name_1 =
                                                                      V1_role_name_1,
                                                                  role_order_1 =
                                                                      V1_role_order_1,
                                                                  role_lev_1 =
                                                                      V1_role_lev_1,
                                                                  guild_id_2 =
                                                                      {V1_guild_rid_2,
                                                                       V1_guild_plat_2,
                                                                       V1_guild_zone_2},
                                                                  guild_name_2 =
                                                                      V1_guild_name_2,
                                                                  role_id_2 =
                                                                      {V1_r_id_2,
                                                                       V1_r_plat_2,
                                                                       V1_r_zone_2},
                                                                  role_name_2 =
                                                                      V1_role_name_2,
                                                                  role_order_2 =
                                                                      V1_role_order_2,
                                                                  role_lev_2 =
                                                                      V1_role_lev_2,
                                                                  combat_replay_id
                                                                      =
                                                                      {V1_replay_id,
                                                                       V1_replay_plat,
                                                                       V1_replay_zone}}
                                        <- V0_castle_log]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19102:16/little,
       D_a_t_a/binary>>};
pack(cli, 19103, {V0_order, V0_star}) ->
    D_a_t_a = <<V0_order:8/little, V0_star:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19103:16/little,
       D_a_t_a/binary>>};
pack(srv, 19103, {V0_flag, V0_reason}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_reason))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19103:16/little,
       D_a_t_a/binary>>};
pack(cli, 19104,
     {V0_formation,
      V0_guard_id_1,
      V0_guard_id_2,
      V0_guard_id_3,
      V0_guard_id_4}) ->
    D_a_t_a = <<V0_formation:8/little,
                V0_guard_id_1:32/little, V0_guard_id_2:32/little,
                V0_guard_id_3:32/little, V0_guard_id_4:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19104:16/little,
       D_a_t_a/binary>>};
pack(srv, 19104,
     {V0_flag,
      V0_msg,
      V0_formation,
      V0_formation_lev,
      V0_guards}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_formation:8/little, V0_formation_lev:8/little,
                (length(V0_guards)):16/little,
                (list_to_binary([<<V1_guard_id:32/little,
                                   V1_war_id:8/little>>
                                 || {V1_guard_id, V1_war_id}
                                        <- V0_guards]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19104:16/little,
       D_a_t_a/binary>>};
pack(cli, 19105, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19105:16/little,
       D_a_t_a/binary>>};
pack(srv, 19105, {V0_flag, V0_castle_log}) ->
    D_a_t_a = <<V0_flag:8/little,
                (length(V0_castle_log)):16/little,
                (list_to_binary([<<V1_time:32/little, V1_star:8/little,
                                   V1_is_win:8/little, V1_guild_rid_1:32/little,
                                   (protocol:pack(string,
                                                  V1_guild_plat_1))/binary,
                                   V1_guild_zone_1:16/little,
                                   (protocol:pack(string,
                                                  V1_guild_name_1))/binary,
                                   V1_r_id_1:32/little,
                                   (protocol:pack(string, V1_r_plat_1))/binary,
                                   V1_r_zone_1:16/little,
                                   (protocol:pack(string,
                                                  V1_role_name_1))/binary,
                                   V1_role_order_1:8/little,
                                   V1_role_lev_1:16/little,
                                   V1_guild_rid_2:32/little,
                                   (protocol:pack(string,
                                                  V1_guild_plat_2))/binary,
                                   V1_guild_zone_2:16/little,
                                   (protocol:pack(string,
                                                  V1_guild_name_2))/binary,
                                   V1_r_id_2:32/little,
                                   (protocol:pack(string, V1_r_plat_2))/binary,
                                   V1_r_zone_2:16/little,
                                   (protocol:pack(string,
                                                  V1_role_name_2))/binary,
                                   V1_role_order_2:8/little,
                                   V1_role_lev_2:16/little,
                                   V1_replay_id:32/little,
                                   (protocol:pack(string,
                                                  V1_replay_plat))/binary,
                                   V1_replay_zone:16/little>>
                                 || #guild_siege_match_combat_log{time =
                                                                      V1_time,
                                                                  star =
                                                                      V1_star,
                                                                  is_win =
                                                                      V1_is_win,
                                                                  guild_id_1 =
                                                                      {V1_guild_rid_1,
                                                                       V1_guild_plat_1,
                                                                       V1_guild_zone_1},
                                                                  guild_name_1 =
                                                                      V1_guild_name_1,
                                                                  role_id_1 =
                                                                      {V1_r_id_1,
                                                                       V1_r_plat_1,
                                                                       V1_r_zone_1},
                                                                  role_name_1 =
                                                                      V1_role_name_1,
                                                                  role_order_1 =
                                                                      V1_role_order_1,
                                                                  role_lev_1 =
                                                                      V1_role_lev_1,
                                                                  guild_id_2 =
                                                                      {V1_guild_rid_2,
                                                                       V1_guild_plat_2,
                                                                       V1_guild_zone_2},
                                                                  guild_name_2 =
                                                                      V1_guild_name_2,
                                                                  role_id_2 =
                                                                      {V1_r_id_2,
                                                                       V1_r_plat_2,
                                                                       V1_r_zone_2},
                                                                  role_name_2 =
                                                                      V1_role_name_2,
                                                                  role_order_2 =
                                                                      V1_role_order_2,
                                                                  role_lev_2 =
                                                                      V1_role_lev_2,
                                                                  combat_replay_id
                                                                      =
                                                                      {V1_replay_id,
                                                                       V1_replay_plat,
                                                                       V1_replay_zone}}
                                        <- V0_castle_log]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19105:16/little,
       D_a_t_a/binary>>};
pack(cli, 19106, {}) ->
    {ok, <<2:32/little, 19106:16/little>>};
pack(srv, 19106,
     {V0_flag,
      V0_formation,
      V0_formation_lev,
      V0_pet_base_id,
      V0_guards}) ->
    D_a_t_a = <<V0_flag:8/little, V0_formation:8/little,
                V0_formation_lev:8/little, V0_pet_base_id:32/little,
                (length(V0_guards)):16/little,
                (list_to_binary([<<V1_guard_id:32/little,
                                   V1_war_id:8/little>>
                                 || {V1_guard_id, V1_war_id}
                                        <- V0_guards]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19106:16/little,
       D_a_t_a/binary>>};
pack(cli, 19107, {V0_pet_id}) ->
    D_a_t_a = <<V0_pet_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19107:16/little,
       D_a_t_a/binary>>};
pack(srv, 19107, {V0_flag, V0_msg, V0_pet_base_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_pet_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19107:16/little,
       D_a_t_a/binary>>};
pack(cli, 19108, {}) ->
    {ok, <<2:32/little, 19108:16/little>>};
pack(srv, 19108,
     {V0_has_join,
      V0_flag,
      V0_msg,
      #guild_siege_role_log{atk_num = V0_atk_num,
                            atk_log = V0_atk_log}}) ->
    D_a_t_a = <<V0_has_join:8/little, V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_atk_num:8/little, (length(V0_atk_log)):16/little,
                (list_to_binary([<<V1_time:32/little, V1_star:8/little,
                                   V1_is_win:8/little, V1_guild_rid_1:32/little,
                                   (protocol:pack(string,
                                                  V1_guild_plat_1))/binary,
                                   V1_guild_zone_1:16/little,
                                   (protocol:pack(string,
                                                  V1_guild_name_1))/binary,
                                   V1_r_id_1:32/little,
                                   (protocol:pack(string, V1_r_plat_1))/binary,
                                   V1_r_zone_1:16/little,
                                   (protocol:pack(string,
                                                  V1_role_name_1))/binary,
                                   V1_role_order_1:8/little,
                                   V1_role_lev_1:16/little,
                                   V1_guild_rid_2:32/little,
                                   (protocol:pack(string,
                                                  V1_guild_plat_2))/binary,
                                   V1_guild_zone_2:16/little,
                                   (protocol:pack(string,
                                                  V1_guild_name_2))/binary,
                                   V1_r_id_2:32/little,
                                   (protocol:pack(string, V1_r_plat_2))/binary,
                                   V1_r_zone_2:16/little,
                                   (protocol:pack(string,
                                                  V1_role_name_2))/binary,
                                   V1_role_order_2:8/little,
                                   V1_role_lev_2:16/little,
                                   V1_replay_id:32/little,
                                   (protocol:pack(string,
                                                  V1_replay_plat))/binary,
                                   V1_replay_zone:16/little>>
                                 || #guild_siege_match_combat_log{time =
                                                                      V1_time,
                                                                  star =
                                                                      V1_star,
                                                                  is_win =
                                                                      V1_is_win,
                                                                  guild_id_1 =
                                                                      {V1_guild_rid_1,
                                                                       V1_guild_plat_1,
                                                                       V1_guild_zone_1},
                                                                  guild_name_1 =
                                                                      V1_guild_name_1,
                                                                  role_id_1 =
                                                                      {V1_r_id_1,
                                                                       V1_r_plat_1,
                                                                       V1_r_zone_1},
                                                                  role_name_1 =
                                                                      V1_role_name_1,
                                                                  role_order_1 =
                                                                      V1_role_order_1,
                                                                  role_lev_1 =
                                                                      V1_role_lev_1,
                                                                  guild_id_2 =
                                                                      {V1_guild_rid_2,
                                                                       V1_guild_plat_2,
                                                                       V1_guild_zone_2},
                                                                  guild_name_2 =
                                                                      V1_guild_name_2,
                                                                  role_id_2 =
                                                                      {V1_r_id_2,
                                                                       V1_r_plat_2,
                                                                       V1_r_zone_2},
                                                                  role_name_2 =
                                                                      V1_role_name_2,
                                                                  role_order_2 =
                                                                      V1_role_order_2,
                                                                  role_lev_2 =
                                                                      V1_role_lev_2,
                                                                  combat_replay_id
                                                                      =
                                                                      {V1_replay_id,
                                                                       V1_replay_plat,
                                                                       V1_replay_zone}}
                                        <- V0_atk_log]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19108:16/little,
       D_a_t_a/binary>>};
pack(cli, 19109, {}) ->
    {ok, <<2:32/little, 19109:16/little>>};
pack(srv, 19109,
     {V0_is_win, V0_order, V0_star, V0_name, V0_items}) ->
    D_a_t_a = <<V0_is_win:8/little, V0_order:8/little,
                V0_star:8/little,
                (protocol:pack(string, V0_name))/binary,
                (length(V0_items)):16/little,
                (list_to_binary([<<V1_item_id:32/little,
                                   V1_num:32/little>>
                                 || {V1_item_id, V1_num}
                                        <- V0_items]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19109:16/little,
       D_a_t_a/binary>>};
pack(cli, 19110, {}) ->
    {ok, <<2:32/little, 19110:16/little>>};
pack(srv, 19110, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19110:16/little,
       D_a_t_a/binary>>};
pack(cli, 19111,
     {V0_replay_id, V0_replay_plat, V0_replay_zone}) ->
    D_a_t_a = <<V0_replay_id:32/little,
                (protocol:pack(string, V0_replay_plat))/binary,
                V0_replay_zone:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19111:16/little,
       D_a_t_a/binary>>};
pack(srv, 19111, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19111:16/little,
       D_a_t_a/binary>>};
pack(cli, 19112, {V0_flag, V0_order}) ->
    D_a_t_a = <<V0_flag:8/little, V0_order:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19112:16/little,
       D_a_t_a/binary>>};
pack(srv, 19112, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19112:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 19100, _B0) -> {ok, {}};
unpack(cli, 19100, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_time, _B2} = protocol:uint32(_B1),
    {V1_round, _B3} = protocol:uint8(_B2),
    {ok, {V1_status, V1_time, V1_round}};
unpack(srv, 19101, _B0) -> {ok, {}};
unpack(cli, 19101, _B0) ->
    {V1_round, _B1} = protocol:uint8(_B0),
    {V1_match_id, _B2} = protocol:uint32(_B1),
    {V1_lev_group, _B3} = protocol:uint8(_B2),
    {V1_has_result, _B4} = protocol:uint8(_B3),
    {V1_win_guild_rid, _B5} = protocol:uint32(_B4),
    {V1_win_guild_plat, _B6} = protocol:string(_B5),
    {V1_win_guild_zone, _B7} = protocol:uint16(_B6),
    {V1_guild_match_list, _B54} = protocol:array(_B7,
                                                 fun (_B8) ->
                                                         {V2_guild_rid, _B9} =
                                                             protocol:uint32(_B8),
                                                         {V2_guild_plat, _B10} =
                                                             protocol:string(_B9),
                                                         {V2_guild_zone, _B11} =
                                                             protocol:uint16(_B10),
                                                         {V2_guild_name, _B12} =
                                                             protocol:string(_B11),
                                                         {V2_guild_lev, _B13} =
                                                             protocol:uint8(_B12),
                                                         {V2_win_star_3, _B14} =
                                                             protocol:uint16(_B13),
                                                         {V2_win_star_2, _B15} =
                                                             protocol:uint16(_B14),
                                                         {V2_win_star_1, _B16} =
                                                             protocol:uint16(_B15),
                                                         {V2_atk_times, _B17} =
                                                             protocol:uint16(_B16),
                                                         {V2_win_times, _B18} =
                                                             protocol:uint16(_B17),
                                                         {V2_castle_num, _B19} =
                                                             protocol:uint16(_B18),
                                                         {V2_score, _B20} =
                                                             protocol:uint16(_B19),
                                                         {V2_atk_rid, _B21} =
                                                             protocol:uint32(_B20),
                                                         {V2_atk_plat, _B22} =
                                                             protocol:string(_B21),
                                                         {V2_atk_zone, _B23} =
                                                             protocol:uint16(_B22),
                                                         {V2_a_replay_id,
                                                          _B24} =
                                                             protocol:uint32(_B23),
                                                         {V2_a_replay_plat,
                                                          _B25} =
                                                             protocol:string(_B24),
                                                         {V2_a_replay_zone,
                                                          _B26} =
                                                             protocol:uint16(_B25),
                                                         {V2_best_atk_name,
                                                          _B27} =
                                                             protocol:string(_B26),
                                                         {V2_def_rid, _B28} =
                                                             protocol:uint32(_B27),
                                                         {V2_def_plat, _B29} =
                                                             protocol:string(_B28),
                                                         {V2_def_zone, _B30} =
                                                             protocol:uint16(_B29),
                                                         {V2_d_replay_id,
                                                          _B31} =
                                                             protocol:uint32(_B30),
                                                         {V2_d_replay_plat,
                                                          _B32} =
                                                             protocol:string(_B31),
                                                         {V2_d_replay_zone,
                                                          _B33} =
                                                             protocol:uint16(_B32),
                                                         {V2_best_def_name,
                                                          _B34} =
                                                             protocol:string(_B33),
                                                         {V2_castle_list,
                                                          _B52} =
                                                             protocol:array(_B34,
                                                                            fun
                                                                                (_B35) ->
                                                                                    {V3_r_id,
                                                                                     _B36} =
                                                                                        protocol:uint32(_B35),
                                                                                    {V3_r_plat,
                                                                                     _B37} =
                                                                                        protocol:string(_B36),
                                                                                    {V3_r_zone,
                                                                                     _B38} =
                                                                                        protocol:uint16(_B37),
                                                                                    {V3_order,
                                                                                     _B39} =
                                                                                        protocol:uint8(_B38),
                                                                                    {V3_name,
                                                                                     _B40} =
                                                                                        protocol:string(_B39),
                                                                                    {V3_lev,
                                                                                     _B41} =
                                                                                        protocol:uint8(_B40),
                                                                                    {V3_classes,
                                                                                     _B42} =
                                                                                        protocol:uint8(_B41),
                                                                                    {V3_sex,
                                                                                     _B43} =
                                                                                        protocol:uint8(_B42),
                                                                                    {V3_lev_break_times,
                                                                                     _B44} =
                                                                                        protocol:uint8(_B43),
                                                                                    {V3_loss_star,
                                                                                     _B45} =
                                                                                        protocol:uint8(_B44),
                                                                                    {V3_def_times,
                                                                                     _B46} =
                                                                                        protocol:uint16(_B45),
                                                                                    {V3_def_win_times,
                                                                                     _B47} =
                                                                                        protocol:uint16(_B46),
                                                                                    {V3_atk_times,
                                                                                     _B48} =
                                                                                        protocol:uint8(_B47),
                                                                                    {V3_atk_win_times,
                                                                                     _B49} =
                                                                                        protocol:uint8(_B48),
                                                                                    {V3_is_combat,
                                                                                     _B50} =
                                                                                        protocol:uint8(_B49),
                                                                                    {{V3_r_id,
                                                                                      V3_r_plat,
                                                                                      V3_r_zone,
                                                                                      V3_order,
                                                                                      V3_name,
                                                                                      V3_lev,
                                                                                      V3_classes,
                                                                                      V3_sex,
                                                                                      V3_lev_break_times,
                                                                                      V3_loss_star,
                                                                                      V3_def_times,
                                                                                      V3_def_win_times,
                                                                                      V3_atk_times,
                                                                                      V3_atk_win_times,
                                                                                      V3_is_combat},
                                                                                     _B50}
                                                                            end),
                                                         {{V2_guild_rid,
                                                           V2_guild_plat,
                                                           V2_guild_zone,
                                                           V2_guild_name,
                                                           V2_guild_lev,
                                                           V2_win_star_3,
                                                           V2_win_star_2,
                                                           V2_win_star_1,
                                                           V2_atk_times,
                                                           V2_win_times,
                                                           V2_castle_num,
                                                           V2_score,
                                                           V2_atk_rid,
                                                           V2_atk_plat,
                                                           V2_atk_zone,
                                                           V2_a_replay_id,
                                                           V2_a_replay_plat,
                                                           V2_a_replay_zone,
                                                           V2_best_atk_name,
                                                           V2_def_rid,
                                                           V2_def_plat,
                                                           V2_def_zone,
                                                           V2_d_replay_id,
                                                           V2_d_replay_plat,
                                                           V2_d_replay_zone,
                                                           V2_best_def_name,
                                                           V2_castle_list},
                                                          _B52}
                                                 end),
    {ok,
     {V1_round,
      V1_match_id,
      V1_lev_group,
      V1_has_result,
      V1_win_guild_rid,
      V1_win_guild_plat,
      V1_win_guild_zone,
      V1_guild_match_list}};
unpack(srv, 19102, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_order, _B2} = protocol:uint8(_B1),
    {ok, {V1_flag, V1_order}};
unpack(cli, 19102, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_r_id, _B2} = protocol:uint32(_B1),
    {V1_r_plat, _B3} = protocol:string(_B2),
    {V1_r_zone, _B4} = protocol:uint16(_B3),
    {V1_order, _B5} = protocol:uint8(_B4),
    {V1_name, _B6} = protocol:string(_B5),
    {V1_lev, _B7} = protocol:uint8(_B6),
    {V1_classes, _B8} = protocol:uint8(_B7),
    {V1_sex, _B9} = protocol:uint8(_B8),
    {V1_lev_break_times, _B10} = protocol:uint8(_B9),
    {V1_loss_star, _B11} = protocol:uint8(_B10),
    {V1_def_times, _B12} = protocol:uint16(_B11),
    {V1_def_win_times, _B13} = protocol:uint16(_B12),
    {V1_atk_times, _B14} = protocol:uint8(_B13),
    {V1_atk_win_times, _B15} = protocol:uint8(_B14),
    {V1_can_look, _B16} = protocol:uint8(_B15),
    {V1_formation, _B17} = protocol:uint8(_B16),
    {V1_formation_lev, _B18} = protocol:uint8(_B17),
    {V1_guards, _B23} = protocol:array(_B18,
                                       fun (_B19) ->
                                               {V2_guard_id, _B20} =
                                                   protocol:uint32(_B19),
                                               {V2_war_id, _B21} =
                                                   protocol:uint8(_B20),
                                               {{V2_guard_id, V2_war_id}, _B21}
                                       end),
    {V1_is_combat, _B24} = protocol:uint8(_B23),
    {V1_castle_log, _B53} = protocol:array(_B24,
                                           fun (_B25) ->
                                                   {V2_time, _B26} =
                                                       protocol:uint32(_B25),
                                                   {V2_star, _B27} =
                                                       protocol:uint8(_B26),
                                                   {V2_is_win, _B28} =
                                                       protocol:uint8(_B27),
                                                   {V2_guild_rid_1, _B29} =
                                                       protocol:uint32(_B28),
                                                   {V2_guild_plat_1, _B30} =
                                                       protocol:string(_B29),
                                                   {V2_guild_zone_1, _B31} =
                                                       protocol:uint16(_B30),
                                                   {V2_guild_name_1, _B32} =
                                                       protocol:string(_B31),
                                                   {V2_r_id_1, _B33} =
                                                       protocol:uint32(_B32),
                                                   {V2_r_plat_1, _B34} =
                                                       protocol:string(_B33),
                                                   {V2_r_zone_1, _B35} =
                                                       protocol:uint16(_B34),
                                                   {V2_role_name_1, _B36} =
                                                       protocol:string(_B35),
                                                   {V2_role_order_1, _B37} =
                                                       protocol:uint8(_B36),
                                                   {V2_role_lev_1, _B38} =
                                                       protocol:uint16(_B37),
                                                   {V2_guild_rid_2, _B39} =
                                                       protocol:uint32(_B38),
                                                   {V2_guild_plat_2, _B40} =
                                                       protocol:string(_B39),
                                                   {V2_guild_zone_2, _B41} =
                                                       protocol:uint16(_B40),
                                                   {V2_guild_name_2, _B42} =
                                                       protocol:string(_B41),
                                                   {V2_r_id_2, _B43} =
                                                       protocol:uint32(_B42),
                                                   {V2_r_plat_2, _B44} =
                                                       protocol:string(_B43),
                                                   {V2_r_zone_2, _B45} =
                                                       protocol:uint16(_B44),
                                                   {V2_role_name_2, _B46} =
                                                       protocol:string(_B45),
                                                   {V2_role_order_2, _B47} =
                                                       protocol:uint8(_B46),
                                                   {V2_role_lev_2, _B48} =
                                                       protocol:uint16(_B47),
                                                   {V2_replay_id, _B49} =
                                                       protocol:uint32(_B48),
                                                   {V2_replay_plat, _B50} =
                                                       protocol:string(_B49),
                                                   {V2_replay_zone, _B51} =
                                                       protocol:uint16(_B50),
                                                   {{V2_time,
                                                     V2_star,
                                                     V2_is_win,
                                                     V2_guild_rid_1,
                                                     V2_guild_plat_1,
                                                     V2_guild_zone_1,
                                                     V2_guild_name_1,
                                                     V2_r_id_1,
                                                     V2_r_plat_1,
                                                     V2_r_zone_1,
                                                     V2_role_name_1,
                                                     V2_role_order_1,
                                                     V2_role_lev_1,
                                                     V2_guild_rid_2,
                                                     V2_guild_plat_2,
                                                     V2_guild_zone_2,
                                                     V2_guild_name_2,
                                                     V2_r_id_2,
                                                     V2_r_plat_2,
                                                     V2_r_zone_2,
                                                     V2_role_name_2,
                                                     V2_role_order_2,
                                                     V2_role_lev_2,
                                                     V2_replay_id,
                                                     V2_replay_plat,
                                                     V2_replay_zone},
                                                    _B51}
                                           end),
    {ok,
     {V1_flag,
      V1_r_id,
      V1_r_plat,
      V1_r_zone,
      V1_order,
      V1_name,
      V1_lev,
      V1_classes,
      V1_sex,
      V1_lev_break_times,
      V1_loss_star,
      V1_def_times,
      V1_def_win_times,
      V1_atk_times,
      V1_atk_win_times,
      V1_can_look,
      V1_formation,
      V1_formation_lev,
      V1_guards,
      V1_is_combat,
      V1_castle_log}};
unpack(srv, 19103, _B0) ->
    {V1_order, _B1} = protocol:uint8(_B0),
    {V1_star, _B2} = protocol:uint8(_B1),
    {ok, {V1_order, V1_star}};
unpack(cli, 19103, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_reason, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_reason}};
unpack(srv, 19104, _B0) ->
    {V1_formation, _B1} = protocol:uint8(_B0),
    {V1_guard_id_1, _B2} = protocol:uint32(_B1),
    {V1_guard_id_2, _B3} = protocol:uint32(_B2),
    {V1_guard_id_3, _B4} = protocol:uint32(_B3),
    {V1_guard_id_4, _B5} = protocol:uint32(_B4),
    {ok,
     {V1_formation,
      V1_guard_id_1,
      V1_guard_id_2,
      V1_guard_id_3,
      V1_guard_id_4}};
unpack(cli, 19104, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_formation, _B3} = protocol:uint8(_B2),
    {V1_formation_lev, _B4} = protocol:uint8(_B3),
    {V1_guards, _B9} = protocol:array(_B4,
                                      fun (_B5) ->
                                              {V2_guard_id, _B6} =
                                                  protocol:uint32(_B5),
                                              {V2_war_id, _B7} =
                                                  protocol:uint8(_B6),
                                              {{V2_guard_id, V2_war_id}, _B7}
                                      end),
    {ok,
     {V1_flag,
      V1_msg,
      V1_formation,
      V1_formation_lev,
      V1_guards}};
unpack(srv, 19105, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(cli, 19105, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_castle_log, _B30} = protocol:array(_B1,
                                           fun (_B2) ->
                                                   {V2_time, _B3} =
                                                       protocol:uint32(_B2),
                                                   {V2_star, _B4} =
                                                       protocol:uint8(_B3),
                                                   {V2_is_win, _B5} =
                                                       protocol:uint8(_B4),
                                                   {V2_guild_rid_1, _B6} =
                                                       protocol:uint32(_B5),
                                                   {V2_guild_plat_1, _B7} =
                                                       protocol:string(_B6),
                                                   {V2_guild_zone_1, _B8} =
                                                       protocol:uint16(_B7),
                                                   {V2_guild_name_1, _B9} =
                                                       protocol:string(_B8),
                                                   {V2_r_id_1, _B10} =
                                                       protocol:uint32(_B9),
                                                   {V2_r_plat_1, _B11} =
                                                       protocol:string(_B10),
                                                   {V2_r_zone_1, _B12} =
                                                       protocol:uint16(_B11),
                                                   {V2_role_name_1, _B13} =
                                                       protocol:string(_B12),
                                                   {V2_role_order_1, _B14} =
                                                       protocol:uint8(_B13),
                                                   {V2_role_lev_1, _B15} =
                                                       protocol:uint16(_B14),
                                                   {V2_guild_rid_2, _B16} =
                                                       protocol:uint32(_B15),
                                                   {V2_guild_plat_2, _B17} =
                                                       protocol:string(_B16),
                                                   {V2_guild_zone_2, _B18} =
                                                       protocol:uint16(_B17),
                                                   {V2_guild_name_2, _B19} =
                                                       protocol:string(_B18),
                                                   {V2_r_id_2, _B20} =
                                                       protocol:uint32(_B19),
                                                   {V2_r_plat_2, _B21} =
                                                       protocol:string(_B20),
                                                   {V2_r_zone_2, _B22} =
                                                       protocol:uint16(_B21),
                                                   {V2_role_name_2, _B23} =
                                                       protocol:string(_B22),
                                                   {V2_role_order_2, _B24} =
                                                       protocol:uint8(_B23),
                                                   {V2_role_lev_2, _B25} =
                                                       protocol:uint16(_B24),
                                                   {V2_replay_id, _B26} =
                                                       protocol:uint32(_B25),
                                                   {V2_replay_plat, _B27} =
                                                       protocol:string(_B26),
                                                   {V2_replay_zone, _B28} =
                                                       protocol:uint16(_B27),
                                                   {{V2_time,
                                                     V2_star,
                                                     V2_is_win,
                                                     V2_guild_rid_1,
                                                     V2_guild_plat_1,
                                                     V2_guild_zone_1,
                                                     V2_guild_name_1,
                                                     V2_r_id_1,
                                                     V2_r_plat_1,
                                                     V2_r_zone_1,
                                                     V2_role_name_1,
                                                     V2_role_order_1,
                                                     V2_role_lev_1,
                                                     V2_guild_rid_2,
                                                     V2_guild_plat_2,
                                                     V2_guild_zone_2,
                                                     V2_guild_name_2,
                                                     V2_r_id_2,
                                                     V2_r_plat_2,
                                                     V2_r_zone_2,
                                                     V2_role_name_2,
                                                     V2_role_order_2,
                                                     V2_role_lev_2,
                                                     V2_replay_id,
                                                     V2_replay_plat,
                                                     V2_replay_zone},
                                                    _B28}
                                           end),
    {ok, {V1_flag, V1_castle_log}};
unpack(srv, 19106, _B0) -> {ok, {}};
unpack(cli, 19106, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_formation, _B2} = protocol:uint8(_B1),
    {V1_formation_lev, _B3} = protocol:uint8(_B2),
    {V1_pet_base_id, _B4} = protocol:uint32(_B3),
    {V1_guards, _B9} = protocol:array(_B4,
                                      fun (_B5) ->
                                              {V2_guard_id, _B6} =
                                                  protocol:uint32(_B5),
                                              {V2_war_id, _B7} =
                                                  protocol:uint8(_B6),
                                              {{V2_guard_id, V2_war_id}, _B7}
                                      end),
    {ok,
     {V1_flag,
      V1_formation,
      V1_formation_lev,
      V1_pet_base_id,
      V1_guards}};
unpack(srv, 19107, _B0) ->
    {V1_pet_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_pet_id}};
unpack(cli, 19107, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_pet_base_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_pet_base_id}};
unpack(srv, 19108, _B0) -> {ok, {}};
unpack(cli, 19108, _B0) ->
    {V1_has_join, _B1} = protocol:uint8(_B0),
    {V1_flag, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {V1_atk_num, _B4} = protocol:uint8(_B3),
    {V1_atk_log, _B33} = protocol:array(_B4,
                                        fun (_B5) ->
                                                {V2_time, _B6} =
                                                    protocol:uint32(_B5),
                                                {V2_star, _B7} =
                                                    protocol:uint8(_B6),
                                                {V2_is_win, _B8} =
                                                    protocol:uint8(_B7),
                                                {V2_guild_rid_1, _B9} =
                                                    protocol:uint32(_B8),
                                                {V2_guild_plat_1, _B10} =
                                                    protocol:string(_B9),
                                                {V2_guild_zone_1, _B11} =
                                                    protocol:uint16(_B10),
                                                {V2_guild_name_1, _B12} =
                                                    protocol:string(_B11),
                                                {V2_r_id_1, _B13} =
                                                    protocol:uint32(_B12),
                                                {V2_r_plat_1, _B14} =
                                                    protocol:string(_B13),
                                                {V2_r_zone_1, _B15} =
                                                    protocol:uint16(_B14),
                                                {V2_role_name_1, _B16} =
                                                    protocol:string(_B15),
                                                {V2_role_order_1, _B17} =
                                                    protocol:uint8(_B16),
                                                {V2_role_lev_1, _B18} =
                                                    protocol:uint16(_B17),
                                                {V2_guild_rid_2, _B19} =
                                                    protocol:uint32(_B18),
                                                {V2_guild_plat_2, _B20} =
                                                    protocol:string(_B19),
                                                {V2_guild_zone_2, _B21} =
                                                    protocol:uint16(_B20),
                                                {V2_guild_name_2, _B22} =
                                                    protocol:string(_B21),
                                                {V2_r_id_2, _B23} =
                                                    protocol:uint32(_B22),
                                                {V2_r_plat_2, _B24} =
                                                    protocol:string(_B23),
                                                {V2_r_zone_2, _B25} =
                                                    protocol:uint16(_B24),
                                                {V2_role_name_2, _B26} =
                                                    protocol:string(_B25),
                                                {V2_role_order_2, _B27} =
                                                    protocol:uint8(_B26),
                                                {V2_role_lev_2, _B28} =
                                                    protocol:uint16(_B27),
                                                {V2_replay_id, _B29} =
                                                    protocol:uint32(_B28),
                                                {V2_replay_plat, _B30} =
                                                    protocol:string(_B29),
                                                {V2_replay_zone, _B31} =
                                                    protocol:uint16(_B30),
                                                {{V2_time,
                                                  V2_star,
                                                  V2_is_win,
                                                  V2_guild_rid_1,
                                                  V2_guild_plat_1,
                                                  V2_guild_zone_1,
                                                  V2_guild_name_1,
                                                  V2_r_id_1,
                                                  V2_r_plat_1,
                                                  V2_r_zone_1,
                                                  V2_role_name_1,
                                                  V2_role_order_1,
                                                  V2_role_lev_1,
                                                  V2_guild_rid_2,
                                                  V2_guild_plat_2,
                                                  V2_guild_zone_2,
                                                  V2_guild_name_2,
                                                  V2_r_id_2,
                                                  V2_r_plat_2,
                                                  V2_r_zone_2,
                                                  V2_role_name_2,
                                                  V2_role_order_2,
                                                  V2_role_lev_2,
                                                  V2_replay_id,
                                                  V2_replay_plat,
                                                  V2_replay_zone},
                                                 _B31}
                                        end),
    {ok,
     {V1_has_join, V1_flag, V1_msg, V1_atk_num, V1_atk_log}};
unpack(srv, 19109, _B0) -> {ok, {}};
unpack(cli, 19109, _B0) ->
    {V1_is_win, _B1} = protocol:uint8(_B0),
    {V1_order, _B2} = protocol:uint8(_B1),
    {V1_star, _B3} = protocol:uint8(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_items, _B9} = protocol:array(_B4,
                                     fun (_B5) ->
                                             {V2_item_id, _B6} =
                                                 protocol:uint32(_B5),
                                             {V2_num, _B7} =
                                                 protocol:uint32(_B6),
                                             {{V2_item_id, V2_num}, _B7}
                                     end),
    {ok, {V1_is_win, V1_order, V1_star, V1_name, V1_items}};
unpack(srv, 19110, _B0) -> {ok, {}};
unpack(cli, 19110, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(srv, 19111, _B0) ->
    {V1_replay_id, _B1} = protocol:uint32(_B0),
    {V1_replay_plat, _B2} = protocol:string(_B1),
    {V1_replay_zone, _B3} = protocol:uint16(_B2),
    {ok, {V1_replay_id, V1_replay_plat, V1_replay_zone}};
unpack(cli, 19111, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 19112, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_order, _B2} = protocol:uint8(_B1),
    {ok, {V1_flag, V1_order}};
unpack(cli, 19112, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

