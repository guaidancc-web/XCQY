-file("src/proto/proto_142.erl", 1).

-module(proto_142).

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

-file("src/proto/proto_142.erl", 14).

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

-file("src/proto/proto_142.erl", 15).

-file("inc/warrior.hrl", 1).

-record(warrior_ready_zone,
        {cross_id = 0,
         map_id = 0 :: non_neg_integer(),
         map_zone = 0,
         map_plat = "",
         map_pid :: pid() | undefined,
         member_size = 0 :: non_neg_integer(),
         group_id = 0 :: pos_integer(),
         exit_npc,
         combat_mode = 1,
         init_combat_mode = 0}).

-record(warrior_zone,
        {cross_id = 0,
         id = 0,
         key,
         group_id = 0 :: pos_integer(),
         seq_id = 0,
         pid,
         is_close = 0}).

-record(warrior_field,
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
         green_num = 0,
         green_score = 0,
         white_num = 0,
         white_score = 0,
         phase = 0,
         combat_mode = 1}).

-record(warrior_zone_role,
        {id,
         pid,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0 :: non_neg_integer(),
         group_id = 0 :: pos_integer(),
         field_id = 0,
         camp = 0,
         revive = 0,
         status = 0,
         is_combat = 0,
         combat_pid,
         last_combat_over_time = 0,
         last_role_id,
         win_count = 0,
         combat_count = 0,
         score = 0,
         cross_id = 0}).

-record(warrior,
        {id ::
             undefined |
             {pos_integer(), bitstring(), non_neg_integer()},
         pid :: pid() | undefined,
         name = "" :: string(),
         sex = 0,
         classes = 0,
         face_id = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         fc = 0 :: non_neg_integer(),
         group_id = 0 :: pos_integer(),
         kill = 0 :: non_neg_integer(),
         multi_kill = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         rank = 0 :: pos_integer(),
         revive = 0 :: non_neg_integer(),
         death = 0 :: non_neg_integer(),
         multi_death = 0 :: non_neg_integer(),
         dead_time = 0 :: non_neg_integer(),
         camp = 0,
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
         magic_buff = [] :: list(),
         status = 0,
         looks = [],
         cross_id = 0,
         combat_mode = 1}).

-record(warrior_group_data,
        {id = 0, name = "", order = 0, members = []}).

-record(warrior_win_item_data,
        {base_id = 0,
         weight = 0,
         max = 0,
         is_notice = 0,
         num = 0}).

-record(warrior_drop_item_data,
        {base_id = 0,
         weight = 0,
         result = 0,
         is_notice = 0,
         num = 0}).

-record(warrior_scene_unit,
        {battle_id = 0,
         type = 0,
         sub_type = 0,
         buff_id = 0,
         spec_id = 0,
         item_base_id = 0,
         unit_base_id = 0,
         field_id = 0}).

-record(warrior_buff_data,
        {buff_id = 0, type = 0, unit_base_id = 0, name = ""}).

-record(warrior_magic_buff,
        {buff_id = 0,
         name = "",
         status = 0,
         type = 0,
         x = 0,
         y = 0,
         time = 0,
         owner_id,
         owner_name = "",
         next_owner_id,
         next_owner_pid,
         camp = 0}).

-record(warrior_combat, {pid, field_id = 0, field_key}).

-record(warrior_timer_data,
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

-record(warrior_combat_result,
        {field_pid,
         lose_buff = 0,
         win_buff = 0,
         takeover = false,
         round = 0}).

-record(warrior_combat_win,
        {field_pid,
         lose_buff = 0,
         win_buff = 0,
         takeover = false,
         score = 0,
         round = 0,
         id,
         name,
         camp = 0,
         wish_buff = 0}).

-record(warrior_combat_lose,
        {field_pid,
         lose_buff = 0,
         win_buff = 0,
         takeover = false,
         score = 0,
         round = 0,
         id,
         name,
         camp = 0,
         revive = 0}).

-record(warrior_embattle,
        {role_id = {0, "", 0}, pets = [], guards = []}).

-record(warrior_rank_reward_data,
        {group = 0,
         min = 0,
         max = 0,
         items = [],
         title = "",
         content = ""}).

-file("src/proto/proto_142.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 14200, {}) ->
    {ok, <<2:32/little, 14200:16/little>>};
pack(srv, 14200, {V0_phase, V0_time}) ->
    D_a_t_a = <<V0_phase:8/little, V0_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14200:16/little,
       D_a_t_a/binary>>};
pack(cli, 14201, {}) ->
    {ok, <<2:32/little, 14201:16/little>>};
pack(srv, 14201,
     {V0_op_code, V0_msg, V0_combat_mode}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_combat_mode:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14201:16/little,
       D_a_t_a/binary>>};
pack(cli, 14202, {}) ->
    {ok, <<2:32/little, 14202:16/little>>};
pack(srv, 14202, {V0_op_code, V0_msg}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14202:16/little,
       D_a_t_a/binary>>};
pack(cli, 14203, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14203:16/little,
       D_a_t_a/binary>>};
pack(srv, 14203, {V0_op_code, V0_msg}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14203:16/little,
       D_a_t_a/binary>>};
pack(cli, 14204, {V0_battle_id, V0_id}) ->
    D_a_t_a = <<V0_battle_id:32/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14204:16/little,
       D_a_t_a/binary>>};
pack(srv, 14204, {V0_op_code, V0_msg}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14204:16/little,
       D_a_t_a/binary>>};
pack(cli, 14205, {}) ->
    {ok, <<2:32/little, 14205:16/little>>};
pack(srv, 14205, {V0_warrior_magic_buff}) ->
    D_a_t_a = <<(length(V0_warrior_magic_buff)):16/little,
                (list_to_binary([<<V1_buff_id:32/little,
                                   V1_status:8/little, V1_camp:8/little,
                                   (protocol:pack(string,
                                                  V1_owner_name))/binary,
                                   V1_time:32/little>>
                                 || #warrior_magic_buff{buff_id = V1_buff_id,
                                                        status = V1_status,
                                                        camp = V1_camp,
                                                        owner_name =
                                                            V1_owner_name,
                                                        time = V1_time}
                                        <- V0_warrior_magic_buff]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14205:16/little,
       D_a_t_a/binary>>};
pack(cli, 14206, {}) ->
    {ok, <<2:32/little, 14206:16/little>>};
pack(srv, 14206,
     {#warrior_field{group_id = V0_group_id, id = V0_id,
                     green_score = V0_green_score, green_num = V0_green_num,
                     white_score = V0_white_score, white_num = V0_white_num,
                     combat_mode = V0_combat_mode}}) ->
    D_a_t_a = <<V0_group_id:8/little, V0_id:32/little,
                V0_green_score:32/little, V0_green_num:32/little,
                V0_white_score:32/little, V0_white_num:32/little,
                V0_combat_mode:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14206:16/little,
       D_a_t_a/binary>>};
pack(cli, 14207, {}) ->
    {ok, <<2:32/little, 14207:16/little>>};
pack(srv, 14207,
     {#warrior{revive = V0_revive, rank = V0_rank,
               score = V0_score, camp = V0_camp}}) ->
    D_a_t_a = <<V0_revive:8/little, V0_rank:8/little,
                V0_score:32/little, V0_camp:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14207:16/little,
       D_a_t_a/binary>>};
pack(cli, 14208, {}) ->
    {ok, <<2:32/little, 14208:16/little>>};
pack(srv, 14208, {V0_warrior}) ->
    D_a_t_a = <<(length(V0_warrior)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (length(V1_magic_buff)):16/little,
                                   (list_to_binary([<<V2_buff_id:32/little>>
                                                    || V2_buff_id
                                                           <- V1_magic_buff]))/binary,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_classes:8/little, V1_sex:8/little,
                                   V1_face_id:32/little, V1_camp:8/little,
                                   V1_kill:16/little, V1_revive:8/little,
                                   V1_rank:8/little, V1_score:32/little>>
                                 || #warrior{id =
                                                 {V1_id,
                                                  V1_platform,
                                                  V1_zone_id},
                                             magic_buff = V1_magic_buff,
                                             name = V1_name,
                                             classes = V1_classes, sex = V1_sex,
                                             face_id = V1_face_id,
                                             camp = V1_camp, kill = V1_kill,
                                             revive = V1_revive, rank = V1_rank,
                                             score = V1_score}
                                        <- V0_warrior]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14208:16/little,
       D_a_t_a/binary>>};
pack(cli, 14209, {}) ->
    {ok, <<2:32/little, 14209:16/little>>};
pack(srv, 14209, {V0_num}) ->
    D_a_t_a = <<V0_num:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14209:16/little,
       D_a_t_a/binary>>};
pack(cli, 14210, {}) ->
    {ok, <<2:32/little, 14210:16/little>>};
pack(srv, 14210, {V0_op_code, V0_msg}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14210:16/little,
       D_a_t_a/binary>>};
pack(cli, 14212, {}) ->
    {ok, <<2:32/little, 14212:16/little>>};
pack(srv, 14212,
     {V0_victory,
      V0_camp,
      V0_score,
      V0_ext_score,
      V0_reward}) ->
    D_a_t_a = <<V0_victory:8/little, V0_camp:8/little,
                V0_score:32/little, V0_ext_score:32/little,
                (length(V0_reward)):16/little,
                (list_to_binary([<<V1_assets:32/little,
                                   V1_val:32/little>>
                                 || {V1_assets, V1_val}
                                        <- V0_reward]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14212:16/little,
       D_a_t_a/binary>>};
pack(cli, 14213, {}) ->
    {ok, <<2:32/little, 14213:16/little>>};
pack(srv, 14213, {V0_combat_mode}) ->
    D_a_t_a = <<V0_combat_mode:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14213:16/little,
       D_a_t_a/binary>>};
pack(cli, 14214, {V0_pets, V0_guards}) ->
    D_a_t_a = <<(length(V0_pets)):16/little,
                (list_to_binary([<<V1_pos:16/little, V1_id:32/little>>
                                 || {V1_pos, V1_id} <- V0_pets]))/binary,
                (length(V0_guards)):16/little,
                (list_to_binary([<<V1_pos:16/little, V1_id:32/little>>
                                 || {V1_pos, V1_id} <- V0_guards]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14214:16/little,
       D_a_t_a/binary>>};
pack(srv, 14214, {V0_op_code, V0_msg}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14214:16/little,
       D_a_t_a/binary>>};
pack(cli, 14215, {}) ->
    {ok, <<2:32/little, 14215:16/little>>};
pack(srv, 14215,
     {#warrior_embattle{pets = V0_pets,
                        guards = V0_guards}}) ->
    D_a_t_a = <<(length(V0_pets)):16/little,
                (list_to_binary([<<V1_pos:16/little, V1_id:32/little>>
                                 || {V1_pos, V1_id} <- V0_pets]))/binary,
                (length(V0_guards)):16/little,
                (list_to_binary([<<V1_pos:16/little, V1_id:32/little>>
                                 || {V1_pos, V1_id} <- V0_guards]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14215:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 14200, _B0) -> {ok, {}};
unpack(cli, 14200, _B0) ->
    {V1_phase, _B1} = protocol:uint8(_B0),
    {V1_time, _B2} = protocol:uint32(_B1),
    {ok, {V1_phase, V1_time}};
unpack(srv, 14201, _B0) -> {ok, {}};
unpack(cli, 14201, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_combat_mode, _B3} = protocol:uint8(_B2),
    {ok, {V1_op_code, V1_msg, V1_combat_mode}};
unpack(srv, 14202, _B0) -> {ok, {}};
unpack(cli, 14202, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_op_code, V1_msg}};
unpack(srv, 14203, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 14203, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_op_code, V1_msg}};
unpack(srv, 14204, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_battle_id, V1_id}};
unpack(cli, 14204, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_op_code, V1_msg}};
unpack(srv, 14205, _B0) -> {ok, {}};
unpack(cli, 14205, _B0) ->
    {V1_warrior_magic_buff, _B8} = protocol:array(_B0,
                                                  fun (_B1) ->
                                                          {V2_buff_id, _B2} =
                                                              protocol:uint32(_B1),
                                                          {V2_status, _B3} =
                                                              protocol:uint8(_B2),
                                                          {V2_camp, _B4} =
                                                              protocol:uint8(_B3),
                                                          {V2_owner_name, _B5} =
                                                              protocol:string(_B4),
                                                          {V2_time, _B6} =
                                                              protocol:uint32(_B5),
                                                          {{V2_buff_id,
                                                            V2_status,
                                                            V2_camp,
                                                            V2_owner_name,
                                                            V2_time},
                                                           _B6}
                                                  end),
    {ok, {V1_warrior_magic_buff}};
unpack(srv, 14206, _B0) -> {ok, {}};
unpack(cli, 14206, _B0) ->
    {V1_group_id, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_green_score, _B3} = protocol:uint32(_B2),
    {V1_green_num, _B4} = protocol:uint32(_B3),
    {V1_white_score, _B5} = protocol:uint32(_B4),
    {V1_white_num, _B6} = protocol:uint32(_B5),
    {V1_combat_mode, _B7} = protocol:uint8(_B6),
    {ok,
     {V1_group_id,
      V1_id,
      V1_green_score,
      V1_green_num,
      V1_white_score,
      V1_white_num,
      V1_combat_mode}};
unpack(srv, 14207, _B0) -> {ok, {}};
unpack(cli, 14207, _B0) ->
    {V1_revive, _B1} = protocol:uint8(_B0),
    {V1_rank, _B2} = protocol:uint8(_B1),
    {V1_score, _B3} = protocol:uint32(_B2),
    {V1_camp, _B4} = protocol:uint8(_B3),
    {ok, {V1_revive, V1_rank, V1_score, V1_camp}};
unpack(srv, 14208, _B0) -> {ok, {}};
unpack(cli, 14208, _B0) ->
    {V1_warrior, _B19} = protocol:array(_B0,
                                        fun (_B1) ->
                                                {V2_id, _B2} =
                                                    protocol:uint32(_B1),
                                                {V2_platform, _B3} =
                                                    protocol:string(_B2),
                                                {V2_zone_id, _B4} =
                                                    protocol:uint32(_B3),
                                                {V2_magic_buff, _B8} =
                                                    protocol:array(_B4,
                                                                   fun (_B5) ->
                                                                           {V3_buff_id,
                                                                            _B6} =
                                                                               protocol:uint32(_B5),
                                                                           {{V3_buff_id},
                                                                            _B6}
                                                                   end),
                                                {V2_name, _B9} =
                                                    protocol:string(_B8),
                                                {V2_classes, _B10} =
                                                    protocol:uint8(_B9),
                                                {V2_sex, _B11} =
                                                    protocol:uint8(_B10),
                                                {V2_face_id, _B12} =
                                                    protocol:uint32(_B11),
                                                {V2_camp, _B13} =
                                                    protocol:uint8(_B12),
                                                {V2_kill, _B14} =
                                                    protocol:uint16(_B13),
                                                {V2_revive, _B15} =
                                                    protocol:uint8(_B14),
                                                {V2_rank, _B16} =
                                                    protocol:uint8(_B15),
                                                {V2_score, _B17} =
                                                    protocol:uint32(_B16),
                                                {{V2_id,
                                                  V2_platform,
                                                  V2_zone_id,
                                                  V2_magic_buff,
                                                  V2_name,
                                                  V2_classes,
                                                  V2_sex,
                                                  V2_face_id,
                                                  V2_camp,
                                                  V2_kill,
                                                  V2_revive,
                                                  V2_rank,
                                                  V2_score},
                                                 _B17}
                                        end),
    {ok, {V1_warrior}};
unpack(srv, 14209, _B0) -> {ok, {}};
unpack(cli, 14209, _B0) ->
    {V1_num, _B1} = protocol:uint8(_B0),
    {ok, {V1_num}};
unpack(srv, 14210, _B0) -> {ok, {}};
unpack(cli, 14210, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_op_code, V1_msg}};
unpack(srv, 14212, _B0) -> {ok, {}};
unpack(cli, 14212, _B0) ->
    {V1_victory, _B1} = protocol:uint8(_B0),
    {V1_camp, _B2} = protocol:uint8(_B1),
    {V1_score, _B3} = protocol:uint32(_B2),
    {V1_ext_score, _B4} = protocol:uint32(_B3),
    {V1_reward, _B9} = protocol:array(_B4,
                                      fun (_B5) ->
                                              {V2_assets, _B6} =
                                                  protocol:uint32(_B5),
                                              {V2_val, _B7} =
                                                  protocol:uint32(_B6),
                                              {{V2_assets, V2_val}, _B7}
                                      end),
    {ok,
     {V1_victory,
      V1_camp,
      V1_score,
      V1_ext_score,
      V1_reward}};
unpack(srv, 14213, _B0) -> {ok, {}};
unpack(cli, 14213, _B0) ->
    {V1_combat_mode, _B1} = protocol:uint8(_B0),
    {ok, {V1_combat_mode}};
unpack(srv, 14214, _B0) ->
    {V1_pets, _B5} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_pos, _B2} =
                                                protocol:uint16(_B1),
                                            {V2_id, _B3} = protocol:uint32(_B2),
                                            {{V2_pos, V2_id}, _B3}
                                    end),
    {V1_guards, _B10} = protocol:array(_B5,
                                       fun (_B6) ->
                                               {V2_pos, _B7} =
                                                   protocol:uint16(_B6),
                                               {V2_id, _B8} =
                                                   protocol:uint32(_B7),
                                               {{V2_pos, V2_id}, _B8}
                                       end),
    {ok, {V1_pets, V1_guards}};
unpack(cli, 14214, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_op_code, V1_msg}};
unpack(srv, 14215, _B0) -> {ok, {}};
unpack(cli, 14215, _B0) ->
    {V1_pets, _B5} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_pos, _B2} =
                                                protocol:uint16(_B1),
                                            {V2_id, _B3} = protocol:uint32(_B2),
                                            {{V2_pos, V2_id}, _B3}
                                    end),
    {V1_guards, _B10} = protocol:array(_B5,
                                       fun (_B6) ->
                                               {V2_pos, _B7} =
                                                   protocol:uint16(_B6),
                                               {V2_id, _B8} =
                                                   protocol:uint32(_B7),
                                               {{V2_pos, V2_id}, _B8}
                                       end),
    {ok, {V1_pets, V1_guards}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

