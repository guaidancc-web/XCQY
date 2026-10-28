-file("src/proto/proto_170.erl", 1).

-module(proto_170).

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

-file("src/proto/proto_170.erl", 14).

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

-file("src/proto/proto_170.erl", 15).

-file("inc/mount.hrl", 1).

-record(mount_goal,
        {ver = 1 :: non_neg_integer(),
         finish = [] :: list(),
         doing = [] :: list(),
         day_reward = [] :: list()}).

-record(m_mount,
        {ver = 10 :: pos_integer(),
         mounts = [] :: list(),
         mount_goal = #mount_goal{},
         next_mount_id = 1 :: non_neg_integer(),
         ride_mount = 0,
         appearance_list = [],
         combat_active_times = [],
         dye_list = [],
         dye_diff_list = [],
         pre_mount_status = 0 :: non_neg_integer(),
         evolution_list = [],
         double_ride_role = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         is_driver = 0}).

-record(mount,
        {ver = 4 :: pos_integer(),
         index = 0 :: non_neg_integer(),
         mount_base_id = 0 :: non_neg_integer(),
         transformation_id = 0 :: non_neg_integer(),
         lev = 1 :: pos_integer(),
         skill_point = 1 :: pos_integer(),
         fail_times = 0 :: non_neg_integer(),
         upgrade_lev = 0 :: non_neg_integer(),
         live_status = 0,
         skill_list = [],
         fight_times = 0 :: non_neg_integer(),
         spirit = 0 :: non_neg_integer(),
         growth = 1 :: pos_integer(),
         growth_item_num = 0 :: non_neg_integer(),
         speed_lev = 1 :: pos_integer(),
         manger_pets = [],
         tmp_growth = 1 :: pos_integer(),
         tmp_skill_list = [],
         decorate_list = [],
         score = 0,
         expire_time = 0}).

-record(mount_skill,
        {skill_index = 1 :: pos_integer(),
         skill_id = 1 :: non_neg_integer(),
         skill_lev = 0 :: non_neg_integer()}).

-record(mount_decorate,
        {decorate_index = 1 :: pos_integer(),
         decorate_base_id = 0 :: non_neg_integer(),
         is_hide = 0 :: non_neg_integer()}).

-record(mount_dye,
        {trans_id = 0, dye_id = 0, cache_dye_list = []}).

-record(mount_evolution,
        {trans_id = 0, evolution_id = 0}).

-file("src/proto/proto_170.erl", 16).

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

-file("src/proto/proto_170.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 17000, {}) ->
    {ok, <<2:32/little, 17000:16/little>>};
pack(srv, 17000,
     {V0_ride_mount,
      V0_mount_list,
      V0_appearance_list,
      V0_pre_egg,
      V0_egg,
      V0_combat_active_times,
      V0_dye_list,
      V0_evolution_list}) ->
    D_a_t_a = <<V0_ride_mount:32/signed-little,
                (length(V0_mount_list)):16/little,
                (list_to_binary([<<V1_index:8/little,
                                   V1_mount_base_id:32/little,
                                   V1_transformation_id:32/little,
                                   V1_lev:32/little, V1_skill_point:32/little,
                                   V1_fail_times:32/little,
                                   V1_upgrade_lev:32/little,
                                   V1_live_status:8/little,
                                   (length(V1_skill_list)):16/little,
                                   (list_to_binary([<<V2_skill_index:8/little,
                                                      V2_skill_id:32/little,
                                                      V2_skill_lev:32/little>>
                                                    || #mount_skill{skill_index
                                                                        =
                                                                        V2_skill_index,
                                                                    skill_id =
                                                                        V2_skill_id,
                                                                    skill_lev =
                                                                        V2_skill_lev}
                                                           <- V1_skill_list]))/binary,
                                   V1_spirit:32/little,
                                   V1_fight_times:32/little,
                                   V1_growth:32/little,
                                   V1_growth_item_num:32/little,
                                   V1_speed_lev:32/little,
                                   (length(V1_manger_pets)):16/little,
                                   (list_to_binary([<<V2_pet_id:32/little>>
                                                    || V2_pet_id
                                                           <- V1_manger_pets]))/binary,
                                   (length(V1_decorate_list)):16/little,
                                   (list_to_binary([<<V2_decorate_index:8/little,
                                                      V2_decorate_base_id:32/little,
                                                      V2_is_hide:8/little>>
                                                    || #mount_decorate{decorate_index
                                                                           =
                                                                           V2_decorate_index,
                                                                       decorate_base_id
                                                                           =
                                                                           V2_decorate_base_id,
                                                                       is_hide =
                                                                           V2_is_hide}
                                                           <- V1_decorate_list]))/binary,
                                   V1_tmp_growth:32/little,
                                   (length(V1_tmp_skill_list)):16/little,
                                   (list_to_binary([<<V2_skill_index:8/little,
                                                      V2_skill_id:32/little>>
                                                    || {V2_skill_index,
                                                        V2_skill_id}
                                                           <- V1_tmp_skill_list]))/binary,
                                   V1_score:32/little>>
                                 || #mount{index = V1_index,
                                           mount_base_id = V1_mount_base_id,
                                           transformation_id =
                                               V1_transformation_id,
                                           lev = V1_lev,
                                           skill_point = V1_skill_point,
                                           fail_times = V1_fail_times,
                                           upgrade_lev = V1_upgrade_lev,
                                           live_status = V1_live_status,
                                           skill_list = V1_skill_list,
                                           spirit = V1_spirit,
                                           fight_times = V1_fight_times,
                                           growth = V1_growth,
                                           growth_item_num = V1_growth_item_num,
                                           speed_lev = V1_speed_lev,
                                           manger_pets = V1_manger_pets,
                                           decorate_list = V1_decorate_list,
                                           tmp_growth = V1_tmp_growth,
                                           tmp_skill_list = V1_tmp_skill_list,
                                           score = V1_score}
                                        <- V0_mount_list]))/binary,
                (length(V0_appearance_list)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_expire_time:32/little>>
                                 || {V1_base_id, V1_expire_time}
                                        <- V0_appearance_list]))/binary,
                V0_pre_egg:8/little, V0_egg:8/little,
                (length(V0_combat_active_times)):16/little,
                (list_to_binary([<<V1_combat_type:32/little,
                                   V1_fighter_times:32/little>>
                                 || {V1_combat_type, V1_fighter_times}
                                        <- V0_combat_active_times]))/binary,
                (length(V0_dye_list)):16/little,
                (list_to_binary([<<V1_trans_id:32/little,
                                   V1_dye_id:32/little,
                                   (length(V1_cache_dye_list)):16/little,
                                   (list_to_binary([<<V2_dye_id:32/little>>
                                                    || V2_dye_id
                                                           <- V1_cache_dye_list]))/binary>>
                                 || #mount_dye{trans_id = V1_trans_id,
                                               dye_id = V1_dye_id,
                                               cache_dye_list =
                                                   V1_cache_dye_list}
                                        <- V0_dye_list]))/binary,
                (length(V0_evolution_list)):16/little,
                (list_to_binary([<<V1_trans_id:32/little,
                                   V1_evolution_id:32/little>>
                                 || #mount_evolution{trans_id = V1_trans_id,
                                                     evolution_id =
                                                         V1_evolution_id}
                                        <- V0_evolution_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17000:16/little,
       D_a_t_a/binary>>};
pack(cli, 17001, {V0_index}) ->
    D_a_t_a = <<V0_index:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17001:16/little,
       D_a_t_a/binary>>};
pack(srv, 17001, {V0_errc_ode, V0_msg}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17001:16/little,
       D_a_t_a/binary>>};
pack(cli, 17002, {V0_index}) ->
    D_a_t_a = <<V0_index:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17002:16/little,
       D_a_t_a/binary>>};
pack(srv, 17002, {V0_errc_ode, V0_msg}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17002:16/little,
       D_a_t_a/binary>>};
pack(cli, 17003, {V0_index}) ->
    D_a_t_a = <<V0_index:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17003:16/little,
       D_a_t_a/binary>>};
pack(srv, 17003, {V0_errc_ode, V0_msg}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17003:16/little,
       D_a_t_a/binary>>};
pack(cli, 17004, {V0_index}) ->
    D_a_t_a = <<V0_index:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17004:16/little,
       D_a_t_a/binary>>};
pack(srv, 17004, {V0_errc_ode, V0_msg}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17004:16/little,
       D_a_t_a/binary>>};
pack(cli, 17005, {V0_index, V0_skill_index}) ->
    D_a_t_a = <<V0_index:8/little,
                V0_skill_index:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17005:16/little,
       D_a_t_a/binary>>};
pack(srv, 17005, {V0_errc_ode, V0_msg}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17005:16/little,
       D_a_t_a/binary>>};
pack(cli, 17006, {V0_index, V0_is_sure_success}) ->
    D_a_t_a = <<V0_index:8/little,
                V0_is_sure_success:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17006:16/little,
       D_a_t_a/binary>>};
pack(srv, 17006,
     {V0_errc_ode, V0_is_success, V0_msg}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                V0_is_success:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17006:16/little,
       D_a_t_a/binary>>};
pack(cli, 17007, {V0_index, V0_pet_id}) ->
    D_a_t_a = <<V0_index:8/little, V0_pet_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17007:16/little,
       D_a_t_a/binary>>};
pack(srv, 17007, {V0_errc_ode, V0_msg}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17007:16/little,
       D_a_t_a/binary>>};
pack(cli, 17008, {}) ->
    {ok, <<2:32/little, 17008:16/little>>};
pack(srv, 17008, {V0_goal_list}) ->
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
     <<(byte_size(D_a_t_a) + 2):32/little, 17008:16/little,
       D_a_t_a/binary>>};
pack(cli, 17009, {}) ->
    {ok, <<2:32/little, 17009:16/little>>};
pack(srv, 17009, {V0_errc_ode, V0_msg}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17009:16/little,
       D_a_t_a/binary>>};
pack(cli, 17010, {}) ->
    {ok, <<2:32/little, 17010:16/little>>};
pack(srv, 17010,
     {V0_errc_ode, V0_msg, V0_mount_base_id}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_mount_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17010:16/little,
       D_a_t_a/binary>>};
pack(cli, 17011, {V0_index}) ->
    D_a_t_a = <<V0_index:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17011:16/little,
       D_a_t_a/binary>>};
pack(srv, 17011,
     {V0_errc_ode, V0_msg, V0_skill_list}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary,
                (length(V0_skill_list)):16/little,
                (list_to_binary([<<V1_skill_index:8/little,
                                   V1_skill_id:32/little,
                                   V1_skill_lev:32/little>>
                                 || #mount_skill{skill_index = V1_skill_index,
                                                 skill_id = V1_skill_id,
                                                 skill_lev = V1_skill_lev}
                                        <- V0_skill_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17011:16/little,
       D_a_t_a/binary>>};
pack(cli, 17012, {V0_index}) ->
    D_a_t_a = <<V0_index:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17012:16/little,
       D_a_t_a/binary>>};
pack(srv, 17012,
     {#mount{index = V0_index,
             mount_base_id = V0_mount_base_id,
             transformation_id = V0_transformation_id, lev = V0_lev,
             skill_point = V0_skill_point,
             fail_times = V0_fail_times,
             upgrade_lev = V0_upgrade_lev,
             live_status = V0_live_status,
             skill_list = V0_skill_list, spirit = V0_spirit,
             fight_times = V0_fight_times, growth = V0_growth,
             growth_item_num = V0_growth_item_num,
             speed_lev = V0_speed_lev, manger_pets = V0_manger_pets,
             decorate_list = V0_decorate_list,
             tmp_growth = V0_tmp_growth,
             tmp_skill_list = V0_tmp_skill_list,
             score = V0_score}}) ->
    D_a_t_a = <<V0_index:8/little,
                V0_mount_base_id:32/little,
                V0_transformation_id:32/little, V0_lev:32/little,
                V0_skill_point:32/little, V0_fail_times:32/little,
                V0_upgrade_lev:32/little, V0_live_status:8/little,
                (length(V0_skill_list)):16/little,
                (list_to_binary([<<V1_skill_index:8/little,
                                   V1_skill_id:32/little,
                                   V1_skill_lev:32/little>>
                                 || #mount_skill{skill_index = V1_skill_index,
                                                 skill_id = V1_skill_id,
                                                 skill_lev = V1_skill_lev}
                                        <- V0_skill_list]))/binary,
                V0_spirit:32/little, V0_fight_times:32/little,
                V0_growth:32/little, V0_growth_item_num:32/little,
                V0_speed_lev:32/little,
                (length(V0_manger_pets)):16/little,
                (list_to_binary([<<V1_pet_id:32/little>>
                                 || V1_pet_id <- V0_manger_pets]))/binary,
                (length(V0_decorate_list)):16/little,
                (list_to_binary([<<V1_decorate_index:8/little,
                                   V1_decorate_base_id:32/little,
                                   V1_is_hide:8/little>>
                                 || #mount_decorate{decorate_index =
                                                        V1_decorate_index,
                                                    decorate_base_id =
                                                        V1_decorate_base_id,
                                                    is_hide = V1_is_hide}
                                        <- V0_decorate_list]))/binary,
                V0_tmp_growth:32/little,
                (length(V0_tmp_skill_list)):16/little,
                (list_to_binary([<<V1_skill_index:8/little,
                                   V1_skill_id:32/little>>
                                 || {V1_skill_index, V1_skill_id}
                                        <- V0_tmp_skill_list]))/binary,
                V0_score:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17012:16/little,
       D_a_t_a/binary>>};
pack(cli, 17013,
     {V0_index, V0_skill_index, V0_skill_Id}) ->
    D_a_t_a = <<V0_index:8/little, V0_skill_index:8/little,
                V0_skill_Id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17013:16/little,
       D_a_t_a/binary>>};
pack(srv, 17013, {V0_errc_ode, V0_msg}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17013:16/little,
       D_a_t_a/binary>>};
pack(cli, 17014, {V0_index, V0_pet_id}) ->
    D_a_t_a = <<V0_index:8/little, V0_pet_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17014:16/little,
       D_a_t_a/binary>>};
pack(srv, 17014, {V0_errc_ode, V0_msg}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17014:16/little,
       D_a_t_a/binary>>};
pack(cli, 17015, {V0_index, V0_appearance_id}) ->
    D_a_t_a = <<V0_index:8/little,
                V0_appearance_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17015:16/little,
       D_a_t_a/binary>>};
pack(srv, 17015, {V0_errc_ode, V0_msg}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17015:16/little,
       D_a_t_a/binary>>};
pack(cli, 17016, {V0_index, V0_skill_index}) ->
    D_a_t_a = <<V0_index:8/little,
                V0_skill_index:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17016:16/little,
       D_a_t_a/binary>>};
pack(srv, 17016, {V0_errc_ode, V0_msg}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17016:16/little,
       D_a_t_a/binary>>};
pack(cli, 17017, {V0_index, V0_decorate_index}) ->
    D_a_t_a = <<V0_index:32/little,
                V0_decorate_index:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17017:16/little,
       D_a_t_a/binary>>};
pack(srv, 17017, {V0_errc_ode, V0_msg}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17017:16/little,
       D_a_t_a/binary>>};
pack(cli, 17018, {V0_index, V0_skill_index}) ->
    D_a_t_a = <<V0_index:32/little,
                V0_skill_index:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17018:16/little,
       D_a_t_a/binary>>};
pack(srv, 17018, {V0_errc_ode, V0_msg}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17018:16/little,
       D_a_t_a/binary>>};
pack(cli, 17019, {V0_appearance_id}) ->
    D_a_t_a = <<V0_appearance_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17019:16/little,
       D_a_t_a/binary>>};
pack(srv, 17019,
     {V0_errc_ode, V0_msg, V0_appearance_id}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_appearance_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17019:16/little,
       D_a_t_a/binary>>};
pack(cli, 17020,
     {V0_index, V0_decorate_index, V0_is_hide}) ->
    D_a_t_a = <<V0_index:32/little,
                V0_decorate_index:8/little, V0_is_hide:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17020:16/little,
       D_a_t_a/binary>>};
pack(srv, 17020, {V0_errc_ode, V0_msg}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17020:16/little,
       D_a_t_a/binary>>};
pack(cli, 17021, {}) ->
    {ok, <<2:32/little, 17021:16/little>>};
pack(srv, 17021, {V0_base_id, V0_expire_time}) ->
    D_a_t_a = <<V0_base_id:32/little,
                V0_expire_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17021:16/little,
       D_a_t_a/binary>>};
pack(cli, 17022, {V0_base_id}) ->
    D_a_t_a = <<V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17022:16/little,
       D_a_t_a/binary>>};
pack(srv, 17022,
     {V0_errc_ode, V0_msg, V0_base_id, V0_cache_dye_list}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_base_id:32/little,
                (length(V0_cache_dye_list)):16/little,
                (list_to_binary([<<V1_dye_id:32/little>>
                                 || V1_dye_id <- V0_cache_dye_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17022:16/little,
       D_a_t_a/binary>>};
pack(cli, 17023, {V0_base_id, V0_dye_id, V0_index}) ->
    D_a_t_a = <<V0_base_id:32/little, V0_dye_id:32/little,
                V0_index:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17023:16/little,
       D_a_t_a/binary>>};
pack(srv, 17023, {V0_errc_ode, V0_msg}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17023:16/little,
       D_a_t_a/binary>>};
pack(cli, 17024, {V0_base_id}) ->
    D_a_t_a = <<V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17024:16/little,
       D_a_t_a/binary>>};
pack(srv, 17024, {V0_errc_ode, V0_msg}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17024:16/little,
       D_a_t_a/binary>>};
pack(cli, 17025, {V0_base_id}) ->
    D_a_t_a = <<V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17025:16/little,
       D_a_t_a/binary>>};
pack(srv, 17025, {V0_errc_ode, V0_msg}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17025:16/little,
       D_a_t_a/binary>>};
pack(cli, 17026, {V0_key_id}) ->
    D_a_t_a = <<V0_key_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17026:16/little,
       D_a_t_a/binary>>};
pack(srv, 17026, {V0_errc_ode, V0_base_id, V0_msg}) ->
    D_a_t_a = <<V0_errc_ode:8/little, V0_base_id:32/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17026:16/little,
       D_a_t_a/binary>>};
pack(cli, 17027, {V0_key_id}) ->
    D_a_t_a = <<V0_key_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17027:16/little,
       D_a_t_a/binary>>};
pack(srv, 17027, {V0_errc_ode, V0_base_id, V0_msg}) ->
    D_a_t_a = <<V0_errc_ode:8/little, V0_base_id:32/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17027:16/little,
       D_a_t_a/binary>>};
pack(cli, 17028, {}) ->
    {ok, <<2:32/little, 17028:16/little>>};
pack(srv, 17028,
     {V0_errc_ode, V0_base_id, V0_remain_time}) ->
    D_a_t_a = <<V0_errc_ode:8/little, V0_base_id:32/little,
                V0_remain_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17028:16/little,
       D_a_t_a/binary>>};
pack(cli, 17029, {V0_base_id}) ->
    D_a_t_a = <<V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17029:16/little,
       D_a_t_a/binary>>};
pack(srv, 17029, {V0_errc_ode, V0_msg, V0_base_id}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17029:16/little,
       D_a_t_a/binary>>};
pack(cli, 17030, {V0_base_id}) ->
    D_a_t_a = <<V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17030:16/little,
       D_a_t_a/binary>>};
pack(srv, 17030, {V0_errc_ode, V0_msg, V0_base_id}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17030:16/little,
       D_a_t_a/binary>>};
pack(cli, 17031, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17031:16/little,
       D_a_t_a/binary>>};
pack(srv, 17031, {V0_errc_ode, V0_msg}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17031:16/little,
       D_a_t_a/binary>>};
pack(cli, 17032, {}) ->
    {ok, <<2:32/little, 17032:16/little>>};
pack(srv, 17032,
     {V0_id, V0_platform, V0_zone_id, V0_name, V0_lev}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_lev:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17032:16/little,
       D_a_t_a/binary>>};
pack(cli, 17033, {}) ->
    {ok, <<2:32/little, 17033:16/little>>};
pack(srv, 17033, {V0_flag, V0_name, V0_lev}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_name))/binary,
                V0_lev:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17033:16/little,
       D_a_t_a/binary>>};
pack(cli, 17034,
     {V0_flag, V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_flag:8/little, V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17034:16/little,
       D_a_t_a/binary>>};
pack(srv, 17034, {V0_errc_ode, V0_msg}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17034:16/little,
       D_a_t_a/binary>>};
pack(cli, 17035, {}) ->
    {ok, <<2:32/little, 17035:16/little>>};
pack(srv, 17035, {V0_errc_ode, V0_msg}) ->
    D_a_t_a = <<V0_errc_ode:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17035:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 17000, _B0) -> {ok, {}};
unpack(cli, 17000, _B0) ->
    {V1_ride_mount, _B1} = protocol:int32(_B0),
    {V1_mount_list, _B40} = protocol:array(_B1,
                                           fun (_B2) ->
                                                   {V2_index, _B3} =
                                                       protocol:uint8(_B2),
                                                   {V2_mount_base_id, _B4} =
                                                       protocol:uint32(_B3),
                                                   {V2_transformation_id, _B5} =
                                                       protocol:uint32(_B4),
                                                   {V2_lev, _B6} =
                                                       protocol:uint32(_B5),
                                                   {V2_skill_point, _B7} =
                                                       protocol:uint32(_B6),
                                                   {V2_fail_times, _B8} =
                                                       protocol:uint32(_B7),
                                                   {V2_upgrade_lev, _B9} =
                                                       protocol:uint32(_B8),
                                                   {V2_live_status, _B10} =
                                                       protocol:uint8(_B9),
                                                   {V2_skill_list, _B16} =
                                                       protocol:array(_B10,
                                                                      fun
                                                                          (_B11) ->
                                                                              {V3_skill_index,
                                                                               _B12} =
                                                                                  protocol:uint8(_B11),
                                                                              {V3_skill_id,
                                                                               _B13} =
                                                                                  protocol:uint32(_B12),
                                                                              {V3_skill_lev,
                                                                               _B14} =
                                                                                  protocol:uint32(_B13),
                                                                              {{V3_skill_index,
                                                                                V3_skill_id,
                                                                                V3_skill_lev},
                                                                               _B14}
                                                                      end),
                                                   {V2_spirit, _B17} =
                                                       protocol:uint32(_B16),
                                                   {V2_fight_times, _B18} =
                                                       protocol:uint32(_B17),
                                                   {V2_growth, _B19} =
                                                       protocol:uint32(_B18),
                                                   {V2_growth_item_num, _B20} =
                                                       protocol:uint32(_B19),
                                                   {V2_speed_lev, _B21} =
                                                       protocol:uint32(_B20),
                                                   {V2_manger_pets, _B25} =
                                                       protocol:array(_B21,
                                                                      fun
                                                                          (_B22) ->
                                                                              {V3_pet_id,
                                                                               _B23} =
                                                                                  protocol:uint32(_B22),
                                                                              {{V3_pet_id},
                                                                               _B23}
                                                                      end),
                                                   {V2_decorate_list, _B31} =
                                                       protocol:array(_B25,
                                                                      fun
                                                                          (_B26) ->
                                                                              {V3_decorate_index,
                                                                               _B27} =
                                                                                  protocol:uint8(_B26),
                                                                              {V3_decorate_base_id,
                                                                               _B28} =
                                                                                  protocol:uint32(_B27),
                                                                              {V3_is_hide,
                                                                               _B29} =
                                                                                  protocol:uint8(_B28),
                                                                              {{V3_decorate_index,
                                                                                V3_decorate_base_id,
                                                                                V3_is_hide},
                                                                               _B29}
                                                                      end),
                                                   {V2_tmp_growth, _B32} =
                                                       protocol:uint32(_B31),
                                                   {V2_tmp_skill_list, _B37} =
                                                       protocol:array(_B32,
                                                                      fun
                                                                          (_B33) ->
                                                                              {V3_skill_index,
                                                                               _B34} =
                                                                                  protocol:uint8(_B33),
                                                                              {V3_skill_id,
                                                                               _B35} =
                                                                                  protocol:uint32(_B34),
                                                                              {{V3_skill_index,
                                                                                V3_skill_id},
                                                                               _B35}
                                                                      end),
                                                   {V2_score, _B38} =
                                                       protocol:uint32(_B37),
                                                   {{V2_index,
                                                     V2_mount_base_id,
                                                     V2_transformation_id,
                                                     V2_lev,
                                                     V2_skill_point,
                                                     V2_fail_times,
                                                     V2_upgrade_lev,
                                                     V2_live_status,
                                                     V2_skill_list,
                                                     V2_spirit,
                                                     V2_fight_times,
                                                     V2_growth,
                                                     V2_growth_item_num,
                                                     V2_speed_lev,
                                                     V2_manger_pets,
                                                     V2_decorate_list,
                                                     V2_tmp_growth,
                                                     V2_tmp_skill_list,
                                                     V2_score},
                                                    _B38}
                                           end),
    {V1_appearance_list, _B45} = protocol:array(_B40,
                                                fun (_B41) ->
                                                        {V2_base_id, _B42} =
                                                            protocol:uint32(_B41),
                                                        {V2_expire_time, _B43} =
                                                            protocol:uint32(_B42),
                                                        {{V2_base_id,
                                                          V2_expire_time},
                                                         _B43}
                                                end),
    {V1_pre_egg, _B46} = protocol:uint8(_B45),
    {V1_egg, _B47} = protocol:uint8(_B46),
    {V1_combat_active_times, _B52} = protocol:array(_B47,
                                                    fun (_B48) ->
                                                            {V2_combat_type,
                                                             _B49} =
                                                                protocol:uint32(_B48),
                                                            {V2_fighter_times,
                                                             _B50} =
                                                                protocol:uint32(_B49),
                                                            {{V2_combat_type,
                                                              V2_fighter_times},
                                                             _B50}
                                                    end),
    {V1_dye_list, _B61} = protocol:array(_B52,
                                         fun (_B53) ->
                                                 {V2_trans_id, _B54} =
                                                     protocol:uint32(_B53),
                                                 {V2_dye_id, _B55} =
                                                     protocol:uint32(_B54),
                                                 {V2_cache_dye_list, _B59} =
                                                     protocol:array(_B55,
                                                                    fun
                                                                        (_B56) ->
                                                                            {V3_dye_id,
                                                                             _B57} =
                                                                                protocol:uint32(_B56),
                                                                            {{V3_dye_id},
                                                                             _B57}
                                                                    end),
                                                 {{V2_trans_id,
                                                   V2_dye_id,
                                                   V2_cache_dye_list},
                                                  _B59}
                                         end),
    {V1_evolution_list, _B66} = protocol:array(_B61,
                                               fun (_B62) ->
                                                       {V2_trans_id, _B63} =
                                                           protocol:uint32(_B62),
                                                       {V2_evolution_id, _B64} =
                                                           protocol:uint32(_B63),
                                                       {{V2_trans_id,
                                                         V2_evolution_id},
                                                        _B64}
                                               end),
    {ok,
     {V1_ride_mount,
      V1_mount_list,
      V1_appearance_list,
      V1_pre_egg,
      V1_egg,
      V1_combat_active_times,
      V1_dye_list,
      V1_evolution_list}};
unpack(srv, 17001, _B0) ->
    {V1_index, _B1} = protocol:uint8(_B0),
    {ok, {V1_index}};
unpack(cli, 17001, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_errc_ode, V1_msg}};
unpack(srv, 17002, _B0) ->
    {V1_index, _B1} = protocol:uint8(_B0),
    {ok, {V1_index}};
unpack(cli, 17002, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_errc_ode, V1_msg}};
unpack(srv, 17003, _B0) ->
    {V1_index, _B1} = protocol:uint32(_B0),
    {ok, {V1_index}};
unpack(cli, 17003, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_errc_ode, V1_msg}};
unpack(srv, 17004, _B0) ->
    {V1_index, _B1} = protocol:uint8(_B0),
    {ok, {V1_index}};
unpack(cli, 17004, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_errc_ode, V1_msg}};
unpack(srv, 17005, _B0) ->
    {V1_index, _B1} = protocol:uint8(_B0),
    {V1_skill_index, _B2} = protocol:uint8(_B1),
    {ok, {V1_index, V1_skill_index}};
unpack(cli, 17005, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_errc_ode, V1_msg}};
unpack(srv, 17006, _B0) ->
    {V1_index, _B1} = protocol:uint8(_B0),
    {V1_is_sure_success, _B2} = protocol:uint8(_B1),
    {ok, {V1_index, V1_is_sure_success}};
unpack(cli, 17006, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_is_success, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_errc_ode, V1_is_success, V1_msg}};
unpack(srv, 17007, _B0) ->
    {V1_index, _B1} = protocol:uint8(_B0),
    {V1_pet_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_index, V1_pet_id}};
unpack(cli, 17007, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_errc_ode, V1_msg}};
unpack(srv, 17008, _B0) -> {ok, {}};
unpack(cli, 17008, _B0) ->
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
unpack(srv, 17009, _B0) -> {ok, {}};
unpack(cli, 17009, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_errc_ode, V1_msg}};
unpack(srv, 17010, _B0) -> {ok, {}};
unpack(cli, 17010, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_mount_base_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_errc_ode, V1_msg, V1_mount_base_id}};
unpack(srv, 17011, _B0) ->
    {V1_index, _B1} = protocol:uint8(_B0),
    {ok, {V1_index}};
unpack(cli, 17011, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_skill_list, _B8} = protocol:array(_B2,
                                          fun (_B3) ->
                                                  {V2_skill_index, _B4} =
                                                      protocol:uint8(_B3),
                                                  {V2_skill_id, _B5} =
                                                      protocol:uint32(_B4),
                                                  {V2_skill_lev, _B6} =
                                                      protocol:uint32(_B5),
                                                  {{V2_skill_index,
                                                    V2_skill_id,
                                                    V2_skill_lev},
                                                   _B6}
                                          end),
    {ok, {V1_errc_ode, V1_msg, V1_skill_list}};
unpack(srv, 17012, _B0) ->
    {V1_index, _B1} = protocol:uint8(_B0),
    {ok, {V1_index}};
unpack(cli, 17012, _B0) ->
    {V1_index, _B1} = protocol:uint8(_B0),
    {V1_mount_base_id, _B2} = protocol:uint32(_B1),
    {V1_transformation_id, _B3} = protocol:uint32(_B2),
    {V1_lev, _B4} = protocol:uint32(_B3),
    {V1_skill_point, _B5} = protocol:uint32(_B4),
    {V1_fail_times, _B6} = protocol:uint32(_B5),
    {V1_upgrade_lev, _B7} = protocol:uint32(_B6),
    {V1_live_status, _B8} = protocol:uint8(_B7),
    {V1_skill_list, _B14} = protocol:array(_B8,
                                           fun (_B9) ->
                                                   {V2_skill_index, _B10} =
                                                       protocol:uint8(_B9),
                                                   {V2_skill_id, _B11} =
                                                       protocol:uint32(_B10),
                                                   {V2_skill_lev, _B12} =
                                                       protocol:uint32(_B11),
                                                   {{V2_skill_index,
                                                     V2_skill_id,
                                                     V2_skill_lev},
                                                    _B12}
                                           end),
    {V1_spirit, _B15} = protocol:uint32(_B14),
    {V1_fight_times, _B16} = protocol:uint32(_B15),
    {V1_growth, _B17} = protocol:uint32(_B16),
    {V1_growth_item_num, _B18} = protocol:uint32(_B17),
    {V1_speed_lev, _B19} = protocol:uint32(_B18),
    {V1_manger_pets, _B23} = protocol:array(_B19,
                                            fun (_B20) ->
                                                    {V2_pet_id, _B21} =
                                                        protocol:uint32(_B20),
                                                    {{V2_pet_id}, _B21}
                                            end),
    {V1_decorate_list, _B29} = protocol:array(_B23,
                                              fun (_B24) ->
                                                      {V2_decorate_index,
                                                       _B25} =
                                                          protocol:uint8(_B24),
                                                      {V2_decorate_base_id,
                                                       _B26} =
                                                          protocol:uint32(_B25),
                                                      {V2_is_hide, _B27} =
                                                          protocol:uint8(_B26),
                                                      {{V2_decorate_index,
                                                        V2_decorate_base_id,
                                                        V2_is_hide},
                                                       _B27}
                                              end),
    {V1_tmp_growth, _B30} = protocol:uint32(_B29),
    {V1_tmp_skill_list, _B35} = protocol:array(_B30,
                                               fun (_B31) ->
                                                       {V2_skill_index, _B32} =
                                                           protocol:uint8(_B31),
                                                       {V2_skill_id, _B33} =
                                                           protocol:uint32(_B32),
                                                       {{V2_skill_index,
                                                         V2_skill_id},
                                                        _B33}
                                               end),
    {V1_score, _B36} = protocol:uint32(_B35),
    {ok,
     {V1_index,
      V1_mount_base_id,
      V1_transformation_id,
      V1_lev,
      V1_skill_point,
      V1_fail_times,
      V1_upgrade_lev,
      V1_live_status,
      V1_skill_list,
      V1_spirit,
      V1_fight_times,
      V1_growth,
      V1_growth_item_num,
      V1_speed_lev,
      V1_manger_pets,
      V1_decorate_list,
      V1_tmp_growth,
      V1_tmp_skill_list,
      V1_score}};
unpack(srv, 17013, _B0) ->
    {V1_index, _B1} = protocol:uint8(_B0),
    {V1_skill_index, _B2} = protocol:uint8(_B1),
    {V1_skill_Id, _B3} = protocol:uint32(_B2),
    {ok, {V1_index, V1_skill_index, V1_skill_Id}};
unpack(cli, 17013, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_errc_ode, V1_msg}};
unpack(srv, 17014, _B0) ->
    {V1_index, _B1} = protocol:uint8(_B0),
    {V1_pet_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_index, V1_pet_id}};
unpack(cli, 17014, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_errc_ode, V1_msg}};
unpack(srv, 17015, _B0) ->
    {V1_index, _B1} = protocol:uint8(_B0),
    {V1_appearance_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_index, V1_appearance_id}};
unpack(cli, 17015, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_errc_ode, V1_msg}};
unpack(srv, 17016, _B0) ->
    {V1_index, _B1} = protocol:uint8(_B0),
    {V1_skill_index, _B2} = protocol:uint8(_B1),
    {ok, {V1_index, V1_skill_index}};
unpack(cli, 17016, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_errc_ode, V1_msg}};
unpack(srv, 17017, _B0) ->
    {V1_index, _B1} = protocol:uint32(_B0),
    {V1_decorate_index, _B2} = protocol:uint32(_B1),
    {ok, {V1_index, V1_decorate_index}};
unpack(cli, 17017, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_errc_ode, V1_msg}};
unpack(srv, 17018, _B0) ->
    {V1_index, _B1} = protocol:uint32(_B0),
    {V1_skill_index, _B2} = protocol:uint32(_B1),
    {ok, {V1_index, V1_skill_index}};
unpack(cli, 17018, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_errc_ode, V1_msg}};
unpack(srv, 17019, _B0) ->
    {V1_appearance_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_appearance_id}};
unpack(cli, 17019, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_appearance_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_errc_ode, V1_msg, V1_appearance_id}};
unpack(srv, 17020, _B0) ->
    {V1_index, _B1} = protocol:uint32(_B0),
    {V1_decorate_index, _B2} = protocol:uint8(_B1),
    {V1_is_hide, _B3} = protocol:uint8(_B2),
    {ok, {V1_index, V1_decorate_index, V1_is_hide}};
unpack(cli, 17020, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_errc_ode, V1_msg}};
unpack(srv, 17021, _B0) -> {ok, {}};
unpack(cli, 17021, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {V1_expire_time, _B2} = protocol:uint32(_B1),
    {ok, {V1_base_id, V1_expire_time}};
unpack(srv, 17022, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_base_id}};
unpack(cli, 17022, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_base_id, _B3} = protocol:uint32(_B2),
    {V1_cache_dye_list, _B7} = protocol:array(_B3,
                                              fun (_B4) ->
                                                      {V2_dye_id, _B5} =
                                                          protocol:uint32(_B4),
                                                      {{V2_dye_id}, _B5}
                                              end),
    {ok,
     {V1_errc_ode, V1_msg, V1_base_id, V1_cache_dye_list}};
unpack(srv, 17023, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {V1_dye_id, _B2} = protocol:uint32(_B1),
    {V1_index, _B3} = protocol:uint32(_B2),
    {ok, {V1_base_id, V1_dye_id, V1_index}};
unpack(cli, 17023, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_errc_ode, V1_msg}};
unpack(srv, 17024, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_base_id}};
unpack(cli, 17024, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_errc_ode, V1_msg}};
unpack(srv, 17025, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_base_id}};
unpack(cli, 17025, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_errc_ode, V1_msg}};
unpack(srv, 17026, _B0) ->
    {V1_key_id, _B1} = protocol:uint8(_B0),
    {ok, {V1_key_id}};
unpack(cli, 17026, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_base_id, _B2} = protocol:uint32(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_errc_ode, V1_base_id, V1_msg}};
unpack(srv, 17027, _B0) ->
    {V1_key_id, _B1} = protocol:uint8(_B0),
    {ok, {V1_key_id}};
unpack(cli, 17027, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_base_id, _B2} = protocol:uint32(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_errc_ode, V1_base_id, V1_msg}};
unpack(srv, 17028, _B0) -> {ok, {}};
unpack(cli, 17028, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_base_id, _B2} = protocol:uint32(_B1),
    {V1_remain_time, _B3} = protocol:uint32(_B2),
    {ok, {V1_errc_ode, V1_base_id, V1_remain_time}};
unpack(srv, 17029, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_base_id}};
unpack(cli, 17029, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_base_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_errc_ode, V1_msg, V1_base_id}};
unpack(srv, 17030, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_base_id}};
unpack(cli, 17030, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_base_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_errc_ode, V1_msg, V1_base_id}};
unpack(srv, 17031, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 17031, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_errc_ode, V1_msg}};
unpack(srv, 17032, _B0) -> {ok, {}};
unpack(cli, 17032, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_lev, _B5} = protocol:uint8(_B4),
    {ok, {V1_id, V1_platform, V1_zone_id, V1_name, V1_lev}};
unpack(srv, 17033, _B0) -> {ok, {}};
unpack(cli, 17033, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_name, _B2} = protocol:string(_B1),
    {V1_lev, _B3} = protocol:uint8(_B2),
    {ok, {V1_flag, V1_name, V1_lev}};
unpack(srv, 17034, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_platform, _B3} = protocol:string(_B2),
    {V1_zone_id, _B4} = protocol:uint16(_B3),
    {ok, {V1_flag, V1_id, V1_platform, V1_zone_id}};
unpack(cli, 17034, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_errc_ode, V1_msg}};
unpack(srv, 17035, _B0) -> {ok, {}};
unpack(cli, 17035, _B0) ->
    {V1_errc_ode, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_errc_ode, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

