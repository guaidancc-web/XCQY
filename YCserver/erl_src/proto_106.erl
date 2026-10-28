-file("src/proto/proto_106.erl", 1).

-module(proto_106).

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

-file("src/proto/proto_106.erl", 14).

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

-file("src/proto/proto_106.erl", 15).

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

-file("src/proto/proto_106.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 10600,
     {V0_id, V0_is_perfect, V0_use_hero_paper}) ->
    D_a_t_a = <<V0_id:32/little, V0_is_perfect:8/little,
                V0_use_hero_paper:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10600:16/little,
       D_a_t_a/binary>>};
pack(srv, 10600, {V0_flag, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10600:16/little,
       D_a_t_a/binary>>};
pack(cli, 10602,
     {V0_id, V0_luck_list, V0_protect_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (length(V0_luck_list)):16/little,
                (list_to_binary([<<V1_luck_id:32/little,
                                   V1_num:8/little>>
                                 || {V1_luck_id, V1_num}
                                        <- V0_luck_list]))/binary,
                V0_protect_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10602:16/little,
       D_a_t_a/binary>>};
pack(srv, 10602, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10602:16/little,
       D_a_t_a/binary>>};
pack(cli, 10603, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10603:16/little,
       D_a_t_a/binary>>};
pack(srv, 10603,
     {V0_flag,
      V0_msg,
      V0_id,
      V0_reset_attr,
      V0_reset_val,
      V0_lucky_val}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary, V0_id:32/little,
                (length(V0_reset_attr)):16/little,
                (list_to_binary([<<V1_type:16/little, V1_name:32/little,
                                   V1_flag:32/little, V1_val:32/signed-little>>
                                 || #attr_base{type = V1_type, name = V1_name,
                                               flag = V1_flag, val = V1_val}
                                        <- V0_reset_attr]))/binary,
                V0_reset_val:16/little, V0_lucky_val:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10603:16/little,
       D_a_t_a/binary>>};
pack(cli, 10604, {V0_id, V0_hole_id, V0_stone_id}) ->
    D_a_t_a = <<V0_id:32/little, V0_hole_id:8/little,
                V0_stone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10604:16/little,
       D_a_t_a/binary>>};
pack(srv, 10604, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10604:16/little,
       D_a_t_a/binary>>};
pack(cli, 10605, {V0_id, V0_hole_id, V0_stone_id}) ->
    D_a_t_a = <<V0_id:32/little, V0_hole_id:8/little,
                V0_stone_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10605:16/little,
       D_a_t_a/binary>>};
pack(srv, 10605, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10605:16/little,
       D_a_t_a/binary>>};
pack(cli, 10606, {V0_id, V0_hole_id}) ->
    D_a_t_a = <<V0_id:32/little, V0_hole_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10606:16/little,
       D_a_t_a/binary>>};
pack(srv, 10606, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10606:16/little,
       D_a_t_a/binary>>};
pack(cli, 10607, {V0_base_id, V0_num}) ->
    D_a_t_a = <<V0_base_id:32/little, V0_num:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10607:16/little,
       D_a_t_a/binary>>};
pack(srv, 10607, {V0_flag, V0_msg, V0_next_base_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_next_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10607:16/little,
       D_a_t_a/binary>>};
pack(cli, 10608, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10608:16/little,
       D_a_t_a/binary>>};
pack(srv, 10608, {V0_flag, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10608:16/little,
       D_a_t_a/binary>>};
pack(cli, 10609, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10609:16/little,
       D_a_t_a/binary>>};
pack(srv, 10609,
     {V0_id, V0_backup_attr, V0_lucky_val}) ->
    D_a_t_a = <<V0_id:32/little,
                (length(V0_backup_attr)):16/little,
                (list_to_binary([<<V1_type:16/little, V1_name:32/little,
                                   V1_flag:32/little, V1_val:32/signed-little>>
                                 || #attr_base{type = V1_type, name = V1_name,
                                               flag = V1_flag, val = V1_val}
                                        <- V0_backup_attr]))/binary,
                V0_lucky_val:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10609:16/little,
       D_a_t_a/binary>>};
pack(cli, 10610, {V0_id1, V0_id2}) ->
    D_a_t_a = <<V0_id1:32/little, V0_id2:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10610:16/little,
       D_a_t_a/binary>>};
pack(srv, 10610, {V0_flag, V0_msg, V0_next_base_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_next_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10610:16/little,
       D_a_t_a/binary>>};
pack(cli, 10611, {V0_id, V0_side}) ->
    D_a_t_a = <<V0_id:32/little, V0_side:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10611:16/little,
       D_a_t_a/binary>>};
pack(srv, 10611, {V0_flag, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10611:16/little,
       D_a_t_a/binary>>};
pack(cli, 10612, {}) ->
    {ok, <<2:32/little, 10612:16/little>>};
pack(srv, 10612, {V0_reset_val}) ->
    D_a_t_a = <<V0_reset_val:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10612:16/little,
       D_a_t_a/binary>>};
pack(cli, 10613, {}) ->
    {ok, <<2:32/little, 10613:16/little>>};
pack(srv, 10613, {V0_flag, V0_msg, V0_reset_val}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_reset_val:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10613:16/little,
       D_a_t_a/binary>>};
pack(cli, 10614, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10614:16/little,
       D_a_t_a/binary>>};
pack(srv, 10614, {V0_flag, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10614:16/little,
       D_a_t_a/binary>>};
pack(cli, 10615, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10615:16/little,
       D_a_t_a/binary>>};
pack(srv, 10615, {V0_id, V0_reset_attr}) ->
    D_a_t_a = <<V0_id:32/little,
                (length(V0_reset_attr)):16/little,
                (list_to_binary([<<V1_type:16/little, V1_name:32/little,
                                   V1_flag:32/little, V1_val:32/signed-little>>
                                 || #attr_base{type = V1_type, name = V1_name,
                                               flag = V1_flag, val = V1_val}
                                        <- V0_reset_attr]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10615:16/little,
       D_a_t_a/binary>>};
pack(cli, 10616, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10616:16/little,
       D_a_t_a/binary>>};
pack(srv, 10616, {V0_flag, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10616:16/little,
       D_a_t_a/binary>>};
pack(cli, 10617, {V0_id, V0_craft, V0_lock}) ->
    D_a_t_a = <<V0_id:32/little, V0_craft:8/little,
                V0_lock:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10617:16/little,
       D_a_t_a/binary>>};
pack(srv, 10617, {V0_flag, V0_msg, V0_id, V0_lock}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary, V0_id:32/little,
                V0_lock:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10617:16/little,
       D_a_t_a/binary>>};
pack(cli, 10618, {V0_id, V0_craft}) ->
    D_a_t_a = <<V0_id:32/little, V0_craft:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10618:16/little,
       D_a_t_a/binary>>};
pack(srv, 10618, {V0_flag, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10618:16/little,
       D_a_t_a/binary>>};
pack(cli, 10619, {V0_id, V0_looks}) ->
    D_a_t_a = <<V0_id:32/little, V0_looks:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10619:16/little,
       D_a_t_a/binary>>};
pack(srv, 10619, {V0_flag, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10619:16/little,
       D_a_t_a/binary>>};
pack(cli, 10620, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10620:16/little,
       D_a_t_a/binary>>};
pack(srv, 10620,
     {V0_id, V0_back_lev, V0_now_lev, V0_attr_list}) ->
    D_a_t_a = <<V0_id:32/little, V0_back_lev:8/little,
                V0_now_lev:8/little, (length(V0_attr_list)):16/little,
                (list_to_binary([<<V1_type:16/little, V1_name:32/little,
                                   V1_flag:32/little, V1_val:32/signed-little>>
                                 || #attr_base{type = V1_type, name = V1_name,
                                               flag = V1_flag, val = V1_val}
                                        <- V0_attr_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10620:16/little,
       D_a_t_a/binary>>};
pack(cli, 10621, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10621:16/little,
       D_a_t_a/binary>>};
pack(srv, 10621, {V0_flag, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10621:16/little,
       D_a_t_a/binary>>};
pack(cli, 10622, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10622:16/little,
       D_a_t_a/binary>>};
pack(srv, 10622, {V0_flag, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10622:16/little,
       D_a_t_a/binary>>};
pack(cli, 10623, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10623:16/little,
       D_a_t_a/binary>>};
pack(srv, 10623, {V0_flag, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10623:16/little,
       D_a_t_a/binary>>};
pack(cli, 10624, {V0_id, V0_hole_id, V0_num}) ->
    D_a_t_a = <<V0_id:32/little, V0_hole_id:8/little,
                V0_num:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10624:16/little,
       D_a_t_a/binary>>};
pack(srv, 10624, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10624:16/little,
       D_a_t_a/binary>>};
pack(cli, 10625, {V0_id, V0_hole_id, V0_base_id}) ->
    D_a_t_a = <<V0_id:32/little, V0_hole_id:8/little,
                V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10625:16/little,
       D_a_t_a/binary>>};
pack(srv, 10625, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10625:16/little,
       D_a_t_a/binary>>};
pack(cli, 10626, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10626:16/little,
       D_a_t_a/binary>>};
pack(srv, 10626, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10626:16/little,
       D_a_t_a/binary>>};
pack(cli, 10627, {}) ->
    {ok, <<2:32/little, 10627:16/little>>};
pack(srv, 10627, {V0_talisman_list}) ->
    D_a_t_a = <<(length(V0_talisman_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_base_id:32/little,
                                   (length(V1_reset_list)):16/little,
                                   (list_to_binary([<<V2_reset_base_id:32/little,
                                                      V2_reset_flag:8/little>>
                                                    || {V2_reset_base_id,
                                                        V2_reset_flag}
                                                           <- V1_reset_list]))/binary>>
                                 || {V1_id, V1_base_id, V1_reset_list}
                                        <- V0_talisman_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10627:16/little,
       D_a_t_a/binary>>};
pack(cli, 10628,
     {V0_id, V0_base_id, V0_target_base_id}) ->
    D_a_t_a = <<V0_id:32/little, V0_base_id:32/little,
                V0_target_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10628:16/little,
       D_a_t_a/binary>>};
pack(srv, 10628, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10628:16/little,
       D_a_t_a/binary>>};
pack(cli, 10629, {V0_id, V0_attr_name, V0_attr_val}) ->
    D_a_t_a = <<V0_id:32/little, V0_attr_name:32/little,
                V0_attr_val:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10629:16/little,
       D_a_t_a/binary>>};
pack(srv, 10629, {V0_flag, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10629:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 10600, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_is_perfect, _B2} = protocol:uint8(_B1),
    {V1_use_hero_paper, _B3} = protocol:uint8(_B2),
    {ok, {V1_id, V1_is_perfect, V1_use_hero_paper}};
unpack(cli, 10600, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_id}};
unpack(srv, 10602, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_luck_list, _B6} = protocol:array(_B1,
                                         fun (_B2) ->
                                                 {V2_luck_id, _B3} =
                                                     protocol:uint32(_B2),
                                                 {V2_num, _B4} =
                                                     protocol:uint8(_B3),
                                                 {{V2_luck_id, V2_num}, _B4}
                                         end),
    {V1_protect_id, _B7} = protocol:uint32(_B6),
    {ok, {V1_id, V1_luck_list, V1_protect_id}};
unpack(cli, 10602, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10603, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10603, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {V1_reset_attr, _B10} = protocol:array(_B3,
                                           fun (_B4) ->
                                                   {V2_type, _B5} =
                                                       protocol:uint16(_B4),
                                                   {V2_name, _B6} =
                                                       protocol:uint32(_B5),
                                                   {V2_flag, _B7} =
                                                       protocol:uint32(_B6),
                                                   {V2_val, _B8} =
                                                       protocol:int32(_B7),
                                                   {{V2_type,
                                                     V2_name,
                                                     V2_flag,
                                                     V2_val},
                                                    _B8}
                                           end),
    {V1_reset_val, _B11} = protocol:uint16(_B10),
    {V1_lucky_val, _B12} = protocol:uint16(_B11),
    {ok,
     {V1_flag,
      V1_msg,
      V1_id,
      V1_reset_attr,
      V1_reset_val,
      V1_lucky_val}};
unpack(srv, 10604, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_hole_id, _B2} = protocol:uint8(_B1),
    {V1_stone_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_id, V1_hole_id, V1_stone_id}};
unpack(cli, 10604, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10605, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_hole_id, _B2} = protocol:uint8(_B1),
    {V1_stone_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_id, V1_hole_id, V1_stone_id}};
unpack(cli, 10605, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10606, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_hole_id, _B2} = protocol:uint8(_B1),
    {ok, {V1_id, V1_hole_id}};
unpack(cli, 10606, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10607, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {V1_num, _B2} = protocol:uint32(_B1),
    {ok, {V1_base_id, V1_num}};
unpack(cli, 10607, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_next_base_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_next_base_id}};
unpack(srv, 10608, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10608, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_id}};
unpack(srv, 10609, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10609, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_backup_attr, _B8} = protocol:array(_B1,
                                           fun (_B2) ->
                                                   {V2_type, _B3} =
                                                       protocol:uint16(_B2),
                                                   {V2_name, _B4} =
                                                       protocol:uint32(_B3),
                                                   {V2_flag, _B5} =
                                                       protocol:uint32(_B4),
                                                   {V2_val, _B6} =
                                                       protocol:int32(_B5),
                                                   {{V2_type,
                                                     V2_name,
                                                     V2_flag,
                                                     V2_val},
                                                    _B6}
                                           end),
    {V1_lucky_val, _B9} = protocol:uint16(_B8),
    {ok, {V1_id, V1_backup_attr, V1_lucky_val}};
unpack(srv, 10610, _B0) ->
    {V1_id1, _B1} = protocol:uint32(_B0),
    {V1_id2, _B2} = protocol:uint32(_B1),
    {ok, {V1_id1, V1_id2}};
unpack(cli, 10610, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_next_base_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_next_base_id}};
unpack(srv, 10611, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_side, _B2} = protocol:uint8(_B1),
    {ok, {V1_id, V1_side}};
unpack(cli, 10611, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_id}};
unpack(srv, 10612, _B0) -> {ok, {}};
unpack(cli, 10612, _B0) ->
    {V1_reset_val, _B1} = protocol:uint16(_B0),
    {ok, {V1_reset_val}};
unpack(srv, 10613, _B0) -> {ok, {}};
unpack(cli, 10613, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_reset_val, _B3} = protocol:uint16(_B2),
    {ok, {V1_flag, V1_msg, V1_reset_val}};
unpack(srv, 10614, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10614, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_id}};
unpack(srv, 10615, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10615, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_reset_attr, _B8} = protocol:array(_B1,
                                          fun (_B2) ->
                                                  {V2_type, _B3} =
                                                      protocol:uint16(_B2),
                                                  {V2_name, _B4} =
                                                      protocol:uint32(_B3),
                                                  {V2_flag, _B5} =
                                                      protocol:uint32(_B4),
                                                  {V2_val, _B6} =
                                                      protocol:int32(_B5),
                                                  {{V2_type,
                                                    V2_name,
                                                    V2_flag,
                                                    V2_val},
                                                   _B6}
                                          end),
    {ok, {V1_id, V1_reset_attr}};
unpack(srv, 10616, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10616, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_id}};
unpack(srv, 10617, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_craft, _B2} = protocol:uint8(_B1),
    {V1_lock, _B3} = protocol:uint8(_B2),
    {ok, {V1_id, V1_craft, V1_lock}};
unpack(cli, 10617, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {V1_lock, _B4} = protocol:uint8(_B3),
    {ok, {V1_flag, V1_msg, V1_id, V1_lock}};
unpack(srv, 10618, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_craft, _B2} = protocol:uint8(_B1),
    {ok, {V1_id, V1_craft}};
unpack(cli, 10618, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_id}};
unpack(srv, 10619, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_looks, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_looks}};
unpack(cli, 10619, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_id}};
unpack(srv, 10620, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10620, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_back_lev, _B2} = protocol:uint8(_B1),
    {V1_now_lev, _B3} = protocol:uint8(_B2),
    {V1_attr_list, _B10} = protocol:array(_B3,
                                          fun (_B4) ->
                                                  {V2_type, _B5} =
                                                      protocol:uint16(_B4),
                                                  {V2_name, _B6} =
                                                      protocol:uint32(_B5),
                                                  {V2_flag, _B7} =
                                                      protocol:uint32(_B6),
                                                  {V2_val, _B8} =
                                                      protocol:int32(_B7),
                                                  {{V2_type,
                                                    V2_name,
                                                    V2_flag,
                                                    V2_val},
                                                   _B8}
                                          end),
    {ok, {V1_id, V1_back_lev, V1_now_lev, V1_attr_list}};
unpack(srv, 10621, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10621, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_id}};
unpack(srv, 10622, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10622, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_id}};
unpack(srv, 10623, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10623, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_id}};
unpack(srv, 10624, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_hole_id, _B2} = protocol:uint8(_B1),
    {V1_num, _B3} = protocol:uint32(_B2),
    {ok, {V1_id, V1_hole_id, V1_num}};
unpack(cli, 10624, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10625, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_hole_id, _B2} = protocol:uint8(_B1),
    {V1_base_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_id, V1_hole_id, V1_base_id}};
unpack(cli, 10625, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10626, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10626, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10627, _B0) -> {ok, {}};
unpack(cli, 10627, _B0) ->
    {V1_talisman_list, _B10} = protocol:array(_B0,
                                              fun (_B1) ->
                                                      {V2_id, _B2} =
                                                          protocol:uint32(_B1),
                                                      {V2_base_id, _B3} =
                                                          protocol:uint32(_B2),
                                                      {V2_reset_list, _B8} =
                                                          protocol:array(_B3,
                                                                         fun
                                                                             (_B4) ->
                                                                                 {V3_reset_base_id,
                                                                                  _B5} =
                                                                                     protocol:uint32(_B4),
                                                                                 {V3_reset_flag,
                                                                                  _B6} =
                                                                                     protocol:uint8(_B5),
                                                                                 {{V3_reset_base_id,
                                                                                   V3_reset_flag},
                                                                                  _B6}
                                                                         end),
                                                      {{V2_id,
                                                        V2_base_id,
                                                        V2_reset_list},
                                                       _B8}
                                              end),
    {ok, {V1_talisman_list}};
unpack(srv, 10628, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_base_id, _B2} = protocol:uint32(_B1),
    {V1_target_base_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_id, V1_base_id, V1_target_base_id}};
unpack(cli, 10628, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10629, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_attr_name, _B2} = protocol:uint32(_B1),
    {V1_attr_val, _B3} = protocol:uint32(_B2),
    {ok, {V1_id, V1_attr_name, V1_attr_val}};
unpack(cli, 10629, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_id}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

