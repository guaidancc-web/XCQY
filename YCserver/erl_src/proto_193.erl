-file("src/proto/proto_193.erl", 1).

-module(proto_193).

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

-file("src/proto/proto_193.erl", 14).

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

-file("src/proto/proto_193.erl", 15).

-file("inc/rencounter.hrl", 1).

-record(m_rencounter, {ver = 1}).

-record(rencounter_role,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         classes = 0,
         lev = 0,
         sex = 0,
         break_times = 0,
         fc = 0,
         looks = [] :: list(),
         rank_lev = 1,
         star = 0,
         total_star = 0,
         join_times = 0,
         max_joins = 4 * 2,
         has_get_rank = 1,
         last_matched = 0,
         best_rank = 0,
         best_star = 0,
         best_total_star = 0,
         update_best_star_time = 0,
         win_lasted_times = 0,
         last_result = 0,
         season_join_times = 0,
         season_win_times = 0,
         season_lasted_win = 0,
         total_join_times = 0,
         total_win_times = 0,
         best_laster_win = 0,
         last_join_times = 0,
         last_win_times = 0,
         last_lasted_win = 0}).

-record(rencounter_match_role,
        {ver = 1,
         id = {0, "", 0},
         pid = undefined :: pid(),
         name = "",
         classes = 0,
         lev = 0,
         sex = 0,
         break_times = 0,
         fc = 0,
         looks = [] :: list(),
         rank_lev = 1,
         star = 0,
         win_lasted_times = 0,
         mode = 1,
         trail_times = 0,
         last_matched = 0,
         match_id = 0,
         retrys = 0}).

-record(rencounter_match,
        {id = 0 :: non_neg_integer(),
         mode = 1,
         match_roles = [] :: list(),
         time = 0 :: non_neg_integer(),
         combat_pid :: undefined | pid(),
         calc_args = [] :: list()}).

-file("src/proto/proto_193.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 19300, {}) ->
    {ok, <<2:32/little, 19300:16/little>>};
pack(srv, 19300,
     {#rencounter_role{rank_lev = V0_rank_lev,
                       star = V0_star, win_lasted_times = V0_win_lasted_times,
                       season_join_times = V0_season_join_times,
                       season_win_times = V0_season_win_times,
                       season_lasted_win = V0_season_lasted_win,
                       last_join_times = V0_last_join_times,
                       last_win_times = V0_last_win_times,
                       last_lasted_win = V0_last_lasted_win,
                       best_rank = V0_best_rank, join_times = V0_join_times,
                       max_joins = V0_max_joins,
                       has_get_rank = V0_has_get_rank},
      V0_rank}) ->
    D_a_t_a = <<V0_rank_lev:8/little, V0_star:16/little,
                V0_win_lasted_times:8/little,
                V0_season_join_times:32/little,
                V0_season_win_times:32/little,
                V0_season_lasted_win:32/little,
                V0_last_join_times:32/little,
                V0_last_win_times:32/little,
                V0_last_lasted_win:32/little, V0_best_rank:8/little,
                V0_join_times:8/little, V0_max_joins:8/little,
                V0_has_get_rank:8/little, V0_rank:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19300:16/little,
       D_a_t_a/binary>>};
pack(cli, 19301, {}) ->
    {ok, <<2:32/little, 19301:16/little>>};
pack(srv, 19301,
     {V0_err_code, V0_msg, V0_rencounter_match_role}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary,
                (length(V0_rencounter_match_role)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_plat))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:32/little, V1_classes:8/little,
                                   V1_sex:8/little, V1_break_times:8/little,
                                   V1_fc:32/little,
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
                                                           <- V1_looks]))/binary,
                                   V1_rank_lev:8/little, V1_star:16/little>>
                                 || #rencounter_match_role{id =
                                                               {V1_rid,
                                                                V1_plat,
                                                                V1_zone_id},
                                                           name = V1_name,
                                                           lev = V1_lev,
                                                           classes = V1_classes,
                                                           sex = V1_sex,
                                                           break_times =
                                                               V1_break_times,
                                                           fc = V1_fc,
                                                           looks = V1_looks,
                                                           rank_lev =
                                                               V1_rank_lev,
                                                           star = V1_star}
                                        <- V0_rencounter_match_role]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19301:16/little,
       D_a_t_a/binary>>};
pack(cli, 19302, {}) ->
    {ok, <<2:32/little, 19302:16/little>>};
pack(srv, 19302, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19302:16/little,
       D_a_t_a/binary>>};
pack(cli, 19303, {V0_type, V0_group_id}) ->
    D_a_t_a = <<V0_type:8/little, V0_group_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19303:16/little,
       D_a_t_a/binary>>};
pack(srv, 19303, {V0_type, V0_rencounter_role}) ->
    D_a_t_a = <<V0_type:8/little,
                (length(V0_rencounter_role)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_plat))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:32/little, V1_classes:8/little,
                                   V1_sex:8/little, V1_break_times:8/little,
                                   V1_fc:32/little, V1_rank_lev:8/little,
                                   V1_star:16/little>>
                                 || #rencounter_role{id =
                                                         {V1_rid,
                                                          V1_plat,
                                                          V1_zone_id},
                                                     name = V1_name,
                                                     lev = V1_lev,
                                                     classes = V1_classes,
                                                     sex = V1_sex,
                                                     break_times =
                                                         V1_break_times,
                                                     fc = V1_fc,
                                                     rank_lev = V1_rank_lev,
                                                     star = V1_star}
                                        <- V0_rencounter_role]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19303:16/little,
       D_a_t_a/binary>>};
pack(cli, 19304, {}) ->
    {ok, <<2:32/little, 19304:16/little>>};
pack(srv, 19304, {V0_rencounter_role}) ->
    D_a_t_a = <<(length(V0_rencounter_role)):16/little,
                (list_to_binary([<<V1_l_rid:32/little,
                                   (protocol:pack(string, V1_l_plat))/binary,
                                   V1_l_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:32/little, V1_classes:8/little,
                                   V1_sex:8/little, V1_break_times:8/little,
                                   V1_fc:32/little, V1_rank_lev:8/little,
                                   V1_star:16/little,
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
                                                           <- V1_looks]))/binary,
                                   V1_season_join_times:32/little,
                                   V1_season_win_times:32/little>>
                                 || #rencounter_role{id =
                                                         {V1_l_rid,
                                                          V1_l_plat,
                                                          V1_l_zone_id},
                                                     name = V1_name,
                                                     lev = V1_lev,
                                                     classes = V1_classes,
                                                     sex = V1_sex,
                                                     break_times =
                                                         V1_break_times,
                                                     fc = V1_fc,
                                                     rank_lev = V1_rank_lev,
                                                     star = V1_star,
                                                     looks = V1_looks,
                                                     season_join_times =
                                                         V1_season_join_times,
                                                     season_win_times =
                                                         V1_season_win_times}
                                        <- V0_rencounter_role]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19304:16/little,
       D_a_t_a/binary>>};
pack(cli, 19305, {}) ->
    {ok, <<2:32/little, 19305:16/little>>};
pack(srv, 19305,
     {#rencounter_match_role{id =
                                 {V0_rid, V0_plat, V0_zone_id},
                             name = V0_name, lev = V0_lev, classes = V0_classes,
                             sex = V0_sex, break_times = V0_break_times,
                             fc = V0_fc, rank_lev = V0_rank_lev, star = V0_star,
                             looks = V0_looks}}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_plat))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_name))/binary,
                V0_lev:32/little, V0_classes:8/little, V0_sex:8/little,
                V0_break_times:8/little, V0_fc:32/little,
                V0_rank_lev:8/little, V0_star:16/little,
                (length(V0_looks)):16/little,
                (list_to_binary([<<V1_looks_type:32/little,
                                   V1_looks_mode:32/little,
                                   V1_looks_val:32/little,
                                   (protocol:pack(string,
                                                  V1_looks_str))/binary>>
                                 || {V1_looks_type,
                                     V1_looks_mode,
                                     V1_looks_val,
                                     V1_looks_str}
                                        <- V0_looks]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19305:16/little,
       D_a_t_a/binary>>};
pack(cli, 19306, {}) ->
    {ok, <<2:32/little, 19306:16/little>>};
pack(srv, 19306,
     {V0_result,
      {V0_t_id, V0_t_platform, V0_t_zone},
      V0_t_name,
      V0_t_classes,
      V0_t_sex,
      V0_t_lev,
      V0_t_rank_lev,
      V0_t_star,
      V0_s_rank_lev,
      V0_s_star,
      V0_s_rank_lev_change,
      V0_s_star_change,
      V0_s_statistics,
      V0_t_statistics}) ->
    D_a_t_a = <<V0_result:8/little, V0_t_id:32/little,
                (protocol:pack(string, V0_t_platform))/binary,
                V0_t_zone:16/little,
                (protocol:pack(string, V0_t_name))/binary,
                V0_t_classes:8/little, V0_t_sex:8/little,
                V0_t_lev:16/little, V0_t_rank_lev:8/little,
                V0_t_star:16/little, V0_s_rank_lev:16/little,
                V0_s_star:8/signed-little,
                V0_s_rank_lev_change:16/little,
                V0_s_star_change:8/signed-little,
                (length(V0_s_statistics)):16/little,
                (list_to_binary([<<V1_type_1:8/little,
                                   V1_base_id_1:32/little, V1_dmg_1:32/little,
                                   V1_heal_1:32/little>>
                                 || {V1_type_1,
                                     V1_base_id_1,
                                     V1_dmg_1,
                                     V1_heal_1}
                                        <- V0_s_statistics]))/binary,
                (length(V0_t_statistics)):16/little,
                (list_to_binary([<<V1_type_2:8/little,
                                   V1_base_id_2:32/little, V1_dmg_2:32/little,
                                   V1_heal_2:32/little>>
                                 || {V1_type_2,
                                     V1_base_id_2,
                                     V1_dmg_2,
                                     V1_heal_2}
                                        <- V0_t_statistics]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19306:16/little,
       D_a_t_a/binary>>};
pack(cli, 19307, {V0_rank_lev}) ->
    D_a_t_a = <<V0_rank_lev:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19307:16/little,
       D_a_t_a/binary>>};
pack(srv, 19307, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19307:16/little,
       D_a_t_a/binary>>};
pack(cli, 19308, {}) ->
    {ok, <<2:32/little, 19308:16/little>>};
pack(srv, 19308, {V0_status, V0_end_time}) ->
    D_a_t_a = <<V0_status:8/little, V0_end_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19308:16/little,
       D_a_t_a/binary>>};
pack(cli, 19309, {}) ->
    {ok, <<2:32/little, 19309:16/little>>};
pack(srv, 19309, {V0_start_time, V0_end_time}) ->
    D_a_t_a = <<V0_start_time:32/little,
                V0_end_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19309:16/little,
       D_a_t_a/binary>>};
pack(cli, 19310, {}) ->
    {ok, <<2:32/little, 19310:16/little>>};
pack(srv, 19310,
     {#rencounter_role{rank_lev = V0_rank_lev,
                       star = V0_star, win_lasted_times = V0_win_lasted_times,
                       season_join_times = V0_season_join_times,
                       season_win_times = V0_season_win_times,
                       season_lasted_win = V0_season_lasted_win,
                       last_join_times = V0_last_join_times,
                       last_win_times = V0_last_win_times,
                       last_lasted_win = V0_last_lasted_win,
                       best_rank = V0_best_rank, join_times = V0_join_times,
                       max_joins = V0_max_joins,
                       has_get_rank = V0_has_get_rank}}) ->
    D_a_t_a = <<V0_rank_lev:8/little, V0_star:16/little,
                V0_win_lasted_times:8/little,
                V0_season_join_times:32/little,
                V0_season_win_times:32/little,
                V0_season_lasted_win:32/little,
                V0_last_join_times:32/little,
                V0_last_win_times:32/little,
                V0_last_lasted_win:32/little, V0_best_rank:8/little,
                V0_join_times:8/little, V0_max_joins:8/little,
                V0_has_get_rank:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19310:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 19300, _B0) -> {ok, {}};
unpack(cli, 19300, _B0) ->
    {V1_rank_lev, _B1} = protocol:uint8(_B0),
    {V1_star, _B2} = protocol:uint16(_B1),
    {V1_win_lasted_times, _B3} = protocol:uint8(_B2),
    {V1_season_join_times, _B4} = protocol:uint32(_B3),
    {V1_season_win_times, _B5} = protocol:uint32(_B4),
    {V1_season_lasted_win, _B6} = protocol:uint32(_B5),
    {V1_last_join_times, _B7} = protocol:uint32(_B6),
    {V1_last_win_times, _B8} = protocol:uint32(_B7),
    {V1_last_lasted_win, _B9} = protocol:uint32(_B8),
    {V1_best_rank, _B10} = protocol:uint8(_B9),
    {V1_join_times, _B11} = protocol:uint8(_B10),
    {V1_max_joins, _B12} = protocol:uint8(_B11),
    {V1_has_get_rank, _B13} = protocol:uint8(_B12),
    {V1_rank, _B14} = protocol:uint32(_B13),
    {ok,
     {V1_rank_lev,
      V1_star,
      V1_win_lasted_times,
      V1_season_join_times,
      V1_season_win_times,
      V1_season_lasted_win,
      V1_last_join_times,
      V1_last_win_times,
      V1_last_lasted_win,
      V1_best_rank,
      V1_join_times,
      V1_max_joins,
      V1_has_get_rank,
      V1_rank}};
unpack(srv, 19301, _B0) -> {ok, {}};
unpack(cli, 19301, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_rencounter_match_role, _B23} = protocol:array(_B2,
                                                      fun (_B3) ->
                                                              {V2_rid, _B4} =
                                                                  protocol:uint32(_B3),
                                                              {V2_plat, _B5} =
                                                                  protocol:string(_B4),
                                                              {V2_zone_id,
                                                               _B6} =
                                                                  protocol:uint32(_B5),
                                                              {V2_name, _B7} =
                                                                  protocol:string(_B6),
                                                              {V2_lev, _B8} =
                                                                  protocol:uint32(_B7),
                                                              {V2_classes,
                                                               _B9} =
                                                                  protocol:uint8(_B8),
                                                              {V2_sex, _B10} =
                                                                  protocol:uint8(_B9),
                                                              {V2_break_times,
                                                               _B11} =
                                                                  protocol:uint8(_B10),
                                                              {V2_fc, _B12} =
                                                                  protocol:uint32(_B11),
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
                                                              {V2_rank_lev,
                                                               _B20} =
                                                                  protocol:uint8(_B19),
                                                              {V2_star, _B21} =
                                                                  protocol:uint16(_B20),
                                                              {{V2_rid,
                                                                V2_plat,
                                                                V2_zone_id,
                                                                V2_name,
                                                                V2_lev,
                                                                V2_classes,
                                                                V2_sex,
                                                                V2_break_times,
                                                                V2_fc,
                                                                V2_looks,
                                                                V2_rank_lev,
                                                                V2_star},
                                                               _B21}
                                                      end),
    {ok, {V1_err_code, V1_msg, V1_rencounter_match_role}};
unpack(srv, 19302, _B0) -> {ok, {}};
unpack(cli, 19302, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 19303, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_group_id, _B2} = protocol:uint8(_B1),
    {ok, {V1_type, V1_group_id}};
unpack(cli, 19303, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_rencounter_role, _B15} = protocol:array(_B1,
                                                fun (_B2) ->
                                                        {V2_rid, _B3} =
                                                            protocol:uint32(_B2),
                                                        {V2_plat, _B4} =
                                                            protocol:string(_B3),
                                                        {V2_zone_id, _B5} =
                                                            protocol:uint32(_B4),
                                                        {V2_name, _B6} =
                                                            protocol:string(_B5),
                                                        {V2_lev, _B7} =
                                                            protocol:uint32(_B6),
                                                        {V2_classes, _B8} =
                                                            protocol:uint8(_B7),
                                                        {V2_sex, _B9} =
                                                            protocol:uint8(_B8),
                                                        {V2_break_times, _B10} =
                                                            protocol:uint8(_B9),
                                                        {V2_fc, _B11} =
                                                            protocol:uint32(_B10),
                                                        {V2_rank_lev, _B12} =
                                                            protocol:uint8(_B11),
                                                        {V2_star, _B13} =
                                                            protocol:uint16(_B12),
                                                        {{V2_rid,
                                                          V2_plat,
                                                          V2_zone_id,
                                                          V2_name,
                                                          V2_lev,
                                                          V2_classes,
                                                          V2_sex,
                                                          V2_break_times,
                                                          V2_fc,
                                                          V2_rank_lev,
                                                          V2_star},
                                                         _B13}
                                                end),
    {ok, {V1_type, V1_rencounter_role}};
unpack(srv, 19304, _B0) -> {ok, {}};
unpack(cli, 19304, _B0) ->
    {V1_rencounter_role, _B23} = protocol:array(_B0,
                                                fun (_B1) ->
                                                        {V2_l_rid, _B2} =
                                                            protocol:uint32(_B1),
                                                        {V2_l_plat, _B3} =
                                                            protocol:string(_B2),
                                                        {V2_l_zone_id, _B4} =
                                                            protocol:uint32(_B3),
                                                        {V2_name, _B5} =
                                                            protocol:string(_B4),
                                                        {V2_lev, _B6} =
                                                            protocol:uint32(_B5),
                                                        {V2_classes, _B7} =
                                                            protocol:uint8(_B6),
                                                        {V2_sex, _B8} =
                                                            protocol:uint8(_B7),
                                                        {V2_break_times, _B9} =
                                                            protocol:uint8(_B8),
                                                        {V2_fc, _B10} =
                                                            protocol:uint32(_B9),
                                                        {V2_rank_lev, _B11} =
                                                            protocol:uint8(_B10),
                                                        {V2_star, _B12} =
                                                            protocol:uint16(_B11),
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
                                                        {V2_season_join_times,
                                                         _B20} =
                                                            protocol:uint32(_B19),
                                                        {V2_season_win_times,
                                                         _B21} =
                                                            protocol:uint32(_B20),
                                                        {{V2_l_rid,
                                                          V2_l_plat,
                                                          V2_l_zone_id,
                                                          V2_name,
                                                          V2_lev,
                                                          V2_classes,
                                                          V2_sex,
                                                          V2_break_times,
                                                          V2_fc,
                                                          V2_rank_lev,
                                                          V2_star,
                                                          V2_looks,
                                                          V2_season_join_times,
                                                          V2_season_win_times},
                                                         _B21}
                                                end),
    {ok, {V1_rencounter_role}};
unpack(srv, 19305, _B0) -> {ok, {}};
unpack(cli, 19305, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_plat, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_lev, _B5} = protocol:uint32(_B4),
    {V1_classes, _B6} = protocol:uint8(_B5),
    {V1_sex, _B7} = protocol:uint8(_B6),
    {V1_break_times, _B8} = protocol:uint8(_B7),
    {V1_fc, _B9} = protocol:uint32(_B8),
    {V1_rank_lev, _B10} = protocol:uint8(_B9),
    {V1_star, _B11} = protocol:uint16(_B10),
    {V1_looks, _B18} = protocol:array(_B11,
                                      fun (_B12) ->
                                              {V2_looks_type, _B13} =
                                                  protocol:uint32(_B12),
                                              {V2_looks_mode, _B14} =
                                                  protocol:uint32(_B13),
                                              {V2_looks_val, _B15} =
                                                  protocol:uint32(_B14),
                                              {V2_looks_str, _B16} =
                                                  protocol:string(_B15),
                                              {{V2_looks_type,
                                                V2_looks_mode,
                                                V2_looks_val,
                                                V2_looks_str},
                                               _B16}
                                      end),
    {ok,
     {V1_rid,
      V1_plat,
      V1_zone_id,
      V1_name,
      V1_lev,
      V1_classes,
      V1_sex,
      V1_break_times,
      V1_fc,
      V1_rank_lev,
      V1_star,
      V1_looks}};
unpack(srv, 19306, _B0) -> {ok, {}};
unpack(cli, 19306, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_t_id, _B2} = protocol:uint32(_B1),
    {V1_t_platform, _B3} = protocol:string(_B2),
    {V1_t_zone, _B4} = protocol:uint16(_B3),
    {V1_t_name, _B5} = protocol:string(_B4),
    {V1_t_classes, _B6} = protocol:uint8(_B5),
    {V1_t_sex, _B7} = protocol:uint8(_B6),
    {V1_t_lev, _B8} = protocol:uint16(_B7),
    {V1_t_rank_lev, _B9} = protocol:uint8(_B8),
    {V1_t_star, _B10} = protocol:uint16(_B9),
    {V1_s_rank_lev, _B11} = protocol:uint16(_B10),
    {V1_s_star, _B12} = protocol:int8(_B11),
    {V1_s_rank_lev_change, _B13} = protocol:uint16(_B12),
    {V1_s_star_change, _B14} = protocol:int8(_B13),
    {V1_s_statistics, _B21} = protocol:array(_B14,
                                             fun (_B15) ->
                                                     {V2_type_1, _B16} =
                                                         protocol:uint8(_B15),
                                                     {V2_base_id_1, _B17} =
                                                         protocol:uint32(_B16),
                                                     {V2_dmg_1, _B18} =
                                                         protocol:uint32(_B17),
                                                     {V2_heal_1, _B19} =
                                                         protocol:uint32(_B18),
                                                     {{V2_type_1,
                                                       V2_base_id_1,
                                                       V2_dmg_1,
                                                       V2_heal_1},
                                                      _B19}
                                             end),
    {V1_t_statistics, _B28} = protocol:array(_B21,
                                             fun (_B22) ->
                                                     {V2_type_2, _B23} =
                                                         protocol:uint8(_B22),
                                                     {V2_base_id_2, _B24} =
                                                         protocol:uint32(_B23),
                                                     {V2_dmg_2, _B25} =
                                                         protocol:uint32(_B24),
                                                     {V2_heal_2, _B26} =
                                                         protocol:uint32(_B25),
                                                     {{V2_type_2,
                                                       V2_base_id_2,
                                                       V2_dmg_2,
                                                       V2_heal_2},
                                                      _B26}
                                             end),
    {ok,
     {V1_result,
      V1_t_id,
      V1_t_platform,
      V1_t_zone,
      V1_t_name,
      V1_t_classes,
      V1_t_sex,
      V1_t_lev,
      V1_t_rank_lev,
      V1_t_star,
      V1_s_rank_lev,
      V1_s_star,
      V1_s_rank_lev_change,
      V1_s_star_change,
      V1_s_statistics,
      V1_t_statistics}};
unpack(srv, 19307, _B0) ->
    {V1_rank_lev, _B1} = protocol:uint8(_B0),
    {ok, {V1_rank_lev}};
unpack(cli, 19307, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 19308, _B0) -> {ok, {}};
unpack(cli, 19308, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_end_time, _B2} = protocol:uint32(_B1),
    {ok, {V1_status, V1_end_time}};
unpack(srv, 19309, _B0) -> {ok, {}};
unpack(cli, 19309, _B0) ->
    {V1_start_time, _B1} = protocol:uint32(_B0),
    {V1_end_time, _B2} = protocol:uint32(_B1),
    {ok, {V1_start_time, V1_end_time}};
unpack(srv, 19310, _B0) -> {ok, {}};
unpack(cli, 19310, _B0) ->
    {V1_rank_lev, _B1} = protocol:uint8(_B0),
    {V1_star, _B2} = protocol:uint16(_B1),
    {V1_win_lasted_times, _B3} = protocol:uint8(_B2),
    {V1_season_join_times, _B4} = protocol:uint32(_B3),
    {V1_season_win_times, _B5} = protocol:uint32(_B4),
    {V1_season_lasted_win, _B6} = protocol:uint32(_B5),
    {V1_last_join_times, _B7} = protocol:uint32(_B6),
    {V1_last_win_times, _B8} = protocol:uint32(_B7),
    {V1_last_lasted_win, _B9} = protocol:uint32(_B8),
    {V1_best_rank, _B10} = protocol:uint8(_B9),
    {V1_join_times, _B11} = protocol:uint8(_B10),
    {V1_max_joins, _B12} = protocol:uint8(_B11),
    {V1_has_get_rank, _B13} = protocol:uint8(_B12),
    {ok,
     {V1_rank_lev,
      V1_star,
      V1_win_lasted_times,
      V1_season_join_times,
      V1_season_win_times,
      V1_season_lasted_win,
      V1_last_join_times,
      V1_last_win_times,
      V1_last_lasted_win,
      V1_best_rank,
      V1_join_times,
      V1_max_joins,
      V1_has_get_rank}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

