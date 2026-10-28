-file("src/proto/proto_200.erl", 1).

-module(proto_200).

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

-file("src/proto/proto_200.erl", 14).

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

-file("src/proto/proto_200.erl", 15).

-file("inc/gold_league.hrl", 1).

-record(gold_league_ready_zone,
        {cross_id = 0,
         map_id = 0 :: non_neg_integer(),
         map_zone = 0,
         map_plat = "",
         map_pid :: pid() | undefined,
         member_size = 0 :: non_neg_integer(),
         group_id = 0 :: pos_integer(),
         exit_npc,
         combat_mode = 0,
         init_combat_mode = 0}).

-record(gold_league_zone,
        {cross_id = 0,
         id = 0,
         key,
         group_id = 0 :: pos_integer(),
         seq_id = 0,
         pid,
         is_close = 0}).

-record(gold_league_field,
        {id = 0 :: non_neg_integer(),
         key,
         cross_id = 0,
         group_id = 0 :: non_neg_integer(),
         seq_id = 0 :: non_neg_integer(),
         pid :: pid() | undefined,
         map_id = 0,
         map_pid,
         map_plat = "",
         map_zone = 0,
         phase = 0,
         end_time = 0,
         combat_mode = 0,
         now_round = 0,
         max_round = 0}).

-record(gold_league_state,
        {key,
         cross_id = 0,
         group_id = 0 :: non_neg_integer(),
         state_name,
         phase = 0,
         end_time = 0,
         now_round = 0,
         max_round = 0,
         ids = []}).

-record(gold_league_zone_role,
        {id,
         pid,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0 :: non_neg_integer(),
         fc = 0,
         group_id = 0 :: pos_integer(),
         field_id = 0,
         status = 0,
         is_combat = 0,
         combat_pid,
         last_combat_over_time = 0,
         rival_id = undefined,
         rival_pid = undefined,
         rival_name = "",
         ref = undefined,
         win_count = 0,
         combat_count = 0,
         score = 0,
         cross_id = 0,
         match = 0,
         pos = 0,
         match_num = 0,
         match_group_id = 0,
         is_lose = 0,
         lose_round = 0,
         rank = 0,
         is_out = 0,
         is_result = 0}).

-record(gold_league,
        {id ::
             undefined |
             {pos_integer(), bitstring(), non_neg_integer()},
         pid :: pid() | undefined,
         name = "" :: string(),
         sex = 0,
         classes = 0,
         face_id = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         break_times = 0,
         fc = 0 :: non_neg_integer(),
         looks = [] :: list(),
         group_id = 0 :: pos_integer(),
         match = 0 :: pos_integer(),
         combat_count = 0 :: pos_integer(),
         win = 0,
         lose = 0,
         rival_id = {0, "", 0} :: tuple(),
         multi_kill = 0 :: non_neg_integer(),
         win_count = 0,
         score = 0 :: non_neg_integer(),
         rank = 0 :: pos_integer(),
         ready_map_id = 0 :: non_neg_integer(),
         ready_map_pid :: pid() | undefined,
         ready_map_plat = "",
         ready_map_zone = 0,
         seq_id = 0 :: non_neg_integer(),
         field_id = 0 :: non_neg_integer(),
         field_map_id = 0 :: non_neg_integer(),
         field_map_plat = "",
         field_map_zone = 0,
         field_pid :: pid() | undefined,
         field_time = 0,
         reward = [] :: list(),
         status = 0,
         cross_id = 0,
         ref = undefined,
         match_time = 0,
         combat_time = 0,
         camp = 0,
         is_combat = 0,
         combat_mode = 0,
         is_rise = 0,
         pos = 0,
         is_lose = 0,
         lose_round = 0}).

-record(gold_league_group_data,
        {id = 0, name = "", order = 0, members = [], ids = []}).

-record(gold_league_drop_item_data,
        {base_id = 0,
         weight = 0,
         result = 0,
         is_notice = 0,
         num = 0}).

-record(gold_league_combat,
        {pid,
         field_id = 0,
         field_key,
         type = 1,
         ref,
         first_id = {0, "", 0},
         first_name = "",
         first_classes = 0,
         first_sex = 0,
         first_lev = 0,
         second_id = {0, "", 0},
         second_name = "",
         second_classes = 0,
         second_lev = 0,
         second_sex = 0,
         cross_id = 0,
         group_id = 0,
         ids = []}).

-record(gold_league_timer_data,
        {id = 0,
         phase = 0,
         type = 0,
         spec_id = 0,
         buff_id = 0,
         start = 0,
         interval = 0,
         finished = 0,
         num = 0,
         max = 0}).

-record(gold_league_combat_result,
        {field_pid, round = 0}).

-record(gold_league_combat_win,
        {field_pid,
         score = 0,
         round = 0,
         now_round = 0,
         max_round = 0,
         state_name = fight,
         is_lose = 0,
         id,
         name = "",
         time = 0,
         group_id = 0}).

-record(gold_league_combat_lose,
        {field_pid,
         score = 0,
         round = 0,
         now_round = 0,
         max_round = 0,
         state_name = fight,
         is_lose = 0,
         id,
         name = "",
         time = 0,
         group_id = 0}).

-record(gold_league_rank_reward_data,
        {group = 0,
         min = 0,
         max = 0,
         items = [],
         title = "",
         content = ""}).

-record(gold_league_16,
        {cross_id = 0,
         group_id = 0,
         key = {0, 0},
         members = []}).

-record(gold_league_guess,
        {id = 0, name = "", num = 0, amount = 0, members = []}).

-record(gold_league_guess_role,
        {id = 0, members = [], group_id = 0, cross_id = 0}).

-record(gold_league_combat_record,
        {id = 0,
         first_id = {0, "", 0},
         second_id = {0, "", 0}}).

-file("src/proto/proto_200.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 20000, {}) ->
    {ok, <<2:32/little, 20000:16/little>>};
pack(srv, 20000,
     {V0_phase,
      V0_time,
      V0_now_round,
      V0_max_round,
      V0_ids}) ->
    D_a_t_a = <<V0_phase:8/little, V0_time:32/little,
                V0_now_round:8/little, V0_max_round:8/little,
                (length(V0_ids)):16/little,
                (list_to_binary([<<V1_group_id1:8/little>>
                                 || V1_group_id1 <- V0_ids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20000:16/little,
       D_a_t_a/binary>>};
pack(cli, 20001, {}) ->
    {ok, <<2:32/little, 20001:16/little>>};
pack(srv, 20001, {V0_op_code, V0_msg}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20001:16/little,
       D_a_t_a/binary>>};
pack(cli, 20002, {}) ->
    {ok, <<2:32/little, 20002:16/little>>};
pack(srv, 20002, {V0_op_code, V0_msg}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20002:16/little,
       D_a_t_a/binary>>};
pack(cli, 20003, {}) ->
    {ok, <<2:32/little, 20003:16/little>>};
pack(srv, 20003, {V0_op_code, V0_msg}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20003:16/little,
       D_a_t_a/binary>>};
pack(cli, 20006, {}) ->
    {ok, <<2:32/little, 20006:16/little>>};
pack(srv, 20006,
     {V0_is_win, V0_score, V0_msg, V0_reward}) ->
    D_a_t_a = <<V0_is_win:8/little, V0_score:16/little,
                (protocol:pack(string, V0_msg))/binary,
                (length(V0_reward)):16/little,
                (list_to_binary([<<V1_assets:32/little,
                                   V1_val:32/little>>
                                 || {V1_assets, V1_val}
                                        <- V0_reward]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20006:16/little,
       D_a_t_a/binary>>};
pack(cli, 20007, {}) ->
    {ok, <<2:32/little, 20007:16/little>>};
pack(srv, 20007,
     {#gold_league{score = V0_score, win = V0_win,
                   lose = V0_lose, rank = V0_rank, reward = V0_reward}}) ->
    D_a_t_a = <<V0_score:16/little, V0_win:8/little,
                V0_lose:8/little, V0_rank:8/little,
                (length(V0_reward)):16/little,
                (list_to_binary([<<V1_assets:32/little,
                                   V1_val:32/little>>
                                 || {V1_assets, V1_val}
                                        <- V0_reward]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20007:16/little,
       D_a_t_a/binary>>};
pack(cli, 20008, {}) ->
    {ok, <<2:32/little, 20008:16/little>>};
pack(srv, 20008, {V0_gold_league, V0_num}) ->
    D_a_t_a = <<(length(V0_gold_league)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_classes:8/little, V1_sex:8/little,
                                   V1_rank:8/little, V1_score:32/little,
                                   V1_is_rise:8/little, V1_win:8/little>>
                                 || #gold_league{id =
                                                     {V1_rid,
                                                      V1_platform,
                                                      V1_zone_id},
                                                 name = V1_name,
                                                 classes = V1_classes,
                                                 sex = V1_sex, rank = V1_rank,
                                                 score = V1_score,
                                                 is_rise = V1_is_rise,
                                                 win = V1_win}
                                        <- V0_gold_league]))/binary,
                V0_num:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20008:16/little,
       D_a_t_a/binary>>};
pack(cli, 20009, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20009:16/little,
       D_a_t_a/binary>>};
pack(srv, 20009, {V0_op_code, V0_msg}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20009:16/little,
       D_a_t_a/binary>>};
pack(cli, 20010, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20010:16/little,
       D_a_t_a/binary>>};
pack(srv, 20010, {V0_op_code, V0_msg}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20010:16/little,
       D_a_t_a/binary>>};
pack(cli, 20011, {}) ->
    {ok, <<2:32/little, 20011:16/little>>};
pack(srv, 20011,
     {V0_group_id, V0_gold_league, V0_guess_id}) ->
    D_a_t_a = <<V0_group_id:8/little,
                (length(V0_gold_league)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_classes:8/little, V1_sex:8/little,
                                   V1_rank:8/little, V1_score:32/little,
                                   V1_pos:16/little, V1_is_lose:8/little,
                                   V1_lose_round:8/little,
                                   V1_group_id:16/little,
                                   V1_is_combat:8/little>>
                                 || #gold_league{id =
                                                     {V1_rid,
                                                      V1_platform,
                                                      V1_zone_id},
                                                 name = V1_name,
                                                 classes = V1_classes,
                                                 sex = V1_sex, rank = V1_rank,
                                                 score = V1_score, pos = V1_pos,
                                                 is_lose = V1_is_lose,
                                                 lose_round = V1_lose_round,
                                                 group_id = V1_group_id,
                                                 is_combat = V1_is_combat}
                                        <- V0_gold_league]))/binary,
                (length(V0_guess_id)):16/little,
                (list_to_binary([<<V1_rid1:32/little,
                                   (protocol:pack(string, V1_platform1))/binary,
                                   V1_zone_id1:16/little>>
                                 || {V1_rid1, V1_platform1, V1_zone_id1}
                                        <- V0_guess_id]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20011:16/little,
       D_a_t_a/binary>>};
pack(cli, 20012, {}) ->
    {ok, <<2:32/little, 20012:16/little>>};
pack(srv, 20012,
     {V0_times1,
      V0_times_use1,
      V0_times_all1,
      V0_times2,
      V0_times_use2,
      V0_times_all2}) ->
    D_a_t_a = <<V0_times1:8/little, V0_times_use1:8/little,
                V0_times_all1:8/little, V0_times2:8/little,
                V0_times_use2:8/little, V0_times_all2:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20012:16/little,
       D_a_t_a/binary>>};
pack(cli, 20013, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20013:16/little,
       D_a_t_a/binary>>};
pack(srv, 20013, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20013:16/little,
       D_a_t_a/binary>>};
pack(cli, 20014, {V0_msg}) ->
    D_a_t_a = <<(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20014:16/little,
       D_a_t_a/binary>>};
pack(srv, 20014, {V0_op_code, V0_msg, V0_ids}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary,
                (length(V0_ids)):16/little,
                (list_to_binary([<<V1_group_id1:8/little>>
                                 || V1_group_id1 <- V0_ids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20014:16/little,
       D_a_t_a/binary>>};
pack(cli, 20015,
     {V0_rid1,
      V0_platform1,
      V0_zone_id1,
      V0_rid2,
      V0_platform2,
      V0_zone_id2}) ->
    D_a_t_a = <<V0_rid1:32/little,
                (protocol:pack(string, V0_platform1))/binary,
                V0_zone_id1:16/little, V0_rid2:32/little,
                (protocol:pack(string, V0_platform2))/binary,
                V0_zone_id2:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20015:16/little,
       D_a_t_a/binary>>};
pack(srv, 20015,
     {{V0_rid1, V0_platform1, V0_zone_id1},
      V0_num1,
      V0_odds1,
      {V0_rid2, V0_platform2, V0_zone_id2},
      V0_num2,
      V0_odds2}) ->
    D_a_t_a = <<V0_rid1:32/little,
                (protocol:pack(string, V0_platform1))/binary,
                V0_zone_id1:32/little, V0_num1:32/little,
                V0_odds1:16/little, V0_rid2:32/little,
                (protocol:pack(string, V0_platform2))/binary,
                V0_zone_id2:32/little, V0_num2:32/little,
                V0_odds2:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20015:16/little,
       D_a_t_a/binary>>};
pack(cli, 20016,
     {V0_rid1, V0_platform1, V0_zone_id1, V0_grade}) ->
    D_a_t_a = <<V0_rid1:32/little,
                (protocol:pack(string, V0_platform1))/binary,
                V0_zone_id1:16/little, V0_grade:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20016:16/little,
       D_a_t_a/binary>>};
pack(srv, 20016, {V0_op_code, V0_msg}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20016:16/little,
       D_a_t_a/binary>>};
pack(cli, 20018, {}) ->
    {ok, <<2:32/little, 20018:16/little>>};
pack(srv, 20018, {V0_group_id, V0_num}) ->
    D_a_t_a = <<V0_group_id:16/little, V0_num:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20018:16/little,
       D_a_t_a/binary>>};
pack(cli, 20019, {}) ->
    {ok, <<2:32/little, 20019:16/little>>};
pack(srv, 20019,
     {#gold_league{id = {V0_rid, V0_platform, V0_zone_id},
                   name = V0_name, classes = V0_classes, sex = V0_sex,
                   lev = V0_lev, combat_time = V0_combat_time}}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_name))/binary,
                V0_classes:8/little, V0_sex:8/little, V0_lev:16/little,
                V0_combat_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20019:16/little,
       D_a_t_a/binary>>};
pack(cli, 20021, {}) ->
    {ok, <<2:32/little, 20021:16/little>>};
pack(srv, 20021,
     {V0_rid1, V0_platform1, V0_zone_id1, V0_msg}) ->
    D_a_t_a = <<V0_rid1:32/little,
                (protocol:pack(string, V0_platform1))/binary,
                V0_zone_id1:16/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20021:16/little,
       D_a_t_a/binary>>};
pack(cli, 20022, {}) ->
    {ok, <<2:32/little, 20022:16/little>>};
pack(srv, 20022, {V0_gold_league_combat}) ->
    D_a_t_a = <<(length(V0_gold_league_combat)):16/little,
                (list_to_binary([<<V1_rid1:32/little,
                                   (protocol:pack(string, V1_platform1))/binary,
                                   V1_zone_id1:32/little,
                                   (protocol:pack(string,
                                                  V1_first_name))/binary,
                                   V1_first_sex:8/little,
                                   V1_first_classes:8/little,
                                   V1_first_lev:16/little, V1_rid2:32/little,
                                   (protocol:pack(string, V1_platform2))/binary,
                                   V1_zone_id2:32/little,
                                   (protocol:pack(string,
                                                  V1_second_name))/binary,
                                   V1_second_sex:8/little,
                                   V1_second_classes:8/little,
                                   V1_second_lev:16/little>>
                                 || #gold_league_combat{first_id =
                                                            {V1_rid1,
                                                             V1_platform1,
                                                             V1_zone_id1},
                                                        first_name =
                                                            V1_first_name,
                                                        first_sex =
                                                            V1_first_sex,
                                                        first_classes =
                                                            V1_first_classes,
                                                        first_lev =
                                                            V1_first_lev,
                                                        second_id =
                                                            {V1_rid2,
                                                             V1_platform2,
                                                             V1_zone_id2},
                                                        second_name =
                                                            V1_second_name,
                                                        second_sex =
                                                            V1_second_sex,
                                                        second_classes =
                                                            V1_second_classes,
                                                        second_lev =
                                                            V1_second_lev}
                                        <- V0_gold_league_combat]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20022:16/little,
       D_a_t_a/binary>>};
pack(cli, 20023, {}) ->
    {ok, <<2:32/little, 20023:16/little>>};
pack(srv, 20023, {V0_gold_league, V0_ids}) ->
    D_a_t_a = <<(length(V0_gold_league)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_classes:8/little, V1_sex:8/little,
                                   V1_group_id:8/little,
                                   (length(V1_looks)):16/little,
                                   (list_to_binary([<<V2_looks_type:32/little,
                                                      V2_looks_mode:32/little,
                                                      V2_looks_val:32/little,
                                                      (protocol:pack(string,
                                                                     V2_looks_str))/binary>>
                                                    || {V2_looks_type,
                                                        V2_looks_mode,
                                                        V2_looks_val,
                                                        V2_looks_str}
                                                           <- V1_looks]))/binary>>
                                 || #gold_league{id =
                                                     {V1_rid,
                                                      V1_platform,
                                                      V1_zone_id},
                                                 name = V1_name,
                                                 classes = V1_classes,
                                                 sex = V1_sex,
                                                 group_id = V1_group_id,
                                                 looks = V1_looks}
                                        <- V0_gold_league]))/binary,
                (length(V0_ids)):16/little,
                (list_to_binary([<<V1_group_id1:8/little>>
                                 || V1_group_id1 <- V0_ids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20023:16/little,
       D_a_t_a/binary>>};
pack(cli, 20024, {}) ->
    {ok, <<2:32/little, 20024:16/little>>};
pack(srv, 20024, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20024:16/little,
       D_a_t_a/binary>>};
pack(cli, 20025, {}) ->
    {ok, <<2:32/little, 20025:16/little>>};
pack(srv, 20025, {V0_op_code, V0_msg}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20025:16/little,
       D_a_t_a/binary>>};
pack(cli, 20026, {}) ->
    {ok, <<2:32/little, 20026:16/little>>};
pack(srv, 20026, {V0_msg, V0_ids}) ->
    D_a_t_a = <<(protocol:pack(string, V0_msg))/binary,
                (length(V0_ids)):16/little,
                (list_to_binary([<<V1_group_id1:8/little>>
                                 || V1_group_id1 <- V0_ids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20026:16/little,
       D_a_t_a/binary>>};
pack(cli, 20027,
     {V0_rid1,
      V0_platform1,
      V0_zone_id1,
      V0_rid2,
      V0_platform2,
      V0_zone_id2}) ->
    D_a_t_a = <<V0_rid1:32/little,
                (protocol:pack(string, V0_platform1))/binary,
                V0_zone_id1:32/little, V0_rid2:32/little,
                (protocol:pack(string, V0_platform2))/binary,
                V0_zone_id2:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20027:16/little,
       D_a_t_a/binary>>};
pack(srv, 20027, {V0_op_code, V0_msg}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 20027:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 20000, _B0) -> {ok, {}};
unpack(cli, 20000, _B0) ->
    {V1_phase, _B1} = protocol:uint8(_B0),
    {V1_time, _B2} = protocol:uint32(_B1),
    {V1_now_round, _B3} = protocol:uint8(_B2),
    {V1_max_round, _B4} = protocol:uint8(_B3),
    {V1_ids, _B8} = protocol:array(_B4,
                                   fun (_B5) ->
                                           {V2_group_id1, _B6} =
                                               protocol:uint8(_B5),
                                           {{V2_group_id1}, _B6}
                                   end),
    {ok,
     {V1_phase,
      V1_time,
      V1_now_round,
      V1_max_round,
      V1_ids}};
unpack(srv, 20001, _B0) -> {ok, {}};
unpack(cli, 20001, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_op_code, V1_msg}};
unpack(srv, 20002, _B0) -> {ok, {}};
unpack(cli, 20002, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_op_code, V1_msg}};
unpack(srv, 20003, _B0) -> {ok, {}};
unpack(cli, 20003, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_op_code, V1_msg}};
unpack(srv, 20006, _B0) -> {ok, {}};
unpack(cli, 20006, _B0) ->
    {V1_is_win, _B1} = protocol:uint8(_B0),
    {V1_score, _B2} = protocol:uint16(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {V1_reward, _B8} = protocol:array(_B3,
                                      fun (_B4) ->
                                              {V2_assets, _B5} =
                                                  protocol:uint32(_B4),
                                              {V2_val, _B6} =
                                                  protocol:uint32(_B5),
                                              {{V2_assets, V2_val}, _B6}
                                      end),
    {ok, {V1_is_win, V1_score, V1_msg, V1_reward}};
unpack(srv, 20007, _B0) -> {ok, {}};
unpack(cli, 20007, _B0) ->
    {V1_score, _B1} = protocol:uint16(_B0),
    {V1_win, _B2} = protocol:uint8(_B1),
    {V1_lose, _B3} = protocol:uint8(_B2),
    {V1_rank, _B4} = protocol:uint8(_B3),
    {V1_reward, _B9} = protocol:array(_B4,
                                      fun (_B5) ->
                                              {V2_assets, _B6} =
                                                  protocol:uint32(_B5),
                                              {V2_val, _B7} =
                                                  protocol:uint32(_B6),
                                              {{V2_assets, V2_val}, _B7}
                                      end),
    {ok, {V1_score, V1_win, V1_lose, V1_rank, V1_reward}};
unpack(srv, 20008, _B0) -> {ok, {}};
unpack(cli, 20008, _B0) ->
    {V1_gold_league, _B13} = protocol:array(_B0,
                                            fun (_B1) ->
                                                    {V2_rid, _B2} =
                                                        protocol:uint32(_B1),
                                                    {V2_platform, _B3} =
                                                        protocol:string(_B2),
                                                    {V2_zone_id, _B4} =
                                                        protocol:uint32(_B3),
                                                    {V2_name, _B5} =
                                                        protocol:string(_B4),
                                                    {V2_classes, _B6} =
                                                        protocol:uint8(_B5),
                                                    {V2_sex, _B7} =
                                                        protocol:uint8(_B6),
                                                    {V2_rank, _B8} =
                                                        protocol:uint8(_B7),
                                                    {V2_score, _B9} =
                                                        protocol:uint32(_B8),
                                                    {V2_is_rise, _B10} =
                                                        protocol:uint8(_B9),
                                                    {V2_win, _B11} =
                                                        protocol:uint8(_B10),
                                                    {{V2_rid,
                                                      V2_platform,
                                                      V2_zone_id,
                                                      V2_name,
                                                      V2_classes,
                                                      V2_sex,
                                                      V2_rank,
                                                      V2_score,
                                                      V2_is_rise,
                                                      V2_win},
                                                     _B11}
                                            end),
    {V1_num, _B14} = protocol:uint16(_B13),
    {ok, {V1_gold_league, V1_num}};
unpack(srv, 20009, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 20009, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_op_code, V1_msg}};
unpack(srv, 20010, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 20010, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_op_code, V1_msg}};
unpack(srv, 20011, _B0) -> {ok, {}};
unpack(cli, 20011, _B0) ->
    {V1_group_id, _B1} = protocol:uint8(_B0),
    {V1_gold_league, _B17} = protocol:array(_B1,
                                            fun (_B2) ->
                                                    {V2_rid, _B3} =
                                                        protocol:uint32(_B2),
                                                    {V2_platform, _B4} =
                                                        protocol:string(_B3),
                                                    {V2_zone_id, _B5} =
                                                        protocol:uint32(_B4),
                                                    {V2_name, _B6} =
                                                        protocol:string(_B5),
                                                    {V2_classes, _B7} =
                                                        protocol:uint8(_B6),
                                                    {V2_sex, _B8} =
                                                        protocol:uint8(_B7),
                                                    {V2_rank, _B9} =
                                                        protocol:uint8(_B8),
                                                    {V2_score, _B10} =
                                                        protocol:uint32(_B9),
                                                    {V2_pos, _B11} =
                                                        protocol:uint16(_B10),
                                                    {V2_is_lose, _B12} =
                                                        protocol:uint8(_B11),
                                                    {V2_lose_round, _B13} =
                                                        protocol:uint8(_B12),
                                                    {V2_group_id, _B14} =
                                                        protocol:uint16(_B13),
                                                    {V2_is_combat, _B15} =
                                                        protocol:uint8(_B14),
                                                    {{V2_rid,
                                                      V2_platform,
                                                      V2_zone_id,
                                                      V2_name,
                                                      V2_classes,
                                                      V2_sex,
                                                      V2_rank,
                                                      V2_score,
                                                      V2_pos,
                                                      V2_is_lose,
                                                      V2_lose_round,
                                                      V2_group_id,
                                                      V2_is_combat},
                                                     _B15}
                                            end),
    {V1_guess_id, _B23} = protocol:array(_B17,
                                         fun (_B18) ->
                                                 {V2_rid1, _B19} =
                                                     protocol:uint32(_B18),
                                                 {V2_platform1, _B20} =
                                                     protocol:string(_B19),
                                                 {V2_zone_id1, _B21} =
                                                     protocol:uint16(_B20),
                                                 {{V2_rid1,
                                                   V2_platform1,
                                                   V2_zone_id1},
                                                  _B21}
                                         end),
    {ok, {V1_group_id, V1_gold_league, V1_guess_id}};
unpack(srv, 20012, _B0) -> {ok, {}};
unpack(cli, 20012, _B0) ->
    {V1_times1, _B1} = protocol:uint8(_B0),
    {V1_times_use1, _B2} = protocol:uint8(_B1),
    {V1_times_all1, _B3} = protocol:uint8(_B2),
    {V1_times2, _B4} = protocol:uint8(_B3),
    {V1_times_use2, _B5} = protocol:uint8(_B4),
    {V1_times_all2, _B6} = protocol:uint8(_B5),
    {ok,
     {V1_times1,
      V1_times_use1,
      V1_times_all1,
      V1_times2,
      V1_times_use2,
      V1_times_all2}};
unpack(srv, 20013, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(cli, 20013, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(srv, 20014, _B0) ->
    {V1_msg, _B1} = protocol:string(_B0),
    {ok, {V1_msg}};
unpack(cli, 20014, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_ids, _B6} = protocol:array(_B2,
                                   fun (_B3) ->
                                           {V2_group_id1, _B4} =
                                               protocol:uint8(_B3),
                                           {{V2_group_id1}, _B4}
                                   end),
    {ok, {V1_op_code, V1_msg, V1_ids}};
unpack(srv, 20015, _B0) ->
    {V1_rid1, _B1} = protocol:uint32(_B0),
    {V1_platform1, _B2} = protocol:string(_B1),
    {V1_zone_id1, _B3} = protocol:uint16(_B2),
    {V1_rid2, _B4} = protocol:uint32(_B3),
    {V1_platform2, _B5} = protocol:string(_B4),
    {V1_zone_id2, _B6} = protocol:uint16(_B5),
    {ok,
     {V1_rid1,
      V1_platform1,
      V1_zone_id1,
      V1_rid2,
      V1_platform2,
      V1_zone_id2}};
unpack(cli, 20015, _B0) ->
    {V1_rid1, _B1} = protocol:uint32(_B0),
    {V1_platform1, _B2} = protocol:string(_B1),
    {V1_zone_id1, _B3} = protocol:uint32(_B2),
    {V1_num1, _B4} = protocol:uint32(_B3),
    {V1_odds1, _B5} = protocol:uint16(_B4),
    {V1_rid2, _B6} = protocol:uint32(_B5),
    {V1_platform2, _B7} = protocol:string(_B6),
    {V1_zone_id2, _B8} = protocol:uint32(_B7),
    {V1_num2, _B9} = protocol:uint32(_B8),
    {V1_odds2, _B10} = protocol:uint16(_B9),
    {ok,
     {V1_rid1,
      V1_platform1,
      V1_zone_id1,
      V1_num1,
      V1_odds1,
      V1_rid2,
      V1_platform2,
      V1_zone_id2,
      V1_num2,
      V1_odds2}};
unpack(srv, 20016, _B0) ->
    {V1_rid1, _B1} = protocol:uint32(_B0),
    {V1_platform1, _B2} = protocol:string(_B1),
    {V1_zone_id1, _B3} = protocol:uint16(_B2),
    {V1_grade, _B4} = protocol:uint8(_B3),
    {ok, {V1_rid1, V1_platform1, V1_zone_id1, V1_grade}};
unpack(cli, 20016, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_op_code, V1_msg}};
unpack(srv, 20018, _B0) -> {ok, {}};
unpack(cli, 20018, _B0) ->
    {V1_group_id, _B1} = protocol:uint16(_B0),
    {V1_num, _B2} = protocol:uint16(_B1),
    {ok, {V1_group_id, V1_num}};
unpack(srv, 20019, _B0) -> {ok, {}};
unpack(cli, 20019, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_classes, _B5} = protocol:uint8(_B4),
    {V1_sex, _B6} = protocol:uint8(_B5),
    {V1_lev, _B7} = protocol:uint16(_B6),
    {V1_combat_time, _B8} = protocol:uint32(_B7),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_classes,
      V1_sex,
      V1_lev,
      V1_combat_time}};
unpack(srv, 20021, _B0) -> {ok, {}};
unpack(cli, 20021, _B0) ->
    {V1_rid1, _B1} = protocol:uint32(_B0),
    {V1_platform1, _B2} = protocol:string(_B1),
    {V1_zone_id1, _B3} = protocol:uint16(_B2),
    {V1_msg, _B4} = protocol:string(_B3),
    {ok, {V1_rid1, V1_platform1, V1_zone_id1, V1_msg}};
unpack(srv, 20022, _B0) -> {ok, {}};
unpack(cli, 20022, _B0) ->
    {V1_gold_league_combat, _B17} = protocol:array(_B0,
                                                   fun (_B1) ->
                                                           {V2_rid1, _B2} =
                                                               protocol:uint32(_B1),
                                                           {V2_platform1, _B3} =
                                                               protocol:string(_B2),
                                                           {V2_zone_id1, _B4} =
                                                               protocol:uint32(_B3),
                                                           {V2_first_name,
                                                            _B5} =
                                                               protocol:string(_B4),
                                                           {V2_first_sex, _B6} =
                                                               protocol:uint8(_B5),
                                                           {V2_first_classes,
                                                            _B7} =
                                                               protocol:uint8(_B6),
                                                           {V2_first_lev, _B8} =
                                                               protocol:uint16(_B7),
                                                           {V2_rid2, _B9} =
                                                               protocol:uint32(_B8),
                                                           {V2_platform2,
                                                            _B10} =
                                                               protocol:string(_B9),
                                                           {V2_zone_id2, _B11} =
                                                               protocol:uint32(_B10),
                                                           {V2_second_name,
                                                            _B12} =
                                                               protocol:string(_B11),
                                                           {V2_second_sex,
                                                            _B13} =
                                                               protocol:uint8(_B12),
                                                           {V2_second_classes,
                                                            _B14} =
                                                               protocol:uint8(_B13),
                                                           {V2_second_lev,
                                                            _B15} =
                                                               protocol:uint16(_B14),
                                                           {{V2_rid1,
                                                             V2_platform1,
                                                             V2_zone_id1,
                                                             V2_first_name,
                                                             V2_first_sex,
                                                             V2_first_classes,
                                                             V2_first_lev,
                                                             V2_rid2,
                                                             V2_platform2,
                                                             V2_zone_id2,
                                                             V2_second_name,
                                                             V2_second_sex,
                                                             V2_second_classes,
                                                             V2_second_lev},
                                                            _B15}
                                                   end),
    {ok, {V1_gold_league_combat}};
unpack(srv, 20023, _B0) -> {ok, {}};
unpack(cli, 20023, _B0) ->
    {V1_gold_league, _B17} = protocol:array(_B0,
                                            fun (_B1) ->
                                                    {V2_rid, _B2} =
                                                        protocol:uint32(_B1),
                                                    {V2_platform, _B3} =
                                                        protocol:string(_B2),
                                                    {V2_zone_id, _B4} =
                                                        protocol:uint32(_B3),
                                                    {V2_name, _B5} =
                                                        protocol:string(_B4),
                                                    {V2_classes, _B6} =
                                                        protocol:uint8(_B5),
                                                    {V2_sex, _B7} =
                                                        protocol:uint8(_B6),
                                                    {V2_group_id, _B8} =
                                                        protocol:uint8(_B7),
                                                    {V2_looks, _B15} =
                                                        protocol:array(_B8,
                                                                       fun
                                                                           (_B9) ->
                                                                               {V3_looks_type,
                                                                                _B10} =
                                                                                   protocol:uint32(_B9),
                                                                               {V3_looks_mode,
                                                                                _B11} =
                                                                                   protocol:uint32(_B10),
                                                                               {V3_looks_val,
                                                                                _B12} =
                                                                                   protocol:uint32(_B11),
                                                                               {V3_looks_str,
                                                                                _B13} =
                                                                                   protocol:string(_B12),
                                                                               {{V3_looks_type,
                                                                                 V3_looks_mode,
                                                                                 V3_looks_val,
                                                                                 V3_looks_str},
                                                                                _B13}
                                                                       end),
                                                    {{V2_rid,
                                                      V2_platform,
                                                      V2_zone_id,
                                                      V2_name,
                                                      V2_classes,
                                                      V2_sex,
                                                      V2_group_id,
                                                      V2_looks},
                                                     _B15}
                                            end),
    {V1_ids, _B21} = protocol:array(_B17,
                                    fun (_B18) ->
                                            {V2_group_id1, _B19} =
                                                protocol:uint8(_B18),
                                            {{V2_group_id1}, _B19}
                                    end),
    {ok, {V1_gold_league, V1_ids}};
unpack(srv, 20024, _B0) -> {ok, {}};
unpack(cli, 20024, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(srv, 20025, _B0) -> {ok, {}};
unpack(cli, 20025, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_op_code, V1_msg}};
unpack(srv, 20026, _B0) -> {ok, {}};
unpack(cli, 20026, _B0) ->
    {V1_msg, _B1} = protocol:string(_B0),
    {V1_ids, _B5} = protocol:array(_B1,
                                   fun (_B2) ->
                                           {V2_group_id1, _B3} =
                                               protocol:uint8(_B2),
                                           {{V2_group_id1}, _B3}
                                   end),
    {ok, {V1_msg, V1_ids}};
unpack(srv, 20027, _B0) ->
    {V1_rid1, _B1} = protocol:uint32(_B0),
    {V1_platform1, _B2} = protocol:string(_B1),
    {V1_zone_id1, _B3} = protocol:uint32(_B2),
    {V1_rid2, _B4} = protocol:uint32(_B3),
    {V1_platform2, _B5} = protocol:string(_B4),
    {V1_zone_id2, _B6} = protocol:uint32(_B5),
    {ok,
     {V1_rid1,
      V1_platform1,
      V1_zone_id1,
      V1_rid2,
      V1_platform2,
      V1_zone_id2}};
unpack(cli, 20027, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_op_code, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

