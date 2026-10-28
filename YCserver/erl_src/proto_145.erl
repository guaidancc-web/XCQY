-file("src/proto/proto_145.erl", 1).

-module(proto_145).

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

-file("src/proto/proto_145.erl", 14).

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

-file("src/proto/proto_145.erl", 15).

-file("inc/examination.hrl", 1).

-record(m_examination,
        {ver = 1,
         question = 0 :: non_neg_integer(),
         started = 0 :: non_neg_integer(),
         expire = 0 :: non_neg_integer(),
         subject = 0 :: non_neg_integer(),
         next_subject = 0 :: non_neg_integer(),
         next_subjects = [],
         finish_ids = [],
         right_num = 0 :: non_neg_integer(),
         answered = 0 :: non_neg_integer(),
         successive_right = 0 :: non_neg_integer(),
         questions = [] :: list(),
         dynamics = [] :: list()}).

-record(examination_testee,
        {id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         elapsed = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         coin = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         pet_exp = 0 :: non_neg_integer()}).

-record(examination_role,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         elapsed = 0 :: non_neg_integer(),
         rank = 0 :: non_neg_integer(),
         certified = 0 :: 0 | 1,
         results = []}).

-record(examination_question,
        {id = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         desc = "" :: string(),
         answer = 0 :: non_neg_integer(),
         options = [] :: list()}).

-record(examination_taker,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         last_answered = 0 :: non_neg_integer(),
         double_used = 0 :: non_neg_integer(),
         eased = 0 :: non_neg_integer(),
         peeked = 0 :: non_neg_integer(),
         coin = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         pet_exp = 0 :: non_neg_integer(),
         right_num = 0 :: non_neg_integer(),
         answered = 0 :: non_neg_integer()}).

-record(examination_answer,
        {id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         choice = 0 :: 0..4,
         result = 0 :: 0 | 1,
         time = 0 :: non_neg_integer()}).

-file("src/proto/proto_145.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 14500, {}) ->
    {ok, <<2:32/little, 14500:16/little>>};
pack(srv, 14500, {V0_status, V0_type, V0_timeout}) ->
    D_a_t_a = <<V0_status:8/little, V0_type:8/little,
                V0_timeout:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14500:16/little,
       D_a_t_a/binary>>};
pack(cli, 14501, {V0_unit_base}) ->
    D_a_t_a = <<V0_unit_base:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14501:16/little,
       D_a_t_a/binary>>};
pack(srv, 14501, {V0_flag, V0_msg, V0_unit_base}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_unit_base:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14501:16/little,
       D_a_t_a/binary>>};
pack(cli, 14502, {}) ->
    {ok, <<2:32/little, 14502:16/little>>};
pack(srv, 14502, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14502:16/little,
       D_a_t_a/binary>>};
pack(cli, 14503, {}) ->
    {ok, <<2:32/little, 14503:16/little>>};
pack(srv, 14503,
     {#m_examination{question = V0_question,
                     started = V0_started, expire = V0_expire,
                     subject = V0_subject, next_subject = V0_next_subject,
                     answered = V0_answered, right_num = V0_right_num,
                     successive_right = V0_successive_right,
                     dynamics = V0_dynamics},
      V0_total,
      V0_elapsed,
      V0_score,
      V0_exp,
      V0_pet_ext,
      V0_coin,
      V0_score_all,
      V0_elapsed_all,
      V0_can_ask}) ->
    D_a_t_a = <<V0_question:32/little, V0_started:32/little,
                V0_expire:32/little, V0_subject:8/little,
                V0_next_subject:8/little, V0_answered:8/little,
                V0_right_num:8/little, V0_successive_right:8/little,
                (length(V0_dynamics)):16/little,
                (list_to_binary([<<V1_id:8/little,
                                   (protocol:pack(string, V1_desc))/binary,
                                   (length(V1_options)):16/little,
                                   (list_to_binary([<<V2_opt_id:8/little,
                                                      (protocol:pack(string,
                                                                     V2_opt_desc))/binary>>
                                                    || {V2_opt_id, V2_opt_desc}
                                                           <- V1_options]))/binary>>
                                 || #examination_question{id = V1_id,
                                                          desc = V1_desc,
                                                          options = V1_options}
                                        <- V0_dynamics]))/binary,
                V0_total:8/little, V0_elapsed:32/little,
                V0_score:32/little, V0_exp:32/little,
                V0_pet_ext:32/little, V0_coin:32/little,
                V0_score_all:32/little, V0_elapsed_all:32/little,
                V0_can_ask:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14503:16/little,
       D_a_t_a/binary>>};
pack(cli, 14504, {V0_option}) ->
    D_a_t_a = <<V0_option:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14504:16/little,
       D_a_t_a/binary>>};
pack(srv, 14504,
     {V0_flag,
      V0_option,
      V0_answer,
      V0_msg,
      V0_successive_right}) ->
    D_a_t_a = <<V0_flag:8/little, V0_option:8/little,
                V0_answer:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_successive_right:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14504:16/little,
       D_a_t_a/binary>>};
pack(cli, 14505, {}) ->
    {ok, <<2:32/little, 14505:16/little>>};
pack(srv, 14505,
     {#examination_testee{score = V0_score,
                          elapsed = V0_elapsed, coin = V0_coin, exp = V0_exp,
                          pet_exp = V0_pet_exp},
      V0_right_num,
      V0_answered,
      V0_total}) ->
    D_a_t_a = <<V0_score:32/little, V0_elapsed:32/little,
                V0_coin:32/little, V0_exp:32/little,
                V0_pet_exp:32/little, V0_right_num:8/little,
                V0_answered:8/little, V0_total:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14505:16/little,
       D_a_t_a/binary>>};
pack(cli, 14506, {}) ->
    {ok, <<2:32/little, 14506:16/little>>};
pack(srv, 14506, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14506:16/little,
       D_a_t_a/binary>>};
pack(cli, 14507, {}) ->
    {ok, <<2:32/little, 14507:16/little>>};
pack(srv, 14507,
     {V0_bottom_rank_score,
      #examination_testee{elapsed = V0_elapsed},
      #examination_role{score = V0_score, rank = V0_rank,
                        results = V0_results}}) ->
    D_a_t_a = <<V0_bottom_rank_score:32/little,
                V0_elapsed:32/little, V0_score:32/little,
                V0_rank:32/little, (length(V0_results)):16/little,
                (list_to_binary([<<V1_day:8/little,
                                   V1_day_score:32/little,
                                   V1_day_elapsed:32/little>>
                                 || {V1_day, V1_day_score, V1_day_elapsed}
                                        <- V0_results]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14507:16/little,
       D_a_t_a/binary>>};
pack(cli, 14508, {}) ->
    {ok, <<2:32/little, 14508:16/little>>};
pack(srv, 14508, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14508:16/little,
       D_a_t_a/binary>>};
pack(cli, 14509, {}) ->
    {ok, <<2:32/little, 14509:16/little>>};
pack(srv, 14509, {V0_status, V0_timeout}) ->
    D_a_t_a = <<V0_status:8/little, V0_timeout:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14509:16/little,
       D_a_t_a/binary>>};
pack(cli, 14510, {}) ->
    {ok, <<2:32/little, 14510:16/little>>};
pack(srv, 14510,
     {V0_qid,
      V0_asked,
      V0_expire,
      V0_asked_num,
      V0_total_question,
      V0_answers}) ->
    D_a_t_a = <<V0_qid:32/little, V0_asked:32/little,
                V0_expire:32/little, V0_asked_num:8/little,
                V0_total_question:8/little,
                (length(V0_answers)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_choice:8/little, V1_result:8/little,
                                   V1_time:32/little>>
                                 || #examination_answer{id =
                                                            {V1_rid,
                                                             V1_platform,
                                                             V1_zone_id},
                                                        name = V1_name,
                                                        choice = V1_choice,
                                                        result = V1_result,
                                                        time = V1_time}
                                        <- V0_answers]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14510:16/little,
       D_a_t_a/binary>>};
pack(cli, 14511, {V0_id, V0_choice}) ->
    D_a_t_a = <<V0_id:32/little, V0_choice:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14511:16/little,
       D_a_t_a/binary>>};
pack(srv, 14511,
     {V0_flag, V0_msg, V0_choice, V0_right_answer}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_choice:8/little, V0_right_answer:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14511:16/little,
       D_a_t_a/binary>>};
pack(cli, 14512, {}) ->
    {ok, <<2:32/little, 14512:16/little>>};
pack(srv, 14512, {V0_examination_taker}) ->
    D_a_t_a = <<(length(V0_examination_taker)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little, V1_sex:8/little,
                                   V1_classes:8/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_score:32/little>>
                                 || #examination_taker{id =
                                                           {V1_rid,
                                                            V1_platform,
                                                            V1_zone_id},
                                                       sex = V1_sex,
                                                       classes = V1_classes,
                                                       name = V1_name,
                                                       score = V1_score}
                                        <- V0_examination_taker]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14512:16/little,
       D_a_t_a/binary>>};
pack(cli, 14513, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14513:16/little,
       D_a_t_a/binary>>};
pack(srv, 14513,
     {V0_flag,
      V0_msg,
      #examination_answer{id =
                              {V0_rid, V0_platform, V0_zone_id},
                          name = V0_name, choice = V0_choice,
                          result = V0_result, time = V0_time}}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_choice:8/little, V0_result:8/little,
                V0_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14513:16/little,
       D_a_t_a/binary>>};
pack(cli, 14514, {}) ->
    {ok, <<2:32/little, 14514:16/little>>};
pack(srv, 14514,
     {#examination_answer{id =
                              {V0_rid, V0_platform, V0_zone_id},
                          name = V0_name, choice = V0_choice,
                          result = V0_result, time = V0_time}}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_choice:8/little, V0_result:8/little,
                V0_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14514:16/little,
       D_a_t_a/binary>>};
pack(cli, 14515, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14515:16/little,
       D_a_t_a/binary>>};
pack(srv, 14515, {V0_flag, V0_msg, V0_right_answer}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_right_answer:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14515:16/little,
       D_a_t_a/binary>>};
pack(cli, 14516, {}) ->
    {ok, <<2:32/little, 14516:16/little>>};
pack(srv, 14516,
     {#examination_taker{score = V0_score,
                         peeked = V0_peeked, eased = V0_eased,
                         double_used = V0_double_used},
      V0_max_peeking,
      V0_max_easing,
      V0_max_doubling}) ->
    D_a_t_a = <<V0_score:32/little, V0_peeked:8/little,
                V0_eased:8/little, V0_double_used:8/little,
                V0_max_peeking:8/little, V0_max_easing:8/little,
                V0_max_doubling:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14516:16/little,
       D_a_t_a/binary>>};
pack(cli, 14517, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14517:16/little,
       D_a_t_a/binary>>};
pack(srv, 14517, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14517:16/little,
       D_a_t_a/binary>>};
pack(cli, 14518, {}) ->
    {ok, <<2:32/little, 14518:16/little>>};
pack(srv, 14518,
     {V0_rid,
      V0_platform,
      V0_zone_id,
      V0_name,
      V0_id,
      V0_question,
      V0_str_array}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_id:32/little, V0_question:32/little,
                (length(V0_str_array)):16/little,
                (list_to_binary([<<V1_key:32/little,
                                   (protocol:pack(string, V1_value))/binary>>
                                 || {V1_key, V1_value}
                                        <- V0_str_array]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14518:16/little,
       D_a_t_a/binary>>};
pack(cli, 14519, {V0_id, V0_option}) ->
    D_a_t_a = <<V0_id:32/little, V0_option:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14519:16/little,
       D_a_t_a/binary>>};
pack(srv, 14519, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14519:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 14500, _B0) -> {ok, {}};
unpack(cli, 14500, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {V1_timeout, _B3} = protocol:uint32(_B2),
    {ok, {V1_status, V1_type, V1_timeout}};
unpack(srv, 14501, _B0) ->
    {V1_unit_base, _B1} = protocol:uint32(_B0),
    {ok, {V1_unit_base}};
unpack(cli, 14501, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_unit_base, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_unit_base}};
unpack(srv, 14502, _B0) -> {ok, {}};
unpack(cli, 14502, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14503, _B0) -> {ok, {}};
unpack(cli, 14503, _B0) ->
    {V1_question, _B1} = protocol:uint32(_B0),
    {V1_started, _B2} = protocol:uint32(_B1),
    {V1_expire, _B3} = protocol:uint32(_B2),
    {V1_subject, _B4} = protocol:uint8(_B3),
    {V1_next_subject, _B5} = protocol:uint8(_B4),
    {V1_answered, _B6} = protocol:uint8(_B5),
    {V1_right_num, _B7} = protocol:uint8(_B6),
    {V1_successive_right, _B8} = protocol:uint8(_B7),
    {V1_dynamics, _B18} = protocol:array(_B8,
                                         fun (_B9) ->
                                                 {V2_id, _B10} =
                                                     protocol:uint8(_B9),
                                                 {V2_desc, _B11} =
                                                     protocol:string(_B10),
                                                 {V2_options, _B16} =
                                                     protocol:array(_B11,
                                                                    fun
                                                                        (_B12) ->
                                                                            {V3_opt_id,
                                                                             _B13} =
                                                                                protocol:uint8(_B12),
                                                                            {V3_opt_desc,
                                                                             _B14} =
                                                                                protocol:string(_B13),
                                                                            {{V3_opt_id,
                                                                              V3_opt_desc},
                                                                             _B14}
                                                                    end),
                                                 {{V2_id, V2_desc, V2_options},
                                                  _B16}
                                         end),
    {V1_total, _B19} = protocol:uint8(_B18),
    {V1_elapsed, _B20} = protocol:uint32(_B19),
    {V1_score, _B21} = protocol:uint32(_B20),
    {V1_exp, _B22} = protocol:uint32(_B21),
    {V1_pet_ext, _B23} = protocol:uint32(_B22),
    {V1_coin, _B24} = protocol:uint32(_B23),
    {V1_score_all, _B25} = protocol:uint32(_B24),
    {V1_elapsed_all, _B26} = protocol:uint32(_B25),
    {V1_can_ask, _B27} = protocol:uint8(_B26),
    {ok,
     {V1_question,
      V1_started,
      V1_expire,
      V1_subject,
      V1_next_subject,
      V1_answered,
      V1_right_num,
      V1_successive_right,
      V1_dynamics,
      V1_total,
      V1_elapsed,
      V1_score,
      V1_exp,
      V1_pet_ext,
      V1_coin,
      V1_score_all,
      V1_elapsed_all,
      V1_can_ask}};
unpack(srv, 14504, _B0) ->
    {V1_option, _B1} = protocol:uint8(_B0),
    {ok, {V1_option}};
unpack(cli, 14504, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_option, _B2} = protocol:uint8(_B1),
    {V1_answer, _B3} = protocol:uint8(_B2),
    {V1_msg, _B4} = protocol:string(_B3),
    {V1_successive_right, _B5} = protocol:uint8(_B4),
    {ok,
     {V1_flag,
      V1_option,
      V1_answer,
      V1_msg,
      V1_successive_right}};
unpack(srv, 14505, _B0) -> {ok, {}};
unpack(cli, 14505, _B0) ->
    {V1_score, _B1} = protocol:uint32(_B0),
    {V1_elapsed, _B2} = protocol:uint32(_B1),
    {V1_coin, _B3} = protocol:uint32(_B2),
    {V1_exp, _B4} = protocol:uint32(_B3),
    {V1_pet_exp, _B5} = protocol:uint32(_B4),
    {V1_right_num, _B6} = protocol:uint8(_B5),
    {V1_answered, _B7} = protocol:uint8(_B6),
    {V1_total, _B8} = protocol:uint8(_B7),
    {ok,
     {V1_score,
      V1_elapsed,
      V1_coin,
      V1_exp,
      V1_pet_exp,
      V1_right_num,
      V1_answered,
      V1_total}};
unpack(srv, 14506, _B0) -> {ok, {}};
unpack(cli, 14506, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14507, _B0) -> {ok, {}};
unpack(cli, 14507, _B0) ->
    {V1_bottom_rank_score, _B1} = protocol:uint32(_B0),
    {V1_elapsed, _B2} = protocol:uint32(_B1),
    {V1_score, _B3} = protocol:uint32(_B2),
    {V1_rank, _B4} = protocol:uint32(_B3),
    {V1_results, _B10} = protocol:array(_B4,
                                        fun (_B5) ->
                                                {V2_day, _B6} =
                                                    protocol:uint8(_B5),
                                                {V2_day_score, _B7} =
                                                    protocol:uint32(_B6),
                                                {V2_day_elapsed, _B8} =
                                                    protocol:uint32(_B7),
                                                {{V2_day,
                                                  V2_day_score,
                                                  V2_day_elapsed},
                                                 _B8}
                                        end),
    {ok,
     {V1_bottom_rank_score,
      V1_elapsed,
      V1_score,
      V1_rank,
      V1_results}};
unpack(srv, 14508, _B0) -> {ok, {}};
unpack(cli, 14508, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(srv, 14509, _B0) -> {ok, {}};
unpack(cli, 14509, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_timeout, _B2} = protocol:uint32(_B1),
    {ok, {V1_status, V1_timeout}};
unpack(srv, 14510, _B0) -> {ok, {}};
unpack(cli, 14510, _B0) ->
    {V1_qid, _B1} = protocol:uint32(_B0),
    {V1_asked, _B2} = protocol:uint32(_B1),
    {V1_expire, _B3} = protocol:uint32(_B2),
    {V1_asked_num, _B4} = protocol:uint8(_B3),
    {V1_total_question, _B5} = protocol:uint8(_B4),
    {V1_answers, _B15} = protocol:array(_B5,
                                        fun (_B6) ->
                                                {V2_rid, _B7} =
                                                    protocol:uint32(_B6),
                                                {V2_platform, _B8} =
                                                    protocol:string(_B7),
                                                {V2_zone_id, _B9} =
                                                    protocol:uint16(_B8),
                                                {V2_name, _B10} =
                                                    protocol:string(_B9),
                                                {V2_choice, _B11} =
                                                    protocol:uint8(_B10),
                                                {V2_result, _B12} =
                                                    protocol:uint8(_B11),
                                                {V2_time, _B13} =
                                                    protocol:uint32(_B12),
                                                {{V2_rid,
                                                  V2_platform,
                                                  V2_zone_id,
                                                  V2_name,
                                                  V2_choice,
                                                  V2_result,
                                                  V2_time},
                                                 _B13}
                                        end),
    {ok,
     {V1_qid,
      V1_asked,
      V1_expire,
      V1_asked_num,
      V1_total_question,
      V1_answers}};
unpack(srv, 14511, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_choice, _B2} = protocol:uint8(_B1),
    {ok, {V1_id, V1_choice}};
unpack(cli, 14511, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_choice, _B3} = protocol:uint8(_B2),
    {V1_right_answer, _B4} = protocol:uint8(_B3),
    {ok, {V1_flag, V1_msg, V1_choice, V1_right_answer}};
unpack(srv, 14512, _B0) -> {ok, {}};
unpack(cli, 14512, _B0) ->
    {V1_examination_taker, _B10} = protocol:array(_B0,
                                                  fun (_B1) ->
                                                          {V2_rid, _B2} =
                                                              protocol:uint32(_B1),
                                                          {V2_platform, _B3} =
                                                              protocol:string(_B2),
                                                          {V2_zone_id, _B4} =
                                                              protocol:uint16(_B3),
                                                          {V2_sex, _B5} =
                                                              protocol:uint8(_B4),
                                                          {V2_classes, _B6} =
                                                              protocol:uint8(_B5),
                                                          {V2_name, _B7} =
                                                              protocol:string(_B6),
                                                          {V2_score, _B8} =
                                                              protocol:uint32(_B7),
                                                          {{V2_rid,
                                                            V2_platform,
                                                            V2_zone_id,
                                                            V2_sex,
                                                            V2_classes,
                                                            V2_name,
                                                            V2_score},
                                                           _B8}
                                                  end),
    {ok, {V1_examination_taker}};
unpack(srv, 14513, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 14513, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_rid, _B3} = protocol:uint32(_B2),
    {V1_platform, _B4} = protocol:string(_B3),
    {V1_zone_id, _B5} = protocol:uint16(_B4),
    {V1_name, _B6} = protocol:string(_B5),
    {V1_choice, _B7} = protocol:uint8(_B6),
    {V1_result, _B8} = protocol:uint8(_B7),
    {V1_time, _B9} = protocol:uint32(_B8),
    {ok,
     {V1_flag,
      V1_msg,
      V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_choice,
      V1_result,
      V1_time}};
unpack(srv, 14514, _B0) -> {ok, {}};
unpack(cli, 14514, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_choice, _B5} = protocol:uint8(_B4),
    {V1_result, _B6} = protocol:uint8(_B5),
    {V1_time, _B7} = protocol:uint32(_B6),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_choice,
      V1_result,
      V1_time}};
unpack(srv, 14515, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 14515, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_right_answer, _B3} = protocol:uint8(_B2),
    {ok, {V1_flag, V1_msg, V1_right_answer}};
unpack(srv, 14516, _B0) -> {ok, {}};
unpack(cli, 14516, _B0) ->
    {V1_score, _B1} = protocol:uint32(_B0),
    {V1_peeked, _B2} = protocol:uint8(_B1),
    {V1_eased, _B3} = protocol:uint8(_B2),
    {V1_double_used, _B4} = protocol:uint8(_B3),
    {V1_max_peeking, _B5} = protocol:uint8(_B4),
    {V1_max_easing, _B6} = protocol:uint8(_B5),
    {V1_max_doubling, _B7} = protocol:uint8(_B6),
    {ok,
     {V1_score,
      V1_peeked,
      V1_eased,
      V1_double_used,
      V1_max_peeking,
      V1_max_easing,
      V1_max_doubling}};
unpack(srv, 14517, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 14517, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14518, _B0) -> {ok, {}};
unpack(cli, 14518, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_id, _B5} = protocol:uint32(_B4),
    {V1_question, _B6} = protocol:uint32(_B5),
    {V1_str_array, _B11} = protocol:array(_B6,
                                          fun (_B7) ->
                                                  {V2_key, _B8} =
                                                      protocol:uint32(_B7),
                                                  {V2_value, _B9} =
                                                      protocol:string(_B8),
                                                  {{V2_key, V2_value}, _B9}
                                          end),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_id,
      V1_question,
      V1_str_array}};
unpack(srv, 14519, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_option, _B2} = protocol:uint8(_B1),
    {ok, {V1_id, V1_option}};
unpack(cli, 14519, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

