-file("src/proto/proto_120.erl", 1).

-module(proto_120).

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

-file("src/proto/proto_120.erl", 14).

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

-file("src/proto/proto_120.erl", 15).

-file("inc/agenda.hrl", 1).

-record(m_agenda,
        {ver = 1 :: non_neg_integer(),
         progress = [],
         activity = 0 :: non_neg_integer(),
         last_joined = 0 :: non_neg_integer(),
         rewarded = [] :: [non_neg_integer()],
         last_rewarded = 0 :: non_neg_integer(),
         recommends = [] :: list(),
         last_recommended = 0 :: non_neg_integer()}).

-record(agenda_prog,
        {ver = 1,
         id = 0 :: non_neg_integer(),
         joined = 0 :: non_neg_integer(),
         last_joined = 0 :: non_neg_integer()}).

-record(agenda_stat,
        {id = 0 :: non_neg_integer(), joined = 0, finised = 0}).

-record(agenda_stat_role,
        {id = {0, "", 0},
         lev = 0,
         date = {0, 0, 0},
         logs = []}).

-record(m_agenda_week,
        {ver = 1,
         id = 0,
         week_activity = 0 :: non_neg_integer(),
         rewards = [],
         last_add_activity_time = 0}).

-file("src/proto/proto_120.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 12000, {}) ->
    {ok, <<2:32/little, 12000:16/little>>};
pack(srv, 12000, {V0_list, V0_recommends}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_engaged:16/little, V1_max_try:8/little>>
                                 || {V1_id, V1_engaged, V1_max_try}
                                        <- V0_list]))/binary,
                (length(V0_recommends)):16/little,
                (list_to_binary([<<V1_rcd_id:32/little>>
                                 || V1_rcd_id <- V0_recommends]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12000:16/little,
       D_a_t_a/binary>>};
pack(cli, 12001, {}) ->
    {ok, <<2:32/little, 12001:16/little>>};
pack(srv, 12001,
     {V0_double_point, V0_max_double_point}) ->
    D_a_t_a = <<V0_double_point:16/little,
                V0_max_double_point:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12001:16/little,
       D_a_t_a/binary>>};
pack(cli, 12002, {}) ->
    {ok, <<2:32/little, 12002:16/little>>};
pack(srv, 12002, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12002:16/little,
       D_a_t_a/binary>>};
pack(cli, 12003, {}) ->
    {ok, <<2:32/little, 12003:16/little>>};
pack(srv, 12003, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12003:16/little,
       D_a_t_a/binary>>};
pack(cli, 12004, {}) ->
    {ok, <<2:32/little, 12004:16/little>>};
pack(srv, 12004, {V0_activity, V0_rewarded}) ->
    D_a_t_a = <<V0_activity:16/little,
                (length(V0_rewarded)):16/little,
                (list_to_binary([<<V1_item_id:32/little>>
                                 || V1_item_id <- V0_rewarded]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12004:16/little,
       D_a_t_a/binary>>};
pack(cli, 12005, {V0_item_id}) ->
    D_a_t_a = <<V0_item_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12005:16/little,
       D_a_t_a/binary>>};
pack(srv, 12005, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12005:16/little,
       D_a_t_a/binary>>};
pack(cli, 12006, {}) ->
    {ok, <<2:32/little, 12006:16/little>>};
pack(srv, 12006, {V0_energy_added}) ->
    D_a_t_a = <<V0_energy_added:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12006:16/little,
       D_a_t_a/binary>>};
pack(cli, 12007, {}) ->
    {ok, <<2:32/little, 12007:16/little>>};
pack(srv, 12007, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12007:16/little,
       D_a_t_a/binary>>};
pack(cli, 12008, {}) ->
    {ok, <<2:32/little, 12008:16/little>>};
pack(srv, 12008, {V0_buy_list}) ->
    D_a_t_a = <<(length(V0_buy_list)):16/little,
                (list_to_binary([<<V1_id:8/little, V1_lev:8/little,
                                   V1_time:32/little, V1_is_buy:8/little>>
                                 || {V1_id, V1_lev, V1_time, V1_is_buy}
                                        <- V0_buy_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12008:16/little,
       D_a_t_a/binary>>};
pack(cli, 12009, {V0_id}) ->
    D_a_t_a = <<V0_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12009:16/little,
       D_a_t_a/binary>>};
pack(srv, 12009, {V0_flag, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12009:16/little,
       D_a_t_a/binary>>};
pack(cli, 12010, {}) ->
    {ok, <<2:32/little, 12010:16/little>>};
pack(srv, 12010, {V0_activity, V0_rewards_info}) ->
    D_a_t_a = <<V0_activity:32/little,
                (length(V0_rewards_info)):16/little,
                (list_to_binary([<<V1_activity_need:32/little,
                                   (length(V1_reward)):16/little,
                                   (list_to_binary([<<V2_item_id:32/little,
                                                      V2_bind:8/little,
                                                      V2_num:32/little>>
                                                    || {V2_item_id,
                                                        V2_bind,
                                                        V2_num}
                                                           <- V1_reward]))/binary,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_icon:32/little,
                                   (protocol:pack(string, V1_desc))/binary,
                                   V1_flag:8/little>>
                                 || {V1_activity_need,
                                     V1_reward,
                                     V1_name,
                                     V1_icon,
                                     V1_desc,
                                     V1_flag}
                                        <- V0_rewards_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12010:16/little,
       D_a_t_a/binary>>};
pack(cli, 12011, {V0_activity_id}) ->
    D_a_t_a = <<V0_activity_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12011:16/little,
       D_a_t_a/binary>>};
pack(srv, 12011, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12011:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 12000, _B0) -> {ok, {}};
unpack(cli, 12000, _B0) ->
    {V1_list, _B6} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_id, _B2} = protocol:uint32(_B1),
                                            {V2_engaged, _B3} =
                                                protocol:uint16(_B2),
                                            {V2_max_try, _B4} =
                                                protocol:uint8(_B3),
                                            {{V2_id, V2_engaged, V2_max_try},
                                             _B4}
                                    end),
    {V1_recommends, _B10} = protocol:array(_B6,
                                           fun (_B7) ->
                                                   {V2_rcd_id, _B8} =
                                                       protocol:uint32(_B7),
                                                   {{V2_rcd_id}, _B8}
                                           end),
    {ok, {V1_list, V1_recommends}};
unpack(srv, 12001, _B0) -> {ok, {}};
unpack(cli, 12001, _B0) ->
    {V1_double_point, _B1} = protocol:uint16(_B0),
    {V1_max_double_point, _B2} = protocol:uint16(_B1),
    {ok, {V1_double_point, V1_max_double_point}};
unpack(srv, 12002, _B0) -> {ok, {}};
unpack(cli, 12002, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 12003, _B0) -> {ok, {}};
unpack(cli, 12003, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 12004, _B0) -> {ok, {}};
unpack(cli, 12004, _B0) ->
    {V1_activity, _B1} = protocol:uint16(_B0),
    {V1_rewarded, _B5} = protocol:array(_B1,
                                        fun (_B2) ->
                                                {V2_item_id, _B3} =
                                                    protocol:uint32(_B2),
                                                {{V2_item_id}, _B3}
                                        end),
    {ok, {V1_activity, V1_rewarded}};
unpack(srv, 12005, _B0) ->
    {V1_item_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_item_id}};
unpack(cli, 12005, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 12006, _B0) -> {ok, {}};
unpack(cli, 12006, _B0) ->
    {V1_energy_added, _B1} = protocol:uint32(_B0),
    {ok, {V1_energy_added}};
unpack(srv, 12007, _B0) -> {ok, {}};
unpack(cli, 12007, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 12008, _B0) -> {ok, {}};
unpack(cli, 12008, _B0) ->
    {V1_buy_list, _B7} = protocol:array(_B0,
                                        fun (_B1) ->
                                                {V2_id, _B2} =
                                                    protocol:uint8(_B1),
                                                {V2_lev, _B3} =
                                                    protocol:uint8(_B2),
                                                {V2_time, _B4} =
                                                    protocol:uint32(_B3),
                                                {V2_is_buy, _B5} =
                                                    protocol:uint8(_B4),
                                                {{V2_id,
                                                  V2_lev,
                                                  V2_time,
                                                  V2_is_buy},
                                                 _B5}
                                        end),
    {ok, {V1_buy_list}};
unpack(srv, 12009, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {ok, {V1_id}};
unpack(cli, 12009, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint8(_B2),
    {ok, {V1_flag, V1_msg, V1_id}};
unpack(srv, 12010, _B0) -> {ok, {}};
unpack(cli, 12010, _B0) ->
    {V1_activity, _B1} = protocol:uint32(_B0),
    {V1_rewards_info, _B15} = protocol:array(_B1,
                                             fun (_B2) ->
                                                     {V2_activity_need, _B3} =
                                                         protocol:uint32(_B2),
                                                     {V2_reward, _B9} =
                                                         protocol:array(_B3,
                                                                        fun
                                                                            (_B4) ->
                                                                                {V3_item_id,
                                                                                 _B5} =
                                                                                    protocol:uint32(_B4),
                                                                                {V3_bind,
                                                                                 _B6} =
                                                                                    protocol:uint8(_B5),
                                                                                {V3_num,
                                                                                 _B7} =
                                                                                    protocol:uint32(_B6),
                                                                                {{V3_item_id,
                                                                                  V3_bind,
                                                                                  V3_num},
                                                                                 _B7}
                                                                        end),
                                                     {V2_name, _B10} =
                                                         protocol:string(_B9),
                                                     {V2_icon, _B11} =
                                                         protocol:uint32(_B10),
                                                     {V2_desc, _B12} =
                                                         protocol:string(_B11),
                                                     {V2_flag, _B13} =
                                                         protocol:uint8(_B12),
                                                     {{V2_activity_need,
                                                       V2_reward,
                                                       V2_name,
                                                       V2_icon,
                                                       V2_desc,
                                                       V2_flag},
                                                      _B13}
                                             end),
    {ok, {V1_activity, V1_rewards_info}};
unpack(srv, 12011, _B0) ->
    {V1_activity_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_activity_id}};
unpack(cli, 12011, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

