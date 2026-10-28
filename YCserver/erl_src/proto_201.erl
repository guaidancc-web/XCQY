-file("src/proto/proto_201.erl", 1).

-module(proto_201).

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

-file("src/proto/proto_201.erl", 14).

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

-file("src/proto/proto_201.erl", 15).

-file("inc/question_match.hrl", 1).

-record(question_match_role,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         looks = [],
         break_times = 0,
         fc = 0,
         right_count = 0,
         score = 0,
         choose = 1,
         answer_time = 0,
         rank = 0,
         his_items = [],
         map_id = 0,
         is_join = 0,
         lasted_right = 0}).

-record(question_match_zone,
        {map_id = 0, map_pid = 0, role_count = 0}).

-file("src/proto/proto_201.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 20100, {}) ->
    {ok, <<2:32/little, 20100:16/little>>};
pack(srv, 20100, {V0_status, V0_endtime}) ->
    D_a_t_a = <<V0_status:8/little, V0_endtime:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20100:16/little,
       D_a_t_a/binary>>};
pack(cli, 20101, {}) ->
    {ok, <<2:32/little, 20101:16/little>>};
pack(srv, 20101,
     {V0_status,
      V0_endtime,
      V0_round,
      V0_question_id,
      V0_answer}) ->
    D_a_t_a = <<V0_status:8/little, V0_endtime:32/little,
                V0_round:32/little, V0_question_id:32/little,
                V0_answer:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20101:16/little,
       D_a_t_a/binary>>};
pack(cli, 20102, {}) ->
    {ok, <<2:32/little, 20102:16/little>>};
pack(srv, 20102, {V0_choose_info}) ->
    D_a_t_a = <<(length(V0_choose_info)):16/little,
                (list_to_binary([<<V1_choose:8/little,
                                   V1_count:32/little>>
                                 || {V1_choose, V1_count}
                                        <- V0_choose_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20102:16/little,
       D_a_t_a/binary>>};
pack(cli, 20103, {}) ->
    {ok, <<2:32/little, 20103:16/little>>};
pack(srv, 20103, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20103:16/little,
       D_a_t_a/binary>>};
pack(cli, 20104, {}) ->
    {ok, <<2:32/little, 20104:16/little>>};
pack(srv, 20104, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20104:16/little,
       D_a_t_a/binary>>};
pack(cli, 20105, {V0_choose}) ->
    D_a_t_a = <<V0_choose:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20105:16/little,
       D_a_t_a/binary>>};
pack(srv, 20105, {V0_err_code, V0_msg, V0_choose}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_choose:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20105:16/little,
       D_a_t_a/binary>>};
pack(cli, 20106, {}) ->
    {ok, <<2:32/little, 20106:16/little>>};
pack(srv, 20106, {V0_rank_list}) ->
    D_a_t_a = <<(length(V0_rank_list)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:32/little, V1_classes:8/little,
                                   V1_sex:8/little, V1_break_times:8/little,
                                   V1_right_count:16/little, V1_score:32/little,
                                   V1_choose:8/little, V1_rank:16/little>>
                                 || #question_match_role{id =
                                                             {V1_rid,
                                                              V1_platform,
                                                              V1_zone_id},
                                                         name = V1_name,
                                                         lev = V1_lev,
                                                         classes = V1_classes,
                                                         sex = V1_sex,
                                                         break_times =
                                                             V1_break_times,
                                                         right_count =
                                                             V1_right_count,
                                                         score = V1_score,
                                                         choose = V1_choose,
                                                         rank = V1_rank}
                                        <- V0_rank_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20106:16/little,
       D_a_t_a/binary>>};
pack(cli, 20107, {}) ->
    {ok, <<2:32/little, 20107:16/little>>};
pack(srv, 20107,
     {#question_match_role{right_count = V0_right_count,
                           score = V0_score, his_items = V0_his_items,
                           choose = V0_choose}}) ->
    D_a_t_a = <<V0_right_count:16/little,
                V0_score:32/little, (length(V0_his_items)):16/little,
                (list_to_binary([<<V1_assets:32/little,
                                   V1_val:32/little>>
                                 || {V1_assets, V1_val}
                                        <- V0_his_items]))/binary,
                V0_choose:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20107:16/little,
       D_a_t_a/binary>>};
pack(cli, 20108, {}) ->
    {ok, <<2:32/little, 20108:16/little>>};
pack(srv, 20108,
     {{V0_id, V0_platform, V0_zone_id}, V0_choose}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_choose:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20108:16/little,
       D_a_t_a/binary>>};
pack(cli, 20109, {}) ->
    {ok, <<2:32/little, 20109:16/little>>};
pack(srv, 20109, {V0_rank_list}) ->
    D_a_t_a = <<(length(V0_rank_list)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:32/little, V1_classes:8/little,
                                   V1_sex:8/little, V1_break_times:8/little,
                                   V1_right_count:16/little, V1_score:32/little,
                                   V1_choose:8/little, V1_rank:16/little,
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
                                                           <- V1_looks]))/binary>>
                                 || #question_match_role{id =
                                                             {V1_rid,
                                                              V1_platform,
                                                              V1_zone_id},
                                                         name = V1_name,
                                                         lev = V1_lev,
                                                         classes = V1_classes,
                                                         sex = V1_sex,
                                                         break_times =
                                                             V1_break_times,
                                                         right_count =
                                                             V1_right_count,
                                                         score = V1_score,
                                                         choose = V1_choose,
                                                         rank = V1_rank,
                                                         looks = V1_looks}
                                        <- V0_rank_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20109:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 20100, _B0) -> {ok, {}};
unpack(cli, 20100, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_endtime, _B2} = protocol:uint32(_B1),
    {ok, {V1_status, V1_endtime}};
unpack(srv, 20101, _B0) -> {ok, {}};
unpack(cli, 20101, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_endtime, _B2} = protocol:uint32(_B1),
    {V1_round, _B3} = protocol:uint32(_B2),
    {V1_question_id, _B4} = protocol:uint32(_B3),
    {V1_answer, _B5} = protocol:uint32(_B4),
    {ok,
     {V1_status,
      V1_endtime,
      V1_round,
      V1_question_id,
      V1_answer}};
unpack(srv, 20102, _B0) -> {ok, {}};
unpack(cli, 20102, _B0) ->
    {V1_choose_info, _B5} = protocol:array(_B0,
                                           fun (_B1) ->
                                                   {V2_choose, _B2} =
                                                       protocol:uint8(_B1),
                                                   {V2_count, _B3} =
                                                       protocol:uint32(_B2),
                                                   {{V2_choose, V2_count}, _B3}
                                           end),
    {ok, {V1_choose_info}};
unpack(srv, 20103, _B0) -> {ok, {}};
unpack(cli, 20103, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 20104, _B0) -> {ok, {}};
unpack(cli, 20104, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 20105, _B0) ->
    {V1_choose, _B1} = protocol:uint8(_B0),
    {ok, {V1_choose}};
unpack(cli, 20105, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_choose, _B3} = protocol:uint8(_B2),
    {ok, {V1_err_code, V1_msg, V1_choose}};
unpack(srv, 20106, _B0) -> {ok, {}};
unpack(cli, 20106, _B0) ->
    {V1_rank_list, _B15} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_rid, _B2} =
                                                      protocol:uint32(_B1),
                                                  {V2_platform, _B3} =
                                                      protocol:string(_B2),
                                                  {V2_zone_id, _B4} =
                                                      protocol:uint32(_B3),
                                                  {V2_name, _B5} =
                                                      protocol:string(_B4),
                                                  {V2_lev, _B6} =
                                                      protocol:uint32(_B5),
                                                  {V2_classes, _B7} =
                                                      protocol:uint8(_B6),
                                                  {V2_sex, _B8} =
                                                      protocol:uint8(_B7),
                                                  {V2_break_times, _B9} =
                                                      protocol:uint8(_B8),
                                                  {V2_right_count, _B10} =
                                                      protocol:uint16(_B9),
                                                  {V2_score, _B11} =
                                                      protocol:uint32(_B10),
                                                  {V2_choose, _B12} =
                                                      protocol:uint8(_B11),
                                                  {V2_rank, _B13} =
                                                      protocol:uint16(_B12),
                                                  {{V2_rid,
                                                    V2_platform,
                                                    V2_zone_id,
                                                    V2_name,
                                                    V2_lev,
                                                    V2_classes,
                                                    V2_sex,
                                                    V2_break_times,
                                                    V2_right_count,
                                                    V2_score,
                                                    V2_choose,
                                                    V2_rank},
                                                   _B13}
                                          end),
    {ok, {V1_rank_list}};
unpack(srv, 20107, _B0) -> {ok, {}};
unpack(cli, 20107, _B0) ->
    {V1_right_count, _B1} = protocol:uint16(_B0),
    {V1_score, _B2} = protocol:uint32(_B1),
    {V1_his_items, _B7} = protocol:array(_B2,
                                         fun (_B3) ->
                                                 {V2_assets, _B4} =
                                                     protocol:uint32(_B3),
                                                 {V2_val, _B5} =
                                                     protocol:uint32(_B4),
                                                 {{V2_assets, V2_val}, _B5}
                                         end),
    {V1_choose, _B8} = protocol:uint8(_B7),
    {ok,
     {V1_right_count, V1_score, V1_his_items, V1_choose}};
unpack(srv, 20108, _B0) -> {ok, {}};
unpack(cli, 20108, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_choose, _B4} = protocol:uint8(_B3),
    {ok, {V1_id, V1_platform, V1_zone_id, V1_choose}};
unpack(srv, 20109, _B0) -> {ok, {}};
unpack(cli, 20109, _B0) ->
    {V1_rank_list, _B22} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_rid, _B2} =
                                                      protocol:uint32(_B1),
                                                  {V2_platform, _B3} =
                                                      protocol:string(_B2),
                                                  {V2_zone_id, _B4} =
                                                      protocol:uint32(_B3),
                                                  {V2_name, _B5} =
                                                      protocol:string(_B4),
                                                  {V2_lev, _B6} =
                                                      protocol:uint32(_B5),
                                                  {V2_classes, _B7} =
                                                      protocol:uint8(_B6),
                                                  {V2_sex, _B8} =
                                                      protocol:uint8(_B7),
                                                  {V2_break_times, _B9} =
                                                      protocol:uint8(_B8),
                                                  {V2_right_count, _B10} =
                                                      protocol:uint16(_B9),
                                                  {V2_score, _B11} =
                                                      protocol:uint32(_B10),
                                                  {V2_choose, _B12} =
                                                      protocol:uint8(_B11),
                                                  {V2_rank, _B13} =
                                                      protocol:uint16(_B12),
                                                  {V2_looks, _B20} =
                                                      protocol:array(_B13,
                                                                     fun
                                                                         (_B14) ->
                                                                             {V3_looks_type,
                                                                              _B15} =
                                                                                 protocol:uint32(_B14),
                                                                             {V3_looks_mode,
                                                                              _B16} =
                                                                                 protocol:uint32(_B15),
                                                                             {V3_looks_val,
                                                                              _B17} =
                                                                                 protocol:uint32(_B16),
                                                                             {V3_looks_str,
                                                                              _B18} =
                                                                                 protocol:string(_B17),
                                                                             {{V3_looks_type,
                                                                               V3_looks_mode,
                                                                               V3_looks_val,
                                                                               V3_looks_str},
                                                                              _B18}
                                                                     end),
                                                  {{V2_rid,
                                                    V2_platform,
                                                    V2_zone_id,
                                                    V2_name,
                                                    V2_lev,
                                                    V2_classes,
                                                    V2_sex,
                                                    V2_break_times,
                                                    V2_right_count,
                                                    V2_score,
                                                    V2_choose,
                                                    V2_rank,
                                                    V2_looks},
                                                   _B20}
                                          end),
    {ok, {V1_rank_list}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

