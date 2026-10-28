-file("src/proto/proto_103.erl", 1).

-module(proto_103).

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

-file("src/proto/proto_103.erl", 14).

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

-file("src/proto/proto_103.erl", 15).

-file("inc/item.hrl", 1).

-record(item_base,
        {id = 0 :: non_neg_integer(),
         name = "" :: list(),
         type = 0 :: non_neg_integer(),
         quality = 0 :: 0..4,
         overlap = 1 :: pos_integer(),
         look_id = 0 :: non_neg_integer(),
         use_type = 0 :: 0..4,
         expire_type = 0 :: non_neg_integer(),
         expire_time = 0 ::
             non_neg_integer() |
             {{pos_integer(), pos_integer(), pos_integer()},
              {non_neg_integer(),
               non_neg_integer(),
               non_neg_integer()}},
         attr = [] :: [tuple()],
         lev = 0,
         classes = 0,
         sex = 2,
         buy_source = [],
         condition = [] :: [tuple()],
         effect = [] :: [tuple()],
         alchemy = 0 :: non_neg_integer()}).

-record(item,
        {ver = 0 :: non_neg_integer(),
         id = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         bind = 1 :: 0 | 1,
         look_id = 0,
         type = 0 :: non_neg_integer(),
         use_type = 0 :: 0..4,
         quality = 0 :: 0..4,
         craft = 0 :: 0..5,
         enchant = -1 :: integer(),
         growth_lev = 0,
         growth_val = 0,
         step = 0 :: pos_integer(),
         quantity = 1 :: 0..250,
         pos = 0 :: non_neg_integer(),
         expire_type = 0 :: 0..4,
         expire_time = 0 :: non_neg_integer(),
         attr = [] :: [tuple()],
         reset_attr = [],
         lev = 1 :: pos_integer(),
         classes = 0 :: 0..6,
         sex = 2 :: 0..2,
         extra = [] :: [tuple()],
         data = [] :: [any()]}).

-record(item_extra_info, {source, price}).

-file("src/proto/proto_103.erl", 16).

-file("inc/attr.hrl", 1).

-record(attr_base,
        {type = 0 :: non_neg_integer(),
         name = 0 :: pos_integer(),
         flag = 0 :: non_neg_integer(),
         calc_type = 0 :: non_neg_integer(),
         val = 0 :: non_neg_integer()}).

-record(attr,
        {ver = 3,
         fc = 0 :: non_neg_integer(),
         speed = 260 :: pos_integer(),
         hp_max = 0 :: non_neg_integer(),
         mp_max = 0 :: non_neg_integer(),
         atk_speed = 0 :: non_neg_integer(),
         phy_dmg = 0 :: non_neg_integer(),
         magic_dmg = 0 :: non_neg_integer(),
         phy_def = 0 :: non_neg_integer(),
         magic_def = 0 :: non_neg_integer(),
         crit = 0 :: non_neg_integer(),
         tenacity = 0 :: non_neg_integer(),
         accuracy = 0 :: non_neg_integer(),
         evasion = 0 :: non_neg_integer(),
         holy_dmg = 0 :: non_neg_integer(),
         crit_dmg = 0 :: non_neg_integer(),
         crit_dmg_def = 0 :: non_neg_integer(),
         dmg_ratio = 0 :: non_neg_integer(),
         def_ratio = 0 :: non_neg_integer(),
         enhance_control = 0 :: non_neg_integer(),
         anti_control = 0 :: non_neg_integer(),
         escape = 0 :: non_neg_integer(),
         anti_escape = 0 :: non_neg_integer(),
         capture = 0 :: non_neg_integer(),
         phy_def_ratio = 0 :: non_neg_integer(),
         magic_def_ratio = 0 :: non_neg_integer(),
         phy_accuracy = 0 :: non_neg_integer(),
         magic_accuracy = 0 :: non_neg_integer(),
         phy_evasion = 0 :: non_neg_integer(),
         magic_evasion = 0 :: non_neg_integer(),
         phy_crit = 0 :: non_neg_integer(),
         magic_crit = 0 :: non_neg_integer(),
         phy_tenacity = 0 :: non_neg_integer(),
         magic_tenacity = 0 :: non_neg_integer(),
         heal_val = 0 :: non_neg_integer(),
         heal_ratio = 0 :: non_neg_integer(),
         eff_heal_ratio = 0 :: non_neg_integer(),
         phy_dmg_ratio = 0 :: non_neg_integer(),
         magic_dmg_ratio = 0 :: non_neg_integer(),
         strength = 0,
         constitution = 0,
         magic = 0,
         agility = 0,
         endurance = 0,
         exp_ratio = 0}).

-record(attr_calc,
        {attr :: undefined | #attr{},
         attr_no_ratio :: undefined | #attr{},
         ratio :: undefined | #attr{},
         attr_no_fc :: undefined | #attr{},
         ratio_no_fc :: undefined | #attr{}}).

-record(m_attr_point,
        {ver = 2,
         ext_point = [],
         first_free = 0,
         valid_plan = 1,
         plan_data = [],
         change_plan_times = 0}).

-record(attr_point_plan,
        {index = 1 :: pos_integer(),
         plan_name = [],
         strength = 0 :: pos_integer(),
         constitution = 0 :: non_neg_integer(),
         magic = 0 :: non_neg_integer(),
         agility = 0 :: non_neg_integer(),
         endurance = 0 :: non_neg_integer(),
         pre_str = 0,
         pre_con = 0,
         pre_magic = 0,
         pre_agi = 0,
         pre_end = 0}).

-file("src/proto/proto_103.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 10300, {}) ->
    {ok, <<2:32/little, 10300:16/little>>};
pack(srv, 10300, {V0_volume, V0_item_list}) ->
    D_a_t_a = <<V0_volume:32/little,
                (length(V0_item_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_base_id:32/little, V1_bind:8/little,
                                   V1_craft:8/little,
                                   V1_enchant:8/signed-little,
                                   V1_quantity:32/little, V1_pos:16/little,
                                   V1_step:8/little, V1_expire_type:8/little,
                                   V1_expire_time:32/little,
                                   (length(V1_attr)):16/little,
                                   (list_to_binary([<<V2_type:16/little,
                                                      V2_name:32/little,
                                                      V2_flag:32/little,
                                                      V2_val:32/signed-little>>
                                                    || #attr_base{type =
                                                                      V2_type,
                                                                  name =
                                                                      V2_name,
                                                                  flag =
                                                                      V2_flag,
                                                                  val = V2_val}
                                                           <- V1_attr]))/binary,
                                   (length(V1_extra)):16/little,
                                   (list_to_binary([<<V2_name:32/little,
                                                      V2_value:32/little,
                                                      (protocol:pack(string,
                                                                     V2_str))/binary>>
                                                    || {V2_name,
                                                        V2_value,
                                                        V2_str}
                                                           <- V1_extra]))/binary>>
                                 || #item{id = V1_id, base_id = V1_base_id,
                                          bind = V1_bind, craft = V1_craft,
                                          enchant = V1_enchant,
                                          quantity = V1_quantity, pos = V1_pos,
                                          step = V1_step,
                                          expire_type = V1_expire_type,
                                          expire_time = V1_expire_time,
                                          attr = V1_attr, extra = V1_extra}
                                        <- V0_item_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10300:16/little,
       D_a_t_a/binary>>};
pack(cli, 10301, {}) ->
    {ok, <<2:32/little, 10301:16/little>>};
pack(srv, 10301, {V0_volume, V0_item_list}) ->
    D_a_t_a = <<V0_volume:32/little,
                (length(V0_item_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_base_id:32/little, V1_bind:8/little,
                                   V1_craft:8/little,
                                   V1_enchant:8/signed-little,
                                   V1_quantity:32/little, V1_pos:16/little,
                                   V1_step:8/little, V1_expire_type:8/little,
                                   V1_expire_time:32/little,
                                   (length(V1_attr)):16/little,
                                   (list_to_binary([<<V2_type:16/little,
                                                      V2_name:32/little,
                                                      V2_flag:32/little,
                                                      V2_val:32/signed-little>>
                                                    || #attr_base{type =
                                                                      V2_type,
                                                                  name =
                                                                      V2_name,
                                                                  flag =
                                                                      V2_flag,
                                                                  val = V2_val}
                                                           <- V1_attr]))/binary,
                                   (length(V1_extra)):16/little,
                                   (list_to_binary([<<V2_name:32/little,
                                                      V2_value:32/little,
                                                      (protocol:pack(string,
                                                                     V2_str))/binary>>
                                                    || {V2_name,
                                                        V2_value,
                                                        V2_str}
                                                           <- V1_extra]))/binary>>
                                 || #item{id = V1_id, base_id = V1_base_id,
                                          bind = V1_bind, craft = V1_craft,
                                          enchant = V1_enchant,
                                          quantity = V1_quantity, pos = V1_pos,
                                          step = V1_step,
                                          expire_type = V1_expire_type,
                                          expire_time = V1_expire_time,
                                          attr = V1_attr, extra = V1_extra}
                                        <- V0_item_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10301:16/little,
       D_a_t_a/binary>>};
pack(cli, 10302, {}) ->
    {ok, <<2:32/little, 10302:16/little>>};
pack(srv, 10302, {V0_item_list}) ->
    D_a_t_a = <<(length(V0_item_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_base_id:32/little, V1_bind:8/little,
                                   V1_craft:8/little,
                                   V1_enchant:8/signed-little,
                                   V1_quantity:32/little, V1_pos:16/little,
                                   V1_step:8/little, V1_growth_lev:8/little,
                                   V1_growth_val:16/little,
                                   V1_expire_type:8/little,
                                   V1_expire_time:32/little,
                                   (length(V1_attr)):16/little,
                                   (list_to_binary([<<V2_type:16/little,
                                                      V2_name:32/little,
                                                      V2_flag:32/little,
                                                      V2_val:32/signed-little>>
                                                    || #attr_base{type =
                                                                      V2_type,
                                                                  name =
                                                                      V2_name,
                                                                  flag =
                                                                      V2_flag,
                                                                  val = V2_val}
                                                           <- V1_attr]))/binary,
                                   (length(V1_extra)):16/little,
                                   (list_to_binary([<<V2_name:32/little,
                                                      V2_value:32/little,
                                                      (protocol:pack(string,
                                                                     V2_str))/binary>>
                                                    || {V2_name,
                                                        V2_value,
                                                        V2_str}
                                                           <- V1_extra]))/binary>>
                                 || #item{id = V1_id, base_id = V1_base_id,
                                          bind = V1_bind, craft = V1_craft,
                                          enchant = V1_enchant,
                                          quantity = V1_quantity, pos = V1_pos,
                                          step = V1_step,
                                          growth_lev = V1_growth_lev,
                                          growth_val = V1_growth_val,
                                          expire_type = V1_expire_type,
                                          expire_time = V1_expire_time,
                                          attr = V1_attr, extra = V1_extra}
                                        <- V0_item_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10302:16/little,
       D_a_t_a/binary>>};
pack(cli, 10303, {V0_id, V0_platform, V0_zone}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10303:16/little,
       D_a_t_a/binary>>};
pack(srv, 10303, {V0_item_list, V0_looks}) ->
    D_a_t_a = <<(length(V0_item_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_base_id:32/little, V1_bind:8/little,
                                   V1_craft:8/little,
                                   V1_enchant:8/signed-little,
                                   V1_quantity:32/little, V1_pos:16/little,
                                   V1_step:8/little, V1_expire_type:8/little,
                                   V1_expire_time:32/little,
                                   (length(V1_attr)):16/little,
                                   (list_to_binary([<<V2_type:16/little,
                                                      V2_name:32/little,
                                                      V2_flag:32/little,
                                                      V2_val:32/signed-little>>
                                                    || #attr_base{type =
                                                                      V2_type,
                                                                  name =
                                                                      V2_name,
                                                                  flag =
                                                                      V2_flag,
                                                                  val = V2_val}
                                                           <- V1_attr]))/binary,
                                   (length(V1_extra)):16/little,
                                   (list_to_binary([<<V2_name:32/little,
                                                      V2_value:32/little,
                                                      (protocol:pack(string,
                                                                     V2_str))/binary>>
                                                    || {V2_name,
                                                        V2_value,
                                                        V2_str}
                                                           <- V1_extra]))/binary>>
                                 || #item{id = V1_id, base_id = V1_base_id,
                                          bind = V1_bind, craft = V1_craft,
                                          enchant = V1_enchant,
                                          quantity = V1_quantity, pos = V1_pos,
                                          step = V1_step,
                                          expire_type = V1_expire_type,
                                          expire_time = V1_expire_time,
                                          attr = V1_attr, extra = V1_extra}
                                        <- V0_item_list]))/binary,
                (length(V0_looks)):16/little,
                (list_to_binary([<<V1_looks_type:32/little,
                                   V1_looks_mode:32/little,
                                   V1_looks_val:32/little,
                                   (protocol:pack(string,
                                                  V1_looks_str))/binary>>
                                 || {V1_looks_type,
                                     V1_looks_mode,
                                     V1_looks_val,
                                     V1_looks_str}
                                        <- V0_looks]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10303:16/little,
       D_a_t_a/binary>>};
pack(cli, 10310, {}) ->
    {ok, <<2:32/little, 10310:16/little>>};
pack(srv, 10310, {V0_item_list}) ->
    D_a_t_a = <<(length(V0_item_list)):16/little,
                (list_to_binary([<<V1_storage:8/little, V1_id:32/little,
                                   V1_base_id:32/little, V1_bind:8/little,
                                   V1_craft:8/little,
                                   V1_enchant:8/signed-little,
                                   V1_quantity:32/little, V1_pos:16/little,
                                   V1_step:8/little, V1_growth_lev:8/little,
                                   V1_growth_val:16/little,
                                   V1_expire_type:8/little,
                                   V1_expire_time:32/little,
                                   (length(V1_attr)):16/little,
                                   (list_to_binary([<<V2_type:16/little,
                                                      V2_name:32/little,
                                                      V2_flag:32/little,
                                                      V2_val:32/signed-little>>
                                                    || #attr_base{type =
                                                                      V2_type,
                                                                  name =
                                                                      V2_name,
                                                                  flag =
                                                                      V2_flag,
                                                                  val = V2_val}
                                                           <- V1_attr]))/binary,
                                   (length(V1_extra)):16/little,
                                   (list_to_binary([<<V2_name:32/little,
                                                      V2_value:32/little,
                                                      (protocol:pack(string,
                                                                     V2_str))/binary>>
                                                    || {V2_name,
                                                        V2_value,
                                                        V2_str}
                                                           <- V1_extra]))/binary>>
                                 || {V1_storage,
                                     #item{id = V1_id, base_id = V1_base_id,
                                           bind = V1_bind, craft = V1_craft,
                                           enchant = V1_enchant,
                                           quantity = V1_quantity, pos = V1_pos,
                                           step = V1_step,
                                           growth_lev = V1_growth_lev,
                                           growth_val = V1_growth_val,
                                           expire_type = V1_expire_type,
                                           expire_time = V1_expire_time,
                                           attr = V1_attr, extra = V1_extra}}
                                        <- V0_item_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10310:16/little,
       D_a_t_a/binary>>};
pack(cli, 10311, {}) ->
    {ok, <<2:32/little, 10311:16/little>>};
pack(srv, 10311, {V0_item_list}) ->
    D_a_t_a = <<(length(V0_item_list)):16/little,
                (list_to_binary([<<V1_storage:8/little, V1_id:32/little,
                                   V1_pos:16/little>>
                                 || {V1_storage,
                                     #item{id = V1_id, pos = V1_pos}}
                                        <- V0_item_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10311:16/little,
       D_a_t_a/binary>>};
pack(cli, 10312, {}) ->
    {ok, <<2:32/little, 10312:16/little>>};
pack(srv, 10312, {V0_item_list}) ->
    D_a_t_a = <<(length(V0_item_list)):16/little,
                (list_to_binary([<<V1_storage:8/little, V1_id:32/little,
                                   V1_base_id:32/little, V1_bind:8/little,
                                   V1_craft:8/little,
                                   V1_enchant:8/signed-little,
                                   V1_quantity:32/little, V1_pos:16/little,
                                   V1_step:8/little, V1_growth_lev:8/little,
                                   V1_growth_val:16/little,
                                   V1_expire_type:8/little,
                                   V1_expire_time:32/little,
                                   (length(V1_attr)):16/little,
                                   (list_to_binary([<<V2_type:16/little,
                                                      V2_name:32/little,
                                                      V2_flag:32/little,
                                                      V2_val:32/signed-little>>
                                                    || #attr_base{type =
                                                                      V2_type,
                                                                  name =
                                                                      V2_name,
                                                                  flag =
                                                                      V2_flag,
                                                                  val = V2_val}
                                                           <- V1_attr]))/binary,
                                   (length(V1_extra)):16/little,
                                   (list_to_binary([<<V2_name:32/little,
                                                      V2_value:32/little,
                                                      (protocol:pack(string,
                                                                     V2_str))/binary>>
                                                    || {V2_name,
                                                        V2_value,
                                                        V2_str}
                                                           <- V1_extra]))/binary>>
                                 || {V1_storage,
                                     #item{id = V1_id, base_id = V1_base_id,
                                           bind = V1_bind, craft = V1_craft,
                                           enchant = V1_enchant,
                                           quantity = V1_quantity, pos = V1_pos,
                                           step = V1_step,
                                           growth_lev = V1_growth_lev,
                                           growth_val = V1_growth_val,
                                           expire_type = V1_expire_type,
                                           expire_time = V1_expire_time,
                                           attr = V1_attr, extra = V1_extra}}
                                        <- V0_item_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10312:16/little,
       D_a_t_a/binary>>};
pack(cli, 10315, {V0_id, V0_quantity, V0_args}) ->
    D_a_t_a = <<V0_id:32/little, V0_quantity:16/little,
                (length(V0_args)):16/little,
                (list_to_binary([<<V1_name:8/little, V1_value:32/little,
                                   (protocol:pack(string, V1_str))/binary>>
                                 || {V1_name, V1_value, V1_str}
                                        <- V0_args]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10315:16/little,
       D_a_t_a/binary>>};
pack(srv, 10315, {V0_flag, V0_base_id, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little, V0_base_id:32/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10315:16/little,
       D_a_t_a/binary>>};
pack(cli, 10316, {V0_id, V0_quantity}) ->
    D_a_t_a = <<V0_id:32/little, V0_quantity:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10316:16/little,
       D_a_t_a/binary>>};
pack(srv, 10316, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10316:16/little,
       D_a_t_a/binary>>};
pack(cli, 10317, {V0_id, V0_quantity}) ->
    D_a_t_a = <<V0_id:32/little, V0_quantity:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10317:16/little,
       D_a_t_a/binary>>};
pack(srv, 10317, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10317:16/little,
       D_a_t_a/binary>>};
pack(cli, 10318, {V0_id, V0_storage, V0_pos}) ->
    D_a_t_a = <<V0_id:32/little, V0_storage:8/little,
                V0_pos:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10318:16/little,
       D_a_t_a/binary>>};
pack(srv, 10318, {V0_flag, V0_id, V0_pos, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little, V0_id:32/little,
                V0_pos:16/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10318:16/little,
       D_a_t_a/binary>>};
pack(cli, 10319, {V0_id, V0_storage, V0_pos}) ->
    D_a_t_a = <<V0_id:32/little, V0_storage:8/little,
                V0_pos:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10319:16/little,
       D_a_t_a/binary>>};
pack(srv, 10319, {V0_flag, V0_id, V0_pos, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little, V0_id:32/little,
                V0_pos:16/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10319:16/little,
       D_a_t_a/binary>>};
pack(cli, 10320, {V0_id, V0_storage}) ->
    D_a_t_a = <<V0_id:32/little, V0_storage:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10320:16/little,
       D_a_t_a/binary>>};
pack(srv, 10320,
     {V0_id, V0_storage, V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_id:32/little, V0_storage:8/little,
                V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10320:16/little,
       D_a_t_a/binary>>};
pack(cli, 10321, {}) ->
    {ok, <<2:32/little, 10321:16/little>>};
pack(srv, 10321, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10321:16/little,
       D_a_t_a/binary>>};
pack(cli, 10322, {V0_package_type}) ->
    D_a_t_a = <<V0_package_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10322:16/little,
       D_a_t_a/binary>>};
pack(srv, 10322, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10322:16/little,
       D_a_t_a/binary>>};
pack(cli, 10323, {}) ->
    {ok, <<2:32/little, 10323:16/little>>};
pack(srv, 10323,
     {V0_flag, V0_new_volume, V0_times, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little, V0_new_volume:8/little,
                V0_times:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10323:16/little,
       D_a_t_a/binary>>};
pack(cli, 10324, {V0_num}) ->
    D_a_t_a = <<V0_num:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10324:16/little,
       D_a_t_a/binary>>};
pack(srv, 10324, {V0_flag, V0_new_volume, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little, V0_new_volume:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10324:16/little,
       D_a_t_a/binary>>};
pack(cli, 10329,
     {V0_id, V0_from_storage, V0_storage, V0_pos}) ->
    D_a_t_a = <<V0_id:32/little, V0_from_storage:8/little,
                V0_storage:8/little, V0_pos:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10329:16/little,
       D_a_t_a/binary>>};
pack(srv, 10329, {V0_flag, V0_id, V0_pos, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little, V0_id:32/little,
                V0_pos:16/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10329:16/little,
       D_a_t_a/binary>>};
pack(cli, 10330, {}) ->
    {ok, <<2:32/little, 10330:16/little>>};
pack(srv, 10330, {V0_volume, V0_item_list}) ->
    D_a_t_a = <<V0_volume:32/little,
                (length(V0_item_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_base_id:32/little, V1_bind:8/little,
                                   V1_craft:8/little,
                                   V1_enchant:8/signed-little,
                                   V1_quantity:32/little, V1_pos:16/little,
                                   V1_step:8/little, V1_expire_type:8/little,
                                   V1_expire_time:32/little,
                                   (length(V1_attr)):16/little,
                                   (list_to_binary([<<V2_type:16/little,
                                                      V2_name:32/little,
                                                      V2_flag:32/little,
                                                      V2_val:32/signed-little>>
                                                    || #attr_base{type =
                                                                      V2_type,
                                                                  name =
                                                                      V2_name,
                                                                  flag =
                                                                      V2_flag,
                                                                  val = V2_val}
                                                           <- V1_attr]))/binary,
                                   (length(V1_extra)):16/little,
                                   (list_to_binary([<<V2_name:32/little,
                                                      V2_value:32/little,
                                                      (protocol:pack(string,
                                                                     V2_str))/binary>>
                                                    || {V2_name,
                                                        V2_value,
                                                        V2_str}
                                                           <- V1_extra]))/binary>>
                                 || #item{id = V1_id, base_id = V1_base_id,
                                          bind = V1_bind, craft = V1_craft,
                                          enchant = V1_enchant,
                                          quantity = V1_quantity, pos = V1_pos,
                                          step = V1_step,
                                          expire_type = V1_expire_type,
                                          expire_time = V1_expire_time,
                                          attr = V1_attr, extra = V1_extra}
                                        <- V0_item_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10330:16/little,
       D_a_t_a/binary>>};
pack(cli, 10331, {}) ->
    {ok, <<2:32/little, 10331:16/little>>};
pack(srv, 10331, {V0_num}) ->
    D_a_t_a = <<V0_num:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10331:16/little,
       D_a_t_a/binary>>};
pack(cli, 10332, {}) ->
    {ok, <<2:32/little, 10332:16/little>>};
pack(srv, 10332, {V0_new_volume}) ->
    D_a_t_a = <<V0_new_volume:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10332:16/little,
       D_a_t_a/binary>>};
pack(cli, 10333,
     {V0_role_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_role_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10333:16/little,
       D_a_t_a/binary>>};
pack(srv, 10333, {V0_craft, V0_classes}) ->
    D_a_t_a = <<V0_craft:8/little, V0_classes:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10333:16/little,
       D_a_t_a/binary>>};
pack(cli, 10334, {V0_base_id}) ->
    D_a_t_a = <<V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10334:16/little,
       D_a_t_a/binary>>};
pack(srv, 10334, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10334:16/little,
       D_a_t_a/binary>>};
pack(cli, 10335, {}) ->
    {ok, <<2:32/little, 10335:16/little>>};
pack(srv, 10335, {V0_flag, V0_open, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_open))/binary,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10335:16/little,
       D_a_t_a/binary>>};
pack(cli, 10336, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10336:16/little,
       D_a_t_a/binary>>};
pack(srv, 10336, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10336:16/little,
       D_a_t_a/binary>>};
pack(cli, 10337, {V0_id, V0_flag}) ->
    D_a_t_a = <<V0_id:32/little, V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10337:16/little,
       D_a_t_a/binary>>};
pack(srv, 10337, {V0_flag, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10337:16/little,
       D_a_t_a/binary>>};
pack(cli, 10338, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10338:16/little,
       D_a_t_a/binary>>};
pack(srv, 10338, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10338:16/little,
       D_a_t_a/binary>>};
pack(cli, 10339, {}) ->
    {ok, <<2:32/little, 10339:16/little>>};
pack(srv, 10339, {V0_id, V0_item_list}) ->
    D_a_t_a = <<V0_id:32/little,
                (length(V0_item_list)):16/little,
                (list_to_binary([<<V1_item_id:32/little,
                                   V1_bind:8/little, V1_number:32/little>>
                                 || {V1_item_id, V1_bind, V1_number}
                                        <- V0_item_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10339:16/little,
       D_a_t_a/binary>>};
pack(cli, 10340, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10340:16/little,
       D_a_t_a/binary>>};
pack(srv, 10340, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10340:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 10300, _B0) -> {ok, {}};
unpack(cli, 10300, _B0) ->
    {V1_volume, _B1} = protocol:uint32(_B0),
    {V1_item_list, _B27} = protocol:array(_B1,
                                          fun (_B2) ->
                                                  {V2_id, _B3} =
                                                      protocol:uint32(_B2),
                                                  {V2_base_id, _B4} =
                                                      protocol:uint32(_B3),
                                                  {V2_bind, _B5} =
                                                      protocol:uint8(_B4),
                                                  {V2_craft, _B6} =
                                                      protocol:uint8(_B5),
                                                  {V2_enchant, _B7} =
                                                      protocol:int8(_B6),
                                                  {V2_quantity, _B8} =
                                                      protocol:uint32(_B7),
                                                  {V2_pos, _B9} =
                                                      protocol:uint16(_B8),
                                                  {V2_step, _B10} =
                                                      protocol:uint8(_B9),
                                                  {V2_expire_type, _B11} =
                                                      protocol:uint8(_B10),
                                                  {V2_expire_time, _B12} =
                                                      protocol:uint32(_B11),
                                                  {V2_attr, _B19} =
                                                      protocol:array(_B12,
                                                                     fun
                                                                         (_B13) ->
                                                                             {V3_type,
                                                                              _B14} =
                                                                                 protocol:uint16(_B13),
                                                                             {V3_name,
                                                                              _B15} =
                                                                                 protocol:uint32(_B14),
                                                                             {V3_flag,
                                                                              _B16} =
                                                                                 protocol:uint32(_B15),
                                                                             {V3_val,
                                                                              _B17} =
                                                                                 protocol:int32(_B16),
                                                                             {{V3_type,
                                                                               V3_name,
                                                                               V3_flag,
                                                                               V3_val},
                                                                              _B17}
                                                                     end),
                                                  {V2_extra, _B25} =
                                                      protocol:array(_B19,
                                                                     fun
                                                                         (_B20) ->
                                                                             {V3_name,
                                                                              _B21} =
                                                                                 protocol:uint32(_B20),
                                                                             {V3_value,
                                                                              _B22} =
                                                                                 protocol:uint32(_B21),
                                                                             {V3_str,
                                                                              _B23} =
                                                                                 protocol:string(_B22),
                                                                             {{V3_name,
                                                                               V3_value,
                                                                               V3_str},
                                                                              _B23}
                                                                     end),
                                                  {{V2_id,
                                                    V2_base_id,
                                                    V2_bind,
                                                    V2_craft,
                                                    V2_enchant,
                                                    V2_quantity,
                                                    V2_pos,
                                                    V2_step,
                                                    V2_expire_type,
                                                    V2_expire_time,
                                                    V2_attr,
                                                    V2_extra},
                                                   _B25}
                                          end),
    {ok, {V1_volume, V1_item_list}};
unpack(srv, 10301, _B0) -> {ok, {}};
unpack(cli, 10301, _B0) ->
    {V1_volume, _B1} = protocol:uint32(_B0),
    {V1_item_list, _B27} = protocol:array(_B1,
                                          fun (_B2) ->
                                                  {V2_id, _B3} =
                                                      protocol:uint32(_B2),
                                                  {V2_base_id, _B4} =
                                                      protocol:uint32(_B3),
                                                  {V2_bind, _B5} =
                                                      protocol:uint8(_B4),
                                                  {V2_craft, _B6} =
                                                      protocol:uint8(_B5),
                                                  {V2_enchant, _B7} =
                                                      protocol:int8(_B6),
                                                  {V2_quantity, _B8} =
                                                      protocol:uint32(_B7),
                                                  {V2_pos, _B9} =
                                                      protocol:uint16(_B8),
                                                  {V2_step, _B10} =
                                                      protocol:uint8(_B9),
                                                  {V2_expire_type, _B11} =
                                                      protocol:uint8(_B10),
                                                  {V2_expire_time, _B12} =
                                                      protocol:uint32(_B11),
                                                  {V2_attr, _B19} =
                                                      protocol:array(_B12,
                                                                     fun
                                                                         (_B13) ->
                                                                             {V3_type,
                                                                              _B14} =
                                                                                 protocol:uint16(_B13),
                                                                             {V3_name,
                                                                              _B15} =
                                                                                 protocol:uint32(_B14),
                                                                             {V3_flag,
                                                                              _B16} =
                                                                                 protocol:uint32(_B15),
                                                                             {V3_val,
                                                                              _B17} =
                                                                                 protocol:int32(_B16),
                                                                             {{V3_type,
                                                                               V3_name,
                                                                               V3_flag,
                                                                               V3_val},
                                                                              _B17}
                                                                     end),
                                                  {V2_extra, _B25} =
                                                      protocol:array(_B19,
                                                                     fun
                                                                         (_B20) ->
                                                                             {V3_name,
                                                                              _B21} =
                                                                                 protocol:uint32(_B20),
                                                                             {V3_value,
                                                                              _B22} =
                                                                                 protocol:uint32(_B21),
                                                                             {V3_str,
                                                                              _B23} =
                                                                                 protocol:string(_B22),
                                                                             {{V3_name,
                                                                               V3_value,
                                                                               V3_str},
                                                                              _B23}
                                                                     end),
                                                  {{V2_id,
                                                    V2_base_id,
                                                    V2_bind,
                                                    V2_craft,
                                                    V2_enchant,
                                                    V2_quantity,
                                                    V2_pos,
                                                    V2_step,
                                                    V2_expire_type,
                                                    V2_expire_time,
                                                    V2_attr,
                                                    V2_extra},
                                                   _B25}
                                          end),
    {ok, {V1_volume, V1_item_list}};
unpack(srv, 10302, _B0) -> {ok, {}};
unpack(cli, 10302, _B0) ->
    {V1_item_list, _B28} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_id, _B2} =
                                                      protocol:uint32(_B1),
                                                  {V2_base_id, _B3} =
                                                      protocol:uint32(_B2),
                                                  {V2_bind, _B4} =
                                                      protocol:uint8(_B3),
                                                  {V2_craft, _B5} =
                                                      protocol:uint8(_B4),
                                                  {V2_enchant, _B6} =
                                                      protocol:int8(_B5),
                                                  {V2_quantity, _B7} =
                                                      protocol:uint32(_B6),
                                                  {V2_pos, _B8} =
                                                      protocol:uint16(_B7),
                                                  {V2_step, _B9} =
                                                      protocol:uint8(_B8),
                                                  {V2_growth_lev, _B10} =
                                                      protocol:uint8(_B9),
                                                  {V2_growth_val, _B11} =
                                                      protocol:uint16(_B10),
                                                  {V2_expire_type, _B12} =
                                                      protocol:uint8(_B11),
                                                  {V2_expire_time, _B13} =
                                                      protocol:uint32(_B12),
                                                  {V2_attr, _B20} =
                                                      protocol:array(_B13,
                                                                     fun
                                                                         (_B14) ->
                                                                             {V3_type,
                                                                              _B15} =
                                                                                 protocol:uint16(_B14),
                                                                             {V3_name,
                                                                              _B16} =
                                                                                 protocol:uint32(_B15),
                                                                             {V3_flag,
                                                                              _B17} =
                                                                                 protocol:uint32(_B16),
                                                                             {V3_val,
                                                                              _B18} =
                                                                                 protocol:int32(_B17),
                                                                             {{V3_type,
                                                                               V3_name,
                                                                               V3_flag,
                                                                               V3_val},
                                                                              _B18}
                                                                     end),
                                                  {V2_extra, _B26} =
                                                      protocol:array(_B20,
                                                                     fun
                                                                         (_B21) ->
                                                                             {V3_name,
                                                                              _B22} =
                                                                                 protocol:uint32(_B21),
                                                                             {V3_value,
                                                                              _B23} =
                                                                                 protocol:uint32(_B22),
                                                                             {V3_str,
                                                                              _B24} =
                                                                                 protocol:string(_B23),
                                                                             {{V3_name,
                                                                               V3_value,
                                                                               V3_str},
                                                                              _B24}
                                                                     end),
                                                  {{V2_id,
                                                    V2_base_id,
                                                    V2_bind,
                                                    V2_craft,
                                                    V2_enchant,
                                                    V2_quantity,
                                                    V2_pos,
                                                    V2_step,
                                                    V2_growth_lev,
                                                    V2_growth_val,
                                                    V2_expire_type,
                                                    V2_expire_time,
                                                    V2_attr,
                                                    V2_extra},
                                                   _B26}
                                          end),
    {ok, {V1_item_list}};
unpack(srv, 10303, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone, _B3} = protocol:uint32(_B2),
    {ok, {V1_id, V1_platform, V1_zone}};
unpack(cli, 10303, _B0) ->
    {V1_item_list, _B26} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_id, _B2} =
                                                      protocol:uint32(_B1),
                                                  {V2_base_id, _B3} =
                                                      protocol:uint32(_B2),
                                                  {V2_bind, _B4} =
                                                      protocol:uint8(_B3),
                                                  {V2_craft, _B5} =
                                                      protocol:uint8(_B4),
                                                  {V2_enchant, _B6} =
                                                      protocol:int8(_B5),
                                                  {V2_quantity, _B7} =
                                                      protocol:uint32(_B6),
                                                  {V2_pos, _B8} =
                                                      protocol:uint16(_B7),
                                                  {V2_step, _B9} =
                                                      protocol:uint8(_B8),
                                                  {V2_expire_type, _B10} =
                                                      protocol:uint8(_B9),
                                                  {V2_expire_time, _B11} =
                                                      protocol:uint32(_B10),
                                                  {V2_attr, _B18} =
                                                      protocol:array(_B11,
                                                                     fun
                                                                         (_B12) ->
                                                                             {V3_type,
                                                                              _B13} =
                                                                                 protocol:uint16(_B12),
                                                                             {V3_name,
                                                                              _B14} =
                                                                                 protocol:uint32(_B13),
                                                                             {V3_flag,
                                                                              _B15} =
                                                                                 protocol:uint32(_B14),
                                                                             {V3_val,
                                                                              _B16} =
                                                                                 protocol:int32(_B15),
                                                                             {{V3_type,
                                                                               V3_name,
                                                                               V3_flag,
                                                                               V3_val},
                                                                              _B16}
                                                                     end),
                                                  {V2_extra, _B24} =
                                                      protocol:array(_B18,
                                                                     fun
                                                                         (_B19) ->
                                                                             {V3_name,
                                                                              _B20} =
                                                                                 protocol:uint32(_B19),
                                                                             {V3_value,
                                                                              _B21} =
                                                                                 protocol:uint32(_B20),
                                                                             {V3_str,
                                                                              _B22} =
                                                                                 protocol:string(_B21),
                                                                             {{V3_name,
                                                                               V3_value,
                                                                               V3_str},
                                                                              _B22}
                                                                     end),
                                                  {{V2_id,
                                                    V2_base_id,
                                                    V2_bind,
                                                    V2_craft,
                                                    V2_enchant,
                                                    V2_quantity,
                                                    V2_pos,
                                                    V2_step,
                                                    V2_expire_type,
                                                    V2_expire_time,
                                                    V2_attr,
                                                    V2_extra},
                                                   _B24}
                                          end),
    {V1_looks, _B33} = protocol:array(_B26,
                                      fun (_B27) ->
                                              {V2_looks_type, _B28} =
                                                  protocol:uint32(_B27),
                                              {V2_looks_mode, _B29} =
                                                  protocol:uint32(_B28),
                                              {V2_looks_val, _B30} =
                                                  protocol:uint32(_B29),
                                              {V2_looks_str, _B31} =
                                                  protocol:string(_B30),
                                              {{V2_looks_type,
                                                V2_looks_mode,
                                                V2_looks_val,
                                                V2_looks_str},
                                               _B31}
                                      end),
    {ok, {V1_item_list, V1_looks}};
unpack(srv, 10310, _B0) -> {ok, {}};
unpack(cli, 10310, _B0) ->
    {V1_item_list, _B29} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_storage, _B2} =
                                                      protocol:uint8(_B1),
                                                  {V2_id, _B3} =
                                                      protocol:uint32(_B2),
                                                  {V2_base_id, _B4} =
                                                      protocol:uint32(_B3),
                                                  {V2_bind, _B5} =
                                                      protocol:uint8(_B4),
                                                  {V2_craft, _B6} =
                                                      protocol:uint8(_B5),
                                                  {V2_enchant, _B7} =
                                                      protocol:int8(_B6),
                                                  {V2_quantity, _B8} =
                                                      protocol:uint32(_B7),
                                                  {V2_pos, _B9} =
                                                      protocol:uint16(_B8),
                                                  {V2_step, _B10} =
                                                      protocol:uint8(_B9),
                                                  {V2_growth_lev, _B11} =
                                                      protocol:uint8(_B10),
                                                  {V2_growth_val, _B12} =
                                                      protocol:uint16(_B11),
                                                  {V2_expire_type, _B13} =
                                                      protocol:uint8(_B12),
                                                  {V2_expire_time, _B14} =
                                                      protocol:uint32(_B13),
                                                  {V2_attr, _B21} =
                                                      protocol:array(_B14,
                                                                     fun
                                                                         (_B15) ->
                                                                             {V3_type,
                                                                              _B16} =
                                                                                 protocol:uint16(_B15),
                                                                             {V3_name,
                                                                              _B17} =
                                                                                 protocol:uint32(_B16),
                                                                             {V3_flag,
                                                                              _B18} =
                                                                                 protocol:uint32(_B17),
                                                                             {V3_val,
                                                                              _B19} =
                                                                                 protocol:int32(_B18),
                                                                             {{V3_type,
                                                                               V3_name,
                                                                               V3_flag,
                                                                               V3_val},
                                                                              _B19}
                                                                     end),
                                                  {V2_extra, _B27} =
                                                      protocol:array(_B21,
                                                                     fun
                                                                         (_B22) ->
                                                                             {V3_name,
                                                                              _B23} =
                                                                                 protocol:uint32(_B22),
                                                                             {V3_value,
                                                                              _B24} =
                                                                                 protocol:uint32(_B23),
                                                                             {V3_str,
                                                                              _B25} =
                                                                                 protocol:string(_B24),
                                                                             {{V3_name,
                                                                               V3_value,
                                                                               V3_str},
                                                                              _B25}
                                                                     end),
                                                  {{V2_storage,
                                                    V2_id,
                                                    V2_base_id,
                                                    V2_bind,
                                                    V2_craft,
                                                    V2_enchant,
                                                    V2_quantity,
                                                    V2_pos,
                                                    V2_step,
                                                    V2_growth_lev,
                                                    V2_growth_val,
                                                    V2_expire_type,
                                                    V2_expire_time,
                                                    V2_attr,
                                                    V2_extra},
                                                   _B27}
                                          end),
    {ok, {V1_item_list}};
unpack(srv, 10311, _B0) -> {ok, {}};
unpack(cli, 10311, _B0) ->
    {V1_item_list, _B6} = protocol:array(_B0,
                                         fun (_B1) ->
                                                 {V2_storage, _B2} =
                                                     protocol:uint8(_B1),
                                                 {V2_id, _B3} =
                                                     protocol:uint32(_B2),
                                                 {V2_pos, _B4} =
                                                     protocol:uint16(_B3),
                                                 {{V2_storage, V2_id, V2_pos},
                                                  _B4}
                                         end),
    {ok, {V1_item_list}};
unpack(srv, 10312, _B0) -> {ok, {}};
unpack(cli, 10312, _B0) ->
    {V1_item_list, _B29} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_storage, _B2} =
                                                      protocol:uint8(_B1),
                                                  {V2_id, _B3} =
                                                      protocol:uint32(_B2),
                                                  {V2_base_id, _B4} =
                                                      protocol:uint32(_B3),
                                                  {V2_bind, _B5} =
                                                      protocol:uint8(_B4),
                                                  {V2_craft, _B6} =
                                                      protocol:uint8(_B5),
                                                  {V2_enchant, _B7} =
                                                      protocol:int8(_B6),
                                                  {V2_quantity, _B8} =
                                                      protocol:uint32(_B7),
                                                  {V2_pos, _B9} =
                                                      protocol:uint16(_B8),
                                                  {V2_step, _B10} =
                                                      protocol:uint8(_B9),
                                                  {V2_growth_lev, _B11} =
                                                      protocol:uint8(_B10),
                                                  {V2_growth_val, _B12} =
                                                      protocol:uint16(_B11),
                                                  {V2_expire_type, _B13} =
                                                      protocol:uint8(_B12),
                                                  {V2_expire_time, _B14} =
                                                      protocol:uint32(_B13),
                                                  {V2_attr, _B21} =
                                                      protocol:array(_B14,
                                                                     fun
                                                                         (_B15) ->
                                                                             {V3_type,
                                                                              _B16} =
                                                                                 protocol:uint16(_B15),
                                                                             {V3_name,
                                                                              _B17} =
                                                                                 protocol:uint32(_B16),
                                                                             {V3_flag,
                                                                              _B18} =
                                                                                 protocol:uint32(_B17),
                                                                             {V3_val,
                                                                              _B19} =
                                                                                 protocol:int32(_B18),
                                                                             {{V3_type,
                                                                               V3_name,
                                                                               V3_flag,
                                                                               V3_val},
                                                                              _B19}
                                                                     end),
                                                  {V2_extra, _B27} =
                                                      protocol:array(_B21,
                                                                     fun
                                                                         (_B22) ->
                                                                             {V3_name,
                                                                              _B23} =
                                                                                 protocol:uint32(_B22),
                                                                             {V3_value,
                                                                              _B24} =
                                                                                 protocol:uint32(_B23),
                                                                             {V3_str,
                                                                              _B25} =
                                                                                 protocol:string(_B24),
                                                                             {{V3_name,
                                                                               V3_value,
                                                                               V3_str},
                                                                              _B25}
                                                                     end),
                                                  {{V2_storage,
                                                    V2_id,
                                                    V2_base_id,
                                                    V2_bind,
                                                    V2_craft,
                                                    V2_enchant,
                                                    V2_quantity,
                                                    V2_pos,
                                                    V2_step,
                                                    V2_growth_lev,
                                                    V2_growth_val,
                                                    V2_expire_type,
                                                    V2_expire_time,
                                                    V2_attr,
                                                    V2_extra},
                                                   _B27}
                                          end),
    {ok, {V1_item_list}};
unpack(srv, 10315, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_quantity, _B2} = protocol:uint16(_B1),
    {V1_args, _B8} = protocol:array(_B2,
                                    fun (_B3) ->
                                            {V2_name, _B4} =
                                                protocol:uint8(_B3),
                                            {V2_value, _B5} =
                                                protocol:uint32(_B4),
                                            {V2_str, _B6} =
                                                protocol:string(_B5),
                                            {{V2_name, V2_value, V2_str}, _B6}
                                    end),
    {ok, {V1_id, V1_quantity, V1_args}};
unpack(cli, 10315, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_base_id, _B2} = protocol:uint32(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_flag, V1_base_id, V1_msg}};
unpack(srv, 10316, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_quantity, _B2} = protocol:uint16(_B1),
    {ok, {V1_id, V1_quantity}};
unpack(cli, 10316, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10317, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_quantity, _B2} = protocol:uint16(_B1),
    {ok, {V1_id, V1_quantity}};
unpack(cli, 10317, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10318, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_storage, _B2} = protocol:uint8(_B1),
    {V1_pos, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_storage, V1_pos}};
unpack(cli, 10318, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_pos, _B3} = protocol:uint16(_B2),
    {V1_msg, _B4} = protocol:string(_B3),
    {ok, {V1_flag, V1_id, V1_pos, V1_msg}};
unpack(srv, 10319, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_storage, _B2} = protocol:uint8(_B1),
    {V1_pos, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_storage, V1_pos}};
unpack(cli, 10319, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_pos, _B3} = protocol:uint16(_B2),
    {V1_msg, _B4} = protocol:string(_B3),
    {ok, {V1_flag, V1_id, V1_pos, V1_msg}};
unpack(srv, 10320, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_storage, _B2} = protocol:uint8(_B1),
    {ok, {V1_id, V1_storage}};
unpack(cli, 10320, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_storage, _B2} = protocol:uint8(_B1),
    {V1_flag, _B3} = protocol:uint8(_B2),
    {V1_msg, _B4} = protocol:string(_B3),
    {ok, {V1_id, V1_storage, V1_flag, V1_msg}};
unpack(srv, 10321, _B0) -> {ok, {}};
unpack(cli, 10321, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10322, _B0) ->
    {V1_package_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_package_type}};
unpack(cli, 10322, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10323, _B0) -> {ok, {}};
unpack(cli, 10323, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_new_volume, _B2} = protocol:uint8(_B1),
    {V1_times, _B3} = protocol:uint8(_B2),
    {V1_msg, _B4} = protocol:string(_B3),
    {ok, {V1_flag, V1_new_volume, V1_times, V1_msg}};
unpack(srv, 10324, _B0) ->
    {V1_num, _B1} = protocol:uint8(_B0),
    {ok, {V1_num}};
unpack(cli, 10324, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_new_volume, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_flag, V1_new_volume, V1_msg}};
unpack(srv, 10329, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_from_storage, _B2} = protocol:uint8(_B1),
    {V1_storage, _B3} = protocol:uint8(_B2),
    {V1_pos, _B4} = protocol:uint16(_B3),
    {ok, {V1_id, V1_from_storage, V1_storage, V1_pos}};
unpack(cli, 10329, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_pos, _B3} = protocol:uint16(_B2),
    {V1_msg, _B4} = protocol:string(_B3),
    {ok, {V1_flag, V1_id, V1_pos, V1_msg}};
unpack(srv, 10330, _B0) -> {ok, {}};
unpack(cli, 10330, _B0) ->
    {V1_volume, _B1} = protocol:uint32(_B0),
    {V1_item_list, _B27} = protocol:array(_B1,
                                          fun (_B2) ->
                                                  {V2_id, _B3} =
                                                      protocol:uint32(_B2),
                                                  {V2_base_id, _B4} =
                                                      protocol:uint32(_B3),
                                                  {V2_bind, _B5} =
                                                      protocol:uint8(_B4),
                                                  {V2_craft, _B6} =
                                                      protocol:uint8(_B5),
                                                  {V2_enchant, _B7} =
                                                      protocol:int8(_B6),
                                                  {V2_quantity, _B8} =
                                                      protocol:uint32(_B7),
                                                  {V2_pos, _B9} =
                                                      protocol:uint16(_B8),
                                                  {V2_step, _B10} =
                                                      protocol:uint8(_B9),
                                                  {V2_expire_type, _B11} =
                                                      protocol:uint8(_B10),
                                                  {V2_expire_time, _B12} =
                                                      protocol:uint32(_B11),
                                                  {V2_attr, _B19} =
                                                      protocol:array(_B12,
                                                                     fun
                                                                         (_B13) ->
                                                                             {V3_type,
                                                                              _B14} =
                                                                                 protocol:uint16(_B13),
                                                                             {V3_name,
                                                                              _B15} =
                                                                                 protocol:uint32(_B14),
                                                                             {V3_flag,
                                                                              _B16} =
                                                                                 protocol:uint32(_B15),
                                                                             {V3_val,
                                                                              _B17} =
                                                                                 protocol:int32(_B16),
                                                                             {{V3_type,
                                                                               V3_name,
                                                                               V3_flag,
                                                                               V3_val},
                                                                              _B17}
                                                                     end),
                                                  {V2_extra, _B25} =
                                                      protocol:array(_B19,
                                                                     fun
                                                                         (_B20) ->
                                                                             {V3_name,
                                                                              _B21} =
                                                                                 protocol:uint32(_B20),
                                                                             {V3_value,
                                                                              _B22} =
                                                                                 protocol:uint32(_B21),
                                                                             {V3_str,
                                                                              _B23} =
                                                                                 protocol:string(_B22),
                                                                             {{V3_name,
                                                                               V3_value,
                                                                               V3_str},
                                                                              _B23}
                                                                     end),
                                                  {{V2_id,
                                                    V2_base_id,
                                                    V2_bind,
                                                    V2_craft,
                                                    V2_enchant,
                                                    V2_quantity,
                                                    V2_pos,
                                                    V2_step,
                                                    V2_expire_type,
                                                    V2_expire_time,
                                                    V2_attr,
                                                    V2_extra},
                                                   _B25}
                                          end),
    {ok, {V1_volume, V1_item_list}};
unpack(srv, 10331, _B0) -> {ok, {}};
unpack(cli, 10331, _B0) ->
    {V1_num, _B1} = protocol:uint8(_B0),
    {ok, {V1_num}};
unpack(srv, 10332, _B0) -> {ok, {}};
unpack(cli, 10332, _B0) ->
    {V1_new_volume, _B1} = protocol:uint8(_B0),
    {ok, {V1_new_volume}};
unpack(srv, 10333, _B0) ->
    {V1_role_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_role_id, V1_platform, V1_zone_id}};
unpack(cli, 10333, _B0) ->
    {V1_craft, _B1} = protocol:uint8(_B0),
    {V1_classes, _B2} = protocol:uint8(_B1),
    {ok, {V1_craft, V1_classes}};
unpack(srv, 10334, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_base_id}};
unpack(cli, 10334, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10335, _B0) -> {ok, {}};
unpack(cli, 10335, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_open, _B2} = protocol:string(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_flag, V1_open, V1_msg}};
unpack(srv, 10336, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10336, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10337, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_flag, _B2} = protocol:uint8(_B1),
    {ok, {V1_id, V1_flag}};
unpack(cli, 10337, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_id}};
unpack(srv, 10338, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10338, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10339, _B0) -> {ok, {}};
unpack(cli, 10339, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_item_list, _B7} = protocol:array(_B1,
                                         fun (_B2) ->
                                                 {V2_item_id, _B3} =
                                                     protocol:uint32(_B2),
                                                 {V2_bind, _B4} =
                                                     protocol:uint8(_B3),
                                                 {V2_number, _B5} =
                                                     protocol:uint32(_B4),
                                                 {{V2_item_id,
                                                   V2_bind,
                                                   V2_number},
                                                  _B5}
                                         end),
    {ok, {V1_id, V1_item_list}};
unpack(srv, 10340, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10340, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

