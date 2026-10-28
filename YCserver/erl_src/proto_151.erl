-file("src/proto/proto_151.erl", 1).

-module(proto_151).

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

-file("src/proto/proto_151.erl", 14).

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

-file("src/proto/proto_151.erl", 15).

-file("inc/top_compete.hrl", 1).

-record(top_compete_role,
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
         has_mail = 0}).

-file("src/proto/proto_151.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 15100, {}) ->
    {ok, <<2:32/little, 15100:16/little>>};
pack(srv, 15100, {V0_status, V0_time}) ->
    D_a_t_a = <<V0_status:8/little, V0_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15100:16/little,
       D_a_t_a/binary>>};
pack(cli, 15101, {}) ->
    {ok, <<2:32/little, 15101:16/little>>};
pack(srv, 15101, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15101:16/little,
       D_a_t_a/binary>>};
pack(cli, 15102, {}) ->
    {ok, <<2:32/little, 15102:16/little>>};
pack(srv, 15102, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15102:16/little,
       D_a_t_a/binary>>};
pack(cli, 15103, {}) ->
    {ok, <<2:32/little, 15103:16/little>>};
pack(srv, 15103,
     {V0_win, V0_times, V0_die, V0_score, V0_exp}) ->
    D_a_t_a = <<V0_win:8/little, V0_times:8/little,
                V0_die:8/little, V0_score:16/little, V0_exp:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15103:16/little,
       D_a_t_a/binary>>};
pack(cli, 15104, {}) ->
    {ok, <<2:32/little, 15104:16/little>>};
pack(srv, 15104,
     {V0_self_score,
      V0_sefl_rank_point,
      V0_top_compete_role}) ->
    D_a_t_a = <<V0_self_score:16/little,
                V0_sefl_rank_point:16/little,
                (length(V0_top_compete_role)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:8/little, V1_score:16/little,
                                   V1_rank_point:16/little>>
                                 || #top_compete_role{id =
                                                          {V1_rid,
                                                           V1_platform,
                                                           V1_zone_id},
                                                      name = V1_name,
                                                      sex = V1_sex,
                                                      classes = V1_classes,
                                                      lev = V1_lev,
                                                      score = V1_score,
                                                      rank_point =
                                                          V1_rank_point}
                                        <- V0_top_compete_role]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15104:16/little,
       D_a_t_a/binary>>};
pack(cli, 15105, {}) ->
    {ok, <<2:32/little, 15105:16/little>>};
pack(srv, 15105,
     {V0_gain_base_id, V0_gain_num, V0_show, V0_msg}) ->
    D_a_t_a = <<V0_gain_base_id:32/little,
                V0_gain_num:32/little, (length(V0_show)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_num:32/little>>
                                 || {V1_base_id, V1_num} <- V0_show]))/binary,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15105:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 15100, _B0) -> {ok, {}};
unpack(cli, 15100, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_time, _B2} = protocol:uint32(_B1),
    {ok, {V1_status, V1_time}};
unpack(srv, 15101, _B0) -> {ok, {}};
unpack(cli, 15101, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 15102, _B0) -> {ok, {}};
unpack(cli, 15102, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 15103, _B0) -> {ok, {}};
unpack(cli, 15103, _B0) ->
    {V1_win, _B1} = protocol:uint8(_B0),
    {V1_times, _B2} = protocol:uint8(_B1),
    {V1_die, _B3} = protocol:uint8(_B2),
    {V1_score, _B4} = protocol:uint16(_B3),
    {V1_exp, _B5} = protocol:uint32(_B4),
    {ok, {V1_win, V1_times, V1_die, V1_score, V1_exp}};
unpack(srv, 15104, _B0) -> {ok, {}};
unpack(cli, 15104, _B0) ->
    {V1_self_score, _B1} = protocol:uint16(_B0),
    {V1_sefl_rank_point, _B2} = protocol:uint16(_B1),
    {V1_top_compete_role, _B14} = protocol:array(_B2,
                                                 fun (_B3) ->
                                                         {V2_rid, _B4} =
                                                             protocol:uint32(_B3),
                                                         {V2_platform, _B5} =
                                                             protocol:string(_B4),
                                                         {V2_zone_id, _B6} =
                                                             protocol:uint32(_B5),
                                                         {V2_name, _B7} =
                                                             protocol:string(_B6),
                                                         {V2_sex, _B8} =
                                                             protocol:uint8(_B7),
                                                         {V2_classes, _B9} =
                                                             protocol:uint8(_B8),
                                                         {V2_lev, _B10} =
                                                             protocol:uint8(_B9),
                                                         {V2_score, _B11} =
                                                             protocol:uint16(_B10),
                                                         {V2_rank_point, _B12} =
                                                             protocol:uint16(_B11),
                                                         {{V2_rid,
                                                           V2_platform,
                                                           V2_zone_id,
                                                           V2_name,
                                                           V2_sex,
                                                           V2_classes,
                                                           V2_lev,
                                                           V2_score,
                                                           V2_rank_point},
                                                          _B12}
                                                 end),
    {ok,
     {V1_self_score,
      V1_sefl_rank_point,
      V1_top_compete_role}};
unpack(srv, 15105, _B0) -> {ok, {}};
unpack(cli, 15105, _B0) ->
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
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

