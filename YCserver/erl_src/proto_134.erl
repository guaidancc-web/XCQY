-file("src/proto/proto_134.erl", 1).

-module(proto_134).

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

-file("src/proto/proto_134.erl", 14).

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

-file("src/proto/proto_134.erl", 15).

-file("inc/mail.hrl", 1).

-record(mail,
        {sess ::
             undefined |
             {pos_integer(), bitstring(), non_neg_integer()},
         to ::
             undefined |
             {pos_integer(), bitstring(), non_neg_integer()},
         from ::
             undefined |
             {non_neg_integer(), bitstring(), non_neg_integer()},
         from_face = 0 :: non_neg_integer(),
         from_name = "" :: bitstring(),
         to_face = 0 :: non_neg_integer(),
         to_name = "" :: bitstring(),
         type = 0 :: 0..1,
         status = 0 :: 0..1,
         del_type = 0 :: 0..1,
         title = "" :: bitstring(),
         content = "" :: bitstring(),
         item_list = [] :: [tuple()],
         source = 0 :: pos_integer(),
         rev_ts = 0 :: pos_integer(),
         ts = 0 :: pos_integer(),
         read_ts = 0 :: non_neg_integer()}).

-file("src/proto/proto_134.erl", 16).

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

-file("src/proto/proto_134.erl", 17).

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

-file("src/proto/proto_134.erl", 18).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 13400, {}) ->
    {ok, <<2:32/little, 13400:16/little>>};
pack(srv, 13400, {V0_mail_list}) ->
    D_a_t_a = <<(length(V0_mail_list)):16/little,
                (list_to_binary([<<V1_sess_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little, V1_type:8/little,
                                   V1_del_type:8/little, V1_status:8/little,
                                   (protocol:pack(string, V1_title))/binary,
                                   (protocol:pack(string, V1_content))/binary,
                                   V1_from_id:32/little,
                                   (protocol:pack(string,
                                                  V1_from_platform))/binary,
                                   V1_from_zone_id:16/little,
                                   V1_from_face:32/little,
                                   (protocol:pack(string, V1_from_name))/binary,
                                   V1_to_face:32/little,
                                   (protocol:pack(string, V1_to_name))/binary,
                                   V1_ts:32/little, V1_rev_ts:32/little,
                                   (length(V1_item_list)):16/little,
                                   (list_to_binary([<<V2_id:32/little,
                                                      V2_base_id:32/little,
                                                      V2_bind:8/little,
                                                      V2_craft:8/little,
                                                      V2_enchant:8/signed-little,
                                                      V2_quantity:32/little,
                                                      V2_pos:16/little,
                                                      V2_step:8/little,
                                                      V2_look_id:32/little,
                                                      V2_expire_type:8/little,
                                                      V2_expire_time:32/little,
                                                      (length(V2_attr)):16/little,
                                                      (list_to_binary([<<V3_type:16/little,
                                                                         V3_name:32/little,
                                                                         V3_flag:32/little,
                                                                         V3_val:32/little>>
                                                                       || #attr_base{type
                                                                                         =
                                                                                         V3_type,
                                                                                     name
                                                                                         =
                                                                                         V3_name,
                                                                                     flag
                                                                                         =
                                                                                         V3_flag,
                                                                                     val
                                                                                         =
                                                                                         V3_val}
                                                                              <- V2_attr]))/binary,
                                                      (length(V2_extra)):16/little,
                                                      (list_to_binary([<<V3_name:32/little,
                                                                         V3_value:32/little,
                                                                         (protocol:pack(string,
                                                                                        V3_str))/binary>>
                                                                       || {V3_name,
                                                                           V3_value,
                                                                           V3_str}
                                                                              <- V2_extra]))/binary>>
                                                    || #item{id = V2_id,
                                                             base_id =
                                                                 V2_base_id,
                                                             bind = V2_bind,
                                                             craft = V2_craft,
                                                             enchant =
                                                                 V2_enchant,
                                                             quantity =
                                                                 V2_quantity,
                                                             pos = V2_pos,
                                                             step = V2_step,
                                                             look_id =
                                                                 V2_look_id,
                                                             expire_type =
                                                                 V2_expire_type,
                                                             expire_time =
                                                                 V2_expire_time,
                                                             attr = V2_attr,
                                                             extra = V2_extra}
                                                           <- V1_item_list]))/binary>>
                                 || #mail{sess =
                                              {V1_sess_id,
                                               V1_platform,
                                               V1_zone_id},
                                          type = V1_type,
                                          del_type = V1_del_type,
                                          status = V1_status, title = V1_title,
                                          content = V1_content,
                                          from =
                                              {V1_from_id,
                                               V1_from_platform,
                                               V1_from_zone_id},
                                          from_face = V1_from_face,
                                          from_name = V1_from_name,
                                          to_face = V1_to_face,
                                          to_name = V1_to_name, ts = V1_ts,
                                          rev_ts = V1_rev_ts,
                                          item_list = V1_item_list}
                                        <- V0_mail_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13400:16/little,
       D_a_t_a/binary>>};
pack(cli, 13401,
     {V0_sess_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_sess_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13401:16/little,
       D_a_t_a/binary>>};
pack(srv, 13401,
     {V0_sess_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_sess_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13401:16/little,
       D_a_t_a/binary>>};
pack(cli, 13402,
     {V0_sess_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_sess_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13402:16/little,
       D_a_t_a/binary>>};
pack(srv, 13402,
     {V0_result,
      V0_msg,
      V0_sess_id,
      V0_platform,
      V0_zone_id}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_sess_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13402:16/little,
       D_a_t_a/binary>>};
pack(cli, 13403,
     {V0_sess_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_sess_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13403:16/little,
       D_a_t_a/binary>>};
pack(srv, 13403,
     {V0_sess_id, V0_platform, V0_zone_id, V0_result}) ->
    D_a_t_a = <<V0_sess_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_result:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13403:16/little,
       D_a_t_a/binary>>};
pack(cli, 13404, {}) ->
    {ok, <<2:32/little, 13404:16/little>>};
pack(srv, 13404, {V0_mail_list}) ->
    D_a_t_a = <<(length(V0_mail_list)):16/little,
                (list_to_binary([<<V1_sess_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little, V1_type:8/little,
                                   V1_del_type:8/little, V1_status:8/little,
                                   (protocol:pack(string, V1_title))/binary,
                                   (protocol:pack(string, V1_content))/binary,
                                   V1_from_id:32/little,
                                   (protocol:pack(string,
                                                  V1_from_platform))/binary,
                                   V1_from_zone_id:16/little,
                                   V1_from_face:32/little,
                                   (protocol:pack(string, V1_from_name))/binary,
                                   V1_to_face:32/little,
                                   (protocol:pack(string, V1_to_name))/binary,
                                   V1_ts:32/little, V1_rev_ts:32/little,
                                   (length(V1_item_list)):16/little,
                                   (list_to_binary([<<V2_id:32/little,
                                                      V2_base_id:32/little,
                                                      V2_bind:8/little,
                                                      V2_craft:8/little,
                                                      V2_enchant:8/signed-little,
                                                      V2_quantity:32/little,
                                                      V2_pos:16/little,
                                                      V2_look_id:32/little,
                                                      V2_expire_type:8/little,
                                                      V2_expire_time:32/little,
                                                      (length(V2_attr)):16/little,
                                                      (list_to_binary([<<V3_type:16/little,
                                                                         V3_name:32/little,
                                                                         V3_flag:32/little,
                                                                         V3_val:32/little>>
                                                                       || #attr_base{type
                                                                                         =
                                                                                         V3_type,
                                                                                     name
                                                                                         =
                                                                                         V3_name,
                                                                                     flag
                                                                                         =
                                                                                         V3_flag,
                                                                                     val
                                                                                         =
                                                                                         V3_val}
                                                                              <- V2_attr]))/binary,
                                                      (length(V2_extra)):16/little,
                                                      (list_to_binary([<<V3_name:32/little,
                                                                         V3_value:32/little,
                                                                         (protocol:pack(string,
                                                                                        V3_str))/binary>>
                                                                       || {V3_name,
                                                                           V3_value,
                                                                           V3_str}
                                                                              <- V2_extra]))/binary>>
                                                    || #item{id = V2_id,
                                                             base_id =
                                                                 V2_base_id,
                                                             bind = V2_bind,
                                                             craft = V2_craft,
                                                             enchant =
                                                                 V2_enchant,
                                                             quantity =
                                                                 V2_quantity,
                                                             pos = V2_pos,
                                                             look_id =
                                                                 V2_look_id,
                                                             expire_type =
                                                                 V2_expire_type,
                                                             expire_time =
                                                                 V2_expire_time,
                                                             attr = V2_attr,
                                                             extra = V2_extra}
                                                           <- V1_item_list]))/binary>>
                                 || #mail{sess =
                                              {V1_sess_id,
                                               V1_platform,
                                               V1_zone_id},
                                          type = V1_type,
                                          del_type = V1_del_type,
                                          status = V1_status, title = V1_title,
                                          content = V1_content,
                                          from =
                                              {V1_from_id,
                                               V1_from_platform,
                                               V1_from_zone_id},
                                          from_face = V1_from_face,
                                          from_name = V1_from_name,
                                          to_face = V1_to_face,
                                          to_name = V1_to_name, ts = V1_ts,
                                          rev_ts = V1_rev_ts,
                                          item_list = V1_item_list}
                                        <- V0_mail_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13404:16/little,
       D_a_t_a/binary>>};
pack(cli, 13405,
     {V0_sess_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_sess_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13405:16/little,
       D_a_t_a/binary>>};
pack(srv, 13405,
     {V0_sess_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_sess_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13405:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 13400, _B0) -> {ok, {}};
unpack(cli, 13400, _B0) ->
    {V1_mail_list, _B47} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_sess_id, _B2} =
                                                      protocol:uint32(_B1),
                                                  {V2_platform, _B3} =
                                                      protocol:string(_B2),
                                                  {V2_zone_id, _B4} =
                                                      protocol:uint16(_B3),
                                                  {V2_type, _B5} =
                                                      protocol:uint8(_B4),
                                                  {V2_del_type, _B6} =
                                                      protocol:uint8(_B5),
                                                  {V2_status, _B7} =
                                                      protocol:uint8(_B6),
                                                  {V2_title, _B8} =
                                                      protocol:string(_B7),
                                                  {V2_content, _B9} =
                                                      protocol:string(_B8),
                                                  {V2_from_id, _B10} =
                                                      protocol:uint32(_B9),
                                                  {V2_from_platform, _B11} =
                                                      protocol:string(_B10),
                                                  {V2_from_zone_id, _B12} =
                                                      protocol:uint16(_B11),
                                                  {V2_from_face, _B13} =
                                                      protocol:uint32(_B12),
                                                  {V2_from_name, _B14} =
                                                      protocol:string(_B13),
                                                  {V2_to_face, _B15} =
                                                      protocol:uint32(_B14),
                                                  {V2_to_name, _B16} =
                                                      protocol:string(_B15),
                                                  {V2_ts, _B17} =
                                                      protocol:uint32(_B16),
                                                  {V2_rev_ts, _B18} =
                                                      protocol:uint32(_B17),
                                                  {V2_item_list, _B45} =
                                                      protocol:array(_B18,
                                                                     fun
                                                                         (_B19) ->
                                                                             {V3_id,
                                                                              _B20} =
                                                                                 protocol:uint32(_B19),
                                                                             {V3_base_id,
                                                                              _B21} =
                                                                                 protocol:uint32(_B20),
                                                                             {V3_bind,
                                                                              _B22} =
                                                                                 protocol:uint8(_B21),
                                                                             {V3_craft,
                                                                              _B23} =
                                                                                 protocol:uint8(_B22),
                                                                             {V3_enchant,
                                                                              _B24} =
                                                                                 protocol:int8(_B23),
                                                                             {V3_quantity,
                                                                              _B25} =
                                                                                 protocol:uint32(_B24),
                                                                             {V3_pos,
                                                                              _B26} =
                                                                                 protocol:uint16(_B25),
                                                                             {V3_step,
                                                                              _B27} =
                                                                                 protocol:uint8(_B26),
                                                                             {V3_look_id,
                                                                              _B28} =
                                                                                 protocol:uint32(_B27),
                                                                             {V3_expire_type,
                                                                              _B29} =
                                                                                 protocol:uint8(_B28),
                                                                             {V3_expire_time,
                                                                              _B30} =
                                                                                 protocol:uint32(_B29),
                                                                             {V3_attr,
                                                                              _B37} =
                                                                                 protocol:array(_B30,
                                                                                                fun
                                                                                                    (_B31) ->
                                                                                                        {V4_type,
                                                                                                         _B32} =
                                                                                                            protocol:uint16(_B31),
                                                                                                        {V4_name,
                                                                                                         _B33} =
                                                                                                            protocol:uint32(_B32),
                                                                                                        {V4_flag,
                                                                                                         _B34} =
                                                                                                            protocol:uint32(_B33),
                                                                                                        {V4_val,
                                                                                                         _B35} =
                                                                                                            protocol:uint32(_B34),
                                                                                                        {{V4_type,
                                                                                                          V4_name,
                                                                                                          V4_flag,
                                                                                                          V4_val},
                                                                                                         _B35}
                                                                                                end),
                                                                             {V3_extra,
                                                                              _B43} =
                                                                                 protocol:array(_B37,
                                                                                                fun
                                                                                                    (_B38) ->
                                                                                                        {V4_name,
                                                                                                         _B39} =
                                                                                                            protocol:uint32(_B38),
                                                                                                        {V4_value,
                                                                                                         _B40} =
                                                                                                            protocol:uint32(_B39),
                                                                                                        {V4_str,
                                                                                                         _B41} =
                                                                                                            protocol:string(_B40),
                                                                                                        {{V4_name,
                                                                                                          V4_value,
                                                                                                          V4_str},
                                                                                                         _B41}
                                                                                                end),
                                                                             {{V3_id,
                                                                               V3_base_id,
                                                                               V3_bind,
                                                                               V3_craft,
                                                                               V3_enchant,
                                                                               V3_quantity,
                                                                               V3_pos,
                                                                               V3_step,
                                                                               V3_look_id,
                                                                               V3_expire_type,
                                                                               V3_expire_time,
                                                                               V3_attr,
                                                                               V3_extra},
                                                                              _B43}
                                                                     end),
                                                  {{V2_sess_id,
                                                    V2_platform,
                                                    V2_zone_id,
                                                    V2_type,
                                                    V2_del_type,
                                                    V2_status,
                                                    V2_title,
                                                    V2_content,
                                                    V2_from_id,
                                                    V2_from_platform,
                                                    V2_from_zone_id,
                                                    V2_from_face,
                                                    V2_from_name,
                                                    V2_to_face,
                                                    V2_to_name,
                                                    V2_ts,
                                                    V2_rev_ts,
                                                    V2_item_list},
                                                   _B45}
                                          end),
    {ok, {V1_mail_list}};
unpack(srv, 13401, _B0) ->
    {V1_sess_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_sess_id, V1_platform, V1_zone_id}};
unpack(cli, 13401, _B0) ->
    {V1_sess_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_sess_id, V1_platform, V1_zone_id}};
unpack(srv, 13402, _B0) ->
    {V1_sess_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_sess_id, V1_platform, V1_zone_id}};
unpack(cli, 13402, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_sess_id, _B3} = protocol:uint32(_B2),
    {V1_platform, _B4} = protocol:string(_B3),
    {V1_zone_id, _B5} = protocol:uint16(_B4),
    {ok,
     {V1_result,
      V1_msg,
      V1_sess_id,
      V1_platform,
      V1_zone_id}};
unpack(srv, 13403, _B0) ->
    {V1_sess_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_sess_id, V1_platform, V1_zone_id}};
unpack(cli, 13403, _B0) ->
    {V1_sess_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_result, _B4} = protocol:uint8(_B3),
    {ok, {V1_sess_id, V1_platform, V1_zone_id, V1_result}};
unpack(srv, 13404, _B0) -> {ok, {}};
unpack(cli, 13404, _B0) ->
    {V1_mail_list, _B46} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_sess_id, _B2} =
                                                      protocol:uint32(_B1),
                                                  {V2_platform, _B3} =
                                                      protocol:string(_B2),
                                                  {V2_zone_id, _B4} =
                                                      protocol:uint16(_B3),
                                                  {V2_type, _B5} =
                                                      protocol:uint8(_B4),
                                                  {V2_del_type, _B6} =
                                                      protocol:uint8(_B5),
                                                  {V2_status, _B7} =
                                                      protocol:uint8(_B6),
                                                  {V2_title, _B8} =
                                                      protocol:string(_B7),
                                                  {V2_content, _B9} =
                                                      protocol:string(_B8),
                                                  {V2_from_id, _B10} =
                                                      protocol:uint32(_B9),
                                                  {V2_from_platform, _B11} =
                                                      protocol:string(_B10),
                                                  {V2_from_zone_id, _B12} =
                                                      protocol:uint16(_B11),
                                                  {V2_from_face, _B13} =
                                                      protocol:uint32(_B12),
                                                  {V2_from_name, _B14} =
                                                      protocol:string(_B13),
                                                  {V2_to_face, _B15} =
                                                      protocol:uint32(_B14),
                                                  {V2_to_name, _B16} =
                                                      protocol:string(_B15),
                                                  {V2_ts, _B17} =
                                                      protocol:uint32(_B16),
                                                  {V2_rev_ts, _B18} =
                                                      protocol:uint32(_B17),
                                                  {V2_item_list, _B44} =
                                                      protocol:array(_B18,
                                                                     fun
                                                                         (_B19) ->
                                                                             {V3_id,
                                                                              _B20} =
                                                                                 protocol:uint32(_B19),
                                                                             {V3_base_id,
                                                                              _B21} =
                                                                                 protocol:uint32(_B20),
                                                                             {V3_bind,
                                                                              _B22} =
                                                                                 protocol:uint8(_B21),
                                                                             {V3_craft,
                                                                              _B23} =
                                                                                 protocol:uint8(_B22),
                                                                             {V3_enchant,
                                                                              _B24} =
                                                                                 protocol:int8(_B23),
                                                                             {V3_quantity,
                                                                              _B25} =
                                                                                 protocol:uint32(_B24),
                                                                             {V3_pos,
                                                                              _B26} =
                                                                                 protocol:uint16(_B25),
                                                                             {V3_look_id,
                                                                              _B27} =
                                                                                 protocol:uint32(_B26),
                                                                             {V3_expire_type,
                                                                              _B28} =
                                                                                 protocol:uint8(_B27),
                                                                             {V3_expire_time,
                                                                              _B29} =
                                                                                 protocol:uint32(_B28),
                                                                             {V3_attr,
                                                                              _B36} =
                                                                                 protocol:array(_B29,
                                                                                                fun
                                                                                                    (_B30) ->
                                                                                                        {V4_type,
                                                                                                         _B31} =
                                                                                                            protocol:uint16(_B30),
                                                                                                        {V4_name,
                                                                                                         _B32} =
                                                                                                            protocol:uint32(_B31),
                                                                                                        {V4_flag,
                                                                                                         _B33} =
                                                                                                            protocol:uint32(_B32),
                                                                                                        {V4_val,
                                                                                                         _B34} =
                                                                                                            protocol:uint32(_B33),
                                                                                                        {{V4_type,
                                                                                                          V4_name,
                                                                                                          V4_flag,
                                                                                                          V4_val},
                                                                                                         _B34}
                                                                                                end),
                                                                             {V3_extra,
                                                                              _B42} =
                                                                                 protocol:array(_B36,
                                                                                                fun
                                                                                                    (_B37) ->
                                                                                                        {V4_name,
                                                                                                         _B38} =
                                                                                                            protocol:uint32(_B37),
                                                                                                        {V4_value,
                                                                                                         _B39} =
                                                                                                            protocol:uint32(_B38),
                                                                                                        {V4_str,
                                                                                                         _B40} =
                                                                                                            protocol:string(_B39),
                                                                                                        {{V4_name,
                                                                                                          V4_value,
                                                                                                          V4_str},
                                                                                                         _B40}
                                                                                                end),
                                                                             {{V3_id,
                                                                               V3_base_id,
                                                                               V3_bind,
                                                                               V3_craft,
                                                                               V3_enchant,
                                                                               V3_quantity,
                                                                               V3_pos,
                                                                               V3_look_id,
                                                                               V3_expire_type,
                                                                               V3_expire_time,
                                                                               V3_attr,
                                                                               V3_extra},
                                                                              _B42}
                                                                     end),
                                                  {{V2_sess_id,
                                                    V2_platform,
                                                    V2_zone_id,
                                                    V2_type,
                                                    V2_del_type,
                                                    V2_status,
                                                    V2_title,
                                                    V2_content,
                                                    V2_from_id,
                                                    V2_from_platform,
                                                    V2_from_zone_id,
                                                    V2_from_face,
                                                    V2_from_name,
                                                    V2_to_face,
                                                    V2_to_name,
                                                    V2_ts,
                                                    V2_rev_ts,
                                                    V2_item_list},
                                                   _B44}
                                          end),
    {ok, {V1_mail_list}};
unpack(srv, 13405, _B0) ->
    {V1_sess_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_sess_id, V1_platform, V1_zone_id}};
unpack(cli, 13405, _B0) ->
    {V1_sess_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_sess_id, V1_platform, V1_zone_id}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

