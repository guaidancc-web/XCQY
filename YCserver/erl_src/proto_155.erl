-file("src/proto/proto_155.erl", 1).

-module(proto_155).

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

-file("src/proto/proto_155.erl", 14).

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

-file("src/proto/proto_155.erl", 15).

-file("inc/guild_war.hrl", 1).

-record(guild_war_role,
        {id = {0, "", 0} :: tuple(),
         gid = {0, "", 0} :: tuple(),
         ver = 1,
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         win = 0 :: non_neg_integer(),
         lost = 0 :: non_neg_integer(),
         to_war = 0,
         movability = 1000 :: non_neg_integer(),
         match_id = {1, 0},
         side = 1,
         pid :: undefined | reference(),
         type = 0 :: non_neg_integer(),
         key = {{0, "", 0}, 0},
         last_killed = 0 :: non_neg_integer(),
         picked = 0 :: non_neg_integer(),
         last_win = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         team_status = 0,
         team_fc = 0,
         team_len = 0}).

-record(guild_war_guild,
        {id = {0, "", 0} :: tuple(),
         key = {{0, "", 0}, 0},
         ver = 2,
         name = "" :: bitstring(),
         lev = 0 :: non_neg_integer(),
         leader_name = "" :: list(),
         leader_id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         match_id = {1, 0},
         member_num = 0 :: non_neg_integer(),
         win = 0 :: non_neg_integer(),
         side = 1,
         totem = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         week_assets = 0 :: non_neg_integer()}).

-record(guild_war_match,
        {id = {0, 0} :: {non_neg_integer(), non_neg_integer()},
         pid :: undefined | pid(),
         map_platform = "",
         map_zone_id = 0,
         map_id = 0 :: non_neg_integer(),
         map_pid = 0 :: pid(),
         win_side = 0,
         time = 0 :: non_neg_integer(),
         type = 0,
         combat_time = 0}).

-record(guild_war_alliance,
        {id = {{0, 0}, 0} :: {integer(), integer()},
         gids = [] :: list(),
         names = [],
         totems = [] :: list(),
         win = 0 :: non_neg_integer(),
         lost = 0 :: non_neg_integer(),
         movability = 0 :: non_neg_integer(),
         member_num = 0 :: non_neg_integer(),
         members = [],
         remain_num = 0,
         match_id = {0, 0},
         side = 1,
         totem = 0 :: non_neg_integer(),
         map_platform = "",
         map_zone_id = 0,
         map_id = 0 :: non_neg_integer(),
         map_pid = 0 :: pid(),
         type = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer()}).

-file("src/proto/proto_155.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 15500, {}) ->
    {ok, <<2:32/little, 15500:16/little>>};
pack(srv, 15500, {V0_status, V0_timeout}) ->
    D_a_t_a = <<V0_status:8/little, V0_timeout:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15500:16/little,
       D_a_t_a/binary>>};
pack(cli, 15501, {}) ->
    {ok, <<2:32/little, 15501:16/little>>};
pack(srv, 15501, {V0_guild_war_alliance}) ->
    D_a_t_a = <<(length(V0_guild_war_alliance)):16/little,
                (list_to_binary([<<(length(V1_gids)):16/little,
                                   (list_to_binary([<<V2_guild_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_platform))/binary,
                                                      V2_zone_id:16/little>>
                                                    || {V2_guild_id,
                                                        V2_platform,
                                                        V2_zone_id}
                                                           <- V1_gids]))/binary,
                                   (length(V1_names)):16/little,
                                   (list_to_binary([<<(protocol:pack(string,
                                                                     V2_name))/binary>>
                                                    || V2_name
                                                           <- V1_names]))/binary,
                                   (length(V1_totems)):16/little,
                                   (list_to_binary([<<V2_totem:8/little>>
                                                    || V2_totem
                                                           <- V1_totems]))/binary,
                                   V1_side:8/little, V1_time:32/little,
                                   V1_type:8/little, V1_is_win:8/little,
                                   V1_match_type:8/little,
                                   V1_match_local_id:32/little,
                                   V1_member_num:32/little,
                                   V1_remain_num:32/little,
                                   V1_movability:32/little>>
                                 || #guild_war_alliance{gids = V1_gids,
                                                        names = V1_names,
                                                        totems = V1_totems,
                                                        side = V1_side,
                                                        time = V1_time,
                                                        type = V1_type,
                                                        is_win = V1_is_win,
                                                        match_id =
                                                            {V1_match_type,
                                                             V1_match_local_id},
                                                        member_num =
                                                            V1_member_num,
                                                        remain_num =
                                                            V1_remain_num,
                                                        movability =
                                                            V1_movability}
                                        <- V0_guild_war_alliance]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15501:16/little,
       D_a_t_a/binary>>};
pack(cli, 15502, {}) ->
    {ok, <<2:32/little, 15502:16/little>>};
pack(srv, 15502, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15502:16/little,
       D_a_t_a/binary>>};
pack(cli, 15503, {}) ->
    {ok, <<2:32/little, 15503:16/little>>};
pack(srv, 15503, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15503:16/little,
       D_a_t_a/binary>>};
pack(cli, 15504, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15504:16/little,
       D_a_t_a/binary>>};
pack(srv, 15504, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15504:16/little,
       D_a_t_a/binary>>};
pack(cli, 15505, {}) ->
    {ok, <<2:32/little, 15505:16/little>>};
pack(srv, 15505,
     {#guild_war_role{movability = V0_movability,
                      win = V0_win}}) ->
    D_a_t_a = <<V0_movability:32/little, V0_win:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15505:16/little,
       D_a_t_a/binary>>};
pack(cli, 15506, {}) ->
    {ok, <<2:32/little, 15506:16/little>>};
pack(srv, 15506, {V0_guild_war_guild, V0_mode}) ->
    D_a_t_a = <<(length(V0_guild_war_guild)):16/little,
                (list_to_binary([<<V1_guild_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:8/little, V1_totem:8/little,
                                   V1_side:8/little, V1_time:32/little,
                                   V1_type:8/little, V1_match_type:8/little,
                                   V1_match_local_id:32/little,
                                   V1_is_win:8/little>>
                                 || #guild_war_guild{id =
                                                         {V1_guild_id,
                                                          V1_platform,
                                                          V1_zone_id},
                                                     name = V1_name,
                                                     lev = V1_lev,
                                                     totem = V1_totem,
                                                     side = V1_side,
                                                     time = V1_time,
                                                     type = V1_type,
                                                     match_id =
                                                         {V1_match_type,
                                                          V1_match_local_id},
                                                     is_win = V1_is_win}
                                        <- V0_guild_war_guild]))/binary,
                V0_mode:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15506:16/little,
       D_a_t_a/binary>>};
pack(cli, 15507, {}) ->
    {ok, <<2:32/little, 15507:16/little>>};
pack(srv, 15507, {V0_guild_war_role}) ->
    D_a_t_a = <<(length(V0_guild_war_role)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:8/little, V1_sex:8/little,
                                   V1_classes:8/little, V1_win:32/little,
                                   V1_score:32/little, V1_movability:32/little>>
                                 || #guild_war_role{id =
                                                        {V1_rid,
                                                         V1_platform,
                                                         V1_zone_id},
                                                    name = V1_name,
                                                    lev = V1_lev, sex = V1_sex,
                                                    classes = V1_classes,
                                                    win = V1_win,
                                                    score = V1_score,
                                                    movability = V1_movability}
                                        <- V0_guild_war_role]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15507:16/little,
       D_a_t_a/binary>>};
pack(cli, 15508, {}) ->
    {ok, <<2:32/little, 15508:16/little>>};
pack(srv, 15508, {V0_guild_war_role}) ->
    D_a_t_a = <<(length(V0_guild_war_role)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:8/little, V1_sex:8/little,
                                   V1_classes:8/little, V1_win:32/little,
                                   V1_score:32/little, V1_movability:32/little>>
                                 || #guild_war_role{id =
                                                        {V1_rid,
                                                         V1_platform,
                                                         V1_zone_id},
                                                    name = V1_name,
                                                    lev = V1_lev, sex = V1_sex,
                                                    classes = V1_classes,
                                                    win = V1_win,
                                                    score = V1_score,
                                                    movability = V1_movability}
                                        <- V0_guild_war_role]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15508:16/little,
       D_a_t_a/binary>>};
pack(cli, 15509, {}) ->
    {ok, <<2:32/little, 15509:16/little>>};
pack(srv, 15509, {V0_type}) ->
    D_a_t_a = <<V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15509:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 15500, _B0) -> {ok, {}};
unpack(cli, 15500, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_timeout, _B2} = protocol:uint32(_B1),
    {ok, {V1_status, V1_timeout}};
unpack(srv, 15501, _B0) -> {ok, {}};
unpack(cli, 15501, _B0) ->
    {V1_guild_war_alliance, _B26} = protocol:array(_B0,
                                                   fun (_B1) ->
                                                           {V2_gids, _B7} =
                                                               protocol:array(_B1,
                                                                              fun
                                                                                  (_B2) ->
                                                                                      {V3_guild_id,
                                                                                       _B3} =
                                                                                          protocol:uint32(_B2),
                                                                                      {V3_platform,
                                                                                       _B4} =
                                                                                          protocol:string(_B3),
                                                                                      {V3_zone_id,
                                                                                       _B5} =
                                                                                          protocol:uint16(_B4),
                                                                                      {{V3_guild_id,
                                                                                        V3_platform,
                                                                                        V3_zone_id},
                                                                                       _B5}
                                                                              end),
                                                           {V2_names, _B11} =
                                                               protocol:array(_B7,
                                                                              fun
                                                                                  (_B8) ->
                                                                                      {V3_name,
                                                                                       _B9} =
                                                                                          protocol:string(_B8),
                                                                                      {{V3_name},
                                                                                       _B9}
                                                                              end),
                                                           {V2_totems, _B15} =
                                                               protocol:array(_B11,
                                                                              fun
                                                                                  (_B12) ->
                                                                                      {V3_totem,
                                                                                       _B13} =
                                                                                          protocol:uint8(_B12),
                                                                                      {{V3_totem},
                                                                                       _B13}
                                                                              end),
                                                           {V2_side, _B16} =
                                                               protocol:uint8(_B15),
                                                           {V2_time, _B17} =
                                                               protocol:uint32(_B16),
                                                           {V2_type, _B18} =
                                                               protocol:uint8(_B17),
                                                           {V2_is_win, _B19} =
                                                               protocol:uint8(_B18),
                                                           {V2_match_type,
                                                            _B20} =
                                                               protocol:uint8(_B19),
                                                           {V2_match_local_id,
                                                            _B21} =
                                                               protocol:uint32(_B20),
                                                           {V2_member_num,
                                                            _B22} =
                                                               protocol:uint32(_B21),
                                                           {V2_remain_num,
                                                            _B23} =
                                                               protocol:uint32(_B22),
                                                           {V2_movability,
                                                            _B24} =
                                                               protocol:uint32(_B23),
                                                           {{V2_gids,
                                                             V2_names,
                                                             V2_totems,
                                                             V2_side,
                                                             V2_time,
                                                             V2_type,
                                                             V2_is_win,
                                                             V2_match_type,
                                                             V2_match_local_id,
                                                             V2_member_num,
                                                             V2_remain_num,
                                                             V2_movability},
                                                            _B24}
                                                   end),
    {ok, {V1_guild_war_alliance}};
unpack(srv, 15502, _B0) -> {ok, {}};
unpack(cli, 15502, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 15503, _B0) -> {ok, {}};
unpack(cli, 15503, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 15504, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 15504, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 15505, _B0) -> {ok, {}};
unpack(cli, 15505, _B0) ->
    {V1_movability, _B1} = protocol:uint32(_B0),
    {V1_win, _B2} = protocol:uint32(_B1),
    {ok, {V1_movability, V1_win}};
unpack(srv, 15506, _B0) -> {ok, {}};
unpack(cli, 15506, _B0) ->
    {V1_guild_war_guild, _B15} = protocol:array(_B0,
                                                fun (_B1) ->
                                                        {V2_guild_id, _B2} =
                                                            protocol:uint32(_B1),
                                                        {V2_platform, _B3} =
                                                            protocol:string(_B2),
                                                        {V2_zone_id, _B4} =
                                                            protocol:uint16(_B3),
                                                        {V2_name, _B5} =
                                                            protocol:string(_B4),
                                                        {V2_lev, _B6} =
                                                            protocol:uint8(_B5),
                                                        {V2_totem, _B7} =
                                                            protocol:uint8(_B6),
                                                        {V2_side, _B8} =
                                                            protocol:uint8(_B7),
                                                        {V2_time, _B9} =
                                                            protocol:uint32(_B8),
                                                        {V2_type, _B10} =
                                                            protocol:uint8(_B9),
                                                        {V2_match_type, _B11} =
                                                            protocol:uint8(_B10),
                                                        {V2_match_local_id,
                                                         _B12} =
                                                            protocol:uint32(_B11),
                                                        {V2_is_win, _B13} =
                                                            protocol:uint8(_B12),
                                                        {{V2_guild_id,
                                                          V2_platform,
                                                          V2_zone_id,
                                                          V2_name,
                                                          V2_lev,
                                                          V2_totem,
                                                          V2_side,
                                                          V2_time,
                                                          V2_type,
                                                          V2_match_type,
                                                          V2_match_local_id,
                                                          V2_is_win},
                                                         _B13}
                                                end),
    {V1_mode, _B16} = protocol:uint8(_B15),
    {ok, {V1_guild_war_guild, V1_mode}};
unpack(srv, 15507, _B0) -> {ok, {}};
unpack(cli, 15507, _B0) ->
    {V1_guild_war_role, _B13} = protocol:array(_B0,
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
                                                       {V2_movability, _B11} =
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
    {ok, {V1_guild_war_role}};
unpack(srv, 15508, _B0) -> {ok, {}};
unpack(cli, 15508, _B0) ->
    {V1_guild_war_role, _B13} = protocol:array(_B0,
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
                                                       {V2_movability, _B11} =
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
    {ok, {V1_guild_war_role}};
unpack(srv, 15509, _B0) -> {ok, {}};
unpack(cli, 15509, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_type}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

