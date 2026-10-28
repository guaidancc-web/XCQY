-file("src/proto/proto_186.erl", 1).

-module(proto_186).

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

-file("src/proto/proto_186.erl", 14).

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

-file("src/proto/proto_186.erl", 15).

-file("inc/child.hrl", 1).

-record(m_child,
        {ver = 1,
         kids = [] :: list(),
         fertility = 0 :: non_neg_integer(),
         tonic = 0 :: non_neg_integer(),
         hungry_notice_lev = []}).

-record(child_attr,
        {point = 0,
         p_str = 0,
         p_con = 0,
         p_mag = 0,
         p_agi = 0,
         p_end = 0,
         pre_str = 0,
         pre_con = 0,
         pre_mag = 0,
         pre_agi = 0,
         pre_end = 0,
         max_hp_apt_used = 0,
         max_phy_apt_used = 0,
         max_pdef_apt_used = 0,
         max_magic_apt_used = 0,
         max_aspd_apt_used = 0,
         hp_aptitude = 0,
         phy_aptitude = 0,
         pdef_aptitude = 0,
         magic_aptitude = 0,
         aspd_aptitude = 0,
         max_hp_aptitude = 0,
         max_phy_aptitude = 0,
         max_pdef_aptitude = 0,
         max_magic_aptitude = 0,
         max_aspd_aptitude = 0,
         study_str = 0,
         study_con = 0,
         study_mag = 0,
         study_agi = 0,
         study_end = 0}).

-record(child_study_plan,
        {ver = 1,
         is_init = 1,
         study_str_easy = 0,
         study_con_easy = 0,
         study_mag_easy = 0,
         study_agi_easy = 0,
         study_end_easy = 0,
         study_str_hard = 0,
         study_con_hard = 0,
         study_mag_hard = 0,
         study_agi_hard = 0,
         study_end_hard = 0,
         study_str_plan_easy = 0,
         study_con_plan_easy = 0,
         study_mag_plan_easy = 0,
         study_agi_plan_easy = 0,
         study_end_plan_easy = 0,
         study_str_plan_hard = 0,
         study_con_plan_hard = 0,
         study_mag_plan_hard = 0,
         study_agi_plan_hard = 0,
         study_end_plan_hard = 0}).

-record(child_base,
        {id = 0,
         name = "",
         classes,
         sex,
         hp_aptitude = 0,
         phy_aptitude = 0,
         pdef_aptitude = 0,
         magic_aptitude = 0,
         aspd_aptitude = 0,
         growth_blue = 0,
         growth_purple = 0,
         growth_orange = 0,
         growth_red = 0,
         model_id = 0,
         model_id1 = 0,
         model_id2 = 0,
         model_id3 = 0,
         skin_id_0 = 0,
         skin_id_1 = 0,
         skin_id_2 = 0,
         skin_id_3 = 0,
         skin_id_s0 = 0,
         skin_id_s1 = 0,
         skin_id_s2 = 0,
         skin_id_s3 = 0,
         unit_id = 0,
         unit_id_1 = 0,
         unit_id_2 = 0,
         unit_id_3 = 0,
         classes_skills = []}).

-record(child,
        {id = {0, "", 0} :: tuple(),
         ver = 5,
         parents = [] :: list(),
         custody = {0, "", 0} :: tuple(),
         name = "" :: string(),
         base_id = 0,
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         classes_type = 1,
         embryo = 1 :: non_neg_integer(),
         pregnant_time = 0 :: non_neg_integer(),
         birth_time = 0 :: non_neg_integer(),
         stage = 1 :: non_neg_integer(),
         status = 0,
         follow = {0, "", 0} :: tuple(),
         maturity = 0 :: non_neg_integer(),
         growth = 0 :: non_neg_integer(),
         ext_growth = 0,
         growth_type = 5 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         skills = [] :: list(),
         talent_skills = [],
         hungry = 100,
         add_point = 0,
         add_point_item = [],
         grade = 0,
         grade_attr = [],
         hp = 0,
         mp = 0,
         attr,
         looks = [],
         stones = [] :: list(),
         use_growth = 0,
         study_easy = 0,
         study_hard = 0,
         day_easy = 0,
         day_hard = 0,
         study_easy_time = 0,
         study_hard_time = 0,
         talent = 0,
         child_attr = #child_attr{},
         name_changed = 0 :: non_neg_integer(),
         last_name_changed = 0 :: non_neg_integer(),
         maturity_added_log = [] :: list(),
         last_added_maturity = 0 :: non_neg_integer(),
         handbook_attr = [],
         handbook_num = 0,
         star_handbook_num = 0,
         combat_talk = [],
         free_study = 0,
         study_plan = #child_study_plan{},
         spirit_attached = 0 :: 0 | 1,
         spirit_skills = [],
         spirit_info = [],
         child_skin = []}).

-record(child_parent,
        {id = {0, "", 0} :: tuple(),
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         account = "",
         lev = 1,
         classes = 0 :: non_neg_integer(),
         looks = [] :: list(),
         intimacy = 0 :: non_neg_integer()}).

-record(child_base_skill,
        {id = 0,
         name = "",
         type = 0,
         step = 0,
         lev = 0,
         max_exp = 0,
         attr = []}).

-record(child_skill,
        {id = 0,
         lev = 1,
         step = 0,
         type = 0,
         source = 1,
         is_open = 1,
         exp = 1}).

-record(child_stone,
        {id = 0,
         type = 0,
         base_id = 0,
         role_id = {0, "", 0},
         attr = [],
         extra = [],
         reset_attr = []}).

-record(child_talent_skill,
        {id = 0, grade = 0, lev = 1, exp = 0}).

-record(child_rank, {type = 1, list = []}).

-record(child_rank_rc,
        {id = {0, "", 0} :: tuple(),
         rank = 1,
         ver = 0,
         father_id = {0, "", 0},
         father_name = "",
         father_classes = 0,
         father_sex = 0,
         mother_id = {0, "", 0},
         mother_name = "",
         mother_classes = 0,
         mother_sex = 0,
         custody = {0, "", 0} :: tuple(),
         name = "" :: string(),
         base_id = 0,
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         classes_type = 1,
         lev = 1 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         time = 0}).

-record(child_skin,
        {ver = 2,
         skin_id = 0,
         skin_active_flag = 0,
         expire_time = 0,
         timer_flag = 0}).

-file("src/proto/proto_186.erl", 16).

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

-file("src/proto/proto_186.erl", 17).

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

-file("src/proto/proto_186.erl", 18).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 18600, {}) ->
    {ok, <<2:32/little, 18600:16/little>>};
pack(srv, 18600,
     {V0_child_nums, V0_child_list, V0_hungry_notice_lev}) ->
    D_a_t_a = <<V0_child_nums:8/little,
                (length(V0_child_list)):16/little,
                (list_to_binary([<<V1_child_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:8/little, V1_sex:8/little,
                                   V1_classes:8/little,
                                   V1_classes_type:8/little, V1_status:8/little,
                                   V1_stage:8/little, V1_grade:8/little,
                                   V1_base_id:32/little, V1_embryo:8/little,
                                   V1_growth:16/little, V1_growth_type:8/little,
                                   V1_maturity:16/little, V1_hungry:8/little,
                                   V1_add_point:8/little,
                                   V1_use_growth:8/little,
                                   V1_pregnant_time:32/little,
                                   V1_birth_time:32/little,
                                   V1_study_easy:8/little,
                                   V1_study_easy_time:32/little,
                                   V1_day_easy:8/little, V1_study_hard:8/little,
                                   V1_study_hard_time:32/little,
                                   V1_day_hard:8/little, V1_free_study:8/little,
                                   V1_talent:16/little, V1_hp:32/little,
                                   V1_mp:32/little, V1_name_changed:32/little,
                                   V1_follow_id:32/little,
                                   (protocol:pack(string,
                                                  V1_f_platform))/binary,
                                   V1_f_zone_id:16/little,
                                   (length(V1_parents)):16/little,
                                   (list_to_binary([<<V2_parent_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_p_platform))/binary,
                                                      V2_p_zone_id:16/little,
                                                      (protocol:pack(string,
                                                                     V2_name))/binary,
                                                      V2_sex:8/little,
                                                      V2_classes:8/little,
                                                      (length(V2_looks)):16/little,
                                                      (list_to_binary([<<V3_looks_type:32/little,
                                                                         V3_looks_mode:32/little,
                                                                         V3_looks_val:32/little,
                                                                         (protocol:pack(string,
                                                                                        V3_looks_str))/binary>>
                                                                       || {V3_looks_type,
                                                                           V3_looks_mode,
                                                                           V3_looks_val,
                                                                           V3_looks_str}
                                                                              <- V2_looks]))/binary,
                                                      V2_intimacy:32/little>>
                                                    || #child_parent{id =
                                                                         {V2_parent_id,
                                                                          V2_p_platform,
                                                                          V2_p_zone_id},
                                                                     name =
                                                                         V2_name,
                                                                     sex =
                                                                         V2_sex,
                                                                     classes =
                                                                         V2_classes,
                                                                     looks =
                                                                         V2_looks,
                                                                     intimacy =
                                                                         V2_intimacy}
                                                           <- V1_parents]))/binary,
                                   V1_hp_max:32/little, V1_mp_max:32/little,
                                   V1_atk_speed:16/little, V1_phy_dmg:32/little,
                                   V1_magic_dmg:32/little, V1_phy_def:32/little,
                                   V1_magic_def:32/little,
                                   V1_hp_aptitude:16/little,
                                   V1_phy_aptitude:16/little,
                                   V1_pdef_aptitude:16/little,
                                   V1_magic_aptitude:16/little,
                                   V1_aspd_aptitude:16/little,
                                   V1_max_hp_aptitude:16/little,
                                   V1_max_phy_aptitude:16/little,
                                   V1_max_pdef_aptitude:16/little,
                                   V1_max_magic_aptitude:16/little,
                                   V1_max_aspd_aptitude:16/little,
                                   V1_study_str:16/little,
                                   V1_study_con:16/little,
                                   V1_study_agi:16/little,
                                   V1_study_mag:16/little,
                                   V1_study_end:16/little,
                                   V1_max_hp_apt_used:8/little,
                                   V1_max_phy_apt_used:8/little,
                                   V1_max_pdef_apt_used:8/little,
                                   V1_max_magic_apt_used:8/little,
                                   V1_max_aspd_apt_used:8/little,
                                   V1_is_init:8/little,
                                   V1_study_str_easy:16/little,
                                   V1_study_con_easy:16/little,
                                   V1_study_agi_easy:16/little,
                                   V1_study_mag_easy:16/little,
                                   V1_study_end_easy:16/little,
                                   V1_study_str_hard:16/little,
                                   V1_study_con_hard:16/little,
                                   V1_study_agi_hard:16/little,
                                   V1_study_mag_hard:16/little,
                                   V1_study_end_hard:16/little,
                                   V1_study_str_plan_easy:16/little,
                                   V1_study_con_plan_easy:16/little,
                                   V1_study_agi_plan_easy:16/little,
                                   V1_study_mag_plan_easy:16/little,
                                   V1_study_end_plan_easy:16/little,
                                   V1_study_str_plan_hard:16/little,
                                   V1_study_con_plan_hard:16/little,
                                   V1_study_agi_plan_hard:16/little,
                                   V1_study_mag_plan_hard:16/little,
                                   V1_study_end_plan_hard:16/little,
                                   (length(V1_skills)):16/little,
                                   (list_to_binary([<<V2_id:32/little,
                                                      V2_source:8/little,
                                                      V2_is_open:8/little>>
                                                    || #child_skill{id = V2_id,
                                                                    source =
                                                                        V2_source,
                                                                    is_open =
                                                                        V2_is_open}
                                                           <- V1_skills]))/binary,
                                   (length(V1_talent_skills)):16/little,
                                   (list_to_binary([<<V2_id:32/little,
                                                      V2_grade:8/little,
                                                      V2_lev:8/little,
                                                      V2_exp:32/little>>
                                                    || #child_talent_skill{id =
                                                                               V2_id,
                                                                           grade
                                                                               =
                                                                               V2_grade,
                                                                           lev =
                                                                               V2_lev,
                                                                           exp =
                                                                               V2_exp}
                                                           <- V1_talent_skills]))/binary,
                                   (length(V1_stones)):16/little,
                                   (list_to_binary([<<V2_id:32/little,
                                                      V2_b_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_b_platform))/binary,
                                                      V2_b_zone_id:16/little,
                                                      V2_base_id:32/little,
                                                      (length(V2_attr)):16/little,
                                                      (list_to_binary([<<V3_type:16/little,
                                                                         V3_name:32/little,
                                                                         V3_flag:32/little,
                                                                         V3_val:32/signed-little>>
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
                                                      (length(V2_reset_attr)):16/little,
                                                      (list_to_binary([<<V3_type:16/little,
                                                                         V3_name:32/little,
                                                                         V3_flag:32/little,
                                                                         V3_val:32/signed-little>>
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
                                                                              <- V2_reset_attr]))/binary,
                                                      (length(V2_extra)):16/little,
                                                      (list_to_binary([<<V3_name:32/little,
                                                                         V3_value:32/little,
                                                                         (protocol:pack(string,
                                                                                        V3_str))/binary>>
                                                                       || {V3_name,
                                                                           V3_value,
                                                                           V3_str}
                                                                              <- V2_extra]))/binary>>
                                                    || #child_stone{id = V2_id,
                                                                    role_id =
                                                                        {V2_b_id,
                                                                         V2_b_platform,
                                                                         V2_b_zone_id},
                                                                    base_id =
                                                                        V2_base_id,
                                                                    attr =
                                                                        V2_attr,
                                                                    reset_attr =
                                                                        V2_reset_attr,
                                                                    extra =
                                                                        V2_extra}
                                                           <- V1_stones]))/binary,
                                   (length(V1_handbook_attr)):16/little,
                                   (list_to_binary([<<V2_attr_name:32/little,
                                                      V2_attr_val:32/little>>
                                                    || {V2_attr_name,
                                                        V2_attr_val}
                                                           <- V1_handbook_attr]))/binary,
                                   V1_handbook_num:8/little,
                                   V1_star_handbook_num:8/little,
                                   V1_spirit_attached:8/little,
                                   (length(V1_child_skin)):16/little,
                                   (list_to_binary([<<V2_skin_id:32/little,
                                                      V2_skin_active_flag:8/little,
                                                      V2_expire_time:32/little>>
                                                    || #child_skin{skin_id =
                                                                       V2_skin_id,
                                                                   skin_active_flag
                                                                       =
                                                                       V2_skin_active_flag,
                                                                   expire_time =
                                                                       V2_expire_time}
                                                           <- V1_child_skin]))/binary>>
                                 || #child{id =
                                               {V1_child_id,
                                                V1_platform,
                                                V1_zone_id},
                                           name = V1_name, lev = V1_lev,
                                           sex = V1_sex, classes = V1_classes,
                                           classes_type = V1_classes_type,
                                           status = V1_status, stage = V1_stage,
                                           grade = V1_grade,
                                           base_id = V1_base_id,
                                           embryo = V1_embryo,
                                           growth = V1_growth,
                                           growth_type = V1_growth_type,
                                           maturity = V1_maturity,
                                           hungry = V1_hungry,
                                           add_point = V1_add_point,
                                           use_growth = V1_use_growth,
                                           pregnant_time = V1_pregnant_time,
                                           birth_time = V1_birth_time,
                                           study_easy = V1_study_easy,
                                           study_easy_time = V1_study_easy_time,
                                           day_easy = V1_day_easy,
                                           study_hard = V1_study_hard,
                                           study_hard_time = V1_study_hard_time,
                                           day_hard = V1_day_hard,
                                           free_study = V1_free_study,
                                           talent = V1_talent, hp = V1_hp,
                                           mp = V1_mp,
                                           name_changed = V1_name_changed,
                                           follow =
                                               {V1_follow_id,
                                                V1_f_platform,
                                                V1_f_zone_id},
                                           parents = V1_parents,
                                           attr =
                                               #attr{hp_max = V1_hp_max,
                                                     mp_max = V1_mp_max,
                                                     atk_speed = V1_atk_speed,
                                                     phy_dmg = V1_phy_dmg,
                                                     magic_dmg = V1_magic_dmg,
                                                     phy_def = V1_phy_def,
                                                     magic_def = V1_magic_def},
                                           child_attr =
                                               #child_attr{hp_aptitude =
                                                               V1_hp_aptitude,
                                                           phy_aptitude =
                                                               V1_phy_aptitude,
                                                           pdef_aptitude =
                                                               V1_pdef_aptitude,
                                                           magic_aptitude =
                                                               V1_magic_aptitude,
                                                           aspd_aptitude =
                                                               V1_aspd_aptitude,
                                                           max_hp_aptitude =
                                                               V1_max_hp_aptitude,
                                                           max_phy_aptitude =
                                                               V1_max_phy_aptitude,
                                                           max_pdef_aptitude =
                                                               V1_max_pdef_aptitude,
                                                           max_magic_aptitude =
                                                               V1_max_magic_aptitude,
                                                           max_aspd_aptitude =
                                                               V1_max_aspd_aptitude,
                                                           study_str =
                                                               V1_study_str,
                                                           study_con =
                                                               V1_study_con,
                                                           study_agi =
                                                               V1_study_agi,
                                                           study_mag =
                                                               V1_study_mag,
                                                           study_end =
                                                               V1_study_end,
                                                           max_hp_apt_used =
                                                               V1_max_hp_apt_used,
                                                           max_phy_apt_used =
                                                               V1_max_phy_apt_used,
                                                           max_pdef_apt_used =
                                                               V1_max_pdef_apt_used,
                                                           max_magic_apt_used =
                                                               V1_max_magic_apt_used,
                                                           max_aspd_apt_used =
                                                               V1_max_aspd_apt_used},
                                           study_plan =
                                               #child_study_plan{is_init =
                                                                     V1_is_init,
                                                                 study_str_easy
                                                                     =
                                                                     V1_study_str_easy,
                                                                 study_con_easy
                                                                     =
                                                                     V1_study_con_easy,
                                                                 study_agi_easy
                                                                     =
                                                                     V1_study_agi_easy,
                                                                 study_mag_easy
                                                                     =
                                                                     V1_study_mag_easy,
                                                                 study_end_easy
                                                                     =
                                                                     V1_study_end_easy,
                                                                 study_str_hard
                                                                     =
                                                                     V1_study_str_hard,
                                                                 study_con_hard
                                                                     =
                                                                     V1_study_con_hard,
                                                                 study_agi_hard
                                                                     =
                                                                     V1_study_agi_hard,
                                                                 study_mag_hard
                                                                     =
                                                                     V1_study_mag_hard,
                                                                 study_end_hard
                                                                     =
                                                                     V1_study_end_hard,
                                                                 study_str_plan_easy
                                                                     =
                                                                     V1_study_str_plan_easy,
                                                                 study_con_plan_easy
                                                                     =
                                                                     V1_study_con_plan_easy,
                                                                 study_agi_plan_easy
                                                                     =
                                                                     V1_study_agi_plan_easy,
                                                                 study_mag_plan_easy
                                                                     =
                                                                     V1_study_mag_plan_easy,
                                                                 study_end_plan_easy
                                                                     =
                                                                     V1_study_end_plan_easy,
                                                                 study_str_plan_hard
                                                                     =
                                                                     V1_study_str_plan_hard,
                                                                 study_con_plan_hard
                                                                     =
                                                                     V1_study_con_plan_hard,
                                                                 study_agi_plan_hard
                                                                     =
                                                                     V1_study_agi_plan_hard,
                                                                 study_mag_plan_hard
                                                                     =
                                                                     V1_study_mag_plan_hard,
                                                                 study_end_plan_hard
                                                                     =
                                                                     V1_study_end_plan_hard},
                                           skills = V1_skills,
                                           talent_skills = V1_talent_skills,
                                           stones = V1_stones,
                                           handbook_attr = V1_handbook_attr,
                                           handbook_num = V1_handbook_num,
                                           star_handbook_num =
                                               V1_star_handbook_num,
                                           spirit_attached = V1_spirit_attached,
                                           child_skin = V1_child_skin}
                                        <- V0_child_list]))/binary,
                (length(V0_hungry_notice_lev)):16/little,
                (list_to_binary([<<V1_n_child_id:32/little,
                                   (protocol:pack(string,
                                                  V1_n_platform))/binary,
                                   V1_n_zone_id:16/little, V1_n_lev:8/little>>
                                 || {{V1_n_child_id,
                                      V1_n_platform,
                                      V1_n_zone_id},
                                     V1_n_lev}
                                        <- V0_hungry_notice_lev]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18600:16/little,
       D_a_t_a/binary>>};
pack(cli, 18601, {}) ->
    {ok, <<2:32/little, 18601:16/little>>};
pack(srv, 18601, {V0_child_list}) ->
    D_a_t_a = <<(length(V0_child_list)):16/little,
                (list_to_binary([<<V1_child_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:8/little, V1_sex:8/little,
                                   V1_classes:8/little,
                                   V1_classes_type:8/little, V1_status:8/little,
                                   V1_stage:8/little, V1_grade:8/little,
                                   V1_base_id:32/little, V1_embryo:8/little,
                                   V1_growth:16/little, V1_growth_type:8/little,
                                   V1_maturity:16/little, V1_hungry:8/little,
                                   V1_add_point:8/little,
                                   V1_use_growth:8/little,
                                   V1_pregnant_time:32/little,
                                   V1_birth_time:32/little,
                                   V1_follow_id:32/little,
                                   (protocol:pack(string,
                                                  V1_f_platform))/binary,
                                   V1_f_zone_id:16/little,
                                   (length(V1_parents)):16/little,
                                   (list_to_binary([<<V2_parent_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_p_platform))/binary,
                                                      V2_p_zone_id:16/little,
                                                      (protocol:pack(string,
                                                                     V2_name))/binary,
                                                      V2_sex:8/little,
                                                      V2_classes:8/little,
                                                      (length(V2_looks)):16/little,
                                                      (list_to_binary([<<V3_looks_type:32/little,
                                                                         V3_looks_mode:32/little,
                                                                         V3_looks_val:32/little,
                                                                         (protocol:pack(string,
                                                                                        V3_looks_str))/binary>>
                                                                       || {V3_looks_type,
                                                                           V3_looks_mode,
                                                                           V3_looks_val,
                                                                           V3_looks_str}
                                                                              <- V2_looks]))/binary,
                                                      V2_intimacy:32/little>>
                                                    || #child_parent{id =
                                                                         {V2_parent_id,
                                                                          V2_p_platform,
                                                                          V2_p_zone_id},
                                                                     name =
                                                                         V2_name,
                                                                     sex =
                                                                         V2_sex,
                                                                     classes =
                                                                         V2_classes,
                                                                     looks =
                                                                         V2_looks,
                                                                     intimacy =
                                                                         V2_intimacy}
                                                           <- V1_parents]))/binary>>
                                 || #child{id =
                                               {V1_child_id,
                                                V1_platform,
                                                V1_zone_id},
                                           name = V1_name, lev = V1_lev,
                                           sex = V1_sex, classes = V1_classes,
                                           classes_type = V1_classes_type,
                                           status = V1_status, stage = V1_stage,
                                           grade = V1_grade,
                                           base_id = V1_base_id,
                                           embryo = V1_embryo,
                                           growth = V1_growth,
                                           growth_type = V1_growth_type,
                                           maturity = V1_maturity,
                                           hungry = V1_hungry,
                                           add_point = V1_add_point,
                                           use_growth = V1_use_growth,
                                           pregnant_time = V1_pregnant_time,
                                           birth_time = V1_birth_time,
                                           follow =
                                               {V1_follow_id,
                                                V1_f_platform,
                                                V1_f_zone_id},
                                           parents = V1_parents}
                                        <- V0_child_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18601:16/little,
       D_a_t_a/binary>>};
pack(cli, 18602, {}) ->
    {ok, <<2:32/little, 18602:16/little>>};
pack(srv, 18602, {V0_abandons}) ->
    D_a_t_a = <<(length(V0_abandons)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little>>
                                 || {V1_id, V1_platform, V1_zone_id}
                                        <- V0_abandons]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18602:16/little,
       D_a_t_a/binary>>};
pack(cli, 18603, {}) ->
    {ok, <<2:32/little, 18603:16/little>>};
pack(srv, 18603, {V0_child_list}) ->
    D_a_t_a = <<(length(V0_child_list)):16/little,
                (list_to_binary([<<V1_child_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:8/little, V1_base_id:32/little,
                                   V1_grade:8/little, V1_growth:16/little,
                                   V1_growth_type:8/little,
                                   V1_add_point:8/little,
                                   V1_use_growth:8/little, V1_talent:16/little,
                                   V1_hp:32/little, V1_mp:32/little,
                                   V1_hp_max:32/little, V1_mp_max:32/little,
                                   V1_atk_speed:16/little, V1_phy_dmg:32/little,
                                   V1_magic_dmg:32/little, V1_phy_def:32/little,
                                   V1_magic_def:32/little,
                                   V1_hp_aptitude:16/little,
                                   V1_phy_aptitude:16/little,
                                   V1_pdef_aptitude:16/little,
                                   V1_magic_aptitude:16/little,
                                   V1_aspd_aptitude:16/little,
                                   V1_max_hp_aptitude:16/little,
                                   V1_max_phy_aptitude:16/little,
                                   V1_max_pdef_aptitude:16/little,
                                   V1_max_magic_aptitude:16/little,
                                   V1_max_aspd_aptitude:16/little,
                                   V1_max_hp_apt_used:8/little,
                                   V1_max_phy_apt_used:8/little,
                                   V1_max_pdef_apt_used:8/little,
                                   V1_max_magic_apt_used:8/little,
                                   V1_max_aspd_apt_used:8/little,
                                   (length(V1_handbook_attr)):16/little,
                                   (list_to_binary([<<V2_attr_name:32/little,
                                                      V2_attr_val:32/little>>
                                                    || {V2_attr_name,
                                                        V2_attr_val}
                                                           <- V1_handbook_attr]))/binary,
                                   V1_handbook_num:8/little,
                                   V1_star_handbook_num:8/little,
                                   V1_spirit_attached:8/little>>
                                 || #child{id =
                                               {V1_child_id,
                                                V1_platform,
                                                V1_zone_id},
                                           name = V1_name, lev = V1_lev,
                                           base_id = V1_base_id,
                                           grade = V1_grade, growth = V1_growth,
                                           growth_type = V1_growth_type,
                                           add_point = V1_add_point,
                                           use_growth = V1_use_growth,
                                           talent = V1_talent, hp = V1_hp,
                                           mp = V1_mp,
                                           attr =
                                               #attr{hp_max = V1_hp_max,
                                                     mp_max = V1_mp_max,
                                                     atk_speed = V1_atk_speed,
                                                     phy_dmg = V1_phy_dmg,
                                                     magic_dmg = V1_magic_dmg,
                                                     phy_def = V1_phy_def,
                                                     magic_def = V1_magic_def},
                                           child_attr =
                                               #child_attr{hp_aptitude =
                                                               V1_hp_aptitude,
                                                           phy_aptitude =
                                                               V1_phy_aptitude,
                                                           pdef_aptitude =
                                                               V1_pdef_aptitude,
                                                           magic_aptitude =
                                                               V1_magic_aptitude,
                                                           aspd_aptitude =
                                                               V1_aspd_aptitude,
                                                           max_hp_aptitude =
                                                               V1_max_hp_aptitude,
                                                           max_phy_aptitude =
                                                               V1_max_phy_aptitude,
                                                           max_pdef_aptitude =
                                                               V1_max_pdef_aptitude,
                                                           max_magic_aptitude =
                                                               V1_max_magic_aptitude,
                                                           max_aspd_aptitude =
                                                               V1_max_aspd_aptitude,
                                                           max_hp_apt_used =
                                                               V1_max_hp_apt_used,
                                                           max_phy_apt_used =
                                                               V1_max_phy_apt_used,
                                                           max_pdef_apt_used =
                                                               V1_max_pdef_apt_used,
                                                           max_magic_apt_used =
                                                               V1_max_magic_apt_used,
                                                           max_aspd_apt_used =
                                                               V1_max_aspd_apt_used},
                                           handbook_attr = V1_handbook_attr,
                                           handbook_num = V1_handbook_num,
                                           star_handbook_num =
                                               V1_star_handbook_num,
                                           spirit_attached = V1_spirit_attached}
                                        <- V0_child_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18603:16/little,
       D_a_t_a/binary>>};
pack(cli, 18604, {}) ->
    {ok, <<2:32/little, 18604:16/little>>};
pack(srv, 18604, {V0_child_list}) ->
    D_a_t_a = <<(length(V0_child_list)):16/little,
                (list_to_binary([<<V1_child_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little, V1_base_id:32/little,
                                   (length(V1_skills)):16/little,
                                   (list_to_binary([<<V2_id:32/little,
                                                      V2_source:8/little,
                                                      V2_is_open:8/little>>
                                                    || #child_skill{id = V2_id,
                                                                    source =
                                                                        V2_source,
                                                                    is_open =
                                                                        V2_is_open}
                                                           <- V1_skills]))/binary>>
                                 || #child{id =
                                               {V1_child_id,
                                                V1_platform,
                                                V1_zone_id},
                                           base_id = V1_base_id,
                                           skills = V1_skills}
                                        <- V0_child_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18604:16/little,
       D_a_t_a/binary>>};
pack(cli, 18605, {}) ->
    {ok, <<2:32/little, 18605:16/little>>};
pack(srv, 18605, {V0_child_list}) ->
    D_a_t_a = <<(length(V0_child_list)):16/little,
                (list_to_binary([<<V1_child_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little, V1_base_id:32/little,
                                   (length(V1_stones)):16/little,
                                   (list_to_binary([<<V2_id:32/little,
                                                      V2_b_id:32/little,
                                                      (protocol:pack(string,
                                                                     V2_b_platform))/binary,
                                                      V2_b_zone_id:16/little,
                                                      V2_base_id:32/little,
                                                      (length(V2_attr)):16/little,
                                                      (list_to_binary([<<V3_type:16/little,
                                                                         V3_name:32/little,
                                                                         V3_flag:32/little,
                                                                         V3_val:32/signed-little>>
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
                                                      (length(V2_reset_attr)):16/little,
                                                      (list_to_binary([<<V3_type:16/little,
                                                                         V3_name:32/little,
                                                                         V3_flag:32/little,
                                                                         V3_val:32/signed-little>>
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
                                                                              <- V2_reset_attr]))/binary,
                                                      (length(V2_extra)):16/little,
                                                      (list_to_binary([<<V3_name:32/little,
                                                                         V3_value:32/little,
                                                                         (protocol:pack(string,
                                                                                        V3_str))/binary>>
                                                                       || {V3_name,
                                                                           V3_value,
                                                                           V3_str}
                                                                              <- V2_extra]))/binary>>
                                                    || #child_stone{id = V2_id,
                                                                    role_id =
                                                                        {V2_b_id,
                                                                         V2_b_platform,
                                                                         V2_b_zone_id},
                                                                    base_id =
                                                                        V2_base_id,
                                                                    attr =
                                                                        V2_attr,
                                                                    reset_attr =
                                                                        V2_reset_attr,
                                                                    extra =
                                                                        V2_extra}
                                                           <- V1_stones]))/binary>>
                                 || #child{id =
                                               {V1_child_id,
                                                V1_platform,
                                                V1_zone_id},
                                           base_id = V1_base_id,
                                           stones = V1_stones}
                                        <- V0_child_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18605:16/little,
       D_a_t_a/binary>>};
pack(cli, 18606, {}) ->
    {ok, <<2:32/little, 18606:16/little>>};
pack(srv, 18606, {V0_child_list}) ->
    D_a_t_a = <<(length(V0_child_list)):16/little,
                (list_to_binary([<<V1_child_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_name_changed:32/little,
                                   V1_base_id:32/little, V1_lev:8/little,
                                   V1_hungry:8/little, V1_status:8/little,
                                   V1_follow_id:32/little,
                                   (protocol:pack(string,
                                                  V1_f_platform))/binary,
                                   V1_f_zone_id:16/little>>
                                 || #child{id =
                                               {V1_child_id,
                                                V1_platform,
                                                V1_zone_id},
                                           name = V1_name,
                                           name_changed = V1_name_changed,
                                           base_id = V1_base_id, lev = V1_lev,
                                           hungry = V1_hungry,
                                           status = V1_status,
                                           follow =
                                               {V1_follow_id,
                                                V1_f_platform,
                                                V1_f_zone_id}}
                                        <- V0_child_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18606:16/little,
       D_a_t_a/binary>>};
pack(cli, 18607, {}) ->
    {ok, <<2:32/little, 18607:16/little>>};
pack(srv, 18607, {V0_child_list}) ->
    D_a_t_a = <<(length(V0_child_list)):16/little,
                (list_to_binary([<<V1_child_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little, V1_base_id:32/little,
                                   (length(V1_talent_skills)):16/little,
                                   (list_to_binary([<<V2_id:32/little,
                                                      V2_lev:8/little,
                                                      V2_grade:8/little,
                                                      V2_exp:32/little>>
                                                    || #child_talent_skill{id =
                                                                               V2_id,
                                                                           lev =
                                                                               V2_lev,
                                                                           grade
                                                                               =
                                                                               V2_grade,
                                                                           exp =
                                                                               V2_exp}
                                                           <- V1_talent_skills]))/binary>>
                                 || #child{id =
                                               {V1_child_id,
                                                V1_platform,
                                                V1_zone_id},
                                           base_id = V1_base_id,
                                           talent_skills = V1_talent_skills}
                                        <- V0_child_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18607:16/little,
       D_a_t_a/binary>>};
pack(cli, 18608, {}) ->
    {ok, <<2:32/little, 18608:16/little>>};
pack(srv, 18608, {V0_child_list}) ->
    D_a_t_a = <<(length(V0_child_list)):16/little,
                (list_to_binary([<<V1_child_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little, V1_lev:8/little,
                                   V1_base_id:32/little, V1_study_easy:8/little,
                                   V1_study_easy_time:32/little,
                                   V1_day_easy:8/little, V1_study_hard:8/little,
                                   V1_study_hard_time:32/little,
                                   V1_day_hard:8/little, V1_free_study:8/little,
                                   V1_maturity:16/little,
                                   V1_study_str:16/little,
                                   V1_study_con:16/little,
                                   V1_study_agi:16/little,
                                   V1_study_mag:16/little,
                                   V1_study_end:16/little, V1_is_init:8/little,
                                   V1_study_str_easy:16/little,
                                   V1_study_con_easy:16/little,
                                   V1_study_agi_easy:16/little,
                                   V1_study_mag_easy:16/little,
                                   V1_study_end_easy:16/little,
                                   V1_study_str_hard:16/little,
                                   V1_study_con_hard:16/little,
                                   V1_study_agi_hard:16/little,
                                   V1_study_mag_hard:16/little,
                                   V1_study_end_hard:16/little,
                                   V1_study_str_plan_easy:16/little,
                                   V1_study_con_plan_easy:16/little,
                                   V1_study_agi_plan_easy:16/little,
                                   V1_study_mag_plan_easy:16/little,
                                   V1_study_end_plan_easy:16/little,
                                   V1_study_str_plan_hard:16/little,
                                   V1_study_con_plan_hard:16/little,
                                   V1_study_agi_plan_hard:16/little,
                                   V1_study_mag_plan_hard:16/little,
                                   V1_study_end_plan_hard:16/little>>
                                 || #child{id =
                                               {V1_child_id,
                                                V1_platform,
                                                V1_zone_id},
                                           lev = V1_lev, base_id = V1_base_id,
                                           study_easy = V1_study_easy,
                                           study_easy_time = V1_study_easy_time,
                                           day_easy = V1_day_easy,
                                           study_hard = V1_study_hard,
                                           study_hard_time = V1_study_hard_time,
                                           day_hard = V1_day_hard,
                                           free_study = V1_free_study,
                                           maturity = V1_maturity,
                                           child_attr =
                                               #child_attr{study_str =
                                                               V1_study_str,
                                                           study_con =
                                                               V1_study_con,
                                                           study_agi =
                                                               V1_study_agi,
                                                           study_mag =
                                                               V1_study_mag,
                                                           study_end =
                                                               V1_study_end},
                                           study_plan =
                                               #child_study_plan{is_init =
                                                                     V1_is_init,
                                                                 study_str_easy
                                                                     =
                                                                     V1_study_str_easy,
                                                                 study_con_easy
                                                                     =
                                                                     V1_study_con_easy,
                                                                 study_agi_easy
                                                                     =
                                                                     V1_study_agi_easy,
                                                                 study_mag_easy
                                                                     =
                                                                     V1_study_mag_easy,
                                                                 study_end_easy
                                                                     =
                                                                     V1_study_end_easy,
                                                                 study_str_hard
                                                                     =
                                                                     V1_study_str_hard,
                                                                 study_con_hard
                                                                     =
                                                                     V1_study_con_hard,
                                                                 study_agi_hard
                                                                     =
                                                                     V1_study_agi_hard,
                                                                 study_mag_hard
                                                                     =
                                                                     V1_study_mag_hard,
                                                                 study_end_hard
                                                                     =
                                                                     V1_study_end_hard,
                                                                 study_str_plan_easy
                                                                     =
                                                                     V1_study_str_plan_easy,
                                                                 study_con_plan_easy
                                                                     =
                                                                     V1_study_con_plan_easy,
                                                                 study_agi_plan_easy
                                                                     =
                                                                     V1_study_agi_plan_easy,
                                                                 study_mag_plan_easy
                                                                     =
                                                                     V1_study_mag_plan_easy,
                                                                 study_end_plan_easy
                                                                     =
                                                                     V1_study_end_plan_easy,
                                                                 study_str_plan_hard
                                                                     =
                                                                     V1_study_str_plan_hard,
                                                                 study_con_plan_hard
                                                                     =
                                                                     V1_study_con_plan_hard,
                                                                 study_agi_plan_hard
                                                                     =
                                                                     V1_study_agi_plan_hard,
                                                                 study_mag_plan_hard
                                                                     =
                                                                     V1_study_mag_plan_hard,
                                                                 study_end_plan_hard
                                                                     =
                                                                     V1_study_end_plan_hard}}
                                        <- V0_child_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18608:16/little,
       D_a_t_a/binary>>};
pack(cli, 18609, {}) ->
    {ok, <<2:32/little, 18609:16/little>>};
pack(srv, 18609, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18609:16/little,
       D_a_t_a/binary>>};
pack(cli, 18610, {}) ->
    {ok, <<2:32/little, 18610:16/little>>};
pack(srv, 18610,
     {{V0_child_id, V0_platform, V0_zone_id},
      V0_stage,
      V0_base_id,
      V0_classes,
      V0_sex,
      V0_growth,
      #child_attr{hp_aptitude = V0_hp_aptitude,
                  phy_aptitude = V0_phy_aptitude,
                  pdef_aptitude = V0_pdef_aptitude,
                  magic_aptitude = V0_magic_aptitude,
                  aspd_aptitude = V0_aspd_aptitude,
                  max_hp_aptitude = V0_max_hp_aptitude,
                  max_phy_aptitude = V0_max_phy_aptitude,
                  max_pdef_aptitude = V0_max_pdef_aptitude,
                  max_magic_aptitude = V0_max_magic_aptitude,
                  max_aspd_aptitude = V0_max_aspd_aptitude,
                  max_hp_apt_used = V0_max_hp_apt_used,
                  max_phy_apt_used = V0_max_phy_apt_used,
                  max_pdef_apt_used = V0_max_pdef_apt_used,
                  max_magic_apt_used = V0_max_magic_apt_used,
                  max_aspd_apt_used = V0_max_aspd_apt_used}}) ->
    D_a_t_a = <<V0_child_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_stage:8/little,
                V0_base_id:32/little, V0_classes:8/little,
                V0_sex:8/little, V0_growth:16/little,
                V0_hp_aptitude:16/little, V0_phy_aptitude:16/little,
                V0_pdef_aptitude:16/little, V0_magic_aptitude:16/little,
                V0_aspd_aptitude:16/little,
                V0_max_hp_aptitude:16/little,
                V0_max_phy_aptitude:16/little,
                V0_max_pdef_aptitude:16/little,
                V0_max_magic_aptitude:16/little,
                V0_max_aspd_aptitude:16/little,
                V0_max_hp_apt_used:8/little,
                V0_max_phy_apt_used:8/little,
                V0_max_pdef_apt_used:8/little,
                V0_max_magic_apt_used:8/little,
                V0_max_aspd_apt_used:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18610:16/little,
       D_a_t_a/binary>>};
pack(cli, 18611,
     {V0_id,
      V0_platform,
      V0_zone_id,
      V0_strength,
      V0_constitution,
      V0_magic,
      V0_agility,
      V0_endurance}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_strength:16/little,
                V0_constitution:16/little, V0_magic:16/little,
                V0_agility:16/little, V0_endurance:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18611:16/little,
       D_a_t_a/binary>>};
pack(srv, 18611,
     {{V0_child_id, V0_platform, V0_zone_id},
      V0_result,
      V0_msg,
      #child_attr{pre_str = V0_pre_str, pre_con = V0_pre_con,
                  pre_mag = V0_pre_mag, pre_agi = V0_pre_agi,
                  pre_end = V0_pre_end}}) ->
    D_a_t_a = <<V0_child_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_pre_str:16/little, V0_pre_con:16/little,
                V0_pre_mag:16/little, V0_pre_agi:16/little,
                V0_pre_end:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18611:16/little,
       D_a_t_a/binary>>};
pack(cli, 18612, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18612:16/little,
       D_a_t_a/binary>>};
pack(srv, 18612,
     {{V0_id, V0_platform, V0_zone_id},
      #child_attr{pre_str = V0_pre_str, pre_con = V0_pre_con,
                  pre_mag = V0_pre_mag, pre_agi = V0_pre_agi,
                  pre_end = V0_pre_end}}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_pre_str:16/little,
                V0_pre_con:16/little, V0_pre_mag:16/little,
                V0_pre_agi:16/little, V0_pre_end:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18612:16/little,
       D_a_t_a/binary>>};
pack(cli, 18616,
     {V0_id,
      V0_platform,
      V0_zone_id,
      V0_item_id,
      V0_hole_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_item_id:32/little,
                V0_hole_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18616:16/little,
       D_a_t_a/binary>>};
pack(srv, 18616, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18616:16/little,
       D_a_t_a/binary>>};
pack(cli, 18617, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18617:16/little,
       D_a_t_a/binary>>};
pack(srv, 18617,
     {V0_flag,
      V0_msg,
      {V0_child_id, V0_platform, V0_zone_id},
      V0_grade}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_child_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_grade:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18617:16/little,
       D_a_t_a/binary>>};
pack(cli, 18618,
     {V0_id, V0_platform, V0_zone_id, V0_base_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18618:16/little,
       D_a_t_a/binary>>};
pack(srv, 18618, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18618:16/little,
       D_a_t_a/binary>>};
pack(cli, 18619,
     {V0_id, V0_platform, V0_zone_id, V0_item_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_item_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18619:16/little,
       D_a_t_a/binary>>};
pack(srv, 18619, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18619:16/little,
       D_a_t_a/binary>>};
pack(cli, 18620,
     {V0_id,
      V0_platform,
      V0_zone_id,
      V0_item_base_id,
      V0_grade}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_item_base_id:32/little,
                V0_grade:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18620:16/little,
       D_a_t_a/binary>>};
pack(srv, 18620, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18620:16/little,
       D_a_t_a/binary>>};
pack(cli, 18621,
     {V0_id, V0_platform, V0_zone_id, V0_classes}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_classes:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18621:16/little,
       D_a_t_a/binary>>};
pack(srv, 18621,
     {V0_flag,
      V0_msg,
      {V0_child_id, V0_platform, V0_zone_id},
      V0_base_id,
      V0_classes}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_child_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_base_id:32/little,
                V0_classes:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18621:16/little,
       D_a_t_a/binary>>};
pack(cli, 18622,
     {V0_id, V0_platform, V0_zone_id, V0_classes_type}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_classes_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18622:16/little,
       D_a_t_a/binary>>};
pack(srv, 18622,
     {V0_flag,
      V0_msg,
      {V0_child_id, V0_platform, V0_zone_id},
      V0_classes_type}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_child_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_classes_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18622:16/little,
       D_a_t_a/binary>>};
pack(cli, 18623,
     {V0_id,
      V0_platform,
      V0_zone_id,
      V0_study_type,
      V0_study_mode}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_study_type:8/little,
                V0_study_mode:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18623:16/little,
       D_a_t_a/binary>>};
pack(srv, 18623, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18623:16/little,
       D_a_t_a/binary>>};
pack(cli, 18624,
     {V0_id, V0_platform, V0_zone_id, V0_follow}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_follow:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18624:16/little,
       D_a_t_a/binary>>};
pack(srv, 18624, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18624:16/little,
       D_a_t_a/binary>>};
pack(cli, 18625,
     {V0_id, V0_platform, V0_zone_id, V0_item_base_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_item_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18625:16/little,
       D_a_t_a/binary>>};
pack(srv, 18625, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18625:16/little,
       D_a_t_a/binary>>};
pack(cli, 18626, {}) ->
    {ok, <<2:32/little, 18626:16/little>>};
pack(srv, 18626, {V0_extra}) ->
    D_a_t_a = <<(length(V0_extra)):16/little,
                (list_to_binary([<<V1_type:32/little,
                                   V1_value:32/little>>
                                 || {V1_type, V1_value} <- V0_extra]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18626:16/little,
       D_a_t_a/binary>>};
pack(cli, 18627, {}) ->
    {ok, <<2:32/little, 18627:16/little>>};
pack(srv, 18627,
     {#m_child{fertility = V0_fertility,
               tonic = V0_tonic}}) ->
    D_a_t_a = <<V0_fertility:16/little,
                V0_tonic:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18627:16/little,
       D_a_t_a/binary>>};
pack(cli, 18628, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18628:16/little,
       D_a_t_a/binary>>};
pack(srv, 18628, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18628:16/little,
       D_a_t_a/binary>>};
pack(cli, 18629,
     {V0_id, V0_platform, V0_zone_id, V0_name}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18629:16/little,
       D_a_t_a/binary>>};
pack(srv, 18629, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18629:16/little,
       D_a_t_a/binary>>};
pack(cli, 18630, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18630:16/little,
       D_a_t_a/binary>>};
pack(srv, 18630, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18630:16/little,
       D_a_t_a/binary>>};
pack(cli, 18631, {}) ->
    {ok, <<2:32/little, 18631:16/little>>};
pack(srv, 18631,
     {{V0_child_id, V0_platform, V0_zone_id}, V0_name}) ->
    D_a_t_a = <<V0_child_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18631:16/little,
       D_a_t_a/binary>>};
pack(cli, 18632, {V0_decision}) ->
    D_a_t_a = <<V0_decision:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18632:16/little,
       D_a_t_a/binary>>};
pack(srv, 18632, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18632:16/little,
       D_a_t_a/binary>>};
pack(cli, 18633,
     {{V0_child_id, V0_platform, V0_zone_id}}) ->
    D_a_t_a = <<V0_child_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18633:16/little,
       D_a_t_a/binary>>};
pack(srv, 18633,
     {{V0_child_id, V0_platform, V0_zone_id},
      V0_combat_talk}) ->
    D_a_t_a = <<V0_child_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (length(V0_combat_talk)):16/little,
                (list_to_binary([<<V1_type:8/little,
                                   (protocol:pack(string, V1_msg))/binary>>
                                 || {V1_type, V1_msg}
                                        <- V0_combat_talk]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18633:16/little,
       D_a_t_a/binary>>};
pack(cli, 18634,
     {{V0_child_id, V0_platform, V0_zone_id},
      V0_type,
      V0_msg}) ->
    D_a_t_a = <<V0_child_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_type:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18634:16/little,
       D_a_t_a/binary>>};
pack(srv, 18634,
     {{V0_child_id, V0_platform, V0_zone_id},
      V0_result,
      V0_reason,
      V0_type,
      V0_msg}) ->
    D_a_t_a = <<V0_child_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_result:8/little,
                (protocol:pack(string, V0_reason))/binary,
                V0_type:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18634:16/little,
       D_a_t_a/binary>>};
pack(cli, 18635,
     {{V0_child_id, V0_platform, V0_zone_id},
      V0_study_str_plan_easy,
      V0_study_con_plan_easy,
      V0_study_agi_plan_easy,
      V0_study_mag_plan_easy,
      V0_study_end_plan_easy,
      V0_study_str_plan_hard,
      V0_study_con_plan_hard,
      V0_study_agi_plan_hard,
      V0_study_mag_plan_hard,
      V0_study_end_plan_hard}) ->
    D_a_t_a = <<V0_child_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_study_str_plan_easy:16/little,
                V0_study_con_plan_easy:16/little,
                V0_study_agi_plan_easy:16/little,
                V0_study_mag_plan_easy:16/little,
                V0_study_end_plan_easy:16/little,
                V0_study_str_plan_hard:16/little,
                V0_study_con_plan_hard:16/little,
                V0_study_agi_plan_hard:16/little,
                V0_study_mag_plan_hard:16/little,
                V0_study_end_plan_hard:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18635:16/little,
       D_a_t_a/binary>>};
pack(srv, 18635,
     {{V0_child_id, V0_platform, V0_zone_id},
      V0_result,
      V0_reason}) ->
    D_a_t_a = <<V0_child_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_result:8/little,
                (protocol:pack(string, V0_reason))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18635:16/little,
       D_a_t_a/binary>>};
pack(cli, 18636,
     {{V0_child_id, V0_platform, V0_zone_id}}) ->
    D_a_t_a = <<V0_child_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18636:16/little,
       D_a_t_a/binary>>};
pack(srv, 18636,
     {{V0_child_id, V0_platform, V0_zone_id},
      V0_result,
      V0_reason}) ->
    D_a_t_a = <<V0_child_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_result:8/little,
                (protocol:pack(string, V0_reason))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18636:16/little,
       D_a_t_a/binary>>};
pack(cli, 18637, {V0_type}) ->
    D_a_t_a = <<V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18637:16/little,
       D_a_t_a/binary>>};
pack(srv, 18637, {V0_type, V0_list}) ->
    D_a_t_a = <<V0_type:8/little,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:8/little, V1_sex:8/little,
                                   V1_classes:8/little,
                                   V1_classes_type:8/little,
                                   V1_base_id:32/little, V1_rank:32/little,
                                   (protocol:pack(string,
                                                  V1_father_name))/binary,
                                   V1_father_classes:8/little,
                                   (protocol:pack(string,
                                                  V1_mother_name))/binary,
                                   V1_mother_classes:32/little,
                                   V1_val1:32/little, V1_val2:32/little,
                                   V1_val3:32/little, V1_val4:32/little>>
                                 || #child_rank_rc{id =
                                                       {V1_id,
                                                        V1_platform,
                                                        V1_zone_id},
                                                   name = V1_name, lev = V1_lev,
                                                   sex = V1_sex,
                                                   classes = V1_classes,
                                                   classes_type =
                                                       V1_classes_type,
                                                   base_id = V1_base_id,
                                                   rank = V1_rank,
                                                   father_name = V1_father_name,
                                                   father_classes =
                                                       V1_father_classes,
                                                   mother_name = V1_mother_name,
                                                   mother_classes =
                                                       V1_mother_classes,
                                                   val1 = V1_val1,
                                                   val2 = V1_val2,
                                                   val3 = V1_val3,
                                                   val4 = V1_val4}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18637:16/little,
       D_a_t_a/binary>>};
pack(cli, 18638, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18638:16/little,
       D_a_t_a/binary>>};
pack(srv, 18638,
     {V0_id,
      V0_platform,
      V0_zone_id,
      #child{name = V0_name, lev = V0_lev, sex = V0_sex,
             classes = V0_classes, classes_type = V0_classes_type,
             status = V0_status, stage = V0_stage, grade = V0_grade,
             base_id = V0_base_id, embryo = V0_embryo,
             growth = V0_growth, growth_type = V0_growth_type,
             maturity = V0_maturity, hungry = V0_hungry,
             add_point = V0_add_point,
             pregnant_time = V0_pregnant_time,
             birth_time = V0_birth_time, study_easy = V0_study_easy,
             study_easy_time = V0_study_easy_time,
             day_easy = V0_day_easy, study_hard = V0_study_hard,
             study_hard_time = V0_study_hard_time,
             day_hard = V0_day_hard, talent = V0_talent, hp = V0_hp,
             mp = V0_mp, name_changed = V0_name_changed,
             follow = {V0_follow_id, V0_f_platform, V0_f_zone_id},
             parents = V0_parents,
             attr =
                 #attr{hp_max = V0_hp_max, mp_max = V0_mp_max,
                       atk_speed = V0_atk_speed, phy_dmg = V0_phy_dmg,
                       magic_dmg = V0_magic_dmg, phy_def = V0_phy_def,
                       magic_def = V0_magic_def},
             child_attr =
                 #child_attr{hp_aptitude = V0_hp_aptitude,
                             phy_aptitude = V0_phy_aptitude,
                             pdef_aptitude = V0_pdef_aptitude,
                             magic_aptitude = V0_magic_aptitude,
                             aspd_aptitude = V0_aspd_aptitude,
                             max_hp_aptitude = V0_max_hp_aptitude,
                             max_phy_aptitude = V0_max_phy_aptitude,
                             max_pdef_aptitude = V0_max_pdef_aptitude,
                             max_magic_aptitude = V0_max_magic_aptitude,
                             max_aspd_aptitude = V0_max_aspd_aptitude,
                             study_str = V0_study_str, study_con = V0_study_con,
                             study_agi = V0_study_agi, study_mag = V0_study_mag,
                             study_end = V0_study_end},
             skills = V0_skills, talent_skills = V0_talent_skills,
             stones = V0_stones}}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_lev:8/little, V0_sex:8/little, V0_classes:8/little,
                V0_classes_type:8/little, V0_status:8/little,
                V0_stage:8/little, V0_grade:8/little,
                V0_base_id:32/little, V0_embryo:8/little,
                V0_growth:16/little, V0_growth_type:8/little,
                V0_maturity:16/little, V0_hungry:8/little,
                V0_add_point:8/little, V0_pregnant_time:32/little,
                V0_birth_time:32/little, V0_study_easy:8/little,
                V0_study_easy_time:32/little, V0_day_easy:8/little,
                V0_study_hard:8/little, V0_study_hard_time:32/little,
                V0_day_hard:8/little, V0_talent:16/little,
                V0_hp:32/little, V0_mp:32/little,
                V0_name_changed:32/little, V0_follow_id:32/little,
                (protocol:pack(string, V0_f_platform))/binary,
                V0_f_zone_id:16/little, (length(V0_parents)):16/little,
                (list_to_binary([<<V1_parent_id:32/little,
                                   (protocol:pack(string,
                                                  V1_p_platform))/binary,
                                   V1_p_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
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
                                                           <- V1_looks]))/binary,
                                   V1_intimacy:32/little>>
                                 || #child_parent{id =
                                                      {V1_parent_id,
                                                       V1_p_platform,
                                                       V1_p_zone_id},
                                                  name = V1_name, sex = V1_sex,
                                                  classes = V1_classes,
                                                  looks = V1_looks,
                                                  intimacy = V1_intimacy}
                                        <- V0_parents]))/binary,
                V0_hp_max:32/little, V0_mp_max:32/little,
                V0_atk_speed:16/little, V0_phy_dmg:32/little,
                V0_magic_dmg:32/little, V0_phy_def:32/little,
                V0_magic_def:32/little, V0_hp_aptitude:16/little,
                V0_phy_aptitude:16/little, V0_pdef_aptitude:16/little,
                V0_magic_aptitude:16/little, V0_aspd_aptitude:16/little,
                V0_max_hp_aptitude:16/little,
                V0_max_phy_aptitude:16/little,
                V0_max_pdef_aptitude:16/little,
                V0_max_magic_aptitude:16/little,
                V0_max_aspd_aptitude:16/little, V0_study_str:16/little,
                V0_study_con:16/little, V0_study_agi:16/little,
                V0_study_mag:16/little, V0_study_end:16/little,
                (length(V0_skills)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_source:8/little,
                                   V1_is_open:8/little>>
                                 || #child_skill{id = V1_id, source = V1_source,
                                                 is_open = V1_is_open}
                                        <- V0_skills]))/binary,
                (length(V0_talent_skills)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_grade:8/little,
                                   V1_lev:8/little, V1_exp:32/little>>
                                 || #child_talent_skill{id = V1_id,
                                                        grade = V1_grade,
                                                        lev = V1_lev,
                                                        exp = V1_exp}
                                        <- V0_talent_skills]))/binary,
                (length(V0_stones)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_base_id:32/little,
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
                                   (length(V1_reset_attr)):16/little,
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
                                                           <- V1_reset_attr]))/binary,
                                   (length(V1_extra)):16/little,
                                   (list_to_binary([<<V2_name:32/little,
                                                      V2_value:32/little,
                                                      (protocol:pack(string,
                                                                     V2_str))/binary>>
                                                    || {V2_name,
                                                        V2_value,
                                                        V2_str}
                                                           <- V1_extra]))/binary>>
                                 || #child_stone{id = V1_id,
                                                 base_id = V1_base_id,
                                                 attr = V1_attr,
                                                 reset_attr = V1_reset_attr,
                                                 extra = V1_extra}
                                        <- V0_stones]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18638:16/little,
       D_a_t_a/binary>>};
pack(cli, 18639,
     {V0_id, V0_platform, V0_zone_id, V0_lev}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_lev:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18639:16/little,
       D_a_t_a/binary>>};
pack(srv, 18639,
     {V0_flag,
      V0_msg,
      V0_id,
      V0_platform,
      V0_zone_id,
      V0_lev}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary, V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_lev:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18639:16/little,
       D_a_t_a/binary>>};
pack(cli, 18640,
     {V0_id, V0_platform, V0_zone_id, V0_attach_pet_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_attach_pet_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18640:16/little,
       D_a_t_a/binary>>};
pack(srv, 18640, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18640:16/little,
       D_a_t_a/binary>>};
pack(cli, 18641, {V0_attach_pet_id}) ->
    D_a_t_a = <<V0_attach_pet_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18641:16/little,
       D_a_t_a/binary>>};
pack(srv, 18641, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18641:16/little,
       D_a_t_a/binary>>};
pack(cli, 18642,
     {V0_id, V0_platform, V0_zone_id, V0_skin_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_skin_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18642:16/little,
       D_a_t_a/binary>>};
pack(srv, 18642, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18642:16/little,
       D_a_t_a/binary>>};
pack(cli, 18643,
     {V0_id, V0_platform, V0_zone_id, V0_skin_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_skin_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18643:16/little,
       D_a_t_a/binary>>};
pack(srv, 18643, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 18643:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 18600, _B0) -> {ok, {}};
unpack(cli, 18600, _B0) ->
    {V1_child_nums, _B1} = protocol:uint8(_B0),
    {V1_child_list, _B159} = protocol:array(_B1,
                                            fun (_B2) ->
                                                    {V2_child_id, _B3} =
                                                        protocol:uint32(_B2),
                                                    {V2_platform, _B4} =
                                                        protocol:string(_B3),
                                                    {V2_zone_id, _B5} =
                                                        protocol:uint16(_B4),
                                                    {V2_name, _B6} =
                                                        protocol:string(_B5),
                                                    {V2_lev, _B7} =
                                                        protocol:uint8(_B6),
                                                    {V2_sex, _B8} =
                                                        protocol:uint8(_B7),
                                                    {V2_classes, _B9} =
                                                        protocol:uint8(_B8),
                                                    {V2_classes_type, _B10} =
                                                        protocol:uint8(_B9),
                                                    {V2_status, _B11} =
                                                        protocol:uint8(_B10),
                                                    {V2_stage, _B12} =
                                                        protocol:uint8(_B11),
                                                    {V2_grade, _B13} =
                                                        protocol:uint8(_B12),
                                                    {V2_base_id, _B14} =
                                                        protocol:uint32(_B13),
                                                    {V2_embryo, _B15} =
                                                        protocol:uint8(_B14),
                                                    {V2_growth, _B16} =
                                                        protocol:uint16(_B15),
                                                    {V2_growth_type, _B17} =
                                                        protocol:uint8(_B16),
                                                    {V2_maturity, _B18} =
                                                        protocol:uint16(_B17),
                                                    {V2_hungry, _B19} =
                                                        protocol:uint8(_B18),
                                                    {V2_add_point, _B20} =
                                                        protocol:uint8(_B19),
                                                    {V2_use_growth, _B21} =
                                                        protocol:uint8(_B20),
                                                    {V2_pregnant_time, _B22} =
                                                        protocol:uint32(_B21),
                                                    {V2_birth_time, _B23} =
                                                        protocol:uint32(_B22),
                                                    {V2_study_easy, _B24} =
                                                        protocol:uint8(_B23),
                                                    {V2_study_easy_time, _B25} =
                                                        protocol:uint32(_B24),
                                                    {V2_day_easy, _B26} =
                                                        protocol:uint8(_B25),
                                                    {V2_study_hard, _B27} =
                                                        protocol:uint8(_B26),
                                                    {V2_study_hard_time, _B28} =
                                                        protocol:uint32(_B27),
                                                    {V2_day_hard, _B29} =
                                                        protocol:uint8(_B28),
                                                    {V2_free_study, _B30} =
                                                        protocol:uint8(_B29),
                                                    {V2_talent, _B31} =
                                                        protocol:uint16(_B30),
                                                    {V2_hp, _B32} =
                                                        protocol:uint32(_B31),
                                                    {V2_mp, _B33} =
                                                        protocol:uint32(_B32),
                                                    {V2_name_changed, _B34} =
                                                        protocol:uint32(_B33),
                                                    {V2_follow_id, _B35} =
                                                        protocol:uint32(_B34),
                                                    {V2_f_platform, _B36} =
                                                        protocol:string(_B35),
                                                    {V2_f_zone_id, _B37} =
                                                        protocol:uint16(_B36),
                                                    {V2_parents, _B54} =
                                                        protocol:array(_B37,
                                                                       fun
                                                                           (_B38) ->
                                                                               {V3_parent_id,
                                                                                _B39} =
                                                                                   protocol:uint32(_B38),
                                                                               {V3_p_platform,
                                                                                _B40} =
                                                                                   protocol:string(_B39),
                                                                               {V3_p_zone_id,
                                                                                _B41} =
                                                                                   protocol:uint16(_B40),
                                                                               {V3_name,
                                                                                _B42} =
                                                                                   protocol:string(_B41),
                                                                               {V3_sex,
                                                                                _B43} =
                                                                                   protocol:uint8(_B42),
                                                                               {V3_classes,
                                                                                _B44} =
                                                                                   protocol:uint8(_B43),
                                                                               {V3_looks,
                                                                                _B51} =
                                                                                   protocol:array(_B44,
                                                                                                  fun
                                                                                                      (_B45) ->
                                                                                                          {V4_looks_type,
                                                                                                           _B46} =
                                                                                                              protocol:uint32(_B45),
                                                                                                          {V4_looks_mode,
                                                                                                           _B47} =
                                                                                                              protocol:uint32(_B46),
                                                                                                          {V4_looks_val,
                                                                                                           _B48} =
                                                                                                              protocol:uint32(_B47),
                                                                                                          {V4_looks_str,
                                                                                                           _B49} =
                                                                                                              protocol:string(_B48),
                                                                                                          {{V4_looks_type,
                                                                                                            V4_looks_mode,
                                                                                                            V4_looks_val,
                                                                                                            V4_looks_str},
                                                                                                           _B49}
                                                                                                  end),
                                                                               {V3_intimacy,
                                                                                _B52} =
                                                                                   protocol:uint32(_B51),
                                                                               {{V3_parent_id,
                                                                                 V3_p_platform,
                                                                                 V3_p_zone_id,
                                                                                 V3_name,
                                                                                 V3_sex,
                                                                                 V3_classes,
                                                                                 V3_looks,
                                                                                 V3_intimacy},
                                                                                _B52}
                                                                       end),
                                                    {V2_hp_max, _B55} =
                                                        protocol:uint32(_B54),
                                                    {V2_mp_max, _B56} =
                                                        protocol:uint32(_B55),
                                                    {V2_atk_speed, _B57} =
                                                        protocol:uint16(_B56),
                                                    {V2_phy_dmg, _B58} =
                                                        protocol:uint32(_B57),
                                                    {V2_magic_dmg, _B59} =
                                                        protocol:uint32(_B58),
                                                    {V2_phy_def, _B60} =
                                                        protocol:uint32(_B59),
                                                    {V2_magic_def, _B61} =
                                                        protocol:uint32(_B60),
                                                    {V2_hp_aptitude, _B62} =
                                                        protocol:uint16(_B61),
                                                    {V2_phy_aptitude, _B63} =
                                                        protocol:uint16(_B62),
                                                    {V2_pdef_aptitude, _B64} =
                                                        protocol:uint16(_B63),
                                                    {V2_magic_aptitude, _B65} =
                                                        protocol:uint16(_B64),
                                                    {V2_aspd_aptitude, _B66} =
                                                        protocol:uint16(_B65),
                                                    {V2_max_hp_aptitude, _B67} =
                                                        protocol:uint16(_B66),
                                                    {V2_max_phy_aptitude,
                                                     _B68} =
                                                        protocol:uint16(_B67),
                                                    {V2_max_pdef_aptitude,
                                                     _B69} =
                                                        protocol:uint16(_B68),
                                                    {V2_max_magic_aptitude,
                                                     _B70} =
                                                        protocol:uint16(_B69),
                                                    {V2_max_aspd_aptitude,
                                                     _B71} =
                                                        protocol:uint16(_B70),
                                                    {V2_study_str, _B72} =
                                                        protocol:uint16(_B71),
                                                    {V2_study_con, _B73} =
                                                        protocol:uint16(_B72),
                                                    {V2_study_agi, _B74} =
                                                        protocol:uint16(_B73),
                                                    {V2_study_mag, _B75} =
                                                        protocol:uint16(_B74),
                                                    {V2_study_end, _B76} =
                                                        protocol:uint16(_B75),
                                                    {V2_max_hp_apt_used, _B77} =
                                                        protocol:uint8(_B76),
                                                    {V2_max_phy_apt_used,
                                                     _B78} =
                                                        protocol:uint8(_B77),
                                                    {V2_max_pdef_apt_used,
                                                     _B79} =
                                                        protocol:uint8(_B78),
                                                    {V2_max_magic_apt_used,
                                                     _B80} =
                                                        protocol:uint8(_B79),
                                                    {V2_max_aspd_apt_used,
                                                     _B81} =
                                                        protocol:uint8(_B80),
                                                    {V2_is_init, _B82} =
                                                        protocol:uint8(_B81),
                                                    {V2_study_str_easy, _B83} =
                                                        protocol:uint16(_B82),
                                                    {V2_study_con_easy, _B84} =
                                                        protocol:uint16(_B83),
                                                    {V2_study_agi_easy, _B85} =
                                                        protocol:uint16(_B84),
                                                    {V2_study_mag_easy, _B86} =
                                                        protocol:uint16(_B85),
                                                    {V2_study_end_easy, _B87} =
                                                        protocol:uint16(_B86),
                                                    {V2_study_str_hard, _B88} =
                                                        protocol:uint16(_B87),
                                                    {V2_study_con_hard, _B89} =
                                                        protocol:uint16(_B88),
                                                    {V2_study_agi_hard, _B90} =
                                                        protocol:uint16(_B89),
                                                    {V2_study_mag_hard, _B91} =
                                                        protocol:uint16(_B90),
                                                    {V2_study_end_hard, _B92} =
                                                        protocol:uint16(_B91),
                                                    {V2_study_str_plan_easy,
                                                     _B93} =
                                                        protocol:uint16(_B92),
                                                    {V2_study_con_plan_easy,
                                                     _B94} =
                                                        protocol:uint16(_B93),
                                                    {V2_study_agi_plan_easy,
                                                     _B95} =
                                                        protocol:uint16(_B94),
                                                    {V2_study_mag_plan_easy,
                                                     _B96} =
                                                        protocol:uint16(_B95),
                                                    {V2_study_end_plan_easy,
                                                     _B97} =
                                                        protocol:uint16(_B96),
                                                    {V2_study_str_plan_hard,
                                                     _B98} =
                                                        protocol:uint16(_B97),
                                                    {V2_study_con_plan_hard,
                                                     _B99} =
                                                        protocol:uint16(_B98),
                                                    {V2_study_agi_plan_hard,
                                                     _B100} =
                                                        protocol:uint16(_B99),
                                                    {V2_study_mag_plan_hard,
                                                     _B101} =
                                                        protocol:uint16(_B100),
                                                    {V2_study_end_plan_hard,
                                                     _B102} =
                                                        protocol:uint16(_B101),
                                                    {V2_skills, _B108} =
                                                        protocol:array(_B102,
                                                                       fun
                                                                           (_B103) ->
                                                                               {V3_id,
                                                                                _B104} =
                                                                                   protocol:uint32(_B103),
                                                                               {V3_source,
                                                                                _B105} =
                                                                                   protocol:uint8(_B104),
                                                                               {V3_is_open,
                                                                                _B106} =
                                                                                   protocol:uint8(_B105),
                                                                               {{V3_id,
                                                                                 V3_source,
                                                                                 V3_is_open},
                                                                                _B106}
                                                                       end),
                                                    {V2_talent_skills, _B115} =
                                                        protocol:array(_B108,
                                                                       fun
                                                                           (_B109) ->
                                                                               {V3_id,
                                                                                _B110} =
                                                                                   protocol:uint32(_B109),
                                                                               {V3_grade,
                                                                                _B111} =
                                                                                   protocol:uint8(_B110),
                                                                               {V3_lev,
                                                                                _B112} =
                                                                                   protocol:uint8(_B111),
                                                                               {V3_exp,
                                                                                _B113} =
                                                                                   protocol:uint32(_B112),
                                                                               {{V3_id,
                                                                                 V3_grade,
                                                                                 V3_lev,
                                                                                 V3_exp},
                                                                                _B113}
                                                                       end),
                                                    {V2_stones, _B143} =
                                                        protocol:array(_B115,
                                                                       fun
                                                                           (_B116) ->
                                                                               {V3_id,
                                                                                _B117} =
                                                                                   protocol:uint32(_B116),
                                                                               {V3_b_id,
                                                                                _B118} =
                                                                                   protocol:uint32(_B117),
                                                                               {V3_b_platform,
                                                                                _B119} =
                                                                                   protocol:string(_B118),
                                                                               {V3_b_zone_id,
                                                                                _B120} =
                                                                                   protocol:uint16(_B119),
                                                                               {V3_base_id,
                                                                                _B121} =
                                                                                   protocol:uint32(_B120),
                                                                               {V3_attr,
                                                                                _B128} =
                                                                                   protocol:array(_B121,
                                                                                                  fun
                                                                                                      (_B122) ->
                                                                                                          {V4_type,
                                                                                                           _B123} =
                                                                                                              protocol:uint16(_B122),
                                                                                                          {V4_name,
                                                                                                           _B124} =
                                                                                                              protocol:uint32(_B123),
                                                                                                          {V4_flag,
                                                                                                           _B125} =
                                                                                                              protocol:uint32(_B124),
                                                                                                          {V4_val,
                                                                                                           _B126} =
                                                                                                              protocol:int32(_B125),
                                                                                                          {{V4_type,
                                                                                                            V4_name,
                                                                                                            V4_flag,
                                                                                                            V4_val},
                                                                                                           _B126}
                                                                                                  end),
                                                                               {V3_reset_attr,
                                                                                _B135} =
                                                                                   protocol:array(_B128,
                                                                                                  fun
                                                                                                      (_B129) ->
                                                                                                          {V4_type,
                                                                                                           _B130} =
                                                                                                              protocol:uint16(_B129),
                                                                                                          {V4_name,
                                                                                                           _B131} =
                                                                                                              protocol:uint32(_B130),
                                                                                                          {V4_flag,
                                                                                                           _B132} =
                                                                                                              protocol:uint32(_B131),
                                                                                                          {V4_val,
                                                                                                           _B133} =
                                                                                                              protocol:int32(_B132),
                                                                                                          {{V4_type,
                                                                                                            V4_name,
                                                                                                            V4_flag,
                                                                                                            V4_val},
                                                                                                           _B133}
                                                                                                  end),
                                                                               {V3_extra,
                                                                                _B141} =
                                                                                   protocol:array(_B135,
                                                                                                  fun
                                                                                                      (_B136) ->
                                                                                                          {V4_name,
                                                                                                           _B137} =
                                                                                                              protocol:uint32(_B136),
                                                                                                          {V4_value,
                                                                                                           _B138} =
                                                                                                              protocol:uint32(_B137),
                                                                                                          {V4_str,
                                                                                                           _B139} =
                                                                                                              protocol:string(_B138),
                                                                                                          {{V4_name,
                                                                                                            V4_value,
                                                                                                            V4_str},
                                                                                                           _B139}
                                                                                                  end),
                                                                               {{V3_id,
                                                                                 V3_b_id,
                                                                                 V3_b_platform,
                                                                                 V3_b_zone_id,
                                                                                 V3_base_id,
                                                                                 V3_attr,
                                                                                 V3_reset_attr,
                                                                                 V3_extra},
                                                                                _B141}
                                                                       end),
                                                    {V2_handbook_attr, _B148} =
                                                        protocol:array(_B143,
                                                                       fun
                                                                           (_B144) ->
                                                                               {V3_attr_name,
                                                                                _B145} =
                                                                                   protocol:uint32(_B144),
                                                                               {V3_attr_val,
                                                                                _B146} =
                                                                                   protocol:uint32(_B145),
                                                                               {{V3_attr_name,
                                                                                 V3_attr_val},
                                                                                _B146}
                                                                       end),
                                                    {V2_handbook_num, _B149} =
                                                        protocol:uint8(_B148),
                                                    {V2_star_handbook_num,
                                                     _B150} =
                                                        protocol:uint8(_B149),
                                                    {V2_spirit_attached,
                                                     _B151} =
                                                        protocol:uint8(_B150),
                                                    {V2_child_skin, _B157} =
                                                        protocol:array(_B151,
                                                                       fun
                                                                           (_B152) ->
                                                                               {V3_skin_id,
                                                                                _B153} =
                                                                                   protocol:uint32(_B152),
                                                                               {V3_skin_active_flag,
                                                                                _B154} =
                                                                                   protocol:uint8(_B153),
                                                                               {V3_expire_time,
                                                                                _B155} =
                                                                                   protocol:uint32(_B154),
                                                                               {{V3_skin_id,
                                                                                 V3_skin_active_flag,
                                                                                 V3_expire_time},
                                                                                _B155}
                                                                       end),
                                                    {{V2_child_id,
                                                      V2_platform,
                                                      V2_zone_id,
                                                      V2_name,
                                                      V2_lev,
                                                      V2_sex,
                                                      V2_classes,
                                                      V2_classes_type,
                                                      V2_status,
                                                      V2_stage,
                                                      V2_grade,
                                                      V2_base_id,
                                                      V2_embryo,
                                                      V2_growth,
                                                      V2_growth_type,
                                                      V2_maturity,
                                                      V2_hungry,
                                                      V2_add_point,
                                                      V2_use_growth,
                                                      V2_pregnant_time,
                                                      V2_birth_time,
                                                      V2_study_easy,
                                                      V2_study_easy_time,
                                                      V2_day_easy,
                                                      V2_study_hard,
                                                      V2_study_hard_time,
                                                      V2_day_hard,
                                                      V2_free_study,
                                                      V2_talent,
                                                      V2_hp,
                                                      V2_mp,
                                                      V2_name_changed,
                                                      V2_follow_id,
                                                      V2_f_platform,
                                                      V2_f_zone_id,
                                                      V2_parents,
                                                      V2_hp_max,
                                                      V2_mp_max,
                                                      V2_atk_speed,
                                                      V2_phy_dmg,
                                                      V2_magic_dmg,
                                                      V2_phy_def,
                                                      V2_magic_def,
                                                      V2_hp_aptitude,
                                                      V2_phy_aptitude,
                                                      V2_pdef_aptitude,
                                                      V2_magic_aptitude,
                                                      V2_aspd_aptitude,
                                                      V2_max_hp_aptitude,
                                                      V2_max_phy_aptitude,
                                                      V2_max_pdef_aptitude,
                                                      V2_max_magic_aptitude,
                                                      V2_max_aspd_aptitude,
                                                      V2_study_str,
                                                      V2_study_con,
                                                      V2_study_agi,
                                                      V2_study_mag,
                                                      V2_study_end,
                                                      V2_max_hp_apt_used,
                                                      V2_max_phy_apt_used,
                                                      V2_max_pdef_apt_used,
                                                      V2_max_magic_apt_used,
                                                      V2_max_aspd_apt_used,
                                                      V2_is_init,
                                                      V2_study_str_easy,
                                                      V2_study_con_easy,
                                                      V2_study_agi_easy,
                                                      V2_study_mag_easy,
                                                      V2_study_end_easy,
                                                      V2_study_str_hard,
                                                      V2_study_con_hard,
                                                      V2_study_agi_hard,
                                                      V2_study_mag_hard,
                                                      V2_study_end_hard,
                                                      V2_study_str_plan_easy,
                                                      V2_study_con_plan_easy,
                                                      V2_study_agi_plan_easy,
                                                      V2_study_mag_plan_easy,
                                                      V2_study_end_plan_easy,
                                                      V2_study_str_plan_hard,
                                                      V2_study_con_plan_hard,
                                                      V2_study_agi_plan_hard,
                                                      V2_study_mag_plan_hard,
                                                      V2_study_end_plan_hard,
                                                      V2_skills,
                                                      V2_talent_skills,
                                                      V2_stones,
                                                      V2_handbook_attr,
                                                      V2_handbook_num,
                                                      V2_star_handbook_num,
                                                      V2_spirit_attached,
                                                      V2_child_skin},
                                                     _B157}
                                            end),
    {V1_hungry_notice_lev, _B166} = protocol:array(_B159,
                                                   fun (_B160) ->
                                                           {V2_n_child_id,
                                                            _B161} =
                                                               protocol:uint32(_B160),
                                                           {V2_n_platform,
                                                            _B162} =
                                                               protocol:string(_B161),
                                                           {V2_n_zone_id,
                                                            _B163} =
                                                               protocol:uint16(_B162),
                                                           {V2_n_lev, _B164} =
                                                               protocol:uint8(_B163),
                                                           {{V2_n_child_id,
                                                             V2_n_platform,
                                                             V2_n_zone_id,
                                                             V2_n_lev},
                                                            _B164}
                                                   end),
    {ok,
     {V1_child_nums, V1_child_list, V1_hungry_notice_lev}};
unpack(srv, 18601, _B0) -> {ok, {}};
unpack(cli, 18601, _B0) ->
    {V1_child_list, _B44} = protocol:array(_B0,
                                           fun (_B1) ->
                                                   {V2_child_id, _B2} =
                                                       protocol:uint32(_B1),
                                                   {V2_platform, _B3} =
                                                       protocol:string(_B2),
                                                   {V2_zone_id, _B4} =
                                                       protocol:uint16(_B3),
                                                   {V2_name, _B5} =
                                                       protocol:string(_B4),
                                                   {V2_lev, _B6} =
                                                       protocol:uint8(_B5),
                                                   {V2_sex, _B7} =
                                                       protocol:uint8(_B6),
                                                   {V2_classes, _B8} =
                                                       protocol:uint8(_B7),
                                                   {V2_classes_type, _B9} =
                                                       protocol:uint8(_B8),
                                                   {V2_status, _B10} =
                                                       protocol:uint8(_B9),
                                                   {V2_stage, _B11} =
                                                       protocol:uint8(_B10),
                                                   {V2_grade, _B12} =
                                                       protocol:uint8(_B11),
                                                   {V2_base_id, _B13} =
                                                       protocol:uint32(_B12),
                                                   {V2_embryo, _B14} =
                                                       protocol:uint8(_B13),
                                                   {V2_growth, _B15} =
                                                       protocol:uint16(_B14),
                                                   {V2_growth_type, _B16} =
                                                       protocol:uint8(_B15),
                                                   {V2_maturity, _B17} =
                                                       protocol:uint16(_B16),
                                                   {V2_hungry, _B18} =
                                                       protocol:uint8(_B17),
                                                   {V2_add_point, _B19} =
                                                       protocol:uint8(_B18),
                                                   {V2_use_growth, _B20} =
                                                       protocol:uint8(_B19),
                                                   {V2_pregnant_time, _B21} =
                                                       protocol:uint32(_B20),
                                                   {V2_birth_time, _B22} =
                                                       protocol:uint32(_B21),
                                                   {V2_follow_id, _B23} =
                                                       protocol:uint32(_B22),
                                                   {V2_f_platform, _B24} =
                                                       protocol:string(_B23),
                                                   {V2_f_zone_id, _B25} =
                                                       protocol:uint16(_B24),
                                                   {V2_parents, _B42} =
                                                       protocol:array(_B25,
                                                                      fun
                                                                          (_B26) ->
                                                                              {V3_parent_id,
                                                                               _B27} =
                                                                                  protocol:uint32(_B26),
                                                                              {V3_p_platform,
                                                                               _B28} =
                                                                                  protocol:string(_B27),
                                                                              {V3_p_zone_id,
                                                                               _B29} =
                                                                                  protocol:uint16(_B28),
                                                                              {V3_name,
                                                                               _B30} =
                                                                                  protocol:string(_B29),
                                                                              {V3_sex,
                                                                               _B31} =
                                                                                  protocol:uint8(_B30),
                                                                              {V3_classes,
                                                                               _B32} =
                                                                                  protocol:uint8(_B31),
                                                                              {V3_looks,
                                                                               _B39} =
                                                                                  protocol:array(_B32,
                                                                                                 fun
                                                                                                     (_B33) ->
                                                                                                         {V4_looks_type,
                                                                                                          _B34} =
                                                                                                             protocol:uint32(_B33),
                                                                                                         {V4_looks_mode,
                                                                                                          _B35} =
                                                                                                             protocol:uint32(_B34),
                                                                                                         {V4_looks_val,
                                                                                                          _B36} =
                                                                                                             protocol:uint32(_B35),
                                                                                                         {V4_looks_str,
                                                                                                          _B37} =
                                                                                                             protocol:string(_B36),
                                                                                                         {{V4_looks_type,
                                                                                                           V4_looks_mode,
                                                                                                           V4_looks_val,
                                                                                                           V4_looks_str},
                                                                                                          _B37}
                                                                                                 end),
                                                                              {V3_intimacy,
                                                                               _B40} =
                                                                                  protocol:uint32(_B39),
                                                                              {{V3_parent_id,
                                                                                V3_p_platform,
                                                                                V3_p_zone_id,
                                                                                V3_name,
                                                                                V3_sex,
                                                                                V3_classes,
                                                                                V3_looks,
                                                                                V3_intimacy},
                                                                               _B40}
                                                                      end),
                                                   {{V2_child_id,
                                                     V2_platform,
                                                     V2_zone_id,
                                                     V2_name,
                                                     V2_lev,
                                                     V2_sex,
                                                     V2_classes,
                                                     V2_classes_type,
                                                     V2_status,
                                                     V2_stage,
                                                     V2_grade,
                                                     V2_base_id,
                                                     V2_embryo,
                                                     V2_growth,
                                                     V2_growth_type,
                                                     V2_maturity,
                                                     V2_hungry,
                                                     V2_add_point,
                                                     V2_use_growth,
                                                     V2_pregnant_time,
                                                     V2_birth_time,
                                                     V2_follow_id,
                                                     V2_f_platform,
                                                     V2_f_zone_id,
                                                     V2_parents},
                                                    _B42}
                                           end),
    {ok, {V1_child_list}};
unpack(srv, 18602, _B0) -> {ok, {}};
unpack(cli, 18602, _B0) ->
    {V1_abandons, _B6} = protocol:array(_B0,
                                        fun (_B1) ->
                                                {V2_id, _B2} =
                                                    protocol:uint32(_B1),
                                                {V2_platform, _B3} =
                                                    protocol:string(_B2),
                                                {V2_zone_id, _B4} =
                                                    protocol:uint16(_B3),
                                                {{V2_id,
                                                  V2_platform,
                                                  V2_zone_id},
                                                 _B4}
                                        end),
    {ok, {V1_abandons}};
unpack(srv, 18603, _B0) -> {ok, {}};
unpack(cli, 18603, _B0) ->
    {V1_child_list, _B47} = protocol:array(_B0,
                                           fun (_B1) ->
                                                   {V2_child_id, _B2} =
                                                       protocol:uint32(_B1),
                                                   {V2_platform, _B3} =
                                                       protocol:string(_B2),
                                                   {V2_zone_id, _B4} =
                                                       protocol:uint16(_B3),
                                                   {V2_name, _B5} =
                                                       protocol:string(_B4),
                                                   {V2_lev, _B6} =
                                                       protocol:uint8(_B5),
                                                   {V2_base_id, _B7} =
                                                       protocol:uint32(_B6),
                                                   {V2_grade, _B8} =
                                                       protocol:uint8(_B7),
                                                   {V2_growth, _B9} =
                                                       protocol:uint16(_B8),
                                                   {V2_growth_type, _B10} =
                                                       protocol:uint8(_B9),
                                                   {V2_add_point, _B11} =
                                                       protocol:uint8(_B10),
                                                   {V2_use_growth, _B12} =
                                                       protocol:uint8(_B11),
                                                   {V2_talent, _B13} =
                                                       protocol:uint16(_B12),
                                                   {V2_hp, _B14} =
                                                       protocol:uint32(_B13),
                                                   {V2_mp, _B15} =
                                                       protocol:uint32(_B14),
                                                   {V2_hp_max, _B16} =
                                                       protocol:uint32(_B15),
                                                   {V2_mp_max, _B17} =
                                                       protocol:uint32(_B16),
                                                   {V2_atk_speed, _B18} =
                                                       protocol:uint16(_B17),
                                                   {V2_phy_dmg, _B19} =
                                                       protocol:uint32(_B18),
                                                   {V2_magic_dmg, _B20} =
                                                       protocol:uint32(_B19),
                                                   {V2_phy_def, _B21} =
                                                       protocol:uint32(_B20),
                                                   {V2_magic_def, _B22} =
                                                       protocol:uint32(_B21),
                                                   {V2_hp_aptitude, _B23} =
                                                       protocol:uint16(_B22),
                                                   {V2_phy_aptitude, _B24} =
                                                       protocol:uint16(_B23),
                                                   {V2_pdef_aptitude, _B25} =
                                                       protocol:uint16(_B24),
                                                   {V2_magic_aptitude, _B26} =
                                                       protocol:uint16(_B25),
                                                   {V2_aspd_aptitude, _B27} =
                                                       protocol:uint16(_B26),
                                                   {V2_max_hp_aptitude, _B28} =
                                                       protocol:uint16(_B27),
                                                   {V2_max_phy_aptitude, _B29} =
                                                       protocol:uint16(_B28),
                                                   {V2_max_pdef_aptitude,
                                                    _B30} =
                                                       protocol:uint16(_B29),
                                                   {V2_max_magic_aptitude,
                                                    _B31} =
                                                       protocol:uint16(_B30),
                                                   {V2_max_aspd_aptitude,
                                                    _B32} =
                                                       protocol:uint16(_B31),
                                                   {V2_max_hp_apt_used, _B33} =
                                                       protocol:uint8(_B32),
                                                   {V2_max_phy_apt_used, _B34} =
                                                       protocol:uint8(_B33),
                                                   {V2_max_pdef_apt_used,
                                                    _B35} =
                                                       protocol:uint8(_B34),
                                                   {V2_max_magic_apt_used,
                                                    _B36} =
                                                       protocol:uint8(_B35),
                                                   {V2_max_aspd_apt_used,
                                                    _B37} =
                                                       protocol:uint8(_B36),
                                                   {V2_handbook_attr, _B42} =
                                                       protocol:array(_B37,
                                                                      fun
                                                                          (_B38) ->
                                                                              {V3_attr_name,
                                                                               _B39} =
                                                                                  protocol:uint32(_B38),
                                                                              {V3_attr_val,
                                                                               _B40} =
                                                                                  protocol:uint32(_B39),
                                                                              {{V3_attr_name,
                                                                                V3_attr_val},
                                                                               _B40}
                                                                      end),
                                                   {V2_handbook_num, _B43} =
                                                       protocol:uint8(_B42),
                                                   {V2_star_handbook_num,
                                                    _B44} =
                                                       protocol:uint8(_B43),
                                                   {V2_spirit_attached, _B45} =
                                                       protocol:uint8(_B44),
                                                   {{V2_child_id,
                                                     V2_platform,
                                                     V2_zone_id,
                                                     V2_name,
                                                     V2_lev,
                                                     V2_base_id,
                                                     V2_grade,
                                                     V2_growth,
                                                     V2_growth_type,
                                                     V2_add_point,
                                                     V2_use_growth,
                                                     V2_talent,
                                                     V2_hp,
                                                     V2_mp,
                                                     V2_hp_max,
                                                     V2_mp_max,
                                                     V2_atk_speed,
                                                     V2_phy_dmg,
                                                     V2_magic_dmg,
                                                     V2_phy_def,
                                                     V2_magic_def,
                                                     V2_hp_aptitude,
                                                     V2_phy_aptitude,
                                                     V2_pdef_aptitude,
                                                     V2_magic_aptitude,
                                                     V2_aspd_aptitude,
                                                     V2_max_hp_aptitude,
                                                     V2_max_phy_aptitude,
                                                     V2_max_pdef_aptitude,
                                                     V2_max_magic_aptitude,
                                                     V2_max_aspd_aptitude,
                                                     V2_max_hp_apt_used,
                                                     V2_max_phy_apt_used,
                                                     V2_max_pdef_apt_used,
                                                     V2_max_magic_apt_used,
                                                     V2_max_aspd_apt_used,
                                                     V2_handbook_attr,
                                                     V2_handbook_num,
                                                     V2_star_handbook_num,
                                                     V2_spirit_attached},
                                                    _B45}
                                           end),
    {ok, {V1_child_list}};
unpack(srv, 18604, _B0) -> {ok, {}};
unpack(cli, 18604, _B0) ->
    {V1_child_list, _B13} = protocol:array(_B0,
                                           fun (_B1) ->
                                                   {V2_child_id, _B2} =
                                                       protocol:uint32(_B1),
                                                   {V2_platform, _B3} =
                                                       protocol:string(_B2),
                                                   {V2_zone_id, _B4} =
                                                       protocol:uint16(_B3),
                                                   {V2_base_id, _B5} =
                                                       protocol:uint32(_B4),
                                                   {V2_skills, _B11} =
                                                       protocol:array(_B5,
                                                                      fun
                                                                          (_B6) ->
                                                                              {V3_id,
                                                                               _B7} =
                                                                                  protocol:uint32(_B6),
                                                                              {V3_source,
                                                                               _B8} =
                                                                                  protocol:uint8(_B7),
                                                                              {V3_is_open,
                                                                               _B9} =
                                                                                  protocol:uint8(_B8),
                                                                              {{V3_id,
                                                                                V3_source,
                                                                                V3_is_open},
                                                                               _B9}
                                                                      end),
                                                   {{V2_child_id,
                                                     V2_platform,
                                                     V2_zone_id,
                                                     V2_base_id,
                                                     V2_skills},
                                                    _B11}
                                           end),
    {ok, {V1_child_list}};
unpack(srv, 18605, _B0) -> {ok, {}};
unpack(cli, 18605, _B0) ->
    {V1_child_list, _B35} = protocol:array(_B0,
                                           fun (_B1) ->
                                                   {V2_child_id, _B2} =
                                                       protocol:uint32(_B1),
                                                   {V2_platform, _B3} =
                                                       protocol:string(_B2),
                                                   {V2_zone_id, _B4} =
                                                       protocol:uint16(_B3),
                                                   {V2_base_id, _B5} =
                                                       protocol:uint32(_B4),
                                                   {V2_stones, _B33} =
                                                       protocol:array(_B5,
                                                                      fun
                                                                          (_B6) ->
                                                                              {V3_id,
                                                                               _B7} =
                                                                                  protocol:uint32(_B6),
                                                                              {V3_b_id,
                                                                               _B8} =
                                                                                  protocol:uint32(_B7),
                                                                              {V3_b_platform,
                                                                               _B9} =
                                                                                  protocol:string(_B8),
                                                                              {V3_b_zone_id,
                                                                               _B10} =
                                                                                  protocol:uint16(_B9),
                                                                              {V3_base_id,
                                                                               _B11} =
                                                                                  protocol:uint32(_B10),
                                                                              {V3_attr,
                                                                               _B18} =
                                                                                  protocol:array(_B11,
                                                                                                 fun
                                                                                                     (_B12) ->
                                                                                                         {V4_type,
                                                                                                          _B13} =
                                                                                                             protocol:uint16(_B12),
                                                                                                         {V4_name,
                                                                                                          _B14} =
                                                                                                             protocol:uint32(_B13),
                                                                                                         {V4_flag,
                                                                                                          _B15} =
                                                                                                             protocol:uint32(_B14),
                                                                                                         {V4_val,
                                                                                                          _B16} =
                                                                                                             protocol:int32(_B15),
                                                                                                         {{V4_type,
                                                                                                           V4_name,
                                                                                                           V4_flag,
                                                                                                           V4_val},
                                                                                                          _B16}
                                                                                                 end),
                                                                              {V3_reset_attr,
                                                                               _B25} =
                                                                                  protocol:array(_B18,
                                                                                                 fun
                                                                                                     (_B19) ->
                                                                                                         {V4_type,
                                                                                                          _B20} =
                                                                                                             protocol:uint16(_B19),
                                                                                                         {V4_name,
                                                                                                          _B21} =
                                                                                                             protocol:uint32(_B20),
                                                                                                         {V4_flag,
                                                                                                          _B22} =
                                                                                                             protocol:uint32(_B21),
                                                                                                         {V4_val,
                                                                                                          _B23} =
                                                                                                             protocol:int32(_B22),
                                                                                                         {{V4_type,
                                                                                                           V4_name,
                                                                                                           V4_flag,
                                                                                                           V4_val},
                                                                                                          _B23}
                                                                                                 end),
                                                                              {V3_extra,
                                                                               _B31} =
                                                                                  protocol:array(_B25,
                                                                                                 fun
                                                                                                     (_B26) ->
                                                                                                         {V4_name,
                                                                                                          _B27} =
                                                                                                             protocol:uint32(_B26),
                                                                                                         {V4_value,
                                                                                                          _B28} =
                                                                                                             protocol:uint32(_B27),
                                                                                                         {V4_str,
                                                                                                          _B29} =
                                                                                                             protocol:string(_B28),
                                                                                                         {{V4_name,
                                                                                                           V4_value,
                                                                                                           V4_str},
                                                                                                          _B29}
                                                                                                 end),
                                                                              {{V3_id,
                                                                                V3_b_id,
                                                                                V3_b_platform,
                                                                                V3_b_zone_id,
                                                                                V3_base_id,
                                                                                V3_attr,
                                                                                V3_reset_attr,
                                                                                V3_extra},
                                                                               _B31}
                                                                      end),
                                                   {{V2_child_id,
                                                     V2_platform,
                                                     V2_zone_id,
                                                     V2_base_id,
                                                     V2_stones},
                                                    _B33}
                                           end),
    {ok, {V1_child_list}};
unpack(srv, 18606, _B0) -> {ok, {}};
unpack(cli, 18606, _B0) ->
    {V1_child_list, _B15} = protocol:array(_B0,
                                           fun (_B1) ->
                                                   {V2_child_id, _B2} =
                                                       protocol:uint32(_B1),
                                                   {V2_platform, _B3} =
                                                       protocol:string(_B2),
                                                   {V2_zone_id, _B4} =
                                                       protocol:uint16(_B3),
                                                   {V2_name, _B5} =
                                                       protocol:string(_B4),
                                                   {V2_name_changed, _B6} =
                                                       protocol:uint32(_B5),
                                                   {V2_base_id, _B7} =
                                                       protocol:uint32(_B6),
                                                   {V2_lev, _B8} =
                                                       protocol:uint8(_B7),
                                                   {V2_hungry, _B9} =
                                                       protocol:uint8(_B8),
                                                   {V2_status, _B10} =
                                                       protocol:uint8(_B9),
                                                   {V2_follow_id, _B11} =
                                                       protocol:uint32(_B10),
                                                   {V2_f_platform, _B12} =
                                                       protocol:string(_B11),
                                                   {V2_f_zone_id, _B13} =
                                                       protocol:uint16(_B12),
                                                   {{V2_child_id,
                                                     V2_platform,
                                                     V2_zone_id,
                                                     V2_name,
                                                     V2_name_changed,
                                                     V2_base_id,
                                                     V2_lev,
                                                     V2_hungry,
                                                     V2_status,
                                                     V2_follow_id,
                                                     V2_f_platform,
                                                     V2_f_zone_id},
                                                    _B13}
                                           end),
    {ok, {V1_child_list}};
unpack(srv, 18607, _B0) -> {ok, {}};
unpack(cli, 18607, _B0) ->
    {V1_child_list, _B14} = protocol:array(_B0,
                                           fun (_B1) ->
                                                   {V2_child_id, _B2} =
                                                       protocol:uint32(_B1),
                                                   {V2_platform, _B3} =
                                                       protocol:string(_B2),
                                                   {V2_zone_id, _B4} =
                                                       protocol:uint16(_B3),
                                                   {V2_base_id, _B5} =
                                                       protocol:uint32(_B4),
                                                   {V2_talent_skills, _B12} =
                                                       protocol:array(_B5,
                                                                      fun
                                                                          (_B6) ->
                                                                              {V3_id,
                                                                               _B7} =
                                                                                  protocol:uint32(_B6),
                                                                              {V3_lev,
                                                                               _B8} =
                                                                                  protocol:uint8(_B7),
                                                                              {V3_grade,
                                                                               _B9} =
                                                                                  protocol:uint8(_B8),
                                                                              {V3_exp,
                                                                               _B10} =
                                                                                  protocol:uint32(_B9),
                                                                              {{V3_id,
                                                                                V3_lev,
                                                                                V3_grade,
                                                                                V3_exp},
                                                                               _B10}
                                                                      end),
                                                   {{V2_child_id,
                                                     V2_platform,
                                                     V2_zone_id,
                                                     V2_base_id,
                                                     V2_talent_skills},
                                                    _B12}
                                           end),
    {ok, {V1_child_list}};
unpack(srv, 18608, _B0) -> {ok, {}};
unpack(cli, 18608, _B0) ->
    {V1_child_list, _B42} = protocol:array(_B0,
                                           fun (_B1) ->
                                                   {V2_child_id, _B2} =
                                                       protocol:uint32(_B1),
                                                   {V2_platform, _B3} =
                                                       protocol:string(_B2),
                                                   {V2_zone_id, _B4} =
                                                       protocol:uint16(_B3),
                                                   {V2_lev, _B5} =
                                                       protocol:uint8(_B4),
                                                   {V2_base_id, _B6} =
                                                       protocol:uint32(_B5),
                                                   {V2_study_easy, _B7} =
                                                       protocol:uint8(_B6),
                                                   {V2_study_easy_time, _B8} =
                                                       protocol:uint32(_B7),
                                                   {V2_day_easy, _B9} =
                                                       protocol:uint8(_B8),
                                                   {V2_study_hard, _B10} =
                                                       protocol:uint8(_B9),
                                                   {V2_study_hard_time, _B11} =
                                                       protocol:uint32(_B10),
                                                   {V2_day_hard, _B12} =
                                                       protocol:uint8(_B11),
                                                   {V2_free_study, _B13} =
                                                       protocol:uint8(_B12),
                                                   {V2_maturity, _B14} =
                                                       protocol:uint16(_B13),
                                                   {V2_study_str, _B15} =
                                                       protocol:uint16(_B14),
                                                   {V2_study_con, _B16} =
                                                       protocol:uint16(_B15),
                                                   {V2_study_agi, _B17} =
                                                       protocol:uint16(_B16),
                                                   {V2_study_mag, _B18} =
                                                       protocol:uint16(_B17),
                                                   {V2_study_end, _B19} =
                                                       protocol:uint16(_B18),
                                                   {V2_is_init, _B20} =
                                                       protocol:uint8(_B19),
                                                   {V2_study_str_easy, _B21} =
                                                       protocol:uint16(_B20),
                                                   {V2_study_con_easy, _B22} =
                                                       protocol:uint16(_B21),
                                                   {V2_study_agi_easy, _B23} =
                                                       protocol:uint16(_B22),
                                                   {V2_study_mag_easy, _B24} =
                                                       protocol:uint16(_B23),
                                                   {V2_study_end_easy, _B25} =
                                                       protocol:uint16(_B24),
                                                   {V2_study_str_hard, _B26} =
                                                       protocol:uint16(_B25),
                                                   {V2_study_con_hard, _B27} =
                                                       protocol:uint16(_B26),
                                                   {V2_study_agi_hard, _B28} =
                                                       protocol:uint16(_B27),
                                                   {V2_study_mag_hard, _B29} =
                                                       protocol:uint16(_B28),
                                                   {V2_study_end_hard, _B30} =
                                                       protocol:uint16(_B29),
                                                   {V2_study_str_plan_easy,
                                                    _B31} =
                                                       protocol:uint16(_B30),
                                                   {V2_study_con_plan_easy,
                                                    _B32} =
                                                       protocol:uint16(_B31),
                                                   {V2_study_agi_plan_easy,
                                                    _B33} =
                                                       protocol:uint16(_B32),
                                                   {V2_study_mag_plan_easy,
                                                    _B34} =
                                                       protocol:uint16(_B33),
                                                   {V2_study_end_plan_easy,
                                                    _B35} =
                                                       protocol:uint16(_B34),
                                                   {V2_study_str_plan_hard,
                                                    _B36} =
                                                       protocol:uint16(_B35),
                                                   {V2_study_con_plan_hard,
                                                    _B37} =
                                                       protocol:uint16(_B36),
                                                   {V2_study_agi_plan_hard,
                                                    _B38} =
                                                       protocol:uint16(_B37),
                                                   {V2_study_mag_plan_hard,
                                                    _B39} =
                                                       protocol:uint16(_B38),
                                                   {V2_study_end_plan_hard,
                                                    _B40} =
                                                       protocol:uint16(_B39),
                                                   {{V2_child_id,
                                                     V2_platform,
                                                     V2_zone_id,
                                                     V2_lev,
                                                     V2_base_id,
                                                     V2_study_easy,
                                                     V2_study_easy_time,
                                                     V2_day_easy,
                                                     V2_study_hard,
                                                     V2_study_hard_time,
                                                     V2_day_hard,
                                                     V2_free_study,
                                                     V2_maturity,
                                                     V2_study_str,
                                                     V2_study_con,
                                                     V2_study_agi,
                                                     V2_study_mag,
                                                     V2_study_end,
                                                     V2_is_init,
                                                     V2_study_str_easy,
                                                     V2_study_con_easy,
                                                     V2_study_agi_easy,
                                                     V2_study_mag_easy,
                                                     V2_study_end_easy,
                                                     V2_study_str_hard,
                                                     V2_study_con_hard,
                                                     V2_study_agi_hard,
                                                     V2_study_mag_hard,
                                                     V2_study_end_hard,
                                                     V2_study_str_plan_easy,
                                                     V2_study_con_plan_easy,
                                                     V2_study_agi_plan_easy,
                                                     V2_study_mag_plan_easy,
                                                     V2_study_end_plan_easy,
                                                     V2_study_str_plan_hard,
                                                     V2_study_con_plan_hard,
                                                     V2_study_agi_plan_hard,
                                                     V2_study_mag_plan_hard,
                                                     V2_study_end_plan_hard},
                                                    _B40}
                                           end),
    {ok, {V1_child_list}};
unpack(srv, 18609, _B0) -> {ok, {}};
unpack(cli, 18609, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 18610, _B0) -> {ok, {}};
unpack(cli, 18610, _B0) ->
    {V1_child_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_stage, _B4} = protocol:uint8(_B3),
    {V1_base_id, _B5} = protocol:uint32(_B4),
    {V1_classes, _B6} = protocol:uint8(_B5),
    {V1_sex, _B7} = protocol:uint8(_B6),
    {V1_growth, _B8} = protocol:uint16(_B7),
    {V1_hp_aptitude, _B9} = protocol:uint16(_B8),
    {V1_phy_aptitude, _B10} = protocol:uint16(_B9),
    {V1_pdef_aptitude, _B11} = protocol:uint16(_B10),
    {V1_magic_aptitude, _B12} = protocol:uint16(_B11),
    {V1_aspd_aptitude, _B13} = protocol:uint16(_B12),
    {V1_max_hp_aptitude, _B14} = protocol:uint16(_B13),
    {V1_max_phy_aptitude, _B15} = protocol:uint16(_B14),
    {V1_max_pdef_aptitude, _B16} = protocol:uint16(_B15),
    {V1_max_magic_aptitude, _B17} = protocol:uint16(_B16),
    {V1_max_aspd_aptitude, _B18} = protocol:uint16(_B17),
    {V1_max_hp_apt_used, _B19} = protocol:uint8(_B18),
    {V1_max_phy_apt_used, _B20} = protocol:uint8(_B19),
    {V1_max_pdef_apt_used, _B21} = protocol:uint8(_B20),
    {V1_max_magic_apt_used, _B22} = protocol:uint8(_B21),
    {V1_max_aspd_apt_used, _B23} = protocol:uint8(_B22),
    {ok,
     {V1_child_id,
      V1_platform,
      V1_zone_id,
      V1_stage,
      V1_base_id,
      V1_classes,
      V1_sex,
      V1_growth,
      V1_hp_aptitude,
      V1_phy_aptitude,
      V1_pdef_aptitude,
      V1_magic_aptitude,
      V1_aspd_aptitude,
      V1_max_hp_aptitude,
      V1_max_phy_aptitude,
      V1_max_pdef_aptitude,
      V1_max_magic_aptitude,
      V1_max_aspd_aptitude,
      V1_max_hp_apt_used,
      V1_max_phy_apt_used,
      V1_max_pdef_apt_used,
      V1_max_magic_apt_used,
      V1_max_aspd_apt_used}};
unpack(srv, 18611, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_strength, _B4} = protocol:uint16(_B3),
    {V1_constitution, _B5} = protocol:uint16(_B4),
    {V1_magic, _B6} = protocol:uint16(_B5),
    {V1_agility, _B7} = protocol:uint16(_B6),
    {V1_endurance, _B8} = protocol:uint16(_B7),
    {ok,
     {V1_id,
      V1_platform,
      V1_zone_id,
      V1_strength,
      V1_constitution,
      V1_magic,
      V1_agility,
      V1_endurance}};
unpack(cli, 18611, _B0) ->
    {V1_child_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_result, _B4} = protocol:uint8(_B3),
    {V1_msg, _B5} = protocol:string(_B4),
    {V1_pre_str, _B6} = protocol:uint16(_B5),
    {V1_pre_con, _B7} = protocol:uint16(_B6),
    {V1_pre_mag, _B8} = protocol:uint16(_B7),
    {V1_pre_agi, _B9} = protocol:uint16(_B8),
    {V1_pre_end, _B10} = protocol:uint16(_B9),
    {ok,
     {V1_child_id,
      V1_platform,
      V1_zone_id,
      V1_result,
      V1_msg,
      V1_pre_str,
      V1_pre_con,
      V1_pre_mag,
      V1_pre_agi,
      V1_pre_end}};
unpack(srv, 18612, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 18612, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_pre_str, _B4} = protocol:uint16(_B3),
    {V1_pre_con, _B5} = protocol:uint16(_B4),
    {V1_pre_mag, _B6} = protocol:uint16(_B5),
    {V1_pre_agi, _B7} = protocol:uint16(_B6),
    {V1_pre_end, _B8} = protocol:uint16(_B7),
    {ok,
     {V1_id,
      V1_platform,
      V1_zone_id,
      V1_pre_str,
      V1_pre_con,
      V1_pre_mag,
      V1_pre_agi,
      V1_pre_end}};
unpack(srv, 18616, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_item_id, _B4} = protocol:uint32(_B3),
    {V1_hole_id, _B5} = protocol:uint8(_B4),
    {ok,
     {V1_id,
      V1_platform,
      V1_zone_id,
      V1_item_id,
      V1_hole_id}};
unpack(cli, 18616, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 18617, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 18617, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_child_id, _B3} = protocol:uint32(_B2),
    {V1_platform, _B4} = protocol:string(_B3),
    {V1_zone_id, _B5} = protocol:uint16(_B4),
    {V1_grade, _B6} = protocol:uint8(_B5),
    {ok,
     {V1_flag,
      V1_msg,
      V1_child_id,
      V1_platform,
      V1_zone_id,
      V1_grade}};
unpack(srv, 18618, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_base_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_id, V1_platform, V1_zone_id, V1_base_id}};
unpack(cli, 18618, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 18619, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_item_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_id, V1_platform, V1_zone_id, V1_item_id}};
unpack(cli, 18619, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 18620, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_item_base_id, _B4} = protocol:uint32(_B3),
    {V1_grade, _B5} = protocol:uint8(_B4),
    {ok,
     {V1_id,
      V1_platform,
      V1_zone_id,
      V1_item_base_id,
      V1_grade}};
unpack(cli, 18620, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 18621, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_classes, _B4} = protocol:uint8(_B3),
    {ok, {V1_id, V1_platform, V1_zone_id, V1_classes}};
unpack(cli, 18621, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_child_id, _B3} = protocol:uint32(_B2),
    {V1_platform, _B4} = protocol:string(_B3),
    {V1_zone_id, _B5} = protocol:uint16(_B4),
    {V1_base_id, _B6} = protocol:uint32(_B5),
    {V1_classes, _B7} = protocol:uint8(_B6),
    {ok,
     {V1_flag,
      V1_msg,
      V1_child_id,
      V1_platform,
      V1_zone_id,
      V1_base_id,
      V1_classes}};
unpack(srv, 18622, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_classes_type, _B4} = protocol:uint8(_B3),
    {ok, {V1_id, V1_platform, V1_zone_id, V1_classes_type}};
unpack(cli, 18622, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_child_id, _B3} = protocol:uint32(_B2),
    {V1_platform, _B4} = protocol:string(_B3),
    {V1_zone_id, _B5} = protocol:uint16(_B4),
    {V1_classes_type, _B6} = protocol:uint8(_B5),
    {ok,
     {V1_flag,
      V1_msg,
      V1_child_id,
      V1_platform,
      V1_zone_id,
      V1_classes_type}};
unpack(srv, 18623, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_study_type, _B4} = protocol:uint8(_B3),
    {V1_study_mode, _B5} = protocol:uint8(_B4),
    {ok,
     {V1_id,
      V1_platform,
      V1_zone_id,
      V1_study_type,
      V1_study_mode}};
unpack(cli, 18623, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 18624, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_follow, _B4} = protocol:uint8(_B3),
    {ok, {V1_id, V1_platform, V1_zone_id, V1_follow}};
unpack(cli, 18624, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 18625, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_item_base_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_id, V1_platform, V1_zone_id, V1_item_base_id}};
unpack(cli, 18625, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 18626, _B0) -> {ok, {}};
unpack(cli, 18626, _B0) ->
    {V1_extra, _B5} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_type, _B2} =
                                                 protocol:uint32(_B1),
                                             {V2_value, _B3} =
                                                 protocol:uint32(_B2),
                                             {{V2_type, V2_value}, _B3}
                                     end),
    {ok, {V1_extra}};
unpack(srv, 18627, _B0) -> {ok, {}};
unpack(cli, 18627, _B0) ->
    {V1_fertility, _B1} = protocol:uint16(_B0),
    {V1_tonic, _B2} = protocol:uint16(_B1),
    {ok, {V1_fertility, V1_tonic}};
unpack(srv, 18628, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 18628, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 18629, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {ok, {V1_id, V1_platform, V1_zone_id, V1_name}};
unpack(cli, 18629, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 18630, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 18630, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 18631, _B0) -> {ok, {}};
unpack(cli, 18631, _B0) ->
    {V1_child_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {ok, {V1_child_id, V1_platform, V1_zone_id, V1_name}};
unpack(srv, 18632, _B0) ->
    {V1_decision, _B1} = protocol:uint8(_B0),
    {ok, {V1_decision}};
unpack(cli, 18632, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 18633, _B0) ->
    {V1_child_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_child_id, V1_platform, V1_zone_id}};
unpack(cli, 18633, _B0) ->
    {V1_child_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_combat_talk, _B8} = protocol:array(_B3,
                                           fun (_B4) ->
                                                   {V2_type, _B5} =
                                                       protocol:uint8(_B4),
                                                   {V2_msg, _B6} =
                                                       protocol:string(_B5),
                                                   {{V2_type, V2_msg}, _B6}
                                           end),
    {ok,
     {V1_child_id, V1_platform, V1_zone_id, V1_combat_talk}};
unpack(srv, 18634, _B0) ->
    {V1_child_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_type, _B4} = protocol:uint8(_B3),
    {V1_msg, _B5} = protocol:string(_B4),
    {ok,
     {V1_child_id,
      V1_platform,
      V1_zone_id,
      V1_type,
      V1_msg}};
unpack(cli, 18634, _B0) ->
    {V1_child_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_result, _B4} = protocol:uint8(_B3),
    {V1_reason, _B5} = protocol:string(_B4),
    {V1_type, _B6} = protocol:uint8(_B5),
    {V1_msg, _B7} = protocol:string(_B6),
    {ok,
     {V1_child_id,
      V1_platform,
      V1_zone_id,
      V1_result,
      V1_reason,
      V1_type,
      V1_msg}};
unpack(srv, 18635, _B0) ->
    {V1_child_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_study_str_plan_easy, _B4} = protocol:uint16(_B3),
    {V1_study_con_plan_easy, _B5} = protocol:uint16(_B4),
    {V1_study_agi_plan_easy, _B6} = protocol:uint16(_B5),
    {V1_study_mag_plan_easy, _B7} = protocol:uint16(_B6),
    {V1_study_end_plan_easy, _B8} = protocol:uint16(_B7),
    {V1_study_str_plan_hard, _B9} = protocol:uint16(_B8),
    {V1_study_con_plan_hard, _B10} = protocol:uint16(_B9),
    {V1_study_agi_plan_hard, _B11} = protocol:uint16(_B10),
    {V1_study_mag_plan_hard, _B12} = protocol:uint16(_B11),
    {V1_study_end_plan_hard, _B13} = protocol:uint16(_B12),
    {ok,
     {V1_child_id,
      V1_platform,
      V1_zone_id,
      V1_study_str_plan_easy,
      V1_study_con_plan_easy,
      V1_study_agi_plan_easy,
      V1_study_mag_plan_easy,
      V1_study_end_plan_easy,
      V1_study_str_plan_hard,
      V1_study_con_plan_hard,
      V1_study_agi_plan_hard,
      V1_study_mag_plan_hard,
      V1_study_end_plan_hard}};
unpack(cli, 18635, _B0) ->
    {V1_child_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_result, _B4} = protocol:uint8(_B3),
    {V1_reason, _B5} = protocol:string(_B4),
    {ok,
     {V1_child_id,
      V1_platform,
      V1_zone_id,
      V1_result,
      V1_reason}};
unpack(srv, 18636, _B0) ->
    {V1_child_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_child_id, V1_platform, V1_zone_id}};
unpack(cli, 18636, _B0) ->
    {V1_child_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_result, _B4} = protocol:uint8(_B3),
    {V1_reason, _B5} = protocol:string(_B4),
    {ok,
     {V1_child_id,
      V1_platform,
      V1_zone_id,
      V1_result,
      V1_reason}};
unpack(srv, 18637, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_type}};
unpack(cli, 18637, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_list, _B22} = protocol:array(_B1,
                                     fun (_B2) ->
                                             {V2_id, _B3} =
                                                 protocol:uint32(_B2),
                                             {V2_platform, _B4} =
                                                 protocol:string(_B3),
                                             {V2_zone_id, _B5} =
                                                 protocol:uint32(_B4),
                                             {V2_name, _B6} =
                                                 protocol:string(_B5),
                                             {V2_lev, _B7} =
                                                 protocol:uint8(_B6),
                                             {V2_sex, _B8} =
                                                 protocol:uint8(_B7),
                                             {V2_classes, _B9} =
                                                 protocol:uint8(_B8),
                                             {V2_classes_type, _B10} =
                                                 protocol:uint8(_B9),
                                             {V2_base_id, _B11} =
                                                 protocol:uint32(_B10),
                                             {V2_rank, _B12} =
                                                 protocol:uint32(_B11),
                                             {V2_father_name, _B13} =
                                                 protocol:string(_B12),
                                             {V2_father_classes, _B14} =
                                                 protocol:uint8(_B13),
                                             {V2_mother_name, _B15} =
                                                 protocol:string(_B14),
                                             {V2_mother_classes, _B16} =
                                                 protocol:uint32(_B15),
                                             {V2_val1, _B17} =
                                                 protocol:uint32(_B16),
                                             {V2_val2, _B18} =
                                                 protocol:uint32(_B17),
                                             {V2_val3, _B19} =
                                                 protocol:uint32(_B18),
                                             {V2_val4, _B20} =
                                                 protocol:uint32(_B19),
                                             {{V2_id,
                                               V2_platform,
                                               V2_zone_id,
                                               V2_name,
                                               V2_lev,
                                               V2_sex,
                                               V2_classes,
                                               V2_classes_type,
                                               V2_base_id,
                                               V2_rank,
                                               V2_father_name,
                                               V2_father_classes,
                                               V2_mother_name,
                                               V2_mother_classes,
                                               V2_val1,
                                               V2_val2,
                                               V2_val3,
                                               V2_val4},
                                              _B20}
                                     end),
    {ok, {V1_type, V1_list}};
unpack(srv, 18638, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 18638, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_lev, _B5} = protocol:uint8(_B4),
    {V1_sex, _B6} = protocol:uint8(_B5),
    {V1_classes, _B7} = protocol:uint8(_B6),
    {V1_classes_type, _B8} = protocol:uint8(_B7),
    {V1_status, _B9} = protocol:uint8(_B8),
    {V1_stage, _B10} = protocol:uint8(_B9),
    {V1_grade, _B11} = protocol:uint8(_B10),
    {V1_base_id, _B12} = protocol:uint32(_B11),
    {V1_embryo, _B13} = protocol:uint8(_B12),
    {V1_growth, _B14} = protocol:uint16(_B13),
    {V1_growth_type, _B15} = protocol:uint8(_B14),
    {V1_maturity, _B16} = protocol:uint16(_B15),
    {V1_hungry, _B17} = protocol:uint8(_B16),
    {V1_add_point, _B18} = protocol:uint8(_B17),
    {V1_pregnant_time, _B19} = protocol:uint32(_B18),
    {V1_birth_time, _B20} = protocol:uint32(_B19),
    {V1_study_easy, _B21} = protocol:uint8(_B20),
    {V1_study_easy_time, _B22} = protocol:uint32(_B21),
    {V1_day_easy, _B23} = protocol:uint8(_B22),
    {V1_study_hard, _B24} = protocol:uint8(_B23),
    {V1_study_hard_time, _B25} = protocol:uint32(_B24),
    {V1_day_hard, _B26} = protocol:uint8(_B25),
    {V1_talent, _B27} = protocol:uint16(_B26),
    {V1_hp, _B28} = protocol:uint32(_B27),
    {V1_mp, _B29} = protocol:uint32(_B28),
    {V1_name_changed, _B30} = protocol:uint32(_B29),
    {V1_follow_id, _B31} = protocol:uint32(_B30),
    {V1_f_platform, _B32} = protocol:string(_B31),
    {V1_f_zone_id, _B33} = protocol:uint16(_B32),
    {V1_parents, _B50} = protocol:array(_B33,
                                        fun (_B34) ->
                                                {V2_parent_id, _B35} =
                                                    protocol:uint32(_B34),
                                                {V2_p_platform, _B36} =
                                                    protocol:string(_B35),
                                                {V2_p_zone_id, _B37} =
                                                    protocol:uint16(_B36),
                                                {V2_name, _B38} =
                                                    protocol:string(_B37),
                                                {V2_sex, _B39} =
                                                    protocol:uint8(_B38),
                                                {V2_classes, _B40} =
                                                    protocol:uint8(_B39),
                                                {V2_looks, _B47} =
                                                    protocol:array(_B40,
                                                                   fun (_B41) ->
                                                                           {V3_looks_type,
                                                                            _B42} =
                                                                               protocol:uint32(_B41),
                                                                           {V3_looks_mode,
                                                                            _B43} =
                                                                               protocol:uint32(_B42),
                                                                           {V3_looks_val,
                                                                            _B44} =
                                                                               protocol:uint32(_B43),
                                                                           {V3_looks_str,
                                                                            _B45} =
                                                                               protocol:string(_B44),
                                                                           {{V3_looks_type,
                                                                             V3_looks_mode,
                                                                             V3_looks_val,
                                                                             V3_looks_str},
                                                                            _B45}
                                                                   end),
                                                {V2_intimacy, _B48} =
                                                    protocol:uint32(_B47),
                                                {{V2_parent_id,
                                                  V2_p_platform,
                                                  V2_p_zone_id,
                                                  V2_name,
                                                  V2_sex,
                                                  V2_classes,
                                                  V2_looks,
                                                  V2_intimacy},
                                                 _B48}
                                        end),
    {V1_hp_max, _B51} = protocol:uint32(_B50),
    {V1_mp_max, _B52} = protocol:uint32(_B51),
    {V1_atk_speed, _B53} = protocol:uint16(_B52),
    {V1_phy_dmg, _B54} = protocol:uint32(_B53),
    {V1_magic_dmg, _B55} = protocol:uint32(_B54),
    {V1_phy_def, _B56} = protocol:uint32(_B55),
    {V1_magic_def, _B57} = protocol:uint32(_B56),
    {V1_hp_aptitude, _B58} = protocol:uint16(_B57),
    {V1_phy_aptitude, _B59} = protocol:uint16(_B58),
    {V1_pdef_aptitude, _B60} = protocol:uint16(_B59),
    {V1_magic_aptitude, _B61} = protocol:uint16(_B60),
    {V1_aspd_aptitude, _B62} = protocol:uint16(_B61),
    {V1_max_hp_aptitude, _B63} = protocol:uint16(_B62),
    {V1_max_phy_aptitude, _B64} = protocol:uint16(_B63),
    {V1_max_pdef_aptitude, _B65} = protocol:uint16(_B64),
    {V1_max_magic_aptitude, _B66} = protocol:uint16(_B65),
    {V1_max_aspd_aptitude, _B67} = protocol:uint16(_B66),
    {V1_study_str, _B68} = protocol:uint16(_B67),
    {V1_study_con, _B69} = protocol:uint16(_B68),
    {V1_study_agi, _B70} = protocol:uint16(_B69),
    {V1_study_mag, _B71} = protocol:uint16(_B70),
    {V1_study_end, _B72} = protocol:uint16(_B71),
    {V1_skills, _B78} = protocol:array(_B72,
                                       fun (_B73) ->
                                               {V2_id, _B74} =
                                                   protocol:uint32(_B73),
                                               {V2_source, _B75} =
                                                   protocol:uint8(_B74),
                                               {V2_is_open, _B76} =
                                                   protocol:uint8(_B75),
                                               {{V2_id, V2_source, V2_is_open},
                                                _B76}
                                       end),
    {V1_talent_skills, _B85} = protocol:array(_B78,
                                              fun (_B79) ->
                                                      {V2_id, _B80} =
                                                          protocol:uint32(_B79),
                                                      {V2_grade, _B81} =
                                                          protocol:uint8(_B80),
                                                      {V2_lev, _B82} =
                                                          protocol:uint8(_B81),
                                                      {V2_exp, _B83} =
                                                          protocol:uint32(_B82),
                                                      {{V2_id,
                                                        V2_grade,
                                                        V2_lev,
                                                        V2_exp},
                                                       _B83}
                                              end),
    {V1_stones, _B110} = protocol:array(_B85,
                                        fun (_B86) ->
                                                {V2_id, _B87} =
                                                    protocol:uint32(_B86),
                                                {V2_base_id, _B88} =
                                                    protocol:uint32(_B87),
                                                {V2_attr, _B95} =
                                                    protocol:array(_B88,
                                                                   fun (_B89) ->
                                                                           {V3_type,
                                                                            _B90} =
                                                                               protocol:uint16(_B89),
                                                                           {V3_name,
                                                                            _B91} =
                                                                               protocol:uint32(_B90),
                                                                           {V3_flag,
                                                                            _B92} =
                                                                               protocol:uint32(_B91),
                                                                           {V3_val,
                                                                            _B93} =
                                                                               protocol:int32(_B92),
                                                                           {{V3_type,
                                                                             V3_name,
                                                                             V3_flag,
                                                                             V3_val},
                                                                            _B93}
                                                                   end),
                                                {V2_reset_attr, _B102} =
                                                    protocol:array(_B95,
                                                                   fun (_B96) ->
                                                                           {V3_type,
                                                                            _B97} =
                                                                               protocol:uint16(_B96),
                                                                           {V3_name,
                                                                            _B98} =
                                                                               protocol:uint32(_B97),
                                                                           {V3_flag,
                                                                            _B99} =
                                                                               protocol:uint32(_B98),
                                                                           {V3_val,
                                                                            _B100} =
                                                                               protocol:int32(_B99),
                                                                           {{V3_type,
                                                                             V3_name,
                                                                             V3_flag,
                                                                             V3_val},
                                                                            _B100}
                                                                   end),
                                                {V2_extra, _B108} =
                                                    protocol:array(_B102,
                                                                   fun
                                                                       (_B103) ->
                                                                           {V3_name,
                                                                            _B104} =
                                                                               protocol:uint32(_B103),
                                                                           {V3_value,
                                                                            _B105} =
                                                                               protocol:uint32(_B104),
                                                                           {V3_str,
                                                                            _B106} =
                                                                               protocol:string(_B105),
                                                                           {{V3_name,
                                                                             V3_value,
                                                                             V3_str},
                                                                            _B106}
                                                                   end),
                                                {{V2_id,
                                                  V2_base_id,
                                                  V2_attr,
                                                  V2_reset_attr,
                                                  V2_extra},
                                                 _B108}
                                        end),
    {ok,
     {V1_id,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_lev,
      V1_sex,
      V1_classes,
      V1_classes_type,
      V1_status,
      V1_stage,
      V1_grade,
      V1_base_id,
      V1_embryo,
      V1_growth,
      V1_growth_type,
      V1_maturity,
      V1_hungry,
      V1_add_point,
      V1_pregnant_time,
      V1_birth_time,
      V1_study_easy,
      V1_study_easy_time,
      V1_day_easy,
      V1_study_hard,
      V1_study_hard_time,
      V1_day_hard,
      V1_talent,
      V1_hp,
      V1_mp,
      V1_name_changed,
      V1_follow_id,
      V1_f_platform,
      V1_f_zone_id,
      V1_parents,
      V1_hp_max,
      V1_mp_max,
      V1_atk_speed,
      V1_phy_dmg,
      V1_magic_dmg,
      V1_phy_def,
      V1_magic_def,
      V1_hp_aptitude,
      V1_phy_aptitude,
      V1_pdef_aptitude,
      V1_magic_aptitude,
      V1_aspd_aptitude,
      V1_max_hp_aptitude,
      V1_max_phy_aptitude,
      V1_max_pdef_aptitude,
      V1_max_magic_aptitude,
      V1_max_aspd_aptitude,
      V1_study_str,
      V1_study_con,
      V1_study_agi,
      V1_study_mag,
      V1_study_end,
      V1_skills,
      V1_talent_skills,
      V1_stones}};
unpack(srv, 18639, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_lev, _B4} = protocol:uint8(_B3),
    {ok, {V1_id, V1_platform, V1_zone_id, V1_lev}};
unpack(cli, 18639, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {V1_platform, _B4} = protocol:string(_B3),
    {V1_zone_id, _B5} = protocol:uint16(_B4),
    {V1_lev, _B6} = protocol:uint8(_B5),
    {ok,
     {V1_flag,
      V1_msg,
      V1_id,
      V1_platform,
      V1_zone_id,
      V1_lev}};
unpack(srv, 18640, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_attach_pet_id, _B4} = protocol:uint32(_B3),
    {ok,
     {V1_id, V1_platform, V1_zone_id, V1_attach_pet_id}};
unpack(cli, 18640, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 18641, _B0) ->
    {V1_attach_pet_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_attach_pet_id}};
unpack(cli, 18641, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 18642, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_skin_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_id, V1_platform, V1_zone_id, V1_skin_id}};
unpack(cli, 18642, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 18643, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_skin_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_id, V1_platform, V1_zone_id, V1_skin_id}};
unpack(cli, 18643, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

