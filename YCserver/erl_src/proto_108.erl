-file("src/proto/proto_108.erl", 1).

-module(proto_108).

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

-file("src/proto/proto_108.erl", 14).

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

-file("src/proto/proto_108.erl", 15).

-file("inc/skill.hrl", 1).

-record(m_skill,
        {ver = 6 :: pos_integer(),
         skills = [] :: [{non_neg_integer(), non_neg_integer()}],
         is_open_skl_prac = 0 :: 0 | 1,
         selected_skl_prac = 0 :: non_neg_integer(),
         skill_prac = [] :: list(),
         skill_couple = [] :: list(),
         skill_sworn = [] :: list(),
         speed = [] :: list(),
         skill_unique = [],
         skill_clsld_done = [],
         unique_coolddown_time = 0,
         skl_unique_point = 100,
         sq_double = 0,
         is_open_sq_double = 0,
         sq_exp_statistics = []}).

-record(role_base_skill,
        {id = 0,
         lev = 0,
         type :: undefined | non_neg_integer(),
         sub_type :: undefined | non_neg_integer(),
         max_lev = 0,
         name = "",
         way = 1,
         study_lev = 1,
         cost = [],
         attr = []}).

-record(skill,
        {id = 0,
         lev = 0,
         type = 0 :: non_neg_integer(),
         sub_type = 0 :: non_neg_integer(),
         speed = 1,
         name = "",
         acc_ratio = 1000,
         acc_low = 0,
         acc_high = 1000,
         attack_type = 0 :: non_neg_integer(),
         elem_type = 0 :: non_neg_integer(),
         target_type = 1 :: non_neg_integer(),
         attack_times = 1 :: non_neg_integer(),
         target_list = [],
         self_cond = [],
         self_loss = [],
         target_cond = [],
         dmg_addt = 0 :: non_neg_integer(),
         dmg_ratio = [1000] :: non_neg_integer(),
         pre_cooldown = 0,
         cooldown = 0 :: non_neg_integer(),
         cost_mp = 0 :: non_neg_integer(),
         cost_anger = 0,
         cost_other = [] :: [{atom(), non_neg_integer()}],
         buff_self = [] :: [tuple()],
         buff_target = [] :: [tuple()],
         script_id = 0 :: non_neg_integer(),
         script_args = [] :: [integer()],
         addt_scripts = [] ::
             [{non_neg_integer(), non_neg_integer(), list()}],
         play_time = 0 :: non_neg_integer()}).

-record(chief_classes,
        {leader_id = 0,
         classes = 0,
         name = "",
         sex = 0,
         lev = 0,
         looks = []}).

-record(sq_exp_statistics,
        {combat_type = 0, times = 0, gain = 0, real_gain = 0}).

-file("src/proto/proto_108.erl", 16).

-file("inc/skill_prac.hrl", 1).

-record(skl_prac_meta_data,
        {id :: undefined | pos_integer(),
         name :: undefined | string(),
         obj :: undefined | pos_integer(),
         day_max_times :: undefined | pos_integer()}).

-record(skill_prac_data,
        {id :: undefined | pos_integer(),
         role_lev :: undefined | non_neg_integer(),
         skill_lev :: undefined | non_neg_integer(),
         top_lev :: undefined | non_neg_integer(),
         exp :: undefined | non_neg_integer(),
         attrs :: undefined | list(),
         lev_break_times :: undefined | non_neg_integer()}).

-record(skl_prac,
        {id = 0 :: pos_integer(),
         obj = 0 :: pos_integer(),
         lev = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         enhance = [] :: list()}).

-record(skl_prac_enhance,
        {source = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer()}).

-record(skill_prac_box,
        {id :: undefined | tuple(), exps = []}).

-file("src/proto/proto_108.erl", 17).

-file("inc/skill_life.hrl", 1).

-record(m_skill_life, {ver = 2, skills = []}).

-record(skill_life, {id = 0, lev = 0, exp = 0}).

-file("src/proto/proto_108.erl", 18).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 10800, {}) ->
    {ok, <<2:32/little, 10800:16/little>>};
pack(srv, 10800, {V0_skill_data, V0_speed}) ->
    D_a_t_a = <<(length(V0_skill_data)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_lev:8/little>>
                                 || {V1_id, V1_lev} <- V0_skill_data]))/binary,
                (length(V0_speed)):16/little,
                (list_to_binary([<<V1_skill_id:32/little>>
                                 || V1_skill_id <- V0_speed]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10800:16/little,
       D_a_t_a/binary>>};
pack(cli, 10801, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10801:16/little,
       D_a_t_a/binary>>};
pack(srv, 10801, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10801:16/little,
       D_a_t_a/binary>>};
pack(cli, 10802, {}) ->
    {ok, <<2:32/little, 10802:16/little>>};
pack(srv, 10802, {V0_id, V0_lev}) ->
    D_a_t_a = <<V0_id:32/little, V0_lev:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10802:16/little,
       D_a_t_a/binary>>};
pack(cli, 10803, {}) ->
    {ok, <<2:32/little, 10803:16/little>>};
pack(srv, 10803, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10803:16/little,
       D_a_t_a/binary>>};
pack(cli, 10804, {}) ->
    {ok, <<2:32/little, 10804:16/little>>};
pack(srv, 10804, {V0_tips_args}) ->
    D_a_t_a = <<(length(V0_tips_args)):16/little,
                (list_to_binary([<<V1_id:32/little>>
                                 || V1_id <- V0_tips_args]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10804:16/little,
       D_a_t_a/binary>>};
pack(cli, 10805, {}) ->
    {ok, <<2:32/little, 10805:16/little>>};
pack(srv, 10805,
     {V0_selected_id, V0_skl_prac, V0_skl_prac_times}) ->
    D_a_t_a = <<V0_selected_id:32/little,
                (length(V0_skl_prac)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_lev:8/little,
                                   V1_exp:32/little,
                                   (length(V1_enhance)):16/little,
                                   (list_to_binary([<<V2_source:8/little,
                                                      V2_lev:8/little>>
                                                    || #skl_prac_enhance{source
                                                                             =
                                                                             V2_source,
                                                                         lev =
                                                                             V2_lev}
                                                           <- V1_enhance]))/binary>>
                                 || #skl_prac{id = V1_id, lev = V1_lev,
                                              exp = V1_exp,
                                              enhance = V1_enhance}
                                        <- V0_skl_prac]))/binary,
                (length(V0_skl_prac_times)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_times:32/little>>
                                 || {V1_id, V1_times}
                                        <- V0_skl_prac_times]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10805:16/little,
       D_a_t_a/binary>>};
pack(cli, 10806, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10806:16/little,
       D_a_t_a/binary>>};
pack(srv, 10806, {V0_flag, V0_id}) ->
    D_a_t_a = <<V0_flag:8/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10806:16/little,
       D_a_t_a/binary>>};
pack(cli, 10807, {V0_id, V0_num}) ->
    D_a_t_a = <<V0_id:32/little, V0_num:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10807:16/little,
       D_a_t_a/binary>>};
pack(srv, 10807,
     {V0_id, V0_lev, V0_exp, V0_prac_times}) ->
    D_a_t_a = <<V0_id:32/little, V0_lev:8/little,
                V0_exp:32/little, V0_prac_times:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10807:16/little,
       D_a_t_a/binary>>};
pack(cli, 10808, {}) ->
    {ok, <<2:32/little, 10808:16/little>>};
pack(srv, 10808, {V0_skills}) ->
    D_a_t_a = <<(length(V0_skills)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_lev:8/little,
                                   V1_exp:32/little>>
                                 || #skill_life{id = V1_id, lev = V1_lev,
                                                exp = V1_exp}
                                        <- V0_skills]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10808:16/little,
       D_a_t_a/binary>>};
pack(cli, 10809, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10809:16/little,
       D_a_t_a/binary>>};
pack(srv, 10809, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10809:16/little,
       D_a_t_a/binary>>};
pack(cli, 10810, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10810:16/little,
       D_a_t_a/binary>>};
pack(srv, 10810, {V0_flag, V0_msg, V0_base_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10810:16/little,
       D_a_t_a/binary>>};
pack(cli, 10811, {}) ->
    {ok, <<2:32/little, 10811:16/little>>};
pack(srv, 10811,
     {V0_op_code,
      #skl_prac{id = V0_id, lev = V0_lev, exp = V0_exp}}) ->
    D_a_t_a = <<V0_op_code:8/little, V0_id:32/little,
                V0_lev:8/little, V0_exp:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10811:16/little,
       D_a_t_a/binary>>};
pack(cli, 10812, {V0_battle_id, V0_id}) ->
    D_a_t_a = <<V0_battle_id:32/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10812:16/little,
       D_a_t_a/binary>>};
pack(srv, 10812, {V0_battle_id, V0_id, V0_exps}) ->
    D_a_t_a = <<V0_battle_id:32/little, V0_id:32/little,
                (length(V0_exps)):16/little,
                (list_to_binary([<<V1_exp:32/little>>
                                 || V1_exp <- V0_exps]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10812:16/little,
       D_a_t_a/binary>>};
pack(cli, 10813, {V0_battle_id, V0_id}) ->
    D_a_t_a = <<V0_battle_id:32/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10813:16/little,
       D_a_t_a/binary>>};
pack(srv, 10813,
     {V0_flag, V0_msg, V0_exp, V0_gain_exp}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_exp:32/little, V0_gain_exp:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10813:16/little,
       D_a_t_a/binary>>};
pack(cli, 10814, {}) ->
    {ok, <<2:32/little, 10814:16/little>>};
pack(srv, 10814, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10814:16/little,
       D_a_t_a/binary>>};
pack(cli, 10815, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10815:16/little,
       D_a_t_a/binary>>};
pack(srv, 10815, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10815:16/little,
       D_a_t_a/binary>>};
pack(cli, 10816, {V0_id, V0_base_id}) ->
    D_a_t_a = <<V0_id:32/little, V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10816:16/little,
       D_a_t_a/binary>>};
pack(srv, 10816, {V0_flag, V0_msg, V0_base_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10816:16/little,
       D_a_t_a/binary>>};
pack(cli, 10817, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10817:16/little,
       D_a_t_a/binary>>};
pack(srv, 10817, {V0_note_times}) ->
    D_a_t_a = <<V0_note_times:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10817:16/little,
       D_a_t_a/binary>>};
pack(cli, 10818, {}) ->
    {ok, <<2:32/little, 10818:16/little>>};
pack(srv, 10818, {V0_skl_prac, V0_skl_prac_times}) ->
    D_a_t_a = <<(length(V0_skl_prac)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_lev:8/little,
                                   V1_exp:32/little,
                                   (length(V1_enhance)):16/little,
                                   (list_to_binary([<<V2_source:8/little,
                                                      V2_lev:8/little>>
                                                    || #skl_prac_enhance{source
                                                                             =
                                                                             V2_source,
                                                                         lev =
                                                                             V2_lev}
                                                           <- V1_enhance]))/binary>>
                                 || #skl_prac{id = V1_id, lev = V1_lev,
                                              exp = V1_exp,
                                              enhance = V1_enhance}
                                        <- V0_skl_prac]))/binary,
                (length(V0_skl_prac_times)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_times:32/little>>
                                 || {V1_id, V1_times}
                                        <- V0_skl_prac_times]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10818:16/little,
       D_a_t_a/binary>>};
pack(cli, 10819, {}) ->
    {ok, <<2:32/little, 10819:16/little>>};
pack(srv, 10819, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10819:16/little,
       D_a_t_a/binary>>};
pack(cli, 10820, {}) ->
    {ok, <<2:32/little, 10820:16/little>>};
pack(srv, 10820, {V0_id, V0_lev}) ->
    D_a_t_a = <<V0_id:32/little, V0_lev:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10820:16/little,
       D_a_t_a/binary>>};
pack(cli, 10821, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10821:16/little,
       D_a_t_a/binary>>};
pack(srv, 10821, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10821:16/little,
       D_a_t_a/binary>>};
pack(cli, 10822, {}) ->
    {ok, <<2:32/little, 10822:16/little>>};
pack(srv, 10822, {V0_skill_data}) ->
    D_a_t_a = <<(length(V0_skill_data)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_lev:8/little>>
                                 || {V1_id, V1_lev}
                                        <- V0_skill_data]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10822:16/little,
       D_a_t_a/binary>>};
pack(cli, 10823, {V0_id, V0_num}) ->
    D_a_t_a = <<V0_id:32/little, V0_num:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10823:16/little,
       D_a_t_a/binary>>};
pack(srv, 10823, {V0_skill_data}) ->
    D_a_t_a = <<(length(V0_skill_data)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_lev:8/little,
                                   V1_exp:32/little>>
                                 || {V1_id, V1_lev, V1_exp}
                                        <- V0_skill_data]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10823:16/little,
       D_a_t_a/binary>>};
pack(cli, 10824, {V0_id, V0_flag}) ->
    D_a_t_a = <<V0_id:32/little, V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10824:16/little,
       D_a_t_a/binary>>};
pack(srv, 10824, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10824:16/little,
       D_a_t_a/binary>>};
pack(cli, 10825, {}) ->
    {ok, <<2:32/little, 10825:16/little>>};
pack(srv, 10825, {V0_flag, V0_skill_unique}) ->
    D_a_t_a = <<V0_flag:8/little,
                (length(V0_skill_unique)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_lev:8/little>>
                                 || {V1_id, V1_lev}
                                        <- V0_skill_unique]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10825:16/little,
       D_a_t_a/binary>>};
pack(cli, 10826, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10826:16/little,
       D_a_t_a/binary>>};
pack(srv, 10826, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10826:16/little,
       D_a_t_a/binary>>};
pack(cli, 10827, {}) ->
    {ok, <<2:32/little, 10827:16/little>>};
pack(srv, 10827, {V0_result, V0_msg, V0_gl_list}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                (length(V0_gl_list)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_val:32/little>>
                                 || {V1_base_id, V1_val}
                                        <- V0_gl_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10827:16/little,
       D_a_t_a/binary>>};
pack(cli, 10828, {}) ->
    {ok, <<2:32/little, 10828:16/little>>};
pack(srv, 10828, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10828:16/little,
       D_a_t_a/binary>>};
pack(cli, 10829, {V0_skill_id}) ->
    D_a_t_a = <<V0_skill_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10829:16/little,
       D_a_t_a/binary>>};
pack(srv, 10829, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10829:16/little,
       D_a_t_a/binary>>};
pack(cli, 10830, {V0_skill_id}) ->
    D_a_t_a = <<V0_skill_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10830:16/little,
       D_a_t_a/binary>>};
pack(srv, 10830, {V0_err_code, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10830:16/little,
       D_a_t_a/binary>>};
pack(cli, 10831, {}) ->
    {ok, <<2:32/little, 10831:16/little>>};
pack(srv, 10831, {V0_chief_classes}) ->
    D_a_t_a = <<(length(V0_chief_classes)):16/little,
                (list_to_binary([<<V1_leader_id:32/little,
                                   V1_classes:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:32/little, V1_sex:8/little,
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
                                 || #chief_classes{leader_id = V1_leader_id,
                                                   classes = V1_classes,
                                                   name = V1_name, lev = V1_lev,
                                                   sex = V1_sex,
                                                   looks = V1_looks}
                                        <- V0_chief_classes]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10831:16/little,
       D_a_t_a/binary>>};
pack(cli, 10832, {}) ->
    {ok, <<2:32/little, 10832:16/little>>};
pack(srv, 10832, {V0_skill_clsld_done, V0_cooldown}) ->
    D_a_t_a = <<(length(V0_skill_clsld_done)):16/little,
                (list_to_binary([<<V1_leader_id:32/little>>
                                 || V1_leader_id
                                        <- V0_skill_clsld_done]))/binary,
                V0_cooldown:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10832:16/little,
       D_a_t_a/binary>>};
pack(cli, 10833, {}) ->
    {ok, <<2:32/little, 10833:16/little>>};
pack(srv, 10833, {V0_sq_point}) ->
    D_a_t_a = <<V0_sq_point:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10833:16/little,
       D_a_t_a/binary>>};
pack(cli, 10834, {}) ->
    {ok, <<2:32/little, 10834:16/little>>};
pack(srv, 10834,
     {V0_sq_double, V0_sq_exp_statistics}) ->
    D_a_t_a = <<V0_sq_double:32/little,
                (length(V0_sq_exp_statistics)):16/little,
                (list_to_binary([<<V1_combat_type:32/little,
                                   V1_times:32/little, V1_real_gain:32/little,
                                   V1_gain:32/little>>
                                 || #sq_exp_statistics{combat_type =
                                                           V1_combat_type,
                                                       times = V1_times,
                                                       real_gain = V1_real_gain,
                                                       gain = V1_gain}
                                        <- V0_sq_exp_statistics]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10834:16/little,
       D_a_t_a/binary>>};
pack(cli, 10835, {}) ->
    {ok, <<2:32/little, 10835:16/little>>};
pack(srv, 10835, {V0_msg}) ->
    D_a_t_a = <<(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10835:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 10800, _B0) -> {ok, {}};
unpack(cli, 10800, _B0) ->
    {V1_skill_data, _B5} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_id, _B2} =
                                                      protocol:uint32(_B1),
                                                  {V2_lev, _B3} =
                                                      protocol:uint8(_B2),
                                                  {{V2_id, V2_lev}, _B3}
                                          end),
    {V1_speed, _B9} = protocol:array(_B5,
                                     fun (_B6) ->
                                             {V2_skill_id, _B7} =
                                                 protocol:uint32(_B6),
                                             {{V2_skill_id}, _B7}
                                     end),
    {ok, {V1_skill_data, V1_speed}};
unpack(srv, 10801, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10801, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10802, _B0) -> {ok, {}};
unpack(cli, 10802, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_lev, _B2} = protocol:uint8(_B1),
    {ok, {V1_id, V1_lev}};
unpack(srv, 10803, _B0) -> {ok, {}};
unpack(cli, 10803, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10804, _B0) -> {ok, {}};
unpack(cli, 10804, _B0) ->
    {V1_tips_args, _B4} = protocol:array(_B0,
                                         fun (_B1) ->
                                                 {V2_id, _B2} =
                                                     protocol:uint32(_B1),
                                                 {{V2_id}, _B2}
                                         end),
    {ok, {V1_tips_args}};
unpack(srv, 10805, _B0) -> {ok, {}};
unpack(cli, 10805, _B0) ->
    {V1_selected_id, _B1} = protocol:uint32(_B0),
    {V1_skl_prac, _B12} = protocol:array(_B1,
                                         fun (_B2) ->
                                                 {V2_id, _B3} =
                                                     protocol:uint32(_B2),
                                                 {V2_lev, _B4} =
                                                     protocol:uint8(_B3),
                                                 {V2_exp, _B5} =
                                                     protocol:uint32(_B4),
                                                 {V2_enhance, _B10} =
                                                     protocol:array(_B5,
                                                                    fun (_B6) ->
                                                                            {V3_source,
                                                                             _B7} =
                                                                                protocol:uint8(_B6),
                                                                            {V3_lev,
                                                                             _B8} =
                                                                                protocol:uint8(_B7),
                                                                            {{V3_source,
                                                                              V3_lev},
                                                                             _B8}
                                                                    end),
                                                 {{V2_id,
                                                   V2_lev,
                                                   V2_exp,
                                                   V2_enhance},
                                                  _B10}
                                         end),
    {V1_skl_prac_times, _B17} = protocol:array(_B12,
                                               fun (_B13) ->
                                                       {V2_id, _B14} =
                                                           protocol:uint32(_B13),
                                                       {V2_times, _B15} =
                                                           protocol:uint32(_B14),
                                                       {{V2_id, V2_times}, _B15}
                                               end),
    {ok, {V1_selected_id, V1_skl_prac, V1_skl_prac_times}};
unpack(srv, 10806, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10806, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_flag, V1_id}};
unpack(srv, 10807, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_num, _B2} = protocol:uint8(_B1),
    {ok, {V1_id, V1_num}};
unpack(cli, 10807, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_lev, _B2} = protocol:uint8(_B1),
    {V1_exp, _B3} = protocol:uint32(_B2),
    {V1_prac_times, _B4} = protocol:uint32(_B3),
    {ok, {V1_id, V1_lev, V1_exp, V1_prac_times}};
unpack(srv, 10808, _B0) -> {ok, {}};
unpack(cli, 10808, _B0) ->
    {V1_skills, _B6} = protocol:array(_B0,
                                      fun (_B1) ->
                                              {V2_id, _B2} =
                                                  protocol:uint32(_B1),
                                              {V2_lev, _B3} =
                                                  protocol:uint8(_B2),
                                              {V2_exp, _B4} =
                                                  protocol:uint32(_B3),
                                              {{V2_id, V2_lev, V2_exp}, _B4}
                                      end),
    {ok, {V1_skills}};
unpack(srv, 10809, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10809, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10810, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10810, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_base_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_base_id}};
unpack(srv, 10811, _B0) -> {ok, {}};
unpack(cli, 10811, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_lev, _B3} = protocol:uint8(_B2),
    {V1_exp, _B4} = protocol:uint32(_B3),
    {ok, {V1_op_code, V1_id, V1_lev, V1_exp}};
unpack(srv, 10812, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_battle_id, V1_id}};
unpack(cli, 10812, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_exps, _B6} = protocol:array(_B2,
                                    fun (_B3) ->
                                            {V2_exp, _B4} =
                                                protocol:uint32(_B3),
                                            {{V2_exp}, _B4}
                                    end),
    {ok, {V1_battle_id, V1_id, V1_exps}};
unpack(srv, 10813, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_battle_id, V1_id}};
unpack(cli, 10813, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_exp, _B3} = protocol:uint32(_B2),
    {V1_gain_exp, _B4} = protocol:uint32(_B3),
    {ok, {V1_flag, V1_msg, V1_exp, V1_gain_exp}};
unpack(srv, 10814, _B0) -> {ok, {}};
unpack(cli, 10814, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10815, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10815, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10816, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_base_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_base_id}};
unpack(cli, 10816, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_base_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_base_id}};
unpack(srv, 10817, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10817, _B0) ->
    {V1_note_times, _B1} = protocol:uint32(_B0),
    {ok, {V1_note_times}};
unpack(srv, 10818, _B0) -> {ok, {}};
unpack(cli, 10818, _B0) ->
    {V1_skl_prac, _B11} = protocol:array(_B0,
                                         fun (_B1) ->
                                                 {V2_id, _B2} =
                                                     protocol:uint32(_B1),
                                                 {V2_lev, _B3} =
                                                     protocol:uint8(_B2),
                                                 {V2_exp, _B4} =
                                                     protocol:uint32(_B3),
                                                 {V2_enhance, _B9} =
                                                     protocol:array(_B4,
                                                                    fun (_B5) ->
                                                                            {V3_source,
                                                                             _B6} =
                                                                                protocol:uint8(_B5),
                                                                            {V3_lev,
                                                                             _B7} =
                                                                                protocol:uint8(_B6),
                                                                            {{V3_source,
                                                                              V3_lev},
                                                                             _B7}
                                                                    end),
                                                 {{V2_id,
                                                   V2_lev,
                                                   V2_exp,
                                                   V2_enhance},
                                                  _B9}
                                         end),
    {V1_skl_prac_times, _B16} = protocol:array(_B11,
                                               fun (_B12) ->
                                                       {V2_id, _B13} =
                                                           protocol:uint32(_B12),
                                                       {V2_times, _B14} =
                                                           protocol:uint32(_B13),
                                                       {{V2_id, V2_times}, _B14}
                                               end),
    {ok, {V1_skl_prac, V1_skl_prac_times}};
unpack(srv, 10819, _B0) -> {ok, {}};
unpack(cli, 10819, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(srv, 10820, _B0) -> {ok, {}};
unpack(cli, 10820, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_lev, _B2} = protocol:uint8(_B1),
    {ok, {V1_id, V1_lev}};
unpack(srv, 10821, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10821, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10822, _B0) -> {ok, {}};
unpack(cli, 10822, _B0) ->
    {V1_skill_data, _B5} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_id, _B2} =
                                                      protocol:uint32(_B1),
                                                  {V2_lev, _B3} =
                                                      protocol:uint8(_B2),
                                                  {{V2_id, V2_lev}, _B3}
                                          end),
    {ok, {V1_skill_data}};
unpack(srv, 10823, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_num, _B2} = protocol:uint8(_B1),
    {ok, {V1_id, V1_num}};
unpack(cli, 10823, _B0) ->
    {V1_skill_data, _B6} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_id, _B2} =
                                                      protocol:uint32(_B1),
                                                  {V2_lev, _B3} =
                                                      protocol:uint8(_B2),
                                                  {V2_exp, _B4} =
                                                      protocol:uint32(_B3),
                                                  {{V2_id, V2_lev, V2_exp}, _B4}
                                          end),
    {ok, {V1_skill_data}};
unpack(srv, 10824, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_flag, _B2} = protocol:uint8(_B1),
    {ok, {V1_id, V1_flag}};
unpack(cli, 10824, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10825, _B0) -> {ok, {}};
unpack(cli, 10825, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_skill_unique, _B6} = protocol:array(_B1,
                                            fun (_B2) ->
                                                    {V2_id, _B3} =
                                                        protocol:uint32(_B2),
                                                    {V2_lev, _B4} =
                                                        protocol:uint8(_B3),
                                                    {{V2_id, V2_lev}, _B4}
                                            end),
    {ok, {V1_flag, V1_skill_unique}};
unpack(srv, 10826, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10826, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 10827, _B0) -> {ok, {}};
unpack(cli, 10827, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_gl_list, _B7} = protocol:array(_B2,
                                       fun (_B3) ->
                                               {V2_base_id, _B4} =
                                                   protocol:uint32(_B3),
                                               {V2_val, _B5} =
                                                   protocol:uint32(_B4),
                                               {{V2_base_id, V2_val}, _B5}
                                       end),
    {ok, {V1_result, V1_msg, V1_gl_list}};
unpack(srv, 10828, _B0) -> {ok, {}};
unpack(cli, 10828, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 10829, _B0) ->
    {V1_skill_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_skill_id}};
unpack(cli, 10829, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 10830, _B0) ->
    {V1_skill_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_skill_id}};
unpack(cli, 10830, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_err_code, V1_msg}};
unpack(srv, 10831, _B0) -> {ok, {}};
unpack(cli, 10831, _B0) ->
    {V1_chief_classes, _B15} = protocol:array(_B0,
                                              fun (_B1) ->
                                                      {V2_leader_id, _B2} =
                                                          protocol:uint32(_B1),
                                                      {V2_classes, _B3} =
                                                          protocol:uint32(_B2),
                                                      {V2_name, _B4} =
                                                          protocol:string(_B3),
                                                      {V2_lev, _B5} =
                                                          protocol:uint32(_B4),
                                                      {V2_sex, _B6} =
                                                          protocol:uint8(_B5),
                                                      {V2_looks, _B13} =
                                                          protocol:array(_B6,
                                                                         fun
                                                                             (_B7) ->
                                                                                 {V3_looks_type,
                                                                                  _B8} =
                                                                                     protocol:uint32(_B7),
                                                                                 {V3_looks_mode,
                                                                                  _B9} =
                                                                                     protocol:uint32(_B8),
                                                                                 {V3_looks_val,
                                                                                  _B10} =
                                                                                     protocol:uint32(_B9),
                                                                                 {V3_looks_str,
                                                                                  _B11} =
                                                                                     protocol:string(_B10),
                                                                                 {{V3_looks_type,
                                                                                   V3_looks_mode,
                                                                                   V3_looks_val,
                                                                                   V3_looks_str},
                                                                                  _B11}
                                                                         end),
                                                      {{V2_leader_id,
                                                        V2_classes,
                                                        V2_name,
                                                        V2_lev,
                                                        V2_sex,
                                                        V2_looks},
                                                       _B13}
                                              end),
    {ok, {V1_chief_classes}};
unpack(srv, 10832, _B0) -> {ok, {}};
unpack(cli, 10832, _B0) ->
    {V1_skill_clsld_done, _B4} = protocol:array(_B0,
                                                fun (_B1) ->
                                                        {V2_leader_id, _B2} =
                                                            protocol:uint32(_B1),
                                                        {{V2_leader_id}, _B2}
                                                end),
    {V1_cooldown, _B5} = protocol:uint32(_B4),
    {ok, {V1_skill_clsld_done, V1_cooldown}};
unpack(srv, 10833, _B0) -> {ok, {}};
unpack(cli, 10833, _B0) ->
    {V1_sq_point, _B1} = protocol:uint32(_B0),
    {ok, {V1_sq_point}};
unpack(srv, 10834, _B0) -> {ok, {}};
unpack(cli, 10834, _B0) ->
    {V1_sq_double, _B1} = protocol:uint32(_B0),
    {V1_sq_exp_statistics, _B8} = protocol:array(_B1,
                                                 fun (_B2) ->
                                                         {V2_combat_type, _B3} =
                                                             protocol:uint32(_B2),
                                                         {V2_times, _B4} =
                                                             protocol:uint32(_B3),
                                                         {V2_real_gain, _B5} =
                                                             protocol:uint32(_B4),
                                                         {V2_gain, _B6} =
                                                             protocol:uint32(_B5),
                                                         {{V2_combat_type,
                                                           V2_times,
                                                           V2_real_gain,
                                                           V2_gain},
                                                          _B6}
                                                 end),
    {ok, {V1_sq_double, V1_sq_exp_statistics}};
unpack(srv, 10835, _B0) -> {ok, {}};
unpack(cli, 10835, _B0) ->
    {V1_msg, _B1} = protocol:string(_B0),
    {ok, {V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

