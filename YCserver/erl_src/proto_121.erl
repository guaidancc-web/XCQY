-file("src/proto/proto_121.erl", 1).

-module(proto_121).

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

-file("src/proto/proto_121.erl", 14).

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

-file("src/proto/proto_121.erl", 15).

-file("inc/dungeon.hrl", 1).

-record(m_dungeon,
        {ver = 4,
         dun_id = 0,
         battle_id = 0,
         cards = [],
         unit_rewards = [],
         unit_rewarded = 0}).

-record(dungeon_base,
        {id = 0,
         name = "",
         type = 2,
         need_num = 1,
         cond_enter = [],
         cond_loss = [],
         cross_cond_enter = [],
         cross_cond_loss = [],
         exit_pos = last ::
             last |
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         battle_name_list = [],
         lev_interval = 0,
         unit_list = [],
         lev_max = 0,
         team_dungeon = 0}).

-record(dungeon_role_info,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         score_list = [] :: [tuple()]}).

-record(dungeon_unit_count, {id = 0, num = 0}).

-record(dungeon_score,
        {id = 0,
         score = 0 :: non_neg_integer(),
         grade = 1 :: pos_integer()}).

-record(dungeon_lord_data,
        {unit_id = 0,
         id = 0,
         floor = 0,
         map_id = 0,
         is_lord = 0,
         msg = ""}).

-record(dungeon_lord,
        {key = {0, 0},
         dun_id = 0,
         floor = 0,
         lords = [],
         ranks = []}).

-record(dungeon_lord_role,
        {id,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer(),
         looks = []}).

-record(dungeon_rank_role,
        {id,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer(),
         fc = 0,
         looks = [],
         up = 1,
         rank = 0,
         val1 = 0,
         val2 = 0,
         val3 = 0,
         val4 = 0,
         msg1 = "",
         msg2 = "",
         msg3 = ""}).

-record(dungeon_first,
        {key = {0, 0}, dun_id = 0, floor = 0, roles = []}).

-record(dungeon_first_role,
        {id,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer()}).

-record(dungeon_reward_data,
        {id = 0,
         floor = 0,
         type = 0,
         item_list = [],
         title = "",
         msg = "",
         cast_msg = ""}).

-record(dungeon_team,
        {id = {0, "", 0} :: tuple(),
         leader :: undefined | tuple(),
         members = [] :: list(),
         member_num = 1 :: non_neg_integer(),
         dun_id = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         kicked = [] :: list()}).

-record(dungeon_enlistment,
        {id = {0, "", 0} :: tuple(),
         member_num = 1 :: non_neg_integer(),
         dun_id = 0 :: non_neg_integer(),
         leader :: undefined | tuple()}).

-record(dungeon_mate,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         pid :: undefined | pid(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         status = 3 :: non_neg_integer(),
         looks = [] :: list(),
         fc = 0 :: non_neg_integer(),
         dun_id = 0 :: non_neg_integer(),
         team_id = {0, "", 0} :: tuple(),
         matched = 0 :: non_neg_integer(),
         join_time = 0 :: non_neg_integer(),
         origin_ids = [] :: list()}).

-record(dungeon_invitation,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         type = 1,
         team_id = {0, "", 0},
         dun_id = 0,
         dun_name = "",
         time = 0}).

-record(dungeon_card,
        {item_id = 0,
         item_num = 0,
         announce = 0,
         selected = 0}).

-file("src/proto/proto_121.erl", 16).

-file("inc/battle.hrl", 1).

-record(battle_base,
        {id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         sub_id = 0,
         sub_type = 0,
         name :: undefined | atom(),
         pid :: undefined | undefine | pid(),
         global = [] :: list(),
         map = [] :: list(),
         unit = [] :: list(),
         point = [] :: list(),
         trigger = [] :: list(),
         enter_point = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()}}).

-record(battle,
        {id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         sub_id = 0,
         sub_type = 0,
         name :: undefined | atom(),
         pid :: undefined | undefine | pid(),
         map = [] :: list(),
         enter_point = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         ext = [],
         role_id = {0, "", 0}}).

-record(battle_context,
        {grade = 1 :: pos_integer(),
         score = 0 :: non_neg_integer(),
         round = 0 :: non_neg_integer(),
         max_dmg = 0 :: non_neg_integer(),
         hurt = 0 :: non_neg_integer(),
         ratio_val = 0,
         die_num = 0}).

-record(battle_role,
        {id,
         status = 1,
         pid,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer(),
         is_kill_boss = 0 :: 0..1,
         sub_id = 0 :: non_neg_integer(),
         flip_cards = [] :: [],
         has_reward_floor = [],
         context = #battle_context{}}).

-record(battle_combat_info,
        {sub_id = 0, sub_type = 0, gains = []}).

-record(battle_trigger,
        {name :: undefined | bitstring(),
         status = open :: open | close,
         event = [] :: [tuple()],
         vars = [] :: [tuple()],
         condition = [] :: [tuple()],
         action = [] :: list()}).

-record(tri_timer,
        {mode :: undefined | cycle | count,
         times = 0 :: integer(),
         timeout = 1000 :: pos_integer()}).

-record(cfg_act,
        {tpl :: undefined | atom(), cfg = [] :: list()}).

-record(tpl_act,
        {name = "" :: string(),
         type :: undefined | atom(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_cond,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_cond,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_evt,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_evt,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_val,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_val,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_unit,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_unit,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(point,
        {map = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(tpl_fun,
        {name :: undefined | atom(),
         return :: undefined | unit | point,
         args = [] :: [atom()],
         code = "" :: string(),
         mfa_code = "" :: string(),
         label = "" :: string(),
         desc = "" :: string()}).

-file("src/proto/proto_121.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 12100, {V0_dun_id, V0_battle_flag}) ->
    D_a_t_a = <<V0_dun_id:32/little,
                V0_battle_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12100:16/little,
       D_a_t_a/binary>>};
pack(srv, 12100, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12100:16/little,
       D_a_t_a/binary>>};
pack(cli, 12101, {}) ->
    {ok, <<2:32/little, 12101:16/little>>};
pack(srv, 12101, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12101:16/little,
       D_a_t_a/binary>>};
pack(cli, 12102, {}) ->
    {ok, <<2:32/little, 12102:16/little>>};
pack(srv, 12102, {}) ->
    {ok, <<2:32/little, 12102:16/little>>};
pack(cli, 12103, {}) ->
    {ok, <<2:32/little, 12103:16/little>>};
pack(srv, 12103, {V0_id, V0_unit_id, V0_extra}) ->
    D_a_t_a = <<V0_id:32/little,
                (length(V0_unit_id)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_num:8/little>>
                                 || {V1_base_id, V1_num}
                                        <- V0_unit_id]))/binary,
                (length(V0_extra)):16/little,
                (list_to_binary([<<V1_key:32/little, V1_val_1:32/little,
                                   V1_val_2:32/little,
                                   (protocol:pack(string, V1_str_1))/binary,
                                   (protocol:pack(string, V1_str_2))/binary>>
                                 || {V1_key,
                                     V1_val_1,
                                     V1_val_2,
                                     V1_str_1,
                                     V1_str_2}
                                        <- V0_extra]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12103:16/little,
       D_a_t_a/binary>>};
pack(cli, 12104, {}) ->
    {ok, <<2:32/little, 12104:16/little>>};
pack(srv, 12104, {V0_id, V0_unit_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (length(V0_unit_id)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_num:8/little>>
                                 || {V1_base_id, V1_num}
                                        <- V0_unit_id]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12104:16/little,
       D_a_t_a/binary>>};
pack(cli, 12110, {}) ->
    {ok, <<2:32/little, 12110:16/little>>};
pack(srv, 12110,
     {#battle_context{grade = V0_grade, score = V0_score,
                      max_dmg = V0_max_dmg, round = V0_round, hurt = V0_hurt},
      V0_time,
      V0_dun_id,
      V0_floor}) ->
    D_a_t_a = <<V0_grade:8/little, V0_score:32/little,
                V0_max_dmg:32/little, V0_round:16/little,
                V0_hurt:32/little, V0_time:8/little,
                V0_dun_id:32/little, V0_floor:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12110:16/little,
       D_a_t_a/binary>>};
pack(cli, 12111, {V0_pos}) ->
    D_a_t_a = <<V0_pos:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12111:16/little,
       D_a_t_a/binary>>};
pack(srv, 12111,
     {V0_pos,
      V0_base_id,
      V0_num,
      {V0_rid, V0_platform, V0_zone_id},
      V0_name,
      V0_msg}) ->
    D_a_t_a = <<V0_pos:8/little, V0_base_id:32/little,
                V0_num:32/little, V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_name))/binary,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12111:16/little,
       D_a_t_a/binary>>};
pack(cli, 12112, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12112:16/little,
       D_a_t_a/binary>>};
pack(srv, 12112, {V0_id, V0_unit_reward}) ->
    D_a_t_a = <<V0_id:32/little,
                (length(V0_unit_reward)):16/little,
                (list_to_binary([<<V1_unit_base_id:32/little,
                                   V1_num:8/little>>
                                 || {V1_unit_base_id, V1_num}
                                        <- V0_unit_reward]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12112:16/little,
       D_a_t_a/binary>>};
pack(cli, 12114, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12114:16/little,
       D_a_t_a/binary>>};
pack(srv, 12114, {V0_id, V0_floor_cound, V0_time}) ->
    D_a_t_a = <<V0_id:32/little,
                (length(V0_floor_cound)):16/little,
                (list_to_binary([<<V1_floor:8/little, V1_num:8/little>>
                                 || {V1_floor, V1_num}
                                        <- V0_floor_cound]))/binary,
                V0_time:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12114:16/little,
       D_a_t_a/binary>>};
pack(cli, 12116, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12116:16/little,
       D_a_t_a/binary>>};
pack(srv, 12116, {V0_flag, V0_msg, V0_id, V0_time}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary, V0_id:32/little,
                V0_time:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12116:16/little,
       D_a_t_a/binary>>};
pack(cli, 12117, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12117:16/little,
       D_a_t_a/binary>>};
pack(srv, 12117, {V0_id, V0_floor_list}) ->
    D_a_t_a = <<V0_id:32/little,
                (length(V0_floor_list)):16/little,
                (list_to_binary([<<V1_floor:8/little,
                                   V1_status:8/little>>
                                 || {V1_floor, V1_status}
                                        <- V0_floor_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12117:16/little,
       D_a_t_a/binary>>};
pack(cli, 12118, {}) ->
    {ok, <<2:32/little, 12118:16/little>>};
pack(srv, 12118, {V0_gain}) ->
    D_a_t_a = <<(length(V0_gain)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_value:32/little>>
                                 || {V1_id, V1_value} <- V0_gain]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12118:16/little,
       D_a_t_a/binary>>};
pack(cli, 12119, {V0_id, V0_floor}) ->
    D_a_t_a = <<V0_id:32/little, V0_floor:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12119:16/little,
       D_a_t_a/binary>>};
pack(srv, 12119, {V0_flag, V0_msg, V0_id, V0_floor}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary, V0_id:32/little,
                V0_floor:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12119:16/little,
       D_a_t_a/binary>>};
pack(cli, 12120, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_base_id:32/little>>
                                 || {V1_base_id} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12120:16/little,
       D_a_t_a/binary>>};
pack(srv, 12120, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_num:32/little>>
                                 || {V1_base_id, V1_num} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12120:16/little,
       D_a_t_a/binary>>};
pack(cli, 12121, {V0_id, V0_floor}) ->
    D_a_t_a = <<V0_id:32/little, V0_floor:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12121:16/little,
       D_a_t_a/binary>>};
pack(srv, 12121, {V0_id, V0_floor, V0_list}) ->
    D_a_t_a = <<V0_id:32/little, V0_floor:8/little,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:32/little, V1_classes:32/little,
                                   V1_lev:32/little, V1_fc:32/little,
                                   V1_rank:32/little, V1_val1:32/little,
                                   V1_val2:32/little, V1_val3:32/little,
                                   V1_val4:32/little,
                                   (protocol:pack(string, V1_msg1))/binary,
                                   (protocol:pack(string, V1_msg2))/binary,
                                   (protocol:pack(string, V1_msg3))/binary>>
                                 || #dungeon_rank_role{id =
                                                           {V1_rid,
                                                            V1_platform,
                                                            V1_zone_id},
                                                       name = V1_name,
                                                       sex = V1_sex,
                                                       classes = V1_classes,
                                                       lev = V1_lev, fc = V1_fc,
                                                       rank = V1_rank,
                                                       val1 = V1_val1,
                                                       val2 = V1_val2,
                                                       val3 = V1_val3,
                                                       val4 = V1_val4,
                                                       msg1 = V1_msg1,
                                                       msg2 = V1_msg2,
                                                       msg3 = V1_msg3}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12121:16/little,
       D_a_t_a/binary>>};
pack(cli, 12122, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12122:16/little,
       D_a_t_a/binary>>};
pack(srv, 12122, {V0_id, V0_floor}) ->
    D_a_t_a = <<V0_id:32/little, V0_floor:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12122:16/little,
       D_a_t_a/binary>>};
pack(cli, 12123, {}) ->
    {ok, <<2:32/little, 12123:16/little>>};
pack(srv, 12123, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_key:32/little, V1_val_1:32/little,
                                   V1_val_2:32/little, V1_val_3:32/little,
                                   V1_val_4:32/little,
                                   (protocol:pack(string, V1_str_1))/binary,
                                   (protocol:pack(string, V1_str_2))/binary>>
                                 || {V1_key,
                                     V1_val_1,
                                     V1_val_2,
                                     V1_val_3,
                                     V1_val_4,
                                     V1_str_1,
                                     V1_str_2}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12123:16/little,
       D_a_t_a/binary>>};
pack(cli, 12130, {}) ->
    {ok, <<2:32/little, 12130:16/little>>};
pack(srv, 12130,
     #dungeon_team{id =
                       {V0_team_id, V0_team_platform, V0_team_zone_id},
                   dun_id = V0_dun_id, status = V0_status,
                   members = V0_members}) ->
    D_a_t_a = <<V0_team_id:32/little,
                (protocol:pack(string, V0_team_platform))/binary,
                V0_team_zone_id:32/little, V0_dun_id:32/little,
                V0_status:8/little, (length(V0_members)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:8/little, V1_face_id:32/little,
                                   V1_status:8/little,
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
                                 || #dungeon_mate{id =
                                                      {V1_rid,
                                                       V1_platform,
                                                       V1_zone_id},
                                                  name = V1_name, sex = V1_sex,
                                                  classes = V1_classes,
                                                  lev = V1_lev,
                                                  face_id = V1_face_id,
                                                  status = V1_status,
                                                  looks = V1_looks}
                                        <- V0_members]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12130:16/little,
       D_a_t_a/binary>>};
pack(cli, 12131, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12131:16/little,
       D_a_t_a/binary>>};
pack(srv, 12131, {V0_dun_id, V0_list}) ->
    D_a_t_a = <<V0_dun_id:32/little,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_team_id:32/little,
                                   (protocol:pack(string,
                                                  V1_team_platform))/binary,
                                   V1_team_zone_id:32/little, V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:32/little, V1_classes:32/little,
                                   V1_lev:32/little, V1_face_id:32/little,
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
                                                           <- V1_looks]))/binary,
                                   V1_member_num:8/little>>
                                 || #dungeon_enlistment{id =
                                                            {V1_team_id,
                                                             V1_team_platform,
                                                             V1_team_zone_id},
                                                        leader =
                                                            #dungeon_mate{id =
                                                                              {V1_rid,
                                                                               V1_platform,
                                                                               V1_zone_id},
                                                                          name =
                                                                              V1_name,
                                                                          sex =
                                                                              V1_sex,
                                                                          classes
                                                                              =
                                                                              V1_classes,
                                                                          lev =
                                                                              V1_lev,
                                                                          face_id
                                                                              =
                                                                              V1_face_id,
                                                                          looks
                                                                              =
                                                                              V1_looks},
                                                        member_num =
                                                            V1_member_num}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12131:16/little,
       D_a_t_a/binary>>};
pack(cli, 12132, {V0_dun_id}) ->
    D_a_t_a = <<V0_dun_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12132:16/little,
       D_a_t_a/binary>>};
pack(srv, 12132, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12132:16/little,
       D_a_t_a/binary>>};
pack(cli, 12133, {}) ->
    {ok, <<2:32/little, 12133:16/little>>};
pack(srv, 12133, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12133:16/little,
       D_a_t_a/binary>>};
pack(cli, 12134, {V0_dun_id}) ->
    D_a_t_a = <<V0_dun_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12134:16/little,
       D_a_t_a/binary>>};
pack(srv, 12134, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12134:16/little,
       D_a_t_a/binary>>};
pack(cli, 12135, {}) ->
    {ok, <<2:32/little, 12135:16/little>>};
pack(srv, 12135, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12135:16/little,
       D_a_t_a/binary>>};
pack(cli, 12136,
     {V0_id, V0_platform, V0_zone_id, V0_dun_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_dun_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12136:16/little,
       D_a_t_a/binary>>};
pack(srv, 12136, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12136:16/little,
       D_a_t_a/binary>>};
pack(cli, 12137, {}) ->
    {ok, <<2:32/little, 12137:16/little>>};
pack(srv, 12137, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12137:16/little,
       D_a_t_a/binary>>};
pack(cli, 12138, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12138:16/little,
       D_a_t_a/binary>>};
pack(srv, 12138, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12138:16/little,
       D_a_t_a/binary>>};
pack(cli, 12139, {}) ->
    {ok, <<2:32/little, 12139:16/little>>};
pack(srv, 12139, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12139:16/little,
       D_a_t_a/binary>>};
pack(cli, 12140, {}) ->
    {ok, <<2:32/little, 12140:16/little>>};
pack(srv, 12140, {V0_is_matching, V0_dun_id}) ->
    D_a_t_a = <<V0_is_matching:8/little,
                V0_dun_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12140:16/little,
       D_a_t_a/binary>>};
pack(cli, 12141, {}) ->
    {ok, <<2:32/little, 12141:16/little>>};
pack(srv, 12141, {V0_members}) ->
    D_a_t_a = <<(length(V0_members)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:8/little, V1_face_id:32/little,
                                   V1_status:8/little,
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
                                 || #dungeon_mate{id =
                                                      {V1_rid,
                                                       V1_platform,
                                                       V1_zone_id},
                                                  name = V1_name, sex = V1_sex,
                                                  classes = V1_classes,
                                                  lev = V1_lev,
                                                  face_id = V1_face_id,
                                                  status = V1_status,
                                                  looks = V1_looks}
                                        <- V0_members]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12141:16/little,
       D_a_t_a/binary>>};
pack(cli, 12142, {}) ->
    {ok, <<2:32/little, 12142:16/little>>};
pack(srv, 12142, {V0_members}) ->
    D_a_t_a = <<(length(V0_members)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little>>
                                 || {V1_rid, V1_platform, V1_zone_id}
                                        <- V0_members]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12142:16/little,
       D_a_t_a/binary>>};
pack(cli, 12143, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12143:16/little,
       D_a_t_a/binary>>};
pack(srv, 12143, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12143:16/little,
       D_a_t_a/binary>>};
pack(cli, 12144,
     {V0_rid, V0_platform, V0_zone_id, V0_type}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12144:16/little,
       D_a_t_a/binary>>};
pack(srv, 12144, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12144:16/little,
       D_a_t_a/binary>>};
pack(cli, 12145, {}) ->
    {ok, <<2:32/little, 12145:16/little>>};
pack(srv, 12145,
     {#dungeon_invitation{id =
                              {V0_rid, V0_platform, V0_zone_id},
                          name = V0_name, sex = V0_sex, classes = V0_classes,
                          lev = V0_lev, dun_id = V0_dun_id,
                          dun_name = V0_dun_name, time = V0_time,
                          team_id = {V0_t_id, V0_t_platform, V0_t_zone_id}}}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_sex:8/little, V0_classes:8/little, V0_lev:8/little,
                V0_dun_id:32/little,
                (protocol:pack(string, V0_dun_name))/binary,
                V0_time:32/little, V0_t_id:32/little,
                (protocol:pack(string, V0_t_platform))/binary,
                V0_t_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12145:16/little,
       D_a_t_a/binary>>};
pack(cli, 12146, {}) ->
    {ok, <<2:32/little, 12146:16/little>>};
pack(srv, 12146,
     {V0_dun_id, V0_gain, V0_cards, V0_buy_loss}) ->
    D_a_t_a = <<V0_dun_id:32/little,
                (length(V0_gain)):16/little,
                (list_to_binary([<<V1_g_id:32/little,
                                   V1_value:32/little>>
                                 || {V1_g_id, V1_value} <- V0_gain]))/binary,
                (length(V0_cards)):16/little,
                (list_to_binary([<<V1_item_id:32/little,
                                   V1_item_num:32/little, V1_selected:8/little>>
                                 || #dungeon_card{item_id = V1_item_id,
                                                  item_num = V1_item_num,
                                                  selected = V1_selected}
                                        <- V0_cards]))/binary,
                (length(V0_buy_loss)):16/little,
                (list_to_binary([<<V1_l_id:32/little,
                                   V1_l_value:32/little>>
                                 || {V1_l_id, V1_l_value}
                                        <- V0_buy_loss]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12146:16/little,
       D_a_t_a/binary>>};
pack(cli, 12147, {}) ->
    {ok, <<2:32/little, 12147:16/little>>};
pack(srv, 12147, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12147:16/little,
       D_a_t_a/binary>>};
pack(cli, 12148, {}) ->
    {ok, <<2:32/little, 12148:16/little>>};
pack(srv, 12148, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12148:16/little,
       D_a_t_a/binary>>};
pack(cli, 12149, {V0_dun_id}) ->
    D_a_t_a = <<V0_dun_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12149:16/little,
       D_a_t_a/binary>>};
pack(srv, 12149, {V0_flag, V0_msg, V0_dun_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_dun_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12149:16/little,
       D_a_t_a/binary>>};
pack(cli, 12150, {}) ->
    {ok, <<2:32/little, 12150:16/little>>};
pack(srv, 12150, {V0_pass_list, V0_rewards}) ->
    D_a_t_a = <<(length(V0_pass_list)):16/little,
                (list_to_binary([<<V1_dun_id:32/little,
                                   V1_times:32/little>>
                                 || {V1_dun_id, V1_times}
                                        <- V0_pass_list]))/binary,
                (length(V0_rewards)):16/little,
                (list_to_binary([<<V1_dun_id:32/little,
                                   (length(V1_gains)):16/little,
                                   (list_to_binary([<<V2_gid:32/little,
                                                      V2_value:32/little>>
                                                    || {V2_gid, V2_value}
                                                           <- V1_gains]))/binary>>
                                 || {V1_dun_id, V1_gains}
                                        <- V0_rewards]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12150:16/little,
       D_a_t_a/binary>>};
pack(cli, 12151, {}) ->
    {ok, <<2:32/little, 12151:16/little>>};
pack(srv, 12151, {V0_cards, V0_buy_loss}) ->
    D_a_t_a = <<(length(V0_cards)):16/little,
                (list_to_binary([<<V1_item_id:32/little,
                                   V1_item_num:32/little, V1_selected:8/little>>
                                 || #dungeon_card{item_id = V1_item_id,
                                                  item_num = V1_item_num,
                                                  selected = V1_selected}
                                        <- V0_cards]))/binary,
                (length(V0_buy_loss)):16/little,
                (list_to_binary([<<V1_l_id:32/little,
                                   V1_l_value:32/little>>
                                 || {V1_l_id, V1_l_value}
                                        <- V0_buy_loss]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12151:16/little,
       D_a_t_a/binary>>};
pack(cli, 12152, {}) ->
    {ok, <<2:32/little, 12152:16/little>>};
pack(srv, 12152, {V0_has_cards}) ->
    D_a_t_a = <<V0_has_cards:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12152:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 12100, _B0) ->
    {V1_dun_id, _B1} = protocol:uint32(_B0),
    {V1_battle_flag, _B2} = protocol:uint8(_B1),
    {ok, {V1_dun_id, V1_battle_flag}};
unpack(cli, 12100, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 12101, _B0) -> {ok, {}};
unpack(cli, 12101, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 12102, _B0) -> {ok, {}};
unpack(cli, 12102, _B0) -> {ok, {}};
unpack(srv, 12103, _B0) -> {ok, {}};
unpack(cli, 12103, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_unit_id, _B6} = protocol:array(_B1,
                                       fun (_B2) ->
                                               {V2_base_id, _B3} =
                                                   protocol:uint32(_B2),
                                               {V2_num, _B4} =
                                                   protocol:uint8(_B3),
                                               {{V2_base_id, V2_num}, _B4}
                                       end),
    {V1_extra, _B14} = protocol:array(_B6,
                                      fun (_B7) ->
                                              {V2_key, _B8} =
                                                  protocol:uint32(_B7),
                                              {V2_val_1, _B9} =
                                                  protocol:uint32(_B8),
                                              {V2_val_2, _B10} =
                                                  protocol:uint32(_B9),
                                              {V2_str_1, _B11} =
                                                  protocol:string(_B10),
                                              {V2_str_2, _B12} =
                                                  protocol:string(_B11),
                                              {{V2_key,
                                                V2_val_1,
                                                V2_val_2,
                                                V2_str_1,
                                                V2_str_2},
                                               _B12}
                                      end),
    {ok, {V1_id, V1_unit_id, V1_extra}};
unpack(srv, 12104, _B0) -> {ok, {}};
unpack(cli, 12104, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_unit_id, _B6} = protocol:array(_B1,
                                       fun (_B2) ->
                                               {V2_base_id, _B3} =
                                                   protocol:uint32(_B2),
                                               {V2_num, _B4} =
                                                   protocol:uint8(_B3),
                                               {{V2_base_id, V2_num}, _B4}
                                       end),
    {ok, {V1_id, V1_unit_id}};
unpack(srv, 12110, _B0) -> {ok, {}};
unpack(cli, 12110, _B0) ->
    {V1_grade, _B1} = protocol:uint8(_B0),
    {V1_score, _B2} = protocol:uint32(_B1),
    {V1_max_dmg, _B3} = protocol:uint32(_B2),
    {V1_round, _B4} = protocol:uint16(_B3),
    {V1_hurt, _B5} = protocol:uint32(_B4),
    {V1_time, _B6} = protocol:uint8(_B5),
    {V1_dun_id, _B7} = protocol:uint32(_B6),
    {V1_floor, _B8} = protocol:uint8(_B7),
    {ok,
     {V1_grade,
      V1_score,
      V1_max_dmg,
      V1_round,
      V1_hurt,
      V1_time,
      V1_dun_id,
      V1_floor}};
unpack(srv, 12111, _B0) ->
    {V1_pos, _B1} = protocol:uint8(_B0),
    {ok, {V1_pos}};
unpack(cli, 12111, _B0) ->
    {V1_pos, _B1} = protocol:uint8(_B0),
    {V1_base_id, _B2} = protocol:uint32(_B1),
    {V1_num, _B3} = protocol:uint32(_B2),
    {V1_rid, _B4} = protocol:uint32(_B3),
    {V1_platform, _B5} = protocol:string(_B4),
    {V1_zone_id, _B6} = protocol:uint32(_B5),
    {V1_name, _B7} = protocol:string(_B6),
    {V1_msg, _B8} = protocol:string(_B7),
    {ok,
     {V1_pos,
      V1_base_id,
      V1_num,
      V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_msg}};
unpack(srv, 12112, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 12112, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_unit_reward, _B6} = protocol:array(_B1,
                                           fun (_B2) ->
                                                   {V2_unit_base_id, _B3} =
                                                       protocol:uint32(_B2),
                                                   {V2_num, _B4} =
                                                       protocol:uint8(_B3),
                                                   {{V2_unit_base_id, V2_num},
                                                    _B4}
                                           end),
    {ok, {V1_id, V1_unit_reward}};
unpack(srv, 12114, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 12114, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_floor_cound, _B6} = protocol:array(_B1,
                                           fun (_B2) ->
                                                   {V2_floor, _B3} =
                                                       protocol:uint8(_B2),
                                                   {V2_num, _B4} =
                                                       protocol:uint8(_B3),
                                                   {{V2_floor, V2_num}, _B4}
                                           end),
    {V1_time, _B7} = protocol:uint8(_B6),
    {ok, {V1_id, V1_floor_cound, V1_time}};
unpack(srv, 12116, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 12116, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {V1_time, _B4} = protocol:uint8(_B3),
    {ok, {V1_flag, V1_msg, V1_id, V1_time}};
unpack(srv, 12117, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 12117, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_floor_list, _B6} = protocol:array(_B1,
                                          fun (_B2) ->
                                                  {V2_floor, _B3} =
                                                      protocol:uint8(_B2),
                                                  {V2_status, _B4} =
                                                      protocol:uint8(_B3),
                                                  {{V2_floor, V2_status}, _B4}
                                          end),
    {ok, {V1_id, V1_floor_list}};
unpack(srv, 12118, _B0) -> {ok, {}};
unpack(cli, 12118, _B0) ->
    {V1_gain, _B5} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_id, _B2} = protocol:uint32(_B1),
                                            {V2_value, _B3} =
                                                protocol:uint32(_B2),
                                            {{V2_id, V2_value}, _B3}
                                    end),
    {ok, {V1_gain}};
unpack(srv, 12119, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_floor, _B2} = protocol:uint8(_B1),
    {ok, {V1_id, V1_floor}};
unpack(cli, 12119, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {V1_floor, _B4} = protocol:uint8(_B3),
    {ok, {V1_flag, V1_msg, V1_id, V1_floor}};
unpack(srv, 12120, _B0) ->
    {V1_list, _B4} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_base_id, _B2} =
                                                protocol:uint32(_B1),
                                            {{V2_base_id}, _B2}
                                    end),
    {ok, {V1_list}};
unpack(cli, 12120, _B0) ->
    {V1_list, _B5} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_base_id, _B2} =
                                                protocol:uint32(_B1),
                                            {V2_num, _B3} =
                                                protocol:uint32(_B2),
                                            {{V2_base_id, V2_num}, _B3}
                                    end),
    {ok, {V1_list}};
unpack(srv, 12121, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_floor, _B2} = protocol:uint8(_B1),
    {ok, {V1_id, V1_floor}};
unpack(cli, 12121, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_floor, _B2} = protocol:uint8(_B1),
    {V1_list, _B21} = protocol:array(_B2,
                                     fun (_B3) ->
                                             {V2_rid, _B4} =
                                                 protocol:uint32(_B3),
                                             {V2_platform, _B5} =
                                                 protocol:string(_B4),
                                             {V2_zone_id, _B6} =
                                                 protocol:uint32(_B5),
                                             {V2_name, _B7} =
                                                 protocol:string(_B6),
                                             {V2_sex, _B8} =
                                                 protocol:uint32(_B7),
                                             {V2_classes, _B9} =
                                                 protocol:uint32(_B8),
                                             {V2_lev, _B10} =
                                                 protocol:uint32(_B9),
                                             {V2_fc, _B11} =
                                                 protocol:uint32(_B10),
                                             {V2_rank, _B12} =
                                                 protocol:uint32(_B11),
                                             {V2_val1, _B13} =
                                                 protocol:uint32(_B12),
                                             {V2_val2, _B14} =
                                                 protocol:uint32(_B13),
                                             {V2_val3, _B15} =
                                                 protocol:uint32(_B14),
                                             {V2_val4, _B16} =
                                                 protocol:uint32(_B15),
                                             {V2_msg1, _B17} =
                                                 protocol:string(_B16),
                                             {V2_msg2, _B18} =
                                                 protocol:string(_B17),
                                             {V2_msg3, _B19} =
                                                 protocol:string(_B18),
                                             {{V2_rid,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_name,
                                               V2_sex,
                                               V2_classes,
                                               V2_lev,
                                               V2_fc,
                                               V2_rank,
                                               V2_val1,
                                               V2_val2,
                                               V2_val3,
                                               V2_val4,
                                               V2_msg1,
                                               V2_msg2,
                                               V2_msg3},
                                              _B19}
                                     end),
    {ok, {V1_id, V1_floor, V1_list}};
unpack(srv, 12122, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 12122, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_floor, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_floor}};
unpack(srv, 12123, _B0) -> {ok, {}};
unpack(cli, 12123, _B0) ->
    {V1_list, _B10} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_key, _B2} =
                                                 protocol:uint32(_B1),
                                             {V2_val_1, _B3} =
                                                 protocol:uint32(_B2),
                                             {V2_val_2, _B4} =
                                                 protocol:uint32(_B3),
                                             {V2_val_3, _B5} =
                                                 protocol:uint32(_B4),
                                             {V2_val_4, _B6} =
                                                 protocol:uint32(_B5),
                                             {V2_str_1, _B7} =
                                                 protocol:string(_B6),
                                             {V2_str_2, _B8} =
                                                 protocol:string(_B7),
                                             {{V2_key,
                                               V2_val_1,
                                               V2_val_2,
                                               V2_val_3,
                                               V2_val_4,
                                               V2_str_1,
                                               V2_str_2},
                                              _B8}
                                     end),
    {ok, {V1_list}};
unpack(srv, 12130, _B0) -> {ok, {}};
unpack(cli, 12130, _B0) ->
    {V1_team_id, _B1} = protocol:uint32(_B0),
    {V1_team_platform, _B2} = protocol:string(_B1),
    {V1_team_zone_id, _B3} = protocol:uint32(_B2),
    {V1_dun_id, _B4} = protocol:uint32(_B3),
    {V1_status, _B5} = protocol:uint8(_B4),
    {V1_members, _B24} = protocol:array(_B5,
                                        fun (_B6) ->
                                                {V2_rid, _B7} =
                                                    protocol:uint32(_B6),
                                                {V2_platform, _B8} =
                                                    protocol:string(_B7),
                                                {V2_zone_id, _B9} =
                                                    protocol:uint32(_B8),
                                                {V2_name, _B10} =
                                                    protocol:string(_B9),
                                                {V2_sex, _B11} =
                                                    protocol:uint8(_B10),
                                                {V2_classes, _B12} =
                                                    protocol:uint8(_B11),
                                                {V2_lev, _B13} =
                                                    protocol:uint8(_B12),
                                                {V2_face_id, _B14} =
                                                    protocol:uint32(_B13),
                                                {V2_status, _B15} =
                                                    protocol:uint8(_B14),
                                                {V2_looks, _B22} =
                                                    protocol:array(_B15,
                                                                   fun (_B16) ->
                                                                           {V3_looks_type,
                                                                            _B17} =
                                                                               protocol:uint32(_B16),
                                                                           {V3_looks_mode,
                                                                            _B18} =
                                                                               protocol:uint32(_B17),
                                                                           {V3_looks_val,
                                                                            _B19} =
                                                                               protocol:uint32(_B18),
                                                                           {V3_looks_str,
                                                                            _B20} =
                                                                               protocol:string(_B19),
                                                                           {{V3_looks_type,
                                                                             V3_looks_mode,
                                                                             V3_looks_val,
                                                                             V3_looks_str},
                                                                            _B20}
                                                                   end),
                                                {{V2_rid,
                                                  V2_platform,
                                                  V2_zone_id,
                                                  V2_name,
                                                  V2_sex,
                                                  V2_classes,
                                                  V2_lev,
                                                  V2_face_id,
                                                  V2_status,
                                                  V2_looks},
                                                 _B22}
                                        end),
    {ok,
     {V1_team_id,
      V1_team_platform,
      V1_team_zone_id,
      V1_dun_id,
      V1_status,
      V1_members}};
unpack(srv, 12131, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 12131, _B0) ->
    {V1_dun_id, _B1} = protocol:uint32(_B0),
    {V1_list, _B23} = protocol:array(_B1,
                                     fun (_B2) ->
                                             {V2_team_id, _B3} =
                                                 protocol:uint32(_B2),
                                             {V2_team_platform, _B4} =
                                                 protocol:string(_B3),
                                             {V2_team_zone_id, _B5} =
                                                 protocol:uint32(_B4),
                                             {V2_rid, _B6} =
                                                 protocol:uint32(_B5),
                                             {V2_platform, _B7} =
                                                 protocol:string(_B6),
                                             {V2_zone_id, _B8} =
                                                 protocol:uint32(_B7),
                                             {V2_name, _B9} =
                                                 protocol:string(_B8),
                                             {V2_sex, _B10} =
                                                 protocol:uint32(_B9),
                                             {V2_classes, _B11} =
                                                 protocol:uint32(_B10),
                                             {V2_lev, _B12} =
                                                 protocol:uint32(_B11),
                                             {V2_face_id, _B13} =
                                                 protocol:uint32(_B12),
                                             {V2_looks, _B20} =
                                                 protocol:array(_B13,
                                                                fun (_B14) ->
                                                                        {V3_looks_type,
                                                                         _B15} =
                                                                            protocol:uint32(_B14),
                                                                        {V3_looks_mode,
                                                                         _B16} =
                                                                            protocol:uint32(_B15),
                                                                        {V3_looks_val,
                                                                         _B17} =
                                                                            protocol:uint32(_B16),
                                                                        {V3_looks_str,
                                                                         _B18} =
                                                                            protocol:string(_B17),
                                                                        {{V3_looks_type,
                                                                          V3_looks_mode,
                                                                          V3_looks_val,
                                                                          V3_looks_str},
                                                                         _B18}
                                                                end),
                                             {V2_member_num, _B21} =
                                                 protocol:uint8(_B20),
                                             {{V2_team_id,
                                               V2_team_platform,
                                               V2_team_zone_id,
                                               V2_rid,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_name,
                                               V2_sex,
                                               V2_classes,
                                               V2_lev,
                                               V2_face_id,
                                               V2_looks,
                                               V2_member_num},
                                              _B21}
                                     end),
    {ok, {V1_dun_id, V1_list}};
unpack(srv, 12132, _B0) ->
    {V1_dun_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_dun_id}};
unpack(cli, 12132, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 12133, _B0) -> {ok, {}};
unpack(cli, 12133, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 12134, _B0) ->
    {V1_dun_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_dun_id}};
unpack(cli, 12134, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 12135, _B0) -> {ok, {}};
unpack(cli, 12135, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 12136, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_dun_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_id, V1_platform, V1_zone_id, V1_dun_id}};
unpack(cli, 12136, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 12137, _B0) -> {ok, {}};
unpack(cli, 12137, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 12138, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 12138, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 12139, _B0) -> {ok, {}};
unpack(cli, 12139, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 12140, _B0) -> {ok, {}};
unpack(cli, 12140, _B0) ->
    {V1_is_matching, _B1} = protocol:uint8(_B0),
    {V1_dun_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_is_matching, V1_dun_id}};
unpack(srv, 12141, _B0) -> {ok, {}};
unpack(cli, 12141, _B0) ->
    {V1_members, _B19} = protocol:array(_B0,
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
                                                    protocol:uint8(_B5),
                                                {V2_classes, _B7} =
                                                    protocol:uint8(_B6),
                                                {V2_lev, _B8} =
                                                    protocol:uint8(_B7),
                                                {V2_face_id, _B9} =
                                                    protocol:uint32(_B8),
                                                {V2_status, _B10} =
                                                    protocol:uint8(_B9),
                                                {V2_looks, _B17} =
                                                    protocol:array(_B10,
                                                                   fun (_B11) ->
                                                                           {V3_looks_type,
                                                                            _B12} =
                                                                               protocol:uint32(_B11),
                                                                           {V3_looks_mode,
                                                                            _B13} =
                                                                               protocol:uint32(_B12),
                                                                           {V3_looks_val,
                                                                            _B14} =
                                                                               protocol:uint32(_B13),
                                                                           {V3_looks_str,
                                                                            _B15} =
                                                                               protocol:string(_B14),
                                                                           {{V3_looks_type,
                                                                             V3_looks_mode,
                                                                             V3_looks_val,
                                                                             V3_looks_str},
                                                                            _B15}
                                                                   end),
                                                {{V2_rid,
                                                  V2_platform,
                                                  V2_zone_id,
                                                  V2_name,
                                                  V2_sex,
                                                  V2_classes,
                                                  V2_lev,
                                                  V2_face_id,
                                                  V2_status,
                                                  V2_looks},
                                                 _B17}
                                        end),
    {ok, {V1_members}};
unpack(srv, 12142, _B0) -> {ok, {}};
unpack(cli, 12142, _B0) ->
    {V1_members, _B6} = protocol:array(_B0,
                                       fun (_B1) ->
                                               {V2_rid, _B2} =
                                                   protocol:uint32(_B1),
                                               {V2_platform, _B3} =
                                                   protocol:string(_B2),
                                               {V2_zone_id, _B4} =
                                                   protocol:uint16(_B3),
                                               {{V2_rid,
                                                 V2_platform,
                                                 V2_zone_id},
                                                _B4}
                                       end),
    {ok, {V1_members}};
unpack(srv, 12143, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 12143, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 12144, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_type, _B4} = protocol:uint8(_B3),
    {ok, {V1_rid, V1_platform, V1_zone_id, V1_type}};
unpack(cli, 12144, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 12145, _B0) -> {ok, {}};
unpack(cli, 12145, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_sex, _B5} = protocol:uint8(_B4),
    {V1_classes, _B6} = protocol:uint8(_B5),
    {V1_lev, _B7} = protocol:uint8(_B6),
    {V1_dun_id, _B8} = protocol:uint32(_B7),
    {V1_dun_name, _B9} = protocol:string(_B8),
    {V1_time, _B10} = protocol:uint32(_B9),
    {V1_t_id, _B11} = protocol:uint32(_B10),
    {V1_t_platform, _B12} = protocol:string(_B11),
    {V1_t_zone_id, _B13} = protocol:uint16(_B12),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_sex,
      V1_classes,
      V1_lev,
      V1_dun_id,
      V1_dun_name,
      V1_time,
      V1_t_id,
      V1_t_platform,
      V1_t_zone_id}};
unpack(srv, 12146, _B0) -> {ok, {}};
unpack(cli, 12146, _B0) ->
    {V1_dun_id, _B1} = protocol:uint32(_B0),
    {V1_gain, _B6} = protocol:array(_B1,
                                    fun (_B2) ->
                                            {V2_g_id, _B3} =
                                                protocol:uint32(_B2),
                                            {V2_value, _B4} =
                                                protocol:uint32(_B3),
                                            {{V2_g_id, V2_value}, _B4}
                                    end),
    {V1_cards, _B12} = protocol:array(_B6,
                                      fun (_B7) ->
                                              {V2_item_id, _B8} =
                                                  protocol:uint32(_B7),
                                              {V2_item_num, _B9} =
                                                  protocol:uint32(_B8),
                                              {V2_selected, _B10} =
                                                  protocol:uint8(_B9),
                                              {{V2_item_id,
                                                V2_item_num,
                                                V2_selected},
                                               _B10}
                                      end),
    {V1_buy_loss, _B17} = protocol:array(_B12,
                                         fun (_B13) ->
                                                 {V2_l_id, _B14} =
                                                     protocol:uint32(_B13),
                                                 {V2_l_value, _B15} =
                                                     protocol:uint32(_B14),
                                                 {{V2_l_id, V2_l_value}, _B15}
                                         end),
    {ok, {V1_dun_id, V1_gain, V1_cards, V1_buy_loss}};
unpack(srv, 12147, _B0) -> {ok, {}};
unpack(cli, 12147, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 12148, _B0) -> {ok, {}};
unpack(cli, 12148, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 12149, _B0) ->
    {V1_dun_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_dun_id}};
unpack(cli, 12149, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_dun_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_dun_id}};
unpack(srv, 12150, _B0) -> {ok, {}};
unpack(cli, 12150, _B0) ->
    {V1_pass_list, _B5} = protocol:array(_B0,
                                         fun (_B1) ->
                                                 {V2_dun_id, _B2} =
                                                     protocol:uint32(_B1),
                                                 {V2_times, _B3} =
                                                     protocol:uint32(_B2),
                                                 {{V2_dun_id, V2_times}, _B3}
                                         end),
    {V1_rewards, _B14} = protocol:array(_B5,
                                        fun (_B6) ->
                                                {V2_dun_id, _B7} =
                                                    protocol:uint32(_B6),
                                                {V2_gains, _B12} =
                                                    protocol:array(_B7,
                                                                   fun (_B8) ->
                                                                           {V3_gid,
                                                                            _B9} =
                                                                               protocol:uint32(_B8),
                                                                           {V3_value,
                                                                            _B10} =
                                                                               protocol:uint32(_B9),
                                                                           {{V3_gid,
                                                                             V3_value},
                                                                            _B10}
                                                                   end),
                                                {{V2_dun_id, V2_gains}, _B12}
                                        end),
    {ok, {V1_pass_list, V1_rewards}};
unpack(srv, 12151, _B0) -> {ok, {}};
unpack(cli, 12151, _B0) ->
    {V1_cards, _B6} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_item_id, _B2} =
                                                 protocol:uint32(_B1),
                                             {V2_item_num, _B3} =
                                                 protocol:uint32(_B2),
                                             {V2_selected, _B4} =
                                                 protocol:uint8(_B3),
                                             {{V2_item_id,
                                               V2_item_num,
                                               V2_selected},
                                              _B4}
                                     end),
    {V1_buy_loss, _B11} = protocol:array(_B6,
                                         fun (_B7) ->
                                                 {V2_l_id, _B8} =
                                                     protocol:uint32(_B7),
                                                 {V2_l_value, _B9} =
                                                     protocol:uint32(_B8),
                                                 {{V2_l_id, V2_l_value}, _B9}
                                         end),
    {ok, {V1_cards, V1_buy_loss}};
unpack(srv, 12152, _B0) -> {ok, {}};
unpack(cli, 12152, _B0) ->
    {V1_has_cards, _B1} = protocol:uint8(_B0),
    {ok, {V1_has_cards}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

