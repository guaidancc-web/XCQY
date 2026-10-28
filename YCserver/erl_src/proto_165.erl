-file("src/proto/proto_165.erl", 1).

-module(proto_165).

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

-file("src/proto/proto_165.erl", 14).

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

-file("src/proto/proto_165.erl", 15).

-file("inc/elf.hrl", 1).

-record(elf_role,
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
         die = 0,
         score = 0,
         is_combat = 0,
         last_combat_over_time = 0,
         combat_protect_time = 0,
         last_role_id,
         zone_id = 0,
         zone_pid,
         has_enter = 0,
         has_mail = 0,
         group = 0,
         seq_id = 0,
         fc = 0,
         m_time = 0,
         pos,
         rank = 0,
         grade_flag = 0,
         grade_first_flag = 0,
         unit_list = [],
         match = 0,
         exp = 0,
         group_key = 0,
         open_id = 0}).

-record(elf_role_map,
        {id = 0, map_id = 0, map_base_id = 0, num = 0}).

-record(elf_ready_zone,
        {map_id = 0 :: non_neg_integer(),
         map_pid :: pid() | undefined,
         group_key = {0, 0},
         open_id = 0,
         group_id = 0 :: pos_integer(),
         members = [],
         num = 0}).

-record(elf_group_data,
        {min = 0, max = 0, group = 0, order = 0, name = ""}).

-record(elf_zone,
        {id = 0 :: non_neg_integer(),
         pid :: pid() | undefined,
         group = 0,
         group_key = {0, 0},
         open_id = 0,
         flag = 0}).

-record(elf_map,
        {id = 0 :: non_neg_integer(),
         map_pid :: pid() | undefined,
         map_id = 0,
         map_base_id = 0,
         num = 0,
         max_num = 0}).

-record(elf_map_data,
        {id = 0 :: non_neg_integer(),
         map_base_id = 0,
         num = 0,
         unit_list = [],
         boss_list = [],
         super_list = [],
         box_list = [],
         next_score = 0,
         win_score = 0,
         fail_score = 0,
         end_score = 0,
         next_base_id = 0,
         buff_id = 0,
         grade_buff_id = 0,
         grade_msg = "",
         grade_cast_msg = "",
         grade_score = 0,
         grade_dec_score = 0,
         grade_dec_msg = "",
         fail_buff_id = 0,
         fail_msg = "",
         pos_list = [],
         msg = "",
         del_buff = [],
         max_score = 0,
         max_guard = 4}).

-record(elf_unit,
        {id = {0, 0} :: non_neg_integer(), base_id = 0, pos}).

-record(elf_unit_data,
        {id = 0,
         is_del = 1,
         pos = [],
         score = 0,
         kill_num = 0,
         create_msg = "",
         item_list = [],
         buff_id = 0,
         msg = "",
         cast_msg = ""}).

-record(elf_reward_data,
        {group = 0,
         min = 0,
         max = 0,
         item_list = [],
         exp_mode = 0}).

-record(elf_first_data,
        {group = 0,
         map_base_id,
         min = 0,
         max = 0,
         item_list = [],
         cast = "",
         title = "",
         comment = ""}).

-record(elf_win_data,
        {group = 0,
         min = 0,
         max = 0,
         flag = 0,
         item_list = [],
         exp = 0,
         pet_exp = 0}).

-file("src/proto/proto_165.erl", 16).

-file("inc/pos.hrl", 1).

-record(pos_history,
        {map = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(pos,
        {map = 10001 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         last :: undefined | #pos_history{},
         map_base_id = 0 :: non_neg_integer(),
         map_pid = 0 :: non_neg_integer() | pid(),
         map_grid_pid = 0 :: non_neg_integer() | pid(),
         hidden = 1 :: 0 | 1,
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         dir = 0 :: 0..255}).

-file("src/proto/proto_165.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 16500, {}) ->
    {ok, <<2:32/little, 16500:16/little>>};
pack(srv, 16500, {V0_statue, V0_mtime}) ->
    D_a_t_a = <<V0_statue:8/little, V0_mtime:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16500:16/little,
       D_a_t_a/binary>>};
pack(cli, 16501, {}) ->
    {ok, <<2:32/little, 16501:16/little>>};
pack(srv, 16501, {V0_op_code, V0_msg}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16501:16/little,
       D_a_t_a/binary>>};
pack(cli, 16502, {}) ->
    {ok, <<2:32/little, 16502:16/little>>};
pack(srv, 16502, {V0_op_code, V0_msg}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16502:16/little,
       D_a_t_a/binary>>};
pack(cli, 16503, {}) ->
    {ok, <<2:32/little, 16503:16/little>>};
pack(srv, 16503, {V0_group, V0_list}) ->
    D_a_t_a = <<V0_group:32/little,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_map_base_id:32/little,
                                   V1_num:32/little>>
                                 || #elf_map{map_base_id = V1_map_base_id,
                                             num = V1_num}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16503:16/little,
       D_a_t_a/binary>>};
pack(cli, 16504, {}) ->
    {ok, <<2:32/little, 16504:16/little>>};
pack(srv, 16504, {V0_list}) ->
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
                                   V1_rank:32/little, V1_exp:32/little,
                                   V1_map_base_id:32/little>>
                                 || #elf_role{id =
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
                                              group = V1_group, rank = V1_rank,
                                              exp = V1_exp,
                                              pos =
                                                  #pos{map_base_id =
                                                           V1_map_base_id}}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16504:16/little,
       D_a_t_a/binary>>};
pack(cli, 16505, {}) ->
    {ok, <<2:32/little, 16505:16/little>>};
pack(srv, 16505, {V0_list}) ->
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
                                   V1_map_base_id:32/little>>
                                 || #elf_role{id =
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
                                              pos =
                                                  #pos{map_base_id =
                                                           V1_map_base_id}}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16505:16/little,
       D_a_t_a/binary>>};
pack(cli, 16506, {}) ->
    {ok, <<2:32/little, 16506:16/little>>};
pack(srv, 16506, {V0_group, V0_list, V0_rank_list}) ->
    D_a_t_a = <<V0_group:32/little,
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
                                   V1_map_base_id:32/little>>
                                 || #elf_role{id =
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
                                              pos =
                                                  #pos{map_base_id =
                                                           V1_map_base_id}}
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
                                   V1_map_base_id:32/little>>
                                 || #elf_role{id =
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
                                              pos =
                                                  #pos{map_base_id =
                                                           V1_map_base_id}}
                                        <- V0_rank_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16506:16/little,
       D_a_t_a/binary>>};
pack(cli, 16508, {}) ->
    {ok, <<2:32/little, 16508:16/little>>};
pack(srv, 16508, {V0_is_win, V0_die, V0_show}) ->
    D_a_t_a = <<V0_is_win:32/little, V0_die:32/little,
                (length(V0_show)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_num:32/little>>
                                 || {V1_base_id, V1_num} <- V0_show]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16508:16/little,
       D_a_t_a/binary>>};
pack(cli, 16509, {}) ->
    {ok, <<2:32/little, 16509:16/little>>};
pack(srv, 16509, {}) ->
    {ok, <<2:32/little, 16509:16/little>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 16500, _B0) -> {ok, {}};
unpack(cli, 16500, _B0) ->
    {V1_statue, _B1} = protocol:uint8(_B0),
    {V1_mtime, _B2} = protocol:uint32(_B1),
    {ok, {V1_statue, V1_mtime}};
unpack(srv, 16501, _B0) -> {ok, {}};
unpack(cli, 16501, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_op_code, V1_msg}};
unpack(srv, 16502, _B0) -> {ok, {}};
unpack(cli, 16502, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_op_code, V1_msg}};
unpack(srv, 16503, _B0) -> {ok, {}};
unpack(cli, 16503, _B0) ->
    {V1_group, _B1} = protocol:uint32(_B0),
    {V1_list, _B6} = protocol:array(_B1,
                                    fun (_B2) ->
                                            {V2_map_base_id, _B3} =
                                                protocol:uint32(_B2),
                                            {V2_num, _B4} =
                                                protocol:uint32(_B3),
                                            {{V2_map_base_id, V2_num}, _B4}
                                    end),
    {ok, {V1_group, V1_list}};
unpack(srv, 16504, _B0) -> {ok, {}};
unpack(cli, 16504, _B0) ->
    {V1_list, _B22} = protocol:array(_B0,
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
                                             {V2_rank, _B18} =
                                                 protocol:uint32(_B17),
                                             {V2_exp, _B19} =
                                                 protocol:uint32(_B18),
                                             {V2_map_base_id, _B20} =
                                                 protocol:uint32(_B19),
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
                                               V2_rank,
                                               V2_exp,
                                               V2_map_base_id},
                                              _B20}
                                     end),
    {ok, {V1_list}};
unpack(srv, 16505, _B0) -> {ok, {}};
unpack(cli, 16505, _B0) ->
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
                                             {V2_map_base_id, _B18} =
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
                                               V2_map_base_id},
                                              _B18}
                                     end),
    {ok, {V1_list}};
unpack(srv, 16506, _B0) -> {ok, {}};
unpack(cli, 16506, _B0) ->
    {V1_group, _B1} = protocol:uint32(_B0),
    {V1_list, _B21} = protocol:array(_B1,
                                     fun (_B2) ->
                                             {V2_rid, _B3} =
                                                 protocol:uint32(_B2),
                                             {V2_platform, _B4} =
                                                 protocol:string(_B3),
                                             {V2_r_zone_id, _B5} =
                                                 protocol:uint32(_B4),
                                             {V2_name, _B6} =
                                                 protocol:string(_B5),
                                             {V2_classes, _B7} =
                                                 protocol:uint32(_B6),
                                             {V2_sex, _B8} =
                                                 protocol:uint32(_B7),
                                             {V2_status, _B9} =
                                                 protocol:uint32(_B8),
                                             {V2_lev, _B10} =
                                                 protocol:uint32(_B9),
                                             {V2_win, _B11} =
                                                 protocol:uint32(_B10),
                                             {V2_win_streak, _B12} =
                                                 protocol:uint32(_B11),
                                             {V2_times, _B13} =
                                                 protocol:uint32(_B12),
                                             {V2_die, _B14} =
                                                 protocol:uint32(_B13),
                                             {V2_score, _B15} =
                                                 protocol:uint32(_B14),
                                             {V2_zone_id, _B16} =
                                                 protocol:uint32(_B15),
                                             {V2_match, _B17} =
                                                 protocol:uint32(_B16),
                                             {V2_group, _B18} =
                                                 protocol:uint32(_B17),
                                             {V2_map_base_id, _B19} =
                                                 protocol:uint32(_B18),
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
                                               V2_map_base_id},
                                              _B19}
                                     end),
    {V1_rank_list, _B41} = protocol:array(_B21,
                                          fun (_B22) ->
                                                  {V2_rid, _B23} =
                                                      protocol:uint32(_B22),
                                                  {V2_platform, _B24} =
                                                      protocol:string(_B23),
                                                  {V2_r_zone_id, _B25} =
                                                      protocol:uint32(_B24),
                                                  {V2_name, _B26} =
                                                      protocol:string(_B25),
                                                  {V2_classes, _B27} =
                                                      protocol:uint32(_B26),
                                                  {V2_sex, _B28} =
                                                      protocol:uint32(_B27),
                                                  {V2_status, _B29} =
                                                      protocol:uint32(_B28),
                                                  {V2_lev, _B30} =
                                                      protocol:uint32(_B29),
                                                  {V2_win, _B31} =
                                                      protocol:uint32(_B30),
                                                  {V2_win_streak, _B32} =
                                                      protocol:uint32(_B31),
                                                  {V2_times, _B33} =
                                                      protocol:uint32(_B32),
                                                  {V2_die, _B34} =
                                                      protocol:uint32(_B33),
                                                  {V2_score, _B35} =
                                                      protocol:uint32(_B34),
                                                  {V2_zone_id, _B36} =
                                                      protocol:uint32(_B35),
                                                  {V2_match, _B37} =
                                                      protocol:uint32(_B36),
                                                  {V2_group, _B38} =
                                                      protocol:uint32(_B37),
                                                  {V2_map_base_id, _B39} =
                                                      protocol:uint32(_B38),
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
                                                    V2_map_base_id},
                                                   _B39}
                                          end),
    {ok, {V1_group, V1_list, V1_rank_list}};
unpack(srv, 16508, _B0) -> {ok, {}};
unpack(cli, 16508, _B0) ->
    {V1_is_win, _B1} = protocol:uint32(_B0),
    {V1_die, _B2} = protocol:uint32(_B1),
    {V1_show, _B7} = protocol:array(_B2,
                                    fun (_B3) ->
                                            {V2_base_id, _B4} =
                                                protocol:uint32(_B3),
                                            {V2_num, _B5} =
                                                protocol:uint32(_B4),
                                            {{V2_base_id, V2_num}, _B5}
                                    end),
    {ok, {V1_is_win, V1_die, V1_show}};
unpack(srv, 16509, _B0) -> {ok, {}};
unpack(cli, 16509, _B0) -> {ok, {}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

