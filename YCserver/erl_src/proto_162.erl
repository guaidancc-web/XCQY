-file("src/proto/proto_162.erl", 1).

-module(proto_162).

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

-file("src/proto/proto_162.erl", 14).

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

-file("src/proto/proto_162.erl", 15).

-file("inc/guild_hero.hrl", 1).

-record(guild_hero_guild,
        {id = {0, "", 0} :: tuple(),
         ver = 1,
         name = "" :: bitstring(),
         lev = 0 :: non_neg_integer(),
         leader_name = "" :: list(),
         leader_id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         win = 0 :: non_neg_integer(),
         lost = 0 :: non_neg_integer(),
         match_id = {1, 0} ::
             {non_neg_integer(), non_neg_integer()},
         totem = 0 :: non_neg_integer(),
         map_id = 0 :: non_neg_integer(),
         map_pid = 0 :: pid(),
         time = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer(),
         team_leaders = [],
         acc_win = 0 :: non_neg_integer(),
         fighters = [],
         pickers = [],
         logs = [],
         last_rival = [],
         cross_group = 0 :: non_neg_integer()}).

-record(guild_hero_team_leader,
        {id = {0, "", 0} :: tuple(),
         gid = {0, "", 0} :: tuple(),
         ver = 1,
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         win = 0 :: non_neg_integer(),
         lost = 0 :: non_neg_integer(),
         is_win = 0 :: 0..1,
         position = 2,
         pid :: undefined | reference(),
         is_fighting = 0 :: 0..1}).

-record(guild_hero_match,
        {id = {0, 0} :: {non_neg_integer(), non_neg_integer()},
         round = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         map_id = 0 :: non_neg_integer(),
         map_pid = 0 :: pid(),
         gid1 = {0, "", 0},
         g_name1 = "",
         gid2 = {0, "", 0},
         g_name2 = "",
         leaders = [],
         over = 0,
         time = 0 :: non_neg_integer(),
         cross_group = 0 :: non_neg_integer()}).

-record(guild_hero_fighter,
        {id = {0, "", 0} :: tuple(),
         gid = {0, "", 0} :: tuple(),
         ver = 1,
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         picked = 0 :: non_neg_integer()}).

-file("src/proto/proto_162.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 16200, {}) ->
    {ok, <<2:32/little, 16200:16/little>>};
pack(srv, 16200, {V0_status, V0_timeout}) ->
    D_a_t_a = <<V0_status:8/little, V0_timeout:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16200:16/little,
       D_a_t_a/binary>>};
pack(cli, 16201, {}) ->
    {ok, <<2:32/little, 16201:16/little>>};
pack(srv, 16201, {V0_guild_hero_team_leader}) ->
    D_a_t_a =
        <<(length(V0_guild_hero_team_leader)):16/little,
          (list_to_binary([<<V1_rid:32/little,
                             (protocol:pack(string, V1_platform))/binary,
                             V1_zone_id:16/little,
                             (protocol:pack(string, V1_name))/binary,
                             V1_lev:8/little, V1_sex:8/little,
                             V1_classes:8/little, V1_position:32/little>>
                           || #guild_hero_team_leader{id =
                                                          {V1_rid,
                                                           V1_platform,
                                                           V1_zone_id},
                                                      name = V1_name,
                                                      lev = V1_lev,
                                                      sex = V1_sex,
                                                      classes = V1_classes,
                                                      position = V1_position}
                                  <- V0_guild_hero_team_leader]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16201:16/little,
       D_a_t_a/binary>>};
pack(cli, 16202,
     {V0_id, V0_platform, V0_zone_id, V0_position}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_position:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16202:16/little,
       D_a_t_a/binary>>};
pack(srv, 16202, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16202:16/little,
       D_a_t_a/binary>>};
pack(cli, 16203, {}) ->
    {ok, <<2:32/little, 16203:16/little>>};
pack(srv, 16203, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16203:16/little,
       D_a_t_a/binary>>};
pack(cli, 16204, {}) ->
    {ok, <<2:32/little, 16204:16/little>>};
pack(srv, 16204, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16204:16/little,
       D_a_t_a/binary>>};
pack(cli, 16205, {}) ->
    {ok, <<2:32/little, 16205:16/little>>};
pack(srv, 16205,
     {#guild_hero_match{gid1 =
                            {V0_g_id1, V0_g_platform1, V0_g_zone_id1},
                        g_name1 = V0_g_name1,
                        gid2 = {V0_g_id2, V0_g_platform2, V0_g_zone_id2},
                        g_name2 = V0_g_name2, time = V0_time, round = V0_round,
                        leaders = V0_leaders}}) ->
    D_a_t_a = <<V0_g_id1:32/little,
                (protocol:pack(string, V0_g_platform1))/binary,
                V0_g_zone_id1:16/little,
                (protocol:pack(string, V0_g_name1))/binary,
                V0_g_id2:32/little,
                (protocol:pack(string, V0_g_platform2))/binary,
                V0_g_zone_id2:16/little,
                (protocol:pack(string, V0_g_name2))/binary,
                V0_time:32/little, V0_round:8/little,
                (length(V0_leaders)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little, V1_g_id:32/little,
                                   (protocol:pack(string,
                                                  V1_g_platform))/binary,
                                   V1_g_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:8/little, V1_sex:8/little,
                                   V1_classes:8/little, V1_position:32/little,
                                   V1_is_win:8/little, V1_is_fighting:8/little>>
                                 || #guild_hero_team_leader{id =
                                                                {V1_rid,
                                                                 V1_platform,
                                                                 V1_zone_id},
                                                            gid =
                                                                {V1_g_id,
                                                                 V1_g_platform,
                                                                 V1_g_zone_id},
                                                            name = V1_name,
                                                            lev = V1_lev,
                                                            sex = V1_sex,
                                                            classes =
                                                                V1_classes,
                                                            position =
                                                                V1_position,
                                                            is_win = V1_is_win,
                                                            is_fighting =
                                                                V1_is_fighting}
                                        <- V0_leaders]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16205:16/little,
       D_a_t_a/binary>>};
pack(cli, 16206, {}) ->
    {ok, <<2:32/little, 16206:16/little>>};
pack(srv, 16206, {V0_logs}) ->
    D_a_t_a = <<(length(V0_logs)):16/little,
                (list_to_binary([<<V1_time:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_match_type:8/little,
                                   V1_match_local_id:32/little,
                                   V1_position:32/little>>
                                 || {V1_time,
                                     V1_name,
                                     {V1_match_type, V1_match_local_id},
                                     V1_position}
                                        <- V0_logs]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16206:16/little,
       D_a_t_a/binary>>};
pack(cli, 16207,
     {V0_match_type, V0_match_local_id, V0_position}) ->
    D_a_t_a = <<V0_match_type:8/little,
                V0_match_local_id:32/little, V0_position:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16207:16/little,
       D_a_t_a/binary>>};
pack(srv, 16207, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16207:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 16200, _B0) -> {ok, {}};
unpack(cli, 16200, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_timeout, _B2} = protocol:uint32(_B1),
    {ok, {V1_status, V1_timeout}};
unpack(srv, 16201, _B0) -> {ok, {}};
unpack(cli, 16201, _B0) ->
    {V1_guild_hero_team_leader, _B11} = protocol:array(_B0,
                                                       fun (_B1) ->
                                                               {V2_rid, _B2} =
                                                                   protocol:uint32(_B1),
                                                               {V2_platform,
                                                                _B3} =
                                                                   protocol:string(_B2),
                                                               {V2_zone_id,
                                                                _B4} =
                                                                   protocol:uint16(_B3),
                                                               {V2_name, _B5} =
                                                                   protocol:string(_B4),
                                                               {V2_lev, _B6} =
                                                                   protocol:uint8(_B5),
                                                               {V2_sex, _B7} =
                                                                   protocol:uint8(_B6),
                                                               {V2_classes,
                                                                _B8} =
                                                                   protocol:uint8(_B7),
                                                               {V2_position,
                                                                _B9} =
                                                                   protocol:uint32(_B8),
                                                               {{V2_rid,
                                                                 V2_platform,
                                                                 V2_zone_id,
                                                                 V2_name,
                                                                 V2_lev,
                                                                 V2_sex,
                                                                 V2_classes,
                                                                 V2_position},
                                                                _B9}
                                                       end),
    {ok, {V1_guild_hero_team_leader}};
unpack(srv, 16202, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_position, _B4} = protocol:uint32(_B3),
    {ok, {V1_id, V1_platform, V1_zone_id, V1_position}};
unpack(cli, 16202, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 16203, _B0) -> {ok, {}};
unpack(cli, 16203, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 16204, _B0) -> {ok, {}};
unpack(cli, 16204, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 16205, _B0) -> {ok, {}};
unpack(cli, 16205, _B0) ->
    {V1_g_id1, _B1} = protocol:uint32(_B0),
    {V1_g_platform1, _B2} = protocol:string(_B1),
    {V1_g_zone_id1, _B3} = protocol:uint16(_B2),
    {V1_g_name1, _B4} = protocol:string(_B3),
    {V1_g_id2, _B5} = protocol:uint32(_B4),
    {V1_g_platform2, _B6} = protocol:string(_B5),
    {V1_g_zone_id2, _B7} = protocol:uint16(_B6),
    {V1_g_name2, _B8} = protocol:string(_B7),
    {V1_time, _B9} = protocol:uint32(_B8),
    {V1_round, _B10} = protocol:uint8(_B9),
    {V1_leaders, _B26} = protocol:array(_B10,
                                        fun (_B11) ->
                                                {V2_rid, _B12} =
                                                    protocol:uint32(_B11),
                                                {V2_platform, _B13} =
                                                    protocol:string(_B12),
                                                {V2_zone_id, _B14} =
                                                    protocol:uint16(_B13),
                                                {V2_g_id, _B15} =
                                                    protocol:uint32(_B14),
                                                {V2_g_platform, _B16} =
                                                    protocol:string(_B15),
                                                {V2_g_zone_id, _B17} =
                                                    protocol:uint16(_B16),
                                                {V2_name, _B18} =
                                                    protocol:string(_B17),
                                                {V2_lev, _B19} =
                                                    protocol:uint8(_B18),
                                                {V2_sex, _B20} =
                                                    protocol:uint8(_B19),
                                                {V2_classes, _B21} =
                                                    protocol:uint8(_B20),
                                                {V2_position, _B22} =
                                                    protocol:uint32(_B21),
                                                {V2_is_win, _B23} =
                                                    protocol:uint8(_B22),
                                                {V2_is_fighting, _B24} =
                                                    protocol:uint8(_B23),
                                                {{V2_rid,
                                                  V2_platform,
                                                  V2_zone_id,
                                                  V2_g_id,
                                                  V2_g_platform,
                                                  V2_g_zone_id,
                                                  V2_name,
                                                  V2_lev,
                                                  V2_sex,
                                                  V2_classes,
                                                  V2_position,
                                                  V2_is_win,
                                                  V2_is_fighting},
                                                 _B24}
                                        end),
    {ok,
     {V1_g_id1,
      V1_g_platform1,
      V1_g_zone_id1,
      V1_g_name1,
      V1_g_id2,
      V1_g_platform2,
      V1_g_zone_id2,
      V1_g_name2,
      V1_time,
      V1_round,
      V1_leaders}};
unpack(srv, 16206, _B0) -> {ok, {}};
unpack(cli, 16206, _B0) ->
    {V1_logs, _B8} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_time, _B2} =
                                                protocol:uint32(_B1),
                                            {V2_name, _B3} =
                                                protocol:string(_B2),
                                            {V2_match_type, _B4} =
                                                protocol:uint8(_B3),
                                            {V2_match_local_id, _B5} =
                                                protocol:uint32(_B4),
                                            {V2_position, _B6} =
                                                protocol:uint32(_B5),
                                            {{V2_time,
                                              V2_name,
                                              V2_match_type,
                                              V2_match_local_id,
                                              V2_position},
                                             _B6}
                                    end),
    {ok, {V1_logs}};
unpack(srv, 16207, _B0) ->
    {V1_match_type, _B1} = protocol:uint8(_B0),
    {V1_match_local_id, _B2} = protocol:uint32(_B1),
    {V1_position, _B3} = protocol:uint32(_B2),
    {ok, {V1_match_type, V1_match_local_id, V1_position}};
unpack(cli, 16207, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

