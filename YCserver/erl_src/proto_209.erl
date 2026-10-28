-file("src/proto/proto_209.erl", 1).

-module(proto_209).

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

-file("src/proto/proto_209.erl", 14).

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

-file("src/proto/proto_209.erl", 15).

-file("inc/camp_black_white_chess.hrl", 1).

-record(black_white_chess_role,
        {id = {0, "", 0},
         pid,
         status = 0,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         looks = [],
         self_grade = 0,
         grade = 0,
         score = 0,
         all_score = 0,
         start_match_time = 0,
         last_color = 1,
         fail_do_times = 0,
         max_change_in_round = 0,
         match_fail_times = 0}).

-record(black_white_chess_game_state,
        {id = 0,
         black_role,
         white_role,
         round = 0,
         round_end_time = date:unixtime(),
         round_start_time_stamp = date:now2(),
         timeout = 20 * 1000,
         m_probable_use_pos = [],
         m_black_can_use_pos = [],
         m_white_can_use_pos = [],
         m_chess = [],
         m_change_chess = [],
         do_flag = false,
         game_type = 1,
         skip_flag = false,
         ask_draw_flag = false,
         ask_draw_time_stamp = date:unixtime(),
         black_keep_ahead_round = 0,
         white_keep_ahead_round = 0,
         is_comeback = 0}).

-record(m_black_white_chess,
        {grade = 1, score = 0, all_score = 0, last_color = 1}).

-file("src/proto/proto_209.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 20900, {}) ->
    {ok, <<2:32/little, 20900:16/little>>};
pack(srv, 20900,
     {V0_self_grade,
      V0_self_score,
      #black_white_chess_role{name = V0_name, sex = V0_sex,
                              classes = V0_classes, lev = V0_lev,
                              grade = V0_grade, score = V0_score},
      V0_ops_looks,
      V0_self_color}) ->
    D_a_t_a = <<V0_self_grade:8/little,
                V0_self_score:32/little,
                (protocol:pack(string, V0_name))/binary,
                V0_sex:8/little, V0_classes:8/little, V0_lev:8/little,
                V0_grade:8/little, V0_score:32/little,
                (length(V0_ops_looks)):16/little,
                (list_to_binary([<<V1_looks_type:32/little,
                                   V1_looks_mode:32/little,
                                   V1_looks_val:32/little,
                                   (protocol:pack(string,
                                                  V1_looks_str))/binary>>
                                 || {V1_looks_type,
                                     V1_looks_mode,
                                     V1_looks_val,
                                     V1_looks_str}
                                        <- V0_ops_looks]))/binary,
                V0_self_color:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20900:16/little,
       D_a_t_a/binary>>};
pack(cli, 20901, {}) ->
    {ok, <<2:32/little, 20901:16/little>>};
pack(srv, 20901,
     {V0_who_turn,
      V0_end_time,
      V0_now_turn,
      V0_chess_list,
      V0_can_use_list,
      V0_chess_change_list,
      V0_black_keep_ahead_round,
      V0_white_keep_ahead_round,
      V0_is_comeback}) ->
    D_a_t_a = <<V0_who_turn:8/little, V0_end_time:32/little,
                V0_now_turn:8/little, (length(V0_chess_list)):16/little,
                (list_to_binary([<<V1_row:8/little, V1_col:8/little,
                                   V1_color:8/little>>
                                 || {V1_row, V1_col, V1_color}
                                        <- V0_chess_list]))/binary,
                (length(V0_can_use_list)):16/little,
                (list_to_binary([<<V1_row:8/little, V1_col:8/little>>
                                 || {V1_row, V1_col}
                                        <- V0_can_use_list]))/binary,
                (length(V0_chess_change_list)):16/little,
                (list_to_binary([<<V1_row:8/little, V1_col:8/little>>
                                 || {V1_row, V1_col}
                                        <- V0_chess_change_list]))/binary,
                V0_black_keep_ahead_round:8/little,
                V0_white_keep_ahead_round:8/little,
                V0_is_comeback:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20901:16/little,
       D_a_t_a/binary>>};
pack(cli, 20903, {V0_msg_num}) ->
    D_a_t_a = <<V0_msg_num:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20903:16/little,
       D_a_t_a/binary>>};
pack(srv, 20903, {V0_who_say, V0_msg}) ->
    D_a_t_a = <<V0_who_say:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20903:16/little,
       D_a_t_a/binary>>};
pack(cli, 20904, {}) ->
    {ok, <<2:32/little, 20904:16/little>>};
pack(srv, 20904, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20904:16/little,
       D_a_t_a/binary>>};
pack(cli, 20905, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20905:16/little,
       D_a_t_a/binary>>};
pack(srv, 20905, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20905:16/little,
       D_a_t_a/binary>>};
pack(cli, 20906, {}) ->
    {ok, <<2:32/little, 20906:16/little>>};
pack(srv, 20906, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20906:16/little,
       D_a_t_a/binary>>};
pack(cli, 20907, {V0_x, V0_y}) ->
    D_a_t_a = <<V0_x:8/little, V0_y:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20907:16/little,
       D_a_t_a/binary>>};
pack(srv, 20907, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20907:16/little,
       D_a_t_a/binary>>};
pack(cli, 20908, {}) ->
    {ok, <<2:32/little, 20908:16/little>>};
pack(srv, 20908, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20908:16/little,
       D_a_t_a/binary>>};
pack(cli, 20909, {}) ->
    {ok, <<2:32/little, 20909:16/little>>};
pack(srv, 20909, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20909:16/little,
       D_a_t_a/binary>>};
pack(cli, 20910, {}) ->
    {ok, <<2:32/little, 20910:16/little>>};
pack(srv, 20910, {V0_state, V0_times, V0_end_time}) ->
    D_a_t_a = <<V0_state:8/little, V0_times:8/little,
                V0_end_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20910:16/little,
       D_a_t_a/binary>>};
pack(cli, 20911, {}) ->
    {ok, <<2:32/little, 20911:16/little>>};
pack(srv, 20911,
     {V0_flag, V0_grade, V0_score, V0_reward}) ->
    D_a_t_a = <<V0_flag:8/little, V0_grade:16/little,
                V0_score:32/little, (length(V0_reward)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_bind:8/little, V1_num:32/little>>
                                 || {V1_base_id, V1_bind, V1_num}
                                        <- V0_reward]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20911:16/little,
       D_a_t_a/binary>>};
pack(cli, 20912, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20912:16/little,
       D_a_t_a/binary>>};
pack(srv, 20912, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20912:16/little,
       D_a_t_a/binary>>};
pack(cli, 20913, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20913:16/little,
       D_a_t_a/binary>>};
pack(srv, 20913, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20913:16/little,
       D_a_t_a/binary>>};
pack(cli, 20914, {}) ->
    {ok, <<2:32/little, 20914:16/little>>};
pack(srv, 20914, {}) ->
    {ok, <<2:32/little, 20914:16/little>>};
pack(cli, 20915, {}) ->
    {ok, <<2:32/little, 20915:16/little>>};
pack(srv, 20915,
     {V0_rid, V0_platform, V0_zone_id, V0_name}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20915:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 20900, _B0) -> {ok, {}};
unpack(cli, 20900, _B0) ->
    {V1_self_grade, _B1} = protocol:uint8(_B0),
    {V1_self_score, _B2} = protocol:uint32(_B1),
    {V1_name, _B3} = protocol:string(_B2),
    {V1_sex, _B4} = protocol:uint8(_B3),
    {V1_classes, _B5} = protocol:uint8(_B4),
    {V1_lev, _B6} = protocol:uint8(_B5),
    {V1_grade, _B7} = protocol:uint8(_B6),
    {V1_score, _B8} = protocol:uint32(_B7),
    {V1_ops_looks, _B15} = protocol:array(_B8,
                                          fun (_B9) ->
                                                  {V2_looks_type, _B10} =
                                                      protocol:uint32(_B9),
                                                  {V2_looks_mode, _B11} =
                                                      protocol:uint32(_B10),
                                                  {V2_looks_val, _B12} =
                                                      protocol:uint32(_B11),
                                                  {V2_looks_str, _B13} =
                                                      protocol:string(_B12),
                                                  {{V2_looks_type,
                                                    V2_looks_mode,
                                                    V2_looks_val,
                                                    V2_looks_str},
                                                   _B13}
                                          end),
    {V1_self_color, _B16} = protocol:uint8(_B15),
    {ok,
     {V1_self_grade,
      V1_self_score,
      V1_name,
      V1_sex,
      V1_classes,
      V1_lev,
      V1_grade,
      V1_score,
      V1_ops_looks,
      V1_self_color}};
unpack(srv, 20901, _B0) -> {ok, {}};
unpack(cli, 20901, _B0) ->
    {V1_who_turn, _B1} = protocol:uint8(_B0),
    {V1_end_time, _B2} = protocol:uint32(_B1),
    {V1_now_turn, _B3} = protocol:uint8(_B2),
    {V1_chess_list, _B9} = protocol:array(_B3,
                                          fun (_B4) ->
                                                  {V2_row, _B5} =
                                                      protocol:uint8(_B4),
                                                  {V2_col, _B6} =
                                                      protocol:uint8(_B5),
                                                  {V2_color, _B7} =
                                                      protocol:uint8(_B6),
                                                  {{V2_row, V2_col, V2_color},
                                                   _B7}
                                          end),
    {V1_can_use_list, _B14} = protocol:array(_B9,
                                             fun (_B10) ->
                                                     {V2_row, _B11} =
                                                         protocol:uint8(_B10),
                                                     {V2_col, _B12} =
                                                         protocol:uint8(_B11),
                                                     {{V2_row, V2_col}, _B12}
                                             end),
    {V1_chess_change_list, _B19} = protocol:array(_B14,
                                                  fun (_B15) ->
                                                          {V2_row, _B16} =
                                                              protocol:uint8(_B15),
                                                          {V2_col, _B17} =
                                                              protocol:uint8(_B16),
                                                          {{V2_row, V2_col},
                                                           _B17}
                                                  end),
    {V1_black_keep_ahead_round, _B20} =
        protocol:uint8(_B19),
    {V1_white_keep_ahead_round, _B21} =
        protocol:uint8(_B20),
    {V1_is_comeback, _B22} = protocol:uint8(_B21),
    {ok,
     {V1_who_turn,
      V1_end_time,
      V1_now_turn,
      V1_chess_list,
      V1_can_use_list,
      V1_chess_change_list,
      V1_black_keep_ahead_round,
      V1_white_keep_ahead_round,
      V1_is_comeback}};
unpack(srv, 20903, _B0) ->
    {V1_msg_num, _B1} = protocol:uint16(_B0),
    {ok, {V1_msg_num}};
unpack(cli, 20903, _B0) ->
    {V1_who_say, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_who_say, V1_msg}};
unpack(srv, 20904, _B0) -> {ok, {}};
unpack(cli, 20904, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 20905, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(cli, 20905, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 20906, _B0) -> {ok, {}};
unpack(cli, 20906, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 20907, _B0) ->
    {V1_x, _B1} = protocol:uint8(_B0),
    {V1_y, _B2} = protocol:uint8(_B1),
    {ok, {V1_x, V1_y}};
unpack(cli, 20907, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 20908, _B0) -> {ok, {}};
unpack(cli, 20908, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 20909, _B0) -> {ok, {}};
unpack(cli, 20909, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 20910, _B0) -> {ok, {}};
unpack(cli, 20910, _B0) ->
    {V1_state, _B1} = protocol:uint8(_B0),
    {V1_times, _B2} = protocol:uint8(_B1),
    {V1_end_time, _B3} = protocol:uint32(_B2),
    {ok, {V1_state, V1_times, V1_end_time}};
unpack(srv, 20911, _B0) -> {ok, {}};
unpack(cli, 20911, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_grade, _B2} = protocol:uint16(_B1),
    {V1_score, _B3} = protocol:uint32(_B2),
    {V1_reward, _B9} = protocol:array(_B3,
                                      fun (_B4) ->
                                              {V2_base_id, _B5} =
                                                  protocol:uint32(_B4),
                                              {V2_bind, _B6} =
                                                  protocol:uint8(_B5),
                                              {V2_num, _B7} =
                                                  protocol:uint32(_B6),
                                              {{V2_base_id, V2_bind, V2_num},
                                               _B7}
                                      end),
    {ok, {V1_flag, V1_grade, V1_score, V1_reward}};
unpack(srv, 20912, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 20912, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 20913, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 20913, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 20914, _B0) -> {ok, {}};
unpack(cli, 20914, _B0) -> {ok, {}};
unpack(srv, 20915, _B0) -> {ok, {}};
unpack(cli, 20915, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {ok, {V1_rid, V1_platform, V1_zone_id, V1_name}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

