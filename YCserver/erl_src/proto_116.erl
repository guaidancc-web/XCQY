-file("src/proto/proto_116.erl", 1).

-module(proto_116).

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

-file("src/proto/proto_116.erl", 14).

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

-file("src/proto/proto_116.erl", 15).

-file("inc/wing.hrl", 1).

-record(m_wing,
        {ver = 11 :: pos_integer(),
         grade = 0 :: non_neg_integer(),
         growth = 0,
         enhance_num = 0,
         wing_id = 0,
         plot_wing_id = 0,
         expiry = [],
         tmp_grade = 0 :: non_neg_integer(),
         tmp_growth = 0,
         tmp_wing_id = 0,
         star_lev = 1 :: non_neg_integer(),
         valid_plan = 1,
         plan_data = [] :: list(),
         change_times = 0,
         reset_times = 0,
         lev_break_skill = [],
         wing_ids = [],
         exp = 0,
         old_grade = 0,
         old_star = 0,
         appearance_list = [],
         speed = 1,
         wing_group_list = [],
         wing_power = 100}).

-record(wing_skill_plan,
        {index = 1,
         plan_name = [] :: list(),
         skills = [],
         tmp_skills = []}).

-record(wing_lev_break_skill,
        {ver = 1,
         skill_grade = 0,
         skill_id = 0,
         skill_lev = 0,
         skill_val = 0}).

-record(wing_skill,
        {ver = 1, key = {0, 0}, id = 0, lev = 0, is_lock = 0}).

-record(wing_lock_data,
        {grade = 0, max = 0, item_list = []}).

-record(wing_appearance,
        {id = 0,
         time = 0,
         timeout = 0,
         grade = 0,
         star_lev = 0}).

-record(wing_base_group,
        {group_id = 0,
         need_grade = 0,
         wing_ids = [],
         grades = [],
         loss_item = []}).

-record(wing_group,
        {ver = 1,
         group_id = 0,
         wing_ids = [],
         wing_times = 0,
         rewarded = 0}).

-file("src/proto/proto_116.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 11600, {}) ->
    {ok, <<2:32/little, 11600:16/little>>};
pack(srv, 11600,
     {V0_grade,
      V0_wing_id,
      V0_growth,
      V0_enhance,
      V0_tmp_grade,
      V0_tmp_wing_id,
      V0_tmp_growth,
      V0_star,
      V0_valid_plan,
      V0_plan_data,
      V0_change_times,
      V0_reset_times,
      V0_break_skills,
      V0_wing_ids,
      V0_exp,
      V0_appearance,
      V0_speed,
      V0_wing_groups,
      V0_wing_power}) ->
    D_a_t_a = <<V0_grade:8/little, V0_wing_id:32/little,
                V0_growth:8/little, V0_enhance:8/little,
                V0_tmp_grade:8/little, V0_tmp_wing_id:32/little,
                V0_tmp_growth:8/little, V0_star:32/little,
                V0_valid_plan:8/little,
                (length(V0_plan_data)):16/little,
                (list_to_binary([<<V1_index:8/little,
                                   (protocol:pack(string, V1_plan_name))/binary,
                                   (length(V1_skills)):16/little,
                                   (list_to_binary([<<V2_id:32/little,
                                                      V2_lev:8/little,
                                                      V2_is_lock:8/little>>
                                                    || #wing_skill{id = V2_id,
                                                                   lev = V2_lev,
                                                                   is_lock =
                                                                       V2_is_lock}
                                                           <- V1_skills]))/binary,
                                   (length(V1_tmp_skills)):16/little,
                                   (list_to_binary([<<V2_id:32/little,
                                                      V2_lev:8/little,
                                                      V2_is_lock:8/little>>
                                                    || #wing_skill{id = V2_id,
                                                                   lev = V2_lev,
                                                                   is_lock =
                                                                       V2_is_lock}
                                                           <- V1_tmp_skills]))/binary>>
                                 || #wing_skill_plan{index = V1_index,
                                                     plan_name = V1_plan_name,
                                                     skills = V1_skills,
                                                     tmp_skills = V1_tmp_skills}
                                        <- V0_plan_data]))/binary,
                V0_change_times:32/little, V0_reset_times:32/little,
                (length(V0_break_skills)):16/little,
                (list_to_binary([<<V1_skill_grade:8/little,
                                   V1_skill_id:32/little, V1_skill_lev:8/little,
                                   V1_skill_val:8/little>>
                                 || #wing_lev_break_skill{skill_grade =
                                                              V1_skill_grade,
                                                          skill_id =
                                                              V1_skill_id,
                                                          skill_lev =
                                                              V1_skill_lev,
                                                          skill_val =
                                                              V1_skill_val}
                                        <- V0_break_skills]))/binary,
                (length(V0_wing_ids)):16/little,
                (list_to_binary([<<V1_elem_wing_id:32/little>>
                                 || V1_elem_wing_id <- V0_wing_ids]))/binary,
                V0_exp:32/little, (length(V0_appearance)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_timeout:32/little>>
                                 || #wing_appearance{id = V1_id,
                                                     timeout = V1_timeout}
                                        <- V0_appearance]))/binary,
                V0_speed:8/little, (length(V0_wing_groups)):16/little,
                (list_to_binary([<<V1_group_id:32/little,
                                   (length(V1_wing_ids)):16/little,
                                   (list_to_binary([<<V2_wing_id:32/little>>
                                                    || V2_wing_id
                                                           <- V1_wing_ids]))/binary,
                                   V1_wing_times:32/little,
                                   V1_rewarded:8/little>>
                                 || #wing_group{group_id = V1_group_id,
                                                wing_ids = V1_wing_ids,
                                                wing_times = V1_wing_times,
                                                rewarded = V1_rewarded}
                                        <- V0_wing_groups]))/binary,
                V0_wing_power:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11600:16/little,
       D_a_t_a/binary>>};
pack(cli, 11601, {}) ->
    {ok, <<2:32/little, 11601:16/little>>};
pack(srv, 11601, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11601:16/little,
       D_a_t_a/binary>>};
pack(cli, 11602, {}) ->
    {ok, <<2:32/little, 11602:16/little>>};
pack(srv, 11602, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11602:16/little,
       D_a_t_a/binary>>};
pack(cli, 11603, {}) ->
    {ok, <<2:32/little, 11603:16/little>>};
pack(srv, 11603, {V0_result, V0_msg, V0_crit}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_crit:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11603:16/little,
       D_a_t_a/binary>>};
pack(cli, 11604, {}) ->
    {ok, <<2:32/little, 11604:16/little>>};
pack(srv, 11604, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11604:16/little,
       D_a_t_a/binary>>};
pack(cli, 11605, {}) ->
    {ok, <<2:32/little, 11605:16/little>>};
pack(srv, 11605, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11605:16/little,
       D_a_t_a/binary>>};
pack(cli, 11606, {}) ->
    {ok, <<2:32/little, 11606:16/little>>};
pack(srv, 11606, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11606:16/little,
       D_a_t_a/binary>>};
pack(cli, 11607, {}) ->
    {ok, <<2:32/little, 11607:16/little>>};
pack(srv, 11607, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11607:16/little,
       D_a_t_a/binary>>};
pack(cli, 11608, {}) ->
    {ok, <<2:32/little, 11608:16/little>>};
pack(srv, 11608, {V0_skills}) ->
    D_a_t_a = <<(length(V0_skills)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_lev:8/little,
                                   V1_is_lock:8/little>>
                                 || #wing_skill{id = V1_id, lev = V1_lev,
                                                is_lock = V1_is_lock}
                                        <- V0_skills]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11608:16/little,
       D_a_t_a/binary>>};
pack(cli, 11609, {V0_valid_plan}) ->
    D_a_t_a = <<V0_valid_plan:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11609:16/little,
       D_a_t_a/binary>>};
pack(srv, 11609, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11609:16/little,
       D_a_t_a/binary>>};
pack(cli, 11610, {V0_skill, V0_lev}) ->
    D_a_t_a = <<V0_skill:32/little, V0_lev:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11610:16/little,
       D_a_t_a/binary>>};
pack(srv, 11610, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11610:16/little,
       D_a_t_a/binary>>};
pack(cli, 11611, {V0_grade, V0_skill}) ->
    D_a_t_a = <<V0_grade:8/little, V0_skill:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11611:16/little,
       D_a_t_a/binary>>};
pack(srv, 11611,
     {V0_result,
      V0_msg,
      V0_skill_grade,
      V0_skill_id,
      V0_skill_lev,
      V0_skill_val}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_skill_grade:8/little, V0_skill_id:32/little,
                V0_skill_lev:8/little, V0_skill_val:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11611:16/little,
       D_a_t_a/binary>>};
pack(cli, 11613, {V0_wing_id}) ->
    D_a_t_a = <<V0_wing_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11613:16/little,
       D_a_t_a/binary>>};
pack(srv, 11613, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11613:16/little,
       D_a_t_a/binary>>};
pack(cli, 11614, {V0_speed}) ->
    D_a_t_a = <<V0_speed:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11614:16/little,
       D_a_t_a/binary>>};
pack(srv, 11614, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11614:16/little,
       D_a_t_a/binary>>};
pack(cli, 11615, {V0_group_id, V0_type}) ->
    D_a_t_a = <<V0_group_id:32/little, V0_type:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11615:16/little,
       D_a_t_a/binary>>};
pack(srv, 11615,
     {V0_result, V0_index, V0_items, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little, V0_index:8/little,
                (length(V0_items)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_bind:8/little, V1_num:32/little>>
                                 || {V1_base_id, V1_bind, V1_num}
                                        <- V0_items]))/binary,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11615:16/little,
       D_a_t_a/binary>>};
pack(cli, 11616, {V0_group_id, V0_wing_id}) ->
    D_a_t_a = <<V0_group_id:32/little,
                V0_wing_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11616:16/little,
       D_a_t_a/binary>>};
pack(srv, 11616, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11616:16/little,
       D_a_t_a/binary>>};
pack(cli, 11617, {}) ->
    {ok, <<2:32/little, 11617:16/little>>};
pack(srv, 11617, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11617:16/little,
       D_a_t_a/binary>>};
pack(cli, 11618, {V0_group_id}) ->
    D_a_t_a = <<V0_group_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11618:16/little,
       D_a_t_a/binary>>};
pack(srv, 11618, {V0_result, V0_msg, V0_group_id}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_group_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11618:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 11600, _B0) -> {ok, {}};
unpack(cli, 11600, _B0) ->
    {V1_grade, _B1} = protocol:uint8(_B0),
    {V1_wing_id, _B2} = protocol:uint32(_B1),
    {V1_growth, _B3} = protocol:uint8(_B2),
    {V1_enhance, _B4} = protocol:uint8(_B3),
    {V1_tmp_grade, _B5} = protocol:uint8(_B4),
    {V1_tmp_wing_id, _B6} = protocol:uint32(_B5),
    {V1_tmp_growth, _B7} = protocol:uint8(_B6),
    {V1_star, _B8} = protocol:uint32(_B7),
    {V1_valid_plan, _B9} = protocol:uint8(_B8),
    {V1_plan_data, _B26} = protocol:array(_B9,
                                          fun (_B10) ->
                                                  {V2_index, _B11} =
                                                      protocol:uint8(_B10),
                                                  {V2_plan_name, _B12} =
                                                      protocol:string(_B11),
                                                  {V2_skills, _B18} =
                                                      protocol:array(_B12,
                                                                     fun
                                                                         (_B13) ->
                                                                             {V3_id,
                                                                              _B14} =
                                                                                 protocol:uint32(_B13),
                                                                             {V3_lev,
                                                                              _B15} =
                                                                                 protocol:uint8(_B14),
                                                                             {V3_is_lock,
                                                                              _B16} =
                                                                                 protocol:uint8(_B15),
                                                                             {{V3_id,
                                                                               V3_lev,
                                                                               V3_is_lock},
                                                                              _B16}
                                                                     end),
                                                  {V2_tmp_skills, _B24} =
                                                      protocol:array(_B18,
                                                                     fun
                                                                         (_B19) ->
                                                                             {V3_id,
                                                                              _B20} =
                                                                                 protocol:uint32(_B19),
                                                                             {V3_lev,
                                                                              _B21} =
                                                                                 protocol:uint8(_B20),
                                                                             {V3_is_lock,
                                                                              _B22} =
                                                                                 protocol:uint8(_B21),
                                                                             {{V3_id,
                                                                               V3_lev,
                                                                               V3_is_lock},
                                                                              _B22}
                                                                     end),
                                                  {{V2_index,
                                                    V2_plan_name,
                                                    V2_skills,
                                                    V2_tmp_skills},
                                                   _B24}
                                          end),
    {V1_change_times, _B27} = protocol:uint32(_B26),
    {V1_reset_times, _B28} = protocol:uint32(_B27),
    {V1_break_skills, _B35} = protocol:array(_B28,
                                             fun (_B29) ->
                                                     {V2_skill_grade, _B30} =
                                                         protocol:uint8(_B29),
                                                     {V2_skill_id, _B31} =
                                                         protocol:uint32(_B30),
                                                     {V2_skill_lev, _B32} =
                                                         protocol:uint8(_B31),
                                                     {V2_skill_val, _B33} =
                                                         protocol:uint8(_B32),
                                                     {{V2_skill_grade,
                                                       V2_skill_id,
                                                       V2_skill_lev,
                                                       V2_skill_val},
                                                      _B33}
                                             end),
    {V1_wing_ids, _B39} = protocol:array(_B35,
                                         fun (_B36) ->
                                                 {V2_elem_wing_id, _B37} =
                                                     protocol:uint32(_B36),
                                                 {{V2_elem_wing_id}, _B37}
                                         end),
    {V1_exp, _B40} = protocol:uint32(_B39),
    {V1_appearance, _B45} = protocol:array(_B40,
                                           fun (_B41) ->
                                                   {V2_id, _B42} =
                                                       protocol:uint32(_B41),
                                                   {V2_timeout, _B43} =
                                                       protocol:uint32(_B42),
                                                   {{V2_id, V2_timeout}, _B43}
                                           end),
    {V1_speed, _B46} = protocol:uint8(_B45),
    {V1_wing_groups, _B56} = protocol:array(_B46,
                                            fun (_B47) ->
                                                    {V2_group_id, _B48} =
                                                        protocol:uint32(_B47),
                                                    {V2_wing_ids, _B52} =
                                                        protocol:array(_B48,
                                                                       fun
                                                                           (_B49) ->
                                                                               {V3_wing_id,
                                                                                _B50} =
                                                                                   protocol:uint32(_B49),
                                                                               {{V3_wing_id},
                                                                                _B50}
                                                                       end),
                                                    {V2_wing_times, _B53} =
                                                        protocol:uint32(_B52),
                                                    {V2_rewarded, _B54} =
                                                        protocol:uint8(_B53),
                                                    {{V2_group_id,
                                                      V2_wing_ids,
                                                      V2_wing_times,
                                                      V2_rewarded},
                                                     _B54}
                                            end),
    {V1_wing_power, _B57} = protocol:uint32(_B56),
    {ok,
     {V1_grade,
      V1_wing_id,
      V1_growth,
      V1_enhance,
      V1_tmp_grade,
      V1_tmp_wing_id,
      V1_tmp_growth,
      V1_star,
      V1_valid_plan,
      V1_plan_data,
      V1_change_times,
      V1_reset_times,
      V1_break_skills,
      V1_wing_ids,
      V1_exp,
      V1_appearance,
      V1_speed,
      V1_wing_groups,
      V1_wing_power}};
unpack(srv, 11601, _B0) -> {ok, {}};
unpack(cli, 11601, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11602, _B0) -> {ok, {}};
unpack(cli, 11602, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11603, _B0) -> {ok, {}};
unpack(cli, 11603, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_crit, _B3} = protocol:uint8(_B2),
    {ok, {V1_result, V1_msg, V1_crit}};
unpack(srv, 11604, _B0) -> {ok, {}};
unpack(cli, 11604, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11605, _B0) -> {ok, {}};
unpack(cli, 11605, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11606, _B0) -> {ok, {}};
unpack(cli, 11606, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11607, _B0) -> {ok, {}};
unpack(cli, 11607, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11608, _B0) -> {ok, {}};
unpack(cli, 11608, _B0) ->
    {V1_skills, _B6} = protocol:array(_B0,
                                      fun (_B1) ->
                                              {V2_id, _B2} =
                                                  protocol:uint32(_B1),
                                              {V2_lev, _B3} =
                                                  protocol:uint8(_B2),
                                              {V2_is_lock, _B4} =
                                                  protocol:uint8(_B3),
                                              {{V2_id, V2_lev, V2_is_lock}, _B4}
                                      end),
    {ok, {V1_skills}};
unpack(srv, 11609, _B0) ->
    {V1_valid_plan, _B1} = protocol:uint8(_B0),
    {ok, {V1_valid_plan}};
unpack(cli, 11609, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11610, _B0) ->
    {V1_skill, _B1} = protocol:uint32(_B0),
    {V1_lev, _B2} = protocol:uint8(_B1),
    {ok, {V1_skill, V1_lev}};
unpack(cli, 11610, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11611, _B0) ->
    {V1_grade, _B1} = protocol:uint8(_B0),
    {V1_skill, _B2} = protocol:uint32(_B1),
    {ok, {V1_grade, V1_skill}};
unpack(cli, 11611, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_skill_grade, _B3} = protocol:uint8(_B2),
    {V1_skill_id, _B4} = protocol:uint32(_B3),
    {V1_skill_lev, _B5} = protocol:uint8(_B4),
    {V1_skill_val, _B6} = protocol:uint8(_B5),
    {ok,
     {V1_result,
      V1_msg,
      V1_skill_grade,
      V1_skill_id,
      V1_skill_lev,
      V1_skill_val}};
unpack(srv, 11613, _B0) ->
    {V1_wing_id, _B1} = protocol:uint16(_B0),
    {ok, {V1_wing_id}};
unpack(cli, 11613, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11614, _B0) ->
    {V1_speed, _B1} = protocol:uint8(_B0),
    {ok, {V1_speed}};
unpack(cli, 11614, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11615, _B0) ->
    {V1_group_id, _B1} = protocol:uint32(_B0),
    {V1_type, _B2} = protocol:uint32(_B1),
    {ok, {V1_group_id, V1_type}};
unpack(cli, 11615, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_index, _B2} = protocol:uint8(_B1),
    {V1_items, _B8} = protocol:array(_B2,
                                     fun (_B3) ->
                                             {V2_base_id, _B4} =
                                                 protocol:uint32(_B3),
                                             {V2_bind, _B5} =
                                                 protocol:uint8(_B4),
                                             {V2_num, _B6} =
                                                 protocol:uint32(_B5),
                                             {{V2_base_id, V2_bind, V2_num},
                                              _B6}
                                     end),
    {V1_msg, _B9} = protocol:string(_B8),
    {ok, {V1_result, V1_index, V1_items, V1_msg}};
unpack(srv, 11616, _B0) ->
    {V1_group_id, _B1} = protocol:uint32(_B0),
    {V1_wing_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_group_id, V1_wing_id}};
unpack(cli, 11616, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11617, _B0) -> {ok, {}};
unpack(cli, 11617, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11618, _B0) ->
    {V1_group_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_group_id}};
unpack(cli, 11618, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_group_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_result, V1_msg, V1_group_id}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

