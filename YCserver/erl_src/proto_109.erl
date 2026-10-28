-file("src/proto/proto_109.erl", 1).

-module(proto_109).

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

-file("src/proto/proto_109.erl", 14).

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

-file("src/proto/proto_109.erl", 15).

-file("inc/guard.hrl", 1).

-record(m_guard,
        {ver = 1 :: pos_integer(),
         free_war_ids = [] :: [pos_integer()],
         tactics_fields = [] :: list(),
         tactics_attr = [] :: list(),
         guards = [] :: list()}).

-record(guard_eqm,
        {ver = 5,
         base_id :: undefined | non_neg_integer(),
         type :: undefined | non_neg_integer(),
         lev,
         eqm_attrs = [] :: list(),
         reset_base_id = 0,
         reset_attrs = [] :: list(),
         gem = [] :: list(),
         is_init = 1,
         timeout = 0,
         back_effect_timeout = 0,
         back_effect_attr = []}).

-record(guard_astroid,
        {ver = 2 :: non_neg_integer(),
         aroused = [] :: non_neg_integer(),
         skills = [] :: list(),
         attrs = [] :: list(),
         growth = 0 :: non_neg_integer(),
         active = 0 :: non_neg_integer()}).

-record(guard_astroid_star,
        {ver = 0,
         id = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         attrs = [] :: list()}).

-record(guard,
        {ver = 2,
         base_id = 0 :: non_neg_integer(),
         war_id = 0 :: non_neg_integer(),
         name = "" :: string(),
         alias = "" :: string(),
         classes = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         tac_pos = 0 :: non_neg_integer(),
         skills = [] :: list(),
         eqm = [] :: list(),
         attr :: undefined | tuple(),
         score = 0 :: non_neg_integer(),
         astroid = #guard_astroid{} :: #guard_astroid{}}).

-record(guard_data,
        {base_id = 0 :: non_neg_integer(),
         name = "" :: binary(),
         alias = "" :: binary(),
         classes = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         loss = [] :: tuple(),
         recruit_lev = 1 :: non_neg_integer(),
         desc = "" :: list(),
         normal_atk_id = 0 :: integer(),
         ai_id = 0 :: integer(),
         base_score = 0,
         growth = 0 :: non_neg_integer()}).

-record(guard_eqm_data,
        {base_id = 0 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         loss_coin = 0 :: [tuple()],
         reset_coin = 0 :: [tuple()],
         gem_list = [] :: list()}).

-record(guard_lev_data,
        {base_id :: undefined | non_neg_integer(),
         lev :: undefined | non_neg_integer(),
         lev_up_exp :: undefined | non_neg_integer(),
         attrs = [] :: non_neg_integer()}).

-record(guard_eqm_gem,
        {id = 0, base_id = 0, type = 0, lev = 0}).

-record(guard_eqm_gem_data,
        {base_id = 0,
         next_base_id = 0,
         name = "",
         lev = 0,
         type = 0,
         need_lev = 0,
         loss_coin = [],
         attrs = []}).

-file("src/proto/proto_109.erl", 16).

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

-file("src/proto/proto_109.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 10900, {V0_base_id}) ->
    D_a_t_a = <<V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10900:16/little,
       D_a_t_a/binary>>};
pack(srv, 10900, {V0_flag, V0_msg, V0_recruit_guard}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                (length(V0_recruit_guard)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_war_id:8/little, V1_status:8/little,
                                   V1_score:32/little, V1_quality:8/little,
                                   V1_hp_max:32/little, V1_mp_max:32/little,
                                   V1_atk_speed:16/little, V1_phy_dmg:32/little,
                                   V1_magic_dmg:32/little, V1_phy_def:32/little,
                                   V1_magic_def:32/little,
                                   V1_heal_val:16/little,
                                   (length(V1_eqm)):16/little,
                                   (list_to_binary([<<V2_base_id:32/little,
                                                      (length(V2_eqm_attrs)):16/little,
                                                      (list_to_binary([<<V3_type:16/little,
                                                                         V3_name:32/little,
                                                                         V3_val:32/signed-little>>
                                                                       || #attr_base{type
                                                                                         =
                                                                                         V3_type,
                                                                                     name
                                                                                         =
                                                                                         V3_name,
                                                                                     val
                                                                                         =
                                                                                         V3_val}
                                                                              <- V2_eqm_attrs]))/binary,
                                                      V2_is_init:8/little,
                                                      V2_timeout:32/little>>
                                                    || #guard_eqm{base_id =
                                                                      V2_base_id,
                                                                  eqm_attrs =
                                                                      V2_eqm_attrs,
                                                                  is_init =
                                                                      V2_is_init,
                                                                  timeout =
                                                                      V2_timeout}
                                                           <- V1_eqm]))/binary,
                                   (length(V1_aroused)):16/little,
                                   (list_to_binary([<<V2_id:32/little,
                                                      V2_lev:16/little,
                                                      V2_exp:32/little,
                                                      (length(V2_attrs)):16/little,
                                                      (list_to_binary([<<V3_name:32/little,
                                                                         V3_val:32/signed-little>>
                                                                       || {V3_name,
                                                                           V3_val}
                                                                              <- V2_attrs]))/binary>>
                                                    || #guard_astroid_star{id =
                                                                               V2_id,
                                                                           lev =
                                                                               V2_lev,
                                                                           exp =
                                                                               V2_exp,
                                                                           attrs
                                                                               =
                                                                               V2_attrs}
                                                           <- V1_aroused]))/binary,
                                   (length(V1_attrs)):16/little,
                                   (list_to_binary([<<V2_name:32/little,
                                                      V2_val:32/signed-little>>
                                                    || {V2_name, V2_val}
                                                           <- V1_attrs]))/binary,
                                   (length(V1_skills)):16/little,
                                   (list_to_binary([<<V2_skill_id:32/little,
                                                      V2_skill_lev:8/little>>
                                                    || {V2_skill_id,
                                                        V2_skill_lev}
                                                           <- V1_skills]))/binary,
                                   V1_growth:32/little, V1_active:8/little>>
                                 || #guard{base_id = V1_base_id,
                                           war_id = V1_war_id,
                                           status = V1_status, score = V1_score,
                                           quality = V1_quality,
                                           attr =
                                               #attr{hp_max = V1_hp_max,
                                                     mp_max = V1_mp_max,
                                                     atk_speed = V1_atk_speed,
                                                     phy_dmg = V1_phy_dmg,
                                                     magic_dmg = V1_magic_dmg,
                                                     phy_def = V1_phy_def,
                                                     magic_def = V1_magic_def,
                                                     heal_val = V1_heal_val},
                                           eqm = V1_eqm,
                                           astroid =
                                               #guard_astroid{aroused =
                                                                  V1_aroused,
                                                              attrs = V1_attrs,
                                                              skills =
                                                                  V1_skills,
                                                              growth =
                                                                  V1_growth,
                                                              active =
                                                                  V1_active}}
                                        <- V0_recruit_guard]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10900:16/little,
       D_a_t_a/binary>>};
pack(cli, 10901, {}) ->
    {ok, <<2:32/little, 10901:16/little>>};
pack(srv, 10901, {V0_guards}) ->
    D_a_t_a = <<(length(V0_guards)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_status:8/little, V1_war_id:8/little,
                                   V1_tac_pos:8/little, V1_score:32/little,
                                   V1_quality:8/little, V1_hp_max:32/little,
                                   V1_mp_max:32/little, V1_atk_speed:16/little,
                                   V1_phy_dmg:32/little, V1_magic_dmg:32/little,
                                   V1_phy_def:32/little, V1_magic_def:32/little,
                                   V1_heal_val:16/little,
                                   (length(V1_eqm)):16/little,
                                   (list_to_binary([<<V2_base_id:32/little,
                                                      (length(V2_eqm_attrs)):16/little,
                                                      (list_to_binary([<<V3_type:16/little,
                                                                         V3_name:32/little,
                                                                         V3_val:32/signed-little>>
                                                                       || #attr_base{type
                                                                                         =
                                                                                         V3_type,
                                                                                     name
                                                                                         =
                                                                                         V3_name,
                                                                                     val
                                                                                         =
                                                                                         V3_val}
                                                                              <- V2_eqm_attrs]))/binary,
                                                      V2_reset_base_id:32/little,
                                                      (length(V2_reset_attrs)):16/little,
                                                      (list_to_binary([<<V3_type:16/little,
                                                                         V3_name:32/little,
                                                                         V3_val:32/signed-little>>
                                                                       || #attr_base{type
                                                                                         =
                                                                                         V3_type,
                                                                                     name
                                                                                         =
                                                                                         V3_name,
                                                                                     val
                                                                                         =
                                                                                         V3_val}
                                                                              <- V2_reset_attrs]))/binary,
                                                      (length(V2_gem)):16/little,
                                                      (list_to_binary([<<V3_id:8/little,
                                                                         V3_base_id:32/little,
                                                                         V3_type:8/little>>
                                                                       || #guard_eqm_gem{id
                                                                                             =
                                                                                             V3_id,
                                                                                         base_id
                                                                                             =
                                                                                             V3_base_id,
                                                                                         type
                                                                                             =
                                                                                             V3_type}
                                                                              <- V2_gem]))/binary,
                                                      V2_is_init:8/little,
                                                      V2_timeout:32/little,
                                                      V2_back_effect_timeout:32/little,
                                                      (length(V2_back_effect_attr)):16/little,
                                                      (list_to_binary([<<V3_type:16/little,
                                                                         V3_name:32/little,
                                                                         V3_val:32/signed-little>>
                                                                       || #attr_base{type
                                                                                         =
                                                                                         V3_type,
                                                                                     name
                                                                                         =
                                                                                         V3_name,
                                                                                     val
                                                                                         =
                                                                                         V3_val}
                                                                              <- V2_back_effect_attr]))/binary>>
                                                    || #guard_eqm{base_id =
                                                                      V2_base_id,
                                                                  eqm_attrs =
                                                                      V2_eqm_attrs,
                                                                  reset_base_id
                                                                      =
                                                                      V2_reset_base_id,
                                                                  reset_attrs =
                                                                      V2_reset_attrs,
                                                                  gem = V2_gem,
                                                                  is_init =
                                                                      V2_is_init,
                                                                  timeout =
                                                                      V2_timeout,
                                                                  back_effect_timeout
                                                                      =
                                                                      V2_back_effect_timeout,
                                                                  back_effect_attr
                                                                      =
                                                                      V2_back_effect_attr}
                                                           <- V1_eqm]))/binary,
                                   (length(V1_aroused)):16/little,
                                   (list_to_binary([<<V2_id:32/little,
                                                      V2_lev:16/little,
                                                      V2_exp:32/little,
                                                      (length(V2_attrs)):16/little,
                                                      (list_to_binary([<<V3_name:32/little,
                                                                         V3_val:32/signed-little>>
                                                                       || {V3_name,
                                                                           V3_val}
                                                                              <- V2_attrs]))/binary>>
                                                    || #guard_astroid_star{id =
                                                                               V2_id,
                                                                           lev =
                                                                               V2_lev,
                                                                           exp =
                                                                               V2_exp,
                                                                           attrs
                                                                               =
                                                                               V2_attrs}
                                                           <- V1_aroused]))/binary,
                                   (length(V1_attrs)):16/little,
                                   (list_to_binary([<<V2_name:32/little,
                                                      V2_val:32/signed-little>>
                                                    || {V2_name, V2_val}
                                                           <- V1_attrs]))/binary,
                                   (length(V1_skills)):16/little,
                                   (list_to_binary([<<V2_skill_id:32/little,
                                                      V2_skill_lev:8/little>>
                                                    || {V2_skill_id,
                                                        V2_skill_lev}
                                                           <- V1_skills]))/binary,
                                   V1_growth:32/little, V1_active:8/little>>
                                 || #guard{base_id = V1_base_id,
                                           status = V1_status,
                                           war_id = V1_war_id,
                                           tac_pos = V1_tac_pos,
                                           score = V1_score,
                                           quality = V1_quality,
                                           attr =
                                               #attr{hp_max = V1_hp_max,
                                                     mp_max = V1_mp_max,
                                                     atk_speed = V1_atk_speed,
                                                     phy_dmg = V1_phy_dmg,
                                                     magic_dmg = V1_magic_dmg,
                                                     phy_def = V1_phy_def,
                                                     magic_def = V1_magic_def,
                                                     heal_val = V1_heal_val},
                                           eqm = V1_eqm,
                                           astroid =
                                               #guard_astroid{aroused =
                                                                  V1_aroused,
                                                              attrs = V1_attrs,
                                                              skills =
                                                                  V1_skills,
                                                              growth =
                                                                  V1_growth,
                                                              active =
                                                                  V1_active}}
                                        <- V0_guards]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10901:16/little,
       D_a_t_a/binary>>};
pack(cli, 10902, {V0_id, V0_type}) ->
    D_a_t_a = <<V0_id:32/little, V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10902:16/little,
       D_a_t_a/binary>>};
pack(srv, 10902,
     {V0_id,
      #guard_eqm{base_id = V0_base_id,
                 eqm_attrs = V0_eqm_attrs,
                 reset_base_id = V0_reset_base_id,
                 reset_attrs = V0_reset_attrs, is_init = V0_is_init,
                 timeout = V0_timeout,
                 back_effect_timeout = V0_back_effect_timeout,
                 back_effect_attr = V0_back_effect_attr}}) ->
    D_a_t_a = <<V0_id:32/little, V0_base_id:32/little,
                (length(V0_eqm_attrs)):16/little,
                (list_to_binary([<<V1_type:16/little, V1_name:32/little,
                                   V1_val:32/signed-little>>
                                 || #attr_base{type = V1_type, name = V1_name,
                                               val = V1_val}
                                        <- V0_eqm_attrs]))/binary,
                V0_reset_base_id:32/little,
                (length(V0_reset_attrs)):16/little,
                (list_to_binary([<<V1_type:16/little, V1_name:32/little,
                                   V1_val:32/signed-little>>
                                 || #attr_base{type = V1_type, name = V1_name,
                                               val = V1_val}
                                        <- V0_reset_attrs]))/binary,
                V0_is_init:8/little, V0_timeout:32/little,
                V0_back_effect_timeout:32/little,
                (length(V0_back_effect_attr)):16/little,
                (list_to_binary([<<V1_type:16/little, V1_name:32/little,
                                   V1_val:32/signed-little>>
                                 || #attr_base{type = V1_type, name = V1_name,
                                               val = V1_val}
                                        <- V0_back_effect_attr]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10902:16/little,
       D_a_t_a/binary>>};
pack(cli, 10903, {}) ->
    {ok, <<2:32/little, 10903:16/little>>};
pack(srv, 10903,
     {#guard{base_id = V0_base_id, status = V0_status,
             war_id = V0_war_id, tac_pos = V0_tac_pos,
             score = V0_score, quality = V0_quality,
             attr =
                 #attr{hp_max = V0_hp_max, mp_max = V0_mp_max,
                       atk_speed = V0_atk_speed, phy_dmg = V0_phy_dmg,
                       magic_dmg = V0_magic_dmg, phy_def = V0_phy_def,
                       magic_def = V0_magic_def, heal_val = V0_heal_val},
             eqm = V0_eqm,
             astroid =
                 #guard_astroid{aroused = V0_aroused, attrs = V0_attrs,
                                skills = V0_skills, growth = V0_growth,
                                active = V0_active}}}) ->
    D_a_t_a = <<V0_base_id:32/little, V0_status:8/little,
                V0_war_id:8/little, V0_tac_pos:8/little,
                V0_score:32/little, V0_quality:8/little,
                V0_hp_max:32/little, V0_mp_max:32/little,
                V0_atk_speed:16/little, V0_phy_dmg:32/little,
                V0_magic_dmg:32/little, V0_phy_def:32/little,
                V0_magic_def:32/little, V0_heal_val:16/little,
                (length(V0_eqm)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   (length(V1_eqm_attrs)):16/little,
                                   (list_to_binary([<<V2_type:16/little,
                                                      V2_name:32/little,
                                                      V2_val:32/signed-little>>
                                                    || #attr_base{type =
                                                                      V2_type,
                                                                  name =
                                                                      V2_name,
                                                                  val = V2_val}
                                                           <- V1_eqm_attrs]))/binary,
                                   V1_reset_base_id:32/little,
                                   (length(V1_reset_attrs)):16/little,
                                   (list_to_binary([<<V2_type:16/little,
                                                      V2_name:32/little,
                                                      V2_val:32/signed-little>>
                                                    || #attr_base{type =
                                                                      V2_type,
                                                                  name =
                                                                      V2_name,
                                                                  val = V2_val}
                                                           <- V1_reset_attrs]))/binary,
                                   (length(V1_gem)):16/little,
                                   (list_to_binary([<<V2_id:8/little,
                                                      V2_base_id:32/little,
                                                      V2_type:8/little>>
                                                    || #guard_eqm_gem{id =
                                                                          V2_id,
                                                                      base_id =
                                                                          V2_base_id,
                                                                      type =
                                                                          V2_type}
                                                           <- V1_gem]))/binary,
                                   V1_is_init:8/little, V1_timeout:32/little,
                                   V1_back_effect_timeout:32/little,
                                   (length(V1_back_effect_attr)):16/little,
                                   (list_to_binary([<<V2_type:16/little,
                                                      V2_name:32/little,
                                                      V2_val:32/signed-little>>
                                                    || #attr_base{type =
                                                                      V2_type,
                                                                  name =
                                                                      V2_name,
                                                                  val = V2_val}
                                                           <- V1_back_effect_attr]))/binary>>
                                 || #guard_eqm{base_id = V1_base_id,
                                               eqm_attrs = V1_eqm_attrs,
                                               reset_base_id = V1_reset_base_id,
                                               reset_attrs = V1_reset_attrs,
                                               gem = V1_gem,
                                               is_init = V1_is_init,
                                               timeout = V1_timeout,
                                               back_effect_timeout =
                                                   V1_back_effect_timeout,
                                               back_effect_attr =
                                                   V1_back_effect_attr}
                                        <- V0_eqm]))/binary,
                (length(V0_aroused)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_lev:16/little,
                                   V1_exp:32/little,
                                   (length(V1_attrs)):16/little,
                                   (list_to_binary([<<V2_name:32/little,
                                                      V2_val:32/signed-little>>
                                                    || {V2_name, V2_val}
                                                           <- V1_attrs]))/binary>>
                                 || #guard_astroid_star{id = V1_id,
                                                        lev = V1_lev,
                                                        exp = V1_exp,
                                                        attrs = V1_attrs}
                                        <- V0_aroused]))/binary,
                (length(V0_attrs)):16/little,
                (list_to_binary([<<V1_name:32/little,
                                   V1_val:32/signed-little>>
                                 || {V1_name, V1_val} <- V0_attrs]))/binary,
                (length(V0_skills)):16/little,
                (list_to_binary([<<V1_skill_id:32/little,
                                   V1_skill_lev:8/little>>
                                 || {V1_skill_id, V1_skill_lev}
                                        <- V0_skills]))/binary,
                V0_growth:32/little, V0_active:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10903:16/little,
       D_a_t_a/binary>>};
pack(cli, 10905, {V0_base_id, V0_pos}) ->
    D_a_t_a = <<V0_base_id:32/little, V0_pos:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10905:16/little,
       D_a_t_a/binary>>};
pack(srv, 10905,
     {V0_op_code, V0_msg, V0_change_fields}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary,
                (length(V0_change_fields)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_pos:8/little>>
                                 || {V1_base_id, V1_pos}
                                        <- V0_change_fields]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10905:16/little,
       D_a_t_a/binary>>};
pack(cli, 10906, {}) ->
    {ok, <<2:32/little, 10906:16/little>>};
pack(srv, 10906, {V0_tac_attr}) ->
    D_a_t_a = <<(length(V0_tac_attr)):16/little,
                (list_to_binary([<<V1_name:32/little,
                                   V1_val:32/signed-little>>
                                 || {V1_name, V1_val}
                                        <- V0_tac_attr]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10906:16/little,
       D_a_t_a/binary>>};
pack(cli, 10907, {V0_base_id, V0_type}) ->
    D_a_t_a = <<V0_base_id:32/little, V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10907:16/little,
       D_a_t_a/binary>>};
pack(srv, 10907, {V0_op_code, V0_msg}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10907:16/little,
       D_a_t_a/binary>>};
pack(cli, 10909, {V0_base_id}) ->
    D_a_t_a = <<V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10909:16/little,
       D_a_t_a/binary>>};
pack(srv, 10909, {V0_op_code, V0_msg, V0_base_id}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10909:16/little,
       D_a_t_a/binary>>};
pack(cli, 10910,
     {V0_base_id, V0_type, V0_hole_id, V0_gem_base_id}) ->
    D_a_t_a = <<V0_base_id:32/little, V0_type:8/little,
                V0_hole_id:32/little, V0_gem_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10910:16/little,
       D_a_t_a/binary>>};
pack(srv, 10910, {V0_op_code, V0_msg}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10910:16/little,
       D_a_t_a/binary>>};
pack(cli, 10911, {V0_base_id, V0_type, V0_hole_id}) ->
    D_a_t_a = <<V0_base_id:32/little, V0_type:8/little,
                V0_hole_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10911:16/little,
       D_a_t_a/binary>>};
pack(srv, 10911, {V0_op_code, V0_msg}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10911:16/little,
       D_a_t_a/binary>>};
pack(cli, 10912, {V0_base_id, V0_type, V0_hole_id}) ->
    D_a_t_a = <<V0_base_id:32/little, V0_type:8/little,
                V0_hole_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10912:16/little,
       D_a_t_a/binary>>};
pack(srv, 10912, {V0_op_code, V0_msg}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10912:16/little,
       D_a_t_a/binary>>};
pack(cli, 10913, {V0_base_id}) ->
    D_a_t_a = <<V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10913:16/little,
       D_a_t_a/binary>>};
pack(srv, 10913, {V0_op_code, V0_msg}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10913:16/little,
       D_a_t_a/binary>>};
pack(cli, 10914, {V0_base_id, V0_star_id}) ->
    D_a_t_a = <<V0_base_id:32/little,
                V0_star_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10914:16/little,
       D_a_t_a/binary>>};
pack(srv, 10914,
     {V0_op_code, V0_msg, V0_base_id, V0_star_id}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_base_id:32/little, V0_star_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10914:16/little,
       D_a_t_a/binary>>};
pack(cli, 10915, {V0_base_id}) ->
    D_a_t_a = <<V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10915:16/little,
       D_a_t_a/binary>>};
pack(srv, 10915,
     {V0_op_code, V0_msg, V0_base_id, V0_quality}) ->
    D_a_t_a = <<V0_op_code:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_base_id:32/little, V0_quality:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10915:16/little,
       D_a_t_a/binary>>};
pack(cli, 10916, {V0_base_id}) ->
    D_a_t_a = <<V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10916:16/little,
       D_a_t_a/binary>>};
pack(srv, 10916,
     {V0_base_id,
      #guard_astroid{aroused = V0_aroused, attrs = V0_attrs,
                     skills = V0_skills, growth = V0_growth,
                     active = V0_active}}) ->
    D_a_t_a = <<V0_base_id:32/little,
                (length(V0_aroused)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_lev:16/little,
                                   V1_exp:32/little,
                                   (length(V1_attrs)):16/little,
                                   (list_to_binary([<<V2_name:32/little,
                                                      V2_val:32/signed-little>>
                                                    || {V2_name, V2_val}
                                                           <- V1_attrs]))/binary>>
                                 || #guard_astroid_star{id = V1_id,
                                                        lev = V1_lev,
                                                        exp = V1_exp,
                                                        attrs = V1_attrs}
                                        <- V0_aroused]))/binary,
                (length(V0_attrs)):16/little,
                (list_to_binary([<<V1_name:32/little,
                                   V1_val:32/signed-little>>
                                 || {V1_name, V1_val} <- V0_attrs]))/binary,
                (length(V0_skills)):16/little,
                (list_to_binary([<<V1_skill_id:32/little,
                                   V1_skill_lev:8/little>>
                                 || {V1_skill_id, V1_skill_lev}
                                        <- V0_skills]))/binary,
                V0_growth:32/little, V0_active:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10916:16/little,
       D_a_t_a/binary>>};
pack(cli, 10917,
     {V0_role_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_role_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10917:16/little,
       D_a_t_a/binary>>};
pack(srv, 10917, {V0_num, V0_score, V0_attrs}) ->
    D_a_t_a = <<V0_num:8/little, V0_score:32/little,
                (length(V0_attrs)):16/little,
                (list_to_binary([<<V1_name:32/little,
                                   V1_val:32/signed-little>>
                                 || {V1_name, V1_val} <- V0_attrs]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10917:16/little,
       D_a_t_a/binary>>};
pack(cli, 10918, {V0_base_id, V0_type}) ->
    D_a_t_a = <<V0_base_id:32/little, V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10918:16/little,
       D_a_t_a/binary>>};
pack(srv, 10918,
     {V0_id,
      V0_flag,
      V0_msg,
      #guard_eqm{base_id = V0_base_id,
                 eqm_attrs = V0_eqm_attrs, timeout = V0_timeout,
                 back_effect_timeout = V0_back_effect_timeout,
                 back_effect_attr = V0_back_effect_attr}}) ->
    D_a_t_a = <<V0_id:32/little, V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_base_id:32/little, (length(V0_eqm_attrs)):16/little,
                (list_to_binary([<<V1_type:16/little, V1_name:32/little,
                                   V1_val:32/signed-little>>
                                 || #attr_base{type = V1_type, name = V1_name,
                                               val = V1_val}
                                        <- V0_eqm_attrs]))/binary,
                V0_timeout:32/little, V0_back_effect_timeout:32/little,
                (length(V0_back_effect_attr)):16/little,
                (list_to_binary([<<V1_type:16/little, V1_name:32/little,
                                   V1_val:32/signed-little>>
                                 || #attr_base{type = V1_type, name = V1_name,
                                               val = V1_val}
                                        <- V0_back_effect_attr]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10918:16/little,
       D_a_t_a/binary>>};
pack(cli, 10919, {V0_base_id, V0_type}) ->
    D_a_t_a = <<V0_base_id:32/little, V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10919:16/little,
       D_a_t_a/binary>>};
pack(srv, 10919,
     {V0_id,
      V0_flag,
      V0_msg,
      #guard_eqm{base_id = V0_base_id,
                 eqm_attrs = V0_eqm_attrs, timeout = V0_timeout,
                 back_effect_timeout = V0_back_effect_timeout,
                 back_effect_attr = V0_back_effect_attr}}) ->
    D_a_t_a = <<V0_id:32/little, V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_base_id:32/little, (length(V0_eqm_attrs)):16/little,
                (list_to_binary([<<V1_type:16/little, V1_name:32/little,
                                   V1_val:32/signed-little>>
                                 || #attr_base{type = V1_type, name = V1_name,
                                               val = V1_val}
                                        <- V0_eqm_attrs]))/binary,
                V0_timeout:32/little, V0_back_effect_timeout:32/little,
                (length(V0_back_effect_attr)):16/little,
                (list_to_binary([<<V1_type:16/little, V1_name:32/little,
                                   V1_val:32/signed-little>>
                                 || #attr_base{type = V1_type, name = V1_name,
                                               val = V1_val}
                                        <- V0_back_effect_attr]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10919:16/little,
       D_a_t_a/binary>>};
pack(cli, 10920, {V0_base_id1, V0_base_id2}) ->
    D_a_t_a = <<V0_base_id1:32/little,
                V0_base_id2:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10920:16/little,
       D_a_t_a/binary>>};
pack(srv, 10920,
     {V0_err_code, V0_base_id1, V0_base_id2, V0_msg}) ->
    D_a_t_a = <<V0_err_code:8/little, V0_base_id1:32/little,
                V0_base_id2:32/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10920:16/little,
       D_a_t_a/binary>>};
pack(cli, 10921, {}) ->
    {ok, <<2:32/little, 10921:16/little>>};
pack(srv, 10921, {V0_minlev_gem_list}) ->
    D_a_t_a = <<(length(V0_minlev_gem_list)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_lev:8/little, V1_total_lev:8/little>>
                                 || {V1_base_id, V1_lev, V1_total_lev}
                                        <- V0_minlev_gem_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10921:16/little,
       D_a_t_a/binary>>};
pack(cli, 10922, {V0_base_id1, V0_base_id2}) ->
    D_a_t_a = <<V0_base_id1:32/little,
                V0_base_id2:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10922:16/little,
       D_a_t_a/binary>>};
pack(srv, 10922, {V0_val}) ->
    D_a_t_a = <<V0_val:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10922:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 10900, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_base_id}};
unpack(cli, 10900, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_recruit_guard, _B53} = protocol:array(_B2,
                                              fun (_B3) ->
                                                      {V2_base_id, _B4} =
                                                          protocol:uint32(_B3),
                                                      {V2_war_id, _B5} =
                                                          protocol:uint8(_B4),
                                                      {V2_status, _B6} =
                                                          protocol:uint8(_B5),
                                                      {V2_score, _B7} =
                                                          protocol:uint32(_B6),
                                                      {V2_quality, _B8} =
                                                          protocol:uint8(_B7),
                                                      {V2_hp_max, _B9} =
                                                          protocol:uint32(_B8),
                                                      {V2_mp_max, _B10} =
                                                          protocol:uint32(_B9),
                                                      {V2_atk_speed, _B11} =
                                                          protocol:uint16(_B10),
                                                      {V2_phy_dmg, _B12} =
                                                          protocol:uint32(_B11),
                                                      {V2_magic_dmg, _B13} =
                                                          protocol:uint32(_B12),
                                                      {V2_phy_def, _B14} =
                                                          protocol:uint32(_B13),
                                                      {V2_magic_def, _B15} =
                                                          protocol:uint32(_B14),
                                                      {V2_heal_val, _B16} =
                                                          protocol:uint16(_B15),
                                                      {V2_eqm, _B28} =
                                                          protocol:array(_B16,
                                                                         fun
                                                                             (_B17) ->
                                                                                 {V3_base_id,
                                                                                  _B18} =
                                                                                     protocol:uint32(_B17),
                                                                                 {V3_eqm_attrs,
                                                                                  _B24} =
                                                                                     protocol:array(_B18,
                                                                                                    fun
                                                                                                        (_B19) ->
                                                                                                            {V4_type,
                                                                                                             _B20} =
                                                                                                                protocol:uint16(_B19),
                                                                                                            {V4_name,
                                                                                                             _B21} =
                                                                                                                protocol:uint32(_B20),
                                                                                                            {V4_val,
                                                                                                             _B22} =
                                                                                                                protocol:int32(_B21),
                                                                                                            {{V4_type,
                                                                                                              V4_name,
                                                                                                              V4_val},
                                                                                                             _B22}
                                                                                                    end),
                                                                                 {V3_is_init,
                                                                                  _B25} =
                                                                                     protocol:uint8(_B24),
                                                                                 {V3_timeout,
                                                                                  _B26} =
                                                                                     protocol:uint32(_B25),
                                                                                 {{V3_base_id,
                                                                                   V3_eqm_attrs,
                                                                                   V3_is_init,
                                                                                   V3_timeout},
                                                                                  _B26}
                                                                         end),
                                                      {V2_aroused, _B39} =
                                                          protocol:array(_B28,
                                                                         fun
                                                                             (_B29) ->
                                                                                 {V3_id,
                                                                                  _B30} =
                                                                                     protocol:uint32(_B29),
                                                                                 {V3_lev,
                                                                                  _B31} =
                                                                                     protocol:uint16(_B30),
                                                                                 {V3_exp,
                                                                                  _B32} =
                                                                                     protocol:uint32(_B31),
                                                                                 {V3_attrs,
                                                                                  _B37} =
                                                                                     protocol:array(_B32,
                                                                                                    fun
                                                                                                        (_B33) ->
                                                                                                            {V4_name,
                                                                                                             _B34} =
                                                                                                                protocol:uint32(_B33),
                                                                                                            {V4_val,
                                                                                                             _B35} =
                                                                                                                protocol:int32(_B34),
                                                                                                            {{V4_name,
                                                                                                              V4_val},
                                                                                                             _B35}
                                                                                                    end),
                                                                                 {{V3_id,
                                                                                   V3_lev,
                                                                                   V3_exp,
                                                                                   V3_attrs},
                                                                                  _B37}
                                                                         end),
                                                      {V2_attrs, _B44} =
                                                          protocol:array(_B39,
                                                                         fun
                                                                             (_B40) ->
                                                                                 {V3_name,
                                                                                  _B41} =
                                                                                     protocol:uint32(_B40),
                                                                                 {V3_val,
                                                                                  _B42} =
                                                                                     protocol:int32(_B41),
                                                                                 {{V3_name,
                                                                                   V3_val},
                                                                                  _B42}
                                                                         end),
                                                      {V2_skills, _B49} =
                                                          protocol:array(_B44,
                                                                         fun
                                                                             (_B45) ->
                                                                                 {V3_skill_id,
                                                                                  _B46} =
                                                                                     protocol:uint32(_B45),
                                                                                 {V3_skill_lev,
                                                                                  _B47} =
                                                                                     protocol:uint8(_B46),
                                                                                 {{V3_skill_id,
                                                                                   V3_skill_lev},
                                                                                  _B47}
                                                                         end),
                                                      {V2_growth, _B50} =
                                                          protocol:uint32(_B49),
                                                      {V2_active, _B51} =
                                                          protocol:uint8(_B50),
                                                      {{V2_base_id,
                                                        V2_war_id,
                                                        V2_status,
                                                        V2_score,
                                                        V2_quality,
                                                        V2_hp_max,
                                                        V2_mp_max,
                                                        V2_atk_speed,
                                                        V2_phy_dmg,
                                                        V2_magic_dmg,
                                                        V2_phy_def,
                                                        V2_magic_def,
                                                        V2_heal_val,
                                                        V2_eqm,
                                                        V2_aroused,
                                                        V2_attrs,
                                                        V2_skills,
                                                        V2_growth,
                                                        V2_active},
                                                       _B51}
                                              end),
    {ok, {V1_flag, V1_msg, V1_recruit_guard}};
unpack(srv, 10901, _B0) -> {ok, {}};
unpack(cli, 10901, _B0) ->
    {V1_guards, _B72} = protocol:array(_B0,
                                       fun (_B1) ->
                                               {V2_base_id, _B2} =
                                                   protocol:uint32(_B1),
                                               {V2_status, _B3} =
                                                   protocol:uint8(_B2),
                                               {V2_war_id, _B4} =
                                                   protocol:uint8(_B3),
                                               {V2_tac_pos, _B5} =
                                                   protocol:uint8(_B4),
                                               {V2_score, _B6} =
                                                   protocol:uint32(_B5),
                                               {V2_quality, _B7} =
                                                   protocol:uint8(_B6),
                                               {V2_hp_max, _B8} =
                                                   protocol:uint32(_B7),
                                               {V2_mp_max, _B9} =
                                                   protocol:uint32(_B8),
                                               {V2_atk_speed, _B10} =
                                                   protocol:uint16(_B9),
                                               {V2_phy_dmg, _B11} =
                                                   protocol:uint32(_B10),
                                               {V2_magic_dmg, _B12} =
                                                   protocol:uint32(_B11),
                                               {V2_phy_def, _B13} =
                                                   protocol:uint32(_B12),
                                               {V2_magic_def, _B14} =
                                                   protocol:uint32(_B13),
                                               {V2_heal_val, _B15} =
                                                   protocol:uint16(_B14),
                                               {V2_eqm, _B47} =
                                                   protocol:array(_B15,
                                                                  fun (_B16) ->
                                                                          {V3_base_id,
                                                                           _B17} =
                                                                              protocol:uint32(_B16),
                                                                          {V3_eqm_attrs,
                                                                           _B23} =
                                                                              protocol:array(_B17,
                                                                                             fun
                                                                                                 (_B18) ->
                                                                                                     {V4_type,
                                                                                                      _B19} =
                                                                                                         protocol:uint16(_B18),
                                                                                                     {V4_name,
                                                                                                      _B20} =
                                                                                                         protocol:uint32(_B19),
                                                                                                     {V4_val,
                                                                                                      _B21} =
                                                                                                         protocol:int32(_B20),
                                                                                                     {{V4_type,
                                                                                                       V4_name,
                                                                                                       V4_val},
                                                                                                      _B21}
                                                                                             end),
                                                                          {V3_reset_base_id,
                                                                           _B24} =
                                                                              protocol:uint32(_B23),
                                                                          {V3_reset_attrs,
                                                                           _B30} =
                                                                              protocol:array(_B24,
                                                                                             fun
                                                                                                 (_B25) ->
                                                                                                     {V4_type,
                                                                                                      _B26} =
                                                                                                         protocol:uint16(_B25),
                                                                                                     {V4_name,
                                                                                                      _B27} =
                                                                                                         protocol:uint32(_B26),
                                                                                                     {V4_val,
                                                                                                      _B28} =
                                                                                                         protocol:int32(_B27),
                                                                                                     {{V4_type,
                                                                                                       V4_name,
                                                                                                       V4_val},
                                                                                                      _B28}
                                                                                             end),
                                                                          {V3_gem,
                                                                           _B36} =
                                                                              protocol:array(_B30,
                                                                                             fun
                                                                                                 (_B31) ->
                                                                                                     {V4_id,
                                                                                                      _B32} =
                                                                                                         protocol:uint8(_B31),
                                                                                                     {V4_base_id,
                                                                                                      _B33} =
                                                                                                         protocol:uint32(_B32),
                                                                                                     {V4_type,
                                                                                                      _B34} =
                                                                                                         protocol:uint8(_B33),
                                                                                                     {{V4_id,
                                                                                                       V4_base_id,
                                                                                                       V4_type},
                                                                                                      _B34}
                                                                                             end),
                                                                          {V3_is_init,
                                                                           _B37} =
                                                                              protocol:uint8(_B36),
                                                                          {V3_timeout,
                                                                           _B38} =
                                                                              protocol:uint32(_B37),
                                                                          {V3_back_effect_timeout,
                                                                           _B39} =
                                                                              protocol:uint32(_B38),
                                                                          {V3_back_effect_attr,
                                                                           _B45} =
                                                                              protocol:array(_B39,
                                                                                             fun
                                                                                                 (_B40) ->
                                                                                                     {V4_type,
                                                                                                      _B41} =
                                                                                                         protocol:uint16(_B40),
                                                                                                     {V4_name,
                                                                                                      _B42} =
                                                                                                         protocol:uint32(_B41),
                                                                                                     {V4_val,
                                                                                                      _B43} =
                                                                                                         protocol:int32(_B42),
                                                                                                     {{V4_type,
                                                                                                       V4_name,
                                                                                                       V4_val},
                                                                                                      _B43}
                                                                                             end),
                                                                          {{V3_base_id,
                                                                            V3_eqm_attrs,
                                                                            V3_reset_base_id,
                                                                            V3_reset_attrs,
                                                                            V3_gem,
                                                                            V3_is_init,
                                                                            V3_timeout,
                                                                            V3_back_effect_timeout,
                                                                            V3_back_effect_attr},
                                                                           _B45}
                                                                  end),
                                               {V2_aroused, _B58} =
                                                   protocol:array(_B47,
                                                                  fun (_B48) ->
                                                                          {V3_id,
                                                                           _B49} =
                                                                              protocol:uint32(_B48),
                                                                          {V3_lev,
                                                                           _B50} =
                                                                              protocol:uint16(_B49),
                                                                          {V3_exp,
                                                                           _B51} =
                                                                              protocol:uint32(_B50),
                                                                          {V3_attrs,
                                                                           _B56} =
                                                                              protocol:array(_B51,
                                                                                             fun
                                                                                                 (_B52) ->
                                                                                                     {V4_name,
                                                                                                      _B53} =
                                                                                                         protocol:uint32(_B52),
                                                                                                     {V4_val,
                                                                                                      _B54} =
                                                                                                         protocol:int32(_B53),
                                                                                                     {{V4_name,
                                                                                                       V4_val},
                                                                                                      _B54}
                                                                                             end),
                                                                          {{V3_id,
                                                                            V3_lev,
                                                                            V3_exp,
                                                                            V3_attrs},
                                                                           _B56}
                                                                  end),
                                               {V2_attrs, _B63} =
                                                   protocol:array(_B58,
                                                                  fun (_B59) ->
                                                                          {V3_name,
                                                                           _B60} =
                                                                              protocol:uint32(_B59),
                                                                          {V3_val,
                                                                           _B61} =
                                                                              protocol:int32(_B60),
                                                                          {{V3_name,
                                                                            V3_val},
                                                                           _B61}
                                                                  end),
                                               {V2_skills, _B68} =
                                                   protocol:array(_B63,
                                                                  fun (_B64) ->
                                                                          {V3_skill_id,
                                                                           _B65} =
                                                                              protocol:uint32(_B64),
                                                                          {V3_skill_lev,
                                                                           _B66} =
                                                                              protocol:uint8(_B65),
                                                                          {{V3_skill_id,
                                                                            V3_skill_lev},
                                                                           _B66}
                                                                  end),
                                               {V2_growth, _B69} =
                                                   protocol:uint32(_B68),
                                               {V2_active, _B70} =
                                                   protocol:uint8(_B69),
                                               {{V2_base_id,
                                                 V2_status,
                                                 V2_war_id,
                                                 V2_tac_pos,
                                                 V2_score,
                                                 V2_quality,
                                                 V2_hp_max,
                                                 V2_mp_max,
                                                 V2_atk_speed,
                                                 V2_phy_dmg,
                                                 V2_magic_dmg,
                                                 V2_phy_def,
                                                 V2_magic_def,
                                                 V2_heal_val,
                                                 V2_eqm,
                                                 V2_aroused,
                                                 V2_attrs,
                                                 V2_skills,
                                                 V2_growth,
                                                 V2_active},
                                                _B70}
                                       end),
    {ok, {V1_guards}};
unpack(srv, 10902, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {ok, {V1_id, V1_type}};
unpack(cli, 10902, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_base_id, _B2} = protocol:uint32(_B1),
    {V1_eqm_attrs, _B8} = protocol:array(_B2,
                                         fun (_B3) ->
                                                 {V2_type, _B4} =
                                                     protocol:uint16(_B3),
                                                 {V2_name, _B5} =
                                                     protocol:uint32(_B4),
                                                 {V2_val, _B6} =
                                                     protocol:int32(_B5),
                                                 {{V2_type, V2_name, V2_val},
                                                  _B6}
                                         end),
    {V1_reset_base_id, _B9} = protocol:uint32(_B8),
    {V1_reset_attrs, _B15} = protocol:array(_B9,
                                            fun (_B10) ->
                                                    {V2_type, _B11} =
                                                        protocol:uint16(_B10),
                                                    {V2_name, _B12} =
                                                        protocol:uint32(_B11),
                                                    {V2_val, _B13} =
                                                        protocol:int32(_B12),
                                                    {{V2_type, V2_name, V2_val},
                                                     _B13}
                                            end),
    {V1_is_init, _B16} = protocol:uint8(_B15),
    {V1_timeout, _B17} = protocol:uint32(_B16),
    {V1_back_effect_timeout, _B18} = protocol:uint32(_B17),
    {V1_back_effect_attr, _B24} = protocol:array(_B18,
                                                 fun (_B19) ->
                                                         {V2_type, _B20} =
                                                             protocol:uint16(_B19),
                                                         {V2_name, _B21} =
                                                             protocol:uint32(_B20),
                                                         {V2_val, _B22} =
                                                             protocol:int32(_B21),
                                                         {{V2_type,
                                                           V2_name,
                                                           V2_val},
                                                          _B22}
                                                 end),
    {ok,
     {V1_id,
      V1_base_id,
      V1_eqm_attrs,
      V1_reset_base_id,
      V1_reset_attrs,
      V1_is_init,
      V1_timeout,
      V1_back_effect_timeout,
      V1_back_effect_attr}};
unpack(srv, 10903, _B0) -> {ok, {}};
unpack(cli, 10903, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {V1_status, _B2} = protocol:uint8(_B1),
    {V1_war_id, _B3} = protocol:uint8(_B2),
    {V1_tac_pos, _B4} = protocol:uint8(_B3),
    {V1_score, _B5} = protocol:uint32(_B4),
    {V1_quality, _B6} = protocol:uint8(_B5),
    {V1_hp_max, _B7} = protocol:uint32(_B6),
    {V1_mp_max, _B8} = protocol:uint32(_B7),
    {V1_atk_speed, _B9} = protocol:uint16(_B8),
    {V1_phy_dmg, _B10} = protocol:uint32(_B9),
    {V1_magic_dmg, _B11} = protocol:uint32(_B10),
    {V1_phy_def, _B12} = protocol:uint32(_B11),
    {V1_magic_def, _B13} = protocol:uint32(_B12),
    {V1_heal_val, _B14} = protocol:uint16(_B13),
    {V1_eqm, _B46} = protocol:array(_B14,
                                    fun (_B15) ->
                                            {V2_base_id, _B16} =
                                                protocol:uint32(_B15),
                                            {V2_eqm_attrs, _B22} =
                                                protocol:array(_B16,
                                                               fun (_B17) ->
                                                                       {V3_type,
                                                                        _B18} =
                                                                           protocol:uint16(_B17),
                                                                       {V3_name,
                                                                        _B19} =
                                                                           protocol:uint32(_B18),
                                                                       {V3_val,
                                                                        _B20} =
                                                                           protocol:int32(_B19),
                                                                       {{V3_type,
                                                                         V3_name,
                                                                         V3_val},
                                                                        _B20}
                                                               end),
                                            {V2_reset_base_id, _B23} =
                                                protocol:uint32(_B22),
                                            {V2_reset_attrs, _B29} =
                                                protocol:array(_B23,
                                                               fun (_B24) ->
                                                                       {V3_type,
                                                                        _B25} =
                                                                           protocol:uint16(_B24),
                                                                       {V3_name,
                                                                        _B26} =
                                                                           protocol:uint32(_B25),
                                                                       {V3_val,
                                                                        _B27} =
                                                                           protocol:int32(_B26),
                                                                       {{V3_type,
                                                                         V3_name,
                                                                         V3_val},
                                                                        _B27}
                                                               end),
                                            {V2_gem, _B35} =
                                                protocol:array(_B29,
                                                               fun (_B30) ->
                                                                       {V3_id,
                                                                        _B31} =
                                                                           protocol:uint8(_B30),
                                                                       {V3_base_id,
                                                                        _B32} =
                                                                           protocol:uint32(_B31),
                                                                       {V3_type,
                                                                        _B33} =
                                                                           protocol:uint8(_B32),
                                                                       {{V3_id,
                                                                         V3_base_id,
                                                                         V3_type},
                                                                        _B33}
                                                               end),
                                            {V2_is_init, _B36} =
                                                protocol:uint8(_B35),
                                            {V2_timeout, _B37} =
                                                protocol:uint32(_B36),
                                            {V2_back_effect_timeout, _B38} =
                                                protocol:uint32(_B37),
                                            {V2_back_effect_attr, _B44} =
                                                protocol:array(_B38,
                                                               fun (_B39) ->
                                                                       {V3_type,
                                                                        _B40} =
                                                                           protocol:uint16(_B39),
                                                                       {V3_name,
                                                                        _B41} =
                                                                           protocol:uint32(_B40),
                                                                       {V3_val,
                                                                        _B42} =
                                                                           protocol:int32(_B41),
                                                                       {{V3_type,
                                                                         V3_name,
                                                                         V3_val},
                                                                        _B42}
                                                               end),
                                            {{V2_base_id,
                                              V2_eqm_attrs,
                                              V2_reset_base_id,
                                              V2_reset_attrs,
                                              V2_gem,
                                              V2_is_init,
                                              V2_timeout,
                                              V2_back_effect_timeout,
                                              V2_back_effect_attr},
                                             _B44}
                                    end),
    {V1_aroused, _B57} = protocol:array(_B46,
                                        fun (_B47) ->
                                                {V2_id, _B48} =
                                                    protocol:uint32(_B47),
                                                {V2_lev, _B49} =
                                                    protocol:uint16(_B48),
                                                {V2_exp, _B50} =
                                                    protocol:uint32(_B49),
                                                {V2_attrs, _B55} =
                                                    protocol:array(_B50,
                                                                   fun (_B51) ->
                                                                           {V3_name,
                                                                            _B52} =
                                                                               protocol:uint32(_B51),
                                                                           {V3_val,
                                                                            _B53} =
                                                                               protocol:int32(_B52),
                                                                           {{V3_name,
                                                                             V3_val},
                                                                            _B53}
                                                                   end),
                                                {{V2_id,
                                                  V2_lev,
                                                  V2_exp,
                                                  V2_attrs},
                                                 _B55}
                                        end),
    {V1_attrs, _B62} = protocol:array(_B57,
                                      fun (_B58) ->
                                              {V2_name, _B59} =
                                                  protocol:uint32(_B58),
                                              {V2_val, _B60} =
                                                  protocol:int32(_B59),
                                              {{V2_name, V2_val}, _B60}
                                      end),
    {V1_skills, _B67} = protocol:array(_B62,
                                       fun (_B63) ->
                                               {V2_skill_id, _B64} =
                                                   protocol:uint32(_B63),
                                               {V2_skill_lev, _B65} =
                                                   protocol:uint8(_B64),
                                               {{V2_skill_id, V2_skill_lev},
                                                _B65}
                                       end),
    {V1_growth, _B68} = protocol:uint32(_B67),
    {V1_active, _B69} = protocol:uint8(_B68),
    {ok,
     {V1_base_id,
      V1_status,
      V1_war_id,
      V1_tac_pos,
      V1_score,
      V1_quality,
      V1_hp_max,
      V1_mp_max,
      V1_atk_speed,
      V1_phy_dmg,
      V1_magic_dmg,
      V1_phy_def,
      V1_magic_def,
      V1_heal_val,
      V1_eqm,
      V1_aroused,
      V1_attrs,
      V1_skills,
      V1_growth,
      V1_active}};
unpack(srv, 10905, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {V1_pos, _B2} = protocol:uint8(_B1),
    {ok, {V1_base_id, V1_pos}};
unpack(cli, 10905, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_change_fields, _B7} = protocol:array(_B2,
                                             fun (_B3) ->
                                                     {V2_base_id, _B4} =
                                                         protocol:uint32(_B3),
                                                     {V2_pos, _B5} =
                                                         protocol:uint8(_B4),
                                                     {{V2_base_id, V2_pos}, _B5}
                                             end),
    {ok, {V1_op_code, V1_msg, V1_change_fields}};
unpack(srv, 10906, _B0) -> {ok, {}};
unpack(cli, 10906, _B0) ->
    {V1_tac_attr, _B5} = protocol:array(_B0,
                                        fun (_B1) ->
                                                {V2_name, _B2} =
                                                    protocol:uint32(_B1),
                                                {V2_val, _B3} =
                                                    protocol:int32(_B2),
                                                {{V2_name, V2_val}, _B3}
                                        end),
    {ok, {V1_tac_attr}};
unpack(srv, 10907, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {ok, {V1_base_id, V1_type}};
unpack(cli, 10907, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_op_code, V1_msg}};
unpack(srv, 10909, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_base_id}};
unpack(cli, 10909, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_base_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_op_code, V1_msg, V1_base_id}};
unpack(srv, 10910, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {V1_hole_id, _B3} = protocol:uint32(_B2),
    {V1_gem_base_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_base_id, V1_type, V1_hole_id, V1_gem_base_id}};
unpack(cli, 10910, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_op_code, V1_msg}};
unpack(srv, 10911, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {V1_hole_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_base_id, V1_type, V1_hole_id}};
unpack(cli, 10911, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_op_code, V1_msg}};
unpack(srv, 10912, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {V1_hole_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_base_id, V1_type, V1_hole_id}};
unpack(cli, 10912, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_op_code, V1_msg}};
unpack(srv, 10913, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_base_id}};
unpack(cli, 10913, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_op_code, V1_msg}};
unpack(srv, 10914, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {V1_star_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_base_id, V1_star_id}};
unpack(cli, 10914, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_base_id, _B3} = protocol:uint32(_B2),
    {V1_star_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_op_code, V1_msg, V1_base_id, V1_star_id}};
unpack(srv, 10915, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_base_id}};
unpack(cli, 10915, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_base_id, _B3} = protocol:uint32(_B2),
    {V1_quality, _B4} = protocol:uint8(_B3),
    {ok, {V1_op_code, V1_msg, V1_base_id, V1_quality}};
unpack(srv, 10916, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_base_id}};
unpack(cli, 10916, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {V1_aroused, _B12} = protocol:array(_B1,
                                        fun (_B2) ->
                                                {V2_id, _B3} =
                                                    protocol:uint32(_B2),
                                                {V2_lev, _B4} =
                                                    protocol:uint16(_B3),
                                                {V2_exp, _B5} =
                                                    protocol:uint32(_B4),
                                                {V2_attrs, _B10} =
                                                    protocol:array(_B5,
                                                                   fun (_B6) ->
                                                                           {V3_name,
                                                                            _B7} =
                                                                               protocol:uint32(_B6),
                                                                           {V3_val,
                                                                            _B8} =
                                                                               protocol:int32(_B7),
                                                                           {{V3_name,
                                                                             V3_val},
                                                                            _B8}
                                                                   end),
                                                {{V2_id,
                                                  V2_lev,
                                                  V2_exp,
                                                  V2_attrs},
                                                 _B10}
                                        end),
    {V1_attrs, _B17} = protocol:array(_B12,
                                      fun (_B13) ->
                                              {V2_name, _B14} =
                                                  protocol:uint32(_B13),
                                              {V2_val, _B15} =
                                                  protocol:int32(_B14),
                                              {{V2_name, V2_val}, _B15}
                                      end),
    {V1_skills, _B22} = protocol:array(_B17,
                                       fun (_B18) ->
                                               {V2_skill_id, _B19} =
                                                   protocol:uint32(_B18),
                                               {V2_skill_lev, _B20} =
                                                   protocol:uint8(_B19),
                                               {{V2_skill_id, V2_skill_lev},
                                                _B20}
                                       end),
    {V1_growth, _B23} = protocol:uint32(_B22),
    {V1_active, _B24} = protocol:uint8(_B23),
    {ok,
     {V1_base_id,
      V1_aroused,
      V1_attrs,
      V1_skills,
      V1_growth,
      V1_active}};
unpack(srv, 10917, _B0) ->
    {V1_role_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_role_id, V1_platform, V1_zone_id}};
unpack(cli, 10917, _B0) ->
    {V1_num, _B1} = protocol:uint8(_B0),
    {V1_score, _B2} = protocol:uint32(_B1),
    {V1_attrs, _B7} = protocol:array(_B2,
                                     fun (_B3) ->
                                             {V2_name, _B4} =
                                                 protocol:uint32(_B3),
                                             {V2_val, _B5} =
                                                 protocol:int32(_B4),
                                             {{V2_name, V2_val}, _B5}
                                     end),
    {ok, {V1_num, V1_score, V1_attrs}};
unpack(srv, 10918, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {ok, {V1_base_id, V1_type}};
unpack(cli, 10918, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_flag, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {V1_base_id, _B4} = protocol:uint32(_B3),
    {V1_eqm_attrs, _B10} = protocol:array(_B4,
                                          fun (_B5) ->
                                                  {V2_type, _B6} =
                                                      protocol:uint16(_B5),
                                                  {V2_name, _B7} =
                                                      protocol:uint32(_B6),
                                                  {V2_val, _B8} =
                                                      protocol:int32(_B7),
                                                  {{V2_type, V2_name, V2_val},
                                                   _B8}
                                          end),
    {V1_timeout, _B11} = protocol:uint32(_B10),
    {V1_back_effect_timeout, _B12} = protocol:uint32(_B11),
    {V1_back_effect_attr, _B18} = protocol:array(_B12,
                                                 fun (_B13) ->
                                                         {V2_type, _B14} =
                                                             protocol:uint16(_B13),
                                                         {V2_name, _B15} =
                                                             protocol:uint32(_B14),
                                                         {V2_val, _B16} =
                                                             protocol:int32(_B15),
                                                         {{V2_type,
                                                           V2_name,
                                                           V2_val},
                                                          _B16}
                                                 end),
    {ok,
     {V1_id,
      V1_flag,
      V1_msg,
      V1_base_id,
      V1_eqm_attrs,
      V1_timeout,
      V1_back_effect_timeout,
      V1_back_effect_attr}};
unpack(srv, 10919, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {ok, {V1_base_id, V1_type}};
unpack(cli, 10919, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_flag, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {V1_base_id, _B4} = protocol:uint32(_B3),
    {V1_eqm_attrs, _B10} = protocol:array(_B4,
                                          fun (_B5) ->
                                                  {V2_type, _B6} =
                                                      protocol:uint16(_B5),
                                                  {V2_name, _B7} =
                                                      protocol:uint32(_B6),
                                                  {V2_val, _B8} =
                                                      protocol:int32(_B7),
                                                  {{V2_type, V2_name, V2_val},
                                                   _B8}
                                          end),
    {V1_timeout, _B11} = protocol:uint32(_B10),
    {V1_back_effect_timeout, _B12} = protocol:uint32(_B11),
    {V1_back_effect_attr, _B18} = protocol:array(_B12,
                                                 fun (_B13) ->
                                                         {V2_type, _B14} =
                                                             protocol:uint16(_B13),
                                                         {V2_name, _B15} =
                                                             protocol:uint32(_B14),
                                                         {V2_val, _B16} =
                                                             protocol:int32(_B15),
                                                         {{V2_type,
                                                           V2_name,
                                                           V2_val},
                                                          _B16}
                                                 end),
    {ok,
     {V1_id,
      V1_flag,
      V1_msg,
      V1_base_id,
      V1_eqm_attrs,
      V1_timeout,
      V1_back_effect_timeout,
      V1_back_effect_attr}};
unpack(srv, 10920, _B0) ->
    {V1_base_id1, _B1} = protocol:uint32(_B0),
    {V1_base_id2, _B2} = protocol:uint32(_B1),
    {ok, {V1_base_id1, V1_base_id2}};
unpack(cli, 10920, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_base_id1, _B2} = protocol:uint32(_B1),
    {V1_base_id2, _B3} = protocol:uint32(_B2),
    {V1_msg, _B4} = protocol:string(_B3),
    {ok, {V1_err_code, V1_base_id1, V1_base_id2, V1_msg}};
unpack(srv, 10921, _B0) -> {ok, {}};
unpack(cli, 10921, _B0) ->
    {V1_minlev_gem_list, _B6} = protocol:array(_B0,
                                               fun (_B1) ->
                                                       {V2_base_id, _B2} =
                                                           protocol:uint32(_B1),
                                                       {V2_lev, _B3} =
                                                           protocol:uint8(_B2),
                                                       {V2_total_lev, _B4} =
                                                           protocol:uint8(_B3),
                                                       {{V2_base_id,
                                                         V2_lev,
                                                         V2_total_lev},
                                                        _B4}
                                               end),
    {ok, {V1_minlev_gem_list}};
unpack(srv, 10922, _B0) ->
    {V1_base_id1, _B1} = protocol:uint32(_B0),
    {V1_base_id2, _B2} = protocol:uint32(_B1),
    {ok, {V1_base_id1, V1_base_id2}};
unpack(cli, 10922, _B0) ->
    {V1_val, _B1} = protocol:uint32(_B0),
    {ok, {V1_val}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

