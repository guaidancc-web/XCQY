-file("src/proto/proto_154.erl", 1).

-module(proto_154).

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

-file("src/proto/proto_154.erl", 14).

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

-file("src/proto/proto_154.erl", 15).

-file("inc/quest_marriage.hrl", 1).

-record(quest_marriage_state,
        {question_next_mid = 1,
         reset_timer,
         platform = "",
         zone_id = 0}).

-record(quest_marriage_args,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         round = 0,
         lover_pid,
         robot_id,
         dyn_ext_data = [],
         rand_pos = []}).

-record(quest_marriage_rand_data,
        {round = 0,
         quest_id = 0 :: pos_integer(),
         type = 0,
         sec_type = 0,
         weight :: undefined | non_neg_integer()}).

-record(quest_marriage_question,
        {mid = 0,
         ver = 1,
         sid = 0,
         qid = 0,
         start_time = 0,
         male_id,
         male_pid,
         male_info = #{},
         female_id,
         female_pid,
         female_info = #{},
         opts = [],
         answer_list = [],
         agreed = [],
         questions = [],
         ext_data = #{}}).

-record(quest_marriage_answer,
        {sid = 0,
         qid = 0,
         opts = [],
         result = 0,
         draw_list = [],
         ext_data = []}).

-record(quest_marriage_reward_data,
        {round = 0,
         exp_ratio = 0,
         coin_ratio = 0,
         pet_exp_ratio = 0,
         intimacy = 0,
         love = 0,
         rand_items = []}).

-file("src/proto/proto_154.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 15400, {}) ->
    {ok, <<2:32/little, 15400:16/little>>};
pack(srv, 15400,
     {V0_sid,
      V0_qid,
      V0_start_time,
      V0_status,
      V0_option}) ->
    D_a_t_a = <<V0_sid:8/little, V0_qid:32/little,
                V0_start_time:32/little, V0_status:8/little,
                V0_option:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15400:16/little,
       D_a_t_a/binary>>};
pack(cli, 15401, {V0_sid, V0_option}) ->
    D_a_t_a = <<V0_sid:8/little, V0_option:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15401:16/little,
       D_a_t_a/binary>>};
pack(srv, 15401, {V0_sid, V0_qid, V0_status, V0_msg}) ->
    D_a_t_a = <<V0_sid:8/little, V0_qid:32/little,
                V0_status:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15401:16/little,
       D_a_t_a/binary>>};
pack(cli, 15402, {}) ->
    {ok, <<2:32/little, 15402:16/little>>};
pack(srv, 15402,
     {V0_sid, V0_qid, V0_result, V0_opts}) ->
    D_a_t_a = <<V0_sid:8/little, V0_qid:32/little,
                V0_result:8/little, (length(V0_opts)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little, V1_option:8/little>>
                                 || {{V1_rid, V1_platform, V1_zone_id},
                                     V1_option}
                                        <- V0_opts]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15402:16/little,
       D_a_t_a/binary>>};
pack(cli, 15403, {}) ->
    {ok, <<2:32/little, 15403:16/little>>};
pack(srv, 15403, {V0_stats, V0_gains}) ->
    D_a_t_a = <<(length(V0_stats)):16/little,
                (list_to_binary([<<V1_result:8/little>>
                                 || #quest_marriage_answer{result = V1_result}
                                        <- V0_stats]))/binary,
                (length(V0_gains)):16/little,
                (list_to_binary([<<V1_assets:32/little,
                                   V1_value:32/little>>
                                 || {V1_assets, V1_value}
                                        <- V0_gains]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15403:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 15400, _B0) -> {ok, {}};
unpack(cli, 15400, _B0) ->
    {V1_sid, _B1} = protocol:uint8(_B0),
    {V1_qid, _B2} = protocol:uint32(_B1),
    {V1_start_time, _B3} = protocol:uint32(_B2),
    {V1_status, _B4} = protocol:uint8(_B3),
    {V1_option, _B5} = protocol:uint8(_B4),
    {ok,
     {V1_sid, V1_qid, V1_start_time, V1_status, V1_option}};
unpack(srv, 15401, _B0) ->
    {V1_sid, _B1} = protocol:uint8(_B0),
    {V1_option, _B2} = protocol:uint8(_B1),
    {ok, {V1_sid, V1_option}};
unpack(cli, 15401, _B0) ->
    {V1_sid, _B1} = protocol:uint8(_B0),
    {V1_qid, _B2} = protocol:uint32(_B1),
    {V1_status, _B3} = protocol:uint8(_B2),
    {V1_msg, _B4} = protocol:string(_B3),
    {ok, {V1_sid, V1_qid, V1_status, V1_msg}};
unpack(srv, 15402, _B0) -> {ok, {}};
unpack(cli, 15402, _B0) ->
    {V1_sid, _B1} = protocol:uint8(_B0),
    {V1_qid, _B2} = protocol:uint32(_B1),
    {V1_result, _B3} = protocol:uint8(_B2),
    {V1_opts, _B10} = protocol:array(_B3,
                                     fun (_B4) ->
                                             {V2_rid, _B5} =
                                                 protocol:uint32(_B4),
                                             {V2_platform, _B6} =
                                                 protocol:string(_B5),
                                             {V2_zone_id, _B7} =
                                                 protocol:uint32(_B6),
                                             {V2_option, _B8} =
                                                 protocol:uint8(_B7),
                                             {{V2_rid,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_option},
                                              _B8}
                                     end),
    {ok, {V1_sid, V1_qid, V1_result, V1_opts}};
unpack(srv, 15403, _B0) -> {ok, {}};
unpack(cli, 15403, _B0) ->
    {V1_stats, _B4} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_result, _B2} =
                                                 protocol:uint8(_B1),
                                             {{V2_result}, _B2}
                                     end),
    {V1_gains, _B9} = protocol:array(_B4,
                                     fun (_B5) ->
                                             {V2_assets, _B6} =
                                                 protocol:uint32(_B5),
                                             {V2_value, _B7} =
                                                 protocol:uint32(_B6),
                                             {{V2_assets, V2_value}, _B7}
                                     end),
    {ok, {V1_stats, V1_gains}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

