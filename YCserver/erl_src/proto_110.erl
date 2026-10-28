-file("src/proto/proto_110.erl", 1).

-module(proto_110).

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

-file("src/proto/proto_110.erl", 14).

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

-file("src/proto/proto_110.erl", 15).

-file("inc/plot.hrl", 1).

-record(m_plot,
        {ver = 1 :: pos_integer(),
         plot_quest_ver = 1 :: pos_integer(),
         finished = [] :: [pos_integer()],
         play_list = [] :: [pos_integer()],
         do_list = [] :: [tuple()],
         combat_list = [] :: [tuple()],
         fun_icons = [] :: [pos_integer()],
         unit_list = [] :: [tuple()],
         map_list = [] :: [pos_integer()],
         guide_list = [] :: [pos_integer()],
         dun_id = 0 :: non_neg_integer(),
         hide_mode = 0 :: non_neg_integer(),
         scene = [] :: list(),
         dungeon = [] :: list(),
         quest_trace = 0 :: non_neg_integer()}).

-record(plot,
        {id :: undefined | non_neg_integer(),
         num = 0 :: non_neg_integer(),
         act_idx = 0 :: non_neg_integer()}).

-record(plot_trigger,
        {id = 0 :: non_neg_integer(),
         name = "" :: list(),
         lev = 0 :: non_neg_integer(),
         status = 1 :: 0 | 1,
         type = 1 :: 1 | 2,
         off_line = 0 :: 0..2,
         can_skip = 1 :: 0..1,
         hide_layer = 1 :: 0..1,
         res_list = [] :: [bitstring()],
         maps = [] :: [pos_integer()],
         num = 1 :: non_neg_integer(),
         event = [] :: [tuple()],
         vars = [] :: [tuple()],
         cond_logic = 'and' :: atom(),
         condition = [] :: [tuple()],
         action = [] :: [tuple()],
         lev_break_min_times = 0,
         lev_break_max_times = 1}).

-record(plot_act,
        {id = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         label :: undefined | atom(),
         time = 0 :: non_neg_integer(),
         mode = 0 :: non_neg_integer(),
         unit_id = 0 :: non_neg_integer(),
         unit_base_id = 0 :: non_neg_integer(),
         looks = [] :: list(),
         ext_info = [] :: [{pos_integer(), bitstring()}],
         battle_id = 0 :: non_neg_integer(),
         mapid = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         val = 0 :: non_neg_integer(),
         ext_val = 0 :: non_neg_integer(),
         res_id = 0 :: non_neg_integer(),
         color = "" :: bitstring(),
         msg = "" :: bitstring(),
         ext_msg = "" :: bitstring(),
         gain = [] :: [{pos_integer(), pos_integer()}],
         need_next = 0 :: 0..1,
         timeout = 0 :: non_neg_integer(),
         skip_do = 0 :: 0..1,
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer()}).

-record(plot_quest_revise_data,
        {ver = 0 :: non_neg_integer(),
         min_lev = 0 :: non_neg_integer(),
         max_lev = 0 :: non_neg_integer(),
         min_exp = 0 :: non_neg_integer(),
         pos :: undefined | tuple(),
         finish_quests = [] :: [pos_integer()],
         finish_reward_quests = [] :: [pos_integer()],
         finish_plots = [] :: [pos_integer()],
         open_plots = [] :: [pos_integer()],
         open_sys_list = [] :: [pos_integer()],
         open_map_list = [] :: [pos_integer()],
         skill_list = [] :: [pos_integer()],
         reward_list = [] :: list()}).

-record(plot_quest_unit,
        {label,
         id = 0,
         base_id = 0,
         pos,
         dir,
         act_type,
         is_rand_pos = 0}).

-file("src/proto/proto_110.erl", 16).

-file("inc/unit.hrl", 1).

-record(unit_order,
        {order :: undefined | move | guard | attack | atom(),
         type = 0 :: 0..2,
         arg :: undefined | tuple() | [tuple()],
         data :: undefined | term(),
         condition = [] :: list(),
         over :: undefined | defense | stop | atom()}).

-record(unit_data,
        {id = 0 :: pos_integer(),
         type = 1 :: non_neg_integer(),
         fun_type = 1 :: non_neg_integer(),
         desc = "",
         classes = 0,
         sex = 0,
         lev = 1,
         name = "" :: list(),
         activity = 0 :: 0..1,
         guide_lev = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         nature = 0 :: non_neg_integer(),
         disabled = "" :: bitstring(),
         condition = [] :: [tuple()],
         speed = 120 :: pos_integer(),
         lock = 0 :: 0 | 1,
         t_move = 3 :: pos_integer(),
         t_atk = 3 :: pos_integer(),
         range_trace = 200 :: pos_integer(),
         range_atk = 100 :: pos_integer(),
         gain = [] :: list(),
         formation = 1,
         formation_lev = 1,
         slave = [] :: list(),
         talk = [] :: list(),
         looks = [] :: list(),
         data = [] :: list(),
         def_status = defense :: defense | patrol | loaf}).

-record(unit,
        {id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 0 :: non_neg_integer(),
         type = 1 :: non_neg_integer(),
         fun_type = 1,
         name = "" :: list(),
         pid = 0 :: non_neg_integer() | pid(),
         lev = 1,
         classes = 0,
         sex = 0,
         activity = 0 :: 0..1,
         dun_info :: undefined | {pid(), pos_integer()},
         combat_pid = 0 :: non_neg_integer() | pid(),
         status = 0 :: non_neg_integer(),
         guide_lev = 0 :: non_neg_integer(),
         nature = 0 :: non_neg_integer(),
         disabled = "" :: list(),
         condition = [] :: [tuple()],
         speed = 180 :: pos_integer(),
         lock = 0 :: 0 | 1,
         range_trace = 200 :: pos_integer(),
         range_atk = 100 :: pos_integer(),
         defxy = {0, 0, 0} :: tuple(),
         def_status = defense :: defense | patrol | loaf,
         talk = [] :: list(),
         pos :: undefined | tuple(),
         data :: undefined | term(),
         looks = [] :: [tuple()],
         evt = [] :: [atom()],
         formation = 1,
         formation_lev = 1,
         slave = [] :: list(),
         prop = [] :: [{non_neg_integer(), string()}],
         order = [] :: list(),
         path = [] :: list(),
         ts = {1, 1, 1} ::
             {pos_integer(), pos_integer(), pos_integer()},
         t_move = 3 :: pos_integer(),
         t_atk = 3 :: pos_integer(),
         ai_id = 0,
         ai = {[], []} :: {list(), list()},
         attr,
         role_id = {0, "", 0}}).

-record(map_unit,
        {id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 0 :: non_neg_integer(),
         type = 1 :: pos_integer(),
         activity = 0 :: 0..1,
         status = 0 :: non_neg_integer(),
         classes = 0,
         sex = 0,
         guide_lev = 0 :: non_neg_integer(),
         name = "" :: list(),
         speed = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         gx = 0 :: non_neg_integer(),
         gy = 0 :: non_neg_integer(),
         looks = [] :: [tuple()],
         prop = [] :: [tuple()]}).

-record(plot_unit,
        {id = 0 :: pos_integer(),
         name = "" :: bitstring(),
         base_id = 0 :: non_neg_integer(),
         type = 1,
         fun_type = 1,
         dun_id = 0 :: non_neg_integer(),
         map = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         dir = 0 :: non_neg_integer(),
         act_type = "" :: bitstring(),
         looks = [] :: [tuple()],
         status = 0 :: non_neg_integer(),
         quest_id = 0 :: non_neg_integer(),
         quest_prog_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer()}).

-record(unit_statue,
        {type = 0,
         id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         looks = []}).

-file("src/proto/proto_110.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 11000, {}) ->
    {ok, <<2:32/little, 11000:16/little>>};
pack(srv, 11000, {}) ->
    {ok, <<2:32/little, 11000:16/little>>};
pack(cli, 11001, {V0_id, V0_val}) ->
    D_a_t_a = <<V0_id:32/little, V0_val:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11001:16/little,
       D_a_t_a/binary>>};
pack(srv, 11001, {}) ->
    {ok, <<2:32/little, 11001:16/little>>};
pack(cli, 11002, {}) ->
    {ok, <<2:32/little, 11002:16/little>>};
pack(srv, 11002, {}) ->
    {ok, <<2:32/little, 11002:16/little>>};
pack(cli, 11003, {}) ->
    {ok, <<2:32/little, 11003:16/little>>};
pack(srv, 11003, {V0_hide}) ->
    D_a_t_a = <<V0_hide:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11003:16/little,
       D_a_t_a/binary>>};
pack(cli, 11004, {V0_id, V0_type}) ->
    D_a_t_a = <<V0_id:32/little, V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11004:16/little,
       D_a_t_a/binary>>};
pack(srv, 11004, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11004:16/little,
       D_a_t_a/binary>>};
pack(cli, 11005, {}) ->
    {ok, <<2:32/little, 11005:16/little>>};
pack(srv, 11005, {V0_flag, V0_res_list}) ->
    D_a_t_a = <<V0_flag:8/little,
                (length(V0_res_list)):16/little,
                (list_to_binary([<<(protocol:pack(string,
                                                  V1_res))/binary>>
                                 || V1_res <- V0_res_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11005:16/little,
       D_a_t_a/binary>>};
pack(cli, 11006, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11006:16/little,
       D_a_t_a/binary>>};
pack(srv, 11006, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11006:16/little,
       D_a_t_a/binary>>};
pack(cli, 11007, {}) ->
    {ok, <<2:32/little, 11007:16/little>>};
pack(srv, 11007, {}) ->
    {ok, <<2:32/little, 11007:16/little>>};
pack(cli, 11010, {}) ->
    {ok, <<2:32/little, 11010:16/little>>};
pack(srv, 11010,
     {V0_id,
      V0_name,
      V0_can_skip,
      V0_hide_layer,
      V0_action_list}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_name))/binary,
                V0_can_skip:8/little, V0_hide_layer:8/little,
                (length(V0_action_list)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_type:16/little,
                                   V1_need_next:8/little, V1_time:32/little,
                                   V1_mode:32/signed-little,
                                   V1_unit_id:32/little,
                                   V1_unit_base_id:32/little,
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
                                   V1_battle_id:32/little, V1_mapid:32/little,
                                   V1_x:32/little, V1_y:32/little,
                                   V1_val:32/signed-little,
                                   V1_ext_val:32/signed-little,
                                   V1_res_id:32/little,
                                   (protocol:pack(string, V1_color))/binary,
                                   (protocol:pack(string, V1_msg))/binary,
                                   (protocol:pack(string, V1_ext_msg))/binary,
                                   (length(V1_ext_info)):16/little,
                                   (list_to_binary([<<V2_val:32/little,
                                                      (protocol:pack(string,
                                                                     V2_msg))/binary>>
                                                    || {V2_val, V2_msg}
                                                           <- V1_ext_info]))/binary,
                                   (length(V1_gain)):16/little,
                                   (list_to_binary([<<V2_id:32/little,
                                                      V2_value:32/little>>
                                                    || {V2_id, V2_value}
                                                           <- V1_gain]))/binary,
                                   V1_sex:8/little, V1_classes:8/little>>
                                 || #plot_act{id = V1_id, type = V1_type,
                                              need_next = V1_need_next,
                                              time = V1_time, mode = V1_mode,
                                              unit_id = V1_unit_id,
                                              unit_base_id = V1_unit_base_id,
                                              looks = V1_looks,
                                              battle_id = V1_battle_id,
                                              mapid = V1_mapid, x = V1_x,
                                              y = V1_y, val = V1_val,
                                              ext_val = V1_ext_val,
                                              res_id = V1_res_id,
                                              color = V1_color, msg = V1_msg,
                                              ext_msg = V1_ext_msg,
                                              ext_info = V1_ext_info,
                                              gain = V1_gain, sex = V1_sex,
                                              classes = V1_classes}
                                        <- V0_action_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11010:16/little,
       D_a_t_a/binary>>};
pack(cli, 11020, {}) ->
    {ok, <<2:32/little, 11020:16/little>>};
pack(srv, 11020, {V0_plot_id}) ->
    D_a_t_a = <<V0_plot_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11020:16/little,
       D_a_t_a/binary>>};
pack(cli, 11021, {}) ->
    {ok, <<2:32/little, 11021:16/little>>};
pack(srv, 11021,
     {{V0_rid, V0_platform, V0_r_zone_id}, V0_unit_list}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_r_zone_id:32/little,
                (length(V0_unit_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_base_id:32/little, V1_type:32/little,
                                   V1_fun_type:32/little, V1_dun_id:32/little,
                                   V1_map:32/little, V1_x:32/little,
                                   V1_y:32/little, V1_dir:32/little,
                                   (protocol:pack(string, V1_act_type))/binary,
                                   V1_quest_id:32/little,
                                   V1_quest_prog_id:32/little, V1_sex:32/little,
                                   V1_classes:32/little>>
                                 || #plot_unit{id = V1_id, name = V1_name,
                                               base_id = V1_base_id,
                                               type = V1_type,
                                               fun_type = V1_fun_type,
                                               dun_id = V1_dun_id, map = V1_map,
                                               x = V1_x, y = V1_y, dir = V1_dir,
                                               act_type = V1_act_type,
                                               quest_id = V1_quest_id,
                                               quest_prog_id = V1_quest_prog_id,
                                               sex = V1_sex,
                                               classes = V1_classes}
                                        <- V0_unit_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11021:16/little,
       D_a_t_a/binary>>};
pack(cli, 11022, {}) ->
    {ok, <<2:32/little, 11022:16/little>>};
pack(srv, 11022, {V0_type, V0_id}) ->
    D_a_t_a = <<V0_type:32/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11022:16/little,
       D_a_t_a/binary>>};
pack(cli, 11023, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11023:16/little,
       D_a_t_a/binary>>};
pack(srv, 11023, {V0_flag, V0_id}) ->
    D_a_t_a = <<V0_flag:8/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11023:16/little,
       D_a_t_a/binary>>};
pack(cli, 11024, {}) ->
    {ok, <<2:32/little, 11024:16/little>>};
pack(srv, 11024, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_num:32/little>>
                                 || {V1_id, V1_num} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11024:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 11000, _B0) -> {ok, {}};
unpack(cli, 11000, _B0) -> {ok, {}};
unpack(srv, 11001, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_val, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_val}};
unpack(cli, 11001, _B0) -> {ok, {}};
unpack(srv, 11002, _B0) -> {ok, {}};
unpack(cli, 11002, _B0) -> {ok, {}};
unpack(srv, 11003, _B0) -> {ok, {}};
unpack(cli, 11003, _B0) ->
    {V1_hide, _B1} = protocol:uint8(_B0),
    {ok, {V1_hide}};
unpack(srv, 11004, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {ok, {V1_id, V1_type}};
unpack(cli, 11004, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(srv, 11005, _B0) -> {ok, {}};
unpack(cli, 11005, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_res_list, _B5} = protocol:array(_B1,
                                        fun (_B2) ->
                                                {V2_res, _B3} =
                                                    protocol:string(_B2),
                                                {{V2_res}, _B3}
                                        end),
    {ok, {V1_flag, V1_res_list}};
unpack(srv, 11006, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 11006, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(srv, 11007, _B0) -> {ok, {}};
unpack(cli, 11007, _B0) -> {ok, {}};
unpack(srv, 11010, _B0) -> {ok, {}};
unpack(cli, 11010, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_name, _B2} = protocol:string(_B1),
    {V1_can_skip, _B3} = protocol:uint8(_B2),
    {V1_hide_layer, _B4} = protocol:uint8(_B3),
    {V1_action_list, _B43} = protocol:array(_B4,
                                            fun (_B5) ->
                                                    {V2_id, _B6} =
                                                        protocol:uint32(_B5),
                                                    {V2_type, _B7} =
                                                        protocol:uint16(_B6),
                                                    {V2_need_next, _B8} =
                                                        protocol:uint8(_B7),
                                                    {V2_time, _B9} =
                                                        protocol:uint32(_B8),
                                                    {V2_mode, _B10} =
                                                        protocol:int32(_B9),
                                                    {V2_unit_id, _B11} =
                                                        protocol:uint32(_B10),
                                                    {V2_unit_base_id, _B12} =
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
                                                    {V2_battle_id, _B20} =
                                                        protocol:uint32(_B19),
                                                    {V2_mapid, _B21} =
                                                        protocol:uint32(_B20),
                                                    {V2_x, _B22} =
                                                        protocol:uint32(_B21),
                                                    {V2_y, _B23} =
                                                        protocol:uint32(_B22),
                                                    {V2_val, _B24} =
                                                        protocol:int32(_B23),
                                                    {V2_ext_val, _B25} =
                                                        protocol:int32(_B24),
                                                    {V2_res_id, _B26} =
                                                        protocol:uint32(_B25),
                                                    {V2_color, _B27} =
                                                        protocol:string(_B26),
                                                    {V2_msg, _B28} =
                                                        protocol:string(_B27),
                                                    {V2_ext_msg, _B29} =
                                                        protocol:string(_B28),
                                                    {V2_ext_info, _B34} =
                                                        protocol:array(_B29,
                                                                       fun
                                                                           (_B30) ->
                                                                               {V3_val,
                                                                                _B31} =
                                                                                   protocol:uint32(_B30),
                                                                               {V3_msg,
                                                                                _B32} =
                                                                                   protocol:string(_B31),
                                                                               {{V3_val,
                                                                                 V3_msg},
                                                                                _B32}
                                                                       end),
                                                    {V2_gain, _B39} =
                                                        protocol:array(_B34,
                                                                       fun
                                                                           (_B35) ->
                                                                               {V3_id,
                                                                                _B36} =
                                                                                   protocol:uint32(_B35),
                                                                               {V3_value,
                                                                                _B37} =
                                                                                   protocol:uint32(_B36),
                                                                               {{V3_id,
                                                                                 V3_value},
                                                                                _B37}
                                                                       end),
                                                    {V2_sex, _B40} =
                                                        protocol:uint8(_B39),
                                                    {V2_classes, _B41} =
                                                        protocol:uint8(_B40),
                                                    {{V2_id,
                                                      V2_type,
                                                      V2_need_next,
                                                      V2_time,
                                                      V2_mode,
                                                      V2_unit_id,
                                                      V2_unit_base_id,
                                                      V2_looks,
                                                      V2_battle_id,
                                                      V2_mapid,
                                                      V2_x,
                                                      V2_y,
                                                      V2_val,
                                                      V2_ext_val,
                                                      V2_res_id,
                                                      V2_color,
                                                      V2_msg,
                                                      V2_ext_msg,
                                                      V2_ext_info,
                                                      V2_gain,
                                                      V2_sex,
                                                      V2_classes},
                                                     _B41}
                                            end),
    {ok,
     {V1_id,
      V1_name,
      V1_can_skip,
      V1_hide_layer,
      V1_action_list}};
unpack(srv, 11020, _B0) -> {ok, {}};
unpack(cli, 11020, _B0) ->
    {V1_plot_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_plot_id}};
unpack(srv, 11021, _B0) -> {ok, {}};
unpack(cli, 11021, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_r_zone_id, _B3} = protocol:uint32(_B2),
    {V1_unit_list, _B21} = protocol:array(_B3,
                                          fun (_B4) ->
                                                  {V2_id, _B5} =
                                                      protocol:uint32(_B4),
                                                  {V2_name, _B6} =
                                                      protocol:string(_B5),
                                                  {V2_base_id, _B7} =
                                                      protocol:uint32(_B6),
                                                  {V2_type, _B8} =
                                                      protocol:uint32(_B7),
                                                  {V2_fun_type, _B9} =
                                                      protocol:uint32(_B8),
                                                  {V2_dun_id, _B10} =
                                                      protocol:uint32(_B9),
                                                  {V2_map, _B11} =
                                                      protocol:uint32(_B10),
                                                  {V2_x, _B12} =
                                                      protocol:uint32(_B11),
                                                  {V2_y, _B13} =
                                                      protocol:uint32(_B12),
                                                  {V2_dir, _B14} =
                                                      protocol:uint32(_B13),
                                                  {V2_act_type, _B15} =
                                                      protocol:string(_B14),
                                                  {V2_quest_id, _B16} =
                                                      protocol:uint32(_B15),
                                                  {V2_quest_prog_id, _B17} =
                                                      protocol:uint32(_B16),
                                                  {V2_sex, _B18} =
                                                      protocol:uint32(_B17),
                                                  {V2_classes, _B19} =
                                                      protocol:uint32(_B18),
                                                  {{V2_id,
                                                    V2_name,
                                                    V2_base_id,
                                                    V2_type,
                                                    V2_fun_type,
                                                    V2_dun_id,
                                                    V2_map,
                                                    V2_x,
                                                    V2_y,
                                                    V2_dir,
                                                    V2_act_type,
                                                    V2_quest_id,
                                                    V2_quest_prog_id,
                                                    V2_sex,
                                                    V2_classes},
                                                   _B19}
                                          end),
    {ok, {V1_rid, V1_platform, V1_r_zone_id, V1_unit_list}};
unpack(srv, 11022, _B0) -> {ok, {}};
unpack(cli, 11022, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_type, V1_id}};
unpack(srv, 11023, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 11023, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_flag, V1_id}};
unpack(srv, 11024, _B0) -> {ok, {}};
unpack(cli, 11024, _B0) ->
    {V1_list, _B5} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_id, _B2} = protocol:uint32(_B1),
                                            {V2_num, _B3} =
                                                protocol:uint32(_B2),
                                            {{V2_id, V2_num}, _B3}
                                    end),
    {ok, {V1_list}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

