-file("src/proto/proto_188.erl", 1).

-module(proto_188).

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

-file("src/proto/proto_188.erl", 14).

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

-file("src/proto/proto_188.erl", 15).

-file("inc/maze.hrl", 1).

-record(m_maze,
        {ver = 4,
         status = 0,
         dungeon = 0,
         double = 0,
         emptys = [],
         opens = [],
         datas = [],
         times = 0,
         piece = [],
         time = 0,
         others = [],
         pass = [],
         piece_other = [],
         events = []}).

-record(maze_open,
        {pos = {0, 0},
         ver = 1,
         x = 0,
         y = 0,
         unique = 0,
         type = 0,
         id = 0,
         hard = 0,
         times = 0,
         flag = 0,
         special_id = 0,
         reward = [],
         show = 0}).

-record(maze_event,
        {e_pos = {0, 0},
         e_x = 0,
         e_y = 0,
         e_id = 0,
         e_type = 0,
         e_unique = 0,
         e_reward = [],
         e_flag = 0,
         e_list = []}).

-file("src/proto/proto_188.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 18800, {}) ->
    {ok, <<2:32/little, 18800:16/little>>};
pack(srv, 18800,
     {#m_maze{status = V0_status, dungeon = V0_dungeon,
              times = V0_times, double = V0_double, piece = V0_piece,
              opens = V0_opens, piece_other = V0_piece_other,
              events = V0_events}}) ->
    D_a_t_a = <<V0_status:8/little, V0_dungeon:32/little,
                V0_times:16/little, V0_double:8/little,
                (length(V0_piece)):16/little,
                (list_to_binary([<<V1_pos:8/little>>
                                 || V1_pos <- V0_piece]))/binary,
                (length(V0_opens)):16/little,
                (list_to_binary([<<V1_x:8/little, V1_y:8/little,
                                   V1_type:8/little, V1_id:32/little,
                                   V1_hard:16/little, V1_times:16/little,
                                   V1_flag:16/little, V1_special_id:16/little,
                                   (length(V1_reward)):16/little,
                                   (list_to_binary([<<V2_base_id:32/little,
                                                      V2_bind:8/little,
                                                      V2_num:32/little>>
                                                    || {V2_base_id,
                                                        V2_bind,
                                                        V2_num}
                                                           <- V1_reward]))/binary,
                                   V1_show:8/little>>
                                 || #maze_open{x = V1_x, y = V1_y,
                                               type = V1_type, id = V1_id,
                                               hard = V1_hard, times = V1_times,
                                               flag = V1_flag,
                                               special_id = V1_special_id,
                                               reward = V1_reward,
                                               show = V1_show}
                                        <- V0_opens]))/binary,
                (length(V0_piece_other)):16/little,
                (list_to_binary([<<V1_piece_x:8/little,
                                   V1_piece_y:8/little, V1_piece_num:8/little>>
                                 || {{V1_piece_x, V1_piece_y}, V1_piece_num}
                                        <- V0_piece_other]))/binary,
                (length(V0_events)):16/little,
                (list_to_binary([<<V1_e_x:8/little, V1_e_y:8/little,
                                   V1_e_type:8/little, V1_e_id:32/little,
                                   V1_e_flag:16/little,
                                   (length(V1_e_reward)):16/little,
                                   (list_to_binary([<<V2_e_base_id:32/little,
                                                      V2_e_bind:8/little,
                                                      V2_e_num:32/little>>
                                                    || {V2_e_base_id,
                                                        V2_e_bind,
                                                        V2_e_num}
                                                           <- V1_e_reward]))/binary>>
                                 || #maze_event{e_x = V1_e_x, e_y = V1_e_y,
                                                e_type = V1_e_type,
                                                e_id = V1_e_id,
                                                e_flag = V1_e_flag,
                                                e_reward = V1_e_reward}
                                        <- V0_events]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18800:16/little,
       D_a_t_a/binary>>};
pack(cli, 18801, {V0_x, V0_y}) ->
    D_a_t_a = <<V0_x:8/little, V0_y:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18801:16/little,
       D_a_t_a/binary>>};
pack(srv, 18801, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18801:16/little,
       D_a_t_a/binary>>};
pack(cli, 18802, {}) ->
    {ok, <<2:32/little, 18802:16/little>>};
pack(srv, 18802, {V0_start_x, V0_start_y, V0_opens}) ->
    D_a_t_a = <<V0_start_x:8/little, V0_start_y:8/little,
                (length(V0_opens)):16/little,
                (list_to_binary([<<V1_end_x:8/little,
                                   V1_end_y:8/little>>
                                 || {V1_end_x, V1_end_y}
                                        <- V0_opens]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18802:16/little,
       D_a_t_a/binary>>};
pack(cli, 18803, {}) ->
    {ok, <<2:32/little, 18803:16/little>>};
pack(srv, 18803, {}) ->
    {ok, <<2:32/little, 18803:16/little>>};
pack(cli, 18804, {V0_x, V0_y, V0_id}) ->
    D_a_t_a = <<V0_x:8/little, V0_y:8/little,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18804:16/little,
       D_a_t_a/binary>>};
pack(srv, 18804, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18804:16/little,
       D_a_t_a/binary>>};
pack(cli, 18805, {V0_x, V0_y, V0_id}) ->
    D_a_t_a = <<V0_x:8/little, V0_y:8/little,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18805:16/little,
       D_a_t_a/binary>>};
pack(srv, 18805, {V0_flag, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18805:16/little,
       D_a_t_a/binary>>};
pack(cli, 18806, {V0_x, V0_y}) ->
    D_a_t_a = <<V0_x:8/little, V0_y:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18806:16/little,
       D_a_t_a/binary>>};
pack(srv, 18806, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18806:16/little,
       D_a_t_a/binary>>};
pack(cli, 18807, {V0_x, V0_y}) ->
    D_a_t_a = <<V0_x:8/little, V0_y:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18807:16/little,
       D_a_t_a/binary>>};
pack(srv, 18807, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18807:16/little,
       D_a_t_a/binary>>};
pack(cli, 18808, {}) ->
    {ok, <<2:32/little, 18808:16/little>>};
pack(srv, 18808, {V0_flag, V0_msg, V0_reward}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                (length(V0_reward)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_num:16/little>>
                                 || {V1_base_id, V1_num}
                                        <- V0_reward]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18808:16/little,
       D_a_t_a/binary>>};
pack(cli, 18809, {}) ->
    {ok, <<2:32/little, 18809:16/little>>};
pack(srv, 18809, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18809:16/little,
       D_a_t_a/binary>>};
pack(cli, 18810, {}) ->
    {ok, <<2:32/little, 18810:16/little>>};
pack(srv, 18810, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18810:16/little,
       D_a_t_a/binary>>};
pack(cli, 18811, {}) ->
    {ok, <<2:32/little, 18811:16/little>>};
pack(srv, 18811, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18811:16/little,
       D_a_t_a/binary>>};
pack(cli, 18812, {}) ->
    {ok, <<2:32/little, 18812:16/little>>};
pack(srv, 18812, {V0_start_x, V0_start_y, V0_opens}) ->
    D_a_t_a = <<V0_start_x:8/little, V0_start_y:8/little,
                (length(V0_opens)):16/little,
                (list_to_binary([<<V1_end_x:8/little, V1_end_y:8/little,
                                   V1_piece:8/little>>
                                 || {{V1_end_x, V1_end_y}, V1_piece}
                                        <- V0_opens]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18812:16/little,
       D_a_t_a/binary>>};
pack(cli, 18813, {}) ->
    {ok, <<2:32/little, 18813:16/little>>};
pack(srv, 18813, {}) ->
    {ok, <<2:32/little, 18813:16/little>>};
pack(cli, 18814, {V0_x, V0_y}) ->
    D_a_t_a = <<V0_x:8/little, V0_y:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18814:16/little,
       D_a_t_a/binary>>};
pack(srv, 18814, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18814:16/little,
       D_a_t_a/binary>>};
pack(cli, 18815, {V0_x, V0_y}) ->
    D_a_t_a = <<V0_x:8/little, V0_y:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18815:16/little,
       D_a_t_a/binary>>};
pack(srv, 18815, {V0_exp, V0_pet_exp, V0_x, V0_y}) ->
    D_a_t_a = <<V0_exp:32/little, V0_pet_exp:32/little,
                V0_x:8/little, V0_y:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18815:16/little,
       D_a_t_a/binary>>};
pack(cli, 18816, {V0_x, V0_y}) ->
    D_a_t_a = <<V0_x:8/little, V0_y:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18816:16/little,
       D_a_t_a/binary>>};
pack(srv, 18816, {V0_flag, V0_msg, V0_x, V0_y}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary, V0_x:8/little,
                V0_y:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18816:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 18800, _B0) -> {ok, {}};
unpack(cli, 18800, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_dungeon, _B2} = protocol:uint32(_B1),
    {V1_times, _B3} = protocol:uint16(_B2),
    {V1_double, _B4} = protocol:uint8(_B3),
    {V1_piece, _B8} = protocol:array(_B4,
                                     fun (_B5) ->
                                             {V2_pos, _B6} =
                                                 protocol:uint8(_B5),
                                             {{V2_pos}, _B6}
                                     end),
    {V1_opens, _B26} = protocol:array(_B8,
                                      fun (_B9) ->
                                              {V2_x, _B10} =
                                                  protocol:uint8(_B9),
                                              {V2_y, _B11} =
                                                  protocol:uint8(_B10),
                                              {V2_type, _B12} =
                                                  protocol:uint8(_B11),
                                              {V2_id, _B13} =
                                                  protocol:uint32(_B12),
                                              {V2_hard, _B14} =
                                                  protocol:uint16(_B13),
                                              {V2_times, _B15} =
                                                  protocol:uint16(_B14),
                                              {V2_flag, _B16} =
                                                  protocol:uint16(_B15),
                                              {V2_special_id, _B17} =
                                                  protocol:uint16(_B16),
                                              {V2_reward, _B23} =
                                                  protocol:array(_B17,
                                                                 fun (_B18) ->
                                                                         {V3_base_id,
                                                                          _B19} =
                                                                             protocol:uint32(_B18),
                                                                         {V3_bind,
                                                                          _B20} =
                                                                             protocol:uint8(_B19),
                                                                         {V3_num,
                                                                          _B21} =
                                                                             protocol:uint32(_B20),
                                                                         {{V3_base_id,
                                                                           V3_bind,
                                                                           V3_num},
                                                                          _B21}
                                                                 end),
                                              {V2_show, _B24} =
                                                  protocol:uint8(_B23),
                                              {{V2_x,
                                                V2_y,
                                                V2_type,
                                                V2_id,
                                                V2_hard,
                                                V2_times,
                                                V2_flag,
                                                V2_special_id,
                                                V2_reward,
                                                V2_show},
                                               _B24}
                                      end),
    {V1_piece_other, _B32} = protocol:array(_B26,
                                            fun (_B27) ->
                                                    {V2_piece_x, _B28} =
                                                        protocol:uint8(_B27),
                                                    {V2_piece_y, _B29} =
                                                        protocol:uint8(_B28),
                                                    {V2_piece_num, _B30} =
                                                        protocol:uint8(_B29),
                                                    {{V2_piece_x,
                                                      V2_piece_y,
                                                      V2_piece_num},
                                                     _B30}
                                            end),
    {V1_events, _B46} = protocol:array(_B32,
                                       fun (_B33) ->
                                               {V2_e_x, _B34} =
                                                   protocol:uint8(_B33),
                                               {V2_e_y, _B35} =
                                                   protocol:uint8(_B34),
                                               {V2_e_type, _B36} =
                                                   protocol:uint8(_B35),
                                               {V2_e_id, _B37} =
                                                   protocol:uint32(_B36),
                                               {V2_e_flag, _B38} =
                                                   protocol:uint16(_B37),
                                               {V2_e_reward, _B44} =
                                                   protocol:array(_B38,
                                                                  fun (_B39) ->
                                                                          {V3_e_base_id,
                                                                           _B40} =
                                                                              protocol:uint32(_B39),
                                                                          {V3_e_bind,
                                                                           _B41} =
                                                                              protocol:uint8(_B40),
                                                                          {V3_e_num,
                                                                           _B42} =
                                                                              protocol:uint32(_B41),
                                                                          {{V3_e_base_id,
                                                                            V3_e_bind,
                                                                            V3_e_num},
                                                                           _B42}
                                                                  end),
                                               {{V2_e_x,
                                                 V2_e_y,
                                                 V2_e_type,
                                                 V2_e_id,
                                                 V2_e_flag,
                                                 V2_e_reward},
                                                _B44}
                                       end),
    {ok,
     {V1_status,
      V1_dungeon,
      V1_times,
      V1_double,
      V1_piece,
      V1_opens,
      V1_piece_other,
      V1_events}};
unpack(srv, 18801, _B0) ->
    {V1_x, _B1} = protocol:uint8(_B0),
    {V1_y, _B2} = protocol:uint8(_B1),
    {ok, {V1_x, V1_y}};
unpack(cli, 18801, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 18802, _B0) -> {ok, {}};
unpack(cli, 18802, _B0) ->
    {V1_start_x, _B1} = protocol:uint8(_B0),
    {V1_start_y, _B2} = protocol:uint8(_B1),
    {V1_opens, _B7} = protocol:array(_B2,
                                     fun (_B3) ->
                                             {V2_end_x, _B4} =
                                                 protocol:uint8(_B3),
                                             {V2_end_y, _B5} =
                                                 protocol:uint8(_B4),
                                             {{V2_end_x, V2_end_y}, _B5}
                                     end),
    {ok, {V1_start_x, V1_start_y, V1_opens}};
unpack(srv, 18803, _B0) -> {ok, {}};
unpack(cli, 18803, _B0) -> {ok, {}};
unpack(srv, 18804, _B0) ->
    {V1_x, _B1} = protocol:uint8(_B0),
    {V1_y, _B2} = protocol:uint8(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_x, V1_y, V1_id}};
unpack(cli, 18804, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 18805, _B0) ->
    {V1_x, _B1} = protocol:uint8(_B0),
    {V1_y, _B2} = protocol:uint8(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_x, V1_y, V1_id}};
unpack(cli, 18805, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_id}};
unpack(srv, 18806, _B0) ->
    {V1_x, _B1} = protocol:uint8(_B0),
    {V1_y, _B2} = protocol:uint8(_B1),
    {ok, {V1_x, V1_y}};
unpack(cli, 18806, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 18807, _B0) ->
    {V1_x, _B1} = protocol:uint8(_B0),
    {V1_y, _B2} = protocol:uint8(_B1),
    {ok, {V1_x, V1_y}};
unpack(cli, 18807, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 18808, _B0) -> {ok, {}};
unpack(cli, 18808, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_reward, _B7} = protocol:array(_B2,
                                      fun (_B3) ->
                                              {V2_base_id, _B4} =
                                                  protocol:uint32(_B3),
                                              {V2_num, _B5} =
                                                  protocol:uint16(_B4),
                                              {{V2_base_id, V2_num}, _B5}
                                      end),
    {ok, {V1_flag, V1_msg, V1_reward}};
unpack(srv, 18809, _B0) -> {ok, {}};
unpack(cli, 18809, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 18810, _B0) -> {ok, {}};
unpack(cli, 18810, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 18811, _B0) -> {ok, {}};
unpack(cli, 18811, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 18812, _B0) -> {ok, {}};
unpack(cli, 18812, _B0) ->
    {V1_start_x, _B1} = protocol:uint8(_B0),
    {V1_start_y, _B2} = protocol:uint8(_B1),
    {V1_opens, _B8} = protocol:array(_B2,
                                     fun (_B3) ->
                                             {V2_end_x, _B4} =
                                                 protocol:uint8(_B3),
                                             {V2_end_y, _B5} =
                                                 protocol:uint8(_B4),
                                             {V2_piece, _B6} =
                                                 protocol:uint8(_B5),
                                             {{V2_end_x, V2_end_y, V2_piece},
                                              _B6}
                                     end),
    {ok, {V1_start_x, V1_start_y, V1_opens}};
unpack(srv, 18813, _B0) -> {ok, {}};
unpack(cli, 18813, _B0) -> {ok, {}};
unpack(srv, 18814, _B0) ->
    {V1_x, _B1} = protocol:uint8(_B0),
    {V1_y, _B2} = protocol:uint8(_B1),
    {ok, {V1_x, V1_y}};
unpack(cli, 18814, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 18815, _B0) ->
    {V1_x, _B1} = protocol:uint8(_B0),
    {V1_y, _B2} = protocol:uint8(_B1),
    {ok, {V1_x, V1_y}};
unpack(cli, 18815, _B0) ->
    {V1_exp, _B1} = protocol:uint32(_B0),
    {V1_pet_exp, _B2} = protocol:uint32(_B1),
    {V1_x, _B3} = protocol:uint8(_B2),
    {V1_y, _B4} = protocol:uint8(_B3),
    {ok, {V1_exp, V1_pet_exp, V1_x, V1_y}};
unpack(srv, 18816, _B0) ->
    {V1_x, _B1} = protocol:uint8(_B0),
    {V1_y, _B2} = protocol:uint8(_B1),
    {ok, {V1_x, V1_y}};
unpack(cli, 18816, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_x, _B3} = protocol:uint8(_B2),
    {V1_y, _B4} = protocol:uint8(_B3),
    {ok, {V1_flag, V1_msg, V1_x, V1_y}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

