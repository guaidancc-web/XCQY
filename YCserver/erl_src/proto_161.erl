-file("src/proto/proto_161.erl", 1).

-module(proto_161).

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

-file("src/proto/proto_161.erl", 14).

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

-file("src/proto/proto_161.erl", 15).

-file("inc/ask.hrl", 1).

-record(ask_state,
        {next_ask_id = 1,
         free_ask_ids = [],
         five_reset_timer,
         platform = "",
         zone_id = 0}).

-record(ask_state_store,
        {ver = 1,
         label = store,
         next_ask_id = 1,
         free_ask_ids = []}).

-record(ask_question,
        {ver = 2,
         id = 0,
         sid = 0,
         qid = 0,
         fun_type = 0,
         start_time = 0,
         q_start_time = 0,
         opts = [],
         answer_list = [],
         agreed = [],
         all_correct = [],
         questions = [],
         answerers = [],
         ext_data = #{}}).

-record(ask_answer,
        {sid = 0,
         qid = 0,
         opts = [],
         result = 0,
         draw_list = [],
         ext_data = []}).

-record(ask_answerer,
        {rid, pid, label = 0, info = #{}, opts = []}).

-file("src/proto/proto_161.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 16100,
     {V0_platform, V0_zone_id, V0_ask_id}) ->
    D_a_t_a = <<(protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_ask_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16100:16/little,
       D_a_t_a/binary>>};
pack(srv, 16100,
     {{V0_platform, V0_zone_id, V0_ask_id},
      V0_fun_type,
      V0_sid,
      V0_qid,
      V0_start_time,
      V0_status,
      V0_option}) ->
    D_a_t_a = <<(protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_ask_id:32/little,
                V0_fun_type:8/little, V0_sid:8/little, V0_qid:32/little,
                V0_start_time:32/little, V0_status:8/little,
                V0_option:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16100:16/little,
       D_a_t_a/binary>>};
pack(cli, 16101,
     {V0_platform,
      V0_zone_id,
      V0_ask_id,
      V0_sid,
      V0_option}) ->
    D_a_t_a = <<(protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_ask_id:32/little,
                V0_sid:8/little, V0_option:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16101:16/little,
       D_a_t_a/binary>>};
pack(srv, 16101,
     {{V0_platform, V0_zone_id, V0_ask_id},
      V0_fun_type,
      V0_sid,
      V0_qid,
      V0_status,
      V0_msg}) ->
    D_a_t_a = <<(protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_ask_id:32/little,
                V0_fun_type:8/little, V0_sid:8/little, V0_qid:32/little,
                V0_status:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16101:16/little,
       D_a_t_a/binary>>};
pack(cli, 16102, {}) ->
    {ok, <<2:32/little, 16102:16/little>>};
pack(srv, 16102,
     {{V0_platform, V0_zone_id, V0_ask_id},
      V0_fun_type,
      V0_sid,
      V0_qid,
      V0_result,
      V0_opts}) ->
    D_a_t_a = <<(protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_ask_id:32/little,
                V0_fun_type:8/little, V0_sid:8/little, V0_qid:32/little,
                V0_result:8/little, (length(V0_opts)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little, V1_option:8/little>>
                                 || {{V1_rid, V1_platform, V1_zone_id},
                                     V1_option}
                                        <- V0_opts]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16102:16/little,
       D_a_t_a/binary>>};
pack(cli, 16103,
     {V0_platform, V0_zone_id, V0_ask_id}) ->
    D_a_t_a = <<(protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_ask_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16103:16/little,
       D_a_t_a/binary>>};
pack(srv, 16103,
     {{V0_platform, V0_zone_id, V0_ask_id},
      V0_fun_type,
      V0_stats,
      V0_gains}) ->
    D_a_t_a = <<(protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_ask_id:32/little,
                V0_fun_type:8/little, (length(V0_stats)):16/little,
                (list_to_binary([<<V1_result:8/little>>
                                 || #ask_answer{result = V1_result}
                                        <- V0_stats]))/binary,
                (length(V0_gains)):16/little,
                (list_to_binary([<<V1_assets:32/little,
                                   V1_value:32/little>>
                                 || {V1_assets, V1_value}
                                        <- V0_gains]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16103:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 16100, _B0) ->
    {V1_platform, _B1} = protocol:string(_B0),
    {V1_zone_id, _B2} = protocol:uint16(_B1),
    {V1_ask_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_platform, V1_zone_id, V1_ask_id}};
unpack(cli, 16100, _B0) ->
    {V1_platform, _B1} = protocol:string(_B0),
    {V1_zone_id, _B2} = protocol:uint16(_B1),
    {V1_ask_id, _B3} = protocol:uint32(_B2),
    {V1_fun_type, _B4} = protocol:uint8(_B3),
    {V1_sid, _B5} = protocol:uint8(_B4),
    {V1_qid, _B6} = protocol:uint32(_B5),
    {V1_start_time, _B7} = protocol:uint32(_B6),
    {V1_status, _B8} = protocol:uint8(_B7),
    {V1_option, _B9} = protocol:uint8(_B8),
    {ok,
     {V1_platform,
      V1_zone_id,
      V1_ask_id,
      V1_fun_type,
      V1_sid,
      V1_qid,
      V1_start_time,
      V1_status,
      V1_option}};
unpack(srv, 16101, _B0) ->
    {V1_platform, _B1} = protocol:string(_B0),
    {V1_zone_id, _B2} = protocol:uint16(_B1),
    {V1_ask_id, _B3} = protocol:uint32(_B2),
    {V1_sid, _B4} = protocol:uint8(_B3),
    {V1_option, _B5} = protocol:uint8(_B4),
    {ok,
     {V1_platform,
      V1_zone_id,
      V1_ask_id,
      V1_sid,
      V1_option}};
unpack(cli, 16101, _B0) ->
    {V1_platform, _B1} = protocol:string(_B0),
    {V1_zone_id, _B2} = protocol:uint16(_B1),
    {V1_ask_id, _B3} = protocol:uint32(_B2),
    {V1_fun_type, _B4} = protocol:uint8(_B3),
    {V1_sid, _B5} = protocol:uint8(_B4),
    {V1_qid, _B6} = protocol:uint32(_B5),
    {V1_status, _B7} = protocol:uint8(_B6),
    {V1_msg, _B8} = protocol:string(_B7),
    {ok,
     {V1_platform,
      V1_zone_id,
      V1_ask_id,
      V1_fun_type,
      V1_sid,
      V1_qid,
      V1_status,
      V1_msg}};
unpack(srv, 16102, _B0) -> {ok, {}};
unpack(cli, 16102, _B0) ->
    {V1_platform, _B1} = protocol:string(_B0),
    {V1_zone_id, _B2} = protocol:uint16(_B1),
    {V1_ask_id, _B3} = protocol:uint32(_B2),
    {V1_fun_type, _B4} = protocol:uint8(_B3),
    {V1_sid, _B5} = protocol:uint8(_B4),
    {V1_qid, _B6} = protocol:uint32(_B5),
    {V1_result, _B7} = protocol:uint8(_B6),
    {V1_opts, _B14} = protocol:array(_B7,
                                     fun (_B8) ->
                                             {V2_rid, _B9} =
                                                 protocol:uint32(_B8),
                                             {V2_platform, _B10} =
                                                 protocol:string(_B9),
                                             {V2_zone_id, _B11} =
                                                 protocol:uint32(_B10),
                                             {V2_option, _B12} =
                                                 protocol:uint8(_B11),
                                             {{V2_rid,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_option},
                                              _B12}
                                     end),
    {ok,
     {V1_platform,
      V1_zone_id,
      V1_ask_id,
      V1_fun_type,
      V1_sid,
      V1_qid,
      V1_result,
      V1_opts}};
unpack(srv, 16103, _B0) ->
    {V1_platform, _B1} = protocol:string(_B0),
    {V1_zone_id, _B2} = protocol:uint16(_B1),
    {V1_ask_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_platform, V1_zone_id, V1_ask_id}};
unpack(cli, 16103, _B0) ->
    {V1_platform, _B1} = protocol:string(_B0),
    {V1_zone_id, _B2} = protocol:uint16(_B1),
    {V1_ask_id, _B3} = protocol:uint32(_B2),
    {V1_fun_type, _B4} = protocol:uint8(_B3),
    {V1_stats, _B8} = protocol:array(_B4,
                                     fun (_B5) ->
                                             {V2_result, _B6} =
                                                 protocol:uint8(_B5),
                                             {{V2_result}, _B6}
                                     end),
    {V1_gains, _B13} = protocol:array(_B8,
                                      fun (_B9) ->
                                              {V2_assets, _B10} =
                                                  protocol:uint32(_B9),
                                              {V2_value, _B11} =
                                                  protocol:uint32(_B10),
                                              {{V2_assets, V2_value}, _B11}
                                      end),
    {ok,
     {V1_platform,
      V1_zone_id,
      V1_ask_id,
      V1_fun_type,
      V1_stats,
      V1_gains}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

