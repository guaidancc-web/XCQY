-file("src/data/child_data.erl", 1).

-module(child_data).

-export([get_base/1,
         get_base_attr/1,
         get_apti_ratio/1,
         get_point_attr/1,
         get_exp/1,
         get_stone/1,
         get_grade/1,
         allow_stone/1,
         get_grade_loss/1,
         get_add_apt/1,
         get_add_max_apt/1,
         get_stage/1,
         get_pregnant_rate/1,
         allow_skills/0,
         get_growth_type/1,
         get_growth_val/1,
         get_apt_ratio/1,
         get_study/1,
         get_base_id/1,
         get_combat_maturity/1,
         get_skill_intimacy/1,
         get_grade_growth/1,
         child_talk/1,
         get_happiness/1,
         get_combat_happiness/1,
         get_child_spirit/0,
         get_skin/1]).

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

-file("src/data/child_data.erl", 40).

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

-file("src/data/child_data.erl", 41).

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

-file("src/data/child_data.erl", 42).

-file("inc/gain.hrl", 1).

-record(gain,
        {label :: undefined | atom(),
         val :: undefined | term(),
         msg = "" :: list(),
         source = 0 :: non_neg_integer(),
         notice_msg = "" :: list(),
         reason :: undefined | atom(),
         ext = 0 :: term(),
         notice = 0 :: 0..1,
         ext_val = 0}).

-record(loss,
        {label :: undefined | atom(),
         val :: undefined | term(),
         msg = "" :: list(),
         notice_msg = "" :: list(),
         source = 0 :: non_neg_integer(),
         reason :: undefined | atom(),
         ext = 0 :: term(),
         ext_val = 0,
         auto_scene = "" :: list()}).

-record(gain_text_opts,
        {order = loss :: gain | loss,
         gain_tag = "" :: string(),
         loss_tag = "" :: string(),
         split_str = "，" :: string(),
         split_op_str = "，" :: string(),
         merge_type = [] :: list(),
         fly_to_bag = 0 :: non_neg_integer()}).

-file("src/data/child_data.erl", 43).

get_base(1001) ->
    #child_base{id = 1001, name = lang:get("飞影"), sex = 1,
                classes = 1, phy_aptitude = 1600, pdef_aptitude = 1600,
                hp_aptitude = 1600, magic_aptitude = 1600,
                aspd_aptitude = 1600,
                classes_skills = [{86100, 0}, {86101, 0}, {86102, 1}],
                model_id = 41011, model_id1 = 41111, model_id2 = 41211,
                model_id3 = 41211, skin_id_0 = 41011, skin_id_1 = 41111,
                skin_id_2 = 41211, skin_id_3 = 41211, unit_id = 71161,
                unit_id_1 = 71171, unit_id_2 = 71181,
                unit_id_3 = 71181};
get_base(1002) ->
    #child_base{id = 1002, name = lang:get("琪琪"), sex = 0,
                classes = 1, phy_aptitude = 1600, pdef_aptitude = 1600,
                hp_aptitude = 1600, magic_aptitude = 1600,
                aspd_aptitude = 1600,
                classes_skills = [{86100, 0}, {86101, 0}, {86102, 1}],
                model_id = 41010, model_id1 = 41110, model_id2 = 41210,
                model_id3 = 41210, skin_id_0 = 41010, skin_id_1 = 41110,
                skin_id_2 = 41210, skin_id_3 = 41210, unit_id = 71162,
                unit_id_1 = 71172, unit_id_2 = 71182,
                unit_id_3 = 71182};
get_base(1003) ->
    #child_base{id = 1003, name = lang:get("飞影"), sex = 1,
                classes = 3, phy_aptitude = 1600, pdef_aptitude = 1600,
                hp_aptitude = 1600, magic_aptitude = 1600,
                aspd_aptitude = 1600,
                classes_skills = [{86106, 0}, {86107, 0}, {86108, 1}],
                model_id = 41011, model_id1 = 41111, model_id2 = 41211,
                model_id3 = 41211, skin_id_0 = 41011, skin_id_1 = 41111,
                skin_id_2 = 41211, skin_id_3 = 41211, unit_id = 71161,
                unit_id_1 = 71171, unit_id_2 = 71181,
                unit_id_3 = 71181};
get_base(1004) ->
    #child_base{id = 1004, name = lang:get("琪琪"), sex = 0,
                classes = 3, phy_aptitude = 1600, pdef_aptitude = 1600,
                hp_aptitude = 1600, magic_aptitude = 1600,
                aspd_aptitude = 1600,
                classes_skills = [{86106, 0}, {86107, 0}, {86108, 1}],
                model_id = 41010, model_id1 = 41110, model_id2 = 41210,
                model_id3 = 41210, skin_id_0 = 41010, skin_id_1 = 41110,
                skin_id_2 = 41210, skin_id_3 = 41210, unit_id = 71162,
                unit_id_1 = 71172, unit_id_2 = 71182,
                unit_id_3 = 71182};
get_base(1005) ->
    #child_base{id = 1005, name = lang:get("小波"), sex = 1,
                classes = 2, phy_aptitude = 1600, pdef_aptitude = 1600,
                hp_aptitude = 1600, magic_aptitude = 1600,
                aspd_aptitude = 1600,
                classes_skills = [{86103, 0}, {86104, 0}, {86105, 1}],
                model_id = 41009, model_id1 = 41109, model_id2 = 41209,
                model_id3 = 41209, skin_id_0 = 41009, skin_id_1 = 41109,
                skin_id_2 = 41209, skin_id_3 = 41209, unit_id = 71163,
                unit_id_1 = 71173, unit_id_2 = 71183,
                unit_id_3 = 71183};
get_base(1006) ->
    #child_base{id = 1006, name = lang:get("小樱"), sex = 0,
                classes = 2, phy_aptitude = 1600, pdef_aptitude = 1600,
                hp_aptitude = 1600, magic_aptitude = 1600,
                aspd_aptitude = 1600,
                classes_skills = [{86103, 0}, {86104, 0}, {86105, 1}],
                model_id = 41008, model_id1 = 41108, model_id2 = 41208,
                model_id3 = 41208, skin_id_0 = 41008, skin_id_1 = 41108,
                skin_id_2 = 41208, skin_id_3 = 41208, unit_id = 71164,
                unit_id_1 = 71174, unit_id_2 = 71184,
                unit_id_3 = 71184};
get_base(1007) ->
    #child_base{id = 1007, name = lang:get("小波"), sex = 1,
                classes = 6, phy_aptitude = 1600, pdef_aptitude = 1600,
                hp_aptitude = 1600, magic_aptitude = 1600,
                aspd_aptitude = 1600,
                classes_skills = [{86115, 0}, {86116, 0}, {86117, 1}],
                model_id = 41009, model_id1 = 41109, model_id2 = 41209,
                model_id3 = 41209, skin_id_0 = 41009, skin_id_1 = 41109,
                skin_id_2 = 41209, skin_id_3 = 41209, unit_id = 71163,
                unit_id_1 = 71173, unit_id_2 = 71183,
                unit_id_3 = 71183};
get_base(1008) ->
    #child_base{id = 1008, name = lang:get("小樱"), sex = 0,
                classes = 6, phy_aptitude = 1600, pdef_aptitude = 1600,
                hp_aptitude = 1600, magic_aptitude = 1600,
                aspd_aptitude = 1600,
                classes_skills = [{86115, 0}, {86116, 0}, {86117, 1}],
                model_id = 41008, model_id1 = 41108, model_id2 = 41208,
                model_id3 = 41208, skin_id_0 = 41008, skin_id_1 = 41108,
                skin_id_2 = 41208, skin_id_3 = 41208, unit_id = 71164,
                unit_id_1 = 71174, unit_id_2 = 71184,
                unit_id_3 = 71184};
get_base(1009) ->
    #child_base{id = 1009, name = lang:get("糖豆"), sex = 1,
                classes = 4, phy_aptitude = 1600, pdef_aptitude = 1600,
                hp_aptitude = 1600, magic_aptitude = 1600,
                aspd_aptitude = 1600,
                classes_skills = [{86109, 0}, {86110, 0}, {86111, 1}],
                model_id = 41013, model_id1 = 41113, model_id2 = 41213,
                model_id3 = 41213, skin_id_0 = 41013, skin_id_1 = 41113,
                skin_id_2 = 41213, skin_id_3 = 41213, unit_id = 71165,
                unit_id_1 = 71175, unit_id_2 = 71185,
                unit_id_3 = 71185};
get_base(1010) ->
    #child_base{id = 1010, name = lang:get("冰灵"), sex = 0,
                classes = 4, phy_aptitude = 1600, pdef_aptitude = 1600,
                hp_aptitude = 1600, magic_aptitude = 1600,
                aspd_aptitude = 1600,
                classes_skills = [{86109, 0}, {86110, 0}, {86111, 1}],
                model_id = 41012, model_id1 = 41112, model_id2 = 41212,
                model_id3 = 41212, skin_id_0 = 41012, skin_id_1 = 41112,
                skin_id_2 = 41212, skin_id_3 = 41212, unit_id = 71166,
                unit_id_1 = 71176, unit_id_2 = 71186,
                unit_id_3 = 71186};
get_base(1011) ->
    #child_base{id = 1011, name = lang:get("糖豆"), sex = 1,
                classes = 5, phy_aptitude = 1600, pdef_aptitude = 1600,
                hp_aptitude = 1600, magic_aptitude = 1600,
                aspd_aptitude = 1600,
                classes_skills = [{86112, 0}, {86113, 0}, {86114, 1}],
                model_id = 41013, model_id1 = 41113, model_id2 = 41213,
                model_id3 = 41213, skin_id_0 = 41013, skin_id_1 = 41113,
                skin_id_2 = 41213, skin_id_3 = 41213, unit_id = 71165,
                unit_id_1 = 71175, unit_id_2 = 71185,
                unit_id_3 = 71185};
get_base(1012) ->
    #child_base{id = 1012, name = lang:get("冰灵"), sex = 0,
                classes = 5, phy_aptitude = 1600, pdef_aptitude = 1600,
                hp_aptitude = 1600, magic_aptitude = 1600,
                aspd_aptitude = 1600,
                classes_skills = [{86112, 0}, {86113, 0}, {86114, 1}],
                model_id = 41012, model_id1 = 41112, model_id2 = 41212,
                model_id3 = 41212, skin_id_0 = 41012, skin_id_1 = 41112,
                skin_id_2 = 41212, skin_id_3 = 41212, unit_id = 71166,
                unit_id_1 = 71176, unit_id_2 = 71186,
                unit_id_3 = 71186};
get_base(_) -> false.

get_base_attr(1) ->
    #attr{hp_max = 138, mp_max = 1500, phy_dmg = 66,
          magic_dmg = 51, phy_def = 41, magic_def = 27,
          atk_speed = 1, enhance_control = 0, anti_control = 0};
get_base_attr(2) ->
    #attr{hp_max = 140, mp_max = 1500, phy_dmg = 68,
          magic_dmg = 53, phy_def = 43, magic_def = 29,
          atk_speed = 1, enhance_control = 0, anti_control = 0};
get_base_attr(3) ->
    #attr{hp_max = 142, mp_max = 1500, phy_dmg = 70,
          magic_dmg = 55, phy_def = 45, magic_def = 31,
          atk_speed = 1, enhance_control = 0, anti_control = 0};
get_base_attr(4) ->
    #attr{hp_max = 144, mp_max = 1500, phy_dmg = 72,
          magic_dmg = 57, phy_def = 47, magic_def = 33,
          atk_speed = 1, enhance_control = 0, anti_control = 0};
get_base_attr(5) ->
    #attr{hp_max = 145, mp_max = 1500, phy_dmg = 74,
          magic_dmg = 59, phy_def = 49, magic_def = 35,
          atk_speed = 1, enhance_control = 0, anti_control = 0};
get_base_attr(6) ->
    #attr{hp_max = 147, mp_max = 1500, phy_dmg = 76,
          magic_dmg = 61, phy_def = 51, magic_def = 37,
          atk_speed = 5, enhance_control = 0, anti_control = 0};
get_base_attr(7) ->
    #attr{hp_max = 176, mp_max = 1500, phy_dmg = 91,
          magic_dmg = 74, phy_def = 62, magic_def = 45,
          atk_speed = 7, enhance_control = 0, anti_control = 0};
get_base_attr(8) ->
    #attr{hp_max = 206, mp_max = 1500, phy_dmg = 106,
          magic_dmg = 86, phy_def = 72, magic_def = 52,
          atk_speed = 9, enhance_control = 0, anti_control = 0};
get_base_attr(9) ->
    #attr{hp_max = 236, mp_max = 1500, phy_dmg = 121,
          magic_dmg = 99, phy_def = 83, magic_def = 60,
          atk_speed = 10, enhance_control = 0, anti_control = 0};
get_base_attr(10) ->
    #attr{hp_max = 265, mp_max = 1500, phy_dmg = 137,
          magic_dmg = 111, phy_def = 93, magic_def = 67,
          atk_speed = 12, enhance_control = 0, anti_control = 0};
get_base_attr(11) ->
    #attr{hp_max = 295, mp_max = 1500, phy_dmg = 152,
          magic_dmg = 123, phy_def = 104, magic_def = 75,
          atk_speed = 14, enhance_control = 0, anti_control = 0};
get_base_attr(12) ->
    #attr{hp_max = 324, mp_max = 1500, phy_dmg = 167,
          magic_dmg = 136, phy_def = 114, magic_def = 82,
          atk_speed = 16, enhance_control = 0, anti_control = 0};
get_base_attr(13) ->
    #attr{hp_max = 353, mp_max = 1500, phy_dmg = 182,
          magic_dmg = 148, phy_def = 125, magic_def = 90,
          atk_speed = 18, enhance_control = 0, anti_control = 0};
get_base_attr(14) ->
    #attr{hp_max = 383, mp_max = 1500, phy_dmg = 197,
          magic_dmg = 161, phy_def = 135, magic_def = 97,
          atk_speed = 19, enhance_control = 0, anti_control = 0};
get_base_attr(15) ->
    #attr{hp_max = 442, mp_max = 1500, phy_dmg = 228,
          magic_dmg = 185, phy_def = 156, magic_def = 112,
          atk_speed = 21, enhance_control = 0, anti_control = 0};
get_base_attr(16) ->
    #attr{hp_max = 501, mp_max = 1500, phy_dmg = 258,
          magic_dmg = 210, phy_def = 177, magic_def = 127,
          atk_speed = 23, enhance_control = 0, anti_control = 0};
get_base_attr(17) ->
    #attr{hp_max = 560, mp_max = 1500, phy_dmg = 288,
          magic_dmg = 235, phy_def = 198, magic_def = 142,
          atk_speed = 25, enhance_control = 0, anti_control = 0};
get_base_attr(18) ->
    #attr{hp_max = 619, mp_max = 1500, phy_dmg = 319,
          magic_dmg = 260, phy_def = 219, magic_def = 157,
          atk_speed = 27, enhance_control = 0, anti_control = 0};
get_base_attr(19) ->
    #attr{hp_max = 678, mp_max = 1500, phy_dmg = 349,
          magic_dmg = 284, phy_def = 240, magic_def = 172,
          atk_speed = 28, enhance_control = 0, anti_control = 0};
get_base_attr(20) ->
    #attr{hp_max = 737, mp_max = 1500, phy_dmg = 380,
          magic_dmg = 309, phy_def = 261, magic_def = 187,
          atk_speed = 30, enhance_control = 0, anti_control = 0};
get_base_attr(21) ->
    #attr{hp_max = 796, mp_max = 1500, phy_dmg = 410,
          magic_dmg = 334, phy_def = 282, magic_def = 202,
          atk_speed = 32, enhance_control = 4, anti_control = 2};
get_base_attr(22) ->
    #attr{hp_max = 855, mp_max = 1500, phy_dmg = 441,
          magic_dmg = 359, phy_def = 303, magic_def = 217,
          atk_speed = 34, enhance_control = 6, anti_control = 3};
get_base_attr(23) ->
    #attr{hp_max = 914, mp_max = 1500, phy_dmg = 471,
          magic_dmg = 383, phy_def = 324, magic_def = 232,
          atk_speed = 36, enhance_control = 9, anti_control = 5};
get_base_attr(24) ->
    #attr{hp_max = 974, mp_max = 1500, phy_dmg = 501,
          magic_dmg = 408, phy_def = 345, magic_def = 247,
          atk_speed = 37, enhance_control = 11, anti_control = 6};
get_base_attr(25) ->
    #attr{hp_max = 1032, mp_max = 1500, phy_dmg = 532,
          magic_dmg = 433, phy_def = 366, magic_def = 262,
          atk_speed = 39, enhance_control = 14, anti_control = 8};
get_base_attr(26) ->
    #attr{hp_max = 1091, mp_max = 1500, phy_dmg = 562,
          magic_dmg = 458, phy_def = 387, magic_def = 277,
          atk_speed = 41, enhance_control = 16, anti_control = 9};
get_base_attr(27) ->
    #attr{hp_max = 1150, mp_max = 1500, phy_dmg = 593,
          magic_dmg = 483, phy_def = 408, magic_def = 292,
          atk_speed = 43, enhance_control = 18,
          anti_control = 10};
get_base_attr(28) ->
    #attr{hp_max = 1209, mp_max = 1500, phy_dmg = 623,
          magic_dmg = 507, phy_def = 429, magic_def = 307,
          atk_speed = 45, enhance_control = 21,
          anti_control = 12};
get_base_attr(29) ->
    #attr{hp_max = 1269, mp_max = 1500, phy_dmg = 654,
          magic_dmg = 532, phy_def = 450, magic_def = 322,
          atk_speed = 46, enhance_control = 23,
          anti_control = 13};
get_base_attr(30) ->
    #attr{hp_max = 1327, mp_max = 1500, phy_dmg = 684,
          magic_dmg = 557, phy_def = 471, magic_def = 337,
          atk_speed = 48, enhance_control = 26,
          anti_control = 15};
get_base_attr(31) ->
    #attr{hp_max = 1386, mp_max = 1500, phy_dmg = 715,
          magic_dmg = 582, phy_def = 492, magic_def = 352,
          atk_speed = 50, enhance_control = 28,
          anti_control = 16};
get_base_attr(32) ->
    #attr{hp_max = 1445, mp_max = 1500, phy_dmg = 745,
          magic_dmg = 606, phy_def = 513, magic_def = 367,
          atk_speed = 52, enhance_control = 30,
          anti_control = 18};
get_base_attr(33) ->
    #attr{hp_max = 1504, mp_max = 1500, phy_dmg = 776,
          magic_dmg = 631, phy_def = 534, magic_def = 382,
          atk_speed = 54, enhance_control = 33,
          anti_control = 19};
get_base_attr(34) ->
    #attr{hp_max = 1563, mp_max = 1500, phy_dmg = 806,
          magic_dmg = 656, phy_def = 555, magic_def = 397,
          atk_speed = 55, enhance_control = 35,
          anti_control = 21};
get_base_attr(35) ->
    #attr{hp_max = 1622, mp_max = 1500, phy_dmg = 836,
          magic_dmg = 681, phy_def = 576, magic_def = 412,
          atk_speed = 57, enhance_control = 38,
          anti_control = 22};
get_base_attr(36) ->
    #attr{hp_max = 1681, mp_max = 1500, phy_dmg = 867,
          magic_dmg = 705, phy_def = 597, magic_def = 427,
          atk_speed = 59, enhance_control = 40,
          anti_control = 24};
get_base_attr(37) ->
    #attr{hp_max = 1740, mp_max = 1500, phy_dmg = 897,
          magic_dmg = 730, phy_def = 618, magic_def = 442,
          atk_speed = 61, enhance_control = 42,
          anti_control = 25};
get_base_attr(38) ->
    #attr{hp_max = 1799, mp_max = 1500, phy_dmg = 928,
          magic_dmg = 755, phy_def = 639, magic_def = 457,
          atk_speed = 63, enhance_control = 45,
          anti_control = 27};
get_base_attr(39) ->
    #attr{hp_max = 1858, mp_max = 1500, phy_dmg = 958,
          magic_dmg = 780, phy_def = 660, magic_def = 472,
          atk_speed = 64, enhance_control = 47,
          anti_control = 28};
get_base_attr(40) ->
    #attr{hp_max = 1917, mp_max = 1500, phy_dmg = 989,
          magic_dmg = 805, phy_def = 681, magic_def = 487,
          atk_speed = 66, enhance_control = 50,
          anti_control = 30};
get_base_attr(41) ->
    #attr{hp_max = 1976, mp_max = 1500, phy_dmg = 1019,
          magic_dmg = 829, phy_def = 702, magic_def = 502,
          atk_speed = 68, enhance_control = 52,
          anti_control = 31};
get_base_attr(42) ->
    #attr{hp_max = 2035, mp_max = 1500, phy_dmg = 1050,
          magic_dmg = 854, phy_def = 722, magic_def = 517,
          atk_speed = 70, enhance_control = 54,
          anti_control = 32};
get_base_attr(43) ->
    #attr{hp_max = 2094, mp_max = 1500, phy_dmg = 1080,
          magic_dmg = 879, phy_def = 743, magic_def = 532,
          atk_speed = 72, enhance_control = 57,
          anti_control = 34};
get_base_attr(44) ->
    #attr{hp_max = 2153, mp_max = 1500, phy_dmg = 1110,
          magic_dmg = 904, phy_def = 764, magic_def = 547,
          atk_speed = 73, enhance_control = 59,
          anti_control = 35};
get_base_attr(45) ->
    #attr{hp_max = 2212, mp_max = 1500, phy_dmg = 1141,
          magic_dmg = 928, phy_def = 785, magic_def = 562,
          atk_speed = 75, enhance_control = 62,
          anti_control = 37};
get_base_attr(46) ->
    #attr{hp_max = 2271, mp_max = 1500, phy_dmg = 1171,
          magic_dmg = 953, phy_def = 806, magic_def = 577,
          atk_speed = 77, enhance_control = 64,
          anti_control = 38};
get_base_attr(47) ->
    #attr{hp_max = 2330, mp_max = 1500, phy_dmg = 1202,
          magic_dmg = 978, phy_def = 827, magic_def = 592,
          atk_speed = 79, enhance_control = 66,
          anti_control = 39};
get_base_attr(48) ->
    #attr{hp_max = 2389, mp_max = 1500, phy_dmg = 1232,
          magic_dmg = 1003, phy_def = 848, magic_def = 607,
          atk_speed = 81, enhance_control = 69,
          anti_control = 41};
get_base_attr(49) ->
    #attr{hp_max = 2448, mp_max = 1500, phy_dmg = 1263,
          magic_dmg = 1027, phy_def = 869, magic_def = 622,
          atk_speed = 82, enhance_control = 71,
          anti_control = 42};
get_base_attr(50) ->
    #attr{hp_max = 2507, mp_max = 1500, phy_dmg = 1293,
          magic_dmg = 1052, phy_def = 890, magic_def = 637,
          atk_speed = 84, enhance_control = 74,
          anti_control = 44};
get_base_attr(51) ->
    #attr{hp_max = 2566, mp_max = 1500, phy_dmg = 1324,
          magic_dmg = 1077, phy_def = 911, magic_def = 652,
          atk_speed = 86, enhance_control = 76,
          anti_control = 45};
get_base_attr(52) ->
    #attr{hp_max = 2626, mp_max = 1500, phy_dmg = 1354,
          magic_dmg = 1102, phy_def = 932, magic_def = 667,
          atk_speed = 88, enhance_control = 78,
          anti_control = 46};
get_base_attr(53) ->
    #attr{hp_max = 2684, mp_max = 1500, phy_dmg = 1385,
          magic_dmg = 1127, phy_def = 953, magic_def = 682,
          atk_speed = 90, enhance_control = 81,
          anti_control = 48};
get_base_attr(54) ->
    #attr{hp_max = 2743, mp_max = 1500, phy_dmg = 1415,
          magic_dmg = 1151, phy_def = 974, magic_def = 697,
          atk_speed = 91, enhance_control = 83,
          anti_control = 49};
get_base_attr(55) ->
    #attr{hp_max = 2802, mp_max = 1500, phy_dmg = 1445,
          magic_dmg = 1176, phy_def = 995, magic_def = 712,
          atk_speed = 93, enhance_control = 86,
          anti_control = 51};
get_base_attr(56) ->
    #attr{hp_max = 2861, mp_max = 1500, phy_dmg = 1476,
          magic_dmg = 1201, phy_def = 1016, magic_def = 727,
          atk_speed = 95, enhance_control = 88,
          anti_control = 52};
get_base_attr(57) ->
    #attr{hp_max = 2921, mp_max = 1500, phy_dmg = 1506,
          magic_dmg = 1226, phy_def = 1037, magic_def = 742,
          atk_speed = 97, enhance_control = 90,
          anti_control = 54};
get_base_attr(58) ->
    #attr{hp_max = 2979, mp_max = 1500, phy_dmg = 1537,
          magic_dmg = 1250, phy_def = 1058, magic_def = 757,
          atk_speed = 99, enhance_control = 93,
          anti_control = 55};
get_base_attr(59) ->
    #attr{hp_max = 3038, mp_max = 1500, phy_dmg = 1567,
          magic_dmg = 1275, phy_def = 1079, magic_def = 772,
          atk_speed = 100, enhance_control = 95,
          anti_control = 57};
get_base_attr(60) ->
    #attr{hp_max = 3097, mp_max = 1500, phy_dmg = 1598,
          magic_dmg = 1300, phy_def = 1100, magic_def = 787,
          atk_speed = 102, enhance_control = 98,
          anti_control = 58};
get_base_attr(61) ->
    #attr{hp_max = 3156, mp_max = 1500, phy_dmg = 1628,
          magic_dmg = 1325, phy_def = 1121, magic_def = 802,
          atk_speed = 104, enhance_control = 100,
          anti_control = 60};
get_base_attr(62) ->
    #attr{hp_max = 3216, mp_max = 1500, phy_dmg = 1659,
          magic_dmg = 1349, phy_def = 1142, magic_def = 817,
          atk_speed = 106, enhance_control = 102,
          anti_control = 61};
get_base_attr(63) ->
    #attr{hp_max = 3274, mp_max = 1500, phy_dmg = 1689,
          magic_dmg = 1374, phy_def = 1163, magic_def = 832,
          atk_speed = 108, enhance_control = 105,
          anti_control = 63};
get_base_attr(64) ->
    #attr{hp_max = 3333, mp_max = 1500, phy_dmg = 1720,
          magic_dmg = 1399, phy_def = 1184, magic_def = 847,
          atk_speed = 109, enhance_control = 107,
          anti_control = 64};
get_base_attr(65) ->
    #attr{hp_max = 3392, mp_max = 1500, phy_dmg = 1750,
          magic_dmg = 1424, phy_def = 1205, magic_def = 862,
          atk_speed = 111, enhance_control = 110,
          anti_control = 66};
get_base_attr(66) ->
    #attr{hp_max = 3451, mp_max = 1500, phy_dmg = 1780,
          magic_dmg = 1449, phy_def = 1226, magic_def = 877,
          atk_speed = 113, enhance_control = 112,
          anti_control = 67};
get_base_attr(67) ->
    #attr{hp_max = 3511, mp_max = 1500, phy_dmg = 1811,
          magic_dmg = 1473, phy_def = 1247, magic_def = 892,
          atk_speed = 115, enhance_control = 114,
          anti_control = 68};
get_base_attr(68) ->
    #attr{hp_max = 3569, mp_max = 1500, phy_dmg = 1841,
          magic_dmg = 1498, phy_def = 1268, magic_def = 907,
          atk_speed = 117, enhance_control = 117,
          anti_control = 70};
get_base_attr(69) ->
    #attr{hp_max = 3628, mp_max = 1500, phy_dmg = 1872,
          magic_dmg = 1523, phy_def = 1289, magic_def = 922,
          atk_speed = 118, enhance_control = 119,
          anti_control = 71};
get_base_attr(70) ->
    #attr{hp_max = 3687, mp_max = 1500, phy_dmg = 1902,
          magic_dmg = 1548, phy_def = 1310, magic_def = 937,
          atk_speed = 120, enhance_control = 122,
          anti_control = 73};
get_base_attr(71) ->
    #attr{hp_max = 3746, mp_max = 1500, phy_dmg = 1933,
          magic_dmg = 1572, phy_def = 1331, magic_def = 952,
          atk_speed = 122, enhance_control = 124,
          anti_control = 74};
get_base_attr(72) ->
    #attr{hp_max = 3806, mp_max = 1500, phy_dmg = 1963,
          magic_dmg = 1597, phy_def = 1352, magic_def = 967,
          atk_speed = 124, enhance_control = 126,
          anti_control = 75};
get_base_attr(73) ->
    #attr{hp_max = 3864, mp_max = 1500, phy_dmg = 1994,
          magic_dmg = 1622, phy_def = 1373, magic_def = 982,
          atk_speed = 126, enhance_control = 129,
          anti_control = 77};
get_base_attr(74) ->
    #attr{hp_max = 3923, mp_max = 1500, phy_dmg = 2024,
          magic_dmg = 1647, phy_def = 1394, magic_def = 997,
          atk_speed = 127, enhance_control = 131,
          anti_control = 78};
get_base_attr(75) ->
    #attr{hp_max = 3983, mp_max = 1500, phy_dmg = 2055,
          magic_dmg = 1672, phy_def = 1415, magic_def = 1013,
          atk_speed = 129, enhance_control = 134,
          anti_control = 80};
get_base_attr(76) ->
    #attr{hp_max = 4041, mp_max = 1500, phy_dmg = 2085,
          magic_dmg = 1696, phy_def = 1435, magic_def = 1028,
          atk_speed = 130, enhance_control = 136,
          anti_control = 81};
get_base_attr(77) ->
    #attr{hp_max = 4100, mp_max = 1500, phy_dmg = 2115,
          magic_dmg = 1721, phy_def = 1456, magic_def = 1043,
          atk_speed = 132, enhance_control = 138,
          anti_control = 82};
get_base_attr(78) ->
    #attr{hp_max = 4159, mp_max = 1500, phy_dmg = 2146,
          magic_dmg = 1746, phy_def = 1477, magic_def = 1058,
          atk_speed = 134, enhance_control = 141,
          anti_control = 84};
get_base_attr(79) ->
    #attr{hp_max = 4218, mp_max = 1500, phy_dmg = 2176,
          magic_dmg = 1771, phy_def = 1498, magic_def = 1073,
          atk_speed = 136, enhance_control = 143,
          anti_control = 85};
get_base_attr(80) ->
    #attr{hp_max = 4278, mp_max = 1500, phy_dmg = 2207,
          magic_dmg = 1795, phy_def = 1519, magic_def = 1088,
          atk_speed = 138, enhance_control = 146,
          anti_control = 87};
get_base_attr(81) ->
    #attr{hp_max = 4336, mp_max = 1500, phy_dmg = 2237,
          magic_dmg = 1820, phy_def = 1540, magic_def = 1103,
          atk_speed = 140, enhance_control = 148,
          anti_control = 88};
get_base_attr(82) ->
    #attr{hp_max = 4395, mp_max = 1500, phy_dmg = 2268,
          magic_dmg = 1845, phy_def = 1561, magic_def = 1118,
          atk_speed = 142, enhance_control = 150,
          anti_control = 90};
get_base_attr(83) ->
    #attr{hp_max = 4454, mp_max = 1500, phy_dmg = 2298,
          magic_dmg = 1870, phy_def = 1582, magic_def = 1133,
          atk_speed = 144, enhance_control = 153,
          anti_control = 91};
get_base_attr(84) ->
    #attr{hp_max = 4513, mp_max = 1500, phy_dmg = 2329,
          magic_dmg = 1894, phy_def = 1603, magic_def = 1148,
          atk_speed = 146, enhance_control = 155,
          anti_control = 93};
get_base_attr(85) ->
    #attr{hp_max = 4573, mp_max = 1500, phy_dmg = 2359,
          magic_dmg = 1919, phy_def = 1624, magic_def = 1163,
          atk_speed = 148, enhance_control = 158,
          anti_control = 94};
get_base_attr(86) ->
    #attr{hp_max = 4631, mp_max = 1500, phy_dmg = 2389,
          magic_dmg = 1944, phy_def = 1645, magic_def = 1178,
          atk_speed = 150, enhance_control = 160,
          anti_control = 96};
get_base_attr(87) ->
    #attr{hp_max = 4690, mp_max = 1500, phy_dmg = 2420,
          magic_dmg = 1969, phy_def = 1666, magic_def = 1193,
          atk_speed = 151, enhance_control = 162,
          anti_control = 97};
get_base_attr(88) ->
    #attr{hp_max = 4749, mp_max = 1500, phy_dmg = 2450,
          magic_dmg = 1994, phy_def = 1687, magic_def = 1208,
          atk_speed = 153, enhance_control = 165,
          anti_control = 99};
get_base_attr(89) ->
    #attr{hp_max = 4808, mp_max = 1500, phy_dmg = 2481,
          magic_dmg = 2018, phy_def = 1708, magic_def = 1223,
          atk_speed = 155, enhance_control = 167,
          anti_control = 100};
get_base_attr(90) ->
    #attr{hp_max = 4868, mp_max = 1500, phy_dmg = 2511,
          magic_dmg = 2043, phy_def = 1729, magic_def = 1238,
          atk_speed = 157, enhance_control = 170,
          anti_control = 102};
get_base_attr(91) ->
    #attr{hp_max = 4926, mp_max = 1500, phy_dmg = 2542,
          magic_dmg = 2068, phy_def = 1750, magic_def = 1253,
          atk_speed = 159, enhance_control = 172,
          anti_control = 103};
get_base_attr(92) ->
    #attr{hp_max = 4985, mp_max = 1500, phy_dmg = 2572,
          magic_dmg = 2093, phy_def = 1771, magic_def = 1268,
          atk_speed = 161, enhance_control = 174,
          anti_control = 104};
get_base_attr(93) ->
    #attr{hp_max = 5044, mp_max = 1500, phy_dmg = 2603,
          magic_dmg = 2117, phy_def = 1792, magic_def = 1283,
          atk_speed = 163, enhance_control = 177,
          anti_control = 106};
get_base_attr(94) ->
    #attr{hp_max = 5103, mp_max = 1500, phy_dmg = 2633,
          magic_dmg = 2142, phy_def = 1813, magic_def = 1298,
          atk_speed = 165, enhance_control = 179,
          anti_control = 107};
get_base_attr(95) ->
    #attr{hp_max = 5163, mp_max = 1500, phy_dmg = 2664,
          magic_dmg = 2167, phy_def = 1834, magic_def = 1313,
          atk_speed = 167, enhance_control = 182,
          anti_control = 109};
get_base_attr(96) ->
    #attr{hp_max = 5206, mp_max = 1500, phy_dmg = 2686,
          magic_dmg = 2185, phy_def = 1850, magic_def = 1324,
          atk_speed = 168, enhance_control = 184,
          anti_control = 110};
get_base_attr(97) ->
    #attr{hp_max = 5251, mp_max = 1500, phy_dmg = 2709,
          magic_dmg = 2204, phy_def = 1866, magic_def = 1335,
          atk_speed = 170, enhance_control = 186,
          anti_control = 111};
get_base_attr(98) ->
    #attr{hp_max = 5295, mp_max = 1500, phy_dmg = 2732,
          magic_dmg = 2223, phy_def = 1882, magic_def = 1346,
          atk_speed = 171, enhance_control = 189,
          anti_control = 113};
get_base_attr(99) ->
    #attr{hp_max = 5339, mp_max = 1500, phy_dmg = 2755,
          magic_dmg = 2241, phy_def = 1897, magic_def = 1358,
          atk_speed = 172, enhance_control = 191,
          anti_control = 114};
get_base_attr(100) ->
    #attr{hp_max = 5384, mp_max = 1500, phy_dmg = 2777,
          magic_dmg = 2260, phy_def = 1913, magic_def = 1369,
          atk_speed = 174, enhance_control = 194,
          anti_control = 116};
get_base_attr(101) ->
    #attr{hp_max = 5427, mp_max = 1500, phy_dmg = 2800,
          magic_dmg = 2278, phy_def = 1929, magic_def = 1380,
          atk_speed = 175, enhance_control = 196,
          anti_control = 117};
get_base_attr(102) ->
    #attr{hp_max = 5472, mp_max = 1500, phy_dmg = 2823,
          magic_dmg = 2297, phy_def = 1945, magic_def = 1391,
          atk_speed = 177, enhance_control = 198,
          anti_control = 118};
get_base_attr(103) ->
    #attr{hp_max = 5516, mp_max = 1500, phy_dmg = 2846,
          magic_dmg = 2316, phy_def = 1960, magic_def = 1403,
          atk_speed = 178, enhance_control = 201,
          anti_control = 120};
get_base_attr(104) ->
    #attr{hp_max = 5561, mp_max = 1500, phy_dmg = 2868,
          magic_dmg = 2334, phy_def = 1976, magic_def = 1414,
          atk_speed = 180, enhance_control = 203,
          anti_control = 121};
get_base_attr(105) ->
    #attr{hp_max = 5605, mp_max = 1500, phy_dmg = 2891,
          magic_dmg = 2353, phy_def = 1992, magic_def = 1425,
          atk_speed = 181, enhance_control = 206,
          anti_control = 123};
get_base_attr(106) ->
    #attr{hp_max = 5649, mp_max = 1500, phy_dmg = 2915,
          magic_dmg = 2371, phy_def = 2008, magic_def = 1436,
          atk_speed = 182, enhance_control = 208,
          anti_control = 126};
get_base_attr(107) ->
    #attr{hp_max = 5693, mp_max = 1500, phy_dmg = 2937,
          magic_dmg = 2390, phy_def = 2023, magic_def = 1448,
          atk_speed = 184, enhance_control = 211,
          anti_control = 125};
get_base_attr(108) ->
    #attr{hp_max = 5738, mp_max = 1500, phy_dmg = 2960,
          magic_dmg = 2408, phy_def = 2039, magic_def = 1459,
          atk_speed = 185, enhance_control = 213,
          anti_control = 127};
get_base_attr(109) ->
    #attr{hp_max = 5782, mp_max = 1500, phy_dmg = 2983,
          magic_dmg = 2427, phy_def = 2055, magic_def = 1470,
          atk_speed = 187, enhance_control = 216,
          anti_control = 130};
get_base_attr(110) ->
    #attr{hp_max = 5826, mp_max = 1500, phy_dmg = 3006,
          magic_dmg = 2446, phy_def = 2071, magic_def = 1481,
          atk_speed = 188, enhance_control = 218,
          anti_control = 129};
get_base_attr(111) ->
    #attr{hp_max = 5870, mp_max = 1500, phy_dmg = 3028,
          magic_dmg = 2464, phy_def = 2086, magic_def = 1493,
          atk_speed = 190, enhance_control = 221,
          anti_control = 131};
get_base_attr(112) ->
    #attr{hp_max = 5914, mp_max = 1500, phy_dmg = 3051,
          magic_dmg = 2483, phy_def = 2102, magic_def = 1504,
          atk_speed = 191, enhance_control = 223,
          anti_control = 134};
get_base_attr(113) ->
    #attr{hp_max = 5959, mp_max = 1500, phy_dmg = 3074,
          magic_dmg = 2501, phy_def = 2118, magic_def = 1515,
          atk_speed = 193, enhance_control = 226,
          anti_control = 133};
get_base_attr(114) ->
    #attr{hp_max = 6003, mp_max = 1500, phy_dmg = 3097,
          magic_dmg = 2520, phy_def = 2133, magic_def = 1527,
          atk_speed = 194, enhance_control = 228,
          anti_control = 135};
get_base_attr(115) ->
    #attr{hp_max = 6048, mp_max = 1500, phy_dmg = 3119,
          magic_dmg = 2538, phy_def = 2148, magic_def = 1538,
          atk_speed = 195, enhance_control = 231,
          anti_control = 138};
get_base_attr(116) ->
    #attr{hp_max = 6091, mp_max = 1500, phy_dmg = 3142,
          magic_dmg = 2557, phy_def = 2164, magic_def = 1549,
          atk_speed = 197, enhance_control = 233,
          anti_control = 137};
get_base_attr(117) ->
    #attr{hp_max = 6136, mp_max = 1500, phy_dmg = 3165,
          magic_dmg = 2576, phy_def = 2180, magic_def = 1560,
          atk_speed = 198, enhance_control = 236,
          anti_control = 139};
get_base_attr(118) ->
    #attr{hp_max = 6180, mp_max = 1500, phy_dmg = 3189,
          magic_dmg = 2594, phy_def = 2196, magic_def = 1572,
          atk_speed = 200, enhance_control = 238,
          anti_control = 142};
get_base_attr(119) ->
    #attr{hp_max = 6225, mp_max = 1500, phy_dmg = 3211,
          magic_dmg = 2613, phy_def = 2211, magic_def = 1583,
          atk_speed = 201, enhance_control = 241,
          anti_control = 141};
get_base_attr(120) ->
    #attr{hp_max = 6269, mp_max = 1500, phy_dmg = 3234,
          magic_dmg = 2631, phy_def = 2227, magic_def = 1594,
          atk_speed = 203, enhance_control = 243,
          anti_control = 143};
get_base_attr(121) ->
    #attr{hp_max = 6312, mp_max = 1500, phy_dmg = 3257,
          magic_dmg = 2650, phy_def = 2243, magic_def = 1605,
          atk_speed = 204, enhance_control = 246,
          anti_control = 146};
get_base_attr(122) ->
    #attr{hp_max = 6357, mp_max = 1500, phy_dmg = 3280,
          magic_dmg = 2669, phy_def = 2259, magic_def = 1617,
          atk_speed = 205, enhance_control = 248,
          anti_control = 145};
get_base_attr(123) ->
    #attr{hp_max = 6401, mp_max = 1500, phy_dmg = 3302,
          magic_dmg = 2687, phy_def = 2274, magic_def = 1628,
          atk_speed = 207, enhance_control = 251,
          anti_control = 147};
get_base_attr(124) ->
    #attr{hp_max = 6446, mp_max = 1500, phy_dmg = 3325,
          magic_dmg = 2706, phy_def = 2290, magic_def = 1639,
          atk_speed = 208, enhance_control = 253,
          anti_control = 150};
get_base_attr(125) ->
    #attr{hp_max = 6490, mp_max = 1500, phy_dmg = 3348,
          magic_dmg = 2724, phy_def = 2306, magic_def = 1650,
          atk_speed = 210, enhance_control = 256,
          anti_control = 153};
get_base_attr(126) ->
    #attr{hp_max = 6534, mp_max = 1500, phy_dmg = 3371,
          magic_dmg = 2743, phy_def = 2322, magic_def = 1662,
          atk_speed = 211, enhance_control = 258,
          anti_control = 154};
get_base_attr(127) ->
    #attr{hp_max = 6578, mp_max = 1500, phy_dmg = 3393,
          magic_dmg = 2761, phy_def = 2337, magic_def = 1673,
          atk_speed = 213, enhance_control = 261,
          anti_control = 156};
get_base_attr(128) ->
    #attr{hp_max = 6623, mp_max = 1500, phy_dmg = 3416,
          magic_dmg = 2780, phy_def = 2353, magic_def = 1684,
          atk_speed = 214, enhance_control = 263,
          anti_control = 157};
get_base_attr(129) ->
    #attr{hp_max = 6667, mp_max = 1500, phy_dmg = 3440,
          magic_dmg = 2799, phy_def = 2369, magic_def = 1695,
          atk_speed = 215, enhance_control = 266,
          anti_control = 159};
get_base_attr(130) ->
    #attr{hp_max = 6711, mp_max = 1500, phy_dmg = 3463,
          magic_dmg = 2817, phy_def = 2385, magic_def = 1707,
          atk_speed = 217, enhance_control = 268,
          anti_control = 160};
get_base_attr(131) ->
    #attr{hp_max = 6755, mp_max = 1500, phy_dmg = 3485,
          magic_dmg = 2836, phy_def = 2400, magic_def = 1718,
          atk_speed = 218, enhance_control = 271,
          anti_control = 162};
get_base_attr(132) ->
    #attr{hp_max = 6800, mp_max = 1500, phy_dmg = 3508,
          magic_dmg = 2854, phy_def = 2416, magic_def = 1729,
          atk_speed = 220, enhance_control = 273,
          anti_control = 163};
get_base_attr(133) ->
    #attr{hp_max = 6844, mp_max = 1500, phy_dmg = 3531,
          magic_dmg = 2873, phy_def = 2432, magic_def = 1740,
          atk_speed = 221, enhance_control = 276,
          anti_control = 165};
get_base_attr(134) ->
    #attr{hp_max = 6888, mp_max = 1500, phy_dmg = 3554,
          magic_dmg = 2891, phy_def = 2448, magic_def = 1752,
          atk_speed = 223, enhance_control = 278,
          anti_control = 166};
get_base_attr(135) ->
    #attr{hp_max = 6932, mp_max = 1500, phy_dmg = 3576,
          magic_dmg = 2910, phy_def = 2463, magic_def = 1763,
          atk_speed = 224, enhance_control = 281,
          anti_control = 168};
get_base_attr(136) ->
    #attr{hp_max = 6976, mp_max = 1500, phy_dmg = 3599,
          magic_dmg = 2929, phy_def = 2479, magic_def = 1774,
          atk_speed = 225, enhance_control = 283,
          anti_control = 169};
get_base_attr(137) ->
    #attr{hp_max = 7021, mp_max = 1500, phy_dmg = 3622,
          magic_dmg = 2947, phy_def = 2495, magic_def = 1785,
          atk_speed = 227, enhance_control = 286,
          anti_control = 171};
get_base_attr(138) ->
    #attr{hp_max = 7065, mp_max = 1500, phy_dmg = 3645,
          magic_dmg = 2966, phy_def = 2511, magic_def = 1797,
          atk_speed = 228, enhance_control = 288,
          anti_control = 172};
get_base_attr(139) ->
    #attr{hp_max = 7110, mp_max = 1500, phy_dmg = 3667,
          magic_dmg = 2984, phy_def = 2526, magic_def = 1808,
          atk_speed = 230, enhance_control = 291,
          anti_control = 174};
get_base_attr(140) ->
    #attr{hp_max = 7153, mp_max = 1500, phy_dmg = 3691,
          magic_dmg = 3003, phy_def = 2542, magic_def = 1819,
          atk_speed = 231, enhance_control = 293,
          anti_control = 175};
get_base_attr(141) ->
    #attr{hp_max = 7198, mp_max = 1500, phy_dmg = 3714,
          magic_dmg = 3021, phy_def = 2558, magic_def = 1830,
          atk_speed = 233, enhance_control = 296,
          anti_control = 177};
get_base_attr(142) ->
    #attr{hp_max = 7242, mp_max = 1500, phy_dmg = 3736,
          magic_dmg = 3040, phy_def = 2574, magic_def = 1842,
          atk_speed = 234, enhance_control = 298,
          anti_control = 178};
get_base_attr(143) ->
    #attr{hp_max = 7287, mp_max = 1500, phy_dmg = 3759,
          magic_dmg = 3059, phy_def = 2589, magic_def = 1853,
          atk_speed = 236, enhance_control = 301,
          anti_control = 180};
get_base_attr(144) ->
    #attr{hp_max = 7331, mp_max = 1500, phy_dmg = 3782,
          magic_dmg = 3077, phy_def = 2605, magic_def = 1864,
          atk_speed = 237, enhance_control = 303,
          anti_control = 181};
get_base_attr(145) ->
    #attr{hp_max = 7375, mp_max = 1500, phy_dmg = 3805,
          magic_dmg = 3096, phy_def = 2621, magic_def = 1875,
          atk_speed = 238, enhance_control = 306,
          anti_control = 183};
get_base_attr(146) ->
    #attr{hp_max = 7419, mp_max = 1500, phy_dmg = 3827,
          magic_dmg = 3114, phy_def = 2637, magic_def = 1887,
          atk_speed = 240, enhance_control = 308,
          anti_control = 184};
get_base_attr(147) ->
    #attr{hp_max = 7463, mp_max = 1500, phy_dmg = 3850,
          magic_dmg = 3133, phy_def = 2652, magic_def = 1898,
          atk_speed = 241, enhance_control = 311,
          anti_control = 186};
get_base_attr(148) ->
    #attr{hp_max = 7508, mp_max = 1500, phy_dmg = 3873,
          magic_dmg = 3152, phy_def = 2668, magic_def = 1909,
          atk_speed = 243, enhance_control = 313,
          anti_control = 187};
get_base_attr(149) ->
    #attr{hp_max = 7552, mp_max = 1500, phy_dmg = 3896,
          magic_dmg = 3170, phy_def = 2684, magic_def = 1920,
          atk_speed = 244, enhance_control = 316,
          anti_control = 189};
get_base_attr(150) ->
    #attr{hp_max = 7596, mp_max = 1500, phy_dmg = 3918,
          magic_dmg = 3189, phy_def = 2700, magic_def = 1932,
          atk_speed = 246, enhance_control = 318,
          anti_control = 190};
get_base_attr(_) -> #attr{}.

get_apti_ratio(1) -> {139, 1000, 55, 31, 40, 22, 1};
get_apti_ratio(2) -> {140, 1000, 56, 32, 41, 23, 1};
get_apti_ratio(3) -> {141, 1000, 57, 33, 42, 24, 1};
get_apti_ratio(4) -> {142, 1000, 58, 34, 43, 25, 1};
get_apti_ratio(5) -> {143, 1000, 59, 35, 44, 26, 1};
get_apti_ratio(6) -> {144, 1000, 61, 36, 45, 28, 5};
get_apti_ratio(7) -> {174, 1000, 73, 43, 54, 33, 7};
get_apti_ratio(8) -> {202, 1000, 86, 51, 63, 39, 8};
get_apti_ratio(9) -> {232, 1000, 98, 58, 73, 44, 9};
get_apti_ratio(10) -> {261, 1000, 110, 65, 81, 50, 10};
get_apti_ratio(11) -> {289, 1000, 122, 73, 90, 55, 11};
get_apti_ratio(12) -> {319, 1000, 134, 80, 99, 61, 13};
get_apti_ratio(13) -> {348, 1000, 146, 87, 109, 66, 14};
get_apti_ratio(14) -> {377, 1000, 158, 95, 118, 72, 15};
get_apti_ratio(15) ->
    {435, 1000, 184, 109, 135, 83, 17};
get_apti_ratio(16) ->
    {493, 1000, 208, 124, 154, 94, 20};
get_apti_ratio(17) ->
    {551, 1000, 232, 139, 172, 105, 22};
get_apti_ratio(18) ->
    {609, 1000, 257, 153, 190, 116, 24};
get_apti_ratio(19) ->
    {667, 1000, 282, 167, 208, 127, 27};
get_apti_ratio(20) ->
    {725, 1000, 306, 183, 227, 138, 29};
get_apti_ratio(21) ->
    {783, 1000, 331, 197, 245, 149, 32};
get_apti_ratio(22) ->
    {842, 1000, 355, 211, 263, 160, 34};
get_apti_ratio(23) ->
    {899, 1000, 380, 227, 282, 171, 36};
get_apti_ratio(24) ->
    {957, 1000, 404, 241, 299, 182, 39};
get_apti_ratio(25) ->
    {1015, 1000, 429, 255, 318, 193, 41};
get_apti_ratio(26) ->
    {1074, 1000, 453, 271, 336, 204, 43};
get_apti_ratio(27) ->
    {1132, 1000, 477, 285, 354, 215, 46};
get_apti_ratio(28) ->
    {1189, 1000, 503, 299, 372, 226, 48};
get_apti_ratio(29) ->
    {1247, 1000, 527, 315, 391, 237, 50};
get_apti_ratio(30) ->
    {1306, 1000, 551, 329, 408, 248, 53};
get_apti_ratio(31) ->
    {1364, 1000, 575, 343, 427, 259, 55};
get_apti_ratio(32) ->
    {1421, 1000, 601, 358, 444, 270, 58};
get_apti_ratio(33) ->
    {1480, 1000, 625, 373, 463, 281, 60};
get_apti_ratio(34) ->
    {1538, 1000, 649, 387, 481, 292, 62};
get_apti_ratio(35) ->
    {1596, 1000, 674, 402, 499, 303, 65};
get_apti_ratio(36) ->
    {1653, 1000, 699, 417, 517, 314, 67};
get_apti_ratio(37) ->
    {1712, 1000, 723, 431, 536, 325, 69};
get_apti_ratio(38) ->
    {1770, 1000, 748, 446, 553, 336, 72};
get_apti_ratio(39) ->
    {1828, 1000, 772, 461, 572, 347, 74};
get_apti_ratio(40) ->
    {1887, 1000, 796, 475, 590, 358, 77};
get_apti_ratio(41) ->
    {1944, 1000, 821, 490, 608, 369, 79};
get_apti_ratio(42) ->
    {2002, 1000, 846, 504, 626, 380, 81};
get_apti_ratio(43) ->
    {2060, 1000, 870, 519, 645, 391, 84};
get_apti_ratio(44) ->
    {2119, 1000, 894, 534, 662, 402, 86};
get_apti_ratio(45) ->
    {2176, 1000, 920, 548, 681, 413, 88};
get_apti_ratio(46) ->
    {2234, 1000, 944, 563, 699, 424, 91};
get_apti_ratio(47) ->
    {2292, 1000, 968, 578, 717, 435, 93};
get_apti_ratio(48) ->
    {2351, 1000, 993, 592, 736, 446, 96};
get_apti_ratio(49) ->
    {2408, 1000, 1018, 607, 754, 457, 98};
get_apti_ratio(50) ->
    {2466, 1000, 1042, 622, 772, 468, 100};
get_apti_ratio(51) ->
    {2525, 1000, 1066, 636, 790, 479, 103};
get_apti_ratio(52) ->
    {2583, 1000, 1091, 651, 809, 490, 105};
get_apti_ratio(53) ->
    {2641, 1000, 1115, 666, 826, 501, 107};
get_apti_ratio(54) ->
    {2698, 1000, 1140, 680, 845, 512, 110};
get_apti_ratio(55) ->
    {2757, 1000, 1165, 694, 862, 523, 112};
get_apti_ratio(56) ->
    {2815, 1000, 1189, 710, 881, 534, 114};
get_apti_ratio(57) ->
    {2873, 1000, 1213, 724, 899, 545, 117};
get_apti_ratio(58) ->
    {2930, 1000, 1238, 738, 917, 556, 119};
get_apti_ratio(59) ->
    {2989, 1000, 1263, 754, 935, 567, 122};
get_apti_ratio(60) ->
    {3047, 1000, 1287, 768, 954, 578, 124};
get_apti_ratio(61) ->
    {3105, 1000, 1311, 782, 971, 589, 126};
get_apti_ratio(62) ->
    {3163, 1000, 1337, 798, 990, 600, 129};
get_apti_ratio(63) ->
    {3221, 1000, 1361, 812, 1008, 611, 131};
get_apti_ratio(64) ->
    {3279, 1000, 1385, 826, 1026, 622, 133};
get_apti_ratio(65) ->
    {3337, 1000, 1410, 840, 1044, 633, 136};
get_apti_ratio(66) ->
    {3396, 1000, 1434, 856, 1063, 644, 138};
get_apti_ratio(67) ->
    {3453, 1000, 1459, 870, 1080, 655, 141};
get_apti_ratio(68) ->
    {3511, 1000, 1483, 884, 1099, 666, 143};
get_apti_ratio(69) ->
    {3570, 1000, 1508, 900, 1117, 677, 145};
get_apti_ratio(70) ->
    {3628, 1000, 1532, 914, 1135, 688, 148};
get_apti_ratio(71) ->
    {3685, 1000, 1557, 928, 1153, 699, 150};
get_apti_ratio(72) ->
    {3743, 1000, 1582, 944, 1172, 710, 152};
get_apti_ratio(73) ->
    {3802, 1000, 1606, 958, 1189, 721, 155};
get_apti_ratio(74) ->
    {3860, 1000, 1630, 972, 1208, 732, 157};
get_apti_ratio(75) ->
    {3918, 1000, 1656, 988, 1227, 743, 160};
get_apti_ratio(76) ->
    {3975, 1000, 1680, 1002, 1244, 754, 162};
get_apti_ratio(77) ->
    {4034, 1000, 1704, 1016, 1263, 765, 164};
get_apti_ratio(78) ->
    {4092, 1000, 1728, 1031, 1280, 776, 167};
get_apti_ratio(79) ->
    {4150, 1000, 1753, 1046, 1299, 787, 169};
get_apti_ratio(80) ->
    {4208, 1000, 1778, 1060, 1317, 798, 171};
get_apti_ratio(81) ->
    {4266, 1000, 1802, 1075, 1335, 809, 174};
get_apti_ratio(82) ->
    {4324, 1000, 1827, 1090, 1353, 820, 176};
get_apti_ratio(83) ->
    {4382, 1000, 1851, 1104, 1372, 831, 178};
get_apti_ratio(84) ->
    {4440, 1000, 1876, 1119, 1389, 842, 181};
get_apti_ratio(85) ->
    {4498, 1000, 1900, 1134, 1408, 853, 183};
get_apti_ratio(86) ->
    {4556, 1000, 1925, 1148, 1426, 864, 186};
get_apti_ratio(87) ->
    {4615, 1000, 1949, 1163, 1444, 875, 188};
get_apti_ratio(88) ->
    {4673, 1000, 1973, 1177, 1462, 886, 190};
get_apti_ratio(89) ->
    {4730, 1000, 1999, 1192, 1481, 897, 193};
get_apti_ratio(90) ->
    {4788, 1000, 2023, 1207, 1498, 908, 195};
get_apti_ratio(91) ->
    {4847, 1000, 2047, 1221, 1517, 919, 197};
get_apti_ratio(92) ->
    {4905, 1000, 2072, 1236, 1535, 930, 200};
get_apti_ratio(93) ->
    {4962, 1000, 2097, 1251, 1553, 941, 202};
get_apti_ratio(94) ->
    {5020, 1000, 2121, 1265, 1571, 952, 205};
get_apti_ratio(95) ->
    {5079, 1000, 2145, 1280, 1590, 963, 207};
get_apti_ratio(96) ->
    {5122, 1000, 2164, 1291, 1603, 970, 209};
get_apti_ratio(97) ->
    {5166, 1000, 2182, 1302, 1617, 979, 210};
get_apti_ratio(98) ->
    {5210, 1000, 2201, 1313, 1630, 987, 212};
get_apti_ratio(99) ->
    {5253, 1000, 2219, 1323, 1643, 996, 214};
get_apti_ratio(100) ->
    {5297, 1000, 2237, 1334, 1658, 1003, 216};
get_apti_ratio(101) ->
    {5339, 1000, 2256, 1345, 1671, 1012, 218};
get_apti_ratio(102) ->
    {5383, 1000, 2274, 1356, 1685, 1020, 219};
get_apti_ratio(103) ->
    {5427, 1000, 2292, 1367, 1698, 1029, 221};
get_apti_ratio(104) ->
    {5470, 1000, 2311, 1378, 1712, 1036, 223};
get_apti_ratio(105) ->
    {5514, 1000, 2330, 1389, 1726, 1045, 225};
get_apti_ratio(106) ->
    {5557, 1000, 2347, 1400, 1739, 1053, 226};
get_apti_ratio(107) ->
    {5601, 1000, 2366, 1411, 1753, 1062, 228};
get_apti_ratio(108) ->
    {5644, 1000, 2385, 1422, 1767, 1069, 230};
get_apti_ratio(109) ->
    {5688, 1000, 2404, 1433, 1780, 1078, 232};
get_apti_ratio(110) ->
    {5732, 1000, 2421, 1444, 1794, 1086, 234};
get_apti_ratio(111) ->
    {5775, 1000, 2440, 1455, 1807, 1095, 235};
get_apti_ratio(112) ->
    {5819, 1000, 2459, 1466, 1821, 1102, 237};
get_apti_ratio(113) ->
    {5862, 1000, 2476, 1477, 1835, 1111, 239};
get_apti_ratio(114) ->
    {5906, 1000, 2495, 1488, 1848, 1119, 241};
get_apti_ratio(115) ->
    {5949, 1000, 2514, 1499, 1862, 1128, 242};
get_apti_ratio(116) ->
    {5993, 1000, 2532, 1510, 1876, 1135, 244};
get_apti_ratio(117) ->
    {6037, 1000, 2550, 1521, 1889, 1144, 246};
get_apti_ratio(118) ->
    {6080, 1000, 2569, 1532, 1903, 1152, 248};
get_apti_ratio(119) ->
    {6124, 1000, 2587, 1543, 1916, 1161, 250};
get_apti_ratio(120) ->
    {6167, 1000, 2605, 1554, 1931, 1168, 251};
get_apti_ratio(121) ->
    {6211, 1000, 2624, 1565, 1944, 1177, 253};
get_apti_ratio(122) ->
    {6255, 1000, 2642, 1576, 1957, 1185, 255};
get_apti_ratio(123) ->
    {6298, 1000, 2661, 1587, 1971, 1194, 257};
get_apti_ratio(124) ->
    {6342, 1000, 2679, 1598, 1984, 1201, 258};
get_apti_ratio(125) ->
    {6384, 1000, 2697, 1609, 1999, 1210, 260};
get_apti_ratio(126) ->
    {6428, 1000, 2716, 1620, 2012, 1218, 262};
get_apti_ratio(127) ->
    {6471, 1000, 2735, 1631, 2025, 1227, 264};
get_apti_ratio(128) ->
    {6515, 1000, 2752, 1642, 2039, 1234, 266};
get_apti_ratio(129) ->
    {6559, 1000, 2771, 1653, 2053, 1243, 267};
get_apti_ratio(130) ->
    {6602, 1000, 2790, 1664, 2066, 1251, 269};
get_apti_ratio(131) ->
    {6646, 1000, 2807, 1675, 2080, 1260, 271};
get_apti_ratio(132) ->
    {6689, 1000, 2826, 1686, 2093, 1267, 273};
get_apti_ratio(133) ->
    {6733, 1000, 2845, 1697, 2108, 1276, 274};
get_apti_ratio(134) ->
    {6776, 1000, 2863, 1708, 2121, 1284, 276};
get_apti_ratio(135) ->
    {6820, 1000, 2881, 1719, 2134, 1293, 278};
get_apti_ratio(136) ->
    {6864, 1000, 2900, 1730, 2148, 1300, 280};
get_apti_ratio(137) ->
    {6907, 1000, 2918, 1741, 2162, 1309, 282};
get_apti_ratio(138) ->
    {6951, 1000, 2936, 1752, 2176, 1317, 283};
get_apti_ratio(139) ->
    {6994, 1000, 2955, 1763, 2189, 1326, 285};
get_apti_ratio(140) ->
    {7038, 1000, 2973, 1774, 2202, 1333, 287};
get_apti_ratio(141) ->
    {7081, 1000, 2992, 1785, 2217, 1342, 289};
get_apti_ratio(142) ->
    {7125, 1000, 3010, 1796, 2230, 1350, 290};
get_apti_ratio(143) ->
    {7169, 1000, 3028, 1807, 2244, 1359, 292};
get_apti_ratio(144) ->
    {7212, 1000, 3047, 1817, 2257, 1366, 294};
get_apti_ratio(145) ->
    {7256, 1000, 3066, 1828, 2270, 1375, 296};
get_apti_ratio(146) ->
    {7299, 1000, 3083, 1839, 2285, 1383, 298};
get_apti_ratio(147) ->
    {7343, 1000, 3102, 1850, 2298, 1392, 299};
get_apti_ratio(148) ->
    {7387, 1000, 3121, 1861, 2311, 1399, 301};
get_apti_ratio(149) ->
    {7429, 1000, 3138, 1872, 2325, 1408, 303};
get_apti_ratio(150) ->
    {7473, 1000, 3157, 1883, 2339, 1416, 305};
get_apti_ratio(_) -> false.

get_point_attr({102, 1}) ->
    [{1, 4000}, {7, 16}, {3, 8}];
get_point_attr({102, 2}) ->
    [{1, 4000}, {7, 16}, {3, 8}];
get_point_attr({102, 3}) ->
    [{1, 4000}, {7, 16}, {3, 8}];
get_point_attr({102, 4}) ->
    [{1, 4000}, {7, 16}, {3, 8}];
get_point_attr({102, 5}) ->
    [{1, 4000}, {7, 16}, {3, 8}];
get_point_attr({102, 6}) ->
    [{1, 4000}, {7, 16}, {3, 8}];
get_point_attr({102, 7}) ->
    [{1, 4000}, {7, 16}, {3, 8}];
get_point_attr({102, 8}) ->
    [{1, 4000}, {7, 16}, {3, 8}];
get_point_attr({102, 9}) ->
    [{1, 4000}, {7, 16}, {3, 8}];
get_point_attr({102, 10}) ->
    [{1, 4000}, {7, 16}, {3, 8}];
get_point_attr({102, 11}) ->
    [{1, 4000}, {7, 16}, {3, 8}];
get_point_attr({102, 12}) ->
    [{1, 4000}, {7, 16}, {3, 8}];
get_point_attr({102, 13}) ->
    [{1, 4000}, {7, 16}, {3, 8}];
get_point_attr({102, 14}) ->
    [{1, 4000}, {7, 16}, {3, 8}];
get_point_attr({102, 15}) ->
    [{1, 4000}, {7, 16}, {3, 8}];
get_point_attr({102, 16}) ->
    [{1, 4000}, {7, 16}, {3, 8}];
get_point_attr({102, 17}) ->
    [{1, 4000}, {7, 16}, {3, 8}];
get_point_attr({102, 18}) ->
    [{1, 4000}, {7, 16}, {3, 8}];
get_point_attr({102, 19}) ->
    [{1, 4000}, {7, 16}, {3, 8}];
get_point_attr({102, 20}) ->
    [{1, 4000}, {7, 16}, {3, 8}];
get_point_attr({102, 21}) ->
    [{1, 4000}, {7, 16}, {3, 8}];
get_point_attr({102, 22}) ->
    [{1, 4000}, {7, 16}, {3, 8}];
get_point_attr({102, 23}) ->
    [{1, 4000}, {7, 16}, {3, 8}];
get_point_attr({102, 24}) ->
    [{1, 4000}, {7, 16}, {3, 8}];
get_point_attr({102, 25}) ->
    [{1, 4000}, {7, 16}, {3, 8}];
get_point_attr({102, 26}) ->
    [{1, 4100}, {7, 16}, {3, 9}];
get_point_attr({102, 27}) ->
    [{1, 4200}, {7, 16}, {3, 9}];
get_point_attr({102, 28}) ->
    [{1, 4300}, {7, 17}, {3, 9}];
get_point_attr({102, 29}) ->
    [{1, 4400}, {7, 17}, {3, 9}];
get_point_attr({102, 30}) ->
    [{1, 4500}, {7, 18}, {3, 9}];
get_point_attr({102, 31}) ->
    [{1, 4600}, {7, 18}, {3, 10}];
get_point_attr({102, 32}) ->
    [{1, 4700}, {7, 18}, {3, 10}];
get_point_attr({102, 33}) ->
    [{1, 4800}, {7, 19}, {3, 10}];
get_point_attr({102, 34}) ->
    [{1, 4900}, {7, 19}, {3, 10}];
get_point_attr({102, 35}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 36}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 37}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 38}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 39}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 40}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 41}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 42}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 43}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 44}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 45}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 46}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 47}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 48}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 49}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 50}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 51}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 52}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 53}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 54}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 55}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 56}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 57}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 58}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 59}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 60}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 61}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 62}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 63}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 64}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 65}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 66}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 67}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 68}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 69}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 70}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 71}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 72}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 73}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 74}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 75}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 76}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 77}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 78}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 79}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 80}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 81}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 82}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 83}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 84}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 85}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 86}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 87}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 88}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 89}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 90}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 91}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 92}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 93}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 94}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 95}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 96}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 97}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 98}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 99}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 100}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 101}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 102}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 103}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 104}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 105}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 106}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 107}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 108}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 109}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 110}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 111}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 112}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 113}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 114}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 115}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 116}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 117}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 118}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 119}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 120}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 121}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 122}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 123}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 124}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 125}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 126}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 127}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 128}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 129}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 130}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 131}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 132}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 133}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 134}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 135}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 136}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 137}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 138}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 139}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 140}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 141}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 142}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 143}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 144}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 145}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 146}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 147}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 148}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 149}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({102, 150}) ->
    [{1, 5000}, {7, 20}, {3, 15}];
get_point_attr({101, 1}) -> [{4, 400}, {7, 80}, {3, 8}];
get_point_attr({101, 2}) -> [{4, 400}, {7, 80}, {3, 8}];
get_point_attr({101, 3}) -> [{4, 400}, {7, 80}, {3, 8}];
get_point_attr({101, 4}) -> [{4, 400}, {7, 80}, {3, 8}];
get_point_attr({101, 5}) -> [{4, 400}, {7, 80}, {3, 8}];
get_point_attr({101, 6}) -> [{4, 400}, {7, 80}, {3, 8}];
get_point_attr({101, 7}) -> [{4, 400}, {7, 80}, {3, 8}];
get_point_attr({101, 8}) -> [{4, 400}, {7, 80}, {3, 8}];
get_point_attr({101, 9}) -> [{4, 400}, {7, 80}, {3, 8}];
get_point_attr({101, 10}) ->
    [{4, 400}, {7, 80}, {3, 8}];
get_point_attr({101, 11}) ->
    [{4, 400}, {7, 80}, {3, 8}];
get_point_attr({101, 12}) ->
    [{4, 400}, {7, 80}, {3, 8}];
get_point_attr({101, 13}) ->
    [{4, 400}, {7, 80}, {3, 8}];
get_point_attr({101, 14}) ->
    [{4, 400}, {7, 80}, {3, 8}];
get_point_attr({101, 15}) ->
    [{4, 400}, {7, 80}, {3, 8}];
get_point_attr({101, 16}) ->
    [{4, 400}, {7, 80}, {3, 8}];
get_point_attr({101, 17}) ->
    [{4, 400}, {7, 80}, {3, 8}];
get_point_attr({101, 18}) ->
    [{4, 400}, {7, 80}, {3, 8}];
get_point_attr({101, 19}) ->
    [{4, 400}, {7, 80}, {3, 8}];
get_point_attr({101, 20}) ->
    [{4, 400}, {7, 80}, {3, 8}];
get_point_attr({101, 21}) ->
    [{4, 400}, {7, 80}, {3, 8}];
get_point_attr({101, 22}) ->
    [{4, 400}, {7, 80}, {3, 8}];
get_point_attr({101, 23}) ->
    [{4, 400}, {7, 80}, {3, 8}];
get_point_attr({101, 24}) ->
    [{4, 400}, {7, 80}, {3, 8}];
get_point_attr({101, 25}) ->
    [{4, 400}, {7, 80}, {3, 8}];
get_point_attr({101, 26}) ->
    [{4, 410}, {7, 82}, {3, 9}];
get_point_attr({101, 27}) ->
    [{4, 420}, {7, 84}, {3, 9}];
get_point_attr({101, 28}) ->
    [{4, 430}, {7, 86}, {3, 9}];
get_point_attr({101, 29}) ->
    [{4, 440}, {7, 88}, {3, 9}];
get_point_attr({101, 30}) ->
    [{4, 450}, {7, 90}, {3, 9}];
get_point_attr({101, 31}) ->
    [{4, 460}, {7, 92}, {3, 10}];
get_point_attr({101, 32}) ->
    [{4, 470}, {7, 94}, {3, 10}];
get_point_attr({101, 33}) ->
    [{4, 480}, {7, 96}, {3, 10}];
get_point_attr({101, 34}) ->
    [{4, 490}, {7, 98}, {3, 10}];
get_point_attr({101, 35}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 36}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 37}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 38}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 39}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 40}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 41}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 42}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 43}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 44}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 45}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 46}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 47}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 48}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 49}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 50}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 51}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 52}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 53}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 54}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 55}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 56}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 57}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 58}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 59}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 60}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 61}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 62}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 63}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 64}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 65}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 66}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 67}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 68}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 69}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 70}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 71}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 72}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 73}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 74}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 75}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 76}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 77}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 78}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 79}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 80}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 81}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 82}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 83}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 84}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 85}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 86}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 87}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 88}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 89}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 90}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 91}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 92}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 93}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 94}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 95}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 96}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 97}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 98}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 99}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 100}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 101}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 102}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 103}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 104}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 105}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 106}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 107}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 108}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 109}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 110}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 111}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 112}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 113}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 114}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 115}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 116}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 117}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 118}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 119}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 120}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 121}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 122}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 123}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 124}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 125}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 126}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 127}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 128}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 129}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 130}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 131}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 132}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 133}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 134}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 135}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 136}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 137}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 138}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 139}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 140}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 141}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 142}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 143}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 144}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 145}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 146}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 147}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 148}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 149}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({101, 150}) ->
    [{4, 500}, {7, 140}, {3, 15}];
get_point_attr({103, 1}) ->
    [{5, 400}, {7, 240}, {2, 360}];
get_point_attr({103, 2}) ->
    [{5, 400}, {7, 240}, {2, 360}];
get_point_attr({103, 3}) ->
    [{5, 400}, {7, 240}, {2, 360}];
get_point_attr({103, 4}) ->
    [{5, 400}, {7, 240}, {2, 360}];
get_point_attr({103, 5}) ->
    [{5, 400}, {7, 240}, {2, 360}];
get_point_attr({103, 6}) ->
    [{5, 400}, {7, 240}, {2, 360}];
get_point_attr({103, 7}) ->
    [{5, 400}, {7, 240}, {2, 360}];
get_point_attr({103, 8}) ->
    [{5, 400}, {7, 240}, {2, 360}];
get_point_attr({103, 9}) ->
    [{5, 400}, {7, 240}, {2, 360}];
get_point_attr({103, 10}) ->
    [{5, 400}, {7, 240}, {2, 360}];
get_point_attr({103, 11}) ->
    [{5, 400}, {7, 240}, {2, 360}];
get_point_attr({103, 12}) ->
    [{5, 400}, {7, 240}, {2, 360}];
get_point_attr({103, 13}) ->
    [{5, 400}, {7, 240}, {2, 360}];
get_point_attr({103, 14}) ->
    [{5, 400}, {7, 240}, {2, 360}];
get_point_attr({103, 15}) ->
    [{5, 400}, {7, 240}, {2, 360}];
get_point_attr({103, 16}) ->
    [{5, 400}, {7, 240}, {2, 360}];
get_point_attr({103, 17}) ->
    [{5, 400}, {7, 240}, {2, 360}];
get_point_attr({103, 18}) ->
    [{5, 400}, {7, 240}, {2, 360}];
get_point_attr({103, 19}) ->
    [{5, 400}, {7, 240}, {2, 360}];
get_point_attr({103, 20}) ->
    [{5, 400}, {7, 240}, {2, 360}];
get_point_attr({103, 21}) ->
    [{5, 400}, {7, 240}, {2, 360}];
get_point_attr({103, 22}) ->
    [{5, 400}, {7, 240}, {2, 360}];
get_point_attr({103, 23}) ->
    [{5, 400}, {7, 240}, {2, 360}];
get_point_attr({103, 24}) ->
    [{5, 400}, {7, 240}, {2, 360}];
get_point_attr({103, 25}) ->
    [{5, 400}, {7, 240}, {2, 360}];
get_point_attr({103, 26}) ->
    [{5, 410}, {7, 246}, {2, 369}];
get_point_attr({103, 27}) ->
    [{5, 420}, {7, 252}, {2, 378}];
get_point_attr({103, 28}) ->
    [{5, 430}, {7, 258}, {2, 387}];
get_point_attr({103, 29}) ->
    [{5, 440}, {7, 264}, {2, 396}];
get_point_attr({103, 30}) ->
    [{5, 450}, {7, 270}, {2, 405}];
get_point_attr({103, 31}) ->
    [{5, 460}, {7, 276}, {2, 414}];
get_point_attr({103, 32}) ->
    [{5, 470}, {7, 282}, {2, 423}];
get_point_attr({103, 33}) ->
    [{5, 480}, {7, 288}, {2, 432}];
get_point_attr({103, 34}) ->
    [{5, 490}, {7, 294}, {2, 441}];
get_point_attr({103, 35}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 36}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 37}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 38}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 39}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 40}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 41}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 42}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 43}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 44}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 45}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 46}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 47}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 48}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 49}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 50}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 51}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 52}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 53}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 54}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 55}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 56}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 57}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 58}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 59}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 60}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 61}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 62}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 63}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 64}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 65}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 66}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 67}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 68}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 69}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 70}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 71}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 72}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 73}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 74}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 75}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 76}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 77}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 78}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 79}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 80}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 81}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 82}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 83}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 84}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 85}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 86}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 87}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 88}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 89}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 90}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 91}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 92}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 93}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 94}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 95}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 96}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 97}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 98}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 99}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 100}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 101}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 102}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 103}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 104}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 105}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 106}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 107}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 108}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 109}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 110}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 111}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 112}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 113}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 114}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 115}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 116}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 117}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 118}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 119}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 120}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 121}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 122}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 123}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 124}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 125}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 126}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 127}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 128}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 129}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 130}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 131}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 132}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 133}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 134}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 135}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 136}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 137}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 138}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 139}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 140}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 141}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 142}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 143}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 144}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 145}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 146}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 147}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 148}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 149}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({103, 150}) ->
    [{5, 500}, {7, 400}, {2, 450}];
get_point_attr({104, 1}) -> [{3, 88}];
get_point_attr({104, 2}) -> [{3, 88}];
get_point_attr({104, 3}) -> [{3, 88}];
get_point_attr({104, 4}) -> [{3, 88}];
get_point_attr({104, 5}) -> [{3, 88}];
get_point_attr({104, 6}) -> [{3, 88}];
get_point_attr({104, 7}) -> [{3, 88}];
get_point_attr({104, 8}) -> [{3, 88}];
get_point_attr({104, 9}) -> [{3, 88}];
get_point_attr({104, 10}) -> [{3, 88}];
get_point_attr({104, 11}) -> [{3, 88}];
get_point_attr({104, 12}) -> [{3, 88}];
get_point_attr({104, 13}) -> [{3, 88}];
get_point_attr({104, 14}) -> [{3, 88}];
get_point_attr({104, 15}) -> [{3, 88}];
get_point_attr({104, 16}) -> [{3, 88}];
get_point_attr({104, 17}) -> [{3, 88}];
get_point_attr({104, 18}) -> [{3, 88}];
get_point_attr({104, 19}) -> [{3, 88}];
get_point_attr({104, 20}) -> [{3, 88}];
get_point_attr({104, 21}) -> [{3, 88}];
get_point_attr({104, 22}) -> [{3, 88}];
get_point_attr({104, 23}) -> [{3, 88}];
get_point_attr({104, 24}) -> [{3, 88}];
get_point_attr({104, 25}) -> [{3, 88}];
get_point_attr({104, 26}) -> [{3, 90}];
get_point_attr({104, 27}) -> [{3, 92}];
get_point_attr({104, 28}) -> [{3, 94}];
get_point_attr({104, 29}) -> [{3, 96}];
get_point_attr({104, 30}) -> [{3, 99}];
get_point_attr({104, 31}) -> [{3, 101}];
get_point_attr({104, 32}) -> [{3, 103}];
get_point_attr({104, 33}) -> [{3, 105}];
get_point_attr({104, 34}) -> [{3, 107}];
get_point_attr({104, 35}) -> [{3, 150}];
get_point_attr({104, 36}) -> [{3, 150}];
get_point_attr({104, 37}) -> [{3, 150}];
get_point_attr({104, 38}) -> [{3, 150}];
get_point_attr({104, 39}) -> [{3, 150}];
get_point_attr({104, 40}) -> [{3, 150}];
get_point_attr({104, 41}) -> [{3, 150}];
get_point_attr({104, 42}) -> [{3, 150}];
get_point_attr({104, 43}) -> [{3, 150}];
get_point_attr({104, 44}) -> [{3, 150}];
get_point_attr({104, 45}) -> [{3, 150}];
get_point_attr({104, 46}) -> [{3, 150}];
get_point_attr({104, 47}) -> [{3, 150}];
get_point_attr({104, 48}) -> [{3, 150}];
get_point_attr({104, 49}) -> [{3, 150}];
get_point_attr({104, 50}) -> [{3, 150}];
get_point_attr({104, 51}) -> [{3, 150}];
get_point_attr({104, 52}) -> [{3, 150}];
get_point_attr({104, 53}) -> [{3, 150}];
get_point_attr({104, 54}) -> [{3, 150}];
get_point_attr({104, 55}) -> [{3, 150}];
get_point_attr({104, 56}) -> [{3, 150}];
get_point_attr({104, 57}) -> [{3, 150}];
get_point_attr({104, 58}) -> [{3, 150}];
get_point_attr({104, 59}) -> [{3, 150}];
get_point_attr({104, 60}) -> [{3, 150}];
get_point_attr({104, 61}) -> [{3, 150}];
get_point_attr({104, 62}) -> [{3, 150}];
get_point_attr({104, 63}) -> [{3, 150}];
get_point_attr({104, 64}) -> [{3, 150}];
get_point_attr({104, 65}) -> [{3, 150}];
get_point_attr({104, 66}) -> [{3, 150}];
get_point_attr({104, 67}) -> [{3, 150}];
get_point_attr({104, 68}) -> [{3, 150}];
get_point_attr({104, 69}) -> [{3, 150}];
get_point_attr({104, 70}) -> [{3, 150}];
get_point_attr({104, 71}) -> [{3, 150}];
get_point_attr({104, 72}) -> [{3, 150}];
get_point_attr({104, 73}) -> [{3, 150}];
get_point_attr({104, 74}) -> [{3, 150}];
get_point_attr({104, 75}) -> [{3, 150}];
get_point_attr({104, 76}) -> [{3, 150}];
get_point_attr({104, 77}) -> [{3, 150}];
get_point_attr({104, 78}) -> [{3, 150}];
get_point_attr({104, 79}) -> [{3, 150}];
get_point_attr({104, 80}) -> [{3, 150}];
get_point_attr({104, 81}) -> [{3, 150}];
get_point_attr({104, 82}) -> [{3, 150}];
get_point_attr({104, 83}) -> [{3, 150}];
get_point_attr({104, 84}) -> [{3, 150}];
get_point_attr({104, 85}) -> [{3, 150}];
get_point_attr({104, 86}) -> [{3, 150}];
get_point_attr({104, 87}) -> [{3, 150}];
get_point_attr({104, 88}) -> [{3, 150}];
get_point_attr({104, 89}) -> [{3, 150}];
get_point_attr({104, 90}) -> [{3, 150}];
get_point_attr({104, 91}) -> [{3, 150}];
get_point_attr({104, 92}) -> [{3, 150}];
get_point_attr({104, 93}) -> [{3, 150}];
get_point_attr({104, 94}) -> [{3, 150}];
get_point_attr({104, 95}) -> [{3, 150}];
get_point_attr({104, 96}) -> [{3, 150}];
get_point_attr({104, 97}) -> [{3, 150}];
get_point_attr({104, 98}) -> [{3, 150}];
get_point_attr({104, 99}) -> [{3, 150}];
get_point_attr({104, 100}) -> [{3, 150}];
get_point_attr({104, 101}) -> [{3, 150}];
get_point_attr({104, 102}) -> [{3, 150}];
get_point_attr({104, 103}) -> [{3, 150}];
get_point_attr({104, 104}) -> [{3, 150}];
get_point_attr({104, 105}) -> [{3, 150}];
get_point_attr({104, 106}) -> [{3, 150}];
get_point_attr({104, 107}) -> [{3, 150}];
get_point_attr({104, 108}) -> [{3, 150}];
get_point_attr({104, 109}) -> [{3, 150}];
get_point_attr({104, 110}) -> [{3, 150}];
get_point_attr({104, 111}) -> [{3, 150}];
get_point_attr({104, 112}) -> [{3, 150}];
get_point_attr({104, 113}) -> [{3, 150}];
get_point_attr({104, 114}) -> [{3, 150}];
get_point_attr({104, 115}) -> [{3, 150}];
get_point_attr({104, 116}) -> [{3, 150}];
get_point_attr({104, 117}) -> [{3, 150}];
get_point_attr({104, 118}) -> [{3, 150}];
get_point_attr({104, 119}) -> [{3, 150}];
get_point_attr({104, 120}) -> [{3, 150}];
get_point_attr({104, 121}) -> [{3, 150}];
get_point_attr({104, 122}) -> [{3, 150}];
get_point_attr({104, 123}) -> [{3, 150}];
get_point_attr({104, 124}) -> [{3, 150}];
get_point_attr({104, 125}) -> [{3, 150}];
get_point_attr({104, 126}) -> [{3, 150}];
get_point_attr({104, 127}) -> [{3, 150}];
get_point_attr({104, 128}) -> [{3, 150}];
get_point_attr({104, 129}) -> [{3, 150}];
get_point_attr({104, 130}) -> [{3, 150}];
get_point_attr({104, 131}) -> [{3, 150}];
get_point_attr({104, 132}) -> [{3, 150}];
get_point_attr({104, 133}) -> [{3, 150}];
get_point_attr({104, 134}) -> [{3, 150}];
get_point_attr({104, 135}) -> [{3, 150}];
get_point_attr({104, 136}) -> [{3, 150}];
get_point_attr({104, 137}) -> [{3, 150}];
get_point_attr({104, 138}) -> [{3, 150}];
get_point_attr({104, 139}) -> [{3, 150}];
get_point_attr({104, 140}) -> [{3, 150}];
get_point_attr({104, 141}) -> [{3, 150}];
get_point_attr({104, 142}) -> [{3, 150}];
get_point_attr({104, 143}) -> [{3, 150}];
get_point_attr({104, 144}) -> [{3, 150}];
get_point_attr({104, 145}) -> [{3, 150}];
get_point_attr({104, 146}) -> [{3, 150}];
get_point_attr({104, 147}) -> [{3, 150}];
get_point_attr({104, 148}) -> [{3, 150}];
get_point_attr({104, 149}) -> [{3, 150}];
get_point_attr({104, 150}) -> [{3, 150}];
get_point_attr({105, 1}) -> [{6, 600}, {7, 16}, {3, 8}];
get_point_attr({105, 2}) -> [{6, 600}, {7, 16}, {3, 8}];
get_point_attr({105, 3}) -> [{6, 600}, {7, 16}, {3, 8}];
get_point_attr({105, 4}) -> [{6, 600}, {7, 16}, {3, 8}];
get_point_attr({105, 5}) -> [{6, 600}, {7, 16}, {3, 8}];
get_point_attr({105, 6}) -> [{6, 600}, {7, 16}, {3, 8}];
get_point_attr({105, 7}) -> [{6, 600}, {7, 16}, {3, 8}];
get_point_attr({105, 8}) -> [{6, 600}, {7, 16}, {3, 8}];
get_point_attr({105, 9}) -> [{6, 600}, {7, 16}, {3, 8}];
get_point_attr({105, 10}) ->
    [{6, 600}, {7, 16}, {3, 8}];
get_point_attr({105, 11}) ->
    [{6, 600}, {7, 16}, {3, 8}];
get_point_attr({105, 12}) ->
    [{6, 600}, {7, 16}, {3, 8}];
get_point_attr({105, 13}) ->
    [{6, 600}, {7, 16}, {3, 8}];
get_point_attr({105, 14}) ->
    [{6, 600}, {7, 16}, {3, 8}];
get_point_attr({105, 15}) ->
    [{6, 600}, {7, 16}, {3, 8}];
get_point_attr({105, 16}) ->
    [{6, 600}, {7, 16}, {3, 8}];
get_point_attr({105, 17}) ->
    [{6, 600}, {7, 16}, {3, 8}];
get_point_attr({105, 18}) ->
    [{6, 600}, {7, 16}, {3, 8}];
get_point_attr({105, 19}) ->
    [{6, 600}, {7, 16}, {3, 8}];
get_point_attr({105, 20}) ->
    [{6, 600}, {7, 16}, {3, 8}];
get_point_attr({105, 21}) ->
    [{6, 600}, {7, 16}, {3, 8}];
get_point_attr({105, 22}) ->
    [{6, 600}, {7, 16}, {3, 8}];
get_point_attr({105, 23}) ->
    [{6, 600}, {7, 16}, {3, 8}];
get_point_attr({105, 24}) ->
    [{6, 600}, {7, 16}, {3, 8}];
get_point_attr({105, 25}) ->
    [{6, 600}, {7, 16}, {3, 8}];
get_point_attr({105, 26}) ->
    [{6, 615}, {7, 16}, {3, 9}];
get_point_attr({105, 27}) ->
    [{6, 630}, {7, 16}, {3, 9}];
get_point_attr({105, 28}) ->
    [{6, 645}, {7, 17}, {3, 9}];
get_point_attr({105, 29}) ->
    [{6, 660}, {7, 17}, {3, 9}];
get_point_attr({105, 30}) ->
    [{6, 675}, {7, 18}, {3, 9}];
get_point_attr({105, 31}) ->
    [{6, 690}, {7, 18}, {3, 10}];
get_point_attr({105, 32}) ->
    [{6, 705}, {7, 18}, {3, 10}];
get_point_attr({105, 33}) ->
    [{6, 720}, {7, 19}, {3, 10}];
get_point_attr({105, 34}) ->
    [{6, 735}, {7, 19}, {3, 10}];
get_point_attr({105, 35}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 36}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 37}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 38}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 39}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 40}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 41}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 42}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 43}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 44}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 45}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 46}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 47}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 48}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 49}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 50}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 51}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 52}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 53}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 54}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 55}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 56}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 57}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 58}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 59}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 60}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 61}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 62}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 63}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 64}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 65}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 66}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 67}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 68}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 69}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 70}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 71}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 72}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 73}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 74}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 75}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 76}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 77}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 78}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 79}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 80}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 81}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 82}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 83}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 84}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 85}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 86}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 87}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 88}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 89}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 90}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 91}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 92}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 93}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 94}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 95}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 96}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 97}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 98}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 99}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 100}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 101}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 102}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 103}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 104}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 105}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 106}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 107}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 108}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 109}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 110}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 111}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 112}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 113}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 114}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 115}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 116}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 117}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 118}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 119}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 120}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 121}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 122}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 123}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 124}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 125}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 126}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 127}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 128}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 129}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 130}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 131}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 132}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 133}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 134}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 135}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 136}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 137}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 138}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 139}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 140}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 141}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 142}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 143}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 144}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 145}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 146}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 147}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 148}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 149}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr({105, 150}) ->
    [{6, 850}, {7, 20}, {3, 13}];
get_point_attr(_) -> [].

get_exp(1) -> 864;
get_exp(2) -> 888;
get_exp(3) -> 913;
get_exp(4) -> 933;
get_exp(5) -> 958;
get_exp(6) -> 982;
get_exp(7) -> 1003;
get_exp(8) -> 1029;
get_exp(9) -> 1053;
get_exp(10) -> 1294;
get_exp(11) -> 1323;
get_exp(12) -> 1345;
get_exp(13) -> 1377;
get_exp(14) -> 1405;
get_exp(15) -> 1437;
get_exp(16) -> 5328;
get_exp(17) -> 5626;
get_exp(18) -> 5737;
get_exp(19) -> 5853;
get_exp(20) -> 5889;
get_exp(21) -> 6813;
get_exp(22) -> 7536;
get_exp(23) -> 8431;
get_exp(24) -> 10182;
get_exp(25) -> 11245;
get_exp(26) -> 11974;
get_exp(27) -> 12991;
get_exp(28) -> 15157;
get_exp(29) -> 15970;
get_exp(30) -> 16876;
get_exp(31) -> 18772;
get_exp(32) -> 19671;
get_exp(33) -> 21654;
get_exp(34) -> 24961;
get_exp(35) -> 27232;
get_exp(36) -> 30498;
get_exp(37) -> 33775;
get_exp(38) -> 37458;
get_exp(39) -> 40903;
get_exp(40) -> 43896;
get_exp(41) -> 44879;
get_exp(42) -> 56544;
get_exp(43) -> 66269;
get_exp(44) -> 72322;
get_exp(45) -> 83770;
get_exp(46) -> 115724;
get_exp(47) -> 128846;
get_exp(48) -> 146906;
get_exp(49) -> 167552;
get_exp(50) -> 176349;
get_exp(51) -> 185025;
get_exp(52) -> 209817;
get_exp(53) -> 235248;
get_exp(54) -> 264366;
get_exp(55) -> 270717;
get_exp(56) -> 276129;
get_exp(57) -> 283623;
get_exp(58) -> 291224;
get_exp(59) -> 296835;
get_exp(60) -> 313830;
get_exp(61) -> 333062;
get_exp(62) -> 348638;
get_exp(63) -> 369271;
get_exp(64) -> 387175;
get_exp(65) -> 392066;
get_exp(66) -> 446905;
get_exp(67) -> 520710;
get_exp(68) -> 604459;
get_exp(69) -> 670138;
get_exp(70) -> 758328;
get_exp(71) -> 766156;
get_exp(72) -> 889175;
get_exp(73) -> 964621;
get_exp(74) -> 1002329;
get_exp(75) -> 1086785;
get_exp(76) -> 1117889;
get_exp(77) -> 1163715;
get_exp(78) -> 1202862;
get_exp(79) -> 1363384;
get_exp(80) -> 1384129;
get_exp(81) -> 1417432;
get_exp(82) -> 1524124;
get_exp(83) -> 1630519;
get_exp(84) -> 1740200;
get_exp(85) -> 1810791;
get_exp(86) -> 1894362;
get_exp(87) -> 1985268;
get_exp(88) -> 2075622;
get_exp(89) -> 2327998;
get_exp(90) -> 2544415;
get_exp(91) -> 2777308;
get_exp(92) -> 3010524;
get_exp(93) -> 3244984;
get_exp(94) -> 3485776;
get_exp(95) -> 3624744;
get_exp(96) -> 3718798;
get_exp(97) -> 3856235;
get_exp(98) -> 3905179;
get_exp(99) -> 3954613;
get_exp(100) -> 4004541;
get_exp(101) -> 4054968;
get_exp(102) -> 4105900;
get_exp(103) -> 4157341;
get_exp(104) -> 4209296;
get_exp(105) -> 4251388;
get_exp(106) -> 4293901;
get_exp(107) -> 4336840;
get_exp(108) -> 4380208;
get_exp(109) -> 4424010;
get_exp(110) -> 4468250;
get_exp(111) -> 4512932;
get_exp(112) -> 4558061;
get_exp(113) -> 4603641;
get_exp(114) -> 4649677;
get_exp(115) -> 4696173;
get_exp(116) -> 4743134;
get_exp(117) -> 4790565;
get_exp(118) -> 4838470;
get_exp(119) -> 4886854;
get_exp(120) -> 4935722;
get_exp(121) -> 4985079;
get_exp(122) -> 5034929;
get_exp(123) -> 5085278;
get_exp(124) -> 5136130;
get_exp(125) -> 5187491;
get_exp(126) -> 5239365;
get_exp(127) -> 5291239;
get_exp(128) -> 5343113;
get_exp(129) -> 5394987;
get_exp(130) -> 5446861;
get_exp(131) -> 5498735;
get_exp(132) -> 5550609;
get_exp(133) -> 5602483;
get_exp(134) -> 5654357;
get_exp(135) -> 5706231;
get_exp(136) -> 5758105;
get_exp(137) -> 5809979;
get_exp(138) -> 5861853;
get_exp(139) -> 5913727;
get_exp(140) -> 5965601;
get_exp(141) -> 6017475;
get_exp(142) -> 6069349;
get_exp(143) -> 6121223;
get_exp(144) -> 6173097;
get_exp(145) -> 6224971;
get_exp(146) -> 6276845;
get_exp(147) -> 6328719;
get_exp(148) -> 6380593;
get_exp(149) -> 6432467;
get_exp(150) -> 6484341;
get_exp(_) -> 0.

get_stone(23850) ->
    #{stone_id => 23850,
      attr_names => [{101, 100}, {103, 100}, {104, 100}],
      attr_vals => [{2, 1}, {3, 500}, {4, 300}, {5, 199}]};
get_stone(23851) ->
    #{stone_id => 23851,
      attr_names => [{101, 100}, {103, 100}, {104, 100}],
      attr_vals =>
          [{6, 1}, {7, 250}, {8, 319}, {9, 250}, {10, 180}]};
get_stone(23852) ->
    #{stone_id => 23852,
      attr_names => [{101, 100}, {103, 100}, {104, 100}],
      attr_vals =>
          [{10, 1},
           {11, 200},
           {12, 250},
           {13, 200},
           {14, 199},
           {15, 150}]};
get_stone(23853) ->
    #{stone_id => 23853,
      attr_names => [{102, 100}, {105, 100}],
      attr_vals => [{2, 1}, {3, 500}, {4, 300}, {5, 199}]};
get_stone(23854) ->
    #{stone_id => 23854,
      attr_names => [{102, 100}, {105, 100}],
      attr_vals =>
          [{6, 1}, {7, 250}, {8, 319}, {9, 250}, {10, 180}]};
get_stone(23855) ->
    #{stone_id => 23855,
      attr_names => [{102, 100}, {105, 100}],
      attr_vals =>
          [{10, 1},
           {11, 200},
           {12, 250},
           {13, 200},
           {14, 199},
           {15, 150}]};
get_stone(_) -> false.

get_grade({1001, 1}) -> #{add_apt => 20, hole_num => 3};
get_grade({1001, 2}) -> #{add_apt => 20, hole_num => 3};
get_grade({1002, 1}) -> #{add_apt => 20, hole_num => 3};
get_grade({1002, 2}) -> #{add_apt => 20, hole_num => 3};
get_grade({1003, 1}) -> #{add_apt => 20, hole_num => 3};
get_grade({1003, 2}) -> #{add_apt => 20, hole_num => 3};
get_grade({1004, 1}) -> #{add_apt => 20, hole_num => 3};
get_grade({1004, 2}) -> #{add_apt => 20, hole_num => 3};
get_grade({1005, 1}) -> #{add_apt => 20, hole_num => 3};
get_grade({1005, 2}) -> #{add_apt => 20, hole_num => 3};
get_grade({1006, 1}) -> #{add_apt => 20, hole_num => 3};
get_grade({1006, 2}) -> #{add_apt => 20, hole_num => 3};
get_grade({1007, 1}) -> #{add_apt => 20, hole_num => 3};
get_grade({1007, 2}) -> #{add_apt => 20, hole_num => 3};
get_grade({1008, 1}) -> #{add_apt => 20, hole_num => 3};
get_grade({1008, 2}) -> #{add_apt => 20, hole_num => 3};
get_grade({1009, 1}) -> #{add_apt => 20, hole_num => 3};
get_grade({1009, 2}) -> #{add_apt => 20, hole_num => 3};
get_grade({1010, 1}) -> #{add_apt => 20, hole_num => 3};
get_grade({1010, 2}) -> #{add_apt => 20, hole_num => 3};
get_grade({1011, 1}) -> #{add_apt => 20, hole_num => 3};
get_grade({1011, 2}) -> #{add_apt => 20, hole_num => 3};
get_grade({1012, 1}) -> #{add_apt => 20, hole_num => 3};
get_grade({1012, 2}) -> #{add_apt => 20, hole_num => 3};
get_grade(_) -> false.

allow_stone({1001, 0, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851]};
allow_stone({1001, 0, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854]};
allow_stone({1001, 0, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1001, 1, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1001, 1, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1001, 1, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1001, 2, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1001, 2, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1001, 2, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1001, 3, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1001, 3, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1001, 3, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1002, 0, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851]};
allow_stone({1002, 0, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854]};
allow_stone({1002, 0, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1002, 1, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1002, 1, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1002, 1, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1002, 2, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1002, 2, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1002, 2, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1002, 3, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1002, 3, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1002, 3, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1003, 0, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851]};
allow_stone({1003, 0, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854]};
allow_stone({1003, 0, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1003, 1, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1003, 1, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1003, 1, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1003, 2, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1003, 2, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1003, 2, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1003, 3, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1003, 3, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1003, 3, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1004, 0, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851]};
allow_stone({1004, 0, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854]};
allow_stone({1004, 0, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1004, 1, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1004, 1, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1004, 1, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1004, 2, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1004, 2, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1004, 2, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1004, 3, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1004, 3, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1004, 3, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1005, 0, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851]};
allow_stone({1005, 0, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854]};
allow_stone({1005, 0, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1005, 1, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1005, 1, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1005, 1, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1005, 2, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1005, 2, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1005, 2, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1005, 3, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1005, 3, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1005, 3, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1006, 0, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851]};
allow_stone({1006, 0, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854]};
allow_stone({1006, 0, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1006, 1, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1006, 1, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1006, 1, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1006, 2, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1006, 2, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1006, 2, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1006, 3, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1006, 3, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1006, 3, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1007, 0, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851]};
allow_stone({1007, 0, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854]};
allow_stone({1007, 0, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1007, 1, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1007, 1, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1007, 1, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1007, 2, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1007, 2, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1007, 2, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1007, 3, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1007, 3, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1007, 3, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1008, 0, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851]};
allow_stone({1008, 0, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854]};
allow_stone({1008, 0, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1008, 1, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1008, 1, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1008, 1, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1008, 2, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1008, 2, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1008, 2, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1008, 3, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1008, 3, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1008, 3, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1009, 0, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851]};
allow_stone({1009, 0, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854]};
allow_stone({1009, 0, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1009, 1, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1009, 1, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1009, 1, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1009, 2, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1009, 2, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1009, 2, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1009, 3, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1009, 3, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1009, 3, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1010, 0, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851]};
allow_stone({1010, 0, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854]};
allow_stone({1010, 0, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1010, 1, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1010, 1, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1010, 1, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1010, 2, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1010, 2, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1010, 2, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1010, 3, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1010, 3, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1010, 3, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1011, 0, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851]};
allow_stone({1011, 0, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854]};
allow_stone({1011, 0, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1011, 1, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1011, 1, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1011, 1, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1011, 2, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1011, 2, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1011, 2, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1011, 3, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1011, 3, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1011, 3, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1012, 0, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851]};
allow_stone({1012, 0, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854]};
allow_stone({1012, 0, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1012, 1, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1012, 1, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1012, 1, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1012, 2, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1012, 2, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1012, 2, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone({1012, 3, 1}) ->
    #{need_lev => 1, allow_stone => [23850, 23851, 23852]};
allow_stone({1012, 3, 2}) ->
    #{need_lev => 1, allow_stone => [23853, 23854, 23855]};
allow_stone({1012, 3, 3}) ->
    #{need_lev => 1, allow_stone => [23856, 23857, 23858]};
allow_stone(_) -> false.

get_grade_loss({1001, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{23832, 2}]}];
get_grade_loss({1001, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{23832, 4}]}];
get_grade_loss({1002, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{23832, 2}]}];
get_grade_loss({1002, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{23832, 4}]}];
get_grade_loss({1003, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{23832, 2}]}];
get_grade_loss({1003, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{23832, 4}]}];
get_grade_loss({1004, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{23832, 2}]}];
get_grade_loss({1004, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{23832, 4}]}];
get_grade_loss({1005, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{23832, 2}]}];
get_grade_loss({1005, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{23832, 4}]}];
get_grade_loss({1006, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{23832, 2}]}];
get_grade_loss({1006, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{23832, 4}]}];
get_grade_loss({1007, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{23832, 2}]}];
get_grade_loss({1007, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{23832, 4}]}];
get_grade_loss({1008, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{23832, 2}]}];
get_grade_loss({1008, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{23832, 4}]}];
get_grade_loss({1009, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{23832, 2}]}];
get_grade_loss({1009, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{23832, 4}]}];
get_grade_loss({1010, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{23832, 2}]}];
get_grade_loss({1010, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{23832, 4}]}];
get_grade_loss({1011, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{23832, 2}]}];
get_grade_loss({1011, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{23832, 4}]}];
get_grade_loss({1012, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{23832, 2}]}];
get_grade_loss({1012, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{23832, 4}]}];
get_grade_loss(_Key) -> [].

get_add_apt({1001, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({1001, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({1001, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({1001, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({1001, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({1001, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({1002, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({1002, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({1002, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({1002, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({1002, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({1002, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({1003, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({1003, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({1003, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({1003, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({1003, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({1003, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({1004, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({1004, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({1004, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({1004, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({1004, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({1004, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({1005, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({1005, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({1005, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({1005, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({1005, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({1005, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({1006, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({1006, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({1006, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({1006, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({1006, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({1006, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({1007, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({1007, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({1007, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({1007, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({1007, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({1007, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({1008, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({1008, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({1008, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({1008, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({1008, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({1008, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({1009, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({1009, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({1009, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({1009, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({1009, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({1009, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({1010, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({1010, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({1010, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({1010, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({1010, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({1010, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({1011, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({1011, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({1011, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({1011, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({1011, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({1011, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({1012, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({1012, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({1012, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({1012, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({1012, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({1012, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt(_) -> false.

get_add_max_apt({1001, 2, Used})
    when Used >= 1 andalso Used =< 10 ->
    20;
get_add_max_apt({1001, 3, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1001, 3, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1001, 3, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1001, 1, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1001, 1, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1001, 1, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1001, 4, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1001, 4, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1001, 4, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1001, 5, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1001, 5, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1001, 5, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1002, 2, Used})
    when Used >= 1 andalso Used =< 10 ->
    20;
get_add_max_apt({1002, 3, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1002, 3, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1002, 3, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1002, 1, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1002, 1, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1002, 1, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1002, 4, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1002, 4, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1002, 4, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1002, 5, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1002, 5, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1002, 5, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1003, 2, Used})
    when Used >= 1 andalso Used =< 10 ->
    20;
get_add_max_apt({1003, 3, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1003, 3, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1003, 3, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1003, 1, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1003, 1, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1003, 1, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1003, 4, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1003, 4, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1003, 4, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1003, 5, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1003, 5, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1003, 5, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1004, 2, Used})
    when Used >= 1 andalso Used =< 10 ->
    20;
get_add_max_apt({1004, 3, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1004, 3, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1004, 3, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1004, 1, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1004, 1, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1004, 1, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1004, 4, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1004, 4, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1004, 4, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1004, 5, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1004, 5, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1004, 5, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1005, 2, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1005, 2, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1005, 2, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1005, 3, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1005, 3, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1005, 3, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1005, 1, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1005, 1, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1005, 1, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1005, 4, Used})
    when Used >= 1 andalso Used =< 10 ->
    20;
get_add_max_apt({1005, 5, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1005, 5, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1005, 5, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1006, 2, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1006, 2, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1006, 2, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1006, 3, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1006, 3, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1006, 3, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1006, 1, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1006, 1, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1006, 1, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1006, 4, Used})
    when Used >= 1 andalso Used =< 10 ->
    20;
get_add_max_apt({1006, 5, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1006, 5, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1006, 5, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1007, 2, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1007, 2, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1007, 2, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1007, 3, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1007, 3, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1007, 3, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1007, 1, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1007, 1, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1007, 1, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1007, 4, Used})
    when Used >= 1 andalso Used =< 10 ->
    20;
get_add_max_apt({1007, 5, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1007, 5, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1007, 5, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1008, 2, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1008, 2, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1008, 2, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1008, 3, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1008, 3, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1008, 3, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1008, 1, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1008, 1, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1008, 1, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1008, 4, Used})
    when Used >= 1 andalso Used =< 10 ->
    20;
get_add_max_apt({1008, 5, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1008, 5, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1008, 5, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1009, 2, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1009, 2, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1009, 2, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1009, 3, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1009, 3, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1009, 3, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1009, 1, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1009, 1, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1009, 1, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1009, 4, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1009, 4, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1009, 4, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1009, 5, Used})
    when Used >= 1 andalso Used =< 10 ->
    20;
get_add_max_apt({1010, 2, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1010, 2, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1010, 2, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1010, 3, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1010, 3, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1010, 3, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1010, 1, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1010, 1, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1010, 1, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1010, 4, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1010, 4, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1010, 4, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1010, 5, Used})
    when Used >= 1 andalso Used =< 10 ->
    20;
get_add_max_apt({1011, 2, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1011, 2, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1011, 2, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1011, 3, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1011, 3, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1011, 3, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1011, 1, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1011, 1, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1011, 1, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1011, 4, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1011, 4, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1011, 4, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1011, 5, Used})
    when Used >= 1 andalso Used =< 10 ->
    20;
get_add_max_apt({1012, 2, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1012, 2, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1012, 2, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1012, 3, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1012, 3, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1012, 3, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1012, 1, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1012, 1, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1012, 1, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1012, 4, Used})
    when Used >= 1 andalso Used =< 4 ->
    20;
get_add_max_apt({1012, 4, Used})
    when Used >= 5 andalso Used =< 7 ->
    10;
get_add_max_apt({1012, 4, Used})
    when Used >= 8 andalso Used =< 10 ->
    5;
get_add_max_apt({1012, 5, Used})
    when Used >= 1 andalso Used =< 10 ->
    20;
get_add_max_apt(_) -> false.

get_stage(1) -> #{stage => 1, max_maturity => 1000};
get_stage(2) -> #{stage => 2, max_maturity => 100};
get_stage(3) -> #{stage => 3, max_maturity => 0};
get_stage(_) -> false.

get_growth_type(Val) when Val >= 0 andalso Val =< 39 ->
    2;
get_growth_type(Val) when Val >= 40 andalso Val =< 59 ->
    3;
get_growth_type(Val) when Val >= 60 andalso Val =< 74 ->
    4;
get_growth_type(Val)
    when Val >= 75 andalso Val =< 100 ->
    5;
get_growth_type(_) -> 2.

get_growth_val({Val, 2})
    when Val >= 1 andalso Val =< 89 ->
    950;
get_growth_val({Val, 3})
    when Val >= 1 andalso Val =< 89 ->
    980;
get_growth_val({Val, 4})
    when Val >= 1 andalso Val =< 89 ->
    1020;
get_growth_val({Val, 5})
    when Val >= 1 andalso Val =< 89 ->
    1060;
get_growth_val({Val, 2})
    when Val >= 90 andalso Val =< 200 ->
    1020;
get_growth_val({Val, 3})
    when Val >= 90 andalso Val =< 200 ->
    1050;
get_growth_val({Val, 4})
    when Val >= 90 andalso Val =< 200 ->
    1080;
get_growth_val({Val, 5})
    when Val >= 90 andalso Val =< 200 ->
    1100;
get_growth_val(_) -> false.

get_apt_ratio(Val) when Val >= 1 andalso Val =< 10 ->
    {620, 640};
get_apt_ratio(Val) when Val >= 11 andalso Val =< 11 ->
    {624, 644};
get_apt_ratio(Val) when Val >= 12 andalso Val =< 12 ->
    {628, 648};
get_apt_ratio(Val) when Val >= 13 andalso Val =< 13 ->
    {632, 652};
get_apt_ratio(Val) when Val >= 14 andalso Val =< 14 ->
    {636, 656};
get_apt_ratio(Val) when Val >= 15 andalso Val =< 15 ->
    {640, 660};
get_apt_ratio(Val) when Val >= 16 andalso Val =< 16 ->
    {644, 664};
get_apt_ratio(Val) when Val >= 17 andalso Val =< 17 ->
    {648, 668};
get_apt_ratio(Val) when Val >= 18 andalso Val =< 18 ->
    {652, 672};
get_apt_ratio(Val) when Val >= 19 andalso Val =< 19 ->
    {656, 676};
get_apt_ratio(Val) when Val >= 20 andalso Val =< 20 ->
    {660, 680};
get_apt_ratio(Val) when Val >= 21 andalso Val =< 21 ->
    {664, 684};
get_apt_ratio(Val) when Val >= 22 andalso Val =< 22 ->
    {668, 688};
get_apt_ratio(Val) when Val >= 23 andalso Val =< 23 ->
    {672, 692};
get_apt_ratio(Val) when Val >= 24 andalso Val =< 24 ->
    {676, 696};
get_apt_ratio(Val) when Val >= 25 andalso Val =< 25 ->
    {680, 700};
get_apt_ratio(Val) when Val >= 26 andalso Val =< 26 ->
    {684, 704};
get_apt_ratio(Val) when Val >= 27 andalso Val =< 27 ->
    {688, 708};
get_apt_ratio(Val) when Val >= 28 andalso Val =< 28 ->
    {692, 712};
get_apt_ratio(Val) when Val >= 29 andalso Val =< 29 ->
    {696, 716};
get_apt_ratio(Val) when Val >= 30 andalso Val =< 30 ->
    {700, 720};
get_apt_ratio(Val) when Val >= 31 andalso Val =< 31 ->
    {704, 724};
get_apt_ratio(Val) when Val >= 32 andalso Val =< 32 ->
    {708, 728};
get_apt_ratio(Val) when Val >= 33 andalso Val =< 33 ->
    {712, 732};
get_apt_ratio(Val) when Val >= 34 andalso Val =< 34 ->
    {716, 736};
get_apt_ratio(Val) when Val >= 35 andalso Val =< 35 ->
    {720, 740};
get_apt_ratio(Val) when Val >= 36 andalso Val =< 36 ->
    {724, 744};
get_apt_ratio(Val) when Val >= 37 andalso Val =< 37 ->
    {728, 748};
get_apt_ratio(Val) when Val >= 38 andalso Val =< 38 ->
    {732, 752};
get_apt_ratio(Val) when Val >= 39 andalso Val =< 39 ->
    {736, 756};
get_apt_ratio(Val) when Val >= 40 andalso Val =< 40 ->
    {740, 760};
get_apt_ratio(Val) when Val >= 41 andalso Val =< 41 ->
    {744, 764};
get_apt_ratio(Val) when Val >= 42 andalso Val =< 42 ->
    {748, 768};
get_apt_ratio(Val) when Val >= 43 andalso Val =< 43 ->
    {752, 772};
get_apt_ratio(Val) when Val >= 44 andalso Val =< 44 ->
    {756, 776};
get_apt_ratio(Val) when Val >= 45 andalso Val =< 45 ->
    {760, 780};
get_apt_ratio(Val) when Val >= 46 andalso Val =< 46 ->
    {764, 784};
get_apt_ratio(Val) when Val >= 47 andalso Val =< 47 ->
    {768, 788};
get_apt_ratio(Val) when Val >= 48 andalso Val =< 48 ->
    {772, 792};
get_apt_ratio(Val) when Val >= 49 andalso Val =< 49 ->
    {776, 796};
get_apt_ratio(Val) when Val >= 50 andalso Val =< 50 ->
    {780, 800};
get_apt_ratio(Val) when Val >= 51 andalso Val =< 51 ->
    {784, 804};
get_apt_ratio(Val) when Val >= 52 andalso Val =< 52 ->
    {788, 808};
get_apt_ratio(Val) when Val >= 53 andalso Val =< 53 ->
    {792, 812};
get_apt_ratio(Val) when Val >= 54 andalso Val =< 54 ->
    {796, 816};
get_apt_ratio(Val) when Val >= 55 andalso Val =< 55 ->
    {800, 820};
get_apt_ratio(Val) when Val >= 56 andalso Val =< 56 ->
    {804, 824};
get_apt_ratio(Val) when Val >= 57 andalso Val =< 57 ->
    {808, 828};
get_apt_ratio(Val) when Val >= 58 andalso Val =< 58 ->
    {812, 832};
get_apt_ratio(Val) when Val >= 59 andalso Val =< 59 ->
    {816, 836};
get_apt_ratio(Val) when Val >= 60 andalso Val =< 60 ->
    {820, 840};
get_apt_ratio(Val) when Val >= 61 andalso Val =< 61 ->
    {824, 844};
get_apt_ratio(Val) when Val >= 62 andalso Val =< 62 ->
    {828, 848};
get_apt_ratio(Val) when Val >= 63 andalso Val =< 63 ->
    {832, 852};
get_apt_ratio(Val) when Val >= 64 andalso Val =< 64 ->
    {836, 856};
get_apt_ratio(Val) when Val >= 65 andalso Val =< 65 ->
    {840, 860};
get_apt_ratio(Val) when Val >= 66 andalso Val =< 66 ->
    {844, 864};
get_apt_ratio(Val) when Val >= 67 andalso Val =< 67 ->
    {848, 868};
get_apt_ratio(Val) when Val >= 68 andalso Val =< 68 ->
    {852, 872};
get_apt_ratio(Val) when Val >= 69 andalso Val =< 69 ->
    {856, 876};
get_apt_ratio(Val) when Val >= 70 andalso Val =< 70 ->
    {860, 880};
get_apt_ratio(Val) when Val >= 71 andalso Val =< 71 ->
    {864, 884};
get_apt_ratio(Val) when Val >= 72 andalso Val =< 72 ->
    {868, 888};
get_apt_ratio(Val) when Val >= 73 andalso Val =< 73 ->
    {872, 892};
get_apt_ratio(Val) when Val >= 74 andalso Val =< 74 ->
    {876, 896};
get_apt_ratio(Val) when Val >= 75 andalso Val =< 75 ->
    {880, 900};
get_apt_ratio(Val) when Val >= 76 andalso Val =< 76 ->
    {884, 904};
get_apt_ratio(Val) when Val >= 77 andalso Val =< 77 ->
    {888, 908};
get_apt_ratio(Val) when Val >= 78 andalso Val =< 78 ->
    {892, 912};
get_apt_ratio(Val) when Val >= 79 andalso Val =< 79 ->
    {896, 916};
get_apt_ratio(Val) when Val >= 80 andalso Val =< 80 ->
    {900, 920};
get_apt_ratio(Val) when Val >= 81 andalso Val =< 81 ->
    {904, 924};
get_apt_ratio(Val) when Val >= 82 andalso Val =< 82 ->
    {908, 928};
get_apt_ratio(Val) when Val >= 83 andalso Val =< 83 ->
    {912, 932};
get_apt_ratio(Val) when Val >= 84 andalso Val =< 84 ->
    {916, 936};
get_apt_ratio(Val) when Val >= 85 andalso Val =< 85 ->
    {920, 940};
get_apt_ratio(Val) when Val >= 86 andalso Val =< 86 ->
    {924, 944};
get_apt_ratio(Val) when Val >= 87 andalso Val =< 87 ->
    {928, 948};
get_apt_ratio(Val) when Val >= 88 andalso Val =< 88 ->
    {932, 952};
get_apt_ratio(Val) when Val >= 89 andalso Val =< 89 ->
    {936, 956};
get_apt_ratio(Val) when Val >= 90 andalso Val =< 90 ->
    {940, 960};
get_apt_ratio(Val) when Val >= 91 andalso Val =< 91 ->
    {944, 964};
get_apt_ratio(Val) when Val >= 92 andalso Val =< 92 ->
    {948, 968};
get_apt_ratio(Val) when Val >= 93 andalso Val =< 93 ->
    {952, 972};
get_apt_ratio(Val) when Val >= 94 andalso Val =< 94 ->
    {956, 976};
get_apt_ratio(Val) when Val >= 95 andalso Val =< 95 ->
    {960, 980};
get_apt_ratio(Val) when Val >= 96 andalso Val =< 96 ->
    {964, 984};
get_apt_ratio(Val) when Val >= 97 andalso Val =< 97 ->
    {968, 988};
get_apt_ratio(Val) when Val >= 98 andalso Val =< 98 ->
    {972, 992};
get_apt_ratio(Val) when Val >= 99 andalso Val =< 99 ->
    {976, 996};
get_apt_ratio(Val) when Val >= 100 andalso Val =< 100 ->
    {980, 1000};
get_apt_ratio(_) -> {900, 900}.

get_pregnant_rate(Fertility) when Fertility >= 1000 ->
    100;
get_pregnant_rate(_) -> 0.

allow_skills() ->
    [60001,
     60002,
     60003,
     60005,
     60026,
     60027,
     60028,
     60029,
     60030,
     60031,
     60032,
     60033,
     60034,
     60035,
     60036,
     60038,
     60040,
     60042,
     60043,
     60044,
     60045,
     60046,
     60047,
     60048,
     60049,
     60050,
     60051,
     60052,
     60053,
     60054,
     60055,
     60056,
     60057,
     60058,
     60059,
     60060,
     60061,
     60062,
     60064,
     60076,
     60078,
     60079,
     60080,
     60081,
     60082,
     60083,
     60021,
     60022,
     60101,
     60102,
     60103,
     60105,
     60126,
     60127,
     60128,
     60129,
     60130,
     60131,
     60132,
     60133,
     60134,
     60135,
     60136,
     60138,
     60140,
     60142,
     60143,
     60144,
     60145,
     60146,
     60147,
     60148,
     60149,
     60150,
     60151,
     60152,
     60153,
     60154,
     60155,
     60156,
     60157,
     60158,
     60159,
     60160,
     60161,
     60162,
     60164,
     60166,
     60168,
     60169,
     60170,
     60171,
     60172,
     60121,
     60122].

get_study({5, 1}) ->
    #{name => lang:get("以德服人"), val => 2, day_limit => 2,
      study_time => 7200,
      study_loss => [{90006, 300}, {90000, 200000}]};
get_study({5, 2}) ->
    #{name => lang:get("金钟罩"), val => 5, day_limit => 100,
      study_time => 0, study_loss => [{23819, 1}]};
get_study({4, 1}) ->
    #{name => lang:get("智力养成"), val => 2, day_limit => 2,
      study_time => 7200,
      study_loss => [{90006, 300}, {90000, 200000}]};
get_study({4, 2}) ->
    #{name => lang:get("羊皮卷"), val => 5, day_limit => 100,
      study_time => 0, study_loss => [{23820, 1}]};
get_study({2, 1}) ->
    #{name => lang:get("体能锻炼"), val => 2, day_limit => 2,
      study_time => 7200,
      study_loss => [{90006, 300}, {90000, 200000}]};
get_study({2, 2}) ->
    #{name => lang:get("千年雪莲"), val => 5, day_limit => 100,
      study_time => 0, study_loss => [{23821, 1}]};
get_study({3, 1}) ->
    #{name => lang:get("敏捷训练"), val => 2, day_limit => 2,
      study_time => 7200,
      study_loss => [{90006, 300}, {90000, 200000}]};
get_study({3, 2}) ->
    #{name => lang:get("闪电手"), val => 5, day_limit => 100,
      study_time => 0, study_loss => [{23822, 1}]};
get_study({1, 1}) ->
    #{name => lang:get("力量提升"), val => 2, day_limit => 2,
      study_time => 7200,
      study_loss => [{90006, 300}, {90000, 200000}]};
get_study({1, 2}) ->
    #{name => lang:get("桃木剑"), val => 5, day_limit => 100,
      study_time => 0, study_loss => [{23823, 1}]};
get_study(_) -> false.

get_base_id({1, 1}) -> 1001;
get_base_id({1, 0}) -> 1002;
get_base_id({3, 1}) -> 1003;
get_base_id({3, 0}) -> 1004;
get_base_id({2, 1}) -> 1005;
get_base_id({2, 0}) -> 1006;
get_base_id({6, 1}) -> 1007;
get_base_id({6, 0}) -> 1008;
get_base_id({4, 1}) -> 1009;
get_base_id({4, 0}) -> 1010;
get_base_id({5, 1}) -> 1011;
get_base_id({5, 0}) -> 1012;
get_base_id(_) -> false.

get_combat_maturity(10002) -> {200, 1000, 2};
get_combat_maturity(10001) -> {100, 1000, 1};
get_combat_maturity(10000) -> {1, 500, 30};
get_combat_maturity(13) -> {1, 1000, 10};
get_combat_maturity(3) -> {1, 400, 60};
get_combat_maturity(_) -> false.

get_skill_intimacy(60001) -> 3;
get_skill_intimacy(60002) -> 1;
get_skill_intimacy(60003) -> 3;
get_skill_intimacy(60005) -> 2;
get_skill_intimacy(60026) -> 3;
get_skill_intimacy(60027) -> 3;
get_skill_intimacy(60028) -> 1;
get_skill_intimacy(60029) -> 4;
get_skill_intimacy(60030) -> 2;
get_skill_intimacy(60031) -> 2;
get_skill_intimacy(60032) -> 2;
get_skill_intimacy(60033) -> 1;
get_skill_intimacy(60034) -> 1;
get_skill_intimacy(60035) -> 2;
get_skill_intimacy(60036) -> 4;
get_skill_intimacy(60038) -> 3;
get_skill_intimacy(60040) -> 8;
get_skill_intimacy(60042) -> 8;
get_skill_intimacy(60043) -> 3;
get_skill_intimacy(60044) -> 1;
get_skill_intimacy(60045) -> 1;
get_skill_intimacy(60046) -> 1;
get_skill_intimacy(60047) -> 1;
get_skill_intimacy(60048) -> 1;
get_skill_intimacy(60049) -> 1;
get_skill_intimacy(60050) -> 1;
get_skill_intimacy(60051) -> 3;
get_skill_intimacy(60052) -> 2;
get_skill_intimacy(60053) -> 1;
get_skill_intimacy(60054) -> 1;
get_skill_intimacy(60055) -> 1;
get_skill_intimacy(60056) -> 1;
get_skill_intimacy(60057) -> 1;
get_skill_intimacy(60058) -> 1;
get_skill_intimacy(60059) -> 2;
get_skill_intimacy(60060) -> 1;
get_skill_intimacy(60061) -> 1;
get_skill_intimacy(60062) -> 1;
get_skill_intimacy(60064) -> 2;
get_skill_intimacy(60076) -> 3;
get_skill_intimacy(60078) -> 1;
get_skill_intimacy(60079) -> 3;
get_skill_intimacy(60080) -> 2;
get_skill_intimacy(60081) -> 3;
get_skill_intimacy(60082) -> 3;
get_skill_intimacy(60083) -> 3;
get_skill_intimacy(60021) -> 3;
get_skill_intimacy(60022) -> 3;
get_skill_intimacy(60101) -> 27;
get_skill_intimacy(60102) -> 10;
get_skill_intimacy(60103) -> 24;
get_skill_intimacy(60105) -> 20;
get_skill_intimacy(60126) -> 22;
get_skill_intimacy(60127) -> 24;
get_skill_intimacy(60128) -> 6;
get_skill_intimacy(60129) -> 34;
get_skill_intimacy(60130) -> 19;
get_skill_intimacy(60131) -> 19;
get_skill_intimacy(60132) -> 12;
get_skill_intimacy(60133) -> 4;
get_skill_intimacy(60134) -> 6;
get_skill_intimacy(60135) -> 12;
get_skill_intimacy(60136) -> 31;
get_skill_intimacy(60138) -> 24;
get_skill_intimacy(60140) -> 47;
get_skill_intimacy(60142) -> 47;
get_skill_intimacy(60143) -> 24;
get_skill_intimacy(60144) -> 4;
get_skill_intimacy(60145) -> 4;
get_skill_intimacy(60146) -> 4;
get_skill_intimacy(60147) -> 4;
get_skill_intimacy(60148) -> 6;
get_skill_intimacy(60149) -> 6;
get_skill_intimacy(60150) -> 6;
get_skill_intimacy(60151) -> 24;
get_skill_intimacy(60152) -> 11;
get_skill_intimacy(60153) -> 9;
get_skill_intimacy(60154) -> 8;
get_skill_intimacy(60155) -> 4;
get_skill_intimacy(60156) -> 8;
get_skill_intimacy(60157) -> 4;
get_skill_intimacy(60158) -> 4;
get_skill_intimacy(60159) -> 18;
get_skill_intimacy(60160) -> 4;
get_skill_intimacy(60161) -> 4;
get_skill_intimacy(60162) -> 4;
get_skill_intimacy(60164) -> 12;
get_skill_intimacy(60166) -> 15;
get_skill_intimacy(60168) -> 8;
get_skill_intimacy(60169) -> 10;
get_skill_intimacy(60170) -> 10;
get_skill_intimacy(60171) -> 24;
get_skill_intimacy(60172) -> 24;
get_skill_intimacy(60121) -> 11;
get_skill_intimacy(60122) -> 11;
get_skill_intimacy(_) -> 0.

get_grade_growth({1001, 1}) -> 30;
get_grade_growth({1001, 2}) -> 60;
get_grade_growth({1002, 1}) -> 30;
get_grade_growth({1002, 2}) -> 60;
get_grade_growth({1003, 1}) -> 30;
get_grade_growth({1003, 2}) -> 60;
get_grade_growth({1004, 1}) -> 30;
get_grade_growth({1004, 2}) -> 60;
get_grade_growth({1005, 1}) -> 30;
get_grade_growth({1005, 2}) -> 60;
get_grade_growth({1006, 1}) -> 30;
get_grade_growth({1006, 2}) -> 60;
get_grade_growth({1007, 1}) -> 30;
get_grade_growth({1007, 2}) -> 60;
get_grade_growth({1008, 1}) -> 30;
get_grade_growth({1008, 2}) -> 60;
get_grade_growth({1009, 1}) -> 30;
get_grade_growth({1009, 2}) -> 60;
get_grade_growth({1010, 1}) -> 30;
get_grade_growth({1010, 2}) -> 60;
get_grade_growth({1011, 1}) -> 30;
get_grade_growth({1011, 2}) -> 60;
get_grade_growth({1012, 1}) -> 30;
get_grade_growth({1012, 2}) -> 60;
get_grade_growth(_) -> 0.

child_talk(1001) ->
    #{show => lang:get("轮到我登场啦{face_1,38}"),
      show_rate => 100,
      atk => lang:get("一击必中，从不骄傲{face_1,36}"), atk_rate => 10,
      dfd => lang:get("打不痛{face_1,41}"), dfd_rate => 20,
      dead => lang:get("宝宝要休息了{face_1,8}"), dead_rate => 20,
      master_dead => "", master_dead_rate => 20, use => "",
      use_rate => 20, escape => lang:get("好怕怕{face_1,46}"),
      escape_rate => 100};
child_talk(1002) ->
    #{show => lang:get("轮到我登场啦{face_1,38}"),
      show_rate => 100,
      atk => lang:get("一击必中，从不骄傲{face_1,36}"), atk_rate => 10,
      dfd => lang:get("打不痛{face_1,41}"), dfd_rate => 20,
      dead => lang:get("宝宝要休息了{face_1,8}"), dead_rate => 20,
      master_dead => "", master_dead_rate => 20, use => "",
      use_rate => 20, escape => lang:get("好怕怕{face_1,46}"),
      escape_rate => 100};
child_talk(1003) ->
    #{show => lang:get("轮到我登场啦{face_1,38}"),
      show_rate => 100,
      atk => lang:get("一击必中，从不骄傲{face_1,36}"), atk_rate => 10,
      dfd => lang:get("打不痛{face_1,41}"), dfd_rate => 20,
      dead => lang:get("宝宝要休息了{face_1,8}"), dead_rate => 20,
      master_dead => "", master_dead_rate => 20, use => "",
      use_rate => 20, escape => lang:get("好怕怕{face_1,46}"),
      escape_rate => 100};
child_talk(1004) ->
    #{show => lang:get("轮到我登场啦{face_1,38}"),
      show_rate => 100,
      atk => lang:get("一击必中，从不骄傲{face_1,36}"), atk_rate => 10,
      dfd => lang:get("打不痛{face_1,41}"), dfd_rate => 20,
      dead => lang:get("宝宝要休息了{face_1,8}"), dead_rate => 20,
      master_dead => "", master_dead_rate => 20, use => "",
      use_rate => 20, escape => lang:get("好怕怕{face_1,46}"),
      escape_rate => 100};
child_talk(1005) ->
    #{show => lang:get("轮到我登场啦{face_1,38}"),
      show_rate => 100,
      atk => lang:get("我新学的魔法，厉害吧{face_1,57}"),
      atk_rate => 10, dfd => lang:get("打不痛{face_1,41}"),
      dfd_rate => 20, dead => lang:get("宝宝要休息了{face_1,8}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("好怕怕{face_1,46}"),
      escape_rate => 100};
child_talk(1006) ->
    #{show => lang:get("轮到我登场啦{face_1,38}"),
      show_rate => 100,
      atk => lang:get("我新学的魔法，厉害吧{face_1,57}"),
      atk_rate => 10, dfd => lang:get("打不痛{face_1,41}"),
      dfd_rate => 20, dead => lang:get("宝宝要休息了{face_1,8}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("好怕怕{face_1,46}"),
      escape_rate => 100};
child_talk(1007) ->
    #{show => lang:get("轮到我登场啦{face_1,38}"),
      show_rate => 100,
      atk => lang:get("我新学的魔法，厉害吧{face_1,57}"),
      atk_rate => 10, dfd => lang:get("打不痛{face_1,41}"),
      dfd_rate => 20, dead => lang:get("宝宝要休息了{face_1,8}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("好怕怕{face_1,46}"),
      escape_rate => 100};
child_talk(1008) ->
    #{show => lang:get("轮到我登场啦{face_1,38}"),
      show_rate => 100,
      atk => lang:get("我新学的魔法，厉害吧{face_1,57}"),
      atk_rate => 10, dfd => lang:get("打不痛{face_1,41}"),
      dfd_rate => 20, dead => lang:get("宝宝要休息了{face_1,8}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("好怕怕{face_1,46}"),
      escape_rate => 100};
child_talk(1009) ->
    #{show => lang:get("轮到我登场啦{face_1,38}"),
      show_rate => 100,
      atk => lang:get("粑粑麻麻由我来保护{face_1,56}"), atk_rate => 10,
      dfd => lang:get("打不痛{face_1,41}"), dfd_rate => 20,
      dead => lang:get("宝宝要休息了{face_1,8}"), dead_rate => 20,
      master_dead => "", master_dead_rate => 20, use => "",
      use_rate => 20, escape => lang:get("好怕怕{face_1,46}"),
      escape_rate => 100};
child_talk(1010) ->
    #{show => lang:get("轮到我登场啦{face_1,38}"),
      show_rate => 100,
      atk => lang:get("粑粑麻麻由我来保护{face_1,56}"), atk_rate => 10,
      dfd => lang:get("打不痛{face_1,41}"), dfd_rate => 20,
      dead => lang:get("宝宝要休息了{face_1,8}"), dead_rate => 20,
      master_dead => "", master_dead_rate => 20, use => "",
      use_rate => 20, escape => lang:get("好怕怕{face_1,46}"),
      escape_rate => 100};
child_talk(1011) ->
    #{show => lang:get("轮到我登场啦{face_1,38}"),
      show_rate => 100,
      atk => lang:get("粑粑麻麻由我来保护{face_1,56}"), atk_rate => 10,
      dfd => lang:get("打不痛{face_1,41}"), dfd_rate => 20,
      dead => lang:get("宝宝要休息了{face_1,8}"), dead_rate => 20,
      master_dead => "", master_dead_rate => 20, use => "",
      use_rate => 20, escape => lang:get("好怕怕{face_1,46}"),
      escape_rate => 100};
child_talk(1012) ->
    #{show => lang:get("轮到我登场啦{face_1,38}"),
      show_rate => 100,
      atk => lang:get("粑粑麻麻由我来保护{face_1,56}"), atk_rate => 10,
      dfd => lang:get("打不痛{face_1,41}"), dfd_rate => 20,
      dead => lang:get("宝宝要休息了{face_1,8}"), dead_rate => 20,
      master_dead => "", master_dead_rate => 20, use => "",
      use_rate => 20, escape => lang:get("好怕怕{face_1,46}"),
      escape_rate => 100};
child_talk(_) -> false.

get_combat_happiness(1) -> {1, 1000};
get_combat_happiness(2) -> {1, 1000};
get_combat_happiness(4) -> {1, 1000};
get_combat_happiness(5) -> {1, 1000};
get_combat_happiness(8) -> {1, 1000};
get_combat_happiness(9) -> {1, 1000};
get_combat_happiness(10) -> {1, 1000};
get_combat_happiness(11) -> {1, 1000};
get_combat_happiness(13) -> {1, 1000};
get_combat_happiness(14) -> {1, 1000};
get_combat_happiness(15) -> {1, 1000};
get_combat_happiness(16) -> {1, 1000};
get_combat_happiness(17) -> {1, 1000};
get_combat_happiness(20) -> {1, 1000};
get_combat_happiness(19) -> {1, 1000};
get_combat_happiness(21) -> {1, 1000};
get_combat_happiness(22) -> {1, 1000};
get_combat_happiness(40) -> {3, 1000};
get_combat_happiness(100) -> {1, 1000};
get_combat_happiness(102) -> {1, 1000};
get_combat_happiness(103) -> {1, 1000};
get_combat_happiness(104) -> {2, 1000};
get_combat_happiness(105) -> {2, 1000};
get_combat_happiness(113) -> {3, 1000};
get_combat_happiness(_) -> {0, 0}.

get_happiness(H) when H >= 0 andalso H =< 19 ->
    {[{62300, -5}, {62400, -5}, {62500, -5}], 1, 500};
get_happiness(H) when H >= 20 andalso H =< 39 ->
    {[{62300, -3}, {62400, -3}, {62500, -3}], 0, 1000};
get_happiness(H) when H >= 40 andalso H =< 59 ->
    {[{62300, -1}, {62400, -1}, {62500, -1}], 0, 1000};
get_happiness(H) when H >= 60 andalso H =< 79 ->
    {[{62300, 1}, {62400, 0}, {62500, 0}], 0, 1000};
get_happiness(H) when H >= 80 andalso H =< 100 ->
    {[{62300, 1}, {62400, 1}, {62500, 1}], 0, 1000};
get_happiness(_) -> false.

get_child_spirit() -> {80, 0}.

get_skin(1) ->
    #{skin_id => 1, skin_name => lang:get("熊孩子"), sex => 1,
      texture => 41023, animation_id => 4102301,
      model_id => 41023, phy_aptitude => 20,
      pdef_aptitude => 20, hp_aptitude => 20,
      magic_aptitude => 20, aspd_aptitude => 20, growth => 25,
      cost => [{70056, 1}], duration => 30};
get_skin(2) ->
    #{skin_id => 2, skin_name => lang:get("小恐龙"), sex => 1,
      texture => 41022, animation_id => 4102201,
      model_id => 41022, phy_aptitude => 20,
      pdef_aptitude => 20, hp_aptitude => 20,
      magic_aptitude => 20, aspd_aptitude => 20, growth => 25,
      cost => [{70056, 1}], duration => 30};
get_skin(3) ->
    #{skin_id => 3, skin_name => lang:get("大鲨鱼"), sex => 1,
      texture => 41024, animation_id => 4102401,
      model_id => 41024, phy_aptitude => 20,
      pdef_aptitude => 20, hp_aptitude => 20,
      magic_aptitude => 20, aspd_aptitude => 20, growth => 25,
      cost => [{70059, 1}], duration => 30};
get_skin(4) ->
    #{skin_id => 4, skin_name => lang:get("美羊羊"), sex => 0,
      texture => 41027, animation_id => 4102701,
      model_id => 41027, phy_aptitude => 20,
      pdef_aptitude => 20, hp_aptitude => 20,
      magic_aptitude => 20, aspd_aptitude => 20, growth => 25,
      cost => [{70056, 1}], duration => 30};
get_skin(5) ->
    #{skin_id => 5, skin_name => lang:get("猫小喵"), sex => 0,
      texture => 41026, animation_id => 4102601,
      model_id => 41026, phy_aptitude => 20,
      pdef_aptitude => 20, hp_aptitude => 20,
      magic_aptitude => 20, aspd_aptitude => 20, growth => 25,
      cost => [{70056, 1}], duration => 30};
get_skin(6) ->
    #{skin_id => 6, skin_name => lang:get("萌小兔"), sex => 0,
      texture => 41025, animation_id => 4102501,
      model_id => 41025, phy_aptitude => 20,
      pdef_aptitude => 20, hp_aptitude => 20,
      magic_aptitude => 20, aspd_aptitude => 20, growth => 25,
      cost => [{70060, 1}], duration => 30};
get_skin(_) -> flase.

