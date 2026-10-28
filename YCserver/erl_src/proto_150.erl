-file("src/proto/proto_150.erl", 1).

-module(proto_150).

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

-file("src/proto/proto_150.erl", 14).

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

-file("src/proto/proto_150.erl", 15).

-file("inc/wedding.hrl", 1).

-record(m_wedding,
        {ver = 1,
         lover_id = {0, "", 0},
         lover_name = "",
         status = 0,
         honor_ids = [],
         reward = [],
         mail = []}).

-record(lover,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         name = "" :: bitstring(),
         lover_id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         lover_name = "" :: bitstring(),
         type = 1 :: 1..2,
         status = 1 :: 0..2,
         ring_lev = 0 :: non_neg_integer(),
         intimacy = 0 :: non_neg_integer(),
         order_index = 0 :: non_neg_integer(),
         order_time = 0 :: non_neg_integer(),
         atmosp = 0 :: non_neg_integer(),
         index = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         lover_sex = 2 :: 0..2,
         lover_classes = 0,
         lover_lev = 0,
         lover_fc = 0,
         lover_pet_fc = 0,
         lover_face = 0}).

-record(guest,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         name = "" :: bitstring(),
         pid = 0 :: 0 | pid(),
         act_list = [],
         unit_list = [],
         classes = 0,
         sex = 0,
         lev = 0,
         face = 0}).

-record(wedding_atmosp_data,
        {type = 0 :: non_neg_integer(),
         min_val = 0 :: non_neg_integer(),
         max_val = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         scene_reward = [] :: list(),
         scene_msg = "" :: string(),
         male_reward = [] :: list(),
         famale_reward = [] :: list(),
         title = "" :: string(),
         content = "" :: string()}).

-record(wedding_act_data,
        {id = 0,
         type = 0,
         target = 1,
         free_num = 0,
         max_num = 0,
         cost = [],
         msg = "",
         log_msg = "",
         atmosp = 0,
         gain = [],
         main_gain = [],
         effect_type = 0,
         effect_id = 1,
         effect_num = 1,
         cd = 0}).

-record(wedding_rank, {type = 0, list = []}).

-record(wedding_rank_rc,
        {id = {{0, "", 0}, {0, "", 0}},
         male_id = {0, "", 0},
         male_name = "",
         rank = 1,
         time = 0 :: non_neg_integer(),
         male_sex = 0 :: 0..2,
         male_classes = 0 :: 0..4,
         male_lev = 0 :: non_neg_integer(),
         female_id = {0, "", 0},
         female_name = "",
         female_sex = 0 :: 0..2,
         female_classes = 0 :: 0..4,
         female_lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = ""}).

-record(wedding_rank_cfg,
        {type = 0 :: non_neg_integer(),
         num = 100 :: non_neg_integer(),
         keys =
             [#wedding_rank_rc.val3,
              #wedding_rank_rc.val2,
              #wedding_rank_rc.val1]
             :: [pos_integer()],
         min_val = 1 :: pos_integer()}).

-record(wedding_unit_data,
        {id = 0, target = 0, rand = [], limit = 0}).

-record(wedding_rank_honor_data,
        {type = 0,
         rank = 0,
         male_honor = 0,
         female_honor = 0,
         reward = [],
         title = "",
         content = ""}).

-record(wedding_rank_honor_type_data,
        {type = 0, day = day}).

-file("src/proto/proto_150.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 15000,
     {V0_id, V0_platform, V0_zone_id, V0_str}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_str))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15000:16/little,
       D_a_t_a/binary>>};
pack(srv, 15000, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15000:16/little,
       D_a_t_a/binary>>};
pack(cli, 15001, {}) ->
    {ok, <<2:32/little, 15001:16/little>>};
pack(srv, 15001,
     {V0_type,
      {V0_id, V0_platform, V0_zone_id},
      V0_classes,
      V0_sex,
      V0_lev,
      V0_face,
      V0_name,
      V0_str}) ->
    D_a_t_a = <<V0_type:8/little, V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_classes:32/little,
                V0_sex:32/little, V0_lev:32/little, V0_face:32/little,
                (protocol:pack(string, V0_name))/binary,
                (protocol:pack(string, V0_str))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15001:16/little,
       D_a_t_a/binary>>};
pack(cli, 15002,
     {V0_id, V0_platform, V0_zone_id, V0_flag}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little, V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15002:16/little,
       D_a_t_a/binary>>};
pack(srv, 15002, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15002:16/little,
       D_a_t_a/binary>>};
pack(cli, 15003, {}) ->
    {ok, <<2:32/little, 15003:16/little>>};
pack(srv, 15003,
     {V0_status,
      V0_type,
      V0_start_time,
      V0_end_time,
      {V0_male_id, V0_male_platform, V0_male_zone_id},
      V0_male_classes,
      V0_male_sex,
      V0_male_lev,
      V0_male_face,
      V0_male_name,
      {V0_female_id, V0_female_platform, V0_female_zone_id},
      V0_female_classes,
      V0_female_sex,
      V0_female_lev,
      V0_female_face,
      V0_female_name,
      V0_time}) ->
    D_a_t_a = <<V0_status:8/little, V0_type:8/little,
                V0_start_time:32/little, V0_end_time:32/little,
                V0_male_id:32/little,
                (protocol:pack(string, V0_male_platform))/binary,
                V0_male_zone_id:32/little, V0_male_classes:32/little,
                V0_male_sex:32/little, V0_male_lev:32/little,
                V0_male_face:32/little,
                (protocol:pack(string, V0_male_name))/binary,
                V0_female_id:32/little,
                (protocol:pack(string, V0_female_platform))/binary,
                V0_female_zone_id:32/little,
                V0_female_classes:32/little, V0_female_sex:32/little,
                V0_female_lev:32/little, V0_female_face:32/little,
                (protocol:pack(string, V0_female_name))/binary,
                V0_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15003:16/little,
       D_a_t_a/binary>>};
pack(cli, 15004, {V0_type, V0_list, V0_msg}) ->
    D_a_t_a = <<V0_type:8/little,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little>>
                                 || {V1_rid, V1_platform, V1_zone_id}
                                        <- V0_list]))/binary,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15004:16/little,
       D_a_t_a/binary>>};
pack(srv, 15004,
     {V0_type,
      V0_time,
      {V0_male_id, V0_male_platform, V0_male_zone_id},
      V0_male_classes,
      V0_male_sex,
      V0_male_lev,
      V0_male_face,
      V0_male_name,
      {V0_female_id, V0_female_platform, V0_female_zone_id},
      V0_female_classes,
      V0_female_sex,
      V0_female_lev,
      V0_female_face,
      V0_female_name,
      V0_msg}) ->
    D_a_t_a = <<V0_type:8/little, V0_time:32/little,
                V0_male_id:32/little,
                (protocol:pack(string, V0_male_platform))/binary,
                V0_male_zone_id:32/little, V0_male_classes:32/little,
                V0_male_sex:32/little, V0_male_lev:32/little,
                V0_male_face:32/little,
                (protocol:pack(string, V0_male_name))/binary,
                V0_female_id:32/little,
                (protocol:pack(string, V0_female_platform))/binary,
                V0_female_zone_id:32/little,
                V0_female_classes:32/little, V0_female_sex:32/little,
                V0_female_lev:32/little, V0_female_face:32/little,
                (protocol:pack(string, V0_female_name))/binary,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15004:16/little,
       D_a_t_a/binary>>};
pack(cli, 15005, {V0_type, V0_list}) ->
    D_a_t_a = <<V0_type:8/little,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little>>
                                 || {V1_rid, V1_platform, V1_zone_id}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15005:16/little,
       D_a_t_a/binary>>};
pack(srv, 15005, {V0_type, V0_list}) ->
    D_a_t_a = <<V0_type:8/little,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_classes:32/little, V1_sex:32/little,
                                   V1_lev:32/little, V1_face:32/little>>
                                 || {{V1_id, V1_platform, V1_zone_id},
                                     V1_name,
                                     V1_classes,
                                     V1_sex,
                                     V1_lev,
                                     V1_face}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15005:16/little,
       D_a_t_a/binary>>};
pack(cli, 15006, {V0_id, V0_msg}) ->
    D_a_t_a = <<V0_id:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15006:16/little,
       D_a_t_a/binary>>};
pack(srv, 15006, {V0_flag, V0_id}) ->
    D_a_t_a = <<V0_flag:8/little, V0_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15006:16/little,
       D_a_t_a/binary>>};
pack(cli, 15007, {V0_type}) ->
    D_a_t_a = <<V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15007:16/little,
       D_a_t_a/binary>>};
pack(srv, 15007, {V0_type, V0_list}) ->
    D_a_t_a = <<V0_type:8/little,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_id:8/little, V1_num:32/little,
                                   V1_mtime:32/little>>
                                 || {V1_id, V1_num, V1_mtime}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15007:16/little,
       D_a_t_a/binary>>};
pack(cli, 15008,
     {V0_type, V0_fid, V0_fplatform, V0_zone_id}) ->
    D_a_t_a = <<V0_type:8/little, V0_fid:32/little,
                (protocol:pack(string, V0_fplatform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15008:16/little,
       D_a_t_a/binary>>};
pack(srv, 15008, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15008:16/little,
       D_a_t_a/binary>>};
pack(cli, 15009, {}) ->
    {ok, <<2:32/little, 15009:16/little>>};
pack(srv, 15009, {}) ->
    {ok, <<2:32/little, 15009:16/little>>};
pack(cli, 15010, {}) ->
    {ok, <<2:32/little, 15010:16/little>>};
pack(srv, 15010, {}) ->
    {ok, <<2:32/little, 15010:16/little>>};
pack(cli, 15011, {}) ->
    {ok, <<2:32/little, 15011:16/little>>};
pack(srv, 15011, {V0_atmosp}) ->
    D_a_t_a = <<V0_atmosp:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15011:16/little,
       D_a_t_a/binary>>};
pack(cli, 15012, {}) ->
    {ok, <<2:32/little, 15012:16/little>>};
pack(srv, 15012, {V0_type, V0_act_logs}) ->
    D_a_t_a = <<V0_type:8/little,
                (length(V0_act_logs)):16/little,
                (list_to_binary([<<(protocol:pack(string,
                                                  V1_msg))/binary,
                                   V1_time:32/little>>
                                 || {V1_msg, V1_time}
                                        <- V0_act_logs]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15012:16/little,
       D_a_t_a/binary>>};
pack(cli, 15013, {}) ->
    {ok, <<2:32/little, 15013:16/little>>};
pack(srv, 15013, {V0_invit, V0_online, V0_max}) ->
    D_a_t_a = <<V0_invit:32/little, V0_online:32/little,
                V0_max:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15013:16/little,
       D_a_t_a/binary>>};
pack(cli, 15014, {}) ->
    {ok, <<2:32/little, 15014:16/little>>};
pack(srv, 15014,
     {{V0_id, V0_platform, V0_zone_id},
      V0_name,
      V0_classes,
      V0_sex,
      V0_lev,
      V0_face,
      V0_fc,
      V0_time,
      V0_intimacy,
      V0_status,
      V0_str}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_name))/binary,
                V0_classes:32/little, V0_sex:32/little,
                V0_lev:32/little, V0_face:32/little, V0_fc:32/little,
                V0_time:32/little, V0_intimacy:32/little,
                V0_status:32/little,
                (protocol:pack(string, V0_str))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15014:16/little,
       D_a_t_a/binary>>};
pack(cli, 15015, {V0_type}) ->
    D_a_t_a = <<V0_type:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15015:16/little,
       D_a_t_a/binary>>};
pack(srv, 15015, {V0_type, V0_list}) ->
    D_a_t_a = <<V0_type:32/little,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_m_id:32/little,
                                   (protocol:pack(string,
                                                  V1_m_platform))/binary,
                                   V1_m_zone_id:32/little,
                                   (protocol:pack(string, V1_male_name))/binary,
                                   V1_rank:32/little, V1_time:32/little,
                                   V1_male_sex:32/little,
                                   V1_male_classes:32/little,
                                   V1_male_lev:32/little, V1_f_id:32/little,
                                   (protocol:pack(string,
                                                  V1_f_platform))/binary,
                                   V1_f_zone_id:32/little,
                                   (protocol:pack(string,
                                                  V1_female_name))/binary,
                                   V1_female_sex:32/little,
                                   V1_female_classes:32/little,
                                   V1_female_lev:32/little, V1_val1:32/little,
                                   V1_val2:32/little, V1_val3:32/little,
                                   V1_val4:32/little,
                                   (protocol:pack(string, V1_desc))/binary>>
                                 || #wedding_rank_rc{male_id =
                                                         {V1_m_id,
                                                          V1_m_platform,
                                                          V1_m_zone_id},
                                                     male_name = V1_male_name,
                                                     rank = V1_rank,
                                                     time = V1_time,
                                                     male_sex = V1_male_sex,
                                                     male_classes =
                                                         V1_male_classes,
                                                     male_lev = V1_male_lev,
                                                     female_id =
                                                         {V1_f_id,
                                                          V1_f_platform,
                                                          V1_f_zone_id},
                                                     female_name =
                                                         V1_female_name,
                                                     female_sex = V1_female_sex,
                                                     female_classes =
                                                         V1_female_classes,
                                                     female_lev = V1_female_lev,
                                                     val1 = V1_val1,
                                                     val2 = V1_val2,
                                                     val3 = V1_val3,
                                                     val4 = V1_val4,
                                                     desc = V1_desc}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15015:16/little,
       D_a_t_a/binary>>};
pack(cli, 15016, {}) ->
    {ok, <<2:32/little, 15016:16/little>>};
pack(srv, 15016,
     {{V0_id, V0_platform, V0_zone_id},
      V0_name,
      V0_status}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_name))/binary,
                V0_status:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15016:16/little,
       D_a_t_a/binary>>};
pack(cli, 15017, {}) ->
    {ok, <<2:32/little, 15017:16/little>>};
pack(srv, 15017,
     {V0_type,
      V0_id,
      V0_platform,
      V0_id2,
      V0_id3,
      V0_x,
      V0_y,
      V0_time}) ->
    D_a_t_a = <<V0_type:32/little, V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_id2:32/little, V0_id3:32/little, V0_x:32/little,
                V0_y:32/little, V0_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15017:16/little,
       D_a_t_a/binary>>};
pack(cli, 15018, {}) ->
    {ok, <<2:32/little, 15018:16/little>>};
pack(srv, 15018,
     {V0_type,
      V0_use_item_id,
      V0_g_item_id,
      V0_g_bind,
      V0_g_num,
      V0_show_list,
      V0_pos,
      V0_msg,
      V0_max_times,
      V0_times}) ->
    D_a_t_a = <<V0_type:8/little, V0_use_item_id:32/little,
                V0_g_item_id:32/little, V0_g_bind:32/little,
                V0_g_num:32/little, (length(V0_show_list)):16/little,
                (list_to_binary([<<V1_item_id:32/little,
                                   V1_bind:32/little, V1_num:32/little>>
                                 || {V1_item_id, V1_bind, V1_num}
                                        <- V0_show_list]))/binary,
                V0_pos:32/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_max_times:32/little, V0_times:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15018:16/little,
       D_a_t_a/binary>>};
pack(cli, 15019, {V0_op_type}) ->
    D_a_t_a = <<V0_op_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15019:16/little,
       D_a_t_a/binary>>};
pack(srv, 15019, {V0_op_type, V0_type, V0_msg}) ->
    D_a_t_a = <<V0_op_type:8/little, V0_type:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15019:16/little,
       D_a_t_a/binary>>};
pack(cli, 15020, {V0_type}) ->
    D_a_t_a = <<V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15020:16/little,
       D_a_t_a/binary>>};
pack(srv, 15020,
     {V0_flag, V0_self_type, V0_type, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little, V0_self_type:8/little,
                V0_type:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15020:16/little,
       D_a_t_a/binary>>};
pack(cli, 15021, {V0_type}) ->
    D_a_t_a = <<V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15021:16/little,
       D_a_t_a/binary>>};
pack(srv, 15021,
     {V0_type,
      V0_self_type,
      V0_msg,
      {V0_id, V0_platform, V0_zone_id},
      V0_name,
      V0_status}) ->
    D_a_t_a = <<V0_type:8/little, V0_self_type:8/little,
                (protocol:pack(string, V0_msg))/binary, V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_name))/binary,
                V0_status:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15021:16/little,
       D_a_t_a/binary>>};
pack(cli, 15022, {}) ->
    {ok, <<2:32/little, 15022:16/little>>};
pack(srv, 15022, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15022:16/little,
       D_a_t_a/binary>>};
pack(cli, 15023, {}) ->
    {ok, <<2:32/little, 15023:16/little>>};
pack(srv, 15023, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little>>
                                 || {V1_id, V1_platform, V1_zone_id}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15023:16/little,
       D_a_t_a/binary>>};
pack(cli, 15024, {}) ->
    {ok, <<2:32/little, 15024:16/little>>};
pack(srv, 15024, {V0_family_info}) ->
    D_a_t_a = <<(length(V0_family_info)):16/little,
                (list_to_binary([<<V1_fid:32/little,
                                   (protocol:pack(string, V1_fplatform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_role_name))/binary,
                                   V1_lev:32/little>>
                                 || {{V1_fid, V1_fplatform, V1_zone_id},
                                     V1_role_name,
                                     V1_lev}
                                        <- V0_family_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15024:16/little,
       D_a_t_a/binary>>};
pack(cli, 15025, {}) ->
    {ok, <<2:32/little, 15025:16/little>>};
pack(srv, 15025, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_id:16/little, V1_times:16/little>>
                                 || {V1_id, V1_times} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15025:16/little,
       D_a_t_a/binary>>};
pack(cli, 15026, {V0_id}) ->
    D_a_t_a = <<V0_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15026:16/little,
       D_a_t_a/binary>>};
pack(srv, 15026, {V0_id, V0_times}) ->
    D_a_t_a = <<V0_id:16/little, V0_times:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15026:16/little,
       D_a_t_a/binary>>};
pack(cli, 15027, {}) ->
    {ok, <<2:32/little, 15027:16/little>>};
pack(srv, 15027, {V0_honor_id_now, V0_honor_list}) ->
    D_a_t_a = <<V0_honor_id_now:32/little,
                (length(V0_honor_list)):16/little,
                (list_to_binary([<<V1_honor_id:32/little>>
                                 || V1_honor_id <- V0_honor_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15027:16/little,
       D_a_t_a/binary>>};
pack(cli, 15028, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15028:16/little,
       D_a_t_a/binary>>};
pack(srv, 15028, {V0_honor_id}) ->
    D_a_t_a = <<V0_honor_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15028:16/little,
       D_a_t_a/binary>>};
pack(cli, 15029, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15029:16/little,
       D_a_t_a/binary>>};
pack(srv, 15029,
     {V0_male_name,
      V0_male_sex,
      V0_male_classes,
      {V0_male_id, V0_male_platform, V0_male_zone_id},
      V0_male_face_index,
      V0_male_face_time,
      V0_female_name,
      V0_female_sex,
      V0_female_classes,
      {V0_female_id, V0_female_platform, V0_female_zone_id},
      V0_female_face_index,
      V0_female_face_time,
      V0_intimacy,
      V0_time}) ->
    D_a_t_a = <<(protocol:pack(string,
                               V0_male_name))/binary,
                V0_male_sex:8/little, V0_male_classes:8/little,
                V0_male_id:32/little,
                (protocol:pack(string, V0_male_platform))/binary,
                V0_male_zone_id:32/little, V0_male_face_index:32/little,
                V0_male_face_time:32/little,
                (protocol:pack(string, V0_female_name))/binary,
                V0_female_sex:8/little, V0_female_classes:8/little,
                V0_female_id:32/little,
                (protocol:pack(string, V0_female_platform))/binary,
                V0_female_zone_id:32/little,
                V0_female_face_index:32/little,
                V0_female_face_time:32/little, V0_intimacy:32/little,
                V0_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 15029:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 15000, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_str, _B4} = protocol:string(_B3),
    {ok, {V1_id, V1_platform, V1_zone_id, V1_str}};
unpack(cli, 15000, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(srv, 15001, _B0) -> {ok, {}};
unpack(cli, 15001, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_platform, _B3} = protocol:string(_B2),
    {V1_zone_id, _B4} = protocol:uint32(_B3),
    {V1_classes, _B5} = protocol:uint32(_B4),
    {V1_sex, _B6} = protocol:uint32(_B5),
    {V1_lev, _B7} = protocol:uint32(_B6),
    {V1_face, _B8} = protocol:uint32(_B7),
    {V1_name, _B9} = protocol:string(_B8),
    {V1_str, _B10} = protocol:string(_B9),
    {ok,
     {V1_type,
      V1_id,
      V1_platform,
      V1_zone_id,
      V1_classes,
      V1_sex,
      V1_lev,
      V1_face,
      V1_name,
      V1_str}};
unpack(srv, 15002, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_flag, _B4} = protocol:uint8(_B3),
    {ok, {V1_id, V1_platform, V1_zone_id, V1_flag}};
unpack(cli, 15002, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(srv, 15003, _B0) -> {ok, {}};
unpack(cli, 15003, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {V1_start_time, _B3} = protocol:uint32(_B2),
    {V1_end_time, _B4} = protocol:uint32(_B3),
    {V1_male_id, _B5} = protocol:uint32(_B4),
    {V1_male_platform, _B6} = protocol:string(_B5),
    {V1_male_zone_id, _B7} = protocol:uint32(_B6),
    {V1_male_classes, _B8} = protocol:uint32(_B7),
    {V1_male_sex, _B9} = protocol:uint32(_B8),
    {V1_male_lev, _B10} = protocol:uint32(_B9),
    {V1_male_face, _B11} = protocol:uint32(_B10),
    {V1_male_name, _B12} = protocol:string(_B11),
    {V1_female_id, _B13} = protocol:uint32(_B12),
    {V1_female_platform, _B14} = protocol:string(_B13),
    {V1_female_zone_id, _B15} = protocol:uint32(_B14),
    {V1_female_classes, _B16} = protocol:uint32(_B15),
    {V1_female_sex, _B17} = protocol:uint32(_B16),
    {V1_female_lev, _B18} = protocol:uint32(_B17),
    {V1_female_face, _B19} = protocol:uint32(_B18),
    {V1_female_name, _B20} = protocol:string(_B19),
    {V1_time, _B21} = protocol:uint32(_B20),
    {ok,
     {V1_status,
      V1_type,
      V1_start_time,
      V1_end_time,
      V1_male_id,
      V1_male_platform,
      V1_male_zone_id,
      V1_male_classes,
      V1_male_sex,
      V1_male_lev,
      V1_male_face,
      V1_male_name,
      V1_female_id,
      V1_female_platform,
      V1_female_zone_id,
      V1_female_classes,
      V1_female_sex,
      V1_female_lev,
      V1_female_face,
      V1_female_name,
      V1_time}};
unpack(srv, 15004, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_list, _B7} = protocol:array(_B1,
                                    fun (_B2) ->
                                            {V2_rid, _B3} =
                                                protocol:uint32(_B2),
                                            {V2_platform, _B4} =
                                                protocol:string(_B3),
                                            {V2_zone_id, _B5} =
                                                protocol:uint32(_B4),
                                            {{V2_rid, V2_platform, V2_zone_id},
                                             _B5}
                                    end),
    {V1_msg, _B8} = protocol:string(_B7),
    {ok, {V1_type, V1_list, V1_msg}};
unpack(cli, 15004, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_time, _B2} = protocol:uint32(_B1),
    {V1_male_id, _B3} = protocol:uint32(_B2),
    {V1_male_platform, _B4} = protocol:string(_B3),
    {V1_male_zone_id, _B5} = protocol:uint32(_B4),
    {V1_male_classes, _B6} = protocol:uint32(_B5),
    {V1_male_sex, _B7} = protocol:uint32(_B6),
    {V1_male_lev, _B8} = protocol:uint32(_B7),
    {V1_male_face, _B9} = protocol:uint32(_B8),
    {V1_male_name, _B10} = protocol:string(_B9),
    {V1_female_id, _B11} = protocol:uint32(_B10),
    {V1_female_platform, _B12} = protocol:string(_B11),
    {V1_female_zone_id, _B13} = protocol:uint32(_B12),
    {V1_female_classes, _B14} = protocol:uint32(_B13),
    {V1_female_sex, _B15} = protocol:uint32(_B14),
    {V1_female_lev, _B16} = protocol:uint32(_B15),
    {V1_female_face, _B17} = protocol:uint32(_B16),
    {V1_female_name, _B18} = protocol:string(_B17),
    {V1_msg, _B19} = protocol:string(_B18),
    {ok,
     {V1_type,
      V1_time,
      V1_male_id,
      V1_male_platform,
      V1_male_zone_id,
      V1_male_classes,
      V1_male_sex,
      V1_male_lev,
      V1_male_face,
      V1_male_name,
      V1_female_id,
      V1_female_platform,
      V1_female_zone_id,
      V1_female_classes,
      V1_female_sex,
      V1_female_lev,
      V1_female_face,
      V1_female_name,
      V1_msg}};
unpack(srv, 15005, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_list, _B7} = protocol:array(_B1,
                                    fun (_B2) ->
                                            {V2_rid, _B3} =
                                                protocol:uint32(_B2),
                                            {V2_platform, _B4} =
                                                protocol:string(_B3),
                                            {V2_zone_id, _B5} =
                                                protocol:uint32(_B4),
                                            {{V2_rid, V2_platform, V2_zone_id},
                                             _B5}
                                    end),
    {ok, {V1_type, V1_list}};
unpack(cli, 15005, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_list, _B12} = protocol:array(_B1,
                                     fun (_B2) ->
                                             {V2_id, _B3} =
                                                 protocol:uint32(_B2),
                                             {V2_platform, _B4} =
                                                 protocol:string(_B3),
                                             {V2_zone_id, _B5} =
                                                 protocol:uint32(_B4),
                                             {V2_name, _B6} =
                                                 protocol:string(_B5),
                                             {V2_classes, _B7} =
                                                 protocol:uint32(_B6),
                                             {V2_sex, _B8} =
                                                 protocol:uint32(_B7),
                                             {V2_lev, _B9} =
                                                 protocol:uint32(_B8),
                                             {V2_face, _B10} =
                                                 protocol:uint32(_B9),
                                             {{V2_id,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_name,
                                               V2_classes,
                                               V2_sex,
                                               V2_lev,
                                               V2_face},
                                              _B10}
                                     end),
    {ok, {V1_type, V1_list}};
unpack(srv, 15006, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_id, V1_msg}};
unpack(cli, 15006, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint8(_B1),
    {ok, {V1_flag, V1_id}};
unpack(srv, 15007, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_type}};
unpack(cli, 15007, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_list, _B7} = protocol:array(_B1,
                                    fun (_B2) ->
                                            {V2_id, _B3} = protocol:uint8(_B2),
                                            {V2_num, _B4} =
                                                protocol:uint32(_B3),
                                            {V2_mtime, _B5} =
                                                protocol:uint32(_B4),
                                            {{V2_id, V2_num, V2_mtime}, _B5}
                                    end),
    {ok, {V1_type, V1_list}};
unpack(srv, 15008, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_fid, _B2} = protocol:uint32(_B1),
    {V1_fplatform, _B3} = protocol:string(_B2),
    {V1_zone_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_type, V1_fid, V1_fplatform, V1_zone_id}};
unpack(cli, 15008, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(srv, 15009, _B0) -> {ok, {}};
unpack(cli, 15009, _B0) -> {ok, {}};
unpack(srv, 15010, _B0) -> {ok, {}};
unpack(cli, 15010, _B0) -> {ok, {}};
unpack(srv, 15011, _B0) -> {ok, {}};
unpack(cli, 15011, _B0) ->
    {V1_atmosp, _B1} = protocol:uint32(_B0),
    {ok, {V1_atmosp}};
unpack(srv, 15012, _B0) -> {ok, {}};
unpack(cli, 15012, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_act_logs, _B6} = protocol:array(_B1,
                                        fun (_B2) ->
                                                {V2_msg, _B3} =
                                                    protocol:string(_B2),
                                                {V2_time, _B4} =
                                                    protocol:uint32(_B3),
                                                {{V2_msg, V2_time}, _B4}
                                        end),
    {ok, {V1_type, V1_act_logs}};
unpack(srv, 15013, _B0) -> {ok, {}};
unpack(cli, 15013, _B0) ->
    {V1_invit, _B1} = protocol:uint32(_B0),
    {V1_online, _B2} = protocol:uint32(_B1),
    {V1_max, _B3} = protocol:uint32(_B2),
    {ok, {V1_invit, V1_online, V1_max}};
unpack(srv, 15014, _B0) -> {ok, {}};
unpack(cli, 15014, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_classes, _B5} = protocol:uint32(_B4),
    {V1_sex, _B6} = protocol:uint32(_B5),
    {V1_lev, _B7} = protocol:uint32(_B6),
    {V1_face, _B8} = protocol:uint32(_B7),
    {V1_fc, _B9} = protocol:uint32(_B8),
    {V1_time, _B10} = protocol:uint32(_B9),
    {V1_intimacy, _B11} = protocol:uint32(_B10),
    {V1_status, _B12} = protocol:uint32(_B11),
    {V1_str, _B13} = protocol:string(_B12),
    {ok,
     {V1_id,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_classes,
      V1_sex,
      V1_lev,
      V1_face,
      V1_fc,
      V1_time,
      V1_intimacy,
      V1_status,
      V1_str}};
unpack(srv, 15015, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {ok, {V1_type}};
unpack(cli, 15015, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_list, _B25} = protocol:array(_B1,
                                     fun (_B2) ->
                                             {V2_m_id, _B3} =
                                                 protocol:uint32(_B2),
                                             {V2_m_platform, _B4} =
                                                 protocol:string(_B3),
                                             {V2_m_zone_id, _B5} =
                                                 protocol:uint32(_B4),
                                             {V2_male_name, _B6} =
                                                 protocol:string(_B5),
                                             {V2_rank, _B7} =
                                                 protocol:uint32(_B6),
                                             {V2_time, _B8} =
                                                 protocol:uint32(_B7),
                                             {V2_male_sex, _B9} =
                                                 protocol:uint32(_B8),
                                             {V2_male_classes, _B10} =
                                                 protocol:uint32(_B9),
                                             {V2_male_lev, _B11} =
                                                 protocol:uint32(_B10),
                                             {V2_f_id, _B12} =
                                                 protocol:uint32(_B11),
                                             {V2_f_platform, _B13} =
                                                 protocol:string(_B12),
                                             {V2_f_zone_id, _B14} =
                                                 protocol:uint32(_B13),
                                             {V2_female_name, _B15} =
                                                 protocol:string(_B14),
                                             {V2_female_sex, _B16} =
                                                 protocol:uint32(_B15),
                                             {V2_female_classes, _B17} =
                                                 protocol:uint32(_B16),
                                             {V2_female_lev, _B18} =
                                                 protocol:uint32(_B17),
                                             {V2_val1, _B19} =
                                                 protocol:uint32(_B18),
                                             {V2_val2, _B20} =
                                                 protocol:uint32(_B19),
                                             {V2_val3, _B21} =
                                                 protocol:uint32(_B20),
                                             {V2_val4, _B22} =
                                                 protocol:uint32(_B21),
                                             {V2_desc, _B23} =
                                                 protocol:string(_B22),
                                             {{V2_m_id,
                                               V2_m_platform,
                                               V2_m_zone_id,
                                               V2_male_name,
                                               V2_rank,
                                               V2_time,
                                               V2_male_sex,
                                               V2_male_classes,
                                               V2_male_lev,
                                               V2_f_id,
                                               V2_f_platform,
                                               V2_f_zone_id,
                                               V2_female_name,
                                               V2_female_sex,
                                               V2_female_classes,
                                               V2_female_lev,
                                               V2_val1,
                                               V2_val2,
                                               V2_val3,
                                               V2_val4,
                                               V2_desc},
                                              _B23}
                                     end),
    {ok, {V1_type, V1_list}};
unpack(srv, 15016, _B0) -> {ok, {}};
unpack(cli, 15016, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_status, _B5} = protocol:uint32(_B4),
    {ok,
     {V1_id, V1_platform, V1_zone_id, V1_name, V1_status}};
unpack(srv, 15017, _B0) -> {ok, {}};
unpack(cli, 15017, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_platform, _B3} = protocol:string(_B2),
    {V1_id2, _B4} = protocol:uint32(_B3),
    {V1_id3, _B5} = protocol:uint32(_B4),
    {V1_x, _B6} = protocol:uint32(_B5),
    {V1_y, _B7} = protocol:uint32(_B6),
    {V1_time, _B8} = protocol:uint32(_B7),
    {ok,
     {V1_type,
      V1_id,
      V1_platform,
      V1_id2,
      V1_id3,
      V1_x,
      V1_y,
      V1_time}};
unpack(srv, 15018, _B0) -> {ok, {}};
unpack(cli, 15018, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_use_item_id, _B2} = protocol:uint32(_B1),
    {V1_g_item_id, _B3} = protocol:uint32(_B2),
    {V1_g_bind, _B4} = protocol:uint32(_B3),
    {V1_g_num, _B5} = protocol:uint32(_B4),
    {V1_show_list, _B11} = protocol:array(_B5,
                                          fun (_B6) ->
                                                  {V2_item_id, _B7} =
                                                      protocol:uint32(_B6),
                                                  {V2_bind, _B8} =
                                                      protocol:uint32(_B7),
                                                  {V2_num, _B9} =
                                                      protocol:uint32(_B8),
                                                  {{V2_item_id,
                                                    V2_bind,
                                                    V2_num},
                                                   _B9}
                                          end),
    {V1_pos, _B12} = protocol:uint32(_B11),
    {V1_msg, _B13} = protocol:string(_B12),
    {V1_max_times, _B14} = protocol:uint32(_B13),
    {V1_times, _B15} = protocol:uint32(_B14),
    {ok,
     {V1_type,
      V1_use_item_id,
      V1_g_item_id,
      V1_g_bind,
      V1_g_num,
      V1_show_list,
      V1_pos,
      V1_msg,
      V1_max_times,
      V1_times}};
unpack(srv, 15019, _B0) ->
    {V1_op_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_op_type}};
unpack(cli, 15019, _B0) ->
    {V1_op_type, _B1} = protocol:uint8(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_op_type, V1_type, V1_msg}};
unpack(srv, 15020, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_type}};
unpack(cli, 15020, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_self_type, _B2} = protocol:uint8(_B1),
    {V1_type, _B3} = protocol:uint8(_B2),
    {V1_msg, _B4} = protocol:string(_B3),
    {ok, {V1_flag, V1_self_type, V1_type, V1_msg}};
unpack(srv, 15021, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_type}};
unpack(cli, 15021, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_self_type, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {V1_id, _B4} = protocol:uint32(_B3),
    {V1_platform, _B5} = protocol:string(_B4),
    {V1_zone_id, _B6} = protocol:uint32(_B5),
    {V1_name, _B7} = protocol:string(_B6),
    {V1_status, _B8} = protocol:uint32(_B7),
    {ok,
     {V1_type,
      V1_self_type,
      V1_msg,
      V1_id,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_status}};
unpack(srv, 15022, _B0) -> {ok, {}};
unpack(cli, 15022, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(srv, 15023, _B0) -> {ok, {}};
unpack(cli, 15023, _B0) ->
    {V1_list, _B6} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_id, _B2} = protocol:uint32(_B1),
                                            {V2_platform, _B3} =
                                                protocol:string(_B2),
                                            {V2_zone_id, _B4} =
                                                protocol:uint32(_B3),
                                            {{V2_id, V2_platform, V2_zone_id},
                                             _B4}
                                    end),
    {ok, {V1_list}};
unpack(srv, 15024, _B0) -> {ok, {}};
unpack(cli, 15024, _B0) ->
    {V1_family_info, _B8} = protocol:array(_B0,
                                           fun (_B1) ->
                                                   {V2_fid, _B2} =
                                                       protocol:uint32(_B1),
                                                   {V2_fplatform, _B3} =
                                                       protocol:string(_B2),
                                                   {V2_zone_id, _B4} =
                                                       protocol:uint32(_B3),
                                                   {V2_role_name, _B5} =
                                                       protocol:string(_B4),
                                                   {V2_lev, _B6} =
                                                       protocol:uint32(_B5),
                                                   {{V2_fid,
                                                     V2_fplatform,
                                                     V2_zone_id,
                                                     V2_role_name,
                                                     V2_lev},
                                                    _B6}
                                           end),
    {ok, {V1_family_info}};
unpack(srv, 15025, _B0) -> {ok, {}};
unpack(cli, 15025, _B0) ->
    {V1_list, _B5} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_id, _B2} = protocol:uint16(_B1),
                                            {V2_times, _B3} =
                                                protocol:uint16(_B2),
                                            {{V2_id, V2_times}, _B3}
                                    end),
    {ok, {V1_list}};
unpack(srv, 15026, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0),
    {ok, {V1_id}};
unpack(cli, 15026, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0),
    {V1_times, _B2} = protocol:uint16(_B1),
    {ok, {V1_id, V1_times}};
unpack(srv, 15027, _B0) -> {ok, {}};
unpack(cli, 15027, _B0) ->
    {V1_honor_id_now, _B1} = protocol:uint32(_B0),
    {V1_honor_list, _B5} = protocol:array(_B1,
                                          fun (_B2) ->
                                                  {V2_honor_id, _B3} =
                                                      protocol:uint32(_B2),
                                                  {{V2_honor_id}, _B3}
                                          end),
    {ok, {V1_honor_id_now, V1_honor_list}};
unpack(srv, 15028, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 15028, _B0) ->
    {V1_honor_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_honor_id}};
unpack(srv, 15029, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 15029, _B0) ->
    {V1_male_name, _B1} = protocol:string(_B0),
    {V1_male_sex, _B2} = protocol:uint8(_B1),
    {V1_male_classes, _B3} = protocol:uint8(_B2),
    {V1_male_id, _B4} = protocol:uint32(_B3),
    {V1_male_platform, _B5} = protocol:string(_B4),
    {V1_male_zone_id, _B6} = protocol:uint32(_B5),
    {V1_male_face_index, _B7} = protocol:uint32(_B6),
    {V1_male_face_time, _B8} = protocol:uint32(_B7),
    {V1_female_name, _B9} = protocol:string(_B8),
    {V1_female_sex, _B10} = protocol:uint8(_B9),
    {V1_female_classes, _B11} = protocol:uint8(_B10),
    {V1_female_id, _B12} = protocol:uint32(_B11),
    {V1_female_platform, _B13} = protocol:string(_B12),
    {V1_female_zone_id, _B14} = protocol:uint32(_B13),
    {V1_female_face_index, _B15} = protocol:uint32(_B14),
    {V1_female_face_time, _B16} = protocol:uint32(_B15),
    {V1_intimacy, _B17} = protocol:uint32(_B16),
    {V1_time, _B18} = protocol:uint32(_B17),
    {ok,
     {V1_male_name,
      V1_male_sex,
      V1_male_classes,
      V1_male_id,
      V1_male_platform,
      V1_male_zone_id,
      V1_male_face_index,
      V1_male_face_time,
      V1_female_name,
      V1_female_sex,
      V1_female_classes,
      V1_female_id,
      V1_female_platform,
      V1_female_zone_id,
      V1_female_face_index,
      V1_female_face_time,
      V1_intimacy,
      V1_time}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

