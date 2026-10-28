-file("src/proto/proto_112.erl", 1).

-module(proto_112).

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

-file("src/proto/proto_112.erl", 14).

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

-file("src/proto/proto_112.erl", 15).

-file("inc/family.hrl", 1).

-record(beans_reward,
        {id = 0,
         giver_id = {0, "", 0},
         giver_name = "",
         belong_id = {0, "", 0},
         pos = {0, 0},
         give_time = 0}).

-record(magic_beans,
        {ver = 2,
         growth = 0 :: non_neg_integer(),
         flower_num = 0 :: non_neg_integer(),
         wake_time = 0 :: non_neg_integer(),
         event_record = [],
         fosters = [],
         inviters = [],
         beans_rewards = [],
         next_beanrw_id = 0}).

-record(family_info,
        {ver = 5 :: pos_integer(),
         id = {0, "", 0},
         master_id = {0, "", 0},
         master_name = "",
         master_classes = 0 :: pos_integer(),
         master_lev = 1 :: pos_integer(),
         master_sex = 0 :: 0..2,
         lover_id = {0, "", 0},
         lover_name = "",
         pid :: undefined | pid(),
         house_info = undefined,
         yard_info = undefined,
         visitor = [],
         last_visit_time = 0,
         visit_lock = 1,
         last_rf_time = 0,
         magic_beans = #magic_beans{},
         battle_id}).

-record(furnishing,
        {id = 0 :: non_neg_integer(),
         base_id = 0,
         num = 1,
         status = 1,
         belong = {0, "", 0},
         pos = {1, 1, 1, 1} :: tuple(),
         dir = 0 :: 0..1}).

-record(house_info,
        {ver = 3 :: pos_integer(),
         map_id = 0,
         map_pid :: undefined | pid(),
         furnishings = [] :: list(),
         env_val = 0,
         lev = 1 :: pos_integer(),
         floor_lev = 0 :: non_neg_integer(),
         bdg_info = [] :: list(),
         furishing_max_lev_info = [] :: list(),
         next_fur_id = 1,
         cleanness = 100,
         last_clean_time = 0,
         housekeeper_action_times = 0,
         is_upgrade_bdg = []}).

-record(building_info, {type = 1, lev = 0, exp = 0}).

-record(yard_info,
        {ver = 1 :: pos_integer(),
         map_id = 0,
         map_pid :: undefined | pid(),
         furnishings = [] :: list(),
         levl = 1 :: pos_integer(),
         floor_lev = 0 :: non_neg_integer()}).

-record(family_store,
        {ver = 1,
         next_time = 0 :: non_neg_integer(),
         goods_list = []}).

-record(m_family,
        {ver = 1,
         cur_id = {0, "", 0},
         pid :: undefined | pid(),
         idle_family = {0, "", 0},
         family_store = #family_store{},
         family_effect = [],
         effect_use_info = []}).

-record(family_pet_train_info,
        {id = 1, pet_id = 0, end_time = 0}).

-record(fshop_item,
        {id = 0,
         store_type = 1,
         base_id = 0,
         type = 90000,
         val = 0,
         count = 1}).

-record(family_child,
        {id = {0, "", 0},
         name = "",
         classes = 0 :: pos_integer(),
         lev = 1 :: pos_integer(),
         sex = 0 :: 0..2,
         stage = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         unit_id = {0, 0},
         unit_base_id = 0}).

-file("src/proto/proto_112.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 11200, {}) ->
    {ok, <<2:32/little, 11200:16/little>>};
pack(srv, 11200,
     {#family_info{id = {V0_fid, V0_platform, V0_zone_id},
                   master_name = V0_master_name,
                   house_info =
                       #house_info{map_id = V0_map_id, lev = V0_lev,
                                   env_val = V0_env_val,
                                   furnishings = V0_furnishings,
                                   floor_lev = V0_floor_lev,
                                   bdg_info = V0_bdg_info,
                                   cleanness = V0_cleanness,
                                   housekeeper_action_times =
                                       V0_housekeeper_action_times,
                                   is_upgrade_bdg = V0_is_upgrade_bdg},
                   visit_lock = V0_visit_lock,
                   magic_beans =
                       #magic_beans{growth = V0_growth,
                                    flower_num = V0_flower_num,
                                    wake_time = V0_wake_time,
                                    event_record = V0_event_record,
                                    inviters = V0_inviters,
                                    fosters = V0_fosters,
                                    beans_rewards = V0_beans_rewards},
                   battle_id = V0_battle_id}}) ->
    D_a_t_a = <<V0_fid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_master_name))/binary,
                V0_map_id:32/little, V0_lev:32/little,
                V0_env_val:32/little,
                (length(V0_furnishings)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_base_id:32/little, V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little, V1_num:32/little,
                                   V1_status:32/little, V1_x:16/little,
                                   V1_y:16/little, V1_gx:16/little,
                                   V1_gy:16/little, V1_dir:8/little>>
                                 || #furnishing{id = V1_id,
                                                base_id = V1_base_id,
                                                belong =
                                                    {V1_rid,
                                                     V1_platform,
                                                     V1_zone_id},
                                                num = V1_num,
                                                status = V1_status,
                                                pos =
                                                    {V1_x, V1_y, V1_gx, V1_gy},
                                                dir = V1_dir}
                                        <- V0_furnishings]))/binary,
                V0_floor_lev:32/little, (length(V0_bdg_info)):16/little,
                (list_to_binary([<<V1_type:8/little, V1_lev:32/little,
                                   V1_exp:32/little>>
                                 || #building_info{type = V1_type, lev = V1_lev,
                                                   exp = V1_exp}
                                        <- V0_bdg_info]))/binary,
                V0_cleanness:32/little,
                V0_housekeeper_action_times:32/little,
                (length(V0_is_upgrade_bdg)):16/little,
                (list_to_binary([<<V1_bad_type:8/little,
                                   V1_done:8/little>>
                                 || {V1_bad_type, V1_done}
                                        <- V0_is_upgrade_bdg]))/binary,
                V0_visit_lock:8/little, V0_growth:32/little,
                V0_flower_num:8/little, V0_wake_time:32/little,
                (length(V0_event_record)):16/little,
                (list_to_binary([<<V1_time:32/little, V1_wid:32/little,
                                   (protocol:pack(string, V1_wplatform))/binary,
                                   V1_wzone_id:16/little,
                                   (protocol:pack(string, V1_role_name))/binary,
                                   V1_event:8/signed-little>>
                                 || {V1_time,
                                     {V1_wid, V1_wplatform, V1_wzone_id},
                                     V1_role_name,
                                     V1_event}
                                        <- V0_event_record]))/binary,
                (length(V0_inviters)):16/little,
                (list_to_binary([<<V1_ivtid:32/little,
                                   (protocol:pack(string,
                                                  V1_ivtplatform))/binary,
                                   V1_ivtzone_id:16/little>>
                                 || {V1_ivtid, V1_ivtplatform, V1_ivtzone_id}
                                        <- V0_inviters]))/binary,
                (length(V0_fosters)):16/little,
                (list_to_binary([<<V1_fsttid:32/little,
                                   (protocol:pack(string,
                                                  V1_fstplatform))/binary,
                                   V1_fstzone_id:16/little>>
                                 || {V1_fsttid, V1_fstplatform, V1_fstzone_id}
                                        <- V0_fosters]))/binary,
                (length(V0_beans_rewards)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_gvid:32/little,
                                   (protocol:pack(string,
                                                  V1_gvplatform))/binary,
                                   V1_gvzone_id:16/little,
                                   (protocol:pack(string,
                                                  V1_giver_name))/binary,
                                   V1_blid:32/little,
                                   (protocol:pack(string,
                                                  V1_blplatform))/binary,
                                   V1_blzone_id:16/little, V1_pos_x:16/little,
                                   V1_pos_y:16/little>>
                                 || #beans_reward{id = V1_id,
                                                  giver_id =
                                                      {V1_gvid,
                                                       V1_gvplatform,
                                                       V1_gvzone_id},
                                                  giver_name = V1_giver_name,
                                                  belong_id =
                                                      {V1_blid,
                                                       V1_blplatform,
                                                       V1_blzone_id},
                                                  pos = {V1_pos_x, V1_pos_y}}
                                        <- V0_beans_rewards]))/binary,
                V0_battle_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11200:16/little,
       D_a_t_a/binary>>};
pack(cli, 11201, {}) ->
    {ok, <<2:32/little, 11201:16/little>>};
pack(srv, 11201, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11201:16/little,
       D_a_t_a/binary>>};
pack(cli, 11202, {{V0_fid, V0_platform, V0_zone_id}}) ->
    D_a_t_a = <<V0_fid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11202:16/little,
       D_a_t_a/binary>>};
pack(srv, 11202, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11202:16/little,
       D_a_t_a/binary>>};
pack(cli, 11203, {}) ->
    {ok, <<2:32/little, 11203:16/little>>};
pack(srv, 11203, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11203:16/little,
       D_a_t_a/binary>>};
pack(cli, 11204,
     {V0_id, {V0_x, V0_y, V0_gx, V0_gy}, V0_dir}) ->
    D_a_t_a = <<V0_id:32/little, V0_x:16/little,
                V0_y:16/little, V0_gx:16/little, V0_gy:16/little,
                V0_dir:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11204:16/little,
       D_a_t_a/binary>>};
pack(srv, 11204, {V0_flag, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11204:16/little,
       D_a_t_a/binary>>};
pack(cli, 11205, {}) ->
    {ok, <<2:32/little, 11205:16/little>>};
pack(srv, 11205, {V0_update_info}) ->
    D_a_t_a = <<(length(V0_update_info)):16/little,
                (list_to_binary([<<V1_flag:8/little, V1_id:32/little,
                                   V1_base_id:32/little, V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little, V1_num:32/little,
                                   V1_status:32/little, V1_x:16/little,
                                   V1_y:16/little, V1_gx:16/little,
                                   V1_gy:16/little, V1_dir:8/little>>
                                 || {V1_flag,
                                     #furnishing{id = V1_id,
                                                 base_id = V1_base_id,
                                                 belong =
                                                     {V1_rid,
                                                      V1_platform,
                                                      V1_zone_id},
                                                 num = V1_num,
                                                 status = V1_status,
                                                 pos =
                                                     {V1_x, V1_y, V1_gx, V1_gy},
                                                 dir = V1_dir}}
                                        <- V0_update_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11205:16/little,
       D_a_t_a/binary>>};
pack(cli, 11206, {}) ->
    {ok, <<2:32/little, 11206:16/little>>};
pack(srv, 11206, {{V0_fid, V0_platform, V0_zone_id}}) ->
    D_a_t_a = <<V0_fid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11206:16/little,
       D_a_t_a/binary>>};
pack(cli, 11207, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11207:16/little,
       D_a_t_a/binary>>};
pack(srv, 11207, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11207:16/little,
       D_a_t_a/binary>>};
pack(cli, 11208, {}) ->
    {ok, <<2:32/little, 11208:16/little>>};
pack(srv, 11208, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11208:16/little,
       D_a_t_a/binary>>};
pack(cli, 11209, {V0_bad_type}) ->
    D_a_t_a = <<V0_bad_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11209:16/little,
       D_a_t_a/binary>>};
pack(srv, 11209, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11209:16/little,
       D_a_t_a/binary>>};
pack(cli, 11210, {V0_bad_type}) ->
    D_a_t_a = <<V0_bad_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11210:16/little,
       D_a_t_a/binary>>};
pack(srv, 11210, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11210:16/little,
       D_a_t_a/binary>>};
pack(cli, 11211, {}) ->
    {ok, <<2:32/little, 11211:16/little>>};
pack(srv, 11211, {V0_goods_list}) ->
    D_a_t_a = <<(length(V0_goods_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_store_type:8/little, V1_base_id:32/little,
                                   V1_type:32/little, V1_val:32/little,
                                   V1_count:32/little>>
                                 || #fshop_item{id = V1_id,
                                                store_type = V1_store_type,
                                                base_id = V1_base_id,
                                                type = V1_type, val = V1_val,
                                                count = V1_count}
                                        <- V0_goods_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11211:16/little,
       D_a_t_a/binary>>};
pack(cli, 11212, {V0_id, V0_num}) ->
    D_a_t_a = <<V0_id:32/little, V0_num:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11212:16/little,
       D_a_t_a/binary>>};
pack(srv, 11212, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11212:16/little,
       D_a_t_a/binary>>};
pack(cli, 11213, {}) ->
    {ok, <<2:32/little, 11213:16/little>>};
pack(srv, 11213, {V0_bdg_info}) ->
    D_a_t_a = <<(length(V0_bdg_info)):16/little,
                (list_to_binary([<<V1_type:8/little, V1_lev:32/little,
                                   V1_exp:32/little>>
                                 || #building_info{type = V1_type, lev = V1_lev,
                                                   exp = V1_exp}
                                        <- V0_bdg_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11213:16/little,
       D_a_t_a/binary>>};
pack(cli, 11214, {V0_id, V0_train_id}) ->
    D_a_t_a = <<V0_id:32/little, V0_train_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11214:16/little,
       D_a_t_a/binary>>};
pack(srv, 11214, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11214:16/little,
       D_a_t_a/binary>>};
pack(cli, 11215, {}) ->
    {ok, <<2:32/little, 11215:16/little>>};
pack(srv, 11215, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11215:16/little,
       D_a_t_a/binary>>};
pack(cli, 11216, {}) ->
    {ok, <<2:32/little, 11216:16/little>>};
pack(srv, 11216, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11216:16/little,
       D_a_t_a/binary>>};
pack(cli, 11217, {}) ->
    {ok, <<2:32/little, 11217:16/little>>};
pack(srv, 11217, {V0_effect_list}) ->
    D_a_t_a = <<(length(V0_effect_list)):16/little,
                (list_to_binary([<<V1_effect_type:32/little,
                                   V1_val:32/little>>
                                 || {V1_effect_type, V1_val}
                                        <- V0_effect_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11217:16/little,
       D_a_t_a/binary>>};
pack(cli, 11218, {}) ->
    {ok, <<2:32/little, 11218:16/little>>};
pack(srv, 11218,
     {#family_info{id = {V0_fid, V0_platform, V0_zone_id},
                   house_info =
                       #house_info{map_id = V0_map_id, lev = V0_lev,
                                   env_val = V0_env_val,
                                   floor_lev = V0_floor_lev,
                                   cleanness = V0_cleanness,
                                   housekeeper_action_times =
                                       V0_housekeeper_action_times,
                                   is_upgrade_bdg = V0_is_upgrade_bdg},
                   visit_lock = V0_visit_lock,
                   battle_id = V0_battle_id}}) ->
    D_a_t_a = <<V0_fid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_map_id:32/little,
                V0_lev:32/little, V0_env_val:32/little,
                V0_floor_lev:32/little, V0_cleanness:32/little,
                V0_housekeeper_action_times:32/little,
                (length(V0_is_upgrade_bdg)):16/little,
                (list_to_binary([<<V1_bad_type:8/little,
                                   V1_done:8/little>>
                                 || {V1_bad_type, V1_done}
                                        <- V0_is_upgrade_bdg]))/binary,
                V0_visit_lock:8/little, V0_battle_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11218:16/little,
       D_a_t_a/binary>>};
pack(cli, 11219, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11219:16/little,
       D_a_t_a/binary>>};
pack(srv, 11219, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11219:16/little,
       D_a_t_a/binary>>};
pack(cli, 11220, {}) ->
    {ok, <<2:32/little, 11220:16/little>>};
pack(srv, 11220, {V0_train_info}) ->
    D_a_t_a = <<(length(V0_train_info)):16/little,
                (list_to_binary([<<V1_id:8/little, V1_pet_id:32/little,
                                   V1_end_time:32/little>>
                                 || #family_pet_train_info{id = V1_id,
                                                           pet_id = V1_pet_id,
                                                           end_time =
                                                               V1_end_time}
                                        <- V0_train_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11220:16/little,
       D_a_t_a/binary>>};
pack(cli, 11221, {}) ->
    {ok, <<2:32/little, 11221:16/little>>};
pack(srv, 11221, {V0_use_info}) ->
    D_a_t_a = <<(length(V0_use_info)):16/little,
                (list_to_binary([<<V1_effect_type:32/little,
                                   V1_val:32/little>>
                                 || {V1_effect_type, V1_val}
                                        <- V0_use_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11221:16/little,
       D_a_t_a/binary>>};
pack(cli, 11222, {V0_lock_lev}) ->
    D_a_t_a = <<V0_lock_lev:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11222:16/little,
       D_a_t_a/binary>>};
pack(srv, 11222, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11222:16/little,
       D_a_t_a/binary>>};
pack(cli, 11223, {V0_type}) ->
    D_a_t_a = <<V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11223:16/little,
       D_a_t_a/binary>>};
pack(srv, 11223, {V0_type, V0_family_info}) ->
    D_a_t_a = <<V0_type:8/little,
                (length(V0_family_info)):16/little,
                (list_to_binary([<<V1_fid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little, V1_mid:32/little,
                                   (protocol:pack(string, V1_mplatform))/binary,
                                   V1_mzone_id:16/little,
                                   (protocol:pack(string,
                                                  V1_master_name))/binary,
                                   V1_master_lev:32/little,
                                   V1_master_classes:8/little,
                                   V1_master_sex:8/little, V1_lid:32/little,
                                   (protocol:pack(string, V1_lplatform))/binary,
                                   V1_lzone_id:16/little,
                                   (protocol:pack(string,
                                                  V1_lover_name))/binary,
                                   V1_lev:32/little, V1_env_val:32/little,
                                   V1_visit_lock:32/little>>
                                 || #family_info{id =
                                                     {V1_fid,
                                                      V1_platform,
                                                      V1_zone_id},
                                                 master_id =
                                                     {V1_mid,
                                                      V1_mplatform,
                                                      V1_mzone_id},
                                                 master_name = V1_master_name,
                                                 master_lev = V1_master_lev,
                                                 master_classes =
                                                     V1_master_classes,
                                                 master_sex = V1_master_sex,
                                                 lover_id =
                                                     {V1_lid,
                                                      V1_lplatform,
                                                      V1_lzone_id},
                                                 lover_name = V1_lover_name,
                                                 house_info =
                                                     #house_info{lev = V1_lev,
                                                                 env_val =
                                                                     V1_env_val},
                                                 visit_lock = V1_visit_lock}
                                        <- V0_family_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11223:16/little,
       D_a_t_a/binary>>};
pack(cli, 11224, {}) ->
    {ok, <<2:32/little, 11224:16/little>>};
pack(srv, 11224, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11224:16/little,
       D_a_t_a/binary>>};
pack(cli, 11225, {}) ->
    {ok, <<2:32/little, 11225:16/little>>};
pack(srv, 11225,
     {#magic_beans{growth = V0_growth,
                   flower_num = V0_flower_num, wake_time = V0_wake_time,
                   event_record = V0_event_record, inviters = V0_inviters,
                   fosters = V0_fosters,
                   beans_rewards = V0_beans_rewards}}) ->
    D_a_t_a = <<V0_growth:32/little, V0_flower_num:8/little,
                V0_wake_time:32/little,
                (length(V0_event_record)):16/little,
                (list_to_binary([<<V1_time:32/little, V1_wid:32/little,
                                   (protocol:pack(string, V1_wplatform))/binary,
                                   V1_wzone_id:16/little,
                                   (protocol:pack(string, V1_role_name))/binary,
                                   V1_event:8/signed-little>>
                                 || {V1_time,
                                     {V1_wid, V1_wplatform, V1_wzone_id},
                                     V1_role_name,
                                     V1_event}
                                        <- V0_event_record]))/binary,
                (length(V0_inviters)):16/little,
                (list_to_binary([<<V1_ivtid:32/little,
                                   (protocol:pack(string,
                                                  V1_ivtplatform))/binary,
                                   V1_ivtzone_id:16/little>>
                                 || {V1_ivtid, V1_ivtplatform, V1_ivtzone_id}
                                        <- V0_inviters]))/binary,
                (length(V0_fosters)):16/little,
                (list_to_binary([<<V1_fsttid:32/little,
                                   (protocol:pack(string,
                                                  V1_fstplatform))/binary,
                                   V1_fstzone_id:16/little>>
                                 || {V1_fsttid, V1_fstplatform, V1_fstzone_id}
                                        <- V0_fosters]))/binary,
                (length(V0_beans_rewards)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_gvid:32/little,
                                   (protocol:pack(string,
                                                  V1_gvplatform))/binary,
                                   V1_gvzone_id:16/little,
                                   (protocol:pack(string,
                                                  V1_giver_name))/binary,
                                   V1_blid:32/little,
                                   (protocol:pack(string,
                                                  V1_blplatform))/binary,
                                   V1_blzone_id:16/little, V1_pos_x:16/little,
                                   V1_pos_y:16/little>>
                                 || #beans_reward{id = V1_id,
                                                  giver_id =
                                                      {V1_gvid,
                                                       V1_gvplatform,
                                                       V1_gvzone_id},
                                                  giver_name = V1_giver_name,
                                                  belong_id =
                                                      {V1_blid,
                                                       V1_blplatform,
                                                       V1_blzone_id},
                                                  pos = {V1_pos_x, V1_pos_y}}
                                        <- V0_beans_rewards]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11225:16/little,
       D_a_t_a/binary>>};
pack(cli, 11226, {V0_fid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_fid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11226:16/little,
       D_a_t_a/binary>>};
pack(srv, 11226, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11226:16/little,
       D_a_t_a/binary>>};
pack(cli, 11227, {}) ->
    {ok, <<2:32/little, 11227:16/little>>};
pack(srv, 11227, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11227:16/little,
       D_a_t_a/binary>>};
pack(cli, 11228, {V0_inviters}) ->
    D_a_t_a = <<(length(V0_inviters)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little>>
                                 || {V1_rid, V1_platform, V1_zone_id}
                                        <- V0_inviters]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11228:16/little,
       D_a_t_a/binary>>};
pack(srv, 11228, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11228:16/little,
       D_a_t_a/binary>>};
pack(cli, 11229, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11229:16/little,
       D_a_t_a/binary>>};
pack(srv, 11229, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11229:16/little,
       D_a_t_a/binary>>};
pack(cli, 11230, {}) ->
    {ok, <<2:32/little, 11230:16/little>>};
pack(srv, 11230, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11230:16/little,
       D_a_t_a/binary>>};
pack(cli, 11231, {}) ->
    {ok, <<2:32/little, 11231:16/little>>};
pack(srv, 11231, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11231:16/little,
       D_a_t_a/binary>>};
pack(cli, 11232, {}) ->
    {ok, <<2:32/little, 11232:16/little>>};
pack(srv, 11232, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11232:16/little,
       D_a_t_a/binary>>};
pack(cli, 11233, {{V0_rid, V0_platform, V0_zone_id}}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11233:16/little,
       D_a_t_a/binary>>};
pack(srv, 11233, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11233:16/little,
       D_a_t_a/binary>>};
pack(cli, 11234, {V0_train_id}) ->
    D_a_t_a = <<V0_train_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11234:16/little,
       D_a_t_a/binary>>};
pack(srv, 11234, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11234:16/little,
       D_a_t_a/binary>>};
pack(cli, 11235, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11235:16/little,
       D_a_t_a/binary>>};
pack(srv, 11235, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11235:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 11200, _B0) -> {ok, {}};
unpack(cli, 11200, _B0) ->
    {V1_fid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_master_name, _B4} = protocol:string(_B3),
    {V1_map_id, _B5} = protocol:uint32(_B4),
    {V1_lev, _B6} = protocol:uint32(_B5),
    {V1_env_val, _B7} = protocol:uint32(_B6),
    {V1_furnishings, _B22} = protocol:array(_B7,
                                            fun (_B8) ->
                                                    {V2_id, _B9} =
                                                        protocol:uint32(_B8),
                                                    {V2_base_id, _B10} =
                                                        protocol:uint32(_B9),
                                                    {V2_rid, _B11} =
                                                        protocol:uint32(_B10),
                                                    {V2_platform, _B12} =
                                                        protocol:string(_B11),
                                                    {V2_zone_id, _B13} =
                                                        protocol:uint16(_B12),
                                                    {V2_num, _B14} =
                                                        protocol:uint32(_B13),
                                                    {V2_status, _B15} =
                                                        protocol:uint32(_B14),
                                                    {V2_x, _B16} =
                                                        protocol:uint16(_B15),
                                                    {V2_y, _B17} =
                                                        protocol:uint16(_B16),
                                                    {V2_gx, _B18} =
                                                        protocol:uint16(_B17),
                                                    {V2_gy, _B19} =
                                                        protocol:uint16(_B18),
                                                    {V2_dir, _B20} =
                                                        protocol:uint8(_B19),
                                                    {{V2_id,
                                                      V2_base_id,
                                                      V2_rid,
                                                      V2_platform,
                                                      V2_zone_id,
                                                      V2_num,
                                                      V2_status,
                                                      V2_x,
                                                      V2_y,
                                                      V2_gx,
                                                      V2_gy,
                                                      V2_dir},
                                                     _B20}
                                            end),
    {V1_floor_lev, _B23} = protocol:uint32(_B22),
    {V1_bdg_info, _B29} = protocol:array(_B23,
                                         fun (_B24) ->
                                                 {V2_type, _B25} =
                                                     protocol:uint8(_B24),
                                                 {V2_lev, _B26} =
                                                     protocol:uint32(_B25),
                                                 {V2_exp, _B27} =
                                                     protocol:uint32(_B26),
                                                 {{V2_type, V2_lev, V2_exp},
                                                  _B27}
                                         end),
    {V1_cleanness, _B30} = protocol:uint32(_B29),
    {V1_housekeeper_action_times, _B31} =
        protocol:uint32(_B30),
    {V1_is_upgrade_bdg, _B36} = protocol:array(_B31,
                                               fun (_B32) ->
                                                       {V2_bad_type, _B33} =
                                                           protocol:uint8(_B32),
                                                       {V2_done, _B34} =
                                                           protocol:uint8(_B33),
                                                       {{V2_bad_type, V2_done},
                                                        _B34}
                                               end),
    {V1_visit_lock, _B37} = protocol:uint8(_B36),
    {V1_growth, _B38} = protocol:uint32(_B37),
    {V1_flower_num, _B39} = protocol:uint8(_B38),
    {V1_wake_time, _B40} = protocol:uint32(_B39),
    {V1_event_record, _B49} = protocol:array(_B40,
                                             fun (_B41) ->
                                                     {V2_time, _B42} =
                                                         protocol:uint32(_B41),
                                                     {V2_wid, _B43} =
                                                         protocol:uint32(_B42),
                                                     {V2_wplatform, _B44} =
                                                         protocol:string(_B43),
                                                     {V2_wzone_id, _B45} =
                                                         protocol:uint16(_B44),
                                                     {V2_role_name, _B46} =
                                                         protocol:string(_B45),
                                                     {V2_event, _B47} =
                                                         protocol:int8(_B46),
                                                     {{V2_time,
                                                       V2_wid,
                                                       V2_wplatform,
                                                       V2_wzone_id,
                                                       V2_role_name,
                                                       V2_event},
                                                      _B47}
                                             end),
    {V1_inviters, _B55} = protocol:array(_B49,
                                         fun (_B50) ->
                                                 {V2_ivtid, _B51} =
                                                     protocol:uint32(_B50),
                                                 {V2_ivtplatform, _B52} =
                                                     protocol:string(_B51),
                                                 {V2_ivtzone_id, _B53} =
                                                     protocol:uint16(_B52),
                                                 {{V2_ivtid,
                                                   V2_ivtplatform,
                                                   V2_ivtzone_id},
                                                  _B53}
                                         end),
    {V1_fosters, _B61} = protocol:array(_B55,
                                        fun (_B56) ->
                                                {V2_fsttid, _B57} =
                                                    protocol:uint32(_B56),
                                                {V2_fstplatform, _B58} =
                                                    protocol:string(_B57),
                                                {V2_fstzone_id, _B59} =
                                                    protocol:uint16(_B58),
                                                {{V2_fsttid,
                                                  V2_fstplatform,
                                                  V2_fstzone_id},
                                                 _B59}
                                        end),
    {V1_beans_rewards, _B74} = protocol:array(_B61,
                                              fun (_B62) ->
                                                      {V2_id, _B63} =
                                                          protocol:uint32(_B62),
                                                      {V2_gvid, _B64} =
                                                          protocol:uint32(_B63),
                                                      {V2_gvplatform, _B65} =
                                                          protocol:string(_B64),
                                                      {V2_gvzone_id, _B66} =
                                                          protocol:uint16(_B65),
                                                      {V2_giver_name, _B67} =
                                                          protocol:string(_B66),
                                                      {V2_blid, _B68} =
                                                          protocol:uint32(_B67),
                                                      {V2_blplatform, _B69} =
                                                          protocol:string(_B68),
                                                      {V2_blzone_id, _B70} =
                                                          protocol:uint16(_B69),
                                                      {V2_pos_x, _B71} =
                                                          protocol:uint16(_B70),
                                                      {V2_pos_y, _B72} =
                                                          protocol:uint16(_B71),
                                                      {{V2_id,
                                                        V2_gvid,
                                                        V2_gvplatform,
                                                        V2_gvzone_id,
                                                        V2_giver_name,
                                                        V2_blid,
                                                        V2_blplatform,
                                                        V2_blzone_id,
                                                        V2_pos_x,
                                                        V2_pos_y},
                                                       _B72}
                                              end),
    {V1_battle_id, _B75} = protocol:uint32(_B74),
    {ok,
     {V1_fid,
      V1_platform,
      V1_zone_id,
      V1_master_name,
      V1_map_id,
      V1_lev,
      V1_env_val,
      V1_furnishings,
      V1_floor_lev,
      V1_bdg_info,
      V1_cleanness,
      V1_housekeeper_action_times,
      V1_is_upgrade_bdg,
      V1_visit_lock,
      V1_growth,
      V1_flower_num,
      V1_wake_time,
      V1_event_record,
      V1_inviters,
      V1_fosters,
      V1_beans_rewards,
      V1_battle_id}};
unpack(srv, 11201, _B0) -> {ok, {}};
unpack(cli, 11201, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11202, _B0) ->
    {V1_fid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_fid, V1_platform, V1_zone_id}};
unpack(cli, 11202, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11203, _B0) -> {ok, {}};
unpack(cli, 11203, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11204, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_x, _B2} = protocol:uint16(_B1),
    {V1_y, _B3} = protocol:uint16(_B2),
    {V1_gx, _B4} = protocol:uint16(_B3),
    {V1_gy, _B5} = protocol:uint16(_B4),
    {V1_dir, _B6} = protocol:uint8(_B5),
    {ok, {V1_id, V1_x, V1_y, V1_gx, V1_gy, V1_dir}};
unpack(cli, 11204, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_id}};
unpack(srv, 11205, _B0) -> {ok, {}};
unpack(cli, 11205, _B0) ->
    {V1_update_info, _B16} = protocol:array(_B0,
                                            fun (_B1) ->
                                                    {V2_flag, _B2} =
                                                        protocol:uint8(_B1),
                                                    {V2_id, _B3} =
                                                        protocol:uint32(_B2),
                                                    {V2_base_id, _B4} =
                                                        protocol:uint32(_B3),
                                                    {V2_rid, _B5} =
                                                        protocol:uint32(_B4),
                                                    {V2_platform, _B6} =
                                                        protocol:string(_B5),
                                                    {V2_zone_id, _B7} =
                                                        protocol:uint16(_B6),
                                                    {V2_num, _B8} =
                                                        protocol:uint32(_B7),
                                                    {V2_status, _B9} =
                                                        protocol:uint32(_B8),
                                                    {V2_x, _B10} =
                                                        protocol:uint16(_B9),
                                                    {V2_y, _B11} =
                                                        protocol:uint16(_B10),
                                                    {V2_gx, _B12} =
                                                        protocol:uint16(_B11),
                                                    {V2_gy, _B13} =
                                                        protocol:uint16(_B12),
                                                    {V2_dir, _B14} =
                                                        protocol:uint8(_B13),
                                                    {{V2_flag,
                                                      V2_id,
                                                      V2_base_id,
                                                      V2_rid,
                                                      V2_platform,
                                                      V2_zone_id,
                                                      V2_num,
                                                      V2_status,
                                                      V2_x,
                                                      V2_y,
                                                      V2_gx,
                                                      V2_gy,
                                                      V2_dir},
                                                     _B14}
                                            end),
    {ok, {V1_update_info}};
unpack(srv, 11206, _B0) -> {ok, {}};
unpack(cli, 11206, _B0) ->
    {V1_fid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_fid, V1_platform, V1_zone_id}};
unpack(srv, 11207, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 11207, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11208, _B0) -> {ok, {}};
unpack(cli, 11208, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11209, _B0) ->
    {V1_bad_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_bad_type}};
unpack(cli, 11209, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11210, _B0) ->
    {V1_bad_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_bad_type}};
unpack(cli, 11210, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11211, _B0) -> {ok, {}};
unpack(cli, 11211, _B0) ->
    {V1_goods_list, _B9} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_id, _B2} =
                                                      protocol:uint32(_B1),
                                                  {V2_store_type, _B3} =
                                                      protocol:uint8(_B2),
                                                  {V2_base_id, _B4} =
                                                      protocol:uint32(_B3),
                                                  {V2_type, _B5} =
                                                      protocol:uint32(_B4),
                                                  {V2_val, _B6} =
                                                      protocol:uint32(_B5),
                                                  {V2_count, _B7} =
                                                      protocol:uint32(_B6),
                                                  {{V2_id,
                                                    V2_store_type,
                                                    V2_base_id,
                                                    V2_type,
                                                    V2_val,
                                                    V2_count},
                                                   _B7}
                                          end),
    {ok, {V1_goods_list}};
unpack(srv, 11212, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_num, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_num}};
unpack(cli, 11212, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11213, _B0) -> {ok, {}};
unpack(cli, 11213, _B0) ->
    {V1_bdg_info, _B6} = protocol:array(_B0,
                                        fun (_B1) ->
                                                {V2_type, _B2} =
                                                    protocol:uint8(_B1),
                                                {V2_lev, _B3} =
                                                    protocol:uint32(_B2),
                                                {V2_exp, _B4} =
                                                    protocol:uint32(_B3),
                                                {{V2_type, V2_lev, V2_exp}, _B4}
                                        end),
    {ok, {V1_bdg_info}};
unpack(srv, 11214, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_train_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_train_id}};
unpack(cli, 11214, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11215, _B0) -> {ok, {}};
unpack(cli, 11215, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11216, _B0) -> {ok, {}};
unpack(cli, 11216, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11217, _B0) -> {ok, {}};
unpack(cli, 11217, _B0) ->
    {V1_effect_list, _B5} = protocol:array(_B0,
                                           fun (_B1) ->
                                                   {V2_effect_type, _B2} =
                                                       protocol:uint32(_B1),
                                                   {V2_val, _B3} =
                                                       protocol:uint32(_B2),
                                                   {{V2_effect_type, V2_val},
                                                    _B3}
                                           end),
    {ok, {V1_effect_list}};
unpack(srv, 11218, _B0) -> {ok, {}};
unpack(cli, 11218, _B0) ->
    {V1_fid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_map_id, _B4} = protocol:uint32(_B3),
    {V1_lev, _B5} = protocol:uint32(_B4),
    {V1_env_val, _B6} = protocol:uint32(_B5),
    {V1_floor_lev, _B7} = protocol:uint32(_B6),
    {V1_cleanness, _B8} = protocol:uint32(_B7),
    {V1_housekeeper_action_times, _B9} =
        protocol:uint32(_B8),
    {V1_is_upgrade_bdg, _B14} = protocol:array(_B9,
                                               fun (_B10) ->
                                                       {V2_bad_type, _B11} =
                                                           protocol:uint8(_B10),
                                                       {V2_done, _B12} =
                                                           protocol:uint8(_B11),
                                                       {{V2_bad_type, V2_done},
                                                        _B12}
                                               end),
    {V1_visit_lock, _B15} = protocol:uint8(_B14),
    {V1_battle_id, _B16} = protocol:uint32(_B15),
    {ok,
     {V1_fid,
      V1_platform,
      V1_zone_id,
      V1_map_id,
      V1_lev,
      V1_env_val,
      V1_floor_lev,
      V1_cleanness,
      V1_housekeeper_action_times,
      V1_is_upgrade_bdg,
      V1_visit_lock,
      V1_battle_id}};
unpack(srv, 11219, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 11219, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11220, _B0) -> {ok, {}};
unpack(cli, 11220, _B0) ->
    {V1_train_info, _B6} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_id, _B2} =
                                                      protocol:uint8(_B1),
                                                  {V2_pet_id, _B3} =
                                                      protocol:uint32(_B2),
                                                  {V2_end_time, _B4} =
                                                      protocol:uint32(_B3),
                                                  {{V2_id,
                                                    V2_pet_id,
                                                    V2_end_time},
                                                   _B4}
                                          end),
    {ok, {V1_train_info}};
unpack(srv, 11221, _B0) -> {ok, {}};
unpack(cli, 11221, _B0) ->
    {V1_use_info, _B5} = protocol:array(_B0,
                                        fun (_B1) ->
                                                {V2_effect_type, _B2} =
                                                    protocol:uint32(_B1),
                                                {V2_val, _B3} =
                                                    protocol:uint32(_B2),
                                                {{V2_effect_type, V2_val}, _B3}
                                        end),
    {ok, {V1_use_info}};
unpack(srv, 11222, _B0) ->
    {V1_lock_lev, _B1} = protocol:uint8(_B0),
    {ok, {V1_lock_lev}};
unpack(cli, 11222, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11223, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_type}};
unpack(cli, 11223, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_family_info, _B21} = protocol:array(_B1,
                                            fun (_B2) ->
                                                    {V2_fid, _B3} =
                                                        protocol:uint32(_B2),
                                                    {V2_platform, _B4} =
                                                        protocol:string(_B3),
                                                    {V2_zone_id, _B5} =
                                                        protocol:uint16(_B4),
                                                    {V2_mid, _B6} =
                                                        protocol:uint32(_B5),
                                                    {V2_mplatform, _B7} =
                                                        protocol:string(_B6),
                                                    {V2_mzone_id, _B8} =
                                                        protocol:uint16(_B7),
                                                    {V2_master_name, _B9} =
                                                        protocol:string(_B8),
                                                    {V2_master_lev, _B10} =
                                                        protocol:uint32(_B9),
                                                    {V2_master_classes, _B11} =
                                                        protocol:uint8(_B10),
                                                    {V2_master_sex, _B12} =
                                                        protocol:uint8(_B11),
                                                    {V2_lid, _B13} =
                                                        protocol:uint32(_B12),
                                                    {V2_lplatform, _B14} =
                                                        protocol:string(_B13),
                                                    {V2_lzone_id, _B15} =
                                                        protocol:uint16(_B14),
                                                    {V2_lover_name, _B16} =
                                                        protocol:string(_B15),
                                                    {V2_lev, _B17} =
                                                        protocol:uint32(_B16),
                                                    {V2_env_val, _B18} =
                                                        protocol:uint32(_B17),
                                                    {V2_visit_lock, _B19} =
                                                        protocol:uint32(_B18),
                                                    {{V2_fid,
                                                      V2_platform,
                                                      V2_zone_id,
                                                      V2_mid,
                                                      V2_mplatform,
                                                      V2_mzone_id,
                                                      V2_master_name,
                                                      V2_master_lev,
                                                      V2_master_classes,
                                                      V2_master_sex,
                                                      V2_lid,
                                                      V2_lplatform,
                                                      V2_lzone_id,
                                                      V2_lover_name,
                                                      V2_lev,
                                                      V2_env_val,
                                                      V2_visit_lock},
                                                     _B19}
                                            end),
    {ok, {V1_type, V1_family_info}};
unpack(srv, 11224, _B0) -> {ok, {}};
unpack(cli, 11224, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11225, _B0) -> {ok, {}};
unpack(cli, 11225, _B0) ->
    {V1_growth, _B1} = protocol:uint32(_B0),
    {V1_flower_num, _B2} = protocol:uint8(_B1),
    {V1_wake_time, _B3} = protocol:uint32(_B2),
    {V1_event_record, _B12} = protocol:array(_B3,
                                             fun (_B4) ->
                                                     {V2_time, _B5} =
                                                         protocol:uint32(_B4),
                                                     {V2_wid, _B6} =
                                                         protocol:uint32(_B5),
                                                     {V2_wplatform, _B7} =
                                                         protocol:string(_B6),
                                                     {V2_wzone_id, _B8} =
                                                         protocol:uint16(_B7),
                                                     {V2_role_name, _B9} =
                                                         protocol:string(_B8),
                                                     {V2_event, _B10} =
                                                         protocol:int8(_B9),
                                                     {{V2_time,
                                                       V2_wid,
                                                       V2_wplatform,
                                                       V2_wzone_id,
                                                       V2_role_name,
                                                       V2_event},
                                                      _B10}
                                             end),
    {V1_inviters, _B18} = protocol:array(_B12,
                                         fun (_B13) ->
                                                 {V2_ivtid, _B14} =
                                                     protocol:uint32(_B13),
                                                 {V2_ivtplatform, _B15} =
                                                     protocol:string(_B14),
                                                 {V2_ivtzone_id, _B16} =
                                                     protocol:uint16(_B15),
                                                 {{V2_ivtid,
                                                   V2_ivtplatform,
                                                   V2_ivtzone_id},
                                                  _B16}
                                         end),
    {V1_fosters, _B24} = protocol:array(_B18,
                                        fun (_B19) ->
                                                {V2_fsttid, _B20} =
                                                    protocol:uint32(_B19),
                                                {V2_fstplatform, _B21} =
                                                    protocol:string(_B20),
                                                {V2_fstzone_id, _B22} =
                                                    protocol:uint16(_B21),
                                                {{V2_fsttid,
                                                  V2_fstplatform,
                                                  V2_fstzone_id},
                                                 _B22}
                                        end),
    {V1_beans_rewards, _B37} = protocol:array(_B24,
                                              fun (_B25) ->
                                                      {V2_id, _B26} =
                                                          protocol:uint32(_B25),
                                                      {V2_gvid, _B27} =
                                                          protocol:uint32(_B26),
                                                      {V2_gvplatform, _B28} =
                                                          protocol:string(_B27),
                                                      {V2_gvzone_id, _B29} =
                                                          protocol:uint16(_B28),
                                                      {V2_giver_name, _B30} =
                                                          protocol:string(_B29),
                                                      {V2_blid, _B31} =
                                                          protocol:uint32(_B30),
                                                      {V2_blplatform, _B32} =
                                                          protocol:string(_B31),
                                                      {V2_blzone_id, _B33} =
                                                          protocol:uint16(_B32),
                                                      {V2_pos_x, _B34} =
                                                          protocol:uint16(_B33),
                                                      {V2_pos_y, _B35} =
                                                          protocol:uint16(_B34),
                                                      {{V2_id,
                                                        V2_gvid,
                                                        V2_gvplatform,
                                                        V2_gvzone_id,
                                                        V2_giver_name,
                                                        V2_blid,
                                                        V2_blplatform,
                                                        V2_blzone_id,
                                                        V2_pos_x,
                                                        V2_pos_y},
                                                       _B35}
                                              end),
    {ok,
     {V1_growth,
      V1_flower_num,
      V1_wake_time,
      V1_event_record,
      V1_inviters,
      V1_fosters,
      V1_beans_rewards}};
unpack(srv, 11226, _B0) ->
    {V1_fid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_fid, V1_platform, V1_zone_id}};
unpack(cli, 11226, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11227, _B0) -> {ok, {}};
unpack(cli, 11227, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11228, _B0) ->
    {V1_inviters, _B6} = protocol:array(_B0,
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
    {ok, {V1_inviters}};
unpack(cli, 11228, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11229, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 11229, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11230, _B0) -> {ok, {}};
unpack(cli, 11230, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11231, _B0) -> {ok, {}};
unpack(cli, 11231, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11232, _B0) -> {ok, {}};
unpack(cli, 11232, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11233, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 11233, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11234, _B0) ->
    {V1_train_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_train_id}};
unpack(cli, 11234, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11235, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 11235, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

