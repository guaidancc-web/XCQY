-file("src/proto/proto_174.erl", 1).

-module(proto_174).

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

-file("src/proto/proto_174.erl", 14).

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

-file("src/proto/proto_174.erl", 15).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/proto/proto_174.erl", 16).

-file("inc/quest.hrl", 1).

-file("inc/quest_king.hrl", 1).

-record(quest_king,
        {ver = 1,
         stage = 1,
         finish = [],
         doing = [],
         rf_times = 0}).

-file("inc/quest.hrl", 36).

-record(quest_data,
        {id = 1 :: pos_integer(),
         phase = 1 :: pos_integer(),
         quest_line = 1,
         type = 1 :: pos_integer(),
         sec_type = 1 :: pos_integer(),
         name = "" :: list(),
         mode = 1 :: pos_integer(),
         leader_cond = [] :: [tuple()],
         is_leader_quest = 0 :: 0 | 1,
         can_giveup = 0 :: 0..1,
         lev = 1 :: pos_integer(),
         lev_break_min_times = 0 :: non_neg_integer(),
         lev_break_max_times = 0 :: non_neg_integer(),
         max_lev = 0 :: non_neg_integer(),
         auto_finished_lev = 0 :: non_neg_integer(),
         classes = 0 :: 0..4,
         pre_quest ::
             undefined | non_neg_integer() | [non_neg_integer()],
         check_distance = 0 :: 0..1,
         npc_accept_battle = 0 :: non_neg_integer(),
         npc_accept_id = 0 :: non_neg_integer(),
         npc_accept = 0 :: non_neg_integer(),
         npc_commit_battle = 0 :: non_neg_integer(),
         npc_commit_id = 0 :: non_neg_integer(),
         npc_commit = 0 :: non_neg_integer(),
         start_time = 0 ::
             tuple() | non_neg_integer() | undefined,
         end_time = 0 :: tuple() | non_neg_integer() | undefined,
         condition = [] :: [tuple()],
         progress = [] :: [tuple()],
         rewards_accept = [] :: [tuple()],
         rewards_commit = [] :: [tuple()],
         commit_loss = [] :: [tuple()],
         rewards_vip = [] :: [tuple()],
         action_accept = [] :: [tuple()],
         action_commit = [] :: [tuple()],
         times = 1 :: non_neg_integer(),
         desc = "" :: list(),
         auto_accept = 0 :: 0..1,
         is_auto_finished_gain = 0 :: 0..1,
         weekdays = [] :: [pos_integer()],
         white_list = [] :: list(),
         black_list = [] :: list(),
         notice_msg = "" :: list(),
         val_from_prev = 0 :: 0..1,
         honor = 0 :: non_neg_integer(),
         ach_num = 0 :: non_neg_integer(),
         rewards_badge = 0 :: non_neg_integer(),
         day = 0 :: non_neg_integer(),
         extra = []}).

-record(quest_extra_data,
        {name = 0, classes = 0, val1 = 0, val2 = 0, list = []}).

-record(quest_classes,
        {quest_id = 0,
         first_time = 0,
         ring = 1,
         round = 0,
         total_count = 0,
         done_list = []}).

-record(quest_offer,
        {quest_id = 0,
         day_count = 0,
         leader_count = 0,
         leader_quest_count = 0,
         round = 0,
         total_count = 0,
         team_args = []}).

-record(quest_treasure,
        {quest_id = 0, round = 0, total_count = 0}).

-record(quest_guild,
        {quest_id = 0,
         last_accepted = 0,
         ring = 1,
         round = 0,
         total_count = 0,
         done_list = []}).

-record(quest_chain,
        {quest_id = 0,
         accept_time = 0,
         type = 0,
         ext_data = [],
         round = 0,
         total_count = 0,
         commit_npc}).

-record(quest_marriage,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         round = 0,
         total_count = 0,
         ext_data = quest_marriage:quest_ext_data()}).

-record(quest_couple,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         round = 0,
         total_count = 0,
         partner_id,
         ext_data = quest_couple:quest_ext_data()}).

-record(quest_prac,
        {part = 1, chapter = 2, section = 0}).

-record(quest_plant,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         unit_id = 0,
         phase = 0,
         pos = {0, 0, 0},
         done_list = []}).

-record(quest_teacher,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         partner_id,
         round = 0,
         total_count = 0,
         stats = [],
         ext_data = quest_teacher:quest_ext_data()}).

-record(quest_shipping, {list = []}).

-record(quest_pursue,
        {quest_id = 0,
         last_accepted = 0,
         round_started = 0,
         ring = 1,
         round = 0,
         total_count = 0,
         done_list = []}).

-record(quest_child,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         mode = 1,
         unit_id = 0,
         done_list = []}).

-record(quest_pregnancy,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         mode = 1,
         done_list = []}).

-record(quest_acquaintance,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         partner_id = 0,
         partner_name = "",
         done_list = [],
         ring = 0,
         rpc_accepted = 0}).

-record(quest_summer,
        {ver = 1,
         finish = [],
         doing = [],
         score = 0,
         rewarded = []}).

-record(quest_single_dog,
        {ver = 1, finish = [], round = 1, extra = #{}}).

-record(quest_sign_draw, {finish = [], doing = []}).

-record(quest_score_exchange,
        {finish = [], doing = []}).

-record(quest_long_active, {finish = [], doing = []}).

-record(m_quest,
        {ver = 19,
         quest = [] :: list(),
         acceptable = [] :: list(),
         finished = [] :: list(),
         day_finished = [],
         quest_classes = #quest_classes{} :: #quest_classes{},
         quest_offer = #quest_offer{} :: #quest_offer{},
         quest_prac = #quest_prac{} :: #quest_prac{},
         quest_treasure = #quest_treasure{},
         quest_guild = #quest_guild{},
         quest_chain = #quest_chain{},
         quest_marriage = #quest_marriage{},
         quest_couple = #quest_couple{},
         quest_plant = #quest_plant{},
         quest_teacher = #quest_teacher{},
         quest_shipping = #quest_shipping{},
         quest_pursue = #quest_pursue{},
         quest_line = 2,
         quest_child = #quest_child{},
         quest_pregnancy = #quest_pregnancy{},
         quest_acquaintance = #quest_acquaintance{},
         quest_king = #quest_king{},
         quest_summer = #quest_summer{},
         quest_single_dog = #quest_single_dog{},
         quest_sign_draw = #quest_sign_draw{},
         quest_score_exchange = #quest_score_exchange{},
         quest_long_active = #quest_long_active{}}).

-record(quest,
        {id = 1 :: pos_integer(),
         name = "" :: binary(),
         type = 1 :: pos_integer(),
         sec_type = 1 :: pos_integer(),
         finish = 0 :: 0..2,
         quality = 0 :: 0..4,
         progress = [] :: [tuple()],
         accept_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         finish_time = 0 :: non_neg_integer(),
         round = 0 :: non_neg_integer()}).

-record(quest_progress,
        {id = 0 :: non_neg_integer(),
         label :: undefined | atom(),
         target = 0 :: non_neg_integer(),
         param = [] :: list(),
         finish = 0 :: 0..1,
         trigger :: undefined | tuple(),
         target_val = 1 :: pos_integer(),
         value = 0 :: non_neg_integer(),
         msg = "" :: bitstring() | string(),
         ext_data = [] :: [tuple()],
         dyn_ext_data = [] :: [tuple()]}).

-record(quest_rewards,
        {prob = 1000 :: pos_integer(),
         classes = 0 :: 0..4,
         gain :: undefined | tuple(),
         action :: undefined | function()}).

-record(quest_stats,
        {sec_type = 1, stats = [], desc = []}).

-file("src/proto/proto_174.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 17400, {}) ->
    {ok, <<2:32/little, 17400:16/little>>};
pack(srv, 17400,
     {#m_lev_break{times = V0_times, trial = V0_trial},
      V0_goals}) ->
    D_a_t_a = <<V0_times:8/little, V0_trial:8/little,
                (length(V0_goals)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (length(V1_progress)):16/little,
                                   (list_to_binary([<<V2_id:16/signed-little,
                                                      V2_finish:8/little,
                                                      V2_target:32/little,
                                                      V2_target_val:16/little,
                                                      V2_value:16/little,
                                                      (length(V2_ext_data)):16/little,
                                                      (list_to_binary([<<V3_key:8/little,
                                                                         V3_value:32/little>>
                                                                       || {V3_key,
                                                                           V3_value}
                                                                              <- V2_ext_data]))/binary>>
                                                    || #quest_progress{id =
                                                                           V2_id,
                                                                       finish =
                                                                           V2_finish,
                                                                       target =
                                                                           V2_target,
                                                                       target_val
                                                                           =
                                                                           V2_target_val,
                                                                       value =
                                                                           V2_value,
                                                                       ext_data
                                                                           =
                                                                           V2_ext_data}
                                                           <- V1_progress]))/binary,
                                   V1_finish:8/little>>
                                 || {V1_id, V1_progress, V1_finish}
                                        <- V0_goals]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17400:16/little,
       D_a_t_a/binary>>};
pack(cli, 17401, {}) ->
    {ok, <<2:32/little, 17401:16/little>>};
pack(srv, 17401, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17401:16/little,
       D_a_t_a/binary>>};
pack(cli, 17402, {}) ->
    {ok, <<2:32/little, 17402:16/little>>};
pack(srv, 17402, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17402:16/little,
       D_a_t_a/binary>>};
pack(cli, 17403, {}) ->
    {ok, <<2:32/little, 17403:16/little>>};
pack(srv, 17403, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17403:16/little,
       D_a_t_a/binary>>};
pack(cli, 17404, {}) ->
    {ok, <<2:32/little, 17404:16/little>>};
pack(srv, 17404, {V0_contribution, V0_need}) ->
    D_a_t_a = <<V0_contribution:32/little,
                V0_need:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17404:16/little,
       D_a_t_a/binary>>};
pack(cli, 17405, {V0_point}) ->
    D_a_t_a = <<V0_point:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17405:16/little,
       D_a_t_a/binary>>};
pack(srv, 17405, {V0_flag, V0_msg, V0_attr_point}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_attr_point:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17405:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 17400, _B0) -> {ok, {}};
unpack(cli, 17400, _B0) ->
    {V1_times, _B1} = protocol:uint8(_B0),
    {V1_trial, _B2} = protocol:uint8(_B1),
    {V1_goals, _B20} = protocol:array(_B2,
                                      fun (_B3) ->
                                              {V2_id, _B4} =
                                                  protocol:uint32(_B3),
                                              {V2_progress, _B17} =
                                                  protocol:array(_B4,
                                                                 fun (_B5) ->
                                                                         {V3_id,
                                                                          _B6} =
                                                                             protocol:int16(_B5),
                                                                         {V3_finish,
                                                                          _B7} =
                                                                             protocol:uint8(_B6),
                                                                         {V3_target,
                                                                          _B8} =
                                                                             protocol:uint32(_B7),
                                                                         {V3_target_val,
                                                                          _B9} =
                                                                             protocol:uint16(_B8),
                                                                         {V3_value,
                                                                          _B10} =
                                                                             protocol:uint16(_B9),
                                                                         {V3_ext_data,
                                                                          _B15} =
                                                                             protocol:array(_B10,
                                                                                            fun
                                                                                                (_B11) ->
                                                                                                    {V4_key,
                                                                                                     _B12} =
                                                                                                        protocol:uint8(_B11),
                                                                                                    {V4_value,
                                                                                                     _B13} =
                                                                                                        protocol:uint32(_B12),
                                                                                                    {{V4_key,
                                                                                                      V4_value},
                                                                                                     _B13}
                                                                                            end),
                                                                         {{V3_id,
                                                                           V3_finish,
                                                                           V3_target,
                                                                           V3_target_val,
                                                                           V3_value,
                                                                           V3_ext_data},
                                                                          _B15}
                                                                 end),
                                              {V2_finish, _B18} =
                                                  protocol:uint8(_B17),
                                              {{V2_id, V2_progress, V2_finish},
                                               _B18}
                                      end),
    {ok, {V1_times, V1_trial, V1_goals}};
unpack(srv, 17401, _B0) -> {ok, {}};
unpack(cli, 17401, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17402, _B0) -> {ok, {}};
unpack(cli, 17402, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17403, _B0) -> {ok, {}};
unpack(cli, 17403, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17404, _B0) -> {ok, {}};
unpack(cli, 17404, _B0) ->
    {V1_contribution, _B1} = protocol:uint32(_B0),
    {V1_need, _B2} = protocol:uint32(_B1),
    {ok, {V1_contribution, V1_need}};
unpack(srv, 17405, _B0) ->
    {V1_point, _B1} = protocol:uint16(_B0),
    {ok, {V1_point}};
unpack(cli, 17405, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_attr_point, _B3} = protocol:uint16(_B2),
    {ok, {V1_flag, V1_msg, V1_attr_point}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

