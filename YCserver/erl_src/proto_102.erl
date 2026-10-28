-file("src/proto/proto_102.erl", 1).

-module(proto_102).

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

-file("src/proto/proto_102.erl", 14).

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

-file("src/proto/proto_102.erl", 15).

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

-file("src/proto/proto_102.erl", 16).

-file("inc/achieve_shop.hrl", 1).

-record(m_achieve_shop,
        {ver = 5 :: pos_integer(),
         shops = [] :: list(),
         zone_theme = 0 :: non_neg_integer(),
         team_mark = 401 :: non_neg_integer(),
         chat_bubble = 301 :: non_neg_integer(),
         photo_frame = 0 :: non_neg_integer(),
         badges = [] :: list(),
         prefix = 0,
         honor = 0,
         footmark = 0 :: non_neg_integer()}).

-record(ashop_goods_info,
        {ver = 1 :: non_neg_integer(),
         id = 0 :: non_neg_integer(),
         state = 0 :: non_neg_integer(),
         expire = 0 :: non_neg_integer()}).

-file("src/proto/proto_102.erl", 17).

-file("inc/achievement.hrl", 1).

-record(m_achievement,
        {ver = 3 :: pos_integer(),
         point = 0 :: non_neg_integer(),
         finish = [] :: [{pos_integer(), pos_integer()}],
         doing = [] :: [tuple()],
         overdue = [] :: [pos_integer()],
         assets_point = 0 :: non_neg_integer(),
         focus = []}).

-record(achievement_log,
        {id = 0,
         accept = 0 :: integer(),
         finish = 0 :: integer()}).

-file("src/proto/proto_102.erl", 18).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 10200, {}) ->
    {ok, <<2:32/little, 10200:16/little>>};
pack(srv, 10200, {V0_quest_list}) ->
    D_a_t_a = <<(length(V0_quest_list)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_finish:8/little,
                                   V1_accept_time:32/little,
                                   (length(V1_progress)):16/little,
                                   (list_to_binary([<<V2_id:16/signed-little,
                                                      V2_finish:8/little,
                                                      V2_target:32/little,
                                                      V2_target_val:32/little,
                                                      V2_value:32/little,
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
                                                           <- V1_progress]))/binary>>
                                 || #quest{id = V1_id, finish = V1_finish,
                                           accept_time = V1_accept_time,
                                           progress = V1_progress}
                                        <- V0_quest_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10200:16/little,
       D_a_t_a/binary>>};
pack(cli, 10201, {}) ->
    {ok, <<2:32/little, 10201:16/little>>};
pack(srv, 10201, {V0_can_accept_quest_list}) ->
    D_a_t_a =
        <<(length(V0_can_accept_quest_list)):16/little,
          (list_to_binary([<<V1_id:32/little>>
                           || V1_id <- V0_can_accept_quest_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10201:16/little,
       D_a_t_a/binary>>};
pack(cli, 10202, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10202:16/little,
       D_a_t_a/binary>>};
pack(srv, 10202, {V0_flag, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_flag:8/signed-little,
                (protocol:pack(string, V0_msg))/binary,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10202:16/little,
       D_a_t_a/binary>>};
pack(cli, 10203, {}) ->
    {ok, <<2:32/little, 10203:16/little>>};
pack(srv, 10203, {V0_quest_list}) ->
    D_a_t_a = <<(length(V0_quest_list)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_finish:8/little,
                                   V1_accept_time:32/little,
                                   (length(V1_progress)):16/little,
                                   (list_to_binary([<<V2_id:16/signed-little,
                                                      V2_finish:8/little,
                                                      V2_target:32/little,
                                                      V2_target_val:32/little,
                                                      V2_value:32/little,
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
                                                           <- V1_progress]))/binary>>
                                 || #quest{id = V1_id, finish = V1_finish,
                                           accept_time = V1_accept_time,
                                           progress = V1_progress}
                                        <- V0_quest_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10203:16/little,
       D_a_t_a/binary>>};
pack(cli, 10204, {}) ->
    {ok, <<2:32/little, 10204:16/little>>};
pack(srv, 10204, {V0_can_accept_quest_list}) ->
    D_a_t_a =
        <<(length(V0_can_accept_quest_list)):16/little,
          (list_to_binary([<<V1_id:32/little>>
                           || V1_id <- V0_can_accept_quest_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10204:16/little,
       D_a_t_a/binary>>};
pack(cli, 10205, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10205:16/little,
       D_a_t_a/binary>>};
pack(srv, 10205, {V0_flag, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_flag:8/signed-little,
                (protocol:pack(string, V0_msg))/binary,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10205:16/little,
       D_a_t_a/binary>>};
pack(cli, 10206, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10206:16/little,
       D_a_t_a/binary>>};
pack(srv, 10206, {V0_flag, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_flag:8/signed-little,
                (protocol:pack(string, V0_msg))/binary,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10206:16/little,
       D_a_t_a/binary>>};
pack(cli, 10207, {}) ->
    {ok, <<2:32/little, 10207:16/little>>};
pack(srv, 10207, {V0_can_accept_quest_list}) ->
    D_a_t_a =
        <<(length(V0_can_accept_quest_list)):16/little,
          (list_to_binary([<<V1_id:32/little>>
                           || V1_id <- V0_can_accept_quest_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10207:16/little,
       D_a_t_a/binary>>};
pack(cli, 10208, {}) ->
    {ok, <<2:32/little, 10208:16/little>>};
pack(srv, 10208, {V0_quest_list}) ->
    D_a_t_a = <<(length(V0_quest_list)):16/little,
                (list_to_binary([<<V1_id:32/little>>
                                 || V1_id <- V0_quest_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10208:16/little,
       D_a_t_a/binary>>};
pack(cli, 10209, {}) ->
    {ok, <<2:32/little, 10209:16/little>>};
pack(srv, 10209, {V0_quest_list}) ->
    D_a_t_a = <<(length(V0_quest_list)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_finish:8/little,
                                   V1_accept_time:32/little,
                                   (length(V1_progress)):16/little,
                                   (list_to_binary([<<V2_id:16/signed-little,
                                                      V2_finish:8/little,
                                                      V2_target:32/little,
                                                      V2_target_val:32/little,
                                                      V2_value:32/little,
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
                                                           <- V1_progress]))/binary>>
                                 || #quest{id = V1_id, finish = V1_finish,
                                           accept_time = V1_accept_time,
                                           progress = V1_progress}
                                        <- V0_quest_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10209:16/little,
       D_a_t_a/binary>>};
pack(cli, 10210, {}) ->
    {ok, <<2:32/little, 10210:16/little>>};
pack(srv, 10210, {V0_quest_rewards}) ->
    D_a_t_a = <<(length(V0_quest_rewards)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (length(V1_rewards)):16/little,
                                   (list_to_binary([<<V2_base_id:32/little,
                                                      V2_num:32/little>>
                                                    || {V2_base_id, V2_num}
                                                           <- V1_rewards]))/binary>>
                                 || {V1_id, V1_rewards}
                                        <- V0_quest_rewards]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10210:16/little,
       D_a_t_a/binary>>};
pack(cli, 10211, {V0_sec_type, V0_args}) ->
    D_a_t_a = <<V0_sec_type:8/little, V0_args:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10211:16/little,
       D_a_t_a/binary>>};
pack(srv, 10211, {}) ->
    {ok, <<2:32/little, 10211:16/little>>};
pack(cli, 10212, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10212:16/little,
       D_a_t_a/binary>>};
pack(srv, 10212, {V0_id, V0_state}) ->
    D_a_t_a = <<V0_id:32/little, V0_state:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10212:16/little,
       D_a_t_a/binary>>};
pack(cli, 10213, {}) ->
    {ok, <<2:32/little, 10213:16/little>>};
pack(srv, 10213,
     {#quest_prac{part = V0_part, chapter = V0_chapter,
                  section = V0_section}}) ->
    D_a_t_a = <<V0_part:8/little, V0_chapter:8/little,
                V0_section:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10213:16/little,
       D_a_t_a/binary>>};
pack(cli, 10214, {}) ->
    {ok, <<2:32/little, 10214:16/little>>};
pack(srv, 10214, {V0_quest_stats}) ->
    D_a_t_a = <<(length(V0_quest_stats)):16/little,
                (list_to_binary([<<V1_sec_type:8/little,
                                   (length(V1_stats)):16/little,
                                   (list_to_binary([<<V2_key:8/little,
                                                      V2_value:32/little>>
                                                    || {V2_key, V2_value}
                                                           <- V1_stats]))/binary,
                                   (length(V1_desc)):16/little,
                                   (list_to_binary([<<V2_prog_id:8/little,
                                                      (length(V2_desc_array)):16/little,
                                                      (list_to_binary([<<V3_key:8/little,
                                                                         (protocol:pack(string,
                                                                                        V3_string))/binary>>
                                                                       || {V3_key,
                                                                           V3_string}
                                                                              <- V2_desc_array]))/binary>>
                                                    || {V2_prog_id,
                                                        V2_desc_array}
                                                           <- V1_desc]))/binary>>
                                 || #quest_stats{sec_type = V1_sec_type,
                                                 stats = V1_stats,
                                                 desc = V1_desc}
                                        <- V0_quest_stats]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10214:16/little,
       D_a_t_a/binary>>};
pack(cli, 10215, {V0_sec_type}) ->
    D_a_t_a = <<V0_sec_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10215:16/little,
       D_a_t_a/binary>>};
pack(srv, 10215, {V0_day_finished}) ->
    D_a_t_a = <<(length(V0_day_finished)):16/little,
                (list_to_binary([<<V1_sec_type:8/little,
                                   (length(V1_quest_ids)):16/little,
                                   (list_to_binary([<<V2_id:8/little>>
                                                    || [V2_id]
                                                           <- V1_quest_ids]))/binary>>
                                 || [V1_sec_type, V1_quest_ids]
                                        <- V0_day_finished]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10215:16/little,
       D_a_t_a/binary>>};
pack(cli, 10216, {V0_assets_enum}) ->
    D_a_t_a = <<V0_assets_enum:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10216:16/little,
       D_a_t_a/binary>>};
pack(srv, 10216, {}) ->
    {ok, <<2:32/little, 10216:16/little>>};
pack(cli, 10217, {V0_battle_id, V0_id}) ->
    D_a_t_a = <<V0_battle_id:32/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10217:16/little,
       D_a_t_a/binary>>};
pack(srv, 10217, {}) ->
    {ok, <<2:32/little, 10217:16/little>>};
pack(cli, 10218, {V0_quest_id}) ->
    D_a_t_a = <<V0_quest_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10218:16/little,
       D_a_t_a/binary>>};
pack(srv, 10218, {}) ->
    {ok, <<2:32/little, 10218:16/little>>};
pack(cli, 10219, {}) ->
    {ok, <<2:32/little, 10219:16/little>>};
pack(srv, 10219, {V0_achievement_list}) ->
    D_a_t_a = <<(length(V0_achievement_list)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_finish:8/little,
                                   V1_end_time:32/little,
                                   V1_finish_time:32/little,
                                   (length(V1_progress)):16/little,
                                   (list_to_binary([<<V2_id:16/signed-little,
                                                      V2_finish:8/little,
                                                      V2_target:32/little,
                                                      V2_target_val:32/little,
                                                      V2_value:32/little>>
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
                                                                           V2_value}
                                                           <- V1_progress]))/binary>>
                                 || #quest{id = V1_id, finish = V1_finish,
                                           end_time = V1_end_time,
                                           finish_time = V1_finish_time,
                                           progress = V1_progress}
                                        <- V0_achievement_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10219:16/little,
       D_a_t_a/binary>>};
pack(cli, 10220, {}) ->
    {ok, <<2:32/little, 10220:16/little>>};
pack(srv, 10220, {V0_achievement_list}) ->
    D_a_t_a = <<(length(V0_achievement_list)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_finish:8/little,
                                   V1_end_time:32/little,
                                   V1_finish_time:32/little,
                                   (length(V1_progress)):16/little,
                                   (list_to_binary([<<V2_id:16/signed-little,
                                                      V2_finish:8/little,
                                                      V2_target:32/little,
                                                      V2_target_val:32/little,
                                                      V2_value:32/little>>
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
                                                                           V2_value}
                                                           <- V1_progress]))/binary>>
                                 || #quest{id = V1_id, finish = V1_finish,
                                           end_time = V1_end_time,
                                           finish_time = V1_finish_time,
                                           progress = V1_progress}
                                        <- V0_achievement_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10220:16/little,
       D_a_t_a/binary>>};
pack(cli, 10221, {V0_id_list}) ->
    D_a_t_a = <<(length(V0_id_list)):16/little,
                (list_to_binary([<<V1_id:32/little>>
                                 || V1_id <- V0_id_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10221:16/little,
       D_a_t_a/binary>>};
pack(srv, 10221, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/signed-little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10221:16/little,
       D_a_t_a/binary>>};
pack(cli, 10222, {}) ->
    {ok, <<2:32/little, 10222:16/little>>};
pack(srv, 10222, {V0_num, V0_assets_num}) ->
    D_a_t_a = <<V0_num:32/little, V0_assets_num:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10222:16/little,
       D_a_t_a/binary>>};
pack(cli, 10223, {V0_quest_id, V0_talk_type}) ->
    D_a_t_a = <<V0_quest_id:32/little,
                V0_talk_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10223:16/little,
       D_a_t_a/binary>>};
pack(srv, 10223,
     {V0_op_code, V0_quest_id, V0_talk_type}) ->
    D_a_t_a = <<V0_op_code:8/little, V0_quest_id:32/little,
                V0_talk_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10223:16/little,
       D_a_t_a/binary>>};
pack(cli, 10224, {}) ->
    {ok, <<2:32/little, 10224:16/little>>};
pack(srv, 10224,
     {#quest_plant{phase = V0_phase, unit_id = V0_unit_id,
                   last_commited = V0_last_commited,
                   pos = {V0_map, V0_x, V0_y}}}) ->
    D_a_t_a = <<V0_phase:8/little, V0_unit_id:32/little,
                V0_last_commited:32/little, V0_map:32/little,
                V0_x:32/little, V0_y:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10224:16/little,
       D_a_t_a/binary>>};
pack(cli, 10225, {}) ->
    {ok, <<2:32/little, 10225:16/little>>};
pack(srv, 10225, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/signed-little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10225:16/little,
       D_a_t_a/binary>>};
pack(cli, 10226, {V0_shop_type}) ->
    D_a_t_a = <<V0_shop_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10226:16/little,
       D_a_t_a/binary>>};
pack(srv, 10226, {V0_shop_type, V0_goods_list}) ->
    D_a_t_a = <<V0_shop_type:8/little,
                (length(V0_goods_list)):16/little,
                (list_to_binary([<<V1_id:16/little,
                                   V1_state:8/signed-little,
                                   V1_expire:32/signed-little>>
                                 || #ashop_goods_info{id = V1_id,
                                                      state = V1_state,
                                                      expire = V1_expire}
                                        <- V0_goods_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10226:16/little,
       D_a_t_a/binary>>};
pack(cli, 10227, {V0_id}) ->
    D_a_t_a = <<V0_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10227:16/little,
       D_a_t_a/binary>>};
pack(srv, 10227, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10227:16/little,
       D_a_t_a/binary>>};
pack(cli, 10228, {}) ->
    {ok, <<2:32/little, 10228:16/little>>};
pack(srv, 10228, {V0_result}) ->
    D_a_t_a = <<V0_result:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10228:16/little,
       D_a_t_a/binary>>};
pack(cli, 10229, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10229:16/little,
       D_a_t_a/binary>>};
pack(srv, 10229,
     {#achievement_log{id = V0_id, accept = V0_accept,
                       finish = V0_finish},
      V0_total}) ->
    D_a_t_a = <<V0_id:32/little, V0_accept:32/little,
                V0_finish:32/little, V0_total:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10229:16/little,
       D_a_t_a/binary>>};
pack(cli, 10230, {}) ->
    {ok, <<2:32/little, 10230:16/little>>};
pack(srv, 10230, {V0_achievement_log, V0_total}) ->
    D_a_t_a = <<(length(V0_achievement_log)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_accept:32/little,
                                   V1_finish:32/little>>
                                 || #achievement_log{id = V1_id,
                                                     accept = V1_accept,
                                                     finish = V1_finish}
                                        <- V0_achievement_log]))/binary,
                V0_total:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10230:16/little,
       D_a_t_a/binary>>};
pack(cli, 10231, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10231:16/little,
       D_a_t_a/binary>>};
pack(srv, 10231, {V0_result, V0_id}) ->
    D_a_t_a = <<V0_result:8/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10231:16/little,
       D_a_t_a/binary>>};
pack(cli, 10232, {}) ->
    {ok, <<2:32/little, 10232:16/little>>};
pack(srv, 10232, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little>>
                                 || V1_id <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10232:16/little,
       D_a_t_a/binary>>};
pack(cli, 10233, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10233:16/little,
       D_a_t_a/binary>>};
pack(srv, 10233,
     {V0_id,
      V0_platform,
      V0_zone_id,
      V0_name,
      V0_num,
      V0_assets_num,
      V0_list}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_num:32/little, V0_assets_num:32/little,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_type:32/little,
                                   V1_finish:32/little>>
                                 || {V1_type, V1_finish} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10233:16/little,
       D_a_t_a/binary>>};
pack(cli, 10234, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10234:16/little,
       D_a_t_a/binary>>};
pack(srv, 10234, {V0_result, V0_id}) ->
    D_a_t_a = <<V0_result:8/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10234:16/little,
       D_a_t_a/binary>>};
pack(cli, 10235, {}) ->
    {ok, <<2:32/little, 10235:16/little>>};
pack(srv, 10235, {V0_goal_list}) ->
    D_a_t_a = <<(length(V0_goal_list)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_finish:8/little,
                                   V1_end_time:32/little,
                                   V1_finish_time:32/little,
                                   (length(V1_progress)):16/little,
                                   (list_to_binary([<<V2_id:16/signed-little,
                                                      V2_finish:8/little,
                                                      V2_target:32/little,
                                                      V2_target_val:32/little,
                                                      V2_value:32/little>>
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
                                                                           V2_value}
                                                           <- V1_progress]))/binary>>
                                 || #quest{id = V1_id, finish = V1_finish,
                                           end_time = V1_end_time,
                                           finish_time = V1_finish_time,
                                           progress = V1_progress}
                                        <- V0_goal_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10235:16/little,
       D_a_t_a/binary>>};
pack(cli, 10236, {V0_day, V0_id}) ->
    D_a_t_a = <<V0_day:32/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10236:16/little,
       D_a_t_a/binary>>};
pack(srv, 10236, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10236:16/little,
       D_a_t_a/binary>>};
pack(cli, 10237, {}) ->
    {ok, <<2:32/little, 10237:16/little>>};
pack(srv, 10237, {V0_day_reward}) ->
    D_a_t_a = <<(length(V0_day_reward)):16/little,
                (list_to_binary([<<V1_day:32/little,
                                   V1_quest_id:32/little>>
                                 || {V1_day, V1_quest_id}
                                        <- V0_day_reward]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10237:16/little,
       D_a_t_a/binary>>};
pack(cli, 10238, {}) ->
    {ok, <<2:32/little, 10238:16/little>>};
pack(srv, 10238, {V0_discount}) ->
    D_a_t_a = <<(length(V0_discount)):16/little,
                (list_to_binary([<<V1_discount_id:32/little,
                                   V1_day:32/little>>
                                 || {V1_discount_id, V1_day}
                                        <- V0_discount]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10238:16/little,
       D_a_t_a/binary>>};
pack(cli, 10239, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10239:16/little,
       D_a_t_a/binary>>};
pack(srv, 10239, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10239:16/little,
       D_a_t_a/binary>>};
pack(cli, 10240, {}) ->
    {ok, <<2:32/little, 10240:16/little>>};
pack(srv, 10240, {V0_day}) ->
    D_a_t_a = <<V0_day:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10240:16/little,
       D_a_t_a/binary>>};
pack(cli, 10241, {V0_count}) ->
    D_a_t_a = <<V0_count:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10241:16/little,
       D_a_t_a/binary>>};
pack(srv, 10241, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10241:16/little,
       D_a_t_a/binary>>};
pack(cli, 10242, {}) ->
    {ok, <<2:32/little, 10242:16/little>>};
pack(srv, 10242, {V0_complete_list}) ->
    D_a_t_a = <<(length(V0_complete_list)):16/little,
                (list_to_binary([<<V1_count:16/little>>
                                 || V1_count <- V0_complete_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10242:16/little,
       D_a_t_a/binary>>};
pack(cli, 10243, {}) ->
    {ok, <<2:32/little, 10243:16/little>>};
pack(srv, 10243,
     {V0_try_fill,
      #quest_child{unit_id = V0_unit_id,
                   last_commited = V0_last_commited,
                   last_accepted = V0_last_accepted, round = V0_round}}) ->
    D_a_t_a = <<V0_try_fill:32/little, V0_unit_id:32/little,
                V0_last_commited:32/little, V0_last_accepted:32/little,
                V0_round:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10243:16/little,
       D_a_t_a/binary>>};
pack(cli, 10244, {}) ->
    {ok, <<2:32/little, 10244:16/little>>};
pack(srv, 10244, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/signed-little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10244:16/little,
       D_a_t_a/binary>>};
pack(cli, 10245, {}) ->
    {ok, <<2:32/little, 10245:16/little>>};
pack(srv, 10245, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/signed-little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10245:16/little,
       D_a_t_a/binary>>};
pack(cli, 10246, {}) ->
    {ok, <<2:32/little, 10246:16/little>>};
pack(srv, 10246, {V0_flag, V0_mode, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/signed-little,
                V0_mode:8/signed-little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10246:16/little,
       D_a_t_a/binary>>};
pack(cli, 10247, {}) ->
    {ok, <<2:32/little, 10247:16/little>>};
pack(srv, 10247,
     {#quest_pregnancy{last_commited = V0_last_commited,
                       last_accepted = V0_last_accepted, round = V0_round}}) ->
    D_a_t_a = <<V0_last_commited:32/little,
                V0_last_accepted:32/little, V0_round:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10247:16/little,
       D_a_t_a/binary>>};
pack(cli, 10248, {}) ->
    {ok, <<2:32/little, 10248:16/little>>};
pack(srv, 10248, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little>>
                                 || V1_id <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10248:16/little,
       D_a_t_a/binary>>};
pack(cli, 10249, {V0_id}) ->
    D_a_t_a = <<V0_id:32/signed-little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10249:16/little,
       D_a_t_a/binary>>};
pack(srv, 10249, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/signed-little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10249:16/little,
       D_a_t_a/binary>>};
pack(cli, 10250, {}) ->
    {ok, <<2:32/little, 10250:16/little>>};
pack(srv, 10250,
     {V0_id, V0_platform, V0_zone_id, V0_name}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10250:16/little,
       D_a_t_a/binary>>};
pack(cli, 10251, {}) ->
    {ok, <<2:32/little, 10251:16/little>>};
pack(srv, 10251,
     {#quest_king{stage = V0_stage, finish = V0_finish,
                  doing = V0_doing, rf_times = V0_rf_times}}) ->
    D_a_t_a = <<V0_stage:8/little,
                (length(V0_finish)):16/little,
                (list_to_binary([<<V1_envelop:8/little,
                                   V1_quest_id:32/little, V1_status:8/little>>
                                 || {V1_envelop, V1_quest_id, V1_status}
                                        <- V0_finish]))/binary,
                (length(V0_doing)):16/little,
                (list_to_binary([<<V1_envelop:8/little,
                                   V1_quest_id:32/little>>
                                 || {V1_envelop, V1_quest_id}
                                        <- V0_doing]))/binary,
                V0_rf_times:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10251:16/little,
       D_a_t_a/binary>>};
pack(cli, 10252, {V0_envelop}) ->
    D_a_t_a = <<V0_envelop:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10252:16/little,
       D_a_t_a/binary>>};
pack(srv, 10252, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/signed-little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10252:16/little,
       D_a_t_a/binary>>};
pack(cli, 10253, {}) ->
    {ok, <<2:32/little, 10253:16/little>>};
pack(srv, 10253,
     {#quest_summer{finish = V0_finish, doing = V0_doing,
                    score = V0_score, rewarded = V0_rewarded}}) ->
    D_a_t_a = <<(length(V0_finish)):16/little,
                (list_to_binary([<<V1_quest_id:32/little>>
                                 || V1_quest_id <- V0_finish]))/binary,
                (length(V0_doing)):16/little,
                (list_to_binary([<<V1_quest_id:32/little>>
                                 || V1_quest_id <- V0_doing]))/binary,
                V0_score:32/little, (length(V0_rewarded)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_times:8/little>>
                                 || {V1_id, V1_times}
                                        <- V0_rewarded]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10253:16/little,
       D_a_t_a/binary>>};
pack(cli, 10254, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10254:16/little,
       D_a_t_a/binary>>};
pack(srv, 10254, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/signed-little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10254:16/little,
       D_a_t_a/binary>>};
pack(cli, 10255, {V0_order, V0_times}) ->
    D_a_t_a = <<V0_order:8/little, V0_times:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10255:16/little,
       D_a_t_a/binary>>};
pack(srv, 10255, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10255:16/little,
       D_a_t_a/binary>>};
pack(cli, 10256, {}) ->
    {ok, <<2:32/little, 10256:16/little>>};
pack(srv, 10256, {V0_times, V0_order, V0_gain_list}) ->
    D_a_t_a = <<V0_times:8/little, V0_order:8/little,
                (length(V0_gain_list)):16/little,
                (list_to_binary([<<V1_item_id1:32/little,
                                   V1_num1:32/little>>
                                 || {V1_item_id1, V1_num1}
                                        <- V0_gain_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10256:16/little,
       D_a_t_a/binary>>};
pack(cli, 10257, {}) ->
    {ok, <<2:32/little, 10257:16/little>>};
pack(srv, 10257, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10257:16/little,
       D_a_t_a/binary>>};
pack(cli, 10258, {}) ->
    {ok, <<2:32/little, 10258:16/little>>};
pack(srv, 10258, {}) ->
    {ok, <<2:32/little, 10258:16/little>>};
pack(cli, 10259, {}) ->
    {ok, <<2:32/little, 10259:16/little>>};
pack(srv, 10259, {V0_flag, V0_val, V0_target_val}) ->
    D_a_t_a = <<V0_flag:8/little, V0_val:32/little,
                V0_target_val:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10259:16/little,
       D_a_t_a/binary>>};
pack(cli, 10260, {}) ->
    {ok, <<2:32/little, 10260:16/little>>};
pack(srv, 10260, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10260:16/little,
       D_a_t_a/binary>>};
pack(cli, 10261, {}) ->
    {ok, <<2:32/little, 10261:16/little>>};
pack(srv, 10261,
     {#quest_long_active{finish = V0_finish,
                         doing = V0_doing}}) ->
    D_a_t_a = <<(length(V0_finish)):16/little,
                (list_to_binary([<<V1_quest_id:32/little>>
                                 || V1_quest_id <- V0_finish]))/binary,
                (length(V0_doing)):16/little,
                (list_to_binary([<<V1_quest_id:32/little>>
                                 || V1_quest_id <- V0_doing]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10261:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 10200, _B0) -> {ok, {}};
unpack(cli, 10200, _B0) ->
    {V1_quest_list, _B19} = protocol:array(_B0,
                                           fun (_B1) ->
                                                   {V2_id, _B2} =
                                                       protocol:uint32(_B1),
                                                   {V2_finish, _B3} =
                                                       protocol:uint8(_B2),
                                                   {V2_accept_time, _B4} =
                                                       protocol:uint32(_B3),
                                                   {V2_progress, _B17} =
                                                       protocol:array(_B4,
                                                                      fun
                                                                          (_B5) ->
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
                                                                                  protocol:uint32(_B8),
                                                                              {V3_value,
                                                                               _B10} =
                                                                                  protocol:uint32(_B9),
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
                                                   {{V2_id,
                                                     V2_finish,
                                                     V2_accept_time,
                                                     V2_progress},
                                                    _B17}
                                           end),
    {ok, {V1_quest_list}};
unpack(srv, 10201, _B0) -> {ok, {}};
unpack(cli, 10201, _B0) ->
    {V1_can_accept_quest_list, _B4} = protocol:array(_B0,
                                                     fun (_B1) ->
                                                             {V2_id, _B2} =
                                                                 protocol:uint32(_B1),
                                                             {{V2_id}, _B2}
                                                     end),
    {ok, {V1_can_accept_quest_list}};
unpack(srv, 10202, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10202, _B0) ->
    {V1_flag, _B1} = protocol:int8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_id}};
unpack(srv, 10203, _B0) -> {ok, {}};
unpack(cli, 10203, _B0) ->
    {V1_quest_list, _B19} = protocol:array(_B0,
                                           fun (_B1) ->
                                                   {V2_id, _B2} =
                                                       protocol:uint32(_B1),
                                                   {V2_finish, _B3} =
                                                       protocol:uint8(_B2),
                                                   {V2_accept_time, _B4} =
                                                       protocol:uint32(_B3),
                                                   {V2_progress, _B17} =
                                                       protocol:array(_B4,
                                                                      fun
                                                                          (_B5) ->
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
                                                                                  protocol:uint32(_B8),
                                                                              {V3_value,
                                                                               _B10} =
                                                                                  protocol:uint32(_B9),
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
                                                   {{V2_id,
                                                     V2_finish,
                                                     V2_accept_time,
                                                     V2_progress},
                                                    _B17}
                                           end),
    {ok, {V1_quest_list}};
unpack(srv, 10204, _B0) -> {ok, {}};
unpack(cli, 10204, _B0) ->
    {V1_can_accept_quest_list, _B4} = protocol:array(_B0,
                                                     fun (_B1) ->
                                                             {V2_id, _B2} =
                                                                 protocol:uint32(_B1),
                                                             {{V2_id}, _B2}
                                                     end),
    {ok, {V1_can_accept_quest_list}};
unpack(srv, 10205, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10205, _B0) ->
    {V1_flag, _B1} = protocol:int8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_id}};
unpack(srv, 10206, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10206, _B0) ->
    {V1_flag, _B1} = protocol:int8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_id}};
unpack(srv, 10207, _B0) -> {ok, {}};
unpack(cli, 10207, _B0) ->
    {V1_can_accept_quest_list, _B4} = protocol:array(_B0,
                                                     fun (_B1) ->
                                                             {V2_id, _B2} =
                                                                 protocol:uint32(_B1),
                                                             {{V2_id}, _B2}
                                                     end),
    {ok, {V1_can_accept_quest_list}};
unpack(srv, 10208, _B0) -> {ok, {}};
unpack(cli, 10208, _B0) ->
    {V1_quest_list, _B4} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_id, _B2} =
                                                      protocol:uint32(_B1),
                                                  {{V2_id}, _B2}
                                          end),
    {ok, {V1_quest_list}};
unpack(srv, 10209, _B0) -> {ok, {}};
unpack(cli, 10209, _B0) ->
    {V1_quest_list, _B19} = protocol:array(_B0,
                                           fun (_B1) ->
                                                   {V2_id, _B2} =
                                                       protocol:uint32(_B1),
                                                   {V2_finish, _B3} =
                                                       protocol:uint8(_B2),
                                                   {V2_accept_time, _B4} =
                                                       protocol:uint32(_B3),
                                                   {V2_progress, _B17} =
                                                       protocol:array(_B4,
                                                                      fun
                                                                          (_B5) ->
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
                                                                                  protocol:uint32(_B8),
                                                                              {V3_value,
                                                                               _B10} =
                                                                                  protocol:uint32(_B9),
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
                                                   {{V2_id,
                                                     V2_finish,
                                                     V2_accept_time,
                                                     V2_progress},
                                                    _B17}
                                           end),
    {ok, {V1_quest_list}};
unpack(srv, 10210, _B0) -> {ok, {}};
unpack(cli, 10210, _B0) ->
    {V1_quest_rewards, _B9} = protocol:array(_B0,
                                             fun (_B1) ->
                                                     {V2_id, _B2} =
                                                         protocol:uint32(_B1),
                                                     {V2_rewards, _B7} =
                                                         protocol:array(_B2,
                                                                        fun
                                                                            (_B3) ->
                                                                                {V3_base_id,
                                                                                 _B4} =
                                                                                    protocol:uint32(_B3),
                                                                                {V3_num,
                                                                                 _B5} =
                                                                                    protocol:uint32(_B4),
                                                                                {{V3_base_id,
                                                                                  V3_num},
                                                                                 _B5}
                                                                        end),
                                                     {{V2_id, V2_rewards}, _B7}
                                             end),
    {ok, {V1_quest_rewards}};
unpack(srv, 10211, _B0) ->
    {V1_sec_type, _B1} = protocol:uint8(_B0),
    {V1_args, _B2} = protocol:uint32(_B1),
    {ok, {V1_sec_type, V1_args}};
unpack(cli, 10211, _B0) -> {ok, {}};
unpack(srv, 10212, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10212, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_state, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_state}};
unpack(srv, 10213, _B0) -> {ok, {}};
unpack(cli, 10213, _B0) ->
    {V1_part, _B1} = protocol:uint8(_B0),
    {V1_chapter, _B2} = protocol:uint8(_B1),
    {V1_section, _B3} = protocol:uint8(_B2),
    {ok, {V1_part, V1_chapter, V1_section}};
unpack(srv, 10214, _B0) -> {ok, {}};
unpack(cli, 10214, _B0) ->
    {V1_quest_stats, _B18} = protocol:array(_B0,
                                            fun (_B1) ->
                                                    {V2_sec_type, _B2} =
                                                        protocol:uint8(_B1),
                                                    {V2_stats, _B7} =
                                                        protocol:array(_B2,
                                                                       fun
                                                                           (_B3) ->
                                                                               {V3_key,
                                                                                _B4} =
                                                                                   protocol:uint8(_B3),
                                                                               {V3_value,
                                                                                _B5} =
                                                                                   protocol:uint32(_B4),
                                                                               {{V3_key,
                                                                                 V3_value},
                                                                                _B5}
                                                                       end),
                                                    {V2_desc, _B16} =
                                                        protocol:array(_B7,
                                                                       fun
                                                                           (_B8) ->
                                                                               {V3_prog_id,
                                                                                _B9} =
                                                                                   protocol:uint8(_B8),
                                                                               {V3_desc_array,
                                                                                _B14} =
                                                                                   protocol:array(_B9,
                                                                                                  fun
                                                                                                      (_B10) ->
                                                                                                          {V4_key,
                                                                                                           _B11} =
                                                                                                              protocol:uint8(_B10),
                                                                                                          {V4_string,
                                                                                                           _B12} =
                                                                                                              protocol:string(_B11),
                                                                                                          {{V4_key,
                                                                                                            V4_string},
                                                                                                           _B12}
                                                                                                  end),
                                                                               {{V3_prog_id,
                                                                                 V3_desc_array},
                                                                                _B14}
                                                                       end),
                                                    {{V2_sec_type,
                                                      V2_stats,
                                                      V2_desc},
                                                     _B16}
                                            end),
    {ok, {V1_quest_stats}};
unpack(srv, 10215, _B0) ->
    {V1_sec_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_sec_type}};
unpack(cli, 10215, _B0) ->
    {V1_day_finished, _B8} = protocol:array(_B0,
                                            fun (_B1) ->
                                                    {V2_sec_type, _B2} =
                                                        protocol:uint8(_B1),
                                                    {V2_quest_ids, _B6} =
                                                        protocol:array(_B2,
                                                                       fun
                                                                           (_B3) ->
                                                                               {V3_id,
                                                                                _B4} =
                                                                                   protocol:uint8(_B3),
                                                                               {{V3_id},
                                                                                _B4}
                                                                       end),
                                                    {{V2_sec_type,
                                                      V2_quest_ids},
                                                     _B6}
                                            end),
    {ok, {V1_day_finished}};
unpack(srv, 10216, _B0) ->
    {V1_assets_enum, _B1} = protocol:uint32(_B0),
    {ok, {V1_assets_enum}};
unpack(cli, 10216, _B0) -> {ok, {}};
unpack(srv, 10217, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_battle_id, V1_id}};
unpack(cli, 10217, _B0) -> {ok, {}};
unpack(srv, 10218, _B0) ->
    {V1_quest_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_quest_id}};
unpack(cli, 10218, _B0) -> {ok, {}};
unpack(srv, 10219, _B0) -> {ok, {}};
unpack(cli, 10219, _B0) ->
    {V1_achievement_list, _B15} = protocol:array(_B0,
                                                 fun (_B1) ->
                                                         {V2_id, _B2} =
                                                             protocol:uint32(_B1),
                                                         {V2_finish, _B3} =
                                                             protocol:uint8(_B2),
                                                         {V2_end_time, _B4} =
                                                             protocol:uint32(_B3),
                                                         {V2_finish_time, _B5} =
                                                             protocol:uint32(_B4),
                                                         {V2_progress, _B13} =
                                                             protocol:array(_B5,
                                                                            fun
                                                                                (_B6) ->
                                                                                    {V3_id,
                                                                                     _B7} =
                                                                                        protocol:int16(_B6),
                                                                                    {V3_finish,
                                                                                     _B8} =
                                                                                        protocol:uint8(_B7),
                                                                                    {V3_target,
                                                                                     _B9} =
                                                                                        protocol:uint32(_B8),
                                                                                    {V3_target_val,
                                                                                     _B10} =
                                                                                        protocol:uint32(_B9),
                                                                                    {V3_value,
                                                                                     _B11} =
                                                                                        protocol:uint32(_B10),
                                                                                    {{V3_id,
                                                                                      V3_finish,
                                                                                      V3_target,
                                                                                      V3_target_val,
                                                                                      V3_value},
                                                                                     _B11}
                                                                            end),
                                                         {{V2_id,
                                                           V2_finish,
                                                           V2_end_time,
                                                           V2_finish_time,
                                                           V2_progress},
                                                          _B13}
                                                 end),
    {ok, {V1_achievement_list}};
unpack(srv, 10220, _B0) -> {ok, {}};
unpack(cli, 10220, _B0) ->
    {V1_achievement_list, _B15} = protocol:array(_B0,
                                                 fun (_B1) ->
                                                         {V2_id, _B2} =
                                                             protocol:uint32(_B1),
                                                         {V2_finish, _B3} =
                                                             protocol:uint8(_B2),
                                                         {V2_end_time, _B4} =
                                                             protocol:uint32(_B3),
                                                         {V2_finish_time, _B5} =
                                                             protocol:uint32(_B4),
                                                         {V2_progress, _B13} =
                                                             protocol:array(_B5,
                                                                            fun
                                                                                (_B6) ->
                                                                                    {V3_id,
                                                                                     _B7} =
                                                                                        protocol:int16(_B6),
                                                                                    {V3_finish,
                                                                                     _B8} =
                                                                                        protocol:uint8(_B7),
                                                                                    {V3_target,
                                                                                     _B9} =
                                                                                        protocol:uint32(_B8),
                                                                                    {V3_target_val,
                                                                                     _B10} =
                                                                                        protocol:uint32(_B9),
                                                                                    {V3_value,
                                                                                     _B11} =
                                                                                        protocol:uint32(_B10),
                                                                                    {{V3_id,
                                                                                      V3_finish,
                                                                                      V3_target,
                                                                                      V3_target_val,
                                                                                      V3_value},
                                                                                     _B11}
                                                                            end),
                                                         {{V2_id,
                                                           V2_finish,
                                                           V2_end_time,
                                                           V2_finish_time,
                                                           V2_progress},
                                                          _B13}
                                                 end),
    {ok, {V1_achievement_list}};
unpack(srv, 10221, _B0) ->
    {V1_id_list, _B4} = protocol:array(_B0,
                                       fun (_B1) ->
                                               {V2_id, _B2} =
                                                   protocol:uint32(_B1),
                                               {{V2_id}, _B2}
                                       end),
    {ok, {V1_id_list}};
unpack(cli, 10221, _B0) ->
    {V1_flag, _B1} = protocol:int8(_B0),
    {ok, {V1_flag}};
unpack(srv, 10222, _B0) -> {ok, {}};
unpack(cli, 10222, _B0) ->
    {V1_num, _B1} = protocol:uint32(_B0),
    {V1_assets_num, _B2} = protocol:uint32(_B1),
    {ok, {V1_num, V1_assets_num}};
unpack(srv, 10223, _B0) ->
    {V1_quest_id, _B1} = protocol:uint32(_B0),
    {V1_talk_type, _B2} = protocol:uint8(_B1),
    {ok, {V1_quest_id, V1_talk_type}};
unpack(cli, 10223, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_quest_id, _B2} = protocol:uint32(_B1),
    {V1_talk_type, _B3} = protocol:uint8(_B2),
    {ok, {V1_op_code, V1_quest_id, V1_talk_type}};
unpack(srv, 10224, _B0) -> {ok, {}};
unpack(cli, 10224, _B0) ->
    {V1_phase, _B1} = protocol:uint8(_B0),
    {V1_unit_id, _B2} = protocol:uint32(_B1),
    {V1_last_commited, _B3} = protocol:uint32(_B2),
    {V1_map, _B4} = protocol:uint32(_B3),
    {V1_x, _B5} = protocol:uint32(_B4),
    {V1_y, _B6} = protocol:uint32(_B5),
    {ok,
     {V1_phase,
      V1_unit_id,
      V1_last_commited,
      V1_map,
      V1_x,
      V1_y}};
unpack(srv, 10225, _B0) -> {ok, {}};
unpack(cli, 10225, _B0) ->
    {V1_flag, _B1} = protocol:int8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10226, _B0) ->
    {V1_shop_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_shop_type}};
unpack(cli, 10226, _B0) ->
    {V1_shop_type, _B1} = protocol:uint8(_B0),
    {V1_goods_list, _B7} = protocol:array(_B1,
                                          fun (_B2) ->
                                                  {V2_id, _B3} =
                                                      protocol:uint16(_B2),
                                                  {V2_state, _B4} =
                                                      protocol:int8(_B3),
                                                  {V2_expire, _B5} =
                                                      protocol:int32(_B4),
                                                  {{V2_id, V2_state, V2_expire},
                                                   _B5}
                                          end),
    {ok, {V1_shop_type, V1_goods_list}};
unpack(srv, 10227, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0),
    {ok, {V1_id}};
unpack(cli, 10227, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10228, _B0) -> {ok, {}};
unpack(cli, 10228, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {ok, {V1_result}};
unpack(srv, 10229, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10229, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_accept, _B2} = protocol:uint32(_B1),
    {V1_finish, _B3} = protocol:uint32(_B2),
    {V1_total, _B4} = protocol:uint32(_B3),
    {ok, {V1_id, V1_accept, V1_finish, V1_total}};
unpack(srv, 10230, _B0) -> {ok, {}};
unpack(cli, 10230, _B0) ->
    {V1_achievement_log, _B6} = protocol:array(_B0,
                                               fun (_B1) ->
                                                       {V2_id, _B2} =
                                                           protocol:uint32(_B1),
                                                       {V2_accept, _B3} =
                                                           protocol:uint32(_B2),
                                                       {V2_finish, _B4} =
                                                           protocol:uint32(_B3),
                                                       {{V2_id,
                                                         V2_accept,
                                                         V2_finish},
                                                        _B4}
                                               end),
    {V1_total, _B7} = protocol:uint32(_B6),
    {ok, {V1_achievement_log, V1_total}};
unpack(srv, 10231, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10231, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_result, V1_id}};
unpack(srv, 10232, _B0) -> {ok, {}};
unpack(cli, 10232, _B0) ->
    {V1_list, _B4} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_id, _B2} = protocol:uint32(_B1),
                                            {{V2_id}, _B2}
                                    end),
    {ok, {V1_list}};
unpack(srv, 10233, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 10233, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_num, _B5} = protocol:uint32(_B4),
    {V1_assets_num, _B6} = protocol:uint32(_B5),
    {V1_list, _B11} = protocol:array(_B6,
                                     fun (_B7) ->
                                             {V2_type, _B8} =
                                                 protocol:uint32(_B7),
                                             {V2_finish, _B9} =
                                                 protocol:uint32(_B8),
                                             {{V2_type, V2_finish}, _B9}
                                     end),
    {ok,
     {V1_id,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_num,
      V1_assets_num,
      V1_list}};
unpack(srv, 10234, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10234, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_result, V1_id}};
unpack(srv, 10235, _B0) -> {ok, {}};
unpack(cli, 10235, _B0) ->
    {V1_goal_list, _B15} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_id, _B2} =
                                                      protocol:uint32(_B1),
                                                  {V2_finish, _B3} =
                                                      protocol:uint8(_B2),
                                                  {V2_end_time, _B4} =
                                                      protocol:uint32(_B3),
                                                  {V2_finish_time, _B5} =
                                                      protocol:uint32(_B4),
                                                  {V2_progress, _B13} =
                                                      protocol:array(_B5,
                                                                     fun
                                                                         (_B6) ->
                                                                             {V3_id,
                                                                              _B7} =
                                                                                 protocol:int16(_B6),
                                                                             {V3_finish,
                                                                              _B8} =
                                                                                 protocol:uint8(_B7),
                                                                             {V3_target,
                                                                              _B9} =
                                                                                 protocol:uint32(_B8),
                                                                             {V3_target_val,
                                                                              _B10} =
                                                                                 protocol:uint32(_B9),
                                                                             {V3_value,
                                                                              _B11} =
                                                                                 protocol:uint32(_B10),
                                                                             {{V3_id,
                                                                               V3_finish,
                                                                               V3_target,
                                                                               V3_target_val,
                                                                               V3_value},
                                                                              _B11}
                                                                     end),
                                                  {{V2_id,
                                                    V2_finish,
                                                    V2_end_time,
                                                    V2_finish_time,
                                                    V2_progress},
                                                   _B13}
                                          end),
    {ok, {V1_goal_list}};
unpack(srv, 10236, _B0) ->
    {V1_day, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_day, V1_id}};
unpack(cli, 10236, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10237, _B0) -> {ok, {}};
unpack(cli, 10237, _B0) ->
    {V1_day_reward, _B5} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_day, _B2} =
                                                      protocol:uint32(_B1),
                                                  {V2_quest_id, _B3} =
                                                      protocol:uint32(_B2),
                                                  {{V2_day, V2_quest_id}, _B3}
                                          end),
    {ok, {V1_day_reward}};
unpack(srv, 10238, _B0) -> {ok, {}};
unpack(cli, 10238, _B0) ->
    {V1_discount, _B5} = protocol:array(_B0,
                                        fun (_B1) ->
                                                {V2_discount_id, _B2} =
                                                    protocol:uint32(_B1),
                                                {V2_day, _B3} =
                                                    protocol:uint32(_B2),
                                                {{V2_discount_id, V2_day}, _B3}
                                        end),
    {ok, {V1_discount}};
unpack(srv, 10239, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10239, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10240, _B0) -> {ok, {}};
unpack(cli, 10240, _B0) ->
    {V1_day, _B1} = protocol:uint32(_B0),
    {ok, {V1_day}};
unpack(srv, 10241, _B0) ->
    {V1_count, _B1} = protocol:uint8(_B0),
    {ok, {V1_count}};
unpack(cli, 10241, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10242, _B0) -> {ok, {}};
unpack(cli, 10242, _B0) ->
    {V1_complete_list, _B4} = protocol:array(_B0,
                                             fun (_B1) ->
                                                     {V2_count, _B2} =
                                                         protocol:uint16(_B1),
                                                     {{V2_count}, _B2}
                                             end),
    {ok, {V1_complete_list}};
unpack(srv, 10243, _B0) -> {ok, {}};
unpack(cli, 10243, _B0) ->
    {V1_try_fill, _B1} = protocol:uint32(_B0),
    {V1_unit_id, _B2} = protocol:uint32(_B1),
    {V1_last_commited, _B3} = protocol:uint32(_B2),
    {V1_last_accepted, _B4} = protocol:uint32(_B3),
    {V1_round, _B5} = protocol:uint8(_B4),
    {ok,
     {V1_try_fill,
      V1_unit_id,
      V1_last_commited,
      V1_last_accepted,
      V1_round}};
unpack(srv, 10244, _B0) -> {ok, {}};
unpack(cli, 10244, _B0) ->
    {V1_flag, _B1} = protocol:int8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10245, _B0) -> {ok, {}};
unpack(cli, 10245, _B0) ->
    {V1_flag, _B1} = protocol:int8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10246, _B0) -> {ok, {}};
unpack(cli, 10246, _B0) ->
    {V1_flag, _B1} = protocol:int8(_B0),
    {V1_mode, _B2} = protocol:int8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_flag, V1_mode, V1_msg}};
unpack(srv, 10247, _B0) -> {ok, {}};
unpack(cli, 10247, _B0) ->
    {V1_last_commited, _B1} = protocol:uint32(_B0),
    {V1_last_accepted, _B2} = protocol:uint32(_B1),
    {V1_round, _B3} = protocol:uint8(_B2),
    {ok, {V1_last_commited, V1_last_accepted, V1_round}};
unpack(srv, 10248, _B0) -> {ok, {}};
unpack(cli, 10248, _B0) ->
    {V1_list, _B4} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_id, _B2} = protocol:uint32(_B1),
                                            {{V2_id}, _B2}
                                    end),
    {ok, {V1_list}};
unpack(srv, 10249, _B0) ->
    {V1_id, _B1} = protocol:int32(_B0),
    {ok, {V1_id}};
unpack(cli, 10249, _B0) ->
    {V1_flag, _B1} = protocol:int8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10250, _B0) -> {ok, {}};
unpack(cli, 10250, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {ok, {V1_id, V1_platform, V1_zone_id, V1_name}};
unpack(srv, 10251, _B0) -> {ok, {}};
unpack(cli, 10251, _B0) ->
    {V1_stage, _B1} = protocol:uint8(_B0),
    {V1_finish, _B7} = protocol:array(_B1,
                                      fun (_B2) ->
                                              {V2_envelop, _B3} =
                                                  protocol:uint8(_B2),
                                              {V2_quest_id, _B4} =
                                                  protocol:uint32(_B3),
                                              {V2_status, _B5} =
                                                  protocol:uint8(_B4),
                                              {{V2_envelop,
                                                V2_quest_id,
                                                V2_status},
                                               _B5}
                                      end),
    {V1_doing, _B12} = protocol:array(_B7,
                                      fun (_B8) ->
                                              {V2_envelop, _B9} =
                                                  protocol:uint8(_B8),
                                              {V2_quest_id, _B10} =
                                                  protocol:uint32(_B9),
                                              {{V2_envelop, V2_quest_id}, _B10}
                                      end),
    {V1_rf_times, _B13} = protocol:uint32(_B12),
    {ok, {V1_stage, V1_finish, V1_doing, V1_rf_times}};
unpack(srv, 10252, _B0) ->
    {V1_envelop, _B1} = protocol:uint8(_B0),
    {ok, {V1_envelop}};
unpack(cli, 10252, _B0) ->
    {V1_flag, _B1} = protocol:int8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10253, _B0) -> {ok, {}};
unpack(cli, 10253, _B0) ->
    {V1_finish, _B4} = protocol:array(_B0,
                                      fun (_B1) ->
                                              {V2_quest_id, _B2} =
                                                  protocol:uint32(_B1),
                                              {{V2_quest_id}, _B2}
                                      end),
    {V1_doing, _B8} = protocol:array(_B4,
                                     fun (_B5) ->
                                             {V2_quest_id, _B6} =
                                                 protocol:uint32(_B5),
                                             {{V2_quest_id}, _B6}
                                     end),
    {V1_score, _B9} = protocol:uint32(_B8),
    {V1_rewarded, _B14} = protocol:array(_B9,
                                         fun (_B10) ->
                                                 {V2_id, _B11} =
                                                     protocol:uint32(_B10),
                                                 {V2_times, _B12} =
                                                     protocol:uint8(_B11),
                                                 {{V2_id, V2_times}, _B12}
                                         end),
    {ok, {V1_finish, V1_doing, V1_score, V1_rewarded}};
unpack(srv, 10254, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10254, _B0) ->
    {V1_flag, _B1} = protocol:int8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10255, _B0) ->
    {V1_order, _B1} = protocol:uint8(_B0),
    {V1_times, _B2} = protocol:uint8(_B1),
    {ok, {V1_order, V1_times}};
unpack(cli, 10255, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10256, _B0) -> {ok, {}};
unpack(cli, 10256, _B0) ->
    {V1_times, _B1} = protocol:uint8(_B0),
    {V1_order, _B2} = protocol:uint8(_B1),
    {V1_gain_list, _B7} = protocol:array(_B2,
                                         fun (_B3) ->
                                                 {V2_item_id1, _B4} =
                                                     protocol:uint32(_B3),
                                                 {V2_num1, _B5} =
                                                     protocol:uint32(_B4),
                                                 {{V2_item_id1, V2_num1}, _B5}
                                         end),
    {ok, {V1_times, V1_order, V1_gain_list}};
unpack(srv, 10257, _B0) -> {ok, {}};
unpack(cli, 10257, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(srv, 10258, _B0) -> {ok, {}};
unpack(cli, 10258, _B0) -> {ok, {}};
unpack(srv, 10259, _B0) -> {ok, {}};
unpack(cli, 10259, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_val, _B2} = protocol:uint32(_B1),
    {V1_target_val, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_val, V1_target_val}};
unpack(srv, 10260, _B0) -> {ok, {}};
unpack(cli, 10260, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10261, _B0) -> {ok, {}};
unpack(cli, 10261, _B0) ->
    {V1_finish, _B4} = protocol:array(_B0,
                                      fun (_B1) ->
                                              {V2_quest_id, _B2} =
                                                  protocol:uint32(_B1),
                                              {{V2_quest_id}, _B2}
                                      end),
    {V1_doing, _B8} = protocol:array(_B4,
                                     fun (_B5) ->
                                             {V2_quest_id, _B6} =
                                                 protocol:uint32(_B5),
                                             {{V2_quest_id}, _B6}
                                     end),
    {ok, {V1_finish, V1_doing}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

