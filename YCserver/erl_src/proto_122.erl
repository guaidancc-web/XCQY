-file("src/proto/proto_122.erl", 1).

-module(proto_122).

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

-file("src/proto/proto_122.erl", 14).

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

-file("src/proto/proto_122.erl", 15).

-file("inc/arena.hrl", 1).

-record(m_arena,
        {ver = 1,
         cd_time = 0 :: non_neg_integer(),
         acc_num = 0 :: non_neg_integer(),
         cup = 1000 :: non_neg_integer(),
         roll_time = 0,
         roll_id = 0,
         roll_graph = []}).

-record(arena_role,
        {id = {0, "", 0} :: tuple(),
         ver = 6,
         name = "" :: bitstring(),
         win = 0 :: non_neg_integer(),
         acc_num = 0,
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         last_time = 0 :: non_neg_integer(),
         is_robot = 0 :: 0..1,
         cup = 0,
         next_log_id = 1,
         log = [],
         win_list = [],
         win_ratio = 0,
         day_time_flag = 0,
         enemy = [],
         day_win = 0,
         day_lost = 0,
         def_acc_num = 0,
         def_win = 0,
         max_cup = 1000,
         acc_sword_num = 0,
         acc_mage_num = 0,
         acc_archer_num = 0,
         acc_orc_num = 0,
         acc_devine_num = 0,
         acc_moon_num = 0,
         acc_templar_num = 0,
         win_sword = 0,
         win_mage = 0,
         win_archer = 0,
         win_orc = 0,
         win_devine = 0,
         win_moon = 0,
         win_templar = 0,
         init_def = 0,
         formation = 1,
         formation_lev = 1,
         guards = [],
         last_win_role}).

-record(arena_enemy,
        {order = 0,
         role_id = {0, "", 0},
         is_robot = 0,
         classes = 0,
         lev = 0,
         sex = 0,
         cup = 0,
         soul = 1}).

-record(arena_log,
        {log_id = 1,
         s_role_id = {0, "", 0} :: tuple(),
         s_name = "" :: list(),
         result = 0 :: 0..1,
         t_role_id = {0, "", 0} :: tuple(),
         t_name = "" :: list(),
         time = 0 :: non_neg_integer(),
         s_cup = 0,
         t_cup = 0,
         s_cup_change = 0,
         t_cup_change = 0,
         feedback = 0}).

-record(arena_role_index,
        {id = {0, "", 0},
         lev = 0,
         cup = 0,
         time = 0,
         day_time_flag = 0,
         day_win = 0,
         day_lost = 0,
         win_list = [],
         win_ratio = 0}).

-record(arena_robot,
        {id = {0, "robot", 0},
         lev = 0,
         name = "",
         classes = 0,
         sex = 0,
         cup = 0}).

-record(arena_graph,
        {id = 1,
         base_id = 0,
         num = 0,
         status = 0,
         quality = 0}).

-record(arena_graph_base,
        {id = 1,
         base_id = 0,
         num = 0,
         quality = 0,
         name = "",
         sex = 0,
         classes = 0,
         lev_low = 0,
         lev_high = 0,
         ratio = 0,
         times = 1,
         order_list = []}).

-file("src/proto/proto_122.erl", 16).

-file("inc/rank.hrl", 1).

-record(rank,
        {type = 1,
         show_list = [],
         list = [],
         last_val = 0,
         len = 0}).

-record(rank_rc,
        {ver = 3 :: pos_integer(),
         id = {roleid, platform, zoneid} :: term(),
         rank = 1,
         time = 0 :: non_neg_integer(),
         role_id = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: list(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = "",
         pet,
         guard,
         eqm}).

-record(rank_cfg,
        {type = 0 :: non_neg_integer(),
         num = 100 :: non_neg_integer(),
         keys = [#rank_rc.val3, #rank_rc.val2, #rank_rc.val1] ::
             [pos_integer()],
         min_val = 1 :: pos_integer(),
         nologin = 0 :: non_neg_integer(),
         zone = rank_zone_1 :: atom()}).

-file("src/proto/proto_122.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 12200, {}) ->
    {ok, <<2:32/little, 12200:16/little>>};
pack(srv, 12200,
     {V0_cup, V0_has_soul, V0_enemy, V0_log}) ->
    D_a_t_a = <<V0_cup:16/little, V0_has_soul:8/little,
                (length(V0_enemy)):16/little,
                (list_to_binary([<<V1_order:8/little,
                                   V1_classes:8/little, V1_lev:8/little,
                                   V1_sex:8/little, V1_cup:16/little,
                                   V1_soul:8/little>>
                                 || #arena_enemy{order = V1_order,
                                                 classes = V1_classes,
                                                 lev = V1_lev, sex = V1_sex,
                                                 cup = V1_cup, soul = V1_soul}
                                        <- V0_enemy]))/binary,
                (length(V0_log)):16/little,
                (list_to_binary([<<V1_log_id:16/little,
                                   V1_s_id:32/little,
                                   (protocol:pack(string,
                                                  V1_s_platform))/binary,
                                   V1_s_zone:16/little,
                                   (protocol:pack(string, V1_s_name))/binary,
                                   V1_result:8/little, V1_t_id:32/little,
                                   (protocol:pack(string,
                                                  V1_t_platform))/binary,
                                   V1_t_zone:16/little,
                                   (protocol:pack(string, V1_t_name))/binary,
                                   V1_feedback:8/little, V1_time:32/little,
                                   V1_s_cup:16/little,
                                   V1_s_cup_change:8/signed-little,
                                   V1_t_cup:16/little,
                                   V1_t_cup_change:8/signed-little>>
                                 || #arena_log{log_id = V1_log_id,
                                               s_role_id =
                                                   {V1_s_id,
                                                    V1_s_platform,
                                                    V1_s_zone},
                                               s_name = V1_s_name,
                                               result = V1_result,
                                               t_role_id =
                                                   {V1_t_id,
                                                    V1_t_platform,
                                                    V1_t_zone},
                                               t_name = V1_t_name,
                                               feedback = V1_feedback,
                                               time = V1_time, s_cup = V1_s_cup,
                                               s_cup_change = V1_s_cup_change,
                                               t_cup = V1_t_cup,
                                               t_cup_change = V1_t_cup_change}
                                        <- V0_log]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12200:16/little,
       D_a_t_a/binary>>};
pack(cli, 12201, {V0_order}) ->
    D_a_t_a = <<V0_order:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12201:16/little,
       D_a_t_a/binary>>};
pack(srv, 12201, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12201:16/little,
       D_a_t_a/binary>>};
pack(cli, 12202, {}) ->
    {ok, <<2:32/little, 12202:16/little>>};
pack(srv, 12202, {V0_flag, V0_msg, V0_enemy}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                (length(V0_enemy)):16/little,
                (list_to_binary([<<V1_order:8/little,
                                   V1_classes:8/little, V1_lev:8/little,
                                   V1_sex:8/little, V1_cup:16/little,
                                   V1_soul:8/little>>
                                 || #arena_enemy{order = V1_order,
                                                 classes = V1_classes,
                                                 lev = V1_lev, sex = V1_sex,
                                                 cup = V1_cup, soul = V1_soul}
                                        <- V0_enemy]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12202:16/little,
       D_a_t_a/binary>>};
pack(cli, 12203, {}) ->
    {ok, <<2:32/little, 12203:16/little>>};
pack(srv, 12203, {V0_cup, V0_has_soul, V0_log}) ->
    D_a_t_a = <<V0_cup:16/little, V0_has_soul:8/little,
                (length(V0_log)):16/little,
                (list_to_binary([<<V1_log_id:16/little,
                                   V1_s_id:32/little,
                                   (protocol:pack(string,
                                                  V1_s_platform))/binary,
                                   V1_s_zone:16/little,
                                   (protocol:pack(string, V1_s_name))/binary,
                                   V1_result:8/little, V1_t_id:32/little,
                                   (protocol:pack(string,
                                                  V1_t_platform))/binary,
                                   V1_t_zone:16/little,
                                   (protocol:pack(string, V1_t_name))/binary,
                                   V1_feedback:8/little, V1_time:32/little,
                                   V1_s_cup:16/little,
                                   V1_s_cup_change:8/signed-little,
                                   V1_t_cup:16/little,
                                   V1_t_cup_change:8/signed-little>>
                                 || #arena_log{log_id = V1_log_id,
                                               s_role_id =
                                                   {V1_s_id,
                                                    V1_s_platform,
                                                    V1_s_zone},
                                               s_name = V1_s_name,
                                               result = V1_result,
                                               t_role_id =
                                                   {V1_t_id,
                                                    V1_t_platform,
                                                    V1_t_zone},
                                               t_name = V1_t_name,
                                               feedback = V1_feedback,
                                               time = V1_time, s_cup = V1_s_cup,
                                               s_cup_change = V1_s_cup_change,
                                               t_cup = V1_t_cup,
                                               t_cup_change = V1_t_cup_change}
                                        <- V0_log]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12203:16/little,
       D_a_t_a/binary>>};
pack(cli, 12204, {V0_log_id}) ->
    D_a_t_a = <<V0_log_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12204:16/little,
       D_a_t_a/binary>>};
pack(srv, 12204, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12204:16/little,
       D_a_t_a/binary>>};
pack(cli, 12205, {}) ->
    {ok, <<2:32/little, 12205:16/little>>};
pack(srv, 12205, {V0_times, V0_score, V0_roll_time}) ->
    D_a_t_a = <<V0_times:8/little, V0_score:16/little,
                V0_roll_time:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12205:16/little,
       D_a_t_a/binary>>};
pack(cli, 12206, {}) ->
    {ok, <<2:32/little, 12206:16/little>>};
pack(srv, 12206,
     {V0_world_max_cup,
      #arena_role{acc_num = V0_acc_num, win = V0_win,
                  def_acc_num = V0_def_acc_num, def_win = V0_def_win,
                  max_cup = V0_max_cup, acc_sword_num = V0_acc_sword_num,
                  acc_mage_num = V0_acc_mage_num,
                  acc_archer_num = V0_acc_archer_num,
                  acc_orc_num = V0_acc_orc_num,
                  acc_devine_num = V0_acc_devine_num,
                  acc_moon_num = V0_acc_moon_num,
                  acc_templar_num = V0_acc_templar_num,
                  win_sword = V0_win_sword, win_mage = V0_win_mage,
                  win_archer = V0_win_archer, win_orc = V0_win_orc,
                  win_devine = V0_win_devine, win_moon = V0_win_moon,
                  win_templar = V0_win_templar, init_def = V0_init_def,
                  formation = V0_formation,
                  formation_lev = V0_formation_lev, guards = V0_guards},
      V0_pet_id}) ->
    D_a_t_a = <<V0_world_max_cup:16/little,
                V0_acc_num:32/little, V0_win:32/little,
                V0_def_acc_num:32/little, V0_def_win:32/little,
                V0_max_cup:16/little, V0_acc_sword_num:32/little,
                V0_acc_mage_num:32/little, V0_acc_archer_num:32/little,
                V0_acc_orc_num:32/little, V0_acc_devine_num:32/little,
                V0_acc_moon_num:32/little, V0_acc_templar_num:32/little,
                V0_win_sword:32/little, V0_win_mage:32/little,
                V0_win_archer:32/little, V0_win_orc:32/little,
                V0_win_devine:32/little, V0_win_moon:32/little,
                V0_win_templar:32/little, V0_init_def:8/little,
                V0_formation:8/little, V0_formation_lev:8/little,
                (length(V0_guards)):16/little,
                (list_to_binary([<<V1_guard_id:32/little,
                                   V1_war_id:8/little>>
                                 || {V1_guard_id, V1_war_id}
                                        <- V0_guards]))/binary,
                V0_pet_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12206:16/little,
       D_a_t_a/binary>>};
pack(cli, 12207,
     {V0_formation,
      V0_guard_id_1,
      V0_guard_id_2,
      V0_guard_id_3,
      V0_guard_id_4}) ->
    D_a_t_a = <<V0_formation:8/little,
                V0_guard_id_1:32/little, V0_guard_id_2:32/little,
                V0_guard_id_3:32/little, V0_guard_id_4:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12207:16/little,
       D_a_t_a/binary>>};
pack(srv, 12207,
     {V0_flag,
      V0_msg,
      V0_formation,
      V0_formation_lev,
      V0_guards}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_formation:8/little, V0_formation_lev:8/little,
                (length(V0_guards)):16/little,
                (list_to_binary([<<V1_guard_id:32/little,
                                   V1_war_id:8/little>>
                                 || {V1_guard_id, V1_war_id}
                                        <- V0_guards]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12207:16/little,
       D_a_t_a/binary>>};
pack(cli, 12208, {}) ->
    {ok, <<2:32/little, 12208:16/little>>};
pack(srv, 12208,
     {V0_page,
      V0_page_total,
      V0_record_total,
      V0_rank_list}) ->
    D_a_t_a = <<V0_page:8/little, V0_page_total:8/little,
                V0_record_total:16/little,
                (length(V0_rank_list)):16/little,
                (list_to_binary([<<V1_role_id:32/little,
                                   V1_rank:8/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:8/little, V1_val1:32/signed-little,
                                   V1_val2:32/signed-little,
                                   V1_val3:32/signed-little,
                                   V1_val4:32/signed-little,
                                   (protocol:pack(string, V1_desc))/binary>>
                                 || #rank_rc{role_id = V1_role_id,
                                             rank = V1_rank,
                                             platform = V1_platform,
                                             zone_id = V1_zone_id,
                                             name = V1_name, sex = V1_sex,
                                             classes = V1_classes, lev = V1_lev,
                                             val1 = V1_val1, val2 = V1_val2,
                                             val3 = V1_val3, val4 = V1_val4,
                                             desc = V1_desc}
                                        <- V0_rank_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12208:16/little,
       D_a_t_a/binary>>};
pack(cli, 12209, {V0_order}) ->
    D_a_t_a = <<V0_order:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12209:16/little,
       D_a_t_a/binary>>};
pack(srv, 12209, {V0_order, V0_guards}) ->
    D_a_t_a = <<V0_order:8/little,
                (length(V0_guards)):16/little,
                (list_to_binary([<<V1_guard_id:32/little,
                                   V1_war_id:8/little>>
                                 || {V1_guard_id, V1_war_id}
                                        <- V0_guards]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12209:16/little,
       D_a_t_a/binary>>};
pack(cli, 12210, {}) ->
    {ok, <<2:32/little, 12210:16/little>>};
pack(srv, 12210, {V0_flag, V0_msg, V0_soul, V0_gain}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_soul:8/little, (length(V0_gain)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_num:32/little>>
                                 || {V1_base_id, V1_num} <- V0_gain]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12210:16/little,
       D_a_t_a/binary>>};
pack(cli, 12211, {}) ->
    {ok, <<2:32/little, 12211:16/little>>};
pack(srv, 12211,
     {#m_arena{roll_time = V0_roll_time,
               roll_id = V0_roll_id, roll_graph = V0_roll_graph}}) ->
    D_a_t_a = <<V0_roll_time:8/little, V0_roll_id:8/little,
                (length(V0_roll_graph)):16/little,
                (list_to_binary([<<V1_id:8/little, V1_base_id:32/little,
                                   V1_num:32/little, V1_status:8/little,
                                   V1_quality:8/little>>
                                 || #arena_graph{id = V1_id,
                                                 base_id = V1_base_id,
                                                 num = V1_num,
                                                 status = V1_status,
                                                 quality = V1_quality}
                                        <- V0_roll_graph]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12211:16/little,
       D_a_t_a/binary>>};
pack(cli, 12212, {}) ->
    {ok, <<2:32/little, 12212:16/little>>};
pack(srv, 12212,
     {V0_flag,
      V0_msg,
      V0_roll_val,
      V0_roll_time,
      V0_roll_id,
      V0_id,
      V0_gain}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_roll_val:8/little, V0_roll_time:8/little,
                V0_roll_id:8/little, V0_id:8/little,
                (length(V0_gain)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_num:32/little>>
                                 || {V1_base_id, V1_num} <- V0_gain]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12212:16/little,
       D_a_t_a/binary>>};
pack(cli, 12213, {}) ->
    {ok, <<2:32/little, 12213:16/little>>};
pack(srv, 12213, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12213:16/little,
       D_a_t_a/binary>>};
pack(cli, 12214, {}) ->
    {ok, <<2:32/little, 12214:16/little>>};
pack(srv, 12214, {V0_has_soul}) ->
    D_a_t_a = <<V0_has_soul:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12214:16/little,
       D_a_t_a/binary>>};
pack(cli, 12215, {V0_log_id}) ->
    D_a_t_a = <<V0_log_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12215:16/little,
       D_a_t_a/binary>>};
pack(srv, 12215, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12215:16/little,
       D_a_t_a/binary>>};
pack(cli, 12216, {}) ->
    {ok, <<2:32/little, 12216:16/little>>};
pack(srv, 12216,
     {V0_result,
      {V0_t_id, V0_t_platform, V0_t_zone},
      V0_t_name,
      V0_t_classes,
      V0_t_sex,
      V0_t_lev,
      V0_s_cup,
      V0_s_cup_change,
      V0_t_cup,
      V0_t_cup_change,
      V0_s_statistics,
      V0_t_statistics}) ->
    D_a_t_a = <<V0_result:8/little, V0_t_id:32/little,
                (protocol:pack(string, V0_t_platform))/binary,
                V0_t_zone:16/little,
                (protocol:pack(string, V0_t_name))/binary,
                V0_t_classes:8/little, V0_t_sex:8/little,
                V0_t_lev:16/little, V0_s_cup:16/little,
                V0_s_cup_change:8/signed-little, V0_t_cup:16/little,
                V0_t_cup_change:8/signed-little,
                (length(V0_s_statistics)):16/little,
                (list_to_binary([<<V1_type_1:8/little,
                                   V1_base_id_1:32/little, V1_dmg_1:32/little,
                                   V1_heal_1:32/little>>
                                 || {V1_type_1,
                                     V1_base_id_1,
                                     V1_dmg_1,
                                     V1_heal_1}
                                        <- V0_s_statistics]))/binary,
                (length(V0_t_statistics)):16/little,
                (list_to_binary([<<V1_type_2:8/little,
                                   V1_base_id_2:32/little, V1_dmg_2:32/little,
                                   V1_heal_2:32/little>>
                                 || {V1_type_2,
                                     V1_base_id_2,
                                     V1_dmg_2,
                                     V1_heal_2}
                                        <- V0_t_statistics]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12216:16/little,
       D_a_t_a/binary>>};
pack(cli, 12217, {V0_pet_id}) ->
    D_a_t_a = <<V0_pet_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12217:16/little,
       D_a_t_a/binary>>};
pack(srv, 12217, {V0_result, V0_msg, V0_pet_id}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_pet_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12217:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 12200, _B0) -> {ok, {}};
unpack(cli, 12200, _B0) ->
    {V1_cup, _B1} = protocol:uint16(_B0),
    {V1_has_soul, _B2} = protocol:uint8(_B1),
    {V1_enemy, _B11} = protocol:array(_B2,
                                      fun (_B3) ->
                                              {V2_order, _B4} =
                                                  protocol:uint8(_B3),
                                              {V2_classes, _B5} =
                                                  protocol:uint8(_B4),
                                              {V2_lev, _B6} =
                                                  protocol:uint8(_B5),
                                              {V2_sex, _B7} =
                                                  protocol:uint8(_B6),
                                              {V2_cup, _B8} =
                                                  protocol:uint16(_B7),
                                              {V2_soul, _B9} =
                                                  protocol:uint8(_B8),
                                              {{V2_order,
                                                V2_classes,
                                                V2_lev,
                                                V2_sex,
                                                V2_cup,
                                                V2_soul},
                                               _B9}
                                      end),
    {V1_log, _B30} = protocol:array(_B11,
                                    fun (_B12) ->
                                            {V2_log_id, _B13} =
                                                protocol:uint16(_B12),
                                            {V2_s_id, _B14} =
                                                protocol:uint32(_B13),
                                            {V2_s_platform, _B15} =
                                                protocol:string(_B14),
                                            {V2_s_zone, _B16} =
                                                protocol:uint16(_B15),
                                            {V2_s_name, _B17} =
                                                protocol:string(_B16),
                                            {V2_result, _B18} =
                                                protocol:uint8(_B17),
                                            {V2_t_id, _B19} =
                                                protocol:uint32(_B18),
                                            {V2_t_platform, _B20} =
                                                protocol:string(_B19),
                                            {V2_t_zone, _B21} =
                                                protocol:uint16(_B20),
                                            {V2_t_name, _B22} =
                                                protocol:string(_B21),
                                            {V2_feedback, _B23} =
                                                protocol:uint8(_B22),
                                            {V2_time, _B24} =
                                                protocol:uint32(_B23),
                                            {V2_s_cup, _B25} =
                                                protocol:uint16(_B24),
                                            {V2_s_cup_change, _B26} =
                                                protocol:int8(_B25),
                                            {V2_t_cup, _B27} =
                                                protocol:uint16(_B26),
                                            {V2_t_cup_change, _B28} =
                                                protocol:int8(_B27),
                                            {{V2_log_id,
                                              V2_s_id,
                                              V2_s_platform,
                                              V2_s_zone,
                                              V2_s_name,
                                              V2_result,
                                              V2_t_id,
                                              V2_t_platform,
                                              V2_t_zone,
                                              V2_t_name,
                                              V2_feedback,
                                              V2_time,
                                              V2_s_cup,
                                              V2_s_cup_change,
                                              V2_t_cup,
                                              V2_t_cup_change},
                                             _B28}
                                    end),
    {ok, {V1_cup, V1_has_soul, V1_enemy, V1_log}};
unpack(srv, 12201, _B0) ->
    {V1_order, _B1} = protocol:uint8(_B0),
    {ok, {V1_order}};
unpack(cli, 12201, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 12202, _B0) -> {ok, {}};
unpack(cli, 12202, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_enemy, _B11} = protocol:array(_B2,
                                      fun (_B3) ->
                                              {V2_order, _B4} =
                                                  protocol:uint8(_B3),
                                              {V2_classes, _B5} =
                                                  protocol:uint8(_B4),
                                              {V2_lev, _B6} =
                                                  protocol:uint8(_B5),
                                              {V2_sex, _B7} =
                                                  protocol:uint8(_B6),
                                              {V2_cup, _B8} =
                                                  protocol:uint16(_B7),
                                              {V2_soul, _B9} =
                                                  protocol:uint8(_B8),
                                              {{V2_order,
                                                V2_classes,
                                                V2_lev,
                                                V2_sex,
                                                V2_cup,
                                                V2_soul},
                                               _B9}
                                      end),
    {ok, {V1_flag, V1_msg, V1_enemy}};
unpack(srv, 12203, _B0) -> {ok, {}};
unpack(cli, 12203, _B0) ->
    {V1_cup, _B1} = protocol:uint16(_B0),
    {V1_has_soul, _B2} = protocol:uint8(_B1),
    {V1_log, _B21} = protocol:array(_B2,
                                    fun (_B3) ->
                                            {V2_log_id, _B4} =
                                                protocol:uint16(_B3),
                                            {V2_s_id, _B5} =
                                                protocol:uint32(_B4),
                                            {V2_s_platform, _B6} =
                                                protocol:string(_B5),
                                            {V2_s_zone, _B7} =
                                                protocol:uint16(_B6),
                                            {V2_s_name, _B8} =
                                                protocol:string(_B7),
                                            {V2_result, _B9} =
                                                protocol:uint8(_B8),
                                            {V2_t_id, _B10} =
                                                protocol:uint32(_B9),
                                            {V2_t_platform, _B11} =
                                                protocol:string(_B10),
                                            {V2_t_zone, _B12} =
                                                protocol:uint16(_B11),
                                            {V2_t_name, _B13} =
                                                protocol:string(_B12),
                                            {V2_feedback, _B14} =
                                                protocol:uint8(_B13),
                                            {V2_time, _B15} =
                                                protocol:uint32(_B14),
                                            {V2_s_cup, _B16} =
                                                protocol:uint16(_B15),
                                            {V2_s_cup_change, _B17} =
                                                protocol:int8(_B16),
                                            {V2_t_cup, _B18} =
                                                protocol:uint16(_B17),
                                            {V2_t_cup_change, _B19} =
                                                protocol:int8(_B18),
                                            {{V2_log_id,
                                              V2_s_id,
                                              V2_s_platform,
                                              V2_s_zone,
                                              V2_s_name,
                                              V2_result,
                                              V2_t_id,
                                              V2_t_platform,
                                              V2_t_zone,
                                              V2_t_name,
                                              V2_feedback,
                                              V2_time,
                                              V2_s_cup,
                                              V2_s_cup_change,
                                              V2_t_cup,
                                              V2_t_cup_change},
                                             _B19}
                                    end),
    {ok, {V1_cup, V1_has_soul, V1_log}};
unpack(srv, 12204, _B0) ->
    {V1_log_id, _B1} = protocol:uint16(_B0),
    {ok, {V1_log_id}};
unpack(cli, 12204, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 12205, _B0) -> {ok, {}};
unpack(cli, 12205, _B0) ->
    {V1_times, _B1} = protocol:uint8(_B0),
    {V1_score, _B2} = protocol:uint16(_B1),
    {V1_roll_time, _B3} = protocol:uint8(_B2),
    {ok, {V1_times, V1_score, V1_roll_time}};
unpack(srv, 12206, _B0) -> {ok, {}};
unpack(cli, 12206, _B0) ->
    {V1_world_max_cup, _B1} = protocol:uint16(_B0),
    {V1_acc_num, _B2} = protocol:uint32(_B1),
    {V1_win, _B3} = protocol:uint32(_B2),
    {V1_def_acc_num, _B4} = protocol:uint32(_B3),
    {V1_def_win, _B5} = protocol:uint32(_B4),
    {V1_max_cup, _B6} = protocol:uint16(_B5),
    {V1_acc_sword_num, _B7} = protocol:uint32(_B6),
    {V1_acc_mage_num, _B8} = protocol:uint32(_B7),
    {V1_acc_archer_num, _B9} = protocol:uint32(_B8),
    {V1_acc_orc_num, _B10} = protocol:uint32(_B9),
    {V1_acc_devine_num, _B11} = protocol:uint32(_B10),
    {V1_acc_moon_num, _B12} = protocol:uint32(_B11),
    {V1_acc_templar_num, _B13} = protocol:uint32(_B12),
    {V1_win_sword, _B14} = protocol:uint32(_B13),
    {V1_win_mage, _B15} = protocol:uint32(_B14),
    {V1_win_archer, _B16} = protocol:uint32(_B15),
    {V1_win_orc, _B17} = protocol:uint32(_B16),
    {V1_win_devine, _B18} = protocol:uint32(_B17),
    {V1_win_moon, _B19} = protocol:uint32(_B18),
    {V1_win_templar, _B20} = protocol:uint32(_B19),
    {V1_init_def, _B21} = protocol:uint8(_B20),
    {V1_formation, _B22} = protocol:uint8(_B21),
    {V1_formation_lev, _B23} = protocol:uint8(_B22),
    {V1_guards, _B28} = protocol:array(_B23,
                                       fun (_B24) ->
                                               {V2_guard_id, _B25} =
                                                   protocol:uint32(_B24),
                                               {V2_war_id, _B26} =
                                                   protocol:uint8(_B25),
                                               {{V2_guard_id, V2_war_id}, _B26}
                                       end),
    {V1_pet_id, _B29} = protocol:uint32(_B28),
    {ok,
     {V1_world_max_cup,
      V1_acc_num,
      V1_win,
      V1_def_acc_num,
      V1_def_win,
      V1_max_cup,
      V1_acc_sword_num,
      V1_acc_mage_num,
      V1_acc_archer_num,
      V1_acc_orc_num,
      V1_acc_devine_num,
      V1_acc_moon_num,
      V1_acc_templar_num,
      V1_win_sword,
      V1_win_mage,
      V1_win_archer,
      V1_win_orc,
      V1_win_devine,
      V1_win_moon,
      V1_win_templar,
      V1_init_def,
      V1_formation,
      V1_formation_lev,
      V1_guards,
      V1_pet_id}};
unpack(srv, 12207, _B0) ->
    {V1_formation, _B1} = protocol:uint8(_B0),
    {V1_guard_id_1, _B2} = protocol:uint32(_B1),
    {V1_guard_id_2, _B3} = protocol:uint32(_B2),
    {V1_guard_id_3, _B4} = protocol:uint32(_B3),
    {V1_guard_id_4, _B5} = protocol:uint32(_B4),
    {ok,
     {V1_formation,
      V1_guard_id_1,
      V1_guard_id_2,
      V1_guard_id_3,
      V1_guard_id_4}};
unpack(cli, 12207, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_formation, _B3} = protocol:uint8(_B2),
    {V1_formation_lev, _B4} = protocol:uint8(_B3),
    {V1_guards, _B9} = protocol:array(_B4,
                                      fun (_B5) ->
                                              {V2_guard_id, _B6} =
                                                  protocol:uint32(_B5),
                                              {V2_war_id, _B7} =
                                                  protocol:uint8(_B6),
                                              {{V2_guard_id, V2_war_id}, _B7}
                                      end),
    {ok,
     {V1_flag,
      V1_msg,
      V1_formation,
      V1_formation_lev,
      V1_guards}};
unpack(srv, 12208, _B0) -> {ok, {}};
unpack(cli, 12208, _B0) ->
    {V1_page, _B1} = protocol:uint8(_B0),
    {V1_page_total, _B2} = protocol:uint8(_B1),
    {V1_record_total, _B3} = protocol:uint16(_B2),
    {V1_rank_list, _B19} = protocol:array(_B3,
                                          fun (_B4) ->
                                                  {V2_role_id, _B5} =
                                                      protocol:uint32(_B4),
                                                  {V2_rank, _B6} =
                                                      protocol:uint8(_B5),
                                                  {V2_platform, _B7} =
                                                      protocol:string(_B6),
                                                  {V2_zone_id, _B8} =
                                                      protocol:uint16(_B7),
                                                  {V2_name, _B9} =
                                                      protocol:string(_B8),
                                                  {V2_sex, _B10} =
                                                      protocol:uint8(_B9),
                                                  {V2_classes, _B11} =
                                                      protocol:uint8(_B10),
                                                  {V2_lev, _B12} =
                                                      protocol:uint8(_B11),
                                                  {V2_val1, _B13} =
                                                      protocol:int32(_B12),
                                                  {V2_val2, _B14} =
                                                      protocol:int32(_B13),
                                                  {V2_val3, _B15} =
                                                      protocol:int32(_B14),
                                                  {V2_val4, _B16} =
                                                      protocol:int32(_B15),
                                                  {V2_desc, _B17} =
                                                      protocol:string(_B16),
                                                  {{V2_role_id,
                                                    V2_rank,
                                                    V2_platform,
                                                    V2_zone_id,
                                                    V2_name,
                                                    V2_sex,
                                                    V2_classes,
                                                    V2_lev,
                                                    V2_val1,
                                                    V2_val2,
                                                    V2_val3,
                                                    V2_val4,
                                                    V2_desc},
                                                   _B17}
                                          end),
    {ok,
     {V1_page,
      V1_page_total,
      V1_record_total,
      V1_rank_list}};
unpack(srv, 12209, _B0) ->
    {V1_order, _B1} = protocol:uint8(_B0),
    {ok, {V1_order}};
unpack(cli, 12209, _B0) ->
    {V1_order, _B1} = protocol:uint8(_B0),
    {V1_guards, _B6} = protocol:array(_B1,
                                      fun (_B2) ->
                                              {V2_guard_id, _B3} =
                                                  protocol:uint32(_B2),
                                              {V2_war_id, _B4} =
                                                  protocol:uint8(_B3),
                                              {{V2_guard_id, V2_war_id}, _B4}
                                      end),
    {ok, {V1_order, V1_guards}};
unpack(srv, 12210, _B0) -> {ok, {}};
unpack(cli, 12210, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_soul, _B3} = protocol:uint8(_B2),
    {V1_gain, _B8} = protocol:array(_B3,
                                    fun (_B4) ->
                                            {V2_base_id, _B5} =
                                                protocol:uint32(_B4),
                                            {V2_num, _B6} =
                                                protocol:uint32(_B5),
                                            {{V2_base_id, V2_num}, _B6}
                                    end),
    {ok, {V1_flag, V1_msg, V1_soul, V1_gain}};
unpack(srv, 12211, _B0) -> {ok, {}};
unpack(cli, 12211, _B0) ->
    {V1_roll_time, _B1} = protocol:uint8(_B0),
    {V1_roll_id, _B2} = protocol:uint8(_B1),
    {V1_roll_graph, _B10} = protocol:array(_B2,
                                           fun (_B3) ->
                                                   {V2_id, _B4} =
                                                       protocol:uint8(_B3),
                                                   {V2_base_id, _B5} =
                                                       protocol:uint32(_B4),
                                                   {V2_num, _B6} =
                                                       protocol:uint32(_B5),
                                                   {V2_status, _B7} =
                                                       protocol:uint8(_B6),
                                                   {V2_quality, _B8} =
                                                       protocol:uint8(_B7),
                                                   {{V2_id,
                                                     V2_base_id,
                                                     V2_num,
                                                     V2_status,
                                                     V2_quality},
                                                    _B8}
                                           end),
    {ok, {V1_roll_time, V1_roll_id, V1_roll_graph}};
unpack(srv, 12212, _B0) -> {ok, {}};
unpack(cli, 12212, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_roll_val, _B3} = protocol:uint8(_B2),
    {V1_roll_time, _B4} = protocol:uint8(_B3),
    {V1_roll_id, _B5} = protocol:uint8(_B4),
    {V1_id, _B6} = protocol:uint8(_B5),
    {V1_gain, _B11} = protocol:array(_B6,
                                     fun (_B7) ->
                                             {V2_base_id, _B8} =
                                                 protocol:uint32(_B7),
                                             {V2_num, _B9} =
                                                 protocol:uint32(_B8),
                                             {{V2_base_id, V2_num}, _B9}
                                     end),
    {ok,
     {V1_flag,
      V1_msg,
      V1_roll_val,
      V1_roll_time,
      V1_roll_id,
      V1_id,
      V1_gain}};
unpack(srv, 12213, _B0) -> {ok, {}};
unpack(cli, 12213, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 12214, _B0) -> {ok, {}};
unpack(cli, 12214, _B0) ->
    {V1_has_soul, _B1} = protocol:uint8(_B0),
    {ok, {V1_has_soul}};
unpack(srv, 12215, _B0) ->
    {V1_log_id, _B1} = protocol:uint16(_B0),
    {ok, {V1_log_id}};
unpack(cli, 12215, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 12216, _B0) -> {ok, {}};
unpack(cli, 12216, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_t_id, _B2} = protocol:uint32(_B1),
    {V1_t_platform, _B3} = protocol:string(_B2),
    {V1_t_zone, _B4} = protocol:uint16(_B3),
    {V1_t_name, _B5} = protocol:string(_B4),
    {V1_t_classes, _B6} = protocol:uint8(_B5),
    {V1_t_sex, _B7} = protocol:uint8(_B6),
    {V1_t_lev, _B8} = protocol:uint16(_B7),
    {V1_s_cup, _B9} = protocol:uint16(_B8),
    {V1_s_cup_change, _B10} = protocol:int8(_B9),
    {V1_t_cup, _B11} = protocol:uint16(_B10),
    {V1_t_cup_change, _B12} = protocol:int8(_B11),
    {V1_s_statistics, _B19} = protocol:array(_B12,
                                             fun (_B13) ->
                                                     {V2_type_1, _B14} =
                                                         protocol:uint8(_B13),
                                                     {V2_base_id_1, _B15} =
                                                         protocol:uint32(_B14),
                                                     {V2_dmg_1, _B16} =
                                                         protocol:uint32(_B15),
                                                     {V2_heal_1, _B17} =
                                                         protocol:uint32(_B16),
                                                     {{V2_type_1,
                                                       V2_base_id_1,
                                                       V2_dmg_1,
                                                       V2_heal_1},
                                                      _B17}
                                             end),
    {V1_t_statistics, _B26} = protocol:array(_B19,
                                             fun (_B20) ->
                                                     {V2_type_2, _B21} =
                                                         protocol:uint8(_B20),
                                                     {V2_base_id_2, _B22} =
                                                         protocol:uint32(_B21),
                                                     {V2_dmg_2, _B23} =
                                                         protocol:uint32(_B22),
                                                     {V2_heal_2, _B24} =
                                                         protocol:uint32(_B23),
                                                     {{V2_type_2,
                                                       V2_base_id_2,
                                                       V2_dmg_2,
                                                       V2_heal_2},
                                                      _B24}
                                             end),
    {ok,
     {V1_result,
      V1_t_id,
      V1_t_platform,
      V1_t_zone,
      V1_t_name,
      V1_t_classes,
      V1_t_sex,
      V1_t_lev,
      V1_s_cup,
      V1_s_cup_change,
      V1_t_cup,
      V1_t_cup_change,
      V1_s_statistics,
      V1_t_statistics}};
unpack(srv, 12217, _B0) ->
    {V1_pet_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_pet_id}};
unpack(cli, 12217, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_pet_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_result, V1_msg, V1_pet_id}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

