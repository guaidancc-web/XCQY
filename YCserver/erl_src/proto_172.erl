-file("src/proto/proto_172.erl", 1).

-module(proto_172).

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

-file("src/proto/proto_172.erl", 14).

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

-file("src/proto/proto_172.erl", 15).

-file("inc/endless_challenge.hrl", 1).

-record(m_endless_challenge,
        {ver = 3 :: pos_integer(),
         is_prepare = 0 :: non_neg_integer(),
         choose_skills = [],
         reward_list = [],
         best_wave = 0 :: non_neg_integer(),
         skill_list = [] :: list(),
         turn_count = 0,
         free_count = 0,
         fighter_times = 0}).

-record(mate_data,
        {id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         best_wave = 0,
         max_wave = 0,
         is_prepare = 0 :: non_neg_integer(),
         choose_skills = []}).

-record(endless_challenge_rank,
        {ver = 1 :: non_neg_integer(),
         id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         wave = 0 :: non_neg_integer(),
         use_time = 0 :: non_neg_integer(),
         mate_datas = []}).

-file("src/proto/proto_172.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 17200, {}) ->
    {ok, <<2:32/little, 17200:16/little>>};
pack(srv, 17200, {V0_mates}) ->
    D_a_t_a = <<(length(V0_mates)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_classes:8/little, V1_sex:8/little,
                                   V1_lev:16/little, V1_is_prepare:8/little,
                                   V1_best_wave:32/little,
                                   (length(V1_choose_skills)):16/little,
                                   (list_to_binary([<<V2_index:8/little,
                                                      V2_skill_id:32/little>>
                                                    || {V2_index, V2_skill_id}
                                                           <- V1_choose_skills]))/binary>>
                                 || #mate_data{id =
                                                   {V1_rid,
                                                    V1_platform,
                                                    V1_zone_id},
                                               name = V1_name,
                                               classes = V1_classes,
                                               sex = V1_sex, lev = V1_lev,
                                               is_prepare = V1_is_prepare,
                                               best_wave = V1_best_wave,
                                               choose_skills = V1_choose_skills}
                                        <- V0_mates]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17200:16/little,
       D_a_t_a/binary>>};
pack(cli, 17201, {}) ->
    {ok, <<2:32/little, 17201:16/little>>};
pack(srv, 17201, {V0_errc_ode, V0_msg}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17201:16/little,
       D_a_t_a/binary>>};
pack(cli, 17202, {}) ->
    {ok, <<2:32/little, 17202:16/little>>};
pack(srv, 17202, {V0_errc_ode, V0_msg}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17202:16/little,
       D_a_t_a/binary>>};
pack(cli, 17203, {V0_index, V0_skill_id}) ->
    D_a_t_a = <<V0_index:32/little, V0_skill_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17203:16/little,
       D_a_t_a/binary>>};
pack(srv, 17203, {V0_errc_ode, V0_msg}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17203:16/little,
       D_a_t_a/binary>>};
pack(cli, 17204, {V0_flag}) ->
    D_a_t_a = <<V0_flag:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17204:16/little,
       D_a_t_a/binary>>};
pack(srv, 17204, {V0_errc_ode, V0_msg}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17204:16/little,
       D_a_t_a/binary>>};
pack(cli, 17205, {}) ->
    {ok, <<2:32/little, 17205:16/little>>};
pack(srv, 17205, {V0_wave, V0_reward_info}) ->
    D_a_t_a = <<V0_wave:32/little,
                (length(V0_reward_info)):16/little,
                (list_to_binary([<<V1_assets:32/little,
                                   V1_val:32/little>>
                                 || {V1_assets, V1_val}
                                        <- V0_reward_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17205:16/little,
       D_a_t_a/binary>>};
pack(cli, 17206, {}) ->
    {ok, <<2:32/little, 17206:16/little>>};
pack(srv, 17206, {V0_rank_list}) ->
    D_a_t_a = <<(length(V0_rank_list)):16/little,
                (list_to_binary([<<V1_rank:32/little, V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_classes:8/little, V1_sex:8/little,
                                   V1_lev:16/little, V1_wave:16/little,
                                   V1_use_time:32/little,
                                   (length(V1_mate_datas)):16/little,
                                   (list_to_binary([<<V2_rid:32/little,
                                                      (protocol:pack(string,
                                                                     V2_platform))/binary,
                                                      V2_zone_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_name))/binary,
                                                      V2_classes:8/little,
                                                      V2_sex:8/little,
                                                      V2_lev:16/little,
                                                      (length(V2_choose_skills)):16/little,
                                                      (list_to_binary([<<V3_index:8/little,
                                                                         V3_skill_id:32/little>>
                                                                       || {V3_index,
                                                                           V3_skill_id}
                                                                              <- V2_choose_skills]))/binary>>
                                                    || #mate_data{id =
                                                                      {V2_rid,
                                                                       V2_platform,
                                                                       V2_zone_id},
                                                                  name =
                                                                      V2_name,
                                                                  classes =
                                                                      V2_classes,
                                                                  sex = V2_sex,
                                                                  lev = V2_lev,
                                                                  choose_skills
                                                                      =
                                                                      V2_choose_skills}
                                                           <- V1_mate_datas]))/binary>>
                                 || {V1_rank,
                                     #endless_challenge_rank{id =
                                                                 {V1_rid,
                                                                  V1_platform,
                                                                  V1_zone_id},
                                                             name = V1_name,
                                                             classes =
                                                                 V1_classes,
                                                             sex = V1_sex,
                                                             lev = V1_lev,
                                                             wave = V1_wave,
                                                             use_time =
                                                                 V1_use_time,
                                                             mate_datas =
                                                                 V1_mate_datas}}
                                        <- V0_rank_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17206:16/little,
       D_a_t_a/binary>>};
pack(cli, 17207, {V0_skill_id}) ->
    D_a_t_a = <<V0_skill_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17207:16/little,
       D_a_t_a/binary>>};
pack(srv, 17207, {V0_errc_ode, V0_msg}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17207:16/little,
       D_a_t_a/binary>>};
pack(cli, 17208, {}) ->
    {ok, <<2:32/little, 17208:16/little>>};
pack(srv, 17208,
     {{V0_rid, V0_platform, V0_zone_id},
      V0_is_prepare,
      V0_choose_skills}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_is_prepare:8/little,
                (length(V0_choose_skills)):16/little,
                (list_to_binary([<<V1_index:8/little,
                                   V1_skill_id:32/little>>
                                 || {V1_index, V1_skill_id}
                                        <- V0_choose_skills]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17208:16/little,
       D_a_t_a/binary>>};
pack(cli, 17209, {}) ->
    {ok, <<2:32/little, 17209:16/little>>};
pack(srv, 17209, {V0_result, V0_msg, V0_gl_list}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                (length(V0_gl_list)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_val:32/little>>
                                 || {V1_base_id, V1_val}
                                        <- V0_gl_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17209:16/little,
       D_a_t_a/binary>>};
pack(cli, 17210, {}) ->
    {ok, <<2:32/little, 17210:16/little>>};
pack(srv, 17210, {V0_reward_info}) ->
    D_a_t_a = <<(length(V0_reward_info)):16/little,
                (list_to_binary([<<V1_assets:32/little,
                                   V1_val:32/little>>
                                 || {V1_assets, V1_val}
                                        <- V0_reward_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17210:16/little,
       D_a_t_a/binary>>};
pack(cli, 17211, {}) ->
    {ok, <<2:32/little, 17211:16/little>>};
pack(srv, 17211, {V0_errc_ode, V0_msg}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17211:16/little,
       D_a_t_a/binary>>};
pack(cli, 17212, {}) ->
    {ok, <<2:32/little, 17212:16/little>>};
pack(srv, 17212, {V0_skill_list, V0_choose_skills}) ->
    D_a_t_a = <<(length(V0_skill_list)):16/little,
                (list_to_binary([<<V1_skill_id:32/little>>
                                 || V1_skill_id <- V0_skill_list]))/binary,
                (length(V0_choose_skills)):16/little,
                (list_to_binary([<<V1_index:8/little,
                                   V1_skill_id:32/little>>
                                 || {V1_index, V1_skill_id}
                                        <- V0_choose_skills]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17212:16/little,
       D_a_t_a/binary>>};
pack(cli, 17213, {}) ->
    {ok, <<2:32/little, 17213:16/little>>};
pack(srv, 17213,
     {V0_order,
      V0_best_wave,
      V0_free_count,
      V0_turn_count,
      V0_gain_list}) ->
    D_a_t_a = <<V0_order:8/little, V0_best_wave:16/little,
                V0_free_count:8/little, V0_turn_count:8/little,
                (length(V0_gain_list)):16/little,
                (list_to_binary([<<V1_item_id1:32/little,
                                   V1_num1:8/little>>
                                 || {V1_item_id1, V1_num1}
                                        <- V0_gain_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17213:16/little,
       D_a_t_a/binary>>};
pack(cli, 17214, {V0_index}) ->
    D_a_t_a = <<V0_index:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17214:16/little,
       D_a_t_a/binary>>};
pack(srv, 17214, {V0_errc_ode, V0_msg}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17214:16/little,
       D_a_t_a/binary>>};
pack(cli, 17215, {}) ->
    {ok, <<2:32/little, 17215:16/little>>};
pack(srv, 17215, {V0_fight_times, V0_best_wave}) ->
    D_a_t_a = <<V0_fight_times:8/little,
                V0_best_wave:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17215:16/little,
       D_a_t_a/binary>>};
pack(cli, 17216, {}) ->
    {ok, <<2:32/little, 17216:16/little>>};
pack(srv, 17216, {V0_errc_ode, V0_msg}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17216:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 17200, _B0) -> {ok, {}};
unpack(cli, 17200, _B0) ->
    {V1_mates, _B17} = protocol:array(_B0,
                                      fun (_B1) ->
                                              {V2_rid, _B2} =
                                                  protocol:uint32(_B1),
                                              {V2_platform, _B3} =
                                                  protocol:string(_B2),
                                              {V2_zone_id, _B4} =
                                                  protocol:uint32(_B3),
                                              {V2_name, _B5} =
                                                  protocol:string(_B4),
                                              {V2_classes, _B6} =
                                                  protocol:uint8(_B5),
                                              {V2_sex, _B7} =
                                                  protocol:uint8(_B6),
                                              {V2_lev, _B8} =
                                                  protocol:uint16(_B7),
                                              {V2_is_prepare, _B9} =
                                                  protocol:uint8(_B8),
                                              {V2_best_wave, _B10} =
                                                  protocol:uint32(_B9),
                                              {V2_choose_skills, _B15} =
                                                  protocol:array(_B10,
                                                                 fun (_B11) ->
                                                                         {V3_index,
                                                                          _B12} =
                                                                             protocol:uint8(_B11),
                                                                         {V3_skill_id,
                                                                          _B13} =
                                                                             protocol:uint32(_B12),
                                                                         {{V3_index,
                                                                           V3_skill_id},
                                                                          _B13}
                                                                 end),
                                              {{V2_rid,
                                                V2_platform,
                                                V2_zone_id,
                                                V2_name,
                                                V2_classes,
                                                V2_sex,
                                                V2_lev,
                                                V2_is_prepare,
                                                V2_best_wave,
                                                V2_choose_skills},
                                               _B15}
                                      end),
    {ok, {V1_mates}};
unpack(srv, 17201, _B0) -> {ok, {}};
unpack(cli, 17201, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_errc_ode, V1_msg}};
unpack(srv, 17202, _B0) -> {ok, {}};
unpack(cli, 17202, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_errc_ode, V1_msg}};
unpack(srv, 17203, _B0) ->
    {V1_index, _B1} = protocol:uint32(_B0),
    {V1_skill_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_index, V1_skill_id}};
unpack(cli, 17203, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_errc_ode, V1_msg}};
unpack(srv, 17204, _B0) ->
    {V1_flag, _B1} = protocol:uint32(_B0),
    {ok, {V1_flag}};
unpack(cli, 17204, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_errc_ode, V1_msg}};
unpack(srv, 17205, _B0) -> {ok, {}};
unpack(cli, 17205, _B0) ->
    {V1_wave, _B1} = protocol:uint32(_B0),
    {V1_reward_info, _B6} = protocol:array(_B1,
                                           fun (_B2) ->
                                                   {V2_assets, _B3} =
                                                       protocol:uint32(_B2),
                                                   {V2_val, _B4} =
                                                       protocol:uint32(_B3),
                                                   {{V2_assets, V2_val}, _B4}
                                           end),
    {ok, {V1_wave, V1_reward_info}};
unpack(srv, 17206, _B0) -> {ok, {}};
unpack(cli, 17206, _B0) ->
    {V1_rank_list, _B28} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_rank, _B2} =
                                                      protocol:uint32(_B1),
                                                  {V2_rid, _B3} =
                                                      protocol:uint32(_B2),
                                                  {V2_platform, _B4} =
                                                      protocol:string(_B3),
                                                  {V2_zone_id, _B5} =
                                                      protocol:uint32(_B4),
                                                  {V2_name, _B6} =
                                                      protocol:string(_B5),
                                                  {V2_classes, _B7} =
                                                      protocol:uint8(_B6),
                                                  {V2_sex, _B8} =
                                                      protocol:uint8(_B7),
                                                  {V2_lev, _B9} =
                                                      protocol:uint16(_B8),
                                                  {V2_wave, _B10} =
                                                      protocol:uint16(_B9),
                                                  {V2_use_time, _B11} =
                                                      protocol:uint32(_B10),
                                                  {V2_mate_datas, _B26} =
                                                      protocol:array(_B11,
                                                                     fun
                                                                         (_B12) ->
                                                                             {V3_rid,
                                                                              _B13} =
                                                                                 protocol:uint32(_B12),
                                                                             {V3_platform,
                                                                              _B14} =
                                                                                 protocol:string(_B13),
                                                                             {V3_zone_id,
                                                                              _B15} =
                                                                                 protocol:uint32(_B14),
                                                                             {V3_name,
                                                                              _B16} =
                                                                                 protocol:string(_B15),
                                                                             {V3_classes,
                                                                              _B17} =
                                                                                 protocol:uint8(_B16),
                                                                             {V3_sex,
                                                                              _B18} =
                                                                                 protocol:uint8(_B17),
                                                                             {V3_lev,
                                                                              _B19} =
                                                                                 protocol:uint16(_B18),
                                                                             {V3_choose_skills,
                                                                              _B24} =
                                                                                 protocol:array(_B19,
                                                                                                fun
                                                                                                    (_B20) ->
                                                                                                        {V4_index,
                                                                                                         _B21} =
                                                                                                            protocol:uint8(_B20),
                                                                                                        {V4_skill_id,
                                                                                                         _B22} =
                                                                                                            protocol:uint32(_B21),
                                                                                                        {{V4_index,
                                                                                                          V4_skill_id},
                                                                                                         _B22}
                                                                                                end),
                                                                             {{V3_rid,
                                                                               V3_platform,
                                                                               V3_zone_id,
                                                                               V3_name,
                                                                               V3_classes,
                                                                               V3_sex,
                                                                               V3_lev,
                                                                               V3_choose_skills},
                                                                              _B24}
                                                                     end),
                                                  {{V2_rank,
                                                    V2_rid,
                                                    V2_platform,
                                                    V2_zone_id,
                                                    V2_name,
                                                    V2_classes,
                                                    V2_sex,
                                                    V2_lev,
                                                    V2_wave,
                                                    V2_use_time,
                                                    V2_mate_datas},
                                                   _B26}
                                          end),
    {ok, {V1_rank_list}};
unpack(srv, 17207, _B0) ->
    {V1_skill_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_skill_id}};
unpack(cli, 17207, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_errc_ode, V1_msg}};
unpack(srv, 17208, _B0) -> {ok, {}};
unpack(cli, 17208, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_is_prepare, _B4} = protocol:uint8(_B3),
    {V1_choose_skills, _B9} = protocol:array(_B4,
                                             fun (_B5) ->
                                                     {V2_index, _B6} =
                                                         protocol:uint8(_B5),
                                                     {V2_skill_id, _B7} =
                                                         protocol:uint32(_B6),
                                                     {{V2_index, V2_skill_id},
                                                      _B7}
                                             end),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_is_prepare,
      V1_choose_skills}};
unpack(srv, 17209, _B0) -> {ok, {}};
unpack(cli, 17209, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_gl_list, _B7} = protocol:array(_B2,
                                       fun (_B3) ->
                                               {V2_base_id, _B4} =
                                                   protocol:uint32(_B3),
                                               {V2_val, _B5} =
                                                   protocol:uint32(_B4),
                                               {{V2_base_id, V2_val}, _B5}
                                       end),
    {ok, {V1_result, V1_msg, V1_gl_list}};
unpack(srv, 17210, _B0) -> {ok, {}};
unpack(cli, 17210, _B0) ->
    {V1_reward_info, _B5} = protocol:array(_B0,
                                           fun (_B1) ->
                                                   {V2_assets, _B2} =
                                                       protocol:uint32(_B1),
                                                   {V2_val, _B3} =
                                                       protocol:uint32(_B2),
                                                   {{V2_assets, V2_val}, _B3}
                                           end),
    {ok, {V1_reward_info}};
unpack(srv, 17211, _B0) -> {ok, {}};
unpack(cli, 17211, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_errc_ode, V1_msg}};
unpack(srv, 17212, _B0) -> {ok, {}};
unpack(cli, 17212, _B0) ->
    {V1_skill_list, _B4} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_skill_id, _B2} =
                                                      protocol:uint32(_B1),
                                                  {{V2_skill_id}, _B2}
                                          end),
    {V1_choose_skills, _B9} = protocol:array(_B4,
                                             fun (_B5) ->
                                                     {V2_index, _B6} =
                                                         protocol:uint8(_B5),
                                                     {V2_skill_id, _B7} =
                                                         protocol:uint32(_B6),
                                                     {{V2_index, V2_skill_id},
                                                      _B7}
                                             end),
    {ok, {V1_skill_list, V1_choose_skills}};
unpack(srv, 17213, _B0) -> {ok, {}};
unpack(cli, 17213, _B0) ->
    {V1_order, _B1} = protocol:uint8(_B0),
    {V1_best_wave, _B2} = protocol:uint16(_B1),
    {V1_free_count, _B3} = protocol:uint8(_B2),
    {V1_turn_count, _B4} = protocol:uint8(_B3),
    {V1_gain_list, _B9} = protocol:array(_B4,
                                         fun (_B5) ->
                                                 {V2_item_id1, _B6} =
                                                     protocol:uint32(_B5),
                                                 {V2_num1, _B7} =
                                                     protocol:uint8(_B6),
                                                 {{V2_item_id1, V2_num1}, _B7}
                                         end),
    {ok,
     {V1_order,
      V1_best_wave,
      V1_free_count,
      V1_turn_count,
      V1_gain_list}};
unpack(srv, 17214, _B0) ->
    {V1_index, _B1} = protocol:uint8(_B0),
    {ok, {V1_index}};
unpack(cli, 17214, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_errc_ode, V1_msg}};
unpack(srv, 17215, _B0) -> {ok, {}};
unpack(cli, 17215, _B0) ->
    {V1_fight_times, _B1} = protocol:uint8(_B0),
    {V1_best_wave, _B2} = protocol:uint32(_B1),
    {ok, {V1_fight_times, V1_best_wave}};
unpack(srv, 17216, _B0) -> {ok, {}};
unpack(cli, 17216, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_errc_ode, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

