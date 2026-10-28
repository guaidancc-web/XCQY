-file("src/proto/proto_208.erl", 1).

-module(proto_208).

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

-file("src/proto/proto_208.erl", 14).

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

-file("src/proto/proto_208.erl", 15).

-file("inc/oracle_treasure.hrl", 1).

-record(m_oracle_treasure,
        {ver = 2,
         is_offer = 0,
         unit_id = 0,
         is_get = 0,
         card_gain_list = [],
         max_wave = 0,
         wave_reward = [],
         week_times = 0,
         times = 0}).

-record(oracle_treasure_state,
        {ts,
         timeout = 0,
         state_name,
         cross_type = 0,
         map_info = []}).

-record(oracle_treasure_unit,
        {base_id = {0, 0},
         ver = 1,
         difficulty = 1,
         kill_times = 0,
         offer_teams = [],
         now_star = 0,
         diff_num = 0}).

-record(oracle_treasure_team,
        {leader_id = {0, "", 0},
         all_mate_id = [],
         team_mates = [],
         record_id = {0, {0, "", 0}},
         wave = 0,
         use_time = 0}).

-record(oracle_treasure_offer_mate,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         fc = 0,
         break_times = 0,
         status = 2,
         looks = []}).

-record(oracle_treasure_rank_rc,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         fc = 0,
         break_times = 0,
         wave = 0,
         use_time = 0,
         rank = 0}).

-record(oracle_treasure_rank_list,
        {group = 0, min_val = {0, 0}, list = [], len = 0}).

-file("src/proto/proto_208.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 20800, {}) ->
    {ok, <<2:32/little, 20800:16/little>>};
pack(srv, 20800,
     {V0_is_offer,
      V0_unit_id,
      V0_max_wave,
      V0_help_times}) ->
    D_a_t_a = <<V0_is_offer:8/little, V0_unit_id:32/little,
                V0_max_wave:32/little, V0_help_times:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20800:16/little,
       D_a_t_a/binary>>};
pack(cli, 20801, {}) ->
    {ok, <<2:32/little, 20801:16/little>>};
pack(srv, 20801, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20801:16/little,
       D_a_t_a/binary>>};
pack(cli, 20802, {}) ->
    {ok, <<2:32/little, 20802:16/little>>};
pack(srv, 20802, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20802:16/little,
       D_a_t_a/binary>>};
pack(cli, 20803, {}) ->
    {ok, <<2:32/little, 20803:16/little>>};
pack(srv, 20803,
     {V0_order, V0_type, V0_gain_list, V0_show_list}) ->
    D_a_t_a = <<V0_order:8/little, V0_type:8/little,
                (length(V0_gain_list)):16/little,
                (list_to_binary([<<V1_item_id1:32/little,
                                   V1_num1:32/little>>
                                 || {V1_item_id1, V1_num1}
                                        <- V0_gain_list]))/binary,
                (length(V0_show_list)):16/little,
                (list_to_binary([<<V1_item_id2:32/little,
                                   V1_num2:32/little>>
                                 || {V1_item_id2, V1_num2}
                                        <- V0_show_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20803:16/little,
       D_a_t_a/binary>>};
pack(cli, 20804, {V0_order}) ->
    D_a_t_a = <<V0_order:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20804:16/little,
       D_a_t_a/binary>>};
pack(srv, 20804, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20804:16/little,
       D_a_t_a/binary>>};
pack(cli, 20805, {}) ->
    {ok, <<2:32/little, 20805:16/little>>};
pack(srv, 20805, {V0_oracle_treasure_unit}) ->
    D_a_t_a = <<(length(V0_oracle_treasure_unit)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_difficulty:8/little,
                                   V1_kill_times:32/little,
                                   (length(V1_offer_teams)):16/little,
                                   (list_to_binary([<<V2_lid:32/little,
                                                      (protocol:pack(string,
                                                                     V2_platform))/binary,
                                                      V2_zone_id:32/little,
                                                      V2_wave:32/little,
                                                      (length(V2_team_mates)):16/little,
                                                      (list_to_binary([<<V3_rid:32/little,
                                                                         (protocol:pack(string,
                                                                                        V3_platform))/binary,
                                                                         V3_zone_id:32/little,
                                                                         (protocol:pack(string,
                                                                                        V3_name))/binary,
                                                                         V3_lev:16/little,
                                                                         V3_classes:8/little,
                                                                         V3_sex:8/little,
                                                                         V3_fc:32/little,
                                                                         V3_break_times:8/little,
                                                                         V3_status:8/little>>
                                                                       || #oracle_treasure_offer_mate{id
                                                                                                          =
                                                                                                          {V3_rid,
                                                                                                           V3_platform,
                                                                                                           V3_zone_id},
                                                                                                      name
                                                                                                          =
                                                                                                          V3_name,
                                                                                                      lev
                                                                                                          =
                                                                                                          V3_lev,
                                                                                                      classes
                                                                                                          =
                                                                                                          V3_classes,
                                                                                                      sex
                                                                                                          =
                                                                                                          V3_sex,
                                                                                                      fc
                                                                                                          =
                                                                                                          V3_fc,
                                                                                                      break_times
                                                                                                          =
                                                                                                          V3_break_times,
                                                                                                      status
                                                                                                          =
                                                                                                          V3_status}
                                                                              <- V2_team_mates]))/binary,
                                                      V2_type:8/little,
                                                      V2_rec_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_rec_platform))/binary,
                                                      V2_rec_zone_id:16/little>>
                                                    || #oracle_treasure_team{leader_id
                                                                                 =
                                                                                 {V2_lid,
                                                                                  V2_platform,
                                                                                  V2_zone_id},
                                                                             wave
                                                                                 =
                                                                                 V2_wave,
                                                                             team_mates
                                                                                 =
                                                                                 V2_team_mates,
                                                                             record_id
                                                                                 =
                                                                                 {V2_type,
                                                                                  {V2_rec_id,
                                                                                   V2_rec_platform,
                                                                                   V2_rec_zone_id}}}
                                                           <- V1_offer_teams]))/binary,
                                   V1_now_star:16/little,
                                   V1_diff_num:32/little>>
                                 || #oracle_treasure_unit{base_id = V1_base_id,
                                                          difficulty =
                                                              V1_difficulty,
                                                          kill_times =
                                                              V1_kill_times,
                                                          offer_teams =
                                                              V1_offer_teams,
                                                          now_star =
                                                              V1_now_star,
                                                          diff_num =
                                                              V1_diff_num}
                                        <- V0_oracle_treasure_unit]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20805:16/little,
       D_a_t_a/binary>>};
pack(cli, 20806, {}) ->
    {ok, <<2:32/little, 20806:16/little>>};
pack(srv, 20806, {V0_status, V0_group}) ->
    D_a_t_a = <<V0_status:8/little, V0_group:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20806:16/little,
       D_a_t_a/binary>>};
pack(cli, 20807, {}) ->
    {ok, <<2:32/little, 20807:16/little>>};
pack(srv, 20807, {V0_wave, V0_reward_info}) ->
    D_a_t_a = <<V0_wave:32/little,
                (length(V0_reward_info)):16/little,
                (list_to_binary([<<V1_assets:32/little,
                                   V1_val:32/little>>
                                 || {V1_assets, V1_val}
                                        <- V0_reward_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20807:16/little,
       D_a_t_a/binary>>};
pack(cli, 20808, {}) ->
    {ok, <<2:32/little, 20808:16/little>>};
pack(srv, 20808, {V0_result, V0_msg, V0_gl_list}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                (length(V0_gl_list)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_val:32/little>>
                                 || {V1_base_id, V1_val}
                                        <- V0_gl_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20808:16/little,
       D_a_t_a/binary>>};
pack(cli, 20809, {}) ->
    {ok, <<2:32/little, 20809:16/little>>};
pack(srv, 20809, {V0_rank_list}) ->
    D_a_t_a = <<(length(V0_rank_list)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little, V1_rank:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:16/little, V1_classes:8/little,
                                   V1_sex:8/little, V1_fc:32/little,
                                   V1_break_times:8/little, V1_wave:16/little,
                                   V1_use_time:32/little>>
                                 || #oracle_treasure_rank_rc{id =
                                                                 {V1_rid,
                                                                  V1_platform,
                                                                  V1_zone_id},
                                                             rank = V1_rank,
                                                             name = V1_name,
                                                             lev = V1_lev,
                                                             classes =
                                                                 V1_classes,
                                                             sex = V1_sex,
                                                             fc = V1_fc,
                                                             break_times =
                                                                 V1_break_times,
                                                             wave = V1_wave,
                                                             use_time =
                                                                 V1_use_time}
                                        <- V0_rank_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20809:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 20800, _B0) -> {ok, {}};
unpack(cli, 20800, _B0) ->
    {V1_is_offer, _B1} = protocol:uint8(_B0),
    {V1_unit_id, _B2} = protocol:uint32(_B1),
    {V1_max_wave, _B3} = protocol:uint32(_B2),
    {V1_help_times, _B4} = protocol:uint16(_B3),
    {ok,
     {V1_is_offer, V1_unit_id, V1_max_wave, V1_help_times}};
unpack(srv, 20801, _B0) -> {ok, {}};
unpack(cli, 20801, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 20802, _B0) -> {ok, {}};
unpack(cli, 20802, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 20803, _B0) -> {ok, {}};
unpack(cli, 20803, _B0) ->
    {V1_order, _B1} = protocol:uint8(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {V1_gain_list, _B7} = protocol:array(_B2,
                                         fun (_B3) ->
                                                 {V2_item_id1, _B4} =
                                                     protocol:uint32(_B3),
                                                 {V2_num1, _B5} =
                                                     protocol:uint32(_B4),
                                                 {{V2_item_id1, V2_num1}, _B5}
                                         end),
    {V1_show_list, _B12} = protocol:array(_B7,
                                          fun (_B8) ->
                                                  {V2_item_id2, _B9} =
                                                      protocol:uint32(_B8),
                                                  {V2_num2, _B10} =
                                                      protocol:uint32(_B9),
                                                  {{V2_item_id2, V2_num2}, _B10}
                                          end),
    {ok, {V1_order, V1_type, V1_gain_list, V1_show_list}};
unpack(srv, 20804, _B0) ->
    {V1_order, _B1} = protocol:uint8(_B0),
    {ok, {V1_order}};
unpack(cli, 20804, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 20805, _B0) -> {ok, {}};
unpack(cli, 20805, _B0) ->
    {V1_oracle_treasure_unit, _B30} = protocol:array(_B0,
                                                     fun (_B1) ->
                                                             {V2_base_id, _B2} =
                                                                 protocol:uint32(_B1),
                                                             {V2_difficulty,
                                                              _B3} =
                                                                 protocol:uint8(_B2),
                                                             {V2_kill_times,
                                                              _B4} =
                                                                 protocol:uint32(_B3),
                                                             {V2_offer_teams,
                                                              _B26} =
                                                                 protocol:array(_B4,
                                                                                fun
                                                                                    (_B5) ->
                                                                                        {V3_lid,
                                                                                         _B6} =
                                                                                            protocol:uint32(_B5),
                                                                                        {V3_platform,
                                                                                         _B7} =
                                                                                            protocol:string(_B6),
                                                                                        {V3_zone_id,
                                                                                         _B8} =
                                                                                            protocol:uint32(_B7),
                                                                                        {V3_wave,
                                                                                         _B9} =
                                                                                            protocol:uint32(_B8),
                                                                                        {V3_team_mates,
                                                                                         _B22} =
                                                                                            protocol:array(_B9,
                                                                                                           fun
                                                                                                               (_B10) ->
                                                                                                                   {V4_rid,
                                                                                                                    _B11} =
                                                                                                                       protocol:uint32(_B10),
                                                                                                                   {V4_platform,
                                                                                                                    _B12} =
                                                                                                                       protocol:string(_B11),
                                                                                                                   {V4_zone_id,
                                                                                                                    _B13} =
                                                                                                                       protocol:uint32(_B12),
                                                                                                                   {V4_name,
                                                                                                                    _B14} =
                                                                                                                       protocol:string(_B13),
                                                                                                                   {V4_lev,
                                                                                                                    _B15} =
                                                                                                                       protocol:uint16(_B14),
                                                                                                                   {V4_classes,
                                                                                                                    _B16} =
                                                                                                                       protocol:uint8(_B15),
                                                                                                                   {V4_sex,
                                                                                                                    _B17} =
                                                                                                                       protocol:uint8(_B16),
                                                                                                                   {V4_fc,
                                                                                                                    _B18} =
                                                                                                                       protocol:uint32(_B17),
                                                                                                                   {V4_break_times,
                                                                                                                    _B19} =
                                                                                                                       protocol:uint8(_B18),
                                                                                                                   {V4_status,
                                                                                                                    _B20} =
                                                                                                                       protocol:uint8(_B19),
                                                                                                                   {{V4_rid,
                                                                                                                     V4_platform,
                                                                                                                     V4_zone_id,
                                                                                                                     V4_name,
                                                                                                                     V4_lev,
                                                                                                                     V4_classes,
                                                                                                                     V4_sex,
                                                                                                                     V4_fc,
                                                                                                                     V4_break_times,
                                                                                                                     V4_status},
                                                                                                                    _B20}
                                                                                                           end),
                                                                                        {V3_type,
                                                                                         _B23} =
                                                                                            protocol:uint8(_B22),
                                                                                        {V3_unique_id,
                                                                                         _B24} =
                                                                                            protocol:tuple(_B23),
                                                                                        {{V3_lid,
                                                                                          V3_platform,
                                                                                          V3_zone_id,
                                                                                          V3_wave,
                                                                                          V3_team_mates,
                                                                                          V3_type,
                                                                                          V3_unique_id},
                                                                                         _B24}
                                                                                end),
                                                             {V2_now_star,
                                                              _B27} =
                                                                 protocol:uint16(_B26),
                                                             {V2_diff_num,
                                                              _B28} =
                                                                 protocol:uint32(_B27),
                                                             {{V2_base_id,
                                                               V2_difficulty,
                                                               V2_kill_times,
                                                               V2_offer_teams,
                                                               V2_now_star,
                                                               V2_diff_num},
                                                              _B28}
                                                     end),
    {ok, {V1_oracle_treasure_unit}};
unpack(srv, 20806, _B0) -> {ok, {}};
unpack(cli, 20806, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_group, _B2} = protocol:uint32(_B1),
    {ok, {V1_status, V1_group}};
unpack(srv, 20807, _B0) -> {ok, {}};
unpack(cli, 20807, _B0) ->
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
unpack(srv, 20808, _B0) -> {ok, {}};
unpack(cli, 20808, _B0) ->
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
unpack(srv, 20809, _B0) -> {ok, {}};
unpack(cli, 20809, _B0) ->
    {V1_rank_list, _B15} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_rid, _B2} =
                                                      protocol:uint32(_B1),
                                                  {V2_platform, _B3} =
                                                      protocol:string(_B2),
                                                  {V2_zone_id, _B4} =
                                                      protocol:uint32(_B3),
                                                  {V2_rank, _B5} =
                                                      protocol:uint16(_B4),
                                                  {V2_name, _B6} =
                                                      protocol:string(_B5),
                                                  {V2_lev, _B7} =
                                                      protocol:uint16(_B6),
                                                  {V2_classes, _B8} =
                                                      protocol:uint8(_B7),
                                                  {V2_sex, _B9} =
                                                      protocol:uint8(_B8),
                                                  {V2_fc, _B10} =
                                                      protocol:uint32(_B9),
                                                  {V2_break_times, _B11} =
                                                      protocol:uint8(_B10),
                                                  {V2_wave, _B12} =
                                                      protocol:uint16(_B11),
                                                  {V2_use_time, _B13} =
                                                      protocol:uint32(_B12),
                                                  {{V2_rid,
                                                    V2_platform,
                                                    V2_zone_id,
                                                    V2_rank,
                                                    V2_name,
                                                    V2_lev,
                                                    V2_classes,
                                                    V2_sex,
                                                    V2_fc,
                                                    V2_break_times,
                                                    V2_wave,
                                                    V2_use_time},
                                                   _B13}
                                          end),
    {ok, {V1_rank_list}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

