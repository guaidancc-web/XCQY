-file("src/proto/proto_196.erl", 1).

-module(proto_196).

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

-file("src/proto/proto_196.erl", 14).

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

-file("src/proto/proto_196.erl", 15).

-file("inc/talisman.hrl", 1).

-record(m_talisman,
        {ver = 5,
         next_id = 1,
         use_plan = 1,
         plan_1 = [],
         plan_2 = [],
         items = [],
         fusion_lev = 0,
         fusion_val = 0,
         skills = [],
         fc = 0,
         remold_formula = [],
         last_gain_id = 0,
         volume = 48}).

-record(talisman,
        {ver = 3,
         id = 1,
         base_id = 0,
         type = 0,
         quality = 0,
         lev = 0,
         attr = [],
         num = 1,
         fc = 0}).

-record(talisman_base,
        {base_id = 0,
         name = "",
         type = 0,
         quality = 0,
         lev = 0,
         need_lev = 0,
         need_lev_break = 0,
         set_id = 0,
         fusion_val = 0,
         base_attr = [],
         grade = 0}).

-file("src/proto/proto_196.erl", 16).

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

-file("src/proto/proto_196.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 19600, {}) ->
    {ok, <<2:32/little, 19600:16/little>>};
pack(srv, 19600,
     {V0_times,
      #m_talisman{use_plan = V0_use_plan,
                  fusion_lev = V0_fusion_lev, fusion_val = V0_fusion_val,
                  plan_1 = V0_plan_1, plan_2 = V0_plan_2, fc = V0_fc,
                  items = V0_items, volume = V0_volume}}) ->
    D_a_t_a = <<V0_times:8/little, V0_use_plan:8/little,
                V0_fusion_lev:8/little, V0_fusion_val:32/little,
                (length(V0_plan_1)):16/little,
                (list_to_binary([<<V1_type_1:32/little,
                                   V1_id_1:32/little>>
                                 || {V1_type_1, V1_id_1} <- V0_plan_1]))/binary,
                (length(V0_plan_2)):16/little,
                (list_to_binary([<<V1_type_2:32/little,
                                   V1_id_2:32/little>>
                                 || {V1_type_2, V1_id_2} <- V0_plan_2]))/binary,
                V0_fc:32/little, (length(V0_items)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_base_id:32/little, V1_fc:32/little,
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
                                                           <- V1_attr]))/binary>>
                                 || #talisman{id = V1_id, base_id = V1_base_id,
                                              fc = V1_fc, attr = V1_attr}
                                        <- V0_items]))/binary,
                V0_volume:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19600:16/little,
       D_a_t_a/binary>>};
pack(cli, 19601, {}) ->
    {ok, <<2:32/little, 19601:16/little>>};
pack(srv, 19601, {V0_items}) ->
    D_a_t_a = <<(length(V0_items)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_base_id:32/little, V1_fc:32/little,
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
                                                           <- V1_attr]))/binary>>
                                 || #talisman{id = V1_id, base_id = V1_base_id,
                                              fc = V1_fc, attr = V1_attr}
                                        <- V0_items]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19601:16/little,
       D_a_t_a/binary>>};
pack(cli, 19602, {}) ->
    {ok, <<2:32/little, 19602:16/little>>};
pack(srv, 19602, {V0_items}) ->
    D_a_t_a = <<(length(V0_items)):16/little,
                (list_to_binary([<<V1_id:32/little>>
                                 || #talisman{id = V1_id}
                                        <- V0_items]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19602:16/little,
       D_a_t_a/binary>>};
pack(cli, 19603, {}) ->
    {ok, <<2:32/little, 19603:16/little>>};
pack(srv, 19603, {V0_items}) ->
    D_a_t_a = <<(length(V0_items)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_base_id:32/little, V1_fc:32/little,
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
                                                           <- V1_attr]))/binary>>
                                 || #talisman{id = V1_id, base_id = V1_base_id,
                                              fc = V1_fc, attr = V1_attr}
                                        <- V0_items]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19603:16/little,
       D_a_t_a/binary>>};
pack(cli, 19604, {}) ->
    {ok, <<2:32/little, 19604:16/little>>};
pack(srv, 19604,
     {V0_times,
      #m_talisman{fusion_lev = V0_fusion_lev,
                  fusion_val = V0_fusion_val, fc = V0_fc}}) ->
    D_a_t_a = <<V0_times:8/little, V0_fusion_lev:8/little,
                V0_fusion_val:32/little, V0_fc:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19604:16/little,
       D_a_t_a/binary>>};
pack(cli, 19605, {V0_plan}) ->
    D_a_t_a = <<V0_plan:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19605:16/little,
       D_a_t_a/binary>>};
pack(srv, 19605, {V0_flag, V0_msg, V0_use_plan}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_use_plan:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19605:16/little,
       D_a_t_a/binary>>};
pack(cli, 19606, {V0_items1, V0_items2}) ->
    D_a_t_a = <<(length(V0_items1)):16/little,
                (list_to_binary([<<V1_id1:32/little>>
                                 || V1_id1 <- V0_items1]))/binary,
                (length(V0_items2)):16/little,
                (list_to_binary([<<V1_id2:32/little>>
                                 || V1_id2 <- V0_items2]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19606:16/little,
       D_a_t_a/binary>>};
pack(srv, 19606, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19606:16/little,
       D_a_t_a/binary>>};
pack(cli, 19607,
     {V0_id1, V0_dst_flags, V0_id2, V0_src_flags}) ->
    D_a_t_a = <<V0_id1:32/little,
                (length(V0_dst_flags)):16/little,
                (list_to_binary([<<V1_flag1:8/little>>
                                 || V1_flag1 <- V0_dst_flags]))/binary,
                V0_id2:32/little, (length(V0_src_flags)):16/little,
                (list_to_binary([<<V1_flag2:8/little>>
                                 || V1_flag2 <- V0_src_flags]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19607:16/little,
       D_a_t_a/binary>>};
pack(srv, 19607,
     {V0_flag, V0_msg, V0_attr_info1, V0_attr_info2}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                (length(V0_attr_info1)):16/little,
                (list_to_binary([<<V1_type:16/little, V1_name:32/little,
                                   V1_flag:32/little, V1_val:32/signed-little>>
                                 || #attr_base{type = V1_type, name = V1_name,
                                               flag = V1_flag, val = V1_val}
                                        <- V0_attr_info1]))/binary,
                (length(V0_attr_info2)):16/little,
                (list_to_binary([<<V1_type:16/little, V1_name:32/little,
                                   V1_flag:32/little, V1_val:32/signed-little>>
                                 || #attr_base{type = V1_type, name = V1_name,
                                               flag = V1_flag, val = V1_val}
                                        <- V0_attr_info2]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19607:16/little,
       D_a_t_a/binary>>};
pack(cli, 19608, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19608:16/little,
       D_a_t_a/binary>>};
pack(srv, 19608,
     {V0_flag, V0_msg, V0_use_plan, V0_plan_1, V0_plan_2}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_use_plan:8/little, (length(V0_plan_1)):16/little,
                (list_to_binary([<<V1_type_1:32/little,
                                   V1_id_1:32/little>>
                                 || {V1_type_1, V1_id_1} <- V0_plan_1]))/binary,
                (length(V0_plan_2)):16/little,
                (list_to_binary([<<V1_type_2:32/little,
                                   V1_id_2:32/little>>
                                 || {V1_type_2, V1_id_2}
                                        <- V0_plan_2]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19608:16/little,
       D_a_t_a/binary>>};
pack(cli, 19609, {V0_type}) ->
    D_a_t_a = <<V0_type:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19609:16/little,
       D_a_t_a/binary>>};
pack(srv, 19609,
     {V0_flag, V0_msg, V0_use_plan, V0_plan_1, V0_plan_2}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_use_plan:8/little, (length(V0_plan_1)):16/little,
                (list_to_binary([<<V1_type_1:32/little,
                                   V1_id_1:32/little>>
                                 || {V1_type_1, V1_id_1} <- V0_plan_1]))/binary,
                (length(V0_plan_2)):16/little,
                (list_to_binary([<<V1_type_2:32/little,
                                   V1_id_2:32/little>>
                                 || {V1_type_2, V1_id_2}
                                        <- V0_plan_2]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19609:16/little,
       D_a_t_a/binary>>};
pack(cli, 19610, {}) ->
    {ok, <<2:32/little, 19610:16/little>>};
pack(srv, 19610, {V0_formula}) ->
    D_a_t_a = <<(length(V0_formula)):16/little,
                (list_to_binary([<<V1_formula_id:32/little,
                                   V1_use_times:32/little>>
                                 || {V1_formula_id, V1_use_times}
                                        <- V0_formula]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19610:16/little,
       D_a_t_a/binary>>};
pack(cli, 19611, {V0_formula_id, V0_stuff_list}) ->
    D_a_t_a = <<V0_formula_id:32/little,
                (length(V0_stuff_list)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_index:8/little>>
                                 || {V1_id, V1_index}
                                        <- V0_stuff_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19611:16/little,
       D_a_t_a/binary>>};
pack(srv, 19611, {V0_flag, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19611:16/little,
       D_a_t_a/binary>>};
pack(cli, 19612, {}) ->
    {ok, <<2:32/little, 19612:16/little>>};
pack(srv, 19612, {V0_flag, V0_msg, V0_volume}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_volume:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19612:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 19600, _B0) -> {ok, {}};
unpack(cli, 19600, _B0) ->
    {V1_times, _B1} = protocol:uint8(_B0),
    {V1_use_plan, _B2} = protocol:uint8(_B1),
    {V1_fusion_lev, _B3} = protocol:uint8(_B2),
    {V1_fusion_val, _B4} = protocol:uint32(_B3),
    {V1_plan_1, _B9} = protocol:array(_B4,
                                      fun (_B5) ->
                                              {V2_type_1, _B6} =
                                                  protocol:uint32(_B5),
                                              {V2_id_1, _B7} =
                                                  protocol:uint32(_B6),
                                              {{V2_type_1, V2_id_1}, _B7}
                                      end),
    {V1_plan_2, _B14} = protocol:array(_B9,
                                       fun (_B10) ->
                                               {V2_type_2, _B11} =
                                                   protocol:uint32(_B10),
                                               {V2_id_2, _B12} =
                                                   protocol:uint32(_B11),
                                               {{V2_type_2, V2_id_2}, _B12}
                                       end),
    {V1_fc, _B15} = protocol:uint32(_B14),
    {V1_items, _B28} = protocol:array(_B15,
                                      fun (_B16) ->
                                              {V2_id, _B17} =
                                                  protocol:uint32(_B16),
                                              {V2_base_id, _B18} =
                                                  protocol:uint32(_B17),
                                              {V2_fc, _B19} =
                                                  protocol:uint32(_B18),
                                              {V2_attr, _B26} =
                                                  protocol:array(_B19,
                                                                 fun (_B20) ->
                                                                         {V3_type,
                                                                          _B21} =
                                                                             protocol:uint16(_B20),
                                                                         {V3_name,
                                                                          _B22} =
                                                                             protocol:uint32(_B21),
                                                                         {V3_flag,
                                                                          _B23} =
                                                                             protocol:uint32(_B22),
                                                                         {V3_val,
                                                                          _B24} =
                                                                             protocol:int32(_B23),
                                                                         {{V3_type,
                                                                           V3_name,
                                                                           V3_flag,
                                                                           V3_val},
                                                                          _B24}
                                                                 end),
                                              {{V2_id,
                                                V2_base_id,
                                                V2_fc,
                                                V2_attr},
                                               _B26}
                                      end),
    {V1_volume, _B29} = protocol:uint32(_B28),
    {ok,
     {V1_times,
      V1_use_plan,
      V1_fusion_lev,
      V1_fusion_val,
      V1_plan_1,
      V1_plan_2,
      V1_fc,
      V1_items,
      V1_volume}};
unpack(srv, 19601, _B0) -> {ok, {}};
unpack(cli, 19601, _B0) ->
    {V1_items, _B13} = protocol:array(_B0,
                                      fun (_B1) ->
                                              {V2_id, _B2} =
                                                  protocol:uint32(_B1),
                                              {V2_base_id, _B3} =
                                                  protocol:uint32(_B2),
                                              {V2_fc, _B4} =
                                                  protocol:uint32(_B3),
                                              {V2_attr, _B11} =
                                                  protocol:array(_B4,
                                                                 fun (_B5) ->
                                                                         {V3_type,
                                                                          _B6} =
                                                                             protocol:uint16(_B5),
                                                                         {V3_name,
                                                                          _B7} =
                                                                             protocol:uint32(_B6),
                                                                         {V3_flag,
                                                                          _B8} =
                                                                             protocol:uint32(_B7),
                                                                         {V3_val,
                                                                          _B9} =
                                                                             protocol:int32(_B8),
                                                                         {{V3_type,
                                                                           V3_name,
                                                                           V3_flag,
                                                                           V3_val},
                                                                          _B9}
                                                                 end),
                                              {{V2_id,
                                                V2_base_id,
                                                V2_fc,
                                                V2_attr},
                                               _B11}
                                      end),
    {ok, {V1_items}};
unpack(srv, 19602, _B0) -> {ok, {}};
unpack(cli, 19602, _B0) ->
    {V1_items, _B4} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_id, _B2} =
                                                 protocol:uint32(_B1),
                                             {{V2_id}, _B2}
                                     end),
    {ok, {V1_items}};
unpack(srv, 19603, _B0) -> {ok, {}};
unpack(cli, 19603, _B0) ->
    {V1_items, _B13} = protocol:array(_B0,
                                      fun (_B1) ->
                                              {V2_id, _B2} =
                                                  protocol:uint32(_B1),
                                              {V2_base_id, _B3} =
                                                  protocol:uint32(_B2),
                                              {V2_fc, _B4} =
                                                  protocol:uint32(_B3),
                                              {V2_attr, _B11} =
                                                  protocol:array(_B4,
                                                                 fun (_B5) ->
                                                                         {V3_type,
                                                                          _B6} =
                                                                             protocol:uint16(_B5),
                                                                         {V3_name,
                                                                          _B7} =
                                                                             protocol:uint32(_B6),
                                                                         {V3_flag,
                                                                          _B8} =
                                                                             protocol:uint32(_B7),
                                                                         {V3_val,
                                                                          _B9} =
                                                                             protocol:int32(_B8),
                                                                         {{V3_type,
                                                                           V3_name,
                                                                           V3_flag,
                                                                           V3_val},
                                                                          _B9}
                                                                 end),
                                              {{V2_id,
                                                V2_base_id,
                                                V2_fc,
                                                V2_attr},
                                               _B11}
                                      end),
    {ok, {V1_items}};
unpack(srv, 19604, _B0) -> {ok, {}};
unpack(cli, 19604, _B0) ->
    {V1_times, _B1} = protocol:uint8(_B0),
    {V1_fusion_lev, _B2} = protocol:uint8(_B1),
    {V1_fusion_val, _B3} = protocol:uint32(_B2),
    {V1_fc, _B4} = protocol:uint32(_B3),
    {ok, {V1_times, V1_fusion_lev, V1_fusion_val, V1_fc}};
unpack(srv, 19605, _B0) ->
    {V1_plan, _B1} = protocol:uint8(_B0),
    {ok, {V1_plan}};
unpack(cli, 19605, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_use_plan, _B3} = protocol:uint8(_B2),
    {ok, {V1_flag, V1_msg, V1_use_plan}};
unpack(srv, 19606, _B0) ->
    {V1_items1, _B4} = protocol:array(_B0,
                                      fun (_B1) ->
                                              {V2_id1, _B2} =
                                                  protocol:uint32(_B1),
                                              {{V2_id1}, _B2}
                                      end),
    {V1_items2, _B8} = protocol:array(_B4,
                                      fun (_B5) ->
                                              {V2_id2, _B6} =
                                                  protocol:uint32(_B5),
                                              {{V2_id2}, _B6}
                                      end),
    {ok, {V1_items1, V1_items2}};
unpack(cli, 19606, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 19607, _B0) ->
    {V1_id1, _B1} = protocol:uint32(_B0),
    {V1_dst_flags, _B5} = protocol:array(_B1,
                                         fun (_B2) ->
                                                 {V2_flag1, _B3} =
                                                     protocol:uint8(_B2),
                                                 {{V2_flag1}, _B3}
                                         end),
    {V1_id2, _B6} = protocol:uint32(_B5),
    {V1_src_flags, _B10} = protocol:array(_B6,
                                          fun (_B7) ->
                                                  {V2_flag2, _B8} =
                                                      protocol:uint8(_B7),
                                                  {{V2_flag2}, _B8}
                                          end),
    {ok, {V1_id1, V1_dst_flags, V1_id2, V1_src_flags}};
unpack(cli, 19607, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_attr_info1, _B9} = protocol:array(_B2,
                                          fun (_B3) ->
                                                  {V2_type, _B4} =
                                                      protocol:uint16(_B3),
                                                  {V2_name, _B5} =
                                                      protocol:uint32(_B4),
                                                  {V2_flag, _B6} =
                                                      protocol:uint32(_B5),
                                                  {V2_val, _B7} =
                                                      protocol:int32(_B6),
                                                  {{V2_type,
                                                    V2_name,
                                                    V2_flag,
                                                    V2_val},
                                                   _B7}
                                          end),
    {V1_attr_info2, _B16} = protocol:array(_B9,
                                           fun (_B10) ->
                                                   {V2_type, _B11} =
                                                       protocol:uint16(_B10),
                                                   {V2_name, _B12} =
                                                       protocol:uint32(_B11),
                                                   {V2_flag, _B13} =
                                                       protocol:uint32(_B12),
                                                   {V2_val, _B14} =
                                                       protocol:int32(_B13),
                                                   {{V2_type,
                                                     V2_name,
                                                     V2_flag,
                                                     V2_val},
                                                    _B14}
                                           end),
    {ok, {V1_flag, V1_msg, V1_attr_info1, V1_attr_info2}};
unpack(srv, 19608, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 19608, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_use_plan, _B3} = protocol:uint8(_B2),
    {V1_plan_1, _B8} = protocol:array(_B3,
                                      fun (_B4) ->
                                              {V2_type_1, _B5} =
                                                  protocol:uint32(_B4),
                                              {V2_id_1, _B6} =
                                                  protocol:uint32(_B5),
                                              {{V2_type_1, V2_id_1}, _B6}
                                      end),
    {V1_plan_2, _B13} = protocol:array(_B8,
                                       fun (_B9) ->
                                               {V2_type_2, _B10} =
                                                   protocol:uint32(_B9),
                                               {V2_id_2, _B11} =
                                                   protocol:uint32(_B10),
                                               {{V2_type_2, V2_id_2}, _B11}
                                       end),
    {ok,
     {V1_flag, V1_msg, V1_use_plan, V1_plan_1, V1_plan_2}};
unpack(srv, 19609, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {ok, {V1_type}};
unpack(cli, 19609, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_use_plan, _B3} = protocol:uint8(_B2),
    {V1_plan_1, _B8} = protocol:array(_B3,
                                      fun (_B4) ->
                                              {V2_type_1, _B5} =
                                                  protocol:uint32(_B4),
                                              {V2_id_1, _B6} =
                                                  protocol:uint32(_B5),
                                              {{V2_type_1, V2_id_1}, _B6}
                                      end),
    {V1_plan_2, _B13} = protocol:array(_B8,
                                       fun (_B9) ->
                                               {V2_type_2, _B10} =
                                                   protocol:uint32(_B9),
                                               {V2_id_2, _B11} =
                                                   protocol:uint32(_B10),
                                               {{V2_type_2, V2_id_2}, _B11}
                                       end),
    {ok,
     {V1_flag, V1_msg, V1_use_plan, V1_plan_1, V1_plan_2}};
unpack(srv, 19610, _B0) -> {ok, {}};
unpack(cli, 19610, _B0) ->
    {V1_formula, _B5} = protocol:array(_B0,
                                       fun (_B1) ->
                                               {V2_formula_id, _B2} =
                                                   protocol:uint32(_B1),
                                               {V2_use_times, _B3} =
                                                   protocol:uint32(_B2),
                                               {{V2_formula_id, V2_use_times},
                                                _B3}
                                       end),
    {ok, {V1_formula}};
unpack(srv, 19611, _B0) ->
    {V1_formula_id, _B1} = protocol:uint32(_B0),
    {V1_stuff_list, _B6} = protocol:array(_B1,
                                          fun (_B2) ->
                                                  {V2_id, _B3} =
                                                      protocol:uint32(_B2),
                                                  {V2_index, _B4} =
                                                      protocol:uint8(_B3),
                                                  {{V2_id, V2_index}, _B4}
                                          end),
    {ok, {V1_formula_id, V1_stuff_list}};
unpack(cli, 19611, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_id}};
unpack(srv, 19612, _B0) -> {ok, {}};
unpack(cli, 19612, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_volume, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_volume}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

