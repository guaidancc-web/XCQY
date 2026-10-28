-file("src/proto/proto_126.erl", 1).

-module(proto_126).

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

-file("src/proto/proto_126.erl", 14).

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

-file("src/proto/proto_126.erl", 15).

-file("inc/escort.hrl", 1).

-record(m_escort,
        {ver = 0,
         quest_id = 32000 :: non_neg_integer(),
         image_id = 0 :: non_neg_integer(),
         start_time = 0 :: non_neg_integer(),
         robed_by_npc = 0 :: non_neg_integer(),
         robed_num = 0 :: non_neg_integer(),
         rob_by_roles = [] :: [tuple()],
         last_robed = 0 :: non_neg_integer(),
         gain_type = 0 :: non_neg_integer(),
         total_num = 0 :: non_neg_integer(),
         question = 0 :: non_neg_integer(),
         question_time = 0 :: non_neg_integer(),
         answered = 0 :: non_neg_integer(),
         corrected = 0 :: non_neg_integer(),
         done_lottery = 0 :: non_neg_integer(),
         mid_unit_id = {0, 0} ::
             {non_neg_integer(), non_neg_integer()},
         box_unit_id = 0 :: non_neg_integer(),
         box_hp = 0 :: non_neg_integer(),
         box_max_hp = 0 :: non_neg_integer(),
         pass_question = [] :: [non_neg_integer()]}).

-file("src/proto/proto_126.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 12600, {}) ->
    {ok, <<2:32/little, 12600:16/little>>};
pack(srv, 12600,
     {#m_escort{quest_id = V0_quest_id,
                image_id = V0_image_id, start_time = V0_start_time,
                box_unit_id = V0_box_unit_id, box_hp = V0_box_hp,
                box_max_hp = V0_box_max_hp, answered = V0_answered,
                corrected = V0_corrected,
                done_lottery = V0_done_lottery,
                mid_unit_id = {V0_battle_id, V0_uid}},
      V0_free_refresh,
      V0_acceptable}) ->
    D_a_t_a = <<V0_quest_id:32/little,
                V0_image_id:32/little, V0_start_time:32/little,
                V0_box_unit_id:32/little, V0_box_hp:32/little,
                V0_box_max_hp:32/little, V0_answered:8/little,
                V0_corrected:8/little, V0_done_lottery:8/little,
                V0_battle_id:32/little, V0_uid:32/little,
                V0_free_refresh:8/little, V0_acceptable:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12600:16/little,
       D_a_t_a/binary>>};
pack(cli, 12601, {}) ->
    {ok, <<2:32/little, 12601:16/little>>};
pack(srv, 12601, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12601:16/little,
       D_a_t_a/binary>>};
pack(cli, 12602, {}) ->
    {ok, <<2:32/little, 12602:16/little>>};
pack(srv, 12602, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12602:16/little,
       D_a_t_a/binary>>};
pack(cli, 12603, {}) ->
    {ok, <<2:32/little, 12603:16/little>>};
pack(srv, 12603, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12603:16/little,
       D_a_t_a/binary>>};
pack(cli, 12604, {}) ->
    {ok, <<2:32/little, 12604:16/little>>};
pack(srv, 12604, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12604:16/little,
       D_a_t_a/binary>>};
pack(cli, 12605, {}) ->
    {ok, <<2:32/little, 12605:16/little>>};
pack(srv, 12605,
     {#m_escort{quest_id = V0_quest_id,
                image_id = V0_image_id, start_time = V0_start_time,
                box_unit_id = V0_box_unit_id, box_hp = V0_box_hp,
                box_max_hp = V0_box_max_hp, answered = V0_answered,
                mid_unit_id = {V0_battle_id, V0_uid}}}) ->
    D_a_t_a = <<V0_quest_id:32/little,
                V0_image_id:32/little, V0_start_time:32/little,
                V0_box_unit_id:32/little, V0_box_hp:32/little,
                V0_box_max_hp:32/little, V0_answered:8/little,
                V0_battle_id:32/little, V0_uid:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12605:16/little,
       D_a_t_a/binary>>};
pack(cli, 12606, {}) ->
    {ok, <<2:32/little, 12606:16/little>>};
pack(srv, 12606,
     {V0_result, V0_msg, V0_question, V0_question_time}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_question:8/little, V0_question_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12606:16/little,
       D_a_t_a/binary>>};
pack(cli, 12607, {V0_option}) ->
    D_a_t_a = <<V0_option:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12607:16/little,
       D_a_t_a/binary>>};
pack(srv, 12607, {V0_result, V0_msg, V0_option}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_option:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12607:16/little,
       D_a_t_a/binary>>};
pack(cli, 12608, {}) ->
    {ok, <<2:32/little, 12608:16/little>>};
pack(srv, 12608,
     {V0_result, V0_msg, V0_reward_type, V0_reward_val}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_reward_type:8/little, V0_reward_val:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12608:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 12600, _B0) -> {ok, {}};
unpack(cli, 12600, _B0) ->
    {V1_quest_id, _B1} = protocol:uint32(_B0),
    {V1_image_id, _B2} = protocol:uint32(_B1),
    {V1_start_time, _B3} = protocol:uint32(_B2),
    {V1_box_unit_id, _B4} = protocol:uint32(_B3),
    {V1_box_hp, _B5} = protocol:uint32(_B4),
    {V1_box_max_hp, _B6} = protocol:uint32(_B5),
    {V1_answered, _B7} = protocol:uint8(_B6),
    {V1_corrected, _B8} = protocol:uint8(_B7),
    {V1_done_lottery, _B9} = protocol:uint8(_B8),
    {V1_battle_id, _B10} = protocol:uint32(_B9),
    {V1_uid, _B11} = protocol:uint32(_B10),
    {V1_free_refresh, _B12} = protocol:uint8(_B11),
    {V1_acceptable, _B13} = protocol:uint8(_B12),
    {ok,
     {V1_quest_id,
      V1_image_id,
      V1_start_time,
      V1_box_unit_id,
      V1_box_hp,
      V1_box_max_hp,
      V1_answered,
      V1_corrected,
      V1_done_lottery,
      V1_battle_id,
      V1_uid,
      V1_free_refresh,
      V1_acceptable}};
unpack(srv, 12601, _B0) -> {ok, {}};
unpack(cli, 12601, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 12602, _B0) -> {ok, {}};
unpack(cli, 12602, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 12603, _B0) -> {ok, {}};
unpack(cli, 12603, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 12604, _B0) -> {ok, {}};
unpack(cli, 12604, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 12605, _B0) -> {ok, {}};
unpack(cli, 12605, _B0) ->
    {V1_quest_id, _B1} = protocol:uint32(_B0),
    {V1_image_id, _B2} = protocol:uint32(_B1),
    {V1_start_time, _B3} = protocol:uint32(_B2),
    {V1_box_unit_id, _B4} = protocol:uint32(_B3),
    {V1_box_hp, _B5} = protocol:uint32(_B4),
    {V1_box_max_hp, _B6} = protocol:uint32(_B5),
    {V1_answered, _B7} = protocol:uint8(_B6),
    {V1_battle_id, _B8} = protocol:uint32(_B7),
    {V1_uid, _B9} = protocol:uint32(_B8),
    {ok,
     {V1_quest_id,
      V1_image_id,
      V1_start_time,
      V1_box_unit_id,
      V1_box_hp,
      V1_box_max_hp,
      V1_answered,
      V1_battle_id,
      V1_uid}};
unpack(srv, 12606, _B0) -> {ok, {}};
unpack(cli, 12606, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_question, _B3} = protocol:uint8(_B2),
    {V1_question_time, _B4} = protocol:uint32(_B3),
    {ok,
     {V1_result, V1_msg, V1_question, V1_question_time}};
unpack(srv, 12607, _B0) ->
    {V1_option, _B1} = protocol:uint8(_B0),
    {ok, {V1_option}};
unpack(cli, 12607, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_option, _B3} = protocol:uint8(_B2),
    {ok, {V1_result, V1_msg, V1_option}};
unpack(srv, 12608, _B0) -> {ok, {}};
unpack(cli, 12608, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_reward_type, _B3} = protocol:uint8(_B2),
    {V1_reward_val, _B4} = protocol:uint32(_B3),
    {ok,
     {V1_result, V1_msg, V1_reward_type, V1_reward_val}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

