-file("src/proto/proto_133.erl", 1).

-module(proto_133).

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

-file("src/proto/proto_133.erl", 14).

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

-file("src/proto/proto_133.erl", 15).

-file("inc/parade.hrl", 1).

-record(m_parade,
        {ver = 0 :: non_neg_integer(),
         pid :: undefined | pid()}).

-record(parade_procession,
        {id = {0, 0} :: {non_neg_integer(), non_neg_integer()},
         map_id = 0 :: non_neg_integer(),
         map_pid :: undefined | pid(),
         unit_base_id = 0 :: non_neg_integer(),
         unit_id = 0 :: non_neg_integer(),
         pid :: undefined | non_neg_integer(),
         participants = [],
         num = 0,
         path = [],
         move_next = [],
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         move_ref :: undefined | reference()}).

-record(parade_participant,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         guild = "" :: non_neg_integer(),
         guild_id = {0, "", 0} :: non_neg_integer(),
         guild_post = "" :: non_neg_integer(),
         pid :: undefined | pid(),
         procession_id = 0 :: non_neg_integer(),
         joined = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         figure = 0 :: non_neg_integer(),
         figure_score = 0 :: non_neg_integer(),
         last_ate = 0 :: non_neg_integer(),
         has_food = 0 :: non_neg_integer(),
         map_id = 0 :: non_neg_integer(),
         map_grid_pid = 0 :: non_neg_integer(),
         final_rewarded = 0 :: non_neg_integer()}).

-file("src/proto/proto_133.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 13300, {}) ->
    {ok, <<2:32/little, 13300:16/little>>};
pack(srv, 13300, {V0_status, V0_timeout}) ->
    D_a_t_a = <<V0_status:8/little, V0_timeout:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13300:16/little,
       D_a_t_a/binary>>};
pack(cli, 13301, {}) ->
    {ok, <<2:32/little, 13301:16/little>>};
pack(srv, 13301, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13301:16/little,
       D_a_t_a/binary>>};
pack(cli, 13302, {}) ->
    {ok, <<2:32/little, 13302:16/little>>};
pack(srv, 13302, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13302:16/little,
       D_a_t_a/binary>>};
pack(cli, 13303, {}) ->
    {ok, <<2:32/little, 13303:16/little>>};
pack(srv, 13303, {V0_parade_procession}) ->
    D_a_t_a = <<(length(V0_parade_procession)):16/little,
                (list_to_binary([<<V1_battle_id:32/little,
                                   V1_uid:32/little, V1_unit_base_id:32/little,
                                   (length(V1_participants)):16/little,
                                   (list_to_binary([<<V2_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_platform))/binary,
                                                      V2_zone_id:16/little,
                                                      (protocol:pack(string,
                                                                     V2_name))/binary,
                                                      V2_sex:8/little,
                                                      V2_classes:8/little,
                                                      V2_lev:8/little,
                                                      V2_g_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_g_platform))/binary,
                                                      V2_g_zone_id:16/little,
                                                      (protocol:pack(string,
                                                                     V2_guild))/binary,
                                                      (protocol:pack(string,
                                                                     V2_guild_post))/binary,
                                                      V2_figure:8/little,
                                                      V2_figure_score:16/little,
                                                      V2_last_ate:32/little,
                                                      V2_has_food:8/little>>
                                                    || #parade_participant{id =
                                                                               {V2_id,
                                                                                V2_platform,
                                                                                V2_zone_id},
                                                                           name
                                                                               =
                                                                               V2_name,
                                                                           sex =
                                                                               V2_sex,
                                                                           classes
                                                                               =
                                                                               V2_classes,
                                                                           lev =
                                                                               V2_lev,
                                                                           guild_id
                                                                               =
                                                                               {V2_g_id,
                                                                                V2_g_platform,
                                                                                V2_g_zone_id},
                                                                           guild
                                                                               =
                                                                               V2_guild,
                                                                           guild_post
                                                                               =
                                                                               V2_guild_post,
                                                                           figure
                                                                               =
                                                                               V2_figure,
                                                                           figure_score
                                                                               =
                                                                               V2_figure_score,
                                                                           last_ate
                                                                               =
                                                                               V2_last_ate,
                                                                           has_food
                                                                               =
                                                                               V2_has_food}
                                                           <- V1_participants]))/binary>>
                                 || #parade_procession{unit_id =
                                                           {V1_battle_id,
                                                            V1_uid},
                                                       unit_base_id =
                                                           V1_unit_base_id,
                                                       participants =
                                                           V1_participants}
                                        <- V0_parade_procession]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13303:16/little,
       D_a_t_a/binary>>};
pack(cli, 13304, {}) ->
    {ok, <<2:32/little, 13304:16/little>>};
pack(srv, 13304,
     {{V0_battle_id, V0_uid},
      V0_unit_base_id,
      V0_map_id,
      #parade_participant{id =
                              {V0_id, V0_platform, V0_zone_id},
                          name = V0_name, sex = V0_sex, classes = V0_classes,
                          lev = V0_lev,
                          guild_id = {V0_g_id, V0_g_platform, V0_g_zone_id},
                          guild = V0_guild, guild_post = V0_guild_post,
                          figure = V0_figure, figure_score = V0_figure_score,
                          last_ate = V0_last_ate, has_food = V0_has_food}}) ->
    D_a_t_a = <<V0_battle_id:32/little, V0_uid:32/little,
                V0_unit_base_id:32/little, V0_map_id:32/little,
                V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_sex:8/little, V0_classes:8/little, V0_lev:8/little,
                V0_g_id:32/little,
                (protocol:pack(string, V0_g_platform))/binary,
                V0_g_zone_id:16/little,
                (protocol:pack(string, V0_guild))/binary,
                (protocol:pack(string, V0_guild_post))/binary,
                V0_figure:8/little, V0_figure_score:16/little,
                V0_last_ate:32/little, V0_has_food:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13304:16/little,
       D_a_t_a/binary>>};
pack(cli, 13305, {}) ->
    {ok, <<2:32/little, 13305:16/little>>};
pack(srv, 13305,
     {{V0_battle_id, V0_uid},
      V0_unit_base_id,
      V0_map_id,
      #parade_participant{id =
                              {V0_id, V0_platform, V0_zone_id},
                          name = V0_name}}) ->
    D_a_t_a = <<V0_battle_id:32/little, V0_uid:32/little,
                V0_unit_base_id:32/little, V0_map_id:32/little,
                V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13305:16/little,
       D_a_t_a/binary>>};
pack(cli, 13306, {}) ->
    {ok, <<2:32/little, 13306:16/little>>};
pack(srv, 13306, {V0_exp, V0_figure_score}) ->
    D_a_t_a = <<V0_exp:32/little,
                V0_figure_score:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13306:16/little,
       D_a_t_a/binary>>};
pack(cli, 13307, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13307:16/little,
       D_a_t_a/binary>>};
pack(srv, 13307, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13307:16/little,
       D_a_t_a/binary>>};
pack(cli, 13308, {}) ->
    {ok, <<2:32/little, 13308:16/little>>};
pack(srv, 13308,
     {{V0_battle_id, V0_uid},
      V0_unit_base_id,
      V0_map_id,
      #parade_participant{id =
                              {V0_id, V0_platform, V0_zone_id},
                          figure = V0_figure, figure_score = V0_figure_score,
                          last_ate = V0_last_ate, has_food = V0_has_food}}) ->
    D_a_t_a = <<V0_battle_id:32/little, V0_uid:32/little,
                V0_unit_base_id:32/little, V0_map_id:32/little,
                V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_figure:8/little,
                V0_figure_score:16/little, V0_last_ate:32/little,
                V0_has_food:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13308:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 13300, _B0) -> {ok, {}};
unpack(cli, 13300, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_timeout, _B2} = protocol:uint32(_B1),
    {ok, {V1_status, V1_timeout}};
unpack(srv, 13301, _B0) -> {ok, {}};
unpack(cli, 13301, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 13302, _B0) -> {ok, {}};
unpack(cli, 13302, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 13303, _B0) -> {ok, {}};
unpack(cli, 13303, _B0) ->
    {V1_parade_procession, _B25} = protocol:array(_B0,
                                                  fun (_B1) ->
                                                          {V2_battle_id, _B2} =
                                                              protocol:uint32(_B1),
                                                          {V2_uid, _B3} =
                                                              protocol:uint32(_B2),
                                                          {V2_unit_base_id,
                                                           _B4} =
                                                              protocol:uint32(_B3),
                                                          {V2_participants,
                                                           _B23} =
                                                              protocol:array(_B4,
                                                                             fun
                                                                                 (_B5) ->
                                                                                     {V3_id,
                                                                                      _B6} =
                                                                                         protocol:uint32(_B5),
                                                                                     {V3_platform,
                                                                                      _B7} =
                                                                                         protocol:string(_B6),
                                                                                     {V3_zone_id,
                                                                                      _B8} =
                                                                                         protocol:uint16(_B7),
                                                                                     {V3_name,
                                                                                      _B9} =
                                                                                         protocol:string(_B8),
                                                                                     {V3_sex,
                                                                                      _B10} =
                                                                                         protocol:uint8(_B9),
                                                                                     {V3_classes,
                                                                                      _B11} =
                                                                                         protocol:uint8(_B10),
                                                                                     {V3_lev,
                                                                                      _B12} =
                                                                                         protocol:uint8(_B11),
                                                                                     {V3_g_id,
                                                                                      _B13} =
                                                                                         protocol:uint32(_B12),
                                                                                     {V3_g_platform,
                                                                                      _B14} =
                                                                                         protocol:string(_B13),
                                                                                     {V3_g_zone_id,
                                                                                      _B15} =
                                                                                         protocol:uint16(_B14),
                                                                                     {V3_guild,
                                                                                      _B16} =
                                                                                         protocol:string(_B15),
                                                                                     {V3_guild_post,
                                                                                      _B17} =
                                                                                         protocol:string(_B16),
                                                                                     {V3_figure,
                                                                                      _B18} =
                                                                                         protocol:uint8(_B17),
                                                                                     {V3_figure_score,
                                                                                      _B19} =
                                                                                         protocol:uint16(_B18),
                                                                                     {V3_last_ate,
                                                                                      _B20} =
                                                                                         protocol:uint32(_B19),
                                                                                     {V3_has_food,
                                                                                      _B21} =
                                                                                         protocol:uint8(_B20),
                                                                                     {{V3_id,
                                                                                       V3_platform,
                                                                                       V3_zone_id,
                                                                                       V3_name,
                                                                                       V3_sex,
                                                                                       V3_classes,
                                                                                       V3_lev,
                                                                                       V3_g_id,
                                                                                       V3_g_platform,
                                                                                       V3_g_zone_id,
                                                                                       V3_guild,
                                                                                       V3_guild_post,
                                                                                       V3_figure,
                                                                                       V3_figure_score,
                                                                                       V3_last_ate,
                                                                                       V3_has_food},
                                                                                      _B21}
                                                                             end),
                                                          {{V2_battle_id,
                                                            V2_uid,
                                                            V2_unit_base_id,
                                                            V2_participants},
                                                           _B23}
                                                  end),
    {ok, {V1_parade_procession}};
unpack(srv, 13304, _B0) -> {ok, {}};
unpack(cli, 13304, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_uid, _B2} = protocol:uint32(_B1),
    {V1_unit_base_id, _B3} = protocol:uint32(_B2),
    {V1_map_id, _B4} = protocol:uint32(_B3),
    {V1_id, _B5} = protocol:uint32(_B4),
    {V1_platform, _B6} = protocol:string(_B5),
    {V1_zone_id, _B7} = protocol:uint16(_B6),
    {V1_name, _B8} = protocol:string(_B7),
    {V1_sex, _B9} = protocol:uint8(_B8),
    {V1_classes, _B10} = protocol:uint8(_B9),
    {V1_lev, _B11} = protocol:uint8(_B10),
    {V1_g_id, _B12} = protocol:uint32(_B11),
    {V1_g_platform, _B13} = protocol:string(_B12),
    {V1_g_zone_id, _B14} = protocol:uint16(_B13),
    {V1_guild, _B15} = protocol:string(_B14),
    {V1_guild_post, _B16} = protocol:string(_B15),
    {V1_figure, _B17} = protocol:uint8(_B16),
    {V1_figure_score, _B18} = protocol:uint16(_B17),
    {V1_last_ate, _B19} = protocol:uint32(_B18),
    {V1_has_food, _B20} = protocol:uint8(_B19),
    {ok,
     {V1_battle_id,
      V1_uid,
      V1_unit_base_id,
      V1_map_id,
      V1_id,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_sex,
      V1_classes,
      V1_lev,
      V1_g_id,
      V1_g_platform,
      V1_g_zone_id,
      V1_guild,
      V1_guild_post,
      V1_figure,
      V1_figure_score,
      V1_last_ate,
      V1_has_food}};
unpack(srv, 13305, _B0) -> {ok, {}};
unpack(cli, 13305, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_uid, _B2} = protocol:uint32(_B1),
    {V1_unit_base_id, _B3} = protocol:uint32(_B2),
    {V1_map_id, _B4} = protocol:uint32(_B3),
    {V1_id, _B5} = protocol:uint32(_B4),
    {V1_platform, _B6} = protocol:string(_B5),
    {V1_zone_id, _B7} = protocol:uint16(_B6),
    {V1_name, _B8} = protocol:string(_B7),
    {ok,
     {V1_battle_id,
      V1_uid,
      V1_unit_base_id,
      V1_map_id,
      V1_id,
      V1_platform,
      V1_zone_id,
      V1_name}};
unpack(srv, 13306, _B0) -> {ok, {}};
unpack(cli, 13306, _B0) ->
    {V1_exp, _B1} = protocol:uint32(_B0),
    {V1_figure_score, _B2} = protocol:uint16(_B1),
    {ok, {V1_exp, V1_figure_score}};
unpack(srv, 13307, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 13307, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 13308, _B0) -> {ok, {}};
unpack(cli, 13308, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_uid, _B2} = protocol:uint32(_B1),
    {V1_unit_base_id, _B3} = protocol:uint32(_B2),
    {V1_map_id, _B4} = protocol:uint32(_B3),
    {V1_id, _B5} = protocol:uint32(_B4),
    {V1_platform, _B6} = protocol:string(_B5),
    {V1_zone_id, _B7} = protocol:uint16(_B6),
    {V1_figure, _B8} = protocol:uint8(_B7),
    {V1_figure_score, _B9} = protocol:uint16(_B8),
    {V1_last_ate, _B10} = protocol:uint32(_B9),
    {V1_has_food, _B11} = protocol:uint8(_B10),
    {ok,
     {V1_battle_id,
      V1_uid,
      V1_unit_base_id,
      V1_map_id,
      V1_id,
      V1_platform,
      V1_zone_id,
      V1_figure,
      V1_figure_score,
      V1_last_ate,
      V1_has_food}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

