-file("src/proto/proto_163.erl", 1).

-module(proto_163).

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

-file("src/proto/proto_163.erl", 14).

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

-file("src/proto/proto_163.erl", 15).

-file("inc/hero.hrl", 1).

-record(hero_ready_zone,
        {map_id = 0 :: non_neg_integer(),
         map_pid :: pid() | undefined,
         member_size = 0 :: non_neg_integer(),
         group_id = 0 :: pos_integer(),
         exit_npc}).

-record(hero_zone,
        {id = 0 :: non_neg_integer(),
         pid :: pid() | undefined,
         series = 0,
         flag = 0}).

-record(hero_group,
        {id = 0,
         score = 0,
         num = 0,
         offline_num = 0,
         all_num = 0,
         ave_fc = 0,
         sum_fc = 0}).

-record(hero_group_team,
        {group = 0, num = 0, fight = 0, match = 0}).

-record(hero_series,
        {group = 0,
         num = 0,
         ave_fc = 0,
         sum_fc = 0,
         map_id = 0 :: non_neg_integer(),
         map_pid :: pid() | undefined,
         members = []}).

-record(hero_series_ready,
        {tiger = #hero_series{},
         dragon = #hero_series{},
         series = 0,
         ave_fc = 0,
         num = 0}).

-record(hero_series_data,
        {min = 0, max = 0, series = 0, name = ""}).

-record(hero_role,
        {id = {0, "", 0},
         pid,
         status = 0,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         win = 0,
         win_streak = 0,
         times = 0,
         die = 4,
         rank_point = 0,
         score = 0,
         is_combat = 0,
         last_combat_over_time = 0,
         last_role_id,
         zone_id = 0,
         zone_pid,
         team_status = 0,
         team_lev = 40,
         team_len = 1,
         match = 0,
         exp = 0,
         has_enter = 0,
         looks = [],
         has_mail = 0,
         group = 1,
         box = 0,
         series = 0,
         fc = 0,
         m_time = 0}).

-record(hero_reward_data,
        {min = 0,
         max = 0,
         flag = 0,
         item_list = [],
         exp_mode = 0,
         pet_exp_mode = 0}).

-record(hero_win_data,
        {min = 0,
         max = 0,
         flag = 0,
         item_list = [],
         exp = 0,
         pet_exp = 0}).

-file("src/proto/proto_163.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 16300, {}) ->
    {ok, <<2:32/little, 16300:16/little>>};
pack(srv, 16300, {V0_statue, V0_mtime}) ->
    D_a_t_a = <<V0_statue:8/little, V0_mtime:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16300:16/little,
       D_a_t_a/binary>>};
pack(cli, 16301, {}) ->
    {ok, <<2:32/little, 16301:16/little>>};
pack(srv, 16301, {V0_op_code, V0_msg}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16301:16/little,
       D_a_t_a/binary>>};
pack(cli, 16302, {}) ->
    {ok, <<2:32/little, 16302:16/little>>};
pack(srv, 16302, {V0_op_code, V0_msg}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16302:16/little,
       D_a_t_a/binary>>};
pack(cli, 16303, {}) ->
    {ok, <<2:32/little, 16303:16/little>>};
pack(srv, 16303, {V0_series, V0_list}) ->
    D_a_t_a = <<V0_series:32/little,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_id:8/little, V1_score:32/little,
                                   V1_num:32/little, V1_offline_num:32/little>>
                                 || #hero_group{id = V1_id, score = V1_score,
                                                num = V1_num,
                                                offline_num = V1_offline_num}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16303:16/little,
       D_a_t_a/binary>>};
pack(cli, 16304, {}) ->
    {ok, <<2:32/little, 16304:16/little>>};
pack(srv, 16304, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_r_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_classes:32/little, V1_sex:32/little,
                                   V1_status:32/little, V1_lev:32/little,
                                   V1_win:32/little, V1_win_streak:32/little,
                                   V1_times:32/little, V1_die:32/little,
                                   V1_score:32/little, V1_zone_id:32/little,
                                   V1_match:32/little, V1_group:32/little,
                                   V1_series:32/little>>
                                 || #hero_role{id =
                                                   {V1_rid,
                                                    V1_platform,
                                                    V1_r_zone_id},
                                               name = V1_name,
                                               classes = V1_classes,
                                               sex = V1_sex, status = V1_status,
                                               lev = V1_lev, win = V1_win,
                                               win_streak = V1_win_streak,
                                               times = V1_times, die = V1_die,
                                               score = V1_score,
                                               zone_id = V1_zone_id,
                                               match = V1_match,
                                               group = V1_group,
                                               series = V1_series}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16304:16/little,
       D_a_t_a/binary>>};
pack(cli, 16305, {}) ->
    {ok, <<2:32/little, 16305:16/little>>};
pack(srv, 16305, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_r_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_classes:32/little, V1_sex:32/little,
                                   V1_status:32/little, V1_lev:32/little,
                                   V1_win:32/little, V1_win_streak:32/little,
                                   V1_times:32/little, V1_die:32/little,
                                   V1_score:32/little, V1_zone_id:32/little,
                                   V1_match:32/little, V1_group:32/little,
                                   V1_series:32/little>>
                                 || #hero_role{id =
                                                   {V1_rid,
                                                    V1_platform,
                                                    V1_r_zone_id},
                                               name = V1_name,
                                               classes = V1_classes,
                                               sex = V1_sex, status = V1_status,
                                               lev = V1_lev, win = V1_win,
                                               win_streak = V1_win_streak,
                                               times = V1_times, die = V1_die,
                                               score = V1_score,
                                               zone_id = V1_zone_id,
                                               match = V1_match,
                                               group = V1_group,
                                               series = V1_series}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16305:16/little,
       D_a_t_a/binary>>};
pack(cli, 16306, {}) ->
    {ok, <<2:32/little, 16306:16/little>>};
pack(srv, 16306,
     {V0_series,
      V0_succ_group,
      V0_fail_group,
      V0_group_list,
      V0_list,
      V0_rank_list}) ->
    D_a_t_a = <<V0_series:32/little,
                V0_succ_group:32/little, V0_fail_group:32/little,
                (length(V0_group_list)):16/little,
                (list_to_binary([<<V1_id:8/little, V1_score:32/little,
                                   V1_num:32/little, V1_offline_num:32/little>>
                                 || #hero_group{id = V1_id, score = V1_score,
                                                num = V1_num,
                                                offline_num = V1_offline_num}
                                        <- V0_group_list]))/binary,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_r_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_classes:32/little, V1_sex:32/little,
                                   V1_status:32/little, V1_lev:32/little,
                                   V1_win:32/little, V1_win_streak:32/little,
                                   V1_times:32/little, V1_die:32/little,
                                   V1_score:32/little, V1_zone_id:32/little,
                                   V1_match:32/little, V1_group:32/little,
                                   V1_series:32/little>>
                                 || #hero_role{id =
                                                   {V1_rid,
                                                    V1_platform,
                                                    V1_r_zone_id},
                                               name = V1_name,
                                               classes = V1_classes,
                                               sex = V1_sex, status = V1_status,
                                               lev = V1_lev, win = V1_win,
                                               win_streak = V1_win_streak,
                                               times = V1_times, die = V1_die,
                                               score = V1_score,
                                               zone_id = V1_zone_id,
                                               match = V1_match,
                                               group = V1_group,
                                               series = V1_series}
                                        <- V0_list]))/binary,
                (length(V0_rank_list)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_r_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_classes:32/little, V1_sex:32/little,
                                   V1_status:32/little, V1_lev:32/little,
                                   V1_win:32/little, V1_win_streak:32/little,
                                   V1_times:32/little, V1_die:32/little,
                                   V1_score:32/little, V1_zone_id:32/little,
                                   V1_match:32/little, V1_group:32/little,
                                   V1_series:32/little>>
                                 || #hero_role{id =
                                                   {V1_rid,
                                                    V1_platform,
                                                    V1_r_zone_id},
                                               name = V1_name,
                                               classes = V1_classes,
                                               sex = V1_sex, status = V1_status,
                                               lev = V1_lev, win = V1_win,
                                               win_streak = V1_win_streak,
                                               times = V1_times, die = V1_die,
                                               score = V1_score,
                                               zone_id = V1_zone_id,
                                               match = V1_match,
                                               group = V1_group,
                                               series = V1_series}
                                        <- V0_rank_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16306:16/little,
       D_a_t_a/binary>>};
pack(cli, 16307, {}) ->
    {ok, <<2:32/little, 16307:16/little>>};
pack(srv, 16307,
     {V0_gain_base_id, V0_gain_num, V0_show, V0_msg}) ->
    D_a_t_a = <<V0_gain_base_id:32/little,
                V0_gain_num:32/little, (length(V0_show)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_num:32/little>>
                                 || {V1_base_id, V1_num} <- V0_show]))/binary,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16307:16/little,
       D_a_t_a/binary>>};
pack(cli, 16308, {}) ->
    {ok, <<2:32/little, 16308:16/little>>};
pack(srv, 16308, {V0_is_win, V0_die, V0_show}) ->
    D_a_t_a = <<V0_is_win:32/little, V0_die:32/little,
                (length(V0_show)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_bind:32/little, V1_num:32/little>>
                                 || {V1_base_id, V1_bind, V1_num}
                                        <- V0_show]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16308:16/little,
       D_a_t_a/binary>>};
pack(cli, 16309, {}) ->
    {ok, <<2:32/little, 16309:16/little>>};
pack(srv, 16309, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_group:8/little, V1_num:32/little,
                                   V1_fight:32/little, V1_match:32/little>>
                                 || #hero_group_team{group = V1_group,
                                                     num = V1_num,
                                                     fight = V1_fight,
                                                     match = V1_match}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16309:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 16300, _B0) -> {ok, {}};
unpack(cli, 16300, _B0) ->
    {V1_statue, _B1} = protocol:uint8(_B0),
    {V1_mtime, _B2} = protocol:uint32(_B1),
    {ok, {V1_statue, V1_mtime}};
unpack(srv, 16301, _B0) -> {ok, {}};
unpack(cli, 16301, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_op_code, V1_msg}};
unpack(srv, 16302, _B0) -> {ok, {}};
unpack(cli, 16302, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_op_code, V1_msg}};
unpack(srv, 16303, _B0) -> {ok, {}};
unpack(cli, 16303, _B0) ->
    {V1_series, _B1} = protocol:uint32(_B0),
    {V1_list, _B8} = protocol:array(_B1,
                                    fun (_B2) ->
                                            {V2_id, _B3} = protocol:uint8(_B2),
                                            {V2_score, _B4} =
                                                protocol:uint32(_B3),
                                            {V2_num, _B5} =
                                                protocol:uint32(_B4),
                                            {V2_offline_num, _B6} =
                                                protocol:uint32(_B5),
                                            {{V2_id,
                                              V2_score,
                                              V2_num,
                                              V2_offline_num},
                                             _B6}
                                    end),
    {ok, {V1_series, V1_list}};
unpack(srv, 16304, _B0) -> {ok, {}};
unpack(cli, 16304, _B0) ->
    {V1_list, _B20} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_rid, _B2} =
                                                 protocol:uint32(_B1),
                                             {V2_platform, _B3} =
                                                 protocol:string(_B2),
                                             {V2_r_zone_id, _B4} =
                                                 protocol:uint32(_B3),
                                             {V2_name, _B5} =
                                                 protocol:string(_B4),
                                             {V2_classes, _B6} =
                                                 protocol:uint32(_B5),
                                             {V2_sex, _B7} =
                                                 protocol:uint32(_B6),
                                             {V2_status, _B8} =
                                                 protocol:uint32(_B7),
                                             {V2_lev, _B9} =
                                                 protocol:uint32(_B8),
                                             {V2_win, _B10} =
                                                 protocol:uint32(_B9),
                                             {V2_win_streak, _B11} =
                                                 protocol:uint32(_B10),
                                             {V2_times, _B12} =
                                                 protocol:uint32(_B11),
                                             {V2_die, _B13} =
                                                 protocol:uint32(_B12),
                                             {V2_score, _B14} =
                                                 protocol:uint32(_B13),
                                             {V2_zone_id, _B15} =
                                                 protocol:uint32(_B14),
                                             {V2_match, _B16} =
                                                 protocol:uint32(_B15),
                                             {V2_group, _B17} =
                                                 protocol:uint32(_B16),
                                             {V2_series, _B18} =
                                                 protocol:uint32(_B17),
                                             {{V2_rid,
                                               V2_platform,
                                               V2_r_zone_id,
                                               V2_name,
                                               V2_classes,
                                               V2_sex,
                                               V2_status,
                                               V2_lev,
                                               V2_win,
                                               V2_win_streak,
                                               V2_times,
                                               V2_die,
                                               V2_score,
                                               V2_zone_id,
                                               V2_match,
                                               V2_group,
                                               V2_series},
                                              _B18}
                                     end),
    {ok, {V1_list}};
unpack(srv, 16305, _B0) -> {ok, {}};
unpack(cli, 16305, _B0) ->
    {V1_list, _B20} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_rid, _B2} =
                                                 protocol:uint32(_B1),
                                             {V2_platform, _B3} =
                                                 protocol:string(_B2),
                                             {V2_r_zone_id, _B4} =
                                                 protocol:uint32(_B3),
                                             {V2_name, _B5} =
                                                 protocol:string(_B4),
                                             {V2_classes, _B6} =
                                                 protocol:uint32(_B5),
                                             {V2_sex, _B7} =
                                                 protocol:uint32(_B6),
                                             {V2_status, _B8} =
                                                 protocol:uint32(_B7),
                                             {V2_lev, _B9} =
                                                 protocol:uint32(_B8),
                                             {V2_win, _B10} =
                                                 protocol:uint32(_B9),
                                             {V2_win_streak, _B11} =
                                                 protocol:uint32(_B10),
                                             {V2_times, _B12} =
                                                 protocol:uint32(_B11),
                                             {V2_die, _B13} =
                                                 protocol:uint32(_B12),
                                             {V2_score, _B14} =
                                                 protocol:uint32(_B13),
                                             {V2_zone_id, _B15} =
                                                 protocol:uint32(_B14),
                                             {V2_match, _B16} =
                                                 protocol:uint32(_B15),
                                             {V2_group, _B17} =
                                                 protocol:uint32(_B16),
                                             {V2_series, _B18} =
                                                 protocol:uint32(_B17),
                                             {{V2_rid,
                                               V2_platform,
                                               V2_r_zone_id,
                                               V2_name,
                                               V2_classes,
                                               V2_sex,
                                               V2_status,
                                               V2_lev,
                                               V2_win,
                                               V2_win_streak,
                                               V2_times,
                                               V2_die,
                                               V2_score,
                                               V2_zone_id,
                                               V2_match,
                                               V2_group,
                                               V2_series},
                                              _B18}
                                     end),
    {ok, {V1_list}};
unpack(srv, 16306, _B0) -> {ok, {}};
unpack(cli, 16306, _B0) ->
    {V1_series, _B1} = protocol:uint32(_B0),
    {V1_succ_group, _B2} = protocol:uint32(_B1),
    {V1_fail_group, _B3} = protocol:uint32(_B2),
    {V1_group_list, _B10} = protocol:array(_B3,
                                           fun (_B4) ->
                                                   {V2_id, _B5} =
                                                       protocol:uint8(_B4),
                                                   {V2_score, _B6} =
                                                       protocol:uint32(_B5),
                                                   {V2_num, _B7} =
                                                       protocol:uint32(_B6),
                                                   {V2_offline_num, _B8} =
                                                       protocol:uint32(_B7),
                                                   {{V2_id,
                                                     V2_score,
                                                     V2_num,
                                                     V2_offline_num},
                                                    _B8}
                                           end),
    {V1_list, _B30} = protocol:array(_B10,
                                     fun (_B11) ->
                                             {V2_rid, _B12} =
                                                 protocol:uint32(_B11),
                                             {V2_platform, _B13} =
                                                 protocol:string(_B12),
                                             {V2_r_zone_id, _B14} =
                                                 protocol:uint32(_B13),
                                             {V2_name, _B15} =
                                                 protocol:string(_B14),
                                             {V2_classes, _B16} =
                                                 protocol:uint32(_B15),
                                             {V2_sex, _B17} =
                                                 protocol:uint32(_B16),
                                             {V2_status, _B18} =
                                                 protocol:uint32(_B17),
                                             {V2_lev, _B19} =
                                                 protocol:uint32(_B18),
                                             {V2_win, _B20} =
                                                 protocol:uint32(_B19),
                                             {V2_win_streak, _B21} =
                                                 protocol:uint32(_B20),
                                             {V2_times, _B22} =
                                                 protocol:uint32(_B21),
                                             {V2_die, _B23} =
                                                 protocol:uint32(_B22),
                                             {V2_score, _B24} =
                                                 protocol:uint32(_B23),
                                             {V2_zone_id, _B25} =
                                                 protocol:uint32(_B24),
                                             {V2_match, _B26} =
                                                 protocol:uint32(_B25),
                                             {V2_group, _B27} =
                                                 protocol:uint32(_B26),
                                             {V2_series, _B28} =
                                                 protocol:uint32(_B27),
                                             {{V2_rid,
                                               V2_platform,
                                               V2_r_zone_id,
                                               V2_name,
                                               V2_classes,
                                               V2_sex,
                                               V2_status,
                                               V2_lev,
                                               V2_win,
                                               V2_win_streak,
                                               V2_times,
                                               V2_die,
                                               V2_score,
                                               V2_zone_id,
                                               V2_match,
                                               V2_group,
                                               V2_series},
                                              _B28}
                                     end),
    {V1_rank_list, _B50} = protocol:array(_B30,
                                          fun (_B31) ->
                                                  {V2_rid, _B32} =
                                                      protocol:uint32(_B31),
                                                  {V2_platform, _B33} =
                                                      protocol:string(_B32),
                                                  {V2_r_zone_id, _B34} =
                                                      protocol:uint32(_B33),
                                                  {V2_name, _B35} =
                                                      protocol:string(_B34),
                                                  {V2_classes, _B36} =
                                                      protocol:uint32(_B35),
                                                  {V2_sex, _B37} =
                                                      protocol:uint32(_B36),
                                                  {V2_status, _B38} =
                                                      protocol:uint32(_B37),
                                                  {V2_lev, _B39} =
                                                      protocol:uint32(_B38),
                                                  {V2_win, _B40} =
                                                      protocol:uint32(_B39),
                                                  {V2_win_streak, _B41} =
                                                      protocol:uint32(_B40),
                                                  {V2_times, _B42} =
                                                      protocol:uint32(_B41),
                                                  {V2_die, _B43} =
                                                      protocol:uint32(_B42),
                                                  {V2_score, _B44} =
                                                      protocol:uint32(_B43),
                                                  {V2_zone_id, _B45} =
                                                      protocol:uint32(_B44),
                                                  {V2_match, _B46} =
                                                      protocol:uint32(_B45),
                                                  {V2_group, _B47} =
                                                      protocol:uint32(_B46),
                                                  {V2_series, _B48} =
                                                      protocol:uint32(_B47),
                                                  {{V2_rid,
                                                    V2_platform,
                                                    V2_r_zone_id,
                                                    V2_name,
                                                    V2_classes,
                                                    V2_sex,
                                                    V2_status,
                                                    V2_lev,
                                                    V2_win,
                                                    V2_win_streak,
                                                    V2_times,
                                                    V2_die,
                                                    V2_score,
                                                    V2_zone_id,
                                                    V2_match,
                                                    V2_group,
                                                    V2_series},
                                                   _B48}
                                          end),
    {ok,
     {V1_series,
      V1_succ_group,
      V1_fail_group,
      V1_group_list,
      V1_list,
      V1_rank_list}};
unpack(srv, 16307, _B0) -> {ok, {}};
unpack(cli, 16307, _B0) ->
    {V1_gain_base_id, _B1} = protocol:uint32(_B0),
    {V1_gain_num, _B2} = protocol:uint32(_B1),
    {V1_show, _B7} = protocol:array(_B2,
                                    fun (_B3) ->
                                            {V2_base_id, _B4} =
                                                protocol:uint32(_B3),
                                            {V2_num, _B5} =
                                                protocol:uint32(_B4),
                                            {{V2_base_id, V2_num}, _B5}
                                    end),
    {V1_msg, _B8} = protocol:string(_B7),
    {ok, {V1_gain_base_id, V1_gain_num, V1_show, V1_msg}};
unpack(srv, 16308, _B0) -> {ok, {}};
unpack(cli, 16308, _B0) ->
    {V1_is_win, _B1} = protocol:uint32(_B0),
    {V1_die, _B2} = protocol:uint32(_B1),
    {V1_show, _B8} = protocol:array(_B2,
                                    fun (_B3) ->
                                            {V2_base_id, _B4} =
                                                protocol:uint32(_B3),
                                            {V2_bind, _B5} =
                                                protocol:uint32(_B4),
                                            {V2_num, _B6} =
                                                protocol:uint32(_B5),
                                            {{V2_base_id, V2_bind, V2_num}, _B6}
                                    end),
    {ok, {V1_is_win, V1_die, V1_show}};
unpack(srv, 16309, _B0) -> {ok, {}};
unpack(cli, 16309, _B0) ->
    {V1_list, _B7} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_group, _B2} =
                                                protocol:uint8(_B1),
                                            {V2_num, _B3} =
                                                protocol:uint32(_B2),
                                            {V2_fight, _B4} =
                                                protocol:uint32(_B3),
                                            {V2_match, _B5} =
                                                protocol:uint32(_B4),
                                            {{V2_group,
                                              V2_num,
                                              V2_fight,
                                              V2_match},
                                             _B5}
                                    end),
    {ok, {V1_list}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

