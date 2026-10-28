-file("src/proto/proto_211.erl", 1).

-module(proto_211).

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

-file("src/proto/proto_211.erl", 14).

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

-file("src/proto/proto_211.erl", 15).

-file("inc/canyon_summit.hrl", 1).

-record(canyon_summit_role,
        {id = {0, "", 0} :: tuple(),
         ver = 1,
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         win = 0 :: non_neg_integer(),
         lost = 0 :: non_neg_integer(),
         group_id = 0 :: non_neg_integer(),
         fight = 0 :: non_neg_integer(),
         movability = 1000 :: non_neg_integer(),
         match_id = 0 :: non_neg_integer(),
         side = 1,
         pid :: undefined | reference(),
         last_killed = 0 :: non_neg_integer(),
         picked = 0 :: non_neg_integer(),
         last_win = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         operating_unit = 0 :: 0 | tuple(),
         last_operated = 0 :: non_neg_integer(),
         attacked_unit = 0 :: non_neg_integer(),
         guarded_unit = 0 :: non_neg_integer(),
         cannon_attacked = 0 :: non_neg_integer(),
         cannon_used = 0 :: non_neg_integer(),
         guarding_unit = 0 :: non_neg_integer(),
         operating_num = 0 :: non_neg_integer()}).

-record(canyon_summit_side,
        {id = {0, 0, 0} :: {integer(), integer(), integer()},
         win = 0 :: non_neg_integer(),
         lost = 0 :: non_neg_integer(),
         movability = 0 :: non_neg_integer(),
         member_num = 0 :: non_neg_integer(),
         members = [],
         remain_num = 0,
         map_id = 0 :: non_neg_integer(),
         match_pid = 0 :: pid(),
         time = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         duration = 0 :: non_neg_integer(),
         attacked_unit = 0 :: non_neg_integer(),
         guarded_unit = 0 :: non_neg_integer(),
         remain_unit = 3 :: non_neg_integer(),
         subsidize_buff = [] :: list(),
         all_fc = 0 :: non_neg_integer()}).

-record(canyon_summit_team,
        {ver = 1 :: pos_integer(),
         match_group = 0,
         leader = {0, "", 0},
         member_num = 0,
         members = [],
         fight_capacity = 0,
         team_side = 0,
         battle_id = 0,
         match_pid = undefined :: pid(),
         map_id = 0}).

-record(canyon_summit_match,
        {id = {0, 0} :: {non_neg_integer(), non_neg_integer()},
         pid :: undefined | pid(),
         map_id = 0 :: non_neg_integer(),
         map_pid = 0 :: pid(),
         battle_id = 0 :: non_neg_integer(),
         battle_pid = 0 :: pid(),
         win_side = 0,
         combat_time = 0,
         is_judge = false,
         cannon_ready = false,
         time = 0 :: non_neg_integer()}).

-record(canyon_summit_info,
        {id = {0, 0},
         group_id = 0,
         match_id = 0,
         map_id = 0,
         match_pid = 0,
         black_num = 0,
         red_num = 0,
         black_fc = 0,
         red_fc = 0,
         black_team_num = 0,
         red_team_num = 0}).

-record(canyon_summit_unit,
        {id = {0, 0, 0} :: tuple(),
         match_id = 0 :: non_neg_integer(),
         group_id = 0 :: non_neg_integer(),
         battle_id = 0 :: non_neg_integer(),
         side = 0,
         duration = 1000 :: non_neg_integer(),
         operators = [] :: list(),
         last_operated = 0 :: non_neg_integer()}).

-record(canyon_summit_operator,
        {id = {0, "", 0} :: tuple(),
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         side = 0,
         timeout = 0 :: non_neg_integer()}).

-record(canyon_summit_result,
        {id = {0, 0},
         red_fc = 0,
         red_team_num = 0,
         red_role_num = 0,
         black_fc = 0,
         black_team_num = 0,
         black_role_num = 0,
         red_acc_team = 0,
         black_acc_team = 0,
         red_acc_role = 0,
         black_acc_role = 0}).

-file("src/proto/proto_211.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 21100, {}) ->
    {ok, <<2:32/little, 21100:16/little>>};
pack(srv, 21100, {V0_status, V0_timeout}) ->
    D_a_t_a = <<V0_status:8/little, V0_timeout:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 21100:16/little,
       D_a_t_a/binary>>};
pack(cli, 21101, {}) ->
    {ok, <<2:32/little, 21101:16/little>>};
pack(srv, 21101, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 21101:16/little,
       D_a_t_a/binary>>};
pack(cli, 21102, {}) ->
    {ok, <<2:32/little, 21102:16/little>>};
pack(srv, 21102, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 21102:16/little,
       D_a_t_a/binary>>};
pack(cli, 21103, {}) ->
    {ok, <<2:32/little, 21103:16/little>>};
pack(srv, 21103, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 21103:16/little,
       D_a_t_a/binary>>};
pack(cli, 21104, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 21104:16/little,
       D_a_t_a/binary>>};
pack(srv, 21104, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 21104:16/little,
       D_a_t_a/binary>>};
pack(cli, 21105, {}) ->
    {ok, <<2:32/little, 21105:16/little>>};
pack(srv, 21105,
     {#canyon_summit_role{movability = V0_movability,
                          win = V0_win, side = V0_side}}) ->
    D_a_t_a = <<V0_movability:32/little, V0_win:32/little,
                V0_side:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 21105:16/little,
       D_a_t_a/binary>>};
pack(cli, 21106, {}) ->
    {ok, <<2:32/little, 21106:16/little>>};
pack(srv, 21106, {V0_canyon_summit_side}) ->
    D_a_t_a = <<(length(V0_canyon_summit_side)):16/little,
                (list_to_binary([<<V1_group_id:8/little,
                                   V1_match_id:8/little, V1_side_id:8/little,
                                   V1_win:32/little, V1_lost:32/little,
                                   V1_is_win:8/little, V1_member_num:32/little,
                                   V1_remain_num:32/little,
                                   V1_movability:32/little, V1_score:32/little,
                                   V1_guarded_unit:32/little,
                                   V1_attacked_unit:32/little,
                                   V1_remain_unit:8/little>>
                                 || #canyon_summit_side{id =
                                                            {V1_group_id,
                                                             V1_match_id,
                                                             V1_side_id},
                                                        win = V1_win,
                                                        lost = V1_lost,
                                                        is_win = V1_is_win,
                                                        member_num =
                                                            V1_member_num,
                                                        remain_num =
                                                            V1_remain_num,
                                                        movability =
                                                            V1_movability,
                                                        score = V1_score,
                                                        guarded_unit =
                                                            V1_guarded_unit,
                                                        attacked_unit =
                                                            V1_attacked_unit,
                                                        remain_unit =
                                                            V1_remain_unit}
                                        <- V0_canyon_summit_side]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 21106:16/little,
       D_a_t_a/binary>>};
pack(cli, 21107, {}) ->
    {ok, <<2:32/little, 21107:16/little>>};
pack(srv, 21107, {V0_canyon_summit_role}) ->
    D_a_t_a = <<(length(V0_canyon_summit_role)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little, V1_side:8/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:8/little, V1_sex:8/little,
                                   V1_classes:8/little, V1_win:32/little,
                                   V1_score:32/little, V1_movability:32/little>>
                                 || #canyon_summit_role{id =
                                                            {V1_rid,
                                                             V1_platform,
                                                             V1_zone_id},
                                                        side = V1_side,
                                                        name = V1_name,
                                                        lev = V1_lev,
                                                        sex = V1_sex,
                                                        classes = V1_classes,
                                                        win = V1_win,
                                                        score = V1_score,
                                                        movability =
                                                            V1_movability}
                                        <- V0_canyon_summit_role]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 21107:16/little,
       D_a_t_a/binary>>};
pack(cli, 21108, {}) ->
    {ok, <<2:32/little, 21108:16/little>>};
pack(srv, 21108, {V0_canyon_summit_role}) ->
    D_a_t_a = <<(length(V0_canyon_summit_role)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:8/little, V1_sex:8/little,
                                   V1_classes:8/little, V1_win:32/little,
                                   V1_score:32/little, V1_movability:32/little>>
                                 || #canyon_summit_role{id =
                                                            {V1_rid,
                                                             V1_platform,
                                                             V1_zone_id},
                                                        name = V1_name,
                                                        lev = V1_lev,
                                                        sex = V1_sex,
                                                        classes = V1_classes,
                                                        win = V1_win,
                                                        score = V1_score,
                                                        movability =
                                                            V1_movability}
                                        <- V0_canyon_summit_role]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 21108:16/little,
       D_a_t_a/binary>>};
pack(cli, 21109, {}) ->
    {ok, <<2:32/little, 21109:16/little>>};
pack(srv, 21109, {V0_type}) ->
    D_a_t_a = <<V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 21109:16/little,
       D_a_t_a/binary>>};
pack(cli, 21110, {V0_battle_id, V0_id}) ->
    D_a_t_a = <<V0_battle_id:32/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 21110:16/little,
       D_a_t_a/binary>>};
pack(srv, 21110, {V0_flag, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 21110:16/little,
       D_a_t_a/binary>>};
pack(cli, 21111, {V0_battle_id, V0_id}) ->
    D_a_t_a = <<V0_battle_id:32/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 21111:16/little,
       D_a_t_a/binary>>};
pack(srv, 21111, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 21111:16/little,
       D_a_t_a/binary>>};
pack(cli, 21112, {}) ->
    {ok, <<2:32/little, 21112:16/little>>};
pack(srv, 21112, {V0_flag, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 21112:16/little,
       D_a_t_a/binary>>};
pack(cli, 21113, {}) ->
    {ok, <<2:32/little, 21113:16/little>>};
pack(srv, 21113, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 21113:16/little,
       D_a_t_a/binary>>};
pack(cli, 21114, {}) ->
    {ok, <<2:32/little, 21114:16/little>>};
pack(srv, 21114, {V0_canyon_summit_unit}) ->
    D_a_t_a = <<(length(V0_canyon_summit_unit)):16/little,
                (list_to_binary([<<V1_group_id:32/little,
                                   V1_match_id:32/little, V1_unit_id:32/little,
                                   V1_battle_id:32/little,
                                   V1_last_operated:32/little,
                                   V1_duration:32/little, V1_side:8/little>>
                                 || #canyon_summit_unit{id =
                                                            {V1_group_id,
                                                             V1_match_id,
                                                             V1_unit_id},
                                                        battle_id =
                                                            V1_battle_id,
                                                        last_operated =
                                                            V1_last_operated,
                                                        duration = V1_duration,
                                                        side = V1_side}
                                        <- V0_canyon_summit_unit]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 21114:16/little,
       D_a_t_a/binary>>};
pack(cli, 21115, {}) ->
    {ok, <<2:32/little, 21115:16/little>>};
pack(srv, 21115, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 21115:16/little,
       D_a_t_a/binary>>};
pack(cli, 21117, {}) ->
    {ok, <<2:32/little, 21117:16/little>>};
pack(srv, 21117, {V0_battle_id, V0_id}) ->
    D_a_t_a = <<V0_battle_id:32/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 21117:16/little,
       D_a_t_a/binary>>};
pack(cli, 21118, {}) ->
    {ok, <<2:32/little, 21118:16/little>>};
pack(srv, 21118,
     {{V0_rid, V0_platform, V0_zone_id}, V0_status}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_status:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 21118:16/little,
       D_a_t_a/binary>>};
pack(cli, 21121, {}) ->
    {ok, <<2:32/little, 21121:16/little>>};
pack(srv, 21121, {V0_group_id}) ->
    D_a_t_a = <<V0_group_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 21121:16/little,
       D_a_t_a/binary>>};
pack(cli, 21122, {}) ->
    {ok, <<2:32/little, 21122:16/little>>};
pack(srv, 21122, {V0_cd}) ->
    D_a_t_a = <<V0_cd:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 21122:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 21100, _B0) -> {ok, {}};
unpack(cli, 21100, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_timeout, _B2} = protocol:uint32(_B1),
    {ok, {V1_status, V1_timeout}};
unpack(srv, 21101, _B0) -> {ok, {}};
unpack(cli, 21101, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 21102, _B0) -> {ok, {}};
unpack(cli, 21102, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 21103, _B0) -> {ok, {}};
unpack(cli, 21103, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 21104, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 21104, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 21105, _B0) -> {ok, {}};
unpack(cli, 21105, _B0) ->
    {V1_movability, _B1} = protocol:uint32(_B0),
    {V1_win, _B2} = protocol:uint32(_B1),
    {V1_side, _B3} = protocol:uint8(_B2),
    {ok, {V1_movability, V1_win, V1_side}};
unpack(srv, 21106, _B0) -> {ok, {}};
unpack(cli, 21106, _B0) ->
    {V1_canyon_summit_side, _B16} = protocol:array(_B0,
                                                   fun (_B1) ->
                                                           {V2_group_id, _B2} =
                                                               protocol:uint8(_B1),
                                                           {V2_match_id, _B3} =
                                                               protocol:uint8(_B2),
                                                           {V2_side_id, _B4} =
                                                               protocol:uint8(_B3),
                                                           {V2_win, _B5} =
                                                               protocol:uint32(_B4),
                                                           {V2_lost, _B6} =
                                                               protocol:uint32(_B5),
                                                           {V2_is_win, _B7} =
                                                               protocol:uint8(_B6),
                                                           {V2_member_num,
                                                            _B8} =
                                                               protocol:uint32(_B7),
                                                           {V2_remain_num,
                                                            _B9} =
                                                               protocol:uint32(_B8),
                                                           {V2_movability,
                                                            _B10} =
                                                               protocol:uint32(_B9),
                                                           {V2_score, _B11} =
                                                               protocol:uint32(_B10),
                                                           {V2_guarded_unit,
                                                            _B12} =
                                                               protocol:uint32(_B11),
                                                           {V2_attacked_unit,
                                                            _B13} =
                                                               protocol:uint32(_B12),
                                                           {V2_remain_unit,
                                                            _B14} =
                                                               protocol:uint8(_B13),
                                                           {{V2_group_id,
                                                             V2_match_id,
                                                             V2_side_id,
                                                             V2_win,
                                                             V2_lost,
                                                             V2_is_win,
                                                             V2_member_num,
                                                             V2_remain_num,
                                                             V2_movability,
                                                             V2_score,
                                                             V2_guarded_unit,
                                                             V2_attacked_unit,
                                                             V2_remain_unit},
                                                            _B14}
                                                   end),
    {ok, {V1_canyon_summit_side}};
unpack(srv, 21107, _B0) -> {ok, {}};
unpack(cli, 21107, _B0) ->
    {V1_canyon_summit_role, _B14} = protocol:array(_B0,
                                                   fun (_B1) ->
                                                           {V2_rid, _B2} =
                                                               protocol:uint32(_B1),
                                                           {V2_platform, _B3} =
                                                               protocol:string(_B2),
                                                           {V2_zone_id, _B4} =
                                                               protocol:uint16(_B3),
                                                           {V2_side, _B5} =
                                                               protocol:uint8(_B4),
                                                           {V2_name, _B6} =
                                                               protocol:string(_B5),
                                                           {V2_lev, _B7} =
                                                               protocol:uint8(_B6),
                                                           {V2_sex, _B8} =
                                                               protocol:uint8(_B7),
                                                           {V2_classes, _B9} =
                                                               protocol:uint8(_B8),
                                                           {V2_win, _B10} =
                                                               protocol:uint32(_B9),
                                                           {V2_score, _B11} =
                                                               protocol:uint32(_B10),
                                                           {V2_movability,
                                                            _B12} =
                                                               protocol:uint32(_B11),
                                                           {{V2_rid,
                                                             V2_platform,
                                                             V2_zone_id,
                                                             V2_side,
                                                             V2_name,
                                                             V2_lev,
                                                             V2_sex,
                                                             V2_classes,
                                                             V2_win,
                                                             V2_score,
                                                             V2_movability},
                                                            _B12}
                                                   end),
    {ok, {V1_canyon_summit_role}};
unpack(srv, 21108, _B0) -> {ok, {}};
unpack(cli, 21108, _B0) ->
    {V1_canyon_summit_role, _B13} = protocol:array(_B0,
                                                   fun (_B1) ->
                                                           {V2_rid, _B2} =
                                                               protocol:uint32(_B1),
                                                           {V2_platform, _B3} =
                                                               protocol:string(_B2),
                                                           {V2_zone_id, _B4} =
                                                               protocol:uint16(_B3),
                                                           {V2_name, _B5} =
                                                               protocol:string(_B4),
                                                           {V2_lev, _B6} =
                                                               protocol:uint8(_B5),
                                                           {V2_sex, _B7} =
                                                               protocol:uint8(_B6),
                                                           {V2_classes, _B8} =
                                                               protocol:uint8(_B7),
                                                           {V2_win, _B9} =
                                                               protocol:uint32(_B8),
                                                           {V2_score, _B10} =
                                                               protocol:uint32(_B9),
                                                           {V2_movability,
                                                            _B11} =
                                                               protocol:uint32(_B10),
                                                           {{V2_rid,
                                                             V2_platform,
                                                             V2_zone_id,
                                                             V2_name,
                                                             V2_lev,
                                                             V2_sex,
                                                             V2_classes,
                                                             V2_win,
                                                             V2_score,
                                                             V2_movability},
                                                            _B11}
                                                   end),
    {ok, {V1_canyon_summit_role}};
unpack(srv, 21109, _B0) -> {ok, {}};
unpack(cli, 21109, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_type}};
unpack(srv, 21110, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_battle_id, V1_id}};
unpack(cli, 21110, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_id}};
unpack(srv, 21111, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_battle_id, V1_id}};
unpack(cli, 21111, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 21112, _B0) -> {ok, {}};
unpack(cli, 21112, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_id}};
unpack(srv, 21113, _B0) -> {ok, {}};
unpack(cli, 21113, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 21114, _B0) -> {ok, {}};
unpack(cli, 21114, _B0) ->
    {V1_canyon_summit_unit, _B10} = protocol:array(_B0,
                                                   fun (_B1) ->
                                                           {V2_group_id, _B2} =
                                                               protocol:uint32(_B1),
                                                           {V2_match_id, _B3} =
                                                               protocol:uint32(_B2),
                                                           {V2_unit_id, _B4} =
                                                               protocol:uint32(_B3),
                                                           {V2_battle_id, _B5} =
                                                               protocol:uint32(_B4),
                                                           {V2_last_operated,
                                                            _B6} =
                                                               protocol:uint32(_B5),
                                                           {V2_duration, _B7} =
                                                               protocol:uint32(_B6),
                                                           {V2_side, _B8} =
                                                               protocol:uint8(_B7),
                                                           {{V2_group_id,
                                                             V2_match_id,
                                                             V2_unit_id,
                                                             V2_battle_id,
                                                             V2_last_operated,
                                                             V2_duration,
                                                             V2_side},
                                                            _B8}
                                                   end),
    {ok, {V1_canyon_summit_unit}};
unpack(srv, 21115, _B0) -> {ok, {}};
unpack(cli, 21115, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 21117, _B0) -> {ok, {}};
unpack(cli, 21117, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_battle_id, V1_id}};
unpack(srv, 21118, _B0) -> {ok, {}};
unpack(cli, 21118, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_status, _B4} = protocol:uint8(_B3),
    {ok, {V1_rid, V1_platform, V1_zone_id, V1_status}};
unpack(srv, 21121, _B0) -> {ok, {}};
unpack(cli, 21121, _B0) ->
    {V1_group_id, _B1} = protocol:uint8(_B0),
    {ok, {V1_group_id}};
unpack(srv, 21122, _B0) -> {ok, {}};
unpack(cli, 21122, _B0) ->
    {V1_cd, _B1} = protocol:uint32(_B0),
    {ok, {V1_cd}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

