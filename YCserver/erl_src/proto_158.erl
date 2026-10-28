-file("src/proto/proto_158.erl", 1).

-module(proto_158).

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

-file("src/proto/proto_158.erl", 14).

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

-file("src/proto/proto_158.erl", 15).

-file("inc/teacher.hrl", 1).

-record(m_teacher,
        {id = {0, "", 0},
         ver = 2,
         name = "",
         status = 0,
         daily = [],
         daily_reward = 0,
         daily_time = 0,
         target = [],
         target_reward = [],
         target_rewarded = [],
         target_over = [],
         evaluation = [],
         study_lev = 0,
         mtime = 0,
         daily_goals = [],
         goals_times = 0}).

-record(teacher,
        {id = {0, "", 0},
         ver = 1,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         guild_id = {0, "", 0},
         guild_name = "",
         msg = "",
         teacher_score = 0,
         teacher_score_offline = 0,
         login_time = 0,
         fc = 0,
         students = []}).

-record(student,
        {id = {0, "", 0},
         ver = 2,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         status = 0,
         in_time = 0,
         out_time = 0,
         login_time = 0,
         guild_id = {0, "", 0},
         guild_name = "",
         daily = [],
         daily_time = 0,
         daily_reward = 0,
         quest_student_reward = 0,
         quest_teacher_reward = 0,
         encourage_time = 0,
         target = [],
         teacher_score = 0,
         fc = 0,
         target_reward = [],
         target_rewarded = []}).

-record(teacher_daily,
        {id = 1 :: pos_integer(),
         finish = 0 :: 0..2,
         progress = [] :: [tuple()]}).

-record(teacher_daily_data,
        {id = 1 :: pos_integer(),
         name = "" :: binary(),
         progress = [] :: [tuple()],
         reward = [],
         exp = 0}).

-record(teacher_target,
        {id = 1 :: pos_integer(),
         finish = 0 :: 0..2,
         progress = [] :: [tuple()]}).

-record(teacher_target_data,
        {id = 1 :: pos_integer(),
         name = "" :: binary(),
         progress = [] :: [tuple()],
         student_reward = [],
         teacher_reward = [],
         student_exp = 0,
         teacher_exp = 0}).

-record(teacher_sign,
        {id = {0, "", 0},
         ver = 1,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         online = 0,
         login_time = 0,
         logout_time = 0,
         online_time = 0,
         is_sign = 0,
         msg = ""}).

-record(teacher_quit_desc_data,
        {min = 0, max = 0, radio = 0, title = "", msg = ""}).

-record(teacher_student_sign_info,
        {id = {0, "", 0},
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         msg = ""}).

-file("src/proto/proto_158.erl", 16).

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

-file("src/proto/proto_158.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 15800,
     {V0_id, V0_platform, V0_zone_id, V0_str}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_str))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15800:16/little,
       D_a_t_a/binary>>};
pack(srv, 15800, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15800:16/little,
       D_a_t_a/binary>>};
pack(cli, 15801, {}) ->
    {ok, <<2:32/little, 15801:16/little>>};
pack(srv, 15801,
     {V0_type,
      {V0_id, V0_platform, V0_zone_id},
      V0_classes,
      V0_sex,
      V0_lev,
      V0_face,
      V0_fc,
      V0_name,
      V0_str}) ->
    D_a_t_a = <<V0_type:8/little, V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_classes:32/little,
                V0_sex:32/little, V0_lev:32/little, V0_face:32/little,
                V0_fc:32/little,
                (protocol:pack(string, V0_name))/binary,
                (protocol:pack(string, V0_str))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15801:16/little,
       D_a_t_a/binary>>};
pack(cli, 15802,
     {V0_id, V0_platform, V0_zone_id, V0_flag}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15802:16/little,
       D_a_t_a/binary>>};
pack(srv, 15802, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15802:16/little,
       D_a_t_a/binary>>};
pack(cli, 15804, {}) ->
    {ok, <<2:32/little, 15804:16/little>>};
pack(srv, 15804,
     {{V0_rid, V0_platform, V0_zone_id},
      V0_name,
      V0_status,
      V0_evaluation,
      V0_study_lev,
      V0_mtime}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_name))/binary,
                V0_status:32/little, (length(V0_evaluation)):16/little,
                (list_to_binary([<<V1_lev:32/little>>
                                 || V1_lev <- V0_evaluation]))/binary,
                V0_study_lev:32/little, V0_mtime:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15804:16/little,
       D_a_t_a/binary>>};
pack(cli, 15805, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15805:16/little,
       D_a_t_a/binary>>};
pack(srv, 15805,
     {{V0_tar_rid, V0_tar_platform, V0_tar_zone_id},
      {V0_rid, V0_platform, V0_zone_id},
      V0_name,
      V0_sex,
      V0_classes,
      V0_lev,
      V0_fc,
      V0_list,
      V0_daily_reward}) ->
    D_a_t_a = <<V0_tar_rid:32/little,
                (protocol:pack(string, V0_tar_platform))/binary,
                V0_tar_zone_id:32/little, V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_name))/binary,
                V0_sex:32/little, V0_classes:32/little,
                V0_lev:32/little, V0_fc:32/little,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_finish:32/little,
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
                                                           <- V1_progress]))/binary>>
                                 || #teacher_daily{id = V1_id,
                                                   finish = V1_finish,
                                                   progress = V1_progress}
                                        <- V0_list]))/binary,
                V0_daily_reward:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15805:16/little,
       D_a_t_a/binary>>};
pack(cli, 15806, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15806:16/little,
       D_a_t_a/binary>>};
pack(srv, 15806,
     {{V0_tar_rid, V0_tar_platform, V0_tar_zone_id},
      {V0_rid, V0_platform, V0_zone_id},
      V0_name,
      V0_sex,
      V0_classes,
      V0_lev,
      V0_fc,
      V0_list,
      V0_target_reward,
      V0_target_rewarded}) ->
    D_a_t_a = <<V0_tar_rid:32/little,
                (protocol:pack(string, V0_tar_platform))/binary,
                V0_tar_zone_id:32/little, V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_name))/binary,
                V0_sex:32/little, V0_classes:32/little,
                V0_lev:32/little, V0_fc:32/little,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_finish:32/little,
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
                                                           <- V1_progress]))/binary>>
                                 || #teacher_target{id = V1_id,
                                                    finish = V1_finish,
                                                    progress = V1_progress}
                                        <- V0_list]))/binary,
                (length(V0_target_reward)):16/little,
                (list_to_binary([<<V1_id:32/little>>
                                 || V1_id <- V0_target_reward]))/binary,
                (length(V0_target_rewarded)):16/little,
                (list_to_binary([<<V1_id:32/little>>
                                 || V1_id <- V0_target_rewarded]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15806:16/little,
       D_a_t_a/binary>>};
pack(cli, 15807, {}) ->
    {ok, <<2:32/little, 15807:16/little>>};
pack(srv, 15807,
     {{V0_t_id, V0_t_platform, V0_t_zone_id},
      V0_t_name,
      V0_t_sex,
      V0_t_classes,
      V0_t_lev,
      {V0_t_g_id, V0_t_g_platform, V0_t_g_zone_id},
      V0_t_g_name,
      V0_msg,
      V0_teacher_score,
      V0_login_time,
      V0_list}) ->
    D_a_t_a = <<V0_t_id:32/little,
                (protocol:pack(string, V0_t_platform))/binary,
                V0_t_zone_id:32/little,
                (protocol:pack(string, V0_t_name))/binary,
                V0_t_sex:32/little, V0_t_classes:32/little,
                V0_t_lev:32/little, V0_t_g_id:32/little,
                (protocol:pack(string, V0_t_g_platform))/binary,
                V0_t_g_zone_id:32/little,
                (protocol:pack(string, V0_t_g_name))/binary,
                (protocol:pack(string, V0_msg))/binary,
                V0_teacher_score:32/little, V0_login_time:32/little,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:32/little, V1_classes:32/little,
                                   V1_lev:32/little, V1_status:32/little,
                                   V1_in_time:32/little, V1_out_time:32/little,
                                   V1_login_time:32/little, V1_g_id:32/little,
                                   (protocol:pack(string,
                                                  V1_g_platform))/binary,
                                   V1_g_zone_id:32/little,
                                   (protocol:pack(string,
                                                  V1_guild_name))/binary,
                                   V1_encourage_time:32/little, V1_fc:32/little,
                                   V1_teacher_score:32/little>>
                                 || #student{id =
                                                 {V1_rid,
                                                  V1_platform,
                                                  V1_zone_id},
                                             name = V1_name, sex = V1_sex,
                                             classes = V1_classes, lev = V1_lev,
                                             status = V1_status,
                                             in_time = V1_in_time,
                                             out_time = V1_out_time,
                                             login_time = V1_login_time,
                                             guild_id =
                                                 {V1_g_id,
                                                  V1_g_platform,
                                                  V1_g_zone_id},
                                             guild_name = V1_guild_name,
                                             encourage_time = V1_encourage_time,
                                             fc = V1_fc,
                                             teacher_score = V1_teacher_score}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15807:16/little,
       D_a_t_a/binary>>};
pack(cli, 15808, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15808:16/little,
       D_a_t_a/binary>>};
pack(srv, 15808,
     {{V0_r_id, V0_r_platform, V0_r_zone_id},
      V0_t_name,
      V0_flag,
      V0_encourage_time}) ->
    D_a_t_a = <<V0_r_id:32/little,
                (protocol:pack(string, V0_r_platform))/binary,
                V0_r_zone_id:32/little,
                (protocol:pack(string, V0_t_name))/binary,
                V0_flag:8/little, V0_encourage_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15808:16/little,
       D_a_t_a/binary>>};
pack(cli, 15809, {V0_type, V0_id}) ->
    D_a_t_a = <<V0_type:32/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15809:16/little,
       D_a_t_a/binary>>};
pack(srv, 15809, {V0_type, V0_id, V0_flag}) ->
    D_a_t_a = <<V0_type:32/little, V0_id:32/little,
                V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15809:16/little,
       D_a_t_a/binary>>};
pack(cli, 15810, {V0_lev, V0_type}) ->
    D_a_t_a = <<V0_lev:32/little, V0_type:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15810:16/little,
       D_a_t_a/binary>>};
pack(srv, 15810,
     {{V0_rid, V0_platform, V0_zone_id},
      V0_name,
      V0_lev,
      V0_type,
      V0_flag}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_name))/binary,
                V0_lev:32/little, V0_type:32/little, V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15810:16/little,
       D_a_t_a/binary>>};
pack(cli, 15811,
     {V0_id, V0_platform, V0_zone_id, V0_type}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15811:16/little,
       D_a_t_a/binary>>};
pack(srv, 15811,
     {V0_flag, V0_self_type, V0_type, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little, V0_self_type:8/little,
                V0_type:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15811:16/little,
       D_a_t_a/binary>>};
pack(cli, 15812, {V0_type}) ->
    D_a_t_a = <<V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15812:16/little,
       D_a_t_a/binary>>};
pack(srv, 15812,
     {V0_type,
      V0_self_type,
      V0_msg,
      {V0_id, V0_platform, V0_zone_id},
      V0_name}) ->
    D_a_t_a = <<V0_type:8/little, V0_self_type:8/little,
                (protocol:pack(string, V0_msg))/binary, V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15812:16/little,
       D_a_t_a/binary>>};
pack(cli, 15813, {V0_msg}) ->
    D_a_t_a = <<(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15813:16/little,
       D_a_t_a/binary>>};
pack(srv, 15813, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15813:16/little,
       D_a_t_a/binary>>};
pack(cli, 15814, {V0_msg}) ->
    D_a_t_a = <<(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15814:16/little,
       D_a_t_a/binary>>};
pack(srv, 15814, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15814:16/little,
       D_a_t_a/binary>>};
pack(cli, 15815, {}) ->
    {ok, <<2:32/little, 15815:16/little>>};
pack(srv, 15815, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15815:16/little,
       D_a_t_a/binary>>};
pack(cli, 15816, {V0_sex, V0_classes}) ->
    D_a_t_a = <<V0_sex:8/little, V0_classes:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15816:16/little,
       D_a_t_a/binary>>};
pack(srv, 15816, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:32/little, V1_classes:32/little,
                                   V1_lev:32/little>>
                                 || #teacher_sign{id =
                                                      {V1_rid,
                                                       V1_platform,
                                                       V1_zone_id},
                                                  name = V1_name, sex = V1_sex,
                                                  classes = V1_classes,
                                                  lev = V1_lev}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15816:16/little,
       D_a_t_a/binary>>};
pack(cli, 15817,
     {V0_id, V0_platform, V0_zone_id, V0_op_type}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_op_type:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15817:16/little,
       D_a_t_a/binary>>};
pack(srv, 15817,
     {V0_type,
      V0_op_type,
      V0_flag,
      {V0_id, V0_platform, V0_zone_id},
      V0_name}) ->
    D_a_t_a = <<V0_type:32/little, V0_op_type:32/little,
                V0_flag:8/little, V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15817:16/little,
       D_a_t_a/binary>>};
pack(cli, 15818,
     {V0_id, V0_platform, V0_zone_id, V0_target_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_target_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15818:16/little,
       D_a_t_a/binary>>};
pack(srv, 15818, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15818:16/little,
       D_a_t_a/binary>>};
pack(cli, 15819, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15819:16/little,
       D_a_t_a/binary>>};
pack(srv, 15819,
     {{V0_id, V0_platform, V0_zone_id},
      V0_name,
      V0_sex,
      V0_classes,
      V0_lev}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_name))/binary,
                V0_sex:32/little, V0_classes:32/little,
                V0_lev:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15819:16/little,
       D_a_t_a/binary>>};
pack(cli, 15820, {}) ->
    {ok, <<2:32/little, 15820:16/little>>};
pack(srv, 15820, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little, V1_flag:32/little>>
                                 || {{V1_rid, V1_platform, V1_zone_id}, V1_flag}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15820:16/little,
       D_a_t_a/binary>>};
pack(cli, 15821, {}) ->
    {ok, <<2:32/little, 15821:16/little>>};
pack(srv, 15821,
     {V0_flag,
      {V0_id, V0_platform, V0_zone_id},
      V0_name,
      V0_score,
      V0_list}) ->
    D_a_t_a = <<V0_flag:8/little, V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_name))/binary,
                V0_score:32/little, (length(V0_list)):16/little,
                (list_to_binary([<<V1_item_id:32/little,
                                   V1_bind:32/little, V1_num:32/little>>
                                 || {V1_item_id, V1_bind, V1_num}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15821:16/little,
       D_a_t_a/binary>>};
pack(cli, 15822, {}) ->
    {ok, <<2:32/little, 15822:16/little>>};
pack(srv, 15822, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:32/little, V1_classes:32/little,
                                   V1_lev:32/little,
                                   (protocol:pack(string, V1_msg))/binary>>
                                 || #teacher_sign{id =
                                                      {V1_rid,
                                                       V1_platform,
                                                       V1_zone_id},
                                                  name = V1_name, sex = V1_sex,
                                                  classes = V1_classes,
                                                  lev = V1_lev, msg = V1_msg}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15822:16/little,
       D_a_t_a/binary>>};
pack(cli, 15823, {}) ->
    {ok, <<2:32/little, 15823:16/little>>};
pack(srv, 15823, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:32/little, V1_classes:32/little,
                                   V1_lev:32/little,
                                   (protocol:pack(string, V1_msg))/binary>>
                                 || #teacher_student_sign_info{id =
                                                                   {V1_rid,
                                                                    V1_platform,
                                                                    V1_zone_id},
                                                               name = V1_name,
                                                               sex = V1_sex,
                                                               classes =
                                                                   V1_classes,
                                                               lev = V1_lev,
                                                               msg = V1_msg}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15823:16/little,
       D_a_t_a/binary>>};
pack(cli, 15824, {}) ->
    {ok, <<2:32/little, 15824:16/little>>};
pack(srv, 15824, {V0_num, V0_max_num}) ->
    D_a_t_a = <<V0_num:32/little, V0_max_num:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15824:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 15800, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_str, _B4} = protocol:string(_B3),
    {ok, {V1_id, V1_platform, V1_zone_id, V1_str}};
unpack(cli, 15800, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(srv, 15801, _B0) -> {ok, {}};
unpack(cli, 15801, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_platform, _B3} = protocol:string(_B2),
    {V1_zone_id, _B4} = protocol:uint32(_B3),
    {V1_classes, _B5} = protocol:uint32(_B4),
    {V1_sex, _B6} = protocol:uint32(_B5),
    {V1_lev, _B7} = protocol:uint32(_B6),
    {V1_face, _B8} = protocol:uint32(_B7),
    {V1_fc, _B9} = protocol:uint32(_B8),
    {V1_name, _B10} = protocol:string(_B9),
    {V1_str, _B11} = protocol:string(_B10),
    {ok,
     {V1_type,
      V1_id,
      V1_platform,
      V1_zone_id,
      V1_classes,
      V1_sex,
      V1_lev,
      V1_face,
      V1_fc,
      V1_name,
      V1_str}};
unpack(srv, 15802, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_flag, _B4} = protocol:uint8(_B3),
    {ok, {V1_id, V1_platform, V1_zone_id, V1_flag}};
unpack(cli, 15802, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(srv, 15804, _B0) -> {ok, {}};
unpack(cli, 15804, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_status, _B5} = protocol:uint32(_B4),
    {V1_evaluation, _B9} = protocol:array(_B5,
                                          fun (_B6) ->
                                                  {V2_lev, _B7} =
                                                      protocol:uint32(_B6),
                                                  {{V2_lev}, _B7}
                                          end),
    {V1_study_lev, _B10} = protocol:uint32(_B9),
    {V1_mtime, _B11} = protocol:uint32(_B10),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_status,
      V1_evaluation,
      V1_study_lev,
      V1_mtime}};
unpack(srv, 15805, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 15805, _B0) ->
    {V1_tar_rid, _B1} = protocol:uint32(_B0),
    {V1_tar_platform, _B2} = protocol:string(_B1),
    {V1_tar_zone_id, _B3} = protocol:uint32(_B2),
    {V1_rid, _B4} = protocol:uint32(_B3),
    {V1_platform, _B5} = protocol:string(_B4),
    {V1_zone_id, _B6} = protocol:uint32(_B5),
    {V1_name, _B7} = protocol:string(_B6),
    {V1_sex, _B8} = protocol:uint32(_B7),
    {V1_classes, _B9} = protocol:uint32(_B8),
    {V1_lev, _B10} = protocol:uint32(_B9),
    {V1_fc, _B11} = protocol:uint32(_B10),
    {V1_list, _B29} = protocol:array(_B11,
                                     fun (_B12) ->
                                             {V2_id, _B13} =
                                                 protocol:uint32(_B12),
                                             {V2_finish, _B14} =
                                                 protocol:uint32(_B13),
                                             {V2_progress, _B27} =
                                                 protocol:array(_B14,
                                                                fun (_B15) ->
                                                                        {V3_id,
                                                                         _B16} =
                                                                            protocol:int16(_B15),
                                                                        {V3_finish,
                                                                         _B17} =
                                                                            protocol:uint8(_B16),
                                                                        {V3_target,
                                                                         _B18} =
                                                                            protocol:uint32(_B17),
                                                                        {V3_target_val,
                                                                         _B19} =
                                                                            protocol:uint16(_B18),
                                                                        {V3_value,
                                                                         _B20} =
                                                                            protocol:uint16(_B19),
                                                                        {V3_ext_data,
                                                                         _B25} =
                                                                            protocol:array(_B20,
                                                                                           fun
                                                                                               (_B21) ->
                                                                                                   {V4_key,
                                                                                                    _B22} =
                                                                                                       protocol:uint8(_B21),
                                                                                                   {V4_value,
                                                                                                    _B23} =
                                                                                                       protocol:uint32(_B22),
                                                                                                   {{V4_key,
                                                                                                     V4_value},
                                                                                                    _B23}
                                                                                           end),
                                                                        {{V3_id,
                                                                          V3_finish,
                                                                          V3_target,
                                                                          V3_target_val,
                                                                          V3_value,
                                                                          V3_ext_data},
                                                                         _B25}
                                                                end),
                                             {{V2_id, V2_finish, V2_progress},
                                              _B27}
                                     end),
    {V1_daily_reward, _B30} = protocol:uint32(_B29),
    {ok,
     {V1_tar_rid,
      V1_tar_platform,
      V1_tar_zone_id,
      V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_sex,
      V1_classes,
      V1_lev,
      V1_fc,
      V1_list,
      V1_daily_reward}};
unpack(srv, 15806, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 15806, _B0) ->
    {V1_tar_rid, _B1} = protocol:uint32(_B0),
    {V1_tar_platform, _B2} = protocol:string(_B1),
    {V1_tar_zone_id, _B3} = protocol:uint32(_B2),
    {V1_rid, _B4} = protocol:uint32(_B3),
    {V1_platform, _B5} = protocol:string(_B4),
    {V1_zone_id, _B6} = protocol:uint32(_B5),
    {V1_name, _B7} = protocol:string(_B6),
    {V1_sex, _B8} = protocol:uint32(_B7),
    {V1_classes, _B9} = protocol:uint32(_B8),
    {V1_lev, _B10} = protocol:uint32(_B9),
    {V1_fc, _B11} = protocol:uint32(_B10),
    {V1_list, _B29} = protocol:array(_B11,
                                     fun (_B12) ->
                                             {V2_id, _B13} =
                                                 protocol:uint32(_B12),
                                             {V2_finish, _B14} =
                                                 protocol:uint32(_B13),
                                             {V2_progress, _B27} =
                                                 protocol:array(_B14,
                                                                fun (_B15) ->
                                                                        {V3_id,
                                                                         _B16} =
                                                                            protocol:int16(_B15),
                                                                        {V3_finish,
                                                                         _B17} =
                                                                            protocol:uint8(_B16),
                                                                        {V3_target,
                                                                         _B18} =
                                                                            protocol:uint32(_B17),
                                                                        {V3_target_val,
                                                                         _B19} =
                                                                            protocol:uint16(_B18),
                                                                        {V3_value,
                                                                         _B20} =
                                                                            protocol:uint16(_B19),
                                                                        {V3_ext_data,
                                                                         _B25} =
                                                                            protocol:array(_B20,
                                                                                           fun
                                                                                               (_B21) ->
                                                                                                   {V4_key,
                                                                                                    _B22} =
                                                                                                       protocol:uint8(_B21),
                                                                                                   {V4_value,
                                                                                                    _B23} =
                                                                                                       protocol:uint32(_B22),
                                                                                                   {{V4_key,
                                                                                                     V4_value},
                                                                                                    _B23}
                                                                                           end),
                                                                        {{V3_id,
                                                                          V3_finish,
                                                                          V3_target,
                                                                          V3_target_val,
                                                                          V3_value,
                                                                          V3_ext_data},
                                                                         _B25}
                                                                end),
                                             {{V2_id, V2_finish, V2_progress},
                                              _B27}
                                     end),
    {V1_target_reward, _B33} = protocol:array(_B29,
                                              fun (_B30) ->
                                                      {V2_id, _B31} =
                                                          protocol:uint32(_B30),
                                                      {{V2_id}, _B31}
                                              end),
    {V1_target_rewarded, _B37} = protocol:array(_B33,
                                                fun (_B34) ->
                                                        {V2_id, _B35} =
                                                            protocol:uint32(_B34),
                                                        {{V2_id}, _B35}
                                                end),
    {ok,
     {V1_tar_rid,
      V1_tar_platform,
      V1_tar_zone_id,
      V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_sex,
      V1_classes,
      V1_lev,
      V1_fc,
      V1_list,
      V1_target_reward,
      V1_target_rewarded}};
unpack(srv, 15807, _B0) -> {ok, {}};
unpack(cli, 15807, _B0) ->
    {V1_t_id, _B1} = protocol:uint32(_B0),
    {V1_t_platform, _B2} = protocol:string(_B1),
    {V1_t_zone_id, _B3} = protocol:uint32(_B2),
    {V1_t_name, _B4} = protocol:string(_B3),
    {V1_t_sex, _B5} = protocol:uint32(_B4),
    {V1_t_classes, _B6} = protocol:uint32(_B5),
    {V1_t_lev, _B7} = protocol:uint32(_B6),
    {V1_t_g_id, _B8} = protocol:uint32(_B7),
    {V1_t_g_platform, _B9} = protocol:string(_B8),
    {V1_t_g_zone_id, _B10} = protocol:uint32(_B9),
    {V1_t_g_name, _B11} = protocol:string(_B10),
    {V1_msg, _B12} = protocol:string(_B11),
    {V1_teacher_score, _B13} = protocol:uint32(_B12),
    {V1_login_time, _B14} = protocol:uint32(_B13),
    {V1_list, _B35} = protocol:array(_B14,
                                     fun (_B15) ->
                                             {V2_rid, _B16} =
                                                 protocol:uint32(_B15),
                                             {V2_platform, _B17} =
                                                 protocol:string(_B16),
                                             {V2_zone_id, _B18} =
                                                 protocol:uint32(_B17),
                                             {V2_name, _B19} =
                                                 protocol:string(_B18),
                                             {V2_sex, _B20} =
                                                 protocol:uint32(_B19),
                                             {V2_classes, _B21} =
                                                 protocol:uint32(_B20),
                                             {V2_lev, _B22} =
                                                 protocol:uint32(_B21),
                                             {V2_status, _B23} =
                                                 protocol:uint32(_B22),
                                             {V2_in_time, _B24} =
                                                 protocol:uint32(_B23),
                                             {V2_out_time, _B25} =
                                                 protocol:uint32(_B24),
                                             {V2_login_time, _B26} =
                                                 protocol:uint32(_B25),
                                             {V2_g_id, _B27} =
                                                 protocol:uint32(_B26),
                                             {V2_g_platform, _B28} =
                                                 protocol:string(_B27),
                                             {V2_g_zone_id, _B29} =
                                                 protocol:uint32(_B28),
                                             {V2_guild_name, _B30} =
                                                 protocol:string(_B29),
                                             {V2_encourage_time, _B31} =
                                                 protocol:uint32(_B30),
                                             {V2_fc, _B32} =
                                                 protocol:uint32(_B31),
                                             {V2_teacher_score, _B33} =
                                                 protocol:uint32(_B32),
                                             {{V2_rid,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_name,
                                               V2_sex,
                                               V2_classes,
                                               V2_lev,
                                               V2_status,
                                               V2_in_time,
                                               V2_out_time,
                                               V2_login_time,
                                               V2_g_id,
                                               V2_g_platform,
                                               V2_g_zone_id,
                                               V2_guild_name,
                                               V2_encourage_time,
                                               V2_fc,
                                               V2_teacher_score},
                                              _B33}
                                     end),
    {ok,
     {V1_t_id,
      V1_t_platform,
      V1_t_zone_id,
      V1_t_name,
      V1_t_sex,
      V1_t_classes,
      V1_t_lev,
      V1_t_g_id,
      V1_t_g_platform,
      V1_t_g_zone_id,
      V1_t_g_name,
      V1_msg,
      V1_teacher_score,
      V1_login_time,
      V1_list}};
unpack(srv, 15808, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 15808, _B0) ->
    {V1_r_id, _B1} = protocol:uint32(_B0),
    {V1_r_platform, _B2} = protocol:string(_B1),
    {V1_r_zone_id, _B3} = protocol:uint32(_B2),
    {V1_t_name, _B4} = protocol:string(_B3),
    {V1_flag, _B5} = protocol:uint8(_B4),
    {V1_encourage_time, _B6} = protocol:uint32(_B5),
    {ok,
     {V1_r_id,
      V1_r_platform,
      V1_r_zone_id,
      V1_t_name,
      V1_flag,
      V1_encourage_time}};
unpack(srv, 15809, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_type, V1_id}};
unpack(cli, 15809, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_flag, _B3} = protocol:uint8(_B2),
    {ok, {V1_type, V1_id, V1_flag}};
unpack(srv, 15810, _B0) ->
    {V1_lev, _B1} = protocol:uint32(_B0),
    {V1_type, _B2} = protocol:uint32(_B1),
    {ok, {V1_lev, V1_type}};
unpack(cli, 15810, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_lev, _B5} = protocol:uint32(_B4),
    {V1_type, _B6} = protocol:uint32(_B5),
    {V1_flag, _B7} = protocol:uint8(_B6),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_lev,
      V1_type,
      V1_flag}};
unpack(srv, 15811, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_type, _B4} = protocol:uint8(_B3),
    {ok, {V1_id, V1_platform, V1_zone_id, V1_type}};
unpack(cli, 15811, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_self_type, _B2} = protocol:uint8(_B1),
    {V1_type, _B3} = protocol:uint8(_B2),
    {V1_msg, _B4} = protocol:string(_B3),
    {ok, {V1_flag, V1_self_type, V1_type, V1_msg}};
unpack(srv, 15812, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_type}};
unpack(cli, 15812, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_self_type, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {V1_id, _B4} = protocol:uint32(_B3),
    {V1_platform, _B5} = protocol:string(_B4),
    {V1_zone_id, _B6} = protocol:uint32(_B5),
    {V1_name, _B7} = protocol:string(_B6),
    {ok,
     {V1_type,
      V1_self_type,
      V1_msg,
      V1_id,
      V1_platform,
      V1_zone_id,
      V1_name}};
unpack(srv, 15813, _B0) ->
    {V1_msg, _B1} = protocol:string(_B0),
    {ok, {V1_msg}};
unpack(cli, 15813, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(srv, 15814, _B0) ->
    {V1_msg, _B1} = protocol:string(_B0),
    {ok, {V1_msg}};
unpack(cli, 15814, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(srv, 15815, _B0) -> {ok, {}};
unpack(cli, 15815, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(srv, 15816, _B0) ->
    {V1_sex, _B1} = protocol:uint8(_B0),
    {V1_classes, _B2} = protocol:uint8(_B1),
    {ok, {V1_sex, V1_classes}};
unpack(cli, 15816, _B0) ->
    {V1_list, _B10} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_rid, _B2} =
                                                 protocol:uint32(_B1),
                                             {V2_platform, _B3} =
                                                 protocol:string(_B2),
                                             {V2_zone_id, _B4} =
                                                 protocol:uint32(_B3),
                                             {V2_name, _B5} =
                                                 protocol:string(_B4),
                                             {V2_sex, _B6} =
                                                 protocol:uint32(_B5),
                                             {V2_classes, _B7} =
                                                 protocol:uint32(_B6),
                                             {V2_lev, _B8} =
                                                 protocol:uint32(_B7),
                                             {{V2_rid,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_name,
                                               V2_sex,
                                               V2_classes,
                                               V2_lev},
                                              _B8}
                                     end),
    {ok, {V1_list}};
unpack(srv, 15817, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_op_type, _B4} = protocol:uint32(_B3),
    {ok, {V1_id, V1_platform, V1_zone_id, V1_op_type}};
unpack(cli, 15817, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_op_type, _B2} = protocol:uint32(_B1),
    {V1_flag, _B3} = protocol:uint8(_B2),
    {V1_id, _B4} = protocol:uint32(_B3),
    {V1_platform, _B5} = protocol:string(_B4),
    {V1_zone_id, _B6} = protocol:uint32(_B5),
    {V1_name, _B7} = protocol:string(_B6),
    {ok,
     {V1_type,
      V1_op_type,
      V1_flag,
      V1_id,
      V1_platform,
      V1_zone_id,
      V1_name}};
unpack(srv, 15818, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_target_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_id, V1_platform, V1_zone_id, V1_target_id}};
unpack(cli, 15818, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(srv, 15819, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 15819, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_sex, _B5} = protocol:uint32(_B4),
    {V1_classes, _B6} = protocol:uint32(_B5),
    {V1_lev, _B7} = protocol:uint32(_B6),
    {ok,
     {V1_id,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_sex,
      V1_classes,
      V1_lev}};
unpack(srv, 15820, _B0) -> {ok, {}};
unpack(cli, 15820, _B0) ->
    {V1_list, _B7} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_rid, _B2} =
                                                protocol:uint32(_B1),
                                            {V2_platform, _B3} =
                                                protocol:string(_B2),
                                            {V2_zone_id, _B4} =
                                                protocol:uint32(_B3),
                                            {V2_flag, _B5} =
                                                protocol:uint32(_B4),
                                            {{V2_rid,
                                              V2_platform,
                                              V2_zone_id,
                                              V2_flag},
                                             _B5}
                                    end),
    {ok, {V1_list}};
unpack(srv, 15821, _B0) -> {ok, {}};
unpack(cli, 15821, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_platform, _B3} = protocol:string(_B2),
    {V1_zone_id, _B4} = protocol:uint32(_B3),
    {V1_name, _B5} = protocol:string(_B4),
    {V1_score, _B6} = protocol:uint32(_B5),
    {V1_list, _B12} = protocol:array(_B6,
                                     fun (_B7) ->
                                             {V2_item_id, _B8} =
                                                 protocol:uint32(_B7),
                                             {V2_bind, _B9} =
                                                 protocol:uint32(_B8),
                                             {V2_num, _B10} =
                                                 protocol:uint32(_B9),
                                             {{V2_item_id, V2_bind, V2_num},
                                              _B10}
                                     end),
    {ok,
     {V1_flag,
      V1_id,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_score,
      V1_list}};
unpack(srv, 15822, _B0) -> {ok, {}};
unpack(cli, 15822, _B0) ->
    {V1_list, _B11} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_rid, _B2} =
                                                 protocol:uint32(_B1),
                                             {V2_platform, _B3} =
                                                 protocol:string(_B2),
                                             {V2_zone_id, _B4} =
                                                 protocol:uint32(_B3),
                                             {V2_name, _B5} =
                                                 protocol:string(_B4),
                                             {V2_sex, _B6} =
                                                 protocol:uint32(_B5),
                                             {V2_classes, _B7} =
                                                 protocol:uint32(_B6),
                                             {V2_lev, _B8} =
                                                 protocol:uint32(_B7),
                                             {V2_msg, _B9} =
                                                 protocol:string(_B8),
                                             {{V2_rid,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_name,
                                               V2_sex,
                                               V2_classes,
                                               V2_lev,
                                               V2_msg},
                                              _B9}
                                     end),
    {ok, {V1_list}};
unpack(srv, 15823, _B0) -> {ok, {}};
unpack(cli, 15823, _B0) ->
    {V1_list, _B11} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_rid, _B2} =
                                                 protocol:uint32(_B1),
                                             {V2_platform, _B3} =
                                                 protocol:string(_B2),
                                             {V2_zone_id, _B4} =
                                                 protocol:uint32(_B3),
                                             {V2_name, _B5} =
                                                 protocol:string(_B4),
                                             {V2_sex, _B6} =
                                                 protocol:uint32(_B5),
                                             {V2_classes, _B7} =
                                                 protocol:uint32(_B6),
                                             {V2_lev, _B8} =
                                                 protocol:uint32(_B7),
                                             {V2_msg, _B9} =
                                                 protocol:string(_B8),
                                             {{V2_rid,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_name,
                                               V2_sex,
                                               V2_classes,
                                               V2_lev,
                                               V2_msg},
                                              _B9}
                                     end),
    {ok, {V1_list}};
unpack(srv, 15824, _B0) -> {ok, {}};
unpack(cli, 15824, _B0) ->
    {V1_num, _B1} = protocol:uint32(_B0),
    {V1_max_num, _B2} = protocol:uint32(_B1),
    {ok, {V1_num, V1_max_num}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

