-file("src/proto/proto_206.erl", 1).

-module(proto_206).

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

-file("src/proto/proto_206.erl", 14).

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

-file("src/proto/proto_206.erl", 15).

-file("inc/campaign_inquiry.hrl", 1).

-record(m_camp_inquiry, {ver = 1, inquiry_list = []}).

-record(camp_inquiry,
        {ver = 1,
         camp_id = 0,
         clue_list = [],
         inquiry_status = 1,
         start_time = 0,
         end_time = 0}).

-record(camp_clue,
        {ver = 1,
         id = 0,
         quest_id = 0,
         status = 0,
         answer = 1}).

-file("src/proto/proto_206.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 20600, {}) ->
    {ok, <<2:32/little, 20600:16/little>>};
pack(srv, 20600, {V0_camp_inquiry}) ->
    D_a_t_a = <<(length(V0_camp_inquiry)):16/little,
                (list_to_binary([<<V1_camp_id:32/little,
                                   (length(V1_clue_list)):16/little,
                                   (list_to_binary([<<V2_id:32/little,
                                                      V2_quest_id:32/little,
                                                      V2_status:8/little,
                                                      V2_answer:8/little>>
                                                    || #camp_clue{id = V2_id,
                                                                  quest_id =
                                                                      V2_quest_id,
                                                                  status =
                                                                      V2_status,
                                                                  answer =
                                                                      V2_answer}
                                                           <- V1_clue_list]))/binary,
                                   V1_inquiry_status:8/little>>
                                 || #camp_inquiry{camp_id = V1_camp_id,
                                                  clue_list = V1_clue_list,
                                                  inquiry_status =
                                                      V1_inquiry_status}
                                        <- V0_camp_inquiry]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20600:16/little,
       D_a_t_a/binary>>};
pack(cli, 20601, {V0_inquiry_id, V0_answer}) ->
    D_a_t_a = <<V0_inquiry_id:32/little,
                V0_answer:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20601:16/little,
       D_a_t_a/binary>>};
pack(srv, 20601, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20601:16/little,
       D_a_t_a/binary>>};
pack(cli, 20602, {V0_inquiry_id}) ->
    D_a_t_a = <<V0_inquiry_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20602:16/little,
       D_a_t_a/binary>>};
pack(srv, 20602, {V0_inquiry_id, V0_answer_info}) ->
    D_a_t_a = <<V0_inquiry_id:32/little,
                (length(V0_answer_info)):16/little,
                (list_to_binary([<<V1_answer:8/little,
                                   V1_count:32/little>>
                                 || {V1_answer, V1_count}
                                        <- V0_answer_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20602:16/little,
       D_a_t_a/binary>>};
pack(cli, 20603, {V0_inquiry_id}) ->
    D_a_t_a = <<V0_inquiry_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20603:16/little,
       D_a_t_a/binary>>};
pack(srv, 20603, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20603:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 20600, _B0) -> {ok, {}};
unpack(cli, 20600, _B0) ->
    {V1_camp_inquiry, _B12} = protocol:array(_B0,
                                             fun (_B1) ->
                                                     {V2_camp_id, _B2} =
                                                         protocol:uint32(_B1),
                                                     {V2_clue_list, _B9} =
                                                         protocol:array(_B2,
                                                                        fun
                                                                            (_B3) ->
                                                                                {V3_id,
                                                                                 _B4} =
                                                                                    protocol:uint32(_B3),
                                                                                {V3_quest_id,
                                                                                 _B5} =
                                                                                    protocol:uint32(_B4),
                                                                                {V3_status,
                                                                                 _B6} =
                                                                                    protocol:uint8(_B5),
                                                                                {V3_answer,
                                                                                 _B7} =
                                                                                    protocol:uint8(_B6),
                                                                                {{V3_id,
                                                                                  V3_quest_id,
                                                                                  V3_status,
                                                                                  V3_answer},
                                                                                 _B7}
                                                                        end),
                                                     {V2_inquiry_status, _B10} =
                                                         protocol:uint8(_B9),
                                                     {{V2_camp_id,
                                                       V2_clue_list,
                                                       V2_inquiry_status},
                                                      _B10}
                                             end),
    {ok, {V1_camp_inquiry}};
unpack(srv, 20601, _B0) ->
    {V1_inquiry_id, _B1} = protocol:uint32(_B0),
    {V1_answer, _B2} = protocol:uint8(_B1),
    {ok, {V1_inquiry_id, V1_answer}};
unpack(cli, 20601, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 20602, _B0) ->
    {V1_inquiry_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_inquiry_id}};
unpack(cli, 20602, _B0) ->
    {V1_inquiry_id, _B1} = protocol:uint32(_B0),
    {V1_answer_info, _B6} = protocol:array(_B1,
                                           fun (_B2) ->
                                                   {V2_answer, _B3} =
                                                       protocol:uint8(_B2),
                                                   {V2_count, _B4} =
                                                       protocol:uint32(_B3),
                                                   {{V2_answer, V2_count}, _B4}
                                           end),
    {ok, {V1_inquiry_id, V1_answer_info}};
unpack(srv, 20603, _B0) ->
    {V1_inquiry_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_inquiry_id}};
unpack(cli, 20603, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

